Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793000992;
	b=WjR5wAqUuau6hi7R43fdX3YORlmTk7YPKvhdhmijZeAn8tbavqgK5JtHSNhHx3zGtD3Q
	 ZJZvDVL4gmzWNe0L1Jg/nCiKCvzprjuInA5icIoIaP+DXUxEuSRGV0SUZtwTAfBHfEkw7
	 SBoZDTm1k9la0MQbKfZRdbh5ngaQAHMfcCgWBhD+eMSm/V+aj6D0bmCFOItOzJ6yJV7Tz
	 wVKvVkt30slJ9NaWpaMpz9v2Z+op662v1etxJObAIID5Oo7yfqf2lMFJUjG825v6Zw7Ch
	 a8AzlA+AoXQ/cSU5dcTZ3cI5xWgOynQTtpvRsYSleTSksam+CH3LD70/jrMOKhgzWSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793000992;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=pbFUFm0BdUiP0R9n4hf+O3iMd+cAPYJ5M/p70xw3ss4=;
	b=l+hk/CDhYd3Gm8WBmDUZJ0dR1uvyxnLv/Dwxm+1eqFydyfvXkvl8KNvvBrhmKhC16Nw5
	 WmzwyzSHkvP2x4ruut15lhOB28RCP0jJLEeLCuH3XPPNSo1zWB+jmfaXFOvxClSqdTzCl
	 m0i78PrX+GQcSgDj/025uVLcKZUh107F6EcpSHa3vtui1Y1BxHWSWr+XUOOulvxt8pTY6
	 Akitje6rSahf9sn6aefE7RKKe4NmWHSPYYd0ngpPT8L2EAs8vxLfv+bxQB2tZLZ3BFj9x
	 8nRKZpXgfKqhRQxdfE8aVjzXrd+8PIcNp7IXkkz1ON6207iEMT3fwzEXjYYpyggxJbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZI10sNI4;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91BE5606A326;
	Mon, 26 Oct 2026 07:49:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91BE5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZI10sNI4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793000991; x=1824536991;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xdoP/3wkFtbyhTDEtPGlM0pOcxylHkC82Pv0VGU/oew=;
  b=ZI10sNI4NKKdYbEVpuT0g+AejFApikAmpA9QG/HVgQf89niO42WboB0v
   b05PgCsnRENXax1Olr7QwH/MA8AEN+brULg3gYnhHsIh0iNN85jvdjJZH
   JLkSJlcLvuFNKlXTItvNJqPYGgUNOydgiBhlyTlLNACbOT2U+NzXq3Xne
   q1aJWN99RXMHybgndEQ3sE7Nh4k9DIKdDOIGEV3BPEZW1enMunkaDm0sL
   K1fvRcxG/aXkKLSw8LsLRT+86G595XyVg6iWRdfm503ZYCQJVFBFdRCMi
   pX1lAOIw/iHCkpmNY5eunFKsix38o6RetC0eg3TSg3QXM3g7PnKA30ir+
   g==;
X-CSE-ConnectionGUID: CWTtCka8TsaGksm7Whis4A==
X-CSE-MsgGUID: Kfstx5NkR1iENvXqXHDtxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1648379"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1648379"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 00:49:51 -0700
X-CSE-ConnectionGUID: 7xMj5IMvRaezQaBy2FqKZA==
X-CSE-MsgGUID: MCjZAatsQZqL/d//rG0mHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4582440"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 26 Oct 2026 00:49:48 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLFSi-00000000VZi-1l2H;
	Mon, 26 Oct 2026 07:49:44 +0000
Date: Mon, 26 Oct 2026 15:48:51 +0800
From: kernel test robot <lkp@intel.com>
To: Philipp Stanner <phasta@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Arnd Bergmann <arnd@arndb.de>,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>,
	"Paul E . McKenney" <paulmck@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	Philipp Stanner <phasta@kernel.org>
Subject: Re: [PATCH 2/2] dma-buf/dma-fence: Order setting of the signaled-bit
 properly
Message-ID: <202610261518.t3m9Kwds-lkp@intel.com>
References: <20261021095512.1345191-4-phasta@kernel.org>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021095512.1345191-4-phasta@kernel.org>

Hi Philipp,

kernel test robot noticed the following build errors:

[auto build test ERROR on 1ecab8b0bad393750c60cc3819ce9c256595463c]

url:    https://github.com/intel-lab-lkp/linux/commits/Philipp-Stanner/asm-generic-bitops-Add-set_bit_release/20261021-115512
base:   1ecab8b0bad393750c60cc3819ce9c256595463c
patch link:    https://lore.kernel.org/r/20261021095512.1345191-4-phasta%40kernel.org
patch subject: [PATCH 2/2] dma-buf/dma-fence: Order setting of the signaled-bit properly
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20261026/202610261518.t3m9Kwds-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261026/202610261518.t3m9Kwds-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610261518.t3m9Kwds-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/dma-buf/dma-fence.c:393:2: error: call to undeclared function 'set_bit_release'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     393 |         set_bit_release(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags);
         |         ^
   1 error generated.


vim +/set_bit_release +393 drivers/dma-buf/dma-fence.c

   337	
   338	/**
   339	 * dma_fence_signal_timestamp_locked - signal completion of a fence
   340	 * @fence: the fence to signal
   341	 * @timestamp: fence signal timestamp in kernel's CLOCK_MONOTONIC time domain
   342	 *
   343	 * Signal completion for software callbacks on a fence, this will unblock
   344	 * dma_fence_wait() calls and run all the callbacks added with
   345	 * dma_fence_add_callback(). Can be called multiple times, but since a fence
   346	 * can only go from the unsignaled to the signaled state and not back, it will
   347	 * only be effective the first time. Set the timestamp provided as the fence
   348	 * signal timestamp.
   349	 *
   350	 * Unlike dma_fence_signal_timestamp(), this function must be called with
   351	 * &dma_fence.lock held.
   352	 */
   353	void dma_fence_signal_timestamp_locked(struct dma_fence *fence,
   354					      ktime_t timestamp)
   355	{
   356		const struct dma_fence_ops *ops;
   357		struct dma_fence_cb *cur, *tmp;
   358		struct list_head cb_list;
   359	
   360		dma_fence_assert_held(fence);
   361	
   362		if (unlikely(dma_fence_test_signaled_flag(fence)))
   363			return;
   364	
   365		trace_dma_fence_signaled(fence);
   366	
   367		/*
   368		 * When neither a release nor a wait operation is specified set the ops
   369		 * pointer to NULL to allow the fence structure to become independent
   370		 * from who originally issued it.
   371		 */
   372		ops = rcu_dereference_protected(fence->ops, true);
   373		if (!ops->release && !ops->wait)
   374			RCU_INIT_POINTER(fence->ops, NULL);
   375	
   376		/* Stash the cb_list before replacing it with the timestamp */
   377		list_replace(&fence->cb_list, &cb_list);
   378	
   379		fence->timestamp = timestamp;
   380		set_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT, &fence->flags);
   381	
   382		list_for_each_entry_safe(cur, tmp, &cb_list, node) {
   383			INIT_LIST_HEAD(&cur->node);
   384			cur->func(fence, cur);
   385		}
   386	
   387		/*
   388		 * This orders the signaled-state with the test_bit_acquire() in
   389		 * dma_fence_test_signaled_flag(). This ensures that functions like
   390		 * dma_fence_is_signaled() can only ever return true once signaling is
   391		 * completed (i.e., after the callbacks above ran).
   392		 */
 > 393		set_bit_release(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags);
   394	}
   395	EXPORT_SYMBOL(dma_fence_signal_timestamp_locked);
   396	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
