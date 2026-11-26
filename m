Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795692617;
	b=oHZPG+hUelNvjZf/DRN+aoIbSu06UkgXEqAKZ0TsieVK4eQkvfCwO+IlmhP1pPUsE/97
	 sdwMpC+L/K7Mv48L1wgFM/ouNr9yGCQxR8oe8FNFhmtT4dmGAWceKtgW3SuHOfuX7laIa
	 z6PXqgKexLzhPnfemupjL0jWmeSHX7uujXDxuVo3drC6oHJ53Zlp7rsDWJoN/29vmW9nE
	 F5C6EhiPi/WbxvDVQfoAgtzFC1100k9yr1y+oLiml1OTBddacgmpTXMsZJpz+pxY/ezBB
	 e1Y5SgO85BJjf4sMnE7e5fVjPYGeyGgeMiwnHWNnaCh5gJiE3yVpRsGjXoRn0LjRzJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692617;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=K79H14QN8yiUYu28AoqZ0UTk4OEZ0WPMraRKucLJFqs=;
	b=G/L+Zdcp/FFla57tJqwtrvTaLbK4DnsvHnI6dPe6iqtG3YyiW2ANzYnqjxLRd5342frh
	 e/5OUaxLT7VjuGH850vWapygKRpd1L1pj8AHYNcP73pCA2PtH1glfhkkDOjjXigjqmXeI
	 AO3dDsW8zfS6Ies2bqA96flx2X+FSYD348QHfrbmGZTZ6l9xn9Ct0CgUyce5RJTxQjhsz
	 zfhUDY+vRgOsOamCBNydDPpQSuvXa/LrMj1jIjs4gXDmKbwgxyr/JEKaaGkBtmp+xsgG/
	 1PahdkQTVzOZAer1nByTK+3dkWDpakVeu26Xig4fuTZ4bYOytGDYNJ2pjjQCwu6Ac6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=uFRKC9MB;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76362606A326
	for <llvm@lists.linux.dev>; Thu, 26 Nov 2026 11:30:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76362606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=uFRKC9MB
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7FF80C2B9C9;
	Thu, 26 Nov 2026 11:30:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3833060237;
	Thu, 26 Nov 2026 11:30:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1B30F11E6B302;
	Thu, 26 Nov 2026 12:30:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795692613; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=K79H14QN8yiUYu28AoqZ0UTk4OEZ0WPMraRKucLJFqs=;
	b=uFRKC9MB4EJe0n9p2mlJAeF325m8VSrEyY1aWxYkuLyT5G3uOyimTSaHBRzNhnCK5+Aj3h
	X1rh+iDoUPjy/7qjS86Iq00JVK8sLo5B1GZloqJnDrryGAX3noD/Yap+Ljgl2zov69dPNW
	aR/H0MGTcX/90XzjbswVlDFbm9HLyC6wRq5UtXlXUxYY5oj8JHgnTd15TfVVad11a5feFB
	AcYWzs4TSFCUbeQ/EYNUVp+St0gnzTt2bO5m9b4kFfHba0kwuGkmyu16YZmQBFio7cZEhn
	Fj3yQjzBCHtqjam7gnPIJ0x+dUDn6+T0hHn3RBIyfwId6mtiz6AKnBvOUE8rCw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 26 Nov 2026 12:28:53 +0100
Subject: [PATCH v7 10/43] drm/vkms: Reset config->dev when the device
 creation fails
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
Message-Id: <20261126-vkms-all-config-v7-10-21194cda2468@bootlin.com>
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

vkms_create() stores the vkms_device in config->dev, but the error paths
after that point free the device (through devres_release_group()) without
clearing the pointer. The configuration then keeps a dangling pointer,
which can be dereferenced later (for example by vkms_destroy() or by the
configfs disable path) once the device is already gone.

Clear config->dev in the out_devres error path so the configuration stays
consistent when the device creation fails.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 28b99511f186..4cbb1173fcc6 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -215,6 +215,7 @@ int vkms_create(struct vkms_config *config)
 
 out_devres:
 	devres_release_group(&fdev->dev, NULL);
+	config->dev = NULL;
 out_unregister:
 	faux_device_destroy(fdev);
 	return ret;

-- 
2.56.0

