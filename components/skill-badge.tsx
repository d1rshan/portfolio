"use client"

import { motion } from "framer-motion"

interface SkillBadgeProps {
  name: string
  index: number
}

export default function SkillBadge({ name, index }: SkillBadgeProps) {
  return (
    <motion.div
      initial={{ opacity: 0, scale: 0.8 }}
      whileInView={{ opacity: 1, scale: 1 }}
      transition={{ duration: 0.5, delay: index * 0.05 }}
      viewport={{ once: true }}
      whileHover={{ scale: 1.05 }}
      className="border border-black/10 rounded-lg p-4 flex items-center justify-center text-center hover:bg-black hover:text-white transition-all duration-300"
    >
      {name}
    </motion.div>
  )
}
