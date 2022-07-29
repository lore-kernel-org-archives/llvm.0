Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13C9538A
	for <llvm@lists.linux.dev>; Fri, 29 Jul 2022 22:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659133170; x=1690669170;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7e1IU0/1VL/UlTDUWskyup1/DxjZcpExuYk7fPqQkS4=;
  b=IibIYDLoptRTlZ3V4KNz6dEPlUCzQvRTVebVw23r0P+jlumIUlSf2DLR
   4zmXcE2wUYhg+UaDY5DCZP/Pi/dWXkOwlhJ1exGwCGCXUzZl2uiI3ez4W
   +qDxwpHoPTLkXu2gt7fXjBxrGis/3xy8kZgBXw1PpUqQeZWvQuXiBCFZG
   Xo25+fbkU8wLMDuYC1u+vlj/LqB583Dzc6E2OeMREMj5Ma0XT/XaNatia
   7kUAVxOEolD58ath00epBiUE0wpqrWTJzWAjUsmg2EMOPvSM/qHnQKrLG
   YWaam21yZLsOY0Higv70Zom5THdgyPkBY2cFjllOw5akDUZoJkTrnkpNZ
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10423"; a="286414741"
X-IronPort-AV: E=Sophos;i="5.93,202,1654585200"; 
   d="scan'208";a="286414741"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2022 15:19:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,202,1654585200"; 
   d="scan'208";a="629537051"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 29 Jul 2022 15:19:26 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oHYKL-000C8r-2A;
	Fri, 29 Jul 2022 22:19:25 +0000
Date: Sat, 30 Jul 2022 06:18:39 +0800
From: kernel test robot <lkp@intel.com>
To: "Jason A. Donenfeld" <zx2c4@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	linux-kernel@vger.kernel.org
Subject: [ammarfaizi2-block:crng/random/jd/vdso 8/8]
 arch/x86/entry/vdso/vgetrandom.c:10:9: warning: no previous prototype for
 function '__vdso_getrandom'
Message-ID: <202207300604.XFoJYXtZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block crng/random/jd/vdso
head:   7f252f719a107b2d29b14c2f7143a80d4fa14349
commit: 7f252f719a107b2d29b14c2f7143a80d4fa14349 [8/8] random: implement getrandom() in vDSO
config: x86_64-randconfig-a012 (https://download.01.org/0day-ci/archive/20220730/202207300604.XFoJYXtZ-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 52cd00cabf479aa7eb6dbb063b7ba41ea57bce9e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/7f252f719a107b2d29b14c2f7143a80d4fa14349
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block crng/random/jd/vdso
        git checkout 7f252f719a107b2d29b14c2f7143a80d4fa14349
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/entry/vdso/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/x86/entry/vdso/vgetrandom.c:10:9: warning: no previous prototype for function '__vdso_getrandom' [-Wmissing-prototypes]
   ssize_t __vdso_getrandom(void **state, void *buffer, size_t len, unsigned long flags)
           ^
   arch/x86/entry/vdso/vgetrandom.c:10:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   ssize_t __vdso_getrandom(void **state, void *buffer, size_t len, unsigned long flags)
   ^
   static 
   1 warning generated.


vim +/__vdso_getrandom +10 arch/x86/entry/vdso/vgetrandom.c

     9	
  > 10	ssize_t __vdso_getrandom(void **state, void *buffer, size_t len, unsigned long flags)
    11	{
    12		return __cvdso_getrandom(state, buffer, len, flags);
    13	}
    14	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
