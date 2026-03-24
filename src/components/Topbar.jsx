import { useLocation } from 'react-router-dom'
import { Menu, Search, Bell, Sun } from 'lucide-react'

export default function Topbar({ onMenuClick, pageTitles }) {
  const location = useLocation()
  const title = pageTitles[location.pathname] || 'AgriSphere 360'

  return (
    <header className="topbar">
      <div className="topbar-left">
        <button className="mobile-menu-btn" onClick={onMenuClick} aria-label="Toggle menu">
          <Menu size={20} />
        </button>
        <h1>{title}</h1>
      </div>
      <div className="topbar-right">
        <div className="search-box">
          <Search size={16} />
          <input type="text" placeholder="Search farms, crops..." />
        </div>
        <button className="icon-btn" aria-label="Toggle theme">
          <Sun size={18} />
        </button>
        <button className="icon-btn" aria-label="Notifications">
          <Bell size={18} />
          <span className="badge" />
        </button>
      </div>
    </header>
  )
}
