Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384CB63AA;
	Wed, 27 Dec 2023 06:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F9hDv3eB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703660079; x=1735196079;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qnFR3LxawdswpjevdUT6pQJauyrKx5paQ2H5adPAklg=;
  b=F9hDv3eBjBesCGlcPASBMbhrGTdqFsu6FOqbgOxTmGkZmcYZUv4Qm/gw
   Oky+9xWUBnxZWsuaaTcPjNu99BnMLR/vE1Sj8B49R1jVy/r3zY9imjSWQ
   xBRj7SzNWHXWzH37Gxkkk/KdgwzxoRr63xIuI2VqFdXFeDfRilp3obkus
   UBMv+wcp2JwR1uyzSvnjyxdpuPXhacSkjemiVqirY31U0V1GnSVNdur7/
   goWu8Fhtzroq8WmiayeTuk0pM+uRewkd9y77vajU+IGnXsA96va3oYmV+
   TsDLD8JcvzAW7VvDj3eQKZEyYlbBgI0hjN9gWq76a1T68+wJR+ytV+EFQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10935"; a="400235414"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; 
   d="scan'208";a="400235414"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2023 22:54:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; 
   d="scan'208";a="26503020"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 26 Dec 2023 22:54:36 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rINoI-000F8X-0E;
	Wed, 27 Dec 2023 06:54:34 +0000
Date: Wed, 27 Dec 2023 14:53:49 +0800
From: kernel test robot <lkp@intel.com>
To: Keyur Parekh <keyur.parekh@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Michal Simek <monstr@monstr.eu>,
	Gregory Williams <gregory.williams@amd.com>,
	Hua Jiang <hua.jiang@amd.com>, .@3429e2599065
Subject: [pinchartl-media:muxed/2023.1/base 919/929]
 drivers/misc/xilinx-ai-engine/ai-engine-status-dump.c:181:13: warning:
 variable 'row' is uninitialized when used here
Message-ID: <202312271450.C9YmLJn2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/pinchartl/media.git muxed/2023.1/base
head:   f9c8e14ae03c937a79e1c904d004d80a0db3647e
commit: d4dee8ba45dc097ed26da8b10600301b6aebb029 [919/929] misc: xilinx-ai-engine: Add status dump API for AIEML
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20231227/202312271450.C9YmLJn2-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project d3ef86708241a3bee902615c190dead1638c4e09)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231227/202312271450.C9YmLJn2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312271450.C9YmLJn2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/misc/xilinx-ai-engine/ai-engine-status-dump.c:181:13: warning: variable 'row' is uninitialized when used here [-Wuninitialized]
     181 |         loc->row = row;
         |                    ^~~
   drivers/misc/xilinx-ai-engine/ai-engine-status-dump.c:162:37: note: initialize the variable 'row' to silence this warning
     162 |         u32 ttype, num_locks, lock_val, row, col;
         |                                            ^
         |                                             = 0
>> drivers/misc/xilinx-ai-engine/ai-engine-status-dump.c:182:13: warning: variable 'col' is uninitialized when used here [-Wuninitialized]
     182 |         loc->col = col;
         |                    ^~~
   drivers/misc/xilinx-ai-engine/ai-engine-status-dump.c:162:42: note: initialize the variable 'col' to silence this warning
     162 |         u32 ttype, num_locks, lock_val, row, col;
         |                                                 ^
         |                                                  = 0
   2 warnings generated.


vim +/row +181 drivers/misc/xilinx-ai-engine/ai-engine-status-dump.c

   148	
   149	/**
   150	 * aie_lock_status() - Stores AI engine Tile Lock status values to a tile
   151	 *                        column structure.
   152	 * @apart: AI engine Partition.
   153	 * @status: Pointer to Structure which store status value of Tile Lock registers
   154	 * @loc: Location of AI Engine Tile
   155	 * @return: 0 for success, negative value for failure
   156	 */
   157	static int aie_lock_status(struct aie_partition *apart, struct aie_col_status *status,
   158				   struct aie_location *loc)
   159	{
   160		struct aie_core_tile_status *sts_coretile;
   161		struct aie_shim_tile_status *sts_shimtile;
   162		u32 ttype, num_locks, lock_val, row, col;
   163		struct aie_mem_tile_status *sts_memtile;
   164		u8 i, tile_st, memtile_st, index;
   165		int ret;
   166	
   167		if (apart->adev->dev_gen != AIE_DEVICE_GEN_AIEML) {
   168			dev_warn(&apart->dev, "Skipping Lock Status For Non AIEML Devices\n");
   169			return 0;
   170		}
   171	
   172		ret = mutex_lock_interruptible(&apart->mlock);
   173		if (ret) {
   174			dev_err(&apart->dev, "Failed to acquire lock Process was interrupted by fatal signals\n");
   175			return ret;
   176		}
   177	
   178		tile_st = apart->adev->ttype_attr[AIE_TILE_TYPE_TILE].start_row;
   179		memtile_st = apart->adev->ttype_attr[AIE_TILE_TYPE_MEMORY].start_row;
   180	
 > 181		loc->row = row;
 > 182		loc->col = col;
   183		ttype = apart->adev->ops->get_tile_type(apart->adev,
   184							loc);
   185	
   186		if (aie_part_check_clk_enable_loc(apart, loc)) {
   187			const struct aie_tile_operations *ops;
   188	
   189			ops = apart->adev->ops;
   190			sts_coretile = status[loc->col].core_tile;
   191			sts_memtile = status[loc->col].mem_tile;
   192			sts_shimtile = status[loc->col].shim_tile;
   193	
   194			if (ttype == AIE_TILE_TYPE_TILE)
   195				num_locks = apart->adev->mem_lock->num_locks;
   196			else if (ttype == AIE_TILE_TYPE_MEMORY)
   197				num_locks = apart->adev->memtile_lock->num_locks;
   198			else
   199				num_locks = apart->adev->pl_lock->num_locks;
   200	
   201			for (i = 0; i < num_locks; i++) {
   202				lock_val = ops->get_lock_status(apart, loc, i);
   203	
   204				if (ttype == AIE_TILE_TYPE_TILE) {
   205					index = loc->row - tile_st;
   206					sts_coretile[index].lock_value[i] = lock_val;
   207				} else if (ttype == AIE_TILE_TYPE_MEMORY) {
   208					index = loc->row - memtile_st;
   209					sts_memtile[index].lock_value[i] = lock_val;
   210				} else {
   211					sts_shimtile[loc->row].lock_value[i] = lock_val;
   212				}
   213			}
   214		}
   215		mutex_unlock(&apart->mlock);
   216	
   217		return 0;
   218	}
   219	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
