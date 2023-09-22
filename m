Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31BE43A87
	for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 17:50:25 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-690fe10b6a4so2259239b3a.3
        for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 10:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695405025; x=1696009825; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rsoVVkVJpImufXYUFiKKi6XhwT7HcFfXx352YN3aPUI=;
        b=i1AcOWvfk9OljfGReagmx1LJJK+UDeqAJGXowbenl0ojsu/P7B2SAEKn+5/b4ZZscF
         vx0ZhHaRN5fMYHEMXzoEbipMDacpDpQ3iUleQ1pKMcdGPAZ2nCfUOLbZDi1QYKsx1g3p
         lNCKVLkJZSloDlJxA8pa47qhCZkLhoWeY49DU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695405025; x=1696009825;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rsoVVkVJpImufXYUFiKKi6XhwT7HcFfXx352YN3aPUI=;
        b=dkojgHH9ftzJJcm1Mf0LAyTswhncOL2CHAxynteSMFRmpVyBpFEC5nRmumGYywnlSE
         efjdjcOcwbLVLrU5ZVlYmo3C+TaxZS/sIrviI6YaUGLYYYtH7WXpfzsjbh/CIliaDhM3
         LuEjh+IHxICTuhnt5ewgzZBR9Ow6+zvGk0XJVx5FLZ8wVlNjBAbQgqIZoDo2fuU1qEAh
         v9IfgJgbGXArY+098gKBrILZs3DYqU72A5R1ep1QePN39QMKyONEn2OtSsbDyGEfg5IV
         dr6sLNGzDu5geuPDyFtujI4HQ0FxuR8pX/w/48jNh+87SYqO6Qh07yhes2tWTELfq7ia
         SXAA==
X-Gm-Message-State: AOJu0Yy8KainkH4yAlOqDuMJHGUpv1o3pkufqQZqohkgUlRLsLT7w66N
	9zfhgabOOFWtj60xNf0K/AWd8A==
X-Google-Smtp-Source: AGHT+IFm176lsWiAeY2vnzweheucJK3AqXo/ngQ1nPNpByurb26DcnOqwOcqkAHNqGfr1GI5VvEpog==
X-Received: by 2002:a05:6a20:9757:b0:12c:2dc7:74bc with SMTP id hs23-20020a056a20975700b0012c2dc774bcmr264040pzc.46.1695405025327;
        Fri, 22 Sep 2023 10:50:25 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id r2-20020a62e402000000b0068fe9f23bf4sm3473166pfh.103.2023.09.22.10.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 10:50:25 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Kees Cook <keescook@chromium.org>,
	Conor Culhane <conor.culhane@silvaco.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] i3c: svc: Annotate struct svc_i3c_xfer with __counted_by
Date: Fri, 22 Sep 2023 10:50:23 -0700
Message-Id: <20230922175023.work.239-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1258; i=keescook@chromium.org;
 h=from:subject:message-id; bh=6p5WfsNbelw4xW/uYRQkWYI4wKP98hRY7x9zeyJ/VKs=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlDdPfhpFW9ozCUbQKD/ABqFbClMmYYe+xKFK04
 xJmgYEcGvyJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQ3T3wAKCRCJcvTf3G3A
 Jo5jD/9NPbEPqcPGdJnGMWLKW5F84m/wb/iiP78wW8yokv9eJqF2j6pibIDhhtpxlkY/bvg9oSJ
 KO8/PhlFA+RgpeKZjAk6kAxG76jiaFXt1QRspEu/pEhYFo1DtugfXpYyw6hdP+YV2w94y6ccRcS
 LvB6f2jek8JX3/yW2V1nJ2M8PlwUvzgPhF1E9/5Jo9XcSQiEqZz0hGXVgqK3IXCAKyURUEbC05v
 lqF88ptmX6uAYYCNXIFM1waKUZMDwx5KD75KLh2qTejzSADXZ2a+tbhA85LdI620tZ9NjS4qYe8
 dGO/wJ5GFMZuBGeTnFNDMyy3GGVDlBMKMnHde4Nb4YOM3RWxtHDQYS7cwNImHU5P79OUuP+i9TA
 Y7FonsBukEUjfoZQ37bGAphBszCsg7mnQwDwcQGbBzJY5LYaSSEkWUQTrIJ3dQ8Uu0G06UKu5v3
 bQif/8XUpuFQZ2GMCW1w3+OgSYDsVnpp4rq7ofUpYTT6V7yI0yWtqFvT2ZnHKUIYjo7/egEfm0Z
 CVlzLJTbK2Ip/XdB4+T6MhWbGOie3t/91bl1Sy3eDZoLlNrYmnfDIKzQueFiGKDX47dxVVB/pLy
 y3xAv5M7R6Wn0C50Unagx3s8ia6Us7SDZfeaRbOwCW5JXFpBXYwmnLjlBrpKowPzudJInn3SeAM
 X/wPxFu SNPqW/rw==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct svc_i3c_xfer.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Conor Culhane <conor.culhane@silvaco.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-i3c@lists.infradead.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/i3c/master/svc-i3c-master.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index 8f8295acdadb..32eca2d6caf0 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -143,7 +143,7 @@ struct svc_i3c_xfer {
 	int ret;
 	unsigned int type;
 	unsigned int ncmds;
-	struct svc_i3c_cmd cmds[];
+	struct svc_i3c_cmd cmds[] __counted_by(ncmds);
 };
 
 struct svc_i3c_regs_save {
-- 
2.34.1

