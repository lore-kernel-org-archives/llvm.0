Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7361980F
	for <llvm@lists.linux.dev>; Sat, 13 Aug 2022 13:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660397301; x=1691933301;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O7TMSMc7Im2oFJqOaKBU2evDfeI/VG+bME46kcyJ8aI=;
  b=gLd329DEXUeu19SOgxJ9v2TuULli/RiWWr+YP4tVWzLAanXqq0W2FLJb
   8ONNTvgyR/BKN/E38rdasGwEjbxcoGgM+DJcmyBnCllaCvo9mNNZvPZAl
   qklx3917feB1s57snkoHStEqfdrTOYkxHNxuaMhXiuslIqj0h+eYKEKSB
   CZJItzqrYUfkOLcgkfy8ERUNUCs0frM9uxVki9rzm6IJQklUEoKMSVZEU
   G1cQ6GzKk0Rk31UpsCEJ4a+B6SYbQpxOhLP0XrR+XOuawPCfoFYKjXujX
   ilwdGwmzy9V1w6ITPjhDPcvnOg8v7D+hJg+J2dScQsxV19xgUiwOCCpdJ
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10437"; a="317729642"
X-IronPort-AV: E=Sophos;i="5.93,235,1654585200"; 
   d="scan'208";a="317729642"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2022 06:28:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,235,1654585200"; 
   d="scan'208";a="556818371"
Received: from lkp-server02.sh.intel.com (HELO 8745164cafc7) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 13 Aug 2022 06:28:19 -0700
Received: from kbuild by 8745164cafc7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oMrBa-0001hb-1e;
	Sat, 13 Aug 2022 13:28:18 +0000
Date: Sat, 13 Aug 2022 21:27:23 +0800
From: kernel test robot <lkp@intel.com>
To: Keith Busch <kbusch@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [kbusch:io_uring/dma-register-v3 8/8] drivers/nvme/host/pci.c:927:3:
 warning: variable 'i' is uninitialized when used here
Message-ID: <202208132135.rC8V9p1b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kbusch/linux.git io_uring/dma-register-v3
head:   e1c6d38d05e532b3aaf12a5ab8707929bcdc1180
commit: e1c6d38d05e532b3aaf12a5ab8707929bcdc1180 [8/8] nvme-pci: implement dma_map support
config: x86_64-randconfig-a005 (https://download.01.org/0day-ci/archive/20220813/202208132135.rC8V9p1b-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 26dd42705c2af0b8f6e5d6cdb32c9bd5ed9524eb)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/kbusch/linux.git/commit/?id=e1c6d38d05e532b3aaf12a5ab8707929bcdc1180
        git remote add kbusch https://git.kernel.org/pub/scm/linux/kernel/git/kbusch/linux.git
        git fetch --no-tags kbusch io_uring/dma-register-v3
        git checkout e1c6d38d05e532b3aaf12a5ab8707929bcdc1180
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/nvme/host/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/nvme/host/pci.c:927:3: warning: variable 'i' is uninitialized when used here [-Wuninitialized]
                   i += last_prp;
                   ^
   drivers/nvme/host/pci.c:892:7: note: initialize the variable 'i' to silence this warning
           int i;
                ^
                 = 0
   1 warning generated.


vim +/i +927 drivers/nvme/host/pci.c

   883	
   884	static blk_status_t nvme_premapped_slow(struct nvme_dev *dev,
   885					struct request *req,  struct nvme_iod *iod,
   886					struct nvme_dma_mapping *mapping, int nprps)
   887	{
   888		struct dma_pool *pool;
   889		dma_addr_t prp_dma;
   890		__le64 *prp_list;
   891		void **list;
   892		int i;
   893	
   894		iod->sg = mempool_alloc(dev->iod_mempool, GFP_ATOMIC);
   895		if (!iod->sg)
   896			return BLK_STS_RESOURCE;
   897	
   898		if (nprps <= (256 / 8)) {
   899			pool = dev->prp_small_pool;
   900			iod->npages = 0;
   901		} else {
   902			pool = dev->prp_page_pool;
   903			iod->npages = 1;
   904		}
   905	
   906		prp_list = dma_pool_alloc(pool, GFP_ATOMIC, &prp_dma);
   907		if (!prp_list) {
   908			iod->npages = -1;
   909			goto out_free_sg;
   910		}
   911	
   912		list = nvme_pci_iod_list(req);
   913		list[0] = prp_list;
   914		iod->first_dma = prp_dma;
   915	
   916		for (;;) {
   917			dma_addr_t next_prp_dma;
   918			__le64 *next_prp_list;
   919	
   920			if (nprps <= last_prp + 1) {
   921				memcpy(prp_list, &mapping->prps[i], nprps * 8);
   922				break;
   923			}
   924	
   925			memcpy(prp_list, &mapping->prps[i], NVME_CTRL_PAGE_SIZE - 8);
   926			nprps -= last_prp;
 > 927			i += last_prp;
   928	
   929			next_prp_list = dma_pool_alloc(pool, GFP_ATOMIC, &next_prp_dma);
   930			if (!next_prp_list)
   931				goto free_prps;
   932	
   933			prp_list[last_prp] = cpu_to_le64(next_prp_dma);
   934			prp_list = next_prp_list;
   935			prp_dma = next_prp_dma;
   936			list[iod->npages++] = prp_list;
   937		}
   938		return BLK_STS_OK;
   939	
   940	free_prps:
   941		nvme_free_prps(dev, req);
   942	out_free_sg:
   943		mempool_free(iod->sg, dev->iod_mempool);
   944		return BLK_STS_RESOURCE;
   945	}
   946	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
