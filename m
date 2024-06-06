Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132264F5EC;
	Thu,  6 Jun 2024 21:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717709915; cv=none; b=nUmaos2T1jsk5Jx//pYAKO5PNZrp04X7kxD+B9qvyXfA04x1vYb6XLDlkKUyO7giY6UJPptDsM2HZgPus56frr3maA3F0xNuGfu2UQX3UrEG5WkLfubcCMRtO28ZI79KNRYB0yfJT9eEpviWGUdf3QXATTCpnG5Rjd0LOVek3/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717709915; c=relaxed/simple;
	bh=nKo+UG0qtNVzaWWoCwPBeJIaaplalLKpY2oKqPOfUvc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pL2GkYLFfklZJPPIQ9giLTHyQ6KhsoSn+pYQXttEgn0WU7Uxfp51teLdbhuvUSVBoZ+jVpKZPPIsrov64luEP12m7gvryCZyjCq6nZUvF0HFjlFPMfliikSyG+OnXBSV+GBwp6fJZbgV/SnaV9cm5MTuyJZgtxBQRLhThM/TZXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WwE6oaSy; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WwE6oaSy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717709913; x=1749245913;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nKo+UG0qtNVzaWWoCwPBeJIaaplalLKpY2oKqPOfUvc=;
  b=WwE6oaSypD0AYOpp1GTYTuPLxLf9LRUEBv78P73CUR7x1L/f61ypKw2V
   QKBErRnWIxkUgi6K90886oXLU/5kE+WYd41oN/12k6XljCgIunt7nwBQA
   /9GYgDkSlw5cBzVd7trm5yLaryMzeHNNw8pYz60/Hj8yChbYtlma3HIXr
   ofgDcdJaeKUN4t536QFe3HL6qSlVAKJfzmENAPABiEZ2oXumC9qhYPWPP
   nG4o8jmFrkheNon00SMJrnslG23A7HT8ceUrGaagGMfMie7QdJ1nJFihZ
   FI+Xpw5uzkANWqHrLLluyvvY5GVXSw1BhlXebsLYR1z9v1AlzOHGn8qGO
   g==;
X-CSE-ConnectionGUID: 4fFUimUQReqDzc9rj4y69w==
X-CSE-MsgGUID: K9w+93AnSH+eiLxyoyvpag==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="24988485"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="24988485"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 14:38:31 -0700
X-CSE-ConnectionGUID: 8ovg/fA4QkK1LnHTLnm30Q==
X-CSE-MsgGUID: NUjevbDJTY2FHVznqXM4Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="38055795"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 06 Jun 2024 14:38:30 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFKoV-0003ka-1Z;
	Thu, 06 Jun 2024 21:38:27 +0000
Date: Fri, 7 Jun 2024 05:37:32 +0800
From: kernel test robot <lkp@intel.com>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>
Subject: [trace:ring-buffer/for-next 1/1] kernel/trace/ring_buffer.c:6279:11:
 warning: unsequenced modification and access to 'p'
Message-ID: <202406070523.lVekXLDq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace ring-buffer/for-next
head:   ff74f987504fe90e88fdba8d80197202868ce342
commit: ff74f987504fe90e88fdba8d80197202868ce342 [1/1] ring-buffer: Align meta-page to sub-buffers for improved TLB usage
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240607/202406070523.lVekXLDq-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240607/202406070523.lVekXLDq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406070523.lVekXLDq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/trace/ring_buffer.c:8:
   In file included from include/linux/trace_events.h:6:
   In file included from include/linux/ring_buffer.h:5:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> kernel/trace/ring_buffer.c:6279:11: warning: unsequenced modification and access to 'p' [-Wunsequenced]
    6279 |                         pages[p++] = ZERO_PAGE(vma->vm_start + (PAGE_SIZE * p));
         |                                ^                                            ~
   6 warnings generated.


vim +/p +6279 kernel/trace/ring_buffer.c

  6213	
  6214	/*
  6215	 *   +--------------+  pgoff == 0
  6216	 *   |   meta page  |
  6217	 *   +--------------+  pgoff == 1
  6218	 *   | subbuffer 0  |
  6219	 *   |              |
  6220	 *   +--------------+  pgoff == (1 + (1 << subbuf_order))
  6221	 *   | subbuffer 1  |
  6222	 *   |              |
  6223	 *         ...
  6224	 */
  6225	#ifdef CONFIG_MMU
  6226	static int __rb_map_vma(struct ring_buffer_per_cpu *cpu_buffer,
  6227				struct vm_area_struct *vma)
  6228	{
  6229		unsigned long nr_subbufs, nr_pages, vma_pages, pgoff = vma->vm_pgoff;
  6230		unsigned int subbuf_pages, subbuf_order;
  6231		struct page **pages;
  6232		int p = 0, s = 0;
  6233		int err;
  6234	
  6235		/* Refuse MP_PRIVATE or writable mappings */
  6236		if (vma->vm_flags & VM_WRITE || vma->vm_flags & VM_EXEC ||
  6237		    !(vma->vm_flags & VM_MAYSHARE))
  6238			return -EPERM;
  6239	
  6240		subbuf_order = cpu_buffer->buffer->subbuf_order;
  6241		subbuf_pages = 1 << subbuf_order;
  6242	
  6243		if (subbuf_order && pgoff % subbuf_pages)
  6244			return -EINVAL;
  6245	
  6246		/*
  6247		 * Make sure the mapping cannot become writable later. Also tell the VM
  6248		 * to not touch these pages (VM_DONTCOPY | VM_DONTEXPAND).
  6249		 */
  6250		vm_flags_mod(vma, VM_DONTCOPY | VM_DONTEXPAND | VM_DONTDUMP,
  6251			     VM_MAYWRITE);
  6252	
  6253		lockdep_assert_held(&cpu_buffer->mapping_lock);
  6254	
  6255		nr_subbufs = cpu_buffer->nr_pages + 1; /* + reader-subbuf */
  6256		nr_pages = ((nr_subbufs + 1) << subbuf_order) - pgoff; /* + meta-page */
  6257	
  6258		vma_pages = (vma->vm_end - vma->vm_start) >> PAGE_SHIFT;
  6259		if (!vma_pages || vma_pages > nr_pages)
  6260			return -EINVAL;
  6261	
  6262		nr_pages = vma_pages;
  6263	
  6264		pages = kcalloc(nr_pages, sizeof(*pages), GFP_KERNEL);
  6265		if (!pages)
  6266			return -ENOMEM;
  6267	
  6268		if (!pgoff) {
  6269			unsigned long meta_page_padding;
  6270	
  6271			pages[p++] = virt_to_page(cpu_buffer->meta_page);
  6272	
  6273			/*
  6274			 * Pad with the zero-page to align the meta-page with the
  6275			 * sub-buffers.
  6276			 */
  6277			meta_page_padding = subbuf_pages - 1;
  6278			while (meta_page_padding-- && p < nr_pages)
> 6279				pages[p++] = ZERO_PAGE(vma->vm_start + (PAGE_SIZE * p));
  6280		} else {
  6281			/* Skip the meta-page */
  6282			pgoff -= subbuf_pages;
  6283	
  6284			s += pgoff / subbuf_pages;
  6285		}
  6286	
  6287		while (p < nr_pages) {
  6288			struct page *page = virt_to_page((void *)cpu_buffer->subbuf_ids[s]);
  6289			int off = 0;
  6290	
  6291			if (WARN_ON_ONCE(s >= nr_subbufs)) {
  6292				err = -EINVAL;
  6293				goto out;
  6294			}
  6295	
  6296			for (; off < (1 << (subbuf_order)); off++, page++) {
  6297				if (p >= nr_pages)
  6298					break;
  6299	
  6300				pages[p++] = page;
  6301			}
  6302			s++;
  6303		}
  6304	
  6305		err = vm_insert_pages(vma, vma->vm_start, pages, &nr_pages);
  6306	
  6307	out:
  6308		kfree(pages);
  6309	
  6310		return err;
  6311	}
  6312	#else
  6313	static int __rb_map_vma(struct ring_buffer_per_cpu *cpu_buffer,
  6314				struct vm_area_struct *vma)
  6315	{
  6316		return -EOPNOTSUPP;
  6317	}
  6318	#endif
  6319	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
