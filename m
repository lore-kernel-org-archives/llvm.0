Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5032918;
	Sun, 19 Feb 2023 18:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676832523; x=1708368523;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TM8EH88/0D/E4e/ZTZf/WxrFjrEyHSAdi/pLgRPiRTg=;
  b=Iwef6fRH4bocxHGtUd5FG0SvSIXaS+DLXF6WNVdKOc4i9wZcY54FvAUv
   B7PmE/DzMLczNDqIQKegO72RUb9Ff1aQTNvC8KaLaFfEuwmsUO8Ye5KeN
   fxMd+YkHPBKUMtmzbpDLrH1jPDZCvhikL316Wixw+WmrGp4mKPzAEgGfU
   9QWo9O1RjcBoXlqhJ/mMqTUjAwtilF/VzJmz9dvEma5KHlamTrXdIqWLi
   lAgLldKf/2lXaauA+U8Z7MckIWP/NIl8oZpV3XXi7yYjisDSJvbPs1faM
   HCP5DgaYnkMYqlQcdOCW2p10QGEKfKbxJtR2EJRtLq57oQgQAVgN0hDii
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="396958808"
X-IronPort-AV: E=Sophos;i="5.97,310,1669104000"; 
   d="scan'208";a="396958808"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2023 10:48:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="701464446"
X-IronPort-AV: E=Sophos;i="5.97,310,1669104000"; 
   d="scan'208";a="701464446"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 19 Feb 2023 10:48:42 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTojp-000DPl-1a;
	Sun, 19 Feb 2023 18:48:41 +0000
Date: Mon, 20 Feb 2023 02:47:42 +0800
From: kernel test robot <lkp@intel.com>
To: Sven Peter <sven@svenpeter.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:atcphy-20230219 51/54] drivers/pci/probe.c:6:9: warning:
 'DEBUG' macro redefined
Message-ID: <202302200203.13zAgazc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux atcphy-20230219
head:   9928386c36c8def0becc6ce2db8f18f2111f9b3c
commit: 602347e80274cae6b71dfd3a86613454d806ec34 [51/54] enable debug in various places
config: riscv-randconfig-r002-20230219 (https://download.01.org/0day-ci/archive/20230220/202302200203.13zAgazc-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/AsahiLinux/linux/commit/602347e80274cae6b71dfd3a86613454d806ec34
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux atcphy-20230219
        git checkout 602347e80274cae6b71dfd3a86613454d806ec34
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/pci/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302200203.13zAgazc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/probe.c:6:9: warning: 'DEBUG' macro redefined [-Wmacro-redefined]
   #define DEBUG
           ^
   <command line>:5:9: note: previous definition is here
   #define DEBUG 1
           ^
   1 warning generated.
--
>> drivers/pci/probe.c:6:9: warning: 'DEBUG' macro redefined [-Wmacro-redefined]
   #define DEBUG
           ^
   <command line>:6:9: note: previous definition is here
   #define DEBUG 1
           ^
   1 warning generated.


vim +/DEBUG +6 drivers/pci/probe.c

   > 6	#define DEBUG
     7	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
