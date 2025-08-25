Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9379D28F935
	for <llvm@lists.linux.dev>; Mon, 25 Aug 2025 20:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756153786; cv=none; b=lscJYZMJ3i30yCxhX4gxAGt+dWQ38kpQbgqHWaSQFkXImNo6/XAB/BKRF5Yp5kOKlq1eIcLUskSBCGxi/tpeusNBzhwdh7CRahiwqT9h72jHuZ5uUbJgvamGEjPFNheyn+nULsvNEqVePY89+J+e6US3W7gDZCVymHGEsrg7ezQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756153786; c=relaxed/simple;
	bh=9AhOaWTatNb4QMfmox2H6CEYyqT3KnhFIot1r52xKmg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iT4gxUA6dkH5/gKioVtBjiNQKIi+2RmU2OL5GNiB9zublfGqwqwjCsCH8VRKs3qTXXQEepbwa5amRYdhKTV5Wnk4/iF7+Hic3VssGstu9tclwxErB99wrTwDpBntfqExtDXXg/4S33ca7Oc38UFtC/sGSmu6B6LacOcekbawDMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AGpcCGOR; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AGpcCGOR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756153784; x=1787689784;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9AhOaWTatNb4QMfmox2H6CEYyqT3KnhFIot1r52xKmg=;
  b=AGpcCGORoAdpJGbOI6Zbfw1bs1i8kqFw9+L+knM3I122nWk8TSz1oWif
   QWWyQfYxlMMwI4Zd2splhfLBrA3EI4vnc1Mf4+AI5miag0OjbpEe/iFBO
   f+W8eodhcHr/EeyBq6d1SyBM82JusT0NVjidt9uIXtFN/yevEX0JjZ4rG
   YrzZIo3+/aTlf9sIpqkuCzckcETJmzBQLIt0auCevPRff5xAcfw/NS8Vb
   bnaI8FOS5W755RaCJXTo1foFEoYXV5xiHQV8bFqDAgJaFwMXIpLOShh1G
   PMgKsYwzIxdRBb62MSB8fbNXsDzl5LlK2wNjR8tce11AgPAz/z5+uVZDU
   g==;
X-CSE-ConnectionGUID: XDCPVK6zRlGtXRoBn8qOrA==
X-CSE-MsgGUID: oVQ4sWdzR5q74mcvW1zAsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="68970811"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="68970811"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 13:29:43 -0700
X-CSE-ConnectionGUID: dPjkVayTRFCsnqA9Ybv36w==
X-CSE-MsgGUID: H249bgJTR6CaQrcj46DBWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="169780586"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO wieczorr-mobl1.intel.com) ([10.245.245.6])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 13:29:23 -0700
From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
To: sohil.mehta@intel.com,
	baohua@kernel.org,
	david@redhat.com,
	kbingham@kernel.org,
	weixugc@google.com,
	Liam.Howlett@oracle.com,
	alexandre.chartre@oracle.com,
	kas@kernel.org,
	mark.rutland@arm.com,
	trintaeoitogc@gmail.com,
	axelrasmussen@google.com,
	yuanchu@google.com,
	joey.gouly@arm.com,
	samitolvanen@google.com,
	joel.granados@kernel.org,
	graf@amazon.com,
	vincenzo.frascino@arm.com,
	kees@kernel.org,
	ardb@kernel.org,
	thiago.bauermann@linaro.org,
	glider@google.com,
	thuth@redhat.com,
	kuan-ying.lee@canonical.com,
	pasha.tatashin@soleen.com,
	nick.desaulniers+lkml@gmail.com,
	vbabka@suse.cz,
	kaleshsingh@google.com,
	justinstitt@google.com,
	catalin.marinas@arm.com,
	alexander.shishkin@linux.intel.com,
	samuel.holland@sifive.com,
	dave.hansen@linux.intel.com,
	corbet@lwn.net,
	xin@zytor.com,
	dvyukov@google.com,
	tglx@linutronix.de,
	scott@os.amperecomputing.com,
	jason.andryuk@amd.com,
	morbo@google.com,
	nathan@kernel.org,
	lorenzo.stoakes@oracle.com,
	mingo@redhat.com,
	brgerst@gmail.com,
	kristina.martsenko@arm.com,
	bigeasy@linutronix.de,
	luto@kernel.org,
	jgross@suse.com,
	jpoimboe@kernel.org,
	urezki@gmail.com,
	mhocko@suse.com,
	ada.coupriediaz@arm.com,
	hpa@zytor.com,
	maciej.wieczor-retman@intel.com,
	leitao@debian.org,
	peterz@infradead.org,
	wangkefeng.wang@huawei.com,
	surenb@google.com,
	ziy@nvidia.com,
	smostafa@google.com,
	ryabinin.a.a@gmail.com,
	ubizjak@gmail.com,
	jbohac@suse.cz,
	broonie@kernel.org,
	akpm@linux-foundation.org,
	guoweikang.kernel@gmail.com,
	rppt@kernel.org,
	pcc@google.com,
	jan.kiszka@siemens.com,
	nicolas.schier@linux.dev,
	will@kernel.org,
	andreyknvl@gmail.com,
	jhubbard@nvidia.com,
	bp@alien8.de
Cc: x86@kernel.org,
	linux-doc@vger.kernel.org,
	linux-mm@kvack.org,
	llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 12/19] x86: Minimal SLAB alignment
Date: Mon, 25 Aug 2025 22:24:37 +0200
Message-ID: <c9dfcee8bd04161394f41a21f78fc3e01a007ddb.1756151769.git.maciej.wieczor-retman@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1756151769.git.maciej.wieczor-retman@intel.com>
References: <cover.1756151769.git.maciej.wieczor-retman@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

8 byte minimal SLAB alignment interferes with KASAN's granularity of 16
bytes. It causes a lot of out-of-bounds errors for unaligned 8 byte
allocations.

Compared to a kernel with KASAN disabled, the memory footprint increases
because all kmalloc-8 allocations now are realized as kmalloc-16, which
has twice the object size. But more meaningfully, when compared to a
kernel with generic KASAN enabled, there is no difference. Because of
redzones in generic KASAN, kmalloc-8' and kmalloc-16' object size is the
same (48 bytes). So changing the minimal SLAB alignment of the tag-based
mode doesn't have any negative impact when compared to the other
software KASAN mode.

Adjust x86 minimal SLAB alignment to match KASAN granularity size.

Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
---
Changelog v4:
- Extend the patch message with some more context and impact
  information.

Changelog v3:
- Fix typo in patch message 4 -> 16.
- Change define location to arch/x86/include/asm/cache.c.

 arch/x86/include/asm/cache.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/x86/include/asm/cache.h b/arch/x86/include/asm/cache.h
index 69404eae9983..3232583b5487 100644
--- a/arch/x86/include/asm/cache.h
+++ b/arch/x86/include/asm/cache.h
@@ -21,4 +21,8 @@
 #endif
 #endif
 
+#ifdef CONFIG_KASAN_SW_TAGS
+#define ARCH_SLAB_MINALIGN (1ULL << KASAN_SHADOW_SCALE_SHIFT)
+#endif
+
 #endif /* _ASM_X86_CACHE_H */
-- 
2.50.1

