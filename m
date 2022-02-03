Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08DD52F24
	for <llvm@lists.linux.dev>; Thu,  3 Feb 2022 02:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643856040; x=1675392040;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5oNu7F4MlsG8yp+wso+B0dX5F5Dm0Wx9os9ex8f7JXk=;
  b=nj0ohQDfsBL2iniXmpRp2tUzz/dY6106ugOsRcfwZ22hx+RDL3YstZx6
   YlA5WenKmLM9RMguG5G8d4yWsmf2n6c9lu7hGn2n8GdcIV/1mpCyPiAmp
   Y2cQliSbZ2TQeuJ/zlHdkWJGNJ+bGaNvM5a2dupWqlkciaw/+kzPxVjO6
   D8hKFEwU3pWEJJ8Ww5n9F8V7PFtbGpRYqpu951ejO7WxV2sG2k646VZfK
   N8fsbbFoIkL0PFhcPGH4XRE1yF9+OCdKPO3Z8jUbxkLS00LNR1sDM+lN8
   TcwEC/hgiY3Cf7/ttEOBHkthzrROCI+j14Yu3tUkCKCt1VL4ZrQN2oc9D
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10246"; a="248281646"
X-IronPort-AV: E=Sophos;i="5.88,338,1635231600"; 
   d="scan'208";a="248281646"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2022 18:40:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,338,1635231600"; 
   d="scan'208";a="620363652"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 02 Feb 2022 18:40:39 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nFS34-000VS7-DO; Thu, 03 Feb 2022 02:40:38 +0000
Date: Thu, 3 Feb 2022 10:39:51 +0800
From: kernel test robot <lkp@intel.com>
To: Stuart Hayes <stuart.w.hayes@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH v2 3/3] Register auxiliary device for PCIe enclosure
 management
Message-ID: <202202031021.1ORRkl1U-lkp@intel.com>
References: <88898bbc85c85dce3c355c5f0399b593da0d4d27.1643822289.git.stuart.w.hayes@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <88898bbc85c85dce3c355c5f0399b593da0d4d27.1643822289.git.stuart.w.hayes@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Stuart,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on helgaas-pci/next]
[also build test WARNING on char-misc/char-misc-testing pavel-leds/for-next linus/master v5.17-rc2 next-20220202]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Stuart-Hayes/Add-PCIe-enclosure-management-support/20220203-020040
base:   https://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git next
config: x86_64-randconfig-a015-20220131 (https://download.01.org/0day-ci/archive/20220203/202202031021.1ORRkl1U-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 6b1e844b69f15bb7dffaf9365cd2b355d2eb7579)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/407e7eb11ce495697eb2ee66d77f20d69548be14
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Stuart-Hayes/Add-PCIe-enclosure-management-support/20220203-020040
        git checkout 407e7eb11ce495697eb2ee66d77f20d69548be14
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/iio/frequency/ drivers/nvme/host/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/nvme/host/pci.c:31:
>> include/linux/pcie_em.h:25:38: warning: use of logical '||' with constant operand [-Wconstant-logical-operand]
                                      1 << GET_SUPPORTED_STATES_DSM ||
                                                                    ^
   include/linux/pcie_em.h:25:38: note: use '|' for a bitwise operation
                                      1 << GET_SUPPORTED_STATES_DSM ||
                                                                    ^~
                                                                    |
   include/linux/pcie_em.h:26:27: warning: use of logical '||' with constant operand [-Wconstant-logical-operand]
                                      1 << GET_STATE_DSM ||
                                                         ^
   include/linux/pcie_em.h:26:27: note: use '|' for a bitwise operation
                                      1 << GET_STATE_DSM ||
                                                         ^~
                                                         |
>> include/linux/pcie_em.h:27:10: warning: converting the result of '<<' to a boolean always evaluates to true [-Wtautological-constant-compare]
                                      1 << SET_STATE_DSM))
                                        ^
   include/linux/pcie_em.h:25:10: warning: converting the result of '<<' to a boolean always evaluates to true [-Wtautological-constant-compare]
                                      1 << GET_SUPPORTED_STATES_DSM ||
                                        ^
   include/linux/pcie_em.h:26:10: warning: converting the result of '<<' to a boolean always evaluates to true [-Wtautological-constant-compare]
                                      1 << GET_STATE_DSM ||
                                        ^
   5 warnings generated.


vim +25 include/linux/pcie_em.h

eefb0f75026145 Stuart Hayes 2022-02-02  15  
eefb0f75026145 Stuart Hayes 2022-02-02  16  static inline bool pci_has_pcie_em_dsm(struct pci_dev *pdev)
eefb0f75026145 Stuart Hayes 2022-02-02  17  {
eefb0f75026145 Stuart Hayes 2022-02-02  18  #ifdef CONFIG_ACPI
eefb0f75026145 Stuart Hayes 2022-02-02  19  	acpi_handle handle;
eefb0f75026145 Stuart Hayes 2022-02-02  20  	const guid_t pcie_ssd_leds_dsm_guid = PCIE_SSD_LEDS_DSM_GUID;
eefb0f75026145 Stuart Hayes 2022-02-02  21  
eefb0f75026145 Stuart Hayes 2022-02-02  22  	handle = ACPI_HANDLE(&pdev->dev);
eefb0f75026145 Stuart Hayes 2022-02-02  23  	if (handle)
eefb0f75026145 Stuart Hayes 2022-02-02  24  		if (acpi_check_dsm(handle, &pcie_ssd_leds_dsm_guid, 0x1,
eefb0f75026145 Stuart Hayes 2022-02-02 @25  				   1 << GET_SUPPORTED_STATES_DSM ||
eefb0f75026145 Stuart Hayes 2022-02-02 @26  				   1 << GET_STATE_DSM ||
eefb0f75026145 Stuart Hayes 2022-02-02 @27  				   1 << SET_STATE_DSM))
eefb0f75026145 Stuart Hayes 2022-02-02  28  			return true;
eefb0f75026145 Stuart Hayes 2022-02-02  29  #endif
eefb0f75026145 Stuart Hayes 2022-02-02  30  	return false;
eefb0f75026145 Stuart Hayes 2022-02-02  31  }
eefb0f75026145 Stuart Hayes 2022-02-02  32  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
