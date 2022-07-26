Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B965381
	for <llvm@lists.linux.dev>; Tue, 26 Jul 2022 16:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658852864; x=1690388864;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9GjBYPlA9XVY6pF0hk2l5Vagf5etwclc7jAQNZ1TZC0=;
  b=QPGQgpDkGvaZv/CBHG+lpMqXQzVW/lWj1JHxq58qwX+hapzD1Y2Fkm0Y
   2R7GeC09KyrGsaJcqOhXqXuPUleI2Pppj2TrOTy/HS42QGPBXZYDHsXjp
   J+zoVP7hek7QEgVsJIKf+tE2YBd15u2lfxfNSSAUlHSTj/JJx/uOhlNT7
   zlZg9pIXN1+rO/3/qGUrzhUgbueTuYLMNs/pJNF92yZ49VyGUCBTySZn/
   3BWQg36R+nraHf4V7CP9ayALGn7RJ+c65vOuuTSQDXF/8NdjbyrAr+Ogz
   XIVbmRLEta9PFA+6w9vqQJW9kTfXBfAUCggJtoECfwGm6rl4HavChSxSv
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10420"; a="271035826"
X-IronPort-AV: E=Sophos;i="5.93,194,1654585200"; 
   d="scan'208";a="271035826"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2022 09:27:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,194,1654585200"; 
   d="scan'208";a="927398481"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 26 Jul 2022 09:27:41 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oGNPI-0007D0-31;
	Tue, 26 Jul 2022 16:27:41 +0000
Date: Wed, 27 Jul 2022 00:26:45 +0800
From: kernel test robot <lkp@intel.com>
To: Kalesh Singh <kaleshsingh@google.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v6 09/17] KVM: arm64: Prepare non-protected nVHE
 hypervisor stacktrace
Message-ID: <202207270011.GnBElFk7-lkp@intel.com>
References: <20220726073750.3219117-10-kaleshsingh@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220726073750.3219117-10-kaleshsingh@google.com>

Hi Kalesh,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on 82a592c13b0aeff94d84d54183dae0b26384c95f]

url:    https://github.com/intel-lab-lkp/linux/commits/Kalesh-Singh/KVM-nVHE-Hypervisor-stack-unwinder/20220726-154355
base:   82a592c13b0aeff94d84d54183dae0b26384c95f
config: arm64-buildonly-randconfig-r006-20220724 (https://download.01.org/0day-ci/archive/20220727/202207270011.GnBElFk7-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 83882606dbd7ffb0bdd3460356202d97705809c8)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/adb3292a8f22d642d40a5f2f649592a1961fa7da
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Kalesh-Singh/KVM-nVHE-Hypervisor-stack-unwinder/20220726-154355
        git checkout adb3292a8f22d642d40a5f2f649592a1961fa7da
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/

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
