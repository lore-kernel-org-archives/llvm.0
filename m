Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B167B
	for <llvm@lists.linux.dev>; Thu, 22 Sep 2022 23:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663890891; x=1695426891;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=c2Fh1kRyIqO7dwRAaAYPKGtKnMyK0YH7bX5IoC7jEd0=;
  b=jOnZZiQqXFFEJr0dKmKkdfztJMkCZE2N505n2rN4k359A8QRNQtaiJqA
   Ybq7K+GoKBNVNgHJ8bcn57hv3SxaTkMo8QiuQa5BkET/A+QW+cPZeIC+r
   5jEThgK6cDLgGqxwNoWATsGmPmer0Ss7P0GqFwIlBQMzYz7YAhESZVaZ5
   2smqGSHYc/enryq6fmzOJgLG08ITnljfK2UcRSZ9UYFBWC5f+KTpXprf0
   3trVmJQP/LZIt4Th2Z6+el9s/uoJoUNnuut513FvH06QIyYTgSIrHr4vT
   aVVAgJyy1OEhVCjn4zJHZUAkHYi6nDB+3XKNcRgqfD+N6nOdhwcFgid1I
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="362270274"
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="362270274"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2022 16:54:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="571180350"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 22 Sep 2022 16:54:48 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1obW1n-00056G-1I;
	Thu, 22 Sep 2022 23:54:47 +0000
Date: Fri, 23 Sep 2022 07:54:27 +0800
From: kernel test robot <lkp@intel.com>
To: hildawu@realtek.com, marcel@holtmann.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, johan.hedberg@gmail.com,
	luiz.dentz@gmail.com, linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org, mmandlik@google.com,
	max.chou@realtek.com, alex_lu@realsil.com.cn, kidman@realtek.com
Subject: Re: [PATCH] Bluetooth: btusb: Add Realtek devcoredump support
Message-ID: <202209230749.lLf1xA67-lkp@intel.com>
References: <20220922103337.26167-1-hildawu@realtek.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220922103337.26167-1-hildawu@realtek.com>

Hi,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on bluetooth/master]
[also build test ERROR on bluetooth-next/master linus/master v6.0-rc6 next-20220921]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/hildawu-realtek-com/Bluetooth-btusb-Add-Realtek-devcoredump-support/20220922-183533
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth.git master
config: hexagon-randconfig-r023-20220922 (https://download.01.org/0day-ci/archive/20220923/202209230749.lLf1xA67-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/b896c161a197fbcb019f6e4f890b667bb9d6f15e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review hildawu-realtek-com/Bluetooth-btusb-Add-Realtek-devcoredump-support/20220922-183533
        git checkout b896c161a197fbcb019f6e4f890b667bb9d6f15e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/bluetooth/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/bluetooth/btrtl.c:657:8: error: call to undeclared function 'hci_devcoredump_register'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           err = hci_devcoredump_register(hdev, btrtl_coredump, btrtl_dmp_hdr,
                 ^
   1 error generated.


vim +/hci_devcoredump_register +657 drivers/bluetooth/btrtl.c

   652	
   653	static int btrtl_register_devcoredump_support(struct hci_dev *hdev)
   654	{
   655		int err;
   656	
 > 657		err = hci_devcoredump_register(hdev, btrtl_coredump, btrtl_dmp_hdr,
   658					       NULL);
   659	
   660		return err;
   661	}
   662	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
