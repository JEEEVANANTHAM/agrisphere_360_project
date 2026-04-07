const categories = [
  {
    title: 'Seeds',
    items: [
      { name: 'Wheat Seeds', qty: '150 kg', level: 0.8 },
      { name: 'Corn Seeds', qty: '20 kg', level: 0.2 },
    ],
  },
  {
    title: 'Fertilizers',
    items: [
      { name: 'Urea', qty: '500 kg', level: 0.9 },
      { name: 'DAP', qty: '200 kg', level: 0.5 },
    ],
  },
  {
    title: 'Equipment',
    items: [
      { name: 'Tractor', qty: '1 Unit', level: 1.0 },
      { name: 'Sprayer', qty: '3 Units', level: 1.0 },
    ],
  },
]

export default function InventoryPage() {
  return (
    <div className="slide-up">
      {categories.map(cat => (
        <div className="inventory-category" key={cat.title}>
          <div className="inventory-category-header">
            <h3>{cat.title}</h3>
            <button className="btn btn-ghost" style={{ color: 'var(--primary)', fontWeight: 600 }}>
              View All
            </button>
          </div>
          {cat.items.map(item => (
            <div className="stock-item" key={item.name}>
              <div className="stock-header">
                <h4>{item.name}</h4>
                <span className="stock-qty">{item.qty}</span>
              </div>
              <div className="stock-bar">
                <div
                  className="stock-bar-fill"
                  style={{
                    width: `${item.level * 100}%`,
                    background: item.level < 0.3 ? '#ef4444' : '#16a34a',
                  }}
                />
              </div>
            </div>
          ))}
        </div>
      ))}
    </div>
  )
}
