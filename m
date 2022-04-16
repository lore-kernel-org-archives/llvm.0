Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07CA22590
	for <llvm@lists.linux.dev>; Sat, 16 Apr 2022 19:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650137659; x=1681673659;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DLw5sMk/8YLgsSma+9RI2UiByFzUvoda3xHj9azaK8A=;
  b=VzsIy2aRl3FJA3d4cLfZRSVtRKayP9Wp9dPLsn3aPSKh7Yr7XRmRMXrf
   zQ0aamvUk7hPWs3JQz5qLyYfFVlMT6SPUm0sSnJpvmhqBt7PuzQgztnRo
   dqKzYBCt/LSltRYBJl0OyVo/vXm5bRNa6h2TeN/2usSJgH2WbSPzMaW72
   4QSQiOp/KTb4YqZY2n0hl4AzqeILON8cgHiKRqupYMJs3+aampfnxxpnR
   LtXG4uO56hUCSNixnvO4Qp0RdYny7pmKpTwoZwkmbZpE4IyZk0uPjHvyS
   rfaztRQg4+1cymQ+QNpCVKEsb6xiELNpBhT+KNjziiS5KxGKyctm4VnnS
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10318"; a="263509344"
X-IronPort-AV: E=Sophos;i="5.90,266,1643702400"; 
   d="scan'208";a="263509344"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2022 12:34:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,266,1643702400"; 
   d="scan'208";a="591975633"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 16 Apr 2022 12:34:16 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nfoBU-0003Rt-5L;
	Sat, 16 Apr 2022 19:34:16 +0000
Date: Sun, 17 Apr 2022 03:33:18 +0800
From: kernel test robot <lkp@intel.com>
To: Marcelo Tosatti <mtosatti@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>
Subject: kernel/time/hrtimer.c:276:20: warning: unused function
 'is_migration_base'
Message-ID: <202204170303.xbPwzQpB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Marcelo,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   59250f8a7f3a60a2661b84cbafc1e0eb5d05ec9b
commit: 81d741d3460ca422843ce0ec8351083f259c6166 hrtimer: Avoid unnecessary SMP function calls in clock_was_set()
date:   8 months ago
config: mips-randconfig-c004-20220417 (https://download.01.org/0day-ci/archive/20220417/202204170303.xbPwzQpB-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 64c045e25b8471bbb572bd29159c294a82a86a25)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=81d741d3460ca422843ce0ec8351083f259c6166
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 81d741d3460ca422843ce0ec8351083f259c6166
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash fs/ext4/ kernel/time/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   kernel/time/hrtimer.c:120:21: warning: initializer overrides prior initialization of this subobject
   = HRTIMER_BASE_REALTIME,
   ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:118:27: note: previous initialization is here
   [0 ... MAX_CLOCKS - 1] = HRTIMER_MAX_CLOCK_BASES,
   ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:121:22: warning: initializer overrides prior initialization of this subobject
   = HRTIMER_BASE_MONOTONIC,
   ^~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:118:27: note: previous initialization is here
   [0 ... MAX_CLOCKS - 1] = HRTIMER_MAX_CLOCK_BASES,
   ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:122:21: warning: initializer overrides prior initialization of this subobject
   = HRTIMER_BASE_BOOTTIME,
   ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:118:27: note: previous initialization is here
   [0 ... MAX_CLOCKS - 1] = HRTIMER_MAX_CLOCK_BASES,
   ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:123:17: warning: initializer overrides prior initialization of this subobject
   = HRTIMER_BASE_TAI,
   ^~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:118:27: note: previous initialization is here
   [0 ... MAX_CLOCKS - 1] = HRTIMER_MAX_CLOCK_BASES,
   ^~~~~~~~~~~~~~~~~~~~~~~
>> kernel/time/hrtimer.c:276:20: warning: unused function 'is_migration_base'
   static inline bool is_migration_base(struct hrtimer_clock_base
   ^
>> kernel/time/hrtimer.c:1816:20: warning: unused function '__hrtimer_peek_ahead_timers'
   static inline void __hrtimer_peek_ahead_timers(void)
   ^
   fatal error: error in backend: Nested variants found in inline asm string: ' .set push
   .set mips64r2
   .if ( 0x00 ) != -1)) 0x00 ) != -1)) : ($( static struct ftrace_branch_data __attribute__((__aligned__(4))) __attribute__((__section__("_ftrace_branch"))) __if_trace = $( .func = __func__, .file = "arch/mips/include/asm/bitops.h", .line = 105, $); 0x00 ) != -1)) : $))) ) && ( 0 ); .set push; .set mips64r2; .rept 1; sync 0x00; .endr; .set pop; .else; ; .endif
   1: ll $0, $1
   or $0, $2
   sc $0, $1
   beqz $0, 1b
   .set pop
   '
   clang-15: error: clang frontend command failed with exit code 70 (use -v to see invocation)
   clang version 15.0.0 (git://gitmirror/llvm_project 64c045e25b8471bbb572bd29159c294a82a86a25)
   Target: mipsel-unknown-linux
   Thread model: posix
   InstalledDir: /opt/cross/clang-64c045e25b/bin
   clang-15: note: diagnostic msg:
   Makefile arch fs include kernel mm nr_bisected scripts source usr


vim +/is_migration_base +276 kernel/time/hrtimer.c

c0a3132963db68 kernel/hrtimer.c      Thomas Gleixner           2006-01-09  275  
5d2295f3a93b04 kernel/time/hrtimer.c Sebastian Andrzej Siewior 2019-09-04 @276  static inline bool is_migration_base(struct hrtimer_clock_base *base)
5d2295f3a93b04 kernel/time/hrtimer.c Sebastian Andrzej Siewior 2019-09-04  277  {
5d2295f3a93b04 kernel/time/hrtimer.c Sebastian Andrzej Siewior 2019-09-04  278  	return false;
5d2295f3a93b04 kernel/time/hrtimer.c Sebastian Andrzej Siewior 2019-09-04  279  }
5d2295f3a93b04 kernel/time/hrtimer.c Sebastian Andrzej Siewior 2019-09-04  280  

:::::: The code at line 276 was first introduced by commit
:::::: 5d2295f3a93b04986d069ebeaf5b07725f9096c1 hrtimer: Add a missing bracket and hide `migration_base' on !SMP

:::::: TO: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
