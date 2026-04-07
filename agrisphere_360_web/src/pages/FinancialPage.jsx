import { TrendingUp, Plus, Minus } from 'lucide-react'
import { BarChart, Bar, XAxis, YAxis, CartesianGrid, Tooltip, ResponsiveContainer, Legend } from 'recharts'

const chartData = [
  { month: 'Oct', income: 35000, expense: 15000 },
  { month: 'Nov', income: 42000, expense: 18000 },
  { month: 'Dec', income: 28000, expense: 12000 },
  { month: 'Jan', income: 55000, expense: 20000 },
  { month: 'Feb', income: 48000, expense: 22000 },
  { month: 'Mar', income: 65000, expense: 25000 },
]

const transactions = [
  { name: 'Seeds Purchase', amount: '-₹5,000', type: 'Expense', time: '2 days ago' },
  { name: 'Wheat Sale', amount: '+₹40,000', type: 'Income', time: '3 days ago' },
  { name: 'Fertilizer', amount: '-₹2,500', type: 'Expense', time: '5 days ago' },
  { name: 'Rice Sale', amount: '+₹25,000', type: 'Income', time: '1 week ago' },
]

export default function FinancialPage() {
  return (
    <div className="slide-up">
      {/* Balance */}
      <div className="finance-balance">
        <div className="balance-label">Net Profit (This Season)</div>
        <div className="balance-amount">₹80,000</div>
        <div className="balance-trend">
          <TrendingUp size={18} />
          12% increase from last season
        </div>
      </div>

      {/* Income / Expense Stats */}
      <div className="finance-stats">
        <div className="finance-stat-card" style={{ background: 'rgba(22,163,74,0.08)', borderRadius: 'var(--radius-xl)' }}>
          <div className="f-label" style={{ color: '#16a34a' }}>Income</div>
          <div className="f-value" style={{ color: '#16a34a' }}>₹1,25,000</div>
        </div>
        <div className="finance-stat-card" style={{ background: 'rgba(239,68,68,0.08)', borderRadius: 'var(--radius-xl)' }}>
          <div className="f-label" style={{ color: '#ef4444' }}>Expenses</div>
          <div className="f-value" style={{ color: '#ef4444' }}>₹45,000</div>
        </div>
      </div>

      {/* Chart */}
      <div className="section-header">
        <h2>Profit & Loss Trend</h2>
      </div>
      <div style={{ background: 'var(--bg-card)', border: '1px solid var(--border)', borderRadius: 'var(--radius-xl)', padding: 20, marginBottom: 28 }}>
        <ResponsiveContainer width="100%" height={240}>
          <BarChart data={chartData} barGap={8}>
            <CartesianGrid strokeDasharray="3 3" stroke="#f3f4f6" />
            <XAxis dataKey="month" />
            <YAxis />
            <Tooltip
              contentStyle={{ borderRadius: 12, border: '1px solid #e5e7eb', boxShadow: '0 4px 12px rgba(0,0,0,0.08)' }}
            />
            <Legend />
            <Bar dataKey="income" fill="#16a34a" radius={[6, 6, 0, 0]} name="Income" />
            <Bar dataKey="expense" fill="#ef4444" radius={[6, 6, 0, 0]} name="Expense" />
          </BarChart>
        </ResponsiveContainer>
      </div>

      {/* Transactions */}
      <div className="section-header">
        <h2>Recent Transactions</h2>
        <button className="view-all">View All</button>
      </div>
      <div className="transactions-list">
        {transactions.map(t => (
          <div className="transaction-item" key={t.name}>
            <div
              className="t-icon"
              style={{
                background: t.type === 'Income' ? '#dcfce7' : '#fee2e2',
                color: t.type === 'Income' ? '#16a34a' : '#ef4444',
              }}
            >
              {t.type === 'Income' ? <Plus size={18} /> : <Minus size={18} />}
            </div>
            <div className="t-info">
              <h4>{t.name}</h4>
              <p>{t.time}</p>
            </div>
            <div
              className="t-amount"
              style={{ color: t.type === 'Income' ? '#16a34a' : '#ef4444' }}
            >
              {t.amount}
            </div>
          </div>
        ))}
      </div>
    </div>
  )
}
