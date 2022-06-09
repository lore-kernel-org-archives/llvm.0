Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042657A
	for <llvm@lists.linux.dev>; Thu,  9 Jun 2022 10:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654772192; x=1686308192;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yDYF97BczXyk/QRqrMjkoog8SRjq6qjc3hY0Uw3u9Ik=;
  b=ehHf5ZTVnj9aWftPaP33TWk26WbY6b+a1JBP4ts9YPN7f3eiJJUxeyeM
   qv/qC8+wIzNoU6fG8ss/7bflpzOwPo6lVtVUYEL7Nd1vjjh/caJE3C5SL
   TJKOVP/dpwT6wRwMWjOZYBc0dbFP9LpUBGd16IXPzUdvDULLZLru30EdB
   aJMDS3DU/6PS4fH4FO5X4vi2KbSI4OtkaVUzQkgBSLijwI8ko/EDIfRvn
   buCA4slzodksfh9cGjIlJljvmy9axgd6zhl/k6BjPKM26vJu3QwmdlMZV
   TYGtVbSimp+ER1CtQWer/W9qmcO8B7iFZpf3xwx7VcC3uu4uWsu3P7y5a
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10372"; a="363565246"
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; 
   d="scan'208";a="363565246"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2022 03:56:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; 
   d="scan'208";a="671103174"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 09 Jun 2022 03:56:30 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nzFq2-000FuG-4q;
	Thu, 09 Jun 2022 10:56:30 +0000
Date: Thu, 9 Jun 2022 18:55:44 +0800
From: kernel test robot <lkp@intel.com>
To: Matteo Croce <mcroce@microsoft.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>
Subject: [avpatel:virtio_rpmsg_bus_fix_v1 36/52]
 arch/riscv/lib/string.c:89:7: error: expected identifier or '('
Message-ID: <202206091823.jt1rchtM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git virtio_rpmsg_bus_fix_v1
head:   390aaf641ff2f8919268d611e864227265c3f3f2
commit: 312a993799c081eda5135198ad59b691211d14fe [36/52] riscv: optimized memcpy
config: riscv-randconfig-r042-20220609 (https://download.01.org/0day-ci/archive/20220609/202206091823.jt1rchtM-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b92436efcb7813fc481b30f2593a4907568d917a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/avpatel/linux/commit/312a993799c081eda5135198ad59b691211d14fe
        git remote add avpatel https://github.com/avpatel/linux.git
        git fetch --no-tags avpatel virtio_rpmsg_bus_fix_v1
        git checkout 312a993799c081eda5135198ad59b691211d14fe
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/riscv/lib/string.c:89:7: error: expected identifier or '('
   void *memcpy(void *dest, const void *src, size_t count) __weak __alias(__memcpy);
         ^
   include/linux/fortify-string.h:385:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^
   include/linux/fortify-string.h:374:42: note: expanded from macro '__fortify_memcpy_chk'
                                p_size_field, q_size_field, op) ({         \
                                                                 ^
>> arch/riscv/lib/string.c:89:7: error: expected ')'
   include/linux/fortify-string.h:385:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^
   include/linux/fortify-string.h:374:42: note: expanded from macro '__fortify_memcpy_chk'
                                p_size_field, q_size_field, op) ({         \
                                                                 ^
   arch/riscv/lib/string.c:89:7: note: to match this '('
   include/linux/fortify-string.h:385:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^
   include/linux/fortify-string.h:374:41: note: expanded from macro '__fortify_memcpy_chk'
                                p_size_field, q_size_field, op) ({         \
                                                                ^
   2 errors generated.


vim +89 arch/riscv/lib/string.c

    88	
  > 89	void *memcpy(void *dest, const void *src, size_t count) __weak __alias(__memcpy);

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
