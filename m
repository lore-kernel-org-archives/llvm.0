Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B4C2309B0;
	Thu, 14 Aug 2025 18:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755196751; cv=none; b=YgIfjOMazEIfyRltcSpDEZbvBUvzUGCYtupCsOgkggk4ITDiMzemj2fZqO607VEKsyc4nxR5UKufEcPq3ZEvgT478jvTGwbjW2ugaF39+uZfmQzdJtaWPtlcfaot1P5F7deDSm6o2Nd8VCnEVpSEJ55WQS/Oa+qPnzjOdBh3UqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755196751; c=relaxed/simple;
	bh=RekP2xtbihvn9PYkQBDOIGYtPwlkahunev1yh6OlXA0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rr646MDe+FhrvfMP4CvCAEXwnHHN1gWxwP79GA02ufVzSOHzIlOlkKniySRZh9GjRnqu9e+jyMxMcRQRUEhECsJnnpIUFN6C4q6OlmZzBnoJBeVAQ3KlsfRLtFU+eSn1hi6E+3FHoBLtjn00oQc34zWSkybJIBxhJA602DOAAtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DF25SygC; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DF25SygC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755196750; x=1786732750;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RekP2xtbihvn9PYkQBDOIGYtPwlkahunev1yh6OlXA0=;
  b=DF25SygC5hbhxtGHxbNH6YvxmwySVahgijdQ40k3YjLVNjTT0AeIXZ0T
   Up+pxGiweACrAPm2R8yj9pAWf7W/mRDc56BeflRWXnVtGppGcaw4w0cMi
   WK9J1dprVgZAMyTCqiWhiiX8scUwivhQ0uh9T/UF+doaHaJ+WGHB/w7IU
   2Ah4VoEcrgO6L1a+gbg7qVxD4jjkLzBKcXaLpW6atUPkqZfWapNU5chT4
   OCCUSs3hMzwZy+T2iHXLvyi6uzDD6/p3aEUNrscUgq8Q80nUVGHsrjC2k
   QIwRjaeqhhhTG12FVwWYR3R1HzgisNfmnfHtmMZYtllS1Cy7xzizE6Prf
   w==;
X-CSE-ConnectionGUID: ozyD64/HQzK4nqRSYSbcBQ==
X-CSE-MsgGUID: OoVhckuOSQysRVH/3ROwRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="57598175"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="57598175"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 11:39:08 -0700
X-CSE-ConnectionGUID: QwnicAjfQgqMBmz9hA+g6Q==
X-CSE-MsgGUID: l6TlSs5SQ0+o5eCUwLh6oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="167092148"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 14 Aug 2025 11:39:06 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umcqt-000BFE-2M;
	Thu, 14 Aug 2025 18:39:03 +0000
Date: Fri, 15 Aug 2025 02:39:01 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Markuze <amarkuze@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	ceph-devel@vger.kernel.org
Subject: [ceph-client:tls-tracing-only 7/10] lib/blog/blog_core.c:94:
 warning: Function parameter or struct member 'ctx' not described in
 'blog_set_napi_ctx'
Message-ID: <202508150210.LbtTLrLl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ceph/ceph-client.git tls-tracing-only
head:   6b738aa5f6bb2343f8277d318ff1e9ea9289212c
commit: 4dbfb9232bb3bff162418ee08fe5379af0bcab48 [7/10] phase I
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250815/202508150210.LbtTLrLl-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250815/202508150210.LbtTLrLl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508150210.LbtTLrLl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   lib/blog/blog_core.c:44: warning: Function parameter or struct member 'file' not described in 'blog_get_source_id'
   lib/blog/blog_core.c:44: warning: Function parameter or struct member 'func' not described in 'blog_get_source_id'
   lib/blog/blog_core.c:44: warning: Function parameter or struct member 'line' not described in 'blog_get_source_id'
   lib/blog/blog_core.c:44: warning: Function parameter or struct member 'fmt' not described in 'blog_get_source_id'
   lib/blog/blog_core.c:54: warning: Function parameter or struct member 'id' not described in 'blog_get_source_info'
   lib/blog/blog_core.c:64: warning: Function parameter or struct member 'source_id' not described in 'blog_log'
   lib/blog/blog_core.c:64: warning: Function parameter or struct member 'client_id' not described in 'blog_log'
   lib/blog/blog_core.c:64: warning: Function parameter or struct member 'needed_size' not described in 'blog_log'
>> lib/blog/blog_core.c:94: warning: Function parameter or struct member 'ctx' not described in 'blog_set_napi_ctx'
>> lib/blog/blog_core.c:113: warning: Function parameter or struct member 'n' not described in 'blog_log_trim'
>> lib/blog/blog_core.c:123: warning: Function parameter or struct member 'iter' not described in 'blog_log_iter_init'
>> lib/blog/blog_core.c:123: warning: Function parameter or struct member 'pf' not described in 'blog_log_iter_init'
>> lib/blog/blog_core.c:132: warning: Function parameter or struct member 'iter' not described in 'blog_log_iter_next'
>> lib/blog/blog_core.c:143: warning: Function parameter or struct member 'entry' not described in 'blog_des_entry'
>> lib/blog/blog_core.c:143: warning: Function parameter or struct member 'output' not described in 'blog_des_entry'
>> lib/blog/blog_core.c:143: warning: Function parameter or struct member 'out_size' not described in 'blog_des_entry'
>> lib/blog/blog_core.c:143: warning: Function parameter or struct member 'client_cb' not described in 'blog_des_entry'
   lib/blog/blog_core.c:153: warning: Function parameter or struct member 'addr' not described in 'blog_is_valid_kernel_addr'


vim +94 lib/blog/blog_core.c

    89	
    90	/**
    91	 * blog_set_napi_ctx - Set NAPI context for current CPU
    92	 */
    93	void blog_set_napi_ctx(struct blog_tls_ctx *ctx)
  > 94	{
    95		/* Stub implementation */
    96	}
    97	EXPORT_SYMBOL(blog_set_napi_ctx);
    98	
    99	/**
   100	 * blog_get_ctx - Get appropriate context based on context type
   101	 */
   102	struct blog_tls_ctx *blog_get_ctx(void)
   103	{
   104		/* Stub implementation */
   105		return NULL;
   106	}
   107	EXPORT_SYMBOL(blog_get_ctx);
   108	
   109	/**
   110	 * blog_log_trim - Trim the current context's pagefrag by n bytes
   111	 */
   112	int blog_log_trim(unsigned int n)
 > 113	{
   114		/* Stub implementation */
   115		return 0;
   116	}
   117	EXPORT_SYMBOL(blog_log_trim);
   118	
   119	/**
   120	 * blog_log_iter_init - Initialize the iterator for a specific pagefrag
   121	 */
   122	void blog_log_iter_init(struct blog_log_iter *iter, struct blog_pagefrag *pf)
 > 123	{
   124		/* Stub implementation */
   125	}
   126	EXPORT_SYMBOL(blog_log_iter_init);
   127	
   128	/**
   129	 * blog_log_iter_next - Get next log entry
   130	 */
   131	struct blog_log_entry *blog_log_iter_next(struct blog_log_iter *iter)
 > 132	{
   133		/* Stub implementation */
   134		return NULL;
   135	}
   136	EXPORT_SYMBOL(blog_log_iter_next);
   137	
   138	/**
   139	 * blog_des_entry - Deserialize entry with callback
   140	 */
   141	int blog_des_entry(struct blog_log_entry *entry, char *output, size_t out_size,
   142	                   blog_client_des_fn client_cb)
 > 143	{
   144		/* Stub implementation */
   145		return 0;
   146	}
   147	EXPORT_SYMBOL(blog_des_entry);
   148	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
