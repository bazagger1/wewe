--[[
Server Name: ▌ Icefuse.net ▌ Imperial RP ▌ Custom ▌ !NEW! ▌
Server IP:   208.103.169.41:27017
File Path:   addons/[server]_body_group_editor/lua/entities/bodyman_closet/cl_init.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

include("shared.lua")

surface.CreateFont("bodyman_3d2d_large", {
	font = "Roboto",
	size = 128,
	weight = 800,
	antialias = true
})

surface.CreateFont("bodyman_3d2d_small", {
	font = "Roboto",
	size = 72,
	weight = 800,
	antialias = true
})

function ENT:Draw()
	self:DrawModel()

	local alpha = 255
	local viewdist = BODYMAN.ClosetViewDistance

	-- calculate alpha
	local max = viewdist
	local min = viewdist*0.75

	local dist = LocalPlayer():EyePos():Distance( self:GetPos() )

	if dist > min and dist < max then
		local frac = InverseLerp( dist, max, min )
		alpha = alpha * frac
	elseif dist > max then
		alpha = 0
	end

	local oang = self:GetAngles()
	local opos = self:GetPos()

	local ang = self:GetAngles()
	local pos = self:GetPos()

	ang:RotateAroundAxis( oang:Up(), 90 )
	ang:RotateAroundAxis( oang:Right(), -90 )
	ang:RotateAroundAxis( oang:Up(), -4)

	pos = pos + oang:Forward()*14 + oang:Up() * 20 + oang:Right() * 20

	if alpha > 0 then
		cam.Start3D2D( pos, ang, 0.025 )
			draw.SimpleText( BODYMAN.ClosetName, "bodyman_3d2d_large", 0, 0, Color(255,255,255, alpha) )
			draw.DrawText( BODYMAN.ClosetHelpText, "bodyman_3d2d_small", 0, 128, Color(255,255,255, alpha) )
		cam.End3D2D()
	end

end