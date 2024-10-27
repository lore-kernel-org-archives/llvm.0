Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0C92BB1B;
	Sun, 27 Oct 2024 05:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730005816; cv=none; b=ID0yK0JCtsVTjEIQY9cQpbctbIECLDIfGsONxkCefxkUKJ1SzXZdpjaa76dtOakdvl2ENrjWbKJiwe7Xn3OjBFVCBIp1VIM3SZ1cVnjW8VkkNM4YVmk+ML8zpyOmKpf1zGJpifZj3DUdcBMSwocnnKUONQ7ngh7hexo0X0jNj4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730005816; c=relaxed/simple;
	bh=gOpvBi4jRFxJGEqoeXlmNKJVg1JSKXO/yfTpUz89pq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PfopkmA9pAmzfV2t06mOjFPqzwE0l2T8aDTP0WlZ+wo5pYzWZrKUb3MWG+FV02xLb5txLG1kc0k0QRk1+t5ryLJssGBO/N3zKQ6uO5RiGoPK+fB/Zjmch2K563GDZJMWiWyTQp2yVD9jiwC8AXX8V3tco0+uyn7KXxcrooxQoOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NgfQYjPB; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NgfQYjPB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730005815; x=1761541815;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gOpvBi4jRFxJGEqoeXlmNKJVg1JSKXO/yfTpUz89pq8=;
  b=NgfQYjPBrNk+bUBuWEV57OGUBUo3PsVPASAOHFD5IuDCQ28bwFYdyT5l
   zKja9GnyWCNQI42EWEnKeqxkM4fpzqB0+kRg5amkp3+y5LP3bn37AcdvG
   Jag/wT8zYvfy7qOJVOYtfkpm2ZM9/+3pR7lrXIaXIFpuwR5T/qjfsTb2M
   k8Vx54583kpHqQlUreuVMwRC2rm+vpIEQwF9jD4HJyUL14/pzfzLYBfuc
   6toEd7tKNwsT58pwjnY0AzKqENFAc97lI1wkF4Z/+qb0Uk65kdIEJuYY5
   ox/iaHRufPaIIJdp2rrn5w/OcrooQA0TM9FzoyL3W3m2DMWVicFA/Lwto
   Q==;
X-CSE-ConnectionGUID: 5xRav+LpQSS6wjPEFisR1w==
X-CSE-MsgGUID: o7rLnsyjQ5CluL4koHlYLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11237"; a="32492533"
X-IronPort-AV: E=Sophos;i="6.11,236,1725346800"; 
   d="scan'208";a="32492533"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 22:10:11 -0700
X-CSE-ConnectionGUID: bKXtSiveR3mewcUugs+Nug==
X-CSE-MsgGUID: Iz+E6oH6RIyq1iQTsnroug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,236,1725346800"; 
   d="scan'208";a="80921916"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 26 Oct 2024 22:10:11 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4vXU-000aO0-08;
	Sun, 27 Oct 2024 05:10:08 +0000
Date: Sun, 27 Oct 2024 13:09:14 +0800
From: kernel test robot <lkp@intel.com>
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] memcg: workingset: remove folio_memcg_rcu usage
Message-ID: <202410271328.q4gVeNsh-lkp@intel.com>
References: <20241026163707.2479526-1-shakeel.butt@linux.dev>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241026163707.2479526-1-shakeel.butt@linux.dev>

Hi Shakeel,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master v6.12-rc4 next-20241025]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shakeel-Butt/memcg-workingset-remove-folio_memcg_rcu-usage/20241027-003815
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20241026163707.2479526-1-shakeel.butt%40linux.dev
patch subject: [PATCH v2] memcg: workingset: remove folio_memcg_rcu usage
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20241027/202410271328.q4gVeNsh-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241027/202410271328.q4gVeNsh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410271328.q4gVeNsh-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/workingset.c:8:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/workingset.c:9:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
>> mm/workingset.c:598:31: error: call to undeclared function 'folio_memcg_charged'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     598 |         if (mem_cgroup_disabled() || folio_memcg_charged(folio))
         |                                      ^
   mm/workingset.c:598:31: note: did you mean 'folio_memcg_check'?
   include/linux/memcontrol.h:1058:34: note: 'folio_memcg_check' declared here
    1058 | static inline struct mem_cgroup *folio_memcg_check(struct folio *folio)
         |                                  ^
   3 warnings and 1 error generated.


vim +/folio_memcg_charged +598 mm/workingset.c

   587	
   588	/**
   589	 * workingset_activation - note a page activation
   590	 * @folio: Folio that is being activated.
   591	 */
   592	void workingset_activation(struct folio *folio)
   593	{
   594		/*
   595		 * Filter non-memcg pages here, e.g. unmap can call
   596		 * mark_page_accessed() on VDSO pages.
   597		 */
 > 598		if (mem_cgroup_disabled() || folio_memcg_charged(folio))
   599			workingset_age_nonresident(folio_lruvec(folio), folio_nr_pages(folio));
   600	}
   601	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
