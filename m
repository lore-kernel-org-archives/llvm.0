Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD261D6194;
	Thu, 23 Oct 2025 01:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761183602; cv=none; b=QxV6zTLL0d8wsRSj2scXyJcHTCUaCoOXzsU6E36kQbswhhEF3VfCyWjpLDeOeIaNUTDZpYqJ5XP5fYMN6RcomgX10Lj3wbWcrFXOxezlBptpa3j0mUG7lRQozSWr3dfBmQrVX1llAz71ntUiRckL4BsisHMN6gq0tLT9H9QMU3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761183602; c=relaxed/simple;
	bh=oZkGvsa5fOiEdUhyhVdjRJC8Ui90zAcPhXfTsGvKsJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VpZ6dq0tweZfYjCF8t8bwT9+34CVOLOfdk/UnFH75QomjxdWk6sXUrbcBnJSwKfFm1TfIe7CX8F7YwRbrcaiL4AVHP3W49kkt05l0uRNwfWQpdk8uuNh0R30Hs39cTM4qElAzYOYDYZfIvr2B+i5C4FKrUVZna9aC1mPlt1Ce0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ECvSQhbX; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ECvSQhbX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761183601; x=1792719601;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oZkGvsa5fOiEdUhyhVdjRJC8Ui90zAcPhXfTsGvKsJY=;
  b=ECvSQhbXKWMN4KXavtw3W1Eo/6RYU8187+HZg8NFc6f+UniQPZx7WCU/
   fWm1PTcjnTSzw7tlbsWM1Y8uqjNji53pBesF3/IHgtdi/WetYkmVm6ruL
   vfQw51Dx2EpRKHEzGR2NfX7cTgXbH86a8lh94vV6Gp7vew8eWcS0iRYAN
   y/VxlBqMxXaSwt8bnkZLFPdvFZp7cpCkxFoowmkfg/valqsV1W03Fer+l
   S+P2Wrc757pfnqfaNK2TLMvtX1+xaQk8WMqfB2mFk/NXYiUMgLHf6+k+B
   5cljHJV8R+04afPjuJFpb3+NWPPL82EVGriqD6cTkpqC0weUPZgRMO3ZT
   g==;
X-CSE-ConnectionGUID: iK+5Pyg7SY2i7wjaqBmsJw==
X-CSE-MsgGUID: TjuYnN5nTkuiJpFY0wqGsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63382739"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="63382739"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 18:40:00 -0700
X-CSE-ConnectionGUID: 9BYK8rGERRifXgAcMX3gSQ==
X-CSE-MsgGUID: XNMn9wNMQnS5RFWw3f8RJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="183725148"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 22 Oct 2025 18:39:57 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBkJ1-000Ctf-14;
	Thu, 23 Oct 2025 01:39:55 +0000
Date: Thu, 23 Oct 2025 09:39:24 +0800
From: kernel test robot <lkp@intel.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Sourabh Jain <sourabhjain@linux.ibm.com>,
	Baoquan he <bhe@redhat.com>, Jiri Bohac <jbohac@suse.cz>,
	Hari Bathini <hbathini@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mahesh Salgaonkar <mahesh@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shivang Upadhyay <shivangu@linux.ibm.com>
Subject: Re: [PATCH] powerpc/kdump: Add support for crashkernel CMA
 reservation
Message-ID: <202510230923.E37rbvtF-lkp@intel.com>
References: <20251022102531.657147-1-sourabhjain@linux.ibm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022102531.657147-1-sourabhjain@linux.ibm.com>

Hi Sourabh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on powerpc/next]
[also build test WARNING on powerpc/fixes linus/master v6.18-rc2 next-20251022]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sourabh-Jain/powerpc-kdump-Add-support-for-crashkernel-CMA-reservation/20251022-182711
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20251022102531.657147-1-sourabhjain%40linux.ibm.com
patch subject: [PATCH] powerpc/kdump: Add support for crashkernel CMA reservation
config: powerpc-randconfig-002-20251023 (https://download.01.org/0day-ci/archive/20251023/202510230923.E37rbvtF-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 754ebc6ebb9fb9fbee7aef33478c74ea74949853)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251023/202510230923.E37rbvtF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510230923.E37rbvtF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/powerpc/kexec/core.c:37:27: warning: unused variable 'cma_size' [-Wunused-variable]
      37 | static unsigned long long cma_size;
         |                           ^~~~~~~~
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HOTPLUG_CPU
   Depends on [n]: SMP [=y] && (PPC_PSERIES [=n] || PPC_PMAC [=n] || PPC_POWERNV [=n] || FSL_SOC_BOOKE [=n])
   Selected by [y]:
   - PM_SLEEP_SMP [=y] && SMP [=y] && (ARCH_SUSPEND_POSSIBLE [=y] || ARCH_HIBERNATION_POSSIBLE [=y]) && PM_SLEEP [=y]


vim +/cma_size +37 arch/powerpc/kexec/core.c

    35	
    36	
  > 37	static unsigned long long cma_size;
    38	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
