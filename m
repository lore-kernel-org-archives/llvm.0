Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD3820FE
	for <llvm@lists.linux.dev>; Tue, 31 May 2022 06:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653979984; x=1685515984;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=geoRAX1J7UlLZ804yic3TUqIadkaJkALoS3bhYf2uSw=;
  b=ZEO0mGtsiciS5Az+GZptzLoxzbnybKrJ8adVfAN1HAZ6gAQzhqxykcBJ
   0cQlupejiMv4K6DjLkQQUXESVgs6nF5VxVVnzwCc79ghT7F1Lvv/sc1lR
   YsRQxwKPgEyRO6ui2GK/GzJLRguBRptLt+R04++XAmUEHLh9Dbk3d4ncB
   IGXlYi1rrZuFVPeyW0sdqYoYzMJSGJnBXf3lwYqEVwSfnBRM+GFvenen+
   BCJXRmV4H+ngKDHgpcvczcaR3KOUyy62HFLCPj7KbO5sQAekZFAiLNlOt
   YtLZV7XyczMdfEwnpamgPMN+pQy9oR/JgFbGoySkZs/Ref9P2kmYGLKPH
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10363"; a="275244479"
X-IronPort-AV: E=Sophos;i="5.91,264,1647327600"; 
   d="scan'208";a="275244479"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2022 23:53:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,264,1647327600"; 
   d="scan'208";a="580959499"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 30 May 2022 23:53:00 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nvvkR-0002RV-7s;
	Tue, 31 May 2022 06:52:59 +0000
Date: Tue, 31 May 2022 14:52:50 +0800
From: kernel test robot <lkp@intel.com>
To: Jiawen Wu <jiawenwu@trustnetic.com>, netdev@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Jiawen Wu <jiawenwu@trustnetic.com>
Subject: Re: [PATCH net-next v4] net: txgbe: Add build support for txgbe
Message-ID: <202205311441.65SwYadh-lkp@intel.com>
References: <20220531032640.27678-1-jiawenwu@trustnetic.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220531032640.27678-1-jiawenwu@trustnetic.com>

Hi Jiawen,

I love your patch! Yet something to improve:

[auto build test ERROR on net-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiawen-Wu/net-txgbe-Add-build-support-for-txgbe/20220531-112035
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git 7e062cda7d90543ac8c7700fc7c5527d0c0f22ad
config: x86_64-randconfig-a014 (https://download.01.org/0day-ci/archive/20220531/202205311441.65SwYadh-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c825abd6b0198fb088d9752f556a70705bc99dfd)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/52085d783a4667549a5f4224135c71c0a643bec0
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jiawen-Wu/net-txgbe-Add-build-support-for-txgbe/20220531-112035
        git checkout 52085d783a4667549a5f4224135c71c0a643bec0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/pci/quirks.c:5911:1: error: unterminated function-like macro invocation
   DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_WANGXUN, PCI_ANY_ID,
   ^
   include/linux/pci.h:2087:9: note: macro 'DECLARE_PCI_FIXUP_HEADER' defined here
   #define DECLARE_PCI_FIXUP_HEADER(vendor, device, hook)                  \
           ^
   1 error generated.


vim +5911 drivers/pci/quirks.c

  5898	
  5899	static void quirk_wangxun_set_read_req_size(struct pci_dev *pdev)
  5900	{
  5901		u16 ctl;
  5902	
  5903		pcie_capability_read_word(pdev, PCI_EXP_DEVCTL, &ctl);
  5904	
  5905		if (((ctl & PCI_EXP_DEVCTL_READRQ) != PCI_EXP_DEVCTL_READRQ_128B) &&
  5906		    ((ctl & PCI_EXP_DEVCTL_READRQ) != PCI_EXP_DEVCTL_READRQ_256B))
  5907			pcie_capability_clear_and_set_word(pdev, PCI_EXP_DEVCTL,
  5908							   PCI_EXP_DEVCTL_READRQ,
  5909							   PCI_EXP_DEVCTL_READRQ_256B);
  5910	}
> 5911	DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_WANGXUN, PCI_ANY_ID,

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
