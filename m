Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794918481;
	b=l9KsJujlBBEMipl9rzHfB6Khrv8876uZYVlPhHoFiopS+wvsZk5ATJnkKHVhz7PV6bS5
	 AcjxrxZK8JfA9AaCRRhBnaJhjOQ/6PUrjcBUgFPY5cbDHUJwwcQOE7Y2GjuHNYcwXwA2P
	 hO5XCjOtAY+CWPOV1zMVNlcCzFCxfxICAWkpHQa0iKUJMOuZiTuv1IQI2EjlptotF/6Fn
	 8tWnjfD/rGMP2BkEtFbAXU2LM4/10hmSHncLnF5OC+FnlLdUx7X2BeZ9XuIktmKMEyxCR
	 pD3S+fdeGcZh4QckjuXh4QtiUHVredUfQ/aweYtsLaO+tilKdK8I6WCdnbdrYS+W2KQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794918481;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=KM2AxC661JUFDMgbgS/j/UEBdUL+WXU1AFM74ye9SbA=;
	b=MMYARhWST6yRFzJwkKdl94E6nEFCB92qqJryDLO6oXPoDvL0Mfj2CbhA0NnTosjunGyi
	 82HoAJsDpZ5do7Gpcb17DXG35TLY08t3vUlCk6S0vozb7FtiUwmJ77PVrt3EKY0E7ShaW
	 9sn2ksQV2PjJBmgpSQstbLJg5GrJ3BSqFAqoT0JMCJgHwPJ7GE/44QTUpceDdH7gNIL+A
	 C5WnYTHyHoCj6E4XBRYyrIuP3Lj1Nma2CmNeHPJ2KBdYhy5rXA2xPSLhvwT1ZX2YRO9Kj
	 QR3UN7OyVyYwQRdr21ofzMgNSIy+ej6d9qLtYwUagjFXy6wJTov09NN4ER3jBcUtSBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZML8WhTO;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC36606A323;
	Tue, 17 Nov 2026 12:28:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BC36606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZML8WhTO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794918481; x=1826454481;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ndTg7sq8BTwzV5ZIdQVv8vLbR7ewI5Azcqn8dK7UYzM=;
  b=ZML8WhTOAU/dlBE/sCKro4TTQb/f/u4BOolO4Kwj3zNZXuA/OKhosCwb
   U0shKDV6YPQZLMcvrFX4PVXAIbpr8u4g4KfuAlK+XGOzGxdMOWIfuR/rd
   9f15GtY7Cy2A5B5A3uzvikqk2XYuuUGvI1LEUxDN/dzHCfanlKq5RAtBk
   IhbaiZU5BihXT735u1NaBZVCqhDIPREuKY6BTbJTOdrVBXtAjtSB5rH00
   DD1hVbWh9vDgEW30CiIUreRw1mwwukj8G5vPoyjxJrFDZPLj9s16a2DBr
   jM1jxGZVTV1P55RM/X2gJrkBNqfha1JtDam+IFSn8571o2xwPWG9aG12K
   g==;
X-CSE-ConnectionGUID: uoXXMlIiSnCMt8OLFfNoOw==
X-CSE-MsgGUID: CYMgfw7eSeKJ1TOmdn+rlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3708468"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3708468"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 04:28:00 -0800
X-CSE-ConnectionGUID: NXh2zuLfQMCZt8jrPFWneA==
X-CSE-MsgGUID: hloi4fbTT666ZNmxD62qgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="10225051"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 17 Nov 2026 04:27:57 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTIHy-00000001BTZ-3Fww;
	Tue, 17 Nov 2026 12:27:54 +0000
Date: Tue, 17 Nov 2026 20:27:32 +0800
From: kernel test robot <lkp@intel.com>
To: xu.xin@linux.dev, David Hildenbrand <david@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Donet Tom <donettom@linux.ibm.com>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org, Xu Xin <xu.xin@linux.dev>,
	stable@vger.kernel.org
Subject: Re: [PATCH] mm/ksm: do not inherit ksm_zero_pages counter or PTE
 markers on fork
Message-ID: <202611172040.LO8S0kBo-lkp@intel.com>
References: <20261117081821.7211-1-xu.xin@linux.dev>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117081821.7211-1-xu.xin@linux.dev>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/xu-xin-linux-dev/mm-ksm-do-not-inherit-ksm_zero_pages-counter-or-PTE-markers-on-fork/20261117-161821
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20261117081821.7211-1-xu.xin%40linux.dev
patch subject: [PATCH] mm/ksm: do not inherit ksm_zero_pages counter or PTE markers on fork
config: hexagon-allnoconfig (https://download.01.org/0day-ci/archive/20261117/202611172040.LO8S0kBo-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project a69be15ed58ed48738a69ec4c7d0f3e8c7dbe4ce)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261117/202611172040.LO8S0kBo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611172040.LO8S0kBo-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/memory.c:1168:6: error: call to undeclared function 'is_ksm_zero_pte'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1168 |         if (is_ksm_zero_pte(pte))
         |             ^
   1 error generated.


vim +/is_ksm_zero_pte +1168 mm/memory.c

  1123	
  1124	static __always_inline void __copy_present_ptes(struct vm_area_struct *dst_vma,
  1125			struct vm_area_struct *src_vma, pte_t *dst_pte, pte_t *src_pte,
  1126			pte_t pte, unsigned long addr, int nr)
  1127	{
  1128		struct mm_struct *src_mm = src_vma->vm_mm;
  1129		bool writable;
  1130	
  1131		/*
  1132		 * Snapshot writability before the RWP-disarm rewrite below: when the
  1133		 * child is not RWP-armed, pte_modify(pte, dst_vma->vm_page_prot) can
  1134		 * silently drop _PAGE_RW from a resolved (no-marker) writable PTE,
  1135		 * so a later pte_write(pte) check would skip the COW wrprotect and
  1136		 * leave the parent writable over a folio shared with the child.
  1137		 */
  1138		writable = pte_write(pte);
  1139	
  1140		/*
  1141		 * Child is not RWP-armed: restore accessible protection so the
  1142		 * inherited PAGE_NONE does not cost a fault on first read. Gate on
  1143		 * pte_uffd(pte) so unrelated PAGE_NONE markers (e.g. NUMA balancing)
  1144		 * are not normalised away.
  1145		 */
  1146		if (!userfaultfd_protected(dst_vma)) {
  1147			if (userfaultfd_rwp(src_vma) && pte_uffd(pte))
  1148				pte = pte_modify(pte, dst_vma->vm_page_prot);
  1149			pte = pte_clear_uffd(pte);
  1150		}
  1151	
  1152		/* If it's a COW mapping, write protect it both processes. */
  1153		if (vma_is_cow_mapping(src_vma) && writable) {
  1154			wrprotect_ptes(src_mm, addr, src_pte, nr);
  1155			pte = pte_wrprotect(pte);
  1156		}
  1157	
  1158		/* If it's a shared mapping, mark it clean in the child. */
  1159		if (src_vma->vm_flags & VM_SHARED)
  1160			pte = pte_mkclean(pte);
  1161		pte = pte_mkold(pte);
  1162	
  1163		/*
  1164		 * Clear the dirty-bit marker on KSM-placed zero-page PTEs in the
  1165		 * child so inherited mappings are not accounted against the child or
  1166		 * unshared by MADV_UNMERGEABLE.  Special PTEs always have nr == 1.
  1167		 */
> 1168		if (is_ksm_zero_pte(pte))
  1169			pte = pte_mkclean(pte);
  1170	
  1171		set_ptes(dst_vma->vm_mm, addr, dst_pte, pte, nr);
  1172	}
  1173	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
