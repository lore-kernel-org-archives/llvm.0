Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46AF2C80
	for <llvm@lists.linux.dev>; Tue, 25 Jan 2022 05:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643088085; x=1674624085;
  h=date:from:cc:subject:message-id:mime-version;
  bh=MuRN4vXJImW+mAHxTGU7cgYIDYGXTp4xZXv9wsTH3hA=;
  b=arWOVkjsuHKtfhBFdos9+hVSnhJiCcsLBNZaeTX8wz0Z0SasU9tEPR8X
   k/fsPzg0tR3Mh22oY5/++f5Mb7WiJY4TsJJQwtVHzJ8EG1XzjfxumdaDS
   nttkWz5e0UpG2fJHc+2BA9FqvdR1Ned/ycHDfPoQ0ef2ycT3TB3KTDOv9
   iQvgDmu4uOn6IHyYMzUpBEB7FmDaWaWu0BA8P19zEkuFMdFVTGxAsr8cL
   Gnqygomthai55x/uG2q9cBFQkBOom0iR5rO/5EA1gjWuKY+ooLFRy6cK1
   JlTjOupGkn14ozO/m2xMNPHmWmvdz4wK1+EG4rWIviz9CVOGZFgmdiO8f
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10237"; a="243821589"
X-IronPort-AV: E=Sophos;i="5.88,314,1635231600"; 
   d="scan'208";a="243821589"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2022 21:21:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,314,1635231600"; 
   d="scan'208";a="562917269"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 24 Jan 2022 21:21:24 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nCEGh-000JO5-8e; Tue, 25 Jan 2022 05:21:23 +0000
Date: Tue, 25 Jan 2022 13:21:20 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [chrome-os:chromeos-5.10 9798/9999] ld.lld: error: assignment to
 symbol __pecoff_data_size does not converge
Message-ID: <202201251303.zNHGRlTj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

TO: cros-kernel-buildreports@googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.10
head:   26a3cf7b7d542f4ff85e2855ab69140bff097a50
commit: 5e4124c4f0737b68cd385b1d22ebc24ca06a8288 [9798/9999] FROMLIST: mailbox: mediatek: add support for adsp mailbox controller
config: arm64-randconfig-r013-20220120 (https://download.01.org/0day-ci/archive/20220125/202201251303.zNHGRlTj-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f7b7138a62648f4019c55e4671682af1f851f295)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.10
        git checkout 5e4124c4f0737b68cd385b1d22ebc24ca06a8288
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: assignment to symbol __pecoff_data_size does not converge

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
