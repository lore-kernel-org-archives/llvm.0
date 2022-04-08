Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC29623
	for <llvm@lists.linux.dev>; Fri,  8 Apr 2022 08:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649407273; x=1680943273;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SOeHwjLYsZq6u42tWkzBpKCJ5PfZ3EMR5To2dqzIxN0=;
  b=T0rXvByf8g8KtocvqQRCbStJ798VEn+ZmbJKskJr30CD4e108MrYrvPw
   /XQI5O5H+pbKba5LVaPns5GDjKQFrFfTHadsaWBCxmtwqVWeAFMKP/SAD
   cwmnVTpHMuiW4xAgARBFCouIH0YqGV9BJ4lrQPIsNdOA6tsFwbTgpKTiW
   2sy8U+pF8AkI3c6/X2NDpiEB50dWsVkxc+Zx4kenn5ACvFzinvsLIQAFK
   eJNkaKCoFFw/xnmM97x4d8NWN43IbstMivK3C0DbIYM/tVEkwPOQ3Twss
   urSlT68vEDuaJNan9AqHZp3re9fAutkYoKNxPXAuGI87F+AkLibkSfo3d
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="324708465"
X-IronPort-AV: E=Sophos;i="5.90,244,1643702400"; 
   d="scan'208";a="324708465"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2022 01:41:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,244,1643702400"; 
   d="scan'208";a="506487965"
Received: from lkp-server02.sh.intel.com (HELO 7e80bc2a00a0) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 08 Apr 2022 01:41:10 -0700
Received: from kbuild by 7e80bc2a00a0 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nckB3-00004j-9e;
	Fri, 08 Apr 2022 08:41:09 +0000
Date: Fri, 8 Apr 2022 16:40:56 +0800
From: kernel test robot <lkp@intel.com>
To: Wedson Almeida Filho <wedsonaf@google.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Miguel Ojeda <ojeda@kernel.org>
Subject: [linux-next:master 1114/3040] ERROR: modpost: "build_error"
 [drivers/gpio/gpio_pl061_rust.ko] undefined!
Message-ID: <202204081643.OiIBxOdF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2e9a9857569ec27e64d2ddd01294bbe3c736acb1
commit: 2340e5b0b93c2d5c1519371bac0fd3acb0fb925d [1114/3040] [RFC] drivers: gpio: PrimeCell PL061 in Rust
config: arm64-buildonly-randconfig-r003-20220408 (https://download.01.org/0day-ci/archive/20220408/202204081643.OiIBxOdF-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c29a51b3a257908aebc01cd7c4655665db317d66)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=2340e5b0b93c2d5c1519371bac0fd3acb0fb925d
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 2340e5b0b93c2d5c1519371bac0fd3acb0fb925d
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "build_error" [drivers/gpio/gpio_pl061_rust.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
