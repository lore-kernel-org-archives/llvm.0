Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA7E360;
	Tue,  6 Jun 2023 04:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686026699; x=1717562699;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AVchHM9sDaDeQbcRj28fuT5sDbsVwMJgOtF0wZ1dZyI=;
  b=GVKeG9vTwKVIx3g+FMXLBwIg0nAwcl0XQJWHy5McIk/sqC/5ujGkwOLb
   g/M8BZGmeBc4mYnnsgLvJB3TTzubuDV5Nt6XCcmR5MpVRti3TZLR42fwG
   b3kK30XERX6JIx6hSIC+gSjnNpIW08Zgrtv2PeFIi071nSgd44sssVjOX
   E5o7XQToFAvSrySryeXFhOTKQHKAeRRha3WyhY0yaZw4bm0oBNoij59zr
   pyUV9RRSppLIYaB40syA0BdK1jj8EMM0xmcj5XuuXdfIo/vvS2VwKnOzM
   IOZhxkU81Jy4VkXTo3kwsuSHbpGy+boR4UeF8UKHpFnqwTFuPKFplJ3FY
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="359875927"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; 
   d="scan'208";a="359875927"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 21:44:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="798676027"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; 
   d="scan'208";a="798676027"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 05 Jun 2023 21:44:56 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6OYx-0004r5-39;
	Tue, 06 Jun 2023 04:44:55 +0000
Date: Tue, 6 Jun 2023 12:44:41 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Nathan Chancellor <natechancellor@gmail.com>,
	Matthias Kaehlcke <mka@chromium.org>,
	Sean Paul <seanpaul@chromium.org>,
	Guenter Roeck <groeck@chromium.org>
Subject: [jsarha:topic/chromeos-4.19-s0ix 6418/9999]
 kernel/time/posix-timers.c:1071:5: warning: no previous prototype for
 function 'ksys_clock_adjtime'
Message-ID: <202306061203.eboGlnYd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Masahiro,

First bad commit (maybe != root cause):

tree:   https://github.com/jsarha/linux topic/chromeos-4.19-s0ix
head:   430bdaa0a8c38697780f45a148964d71951df11f
commit: 4fae0a1dc645742f2ecd6238813b2d30d4fb31cd [6418/9999] UPSTREAM: kbuild: add some extra warning flags unconditionally
config: mips-omega2p_defconfig (https://download.01.org/0day-ci/archive/20230606/202306061203.eboGlnYd-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mipsel-linux-gnu
        # https://github.com/jsarha/linux/commit/4fae0a1dc645742f2ecd6238813b2d30d4fb31cd
        git remote add jsarha https://github.com/jsarha/linux
        git fetch --no-tags jsarha topic/chromeos-4.19-s0ix
        git checkout 4fae0a1dc645742f2ecd6238813b2d30d4fb31cd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash M=kernel/time

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306061203.eboGlnYd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/time/posix-timers.c:47:
   In file included from include/linux/syscalls.h:85:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:7:
   In file included from include/linux/trace_seq.h:5:
   include/linux/seq_buf.h:35:12: warning: assigning to 'char *' from 'unsigned char *' converts between pointers to integer types where one is of the unique plain 'char' type and the other is not [-Wpointer-sign]
      35 |         s->buffer = buf;
         |                   ^ ~~~
   In file included from kernel/time/posix-timers.c:47:
   In file included from include/linux/syscalls.h:85:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:57:
   In file included from include/linux/cgroup.h:28:
   include/linux/cgroup-defs.h:469:16: warning: field 'cgrp' with variable sized type 'struct cgroup' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
     469 |         struct cgroup cgrp;
         |                       ^
>> kernel/time/posix-timers.c:1071:5: warning: no previous prototype for function 'ksys_clock_adjtime' [-Wmissing-prototypes]
    1071 | int ksys_clock_adjtime(const clockid_t which_clock, struct timex __user * utx)
         |     ^
   kernel/time/posix-timers.c:1071:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1071 | int ksys_clock_adjtime(const clockid_t which_clock, struct timex __user * utx)
         | ^
         | static 
   3 warnings generated.
   Assembler messages:
   Fatal error: invalid -march= option: `mips32r2'
   clang: error: assembler command failed with exit code 1 (use -v to see invocation)


vim +/ksys_clock_adjtime +1071 kernel/time/posix-timers.c

^1da177e4c3f41 kernel/posix-timers.c      Linus Torvalds    2005-04-16  1070  
c2185294ad509e kernel/time/posix-timers.c Guenter Roeck     2018-09-21 @1071  int ksys_clock_adjtime(const clockid_t which_clock, struct timex __user * utx)
f1f1d5ebd10ffa kernel/posix-timers.c      Richard Cochran   2011-02-01  1072  {
d3ba5a9a345b12 kernel/time/posix-timers.c Christoph Hellwig 2017-05-26  1073  	const struct k_clock *kc = clockid_to_kclock(which_clock);
f1f1d5ebd10ffa kernel/posix-timers.c      Richard Cochran   2011-02-01  1074  	struct timex ktx;
f1f1d5ebd10ffa kernel/posix-timers.c      Richard Cochran   2011-02-01  1075  	int err;
f1f1d5ebd10ffa kernel/posix-timers.c      Richard Cochran   2011-02-01  1076  
f1f1d5ebd10ffa kernel/posix-timers.c      Richard Cochran   2011-02-01  1077  	if (!kc)
f1f1d5ebd10ffa kernel/posix-timers.c      Richard Cochran   2011-02-01  1078  		return -EINVAL;
f1f1d5ebd10ffa kernel/posix-timers.c      Richard Cochran   2011-02-01  1079  	if (!kc->clock_adj)
f1f1d5ebd10ffa kernel/posix-timers.c      Richard Cochran   2011-02-01  1080  		return -EOPNOTSUPP;
f1f1d5ebd10ffa kernel/posix-timers.c      Richard Cochran   2011-02-01  1081  
f1f1d5ebd10ffa kernel/posix-timers.c      Richard Cochran   2011-02-01  1082  	if (copy_from_user(&ktx, utx, sizeof(ktx)))
f1f1d5ebd10ffa kernel/posix-timers.c      Richard Cochran   2011-02-01  1083  		return -EFAULT;
f1f1d5ebd10ffa kernel/posix-timers.c      Richard Cochran   2011-02-01  1084  
f1f1d5ebd10ffa kernel/posix-timers.c      Richard Cochran   2011-02-01  1085  	err = kc->clock_adj(which_clock, &ktx);
f1f1d5ebd10ffa kernel/posix-timers.c      Richard Cochran   2011-02-01  1086  
f0dbe81f0e7c39 kernel/posix-timers.c      Miroslav Lichvar  2013-01-11  1087  	if (err >= 0 && copy_to_user(utx, &ktx, sizeof(ktx)))
f1f1d5ebd10ffa kernel/posix-timers.c      Richard Cochran   2011-02-01  1088  		return -EFAULT;
f1f1d5ebd10ffa kernel/posix-timers.c      Richard Cochran   2011-02-01  1089  
f1f1d5ebd10ffa kernel/posix-timers.c      Richard Cochran   2011-02-01  1090  	return err;
f1f1d5ebd10ffa kernel/posix-timers.c      Richard Cochran   2011-02-01  1091  }
f1f1d5ebd10ffa kernel/posix-timers.c      Richard Cochran   2011-02-01  1092  

:::::: The code at line 1071 was first introduced by commit
:::::: c2185294ad509ea4a6859dc0b4c5e21a9f4ee224 CHROMIUM: alt-syscall: Make required syscalls available for use

:::::: TO: Guenter Roeck <groeck@chromium.org>
:::::: CC: Guenter Roeck <groeck@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
