Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8E92F23
	for <llvm@lists.linux.dev>; Wed,  9 Feb 2022 03:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644376166; x=1675912166;
  h=date:from:cc:subject:message-id:mime-version;
  bh=I7X+0aJ3Vdg0cJTzgcFqR37DtvK5gzqMb2fAJsQh7Ok=;
  b=LH3xagjFOoAuo2+w7DOAfhHCUKGJmJT9sTkfEAcfAqalsqqb7kQzd4L7
   Dr4ZYED5DApY9dPOCsBQOtWKfUsFxUXbhGdr0s+x4Isjmm7e/ZE4RXIQg
   la+zxi4UbuC+8dHR+PohWS0RXyAWfc6YljLe+4p5a05wrFLED6Ejqk2vR
   bhpU1pINSt7owFq1ftHrW8S0hQ02u5AyXpnOCnsr6uzqa4vhDOWkiaxwM
   3euqSHovjGm1MyUIu3MaahgPiSkCjwFJUSGJ4CdYxx5oooMSoTGeOg00t
   wUwSL9FAQmF2D1v39RHs+jnAhRbklAOlAX5Mu0nAu7SkF4oNhYvHy7mI6
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="232673481"
X-IronPort-AV: E=Sophos;i="5.88,354,1635231600"; 
   d="scan'208";a="232673481"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2022 19:09:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,354,1635231600"; 
   d="scan'208";a="482175966"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 08 Feb 2022 19:09:24 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nHdMA-000199-IQ; Wed, 09 Feb 2022 03:09:22 +0000
Date: Wed, 9 Feb 2022 11:08:33 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [crng-random:jd/preempt-rt 4/9] drivers/char/random.o: warning:
 objtool: urandom_read_nowarn()+0x1b2: unreachable instruction
Message-ID: <202202091149.sGYokEQM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

CC: zx2c4@kernel.org
CC: linux-kernel@vger.kernel.org
TO: "Jason A. Donenfeld" <zx2c4@kernel.org>
CC: "Jean-Philippe Aumasson" <jeanphilippe.aumasson@gmail.com>

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/crng/random.git jd/preempt-rt
head:   e32d7768f472ed279c1c4a82bf8ba611d67db8e2
commit: 17e19ef79dd0e0ad4b7ec2831088282ddd7674cd [4/9] random: use linear min-entropy accumulation crediting
config: x86_64-buildonly-randconfig-r002-20220207 (https://download.01.org/0day-ci/archive/20220209/202202091149.sGYokEQM-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project e8bff9ae54a55b4dbfeb6ba55f723abbd81bf494)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/crng/random.git/commit/?id=17e19ef79dd0e0ad4b7ec2831088282ddd7674cd
        git remote add crng-random git://git.kernel.org/pub/scm/linux/kernel/git/crng/random.git
        git fetch --no-tags crng-random jd/preempt-rt
        git checkout 17e19ef79dd0e0ad4b7ec2831088282ddd7674cd
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/char/random.c:1882:6: warning: no previous prototype for function 'add_hwgenerator_randomness' [-Wmissing-prototypes]
   void add_hwgenerator_randomness(const char *buffer, size_t count,
        ^
   drivers/char/random.c:1882:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void add_hwgenerator_randomness(const char *buffer, size_t count,
   ^
   static 
   1 warning generated.
>> drivers/char/random.o: warning: objtool: urandom_read_nowarn()+0x1b2: unreachable instruction

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
