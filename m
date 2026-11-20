Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795197807;
	b=spi/sQfSAi/WopIL5ZVF0NgSivexB3VegodXWMdSWA0ue3fuTD7pd+l9QN9C4+9pkwLM
	 kR2oS98ke6BhhkMcZpzYBgET2cozYMljL2FQQUrJngPMEBh5yiDsdxqv7KhSPSeYR2Qhn
	 Oew5QqCUcO6r02qafvGi0QszpUmLR0WQceh68Oxn6O96pPH6uACqSm/eZURMS/w1pUM0d
	 8en6fgIufjgCb3KzXCzCEahryMRBoIkooaJ7ncnjXxbYIxqgYFz5Ca6j+vLKWaMlMaDVA
	 IkZA8WiPEU4J/Sfn8zGu5ywVzUfzMIte9Lx96v9S4uu+zxspSiKH6RW41atHa38UGrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795197807;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Last-TLS-Session-Version;
	bh=jnkKs0+up5lrFYe1Oim7ogbQWXU09e//bUPUUYHusCs=;
	b=FuOw5Udl1h8RClhn/AN0ZlM+KS6tqoDimUWSRzJVkJ0cJWRbSqvbNEXjR5Db1fSIcoMa
	 ao1ok8Wy0VEqaqd7tKDtTPcPSd34PAUw10YqSE4WqyoljlVlEhxWVWWkBZ93DzUuS+SOY
	 1SsUs8jApzpR5r+rvQGxwp455du7lXTS2z7ZwmD/L4p7WpT/XpG9/oG4h88CDPZ8XSNgw
	 1s1ERi3ILHz73Qnsy+ZhVLIEdshMUnh7PcdybRSWXbEFQCFA96ocwWDyiUDmQop+R3AhW
	 Sl8JQ+QlQ0mCqm8y21bYUbt62IxXqglPVh9VU/GOpVMjLorYCBw6l6ePtXlHsr2ca6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=apH7UwL2;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D86860A2629
	for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 18:03:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D86860A2629
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=apH7UwL2
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1A48E4E4168E;
	Fri, 20 Nov 2026 18:03:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E1EC3601B9;
	Fri, 20 Nov 2026 18:03:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 444EC11BC0966;
	Fri, 20 Nov 2026 19:03:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795197794; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jnkKs0+up5lrFYe1Oim7ogbQWXU09e//bUPUUYHusCs=;
	b=apH7UwL21NHkvjv8hj5EhlVeYAdNlFK6IsriVTNc8bfVGn+0tT45D7XxDqrMI+a0chcZBO
	WXf4RH+pGoMRWI9xFk/7u8QvpNZx7I4bSRsc+o9SjLEMz4wwreOWDeH4MaTRtRbL4LelDB
	UN7V6BdKSsw9+BkignHWSUFhWyOIkoh1HPuXWN1cNBuvdGREezvvhobqV5KKyXT2tXbMPe
	2NRIcjY3DUhKBN6QBUSeZuZopXNezkEWV0wd7FPSGb5o7H1GA5wIY45L2OCP70ZOqr2ZrY
	WrFNUaT6xqoNxxeRMzMvVRSvjLVkP2XqO3UvFTiuzuxcB9z3bzCVMDLiPKfeyg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 20 Nov 2026 18:58:51 +0100
Subject: [PATCH v6 09/43] drm/connector: Export drm_get_colorspace_name
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
Message-Id: <20261120-vkms-all-config-v6-9-78ace90f4fc1@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=723;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=vfU4yZNMDpId5NOe4KmSIDzNmpIpA95FoT7a6v1cL0k=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBrAIr+gRIhOMJwzv24WCOv86mjS/m29fG0hrHS8
 5E8jM1aW22JAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCawCK/hsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQIK0uxlsQLOKzXw/9HAWG1xHkNJbkzmKiEpKa20K4LRL2XzF
 vNM7dN7k43DgbJ/7d02PfrnYhgYeMK5J+wyrXp+fOwLF3rkGPzzHDWGL6F+noyvDviz3Il8nMwN
 J917aO7NVrVBkE9sC1jPV4CwibmdBJIWWOk32FTyvwIX/XiwBWAEeC2Cq2NLMzEvd4RvCEw4Y9z
 0/EqM+kFiWsUaYmv4XUhqC4Jlg/ZmMhlbxhNXqKuCZZjzBAmyEavN7Ws2lgRFL7OnzuCh0078nQ
 cVC+71xjpH0KvmPySGcRuU6wLirxQ5Pg8xQlt3//qZXP1feUnamTKbo+gShvB9IAj5ZA2lpqF6+
 5V5zceRQ9/Ny9Affxl8CC7gFC5aUYknET7MGWgkd3/J1DsgTgewjsE+9Cqqr8/fs1a0KIaRWImD
 yIHXZe7uhoWN/ugDTYFZq8qeRdzpVQ3zwh/ZJqS8ps19eceMcBz7raBqZZnYxe+bPNrguOhkxs9
 DDFas5vfeHxn5yVy7DJhMbduIy3H/UIYTdhAV+IFEHOC+r6681j2XtVNpKKvCYz7KvAVhcxnf5c
 pS3/R0QOG3X2SvxjbJ1wCl6jCuEskB7ntKLEIq/Mgzs/nLvu4g1YuHYz2V3UXdm38vjIv4B89PH
 +MeaWuSvA9pjU4rPYuRT6Nc5AxFzMDZv02dtrLsmmMZ+h10qsBNM=
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-Last-TLS-Session-Version: TLSv1.3

Export drm_get_colorspace_name so it could be used by VKMS

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/drm_connector.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index d66188521881..fbff5871355d 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -1528,6 +1528,7 @@ const char *drm_get_colorspace_name(enum drm_colorspace colorspace)
 	else
 		return "(null)";
 }
+EXPORT_SYMBOL(drm_get_colorspace_name);
 
 static const u32 hdmi_colorspaces =
 	BIT(DRM_MODE_COLORIMETRY_SMPTE_170M_YCC) |

-- 
2.56.0

