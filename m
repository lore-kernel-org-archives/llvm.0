Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F49398
	for <llvm@lists.linux.dev>; Fri, 12 Aug 2022 18:35:27 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-31f3959ba41so13772077b3.2
        for <llvm@lists.linux.dev>; Fri, 12 Aug 2022 11:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc;
        bh=Tb/TR0D6+TZRh/xClS3B2006d7nEi2kvzg0PMDr41zU=;
        b=KIghjEhyq/uIEoA7hzxjHhXLoqudiVh4T6m4iV1J2c3fc55bZphi7EKB/TpFkXOqXQ
         faOb1XHILmMqgqAmbtc8yyI/hQowyxK+dKydpikpEZycSxHUryf7rXRSujoIWYiQEZGU
         mjwcT3XbvILiUetjMLaSrR7jioVy+UEsVk3wtFtdEgyUo7gceVjULI0IkP5sSXvkzvsI
         ZSEXjbbFjpbWw5UyRn7RPqXWfq0V+FX1js0+oghrkMoyer5wm195HOxfdIW1poBoeiVg
         1qRxbN4wyrI3125UQZfUJD0aMsn7Z6Cn4SBGKpiKS5DEt3lQoTP+t06zvMX5F2octugZ
         +8lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=Tb/TR0D6+TZRh/xClS3B2006d7nEi2kvzg0PMDr41zU=;
        b=2EKqtUSotkW1L06YQjXepDg8U396dc8DjDZ0P1/dpwjIeHymRqwhlIdHaLlRoN8OnD
         56ecGD5VvtTpSiIQJa5pm6wkWhi87g5IeMlWYPSTqQIiy5w/LDJDwovmcZ4oygOsgy6f
         aVPTrJJAkUcq4cbmxW47vZZs79CCivkqVn2j0+MNuhuzKNDTjB3vQ372+f9hlXHLY7KT
         KJGO7eCZVenW4d9wr7zJ1v2TI5nejAzhRfqnpeMRg8LD3GQtJb7mBMzMhvVvmdHCfOVl
         iape7ZDVxgdOYVd3O4sfPy0lNh71fsRjRwzqpdwzqYdiQUp7ySLyPjL7I148WbYMNGXG
         hb8w==
X-Gm-Message-State: ACgBeo0gFTng6GJFoJrEl2gj7EJaBOGIZCP4a35MrY/SJOoJO6Gx7pvS
	4v3LVoWq97t0LWZAKn+nHCWaPJU8X81xjg==
X-Google-Smtp-Source: AA6agR7MVw6eGihEXYg3t88QaXWHs6AKeaTDDCWkXOHbSefgFAjKbrQSw+ldMMN4sYHzIbVkKO0X/Ph4mdFH7w==
X-Received: from acdunlap03.bve.corp.google.com ([2620:15c:29:203:1024:e472:db0f:a5f3])
 (user=acdunlap job=sendgmr) by 2002:a25:408a:0:b0:677:3543:ca4e with SMTP id
 n132-20020a25408a000000b006773543ca4emr4642131yba.164.1660329326241; Fri, 12
 Aug 2022 11:35:26 -0700 (PDT)
Date: Fri, 12 Aug 2022 11:35:01 -0700
In-Reply-To: <CAMBK9=b1ALFYOB1iTUW7BHgq=sg=x9t8sTnC5YgQ5bePF+UvNg@mail.gmail.com>
Message-Id: <20220812183501.3555820-1-acdunlap@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <CAMBK9=b1ALFYOB1iTUW7BHgq=sg=x9t8sTnC5YgQ5bePF+UvNg@mail.gmail.com>
X-Mailer: git-send-email 2.37.1.595.g718a3a8f04-goog
Subject: [PATCH v2] x86/asm: Force native_apic_mem_read to use mov
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
---
V1 -> V2: Replaced asm with readl function which does the same thing

 arch/x86/include/asm/apic.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/apic.h b/arch/x86/include/asm/apic.h
index 3415321c8240..b4c9034aa073 100644
--- a/arch/x86/include/asm/apic.h
+++ b/arch/x86/include/asm/apic.h
@@ -12,6 +12,7 @@
 #include <asm/mpspec.h>
 #include <asm/msr.h>
 #include <asm/hardirq.h>
+#include <asm/io.h>
 
 #define ARCH_APICTIMER_STOPS_ON_C3	1
 
@@ -109,7 +110,7 @@ static inline void native_apic_mem_write(u32 reg, u32 v)
 
 static inline u32 native_apic_mem_read(u32 reg)
 {
-	return *((volatile u32 *)(APIC_BASE + reg));
+	return readl((void __iomem *)(APIC_BASE + reg));
 }
 
 extern void native_apic_wait_icr_idle(void);
-- 
2.37.1.559.g78731f0fdb-goog

