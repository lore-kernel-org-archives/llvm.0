Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C266C5914C
	for <llvm@lists.linux.dev>; Thu, 25 Jan 2024 11:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706182397; cv=none; b=G82USTw1WPWSwSErp5XUXSEzDKpWN6De4Xz+ZFB6zuBx48v7x/pIMJWO6MrTP+jHUi+Q+pDQtaaxaoWbA8eclCQed9o3WRdZGBYcyiaxxd9PIBk9VwjsUlIrSz6PmUUJtKBDYlYmqM07PnWDWohFpXZdWlZSJ7F9Lt0otbjiaNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706182397; c=relaxed/simple;
	bh=P7SsUUZGFAoKRtQbrSSh80tauvm72OXVWNmZkHlq190=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Lg+rBeUFc59EwFDrez6qOwf5xulcJz6ipilQBf/PWvd1fuPrgji14KJdqu+vG0Lrj4GFFjmG5KQVpdq2rtOkgdFGCT9vdhoswnRiiBuZ9PPp8B9faM0MINdhiaXGKRa25WUy//fQXHD9sK6r8vKzKiH2lQWcSeL+G9ttDkfiCz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SMikwJJ8; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SMikwJJ8"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-40eb06001c2so37551405e9.0
        for <llvm@lists.linux.dev>; Thu, 25 Jan 2024 03:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706182394; x=1706787194; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hBUWnFeDK9kwJnQ8v39o1YEuf+vNzkyqOxxuFopn5io=;
        b=SMikwJJ8HFIQUuy6Z58GZbOPnmElzu9YrbAWR3YpOgQMcDx28ohIChcqJdyO+1xB92
         jrghlcUnHypzSO+T2wJV4arjL5yGL6rva7JD3iwVjhdkFNn0b47aiUV2QO0ZaH8n+5WJ
         kWSD5v2Q9rkS9XA7pRXUb7IKmGAfdtrmmlTeDY+hGgdXhCE/K6ZYzjcF9cRqn3NMOjBj
         0FkCePlXY25lb7gee/IOYdVw9+25/XwwmCuu/oMy5CPjNr/gawC48VarWQmvTICwp1/f
         xOg8yHMv6yHFLvF3Vs0pcSQ4DyPQVs9FDJOsHxEF39RiygTE5O7Cp6aBSfCWW5h81RPG
         TyTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706182394; x=1706787194;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hBUWnFeDK9kwJnQ8v39o1YEuf+vNzkyqOxxuFopn5io=;
        b=Cgu0zvmzIH0W2f10djonYux8y78RELzGwQX8ArQ/eFH+nSCSUS95UKnMhhpXweMEGc
         BcL+W3WzcEJFwqP6SMSsZA5gM3pYmo6M0nxq7/isgq0f5YySJ7ZyvqMaScP78Hd4DDCd
         JtKyTTdhYFkt+f/gh1Sv9vF/o3h5ruqUihh/kqyGwLIKV3NETC/dBNRAg8cRtKnE3gED
         Rk/ZznrPFnIYgTZG5lOkT8FnnbbMj816ViO3ywO4ICGEDmtn2rGv2ZdceMXj4AAasusr
         K2h5DPRPviAmI3+CsyyKjXbUSNl+6W+LCvwCBfEvkO7KUYshX7/X827Y5fSLj3aj40XK
         o5Fg==
X-Gm-Message-State: AOJu0YwfcVpSqof1/Y0ZXO2FsVgv5RmG/Ye9fxwPPFik+6Q6UNWAo6Er
	88tErODJwrVY4tRt1AvYds6zYh6yih3DEMQZ2p2QLxUUNG/H5YvzL2ueeefeRJBWz/YSbw==
X-Google-Smtp-Source: AGHT+IHzdyFKwRZfLQOx7Liz3jisEWS93tZ5bagY94cYYG4ibLNtFhAJRkFG5YBEzc0iKOjl3ug3Mp3Y
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:118a])
 (user=ardb job=sendgmr) by 2002:a05:600c:1e03:b0:40e:d31f:4cf8 with SMTP id
 ay3-20020a05600c1e0300b0040ed31f4cf8mr16460wmb.3.1706182394116; Thu, 25 Jan
 2024 03:33:14 -0800 (PST)
Date: Thu, 25 Jan 2024 12:28:35 +0100
In-Reply-To: <20240125112818.2016733-19-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240125112818.2016733-19-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3710; i=ardb@kernel.org;
 h=from:subject; bh=JT1olNiwpLiAazvRYxL/s0mN0D+4v2kwCKTsMENT5/8=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIXWTG5Om96fFG3IbTStkj79Symr2m+K3+H2fZ6N1zjRVN
 wPZNXs7SlkYxDgYZMUUWQRm/3238/REqVrnWbIwc1iZQIYwcHEKwEQ2VjP893miFvbly6s19kvZ
 X+/6Hxq4oTuqS/Xx3b/1m3/WqujxPGf4p6Slc1LTL3iz04Wers3bufROzWqd1m7CrXkmqbRDa1c LMwA=
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
Message-ID: <20240125112818.2016733-35-ardb+git@google.com>
Subject: [PATCH v2 16/17] x86/sev: Drop inline asm LEA instructions for
 RIP-relative references
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Kevin Loughlin <kevinloughlin@google.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Dionna Glaze <dionnaglaze@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Justin Stitt <justinstitt@google.com>, 
	Brian Gerst <brgerst@gmail.com>, linux-arch@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

The SEV code that may run early is now built with -fPIC and so there is
no longer a need for explicit RIP-relative references in inline asm,
given that is what the compiler will emit as well.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/mm/mem_encrypt_identity.c | 37 +++-----------------
 1 file changed, 5 insertions(+), 32 deletions(-)

diff --git a/arch/x86/mm/mem_encrypt_identity.c b/arch/x86/mm/mem_encrypt_identity.c
index 20b23da4a26d..2d857e3a560a 100644
--- a/arch/x86/mm/mem_encrypt_identity.c
+++ b/arch/x86/mm/mem_encrypt_identity.c
@@ -86,10 +86,6 @@ struct sme_populate_pgd_data {
  */
 static char sme_workarea[2 * PMD_SIZE] __section(".init.scratch");
 
-static char sme_cmdline_arg[] __initdata = "mem_encrypt";
-static char sme_cmdline_on[]  __initdata = "on";
-static char sme_cmdline_off[] __initdata = "off";
-
 static void __pitext sme_clear_pgd(struct sme_populate_pgd_data *ppd)
 {
 	unsigned long pgd_start, pgd_end, pgd_size;
@@ -333,14 +329,6 @@ void __pitext sme_encrypt_kernel(struct boot_params *bp)
 	}
 #endif
 
-	/*
-	 * We're running identity mapped, so we must obtain the address to the
-	 * SME encryption workarea using rip-relative addressing.
-	 */
-	asm ("lea sme_workarea(%%rip), %0"
-	     : "=r" (workarea_start)
-	     : "p" (sme_workarea));
-
 	/*
 	 * Calculate required number of workarea bytes needed:
 	 *   executable encryption area size:
@@ -350,7 +338,7 @@ void __pitext sme_encrypt_kernel(struct boot_params *bp)
 	 *   pagetable structures for the encryption of the kernel
 	 *   pagetable structures for workarea (in case not currently mapped)
 	 */
-	execute_start = workarea_start;
+	execute_start = workarea_start = (unsigned long)sme_workarea;
 	execute_end = execute_start + (PAGE_SIZE * 2) + PMD_SIZE;
 	execute_len = execute_end - execute_start;
 
@@ -517,9 +505,9 @@ static int __pitext __strncmp(const char *cs, const char *ct, size_t count)
 
 void __pitext sme_enable(struct boot_params *bp)
 {
-	const char *cmdline_ptr, *cmdline_arg, *cmdline_on, *cmdline_off;
 	unsigned int eax, ebx, ecx, edx;
 	unsigned long feature_mask;
+	const char *cmdline_ptr;
 	bool active_by_default;
 	unsigned long me_mask;
 	char buffer[16];
@@ -590,21 +578,6 @@ void __pitext sme_enable(struct boot_params *bp)
 		goto out;
 	}
 
-	/*
-	 * Fixups have not been applied to phys_base yet and we're running
-	 * identity mapped, so we must obtain the address to the SME command
-	 * line argument data using rip-relative addressing.
-	 */
-	asm ("lea sme_cmdline_arg(%%rip), %0"
-	     : "=r" (cmdline_arg)
-	     : "p" (sme_cmdline_arg));
-	asm ("lea sme_cmdline_on(%%rip), %0"
-	     : "=r" (cmdline_on)
-	     : "p" (sme_cmdline_on));
-	asm ("lea sme_cmdline_off(%%rip), %0"
-	     : "=r" (cmdline_off)
-	     : "p" (sme_cmdline_off));
-
 	if (IS_ENABLED(CONFIG_AMD_MEM_ENCRYPT_ACTIVE_BY_DEFAULT))
 		active_by_default = true;
 	else
@@ -613,12 +586,12 @@ void __pitext sme_enable(struct boot_params *bp)
 	cmdline_ptr = (const char *)((u64)bp->hdr.cmd_line_ptr |
 				     ((u64)bp->ext_cmd_line_ptr << 32));
 
-	if (cmdline_find_option(cmdline_ptr, cmdline_arg, buffer, sizeof(buffer)) < 0)
+	if (cmdline_find_option(cmdline_ptr, "mem_encrypt", buffer, sizeof(buffer)) < 0)
 		return;
 
-	if (!__strncmp(buffer, cmdline_on, sizeof(buffer)))
+	if (!__strncmp(buffer, "on", sizeof(buffer)))
 		sme_me_mask = me_mask;
-	else if (!__strncmp(buffer, cmdline_off, sizeof(buffer)))
+	else if (!__strncmp(buffer, "off", sizeof(buffer)))
 		sme_me_mask = 0;
 	else
 		sme_me_mask = active_by_default ? me_mask : 0;
-- 
2.43.0.429.g432eaa2c6b-goog

