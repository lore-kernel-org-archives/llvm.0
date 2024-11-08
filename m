Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F5C1EF08B
	for <llvm@lists.linux.dev>; Fri,  8 Nov 2024 14:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731075167; cv=none; b=MN5Z8cMzIO55q6tJcLaYX5RWEyE35QE740G7Clma/2k5Eo8IWpF6yRVXpEMT3GQgxDjOVLd+ZBYa6JXnHPOT1Q4iGT9hmWqerFxoYaZdDrkr+spEwLxmE8KUYNVC5QR0T10RxwK7b8mC7zgJ6jaIiZXP/06F/aaTa7Lnt+ddWsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731075167; c=relaxed/simple;
	bh=JoSbIGFCX3QXJ8QeoQz4xxBhhwyTvR5PjoWPacA2Mvc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nlmdKc/s2tN3ViB7d+Ef7lHEjiya9Z7T/udC2VQ8tzVv3jaFx0JrkSgVGhUjVETGj3RGDqp3nh5tXd4GvVW8CdkagKZh+w9cQIQ8pXqmltq6RgoWBSwIPpkYx8T2Mt3fO/ucAKOeerVy1uSIc6d1cf31bFSKi5SCg0313aa4MbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R73XqURr; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R73XqURr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731075165; x=1762611165;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=JoSbIGFCX3QXJ8QeoQz4xxBhhwyTvR5PjoWPacA2Mvc=;
  b=R73XqURr0Njnd+Yc9i8ZIEM6KVKFvSYZnriDMVL78eA7gCP9mgwRZU6G
   l0KL5F+got+Cb8A9Y79WedOQx+EGvkL1ZcuUwZmt43dHUA/3o6rcTT4pw
   1BEx5Ihr1Vy7WMydQae1bwfl2IrXNtLt8HM/iJsDycNC5lJIk4s3eoSQR
   NMsG4DrN15cugDzsVDLaSrYf5gKz4RZpGLdgigdRVeRX2MlPvVrMbrd2b
   lJiqicnXwPR5lVJ1yxgOlpTxpUJMu6cvpr+3j0wwLx2ghttmI+5fsIkkO
   HjYYOf9tghTepacAYlhcVfx/Z2AN067tpI0R1vVZxB1dK0vroIsr3dkNN
   A==;
X-CSE-ConnectionGUID: bKKWiDUxSDeWCwnJtVM8HA==
X-CSE-MsgGUID: kMcEesgtSl+BNZQxxWxvQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="31060473"
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; 
   d="scan'208";a="31060473"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 06:12:42 -0800
X-CSE-ConnectionGUID: Hqeb6jPXR+OHAwnKafQltg==
X-CSE-MsgGUID: jCo0yHasT2KCAK7G7tz/hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="90393947"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa003.jf.intel.com with ESMTP; 08 Nov 2024 06:12:39 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 3385143A; Fri, 08 Nov 2024 16:12:37 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Dave Hansen <dave.hansen@intel.com>
Subject: [PATCH v4 1/1] x86/cpu: Make sure flag_is_changeable_p() is always being used
Date: Fri,  8 Nov 2024 16:11:46 +0200
Message-ID: <20241108141235.1456557-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When flag_is_changeable_p() is unused, it prevents kernel builds
with clang, `make W=1` and CONFIG_WERROR=y:

arch/x86/kernel/cpu/common.c:351:19: error: unused function 'flag_is_changeable_p' [-Werror,-Wunused-function]
  351 | static inline int flag_is_changeable_p(u32 flag)
      |                   ^~~~~~~~~~~~~~~~~~~~

Fix this by moving core around to make sure flag_is_changeable_p() is
always being used.

See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
inline functions for W=1 build").

While at it, fix the argument type to be unsigned long, although it currently
only runs in 32-bit cases.

Suggested-by: Dave Hansen <dave.hansen@intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---

v4: fixed the type of parameter (hpa)
v3: rewritten as suggested (Dave)
v2: marked both 32- and 64-bit cases

 arch/x86/kernel/cpu/common.c | 33 +++++++++++++++------------------
 1 file changed, 15 insertions(+), 18 deletions(-)

diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index a5f221ea5688..49682e35f9bd 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -276,22 +276,14 @@ static int __init x86_noinvpcid_setup(char *s)
 }
 early_param("noinvpcid", x86_noinvpcid_setup);
 
-#ifdef CONFIG_X86_32
-static int cachesize_override = -1;
-static int disable_x86_serial_nr = 1;
-
-static int __init cachesize_setup(char *str)
-{
-	get_option(&str, &cachesize_override);
-	return 1;
-}
-__setup("cachesize=", cachesize_setup);
-
 /* Standard macro to see if a specific flag is changeable */
-static inline int flag_is_changeable_p(u32 flag)
+static inline int flag_is_changeable_p(unsigned long flag)
 {
 	u32 f1, f2;
 
+	if (!IS_ENABLED(CONFIG_X86_32))
+		return 1;
+
 	/*
 	 * Cyrix and IDT cpus allow disabling of CPUID
 	 * so the code below may return different results
@@ -316,6 +308,17 @@ static inline int flag_is_changeable_p(u32 flag)
 	return ((f1^f2) & flag) != 0;
 }
 
+#ifdef CONFIG_X86_32
+static int cachesize_override = -1;
+static int disable_x86_serial_nr = 1;
+
+static int __init cachesize_setup(char *str)
+{
+	get_option(&str, &cachesize_override);
+	return 1;
+}
+__setup("cachesize=", cachesize_setup);
+
 /* Probe for the CPUID instruction */
 int have_cpuid_p(void)
 {
@@ -349,10 +352,6 @@ static int __init x86_serial_nr_setup(char *s)
 }
 __setup("serialnumber", x86_serial_nr_setup);
 #else
-static inline int flag_is_changeable_p(u32 flag)
-{
-	return 1;
-}
 static inline void squash_the_stupid_serial_number(struct cpuinfo_x86 *c)
 {
 }
@@ -1088,7 +1087,6 @@ void get_cpu_address_sizes(struct cpuinfo_x86 *c)
 
 static void identify_cpu_without_cpuid(struct cpuinfo_x86 *c)
 {
-#ifdef CONFIG_X86_32
 	int i;
 
 	/*
@@ -1109,7 +1107,6 @@ static void identify_cpu_without_cpuid(struct cpuinfo_x86 *c)
 				break;
 			}
 		}
-#endif
 }
 
 #define NO_SPECULATION		BIT(0)
-- 
2.43.0.rc1.1336.g36b5255a03ac

