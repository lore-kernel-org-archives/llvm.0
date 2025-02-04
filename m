Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977492185AB
	for <llvm@lists.linux.dev>; Tue,  4 Feb 2025 17:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738690663; cv=none; b=iGjt8K+wqmo5Z3oX1uqdGP/Rq5qb2pipeAIL2EYekRpmZXIW0MhJhuMYpsP8xcdktLThbzfjN0sGvXIi0qk+K3QxOXnbvETTJounxSUoURVM5MTXOiBzogFtOXHt6WRhBLb6jqYShn7zH0OEVowBRfmMUQ0jW2pA0H+h7i3+b7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738690663; c=relaxed/simple;
	bh=Ht7/TOmkT+iwiNKb8KTAnbXFoYcUy6oM0kb2gCQ20Wc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JsUOUR4nqPYmfku8p69iEh51606tztEWGm6OPp1YRBVM4mLEZwrD3nq9H7O4n5JeqvaoY2zpH/0X46RfINwWTQhNmGQeNd6eNueZdY54GKeFRQ1bFSE3Xl0Mcp/MM6oN25DuohWT2BrM0wpnnO0bN0ZSYaygdy0jFELth8+nlVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c0ukMGiY; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c0ukMGiY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738690661; x=1770226661;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ht7/TOmkT+iwiNKb8KTAnbXFoYcUy6oM0kb2gCQ20Wc=;
  b=c0ukMGiYaJ3PYbA25zw99NQ3AkIl1Zzh623UYZLo9/2huizcCGk0GdmF
   xpqPr81a4kK52gCDtyUcNqPOQDb4BN2dnXShXSXOZGj37GhwJKBtFlsZM
   3W0nuW5mC6LsWJ6fZeQ7KCVYKp0nORU6+AzWG1oBumoKUbi3Wia6+HsiD
   5JA+L+HCLrxxQyAsLutbPlK55KdUpBl7lecdOmaBuct6H137/Ifd8MTZZ
   ypZJ+yR4oXWrno8A+lJt5jv3fFMwxNN4p+YSPjVkHZcpyDhronbStsNXK
   Au6eA9aZXC5XYmnz1Uv7hyhtOH+E6uMzk5eHZOrK1Llicu9biv6v8BK/o
   A==;
X-CSE-ConnectionGUID: 1nQPKR+bTOe8+MsgnMrdEQ==
X-CSE-MsgGUID: bbcW5oN6Sweb8JHPI8XoCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38931210"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="38931210"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 09:37:41 -0800
X-CSE-ConnectionGUID: UAr5/zW7Rha56MjtNiYK0Q==
X-CSE-MsgGUID: 2nPTC7p0TeC/cQLyC4Ywqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="147867266"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO wieczorr-mobl1.intel.com) ([10.245.244.61])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 09:37:29 -0800
From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
To: luto@kernel.org,
	xin@zytor.com,
	kirill.shutemov@linux.intel.com,
	palmer@dabbelt.com,
	tj@kernel.org,
	andreyknvl@gmail.com,
	brgerst@gmail.com,
	ardb@kernel.org,
	dave.hansen@linux.intel.com,
	jgross@suse.com,
	will@kernel.org,
	akpm@linux-foundation.org,
	arnd@arndb.de,
	corbet@lwn.net,
	maciej.wieczor-retman@intel.com,
	dvyukov@google.com,
	richard.weiyang@gmail.com,
	ytcoode@gmail.com,
	tglx@linutronix.de,
	hpa@zytor.com,
	seanjc@google.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	justinstitt@google.com,
	jason.andryuk@amd.com,
	glider@google.com,
	ubizjak@gmail.com,
	jannh@google.com,
	bhe@redhat.com,
	vincenzo.frascino@arm.com,
	rafael.j.wysocki@intel.com,
	ndesaulniers@google.com,
	mingo@redhat.com,
	catalin.marinas@arm.com,
	junichi.nomura@nec.com,
	nathan@kernel.org,
	ryabinin.a.a@gmail.com,
	dennis@kernel.org,
	bp@alien8.de,
	kevinloughlin@google.com,
	morbo@google.com,
	dan.j.williams@intel.com,
	julian.stecklina@cyberus-technology.de,
	peterz@infradead.org,
	cl@linux.com,
	kees@kernel.org
Cc: kasan-dev@googlegroups.com,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	llvm@lists.linux.dev,
	linux-doc@vger.kernel.org
Subject: [PATCH 15/15] kasan: Add mititgation and debug modes
Date: Tue,  4 Feb 2025 18:33:56 +0100
Message-ID: <450a1fe078b0e07bf2e4f3098c9110c9959c6524.1738686764.git.maciej.wieczor-retman@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1738686764.git.maciej.wieczor-retman@intel.com>
References: <cover.1738686764.git.maciej.wieczor-retman@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With smaller memory footprint KASAN could be used in production systems.
One problem is that saving stacktraces slowes memory allocation
substantially - with KASAN enabled up to 90% of time spent on kmalloc()
is spent on saving the stacktrace.

Add mitigation mode to allow the option for running KASAN focused on
performance and security. In mitigation mode disable saving stacktraces
and set fault mode to always panic on KASAN error as a security
mechanism.

Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
---
 lib/Kconfig.kasan | 28 ++++++++++++++++++++++++++++
 mm/kasan/report.c |  4 ++++
 mm/kasan/tags.c   |  5 +++++
 3 files changed, 37 insertions(+)

diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
index d08b4e9bf477..6daa62b40dea 100644
--- a/lib/Kconfig.kasan
+++ b/lib/Kconfig.kasan
@@ -244,4 +244,32 @@ config KASAN_SW_TAGS_DENSE
 	  ARCH_HAS_KASAN_SW_TAGS_DENSE is needed for this option since the
 	  special tag macros need to be properly set for 4-bit wide tags.
 
+choice
+	prompt "KASAN operation mode"
+	default KASAN_OPERATION_DEBUG
+	help
+	  Choose between the mitigation or debug operation modes.
+
+	  The first one disables stacktrace saving and enables panic on error.
+	  Faster memory allocation but less information. The second one is the
+	  default where KASAN operates with full functionality.
+
+config KASAN_OPERATION_DEBUG
+	bool "Debug operation mode"
+	depends on KASAN
+	help
+	  The default mode. Full functionality and all boot parameters
+	  available.
+
+config KASAN_OPERATION_MITIGATION
+	bool "Mitigation operation mode"
+	depends on KASAN
+	help
+	  Operation mode dedicated at faster operation at the cost of less
+	  information collection. Disables stacktrace saving for faster
+	  allocations and forces panic on KASAN error to mitigate malicious
+	  attacks.
+
+endchoice
+
 endif # KASAN
diff --git a/mm/kasan/report.c b/mm/kasan/report.c
index ee9e406b0cdb..ae989d3bd919 100644
--- a/mm/kasan/report.c
+++ b/mm/kasan/report.c
@@ -47,7 +47,11 @@ enum kasan_arg_fault {
 	KASAN_ARG_FAULT_PANIC_ON_WRITE,
 };
 
+#ifdef CONFIG_KASAN_OPERATION_MITIGATION
+static enum kasan_arg_fault kasan_arg_fault __ro_after_init = KASAN_ARG_FAULT_PANIC;
+#else
 static enum kasan_arg_fault kasan_arg_fault __ro_after_init = KASAN_ARG_FAULT_DEFAULT;
+#endif
 
 /* kasan.fault=report/panic */
 static int __init early_kasan_fault(char *arg)
diff --git a/mm/kasan/tags.c b/mm/kasan/tags.c
index c111d98961ed..2414cddeaaf3 100644
--- a/mm/kasan/tags.c
+++ b/mm/kasan/tags.c
@@ -78,6 +78,11 @@ early_param("kasan.stack_ring_size", early_kasan_flag_stack_ring_size);
 
 void __init kasan_init_tags(void)
 {
+	if (IS_ENABLED(CONFIG_KASAN_OPERATION_MITIGATION)) {
+		static_branch_disable(&kasan_flag_stacktrace);
+		return;
+	}
+
 	switch (kasan_arg_stacktrace) {
 	case KASAN_ARG_STACKTRACE_DEFAULT:
 		/* Default is specified by kasan_flag_stacktrace definition. */
-- 
2.47.1

