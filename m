Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9F67E9
	for <llvm@lists.linux.dev>; Thu,  2 Jun 2022 08:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654157658; x=1685693658;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZPpYGe6r78Q9d9z1oR902j7J3lIleyepqBGzbQs6TiA=;
  b=jloZCBNs/VZyT3I7cBLq+T8cHlx3+etaPlwg0fO/g8v5NXEKtyT7kkq3
   rc2tscLOl7kkvI66ljyMMlSGsdGyahBLDQ+nCQk5/DCcTiZeS2SY997T/
   Vf15lO6Os+XorT2eIqb3DVXv/FM75ikjkz5ugyAbpzeZBgSaLT1YVISwd
   1pwn3hrXcmUAxL8yzacVJS6V/kJ3J9japeFtowtfn9obscSENS6Pf30kr
   aa934IRmuehtt4hOXfY0RXBCF7mqJh+9YCIE1gSPN8uUia+Xba90ue6ou
   jLh3aUfpPLewIMH2ADzXE4NtXbbs7iEnq1QLDfDvRSndm6XoIp4ADEcYq
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10365"; a="275881055"
X-IronPort-AV: E=Sophos;i="5.91,270,1647327600"; 
   d="scan'208";a="275881055"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2022 01:14:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,270,1647327600"; 
   d="scan'208";a="707460271"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 02 Jun 2022 01:14:16 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nwfyB-0004rl-Qy;
	Thu, 02 Jun 2022 08:14:15 +0000
Date: Thu, 2 Jun 2022 16:14:14 +0800
From: kernel test robot <lkp@intel.com>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH RFC 6/7] ext4: Enable negative dentries on
 case-insensitive lookup
Message-ID: <202206021623.iDro7upg-lkp@intel.com>
References: <20220601204437.676872-7-krisman@collabora.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220601204437.676872-7-krisman@collabora.com>

Hi Gabriel,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on tytso-ext4/dev]
[also build test ERROR on jaegeuk-f2fs/dev-test linus/master v5.18 next-20220602]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Gabriel-Krisman-Bertazi/Support-negative-dentries-on-case-insensitive-directories/20220602-045701
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
config: x86_64-randconfig-a012 (https://download.01.org/0day-ci/archive/20220602/202206021623.iDro7upg-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b364c76683f8ef241025a9556300778c07b590c2)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/db089738c1bb7cfe1cd4be09ba3c6eed1a9cd1ac
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Gabriel-Krisman-Bertazi/Support-negative-dentries-on-case-insensitive-directories/20220602-045701
        git checkout db089738c1bb7cfe1cd4be09ba3c6eed1a9cd1ac
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "d_set_casefold_lookup" [fs/ext4/ext4.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
