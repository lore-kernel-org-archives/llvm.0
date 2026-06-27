Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CB63264D5
	for <llvm@lists.linux.dev>; Sat, 27 Jun 2026 03:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782531088; cv=none; b=VqyE0B0acQTWeawGtG2sdwt0KSwts5ZDeq4Cz4EMmezwd3+nDOI8g6Q87tI1ONYISzkfHp8QqJz57hn2RHFVe4Q7ZP3QMfUKUjJxkloe/eOon4OkHbtaGsf4ctjV/n0pl2+AGmgX8nXzY+VNMu8Pgvwd3jh9tRajxNHwcZ4BCV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782531088; c=relaxed/simple;
	bh=XiKwAPRa/+NQm3DU+qGiwJ/34hsXkmvGjxyX2KcisQ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dPfXGe3Ync9KT5u2f7ioVwXKzW55bfDmkqjwk2Fo3vNg44FN7/QGbmUs14NZwcKsoXDnLMhofs4cuPOovZJF3tl0wGOr6vZQwbHyb1GvbX9GdD9Dc+9g4xZkuVJS4SNnmP4xyA0rZ7n7M06AdN08VVIYHwQQNJUm15/MPTQgAbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ULXNSJzH; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ULXNSJzH"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id ABA524E409ED;
	Sat, 27 Jun 2026 03:31:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7F94360233;
	Sat, 27 Jun 2026 03:31:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AF6A7106F1170;
	Sat, 27 Jun 2026 05:31:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782531083; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=enjP3ecSS4QzsDh23km0Yhkh9WtnM49/1mdnYB1P4Io=;
	b=ULXNSJzHOLol9rJxXzejdSV18o4ococAqqOi8hr0ijk8s1vJFavK5KKH3uDHtl9DVX70xY
	Tls02ebaj06ZXvEqdPjVdPD8hNfZ3dwim4tn/oWjD2SN8QEqKQQAGiZsva6sylDMp+l860
	A5+JjpHbc+Gsn6ElckCFG1gO+gbzVyr4/y/hIM48GFvC57Z4EqSi+rwLct2oRuhcPo2hM8
	NqREB7zQ85Ajdv+Mha9qd98w7tMcJPdZsZ9Lpc0Svyy7DYVkFpPXx3qIH7ajdaVEvpcpyl
	4jlQDlr6Ez8Ua2gNx4OUJG5v7B/HMrH6OuhZ47fnYNxzhMt30eDHNV+kdmwHpQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Sat, 27 Jun 2026 05:30:31 +0200
Subject: [PATCH v5 14/38] drm/vkms: Use plane folder name as plane name
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260627-vkms-all-config-v5-14-854aa0840926@bootlin.com>
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
 Louis Chauvet <louis.chauvet@bootlin.com>, llvm@lists.linux.dev
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1013;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=XiKwAPRa/+NQm3DU+qGiwJ/34hsXkmvGjxyX2KcisQ4=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBqP0PeBSZa/Q5LZrxCv8vC3cSZ+TH2Lb88ejFEz
 9FxZtUMnUCJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaj9D3hsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQIK0uxlsQLOJGLRAAg/uGvBHH9KsgxvsyhNZ8WI2nL1GeuCJ
 1m+Qv668EUWQuRK7GWAigdDVfTA5e4z8M65EZ1ZgLta/3RQkcDzzGIm2cLAmkHTLyuDbJz8Sxaz
 dxXtydRBA1S9aCWr0aiMmfbyanc2n+eiS2Io1QZnf/CCUJJQt7HY2cTYkdhlgoP41kvHhbDh/88
 hdDCJ7ogtdtlZq63ZqEXBnnMi8HsSrimjJkG3vsXW5iupgG8ife77VkiQJ8sKOYl+ZbDdXPJOwN
 5zVGwSH7cGAgwiFA8oC9xgMEW7n9BDXEiL02FwyLCZ+tlAedn2NWWtRFsyKfswuSZml+YPtQ6U8
 CvEeG3RK/c6c8kKk1ql9xUiaUmHIDAGUDm/htKVALSNw85c8vTZ6n7ho6MNlG5TsltcdsYF2rMJ
 6vj2S1JA8h8xK93dO0yjzI4ce4hSvcKuxx5Mcxp1mTpne6cb9+xuvhlOiQhRSk9zYkEf5Nqf2vf
 ojBYmW7RE54B1KE7vhxEN9hUVs0EI1fxb8fDijZwWjpW6g9O7204kzyqDhyN9U6IkW0MposN/JX
 kryBJX9RgveTXrtC4NQJwb8t/idyWStkW4Uta6mXzp+E4LZ/uKYj8ODew/zOrCdzUO93wriojiw
 /pSz7v3G1aF4Ih8oyejo2w/ZiVmKablzHw0l+ka81ZxfwykoSA3g=
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-Last-TLS-Session-Version: TLSv1.3

The plane name is now directly derived from the configfs folder
name. When a plane directory is created under
/config/vkms/<device>/planes/, the folder name is used as the
plane name via vkms_config_plane_set_name.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_configfs.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index 97f87a53d202..0744ac40814d 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -377,6 +377,12 @@ static struct config_group *make_plane_group(struct config_group *group,
 			return ERR_PTR(ret);
 		}
 
+		ret = vkms_config_plane_set_name(plane->config, name, strlen(name));
+		if (ret) {
+			kfree(plane);
+			return ERR_PTR(ret);
+		}
+
 		config_group_init_type_name(&plane->group, name, &plane_item_type);
 
 		config_group_init_type_name(&plane->possible_crtcs_group,

-- 
2.54.0

