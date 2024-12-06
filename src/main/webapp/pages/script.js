// Script.js

// Khi nhấn vào các nút icon, thực hiện hành động
document.querySelectorAll('.menu-icons img').forEach(icon => {
    icon.addEventListener('click', () => {
        alert(`Bạn đã nhấn vào biểu tượng: ${icon.alt}`);
    });
});

// Điều khiển carousel (Bootstrap)
document.addEventListener('DOMContentLoaded', () => {
    const carousel = new bootstrap.Carousel('#carouselExample', {
        interval: 3000, // Thời gian chuyển đổi giữa các slide (ms)
        ride: 'carousel'
    });
});

// Thêm sự kiện click cho nút "Chọn mua"
document.querySelectorAll('.product-card button').forEach(button => {
    button.addEventListener('click', () => {
        alert('Sản phẩm đã được thêm vào giỏ hàng!');
    });
});

// Điều chỉnh các icon mạng xã hội
document.querySelectorAll('.social-icons img').forEach(icon => {
    icon.addEventListener('click', () => {
        alert(`Bạn đã chọn: ${icon.alt}`);
    });
});
