Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077C9321E;
	Thu,  9 Feb 2023 06:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675925982; x=1707461982;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QP3sphyhKZ++uLX1gEjWhEO0Q7JTq76YEL6G5FR4nqs=;
  b=KCRGsStMrGGsdwUp/nhCTPe2tWY53LAuc/Yzz+iC4ExTLWB2AsAvMYiT
   15Z16endJMJ+jVadGlTvxNNe4Lpjb+sSW0R23TVzn6MbdbpimX/aZ/A7L
   pIBYqW1T8NXZCOq4zpa74ZucRdoUec2loC1sQqx+QAlYAccyUumuvaFMw
   loRhlzVUJOFMohbbew531HRG/jNzS9QAw10biHRgYInGkhBaG4kpSEOVn
   oxBNpIyIytOcAqU+wRuefNwsWNN2d8709gjVCEfjKlqML6VOX50SnH9BJ
   A8wASTSEe2i5WfWh6rRTa8o4cO8tt4IoQoqsc8Kv8hTS417UmzwHgZCKG
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="394625704"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; 
   d="scan'208";a="394625704"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2023 22:59:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="697920740"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; 
   d="scan'208";a="697920740"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 08 Feb 2023 22:59:28 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQ0tz-0004tU-1q;
	Thu, 09 Feb 2023 06:59:27 +0000
Date: Thu, 9 Feb 2023 14:59:26 +0800
From: kernel test robot <lkp@intel.com>
To: Kalesh Singh <kaleshsingh@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
	Fuad Tabba <tabba@google.com>
Subject: arch/arm64/kvm/hyp/nvhe/stacktrace.c:46:6: warning: no previous
 prototype for function 'kvm_nvhe_prepare_backtrace'
Message-ID: <202302091437.1vnXBd7s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kalesh,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0983f6bf2bfc0789b51ddf7315f644ff4da50acb
commit: 879e5ac7b2e4db05799a905b5a07fc9e5dedf651 KVM: arm64: Prepare non-protected nVHE hypervisor stacktrace
date:   7 months ago
config: arm64-randconfig-r022-20230209 (https://download.01.org/0day-ci/archive/20230209/202302091437.1vnXBd7s-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db0e6591612b53910a1b366863348bdb9d7d2fb1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=879e5ac7b2e4db05799a905b5a07fc9e5dedf651
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 879e5ac7b2e4db05799a905b5a07fc9e5dedf651
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302091437.1vnXBd7s-lkp@intel.com

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
https://github.com/intel/lkp-tests
