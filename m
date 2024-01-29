Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B607A3F9D6
	for <llvm@lists.linux.dev>; Mon, 29 Jan 2024 18:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706551534; cv=none; b=qUWcJA2kx1EYt9pMKP9M44fRRUgiIO5eAa+UB4T1wvp4IqCvvtDFYLlWx/x/3V38biyPOdeeOmsk5b1Km3vtPxh7JBusjWq7Fw4OLDhUnUE6ALHNZICtdmp4KepnZ5ltfY0Mq6yYNCYsDDiNfAJuUyBqQmScjUX/t3vomskq0Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706551534; c=relaxed/simple;
	bh=8EngcPiV4/gVfKgvYtooxy7CfkplaV+JIi8nleL+nv8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=r5QMmG7waGinbozTBrIz9/mlIkBapWQ7BDylBiaY+gpe8lmPhKpF5tkskOyg6BImw3Bbeh/Y+xJocq4jk/aT1Ox3LDaAxelRioL+GFgoBJoX8UVy/S+xigFMXLyjlCDNecy3bBR6KcaXxW2bISA3hhQBoGxh+2fttcvXaxYoMAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bWmuXBLQ; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bWmuXBLQ"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-33af10efa37so439289f8f.1
        for <llvm@lists.linux.dev>; Mon, 29 Jan 2024 10:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706551531; x=1707156331; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZKxz5I1lJ14YrwiTICZR28lgBpbE1gmuL2Ys4svPQiQ=;
        b=bWmuXBLQE+2n93CO+kPS4PE7XyvhDKyZSztlUA54OfwoQUOt3x65sZyzgl6trRIXl2
         IEmd5aYcXWsYM5i+OZ/jO5psJriP1QVUCWM6/pWMU44UIUJ4sbyVwZKsRpNz+8+d1YHv
         9MP41reImfOoDgtQiNnIVnRMgApL2BbxV6OqjQqXHQd/J9V/yZUzYxML3uVB0UydNmUX
         tnQ5KyqPbktTUpSFT+25CVfpejSVHo7N+0aCYF+M9QtoX5Jld9vStpoyLmvrgfd/vrLV
         dq8icTjj76D8Ow0y3cyjXE42bd++SfsxBhNn8HyWNeiTSs2Pyy0cM/GUSuMMuOKJnJz8
         KF8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706551531; x=1707156331;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZKxz5I1lJ14YrwiTICZR28lgBpbE1gmuL2Ys4svPQiQ=;
        b=oOSsSZsNBdbfBxRw7uK18VLt6KaJZj7HyzYEseWfmOMnYMKnSondVWjCzMOX6U2PdQ
         w25oEUdnd0wErOA54dAZHOnNaUZpU4aC0AOzFLW6VeoS15yqp6rua2qOa1rTYggSmhiR
         Of32ndr1r22GbiBOPeLYzarXrenlCD9VjT9LmAUGGPpt3KYe58eW1vkvbU7DwYxVO8a9
         LLqsgdg2NE4VeOiGRuGolURBWOpe1d+buhrgUFzHABArRhUbfjTgNPLCkY7LRqtdZCt+
         m9sImOUOBUhWBDke2s8Tl8DX6k8mr4qkIwPw8TWczJ9m46mjzbOUruRGvUlv14oRNZOW
         0gCA==
X-Gm-Message-State: AOJu0YwIlbgaHirJJZbl9OZRt7EaLpZnEwJRKcgY6TR9RCuhfQomfdql
	UhZMJFwvraV8rV13k8FJbeORl0jPfFNNubMazAZ4mq8Ngp1YOCTa1kndHHpv9kPKwtU/0w==
X-Google-Smtp-Source: AGHT+IHqXoqSxlnq+tXgVV8MITvhCNMHm/mI4bOyTcP8eXKfAYEXj2pInMqp+zkM42KE9U02vk3dc98V
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:118a])
 (user=ardb job=sendgmr) by 2002:a5d:5a97:0:b0:33a:f355:7f2a with SMTP id
 bp23-20020a5d5a97000000b0033af3557f2amr3448wrb.8.1706551531045; Mon, 29 Jan
 2024 10:05:31 -0800 (PST)
Date: Mon, 29 Jan 2024 19:05:04 +0100
In-Reply-To: <20240129180502.4069817-21-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240129180502.4069817-21-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2179; i=ardb@kernel.org;
 h=from:subject; bh=cYtM8PUyOXvYlw4FeyoL0t7P65MWzmFujl4gVlusCbs=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIXX7iwvJHgmKYd5qZlpNAZqZUfs+Xyudf+rqhncfljw00
 JxmfF26o5SFQYyDQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAExk9nNGhiUtf/QfJmu4l6R7
 +lzQmanC+t38+7/fDQ2K2fFPtm50XcDIcNKRZbZu+RGrc37Gq9csORj73Tspw+TyQoeoVU5WT8O W8gMA
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
Message-ID: <20240129180502.4069817-22-ardb+git@google.com>
Subject: [PATCH v3 01/19] efi/libstub: Add generic support for parsing mem_encrypt=
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
2.43.0.429.g432eaa2c6b-goog

