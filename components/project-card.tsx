"use client"

import { motion } from "framer-motion"
import { ExternalLink, Github } from "lucide-react"
import Image from "next/image"
import Link from "next/link"
import { Button } from "@/components/ui/button"
import { Card, CardContent } from "@/components/ui/card"

interface Project {
  title: string
  description: string
  technologies: string[]
  image: string
  github: string
  demo: string
}

interface ProjectCardProps {
  project: Project
  index: number
}

export default function ProjectCard({ project, index }: ProjectCardProps) {
  return (
    <motion.div
      initial={{ opacity: 0, y: 50 }}
      whileInView={{ opacity: 1, y: 0 }}
      transition={{ duration: 0.5, delay: index * 0.1 }}
      viewport={{ once: true }}
      whileHover={{ y: -10 }}
      className="h-full"
    >
      <Card className="overflow-hidden border-white/10 bg-black h-full flex flex-col">
        <div className="relative h-48 overflow-hidden group">
          <Image
            src={project.image || "/placeholder.svg"}
            alt={project.title}
            fill
            className="object-cover grayscale group-hover:grayscale-0 transition-all duration-500 transform group-hover:scale-110"
          />
          <div className="absolute inset-0 bg-black/50 opacity-0 group-hover:opacity-100 transition-opacity duration-300 flex items-center justify-center gap-4">
            <Link href={project.github}>
              <Button
                size="icon"
                variant="outline"
                className="rounded-full border-white text-white hover:bg-white hover:text-black"
              >
                <Github className="h-5 w-5" />
              </Button>
            </Link>
            <Link href={project.demo}>
              <Button
                size="icon"
                variant="outline"
                className="rounded-full border-white text-white hover:bg-white hover:text-black"
              >
                <ExternalLink className="h-5 w-5" />
              </Button>
            </Link>
          </div>
        </div>
        <CardContent className="p-6 flex flex-col flex-grow">
          <h3 className="text-xl font-bold mb-2">{project.title}</h3>
          <p className="text-white/70 mb-4 flex-grow">{project.description}</p>
          <div className="flex flex-wrap gap-2 mt-auto">
            {project.technologies.map((tech, i) => (
              <span key={i} className="text-xs px-2 py-1 border border-white/20 rounded-full text-white/60">
                {tech}
              </span>
            ))}
          </div>
        </CardContent>
      </Card>
    </motion.div>
  )
}
