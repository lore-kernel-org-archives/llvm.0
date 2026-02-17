Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25211280A29;
	Tue, 17 Feb 2026 15:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771342077; cv=none; b=Ihxet+uG46gJU0tz4ZU/PYpqgRgYWR5magP8s+qt+LKNsQvS4Fz1U7bmmxp8CcESF1ESXpYu9HhjwzOILwsArQhXekQKWz3us07kiVoPVPBu5/MdVVl+mqzqM2ityLAQH3Qti1U+rtJMMM4nuKh7jXWgAlxNTI7Yqw+c6KjnJ5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771342077; c=relaxed/simple;
	bh=camCf+hMhDCMoC/dJnwKFdEJluxi3duXst4BvOZyGNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n1lDBs4IKgDyxKDm21W0guU9Cjds2L8RDc4o5Yu8MmklKoWUOE3cO8rsV90Uvj9dbTcTZWwhNLn8A00OTbEM5B5pEft1l7f9h0CN3hoFtJ6BIsVumvaVsg7cOlT1KQ/70gTO9f2VX7NaKYa/eoImBCYZ9wOYs6XOHuK6MLyKCfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fGpSXoaz; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fGpSXoaz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771342075; x=1802878075;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=camCf+hMhDCMoC/dJnwKFdEJluxi3duXst4BvOZyGNk=;
  b=fGpSXoazXqWC3rDbu7VBl5RPLO8YLoc7kUGdWTrPDFBgljfpmzaBg5kX
   ME6pJ5fF1NUfOtfqkUrULhypxKNUypY+RcS9NgzoW7tq4k0O2AAuguU9c
   5+ASKnhcHWy0CeX1ijijtVHo7emm5h9GCN/o+VN4BQREuri2rJg9UxWpN
   OS07oDsYWjosZNUpVhOz1q/7KuUWjdTR0tp8/VyaGxG9XnaGvZUgynBIW
   PAQNfqeYs17RKbPCUg7nIK5o56+4/3pb/FNEsD6y0RcpAC1ZBBdFMKPkZ
   fkOexs+v9wKwCdw7f5553pE4rv/aAuY5TgRBVD6KM1bBdnwvU9gpItKpm
   w==;
X-CSE-ConnectionGUID: zcrh10UqSFaxMTzUPQwCHg==
X-CSE-MsgGUID: LnNOaX3ORSebCxVCaxtH8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="72125693"
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; 
   d="scan'208";a="72125693"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 07:27:54 -0800
X-CSE-ConnectionGUID: 0xAn4PJMRCqyOVKaDo5Keg==
X-CSE-MsgGUID: iDkey0zJTbC4GUUgB5IS0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; 
   d="scan'208";a="218043448"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 17 Feb 2026 07:27:50 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsMzL-0000000115k-15b4;
	Tue, 17 Feb 2026 15:27:47 +0000
Date: Tue, 17 Feb 2026 23:27:04 +0800
From: kernel test robot <lkp@intel.com>
To: Youngjun Park <youngjun.park@lge.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>,
	Barry Song <baohua@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	gunho.lee@lge.com, taejoon.song@lge.com, austin.kim@lge.com,
	youngjun.park@lge.com
Subject: Re: [PATCH v4 1/4] mm: swap: introduce swap tier infrastructure
Message-ID: <202602172319.SHQ7btgd-lkp@intel.com>
References: <20260217000950.4015880-2-youngjun.park@lge.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260217000950.4015880-2-youngjun.park@lge.com>

Hi Youngjun,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 776250964cbaa49ebe6b8bb2870765cc89cece59]

url:    https://github.com/intel-lab-lkp/linux/commits/Youngjun-Park/mm-swap-introduce-swap-tier-infrastructure/20260217-121406
base:   776250964cbaa49ebe6b8bb2870765cc89cece59
patch link:    https://lore.kernel.org/r/20260217000950.4015880-2-youngjun.park%40lge.com
patch subject: [PATCH v4 1/4] mm: swap: introduce swap tier infrastructure
config: hexagon-randconfig-002-20260217 (https://download.01.org/0day-ci/archive/20260217/202602172319.SHQ7btgd-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e86750b29fa0ff207cd43213d66dabe565417638)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260217/202602172319.SHQ7btgd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602172319.SHQ7btgd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/swap_tier.c:118:10: warning: format specifies type 'long' but the argument has type '__ptrdiff_t' (aka 'int') [-Wformat]
     116 |                 len += sysfs_emit_at(buf, len, "%-16s %-5ld %-11d %-11d\n",
         |                                                       ~~~~~
         |                                                       %-5td
     117 |                                      tier->name,
     118 |                                      TIER_IDX(tier),
         |                                      ^~~~~~~~~~~~~~
   mm/swap_tier.c:33:24: note: expanded from macro 'TIER_IDX'
      33 | #define TIER_IDX(tier)  ((tier) - swap_tiers)
         |                         ^~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +118 mm/swap_tier.c

   105	
   106	ssize_t swap_tiers_sysfs_show(char *buf)
   107	{
   108		struct swap_tier *tier;
   109		ssize_t len = 0;
   110	
   111		len += sysfs_emit_at(buf, len, "%-16s %-5s %-11s %-11s\n",
   112				 "Name", "Idx", "PrioStart", "PrioEnd");
   113	
   114		spin_lock(&swap_tier_lock);
   115		for_each_active_tier(tier) {
   116			len += sysfs_emit_at(buf, len, "%-16s %-5ld %-11d %-11d\n",
   117					     tier->name,
 > 118					     TIER_IDX(tier),
   119					     tier->prio,
   120					     TIER_END_PRIO(tier));
   121		}
   122		spin_unlock(&swap_tier_lock);
   123	
   124		return len;
   125	}
   126	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
