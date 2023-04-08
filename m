Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4B5EDE;
	Sat,  8 Apr 2023 00:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680914658; x=1712450658;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m1t3rC86Qw2U2jYpF1IB+S/rmx37YNL5eBWegDMIipA=;
  b=W8TEWJO0XG53iIboEu78JdD/qn5g42zsrbqNtIqd2tiIHI69meyw2SGx
   sw9rOp936/XqFL4AHdVvzoeSp1/vG54xCHsibeKX3ANNx/qDyzmonsTAp
   em+gk+EIO5PwH7D3SMs7rpWzYXTTKaUAxZgKj/ylnbi2UyO5ttXcn91yH
   hLeo9DLncHiX8QoST/+y3DSC3qXGo8C0jVvNIbE1o2eiJ1jMcXRywUx67
   HNIpVPJqj/IarNqZ5BEdG2VjXSkh/AjZPaP5OCs3MYbwGBRej1Eufhgl7
   nL9885suY9FiorX1mC3XDXLF4Jy2oXuJ/2tvH5QNEyAeq+sxx3llBw0KG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="331750883"
X-IronPort-AV: E=Sophos;i="5.98,328,1673942400"; 
   d="scan'208";a="331750883"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 17:44:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="637865901"
X-IronPort-AV: E=Sophos;i="5.98,328,1673942400"; 
   d="scan'208";a="637865901"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 07 Apr 2023 17:44:16 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkwgh-000T53-16;
	Sat, 08 Apr 2023 00:44:15 +0000
Date: Sat, 8 Apr 2023 08:43:37 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/210-gpu 71/135] rust/helpers.c:317:9: error:
 implicit declaration of function 'of_node_is_root' is invalid in C99
Message-ID: <202304080837.MsJV7k5G-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/210-gpu
head:   b77ed23d7d093f7ce5d31c84b70282467321abe8
commit: 694fb974d50dded57d8ae42487c6486bfd374b35 [71/135] rust: kernel: platform: Add Device.set_dma_masks()
config: x86_64-randconfig-a004-20230403 (https://download.01.org/0day-ci/archive/20230408/202304080837.MsJV7k5G-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/AsahiLinux/linux/commit/694fb974d50dded57d8ae42487c6486bfd374b35
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux bits/210-gpu
        git checkout 694fb974d50dded57d8ae42487c6486bfd374b35
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304080837.MsJV7k5G-lkp@intel.com/

All errors (new ones prefixed by >>):

>> rust/helpers.c:317:9: error: implicit declaration of function 'of_node_is_root' is invalid in C99 [-Wimplicit-function-declaration]
>> rust/helpers.c:317:9: error: implicit declaration of function 'of_node_is_root' is invalid in C99 [-Wimplicit-function-declaration], err: true
   thread 'main' panicked at 'Unable to generate bindings: ()', /opt/cross/rustc-1.66.0-bindgen-0.56.0/cargo/registry/src/github.com-1ecc6299db9ec823/bindgen-0.56.0/src/main.rs:54:36
   note: run with `RUST_BACKTRACE=1` environment variable to display a backtrace
   make[2]: *** [rust/Makefile:311: rust/bindings/bindings_helpers_generated.rs] Error 1
   make[2]: *** Deleting file 'rust/bindings/bindings_helpers_generated.rs'
   make[2]: Target 'rust/' not remade because of errors.
   make[1]: *** [Makefile:1304: prepare] Error 2
   make: *** [Makefile:242: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/of_node_is_root +317 rust/helpers.c

5cbe9841e92bc7 Asahi Lina 2023-02-16  314  
578c008c65bf4b Asahi Lina 2022-10-22  315  bool rust_helper_of_node_is_root(const struct device_node *np)
578c008c65bf4b Asahi Lina 2022-10-22  316  {
578c008c65bf4b Asahi Lina 2022-10-22 @317  	return of_node_is_root(np);
578c008c65bf4b Asahi Lina 2022-10-22  318  }
578c008c65bf4b Asahi Lina 2022-10-22  319  EXPORT_SYMBOL_GPL(rust_helper_of_node_is_root);
578c008c65bf4b Asahi Lina 2022-10-22  320  

:::::: The code at line 317 was first introduced by commit
:::::: 578c008c65bf4bc078b4adbdb229c3f4cd352329 rust: of: Add OF node abstraction

:::::: TO: Asahi Lina <lina@asahilina.net>
:::::: CC: Hector Martin <marcan@marcan.st>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
