import React from 'react';
import './App.css';

function AwarenessSection() {
  return (
    <section id="awareness" className="awareness-section ">
      <div className="awareness-content">
        {/* GIF on the left */}
        <video 
          src={"./imgPRO/petcare.mp4"} 
          className="awareness-video" 
          autoPlay 
          loop 
          muted 
          playsInline
        ></video>

        {/* Paragraph about animal welfare on the right */}
        <div className="awareness-text">
          <h2>Animal Welfare Awareness</h2>
          <p>
            We are dedicated to promoting the well-being of animals. Join us in advocating 
            for responsible pet care and supporting initiatives that protect animals worldwide.
            Together, we can create a more compassionate world for all creatures.
          </p>
        </div>
      </div>
    </section>
  );
}

export default AwarenessSection;