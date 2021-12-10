Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814C8173
	for <llvm@lists.linux.dev>; Fri, 10 Dec 2021 15:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639149009; x=1670685009;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q8TZoYGjts2GBYGJtGb6rXBv5JgZ+YSxyMXDVj0CCss=;
  b=FDGlc7rE/dFYnBKV02p4PkffZmyl9EBuN/5eo2D7K7Mb+c5Kq2bxVvhW
   Lnyw/ElcUBF684KKVCZd+Ikjo9kns5peHMKx6zkBKtGCBHPJj2Eyj39M5
   XJ8EusOfPUBLSJsPnyjJOIzkOSXp73RGxJ3LmtHs9s9yOKemmxWweR5L4
   /b7QjFJ68sJnkzV9f7v2F58TkEb3EZp0z0IEuGS3Jq2zGNZnr5cRgZNoP
   zRzv32CYh0NGDQgfSt/Abuy0DP2t7uETbQjnuiTl0Vz25NSeVH+F23P8O
   Guc7WYlur7hVJVV1WloaifiXWgRNYpRHXvYDytRDkMEtc9p2HirBpSUJ1
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10193"; a="218381891"
X-IronPort-AV: E=Sophos;i="5.88,195,1635231600"; 
   d="scan'208";a="218381891"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2021 07:10:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,195,1635231600"; 
   d="scan'208";a="462569594"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 10 Dec 2021 07:10:06 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mvhXC-0003IK-5u; Fri, 10 Dec 2021 15:10:06 +0000
Date: Fri, 10 Dec 2021 23:09:27 +0800
From: kernel test robot <lkp@intel.com>
To: Sven Peter <sven@svenpeter.dev>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [asahilinux:nvme/dev 17/18] ld.lld: error: undefined symbol:
 mbox_send_message
Message-ID: <202112102327.HUfIS2jd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/AsahiLinux/linux nvme/dev
head:   d25eee8aced31cf92944992bec41022e6f837daf
commit: fd7c0ced9b5e58028c66dde6cb54fa61a19283b9 [17/18] WIP: soc: apple: rtkit: Add RTKit library
config: arm64-randconfig-r014-20211210 (https://download.01.org/0day-ci/archive/20211210/202112102327.HUfIS2jd-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 097a1cb1d5ebb3a0ec4bcaed8ba3ff6a8e33c00a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/AsahiLinux/linux/commit/fd7c0ced9b5e58028c66dde6cb54fa61a19283b9
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux nvme/dev
        git checkout fd7c0ced9b5e58028c66dde6cb54fa61a19283b9
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: mbox_send_message
   >>> referenced by rtkit.c
   >>> soc/apple/rtkit.o:(apple_rtkit_send_message) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: mbox_request_channel_byname
   >>> referenced by rtkit.c
   >>> soc/apple/rtkit.o:(apple_rtkit_init) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: mbox_request_channel
   >>> referenced by rtkit.c
   >>> soc/apple/rtkit.o:(apple_rtkit_init) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: mbox_free_channel
   >>> referenced by rtkit.c
   >>> soc/apple/rtkit.o:(apple_rtkit_free) in archive drivers/built-in.a

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
