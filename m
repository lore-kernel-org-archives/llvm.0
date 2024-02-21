Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A7A4EB23
	for <llvm@lists.linux.dev>; Wed, 21 Feb 2024 11:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708515366; cv=none; b=VXTwIDfgk/V5fSx/I8DSryixWpOGGKU0/yzyEoHBTRC7QH/rPhJlSaH5490yknsG9fWrvNsrtzbIN1KJWqSB7ijZrQJmWVIr4dKm4cyWRNgEtUx8CSwnF4SC5xXl/V3vUkDT1xi9jk8BgrJ4qeKwXANXIqR7UdnleJnt6NSxBiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708515366; c=relaxed/simple;
	bh=cyP4xFLZtWmSglaQt1bRPcLQO2AlvE55S6UyeZvMgMM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=miCNVbVoPeTLkkA6JaERCq0j/HBnHrtVOarm2Qn/rBaFvku+WSh/XuRFovucgaoRVAYXuOKmWecLcdkKk48V2thUH/fgn0PkaylEKNZ/CxvHOeC+lzr5kMWPfOYa2ZFcoQR2xHle1/YZz++nMZwabmaD4NLrXXYJJyzOxkJcySk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=c38mMr+X; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="c38mMr+X"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-33d36736772so1484133f8f.0
        for <llvm@lists.linux.dev>; Wed, 21 Feb 2024 03:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708515363; x=1709120163; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ygqZ0HdVfjjnya+uCKEPe+HOAs/11yLIprq08KYDjCU=;
        b=c38mMr+X7altezSVNb1efLiCZfpSiCFZ+AL9yxyDzj35Usfv2N0/oCChTa84QP2T/Z
         24QsmgUZ8ZAhPAdnFmBkQ8gjg1lRy880SjMroejLsChBY6OgDzGYG/ce3MW0ua2amwjw
         RzWRpkf2LoYEQX1HV5Zx/+IUdjb4QIZaVljr+a/iVhW+gglecT8QQXEbbPRHplzbQGUq
         k23bQAd4zTjY2cdRebLFOWIOm3vAdw6SXYwPRpJKMoxdwL4TdpHybG+sE3dEbLT0FX2c
         M3I0lCpn7zfrY2NECH2eSRWYpWPuiR4eC8Xn638oNyZWK+MhHjTwLo+dNfQ/Nzax3oQH
         LNbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708515363; x=1709120163;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ygqZ0HdVfjjnya+uCKEPe+HOAs/11yLIprq08KYDjCU=;
        b=xB1K8HcruKzSzamVDKabv4qD11IMf00GsYa5KPmtE05WiXE91MFyO+IXTpvj13felx
         LAYDM2n5cXmxJNmeKbAWEo5IMLn+nEVQG8LYxxJbJn9HXuJ14u7ffMPlXgS6U5SpGlPo
         4bzT35Qw6vjVBJ4HCm9fmmD8//+VK59OdESg9vl0YdLyFSnk1XWvfFqkI4vuYrxRB10h
         4gq+k2vywXPuJYIPstWcSqK+sV5oSuhn2HzR8zN+bd7ToAYOUwIuo2cv1Zx+7HR0lYWl
         IYRnPFykrvEZbjiGN/kDUwOc+vCsH3xm+CkuBMlP0TmUR0mgSaQw5ZKXWjOqHmzcHgsX
         XLZw==
X-Forwarded-Encrypted: i=1; AJvYcCUgVWxYj7jf9xbCmUc8Cewyx5Pqe4noBMrp6GEHrneGQ3+UyQjvzYLy8w/2dQaHFDQvZy3GcTAtwebjTDbcD4zxGuTtgg==
X-Gm-Message-State: AOJu0YzaQjtvT8TpSLNT3mAyoxG+510spiT1mu7BQZyJ87RXMdgz4wzu
	bCNt+yNPCWXG6JqjC1pIg+QaJiNzcLA33oSaKRqDukCacQyfYFrq9Eo71IWlpBUMtw1rjA==
X-Google-Smtp-Source: AGHT+IEwJkOJnuMq7ORoS6GZzEmG8oYrQV57UO2nb6Z/7t71yxkwvghJTIAJpRWx3O/owpBnv+CV3jaE
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:118a])
 (user=ardb job=sendgmr) by 2002:a05:6000:68e:b0:33d:6211:4699 with SMTP id
 bo14-20020a056000068e00b0033d62114699mr12133wrb.0.1708515362858; Wed, 21 Feb
 2024 03:36:02 -0800 (PST)
Date: Wed, 21 Feb 2024 12:35:19 +0100
In-Reply-To: <20240221113506.2565718-18-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240221113506.2565718-18-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2183; i=ardb@kernel.org;
 h=from:subject; bh=FIfYcIT0zte0p7QudMXkiQVk0sZSk5MJFoxtVIwXDvE=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIfXq/c9nhK593//oPlvM+uJnf5Nc71pP9q7bFnDn2vKpe
 juuWl3h7yhlYRDjYJAVU2QRmP333c7TE6VqnWfJwsxhZQIZwsDFKQATefaLkaGrnXW+jfYSrgsP
 p9+equA17UpPH4dg3J10EcZptlf7eCUYfrN0v79eFNqz2qvx2ofQ+R1Z77et35Z4RktOxt5mUal rEB8A
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Message-ID: <20240221113506.2565718-30-ardb+git@google.com>
Subject: [PATCH v5 12/16] efi/libstub: Add generic support for parsing mem_encrypt=
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Kevin Loughlin <kevinloughlin@google.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Dionna Glaze <dionnaglaze@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Justin Stitt <justinstitt@google.com>, 
	Kees Cook <keescook@chromium.org>, Brian Gerst <brgerst@gmail.com>, linux-arch@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Parse the mem_encrypt= command line parameter from the EFI stub if
CONFIG_ARCH_HAS_MEM_ENCRYPT=y, so that it can be passed to the early
boot code by the arch code in the stub.

This avoids the need for the core kernel to do any string parsing very
early in the boot.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/firmware/efi/libstub/efi-stub-helper.c | 8 ++++++++
 drivers/firmware/efi/libstub/efistub.h         | 2 +-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/efi/libstub/efi-stub-helper.c b/drivers/firmware/efi/libstub/efi-stub-helper.c
index bfa30625f5d0..3dc2f9aaf08d 100644
--- a/drivers/firmware/efi/libstub/efi-stub-helper.c
+++ b/drivers/firmware/efi/libstub/efi-stub-helper.c
@@ -24,6 +24,8 @@ static bool efi_noinitrd;
 static bool efi_nosoftreserve;
 static bool efi_disable_pci_dma = IS_ENABLED(CONFIG_EFI_DISABLE_PCI_DMA);
 
+int efi_mem_encrypt;
+
 bool __pure __efi_soft_reserve_enabled(void)
 {
 	return !efi_nosoftreserve;
@@ -75,6 +77,12 @@ efi_status_t efi_parse_options(char const *cmdline)
 			efi_noinitrd = true;
 		} else if (IS_ENABLED(CONFIG_X86_64) && !strcmp(param, "no5lvl")) {
 			efi_no5lvl = true;
+		} else if (IS_ENABLED(CONFIG_ARCH_HAS_MEM_ENCRYPT) &&
+			   !strcmp(param, "mem_encrypt") && val) {
+			if (parse_option_str(val, "on"))
+				efi_mem_encrypt = 1;
+			else if (parse_option_str(val, "off"))
+				efi_mem_encrypt = -1;
 		} else if (!strcmp(param, "efi") && val) {
 			efi_nochunk = parse_option_str(val, "nochunk");
 			efi_novamap |= parse_option_str(val, "novamap");
diff --git a/drivers/firmware/efi/libstub/efistub.h b/drivers/firmware/efi/libstub/efistub.h
index 212687c30d79..a1c6ab24cd99 100644
--- a/drivers/firmware/efi/libstub/efistub.h
+++ b/drivers/firmware/efi/libstub/efistub.h
@@ -37,8 +37,8 @@ extern bool efi_no5lvl;
 extern bool efi_nochunk;
 extern bool efi_nokaslr;
 extern int efi_loglevel;
+extern int efi_mem_encrypt;
 extern bool efi_novamap;
-
 extern const efi_system_table_t *efi_system_table;
 
 typedef union efi_dxe_services_table efi_dxe_services_table_t;
-- 
2.44.0.rc0.258.g7320e95886-goog

