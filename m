Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05D719DF4F;
	Wed, 18 Feb 2026 00:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771374448; cv=none; b=NSc+Cko2984vmXVJS12WNGUwHIxOz5vwdN0SeLlGo3ViEZG2sAZEweemr3cPEGSy2h05MUBedli+x6Yv3HtjOMjIGSZ8OIuPZTc1+O9UvaZaVV0x/yHmReE0SkouEA8SnWR1b5rUwiurW6pdNxgskHnWPGJA2gF3W1YX89r1HM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771374448; c=relaxed/simple;
	bh=fcWenNUMcYV2dYTPrnEXpTkuHZTjKtFPqvvPipIHmQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TWgZtlvZkaZeTDcntJ40NSz81yinBuluMTAHFNfFyWXr0hW1giDf4UVHnpo2Jk5/0uT79S3oTg7rraLZLzlOKkCiJhlRrx08TOvpGIX+kRMb//XAiWjNRYzQjfwNeOkgvUIJAWt9Vne8wZ/DWzM3gTnp72/5eu4kUS++OWF9+14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yi4JbAaN; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yi4JbAaN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771374447; x=1802910447;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fcWenNUMcYV2dYTPrnEXpTkuHZTjKtFPqvvPipIHmQw=;
  b=Yi4JbAaNGOwY9DT+FqnHihus5LLgo3wrtVdi0XHHk2w6rkh+P9Pi380q
   +eYe8lh/XUGf9NtWW7GIat3Ov/WhIP8wHlsPDpCCH0x1pZ+2p4sJxMfHn
   iqJpCZnS7Zwgmq0cUZjwyRSA77cyRNaA/bQ2cN+gVT6DrtKDbO5dx6tpU
   P/s668sM96ongCfux3CKux03MTMJrHJqLfmOdXT3qQnNhUC2U51hkVHn6
   ViI5P7SdHH4VWlYFnFCr0cgkvI/w2Vx7a8Mkh0+7ahgOLMbE5/7uHw28Q
   nhx3Yi/a/RNLq0QtmoxEn8EtioIBal5vTL/q96OZgZBMIOeXHciR+NyST
   g==;
X-CSE-ConnectionGUID: WREBXu/kQFi6pTJjYAaHzA==
X-CSE-MsgGUID: 8eNmH1E/Smq1+H9+k0QwgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="95082143"
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="95082143"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 16:27:27 -0800
X-CSE-ConnectionGUID: AoyUbSm4QxWvTyl/s2K+PA==
X-CSE-MsgGUID: ELDlXahcT5mjgqeEhxUaKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="244632599"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 17 Feb 2026 16:27:24 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsVPV-000000011s0-24GQ;
	Wed, 18 Feb 2026 00:27:21 +0000
Date: Wed, 18 Feb 2026 08:26:35 +0800
From: kernel test robot <lkp@intel.com>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>, linux-mm@kvack.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-dev@igalia.com,
	kernel@gpiccoli.net, gpiccoli@igalia.com,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Mike Rapoport <rppt@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 2/2] mm/memblock: Add reserve_mem debugfs info
Message-ID: <202602180820.Vi6LlvfF-lkp@intel.com>
References: <20260217195816.861684-3-gpiccoli@igalia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260217195816.861684-3-gpiccoli@igalia.com>

Hi Guilherme,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rppt-memblock/for-next]
[also build test WARNING on rppt-memblock/fixes akpm-mm/mm-everything linus/master v6.19 next-20260217]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Guilherme-G-Piccoli/mm-memblock-Print-out-errors-on-reserve_mem-parser/20260218-035935
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/memblock.git for-next
patch link:    https://lore.kernel.org/r/20260217195816.861684-3-gpiccoli%40igalia.com
patch subject: [PATCH 2/2] mm/memblock: Add reserve_mem debugfs info
config: s390-randconfig-002-20260218 (https://download.01.org/0day-ci/archive/20260218/202602180820.Vi6LlvfF-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e86750b29fa0ff207cd43213d66dabe565417638)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260218/202602180820.Vi6LlvfF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602180820.Vi6LlvfF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/memblock.c:2721:27: warning: unused variable 'flagname' [-Wunused-const-variable]
    2721 | static const char * const flagname[] = {
         |                           ^~~~~~~~
   1 warning generated.


vim +/flagname +2721 mm/memblock.c

1e4c64b71c9bf2 Steven Rostedt (Google    2024-06-13  2719) 
54091ffecefa11 Guilherme G. Piccoli      2026-02-17  2720  #ifdef CONFIG_DEBUG_FS
493f349e38d022 Yuwei Guan                2023-05-19 @2721  static const char * const flagname[] = {
493f349e38d022 Yuwei Guan                2023-05-19  2722  	[ilog2(MEMBLOCK_HOTPLUG)] = "HOTPLUG",
493f349e38d022 Yuwei Guan                2023-05-19  2723  	[ilog2(MEMBLOCK_MIRROR)] = "MIRROR",
493f349e38d022 Yuwei Guan                2023-05-19  2724  	[ilog2(MEMBLOCK_NOMAP)] = "NOMAP",
493f349e38d022 Yuwei Guan                2023-05-19  2725  	[ilog2(MEMBLOCK_DRIVER_MANAGED)] = "DRV_MNG",
4f155af0ae4464 Anshuman Khandual         2024-02-09  2726  	[ilog2(MEMBLOCK_RSRV_NOINIT)] = "RSV_NIT",
4c78cc596bb8d3 Mike Rapoport (Microsoft  2025-05-09  2727) 	[ilog2(MEMBLOCK_RSRV_KERN)] = "RSV_KERN",
d59f43b5748092 Alexander Graf            2025-05-09  2728  	[ilog2(MEMBLOCK_KHO_SCRATCH)] = "KHO_SCRATCH",
493f349e38d022 Yuwei Guan                2023-05-19  2729  };
6d03b885f0926a Benjamin Herrenschmidt    2010-07-06  2730  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
