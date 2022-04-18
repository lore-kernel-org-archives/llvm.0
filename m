Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD7DA56
	for <llvm@lists.linux.dev>; Mon, 18 Apr 2022 21:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650316017; x=1681852017;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=baJl18VyK9FhvLeoiPvBcknGOOkP/h2gpRs1hguq1Qc=;
  b=kSJQXnlbMSWY52MicCcQ+FrTLpKJQV9NjHkrLbtq5a3MoHDt7Ex1E/uF
   B/cxh9uD6kBRGF6+zdm40C4zxFlAb72eALoCEzwnRUb/1BqvkZfhq4Va0
   4kjPBsQkji4cy3rqyd/QeK/908dbCyKxy1tzRNTYJbaTD6Ylu4tgy90wH
   La3wp/i2uopLZ2KAGIGwKrkFVReDFyNKwZ/xoEiDUwSToGKOum7IPqsS3
   EE7iasPfxNL6AupFhzbjwc3ObjO/dN5i52D4zhJ6YiEiUUKiiWxe64XUn
   rYAoNkfxEUTop1a6WDRQH+LfKwpJBJ7Ua+7KqP0u04CS+5tLx0Hl+uSPQ
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10321"; a="288704793"
X-IronPort-AV: E=Sophos;i="5.90,270,1643702400"; 
   d="scan'208";a="288704793"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2022 14:06:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,270,1643702400"; 
   d="scan'208";a="701953798"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 18 Apr 2022 14:06:56 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ngYaF-0004yq-BO;
	Mon, 18 Apr 2022 21:06:55 +0000
Date: Tue, 19 Apr 2022 05:06:28 +0800
From: kernel test robot <lkp@intel.com>
To: Nathan Huckleberry <nhuck@google.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v4 7/8] crypto: arm64/polyval: Add PMULL accelerated
 implementation of POLYVAL
Message-ID: <202204190447.5PXNH4Km-lkp@intel.com>
References: <20220412172816.917723-8-nhuck@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220412172816.917723-8-nhuck@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Nathan,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on herbert-cryptodev-2.6/master]
[also build test WARNING on herbert-crypto-2.6/master linus/master v5.18-rc3 next-20220414]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Nathan-Huckleberry/crypto-HCTR2-support/20220413-013255
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20220419/202204190447.5PXNH4Km-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 429cbac0390654f90bba18a41799464adf31a5ec)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/014203529f7aef5a93602c31f9fee3ba9843619c
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Nathan-Huckleberry/crypto-HCTR2-support/20220413-013255
        git checkout 014203529f7aef5a93602c31f9fee3ba9843619c
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/crypto/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/arm64/crypto/polyval-ce-glue.c:229:33: warning: unused variable 'polyval_cpu_feature' [-Wunused-const-variable]
   static const struct cpu_feature polyval_cpu_feature[] = {
                                   ^
   1 warning generated.


vim +/polyval_cpu_feature +229 arch/arm64/crypto/polyval-ce-glue.c

   228	
 > 229	static const struct cpu_feature polyval_cpu_feature[] = {
   230		{ cpu_feature(PMULL) }, { }
   231	};
   232	MODULE_DEVICE_TABLE(cpu, polyval_cpu_feature);
   233	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
