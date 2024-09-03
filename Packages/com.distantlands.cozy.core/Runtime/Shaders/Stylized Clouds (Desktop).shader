// Made with Amplify Shader Editor v1.9.3.2
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Distant Lands/Cozy/HDRP/Stylized Clouds (Desktop)"
{
	Properties
	{
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5

		[HideInInspector] _RenderQueueType("Render Queue Type", Float) = 1
		[HideInInspector][ToggleUI] _AddPrecomputedVelocity("Add Precomputed Velocity", Float) = 1
		//[HideInInspector] _ShadowMatteFilter("Shadow Matte Filter", Float) = 2.006836
		[HideInInspector] _StencilRef("Stencil Ref", Int) = 0 // StencilUsage.Clear
		[HideInInspector] _StencilWriteMask("Stencil Write Mask", Int) = 3 // StencilUsage.RequiresDeferredLighting | StencilUsage.SubsurfaceScattering
		[HideInInspector] _StencilRefDepth("Stencil Ref Depth", Int) = 0 // Nothing
		[HideInInspector] _StencilWriteMaskDepth("Stencil Write Mask Depth", Int) = 8 // StencilUsage.TraceReflectionRay
		[HideInInspector] _StencilRefMV("Stencil Ref MV", Int) = 32 // StencilUsage.ObjectMotionVector
		[HideInInspector] _StencilWriteMaskMV("Stencil Write Mask MV", Int) = 32 // StencilUsage.ObjectMotionVector
		[HideInInspector] _StencilRefDistortionVec("Stencil Ref Distortion Vec", Int) = 2 // StencilUsage.DistortionVectors
		[HideInInspector] _StencilWriteMaskDistortionVec("Stencil Write Mask Distortion Vec", Int) = 2 // StencilUsage.DistortionVectors
		[HideInInspector] _StencilWriteMaskGBuffer("Stencil Write Mask GBuffer", Int) = 3 // StencilUsage.RequiresDeferredLighting | StencilUsage.SubsurfaceScattering
		[HideInInspector] _StencilRefGBuffer("Stencil Ref GBuffer", Int) = 2 // StencilUsage.RequiresDeferredLighting
		[HideInInspector] _ZTestGBuffer("ZTest GBuffer", Int) = 4
		[HideInInspector][ToggleUI] _RequireSplitLighting("Require Split Lighting", Float) = 0
		[HideInInspector][ToggleUI] _ReceivesSSR("Receives SSR", Float) = 1
		[HideInInspector] _SurfaceType("Surface Type", Float) = 1
		[HideInInspector] _BlendMode("Blend Mode", Float) = 0
		[HideInInspector] _SrcBlend("Src Blend", Float) = 1
		[HideInInspector] _DstBlend("Dst Blend", Float) = 0
		[HideInInspector] _AlphaSrcBlend("Alpha Src Blend", Float) = 1
		[HideInInspector] _AlphaDstBlend("Alpha Dst Blend", Float) = 0
		[HideInInspector][ToggleUI] _ZWrite("ZWrite", Float) = 1
		[HideInInspector][ToggleUI] _TransparentZWrite("Transparent ZWrite", Float) = 0
		[HideInInspector] _CullMode("Cull Mode", Float) = 2
		[HideInInspector] _TransparentSortPriority("Transparent Sort Priority", Float) = 0
		[HideInInspector][ToggleUI] _EnableFogOnTransparent("Enable Fog", Float) = 1
		[HideInInspector] _CullModeForward("Cull Mode Forward", Float) = 2 // This mode is dedicated to Forward to correctly handle backface then front face rendering thin transparent
		[HideInInspector][Enum(UnityEditor.Rendering.HighDefinition.TransparentCullMode)] _TransparentCullMode("Transparent Cull Mode", Int) = 2// Back culling by default
		[HideInInspector] _ZTestDepthEqualForOpaque("ZTest Depth Equal For Opaque", Int) = 4 // Less equal
		[HideInInspector][Enum(UnityEngine.Rendering.CompareFunction)] _ZTestTransparent("ZTest Transparent", Int) = 4// Less equal
		[HideInInspector][ToggleUI] _TransparentBackfaceEnable("Transparent Backface Enable", Float) = 0
		[HideInInspector][ToggleUI] _AlphaCutoffEnable("Alpha Cutoff Enable", Float) = 1
		[HideInInspector][ToggleUI] _UseShadowThreshold("Use Shadow Threshold", Float) = 0
		[HideInInspector][ToggleUI] _DoubleSidedEnable("Double Sided Enable", Float) = 0
		[HideInInspector][Enum(Flip, 0, Mirror, 1, None, 2)] _DoubleSidedNormalMode("Double Sided Normal Mode", Float) = 2
		[HideInInspector] _DoubleSidedConstants("DoubleSidedConstants", Vector) = (1,1,-1,0)
		[HideInInspector] _DistortionEnable("_DistortionEnable",Float) = 0
		[HideInInspector] _DistortionOnly("_DistortionOnly",Float) = 0

		//_TessPhongStrength( "Tess Phong Strength", Range( 0, 1 ) ) = 0.5
		//_TessValue( "Tess Max Tessellation", Range( 1, 32 ) ) = 16
		//_TessMin( "Tess Min Distance", Float ) = 10
		//_TessMax( "Tess Max Distance", Float ) = 25
		//_TessEdgeLength ( "Tess Edge length", Range( 2, 50 ) ) = 16
		//_TessMaxDisp( "Tess Max Displacement", Float ) = 25

		[HideInInspector][ToggleUI] _TransparentWritingMotionVec("Transparent Writing MotionVec", Float) = 0
		[HideInInspector][Enum(UnityEditor.Rendering.HighDefinition.OpaqueCullMode)] _OpaqueCullMode("Opaque Cull Mode", Int) = 2 // Back culling by default
		[HideInInspector][ToggleUI] _SupportDecals("Support Decals", Float) = 1
		[HideInInspector][ToggleUI] _ReceivesSSRTransparent("Receives SSR Transparent", Float) = 0
		[HideInInspector] _EmissionColor("Color", Color) = (1, 1, 1)
		[HideInInspector] _UnlitColorMap_MipInfo("_UnlitColorMap_MipInfo", Vector) = (0, 0, 0, 0)

		[HideInInspector][Enum(Auto, 0, On, 1, Off, 2)] _DoubleSidedGIMode("Double sided GI mode", Float) = 0 //DoubleSidedGIMode added in api 12x and higher
	}

	SubShader
	{
		LOD 0

		

		Tags { "RenderPipeline"="HDRenderPipeline" "RenderType"="Opaque" "Queue"="Transparent" }

		HLSLINCLUDE
		#pragma target 4.5
		#pragma exclude_renderers glcore gles gles3 ps4 ps5 

		#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
		#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Filtering.hlsl"

		#ifndef ASE_TESS_FUNCS
		#define ASE_TESS_FUNCS
		float4 FixedTess( float tessValue )
		{
			return tessValue;
		}

		float CalcDistanceTessFactor (float4 vertex, float minDist, float maxDist, float tess, float4x4 o2w, float3 cameraPos )
		{
			float3 wpos = mul(o2w,vertex).xyz;
			float dist = distance (wpos, cameraPos);
			float f = clamp(1.0 - (dist - minDist) / (maxDist - minDist), 0.01, 1.0) * tess;
			return f;
		}

		float4 CalcTriEdgeTessFactors (float3 triVertexFactors)
		{
			float4 tess;
			tess.x = 0.5 * (triVertexFactors.y + triVertexFactors.z);
			tess.y = 0.5 * (triVertexFactors.x + triVertexFactors.z);
			tess.z = 0.5 * (triVertexFactors.x + triVertexFactors.y);
			tess.w = (triVertexFactors.x + triVertexFactors.y + triVertexFactors.z) / 3.0f;
			return tess;
		}

		float CalcEdgeTessFactor (float3 wpos0, float3 wpos1, float edgeLen, float3 cameraPos, float4 scParams )
		{
			float dist = distance (0.5 * (wpos0+wpos1), cameraPos);
			float len = distance(wpos0, wpos1);
			float f = max(len * scParams.y / (edgeLen * dist), 1.0);
			return f;
		}

		float DistanceFromPlaneASE (float3 pos, float4 plane)
		{
			return dot (float4(pos,1.0f), plane);
		}

		bool WorldViewFrustumCull (float3 wpos0, float3 wpos1, float3 wpos2, float cullEps, float4 planes[6] )
		{
			float4 planeTest;
			planeTest.x = (( DistanceFromPlaneASE(wpos0, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos1, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos2, planes[0]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.y = (( DistanceFromPlaneASE(wpos0, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos1, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos2, planes[1]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.z = (( DistanceFromPlaneASE(wpos0, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos1, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos2, planes[2]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.w = (( DistanceFromPlaneASE(wpos0, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos1, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos2, planes[3]) > -cullEps) ? 1.0f : 0.0f );
			return !all (planeTest);
		}

		float4 DistanceBasedTess( float4 v0, float4 v1, float4 v2, float tess, float minDist, float maxDist, float4x4 o2w, float3 cameraPos )
		{
			float3 f;
			f.x = CalcDistanceTessFactor (v0,minDist,maxDist,tess,o2w,cameraPos);
			f.y = CalcDistanceTessFactor (v1,minDist,maxDist,tess,o2w,cameraPos);
			f.z = CalcDistanceTessFactor (v2,minDist,maxDist,tess,o2w,cameraPos);

			return CalcTriEdgeTessFactors (f);
		}

		float4 EdgeLengthBasedTess( float4 v0, float4 v1, float4 v2, float edgeLength, float4x4 o2w, float3 cameraPos, float4 scParams )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;
			tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
			tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
			tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
			tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			return tess;
		}

		float4 EdgeLengthBasedTessCull( float4 v0, float4 v1, float4 v2, float edgeLength, float maxDisplacement, float4x4 o2w, float3 cameraPos, float4 scParams, float4 planes[6] )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;

			if (WorldViewFrustumCull(pos0, pos1, pos2, maxDisplacement, planes))
			{
				tess = 0.0f;
			}
			else
			{
				tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
				tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
				tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
				tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			}
			return tess;
		}
		#endif //ASE_TESS_FUNCS
		ENDHLSL

		
		Pass
		{
			
			Name "Forward Unlit"
			Tags { "LightMode"="ForwardOnly" }

			Blend [_SrcBlend] [_DstBlend], [_AlphaSrcBlend] [_AlphaDstBlend]

			Cull Front
			ZTest [_ZTestDepthEqualForOpaque]
			ZWrite [_ZWrite]

			ColorMask [_ColorMaskTransparentVel] 1

			Stencil
			{
				Ref [_StencilRef]
				WriteMask [_StencilWriteMask]
				Comp Always
				Pass Replace
			}


			HLSLPROGRAM

			#pragma shader_feature_local_fragment _ENABLE_FOG_ON_TRANSPARENT
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#define ASE_SRP_VERSION 120108


			#pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _ALPHATEST_ON

			#pragma multi_compile _ DEBUG_DISPLAY
			#pragma multi_compile _ DOTS_INSTANCING_ON

			#pragma vertex Vert
			#pragma fragment Frag

	        #if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
	        #define _WRITE_TRANSPARENT_MOTION_VECTOR
	        #endif

			#define SHADERPASS SHADERPASS_FORWARD_UNLIT

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
            #include "Packages/com.unity.shadergraph/ShaderGraphLibrary/Functions.hlsl"

			#if defined(_ENABLE_SHADOW_MATTE) && SHADERPASS == SHADERPASS_FORWARD_UNLIT
				#define LIGHTLOOP_DISABLE_TILE_AND_CLUSTER
				#define HAS_LIGHTLOOP
				#define SHADOW_OPTIMIZE_REGISTER_USAGE 1

				#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/CommonLighting.hlsl"
				#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/Shadow/HDShadowContext.hlsl"
				#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/LightLoop/HDShadow.hlsl"
				#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/LightLoop/LightLoopDef.hlsl"
				#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/PunctualLightCommon.hlsl"
				#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/LightLoop/HDShadowLoop.hlsl"
			#endif

			CBUFFER_START( UnityPerMaterial )
						float4 _EmissionColor;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			#ifdef _ENABLE_SHADOW_MATTE
			float _ShadowMatteFilter;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _AlphaCutoff;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			float _EnableBlendModePreserveSpecularLighting;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			float4 CZY_CloudColor;
			float CZY_FilterSaturation;
			float CZY_FilterValue;
			float4 CZY_FilterColor;
			float4 CZY_CloudFilterColor;
			float4 CZY_CloudHighlightColor;
			float4 CZY_SunFilterColor;
			float CZY_WindSpeed;
			float CZY_MainCloudScale;
			float CZY_CumulusCoverageMultiplier;
			float3 CZY_SunDirection;
			half CZY_SunFlareFalloff;
			float3 CZY_MoonDirection;
			half CZY_CloudMoonFalloff;
			float4 CZY_CloudMoonColor;
			float CZY_DetailScale;
			float CZY_DetailAmount;
			float CZY_BorderHeight;
			float CZY_BorderVariation;
			float CZY_BorderEffect;
			float3 CZY_StormDirection;
			float CZY_NimbusHeight;
			float CZY_NimbusMultiplier;
			float CZY_NimbusVariation;
			sampler2D CZY_ChemtrailsTexture;
			float CZY_ChemtrailsMoveSpeed;
			float CZY_ChemtrailsMultiplier;
			sampler2D CZY_CirrusTexture;
			float CZY_CirrusMoveSpeed;
			float CZY_CirrusMultiplier;
			float CZY_ClippingThreshold;
			float4 CZY_AltoCloudColor;
			sampler2D CZY_AltocumulusTexture;
			float2 CZY_AltocumulusWindSpeed;
			float CZY_AltocumulusScale;
			float CZY_AltocumulusMultiplier;
			sampler2D CZY_CirrostratusTexture;
			float CZY_CirrostratusMoveSpeed;
			float CZY_CirrostratusMultiplier;


			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Unlit/Unlit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			#define ASE_NEEDS_FRAG_RELATIVE_WORLD_POS


			struct VertexInput
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_Position;
				float3 positionRWS : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			float3 HSVToRGB( float3 c )
			{
				float4 K = float4( 1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0 );
				float3 p = abs( frac( c.xxx + K.xyz ) * 6.0 - K.www );
				return c.z * lerp( K.xxx, saturate( p - K.xxx ), c.y );
			}
			
			float3 RGBToHSV(float3 c)
			{
				float4 K = float4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
				float4 p = lerp( float4( c.bg, K.wz ), float4( c.gb, K.xy ), step( c.b, c.g ) );
				float4 q = lerp( float4( p.xyw, c.r ), float4( c.r, p.yzx ), step( p.x, c.r ) );
				float d = q.x - min( q.w, q.y );
				float e = 1.0e-10;
				return float3( abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
			}
			float3 mod2D289( float3 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }
			float2 mod2D289( float2 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }
			float3 permute( float3 x ) { return mod2D289( ( ( x * 34.0 ) + 1.0 ) * x ); }
			float snoise( float2 v )
			{
				const float4 C = float4( 0.211324865405187, 0.366025403784439, -0.577350269189626, 0.024390243902439 );
				float2 i = floor( v + dot( v, C.yy ) );
				float2 x0 = v - i + dot( i, C.xx );
				float2 i1;
				i1 = ( x0.x > x0.y ) ? float2( 1.0, 0.0 ) : float2( 0.0, 1.0 );
				float4 x12 = x0.xyxy + C.xxzz;
				x12.xy -= i1;
				i = mod2D289( i );
				float3 p = permute( permute( i.y + float3( 0.0, i1.y, 1.0 ) ) + i.x + float3( 0.0, i1.x, 1.0 ) );
				float3 m = max( 0.5 - float3( dot( x0, x0 ), dot( x12.xy, x12.xy ), dot( x12.zw, x12.zw ) ), 0.0 );
				m = m * m;
				m = m * m;
				float3 x = 2.0 * frac( p * C.www ) - 1.0;
				float3 h = abs( x ) - 0.5;
				float3 ox = floor( x + 0.5 );
				float3 a0 = x - ox;
				m *= 1.79284291400159 - 0.85373472095314 * ( a0 * a0 + h * h );
				float3 g;
				g.x = a0.x * x0.x + h.x * x0.y;
				g.yz = a0.yz * x12.xz + h.yz * x12.yw;
				return 130.0 * dot( m, g );
			}
			
					float2 voronoihash81_g5( float2 p )
					{
						
						p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
						return frac( sin( p ) *43758.5453);
					}
			
					float voronoi81_g5( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
					{
						float2 n = floor( v );
						float2 f = frac( v );
						float F1 = 8.0;
						float F2 = 8.0; float2 mg = 0;
						for ( int j = -1; j <= 1; j++ )
						{
							for ( int i = -1; i <= 1; i++ )
						 	{
						 		float2 g = float2( i, j );
						 		float2 o = voronoihash81_g5( n + g );
								o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
								float d = 0.5 * dot( r, r );
						 		if( d<F1 ) {
						 			F2 = F1;
						 			F1 = d; mg = g; mr = r; id = o;
						 		} else if( d<F2 ) {
						 			F2 = d;
						
						 		}
						 	}
						}
						return (F2 + F1) * 0.5;
					}
			
					float2 voronoihash88_g5( float2 p )
					{
						
						p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
						return frac( sin( p ) *43758.5453);
					}
			
					float voronoi88_g5( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
					{
						float2 n = floor( v );
						float2 f = frac( v );
						float F1 = 8.0;
						float F2 = 8.0; float2 mg = 0;
						for ( int j = -1; j <= 1; j++ )
						{
							for ( int i = -1; i <= 1; i++ )
						 	{
						 		float2 g = float2( i, j );
						 		float2 o = voronoihash88_g5( n + g );
								o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
								float d = 0.5 * dot( r, r );
						 		if( d<F1 ) {
						 			F2 = F1;
						 			F1 = d; mg = g; mr = r; id = o;
						 		} else if( d<F2 ) {
						 			F2 = d;
						
						 		}
						 	}
						}
						return (F2 + F1) * 0.5;
					}
			
					float2 voronoihash200_g5( float2 p )
					{
						
						p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
						return frac( sin( p ) *43758.5453);
					}
			
					float voronoi200_g5( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
					{
						float2 n = floor( v );
						float2 f = frac( v );
						float F1 = 8.0;
						float F2 = 8.0; float2 mg = 0;
						for ( int j = -1; j <= 1; j++ )
						{
							for ( int i = -1; i <= 1; i++ )
						 	{
						 		float2 g = float2( i, j );
						 		float2 o = voronoihash200_g5( n + g );
								o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
								float d = 0.5 * dot( r, r );
						 		if( d<F1 ) {
						 			F2 = F1;
						 			F1 = d; mg = g; mr = r; id = o;
						 		} else if( d<F2 ) {
						 			F2 = d;
						
						 		}
						 	}
						}
						return (F2 + F1) * 0.5;
					}
			
					float2 voronoihash232_g5( float2 p )
					{
						
						p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
						return frac( sin( p ) *43758.5453);
					}
			
					float voronoi232_g5( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
					{
						float2 n = floor( v );
						float2 f = frac( v );
						float F1 = 8.0;
						float F2 = 8.0; float2 mg = 0;
						for ( int j = -1; j <= 1; j++ )
						{
							for ( int i = -1; i <= 1; i++ )
						 	{
						 		float2 g = float2( i, j );
						 		float2 o = voronoihash232_g5( n + g );
								o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
								float d = 0.5 * dot( r, r );
						 		if( d<F1 ) {
						 			F2 = F1;
						 			F1 = d; mg = g; mr = r; id = o;
						 		} else if( d<F2 ) {
						 			F2 = d;
						
						 		}
						 	}
						}
						return F1;
					}
			
					float2 voronoihash84_g5( float2 p )
					{
						
						p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
						return frac( sin( p ) *43758.5453);
					}
			
					float voronoi84_g5( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
					{
						float2 n = floor( v );
						float2 f = frac( v );
						float F1 = 8.0;
						float F2 = 8.0; float2 mg = 0;
						for ( int j = -1; j <= 1; j++ )
						{
							for ( int i = -1; i <= 1; i++ )
						 	{
						 		float2 g = float2( i, j );
						 		float2 o = voronoihash84_g5( n + g );
								o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
								float d = 0.5 * dot( r, r );
						 		if( d<F1 ) {
						 			F2 = F1;
						 			F1 = d; mg = g; mr = r; id = o;
						 		} else if( d<F2 ) {
						 			F2 = d;
						
						 		}
						 	}
						}
						return F1;
					}
			

			struct SurfaceDescription
			{
				float3 Color;
				float3 Emission;
				float4 ShadowTint;
				float Alpha;
				float AlphaClipThreshold;
				float4 VTPackedFeedback;
			};

			void BuildSurfaceData(FragInputs fragInputs, SurfaceDescription surfaceDescription, float3 V, out SurfaceData surfaceData)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);
				surfaceData.color = surfaceDescription.Color;
			}

			void GetSurfaceAndBuiltinData(SurfaceDescription surfaceDescription , FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
                LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
                #endif

				#if _ALPHATEST_ON
				DoAlphaTest ( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#if _DEPTHOFFSET_ON
                ApplyDepthOffsetPositionInput(V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput);
                #endif

				BuildSurfaceData(fragInputs, surfaceDescription, V, surfaceData);

				#ifdef WRITE_NORMAL_BUFFER
				surfaceData.normalWS = fragInputs.tangentToWorld[2];
				#endif

				#if defined(_ENABLE_SHADOW_MATTE) && SHADERPASS == SHADERPASS_FORWARD_UNLIT
					HDShadowContext shadowContext = InitShadowContext();
					float shadow;
					float3 shadow3;
					posInput = GetPositionInput(fragInputs.positionSS.xy, _ScreenSize.zw, fragInputs.positionSS.z, UNITY_MATRIX_I_VP, UNITY_MATRIX_V);
					float3 normalWS = normalize(fragInputs.tangentToWorld[1]);
					uint renderingLayers = _EnableLightLayers ? asuint(unity_RenderingLayer.x) : DEFAULT_LIGHT_LAYERS;
					ShadowLoopMin(shadowContext, posInput, normalWS, asuint(_ShadowMatteFilter), renderingLayers, shadow3);
					shadow = dot(shadow3, float3(1.0f/3.0f, 1.0f/3.0f, 1.0f/3.0f));

					float4 shadowColor = (1 - shadow)*surfaceDescription.ShadowTint.rgba;
					float  localAlpha  = saturate(shadowColor.a + surfaceDescription.Alpha);

					#ifdef _SURFACE_TYPE_TRANSPARENT
						surfaceData.color = lerp(shadowColor.rgb*surfaceData.color, lerp(lerp(shadowColor.rgb, surfaceData.color, 1 - surfaceDescription.ShadowTint.a), surfaceData.color, shadow), surfaceDescription.Alpha);
					#else
						surfaceData.color = lerp(lerp(shadowColor.rgb, surfaceData.color, 1 - surfaceDescription.ShadowTint.a), surfaceData.color, shadow);
					#endif
					localAlpha = ApplyBlendMode(surfaceData.color, localAlpha).a;
					surfaceDescription.Alpha = localAlpha;
				#endif

				ZERO_INITIALIZE(BuiltinData, builtinData);
				builtinData.opacity = surfaceDescription.Alpha;

				#if defined(DEBUG_DISPLAY)
					builtinData.renderingLayers = GetMeshRenderingLightLayer();
				#endif

                #ifdef _ALPHATEST_ON
                    builtinData.alphaClipTreshold = surfaceDescription.AlphaClipThreshold;
                #endif

				builtinData.emissiveColor = surfaceDescription.Emission;

				#ifdef UNITY_VIRTUAL_TEXTURING
                builtinData.vtPackedFeedback = surfaceDescription.VTPackedFeedback;
                #endif

				#if _DEPTHOFFSET_ON
                builtinData.depthOffset = surfaceDescription.DepthOffset;
                #endif

                ApplyDebugToBuiltinData(builtinData);
			}

			float GetDeExposureMultiplier()
			{
			#if defined(DISABLE_UNLIT_DEEXPOSURE)
				return 1.0;
			#else
				return _DeExposureMultiplier;
			#endif
			}

			VertexOutput VertexFunction( VertexInput inputMesh  )
			{
				VertexOutput o;
				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				o.ase_texcoord1.xy = inputMesh.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord1.zw = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = defaultVertexValue;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS = inputMesh.normalOS;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				o.positionCS = TransformWorldToHClip(positionRWS);
				o.positionRWS = positionRWS;
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput Vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			#ifdef UNITY_VIRTUAL_TEXTURING
			#define VT_BUFFER_TARGET SV_Target1
			#define EXTRA_BUFFER_TARGET SV_Target2
			#else
			#define EXTRA_BUFFER_TARGET SV_Target1
			#endif

			void Frag( VertexOutput packedInput,
						out float4 outColor : SV_Target0
						#ifdef UNITY_VIRTUAL_TEXTURING
						,out float4 outVTFeedback : VT_BUFFER_TARGET
						#endif
						#ifdef _DEPTHOFFSET_ON
						, out float outputDepth : DEPTH_OFFSET_SEMANTIC
						#endif
					
					)
			{
				UNITY_SETUP_INSTANCE_ID( packedInput );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.tangentToWorld = k_identity3x3;
				float3 positionRWS = packedInput.positionRWS;

				input.positionSS = packedInput.positionCS;
				input.positionRWS = positionRWS;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

				float3 V = GetWorldSpaceNormalizeViewDir( input.positionRWS );

				SurfaceDescription surfaceDescription = (SurfaceDescription)0;
				float3 hsvTorgb2_g7 = RGBToHSV( CZY_CloudColor.rgb );
				float3 hsvTorgb3_g7 = HSVToRGB( float3(hsvTorgb2_g7.x,saturate( ( hsvTorgb2_g7.y + CZY_FilterSaturation ) ),( hsvTorgb2_g7.z + CZY_FilterValue )) );
				float4 temp_output_10_0_g7 = ( float4( hsvTorgb3_g7 , 0.0 ) * CZY_FilterColor );
				float4 CloudColor41_g5 = ( temp_output_10_0_g7 * CZY_CloudFilterColor );
				float3 hsvTorgb2_g6 = RGBToHSV( CZY_CloudHighlightColor.rgb );
				float3 hsvTorgb3_g6 = HSVToRGB( float3(hsvTorgb2_g6.x,saturate( ( hsvTorgb2_g6.y + CZY_FilterSaturation ) ),( hsvTorgb2_g6.z + CZY_FilterValue )) );
				float4 temp_output_10_0_g6 = ( float4( hsvTorgb3_g6 , 0.0 ) * CZY_FilterColor );
				float4 CloudHighlightColor55_g5 = ( temp_output_10_0_g6 * CZY_SunFilterColor );
				float2 texCoord31_g5 = packedInput.ase_texcoord1.xy * float2( 1,1 ) + float2( 0,0 );
				float2 Pos33_g5 = texCoord31_g5;
				float mulTime29_g5 = _TimeParameters.x * ( 0.001 * CZY_WindSpeed );
				float TIme30_g5 = mulTime29_g5;
				float simplePerlin2D409_g5 = snoise( ( Pos33_g5 + ( TIme30_g5 * float2( 0.2,-0.4 ) ) )*( 100.0 / CZY_MainCloudScale ) );
				simplePerlin2D409_g5 = simplePerlin2D409_g5*0.5 + 0.5;
				float SimpleCloudDensity153_g5 = simplePerlin2D409_g5;
				float time81_g5 = 0.0;
				float2 voronoiSmoothId81_g5 = 0;
				float2 temp_output_94_0_g5 = ( Pos33_g5 + ( TIme30_g5 * float2( 0.3,0.2 ) ) );
				float2 coords81_g5 = temp_output_94_0_g5 * ( 140.0 / CZY_MainCloudScale );
				float2 id81_g5 = 0;
				float2 uv81_g5 = 0;
				float voroi81_g5 = voronoi81_g5( coords81_g5, time81_g5, id81_g5, uv81_g5, 0, voronoiSmoothId81_g5 );
				float time88_g5 = 0.0;
				float2 voronoiSmoothId88_g5 = 0;
				float2 coords88_g5 = temp_output_94_0_g5 * ( 500.0 / CZY_MainCloudScale );
				float2 id88_g5 = 0;
				float2 uv88_g5 = 0;
				float voroi88_g5 = voronoi88_g5( coords88_g5, time88_g5, id88_g5, uv88_g5, 0, voronoiSmoothId88_g5 );
				float2 appendResult95_g5 = (float2(voroi81_g5 , voroi88_g5));
				float2 VoroDetails109_g5 = appendResult95_g5;
				float CumulusCoverage34_g5 = CZY_CumulusCoverageMultiplier;
				float ComplexCloudDensity141_g5 = (0.0 + (min( SimpleCloudDensity153_g5 , ( 1.0 - VoroDetails109_g5.x ) ) - ( 1.0 - CumulusCoverage34_g5 )) * (1.0 - 0.0) / (1.0 - ( 1.0 - CumulusCoverage34_g5 )));
				float4 lerpResult315_g5 = lerp( CloudHighlightColor55_g5 , CloudColor41_g5 , saturate( (2.0 + (ComplexCloudDensity141_g5 - 0.0) * (0.7 - 2.0) / (1.0 - 0.0)) ));
				float3 ase_worldPos = GetAbsolutePositionWS( positionRWS );
				float3 normalizeResult40_g5 = normalize( ( ase_worldPos - _WorldSpaceCameraPos ) );
				float dotResult42_g5 = dot( normalizeResult40_g5 , CZY_SunDirection );
				float temp_output_49_0_g5 = abs( (dotResult42_g5*0.5 + 0.5) );
				half LightMask56_g5 = saturate( pow( temp_output_49_0_g5 , CZY_SunFlareFalloff ) );
				float time200_g5 = 0.0;
				float2 voronoiSmoothId200_g5 = 0;
				float mulTime163_g5 = _TimeParameters.x * 0.003;
				float2 coords200_g5 = (Pos33_g5*1.0 + ( float2( 1,-2 ) * mulTime163_g5 )) * 10.0;
				float2 id200_g5 = 0;
				float2 uv200_g5 = 0;
				float voroi200_g5 = voronoi200_g5( coords200_g5, time200_g5, id200_g5, uv200_g5, 0, voronoiSmoothId200_g5 );
				float time232_g5 = ( 10.0 * mulTime163_g5 );
				float2 voronoiSmoothId232_g5 = 0;
				float2 coords232_g5 = packedInput.ase_texcoord1.xy * 10.0;
				float2 id232_g5 = 0;
				float2 uv232_g5 = 0;
				float voroi232_g5 = voronoi232_g5( coords232_g5, time232_g5, id232_g5, uv232_g5, 0, voronoiSmoothId232_g5 );
				float AltoCumulusPlacement376_g5 = saturate( ( ( ( 1.0 - 0.0 ) - (1.0 + (voroi200_g5 - 0.0) * (-0.5 - 1.0) / (1.0 - 0.0)) ) - voroi232_g5 ) );
				float CloudThicknessDetails286_g5 = ( VoroDetails109_g5.y * saturate( ( AltoCumulusPlacement376_g5 - 0.8 ) ) );
				float3 normalizeResult43_g5 = normalize( ( ase_worldPos - _WorldSpaceCameraPos ) );
				float dotResult46_g5 = dot( normalizeResult43_g5 , CZY_MoonDirection );
				half MoonlightMask57_g5 = saturate( pow( abs( (dotResult46_g5*0.5 + 0.5) ) , CZY_CloudMoonFalloff ) );
				float3 hsvTorgb2_g8 = RGBToHSV( CZY_CloudMoonColor.rgb );
				float3 hsvTorgb3_g8 = HSVToRGB( float3(hsvTorgb2_g8.x,saturate( ( hsvTorgb2_g8.y + CZY_FilterSaturation ) ),( hsvTorgb2_g8.z + CZY_FilterValue )) );
				float4 temp_output_10_0_g8 = ( float4( hsvTorgb3_g8 , 0.0 ) * CZY_FilterColor );
				float4 MoonlightColor60_g5 = ( temp_output_10_0_g8 * CZY_CloudFilterColor );
				float4 lerpResult338_g5 = lerp( ( lerpResult315_g5 + ( LightMask56_g5 * CloudHighlightColor55_g5 * ( 1.0 - CloudThicknessDetails286_g5 ) ) + ( MoonlightMask57_g5 * MoonlightColor60_g5 * ( 1.0 - CloudThicknessDetails286_g5 ) ) ) , ( CloudColor41_g5 * float4( 0.5660378,0.5660378,0.5660378,0 ) ) , CloudThicknessDetails286_g5);
				float time84_g5 = 0.0;
				float2 voronoiSmoothId84_g5 = 0;
				float2 coords84_g5 = ( Pos33_g5 + ( TIme30_g5 * float2( 0.3,0.2 ) ) ) * ( 100.0 / CZY_DetailScale );
				float2 id84_g5 = 0;
				float2 uv84_g5 = 0;
				float fade84_g5 = 0.5;
				float voroi84_g5 = 0;
				float rest84_g5 = 0;
				for( int it84_g5 = 0; it84_g5 <3; it84_g5++ ){
				voroi84_g5 += fade84_g5 * voronoi84_g5( coords84_g5, time84_g5, id84_g5, uv84_g5, 0,voronoiSmoothId84_g5 );
				rest84_g5 += fade84_g5;
				coords84_g5 *= 2;
				fade84_g5 *= 0.5;
				}//Voronoi84_g5
				voroi84_g5 /= rest84_g5;
				float temp_output_173_0_g5 = ( (0.0 + (( 1.0 - voroi84_g5 ) - 0.3) * (0.5 - 0.0) / (1.0 - 0.3)) * 0.1 * CZY_DetailAmount );
				float DetailedClouds252_g5 = saturate( ( ComplexCloudDensity141_g5 + temp_output_173_0_g5 ) );
				float CloudDetail179_g5 = temp_output_173_0_g5;
				float2 texCoord79_g5 = packedInput.ase_texcoord1.xy * float2( 1,1 ) + float2( 0,0 );
				float2 temp_output_161_0_g5 = ( texCoord79_g5 - float2( 0.5,0.5 ) );
				float dotResult212_g5 = dot( temp_output_161_0_g5 , temp_output_161_0_g5 );
				float BorderHeight154_g5 = ( 1.0 - CZY_BorderHeight );
				float temp_output_151_0_g5 = ( -2.0 * ( 1.0 - CZY_BorderVariation ) );
				float clampResult247_g5 = clamp( ( ( ( CloudDetail179_g5 + SimpleCloudDensity153_g5 ) * saturate( (( BorderHeight154_g5 * temp_output_151_0_g5 ) + (dotResult212_g5 - 0.0) * (( temp_output_151_0_g5 * -4.0 ) - ( BorderHeight154_g5 * temp_output_151_0_g5 )) / (0.5 - 0.0)) ) ) * 10.0 * CZY_BorderEffect ) , -1.0 , 1.0 );
				float BorderLightTransport278_g5 = clampResult247_g5;
				float3 normalizeResult116_g5 = normalize( ( ase_worldPos - _WorldSpaceCameraPos ) );
				float3 normalizeResult146_g5 = normalize( CZY_StormDirection );
				float dotResult150_g5 = dot( normalizeResult116_g5 , normalizeResult146_g5 );
				float2 texCoord98_g5 = packedInput.ase_texcoord1.xy * float2( 1,1 ) + float2( 0,0 );
				float2 temp_output_124_0_g5 = ( texCoord98_g5 - float2( 0.5,0.5 ) );
				float dotResult125_g5 = dot( temp_output_124_0_g5 , temp_output_124_0_g5 );
				float temp_output_140_0_g5 = ( -2.0 * ( 1.0 - ( CZY_NimbusVariation * 0.9 ) ) );
				float NimbusLightTransport269_g5 = saturate( ( ( ( CloudDetail179_g5 + SimpleCloudDensity153_g5 ) * saturate( (( ( 1.0 - CZY_NimbusMultiplier ) * temp_output_140_0_g5 ) + (( dotResult150_g5 + ( CZY_NimbusHeight * 4.0 * dotResult125_g5 ) ) - 0.5) * (( temp_output_140_0_g5 * -4.0 ) - ( ( 1.0 - CZY_NimbusMultiplier ) * temp_output_140_0_g5 )) / (7.0 - 0.5)) ) ) * 10.0 ) );
				float mulTime104_g5 = _TimeParameters.x * 0.01;
				float simplePerlin2D143_g5 = snoise( (Pos33_g5*1.0 + mulTime104_g5)*2.0 );
				float mulTime93_g5 = _TimeParameters.x * CZY_ChemtrailsMoveSpeed;
				float cos97_g5 = cos( ( mulTime93_g5 * 0.01 ) );
				float sin97_g5 = sin( ( mulTime93_g5 * 0.01 ) );
				float2 rotator97_g5 = mul( Pos33_g5 - float2( 0.5,0.5 ) , float2x2( cos97_g5 , -sin97_g5 , sin97_g5 , cos97_g5 )) + float2( 0.5,0.5 );
				float cos131_g5 = cos( ( mulTime93_g5 * -0.02 ) );
				float sin131_g5 = sin( ( mulTime93_g5 * -0.02 ) );
				float2 rotator131_g5 = mul( Pos33_g5 - float2( 0.5,0.5 ) , float2x2( cos131_g5 , -sin131_g5 , sin131_g5 , cos131_g5 )) + float2( 0.5,0.5 );
				float mulTime107_g5 = _TimeParameters.x * 0.01;
				float simplePerlin2D147_g5 = snoise( (Pos33_g5*1.0 + mulTime107_g5)*4.0 );
				float4 ChemtrailsPattern210_g5 = ( ( saturate( simplePerlin2D143_g5 ) * tex2D( CZY_ChemtrailsTexture, (rotator97_g5*0.5 + 0.0) ) ) + ( tex2D( CZY_ChemtrailsTexture, rotator131_g5 ) * saturate( simplePerlin2D147_g5 ) ) );
				float2 texCoord139_g5 = packedInput.ase_texcoord1.xy * float2( 1,1 ) + float2( 0,0 );
				float2 temp_output_162_0_g5 = ( texCoord139_g5 - float2( 0.5,0.5 ) );
				float dotResult207_g5 = dot( temp_output_162_0_g5 , temp_output_162_0_g5 );
				float ChemtrailsFinal248_g5 = ( ( ChemtrailsPattern210_g5 * saturate( (0.4 + (dotResult207_g5 - 0.0) * (2.0 - 0.4) / (0.1 - 0.0)) ) ).r > ( 1.0 - ( CZY_ChemtrailsMultiplier * 0.5 ) ) ? 1.0 : 0.0 );
				float mulTime80_g5 = _TimeParameters.x * 0.01;
				float simplePerlin2D126_g5 = snoise( (Pos33_g5*1.0 + mulTime80_g5)*2.0 );
				float mulTime75_g5 = _TimeParameters.x * CZY_CirrusMoveSpeed;
				float cos101_g5 = cos( ( mulTime75_g5 * 0.01 ) );
				float sin101_g5 = sin( ( mulTime75_g5 * 0.01 ) );
				float2 rotator101_g5 = mul( Pos33_g5 - float2( 0.5,0.5 ) , float2x2( cos101_g5 , -sin101_g5 , sin101_g5 , cos101_g5 )) + float2( 0.5,0.5 );
				float cos112_g5 = cos( ( mulTime75_g5 * -0.02 ) );
				float sin112_g5 = sin( ( mulTime75_g5 * -0.02 ) );
				float2 rotator112_g5 = mul( Pos33_g5 - float2( 0.5,0.5 ) , float2x2( cos112_g5 , -sin112_g5 , sin112_g5 , cos112_g5 )) + float2( 0.5,0.5 );
				float mulTime135_g5 = _TimeParameters.x * 0.01;
				float simplePerlin2D122_g5 = snoise( (Pos33_g5*1.0 + mulTime135_g5) );
				simplePerlin2D122_g5 = simplePerlin2D122_g5*0.5 + 0.5;
				float4 CirrusPattern137_g5 = ( ( saturate( simplePerlin2D126_g5 ) * tex2D( CZY_CirrusTexture, (rotator101_g5*1.5 + 0.75) ) ) + ( tex2D( CZY_CirrusTexture, (rotator112_g5*1.0 + 0.0) ) * saturate( simplePerlin2D122_g5 ) ) );
				float2 texCoord134_g5 = packedInput.ase_texcoord1.xy * float2( 1,1 ) + float2( 0,0 );
				float2 temp_output_164_0_g5 = ( texCoord134_g5 - float2( 0.5,0.5 ) );
				float dotResult157_g5 = dot( temp_output_164_0_g5 , temp_output_164_0_g5 );
				float4 temp_output_217_0_g5 = ( CirrusPattern137_g5 * saturate( (0.0 + (dotResult157_g5 - 0.0) * (2.0 - 0.0) / (0.2 - 0.0)) ) );
				float Clipping208_g5 = CZY_ClippingThreshold;
				float CirrusAlpha250_g5 = ( ( temp_output_217_0_g5 * ( CZY_CirrusMultiplier * 10.0 ) ).r > Clipping208_g5 ? 1.0 : 0.0 );
				float SimpleRadiance268_g5 = saturate( ( DetailedClouds252_g5 + BorderLightTransport278_g5 + NimbusLightTransport269_g5 + ChemtrailsFinal248_g5 + CirrusAlpha250_g5 ) );
				float4 lerpResult342_g5 = lerp( CloudColor41_g5 , lerpResult338_g5 , ( 1.0 - SimpleRadiance268_g5 ));
				float CloudLight52_g5 = saturate( pow( temp_output_49_0_g5 , CZY_SunFlareFalloff ) );
				float4 lerpResult316_g5 = lerp( float4( 0,0,0,0 ) , CloudHighlightColor55_g5 , ( saturate( ( AltoCumulusPlacement376_g5 - 1.0 ) ) * CloudDetail179_g5 * CloudLight52_g5 ));
				float4 SunThroughClouds399_g5 = ( lerpResult316_g5 * 1.3 );
				float3 hsvTorgb2_g9 = RGBToHSV( CZY_AltoCloudColor.rgb );
				float3 hsvTorgb3_g9 = HSVToRGB( float3(hsvTorgb2_g9.x,saturate( ( hsvTorgb2_g9.y + CZY_FilterSaturation ) ),( hsvTorgb2_g9.z + CZY_FilterValue )) );
				float4 temp_output_10_0_g9 = ( float4( hsvTorgb3_g9 , 0.0 ) * CZY_FilterColor );
				float4 CirrusCustomLightColor350_g5 = ( CloudColor41_g5 * ( temp_output_10_0_g9 * CZY_CloudFilterColor ) );
				float temp_output_391_0_g5 = ( AltoCumulusPlacement376_g5 * (0.0 + (tex2D( CZY_AltocumulusTexture, ((Pos33_g5*1.0 + ( CZY_AltocumulusWindSpeed * TIme30_g5 ))*( 1.0 / CZY_AltocumulusScale ) + 0.0) ).r - 0.0) * (1.0 - 0.0) / (0.2 - 0.0)) * CZY_AltocumulusMultiplier );
				float AltoCumulusLightTransport393_g5 = temp_output_391_0_g5;
				float ACCustomLightsClipping387_g5 = ( AltoCumulusLightTransport393_g5 * ( SimpleRadiance268_g5 > Clipping208_g5 ? 0.0 : 1.0 ) );
				float mulTime193_g5 = _TimeParameters.x * 0.01;
				float simplePerlin2D224_g5 = snoise( (Pos33_g5*1.0 + mulTime193_g5)*2.0 );
				float mulTime178_g5 = _TimeParameters.x * CZY_CirrostratusMoveSpeed;
				float cos138_g5 = cos( ( mulTime178_g5 * 0.01 ) );
				float sin138_g5 = sin( ( mulTime178_g5 * 0.01 ) );
				float2 rotator138_g5 = mul( Pos33_g5 - float2( 0.5,0.5 ) , float2x2( cos138_g5 , -sin138_g5 , sin138_g5 , cos138_g5 )) + float2( 0.5,0.5 );
				float cos198_g5 = cos( ( mulTime178_g5 * -0.02 ) );
				float sin198_g5 = sin( ( mulTime178_g5 * -0.02 ) );
				float2 rotator198_g5 = mul( Pos33_g5 - float2( 0.5,0.5 ) , float2x2( cos198_g5 , -sin198_g5 , sin198_g5 , cos198_g5 )) + float2( 0.5,0.5 );
				float mulTime184_g5 = _TimeParameters.x * 0.01;
				float simplePerlin2D216_g5 = snoise( (Pos33_g5*10.0 + mulTime184_g5)*4.0 );
				float4 CirrostratPattern261_g5 = ( ( saturate( simplePerlin2D224_g5 ) * tex2D( CZY_CirrostratusTexture, (rotator138_g5*1.5 + 0.75) ) ) + ( tex2D( CZY_CirrostratusTexture, (rotator198_g5*1.5 + 0.75) ) * saturate( simplePerlin2D216_g5 ) ) );
				float2 texCoord234_g5 = packedInput.ase_texcoord1.xy * float2( 1,1 ) + float2( 0,0 );
				float2 temp_output_243_0_g5 = ( texCoord234_g5 - float2( 0.5,0.5 ) );
				float dotResult238_g5 = dot( temp_output_243_0_g5 , temp_output_243_0_g5 );
				float clampResult264_g5 = clamp( ( CZY_CirrostratusMultiplier * 0.5 ) , 0.0 , 0.98 );
				float CirrostratLightTransport281_g5 = ( ( CirrostratPattern261_g5 * saturate( (0.4 + (dotResult238_g5 - 0.0) * (2.0 - 0.4) / (0.1 - 0.0)) ) ).r > ( 1.0 - clampResult264_g5 ) ? 1.0 : 0.0 );
				float CSCustomLightsClipping309_g5 = ( CirrostratLightTransport281_g5 * ( SimpleRadiance268_g5 > Clipping208_g5 ? 0.0 : 1.0 ) );
				float CustomRadiance340_g5 = saturate( ( ACCustomLightsClipping387_g5 + CSCustomLightsClipping309_g5 ) );
				float4 lerpResult331_g5 = lerp( ( lerpResult342_g5 + SunThroughClouds399_g5 ) , CirrusCustomLightColor350_g5 , CustomRadiance340_g5);
				float FinalAlpha375_g5 = saturate( ( DetailedClouds252_g5 + BorderLightTransport278_g5 + AltoCumulusLightTransport393_g5 + ChemtrailsFinal248_g5 + CirrostratLightTransport281_g5 + CirrusAlpha250_g5 + NimbusLightTransport269_g5 ) );
				float4 appendResult420_g5 = (float4((lerpResult331_g5).rgb , FinalAlpha375_g5));
				float4 FinalCloudColor325_g5 = appendResult420_g5;
				
				surfaceDescription.Color = FinalCloudColor325_g5.xyz;
				surfaceDescription.Emission = 0;
				surfaceDescription.Alpha = ( ( (FinalCloudColor325_g5).w * ( 1.0 - 0.0 ) ) > Clipping208_g5 ? 1.0 : 0.0 );
				surfaceDescription.AlphaClipThreshold = Clipping208_g5;
				surfaceDescription.ShadowTint = float4( 0, 0 ,0 ,1 );
				float2 Distortion = float2 ( 0, 0 );
				float DistortionBlur = 0;

				surfaceDescription.VTPackedFeedback = float4(1.0f,1.0f,1.0f,1.0f);
				SurfaceData surfaceData;
				BuiltinData builtinData;
				GetSurfaceAndBuiltinData(surfaceDescription, input, V, posInput, surfaceData, builtinData);

				BSDFData bsdfData = ConvertSurfaceDataToBSDFData( input.positionSS.xy, surfaceData );

				#if defined(_ENABLE_SHADOW_MATTE)
				bsdfData.color *= GetScreenSpaceAmbientOcclusion(input.positionSS.xy);
				#endif


			#ifdef DEBUG_DISPLAY
				if (_DebugLightingMode >= DEBUGLIGHTINGMODE_DIFFUSE_LIGHTING && _DebugLightingMode <= DEBUGLIGHTINGMODE_EMISSIVE_LIGHTING)
				{
					if (_DebugLightingMode != DEBUGLIGHTINGMODE_EMISSIVE_LIGHTING)
					{
						builtinData.emissiveColor = 0.0;
					}
					else
					{
						bsdfData.color = 0.0;
					}
				}
			#endif

				float4 outResult = ApplyBlendMode(bsdfData.color * GetDeExposureMultiplier() + builtinData.emissiveColor * GetCurrentExposureMultiplier(), builtinData.opacity);
				outResult = EvaluateAtmosphericScattering(posInput, V, outResult);

				#ifdef DEBUG_DISPLAY
					int bufferSize = int(_DebugViewMaterialArray[0].x);
					for (int index = 1; index <= bufferSize; index++)
					{
						int indexMaterialProperty = int(_DebugViewMaterialArray[index].x);
						if (indexMaterialProperty != 0)
						{
							float3 result = float3(1.0, 0.0, 1.0);
							bool needLinearToSRGB = false;

							GetPropertiesDataDebug(indexMaterialProperty, result, needLinearToSRGB);
							GetVaryingsDataDebug(indexMaterialProperty, input, result, needLinearToSRGB);
							GetBuiltinDataDebug(indexMaterialProperty, builtinData, posInput, result, needLinearToSRGB);
							GetSurfaceDataDebug(indexMaterialProperty, surfaceData, result, needLinearToSRGB);
							GetBSDFDataDebug(indexMaterialProperty, bsdfData, result, needLinearToSRGB);

							if (!needLinearToSRGB)
								result = SRGBToLinear(max(0, result));

							outResult = float4(result, 1.0);
						}
					}

					if (_DebugFullScreenMode == FULLSCREENDEBUGMODE_TRANSPARENCY_OVERDRAW)
					{
						float4 result = _DebugTransparencyOverdrawWeight * float4(TRANSPARENCY_OVERDRAW_COST, TRANSPARENCY_OVERDRAW_COST, TRANSPARENCY_OVERDRAW_COST, TRANSPARENCY_OVERDRAW_A);
						outResult = result;
					}
				#endif

				outColor = outResult;

				#ifdef _DEPTHOFFSET_ON
					outputDepth = posInput.deviceDepth;
				#endif

				#ifdef UNITY_VIRTUAL_TEXTURING
					outVTFeedback = builtinData.vtPackedFeedback;
				#endif
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "ShadowCaster"
			Tags { "LightMode"="ShadowCaster" }

			Cull [_CullMode]
			ZWrite On
			ZClip [_ZClip]
			ColorMask 0

			HLSLPROGRAM

			#pragma shader_feature_local_fragment _ENABLE_FOG_ON_TRANSPARENT
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#define ASE_SRP_VERSION 120108


			#pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _ALPHATEST_ON

			#pragma multi_compile _ DOTS_INSTANCING_ON

			#pragma vertex Vert
			#pragma fragment Frag

			#if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
			#define _WRITE_TRANSPARENT_MOTION_VECTOR
			#endif

			#define SHADERPASS SHADERPASS_SHADOWS
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
            #include "Packages/com.unity.shadergraph/ShaderGraphLibrary/Functions.hlsl"

			

			struct VertexInput
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_Position;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START( UnityPerMaterial )
						float4 _EmissionColor;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			#ifdef _ENABLE_SHADOW_MATTE
			float _ShadowMatteFilter;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _AlphaCutoff;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			float _EnableBlendModePreserveSpecularLighting;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			float4 CZY_CloudColor;
			float CZY_FilterSaturation;
			float CZY_FilterValue;
			float4 CZY_FilterColor;
			float4 CZY_CloudFilterColor;
			float4 CZY_CloudHighlightColor;
			float4 CZY_SunFilterColor;
			float CZY_WindSpeed;
			float CZY_MainCloudScale;
			float CZY_CumulusCoverageMultiplier;
			float3 CZY_SunDirection;
			half CZY_SunFlareFalloff;
			float3 CZY_MoonDirection;
			half CZY_CloudMoonFalloff;
			float4 CZY_CloudMoonColor;
			float CZY_DetailScale;
			float CZY_DetailAmount;
			float CZY_BorderHeight;
			float CZY_BorderVariation;
			float CZY_BorderEffect;
			float3 CZY_StormDirection;
			float CZY_NimbusHeight;
			float CZY_NimbusMultiplier;
			float CZY_NimbusVariation;
			sampler2D CZY_ChemtrailsTexture;
			float CZY_ChemtrailsMoveSpeed;
			float CZY_ChemtrailsMultiplier;
			sampler2D CZY_CirrusTexture;
			float CZY_CirrusMoveSpeed;
			float CZY_CirrusMultiplier;
			float CZY_ClippingThreshold;
			float4 CZY_AltoCloudColor;
			sampler2D CZY_AltocumulusTexture;
			float2 CZY_AltocumulusWindSpeed;
			float CZY_AltocumulusScale;
			float CZY_AltocumulusMultiplier;
			sampler2D CZY_CirrostratusTexture;
			float CZY_CirrostratusMoveSpeed;
			float CZY_CirrostratusMultiplier;


			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Unlit/Unlit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			float3 HSVToRGB( float3 c )
			{
				float4 K = float4( 1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0 );
				float3 p = abs( frac( c.xxx + K.xyz ) * 6.0 - K.www );
				return c.z * lerp( K.xxx, saturate( p - K.xxx ), c.y );
			}
			
			float3 RGBToHSV(float3 c)
			{
				float4 K = float4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
				float4 p = lerp( float4( c.bg, K.wz ), float4( c.gb, K.xy ), step( c.b, c.g ) );
				float4 q = lerp( float4( p.xyw, c.r ), float4( c.r, p.yzx ), step( p.x, c.r ) );
				float d = q.x - min( q.w, q.y );
				float e = 1.0e-10;
				return float3( abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
			}
			float3 mod2D289( float3 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }
			float2 mod2D289( float2 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }
			float3 permute( float3 x ) { return mod2D289( ( ( x * 34.0 ) + 1.0 ) * x ); }
			float snoise( float2 v )
			{
				const float4 C = float4( 0.211324865405187, 0.366025403784439, -0.577350269189626, 0.024390243902439 );
				float2 i = floor( v + dot( v, C.yy ) );
				float2 x0 = v - i + dot( i, C.xx );
				float2 i1;
				i1 = ( x0.x > x0.y ) ? float2( 1.0, 0.0 ) : float2( 0.0, 1.0 );
				float4 x12 = x0.xyxy + C.xxzz;
				x12.xy -= i1;
				i = mod2D289( i );
				float3 p = permute( permute( i.y + float3( 0.0, i1.y, 1.0 ) ) + i.x + float3( 0.0, i1.x, 1.0 ) );
				float3 m = max( 0.5 - float3( dot( x0, x0 ), dot( x12.xy, x12.xy ), dot( x12.zw, x12.zw ) ), 0.0 );
				m = m * m;
				m = m * m;
				float3 x = 2.0 * frac( p * C.www ) - 1.0;
				float3 h = abs( x ) - 0.5;
				float3 ox = floor( x + 0.5 );
				float3 a0 = x - ox;
				m *= 1.79284291400159 - 0.85373472095314 * ( a0 * a0 + h * h );
				float3 g;
				g.x = a0.x * x0.x + h.x * x0.y;
				g.yz = a0.yz * x12.xz + h.yz * x12.yw;
				return 130.0 * dot( m, g );
			}
			
					float2 voronoihash81_g5( float2 p )
					{
						
						p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
						return frac( sin( p ) *43758.5453);
					}
			
					float voronoi81_g5( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
					{
						float2 n = floor( v );
						float2 f = frac( v );
						float F1 = 8.0;
						float F2 = 8.0; float2 mg = 0;
						for ( int j = -1; j <= 1; j++ )
						{
							for ( int i = -1; i <= 1; i++ )
						 	{
						 		float2 g = float2( i, j );
						 		float2 o = voronoihash81_g5( n + g );
								o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
								float d = 0.5 * dot( r, r );
						 		if( d<F1 ) {
						 			F2 = F1;
						 			F1 = d; mg = g; mr = r; id = o;
						 		} else if( d<F2 ) {
						 			F2 = d;
						
						 		}
						 	}
						}
						return (F2 + F1) * 0.5;
					}
			
					float2 voronoihash88_g5( float2 p )
					{
						
						p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
						return frac( sin( p ) *43758.5453);
					}
			
					float voronoi88_g5( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
					{
						float2 n = floor( v );
						float2 f = frac( v );
						float F1 = 8.0;
						float F2 = 8.0; float2 mg = 0;
						for ( int j = -1; j <= 1; j++ )
						{
							for ( int i = -1; i <= 1; i++ )
						 	{
						 		float2 g = float2( i, j );
						 		float2 o = voronoihash88_g5( n + g );
								o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
								float d = 0.5 * dot( r, r );
						 		if( d<F1 ) {
						 			F2 = F1;
						 			F1 = d; mg = g; mr = r; id = o;
						 		} else if( d<F2 ) {
						 			F2 = d;
						
						 		}
						 	}
						}
						return (F2 + F1) * 0.5;
					}
			
					float2 voronoihash200_g5( float2 p )
					{
						
						p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
						return frac( sin( p ) *43758.5453);
					}
			
					float voronoi200_g5( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
					{
						float2 n = floor( v );
						float2 f = frac( v );
						float F1 = 8.0;
						float F2 = 8.0; float2 mg = 0;
						for ( int j = -1; j <= 1; j++ )
						{
							for ( int i = -1; i <= 1; i++ )
						 	{
						 		float2 g = float2( i, j );
						 		float2 o = voronoihash200_g5( n + g );
								o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
								float d = 0.5 * dot( r, r );
						 		if( d<F1 ) {
						 			F2 = F1;
						 			F1 = d; mg = g; mr = r; id = o;
						 		} else if( d<F2 ) {
						 			F2 = d;
						
						 		}
						 	}
						}
						return (F2 + F1) * 0.5;
					}
			
					float2 voronoihash232_g5( float2 p )
					{
						
						p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
						return frac( sin( p ) *43758.5453);
					}
			
					float voronoi232_g5( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
					{
						float2 n = floor( v );
						float2 f = frac( v );
						float F1 = 8.0;
						float F2 = 8.0; float2 mg = 0;
						for ( int j = -1; j <= 1; j++ )
						{
							for ( int i = -1; i <= 1; i++ )
						 	{
						 		float2 g = float2( i, j );
						 		float2 o = voronoihash232_g5( n + g );
								o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
								float d = 0.5 * dot( r, r );
						 		if( d<F1 ) {
						 			F2 = F1;
						 			F1 = d; mg = g; mr = r; id = o;
						 		} else if( d<F2 ) {
						 			F2 = d;
						
						 		}
						 	}
						}
						return F1;
					}
			
					float2 voronoihash84_g5( float2 p )
					{
						
						p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
						return frac( sin( p ) *43758.5453);
					}
			
					float voronoi84_g5( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
					{
						float2 n = floor( v );
						float2 f = frac( v );
						float F1 = 8.0;
						float F2 = 8.0; float2 mg = 0;
						for ( int j = -1; j <= 1; j++ )
						{
							for ( int i = -1; i <= 1; i++ )
						 	{
						 		float2 g = float2( i, j );
						 		float2 o = voronoihash84_g5( n + g );
								o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
								float d = 0.5 * dot( r, r );
						 		if( d<F1 ) {
						 			F2 = F1;
						 			F1 = d; mg = g; mr = r; id = o;
						 		} else if( d<F2 ) {
						 			F2 = d;
						
						 		}
						 	}
						}
						return F1;
					}
			

			struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
			};

			void BuildSurfaceData(FragInputs fragInputs, SurfaceDescription surfaceDescription, float3 V, out SurfaceData surfaceData)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);
				#ifdef WRITE_NORMAL_BUFFER
				surfaceData.normalWS = fragInputs.tangentToWorld[2];
				#endif
			}

			void GetSurfaceAndBuiltinData(SurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
                LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
                #endif

				#if _ALPHATEST_ON
				DoAlphaTest(surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold);
				#endif

				#if _DEPTHOFFSET_ON
                ApplyDepthOffsetPositionInput(V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput);
                #endif

				BuildSurfaceData(fragInputs, surfaceDescription, V, surfaceData);

				ZERO_INITIALIZE (BuiltinData, builtinData);
				builtinData.opacity = surfaceDescription.Alpha;

				#if defined(DEBUG_DISPLAY)
					builtinData.renderingLayers = GetMeshRenderingLightLayer();
				#endif

				#ifdef _ALPHATEST_ON
                    builtinData.alphaClipTreshold = surfaceDescription.AlphaClipThreshold;
                #endif

                #if _DEPTHOFFSET_ON
                builtinData.depthOffset = surfaceDescription.DepthOffset;
                #endif

                ApplyDebugToBuiltinData(builtinData);
			}

			VertexOutput VertexFunction( VertexInput inputMesh  )
			{
				VertexOutput o;
				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				o.ase_texcoord1.xyz = ase_worldPos;
				
				o.ase_texcoord.xy = inputMesh.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord.zw = 0;
				o.ase_texcoord1.w = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue =  defaultVertexValue ;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS =  inputMesh.normalOS ;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				o.positionCS = TransformWorldToHClip(positionRWS);
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput Vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			void Frag( VertexOutput packedInput
						#ifdef WRITE_MSAA_DEPTH
						, out float4 depthColor : SV_Target0
							#ifdef WRITE_NORMAL_BUFFER
							, out float4 outNormalBuffer : SV_Target1
							#endif
						#else
							#ifdef WRITE_NORMAL_BUFFER
							, out float4 outNormalBuffer : SV_Target0
							#endif
						#endif
						#if defined(_DEPTHOFFSET_ON)
						, out float outputDepth : DEPTH_OFFSET_SEMANTIC
						#endif
					
					)
			{
				UNITY_SETUP_INSTANCE_ID( packedInput );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );

				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);

				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

				float3 V = float3( 1.0, 1.0, 1.0 );

				SurfaceDescription surfaceDescription = (SurfaceDescription)0;
				float3 hsvTorgb2_g7 = RGBToHSV( CZY_CloudColor.rgb );
				float3 hsvTorgb3_g7 = HSVToRGB( float3(hsvTorgb2_g7.x,saturate( ( hsvTorgb2_g7.y + CZY_FilterSaturation ) ),( hsvTorgb2_g7.z + CZY_FilterValue )) );
				float4 temp_output_10_0_g7 = ( float4( hsvTorgb3_g7 , 0.0 ) * CZY_FilterColor );
				float4 CloudColor41_g5 = ( temp_output_10_0_g7 * CZY_CloudFilterColor );
				float3 hsvTorgb2_g6 = RGBToHSV( CZY_CloudHighlightColor.rgb );
				float3 hsvTorgb3_g6 = HSVToRGB( float3(hsvTorgb2_g6.x,saturate( ( hsvTorgb2_g6.y + CZY_FilterSaturation ) ),( hsvTorgb2_g6.z + CZY_FilterValue )) );
				float4 temp_output_10_0_g6 = ( float4( hsvTorgb3_g6 , 0.0 ) * CZY_FilterColor );
				float4 CloudHighlightColor55_g5 = ( temp_output_10_0_g6 * CZY_SunFilterColor );
				float2 texCoord31_g5 = packedInput.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 Pos33_g5 = texCoord31_g5;
				float mulTime29_g5 = _TimeParameters.x * ( 0.001 * CZY_WindSpeed );
				float TIme30_g5 = mulTime29_g5;
				float simplePerlin2D409_g5 = snoise( ( Pos33_g5 + ( TIme30_g5 * float2( 0.2,-0.4 ) ) )*( 100.0 / CZY_MainCloudScale ) );
				simplePerlin2D409_g5 = simplePerlin2D409_g5*0.5 + 0.5;
				float SimpleCloudDensity153_g5 = simplePerlin2D409_g5;
				float time81_g5 = 0.0;
				float2 voronoiSmoothId81_g5 = 0;
				float2 temp_output_94_0_g5 = ( Pos33_g5 + ( TIme30_g5 * float2( 0.3,0.2 ) ) );
				float2 coords81_g5 = temp_output_94_0_g5 * ( 140.0 / CZY_MainCloudScale );
				float2 id81_g5 = 0;
				float2 uv81_g5 = 0;
				float voroi81_g5 = voronoi81_g5( coords81_g5, time81_g5, id81_g5, uv81_g5, 0, voronoiSmoothId81_g5 );
				float time88_g5 = 0.0;
				float2 voronoiSmoothId88_g5 = 0;
				float2 coords88_g5 = temp_output_94_0_g5 * ( 500.0 / CZY_MainCloudScale );
				float2 id88_g5 = 0;
				float2 uv88_g5 = 0;
				float voroi88_g5 = voronoi88_g5( coords88_g5, time88_g5, id88_g5, uv88_g5, 0, voronoiSmoothId88_g5 );
				float2 appendResult95_g5 = (float2(voroi81_g5 , voroi88_g5));
				float2 VoroDetails109_g5 = appendResult95_g5;
				float CumulusCoverage34_g5 = CZY_CumulusCoverageMultiplier;
				float ComplexCloudDensity141_g5 = (0.0 + (min( SimpleCloudDensity153_g5 , ( 1.0 - VoroDetails109_g5.x ) ) - ( 1.0 - CumulusCoverage34_g5 )) * (1.0 - 0.0) / (1.0 - ( 1.0 - CumulusCoverage34_g5 )));
				float4 lerpResult315_g5 = lerp( CloudHighlightColor55_g5 , CloudColor41_g5 , saturate( (2.0 + (ComplexCloudDensity141_g5 - 0.0) * (0.7 - 2.0) / (1.0 - 0.0)) ));
				float3 ase_worldPos = packedInput.ase_texcoord1.xyz;
				float3 normalizeResult40_g5 = normalize( ( ase_worldPos - _WorldSpaceCameraPos ) );
				float dotResult42_g5 = dot( normalizeResult40_g5 , CZY_SunDirection );
				float temp_output_49_0_g5 = abs( (dotResult42_g5*0.5 + 0.5) );
				half LightMask56_g5 = saturate( pow( temp_output_49_0_g5 , CZY_SunFlareFalloff ) );
				float time200_g5 = 0.0;
				float2 voronoiSmoothId200_g5 = 0;
				float mulTime163_g5 = _TimeParameters.x * 0.003;
				float2 coords200_g5 = (Pos33_g5*1.0 + ( float2( 1,-2 ) * mulTime163_g5 )) * 10.0;
				float2 id200_g5 = 0;
				float2 uv200_g5 = 0;
				float voroi200_g5 = voronoi200_g5( coords200_g5, time200_g5, id200_g5, uv200_g5, 0, voronoiSmoothId200_g5 );
				float time232_g5 = ( 10.0 * mulTime163_g5 );
				float2 voronoiSmoothId232_g5 = 0;
				float2 coords232_g5 = packedInput.ase_texcoord.xy * 10.0;
				float2 id232_g5 = 0;
				float2 uv232_g5 = 0;
				float voroi232_g5 = voronoi232_g5( coords232_g5, time232_g5, id232_g5, uv232_g5, 0, voronoiSmoothId232_g5 );
				float AltoCumulusPlacement376_g5 = saturate( ( ( ( 1.0 - 0.0 ) - (1.0 + (voroi200_g5 - 0.0) * (-0.5 - 1.0) / (1.0 - 0.0)) ) - voroi232_g5 ) );
				float CloudThicknessDetails286_g5 = ( VoroDetails109_g5.y * saturate( ( AltoCumulusPlacement376_g5 - 0.8 ) ) );
				float3 normalizeResult43_g5 = normalize( ( ase_worldPos - _WorldSpaceCameraPos ) );
				float dotResult46_g5 = dot( normalizeResult43_g5 , CZY_MoonDirection );
				half MoonlightMask57_g5 = saturate( pow( abs( (dotResult46_g5*0.5 + 0.5) ) , CZY_CloudMoonFalloff ) );
				float3 hsvTorgb2_g8 = RGBToHSV( CZY_CloudMoonColor.rgb );
				float3 hsvTorgb3_g8 = HSVToRGB( float3(hsvTorgb2_g8.x,saturate( ( hsvTorgb2_g8.y + CZY_FilterSaturation ) ),( hsvTorgb2_g8.z + CZY_FilterValue )) );
				float4 temp_output_10_0_g8 = ( float4( hsvTorgb3_g8 , 0.0 ) * CZY_FilterColor );
				float4 MoonlightColor60_g5 = ( temp_output_10_0_g8 * CZY_CloudFilterColor );
				float4 lerpResult338_g5 = lerp( ( lerpResult315_g5 + ( LightMask56_g5 * CloudHighlightColor55_g5 * ( 1.0 - CloudThicknessDetails286_g5 ) ) + ( MoonlightMask57_g5 * MoonlightColor60_g5 * ( 1.0 - CloudThicknessDetails286_g5 ) ) ) , ( CloudColor41_g5 * float4( 0.5660378,0.5660378,0.5660378,0 ) ) , CloudThicknessDetails286_g5);
				float time84_g5 = 0.0;
				float2 voronoiSmoothId84_g5 = 0;
				float2 coords84_g5 = ( Pos33_g5 + ( TIme30_g5 * float2( 0.3,0.2 ) ) ) * ( 100.0 / CZY_DetailScale );
				float2 id84_g5 = 0;
				float2 uv84_g5 = 0;
				float fade84_g5 = 0.5;
				float voroi84_g5 = 0;
				float rest84_g5 = 0;
				for( int it84_g5 = 0; it84_g5 <3; it84_g5++ ){
				voroi84_g5 += fade84_g5 * voronoi84_g5( coords84_g5, time84_g5, id84_g5, uv84_g5, 0,voronoiSmoothId84_g5 );
				rest84_g5 += fade84_g5;
				coords84_g5 *= 2;
				fade84_g5 *= 0.5;
				}//Voronoi84_g5
				voroi84_g5 /= rest84_g5;
				float temp_output_173_0_g5 = ( (0.0 + (( 1.0 - voroi84_g5 ) - 0.3) * (0.5 - 0.0) / (1.0 - 0.3)) * 0.1 * CZY_DetailAmount );
				float DetailedClouds252_g5 = saturate( ( ComplexCloudDensity141_g5 + temp_output_173_0_g5 ) );
				float CloudDetail179_g5 = temp_output_173_0_g5;
				float2 texCoord79_g5 = packedInput.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 temp_output_161_0_g5 = ( texCoord79_g5 - float2( 0.5,0.5 ) );
				float dotResult212_g5 = dot( temp_output_161_0_g5 , temp_output_161_0_g5 );
				float BorderHeight154_g5 = ( 1.0 - CZY_BorderHeight );
				float temp_output_151_0_g5 = ( -2.0 * ( 1.0 - CZY_BorderVariation ) );
				float clampResult247_g5 = clamp( ( ( ( CloudDetail179_g5 + SimpleCloudDensity153_g5 ) * saturate( (( BorderHeight154_g5 * temp_output_151_0_g5 ) + (dotResult212_g5 - 0.0) * (( temp_output_151_0_g5 * -4.0 ) - ( BorderHeight154_g5 * temp_output_151_0_g5 )) / (0.5 - 0.0)) ) ) * 10.0 * CZY_BorderEffect ) , -1.0 , 1.0 );
				float BorderLightTransport278_g5 = clampResult247_g5;
				float3 normalizeResult116_g5 = normalize( ( ase_worldPos - _WorldSpaceCameraPos ) );
				float3 normalizeResult146_g5 = normalize( CZY_StormDirection );
				float dotResult150_g5 = dot( normalizeResult116_g5 , normalizeResult146_g5 );
				float2 texCoord98_g5 = packedInput.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 temp_output_124_0_g5 = ( texCoord98_g5 - float2( 0.5,0.5 ) );
				float dotResult125_g5 = dot( temp_output_124_0_g5 , temp_output_124_0_g5 );
				float temp_output_140_0_g5 = ( -2.0 * ( 1.0 - ( CZY_NimbusVariation * 0.9 ) ) );
				float NimbusLightTransport269_g5 = saturate( ( ( ( CloudDetail179_g5 + SimpleCloudDensity153_g5 ) * saturate( (( ( 1.0 - CZY_NimbusMultiplier ) * temp_output_140_0_g5 ) + (( dotResult150_g5 + ( CZY_NimbusHeight * 4.0 * dotResult125_g5 ) ) - 0.5) * (( temp_output_140_0_g5 * -4.0 ) - ( ( 1.0 - CZY_NimbusMultiplier ) * temp_output_140_0_g5 )) / (7.0 - 0.5)) ) ) * 10.0 ) );
				float mulTime104_g5 = _TimeParameters.x * 0.01;
				float simplePerlin2D143_g5 = snoise( (Pos33_g5*1.0 + mulTime104_g5)*2.0 );
				float mulTime93_g5 = _TimeParameters.x * CZY_ChemtrailsMoveSpeed;
				float cos97_g5 = cos( ( mulTime93_g5 * 0.01 ) );
				float sin97_g5 = sin( ( mulTime93_g5 * 0.01 ) );
				float2 rotator97_g5 = mul( Pos33_g5 - float2( 0.5,0.5 ) , float2x2( cos97_g5 , -sin97_g5 , sin97_g5 , cos97_g5 )) + float2( 0.5,0.5 );
				float cos131_g5 = cos( ( mulTime93_g5 * -0.02 ) );
				float sin131_g5 = sin( ( mulTime93_g5 * -0.02 ) );
				float2 rotator131_g5 = mul( Pos33_g5 - float2( 0.5,0.5 ) , float2x2( cos131_g5 , -sin131_g5 , sin131_g5 , cos131_g5 )) + float2( 0.5,0.5 );
				float mulTime107_g5 = _TimeParameters.x * 0.01;
				float simplePerlin2D147_g5 = snoise( (Pos33_g5*1.0 + mulTime107_g5)*4.0 );
				float4 ChemtrailsPattern210_g5 = ( ( saturate( simplePerlin2D143_g5 ) * tex2D( CZY_ChemtrailsTexture, (rotator97_g5*0.5 + 0.0) ) ) + ( tex2D( CZY_ChemtrailsTexture, rotator131_g5 ) * saturate( simplePerlin2D147_g5 ) ) );
				float2 texCoord139_g5 = packedInput.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 temp_output_162_0_g5 = ( texCoord139_g5 - float2( 0.5,0.5 ) );
				float dotResult207_g5 = dot( temp_output_162_0_g5 , temp_output_162_0_g5 );
				float ChemtrailsFinal248_g5 = ( ( ChemtrailsPattern210_g5 * saturate( (0.4 + (dotResult207_g5 - 0.0) * (2.0 - 0.4) / (0.1 - 0.0)) ) ).r > ( 1.0 - ( CZY_ChemtrailsMultiplier * 0.5 ) ) ? 1.0 : 0.0 );
				float mulTime80_g5 = _TimeParameters.x * 0.01;
				float simplePerlin2D126_g5 = snoise( (Pos33_g5*1.0 + mulTime80_g5)*2.0 );
				float mulTime75_g5 = _TimeParameters.x * CZY_CirrusMoveSpeed;
				float cos101_g5 = cos( ( mulTime75_g5 * 0.01 ) );
				float sin101_g5 = sin( ( mulTime75_g5 * 0.01 ) );
				float2 rotator101_g5 = mul( Pos33_g5 - float2( 0.5,0.5 ) , float2x2( cos101_g5 , -sin101_g5 , sin101_g5 , cos101_g5 )) + float2( 0.5,0.5 );
				float cos112_g5 = cos( ( mulTime75_g5 * -0.02 ) );
				float sin112_g5 = sin( ( mulTime75_g5 * -0.02 ) );
				float2 rotator112_g5 = mul( Pos33_g5 - float2( 0.5,0.5 ) , float2x2( cos112_g5 , -sin112_g5 , sin112_g5 , cos112_g5 )) + float2( 0.5,0.5 );
				float mulTime135_g5 = _TimeParameters.x * 0.01;
				float simplePerlin2D122_g5 = snoise( (Pos33_g5*1.0 + mulTime135_g5) );
				simplePerlin2D122_g5 = simplePerlin2D122_g5*0.5 + 0.5;
				float4 CirrusPattern137_g5 = ( ( saturate( simplePerlin2D126_g5 ) * tex2D( CZY_CirrusTexture, (rotator101_g5*1.5 + 0.75) ) ) + ( tex2D( CZY_CirrusTexture, (rotator112_g5*1.0 + 0.0) ) * saturate( simplePerlin2D122_g5 ) ) );
				float2 texCoord134_g5 = packedInput.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 temp_output_164_0_g5 = ( texCoord134_g5 - float2( 0.5,0.5 ) );
				float dotResult157_g5 = dot( temp_output_164_0_g5 , temp_output_164_0_g5 );
				float4 temp_output_217_0_g5 = ( CirrusPattern137_g5 * saturate( (0.0 + (dotResult157_g5 - 0.0) * (2.0 - 0.0) / (0.2 - 0.0)) ) );
				float Clipping208_g5 = CZY_ClippingThreshold;
				float CirrusAlpha250_g5 = ( ( temp_output_217_0_g5 * ( CZY_CirrusMultiplier * 10.0 ) ).r > Clipping208_g5 ? 1.0 : 0.0 );
				float SimpleRadiance268_g5 = saturate( ( DetailedClouds252_g5 + BorderLightTransport278_g5 + NimbusLightTransport269_g5 + ChemtrailsFinal248_g5 + CirrusAlpha250_g5 ) );
				float4 lerpResult342_g5 = lerp( CloudColor41_g5 , lerpResult338_g5 , ( 1.0 - SimpleRadiance268_g5 ));
				float CloudLight52_g5 = saturate( pow( temp_output_49_0_g5 , CZY_SunFlareFalloff ) );
				float4 lerpResult316_g5 = lerp( float4( 0,0,0,0 ) , CloudHighlightColor55_g5 , ( saturate( ( AltoCumulusPlacement376_g5 - 1.0 ) ) * CloudDetail179_g5 * CloudLight52_g5 ));
				float4 SunThroughClouds399_g5 = ( lerpResult316_g5 * 1.3 );
				float3 hsvTorgb2_g9 = RGBToHSV( CZY_AltoCloudColor.rgb );
				float3 hsvTorgb3_g9 = HSVToRGB( float3(hsvTorgb2_g9.x,saturate( ( hsvTorgb2_g9.y + CZY_FilterSaturation ) ),( hsvTorgb2_g9.z + CZY_FilterValue )) );
				float4 temp_output_10_0_g9 = ( float4( hsvTorgb3_g9 , 0.0 ) * CZY_FilterColor );
				float4 CirrusCustomLightColor350_g5 = ( CloudColor41_g5 * ( temp_output_10_0_g9 * CZY_CloudFilterColor ) );
				float temp_output_391_0_g5 = ( AltoCumulusPlacement376_g5 * (0.0 + (tex2D( CZY_AltocumulusTexture, ((Pos33_g5*1.0 + ( CZY_AltocumulusWindSpeed * TIme30_g5 ))*( 1.0 / CZY_AltocumulusScale ) + 0.0) ).r - 0.0) * (1.0 - 0.0) / (0.2 - 0.0)) * CZY_AltocumulusMultiplier );
				float AltoCumulusLightTransport393_g5 = temp_output_391_0_g5;
				float ACCustomLightsClipping387_g5 = ( AltoCumulusLightTransport393_g5 * ( SimpleRadiance268_g5 > Clipping208_g5 ? 0.0 : 1.0 ) );
				float mulTime193_g5 = _TimeParameters.x * 0.01;
				float simplePerlin2D224_g5 = snoise( (Pos33_g5*1.0 + mulTime193_g5)*2.0 );
				float mulTime178_g5 = _TimeParameters.x * CZY_CirrostratusMoveSpeed;
				float cos138_g5 = cos( ( mulTime178_g5 * 0.01 ) );
				float sin138_g5 = sin( ( mulTime178_g5 * 0.01 ) );
				float2 rotator138_g5 = mul( Pos33_g5 - float2( 0.5,0.5 ) , float2x2( cos138_g5 , -sin138_g5 , sin138_g5 , cos138_g5 )) + float2( 0.5,0.5 );
				float cos198_g5 = cos( ( mulTime178_g5 * -0.02 ) );
				float sin198_g5 = sin( ( mulTime178_g5 * -0.02 ) );
				float2 rotator198_g5 = mul( Pos33_g5 - float2( 0.5,0.5 ) , float2x2( cos198_g5 , -sin198_g5 , sin198_g5 , cos198_g5 )) + float2( 0.5,0.5 );
				float mulTime184_g5 = _TimeParameters.x * 0.01;
				float simplePerlin2D216_g5 = snoise( (Pos33_g5*10.0 + mulTime184_g5)*4.0 );
				float4 CirrostratPattern261_g5 = ( ( saturate( simplePerlin2D224_g5 ) * tex2D( CZY_CirrostratusTexture, (rotator138_g5*1.5 + 0.75) ) ) + ( tex2D( CZY_CirrostratusTexture, (rotator198_g5*1.5 + 0.75) ) * saturate( simplePerlin2D216_g5 ) ) );
				float2 texCoord234_g5 = packedInput.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 temp_output_243_0_g5 = ( texCoord234_g5 - float2( 0.5,0.5 ) );
				float dotResult238_g5 = dot( temp_output_243_0_g5 , temp_output_243_0_g5 );
				float clampResult264_g5 = clamp( ( CZY_CirrostratusMultiplier * 0.5 ) , 0.0 , 0.98 );
				float CirrostratLightTransport281_g5 = ( ( CirrostratPattern261_g5 * saturate( (0.4 + (dotResult238_g5 - 0.0) * (2.0 - 0.4) / (0.1 - 0.0)) ) ).r > ( 1.0 - clampResult264_g5 ) ? 1.0 : 0.0 );
				float CSCustomLightsClipping309_g5 = ( CirrostratLightTransport281_g5 * ( SimpleRadiance268_g5 > Clipping208_g5 ? 0.0 : 1.0 ) );
				float CustomRadiance340_g5 = saturate( ( ACCustomLightsClipping387_g5 + CSCustomLightsClipping309_g5 ) );
				float4 lerpResult331_g5 = lerp( ( lerpResult342_g5 + SunThroughClouds399_g5 ) , CirrusCustomLightColor350_g5 , CustomRadiance340_g5);
				float FinalAlpha375_g5 = saturate( ( DetailedClouds252_g5 + BorderLightTransport278_g5 + AltoCumulusLightTransport393_g5 + ChemtrailsFinal248_g5 + CirrostratLightTransport281_g5 + CirrusAlpha250_g5 + NimbusLightTransport269_g5 ) );
				float4 appendResult420_g5 = (float4((lerpResult331_g5).rgb , FinalAlpha375_g5));
				float4 FinalCloudColor325_g5 = appendResult420_g5;
				
				surfaceDescription.Alpha = ( ( (FinalCloudColor325_g5).w * ( 1.0 - 0.0 ) ) > Clipping208_g5 ? 1.0 : 0.0 );
				surfaceDescription.AlphaClipThreshold = Clipping208_g5;

				SurfaceData surfaceData;
				BuiltinData builtinData;
				GetSurfaceAndBuiltinData(surfaceDescription,input, V, posInput, surfaceData, builtinData);

				#if defined(_DEPTHOFFSET_ON)
				outputDepth = posInput.deviceDepth;
				float bias = max(abs(ddx(posInput.deviceDepth)), abs(ddy(posInput.deviceDepth))) * _SlopeScaleDepthBias;
				outputDepth += bias;
				#endif

				#ifdef WRITE_MSAA_DEPTH
				depthColor = packedInput.vmesh.positionCS.z;

				#ifdef _ALPHATOMASK_ON
				depthColor.a = SharpenAlpha(builtinData.opacity, builtinData.alphaClipTreshold);
				#endif
				#endif

				#if defined(WRITE_NORMAL_BUFFER)
				EncodeIntoNormalBuffer(ConvertSurfaceDataToNormalData(surfaceData), outNormalBuffer);
				#endif

				#if defined(WRITE_DECAL_BUFFER) && !defined(_DISABLE_DECALS)
				DecalPrepassData decalPrepassData;
				decalPrepassData.geomNormalWS = surfaceData.geomNormalWS;
				decalPrepassData.decalLayerMask = GetMeshRenderingDecalLayer();
				EncodeIntoDecalPrepassBuffer(decalPrepassData, outDecalBuffer);
				#endif
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "META"
			Tags { "LightMode"="Meta" }

			Cull Off

			HLSLPROGRAM

			#pragma shader_feature_local_fragment _ENABLE_FOG_ON_TRANSPARENT
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#define ASE_SRP_VERSION 120108


			#pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _ALPHATEST_ON

			#pragma shader_feature EDITOR_VISUALIZATION

			#pragma multi_compile _ DOTS_INSTANCING_ON

			#pragma vertex Vert
			#pragma fragment Frag

			#if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
			#define _WRITE_TRANSPARENT_MOTION_VECTOR
			#endif

			#define SHADERPASS SHADERPASS_LIGHT_TRANSPORT
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
            #include "Packages/com.unity.shadergraph/ShaderGraphLibrary/Functions.hlsl"

			CBUFFER_START( UnityPerMaterial )
						float4 _EmissionColor;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			#ifdef _ENABLE_SHADOW_MATTE
			float _ShadowMatteFilter;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _AlphaCutoff;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			float _EnableBlendModePreserveSpecularLighting;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			float4 CZY_CloudColor;
			float CZY_FilterSaturation;
			float CZY_FilterValue;
			float4 CZY_FilterColor;
			float4 CZY_CloudFilterColor;
			float4 CZY_CloudHighlightColor;
			float4 CZY_SunFilterColor;
			float CZY_WindSpeed;
			float CZY_MainCloudScale;
			float CZY_CumulusCoverageMultiplier;
			float3 CZY_SunDirection;
			half CZY_SunFlareFalloff;
			float3 CZY_MoonDirection;
			half CZY_CloudMoonFalloff;
			float4 CZY_CloudMoonColor;
			float CZY_DetailScale;
			float CZY_DetailAmount;
			float CZY_BorderHeight;
			float CZY_BorderVariation;
			float CZY_BorderEffect;
			float3 CZY_StormDirection;
			float CZY_NimbusHeight;
			float CZY_NimbusMultiplier;
			float CZY_NimbusVariation;
			sampler2D CZY_ChemtrailsTexture;
			float CZY_ChemtrailsMoveSpeed;
			float CZY_ChemtrailsMultiplier;
			sampler2D CZY_CirrusTexture;
			float CZY_CirrusMoveSpeed;
			float CZY_CirrusMultiplier;
			float CZY_ClippingThreshold;
			float4 CZY_AltoCloudColor;
			sampler2D CZY_AltocumulusTexture;
			float2 CZY_AltocumulusWindSpeed;
			float CZY_AltocumulusScale;
			float CZY_AltocumulusMultiplier;
			sampler2D CZY_CirrostratusTexture;
			float CZY_CirrostratusMoveSpeed;
			float CZY_CirrostratusMultiplier;


            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Unlit/Unlit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			

			struct VertexInput
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 uv0 : TEXCOORD0;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				float4 uv3 : TEXCOORD3;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_Position;
				#ifdef EDITOR_VISUALIZATION
				float2 VizUV : TEXCOORD0;
				float4 LightCoord : TEXCOORD1;
				#endif
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};


			float3 HSVToRGB( float3 c )
			{
				float4 K = float4( 1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0 );
				float3 p = abs( frac( c.xxx + K.xyz ) * 6.0 - K.www );
				return c.z * lerp( K.xxx, saturate( p - K.xxx ), c.y );
			}
			
			float3 RGBToHSV(float3 c)
			{
				float4 K = float4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
				float4 p = lerp( float4( c.bg, K.wz ), float4( c.gb, K.xy ), step( c.b, c.g ) );
				float4 q = lerp( float4( p.xyw, c.r ), float4( c.r, p.yzx ), step( p.x, c.r ) );
				float d = q.x - min( q.w, q.y );
				float e = 1.0e-10;
				return float3( abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
			}
			float3 mod2D289( float3 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }
			float2 mod2D289( float2 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }
			float3 permute( float3 x ) { return mod2D289( ( ( x * 34.0 ) + 1.0 ) * x ); }
			float snoise( float2 v )
			{
				const float4 C = float4( 0.211324865405187, 0.366025403784439, -0.577350269189626, 0.024390243902439 );
				float2 i = floor( v + dot( v, C.yy ) );
				float2 x0 = v - i + dot( i, C.xx );
				float2 i1;
				i1 = ( x0.x > x0.y ) ? float2( 1.0, 0.0 ) : float2( 0.0, 1.0 );
				float4 x12 = x0.xyxy + C.xxzz;
				x12.xy -= i1;
				i = mod2D289( i );
				float3 p = permute( permute( i.y + float3( 0.0, i1.y, 1.0 ) ) + i.x + float3( 0.0, i1.x, 1.0 ) );
				float3 m = max( 0.5 - float3( dot( x0, x0 ), dot( x12.xy, x12.xy ), dot( x12.zw, x12.zw ) ), 0.0 );
				m = m * m;
				m = m * m;
				float3 x = 2.0 * frac( p * C.www ) - 1.0;
				float3 h = abs( x ) - 0.5;
				float3 ox = floor( x + 0.5 );
				float3 a0 = x - ox;
				m *= 1.79284291400159 - 0.85373472095314 * ( a0 * a0 + h * h );
				float3 g;
				g.x = a0.x * x0.x + h.x * x0.y;
				g.yz = a0.yz * x12.xz + h.yz * x12.yw;
				return 130.0 * dot( m, g );
			}
			
					float2 voronoihash81_g5( float2 p )
					{
						
						p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
						return frac( sin( p ) *43758.5453);
					}
			
					float voronoi81_g5( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
					{
						float2 n = floor( v );
						float2 f = frac( v );
						float F1 = 8.0;
						float F2 = 8.0; float2 mg = 0;
						for ( int j = -1; j <= 1; j++ )
						{
							for ( int i = -1; i <= 1; i++ )
						 	{
						 		float2 g = float2( i, j );
						 		float2 o = voronoihash81_g5( n + g );
								o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
								float d = 0.5 * dot( r, r );
						 		if( d<F1 ) {
						 			F2 = F1;
						 			F1 = d; mg = g; mr = r; id = o;
						 		} else if( d<F2 ) {
						 			F2 = d;
						
						 		}
						 	}
						}
						return (F2 + F1) * 0.5;
					}
			
					float2 voronoihash88_g5( float2 p )
					{
						
						p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
						return frac( sin( p ) *43758.5453);
					}
			
					float voronoi88_g5( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
					{
						float2 n = floor( v );
						float2 f = frac( v );
						float F1 = 8.0;
						float F2 = 8.0; float2 mg = 0;
						for ( int j = -1; j <= 1; j++ )
						{
							for ( int i = -1; i <= 1; i++ )
						 	{
						 		float2 g = float2( i, j );
						 		float2 o = voronoihash88_g5( n + g );
								o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
								float d = 0.5 * dot( r, r );
						 		if( d<F1 ) {
						 			F2 = F1;
						 			F1 = d; mg = g; mr = r; id = o;
						 		} else if( d<F2 ) {
						 			F2 = d;
						
						 		}
						 	}
						}
						return (F2 + F1) * 0.5;
					}
			
					float2 voronoihash200_g5( float2 p )
					{
						
						p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
						return frac( sin( p ) *43758.5453);
					}
			
					float voronoi200_g5( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
					{
						float2 n = floor( v );
						float2 f = frac( v );
						float F1 = 8.0;
						float F2 = 8.0; float2 mg = 0;
						for ( int j = -1; j <= 1; j++ )
						{
							for ( int i = -1; i <= 1; i++ )
						 	{
						 		float2 g = float2( i, j );
						 		float2 o = voronoihash200_g5( n + g );
								o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
								float d = 0.5 * dot( r, r );
						 		if( d<F1 ) {
						 			F2 = F1;
						 			F1 = d; mg = g; mr = r; id = o;
						 		} else if( d<F2 ) {
						 			F2 = d;
						
						 		}
						 	}
						}
						return (F2 + F1) * 0.5;
					}
			
					float2 voronoihash232_g5( float2 p )
					{
						
						p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
						return frac( sin( p ) *43758.5453);
					}
			
					float voronoi232_g5( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
					{
						float2 n = floor( v );
						float2 f = frac( v );
						float F1 = 8.0;
						float F2 = 8.0; float2 mg = 0;
						for ( int j = -1; j <= 1; j++ )
						{
							for ( int i = -1; i <= 1; i++ )
						 	{
						 		float2 g = float2( i, j );
						 		float2 o = voronoihash232_g5( n + g );
								o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
								float d = 0.5 * dot( r, r );
						 		if( d<F1 ) {
						 			F2 = F1;
						 			F1 = d; mg = g; mr = r; id = o;
						 		} else if( d<F2 ) {
						 			F2 = d;
						
						 		}
						 	}
						}
						return F1;
					}
			
					float2 voronoihash84_g5( float2 p )
					{
						
						p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
						return frac( sin( p ) *43758.5453);
					}
			
					float voronoi84_g5( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
					{
						float2 n = floor( v );
						float2 f = frac( v );
						float F1 = 8.0;
						float F2 = 8.0; float2 mg = 0;
						for ( int j = -1; j <= 1; j++ )
						{
							for ( int i = -1; i <= 1; i++ )
						 	{
						 		float2 g = float2( i, j );
						 		float2 o = voronoihash84_g5( n + g );
								o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
								float d = 0.5 * dot( r, r );
						 		if( d<F1 ) {
						 			F2 = F1;
						 			F1 = d; mg = g; mr = r; id = o;
						 		} else if( d<F2 ) {
						 			F2 = d;
						
						 		}
						 	}
						}
						return F1;
					}
			

			struct SurfaceDescription
			{
				float3 Color;
				float3 Emission;
				float Alpha;
				float AlphaClipThreshold;
			};

			void BuildSurfaceData( FragInputs fragInputs, SurfaceDescription surfaceDescription, float3 V, out SurfaceData surfaceData )
			{
				ZERO_INITIALIZE( SurfaceData, surfaceData );
				surfaceData.color = surfaceDescription.Color;

				#ifdef WRITE_NORMAL_BUFFER
				surfaceData.normalWS = fragInputs.tangentToWorld[2];
				#endif
			}

			void GetSurfaceAndBuiltinData( SurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData )
			{
				#ifdef LOD_FADE_CROSSFADE
                LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
                #endif

				#if _ALPHATEST_ON
				DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#if _DEPTHOFFSET_ON
                ApplyDepthOffsetPositionInput(V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput);
                #endif

				BuildSurfaceData( fragInputs, surfaceDescription, V, surfaceData );
				ZERO_INITIALIZE( BuiltinData, builtinData );
				builtinData.opacity = surfaceDescription.Alpha;
				#if defined(DEBUG_DISPLAY)
					builtinData.renderingLayers = GetMeshRenderingLightLayer();
				#endif

				#ifdef _ALPHATEST_ON
                    builtinData.alphaClipTreshold = surfaceDescription.AlphaClipThreshold;
                #endif

				builtinData.emissiveColor = surfaceDescription.Emission;

				#if _DEPTHOFFSET_ON
                builtinData.depthOffset = surfaceDescription.DepthOffset;
                #endif


                ApplyDebugToBuiltinData(builtinData);
			}

			#define SCENEPICKINGPASS
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/PickingSpaceTransforms.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/MetaPass.hlsl"

			VertexOutput VertexFunction( VertexInput inputMesh  )
			{
				VertexOutput o;
				UNITY_SETUP_INSTANCE_ID( inputMesh );
				UNITY_TRANSFER_INSTANCE_ID( inputMesh, o );

				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				o.ase_texcoord3.xyz = ase_worldPos;
				
				o.ase_texcoord2.xy = inputMesh.uv0.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.zw = 0;
				o.ase_texcoord3.w = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue =  defaultVertexValue ;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS =  inputMesh.normalOS ;

			#ifdef EDITOR_VISUALIZATION
				float2 vizUV = 0;
				float4 lightCoord = 0;
				UnityEditorVizData(inputMesh.positionOS.xyz, inputMesh.uv0.xy, inputMesh.uv1.xy, inputMesh.uv2.xy, vizUV, lightCoord);
			#endif

				float2 uv = float2( 0.0, 0.0 );
				if( unity_MetaVertexControl.x )
				{
					uv = inputMesh.uv1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
				}
				else if( unity_MetaVertexControl.y )
				{
					uv = inputMesh.uv2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
				}

				#ifdef EDITOR_VISUALIZATION
					o.VizUV.xy = vizUV;
					o.LightCoord = lightCoord;
				#endif

				o.positionCS = float4( uv * 2.0 - 1.0, inputMesh.positionOS.z > 0 ? 1.0e-4 : 0.0, 1.0 );
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 uv0 : TEXCOORD0;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				float4 uv3 : TEXCOORD3;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.uv0 = v.uv0;
				o.uv1 = v.uv1;
				o.uv2 = v.uv2;
				o.uv3 = v.uv3;
				
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.uv0 = patch[0].uv0 * bary.x + patch[1].uv0 * bary.y + patch[2].uv0 * bary.z;
				o.uv1 = patch[0].uv1 * bary.x + patch[1].uv1 * bary.y + patch[2].uv1 * bary.z;
				o.uv2 = patch[0].uv2 * bary.x + patch[1].uv2 * bary.y + patch[2].uv2 * bary.z;
				o.uv3 = patch[0].uv3 * bary.x + patch[1].uv3 * bary.y + patch[2].uv3 * bary.z;
				
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput Vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			float4 Frag( VertexOutput packedInput  ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID( packedInput );
				FragInputs input;
				ZERO_INITIALIZE( FragInputs, input );
				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;

				PositionInputs posInput = GetPositionInput( input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS );

				float3 V = float3( 1.0, 1.0, 1.0 );

				SurfaceDescription surfaceDescription = (SurfaceDescription)0;
				float3 hsvTorgb2_g7 = RGBToHSV( CZY_CloudColor.rgb );
				float3 hsvTorgb3_g7 = HSVToRGB( float3(hsvTorgb2_g7.x,saturate( ( hsvTorgb2_g7.y + CZY_FilterSaturation ) ),( hsvTorgb2_g7.z + CZY_FilterValue )) );
				float4 temp_output_10_0_g7 = ( float4( hsvTorgb3_g7 , 0.0 ) * CZY_FilterColor );
				float4 CloudColor41_g5 = ( temp_output_10_0_g7 * CZY_CloudFilterColor );
				float3 hsvTorgb2_g6 = RGBToHSV( CZY_CloudHighlightColor.rgb );
				float3 hsvTorgb3_g6 = HSVToRGB( float3(hsvTorgb2_g6.x,saturate( ( hsvTorgb2_g6.y + CZY_FilterSaturation ) ),( hsvTorgb2_g6.z + CZY_FilterValue )) );
				float4 temp_output_10_0_g6 = ( float4( hsvTorgb3_g6 , 0.0 ) * CZY_FilterColor );
				float4 CloudHighlightColor55_g5 = ( temp_output_10_0_g6 * CZY_SunFilterColor );
				float2 texCoord31_g5 = packedInput.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float2 Pos33_g5 = texCoord31_g5;
				float mulTime29_g5 = _TimeParameters.x * ( 0.001 * CZY_WindSpeed );
				float TIme30_g5 = mulTime29_g5;
				float simplePerlin2D409_g5 = snoise( ( Pos33_g5 + ( TIme30_g5 * float2( 0.2,-0.4 ) ) )*( 100.0 / CZY_MainCloudScale ) );
				simplePerlin2D409_g5 = simplePerlin2D409_g5*0.5 + 0.5;
				float SimpleCloudDensity153_g5 = simplePerlin2D409_g5;
				float time81_g5 = 0.0;
				float2 voronoiSmoothId81_g5 = 0;
				float2 temp_output_94_0_g5 = ( Pos33_g5 + ( TIme30_g5 * float2( 0.3,0.2 ) ) );
				float2 coords81_g5 = temp_output_94_0_g5 * ( 140.0 / CZY_MainCloudScale );
				float2 id81_g5 = 0;
				float2 uv81_g5 = 0;
				float voroi81_g5 = voronoi81_g5( coords81_g5, time81_g5, id81_g5, uv81_g5, 0, voronoiSmoothId81_g5 );
				float time88_g5 = 0.0;
				float2 voronoiSmoothId88_g5 = 0;
				float2 coords88_g5 = temp_output_94_0_g5 * ( 500.0 / CZY_MainCloudScale );
				float2 id88_g5 = 0;
				float2 uv88_g5 = 0;
				float voroi88_g5 = voronoi88_g5( coords88_g5, time88_g5, id88_g5, uv88_g5, 0, voronoiSmoothId88_g5 );
				float2 appendResult95_g5 = (float2(voroi81_g5 , voroi88_g5));
				float2 VoroDetails109_g5 = appendResult95_g5;
				float CumulusCoverage34_g5 = CZY_CumulusCoverageMultiplier;
				float ComplexCloudDensity141_g5 = (0.0 + (min( SimpleCloudDensity153_g5 , ( 1.0 - VoroDetails109_g5.x ) ) - ( 1.0 - CumulusCoverage34_g5 )) * (1.0 - 0.0) / (1.0 - ( 1.0 - CumulusCoverage34_g5 )));
				float4 lerpResult315_g5 = lerp( CloudHighlightColor55_g5 , CloudColor41_g5 , saturate( (2.0 + (ComplexCloudDensity141_g5 - 0.0) * (0.7 - 2.0) / (1.0 - 0.0)) ));
				float3 ase_worldPos = packedInput.ase_texcoord3.xyz;
				float3 normalizeResult40_g5 = normalize( ( ase_worldPos - _WorldSpaceCameraPos ) );
				float dotResult42_g5 = dot( normalizeResult40_g5 , CZY_SunDirection );
				float temp_output_49_0_g5 = abs( (dotResult42_g5*0.5 + 0.5) );
				half LightMask56_g5 = saturate( pow( temp_output_49_0_g5 , CZY_SunFlareFalloff ) );
				float time200_g5 = 0.0;
				float2 voronoiSmoothId200_g5 = 0;
				float mulTime163_g5 = _TimeParameters.x * 0.003;
				float2 coords200_g5 = (Pos33_g5*1.0 + ( float2( 1,-2 ) * mulTime163_g5 )) * 10.0;
				float2 id200_g5 = 0;
				float2 uv200_g5 = 0;
				float voroi200_g5 = voronoi200_g5( coords200_g5, time200_g5, id200_g5, uv200_g5, 0, voronoiSmoothId200_g5 );
				float time232_g5 = ( 10.0 * mulTime163_g5 );
				float2 voronoiSmoothId232_g5 = 0;
				float2 coords232_g5 = packedInput.ase_texcoord2.xy * 10.0;
				float2 id232_g5 = 0;
				float2 uv232_g5 = 0;
				float voroi232_g5 = voronoi232_g5( coords232_g5, time232_g5, id232_g5, uv232_g5, 0, voronoiSmoothId232_g5 );
				float AltoCumulusPlacement376_g5 = saturate( ( ( ( 1.0 - 0.0 ) - (1.0 + (voroi200_g5 - 0.0) * (-0.5 - 1.0) / (1.0 - 0.0)) ) - voroi232_g5 ) );
				float CloudThicknessDetails286_g5 = ( VoroDetails109_g5.y * saturate( ( AltoCumulusPlacement376_g5 - 0.8 ) ) );
				float3 normalizeResult43_g5 = normalize( ( ase_worldPos - _WorldSpaceCameraPos ) );
				float dotResult46_g5 = dot( normalizeResult43_g5 , CZY_MoonDirection );
				half MoonlightMask57_g5 = saturate( pow( abs( (dotResult46_g5*0.5 + 0.5) ) , CZY_CloudMoonFalloff ) );
				float3 hsvTorgb2_g8 = RGBToHSV( CZY_CloudMoonColor.rgb );
				float3 hsvTorgb3_g8 = HSVToRGB( float3(hsvTorgb2_g8.x,saturate( ( hsvTorgb2_g8.y + CZY_FilterSaturation ) ),( hsvTorgb2_g8.z + CZY_FilterValue )) );
				float4 temp_output_10_0_g8 = ( float4( hsvTorgb3_g8 , 0.0 ) * CZY_FilterColor );
				float4 MoonlightColor60_g5 = ( temp_output_10_0_g8 * CZY_CloudFilterColor );
				float4 lerpResult338_g5 = lerp( ( lerpResult315_g5 + ( LightMask56_g5 * CloudHighlightColor55_g5 * ( 1.0 - CloudThicknessDetails286_g5 ) ) + ( MoonlightMask57_g5 * MoonlightColor60_g5 * ( 1.0 - CloudThicknessDetails286_g5 ) ) ) , ( CloudColor41_g5 * float4( 0.5660378,0.5660378,0.5660378,0 ) ) , CloudThicknessDetails286_g5);
				float time84_g5 = 0.0;
				float2 voronoiSmoothId84_g5 = 0;
				float2 coords84_g5 = ( Pos33_g5 + ( TIme30_g5 * float2( 0.3,0.2 ) ) ) * ( 100.0 / CZY_DetailScale );
				float2 id84_g5 = 0;
				float2 uv84_g5 = 0;
				float fade84_g5 = 0.5;
				float voroi84_g5 = 0;
				float rest84_g5 = 0;
				for( int it84_g5 = 0; it84_g5 <3; it84_g5++ ){
				voroi84_g5 += fade84_g5 * voronoi84_g5( coords84_g5, time84_g5, id84_g5, uv84_g5, 0,voronoiSmoothId84_g5 );
				rest84_g5 += fade84_g5;
				coords84_g5 *= 2;
				fade84_g5 *= 0.5;
				}//Voronoi84_g5
				voroi84_g5 /= rest84_g5;
				float temp_output_173_0_g5 = ( (0.0 + (( 1.0 - voroi84_g5 ) - 0.3) * (0.5 - 0.0) / (1.0 - 0.3)) * 0.1 * CZY_DetailAmount );
				float DetailedClouds252_g5 = saturate( ( ComplexCloudDensity141_g5 + temp_output_173_0_g5 ) );
				float CloudDetail179_g5 = temp_output_173_0_g5;
				float2 texCoord79_g5 = packedInput.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float2 temp_output_161_0_g5 = ( texCoord79_g5 - float2( 0.5,0.5 ) );
				float dotResult212_g5 = dot( temp_output_161_0_g5 , temp_output_161_0_g5 );
				float BorderHeight154_g5 = ( 1.0 - CZY_BorderHeight );
				float temp_output_151_0_g5 = ( -2.0 * ( 1.0 - CZY_BorderVariation ) );
				float clampResult247_g5 = clamp( ( ( ( CloudDetail179_g5 + SimpleCloudDensity153_g5 ) * saturate( (( BorderHeight154_g5 * temp_output_151_0_g5 ) + (dotResult212_g5 - 0.0) * (( temp_output_151_0_g5 * -4.0 ) - ( BorderHeight154_g5 * temp_output_151_0_g5 )) / (0.5 - 0.0)) ) ) * 10.0 * CZY_BorderEffect ) , -1.0 , 1.0 );
				float BorderLightTransport278_g5 = clampResult247_g5;
				float3 normalizeResult116_g5 = normalize( ( ase_worldPos - _WorldSpaceCameraPos ) );
				float3 normalizeResult146_g5 = normalize( CZY_StormDirection );
				float dotResult150_g5 = dot( normalizeResult116_g5 , normalizeResult146_g5 );
				float2 texCoord98_g5 = packedInput.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float2 temp_output_124_0_g5 = ( texCoord98_g5 - float2( 0.5,0.5 ) );
				float dotResult125_g5 = dot( temp_output_124_0_g5 , temp_output_124_0_g5 );
				float temp_output_140_0_g5 = ( -2.0 * ( 1.0 - ( CZY_NimbusVariation * 0.9 ) ) );
				float NimbusLightTransport269_g5 = saturate( ( ( ( CloudDetail179_g5 + SimpleCloudDensity153_g5 ) * saturate( (( ( 1.0 - CZY_NimbusMultiplier ) * temp_output_140_0_g5 ) + (( dotResult150_g5 + ( CZY_NimbusHeight * 4.0 * dotResult125_g5 ) ) - 0.5) * (( temp_output_140_0_g5 * -4.0 ) - ( ( 1.0 - CZY_NimbusMultiplier ) * temp_output_140_0_g5 )) / (7.0 - 0.5)) ) ) * 10.0 ) );
				float mulTime104_g5 = _TimeParameters.x * 0.01;
				float simplePerlin2D143_g5 = snoise( (Pos33_g5*1.0 + mulTime104_g5)*2.0 );
				float mulTime93_g5 = _TimeParameters.x * CZY_ChemtrailsMoveSpeed;
				float cos97_g5 = cos( ( mulTime93_g5 * 0.01 ) );
				float sin97_g5 = sin( ( mulTime93_g5 * 0.01 ) );
				float2 rotator97_g5 = mul( Pos33_g5 - float2( 0.5,0.5 ) , float2x2( cos97_g5 , -sin97_g5 , sin97_g5 , cos97_g5 )) + float2( 0.5,0.5 );
				float cos131_g5 = cos( ( mulTime93_g5 * -0.02 ) );
				float sin131_g5 = sin( ( mulTime93_g5 * -0.02 ) );
				float2 rotator131_g5 = mul( Pos33_g5 - float2( 0.5,0.5 ) , float2x2( cos131_g5 , -sin131_g5 , sin131_g5 , cos131_g5 )) + float2( 0.5,0.5 );
				float mulTime107_g5 = _TimeParameters.x * 0.01;
				float simplePerlin2D147_g5 = snoise( (Pos33_g5*1.0 + mulTime107_g5)*4.0 );
				float4 ChemtrailsPattern210_g5 = ( ( saturate( simplePerlin2D143_g5 ) * tex2D( CZY_ChemtrailsTexture, (rotator97_g5*0.5 + 0.0) ) ) + ( tex2D( CZY_ChemtrailsTexture, rotator131_g5 ) * saturate( simplePerlin2D147_g5 ) ) );
				float2 texCoord139_g5 = packedInput.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float2 temp_output_162_0_g5 = ( texCoord139_g5 - float2( 0.5,0.5 ) );
				float dotResult207_g5 = dot( temp_output_162_0_g5 , temp_output_162_0_g5 );
				float ChemtrailsFinal248_g5 = ( ( ChemtrailsPattern210_g5 * saturate( (0.4 + (dotResult207_g5 - 0.0) * (2.0 - 0.4) / (0.1 - 0.0)) ) ).r > ( 1.0 - ( CZY_ChemtrailsMultiplier * 0.5 ) ) ? 1.0 : 0.0 );
				float mulTime80_g5 = _TimeParameters.x * 0.01;
				float simplePerlin2D126_g5 = snoise( (Pos33_g5*1.0 + mulTime80_g5)*2.0 );
				float mulTime75_g5 = _TimeParameters.x * CZY_CirrusMoveSpeed;
				float cos101_g5 = cos( ( mulTime75_g5 * 0.01 ) );
				float sin101_g5 = sin( ( mulTime75_g5 * 0.01 ) );
				float2 rotator101_g5 = mul( Pos33_g5 - float2( 0.5,0.5 ) , float2x2( cos101_g5 , -sin101_g5 , sin101_g5 , cos101_g5 )) + float2( 0.5,0.5 );
				float cos112_g5 = cos( ( mulTime75_g5 * -0.02 ) );
				float sin112_g5 = sin( ( mulTime75_g5 * -0.02 ) );
				float2 rotator112_g5 = mul( Pos33_g5 - float2( 0.5,0.5 ) , float2x2( cos112_g5 , -sin112_g5 , sin112_g5 , cos112_g5 )) + float2( 0.5,0.5 );
				float mulTime135_g5 = _TimeParameters.x * 0.01;
				float simplePerlin2D122_g5 = snoise( (Pos33_g5*1.0 + mulTime135_g5) );
				simplePerlin2D122_g5 = simplePerlin2D122_g5*0.5 + 0.5;
				float4 CirrusPattern137_g5 = ( ( saturate( simplePerlin2D126_g5 ) * tex2D( CZY_CirrusTexture, (rotator101_g5*1.5 + 0.75) ) ) + ( tex2D( CZY_CirrusTexture, (rotator112_g5*1.0 + 0.0) ) * saturate( simplePerlin2D122_g5 ) ) );
				float2 texCoord134_g5 = packedInput.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float2 temp_output_164_0_g5 = ( texCoord134_g5 - float2( 0.5,0.5 ) );
				float dotResult157_g5 = dot( temp_output_164_0_g5 , temp_output_164_0_g5 );
				float4 temp_output_217_0_g5 = ( CirrusPattern137_g5 * saturate( (0.0 + (dotResult157_g5 - 0.0) * (2.0 - 0.0) / (0.2 - 0.0)) ) );
				float Clipping208_g5 = CZY_ClippingThreshold;
				float CirrusAlpha250_g5 = ( ( temp_output_217_0_g5 * ( CZY_CirrusMultiplier * 10.0 ) ).r > Clipping208_g5 ? 1.0 : 0.0 );
				float SimpleRadiance268_g5 = saturate( ( DetailedClouds252_g5 + BorderLightTransport278_g5 + NimbusLightTransport269_g5 + ChemtrailsFinal248_g5 + CirrusAlpha250_g5 ) );
				float4 lerpResult342_g5 = lerp( CloudColor41_g5 , lerpResult338_g5 , ( 1.0 - SimpleRadiance268_g5 ));
				float CloudLight52_g5 = saturate( pow( temp_output_49_0_g5 , CZY_SunFlareFalloff ) );
				float4 lerpResult316_g5 = lerp( float4( 0,0,0,0 ) , CloudHighlightColor55_g5 , ( saturate( ( AltoCumulusPlacement376_g5 - 1.0 ) ) * CloudDetail179_g5 * CloudLight52_g5 ));
				float4 SunThroughClouds399_g5 = ( lerpResult316_g5 * 1.3 );
				float3 hsvTorgb2_g9 = RGBToHSV( CZY_AltoCloudColor.rgb );
				float3 hsvTorgb3_g9 = HSVToRGB( float3(hsvTorgb2_g9.x,saturate( ( hsvTorgb2_g9.y + CZY_FilterSaturation ) ),( hsvTorgb2_g9.z + CZY_FilterValue )) );
				float4 temp_output_10_0_g9 = ( float4( hsvTorgb3_g9 , 0.0 ) * CZY_FilterColor );
				float4 CirrusCustomLightColor350_g5 = ( CloudColor41_g5 * ( temp_output_10_0_g9 * CZY_CloudFilterColor ) );
				float temp_output_391_0_g5 = ( AltoCumulusPlacement376_g5 * (0.0 + (tex2D( CZY_AltocumulusTexture, ((Pos33_g5*1.0 + ( CZY_AltocumulusWindSpeed * TIme30_g5 ))*( 1.0 / CZY_AltocumulusScale ) + 0.0) ).r - 0.0) * (1.0 - 0.0) / (0.2 - 0.0)) * CZY_AltocumulusMultiplier );
				float AltoCumulusLightTransport393_g5 = temp_output_391_0_g5;
				float ACCustomLightsClipping387_g5 = ( AltoCumulusLightTransport393_g5 * ( SimpleRadiance268_g5 > Clipping208_g5 ? 0.0 : 1.0 ) );
				float mulTime193_g5 = _TimeParameters.x * 0.01;
				float simplePerlin2D224_g5 = snoise( (Pos33_g5*1.0 + mulTime193_g5)*2.0 );
				float mulTime178_g5 = _TimeParameters.x * CZY_CirrostratusMoveSpeed;
				float cos138_g5 = cos( ( mulTime178_g5 * 0.01 ) );
				float sin138_g5 = sin( ( mulTime178_g5 * 0.01 ) );
				float2 rotator138_g5 = mul( Pos33_g5 - float2( 0.5,0.5 ) , float2x2( cos138_g5 , -sin138_g5 , sin138_g5 , cos138_g5 )) + float2( 0.5,0.5 );
				float cos198_g5 = cos( ( mulTime178_g5 * -0.02 ) );
				float sin198_g5 = sin( ( mulTime178_g5 * -0.02 ) );
				float2 rotator198_g5 = mul( Pos33_g5 - float2( 0.5,0.5 ) , float2x2( cos198_g5 , -sin198_g5 , sin198_g5 , cos198_g5 )) + float2( 0.5,0.5 );
				float mulTime184_g5 = _TimeParameters.x * 0.01;
				float simplePerlin2D216_g5 = snoise( (Pos33_g5*10.0 + mulTime184_g5)*4.0 );
				float4 CirrostratPattern261_g5 = ( ( saturate( simplePerlin2D224_g5 ) * tex2D( CZY_CirrostratusTexture, (rotator138_g5*1.5 + 0.75) ) ) + ( tex2D( CZY_CirrostratusTexture, (rotator198_g5*1.5 + 0.75) ) * saturate( simplePerlin2D216_g5 ) ) );
				float2 texCoord234_g5 = packedInput.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float2 temp_output_243_0_g5 = ( texCoord234_g5 - float2( 0.5,0.5 ) );
				float dotResult238_g5 = dot( temp_output_243_0_g5 , temp_output_243_0_g5 );
				float clampResult264_g5 = clamp( ( CZY_CirrostratusMultiplier * 0.5 ) , 0.0 , 0.98 );
				float CirrostratLightTransport281_g5 = ( ( CirrostratPattern261_g5 * saturate( (0.4 + (dotResult238_g5 - 0.0) * (2.0 - 0.4) / (0.1 - 0.0)) ) ).r > ( 1.0 - clampResult264_g5 ) ? 1.0 : 0.0 );
				float CSCustomLightsClipping309_g5 = ( CirrostratLightTransport281_g5 * ( SimpleRadiance268_g5 > Clipping208_g5 ? 0.0 : 1.0 ) );
				float CustomRadiance340_g5 = saturate( ( ACCustomLightsClipping387_g5 + CSCustomLightsClipping309_g5 ) );
				float4 lerpResult331_g5 = lerp( ( lerpResult342_g5 + SunThroughClouds399_g5 ) , CirrusCustomLightColor350_g5 , CustomRadiance340_g5);
				float FinalAlpha375_g5 = saturate( ( DetailedClouds252_g5 + BorderLightTransport278_g5 + AltoCumulusLightTransport393_g5 + ChemtrailsFinal248_g5 + CirrostratLightTransport281_g5 + CirrusAlpha250_g5 + NimbusLightTransport269_g5 ) );
				float4 appendResult420_g5 = (float4((lerpResult331_g5).rgb , FinalAlpha375_g5));
				float4 FinalCloudColor325_g5 = appendResult420_g5;
				
				surfaceDescription.Color = FinalCloudColor325_g5.xyz;
				surfaceDescription.Emission = 0;
				surfaceDescription.Alpha = ( ( (FinalCloudColor325_g5).w * ( 1.0 - 0.0 ) ) > Clipping208_g5 ? 1.0 : 0.0 );
				surfaceDescription.AlphaClipThreshold =  Clipping208_g5;

				SurfaceData surfaceData;
				BuiltinData builtinData;
				GetSurfaceAndBuiltinData( surfaceDescription,input, V, posInput, surfaceData, builtinData );

				BSDFData bsdfData = ConvertSurfaceDataToBSDFData( input.positionSS.xy, surfaceData );
				LightTransportData lightTransportData = GetLightTransportData( surfaceData, builtinData, bsdfData );

				float4 res = float4( 0.0, 0.0, 0.0, 1.0 );
				UnityMetaInput metaInput;
				metaInput.Albedo = lightTransportData.diffuseColor.rgb;
				metaInput.Emission = lightTransportData.emissiveColor;
			#ifdef EDITOR_VISUALIZATION
				metaInput.VizUV = packedInput.VizUV;
				metaInput.LightCoord = packedInput.LightCoord;
			#endif
				res = UnityMetaFragment(metaInput);

				return res;
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "SceneSelectionPass"
			Tags { "LightMode"="SceneSelectionPass" }

			Cull Off

			HLSLPROGRAM

			#pragma shader_feature_local_fragment _ENABLE_FOG_ON_TRANSPARENT
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#define ASE_SRP_VERSION 120108


			#pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _ALPHATEST_ON

			#pragma editor_sync_compilation

			#pragma multi_compile _ DOTS_INSTANCING_ON

			#pragma vertex Vert
			#pragma fragment Frag

			#define SHADERPASS SHADERPASS_DEPTH_ONLY
			#define SCENESELECTIONPASS 1

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
            #include "Packages/com.unity.shadergraph/ShaderGraphLibrary/Functions.hlsl"

			int _ObjectId;
			int _PassValue;

			CBUFFER_START( UnityPerMaterial )
						float4 _EmissionColor;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			#ifdef _ENABLE_SHADOW_MATTE
			float _ShadowMatteFilter;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _AlphaCutoff;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			float _EnableBlendModePreserveSpecularLighting;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			float4 CZY_CloudColor;
			float CZY_FilterSaturation;
			float CZY_FilterValue;
			float4 CZY_FilterColor;
			float4 CZY_CloudFilterColor;
			float4 CZY_CloudHighlightColor;
			float4 CZY_SunFilterColor;
			float CZY_WindSpeed;
			float CZY_MainCloudScale;
			float CZY_CumulusCoverageMultiplier;
			float3 CZY_SunDirection;
			half CZY_SunFlareFalloff;
			float3 CZY_MoonDirection;
			half CZY_CloudMoonFalloff;
			float4 CZY_CloudMoonColor;
			float CZY_DetailScale;
			float CZY_DetailAmount;
			float CZY_BorderHeight;
			float CZY_BorderVariation;
			float CZY_BorderEffect;
			float3 CZY_StormDirection;
			float CZY_NimbusHeight;
			float CZY_NimbusMultiplier;
			float CZY_NimbusVariation;
			sampler2D CZY_ChemtrailsTexture;
			float CZY_ChemtrailsMoveSpeed;
			float CZY_ChemtrailsMultiplier;
			sampler2D CZY_CirrusTexture;
			float CZY_CirrusMoveSpeed;
			float CZY_CirrusMultiplier;
			float CZY_ClippingThreshold;
			float4 CZY_AltoCloudColor;
			sampler2D CZY_AltocumulusTexture;
			float2 CZY_AltocumulusWindSpeed;
			float CZY_AltocumulusScale;
			float CZY_AltocumulusMultiplier;
			sampler2D CZY_CirrostratusTexture;
			float CZY_CirrostratusMoveSpeed;
			float CZY_CirrostratusMultiplier;


			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/PickingSpaceTransforms.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Unlit/Unlit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			

			struct VertexInput
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_Position;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};


			float3 HSVToRGB( float3 c )
			{
				float4 K = float4( 1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0 );
				float3 p = abs( frac( c.xxx + K.xyz ) * 6.0 - K.www );
				return c.z * lerp( K.xxx, saturate( p - K.xxx ), c.y );
			}
			
			float3 RGBToHSV(float3 c)
			{
				float4 K = float4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
				float4 p = lerp( float4( c.bg, K.wz ), float4( c.gb, K.xy ), step( c.b, c.g ) );
				float4 q = lerp( float4( p.xyw, c.r ), float4( c.r, p.yzx ), step( p.x, c.r ) );
				float d = q.x - min( q.w, q.y );
				float e = 1.0e-10;
				return float3( abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
			}
			float3 mod2D289( float3 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }
			float2 mod2D289( float2 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }
			float3 permute( float3 x ) { return mod2D289( ( ( x * 34.0 ) + 1.0 ) * x ); }
			float snoise( float2 v )
			{
				const float4 C = float4( 0.211324865405187, 0.366025403784439, -0.577350269189626, 0.024390243902439 );
				float2 i = floor( v + dot( v, C.yy ) );
				float2 x0 = v - i + dot( i, C.xx );
				float2 i1;
				i1 = ( x0.x > x0.y ) ? float2( 1.0, 0.0 ) : float2( 0.0, 1.0 );
				float4 x12 = x0.xyxy + C.xxzz;
				x12.xy -= i1;
				i = mod2D289( i );
				float3 p = permute( permute( i.y + float3( 0.0, i1.y, 1.0 ) ) + i.x + float3( 0.0, i1.x, 1.0 ) );
				float3 m = max( 0.5 - float3( dot( x0, x0 ), dot( x12.xy, x12.xy ), dot( x12.zw, x12.zw ) ), 0.0 );
				m = m * m;
				m = m * m;
				float3 x = 2.0 * frac( p * C.www ) - 1.0;
				float3 h = abs( x ) - 0.5;
				float3 ox = floor( x + 0.5 );
				float3 a0 = x - ox;
				m *= 1.79284291400159 - 0.85373472095314 * ( a0 * a0 + h * h );
				float3 g;
				g.x = a0.x * x0.x + h.x * x0.y;
				g.yz = a0.yz * x12.xz + h.yz * x12.yw;
				return 130.0 * dot( m, g );
			}
			
					float2 voronoihash81_g5( float2 p )
					{
						
						p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
						return frac( sin( p ) *43758.5453);
					}
			
					float voronoi81_g5( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
					{
						float2 n = floor( v );
						float2 f = frac( v );
						float F1 = 8.0;
						float F2 = 8.0; float2 mg = 0;
						for ( int j = -1; j <= 1; j++ )
						{
							for ( int i = -1; i <= 1; i++ )
						 	{
						 		float2 g = float2( i, j );
						 		float2 o = voronoihash81_g5( n + g );
								o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
								float d = 0.5 * dot( r, r );
						 		if( d<F1 ) {
						 			F2 = F1;
						 			F1 = d; mg = g; mr = r; id = o;
						 		} else if( d<F2 ) {
						 			F2 = d;
						
						 		}
						 	}
						}
						return (F2 + F1) * 0.5;
					}
			
					float2 voronoihash88_g5( float2 p )
					{
						
						p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
						return frac( sin( p ) *43758.5453);
					}
			
					float voronoi88_g5( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
					{
						float2 n = floor( v );
						float2 f = frac( v );
						float F1 = 8.0;
						float F2 = 8.0; float2 mg = 0;
						for ( int j = -1; j <= 1; j++ )
						{
							for ( int i = -1; i <= 1; i++ )
						 	{
						 		float2 g = float2( i, j );
						 		float2 o = voronoihash88_g5( n + g );
								o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
								float d = 0.5 * dot( r, r );
						 		if( d<F1 ) {
						 			F2 = F1;
						 			F1 = d; mg = g; mr = r; id = o;
						 		} else if( d<F2 ) {
						 			F2 = d;
						
						 		}
						 	}
						}
						return (F2 + F1) * 0.5;
					}
			
					float2 voronoihash200_g5( float2 p )
					{
						
						p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
						return frac( sin( p ) *43758.5453);
					}
			
					float voronoi200_g5( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
					{
						float2 n = floor( v );
						float2 f = frac( v );
						float F1 = 8.0;
						float F2 = 8.0; float2 mg = 0;
						for ( int j = -1; j <= 1; j++ )
						{
							for ( int i = -1; i <= 1; i++ )
						 	{
						 		float2 g = float2( i, j );
						 		float2 o = voronoihash200_g5( n + g );
								o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
								float d = 0.5 * dot( r, r );
						 		if( d<F1 ) {
						 			F2 = F1;
						 			F1 = d; mg = g; mr = r; id = o;
						 		} else if( d<F2 ) {
						 			F2 = d;
						
						 		}
						 	}
						}
						return (F2 + F1) * 0.5;
					}
			
					float2 voronoihash232_g5( float2 p )
					{
						
						p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
						return frac( sin( p ) *43758.5453);
					}
			
					float voronoi232_g5( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
					{
						float2 n = floor( v );
						float2 f = frac( v );
						float F1 = 8.0;
						float F2 = 8.0; float2 mg = 0;
						for ( int j = -1; j <= 1; j++ )
						{
							for ( int i = -1; i <= 1; i++ )
						 	{
						 		float2 g = float2( i, j );
						 		float2 o = voronoihash232_g5( n + g );
								o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
								float d = 0.5 * dot( r, r );
						 		if( d<F1 ) {
						 			F2 = F1;
						 			F1 = d; mg = g; mr = r; id = o;
						 		} else if( d<F2 ) {
						 			F2 = d;
						
						 		}
						 	}
						}
						return F1;
					}
			
					float2 voronoihash84_g5( float2 p )
					{
						
						p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
						return frac( sin( p ) *43758.5453);
					}
			
					float voronoi84_g5( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
					{
						float2 n = floor( v );
						float2 f = frac( v );
						float F1 = 8.0;
						float F2 = 8.0; float2 mg = 0;
						for ( int j = -1; j <= 1; j++ )
						{
							for ( int i = -1; i <= 1; i++ )
						 	{
						 		float2 g = float2( i, j );
						 		float2 o = voronoihash84_g5( n + g );
								o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
								float d = 0.5 * dot( r, r );
						 		if( d<F1 ) {
						 			F2 = F1;
						 			F1 = d; mg = g; mr = r; id = o;
						 		} else if( d<F2 ) {
						 			F2 = d;
						
						 		}
						 	}
						}
						return F1;
					}
			

			struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
			};

			void BuildSurfaceData(FragInputs fragInputs, SurfaceDescription surfaceDescription, float3 V, out SurfaceData surfaceData)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				#ifdef WRITE_NORMAL_BUFFER
				surfaceData.normalWS = fragInputs.tangentToWorld[2];
				#endif
			}

			void GetSurfaceAndBuiltinData(SurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
                LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
                #endif

				#if _ALPHATEST_ON
				DoAlphaTest ( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				BuildSurfaceData(fragInputs, surfaceDescription, V, surfaceData);
				ZERO_INITIALIZE(BuiltinData, builtinData);
				builtinData.opacity =  surfaceDescription.Alpha;

				#ifdef _ALPHATEST_ON
                    builtinData.alphaClipTreshold = surfaceDescription.AlphaClipThreshold;
                #endif

				#if _DEPTHOFFSET_ON
                builtinData.depthOffset = surfaceDescription.DepthOffset;
                #endif


                ApplyDebugToBuiltinData(builtinData);
			}

			VertexOutput VertexFunction( VertexInput inputMesh  )
			{
				VertexOutput o;
				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				o.ase_texcoord1.xyz = ase_worldPos;
				
				o.ase_texcoord.xy = inputMesh.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord.zw = 0;
				o.ase_texcoord1.w = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue =   defaultVertexValue ;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS =  inputMesh.normalOS ;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				o.positionCS = TransformWorldToHClip(positionRWS);
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput Vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			void Frag( VertexOutput packedInput
					, out float4 outColor : SV_Target0
					#ifdef _DEPTHOFFSET_ON
					, out float outputDepth : SV_Depth
					#endif
					
					)
			{
				UNITY_SETUP_INSTANCE_ID( packedInput );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

				float3 V = float3( 1.0, 1.0, 1.0 );

				SurfaceData surfaceData;
				BuiltinData builtinData;
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;
				float3 hsvTorgb2_g7 = RGBToHSV( CZY_CloudColor.rgb );
				float3 hsvTorgb3_g7 = HSVToRGB( float3(hsvTorgb2_g7.x,saturate( ( hsvTorgb2_g7.y + CZY_FilterSaturation ) ),( hsvTorgb2_g7.z + CZY_FilterValue )) );
				float4 temp_output_10_0_g7 = ( float4( hsvTorgb3_g7 , 0.0 ) * CZY_FilterColor );
				float4 CloudColor41_g5 = ( temp_output_10_0_g7 * CZY_CloudFilterColor );
				float3 hsvTorgb2_g6 = RGBToHSV( CZY_CloudHighlightColor.rgb );
				float3 hsvTorgb3_g6 = HSVToRGB( float3(hsvTorgb2_g6.x,saturate( ( hsvTorgb2_g6.y + CZY_FilterSaturation ) ),( hsvTorgb2_g6.z + CZY_FilterValue )) );
				float4 temp_output_10_0_g6 = ( float4( hsvTorgb3_g6 , 0.0 ) * CZY_FilterColor );
				float4 CloudHighlightColor55_g5 = ( temp_output_10_0_g6 * CZY_SunFilterColor );
				float2 texCoord31_g5 = packedInput.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 Pos33_g5 = texCoord31_g5;
				float mulTime29_g5 = _TimeParameters.x * ( 0.001 * CZY_WindSpeed );
				float TIme30_g5 = mulTime29_g5;
				float simplePerlin2D409_g5 = snoise( ( Pos33_g5 + ( TIme30_g5 * float2( 0.2,-0.4 ) ) )*( 100.0 / CZY_MainCloudScale ) );
				simplePerlin2D409_g5 = simplePerlin2D409_g5*0.5 + 0.5;
				float SimpleCloudDensity153_g5 = simplePerlin2D409_g5;
				float time81_g5 = 0.0;
				float2 voronoiSmoothId81_g5 = 0;
				float2 temp_output_94_0_g5 = ( Pos33_g5 + ( TIme30_g5 * float2( 0.3,0.2 ) ) );
				float2 coords81_g5 = temp_output_94_0_g5 * ( 140.0 / CZY_MainCloudScale );
				float2 id81_g5 = 0;
				float2 uv81_g5 = 0;
				float voroi81_g5 = voronoi81_g5( coords81_g5, time81_g5, id81_g5, uv81_g5, 0, voronoiSmoothId81_g5 );
				float time88_g5 = 0.0;
				float2 voronoiSmoothId88_g5 = 0;
				float2 coords88_g5 = temp_output_94_0_g5 * ( 500.0 / CZY_MainCloudScale );
				float2 id88_g5 = 0;
				float2 uv88_g5 = 0;
				float voroi88_g5 = voronoi88_g5( coords88_g5, time88_g5, id88_g5, uv88_g5, 0, voronoiSmoothId88_g5 );
				float2 appendResult95_g5 = (float2(voroi81_g5 , voroi88_g5));
				float2 VoroDetails109_g5 = appendResult95_g5;
				float CumulusCoverage34_g5 = CZY_CumulusCoverageMultiplier;
				float ComplexCloudDensity141_g5 = (0.0 + (min( SimpleCloudDensity153_g5 , ( 1.0 - VoroDetails109_g5.x ) ) - ( 1.0 - CumulusCoverage34_g5 )) * (1.0 - 0.0) / (1.0 - ( 1.0 - CumulusCoverage34_g5 )));
				float4 lerpResult315_g5 = lerp( CloudHighlightColor55_g5 , CloudColor41_g5 , saturate( (2.0 + (ComplexCloudDensity141_g5 - 0.0) * (0.7 - 2.0) / (1.0 - 0.0)) ));
				float3 ase_worldPos = packedInput.ase_texcoord1.xyz;
				float3 normalizeResult40_g5 = normalize( ( ase_worldPos - _WorldSpaceCameraPos ) );
				float dotResult42_g5 = dot( normalizeResult40_g5 , CZY_SunDirection );
				float temp_output_49_0_g5 = abs( (dotResult42_g5*0.5 + 0.5) );
				half LightMask56_g5 = saturate( pow( temp_output_49_0_g5 , CZY_SunFlareFalloff ) );
				float time200_g5 = 0.0;
				float2 voronoiSmoothId200_g5 = 0;
				float mulTime163_g5 = _TimeParameters.x * 0.003;
				float2 coords200_g5 = (Pos33_g5*1.0 + ( float2( 1,-2 ) * mulTime163_g5 )) * 10.0;
				float2 id200_g5 = 0;
				float2 uv200_g5 = 0;
				float voroi200_g5 = voronoi200_g5( coords200_g5, time200_g5, id200_g5, uv200_g5, 0, voronoiSmoothId200_g5 );
				float time232_g5 = ( 10.0 * mulTime163_g5 );
				float2 voronoiSmoothId232_g5 = 0;
				float2 coords232_g5 = packedInput.ase_texcoord.xy * 10.0;
				float2 id232_g5 = 0;
				float2 uv232_g5 = 0;
				float voroi232_g5 = voronoi232_g5( coords232_g5, time232_g5, id232_g5, uv232_g5, 0, voronoiSmoothId232_g5 );
				float AltoCumulusPlacement376_g5 = saturate( ( ( ( 1.0 - 0.0 ) - (1.0 + (voroi200_g5 - 0.0) * (-0.5 - 1.0) / (1.0 - 0.0)) ) - voroi232_g5 ) );
				float CloudThicknessDetails286_g5 = ( VoroDetails109_g5.y * saturate( ( AltoCumulusPlacement376_g5 - 0.8 ) ) );
				float3 normalizeResult43_g5 = normalize( ( ase_worldPos - _WorldSpaceCameraPos ) );
				float dotResult46_g5 = dot( normalizeResult43_g5 , CZY_MoonDirection );
				half MoonlightMask57_g5 = saturate( pow( abs( (dotResult46_g5*0.5 + 0.5) ) , CZY_CloudMoonFalloff ) );
				float3 hsvTorgb2_g8 = RGBToHSV( CZY_CloudMoonColor.rgb );
				float3 hsvTorgb3_g8 = HSVToRGB( float3(hsvTorgb2_g8.x,saturate( ( hsvTorgb2_g8.y + CZY_FilterSaturation ) ),( hsvTorgb2_g8.z + CZY_FilterValue )) );
				float4 temp_output_10_0_g8 = ( float4( hsvTorgb3_g8 , 0.0 ) * CZY_FilterColor );
				float4 MoonlightColor60_g5 = ( temp_output_10_0_g8 * CZY_CloudFilterColor );
				float4 lerpResult338_g5 = lerp( ( lerpResult315_g5 + ( LightMask56_g5 * CloudHighlightColor55_g5 * ( 1.0 - CloudThicknessDetails286_g5 ) ) + ( MoonlightMask57_g5 * MoonlightColor60_g5 * ( 1.0 - CloudThicknessDetails286_g5 ) ) ) , ( CloudColor41_g5 * float4( 0.5660378,0.5660378,0.5660378,0 ) ) , CloudThicknessDetails286_g5);
				float time84_g5 = 0.0;
				float2 voronoiSmoothId84_g5 = 0;
				float2 coords84_g5 = ( Pos33_g5 + ( TIme30_g5 * float2( 0.3,0.2 ) ) ) * ( 100.0 / CZY_DetailScale );
				float2 id84_g5 = 0;
				float2 uv84_g5 = 0;
				float fade84_g5 = 0.5;
				float voroi84_g5 = 0;
				float rest84_g5 = 0;
				for( int it84_g5 = 0; it84_g5 <3; it84_g5++ ){
				voroi84_g5 += fade84_g5 * voronoi84_g5( coords84_g5, time84_g5, id84_g5, uv84_g5, 0,voronoiSmoothId84_g5 );
				rest84_g5 += fade84_g5;
				coords84_g5 *= 2;
				fade84_g5 *= 0.5;
				}//Voronoi84_g5
				voroi84_g5 /= rest84_g5;
				float temp_output_173_0_g5 = ( (0.0 + (( 1.0 - voroi84_g5 ) - 0.3) * (0.5 - 0.0) / (1.0 - 0.3)) * 0.1 * CZY_DetailAmount );
				float DetailedClouds252_g5 = saturate( ( ComplexCloudDensity141_g5 + temp_output_173_0_g5 ) );
				float CloudDetail179_g5 = temp_output_173_0_g5;
				float2 texCoord79_g5 = packedInput.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 temp_output_161_0_g5 = ( texCoord79_g5 - float2( 0.5,0.5 ) );
				float dotResult212_g5 = dot( temp_output_161_0_g5 , temp_output_161_0_g5 );
				float BorderHeight154_g5 = ( 1.0 - CZY_BorderHeight );
				float temp_output_151_0_g5 = ( -2.0 * ( 1.0 - CZY_BorderVariation ) );
				float clampResult247_g5 = clamp( ( ( ( CloudDetail179_g5 + SimpleCloudDensity153_g5 ) * saturate( (( BorderHeight154_g5 * temp_output_151_0_g5 ) + (dotResult212_g5 - 0.0) * (( temp_output_151_0_g5 * -4.0 ) - ( BorderHeight154_g5 * temp_output_151_0_g5 )) / (0.5 - 0.0)) ) ) * 10.0 * CZY_BorderEffect ) , -1.0 , 1.0 );
				float BorderLightTransport278_g5 = clampResult247_g5;
				float3 normalizeResult116_g5 = normalize( ( ase_worldPos - _WorldSpaceCameraPos ) );
				float3 normalizeResult146_g5 = normalize( CZY_StormDirection );
				float dotResult150_g5 = dot( normalizeResult116_g5 , normalizeResult146_g5 );
				float2 texCoord98_g5 = packedInput.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 temp_output_124_0_g5 = ( texCoord98_g5 - float2( 0.5,0.5 ) );
				float dotResult125_g5 = dot( temp_output_124_0_g5 , temp_output_124_0_g5 );
				float temp_output_140_0_g5 = ( -2.0 * ( 1.0 - ( CZY_NimbusVariation * 0.9 ) ) );
				float NimbusLightTransport269_g5 = saturate( ( ( ( CloudDetail179_g5 + SimpleCloudDensity153_g5 ) * saturate( (( ( 1.0 - CZY_NimbusMultiplier ) * temp_output_140_0_g5 ) + (( dotResult150_g5 + ( CZY_NimbusHeight * 4.0 * dotResult125_g5 ) ) - 0.5) * (( temp_output_140_0_g5 * -4.0 ) - ( ( 1.0 - CZY_NimbusMultiplier ) * temp_output_140_0_g5 )) / (7.0 - 0.5)) ) ) * 10.0 ) );
				float mulTime104_g5 = _TimeParameters.x * 0.01;
				float simplePerlin2D143_g5 = snoise( (Pos33_g5*1.0 + mulTime104_g5)*2.0 );
				float mulTime93_g5 = _TimeParameters.x * CZY_ChemtrailsMoveSpeed;
				float cos97_g5 = cos( ( mulTime93_g5 * 0.01 ) );
				float sin97_g5 = sin( ( mulTime93_g5 * 0.01 ) );
				float2 rotator97_g5 = mul( Pos33_g5 - float2( 0.5,0.5 ) , float2x2( cos97_g5 , -sin97_g5 , sin97_g5 , cos97_g5 )) + float2( 0.5,0.5 );
				float cos131_g5 = cos( ( mulTime93_g5 * -0.02 ) );
				float sin131_g5 = sin( ( mulTime93_g5 * -0.02 ) );
				float2 rotator131_g5 = mul( Pos33_g5 - float2( 0.5,0.5 ) , float2x2( cos131_g5 , -sin131_g5 , sin131_g5 , cos131_g5 )) + float2( 0.5,0.5 );
				float mulTime107_g5 = _TimeParameters.x * 0.01;
				float simplePerlin2D147_g5 = snoise( (Pos33_g5*1.0 + mulTime107_g5)*4.0 );
				float4 ChemtrailsPattern210_g5 = ( ( saturate( simplePerlin2D143_g5 ) * tex2D( CZY_ChemtrailsTexture, (rotator97_g5*0.5 + 0.0) ) ) + ( tex2D( CZY_ChemtrailsTexture, rotator131_g5 ) * saturate( simplePerlin2D147_g5 ) ) );
				float2 texCoord139_g5 = packedInput.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 temp_output_162_0_g5 = ( texCoord139_g5 - float2( 0.5,0.5 ) );
				float dotResult207_g5 = dot( temp_output_162_0_g5 , temp_output_162_0_g5 );
				float ChemtrailsFinal248_g5 = ( ( ChemtrailsPattern210_g5 * saturate( (0.4 + (dotResult207_g5 - 0.0) * (2.0 - 0.4) / (0.1 - 0.0)) ) ).r > ( 1.0 - ( CZY_ChemtrailsMultiplier * 0.5 ) ) ? 1.0 : 0.0 );
				float mulTime80_g5 = _TimeParameters.x * 0.01;
				float simplePerlin2D126_g5 = snoise( (Pos33_g5*1.0 + mulTime80_g5)*2.0 );
				float mulTime75_g5 = _TimeParameters.x * CZY_CirrusMoveSpeed;
				float cos101_g5 = cos( ( mulTime75_g5 * 0.01 ) );
				float sin101_g5 = sin( ( mulTime75_g5 * 0.01 ) );
				float2 rotator101_g5 = mul( Pos33_g5 - float2( 0.5,0.5 ) , float2x2( cos101_g5 , -sin101_g5 , sin101_g5 , cos101_g5 )) + float2( 0.5,0.5 );
				float cos112_g5 = cos( ( mulTime75_g5 * -0.02 ) );
				float sin112_g5 = sin( ( mulTime75_g5 * -0.02 ) );
				float2 rotator112_g5 = mul( Pos33_g5 - float2( 0.5,0.5 ) , float2x2( cos112_g5 , -sin112_g5 , sin112_g5 , cos112_g5 )) + float2( 0.5,0.5 );
				float mulTime135_g5 = _TimeParameters.x * 0.01;
				float simplePerlin2D122_g5 = snoise( (Pos33_g5*1.0 + mulTime135_g5) );
				simplePerlin2D122_g5 = simplePerlin2D122_g5*0.5 + 0.5;
				float4 CirrusPattern137_g5 = ( ( saturate( simplePerlin2D126_g5 ) * tex2D( CZY_CirrusTexture, (rotator101_g5*1.5 + 0.75) ) ) + ( tex2D( CZY_CirrusTexture, (rotator112_g5*1.0 + 0.0) ) * saturate( simplePerlin2D122_g5 ) ) );
				float2 texCoord134_g5 = packedInput.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 temp_output_164_0_g5 = ( texCoord134_g5 - float2( 0.5,0.5 ) );
				float dotResult157_g5 = dot( temp_output_164_0_g5 , temp_output_164_0_g5 );
				float4 temp_output_217_0_g5 = ( CirrusPattern137_g5 * saturate( (0.0 + (dotResult157_g5 - 0.0) * (2.0 - 0.0) / (0.2 - 0.0)) ) );
				float Clipping208_g5 = CZY_ClippingThreshold;
				float CirrusAlpha250_g5 = ( ( temp_output_217_0_g5 * ( CZY_CirrusMultiplier * 10.0 ) ).r > Clipping208_g5 ? 1.0 : 0.0 );
				float SimpleRadiance268_g5 = saturate( ( DetailedClouds252_g5 + BorderLightTransport278_g5 + NimbusLightTransport269_g5 + ChemtrailsFinal248_g5 + CirrusAlpha250_g5 ) );
				float4 lerpResult342_g5 = lerp( CloudColor41_g5 , lerpResult338_g5 , ( 1.0 - SimpleRadiance268_g5 ));
				float CloudLight52_g5 = saturate( pow( temp_output_49_0_g5 , CZY_SunFlareFalloff ) );
				float4 lerpResult316_g5 = lerp( float4( 0,0,0,0 ) , CloudHighlightColor55_g5 , ( saturate( ( AltoCumulusPlacement376_g5 - 1.0 ) ) * CloudDetail179_g5 * CloudLight52_g5 ));
				float4 SunThroughClouds399_g5 = ( lerpResult316_g5 * 1.3 );
				float3 hsvTorgb2_g9 = RGBToHSV( CZY_AltoCloudColor.rgb );
				float3 hsvTorgb3_g9 = HSVToRGB( float3(hsvTorgb2_g9.x,saturate( ( hsvTorgb2_g9.y + CZY_FilterSaturation ) ),( hsvTorgb2_g9.z + CZY_FilterValue )) );
				float4 temp_output_10_0_g9 = ( float4( hsvTorgb3_g9 , 0.0 ) * CZY_FilterColor );
				float4 CirrusCustomLightColor350_g5 = ( CloudColor41_g5 * ( temp_output_10_0_g9 * CZY_CloudFilterColor ) );
				float temp_output_391_0_g5 = ( AltoCumulusPlacement376_g5 * (0.0 + (tex2D( CZY_AltocumulusTexture, ((Pos33_g5*1.0 + ( CZY_AltocumulusWindSpeed * TIme30_g5 ))*( 1.0 / CZY_AltocumulusScale ) + 0.0) ).r - 0.0) * (1.0 - 0.0) / (0.2 - 0.0)) * CZY_AltocumulusMultiplier );
				float AltoCumulusLightTransport393_g5 = temp_output_391_0_g5;
				float ACCustomLightsClipping387_g5 = ( AltoCumulusLightTransport393_g5 * ( SimpleRadiance268_g5 > Clipping208_g5 ? 0.0 : 1.0 ) );
				float mulTime193_g5 = _TimeParameters.x * 0.01;
				float simplePerlin2D224_g5 = snoise( (Pos33_g5*1.0 + mulTime193_g5)*2.0 );
				float mulTime178_g5 = _TimeParameters.x * CZY_CirrostratusMoveSpeed;
				float cos138_g5 = cos( ( mulTime178_g5 * 0.01 ) );
				float sin138_g5 = sin( ( mulTime178_g5 * 0.01 ) );
				float2 rotator138_g5 = mul( Pos33_g5 - float2( 0.5,0.5 ) , float2x2( cos138_g5 , -sin138_g5 , sin138_g5 , cos138_g5 )) + float2( 0.5,0.5 );
				float cos198_g5 = cos( ( mulTime178_g5 * -0.02 ) );
				float sin198_g5 = sin( ( mulTime178_g5 * -0.02 ) );
				float2 rotator198_g5 = mul( Pos33_g5 - float2( 0.5,0.5 ) , float2x2( cos198_g5 , -sin198_g5 , sin198_g5 , cos198_g5 )) + float2( 0.5,0.5 );
				float mulTime184_g5 = _TimeParameters.x * 0.01;
				float simplePerlin2D216_g5 = snoise( (Pos33_g5*10.0 + mulTime184_g5)*4.0 );
				float4 CirrostratPattern261_g5 = ( ( saturate( simplePerlin2D224_g5 ) * tex2D( CZY_CirrostratusTexture, (rotator138_g5*1.5 + 0.75) ) ) + ( tex2D( CZY_CirrostratusTexture, (rotator198_g5*1.5 + 0.75) ) * saturate( simplePerlin2D216_g5 ) ) );
				float2 texCoord234_g5 = packedInput.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 temp_output_243_0_g5 = ( texCoord234_g5 - float2( 0.5,0.5 ) );
				float dotResult238_g5 = dot( temp_output_243_0_g5 , temp_output_243_0_g5 );
				float clampResult264_g5 = clamp( ( CZY_CirrostratusMultiplier * 0.5 ) , 0.0 , 0.98 );
				float CirrostratLightTransport281_g5 = ( ( CirrostratPattern261_g5 * saturate( (0.4 + (dotResult238_g5 - 0.0) * (2.0 - 0.4) / (0.1 - 0.0)) ) ).r > ( 1.0 - clampResult264_g5 ) ? 1.0 : 0.0 );
				float CSCustomLightsClipping309_g5 = ( CirrostratLightTransport281_g5 * ( SimpleRadiance268_g5 > Clipping208_g5 ? 0.0 : 1.0 ) );
				float CustomRadiance340_g5 = saturate( ( ACCustomLightsClipping387_g5 + CSCustomLightsClipping309_g5 ) );
				float4 lerpResult331_g5 = lerp( ( lerpResult342_g5 + SunThroughClouds399_g5 ) , CirrusCustomLightColor350_g5 , CustomRadiance340_g5);
				float FinalAlpha375_g5 = saturate( ( DetailedClouds252_g5 + BorderLightTransport278_g5 + AltoCumulusLightTransport393_g5 + ChemtrailsFinal248_g5 + CirrostratLightTransport281_g5 + CirrusAlpha250_g5 + NimbusLightTransport269_g5 ) );
				float4 appendResult420_g5 = (float4((lerpResult331_g5).rgb , FinalAlpha375_g5));
				float4 FinalCloudColor325_g5 = appendResult420_g5;
				
				surfaceDescription.Alpha = ( ( (FinalCloudColor325_g5).w * ( 1.0 - 0.0 ) ) > Clipping208_g5 ? 1.0 : 0.0 );
				surfaceDescription.AlphaClipThreshold =  Clipping208_g5;

				GetSurfaceAndBuiltinData(surfaceDescription, input, V, posInput, surfaceData, builtinData);

				#ifdef _DEPTHOFFSET_ON
				outputDepth = posInput.deviceDepth;
				#endif

				outColor = float4( _ObjectId, _PassValue, 1.0, 1.0 );
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "DepthForwardOnly"
			Tags { "LightMode"="DepthForwardOnly" }

			Cull [_CullMode]
			ZWrite On
			Stencil
			{
				Ref [_StencilRefDepth]
				WriteMask [_StencilWriteMaskDepth]
				Comp Always
				Pass Replace
			}


			ColorMask 0 0

			HLSLPROGRAM

			#pragma shader_feature_local_fragment _ENABLE_FOG_ON_TRANSPARENT
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#define ASE_SRP_VERSION 120108


			#pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _ALPHATEST_ON

			#pragma multi_compile _ WRITE_MSAA_DEPTH

			#pragma multi_compile _ DOTS_INSTANCING_ON

			#pragma vertex Vert
			#pragma fragment Frag

			#define SHADERPASS SHADERPASS_DEPTH_ONLY

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
            #include "Packages/com.unity.shadergraph/ShaderGraphLibrary/Functions.hlsl"

			CBUFFER_START( UnityPerMaterial )
						float4 _EmissionColor;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			#ifdef _ENABLE_SHADOW_MATTE
			float _ShadowMatteFilter;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _AlphaCutoff;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			float _EnableBlendModePreserveSpecularLighting;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			float4 CZY_CloudColor;
			float CZY_FilterSaturation;
			float CZY_FilterValue;
			float4 CZY_FilterColor;
			float4 CZY_CloudFilterColor;
			float4 CZY_CloudHighlightColor;
			float4 CZY_SunFilterColor;
			float CZY_WindSpeed;
			float CZY_MainCloudScale;
			float CZY_CumulusCoverageMultiplier;
			float3 CZY_SunDirection;
			half CZY_SunFlareFalloff;
			float3 CZY_MoonDirection;
			half CZY_CloudMoonFalloff;
			float4 CZY_CloudMoonColor;
			float CZY_DetailScale;
			float CZY_DetailAmount;
			float CZY_BorderHeight;
			float CZY_BorderVariation;
			float CZY_BorderEffect;
			float3 CZY_StormDirection;
			float CZY_NimbusHeight;
			float CZY_NimbusMultiplier;
			float CZY_NimbusVariation;
			sampler2D CZY_ChemtrailsTexture;
			float CZY_ChemtrailsMoveSpeed;
			float CZY_ChemtrailsMultiplier;
			sampler2D CZY_CirrusTexture;
			float CZY_CirrusMoveSpeed;
			float CZY_CirrusMultiplier;
			float CZY_ClippingThreshold;
			float4 CZY_AltoCloudColor;
			sampler2D CZY_AltocumulusTexture;
			float2 CZY_AltocumulusWindSpeed;
			float CZY_AltocumulusScale;
			float CZY_AltocumulusMultiplier;
			sampler2D CZY_CirrostratusTexture;
			float CZY_CirrostratusMoveSpeed;
			float CZY_CirrostratusMultiplier;


			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Unlit/Unlit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			

			struct VertexInput
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_Position;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			float3 HSVToRGB( float3 c )
			{
				float4 K = float4( 1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0 );
				float3 p = abs( frac( c.xxx + K.xyz ) * 6.0 - K.www );
				return c.z * lerp( K.xxx, saturate( p - K.xxx ), c.y );
			}
			
			float3 RGBToHSV(float3 c)
			{
				float4 K = float4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
				float4 p = lerp( float4( c.bg, K.wz ), float4( c.gb, K.xy ), step( c.b, c.g ) );
				float4 q = lerp( float4( p.xyw, c.r ), float4( c.r, p.yzx ), step( p.x, c.r ) );
				float d = q.x - min( q.w, q.y );
				float e = 1.0e-10;
				return float3( abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
			}
			float3 mod2D289( float3 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }
			float2 mod2D289( float2 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }
			float3 permute( float3 x ) { return mod2D289( ( ( x * 34.0 ) + 1.0 ) * x ); }
			float snoise( float2 v )
			{
				const float4 C = float4( 0.211324865405187, 0.366025403784439, -0.577350269189626, 0.024390243902439 );
				float2 i = floor( v + dot( v, C.yy ) );
				float2 x0 = v - i + dot( i, C.xx );
				float2 i1;
				i1 = ( x0.x > x0.y ) ? float2( 1.0, 0.0 ) : float2( 0.0, 1.0 );
				float4 x12 = x0.xyxy + C.xxzz;
				x12.xy -= i1;
				i = mod2D289( i );
				float3 p = permute( permute( i.y + float3( 0.0, i1.y, 1.0 ) ) + i.x + float3( 0.0, i1.x, 1.0 ) );
				float3 m = max( 0.5 - float3( dot( x0, x0 ), dot( x12.xy, x12.xy ), dot( x12.zw, x12.zw ) ), 0.0 );
				m = m * m;
				m = m * m;
				float3 x = 2.0 * frac( p * C.www ) - 1.0;
				float3 h = abs( x ) - 0.5;
				float3 ox = floor( x + 0.5 );
				float3 a0 = x - ox;
				m *= 1.79284291400159 - 0.85373472095314 * ( a0 * a0 + h * h );
				float3 g;
				g.x = a0.x * x0.x + h.x * x0.y;
				g.yz = a0.yz * x12.xz + h.yz * x12.yw;
				return 130.0 * dot( m, g );
			}
			
					float2 voronoihash81_g5( float2 p )
					{
						
						p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
						return frac( sin( p ) *43758.5453);
					}
			
					float voronoi81_g5( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
					{
						float2 n = floor( v );
						float2 f = frac( v );
						float F1 = 8.0;
						float F2 = 8.0; float2 mg = 0;
						for ( int j = -1; j <= 1; j++ )
						{
							for ( int i = -1; i <= 1; i++ )
						 	{
						 		float2 g = float2( i, j );
						 		float2 o = voronoihash81_g5( n + g );
								o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
								float d = 0.5 * dot( r, r );
						 		if( d<F1 ) {
						 			F2 = F1;
						 			F1 = d; mg = g; mr = r; id = o;
						 		} else if( d<F2 ) {
						 			F2 = d;
						
						 		}
						 	}
						}
						return (F2 + F1) * 0.5;
					}
			
					float2 voronoihash88_g5( float2 p )
					{
						
						p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
						return frac( sin( p ) *43758.5453);
					}
			
					float voronoi88_g5( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
					{
						float2 n = floor( v );
						float2 f = frac( v );
						float F1 = 8.0;
						float F2 = 8.0; float2 mg = 0;
						for ( int j = -1; j <= 1; j++ )
						{
							for ( int i = -1; i <= 1; i++ )
						 	{
						 		float2 g = float2( i, j );
						 		float2 o = voronoihash88_g5( n + g );
								o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
								float d = 0.5 * dot( r, r );
						 		if( d<F1 ) {
						 			F2 = F1;
						 			F1 = d; mg = g; mr = r; id = o;
						 		} else if( d<F2 ) {
						 			F2 = d;
						
						 		}
						 	}
						}
						return (F2 + F1) * 0.5;
					}
			
					float2 voronoihash200_g5( float2 p )
					{
						
						p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
						return frac( sin( p ) *43758.5453);
					}
			
					float voronoi200_g5( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
					{
						float2 n = floor( v );
						float2 f = frac( v );
						float F1 = 8.0;
						float F2 = 8.0; float2 mg = 0;
						for ( int j = -1; j <= 1; j++ )
						{
							for ( int i = -1; i <= 1; i++ )
						 	{
						 		float2 g = float2( i, j );
						 		float2 o = voronoihash200_g5( n + g );
								o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
								float d = 0.5 * dot( r, r );
						 		if( d<F1 ) {
						 			F2 = F1;
						 			F1 = d; mg = g; mr = r; id = o;
						 		} else if( d<F2 ) {
						 			F2 = d;
						
						 		}
						 	}
						}
						return (F2 + F1) * 0.5;
					}
			
					float2 voronoihash232_g5( float2 p )
					{
						
						p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
						return frac( sin( p ) *43758.5453);
					}
			
					float voronoi232_g5( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
					{
						float2 n = floor( v );
						float2 f = frac( v );
						float F1 = 8.0;
						float F2 = 8.0; float2 mg = 0;
						for ( int j = -1; j <= 1; j++ )
						{
							for ( int i = -1; i <= 1; i++ )
						 	{
						 		float2 g = float2( i, j );
						 		float2 o = voronoihash232_g5( n + g );
								o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
								float d = 0.5 * dot( r, r );
						 		if( d<F1 ) {
						 			F2 = F1;
						 			F1 = d; mg = g; mr = r; id = o;
						 		} else if( d<F2 ) {
						 			F2 = d;
						
						 		}
						 	}
						}
						return F1;
					}
			
					float2 voronoihash84_g5( float2 p )
					{
						
						p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
						return frac( sin( p ) *43758.5453);
					}
			
					float voronoi84_g5( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
					{
						float2 n = floor( v );
						float2 f = frac( v );
						float F1 = 8.0;
						float F2 = 8.0; float2 mg = 0;
						for ( int j = -1; j <= 1; j++ )
						{
							for ( int i = -1; i <= 1; i++ )
						 	{
						 		float2 g = float2( i, j );
						 		float2 o = voronoihash84_g5( n + g );
								o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
								float d = 0.5 * dot( r, r );
						 		if( d<F1 ) {
						 			F2 = F1;
						 			F1 = d; mg = g; mr = r; id = o;
						 		} else if( d<F2 ) {
						 			F2 = d;
						
						 		}
						 	}
						}
						return F1;
					}
			

			struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
			};

			void BuildSurfaceData(FragInputs fragInputs, SurfaceDescription surfaceDescription, float3 V, out SurfaceData surfaceData)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);
				#ifdef WRITE_NORMAL_BUFFER
				surfaceData.normalWS = fragInputs.tangentToWorld[2];
				#endif
			}

			void GetSurfaceAndBuiltinData(SurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
                LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
                #endif

				#if _ALPHATEST_ON
				DoAlphaTest ( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#if _DEPTHOFFSET_ON
                ApplyDepthOffsetPositionInput(V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput);
                #endif

				BuildSurfaceData(fragInputs, surfaceDescription, V, surfaceData);
				ZERO_INITIALIZE(BuiltinData, builtinData);
				builtinData.opacity =  surfaceDescription.Alpha;

				#if defined(DEBUG_DISPLAY)
					builtinData.renderingLayers = GetMeshRenderingLightLayer();
				#endif

                #ifdef _ALPHATEST_ON
                    builtinData.alphaClipTreshold = surfaceDescription.AlphaClipThreshold;
                #endif

				#if _DEPTHOFFSET_ON
                builtinData.depthOffset = surfaceDescription.DepthOffset;
                #endif

                ApplyDebugToBuiltinData(builtinData);
			}

			VertexOutput VertexFunction( VertexInput inputMesh  )
			{
				VertexOutput o;
				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				o.ase_texcoord1.xyz = ase_worldPos;
				
				o.ase_texcoord.xy = inputMesh.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord.zw = 0;
				o.ase_texcoord1.w = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue =   defaultVertexValue ;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS =  inputMesh.normalOS ;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				o.positionCS = TransformWorldToHClip(positionRWS);
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput Vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			void Frag( VertexOutput packedInput
						#ifdef WRITE_MSAA_DEPTH
						, out float4 depthColor : SV_Target0
							#ifdef WRITE_NORMAL_BUFFER
							, out float4 outNormalBuffer : SV_Target1
							#endif
						#else
							#ifdef WRITE_NORMAL_BUFFER
							, out float4 outNormalBuffer : SV_Target0
							#endif
						#endif
						#if defined(_DEPTHOFFSET_ON) && !defined(SCENEPICKINGPASS)
						, out float outputDepth : DEPTH_OFFSET_SEMANTIC
						#endif
					
					)
			{
				UNITY_SETUP_INSTANCE_ID( packedInput );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);

				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

				float3 V = float3( 1.0, 1.0, 1.0 );

				SurfaceDescription surfaceDescription = (SurfaceDescription)0;
				float3 hsvTorgb2_g7 = RGBToHSV( CZY_CloudColor.rgb );
				float3 hsvTorgb3_g7 = HSVToRGB( float3(hsvTorgb2_g7.x,saturate( ( hsvTorgb2_g7.y + CZY_FilterSaturation ) ),( hsvTorgb2_g7.z + CZY_FilterValue )) );
				float4 temp_output_10_0_g7 = ( float4( hsvTorgb3_g7 , 0.0 ) * CZY_FilterColor );
				float4 CloudColor41_g5 = ( temp_output_10_0_g7 * CZY_CloudFilterColor );
				float3 hsvTorgb2_g6 = RGBToHSV( CZY_CloudHighlightColor.rgb );
				float3 hsvTorgb3_g6 = HSVToRGB( float3(hsvTorgb2_g6.x,saturate( ( hsvTorgb2_g6.y + CZY_FilterSaturation ) ),( hsvTorgb2_g6.z + CZY_FilterValue )) );
				float4 temp_output_10_0_g6 = ( float4( hsvTorgb3_g6 , 0.0 ) * CZY_FilterColor );
				float4 CloudHighlightColor55_g5 = ( temp_output_10_0_g6 * CZY_SunFilterColor );
				float2 texCoord31_g5 = packedInput.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 Pos33_g5 = texCoord31_g5;
				float mulTime29_g5 = _TimeParameters.x * ( 0.001 * CZY_WindSpeed );
				float TIme30_g5 = mulTime29_g5;
				float simplePerlin2D409_g5 = snoise( ( Pos33_g5 + ( TIme30_g5 * float2( 0.2,-0.4 ) ) )*( 100.0 / CZY_MainCloudScale ) );
				simplePerlin2D409_g5 = simplePerlin2D409_g5*0.5 + 0.5;
				float SimpleCloudDensity153_g5 = simplePerlin2D409_g5;
				float time81_g5 = 0.0;
				float2 voronoiSmoothId81_g5 = 0;
				float2 temp_output_94_0_g5 = ( Pos33_g5 + ( TIme30_g5 * float2( 0.3,0.2 ) ) );
				float2 coords81_g5 = temp_output_94_0_g5 * ( 140.0 / CZY_MainCloudScale );
				float2 id81_g5 = 0;
				float2 uv81_g5 = 0;
				float voroi81_g5 = voronoi81_g5( coords81_g5, time81_g5, id81_g5, uv81_g5, 0, voronoiSmoothId81_g5 );
				float time88_g5 = 0.0;
				float2 voronoiSmoothId88_g5 = 0;
				float2 coords88_g5 = temp_output_94_0_g5 * ( 500.0 / CZY_MainCloudScale );
				float2 id88_g5 = 0;
				float2 uv88_g5 = 0;
				float voroi88_g5 = voronoi88_g5( coords88_g5, time88_g5, id88_g5, uv88_g5, 0, voronoiSmoothId88_g5 );
				float2 appendResult95_g5 = (float2(voroi81_g5 , voroi88_g5));
				float2 VoroDetails109_g5 = appendResult95_g5;
				float CumulusCoverage34_g5 = CZY_CumulusCoverageMultiplier;
				float ComplexCloudDensity141_g5 = (0.0 + (min( SimpleCloudDensity153_g5 , ( 1.0 - VoroDetails109_g5.x ) ) - ( 1.0 - CumulusCoverage34_g5 )) * (1.0 - 0.0) / (1.0 - ( 1.0 - CumulusCoverage34_g5 )));
				float4 lerpResult315_g5 = lerp( CloudHighlightColor55_g5 , CloudColor41_g5 , saturate( (2.0 + (ComplexCloudDensity141_g5 - 0.0) * (0.7 - 2.0) / (1.0 - 0.0)) ));
				float3 ase_worldPos = packedInput.ase_texcoord1.xyz;
				float3 normalizeResult40_g5 = normalize( ( ase_worldPos - _WorldSpaceCameraPos ) );
				float dotResult42_g5 = dot( normalizeResult40_g5 , CZY_SunDirection );
				float temp_output_49_0_g5 = abs( (dotResult42_g5*0.5 + 0.5) );
				half LightMask56_g5 = saturate( pow( temp_output_49_0_g5 , CZY_SunFlareFalloff ) );
				float time200_g5 = 0.0;
				float2 voronoiSmoothId200_g5 = 0;
				float mulTime163_g5 = _TimeParameters.x * 0.003;
				float2 coords200_g5 = (Pos33_g5*1.0 + ( float2( 1,-2 ) * mulTime163_g5 )) * 10.0;
				float2 id200_g5 = 0;
				float2 uv200_g5 = 0;
				float voroi200_g5 = voronoi200_g5( coords200_g5, time200_g5, id200_g5, uv200_g5, 0, voronoiSmoothId200_g5 );
				float time232_g5 = ( 10.0 * mulTime163_g5 );
				float2 voronoiSmoothId232_g5 = 0;
				float2 coords232_g5 = packedInput.ase_texcoord.xy * 10.0;
				float2 id232_g5 = 0;
				float2 uv232_g5 = 0;
				float voroi232_g5 = voronoi232_g5( coords232_g5, time232_g5, id232_g5, uv232_g5, 0, voronoiSmoothId232_g5 );
				float AltoCumulusPlacement376_g5 = saturate( ( ( ( 1.0 - 0.0 ) - (1.0 + (voroi200_g5 - 0.0) * (-0.5 - 1.0) / (1.0 - 0.0)) ) - voroi232_g5 ) );
				float CloudThicknessDetails286_g5 = ( VoroDetails109_g5.y * saturate( ( AltoCumulusPlacement376_g5 - 0.8 ) ) );
				float3 normalizeResult43_g5 = normalize( ( ase_worldPos - _WorldSpaceCameraPos ) );
				float dotResult46_g5 = dot( normalizeResult43_g5 , CZY_MoonDirection );
				half MoonlightMask57_g5 = saturate( pow( abs( (dotResult46_g5*0.5 + 0.5) ) , CZY_CloudMoonFalloff ) );
				float3 hsvTorgb2_g8 = RGBToHSV( CZY_CloudMoonColor.rgb );
				float3 hsvTorgb3_g8 = HSVToRGB( float3(hsvTorgb2_g8.x,saturate( ( hsvTorgb2_g8.y + CZY_FilterSaturation ) ),( hsvTorgb2_g8.z + CZY_FilterValue )) );
				float4 temp_output_10_0_g8 = ( float4( hsvTorgb3_g8 , 0.0 ) * CZY_FilterColor );
				float4 MoonlightColor60_g5 = ( temp_output_10_0_g8 * CZY_CloudFilterColor );
				float4 lerpResult338_g5 = lerp( ( lerpResult315_g5 + ( LightMask56_g5 * CloudHighlightColor55_g5 * ( 1.0 - CloudThicknessDetails286_g5 ) ) + ( MoonlightMask57_g5 * MoonlightColor60_g5 * ( 1.0 - CloudThicknessDetails286_g5 ) ) ) , ( CloudColor41_g5 * float4( 0.5660378,0.5660378,0.5660378,0 ) ) , CloudThicknessDetails286_g5);
				float time84_g5 = 0.0;
				float2 voronoiSmoothId84_g5 = 0;
				float2 coords84_g5 = ( Pos33_g5 + ( TIme30_g5 * float2( 0.3,0.2 ) ) ) * ( 100.0 / CZY_DetailScale );
				float2 id84_g5 = 0;
				float2 uv84_g5 = 0;
				float fade84_g5 = 0.5;
				float voroi84_g5 = 0;
				float rest84_g5 = 0;
				for( int it84_g5 = 0; it84_g5 <3; it84_g5++ ){
				voroi84_g5 += fade84_g5 * voronoi84_g5( coords84_g5, time84_g5, id84_g5, uv84_g5, 0,voronoiSmoothId84_g5 );
				rest84_g5 += fade84_g5;
				coords84_g5 *= 2;
				fade84_g5 *= 0.5;
				}//Voronoi84_g5
				voroi84_g5 /= rest84_g5;
				float temp_output_173_0_g5 = ( (0.0 + (( 1.0 - voroi84_g5 ) - 0.3) * (0.5 - 0.0) / (1.0 - 0.3)) * 0.1 * CZY_DetailAmount );
				float DetailedClouds252_g5 = saturate( ( ComplexCloudDensity141_g5 + temp_output_173_0_g5 ) );
				float CloudDetail179_g5 = temp_output_173_0_g5;
				float2 texCoord79_g5 = packedInput.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 temp_output_161_0_g5 = ( texCoord79_g5 - float2( 0.5,0.5 ) );
				float dotResult212_g5 = dot( temp_output_161_0_g5 , temp_output_161_0_g5 );
				float BorderHeight154_g5 = ( 1.0 - CZY_BorderHeight );
				float temp_output_151_0_g5 = ( -2.0 * ( 1.0 - CZY_BorderVariation ) );
				float clampResult247_g5 = clamp( ( ( ( CloudDetail179_g5 + SimpleCloudDensity153_g5 ) * saturate( (( BorderHeight154_g5 * temp_output_151_0_g5 ) + (dotResult212_g5 - 0.0) * (( temp_output_151_0_g5 * -4.0 ) - ( BorderHeight154_g5 * temp_output_151_0_g5 )) / (0.5 - 0.0)) ) ) * 10.0 * CZY_BorderEffect ) , -1.0 , 1.0 );
				float BorderLightTransport278_g5 = clampResult247_g5;
				float3 normalizeResult116_g5 = normalize( ( ase_worldPos - _WorldSpaceCameraPos ) );
				float3 normalizeResult146_g5 = normalize( CZY_StormDirection );
				float dotResult150_g5 = dot( normalizeResult116_g5 , normalizeResult146_g5 );
				float2 texCoord98_g5 = packedInput.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 temp_output_124_0_g5 = ( texCoord98_g5 - float2( 0.5,0.5 ) );
				float dotResult125_g5 = dot( temp_output_124_0_g5 , temp_output_124_0_g5 );
				float temp_output_140_0_g5 = ( -2.0 * ( 1.0 - ( CZY_NimbusVariation * 0.9 ) ) );
				float NimbusLightTransport269_g5 = saturate( ( ( ( CloudDetail179_g5 + SimpleCloudDensity153_g5 ) * saturate( (( ( 1.0 - CZY_NimbusMultiplier ) * temp_output_140_0_g5 ) + (( dotResult150_g5 + ( CZY_NimbusHeight * 4.0 * dotResult125_g5 ) ) - 0.5) * (( temp_output_140_0_g5 * -4.0 ) - ( ( 1.0 - CZY_NimbusMultiplier ) * temp_output_140_0_g5 )) / (7.0 - 0.5)) ) ) * 10.0 ) );
				float mulTime104_g5 = _TimeParameters.x * 0.01;
				float simplePerlin2D143_g5 = snoise( (Pos33_g5*1.0 + mulTime104_g5)*2.0 );
				float mulTime93_g5 = _TimeParameters.x * CZY_ChemtrailsMoveSpeed;
				float cos97_g5 = cos( ( mulTime93_g5 * 0.01 ) );
				float sin97_g5 = sin( ( mulTime93_g5 * 0.01 ) );
				float2 rotator97_g5 = mul( Pos33_g5 - float2( 0.5,0.5 ) , float2x2( cos97_g5 , -sin97_g5 , sin97_g5 , cos97_g5 )) + float2( 0.5,0.5 );
				float cos131_g5 = cos( ( mulTime93_g5 * -0.02 ) );
				float sin131_g5 = sin( ( mulTime93_g5 * -0.02 ) );
				float2 rotator131_g5 = mul( Pos33_g5 - float2( 0.5,0.5 ) , float2x2( cos131_g5 , -sin131_g5 , sin131_g5 , cos131_g5 )) + float2( 0.5,0.5 );
				float mulTime107_g5 = _TimeParameters.x * 0.01;
				float simplePerlin2D147_g5 = snoise( (Pos33_g5*1.0 + mulTime107_g5)*4.0 );
				float4 ChemtrailsPattern210_g5 = ( ( saturate( simplePerlin2D143_g5 ) * tex2D( CZY_ChemtrailsTexture, (rotator97_g5*0.5 + 0.0) ) ) + ( tex2D( CZY_ChemtrailsTexture, rotator131_g5 ) * saturate( simplePerlin2D147_g5 ) ) );
				float2 texCoord139_g5 = packedInput.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 temp_output_162_0_g5 = ( texCoord139_g5 - float2( 0.5,0.5 ) );
				float dotResult207_g5 = dot( temp_output_162_0_g5 , temp_output_162_0_g5 );
				float ChemtrailsFinal248_g5 = ( ( ChemtrailsPattern210_g5 * saturate( (0.4 + (dotResult207_g5 - 0.0) * (2.0 - 0.4) / (0.1 - 0.0)) ) ).r > ( 1.0 - ( CZY_ChemtrailsMultiplier * 0.5 ) ) ? 1.0 : 0.0 );
				float mulTime80_g5 = _TimeParameters.x * 0.01;
				float simplePerlin2D126_g5 = snoise( (Pos33_g5*1.0 + mulTime80_g5)*2.0 );
				float mulTime75_g5 = _TimeParameters.x * CZY_CirrusMoveSpeed;
				float cos101_g5 = cos( ( mulTime75_g5 * 0.01 ) );
				float sin101_g5 = sin( ( mulTime75_g5 * 0.01 ) );
				float2 rotator101_g5 = mul( Pos33_g5 - float2( 0.5,0.5 ) , float2x2( cos101_g5 , -sin101_g5 , sin101_g5 , cos101_g5 )) + float2( 0.5,0.5 );
				float cos112_g5 = cos( ( mulTime75_g5 * -0.02 ) );
				float sin112_g5 = sin( ( mulTime75_g5 * -0.02 ) );
				float2 rotator112_g5 = mul( Pos33_g5 - float2( 0.5,0.5 ) , float2x2( cos112_g5 , -sin112_g5 , sin112_g5 , cos112_g5 )) + float2( 0.5,0.5 );
				float mulTime135_g5 = _TimeParameters.x * 0.01;
				float simplePerlin2D122_g5 = snoise( (Pos33_g5*1.0 + mulTime135_g5) );
				simplePerlin2D122_g5 = simplePerlin2D122_g5*0.5 + 0.5;
				float4 CirrusPattern137_g5 = ( ( saturate( simplePerlin2D126_g5 ) * tex2D( CZY_CirrusTexture, (rotator101_g5*1.5 + 0.75) ) ) + ( tex2D( CZY_CirrusTexture, (rotator112_g5*1.0 + 0.0) ) * saturate( simplePerlin2D122_g5 ) ) );
				float2 texCoord134_g5 = packedInput.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 temp_output_164_0_g5 = ( texCoord134_g5 - float2( 0.5,0.5 ) );
				float dotResult157_g5 = dot( temp_output_164_0_g5 , temp_output_164_0_g5 );
				float4 temp_output_217_0_g5 = ( CirrusPattern137_g5 * saturate( (0.0 + (dotResult157_g5 - 0.0) * (2.0 - 0.0) / (0.2 - 0.0)) ) );
				float Clipping208_g5 = CZY_ClippingThreshold;
				float CirrusAlpha250_g5 = ( ( temp_output_217_0_g5 * ( CZY_CirrusMultiplier * 10.0 ) ).r > Clipping208_g5 ? 1.0 : 0.0 );
				float SimpleRadiance268_g5 = saturate( ( DetailedClouds252_g5 + BorderLightTransport278_g5 + NimbusLightTransport269_g5 + ChemtrailsFinal248_g5 + CirrusAlpha250_g5 ) );
				float4 lerpResult342_g5 = lerp( CloudColor41_g5 , lerpResult338_g5 , ( 1.0 - SimpleRadiance268_g5 ));
				float CloudLight52_g5 = saturate( pow( temp_output_49_0_g5 , CZY_SunFlareFalloff ) );
				float4 lerpResult316_g5 = lerp( float4( 0,0,0,0 ) , CloudHighlightColor55_g5 , ( saturate( ( AltoCumulusPlacement376_g5 - 1.0 ) ) * CloudDetail179_g5 * CloudLight52_g5 ));
				float4 SunThroughClouds399_g5 = ( lerpResult316_g5 * 1.3 );
				float3 hsvTorgb2_g9 = RGBToHSV( CZY_AltoCloudColor.rgb );
				float3 hsvTorgb3_g9 = HSVToRGB( float3(hsvTorgb2_g9.x,saturate( ( hsvTorgb2_g9.y + CZY_FilterSaturation ) ),( hsvTorgb2_g9.z + CZY_FilterValue )) );
				float4 temp_output_10_0_g9 = ( float4( hsvTorgb3_g9 , 0.0 ) * CZY_FilterColor );
				float4 CirrusCustomLightColor350_g5 = ( CloudColor41_g5 * ( temp_output_10_0_g9 * CZY_CloudFilterColor ) );
				float temp_output_391_0_g5 = ( AltoCumulusPlacement376_g5 * (0.0 + (tex2D( CZY_AltocumulusTexture, ((Pos33_g5*1.0 + ( CZY_AltocumulusWindSpeed * TIme30_g5 ))*( 1.0 / CZY_AltocumulusScale ) + 0.0) ).r - 0.0) * (1.0 - 0.0) / (0.2 - 0.0)) * CZY_AltocumulusMultiplier );
				float AltoCumulusLightTransport393_g5 = temp_output_391_0_g5;
				float ACCustomLightsClipping387_g5 = ( AltoCumulusLightTransport393_g5 * ( SimpleRadiance268_g5 > Clipping208_g5 ? 0.0 : 1.0 ) );
				float mulTime193_g5 = _TimeParameters.x * 0.01;
				float simplePerlin2D224_g5 = snoise( (Pos33_g5*1.0 + mulTime193_g5)*2.0 );
				float mulTime178_g5 = _TimeParameters.x * CZY_CirrostratusMoveSpeed;
				float cos138_g5 = cos( ( mulTime178_g5 * 0.01 ) );
				float sin138_g5 = sin( ( mulTime178_g5 * 0.01 ) );
				float2 rotator138_g5 = mul( Pos33_g5 - float2( 0.5,0.5 ) , float2x2( cos138_g5 , -sin138_g5 , sin138_g5 , cos138_g5 )) + float2( 0.5,0.5 );
				float cos198_g5 = cos( ( mulTime178_g5 * -0.02 ) );
				float sin198_g5 = sin( ( mulTime178_g5 * -0.02 ) );
				float2 rotator198_g5 = mul( Pos33_g5 - float2( 0.5,0.5 ) , float2x2( cos198_g5 , -sin198_g5 , sin198_g5 , cos198_g5 )) + float2( 0.5,0.5 );
				float mulTime184_g5 = _TimeParameters.x * 0.01;
				float simplePerlin2D216_g5 = snoise( (Pos33_g5*10.0 + mulTime184_g5)*4.0 );
				float4 CirrostratPattern261_g5 = ( ( saturate( simplePerlin2D224_g5 ) * tex2D( CZY_CirrostratusTexture, (rotator138_g5*1.5 + 0.75) ) ) + ( tex2D( CZY_CirrostratusTexture, (rotator198_g5*1.5 + 0.75) ) * saturate( simplePerlin2D216_g5 ) ) );
				float2 texCoord234_g5 = packedInput.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 temp_output_243_0_g5 = ( texCoord234_g5 - float2( 0.5,0.5 ) );
				float dotResult238_g5 = dot( temp_output_243_0_g5 , temp_output_243_0_g5 );
				float clampResult264_g5 = clamp( ( CZY_CirrostratusMultiplier * 0.5 ) , 0.0 , 0.98 );
				float CirrostratLightTransport281_g5 = ( ( CirrostratPattern261_g5 * saturate( (0.4 + (dotResult238_g5 - 0.0) * (2.0 - 0.4) / (0.1 - 0.0)) ) ).r > ( 1.0 - clampResult264_g5 ) ? 1.0 : 0.0 );
				float CSCustomLightsClipping309_g5 = ( CirrostratLightTransport281_g5 * ( SimpleRadiance268_g5 > Clipping208_g5 ? 0.0 : 1.0 ) );
				float CustomRadiance340_g5 = saturate( ( ACCustomLightsClipping387_g5 + CSCustomLightsClipping309_g5 ) );
				float4 lerpResult331_g5 = lerp( ( lerpResult342_g5 + SunThroughClouds399_g5 ) , CirrusCustomLightColor350_g5 , CustomRadiance340_g5);
				float FinalAlpha375_g5 = saturate( ( DetailedClouds252_g5 + BorderLightTransport278_g5 + AltoCumulusLightTransport393_g5 + ChemtrailsFinal248_g5 + CirrostratLightTransport281_g5 + CirrusAlpha250_g5 + NimbusLightTransport269_g5 ) );
				float4 appendResult420_g5 = (float4((lerpResult331_g5).rgb , FinalAlpha375_g5));
				float4 FinalCloudColor325_g5 = appendResult420_g5;
				
				surfaceDescription.Alpha = ( ( (FinalCloudColor325_g5).w * ( 1.0 - 0.0 ) ) > Clipping208_g5 ? 1.0 : 0.0 );
				surfaceDescription.AlphaClipThreshold =  Clipping208_g5;

				SurfaceData surfaceData;
				BuiltinData builtinData;
				GetSurfaceAndBuiltinData(surfaceDescription, input, V, posInput, surfaceData, builtinData);

				#ifdef _DEPTHOFFSET_ON
				outputDepth = posInput.deviceDepth;
				#endif

				#ifdef WRITE_MSAA_DEPTH
					depthColor = packedInput.positionCS.z;
					#ifdef _ALPHATOMASK_ON
					depthColor.a = SharpenAlpha(builtinData.opacity, builtinData.alphaClipTreshold);
					#endif
				#endif

				#if defined(WRITE_NORMAL_BUFFER)
					EncodeIntoNormalBuffer(ConvertSurfaceDataToNormalData(surfaceData), outNormalBuffer);
				#endif
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "MotionVectors"
			Tags { "LightMode"="MotionVectors" }

			Cull [_CullMode]

			ZWrite On

			Stencil
			{
				Ref [_StencilRefMV]
				WriteMask [_StencilWriteMaskMV]
				Comp Always
				Pass Replace
			}


			HLSLPROGRAM

			#pragma shader_feature_local_fragment _ENABLE_FOG_ON_TRANSPARENT
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#define ASE_SRP_VERSION 120108


			#pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _ALPHATEST_ON

			#pragma multi_compile _ WRITE_MSAA_DEPTH

			#pragma multi_compile _ DOTS_INSTANCING_ON

			#pragma vertex Vert
			#pragma fragment Frag

			#if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
			#define _WRITE_TRANSPARENT_MOTION_VECTOR
			#endif

			#define SHADERPASS SHADERPASS_MOTION_VECTORS

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
            #include "Packages/com.unity.shadergraph/ShaderGraphLibrary/Functions.hlsl"

			CBUFFER_START( UnityPerMaterial )
						float4 _EmissionColor;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			#ifdef _ENABLE_SHADOW_MATTE
			float _ShadowMatteFilter;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _AlphaCutoff;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			float _EnableBlendModePreserveSpecularLighting;
			#ifdef ASE_TESSELLATION
			float _TessPhongStrength;
			float _TessValue;
			float _TessMin;
			float _TessMax;
			float _TessEdgeLength;
			float _TessMaxDisp;
			#endif
			CBUFFER_END

			

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Unlit/Unlit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			

			struct VertexInput
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float3 previousPositionOS : TEXCOORD4;
				float3 precomputedVelocity : TEXCOORD5;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 vmeshPositionCS : SV_Position;
				float3 vmeshInterp00 : TEXCOORD0;
				float3 vpassInterpolators0 : TEXCOORD1; //interpolators0
				float3 vpassInterpolators1 : TEXCOORD2; //interpolators1
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			
			struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
			};

			void BuildSurfaceData(FragInputs fragInputs, SurfaceDescription surfaceDescription, float3 V, out SurfaceData surfaceData)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);
				#ifdef WRITE_NORMAL_BUFFER
				surfaceData.normalWS = fragInputs.tangentToWorld[2];
				#endif
			}

			void GetSurfaceAndBuiltinData(SurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
                LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
                #endif

				#if _ALPHATEST_ON
				DoAlphaTest ( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#if _DEPTHOFFSET_ON
                ApplyDepthOffsetPositionInput(V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput);
                #endif

				BuildSurfaceData(fragInputs, surfaceDescription, V, surfaceData);
				ZERO_INITIALIZE(BuiltinData, builtinData);
				builtinData.opacity =  surfaceDescription.Alpha;

				#if defined(DEBUG_DISPLAY)
                    builtinData.renderingLayers = GetMeshRenderingLightLayer();
                #endif


                #ifdef _ALPHATEST_ON
                    builtinData.alphaClipTreshold = surfaceDescription.AlphaClipThreshold;
                #endif


                #if _DEPTHOFFSET_ON
                builtinData.depthOffset = surfaceDescription.DepthOffset;
                #endif

                ApplyDebugToBuiltinData(builtinData);
			}

			VertexInput ApplyMeshModification(VertexInput inputMesh, float3 timeParameters, inout VertexOutput o )
			{
				_TimeParameters.xyz = timeParameters;
				

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue =  defaultVertexValue ;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif
				inputMesh.normalOS =  inputMesh.normalOS ;
				return inputMesh;
			}

			VertexOutput VertexFunction(VertexInput inputMesh)
			{
				VertexOutput o = (VertexOutput)0;
				VertexInput defaultMesh = inputMesh;

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				inputMesh = ApplyMeshModification( inputMesh, _TimeParameters.xyz, o);

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				float3 normalWS = TransformObjectToWorldNormal(inputMesh.normalOS);

				float3 VMESHpositionRWS = positionRWS;
				float4 VMESHpositionCS = TransformWorldToHClip(positionRWS);

				//#if defined(UNITY_REVERSED_Z)
				//	VMESHpositionCS.z -= unity_MotionVectorsParams.z * VMESHpositionCS.w;
				//#else
				//	VMESHpositionCS.z += unity_MotionVectorsParams.z * VMESHpositionCS.w;
				//#endif

				float4 VPASSpreviousPositionCS;
				float4 VPASSpositionCS = mul(UNITY_MATRIX_UNJITTERED_VP, float4(VMESHpositionRWS, 1.0));

				bool forceNoMotion = unity_MotionVectorsParams.y == 0.0;
				if (forceNoMotion)
				{
					VPASSpreviousPositionCS = float4(0.0, 0.0, 0.0, 1.0);
				}
				else
				{
					bool hasDeformation = unity_MotionVectorsParams.x > 0.0;
					float3 effectivePositionOS = (hasDeformation ? inputMesh.previousPositionOS : defaultMesh.positionOS);
					#if defined(_ADD_PRECOMPUTED_VELOCITY)
					effectivePositionOS -= inputMesh.precomputedVelocity;
					#endif

					#if defined(HAVE_MESH_MODIFICATION)
						VertexInput previousMesh = defaultMesh;
						previousMesh.positionOS = effectivePositionOS ;
						VertexOutput test = (VertexOutput)0;
						float3 curTime = _TimeParameters.xyz;
						previousMesh = ApplyMeshModification(previousMesh, _LastTimeParameters.xyz, test);
						_TimeParameters.xyz = curTime;
						float3 previousPositionRWS = TransformPreviousObjectToWorld(previousMesh.positionOS);
					#else
						float3 previousPositionRWS = TransformPreviousObjectToWorld(effectivePositionOS);
					#endif

					#ifdef ATTRIBUTES_NEED_NORMAL
						float3 normalWS = TransformPreviousObjectToWorldNormal(defaultMesh.normalOS);
					#else
						float3 normalWS = float3(0.0, 0.0, 0.0);
					#endif

					#if defined(HAVE_VERTEX_MODIFICATION)
						ApplyVertexModification(inputMesh, normalWS, previousPositionRWS, _LastTimeParameters.xyz);
					#endif

					VPASSpreviousPositionCS = mul(UNITY_MATRIX_PREV_VP, float4(previousPositionRWS, 1.0));
				}

				o.vmeshPositionCS = VMESHpositionCS;
				o.vmeshInterp00.xyz = VMESHpositionRWS;

				o.vpassInterpolators0 = float3(VPASSpositionCS.xyw);
				o.vpassInterpolators1 = float3(VPASSpreviousPositionCS.xyw);
				return o;
			}

			#if ( 0 ) // TEMPORARY: defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float3 previousPositionOS : TEXCOORD4;
				float3 precomputedVelocity : TEXCOORD5;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.previousPositionOS = v.previousPositionOS;
				#if defined (_ADD_PRECOMPUTED_VELOCITY)
					o.precomputedVelocity = v.precomputedVelocity;
				#endif
				
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.previousPositionOS = patch[0].previousPositionOS * bary.x + patch[1].previousPositionOS * bary.y + patch[2].previousPositionOS * bary.z;
				#if defined (_ADD_PRECOMPUTED_VELOCITY)
					o.precomputedVelocity = patch[0].precomputedVelocity * bary.x + patch[1].precomputedVelocity * bary.y + patch[2].precomputedVelocity * bary.z;
				#endif
				
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput Vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			#if defined(WRITE_DECAL_BUFFER) && defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_NORMAL SV_Target3
			#elif defined(WRITE_DECAL_BUFFER) || defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_NORMAL SV_Target2
			#else
			#define SV_TARGET_NORMAL SV_Target1
			#endif

			void Frag( VertexOutput packedInput
						#ifdef WRITE_MSAA_DEPTH
						, out float4 depthColor : SV_Target0
						, out float4 outMotionVector : SV_Target1
							#ifdef WRITE_DECAL_BUFFER
							, out float4 outDecalBuffer : SV_Target2
							#endif
						#else
						, out float4 outMotionVector : SV_Target0
							#ifdef WRITE_DECAL_BUFFER
							, out float4 outDecalBuffer : SV_Target1
							#endif
						#endif

						#ifdef WRITE_NORMAL_BUFFER
						, out float4 outNormalBuffer : SV_TARGET_NORMAL
						#endif

						#ifdef _DEPTHOFFSET_ON
						, out float outputDepth : DEPTH_OFFSET_SEMANTIC
						#endif
						
					)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				UNITY_SETUP_INSTANCE_ID( packedInput );
				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.vmeshPositionCS;
				input.positionRWS = packedInput.vmeshInterp00.xyz;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

				float3 V = GetWorldSpaceNormalizeViewDir(input.positionRWS);

				SurfaceDescription surfaceDescription = (SurfaceDescription)0;
				
				surfaceDescription.Alpha = 1;
				surfaceDescription.AlphaClipThreshold = _AlphaCutoff;

				SurfaceData surfaceData;
				BuiltinData builtinData;
				GetSurfaceAndBuiltinData(surfaceDescription, input, V, posInput, surfaceData, builtinData);

				float4 VPASSpositionCS = float4(packedInput.vpassInterpolators0.xy, 0.0, packedInput.vpassInterpolators0.z);
				float4 VPASSpreviousPositionCS = float4(packedInput.vpassInterpolators1.xy, 0.0, packedInput.vpassInterpolators1.z);

				#ifdef _DEPTHOFFSET_ON
				VPASSpositionCS.w += builtinData.depthOffset;
				VPASSpreviousPositionCS.w += builtinData.depthOffset;
				#endif

				float2 motionVector = CalculateMotionVector( VPASSpositionCS, VPASSpreviousPositionCS );
				EncodeMotionVector( motionVector * 0.5, outMotionVector );

				bool forceNoMotion = unity_MotionVectorsParams.y == 0.0;
				if( forceNoMotion )
					outMotionVector = float4( 2.0, 0.0, 0.0, 0.0 );

				// Depth and Alpha to coverage
				#ifdef WRITE_MSAA_DEPTH
					// In case we are rendering in MSAA, reading the an MSAA depth buffer is way too expensive. To avoid that, we export the depth to a color buffer
					depthColor = packedInput.vmeshPositionCS.z;
					#ifdef _ALPHATOMASK_ON
					// Alpha channel is used for alpha to coverage
					depthColor.a = SharpenAlpha(builtinData.opacity, builtinData.alphaClipTreshold);
					#endif
				#endif

				// Normal Buffer Processing
				#ifdef WRITE_NORMAL_BUFFER
					EncodeIntoNormalBuffer(ConvertSurfaceDataToNormalData(surfaceData), outNormalBuffer);
				#endif

				#if defined(WRITE_DECAL_BUFFER)
					DecalPrepassData decalPrepassData;
					#ifdef _DISABLE_DECALS
					ZERO_INITIALIZE(DecalPrepassData, decalPrepassData);
					#else
					decalPrepassData.geomNormalWS = surfaceData.geomNormalWS;
					decalPrepassData.decalLayerMask = GetMeshRenderingDecalLayer();
					#endif
					EncodeIntoDecalPrepassBuffer(decalPrepassData, outDecalBuffer);

					#if ASE_SRP_VERSION >= 120107
					// make sure we don't overwrite light layers
					outDecalBuffer.w = (GetMeshRenderingLightLayer() & 0x000000FF) / 255.0;
					#endif
				#endif

				#ifdef _DEPTHOFFSET_ON
				outputDepth = posInput.deviceDepth;
				#endif
			}

			ENDHLSL
		}

		
        Pass
		{
			
            Name "ScenePickingPass"
            Tags { "LightMode"="Picking" }

            Cull [_CullMode]

			HLSLPROGRAM

			#pragma shader_feature_local_fragment _ENABLE_FOG_ON_TRANSPARENT
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#define ASE_SRP_VERSION 120108


			#pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _TRANSPARENT_WRITES_MOTION_VEC

			#pragma editor_sync_compilation

			#pragma multi_compile _ DOTS_INSTANCING_ON

			#pragma vertex Vert
			#pragma fragment Frag

			#if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
			#define _WRITE_TRANSPARENT_MOTION_VECTOR
			#endif

            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
            #include "Packages/com.unity.shadergraph/ShaderGraphLibrary/Functions.hlsl"

            #define ATTRIBUTES_NEED_NORMAL
            #define ATTRIBUTES_NEED_TANGENT
            #define VARYINGS_NEED_TANGENT_TO_WORLD

			#define SHADERPASS SHADERPASS_DEPTH_ONLY
			#define SCENEPICKINGPASS 1

			#define SHADER_UNLIT

			float4 _SelectionID;

            CBUFFER_START( UnityPerMaterial )
						float4 _EmissionColor;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			#ifdef _ENABLE_SHADOW_MATTE
			float _ShadowMatteFilter;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _AlphaCutoff;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			float _EnableBlendModePreserveSpecularLighting;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			float4 CZY_CloudColor;
			float CZY_FilterSaturation;
			float CZY_FilterValue;
			float4 CZY_FilterColor;
			float4 CZY_CloudFilterColor;
			float4 CZY_CloudHighlightColor;
			float4 CZY_SunFilterColor;
			float CZY_WindSpeed;
			float CZY_MainCloudScale;
			float CZY_CumulusCoverageMultiplier;
			float3 CZY_SunDirection;
			half CZY_SunFlareFalloff;
			float3 CZY_MoonDirection;
			half CZY_CloudMoonFalloff;
			float4 CZY_CloudMoonColor;
			float CZY_DetailScale;
			float CZY_DetailAmount;
			float CZY_BorderHeight;
			float CZY_BorderVariation;
			float CZY_BorderEffect;
			float3 CZY_StormDirection;
			float CZY_NimbusHeight;
			float CZY_NimbusMultiplier;
			float CZY_NimbusVariation;
			sampler2D CZY_ChemtrailsTexture;
			float CZY_ChemtrailsMoveSpeed;
			float CZY_ChemtrailsMultiplier;
			sampler2D CZY_CirrusTexture;
			float CZY_CirrusMoveSpeed;
			float CZY_CirrusMultiplier;
			float CZY_ClippingThreshold;
			float4 CZY_AltoCloudColor;
			sampler2D CZY_AltocumulusTexture;
			float2 CZY_AltocumulusWindSpeed;
			float CZY_AltocumulusScale;
			float CZY_AltocumulusMultiplier;
			sampler2D CZY_CirrostratusTexture;
			float CZY_CirrostratusMoveSpeed;
			float CZY_CirrostratusMultiplier;


            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/PickingSpaceTransforms.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Unlit/Unlit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			

			struct VertexInput
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_POSITION;
				float3 normalWS : TEXCOORD0;
				float4 tangentWS : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			float3 HSVToRGB( float3 c )
			{
				float4 K = float4( 1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0 );
				float3 p = abs( frac( c.xxx + K.xyz ) * 6.0 - K.www );
				return c.z * lerp( K.xxx, saturate( p - K.xxx ), c.y );
			}
			
			float3 RGBToHSV(float3 c)
			{
				float4 K = float4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
				float4 p = lerp( float4( c.bg, K.wz ), float4( c.gb, K.xy ), step( c.b, c.g ) );
				float4 q = lerp( float4( p.xyw, c.r ), float4( c.r, p.yzx ), step( p.x, c.r ) );
				float d = q.x - min( q.w, q.y );
				float e = 1.0e-10;
				return float3( abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
			}
			float3 mod2D289( float3 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }
			float2 mod2D289( float2 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }
			float3 permute( float3 x ) { return mod2D289( ( ( x * 34.0 ) + 1.0 ) * x ); }
			float snoise( float2 v )
			{
				const float4 C = float4( 0.211324865405187, 0.366025403784439, -0.577350269189626, 0.024390243902439 );
				float2 i = floor( v + dot( v, C.yy ) );
				float2 x0 = v - i + dot( i, C.xx );
				float2 i1;
				i1 = ( x0.x > x0.y ) ? float2( 1.0, 0.0 ) : float2( 0.0, 1.0 );
				float4 x12 = x0.xyxy + C.xxzz;
				x12.xy -= i1;
				i = mod2D289( i );
				float3 p = permute( permute( i.y + float3( 0.0, i1.y, 1.0 ) ) + i.x + float3( 0.0, i1.x, 1.0 ) );
				float3 m = max( 0.5 - float3( dot( x0, x0 ), dot( x12.xy, x12.xy ), dot( x12.zw, x12.zw ) ), 0.0 );
				m = m * m;
				m = m * m;
				float3 x = 2.0 * frac( p * C.www ) - 1.0;
				float3 h = abs( x ) - 0.5;
				float3 ox = floor( x + 0.5 );
				float3 a0 = x - ox;
				m *= 1.79284291400159 - 0.85373472095314 * ( a0 * a0 + h * h );
				float3 g;
				g.x = a0.x * x0.x + h.x * x0.y;
				g.yz = a0.yz * x12.xz + h.yz * x12.yw;
				return 130.0 * dot( m, g );
			}
			
					float2 voronoihash81_g5( float2 p )
					{
						
						p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
						return frac( sin( p ) *43758.5453);
					}
			
					float voronoi81_g5( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
					{
						float2 n = floor( v );
						float2 f = frac( v );
						float F1 = 8.0;
						float F2 = 8.0; float2 mg = 0;
						for ( int j = -1; j <= 1; j++ )
						{
							for ( int i = -1; i <= 1; i++ )
						 	{
						 		float2 g = float2( i, j );
						 		float2 o = voronoihash81_g5( n + g );
								o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
								float d = 0.5 * dot( r, r );
						 		if( d<F1 ) {
						 			F2 = F1;
						 			F1 = d; mg = g; mr = r; id = o;
						 		} else if( d<F2 ) {
						 			F2 = d;
						
						 		}
						 	}
						}
						return (F2 + F1) * 0.5;
					}
			
					float2 voronoihash88_g5( float2 p )
					{
						
						p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
						return frac( sin( p ) *43758.5453);
					}
			
					float voronoi88_g5( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
					{
						float2 n = floor( v );
						float2 f = frac( v );
						float F1 = 8.0;
						float F2 = 8.0; float2 mg = 0;
						for ( int j = -1; j <= 1; j++ )
						{
							for ( int i = -1; i <= 1; i++ )
						 	{
						 		float2 g = float2( i, j );
						 		float2 o = voronoihash88_g5( n + g );
								o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
								float d = 0.5 * dot( r, r );
						 		if( d<F1 ) {
						 			F2 = F1;
						 			F1 = d; mg = g; mr = r; id = o;
						 		} else if( d<F2 ) {
						 			F2 = d;
						
						 		}
						 	}
						}
						return (F2 + F1) * 0.5;
					}
			
					float2 voronoihash200_g5( float2 p )
					{
						
						p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
						return frac( sin( p ) *43758.5453);
					}
			
					float voronoi200_g5( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
					{
						float2 n = floor( v );
						float2 f = frac( v );
						float F1 = 8.0;
						float F2 = 8.0; float2 mg = 0;
						for ( int j = -1; j <= 1; j++ )
						{
							for ( int i = -1; i <= 1; i++ )
						 	{
						 		float2 g = float2( i, j );
						 		float2 o = voronoihash200_g5( n + g );
								o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
								float d = 0.5 * dot( r, r );
						 		if( d<F1 ) {
						 			F2 = F1;
						 			F1 = d; mg = g; mr = r; id = o;
						 		} else if( d<F2 ) {
						 			F2 = d;
						
						 		}
						 	}
						}
						return (F2 + F1) * 0.5;
					}
			
					float2 voronoihash232_g5( float2 p )
					{
						
						p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
						return frac( sin( p ) *43758.5453);
					}
			
					float voronoi232_g5( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
					{
						float2 n = floor( v );
						float2 f = frac( v );
						float F1 = 8.0;
						float F2 = 8.0; float2 mg = 0;
						for ( int j = -1; j <= 1; j++ )
						{
							for ( int i = -1; i <= 1; i++ )
						 	{
						 		float2 g = float2( i, j );
						 		float2 o = voronoihash232_g5( n + g );
								o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
								float d = 0.5 * dot( r, r );
						 		if( d<F1 ) {
						 			F2 = F1;
						 			F1 = d; mg = g; mr = r; id = o;
						 		} else if( d<F2 ) {
						 			F2 = d;
						
						 		}
						 	}
						}
						return F1;
					}
			
					float2 voronoihash84_g5( float2 p )
					{
						
						p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
						return frac( sin( p ) *43758.5453);
					}
			
					float voronoi84_g5( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
					{
						float2 n = floor( v );
						float2 f = frac( v );
						float F1 = 8.0;
						float F2 = 8.0; float2 mg = 0;
						for ( int j = -1; j <= 1; j++ )
						{
							for ( int i = -1; i <= 1; i++ )
						 	{
						 		float2 g = float2( i, j );
						 		float2 o = voronoihash84_g5( n + g );
								o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
								float d = 0.5 * dot( r, r );
						 		if( d<F1 ) {
						 			F2 = F1;
						 			F1 = d; mg = g; mr = r; id = o;
						 		} else if( d<F2 ) {
						 			F2 = d;
						
						 		}
						 	}
						}
						return F1;
					}
			

            struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
			};


            void GetSurfaceAndBuiltinData(SurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData RAY_TRACING_OPTIONAL_PARAMETERS)
            {
                #ifdef LOD_FADE_CROSSFADE
			        LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
                #endif

                #ifdef _ALPHATEST_ON
                    float alphaCutoff = surfaceDescription.AlphaClipThreshold;
                    GENERIC_ALPHA_TEST(surfaceDescription.Alpha, alphaCutoff);
                #endif

                #if !defined(SHADER_STAGE_RAY_TRACING) && _DEPTHOFFSET_ON
                ApplyDepthOffsetPositionInput(V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput);
                #endif


				ZERO_INITIALIZE(SurfaceData, surfaceData);

				ZERO_BUILTIN_INITIALIZE(builtinData);
				builtinData.opacity = surfaceDescription.Alpha;

				#if defined(DEBUG_DISPLAY)
					builtinData.renderingLayers = GetMeshRenderingLightLayer();
				#endif

                #ifdef _ALPHATEST_ON
                    builtinData.alphaClipTreshold = alphaCutoff;
                #endif

                #if _DEPTHOFFSET_ON
                builtinData.depthOffset = surfaceDescription.DepthOffset;
                #endif


                ApplyDebugToBuiltinData(builtinData);

            }


			VertexOutput VertexFunction(VertexInput inputMesh  )
			{

				VertexOutput o;
				ZERO_INITIALIZE(VertexOutput, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, o );

				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				o.ase_texcoord3.xyz = ase_worldPos;
				
				o.ase_texcoord2.xy = inputMesh.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.zw = 0;
				o.ase_texcoord3.w = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue =   defaultVertexValue ;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS =  inputMesh.normalOS ;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				float3 normalWS = TransformObjectToWorldNormal(inputMesh.normalOS);
				float4 tangentWS = float4(TransformObjectToWorldDir(inputMesh.tangentOS.xyz), inputMesh.tangentOS.w);

				o.positionCS = TransformWorldToHClip(positionRWS);
				o.normalWS.xyz =  normalWS;
				o.tangentWS.xyzw =  tangentWS;

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput Vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			void Frag(	VertexOutput packedInput
						, out float4 outColor : SV_Target0
						
					)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(packedInput);
				UNITY_SETUP_INSTANCE_ID(packedInput);

				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;

				input.tangentToWorld = BuildTangentToWorld(packedInput.tangentWS.xyzw, packedInput.normalWS.xyz);

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

				SurfaceDescription surfaceDescription = (SurfaceDescription)0;
				float3 hsvTorgb2_g7 = RGBToHSV( CZY_CloudColor.rgb );
				float3 hsvTorgb3_g7 = HSVToRGB( float3(hsvTorgb2_g7.x,saturate( ( hsvTorgb2_g7.y + CZY_FilterSaturation ) ),( hsvTorgb2_g7.z + CZY_FilterValue )) );
				float4 temp_output_10_0_g7 = ( float4( hsvTorgb3_g7 , 0.0 ) * CZY_FilterColor );
				float4 CloudColor41_g5 = ( temp_output_10_0_g7 * CZY_CloudFilterColor );
				float3 hsvTorgb2_g6 = RGBToHSV( CZY_CloudHighlightColor.rgb );
				float3 hsvTorgb3_g6 = HSVToRGB( float3(hsvTorgb2_g6.x,saturate( ( hsvTorgb2_g6.y + CZY_FilterSaturation ) ),( hsvTorgb2_g6.z + CZY_FilterValue )) );
				float4 temp_output_10_0_g6 = ( float4( hsvTorgb3_g6 , 0.0 ) * CZY_FilterColor );
				float4 CloudHighlightColor55_g5 = ( temp_output_10_0_g6 * CZY_SunFilterColor );
				float2 texCoord31_g5 = packedInput.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float2 Pos33_g5 = texCoord31_g5;
				float mulTime29_g5 = _TimeParameters.x * ( 0.001 * CZY_WindSpeed );
				float TIme30_g5 = mulTime29_g5;
				float simplePerlin2D409_g5 = snoise( ( Pos33_g5 + ( TIme30_g5 * float2( 0.2,-0.4 ) ) )*( 100.0 / CZY_MainCloudScale ) );
				simplePerlin2D409_g5 = simplePerlin2D409_g5*0.5 + 0.5;
				float SimpleCloudDensity153_g5 = simplePerlin2D409_g5;
				float time81_g5 = 0.0;
				float2 voronoiSmoothId81_g5 = 0;
				float2 temp_output_94_0_g5 = ( Pos33_g5 + ( TIme30_g5 * float2( 0.3,0.2 ) ) );
				float2 coords81_g5 = temp_output_94_0_g5 * ( 140.0 / CZY_MainCloudScale );
				float2 id81_g5 = 0;
				float2 uv81_g5 = 0;
				float voroi81_g5 = voronoi81_g5( coords81_g5, time81_g5, id81_g5, uv81_g5, 0, voronoiSmoothId81_g5 );
				float time88_g5 = 0.0;
				float2 voronoiSmoothId88_g5 = 0;
				float2 coords88_g5 = temp_output_94_0_g5 * ( 500.0 / CZY_MainCloudScale );
				float2 id88_g5 = 0;
				float2 uv88_g5 = 0;
				float voroi88_g5 = voronoi88_g5( coords88_g5, time88_g5, id88_g5, uv88_g5, 0, voronoiSmoothId88_g5 );
				float2 appendResult95_g5 = (float2(voroi81_g5 , voroi88_g5));
				float2 VoroDetails109_g5 = appendResult95_g5;
				float CumulusCoverage34_g5 = CZY_CumulusCoverageMultiplier;
				float ComplexCloudDensity141_g5 = (0.0 + (min( SimpleCloudDensity153_g5 , ( 1.0 - VoroDetails109_g5.x ) ) - ( 1.0 - CumulusCoverage34_g5 )) * (1.0 - 0.0) / (1.0 - ( 1.0 - CumulusCoverage34_g5 )));
				float4 lerpResult315_g5 = lerp( CloudHighlightColor55_g5 , CloudColor41_g5 , saturate( (2.0 + (ComplexCloudDensity141_g5 - 0.0) * (0.7 - 2.0) / (1.0 - 0.0)) ));
				float3 ase_worldPos = packedInput.ase_texcoord3.xyz;
				float3 normalizeResult40_g5 = normalize( ( ase_worldPos - _WorldSpaceCameraPos ) );
				float dotResult42_g5 = dot( normalizeResult40_g5 , CZY_SunDirection );
				float temp_output_49_0_g5 = abs( (dotResult42_g5*0.5 + 0.5) );
				half LightMask56_g5 = saturate( pow( temp_output_49_0_g5 , CZY_SunFlareFalloff ) );
				float time200_g5 = 0.0;
				float2 voronoiSmoothId200_g5 = 0;
				float mulTime163_g5 = _TimeParameters.x * 0.003;
				float2 coords200_g5 = (Pos33_g5*1.0 + ( float2( 1,-2 ) * mulTime163_g5 )) * 10.0;
				float2 id200_g5 = 0;
				float2 uv200_g5 = 0;
				float voroi200_g5 = voronoi200_g5( coords200_g5, time200_g5, id200_g5, uv200_g5, 0, voronoiSmoothId200_g5 );
				float time232_g5 = ( 10.0 * mulTime163_g5 );
				float2 voronoiSmoothId232_g5 = 0;
				float2 coords232_g5 = packedInput.ase_texcoord2.xy * 10.0;
				float2 id232_g5 = 0;
				float2 uv232_g5 = 0;
				float voroi232_g5 = voronoi232_g5( coords232_g5, time232_g5, id232_g5, uv232_g5, 0, voronoiSmoothId232_g5 );
				float AltoCumulusPlacement376_g5 = saturate( ( ( ( 1.0 - 0.0 ) - (1.0 + (voroi200_g5 - 0.0) * (-0.5 - 1.0) / (1.0 - 0.0)) ) - voroi232_g5 ) );
				float CloudThicknessDetails286_g5 = ( VoroDetails109_g5.y * saturate( ( AltoCumulusPlacement376_g5 - 0.8 ) ) );
				float3 normalizeResult43_g5 = normalize( ( ase_worldPos - _WorldSpaceCameraPos ) );
				float dotResult46_g5 = dot( normalizeResult43_g5 , CZY_MoonDirection );
				half MoonlightMask57_g5 = saturate( pow( abs( (dotResult46_g5*0.5 + 0.5) ) , CZY_CloudMoonFalloff ) );
				float3 hsvTorgb2_g8 = RGBToHSV( CZY_CloudMoonColor.rgb );
				float3 hsvTorgb3_g8 = HSVToRGB( float3(hsvTorgb2_g8.x,saturate( ( hsvTorgb2_g8.y + CZY_FilterSaturation ) ),( hsvTorgb2_g8.z + CZY_FilterValue )) );
				float4 temp_output_10_0_g8 = ( float4( hsvTorgb3_g8 , 0.0 ) * CZY_FilterColor );
				float4 MoonlightColor60_g5 = ( temp_output_10_0_g8 * CZY_CloudFilterColor );
				float4 lerpResult338_g5 = lerp( ( lerpResult315_g5 + ( LightMask56_g5 * CloudHighlightColor55_g5 * ( 1.0 - CloudThicknessDetails286_g5 ) ) + ( MoonlightMask57_g5 * MoonlightColor60_g5 * ( 1.0 - CloudThicknessDetails286_g5 ) ) ) , ( CloudColor41_g5 * float4( 0.5660378,0.5660378,0.5660378,0 ) ) , CloudThicknessDetails286_g5);
				float time84_g5 = 0.0;
				float2 voronoiSmoothId84_g5 = 0;
				float2 coords84_g5 = ( Pos33_g5 + ( TIme30_g5 * float2( 0.3,0.2 ) ) ) * ( 100.0 / CZY_DetailScale );
				float2 id84_g5 = 0;
				float2 uv84_g5 = 0;
				float fade84_g5 = 0.5;
				float voroi84_g5 = 0;
				float rest84_g5 = 0;
				for( int it84_g5 = 0; it84_g5 <3; it84_g5++ ){
				voroi84_g5 += fade84_g5 * voronoi84_g5( coords84_g5, time84_g5, id84_g5, uv84_g5, 0,voronoiSmoothId84_g5 );
				rest84_g5 += fade84_g5;
				coords84_g5 *= 2;
				fade84_g5 *= 0.5;
				}//Voronoi84_g5
				voroi84_g5 /= rest84_g5;
				float temp_output_173_0_g5 = ( (0.0 + (( 1.0 - voroi84_g5 ) - 0.3) * (0.5 - 0.0) / (1.0 - 0.3)) * 0.1 * CZY_DetailAmount );
				float DetailedClouds252_g5 = saturate( ( ComplexCloudDensity141_g5 + temp_output_173_0_g5 ) );
				float CloudDetail179_g5 = temp_output_173_0_g5;
				float2 texCoord79_g5 = packedInput.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float2 temp_output_161_0_g5 = ( texCoord79_g5 - float2( 0.5,0.5 ) );
				float dotResult212_g5 = dot( temp_output_161_0_g5 , temp_output_161_0_g5 );
				float BorderHeight154_g5 = ( 1.0 - CZY_BorderHeight );
				float temp_output_151_0_g5 = ( -2.0 * ( 1.0 - CZY_BorderVariation ) );
				float clampResult247_g5 = clamp( ( ( ( CloudDetail179_g5 + SimpleCloudDensity153_g5 ) * saturate( (( BorderHeight154_g5 * temp_output_151_0_g5 ) + (dotResult212_g5 - 0.0) * (( temp_output_151_0_g5 * -4.0 ) - ( BorderHeight154_g5 * temp_output_151_0_g5 )) / (0.5 - 0.0)) ) ) * 10.0 * CZY_BorderEffect ) , -1.0 , 1.0 );
				float BorderLightTransport278_g5 = clampResult247_g5;
				float3 normalizeResult116_g5 = normalize( ( ase_worldPos - _WorldSpaceCameraPos ) );
				float3 normalizeResult146_g5 = normalize( CZY_StormDirection );
				float dotResult150_g5 = dot( normalizeResult116_g5 , normalizeResult146_g5 );
				float2 texCoord98_g5 = packedInput.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float2 temp_output_124_0_g5 = ( texCoord98_g5 - float2( 0.5,0.5 ) );
				float dotResult125_g5 = dot( temp_output_124_0_g5 , temp_output_124_0_g5 );
				float temp_output_140_0_g5 = ( -2.0 * ( 1.0 - ( CZY_NimbusVariation * 0.9 ) ) );
				float NimbusLightTransport269_g5 = saturate( ( ( ( CloudDetail179_g5 + SimpleCloudDensity153_g5 ) * saturate( (( ( 1.0 - CZY_NimbusMultiplier ) * temp_output_140_0_g5 ) + (( dotResult150_g5 + ( CZY_NimbusHeight * 4.0 * dotResult125_g5 ) ) - 0.5) * (( temp_output_140_0_g5 * -4.0 ) - ( ( 1.0 - CZY_NimbusMultiplier ) * temp_output_140_0_g5 )) / (7.0 - 0.5)) ) ) * 10.0 ) );
				float mulTime104_g5 = _TimeParameters.x * 0.01;
				float simplePerlin2D143_g5 = snoise( (Pos33_g5*1.0 + mulTime104_g5)*2.0 );
				float mulTime93_g5 = _TimeParameters.x * CZY_ChemtrailsMoveSpeed;
				float cos97_g5 = cos( ( mulTime93_g5 * 0.01 ) );
				float sin97_g5 = sin( ( mulTime93_g5 * 0.01 ) );
				float2 rotator97_g5 = mul( Pos33_g5 - float2( 0.5,0.5 ) , float2x2( cos97_g5 , -sin97_g5 , sin97_g5 , cos97_g5 )) + float2( 0.5,0.5 );
				float cos131_g5 = cos( ( mulTime93_g5 * -0.02 ) );
				float sin131_g5 = sin( ( mulTime93_g5 * -0.02 ) );
				float2 rotator131_g5 = mul( Pos33_g5 - float2( 0.5,0.5 ) , float2x2( cos131_g5 , -sin131_g5 , sin131_g5 , cos131_g5 )) + float2( 0.5,0.5 );
				float mulTime107_g5 = _TimeParameters.x * 0.01;
				float simplePerlin2D147_g5 = snoise( (Pos33_g5*1.0 + mulTime107_g5)*4.0 );
				float4 ChemtrailsPattern210_g5 = ( ( saturate( simplePerlin2D143_g5 ) * tex2D( CZY_ChemtrailsTexture, (rotator97_g5*0.5 + 0.0) ) ) + ( tex2D( CZY_ChemtrailsTexture, rotator131_g5 ) * saturate( simplePerlin2D147_g5 ) ) );
				float2 texCoord139_g5 = packedInput.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float2 temp_output_162_0_g5 = ( texCoord139_g5 - float2( 0.5,0.5 ) );
				float dotResult207_g5 = dot( temp_output_162_0_g5 , temp_output_162_0_g5 );
				float ChemtrailsFinal248_g5 = ( ( ChemtrailsPattern210_g5 * saturate( (0.4 + (dotResult207_g5 - 0.0) * (2.0 - 0.4) / (0.1 - 0.0)) ) ).r > ( 1.0 - ( CZY_ChemtrailsMultiplier * 0.5 ) ) ? 1.0 : 0.0 );
				float mulTime80_g5 = _TimeParameters.x * 0.01;
				float simplePerlin2D126_g5 = snoise( (Pos33_g5*1.0 + mulTime80_g5)*2.0 );
				float mulTime75_g5 = _TimeParameters.x * CZY_CirrusMoveSpeed;
				float cos101_g5 = cos( ( mulTime75_g5 * 0.01 ) );
				float sin101_g5 = sin( ( mulTime75_g5 * 0.01 ) );
				float2 rotator101_g5 = mul( Pos33_g5 - float2( 0.5,0.5 ) , float2x2( cos101_g5 , -sin101_g5 , sin101_g5 , cos101_g5 )) + float2( 0.5,0.5 );
				float cos112_g5 = cos( ( mulTime75_g5 * -0.02 ) );
				float sin112_g5 = sin( ( mulTime75_g5 * -0.02 ) );
				float2 rotator112_g5 = mul( Pos33_g5 - float2( 0.5,0.5 ) , float2x2( cos112_g5 , -sin112_g5 , sin112_g5 , cos112_g5 )) + float2( 0.5,0.5 );
				float mulTime135_g5 = _TimeParameters.x * 0.01;
				float simplePerlin2D122_g5 = snoise( (Pos33_g5*1.0 + mulTime135_g5) );
				simplePerlin2D122_g5 = simplePerlin2D122_g5*0.5 + 0.5;
				float4 CirrusPattern137_g5 = ( ( saturate( simplePerlin2D126_g5 ) * tex2D( CZY_CirrusTexture, (rotator101_g5*1.5 + 0.75) ) ) + ( tex2D( CZY_CirrusTexture, (rotator112_g5*1.0 + 0.0) ) * saturate( simplePerlin2D122_g5 ) ) );
				float2 texCoord134_g5 = packedInput.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float2 temp_output_164_0_g5 = ( texCoord134_g5 - float2( 0.5,0.5 ) );
				float dotResult157_g5 = dot( temp_output_164_0_g5 , temp_output_164_0_g5 );
				float4 temp_output_217_0_g5 = ( CirrusPattern137_g5 * saturate( (0.0 + (dotResult157_g5 - 0.0) * (2.0 - 0.0) / (0.2 - 0.0)) ) );
				float Clipping208_g5 = CZY_ClippingThreshold;
				float CirrusAlpha250_g5 = ( ( temp_output_217_0_g5 * ( CZY_CirrusMultiplier * 10.0 ) ).r > Clipping208_g5 ? 1.0 : 0.0 );
				float SimpleRadiance268_g5 = saturate( ( DetailedClouds252_g5 + BorderLightTransport278_g5 + NimbusLightTransport269_g5 + ChemtrailsFinal248_g5 + CirrusAlpha250_g5 ) );
				float4 lerpResult342_g5 = lerp( CloudColor41_g5 , lerpResult338_g5 , ( 1.0 - SimpleRadiance268_g5 ));
				float CloudLight52_g5 = saturate( pow( temp_output_49_0_g5 , CZY_SunFlareFalloff ) );
				float4 lerpResult316_g5 = lerp( float4( 0,0,0,0 ) , CloudHighlightColor55_g5 , ( saturate( ( AltoCumulusPlacement376_g5 - 1.0 ) ) * CloudDetail179_g5 * CloudLight52_g5 ));
				float4 SunThroughClouds399_g5 = ( lerpResult316_g5 * 1.3 );
				float3 hsvTorgb2_g9 = RGBToHSV( CZY_AltoCloudColor.rgb );
				float3 hsvTorgb3_g9 = HSVToRGB( float3(hsvTorgb2_g9.x,saturate( ( hsvTorgb2_g9.y + CZY_FilterSaturation ) ),( hsvTorgb2_g9.z + CZY_FilterValue )) );
				float4 temp_output_10_0_g9 = ( float4( hsvTorgb3_g9 , 0.0 ) * CZY_FilterColor );
				float4 CirrusCustomLightColor350_g5 = ( CloudColor41_g5 * ( temp_output_10_0_g9 * CZY_CloudFilterColor ) );
				float temp_output_391_0_g5 = ( AltoCumulusPlacement376_g5 * (0.0 + (tex2D( CZY_AltocumulusTexture, ((Pos33_g5*1.0 + ( CZY_AltocumulusWindSpeed * TIme30_g5 ))*( 1.0 / CZY_AltocumulusScale ) + 0.0) ).r - 0.0) * (1.0 - 0.0) / (0.2 - 0.0)) * CZY_AltocumulusMultiplier );
				float AltoCumulusLightTransport393_g5 = temp_output_391_0_g5;
				float ACCustomLightsClipping387_g5 = ( AltoCumulusLightTransport393_g5 * ( SimpleRadiance268_g5 > Clipping208_g5 ? 0.0 : 1.0 ) );
				float mulTime193_g5 = _TimeParameters.x * 0.01;
				float simplePerlin2D224_g5 = snoise( (Pos33_g5*1.0 + mulTime193_g5)*2.0 );
				float mulTime178_g5 = _TimeParameters.x * CZY_CirrostratusMoveSpeed;
				float cos138_g5 = cos( ( mulTime178_g5 * 0.01 ) );
				float sin138_g5 = sin( ( mulTime178_g5 * 0.01 ) );
				float2 rotator138_g5 = mul( Pos33_g5 - float2( 0.5,0.5 ) , float2x2( cos138_g5 , -sin138_g5 , sin138_g5 , cos138_g5 )) + float2( 0.5,0.5 );
				float cos198_g5 = cos( ( mulTime178_g5 * -0.02 ) );
				float sin198_g5 = sin( ( mulTime178_g5 * -0.02 ) );
				float2 rotator198_g5 = mul( Pos33_g5 - float2( 0.5,0.5 ) , float2x2( cos198_g5 , -sin198_g5 , sin198_g5 , cos198_g5 )) + float2( 0.5,0.5 );
				float mulTime184_g5 = _TimeParameters.x * 0.01;
				float simplePerlin2D216_g5 = snoise( (Pos33_g5*10.0 + mulTime184_g5)*4.0 );
				float4 CirrostratPattern261_g5 = ( ( saturate( simplePerlin2D224_g5 ) * tex2D( CZY_CirrostratusTexture, (rotator138_g5*1.5 + 0.75) ) ) + ( tex2D( CZY_CirrostratusTexture, (rotator198_g5*1.5 + 0.75) ) * saturate( simplePerlin2D216_g5 ) ) );
				float2 texCoord234_g5 = packedInput.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float2 temp_output_243_0_g5 = ( texCoord234_g5 - float2( 0.5,0.5 ) );
				float dotResult238_g5 = dot( temp_output_243_0_g5 , temp_output_243_0_g5 );
				float clampResult264_g5 = clamp( ( CZY_CirrostratusMultiplier * 0.5 ) , 0.0 , 0.98 );
				float CirrostratLightTransport281_g5 = ( ( CirrostratPattern261_g5 * saturate( (0.4 + (dotResult238_g5 - 0.0) * (2.0 - 0.4) / (0.1 - 0.0)) ) ).r > ( 1.0 - clampResult264_g5 ) ? 1.0 : 0.0 );
				float CSCustomLightsClipping309_g5 = ( CirrostratLightTransport281_g5 * ( SimpleRadiance268_g5 > Clipping208_g5 ? 0.0 : 1.0 ) );
				float CustomRadiance340_g5 = saturate( ( ACCustomLightsClipping387_g5 + CSCustomLightsClipping309_g5 ) );
				float4 lerpResult331_g5 = lerp( ( lerpResult342_g5 + SunThroughClouds399_g5 ) , CirrusCustomLightColor350_g5 , CustomRadiance340_g5);
				float FinalAlpha375_g5 = saturate( ( DetailedClouds252_g5 + BorderLightTransport278_g5 + AltoCumulusLightTransport393_g5 + ChemtrailsFinal248_g5 + CirrostratLightTransport281_g5 + CirrusAlpha250_g5 + NimbusLightTransport269_g5 ) );
				float4 appendResult420_g5 = (float4((lerpResult331_g5).rgb , FinalAlpha375_g5));
				float4 FinalCloudColor325_g5 = appendResult420_g5;
				
				surfaceDescription.Alpha = ( ( (FinalCloudColor325_g5).w * ( 1.0 - 0.0 ) ) > Clipping208_g5 ? 1.0 : 0.0 );
				surfaceDescription.AlphaClipThreshold =  Clipping208_g5;


				float3 V = float3(1.0, 1.0, 1.0);

				SurfaceData surfaceData;
				BuiltinData builtinData;
				GetSurfaceAndBuiltinData(surfaceDescription, input, V, posInput, surfaceData, builtinData);
				outColor = _SelectionID;
			}

            ENDHLSL
        }

		Pass
		{
			Name "FullScreenDebug"
			Tags 
			{ 
				"LightMode" = "FullScreenDebug" 
			}

			Cull [_CullMode]
			ZTest LEqual
			ZWrite Off

			HLSLPROGRAM

			/*ase_pragma_before*/

			#pragma vertex Vert
			#pragma fragment Frag

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
	
			#define SHADERPASS SHADERPASS_FULL_SCREEN_DEBUG

			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				#if UNITY_ANY_INSTANCING_ENABLED
					uint instanceID : INSTANCEID_SEMANTIC;
				#endif
			};

			struct VaryingsMeshToPS
			{
				SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				#if UNITY_ANY_INSTANCING_ENABLED
					uint instanceID : CUSTOM_INSTANCE_ID;
				#endif
			};

			struct PackedVaryingsMeshToPS
			{
				SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				#if UNITY_ANY_INSTANCING_ENABLED
					uint instanceID : CUSTOM_INSTANCE_ID;
				#endif
			};

			VaryingsMeshToPS UnpackVaryingsMeshToPS (PackedVaryingsMeshToPS input)
			{
				VaryingsMeshToPS output;
				output.positionCS = input.positionCS;
				#if UNITY_ANY_INSTANCING_ENABLED
				output.instanceID = input.instanceID;
				#endif
				return output;
			}

			PackedVaryingsMeshToPS PackVaryingsMeshToPS (VaryingsMeshToPS input)
			{
				PackedVaryingsMeshToPS output;
				ZERO_INITIALIZE(PackedVaryingsMeshToPS, output);
				output.positionCS = input.positionCS;
				#if UNITY_ANY_INSTANCING_ENABLED
				output.instanceID = input.instanceID;
				#endif
				return output;
			}

			FragInputs BuildFragInputs(VaryingsMeshToPS input)
			{
				FragInputs output;
				ZERO_INITIALIZE(FragInputs, output);

				output.tangentToWorld = k_identity3x3;
				output.positionSS = input.positionCS;

				return output;
			}

			FragInputs UnpackVaryingsMeshToFragInputs(PackedVaryingsMeshToPS input)
			{
				UNITY_SETUP_INSTANCE_ID(input);
				VaryingsMeshToPS unpacked = UnpackVaryingsMeshToPS(input);
				return BuildFragInputs(unpacked);
			}

			#define DEBUG_DISPLAY
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/FullScreenDebug.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/VertMesh.hlsl"

			PackedVaryingsType Vert(AttributesMesh inputMesh)
			{
				VaryingsType varyingsType;
				varyingsType.vmesh = VertMesh(inputMesh);
				return PackVaryingsType(varyingsType);
			}

			#if !defined(_DEPTHOFFSET_ON)
			[earlydepthstencil] // quad overshading debug mode writes to UAV
			#endif
			void Frag(PackedVaryingsToPS packedInput)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(packedInput);
				FragInputs input = UnpackVaryingsToFragInputs(packedInput);

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS.xyz);

			#ifdef PLATFORM_SUPPORTS_PRIMITIVE_ID_IN_PIXEL_SHADER
				if (_DebugFullScreenMode == FULLSCREENDEBUGMODE_QUAD_OVERDRAW)
				{
					IncrementQuadOverdrawCounter(posInput.positionSS.xy, input.primitiveID);
				}
			#endif
			}

			ENDHLSL
		}
		
	}
	
	CustomEditor "Rendering.HighDefinition.HDUnlitGUI"
	Fallback "Hidden/InternalErrorShader"
	
}
/*ASEBEGIN
Version=19302
Node;AmplifyShaderEditor.FunctionNode;829;-3648,-672;Inherit;False;Stylized Clouds (Desktop);0;;5;b8040dba3255391449edffa0921d9c37;0;0;3;FLOAT4;0;FLOAT;414;FLOAT;415
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;820;-3296,-672;Float;False;True;-1;2;Rendering.HighDefinition.HDUnlitGUI;0;13;Distant Lands/Cozy/HDRP/Stylized Clouds (Desktop);7f5cb9c3ea6481f469fdd856555439ef;True;Forward Unlit;0;0;Forward Unlit;9;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Transparent=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;True;1;0;True;_SrcBlend;0;True;_DstBlend;1;0;True;_AlphaSrcBlend;0;True;_AlphaDstBlend;False;False;False;False;False;False;False;False;False;False;False;True;True;1;False;_CullModeForward;False;False;False;True;True;True;True;True;0;True;_ColorMaskTransparentVel;False;False;False;False;False;True;True;0;True;_StencilRef;255;False;;255;True;_StencilWriteMask;7;False;;3;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;0;True;_ZWrite;True;0;True;_ZTestDepthEqualForOpaque;False;True;1;LightMode=ForwardOnly;False;False;0;Hidden/InternalErrorShader;0;0;Standard;30;Surface Type;1;638350062569863069;  Rendering Pass ;0;0;  Rendering Pass;1;0;  Blending Mode;0;0;  Receive Fog;1;0;  Distortion;0;0;    Distortion Mode;0;0;    Distortion Only;1;0;  Depth Write;1;0;  Cull Mode;0;0;  Depth Test;4;0;Double-Sided;0;0;Alpha Clipping;1;638410241851663018;Receive Decals;1;0;Motion Vectors;1;0;  Add Precomputed Velocity;0;0;Shadow Matte;0;0;Cast Shadows;1;0;GPU Instancing;1;0;Tessellation;0;0;  Phong;0;0;  Strength;0.5,False,;0;  Type;0;0;  Tess;16,False,;0;  Min;10,False,;0;  Max;25,False,;0;  Edge Length;16,False,;0;  Max Displacement;25,False,;0;Vertex Position,InvertActionOnDeselection;1;0;LOD CrossFade;0;0;0;8;True;True;True;True;True;True;False;True;False;;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;821;-3296,-672;Float;False;False;-1;2;Rendering.HighDefinition.HDUnlitGUI;0;1;New Amplify Shader;7f5cb9c3ea6481f469fdd856555439ef;True;ShadowCaster;0;1;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;_CullMode;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;True;1;LightMode=ShadowCaster;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;822;-3296,-672;Float;False;False;-1;2;Rendering.HighDefinition.HDUnlitGUI;0;1;New Amplify Shader;7f5cb9c3ea6481f469fdd856555439ef;True;META;0;2;META;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;823;-3296,-672;Float;False;False;-1;2;Rendering.HighDefinition.HDUnlitGUI;0;1;New Amplify Shader;7f5cb9c3ea6481f469fdd856555439ef;True;SceneSelectionPass;0;3;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;824;-3296,-672;Float;False;False;-1;2;Rendering.HighDefinition.HDUnlitGUI;0;1;New Amplify Shader;7f5cb9c3ea6481f469fdd856555439ef;True;DepthForwardOnly;0;4;DepthForwardOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;_CullMode;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;True;True;0;True;_StencilRefDepth;255;False;;255;True;_StencilWriteMaskDepth;7;False;;3;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;False;False;True;1;LightMode=DepthForwardOnly;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;826;-3296,-672;Float;False;False;-1;2;Rendering.HighDefinition.HDUnlitGUI;0;1;New Amplify Shader;7f5cb9c3ea6481f469fdd856555439ef;True;DistortionVectors;0;6;DistortionVectors;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;True;4;1;False;;1;False;;4;1;False;;1;False;;True;1;False;;1;False;;False;False;False;False;False;False;False;False;False;False;False;True;0;True;_CullMode;False;False;False;False;False;False;False;False;False;True;True;0;True;_StencilRefDistortionVec;255;False;;255;True;_StencilWriteMaskDistortionVec;7;False;;3;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;2;False;;True;3;False;;False;True;1;LightMode=DistortionVectors;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;827;-3296,-672;Float;False;False;-1;2;Rendering.HighDefinition.HDUnlitGUI;0;1;New Amplify Shader;7f5cb9c3ea6481f469fdd856555439ef;True;ScenePickingPass;0;7;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;_CullMode;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;True;3;False;;False;True;1;LightMode=Picking;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;830;-3296,-438.1429;Float;False;False;-1;2;Rendering.HighDefinition.HDUnlitGUI;0;1;New Amplify Shader;7f5cb9c3ea6481f469fdd856555439ef;True;MotionVectors;0;5;MotionVectors;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;_CullMode;False;False;False;False;False;False;False;False;False;True;True;0;True;_StencilRefMV;255;False;;255;True;_StencilWriteMaskMV;7;False;;3;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;False;False;True;1;LightMode=MotionVectors;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
WireConnection;820;0;829;0
WireConnection;820;2;829;414
WireConnection;820;3;829;415
ASEEND*/
//CHKSM=A3B0B77DB27995951D8BC56171D956A4CD7BFC51