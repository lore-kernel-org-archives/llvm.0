Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C72331ECF
	for <llvm@lists.linux.dev>; Sat, 27 Jun 2026 03:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782531138; cv=none; b=oVg3v5uepU4ZFkI084SvHaLPwZ2LHztj0OrmI350uLa0n+zJ4x897XRBnrlnx9sUkoayWnKYn1SIy4ljNZ58igTUgMeKxuAeWF6G9xzIIn2luLRNYl2ldzpLJyPqICCUNZWPhTs45fO8zwyHDyB2XPRszSW/XD1QlAEQy5ycU3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782531138; c=relaxed/simple;
	bh=xesbCEX8y6GLslcmbN6Z9Yf2aYZOtJdUxJPnVvjTvPE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qcth/cSF2BD7H/ocOmzi2eBKLqtnRZcO8PHp5sCol8aZMuukpj8dOgq0Qie+Yk73Eh4+l51wtu61Q7KreLqA5+f8TXO5OTkMqTTc8Z2CBAh4yamzAtRWdU6xl4sodXkNvFEQiv5HSxePEzfjBZpMwpwKLh3fbVZx56vgqKXdLbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=NUowejrQ; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="NUowejrQ"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 99588C5CD7E;
	Sat, 27 Jun 2026 03:32:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8A08A60233;
	Sat, 27 Jun 2026 03:32:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 064E3106F1170;
	Sat, 27 Jun 2026 05:32:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782531134; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QZVcGvUufNYmeDV6o2kpMdHjPPf3F67u9Lux32iDHyA=;
	b=NUowejrQKlTm31V5ZVQsplnfCkVU8/RbWbZIjXO15DoHERRHayXKKW8btYHm7nHbsjMqx4
	TAwpyggTKOrBMmaNgqo4vsvHYaTeguCCHMhNr/YbmFBzBXJYNHNZ4PK6E4Qh8+WPbq+FIg
	M/VwUijCBehjnpfverI8bqjkJjJnNGsDDoJs4/6x8m8L3daURPZ/swdWG8P16VFcZY8B2G
	myqMyr6s5lW91LLdyyAml8O2RtxMDltNGlaR+IYQNbRMz4T1DoFEnoaQzwW/LuJNiZKMNI
	wWtsuwyWJbcqvYSi/APK7/gCQXTrGtif6ysHQl9mknQCwZd1m3SnNzdB1RQhjg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Sat, 27 Jun 2026 05:30:52 +0200
Subject: [PATCH v5 35/38] drm/vkms: Allow to hot-add connectors
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260627-vkms-all-config-v5-35-854aa0840926@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6175;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=xesbCEX8y6GLslcmbN6Z9Yf2aYZOtJdUxJPnVvjTvPE=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBqP0PhfL+Pnt/MD4loCw+Vxk9Tcsq9loKtboJ6K
 CPKYMdZy8GJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaj9D4RsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQIK0uxlsQLOI5bhAAkFS5OYnHyAFXe61Kcdy+SXctiEuNkGP
 P9dxf3BOipPHMAtMnxKtDxhaOM60RNBmpZHhRSze6jF6v+XFx1vARtH572kpaj3638tKw6I+dmd
 3eWy9QLjRzfJyLv8rkAjRTF+qpvDsdKbyXM+tT9NkYKFE5NV92SoERl9r9Xop3K7SZ5bUBiXrIL
 JaI4o3sKgrqyhJcG2OLtTki+js1Iq9VdlZYXy+yb29NS7mPsjBvNzzpSN/jn0bV9Tw+5FrKYScD
 2loHmIzL2T0hJ/3GjYPoGe10pH4ejyK8SPciSRQ+FOOLZNr90rTQgoBFNWTW1xfNcHBV5HZYqhS
 5JJ9P2dqZXgCZamkihqKan+G6NQy9KYriuLZYBW4B9roogAphtDIOy2BK8mkDV2vVVVaoO5EgzQ
 nj4tP0k2/BJ/8vXdcuOOk0dEKwHkZSuInni05kHR7J05Qq4Ehz5vkhrzbQ+v/TK/8KEGdlAgSLz
 YeGQNj7db2FNiCz5Hd8LcsXeKBtVtkjKu1je4/nVxwy3wGt5Y14d4ymGFrjmvD5DuiMx0inRT9K
 fD7Y6I268QTmRKZIGvdfIUZ+yK0j9RfzUUKF+el+vwHvwsPtwXR+leL6TeAAh4y9OlrtNULGB2V
 X2X1ettukcIDzMjfDRuG852ATOZrg5zsCCAO1Eu0XVPcVt0d25Ew=
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
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

