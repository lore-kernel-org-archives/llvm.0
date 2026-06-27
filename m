Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0415735CBD7
	for <llvm@lists.linux.dev>; Sat, 27 Jun 2026 03:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782531126; cv=none; b=rajEeuAM/iyQeDBdpQ9G/sLkMQldzH6X1b9O+Lk1K0Y1DwG5+m5ScPn8IpQVmKC+LUPnYy7EPEb8WUENyfuNP1oc2E6UjJ1o3ji6kasViqZfQEtkeg1Hbmj2B4OanKVouzj45WXBRTwVrCTn4HVYzCDtlzEU47SXXhzeg6aocEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782531126; c=relaxed/simple;
	bh=VlIri5VAZM1z7SiIburHJX2oSPFigorqkLnap0yrI/o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j/5G87HDwkOt0UNojQq5JcJGIGzcobGI/+8EOtIu1qN6j8bPJiBJ6ZTxJ+sT3fp0xnMoYRRo4wNa3u0xb99QAFa2zn13gFALZttn/7AnmcGwfbRKUHi2HHtLRrJOJalcRlDARnUu8GCD8GlvbnbbLX5OkMe6ymuErJv9d9pH+Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=X2Bembeg; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="X2Bembeg"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D65BF4E40A08;
	Sat, 27 Jun 2026 03:32:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AB3F960233;
	Sat, 27 Jun 2026 03:32:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 049B2106F1165;
	Sat, 27 Jun 2026 05:31:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782531122; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=HVB6guxOx3qblOEOSQvXPSbLJKx1Rt8x4nla5zOvu1Y=;
	b=X2BembegfZDJy4Mo9DE4PKY7IaROdWZsxYIvIjZiW4HOu77BS3Enjx9U4dBmC5itgWVGGS
	sa8UNF7kXUA50pTdRe4ypx10OsB9pkIMT/ETvoV6T/W+L9vKaJHhDHCcyum4zSmkWWY2YK
	zfsM6+UqWBL3PTtdx8VS+p/EZSvgTAO9obqzqZjjweFifo8DmPXES0owUTXwz11+4iiuqF
	tXOrJftqNGQ6RkrqMQ3lN5+Wjs1Pkt+0cs13TZF5PxYng3D0aoVKpyq0HU9nH47lHFx7UW
	e4IHU2q5PBo7YJAsAe6ptREDpBo3Ka3zzu/SbT8+KnxzKPPG5uHQLAPpb7pk2Q==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Sat, 27 Jun 2026 05:30:47 +0200
Subject: [PATCH v5 30/38] drm/vkms: Introduce config for connector
 supported colorspace
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260627-vkms-all-config-v5-30-854aa0840926@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7160;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=VlIri5VAZM1z7SiIburHJX2oSPFigorqkLnap0yrI/o=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBqP0PhiSpkKmif86QlFmSA7/3Wu4WpqgqpRw7yu
 YiO1YRWKEOJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaj9D4RsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQIK0uxlsQLOJ6lhAAwdpl/VUeww8NO9Stt9aYvrqU6tHbzic
 PcAtBctwBFW1+4pyEOdA1GLMceWsFLNF6JcQADSB9RGKUnZ6Ev9IEF4BovvcAKFQgXRkEgfSB6O
 JGOJBs8fi8jyJm6n0ZyQTrJDCcr+9cFISnknbq+AMbOQGmTzGH2d0oOftWZA2dqDcR6hoNo1DXM
 XcjMy6aLFuzto0oNozqOYUyS9HmDx36/0sYQz+iVFI21LpfsP3HjmfAsyVKUIglcAKJHB4AUqtq
 qME/Ah8t0Qk0lAyXC/sOTCxaith1JI4TV+i0iAoHBXLOicE+eZPLujPx2u61vM3Nrf1VkoO9Uh4
 N975Br6qXZHAPHAFvQwG0DzNxvmJiFNLrcU7oAly+VmdzKNrQ9vBmxk7tSleGv7F/HpZNesEnT8
 xkOK6BGr9twej535zNKt42Knz+iUvVnSzqCoi2IHrMvnNkyt9s9SjwzEbUnQ7lC/1nP+vcDpO0M
 Xei/lbgTYj5oxEmfxbQyASB3iyNTTPsNM36R22kwfVf2rdsXzPpoGD0R8hAm3CTg9GnTNu0O7Z/
 KufDoi8zLGKhaLoSwkjau0mSwF6reTj9SKDcF+fQyhMqT9886TKODwr7BxqDSAl/QHVK9qxP4JS
 mjLJRw3HARnG5SoHNF1Ybq9ckWfenCsBRWTvh0xQVHS414vZVjhQ=
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-Last-TLS-Session-Version: TLSv1.3

To emulate some HDR features of displays, it is required to expose some
properties on HDMI, eDP and DP connectors.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/tests/vkms_config_test.c |  3 ++
 drivers/gpu/drm/vkms/vkms_config.c            |  5 +++
 drivers/gpu/drm/vkms/vkms_config.h            | 30 +++++++++++++++++
 drivers/gpu/drm/vkms/vkms_connector.c         | 47 +++++++++++++++++++++++++++
 4 files changed, 85 insertions(+)

diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
index 1900cc79db2b..a31fd230c1d4 100644
--- a/drivers/gpu/drm/vkms/tests/vkms_config_test.c
+++ b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
@@ -215,6 +215,9 @@ static void vkms_config_test_default_config(struct kunit *test)
 	vkms_config_for_each_connector(config, connector_cfg) {
 		KUNIT_EXPECT_EQ(test, vkms_config_connector_get_type(connector_cfg),
 				DRM_MODE_CONNECTOR_VIRTUAL);
+		KUNIT_EXPECT_EQ(test,
+				vkms_config_connector_get_supported_colorspaces(connector_cfg),
+				0);
 	}
 
 	KUNIT_EXPECT_TRUE(test, vkms_config_is_valid(config));
diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index c407aea0bc6a..ea9bc5d06be6 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -600,6 +600,10 @@ static int vkms_config_show(struct seq_file *m, void *data)
 			   drm_get_connector_status_name(vkms_config_connector_get_status(connector_cfg)));
 		seq_printf(m, "\ttype=%s\n",
 			   drm_get_connector_type_name(vkms_config_connector_get_type(connector_cfg)));
+		seq_puts(m, "\tsupported colorspaces=");
+		show_bitfield(m, vkms_config_connector_get_supported_colorspaces(connector_cfg),
+			      drm_get_colorspace_name);
+		seq_puts(m, "\n");
 	}
 
 	return 0;
@@ -933,6 +937,7 @@ struct vkms_config_connector *vkms_config_create_connector(struct vkms_config *c
 	connector_cfg->config = config;
 	connector_cfg->status = connector_status_connected;
 	vkms_config_connector_set_type(connector_cfg, DRM_MODE_CONNECTOR_VIRTUAL);
+	vkms_config_connector_set_supported_colorspaces(connector_cfg, 0);
 	xa_init_flags(&connector_cfg->possible_encoders, XA_FLAGS_ALLOC);
 
 	list_add_tail(&connector_cfg->link, &config->connectors);
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index d6d185b2ccc0..80bbc13aad79 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -133,6 +133,10 @@ struct vkms_config_encoder {
  * @type: Store the type of connector using DRM_MODE_CONNECTOR_* values
  * @config: The vkms_config this connector belongs to
  * @status: Status (connected, disconnected...) of the connector
+ * @supported_colorspaces: Bitmask of all the supported colorspaces. Values
+ *                         are the sames as ones accepted by
+ *                         drm_mode_create_hdmi_colorspace_property() and
+ *                         drm_mode_create_dp_colorspace_property()
  * @possible_encoders: Array of encoders that can be used with this connector
  * @connector: Internal usage. This pointer should never be considered as valid.
  *             It can be used to store a temporary reference to a VKMS connector
@@ -145,6 +149,7 @@ struct vkms_config_connector {
 
 	int type;
 	enum drm_connector_status status;
+	u32 supported_colorspaces;
 	struct xarray possible_encoders;
 
 	/* Internal usage */
@@ -244,6 +249,31 @@ struct vkms_config *vkms_config_default_create(bool enable_cursor,
  */
 void vkms_config_destroy(struct vkms_config *config);
 
+/**
+ * vkms_config_connector_set_supported_colorspaces() - Set the supported colorspaces for a connector
+ * @connector_cfg: Connector configuration to modify
+ * @supported_colorspaces: Bitmask of supported colorspaces (DRM_MODE_COLORIMETRY_*)
+ */
+static inline void
+vkms_config_connector_set_supported_colorspaces(struct vkms_config_connector *connector_cfg,
+						u32 supported_colorspaces)
+{
+	connector_cfg->supported_colorspaces = supported_colorspaces;
+}
+
+/**
+ * vkms_config_connector_get_supported_colorspaces() - Get the supported colorspaces for a connector
+ * @connector_cfg: Connector configuration to query
+ *
+ * Returns:
+ * Bitmask of supported colorspaces (DRM_MODE_COLORIMETRY_*)
+ */
+static inline u32
+vkms_config_connector_get_supported_colorspaces(const struct vkms_config_connector *connector_cfg)
+{
+	return connector_cfg->supported_colorspaces;
+}
+
 /**
  * vkms_config_get_device_name() - Return the name of the device
  * @config: Configuration to get the device name from
diff --git a/drivers/gpu/drm/vkms/vkms_connector.c b/drivers/gpu/drm/vkms/vkms_connector.c
index 5b29dcade7e1..a1f08167def1 100644
--- a/drivers/gpu/drm/vkms/vkms_connector.c
+++ b/drivers/gpu/drm/vkms/vkms_connector.c
@@ -68,6 +68,49 @@ static const struct drm_connector_helper_funcs vkms_conn_helper_funcs = {
 	.best_encoder = vkms_conn_best_encoder,
 };
 
+
+/**
+ * vkms_connector_init - Common initialization for all vkms connectors
+ *
+ * @connector - Already allocated connector
+ * @connector_cfg - Configuration to apply
+ *
+ * Returns: 0 on success, errno on error;
+ */
+static int __must_check vkms_connector_init(struct vkms_connector *connector,
+					    struct vkms_config_connector *connector_cfg)
+{
+	int ret = 0;
+
+	if (vkms_config_connector_get_supported_colorspaces(connector_cfg)) {
+		if (connector_cfg->type == DRM_MODE_CONNECTOR_HDMIA) {
+			ret = drm_mode_create_hdmi_colorspace_property(&connector->base,
+								       vkms_config_connector_get_supported_colorspaces(connector_cfg));
+			if (ret)
+				return ret;
+		} else if (connector_cfg->type == DRM_MODE_CONNECTOR_DisplayPort ||
+			   connector_cfg->type == DRM_MODE_CONNECTOR_eDP) {
+			ret = drm_mode_create_dp_colorspace_property(&connector->base,
+								     vkms_config_connector_get_supported_colorspaces(connector_cfg));
+			if (ret)
+				return ret;
+		}
+
+		if (connector_cfg->type == DRM_MODE_CONNECTOR_HDMIA ||
+		    connector_cfg->type == DRM_MODE_CONNECTOR_DisplayPort ||
+		    connector_cfg->type == DRM_MODE_CONNECTOR_eDP) {
+			ret = drm_connector_attach_colorspace_property(&connector->base);
+			if (ret) {
+				drm_property_destroy(connector->base.dev, connector->base.colorspace_property);
+				return ret;
+			}
+			drm_connector_attach_hdr_output_metadata_property(&connector->base);
+		}
+	}
+
+	return 0;
+}
+
 struct vkms_connector *vkms_connector_init_static(struct vkms_device *vkmsdev,
 						  struct vkms_config_connector *connector_cfg)
 {
@@ -84,6 +127,10 @@ struct vkms_connector *vkms_connector_init_static(struct vkms_device *vkmsdev,
 	if (ret)
 		return ERR_PTR(ret);
 
+	ret = vkms_connector_init(connector, connector_cfg);
+	if (ret)
+		return ERR_PTR(ret);
+
 	drm_connector_helper_add(&connector->base, &vkms_conn_helper_funcs);
 
 	return connector;

-- 
2.54.0

