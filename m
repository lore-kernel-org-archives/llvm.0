Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871803D8B
	for <llvm@lists.linux.dev>; Tue, 21 Jun 2022 17:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655831363; x=1687367363;
  h=date:from:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=rOYmMc12q1tmD+2CqdeKFllf8CEaJOVzX/+8cW0/mks=;
  b=QtwM2+DVl3/qAh+AfNT6mvfPp0QY+D+ZTjcCvchzCnSYDfBbaZD0+1O0
   0M+xDmkBFGspWJKejMihnxpN+26GQ8J7C7h/9//DLrRjlpUngaOwkHobG
   BOQ94HUo/wkEPnjmZUJCF06GyVRexdqXpS4X+7jTf3HFUrwWCVDKjsiGb
   lHCOrSzoegUPSvD0sMLLixdUOqvoxF4gg2MRVl8Uq/9pA8yP+1DbN4SkN
   gGB3bNFzxbQWjLZ1lzktmvtEmkkPIfeIZsOFyViir1P42XJRLW1Aul6WU
   KBsj+RlbXdrisSIrJtVPwfAekkbCVpc+2HpxzdKk104GgZ2BIKb/yiSTM
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="260608696"
X-IronPort-AV: E=Sophos;i="5.92,209,1650956400"; 
   d="scan'208";a="260608696"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2022 10:02:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,209,1650956400"; 
   d="scan'208";a="591737839"
Received: from lkp-server02.sh.intel.com (HELO a67cc04a5eeb) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 21 Jun 2022 10:02:06 -0700
Received: from kbuild by a67cc04a5eeb with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o3hGP-0000Cb-Rb;
	Tue, 21 Jun 2022 17:02:05 +0000
Date: Wed, 22 Jun 2022 01:01:40 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [linux-stable-rc:queue/5.15 69/105] ld.lld: error:
 init/built-in.a(do_mounts_rd.o):(function ext2_image_size: .text+0x5c):
 relocation R_RISCV_HI20 out of range: 532176 is not in [-524288, 524287];
 references .L__unnamed_3
Message-ID: <202206220005.YGFFArFq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: linux-kernel@vger.kernel.org
TO: Masahiro Yamada <masahiroy@kernel.org>
CC: Sasha Levin <sashal@kernel.org>
CC: Jarkko Sakkinen <jarkko@kernel.org>
CC: "Mickaël Salaün" <mic@linux.microsoft.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git queue/5.15
head:   42c16662078af064fb9ff1cde1a55ef38dae49c8
commit: b67be0f6d70cf570b14c0c94b55cbdf434c271bf [69/105] certs/blacklist_hashes.c: fix const confusion in certs blacklist
config: riscv-randconfig-r006-20220619 (https://download.01.org/0day-ci/archive/20220622/202206220005.YGFFArFq-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project af6d2a0b6825e71965f3e2701a63c239fa0ad70f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=b67be0f6d70cf570b14c0c94b55cbdf434c271bf
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc queue/5.15
        git checkout b67be0f6d70cf570b14c0c94b55cbdf434c271bf
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: init/built-in.a(do_mounts_rd.o):(function ext2_image_size: .text+0x5c): relocation R_RISCV_HI20 out of range: 532176 is not in [-524288, 524287]; references .L__unnamed_3
   >>> referenced by do_mounts_rd.c
   >>> defined in init/built-in.a(do_mounts_rd.o)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
