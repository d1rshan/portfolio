"use client";

import { useEffect, useRef, useState } from "react";
import { motion, useScroll, useTransform } from "framer-motion";
import { ArrowDown, Code, Github, Linkedin, Mail, User } from "lucide-react";
import Link from "next/link";
import Image from "next/image";
import { Button } from "@/components/ui/button";
import { Card, CardContent } from "@/components/ui/card";
import ProjectCard from "@/components/project-card";
import SkillBadge from "@/components/skill-badge";
import NavMenu from "@/components/nav-menu";
import { toast } from "sonner"; // Add this import

export default function Portfolio() {
  const { scrollY } = useScroll();
  const ref = useRef<HTMLDivElement>(null);
  const [isMounted, setIsMounted] = useState(false);
  
  // Add state inside component
  const [formData, setFormData] = useState({
    name: '',
    email: '',
    subject: '',
    message: ''
  });

  // Add form handler inside component
  const handleFormSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    
    try {
      const emailContent = `Name: ${formData.name}\nEmail: ${formData.email}\nSubject: ${formData.subject}\n\nMessage:\n${formData.message}`;
      await navigator.clipboard.writeText(emailContent);
      
      window.open(`https://mail.google.com/mail/?view=cm&fs=1&to=darshan.paccha@gmail.com&su=${encodeURIComponent(formData.subject)}`);
      
      toast.success('Email content copied to clipboard!');
      
      setFormData({
        name: '',
        email: '',
        subject: '',
        message: ''
      });
    } catch (error) {
      toast.error('Something went wrong. Please try again.');
    }
  };

  // Parallax effect
  const y = useTransform(scrollY, [0, 1000], [0, 300]);

  useEffect(() => {
    setIsMounted(true);
  }, []);

  const skills = [
    "Flutter",
    "Dart",
    "Riverpod",
    "Provider",
    "Firebase",
    "HTML",
    "CSS",
    "Tailwind",
    "JavaScript",
    "Node.js",
    "Express.js",
    "MongoDb",
    "Python",
    "C",
    "C++",
    "Java",
  ];

  const projects = [
    {
      title: "Vitify",
      description:
        "A casual, student-friendly Flutter app built for VIT students to manage their academics and mess info.",
      technologies: ["Flutter", "Dart", "Hive", "Firebase", "Riverpod"],
      image: "/placeholder.svg?height=400&width=600",
      github: "https://github.com/d1rshan/vitify-app",
      demo: "https://getvitify.web.app/",
    },
    {
      title: "Streaks🔥- Habit tracker",
      description:
        "A habit tracking application built with React and Appwrite.",
      technologies: ["React", "Appwrite", "Vercel"],
      image: "/placeholder.svg?height=400&width=600",
      github: "https://github.com/d1rshan/habit-tracker",
      demo: "#",
    },
  ];

  if (!isMounted) return null;

  return (
    <div className="bg-black text-white min-h-screen font-Inter">
      {/* Navigation */}
      <NavMenu />

      {/* Hero section */}
      <section
        className="relative h-screen flex items-center justify-center overflow-hidden"
        id="home"
      >
        <motion.div
          className="absolute inset-0 z-0"
          style={{ y }}
          initial={{ opacity: 0 }}
          animate={{ opacity: 0.05 }}
          transition={{ duration: 1 }}
        >
          <div className="grid grid-cols-10 h-full">
            {Array.from({ length: 100 }).map((_, i) => (
              <div
                key={i}
                className="border-[0.5px] border-white/5 h-full"
              ></div>
            ))}
          </div>
        </motion.div>

        <div className="container mx-auto px-4 z-10">
          <motion.div
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.8 }}
            className="text-center"
          >
            <motion.h2
              className="text-xl md:text-2xl font-medium mb-4"
              initial={{ opacity: 0 }}
              animate={{ opacity: 1 }}
              transition={{ delay: 0.2, duration: 0.8 }}
            >
              Hey, I&apos;m
            </motion.h2>
            <motion.h1
              className="text-5xl md:text-7xl lg:text-8xl font-bold mb-6 tracking-tighter"
              initial={{ opacity: 0, y: 20 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ delay: 0.4, duration: 0.8 }}
            >
              Darshan Paccha
            </motion.h1>
            <motion.div
              className="overflow-hidden h-12 md:h-16"
              initial={{ opacity: 0 }}
              animate={{ opacity: 1 }}
              transition={{ delay: 0.6, duration: 0.8 }}
            >
              <motion.h3
                className="text-xl md:text-3xl font-medium text-white/80"
                initial={{ y: 100 }}
                animate={{ y: 0 }}
                transition={{ delay: 0.8, duration: 0.8 }}
              >
                Flutter & Web Developer
              </motion.h3>
            </motion.div>

            <motion.div
              className="mt-12"
              initial={{ opacity: 0 }}
              animate={{ opacity: 1 }}
              transition={{ delay: 1.2, duration: 0.8 }}
            >
              <Button
                asChild
                variant="outline"
                className="rounded-full border-white text-white hover:bg-white hover:text-black transition-all duration-300"
              >
                <Link href="#projects">View My Work</Link>
              </Button>
            </motion.div>
          </motion.div>
        </div>

        <motion.div
          className="absolute bottom-10 left-1/2 transform -translate-x-1/2"
          initial={{ opacity: 0, y: -20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{
            delay: 1.4,
            duration: 0.8,
            repeat: Number.POSITIVE_INFINITY,
            repeatType: "reverse",
          }}
        >
          <ArrowDown className="w-6 h-6" />
        </motion.div>
      </section>

      {/* About section */}
      <section className="py-20 md:py-32 relative" id="about">
        <div className="container mx-auto px-4">
          <motion.div
            className="max-w-4xl mx-auto"
            initial={{ opacity: 0, y: 50 }}
            whileInView={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.8 }}
            viewport={{ once: true }}
          >
            <h2 className="text-3xl md:text-5xl font-bold mb-12 flex items-center">
              <User className="mr-4 w-8 h-8" /> About Me
            </h2>
            <div className="grid md:grid-cols-2 gap-12 items-center">
              <motion.div
                initial={{ opacity: 0, x: -50 }}
                whileInView={{ opacity: 1, x: 0 }}
                transition={{ duration: 0.8, delay: 0.2 }}
                viewport={{ once: true }}
              >
                <div className="relative w-full aspect-square overflow-hidden rounded-lg border border-white/20">
                  <Image
                    src="/profile.jpg"
                    alt="Darshan Paccha"
                    fill
                    priority
                    className="object-cover grayscale hover:grayscale-0 transition-all duration-500"
                  />
                </div>
              </motion.div>
              <motion.div
                initial={{ opacity: 0, x: 50 }}
                whileInView={{ opacity: 1, x: 0 }}
                transition={{ duration: 0.8, delay: 0.4 }}
                viewport={{ once: true }}
              >
                <p className="text-lg md:text-xl leading-relaxed mb-6 text-white/80">
                  I&apos;m a passionate full stack developer with expertise in
                  building modern web applications. I specialize in creating
                  seamless user experiences with clean, efficient code.
                </p>
                <p className="text-lg md:text-xl leading-relaxed mb-8 text-white/80">
                  With a strong foundation in both frontend and backend
                  technologies, I enjoy tackling complex problems and turning
                  ideas into reality through innovative solutions.
                </p>
                <a
                  href="https://drive.google.com/file/d/1zjIr0F4I70R2V8CgVrmeAeDms-e47NKc/view?usp=sharing"
                  target="_blank"
                  rel="noopener noreferrer"
                >
                  <Button
                    asChild
                    className="bg-white text-black hover:bg-white/90 transition-all duration-300"
                  >
                    <span>Download Resume</span>
                  </Button>
                </a>
              </motion.div>
            </div>
          </motion.div>
        </div>
      </section>

      {/* Skills section */}
      <section
        className="py-20 md:py-32 bg-white text-black relative"
        id="skills"
      >
        <div className="container mx-auto px-4">
          <motion.div
            initial={{ opacity: 0, y: 50 }}
            whileInView={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.8 }}
            viewport={{ once: true }}
            className="max-w-4xl mx-auto"
          >
            <h2 className="text-3xl md:text-5xl font-bold mb-12 flex items-center">
              <Code className="mr-4 w-8 h-8" /> Skills & Technologies
            </h2>
            <motion.div
              className="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 gap-4"
              initial={{ opacity: 0 }}
              whileInView={{ opacity: 1 }}
              transition={{ duration: 0.8, delay: 0.2 }}
              viewport={{ once: true }}
            >
              {skills.map((skill, index) => (
                <SkillBadge key={index} name={skill} index={index} />
              ))}
            </motion.div>
          </motion.div>
        </div>
      </section>

      {/* Projects section */}
      <section className="py-20 md:py-32 relative" id="projects">
        <div className="container mx-auto px-4">
          <motion.div
            initial={{ opacity: 0, y: 50 }}
            whileInView={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.8 }}
            viewport={{ once: true }}
            className="max-w-6xl mx-auto"
          >
            <h2 className="text-3xl md:text-5xl font-bold mb-12 flex items-center">
              <Github className="mr-4 w-8 h-8" /> Featured Projects
            </h2>
            <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
              {projects.map((project, index) => (
                <ProjectCard key={index} project={project} index={index} />
              ))}
            </div>
          </motion.div>
        </div>
      </section>

      {/* Contact section */}
      <section className="py-20 md:py-32 bg-white text-black relative" id="contact">
        <div className="container mx-auto px-4">
          <motion.div
            initial={{ opacity: 0, y: 50 }}
            whileInView={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.8 }}
            viewport={{ once: true }}
            className="max-w-4xl mx-auto"
          >
            <h2 className="text-3xl md:text-5xl font-bold mb-12 flex items-center">
              <Mail className="mr-4 w-8 h-8" /> Get In Touch
            </h2>
            <Card className="border-black/20">
              <CardContent className="p-8">
                <form onSubmit={handleFormSubmit} className="grid gap-6">
                  <div className="grid md:grid-cols-2 gap-6">
                    <div className="space-y-2">
                      <label htmlFor="name" className="text-sm font-medium">
                        Name
                      </label>
                      <input
                        id="name"
                        name="name"
                        required
                        value={formData.name}
                        onChange={(e) => setFormData({ ...formData, name: e.target.value })}
                        className="w-full p-3 border border-black/20 focus:border-black focus:outline-none transition-all duration-300"
                        placeholder="Your name"
                      />
                    </div>
                    <div className="space-y-2">
                      <label htmlFor="email" className="text-sm font-medium">
                        Email
                      </label>
                      <input
                        id="email"
                        name="email"
                        type="email"
                        required
                        value={formData.email}
                        onChange={(e) => setFormData({ ...formData, email: e.target.value })}
                        className="w-full p-3 border border-black/20 focus:border-black focus:outline-none transition-all duration-300"
                        placeholder="Your email"
                      />
                    </div>
                  </div>
                  <div className="space-y-2">
                    <label htmlFor="subject" className="text-sm font-medium">
                      Subject
                    </label>
                    <input
                      id="subject"
                      name="subject"
                      required
                      value={formData.subject}
                      onChange={(e) => setFormData({ ...formData, subject: e.target.value })}
                      className="w-full p-3 border border-black/20 focus:border-black focus:outline-none transition-all duration-300"
                      placeholder="Subject"
                    />
                  </div>
                  <div className="space-y-2">
                    <label htmlFor="message" className="text-sm font-medium">
                      Message
                    </label>
                    <textarea
                      id="message"
                      name="message"
                      required
                      rows={5}
                      value={formData.message}
                      onChange={(e) => setFormData({ ...formData, message: e.target.value })}
                      className="w-full p-3 border border-black/20 focus:border-black focus:outline-none transition-all duration-300"
                      placeholder="Your message"
                    ></textarea>
                  </div>
                  <Button type="submit" className="bg-white text-black hover:bg-white/90 transition-all duration-300 w-full md:w-auto">
                    Send Message
                  </Button>
                </form>
              </CardContent>
            </Card>
          </motion.div>
        </div>
      </section>

      {/* Footer */}
      <footer className="py-8 border-t border-white/20">
        <div className="container mx-auto px-4">
          <div className="flex flex-col md:flex-row justify-between items-center">
            <p className="text-white/60 mb-4 md:mb-0">
              © {new Date().getFullYear()} Darshan Paccha. All rights reserved.
            </p>
            <div className="flex space-x-4">
              <a
                href="https://github.com/d1rshan"
                target="_blank"
                rel="noopener noreferrer"
                className="text-white/60 hover:text-white transition-colors duration-300"
              >
                <Github className="w-5 h-5" />
                <span className="sr-only">GitHub</span>
              </a>
              <a
                href="https://www.linkedin.com/in/darshan-paccha-6805522a7/"
                target="_blank"
                rel="noopener noreferrer"
                className="text-white/60 hover:text-white transition-colors duration-300"
              >
                <Linkedin className="w-5 h-5" />
                <span className="sr-only">LinkedIn</span>
              </a>
              <a
                target="_blank"
                href="mailto:darshan.paccha@gmail.com"
                className="text-white/60 hover:text-white transition-colors duration-300"
              >
                <Mail className="w-5 h-5" />
                <span className="sr-only">Email</span>
              </a>
            </div>
          </div>
        </div>
      </footer>
    </div>
  );
}
