Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37C0168B9
	for <llvm@lists.linux.dev>; Wed, 16 Aug 2023 18:26:51 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-58caf216c55so2727287b3.0
        for <llvm@lists.linux.dev>; Wed, 16 Aug 2023 11:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692210410; x=1692815210;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=S6as3BxJpUCbqcYsYLfwqrd6wpI3WguOJqonU+8LSLc=;
        b=z0c2F/G/8ZqCH25VdVy3+VNDQI8CZeomkJY3XdzlkKQh/JwPUa5Z1o9g74b4z1pxiH
         wRYVTVuqobGllrdShttdO/QSk1CkCvnHciCc+U6yeBKeMn+G8bMhR+kKrlyHuLI78mgH
         /xhC9LfsawjIy7OW5AbgBlur6CBQyM9oq+7T98ppgngF3OFCO5C4JO0Ati2/MimQ3z9U
         GEv8Fn8BOAvyhA3xgcd9vgY4844c7XHjvtPwYSJ8J0FHRfSxmOZ7IyzbNBghkWgIAK5u
         svFaihEPiZ2b4puUHNUBBfwTU3sl64Ck6rlz10eKKLgLmoxIB/j85T+jNUpMtdvqTLcr
         FPWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692210410; x=1692815210;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S6as3BxJpUCbqcYsYLfwqrd6wpI3WguOJqonU+8LSLc=;
        b=QovL6K9yNpLNRv4m3jA66oziucS4fESlWTb1+xs+1IQH3ImgYtQKhRpnWO3SicPPb5
         UQONIzkTdN2RvVnB3u09SW7GzODEvOKRTbznMVty+SiLH9M7iHfJnoSdeC9PkqC0Q+d1
         F7XuwFeNuognRbrr19pnnMce21/obmSsuSMrfz3FKTcfSYOfcakH7WX+7tCuwlqIGPY7
         K53DGAnkQxIjRJEWa9cCjEfSYPfWn3YehQp/OBMRFEjhenXl9AxRyCkZRJt3izss6tTi
         UNY+vZUf/qD40SEaqu4Oq/fYRGi1OJup+3S61CGW/S26I1DkG5dLk59vcF5VVH11YTdi
         HKBg==
X-Gm-Message-State: AOJu0YztB/eLwli3nf2Xxqh/u4RfIvZOOLPWa7aXfyKwpITq4LHQ1hqA
	/QN7yaeBQe4mS0GR7AfGDervw9ZGMEBP3hP7xA==
X-Google-Smtp-Source: AGHT+IGHa/5g87NdPEOq2wAtPaDB0w/dWc4EOap0B976E0FRPaTqbUwY726ZhRQ4H+6EEHfTB93fXA2tnit2luAlDA==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a81:4316:0:b0:58c:e8da:4d1a with SMTP
 id q22-20020a814316000000b0058ce8da4d1amr8918ywa.2.1692210410645; Wed, 16 Aug
 2023 11:26:50 -0700 (PDT)
Date: Wed, 16 Aug 2023 18:26:44 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOMU3WQC/5WNSw6DMAwFr4K8riuSlo+64h4Vi5Q4YAkIilFUh
 Lh7Azfo7s0s3uwgFJgEXtkOgSIL+zmBvmXQDWbuCdkmBp3rR16rAqNnizZwpCA4rRYnswguwyZ
 p4GnNyiOh1lXuqHLWqRLS2xLI8fcqvdvEA8vqw3aFozrt/42oUOHHlK6rS1vQk5re+36ke+cna I/j+AGL1kKx3wAAAA==
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692210409; l=1749;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=8lAIhnmpRVK+py4l8xzNXorgfe03DykVYWVS/7qh4fw=; b=ktG2rQbNbxM+rTl/KVl5MI/PcP0u3a40de2Mqg6Bm+oJeBznguW1yO4lm/q5TFtmA7hRZT6nf
 DixvkgTw1w3BeuZDW/cwGzcjia8AwOtJnFMUleRe1Ten7DKqdvdMwwp
X-Mailer: b4 0.12.3
Message-ID: <20230816-void-drivers-mtd-maps-physmap-versatile-v2-1-433a25272bfa@google.com>
Subject: [PATCH v2] mtd: maps: fix -Wvoid-pointer-to-enum-cast warning
From: Justin Stitt <justinstitt@google.com>
To: Linus Walleij <linus.walleij@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="utf-8"

When building with clang 18 I see the following warning:
|       drivers/mtd/maps/physmap-versatile.c:209:25: warning: cast to smaller
|               integer type 'enum versatile_flashprot' from 'const void *' [-Wvoid-pointer-to-enum-cast]
|         209 |                 versatile_flashprot = (enum versatile_flashprot)devid->data;

This is due to the fact that `devid->data` is a void* while `enum versatile_flashprot`
has the size of an int.

Cast `devid->data` to a uintptr_t to silence the above warning for clang
builds using W=1.

Link: https://github.com/ClangBuiltLinux/linux/issues/1910
Reported-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Changes in v2:
- Use more accurate commit message (thanks Krzysztof)
- Link to v1: https://lore.kernel.org/r/20230815-void-drivers-mtd-maps-physmap-versatile-v1-1-ba6fc86d5e4e@google.com
---
 drivers/mtd/maps/physmap-versatile.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/maps/physmap-versatile.c b/drivers/mtd/maps/physmap-versatile.c
index a1b8b7b25f88..d65cf8833771 100644
--- a/drivers/mtd/maps/physmap-versatile.c
+++ b/drivers/mtd/maps/physmap-versatile.c
@@ -206,7 +206,7 @@ int of_flash_probe_versatile(struct platform_device *pdev,
 		if (!sysnp)
 			return -ENODEV;
 
-		versatile_flashprot = (enum versatile_flashprot)devid->data;
+		versatile_flashprot = (uintptr_t)devid->data;
 		rmap = syscon_node_to_regmap(sysnp);
 		of_node_put(sysnp);
 		if (IS_ERR(rmap))

---
base-commit: 2ccdd1b13c591d306f0401d98dedc4bdcd02b421
change-id: 20230815-void-drivers-mtd-maps-physmap-versatile-2270fe7fdf16

Best regards,
--
Justin Stitt <justinstitt@google.com>

