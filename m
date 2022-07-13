Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FB115AA
	for <llvm@lists.linux.dev>; Wed, 13 Jul 2022 04:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657685807; x=1689221807;
  h=date:from:cc:subject:message-id:mime-version;
  bh=CYapNGPe239IbYoQSuC9UWJthg0UO7S4pqcu4S734kY=;
  b=KYdixRtRzx31GWyYI/tpc20o1GBHx7guXpmxESV4ArzW/jD6tPSdLrhb
   G3gjRvYTusGPw2LDGEYWsPfK5eWx5i7DxTZUuJGwdpa8e4ifScEvyyVUs
   Ri3Qg/23O6Jo22pB2WSNcNFNJmOtANMhkOcO+k6CrRwqfwb6NevDwwLMj
   fb1zdqvshhqhoHqOnByidzd19aR9MkpZnt7UdPwn5w3KDqlqnO4wSl+Zy
   9W5U05QGs1e6S4TZVb0kxBZgkoEDHUcWYeCNC2GCMx4xhCMKQ9w+bq5Ci
   kyu3Lr1rnLlXSJNiVeCtJceLSZoQXogqOP7xWYoYhVuHnqUWUa5/WCl6e
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10406"; a="265516366"
X-IronPort-AV: E=Sophos;i="5.92,267,1650956400"; 
   d="scan'208";a="265516366"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2022 21:16:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,267,1650956400"; 
   d="scan'208";a="570460030"
Received: from lkp-server02.sh.intel.com (HELO 8708c84be1ad) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 12 Jul 2022 21:16:45 -0700
Received: from kbuild by 8708c84be1ad with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oBTnp-00034X-2O;
	Wed, 13 Jul 2022 04:16:45 +0000
Date: Wed, 13 Jul 2022 12:16:25 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: Re: [PATCH] riscv: Pass -mno-relax only on lld < 15.0.0
Message-ID: <202207131251.9wFgtqfN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
In-Reply-To: <20220710071117.446112-1-maskray@google.com>
References: <20220710071117.446112-1-maskray@google.com>
TO: Fangrui Song <maskray@google.com>
TO: Paul Walmsley <paul.walmsley@sifive.com>
TO: Palmer Dabbelt <palmer@dabbelt.com>
TO: Albert Ou <aou@eecs.berkeley.edu>
TO: linux-riscv@lists.infradead.org
CC: Khem Raj <raj.khem@gmail.com>
CC: linux-kernel@vger.kernel.org
CC: llvm@lists.linux.dev
CC: Fangrui Song <maskray@google.com>

Hi Fangrui,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v5.19-rc6 next-20220712]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Fangrui-Song/riscv-Pass-mno-relax-only-on-lld-15-0-0/20220710-151301
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git b1c428b6c3684ee8ddf4137d68b3e8d51d2a700f
config: riscv-rv32_defconfig (https://download.01.org/0day-ci/archive/20220713/202207131251.9wFgtqfN-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project e60b4fb2b777118c0ff664a6347851df14fcf75b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/9abe0b92e612c5b6c53d4658b46c60b75bbd39d3
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Fangrui-Song/riscv-Pass-mno-relax-only-on-lld-15-0-0/20220710-151301
        git checkout 9abe0b92e612c5b6c53d4658b46c60b75bbd39d3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: fs/built-in.a(nfs/nfs3xdr.o):(function decode_wcc_data: .text+0x2ec4): relocation R_RISCV_RVC_JUMP out of range: -1079 is not in [-1024, 1023]; references decode_fattr3
   >>> referenced by nfs3xdr.c
   >>> defined in fs/built-in.a(nfs/nfs3xdr.o)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
