SELECT COUNT(*) FROM videos;


-- Find duplicate titles
SELECT title, COUNT(*) as count
FROM videos
GROUP BY title
HAVING COUNT(*) > 1
ORDER BY count DESC;

-- Remove duplicates, keeping the one with the lowest ROWID
DELETE FROM videos
WHERE ROWID NOT IN (
    SELECT MIN(ROWID)
    FROM videos
    GROUP BY title
);

-- Top 10 videos by views
SELECT title, views
FROM videos
ORDER BY views DESC
LIMIT 10;


-- Top 10 videos by like-to-view ratio (only for videos with more than 100,000 views)
SELECT title, (CAST(likes AS FLOAT) / NULLIF(views,0)) AS like_ratio
FROM videos
WHERE views > 100000
ORDER BY like_ratio DESC
LIMIT 10;

-- Top 10 most liked videos with channel info
SELECT title, channel_title, likes
FROM videos
ORDER BY likes DESC
LIMIT 10;



