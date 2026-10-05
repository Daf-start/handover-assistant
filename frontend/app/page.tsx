"use client";

import Link from "next/link";

const stats = [
  { label: "Active handovers", value: "18" },
  { label: "Open tasks", value: "42" },
  { label: "Pending reviews", value: "7" },
  { label: "Completed", value: "94" },
];

const recent = [
  { title: "Infrastructure handover Q4", status: "In review", owner: "Maria Lopez" },
  { title: "Support team continuity", status: "Active", owner: "Carlos Ruiz" },
  { title: "Cloud migration transfer", status: "Blocked", owner: "Ana Gomez" },
];

export default function HomePage() {
  return (
    <main className="min-h-screen bg-slate-100 p-6 text-slate-900">
      <div className="mx-auto max-w-7xl">
        <header className="mb-8 flex items-center justify-between rounded-2xl bg-white p-5 shadow-sm">
          <div>
            <p className="text-sm uppercase tracking-[0.2em] text-blue-600">Handover Assistant</p>
            <h1 className="mt-2 text-3xl font-bold">Operations dashboard</h1>
          </div>
          <Link href="/handover" className="rounded-xl bg-blue-600 px-4 py-2 font-medium text-white shadow-sm hover:bg-blue-700">
            New handover
          </Link>
        </header>

        <section className="mb-8 grid gap-4 md:grid-cols-4">
          {stats.map((stat) => (
            <div key={stat.label} className="rounded-2xl bg-white p-5 shadow-sm ring-1 ring-slate-200">
              <p className="text-sm text-slate-500">{stat.label}</p>
              <p className="mt-4 text-3xl font-bold">{stat.value}</p>
            </div>
          ))}
        </section>

        <section className="grid gap-6 lg:grid-cols-[1.5fr_1fr]">
          <div className="rounded-2xl bg-white p-5 shadow-sm ring-1 ring-slate-200">
            <div className="mb-4 flex items-center justify-between">
              <h2 className="text-xl font-semibold">Recent handovers</h2>
              <button className="text-sm font-medium text-blue-600">View all</button>
            </div>
            <div className="space-y-4">
              {recent.map((item) => (
                <div key={item.title} className="flex items-center justify-between rounded-xl border border-slate-200 p-4">
                  <div>
                    <h3 className="font-medium">{item.title}</h3>
                    <p className="mt-1 text-sm text-slate-500">Owner: {item.owner}</p>
                  </div>
                  <span className="rounded-full bg-slate-100 px-3 py-1 text-sm font-medium text-slate-700">{item.status}</span>
                </div>
              ))}
            </div>
          </div>

          <div className="rounded-2xl bg-white p-5 shadow-sm ring-1 ring-slate-200">
            <h2 className="text-xl font-semibold">AI guide</h2>
            <ul className="mt-4 space-y-3 text-sm text-slate-600">
              <li>• Review the latest Outlook messages for pending tasks.</li>
              <li>• Validate owners and execution dates before completion.</li>
              <li>• Confirm AI suggestions before updating the official record.</li>
              <li>• Attach all supporting documents for the final handover package.</li>
            </ul>
          </div>
        </section>
      </div>
    </main>
  );
}
