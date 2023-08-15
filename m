Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F9217FEE
	for <llvm@lists.linux.dev>; Tue, 15 Aug 2023 21:11:16 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-d68c0f22fc9so6579847276.0
        for <llvm@lists.linux.dev>; Tue, 15 Aug 2023 14:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692133875; x=1692738675;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3y6Izf6PWqeRPwTjJUSGtpHjQ5Xbrf4Hr6LZlxEahOk=;
        b=DEykWB4VPD0KGwkR1rgTEkxuGrmyMbRmPDZOUHEnPXwFaHI3rUqsojcqqySGFoopGa
         qtooGMRnC2iBatnU5WIMN05g0vZUnhEdJZVjk4lw6MaKHZj3uELr1pxCP5/hsgTqIrBu
         1inqQgqIJZJ0VlbPAJIpm9/aWo9WsTqBaNDDVihJxzTBMBNgex/TOLHB2mYmoJOp1Kva
         bWeQr8NZbtkqjwq7mvqMAtaqjcOqkVBp/oDMzrZX7hqKYwQW4a6d2vnhTsoUk3GQCY2x
         1lnjzzGiQr7G4wgDP1gxwsyDXBuhUnF7eiCe83f1an5ltuLTmcDWNx/do1f/T7qdFpLb
         btCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692133875; x=1692738675;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3y6Izf6PWqeRPwTjJUSGtpHjQ5Xbrf4Hr6LZlxEahOk=;
        b=l9PsQPYFomG2fcp8TYn7g/2syNLGkCyyUOtb5IsGPVowvbQG4uNVjtDem0UgYY7kQF
         a+ETgnO+4u4pYK/ywNEDKkeCMaCvWxKw2Flp3eU7ifVY05QgWf9yBLfngo8efiPxgyzu
         riMbadk20TqZfQ21A/5sSER9GxBWeFvXtEILMP/JO5icxurE8js4am079VnsojUO5h4p
         +G8MsySuFqcTHrcFtISBggaNsRQPokOqpoaIiHD4/0IEUL3DAg3/rJ7LPF8R9CHMrK9P
         Rlt2xLBgT+2D7momBRZloMExNmR5NtWmAuqdw+ZRKpXJX21SlQPsqBMnKwH+53JzP2ZK
         SoOw==
X-Gm-Message-State: AOJu0YxCMt4p3MJymnzJM/hPhxJzWcqTKrcOAZscjwfT2hqB4cK949uB
	kdq2uR4CkYzulr/yP4yHjM1QNgdyzPrnhRrjbg==
X-Google-Smtp-Source: AGHT+IESHOcNCiS8o17qcx7V9DnY9/u5Ejmnxug8PTEedCECk+Qy3ouUC8CMmwLN9yzo20in9nO1So2V6LKsvaBvXA==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a05:6902:1818:b0:d08:95:76d with SMTP
 id cf24-20020a056902181800b00d080095076dmr2170ybb.6.1692133875480; Tue, 15
 Aug 2023 14:11:15 -0700 (PDT)
Date: Tue, 15 Aug 2023 21:11:12 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAO/p22QC/x2NQQrDMAwEvxJ0rsB2aVP6ldKDqeRG0CRGCibB5
 O9xepuZw24FYxU2eHYVlIuYzFMTf+ngM8TpyyjUHIILV/fwNyyzEJJKYTUcF8IxZsM8bNYAzxo X+TGG0LvEfaLk79DWsnKS9f/0eu/7AWJszKR5AAAA
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692133874; l=1857;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=HWSTPugX/6hl45mOi43ekrd154LFJ7mP03sqOaFNygg=; b=mUKhNFxwaMYAvGE8r2mEXisjetzD1WuRCSRRz8uhoZeTBBafOwti17CqjOH6uuGZ7lX7yJ56h
 SfAxWxpgjWqCv3/V5qSm4hMKInmpums0ZWkx3xU6Pf+KbCoMPqB90qI
X-Mailer: b4 0.12.3
Message-ID: <20230815-void-drivers-mtd-maps-physmap-versatile-v1-1-ba6fc86d5e4e@google.com>
Subject: [PATCH] mtd: maps: fix -Wvoid-pointer-to-enum-cast warning
From: Justin Stitt <justinstitt@google.com>
To: Linus Walleij <linus.walleij@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="utf-8"

When building with clang 18 I see the following warning:
|       drivers/mtd/maps/physmap-versatile.c:209:25: warning: cast to smaller
|               integer type 'enum versatile_flashprot' from 'const void *' [-Wvoid-pointer-to-enum-cast]
|         209 |                 versatile_flashprot = (enum versatile_flashprot)devid->data;

This is due to the fact that `devid->data` is a void* while `enum
versatile_flashprot` has the size of an int. This leads to truncation
and possible data loss.

Link: https://github.com/ClangBuiltLinux/linux/issues/1910
Reported-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Note: There is likely no data loss occurring here due to the fact that
`enum versatile_flashprot` has only a few enumerated fields, none of
which are large enough to cause data loss. Nonetheless, this patch helps
towards the goal of eventually enabling this warning for more builds.

Signed-off-by: Justin Stitt <justinstitt@google.com>
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

