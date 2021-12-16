Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FCA2C82
	for <llvm@lists.linux.dev>; Thu, 16 Dec 2021 15:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639669751; x=1671205751;
  h=date:from:cc:subject:message-id:mime-version;
  bh=pvneDo9aeoJYpz9y5S0YRiNsMwXlCDvY/9GaARPMhiE=;
  b=B7/75nJ6Jr8qsoc0CuMIgDZs3IGw5dHbhuOkMpYvFa6I2jziFjETZXDA
   /oHGqyybl8dzQpzbTuz96JdQ494eCcLvy+x17M+duuDq/0Vxh1RPjRKOO
   DKPlLG8BPm5C9cPNhG7PawQy27TQGYai3CRc2rXcsYBxqEdqvXSQgLii5
   t1afj9rLasWghqJ4kiBSZGrWFGocclVmQXW7zpvVTGLmriXVJiHKGcetI
   MFfQT6wXaDi2V9ErMe0j4CBeZ0UpAClBm2AaHCx6xLCK1oTDEodH//lnM
   IfTSvUVZRpbtT6Upd3JKSNIWQKm86XoC2eKYQA6K6FK99SHfNmIbPxBsr
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10199"; a="219536915"
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; 
   d="scan'208";a="219536915"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2021 07:49:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; 
   d="scan'208";a="466112839"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 16 Dec 2021 07:49:09 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mxt0G-0003PH-Fl; Thu, 16 Dec 2021 15:49:08 +0000
Date: Thu, 16 Dec 2021 23:48:23 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [linux-next:master 3549/7473] drivers/media/cec/core/cec-adap.o:
 warning: objtool: cec_transmit_msg_fh()+0x11a6: unreachable instruction
Message-ID: <202112162329.ZCR3wABg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Hans Verkuil <hverkuil@xs4all.nl>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   93bf6eee76c0e716f6b32de690b1c52991547bb4
commit: 2ddd03309433d39852945c2f85d36e796c558793 [3549/7473] media: cec: safely unhook lists in cec_data
config: x86_64-randconfig-a011-20211216 (https://download.01.org/0day-ci/archive/20211216/202112162329.ZCR3wABg-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project dd245bab9fbb364faa1581e4f92ba3119a872fba)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=2ddd03309433d39852945c2f85d36e796c558793
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 2ddd03309433d39852945c2f85d36e796c558793
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/media/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/media/cec/core/cec-adap.o: warning: objtool: cec_transmit_msg_fh()+0x11a6: unreachable instruction

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
