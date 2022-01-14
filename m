Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E5F2C9C
	for <llvm@lists.linux.dev>; Fri, 14 Jan 2022 17:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642180998; x=1673716998;
  h=date:from:cc:subject:message-id:mime-version;
  bh=mz9zH21YxTT9UWVLd/KOjlHtdvSVX52nGwyeSqKshqc=;
  b=cVq5sBLpmZyxUV53mIjFImI2rON7sIYzYn9Isdy7et/dHWNQ7c95pIej
   HWdmZZVV3PMEnoHmPdG6r0eNKsP4UM/cigxncRNQkzDDEPfbfKhCkjblK
   NTsVHso1PymM5RHDWqGc4VWEo+hI+PPHgaLzKSlYTL2ox8ATMjgYFs2F/
   AQkDDoElDk4SMY/iSNgGfYuR95R8r9LtnwJreIKjpkBWK8OiOyVeyo4cU
   1gCs3mGWdXNddovHMs90C/gQEGSBdCAFoPk4iO85R98oNQpzcHvlcvdt8
   GEXaW9RB4eJlTJso88X0FGwz/7c6pIawYkKXZ89Rz+s64bZ1KAX/5Cw0d
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10227"; a="224975818"
X-IronPort-AV: E=Sophos;i="5.88,289,1635231600"; 
   d="scan'208";a="224975818"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2022 09:23:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,289,1635231600"; 
   d="scan'208";a="516468053"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 14 Jan 2022 09:23:17 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n8QIG-0008pc-GM; Fri, 14 Jan 2022 17:23:16 +0000
Date: Sat, 15 Jan 2022 01:22:18 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: Re: [PATCH v3 3/3] dmaengine: sf-pdma: Get number of channel by
 device tree
Message-ID: <202201150129.P4syQvOh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

In-Reply-To: <91a8fb6dff811b36db951ee98d955ad14a2a30eb.1642151791.git.zong.li@sifive.com>
References: <91a8fb6dff811b36db951ee98d955ad14a2a30eb.1642151791.git.zong.li@sifive.com>
TO: Zong Li <zong.li@sifive.com>
TO: robh+dt@kernel.org
TO: paul.walmsley@sifive.com
TO: palmer@dabbelt.com
TO: aou@eecs.berkeley.edu
TO: krzysztof.kozlowski@canonical.com
TO: conor.dooley@microchip.com
TO: geert@linux-m68k.org
TO: bin.meng@windriver.com
TO: green.wan@sifive.com
TO: vkoul@kernel.org

Hi Zong,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on vkoul-dmaengine/next]
[also build test WARNING on v5.16]
[cannot apply to robh/for-next next-20220114]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Zong-Li/Determine-the-number-of-DMA-channels-by-dma-channels-property/20220114-172017
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
config: x86_64-randconfig-a001 (https://download.01.org/0day-ci/archive/20220115/202201150129.P4syQvOh-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 82c8aca93488730ce8f66101e0f3538f14b551dd)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/efa33512fd463fd6e29750992df1d40513eb5a7c
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Zong-Li/Determine-the-number-of-DMA-channels-by-dma-channels-property/20220114-172017
        git checkout efa33512fd463fd6e29750992df1d40513eb5a7c
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/dma/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/dma/sf-pdma/sf-pdma.o: warning: objtool: dma_cookie_complete()+0x40: unreachable instruction

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
