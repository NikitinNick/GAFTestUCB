Shader "GAF/GAFMaskReset"
{
	Properties
	{
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_StencilID ("Stencil ID", Float) = 0
		_TintColor ("Tint color multiplier", Color) = (1, 1, 1, 1)
		_TintColorOffset ("Tint color offset", Vector) = (0, 0, 0, 0)
		_CustomColorMultiplier ("Color multiplier", Color) = (1,1,1,1)
		_CustomColorOffset("Color offset", Vector) = (0,0,0,0)
	}

	SubShader
	{
		Tags 
		{
			"Queue"="Transparent"
			"RenderType"="Transparent"
		}

		ColorMask 0
		ZWrite off
		Cull off
		
		Stencil 
		{
			Ref [_StencilID]
			Comp Equal
			Pass DecrSat
			Fail Keep
		}

		Pass
		{
			CGPROGRAM 
			
			#include "GAFShaderBase.cginc"

			#pragma vertex gaf_base_vert  
			#pragma fragment gaf_base_frag 
 
			ENDCG
		}
	}
}
