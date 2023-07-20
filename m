Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23191BE83;
	Thu, 20 Jul 2023 20:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689885026; x=1721421026;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vfGuscGEOBWYJUQLL9IYExuvoGe957aALRw/Yk6UOXc=;
  b=CnSHdBFtxq3n5fS8+GbvsvfSLt305uv936TpQY3+7HYJhNe/ShAEFmxL
   fMyRK+fpnoCq1/8O9vn3RlyjBl0fn7GfQnoXQzjs1oyaIfK5gAL1zEp11
   T8m1eXIRRhh1FMzwjcFUtYp7hoyWU/EKK9McADJG3yriTuNAeT0fjZfPy
   UNKrYd9jEfTT5QJ5c2nK6OF2sJivyGHTP3QK/+0WOWOr6DrgVY7WEZSql
   kbtuOfVlfJxgs7kGUJ56qtmh5fEU1iMnkG4Ig/f5CUr0r7CUUtn/D0LQl
   GV54XZuLCHKcKn0tN7LjXLoMCZxTzu3ExIn5Eje+mHxQKaq5R/OMyNwBX
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="356841627"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; 
   d="scan'208";a="356841627"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 13:30:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="789958419"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; 
   d="scan'208";a="789958419"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 20 Jul 2023 13:30:24 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMaI3-0006Tt-3C;
	Thu, 20 Jul 2023 20:30:23 +0000
Date: Fri, 21 Jul 2023 04:30:14 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/missed_stats_3 1/7] kernel/bpf/trampoline.c:824:14:
 error: use of undeclared identifier 'BPF_PROG_NO_START_TIME'
Message-ID: <202307210424.2vkHfKo4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/missed_stats_3
head:   d40e4165c066c7a131012bf1d87f27517c79e3f1
commit: 3d25b22ba2534fedca5325362b88adab8ac6c651 [1/7] bpf: Move update_prog_stats to syscall object
config: arm-randconfig-r033-20230720 (https://download.01.org/0day-ci/archive/20230721/202307210424.2vkHfKo4-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230721/202307210424.2vkHfKo4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307210424.2vkHfKo4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/bpf/trampoline.c:824:14: error: use of undeclared identifier 'BPF_PROG_NO_START_TIME'
     824 |         u64 start = BPF_PROG_NO_START_TIME;
         |                     ^
   kernel/bpf/trampoline.c:829:12: error: use of undeclared identifier 'BPF_PROG_NO_START_TIME'
     829 |                         start = BPF_PROG_NO_START_TIME;
         |                                 ^
   kernel/bpf/trampoline.c:886:9: error: use of undeclared identifier 'BPF_PROG_NO_START_TIME'
     886 |         return BPF_PROG_NO_START_TIME;
         |                ^
   3 errors generated.


vim +/BPF_PROG_NO_START_TIME +824 kernel/bpf/trampoline.c

   821	
   822	static __always_inline u64 notrace bpf_prog_start_time(void)
   823	{
 > 824		u64 start = BPF_PROG_NO_START_TIME;
   825	
   826		if (static_branch_unlikely(&bpf_stats_enabled_key)) {
   827			start = sched_clock();
   828			if (unlikely(!start))
   829				start = BPF_PROG_NO_START_TIME;
   830		}
   831		return start;
   832	}
   833	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
