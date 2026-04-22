Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593EA3CF690
	for <llvm@lists.linux.dev>; Wed, 22 Apr 2026 16:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776876628; cv=none; b=eZDWJf6J8tytFzsjugjfvcFFaln+CYYBZ28QxPBt18GqVqbMFApZnP/c9lRCp7N4TUszSjgXKr8aKLdmVwmfgCd4U+Md/7dSbg6xW8eZM6cgSZ7tFHtQj3xSZh+dsruCPcqzv+5f8iEx18AVIZ7oZbYFO3tAqXbSU0dEdJfrEwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776876628; c=relaxed/simple;
	bh=xesbCEX8y6GLslcmbN6Z9Yf2aYZOtJdUxJPnVvjTvPE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=udt49WuKgaF9ivlBibcuW5NdGApRdmtqHFZf63Q9WEQ2nLNjCmWUDg/VeA0STohH2Xp/gkLJz0+5XQLzK+V4W+zPKf8eCTQRhcJS5tGzhs3GO7cnxQS4FOu6NirS/uRJuHz+CuWl8fVHvrWGrmIEpB0dOC/qzZAKanDk4INgCSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ZLsL26ss; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ZLsL26ss"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id DEE65C5EF07;
	Wed, 22 Apr 2026 16:51:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 091755FA8F;
	Wed, 22 Apr 2026 16:50:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7EF4C10460BF3;
	Wed, 22 Apr 2026 18:50:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776876623; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QZVcGvUufNYmeDV6o2kpMdHjPPf3F67u9Lux32iDHyA=;
	b=ZLsL26sshsnOSkzrEQaCRuNQi4oEXZZu1qu8j9aCsAViKSobQjKHXiqdRiQ4epHc/FW+Yh
	YX+bfJ39WKytWwr7jw5vO07caZU9c8XVjR8kNVxOjAtQrb2kkVCTShrT6rrJRj+oQaEL4T
	atfRc7iWL/mXJBhYUVHfUItFsY85u4lR+acxBK79DTZw1hivgzxZOtP6I9t7jwHW1FnVQb
	+kFUi/c8/w9qhlIry4gERk5Kbv1aj/Q/qSbwx0YsCtYiRf3FTepuJZMH8yunBV8a1Ky7bD
	FCVO/pFQyoy7NVpULxt7esgKUmmkg7mk8KP5aBxB0089bTHb/6re9sP++J5nEA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 22 Apr 2026 18:48:31 +0200
Subject: [PATCH v4 34/37] drm/vkms: Allow to hot-add connectors
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260422-vkms-all-config-v4-34-dbb52e9aadc3@bootlin.com>
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
 llvm@lists.linux.dev
X-Mailer: b4 0.16-dev
X-Last-TLS-Session-Version: TLSv1.3

In order to allow creating dynamic connector, add the required
infrastructure in vkms_connector.

[Louis Chauvet: use drm_atomic_helper_connector_reset instead of
drm_mode_config_reset because connector is not yet registered]

Co-developed-by: José Expósito <jose.exposito89@gmail.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_connector.c | 89 +++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_connector.h | 33 +++++++++++++
 drivers/gpu/drm/vkms/vkms_output.c    |  9 ++++
 3 files changed, 131 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_connector.c b/drivers/gpu/drm/vkms/vkms_connector.c
index f726c7995524..a013b53bd915 100644
--- a/drivers/gpu/drm/vkms/vkms_connector.c
+++ b/drivers/gpu/drm/vkms/vkms_connector.c
@@ -181,9 +181,98 @@ struct vkms_connector *vkms_connector_init_static(struct vkms_device *vkmsdev,
 	return connector;
 }
 
+static void vkms_connector_dynamic_destroy(struct drm_connector *connector)
+{
+	struct vkms_connector *vkms_connector;
+
+	drm_connector_cleanup(connector);
+
+	vkms_connector = drm_connector_to_vkms_connector(connector);
+	kfree(vkms_connector);
+}
+
+static const struct drm_connector_funcs vkms_dynamic_connector_funcs = {
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.reset = drm_atomic_helper_connector_reset,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+	.destroy = vkms_connector_dynamic_destroy,
+	.detect = vkms_connector_detect,
+};
+
 void vkms_trigger_connector_hotplug(struct vkms_device *vkmsdev)
 {
 	struct drm_device *dev = &vkmsdev->drm;
 
 	drm_kms_helper_hotplug_event(dev);
 }
+
+struct vkms_connector *vkms_connector_hot_add(struct vkms_device *vkmsdev,
+					      struct vkms_config_connector *connector_cfg)
+{
+	struct vkms_config_encoder *encoder_cfg;
+	struct vkms_connector __free(kfree) * connector = NULL;
+	int ret;
+	unsigned long idx = 0;
+
+	connector = kzalloc_obj(*connector, GFP_KERNEL);
+	if (IS_ERR(connector))
+		return connector;
+	ret = drm_connector_dynamic_init(&vkmsdev->drm,
+					 &connector->base,
+					 &vkms_dynamic_connector_funcs,
+					 connector_cfg->type,
+					 NULL);
+	if (ret)
+		return ERR_PTR(ret);
+	drm_connector_helper_add(&connector->base, &vkms_conn_helper_funcs);
+
+	vkms_config_connector_for_each_possible_encoder(connector_cfg, idx, encoder_cfg) {
+		ret = drm_connector_attach_encoder(&connector->base,
+						   encoder_cfg->encoder);
+		if (ret)
+			return ERR_PTR(ret);
+	}
+
+	drm_atomic_helper_connector_reset(&connector->base);
+
+	ret = vkms_connector_init(connector, connector_cfg);
+	if (ret)
+		return ERR_PTR(ret);
+
+	ret = drm_connector_dynamic_register(&connector->base);
+	if (ret) {
+		if (connector_cfg->type == DRM_MODE_CONNECTOR_HDMIA ||
+		    connector_cfg->type == DRM_MODE_CONNECTOR_DisplayPort ||
+		    connector_cfg->type == DRM_MODE_CONNECTOR_eDP) {
+			drm_property_destroy(connector->base.dev,
+					     connector->base.colorspace_property);
+		}
+		return ERR_PTR(ret);
+	}
+
+	return_ptr(connector);
+}
+
+void vkms_connector_hot_remove(struct vkms_device *vkmsdev,
+			       struct vkms_connector *connector)
+{
+	drm_connector_unregister(&connector->base);
+	drm_mode_config_reset(&vkmsdev->drm);
+	drm_connector_put(&connector->base);
+}
+
+int vkms_connector_hot_attach_encoder(struct vkms_device *vkmsdev,
+				      struct vkms_connector *connector,
+				      struct drm_encoder *encoder)
+{
+	int ret;
+
+	ret = drm_connector_attach_encoder(&connector->base, encoder);
+	if (ret)
+		return ret;
+
+	drm_mode_config_reset(&vkmsdev->drm);
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/vkms/vkms_connector.h b/drivers/gpu/drm/vkms/vkms_connector.h
index 85f9082c710e..a235a518d5a0 100644
--- a/drivers/gpu/drm/vkms/vkms_connector.h
+++ b/drivers/gpu/drm/vkms/vkms_connector.h
@@ -34,4 +34,37 @@ struct vkms_connector *vkms_connector_init_static(struct vkms_device *vkmsdev,
  */
 void vkms_trigger_connector_hotplug(struct vkms_device *vkmsdev);
 
+/**
+ * vkms_connector_hot_add() - Create a connector after the device is created
+ * @vkmsdev: Device to hot-add the connector to
+ * @connector_cfg: Connector's configuration
+ *
+ * Returns:
+ * A pointer to the newly created connector or a PTR_ERR on failure.
+ */
+struct vkms_connector *vkms_connector_hot_add(struct vkms_device *vkmsdev,
+					      struct vkms_config_connector *connector_cfg);
+
+/**
+ * vkms_connector_hot_remove() - Remove a connector after a device is created
+ * @vkmsdev: Device to containing the connector to be removed
+ * @connector: The connector to hot-remove
+ */
+void vkms_connector_hot_remove(struct vkms_device *vkmsdev,
+			       struct vkms_connector *connector);
+
+/**
+ * vkms_connector_hot_attach_encoder() - Attach a connector to a encoder after
+ * the device is created.
+ * @vkmsdev: Device containing the connector and the encoder
+ * @connector: Connector to attach to @encoder
+ * @encoder: Target encoder
+ *
+ * Returns:
+ * 0 on success or an error on failure.
+ */
+int vkms_connector_hot_attach_encoder(struct vkms_device *vkmsdev,
+				      struct vkms_connector *connector,
+				      struct drm_encoder *encoder);
+
 #endif /* _VKMS_CONNECTOR_H_ */
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 13c4ca5fd39d..50f7d88dee8b 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -117,5 +117,14 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 
 	drm_mode_config_reset(dev);
 
+	vkms_config_for_each_connector_dynamic(vkmsdev->config, connector_cfg) {
+		if (connector_cfg->enabled) {
+			connector_cfg->connector = vkms_connector_hot_add(vkmsdev, connector_cfg);
+
+			if (IS_ERR(connector_cfg->connector))
+				return PTR_ERR(connector_cfg->connector);
+		}
+	}
+
 	return 0;
 }

-- 
2.54.0

