Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C945246773;
	Fri, 17 Oct 2025 03:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760670611; cv=none; b=LLwsE/G19aPrrqMc0xMXnt3jpzrtzaVoNYpljdcoanj8GVW6GjRBgcI9PZmEWMxMfgpwnx/waRy0L6/Z5+jbU8ApaRoWsdYbgpu/b0Yh9T97XfozSFbpjvqqGtqmHkdUjsjQ4KcmvXkwal2OsLHMgTM9BEpTz2QjezikM9c8I/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760670611; c=relaxed/simple;
	bh=/+LxSluv7aDw/AI/2fm6dlIfW0gbQe7klAqez1nbV6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BOhrzNJYZO2FfTAC+j9B1rMUi6zsjiBXaIkUNg5N5dgpkXwoTQAq22XUFBkxjF0QGsZp6CwAAE3t+d5W5Cau2zTMtJkM4ZHr/+/Bfx+dC+dwuh3/iGh/12B8ca++TMQcHQ3Gt4+lrqQtSEOVty2q80w3YqIrpTnWNR+oeHMczik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BaFQ+l3W; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BaFQ+l3W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760670610; x=1792206610;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/+LxSluv7aDw/AI/2fm6dlIfW0gbQe7klAqez1nbV6E=;
  b=BaFQ+l3WmqR4daOPhzrelXH3VLEvEkdjb6QLkweSrO5gTCNcsImGZt16
   Cqan/ly/U7ccGNTtveVJkxHsfZUU03aUe5qlvzhjbZiYIAmH0PqeXeRqU
   OOykE03/uPQSVAGyb3gNPA3VEVg5bvJS+Vldx6/KgbbxPH6W8KdWgipxv
   AxvhwCGPDNdam6tkJYRYyrbECWC1wMT1NEXEf2On2LDtYojUwTu2tsHbK
   CM0ePUoj0vFAfRFfJ+A01wB5J6bhajHlaRAPQ73IMZUUa42oLFXACHn6v
   nENa84VlwzeiwlnPfJUtAxS0wYqG2HvJgOO8YkJt2m54SZKuLRXjnxUUg
   g==;
X-CSE-ConnectionGUID: JsiH9jhwRVWqr+fGD3cG0Q==
X-CSE-MsgGUID: nMk+mAMRS42a5//+CXMcQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="62922602"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="62922602"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 20:10:08 -0700
X-CSE-ConnectionGUID: Xgxzd1jNR9eqCP7aaJr8zg==
X-CSE-MsgGUID: znK5Y+kFS/WADBCN5mannw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="213203965"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 16 Oct 2025 20:10:04 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9aqv-0005Tv-2m;
	Fri, 17 Oct 2025 03:10:01 +0000
Date: Fri, 17 Oct 2025 11:09:27 +0800
From: kernel test robot <lkp@intel.com>
To: Longlong Xia <xialonglong2025@163.com>, linmiaohe@huawei.com,
	david@redhat.com, lance.yang@linux.dev
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	markus.elfring@web.de, nao.horiguchi@gmail.com,
	akpm@linux-foundation.org, wangkefeng.wang@huawei.com,
	qiuxu.zhuo@intel.com, xu.xin16@zte.com.cn,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Longlong Xia <xialonglong@kylinos.cn>
Subject: Re: [PATCH v2 1/1] mm/ksm: recover from memory failure on KSM page
 by migrating to healthy duplicate
Message-ID: <202510171017.wBXHozQb-lkp@intel.com>
References: <20251016101813.484565-2-xialonglong2025@163.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016101813.484565-2-xialonglong2025@163.com>

Hi Longlong,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master v6.18-rc1 next-20251016]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Longlong-Xia/mm-ksm-recover-from-memory-failure-on-KSM-page-by-migrating-to-healthy-duplicate/20251016-182115
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20251016101813.484565-2-xialonglong2025%40163.com
patch subject: [PATCH v2 1/1] mm/ksm: recover from memory failure on KSM page by migrating to healthy duplicate
config: x86_64-buildonly-randconfig-003-20251017 (https://download.01.org/0day-ci/archive/20251017/202510171017.wBXHozQb-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251017/202510171017.wBXHozQb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510171017.wBXHozQb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/ksm.c:3160:6: warning: variable 'nid' set but not used [-Wunused-but-set-variable]
    3160 |         int nid;
         |             ^
   1 warning generated.


vim +/nid +3160 mm/ksm.c

  3155	
  3156	static struct page *create_new_stable_node_dup(struct ksm_stable_node *chain_head,
  3157			struct folio *healthy_folio,
  3158			struct ksm_stable_node **new_stable_node)
  3159	{
> 3160		int nid;
  3161		unsigned long kpfn;
  3162		struct page *new_page = NULL;
  3163	
  3164		if (!is_stable_node_chain(chain_head))
  3165			return NULL;
  3166	
  3167		new_page = alloc_page(GFP_HIGHUSER_MOVABLE | __GFP_ZERO);
  3168		if (!new_page)
  3169			return NULL;
  3170	
  3171		copy_highpage(new_page, folio_page(healthy_folio, 0));
  3172	
  3173		*new_stable_node = alloc_stable_node();
  3174		if (!*new_stable_node) {
  3175			__free_page(new_page);
  3176			return NULL;
  3177		}
  3178	
  3179		INIT_HLIST_HEAD(&(*new_stable_node)->hlist);
  3180		kpfn = page_to_pfn(new_page);
  3181		(*new_stable_node)->kpfn = kpfn;
  3182		nid = get_kpfn_nid(kpfn);
  3183		DO_NUMA((*new_stable_node)->nid = nid);
  3184		(*new_stable_node)->rmap_hlist_len = 0;
  3185	
  3186		(*new_stable_node)->head = STABLE_NODE_DUP_HEAD;
  3187		hlist_add_head(&(*new_stable_node)->hlist_dup, &chain_head->hlist);
  3188		ksm_stable_node_dups++;
  3189		folio_set_stable_node(page_folio(new_page), *new_stable_node);
  3190		folio_add_lru(page_folio(new_page));
  3191	
  3192		return new_page;
  3193	}
  3194	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
