Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F89110D;
	Tue, 21 Feb 2023 07:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676965432; x=1708501432;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wzvrXdsfg6IqrcKiKjWT2q5rdfmUOtIAixd6ddYCF8k=;
  b=VhwRLGkRksumLayweJeOx6HFD7G20bjr2bESd26i3sYNTutcc2YxiT7N
   gTlA8CPplF3EGuaOYUXf33zcgQ8dizbILy7kiSOwVl7Iwx3VAcGypBVSZ
   iqa6zTaxXcYEK5UqI++apIfiIDV+0SVsKYca2gt3+hK5X6N6kmav9Om62
   GYgENu8pgbmobVuXoe14KaY9wIViQmR6+vJJVy1zdHNUeGtWBHDqNwaxD
   Qx/zhUXLb/ZZAjFztR9dsezDPeGmojmR7Kh5BCOuQaIFn0Sy/QY0owV8q
   d7m427WvXIb17W40fnhYz4AunDNLktqTij0Q1PFuQjhztkc31sKZNopdw
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="360036911"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="360036911"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2023 23:43:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="814406849"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="814406849"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 20 Feb 2023 23:43:51 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUNJW-000EYb-1g;
	Tue, 21 Feb 2023 07:43:50 +0000
Date: Tue, 21 Feb 2023 15:43:11 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:objtool/core 17/17] ld.lld: error:
 kernel/rcu/rcuscale.o: invalid symbol index
Message-ID: <202302211542.ADnoSe3g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git objtool/core
head:   1a776f81bc280e34f1d432711748d9ecaaea8827
commit: 1a776f81bc280e34f1d432711748d9ecaaea8827 [17/17] objtool: Single-linked reloc_list(s)
config: x86_64-randconfig-a014-20230220 (https://download.01.org/0day-ci/archive/20230221/202302211542.ADnoSe3g-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=1a776f81bc280e34f1d432711748d9ecaaea8827
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue objtool/core
        git checkout 1a776f81bc280e34f1d432711748d9ecaaea8827
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash M=kernel

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302211542.ADnoSe3g-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: kernel/rcu/rcuscale.o: invalid symbol index
--
>> ld.lld: error: kernel/locking/locktorture.o: invalid symbol index
--
>> ld.lld: error: kernel/rcu/refscale.o: invalid symbol index
--
>> ld.lld: error: net/core/failover.o: invalid symbol index

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
