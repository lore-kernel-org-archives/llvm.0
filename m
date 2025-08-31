Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DE8EEDE;
	Sun, 31 Aug 2025 23:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756683893; cv=none; b=anhaeX8ykGRlQEtJIzUBosZiox/MMyGxmI1xGub3oRlFMKSA3YMfS/BCP9Z6PXbWYFzXzqi2hVlQnISjzqEOAIqmCzA+mrf0ohUQynPWGz/eqS8VAER5WdajJApE+vv/iMTK7pMLcrc0/FSb5uaH9mpMiCza4xLtAJXArQYXM/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756683893; c=relaxed/simple;
	bh=UXLiDHkaT0meCoGiGceT0OK9ByY2vye2ZhvRRbo1ZMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c8/Q/2O7BgkcODk1Y2ZQbkr1aZCICRO9cRGi80Mqa+lK0SGkQO1jfH9FWCBG3tsVvqRWiSd9Bi3OughV6llstq+EQFOOJFJqXPOdeRGnrIyNrYn19KUfOVG10WzzUjl2gjLpxNzpKVe6zl3L18IVHLqeWz8V5hh0uVcWzNbrgcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vkm2SImW; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vkm2SImW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756683891; x=1788219891;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UXLiDHkaT0meCoGiGceT0OK9ByY2vye2ZhvRRbo1ZMY=;
  b=Vkm2SImWMT/TJzjrsnXokOU0F/ySZWUloKgxUo7njWLUyPbx0z+SRHPH
   RbS1dwlAtjGHe6Z3uR2qZajTgVlstJ3zuMvUUxSDIPT3yp3/tVKGILXky
   hpwhb1GcNA9owiJ+EG5dnlvdFm2F19I92lInd7WInfNK1I8I6gJA1klQf
   bkYOx8nBUKlpp/ZVH3IzQze0fjOazan4A2EesoE3zK5ebqUN0pAEB3IxQ
   HGWHqOhikclgOOn3yDTPGMPR0rplB/yAk8hduRWgHiv7QNie9Iwbkb2P8
   F4g/ovbElnC+071WBriMvikHRt1ghhtF5NGwMEKsoo0UGN8Z0aTjPVVo4
   Q==;
X-CSE-ConnectionGUID: wBRxyLnNQKSZy6Jv8aYE7A==
X-CSE-MsgGUID: EtBSpHeLTMWILTOqnto5Gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11539"; a="69153880"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="69153880"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2025 16:44:51 -0700
X-CSE-ConnectionGUID: ceyKbt2UQfCozYp4uC63sg==
X-CSE-MsgGUID: 7657w8KNSuajTQaTsSvuvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="171620355"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 31 Aug 2025 16:44:46 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1usriW-000WPr-1b;
	Sun, 31 Aug 2025 23:44:30 +0000
Date: Mon, 1 Sep 2025 07:43:21 +0800
From: kernel test robot <lkp@intel.com>
To: Max Kellermann <max.kellermann@ionos.com>, akpm@linux-foundation.org,
	david@redhat.com, axelrasmussen@google.com, yuanchu@google.com,
	willy@infradead.org, hughd@google.com, mhocko@suse.com,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
	rppt@kernel.org, surenb@google.com, vishal.moola@gmail.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Max Kellermann <max.kellermann@ionos.com>
Subject: Re: [PATCH v2 08/12] arch, mm/util: add const to
 arch_pick_mmap_layout() parameter
Message-ID: <202509010724.bSPPSD1X-lkp@intel.com>
References: <20250831093918.2815332-9-max.kellermann@ionos.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250831093918.2815332-9-max.kellermann@ionos.com>

Hi Max,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Max-Kellermann/mm-shmem-add-const-to-lots-of-pointer-parameters/20250831-174136
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250831093918.2815332-9-max.kellermann%40ionos.com
patch subject: [PATCH v2 08/12] arch, mm/util: add const to arch_pick_mmap_layout() parameter
config: sparc64-randconfig-001-20250901 (https://download.01.org/0day-ci/archive/20250901/202509010724.bSPPSD1X-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250901/202509010724.bSPPSD1X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509010724.bSPPSD1X-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/sparc/kernel/sys_sparc_64.c:1:1: error: unknown type name 'ickj'
       1 | ickj// SPDX-License-Identifier: GPL-2.0
         | ^
   In file included from arch/sparc/kernel/sys_sparc_64.c:11:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/sparc/include/uapi/asm/signal.h:113:8: note: array 'sig' declared here
     113 |        unsigned long sig[_NSIG_WORDS];
         |        ^
   In file included from arch/sparc/kernel/sys_sparc_64.c:11:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/sparc/include/uapi/asm/signal.h:113:8: note: array 'sig' declared here
     113 |        unsigned long sig[_NSIG_WORDS];
         |        ^
   In file included from arch/sparc/kernel/sys_sparc_64.c:11:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      99 |                         set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/sparc/include/uapi/asm/signal.h:113:8: note: array 'sig' declared here
     113 |        unsigned long sig[_NSIG_WORDS];
         |        ^
   In file included from arch/sparc/kernel/sys_sparc_64.c:11:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     101 |                 return (set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/sparc/include/uapi/asm/signal.h:113:8: note: array 'sig' declared here
     113 |        unsigned long sig[_NSIG_WORDS];
         |        ^
   In file included from arch/sparc/kernel/sys_sparc_64.c:11:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/sparc/include/uapi/asm/signal.h:113:8: note: array 'sig' declared here
     113 |        unsigned long sig[_NSIG_WORDS];
         |        ^
   In file included from arch/sparc/kernel/sys_sparc_64.c:11:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   arch/sparc/include/uapi/asm/signal.h:113:8: note: array 'sig' declared here
     113 |        unsigned long sig[_NSIG_WORDS];
         |        ^
   In file included from arch/sparc/kernel/sys_sparc_64.c:11:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   arch/sparc/include/uapi/asm/signal.h:113:8: note: array 'sig' declared here
     113 |        unsigned long sig[_NSIG_WORDS];
         |        ^
   In file included from arch/sparc/kernel/sys_sparc_64.c:11:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                                          ^         ~
   arch/sparc/include/uapi/asm/signal.h:113:8: note: array 'sig' declared here
     113 |        unsigned long sig[_NSIG_WORDS];
         |        ^
   In file included from arch/sparc/kernel/sys_sparc_64.c:11:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:116:5: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     116 |                         (set1->sig[1] == set2->sig[1]) &&
         |                          ^         ~
   arch/sparc/include/uapi/asm/signal.h:113:8: note: array 'sig' declared here
     113 |        unsigned long sig[_NSIG_WORDS];
         |        ^
   In file included from arch/sparc/kernel/sys_sparc_64.c:11:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:116:21: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     116 |                         (set1->sig[1] == set2->sig[1]) &&
         |                                          ^         ~
   arch/sparc/include/uapi/asm/signal.h:113:8: note: array 'sig' declared here
     113 |        unsigned long sig[_NSIG_WORDS];
         |        ^
   In file included from arch/sparc/kernel/sys_sparc_64.c:11:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:119:11: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     119 |                 return  (set1->sig[1] == set2->sig[1]) &&
         |                          ^         ~
   arch/sparc/include/uapi/asm/signal.h:113:8: note: array 'sig' declared here
     113 |        unsigned long sig[_NSIG_WORDS];
         |        ^
   In file included from arch/sparc/kernel/sys_sparc_64.c:11:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:119:27: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     119 |                 return  (set1->sig[1] == set2->sig[1]) &&
         |                                          ^         ~
   arch/sparc/include/uapi/asm/signal.h:113:8: note: array 'sig' declared here
     113 |        unsigned long sig[_NSIG_WORDS];
         |        ^
   In file included from arch/sparc/kernel/sys_sparc_64.c:11:
   In file included from include/linux/sched/signal.h:6:


vim +/ickj +1 arch/sparc/kernel/sys_sparc_64.c

   > 1	ickj// SPDX-License-Identifier: GPL-2.0
     2	/* linux/arch/sparc64/kernel/sys_sparc.c
     3	 *
     4	 * This file contains various random system calls that
     5	 * have a non-standard calling sequence on the Linux/sparc
     6	 * platform.
     7	 */
     8	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
