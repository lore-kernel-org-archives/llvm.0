Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E875364A;
	Sun, 17 Nov 2024 03:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731815329; cv=none; b=fNJzKebZXCTYcr3XgopKvBfONTc1csfiPQXJCElXZPOgk2GBZATFWnv+hKOP6ICVe6LI6Jex8D0SwxYtadqFTul+maTrCa3VS6c/jpUB6lmXuhLQ2Jz3lZxmGUaK53pchPLlb7TJrQ2xKgeC8r+DKZoFhDBdhY/kAmiDVrGyEJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731815329; c=relaxed/simple;
	bh=SU4ZxkobQzJFaYo6lLfeiNErr6NI3r+NOqva1u4xrZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S3q1UC6Ti048qwyEfDvyiMAUqpQVvCJTnhUhTtcDSKY8eKdIdBz1F0QGEzlUd/yjjbSBSTISf3F+FhBISCkYQ1N2EbIZaIw54y2RfrYbXAUsUZZJi/2Zxy2wA9SOtDNTXH/sOgEccmKk76CwvP507dn2u+Oqk1EdQ88OYTG07T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a/9rmHZf; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a/9rmHZf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731815328; x=1763351328;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SU4ZxkobQzJFaYo6lLfeiNErr6NI3r+NOqva1u4xrZ8=;
  b=a/9rmHZfu13FNsS2W7WE6zGS8yVg/VxmlWQQ+K9uOGNr4yLsKEd7mJEy
   nYzrBC752v/pkYnaxzIBvedKcvXALoyQjKGtsLh8yImKXiW3mwcaBWNBm
   d3FdDb6xuGTFlZSUHJpbdnHTyHSrbA2TsnSi6prsa7IE711YnQndRj41g
   m3TmVo7mz8TUI6a88Bj+0tQYtDOX20hlw9kboHLAhqo0PxbPUd+txI18z
   h8HMxx0m95XdD/Fq5WmTyM3qLmtaM13enCgXGjOROFd5vKTBPWQ2P239v
   YRQrJr4uygxwNwAtBb8204wajZkrlWyck1/8RpBfcDSXoY7sQr2kFRlAv
   Q==;
X-CSE-ConnectionGUID: o7TbTlZTSz6nyjYLEiIA0Q==
X-CSE-MsgGUID: tnsy2SVmSGSztK8nc4dH6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="35466403"
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; 
   d="scan'208";a="35466403"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 19:48:48 -0800
X-CSE-ConnectionGUID: VuS+mxuWT86DTBpM0pcc2A==
X-CSE-MsgGUID: h2jnVQGwSji8O1nIwLxjMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; 
   d="scan'208";a="88906967"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 16 Nov 2024 19:48:44 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCWHB-0001N7-2n;
	Sun, 17 Nov 2024 03:48:41 +0000
Date: Sun, 17 Nov 2024 11:48:06 +0800
From: kernel test robot <lkp@intel.com>
To: Kajol Jain <kjain@linux.ibm.com>, mpe@ellerman.id.au,
	maddy@linux.ibm.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com,
	disgoel@linux.ibm.com, hbathini@linux.ibm.com, adubey@linux.ibm.com,
	gautam@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] powerpc/perf: Add perf interface to expose vpa
 counters
Message-ID: <202411171117.Eq9JtACb-lkp@intel.com>
References: <20241114084013.1140010-1-kjain@linux.ibm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241114084013.1140010-1-kjain@linux.ibm.com>

Hi Kajol,

kernel test robot noticed the following build warnings:

[auto build test WARNING on powerpc/topic/ppc-kvm]
[also build test WARNING on powerpc/next powerpc/fixes linus/master v6.12-rc7 next-20241115]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kajol-Jain/docs-ABI-sysfs-bus-event_source-devices-vpa-pmu-Document-sysfs-event-format-entries-for-vpa_pmu/20241114-164451
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git topic/ppc-kvm
patch link:    https://lore.kernel.org/r/20241114084013.1140010-1-kjain%40linux.ibm.com
patch subject: [PATCH 1/4] powerpc/perf: Add perf interface to expose vpa counters
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20241117/202411171117.Eq9JtACb-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411171117.Eq9JtACb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411171117.Eq9JtACb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/powerpc/perf/vpa-pmu.c:10:
   In file included from include/linux/perf_event.h:50:
   In file included from include/linux/pid_namespace.h:7:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> arch/powerpc/perf/vpa-pmu.c:87:32: warning: overlapping comparisons always evaluate to false [-Wtautological-overlap-compare]
      87 |         if ((event->attr.config <= 0) && (event->attr.config > 3))
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   5 warnings generated.


vim +87 arch/powerpc/perf/vpa-pmu.c

    72	
    73	static int vpa_pmu_event_init(struct perf_event *event)
    74	{
    75		if (event->attr.type != event->pmu->type)
    76			return -ENOENT;
    77	
    78		/* it does not support event sampling mode */
    79		if (is_sampling_event(event))
    80			return -EOPNOTSUPP;
    81	
    82		/* no branch sampling */
    83		if (has_branch_stack(event))
    84			return -EOPNOTSUPP;
    85	
    86		/* Invalid event code */
  > 87		if ((event->attr.config <= 0) && (event->attr.config > 3))
    88			return -EINVAL;
    89	
    90		return 0;
    91	}
    92	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
