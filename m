Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E03A10EB
	for <llvm@lists.linux.dev>; Wed, 24 Aug 2022 03:21:26 +0000 (UTC)
Received: by mail-pj1-f73.google.com with SMTP id g11-20020a17090a4b0b00b001fb5f1e195fso165894pjh.6
        for <llvm@lists.linux.dev>; Tue, 23 Aug 2022 20:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:reply-to:from:to:cc;
        bh=DiPDkyCUU5+qWi0FAGBrmfRDeC2PU2rAf87l6jKus4Q=;
        b=XvXBevlrlAqE9wagoH125syNrQYxrpHCiRlRfiVQtu1MdNipV2GG0TAviWCkY42kue
         40hfNKd+srF0kxrbk+L6cIyjcvRD8ldiLVaaVnTF7/0DWZuQLDQlKmMKu1ugP09CeNj6
         VfX9VSOzSDrnlZamHjfahcZ2qWLNHssJ6Tq+/c4s295toNWRhLpMaKG2PErS9+FS8eu/
         nEwvow02yLb8KzgPd+H/QmXmd4FUVqVHY6f7qsUkwmsM976gLKCuj3wk6E+/Ec1o7Qk2
         rSKdgFoFxqyd41Hj6wSl65wgpFaa3s0g/kZVmRXjxDr+uNytf2U5o026FzYj9bwJFc5X
         barw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc;
        bh=DiPDkyCUU5+qWi0FAGBrmfRDeC2PU2rAf87l6jKus4Q=;
        b=MXwvAulwbByVqHmtwKgkxNHx2utNy6LzxSRpH1FaWQ0q84oOrYAy4HPgGaOVwkGy9m
         ykNIMF+gjDSLwITZX6dPZg2BNeBr3pVlG7vDcEG5GJs5QMGB/WFs0kjUybQU/tSsd51F
         H+pXmQLCrECZzWqMHnRL6uishj0tUBnpanWHSXKn8tFwLq3Kbs8WYmX07Hfv8+XY4Rwq
         mXkcdh8YwsdAmsOj5KZ5t5gwx+5f7siGg2egnEFjjoETufFq9Wukvha68aS3fWHI4NdU
         x7nEukuGJ+flaFnw07TALuCtcmCZESjD+bH3FY4NzKt+xY8ZeCC1ZcJXdLHsTPtNA97D
         vqsg==
X-Gm-Message-State: ACgBeo2jsxwkEOuXeoS5MbmHQuV3yJiu+1cvhNYKYWxf6Gbv30kzBYm1
	KsSW5/TvuBQpm+NNGGAGLiEAemljWt0=
X-Google-Smtp-Source: AA6agR7hkMAlHzZjMos7RFjUz8V/HjO4UccQUnDLH/uwK3wpKW33JaEUPX9HlB35rLdBTEQmTcaewjVzFKc=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:301c:b0:52d:bff9:5004 with SMTP id
 ay28-20020a056a00301c00b0052dbff95004mr27937449pfb.84.1661311285738; Tue, 23
 Aug 2022 20:21:25 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 24 Aug 2022 03:21:13 +0000
In-Reply-To: <20220824032115.3563686-1-seanjc@google.com>
Message-Id: <20220824032115.3563686-5-seanjc@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220824032115.3563686-1-seanjc@google.com>
X-Mailer: git-send-email 2.37.1.595.g718a3a8f04-goog
Subject: [PATCH v4 4/6] tools: Add atomic_test_and_set_bit()
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
2.37.1.595.g718a3a8f04-goog

