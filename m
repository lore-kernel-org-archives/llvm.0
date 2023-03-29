Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76AE67B;
	Wed, 29 Mar 2023 01:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680053191; x=1711589191;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vmr09GSFFlVgt8I+ZiRFgG6DCgOmY538xijO4C08NlU=;
  b=gf2CTP27xLzzTcU9+Ly0s/A21cCK8MkJspquu9NuDzACbSF5rLaF1Foq
   zH667eRMDdydFqjqpzIgaxvB6NSpOXJyK93gHzExMOAHiBz9hhmWUQvtX
   Ra/3Bb9HcsanjvHJFH6+zFwfnlgihN9ttLvNHmdDm3nOPzPtdVgMtFgkt
   0FyH6UpZawoiOVTy/+c2f4CGrI315W7QbEO+aj7PC/wWxGcIA0CDRGdbo
   VxGyiEoFGCThJrHY+KZ1UDvUbqV0wICs05hfNqH8I2EZmv3Ii06XBVRc3
   HhkBkbrKxcHn7CiEVe6v8BuXwyVcFbw4q1iS8IfSsv2sRTi3FfZ73NOHg
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="403362426"
X-IronPort-AV: E=Sophos;i="5.98,299,1673942400"; 
   d="scan'208";a="403362426"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2023 18:26:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="795025103"
X-IronPort-AV: E=Sophos;i="5.98,299,1673942400"; 
   d="scan'208";a="795025103"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 28 Mar 2023 18:26:29 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phKa4-000J2l-1h;
	Wed, 29 Mar 2023 01:26:28 +0000
Date: Wed, 29 Mar 2023 09:25:41 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/030-misc 19/19] error[E0405]: cannot find trait
 `Tuple` in module `core::marker`
Message-ID: <202303290931.P56he0AX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/030-misc
head:   1b63a4ae14541e2a3f7e037f9832684e25d8d1d5
commit: 1b63a4ae14541e2a3f7e037f9832684e25d8d1d5 [19/19] rust: Fixes for 1.67.0
config: x86_64-randconfig-a012-20230327 (https://download.01.org/0day-ci/archive/20230329/202303290931.P56he0AX-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/AsahiLinux/linux/commit/1b63a4ae14541e2a3f7e037f9832684e25d8d1d5
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux bits/030-misc
        git checkout 1b63a4ae14541e2a3f7e037f9832684e25d8d1d5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303290931.P56he0AX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0405]: cannot find trait `Tuple` in module `core::marker`
   --> rust/alloc/boxed.rs:1872:26
   |
   1872 | impl<Args: core::marker::Tuple, F: FnOnce<Args> + ?Sized, A: Allocator> FnOnce<Args> for Box<F, A> {
   |                          ^^^^^ not found in `core::marker`
--
>> error[E0405]: cannot find trait `Tuple` in module `core::marker`
   --> rust/alloc/boxed.rs:1881:26
   |
   1881 | impl<Args: core::marker::Tuple, F: FnMut<Args> + ?Sized, A: Allocator> FnMut<Args> for Box<F, A> {
   |                          ^^^^^ not found in `core::marker`
--
>> error[E0405]: cannot find trait `Tuple` in module `core::marker`
   --> rust/alloc/boxed.rs:1888:26
   |
   1888 | impl<Args: core::marker::Tuple, F: Fn<Args> + ?Sized, A: Allocator> Fn<Args> for Box<F, A> {
   |                          ^^^^^ not found in `core::marker`
--
>> error: aborting due to 3 previous errors

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
