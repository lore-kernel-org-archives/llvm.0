Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9735F1632DD
	for <llvm@lists.linux.dev>; Sat, 27 Jun 2026 03:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782531061; cv=none; b=aNePElAZ0Wa7TfMdqY7KTeJP1eRyhsJ6cCp8DZZ1deIPkFCyQJrAAlpKaXzZcmR9iXjYX7WRsByPs3DMWSxrfnRhve3ystU+eHTEITwKZ+BnVEuUfrYgggsxJpkj6LWt2RFW/7MSQhAdGpGreHn5JkQw4DodhWbYtEu/eAJXKd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782531061; c=relaxed/simple;
	bh=TBKH35H5KkoXrlkkTPUu8sQoW4QI8QE2VLMTYp9em/U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qLbxIndSBqEJfPoaubA9HYJDrKutDzpExjN4qk70Lzyh407GsThLdwd8+BO24f8w8MGEAk0okzNoyQbARk8yLt3TWNXC+AGEO7yroj2tDO8RkrAnSGdKa8/WRIXh3TGlsWz8QZ2rpjzjlFiAdW44B9TwCmw76wUrYSuT5JfjLxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Ic2hegNg; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Ic2hegNg"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 634CA4E409DF;
	Sat, 27 Jun 2026 03:30:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 36F5660233;
	Sat, 27 Jun 2026 03:30:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BDC4D106F1165;
	Sat, 27 Jun 2026 05:30:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782531056; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4rYEpdGc2l1H4Q3WE2kVlS4ZSJvLBdS6Or7RDAFqOWQ=;
	b=Ic2hegNgUCuMXDurAhiR3n5RMqJDFALwsL/jiMiDMv8KZYM9n9z6ASdbCbcDCzvU38jnd4
	iq1+RZ0EEw65CAS1YOUM+TSUeyoUTx1IHpoYF47WdRa61sS+n2kfWFdbB5yHSVepdPiWYg
	QLad18aBDvvz9Lp4pYYFi3QkgXkv7VYuoBgw8jWKbsjNrXZCbRlVh0KLbt7W6jtbd1zWFA
	46QqKLNQ/KKer9rp6ECv+BZw60zjaQ6OyOHk2jaBGfufs5hw2ukCOCercT2kEHMdpTDnQN
	2fz4HcMtUoYzsGxpazmqcMzISvBf/7WtjCJHNYlhnLG6OpULHQNJ30yzMlikLA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Sat, 27 Jun 2026 05:30:20 +0200
Subject: [PATCH v5 03/38] drm/drm_color_mgmt: Expose
 drm_get_color_encoding_name
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260627-vkms-all-config-v5-3-854aa0840926@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2160;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=TBKH35H5KkoXrlkkTPUu8sQoW4QI8QE2VLMTYp9em/U=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBqP0PcAT4RFTJfCFacpdlv7IITIY8ZozYsEYBi0
 m5r0x8L5GeJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaj9D3BsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQIK0uxlsQLOKDXxAAvGYuZar3rPVvbwi8jFnIHeIqkVwiMIv
 ArS1jHz8ckBpsRYXBnZkUzC6QcyQF9d+o+6XwClgCaMBHGHHzVBA4IIdUbP6iQbjUI7JQDRCqM+
 4/eEV0NHCtRY0VwS03TGnWLYPwuYVIdrI+JLjLL6WnU6XSkk5v377HnRs5Ilr4uE2EKljZykcCf
 2dJcucC7YHAW8LjaigcOAD3UiG7880iJGgr0TEZxrQSrziUYT2bBitriYFotih9k3Ewb5fY9w1G
 IbLjyclGv0UlsBP3pEP7wsfog7OxWnQcKlO82Pbc48h9NiXIV5nwMmVLc/AwO9tyxOvRIL7PXvo
 ET9m14YJ8psW/P+acpy4XuAA84/jLWoYKKyouqrOikryUZ50O9+oZyoKBth0VRCRRJUR0H8KpK9
 gLdHiS2xTUSBv4vVFAl2arc+Bs1p/8imCmRYrcIdGnIfhKk1wXznFI5nTM5IimGN8c41l7vkiNh
 1HcMDaPKtL4jyIlpyZR4atCJI6X3V2gMz0FyQgfP4tj4ygcXwLWi++jN52PWRGeNdwbPtmMmZTu
 P2Usy2lysK6fhdXLIW5NcPWsIAjbvn1UoDc+6Hh8Lb1YHgpi04A0rkYnqsEBOJGSF3tyTkNWPxR
 3g/oIMrUGUD5Q7vWrHJd2IQXyYZ5ijxoMm/pvWoB3DfvbEiTcjg0=
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-Last-TLS-Session-Version: TLSv1.3

drm_get_color_encoding_name can be useful to display debug information
outside drm core. Export it so it could be used for VKMS

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/drm_color_mgmt.c    | 2 +-
 drivers/gpu/drm/drm_crtc_internal.h | 2 --
 include/drm/drm_color_mgmt.h        | 2 ++
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
index 3bcf82cf61a7..b5635862dc91 100644
--- a/drivers/gpu/drm/drm_color_mgmt.c
+++ b/drivers/gpu/drm/drm_color_mgmt.c
@@ -496,7 +496,7 @@ const char *drm_get_color_encoding_name(enum drm_color_encoding encoding)
 
 	return color_encoding_name[encoding];
 }
-EXPORT_SYMBOL_IF_KUNIT(drm_get_color_encoding_name);
+EXPORT_SYMBOL(drm_get_color_encoding_name);
 
 /**
  * drm_get_color_range_name - return a string for color range
diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
index 83146ffef00c..bcd23eb0e531 100644
--- a/drivers/gpu/drm/drm_crtc_internal.h
+++ b/drivers/gpu/drm/drm_crtc_internal.h
@@ -38,7 +38,6 @@
 #include <linux/err.h>
 #include <linux/types.h>
 
-enum drm_color_encoding;
 enum drm_color_range;
 enum drm_connector_force;
 enum drm_mode_status;
@@ -121,7 +120,6 @@ int drm_mode_destroy_dumb_ioctl(struct drm_device *dev,
 				void *data, struct drm_file *file_priv);
 
 /* drm_color_mgmt.c */
-const char *drm_get_color_encoding_name(enum drm_color_encoding encoding);
 const char *drm_get_color_range_name(enum drm_color_range range);
 
 /* IOCTLs */
diff --git a/include/drm/drm_color_mgmt.h b/include/drm/drm_color_mgmt.h
index 5140691f476a..133ca77d91c7 100644
--- a/include/drm/drm_color_mgmt.h
+++ b/include/drm/drm_color_mgmt.h
@@ -113,6 +113,8 @@ enum drm_color_range {
 	DRM_COLOR_RANGE_MAX,
 };
 
+const char *drm_get_color_encoding_name(enum drm_color_encoding encoding);
+
 int drm_plane_create_color_properties(struct drm_plane *plane,
 				      u32 supported_encodings,
 				      u32 supported_ranges,

-- 
2.54.0

