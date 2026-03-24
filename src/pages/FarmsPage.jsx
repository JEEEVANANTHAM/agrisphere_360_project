import { useNavigate } from 'react-router-dom'
import { PlusCircle, Wheat, MapPin } from 'lucide-react'

const farms = [
  {
    id: '1',
    name: 'Green Valley Farm',
    crop: 'Wheat',
    area: '2.5 Hectares',
    status: 'Active',
    image: 'https://images.unsplash.com/photo-1523348837708-15d4a09cfac2?w=800&h=400&fit=crop',
  },
  {
    id: '2',
    name: 'Sunrise Fields',
    crop: 'Rice',
    area: '4.0 Hectares',
    status: 'Active',
    image: 'https://images.unsplash.com/photo-1500382017468-9049fed747ef?w=800&h=400&fit=crop',
  },
  {
    id: '3',
    name: 'Golden Acres',
    crop: 'Cotton',
    area: '3.2 Hectares',
    status: 'Dormant',
    image: 'https://images.unsplash.com/photo-1625246333195-78d9c38ad449?w=800&h=400&fit=crop',
  },
]

export default function FarmsPage() {
  const navigate = useNavigate()

  const handleAnalytics = (farm) => {
    navigate('/financial')
  }

  const handleManage = (farm) => {
    navigate('/inventory')
  }

  const handleFarmCardClick = (farm) => {
    alert(`Showing detailed satellite map for ${farm.name}`)
  }

  return (
    <div className="slide-up">
      <div className="section-header">
        <h2>My Farms</h2>
        <button className="btn btn-primary" onClick={() => alert("Add Farm functionality coming soon!")}>
          <PlusCircle size={18} /> Add Farm
        </button>
      </div>

      <div className="farm-cards">
        {farms.map(farm => (
          <div className="farm-card" key={farm.name} style={{ cursor: 'pointer' }}>
            <div
              className="farm-card-img"
              style={{ backgroundImage: `url(${farm.image})` }}
              onClick={() => handleFarmCardClick(farm)}
            />
            <div className="farm-card-body">
              <div className="farm-card-header" onClick={() => handleFarmCardClick(farm)}>
                <h3>{farm.name}</h3>
                <span className={`badge ${farm.status === 'Active' ? 'badge-success' : 'badge-warning'}`}>
                  {farm.status}
                </span>
              </div>
              <div className="farm-meta" onClick={() => handleFarmCardClick(farm)}>
                <Wheat size={14} />
                {farm.crop} | {farm.area}
              </div>
              <div className="farm-card-actions">
                <button 
                  className="btn btn-outline" 
                  onClick={(e) => { e.stopPropagation(); handleAnalytics(farm); }}
                >
                  View Analytics
                </button>
                <button 
                  className="btn btn-primary" 
                  onClick={(e) => { e.stopPropagation(); handleManage(farm); }}
                >
                  Manage
                </button>
              </div>
            </div>
          </div>
        ))}
      </div>
    </div>
  )
}
