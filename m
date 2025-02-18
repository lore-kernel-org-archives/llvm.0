Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0BB70814
	for <llvm@lists.linux.dev>; Tue, 18 Feb 2025 08:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739866650; cv=none; b=qYOdOTo3sx/M0cs/SJ783rfCb5jrTCvKGHSNOqDI1VXrWVTO36dZQrVND8FELsrtlKOOFkmbrWJ20DnTprViXSdkz6EyYTEqavhPXDE1IB4BtWIw/aIYGQdw3TbQVWLb74RyX6z/7lIyL3oAz6h8/4LV7BWqLYiHkqIHYQA8hLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739866650; c=relaxed/simple;
	bh=vZnoVBHv0l9iKflwNJuydsONrEphO2Y6vfEcHPCjENE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nyglDqgyMJ2sdyWZHoZWWWKXgsoonMWaRAsitMbRcKrxiuG4398ET8Y/dzHfL4JmYsq2oXkB7Gnob2MRX2Fdja1xq9gMVM4xkGCududvSljLi2F1n9BX36UTL70+U2oe8O+OtCXP/oo92CHDGHiufrn6BqVTnjF8PhoCJQHgY/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BFI7yhzP; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BFI7yhzP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739866649; x=1771402649;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vZnoVBHv0l9iKflwNJuydsONrEphO2Y6vfEcHPCjENE=;
  b=BFI7yhzP+26mLZb+zDJKHuNC6Kyow0cFnZND3DJLmLM9qXkWe5pYtLXz
   kNNkpuGJY7d8q/IU0d235xbjUt5Jxz9HLIv+LpJ3J98zR1MFpIxTlqQGK
   UC4ArAz0mC4HfbzKuFfI50llv3umB5WfZA9nWDc3Txc5pw7TzLO7DjMui
   QBNeeY7sr3OmyH0X/Ckh8wskdP3QThx5z9CsMpHbxKnKkAhjMEkgIvrka
   coky6wOOI1+YuwLVVd/+n0GiRckVg793Cc5MhR6KZW8Q9mLn/XVsAP/B0
   svhwlAsoz3rPptnLoG/04ImAm+WDTUxdhmzouEQjr3LSZ83/q3soTcLPL
   A==;
X-CSE-ConnectionGUID: oFleOg8JS2WCc+TJ0235Ug==
X-CSE-MsgGUID: 5DtByim9S1WVYnWoplZD/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="28150153"
X-IronPort-AV: E=Sophos;i="6.13,295,1732608000"; 
   d="scan'208";a="28150153"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 00:17:28 -0800
X-CSE-ConnectionGUID: xKQi23p7SyujmVCTf7U/Zg==
X-CSE-MsgGUID: 9P48bDiJSRi9kqQCnYaSFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="119247544"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO wieczorr-mobl1.intel.com) ([10.245.245.49])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 00:17:10 -0800
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
Subject: [PATCH v2 04/14] kasan: sw_tags: Support tag widths less than 8 bits
Date: Tue, 18 Feb 2025 09:15:20 +0100
Message-ID: <09962dd580a56e308d98b7bd5829dc57928bcc40.1739866028.git.maciej.wieczor-retman@intel.com>
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

From: Samuel Holland <samuel.holland@sifive.com>

Allow architectures to override KASAN_TAG_KERNEL in asm/kasan.h. This
is needed on RISC-V, which supports 57-bit virtual addresses and 7-bit
pointer tags. For consistency, move the arm64 MTE definition of
KASAN_TAG_MIN to asm/kasan.h, since it is also architecture-dependent;
RISC-V's equivalent extension is expected to support 7-bit hardware
memory tags.

Reviewed-by: Andrey Konovalov <andreyknvl@gmail.com>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
---
 arch/arm64/include/asm/kasan.h   |  6 ++++--
 arch/arm64/include/asm/uaccess.h |  1 +
 include/linux/kasan-tags.h       | 13 ++++++++-----
 3 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/include/asm/kasan.h b/arch/arm64/include/asm/kasan.h
index e1b57c13f8a4..4ab419df8b93 100644
--- a/arch/arm64/include/asm/kasan.h
+++ b/arch/arm64/include/asm/kasan.h
@@ -6,8 +6,10 @@
 
 #include <linux/linkage.h>
 #include <asm/memory.h>
-#include <asm/mte-kasan.h>
-#include <asm/pgtable-types.h>
+
+#ifdef CONFIG_KASAN_HW_TAGS
+#define KASAN_TAG_MIN			0xF0 /* minimum value for random tags */
+#endif
 
 #define arch_kasan_set_tag(addr, tag)	__tag_set(addr, tag)
 #define arch_kasan_reset_tag(addr)	__tag_reset(addr)
diff --git a/arch/arm64/include/asm/uaccess.h b/arch/arm64/include/asm/uaccess.h
index 5b91803201ef..f890dadc7b4e 100644
--- a/arch/arm64/include/asm/uaccess.h
+++ b/arch/arm64/include/asm/uaccess.h
@@ -22,6 +22,7 @@
 #include <asm/cpufeature.h>
 #include <asm/mmu.h>
 #include <asm/mte.h>
+#include <asm/mte-kasan.h>
 #include <asm/ptrace.h>
 #include <asm/memory.h>
 #include <asm/extable.h>
diff --git a/include/linux/kasan-tags.h b/include/linux/kasan-tags.h
index 4f85f562512c..e07c896f95d3 100644
--- a/include/linux/kasan-tags.h
+++ b/include/linux/kasan-tags.h
@@ -2,13 +2,16 @@
 #ifndef _LINUX_KASAN_TAGS_H
 #define _LINUX_KASAN_TAGS_H
 
+#include <asm/kasan.h>
+
+#ifndef KASAN_TAG_KERNEL
 #define KASAN_TAG_KERNEL	0xFF /* native kernel pointers tag */
-#define KASAN_TAG_INVALID	0xFE /* inaccessible memory tag */
-#define KASAN_TAG_MAX		0xFD /* maximum value for random tags */
+#endif
+
+#define KASAN_TAG_INVALID	(KASAN_TAG_KERNEL - 1) /* inaccessible memory tag */
+#define KASAN_TAG_MAX		(KASAN_TAG_KERNEL - 2) /* maximum value for random tags */
 
-#ifdef CONFIG_KASAN_HW_TAGS
-#define KASAN_TAG_MIN		0xF0 /* minimum value for random tags */
-#else
+#ifndef KASAN_TAG_MIN
 #define KASAN_TAG_MIN		0x00 /* minimum value for random tags */
 #endif
 
-- 
2.47.1

