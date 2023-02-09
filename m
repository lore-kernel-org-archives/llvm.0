Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9327D27733;
	Thu,  9 Feb 2023 23:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675986977; x=1707522977;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CeXNWFB90goiNYzN4ujmRtSAdv4/UDZJQfguE+ses44=;
  b=EPwnaX6+6phL2iT+cf0K++ppj3uuoYjzF3VykgtnT0P9JLwn+nC89eXZ
   DW/4CrMoXsgHJB97+0zh9d347Isi3+6ebpx3MASdVmYyvdxs1Z62aQ3+2
   CRk5M6DzZANcUnfWHme2GCt21LEMEpRg/8GHvHVCusr9431Gvco6/9fU7
   1dU9KHasCcVatveCPb7k0yj+b4+cIKNZ0xM/Il5C5o4DmKacFok6b7sCx
   x1aUqzipqdsTCzHMZUzpYbmy4axJAo1ZFhUwWorwiNy2Nz+417X9OeeSd
   yAVL9qKNaQytw8tLzkEGU92CcblUNd+Nv6ZNgcch0dyk2PrXW0IAHNEw6
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="332422891"
X-IronPort-AV: E=Sophos;i="5.97,285,1669104000"; 
   d="scan'208";a="332422891"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2023 15:56:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="810576103"
X-IronPort-AV: E=Sophos;i="5.97,285,1669104000"; 
   d="scan'208";a="810576103"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 09 Feb 2023 15:56:12 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQGlv-0005Nm-1b;
	Thu, 09 Feb 2023 23:56:11 +0000
Date: Fri, 10 Feb 2023 07:55:46 +0800
From: kernel test robot <lkp@intel.com>
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [linux-next:master 5911/11577]
 drivers/soc/renesas/pwc-rzv2m.c:124:34: warning: unused variable
 'rzv2m_pwc_of_match'
Message-ID: <202302100744.d1zZxXFn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   20f513df926fac0594a3b65f79d856bd64251861
commit: 0c56f949f626e59ef7c5b18e2706fed2a6afc4a2 [5911/11577] soc: renesas: Add PWC support for RZ/V2M
config: mips-randconfig-r005-20230209 (https://download.01.org/0day-ci/archive/20230210/202302100744.d1zZxXFn-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db0e6591612b53910a1b366863348bdb9d7d2fb1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mipsel-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=0c56f949f626e59ef7c5b18e2706fed2a6afc4a2
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 0c56f949f626e59ef7c5b18e2706fed2a6afc4a2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/soc/renesas/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302100744.d1zZxXFn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soc/renesas/pwc-rzv2m.c:124:34: warning: unused variable 'rzv2m_pwc_of_match' [-Wunused-const-variable]
   static const struct of_device_id rzv2m_pwc_of_match[] = {
                                    ^
   1 warning generated.


vim +/rzv2m_pwc_of_match +124 drivers/soc/renesas/pwc-rzv2m.c

   123	
 > 124	static const struct of_device_id rzv2m_pwc_of_match[] = {
   125		{ .compatible = "renesas,rzv2m-pwc" },
   126		{ /* sentinel */ }
   127	};
   128	MODULE_DEVICE_TABLE(of, rzv2m_pwc_of_match);
   129	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
