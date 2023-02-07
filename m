Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FC920FC;
	Tue,  7 Feb 2023 10:46:37 +0000 (UTC)
Date: Tue, 7 Feb 2023 11:46:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1675766795;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=d4OfPHVZxvLVQJiLGkEzwDcFDOPDdLvwh5U9K8Vc7IA=;
	b=W/z9JUomEvP15zgVYP3y53fhmlDRhZDjuaPO5RFTivUu2xbGCL2FQalemJn/KCF6M3Qr3E
	jI5O4z/RU0N2ulLHBo+vQjP9LUyzgGSEXnVHSj9bF3ZIZoqT5Qq/o0QF6w3HR53Kfw0cYR
	2IQ44/46QuKBefIR3HW3xqMPcRM6gDvCLlfqIjQ/mObFFqahOqm9a7YJdpGX6ElBXkJhXL
	UFxNIfgPGA69/xXKklRBN6J0T1x+0cPstvxVe2rDKmtesfmIVhLJ4jE2RZtPETpXu+XeCn
	eQp1Mb6k1Kid41cjHfgl8FMiyZezT13qNvUaqeC6KORLnOi2ZBcgzQpzTQhSMQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1675766795;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=d4OfPHVZxvLVQJiLGkEzwDcFDOPDdLvwh5U9K8Vc7IA=;
	b=S1CWbPQkKU7cyRM3kKxQ2x4gi+2UDGFv8hOGfC8VMpMVVZeEH5t7Z3gTZJ+pEv6FPV7Aqz
	xrU/HYqeK+4aQ8DQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: kernel test robot <lkp@intel.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, x86@kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Andy Lutomirski <luto@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH] x86/vdso: Fake 32bit VDSO build on 64bit compile for vgetcpu.
Message-ID: <Y+IsCWQdXEr8d9Vy@linutronix.de>
References: <202302071338.m7nBGR5i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202302071338.m7nBGR5i-lkp@intel.com>

The 64bit register constrains in __arch_hweight64() can not be
fulfilled in a 32bit build. The function is only declared, not used
within vclock_gettime.c and gcc does not care. LLVM complains and
aborts.

Move the "fake a 32 bit kernel configuration" bits from vclock_gettime.c
into a common header file. Use this from vclock_gettime.c and vgetcpu.c.

Fixes: 92d33063c081a ("x86/vdso: Provide getcpu for x86-32.")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 arch/x86/entry/vdso/vdso32/fake_32bit_build.h | 25 +++++++++++++++++
 arch/x86/entry/vdso/vdso32/vclock_gettime.c   | 27 +------------------
 arch/x86/entry/vdso/vdso32/vgetcpu.c          |  1 +
 3 files changed, 27 insertions(+), 26 deletions(-)
 create mode 100644 arch/x86/entry/vdso/vdso32/fake_32bit_build.h

diff --git a/arch/x86/entry/vdso/vdso32/fake_32bit_build.h b/arch/x86/entry/vdso/vdso32/fake_32bit_build.h
new file mode 100644
index 0000000000000..db1b15f686e32
--- /dev/null
+++ b/arch/x86/entry/vdso/vdso32/fake_32bit_build.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifdef CONFIG_X86_64
+
+/*
+ * in case of a 32 bit VDSO for a 64 bit kernel fake a 32 bit kernel
+ * configuration
+ */
+#undef CONFIG_64BIT
+#undef CONFIG_X86_64
+#undef CONFIG_COMPAT
+#undef CONFIG_PGTABLE_LEVELS
+#undef CONFIG_ILLEGAL_POINTER_VALUE
+#undef CONFIG_SPARSEMEM_VMEMMAP
+#undef CONFIG_NR_CPUS
+#undef CONFIG_PARAVIRT_XXL
+
+#define CONFIG_X86_32 1
+#define CONFIG_PGTABLE_LEVELS 2
+#define CONFIG_PAGE_OFFSET 0
+#define CONFIG_ILLEGAL_POINTER_VALUE 0
+#define CONFIG_NR_CPUS 1
+
+#define BUILD_VDSO32_64
+
+#endif
diff --git a/arch/x86/entry/vdso/vdso32/vclock_gettime.c b/arch/x86/entry/vdso/vdso32/vclock_gettime.c
index 283ed9d004267..86981decfea83 100644
--- a/arch/x86/entry/vdso/vdso32/vclock_gettime.c
+++ b/arch/x86/entry/vdso/vdso32/vclock_gettime.c
@@ -1,29 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
 #define BUILD_VDSO32
-
-#ifdef CONFIG_X86_64
-
-/*
- * in case of a 32 bit VDSO for a 64 bit kernel fake a 32 bit kernel
- * configuration
- */
-#undef CONFIG_64BIT
-#undef CONFIG_X86_64
-#undef CONFIG_COMPAT
-#undef CONFIG_PGTABLE_LEVELS
-#undef CONFIG_ILLEGAL_POINTER_VALUE
-#undef CONFIG_SPARSEMEM_VMEMMAP
-#undef CONFIG_NR_CPUS
-#undef CONFIG_PARAVIRT_XXL
-
-#define CONFIG_X86_32 1
-#define CONFIG_PGTABLE_LEVELS 2
-#define CONFIG_PAGE_OFFSET 0
-#define CONFIG_ILLEGAL_POINTER_VALUE 0
-#define CONFIG_NR_CPUS 1
-
-#define BUILD_VDSO32_64
-
-#endif
-
+#include "fake_32bit_build.h"
 #include "../vclock_gettime.c"
diff --git a/arch/x86/entry/vdso/vdso32/vgetcpu.c b/arch/x86/entry/vdso/vdso32/vgetcpu.c
index b777f84ffae9b..3a9791f5e9989 100644
--- a/arch/x86/entry/vdso/vdso32/vgetcpu.c
+++ b/arch/x86/entry/vdso/vdso32/vgetcpu.c
@@ -1,2 +1,3 @@
 // SPDX-License-Identifier: GPL-2.0
+#include "fake_32bit_build.h"
 #include "../vgetcpu.c"
-- 
2.39.1

