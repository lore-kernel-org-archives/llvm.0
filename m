Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AB71B85D3;
	Sun, 12 Jan 2025 15:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736695951; cv=none; b=lR5EBSz9ExfAH3AN3g9p7dBDcqyLABpItBkf2hZCh6ZINnbp7p6YWtqfdf7cDW7rWhrjkv8B6+fK1/Ri61wc9vbMYrqaDttHCpuN5Ek9feN+kiUl8qFIxcrL+wEKMVGi/a2RfRCC/5NrprgwgDBsnQA2mGsE6tin87xGu4xInFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736695951; c=relaxed/simple;
	bh=hg4DXiTJpBUVredNxwLSzv1MQW1zIm866XZZeOfJ0wc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jorin/Bo9kToqOSiSLs164onxgCgt74TYBWR61iKNJZKtmSQPdi1BT0rzFipfBeo+xBii/p9y/Ay2WADY8Uk56/Pxu9nXq7LlqpRSx2WerE3//NkRDrNDtBVQyqlNxAE6QShDqU0LfQgIzHrAxPhIUnyUAM6vYT1sViyWCWlrzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OtgJFQo0; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OtgJFQo0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736695949; x=1768231949;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hg4DXiTJpBUVredNxwLSzv1MQW1zIm866XZZeOfJ0wc=;
  b=OtgJFQo0h95IJnwpEpPuw+nZtduckVb0L0p+ZVyxwLJvti5TAVWETRQp
   Xa4r4b/owzye8RfC+cVL17++4I2YDdmpHtiIW1qpox8Zuj9+nsfNmG3Cu
   oRY9Ihh0E0JlQw6ZXe02ivfZ/RA3Hh7K+s+5VCvr+lpoiOXbCJgQBXC/P
   AUdjBBTaLEfOTZFw+eIwVyqyVqisvygYwag8m9Lgx+fbvccY7CCOsmYlL
   gnTMt9AN+NXsfIwaMNVdF6ijFGnh80MYRAXi71tbghPnmKzKZXKZnq/vk
   JgY+nBuNhF8EyzwA1OyXBXYGFOF7HUMEXGRHKeTfiR1NbCyC20q1DrFF/
   w==;
X-CSE-ConnectionGUID: rsyCiPs0Rea4Y7/jwUC+yg==
X-CSE-MsgGUID: WuINb1xkRWWi4CDVvHDiJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11313"; a="39742762"
X-IronPort-AV: E=Sophos;i="6.12,309,1728975600"; 
   d="scan'208";a="39742762"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2025 07:32:26 -0800
X-CSE-ConnectionGUID: mH3ZYRx+R6KsiloUHpEhJQ==
X-CSE-MsgGUID: +FMNmEsGQ56kNIePNsHJNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,309,1728975600"; 
   d="scan'208";a="104256726"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 Jan 2025 07:32:24 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWzws-000M6J-23;
	Sun, 12 Jan 2025 15:32:22 +0000
Date: Sun, 12 Jan 2025 23:31:42 +0800
From: kernel test robot <lkp@intel.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [linyunsheng:page_frag_cache_part2_v3_250105 6/8]
 net/core/sock.c:3061:13: error: call to undeclared function
 'page_frag_refill_prepare'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202501122323.Kry5FqX4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gestionlin/linux.git page_frag_cache_part2_v3_250105
head:   c94404d3ba31c8322393ffbabf85a5c98e965b4f
commit: a31c4d10239e1fde1560478359630ca9bdeb4a95 [6/8] net: replace page_frag with page_frag_cache
config: x86_64-randconfig-122-20250111 (https://download.01.org/0day-ci/archive/20250112/202501122323.Kry5FqX4-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250112/202501122323.Kry5FqX4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501122323.Kry5FqX4-lkp@intel.com/

Note: the linyunsheng/page_frag_cache_part2_v3_250105 HEAD c94404d3ba31c8322393ffbabf85a5c98e965b4f builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> net/core/sock.c:3061:13: error: call to undeclared function 'page_frag_refill_prepare'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3061 |         if (likely(page_frag_refill_prepare(nc, 32U, pfrag, sk->sk_allocation)))
         |                    ^
   net/core/sock.c:3061:13: note: did you mean 'sk_page_frag_refill_prepare'?
   net/core/sock.c:3058:6: note: 'sk_page_frag_refill_prepare' declared here
    3058 | bool sk_page_frag_refill_prepare(struct sock *sk, struct page_frag_cache *nc,
         |      ^
    3059 |                                  struct page_frag *pfrag)
    3060 | {
    3061 |         if (likely(page_frag_refill_prepare(nc, 32U, pfrag, sk->sk_allocation)))
         |                    ~~~~~~~~~~~~~~~~~~~~~~~~
         |                    sk_page_frag_refill_prepare
>> net/core/sock.c:3076:7: error: call to undeclared function 'page_frag_alloc_refill_prepare'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3076 |         va = page_frag_alloc_refill_prepare(nc, 32U, pfrag, sk->sk_allocation);
         |              ^
   net/core/sock.c:3076:7: note: did you mean 'sk_page_frag_alloc_refill_prepare'?
   net/core/sock.c:3070:7: note: 'sk_page_frag_alloc_refill_prepare' declared here
    3070 | void *sk_page_frag_alloc_refill_prepare(struct sock *sk,
         |       ^
    3071 |                                         struct page_frag_cache *nc,
    3072 |                                         struct page_frag *pfrag)
    3073 | {
    3074 |         void *va;
    3075 | 
    3076 |         va = page_frag_alloc_refill_prepare(nc, 32U, pfrag, sk->sk_allocation);
         |              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |              sk_page_frag_alloc_refill_prepare
>> net/core/sock.c:3076:5: error: incompatible integer to pointer conversion assigning to 'void *' from 'int' [-Wint-conversion]
    3076 |         va = page_frag_alloc_refill_prepare(nc, 32U, pfrag, sk->sk_allocation);
         |            ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   3 errors generated.
--
>> net/core/skbuff.c:3093:3: error: call to undeclared function 'page_frag_refill_commit_noref'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3093 |                 page_frag_refill_commit_noref(nc, pfrag, *len);
         |                 ^
>> net/core/skbuff.c:3097:2: error: call to undeclared function 'page_frag_refill_commit'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3097 |         page_frag_refill_commit(nc, pfrag, *len);
         |         ^
   2 errors generated.
--
>> net/core/skmsg.c:62:4: error: call to undeclared function 'page_frag_refill_commit_noref'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      62 |                         page_frag_refill_commit_noref(nc, pfrag, use);
         |                         ^
>> net/core/skmsg.c:72:4: error: call to undeclared function 'page_frag_refill_commit'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      72 |                         page_frag_refill_commit(nc, pfrag, use);
         |                         ^
   2 errors generated.
--
>> net/ipv4/ip_output.c:1254:5: error: call to undeclared function 'page_frag_refill_commit'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1254 |                                 page_frag_refill_commit(nc, pfrag, copy);
         |                                 ^
>> net/ipv4/ip_output.c:1258:5: error: call to undeclared function 'page_frag_refill_commit_noref'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1258 |                                 page_frag_refill_commit_noref(nc, pfrag, copy);
         |                                 ^
   2 errors generated.
--
>> net/ipv4/tcp.c:1234:5: error: call to undeclared function 'page_frag_refill_commit_noref'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1234 |                                 page_frag_refill_commit_noref(nc, pfrag, copy);
         |                                 ^
>> net/ipv4/tcp.c:1238:5: error: call to undeclared function 'page_frag_refill_commit'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1238 |                                 page_frag_refill_commit(nc, pfrag, copy);
         |                                 ^
   2 errors generated.
--
>> net/ipv4/tcp_output.c:3998:8: error: call to undeclared function 'page_frag_alloc_refill_prepare'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3998 |                 va = page_frag_alloc_refill_prepare(nc,
         |                      ^
   net/ipv4/tcp_output.c:3998:8: note: did you mean 'sk_page_frag_alloc_refill_prepare'?
   include/net/sock.h:2529:7: note: 'sk_page_frag_alloc_refill_prepare' declared here
    2529 | void *sk_page_frag_alloc_refill_prepare(struct sock *sk,
         |       ^
>> net/ipv4/tcp_output.c:3998:6: error: incompatible integer to pointer conversion assigning to 'void *' from 'int' [-Wint-conversion]
    3998 |                 va = page_frag_alloc_refill_prepare(nc,
         |                    ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    3999 |                                                     min_t(size_t, space, PAGE_SIZE),
         |                                                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    4000 |                                                     pfrag, sk->sk_allocation);
         |                                                     ~~~~~~~~~~~~~~~~~~~~~~~~~
>> net/ipv4/tcp_output.c:4022:3: error: call to undeclared function 'page_frag_refill_commit'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    4022 |                 page_frag_refill_commit(nc, pfrag, space);
         |                 ^
   3 errors generated.
--
>> net/ipv6/ip6_output.c:1790:5: error: call to undeclared function 'page_frag_refill_commit'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1790 |                                 page_frag_refill_commit(nc, pfrag, copy);
         |                                 ^
>> net/ipv6/ip6_output.c:1794:5: error: call to undeclared function 'page_frag_refill_commit_noref'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1794 |                                 page_frag_refill_commit_noref(nc, pfrag, copy);
         |                                 ^
   2 errors generated.


vim +/page_frag_refill_prepare +3061 net/core/sock.c

  3057	
  3058	bool sk_page_frag_refill_prepare(struct sock *sk, struct page_frag_cache *nc,
  3059					 struct page_frag *pfrag)
  3060	{
> 3061		if (likely(page_frag_refill_prepare(nc, 32U, pfrag, sk->sk_allocation)))
  3062			return true;
  3063	
  3064		sk_enter_memory_pressure(sk);
  3065		sk_stream_moderate_sndbuf(sk);
  3066		return false;
  3067	}
  3068	EXPORT_SYMBOL(sk_page_frag_refill_prepare);
  3069	
  3070	void *sk_page_frag_alloc_refill_prepare(struct sock *sk,
  3071						struct page_frag_cache *nc,
  3072						struct page_frag *pfrag)
  3073	{
  3074		void *va;
  3075	
> 3076		va = page_frag_alloc_refill_prepare(nc, 32U, pfrag, sk->sk_allocation);
  3077		if (likely(va))
  3078			return va;
  3079	
  3080		sk_enter_memory_pressure(sk);
  3081		sk_stream_moderate_sndbuf(sk);
  3082		return NULL;
  3083	}
  3084	EXPORT_SYMBOL(sk_page_frag_alloc_refill_prepare);
  3085	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
