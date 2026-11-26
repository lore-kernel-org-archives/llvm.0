Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795692779;
	b=dNGQ0byku8KqFRYIMFWAMqCHe5r7CqNIVLfdHxlTm+9KBUpekgXr5eTbLWZLBwX+Hz0l
	 pSg708SoeDoWumdt8w6qznrQcMXZp+8XClDtc5OWWLktvuBtUakL6EdPZgHhAiFp392AX
	 YZORMuRtyjP/KYHUOIHQtVcC/ZHXtqQnzEkouZo3nZIh3sklIdMPOK17RRuVhyanMKeYw
	 UAofD43NlthOFwlcZDASya+fEkFzgB2XnSZ4BHw5M2uP7wFp2BrUMErUAmXur2z/nRcxN
	 UfWQX/fkbMj21LZq3VZC21yV6//YUTvk6wAjqUwuRxBZM0WC1XKT+c3gFIw/+8IWw8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692779;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=Kfdezsm46fcSXhjvzx5O8uXTtJeOHRKOQu3o/6I5W3M=;
	b=J0FUYVGXoI54YYiVQP/aVjagBWgb9dx0ud9EW9c8riz6RHtRS43l+gZ9PXNRcjs/q4f7
	 Pbm8lqZkUKskXTuvsFtyWl9wNJeS/xcvESwygZc0LrZpPTfWRVipptxsOCn5lOEUeAY4W
	 yiBMtzhXisEx5y+39KVUMPYbQUd4F9c7xvrygLjzGDO60sjOZ6J4doKO12sX2PEmMaGOn
	 HBV7ZWRMm6g2x5hT9YivZ+ucbzkN+jrfZGCyQclC+7mdVF45HbH8Edum9zJ73WX4UV6Vm
	 NwlWJQqRnscYq2H6FSpGFYflpUWIsHqm2bPi9XGrm4WtQADEzzt6UWTkOO7/P4lQfmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=HUEhUN8o;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6F2606A321
	for <llvm@lists.linux.dev>; Thu, 26 Nov 2026 11:32:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C6F2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=HUEhUN8o
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0B9BE1A1807;
	Thu, 26 Nov 2026 11:32:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CB7B860237;
	Thu, 26 Nov 2026 11:32:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8B25811E6B371;
	Thu, 26 Nov 2026 12:32:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795692772; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Kfdezsm46fcSXhjvzx5O8uXTtJeOHRKOQu3o/6I5W3M=;
	b=HUEhUN8o0Zm4yYFJeQNALrsBg5cz3teualFlcm7cfIryNmiqAAGip8m0CQGExKyHpcuQi5
	jlMNWEADRHFlUtELCtrNu8o2mr+bnqQ5coo4dMxNH+CjbQU/eUPSBP6S87kuQtXJ9gWANk
	2G5XO8gcu759DOPIcd/ddnTxzaJAOAos/xvZF0ZiP6crjmnP8rdKRvPur1ku3HvQ9vCw/h
	4G4rbJRYCgSNLDvl2EyatytaGCTtyOONRoIEnllUymv8Liqo6MpZRR5w7UYmgRGunbgnDg
	nirfTGpJ2ae4R3VztxWEjwDkyd0TQ5qbKzTKX92OhzhkEFeD+mBTH/jMBxOEAA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 26 Nov 2026 12:29:20 +0100
Subject: [PATCH v7 37/43] drm/vkms: Introduce configfs for connector EDID
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
Message-Id: <20261126-vkms-all-config-v7-37-21194cda2468@bootlin.com>
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

Introduce new attributes to configure EDID of a connector:
- edid_enable - chose if the connector will have an EDID or not
- edid - raw edid content

Due to limitation of ConfigFS, the max len of EDID is PAGE_SIZE (4kB on
x86), it should be sufficient for many tests. One possible evolution is
using a ConfigFS blob to allow bigger EDID.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 Documentation/ABI/testing/configfs-vkms | 21 +++++++
 Documentation/gpu/vkms.rst              |  5 +-
 drivers/gpu/drm/vkms/vkms_configfs.c    | 98 +++++++++++++++++++++++++++++++++
 3 files changed, 123 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/configfs-vkms b/Documentation/ABI/testing/configfs-vkms
index 79a9486e359e..11b4435a3562 100644
--- a/Documentation/ABI/testing/configfs-vkms
+++ b/Documentation/ABI/testing/configfs-vkms
@@ -60,6 +60,27 @@ Description:
 	with -EBUSY if the device is enabled. See enum
 	drm_colorspace for the full list.
 
+What:		/sys/kernel/config/vkms/<device>/connectors/<connector>/edid_enabled
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+	Enable or disable EDID for this connector. Value:
+	1 - enabled, 0 - disabled. Changing it triggers a
+	connector hotplug if the device is enabled and the
+	connector status is not disconnected.
+
+What:		/sys/kernel/config/vkms/<device>/connectors/<connector>/edid
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+	Raw content of the EDID for this connector. Writing stores
+	the given bytes and triggers a connector hotplug if the
+	device is enabled and the connector status is not
+	disconnected; writing zero bytes clears the EDID. Reading
+	returns up to PAGE_SIZE bytes of the stored EDID. The EDID
+	is only used to generate connector modes when edid_enabled
+	is set.
+
 What:		/sys/kernel/config/vkms/<device>/connectors/<connector>/possible_encoders
 Date:		Nov 2025
 Contact:	dri-devel@lists.freedesktop.org
diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 11058b6e6250..2a3e175bf67b 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -137,7 +137,7 @@ Last but not least, create one or more connectors::
 
   sudo mkdir /config/vkms/my-vkms/connectors/connector0
 
-Connectors have 3 configurable attribute:
+Connectors have 5 configurable attribute:
 
 - status: Connection status: 1 connected, 2 disconnected, 3 unknown (same values
   as those exposed by the "status" property of a connector)
@@ -146,6 +146,9 @@ Connectors have 3 configurable attribute:
   If supported_colorspaces is not 0, the HDR_OUTPUT_METADATA will also be created.
   Value is a bitfield, 0x1 = NO_DATA, 0x2 = SMPTE_170M_YCC... see enum drm_colorspace
   for full list.
+- edid_enabled: Enable or not EDID for this connector. Some connectors may not have an
+  EDID but just a list of modes, this attribute allows to disable EDID property.
+- edid: Content of the EDID. Ignored if edid_enabled is not set
 
 
 To finish the configuration, link the different pipeline items::
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index 7377d967be75..32ac4d7c4194 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -2,6 +2,7 @@
 #include <linux/cleanup.h>
 #include <linux/configfs.h>
 #include <linux/mutex.h>
+#include <linux/rcupdate.h>
 #include <linux/slab.h>
 #include <linux/string.h>
 
@@ -1191,14 +1192,111 @@ static ssize_t connector_supported_colorspaces_store(struct config_item *item,
 	return count;
 }
 
+static ssize_t connector_edid_enabled_show(struct config_item *item, char *page)
+{
+	struct vkms_configfs_connector *connector;
+	bool enabled;
+
+	connector = connector_item_to_vkms_configfs_connector(item);
+
+	scoped_guard(mutex, &connector->dev->config->lock)
+		enabled = vkms_config_connector_get_edid_enabled(connector->config);
+
+	return sprintf(page, "%d\n", enabled);
+}
+
+static ssize_t connector_edid_enabled_store(struct config_item *item,
+					    const char *page, size_t count)
+{
+	struct vkms_configfs_connector *connector;
+	struct vkms_config_connector *connector_cfg;
+	bool enabled;
+
+	connector = connector_item_to_vkms_configfs_connector(item);
+	connector_cfg = connector->config;
+
+	if (kstrtobool(page, &enabled))
+		return -EINVAL;
+
+	scoped_guard(mutex, &connector->dev->config->lock)
+	{
+		vkms_config_connector_set_edid_enabled(connector_cfg, enabled);
+
+		if (connector->dev->enabled &&
+		    vkms_config_connector_get_status(connector_cfg) !=
+		    connector_status_disconnected)
+			vkms_trigger_connector_hotplug(connector->dev->config->dev);
+	}
+	return count;
+}
+
+static ssize_t connector_edid_show(struct config_item *item, char *page)
+{
+	struct vkms_configfs_connector *connector;
+	ssize_t ret = 0;
+
+	connector = connector_item_to_vkms_configfs_connector(item);
+
+	scoped_guard(mutex, &connector->dev->config->lock)
+	{
+		int len = 0;
+		const u8 *edid;
+		size_t copy_len;
+
+		/*
+		 * vkms_config_connector_get_edid() is an RCU reader; hold
+		 * the read-side critical section while copying the data to
+		 * the userspace page, like the debugfs reader does.
+		 */
+		rcu_read_lock();
+		edid = vkms_config_connector_get_edid(connector->config, &len);
+		if (edid && len > 0) {
+			copy_len = min_t(size_t, (size_t)len, PAGE_SIZE);
+			memcpy(page, edid, copy_len);
+			ret = copy_len;
+		}
+		rcu_read_unlock();
+	}
+
+	return ret;
+}
+
+static ssize_t connector_edid_store(struct config_item *item,
+				    const char *page, size_t count)
+{
+	struct vkms_configfs_connector *connector;
+
+	connector = connector_item_to_vkms_configfs_connector(item);
+
+	scoped_guard(mutex, &connector->dev->config->lock)
+	{
+		int ret;
+
+		ret = vkms_config_connector_set_edid(connector->config, page, count);
+		if (ret)
+			return ret;
+
+		if (connector->dev->enabled &&
+		    vkms_config_connector_get_status(connector->config) !=
+		    connector_status_disconnected)
+			vkms_trigger_connector_hotplug(connector->dev->config->dev);
+	}
+
+	return count;
+}
+
 CONFIGFS_ATTR(connector_, status);
 CONFIGFS_ATTR(connector_, type);
 CONFIGFS_ATTR(connector_, supported_colorspaces);
+CONFIGFS_ATTR(connector_, edid_enabled);
+CONFIGFS_ATTR(connector_, edid);
 
 static struct configfs_attribute *connector_item_attrs[] = {
 	&connector_attr_status,
 	&connector_attr_type,
 	&connector_attr_supported_colorspaces,
+	&connector_attr_edid_enabled,
+	&connector_attr_edid,
 	NULL,
 };
 

-- 
2.56.0

