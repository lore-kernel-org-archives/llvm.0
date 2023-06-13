Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B776D3ED8C;
	Tue, 13 Jun 2023 22:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686694828; x=1718230828;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dE+szeYmzk/CG3JQv53HG5HzxOyft4kzDMvCZ7X08oU=;
  b=Svi2E09iF9EzsWyH5gEP+KCqVEoEYbJz98V1fL0hwf35syFM/LxOoPfe
   9YbW8kaxgRpsPt25zJPrzP1LAVJESl9qtO4S6HTSU5MlZcqt0021823gC
   JpkiMBElZl41IL90Xjiltsd6H+C9OR1M/TbZQPpGxpP8OrJduauT3t5Q7
   KOWKsXvO6ZTuPjBXLR9P+802MAyq0Jkt2ngiQYxfnHatFteqkJzc6NV+7
   RTl343xvL8tAyisjJbjRxc4vVitCwxPyt6kagvZQcFKiFFsgVFRRISg/H
   ZXgv6FTTg5prZcI/qZdlp3cIEiomaS8sWBqBt3Zw1ktpOtPxE03URxQ4I
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="424345468"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; 
   d="scan'208";a="424345468"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 15:20:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="662159182"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; 
   d="scan'208";a="662159182"
Received: from lkp-server01.sh.intel.com (HELO 211f47bdb1cb) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 13 Jun 2023 15:20:26 -0700
Received: from kbuild by 211f47bdb1cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9CNF-0001rM-33;
	Tue, 13 Jun 2023 22:20:25 +0000
Date: Wed, 14 Jun 2023 06:19:43 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [avpatel:riscv_timer_imp_v1 43/50]
 drivers/iommu/dma-iommu.c:1698:37: warning: variable 'msi_addr' is
 uninitialized when used here
Message-ID: <202306140622.C6XZVCIr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_timer_imp_v1
head:   74a10c4f3857dece3424b109452f63add2baa7f6
commit: 59f0204d5995cda5dad48d7821d2d885a852f519 [43/50] irqchip/riscv-imsic: Improve IOMMU DMA support
config: arm64-randconfig-r002-20230612 (https://download.01.org/0day-ci/archive/20230614/202306140622.C6XZVCIr-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/avpatel/linux/commit/59f0204d5995cda5dad48d7821d2d885a852f519
        git remote add avpatel https://github.com/avpatel/linux.git
        git fetch --no-tags avpatel riscv_timer_imp_v1
        git checkout 59f0204d5995cda5dad48d7821d2d885a852f519
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/iommu/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306140622.C6XZVCIr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/dma-iommu.c:1698:37: warning: variable 'msi_addr' is uninitialized when used here [-Wuninitialized]
    1698 |         if (!msi_page || msi_page->phys != msi_addr) {
         |                                            ^~~~~~~~
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                                               ^~~~
   include/linux/compiler.h:57:52: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   drivers/iommu/dma-iommu.c:1691:22: note: initialize the variable 'msi_addr' to silence this warning
    1691 |         phys_addr_t msi_addr;
         |                             ^
         |                              = 0
   1 warning generated.


vim +/msi_addr +1698 drivers/iommu/dma-iommu.c

  1679	
  1680	/**
  1681	 * iommu_dma_compose_msi_msg() - Apply translation to an MSI message
  1682	 * @desc: MSI descriptor prepared by iommu_dma_prepare_msi()
  1683	 * @msg: MSI message containing target physical address
  1684	 */
  1685	void iommu_dma_compose_msi_msg(struct msi_desc *desc, struct msi_msg *msg)
  1686	{
  1687		struct device *dev = msi_desc_to_dev(desc);
  1688		const struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
  1689		const struct iommu_dma_msi_page *msi_page;
  1690		struct iommu_dma_cookie *cookie;
  1691		phys_addr_t msi_addr;
  1692	
  1693		if (!domain || !domain->iova_cookie)
  1694			return;
  1695	
  1696		cookie = domain->iova_cookie;
  1697		msi_page = msi_desc_get_iommu_cookie(desc);
> 1698		if (!msi_page || msi_page->phys != msi_addr) {
  1699			msi_addr = ((u64)msg->address_hi << 32) | msg->address_lo;
  1700			msi_addr &= ~(phys_addr_t)(cookie_msi_granule(cookie) - 1);
  1701	
  1702			msi_desc_set_iommu_cookie(desc, NULL);
  1703			list_for_each_entry(msi_page, &cookie->msi_page_list, list) {
  1704				if (msi_page->phys == msi_addr) {
  1705					msi_desc_set_iommu_cookie(desc, msi_page);
  1706					break;
  1707				}
  1708			}
  1709			msi_page = msi_desc_get_iommu_cookie(desc);
  1710		}
  1711		if (WARN_ON(!msi_page))
  1712			return;
  1713	
  1714		msg->address_hi = upper_32_bits(msi_page->iova);
  1715		msg->address_lo &= cookie_msi_granule(cookie) - 1;
  1716		msg->address_lo += lower_32_bits(msi_page->iova);
  1717	}
  1718	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
