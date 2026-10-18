Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4823A4F33;
	Sun, 18 Oct 2026 07:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792308523; cv=none; b=r2CXbPq+MP1mTlQksDpcHgU8EZTVbR2LOkQGOyCk1XhVdsg0sUizBPDCSIEkQOk4yLD9pG7QnudwpSY1YIkPR3r8UIfueGu8kD0+Fi5YeFixL/qjrRkrRgVfdKGbrxTSsG1xawqvvGhJCihnEHwky6cx0uHHmp8MOqfZ3Evi2tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792308523; c=relaxed/simple;
	bh=W2mGBgnoPDCYHax+4P9Us4ufXUV4ACRjCUQXj0ydjy8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZQZk3M0FWrMsBECuRpSUbwPPxRTsvVtOgQYt5UWTR/WU11KwdHK0/npXY5QRjpfc7pdqQ454WbKgGN+LZnuK6pQrEo5xtiBuVARyACvoXkhfIL1CIGrpmt6jyi0UJu47iy+beTPYNTGMoVYJEtrBOhQ546TtBUa7o8lmwJcG+eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Va1nOlA8; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Va1nOlA8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792308523; x=1823844523;
  h=date:from:to:cc:subject:message-id;
  bh=W2mGBgnoPDCYHax+4P9Us4ufXUV4ACRjCUQXj0ydjy8=;
  b=Va1nOlA8gZPuTklo6M6nxSsQh1wTFgd/9arOX9hyDXsHL/cRVyMT7GwP
   I6k7kM+1tZafK5xik2IwBIS9ddz1lnGqaL0RJWvNa/H0LSSm+tDkpJUWF
   HkeH8X0b6GEcbZiJcbi5KYCGOydNIlpJonNysNm1Tb18Hkk2zvGcXE0O2
   avGYBBj5eCe3BHdKHoU99G3glSSVBWSf3pAmz8PBVb8vvTa5R+bc7DALh
   BR3ioWfiEOuv7UedyI3//oejkxFMfaaUrLqk6Wqzwua7Vfll2pYOfBp7Q
   3NTtmnXpxB6xp9NrIqnnLfq/qLVDWhXd/f4sSK8hJSa6wQd4Bve2nnRHI
   Q==;
X-CSE-ConnectionGUID: ClVYLYGmTCO6z0Yx7wq30Q==
X-CSE-MsgGUID: S7PKsDfKSc+pTX3DEWlZdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11938"; a="906347"
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="906347"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 00:28:42 -0700
X-CSE-ConnectionGUID: V+k7cSchTGqVNbqsv1se4A==
X-CSE-MsgGUID: +ZhlyMxCQv6GuvK9uoZGqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="2624543"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 18 Oct 2026 00:28:40 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xILJt-00000000KEu-1A9i;
	Sun, 18 Oct 2026 07:28:37 +0000
Date: Sun, 18 Oct 2026 15:28:02 +0800
From: kernel test robot <lkp@intel.com>
To: sofus <sofus.c@icloud.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/240-isp 63/92]
 drivers/media/platform/apple/avd/avd-vp9.c:197:8: error: call to undeclared
 function 'FIELD_PREP'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202610181520.1vfRMIBE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/240-isp
head:   c792edd0ffb515a81db3e039bc6e2a611c51d65b
commit: 5a2ea5f4d6517dd100d8b717e9eb203e6fa1114e [63/92] media: apple: avd: define static values and bitmasks
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20261018/202610181520.1vfRMIBE-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 6719b9e31d6a93099612c474eec76d9f41d0275a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261018/202610181520.1vfRMIBE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610181520.1vfRMIBE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/platform/apple/avd/avd-vp9.c:197:8: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     197 |                 push(AVD_REF_FLAG_CONST, "hdr_9c_ref_100");
         |                      ^
   drivers/media/platform/apple/avd/avd-inst.h:142:29: note: expanded from macro 'AVD_REF_FLAG_CONST'
     142 | #define AVD_REF_FLAG_CONST              FIELD_PREP(BIT(24), 1)
         |                                         ^
   drivers/media/platform/apple/avd/avd-vp9.c:266:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     266 |         return VP9_FEAT_LVL_ALT_Q(feature_val) | enabled;
         |                ^
   drivers/media/platform/apple/avd/avd-vp9.c:42:32: note: expanded from macro 'VP9_FEAT_LVL_ALT_Q'
      42 | #define VP9_FEAT_LVL_ALT_Q(v)           FIELD_PREP(GENMASK(21, 12), v)
         |                                         ^
   drivers/media/platform/apple/avd/avd-vp9.c:281:7: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     281 |         push(AVD_OP_EXEC
         |              ^
   drivers/media/platform/apple/avd/avd-inst.h:15:23: note: expanded from macro 'AVD_OP_EXEC'
      15 | #define AVD_OP_EXEC                     FIELD_PREP(GENMASK(31, 24), 0x2b)
         |                                         ^
   drivers/media/platform/apple/avd/avd-vp9.c:434:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     434 |                         push(AVD_OP_CODED_DATA |
         |                              ^
   drivers/media/platform/apple/avd/avd-inst.h:45:28: note: expanded from macro 'AVD_OP_CODED_DATA'
      45 | #define AVD_OP_CODED_DATA               FIELD_PREP(GENMASK(31, 20), 0x2d8)
         |                                         ^
   4 errors generated.


vim +/FIELD_PREP +197 drivers/media/platform/apple/avd/avd-vp9.c

   173	
   174	static void set_refs(struct avd_ctx *ctx, struct avd_vp9_run *run)
   175	{
   176		const struct v4l2_ctrl_vp9_frame *frame = run->decode_params;
   177		struct avd_dev *avd = ctx->dev;
   178		struct avd_decoded_buffer *dst, *ref_buf[4];
   179		dma_addr_t addr;
   180	
   181		dst = vb2_to_avd_decoded_buf(&run->base.bufs.dst->vb2_buf);
   182	
   183		ref_buf[0] = avd_get_ref_buf(ctx, &dst->base.vb, frame->last_frame_ts);
   184		ref_buf[1] = avd_get_ref_buf(ctx, &dst->base.vb, frame->golden_frame_ts);
   185		ref_buf[2] = avd_get_ref_buf(ctx, &dst->base.vb, frame->alt_frame_ts);
   186	
   187		push(INST_DMA3, "cm3_dma_config_7");
   188		push(INST_DMA3, "cm3_dma_config_8");
   189		push(INST_DMA3, "cm3_dma_config_9");
   190	
   191		for (int i = 0; i < V4L2_VP9_NUM_FRAME_CTX - 1; i++) {
   192	
   193			addr = vb2_dma_contig_plane_dma_addr(&ref_buf[i]->base.vb.vb2_buf, 0)
   194				+ (ref_buf[i]->base.vb.planes[0].length - ref_buf[i]->rvra.size);
   195	
   196			/* TODO */
 > 197			push(AVD_REF_FLAG_CONST, "hdr_9c_ref_100");
   198			push(AVD_HDR_HEIGHT(ref_buf[i]->vp9.height - 1) |
   199					AVD_HDR_WIDTH(ref_buf[i]->vp9.width - 1),
   200					"hdr_70_ref_height_width");
   201			push(0x40004000, "hdr_7c_ref_align");
   202	
   203			push_rvra(avd, ctx, addr, ref_buf[i]->rvra.offsets);
   204		}
   205	}
   206	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
