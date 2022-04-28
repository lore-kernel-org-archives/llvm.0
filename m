Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C515EC2
	for <llvm@lists.linux.dev>; Thu, 28 Apr 2022 09:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651137438; x=1682673438;
  h=date:from:cc:subject:message-id:mime-version;
  bh=3z9K/8CDQGHiRGOepZoKOHmjKSYilXC9v82BiGKrLwY=;
  b=D7hws5/AH1nQvnFZ9rnvXtHEZEzN0a9HRRfNX+ujcZST5pPMrakRDboH
   gb+D43yleVe0OSALSQTo0cJdmeGKmtKdmCd7AWVol3lZmG/s7Z+WW1Dqj
   StK5DIcGWudG6j5bfiWch1kwsqdA+nRLEIbpEQ1Bwyou/ss/7vlw7SM/W
   gbyzKMu+ygQhkWhSy306C/i7Z/pJgkyIjDoCWQ7+eJ33v5HLNbPCffMol
   gdSUltF7TvojDKx9msSPUNlbbRmhRc1v/pu9+t/bgTLbkWBy0WY/13+FQ
   v0MdxT78XRwdp9lCUizp10Uc6axoKe2QOGbVfS3WANyq08xn4dUzl9Irs
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10330"; a="246136880"
X-IronPort-AV: E=Sophos;i="5.90,295,1643702400"; 
   d="scan'208";a="246136880"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2022 02:17:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,295,1643702400"; 
   d="scan'208";a="533760532"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 28 Apr 2022 02:17:16 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nk0Gy-0005EN-7F;
	Thu, 28 Apr 2022 09:17:16 +0000
Date: Thu, 28 Apr 2022 17:16:45 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [sbates130272-p2pmem:raid5_lock_cont_v3 4/13] ld.lld: error:
 init/built-in.a(calibrate.o):(function calibrate_delay: .text+0x7c):
 relocation R_RISCV_HI20 out of range: 527198 is not in [-524288, 524287];
 references cpu_loops_per_jiffy
Message-ID: <202204281709.mG3t2ALt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: linux-kernel@vger.kernel.org
TO: Logan Gunthorpe <logang@deltatee.com>
CC: Christoph Hellwig <hch@lst.de>
CC: Guoqing Jiang <guoqing.jiang@linux.dev>

tree:   https://github.com/sbates130272/linux-p2pmem.git raid5_lock_cont_v3
head:   1a2d4d24e1e1bbcfc14dfc9da6b34594b4052caa
commit: dadd936240bb37ecdfdced6b7186611ecb892bfe [4/13] md/raid5: Move stripe_add_to_batch_list() call out of add_stripe_bio()
config: riscv-randconfig-r021-20220428 (https://download.01.org/0day-ci/archive/20220428/202204281709.mG3t2ALt-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c59473aacce38cd7dd77eebceaf3c98c5707ab3b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/sbates130272/linux-p2pmem/commit/dadd936240bb37ecdfdced6b7186611ecb892bfe
        git remote add sbates130272-p2pmem https://github.com/sbates130272/linux-p2pmem.git
        git fetch --no-tags sbates130272-p2pmem raid5_lock_cont_v3
        git checkout dadd936240bb37ecdfdced6b7186611ecb892bfe
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: init/built-in.a(calibrate.o):(function calibrate_delay: .text+0x7c): relocation R_RISCV_HI20 out of range: 527198 is not in [-524288, 524287]; references cpu_loops_per_jiffy
   >>> referenced by calibrate.c:273 (init/calibrate.c:273)
   >>> defined in init/built-in.a(calibrate.o)
--
>> ld.lld: error: init/built-in.a(calibrate.o):(function calibrate_delay: .text+0x386): relocation R_RISCV_HI20 out of range: 528932 is not in [-524288, 524287]; references .L__unnamed_1
   >>> referenced by calibrate.c:281 (init/calibrate.c:281)
   >>> defined in init/built-in.a(calibrate.o)
--
>> ld.lld: error: init/built-in.a(calibrate.o):(function calibrate_delay: .text+0x390): relocation R_RISCV_HI20 out of range: 528932 is not in [-524288, 524287]; references .L__unnamed_2
   >>> referenced by calibrate.c:281 (init/calibrate.c:281)
   >>> defined in init/built-in.a(calibrate.o)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
