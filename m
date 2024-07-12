Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F988F6A;
	Fri, 12 Jul 2024 20:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720817870; cv=none; b=nXEwnZuJjRePot/FuAEWIeSqErU0ekeSyH/cPRM09CRhoKQ9BcFH42BvTWvHXRDl6hQg/kOjkb7H+5EiJTJqO+U49uS4EBKWkicswcKgNSmcUmSMQZghSPeuqEC7z0zWQNBJGZtyMInkezthE4KoAQfmqeypjzvBE8dbH04Iozc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720817870; c=relaxed/simple;
	bh=sGV7xrs51dDxcdS2bvo60avrSBhSSCEJ22VFQSNBH3o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K0ZYkUpQnkV5HNoCkK0kd7IwyQc/YhrM/jPUU93TcKghDs/fM+/rUSoBu8n4FsD2JGd4EPoJ8iFPwxcD1uBkk3Za2rtCXUjBEgHKNO6DBa293DBT37CBanbLH7v/CSYV85doj+1FNL43kzlnhkYGeCMgLmAbEcTbemJZR7RFdpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iRVvAEs0; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iRVvAEs0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720817869; x=1752353869;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sGV7xrs51dDxcdS2bvo60avrSBhSSCEJ22VFQSNBH3o=;
  b=iRVvAEs0vaCtaXfymOfJ+aNzagPk+I3xbSPfHyP1LLz3X/sIJYQ0qiwV
   JlyjG9SyJT3ydg6TMTCqO0dSWLPCb95vshzwXPAmXX13e/JT9//XE/oGI
   0x+IZ1VKJMNTqW/9C4KTW5ur84gcAKXulwpl7nOT/RY0XcIcRB5PEwt4L
   l2r5GAmte/49lL+xo166gqakph/uNIeJn5QVCvdxct4yF37o56dSxcU8L
   I3BOvaHNVl/uR1g1Jv6U3KzgV8C0ZQvEzswC/Gpy6xytLGti3w6Eu4DXx
   ka8VXeLYT60m5VRqGQ3ZzVOsI8P36EroMEmPbCCJzUj35Z28bNDSr3qch
   w==;
X-CSE-ConnectionGUID: uz9xWISgREOK/JpwiZVrGg==
X-CSE-MsgGUID: qU1NJCmUR0ayHtIUd3tP/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="40808582"
X-IronPort-AV: E=Sophos;i="6.09,203,1716274800"; 
   d="scan'208";a="40808582"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2024 13:57:48 -0700
X-CSE-ConnectionGUID: V/Nbl1JLT3yJOt6M8uGEkw==
X-CSE-MsgGUID: C699OWXHQuCLuMfAeIhLVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,203,1716274800"; 
   d="scan'208";a="53594247"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 12 Jul 2024 13:57:47 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSNKr-000bGs-05;
	Fri, 12 Jul 2024 20:57:45 +0000
Date: Sat, 13 Jul 2024 04:57:39 +0800
From: kernel test robot <lkp@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [vbabka:slub-percpu-sheaves-v1r0 8/12] mm/slub.c:5029:9: warning:
 variable 'i' is uninitialized when used here
Message-ID: <202407130414.KCTJMadC-lkp@intel.com>
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
commit: 6912a14dbbe63891a545d4cd35b60bcd3dee3d40 [8/12] mm/slub: add opt-in caching layer of percpu sheaves
config: x86_64-buildonly-randconfig-001-20240713 (https://download.01.org/0day-ci/archive/20240713/202407130414.KCTJMadC-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240713/202407130414.KCTJMadC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407130414.KCTJMadC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/slub.c:2434:29: warning: variable 'rcu_free' set but not used [-Wunused-but-set-variable]
    2434 |         struct slab_sheaf *spare, *rcu_free;
         |                                    ^
   mm/slub.c:4299:22: warning: variable 'obj_exts' set but not used [-Wunused-but-set-variable]
    4299 |         struct slabobj_ext *obj_exts;
         |                             ^
>> mm/slub.c:5029:9: warning: variable 'i' is uninitialized when used here [-Wuninitialized]
    5029 |         while (i < size) {
         |                ^
   mm/slub.c:5024:19: note: initialize the variable 'i' to silence this warning
    5024 |         unsigned batch, i;
         |                          ^
         |                           = 0
   3 warnings generated.


vim +/i +5029 mm/slub.c

  5013	
  5014	/*
  5015	 * Bulk free objects to the percpu sheaves.
  5016	 * Unlike free_to_pcs() this has includes the calls to all necessary hooks
  5017	 * and the fallback to freeing to slab pages.
  5018	 */
  5019	static void free_to_pcs_bulk(struct kmem_cache *s, size_t size, void **p)
  5020	{
  5021		struct slub_percpu_sheaves *pcs;
  5022		struct slab_sheaf *main;
  5023		unsigned long flags;
  5024		unsigned batch, i;
  5025		bool init;
  5026	
  5027		init = slab_want_init_on_free(s);
  5028	
> 5029		while (i < size) {
  5030			struct slab *slab = virt_to_slab(p[i]);
  5031	
  5032			memcg_slab_free_hook(s, slab, p[i], 1);
  5033			alloc_tagging_slab_free_hook(s, slab, p[i], 1);
  5034	
  5035			if (unlikely(!slab_free_hook(s, p[i], init))) {
  5036				p[i] = p[--size];
  5037				if (!size)
  5038					return;
  5039				continue;
  5040			}
  5041	
  5042			i++;
  5043		}
  5044	
  5045	next_batch:
  5046		local_lock_irqsave(&s->cpu_sheaves->lock, flags);
  5047		pcs = this_cpu_ptr(s->cpu_sheaves);
  5048	
  5049		if (unlikely(pcs->main->size == s->sheaf_capacity)) {
  5050	
  5051			struct slab_sheaf *empty;
  5052	
  5053			if (!pcs->spare) {
  5054				empty = barn_get_empty_sheaf(pcs->barn);
  5055				if (empty) {
  5056					pcs->spare = pcs->main;
  5057					pcs->main = empty;
  5058					goto do_free;
  5059				}
  5060				goto no_empty;
  5061			}
  5062	
  5063			if (pcs->spare->size < s->sheaf_capacity) {
  5064				stat(s, SHEAF_SWAP);
  5065				swap(pcs->main, pcs->spare);
  5066				goto do_free;
  5067			}
  5068	
  5069			empty = barn_replace_full_sheaf(pcs->barn, pcs->main);
  5070	
  5071			if (!IS_ERR(empty)) {
  5072				pcs->main = empty;
  5073				goto do_free;
  5074			}
  5075	
  5076	no_empty:
  5077			local_unlock_irqrestore(&s->cpu_sheaves->lock, flags);
  5078	
  5079			/*
  5080			 * if we depleted all empty sheafs in the barn or there are to
  5081			 * many full sheafs, free the rest to slab pages
  5082			 */
  5083	
  5084			__kmem_cache_free_bulk(s, size, p);
  5085			return;
  5086		}
  5087	
  5088	do_free:
  5089		main = pcs->main;
  5090		batch = min(size, s->sheaf_capacity - main->size);
  5091	
  5092		memcpy(main->objects + main->size, p, batch * sizeof(void *));
  5093		main->size += batch;
  5094	
  5095		local_unlock_irqrestore(&s->cpu_sheaves->lock, flags);
  5096	
  5097		stat_add(s, FREE_PCS, batch);
  5098	
  5099		if (batch < size) {
  5100			p += batch;
  5101			size -= batch;
  5102			goto next_batch;
  5103		}
  5104	}
  5105	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
