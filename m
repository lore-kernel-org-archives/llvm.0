Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795692658;
	b=r4EOV3fp2gzn+ppzVbTiO2eR1Oz5tmFOqfq8jL1B/GSJaWtz3dXO4udOLo2jBRh/0A9f
	 WN/1bOyKbFZE9xVHXIj8Z5iIr8epX7PcCKmCMqhNtbUfJAXo7DupsaQjGpugpZFoXGT2b
	 qFtvjlOECEjj8VhHjdSk0LvPAI2lh7eeSLr9yDCQ0pKDIifC48k+ccv/csb2arbatomv8
	 r7TwKXKtpLeI71pAntaqesMqHm+K1xsw6j3CAV1ZW+f02t8gfUoD4eK7olbeYmhHv8bXX
	 kn8fT5Y3bemYMxabJn5Oc10bMYeWJKO0sxeVk4n0FIKD2M6AxP5f9L0V1ZpGFLz13AQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692658;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=wcjElR7C5kLPwpw6WHFFLZtd5kPi2983/oSMciWIcTI=;
	b=sLobSgAw9e+Q3HUK3fptMjBnvnJOl+lodKcghw6YDR7vhk2uRVxEaXovTxrj/YIGYwyB
	 XIv5oXISgsgaw+Mfmod7CLwyZhc4+GMHPtElZPYop7LF0eNjSAFYxw99aGjwyAgGHAvkc
	 gjVgIltQOun1pqLbCZQjCA0mzwUoXk+1WolM9oEb5AgZ4on0UiCFsdUGhZYx/ZeBVFQ4j
	 ufEPIqk9Ej4upr76gJGssmtfM4xS2f/OSnSz24x98g6+1PdIEoUIO3lDqYQinuYqQdmWP
	 FIrD1Xc7wxA6a0pc8IFYz8D4EHx3KjVoRxZXN/ljzLf6JpsiqjXxgBegMwb8cAQG8CQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=BaioBp6H;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9246C606A327
	for <llvm@lists.linux.dev>; Thu, 26 Nov 2026 11:30:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9246C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=BaioBp6H
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3F2ED4E41798;
	Thu, 26 Nov 2026 11:30:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0352F60237;
	Thu, 26 Nov 2026 11:30:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E075811E6B371;
	Thu, 26 Nov 2026 12:30:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795692649; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wcjElR7C5kLPwpw6WHFFLZtd5kPi2983/oSMciWIcTI=;
	b=BaioBp6Hd94Lv2e9abgFc7GexLy0UnLMrMhCK6dHgROrz3QB84h9nvq0w+dLFiZjdflOaZ
	E5munwHAGyq1FgGYbQU3uScogLACzQ4qB5VPdYGPNU8idE0ZlHfPung0BvJ8t5PNAdZqtx
	CBXNDOqW4BNToGoUAj0qj9w586lGqKUpk3cRpqbu2GGSQSD2GD2BSfIVnpvhUgtM+kFy+F
	ItA0paOufyuWojll79fXO/l07GHnukmKR+mNeGXug4l8aue6/BDki1W/t1/Nh+A1sFdL73
	wBHouXGUmYTyCn4mLtDe6g5lRCb1YLNwrmM5IpgRIcMzsTESMvrIpz++dlV8vA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 26 Nov 2026 12:28:59 +0100
Subject: [PATCH v7 16/43] drm/vkms: Use enabled/disabled instead of 1/0 for
 debug
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
Message-Id: <20261126-vkms-all-config-v7-16-21194cda2468@bootlin.com>
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
 linux-doc@vger.kernel.org, llvm@lists.linux.dev, 
 =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito@redhat.com>
X-Mailer: b4 0.17-dev
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
index e933d61cb526..e2b656723898 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 
 #include <drm/drm_connector.h>
 #include <drm/drm_print.h>
@@ -394,8 +395,8 @@ static int vkms_config_show(struct seq_file *m, void *data)
 
 		vkms_config_for_each_crtc(vkmsdev->config, crtc_cfg) {
 			seq_puts(m, "crtc:\n");
-			seq_printf(m, "\twriteback=%d\n",
-				   vkms_config_crtc_get_writeback(crtc_cfg));
+			seq_printf(m, "\twriteback=%s\n",
+				   str_enabled_disabled(vkms_config_crtc_get_writeback(crtc_cfg)));
 		}
 
 		vkms_config_for_each_encoder(vkmsdev->config, encoder_cfg)

-- 
2.56.0

