Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D50D357D1E
	for <llvm@lists.linux.dev>; Sat, 27 Jun 2026 03:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782531122; cv=none; b=frQ3tx+4P93TRd65C6BXUJ/qyJY0xOckHVk6sfYDzKJAp+hC4t0TysOdX0qJtuYYxgKibOZKgKMqu2in+1G+pFDhyr2mRSmmiS9v0nYFXs5hDQw8O8RQeFvjLiyXMuakbPBPFr63G3WDvyMsNii8Tj7Vdom4fYHhgoGhwFXczbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782531122; c=relaxed/simple;
	bh=vbenv+pQSiNZcDfZE0Pylq/m0+ak/8m5W1XYtB05JGU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O/LjxpIpDx9zX+O+aSmheYl3zmnDoYF8UO3DjIzJFuLrP0e1gbkVNxeqRDnbn4SF1WSzy5fizH74Q37WMQX/etsVlas5zZqvyCtaFRx/XH97SH6MP9EXT42dpidpkTYTZjWVzPMTQaR8Wh0QuqnEX69dSnuqG0CUl05PK/WTCOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=c0w22a3n; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="c0w22a3n"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 11E101A0A23;
	Sat, 27 Jun 2026 03:31:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D240660233;
	Sat, 27 Jun 2026 03:31:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 45799106F1179;
	Sat, 27 Jun 2026 05:31:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782531117; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=GkxkbljcYLRIXXs5VDtu2PEu7V6pmMfgDmaKHnKfnO8=;
	b=c0w22a3n8MHl4gyq3waM2HZfGT/Dk2N6893TIgDjM70OVf1/5QQGprZfao5L0a2l2+rOCv
	0tsNRx/YU7wz29lRADhkGXcgu3gfcrp1i/8ra8qNWRDR6kUdIWaws9v0+DNNOeOpoDsEsa
	lxSAnr0nVRfURvoFJRgEN8sfOCZlgJ9sVnIPpmWaOMANFyyglgmw2ZhH/d0CGXyVGJoQmd
	qvOrRb7PvH3ZlMC/jvhZzVvV9Ol6Cj02osump8cCgKfL+OxS5irKBrQl1bBalCvrfMvTtY
	O7Alyk5swsAvdpCcKq9Jn+mBvMPJNwIyax86k3DXqiv/vk/zArZCGDSUvmUu+w==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Sat, 27 Jun 2026 05:30:45 +0200
Subject: [PATCH v5 28/38] drm/vkms: Introduce configfs for connector type
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260627-vkms-all-config-v5-28-854aa0840926@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4162;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=vbenv+pQSiNZcDfZE0Pylq/m0+ak/8m5W1XYtB05JGU=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBqP0PgIgHVSGT5N4uYOsuyVnMJfSZLU964R/iPa
 RPQje0PZcWJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaj9D4BsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQIK0uxlsQLOIOaBAAr2K0xlUwqfX921dLw5NJEtdFxU7j8k6
 ohj1Bx5cUGP9bh8Il5GOxz/P7DdpY7FkQT+aGJ2j4mM+wN/J9YJB6xSlnkfZ030FcnhaP4mt8k4
 aJ59nNvsFCZ3Y8TQG9X0XN9Q66B4f9+g6E0m7ZJc3pgz20kgE5N0zKLh6om2XWkvv7YvcqyPor6
 9cM51k3koheIpFawxrI9mN/cy8MFHp2RiPo3CuqKA8zTGPn62X2IJWH/GS3MxwRkrzkplJvJTrd
 izTRrzMadKxUjFpqFe35SPV0oODqYigpzTI98AWParpChF5eNtcsIU7yIsbLXv6sPReePsKtob/
 yTuNPc1necs+Y1YUPJb/9uzn7U06HOaUe8rU+o/nwxwuwQzeS7BySZyK16WMLtdSdu9sJpw3Jga
 LiUzkwnpxJA6QPPdfK2nG+vnw1kMfB5YHzxXKsTQZPUke585NSF9kIocAxJgwUOqQQ7lWjrji8L
 YWOSbdlakbR9RxskwjPm+r0xGAVVR0YmoIyg0+IzD4oobaK9xskDVaR+MkHFuCeTfeMzlOBY/hH
 ZYaGXAX0a13oXEUXcBXtyYVM+ny4v6I3CgT44WmTe2v+a/XiyAh97OQC9Aa1B+NiukNzY1BbVv2
 B3NmWdxwRbL1hD6H0YGIhS05TS0UzIPavTt9VE8gj0AxNuSwzSDc=
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-Last-TLS-Session-Version: TLSv1.3

Add a new attribute to connector to change its type. This is mostly
cosmetic and don't have direct effect in VKMS behavior.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 Documentation/ABI/testing/configfs-vkms |  7 ++++
 Documentation/gpu/vkms.rst              |  3 +-
 drivers/gpu/drm/vkms/vkms_configfs.c    | 65 +++++++++++++++++++++++++++++++++
 3 files changed, 74 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/configfs-vkms b/Documentation/ABI/testing/configfs-vkms
index 9bc51b1e682a..0e588a1145ff 100644
--- a/Documentation/ABI/testing/configfs-vkms
+++ b/Documentation/ABI/testing/configfs-vkms
@@ -33,6 +33,13 @@ Description:
 	Connection status of the connector. Possible values:
 	1 - connected, 2 - disconnected, 3 - unknown.
 
+What:		/sys/kernel/config/vkms/<device>/connectors/<connector>/type
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+	Type of the connector. Possible values match those
+	exposed by the "type" field in drm_connector.
+
 What:		/sys/kernel/config/vkms/<device>/connectors/<connector>/possible_encoders
 Date:		Nov 2025
 Contact:	dri-devel@lists.freedesktop.org
diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index b58e96a3c273..f2622b3fd8af 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -137,10 +137,11 @@ Last but not least, create one or more connectors::
 
   sudo mkdir /config/vkms/my-vkms/connectors/connector0
 
-Connectors have 1 configurable attribute:
+Connectors have 2 configurable attribute:
 
 - status: Connection status: 1 connected, 2 disconnected, 3 unknown (same values
   as those exposed by the "status" property of a connector)
+- type: Type of connector. Same values as exposed by the "type" field in drm_connector.
 
 To finish the configuration, link the different pipeline items::
 
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index 95f4594fb683..8b414f1950e8 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -1117,10 +1117,75 @@ static ssize_t connector_status_store(struct config_item *item,
 	return (ssize_t)count;
 }
 
+static ssize_t connector_type_show(struct config_item *item, char *page)
+{
+	struct vkms_configfs_connector *connector;
+	int type;
+
+	connector = connector_item_to_vkms_configfs_connector(item);
+
+	scoped_guard(mutex, &connector->dev->lock) {
+		type = vkms_config_connector_get_type(connector->config);
+	}
+
+	return sprintf(page, "%u", type);
+}
+
+static ssize_t connector_type_store(struct config_item *item,
+				    const char *page, size_t count)
+{
+	struct vkms_configfs_connector *connector;
+	int val, ret;
+
+	connector = connector_item_to_vkms_configfs_connector(item);
+
+	ret = kstrtouint(page, 10, &val);
+
+	if (ret)
+		return ret;
+
+	switch (val) {
+	case DRM_MODE_CONNECTOR_Unknown:
+	case DRM_MODE_CONNECTOR_VGA:
+	case DRM_MODE_CONNECTOR_DVII:
+	case DRM_MODE_CONNECTOR_DVID:
+	case DRM_MODE_CONNECTOR_DVIA:
+	case DRM_MODE_CONNECTOR_Composite:
+	case DRM_MODE_CONNECTOR_SVIDEO:
+	case DRM_MODE_CONNECTOR_LVDS:
+	case DRM_MODE_CONNECTOR_Component:
+	case DRM_MODE_CONNECTOR_9PinDIN:
+	case DRM_MODE_CONNECTOR_DisplayPort:
+	case DRM_MODE_CONNECTOR_HDMIA:
+	case DRM_MODE_CONNECTOR_HDMIB:
+	case DRM_MODE_CONNECTOR_TV:
+	case DRM_MODE_CONNECTOR_eDP:
+	case DRM_MODE_CONNECTOR_VIRTUAL:
+	case DRM_MODE_CONNECTOR_DSI:
+	case DRM_MODE_CONNECTOR_DPI:
+	case DRM_MODE_CONNECTOR_SPI:
+	case DRM_MODE_CONNECTOR_USB:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	scoped_guard(mutex, &connector->dev->lock) {
+		if (connector->dev->enabled)
+			return -EBUSY;
+
+		vkms_config_connector_set_type(connector->config, val);
+	}
+
+	return count;
+}
+
 CONFIGFS_ATTR(connector_, status);
+CONFIGFS_ATTR(connector_, type);
 
 static struct configfs_attribute *connector_item_attrs[] = {
 	&connector_attr_status,
+	&connector_attr_type,
 	NULL,
 };
 

-- 
2.54.0

