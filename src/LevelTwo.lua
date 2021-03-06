LevelTwo = Class{}

local BRICK_WIDTH = 272*0.12 + 10
local MAX_SPEED = 220
local MAX_N_SPEED = -220

function LevelTwo:init()
    self.startTime = love.timer.getTime()
    self.brickLayer1 = {}
    for i = 1, 5 do
        self.newBrick = Brick(i*BRICK_WIDTH + 66, 5, false)
        table.insert(self.brickLayer1, self.newBrick)
    end 
    self.brickLayer2 = {}
    for i = 1, 7 do
        self.newBrick = Brick2(i*BRICK_WIDTH + 20, 35, false)
        table.insert(self.brickLayer2, self.newBrick)
    end
    self.brickLayer3 = {}
    for i = 1, 9 do
        self.newBrick = Brick(i*BRICK_WIDTH - 25, 65, false)
        table.insert(self.brickLayer3, self.newBrick)
    end 
end

function LevelTwo:render()
    for key, brick in pairs(self.brickLayer1) do
        brick:render()
    end
    for key, brick in pairs(self.brickLayer2) do
        brick:render()
    end
    for key, brick in pairs(self.brickLayer3) do
        brick:render()
    end
end

function LevelTwo:update(dt)
    for key, brick in pairs(self.brickLayer1) do
        if ball:breakBrick(brick) then
            sounds['wallHit']:play()
            brick.remove = brick.remove - 1
            ball.dy = -ball.dy
            if ball.dy > 0 then
                ball.y = ball.y + 5
                ball.dy = math.min(ball.dy*1.03, MAX_SPEED)
            else
                ball.y = ball.y - 5
                ball.dy = math.max(ball.dy*1.03, MAX_N_SPEED)
            end
            if brick.remove == 1 then
                brick.image = love.graphics.newImage('assets/brick2break.png')
            elseif brick.remove == 0 then
                table.remove(self.brickLayer1, key)
            end
        end
    end

    for key, brick in pairs(self.brickLayer2) do
        if ball:breakBrick(brick) then
        sounds['wallHit']:play()
            brick.remove = brick.remove - 1
            ball.dy = -ball.dy
            if ball.dy > 0 then
                ball.y = ball.y + 5
                ball.dy = math.min(ball.dy*1.03, MAX_SPEED)
            else
                ball.y = ball.y - 5
                ball.dy = math.max(ball.dy*1.03, MAX_N_SPEED)
            end
            if brick.remove == 1 then
                brick.image = love.graphics.newImage('assets/brick2break.png')
            elseif brick.remove == 0 then
                table.remove(self.brickLayer2, key)
            end
        end
    end
    for key, brick in pairs(self.brickLayer3) do
        if ball:breakBrick(brick) then
            sounds['wallHit']:play()
            brick.remove = brick.remove - 1
            ball.dy = -ball.dy
            if ball.dy > 0 then
                ball.y = ball.y + 5
                ball.dy = math.min(ball.dy*1.03, MAX_SPEED)
            else
                ball.y = ball.y - 5
                ball.dy = math.max(ball.dy*1.03, MAX_N_SPEED)
            end
            if brick.remove == 1 then
                brick.image = love.graphics.newImage('assets/brick2break.png')
            elseif brick.remove  == 0 then
                table.remove(self.brickLayer3, key)
            end
        end
    end

    if not next(self.brickLayer1) and not next(self.brickLayer2) and not next(self.brickLayer3) then
        sounds['restart']:play()
        totalTime = totalTime + levelTime
        currentLevel = 3
        result = 'won'
        gameState = 'done'
    end
end