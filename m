Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734AA7A
	for <llvm@lists.linux.dev>; Sun,  7 Aug 2022 07:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659858507; x=1691394507;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G64bbW5/r6PjmvctJSpsMizCMpVTrSatvL7Aj+NI3Ps=;
  b=mggRKeyI6tMvpRzGYdBhETMv0SUBLPWYpMw7Yi6u6o3hywVVr9sskiy3
   DIhA1suPJ6HhdE520unQzUE2zDuVniTjBKpo/DWBjjx5Q9BTB9o2/P/Qc
   JUZ4HN9KN/5VKCIL/8pydvCks9ki3oG0v94/o6QbXyU8EF/oHbV2PEBb6
   kgMHvr/HVBwjaBWHmBECThJHTHUE3xfs+Rfli86D9M1YKpCY8/PwmC0pY
   pqQ3rCFS/w7y1jAmnTTOszaiPlGZDmoVRrEZs7l3cfkd04QMFfcUCo3yH
   hzMQG/h5ngOHoPD/Ekeq4oNPkj+vNRjSk0jttLSoPquLsWsl4yznot5Wn
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10431"; a="290427252"
X-IronPort-AV: E=Sophos;i="5.93,219,1654585200"; 
   d="scan'208";a="290427252"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2022 00:48:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,219,1654585200"; 
   d="scan'208";a="931685459"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 07 Aug 2022 00:48:25 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oKb1N-000L7P-09;
	Sun, 07 Aug 2022 07:48:25 +0000
Date: Sun, 7 Aug 2022 15:48:00 +0800
From: kernel test robot <lkp@intel.com>
To: Keith Busch <kbusch@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [kbusch:io_uring/dma-register-v2 8/8] drivers/nvme/host/pci.c:927:3:
 warning: variable 'i' is uninitialized when used here
Message-ID: <202208071524.swHLNoM7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kbusch/linux.git io_uring/dma-register-v2
head:   c86a9580d33ff9bf90c685f452b66b929f1dc5fe
commit: c86a9580d33ff9bf90c685f452b66b929f1dc5fe [8/8] nvme-pci: implement dma_map support
config: x86_64-randconfig-a012 (https://download.01.org/0day-ci/archive/20220807/202208071524.swHLNoM7-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 26dd42705c2af0b8f6e5d6cdb32c9bd5ed9524eb)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/kbusch/linux.git/commit/?id=c86a9580d33ff9bf90c685f452b66b929f1dc5fe
        git remote add kbusch https://git.kernel.org/pub/scm/linux/kernel/git/kbusch/linux.git
        git fetch --no-tags kbusch io_uring/dma-register-v2
        git checkout c86a9580d33ff9bf90c685f452b66b929f1dc5fe
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
