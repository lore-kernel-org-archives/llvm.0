Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCC4377EDC
	for <llvm@lists.linux.dev>; Wed, 22 Apr 2026 16:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776876538; cv=none; b=fRHAuvqazK0XXQtg1+6FzJgAPdzmNY9PNRAUZXs47eQcmNLTwzx4sJn1iqaHp44cfUnfJ75U+ABFxCAip6dvn1wo4flXMMazl1vXgumqKP8Vs+qjlMpbzWVjFmaLGVhvL4aEAfF4HWsENgCpthvO68xlQQ+Nd2GzYoxO3gPoLso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776876538; c=relaxed/simple;
	bh=2JbHJF1NTTTC0KxllOVle0SwaqYyMlTcdqYE5c5d3Wk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gfUGnK2mReddscqlDG+Ll/f7CRujrPA8JDfA45LvfIqzArXvVvC8shA5jbe06FK1mh0m8LQbDCf0MV/dpo/EAdBs/YHgqQR0igHvbOpyomk8vJ0Ogp7zExPAatbav4aQpJU38xyotAf57k/QIkTV3CWHn/vM386YafAUqd0UZlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=POIJG2qp; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="POIJG2qp"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0DC7AC5B1AC;
	Wed, 22 Apr 2026 16:49:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 295245FA8F;
	Wed, 22 Apr 2026 16:48:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4977010460BF0;
	Wed, 22 Apr 2026 18:48:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776876534; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QM1+80iScubDXS7ZUrDW5AhCFai24uch4ln8tfIxf6g=;
	b=POIJG2qprmclyflmISs+ldiw4HYLinBb2sPfAvP5SNX0E3KWSmUUiS5jtjjt+18lnV18xA
	2ZzthbGpoacVXuXEZZEEhDTYbrILRIBhWACY8iDw9v2+QKv5+kS8CqWaQhZ6SISdQG87A0
	457z7uQWI4Id7E2TSG89tCE1PvZjykbp8Ud2gSJzGnAVonvk9AXnHIWaRektOovv+36hCP
	0xcfUJvZs8i58JQ3lCWQ5sTZjO2pnxixsUfeihrIFzthmdhNS45tujetK9t7oENny2lolG
	K9Y91PcgnLlYNu5G4Siq+apEDOqXbp/YdU98qzGqq3exRq+zhkbp/v9cm3c/Zw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 22 Apr 2026 18:47:59 +0200
Subject: [PATCH v4 02/37] drm/blend: Get a rotation name from it's bitfield
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260422-vkms-all-config-v4-2-dbb52e9aadc3@bootlin.com>
References: <20260422-vkms-all-config-v4-0-dbb52e9aadc3@bootlin.com>
In-Reply-To: <20260422-vkms-all-config-v4-0-dbb52e9aadc3@bootlin.com>
To: Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, jose.exposito89@gmail.com, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: victoria@system76.com, sebastian.wick@redhat.com, victoria@system76.com, 
 airlied@gmail.com, thomas.petazzoni@bootlin.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>, 
 llvm@lists.linux.dev, 
 =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito@redhat.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.16-dev
X-Last-TLS-Session-Version: TLSv1.3

Having the rotation/reflection name from its value can be useful for
debugging purpose. Extract the rotation property table and implement
drm_get_rotation_name.

Reviewed-by: José Expósito <jose.exposito@redhat.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/drm_blend.c | 35 ++++++++++++++++++++++++++---------
 include/drm/drm_blend.h     |  2 ++
 2 files changed, 28 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
index 1f3af27d2418..11d8e13caea3 100644
--- a/drivers/gpu/drm/drm_blend.c
+++ b/drivers/gpu/drm/drm_blend.c
@@ -256,6 +256,31 @@ int drm_plane_create_alpha_property(struct drm_plane *plane)
 }
 EXPORT_SYMBOL(drm_plane_create_alpha_property);
 
+static const struct drm_prop_enum_list rotation_props[] = {
+	{ __builtin_ffs(DRM_MODE_ROTATE_0) - 1,   "rotate-0" },
+	{ __builtin_ffs(DRM_MODE_ROTATE_90) - 1,  "rotate-90" },
+	{ __builtin_ffs(DRM_MODE_ROTATE_180) - 1, "rotate-180" },
+	{ __builtin_ffs(DRM_MODE_ROTATE_270) - 1, "rotate-270" },
+	{ __builtin_ffs(DRM_MODE_REFLECT_X) - 1,  "reflect-x" },
+	{ __builtin_ffs(DRM_MODE_REFLECT_Y) - 1,  "reflect-y" },
+};
+
+/**
+ * drm_get_rotation_name - Return the name of a rotation
+ * @rotation: The rotation mask (DRM_MODE_ROTATE_* | DRM_MODE_REFLECT_*)
+ *
+ * Returns: the name of the rotation type (unknown) if rotation is not
+ * a known rotation/reflection
+ */
+const char *drm_get_rotation_name(unsigned int rotation)
+{
+	if (rotation < ARRAY_SIZE(rotation_props))
+		return rotation_props[rotation].name;
+
+	return "(unknown)";
+}
+EXPORT_SYMBOL(drm_get_rotation_name);
+
 /**
  * drm_plane_create_rotation_property - create a new rotation property
  * @plane: drm plane
@@ -294,14 +319,6 @@ int drm_plane_create_rotation_property(struct drm_plane *plane,
 				       unsigned int rotation,
 				       unsigned int supported_rotations)
 {
-	static const struct drm_prop_enum_list props[] = {
-		{ __builtin_ffs(DRM_MODE_ROTATE_0) - 1,   "rotate-0" },
-		{ __builtin_ffs(DRM_MODE_ROTATE_90) - 1,  "rotate-90" },
-		{ __builtin_ffs(DRM_MODE_ROTATE_180) - 1, "rotate-180" },
-		{ __builtin_ffs(DRM_MODE_ROTATE_270) - 1, "rotate-270" },
-		{ __builtin_ffs(DRM_MODE_REFLECT_X) - 1,  "reflect-x" },
-		{ __builtin_ffs(DRM_MODE_REFLECT_Y) - 1,  "reflect-y" },
-	};
 	struct drm_property *prop;
 
 	WARN_ON((supported_rotations & DRM_MODE_ROTATE_MASK) == 0);
@@ -309,7 +326,7 @@ int drm_plane_create_rotation_property(struct drm_plane *plane,
 	WARN_ON(rotation & ~supported_rotations);
 
 	prop = drm_property_create_bitmask(plane->dev, 0, "rotation",
-					   props, ARRAY_SIZE(props),
+					   rotation_props, ARRAY_SIZE(rotation_props),
 					   supported_rotations);
 	if (!prop)
 		return -ENOMEM;
diff --git a/include/drm/drm_blend.h b/include/drm/drm_blend.h
index c7e888767c81..dc9ea3f61c35 100644
--- a/include/drm/drm_blend.h
+++ b/include/drm/drm_blend.h
@@ -43,6 +43,8 @@ static inline bool drm_rotation_90_or_270(unsigned int rotation)
 
 #define DRM_BLEND_ALPHA_OPAQUE		0xffff
 
+const char *drm_get_rotation_name(unsigned int rotation);
+
 int drm_plane_create_alpha_property(struct drm_plane *plane);
 int drm_plane_create_rotation_property(struct drm_plane *plane,
 				       unsigned int rotation,

-- 
2.54.0

