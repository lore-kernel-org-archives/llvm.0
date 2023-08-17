Received: from mail-ot1-f73.google.com (mail-ot1-f73.google.com [209.85.210.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE08A14AA6
	for <llvm@lists.linux.dev>; Thu, 17 Aug 2023 17:52:23 +0000 (UTC)
Received: by mail-ot1-f73.google.com with SMTP id 46e09a7af769-6bd372edd1cso162849a34.3
        for <llvm@lists.linux.dev>; Thu, 17 Aug 2023 10:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692294743; x=1692899543;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=n2UG2OG5KrxWJ0s3qtnx/i+Fr3CRP1zZ4JSm6GFIF8c=;
        b=camaHaV/Gbd+c1ik48sZSGrt5XHK8lSjJ9F8mxQ8gLFTx8n435uppOnVSxPbS/8nUS
         4uVnoANdukrwQN7xcDWOUWsUPjc725/cuRivpAvQBhIgg6CzB/aSMHIlyh0G0EgNj1Qp
         xlseRYQh4Fym8TvlpTtsxzYaJutZpSvYLdRVHFCnjq0P7HspwTp8XdfkwSXhM0QaFv5j
         84snFfINaQiAptUy7r4lVlsr3D2JGzcYWqpD9iw+iBq5pTW5Ju/bRMC6yDqTTcvUscc7
         Q2SGV9kcFEyWXJmEeBKXjHlCwSjI4T58yrXhGZS5J05eSAXz4ogD5Au17r54xzjfHatF
         BXMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692294743; x=1692899543;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n2UG2OG5KrxWJ0s3qtnx/i+Fr3CRP1zZ4JSm6GFIF8c=;
        b=CuXA479l1MPZ/xrKtb7OZ5oFGK7bts1E2lZ343QbRVj+55sYVMGylN6xsHjxdP0M1T
         nQYkgNMvUwfNFE/k0CoXciIgw0ClaDwx3MedcKEbJ97fxPVZ7s+kEZJ2f+6zV3RClYqz
         aj0lfz+QT9DU1K9vZMF4+VLJwSRMKCKW1YGFUgQK3wY78mt4jFAxHZqz8n16EVAQixGx
         7oZlOQiw+8sI1vRKJ4DgWqxr/ZC4aDHpSToZ0AgxMKE5QGJ7Jh8118e2F0VxuE0t2pJV
         drBFgf5BUVtZalmOdY2dcUG3FuoRz8fseAttWr6CL+F8IH+vwJmD0MWdsXgaLuTg7YPw
         2+4A==
X-Gm-Message-State: AOJu0Yy7XWMt5ZPcYjwMQdXTqA/hwoNMDJ0z83Spab8gfdGtCwY/gd/C
	9323450O5phmAkJnWGvzOdUDZ0mMqPGrIfP3ww==
X-Google-Smtp-Source: AGHT+IH06wac0SBG25lJJhXNOWcsSI2IvrGrskfXKVnJv8hj8F+qNwDIvYHlFs8yFjiUbo4MsE/swog16j/Elyccow==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a05:6870:a8a5:b0:1bf:d3b8:5cae with
 SMTP id eb37-20020a056870a8a500b001bfd3b85caemr2392oab.10.1692294742832; Thu,
 17 Aug 2023 10:52:22 -0700 (PDT)
Date: Thu, 17 Aug 2023 17:52:21 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFRe3mQC/5WNQQ7CIBAAv9Jwdk2hBRtP/sM0BhdoN7FgoEFNw
 9/F/sDjzGFmY8lGsomdm41FmylR8BXEoWE4az9ZIFOZiVZ07cAl5EAGTKRsY4JlNeC1NxD1C7J
 TvL15h6Cwk4PrRX8fNKulZ7SO3vvlOlaeKa0hfvZp5j/7Xz9z4HBCVLLjPUqFlymE6WGPGBY2l lK+MSeyT9cAAAA=
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692294742; l=1720;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=MouGUYg3kqvRKE/s9FPfueuRCAtPM0lCpE5G1aOdCPA=; b=0qynUlCcs0UVl9/8Ugxh9CjQAoBaOahFyRH41Qo/Dkbl4zK00nH7C2j1ViGwNZ0iDLJGBWUBo
 sgWqOz6c9VeCZ3x2xIFjaBqNJmlKt5jXgy0SlqoZ0OqWSxdtsgE9+uq
X-Mailer: b4 0.12.3
Message-ID: <20230817-void-drivers-mtd-nand-raw-vf610_nfc-v2-1-870a7c948c44@google.com>
Subject: [PATCH v2] mtd: rawnand: fix -Wvoid-pointer-to-enum-cast warning
From: Justin Stitt <justinstitt@google.com>
To: Stefan Agner <stefan@agner.ch>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="utf-8"

When building with clang 18 I see the following warning:
|       drivers/mtd/nand/raw/vf610_nfc.c:853:17: warning: cast to smaller integer
|               type 'enum vf610_nfc_variant' from 'const void *' [-Wvoid-pointer-to-enum-cast]
|         853 |         nfc->variant = (enum vf610_nfc_variant)of_id->data;

This is due to the fact that `of_id->data` is a void* while `enum vf610_nfc_variant`
has the size of an int.

Cast `of_id->data` to a uintptr_t to silence the above warning for clang
builds using W=1.

Link: https://github.com/ClangBuiltLinux/linux/issues/1910
Reported-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Changes in v2:
- use better commit message (thanks Krzysztof and Miquel)
- Link to v1: https://lore.kernel.org/r/20230815-void-drivers-mtd-nand-raw-vf610_nfc-v1-1-7cc65314c56c@google.com
---
 drivers/mtd/nand/raw/vf610_nfc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index 86522048e271..11d996dc655d 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -850,7 +850,7 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 		goto err_disable_clk;
 	}
 
-	nfc->variant = (enum vf610_nfc_variant)of_id->data;
+	nfc->variant = (uintptr_t)of_id->data;
 
 	for_each_available_child_of_node(nfc->dev->of_node, child) {
 		if (of_device_is_compatible(child, "fsl,vf610-nfc-nandcs")) {

---
base-commit: 2ccdd1b13c591d306f0401d98dedc4bdcd02b421
change-id: 20230815-void-drivers-mtd-nand-raw-vf610_nfc-6c358f424b8a

Best regards,
--
Justin Stitt <justinstitt@google.com>

