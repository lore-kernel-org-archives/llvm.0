Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F2F37FF58
	for <llvm@lists.linux.dev>; Wed, 22 Apr 2026 16:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776876583; cv=none; b=b23RF4T6zl0nw5gaux1m8dKkWyearcfIW6Zpoz9BnyQXUKURxUWaB7wdXdGcSh3QLXcL8wOch3iO3HkWOczcjRnmvihJ5PPM50qYRTvpZe/btHCHdcGFHD1gSHuXwyM67BIm/Oj6gLw7MR1vwxqGfbPvHgBO6dTPny07IV3Q8ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776876583; c=relaxed/simple;
	bh=W0QtWQnOieyr6bKgTC6s+SlZeU7dhMQS7lBl5SpUBJY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Uqiv6xcJ58mRPcRSepuOFUnGl9NUEhVhv4hbIZdgnwSO21y+1U2eMFADuXHHK0WgrsZEV3D8Vcu/6kbKQ20ugjQJx04O+UGXblDkpI67cPqNWps40C6D/EEtoUhZGCRhKzf/t4LhH78sihzkA2jf8Im4vuPaygRKzpDvzezj+bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=OTXRlMd7; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="OTXRlMd7"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 33C52C5EF04;
	Wed, 22 Apr 2026 16:50:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 514DE5FA8F;
	Wed, 22 Apr 2026 16:49:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EA18310460C11;
	Wed, 22 Apr 2026 18:49:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776876579; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gpQahVzA19/c9bzuH0aAC/IbxFHp2HPAtQqXUJb62eA=;
	b=OTXRlMd7UCb0yMGggDML5+1NgAhr/f1dBGFjqmP4N5Ivjch1o9zt5zB0wSRNRX1LJYju2A
	uQu3C/a2OXW1zAudE53mmmdC2M4NrVcezsO5AJUNhEfFP2C6xfAWhSRydpkcczC6Dfwjgv
	9x+rStwdCzD4UoAY/IZC7B2bNWuTWVtyFxJkmGjxegPNaZBsKY/9tlpnkXJo3F8K+klMYe
	Piqb182yD9Txc5/PUpZbZKQX0C57d7FGR4Rei0mj1xQOslFSI+VE36VqYGVY6AvOOKprBC
	XG5fBxyPeoR871lcZ3Ogx1OKcUj3n15C+D5v9JZ3JUkyllgDZ/hINrYTZGhRLA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 22 Apr 2026 18:48:15 +0200
Subject: [PATCH v4 18/37] drm/vkms: Introduce configfs for plane color
 encoding
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260422-vkms-all-config-v4-18-dbb52e9aadc3@bootlin.com>
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

To allows the userspace to test many hardware configuration, introduce a
new interface to configure the available color encoding per planes. VKMS
supports multiple color encoding, so the userspace can choose any
combination.

The supported color encoding are configured by writing a color encoding
bitmask to the file `supported_color_encoding` and the default color
encoding is chosen by writing a color encoding bitmask to
`default_color_encoding`.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 Documentation/ABI/testing/configfs-vkms | 14 +++++
 Documentation/gpu/vkms.rst              |  8 ++-
 drivers/gpu/drm/vkms/vkms_configfs.c    | 92 +++++++++++++++++++++++++++++++++
 3 files changed, 113 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/configfs-vkms b/Documentation/ABI/testing/configfs-vkms
index 55472f4e721d..836169910884 100644
--- a/Documentation/ABI/testing/configfs-vkms
+++ b/Documentation/ABI/testing/configfs-vkms
@@ -124,6 +124,20 @@ Description:
 	Default rotation presented to userspace, same values as
 	possible_rotations.
 
+What:		/sys/kernel/config/vkms/<device>/planes/<plane>/supported_color_encodings
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+	Available color encodings for the plane, as a bitmask:
+	0x01 - YCBCR_BT601, 0x02 - YCBCR_BT709, 0x04 - YCBCR_BT2020.
+
+What:		/sys/kernel/config/vkms/<device>/planes/<plane>/default_color_encoding
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+	Default color encoding presented to userspace, same
+	values as supported_color_encoding.
+
 What:		/sys/kernel/config/vkms/<device>/planes/<plane>/possible_crtcs
 Date:		Nov 2025
 Contact:	dri-devel@lists.freedesktop.org
diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 034565eb43ad..4b3dfbe4e13a 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -87,7 +87,7 @@ Start by creating one or more planes::
 
   sudo mkdir /config/vkms/my-vkms/planes/plane0
 
-Planes have 4 configurable attributes:
+Planes have 6 configurable attributes:
 
 - type: Plane type: 0 overlay, 1 primary, 2 cursor (same values as those
   exposed by the "type" property of a plane)
@@ -97,6 +97,12 @@ Planes have 4 configurable attributes:
   (same values as those exposed by the "rotation" property of a plane)
 - default_rotation: Default rotation presented to the userspace, same values as
   supported_rotations.
+- supported_color_encodings: Available encodings for a plane, as a bitmask:
+  0x01 YCBCR_BT601, 0x02 YCBCR_BT709, 0x04 YCBCR_BT2020 (same values as those exposed
+  by the COLOR_ENCODING property of a plane). If set, supported_color_range
+  must be set too.
+- default_color_encoding: Default color encoding presented to the userspace, same
+  values as supported_color_encodings
 
 Continue by creating one or more CRTCs::
 
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index 5ed6a7fa6046..a5174fc8321c 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -9,6 +9,14 @@
 #include "vkms_configfs.h"
 #include "vkms_connector.h"
 
+/**
+ * VKMS_SUPPORTED_COLOR_ENCODINGS - Bitmask of all supported color encodings in VKMS
+ */
+#define VKMS_SUPPORTED_COLOR_ENCODINGS (	\
+	BIT(DRM_COLOR_YCBCR_BT601) |		\
+	BIT(DRM_COLOR_YCBCR_BT709) |		\
+	BIT(DRM_COLOR_YCBCR_BT2020))
+
 /* To avoid registering configfs more than once or unregistering on error */
 static bool is_configfs_registered;
 
@@ -462,16 +470,100 @@ static ssize_t plane_default_rotation_store(struct config_item *item,
 	return count;
 }
 
+static ssize_t plane_supported_color_encodings_show(struct config_item *item, char *page)
+{
+	struct vkms_configfs_plane *plane = plane_item_to_vkms_configfs_plane(item);
+	unsigned int supported_color_encodings;
+
+	scoped_guard(mutex, &plane->dev->lock)
+		supported_color_encodings = vkms_config_plane_get_supported_color_encodings(plane->config);
+
+	return sprintf(page, "%u", supported_color_encodings);
+}
+
+static ssize_t plane_supported_color_encodings_store(struct config_item *item,
+						     const char *page, size_t count)
+{
+	struct vkms_configfs_plane *plane = plane_item_to_vkms_configfs_plane(item);
+	int ret, val = 0;
+
+	ret = kstrtouint(page, 10, &val);
+	if (ret)
+		return ret;
+
+	/* Should be a supported value */
+	if (val & ~(VKMS_SUPPORTED_COLOR_ENCODINGS))
+		return -EINVAL;
+	/* Should at least provide one color encoding */
+	if ((val & (VKMS_SUPPORTED_COLOR_ENCODINGS)) == 0)
+		return -EINVAL;
+
+	scoped_guard(mutex, &plane->dev->lock) {
+		if (plane->dev->enabled)
+			return -EBUSY;
+
+		vkms_config_plane_set_supported_color_encodings(plane->config, val);
+	}
+
+	return count;
+}
+
+static ssize_t plane_default_color_encoding_show(struct config_item *item, char *page)
+{
+	struct vkms_configfs_plane *plane = plane = plane_item_to_vkms_configfs_plane(item);
+	unsigned int default_color_encoding;
+
+	scoped_guard(mutex, &plane->dev->lock)
+		default_color_encoding = BIT(vkms_config_plane_get_default_color_encoding(plane->config));
+
+	return sprintf(page, "%u", default_color_encoding);
+}
+
+static ssize_t plane_default_color_encoding_store(struct config_item *item,
+						  const char *page, size_t count)
+{
+	struct vkms_configfs_plane *plane = plane_item_to_vkms_configfs_plane(item);
+	int ret, val = 0;
+
+	ret = kstrtouint(page, 10, &val);
+	if (ret)
+		return ret;
+
+	/* Should be a supported value */
+	if (val & ~VKMS_SUPPORTED_COLOR_ENCODINGS)
+		return -EINVAL;
+
+	/* Ensure val is a single bit set */
+	if (!is_power_of_2(val))
+		return -EINVAL;
+
+	/* Convert bit position to the proper enum value */
+	val = __ffs(val) + DRM_COLOR_YCBCR_BT601;
+
+	scoped_guard(mutex, &plane->dev->lock) {
+		if (plane->dev->enabled)
+			return -EBUSY;
+
+		vkms_config_plane_set_default_color_encoding(plane->config, val);
+	}
+
+	return count;
+}
+
 CONFIGFS_ATTR(plane_, type);
 CONFIGFS_ATTR(plane_, name);
 CONFIGFS_ATTR(plane_, supported_rotations);
 CONFIGFS_ATTR(plane_, default_rotation);
+CONFIGFS_ATTR(plane_, supported_color_encodings);
+CONFIGFS_ATTR(plane_, default_color_encoding);
 
 static struct configfs_attribute *plane_item_attrs[] = {
 	&plane_attr_type,
 	&plane_attr_name,
 	&plane_attr_supported_rotations,
 	&plane_attr_default_rotation,
+	&plane_attr_supported_color_encodings,
+	&plane_attr_default_color_encoding,
 	NULL,
 };
 

-- 
2.54.0

