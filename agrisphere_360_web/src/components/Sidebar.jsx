import { NavLink } from 'react-router-dom'
import {
  LayoutDashboard, MapPin, Brain, TrendingUp,
  DollarSign, Package, User, ShieldCheck, Leaf, Settings
} from 'lucide-react'
import { useUser } from '../context/UserContext'

const mainNav = [
  { to: '/', icon: LayoutDashboard, label: 'Dashboard' },
  { to: '/farms', icon: MapPin, label: 'Farms' },
  { to: '/advisory', icon: Brain, label: 'AI Advisory' },
  { to: '/market', icon: TrendingUp, label: 'Market' },
]

const businessNav = [
  { to: '/financial', icon: DollarSign, label: 'Financial' },
  { to: '/inventory', icon: Package, label: 'Inventory' },
  { to: '/profile', icon: User, label: 'Profile' },
  { to: '/admin', icon: ShieldCheck, label: 'Admin' },
]

export default function Sidebar({ open, onClose }) {
  const { user } = useUser()

  return (
    <aside className={`sidebar ${open ? 'open' : ''}`}>
      <div className="sidebar-brand">
        <div className="brand-icon"><Leaf size={22} /></div>
        <div>
          <h2>AgriSphere</h2>
          <span>360 Platform</span>
        </div>
      </div>

      <nav className="sidebar-nav">
        <div className="nav-label">Main</div>
        {mainNav.map(item => (
          <NavLink
            key={item.to}
            to={item.to}
            end={item.to === '/'}
            className={({ isActive }) => `nav-item ${isActive ? 'active' : ''}`}
            onClick={onClose}
          >
            <item.icon size={18} />
            {item.label}
          </NavLink>
        ))}

        <div className="nav-label">Business</div>
        {businessNav.map(item => (
          <NavLink
            key={item.to}
            to={item.to}
            className={({ isActive }) => `nav-item ${isActive ? 'active' : ''}`}
            onClick={onClose}
          >
            <item.icon size={18} />
            {item.label}
          </NavLink>
        ))}
      </nav>

      <div className="sidebar-footer">
        <div className="sidebar-user">
          <img
            src="https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=100&h=100&fit=crop&crop=face"
            alt="User"
          />
          <div className="user-info">
            <div className="user-name">{user.name}</div>
            <div className="user-role">{user.role} • Premium</div>
          </div>
          <Settings size={16} style={{ color: 'rgba(255,255,255,0.4)' }} />
        </div>
      </div>
    </aside>
  )
}
