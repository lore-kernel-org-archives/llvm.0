Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75FAA2D;
	Sun,  9 Jun 2024 00:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717892083; cv=none; b=I/rQmwToIWoPYR0w6B+heXHFEZe7rdylWQ3Ip5+xmMpu1cWIqM9ABwU+eh0Ne9Rr+LOr9O1X75by3nrX9OjAfBoyI5jiqw9syja9gNt0RwALekk4/vGJdB0qDbwABJa/p23FE+5ooWLewLtT+jXeaYeZUBQlj13WPiSKEIgnou4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717892083; c=relaxed/simple;
	bh=Or1KHkEWqdpHZIaxIWZyYW6KKd+skJI2oKoCcFTxOCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kLDMQSOUYhS3S/whwNAAkuHGFsARKw7VCWjFvgF3QWYYPRQJl1plRurcpTypco25NPqWzC/+rXMFrshqBrOAF5FdoSZXP53nqtZCM1p/yrHv62aay3/eSFlHYhtviRmRtBCRCn7QLbCQI3d2MELyJTC1qB4UJuNAF5fdGFbCM9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=djbSwd4y; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="djbSwd4y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717892081; x=1749428081;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Or1KHkEWqdpHZIaxIWZyYW6KKd+skJI2oKoCcFTxOCA=;
  b=djbSwd4yDwquy9EUc9j9Y6FR/B9+x54OsPw9ln4aSH7q2ioEfQv3xPER
   2hg0nlYYol6jVJhIVghN+hdQ7h9xglBsUj5j3eSK92Yy1XQMgXf/U133u
   yAzYBW25Q00UzK1YEaQkk1h8li3DuezrsGgRSWYA9l8ubTCch1hoIXGMz
   PZRlWwCq4jzsDAHuRZlm8Lo8Dv+xZ4F/R5H0wAjMOK90Eh8Tmm9sSlmDN
   bl8TmaqAQafGvN4EYBcq5PQ9XplgO7qvIAJ/CxPPTF4hAdGW3EN7uUdAN
   M7VjOQojIHuOTpSyx/3IpM0p4k4ER8/9l8mGmdgWU+/c7EUKMDMyB5nCc
   w==;
X-CSE-ConnectionGUID: BZX0K/yxSFu83az5e7gF5g==
X-CSE-MsgGUID: 7sFGl3MvR2u0XTSUXnjVVw==
X-IronPort-AV: E=McAfee;i="6600,9927,11097"; a="14722126"
X-IronPort-AV: E=Sophos;i="6.08,224,1712646000"; 
   d="scan'208";a="14722126"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2024 17:14:40 -0700
X-CSE-ConnectionGUID: B7/qBjeyQWGxhRv8T0mQgg==
X-CSE-MsgGUID: rEbZHrH9QTCeGZsp1DFrIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,224,1712646000"; 
   d="scan'208";a="43239393"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 08 Jun 2024 17:14:34 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sG6Cd-0000fm-15;
	Sun, 09 Jun 2024 00:14:31 +0000
Date: Sun, 9 Jun 2024 08:13:33 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Xu <dxu@dxuuu.xyz>, rostedt@goodmis.org, martin.lau@linux.dev,
	shuah@kernel.org, song@kernel.org, mhiramat@kernel.org,
	ast@kernel.org, andrii@kernel.org, pabeni@redhat.com,
	ebiggers@kernel.org, tytso@mit.edu, vadim.fedorenko@linux.dev,
	eddyz87@gmail.com, davem@davemloft.net, edumazet@google.com,
	daniel@iogearbox.net, hawk@kernel.org, kuba@kernel.org,
	john.fastabend@gmail.com, olsajiri@gmail.com, quentin@isovalent.com,
	alan.maguire@oracle.com, acme@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	yonghong.song@linux.dev, kpsingh@kernel.org, sdf@google.com,
	haoluo@google.com, jolsa@kernel.org, mathieu.desnoyers@efficios.com,
	mykolal@fb.com, fsverity@lists.linux.dev
Subject: Re: [PATCH bpf-next v4 09/12] bpf: treewide: Align kfunc signatures
 to prog point-of-view
Message-ID: <202406090852.FB1i4svo-lkp@intel.com>
References: <677377439845fcb9135151d1dac1102ed3d6c924.1717881178.git.dxu@dxuuu.xyz>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <677377439845fcb9135151d1dac1102ed3d6c924.1717881178.git.dxu@dxuuu.xyz>

Hi Daniel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Xu/kbuild-bpf-Tell-pahole-to-DECL_TAG-kfuncs/20240609-052326
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/677377439845fcb9135151d1dac1102ed3d6c924.1717881178.git.dxu%40dxuuu.xyz
patch subject: [PATCH bpf-next v4 09/12] bpf: treewide: Align kfunc signatures to prog point-of-view
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240609/202406090852.FB1i4svo-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240609/202406090852.FB1i4svo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406090852.FB1i4svo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/bpf/helpers.c:2464: warning: Function parameter or struct member 'p' not described in 'bpf_dynptr_slice'
>> kernel/bpf/helpers.c:2464: warning: Excess function parameter 'ptr' description in 'bpf_dynptr_slice'
>> kernel/bpf/helpers.c:2549: warning: Function parameter or struct member 'p' not described in 'bpf_dynptr_slice_rdwr'
>> kernel/bpf/helpers.c:2549: warning: Excess function parameter 'ptr' description in 'bpf_dynptr_slice_rdwr'


vim +2464 kernel/bpf/helpers.c

3f0e6f2b41d35d David Vernet       2022-11-22  2433  
66e3a13e7c2c44 Joanne Koong       2023-03-01  2434  /**
7ce60b110eece1 David Vernet       2023-03-01  2435   * bpf_dynptr_slice() - Obtain a read-only pointer to the dynptr data.
7ce60b110eece1 David Vernet       2023-03-01  2436   * @ptr: The dynptr whose data slice to retrieve
7ce60b110eece1 David Vernet       2023-03-01  2437   * @offset: Offset into the dynptr
3bda08b63670c3 Daniel Rosenberg   2023-05-05  2438   * @buffer__opt: User-provided buffer to copy contents into.  May be NULL
3bda08b63670c3 Daniel Rosenberg   2023-05-05  2439   * @buffer__szk: Size (in bytes) of the buffer if present. This is the
3bda08b63670c3 Daniel Rosenberg   2023-05-05  2440   *               length of the requested slice. This must be a constant.
66e3a13e7c2c44 Joanne Koong       2023-03-01  2441   *
66e3a13e7c2c44 Joanne Koong       2023-03-01  2442   * For non-skb and non-xdp type dynptrs, there is no difference between
66e3a13e7c2c44 Joanne Koong       2023-03-01  2443   * bpf_dynptr_slice and bpf_dynptr_data.
66e3a13e7c2c44 Joanne Koong       2023-03-01  2444   *
3bda08b63670c3 Daniel Rosenberg   2023-05-05  2445   *  If buffer__opt is NULL, the call will fail if buffer_opt was needed.
3bda08b63670c3 Daniel Rosenberg   2023-05-05  2446   *
66e3a13e7c2c44 Joanne Koong       2023-03-01  2447   * If the intention is to write to the data slice, please use
66e3a13e7c2c44 Joanne Koong       2023-03-01  2448   * bpf_dynptr_slice_rdwr.
66e3a13e7c2c44 Joanne Koong       2023-03-01  2449   *
66e3a13e7c2c44 Joanne Koong       2023-03-01  2450   * The user must check that the returned pointer is not null before using it.
66e3a13e7c2c44 Joanne Koong       2023-03-01  2451   *
66e3a13e7c2c44 Joanne Koong       2023-03-01  2452   * Please note that in the case of skb and xdp dynptrs, bpf_dynptr_slice
66e3a13e7c2c44 Joanne Koong       2023-03-01  2453   * does not change the underlying packet data pointers, so a call to
66e3a13e7c2c44 Joanne Koong       2023-03-01  2454   * bpf_dynptr_slice will not invalidate any ctx->data/data_end pointers in
66e3a13e7c2c44 Joanne Koong       2023-03-01  2455   * the bpf program.
66e3a13e7c2c44 Joanne Koong       2023-03-01  2456   *
7ce60b110eece1 David Vernet       2023-03-01  2457   * Return: NULL if the call failed (eg invalid dynptr), pointer to a read-only
66e3a13e7c2c44 Joanne Koong       2023-03-01  2458   * data slice (can be either direct pointer to the data or a pointer to the user
66e3a13e7c2c44 Joanne Koong       2023-03-01  2459   * provided buffer, with its contents containing the data, if unable to obtain
66e3a13e7c2c44 Joanne Koong       2023-03-01  2460   * direct pointer)
66e3a13e7c2c44 Joanne Koong       2023-03-01  2461   */
ec3b75c0e6eb53 Daniel Xu          2024-06-08  2462  __bpf_kfunc void *bpf_dynptr_slice(const struct bpf_dynptr *p, u32 offset,
3bda08b63670c3 Daniel Rosenberg   2023-05-05  2463  				   void *buffer__opt, u32 buffer__szk)
66e3a13e7c2c44 Joanne Koong       2023-03-01 @2464  {
ec3b75c0e6eb53 Daniel Xu          2024-06-08  2465  	const struct bpf_dynptr_kern *ptr = (struct bpf_dynptr_kern *)p;
66e3a13e7c2c44 Joanne Koong       2023-03-01  2466  	enum bpf_dynptr_type type;
66e3a13e7c2c44 Joanne Koong       2023-03-01  2467  	u32 len = buffer__szk;
66e3a13e7c2c44 Joanne Koong       2023-03-01  2468  	int err;
66e3a13e7c2c44 Joanne Koong       2023-03-01  2469  
66e3a13e7c2c44 Joanne Koong       2023-03-01  2470  	if (!ptr->data)
c45eac537bd8b4 Joanne Koong       2023-03-01  2471  		return NULL;
66e3a13e7c2c44 Joanne Koong       2023-03-01  2472  
66e3a13e7c2c44 Joanne Koong       2023-03-01  2473  	err = bpf_dynptr_check_off_len(ptr, offset, len);
66e3a13e7c2c44 Joanne Koong       2023-03-01  2474  	if (err)
c45eac537bd8b4 Joanne Koong       2023-03-01  2475  		return NULL;
66e3a13e7c2c44 Joanne Koong       2023-03-01  2476  
66e3a13e7c2c44 Joanne Koong       2023-03-01  2477  	type = bpf_dynptr_get_type(ptr);
66e3a13e7c2c44 Joanne Koong       2023-03-01  2478  
66e3a13e7c2c44 Joanne Koong       2023-03-01  2479  	switch (type) {
66e3a13e7c2c44 Joanne Koong       2023-03-01  2480  	case BPF_DYNPTR_TYPE_LOCAL:
66e3a13e7c2c44 Joanne Koong       2023-03-01  2481  	case BPF_DYNPTR_TYPE_RINGBUF:
66e3a13e7c2c44 Joanne Koong       2023-03-01  2482  		return ptr->data + ptr->offset + offset;
66e3a13e7c2c44 Joanne Koong       2023-03-01  2483  	case BPF_DYNPTR_TYPE_SKB:
6f5a630d7c57cd Alexei Starovoitov 2023-07-18  2484  		if (buffer__opt)
3bda08b63670c3 Daniel Rosenberg   2023-05-05  2485  			return skb_header_pointer(ptr->data, ptr->offset + offset, len, buffer__opt);
6f5a630d7c57cd Alexei Starovoitov 2023-07-18  2486  		else
6f5a630d7c57cd Alexei Starovoitov 2023-07-18  2487  			return skb_pointer_if_linear(ptr->data, ptr->offset + offset, len);
66e3a13e7c2c44 Joanne Koong       2023-03-01  2488  	case BPF_DYNPTR_TYPE_XDP:
66e3a13e7c2c44 Joanne Koong       2023-03-01  2489  	{
66e3a13e7c2c44 Joanne Koong       2023-03-01  2490  		void *xdp_ptr = bpf_xdp_pointer(ptr->data, ptr->offset + offset, len);
5426700e6841bf Kui-Feng Lee       2023-08-03  2491  		if (!IS_ERR_OR_NULL(xdp_ptr))
66e3a13e7c2c44 Joanne Koong       2023-03-01  2492  			return xdp_ptr;
66e3a13e7c2c44 Joanne Koong       2023-03-01  2493  
3bda08b63670c3 Daniel Rosenberg   2023-05-05  2494  		if (!buffer__opt)
3bda08b63670c3 Daniel Rosenberg   2023-05-05  2495  			return NULL;
3bda08b63670c3 Daniel Rosenberg   2023-05-05  2496  		bpf_xdp_copy_buf(ptr->data, ptr->offset + offset, buffer__opt, len, false);
3bda08b63670c3 Daniel Rosenberg   2023-05-05  2497  		return buffer__opt;
66e3a13e7c2c44 Joanne Koong       2023-03-01  2498  	}
66e3a13e7c2c44 Joanne Koong       2023-03-01  2499  	default:
66e3a13e7c2c44 Joanne Koong       2023-03-01  2500  		WARN_ONCE(true, "unknown dynptr type %d\n", type);
c45eac537bd8b4 Joanne Koong       2023-03-01  2501  		return NULL;
66e3a13e7c2c44 Joanne Koong       2023-03-01  2502  	}
66e3a13e7c2c44 Joanne Koong       2023-03-01  2503  }
66e3a13e7c2c44 Joanne Koong       2023-03-01  2504  
66e3a13e7c2c44 Joanne Koong       2023-03-01  2505  /**
7ce60b110eece1 David Vernet       2023-03-01  2506   * bpf_dynptr_slice_rdwr() - Obtain a writable pointer to the dynptr data.
7ce60b110eece1 David Vernet       2023-03-01  2507   * @ptr: The dynptr whose data slice to retrieve
7ce60b110eece1 David Vernet       2023-03-01  2508   * @offset: Offset into the dynptr
3bda08b63670c3 Daniel Rosenberg   2023-05-05  2509   * @buffer__opt: User-provided buffer to copy contents into. May be NULL
3bda08b63670c3 Daniel Rosenberg   2023-05-05  2510   * @buffer__szk: Size (in bytes) of the buffer if present. This is the
3bda08b63670c3 Daniel Rosenberg   2023-05-05  2511   *               length of the requested slice. This must be a constant.
66e3a13e7c2c44 Joanne Koong       2023-03-01  2512   *
66e3a13e7c2c44 Joanne Koong       2023-03-01  2513   * For non-skb and non-xdp type dynptrs, there is no difference between
66e3a13e7c2c44 Joanne Koong       2023-03-01  2514   * bpf_dynptr_slice and bpf_dynptr_data.
66e3a13e7c2c44 Joanne Koong       2023-03-01  2515   *
3bda08b63670c3 Daniel Rosenberg   2023-05-05  2516   * If buffer__opt is NULL, the call will fail if buffer_opt was needed.
3bda08b63670c3 Daniel Rosenberg   2023-05-05  2517   *
66e3a13e7c2c44 Joanne Koong       2023-03-01  2518   * The returned pointer is writable and may point to either directly the dynptr
66e3a13e7c2c44 Joanne Koong       2023-03-01  2519   * data at the requested offset or to the buffer if unable to obtain a direct
66e3a13e7c2c44 Joanne Koong       2023-03-01  2520   * data pointer to (example: the requested slice is to the paged area of an skb
66e3a13e7c2c44 Joanne Koong       2023-03-01  2521   * packet). In the case where the returned pointer is to the buffer, the user
66e3a13e7c2c44 Joanne Koong       2023-03-01  2522   * is responsible for persisting writes through calling bpf_dynptr_write(). This
66e3a13e7c2c44 Joanne Koong       2023-03-01  2523   * usually looks something like this pattern:
66e3a13e7c2c44 Joanne Koong       2023-03-01  2524   *
66e3a13e7c2c44 Joanne Koong       2023-03-01  2525   * struct eth_hdr *eth = bpf_dynptr_slice_rdwr(&dynptr, 0, buffer, sizeof(buffer));
66e3a13e7c2c44 Joanne Koong       2023-03-01  2526   * if (!eth)
66e3a13e7c2c44 Joanne Koong       2023-03-01  2527   *	return TC_ACT_SHOT;
66e3a13e7c2c44 Joanne Koong       2023-03-01  2528   *
66e3a13e7c2c44 Joanne Koong       2023-03-01  2529   * // mutate eth header //
66e3a13e7c2c44 Joanne Koong       2023-03-01  2530   *
66e3a13e7c2c44 Joanne Koong       2023-03-01  2531   * if (eth == buffer)
66e3a13e7c2c44 Joanne Koong       2023-03-01  2532   *	bpf_dynptr_write(&ptr, 0, buffer, sizeof(buffer), 0);
66e3a13e7c2c44 Joanne Koong       2023-03-01  2533   *
66e3a13e7c2c44 Joanne Koong       2023-03-01  2534   * Please note that, as in the example above, the user must check that the
66e3a13e7c2c44 Joanne Koong       2023-03-01  2535   * returned pointer is not null before using it.
66e3a13e7c2c44 Joanne Koong       2023-03-01  2536   *
66e3a13e7c2c44 Joanne Koong       2023-03-01  2537   * Please also note that in the case of skb and xdp dynptrs, bpf_dynptr_slice_rdwr
66e3a13e7c2c44 Joanne Koong       2023-03-01  2538   * does not change the underlying packet data pointers, so a call to
66e3a13e7c2c44 Joanne Koong       2023-03-01  2539   * bpf_dynptr_slice_rdwr will not invalidate any ctx->data/data_end pointers in
66e3a13e7c2c44 Joanne Koong       2023-03-01  2540   * the bpf program.
66e3a13e7c2c44 Joanne Koong       2023-03-01  2541   *
7ce60b110eece1 David Vernet       2023-03-01  2542   * Return: NULL if the call failed (eg invalid dynptr), pointer to a
66e3a13e7c2c44 Joanne Koong       2023-03-01  2543   * data slice (can be either direct pointer to the data or a pointer to the user
66e3a13e7c2c44 Joanne Koong       2023-03-01  2544   * provided buffer, with its contents containing the data, if unable to obtain
66e3a13e7c2c44 Joanne Koong       2023-03-01  2545   * direct pointer)
66e3a13e7c2c44 Joanne Koong       2023-03-01  2546   */
ec3b75c0e6eb53 Daniel Xu          2024-06-08  2547  __bpf_kfunc void *bpf_dynptr_slice_rdwr(const struct bpf_dynptr *p, u32 offset,
3bda08b63670c3 Daniel Rosenberg   2023-05-05  2548  					void *buffer__opt, u32 buffer__szk)
66e3a13e7c2c44 Joanne Koong       2023-03-01 @2549  {
ec3b75c0e6eb53 Daniel Xu          2024-06-08  2550  	const struct bpf_dynptr_kern *ptr = (struct bpf_dynptr_kern *)p;
ec3b75c0e6eb53 Daniel Xu          2024-06-08  2551  
540ccf96ddbc17 Joanne Koong       2023-04-20  2552  	if (!ptr->data || __bpf_dynptr_is_rdonly(ptr))
c45eac537bd8b4 Joanne Koong       2023-03-01  2553  		return NULL;
66e3a13e7c2c44 Joanne Koong       2023-03-01  2554  
66e3a13e7c2c44 Joanne Koong       2023-03-01  2555  	/* bpf_dynptr_slice_rdwr is the same logic as bpf_dynptr_slice.
66e3a13e7c2c44 Joanne Koong       2023-03-01  2556  	 *
66e3a13e7c2c44 Joanne Koong       2023-03-01  2557  	 * For skb-type dynptrs, it is safe to write into the returned pointer
a7de265cb2d849 Rafael Passos      2024-04-17  2558  	 * if the bpf program allows skb data writes. There are two possibilities
66e3a13e7c2c44 Joanne Koong       2023-03-01  2559  	 * that may occur when calling bpf_dynptr_slice_rdwr:
66e3a13e7c2c44 Joanne Koong       2023-03-01  2560  	 *
66e3a13e7c2c44 Joanne Koong       2023-03-01  2561  	 * 1) The requested slice is in the head of the skb. In this case, the
66e3a13e7c2c44 Joanne Koong       2023-03-01  2562  	 * returned pointer is directly to skb data, and if the skb is cloned, the
66e3a13e7c2c44 Joanne Koong       2023-03-01  2563  	 * verifier will have uncloned it (see bpf_unclone_prologue()) already.
66e3a13e7c2c44 Joanne Koong       2023-03-01  2564  	 * The pointer can be directly written into.
66e3a13e7c2c44 Joanne Koong       2023-03-01  2565  	 *
66e3a13e7c2c44 Joanne Koong       2023-03-01  2566  	 * 2) Some portion of the requested slice is in the paged buffer area.
66e3a13e7c2c44 Joanne Koong       2023-03-01  2567  	 * In this case, the requested data will be copied out into the buffer
66e3a13e7c2c44 Joanne Koong       2023-03-01  2568  	 * and the returned pointer will be a pointer to the buffer. The skb
66e3a13e7c2c44 Joanne Koong       2023-03-01  2569  	 * will not be pulled. To persist the write, the user will need to call
66e3a13e7c2c44 Joanne Koong       2023-03-01  2570  	 * bpf_dynptr_write(), which will pull the skb and commit the write.
66e3a13e7c2c44 Joanne Koong       2023-03-01  2571  	 *
66e3a13e7c2c44 Joanne Koong       2023-03-01  2572  	 * Similarly for xdp programs, if the requested slice is not across xdp
66e3a13e7c2c44 Joanne Koong       2023-03-01  2573  	 * fragments, then a direct pointer will be returned, otherwise the data
66e3a13e7c2c44 Joanne Koong       2023-03-01  2574  	 * will be copied out into the buffer and the user will need to call
66e3a13e7c2c44 Joanne Koong       2023-03-01  2575  	 * bpf_dynptr_write() to commit changes.
66e3a13e7c2c44 Joanne Koong       2023-03-01  2576  	 */
ec3b75c0e6eb53 Daniel Xu          2024-06-08  2577  	return bpf_dynptr_slice(p, offset, buffer__opt, buffer__szk);
66e3a13e7c2c44 Joanne Koong       2023-03-01  2578  }
66e3a13e7c2c44 Joanne Koong       2023-03-01  2579  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
