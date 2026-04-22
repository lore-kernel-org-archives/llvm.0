Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF8B391834
	for <llvm@lists.linux.dev>; Wed, 22 Apr 2026 16:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776876567; cv=none; b=K+vSlRzY33XI4d60DFOIPJD1WH4HXCpv3gDawhEOJzLhDpCr0PmbSLtASHIYy5v6U5h++prscL91fVE3Urn+PNzvWXF3B1fmCEVZmfwZrQHc8/KfNm3EMnqwK0o00O9KayJpTEZ6mYb8gczyp009SWa3yUq2qrJrd/Fv8IpLCDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776876567; c=relaxed/simple;
	bh=oxr/CF0EOleBJpYQ0o3XQ1eFlhGpl9bHjVK5vcH/zUw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UeI7J6wsFTM4dGM5V9Fmw665dWAlq8MzcgNCPKE3hdaZqsMdxhFiMFZ2xi6rWxdMvtUh7zhUobHpee19fFt67c0JBZmSPI31TWcXhiq9SDLN6Qos+YrQhXlR7Lxw3PYr9Lr+w2SLhhQo5nvc3rupJrCGnfD6Ewr/6a1xnUB6DcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=M9BaU+Fv; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="M9BaU+Fv"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id CFC71C5996A;
	Wed, 22 Apr 2026 16:50:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EDA575FA8F;
	Wed, 22 Apr 2026 16:49:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 602C1104608C5;
	Wed, 22 Apr 2026 18:49:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776876563; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7t4wxccSVE+8YpNtCCYNB6F0KQiLmWtDWy0z8sUDzNs=;
	b=M9BaU+FvN8U2bMp9SzJ8AToYorcPJufjydaBSGGW2ZxUOQk6O81U2Vs58m8weNm0f0ofsT
	PU9n9ZVye03vimv8gsveSGZUUY6/IhWkEXkmE/4Y4bbTjA4gANvYA5B/6a9lcDbJbMrnvP
	fo1YiFwJoOjPlu+pzU4hmU6PsHjgKAUnDfpF4a11KdHWYsD4K0qMscg0KM3yHhfij03+pr
	YKjLgF7MfmltM6fYohlGhGEommi9fTpvHSAs0ycNSp5zzzVk4vVEk1vg2tOAYoxiaNwoz0
	6or+i9rtzHmar2OiYzggpdWA/rvi464JXcmwPixT+K6bnMH+5iFi7IjEatgnew==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 22 Apr 2026 18:48:09 +0200
Subject: [PATCH v4 12/37] drm/vkms: Explicitly display connector status
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260422-vkms-all-config-v4-12-dbb52e9aadc3@bootlin.com>
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

Debug information are mainly read by human, so use full name instead
of raw values for connector status.

Reviewed-by: José Expósito <jose.exposito@redhat.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_config.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index 4c6f3ead51d7..9071d6864d52 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -3,6 +3,7 @@
 #include <linux/slab.h>
 #include <linux/string_choices.h>
 
+#include <drm/drm_connector.h>
 #include <drm/drm_print.h>
 #include <drm/drm_debugfs.h>
 #include <kunit/visibility.h>
@@ -368,8 +369,8 @@ static int vkms_config_show(struct seq_file *m, void *data)
 
 	vkms_config_for_each_connector(vkmsdev->config, connector_cfg) {
 		seq_puts(m, "connector:\n");
-		seq_printf(m, "\tstatus=%d\n",
-			   vkms_config_connector_get_status(connector_cfg));
+		seq_printf(m, "\tstatus=%s\n",
+			   drm_get_connector_status_name(vkms_config_connector_get_status(connector_cfg)));
 	}
 
 	return 0;

-- 
2.54.0

