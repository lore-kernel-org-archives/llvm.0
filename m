Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD50A567C;
	Fri, 29 Dec 2023 03:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O3DujJQa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703820329; x=1735356329;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GI0BYWNxggUK+/8olzYfOrKAOiCpg0a33yjnkKk3bOs=;
  b=O3DujJQaB7ErIhGEK9lAPobzmvZzAlGTLllC8/WXv5RrvxwojkrsDdwu
   V4NbVeJISaTTQD3+ie0vAdPxOiIvaW8RTcFNUAVOHQn/pemsYqzNAcYPJ
   29sEbRjh71Q9BvBOPkBFevei0FEA9SAvtBcAIdOi8FxYG6YKuW/kqKT9N
   YosthFIqbMTvw/TcfHJLzfw6lU+8/dFsOuB7A2SjisusNMCcHvpog9Mqr
   L9aYV2uwSj9fy8VgqufEiVMBC+fq5IlzJEMPrwsnSdDu8CMzu5Wu5MTlu
   1JQfr1V/rYVr7y+o0sDBk+6VOxQYo2u5Qq5nqrylXFRcGYzK0513ENTDF
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10937"; a="463028804"
X-IronPort-AV: E=Sophos;i="6.04,313,1695711600"; 
   d="scan'208";a="463028804"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2023 19:25:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,313,1695711600"; 
   d="scan'208";a="13178180"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 28 Dec 2023 19:25:23 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rJ3TK-000H3V-2U;
	Fri, 29 Dec 2023 03:24:13 +0000
Date: Fri, 29 Dec 2023 11:21:24 +0800
From: kernel test robot <lkp@intel.com>
To: Sagi Maimon <maimon.sagi@gmail.com>, richardcochran@gmail.com,
	luto@kernel.org, datglx@linutronix.de, mingo@redhat.com,
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
	hpa@zytor.com, arnd@arndb.de, geert@linux-m68k.org,
	peterz@infradead.org, hannes@cmpxchg.org, sohil.mehta@intel.com,
	rick.p.edgecombe@intel.com, nphamcs@gmail.com, palmer@sifive.com,
	keescook@chromium.org, legion@kernel.org, mark.rutland@arm.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-api@vger.kernel.org,
	linux-arch@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v3] posix-timers: add multi_clock_gettime system call
Message-ID: <202312291148.zfhZ9vDJ-lkp@intel.com>
References: <20231228122411.3189-1-maimon.sagi@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231228122411.3189-1-maimon.sagi@gmail.com>

Hi Sagi,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/x86/asm]
[also build test ERROR on arnd-asm-generic/master tip/timers/core linus/master v6.7-rc7]
[cannot apply to next-20231222]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sagi-Maimon/posix-timers-add-multi_clock_gettime-system-call/20231228-202632
base:   tip/x86/asm
patch link:    https://lore.kernel.org/r/20231228122411.3189-1-maimon.sagi%40gmail.com
patch subject: [PATCH v3] posix-timers: add multi_clock_gettime system call
config: x86_64-buildonly-randconfig-002-20231229 (https://download.01.org/0day-ci/archive/20231229/202312291148.zfhZ9vDJ-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231229/202312291148.zfhZ9vDJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312291148.zfhZ9vDJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/linux/multi_clock.h:14:2: error: unknown type name 'clockid_t'
      14 |         clockid_t clkid_arr[MULTI_PTP_MAX_CLOCKS]; /* list of clock IDs */
         |         ^
   1 error generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
