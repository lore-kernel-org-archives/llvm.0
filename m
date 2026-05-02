Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCCED226863;
	Sat,  2 May 2026 02:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777690036; cv=none; b=LCwEemynOMfdsx97dZvnXBAswqw3nvXoQMCxxp5GTojrdFQG6e9nedz9BhqI/1YU/Dk+Ym6nms5NUsQI2G1AlztL8rl02bO0GKVSa8tJ3K6ZdbBsQY7Cs8FeKRLnRC+81/GgJSQDJksGY9oKpRd7NmvnHeCtnzJ+m0IMzATGs0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777690036; c=relaxed/simple;
	bh=BEVICxriND/4ZEHjdaZWgt3YWFVaCsGLptcR9kyxMRA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fqq7kC4pv2rtceBYziPNuURtKxo+KjY0/gU0Qp9QsBlbjKnAXRdipwdYWP1v0I1jA40UPVRD5P35uLZiph4yeXsMBLcedjdIwwAI3il9cJydjs5K8Y6knMtRKzURca1sZu5p3wEZRaQQ9d3AKopL+gwzPvbiHWrlezw3wMNWAOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VdmfSk9F; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VdmfSk9F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777690035; x=1809226035;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BEVICxriND/4ZEHjdaZWgt3YWFVaCsGLptcR9kyxMRA=;
  b=VdmfSk9F2c4sSaTRyn91YMyT7xVqTmJUPAssBYqGsnzSyk1a5nIEd1qp
   vAUztELbo31CCa814o0lycuMY6zducbYirfXsNO61sIsTO5m3ExgYWIgj
   F29dxo3XV6ubmzc1+lBXVTN7CjixeIpDjcaSiw9wjCs5xkKJvneeKvS88
   B3GNmHxTr8oSb0U7/dy89+B7lHtt3ligcmiG7Sslj9i7tsUbcYPVTHhfj
   +VFravXUXbhchvqMVlkT6gYufKrmoihsO8N0MqYxlnLI0XGfHV2POlF/U
   TM/Nas0n/W9WgmGQe48oLAJMk8mkmif7KvRk7IgDzFwttT8z7v7Jl1h43
   w==;
X-CSE-ConnectionGUID: tTmJJjm/RlyjVDAwwkEiEg==
X-CSE-MsgGUID: N/WjGsTiSy+DkCHnQ9ALRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="78673067"
X-IronPort-AV: E=Sophos;i="6.23,211,1770624000"; 
   d="scan'208";a="78673067"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2026 19:47:15 -0700
X-CSE-ConnectionGUID: VgKbe9uJR/SqBJSEqxxWXQ==
X-CSE-MsgGUID: nmZvDmbLQNCH3vpAuWGAWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,211,1770624000"; 
   d="scan'208";a="234154052"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 01 May 2026 19:47:13 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJ0Nq-00000000165-3Ve1;
	Sat, 02 May 2026 02:47:10 +0000
Date: Sat, 2 May 2026 10:46:54 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/1] mm: vmscan: keep anon scanning enabled when
 swapcache folios are present
Message-ID: <202605021047.kY1JeLwn-lkp@intel.com>
References: <20260427103532.5623-2-thomas.hellstrom@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427103532.5623-2-thomas.hellstrom@linux.intel.com>

Hi Thomas,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master v7.1-rc1 next-20260430]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Hellstr-m/mm-vmscan-keep-anon-scanning-enabled-when-swapcache-folios-are-present/20260428-183540
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260427103532.5623-2-thomas.hellstrom%40linux.intel.com
patch subject: [RFC PATCH 1/1] mm: vmscan: keep anon scanning enabled when swapcache folios are present
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20260502/202605021047.kY1JeLwn-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260502/202605021047.kY1JeLwn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605021047.kY1JeLwn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/vmscan.c:365:38: error: use of undeclared identifier 'NR_SWAPCACHE'
     365 |         if (node_page_state(NODE_DATA(nid), NR_SWAPCACHE) > 0)
         |                                             ^~~~~~~~~~~~
   1 error generated.


vim +/NR_SWAPCACHE +365 mm/vmscan.c

   341	
   342	static inline bool can_reclaim_anon_pages(struct mem_cgroup *memcg,
   343						  int nid,
   344						  struct scan_control *sc)
   345	{
   346		if (memcg == NULL) {
   347			/*
   348			 * For non-memcg reclaim, is there
   349			 * space in any swap device?
   350			 */
   351			if (get_nr_swap_pages() > 0)
   352				return true;
   353		} else {
   354			/* Is the memcg below its swap limit? */
   355			if (mem_cgroup_get_nr_swap_pages(memcg) > 0)
   356				return true;
   357		}
   358	
   359		/*
   360		 * Even with no free swap slots, anon folios already in the swap cache
   361		 * carry a pre-allocated slot and can be written back and freed from RAM
   362		 * without consuming a new one.  Do not suppress anon scanning when such
   363		 * folios are present on this node.
   364		 */
 > 365		if (node_page_state(NODE_DATA(nid), NR_SWAPCACHE) > 0)
   366			return true;
   367	
   368		/*
   369		 * The page can not be swapped.
   370		 *
   371		 * Can it be reclaimed from this node via demotion?
   372		 */
   373		return can_demote(nid, sc, memcg);
   374	}
   375	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
