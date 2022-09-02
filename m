Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE127497
	for <llvm@lists.linux.dev>; Fri,  2 Sep 2022 21:37:57 +0000 (UTC)
Received: by mail-pl1-f202.google.com with SMTP id q6-20020a17090311c600b0017266460b8fso1929690plh.4
        for <llvm@lists.linux.dev>; Fri, 02 Sep 2022 14:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date;
        bh=HDZJ0lSRQoma7HASH55s+Lq3/kCI0PVAr3SKG55mmDE=;
        b=rBbZGj2hyaPbBdrQ8ZAtAd8fBVTk/aNT+PMfh4D+6g9Dnr1lJ+8WgvE2JpQSQ5mpKr
         LT2dmPZTqjjH4ka2YE7gNLcVOQ7eD+OWNfyQ2AkU6DMz3lRStI2yu9n2MfIPoTx7L5ey
         +2YIepUmQxsASZ4ckcGjskYeuPdVvt1j/Wcq+jPORMIzjcCPcV4PD0zHxpxeC1Oq2wre
         +8hAszoekk7kAiAJsqgWbZ2ymL+wkxPxV5ctB6USiI8NBgGNkPygEfA6Bm89F2jwk/eS
         piZC+qd+beRl05PxC+rpuQfD/8nEToe3qBGP0kiN2/ERGnRCwcAREuiF7Yu7Hu4WltFr
         fYMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date;
        bh=HDZJ0lSRQoma7HASH55s+Lq3/kCI0PVAr3SKG55mmDE=;
        b=zn0a0yQxjRdEPxyC3bYuQPBeE2OIxcIfWcP1tdpfJyabRLRVX77c2MSumNliulkTHG
         cSI+gXDN/TgmYAk2BulU2KTUSP9ZLIWqiJmkvWAqsvbrh8FHnG8aaYR+vcmkFqj4GZBc
         T1a0y4pdSL/LQpnkg/qyNGcyXpi2SW+NRVv3OOPNnKV4RzFg6zwKW4ZdRwRaotmoAlRZ
         txOIZ5R9KBTPmZv8gK3UBy/5fRpce14ZjOVVr5nqZM9LWI7iFn6IMl2UpdTk8Y3fjKwk
         NVK2BcH/PFeFHlOenwT1dxk1rc+ZhXDLXE5nu6BTzI5xUcnZcFfpjt240SzsFU4dAlx4
         wjNQ==
X-Gm-Message-State: ACgBeo0/GGgwbWn6xh5Q6gQ0o5SUl8O9DZGUnfynAVQZcvsKDxgoVlna
	Ek8KPA/saXZT5muacMBO85/jjG0/
X-Google-Smtp-Source: AA6agR6rg/qLo+yQa1/A/MnMpENNlMrew4RjKFVFUDSg5m3sigIjZqHtxPyD4LsEch28EwHGn9DhXIq91Q==
X-Received: from fawn.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5795])
 (user=morbo job=sendgmr) by 2002:a17:90b:264a:b0:1fd:f88d:dbad with SMTP id
 pa10-20020a17090b264a00b001fdf88ddbadmr7040192pjb.93.1662154677243; Fri, 02
 Sep 2022 14:37:57 -0700 (PDT)
Date: Fri,  2 Sep 2022 21:37:50 +0000
In-Reply-To: <20220902213750.1124421-1-morbo@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220902213750.1124421-1-morbo@google.com>
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220902213750.1124421-3-morbo@google.com>
Subject: [PATCH 2/2] x86/paravirt: add extra clobbers with ZERO_CALL_USED_REGS enabled
From: Bill Wendling <morbo@google.com>
To: Juergen Gross <jgross@suse.com>, "Srivatsa S. Bhat (VMware)" <srivatsa@csail.mit.edu>, 
	Alexey Makhalov <amakhalov@vmware.com>, VMware PV-Drivers Reviewers <pv-drivers@vmware.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, virtualization@lists.linux-foundation.org, 
	linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev
Cc: Bill Wendling <morbo@google.com>
Content-Type: text/plain; charset="UTF-8"

The ZERO_CALL_USED_REGS feature may zero out caller-saved registers
before returning.

In spurious_kernel_fault(), the "pte_offset_kernel()" call results in
this assembly code:

.Ltmp151:
        #APP
        # ALT: oldnstr
.Ltmp152:
.Ltmp153:
.Ltmp154:
        .section        .discard.retpoline_safe,"",@progbits
        .quad   .Ltmp154
        .text

        callq   *pv_ops+536(%rip)

.Ltmp155:
        .section        .parainstructions,"a",@progbits
        .p2align        3, 0x0
        .quad   .Ltmp153
        .byte   67
        .byte   .Ltmp155-.Ltmp153
        .short  1
        .text
.Ltmp156:
        # ALT: padding
        .zero   (-(((.Ltmp157-.Ltmp158)-(.Ltmp156-.Ltmp152))>0))*((.Ltmp157-.Ltmp158)-(.Ltmp156-.Ltmp152)),144
.Ltmp159:
        .section        .altinstructions,"a",@progbits
.Ltmp160:
        .long   .Ltmp152-.Ltmp160
.Ltmp161:
        .long   .Ltmp158-.Ltmp161
        .short  33040
        .byte   .Ltmp159-.Ltmp152
        .byte   .Ltmp157-.Ltmp158
        .text

        .section        .altinstr_replacement,"ax",@progbits
        # ALT: replacement 1
.Ltmp158:
        movq    %rdi, %rax
.Ltmp157:
        .text
        #NO_APP
.Ltmp162:
        testb   $-128, %dil

The "testb" here is using %dil, but the %rdi register was cleared before
returning from "callq *pv_ops+536(%rip)". Adding the proper constraints
results in the use of a different register:

        movq    %r11, %rdi

        # Similar to above.

        testb   $-128, %r11b

Link: https://github.com/KSPP/linux/issues/192
Signed-off-by: Bill Wendling <morbo@google.com>
Reported-and-tested-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/x86/include/asm/paravirt_types.h | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/paravirt_types.h b/arch/x86/include/asm/paravirt_types.h
index f04157456a49..b1ab5d94881b 100644
--- a/arch/x86/include/asm/paravirt_types.h
+++ b/arch/x86/include/asm/paravirt_types.h
@@ -414,8 +414,17 @@ int paravirt_disable_iospace(void);
 				"=c" (__ecx)
 #define PVOP_CALL_CLOBBERS	PVOP_VCALL_CLOBBERS, "=a" (__eax)
 
-/* void functions are still allowed [re]ax for scratch */
+/*
+ * void functions are still allowed [re]ax for scratch.
+ *
+ * The ZERO_CALL_USED REGS feature may end up zeroing out callee-saved
+ * registers. Make sure we model this with the appropriate clobbers.
+ */
+#ifdef CONFIG_ZERO_CALL_USED_REGS
+#define PVOP_VCALLEE_CLOBBERS	"=a" (__eax), PVOP_VCALL_CLOBBERS
+#else
 #define PVOP_VCALLEE_CLOBBERS	"=a" (__eax)
+#endif
 #define PVOP_CALLEE_CLOBBERS	PVOP_VCALLEE_CLOBBERS
 
 #define EXTRA_CLOBBERS	 , "r8", "r9", "r10", "r11"
-- 
2.37.2.789.g6183377224-goog

