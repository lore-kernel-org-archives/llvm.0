Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4EA7A
	for <llvm@lists.linux.dev>; Wed,  9 Mar 2022 05:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646803737; x=1678339737;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Nu2WxIggiNPVjjNfuM5deMMlqTtROYrGu670/znHKJ0=;
  b=HH6e4iXsdt4Bak1fThYXqw1HUN595AGzZnbijrQ9KRet/LAPfOLBxMm9
   WV30a3xYAxxrG1w4vHYTSxkhKuqFdiJjCJ/lko8XMmuT1vIHcqKdyNJ66
   pdrwtDumgaBYj+pa9N/qBZln0MGGNbgSrTzkD/O7HHT+xBfwXk2fGGlqm
   EzjFgUh7b8r9AcdIkzujdB1aiIzsWTxU85nZquQ8BC1lQpAcnkgf2dFsr
   XTzTJeFpdnd+z3WrUQcDLvldAVPPg12cacLtAQMyOwvXRkpyAoLeEc5E8
   xY80rHfC8b0y/mexNMNTgPbx9oRh+BVioh4r74rh+PFy7URoqa+zCPSEu
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="253722627"
X-IronPort-AV: E=Sophos;i="5.90,166,1643702400"; 
   d="scan'208";a="253722627"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2022 21:28:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,166,1643702400"; 
   d="scan'208";a="711810188"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 08 Mar 2022 21:28:52 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nRosW-0002ef-5j; Wed, 09 Mar 2022 05:28:52 +0000
Date: Wed, 9 Mar 2022 13:28:14 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [linux-stable-rc:queue/5.4 1059/9999] arch/x86/xen/enlighten_pv.o:
 warning: objtool: xen_cpuid()+0x180: can't find jump dest instruction at
 .text+0x277
Message-ID: <202203091306.V8INj4uJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

BCC: lkp@intel.com
CC: linux-kernel@vger.kernel.org
TO: Josh Poimboeuf <jpoimboe@redhat.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Borislav Petkov <bp@suse.de>
CC: Sasha Levin <sashal@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git queue/5.4
head:   e53e4ce486167f8081d88b2008748b6112170bd4
commit: d85044145fdd791ea391fb0b09c9c036a7b02146 [1059/9999] objtool: Fix noreturn detection for ignored functions
config: x86_64-randconfig-c007-20220307 (https://download.01.org/0day-ci/archive/20220309/202203091306.V8INj4uJ-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=d85044145fdd791ea391fb0b09c9c036a7b02146
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc queue/5.4
        git checkout d85044145fdd791ea391fb0b09c9c036a7b02146
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/x86/xen/enlighten_pv.o: warning: objtool: xen_cpuid()+0x180: can't find jump dest instruction at .text+0x277

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
