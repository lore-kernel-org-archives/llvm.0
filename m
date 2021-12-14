Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286102CA5
	for <llvm@lists.linux.dev>; Tue, 14 Dec 2021 19:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639509004; x=1671045004;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/6TzQh44N0N1DFJ1JXxF9InGHDSmtVjHdCDbo/ji+ps=;
  b=Ok0t1tSUQcEGwjSiX2XUI8DcjqSCB2PUW5w0zOdCeNTiZGzHH5ccKAVi
   /hKhXTDqO9QUioxJqMNYyZDiIoXT7e6tO47jDRzYdPERNj8tzX0ASJlOU
   O3ulYuiM450L3Qf66yJR5hF6bAda4jxYI0g6GDrgLr6XrCuh3sENWj/Tg
   d5wzOuaB2PuSCYz1f9as2Zy0BBYJTvXlU5iIZk+SrcxE6zxjy7Vu9itFM
   D4jOiJnewRFBdYKPo5DPJn8wKA2gC02I7BGv008+cVMWFeQnwQ2JlBwac
   EFGsRIAjooJmgsyEokAhvPRDpf6Nbl1fbl1n4Cr6oMN+g5dvW473ujc/9
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="225919842"
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; 
   d="scan'208";a="225919842"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2021 10:57:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; 
   d="scan'208";a="465216317"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 14 Dec 2021 10:57:16 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mxCzD-0000du-QH; Tue, 14 Dec 2021 18:57:15 +0000
Date: Wed, 15 Dec 2021 02:56:38 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org
Subject: [linusw-nomadik:ux500-href-charging-v5.16-rc1 36/36]
 drivers/power/supply/samsung-sdi-battery.c:393:5: error: redefinition of
 'samsung_sdi_battery_get_info'
Message-ID: <202112150241.QL8LVJg0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git ux500-href-charging-v5.16-rc1
head:   32391681d89fce910d0190dc32a6febe33a74041
commit: 32391681d89fce910d0190dc32a6febe33a74041 [36/36] power: supply: Static data for Samsung batteries
config: x86_64-randconfig-r016-20211214 (https://download.01.org/0day-ci/archive/20211215/202112150241.QL8LVJg0-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project b6a2ddb6c8ac29412b1361810972e15221fa021c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git/commit/?id=32391681d89fce910d0190dc32a6febe33a74041
        git remote add linusw-nomadik https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
        git fetch --no-tags linusw-nomadik ux500-href-charging-v5.16-rc1
        git checkout 32391681d89fce910d0190dc32a6febe33a74041
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/power/supply/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/power/supply/samsung-sdi-battery.c:393:5: error: redefinition of 'samsung_sdi_battery_get_info'
   int samsung_sdi_battery_get_info(struct device *dev,
       ^
   drivers/power/supply/samsung-sdi-battery.h:7:19: note: previous definition is here
   static inline int samsung_sdi_battery_get_info(struct device *dev,
                     ^
   1 error generated.


vim +/samsung_sdi_battery_get_info +393 drivers/power/supply/samsung-sdi-battery.c

   392	
 > 393	int samsung_sdi_battery_get_info(struct device *dev,

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
