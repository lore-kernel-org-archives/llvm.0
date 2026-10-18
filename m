Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A764386559;
	Sun, 18 Oct 2026 11:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792323830; cv=none; b=pHLMzk4IfGGvRbeMO1uBE0CtzZnKojVna08fwvbT6EfVCnCXZNmxem9rnU71iReGSknryfKhNrjxWxHulcn9FxOitJe0jTTVZbd9GeztGtxQT99fp21+H5QIK6mLuz55+/gb7Vc1cQRdhVpnaObXAjnWdKigZr9J6ySdHGs+Tzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792323830; c=relaxed/simple;
	bh=4JYFP4kjrC+opUek+Yn4PUjXpgZiiKF6i6FcxgRZx8Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=huUBG07niDyTQgc3GW8iDJGbWVzj6KLKZAB5taxftIDk9uek0pFq7He2koct3E7BgMq6Z2+LZXUA+chc46VgIeJXBkfzcTMyQbm0KAQQCASXk63Uh3f/VDb17iyX+fm91/wyjJWdEzhIdr/xLFPiRGb944JUyDfge7u55hi/hEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ShDh9nj3; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ShDh9nj3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792323828; x=1823859828;
  h=date:from:to:cc:subject:message-id;
  bh=4JYFP4kjrC+opUek+Yn4PUjXpgZiiKF6i6FcxgRZx8Q=;
  b=ShDh9nj3jH6EfbifMbdnzdEtW56nR4SXS+Ii1x508xTyLHzRWB9kZCxA
   LXpjCu0gV918MZs1LBrKdRnWU3Ky+64tj73QCVKeUVwOAlt8ZJF3+1kIg
   7xUKABt+kTcmaMRYVmdPEIhxqe6ejQ1sngu3b7YgOu2J8dt/KHNSmcmRk
   sMBr0XD36W74y5g16Sj13bW4baI8muyDxNtboyot+O7yIBavZY9XDW8wf
   ptF+16AXhE/NY6Rdq1j2ms6BfYmyUgcpMOG0EE+hJqMZp4vegGjTmmPMn
   of0YIQfjcOmzLL6sYYLAXjd+NPRZJcPPG3jyDJCXCvkf86o9LPu4ObjTu
   A==;
X-CSE-ConnectionGUID: IK/W6QnzRVWzpjIVcBVE/w==
X-CSE-MsgGUID: Lp9Bq6BpSAeqouTzxVev8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11938"; a="1041619"
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="1041619"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 04:43:48 -0700
X-CSE-ConnectionGUID: 1tCY3mHiTsKk8/7CSJvjAA==
X-CSE-MsgGUID: oG+OsUjFQbKYqjbaxuCnNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="2308013"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 18 Oct 2026 04:43:45 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIPIk-0000000054t-17F6;
	Sun, 18 Oct 2026 11:43:42 +0000
Date: Sun, 18 Oct 2026 13:43:15 +0200
From: kernel test robot <lkp@intel.com>
To: Marco Elver <elver@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>
Subject: crypto/scompress.c:92:11: warning: writing variable 'src'
 requires holding spinlock 'scratch.lock' exclusively
Message-ID: <202610181335.o2l6GmyB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   32c52ec87d6245ee2d12ed5dd509e40062939b50
commit: dc36d55d4e7259ff0f91a154744125ccc2228171 crypto: Enable context analysis
date:   10 months ago
config: s390-randconfig-2000-20261018 (https://download.01.org/0day-ci/archive/20261018/202610181335.o2l6GmyB-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 8a679464f19c426ef76aad9f4587b703dd3e584d)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261018/202610181335.o2l6GmyB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: dc36d55d4e72 ("crypto: Enable context analysis")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610181335.o2l6GmyB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> crypto/scompress.c:92:11: warning: writing variable 'src' requires holding spinlock 'scratch.lock' exclusively [-Wthread-safety-precise]
      92 |         scratch->src = page_address(page);
         |                  ^
   crypto/scompress.c:92:11: note: found near match 'scratch->lock'
>> crypto/scompress.c:240:28: warning: reading variable 'src' requires holding spinlock '_scomp_lock_scratch().lock' [-Wthread-safety-precise]
     240 |                 const u8 *src = scratch->src;
         |                                          ^
   crypto/scompress.c:240:28: note: found near match '_scomp_lock_scratch().lock'
   crypto/scompress.c:242:31: warning: reading variable 'src' requires holding spinlock '_scomp_lock_scratch().lock' [-Wthread-safety-precise]
     242 |                 memcpy_from_sglist(scratch->src, req->src, 0, slen);
         |                                             ^
   crypto/scompress.c:242:31: note: found near match '_scomp_lock_scratch().lock'
   3 warnings generated.


vim +92 crypto/scompress.c

1ab53a77b772bf7 Giovanni Cabiddu          2016-10-21   82  
c47e1f4142a3823 Herbert Xu                2025-03-17   83  static int scomp_alloc_scratch(struct scomp_scratch *scratch, int cpu)
1ab53a77b772bf7 Giovanni Cabiddu          2016-10-21   84  {
c47e1f4142a3823 Herbert Xu                2025-03-17   85  	int node = cpu_to_node(cpu);
2d3553ecb4e316a Herbert Xu                2025-03-15   86  	struct page *page;
71052dcf4be70be Sebastian Andrzej Siewior 2019-03-29   87  
c47e1f4142a3823 Herbert Xu                2025-03-17   88  	page = alloc_pages_node(node, GFP_KERNEL, 0);
a7b1d0c5f1ca05c Herbert Xu                2025-03-19   89  	if (!page)
c47e1f4142a3823 Herbert Xu                2025-03-17   90  		return -ENOMEM;
c47e1f4142a3823 Herbert Xu                2025-03-17   91  	spin_lock_bh(&scratch->lock);
c47e1f4142a3823 Herbert Xu                2025-03-17  @92  	scratch->src = page_address(page);
c47e1f4142a3823 Herbert Xu                2025-03-17   93  	spin_unlock_bh(&scratch->lock);
71052dcf4be70be Sebastian Andrzej Siewior 2019-03-29   94  	return 0;
c47e1f4142a3823 Herbert Xu                2025-03-17   95  }
c47e1f4142a3823 Herbert Xu                2025-03-17   96  
c47e1f4142a3823 Herbert Xu                2025-03-17   97  static void scomp_scratch_workfn(struct work_struct *work)
c47e1f4142a3823 Herbert Xu                2025-03-17   98  {
c47e1f4142a3823 Herbert Xu                2025-03-17   99  	int cpu;
c47e1f4142a3823 Herbert Xu                2025-03-17  100  
c47e1f4142a3823 Herbert Xu                2025-03-17  101  	for_each_cpu(cpu, &scomp_scratch_want) {
c47e1f4142a3823 Herbert Xu                2025-03-17  102  		struct scomp_scratch *scratch;
c47e1f4142a3823 Herbert Xu                2025-03-17  103  
c47e1f4142a3823 Herbert Xu                2025-03-17  104  		scratch = per_cpu_ptr(&scomp_scratch, cpu);
dc36d55d4e7259f Marco Elver               2025-12-19  105  		if (context_unsafe(scratch->src))
c47e1f4142a3823 Herbert Xu                2025-03-17  106  			continue;
c47e1f4142a3823 Herbert Xu                2025-03-17  107  		if (scomp_alloc_scratch(scratch, cpu))
c47e1f4142a3823 Herbert Xu                2025-03-17  108  			break;
c47e1f4142a3823 Herbert Xu                2025-03-17  109  
c47e1f4142a3823 Herbert Xu                2025-03-17  110  		cpumask_clear_cpu(cpu, &scomp_scratch_want);
c47e1f4142a3823 Herbert Xu                2025-03-17  111  	}
c47e1f4142a3823 Herbert Xu                2025-03-17  112  }
c47e1f4142a3823 Herbert Xu                2025-03-17  113  
c47e1f4142a3823 Herbert Xu                2025-03-17  114  static int crypto_scomp_alloc_scratches(void)
dc36d55d4e7259f Marco Elver               2025-12-19  115  	__context_unsafe(/* allocates @scratch */)
c47e1f4142a3823 Herbert Xu                2025-03-17  116  {
c47e1f4142a3823 Herbert Xu                2025-03-17  117  	unsigned int i = cpumask_first(cpu_possible_mask);
c47e1f4142a3823 Herbert Xu                2025-03-17  118  	struct scomp_scratch *scratch;
c47e1f4142a3823 Herbert Xu                2025-03-17  119  
c47e1f4142a3823 Herbert Xu                2025-03-17  120  	scratch = per_cpu_ptr(&scomp_scratch, i);
c47e1f4142a3823 Herbert Xu                2025-03-17  121  	return scomp_alloc_scratch(scratch, i);
1ab53a77b772bf7 Giovanni Cabiddu          2016-10-21  122  }
1ab53a77b772bf7 Giovanni Cabiddu          2016-10-21  123  
6a8487a1f29fa28 Ard Biesheuvel            2017-07-21  124  static int crypto_scomp_init_tfm(struct crypto_tfm *tfm)
6a8487a1f29fa28 Ard Biesheuvel            2017-07-21  125  {
3d72ad46a23ae42 Herbert Xu                2025-03-09  126  	struct scomp_alg *alg = crypto_scomp_alg(__crypto_scomp_tfm(tfm));
71052dcf4be70be Sebastian Andrzej Siewior 2019-03-29  127  	int ret = 0;
6a8487a1f29fa28 Ard Biesheuvel            2017-07-21  128  
6a8487a1f29fa28 Ard Biesheuvel            2017-07-21  129  	mutex_lock(&scomp_lock);
42d9f6c774790d2 Herbert Xu                2025-03-19  130  	ret = crypto_acomp_alloc_streams(&alg->streams);
3d72ad46a23ae42 Herbert Xu                2025-03-09  131  	if (ret)
3d72ad46a23ae42 Herbert Xu                2025-03-09  132  		goto unlock;
a32f1923c6d6e9e Sabrina Dubroca           2025-04-24  133  	if (!scomp_scratch_users++) {
71052dcf4be70be Sebastian Andrzej Siewior 2019-03-29  134  		ret = crypto_scomp_alloc_scratches();
ddd0a42671c0d97 Herbert Xu                2025-03-15  135  		if (ret)
a32f1923c6d6e9e Sabrina Dubroca           2025-04-24  136  			scomp_scratch_users--;
ddd0a42671c0d97 Herbert Xu                2025-03-15  137  	}
3d72ad46a23ae42 Herbert Xu                2025-03-09  138  unlock:
6a8487a1f29fa28 Ard Biesheuvel            2017-07-21  139  	mutex_unlock(&scomp_lock);
6a8487a1f29fa28 Ard Biesheuvel            2017-07-21  140  
6a8487a1f29fa28 Ard Biesheuvel            2017-07-21  141  	return ret;
6a8487a1f29fa28 Ard Biesheuvel            2017-07-21  142  }
6a8487a1f29fa28 Ard Biesheuvel            2017-07-21  143  
dc36d55d4e7259f Marco Elver               2025-12-19  144  #define scomp_lock_scratch(...) __acquire_ret(_scomp_lock_scratch(__VA_ARGS__), &__ret->lock)
dc36d55d4e7259f Marco Elver               2025-12-19  145  static struct scomp_scratch *_scomp_lock_scratch(void) __acquires_ret
c47e1f4142a3823 Herbert Xu                2025-03-17  146  {
c47e1f4142a3823 Herbert Xu                2025-03-17  147  	int cpu = raw_smp_processor_id();
c47e1f4142a3823 Herbert Xu                2025-03-17  148  	struct scomp_scratch *scratch;
c47e1f4142a3823 Herbert Xu                2025-03-17  149  
c47e1f4142a3823 Herbert Xu                2025-03-17  150  	scratch = per_cpu_ptr(&scomp_scratch, cpu);
42d9f6c774790d2 Herbert Xu                2025-03-19  151  	spin_lock(&scratch->lock);
c47e1f4142a3823 Herbert Xu                2025-03-17  152  	if (likely(scratch->src))
c47e1f4142a3823 Herbert Xu                2025-03-17  153  		return scratch;
c47e1f4142a3823 Herbert Xu                2025-03-17  154  	spin_unlock(&scratch->lock);
c47e1f4142a3823 Herbert Xu                2025-03-17  155  
c47e1f4142a3823 Herbert Xu                2025-03-17  156  	cpumask_set_cpu(cpu, &scomp_scratch_want);
c47e1f4142a3823 Herbert Xu                2025-03-17  157  	schedule_work(&scomp_scratch_work);
c47e1f4142a3823 Herbert Xu                2025-03-17  158  
c47e1f4142a3823 Herbert Xu                2025-03-17  159  	scratch = per_cpu_ptr(&scomp_scratch, cpumask_first(cpu_possible_mask));
c47e1f4142a3823 Herbert Xu                2025-03-17  160  	spin_lock(&scratch->lock);
c47e1f4142a3823 Herbert Xu                2025-03-17  161  	return scratch;
c47e1f4142a3823 Herbert Xu                2025-03-17  162  }
c47e1f4142a3823 Herbert Xu                2025-03-17  163  
42d9f6c774790d2 Herbert Xu                2025-03-19  164  static inline void scomp_unlock_scratch(struct scomp_scratch *scratch)
dc36d55d4e7259f Marco Elver               2025-12-19  165  	__releases(&scratch->lock)
c47e1f4142a3823 Herbert Xu                2025-03-17  166  {
42d9f6c774790d2 Herbert Xu                2025-03-19  167  	spin_unlock(&scratch->lock);
c47e1f4142a3823 Herbert Xu                2025-03-17  168  }
c47e1f4142a3823 Herbert Xu                2025-03-17  169  
1ab53a77b772bf7 Giovanni Cabiddu          2016-10-21  170  static int scomp_acomp_comp_decomp(struct acomp_req *req, int dir)
1ab53a77b772bf7 Giovanni Cabiddu          2016-10-21  171  {
1ab53a77b772bf7 Giovanni Cabiddu          2016-10-21  172  	struct crypto_acomp *tfm = crypto_acomp_reqtfm(req);
2d3553ecb4e316a Herbert Xu                2025-03-15  173  	struct crypto_scomp **tfm_ctx = acomp_tfm_ctx(tfm);
a7b1d0c5f1ca05c Herbert Xu                2025-03-19  174  	bool src_isvirt = acomp_request_src_isvirt(req);
a7b1d0c5f1ca05c Herbert Xu                2025-03-19  175  	bool dst_isvirt = acomp_request_dst_isvirt(req);
1ab53a77b772bf7 Giovanni Cabiddu          2016-10-21  176  	struct crypto_scomp *scomp = *tfm_ctx;
2d3553ecb4e316a Herbert Xu                2025-03-15  177  	unsigned int slen = req->slen;
2d3553ecb4e316a Herbert Xu                2025-03-15  178  	unsigned int dlen = req->dlen;
2d3553ecb4e316a Herbert Xu                2025-03-15  179  	struct page *spage, *dpage;
2d3553ecb4e316a Herbert Xu                2025-03-15  180  	unsigned int n;
2c1808e5fe5afda Herbert Xu                2025-03-15  181  	const u8 *src;
8a6771cda3f48a4 Herbert Xu                2025-03-15  182  	size_t soff;
8a6771cda3f48a4 Herbert Xu                2025-03-15  183  	size_t doff;
2c1808e5fe5afda Herbert Xu                2025-03-15  184  	u8 *dst;
1ab53a77b772bf7 Giovanni Cabiddu          2016-10-21  185  	int ret;
1ab53a77b772bf7 Giovanni Cabiddu          2016-10-21  186  
2d3553ecb4e316a Herbert Xu                2025-03-15  187  	if (!req->src || !slen)
71052dcf4be70be Sebastian Andrzej Siewior 2019-03-29  188  		return -EINVAL;
1ab53a77b772bf7 Giovanni Cabiddu          2016-10-21  189  
2d3553ecb4e316a Herbert Xu                2025-03-15  190  	if (!req->dst || !dlen)
71052dcf4be70be Sebastian Andrzej Siewior 2019-03-29  191  		return -EINVAL;
1ab53a77b772bf7 Giovanni Cabiddu          2016-10-21  192  
a7b1d0c5f1ca05c Herbert Xu                2025-03-19  193  	if (dst_isvirt)
a7b1d0c5f1ca05c Herbert Xu                2025-03-19  194  		dst = req->dvirt;
a7b1d0c5f1ca05c Herbert Xu                2025-03-19  195  	else {
5f3437e9c89eec7 Herbert Xu                2025-04-07  196  		if (dlen <= req->dst->length) {
a7b1d0c5f1ca05c Herbert Xu                2025-03-19  197  			dpage = sg_page(req->dst);
a7b1d0c5f1ca05c Herbert Xu                2025-03-19  198  			doff = req->dst->offset;
a7b1d0c5f1ca05c Herbert Xu                2025-03-19  199  		} else
a7b1d0c5f1ca05c Herbert Xu                2025-03-19  200  			return -ENOSYS;
a7b1d0c5f1ca05c Herbert Xu                2025-03-19  201  
ce00897b94bc5c6 David Hildenbrand         2025-09-01  202  		dpage += doff / PAGE_SIZE;
a7b1d0c5f1ca05c Herbert Xu                2025-03-19  203  		doff = offset_in_page(doff);
a7b1d0c5f1ca05c Herbert Xu                2025-03-19  204  
e3f08b262573187 Herbert Xu                2025-04-23  205  		n = (dlen - 1) / PAGE_SIZE;
e3f08b262573187 Herbert Xu                2025-04-23  206  		n += (offset_in_page(dlen - 1) + doff) / PAGE_SIZE;
a7b1d0c5f1ca05c Herbert Xu                2025-03-19  207  		if (PageHighMem(dpage + n) &&
a7b1d0c5f1ca05c Herbert Xu                2025-03-19  208  		    size_add(doff, dlen) > PAGE_SIZE)
a7b1d0c5f1ca05c Herbert Xu                2025-03-19  209  			return -ENOSYS;
a7b1d0c5f1ca05c Herbert Xu                2025-03-19  210  		dst = kmap_local_page(dpage) + doff;
a7b1d0c5f1ca05c Herbert Xu                2025-03-19  211  	}
c47e1f4142a3823 Herbert Xu                2025-03-17  212  
a7b1d0c5f1ca05c Herbert Xu                2025-03-19  213  	if (src_isvirt)
2c1808e5fe5afda Herbert Xu                2025-03-15  214  		src = req->svirt;
2c1808e5fe5afda Herbert Xu                2025-03-15  215  	else {
a7b1d0c5f1ca05c Herbert Xu                2025-03-19  216  		src = NULL;
8a6771cda3f48a4 Herbert Xu                2025-03-15  217  		do {
5f3437e9c89eec7 Herbert Xu                2025-04-07  218  			if (slen <= req->src->length) {
8a6771cda3f48a4 Herbert Xu                2025-03-15  219  				spage = sg_page(req->src);
2d3553ecb4e316a Herbert Xu                2025-03-15  220  				soff = req->src->offset;
8a6771cda3f48a4 Herbert Xu                2025-03-15  221  			} else
8a6771cda3f48a4 Herbert Xu                2025-03-15  222  				break;
8a6771cda3f48a4 Herbert Xu                2025-03-15  223  
ce00897b94bc5c6 David Hildenbrand         2025-09-01  224  			spage = spage + soff / PAGE_SIZE;
2d3553ecb4e316a Herbert Xu                2025-03-15  225  			soff = offset_in_page(soff);
744e1885922a994 Chengming Zhou            2023-12-27  226  
002ba346e3d76bb Herbert Xu                2025-04-21  227  			n = (slen - 1) / PAGE_SIZE;
002ba346e3d76bb Herbert Xu                2025-04-21  228  			n += (offset_in_page(slen - 1) + soff) / PAGE_SIZE;
ce00897b94bc5c6 David Hildenbrand         2025-09-01  229  			if (PageHighMem(spage + n) &&
8a6771cda3f48a4 Herbert Xu                2025-03-15  230  			    size_add(soff, slen) > PAGE_SIZE)
8a6771cda3f48a4 Herbert Xu                2025-03-15  231  				break;
2d3553ecb4e316a Herbert Xu                2025-03-15  232  			src = kmap_local_page(spage) + soff;
8a6771cda3f48a4 Herbert Xu                2025-03-15  233  		} while (0);
2c1808e5fe5afda Herbert Xu                2025-03-15  234  	}
77292bb8ca69c80 Barry Song                2024-03-02  235  
dc36d55d4e7259f Marco Elver               2025-12-19  236  	struct crypto_acomp_stream *stream = crypto_acomp_lock_stream_bh(&crypto_scomp_alg(scomp)->streams);
8a6771cda3f48a4 Herbert Xu                2025-03-15  237  
a7b1d0c5f1ca05c Herbert Xu                2025-03-19  238  	if (!src_isvirt && !src) {
dc36d55d4e7259f Marco Elver               2025-12-19  239  		struct scomp_scratch *scratch = scomp_lock_scratch();
dc36d55d4e7259f Marco Elver               2025-12-19 @240  		const u8 *src = scratch->src;
2d3553ecb4e316a Herbert Xu                2025-03-15  241  
a7b1d0c5f1ca05c Herbert Xu                2025-03-19  242  		memcpy_from_sglist(scratch->src, req->src, 0, slen);
2d3553ecb4e316a Herbert Xu                2025-03-15  243  
1ab53a77b772bf7 Giovanni Cabiddu          2016-10-21  244  		if (dir)
2d3553ecb4e316a Herbert Xu                2025-03-15  245  			ret = crypto_scomp_compress(scomp, src, slen,
2d3553ecb4e316a Herbert Xu                2025-03-15  246  						    dst, &dlen, stream->ctx);
1ab53a77b772bf7 Giovanni Cabiddu          2016-10-21  247  		else
2d3553ecb4e316a Herbert Xu                2025-03-15  248  			ret = crypto_scomp_decompress(scomp, src, slen,
2d3553ecb4e316a Herbert Xu                2025-03-15  249  						      dst, &dlen, stream->ctx);
2d3553ecb4e316a Herbert Xu                2025-03-15  250  
42d9f6c774790d2 Herbert Xu                2025-03-19  251  		scomp_unlock_scratch(scratch);
a7b1d0c5f1ca05c Herbert Xu                2025-03-19  252  	} else if (dir)
a7b1d0c5f1ca05c Herbert Xu                2025-03-19  253  		ret = crypto_scomp_compress(scomp, src, slen,
a7b1d0c5f1ca05c Herbert Xu                2025-03-19  254  					    dst, &dlen, stream->ctx);
a7b1d0c5f1ca05c Herbert Xu                2025-03-19  255  	else
a7b1d0c5f1ca05c Herbert Xu                2025-03-19  256  		ret = crypto_scomp_decompress(scomp, src, slen,
a7b1d0c5f1ca05c Herbert Xu                2025-03-19  257  					      dst, &dlen, stream->ctx);
a7b1d0c5f1ca05c Herbert Xu                2025-03-19  258  
42d9f6c774790d2 Herbert Xu                2025-03-19  259  	crypto_acomp_unlock_stream_bh(stream);
2d3553ecb4e316a Herbert Xu                2025-03-15  260  
2d3553ecb4e316a Herbert Xu                2025-03-15  261  	req->dlen = dlen;
77292bb8ca69c80 Barry Song                2024-03-02  262  
a7b1d0c5f1ca05c Herbert Xu                2025-03-19  263  	if (!src_isvirt && src)
a7b1d0c5f1ca05c Herbert Xu                2025-03-19  264  		kunmap_local(src);
a7b1d0c5f1ca05c Herbert Xu                2025-03-19  265  	if (!dst_isvirt) {
2d3553ecb4e316a Herbert Xu                2025-03-15  266  		kunmap_local(dst);
2d3553ecb4e316a Herbert Xu                2025-03-15  267  		dlen += doff;
2d3553ecb4e316a Herbert Xu                2025-03-15  268  		for (;;) {
2d3553ecb4e316a Herbert Xu                2025-03-15  269  			flush_dcache_page(dpage);
2d3553ecb4e316a Herbert Xu                2025-03-15  270  			if (dlen <= PAGE_SIZE)
2d3553ecb4e316a Herbert Xu                2025-03-15  271  				break;
2d3553ecb4e316a Herbert Xu                2025-03-15  272  			dlen -= PAGE_SIZE;
ce00897b94bc5c6 David Hildenbrand         2025-09-01  273  			dpage++;
77292bb8ca69c80 Barry Song                2024-03-02  274  		}
1ab53a77b772bf7 Giovanni Cabiddu          2016-10-21  275  	}
2d3553ecb4e316a Herbert Xu                2025-03-15  276  
1ab53a77b772bf7 Giovanni Cabiddu          2016-10-21  277  	return ret;
1ab53a77b772bf7 Giovanni Cabiddu          2016-10-21  278  }
1ab53a77b772bf7 Giovanni Cabiddu          2016-10-21  279  

:::::: The code at line 92 was first introduced by commit
:::::: c47e1f4142a3823b6e963e14db295a8a733804b5 crypto: scomp - Allocate per-cpu buffer on first use of each CPU

:::::: TO: Herbert Xu <herbert@gondor.apana.org.au>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
