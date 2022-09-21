Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA785A90
	for <llvm@lists.linux.dev>; Wed, 21 Sep 2022 16:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663777109; x=1695313109;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K7HXtXiRV8hbGr4aulJKiYRirwa4gNC5dw8Zv+1W4m0=;
  b=lzJazUWFgJSKJEPIekSSjNIZwbPQa2E6FxOk4m5781cf+ZhNHnCi8R01
   2dI5nxy/22KCyfguRIFqJ9wdpPCURag13nQNCufxa+AMHHiccfQrDwfIX
   3SmjhDduxrXFjNNbMjjor75EJDNHrgAYDfJX7E1iDeh2w/IuxGfLJyIzQ
   laaz7+TlF4STZPKKDBJL1LOBZ2fyN26bPrxNfgFJFpGp9SQ0ehLTmwRNF
   23ok1bUx5ufZh1dBQ07zLmt5g5MUBykQELxLKYrzElRuqTeAy0Qd+8AnV
   29DGoYKqvm+eGqIslFavFmLp+idFbw1RH9dD93RAadfGnKIOQsd+B4exQ
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10477"; a="361810457"
X-IronPort-AV: E=Sophos;i="5.93,333,1654585200"; 
   d="scan'208";a="361810457"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2022 09:18:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,333,1654585200"; 
   d="scan'208";a="650142718"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 21 Sep 2022 09:18:27 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ob2Qc-0003ki-2L;
	Wed, 21 Sep 2022 16:18:26 +0000
Date: Thu, 22 Sep 2022 00:17:37 +0800
From: kernel test robot <lkp@intel.com>
To: Wenjing Liu <wenjing.liu@amd.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>, Jun Lei <Jun.Lei@amd.com>
Subject: [linux-next:master 8021/8813]
 drivers/gpu/drm/amd/amdgpu/../display/dc/virtual/virtual_link_hwss.c:40:6:
 warning: no previous prototype for function 'virtual_disable_link_output'
Message-ID: <202209220019.Yr2VuXhg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   483fed3b5dc8ce3644c83d24240cf5756fb0993e
commit: 9c75891feef0f9f67cf1c8f8038371006e25d23f [8021/8813] drm/amd/display: rework recent update PHY state commit
config: powerpc-randconfig-r006-20220921 (https://download.01.org/0day-ci/archive/20220922/202209220019.Yr2VuXhg-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=9c75891feef0f9f67cf1c8f8038371006e25d23f
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 9c75891feef0f9f67cf1c8f8038371006e25d23f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/dc/virtual/virtual_link_hwss.c:40:6: warning: no previous prototype for function 'virtual_disable_link_output' [-Wmissing-prototypes]
   void virtual_disable_link_output(struct dc_link *link,
        ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/virtual/virtual_link_hwss.c:40:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void virtual_disable_link_output(struct dc_link *link,
   ^
   static 
   1 warning generated.


vim +/virtual_disable_link_output +40 drivers/gpu/drm/amd/amdgpu/../display/dc/virtual/virtual_link_hwss.c

    39	
  > 40	void virtual_disable_link_output(struct dc_link *link,
    41		const struct link_resource *link_res,
    42		enum signal_type signal)
    43	{
    44	}
    45	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
