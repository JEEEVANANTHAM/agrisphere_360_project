import { Users, Map, Sparkles, CheckCircle } from 'lucide-react'

const stats = [
  { label: 'Total Farmers', value: '1,245', icon: Users, color: '#3b82f6', bg: '#dbeafe' },
  { label: 'Active Farms', value: '3,890', icon: Map, color: '#16a34a', bg: '#dcfce7' },
  { label: 'AI Reports', value: '452', icon: Sparkles, color: '#8b5cf6', bg: '#ede9fe' },
  { label: 'System Health', value: '99.9%', icon: CheckCircle, color: '#14b8a6', bg: '#ccfbf1' },
]

const alerts = [
  {
    title: 'Pest Outbreak: Northern Region',
    desc: 'High incidence of Locusts reported by 45 users.',
    priority: 'High Priority',
    badgeClass: 'badge-danger',
  },
  {
    title: 'Database Health',
    desc: 'Firestore read/write latency is within 150ms.',
    priority: 'Normal',
    badgeClass: 'badge-success',
  },
  {
    title: 'AI Model Update',
    desc: 'Gemini model v2.5 deployed successfully.',
    priority: 'Info',
    badgeClass: 'badge-info',
  },
]

export default function AdminPage() {
  return (
    <div className="slide-up">
      {/* Stats */}
      <div className="admin-stats">
        {stats.map(s => (
          <div className="admin-stat" key={s.label}>
            <div className="a-icon" style={{ background: s.bg, color: s.color }}>
              <s.icon size={24} />
            </div>
            <div className="a-value">{s.value}</div>
            <div className="a-label">{s.label}</div>
          </div>
        ))}
      </div>

      {/* System Alerts */}
      <div className="section-header">
        <h2>System Alerts</h2>
      </div>
      <div className="system-alerts">
        {alerts.map(a => (
          <div className="system-alert" key={a.title}>
            <div className="sa-info">
              <h4>{a.title}</h4>
              <p>{a.desc}</p>
            </div>
            <span className={`badge ${a.badgeClass}`}>{a.priority}</span>
          </div>
        ))}
      </div>
    </div>
  )
}
