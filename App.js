import React from 'react';
import Navbar from './projet/Navbar';
import ImageSlider from './projet/ImageSlider';
import Categories from './projet/Categories';
import AwarenessSection from './projet/AwarenessSection';
import Footer from './projet/Footer';
import './projet/App.css';

function App() {
  const images = [
    { img: 'dogcatblack.jpg' },
    { img: 'dogcatwhite.jpg' },
    { img: 'dogcatswite.jpg' },
    
  ];

  return (
    <div>
      <Navbar />
      <ImageSlider images={images} />
      <Categories />
      <AwarenessSection />
      <Footer />
    </div>
  );
}

export default App;