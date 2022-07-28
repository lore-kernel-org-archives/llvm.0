Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1533C111F
	for <llvm@lists.linux.dev>; Thu, 28 Jul 2022 10:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659005169; x=1690541169;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7uJRvDAcHCy30dM45VNZMPhATy0oGXubOcK84tlXkBw=;
  b=ScwR20ZBHPzYoo/0yyAFIDtDjvbV7nzvAyYEj05StaFOfbJCmdveEkmS
   MfL6+WrUg5723AyYKOEV9xf0VJc9nOTHYWCVGHBO88zmxCgMU3Nfdo+H6
   Fr2PUgM9u8VD1VBWLW43Yy+90Xx2GHW9qe7Ven7/a8xUPmyaxP3bySoge
   ZjkbyVQh2PS6QXicEIEHmXJJMC9tEN42DCKNwLRrjgIZRL7WyQau3vPZN
   5az5zDVcX/AA2SLJNtMlQ3+j1y5n9BJM/D/ebLe/rQQHrB32ARWcA8Pgj
   qsVTU1VwNguSFbx9DyX2taOTItPnZBPpVoALLgLE51vzYHKOjheheNN6c
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10421"; a="268245500"
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; 
   d="scan'208";a="268245500"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2022 03:46:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; 
   d="scan'208";a="690252757"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 28 Jul 2022 03:46:06 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oH11p-0009uc-2j;
	Thu, 28 Jul 2022 10:46:05 +0000
Date: Thu, 28 Jul 2022 18:45:46 +0800
From: kernel test robot <lkp@intel.com>
To: Kalesh Singh <kaleshsingh@google.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org, Marc Zyngier <maz@kernel.org>,
	Fuad Tabba <tabba@google.com>
Subject: [arm-platforms:kvm-arm64/nvhe-stacktrace 9/23]
 arch/arm64/kvm/hyp/nvhe/stacktrace.c:46:6: warning: no previous prototype
 for function 'kvm_nvhe_prepare_backtrace'
Message-ID: <202207281846.DnXvmsdC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/nvhe-stacktrace
head:   a4c750e2328a117dc9b19a2a61db0d4347902029
commit: 879e5ac7b2e4db05799a905b5a07fc9e5dedf651 [9/23] KVM: arm64: Prepare non-protected nVHE hypervisor stacktrace
config: arm64-buildonly-randconfig-r003-20220728 (https://download.01.org/0day-ci/archive/20220728/202207281846.DnXvmsdC-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 8dfaecc4c24494337933aff9d9166486ca0949f1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/commit/?id=879e5ac7b2e4db05799a905b5a07fc9e5dedf651
        git remote add arm-platforms https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git
        git fetch --no-tags arm-platforms kvm-arm64/nvhe-stacktrace
        git checkout 879e5ac7b2e4db05799a905b5a07fc9e5dedf651
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/kvm/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp/nvhe/stacktrace.c:46:6: warning: no previous prototype for function 'kvm_nvhe_prepare_backtrace' [-Wmissing-prototypes]
   void kvm_nvhe_prepare_backtrace(unsigned long fp, unsigned long pc)
        ^
   arch/arm64/kvm/hyp/nvhe/stacktrace.c:46:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void kvm_nvhe_prepare_backtrace(unsigned long fp, unsigned long pc)
   ^
   static 
   1 warning generated.


vim +/kvm_nvhe_prepare_backtrace +46 arch/arm64/kvm/hyp/nvhe/stacktrace.c

    36	
    37	/*
    38	 * kvm_nvhe_prepare_backtrace - prepare to dump the nVHE backtrace
    39	 *
    40	 * @fp : frame pointer at which to start the unwinding.
    41	 * @pc : program counter at which to start the unwinding.
    42	 *
    43	 * Saves the information needed by the host to dump the nVHE hypervisor
    44	 * backtrace.
    45	 */
  > 46	void kvm_nvhe_prepare_backtrace(unsigned long fp, unsigned long pc)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
