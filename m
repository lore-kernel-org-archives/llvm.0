Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE52137923
	for <llvm@lists.linux.dev>; Sat, 27 Jun 2026 03:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782531072; cv=none; b=US+RnhJKuJ0paTunjeLgB5wgqrB0IEK1hnP8Oaopra02x3LxEL1oRnS1gh39KUleWyhT21aNSm/ogQ+i4pKjvvZpj9t0RvLeKx0ZOJEq3vkzQjz0HPUgQNaF9ZRe0xL4buzuB41MriJc7VfYiKsfOGLUcH8oNcKJAvTPxkG7nmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782531072; c=relaxed/simple;
	bh=CoH2QFykQYAmJn0tr7ysysk8Njb0yaSHRh3FWL0Wc/k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X1C53+kgpAohXQcbplZVmwph2zxNbo6QdGCWmzUV46jP3O1YehyaAv0hYdrRytOkejj3tkB56vQihieaRw6JWCwzd/ArloUnMYDxr7uMD6DZLlzyLc43GXA8ojs7QEHBNhoreAb0qT5/INzkKZQm8eK6054ioo3RxJGb3U7Qs5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Q4yWbgPA; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Q4yWbgPA"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BAD611A0A06;
	Sat, 27 Jun 2026 03:31:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8CF5960233;
	Sat, 27 Jun 2026 03:31:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 40EAD106F116E;
	Sat, 27 Jun 2026 05:30:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782531061; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=EK9ch49e9tGiCBU1t83Zf9bvOJuUEdiFckjtuI4mqag=;
	b=Q4yWbgPAGLMnCzJpFK0tDfBIOYk0cLcsBKhUo/oIK3HzpUVL1sB/O8ks8kLaKR0h/N+m++
	Bxf+DDU6x4W7xI0uW4WaWHsy7xfYd4GfiYBGL/JAezuw/a6ZEIBfj8/DkSu5WlvPxxuns4
	Y3gBTk8WyxuHJW5ZEd99LEmg2uLe5vP/RBlbO8yk+1xh6Ly3/9UGIgu0G3wblxfGdlWRZo
	SuxFDbs5qNzwPIz5VHQwDdtCuGdvK7MQdtXq63igCSZAdDCWkrC2dinh9744tdETGIUMsi
	4fLwSOJv2ZYVTLxiUA5wVVXIiGiBSHku+BbxXg7ArZBDWKJQKWGxz43dwED/jA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Sat, 27 Jun 2026 05:30:22 +0200
Subject: [PATCH v5 05/38] drm/connector: Export drm_get_colorspace_name
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260627-vkms-all-config-v5-5-854aa0840926@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=723;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=CoH2QFykQYAmJn0tr7ysysk8Njb0yaSHRh3FWL0Wc/k=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBqP0PdhwzlzL/Edd1r96Nr5w9zaxAzln5zPoDwf
 On2i3QwUm6JAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaj9D3RsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQIK0uxlsQLOIM0RAAic/X/hPHJu99c0F7dRUsONIkhqIWc6j
 gCd/u/m+IVdnmHHxp0HPv91a7UQAg+xGL7cNzwxJ3PaeT3rHmyFURtQuxl7Mww/NJPm8sex07+K
 7efG0FAzTXN6mi231K7ZSp9kVGs19y7CpU7CJp6kFI65rjCU+vjeYPcBVGagw0fB4IEyIEuuVYX
 4HyB58r5ZxqU9eWJ7eBECLfdUVBq/VzmA4G+kjm4zUUwecpHUfqfmcLdVSky1KWI1abpbY2CZOR
 pcn+0XBt4n592wJoqz7GwkSDq3byWHobjQqmU9+1yhIg9Nm8zigGL5DKaU0zbrkmdvPiQtQbvY+
 7WX2WXBsrX3Dv1l013qYN/RznTG6+MCDfihQAi6dMg0NZCW8lWbX9/pD6WSCwqk0e7ykDwMAutR
 t6ycREAOkPoQriaalZtAlt7+ObA/XC0J1epbtOEBY4vQ/7j7+p98SSWJDiEnB7o/QpBs15HeoYU
 XC/yvKMZZd3URzB8RJwBEFRcwJwIaAvX1UXGD+d1pWqnXH9H3XDY2y/xirOI5Lvol1kHNy5avXp
 sQn+KUMxEHPjh2aKHe5BvP025mvGppijIOPtfiriNRZiKK5OdJdcvyy7rd3rVa27yMYcTFvBXQK
 3DsBSbYs9xMFjeOSlS4NrqQNqjUXpKAzllWIW2AqEpYvf44EePBI=
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
index cbb067d02cb9..4b2c7c09ba69 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -1386,6 +1386,7 @@ const char *drm_get_colorspace_name(enum drm_colorspace colorspace)
 	else
 		return "(null)";
 }
+EXPORT_SYMBOL(drm_get_colorspace_name);
 
 static const u32 hdmi_colorspaces =
 	BIT(DRM_MODE_COLORIMETRY_SMPTE_170M_YCC) |

-- 
2.54.0

