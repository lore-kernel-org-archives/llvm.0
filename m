Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14344360;
	Sat, 29 Apr 2023 09:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682759940; x=1714295940;
  h=date:from:cc:subject:message-id:mime-version;
  bh=C9roh1onm5l/yUnBl07e/i/H8cnW6hZkszYvhIiuGmY=;
  b=mgxZeGekAddZLypazBpM0lZFUjr1hP+sryXMux6pV3531w7N9JdIVC4k
   PR9MNk4aNZG2U8eSZd8yDLGiHuPzru1ab8PXGQhikqvw9i2XnQ0K2q4V7
   hX7K1acr+D5oqq/Fro4p8gQrTT+H3Bmc0nbQ6ZBhkLyoLfrcqah5HqHXs
   SfXoNekncSEBjWvZCeDEtv1/iuZc6ChUCYH8D8VaTeXzfSBCRUDh3cS/A
   x5o0QPf5JrlMSznGYdybm2pcK5kvv2kW9I1O9P6LIXs1q3nYLO3zVCjxh
   qjnyjoGwmPWkhkKHAzTEWm7znkP2QFv37fadEiOC5Na9YYm2sPf83nupR
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="332255031"
X-IronPort-AV: E=Sophos;i="5.99,236,1677571200"; 
   d="scan'208";a="332255031"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2023 02:18:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="695122384"
X-IronPort-AV: E=Sophos;i="5.99,236,1677571200"; 
   d="scan'208";a="695122384"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 29 Apr 2023 02:18:58 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psgjK-00011d-07;
	Sat, 29 Apr 2023 09:18:58 +0000
Date: Sat, 29 Apr 2023 17:18:18 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [stable:linux-5.4.y 5552/8186] arch/x86/entry/entry_64.o: warning:
 objtool: If this is a retpoline, please patch it in with alternatives and
 annotate it with ANNOTATE_NOSPEC_ALTERNATIVE.
Message-ID: <202304291717.QluBp0vi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Peter Zijlstra <peterz@infradead.org>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Alexandre Chartre <alexandre.chartre@oracle.com>
CC: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>

Hi Peter,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.4.y
head:   ea7862c507eca54ea6caad9dcfc8bba5e749fbde
commit: 8afd1c7da2b0484e752b28a9122efa02d284806e [5552/8186] x86/speculation: Change FILL_RETURN_BUFFER to work with objtool
config: x86_64-randconfig-a014 (https://download.01.org/0day-ci/archive/20230429/202304291717.QluBp0vi-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=8afd1c7da2b0484e752b28a9122efa02d284806e
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.4.y
        git checkout 8afd1c7da2b0484e752b28a9122efa02d284806e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304291717.QluBp0vi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/entry/entry_64.o: warning: objtool: .entry.text+0x191: unsupported intra-function call
>> arch/x86/entry/entry_64.o: warning: objtool: If this is a retpoline, please patch it in with alternatives and annotate it with ANNOTATE_NOSPEC_ALTERNATIVE.
--
   arch/x86/kvm/vmx/vmenter.o: warning: objtool: vmx_vmexit()+0xc: unsupported intra-function call
>> arch/x86/kvm/vmx/vmenter.o: warning: objtool: If this is a retpoline, please patch it in with alternatives and annotate it with ANNOTATE_NOSPEC_ALTERNATIVE.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
