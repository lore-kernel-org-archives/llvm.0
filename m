Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AAF2274FFC;
	Tue,  1 Jul 2025 15:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751382199; cv=none; b=J46xc5Z52C5dXKN/fLtHDzQMXK4zA5DBisIKB9tNtPLscW2EJWzIX2Jz8ZeVFk5lE6HvyLcK7CiFufipLZ71iyFAWRR6BGcGc75ZtpQbwkBT6P2GJsBjemL/a5oOt0MG1jXa0FHwoXUEUR7avdccZnrI9SjFN9QXn4hHMv2rhM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751382199; c=relaxed/simple;
	bh=28D1UKs0JseSeecsT2Gw+z/Peu2+HrGTLwCSE3soFGY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NO/l1BGq1hxxl3OPOMytutkwQC5HS/JCpF4UvcoVctlakN0SsvJkxM88m6dR3BXnhadf/V4PI3wD8R94xS9U8lhiiA9ojGIMdier+b1cGcAGvHkyDPQSer818i/9wUkzPKb6miM84LHgCTF/AMbjCqZidSqyKlvcz48wxkhrkBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CUYBsWcU; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CUYBsWcU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751382197; x=1782918197;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=28D1UKs0JseSeecsT2Gw+z/Peu2+HrGTLwCSE3soFGY=;
  b=CUYBsWcUvtflpvYFldwThM4/8IakF/+47LW+AaQVcA2uZectwPs18tz1
   K5oBRdmVGDNmvtWelbhgilN3EwDa5IBXTYEy4VeDhNjsT/8BFpN/XCPiF
   jAo3BZdavu9Ivu2B41r2h/Y4uuH03PQ+AY1h2wxegj4dS9bODEoG6cEuk
   m70lV9Q/OV7JcXCOf0OD7p6DQkt24FvfxzpIFezbNBnSbIWrftaK2/HQH
   D3Dlt/r9/gnm5Oz/1zW7Cq3j76AtDX9+I5+fQ6rYpliZE3vjHzMThdaTA
   Pj+JUh7sjII4YSFk6zChNqMvL2OZTFn8njNdwlycGFx0GZPySOEw1QUb4
   Q==;
X-CSE-ConnectionGUID: r1uHfWNqSAiyLLKnJ6T/Ag==
X-CSE-MsgGUID: uz3537g4SM+eIPSw++TlAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53376893"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="53376893"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 08:03:16 -0700
X-CSE-ConnectionGUID: AOydxM1DSBKjaaPrX8y3EA==
X-CSE-MsgGUID: ajdDSTCSQLCYfai0KKtS5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="159507626"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 01 Jul 2025 08:03:16 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWcVs-000aLa-2N;
	Tue, 01 Jul 2025 15:03:12 +0000
Date: Tue, 1 Jul 2025 23:02:26 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robh:imx93-ethos-v2 5/24] drivers/accel/ethos/ethos_gem.c:175:44:
 error: use of undeclared identifier 'srclen'
Message-ID: <202507012232.PNa1KAOw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git imx93-ethos-v2
head:   e2533aabd58e39b5a86438a8884e75b665fd885c
commit: b4e21041a4d0a52c49e6bfd738499e9113ec725a [5/24] drm: ethos: Rework cmdstream DMA validation
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20250701/202507012232.PNa1KAOw-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250701/202507012232.PNa1KAOw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507012232.PNa1KAOw-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/accel/ethos/ethos_gem.c:170:4: error: expected expression
     170 |                         u64 srclen = dma_length(info, st.dma.mode, st.dma.size0, st.dma.size1, &st.dma.src);
         |                         ^
>> drivers/accel/ethos/ethos_gem.c:175:44: error: use of undeclared identifier 'srclen'
     175 |                                  st.dma.src.region, st.dma.src.offset, srclen,
         |                                                                        ^
   2 errors generated.


vim +/srclen +175 drivers/accel/ethos/ethos_gem.c

   150	
   151	static int ethos_gem_cmdstream_validate(struct drm_device *ddev,
   152						struct ethos_gem_object *bo, u32 size)
   153	{
   154		struct ethos_validated_cmdstream_info *info;
   155		u32 *cmds = bo->base.vaddr;
   156		struct cmd_state st = {};
   157		int i;
   158	
   159		info = kzalloc(sizeof(*info), GFP_KERNEL);
   160		if (!info)
   161			return -ENOMEM;
   162		info->cmd_size = size;
   163	
   164		for (i = 0; i < size/4; i++, cmds++) {
   165			u16 cmd = *cmds;
   166			u16 param = *cmds >> 16;
   167	
   168			switch(cmd) {
   169			case 0x10: // NPU_OP_DMA_START
 > 170				u64 srclen = dma_length(info, st.dma.mode, st.dma.size0, st.dma.size1, &st.dma.src);
   171				u64 dstlen = dma_length(info, st.dma.mode, st.dma.size0, st.dma.size1, &st.dma.dst);
   172				if (st.dma.dst.region >= 0)
   173					info->output_region[st.dma.dst.region] = true;
   174				dev_info(ddev->dev, "cmdstream: DMA SRC:%d:%llx+%llx DST:%d:%llx+%llx\n",
 > 175					 st.dma.src.region, st.dma.src.offset, srclen,
   176					 st.dma.dst.region, st.dma.dst.offset, dstlen);
   177				break;
   178			case 0x130: // NPU_SET_DMA0_SRC_REGION
   179				if (param & 0x100)
   180					st.dma.src.region = -1;
   181				else
   182					st.dma.src.region = param & 0x7;
   183				st.dma.mode = (param >> 9) & 0x3;
   184				break;
   185			case 0x131: // NPU_SET_DMA0_DST_REGION
   186				if (param & 0x100)
   187					st.dma.dst.region = -1;
   188				else
   189					st.dma.dst.region = param & 0x7;
   190				break;
   191			case 0x132: // NPU_SET_DMA0_SIZE0
   192				st.dma.size0 = param;
   193				break;
   194			case 0x133: // NPU_SET_DMA0_SIZE1
   195				st.dma.size1 = param;
   196				break;
   197			case 0x4033: // NPU_SET_DMA0_SRC_STRIDE0
   198				st.dma.src.stride[0] = (s64)cmd_to_addr(cmds);
   199				break;
   200			case 0x4034: // NPU_SET_DMA0_SRC_STRIDE1
   201				st.dma.src.stride[1] = (s64)cmd_to_addr(cmds);
   202				break;
   203			case 0x4035: // NPU_SET_DMA0_DST_STRIDE0
   204				st.dma.dst.stride[0] = (s64)cmd_to_addr(cmds);
   205				break;
   206			case 0x4036: // NPU_SET_DMA0_DST_STRIDE1
   207				st.dma.dst.stride[1] = (s64)cmd_to_addr(cmds);
   208				break;
   209			case 0x4030: // NPU_SET_DMA0_SRC
   210				st.dma.src.offset = cmd_to_addr(cmds);
   211				break;
   212			case 0x4031: // NPU_SET_DMA0_DST
   213				st.dma.dst.offset = cmd_to_addr(cmds);
   214				break;
   215			case 0x4032: // NPU_SET_DMA0_LEN
   216				st.dma.src.len = st.dma.dst.len = cmd_to_addr(cmds);
   217				break;
   218			default:
   219				break;
   220			}
   221	
   222			if (cmd & 0x4000) {
   223				i++;
   224				cmds++;
   225			}
   226		}
   227	
   228		for (i = 0; i < NPU_BASEP_REGION_MAX; i++) {
   229			if (!info->region_size[i])
   230				continue;
   231			dev_info(ddev->dev, "region %d max size: %llx\n",
   232					i, info->region_size[i]);
   233		}
   234	
   235		bo->info = info;
   236		return 0;
   237	}
   238	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
