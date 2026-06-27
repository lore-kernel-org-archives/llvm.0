Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73062777F3
	for <llvm@lists.linux.dev>; Sat, 27 Jun 2026 03:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782531077; cv=none; b=sJq4TOeT4OOB6vX5TcLFZ/SCqbEy07qN1V6vD4INM/HXMqKhvhFTeBLVW9Kb1QdVAScripe+D6zksX4091tG0JxuVjzlI52QapCk4RqROQGLcWjV0MeBF3p4HLf3gD94G1vCUbo5RWJmsScgV0XjKOVYqPFIMbGZip9DLJI+1Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782531077; c=relaxed/simple;
	bh=QatXxbwayl7ekIDPzWMFO8AtbyZH8hv2oADcMdSEKVg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZTiJ05mzkmozeF1j0X9242lFP5Ov7sTo9lAAlOKa1Qi1e0GgIkM+qZA+7SaoE6jzwmVnVEl+1MBm+RP4I3HBraVnTmDO6Oh71Ffgyl7McyCDMBwQiDljbJTQnw9/mVdnDTZSY2glkIBRiktq+cXSWZwxnSp5tO3c49kHsxvXFOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YB+KBu30; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YB+KBu30"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 81855C5CD76;
	Sat, 27 Jun 2026 03:31:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6DE4960233;
	Sat, 27 Jun 2026 03:31:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E3937106F1176;
	Sat, 27 Jun 2026 05:31:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782531073; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ODS/KcKkaJlG9a45UpwMB6wA5ib5OPfBDYu35wZafPw=;
	b=YB+KBu30ZPq3ZtHw8VeMofiuEZIoVi/2X+Nuh7jiy+PaGre0DdmG0FQAvQ40kKvSIA0vD5
	GaNXUmlKY7s0j+tvAuh15LXqLXvnW1zTiP3QeYqWggOXPg1dXvDzqFFYsmOKnfsJ1bs+yP
	n/s8oJ57SN7zLbGWy4HxTiM9N3OKQ3adTi3ReDFA2oFHsSKfgq5x1ELF8kD5CbxRKs93ib
	zn0q/TU3rawkhtSoGigkHqeaygvjooQFJi/ZCc8oh0AnAQK265dJdFbYJFWOFPvIQPwWkh
	pQI7VZF2YPmvb87SBHg4uwBuzBUQ1rgQVyHRaWXX4deFg4Neg/RtHcimBs/zdQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Sat, 27 Jun 2026 05:30:27 +0200
Subject: [PATCH v5 10/38] drm/vkms: Explicitly display plane type
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260627-vkms-all-config-v5-10-854aa0840926@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1010;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=QatXxbwayl7ekIDPzWMFO8AtbyZH8hv2oADcMdSEKVg=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBqP0PdNyCKzo5+Pqv7awnU62rGPxflbvcYSPcpC
 BsXxW6u5qKJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaj9D3RsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQIK0uxlsQLOJhrw/9HN97IeB1bHNm6RJCKgwALzDcvVJy8jn
 P18clTb8ozTwcU1qvq0ovPhgYNXpMkRKcMclyvaRY83BY8V9/XdaM4ROJIrF/S4ws6rl8OTukEP
 dE8x0NKUKe52SsuWV+BXymPVGwIpWCmiTVykMsO6moqBQVzkNB70N8u0X7tTDCqn4Sh2jWNlFi2
 J5N8v3o8TZr+xpxEcMBXR+IXPwpZXgxyk8RlwSzYZUPziAgBc30nc3I+Jj2TmLtnphdzl/HmHot
 mtEbeAXkMzCZMP0ot7/dYVC7WLRUlJVJ+Bmjnsz9tWA8M1CQz0+eIFnDLu8tXch/aEZv9ekueca
 XnhnaMM3fLem+fmFdggYSRXrmQkIMCP8bwdFr3QxwLER7SJPVgo4vReqB2EkJZ8oQkO6VJkNO1q
 o5eN+4hOnTrXqv3vPQm1+Q5bV1PuTMpeEr+iQInFCmXKI97mTbh4n+hELQ7/X7fFU9eksPpvzK5
 Q0jFshlgtgwqSh1mPX41LIaZH4QG8SqiBSyMTtxx9J6kB1etTYewjavGwzBB4ejqlkJeacFdNtU
 IDqHIWqrwZf1Xe19RlmxMBXtA0BAEZDowcsrdG03xE952tDuL0QMx2hLlEtk7kFA2pC3Bp6NDD3
 z3o8ekI6MA85AkoaX9JDz+IgcDs5ZwyFhY9OXFNrSXcU3p8MJeaA=
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
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
index 1fd2ed1167c5..469c57c6d1e8 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -352,8 +352,8 @@ static int vkms_config_show(struct seq_file *m, void *data)
 
 	vkms_config_for_each_plane(vkmsdev->config, plane_cfg) {
 		seq_puts(m, "plane:\n");
-		seq_printf(m, "\ttype=%d\n",
-			   vkms_config_plane_get_type(plane_cfg));
+		seq_printf(m, "\ttype=%s\n",
+			   drm_get_plane_type_name(vkms_config_plane_get_type(plane_cfg)));
 	}
 
 	vkms_config_for_each_crtc(vkmsdev->config, crtc_cfg) {

-- 
2.54.0

