Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795692639;
	b=yV0i7Ia1Vwn/DG5zjqLGB8TGB6Me9eB2bTY0BpnCAbJUnTz6w3WDS14hHQZV35b7B57Q
	 TZqwAsYgjfXJD1fDxVk1Z7Snir8bRymz6UO3TXuJ1AIU8F9onwGCxtBPpZYrVZ3PmZWWT
	 FSWwPuqC0TINE4t4X3L0k77gmu9VQqMA13N7smEGkfoiGPM80dpFr38MlAcVIvui8UK3C
	 SCJ6CIkGL//9VakXqp37JEoj0aDnRxHsKS8xj+j2ECVt4GBUt8YI8q2dVYi0IuKtwa9IQ
	 b5S8ZAXYFePAgmM3+AJc8hdQWnl10k1gUzTqKw72a4hbz+ZvdAFzNmPtFSM1vo3PIuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692639;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=kNWbgG1NcKqDCdeyb2r5j7Nmki8UuEQN0RHaJLzY5Nc=;
	b=Ge7rSZrbtWWc6jggrLDPfau7GzZ3PMf9eYTU9cPy6B3aPvRSTArzN7ScTbf7EwMCWY7L
	 VnRCZw0ycxJ+Nn9JufgDZE9OsvhC/Eo363lYKgWDJvOILOOckUYRIOXWydu6KuhexVFKn
	 JxvfjeBmeC+hUnacpsx0EonhmW2GEauDNOLSCquAez1VAy4zlVBeFJ2Mjmfqk9J7lJxho
	 N41UFXo7d1pwqv5z6teCgv7ocxRrWeff1I5yxyjZX8ZfKC0c+Ehb3G8M3z5uI2j6xe67F
	 HFSL1o2cA1dvwj+i312iTUNYmbMlauM6tqOqHhFFTjs/HG3VLZYVLTQfQXAjktiZbZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=BXE6u9DJ;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7FB606A32C
	for <llvm@lists.linux.dev>; Thu, 26 Nov 2026 11:30:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E7FB606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=BXE6u9DJ
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C9D4A1A1808;
	Thu, 26 Nov 2026 11:30:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9D99660237;
	Thu, 26 Nov 2026 11:30:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BF63E11E6B302;
	Thu, 26 Nov 2026 12:30:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795692635; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kNWbgG1NcKqDCdeyb2r5j7Nmki8UuEQN0RHaJLzY5Nc=;
	b=BXE6u9DJFOFCR9Rjn5UFGe3N3tbbehfthjoDA5iP91qY0pmSn+VttOc7k+J8pD1qHQLkZ+
	AM7WTBLkcY1PjmUK0TR1rsAT1F8qTn/25E1I3IG/bw6SnXMvctdMJ/oxXUB0erGamxcBv6
	GHXd5NOgmHSy+NnGr0EUVOy11Cc1CXsTtH5Zm01uAJtlSV4As+ASgdwzxbhF5rNog3XWeV
	kjPWArbHUegUMuNFiYbz3UMNFkH2VNK7Nd1BMsiKGaVzAQ1iF5t9BZfO7ElEcZaa86bWcG
	3P/EFyoVn9KEFUZKpYkzbekNhm6YGhdAJb5Gr9qMRFAI4hPaV1WOtBoOzdFpYQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 26 Nov 2026 12:28:57 +0100
Subject: [PATCH v7 14/43] drm/vkms: Simplify plane_release code
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
Message-Id: <20261126-vkms-all-config-v7-14-21194cda2468@bootlin.com>
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

plane_release  code used multiple intermediate variable, remove those in
favor of direct access.

Reviewed-by: Oarora Etimis <oaroraetimis@gmail.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_configfs.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index 6bb24f5835db..c57791df72cb 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -331,13 +331,9 @@ static struct configfs_attribute *plane_item_attrs[] = {
 
 static void plane_release(struct config_item *item)
 {
-	struct vkms_configfs_plane *plane;
-	struct mutex *lock;
-
-	plane = plane_item_to_vkms_configfs_plane(item);
-	lock = &plane->dev->config->lock;
+	struct vkms_configfs_plane *plane = plane_item_to_vkms_configfs_plane(item);
 
-	scoped_guard(mutex, lock) {
+	scoped_guard(mutex, &plane->dev->config->lock) {
 		vkms_config_destroy_plane(plane->config);
 		kfree(plane);
 	}

-- 
2.56.0

