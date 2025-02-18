Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B3022DF80
	for <llvm@lists.linux.dev>; Tue, 18 Feb 2025 08:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739866828; cv=none; b=bmgPxq1cl4uiCzn2T5msnsfLR2SklkwxF/F3Wo1kCcIZoYyqqXlum/5/fSK6k5XB4mxBrsKthoQhkC3iGWHEJ+xn3E5cA6fx9eT0I9oPFMcR79Asrl4/cDoSWnupLr9Erf52jeiBuxrHsli0ZCGhC/z1yNbIHakWnh+WoT5mM+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739866828; c=relaxed/simple;
	bh=tLFNi6QiCcH4XS9SXJrys5meLjBaYY7ZaQ2eE4lAVKI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jTGcqzIUSJtRHss4TwhqtPiBr6nhEaOPisgrpGxBVuATAPwOE61Wi2nkTrmk/nnX9m+bsjvpD95FuYpMCBW9fnubCW093qjOIba/XXHgCI49S448zdzHpawy4dVgESoYOHlHACKzeffKP/tR1ZzILHnXUg+ldmdHrNbVdB49zeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DNrLW0/0; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DNrLW0/0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739866827; x=1771402827;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tLFNi6QiCcH4XS9SXJrys5meLjBaYY7ZaQ2eE4lAVKI=;
  b=DNrLW0/07rJSZ/FyoNHS3WszzlClUjIQFX0f8oFsCOsQH+37OB6orYs6
   hkUu4xbGQ1yER/9/kx4sFi7XD6MMPuxlMkNGSlg3onKWlnGzYA399aSYn
   PEm+HgvYW0uGSt7b+chA16HBIKg+Dx+a11Y9gnp59jRneLA620TpsLZLS
   BXx+FvjypyNUcIuMCVtmYsWUJ0fNlGXOiiz6IK44gWCbF/e2m/AdU200o
   b4TK5S7MsKQR3o2tJm8a8A/WqRSIsypWw5jpmElypksi9X64SVwAvcrk/
   EtCDNoJbHGMRggnp4SIl7bGHhBB0DHOxxaYstCChq+/wRZOs8kH/+zYYI
   A==;
X-CSE-ConnectionGUID: FuwEEWcEQeSx/9paEz1OQQ==
X-CSE-MsgGUID: cSu+QgpcTTemHAYCiZOZNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="28150577"
X-IronPort-AV: E=Sophos;i="6.13,295,1732608000"; 
   d="scan'208";a="28150577"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 00:20:26 -0800
X-CSE-ConnectionGUID: ZBHrRLDGSHmtBzW5XHTLlA==
X-CSE-MsgGUID: DOPqudHOR6e9SmDmLLK9pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="119248027"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO wieczorr-mobl1.intel.com) ([10.245.245.49])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 00:20:07 -0800
From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
To: kees@kernel.org,
	julian.stecklina@cyberus-technology.de,
	kevinloughlin@google.com,
	peterz@infradead.org,
	tglx@linutronix.de,
	justinstitt@google.com,
	catalin.marinas@arm.com,
	wangkefeng.wang@huawei.com,
	bhe@redhat.com,
	ryabinin.a.a@gmail.com,
	kirill.shutemov@linux.intel.com,
	will@kernel.org,
	ardb@kernel.org,
	jason.andryuk@amd.com,
	dave.hansen@linux.intel.com,
	pasha.tatashin@soleen.com,
	ndesaulniers@google.com,
	guoweikang.kernel@gmail.com,
	dwmw@amazon.co.uk,
	mark.rutland@arm.com,
	broonie@kernel.org,
	apopple@nvidia.com,
	bp@alien8.de,
	rppt@kernel.org,
	kaleshsingh@google.com,
	richard.weiyang@gmail.com,
	luto@kernel.org,
	glider@google.com,
	pankaj.gupta@amd.com,
	andreyknvl@gmail.com,
	pawan.kumar.gupta@linux.intel.com,
	kuan-ying.lee@canonical.com,
	tony.luck@intel.com,
	tj@kernel.org,
	jgross@suse.com,
	dvyukov@google.com,
	baohua@kernel.org,
	samuel.holland@sifive.com,
	dennis@kernel.org,
	akpm@linux-foundation.org,
	thomas.weissschuh@linutronix.de,
	surenb@google.com,
	kbingham@kernel.org,
	ankita@nvidia.com,
	nathan@kernel.org,
	maciej.wieczor-retman@intel.com,
	ziy@nvidia.com,
	xin@zytor.com,
	rafael.j.wysocki@intel.com,
	andriy.shevchenko@linux.intel.com,
	cl@linux.com,
	jhubbard@nvidia.com,
	hpa@zytor.com,
	scott@os.amperecomputing.com,
	david@redhat.com,
	jan.kiszka@siemens.com,
	vincenzo.frascino@arm.com,
	corbet@lwn.net,
	maz@kernel.org,
	mingo@redhat.com,
	arnd@arndb.de,
	ytcoode@gmail.com,
	xur@google.com,
	morbo@google.com,
	thiago.bauermann@linaro.org
Cc: linux-doc@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org
Subject: [PATCH v2 13/14] x86: runtime_const used for KASAN_SHADOW_END
Date: Tue, 18 Feb 2025 09:15:29 +0100
Message-ID: <2a2f08bc8118b369610d34e4d190a879d44f76b8.1739866028.git.maciej.wieczor-retman@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1739866028.git.maciej.wieczor-retman@intel.com>
References: <cover.1739866028.git.maciej.wieczor-retman@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On x86, generic KASAN is setup in a way that needs a single
KASAN_SHADOW_OFFSET value for both 4 and 5 level paging. It's required
to facilitate boot time switching and it's a compiler ABI so it can't be
changed during runtime.

Software tag-based mode doesn't tie shadow start and end to any linear
addresses as part of the compiler ABI so it can be changed during
runtime. This notion, for KASAN purposes, allows to optimize out macros
such us pgtable_l5_enabled() which would otherwise be used in every
single KASAN related function.

Use runtime_const infrastructure with pgtable_l5_enabled() to initialize
the end address of KASAN's shadow address space. It's a good choice
since in software tag based mode KASAN_SHADOW_OFFSET and
KASAN_SHADOW_END refer to the same value and the offset in
kasan_mem_to_shadow() is a signed negative value.

Setup KASAN_SHADOW_END values so that they're aligned to 4TB in 4-level
paging mode and to 2PB in 5-level paging mode. Also update x86 memory
map documentation.

Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
---
Changelog v2:
- Change documentation kasan start address to non-dense values.

 Documentation/arch/x86/x86_64/mm.rst |  6 ++++--
 arch/x86/Kconfig                     |  3 +--
 arch/x86/include/asm/kasan.h         | 14 +++++++++++++-
 arch/x86/kernel/vmlinux.lds.S        |  1 +
 arch/x86/mm/kasan_init_64.c          |  5 ++++-
 5 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/Documentation/arch/x86/x86_64/mm.rst b/Documentation/arch/x86/x86_64/mm.rst
index f2db178b353f..5014ec322e19 100644
--- a/Documentation/arch/x86/x86_64/mm.rst
+++ b/Documentation/arch/x86/x86_64/mm.rst
@@ -60,7 +60,8 @@ Complete virtual memory map with 4-level page tables
    ffffe90000000000 |  -23    TB | ffffe9ffffffffff |    1 TB | ... unused hole
    ffffea0000000000 |  -22    TB | ffffeaffffffffff |    1 TB | virtual memory map (vmemmap_base)
    ffffeb0000000000 |  -21    TB | ffffebffffffffff |    1 TB | ... unused hole
-   ffffec0000000000 |  -20    TB | fffffbffffffffff |   16 TB | KASAN shadow memory
+   ffffec0000000000 |  -20    TB | fffffbffffffffff |   16 TB | KASAN shadow memory (generic mode)
+   fffff40000000000 |   -8    TB | fffffc0000000000 |    8 TB | KASAN shadow memory (software tag-based mode)
   __________________|____________|__________________|_________|____________________________________________________________
                                                               |
                                                               | Identical layout to the 56-bit one from here on:
@@ -130,7 +131,8 @@ Complete virtual memory map with 5-level page tables
    ffd2000000000000 |  -11.5  PB | ffd3ffffffffffff |  0.5 PB | ... unused hole
    ffd4000000000000 |  -11    PB | ffd5ffffffffffff |  0.5 PB | virtual memory map (vmemmap_base)
    ffd6000000000000 |  -10.5  PB | ffdeffffffffffff | 2.25 PB | ... unused hole
-   ffdf000000000000 |   -8.25 PB | fffffbffffffffff |   ~8 PB | KASAN shadow memory
+   ffdf000000000000 |   -8.25 PB | fffffbffffffffff |   ~8 PB | KASAN shadow memory (generic mode)
+   ffe0000000000000 |   -6    PB | fff0000000000000 |    4 PB | KASAN shadow memory (software tag-based mode)
   __________________|____________|__________________|_________|____________________________________________________________
                                                               |
                                                               | Identical layout to the 47-bit one from here on:
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 6df7779ed6da..f4ef64bf824a 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -400,8 +400,7 @@ config AUDIT_ARCH
 
 config KASAN_SHADOW_OFFSET
 	hex
-	depends on KASAN
-	default 0xdffffc0000000000
+	default 0xdffffc0000000000 if KASAN_GENERIC
 
 config HAVE_INTEL_TXT
 	def_bool y
diff --git a/arch/x86/include/asm/kasan.h b/arch/x86/include/asm/kasan.h
index a75f0748a4b6..4bfd3641af84 100644
--- a/arch/x86/include/asm/kasan.h
+++ b/arch/x86/include/asm/kasan.h
@@ -5,7 +5,7 @@
 #include <linux/const.h>
 #include <linux/kasan-tags.h>
 #include <linux/types.h>
-#define KASAN_SHADOW_OFFSET _AC(CONFIG_KASAN_SHADOW_OFFSET, UL)
+
 #define KASAN_SHADOW_SCALE_SHIFT 3
 
 /*
@@ -14,6 +14,8 @@
  * for kernel really starts from compiler's shadow offset +
  * 'kernel address space start' >> KASAN_SHADOW_SCALE_SHIFT
  */
+#ifdef CONFIG_KASAN_GENERIC
+#define KASAN_SHADOW_OFFSET _AC(CONFIG_KASAN_SHADOW_OFFSET, UL)
 #define KASAN_SHADOW_START      (KASAN_SHADOW_OFFSET + \
 					((-1UL << __VIRTUAL_MASK_SHIFT) >> \
 						KASAN_SHADOW_SCALE_SHIFT))
@@ -24,12 +26,22 @@
 #define KASAN_SHADOW_END        (KASAN_SHADOW_START + \
 					(1ULL << (__VIRTUAL_MASK_SHIFT - \
 						  KASAN_SHADOW_SCALE_SHIFT)))
+#endif
+
 
 #ifndef __ASSEMBLY__
+#include <asm/runtime-const.h>
 #include <linux/bitops.h>
 #include <linux/bitfield.h>
 #include <linux/bits.h>
 
+#ifdef CONFIG_KASAN_SW_TAGS
+extern unsigned long KASAN_SHADOW_END_RC;
+#define KASAN_SHADOW_END	runtime_const_ptr(KASAN_SHADOW_END_RC)
+#define KASAN_SHADOW_OFFSET	KASAN_SHADOW_END
+#define KASAN_SHADOW_START	(KASAN_SHADOW_END - ((UL(1)) << (__VIRTUAL_MASK_SHIFT - KASAN_SHADOW_SCALE_SHIFT)))
+#endif
+
 #define arch_kasan_set_tag(addr, tag)	__tag_set(addr, tag)
 #define arch_kasan_reset_tag(addr)	__tag_reset(addr)
 #define arch_kasan_get_tag(addr)	__tag_get(addr)
diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
index 0deb4887d6e9..df6c85f8f48f 100644
--- a/arch/x86/kernel/vmlinux.lds.S
+++ b/arch/x86/kernel/vmlinux.lds.S
@@ -353,6 +353,7 @@ SECTIONS
 
 	RUNTIME_CONST_VARIABLES
 	RUNTIME_CONST(ptr, USER_PTR_MAX)
+	RUNTIME_CONST(ptr, KASAN_SHADOW_END_RC)
 
 	. = ALIGN(PAGE_SIZE);
 
diff --git a/arch/x86/mm/kasan_init_64.c b/arch/x86/mm/kasan_init_64.c
index 299a2144dac4..5ca5862a5cd6 100644
--- a/arch/x86/mm/kasan_init_64.c
+++ b/arch/x86/mm/kasan_init_64.c
@@ -358,6 +358,9 @@ void __init kasan_init(void)
 	int i;
 
 	memcpy(early_top_pgt, init_top_pgt, sizeof(early_top_pgt));
+	unsigned long KASAN_SHADOW_END_RC = pgtable_l5_enabled() ? 0xfff0000000000000 : 0xfffffc0000000000;
+
+	runtime_const_init(ptr, KASAN_SHADOW_END_RC);
 
 	/*
 	 * We use the same shadow offset for 4- and 5-level paging to
@@ -372,7 +375,7 @@ void __init kasan_init(void)
 	 * bunch of things like kernel code, modules, EFI mapping, etc.
 	 * We need to take extra steps to not overwrite them.
 	 */
-	if (pgtable_l5_enabled()) {
+	if (pgtable_l5_enabled() && !IS_ENABLED(CONFIG_KASAN_SW_TAGS)) {
 		void *ptr;
 
 		ptr = (void *)pgd_page_vaddr(*pgd_offset_k(KASAN_SHADOW_END));
-- 
2.47.1

