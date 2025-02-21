Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25321F1535;
	Fri, 21 Feb 2025 16:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740156134; cv=none; b=Mf+jzMfrzM/fnoyuv1QcAGIRMX4Rwa7OlTZOI6htfj6tDIm7dgTBUU27PjQxfPdsXyKhq/uUubns4wx3/zLdGGtFh2gIc6c0Jws65CFp9qVUYvM78dSFbilkqGcm+hKPf4cup88u5mJJ56T6Jotal2+jWlzKf9VJxrGVIpA4mYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740156134; c=relaxed/simple;
	bh=MT8Oz8LKggTnAerQVbmxJLltFBmUPL1hicO8W1R2OjM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=helFy0pyRj8E2bnLvgKyvAaAZU7f2NBcZqi42g22RL2WPSLWGiNKxI7x/fTfVg31C22TzP4BftJ57/dM2KKSZDp1THSOil2aP3LwNKndgXOmBAaUosHS2iLq/5w2u0FbMtTun0ng3VzA974vW5nwts5MjKh/oskCqqV4pLvqwK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cctGYG6R; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cctGYG6R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740156131; x=1771692131;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MT8Oz8LKggTnAerQVbmxJLltFBmUPL1hicO8W1R2OjM=;
  b=cctGYG6RoD9O5xg0yq+oSXLIuCbzvHKU+jevM7ZNdRh3gQGy+SQHwgwr
   IFTGFymtDlL81v28FAQWF8u296D1w/z7o4OknOfyGiEU5gLW7brDYQEGS
   0wAPJGWIDuWsQpkTzoeZFce3htwc0XEqAD+Y4JUUhePznp6aBzHJZ07pK
   4wy9yITX3bLOzfn3yZTX/22jRfcOppQTG61sCOFi++G0X9Yaqy+rWr5Uq
   q97yMlo8nupFE/AZfd8Chp/R3G0N48CkJlw1+F844sWeD8OIjrSb+/Ay2
   aCsFrxUJ4zruXiWz0ob6ZwL52bPMb2x2yfnohizC1mgkwLSwav475T7wq
   Q==;
X-CSE-ConnectionGUID: 0A4FakvgTHaFTFViGH4Sdg==
X-CSE-MsgGUID: 6NcRV5D7Ss+Oigy/n+xTDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="40208841"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; 
   d="scan'208";a="40208841"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 08:42:11 -0800
X-CSE-ConnectionGUID: kqts383RQr6Idnx08B4WKQ==
X-CSE-MsgGUID: 6B6m3+HXQ6i/3csx2NkCkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; 
   d="scan'208";a="115943465"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 21 Feb 2025 08:42:09 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlW6J-0005kS-1q;
	Fri, 21 Feb 2025 16:42:07 +0000
Date: Sat, 22 Feb 2025 00:38:46 +0800
From: kernel test robot <lkp@intel.com>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Vlastimil Babka <vbabka@suse.cz>
Subject: [vbabka:slub-percpu-sheaves-v2-maple-hack 17/23]
 lib/maple_tree.c:5379:11: error: no member named 'allocated' in 'struct
 ma_state'
Message-ID: <202502220054.mdh5WJUF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git slub-percpu-sheaves-v2-maple-hack
head:   f149e44ecb02faef3e47597eb05bad0c2f8ff81c
commit: 23c4ef3e74093f9ebaaa9cc96cc3e8713fe2503e [17/23] maple_tree: Add single node allocation support to maple state
config: i386-randconfig-012-20250218 (https://download.01.org/0day-ci/archive/20250222/202502220054.mdh5WJUF-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250222/202502220054.mdh5WJUF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502220054.mdh5WJUF-lkp@intel.com/

Note: the vbabka/slub-percpu-sheaves-v2-maple-hack HEAD f149e44ecb02faef3e47597eb05bad0c2f8ff81c builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> lib/maple_tree.c:5379:11: error: no member named 'allocated' in 'struct ma_state'
    5379 |         if (mas->allocated) {
         |             ~~~  ^
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                                               ^~~~
   include/linux/compiler.h:57:52: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
>> lib/maple_tree.c:5379:11: error: no member named 'allocated' in 'struct ma_state'
    5379 |         if (mas->allocated) {
         |             ~~~  ^
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                                               ^~~~
   include/linux/compiler.h:57:61: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^~~~
>> lib/maple_tree.c:5379:11: error: no member named 'allocated' in 'struct ma_state'
    5379 |         if (mas->allocated) {
         |             ~~~  ^
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                                               ^~~~
   include/linux/compiler.h:57:86: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                                                      ^~~~
   include/linux/compiler.h:68:3: note: expanded from macro '__trace_if_value'
      68 |         (cond) ?                                        \
         |          ^~~~
   lib/maple_tree.c:5380:47: error: no member named 'allocated' in 'struct ma_state'
    5380 |                 kmem_cache_free_bulk(maple_node_cache, mas->allocated,
         |                                                        ~~~  ^
   lib/maple_tree.c:5382:8: error: no member named 'allocated' in 'struct ma_state'
    5382 |                 mas->allocated = 0;
         |                 ~~~  ^
   5 errors generated.


vim +5379 lib/maple_tree.c

  5344	
  5345	/*
  5346	 * mas_destroy() - destroy a maple state.
  5347	 * @mas: The maple state
  5348	 *
  5349	 * Upon completion, check the left-most node and rebalance against the node to
  5350	 * the right if necessary.  Frees any allocated nodes associated with this maple
  5351	 * state.
  5352	 */
  5353	void mas_destroy(struct ma_state *mas)
  5354	{
  5355		/*
  5356		 * When using mas_for_each() to insert an expected number of elements,
  5357		 * it is possible that the number inserted is less than the expected
  5358		 * number.  To fix an invalid final node, a check is performed here to
  5359		 * rebalance the previous node with the final node.
  5360		 */
  5361		if (mas->mas_flags & MA_STATE_REBALANCE) {
  5362			unsigned char end;
  5363			if (mas_is_err(mas))
  5364				mas_reset(mas);
  5365			mas_start(mas);
  5366			mtree_range_walk(mas);
  5367			end = mas->end + 1;
  5368			if (end < mt_min_slot_count(mas->node) - 1)
  5369				mas_destroy_rebalance(mas, end);
  5370	
  5371			mas->mas_flags &= ~MA_STATE_REBALANCE;
  5372		}
  5373		mas->mas_flags &= ~(MA_STATE_BULK|MA_STATE_PREALLOC);
  5374	
  5375		mas->node_request = 0;
  5376		if (mas->sheaf)
  5377			kmem_cache_return_sheaf(maple_node_cache, GFP_KERNEL,
  5378						mas->sheaf);
> 5379		if (mas->allocated) {
  5380			kmem_cache_free_bulk(maple_node_cache, mas->allocated,
  5381					     (void **)mas->alloc);
  5382			mas->allocated = 0;
  5383		}
  5384		mas->sheaf = NULL;
  5385	}
  5386	EXPORT_SYMBOL_GPL(mas_destroy);
  5387	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
