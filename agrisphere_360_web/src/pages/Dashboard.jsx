import { useState, useRef } from 'react'
import { useNavigate } from 'react-router-dom'
import {
  Sun, Camera, Droplets, Bug, Package,
  AlertTriangle, Info, ChevronRight, TrendingUp, X
} from 'lucide-react'

const stats = [
  { label: 'Total Farms', value: '12', trend: '+3 this month', up: true, color: '#3b82f6', bg: '#dbeafe' },
  { label: 'Crop Health', value: '87%', trend: '+5.2%', up: true, color: '#16a34a', bg: '#dcfce7' },
  { label: 'AI Reports', value: '24', trend: 'New: 3', up: true, color: '#8b5cf6', bg: '#ede9fe' },
  { label: 'Revenue', value: '₹1.2L', trend: '+12%', up: true, color: '#f59e0b', bg: '#fef3c7' },
]

const quickActions = [
  { id: 'scan', icon: Camera, label: 'Scan', color: '#3b82f6', bg: '#dbeafe', path: null },
  { id: 'irrigate', icon: Droplets, label: 'Irrigate', color: '#06b6d4', bg: '#cffafe', path: '/farms' },
  { id: 'pests', icon: Bug, label: 'Pests', color: '#ef4444', bg: '#fee2e2', path: '/advisory' },
  { id: 'stock', icon: Package, label: 'Stock', color: '#f59e0b', bg: '#fef3c7', path: '/inventory' },
]

const alerts = [
  { id: 1, icon: AlertTriangle, title: 'Pest Outbreak Alert', desc: 'High risk of Aphids in Sector B', color: '#ef4444', bg: '#fee2e2', link: '/advisory' },
  { id: 2, icon: Info, title: 'Rain Predicted', desc: 'Expect 12mm rain tomorrow morning', color: '#f59e0b', bg: '#fef3c7', link: null },
]

export default function Dashboard() {
  const navigate = useNavigate()
  const [showCamera, setShowCamera] = useState(false)
  const videoRef = useRef(null)

  const handleActionClick = async (action) => {
    if (action.id === 'scan') {
      setShowCamera(true)
      try {
        const stream = await navigator.mediaDevices.getUserMedia({ video: { facingMode: 'environment' } })
        if (videoRef.current) {
          videoRef.current.srcObject = stream
        }
      } catch (err) {
        console.error("Error accessing camera:", err)
        alert("Camera access denied or unavailable.")
      }
    } else if (action.path) {
      navigate(action.path)
    }
  }

  const closeCamera = () => {
    if (videoRef.current && videoRef.current.srcObject) {
      const tracks = videoRef.current.srcObject.getTracks()
      tracks.forEach(track => track.stop())
    }
    setShowCamera(false)
  }

  const handleAlertClick = (alertItem) => {
    if (alertItem.link) {
      navigate(alertItem.link)
    } else {
      alert(`Alert Details:\n${alertItem.title}\n${alertItem.desc}`)
    }
  }

  return (
    <div className="slide-up">
      {/* Stats */}
      <div className="stats-grid" style={{ marginBottom: 28 }}>
        {stats.map(s => (
          <div className="stat-card" key={s.label}>
            <div className="stat-icon" style={{ background: s.bg, color: s.color }}>
              <TrendingUp size={22} />
            </div>
            <div className="stat-info">
              <h3>{s.value}</h3>
              <p>{s.label}</p>
              <span className={`stat-trend ${s.up ? 'up' : 'down'}`}>
                {s.up ? '↑' : '↓'} {s.trend}
              </span>
            </div>
          </div>
        ))}
      </div>

      {/* Weather */}
      <div className="weather-card" style={{ marginBottom: 28 }}>
        <div>
          <div className="weather-desc">Mostly Sunny</div>
          <div style={{ display: 'flex', alignItems: 'center', gap: 12 }}>
            <span className="weather-temp">28°C</span>
            <Sun size={28} color="#f59e0b" />
          </div>
          <div className="weather-meta">Humidity: 45% | Wind: 12km/h</div>
        </div>
        <button className="btn btn-primary" onClick={() => alert("Detailed weather forecast coming soon!")}>Detail</button>
      </div>

      {/* Quick Actions */}
      <div className="section-header">
        <h2>Quick Actions</h2>
      </div>
      <div className="quick-actions" style={{ marginBottom: 28 }}>
        {quickActions.map(a => (
          <div 
            className="action-item" 
            key={a.label} 
            onClick={() => handleActionClick(a)}
            style={{ cursor: 'pointer' }}
          >
            <div className="action-icon" style={{ background: a.bg, color: a.color }}>
              <a.icon size={24} />
            </div>
            <span>{a.label}</span>
          </div>
        ))}
      </div>

      {/* Crop Health Map */}
      <div className="section-header">
        <h2>Crop Health (Satellite)</h2>
      </div>
      <div className="health-map" onClick={() => navigate('/farms')} style={{ marginBottom: 28, cursor: 'pointer' }}>
        <div className="map-grid">
          {Array.from({ length: 24 }).map((_, i) => (
            <div className="map-cell" key={i} />
          ))}
        </div>
        <div className="map-overlay">
          <span style={{ width: 10, height: 10, borderRadius: '50%', background: '#16a34a', display: 'inline-block' }} />
          Farm A — Healthy
        </div>
      </div>

      {/* Alerts */}
      <div className="section-header">
        <h2>Recent Alerts</h2>
        <button className="view-all" onClick={() => alert("All alerts view coming soon!")}>View All</button>
      </div>
      <div className="alert-list">
        {alerts.map(a => (
          <div 
            className="alert-item" 
            key={a.title} 
            onClick={() => handleAlertClick(a)}
            style={{ cursor: 'pointer' }}
          >
            <div className="alert-dot" style={{ background: a.bg, color: a.color }}>
              <a.icon size={20} />
            </div>
            <div className="alert-content">
              <h4>{a.title}</h4>
              <p>{a.desc}</p>
            </div>
            <ChevronRight size={18} color="#9ca3af" />
          </div>
        ))}
      </div>

      {/* Camera Modal */}
      {showCamera && (
        <div className="modal-overlay" onClick={closeCamera}>
          <div className="modal-content" onClick={e => e.stopPropagation()} style={{ padding: 16 }}>
            <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: 16 }}>
              <h3>Scan Crop for Diseases</h3>
              <button className="btn-ghost" onClick={closeCamera} style={{ padding: 4 }}>
                <X size={20} />
              </button>
            </div>
            <div style={{ background: '#000', borderRadius: 12, overflow: 'hidden', height: 300, position: 'relative' }}>
              <video 
                ref={videoRef} 
                autoPlay 
                playsInline 
                muted 
                style={{ width: '100%', height: '100%', objectFit: 'cover' }} 
              />
              <div style={{ position: 'absolute', bottom: 16, left: 0, width: '100%', textAlign: 'center' }}>
                <button className="btn btn-primary" onClick={() => alert("AI scanning... No disease detected!")}>Capture & Analyze</button>
              </div>
            </div>
          </div>
        </div>
      )}
    </div>
  )
}
