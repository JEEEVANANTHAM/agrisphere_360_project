import React, { createContext, useContext, useState, useEffect } from 'react'

const UserContext = createContext()

export function UserProvider({ children }) {
  // 1. Initialize state. Try localStorage first, fallback to default.
  const [user, setUser] = useState(() => {
    const stored = localStorage.getItem('agrisphere_user')
    if (stored) {
      return JSON.parse(stored)
    }
    return {
      name: 'Thamizhselvan',
      email: 'thamizh@agrisphere.com',
      phone: '+91 98765 43210',
      role: 'Farmer',
    }
  })

  // 2. Function to update user and instantly persist to localStorage
  const updateUser = (newUserData) => {
    setUser(newUserData)
    localStorage.setItem('agrisphere_user', JSON.stringify(newUserData))
  }

  return (
    <UserContext.Provider value={{ user, updateUser }}>
      {children}
    </UserContext.Provider>
  )
}

export function useUser() {
  return useContext(UserContext)
}
