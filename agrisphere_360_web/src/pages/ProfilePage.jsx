import { useNavigate } from 'react-router-dom'
import {
  User, Bell, Globe, Wallet, Package, BarChart3,
  HelpCircle, FileText, LogOut, ChevronRight, Settings
} from 'lucide-react'
import { useUser } from '../context/UserContext'

const accountSettings = [
  { id: 'edit-profile', icon: User, label: 'Edit Profile', path: '/profile/edit' },
  { id: 'notifications', icon: Bell, label: 'Notifications' },
  { id: 'language', icon: Globe, label: 'Language (English)' },
]

const businessItems = [
  { id: 'expenses', icon: Wallet, label: 'Expenses & Income', path: '/financial' },
  { id: 'inventory', icon: Package, label: 'Inventory Management', path: '/inventory' },
  { id: 'analytics', icon: BarChart3, label: 'System Analytics', path: '/admin' },
]

const supportItems = [
  { id: 'help', icon: HelpCircle, label: 'Help Center' },
  { id: 'terms', icon: FileText, label: 'Terms & Conditions' },
  { id: 'logout', icon: LogOut, label: 'Logout', danger: true },
]

function ProfileSection({ title, items, onItemClick }) {
  return (
    <div className="profile-section">
      <div className="profile-section-title">{title}</div>
      <div className="profile-group">
        {items.map(item => (
          <div 
            className={`profile-tile ${item.danger ? 'danger' : ''}`} 
            key={item.label}
            onClick={() => onItemClick(item)}
          >
            <div className="tile-icon">
              <item.icon size={18} />
            </div>
            <span className="tile-label">{item.label}</span>
            <ChevronRight size={16} className="tile-arrow" />
          </div>
        ))}
      </div>
    </div>
  )
}

export default function ProfilePage() {
  const navigate = useNavigate()
  const { user } = useUser()

  const handleItemClick = (item) => {
    if (item.path) {
      navigate(item.path)
    } else if (item.id === 'logout') {
      const confirmLog = window.confirm("Are you sure you want to logout?")
      if(confirmLog) alert("Logged out successfully.")
    } else {
      alert(`${item.label} clicked. Screen coming soon!`)
    }
  }

  return (
    <div className="slide-up">
      <div className="profile-header">
        <img
          className="profile-avatar"
          src="https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=300&h=300&fit=crop&crop=face"
          alt={user.name}
        />
        <h2>{user.name}</h2>
        <p>{user.role} | Premium Member</p>
      </div>

      <ProfileSection title="Account Settings" items={accountSettings} onItemClick={handleItemClick} />
      <ProfileSection title="Business" items={businessItems} onItemClick={handleItemClick} />
      <ProfileSection title="Support" items={supportItems} onItemClick={handleItemClick} />
    </div>
  )
}
