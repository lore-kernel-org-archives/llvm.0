Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4ECE2F25
	for <llvm@lists.linux.dev>; Fri,  4 Feb 2022 17:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643996320; x=1675532320;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=O1t48c17XoJx7EOIIIEmyVVzGAn2IVOrgHRTPrmEe/U=;
  b=CsSnSB2tqP2z4iqdEwZSSJuf10v8SdLXVz244JmQhdXYtxWvi/JReYvP
   4vFx1PBSGeuvzviICrlTKiIbBuuBfjjwuhYlncrU33qpeI2JIR+2C9BaP
   +xXk2Edd24966H/u9a3i4lmlm7PNgE27ugB6qs6rrDGAcKxYtewedGOsq
   gqlVjk9Q2YB6l65nLVe7H0Mzp6cVhPs5pSuzjuTNi6o5o1X9artneecuX
   ZSpM7k764U8RMVG7PcTNf52Nf/MF51l19/eufqyV4X9WUbKibeK5t6Ezo
   +4t4hQ+157oGPd69Ng2jMab9qqzT8FAEKelBymlbQjmS9tj+cVvXRBCne
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10248"; a="309153857"
X-IronPort-AV: E=Sophos;i="5.88,343,1635231600"; 
   d="scan'208";a="309153857"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2022 09:38:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,343,1635231600"; 
   d="scan'208";a="631768511"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 04 Feb 2022 09:38:37 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nG2Xc-000Xx0-Li; Fri, 04 Feb 2022 17:38:36 +0000
Date: Sat, 5 Feb 2022 01:38:25 +0800
From: kernel test robot <lkp@intel.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	Chris Paterson <Chris.Paterson2@renesas.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v4] clk: renesas: rzg2l-cpg: Add support for RZ/V2L SoC
Message-ID: <202202050101.eoVR3IJN-lkp@intel.com>
References: <20220204135221.2598-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220204135221.2598-1-biju.das.jz@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Biju,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on clk/clk-next]
[also build test ERROR on v5.17-rc2]
[cannot apply to geert-renesas-drivers/renesas-clk next-20220204]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Biju-Das/clk-renesas-rzg2l-cpg-Add-support-for-RZ-V2L-SoC/20220204-215327
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
config: mips-randconfig-r003-20220131 (https://download.01.org/0day-ci/archive/20220205/202202050101.eoVR3IJN-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a73e4ce6a59b01f0e37037761c1e6889d539d233)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://github.com/0day-ci/linux/commit/c10eeae8f76f71a3b6778b816cb18c2db3e917f8
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Biju-Das/clk-renesas-rzg2l-cpg-Add-support-for-RZ-V2L-SoC/20220204-215327
        git checkout c10eeae8f76f71a3b6778b816cb18c2db3e917f8
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/clk/renesas/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/clk/renesas/r9a07g044-cpg.c:14:10: fatal error: 'dt-bindings/clock/r9a07g054-cpg.h' file not found
   #include <dt-bindings/clock/r9a07g054-cpg.h>
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +14 drivers/clk/renesas/r9a07g044-cpg.c

    12	
    13	#include <dt-bindings/clock/r9a07g044-cpg.h>
  > 14	#include <dt-bindings/clock/r9a07g054-cpg.h>
    15	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
