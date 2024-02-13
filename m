Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E43F53392
	for <llvm@lists.linux.dev>; Tue, 13 Feb 2024 12:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707828140; cv=none; b=I1F6JYMrDbdPY1M64iB5G3aLgof/Y1t+McMGPovjfZHy2r2rq80fdUulI/5F30DBmcXI2hSjQC9dCrvR3qlVDJKk1ZlDhiLUSZHDkYJre7xBxgkc63up0QSl+h2VVYApX98iQm77dRhetzGlGhRItpUyFW6bTVpukHWfy6E/cS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707828140; c=relaxed/simple;
	bh=CEh5RLJcC6IgrEQHXZSi19euYte1lfU4DaXYg20d8/k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=cx3hk2vO2qifpWbfKFsiuZwB2L8LPqCWpwWeZCCgMIOxt5I4G1w2YdFIbC8ptbcbIxQVUA4Ahhhhf7kYFFtL4a4c6PWCO4ank2GQrOjJNTS475pF/xwgzNv/JLnH/C8NgPezQyXuGEzERgKuo2rmbWdKYd0iFL6emgnxIl1dMfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3ENvXf76; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3ENvXf76"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-33b26d4294dso1827513f8f.0
        for <llvm@lists.linux.dev>; Tue, 13 Feb 2024 04:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707828137; x=1708432937; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tmJq7yGJtig/x243U4iqbWlHcuxPy6IsUUTLst4tAO8=;
        b=3ENvXf76B/5DpH84k7JfMTMCsXvzLTB4lzFKBUYa7uvoHLFy/VJaUm7AINOLBxO3CX
         MO/tnSfjnjn5+F8Me0VsNawnIiwcFz7DdPdjjWIm0INWZmgUwtJxP0/qB6OwwcvAbIng
         eztEqwS09t8jpK++C2ZV4zqC837qWnillJLL45D1C9e0oNhLX+mPNQLJsK4QS857z6wR
         UEDVK1V97m2KvaaYJhrjpexJFrBx3JAqIJx5zd5MxgNV7iW2yoD2LhLKm2nweL1BPW1X
         WYwpHFYff7UpGnlVVO4/xX2MD7QtHeGqBa/JwvOg2bCtywPqqYOtjIJdxXCPkK+dxb5C
         s92g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707828137; x=1708432937;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tmJq7yGJtig/x243U4iqbWlHcuxPy6IsUUTLst4tAO8=;
        b=FwdB3cbYhJyMNliie3lufXG4p6dFzRP1E33Lo5SKXTw0uo/igGgyoS0thn9s1T3t1G
         QlyPWfXZbR4+n4mgK7xbZ6e79JhcvA8V0WGhimdmPXFDHvpfY37aR9MxHdC1ZLf4Npmb
         x9phrCkP3r/LlDjhse/GQ9FFHRPOFxxGCQATgHbqsiYRjmQrtbQSqTgrFtcygc9mcVGp
         lhbgpfOJnqQ7msHOc5Zqenl4EEook/mwaYT51VoyrDnkMA6xL2RbhWUDM9H8z36lUS8D
         RPW/kI60GBvNR7UbxZgtFdL7cA9dTC5ouaXSJ7LpFTVivofhKRjCXAFIWb+KlPt2w4Xv
         0bBA==
X-Forwarded-Encrypted: i=1; AJvYcCVMBdOawH7j7avNa/OVEcoBF/HSyJTEDalGq1c2++OCbWxSVE4TmYVLaEwYSBUE6RmDgx/JNVIpoYHgCOUoPkdoeI/GGA==
X-Gm-Message-State: AOJu0YyC1nyNbwnfUPaYuTUBsTA4IMiEws9FS0L7ORyh04b//tlOZtMm
	gaNnyobSO/2oejLB5BScDX/Xpe5tDn9CJ+RizRiXWLddR+x2tr3W9qzyhYuiUNX+SIBPHw==
X-Google-Smtp-Source: AGHT+IGyQVWB+fo+LR59Bx8+rlXEeatDD6WUWmQdXk1EX1AAwc7fU6kdYHiiwnYm8ZP3Z4zYoEQQLvHS
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:118a])
 (user=ardb job=sendgmr) by 2002:a05:6000:1e0c:b0:33b:4a51:f0ed with SMTP id
 bj12-20020a0560001e0c00b0033b4a51f0edmr18827wrb.4.1707828137638; Tue, 13 Feb
 2024 04:42:17 -0800 (PST)
Date: Tue, 13 Feb 2024 13:41:51 +0100
In-Reply-To: <20240213124143.1484862-13-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240213124143.1484862-13-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2179; i=ardb@kernel.org;
 h=from:subject; bh=SH5BCZpD7eT9rYWqZ8AiKPxoLpu9BlwPcI3lpvrnWyw=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIfV0cn/7uaRP4tGTt8a01H99Oak74PEDlrXnFvfZ+AsXH
 pF9buLQUcrCIMbBICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACbycw7Df++Drjf+P264pyab
 4jnl+emnm7K3nNr8cPvT223G2e5TkmYxMhw42hws/q71rUN8xDQV3cq5AQunJUxU/O+a+Fn8zG3 +aFYA
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
Message-ID: <20240213124143.1484862-20-ardb+git@google.com>
Subject: [PATCH v4 07/11] efi/libstub: Add generic support for parsing mem_encrypt=
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
2.43.0.687.g38aa6559b0-goog

