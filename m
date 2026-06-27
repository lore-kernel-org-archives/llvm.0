Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD03314B9D
	for <llvm@lists.linux.dev>; Sat, 27 Jun 2026 03:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782531081; cv=none; b=NWuApD+8sXFZUeruZmKzXt+xQue/xTzHn5DcmK2XHNXvu0N1y4NEHu2iQrOhk09q3Tr1FDrORoMhZ2hOTay+59BAHKh5/eKftkf5shfHAqTn7x4oujbNsti8FDwuDOR3GuHCjp7LJFNc6TEUm+kQAYKBFhZcU+JIz7AA5wUe+EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782531081; c=relaxed/simple;
	bh=IPPO/N5KzxecIhN7sCv6ZygxjxmYOy9rXkt7EwU9Nd0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dt+QaYHn/KDhDnn07LKsoAb3mBAenm9IU46uRxBh6mRrI4Y1JhOlM03IcHU0Cd/SJD2+Sr3OaTcLKsjDik9QQ3jfG0kpBbHDAUBwDZbIu+YaM8st0lrC1FZqDhJr/bwNW7rwR5eJfik9ZtehjgePO8iXirRJ1/XXItBnsOkXIl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=nK/TaRkR; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="nK/TaRkR"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 605EE1A0A15;
	Sat, 27 Jun 2026 03:31:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3328460233;
	Sat, 27 Jun 2026 03:31:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 544C4106F1171;
	Sat, 27 Jun 2026 05:31:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782531075; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ny8jovS05Cy6acIMNd4HSb4i/Bq9Nh8qF6KY1lLItU0=;
	b=nK/TaRkRBR4iHTyxBMNWCYJ4T4wYBJiZ6oxhWaqyKa+JsJzKvUlCxHRT0H3GtDaI+8qsy1
	Gq4W52Myn/x1C0cxsE8x+Eyu1dpzs7hOlB9bSBso9seiIeJSMDExKTkzjw3yz/ct5kFYsE
	nYwX+dHMymwqHwHdJgG0kenPmwlwTcYgrVIJNw6HWaLV/qMxbdfdbNUOqoKhVnqnwWQ0mG
	4ieZlcpNmIc6bi6Too946ntl3dO18rdMpal6CYpDjMuLeTQI8SnoeH5tt7Dcd03rTSaFd5
	gFcVI29aKYtsOwbRK1dxjRwX0O72FZdirw8uWrGj+LdE1WfyE3apNryDlHnRyw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Sat, 27 Jun 2026 05:30:28 +0200
Subject: [PATCH v5 11/38] drm/vkms: Use enabled/disabled instead of 1/0 for
 debug
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260627-vkms-all-config-v5-11-854aa0840926@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1207;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=IPPO/N5KzxecIhN7sCv6ZygxjxmYOy9rXkt7EwU9Nd0=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBqP0PeYbFNR/zDAOgcy6qf+LVqKQj2Ych5s1YSA
 J+rWbfD3K6JAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaj9D3hsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQIK0uxlsQLOJGjA//flEtStMdS9irHvAdw1FQN5JOQrLHfIe
 Yd7Y+jYRXU2QrzjWnFQrnuaIWI6EY3GKaP6mZ4eYfkgpkTGD/GFZRUpEKoQSSg0jhwxvWL7Thss
 X0d7ar+wsCtXmlHa0ejgFOZcZWevu6mNpRpMyv0CdxjzRlp+O1/yyL/CG9gQZ1xYwuEiNG9vqGx
 6fhhvlSgVMEBTB0pXQUEvDheBWKashnwrmRInTLpMQo7XybZwfmi7UvK6TEVbTcgWsFnIe4y2AX
 BvhWp3YQcleNjD7/GHr66xy38y5d/DxAI4S+79m9v2j632cHT3QXLq9y9CnKEHE3hM2evLYEWgS
 VlRCBiSpyNZRPuWLIN2lTfhu8TNj49jg/8MyRdnpom7lMMiy6hLQ3TRqxKie4wgMd4LFQCBoZYB
 ErkIgh/vKX1phNa5i9i0LgQ3Af2XC8+ogtiX0/QK2kh5ey86Uu4XZGBHQBsAwh4p7gU07USel4D
 /03nltywZu/roLt9RKqls4lTiVw0tVcsuvC+GAay02lZ+8x5GZiUAz042+VngKKiG3xDU713Vh5
 BYo/oeg+GH611Fi+yAaYpioBBSke0IJ3jgdKvkq31UqsIiY5dLZlh3uXfL8juboGXf7gUxYCtdb
 1HPmRABPQLuAfYxkpxqHwuSgdA+s9xDHQ4Ox7QzuGbtxEgENN2VY=
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
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

