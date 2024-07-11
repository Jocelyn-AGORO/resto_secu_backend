module.exports = app => {
    const restaurants = require("../controllers/restaurantsController");
    app.get("/restaurants", restaurants.restaurants)
    app.get("/restaurants/search", restaurants.search);
    app.get("/restaurants/searchUnsafe", restaurants.searchUnsafe);
};
