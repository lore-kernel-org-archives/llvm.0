Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1EAF137923
	for <llvm@lists.linux.dev>; Sat, 27 Jun 2026 03:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782531056; cv=none; b=WSk//SLJxOaBUtINoA6/shQ5bFGy/HhrJEFpojmQMjRNLP8QyYYsMjbNeT1wA0mjHuDgAOE3rHbo8lwJrFQE8HzvO1CatVPyCCs8tO1sYDdbqpALPxFk5tOnAYwwJ2rj7imEjwPnfDqY6kMBvn5+dkAbGuqi3Q958nOx87vbf4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782531056; c=relaxed/simple;
	bh=/Gr6kiSSgqJgP+KQhT9pYb203dueGUnbTDf8JiXzBVo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a5jYlZ5cuZWTilSieEjN6YpSjzgulANFpQ9pp1rMtXQm0sd07Rwe59bHSIMigoTX91zhNmAx5ktYTURAXa4H7zPzgOpAKq56ILam4gNnPSYzpA+b6D/L6cVtbZQ+aORnPAa4G5j0vX5RcZncdGZHhx7afWulvBnDnkr2/uAHpAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=OPkn56K/; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="OPkn56K/"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7C65E1A0A07;
	Sat, 27 Jun 2026 03:30:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4F69F60233;
	Sat, 27 Jun 2026 03:30:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A6AB9106F1167;
	Sat, 27 Jun 2026 05:30:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782531051; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=x90JzqH1BoHc2vBkdAptzZT2i9xIFGN7kfo+uujLNZc=;
	b=OPkn56K/Hn9l95VhCfCwjmlPuBSMOhmB1rd8V/mv8+R+tnEk5gZ/k24rjnFyO27AHqkCM9
	jrj/ZTLO1oDfHOOpxMHw3eDij6CJe+LaKTwycWIBis+WezE/l4kPxhXaD76Ne1Vxrnzv+o
	yhbNQ31hSak/Y1Q81cUl6/YnlnCPiRaZL+vaN8OH9wgugyxLWDspiUGfMf/C0pyCqvgPuI
	OMXFbyq7JIHPTqTainMwzl8wBgXLsz4OaFAix4nWOHXhKad861fJCNBJo1dI7Vw4PukBnn
	TBnG0JDz4+vNADhohlwYYXqYlH6FbljvWLXpX2x1kSJiRuoA5eEcBsGWqUnNUg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Sat, 27 Jun 2026 05:30:18 +0200
Subject: [PATCH v5 01/38] drm/drm_mode_config: Add helper to get plane type
 name
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260627-vkms-all-config-v5-1-854aa0840926@bootlin.com>
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
 Louis Chauvet <louis.chauvet@bootlin.com>, llvm@lists.linux.dev, 
 =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1973;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=/Gr6kiSSgqJgP+KQhT9pYb203dueGUnbTDf8JiXzBVo=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBqP0Pc9iBNPzZZeBSQdnQm+kC9erh9QbfgZw2IE
 AlkbhLWIDmJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaj9D3BsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQIK0uxlsQLOKnUhAAyqtsEOQFcBERdhlPMGW3eckjREkiTpZ
 5AvCtXp8hIWKiRXL9Sx0Ko+P68W+8/U8V1pAZ8kCnwKfdTrFOlr4zs41XwWW7XIv/tq6A32o49Z
 KONDSPIdEzfxFY5Bzbfnuz3PhauJ0gFwGBEkr/NkGP/qovrV3efXxUyi8mPQ2rI/DzpAMDYOgku
 IR+BTbdGC75ic/wunNEBARebL8f7bRSZWEa3YnO4fRIsBhf+wEUC2x3sQ8EcPSw2HIaAIJYjPdR
 1jeGktGd5VdnHgoK600sRsOXl+xz1dtQq0MQcYMO82uxJftqCbbvfP0/YE1QKp0iy+MVnxoRUtf
 43z0uV+Mn5UkYWUrFlZUXXYVouUfUIoq+yQ4dn2DzsiFM+qJT+IulgaxEosT4pMCKdHnmM6aovs
 Z2UzOwG0rsO+56WciRoaV4MED7ykacd+HNoDi5d3w8JA1UZybOOUTNM7lSknZeQ1lW5y/081AGD
 ioU6KcjR2De7gae24otVTgUbeYddGosIOS+GMyQcsAoFaxU8lnxxdA7B7YMEGEbKx+ioH1krD/U
 4461ew3bsJ7vbUdfDtb9VfiHati8ra/TdnoDTjA//MdxhNHNvNRDEjh3yntVWH/OoguCOL6/pFa
 6oiqo3ERLOoGOhhyI5uR7TvFx7KkZfTlIDh1nvUWvQOfFkPKDD1Q=
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-Last-TLS-Session-Version: TLSv1.3

Create and export an helper to display plane type using the
property string. This could be used to display debug
information in VKMS.

Reviewed-by: José Expósito <jose.exposito@redhat.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/drm_mode_config.c | 16 ++++++++++++++++
 include/drm/drm_mode_config.h     |  3 +++
 2 files changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
index f432f485a914..6f8a363ec6a1 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -414,6 +414,22 @@ static const struct drm_prop_enum_list drm_plane_type_enum_list[] = {
 	{ DRM_PLANE_TYPE_CURSOR, "Cursor" },
 };
 
+/**
+ * drm_get_plane_type_name - return a string for plane name
+ * @type: plane type to compute name of
+ *
+ * Returns: The name of the plane type. "(unknown)" if type is not a known
+ * plane type.
+ */
+const char *drm_get_plane_type_name(enum drm_plane_type type)
+{
+	if (type >= 0 && type < ARRAY_SIZE(drm_plane_type_enum_list))
+		return drm_plane_type_enum_list[type].name;
+	else
+		return "(unknown)";
+}
+EXPORT_SYMBOL(drm_get_plane_type_name);
+
 static int drm_mode_create_standard_properties(struct drm_device *dev)
 {
 	struct drm_property *prop;
diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index d8f5b7e9673e..20aed1ae2985 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -30,6 +30,7 @@
 #include <linux/llist.h>
 
 #include <drm/drm_modeset_lock.h>
+#include <drm/drm_plane.h>
 
 struct drm_file;
 struct drm_device;
@@ -1011,4 +1012,6 @@ int drm_mode_config_create_initial_state(struct drm_device *dev);
 void drm_mode_config_reset(struct drm_device *dev);
 void drm_mode_config_cleanup(struct drm_device *dev);
 
+const char *drm_get_plane_type_name(enum drm_plane_type type);
+
 #endif

-- 
2.54.0

