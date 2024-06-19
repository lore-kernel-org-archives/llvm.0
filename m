Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D8C4A1C;
	Wed, 19 Jun 2024 02:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718763102; cv=none; b=iucuHXr4vnc1nEIin0k6+485JJFaKy/zEOW6XygcqLx2QFDPPfoKjmWeXE9fyW2YkEZeyI6jVmgm10x3biFkO696BbXdlbFtahoPdlqYY8Ibl11SW6g8fwDbXpPAwCQlcImZSJmWSvy/asW0sSZoBZeLE14IVJOFfMxqq1mNgeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718763102; c=relaxed/simple;
	bh=jeC3zeUXmoAM9l5BNxtHvj3YFAe2Ecs7+HX1iXQgGkc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n1oacZXEOpFO7y318zPXEUBHhgJxJe1LesdSRWMkE2d/zAozZpCld2fobWQx03b67CHPKNsZwpxyww9WHvhx0FR0XfJn9e68dF18LiYHMPDCrfbwW4lJVOgTwWXeIluyJBJAsu7CmaLWRiqQb+t/MLUzmOUiH4wYtm4NSCSR1Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kcXhSDpz; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kcXhSDpz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718763100; x=1750299100;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jeC3zeUXmoAM9l5BNxtHvj3YFAe2Ecs7+HX1iXQgGkc=;
  b=kcXhSDpz8IbYwDVDw/Efqb9WRgDW8/Xn3Z+Z1rxf8tkUWKIsNGvKYdOv
   3xqdAwg9rdFJNPzUgiqju6TR+0yZvnzwebvklI7ldSwSDPWtHMURo26/S
   C9f9NJJmDG61ktzYnaDRYZjdBzvu7lV7EuMTVxEZpdPogjsLMVhXZYLFD
   sZ3jbX/uVnzJI+89q/W1U+eQXujShivySgChDWFTnWll33d9HeQHaiiA+
   7TP54+0si8X7QdOJaDEvhyDda2nDxlzwoqqOhQeH8Nf7kN75kkiQRZ0Jc
   sTvVAG3QUK1y6nwVTvaymtP4evaK2uiKAup+tmgflg9LYOvg26QD2duIW
   g==;
X-CSE-ConnectionGUID: unM1ay7NQ6eCUpvvV/YuJg==
X-CSE-MsgGUID: N2TpArrTSTOcCV+3YRGiUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="15393001"
X-IronPort-AV: E=Sophos;i="6.08,249,1712646000"; 
   d="scan'208";a="15393001"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2024 19:11:37 -0700
X-CSE-ConnectionGUID: Vzpvm+srTX+pCrVPI/VhCA==
X-CSE-MsgGUID: 6glwHYJITfqxgO51AeiHKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,249,1712646000"; 
   d="scan'208";a="46881720"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 18 Jun 2024 19:11:36 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJknO-0006AA-00;
	Wed, 19 Jun 2024 02:11:34 +0000
Date: Wed, 19 Jun 2024 10:10:46 +0800
From: kernel test robot <lkp@intel.com>
To: Xiu Jianfeng <xiujianfeng@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 -next] mm/hugetlb_cgroup: register lockdep key for
 cftype
Message-ID: <202406191003.yPG3tSzS-lkp@intel.com>
References: <20240618071922.2127289-1-xiujianfeng@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240618071922.2127289-1-xiujianfeng@huawei.com>

Hi Xiu,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Xiu-Jianfeng/mm-hugetlb_cgroup-register-lockdep-key-for-cftype/20240618-152930
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20240618071922.2127289-1-xiujianfeng%40huawei.com
patch subject: [PATCH v2 -next] mm/hugetlb_cgroup: register lockdep key for cftype
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240619/202406191003.yPG3tSzS-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 78ee473784e5ef6f0b19ce4cb111fb6e4d23c6b2)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240619/202406191003.yPG3tSzS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406191003.yPG3tSzS-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/hugetlb_cgroup.c:20:
   In file included from include/linux/cgroup.h:25:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:21:
   In file included from arch/riscv/include/asm/sections.h:9:
   In file included from include/linux/mm.h:2229:
   include/linux/vmstat.h:498:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     498 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> mm/hugetlb_cgroup.c:840:30: error: no member named 'lockdep_key' in 'struct cftype'
     840 |                 lockdep_register_key(&cft->lockdep_key);
         |                                       ~~~  ^
   1 warning and 1 error generated.


vim +840 mm/hugetlb_cgroup.c

   815	
   816	static void __init
   817	hugetlb_cgroup_cfttypes_init(struct hstate *h, struct cftype *cft,
   818				     struct cftype *tmpl, int tmpl_size)
   819	{
   820		char buf[32];
   821		int i, idx = hstate_index(h);
   822	
   823		/* format the size */
   824		mem_fmt(buf, sizeof(buf), huge_page_size(h));
   825	
   826		for (i = 0; i < tmpl_size; cft++, tmpl++, i++) {
   827			*cft = *tmpl;
   828			/* rebuild the name */
   829			snprintf(cft->name, MAX_CFTYPE_NAME, "%s.%s", buf, tmpl->name);
   830			/* rebuild the private */
   831			cft->private = MEMFILE_PRIVATE(idx, tmpl->private);
   832			/* rebuild the file_offset */
   833			if (tmpl->file_offset) {
   834				unsigned int offset = tmpl->file_offset;
   835	
   836				cft->file_offset = MEMFILE_OFFSET0(offset) +
   837						   MEMFILE_FIELD_SIZE(offset) * idx;
   838			}
   839	
 > 840			lockdep_register_key(&cft->lockdep_key);
   841		}
   842	}
   843	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
