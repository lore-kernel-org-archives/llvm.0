Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A65A28750C;
	Sun,  7 Dec 2025 10:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765102661; cv=none; b=khr7SpqRbD9fAhdZ7n8WLG5WLKC+uj/JAaQ0VyHSDLMUyubHfpaqSd4YjX9j1PzHXyfaCTHKBmkzP+qXpBP1kurdDzzq1WRVKp2xju3GrMD2iC89k0VWdDUSqOJigSaJ7Et00NUofs/Omw5wwxOs7SnGM/aeQ9s9DBHaeCHGjNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765102661; c=relaxed/simple;
	bh=4OTCbyhf1L0NfU0vkTZn3R2TLNYI5fcz4Hk48AVEa4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kJO20NFG4R6azwbo21RbIIZXakG61a8IB1pAOW9QB4ZfOlbdQHewsOMStZIwzbRpHA83r/4llEwVPtaC/Qmw8D+Nq2DH+h4M65EHMEHEKBSfNGMaxPiOHKZ8E/ictqCh/lG9amizhrF+nU0IMk4eaKMTLEWoIbemY1Fv+bFR1hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=doUBI7UA; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="doUBI7UA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765102660; x=1796638660;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4OTCbyhf1L0NfU0vkTZn3R2TLNYI5fcz4Hk48AVEa4E=;
  b=doUBI7UALq3aZOJjKTJ8gosq3Sf8+OEk2bHiCIRznaCPvZZWZ0xYxJ36
   vcVTOec6LuQOgJgXNcTE+xpYhoD4NGaixaxGTjWq+RD4YRW7xl+OSLoeM
   6a8tsNbb/SED0lUxJNrdssybIlkSbkX6AMCy+qbQeN7nhSJghYKiLvxto
   EKLbC0B4HIznFCnIbGoNpgD4NgCqLanhEnLgxi/cI5fWmZDxuYn1UueRF
   FBgKlKjsEd88sSYU4fr/g4fI8aVf6cfCy1x8to7VIsCcBPL2n0RRKJL51
   GegMwSuFxOaI886NqQ1vAeJt6ME9H0VyzncOHQY1bkhZG4JEiYCa+LWDs
   w==;
X-CSE-ConnectionGUID: Vy+R2nDbRiy3jpflsXCG9A==
X-CSE-MsgGUID: oJRoIYcZQ/SaOfYGtmbwog==
X-IronPort-AV: E=McAfee;i="6800,10657,11634"; a="67109548"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="67109548"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2025 02:17:39 -0800
X-CSE-ConnectionGUID: 3NrRWvoXSoeo1ZFpbg7u6w==
X-CSE-MsgGUID: bPLbiwQdRHiVnvJBbk6kVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="226345264"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 07 Dec 2025 02:17:37 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSBpe-00000000JBd-01z4;
	Sun, 07 Dec 2025 10:17:34 +0000
Date: Sun, 7 Dec 2025 18:16:37 +0800
From: kernel test robot <lkp@intel.com>
To: Swaraj Gaikwad <swarajgaikwad1925@gmail.com>,
	David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
	Swaraj Gaikwad <swarajgaikwad1925@gmail.com>
Subject: Re: [PATCH] mm/memory_hotplug: Cache auto_movable stats to optimize
 online check
Message-ID: <202512071758.SKaL9BlQ-lkp@intel.com>
References: <20251206212507.135503-1-swarajgaikwad1925@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251206212507.135503-1-swarajgaikwad1925@gmail.com>

Hi Swaraj,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 3cfeff1d2304237b1c14628d695a6df44daff48f]

url:    https://github.com/intel-lab-lkp/linux/commits/Swaraj-Gaikwad/mm-memory_hotplug-Cache-auto_movable-stats-to-optimize-online-check/20251206-235737
base:   3cfeff1d2304237b1c14628d695a6df44daff48f
patch link:    https://lore.kernel.org/r/20251206212507.135503-1-swarajgaikwad1925%40gmail.com
patch subject: [PATCH] mm/memory_hotplug: Cache auto_movable stats to optimize online check
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20251207/202512071758.SKaL9BlQ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251207/202512071758.SKaL9BlQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512071758.SKaL9BlQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/memory_hotplug.c:53:34: warning: tentative definition of variable with internal linkage has incomplete non-array type 'struct auto_movable_stats' [-Wtentative-definition-incomplete-type]
      53 | static struct auto_movable_stats global_auto_movable_stats;
         |                                  ^
   mm/memory_hotplug.c:53:15: note: forward declaration of 'struct auto_movable_stats'
      53 | static struct auto_movable_stats global_auto_movable_stats;
         |               ^
   1 warning generated.


vim +53 mm/memory_hotplug.c

    52	
  > 53	static struct auto_movable_stats global_auto_movable_stats;
    54	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
