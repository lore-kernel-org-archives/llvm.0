Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C116E233D92;
	Wed, 12 Mar 2025 08:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741768026; cv=none; b=qPMh5qSGJ7Y6QISJboePbyj78jzbBwAfDA6pBzx/l8Bx7b3MOTdZw0THKy41pERafhSk6E+53Q/BXWsCvcXUyUOEonA6fPICNg0snUVsk3ueaFbcvKt8HRuBkiG45Hcv2Ucr/4Bp6lfQt+5YXqy6hTatbGp45rSBzIS0DpEgqA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741768026; c=relaxed/simple;
	bh=IPTTJc0kFjfAppvWComJqJDpdusPUzEF7twNLxHKBvA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XaF0Tgxn3RSMnJ98nG8qf/crAEE93IpAeXtr9Qqky57KQ2hiJdom1Gr2AGkFvB0WOcmHWxBBWdpzZttEAEbbqEMfTiEjX2HdGop8WJk6DHPdiV2Wn9+dB7IYuCfVXEy5sijzfCXeZjlhtTz3bgdjUo+PkhHFwNV6MkRHXW0+Gr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=knvPA9ja; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="knvPA9ja"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741768024; x=1773304024;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IPTTJc0kFjfAppvWComJqJDpdusPUzEF7twNLxHKBvA=;
  b=knvPA9ja/OJAYt1fRIk5d6XWOoAtWBV8+svfkvPWUVKslvLt6LDJmm3F
   m6cRYKfQzZNjalifOG80q5j2Zc9jEHlFdf4RsRIGuNvwYNqBwbLOUSmE3
   xkrmOYmHzRG3+npFJ/Jpv4V/PXMRdEcAMW4rNg7W+CnjjOlmBTZa2J4nl
   OkJvfjvbgxPBSbAF9pwejDhLTPrP5VyW2qjayjqVQu/oezH68iKPuXapa
   BCqkZ61IkHqiK7HF6VcH/M9jqwG4sVLXu7Il1AABScvCtZdVCs/QLj3e/
   zUlbzVpW49Co9r0hZA6b52LwmzszmHVu259t6DhOoBuwPo+o4KRXWR7u9
   A==;
X-CSE-ConnectionGUID: 1wQHtURPSOSN9dDfmyy3uQ==
X-CSE-MsgGUID: IE49lGd5Q4GHZmdflBDb7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="42968003"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="42968003"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 01:27:02 -0700
X-CSE-ConnectionGUID: LE0/D+C0TJW2Vhtzo/ETyA==
X-CSE-MsgGUID: +3XvKCk5RO6x7Xu9mmNuFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="125762013"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 12 Mar 2025 01:27:00 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsHQY-0008Gj-2H;
	Wed, 12 Mar 2025 08:26:58 +0000
Date: Wed, 12 Mar 2025 16:26:38 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mike Rapoport <rppt@kernel.org>
Subject: [rppt:mem_init/v2 10/13] mm/mm_init.c:1768:59: error: 'ZONE_HIGHMEM'
 undeclared; did you mean 'OPT_ZONE_HIGHMEM'?
Message-ID: <202503121628.b9MCLGbt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git mem_init/v2
head:   3e32ff055084020fd5780bfed058a34c2547c325
commit: efdddb6d337877b5467b46600472df230dda03b2 [10/13] arch, mm: set high_memory in free_area_init()
config: arc-randconfig-002-20250312 (https://download.01.org/0day-ci/archive/20250312/202503121628.b9MCLGbt-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250312/202503121628.b9MCLGbt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503121628.b9MCLGbt-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/mm_init.c: In function 'set_high_memory':
>> mm/mm_init.c:1768:59: error: 'ZONE_HIGHMEM' undeclared (first use in this function); did you mean 'OPT_ZONE_HIGHMEM'?
    1768 |         unsigned long pfn = arch_zone_lowest_possible_pfn[ZONE_HIGHMEM];
         |                                                           ^~~~~~~~~~~~
         |                                                           OPT_ZONE_HIGHMEM
   mm/mm_init.c:1768:59: note: each undeclared identifier is reported only once for each function it appears in


vim +1768 mm/mm_init.c

  1765	
  1766	static void set_high_memory(void)
  1767	{
> 1768		unsigned long pfn = arch_zone_lowest_possible_pfn[ZONE_HIGHMEM];
  1769		phys_addr_t highmem = memblock_end_of_DRAM();
  1770	
  1771		/*
  1772		 * Some architecutures (e.g. ARM) set high_memory very early and
  1773		 * use it in arch setup code.
  1774		 * If an architecure already set high_memory don't overwrite it
  1775		 */
  1776		if (high_memory)
  1777			return;
  1778	
  1779		if (IS_ENABLED(CONFIG_HIGHMEM) &&
  1780		    (arch_has_descending_max_zone_pfns() || highmem > PFN_PHYS(pfn)))
  1781			highmem = PFN_PHYS(pfn);
  1782	
  1783		high_memory = phys_to_virt(highmem - 1) + 1;
  1784	}
  1785	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
