Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795197926;
	b=UOh/kRI3Fu/WQrQR6LOAfqIG+BKR9Z7OENEbpgNpwSJrQwhmEf9sKPplD/1anyTagKO6
	 5rg2KCDcpuRsxrBUzqa1P/BSHbWJ8wY8RiT+A5FcHm6U0GXqT4P3r8jgsFLG9wRYNYzbl
	 7zQKmldOXZmLS8/KYyJL7LKGn/u3j37voE5sL+56jb7/QlaH3GltJ6s/jhN7bNkbsZ0SJ
	 f9Elwj19jfzl9Jw6qTp9a/V2QtEoyS1RVNq6DEGUyHkML+ABj6ukmx/Az/En2YLA3sSqv
	 MIRZCi6nu7acNhfmi6wxIi+NBiou4gnMAslq6Hk5f/EkBYS0RftrKZJyIwTXiEgIHNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795197926;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Last-TLS-Session-Version;
	bh=+UIUl6JMLlsjIRpBWhQGReW3EcT47amBfZJg2tCGwXQ=;
	b=lkkqXCt5tpIWGltRBe4Wn8I/jPhH0XZWak3APceLinMUzWVZLDma9TnS/Lo3P5Xs8PyQ
	 YHetCauqxDemj9QGo1bIIQq1lEj5jGnCfDLCT5FcjzbeO5Ya0+df1VKwtKzAL6SQ4C5/B
	 j1ott3jTrAyS8Wvhc78I5YXSxogrs9YpRG6i3MpUY9q075T15OQy4srGAu9mGJ8SS/s9y
	 6OvOmreugWJC6u8KF+coG7dfHyuffdyTF9g15BTRDsWJ4hq1q8yeep8QLw1kphwH3vLbK
	 7JCP8Cyv8Mt8DZ6Gz3gDOyjxMkdTAzQh0h2ZDRa7ez2dyF4hfSGakblU9FxoTmJANwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=P7XdxPip;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C6460A381D
	for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 18:05:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86C6460A381D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=P7XdxPip
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 44E711A1755;
	Fri, 20 Nov 2026 18:05:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 12DD2601B9;
	Fri, 20 Nov 2026 18:05:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0498011BC09FC;
	Fri, 20 Nov 2026 19:05:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795197918; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+UIUl6JMLlsjIRpBWhQGReW3EcT47amBfZJg2tCGwXQ=;
	b=P7XdxPipUuk3FmTA3xRSOooGgExiD2GnTaEgGp1wTZaZoEWNmeOV3lG3CLMKIm43o8yaTv
	dk1b8tKX0OHSmVzCB3qAQcVqIEuxsrTQNnvYu2wNntuPQdXHzmKk8bnIoYWZXSFMcDl4AJ
	No79DMhUfdnhYOsi0ThNnKLfH1lQjrI1pyG3R3b9VIYbHQZPr3vouKz5DTYJyIeGM4OIaL
	PGs1NLDScleei3HttsdjScVYTPqMCSUpljhXz6ili4S7UUWEIxOAHKCmmvVefe0TSRi9Hu
	xUcLDL8jI2K3myxqdLf6+qkQuTmO1KwaHJwh8iKOjn3TguH2NIDy2KmijMK5fQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 20 Nov 2026 18:59:13 +0100
Subject: [PATCH v6 31/43] drm/vkms: Introduce back pointer to connector
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
Message-Id: <20261120-vkms-all-config-v6-31-78ace90f4fc1@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4785;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=6KsXUneTwmqij+4ZKl54amsu/Tg7T/9AYKAEb4VeX4c=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBrAIsBMYERXnGQtJdLO8v3Eb7aLdMIhcAy4Y7iX
 kzG6vphwv2JAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCawCLARsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQIK0uxlsQLOK13RAAtBep1yRGxvQMfo+rVhw/cnkLJ/9kd59
 zpdZx3fAkqL5/V5tUXORX6TlfBucj1uOgvEd+T6uH0u8KFtDGKp7HnPAh71saEPw4L10JKiS941
 8iPiRLAAJoTGVnkpKfvb19GNX27huL9bM0fcn9yLkZeVW1qvh2xigbPWpHBp1jGeU9bAozl7ACd
 yxKa6BUXx90ZIpJHWwwmNRaoqPRc5MexnklZrH+H8KIeDwnvaPkNwV0pdqqxfrIUSigVeFMPmPJ
 H5Om+VhtK770vh/8FccRrj4q3OpjeiLkbNOkyCGVFTzwHV2YMfN5+MZu6DfGi0eh8XOOLRBTqo5
 qVmpfic+MFi9we6XWpKikD+FGy/c25NhNWc5pig604Y6tTUEueBrgaWy1SEhnzei9I+Bn0sCN1t
 ngRhfTgY1ynZaaWnnNg5zF5Hc3LK7gkdHieAp571uewDageEoyEsct1uayonusptI5CCx6asf/5
 MW5LjTBk9f2FRVo9MH1vFsLr9lbU7EUgJCfewQrzc49ByjF1b8E+HtyXXMrFviEAyYCt3MtqkRe
 jTtSrRLrjCesoYqkTOv8p+Jde7JYbwB+Iqi7TNYZ3c7dluOCZVJvBmCR6UYGhsE4kAaGZN1XRg8
 qBUqDlj31cODcNnrzqWpuhS/0BEFb93G8oduMTKIPF03yTFdzwPY=
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-Last-TLS-Session-Version: TLSv1.3

Each connector now stores a pointer to its vkms_config_connector and
takes a reference on it when created, released through a drmm action on
device cleanup; detect() uses the back-pointer instead of walking the
configuration list.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_connector.c | 30 +++++++++++++++++++++++-------
 drivers/gpu/drm/vkms/vkms_connector.h |  9 ++++++++-
 drivers/gpu/drm/vkms/vkms_output.c    |  2 +-
 3 files changed, 32 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_connector.c b/drivers/gpu/drm/vkms/vkms_connector.c
index 57138027966f..11e313440225 100644
--- a/drivers/gpu/drm/vkms/vkms_connector.c
+++ b/drivers/gpu/drm/vkms/vkms_connector.c
@@ -11,11 +11,9 @@
 static enum drm_connector_status vkms_connector_detect(struct drm_connector *connector,
 						       bool force)
 {
-	struct drm_device *dev = connector->dev;
-	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
 	struct vkms_connector *vkms_connector;
+	struct vkms_config_connector *cfg;
 	enum drm_connector_status status;
-	struct vkms_config_connector *connector_cfg;
 
 	vkms_connector = drm_connector_to_vkms_connector(connector);
 
@@ -26,9 +24,11 @@ static enum drm_connector_status vkms_connector_detect(struct drm_connector *con
 	 */
 	status = connector->status;
 
-	vkms_config_for_each_connector(vkmsdev->config, connector_cfg) {
-		if (connector_cfg->connector == vkms_connector)
-			status = vkms_config_connector_get_status(connector_cfg);
+	cfg = vkms_connector->cfg;
+	if (cfg) {
+		cfg = vkms_config_connector_get(cfg);
+		status = vkms_config_connector_get_status(cfg);
+		vkms_config_connector_put(cfg);
 	}
 
 	return status;
@@ -68,7 +68,16 @@ static const struct drm_connector_helper_funcs vkms_conn_helper_funcs = {
 	.best_encoder = vkms_conn_best_encoder,
 };
 
-struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev)
+static void vkms_connector_static_cfg_release(struct drm_device *dev, void *res)
+{
+	struct vkms_connector *connector = res;
+
+	vkms_config_connector_put(connector->cfg);
+}
+
+
+struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev,
+					   struct vkms_config_connector *connector_cfg)
 {
 	struct drm_device *dev = &vkmsdev->drm;
 	struct vkms_connector *connector;
@@ -85,6 +94,13 @@ struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev)
 
 	drm_connector_helper_add(&connector->base, &vkms_conn_helper_funcs);
 
+	connector->cfg = connector_cfg;
+	vkms_config_connector_get(connector_cfg);
+	ret = drmm_add_action_or_reset(dev, vkms_connector_static_cfg_release,
+				       connector);
+	if (ret)
+		return ERR_PTR(ret);
+
 	return connector;
 }
 
diff --git a/drivers/gpu/drm/vkms/vkms_connector.h b/drivers/gpu/drm/vkms/vkms_connector.h
index 52ae97af2bc1..89d7f3a15d6e 100644
--- a/drivers/gpu/drm/vkms/vkms_connector.h
+++ b/drivers/gpu/drm/vkms/vkms_connector.h
@@ -4,6 +4,7 @@
 #define _VKMS_CONNECTOR_H_
 
 #include "vkms_drv.h"
+#include "vkms_config.h"
 
 #define drm_connector_to_vkms_connector(target) \
 	container_of(target, struct vkms_connector, base)
@@ -12,19 +13,25 @@
  * struct vkms_connector - VKMS custom type wrapping around the DRM connector
  *
  * @base: Base DRM connector
+ * @cfg: Configuration of the connector. A reference on it is taken at
+ *	 creation and released by a drmm action on device cleanup
  */
 struct vkms_connector {
 	struct drm_connector base;
+
+	struct vkms_config_connector *cfg;
 };
 
 /**
  * vkms_connector_init() - Initialize a connector
  * @vkmsdev: VKMS device containing the connector
+ * @connector_cfg: Connector's configuration
  *
  * Returns:
  * The connector or an error on failure.
  */
-struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev);
+struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev,
+					   struct vkms_config_connector *connector_cfg);
 
 /**
  * vkms_trigger_connector_hotplug() - Update the device's connectors status
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 982c6cd5fcc7..7783a2f6d343 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -97,7 +97,7 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 		struct vkms_config_encoder *possible_encoder;
 		unsigned long idx = 0;
 
-		connector_cfg->connector = vkms_connector_init(vkmsdev);
+		connector_cfg->connector = vkms_connector_init(vkmsdev, connector_cfg);
 		if (IS_ERR(connector_cfg->connector)) {
 			DRM_ERROR("Failed to init connector\n");
 			return PTR_ERR(connector_cfg->connector);

-- 
2.56.0

