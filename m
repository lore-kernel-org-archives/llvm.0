Received: from mail-ot1-f73.google.com (mail-ot1-f73.google.com [209.85.210.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D321017FEA
	for <llvm@lists.linux.dev>; Tue, 15 Aug 2023 20:58:49 +0000 (UTC)
Received: by mail-ot1-f73.google.com with SMTP id 46e09a7af769-6bc807e99adso5580785a34.2
        for <llvm@lists.linux.dev>; Tue, 15 Aug 2023 13:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692133129; x=1692737929;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=i43ino8+cQV5fs59YFTMpgpy3gd6Kvhnph8ypvpU1+E=;
        b=OaxNZF0XeYWAxRvthJD35Tl9i7hNdMx3tQUmVK3WMKxUOPWVZGqtu8tPhOn+L5tulx
         xuSR6QwuQzjucbrKrku+UFgwmRL4KepxrquekQ9XHqbI9qnEr9712T3kQUag/EbT7vDe
         QKpZGn2ap+1vWwydxynUDL3mkCGS6wDvdjEhMHvAqZp847wBPjwKQhp5cZRrFsUmyZ83
         L36Dlb6XMxbhYXcEZ0hmMRqvzFFXIdZieTZG9HOC7jXZerkC72IDSE9I8tFL7ile8CsV
         wep05GdDlBWhqmhhg387YEwJgwmZDYQO97zOyx/XphXe/2FcRkPN8ScnustwRB+2yLyC
         6q+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692133129; x=1692737929;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i43ino8+cQV5fs59YFTMpgpy3gd6Kvhnph8ypvpU1+E=;
        b=fgbmSN8+etegXh6KXi8onPc2+u05l/K4NNXstsOqDnFNDfS+J7UUXG4+uc+BN82XLV
         gyBxhMAL+QrJP0XeSvPvpvggOj6Hou040b7u72GcceVZzHTEGXqSHgJjft8PzEeANzJ2
         MkvGuOfhwsgKmC65ca8V/syBmf9uI73T9TEgOjnskuiIMS8BHJE2esZvo8HmDhdltT8i
         Ykb3vsDwvG+jb4M6DjZEhsLR6gBe5r+mQ1zmkxQ5iLgWGVRxYjciDlIBD4eSS0YE6i2c
         c4e1IQTmdpAVVW9H201aa2YnOuxuMzlGEqqQzhf7ByWUIsssqRF98h8/Ri1rn0+Ytytj
         L3cw==
X-Gm-Message-State: AOJu0Yz7AvEXJJOweW7Va4WjOG0zxTONWYNfO5IyVaFw1K43l2JUmNxk
	cqjOaiz1Za+65f0XiA3trWlBrKG/sLtNwpHP9w==
X-Google-Smtp-Source: AGHT+IG6T8KFew1s+X5WQiOn2+4/yct62q/iaRBeV0Fq3wY/nCalyvWlspLQ1IMg2y/MrcyQDbBVxlt0Frv3SCy3aw==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a05:6870:8c34:b0:1bb:6791:cc68 with
 SMTP id ec52-20020a0568708c3400b001bb6791cc68mr216505oab.3.1692133128823;
 Tue, 15 Aug 2023 13:58:48 -0700 (PDT)
Date: Tue, 15 Aug 2023 20:58:47 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAfn22QC/x3NTQoCMQxA4asMWRtoOz8UryIitUk1CzOSDlUY5
 u4Wl9/mvR0qm3CF87CDcZMqq3b40wD5mfTBKNQNwYXRRT9jW4WQTBpbxddGqEkJLX2wlcW7m5a MSx7nWKYw3WOCXnobF/n+L5frcfwAXHqUeXUAAAA=
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692133128; l=1875;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=y2JbzG62AXClW5TbICNapFpMx9TWmAr5KjVSEN24CHY=; b=ph2dAzVEzI/Hp2y1+thActuqF4avgbTqiwLRd0iD0lkfUbCpSWXtXOTntsjxLLcfcDGOL6GDD
 Zd6jcbvOxHWDmRwh4JoND6QutLqs/72t+7bRVE1J9SSS0NDidFEsL/U
X-Mailer: b4 0.12.3
Message-ID: <20230815-void-drivers-mtd-nand-raw-vf610_nfc-v1-1-7cc65314c56c@google.com>
Subject: [PATCH] mtd: rawnand: fix -Wvoid-pointer-to-enum-cast warning
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

This is due to the fact that `of_id->data` is a void* while `enum
vf610_nfc_variant` has the size of an int. This leads to truncation and
possible data loss.

Link: https://github.com/ClangBuiltLinux/linux/issues/1910
Reported-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Note: There is likely no data loss actually occurring here due to the
fact that `enum vf610_nfc_variant` only has a few fields which are not
nearly large enough to cause data loss. This patch helps towards the
goal of eventually enabling this warning.

Also, should we use `unsigned long` here instead of `uintptr_t`? I've
seen maintainers request both and I'm flipping a coin here.
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

