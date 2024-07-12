Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DAA31CF96;
	Fri, 12 Jul 2024 22:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720822974; cv=none; b=NSt7mgAv1dCqkrr9krqGgT1nbG1whuTjJVb2SL+06pCGbMy8p5vXFU+8LJcPx2/D/ByRpkSIfUPonzZyFJDzio8Upi9AJcNuqsSswg8300tRP1V+8UauB4civfpFcJRbWmgnrQngsJqbKWhbXezCoEC5y28Tjq0LLTKyxYpK/x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720822974; c=relaxed/simple;
	bh=Ejkg66IHIw0oBE9286qKyHlaTIIl8KEUYokGxvHF6Hk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uH9lrOuJvHs7aaWtwNA8j7kaN/1F2H5U5N5nns1AIm3F76Thc9U+nnmGf9fkn5359d3Vp2JAFYgc45YcLjhWkKEba0CpNQeSBEbIwZGpWA68H+/4U5c0eOvrJamLpjffbBvon0EPkW/8m3xKWtyPu1UcswCHsZPQmfE78wN85YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SUcyUX19; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SUcyUX19"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720822972; x=1752358972;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ejkg66IHIw0oBE9286qKyHlaTIIl8KEUYokGxvHF6Hk=;
  b=SUcyUX19NsMLlGXlGsxH8x9BPtEb3xZfuTVkNg7JIuvkz7XDr5ITKz+p
   Hkf+atIoWHDjJ3gRtjCUrVdRRQk3sTT+w+CgSeSYAfnVed3kgREmu0tKl
   dWO/huHuLWKwHt8LHw5telzryMNMOhBSg/MCNsjYz1FL21fLBDty4FZLZ
   p72Bn9DkL7qxplZ4OYvI/kpjacIAIht8ePIYNVJLvL5hVRQzEv+evgF0C
   uf9dqBTBfHgl0NQtVS329HAozQHwPKDg2JwB2n90KZQsFo+Hc1ah6fBz8
   tW1SBmKsEPyQK9FCG2AEH5nVAsWYyST1yKlEZXSxT/0HJbGDytI5J6BZT
   g==;
X-CSE-ConnectionGUID: b3ljhDL3ROCo4RvRUp7lDA==
X-CSE-MsgGUID: HtmgHreAT8C443X+UVBO3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="18414175"
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; 
   d="scan'208";a="18414175"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2024 15:22:51 -0700
X-CSE-ConnectionGUID: mqf6/TYRRPGeD6EP950Zfw==
X-CSE-MsgGUID: hyre9DRBTLu9H7Z6LUtolw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; 
   d="scan'208";a="79740435"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 12 Jul 2024 15:22:50 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSOfA-000bN4-0G;
	Fri, 12 Jul 2024 22:22:48 +0000
Date: Sat, 13 Jul 2024 06:22:42 +0800
From: kernel test robot <lkp@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [vbabka:slub-percpu-sheaves-v1r0 9/12] mm/slub.c:6902: warning:
 Function parameter or struct member 'rcu_dtor' not described in
 'kmem_cache_setup_percpu_sheaves'
Message-ID: <202407130625.lnPAwgyG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git slub-percpu-sheaves-v1r0
head:   9cb4096680ee90fe6be1b22ff3961174fa8e3ee4
commit: 542c087fb1a71b4b234d2319a5fff753a06d6139 [9/12] mm/slub: add sheaf support for batching kfree_rcu() operations
config: x86_64-buildonly-randconfig-001-20240713 (https://download.01.org/0day-ci/archive/20240713/202407130625.lnPAwgyG-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240713/202407130625.lnPAwgyG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407130625.lnPAwgyG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/slub.c:6902: warning: Function parameter or struct member 'rcu_dtor' not described in 'kmem_cache_setup_percpu_sheaves'


vim +6902 mm/slub.c

81819f0fc8285a Christoph Lameter 2007-05-06  6864  
6912a14dbbe638 Vlastimil Babka   2023-11-15  6865  /**
6912a14dbbe638 Vlastimil Babka   2023-11-15  6866   * kmem_cache_setup_percpu_sheaves - Create percpu sheaves for the cache.
6912a14dbbe638 Vlastimil Babka   2023-11-15  6867   * @s: The cache to add sheaves to. Must be created with SLAB_NO_MERGE flag.
6912a14dbbe638 Vlastimil Babka   2023-11-15  6868   * @capacity: Object capacity of each sheaf.
6912a14dbbe638 Vlastimil Babka   2023-11-15  6869   *
6912a14dbbe638 Vlastimil Babka   2023-11-15  6870   * After this call, allocations from the cache go through caching arrays called
6912a14dbbe638 Vlastimil Babka   2023-11-15  6871   * sheaves. Each cpu has a main sheaf that's always present, and a spare sheaf
6912a14dbbe638 Vlastimil Babka   2023-11-15  6872   * thay may be not present. When both become empty, there's an attempt to
6912a14dbbe638 Vlastimil Babka   2023-11-15  6873   * replace an empty sheaf with a full sheaf from the per-node barn.
6912a14dbbe638 Vlastimil Babka   2023-11-15  6874   *
6912a14dbbe638 Vlastimil Babka   2023-11-15  6875   * When no full sheaf is available, and gfp flags allow blocking, a sheaf is
6912a14dbbe638 Vlastimil Babka   2023-11-15  6876   * allocated and filled from slab(s) using bulk allocation. Otherwise the
6912a14dbbe638 Vlastimil Babka   2023-11-15  6877   * allocation falls back to the normal operation allocating a single object from
6912a14dbbe638 Vlastimil Babka   2023-11-15  6878   * a slab.
6912a14dbbe638 Vlastimil Babka   2023-11-15  6879   *
6912a14dbbe638 Vlastimil Babka   2023-11-15  6880   * Analogically when freeing and both percpu sheafs are full, the barn may
6912a14dbbe638 Vlastimil Babka   2023-11-15  6881   * replace it with an empty sheaf, unless it's over capacity. In that case
6912a14dbbe638 Vlastimil Babka   2023-11-15  6882   * a sheaf is bulk freed to slab pages.
6912a14dbbe638 Vlastimil Babka   2023-11-15  6883   *
6912a14dbbe638 Vlastimil Babka   2023-11-15  6884   * The sheaves does not distinguish NUMA placement of objects, so allocations
6912a14dbbe638 Vlastimil Babka   2023-11-15  6885   * via kmem_cache_alloc_node() with a node specified other than NUMA_NO_NODE
6912a14dbbe638 Vlastimil Babka   2023-11-15  6886   * will bypass them.
6912a14dbbe638 Vlastimil Babka   2023-11-15  6887   *
6912a14dbbe638 Vlastimil Babka   2023-11-15  6888   * Bulk allocation and free operations also try to use the cpu sheaves and barn,
6912a14dbbe638 Vlastimil Babka   2023-11-15  6889   * but fallback to using slab pages directly.
6912a14dbbe638 Vlastimil Babka   2023-11-15  6890   *
6912a14dbbe638 Vlastimil Babka   2023-11-15  6891   * Limitations: when slub_debug is enabled for the cache, all relevant actions
6912a14dbbe638 Vlastimil Babka   2023-11-15  6892   * (i.e. poisoning, obtaining stacktraces) and checks happen when objects move
6912a14dbbe638 Vlastimil Babka   2023-11-15  6893   * between sheafs and slab pages, which may result in e.g. not detecting a
6912a14dbbe638 Vlastimil Babka   2023-11-15  6894   * use-after-free while the object is in the array cache, and the stacktraces
6912a14dbbe638 Vlastimil Babka   2023-11-15  6895   * may be less useful.
6912a14dbbe638 Vlastimil Babka   2023-11-15  6896   *
6912a14dbbe638 Vlastimil Babka   2023-11-15  6897   * Return: 0 if OK, -EINVAL on caches without SLAB_NO_MERGE or with the sheaves
6912a14dbbe638 Vlastimil Babka   2023-11-15  6898   * already created, -ENOMEM when the per-cpu sheaves creation fails.
6912a14dbbe638 Vlastimil Babka   2023-11-15  6899   */
542c087fb1a71b Vlastimil Babka   2024-07-04  6900  int kmem_cache_setup_percpu_sheaves(struct kmem_cache *s, unsigned int capacity,
542c087fb1a71b Vlastimil Babka   2024-07-04  6901  				    void (*rcu_dtor)(void *))
6912a14dbbe638 Vlastimil Babka   2023-11-15 @6902  {
6912a14dbbe638 Vlastimil Babka   2023-11-15  6903  	int nid, cpu;
6912a14dbbe638 Vlastimil Babka   2023-11-15  6904  	struct kmem_cache_node *n;
6912a14dbbe638 Vlastimil Babka   2023-11-15  6905  
6912a14dbbe638 Vlastimil Babka   2023-11-15  6906  	if (WARN_ON_ONCE(!(s->flags & SLAB_NO_MERGE)))
6912a14dbbe638 Vlastimil Babka   2023-11-15  6907  		return -EINVAL;
6912a14dbbe638 Vlastimil Babka   2023-11-15  6908  
6912a14dbbe638 Vlastimil Babka   2023-11-15  6909  	if (s->cpu_sheaves)
6912a14dbbe638 Vlastimil Babka   2023-11-15  6910  		return -EINVAL;
6912a14dbbe638 Vlastimil Babka   2023-11-15  6911  
6912a14dbbe638 Vlastimil Babka   2023-11-15  6912  	// TODO: increase capacity to grow slab_sheaf up to next kmalloc size?
6912a14dbbe638 Vlastimil Babka   2023-11-15  6913  
6912a14dbbe638 Vlastimil Babka   2023-11-15  6914  	s->cpu_sheaves = alloc_percpu(struct slub_percpu_sheaves);
6912a14dbbe638 Vlastimil Babka   2023-11-15  6915  
6912a14dbbe638 Vlastimil Babka   2023-11-15  6916  	if (!s->cpu_sheaves)
6912a14dbbe638 Vlastimil Babka   2023-11-15  6917  		return -ENOMEM;
6912a14dbbe638 Vlastimil Babka   2023-11-15  6918  
6912a14dbbe638 Vlastimil Babka   2023-11-15  6919  	s->sheaf_capacity = capacity;
6912a14dbbe638 Vlastimil Babka   2023-11-15  6920  
6912a14dbbe638 Vlastimil Babka   2023-11-15  6921  	mutex_lock(&slab_mutex);
6912a14dbbe638 Vlastimil Babka   2023-11-15  6922  
6912a14dbbe638 Vlastimil Babka   2023-11-15  6923  	for_each_node_mask(nid, slab_nodes) {
6912a14dbbe638 Vlastimil Babka   2023-11-15  6924  		struct node_barn *barn;
6912a14dbbe638 Vlastimil Babka   2023-11-15  6925  
6912a14dbbe638 Vlastimil Babka   2023-11-15  6926  		barn = kmalloc_node(sizeof(*barn), GFP_KERNEL, nid);
6912a14dbbe638 Vlastimil Babka   2023-11-15  6927  
6912a14dbbe638 Vlastimil Babka   2023-11-15  6928  		if (!barn) {
6912a14dbbe638 Vlastimil Babka   2023-11-15  6929  			mutex_unlock(&slab_mutex);
6912a14dbbe638 Vlastimil Babka   2023-11-15  6930  			goto undo_barns;
6912a14dbbe638 Vlastimil Babka   2023-11-15  6931  		}
6912a14dbbe638 Vlastimil Babka   2023-11-15  6932  
6912a14dbbe638 Vlastimil Babka   2023-11-15  6933  		barn_init(barn);
6912a14dbbe638 Vlastimil Babka   2023-11-15  6934  
6912a14dbbe638 Vlastimil Babka   2023-11-15  6935  		get_node(s, nid)->barn = barn;
6912a14dbbe638 Vlastimil Babka   2023-11-15  6936  	}
6912a14dbbe638 Vlastimil Babka   2023-11-15  6937  
6912a14dbbe638 Vlastimil Babka   2023-11-15  6938  	mutex_unlock(&slab_mutex);
6912a14dbbe638 Vlastimil Babka   2023-11-15  6939  
6912a14dbbe638 Vlastimil Babka   2023-11-15  6940  	for_each_possible_cpu(cpu) {
6912a14dbbe638 Vlastimil Babka   2023-11-15  6941  		struct slub_percpu_sheaves *pcs;
6912a14dbbe638 Vlastimil Babka   2023-11-15  6942  
6912a14dbbe638 Vlastimil Babka   2023-11-15  6943  		pcs = per_cpu_ptr(s->cpu_sheaves, cpu);
6912a14dbbe638 Vlastimil Babka   2023-11-15  6944  
6912a14dbbe638 Vlastimil Babka   2023-11-15  6945  		local_lock_init(&pcs->lock);
6912a14dbbe638 Vlastimil Babka   2023-11-15  6946  
6912a14dbbe638 Vlastimil Babka   2023-11-15  6947  		nid = cpu_to_mem(cpu);
6912a14dbbe638 Vlastimil Babka   2023-11-15  6948  
6912a14dbbe638 Vlastimil Babka   2023-11-15  6949  		pcs->barn = get_node(s, nid)->barn;
6912a14dbbe638 Vlastimil Babka   2023-11-15  6950  		pcs->main = alloc_empty_sheaf(s, GFP_KERNEL);
6912a14dbbe638 Vlastimil Babka   2023-11-15  6951  
6912a14dbbe638 Vlastimil Babka   2023-11-15  6952  		if (!pcs->main)
6912a14dbbe638 Vlastimil Babka   2023-11-15  6953  			goto undo_main_sheaves;
6912a14dbbe638 Vlastimil Babka   2023-11-15  6954  	}
6912a14dbbe638 Vlastimil Babka   2023-11-15  6955  
542c087fb1a71b Vlastimil Babka   2024-07-04  6956  	s->rcu_dtor = rcu_dtor;
542c087fb1a71b Vlastimil Babka   2024-07-04  6957  
6912a14dbbe638 Vlastimil Babka   2023-11-15  6958  	return 0;
6912a14dbbe638 Vlastimil Babka   2023-11-15  6959  
6912a14dbbe638 Vlastimil Babka   2023-11-15  6960  undo_main_sheaves:
6912a14dbbe638 Vlastimil Babka   2023-11-15  6961  	for_each_possible_cpu(cpu) {
6912a14dbbe638 Vlastimil Babka   2023-11-15  6962  		struct slub_percpu_sheaves *pcs;
6912a14dbbe638 Vlastimil Babka   2023-11-15  6963  
6912a14dbbe638 Vlastimil Babka   2023-11-15  6964  		pcs = per_cpu_ptr(s->cpu_sheaves, cpu);
6912a14dbbe638 Vlastimil Babka   2023-11-15  6965  
6912a14dbbe638 Vlastimil Babka   2023-11-15  6966  		if (pcs->main) {
6912a14dbbe638 Vlastimil Babka   2023-11-15  6967  			free_empty_sheaf(s, pcs->main);
6912a14dbbe638 Vlastimil Babka   2023-11-15  6968  			pcs->main = NULL;
6912a14dbbe638 Vlastimil Babka   2023-11-15  6969  		}
6912a14dbbe638 Vlastimil Babka   2023-11-15  6970  	}
6912a14dbbe638 Vlastimil Babka   2023-11-15  6971  
6912a14dbbe638 Vlastimil Babka   2023-11-15  6972  undo_barns:
6912a14dbbe638 Vlastimil Babka   2023-11-15  6973  	for_each_kmem_cache_node(s, nid, n) {
6912a14dbbe638 Vlastimil Babka   2023-11-15  6974  		if (n->barn) {
6912a14dbbe638 Vlastimil Babka   2023-11-15  6975  			kfree(n->barn);
6912a14dbbe638 Vlastimil Babka   2023-11-15  6976  			n->barn = NULL;
6912a14dbbe638 Vlastimil Babka   2023-11-15  6977  		}
6912a14dbbe638 Vlastimil Babka   2023-11-15  6978  	}
6912a14dbbe638 Vlastimil Babka   2023-11-15  6979  
6912a14dbbe638 Vlastimil Babka   2023-11-15  6980  	free_percpu(s->cpu_sheaves);
6912a14dbbe638 Vlastimil Babka   2023-11-15  6981  	s->cpu_sheaves = NULL;
6912a14dbbe638 Vlastimil Babka   2023-11-15  6982  
6912a14dbbe638 Vlastimil Babka   2023-11-15  6983  	return -ENOMEM;
6912a14dbbe638 Vlastimil Babka   2023-11-15  6984  }
6912a14dbbe638 Vlastimil Babka   2023-11-15  6985  

:::::: The code at line 6902 was first introduced by commit
:::::: 6912a14dbbe63891a545d4cd35b60bcd3dee3d40 mm/slub: add opt-in caching layer of percpu sheaves

:::::: TO: Vlastimil Babka <vbabka@suse.cz>
:::::: CC: Vlastimil Babka <vbabka@suse.cz>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
