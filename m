Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6D67A
	for <llvm@lists.linux.dev>; Tue, 17 May 2022 01:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652749270; x=1684285270;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Wov2LQaQVG/3AxlEqLF0YKuINCkabUjD2lygg5Hs/uo=;
  b=ADiJzb1C7JraiUp9ocE+T5f5AT4IzJuEbrYV015LQU3XUPKbEJOH36/y
   XicRj5HEQWA1baZ7480njon2j3pvO5ishbmhlfiJsrOmMyDhKOdIyjZt1
   nxGe3Go8NGGc612NQimchyKvfEPOEly5T/x2Ty4y8TNJqpWpaaI4UxrAg
   GU3A136qyLXxOChv+m6VT6XdGLifHz9ys3rig7EPOkrINvvnw+BehVO93
   Hh9E4AFT6DwvIa62b2bTuytGBD3CYwC3RkT0Mik9irIOmYC8XBX1EOJdu
   kny75/ufvFdY9EIf2v9gYqHFH7cPfwWbqZCK12MI5KH1i5919LRqjyt+S
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10349"; a="271136385"
X-IronPort-AV: E=Sophos;i="5.91,231,1647327600"; 
   d="scan'208";a="271136385"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2022 18:01:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,231,1647327600"; 
   d="scan'208";a="596817843"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 16 May 2022 18:00:58 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nqla6-0000Sd-0v;
	Tue, 17 May 2022 01:00:58 +0000
Date: Tue, 17 May 2022 09:00:25 +0800
From: kernel test robot <lkp@intel.com>
To: Piyush Malgujar <pmalgujar@marvell.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, sgarapati@marvell.com,
	sbalcerak@marvell.com, cchavva@marvell.com,
	Piyush Malgujar <pmalgujar@marvell.com>
Subject: Re: [PATCH 1/3] drivers: i2c: thunderx: octeontx2 clock divisor
 logic changes
Message-ID: <202205170856.ko6UxqWi-lkp@intel.com>
References: <20220511133659.29176-2-pmalgujar@marvell.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220511133659.29176-2-pmalgujar@marvell.com>

Hi Piyush,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on wsa/i2c/for-next]
[also build test ERROR on linux/master linus/master v5.18-rc7 next-20220516]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Piyush-Malgujar/drivers-i2c-thunderx-Marvell-thunderx-i2c-changes/20220511-213853
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-next
config: mips-randconfig-r025-20220516 (https://download.01.org/0day-ci/archive/20220517/202205170856.ko6UxqWi-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 853fa8ee225edf2d0de94b0dcbd31bea916e825e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/56654d280f7c130d4f1d78eb8a3fa57fedc86b7b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Piyush-Malgujar/drivers-i2c-thunderx-Marvell-thunderx-i2c-changes/20220511-213853
        git checkout 56654d280f7c130d4f1d78eb8a3fa57fedc86b7b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/i2c/busses/i2c-octeon-platdrv.c:27:
>> drivers/i2c/busses/i2c-octeon-core.h:223:21: error: incomplete definition of type 'struct pci_dev'
           u32 chip_id = (pdev->subsystem_device >> 12) & 0xF;
                          ~~~~^
   include/asm-generic/pci_iomap.h:10:8: note: forward declaration of 'struct pci_dev'
   struct pci_dev;
          ^
   1 error generated.


vim +223 drivers/i2c/busses/i2c-octeon-core.h

   213	
   214	#define PCI_SUBSYS_DEVID_9XXX 0xB
   215	/**
   216	 * octeon_i2c_is_otx2 - check for chip ID
   217	 * @pdev: PCI dev structure
   218	 *
   219	 * Returns TRUE if OcteonTX2, FALSE otherwise.
   220	 */
   221	static inline bool octeon_i2c_is_otx2(struct pci_dev *pdev)
   222	{
 > 223		u32 chip_id = (pdev->subsystem_device >> 12) & 0xF;
   224	
   225		return (chip_id == PCI_SUBSYS_DEVID_9XXX);
   226	}
   227	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
