Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B480F390C9E
	for <llvm@lists.linux.dev>; Wed, 22 Apr 2026 16:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776876565; cv=none; b=lt1ZvmAsto+BB51ywozpGr9r2BplA2cjre5P8X54zSzKGG+zKW9Uyey8iH9AUq4edYyhWjECfraVmF/0V9pvwobPpsFZyq119jY/vErKzQwusiRB1VKGAryyLpu9pourjUdw2oGslEtpwFxXHZdiUZTN9ekvfevK9gSryRuWSuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776876565; c=relaxed/simple;
	bh=IPPO/N5KzxecIhN7sCv6ZygxjxmYOy9rXkt7EwU9Nd0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e9s8C4UbxnudfUHOamdtv5VhesKPw62d4ZyRagLZzArMALoHgYA9PWwYzQwgXGWjR3M73+5CIlO09ryu9mtCnx+crxCv+QRoUNtMbV1hJ5S4+WCDfd8klONsl0dK+Q02HYjnN/CfXSD+GCOPUjpiraIpkRWhlBsQ0L623IhTyWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=H726gDIQ; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="H726gDIQ"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 732E04E42ABD;
	Wed, 22 Apr 2026 16:49:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 496D55FA8F;
	Wed, 22 Apr 2026 16:49:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B526C10460C21;
	Wed, 22 Apr 2026 18:49:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776876561; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ny8jovS05Cy6acIMNd4HSb4i/Bq9Nh8qF6KY1lLItU0=;
	b=H726gDIQouMTgo1SgwoJu/TS4lwZrbyDDJcaWfXAL3sCJqJ9jnGmwPtV97y1MftgHO8ZC4
	yeIQA6fOq0sHjJxco4Q5pwMKAGNftQcjhJNiN/+9qSA+sqKP2amSfuFFLG+Se6YKq8dpD1
	Ajm8Vh17hzkDVcV6g8jt/nJr3k02tkWPRTTV589hnKp1J50kb60X7xRwZNpbGIflWjj+ig
	mzl8JHh+KRFMeAumshdpTDxGC9d/JJ7qi9GNq5ahKMMYXqZnFVwUCs+upjMsTNdFPsSv0u
	SRZZt9Y/vxKOPFVlIXfG1ZMrVTOJkqBKnyGliwWbMWrm4BHeWLZf7d8woakijA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 22 Apr 2026 18:48:08 +0200
Subject: [PATCH v4 11/37] drm/vkms: Use enabled/disabled instead of 1/0 for
 debug
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260422-vkms-all-config-v4-11-dbb52e9aadc3@bootlin.com>
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
 llvm@lists.linux.dev, 
 =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito@redhat.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.16-dev
X-Last-TLS-Session-Version: TLSv1.3

Debug information are mainly read by human, so display human
readable values.

Reviewed-by: José Expósito <jose.exposito@redhat.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_config.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index 469c57c6d1e8..4c6f3ead51d7 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 
 #include <drm/drm_print.h>
 #include <drm/drm_debugfs.h>
@@ -358,8 +359,8 @@ static int vkms_config_show(struct seq_file *m, void *data)
 
 	vkms_config_for_each_crtc(vkmsdev->config, crtc_cfg) {
 		seq_puts(m, "crtc:\n");
-		seq_printf(m, "\twriteback=%d\n",
-			   vkms_config_crtc_get_writeback(crtc_cfg));
+		seq_printf(m, "\twriteback=%s\n",
+			   str_enabled_disabled(vkms_config_crtc_get_writeback(crtc_cfg)));
 	}
 
 	vkms_config_for_each_encoder(vkmsdev->config, encoder_cfg)

-- 
2.54.0

