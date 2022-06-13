Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86CF258F
	for <llvm@lists.linux.dev>; Mon, 13 Jun 2022 22:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655160907; x=1686696907;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nLVpemy9gxF1/zu+6uvWOe4ukzkTPIflDzRj+y3KhVk=;
  b=myUN9EKfat41a5ox83q5AJ3p2npwZkW0C3SopPuDr+JkCNZWAR8Irmbc
   fc56Ui4Kxe5AijMMv7vdoLTtySwBfV+kZvVrZPva8wwDSGgTbGYYb01K8
   J4r9qSWBD91dd/r98/m+c6Y8Q1IfK+jWbG4+0SatANItweGhNdyy5/9gi
   Mij+LAEPtnXzBPSRqzrek47Dd30eog+zSQUc10E/VVnI/iB+3WM1nNh+8
   KCWokMvJhn+kViPC3HslVx5ZYM0/DFFX4ZA6dvrIjUI+aYES1jOkDsMYS
   tDpbkOlf0aWy929AuI/uvTuk/gmJY2RC5mOpBklTg9SnexJLosrudXeqq
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="267126095"
X-IronPort-AV: E=Sophos;i="5.91,298,1647327600"; 
   d="scan'208";a="267126095"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2022 15:55:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,298,1647327600"; 
   d="scan'208";a="830046207"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 13 Jun 2022 15:55:04 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o0sxb-000LER-EW;
	Mon, 13 Jun 2022 22:55:03 +0000
Date: Tue, 14 Jun 2022 06:54:31 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Chiu <andy.chiu@sifive.com>, radhey.shyam.pandey@xilinx.com,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, michal.simek@xilinx.com, netdev@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org,
	Andy Chiu <andy.chiu@sifive.com>, Max Hsu <max.hsu@sifive.com>
Subject: Re: [PATCH net-next 2/2] net: axienet: Use iowrite64 to write all
 64b descriptor pointers
Message-ID: <202206140650.4x173WyJ-lkp@intel.com>
References: <20220613034202.3777248-3-andy.chiu@sifive.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220613034202.3777248-3-andy.chiu@sifive.com>

Hi Andy,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on net-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Chiu/net-axienet-fix-DMA-Tx-error/20220613-114738
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git 27f2533bcc6e909b85d3c1b738fa1f203ed8a835
config: x86_64-randconfig-r002-20220613 (https://download.01.org/0day-ci/archive/20220614/202206140650.4x173WyJ-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d378268ead93c85803c270277f0243737b536ae7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/6c45bbcce325f6c9c907ed0a11ddc13d8026bbcf
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Andy-Chiu/net-axienet-fix-DMA-Tx-error/20220613-114738
        git checkout 6c45bbcce325f6c9c907ed0a11ddc13d8026bbcf
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: iowrite64
   >>> referenced by amd_bus.c
   >>>               vmlinux.o:(axienet_dma_out_addr)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
