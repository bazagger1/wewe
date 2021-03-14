--[[
Server Name: ▌ Icefuse.net ▌ Imperial RP ▌ Custom ▌ !NEW! ▌
Server IP:   208.103.169.41:27017
File Path:   addons/[server]_body_group_editor/lua/entities/bodyman_closet/shared.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

ENT.Type = "anim"

ENT.PrintName = "Closet"
ENT.Purpose = "Opens the bodyGroupr menu"

ENT.Spawnable			= false
ENT.AdminSpawnable		= false

ENT.Category = "bodyGroupr"

ENT.WorldModel = "models/props_wasteland/controlroom_storagecloset001a.mdl"

function ENT:Initialize()

	self:SetModel( self.WorldModel )
	self:SetMoveType( MOVETYPE_VPHYSICS )   
	self:SetSolid( SOLID_VPHYSICS )         
 	
	if ( SERVER ) then self:PhysicsInit( SOLID_VPHYSICS ) end

    local phys = self:GetPhysicsObject()
	if (phys:IsValid()) then
		phys:Wake()
		phys:SetMass( 50 )
	end

	if SERVER then
		self:SetUseType( SIMPLE_USE )
		self.health = BODYMAN.ClosetHealth or 100
	end

end