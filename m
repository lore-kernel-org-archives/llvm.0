Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4AD4D2FF;
	Wed,  5 Mar 2025 04:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741147402; cv=none; b=IsU/3GSEyXxwBwyUi5SWQi5b/ZSzlv3AuU7HVWzk+1Pbvs4+76ekaNxlh1if6IU/HB3Jc3BrYnL9tpVa885S/WdvA4tNr8wEBsmo+K6WnWhPrnj5V4HXzRRPw+Ah54KlRoW6aDLqElyWaRfTkyboyFlCY+e3cgQrjHaN36JdhWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741147402; c=relaxed/simple;
	bh=xGZG0eIgNsWI19/PyMFH+d/vDmIOZE6wh7oYjPVqSBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HEoyUzZkz0djam55RMpveC9ll5Pr5JyxIVdN7k9yS4uHlP3E2HmiFbTvFEMwyD6dIK5Na0/rLuOJ0nU2Asi0UZ7WrioAMlVNks4KrideC4oK7mnSJB03mox/8ari0enaZKOAHngvo3nxzol6jasLkLFVjTViNxvL1c7yfcTAqvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IRXSo9Mt; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IRXSo9Mt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741147401; x=1772683401;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xGZG0eIgNsWI19/PyMFH+d/vDmIOZE6wh7oYjPVqSBA=;
  b=IRXSo9MtbvjVnzDFaaBDXu2Y/mtORaf7oJMPovd9ohB8khklgTl18MU6
   mlhOjmcFlDrTNs2DtIaCj0D3lvtOOUngTx2zuOIqSB89oAWd9qvHDQnNO
   AUSWVopdKf5Ta2pU0n/pSY3vr6YHfrnveZUaLDDRZFgmyiYmulN3VA3ri
   bgTTdyYMV1GEPL9eTP1A35KXbhJKBxFt7JWa/2w5PiBZs/40moRNFfwgi
   BgbGqrhswReA+KJLSXgEUePtD6LTP3VZpCuiHR2ANlBYSg0AQ97KtGN0c
   q2R0TmICbmFqAJGVmjEzMQ8FA9UX3Tbyvotmno2j927/PtUWMCt10GBDW
   g==;
X-CSE-ConnectionGUID: 6aGVVEPaQFWM1ECV9LTHOg==
X-CSE-MsgGUID: Y9uqc9CaTfOysm5+lHIRCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="67462024"
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; 
   d="scan'208";a="67462024"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 20:03:20 -0800
X-CSE-ConnectionGUID: xST86eUXSKCAwU7ohArOMQ==
X-CSE-MsgGUID: /FtWZoW/TMK9+b29Ps85Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; 
   d="scan'208";a="118573717"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 04 Mar 2025 20:03:18 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpfyW-000KZe-2i;
	Wed, 05 Mar 2025 04:03:16 +0000
Date: Wed, 5 Mar 2025 12:02:59 +0800
From: kernel test robot <lkp@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 3/8] ring-buffer: Add ring_buffer_meta_scratch()
Message-ID: <202503051115.YJCV0nG8-lkp@intel.com>
References: <20250304012548.100322331@goodmis.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304012548.100322331@goodmis.org>

Hi Steven,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.14-rc5]
[cannot apply to trace/for-next next-20250304]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Steven-Rostedt/ring-buffer-Use-kaslr-address-instead-of-text-delta/20250304-092821
base:   linus/master
patch link:    https://lore.kernel.org/r/20250304012548.100322331%40goodmis.org
patch subject: [PATCH v3 3/8] ring-buffer: Add ring_buffer_meta_scratch()
config: i386-buildonly-randconfig-002-20250305 (https://download.01.org/0day-ci/archive/20250305/202503051115.YJCV0nG8-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250305/202503051115.YJCV0nG8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503051115.YJCV0nG8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/trace/ring_buffer.c:2546: warning: Function parameter or struct member 'scratch_size' not described in '__ring_buffer_alloc_range'
   kernel/trace/ring_buffer.c:2560: warning: Function parameter or struct member 'kaslr_addr' not described in 'ring_buffer_last_boot_delta'
   kernel/trace/ring_buffer.c:2560: warning: Excess function parameter 'text' description in 'ring_buffer_last_boot_delta'
   kernel/trace/ring_buffer.c:2560: warning: Excess function parameter 'data' description in 'ring_buffer_last_boot_delta'


vim +2546 kernel/trace/ring_buffer.c

7a8e76a3829f10 Steven Rostedt          2008-09-29  2526  
be68d63a139bd4 Steven Rostedt (Google  2024-06-12  2527) /**
be68d63a139bd4 Steven Rostedt (Google  2024-06-12  2528)  * __ring_buffer_alloc_range - allocate a new ring_buffer from existing memory
be68d63a139bd4 Steven Rostedt (Google  2024-06-12  2529)  * @size: the size in bytes per cpu that is needed.
be68d63a139bd4 Steven Rostedt (Google  2024-06-12  2530)  * @flags: attributes to set for the ring buffer.
0b60a7fb60b7d7 Julia Lawall            2024-09-30  2531   * @order: sub-buffer order
be68d63a139bd4 Steven Rostedt (Google  2024-06-12  2532)  * @start: start of allocated range
be68d63a139bd4 Steven Rostedt (Google  2024-06-12  2533)  * @range_size: size of allocated range
be68d63a139bd4 Steven Rostedt (Google  2024-06-12  2534)  * @key: ring buffer reader_lock_key.
be68d63a139bd4 Steven Rostedt (Google  2024-06-12  2535)  *
be68d63a139bd4 Steven Rostedt (Google  2024-06-12  2536)  * Currently the only flag that is available is the RB_FL_OVERWRITE
be68d63a139bd4 Steven Rostedt (Google  2024-06-12  2537)  * flag. This flag means that the buffer will overwrite old data
be68d63a139bd4 Steven Rostedt (Google  2024-06-12  2538)  * when the buffer wraps. If this flag is not set, the buffer will
be68d63a139bd4 Steven Rostedt (Google  2024-06-12  2539)  * drop data when the tail hits the head.
be68d63a139bd4 Steven Rostedt (Google  2024-06-12  2540)  */
be68d63a139bd4 Steven Rostedt (Google  2024-06-12  2541) struct trace_buffer *__ring_buffer_alloc_range(unsigned long size, unsigned flags,
be68d63a139bd4 Steven Rostedt (Google  2024-06-12  2542) 					       int order, unsigned long start,
be68d63a139bd4 Steven Rostedt (Google  2024-06-12  2543) 					       unsigned long range_size,
56953131fbcf4d Steven Rostedt          2025-03-03  2544  					       unsigned long scratch_size,
be68d63a139bd4 Steven Rostedt (Google  2024-06-12  2545) 					       struct lock_class_key *key)
be68d63a139bd4 Steven Rostedt (Google  2024-06-12 @2546) {
56953131fbcf4d Steven Rostedt          2025-03-03  2547  	return alloc_buffer(size, flags, order, start, start + range_size,
56953131fbcf4d Steven Rostedt          2025-03-03  2548  			    scratch_size, key);
be68d63a139bd4 Steven Rostedt (Google  2024-06-12  2549) }
be68d63a139bd4 Steven Rostedt (Google  2024-06-12  2550) 

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
