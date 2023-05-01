Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4151A651;
	Mon,  1 May 2023 06:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682921162; x=1714457162;
  h=date:from:cc:subject:message-id:mime-version;
  bh=+2I9i+EJ4tX2RtT3pUeNoghqAoFdNDN0fLYKLgWeu14=;
  b=hYij6ShXPlZwwAZZBQ4Hi2d3cF7fsulU6msihpKHTeTY1hkhSLBAOHz9
   nBSM7JzW6MDgXUO3tpAvg9RjVi6HOPc3RDN7m0g+GIgMiM8o6ZL7iYckc
   XDfiC+I1wQXZKbUPA+enOtZcU92DJPTZ+wui2xqmh3S0k71ccq1T4ALsN
   s5nUpsG5DHKp/5sbKrzK4bw07qQcQ+5FpIGVr+DmGbNGcasGOGNE5FWzb
   /6ogO4rBGHC/SrMf4Z6Fj3r0EUS+W0Y9pKzlWAnuDs9gEoGybB0iPgxFv
   mZP6un+VwDZJx9y7K7JASRo4Pwnt4slhFLKTA5n3zZBRf/SgGX1k4y31I
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="434410781"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="434410781"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2023 23:06:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="695688156"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="695688156"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 30 Apr 2023 23:06:00 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptMff-0000KT-2w;
	Mon, 01 May 2023 06:05:59 +0000
Date: Mon, 1 May 2023 14:05:58 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [linux-stable-rc:queue/4.14 10481/26142]
 drivers/media/dvb-frontends/mxl5xx.o: warning: objtool:
 convert_endian()+0x61c: can't find switch jump table
Message-ID: <202305011400.py6RYP5c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Matthias Kaehlcke <mka@chromium.org>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Nick Desaulniers <ndesaulniers@google.com>
CC: Masahiro Yamada <yamada.masahiro@socionext.com>
CC: Nathan Chancellor <natechancellor@gmail.com>
CC: Sasha Levin <sashal@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git queue/4.14
head:   6b8a28969656b6c0e1831a4c34afe8d75ce1e9b3
commit: 56714d4517b45acfb3747980fda39e018deb756a [10481/26142] Revert "kbuild: use -Oz instead of -Os when using clang"
config: x86_64-randconfig-r011-20230501 (https://download.01.org/0day-ci/archive/20230501/202305011400.py6RYP5c-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=56714d4517b45acfb3747980fda39e018deb756a
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc queue/4.14
        git checkout 56714d4517b45acfb3747980fda39e018deb756a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash LDFLAGS=-z max-page-size=0x200000  drivers/gpu/drm/i915/ drivers/media/dvb-frontends/ fs/cifs/ fs/nfs/ net/sunrpc/auth_gss/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305011400.py6RYP5c-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/dvb-frontends/mxl5xx.o: warning: objtool: convert_endian()+0x61c: can't find switch jump table

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
