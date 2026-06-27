Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B1A1A262D
	for <llvm@lists.linux.dev>; Sat, 27 Jun 2026 03:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782531073; cv=none; b=AFrYTXSIlrRlUbko711QmeqeX6xEvSzG0nlRliaEtTlX2y0yJ95TxN5DO6rmC5mFJdCKfYGmrgvIdSv+EdTxT/H3Zb0jnc6yE0tXpheM89qQlYyP3uqspjVHRwi1P7OY0q8xDe4U5LvQhLtPCIJJMFExYMstz8eAq73HfhUDOgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782531073; c=relaxed/simple;
	bh=tbNblOwZZzE1Y64mp73eAM5o2mppDB/MrH/5NXGp3ZY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ULb5C3fglCPE2BpQ0JKto8kYF8bsKn1cpGpxe/4m3MtjhFXUg1i7zmjdd4Y2bDjOvscZABA72H80jAXHTBQzQBgJW9TdSCet4hFMAwYpxuIOf3D1FgvzsfSEaFulgXtJskUqe/ytZG2nOjjQ+NLVp6ZBrfFlCdQkvx3h7AweDeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=GYbU6YRm; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="GYbU6YRm"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 306234E409E2;
	Sat, 27 Jun 2026 03:31:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0424160233;
	Sat, 27 Jun 2026 03:31:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B0A90106F116F;
	Sat, 27 Jun 2026 05:31:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782531063; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bfHiIvddr7Ju7wHJmkuXmzPCw5MJavyMHiE/+sY4NCQ=;
	b=GYbU6YRmdiKAvOVx+SPWpf7asTWBeHNL43OLV0hzwWIc0YeGpTZHDHxpOdWmvv9UCpRa1Q
	K2KRJGgDSc3Rftmvcnu8e9294XFGpn82cv0qAUMXBQ9Zmt9lTl1JJqSG+x96z622zorPIN
	zfBjq4su/YQqyOU7FKyWnF2WxzjnOdKCMpqVlJXiXS8cug7VhoDk2ETHi5eiKMva2l7z5X
	g0GKiBBR6GjneH2UVgAxgep1+gGhp5rDRKe1e4i7GerSkDGXv7/FvSBC5QU9R6Xb1LmAWl
	2hO8syANEQl2eX7SlJ7Mgoi6oySaBEpy1Vl6vdgPSoIY4Kg2pVjywQ3ryCugjA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Sat, 27 Jun 2026 05:30:23 +0200
Subject: [PATCH v5 06/38] drm/drm_atomic_state_helper: Properly load
 default value for rotation
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260627-vkms-all-config-v5-6-854aa0840926@bootlin.com>
References: <20260627-vkms-all-config-v5-0-854aa0840926@bootlin.com>
In-Reply-To: <20260627-vkms-all-config-v5-0-854aa0840926@bootlin.com>
To: Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, jose.exposito89@gmail.com, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Kory Maincent <kory.maincent@bootlin.com>, victoria@system76.com, 
 sebastian.wick@redhat.com, victoria@system76.com, airlied@gmail.com, 
 thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Louis Chauvet <louis.chauvet@bootlin.com>, llvm@lists.linux.dev
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1534;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=tbNblOwZZzE1Y64mp73eAM5o2mppDB/MrH/5NXGp3ZY=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBqP0PdBX1qs+QMZjo+7F8jVzOTpYFtq6nyNFaoY
 vdjMpCS49SJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaj9D3RsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQIK0uxlsQLOL6NQ/9Gi6+yRgbhFV/JzJUE3AYNmrzz/TFvXs
 7Ek4sbTwkDgvrYEn5OUeumn44ZEec2IvXu9wDltv6tdFOEYMWLBUdf6IGCGMI03/D7Zz2lvDhOd
 goDUVKOyYBglZPs1f0zs/tdllgL8COFiEDet1HU/O+bjmwbXRdk1De2wkEcZ7h4GrPHFvqDhgMg
 Q1bK53YUl7rM+KC6lpHzDkS3pnskwomyUZz6J0QG4Kj7YbyLz3YPnfHMEPsaNYIM9pBG1Y3R8x5
 L6Qes0Tw1VIi6KkEbxJkbkN0gg5zSU291CrCsg75pyNiBZRVC8hbLrn+TNFhRQmbbcBQUi5cBCU
 Sqb54TSOm5+5hraC5HBvF27BaoG4l/AmkvInT8osQSOpsHcMkBZOOjzFX5Yh632qPG/48aWoWWk
 OSVV+aNAkca8p5ZQO2ApCGcq7D6d/icKJ3Ay9m59ZzsXh0/xq60qeVPRiKlsNuLv46F04PdTLxY
 xqCSxBRZ5+ZdvIgqP6efxGDyG1iB02Rhj5zTh9wV5g4HF35zks34AP3xKtt3E26cQ3huKh2m9ey
 W+T90RDYOtbXJmX4LxwM2KA3XefuR0iWUJ3a2CDpefxo+2qwTfvG3bdIjUJ2zkhh+ANCcX/VmzI
 WRXcDO8BizZC/BS3F/U17kp0PM4aiuyuR3it0jl1ww4Z+VnQAb8Y=
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-Last-TLS-Session-Version: TLSv1.3

Currently, the default rotation is always DRM_MODE_ROTATE_0 for all planes.
Some planes may have a rotation property, and the property may specify a
different default value and supported values.

This is not an issue for "fixed" configurations, but with the introduction
of VKMS configuration, some plane may only support 90° and 180°
rotations, so the reset state of the plane was wrong (forced to 0°).

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/drm_atomic_state_helper.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index d90d1d7c9cf9..7fe612c4da83 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -32,6 +32,7 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_device.h>
 #include <drm/drm_framebuffer.h>
+#include <drm/drm_mode_object.h>
 #include <drm/drm_plane.h>
 #include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
@@ -276,6 +277,11 @@ void __drm_atomic_helper_plane_state_init(struct drm_plane_state *plane_state,
 
 	plane_state->plane = plane;
 	plane_state->rotation = DRM_MODE_ROTATE_0;
+	if (plane->rotation_property &&
+	    !drm_object_property_get_default_value(&plane->base,
+						   plane->rotation_property,
+						   &val))
+		plane_state->rotation = val;
 
 	plane_state->alpha = DRM_BLEND_ALPHA_OPAQUE;
 	plane_state->pixel_blend_mode = DRM_MODE_BLEND_PREMULTI;

-- 
2.54.0

