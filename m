Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6EF63081D6;
	Mon, 16 Feb 2026 11:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771243081; cv=none; b=jKpgagQc6iNV5JydBV0NUgFPCWdfFbBgDNUXJxBCpazgNrKvKW4/x1cZ96hntxkEd/BloIafZ2B0u5t15s3s+0ZDkYQDBxU+SpGaL/lHOLVppaFg/HKJVIdOAuFt67JxWS6P3EYacmZ4QqrnO0Bx4eMhfTPTxZP+kYampz2Pd1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771243081; c=relaxed/simple;
	bh=rBp0TR9ex9tz9ao5Ts9Em3OoLQMEkFNchF02NkdCsRk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=W6lMCvvemYqDqN50/Gmf8PmwDnAKYdFwAZyif81gUKvbq693VurOQjdMMxxymaSo2E5RwuuUuv2BxXPpt4po5BzG7Y7gL8Vf2VCVAEelS/QP/rzr2B6rfYc855n+LYjgrPhYJwP2kAy3JB8NqSOpvOfrzyi84svlPjv9tX6X5bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EoziPyF4; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EoziPyF4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771243079; x=1802779079;
  h=date:from:to:cc:subject:message-id;
  bh=rBp0TR9ex9tz9ao5Ts9Em3OoLQMEkFNchF02NkdCsRk=;
  b=EoziPyF4WvWlpiUAhLIa+bJBIuwEyicU33lirRYymeV5/G9kkp/KD9zf
   af5cfEwBXelgUfbSUWP2op77PLiZGVEs1joNCSWgI5dL5GUTYT1KbwpxK
   uDSiwTKIqyy00MXKIykzM6mFjkGOUUK6TXPjUeOyEdL0f+ZcXloe0swRf
   s0Qq8bWdspT3OZIbVwfMdmhckarX2LDg74vIG1AL95lpgLXBOKsAsjkTN
   HBDgWIq2DUtpeZ5L4+lkGe70Avs26b9bxdR3V7TpHvn06nN1GrSc/dln6
   bYya7ttjFc8zkwfryKK5mPciQ1uSC6EhX9h2wJefo69yfHXcyncMAsnRD
   A==;
X-CSE-ConnectionGUID: LuME3koYRGSntPSRI8U8vA==
X-CSE-MsgGUID: 74MFC4kVS02l1MkryY9h8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="89734472"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; 
   d="scan'208";a="89734472"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 03:57:58 -0800
X-CSE-ConnectionGUID: FRlOA0T9SoOrGGjRRWbGBw==
X-CSE-MsgGUID: LV+R5wG3S4yMQyFsoqk9BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; 
   d="scan'208";a="212910883"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 16 Feb 2026 03:57:56 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrxEg-00000000znk-21cD;
	Mon, 16 Feb 2026 11:57:54 +0000
Date: Mon, 16 Feb 2026 19:56:54 +0800
From: kernel test robot <lkp@intel.com>
To: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_trace_support_v3 55/60]
 drivers/hwtracing/rvtrace/rvtrace-ramsink.c:114:23: warning: variable
 'trram_ctrl' set but not used
Message-ID: <202602161901.2CFPiPwM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_trace_support_v3
head:   42acf36a226e81d2e18eb340bbfd6d7ab09b8c1e
commit: 32999331eb99f67ab5abc1a7c8a62a8bf75ed0f2 [55/60] rvtrace: Add trace ramsink driver
config: riscv-randconfig-002-20260216 (https://download.01.org/0day-ci/archive/20260216/202602161901.2CFPiPwM-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e86750b29fa0ff207cd43213d66dabe565417638)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260216/202602161901.2CFPiPwM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602161901.2CFPiPwM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hwtracing/rvtrace/rvtrace-ramsink.c:114:23: warning: variable 'trram_ctrl' set but not used [-Wunused-but-set-variable]
     114 |         u32 wp_low, wp_high, trram_ctrl;
         |                              ^
   1 warning generated.


vim +/trram_ctrl +114 drivers/hwtracing/rvtrace/rvtrace-ramsink.c

   107	
   108	static size_t rvtrace_ramsink_copyto_auxbuf(struct rvtrace_component *comp,
   109						    struct rvtrace_perf_auxbuf *buf)
   110	{
   111		struct rvtrace_ramsink_priv *priv = dev_get_drvdata(&comp->dev);
   112		size_t size_wp_end = 0, size_start_wp = 0;
   113		struct trace_buf src, dst;
 > 114		u32 wp_low, wp_high, trram_ctrl;
   115		u64 buf_cur_head;
   116	
   117		dst.base = buf->base;
   118		dst.len = buf->length;
   119		dst.cur = buf->pos;
   120		src.base = priv->va;
   121		src.len = priv->size;
   122		wp_low = rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_WPLOW_OFF);
   123		wp_high = rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_WPHIGH_OFF);
   124		buf_cur_head = (u64)(wp_high) << 32 | wp_low;
   125		trram_ctrl = rvtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
   126		if (buf_cur_head & 0x1) {
   127			buf_cur_head &= ~RVTRACE_RAMSINK_WPLOW_WRAP;
   128			rvtrace_write32(comp->pdata, lower_32_bits(priv->start),
   129					RVTRACE_RAMSINK_WPLOW_OFF);
   130			rvtrace_write32(comp->pdata, upper_32_bits(priv->start),
   131					RVTRACE_RAMSINK_WPHIGH_OFF);
   132			src.cur = buf_cur_head - priv->start;
   133			size_wp_end = priv->end - buf_cur_head;
   134			tbuf_to_pbuf_copy(&src, &dst, size_wp_end);
   135		}
   136	
   137		src.cur = 0;
   138		size_start_wp = buf_cur_head - priv->start;
   139		tbuf_to_pbuf_copy(&src, &dst, size_start_wp);
   140		dev_dbg(&comp->dev, "Copied %zu bytes\n", size_wp_end + size_start_wp);
   141		return (size_wp_end + size_start_wp);
   142	}
   143	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
