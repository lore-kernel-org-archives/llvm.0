Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795692716;
	b=ITO3LsNNuwnD3jzb5qXWi8t98wCI2irFULhg3427lb2zzZlKjtWfmHuitYAiVgP+57I4
	 SIu5KbxPsRdIO3+cAshPNbl2Le2BjLtrQJwE4LM7PpImQr7g834jmoiiv7mVi+GblAI6p
	 V6prNOgdKf7Lc8VFBo2mtRhjZltZADifCgzHNZAQj+uPNhbjsOP2M2aCgNBKOXKX21K+e
	 NVp7U24u2s2u9nfKbUR2GaHPRGTpZL0O7jTfSc7bAX+foKmF8IoehceMIi1JsSnS7sANq
	 DmJvjr3Ik51FRuOo2yGPsZwBCbUjRmc4ceAwzXng56D7mBMAx5SYL2SNWv/iGTBXV4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692716;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=y0/Of2nftQsavXIv76rfFGrCdHPN6fnQKBDhfciyYvU=;
	b=RapJ4MVhLvKkg/A0BB9o4rGeMdc/Cxlf6Yi4XzmhwquWOJxqJKejZE7iLve2G/tdaY6C
	 YJbIsnG9Oo7tV3cfxcepUW39D5OYVUrjerWiOrAxUHc+szGixWexIgzV0F80ODzOnpuYP
	 2WJZT8QE5MxA8JI+NH11FQ692QC4ypGuKcAwPBEWMarKw85jZrPakRBm8H7OUSyqobPf6
	 qxdDfS/CGmp5o/HjXgiJz0MTYZOvdj4xpilQ0nUOyhvpObHmID9PqfysFzpGAyAtvHljG
	 z24V+HcPYoW5Ufv6cn583ROgKVEhlO36fsLdZHH2SMuH+OrLiA7ODTu6ymxfL+KFa5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=xZGHFPma;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48490606A337
	for <llvm@lists.linux.dev>; Thu, 26 Nov 2026 11:31:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48490606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=xZGHFPma
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 23B8F4E4179C;
	Thu, 26 Nov 2026 11:31:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E3ED460237;
	Thu, 26 Nov 2026 11:31:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9BA8511E6B363;
	Thu, 26 Nov 2026 12:31:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795692712; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=y0/Of2nftQsavXIv76rfFGrCdHPN6fnQKBDhfciyYvU=;
	b=xZGHFPmanZilLdmfZEXx+noKTLobKqjsjL82N8ZLFjvZj0xEKEmw9LhudjqfO3nXk6y45Q
	p5cyzFAJCzphlWDPrVcqt/eM/TgvNHjsywnLQrFB93cPyuUKxfL87L10+jiZ8XDz84uVOh
	vu9z6bPvtDB0tN6dK7XYMtsmsOcITA1fooJfLZeCqTxSIy72WKiXHdNs00bF2dR4ZoEbtx
	TcUdIPWosCs5TzWLcI/v7nQeac/bKlOH9/R/4sF03jGhXT5Fh/usb/L8wPi1BjISnLKCJb
	4r67oZ+ix1cTQvo1mook/PMPi3deqGSDGfgd2PAg+0MkC24GgZ8Sr8fCMRIBfg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 26 Nov 2026 12:29:09 +0100
Subject: [PATCH v7 26/43] drm/vkms: Introduce configfs for plane format
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261126-vkms-all-config-v7-26-21194cda2468@bootlin.com>
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

To allow the userspace to test many hardware configuration, introduce a
new interface to configure the available formats per planes. VKMS supports
multiple formats, so the userspace can choose any combination.

The supported formats are configured by writing the fourcc code in
supported_formats:
 # enable AR24 format
  echo '+AR24' > /config/vkms/DEVICE_1/planes/PLANE_1/supported_formats
 # disable AR24 format
  echo '-AR24' > /config/vkms/DEVICE_1/planes/PLANE_1/supported_formats
 # enable all format supported by VKMS
  echo '+*' > /config/vkms/DEVICE_1/planes/PLANE_1/supported_formats
 # disable all formats
  echo '-*' > /config/vkms/DEVICE_1/planes/PLANE_1/supported_formats

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 Documentation/ABI/testing/configfs-vkms | 10 ++++
 Documentation/gpu/vkms.rst              |  7 ++-
 drivers/gpu/drm/vkms/vkms_configfs.c    | 85 +++++++++++++++++++++++++++++++++
 3 files changed, 101 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/configfs-vkms b/Documentation/ABI/testing/configfs-vkms
index 16a44cc60e4a..312631d12985 100644
--- a/Documentation/ABI/testing/configfs-vkms
+++ b/Documentation/ABI/testing/configfs-vkms
@@ -164,6 +164,16 @@ Description:
 	DRM_COLOR_YCBCR_LIMITED_RANGE, 2 -
 	DRM_COLOR_YCBCR_FULL_RANGE.
 
+What:		/sys/kernel/config/vkms/<device>/planes/<plane>/supported_formats
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+	List of supported formats for this plane. To add a new
+	item, write its fourcc code prefixed with '+'. To remove,
+	use '-' prefix. Use '+*' to add all formats supported by
+	the driver, '-*' to remove all. Reading returns the
+	supported formats, one fourcc code per line.
+
 What:		/sys/kernel/config/vkms/<device>/planes/<plane>/possible_crtcs
 Date:		Nov 2025
 Contact:	dri-devel@lists.freedesktop.org
diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 7e8f4fe3b392..e5280a99eee8 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -87,7 +87,7 @@ Start by creating one or more planes::
 
   sudo mkdir /config/vkms/my-vkms/planes/plane0
 
-Planes have 7 configurable attributes:
+Planes have 8 configurable attributes:
 
 - type: Plane type: 0 overlay, 1 primary, 2 cursor (same values as those
   exposed by the "type" property of a plane)
@@ -108,6 +108,11 @@ Planes have 7 configurable attributes:
   must be set too.
 - default_color_range: Default color range presented to the userspace, same
   values as supported_color_ranges
+- supported_formats: List of supported formats for this plane. To add a new item in the
+  list, write it using a plus and fourcc code: +XR24
+  To remove a format, use a minus and its fourcc: -XR24
+  To add all formats use +*
+  To remove all formats, use -*
 
 Continue by creating one or more CRTCs::
 
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index a746fb5e22a3..9f24e9e6ed6d 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -3,6 +3,7 @@
 #include <linux/configfs.h>
 #include <linux/mutex.h>
 #include <linux/slab.h>
+#include <linux/string.h>
 
 #include "vkms_drv.h"
 #include "vkms_config.h"
@@ -576,6 +577,88 @@ static ssize_t plane_default_color_encoding_store(struct config_item *item,
 	return count;
 }
 
+static ssize_t plane_supported_formats_show(struct config_item *item, char *page)
+{
+	struct vkms_configfs_plane *plane;
+
+	plane = plane_item_to_vkms_configfs_plane(item);
+
+	page[0] = '\0';
+
+	scoped_guard(mutex, &plane->dev->config->lock) {
+		u32 *formats = vkms_config_plane_get_supported_formats(plane->config);
+
+		for (int i = 0;
+		     i < vkms_config_plane_get_supported_formats_count(plane->config);
+		     i++) {
+			char tmp[6] = { 0 };
+			const ssize_t ret = snprintf(tmp, ARRAY_SIZE(tmp), "%.*s\n",
+					       (int)sizeof(*formats),
+					       (char *)&formats[i]);
+			if (ret < 0)
+				return ret;
+			/*
+			 * Limitation of ConfigFS attributes: an attribute can't be
+			 * bigger than PAGE_SIZE, so bail out with -ENOMEM if this
+			 * plane supports too many formats (more than ≈1000).
+			 */
+			if (ret + strlen(page) > PAGE_SIZE - 1)
+				return -ENOMEM;
+			strncat(page, tmp, ARRAY_SIZE(tmp));
+		}
+	}
+
+	return strlen(page);
+}
+
+static ssize_t plane_supported_formats_store(struct config_item *item,
+					     const char *page, size_t count)
+{
+	struct vkms_configfs_plane *plane;
+	ssize_t ret_count = count;
+	int ret = 0;
+
+	plane = plane_item_to_vkms_configfs_plane(item);
+
+	count = strlen(strim((char *)page));
+
+	if (count < 2 || count > 5)
+		return -EINVAL;
+
+	if (page[0] != '+' && page[0] != '-')
+		return -EINVAL;
+
+	if (page[1] == '*' && count != 2)
+		return -EINVAL;
+
+	scoped_guard(mutex, &plane->dev->config->lock) {
+		if (plane->dev->enabled)
+			return -EBUSY;
+
+		char fmt[4] = {' ', ' ', ' ', ' '};
+		u32 fourcc;
+
+		memcpy(fmt, &page[1], min(count - 1, 4));
+
+		if (page[0] == '+' && page[1] == '*')
+			ret = vkms_config_plane_add_all_formats(plane->config);
+		else if (page[0] == '-' && page[1] == '*')
+			vkms_config_plane_remove_all_formats(plane->config);
+		else if (page[0] == '+') {
+			memcpy(&fourcc, fmt, sizeof(fourcc));
+			ret = vkms_config_plane_add_format(plane->config, fourcc);
+		} else if (page[0] == '-') {
+			memcpy(&fourcc, fmt, sizeof(fourcc));
+			vkms_config_plane_remove_format(plane->config, fourcc);
+		}
+
+		if (ret)
+			return ret;
+	}
+
+	return (ssize_t)ret_count;
+}
+
 CONFIGFS_ATTR(plane_, type);
 CONFIGFS_ATTR(plane_, supported_rotations);
 CONFIGFS_ATTR(plane_, default_rotation);
@@ -583,6 +666,7 @@ CONFIGFS_ATTR(plane_, supported_color_ranges);
 CONFIGFS_ATTR(plane_, default_color_range);
 CONFIGFS_ATTR(plane_, supported_color_encodings);
 CONFIGFS_ATTR(plane_, default_color_encoding);
+CONFIGFS_ATTR(plane_, supported_formats);
 
 static struct configfs_attribute *plane_item_attrs[] = {
 	&plane_attr_type,
@@ -592,6 +676,7 @@ static struct configfs_attribute *plane_item_attrs[] = {
 	&plane_attr_default_color_range,
 	&plane_attr_supported_color_encodings,
 	&plane_attr_default_color_encoding,
+	&plane_attr_supported_formats,
 	NULL,
 };
 

-- 
2.56.0

