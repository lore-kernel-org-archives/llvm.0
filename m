Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D999636
	for <llvm@lists.linux.dev>; Tue, 28 Jun 2022 20:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656448594; x=1687984594;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LLpjV/n09Le7C4sSxRt4nmp7B4TOejGA02DeFSXr69Y=;
  b=VaGACfUcLrGlHJjLkZai+c4VWjcaULOc3RBM8zuBCZar3rj4KnzveqpF
   fFpYkQ9kBZvnGH8abBR2+te13BHrpjdFWBts/q1T9KVs1O7iCHsGELuyK
   PcdPN5kz4JdKB/3ItOSEOMr6+dJhWZEo38s8Hl5x8oI21wiyNMQX5zapI
   gPH0z9HaarV7pUoyxw44aFUZXFdc4kmpzHvn024cegyuxuN5zDSlOriTC
   hpfslaZrqeblvI+8YF0IwMRcGk+xvCRsG+XdVg7Q9VK5itSfeBxYNDJWu
   74DDOGMxQhbA9e8I4ykXfvA8dnRDtW58riFwPOmRNjx2Lvv5YGROBODmE
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10392"; a="264882651"
X-IronPort-AV: E=Sophos;i="5.92,229,1650956400"; 
   d="scan'208";a="264882651"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2022 13:36:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,229,1650956400"; 
   d="scan'208";a="917319796"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 28 Jun 2022 13:36:31 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o6Hwl-000Aas-6f;
	Tue, 28 Jun 2022 20:36:31 +0000
Date: Wed, 29 Jun 2022 04:36:13 +0800
From: kernel test robot <lkp@intel.com>
To: "Jason A. Donenfeld" <zx2c4@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [zx2c4:master 9/10] ERROR: modpost: "wake_up_state"
 [drivers/char/hw_random/rng-core.ko] undefined!
Message-ID: <202206290408.ua4IX9mh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/zx2c4/linux.git master
head:   9b3548a2475866d26bdeee84d62eecf1bc94d22a
commit: 78223ae64136d911588115c6c317a31305100ce4 [9/10] ath9k: let sleep be interrupted when unregistering hwrng
config: i386-randconfig-a003-20220627 (https://download.01.org/0day-ci/archive/20220629/202206290408.ua4IX9mh-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project df18167ac56d05f2ab55f9d874aee7ab6d5bc9a2)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/zx2c4/linux.git/commit/?id=78223ae64136d911588115c6c317a31305100ce4
        git remote add zx2c4 https://git.kernel.org/pub/scm/linux/kernel/git/zx2c4/linux.git
        git fetch --no-tags zx2c4 master
        git checkout 78223ae64136d911588115c6c317a31305100ce4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "wake_up_state" [drivers/char/hw_random/rng-core.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
