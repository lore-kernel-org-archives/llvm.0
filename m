Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E862B7D
	for <llvm@lists.linux.dev>; Mon, 14 Feb 2022 09:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644829373; x=1676365373;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ndoVfMGj2QDjYVtr2QpgZyBrsIZl2teIl2BNdMfYu4w=;
  b=MJSqKho7vnxfjGBGpRXQzDulCq/LjzoCz2Nrloi76ZFe5MJ5gjNPOJOy
   T+LAh+CBVvMS36jwIuebcFw9ed3nWp1+LYSF0qkP+GCOPPdVbSPGp2/1M
   a50XXP828JavBIxBQgazTXIXr9w7TRlCHD7RAlByS8Qjozmgfu/awPBEE
   RiVpWW885YbN8e9HTGTX73gLCL1H6s3EaqRxxGSfBO8QBh9N2f9h3KdUy
   RcXzSutZ8ckCgwlw4OdnnnYCRpHtxzJOyAx+T7UPlKRt1mBT4ygvHmgrC
   W0f3CUdyArO0bwpSIUifbdes0NLU60lJBQ+vz2tp58Lxlh+1bUJz4+Q+k
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10257"; a="250253547"
X-IronPort-AV: E=Sophos;i="5.88,367,1635231600"; 
   d="scan'208";a="250253547"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2022 01:02:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,367,1635231600"; 
   d="scan'208";a="775016283"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 14 Feb 2022 01:02:50 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nJXFx-0008Ke-Pc; Mon, 14 Feb 2022 09:02:49 +0000
Date: Mon, 14 Feb 2022 17:02:31 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Widawsky <ben.widawsky@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Ben Widawsky <ben.widawsky@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	linux-kernel@vger.kernel.org
Subject: [cxl:preview 54/65] ERROR: modpost: "__umoddi3"
 [drivers/cxl/cxl_region.ko] undefined!
Message-ID: <202202141628.XeQ22sHZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git preview
head:   edd6d7383869c634498f4b4cb7cf73ca0d460bf3
commit: 272c07117bd268471c338ceffb8e0ac4936d0e09 [54/65] cxl/region: Introduce a cxl_region driver
config: i386-randconfig-a005-20220214 (https://download.01.org/0day-ci/archive/20220214/202202141628.XeQ22sHZ-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project ea071884b0cc7210b3cc5fe858f0e892a779a23b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git/commit/?id=272c07117bd268471c338ceffb8e0ac4936d0e09
        git remote add cxl https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git
        git fetch --no-tags cxl preview
        git checkout 272c07117bd268471c338ceffb8e0ac4936d0e09
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__umoddi3" [drivers/cxl/cxl_region.ko] undefined!

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
