import React, { useState, useEffect } from 'react';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faCat, faDog } from '@fortawesome/free-solid-svg-icons';
import './ImageSlider.css';
import { useNavigate } from 'react-router-dom';

const ImageSlider = ({ images }) => {
  const [currentIndex, setCurrentIndex] = useState(0);
  const navigate = useNavigate();

  useEffect(() => {
    const interval = setInterval(() => {
      setCurrentIndex((prevIndex) => (prevIndex + 1) % images.length);
    }, 3000); // Change image every 3 seconds

    return () => clearInterval(interval);
  }, [images.length]);

  const handleNavigate = (path) => {
    navigate(path);
  };

  return (
    <div className="image-slider">
      <div className="slider-buttons">
        <button onClick={() => handleNavigate('/cats')} className="slider-button">
          <FontAwesomeIcon icon={faCat} /> Cat Products
        </button>
        <button onClick={() => handleNavigate('/dogs')} className="slider-button">
          <FontAwesomeIcon icon={faDog} /> Dog Products
        </button>
      </div>

      <div
        className="slider-inner"
        style={{
          transform: `translateX(-${currentIndex * 100}%)`,
          transition: 'transform 1s ease',
        }}
      >
        {images.map((image, index) => (
          <img
            key={index}
            src={`/imgPRO/${image.img}`}
            alt={`Slide ${index}`}
            className="slider-image"
          />
        ))}
      </div>
    </div>
  );
};

export default ImageSlider;