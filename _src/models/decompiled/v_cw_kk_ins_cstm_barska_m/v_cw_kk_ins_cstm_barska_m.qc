// Created by Crowbar 0.29.0.0

$ModelName "weapons\attachments\v_cw_kk_ins2_cstm_barska_m.mdl"

$BodyGroup "eotech"
{
	studio "v_cw_kk_ins_cstm_barska_m_reference.smd"
}


$SurfaceProp "default"

$Contents "solid"

$MaxEyeDeflection 90

$CDMaterials "models\weapons\attachments\cw_kk_ins2_cstm_barska\"
$CDMaterials "models\weapons\upgrades\"
$CDMaterials "models\weapons\optics\"

$Attachment "reticle" "A_RenderReticle" 0 0 0 rotate 0 0 0

$CBox 0 0 0 0 0 0

$BBox -1.56 -0.602 -0.166 1.935 0.607 1.44

// $HBoxSet "default"
// $HBox 0 "Eotech" -0.602 -1.935 -0.142 0.607 1.506 1.44

$DefineBone "A_Optic" "" 0 0 0 0 -179.999966 -89.999983 0 0 0 0 0 0
$DefineBone "Eotech" "A_Optic" 0 0 0 0 -179.999966 -90.000037 0 0 0 0 0 0
$DefineBone "A_RenderReticle" "Eotech" 0.000001 0.331123 0.97879 0 -90.000099 90.000037 0 0 0 0 0 0
$DefineBone "Lense" "Eotech" 0.006024 0.743143 0.8976 0 0 0 0 0 0 0 0 0


$Sequence "idle" {
	"v_cw_kk_ins_cstm_barska_m_anims\idle.smd"
	activity "ACT_VM_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$Sequence "zoom" {
	"v_cw_kk_ins_cstm_barska_m_anims\zoom.smd"
	activity "ACT_VM_ZOOM" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}
