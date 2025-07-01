Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782771DE89A;
	Tue,  1 Jul 2025 16:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751387141; cv=none; b=FIWIJomF+YlH2wXLk+zp2FT1FgCtEuOlKGWtsV77xZ+bVq5u3/NGyxSTefjIg27AHM7zmR2W3z2pIXYR/fwReOQcMSBL8CvLbx1yRx8ijqDp0emnc5DKNSSxsCKvQXiTP76R3afMvhBASMQWe6Rw80sSVU+L+6nbyC3pV2glgss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751387141; c=relaxed/simple;
	bh=9AEpaGUDUqAB9M8pEVyXhNuhdL/g1MkyVeKsqYvA+2w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PQ/O3rFlCkLeHtUdmoOeTrhe29GGbSBMoncpJxPXK5noB/IbyBcy38gtVcSqC2B6bB2zajnT+x2bDjYB/gZQrAb2R0MiRxxU6sJHmzozqlttggzZV+c6cmpPxQThQaYGHI4oQX1DztBdF0kqj42AGuGo9Kb+FHT0NoWnzYBai3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X+yq/QUO; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X+yq/QUO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751387141; x=1782923141;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9AEpaGUDUqAB9M8pEVyXhNuhdL/g1MkyVeKsqYvA+2w=;
  b=X+yq/QUO4TgvAFJtEL9b5jyJz8DnC5hIU4hRFJ4v7mKzO3K70AuuZ8WH
   UTJr+ppYKaXiHEn51lv2YfCt+91eLvVK6CL8SOpNmQeSatZ0MP7RPpeH8
   rtkRpsvXkDZdyWSCmzaT98E3xWRIUnUl0z2S/MrCdD4iU8elFf9EWybOj
   0qaf5lyFx7USK6xBwD91gtK/627TxvdfkWraSEzbuyaM9KNqsKDCNSV1n
   c/s34EZGJHcJe/Ehc556iH7XIYPwxKB6zGgrfaXBoKb7ZA7Kd3ZTAxNKY
   9MVIZ4ULbjL84QmafXzjrmrG9M8WAUmTDrc5EdrLSA4EJSUROQlSjVpCr
   A==;
X-CSE-ConnectionGUID: efiYCxslTz+9KTTcBOU0DA==
X-CSE-MsgGUID: g5cIRi8xRGCcEMQhEubsQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="57341370"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="57341370"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 09:25:40 -0700
X-CSE-ConnectionGUID: gBSyBP9cTm2CkUddwNRMZA==
X-CSE-MsgGUID: a6N3cQPzRQe6I8I7fFQgTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="159329283"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 01 Jul 2025 09:25:39 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWdnc-000aQE-2Y;
	Tue, 01 Jul 2025 16:25:36 +0000
Date: Wed, 2 Jul 2025 00:25:03 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robh:imx93-ethos-v2 7/27] drivers/accel/ethos/ethos_gem.c:217:60:
 error: use of undeclared identifier 'element_size'
Message-ID: <202507020016.Tb8SkRbn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git imx93-ethos-v2
head:   f7344a248d946409d9db929e1ac8fe6aca1ec824
commit: 93463a14b8df630f100d1ed42986a35a49a916c2 [7/27] drm: ethos: Add cmdstream region size calculations
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20250702/202507020016.Tb8SkRbn-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250702/202507020016.Tb8SkRbn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507020016.Tb8SkRbn-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/accel/ethos/ethos_gem.c:216:3: error: expected expression
     216 |                 u32 element_size = BIT((fm->precision >> 1) & 0x3);
         |                 ^
>> drivers/accel/ethos/ethos_gem.c:217:60: error: use of undeclared identifier 'element_size'
     217 |                 addr += (c / 16) * fm->stride_c + (16 * x + (c & 0xf)) * element_size;
         |                                                                          ^
   drivers/accel/ethos/ethos_gem.c:299:4: error: expected expression
     299 |                         u64 srclen = dma_length(info, st.dma.mode, st.dma.size0, st.dma.size1, &st.dma.src);
         |                         ^
   drivers/accel/ethos/ethos_gem.c:304:44: error: use of undeclared identifier 'srclen'
     304 |                                  st.dma.src.region, st.dma.src.offset, srclen,
         |                                                                        ^
   4 errors generated.


vim +/element_size +217 drivers/accel/ethos/ethos_gem.c

   180	
   181	static u64 feat_matrix_length(struct ethos_validated_cmdstream_info *info,
   182				      struct feat_matrix *fm,
   183				      u32 x, u32 y, u32 c)
   184	{
   185		int storage = 0; // FIXME: support U85 3x1 tile
   186		int tile = 0;
   187	
   188		switch (storage) {
   189		case 0:
   190			if (x >= fm->width0 + 1) {
   191				x -= fm->width0 + 1;
   192				tile += 1;
   193			}
   194			if (y >= fm->height[tile] + 1) {
   195				y -= fm->height[tile] + 1;
   196				tile += 2;
   197			}
   198			break;
   199		case 1:
   200			if (y >= fm->height[1] + 1) {
   201				y -= fm->height[1] + 1;
   202				tile = 2;
   203			} else if (y >= fm->height[0] + 1) {
   204				y -= fm->height[0] + 1;
   205				tile = 1;
   206			}
   207			break;
   208		}
   209		u64 addr = fm->base[tile] + y * fm->stride_y;
   210	
   211		switch ((fm->precision >> 6) & 0x3) { // format
   212		case 0: //nhwc:
   213			addr += x * fm->stride_x + c;
   214			break;
   215		case 1: //nhcwb16:
   216			u32 element_size = BIT((fm->precision >> 1) & 0x3);
 > 217			addr += (c / 16) * fm->stride_c + (16 * x + (c & 0xf)) * element_size;
   218			break;
   219		}
   220	
   221		info->region_size[fm->region] = max(info->region_size[fm->region], addr + 1);
   222	
   223		return addr;
   224	}
   225	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
