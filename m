Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795692563;
	b=yFON99y36rkV3Z2DSF6R6rxp2MdJSiE7RNoaQPT3mlOafxBXs6CwyLi+Jk7Dp79i1NUd
	 cW8p6OJyylckIaWuotU9f2VniLVU1GrF5QzJtboXFvXrLxEajd1UvhH0veUF91FnSQvUS
	 OMjmWZQsTJMOpSvZ85lYFQR05vHfXg4JvWotAUYuuP/K7uWzOh4jjTZO3foeOxXbkQuyz
	 ethxaglMhoJMP63G8JoeMwzSB8/i5hEt8KQUEXDepaN3TVLNgYqOQz1o3bYKaAgWxZ8LM
	 T8jPBww27+U6FwrbNy5+QnxEaVzaZbOJwOo0ZKPR3+TB8f/4U4r7DhSjSWpz6FANvcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692563;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=4S7wBwkVfoh8agC1cR7Rwok7SkekrJxO2KJemMLkoBo=;
	b=4xc2W6PL9NnXjfJhfXf4qyrScdCcQQPAktcuE5YoZyWcEsTjwewvwwdE5SnZU0HuI2Fg
	 /R0o2SkN5IurTIosPxSc2Xd5bmQDl/yWywC+eGul9/muNy+S4HpgNxEWz5JtdJRSbn6lS
	 KoqyBme2XEqphsuWZK5+FlYaqyKf38PDD2IxvLztPnnDHyJ9earZCz78h0LQQo41V4pBi
	 gCKoQ6zgMHWqsGPmI/kN4Q+94vTeqRlh/UocVaFx8OsU5mMEoy49J8IzAV2uPWlzcl8oh
	 Tt46cj+WQQ4wf4fmsOxUyXfvRfTFdOeLdT6h2R96GiKxv8eD4MHXgMHw2VJhRbyB3nQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=MhaZdC8y;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C2F606A32E
	for <llvm@lists.linux.dev>; Thu, 26 Nov 2026 11:29:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9C2F606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=MhaZdC8y
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9EE821A1810;
	Thu, 26 Nov 2026 11:29:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6AC9C60237;
	Thu, 26 Nov 2026 11:29:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 42F3411E6B361;
	Thu, 26 Nov 2026 12:29:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795692558; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4S7wBwkVfoh8agC1cR7Rwok7SkekrJxO2KJemMLkoBo=;
	b=MhaZdC8yTweJDc+pkk4TtKF5Iwq62nitRsbvcQe6WIZ6hL1+ySh13lc/bdc1K0L8ZaFlJ+
	HrBy1EuQX9a1Z6GhTbB4oDDc2pGEjvwgDoJ4TywuSkiwyhpvbrDcC8HAghTdKU8bUVtat5
	9dzcPBYvaipNuiT3ijIDZCKr4+84qQMqaiweLJKbjhDENBZG02uYAB+VOjQrVhMl+UpzCp
	QBcmyKwNzMYy+nDZGIS0mQbhpYaxU01F5X3UrqEAR/uZF6dGQxMfAuRN6wp0aI2LoTbr51
	SBrKn7HHqUJy2yt4rC7sdsh3sdKjG3DTisiaj4S4NTXHhf5+OL+3meAPoX/LHg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 26 Nov 2026 12:28:46 +0100
Subject: [PATCH v7 03/43] drm/blend: Get a rotation name from its bitfield
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-vkms-all-config-v7-3-21194cda2468@bootlin.com>
References: <20261126-vkms-all-config-v7-0-21194cda2468@bootlin.com>
In-Reply-To: <20261126-vkms-all-config-v7-0-21194cda2468@bootlin.com>
To: Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, jose.exposito89@gmail.com, 
 Jonathan Corbet <corbet@lwn.net>, Oarora Etimis <oaroraetimis@gmail.com>, 
 Harry Wentland <harry.wentland@amd.com>, 
 Lucas De Marchi <demarchi@kernel.org>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Shuah Khan <skhan@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Kory Maincent <kory.maincent@bootlin.com>, sebastian.wick@redhat.com, 
 victoria@system76.com, thomas.petazzoni@bootlin.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, llvm@lists.linux.dev
X-Mailer: b4 0.17-dev
X-Last-TLS-Session-Version: TLSv1.3

Extract the rotation/reflection name table and expose the
DRM_ROTATION_FMT()/DRM_ROTATION_FMT_ARGS() helpers to print a
human-readable rotation mask.

Reviewed-by: Oarora Etimis <oaroraetimis@gmail.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/drm_blend.c | 19 ++++++++++---------
 include/drm/drm_blend.h     | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
index d17ae964fb21..b62f1db9c311 100644
--- a/drivers/gpu/drm/drm_blend.c
+++ b/drivers/gpu/drm/drm_blend.c
@@ -256,6 +256,15 @@ int drm_plane_create_alpha_property(struct drm_plane *plane)
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
 /**
  * drm_plane_create_rotation_property - create a new rotation property
  * @plane: drm plane
@@ -294,14 +303,6 @@ int drm_plane_create_rotation_property(struct drm_plane *plane,
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
@@ -309,7 +310,7 @@ int drm_plane_create_rotation_property(struct drm_plane *plane,
 	WARN_ON(rotation & ~supported_rotations);
 
 	prop = drm_property_create_bitmask(plane->dev, 0, "rotation",
-					   props, ARRAY_SIZE(props),
+					   rotation_props, ARRAY_SIZE(rotation_props),
 					   supported_rotations);
 	if (!prop)
 		return -ENOMEM;
diff --git a/include/drm/drm_blend.h b/include/drm/drm_blend.h
index bebbb77a8f21..f000b10a16e7 100644
--- a/include/drm/drm_blend.h
+++ b/include/drm/drm_blend.h
@@ -43,6 +43,40 @@ static inline bool drm_rotation_90_or_270(unsigned int rotation)
 
 #define DRM_BLEND_ALPHA_OPAQUE		0xffff
 
+/**
+ * DRM_ROTATION_FMT - printf format string describing a rotation bitmask
+ *
+ * To be used together with DRM_ROTATION_FMT_ARGS(), e.g.:
+ *
+ *	seq_printf(m, "rotation=" DRM_ROTATION_FMT "\n",
+ *		   DRM_ROTATION_FMT_ARGS(state->rotation));
+ *
+ * The result names every set bit, separated by single spaces, and ends
+ * with the raw value in parentheses, e.g.:
+ *
+ *	rotate-90 reflect-x (0x00000012)
+ *
+ * The trailing raw value ensures the output is never empty and never
+ * ends with a space, even when no bit is set.
+ */
+#define DRM_ROTATION_FMT "%s%s%s%s%s%s(0x%08x)"
+
+/**
+ * DRM_ROTATION_FMT_ARGS - printf arguments for DRM_ROTATION_FMT
+ * @rot: rotation bitmask (DRM_MODE_ROTATE_* | DRM_MODE_REFLECT_*)
+ *
+ * Evaluates @rot several times: only pass a variable or an expression
+ * without side effects.
+ */
+#define DRM_ROTATION_FMT_ARGS(rot) \
+	((rot) & DRM_MODE_ROTATE_0)   ? "rotate-0 "   : "", \
+	((rot) & DRM_MODE_ROTATE_90)  ? "rotate-90 "  : "", \
+	((rot) & DRM_MODE_ROTATE_180) ? "rotate-180 " : "", \
+	((rot) & DRM_MODE_ROTATE_270) ? "rotate-270 " : "", \
+	((rot) & DRM_MODE_REFLECT_X)  ? "reflect-x "  : "", \
+	((rot) & DRM_MODE_REFLECT_Y)  ? "reflect-y "  : "", \
+	(rot)
+
 int drm_plane_create_alpha_property(struct drm_plane *plane);
 int drm_plane_create_rotation_property(struct drm_plane *plane,
 				       unsigned int rotation,

-- 
2.56.0

