import { useState, useEffect } from 'react'
import { useNavigate } from 'react-router-dom'
import { ArrowLeft, Save, Camera } from 'lucide-react'
import { useUser } from '../context/UserContext'

export default function EditProfile() {
  const navigate = useNavigate()
  const { user, updateUser } = useUser()
  const [successMsg, setSuccessMsg] = useState('')
  
  // Pre-fill form state with the global user object
  const [formData, setFormData] = useState({
    name: user.name,
    email: user.email,
    phone: user.phone,
    role: user.role,
  })

  // Whenever the global user updates, we sync the form if needed (handling external resets)
  useEffect(() => {
    setFormData({
      name: user.name,
      email: user.email,
      phone: user.phone,
      role: user.role,
    })
  }, [user])

  const handleChange = (e) => {
    const { name, value } = e.target
    setFormData((prev) => ({ ...prev, [name]: value }))
  }

  const handleSave = (e) => {
    e.preventDefault()

    // 1. Update the global context (which securely handles localStorage persistence under the hood)
    updateUser(formData)

    // 2. Show UI feedback
    setSuccessMsg('Profile updated successfully!')
    
    // Clear the success message and optionally go back after delay
    setTimeout(() => {
      setSuccessMsg('')
      navigate('/profile')
    }, 2000)
  }

  return (
    <div className="slide-up">
      <div className="section-header">
        <div style={{ display: 'flex', alignItems: 'center', gap: 12 }}>
          <button className="btn-ghost" onClick={() => navigate('/profile')} style={{ padding: '8px' }}>
            <ArrowLeft size={20} />
          </button>
          <h2 style={{ margin: 0 }}>Edit Profile</h2>
        </div>
      </div>

      <div className="card" style={{ maxWidth: 600, margin: '0 auto' }}>
        {successMsg && (
          <div style={{ background: '#dcfce7', color: '#16a34a', padding: '12px 16px', borderRadius: 8, marginBottom: 20, fontWeight: 600 }}>
            {successMsg}
          </div>
        )}
        
        <form onSubmit={handleSave}>
          <div style={{ textAlign: 'center', marginBottom: 24, position: 'relative' }}>
            <img
              className="profile-avatar"
              src="https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=300&h=300&fit=crop&crop=face"
              alt="Profile"
              style={{ width: 100, height: 100, margin: '0 auto', display: 'block' }}
            />
            <div style={{ position: 'absolute', bottom: 5, right: '50%', marginRight: '-40px', background: 'var(--primary)', padding: 6, borderRadius: '50%', color: 'white', cursor: 'pointer' }}>
              <Camera size={16} />
            </div>
          </div>

          <div style={{ marginBottom: 16 }}>
            <label style={{ display: 'block', fontSize: '0.85rem', fontWeight: 600, color: 'var(--text-secondary)', marginBottom: 6 }}>Full Name</label>
            <input 
              type="text" 
              name="name" 
              value={formData.name} 
              onChange={handleChange}
              style={{ width: '100%', padding: '10px 14px', borderRadius: 8, border: '1px solid var(--border)', fontSize: '0.95rem', outline: 'none' }}
              required 
            />
          </div>

          <div style={{ marginBottom: 16 }}>
            <label style={{ display: 'block', fontSize: '0.85rem', fontWeight: 600, color: 'var(--text-secondary)', marginBottom: 6 }}>Email Address</label>
            <input 
              type="email" 
              name="email" 
              value={formData.email} 
              onChange={handleChange}
              style={{ width: '100%', padding: '10px 14px', borderRadius: 8, border: '1px solid var(--border)', fontSize: '0.95rem', outline: 'none' }}
              required 
            />
          </div>

          <div style={{ marginBottom: 16 }}>
            <label style={{ display: 'block', fontSize: '0.85rem', fontWeight: 600, color: 'var(--text-secondary)', marginBottom: 6 }}>Phone Number</label>
            <input 
              type="tel" 
              name="phone" 
              value={formData.phone} 
              onChange={handleChange}
              style={{ width: '100%', padding: '10px 14px', borderRadius: 8, border: '1px solid var(--border)', fontSize: '0.95rem', outline: 'none' }}
              required 
            />
          </div>

          <div style={{ marginBottom: 24 }}>
            <label style={{ display: 'block', fontSize: '0.85rem', fontWeight: 600, color: 'var(--text-secondary)', marginBottom: 6 }}>Role</label>
            <select 
              name="role" 
              value={formData.role} 
              onChange={handleChange}
              style={{ width: '100%', padding: '10px 14px', borderRadius: 8, border: '1px solid var(--border)', fontSize: '0.95rem', outline: 'none', background: 'white' }}
            >
              <option value="Farmer">Farmer</option>
              <option value="Agronomist">Agronomist</option>
              <option value="Admin">Admin</option>
            </select>
          </div>

          <div style={{ display: 'flex', gap: 12 }}>
            <button type="button" className="btn btn-outline" style={{ flex: 1, justifyContent: 'center' }} onClick={() => navigate('/profile')}>
              Cancel
            </button>
            <button type="submit" className="btn btn-primary" style={{ flex: 1, justifyContent: 'center' }}>
              <Save size={18} /> Save Changes
            </button>
          </div>
        </form>
      </div>
    </div>
  )
}
