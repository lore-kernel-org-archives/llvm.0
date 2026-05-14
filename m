Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A6F3C3BE0;
	Thu, 14 May 2026 21:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778793838; cv=none; b=g6tho6rI6JXAgxtdf+9V4fnBfS2+wbL0iZetDGsuaVt1yNUwAVP+6DIsWKarLaqCC9rtZPlVWE8wmhVrZzf+wmS58xpXqRyPqU03OXMN+VKC73jutSRacz5QmTFzS6pyOwUQ5vXgN6rl9/NZPDjYt9Ib04j2faosNDyrITURAjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778793838; c=relaxed/simple;
	bh=9v/jjSvKvTC1ZSFJuDatA4FGl5Taf3HzAnre+yRuwEw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hqT9Npx0SYQezTKGNjifEiVHFOnL3/M6hZYyzKH3ECjaVn/ePtcK/Ei6ULf7BLSLzknTgDKpWAnEx8bhIK317VC7a30BrHxU7GOojv5cpjtX7qkgh4OgZoZVOLK0xyTQM8uvnGyQyGtYh82d1+b1JZwHyRL7Eoy4iXL03SUYWyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZkxGTPaM; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZkxGTPaM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778793837; x=1810329837;
  h=date:from:to:cc:subject:message-id;
  bh=9v/jjSvKvTC1ZSFJuDatA4FGl5Taf3HzAnre+yRuwEw=;
  b=ZkxGTPaMvmopd8+TSqLr53TZagXQoJJoL4yoykkndSQcmsgV2m/r8PrM
   MPm5xnBS8TAtwRI+vV3j1//4xlQqBKCMNsPs0QEiaJIevAgwrL2zpq5TE
   jx+lLT9i9VqnVPwHQTwW7ON43EGRLIv6QwucdvbGMK0ra0x/S6761Ggbr
   xR73Phkopip7f7syhSLwi0COr76czsfab867oqIyzFkA1Ihk5QTGYwXQt
   I3s33dcwOZViYqHGVR1V/X2bzLllFnTyT7DF8Ru+gOySIk66bRwyyuON5
   DEvUTql6OIfpwGFG7kY/flPXlPH5RTw0Kd7MRu6nYXKjxIMs7dclt/b5Q
   A==;
X-CSE-ConnectionGUID: HedQIY78SQmyOozpXbcyNQ==
X-CSE-MsgGUID: HD5PrqJJQKa6087oekWFCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="79603411"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="79603411"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 14:23:53 -0700
X-CSE-ConnectionGUID: /XCZxliNRbW26a59+6rkYA==
X-CSE-MsgGUID: 7Ex2W37VQH6vXHwJB+GC+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="235458967"
Received: from lkp-server02.sh.intel.com (HELO 7a33ad3e7d27) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 14 May 2026 14:23:51 -0700
Received: from kbuild by 7a33ad3e7d27 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNdX2-0000000001S-3MjC;
	Thu, 14 May 2026 21:23:48 +0000
Date: Fri, 15 May 2026 04:31:35 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-next 33/50] fs/netfs/bvecq.c:153:15:
 warning: implicit truncation from 'int' to bit-field changes value from 3 to
 -1
Message-ID: <202605150457.18ZdCIcX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-next
head:   da61c0cc3991fe9aab4894d85ab80021d1f24929
commit: c61bbe667e764ee7f7bc98b9003b225e91eabc69 [33/50] netfs: Add some tools for managing bvecq chains
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260515/202605150457.18ZdCIcX-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260515/202605150457.18ZdCIcX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605150457.18ZdCIcX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/netfs/bvecq.c:153:15: warning: implicit truncation from 'int' to bit-field changes value from 3 to -1 [-Wbitfield-constant-conversion]
     153 |                 p->mem_type = BVECQ_MEM_ALLOCED;
         |                             ^ ~~~~~~~~~~~~~~~~~
   fs/netfs/bvecq.c:288:16: warning: implicit truncation from 'int' to bit-field changes value from 3 to -1 [-Wbitfield-constant-conversion]
     288 |                         p->mem_type = BVECQ_MEM_ALLOCED;
         |                                     ^ ~~~~~~~~~~~~~~~~~
   2 warnings generated.


vim +/int +153 fs/netfs/bvecq.c

   116	
   117	/**
   118	 * bvecq_alloc_buffer - Allocate a bvecq chain and populate with buffers
   119	 * @size: Target size of the buffer (can be 0 for an empty buffer)
   120	 * @pre_slots: Number of preamble slots to set aside
   121	 * @gfp: The allocation constraints.
   122	 *
   123	 * Allocate a chain of bvecq nodes and populate the slots with sufficient pages
   124	 * to provide at least the requested amount of space, leaving the first
   125	 * @pre_slots slots unset.  The pre-slots must all fit into the the first
   126	 * bvecq.
   127	 *
   128	 * The pages allocated may be compound pages larger than PAGE_SIZE and thus
   129	 * occupy fewer slots.  The pages have their refcounts set to 1 and can be
   130	 * passed to MSG_SPLICE_PAGES.
   131	 *
   132	 * Return: The first node pointer or NULL on allocation failure.
   133	 */
   134	struct bvecq *bvecq_alloc_buffer(size_t size, unsigned int pre_slots, gfp_t gfp)
   135	{
   136		struct bvecq *head = NULL, *tail = NULL, *p = NULL;
   137		size_t nr_per_bq = 32 - 3;
   138		size_t count = DIV_ROUND_UP(size, PAGE_SIZE);
   139	
   140		_enter("%zx,%zx,%u", size, count, pre_slots);
   141	
   142		if (WARN_ON_ONCE(pre_slots > nr_per_bq))
   143			return NULL;
   144	
   145		do {
   146			struct page **pages;
   147			int want, got;
   148	
   149			p = bvecq_alloc_one(umin(pre_slots + count, nr_per_bq), gfp);
   150			if (!p)
   151				goto oom;
   152	
 > 153			p->mem_type = BVECQ_MEM_ALLOCED;
   154	
   155			if (tail) {
   156				tail->next = p;
   157				p->prev = tail;
   158			} else {
   159				head = p;
   160			}
   161			tail = p;
   162			if (!count)
   163				break;
   164	
   165			/* Need to clear pre slots and pages[], so just clear all. */
   166			memset(p->bv, 0, p->max_slots * sizeof(p->bv[0]));
   167	
   168			pages = (struct page **)&p->bv[p->max_slots];
   169			pages -= p->max_slots - pre_slots;
   170	
   171			want = umin(count, p->max_slots - pre_slots);
   172			got = alloc_pages_bulk(gfp, want, pages);
   173			if (got < want) {
   174				for (int i = 0; i < got; i++) {
   175					__free_page(pages[i]);
   176					pages[i] = NULL;
   177				}
   178				goto oom;
   179			}
   180	
   181			tail->nr_slots = pre_slots + got;
   182			for (int i = 0; i < got; i++) {
   183				int j = pre_slots + i;
   184	
   185				set_page_count(pages[i], 1);
   186				bvec_set_page(&tail->bv[j], pages[i], PAGE_SIZE, 0);
   187			}
   188	
   189			count -= got;
   190			pre_slots = 0;
   191		} while (count > 0);
   192	
   193		return head;
   194	oom:
   195		bvecq_put(head);
   196		return NULL;
   197	}
   198	EXPORT_SYMBOL(bvecq_alloc_buffer);
   199	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
