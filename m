Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795692623;
	b=bSW2DrYdlsm7Gx/R2VXGWoX3Dxff30ilY+0BhLRFCiOkuTclzhukXbyK0SiSz5zG0krr
	 PtR2VyDEdf47j0j2uiWhCcKeajzWNbQHQX2Xx+obzTp55n1aCkuLCVynY/KBi1SGD8rPe
	 C2NkBuVHN3WOjJXGhvNwVoavdExTdVSqo3Qs32i3WugIownZE4GXYLZ5XbA0mgNdxn++0
	 NcAnX5eh6Wui22WEYvlZDrClM7UUlZANF/M0gmXYAevz0LdmzWXykEQI57ENjQGlVCm3U
	 yfHB3xEHeUdf5T1gK2fwp2q2nHiSUaQo+VbGyGsl8D+ceYr/z9t4h7ERbhQZw3vdDOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692623;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=zJiyOa2XI6rDL1hqGuplRz+W+l30O40z7mhV9q8Ggyk=;
	b=XV0xCBO68q5NuAxGBE1YApZeJw6Nwq+U1oNXgkNQnGyGukboPvRBVt6bnTfbg98YY78w
	 fZTiuZOzrRRoqQ/n3vU3IOFOTJddUjnmWb8na1IW8JyZxle2VDLUKtYMv7XVHua2rq+BP
	 FKq6Bez5RaHSkpTdRSdoqid2UOm5khuaZ/dJco4W0sMBZCfL1f4FB1h10xjVtz5VnD0n6
	 gbMrox9MChAKJrj+ARsDBZ/OHtq3EkkJ+kXfixrr9+hQs29dLPDyexJtKyUzn2ecmisw/
	 WcCUNc7ZujGfLlimL4+cd4Glb+7CgOmlsnmTLN29nor9zj1cdTxWaPLxQ/nBlZi3llw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=n+JIIhX6;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57AE606A31C
	for <llvm@lists.linux.dev>; Thu, 26 Nov 2026 11:30:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C57AE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=n+JIIhX6
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9E43E4E41693;
	Thu, 26 Nov 2026 11:30:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 71A3760237;
	Thu, 26 Nov 2026 11:30:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F14FC11E6B324;
	Thu, 26 Nov 2026 12:30:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795692618; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zJiyOa2XI6rDL1hqGuplRz+W+l30O40z7mhV9q8Ggyk=;
	b=n+JIIhX6iJncg9xg8XC0c/XNeagU/Xugup09oJL0tb+0XA6ydS/U7NxrESyp1zsmEFqFv2
	CRqePng4518BK/iDazWDLh87bukTZNrJZqxBWeWhDLpC/BOQ5cyj17wwBUS7X6/6jl7sNY
	bjvdXr4Ts9oCMTcIh9SwxUo9PNzjn+LwnGGC41CT4/n60u/lsqwZCkMZNyhjH8yJRrtB4z
	Ild+oZJOugmOQBBJvYgQbX5s9xOIn1jaLkA2Cx8eVrIdUdccpS2FC2R0T2WC8cR8WzUQml
	dKbbDyOmXp30RYpdzR6Zs+gJb05na1mOEwDsJnmgkHjxmmOS9m4Z+duDXjbbUw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 26 Nov 2026 12:28:54 +0100
Subject: [PATCH v7 11/43] drm/vkms: Reference-count vkms_config and
 vkms_config_connector
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
Message-Id: <20261126-vkms-all-config-v7-11-21194cda2468@bootlin.com>
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

The configuration objects are referenced from places with independent
lifetimes: connectors keep a pointer to their vkms_config_connector, the
DRM device outlives the configfs view, and userspace can delete a
configfs directory while the device is still running. Freeing a
configuration when its configfs representation disappears can therefore
lead to use-after-free.

Add explicit get/put references to vkms_config and vkms_config_connector:
a configuration destroyed while still referenced is detached and kept
alive until its last reference is dropped.

The connectors list owns the initial reference of each connector (taken by
kref_init() in vkms_config_create_connector()). A connector does not take
a reference on its configuration at creation time: the configuration
already owns the connector through config->connectors, so the opposite
reference would create a cycle that plain krefs cannot reclaim. Instead,
vkms_config_destroy_connector() pins the configuration when the connector
is detached, so a connector which outlives its configuration keeps it
alive until its own last put.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_config.c | 74 ++++++++++++++++++++++++++++++++++----
 drivers/gpu/drm/vkms/vkms_config.h | 48 +++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_drv.c    |  6 +++-
 3 files changed, 121 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index 6699ddae7126..8cd4fe6551fb 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -9,6 +9,8 @@
 
 #include "vkms_config.h"
 
+static void vkms_config_connector_release(struct kref *ref);
+
 struct vkms_config *vkms_config_create(const char *dev_name)
 {
 	struct vkms_config *config;
@@ -27,6 +29,8 @@ struct vkms_config *vkms_config_create(const char *dev_name)
 	INIT_LIST_HEAD(&config->crtcs);
 	INIT_LIST_HEAD(&config->encoders);
 	INIT_LIST_HEAD(&config->connectors);
+	/* refcnt starts at 1: the caller owns this initial reference */
+	kref_init(&config->refcnt);
 	mutex_init(&config->lock);
 
 	return config;
@@ -112,8 +116,9 @@ struct vkms_config *vkms_config_default_create(bool enable_cursor,
 }
 EXPORT_SYMBOL_IF_KUNIT(vkms_config_default_create);
 
-void vkms_config_destroy(struct vkms_config *config)
+static void vkms_config_release(struct kref *ref)
 {
+	struct vkms_config *config = container_of(ref, struct vkms_config, refcnt);
 	struct vkms_config_plane *plane_cfg, *plane_tmp;
 	struct vkms_config_crtc *crtc_cfg, *crtc_tmp;
 	struct vkms_config_encoder *encoder_cfg, *encoder_tmp;
@@ -128,12 +133,31 @@ void vkms_config_destroy(struct vkms_config *config)
 	list_for_each_entry_safe(encoder_cfg, encoder_tmp, &config->encoders, link)
 		vkms_config_destroy_encoder(config, encoder_cfg);
 
-	list_for_each_entry_safe(connector_cfg, connector_tmp, &config->connectors, link)
-		vkms_config_destroy_connector(connector_cfg);
+	list_for_each_entry_safe(connector_cfg, connector_tmp, &config->connectors, link) {
+		/* The config is dying: drop the list's reference on each connector */
+		vkms_config_connector_put(connector_cfg);
+	}
 
 	mutex_destroy(&config->lock);
 	kfree_const(config->dev_name);
-	kfree(config);
+	kfree_rcu(config, rcu);
+}
+
+void vkms_config_get(struct vkms_config *config)
+{
+	kref_get(&config->refcnt);
+}
+EXPORT_SYMBOL_IF_KUNIT(vkms_config_get);
+
+void vkms_config_put(struct vkms_config *config)
+{
+	kref_put(&config->refcnt, vkms_config_release);
+}
+EXPORT_SYMBOL_IF_KUNIT(vkms_config_put);
+
+void vkms_config_destroy(struct vkms_config *config)
+{
+	vkms_config_put(config);
 }
 EXPORT_SYMBOL_IF_KUNIT(vkms_config_destroy);
 
@@ -611,6 +635,8 @@ struct vkms_config_connector *vkms_config_create_connector(struct vkms_config *c
 	connector_cfg->config = config;
 	connector_cfg->status = connector_status_connected;
 	xa_init_flags(&connector_cfg->possible_encoders, XA_FLAGS_ALLOC);
+	/* refcnt starts at 1: this reference is owned by config->connectors */
+	kref_init(&connector_cfg->refcnt);
 
 	list_add_tail_rcu(&connector_cfg->link, &config->connectors);
 
@@ -618,12 +644,48 @@ struct vkms_config_connector *vkms_config_create_connector(struct vkms_config *c
 }
 EXPORT_SYMBOL_IF_KUNIT(vkms_config_create_connector);
 
-void vkms_config_destroy_connector(struct vkms_config_connector *connector_cfg)
+static void vkms_config_connector_release(struct kref *ref)
 {
+	struct vkms_config_connector *connector_cfg =
+		container_of(ref, struct vkms_config_connector, refcnt);
 	xa_destroy(&connector_cfg->possible_encoders);
-	list_del_rcu(&connector_cfg->link);
+	if (connector_cfg->unlinked) {
+		/* Detached by vkms_config_destroy_connector(): drop its config pin */
+		vkms_config_put(connector_cfg->config);
+	} else {
+		/* The config is dying and is draining us: just unlink */
+		list_del_init(&connector_cfg->link);
+	}
 	kfree_rcu(connector_cfg, rcu);
 }
+
+struct vkms_config_connector *vkms_config_connector_get(struct vkms_config_connector *connector_cfg)
+{
+	kref_get(&connector_cfg->refcnt);
+	return connector_cfg;
+}
+EXPORT_SYMBOL_IF_KUNIT(vkms_config_connector_get);
+
+void vkms_config_connector_put(struct vkms_config_connector *connector_cfg)
+{
+	kref_put(&connector_cfg->refcnt, vkms_config_connector_release);
+}
+EXPORT_SYMBOL_IF_KUNIT(vkms_config_connector_put);
+
+void vkms_config_destroy_connector(struct vkms_config_connector *connector_cfg)
+{
+	/*
+	 * Pin the config, then unlink and drop the list's reference. If this
+	 * was the last connector reference the release callback runs right
+	 * here, so it must not walk config->connectors (already unlinked)
+	 * nor free the config (pinned). list_del_rcu() because a concurrent
+	 * dump may still be walking this connector.
+	 */
+	vkms_config_get(connector_cfg->config);
+	list_del_rcu(&connector_cfg->link);
+	connector_cfg->unlinked = true;
+	vkms_config_connector_put(connector_cfg);
+}
 EXPORT_SYMBOL_IF_KUNIT(vkms_config_destroy_connector);
 
 int __must_check vkms_config_connector_attach_encoder(struct vkms_config_connector *connector_cfg,
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index 125273f67e7d..95e5c3694742 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -3,9 +3,14 @@
 #ifndef _VKMS_CONFIG_H_
 #define _VKMS_CONFIG_H_
 
+#include <linux/cleanup.h>
+#include <linux/kref.h>
 #include <linux/list.h>
 #include <linux/rculist.h>
 #include <linux/mutex.h>
+#include <linux/rcupdate.h>
+#include <linux/string.h>
+#include <linux/list.h>
 #include <linux/types.h>
 #include <linux/xarray.h>
 
@@ -24,6 +29,8 @@
  * @lock: Protects the whole configuration (lists and item fields) against
  *        concurrent access from the configfs, debugfs and DRM paths
  * @dev: Used to store the current VKMS device. Only set when the device is instantiated.
+ * @refcnt: Reference counter, starts at 1 (owned by the creator)
+ * @rcu: RCU head for deferred freeing of this object
  */
 struct vkms_config {
 	const char *dev_name;
@@ -33,6 +40,8 @@ struct vkms_config {
 	struct list_head connectors;
 	struct mutex lock;
 	struct vkms_device *dev;
+	struct kref refcnt;
+	struct rcu_head rcu;
 };
 
 /**
@@ -116,10 +125,14 @@ struct vkms_config_encoder {
  * @config: The vkms_config this connector belongs to
  * @status: Status (connected, disconnected...) of the connector
  * @possible_encoders: Array of encoders that can be used with this connector
+ * @unlinked: Set when the connector was unlinked from config->connectors
+ *            by vkms_config_destroy_connector()
  * @connector: Internal usage. This pointer should never be considered as valid.
  *             It can be used to store a temporary reference to a VKMS connector
  *             during device creation. This pointer is not managed by the
  *             configuration and must be managed by other means.
+ * @refcnt: Reference counter, starts at 1 (owned by config->connectors). The
+ *          object is freed only after an RCU grace period
  */
 struct vkms_config_connector {
 	struct list_head link;
@@ -128,9 +141,12 @@ struct vkms_config_connector {
 
 	enum drm_connector_status status;
 	struct xarray possible_encoders;
+	bool unlinked;
 
 	/* Internal usage */
 	struct vkms_connector *connector;
+
+	struct kref refcnt;
 };
 
 /**
@@ -228,6 +244,23 @@ struct vkms_config *vkms_config_default_create(bool enable_cursor,
 					       bool enable_overlay,
 					       bool enable_plane_pipeline);
 
+/**
+ * vkms_config_get() - Acquire a reference to a VKMS configuration
+ * @config: vkms_config to acquire a reference to
+ */
+void vkms_config_get(struct vkms_config *config);
+
+/**
+ * vkms_config_put() - Release a reference to a VKMS configuration
+ * @config: vkms_config to release the reference from
+ *
+ * When the last reference is released, the configuration and all its
+ * sub-components are freed.
+ */
+void vkms_config_put(struct vkms_config *config);
+
+DEFINE_FREE(vkms_config_put, struct vkms_config *, if (_T) vkms_config_put(_T));
+
 /**
  * vkms_config_destroy() - Free a VKMS configuration
  * @config: vkms_config to free
@@ -463,6 +496,21 @@ void vkms_config_encoder_detach_crtc(struct vkms_config_encoder *encoder_cfg,
  */
 struct vkms_config_connector *vkms_config_create_connector(struct vkms_config *config);
 
+/**
+ * vkms_config_connector_get() - Acquire a reference to a connector configuration
+ * @connector_cfg: Connector configuration to acquire a reference to
+ */
+struct vkms_config_connector *
+vkms_config_connector_get(struct vkms_config_connector *connector_cfg);
+
+/**
+ * vkms_config_connector_put() - Release a reference to a connector configuration
+ * @connector_cfg: Connector configuration to release the reference from
+ *
+ * When the last reference is released, the connector configuration is freed.
+ */
+void vkms_config_connector_put(struct vkms_config_connector *connector_cfg);
+
 /**
  * vkms_config_destroy_connector() - Remove and free a connector configuration
  * @connector_cfg: Connector configuration to destroy
diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 4cbb1173fcc6..24572bc779b4 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -163,6 +163,10 @@ int vkms_create(struct vkms_config *config)
 	struct faux_device *fdev;
 	struct vkms_device *vkms_device;
 	const char *dev_name;
+	/* The device keeps the config alive for its whole lifetime */
+	struct vkms_config *cfg __free(vkms_config_put) = config;
+
+	vkms_config_get(cfg);
 
 	dev_name = vkms_config_get_device_name(config);
 	fdev = faux_device_create(dev_name, NULL, NULL);
@@ -276,7 +280,7 @@ static void __exit vkms_exit(void)
 		return;
 
 	vkms_destroy(default_config);
-	vkms_config_destroy(default_config);
+	vkms_config_put(default_config);
 }
 
 module_init(vkms_init);

-- 
2.56.0

