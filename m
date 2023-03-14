Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF91E17C6;
	Tue, 14 Mar 2023 02:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678761910; x=1710297910;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J+MvpizyMtottSJywiWH44TA6E5lhQ8gIaxjKzWp/Dg=;
  b=D22pggF4x/INKyXZPPyLpImjZz92B0ut2I+0zM5vYHG/aEZ49bs57AEn
   X+sFkiIxZS8kck9Bpn+v0yVLKSutOwckq3vVIJj0wB3N4kKEfuLyXFRsT
   g0PFKtN3Ir70avtxSqejnvLNf+iPMIE7uAmp2If5KLZSzUTqGGXbqC0dt
   ExOifqE6D6Wb9hkeoVa619ME8zgRg+Pef45zw6elxq0CNpgzY+fwJvR2H
   3er2r5G28mRVV6xZesnfS8su/CMmUQWW37hjKht9fei0COy3xBG+LN9RW
   Y21MFl0rldEXUw35HCtBUZ3LlhZmQgGXfXRcqsJVCCAiM/L5SZic0keWo
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="339679200"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400"; 
   d="scan'208";a="339679200"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2023 19:45:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="681256703"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400"; 
   d="scan'208";a="681256703"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 13 Mar 2023 19:45:08 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pbuey-0006QE-1K;
	Tue, 14 Mar 2023 02:45:08 +0000
Date: Tue, 14 Mar 2023 10:44:09 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	devel@driverdev.osuosl.org
Subject: [driver-core:bus_cleanup 21/43]
 arch/powerpc/sysdev/fsl_mpic_timer_wakeup.c:129:6: warning: variable 'ret'
 is used uninitialized whenever 'if' condition is false
Message-ID: <202303141045.1U4Clxw2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git bus_cleanup
head:   93dbc63c47e682ba8a493cbfc09c2c4c8e88f17b
commit: 5e5da678273d6d28c4665e48608747c6ed8270dd [21/43] powerpc/fsl: move to use bus_get_dev_root()
config: powerpc-buildonly-randconfig-r004-20230313 (https://download.01.org/0day-ci/archive/20230314/202303141045.1U4Clxw2-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git/commit/?id=5e5da678273d6d28c4665e48608747c6ed8270dd
        git remote add driver-core https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git
        git fetch --no-tags driver-core bus_cleanup
        git checkout 5e5da678273d6d28c4665e48608747c6ed8270dd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash arch/powerpc/sysdev/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303141045.1U4Clxw2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/powerpc/sysdev/fsl_mpic_timer_wakeup.c:129:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
           if (dev_root) {
               ^~~~~~~~
   arch/powerpc/sysdev/fsl_mpic_timer_wakeup.c:136:9: note: uninitialized use occurs here
           return ret;
                  ^~~
   arch/powerpc/sysdev/fsl_mpic_timer_wakeup.c:129:2: note: remove the 'if' if its condition is always true
           if (dev_root) {
           ^~~~~~~~~~~~~~
   arch/powerpc/sysdev/fsl_mpic_timer_wakeup.c:120:9: note: initialize the variable 'ret' to silence this warning
           int ret;
                  ^
                   = 0
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_SOC_MPC5200_AC97
   Depends on [n]: SOUND [=y] && !UML && SND [=m] && SND_SOC [=m] && SND_POWERPC_SOC [=m] && PPC_MPC52xx [=y] && PPC_BESTCOMM [=n]
   Selected by [m]:
   - SND_MPC52xx_SOC_PCM030 [=m] && SOUND [=y] && !UML && SND [=m] && SND_SOC [=m] && SND_POWERPC_SOC [=m] && PPC_MPC5200_SIMPLE [=y]
   - SND_MPC52xx_SOC_EFIKA [=m] && SOUND [=y] && !UML && SND [=m] && SND_SOC [=m] && SND_POWERPC_SOC [=m] && PPC_EFIKA [=y]


vim +129 arch/powerpc/sysdev/fsl_mpic_timer_wakeup.c

   113	
   114	static struct device_attribute mpic_attributes = __ATTR(timer_wakeup, 0644,
   115				fsl_timer_wakeup_show, fsl_timer_wakeup_store);
   116	
   117	static int __init fsl_wakeup_sys_init(void)
   118	{
   119		struct device *dev_root;
   120		int ret;
   121	
   122		fsl_wakeup = kzalloc(sizeof(struct fsl_mpic_timer_wakeup), GFP_KERNEL);
   123		if (!fsl_wakeup)
   124			return -ENOMEM;
   125	
   126		INIT_WORK(&fsl_wakeup->free_work, fsl_free_resource);
   127	
   128		dev_root = bus_get_dev_root(&mpic_subsys);
 > 129		if (dev_root) {
   130			ret = device_create_file(dev_root, &mpic_attributes);
   131			put_device(dev_root);
   132			if (ret)
   133				kfree(fsl_wakeup);
   134		}
   135	
   136		return ret;
   137	}
   138	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
