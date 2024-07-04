const jwt = require('jsonwebtoken');

exports.authenticateToken = (req, res, next) => {
    const token = req.header('Authorization') && req.header('Authorization').split(' ')[1];
    if (!token) return res.status(401).send({ message: 'Access denied. No token provided.' });

    try {
        const decoded = jwt.verify(token, process.env.JWT_SECRET);
        req.client = decoded;
        next();
    } catch (ex) {
        res.status(400).send({ message: 'Invalid token.' });
    }
};
