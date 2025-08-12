Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3212E2820A3
	for <llvm@lists.linux.dev>; Tue, 12 Aug 2025 13:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755005222; cv=none; b=lzaa8P0m1yffOW2tQB/SDl71R3OQlDgHNA/4eSUh/d4DDhmJdT0NWusKCbxV9vYAOuODeAIm3CX6k+0saE5agV5YB2yH7qpTgLbDQonReRgWgor3W3Ij6En3p0Gj3fCq//tBaKcnEmZlJ1jlNuI0aP5uKsCDYHJZPvotRRYzCfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755005222; c=relaxed/simple;
	bh=mZLJdH3rbK1bxCuEzF7KjKtbxlAVDYknI9S994S9uz4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FphPk6AZDvs6oDOomlyPomcSQ3u9PTRle7m6qqyIp76iFZjo+baqQD/QgHrwtpoX/ER1cKjsYB0PpEBBcG3GY/MAz3GjljPThReWmeXYj7Kf/dZM6nSKHkUam4o3lPIFzvY8GIG6Nd88dleZOKhVQhbN+b5OciEoltg/tsxAREc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IvjkOruw; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IvjkOruw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755005222; x=1786541222;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mZLJdH3rbK1bxCuEzF7KjKtbxlAVDYknI9S994S9uz4=;
  b=IvjkOruwj/3aosMmX+ipTG5hWSdaUn/Cge5vXgWEimNFHwrvaCwFO4pC
   Wy2BpVHi65T8luX+rlbWlf40gb0ZN483R3QniYk7lDBIcc7gi6IaYjQkW
   fZbd7oi2w1XcKFUCAS6ykhzmYzArNT3A0eZbE5rL+22MjzamzIQnUrd+F
   24UafZEiNLsbn9wpdWXk8P1fLn6di67UIZAhXkwvZ1Ch+kh2W0QF2dNHv
   TtVBS7cUgVvSnxDpGIFfzdyMRABhX2bcz7pZuYq4/3AEA9AxjiGFF8qYz
   TZFplFXH5uZ2VYhAxdezLy74YjhmBSrWLG2JKmWRrZ+XXPDkJmUaa+5LH
   A==;
X-CSE-ConnectionGUID: FwJj7OE0SpCU4AxIsy1gqQ==
X-CSE-MsgGUID: c1149YEAQmuB69EH/yumAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="60903390"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="60903390"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 06:26:55 -0700
X-CSE-ConnectionGUID: 0gOP6hCJQl2mMyP4g+OHwQ==
X-CSE-MsgGUID: 99luYSpdRRigAj3rcRdRgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="165831406"
Received: from vpanait-mobl.ger.corp.intel.com (HELO wieczorr-mobl1.intel.com) ([10.245.245.54])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 06:26:32 -0700
From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
To: nathan@kernel.org,
	arnd@arndb.de,
	broonie@kernel.org,
	Liam.Howlett@oracle.com,
	urezki@gmail.com,
	will@kernel.org,
	kaleshsingh@google.com,
	rppt@kernel.org,
	leitao@debian.org,
	coxu@redhat.com,
	surenb@google.com,
	akpm@linux-foundation.org,
	luto@kernel.org,
	jpoimboe@kernel.org,
	changyuanl@google.com,
	hpa@zytor.com,
	dvyukov@google.com,
	kas@kernel.org,
	corbet@lwn.net,
	vincenzo.frascino@arm.com,
	smostafa@google.com,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	andreyknvl@gmail.com,
	alexander.shishkin@linux.intel.com,
	thiago.bauermann@linaro.org,
	catalin.marinas@arm.com,
	ryabinin.a.a@gmail.com,
	jan.kiszka@siemens.com,
	jbohac@suse.cz,
	dan.j.williams@intel.com,
	joel.granados@kernel.org,
	baohua@kernel.org,
	kevin.brodsky@arm.com,
	nicolas.schier@linux.dev,
	pcc@google.com,
	andriy.shevchenko@linux.intel.com,
	wei.liu@kernel.org,
	bp@alien8.de,
	ada.coupriediaz@arm.com,
	xin@zytor.com,
	pankaj.gupta@amd.com,
	vbabka@suse.cz,
	glider@google.com,
	jgross@suse.com,
	kees@kernel.org,
	jhubbard@nvidia.com,
	joey.gouly@arm.com,
	ardb@kernel.org,
	thuth@redhat.com,
	pasha.tatashin@soleen.com,
	kristina.martsenko@arm.com,
	bigeasy@linutronix.de,
	maciej.wieczor-retman@intel.com,
	lorenzo.stoakes@oracle.com,
	jason.andryuk@amd.com,
	david@redhat.com,
	graf@amazon.com,
	wangkefeng.wang@huawei.com,
	ziy@nvidia.com,
	mark.rutland@arm.com,
	dave.hansen@linux.intel.com,
	samuel.holland@sifive.com,
	kbingham@kernel.org,
	trintaeoitogc@gmail.com,
	scott@os.amperecomputing.com,
	justinstitt@google.com,
	kuan-ying.lee@canonical.com,
	maz@kernel.org,
	tglx@linutronix.de,
	samitolvanen@google.com,
	mhocko@suse.com,
	nunodasneves@linux.microsoft.com,
	brgerst@gmail.com,
	willy@infradead.org,
	ubizjak@gmail.com,
	peterz@infradead.org,
	mingo@redhat.com,
	sohil.mehta@intel.com
Cc: linux-mm@kvack.org,
	linux-kbuild@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	llvm@lists.linux.dev,
	kasan-dev@googlegroups.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 05/18] kasan: arm64: x86: Make special tags arch specific
Date: Tue, 12 Aug 2025 15:23:41 +0200
Message-ID: <788b6f9a1f5adf2b69564489d16de436ba1bdc3c.1755004923.git.maciej.wieczor-retman@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1755004923.git.maciej.wieczor-retman@intel.com>
References: <cover.1755004923.git.maciej.wieczor-retman@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

KASAN's tag-based mode defines multiple special tag values. They're
reserved for:
- Native kernel value. On arm64 it's 0xFF and it causes an early return
  in the tag checking function.
- Invalid value. 0xFE marks an area as freed / unallocated. It's also
  the value that is used to initialize regions of shadow memory.
- Max value. 0xFD is the highest value that can be randomly generated
  for a new tag.

Metadata macro is also defined:
- Tag width equal to 8.

Tag-based mode on x86 is going to use 4 bit wide tags so all the above
values need to be changed accordingly.

Make native kernel tag arch specific for x86 and arm64.

Replace hardcoded kernel tag value and tag width with macros in KASAN's
non-arch specific code.

Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
---
Changelog v4:
- Move KASAN_TAG_MASK to kasan-tags.h.

Changelog v2:
- Remove risc-v from the patch.

 MAINTAINERS                         |  2 +-
 arch/arm64/include/asm/kasan-tags.h |  9 +++++++++
 arch/x86/include/asm/kasan-tags.h   |  9 +++++++++
 include/linux/kasan-tags.h          | 10 +++++++++-
 include/linux/kasan.h               |  4 +++-
 include/linux/mm.h                  |  6 +++---
 include/linux/mmzone.h              |  1 -
 include/linux/page-flags-layout.h   |  9 +--------
 8 files changed, 35 insertions(+), 15 deletions(-)
 create mode 100644 arch/arm64/include/asm/kasan-tags.h
 create mode 100644 arch/x86/include/asm/kasan-tags.h

diff --git a/MAINTAINERS b/MAINTAINERS
index fe168477caa4..7ce8c6b86e3d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13166,7 +13166,7 @@ L:	kasan-dev@googlegroups.com
 S:	Maintained
 B:	https://bugzilla.kernel.org/buglist.cgi?component=Sanitizers&product=Memory%20Management
 F:	Documentation/dev-tools/kasan.rst
-F:	arch/*/include/asm/*kasan.h
+F:	arch/*/include/asm/*kasan*.h
 F:	arch/*/mm/kasan_init*
 F:	include/linux/kasan*.h
 F:	lib/Kconfig.kasan
diff --git a/arch/arm64/include/asm/kasan-tags.h b/arch/arm64/include/asm/kasan-tags.h
new file mode 100644
index 000000000000..8cb12ebae57f
--- /dev/null
+++ b/arch/arm64/include/asm/kasan-tags.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ASM_KASAN_TAGS_H
+#define __ASM_KASAN_TAGS_H
+
+#define KASAN_TAG_KERNEL	0xFF /* native kernel pointers tag */
+
+#define KASAN_TAG_WIDTH		8
+
+#endif /* ASM_KASAN_TAGS_H */
diff --git a/arch/x86/include/asm/kasan-tags.h b/arch/x86/include/asm/kasan-tags.h
new file mode 100644
index 000000000000..68ba385bc75c
--- /dev/null
+++ b/arch/x86/include/asm/kasan-tags.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ASM_KASAN_TAGS_H
+#define __ASM_KASAN_TAGS_H
+
+#define KASAN_TAG_KERNEL	0xF /* native kernel pointers tag */
+
+#define KASAN_TAG_WIDTH		4
+
+#endif /* ASM_KASAN_TAGS_H */
diff --git a/include/linux/kasan-tags.h b/include/linux/kasan-tags.h
index e07c896f95d3..fe80fa8f3315 100644
--- a/include/linux/kasan-tags.h
+++ b/include/linux/kasan-tags.h
@@ -2,7 +2,15 @@
 #ifndef _LINUX_KASAN_TAGS_H
 #define _LINUX_KASAN_TAGS_H
 
-#include <asm/kasan.h>
+#if defined(CONFIG_KASAN_SW_TAGS) || defined(CONFIG_KASAN_HW_TAGS)
+#include <asm/kasan-tags.h>
+#endif
+
+#ifndef KASAN_TAG_WIDTH
+#define KASAN_TAG_WIDTH		0
+#endif
+
+#define KASAN_TAG_MASK		((1UL << KASAN_TAG_WIDTH) - 1)
 
 #ifndef KASAN_TAG_KERNEL
 #define KASAN_TAG_KERNEL	0xFF /* native kernel pointers tag */
diff --git a/include/linux/kasan.h b/include/linux/kasan.h
index b396feca714f..54481f8c30c5 100644
--- a/include/linux/kasan.h
+++ b/include/linux/kasan.h
@@ -40,7 +40,9 @@ typedef unsigned int __bitwise kasan_vmalloc_flags_t;
 
 #ifdef CONFIG_KASAN_SW_TAGS
 /* This matches KASAN_TAG_INVALID. */
-#define KASAN_SHADOW_INIT 0xFE
+#ifndef KASAN_SHADOW_INIT
+#define KASAN_SHADOW_INIT KASAN_TAG_INVALID
+#endif
 #else
 #define KASAN_SHADOW_INIT 0
 #endif
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 1ae97a0b8ec7..bb494cb1d5af 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1692,7 +1692,7 @@ static inline u8 page_kasan_tag(const struct page *page)
 
 	if (kasan_enabled()) {
 		tag = (page->flags >> KASAN_TAG_PGSHIFT) & KASAN_TAG_MASK;
-		tag ^= 0xff;
+		tag ^= KASAN_TAG_KERNEL;
 	}
 
 	return tag;
@@ -1705,7 +1705,7 @@ static inline void page_kasan_tag_set(struct page *page, u8 tag)
 	if (!kasan_enabled())
 		return;
 
-	tag ^= 0xff;
+	tag ^= KASAN_TAG_KERNEL;
 	old_flags = READ_ONCE(page->flags);
 	do {
 		flags = old_flags;
@@ -1724,7 +1724,7 @@ static inline void page_kasan_tag_reset(struct page *page)
 
 static inline u8 page_kasan_tag(const struct page *page)
 {
-	return 0xff;
+	return KASAN_TAG_KERNEL;
 }
 
 static inline void page_kasan_tag_set(struct page *page, u8 tag) { }
diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 0c5da9141983..c139fb3d862d 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -1166,7 +1166,6 @@ static inline bool zone_is_empty(struct zone *zone)
 #define NODES_MASK		((1UL << NODES_WIDTH) - 1)
 #define SECTIONS_MASK		((1UL << SECTIONS_WIDTH) - 1)
 #define LAST_CPUPID_MASK	((1UL << LAST_CPUPID_SHIFT) - 1)
-#define KASAN_TAG_MASK		((1UL << KASAN_TAG_WIDTH) - 1)
 #define ZONEID_MASK		((1UL << ZONEID_SHIFT) - 1)
 
 static inline enum zone_type page_zonenum(const struct page *page)
diff --git a/include/linux/page-flags-layout.h b/include/linux/page-flags-layout.h
index 760006b1c480..b2cc4cb870e0 100644
--- a/include/linux/page-flags-layout.h
+++ b/include/linux/page-flags-layout.h
@@ -3,6 +3,7 @@
 #define PAGE_FLAGS_LAYOUT_H
 
 #include <linux/numa.h>
+#include <linux/kasan-tags.h>
 #include <generated/bounds.h>
 
 /*
@@ -72,14 +73,6 @@
 #define NODE_NOT_IN_PAGE_FLAGS	1
 #endif
 
-#if defined(CONFIG_KASAN_SW_TAGS)
-#define KASAN_TAG_WIDTH 8
-#elif defined(CONFIG_KASAN_HW_TAGS)
-#define KASAN_TAG_WIDTH 4
-#else
-#define KASAN_TAG_WIDTH 0
-#endif
-
 #ifdef CONFIG_NUMA_BALANCING
 #define LAST__PID_SHIFT 8
 #define LAST__PID_MASK  ((1 << LAST__PID_SHIFT)-1)
-- 
2.50.1

