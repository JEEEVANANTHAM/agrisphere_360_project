import { useState } from 'react'
import { Brain, FlaskConical, AlertTriangle, Bug, ChevronRight, Sparkles, X } from 'lucide-react'

const sections = [
  {
    title: 'Crop Nutrition',
    items: [
      { title: 'Apply NPK 19:19:19', timing: 'Next 3 days', icon: FlaskConical },
      { title: 'Zinc Deficiency Alert', timing: 'Immediate', icon: AlertTriangle },
    ],
  },
  {
    title: 'Pest Management',
    items: [
      { title: 'Aphid Risk: High', timing: 'Monitor Sector B', icon: Bug },
    ],
  },
]

export default function AdvisoryPage() {
  const [showModal, setShowModal] = useState(false)
  const [prompt, setPrompt] = useState('')
  const [response, setResponse] = useState('')
  const [loading, setLoading] = useState(false)

  const handleAsk = async () => {
    if (!prompt.trim()) return
    setLoading(true)
    setResponse('')

    // Simulated AI response (replace with real Gemini API call)
    setTimeout(() => {
      setResponse(
        `Based on your query about "${prompt}":\n\n` +
        `1. **Soil Analysis**: Ensure regular soil testing every 6 months to monitor nutrient levels.\n\n` +
        `2. **Recommended Action**: Apply organic compost at 2 tonnes/hectare before the next planting season.\n\n` +
        `3. **Preventive Measure**: Introduce companion planting with marigolds to naturally repel pests.\n\n` +
        `4. **Water Management**: Switch to drip irrigation to reduce water consumption by 40%.`
      )
      setLoading(false)
    }, 1500)
  }

  return (
    <div className="slide-up">
      {/* Hero */}
      <div className="advisory-hero">
        <div className="hero-icon">
          <Brain size={32} color="#fff" />
        </div>
        <div>
          <h2>Personalized Insights</h2>
          <p>Get AI-driven tips for your specific soil and weather conditions.</p>
        </div>
      </div>

      {/* Advisory Sections */}
      {sections.map(section => (
        <div key={section.title} style={{ marginBottom: 28 }}>
          <div className="section-header">
            <h2>{section.title}</h2>
          </div>
          <div className="advisory-cards">
            {section.items.map(item => (
              <div className="advisory-card" key={item.title}>
                <div className="card-icon">
                  <item.icon size={20} />
                </div>
                <div style={{ flex: 1 }}>
                  <h4>{item.title}</h4>
                  <p>Recommended: {item.timing}</p>
                </div>
                <ChevronRight size={16} color="#9ca3af" />
              </div>
            ))}
          </div>
        </div>
      ))}

      {/* FAB */}
      <button className="fab" onClick={() => setShowModal(true)} id="ask-gemini-btn">
        <Sparkles size={20} />
        Ask Gemini
      </button>

      {/* Modal */}
      {showModal && (
        <div className="modal-overlay" onClick={() => setShowModal(false)}>
          <div className="modal-content" onClick={e => e.stopPropagation()}>
            <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
              <h3>🤖 Ask Gemini AI</h3>
              <button className="btn-ghost" onClick={() => setShowModal(false)} style={{ padding: 4 }}>
                <X size={20} />
              </button>
            </div>
            <textarea
              placeholder="e.g., How to treat leaf rust in wheat?"
              value={prompt}
              onChange={e => setPrompt(e.target.value)}
            />
            <div className="modal-actions">
              <button className="btn btn-ghost" onClick={() => setShowModal(false)}>Cancel</button>
              <button className="btn btn-primary" onClick={handleAsk} disabled={loading}>
                {loading ? 'Thinking...' : 'Ask'}
              </button>
            </div>

            {loading && (
              <div className="ai-loading">
                <div className="spinner" />
                Gemini is thinking...
              </div>
            )}

            {response && (
              <div className="ai-response">{response}</div>
            )}
          </div>
        </div>
      )}
    </div>
  )
}
