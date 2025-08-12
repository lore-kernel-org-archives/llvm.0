Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEAC6281538
	for <llvm@lists.linux.dev>; Tue, 12 Aug 2025 13:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755005260; cv=none; b=l85sSxlzjfMdjaH0k+kUT30T9Z3bWtb/Clec6N48HqeWUkPlNTSzmB8j2B55IesG07jl4A3TCxem3j59JE9kbfm9ioP/B6y7WHNHAGpxZ48MLFyPQtHva2vqZpx49S2viv1v98bnOHqd8tnArlX6pJF0v3cmRdkcSd+SEs5UpUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755005260; c=relaxed/simple;
	bh=WytGKsbpVx+YjGfDckn4ztihfy/XnHxiwtMc2ueYMYI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h+etjhFto/14X5RNk7wkoOglCNmIIK9Geh4M8PjZ/cxxgGHiEuVGBG1Ynabu6o6nsFiq/oBzzshsMFKF1kn8ZTpxIb9MmZ57CGYe6GaY/LRrw6nViwtjzoBQ84HCXsHxtnjNDccL3xmUrnRTA6VrwRfEsnaXkO8KKmvJrwLnGO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y9IZV7OQ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y9IZV7OQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755005259; x=1786541259;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WytGKsbpVx+YjGfDckn4ztihfy/XnHxiwtMc2ueYMYI=;
  b=Y9IZV7OQfryCWiouygBY8Noa/Iz+aeLwHUoWkowIJcwtfcH4c5lmJ/Bw
   CSC14VzQ5KB9AmA2El6pKfBnDgC2I33UHrtXzsOd9oChkZAq8HLOd5Ro6
   NQoFlz4eH9Rk8GpORFk7sBfllgfZUpGSm4kQiXJW4Dt6aOYFTS5vjMrb1
   yCwTBLnC4lOqM/pnlysZe1PY2CxLQ6rUq5x366iWkSIya773wX15WurA0
   ebM9bIy7EEoaNlXgpVuBi4kU/stx4yq0a5sWE9kW+VxvurIeGm80F0faP
   NqMEaqyIDqdzdjmPPo2j8my5n2ozrOSJBPq9v0flncJu5GyljuNpS2MwA
   A==;
X-CSE-ConnectionGUID: 192qBB+rQluACdSg+IWz1Q==
X-CSE-MsgGUID: cxAIa6GZStaLtpkACuKegw==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="60903498"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="60903498"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 06:27:38 -0700
X-CSE-ConnectionGUID: 7sr1bGkITqqOrRUhUWybYQ==
X-CSE-MsgGUID: Oy2/bGKxRJGKw5AHGzSS+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="165831445"
Received: from vpanait-mobl.ger.corp.intel.com (HELO wieczorr-mobl1.intel.com) ([10.245.245.54])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 06:27:16 -0700
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
Subject: [PATCH v4 07/18] mm: x86: Untag addresses in EXECMEM_ROX related pointer arithmetic
Date: Tue, 12 Aug 2025 15:23:43 +0200
Message-ID: <aa501a8133ee0f336dc9f905fdc3453d964109ed.1755004923.git.maciej.wieczor-retman@intel.com>
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

ARCH_HAS_EXECMEM_ROX was re-enabled in x86 at Linux 6.14 release.
Related code has multiple spots where page virtual addresses end up used
as arguments in arithmetic operations. Combined with enabled tag-based
KASAN it can result in pointers that don't point where they should or
logical operations not giving expected results.

vm_reset_perms() calculates range's start and end addresses using min()
and max() functions. To do that it compares pointers but some are not
tagged - addr variable is, start and end variables aren't.

within() and within_range() can receive tagged addresses which get
compared to untagged start and end variables.

Reset tags in addresses used as function arguments in min(), max(),
within() and within_range().

execmem_cache_add() adds tagged pointers to a maple tree structure,
which then are incorrectly compared when walking the tree. That results
in different pointers being returned later and page permission violation
errors panicking the kernel.

Reset tag of the address range inserted into the maple tree inside
execmem_cache_add().

Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
---
Changelog v4:
- Add patch to the series.

 arch/x86/mm/pat/set_memory.c | 1 +
 mm/execmem.c                 | 4 +++-
 mm/vmalloc.c                 | 4 ++--
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index 8834c76f91c9..1f14a1297db0 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -222,6 +222,7 @@ static inline void cpa_inc_lp_preserved(int level) { }
 static inline int
 within(unsigned long addr, unsigned long start, unsigned long end)
 {
+	addr = (unsigned long)kasan_reset_tag((void *)addr);
 	return addr >= start && addr < end;
 }
 
diff --git a/mm/execmem.c b/mm/execmem.c
index 0822305413ec..743fa4a8c069 100644
--- a/mm/execmem.c
+++ b/mm/execmem.c
@@ -191,6 +191,8 @@ static int execmem_cache_add_locked(void *ptr, size_t size, gfp_t gfp_mask)
 	unsigned long lower, upper;
 	void *area = NULL;
 
+	addr = arch_kasan_reset_tag(addr);
+
 	lower = addr;
 	upper = addr + size - 1;
 
@@ -216,7 +218,7 @@ static int execmem_cache_add(void *ptr, size_t size, gfp_t gfp_mask)
 static bool within_range(struct execmem_range *range, struct ma_state *mas,
 			 size_t size)
 {
-	unsigned long addr = mas->index;
+	unsigned long addr = arch_kasan_reset_tag(mas->index);
 
 	if (addr >= range->start && addr + size < range->end)
 		return true;
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 6dbcdceecae1..83d666e4837a 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3328,8 +3328,8 @@ static void vm_reset_perms(struct vm_struct *area)
 			unsigned long page_size;
 
 			page_size = PAGE_SIZE << page_order;
-			start = min(addr, start);
-			end = max(addr + page_size, end);
+			start = min((unsigned long)arch_kasan_reset_tag(addr), start);
+			end = max((unsigned long)arch_kasan_reset_tag(addr) + page_size, end);
 			flush_dmap = 1;
 		}
 	}
-- 
2.50.1

