Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251855393
	for <llvm@lists.linux.dev>; Tue, 19 Jul 2022 20:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658261393; x=1689797393;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HU+JaDG5/QEwe2CMf+ijpKvUkQBooyLHvKXiT4tuquc=;
  b=GlxpL9jU8pun0qc2wHEhPKbDjHZkTT62AG7bmphCKuB5pXcORCsxfCEi
   kRSVPc0kN9AusJSd7+MayZC6+ZFnLtcnxNIqR104XVEgfDpzedfQQsyR3
   2BnLWUyuD3TlcmQOxqGIH9BeKDkNXhZIYaRMpoRQijHEYlJ2m6gozrc6u
   +l2aEu+IBQLFibNjad1d1DS3oHJwZDupRQk25zAC8uyJc/18SQmqxvt2i
   KKdo18Rm4iz0ME/WNZUeAnd/MIHkLbO/evD2wVXoKz7nJMuq4EU6iAmdM
   Z1fPXdaERftaOJpoed5T2fETNewPeNhsUUqtjVUo6dxcFDnuVc+cGMM+h
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10413"; a="284150988"
X-IronPort-AV: E=Sophos;i="5.92,285,1650956400"; 
   d="scan'208";a="284150988"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2022 13:09:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,285,1650956400"; 
   d="scan'208";a="572997162"
Received: from lkp-server02.sh.intel.com (HELO ff137eb26ff1) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 19 Jul 2022 13:09:30 -0700
Received: from kbuild by ff137eb26ff1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oDtX7-0005zy-GD;
	Tue, 19 Jul 2022 20:09:29 +0000
Date: Wed, 20 Jul 2022 04:08:43 +0800
From: kernel test robot <lkp@intel.com>
To: Keith Busch <kbusch@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [kbusch:dma-register 4/4] drivers/nvme/host/pci.c:1812:7: warning:
 variable 'pages_per' set but not used
Message-ID: <202207200447.tQ5AF3SH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kbusch/linux.git dma-register
head:   9de6909fed20955193275bbf9c75ccc85553b7d8
commit: 9de6909fed20955193275bbf9c75ccc85553b7d8 [4/4] dma-prereg: add memory cleanup
config: arm-randconfig-r013-20220718 (https://download.01.org/0day-ci/archive/20220720/202207200447.tQ5AF3SH-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project fa0c7639e91fa1cd0cf2ff0445a1634a90fe850a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/kbusch/linux.git/commit/?id=9de6909fed20955193275bbf9c75ccc85553b7d8
        git remote add kbusch https://git.kernel.org/pub/scm/linux/kernel/git/kbusch/linux.git
        git fetch --no-tags kbusch dma-register
        git checkout 9de6909fed20955193275bbf9c75ccc85553b7d8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/nvme/host/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/nvme/host/pci.c:1812:7: warning: variable 'pages_per' set but not used [-Wunused-but-set-variable]
                   int pages_per = nvme_pages;
                       ^
   1 warning generated.


vim +/pages_per +1812 drivers/nvme/host/pci.c

  1782	
  1783	#ifdef CONFIG_HAS_DMA
  1784	/*
  1785	 * Important: bvec must be describing a virtually contiguous buffer.
  1786	 */
  1787	static void *nvme_pci_dma_map(struct request_queue *q,
  1788				       struct bio_vec *bvec, int nr_vecs)
  1789	{
  1790		const int nvme_pages = 1 << (PAGE_SIZE - NVME_CTRL_PAGE_SIZE);
  1791		struct nvme_ns *ns = q->queuedata;
  1792		struct nvme_dev *dev = to_nvme_dev(ns->ctrl);
  1793		struct nvme_dma_mapping *mapping;
  1794		int i, j, k, size, ret = -ENOMEM;
  1795	
  1796		if (!nr_vecs)
  1797			return ERR_PTR(-EINVAL);
  1798	
  1799		mapping = kzalloc(sizeof(*mapping), GFP_KERNEL);
  1800		if (!mapping)
  1801			return ERR_PTR(-ENOMEM);
  1802	
  1803		mapping->nr_pages = nr_vecs * nvme_pages;
  1804		size = sizeof(*mapping->prps) * mapping->nr_pages;
  1805		mapping->prps = dma_alloc_coherent(dev->dev, size,
  1806					&mapping->prp_dma_addr, GFP_KERNEL);
  1807		if (!mapping->prps)
  1808			goto free_mapping;
  1809	
  1810		for (i = 0, k = 0; i < nr_vecs; i++) {
  1811			struct bio_vec *bv = bvec + i;
> 1812			int pages_per = nvme_pages;
  1813			dma_addr_t dma_addr;
  1814	
  1815			if (i == 0) {
  1816				mapping->offset = bv->bv_offset;
  1817				pages_per -= mapping->offset >> NVME_CTRL_PAGE_SHIFT;
  1818			} else if (bv->bv_offset) {
  1819				ret = -EINVAL;
  1820				goto err;
  1821			}
  1822	
  1823			dma_addr = dma_map_bvec(dev->dev, bv, 0, 0);
  1824			if (dma_mapping_error(dev->dev, dma_addr)) {
  1825				ret = -EIO;
  1826				goto err;
  1827			}
  1828	
  1829			for (j = 0; j < nvme_pages; j++)
  1830				mapping->prps[k++] = cpu_to_le64(dma_addr +
  1831							j * NVME_CTRL_PAGE_SIZE);
  1832		}
  1833	
  1834		get_device(dev->dev);
  1835		return mapping;
  1836	
  1837	err:
  1838		while (--i > 0) {
  1839			__u64 dma_addr = le64_to_cpu(mapping->prps[i]);
  1840	
  1841			dma_unmap_page(dev->dev, dma_addr,
  1842				       PAGE_SIZE - offset_in_page(dma_addr), 0);
  1843		}
  1844	
  1845		dma_free_coherent(dev->dev, size, (void *)mapping->prps,
  1846				  mapping->prp_dma_addr);
  1847	free_mapping:
  1848		kfree(mapping);
  1849		return ERR_PTR(ret);
  1850	}
  1851	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
