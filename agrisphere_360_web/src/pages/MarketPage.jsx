import { TrendingUp, TrendingDown, Leaf, Search, Filter } from 'lucide-react'

const summary = [
  { label: 'Avg Wheat', price: '₹2,450', trend: 2.5 },
  { label: 'Avg Rice', price: '₹3,200', trend: -1.2 },
  { label: 'Avg Cotton', price: '₹7,200', trend: 3.8 },
]

const crops = [
  { name: 'Wheat', market: 'Delhi Mandi', price: '₹2,450/q', updated: '2h ago' },
  { name: 'Rice (Basmati)', market: 'Amritsar Market', price: '₹6,500/q', updated: '1h ago' },
  { name: 'Cotton', market: 'Gujarat Hub', price: '₹7,200/q', updated: '3h ago' },
  { name: 'Maize', market: 'Pune Mandi', price: '₹2,100/q', updated: '30m ago' },
  { name: 'Soybean', market: 'Indore Market', price: '₹4,800/q', updated: '45m ago' },
]

export default function MarketPage() {
  return (
    <div className="slide-up">
      {/* Summary */}
      <div className="market-summary">
        {summary.map(s => (
          <div className="summary-item" key={s.label}>
            <div className="label">{s.label}</div>
            <div className="price">{s.price}</div>
            <div className={`trend ${s.trend > 0 ? 'up' : 'down'}`}>
              {s.trend > 0 ? <TrendingUp size={14} /> : <TrendingDown size={14} />}
              {Math.abs(s.trend)}%
            </div>
          </div>
        ))}
      </div>

      {/* Price List */}
      <div className="section-header">
        <h2>Live Mandi Prices</h2>
        <div style={{ display: 'flex', gap: 8 }}>
          <button className="btn btn-ghost"><Search size={16} /></button>
          <button className="btn btn-ghost"><Filter size={16} /></button>
        </div>
      </div>
      <div className="price-list">
        {crops.map(c => (
          <div className="price-item" key={c.name}>
            <div className="crop-icon">
              <Leaf size={22} />
            </div>
            <div className="crop-info">
              <h4>{c.name}</h4>
              <p>{c.market}</p>
            </div>
            <div className="crop-price">
              <div className="amount">{c.price}</div>
              <div className="updated">Updated: {c.updated}</div>
            </div>
          </div>
        ))}
      </div>
    </div>
  )
}
