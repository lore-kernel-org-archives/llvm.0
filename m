Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795197750;
	b=I2MKF/nPHZawvYFKOgtDTscWabaUsUoqVlqf1Oh7pEt0xJX21ozuECKwKc+3pQ81ioXC
	 yfeU6NPOCSAOtu/tSim3ib5RcXdnVm7Yxc//jpGdRfAcbEc3RR1kJlPgAanhdxG8I1BEJ
	 3GWx439XIkq2lCfAr681z1KZWpm5beEfuO29mF6rLUMZvY+aj7zxHxIPK+Ei8xKVgqygf
	 WQXwWlnzJmBCqzu2k+o0ciofC6GHTiyHmfqfX4NYw3S4CBsmhkMcwwVN4X+eGA8uPkCZz
	 2QST7PxVBQ3YDskScG4FDDc8uik1sosmdxZXuVpzuetJybcZ28vA97QcB4hAWteZ54A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795197750;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Last-TLS-Session-Version;
	bh=7P0+2cRxrkChb3DfVM37uRYP+TziXYO8HPZwpGDLF98=;
	b=cW0zPkBUQYSlzYiQWWuH9DxNOUIfcs16xS4HETcVrHYRUPRJJrFuq5LSiFRjYj481vmn
	 1RRMDuWK1P698vk8gdIrH8rtEOjMdgxMNC5PAGmbhk+V8mi0YP5fg4VrR9w3yYjvTXbFc
	 hfP1voIq8RYGf6Yo0aGDzRBdC3f+5B1vQNKvPwYDw1P+jDcVA6wL9CwSCVNxIOarK4vOs
	 jP2BKp8cb0ZGWSC1wEy6oeQIkG2eM7OvOWHYoU2Tc3fliOG92w4ZXk9MZRAhq4xqjmFT4
	 73jtdRPcT4QpPOx0ABrylBjIWDTINRcCUi7OkGC8MuDRpt0xYD02SzKn2VeZfc8W8Vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=vmvY9WAd;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52AB60A2605
	for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 18:02:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A52AB60A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=vmvY9WAd
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5D3554E4168F;
	Fri, 20 Nov 2026 18:02:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2C4DE601B9;
	Fri, 20 Nov 2026 18:02:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 01D8711BC0966;
	Fri, 20 Nov 2026 19:02:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795197740; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7P0+2cRxrkChb3DfVM37uRYP+TziXYO8HPZwpGDLF98=;
	b=vmvY9WAdToBNpOkt7P9/bdvun71y2i8/0YMcZ5he/yAbtT1kCq7k+GgdifdnY+fl77Jd8E
	RsVtT5778G8MapCdAJw1QU2QGTbLVjp2i6OvgcCJPfBCrh509RdYiprsndVpN3aJEcOfhg
	ve9ZQ9kDvcJryAPtKut53uDnJwnmLwpDryqhhQFovdB0Rvwt9jU1mPx8wafitpsWuN42f2
	Y4luioinTDFFrvbeu8Cam13AYU7H36y3w35bta4uCnE1fC+4LvXUsgz1zkb/I3Czg8xfJl
	ASsMNgST/BaqgADWWzHb6bx2uWtn9IMk+/1QY+wqY2mhBp9/kpEl9XxbjXwHhA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 20 Nov 2026 18:58:45 +0100
Subject: [PATCH v6 03/43] drm/vkms: Add new lines for configfs attributes
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
Message-Id: <20261120-vkms-all-config-v6-3-78ace90f4fc1@bootlin.com>
References: <20261120-vkms-all-config-v6-0-78ace90f4fc1@bootlin.com>
In-Reply-To: <20261120-vkms-all-config-v6-0-78ace90f4fc1@bootlin.com>
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
 linux-doc@vger.kernel.org, Simona Vetter <simona.vetter@ffwll.ch>, 
 llvm@lists.linux.dev
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1241;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=3brj4fpJE8oYj+aR6ROHympxczqcJPhBpkeKM+X0dq0=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBrAIr9m0bu+Zpsi30PtIzWrC7STrx+W0UbjKDCS
 jry3EhBg0mJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCawCK/RsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQIK0uxlsQLOIoQw/7B+HjR/yjm+TitgzaZ8E6upbfmfauLAG
 bpZSx/rLWnweFDBijeiC8hBeXFNCIW5Y58YugQ0W4mUGtFEsPxlEg1US1LYmSpQX63f9QT2H4y9
 /Te5DtHgfuSXXP7wY1sLc6l4SjONSveF333BwnGE7MsYVF8OVrDvYpEUGokDi7eLN1OYC8GRrF9
 k6IC3J+62YGeCR4zoxiZ5yaY9j7cr2FO6i+coreh8iAuonsbErVRkTs0sZQi2M47r/jb3LqONYF
 ga/YwZ9xSGbpos3kfWUtqqHhb5A1FeIuUJnxE1TfhntMptVAavIHeokFj03hP7lZINH9nua/D9S
 aePpyuYo9eMZIMS7RUN7d4Ru1lFGpYcCDNXguF8zS5aBUYdeKrWaaEtYvSiuUyibBSVKwIa6lbe
 t3Up2UiVuIMCEAKT2dHwgPQ9TP8y5f0S1QhjHJ4RRPY4NxEZoEVW+0L9lHd2Av0LNizIpO7NQ9h
 arLKjAg51wYPQfz2qGTF07GhoVNwq442AZef4hgfcVLKq6wVO7rQWzRa8szSQSCc7w8pOBZ7p0e
 3f1NQBpspcAyvaEiAU56WgGLJoS9VSHd0X1aq/DZp5VV6UbvduSrlRajBE8/sot45I1HnfkJkpA
 0RRNgkPQ6OcEEr0mcSCjy9KGmScMa/lPp7QPabMou4ZFpN+hyPzM=
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-Last-TLS-Session-Version: TLSv1.3

To uniformize the configfs attributes, add a trailing new line to the
plane type and connector status values.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_configfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index 707cf3578e2d..5f5aa0a1812b 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -294,7 +294,7 @@ static ssize_t plane_type_show(struct config_item *item, char *page)
 	scoped_guard(mutex, &plane->dev->config->lock)
 		type = vkms_config_plane_get_type(plane->config);
 
-	return sprintf(page, "%u", type);
+	return sprintf(page, "%u\n", type);
 }
 
 static ssize_t plane_type_store(struct config_item *item, const char *page,
@@ -527,7 +527,7 @@ static ssize_t connector_status_show(struct config_item *item, char *page)
 	scoped_guard(mutex, &connector->dev->config->lock)
 		status = vkms_config_connector_get_status(connector->config);
 
-	return sprintf(page, "%u", status);
+	return sprintf(page, "%u\n", status);
 }
 
 static ssize_t connector_status_store(struct config_item *item,

-- 
2.56.0

