Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE642F27
	for <llvm@lists.linux.dev>; Wed, 20 Jul 2022 10:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658313627; x=1689849627;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2Be84nfHoamYk4O88e44NC5hzJgWZE5PhyB/bLBJjlk=;
  b=YeHU/o3+BHzkbVeUjYZc0HXuGrStFnx+9dS3JUQea5Zus+bc3NByXZO0
   /TVOQfMYmq/kEszBW6+b3jLoTDp38XQZd49I4JQLv2kRcb1SNBdA2ODmg
   XS14K6d2lO2odslul+Mkp3Sj87RbLFFYVH/DTIt6eMIwkFbA3SI0mIBk4
   AYrFvQDLyeXA/vEYYFvU6LqXbMInJ/pq+zAXNuyLzEEFmsozwVsn/AAhQ
   i1kmuXFwrhZLvmzzkbTDUkpCCIPrboi+TF7QJBlw18ZmrVs4a4eBN+qAM
   b0vmSyOnusuGAljkh9zHvd17Q+dG3+MTTE7v9WwJmK23XGpo12IvbhpAm
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10413"; a="273579383"
X-IronPort-AV: E=Sophos;i="5.92,286,1650956400"; 
   d="scan'208";a="273579383"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2022 03:40:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,286,1650956400"; 
   d="scan'208";a="665811561"
Received: from lkp-server01.sh.intel.com (HELO 7dfbdc7c7900) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 20 Jul 2022 03:40:26 -0700
Received: from kbuild by 7dfbdc7c7900 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oE77x-0000Ol-DM;
	Wed, 20 Jul 2022 10:40:25 +0000
Date: Wed, 20 Jul 2022 18:39:31 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [jpoimboe:lkdtm 3/3] <instantiation>:2:2: error: invalid instruction
 mnemonic 'annotate_unret_end'
Message-ID: <202207201802.x51rFnWQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git lkdtm
head:   52f6baa0ba22720e50aae086637b5b032fdea58a
commit: 52f6baa0ba22720e50aae086637b5b032fdea58a [3/3] objtool: move retpoline and unret annotations to objtool.h
config: i386-buildonly-randconfig-r004-20220718 (https://download.01.org/0day-ci/archive/20220720/202207201802.x51rFnWQ-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project fa0c7639e91fa1cd0cf2ff0445a1634a90fe850a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git/commit/?id=52f6baa0ba22720e50aae086637b5b032fdea58a
        git remote add jpoimboe https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git
        git fetch --no-tags jpoimboe lkdtm
        git checkout 52f6baa0ba22720e50aae086637b5b032fdea58a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> <instantiation>:2:2: error: invalid instruction mnemonic 'annotate_unret_end'
    ANNOTATE_UNRET_END
    ^~~~~~~~~~~~~~~~~~
   arch/x86/kvm/svm/vmenter.S:120:2: note: while in macro instantiation
    UNTRAIN_RET
    ^
>> <instantiation>:2:2: error: invalid instruction mnemonic 'annotate_unret_end'
    ANNOTATE_UNRET_END
    ^~~~~~~~~~~~~~~~~~
   arch/x86/kvm/svm/vmenter.S:209:2: note: while in macro instantiation
    UNTRAIN_RET
    ^

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
