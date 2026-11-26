Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795692790;
	b=gO8bFso5c27FPrBWWtwVUz5pFWrxCwMEUJ4ZIHI6CRtzfMtY9V0BKzbzc5tcT9kBAYlc
	 5Kmt5TYk/yrsdaOp2AsBNKHr/8oNEJlWuO+V1j+DIlKFDibNoIcL1Sm+6qLWVTcDB6BGg
	 gUa4Na+178AzYy/pOchrgqqcGi3uVJlrie69uBB67aaMAyQGsX73zVAejkjUNlqzxlZ0a
	 /EqoF/mXEYqZMSc9atgiQ4MzcBA9YA992T4cOXW2erbSWC8TEwX+/fDsuYK8TpmX6CHc+
	 WKoYlSjTZXR5zvjLOvW/gfW1Pkb3g11lf0KqyeUdTfXoU255GvIP2VT5lzRsM6fGLug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692790;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=HcZYN+0nVlYKfBZGN31LiTTkAVXLhb8xr5AitK2Y6og=;
	b=jf52Jaqj+/VXhd3UmeS8kv5MHwxvD20twSDZMowIFKd94Jr27qN7oWUYZ1G2fZl9a5j+
	 NJqc2v65lTxO22nhRyi66IYRrZJUqubr2Fp36yxOSVAc67Oy8h9QEnI0HmGXzGR9K3y/X
	 VwZ4Xps5Tq48WBuoVh+078/xAD7jNT+FkY3DhGa4MncdpIC1Li5qMgirZPeiw7nVcQRLB
	 97C6KTPsL+FTCvSSybALfxvCIB5x4B0L0IAtHf+KAXWozNsX1+os8jUfRkQgr7ZMRb3/U
	 iCCuBxp0SACuvUbdB5mCkDUC0hesRcinKTRf5/kosebOmZ44MTW+8cm4UhZeOMJy6fQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=jIPlMfSu;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DE3606A32D
	for <llvm@lists.linux.dev>; Thu, 26 Nov 2026 11:33:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47DE3606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=jIPlMfSu
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 04B834E4179C;
	Thu, 26 Nov 2026 11:33:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C6A7860237;
	Thu, 26 Nov 2026 11:33:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3A47211E6B302;
	Thu, 26 Nov 2026 12:33:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795692786; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=HcZYN+0nVlYKfBZGN31LiTTkAVXLhb8xr5AitK2Y6og=;
	b=jIPlMfSu3d8nV/nWkSCemMU4skok6+yBWOmy55OlGon8lEC+p0i5QUlA0U4RytNCKzRRcI
	kwWMVdMbXokZzINMUUqmRN6Pcm6fbggxiHmzWAQTc32SQFJHQH0N/24FOepjsTjKNUISJ7
	0JRn0P51/c00vpFJiTpI5p9vi/Bm/b8M7mbl3nSkMzgthut87cBtA18CUl8iBXcVqVIwa/
	A0mW3xeedN5c8RpTBjWux3pexgILR8XY/OBI2AKI1FSx0sF9n9jwtwcJOi3wmN+GNCJ3cZ
	NB5OmcR0lBToDXnrSI7TRprmVVxzq7znbRKhe5klH5m6LkI51z0fH3PmVsc6cg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 26 Nov 2026 12:29:22 +0100
Subject: [PATCH v7 39/43] drm/connector: Add a way to detach encoders
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-vkms-all-config-v7-39-21194cda2468@bootlin.com>
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

As vkms can fully configure dynamic connectors at runtime, add a clean way
to detach encoder from a connector.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/drm_connector.c | 17 +++++++++++++++++
 include/drm/drm_connector.h     |  2 ++
 2 files changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index e604d9ea3058..8704df140f2f 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -837,6 +837,23 @@ int drm_connector_attach_encoder(struct drm_connector *connector,
 }
 EXPORT_SYMBOL(drm_connector_attach_encoder);
 
+/**
+ * drm_connector_detach_encoder - detach an encoder from a connector
+ * @connector: connector to detach
+ * @encoder: encoder to detach @connector from
+ *
+ * Returns:
+ * Zero on success, negative errno on failure.
+ */
+int drm_connector_detach_encoder(struct drm_connector *connector,
+				 struct drm_encoder *encoder)
+{
+	connector->possible_encoders &= ~drm_encoder_mask(encoder);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_connector_detach_encoder);
+
 /**
  * drm_connector_has_possible_encoder - check if the connector and encoder are
  * associated with each other
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 07218ab26c9e..532ec08d0017 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -2758,6 +2758,8 @@ int drm_connector_dynamic_register(struct drm_connector *connector);
 void drm_connector_unregister(struct drm_connector *connector);
 int drm_connector_attach_encoder(struct drm_connector *connector,
 				      struct drm_encoder *encoder);
+int drm_connector_detach_encoder(struct drm_connector *connector,
+				 struct drm_encoder *encoder);
 
 void drm_connector_cleanup(struct drm_connector *connector);
 

-- 
2.56.0

