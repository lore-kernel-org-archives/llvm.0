Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795692745;
	b=3cyKv4hMvwIgFNtQFQIqAjFWBzY5j/QDsmGw0RQX/ifPqAGR5O7mk/L46u4ZpAx+M5Be
	 wCRuYAJ9uqOY4+lpfbEaCaSmGV0+QLqq2077Au+wcOhdwal5pEcP3CnICXNwvqtgtbDgM
	 TmAsHeOm3G6OVwiPJqbQfjRDJciIMuuYK+Z4WCINByoUrLVOMTEIejk7CfECPaThX6cCP
	 DrmjLZhCs2Sy5/gkQiETt3ZPFvsGNcaGmPH2C0wbw55uLQfliPwAZofNREYPCgHpcbCWj
	 LlijlowVy5zaOf3W4Xmr62q3TYeEPREfodUf6OR6C1exb1odSOE8KCaDNrjS0Z69dEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692745;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=px8iJpa4otyaxnvaxXqY2SybngCaEPfuBEelTHrJ4fg=;
	b=d+JYeue+zpBoKw2BiUW4D4kdi2P9/3IwCnQYaVckLV12/zvhf3x44vBe9v/OLG6+ICf/
	 Ku7KwTGPG0qU9fVetPCrdInUHzSqR4h9HEaH5Hsy85mEGfW94oaB6KaB7CP/NFIxEh/bp
	 Qnm3HFwZAK5f3Q3ujnoaQtusD5dGuiDm+kaMI0k7HJ0BoSVKkS1uH/wFIB7BFHUz+gC3j
	 Y6WTjGAQRfxoWOUsGxapSydUMN/sJGKv0v1jjDCEl8MMa7ycfWPQm6Kg4xQUIDE9c0lZK
	 CAUc2qA2aRiwyhlwdHRHzxUAGUmiOEKad23lA947SJycFuuYpUnFjM+MhbT16opHtUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=S7qbLyeb;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F80606A32E
	for <llvm@lists.linux.dev>; Thu, 26 Nov 2026 11:32:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89F80606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=S7qbLyeb
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 44EFC4E4179C;
	Thu, 26 Nov 2026 11:32:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1106D60237;
	Thu, 26 Nov 2026 11:32:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EC59611E6B302;
	Thu, 26 Nov 2026 12:32:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795692741; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=px8iJpa4otyaxnvaxXqY2SybngCaEPfuBEelTHrJ4fg=;
	b=S7qbLyebe6fEkSbrCqDIhmq+whTYsvDXw99ncP4sbBvrFiiAzhbOFXqCk8K68t2xnIxSIA
	MCddEm1nlmktZsKZA03HI+oSBAZrFGaQBS2Lcw+Fs6Arnw7r2gy55EAkShLRu/nRv9y7TQ
	7nBVljAsdTbODbY0kRNiEdBoEvcbCPfdw8s4UmzIUIID3U7NeP8BhS5CgTlgyVJc/7eIQy
	FFsJGGNytF4LvPo0O9X3hpR1bIAr3Fdk9xhjhSvFWlk7Iq++K1kF2fOeDGe6MzUnswcXKW
	RRPiIEYwq6JNH4lYKB/uivDY7c1MhBc567joJ9vY2l3YnSr//EUcxBMa7YoDqw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 26 Nov 2026 12:29:14 +0100
Subject: [PATCH v7 31/43] drm/vkms: Introduce connector type
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
Message-Id: <20261126-vkms-all-config-v7-31-21194cda2468@bootlin.com>
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
index 342b844bfc6d..b415d4bf6edb 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -647,6 +647,8 @@ static int vkms_config_show(struct seq_file *m, void *data)
 			seq_puts(m, "connector:\n");
 			seq_printf(m, "\tstatus=%s\n",
 				   drm_get_connector_status_name(vkms_config_connector_get_status(connector_cfg)));
+			seq_printf(m, "\ttype=%s\n",
+				   drm_get_connector_type_name(vkms_config_connector_get_type(connector_cfg)));
 		}
 	}
 
@@ -1005,6 +1007,7 @@ struct vkms_config_connector *vkms_config_create_connector(struct vkms_config *c
 
 	connector_cfg->config = config;
 	connector_cfg->status = connector_status_connected;
+	vkms_config_connector_set_type(connector_cfg, DRM_MODE_CONNECTOR_VIRTUAL);
 	xa_init_flags(&connector_cfg->possible_encoders, XA_FLAGS_ALLOC);
 	/* refcnt starts at 1: this reference is owned by config->connectors */
 	kref_init(&connector_cfg->refcnt);
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index eb29008e54f0..efebb190ce40 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -150,6 +150,7 @@ struct vkms_config_encoder {
  *
  * @link: Link to the others connector in vkms_config
  * @rcu: RCU head for deferred freeing of this object
+ * @type: Store the type of connector using DRM_MODE_CONNECTOR_* values
  * @config: The vkms_config this connector belongs to
  * @status: Status (connected, disconnected...) of the connector
  * @possible_encoders: Array of encoders that can be used with this connector
@@ -167,6 +168,7 @@ struct vkms_config_connector {
 	struct rcu_head rcu;
 	struct vkms_config *config;
 
+	int type;
 	enum drm_connector_status status;
 	struct xarray possible_encoders;
 	bool unlinked;
@@ -397,6 +399,28 @@ vkms_config_plane_set_default_pipeline(struct vkms_config_plane *plane_cfg,
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
index bb023b5af4e4..84c49915ed44 100644
--- a/drivers/gpu/drm/vkms/vkms_connector.c
+++ b/drivers/gpu/drm/vkms/vkms_connector.c
@@ -89,7 +89,7 @@ struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev,
 		return ERR_PTR(-ENOMEM);
 
 	ret = drmm_connector_init(dev, &connector->base, &vkms_connector_funcs,
-				  DRM_MODE_CONNECTOR_VIRTUAL, NULL);
+				  vkms_config_connector_get_type(connector_cfg), NULL);
 	if (ret)
 		return ERR_PTR(ret);
 

-- 
2.56.0

