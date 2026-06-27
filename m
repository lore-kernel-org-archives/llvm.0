Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C12347FC0
	for <llvm@lists.linux.dev>; Sat, 27 Jun 2026 03:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782531106; cv=none; b=HmA3lGCDhTn4UghBVO6R+uuVMRl0g1C3qj/G1qt76bh549yvROuXqCST4O/TqarxI2/BSQCYaS8sERPvPmoBIy13l0rZ0Moe/wc6FVkSooeUazFFIg8NFvxAStF5SoxthFstPXuFHu4SKtmTAbEyVAj6TVEQasaTvlOfqZdFePI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782531106; c=relaxed/simple;
	bh=LKzzhjbixxXm0+lGyv+SESE0W4Ij2TVdWKWB3Vq5+VQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jHhkUtIiPpj+wtNCR+4krjO+Fu+tS/SpXAiollbpJDp2s5I6qMA9SCu3IYBBEzOmcOx9kirsfjhZSjLsLARe4z1qsqykHdw5SDb11lSt4kM9hweO8qSWcRRdFyQE9HKUluQ3pR5E40YGBqJR2O9Vj872LmvM80Jga16XV0tN8aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ScIxeFuO; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ScIxeFuO"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E3BF01A0A23;
	Sat, 27 Jun 2026 03:31:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AF55F60233;
	Sat, 27 Jun 2026 03:31:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E7A35106F1165;
	Sat, 27 Jun 2026 05:31:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782531102; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ejybZnAJF1y1GC4mxapDyQXQroQbtInYDQ/OXPSfOeU=;
	b=ScIxeFuOpue0Biit57RIz1EE17sllQDuKYgSiJa1U4f+O0MaI6cPYAgYLwLLqbLvBw8lu/
	jKTgXZQy4i8g92Pb9CX2lxXylVQuR2AcvQwIhR63XGQnPR5nRh4BS0m57ZT+oLtjLFSXsi
	8ZD/eJL5g5X5aimfv5ETCo8N8OwikX1UEp8uJHFOXqqgbGCX9ejJIMk/rRiU+f52M+mUY/
	MhfNOfeEmYlEHp1/FhcR1Avj523IzRoqxYM+lvWo6FBflZt4ubj49el8kDihebMDsfjvdT
	Ix8EIeBOd4zIA3OYulk26cDeEoaTDHfH6Q4HxSXasl6eyOQjuCJh5D7oTrzdJg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Sat, 27 Jun 2026 05:30:39 +0200
Subject: [PATCH v5 22/38] drm/vkms: Introduce config for plane format
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260627-vkms-all-config-v5-22-854aa0840926@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=10560;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=LKzzhjbixxXm0+lGyv+SESE0W4Ij2TVdWKWB3Vq5+VQ=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBqP0Pf0g+nIGAJFBUTYw80d4Uu8d79b2l6IJ+6t
 WiTV8c/rLWJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaj9D3xsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQIK0uxlsQLOKzBhAAtkbPuaz672WEmLVln3u9siQZGWg9OIz
 JhP0lTxAdnjcLPDiatgF97DjVCKUryFbEA10gFdN4xqYEF38ULS3gzYkBeEQWfIM8pv6JhE++gV
 EDDBojR81Wesz803yHQqZeZpEtzX8SWBIesMFpdkD3jiQjeMkg5w6B09dq6q626Kq/YRVfzuqXe
 xheK7KpZU9NDvY7gnvEmN+5sxVQ/mdZGlMI0DJuus0JdNnLZPW1tdwvLo1etnQk5EG+vuMGJ3sh
 X/86dZ94XFxhnfkR3pkwC2Dnoqyipsg5cYSRN15pBu4XdWrmTqENZu4/Hv5EbCtp+5gytYy+1Go
 u3VYIAWLK8LKTCJ/3VLSXgnREyX9vfBjsKTG3FWISD+6XGF3ak+rrV4upQNlnnGUFGRxyyH81iH
 oKsXzRX0kCju/iH9o1e43yOTRI+7Fb4129zAi2MLujBiaDDnp6pH+m+1uC7xfybNv9WglKenif3
 vyq4OD+XC+X/AclpHUDeVmIikuuWepu2O7v5ZVHjoIWvXPmtapGcqQY2Ee7QkgWkKvs14Jt2OLq
 G2ZC7gYc27HybnJW0bLkMaCyeXITKluBp6s9erP28DXJqCeni9NzRuy/sBhTH3buYGJT5ckYKL5
 rQIYGNzgI6xywemqhSZE2Y/jbRwFQoJg8sKBmtHJk3bsfac1frgA=
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-Last-TLS-Session-Version: TLSv1.3

VKMS driver supports all the pixel formats for planes, but for testing it
can be useful to only advertise few of them. This new configuration
interface will allow configuring the pixel format per planes.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_config.c | 128 +++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_config.h |  51 +++++++++++++++
 drivers/gpu/drm/vkms/vkms_plane.c  |  39 +----------
 3 files changed, 181 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index 553871646761..c7de3e307367 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -12,6 +12,42 @@
 
 #include "vkms_config.h"
 
+static const u32 vkms_supported_plane_formats[] = {
+	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_ABGR8888,
+	DRM_FORMAT_BGRA8888,
+	DRM_FORMAT_RGBA8888,
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_RGB888,
+	DRM_FORMAT_BGR888,
+	DRM_FORMAT_XRGB16161616,
+	DRM_FORMAT_XBGR16161616,
+	DRM_FORMAT_ARGB16161616,
+	DRM_FORMAT_ABGR16161616,
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_BGR565,
+	DRM_FORMAT_NV12,
+	DRM_FORMAT_NV16,
+	DRM_FORMAT_NV24,
+	DRM_FORMAT_NV21,
+	DRM_FORMAT_NV61,
+	DRM_FORMAT_NV42,
+	DRM_FORMAT_YUV420,
+	DRM_FORMAT_YUV422,
+	DRM_FORMAT_YUV444,
+	DRM_FORMAT_YVU420,
+	DRM_FORMAT_YVU422,
+	DRM_FORMAT_YVU444,
+	DRM_FORMAT_P010,
+	DRM_FORMAT_P012,
+	DRM_FORMAT_P016,
+	DRM_FORMAT_R1,
+	DRM_FORMAT_R2,
+	DRM_FORMAT_R4,
+	DRM_FORMAT_R8,
+};
+
 struct vkms_config *vkms_config_create(const char *dev_name)
 {
 	struct vkms_config *config;
@@ -441,6 +477,15 @@ static void show_bitfield(struct seq_file *m, uint32_t value, const char *callba
 	}
 }
 
+static void show_formats(struct seq_file *m, u32 *formats, size_t formats_count)
+{
+	for (int i = 0; i < formats_count; i++) {
+		seq_printf(m, "%p4cc", &formats[i]);
+		if (i != formats_count - 1)
+			seq_puts(m, ", ");
+	}
+}
+
 static int vkms_config_show(struct seq_file *m, void *data)
 {
 	struct drm_debugfs_entry *entry = m->private;
@@ -478,6 +523,10 @@ static int vkms_config_show(struct seq_file *m, void *data)
 		seq_puts(m, "\n");
 		seq_printf(m, "\tdefault color range=%s\n",
 			   drm_get_color_range_name(vkms_config_plane_get_default_color_range(plane_cfg)));
+		seq_puts(m, "\tsupported formats=");
+		show_formats(m, vkms_config_plane_get_supported_formats(plane_cfg),
+			     vkms_config_plane_get_supported_formats_count(plane_cfg));
+		seq_puts(m, "\n");
 	}
 
 	vkms_config_for_each_crtc(vkmsdev->config, crtc_cfg) {
@@ -527,6 +576,10 @@ struct vkms_config_plane __must_check *vkms_config_create_plane(struct vkms_conf
 	if (ret)
 		goto cleanup_plane_cfg;
 
+	ret = vkms_config_plane_add_all_formats(plane_cfg);
+	if (ret)
+		goto cleanup_plane_cfg;
+
 	vkms_config_plane_set_supported_rotations(plane_cfg,
 						  DRM_MODE_ROTATE_MASK | DRM_MODE_REFLECT_MASK);
 	vkms_config_plane_set_default_rotation(plane_cfg, DRM_MODE_ROTATE_0);
@@ -554,6 +607,7 @@ EXPORT_SYMBOL_IF_KUNIT(vkms_config_create_plane);
 void vkms_config_destroy_plane(struct vkms_config_plane *plane_cfg)
 {
 	xa_destroy(&plane_cfg->possible_crtcs);
+	kfree(plane_cfg->supported_formats);
 	list_del(&plane_cfg->link);
 	kfree(plane_cfg->name);
 	kfree(plane_cfg);
@@ -658,6 +712,80 @@ static struct vkms_config_plane *vkms_config_crtc_get_plane(const struct vkms_co
 	return NULL;
 }
 
+int __must_check vkms_config_plane_add_all_formats(struct vkms_config_plane *plane_cfg)
+{
+	u32 *ret = krealloc_array(plane_cfg->supported_formats,
+				  ARRAY_SIZE(vkms_supported_plane_formats),
+				  sizeof(uint32_t), GFP_KERNEL);
+	if (!ret)
+		return -ENOMEM;
+	plane_cfg->supported_formats = ret;
+
+	memcpy(plane_cfg->supported_formats, vkms_supported_plane_formats,
+	       sizeof(vkms_supported_plane_formats));
+	plane_cfg->supported_formats_count = ARRAY_SIZE(vkms_supported_plane_formats);
+	return 0;
+}
+
+static bool is_supported_format(u32 drm_format)
+{
+	for (int i = 0; i < ARRAY_SIZE(vkms_supported_plane_formats); i++) {
+		if (vkms_supported_plane_formats[i] == drm_format)
+			return true;
+	}
+
+	return false;
+}
+
+static bool vkms_config_plane_has_format(struct vkms_config_plane *plane_cfg, u32 drm_format)
+{
+	for (unsigned int i = 0; i < plane_cfg->supported_formats_count; i++) {
+		if (plane_cfg->supported_formats[i] == drm_format)
+			return true;
+	}
+	return false;
+}
+
+int __must_check vkms_config_plane_add_format(struct vkms_config_plane *plane_cfg, u32 drm_format)
+{
+	if (!is_supported_format(drm_format))
+		return -EINVAL;
+
+	if (vkms_config_plane_has_format(plane_cfg, drm_format))
+		return 0;
+
+	u32 *new_ptr = krealloc_array(plane_cfg->supported_formats,
+				      plane_cfg->supported_formats_count + 1,
+				      sizeof(*plane_cfg->supported_formats), GFP_KERNEL);
+	if (!new_ptr)
+		return -ENOMEM;
+
+	plane_cfg->supported_formats = new_ptr;
+	plane_cfg->supported_formats[plane_cfg->supported_formats_count] = drm_format;
+	plane_cfg->supported_formats_count++;
+
+	return 0;
+}
+
+void vkms_config_plane_remove_all_formats(struct vkms_config_plane *plane_cfg)
+{
+	plane_cfg->supported_formats_count = 0;
+	kfree(plane_cfg->supported_formats);
+	plane_cfg->supported_formats = NULL;
+}
+
+void vkms_config_plane_remove_format(struct vkms_config_plane *plane_cfg, u32 drm_format)
+{
+	for (unsigned int i = 0; i < plane_cfg->supported_formats_count; i++) {
+		if (plane_cfg->supported_formats[i] == drm_format) {
+			plane_cfg->supported_formats[i] =
+				plane_cfg->supported_formats[plane_cfg->supported_formats_count -
+					1];
+			plane_cfg->supported_formats_count--;
+		}
+	}
+}
+
 struct vkms_config_plane *vkms_config_crtc_primary_plane(const struct vkms_config *config,
 							 struct vkms_config_crtc *crtc_cfg)
 {
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index 60cadb7bea5b..3de4a92af9c5 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -50,6 +50,8 @@ struct vkms_config {
  * @supported_color_encodings: Color encodings that this plane will support
  * @default_color_range: Default color range that should be used by this plane
  * @supported_color_ranges: Color ranges that this plane will support
+ * @supported_formats: List of supported formats
+ * @supported_formats_count: Length of @supported_formats
  */
 struct vkms_config_plane {
 	struct list_head link;
@@ -63,6 +65,8 @@ struct vkms_config_plane {
 	unsigned int supported_color_encodings;
 	enum drm_color_range default_color_range;
 	unsigned int supported_color_ranges;
+	u32 *supported_formats;
+	unsigned int supported_formats_count;
 	struct xarray possible_crtcs;
 	bool default_pipeline;
 
@@ -475,6 +479,53 @@ bool vkms_config_valid_plane_color_range(const struct vkms_config *config,
 					 const struct vkms_config_plane *plane_cfg);
 #endif
 
+static inline u32 *
+vkms_config_plane_get_supported_formats(const struct vkms_config_plane *plane_cfg)
+{
+	return plane_cfg->supported_formats;
+}
+
+static inline unsigned int
+vkms_config_plane_get_supported_formats_count(struct vkms_config_plane *plane_cfg)
+{
+	return plane_cfg->supported_formats_count;
+}
+
+/** vkms_config_plane_add_format - Add a format to the list of supported format of a plane
+ *
+ * The passed drm_format can already be present in the list. This may fail if the allocation of a
+ * bigger array fails.
+ *
+ * @plane_cfg: Plane to add the format to
+ * @drm_format: Format to add to this plane
+ *
+ * Returns: 0 on success, -ENOMEM if array allocation fails, -EINVAL if the format is not supported
+ * by VKMS
+ */
+int __must_check vkms_config_plane_add_format(struct vkms_config_plane *plane_cfg, u32 drm_format);
+
+/**
+ * vkms_config_plane_add_all_formats - Helper to quickly add all the supported formats
+ * @plane_cfg: Plane to add the formats to
+ *
+ * Returns: 0 on success, -ENOMEM if array allocation fails
+ * by VKMS
+ */
+int __must_check vkms_config_plane_add_all_formats(struct vkms_config_plane *plane_cfg);
+
+/**
+ * vkms_config_plane_remove_format - Remove a specific format from a plane
+ * @plane_cfg: Plane to remove the format from
+ * @drm_format: Format to remove
+ */
+void vkms_config_plane_remove_format(struct vkms_config_plane *plane_cfg, u32 drm_format);
+
+/**
+ * vkms_config_plane_remove_all_formats - Remove all formats from a plane
+ * @plane_cfg: Plane to remove the formats from
+ */
+void vkms_config_plane_remove_all_formats(struct vkms_config_plane *plane_cfg);
+
 /**
  * vkms_config_plane_set_name() - Set the plane name
  * @plane_cfg: Plane to set the name to
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index d4ccf418198e..6e767cdf8194 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -15,42 +15,6 @@
 #include "vkms_drv.h"
 #include "vkms_formats.h"
 
-static const u32 vkms_formats[] = {
-	DRM_FORMAT_ARGB8888,
-	DRM_FORMAT_ABGR8888,
-	DRM_FORMAT_BGRA8888,
-	DRM_FORMAT_RGBA8888,
-	DRM_FORMAT_XRGB8888,
-	DRM_FORMAT_XBGR8888,
-	DRM_FORMAT_RGB888,
-	DRM_FORMAT_BGR888,
-	DRM_FORMAT_XRGB16161616,
-	DRM_FORMAT_XBGR16161616,
-	DRM_FORMAT_ARGB16161616,
-	DRM_FORMAT_ABGR16161616,
-	DRM_FORMAT_RGB565,
-	DRM_FORMAT_BGR565,
-	DRM_FORMAT_NV12,
-	DRM_FORMAT_NV16,
-	DRM_FORMAT_NV24,
-	DRM_FORMAT_NV21,
-	DRM_FORMAT_NV61,
-	DRM_FORMAT_NV42,
-	DRM_FORMAT_YUV420,
-	DRM_FORMAT_YUV422,
-	DRM_FORMAT_YUV444,
-	DRM_FORMAT_YVU420,
-	DRM_FORMAT_YVU422,
-	DRM_FORMAT_YVU444,
-	DRM_FORMAT_P010,
-	DRM_FORMAT_P012,
-	DRM_FORMAT_P016,
-	DRM_FORMAT_R1,
-	DRM_FORMAT_R2,
-	DRM_FORMAT_R4,
-	DRM_FORMAT_R8,
-};
-
 static struct drm_plane_state *
 vkms_plane_duplicate_state(struct drm_plane *plane)
 {
@@ -227,7 +191,8 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
 
 	plane = drmm_universal_plane_alloc(dev, struct vkms_plane, base, 0,
 					   &vkms_plane_funcs,
-					   vkms_formats, ARRAY_SIZE(vkms_formats),
+					   vkms_config_plane_get_supported_formats(plane_cfg),
+					   vkms_config_plane_get_supported_formats_count(plane_cfg),
 					   NULL, vkms_config_plane_get_type(plane_cfg),
 					   vkms_config_plane_get_name(plane_cfg));
 	if (IS_ERR(plane))

-- 
2.54.0

