Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B142C1CD24
	for <llvm@lists.linux.dev>; Tue,  6 Feb 2024 22:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707259010; cv=none; b=u6YqrWEVrN2MtDnTsc4AFu3jFum+SNC/KqShi3dpDF0iJD5n+db4JZTcnqyQ3d7bIvl8Tx3uuF4p4h4mr/c3L32KHcSe8RmQ7VjAezeSjHd6oJiqoSj8LoQh4DQnGai92HRcpcjt9RnW9GOgdeWGhNwnHgLymD7HgAf2ofDYSF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707259010; c=relaxed/simple;
	bh=N6KTTGVlioPgR9j+o8pygtYiTQpajG3elp7P2BRhHJ4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=hVpOrXczGgyEXAfNTcYjviOe1gWrroMzPn44yEHYm5CoWXZ4z9uxNjynuvSelSMPqoQQsq6+o3TxXjP0OKiAyAbyOYJIAz2vW1mmzdcfhqMH2bQbG5kmtnBPguQ2/aPqhhF65E4wys67gtEbuOpzgPGEpPrpTBlynCFJUEAuBgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--acdunlap.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jtJj1GZD; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--acdunlap.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jtJj1GZD"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-60484dba283so90927b3.3
        for <llvm@lists.linux.dev>; Tue, 06 Feb 2024 14:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707259007; x=1707863807; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=S9KktXhbpCP9EKhC0dGFOyn7FIX3yfw9fFagtMfvzvU=;
        b=jtJj1GZDP5wYhI65AKsLymEqt7G5osBE+Rg4/c6+d8eO3imx9OKAhoAlBelQWWADMP
         U7Z+vvWTxHQbK5Iot3SrddPuqQ/5gHc/JM5Fej/Gars7bA7QqVRvpoDsKV/E8j+5m0X4
         MtOUeB/2nzW//AF+akcA0ooheSg6JfBqNjWhfxz/w/km+lUU7C6tOKKVAaj2DVv00erb
         I7FFuIrkf72VEww1yQfvVhMVdO9QdH/3SWF31hj4WN9UdZwx8TpZxGDwg8gEUwG6iAin
         Lbnkjb3uDu7UanbR6PIdkCY20FfAjDfZoUX6doQa/d2+x6x9EyOaMOSwp52uUECFOHIz
         kHfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707259007; x=1707863807;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S9KktXhbpCP9EKhC0dGFOyn7FIX3yfw9fFagtMfvzvU=;
        b=Sf+e9IAX89Z6utjsVTCurhebuyq1PCI2xi8K8D8N3IdzH5u8eIvy1Ct/1jO5jf0dYT
         3hgt6f7b7Qj39SVmDaf+XZQw14IvtzLyrb5sgci+OVnbJ8JRjJh3La24MjH3hyTlT0DG
         zOsXZZpOeXbMFGzk5u3CuBEyS97fcwgZuEQZeOiVNnyCd1dgTBylmAymRt2t/6ag82U0
         fd4Xl+2fBo94hfn+AlBoypAByVILoZYVxMf/z38m65GPFdB8fXS7AhOUeAcTLS8tu5PE
         T5JtgnDzq5Tga7TorbWdKHqO5sTSOYFre+lSKRKcAzThUH+2WtNi86Du6E/7pk158Z9V
         uBhQ==
X-Gm-Message-State: AOJu0YwbAlj1XnR3cNwMCfwL4R6QK2JY4f6pApSZm7ZjmTQa/jB4wOhO
	68GWyepgL3YgCa6iwZYa2RRozKPM1jBmMruGj3RH4ENDpLt4/XTAorehpC7703gHP2Qd0dRm9Ro
	qAIkWCTR5lw==
X-Google-Smtp-Source: AGHT+IG7gLSaa9jMCT9d0NEPqxvKadBuDEXuteGmsRb0eeA7aKaH3TsZ4sN4MtvnolZG6mfBKokO9qJycTAqRA==
X-Received: from anticipation.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4517])
 (user=acdunlap job=sendgmr) by 2002:a05:690c:fd0:b0:604:1eea:a39e with SMTP
 id dg16-20020a05690c0fd000b006041eeaa39emr435630ywb.3.1707259007638; Tue, 06
 Feb 2024 14:36:47 -0800 (PST)
Date: Tue,  6 Feb 2024 14:36:20 -0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0.594.gd9cf4e227d-goog
Message-ID: <20240206223620.1833276-1-acdunlap@google.com>
Subject: [PATCH v3] x86/asm: Force native_apic_mem_read to use mov
From: Adam Dunlap <acdunlap@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, 
	Arjan van de Ven <arjan@linux.intel.com>, Wei Liu <wei.liu@kernel.org>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Jacob Xu <jacobhxu@google.com>, Alper Gun <alpergun@google.com>, 
	Kevin Loughlin <kevinloughlin@google.com>, Peter Gonda <pgonda@google.com>, 
	Ard Biesheuvel <ardb@kernel.org>
Cc: Adam Dunlap <acdunlap@google.com>
Content-Type: text/plain; charset="UTF-8"

When done from a virtual machine, instructions that touch APIC memory
must be emulated. By convention, MMIO access are typically performed via
io.h helpers such as 'readl()' or 'writeq()' to simplify instruction
emulation/decoding (ex: in KVM hosts and SEV guests) [0].

Currently, native_apic_mem_read does not follow this convention,
allowing the compiler to emit instructions other than the mov generated
by readl(). In particular, when compiled with clang and run as a SEV-ES
or SEV-SNP guest, the compiler would emit a testl instruction which is
not supported by the SEV-ES emulator, causing a boot failure in that
environment. It is likely the same problem would happen in a TDX guest
as that uses the same instruction emulator as SEV-ES.

To make sure all emulators can emulate APIC memory reads via mov, use
the readl function in native_apic_mem_read. It is expected that any
emulator would support mov in any addressing mode it is the most generic
and is what is ususally emitted currently.

The testl instruction is emitted when native_apic_mem_read
is inlined into __xapic_wait_icr_idle. The emulator comes from
insn_decode_mmio in arch/x86/lib/insn-eval.c. It would not be worth it
to extend insn_decode_mmio to support more instructions since, in
theory, the compiler could choose to output nearly any instruction for
such reads which would bloat the emulator beyond reason.

An alterative to this approach would be to use inline assembly instead
of the readl helper, as that is what native_apic_mem_write does. I
consider using readl to be cleaner since it is documented to be a simple
wrapper and inline assembly is less readable. native_apic_mem_write
cannot be trivially updated to use writel since it appears to use custom
asm to workaround for a processor-specific bug.

[0] https://lore.kernel.org/all/20220405232939.73860-12-kirill.shutemov@linux.intel.com/

Signed-off-by: Adam Dunlap <acdunlap@google.com>
Tested-by: Kevin Loughlin <kevinloughlin@google.com>
---

Patch changelog:
V1 -> V2: Replaced asm with readl function which does the same thing
V2 -> V3: Updated commit message to show more motivation and
justification

Link to v2 discussion: https://lore.kernel.org/all/20220908170456.3177635-1-acdunlap@google.com/

 arch/x86/include/asm/apic.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/apic.h b/arch/x86/include/asm/apic.h
index 9d159b771dc8..dddd3fc195ef 100644
--- a/arch/x86/include/asm/apic.h
+++ b/arch/x86/include/asm/apic.h
@@ -13,6 +13,7 @@
 #include <asm/mpspec.h>
 #include <asm/msr.h>
 #include <asm/hardirq.h>
+#include <asm/io.h>
 
 #define ARCH_APICTIMER_STOPS_ON_C3	1
 
@@ -96,7 +97,7 @@ static inline void native_apic_mem_write(u32 reg, u32 v)
 
 static inline u32 native_apic_mem_read(u32 reg)
 {
-	return *((volatile u32 *)(APIC_BASE + reg));
+	return readl((void __iomem *)(APIC_BASE + reg));
 }
 
 static inline void native_apic_mem_eoi(void)
-- 
2.43.0.594.gd9cf4e227d-goog

