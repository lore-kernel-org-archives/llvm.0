Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF887EE
	for <llvm@lists.linux.dev>; Sun, 14 Aug 2022 00:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660438358; x=1691974358;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g/aVtxwvzv43PLRNj2S3P7jLoKHjjU/AZ1XXd9zCz88=;
  b=k5wiQUWGRmfVt6oZ+b69fr0ECihrZVnk4pHnA5KHDK3kuJrTRt3vRnuf
   ASAqgvHtpHTzjEtB64l37uD+aeLIMWbGcRdwqZ2AiEkdz3xJrKwJZhxnW
   l8MwEd1wPRNQY+1fmOBnuR4OrNdjZghdn1Wx0k/m5ylKu8uSJSy4sOndX
   7bFTNjMx5pJzdWTpw3/ktmIGnNnpa2JA29p5ZtVFado/jGa/P0UV+c8k8
   0uqZB0bZrQhnc2F0fs81V8iQgu5+WedXPDqwudJQOcX+40E+hL3dMZCBI
   JPikZKGKkMAvK+ANydJYjPERn6w9Ghb/H5d3Ae1ryKb6qdU41Sh6L5diH
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10437"; a="290540360"
X-IronPort-AV: E=Sophos;i="5.93,236,1654585200"; 
   d="scan'208";a="290540360"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2022 17:52:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,236,1654585200"; 
   d="scan'208";a="635070507"
Received: from lkp-server02.sh.intel.com (HELO 8745164cafc7) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 13 Aug 2022 17:52:35 -0700
Received: from kbuild by 8745164cafc7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oN1rn-0002FW-0c;
	Sun, 14 Aug 2022 00:52:35 +0000
Date: Sun, 14 Aug 2022 08:52:31 +0800
From: kernel test robot <lkp@intel.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [mnyman-xhci:fix_port_disable_s4 1/1]
 drivers/usb/core/hcd-pci.c:637:19: error: use of undeclared identifier
 'hcd_pci_poweroff_late'
Message-ID: <202208140802.8IhDwVtx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git fix_port_disable_s4
head:   a41d3a635cb80d88f6d5fa958ebce3d81abd5c73
commit: a41d3a635cb80d88f6d5fa958ebce3d81abd5c73 [1/1] xhci: pci: disable all xhci ports in hibernate poweroff_late stage,
config: i386-randconfig-a015-20220808 (https://download.01.org/0day-ci/archive/20220814/202208140802.8IhDwVtx-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 5f1c7e2cc5a3c07cbc2412e851a7283c1841f520)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/commit/?id=a41d3a635cb80d88f6d5fa958ebce3d81abd5c73
        git remote add mnyman-xhci https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git
        git fetch --no-tags mnyman-xhci fix_port_disable_s4
        git checkout a41d3a635cb80d88f6d5fa958ebce3d81abd5c73
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/usb/core/hcd-pci.c:637:19: error: use of undeclared identifier 'hcd_pci_poweroff_late'
           .poweroff_late  = hcd_pci_poweroff_late,
                             ^
   1 error generated.


vim +/hcd_pci_poweroff_late +637 drivers/usb/core/hcd-pci.c

   626	
   627	const struct dev_pm_ops usb_hcd_pci_pm_ops = {
   628		.suspend	= hcd_pci_suspend,
   629		.suspend_noirq	= hcd_pci_suspend_noirq,
   630		.resume_noirq	= hcd_pci_resume_noirq,
   631		.resume		= hcd_pci_resume,
   632		.freeze		= hcd_pci_suspend,
   633		.freeze_noirq	= check_root_hub_suspended,
   634		.thaw_noirq	= NULL,
   635		.thaw		= hcd_pci_resume,
   636		.poweroff	= hcd_pci_suspend,
 > 637		.poweroff_late	= hcd_pci_poweroff_late,
   638		.poweroff_noirq	= hcd_pci_suspend_noirq,
   639		.restore_noirq	= hcd_pci_resume_noirq,
   640		.restore	= hcd_pci_restore,
   641		.runtime_suspend = hcd_pci_runtime_suspend,
   642		.runtime_resume	= hcd_pci_runtime_resume,
   643	};
   644	EXPORT_SYMBOL_GPL(usb_hcd_pci_pm_ops);
   645	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
