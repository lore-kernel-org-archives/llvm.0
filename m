Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09F6143C4D;
	Tue,  4 Jun 2024 22:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717541794; cv=none; b=E9p8+rHok8WB4Cgiznx0118nrpmmBZXJ1ixv4IjmWBzO9/SM2Y9020Zg8IAf5EYVUTCQAReIAwtvd+/rKkc1u+b09advxg6DWVXQMxKo21E+K+gYzjK2uVMm2qys1EOY5Kh/rJ5joatl+ye5hFjko50dtAM2bEX0SYocU0E79Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717541794; c=relaxed/simple;
	bh=nZNryhcoFtzW/5oT7/zR2d7gRfCNJX+kKOGg4rbpdrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qAZpEWYSCFhOA04/PCGffqwxWqW3hjhIIOigQcsnGcLIbhXH6rFaK98XTkUnsMP3YblIVZLDu34Ki3bn9n2V7frpHWHLxHaYdBzfWWxjwiluRu8YaQoQ0DzlMMUlcfLBKHtL2myasZeHjaAjT6y5U03BQVLld29H3HZRorUolcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TxOJ0mnX; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TxOJ0mnX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717541793; x=1749077793;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nZNryhcoFtzW/5oT7/zR2d7gRfCNJX+kKOGg4rbpdrs=;
  b=TxOJ0mnXoMJhIDZWv48L/qwv19UTvLWVNgXIjSWDEd+/m8h16pS8/6br
   FyRhCQv8ZaMDeuElZmSzudOlRjUPml6h0tdF+PSVSDwK2vKyQpN5yG+CY
   fhusRlcVX7ZhlPo8YIZ/97LaQWgHkTpHZgK05K4Y9QJobaqUAIrZoELAp
   xV5Gj3C2GBw2PyVsl4a+qERlrsR7hYfbf4+hiEru59Gq3SUHNXmWi2j7J
   1qGLg+OAApmsRAR4X76Vl7MRbbH2AMJ2VpS2NkF14rpNukhXNvD96xBI3
   KDwBwEopszVrl2U1awQhpp4Cw74bXDVcw6A7O3T8n7imtUBtEeSMNcspW
   Q==;
X-CSE-ConnectionGUID: LYRA6saBTaqvvB+eUO7dIw==
X-CSE-MsgGUID: 674EyYCJSkGxLreP6IyYbg==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="14254516"
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; 
   d="scan'208";a="14254516"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2024 15:56:33 -0700
X-CSE-ConnectionGUID: ZMAMxOhORbWpZ8KjiouN6Q==
X-CSE-MsgGUID: /JwtXkokRTqQRniM+lvvKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; 
   d="scan'208";a="60577794"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 04 Jun 2024 15:56:25 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sEd4o-0000dh-2N;
	Tue, 04 Jun 2024 22:56:22 +0000
Date: Wed, 5 Jun 2024 06:55:33 +0800
From: kernel test robot <lkp@intel.com>
To: Yuanchu Xie <yuanchu@google.com>, David Hildenbrand <david@redhat.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
	Khalid Aziz <khalid.aziz@oracle.com>,
	Henry Huang <henry.hj@antgroup.com>, Yu Zhao <yuzhao@google.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Gregory Price <gregory.price@memverge.com>,
	Huang Ying <ying.huang@intel.com>,
	Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kalesh Singh <kaleshsingh@google.com>, Wei Xu <weixugc@google.com>,
	David Rientjes <rientjes@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Yosry Ahmed <yosryahmed@google.com>,
	Matthew Wilcox <willy@infradead.org>,
	Sudarshan Rajagopalan <quic_sudaraja@quicinc.com>,
	Kairui Song <kasong@tencent.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Vasily Averin <vasily.averin@linux.dev>,
	Nhat Pham <nphamcs@gmail.com>, Miaohe Lin <linmiaohe@huawei.com>,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: Re: [PATCH v2 5/8] mm: extend working set reporting to memcgs
Message-ID: <202406050600.hZAG0KTL-lkp@intel.com>
References: <20240604020549.1017540-6-yuanchu@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240604020549.1017540-6-yuanchu@google.com>

Hi Yuanchu,

kernel test robot noticed the following build errors:

[auto build test ERROR on driver-core/driver-core-testing]
[also build test ERROR on driver-core/driver-core-next driver-core/driver-core-linus staging/staging-testing staging/staging-next staging/staging-linus linus/master v6.10-rc2 next-20240604]
[cannot apply to akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yuanchu-Xie/mm-multi-gen-LRU-ignore-non-leaf-pmd_young-for-force_scan-true/20240604-100824
base:   driver-core/driver-core-testing
patch link:    https://lore.kernel.org/r/20240604020549.1017540-6-yuanchu%40google.com
patch subject: [PATCH v2 5/8] mm: extend working set reporting to memcgs
config: s390-randconfig-002-20240605 (https://download.01.org/0day-ci/archive/20240605/202406050600.hZAG0KTL-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240605/202406050600.hZAG0KTL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406050600.hZAG0KTL-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/workingset_report.c:6:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/workingset_report.c:14:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
>> mm/workingset_report.c:45:37: error: incomplete definition of type 'struct mem_cgroup'
      45 |                 wsr->page_age_cgroup_file = &memcg->workingset_page_age_file;
         |                                              ~~~~~^
   include/linux/mm_types.h:33:8: note: forward declaration of 'struct mem_cgroup'
      33 | struct mem_cgroup;
         |        ^
>> mm/workingset_report.c:551:3: error: call to undeclared function 'cgroup_file_notify'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     551 |                 cgroup_file_notify(wsr->page_age_cgroup_file);
         |                 ^
   3 warnings and 2 errors generated.


vim +45 mm/workingset_report.c

    36	
    37	void wsr_init_lruvec(struct lruvec *lruvec)
    38	{
    39		struct wsr_state *wsr = &lruvec->wsr;
    40		struct mem_cgroup *memcg = lruvec_memcg(lruvec);
    41	
    42		memset(wsr, 0, sizeof(*wsr));
    43		mutex_init(&wsr->page_age_lock);
    44		if (memcg && !mem_cgroup_is_root(memcg))
  > 45			wsr->page_age_cgroup_file = &memcg->workingset_page_age_file;
    46	}
    47	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
