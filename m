Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795692649;
	b=o77u7iLonODN1tFdNIsNvJlwlxTXbs3AdzFMKjcg2yyPT0XZCCWAlzMiNziusr7EZY0v
	 /MhkrTw+pZIM9jy4qBL2PJYX+VgUEfn+AXIS5UssUCixttIcMLbhayWVEnO1K8Weo94mr
	 LlOHdavq7SZKq0mtnHXZ5/6naBj+YqtTx7sPc0XeOB5AI3HNsUO4uMSaLIUKourK135VF
	 mL5lIfFc82lzuZBKig2Y1nPAWIMoK213TD5U8Zv3+jHLT+EtZzG7QEx7ty4p/4HSwSzk1
	 ZeArtu3ZUVpa7yy5sZ39RKeCfoUHES8DKjvJhe8CwCnEpigjkUQk7WJbaKvk3sDmaEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692649;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=/7MS9J+9UjzSfC1l1hCVLtNdoQD8d0wRm2L8O23PiA4=;
	b=ODve8J7PWj2IiFFF/RUz/4+I3ipE6EO0agLYDY1YQ8I5wpNfDWWyAwZxF5JbJ/jUrKSx
	 oF45or18+8AHHwAkd91x67OmNG+nDFcixnVGcF8LdtI/QPAarLyPkEzU9Mwo2XoDLy5UB
	 Ws7cniPVY2cLq6XhL8C5WTfV3qCvhwXC4WS5gxQuBkrVJKdCAc77CoSZezUmpBehYRD+y
	 dxMueXxCh2+n06hyQWBR8u/cLqFx5UCVmzXlLRA4DLdzYM5vtBS+t4FtQaqK7JGkjsAYx
	 3a5Y6HxllIdEnK2GjvZeyxVw4dAIMfSLEfF67QYqXjQ8k9hhsq9QBkvUoMX3P8L3h8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=HcGuaTJ6;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1398F606A323
	for <llvm@lists.linux.dev>; Thu, 26 Nov 2026 11:30:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1398F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=HcGuaTJ6
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C03821A1808;
	Thu, 26 Nov 2026 11:30:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8B0C560237;
	Thu, 26 Nov 2026 11:30:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 402BF11E6B324;
	Thu, 26 Nov 2026 12:30:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795692640; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/7MS9J+9UjzSfC1l1hCVLtNdoQD8d0wRm2L8O23PiA4=;
	b=HcGuaTJ6n6oDtDGuxZ0SQ6kQ3dUru2+qHG0DxR6aRfEui7QL3gTx23iZYKZpQ3CDK3D8vK
	mEkC5HkSsbUu9XFWtb9p5XOpwB1wzPGPvik+iJarX6aJGiNqGiZVFDEu1/XPlE4x9YrNfw
	pxpsqkV++11Vn7oIo+C86YwLZo3IAQ96gNJHaruz1Q/TM/G4ls1MLZDElaPQDEDFwQ7/RD
	4mq06iCVAjwSrGRE2ph+jzH9f9N/6rFAZvQ5iE537LAtDyG/kKBgr3tmMDDEZAWRJSISYN
	zVhA9E15nB+4yk3IvdGpv9AtIUAZ+dYakEwYzNFEHWTLs7KdJpvg8+CeLZukqg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 26 Nov 2026 12:28:58 +0100
Subject: [PATCH v7 15/43] drm/vkms: Explicitly display plane type
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
Message-Id: <20261126-vkms-all-config-v7-15-21194cda2468@bootlin.com>
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

Debug information are mainly read by human, so use full name instead
of values.

Reviewed-by: José Expósito <jose.exposito@redhat.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_config.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index c5d90f7e934a..e933d61cb526 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -388,8 +388,8 @@ static int vkms_config_show(struct seq_file *m, void *data)
 
 		vkms_config_for_each_plane(vkmsdev->config, plane_cfg) {
 			seq_puts(m, "plane:\n");
-			seq_printf(m, "\ttype=%d\n",
-				   vkms_config_plane_get_type(plane_cfg));
+			seq_printf(m, "\ttype=%s\n",
+				   drm_get_plane_type_name(vkms_config_plane_get_type(plane_cfg)));
 		}
 
 		vkms_config_for_each_crtc(vkmsdev->config, crtc_cfg) {

-- 
2.56.0

