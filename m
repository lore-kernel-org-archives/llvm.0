Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0A31990C;
	Tue,  9 May 2023 23:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683674820; x=1715210820;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vVNlToeHUO9ucymTPnn/D6S4KaZX4Tlpv+SdrhlB5ww=;
  b=nfG1F4nG0RVEUrU1Jziyf7U39VhFcyCmGe06p5ZW70pLZtuaUkMJCNca
   ejF7sH4k9ken5AdcMR66N04kBlrbmebPO+0fp6cloapGY7xzHox/lbhy0
   reFnm/kaicGPcVSeCkz//kNJo3cvcPuiwFmXr5+jNUCn+bqMswhH524px
   0+0j/DJZLJqZYjBBFJ0DllS/nnM1/vyzrnJXPmkh3c7fS5ESeRTIssA4P
   g7JEtPTHmdqfgacmqjkmphY1f7H7M9qD/BhZf4TXt6/uxhhoVc01Ns/LV
   Cd0dvNknrPf9gUMjUpHs4SoRv1B602Q4LfSy3uD34f4eqbMN/8qCGPOyq
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="353146055"
X-IronPort-AV: E=Sophos;i="5.99,263,1677571200"; 
   d="scan'208";a="353146055"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2023 16:26:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="945470408"
X-IronPort-AV: E=Sophos;i="5.99,263,1677571200"; 
   d="scan'208";a="945470408"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 09 May 2023 16:26:55 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwWjO-0002cL-2q;
	Tue, 09 May 2023 23:26:54 +0000
Date: Wed, 10 May 2023 07:26:15 +0800
From: kernel test robot <lkp@intel.com>
To: Dexuan Cui <decui@microsoft.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Michael Kelley <mikelley@microsoft.com>
Subject: [dcui-tdx:decui/mainline/v6-dda 7/13] ld.lld: error: undefined
 symbol: __tdx_hypercall_ret
Message-ID: <202305100728.XrMlaAIY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/dcui/tdx decui/mainline/v6-dda
head:   cef8eab38588585b3c876df8d1ccf5831a6bf54f
commit: 1c59d1571537c077052140d61589c8851b3e4fd2 [7/13] x86/hyperv: Support hypercalls for TDX guests
config: x86_64-randconfig-a001-20230508 (https://download.01.org/0day-ci/archive/20230510/202305100728.XrMlaAIY-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/dcui/tdx/commit/1c59d1571537c077052140d61589c8851b3e4fd2
        git remote add dcui-tdx https://github.com/dcui/tdx
        git fetch --no-tags dcui-tdx decui/mainline/v6-dda
        git checkout 1c59d1571537c077052140d61589c8851b3e4fd2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305100728.XrMlaAIY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __tdx_hypercall_ret
   >>> referenced by ivm.c:427 (arch/x86/hyperv/ivm.c:427)
   >>>               arch/x86/hyperv/ivm.o:(hv_tdx_hypercall) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
