Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795692702;
	b=k7yfcnXOOpGkts+8xRd0XMFRP6IHjEo/xS+3AeOu6hkF5APVSXdPCY8Go3pL/ID3+MBv
	 FtV9idxRQ+BlnqKTOIRIuPDK6A2sjgA0AOfdY77SlezfWnJOS71BUXwYNNEdMJ0EUZ09h
	 SQZNOCRrJU7zm9AbpnmOkKJFknj7naHOPpBJUrN+xwfBftxNNgoU7WMrR+BIaa6NAKfDl
	 oUcQsBsK0pwqw4fQS5szFDK1KNvP0xvU8tYtiigXhG38jwr8WTzBu57G9dMXQjHdcnBKA
	 BbauW4S+XOQ69tPPwvgK3AwkW1bW4Ib9+kL4MQ2dyBPosuJVfUu19jjQs3SyVq4ff0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692702;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=v4E8nGsuvX3mIl/9Utqe7o7ItVMt2A3nd0orK1dl44I=;
	b=wEI0XfMCzmgfTvHMCWrWvmnTinmwrdNs9pRJ2IWEgGdARuck0bjXHt9uVbHOB0ezP/PX
	 +i76iZoSEv6tyk0l6N2+lZnHd9oFL7acdnx0qwdPB4I0L9DYQpgjN6+HNJHOelpg9vu+h
	 7vJP1dl+BJgbLr+r/9xbbPDrCJaPORSc0iTNXdAK/otPWxhTRjO/MxsJ/uMkr7EA9t8qC
	 Kug32auw0iRIR4DCcxuO6OxPT+VwuTdWbC8gTN4qMIL0X24xzCCVqh86sewPl3vyhiget
	 Ba96ucIk0uHsQ+FncsouO0nSx8cF3x+6J3q3vVNCvrOmG0jVYsAS0+k5MHmA18JCWVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=0nXvzWDQ;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB12606A330
	for <llvm@lists.linux.dev>; Thu, 26 Nov 2026 11:31:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FB12606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=0nXvzWDQ
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B0DF24E4179C;
	Thu, 26 Nov 2026 11:31:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7F58360237;
	Thu, 26 Nov 2026 11:31:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9527411E6B363;
	Thu, 26 Nov 2026 12:31:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795692698; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=v4E8nGsuvX3mIl/9Utqe7o7ItVMt2A3nd0orK1dl44I=;
	b=0nXvzWDQb5k8TUXoCaBlscxK+uhvCeYYVAYpJukX2Tz8EvbVEh+grjR3gpHEAur+pn6sW6
	e3h/23d909rDpKAIQUwL9tMwbWJ0XyUBM1x0qzbKuA5DUapjUPLVm0dk4rrkp0uPCOul6w
	MFr+oMErk+5kn24yI1Pa2z9M1lOBqLchhIF3hZYrijBQhjLQbTzrBulRnnNMJgCTbI1Eph
	mmSx94E4dxFBQdo3mcSV+Pp9rdOclTOC5lvVYxz9+9f9tYANdJqKCBog/V42a2QLHSYoXq
	OvSgIFbgy+xLq9OOm5flUEwHqakLSyjf5hpA6TQhKgS6hsEyV9eyyBjeHTNf5A==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 26 Nov 2026 12:29:06 +0100
Subject: [PATCH v7 23/43] drm/vkms: Introduce config for plane color range
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
Message-Id: <20261126-vkms-all-config-v7-23-21194cda2468@bootlin.com>
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

VKMS driver supports all the color range on planes, but for testing it can
be useful to only advertise few of them. This new configuration interface
will allow configuring the color range per planes.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/tests/vkms_config_test.c | 44 +++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_config.c            | 39 ++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_config.h            | 35 +++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_plane.c             |  8 ++---
 4 files changed, 122 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
index 0254268da6a2..0f902e770e4b 100644
--- a/drivers/gpu/drm/vkms/tests/vkms_config_test.c
+++ b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0+
 
+#include <drm/drm_color_mgmt.h>
 #include <drm/drm_mode.h>
 #include <kunit/test.h>
 
@@ -569,6 +570,7 @@ static void vkms_config_test_valid_plane_color_encoding(struct kunit *test)
 	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
 
 	/* Valid, no supported or color encoding */
+	vkms_config_plane_set_supported_color_ranges(plane_cfg, 0);
 	vkms_config_plane_set_supported_color_encodings(plane_cfg, 0);
 	vkms_config_plane_set_default_color_encoding(plane_cfg, 0);
 	KUNIT_EXPECT_TRUE(test, vkms_config_valid_plane_color_encoding(config, plane_cfg));
@@ -583,6 +585,47 @@ static void vkms_config_test_valid_plane_color_encoding(struct kunit *test)
 	vkms_config_destroy(config);
 }
 
+static void vkms_config_test_valid_plane_color_range(struct kunit *test)
+{
+	struct vkms_config *config;
+	struct vkms_config_plane *plane_cfg;
+
+	config = vkms_config_default_create(false, false, false, false);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
+
+	plane_cfg = get_first_plane(config);
+
+	/* Valid, all color range supported */
+	vkms_config_plane_set_supported_color_ranges(plane_cfg,
+						     BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
+						     BIT(DRM_COLOR_YCBCR_FULL_RANGE));
+	vkms_config_plane_set_default_color_range(plane_cfg, DRM_COLOR_YCBCR_FULL_RANGE);
+	KUNIT_EXPECT_TRUE(test, vkms_config_valid_plane_color_range(config, plane_cfg));
+	KUNIT_EXPECT_TRUE(test, vkms_config_is_valid(config));
+
+	/* Invalid, default color range is not supported */
+	vkms_config_plane_set_supported_color_ranges(plane_cfg,
+						     BIT(DRM_COLOR_YCBCR_FULL_RANGE));
+	vkms_config_plane_set_default_color_range(plane_cfg, DRM_COLOR_YCBCR_LIMITED_RANGE);
+	KUNIT_EXPECT_FALSE(test, vkms_config_valid_plane_color_range(config, plane_cfg));
+	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
+
+	/* Valid, no supported or color range */
+	vkms_config_plane_set_supported_color_encodings(plane_cfg, 0);
+	vkms_config_plane_set_supported_color_ranges(plane_cfg, 0);
+	vkms_config_plane_set_default_color_range(plane_cfg, 0);
+	KUNIT_EXPECT_TRUE(test, vkms_config_valid_plane_color_range(config, plane_cfg));
+	KUNIT_EXPECT_TRUE(test, vkms_config_is_valid(config));
+
+	/* Valid, if no supported color range, default is ignored */
+	vkms_config_plane_set_supported_color_ranges(plane_cfg, 0);
+	vkms_config_plane_set_default_color_range(plane_cfg, DRM_COLOR_YCBCR_LIMITED_RANGE);
+	KUNIT_EXPECT_TRUE(test, vkms_config_valid_plane_color_range(config, plane_cfg));
+	KUNIT_EXPECT_TRUE(test, vkms_config_is_valid(config));
+
+	vkms_config_destroy(config);
+}
+
 static void vkms_config_test_valid_plane_possible_crtcs(struct kunit *test)
 {
 	struct vkms_config *config;
@@ -1107,6 +1150,7 @@ static struct kunit_case vkms_config_test_cases[] = {
 	KUNIT_CASE(vkms_config_test_valid_plane_type),
 	KUNIT_CASE(vkms_config_test_valid_plane_rotations),
 	KUNIT_CASE(vkms_config_test_valid_plane_color_encoding),
+	KUNIT_CASE(vkms_config_test_valid_plane_color_range),
 	KUNIT_CASE(vkms_config_test_valid_plane_possible_crtcs),
 	KUNIT_CASE(vkms_config_test_invalid_crtc_number),
 	KUNIT_CASE(vkms_config_test_invalid_encoder_number),
diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index 90cc28f3d386..6e4e2143c652 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -227,6 +227,25 @@ bool vkms_config_valid_plane_color_encoding(const struct vkms_config *config,
 }
 EXPORT_SYMBOL_IF_KUNIT(vkms_config_valid_plane_color_encoding);
 
+VISIBLE_IF_KUNIT
+bool vkms_config_valid_plane_color_range(const struct vkms_config *config,
+					 const struct vkms_config_plane *plane_cfg)
+{
+	struct drm_device *dev = config->dev ? &config->dev->drm : NULL;
+
+	if (vkms_config_plane_get_supported_color_ranges(plane_cfg)) {
+		if ((BIT(vkms_config_plane_get_default_color_range(plane_cfg)) &
+		     vkms_config_plane_get_supported_color_ranges(plane_cfg)) !=
+		    BIT(vkms_config_plane_get_default_color_range(plane_cfg))) {
+			drm_info(dev, "Configured default color range is not supported by the plane\n");
+			return false;
+		}
+	}
+
+	return true;
+}
+EXPORT_SYMBOL_IF_KUNIT(vkms_config_valid_plane_color_range);
+
 static bool valid_planes_for_crtc(const struct vkms_config *config,
 				  struct vkms_config_crtc *crtc_cfg)
 {
@@ -383,6 +402,7 @@ static bool valid_connector_possible_encoders(const struct vkms_config *config)
 
 bool vkms_config_is_valid(const struct vkms_config *config)
 {
+	struct drm_device *dev = config->dev ? &config->dev->drm : NULL;
 	struct vkms_config_crtc *crtc_cfg;
 	struct vkms_config_plane *plane_cfg;
 
@@ -392,6 +412,16 @@ bool vkms_config_is_valid(const struct vkms_config *config)
 
 		if (!vkms_config_valid_plane_color_encoding(config, plane_cfg))
 			return false;
+
+		if (!vkms_config_valid_plane_color_range(config, plane_cfg))
+			return false;
+
+		if ((vkms_config_plane_get_supported_color_encodings(plane_cfg) == 0) !=
+		    (vkms_config_plane_get_supported_color_ranges(plane_cfg) == 0)) {
+			drm_info(dev,
+				 "Both supported color encodings and color ranges must be set, or none\n");
+			return false;
+		}
 	}
 
 	if (!valid_plane_number(config))
@@ -480,6 +510,12 @@ static int vkms_config_show(struct seq_file *m, void *data)
 			seq_puts(m, "\n");
 			seq_printf(m, "\tdefault color encoding=%s\n",
 				   drm_get_color_encoding_name(vkms_config_plane_get_default_color_encoding(plane_cfg)));
+			seq_puts(m, "\tsupported color ranges=");
+			show_bitfield(m, vkms_config_plane_get_supported_color_ranges(plane_cfg),
+				      drm_get_color_range_name);
+			seq_puts(m, "\n");
+			seq_printf(m, "\tdefault color range=%s\n",
+				   drm_get_color_range_name(vkms_config_plane_get_default_color_range(plane_cfg)));
 		}
 
 		vkms_config_for_each_crtc(vkmsdev->config, crtc_cfg) {
@@ -537,6 +573,9 @@ struct vkms_config_plane __must_check *vkms_config_create_plane(struct vkms_conf
 							BIT(DRM_COLOR_YCBCR_BT709) |
 							BIT(DRM_COLOR_YCBCR_BT2020));
 	vkms_config_plane_set_default_color_encoding(plane_cfg, DRM_COLOR_YCBCR_BT601);
+	vkms_config_plane_set_supported_color_ranges(plane_cfg, BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
+								BIT(DRM_COLOR_YCBCR_FULL_RANGE));
+	vkms_config_plane_set_default_color_range(plane_cfg, DRM_COLOR_YCBCR_FULL_RANGE);
 
 	xa_init_flags(&plane_cfg->possible_crtcs, XA_FLAGS_ALLOC);
 
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index 11457213a551..20369e8d7c6e 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -62,6 +62,8 @@ struct vkms_config {
  *         must be managed by other means.
  * @default_color_encoding: Default color encoding that should be used by this plane
  * @supported_color_encodings: Color encodings that this plane will support
+ * @default_color_range: Default color range that should be used by this plane
+ * @supported_color_ranges: Color ranges that this plane will support
  */
 struct vkms_config_plane {
 	struct list_head link;
@@ -74,6 +76,8 @@ struct vkms_config_plane {
 	unsigned int supported_rotations;
 	enum drm_color_encoding default_color_encoding;
 	unsigned int supported_color_encodings;
+	enum drm_color_range default_color_range;
+	unsigned int supported_color_ranges;
 	struct xarray possible_crtcs;
 	bool default_pipeline;
 
@@ -493,6 +497,37 @@ bool vkms_config_valid_plane_color_encoding(const struct vkms_config *config,
 					    const struct vkms_config_plane *plane_cfg);
 #endif
 
+static inline enum drm_color_range
+vkms_config_plane_get_default_color_range(const struct vkms_config_plane *plane_cfg)
+{
+	return plane_cfg->default_color_range;
+}
+
+static inline void
+vkms_config_plane_set_default_color_range(struct vkms_config_plane *plane_cfg,
+					  enum drm_color_range default_color_range)
+{
+	plane_cfg->default_color_range = default_color_range;
+}
+
+static inline unsigned int
+vkms_config_plane_get_supported_color_ranges(const struct vkms_config_plane *plane_cfg)
+{
+	return plane_cfg->supported_color_ranges;
+}
+
+static inline void
+vkms_config_plane_set_supported_color_ranges(struct vkms_config_plane *plane_cfg,
+					     unsigned int supported_color_ranges)
+{
+	plane_cfg->supported_color_ranges = supported_color_ranges;
+}
+
+#if IS_ENABLED(CONFIG_KUNIT)
+bool vkms_config_valid_plane_color_range(const struct vkms_config *config,
+					 const struct vkms_config_plane *plane_cfg);
+#endif
+
 /**
  * vkms_config_plane_set_name() - Set the plane name
  * @plane_cfg: Plane to set the name to
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 92018e5b7a56..71be819fe159 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -281,13 +281,13 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
 					   vkms_config_plane_get_default_rotation(plane_cfg),
 					   vkms_config_plane_get_supported_rotations(plane_cfg));
 
-	if (vkms_config_plane_get_supported_color_encodings(plane_cfg) != 0)
+	if (vkms_config_plane_get_supported_color_encodings(plane_cfg) != 0 &&
+	    vkms_config_plane_get_supported_color_ranges(plane_cfg) != 0)
 		drm_plane_create_color_properties(&plane->base,
 						  vkms_config_plane_get_supported_color_encodings(plane_cfg),
-						  BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
-						  BIT(DRM_COLOR_YCBCR_FULL_RANGE),
+						  vkms_config_plane_get_supported_color_ranges(plane_cfg),
 						  vkms_config_plane_get_default_color_encoding(plane_cfg),
-						  DRM_COLOR_YCBCR_FULL_RANGE);
+						  vkms_config_plane_get_default_color_range(plane_cfg));
 
 	if (vkms_config_plane_get_default_pipeline(plane_cfg))
 		vkms_initialize_colorops(&plane->base);

-- 
2.56.0

