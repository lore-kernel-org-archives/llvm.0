Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997695D905;
	Sat,  3 Feb 2024 13:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706965488; cv=none; b=js3Maue+EgvFwFaQjHl00Gokab4P6Lz5QIWf/q9l7euhDaPecziRdtNHCD2XsFgiC9HGpEoY3fpOvCPYlMm9JigCjlhnrMOp6XN+M7l0kGWlViWm05cQ9BC/ptUbp8rAYMkVii+bf7Hg2mP++dubIiR4S0XqfFhppOFa3KQrGgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706965488; c=relaxed/simple;
	bh=rXezbFoIoVPvOb5xFsvLuYCgvv61ODqgpCMWzHAJBCU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QKt4tyvnKesyLEE6183eXKw6/DEhRyBkLGWhtvDxLwRFamKNfuQ7biSCNGyk/m27S6esGnMhej7UTd/T7AbdvQ8GAZZb82YqkXXwlwlxQHDGIhiHh6PqP/j0lfTfyDTtcORS6aWObd8x1KHIkiZWnCkohTC/pusIy9q49aXMJP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RqVdioP7; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RqVdioP7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706965487; x=1738501487;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rXezbFoIoVPvOb5xFsvLuYCgvv61ODqgpCMWzHAJBCU=;
  b=RqVdioP7jnpZyQrdbOrOkk4A3zWrNX5AsHO0Ht2Gw6gArUVpGjiPH9JW
   uIZ7X31JpIvAxVnfEjV7A4kJfr1dYTRxlp7An5sOIVdW95R2BSX7SJGmx
   zmrJ1PprP8iKNr1n+zLJkBpaoZBVvK97iSQ6Gg2Kf+IBpi6XWBy2hINbR
   +kfb60HXNbFvtXR1o8gI7vUyAyYHQ9ackzsEiQJUj2xxxu83F/LjkK5of
   8KbuI39O4zJzvT6I3PaC9YgrlkC5R6D/hqiX5W7FxF0p0a/GHDNpF/3GS
   JzKtcTwjHTah6WkmcNX4IA/aJ7a96qpttVdCcWHtUSSbWucUAmu70TuXk
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="470373"
X-IronPort-AV: E=Sophos;i="6.05,240,1701158400"; 
   d="scan'208";a="470373"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2024 05:04:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="908848512"
X-IronPort-AV: E=Sophos;i="6.05,240,1701158400"; 
   d="scan'208";a="908848512"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 03 Feb 2024 05:04:44 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWFhK-00054I-1b;
	Sat, 03 Feb 2024 13:04:42 +0000
Date: Sat, 3 Feb 2024 21:04:04 +0800
From: kernel test robot <lkp@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [vbabka:slub-percpu-caches-v4r1-BROKEN 2/6] mm/slub.c:4878:10:
 warning: expression which evaluates to zero treated as a null pointer
 constant of type 'void *'
Message-ID: <202402032112.HhHYWQUZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git slub-percpu-caches-v4r1-BROKEN
head:   769a361e3d36bf4b006b69c6adbdcd24fe2e470a
commit: 8f3b3550b6d09f88b11b9d89eb1d6a215c48bf98 [2/6] mm/slub: add opt-in percpu array cache of objects
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20240203/202402032112.HhHYWQUZ-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7dd790db8b77c4a833c06632e903dc4f13877a64)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240203/202402032112.HhHYWQUZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402032112.HhHYWQUZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/slub.c:2595:15: warning: variable 'partial_slabs' set but not used [-Wunused-but-set-variable]
    2595 |         unsigned int partial_slabs = 0;
         |                      ^
>> mm/slub.c:4878:10: warning: expression which evaluates to zero treated as a null pointer constant of type 'void *' [-Wnon-literal-null-conversion]
    4878 |                 return false;
         |                        ^~~~~
>> mm/slub.c:4953:6: warning: variable 'pca' is uninitialized when used here [-Wuninitialized]
    4953 |         if (pca->count < count)
         |             ^~~
   mm/slub.c:4943:31: note: initialize the variable 'pca' to silence this warning
    4943 |         struct slub_percpu_array *pca;
         |                                      ^
         |                                       = NULL
   mm/slub.c:2045:34: warning: unused function 'memcg_from_slab_obj' [-Wunused-function]
    2045 | static inline struct mem_cgroup *memcg_from_slab_obj(void *ptr)
         |                                  ^~~~~~~~~~~~~~~~~~~
   4 warnings generated.


vim +4878 mm/slub.c

  4863	
  4864	static void *refill_pca(struct kmem_cache *s, unsigned int count, gfp_t gfp,
  4865				bool want_obj)
  4866	{
  4867		unsigned int batch, allocated;
  4868		struct slub_percpu_array *pca;
  4869		void *objects[PCA_BATCH_MAX];
  4870		unsigned long flags;
  4871		void *obj = NULL;
  4872	
  4873		if (count > PCA_BATCH_MAX)
  4874			return ERR_PTR(-EINVAL);
  4875	
  4876		allocated = __kmem_cache_alloc_bulk(s, gfp, count, &objects[0]);
  4877		if (!allocated)
> 4878			return false;
  4879	
  4880		if (want_obj)
  4881			obj = objects[--allocated];
  4882	
  4883		local_lock_irqsave(&s->cpu_array->lock, flags);
  4884		pca = this_cpu_read(s->cpu_array);
  4885	
  4886		batch = min(allocated, pca->count - pca->used);
  4887	
  4888		for (unsigned int i = 0; i < batch; i++)
  4889			pca->objects[pca->used++] = objects[i];
  4890	
  4891		local_unlock_irqrestore(&s->cpu_array->lock, flags);
  4892	
  4893		stat_add(s, PCA_REFILL, batch);
  4894	
  4895		/*
  4896		 * We could have migrated to a different cpu or somebody else freed to the
  4897		 * pca while we were bulk allocating, and now we have too many objects
  4898		 */
  4899		if (batch < allocated)
  4900			__kmem_cache_free_bulk(s, allocated - batch, &objects[batch]);
  4901	
  4902		return obj;
  4903	}
  4904	
  4905	static void flush_pca(struct kmem_cache *s, unsigned int count)
  4906	{
  4907		struct slub_percpu_array *pca;
  4908		unsigned int batch, remaining;
  4909		void *objects[PCA_BATCH_MAX];
  4910		unsigned long flags;
  4911	
  4912		local_lock_irqsave(&s->cpu_array->lock, flags);
  4913		pca = this_cpu_read(s->cpu_array);
  4914	
  4915	next_batch:
  4916		batch = min(count, PCA_BATCH_MAX);
  4917	
  4918		batch = min(batch, pca->used);
  4919	
  4920		for (unsigned int i = 0; i < batch; i++) {
  4921			objects[i] = pca->objects[--pca->used];
  4922		}
  4923	
  4924		remaining = pca->used;
  4925	
  4926		local_unlock_irqrestore(&s->cpu_array->lock, flags);
  4927	
  4928		__kmem_cache_free_bulk(s, batch, &objects[0]);
  4929	
  4930		stat_add(s, PCA_FLUSH, batch);
  4931	
  4932		if (batch < count && remaining > 0) {
  4933			count -= batch;
  4934			local_lock_irqsave(&s->cpu_array->lock, flags);
  4935			pca = this_cpu_read(s->cpu_array);
  4936			goto next_batch;
  4937		}
  4938	}
  4939	
  4940	int kmem_cache_prefill_percpu_array(struct kmem_cache *s, unsigned int count,
  4941					    gfp_t gfp)
  4942	{
  4943		struct slub_percpu_array *pca;
  4944		unsigned int used, batch;
  4945		void *refill;
  4946	
  4947		if (!gfpflags_allow_blocking(gfp))
  4948			return -EINVAL;
  4949	
  4950		if (!s->cpu_array)
  4951			return -EINVAL;
  4952	
> 4953		if (pca->count < count)
  4954			return -EINVAL;
  4955	
  4956		/* racy but we don't care */
  4957		pca = raw_cpu_ptr(s->cpu_array);
  4958	
  4959		used = READ_ONCE(pca->used);
  4960		if (used >= count)
  4961			return 0;
  4962	
  4963		count -= used;
  4964	
  4965	refill:
  4966		batch = min(count, PCA_BATCH_MAX);
  4967	
  4968		refill = refill_pca(s, batch, gfp, false);
  4969		if (IS_ERR(refill))
  4970			return PTR_ERR(refill);
  4971	
  4972		count -= batch;
  4973		if (count) {
  4974			pca = raw_cpu_ptr(s->cpu_array);
  4975			if (pca->used < pca->count)
  4976				goto refill;
  4977		}
  4978	
  4979		return 0;
  4980	}
  4981	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
