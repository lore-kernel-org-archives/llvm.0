Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A495222D4D4
	for <llvm@lists.linux.dev>; Tue, 18 Feb 2025 08:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739866752; cv=none; b=jtnMhbo+d6C0hxaB2+VcFs/ahCq3vO3/V56a8n6dEzpCjtR5aE9IbFSLQlSKbQjjZW8YymOHcffZxzox3x/cRqDFaYRLslnOBzb1v35TnaTnbjOB1AvYyz8jrpMLOHKguRkQhaEDwIXZp+xkXNzgJPJHuUUlB3e0ryitNm672uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739866752; c=relaxed/simple;
	bh=PewXt3mq2ZzovNzL7I8Fp3xpOP5/pryHgDbcA5gr/7A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fJBPIOaR+46lsfPXl8WlJRdgH0cYErY3qCrKDMChjDmSzHSylyl6IxhTmEEPskHS4zrPHIOIhJdVKU4tIr68DuwLMsvWEpMF9rrX6vAyt1yPCcHXBHIRWvBtY669iMRsSl/htW6bEAioE6JCabU+vKtjSeIAHOmOsu5NwTUznHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WYWDdk2s; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WYWDdk2s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739866751; x=1771402751;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PewXt3mq2ZzovNzL7I8Fp3xpOP5/pryHgDbcA5gr/7A=;
  b=WYWDdk2sq0Zkah+klCQ6URNeHyL9wfbQbd0mwKHLz63kn/PRgV28Qwld
   y8uYjzwq+RxL0HEJsq/zdvrEU9zVNWS2NmGq+S5wj5jf0HoylROx5nv4M
   BKkf8PfW+tSy0yhpvOOal/mx7VAJuh0zH6HIV2LOH14GK+ApLGlBhoSG8
   pkCLQGDTkS3Ghs82XS9NVCjL5oi/GXYqJCQcSyt3hWPI3aJQl8VPC3vce
   3fCdY1EmzJv0u4kGJH0jnC0Y2D6cO0egtGnwA0rh2Hq+F73kvsw2T8Ce6
   /r1eKMNfNPwC5ec0+5/akTUWCJFEkyBJaagyd76k5Pycjyj4AInpm1GoF
   w==;
X-CSE-ConnectionGUID: q2gS3/OHSHql+sX7kh9/Aw==
X-CSE-MsgGUID: TzpH2nWQRc6a5dWjegfNzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="28150358"
X-IronPort-AV: E=Sophos;i="6.13,295,1732608000"; 
   d="scan'208";a="28150358"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 00:19:09 -0800
X-CSE-ConnectionGUID: TjE0RLKdQ9KhXqTyx5cbfw==
X-CSE-MsgGUID: sZVzDBj6QnqZ2EAIVQa3TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="119247808"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO wieczorr-mobl1.intel.com) ([10.245.245.49])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 00:18:48 -0800
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
Subject: [PATCH v2 09/14] mm: Pcpu chunk address tag reset
Date: Tue, 18 Feb 2025 09:15:25 +0100
Message-ID: <383482f87ad4f68690021e0cc75df8143b6babe2.1739866028.git.maciej.wieczor-retman@intel.com>
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

The problem presented here is related to NUMA systems and tag-based
KASAN mode. Getting to it can be explained in the following points:

	1. A new chunk is created with pcpu_create_chunk() and
	   vm_structs are allocated. On systems with one NUMA node only
	   one is allocated, but with more NUMA nodes at least a second
	   one will be allocated too.

	2. chunk->base_addr is assigned the modified value of
	   vms[0]->addr and thus inherits the tag of this allocated
	   structure.

	3. In pcpu_alloc() for each possible cpu pcpu_chunk_addr() is
	   executed which calculates per cpu pointers that correspond to
	   the vms structure addresses. The calculations are based on
	   adding an offset from a table to chunk->base_addr.

Here the problem presents itself since for addresses based on vms[1] and
up, the tag will be different than the ones based on vms[0] (base_addr).
The tag mismatch happens and an error is reported.

Reset the base_addr tag, since it will disable tag checks for pointers
derived arithmetically from base_addr that would inherit its tag.

Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
---
 mm/percpu-vm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/percpu-vm.c b/mm/percpu-vm.c
index cd69caf6aa8d..e13750d804f7 100644
--- a/mm/percpu-vm.c
+++ b/mm/percpu-vm.c
@@ -347,7 +347,7 @@ static struct pcpu_chunk *pcpu_create_chunk(gfp_t gfp)
 	}
 
 	chunk->data = vms;
-	chunk->base_addr = vms[0]->addr - pcpu_group_offsets[0];
+	chunk->base_addr = kasan_reset_tag(vms[0]->addr) - pcpu_group_offsets[0];
 
 	pcpu_stats_chunk_alloc();
 	trace_percpu_create_chunk(chunk->base_addr);
-- 
2.47.1

