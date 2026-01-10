Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D13C2628D;
	Sat, 10 Jan 2026 16:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768060931; cv=none; b=npOmSPIGaCDxq/+FkE7/bDun7ECnu/rUzN3vouxUPNfTwGVNbLWOJtsBbFj4YUtRzngavZVFTpHboSjxHTo1kVWAD8PWJxr4MBgYy4cfLSVNQh9fPc/SKyK6h/lmmFrn9geWwN4v98FQVWMf/5TOVP/5BXEoxAx2Qoxoc5JmuHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768060931; c=relaxed/simple;
	bh=Hu/rnN+pmCak1D81SnF3itygoc7YPPwVUgjkZQnqHqc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=V7YV4XqR0QC/HIQzLmfdl+h1w7iEXj/23sRRhcxGTH8q9OrWfxDYIe8RAWLjypcMBR6s9ZNwJFsOgnuos7bbJhlrjYVI+7LWAU/l9QO4x0HA6BcAy2UfznQxf7FXZVl2way5zbEj4jo742FOF+9Ncxqp3s1TJ2slt6ruTnK0Zpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ENQF9wEJ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ENQF9wEJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768060930; x=1799596930;
  h=date:from:to:cc:subject:message-id;
  bh=Hu/rnN+pmCak1D81SnF3itygoc7YPPwVUgjkZQnqHqc=;
  b=ENQF9wEJBD9E9JjQa7jqKEgzEJMcsIm6pN9y4A4SBuZ+ePCjlAwM6rnG
   Kv4x3u549MTzVcCmeyt7WgfyDysH/GGl6D4QJSrxjNfyZ5En9Ha94y6q2
   iyx17RIvSEvG2fgrBy7gXKnygAn+Q2S8TFSQunLEmUCEft3EtFhX/YKjy
   5RDLz1F2PfsRGo9HT9BL6MNjqiNaXu2VwC6hpgyzzYlPNoJ/KIIEroPR+
   vIYyGqr/KK3PExwDF9UX0TRcl7jksTmsmjKP7xIIgolCXyS2coJqzR5aX
   E0vSbo8A8Wk9WTlOes5VKgE5Ihsx8jC0ICvxyoxafSsJiow44p7V18FDl
   A==;
X-CSE-ConnectionGUID: Yk6ZkJv8SIqy2Itt7YoYZw==
X-CSE-MsgGUID: vJax6GuUSISvqFaDgAuOpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11667"; a="80048139"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="80048139"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2026 08:02:08 -0800
X-CSE-ConnectionGUID: KVKIy6vvT9uKR/W6cL1yfw==
X-CSE-MsgGUID: ARCjczlFQzyCZFR0Zela8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="203729107"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Jan 2026 08:02:06 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vebPf-000000008qO-3bLi;
	Sat, 10 Jan 2026 16:02:03 +0000
Date: Sun, 11 Jan 2026 00:01:19 +0800
From: kernel test robot <lkp@intel.com>
To: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_sbi_dbtr_v2 53/60]
 drivers/hwtracing/rvtrace/rvtrace-ramsink.c:114:23: warning: variable
 'trram_ctrl' set but not used
Message-ID: <202601102338.Pa1VVkar-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_sbi_dbtr_v2
head:   5f72f4b05b79e6688ac8385791d1e5b6c4991b0a
commit: 77c6fe965e2073c3a334fcbef64f7a8d3c78829c [53/60] rvtrace: Add trace ramsink driver
config: riscv-randconfig-002-20260110 (https://download.01.org/0day-ci/archive/20260110/202601102338.Pa1VVkar-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260110/202601102338.Pa1VVkar-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601102338.Pa1VVkar-lkp@intel.com/

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
