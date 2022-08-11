Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDD046A8
	for <llvm@lists.linux.dev>; Thu, 11 Aug 2022 18:00:47 +0000 (UTC)
Received: by mail-pl1-f201.google.com with SMTP id d3-20020a170902cec300b0016f04e2e730so11646898plg.1
        for <llvm@lists.linux.dev>; Thu, 11 Aug 2022 11:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:mime-version:message-id:date:from:to:cc;
        bh=AHPdF2iNp843/qxwt9o0Z5Yx70qagBEm5XUA1AZJq3s=;
        b=hUouphILeY+7ZcreKxlU1ukdbwKI/z0PLnXdxgXRyGG+IFml1nB8pn1mmAe2cXc0XR
         FMB3hhPzAuGQtoJxfAw5hwOsTQmpXmtOFkydYbAXW7d6pcehx4QDo49aKDsCj5o8A324
         /VCxSnrbNVogJeIsO+bCb970/vWvnt5k/acHwbkLauSk5dpHDBgRKIdR2Bkj4PH/QF37
         ypfexny7+yt3N7PuLCfp3J9Tmb25wfvkeAm7zojmAueiEHE+y+xz1lf/57Ohd4orIeK5
         k+zd6pTc3V3h7Ji5hdleQh8BRWqLkmVw5x17GN10XTcnp6/GW/uMVMsVg/H2DMpjWpZY
         3ieg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc;
        bh=AHPdF2iNp843/qxwt9o0Z5Yx70qagBEm5XUA1AZJq3s=;
        b=KsVF9oYYY0kqy38d3vR3E5+PlF5nvtLcCxnZkgyZdLnoPvO5uURX9G2zK9lBqMfvIG
         qJQXMyxZj9To5Zs9DF7dOg/TgJaACBwRbnTUNoyD+AIt2BZkG/XmUGBZ+OMJ/uhBgBLz
         PchmlSc/gBf01BiRrargIWQv5VSJ9SWme0lcf9D/xP95mHdfSksRsc7INmo+7TH9owcr
         HMquKpsDbzAZ2r3PrPnacW6kvBEDXD4PYOwFvWaF/qxWnWlFOUvkK4trHWPOx7AF/92U
         eX84lY98uQBODZs4KS422w/jH68YsW8zn+RkJ82HPYQDb9JTIfh8MxaVepDw8FdWslqY
         ma5w==
X-Gm-Message-State: ACgBeo2CLz1fK7h72ZjQM0P0GWt/lgq45SlauYzS2vYq9dt2Ev2/4kpF
	WtNkPnIK19aV1ANjw1+BD72dYl6W0eLyMQ==
X-Google-Smtp-Source: AA6agR6WWvqchDPxP5kAGNu/Ulq/79XUJejAqx8e373GcLQEy+qt6A+bV5PazXaTWuXtO6rWlR/bUqmxn0Ytqg==
X-Received: from acdunlap03.bve.corp.google.com ([2620:15c:29:203:7899:c3d8:a49a:7086])
 (user=acdunlap job=sendgmr) by 2002:a17:90b:20e:b0:1f5:26b0:f506 with SMTP id
 fy14-20020a17090b020e00b001f526b0f506mr187731pjb.65.1660240847029; Thu, 11
 Aug 2022 11:00:47 -0700 (PDT)
Date: Thu, 11 Aug 2022 11:00:10 -0700
Message-Id: <20220811180010.3067457-1-acdunlap@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.1.559.g78731f0fdb-goog
Subject: [PATCH] x86/asm: Force native_apic_mem_read to use mov
From: Adam Dunlap <acdunlap@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Sean Christopherson <seanjc@google.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	Andi Kleen <ak@linux.intel.com>, Adam Dunlap <acdunlap@google.com>, 
	Ben Dooks <ben-linux@fluff.org>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Cc: Jacob Xu <jacobhxu@google.com>, Alper Gun <alpergun@google.com>, 
	Marc Orr <marcorr@google.com>
Content-Type: text/plain; charset="UTF-8"

Previously, when compiled with clang, native_apic_mem_read gets inlined
into __xapic_wait_icr_idle and optimized to a testl instruction. When
run in a VM with SEV-ES enabled, it attempts to emulate this
instruction, but the emulator does not support it. Instead, use inline
assembly to force native_apic_mem_read to use the mov instruction which
is supported by the emulator.

Signed-off-by: Adam Dunlap <acdunlap@google.com>
Reviewed-by: Marc Orr <marcorr@google.com>
Reviewed-by: Jacob Xu <jacobhxu@google.com>
---
 arch/x86/include/asm/apic.h | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/apic.h b/arch/x86/include/asm/apic.h
index 3415321c8240..281db79e76a9 100644
--- a/arch/x86/include/asm/apic.h
+++ b/arch/x86/include/asm/apic.h
@@ -109,7 +109,18 @@ static inline void native_apic_mem_write(u32 reg, u32 v)
 
 static inline u32 native_apic_mem_read(u32 reg)
 {
-	return *((volatile u32 *)(APIC_BASE + reg));
+	volatile u32 *addr = (volatile u32 *)(APIC_BASE + reg);
+	u32 out;
+
+	/*
+	 * Functionally, what we want to do is simply return *addr. However,
+	 * this accesses an MMIO which may need to be emulated in some cases.
+	 * The emulator doesn't necessarily support all instructions, so we
+	 * force the read from addr to use a mov instruction.
+	 */
+	asm_inline("movl %1, %0" : "=r"(out) : "m"(*addr));
+
+	return out;
 }
 
 extern void native_apic_wait_icr_idle(void);
-- 
2.37.1.559.g78731f0fdb-goog

