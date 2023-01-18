Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA96C2F22;
	Wed, 18 Jan 2023 14:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674053814; x=1705589814;
  h=date:from:cc:subject:message-id:mime-version;
  bh=TkN0luxwDw0qyOy0Kckagy1crqD77MXkIlLAEcTsdpE=;
  b=JSe2wLjgw2FoHP+BROn9bYD8I81b0uTScoM2G47PQ6wNRrz4aRGRvf0p
   Qso5C1kMj+wLnMpnCEFsZYpVcFrkfU2ZE7KvcyJWkeJUL0P0xyvAosXlT
   P7FL267ESnG1QIwm8RqFFP2C2NgD+FdC46g6akSOWbHWr8Yy6Ta9/FDyX
   ZZx17nA50ZR9cgkzci8JQ36KFq7TQ5Dom0AOl0goOv7LyJ2Txi2VIVrmS
   X/aeVHOU4Gqk0NDDSG4C8vOYhyg1m0nWazhCYK4IaToJru3qutRkuvHDY
   9cZb+E1kQMVFj9yOHdijY4cYqWURAjNyN0ZxBxBql/GIYzo469tHXEv4I
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="411234447"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="411234447"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 06:56:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="652975718"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="652975718"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 18 Jan 2023 06:56:53 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pI9rw-0000Ro-0O;
	Wed, 18 Jan 2023 14:56:52 +0000
Date: Wed, 18 Jan 2023 22:56:37 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: arch/powerpc/kernel/btext.o: warning: objtool: btext_map+0x18:
 unannotated intra-function call
Message-ID: <202301182209.phbFnH8T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Sathvika Vasireddy <sv@linux.ibm.com>
CC: Michael Ellerman <mpe@ellerman.id.au>
CC: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
CC: Christophe Leroy <christophe.leroy@csgroup.eu>

Hi Sathvika,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c1649ec55708ae42091a2f1bca1ab49ecd722d55
commit: c984aef8c8326035570ff6e01d0ff9e79a5dfa76 objtool/powerpc: Add --mcount specific implementation
date:   9 weeks ago
config: powerpc-randconfig-r005-20230118 (https://download.01.org/0day-ci/archive/20230118/202301182209.phbFnH8T-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c984aef8c8326035570ff6e01d0ff9e79a5dfa76
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout c984aef8c8326035570ff6e01d0ff9e79a5dfa76
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash arch/powerpc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/powerpc/kernel/btext.o: warning: objtool: btext_map+0x18: unannotated intra-function call

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_SOC_MPC5200_AC97
   Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_POWERPC_SOC [=y] && PPC_MPC52xx [=y] && PPC_BESTCOMM [=n]
   Selected by [y]:
   - SND_MPC52xx_SOC_PCM030 [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_POWERPC_SOC [=y] && PPC_MPC5200_SIMPLE [=y]
   - SND_MPC52xx_SOC_EFIKA [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_POWERPC_SOC [=y] && PPC_EFIKA [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
