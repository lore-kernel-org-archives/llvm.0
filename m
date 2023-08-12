Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C709815B6;
	Sat, 12 Aug 2023 04:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691812810; x=1723348810;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JkMG50pE8OH7UJwk9rx7X9CDjNfIBKnNTUS/TOOtUr8=;
  b=LVAi8zAfxKcjWFOrXY3iDDJ6CHUuvUT411i2Y6s9iegxK5as+yFPioIu
   Dc7jH3FvYOQfKoZEeZ6IGhuDlFO6DAoYQwAPAtKjnxoBIzcYrNXQOfXQ9
   Pg3LErHA4ZqHwii/Onat8k/wz6uQufDtfpWOsx1dFBP7rJmzPvnlU6eKd
   Mp30H4MAhsuPueBTBWl5QlvmRR03wPUIxGqquordEY4IDhzOPEVjZ0m5Z
   15f7pEJWoiULE7USc2mQFqqdMEosngPzwSiSZCn5AxxjMI+EU7S5e16kA
   sggZRrKQ4veeLcP9NPE+jUO3DYIcoARUYl/jMg+SUFweUORkv/4NBtaf7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="370702265"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="370702265"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 21:00:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="732862123"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="732862123"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 11 Aug 2023 21:00:01 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUfnF-0008FI-0x;
	Sat, 12 Aug 2023 04:00:01 +0000
Date: Sat, 12 Aug 2023 11:59:55 +0800
From: kernel test robot <lkp@intel.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
	Nick Desaulniers <ndesaulniers@google.com>
Subject: arch/powerpc/kernel/time.c:169:29: error: unused function
 'read_spurr'
Message-ID: <202308121120.u2d3YPVt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Nathan,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   190bf7b14b0cf3df19c059061be032bd8994a597
commit: 015d98149b326e0f1f02e44413112ca8b4330543 powerpc/barrier: Avoid collision with clang's __lwsync macro
date:   2 years, 2 months ago
config: powerpc-randconfig-r011-20230812 (https://download.01.org/0day-ci/archive/20230812/202308121120.u2d3YPVt-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308121120.u2d3YPVt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308121120.u2d3YPVt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/powerpc/kernel/time.c:169:29: error: unused function 'read_spurr' [-Werror,-Wunused-function]
     169 | static inline unsigned long read_spurr(unsigned long tb)
         |                             ^
   1 error generated.
--
>> arch/powerpc/sysdev/grackle.c:26:20: error: unused function 'grackle_set_stg' [-Werror,-Wunused-function]
      26 | static inline void grackle_set_stg(struct pci_controller* bp, int enable)
         |                    ^
   1 error generated.


vim +/read_spurr +169 arch/powerpc/kernel/time.c

c6622f63db86fc Paul Mackerras   2006-02-24  164  
c6622f63db86fc Paul Mackerras   2006-02-24  165  /*
cf9efce0ce3136 Paul Mackerras   2010-08-26  166   * Read the SPURR on systems that have it, otherwise the PURR,
cf9efce0ce3136 Paul Mackerras   2010-08-26  167   * or if that doesn't exist return the timebase value passed in.
c6622f63db86fc Paul Mackerras   2006-02-24  168   */
abcff86df2d2ec Christophe Leroy 2018-08-02 @169  static inline unsigned long read_spurr(unsigned long tb)
c6622f63db86fc Paul Mackerras   2006-02-24  170  {
cf9efce0ce3136 Paul Mackerras   2010-08-26  171  	if (cpu_has_feature(CPU_FTR_SPURR))
cf9efce0ce3136 Paul Mackerras   2010-08-26  172  		return mfspr(SPRN_SPURR);
c6622f63db86fc Paul Mackerras   2006-02-24  173  	if (cpu_has_feature(CPU_FTR_PURR))
c6622f63db86fc Paul Mackerras   2006-02-24  174  		return mfspr(SPRN_PURR);
cf9efce0ce3136 Paul Mackerras   2010-08-26  175  	return tb;
c6622f63db86fc Paul Mackerras   2006-02-24  176  }
c6622f63db86fc Paul Mackerras   2006-02-24  177  

:::::: The code at line 169 was first introduced by commit
:::::: abcff86df2d2ec0a0ca9470fa5d2a184af18928a powerpc/time: Only set CONFIG_ARCH_HAS_SCALED_CPUTIME on PPC64

:::::: TO: Christophe Leroy <christophe.leroy@c-s.fr>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
