Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CF43716D;
	Sat, 19 Oct 2024 03:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729307606; cv=none; b=VccyyineeQqgnsRafu6SqOdtGm8ZClNuZub12axXOsRB4jR9d5sknANozuczJV9kR4meynJWgfBmBkkt1gTsbOXA9G8G4Czc/uuKUkfWJTYhPbqs2Z+B9vBdySfWfVeQV6buKBrwTeI2vY9MQ/XfBQRPorqxJiWGLxkC86BmG6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729307606; c=relaxed/simple;
	bh=dR9eqwoS2/MjwMyc2R6rl4VZK398RMY6+HoZhNmDKxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ozrlf6UTTAnVRB23r090O4mNmy2+T5oYMSpQLXFQCxOquQ5D8oBKtKa+hkT+tz/aw+AwiB2MREDzjGdDfgaGVmvNJw/IL3qoN3Fw7AfJ4AVy7f72izZ4ztz7t3IMveMyTvjQVQ7urkLYif1gdVHZ7gIooYm0V3fILZLcnC0u7Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XxghqhZp; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XxghqhZp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729307605; x=1760843605;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dR9eqwoS2/MjwMyc2R6rl4VZK398RMY6+HoZhNmDKxc=;
  b=XxghqhZpAOcWlJkbxi7p/wdz0hSWLMXOgk8HhKF0tai+c34Jp5uSWgSW
   sqgGnZj/AR2ek1JhBgpsd4wCAa8WAnG2PBEWFRY8jdLhpSvtjNrY0yIwL
   U3uglojBz6kyQ7tn70A58F5Z1V3YeDcfFWT10Q+CPL3MWVRYDW9oQoDAy
   s7O1ZjvD5QeOfsoVQTWS3qDAq/su+4EJMwhGD31ssfk3qMxPs0bDbBlMn
   IhJoy38HHwO5I6tmG45CWBSuhMxWWD2+D8rv9b1tuIXhYNxeK9yXGiZp1
   /vRDz7+h5NE0P1YljujUtj+8y8bz5URfXzQhyNe9Bdi6KymTDBScwRruo
   A==;
X-CSE-ConnectionGUID: YBI86Y+yRpqxEzHE99/zvw==
X-CSE-MsgGUID: sqWB1C3qT5CV2w2UIyALEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29012318"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29012318"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 20:13:22 -0700
X-CSE-ConnectionGUID: xNRwf6QbQeqggMWiFUEKuA==
X-CSE-MsgGUID: NvWgH/fiS9GXVkJwkWEtRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,215,1725346800"; 
   d="scan'208";a="116490937"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 18 Oct 2024 20:13:20 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1zu1-000Odc-1g;
	Sat, 19 Oct 2024 03:13:17 +0000
Date: Sat, 19 Oct 2024 11:12:21 +0800
From: kernel test robot <lkp@intel.com>
To: Kanchana P Sridhar <kanchana.p.sridhar@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v1 11/13] mm: swap: Add IAA batch compression API
 swap_crypto_acomp_compress_batch().
Message-ID: <202410191141.BwtDVXQ6-lkp@intel.com>
References: <20241018064101.336232-12-kanchana.p.sridhar@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018064101.336232-12-kanchana.p.sridhar@intel.com>

Hi Kanchana,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 817952b8be34aad40e07f6832fb9d1fc08961550]

url:    https://github.com/intel-lab-lkp/linux/commits/Kanchana-P-Sridhar/crypto-acomp-Add-a-poll-operation-to-acomp_alg-and-acomp_req/20241018-144331
base:   817952b8be34aad40e07f6832fb9d1fc08961550
patch link:    https://lore.kernel.org/r/20241018064101.336232-12-kanchana.p.sridhar%40intel.com
patch subject: [RFC PATCH v1 11/13] mm: swap: Add IAA batch compression API swap_crypto_acomp_compress_batch().
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241019/202410191141.BwtDVXQ6-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241019/202410191141.BwtDVXQ6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410191141.BwtDVXQ6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/swap_state.c:750: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * This API provides IAA compress batching functionality for use by swap


vim +750 mm/swap_state.c

   748	
   749	/**
 > 750	 * This API provides IAA compress batching functionality for use by swap
   751	 * modules.
   752	 * The acomp_ctx mutex should be locked/unlocked before/after calling this
   753	 * procedure.
   754	 *
   755	 * @pages: Pages to be compressed.
   756	 * @dsts: Pre-allocated destination buffers to store results of IAA compression.
   757	 * @dlens: Will contain the compressed lengths.
   758	 * @errors: Will contain a 0 if the page was successfully compressed, or a
   759	 *          non-0 error value to be processed by the calling function.
   760	 * @nr_pages: The number of pages, up to SWAP_CRYPTO_SUB_BATCH_SIZE,
   761	 *            to be compressed.
   762	 * @acomp_ctx: The acomp context for iaa_crypto/other compressor.
   763	 */
   764	void swap_crypto_acomp_compress_batch(
   765		struct page *pages[],
   766		u8 *dsts[],
   767		unsigned int dlens[],
   768		int errors[],
   769		int nr_pages,
   770		struct crypto_acomp_ctx *acomp_ctx)
   771	{
   772		struct scatterlist inputs[SWAP_CRYPTO_SUB_BATCH_SIZE];
   773		struct scatterlist outputs[SWAP_CRYPTO_SUB_BATCH_SIZE];
   774		bool compressions_done = false;
   775		int i, j;
   776	
   777		BUG_ON(nr_pages > SWAP_CRYPTO_SUB_BATCH_SIZE);
   778	
   779		/*
   780		 * Prepare and submit acomp_reqs to IAA.
   781		 * IAA will process these compress jobs in parallel in async mode.
   782		 * If the compressor does not support a poll() method, or if IAA is
   783		 * used in sync mode, the jobs will be processed sequentially using
   784		 * acomp_ctx->req[0] and acomp_ctx->wait.
   785		 */
   786		for (i = 0; i < nr_pages; ++i) {
   787			j = acomp_ctx->acomp->poll ? i : 0;
   788			sg_init_table(&inputs[i], 1);
   789			sg_set_page(&inputs[i], pages[i], PAGE_SIZE, 0);
   790	
   791			/*
   792			 * Each acomp_ctx->buffer[] is of size (PAGE_SIZE * 2).
   793			 * Reflect same in sg_list.
   794			 */
   795			sg_init_one(&outputs[i], dsts[i], PAGE_SIZE * 2);
   796			acomp_request_set_params(acomp_ctx->req[j], &inputs[i],
   797						 &outputs[i], PAGE_SIZE, dlens[i]);
   798	
   799			/*
   800			 * If the crypto_acomp provides an asynchronous poll()
   801			 * interface, submit the request to the driver now, and poll for
   802			 * a completion status later, after all descriptors have been
   803			 * submitted. If the crypto_acomp does not provide a poll()
   804			 * interface, submit the request and wait for it to complete,
   805			 * i.e., synchronously, before moving on to the next request.
   806			 */
   807			if (acomp_ctx->acomp->poll) {
   808				errors[i] = crypto_acomp_compress(acomp_ctx->req[j]);
   809	
   810				if (errors[i] != -EINPROGRESS)
   811					errors[i] = -EINVAL;
   812				else
   813					errors[i] = -EAGAIN;
   814			} else {
   815				errors[i] = crypto_wait_req(
   816						      crypto_acomp_compress(acomp_ctx->req[j]),
   817						      &acomp_ctx->wait);
   818				if (!errors[i])
   819					dlens[i] = acomp_ctx->req[j]->dlen;
   820			}
   821		}
   822	
   823		/*
   824		 * If not doing async compressions, the batch has been processed at
   825		 * this point and we can return.
   826		 */
   827		if (!acomp_ctx->acomp->poll)
   828			return;
   829	
   830		/*
   831		 * Poll for and process IAA compress job completions
   832		 * in out-of-order manner.
   833		 */
   834		while (!compressions_done) {
   835			compressions_done = true;
   836	
   837			for (i = 0; i < nr_pages; ++i) {
   838				/*
   839				 * Skip, if the compression has already completed
   840				 * successfully or with an error.
   841				 */
   842				if (errors[i] != -EAGAIN)
   843					continue;
   844	
   845				errors[i] = crypto_acomp_poll(acomp_ctx->req[i]);
   846	
   847				if (errors[i]) {
   848					if (errors[i] == -EAGAIN)
   849						compressions_done = false;
   850				} else {
   851					dlens[i] = acomp_ctx->req[i]->dlen;
   852				}
   853			}
   854		}
   855	}
   856	EXPORT_SYMBOL_GPL(swap_crypto_acomp_compress_batch);
   857	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
