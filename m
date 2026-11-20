Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795197933;
	b=I7In8Wjtsx1O59+YxqFEnvGvphzGqHBw2f77FbDHFYamaDqyznKZgEdhM2XhdAhILXqJ
	 LXvL1DyPxiXOrCvHiHl38vXyt1Y77sgdmx/UgtCNnuwqZlTOZDG1XzZhrOMIEdOno3DkJ
	 pV6Kz6i18LCGYKJWgdy/pFUcuefqCBO7aWdF9oyFEzxyuc3O86jKo5uq6qEiO7TFS+Jn/
	 a0bR9Ht//UpnndH5Q6f589Y9DH/xE+51tSRFfCkNqHhPju4MIVxHTYUnVXnG2jZKVKZDC
	 KZs3rSfqIaHty0Er4k99Opd1iBSIOXzK6f5SiCoGR5h7s/zXfiNqkkWmhDlnMihjI2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795197933;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Last-TLS-Session-Version;
	bh=UBgFsrPiEQOwN3fGiZFEHHbQ/TECUIJijMpmrcpBd4w=;
	b=mcgxscOd5DfWaHZwc1CjLELZroEjCcydlzS8sZh4H/CB5y9E05CaKIdkVG2o6QhqQdhe
	 yUYGen72Iw0T3SmZHqi0kQFasdCNau6rd1x+iJJKfhjI375weCxPagt8knLyOorrAF95A
	 oCVdWZGBsjuxjEIjSjQSmq2gdgpZgpViJb0D2RknGUlNWJyoroeKJT6RrbsIdwgFZETfP
	 2pwwc7V1Hj6dqLTUWYzzZQdVekbLxloXZPCFXpq+EQhUJSDimPZxJM+siWO5YnJTk+HI6
	 Sz4CoY52vPaNz0ogdgX8Qso6O/9ga8Bvo5VMpx9BmsenTMVwxLsyLABFTHr4MoIfJEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Ob9Obce6;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F326606CCE9
	for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 18:05:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F326606CCE9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Ob9Obce6
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2A392C62225;
	Fri, 20 Nov 2026 18:05:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5FE4A601B9;
	Fri, 20 Nov 2026 18:05:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AB83411BC0966;
	Fri, 20 Nov 2026 19:05:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795197925; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=UBgFsrPiEQOwN3fGiZFEHHbQ/TECUIJijMpmrcpBd4w=;
	b=Ob9Obce6FL5apRZZ1Obwc91bywbs3dGc5moeFlqpduwJxoZ82dwG+mHlMnFKvWB33S7uAs
	aSHCBOo0/hW+6H52BwXYX9UMHUyRvuKRyaLOQd7ca1mWi2V7/vNEZDgPIoNcOM+WV2QMDW
	HHjpsi7x2z21AGp6ffuCNuEL86uBKj3QGf2IaE7nfjKJSuENPRpxpYIjclqQxFUUMBzstN
	dv2HHNhAZScBNHaYxPKdQjZm+ldg+ARjZ6BF9R64OSbnLsKLrIWT1Wi4v7ZuzHmO/TEJWC
	34FYHIw2XFByv13ZBMj1+z9+Le5sQ2lOWufetoLAi/1Hnh3o2yACzIsi8Ge/dQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 20 Nov 2026 18:59:14 +0100
Subject: [PATCH v6 32/43] drm/vkms: Introduce connector type
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
Message-Id: <20261120-vkms-all-config-v6-32-78ace90f4fc1@bootlin.com>
References: <20261120-vkms-all-config-v6-0-78ace90f4fc1@bootlin.com>
In-Reply-To: <20261120-vkms-all-config-v6-0-78ace90f4fc1@bootlin.com>
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
 linux-doc@vger.kernel.org, Simona Vetter <simona.vetter@ffwll.ch>, 
 llvm@lists.linux.dev
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4668;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=9H+WE4jevLs7KwU8iUZOE55eFfpuoLEOiTbl5rNPZag=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBrAIsB5X5TaMq0ZT8Bso/zqdA5+6N2htNUesrSE
 ALyZOLKaEOJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCawCLARsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQIK0uxlsQLOJtZBAAqgC5l5nApNORMmGTuX9rNVyWVgmt4Hh
 iGifV1JIL+V8zC8jJBslMrYPmITAK1wUXvQIaKQAL/J0cVWRDkKUm0C3WwXLu+6rsMVMZg/s+Nj
 S6O0ksAKcMS5Blw4qI67TiOFPrychW6aJGmLozKAO2ZiKwBydVZQUKLwlYXFe2qkKicvZaw8FWU
 dON99PnsEDcFs68E/y5t6q4v3v4tz77rIzmKSBQ+kWd6UEP9EZaXe1Hs4nZNePeSgwh6VQsWNtX
 TSbG76jaOJvCdRxS4dhvBhNouWgA32Xp4zfPjyhHlwdna+MDmNWjBL9qpqA07vzkZWb6+ATwJBW
 zeXW3rV/C1P4WrH2GMNWpBiWLR3q3DmJT2LnWG8nKvDSu+dpwTJWu5WIoANI9MiyE166/JO040s
 +Yt2/17bH8IpknoT2U2lmdQvuV06Obi7kUA7lHYCfnO0PSCcZ7Uk/kqSgAIyPpFi0mMoPgLQfJW
 28cB71NZwp0K6rDTrRCMms2qs5kWTVrE4AHlci5bXf8o0ZLWXAD3BX/b8dmrLR2nnaroWxgrfNZ
 f4gM+h1ct9Uu4FNxTtgVsfLasKBn7ZzeGHkVmMmCi5wStNRGQ9D7LdyVu/R92l5H9cU/R68HE2H
 6PjeGPyf2Ey8bTlLKwrlontyoNWppLXwMNMpCooW2FyRQKtiUajc=
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-Last-TLS-Session-Version: TLSv1.3

In order to emulate connector-specific behavior, add the connector type
to the connector configuration.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/tests/vkms_config_test.c |  5 +++++
 drivers/gpu/drm/vkms/vkms_config.c            |  3 +++
 drivers/gpu/drm/vkms/vkms_config.h            | 24 ++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_connector.c         |  2 +-
 4 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
index a43dff511fc3..257ba0342034 100644
--- a/drivers/gpu/drm/vkms/tests/vkms_config_test.c
+++ b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
@@ -137,6 +137,7 @@ static void vkms_config_test_default_config(struct kunit *test)
 	struct vkms_config *config;
 	struct vkms_config_plane *plane_cfg;
 	struct vkms_config_crtc *crtc_cfg;
+	struct vkms_config_connector *connector_cfg;
 	int n_primaries = 0;
 	int n_cursors = 0;
 	int n_overlays = 0;
@@ -211,6 +212,10 @@ static void vkms_config_test_default_config(struct kunit *test)
 
 	/* Connectors */
 	KUNIT_EXPECT_EQ(test, vkms_config_get_num_connectors(config), 1);
+	vkms_config_for_each_connector(config, connector_cfg) {
+		KUNIT_EXPECT_EQ(test, vkms_config_connector_get_type(connector_cfg),
+				DRM_MODE_CONNECTOR_VIRTUAL);
+	}
 
 	KUNIT_EXPECT_TRUE(test, vkms_config_is_valid(config));
 
diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index 963e32d5adf7..291c0330bc56 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -651,6 +651,8 @@ static int vkms_config_show(struct seq_file *m, void *data)
 		seq_printf(m, "\tstatus=%s\n",
 			   drm_get_connector_status_name(
 				   vkms_config_connector_get_status(connector_cfg)));
+		seq_printf(m, "\ttype=%s\n",
+			   drm_get_connector_type_name(vkms_config_connector_get_type(connector_cfg)));
 	}
 
 	return 0;
@@ -984,6 +986,7 @@ struct vkms_config_connector *vkms_config_create_connector(struct vkms_config *c
 
 	connector_cfg->config = config;
 	connector_cfg->status = connector_status_connected;
+	vkms_config_connector_set_type(connector_cfg, DRM_MODE_CONNECTOR_VIRTUAL);
 	xa_init_flags(&connector_cfg->possible_encoders, XA_FLAGS_ALLOC);
 	kref_init(&connector_cfg->refcnt);
 
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index 9d0a0087c9da..88429e01089b 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -138,6 +138,7 @@ struct vkms_config_encoder {
  * struct vkms_config_connector
  *
  * @link: Link to the others connector in vkms_config
+ * @type: Store the type of connector using DRM_MODE_CONNECTOR_* values
  * @config: The vkms_config this connector belongs to
  * @status: Status (connected, disconnected...) of the connector
  * @possible_encoders: Array of encoders that can be used with this connector
@@ -150,6 +151,7 @@ struct vkms_config_connector {
 	struct list_head link;
 	struct vkms_config *config;
 
+	int type;
 	enum drm_connector_status status;
 	struct xarray possible_encoders;
 
@@ -371,6 +373,28 @@ vkms_config_plane_set_default_pipeline(struct vkms_config_plane *plane_cfg,
 }
 
 /**
+ * vkms_config_connector_get_type() - Return the connector type
+ * @connector_cfg: Connector to get the type from
+ */
+static inline int
+vkms_config_connector_get_type(const struct vkms_config_connector *connector_cfg)
+{
+	return connector_cfg->type;
+}
+
+/**
+ * vkms_config_connector_set_type() - Set the connector type
+ * @connector_cfg: Connector to set the type to
+ * @type: New connector type
+ */
+static inline void
+vkms_config_connector_set_type(struct vkms_config_connector *connector_cfg,
+			       int type)
+{
+	connector_cfg->type = type;
+}
+
+/*
  * vkms_config_plane_get_default_rotation() - Get the default rotation for a plane
  * @plane_cfg: Plane to get the default rotation from
  *
diff --git a/drivers/gpu/drm/vkms/vkms_connector.c b/drivers/gpu/drm/vkms/vkms_connector.c
index 11e313440225..f5e99e77e84f 100644
--- a/drivers/gpu/drm/vkms/vkms_connector.c
+++ b/drivers/gpu/drm/vkms/vkms_connector.c
@@ -88,7 +88,7 @@ struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev,
 		return ERR_PTR(-ENOMEM);
 
 	ret = drmm_connector_init(dev, &connector->base, &vkms_connector_funcs,
-				  DRM_MODE_CONNECTOR_VIRTUAL, NULL);
+				  vkms_config_connector_get_type(connector_cfg), NULL);
 	if (ret)
 		return ERR_PTR(ret);
 

-- 
2.56.0

