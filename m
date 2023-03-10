Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62917B;
	Fri, 10 Mar 2023 02:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678417132; x=1709953132;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tRqeKWPd2oh6J0+E+X2pCSxoe22TLHofY9ID6INkPDM=;
  b=nQcDZtBJ0b0d6RxoLqrWNAbg2xIzRXmdGiRucyp2YNBw/jV2PRoje8S+
   1O0KYQYkzk/utq38rDdPDxVRY9aaH2Fi2XiBj1GadYb4jY/OU0tR65Qos
   pM1CO6HmECMAv2X727VOW5biTicOYhu4p/aZg+XaFxUG+dKJARLmaem7P
   syrc6ZLCjQndRutJdBnnmZ2BhFqPWqz8Qo6iIljQ0asEKx3fOhWlxn8jc
   GaBxHWLcKTFpqqBohyrvjbnV38QgC5JGasqesJu2IhXxcdj82l5kP9Asx
   OcO1GD7EVXblXG0E4CQe0azYEY/P3Z2HoOeQv6ycgcvMI9dhQeDKsown9
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="334108339"
X-IronPort-AV: E=Sophos;i="5.98,248,1673942400"; 
   d="scan'208";a="334108339"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 18:58:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="670941964"
X-IronPort-AV: E=Sophos;i="5.98,248,1673942400"; 
   d="scan'208";a="670941964"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 09 Mar 2023 18:58:50 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paSy1-0003P9-22;
	Fri, 10 Mar 2023 02:58:49 +0000
Date: Fri, 10 Mar 2023 10:57:52 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:static-call-null-3 1/1]
 include/linux/static_call.h:313:29: warning: pointer type mismatch ('void *'
 and 'void (*)(void)')
Message-ID: <202303101033.d6i7XKn9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git static-call-null-3
head:   42d224aeea3da11460b34b148dd1226a5e53a9e8
commit: 42d224aeea3da11460b34b148dd1226a5e53a9e8 [1/1] static_call: Make NULL static calls consistent
config: riscv-randconfig-r024-20230308 (https://download.01.org/0day-ci/archive/20230310/202303101033.d6i7XKn9-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git/commit/?id=42d224aeea3da11460b34b148dd1226a5e53a9e8
        git remote add jpoimboe https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git
        git fetch --no-tags jpoimboe static-call-null-3
        git checkout 42d224aeea3da11460b34b148dd1226a5e53a9e8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303101033.d6i7XKn9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/riscv/kernel/asm-offsets.c:12:
   In file included from arch/riscv/include/asm/kvm_host.h:21:
   In file included from arch/riscv/include/asm/kvm_vcpu_pmu.h:12:
   In file included from include/linux/perf/riscv_pmu.h:12:
   In file included from include/linux/perf_event.h:63:
>> include/linux/static_call.h:313:29: warning: pointer type mismatch ('void *' and 'void (*)(void)') [-Wpointer-type-mismatch]
           WRITE_ONCE(key->func, func ? : __static_call_nop);
                                 ~~~~ ^   ~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:61:18: note: expanded from macro 'WRITE_ONCE'
           __WRITE_ONCE(x, val);                                           \
                           ^~~
   include/asm-generic/rwonce.h:55:33: note: expanded from macro '__WRITE_ONCE'
           *(volatile typeof(x) *)&(x) = (val);                            \
                                          ^~~
   1 warning generated.
--
   In file included from net/mac80211/rc80211_minstrel_ht.c:15:
   In file included from net/mac80211/rate.h:18:
   In file included from net/mac80211/driver-ops.h:13:
   In file included from net/mac80211/trace.h:11:
   In file included from include/linux/tracepoint.h:22:
>> include/linux/static_call.h:313:29: warning: pointer type mismatch ('void *' and 'void (*)(void)') [-Wpointer-type-mismatch]
           WRITE_ONCE(key->func, func ? : __static_call_nop);
                                 ~~~~ ^   ~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:61:18: note: expanded from macro 'WRITE_ONCE'
           __WRITE_ONCE(x, val);                                           \
                           ^~~
   include/asm-generic/rwonce.h:55:33: note: expanded from macro '__WRITE_ONCE'
           *(volatile typeof(x) *)&(x) = (val);                            \
                                          ^~~
   net/mac80211/rc80211_minstrel_ht.c:1711:6: warning: variable 'n_supported' set but not used [-Wunused-but-set-variable]
           int n_supported = 0;
               ^
   2 warnings generated.
--
   In file included from arch/riscv/kernel/asm-offsets.c:12:
   In file included from arch/riscv/include/asm/kvm_host.h:21:
   In file included from arch/riscv/include/asm/kvm_vcpu_pmu.h:12:
   In file included from include/linux/perf/riscv_pmu.h:12:
   In file included from include/linux/perf_event.h:63:
>> include/linux/static_call.h:313:29: warning: pointer type mismatch ('void *' and 'void (*)(void)') [-Wpointer-type-mismatch]
           WRITE_ONCE(key->func, func ? : __static_call_nop);
                                 ~~~~ ^   ~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:61:18: note: expanded from macro 'WRITE_ONCE'
           __WRITE_ONCE(x, val);                                           \
                           ^~~
   include/asm-generic/rwonce.h:55:33: note: expanded from macro '__WRITE_ONCE'
           *(volatile typeof(x) *)&(x) = (val);                            \
                                          ^~~
   1 warning generated.


vim +313 include/linux/static_call.h

   309	
   310	static inline
   311	void __static_call_update(struct static_call_key *key, void *tramp, void *func)
   312	{
 > 313		WRITE_ONCE(key->func, func ? : __static_call_nop);
   314	}
   315	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
