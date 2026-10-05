import "./globals.css";
import type { Metadata } from "next";

export const metadata: Metadata = {
  title: "Handover Assistant",
  description: "Dashboard for operational handovers and traceability",
};

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en">
      <body>{children}</body>
    </html>
  );
}
