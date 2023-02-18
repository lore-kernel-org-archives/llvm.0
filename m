Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF4229AC;
	Sat, 18 Feb 2023 22:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676760978; x=1708296978;
  h=date:from:cc:subject:message-id:mime-version;
  bh=kyxC1hJBRV2V+ql4+h58WF5zIvSGgTK/uqGPqWiDj9Y=;
  b=GkbG7FCzTH8KXNM2BX2E3vYu8+ixKzjSFpUh0PCwtolKaubtcZjSf9c1
   P3x7cZpfZQKqGlnR91dE95WhINfj1Jfaf8wIQzoORLHMc9kvCC1GNEX3/
   SlUgbCGjUarHpghAqayYn99h+uTpSLCGudMWJnA5YS0vZatl5vGXshWju
   +n67c1Dm4mbaZMeCC/Tv96MYinHUQhGGJ4ynTkVgiF0D8nVQCzHZJruEP
   TccutsUZH/q4dd35+Eyk5HpdNEnRCRZiOQAHpfHqhChfVGsdQnR3OJns3
   GBlsgxI8O4o679R5lqe0VPR+53AlQm7XSHeGYqoYIJQmjscQfTd4898T/
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="332214159"
X-IronPort-AV: E=Sophos;i="5.97,309,1669104000"; 
   d="scan'208";a="332214159"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2023 14:56:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="780203571"
X-IronPort-AV: E=Sophos;i="5.97,309,1669104000"; 
   d="scan'208";a="780203571"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 18 Feb 2023 14:56:17 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTW7s-000CpV-1e;
	Sat, 18 Feb 2023 22:56:16 +0000
Date: Sun, 19 Feb 2023 06:55:55 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: arch/powerpc/kernel/btext.o: warning: objtool:
 btext_prepare_BAT+0x10: unannotated intra-function call
Message-ID: <202302190655.ZnyRAV0q-lkp@intel.com>
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
head:   5e725d112e1a54c2611d5dffd124a79415d0f0de
commit: c984aef8c8326035570ff6e01d0ff9e79a5dfa76 objtool/powerpc: Add --mcount specific implementation
date:   3 months ago
config: powerpc-randconfig-r032-20230219 (https://download.01.org/0day-ci/archive/20230219/202302190655.ZnyRAV0q-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
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
| Link: https://lore.kernel.org/oe-kbuild-all/202302190655.ZnyRAV0q-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/powerpc/kernel/btext.o: warning: objtool: btext_prepare_BAT+0x10: unannotated intra-function call

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
