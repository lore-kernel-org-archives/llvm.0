Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC47F640;
	Mon, 27 Feb 2023 06:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677477806; x=1709013806;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kea/ZPh+AsFpCFeWwDwk0tzPQAYnr3QkcltJ7nM+V6s=;
  b=FBaR3magSQpJ95/riQJGNkgNcTqN42u25iw5q/D/5z8/8w1Twayt+0nU
   plT+Crb/h1dfCZ7HnuU3qn/8mCrbOgvNiMlyn2a5Eeq4cBAK/SdrsDj+h
   Vr4e65cxDDZ5Xl2ZShb8iLGmidYpA+aXCPMGYxOFI22unAAP1SQpnpOmM
   A92xA+k0Xo3tSzYhGFw8ciqY8QiiEPBUCEoX3NPepxLLo/CEWeppGHipn
   1rWFfAdjvfH+8qF8YfA0q4CFq5EJjG9Ql9mZawleSfJ8++rA18E6+GlwN
   /mFHOUAS17ieYB4xvQ34o6lvveJUgl/qpOtWQROgA0529SgBs481D5+1k
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="322029150"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; 
   d="scan'208";a="322029150"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2023 22:03:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="847671709"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; 
   d="scan'208";a="847671709"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 26 Feb 2023 22:03:23 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWWba-000483-2m;
	Mon, 27 Feb 2023 06:03:22 +0000
Date: Mon, 27 Feb 2023 14:02:35 +0800
From: kernel test robot <lkp@intel.com>
To: Marco Elver <elver@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrey Konovalov <andreyknvl@gmail.com>
Subject: [ammarfaizi2-block:akpm/mm/mm-unstable 13/64] ld.lld: error:
 undefined symbol: memcpy
Message-ID: <202302271348.U5lvmo0S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block akpm/mm/mm-unstable
head:   8ed02c625a2b76ca52e16ca6a4fcf57183ea72ed
commit: 07e0a7128168f7174b55a50fc154f5a8810dc23c [13/64] kasan: treat meminstrinsic as builtins in uninstrumented files
config: powerpc-randconfig-r022-20230226 (https://download.01.org/0day-ci/archive/20230227/202302271348.U5lvmo0S-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://github.com/ammarfaizi2/linux-block/commit/07e0a7128168f7174b55a50fc154f5a8810dc23c
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block akpm/mm/mm-unstable
        git checkout 07e0a7128168f7174b55a50fc154f5a8810dc23c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302271348.U5lvmo0S-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: memcpy
   >>> referenced by nonstdio.c
   >>>               arch/powerpc/xmon/nonstdio.o:(xmon_write) in archive vmlinux.a
   >>> referenced by xmon.c
   >>>               arch/powerpc/xmon/xmon.o:(prregs) in archive vmlinux.a
   >>> referenced by alarmtimer.c
   >>>               kernel/time/alarmtimer.o:(alarmtimer_suspend) in archive vmlinux.a
   >>> referenced 74 more times
--
>> ld.lld: error: undefined symbol: memset
   >>> referenced by kasan_test.c
   >>>               mm/kasan/kasan_test.o:(kmalloc_oob_in_memset) in archive vmlinux.a
   >>> referenced by kasan_test.c
   >>>               mm/kasan/kasan_test.o:(kmalloc_oob_memset_2) in archive vmlinux.a
   >>> referenced by kasan_test.c
   >>>               mm/kasan/kasan_test.o:(kmalloc_oob_memset_4) in archive vmlinux.a
   >>> referenced 10 more times

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
