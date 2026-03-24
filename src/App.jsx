import { useState } from 'react'
import { Routes, Route } from 'react-router-dom'
import Sidebar from './components/Sidebar'
import Topbar from './components/Topbar'
import Dashboard from './pages/Dashboard'
import FarmsPage from './pages/FarmsPage'
import AdvisoryPage from './pages/AdvisoryPage'
import MarketPage from './pages/MarketPage'
import FinancialPage from './pages/FinancialPage'
import InventoryPage from './pages/InventoryPage'
import ProfilePage from './pages/ProfilePage'
import AdminPage from './pages/AdminPage'
import EditProfile from './pages/EditProfile'
import { UserProvider } from './context/UserContext'

const pageTitles = {
  '/': 'Dashboard',
  '/farms': 'My Farms',
  '/advisory': 'AI Advisory',
  '/market': 'Market Prices',
  '/financial': 'Financial Analytics',
  '/inventory': 'Inventory',
  '/profile': 'Profile',
  '/profile/edit': 'Edit Profile',
  '/admin': 'Admin Control Center',
}

export default function App() {
  const [sidebarOpen, setSidebarOpen] = useState(false)

  return (
    <UserProvider>
      <div className="app-layout">
        <div className={`sidebar-backdrop ${sidebarOpen ? 'visible' : ''}`} onClick={() => setSidebarOpen(false)} />
      <Sidebar open={sidebarOpen} onClose={() => setSidebarOpen(false)} />
      <div className="main-content">
        <Topbar onMenuClick={() => setSidebarOpen(prev => !prev)} pageTitles={pageTitles} />
        <div className="page-content fade-in">
          <Routes>
            <Route path="/" element={<Dashboard />} />
            <Route path="/farms" element={<FarmsPage />} />
            <Route path="/advisory" element={<AdvisoryPage />} />
            <Route path="/market" element={<MarketPage />} />
            <Route path="/financial" element={<FinancialPage />} />
            <Route path="/inventory" element={<InventoryPage />} />
            <Route path="/profile" element={<ProfilePage />} />
            <Route path="/profile/edit" element={<EditProfile />} />
            <Route path="/admin" element={<AdminPage />} />
          </Routes>
        </div>
      </div>
    </div>
    </UserProvider>
  )
}
