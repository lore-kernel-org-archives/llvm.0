Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047967A
	for <llvm@lists.linux.dev>; Sun, 12 Jun 2022 12:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655036348; x=1686572348;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sLBZBvK11VBMSoNl2Oiecb+z1RGenIBzp2JmMO+TJfQ=;
  b=EtuQ7YS56jrXztchwAkM9EuWqJPpB4ssm3KL1EedW3lND1VmuGRpBYKi
   rQLkTE22rpAKoi1GE+HtDrtASIpyyilxYs0k2E5NTINDAjHBgBLVydRZL
   S/HirNeudwBa8yR+uqOEwGzCyZxzq9WBW2fI+Jz7DQqhCouznMfc+kMDc
   8o0un0XLIPiKOccEYTPrXHZE+Js+RheD+lD15FABFH9b4DGVinMnvQW1u
   zDG4TwV9wQ4PmbUcD1Bw2BUVlB6OQEL3mEGiAE3q7gNJ6Neq5eHXn/IGz
   YButK/cy8ZsWpoXrGFFFQV8QLzIX4AKgrOFKz4Hb4GLjk5w6L6L+DbhTC
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10375"; a="339731909"
X-IronPort-AV: E=Sophos;i="5.91,294,1647327600"; 
   d="scan'208";a="339731909"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2022 05:19:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,294,1647327600"; 
   d="scan'208";a="587233000"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 12 Jun 2022 05:19:06 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o0MYc-000Ju5-Bf;
	Sun, 12 Jun 2022 12:19:06 +0000
Date: Sun, 12 Jun 2022 20:18:10 +0800
From: kernel test robot <lkp@intel.com>
To: Dominique Martinet <asmadeus@codewreck.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [martinetd:9p-next 11/13] ERROR: modpost: "p9_fid_put" [fs/9p/9p.ko]
 undefined!
Message-ID: <202206122057.RBESqurT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/martinetd/linux.git 9p-next
head:   9bb9cdaaa704d542e2fca976fa17f80f769fc341
commit: 6334def2e0b55439c8d86b769b23c03fb79f8ec4 [11/13] 9p fid refcount: add p9_fid_get/put wrappers
config: i386-randconfig-a015 (https://download.01.org/0day-ci/archive/20220612/202206122057.RBESqurT-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 6466c9abf3674bade1f6ee859f24ebc7aaf9cd88)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/martinetd/linux/commit/6334def2e0b55439c8d86b769b23c03fb79f8ec4
        git remote add martinetd https://github.com/martinetd/linux.git
        git fetch --no-tags martinetd 9p-next
        git checkout 6334def2e0b55439c8d86b769b23c03fb79f8ec4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "p9_fid_put" [fs/9p/9p.ko] undefined!
>> ERROR: modpost: "p9_fid_get" [fs/9p/9p.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
