Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393C233CC
	for <llvm@lists.linux.dev>; Mon, 18 Jul 2022 17:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658165496; x=1689701496;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wVE9Xlpc6XOQKRzpAWe2jSfajVz3Ah+KJnh/3d9lT30=;
  b=eVlCtAE/XkeVTniPcDiO+MnlXBO040lIXMXWL3JzMEEe2V88i89Vrz1m
   a+/ZhuxI8hH/oaknDHoTyYqDAujrfY8f2pckFyitBi25brFhN6U6X/FZV
   wCZFap+/MR8q0E4KSgOr0Mq7A6vzAE+oTb4Z8D6j8RlsBbOwPlvUer00A
   KnktPsKZL99lN//Liojb5LZH0FDkdGDx8KXz9OxKBBODYncwaqBia2JfX
   y0izBrM/61sPEdgrUOj5Eo33SmTQ4GqRVqM8PS3VoOqUkwp1IlkchtnrG
   ExkflmTkSr8Sr2kB+SmxKS89hFS6VXBqGFGGNX0LzSQ4xUomANCYrlrEm
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10412"; a="266059980"
X-IronPort-AV: E=Sophos;i="5.92,281,1650956400"; 
   d="scan'208";a="266059980"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2022 10:31:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,281,1650956400"; 
   d="scan'208";a="572500852"
Received: from lkp-server02.sh.intel.com (HELO ff137eb26ff1) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 18 Jul 2022 10:31:33 -0700
Received: from kbuild by ff137eb26ff1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oDUai-0004bt-Da;
	Mon, 18 Jul 2022 17:31:32 +0000
Date: Tue, 19 Jul 2022 01:31:08 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Dooks <ben.dooks@sifive.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [linux-next:master 8797/11208] reset-simple.c:undefined reference to
 `devm_ioremap_resource'
Message-ID: <202207190150.mf4rb4VG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   036ad6daa8f0fd357af7f50f9da58539eaa6f68c
commit: 18d1909be3451e1a2e322e9035f03d0a18f7bee8 [8797/11208] reset: allow building of reset simple driver if expert config selected
config: s390-randconfig-r032-20220718 (https://download.01.org/0day-ci/archive/20220719/202207190150.mf4rb4VG-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d74b88c69dc2644bd0dc5d64e2d7413a0d4040e5)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=18d1909be3451e1a2e322e9035f03d0a18f7bee8
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 18d1909be3451e1a2e322e9035f03d0a18f7bee8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   /opt/cross/gcc-12.1.0-nolibc/s390x-linux/bin/s390x-linux-ld: drivers/reset/reset-simple.o: in function `reset_simple_probe':
>> reset-simple.c:(.text+0x3aa): undefined reference to `devm_ioremap_resource'

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
