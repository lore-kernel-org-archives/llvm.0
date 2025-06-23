Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C651F8733;
	Mon, 23 Jun 2025 23:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750720136; cv=none; b=k7q7IeTpc71uz3S9CqYkcT1aBSHXNwaUd+ZrEagLopY6DEMkaeEWzKz8IVbc0RVNehv1IuSxkcxZhbJkRbU/fYZyOYTRAwQtMD8oufvvrGGMabXzRv7tIaLO0bdEoybfVJJat1pcgYIsdyMmLJa2Ps9aKR27TnQM9VMeCrUIO7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750720136; c=relaxed/simple;
	bh=Qw+EHqJckAY/gmqBwx95xvwCWhcBIw1mXqJzlUiE5dw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ldli4uHLuSzcRrXv5+zFJqk3KWGfu5iaKFkMs/ZA137xa29F6C05au1baBPey1GugT69FrXDNXBBa+tW/je1yRwciHmhIaavEt2Btt+JyFYyPi+o3nNxFg5iLUbTmpmgQJ/Lrlva74QzoP+Aw+2KMskAyEFqtrkrU4i4pbwht5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H1q1OPj/; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H1q1OPj/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750720124; x=1782256124;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Qw+EHqJckAY/gmqBwx95xvwCWhcBIw1mXqJzlUiE5dw=;
  b=H1q1OPj/OoLzKeMsPHS+XL2+n/QZkeXKccHpNF+1KeN5GTKzZ8eKW3Cx
   lN+bG2ZWVQCg7p9WNzyfYUSeKmCHyRjwnGLyTGDbEUtruiBag2WSObXcm
   0fubwqAv63uApwdnj+Pxh6EOmhH9vCVlKvWy6IpxLKX+ijEk2Nx+uTQfh
   U0ihmd46+DrP4M0sx3ru0Xr6NHGLKJ5OpPMOrtgvYjljyXIZJ2uSOY0MR
   PZX1LcjehUQ80cZNLRxrRTeLQstU65ADwnkwgaLTPk7XicdIgaNTZX7pH
   26SzkJA/rriq5AcNe/4ooVQ2llF+2IUlXGma4byi2CkMIvTL5zoiGXYjj
   Q==;
X-CSE-ConnectionGUID: VnVaTEnCSN6PXUwKHKWqkA==
X-CSE-MsgGUID: TvYlfgilT8+gpV70YE1XWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52914712"
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; 
   d="scan'208";a="52914712"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 16:08:44 -0700
X-CSE-ConnectionGUID: ywbYryC7T9mIiSaqhysdIA==
X-CSE-MsgGUID: AFcNryzhTL2HSyWL/1b1LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; 
   d="scan'208";a="157229698"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 23 Jun 2025 16:08:44 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTqHI-000RUx-1y;
	Mon, 23 Jun 2025 23:08:40 +0000
Date: Tue, 24 Jun 2025 07:08:21 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robh:imx93-ethos-v2 2/3] drivers/accel/ethos/ethos_gem.c:142:4:
 error: expected expression
Message-ID: <202506240701.D6z0Q7AM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git imx93-ethos-v2
head:   76f13e926b6aad5010b3dab68522a69904decf65
commit: 18fbf33e2b12d61167868142a4b47c598e9442f2 [2/3] accel: Add initial Arm Ethos driver
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20250624/202506240701.D6z0Q7AM-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250624/202506240701.D6z0Q7AM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506240701.D6z0Q7AM-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/accel/ethos/ethos_gem.c:142:4: error: expected expression
     142 |                         u64 len = dma.len;
         |                         ^
>> drivers/accel/ethos/ethos_gem.c:144:5: error: use of undeclared identifier 'len'
     144 |                                 len *= dma.size1;
         |                                 ^
   drivers/accel/ethos/ethos_gem.c:146:5: error: use of undeclared identifier 'len'
     146 |                                 len *= dma.size0;
         |                                 ^
   drivers/accel/ethos/ethos_gem.c:147:70: error: use of undeclared identifier 'len'
     147 |                         if ((dma.src_region >= 0) && (info->region_size[dma.src_region] < len + dma.src_offset))
         |                                                                                           ^
   drivers/accel/ethos/ethos_gem.c:148:41: error: use of undeclared identifier 'len'
     148 |                                 info->region_size[dma.src_region] = len + dma.src_offset;
         |                                                                     ^
   drivers/accel/ethos/ethos_gem.c:151:45: error: use of undeclared identifier 'len'
     151 |                                 if (info->region_size[dma.dst_region] < len + dma.dst_offset)
         |                                                                         ^
   drivers/accel/ethos/ethos_gem.c:152:42: error: use of undeclared identifier 'len'
     152 |                                         info->region_size[dma.dst_region] = len + dma.dst_offset;
         |                                                                             ^
   drivers/accel/ethos/ethos_gem.c:155:70: error: use of undeclared identifier 'len'
     155 |                                  dma.src_region, dma.src_offset, dma.dst_region, dma.dst_offset, len);
         |                                                                                                  ^
   8 errors generated.
--
>> drivers/accel/ethos/ethos_job.c:79:67: warning: format specifies type 'unsigned long long' but the argument has type 'dma_addr_t' (aka 'unsigned int') [-Wformat]
      79 |                 dev_info(dev->base.dev, "Region %d base addr = %llx\n", region, bo->dma_addr);
         |                                                                ~~~~             ^~~~~~~~~~~~
         |                                                                %x
   include/linux/dev_printk.h:160:67: note: expanded from macro 'dev_info'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                  ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   drivers/accel/ethos/ethos_job.c:89:40: warning: format specifies type 'unsigned long long' but the argument has type 'dma_addr_t' (aka 'unsigned int') [-Wformat]
      89 |                 "Submitted cmd at 0x%llx to core\n", cmd_bo->dma_addr);
         |                                     ~~~~             ^~~~~~~~~~~~~~~~
         |                                     %x
   include/linux/dev_printk.h:160:67: note: expanded from macro 'dev_info'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                  ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   2 warnings generated.


vim +142 drivers/accel/ethos/ethos_gem.c

   123	
   124	static int ethos_gem_cmdstream_validate(struct drm_device *ddev,
   125						struct ethos_gem_object *bo, u32 size)
   126	{
   127		struct ethos_validated_cmdstream_info *info;
   128		u32 *cmds = bo->base.vaddr;
   129		struct dma_xfer dma = {};
   130	
   131		info = kzalloc(sizeof(*info), GFP_KERNEL);
   132		if (!info)
   133			return -ENOMEM;
   134		info->cmd_size = size;
   135	
   136		for (int i = 0; i < size/4; i++) {
   137			u16 cmd = cmds[i];
   138			u16 param = cmds[i] >> 16;
   139	
   140			switch(cmd & 0xffff) {
   141			case 0x10: // NPU_OP_DMA_START
 > 142				u64 len = dma.len;
   143				if (dma.mode == 2)
 > 144					len *= dma.size1;
   145				if (dma.mode >= 1)
   146					len *= dma.size0;
   147				if ((dma.src_region >= 0) && (info->region_size[dma.src_region] < len + dma.src_offset))
   148					info->region_size[dma.src_region] = len + dma.src_offset;
   149				if (dma.dst_region >= 0) {
   150					info->output_region[dma.dst_region] = true;
   151					if (info->region_size[dma.dst_region] < len + dma.dst_offset)
   152						info->region_size[dma.dst_region] = len + dma.dst_offset;
   153				}
   154				dev_info(ddev->dev, "cmdstream: DMA SRC:%d:%llx DST:%d:%llx, len=%lld\n",
   155					 dma.src_region, dma.src_offset, dma.dst_region, dma.dst_offset, len);
   156				break;
   157			case 0x130: // NPU_SET_DMA0_SRC_REGION
   158				if (param & 0x100)
   159					dma.src_region = -1;
   160				else
   161					dma.src_region = param & 0xff;
   162				dma.mode = (cmd >> 25) & 0x3;
   163				break;
   164			case 0x131: // NPU_SET_DMA0_DST_REGION
   165				if (param & 0x100)
   166					dma.dst_region = -1;
   167				else
   168					dma.dst_region = param & 0xff;
   169				break;
   170			case 0x132: // NPU_SET_DMA0_SIZE0
   171				dma.size0 = param;
   172				break;
   173			case 0x133: // NPU_SET_DMA0_SIZE1
   174				dma.size1 = param;
   175				break;
   176			case 0x4030: // NPU_SET_DMA0_SRC
   177				dma.src_offset = ((u64)(param & 0xff) << 32) | cmds[i+1];
   178				break;
   179			case 0x4031: // NPU_SET_DMA0_DST
   180				dma.dst_offset = ((u64)(param & 0xff) << 32) | cmds[i+1];
   181				break;
   182			case 0x4032: // NPU_SET_DMA0_LEN
   183				dma.len = ((u64)(param & 0xff) << 32) | cmds[i+1];
   184				break;
   185			default:
   186				break;
   187			}
   188	
   189			if (cmd & 0x4000)
   190				i++;
   191		}
   192	
   193		bo->info = info;
   194		return 0;
   195	}
   196	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
