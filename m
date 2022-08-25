Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BE84C8B
	for <llvm@lists.linux.dev>; Thu, 25 Aug 2022 23:25:31 +0000 (UTC)
Received: by mail-pj1-f73.google.com with SMTP id r6-20020a17090a2e8600b001fbb51e5cc1so1644874pjd.5
        for <llvm@lists.linux.dev>; Thu, 25 Aug 2022 16:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc;
        bh=a5nruIl0wNeupXvrAMbGBAS1GScaEkKaYOUNnuHLnXk=;
        b=MUrthn9a6RY6CpiffJkHt9EOPrKtSEGmXhqqxQ3D2qRZw+a7bNGa46Lw6wQ3BknnIy
         Nccq5f/lszbKbQJgrG/Y3TeW7LcYWHSCnV1949i35B4xTqNhw6TutpLsyYtPkh4tpQun
         8YqYEvHVdG6s/enTMEeqcr2tgcITSa5HsHiuHtd8k1okdf8J78W/3/sDX30h3JhVfrmf
         sDq9IBDxUOd9h4P2X17g89DICK0NQZ8O2oP1O3SUmdgBnpZE5Bd1EVN61k53zguEnNjY
         zxzQgf5iHjst9fKoqExYlsFYRa7aqRLWkLtfs18aJWmLVPp8Pj+CMrtVB/3l2rPzHLPo
         UUPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc;
        bh=a5nruIl0wNeupXvrAMbGBAS1GScaEkKaYOUNnuHLnXk=;
        b=LTd+9KHI4E2OOJMje2Zx8luC9jEOyFPZ7iQCdMF169akDOYRjS8OmF4cXSP4bPnF2r
         dGkbbHcL5fzR6a4HYpUw8NnDGIaVfPU9vM+rcuC7jZUKC+mIbT+UeeyqxTyhGbBQYi7d
         Oa6mT/kjrU8HyuTDm1KTg+I2DCGrAaRvJT436olxQqLhqbnuyM2wV2iqJI8Uwr5a+ArC
         oeMmcfmtxr0+iC84Sv2rpyHY0bl08r/YlqlIN5XtlrdOQj4auJBIaL4AztSKpsi6rjx0
         cdgMtywyJfASRyL5Uzgq8FYPtwoN/Mkiu8n0CpqqiMSl+Zy7QBqrY4OGgq4LWgVMZyld
         8AvQ==
X-Gm-Message-State: ACgBeo2bBSNu2nYnB3TKLHb9MIFVkwBzDholfcuHIf0L2vaa40C/71xN
	9YLfF1TP8evTjlAP8EaW+2C21+Plu0U=
X-Google-Smtp-Source: AA6agR5ycc86vDkZZxz/2DKZfcSQPVYnqerGrhMoWS/DoaCwEB56TzgSv+N+GPw1ZMSLN5eesLErkDwOY7I=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:f542:b0:173:a8a:d7bf with SMTP id
 h2-20020a170902f54200b001730a8ad7bfmr1185847plf.134.1661469931377; Thu, 25
 Aug 2022 16:25:31 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 25 Aug 2022 23:25:19 +0000
In-Reply-To: <20220825232522.3997340-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220825232522.3997340-1-seanjc@google.com>
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Message-ID: <20220825232522.3997340-5-seanjc@google.com>
Subject: [PATCH v5 4/7] tools: Add atomic_test_and_set_bit()
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>
Cc: James Morse <james.morse@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Atish Patra <atishp@atishpatra.org>, David Hildenbrand <david@redhat.com>, Tom Rix <trix@redhat.com>, 
	kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.cs.columbia.edu, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Colton Lewis <coltonlewis@google.com>, 
	Peter Gonda <pgonda@google.com>, Andrew Jones <andrew.jones@linux.dev>, 
	Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Peter Gonda <pgonda@google.com>

Add x86 and generic implementations of atomic_test_and_set_bit() to allow
KVM selftests to atomically manage bitmaps.

Note, the generic version is taken from arch_test_and_set_bit() as of
commit 415d83249709 ("locking/atomic: Make test_and_*_bit() ordered on
failure").

Signed-off-by: Peter Gonda <pgonda@google.com>
Co-developed-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/arch/x86/include/asm/atomic.h    |  7 +++++++
 tools/include/asm-generic/atomic-gcc.h | 12 ++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/tools/arch/x86/include/asm/atomic.h b/tools/arch/x86/include/asm/atomic.h
index 1f5e26aae9fc..01cc27ec4520 100644
--- a/tools/arch/x86/include/asm/atomic.h
+++ b/tools/arch/x86/include/asm/atomic.h
@@ -8,6 +8,7 @@
 
 #define LOCK_PREFIX "\n\tlock; "
 
+#include <asm/asm.h>
 #include <asm/cmpxchg.h>
 
 /*
@@ -70,4 +71,10 @@ static __always_inline int atomic_cmpxchg(atomic_t *v, int old, int new)
 	return cmpxchg(&v->counter, old, new);
 }
 
+static inline int atomic_test_and_set_bit(long nr, unsigned long *addr)
+{
+	GEN_BINARY_RMWcc(LOCK_PREFIX __ASM_SIZE(bts), *addr, "Ir", nr, "%0", "c");
+
+}
+
 #endif /* _TOOLS_LINUX_ASM_X86_ATOMIC_H */
diff --git a/tools/include/asm-generic/atomic-gcc.h b/tools/include/asm-generic/atomic-gcc.h
index 4c1966f7c77a..6daa68bf5b9e 100644
--- a/tools/include/asm-generic/atomic-gcc.h
+++ b/tools/include/asm-generic/atomic-gcc.h
@@ -4,6 +4,7 @@
 
 #include <linux/compiler.h>
 #include <linux/types.h>
+#include <linux/bitops.h>
 
 /*
  * Atomic operations that C can't guarantee us.  Useful for
@@ -69,4 +70,15 @@ static inline int atomic_cmpxchg(atomic_t *v, int oldval, int newval)
 	return cmpxchg(&(v)->counter, oldval, newval);
 }
 
+static inline int atomic_test_and_set_bit(long nr, unsigned long *addr)
+{
+	unsigned long mask = BIT_MASK(nr);
+	long old;
+
+	addr += BIT_WORD(nr);
+
+	old = __sync_fetch_and_or(addr, mask);
+	return !!(old & mask);
+}
+
 #endif /* __TOOLS_ASM_GENERIC_ATOMIC_H */
-- 
2.37.2.672.g94769d06f0-goog

