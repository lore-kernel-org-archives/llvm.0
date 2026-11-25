Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645535;
	b=ZdC7l7Ep/CqUd0Thvmu1Q+0FL+2y+VLFbyxkPf7epL1iKwq0Im9Ebi6lmksHn9DRFW7V
	 rdYzBlgF8nuCLIBaXlOrxIBbn58zDHHZOI3ZsjWebdfv87lo7T2/WLvR1g1MiIn8F6jpv
	 cO4BoaZfummQePYRDHfT5cF9Jy9cEvkc1VP9s7ChFstnLg5wNu97lkXD+i7lniKHz0Q2F
	 9095pHcWIC0npgiOn53Co58e+Lt5yYVs+n+0VQdW7RG7XAd3msmoWOE4/rQYWKIzR1Qwk
	 wH4b0Hr1xWnfqigg6VAuOvnLdeOt02wvYoBF589xclxpd2E+mn3k126zKB3SBj5Bmmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645535;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=RCCssxDP7VqyjtjkkMxKeVZicY7ZW2acPhjksq1uY6w=;
	b=Hq56NXWYnLAJEjOkb+/zXGGQzEJXsfJDKHzE1uNd0XlbnkUN/uDgix/a+Xx205uRmaQi
	 Wq5YP7sPkcQLia3nPxwJ2JMpq650C96+6hgfyLR5aba4Hwl1+bZxwmVBtkAdof4OxSgai
	 Zjaz8ncFH9XdaDTBRAKPaY8Gn+qPsuKA+cL6yes8SwtqG9kh4g9PC8GLT8z9le0kcv+2R
	 vvKaNH8zhMy702p+4NC2hZfBg9RixWQWDrinNxibZNdi4hzapoOTUIl5o0Uhc3aE/j+LY
	 42D07iRJ5u1iqiYTTp2/hF3bz9eNa2uek/2uaAvzAs2aCl9MUAG82Ip8s8UwySix54Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="g/4BDtzd";
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71C860A5BD3
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 22:25:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D71C860A5BD3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=g/4BDtzd
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-341eff9e381so9500865eec.1
        for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 14:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795645534; x=1796250334; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RCCssxDP7VqyjtjkkMxKeVZicY7ZW2acPhjksq1uY6w=;
        b=g/4BDtzdBALqy0kS1O7V+CUMYsMlIsgZEGazCImyd0jgy+LLhSQXea9HCLUOWahT3+
         yOqomAaeLUtvQ2T3Q5lMezzZlYIKihcfrhXnQhgr3R0qxLDQvPbD+cPGok9lSU0rcwuF
         otRR363p0EiFv+qkFn+ClrrdVDZVqSn6ZLyr6Ir2DH6146SyNMyTSZBkx2Zluz3CrZVl
         lO5NqJJRThugvrUHk6uRqm10q+6RBWG4UJazjkTj6SV4emLMjg59Hj91o3ujUEjqWS7F
         HtU/APhCz5qxdSZ27ehfEzGyFIfnoOELfV1gP1Xq56pcHC7IKkdOSLo0j4uNUWmBsqtQ
         CKTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645534; x=1796250334;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RCCssxDP7VqyjtjkkMxKeVZicY7ZW2acPhjksq1uY6w=;
        b=v82OdzQX73Yp+yEI9RXyBSJ/isKusDmrt2yUYNxe4UOvx4bq4e9jsYQnBwJNDGeKrX
         afW/XjKJF7r/b/f7KFUY6pNbpozqefipuFVVsfHWNWESu1/LGKAXwGvMGyxdMdOM6hP8
         S0LToeK4zMi7U+XrAO+hWoPiiUfMfAXqJPYNsZb5t9Z9Yx6RYAUbeiFpxp6cqwRyLDHs
         voUNbYlUV/1QMEhBtqadwvaYP9KDYSzGCldROOmc3l1w5hgNRfRlJ4lcobKGzHvIrRw6
         wdqflYJuNPyil+5MsiqPQpbZ9PE4L0Cih9iqYucHP5Oxh5elrlvwUNDLrwGe2FIPJjyz
         ovTg==
X-Forwarded-Encrypted: i=1; AL+hErF6ium17FNO1GXExGmRZvNJUaSq3iPEFyxZiiJKSh/nSLjmDGoYn/cnpH41CaWoAwGwEpGZ@lists.linux.dev
X-Gm-Message-State: APuU4Z/tvykOtqBSP+G4nGJXtkldqVdrs4a/T9cOxnjf52mj+ZxDAS70
	/6KNTja/aHI7hgtoweoD25vGBkcDTHddRniZNoisTj/tMREOWh7dDNFixUaD6yATTfUqKNMLKhF
	EXw==
X-Received: from dycnn7.prod.google.com ([2002:a05:7301:1407:b0:384:71f1:1227])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:d587:b0:381:d92e:ecab
 with SMTP id 5a478bee46e88-3856f25884emr17876278eec.11.1795645533582; Wed, 25
 Nov 2026 14:25:33 -0800 (PST)
Date: Wed, 25 Nov 2026 22:25:12 +0000
In-Reply-To: <20261125222513.1446099-1-elkin@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261125222513.1446099-1-elkin@google.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125222513.1446099-3-elkin@google.com>
Subject: [PATCH 2/3] drm/sitronix: st7920: Check drm_dev_enter() in crtc
 atomic disable
From: Elkin Cruz <elkin@google.com>
To: Iker Pedrosa <ikerpedrosam@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, irogers@google.com, Elkin Cruz <elkin@google.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

st7920_crtc_atomic_disable() ignores the return value of
drm_dev_enter(), allowing SPI power-off writes to proceed after the DRM
device has been unplugged and unconditionally calling drm_dev_exit().

Return early when drm_dev_enter() returns false.

Fixes: 88b09229f34a ("drm: Add driver for Sitronix ST7920 LCD displays")
Cc: stable@vger.kernel.org
Signed-off-by: Elkin Cruz <elkin@google.com>
---
 drivers/gpu/drm/sitronix/st7920.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sitronix/st7920.c b/drivers/gpu/drm/sitronix/st7920.c
index 091e80d8bda5..ea4566009c4b 100644
--- a/drivers/gpu/drm/sitronix/st7920.c
+++ b/drivers/gpu/drm/sitronix/st7920.c
@@ -580,7 +580,8 @@ static void st7920_crtc_atomic_disable(struct drm_crtc *crtc,
 	struct st7920_device *st7920 = drm_to_st7920(drm);
 	int idx;
 
-	drm_dev_enter(drm, &idx);
+	if (!drm_dev_enter(drm, &idx))
+		return;
 
 	st7920_power_off(st7920, &err);
 
-- 
2.56.1.839.g22a8290db9-goog

