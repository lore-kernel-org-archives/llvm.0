Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E892522B6;
	Fri, 28 Nov 2025 01:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764294594; cv=none; b=QK+oU420lks3BGy6P+byQUinemwzE2i5cq1dUlChrY/+/MAz6/i/h140htScObSsq5kCM+KNNvL2qJ3YOeJm4eqMGCvGicUUQECFIiKSG9IeOOlu/w8PbQFB0/Ir5Qfd0P44Og3JNRvTS/V3GTbLz32t8Y4A2gNIE2xKXdT6zQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764294594; c=relaxed/simple;
	bh=FptZF3h/cDUsKwn+A9U5fwifWphXmv0RNUXkDtC+2ls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iF1mvNFQJ+jASqStJEK4dwSNtLAgxY95hGE6nbbCyPpxCYe06zukEHJ9h37Ne29f3p9UiqcahJ4m+8bYo1to3SdX0ULRc0pmByzOYlDgzK6eKmXE/26IMtT+q51AGREEdTNQ9IMeUPkRFW9IKj1lOC7mmeTSDOrVxgwfDeNuoWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CQ/VpPx/; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CQ/VpPx/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764294592; x=1795830592;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FptZF3h/cDUsKwn+A9U5fwifWphXmv0RNUXkDtC+2ls=;
  b=CQ/VpPx/drQbCZDF/NcpXHXabOOAMu/g/iM5UtpMBhZ2D2iLdSW/s/tE
   HDSykq+s3y77uwSykMFOXXGzb9nkxtZEo3eYr9KzB4JN7t3quZCs9MmQ0
   bJz0Rp8U98d10+ohxnwZlOW3c3w3Zb7YN0mv2ugG6+yJpXM0PRbf248qp
   IBOFtWcarhKXnnPLOK+coBpuzhZUbLNX7gY/TUPR85y/IpL+Rf/yJommy
   vMJqHOI/F1FMfQx81xGKX+zXt8F57ocWCzM8msUAUSbqDLzqHtzBTWIwN
   kuARPHIBBzwWeKmn0XoSZkn5X9u0CNc2daAIgX7f1J5BMnbrLAx0LeIKq
   Q==;
X-CSE-ConnectionGUID: hNdVMBfPTvSLcMKnuiTVJQ==
X-CSE-MsgGUID: 2rA+H+oHRfK2u5Wu5iZNtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="70193061"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="70193061"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 17:49:51 -0800
X-CSE-ConnectionGUID: agImw1F6QE2Zil+IHsYxvg==
X-CSE-MsgGUID: p3lRvPusQ2Wn6x3O8dOzBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="192604399"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 27 Nov 2025 17:49:49 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOncI-000000001u5-1oJv;
	Fri, 28 Nov 2025 01:49:46 +0000
Date: Fri, 28 Nov 2025 02:48:58 +0100
From: kernel test robot <lkp@intel.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 3/5] mm: introduce VM_FAULT_UFFD_MINOR fault reason
Message-ID: <202511280257.T9fSJoDF-lkp@intel.com>
References: <20251125183840.2368510-4-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125183840.2368510-4-rppt@kernel.org>

Hi Mike,

kernel test robot noticed the following build errors:

[auto build test ERROR on 6a23ae0a96a600d1d12557add110e0bb6e32730c]

url:    https://github.com/intel-lab-lkp/linux/commits/Mike-Rapoport/userfaultfd-move-vma_can_userfault-out-of-line/20251126-024059
base:   6a23ae0a96a600d1d12557add110e0bb6e32730c
patch link:    https://lore.kernel.org/r/20251125183840.2368510-4-rppt%40kernel.org
patch subject: [PATCH v2 3/5] mm: introduce VM_FAULT_UFFD_MINOR fault reason
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20251128/202511280257.T9fSJoDF-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251128/202511280257.T9fSJoDF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511280257.T9fSJoDF-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/dax.c:30:
   In file included from include/trace/events/fs_dax.h:208:
   In file included from include/trace/define_trace.h:132:
   In file included from include/trace/trace_events.h:256:
>> include/trace/events/fs_dax.h:50:3: error: expected expression
      50 |                 __print_flags(__entry->result, "|", VM_FAULT_RESULT_TRACE)
         |                 ^
   include/trace/stages/stage3_trace_output.h:70:16: note: expanded from macro '__print_flags'
      70 |                         { flag_array, { -1, NULL }};                    \
         |                                     ^
   In file included from fs/dax.c:30:
   In file included from include/trace/events/fs_dax.h:208:
   In file included from include/trace/define_trace.h:132:
   In file included from include/trace/trace_events.h:256:
   include/trace/events/fs_dax.h:134:3: error: expected expression
     134 |                 __print_flags(__entry->result, "|", VM_FAULT_RESULT_TRACE)
         |                 ^
   include/trace/stages/stage3_trace_output.h:70:16: note: expanded from macro '__print_flags'
      70 |                         { flag_array, { -1, NULL }};                    \
         |                                     ^
   2 errors generated.
--
   In file included from fs/f2fs/super.c:41:
   In file included from include/trace/events/f2fs.h:2407:
   In file included from include/trace/define_trace.h:132:
   In file included from include/trace/trace_events.h:256:
>> include/trace/events/f2fs.h:1436:3: error: expected expression
    1436 |                 __print_flags(__entry->ret, "|", VM_FAULT_RESULT_TRACE))
         |                 ^
   include/trace/stages/stage3_trace_output.h:70:16: note: expanded from macro '__print_flags'
      70 |                         { flag_array, { -1, NULL }};                    \
         |                                     ^
   1 error generated.


vim +50 include/trace/events/fs_dax.h

282a8e0391c377 Ross Zwisler            2017-02-22    9  
282a8e0391c377 Ross Zwisler            2017-02-22   10  DECLARE_EVENT_CLASS(dax_pmd_fault_class,
f42003917b4569 Dave Jiang              2017-02-22   11  	TP_PROTO(struct inode *inode, struct vm_fault *vmf,
f42003917b4569 Dave Jiang              2017-02-22   12  		pgoff_t max_pgoff, int result),
f42003917b4569 Dave Jiang              2017-02-22   13  	TP_ARGS(inode, vmf, max_pgoff, result),
282a8e0391c377 Ross Zwisler            2017-02-22   14  	TP_STRUCT__entry(
282a8e0391c377 Ross Zwisler            2017-02-22   15  		__field(unsigned long, ino)
282a8e0391c377 Ross Zwisler            2017-02-22   16  		__field(unsigned long, vm_start)
282a8e0391c377 Ross Zwisler            2017-02-22   17  		__field(unsigned long, vm_end)
bfbe71109fa40e Lorenzo Stoakes         2025-06-18   18  		__field(vm_flags_t, vm_flags)
282a8e0391c377 Ross Zwisler            2017-02-22   19  		__field(unsigned long, address)
282a8e0391c377 Ross Zwisler            2017-02-22   20  		__field(pgoff_t, pgoff)
282a8e0391c377 Ross Zwisler            2017-02-22   21  		__field(pgoff_t, max_pgoff)
282a8e0391c377 Ross Zwisler            2017-02-22   22  		__field(dev_t, dev)
282a8e0391c377 Ross Zwisler            2017-02-22   23  		__field(unsigned int, flags)
282a8e0391c377 Ross Zwisler            2017-02-22   24  		__field(int, result)
282a8e0391c377 Ross Zwisler            2017-02-22   25  	),
282a8e0391c377 Ross Zwisler            2017-02-22   26  	TP_fast_assign(
282a8e0391c377 Ross Zwisler            2017-02-22   27  		__entry->dev = inode->i_sb->s_dev;
282a8e0391c377 Ross Zwisler            2017-02-22   28  		__entry->ino = inode->i_ino;
f42003917b4569 Dave Jiang              2017-02-22   29  		__entry->vm_start = vmf->vma->vm_start;
f42003917b4569 Dave Jiang              2017-02-22   30  		__entry->vm_end = vmf->vma->vm_end;
f42003917b4569 Dave Jiang              2017-02-22   31  		__entry->vm_flags = vmf->vma->vm_flags;
d8a849e1bc1237 Dave Jiang              2017-02-22   32  		__entry->address = vmf->address;
d8a849e1bc1237 Dave Jiang              2017-02-22   33  		__entry->flags = vmf->flags;
d8a849e1bc1237 Dave Jiang              2017-02-22   34  		__entry->pgoff = vmf->pgoff;
282a8e0391c377 Ross Zwisler            2017-02-22   35  		__entry->max_pgoff = max_pgoff;
282a8e0391c377 Ross Zwisler            2017-02-22   36  		__entry->result = result;
282a8e0391c377 Ross Zwisler            2017-02-22   37  	),
282a8e0391c377 Ross Zwisler            2017-02-22   38  	TP_printk("dev %d:%d ino %#lx %s %s address %#lx vm_start "
282a8e0391c377 Ross Zwisler            2017-02-22   39  			"%#lx vm_end %#lx pgoff %#lx max_pgoff %#lx %s",
282a8e0391c377 Ross Zwisler            2017-02-22   40  		MAJOR(__entry->dev),
282a8e0391c377 Ross Zwisler            2017-02-22   41  		MINOR(__entry->dev),
282a8e0391c377 Ross Zwisler            2017-02-22   42  		__entry->ino,
282a8e0391c377 Ross Zwisler            2017-02-22   43  		__entry->vm_flags & VM_SHARED ? "shared" : "private",
282a8e0391c377 Ross Zwisler            2017-02-22   44  		__print_flags(__entry->flags, "|", FAULT_FLAG_TRACE),
282a8e0391c377 Ross Zwisler            2017-02-22   45  		__entry->address,
282a8e0391c377 Ross Zwisler            2017-02-22   46  		__entry->vm_start,
282a8e0391c377 Ross Zwisler            2017-02-22   47  		__entry->vm_end,
282a8e0391c377 Ross Zwisler            2017-02-22   48  		__entry->pgoff,
282a8e0391c377 Ross Zwisler            2017-02-22   49  		__entry->max_pgoff,
282a8e0391c377 Ross Zwisler            2017-02-22  @50  		__print_flags(__entry->result, "|", VM_FAULT_RESULT_TRACE)
282a8e0391c377 Ross Zwisler            2017-02-22   51  	)
282a8e0391c377 Ross Zwisler            2017-02-22   52  )
282a8e0391c377 Ross Zwisler            2017-02-22   53  
282a8e0391c377 Ross Zwisler            2017-02-22   54  #define DEFINE_PMD_FAULT_EVENT(name) \
282a8e0391c377 Ross Zwisler            2017-02-22   55  DEFINE_EVENT(dax_pmd_fault_class, name, \
f42003917b4569 Dave Jiang              2017-02-22   56  	TP_PROTO(struct inode *inode, struct vm_fault *vmf, \
282a8e0391c377 Ross Zwisler            2017-02-22   57  		pgoff_t max_pgoff, int result), \
f42003917b4569 Dave Jiang              2017-02-22   58  	TP_ARGS(inode, vmf, max_pgoff, result))
282a8e0391c377 Ross Zwisler            2017-02-22   59  
282a8e0391c377 Ross Zwisler            2017-02-22   60  DEFINE_PMD_FAULT_EVENT(dax_pmd_fault);
282a8e0391c377 Ross Zwisler            2017-02-22   61  DEFINE_PMD_FAULT_EVENT(dax_pmd_fault_done);
282a8e0391c377 Ross Zwisler            2017-02-22   62  
653b2ea3396fda Ross Zwisler            2017-02-22   63  DECLARE_EVENT_CLASS(dax_pmd_load_hole_class,
f42003917b4569 Dave Jiang              2017-02-22   64  	TP_PROTO(struct inode *inode, struct vm_fault *vmf,
c93012d849c9e3 Matthew Wilcox (Oracle  2024-03-26   65) 		struct folio *zero_folio,
653b2ea3396fda Ross Zwisler            2017-02-22   66  		void *radix_entry),
c93012d849c9e3 Matthew Wilcox (Oracle  2024-03-26   67) 	TP_ARGS(inode, vmf, zero_folio, radix_entry),
653b2ea3396fda Ross Zwisler            2017-02-22   68  	TP_STRUCT__entry(
653b2ea3396fda Ross Zwisler            2017-02-22   69  		__field(unsigned long, ino)
bfbe71109fa40e Lorenzo Stoakes         2025-06-18   70  		__field(vm_flags_t, vm_flags)
653b2ea3396fda Ross Zwisler            2017-02-22   71  		__field(unsigned long, address)
c93012d849c9e3 Matthew Wilcox (Oracle  2024-03-26   72) 		__field(struct folio *, zero_folio)
653b2ea3396fda Ross Zwisler            2017-02-22   73  		__field(void *, radix_entry)
653b2ea3396fda Ross Zwisler            2017-02-22   74  		__field(dev_t, dev)
653b2ea3396fda Ross Zwisler            2017-02-22   75  	),
653b2ea3396fda Ross Zwisler            2017-02-22   76  	TP_fast_assign(
653b2ea3396fda Ross Zwisler            2017-02-22   77  		__entry->dev = inode->i_sb->s_dev;
653b2ea3396fda Ross Zwisler            2017-02-22   78  		__entry->ino = inode->i_ino;
f42003917b4569 Dave Jiang              2017-02-22   79  		__entry->vm_flags = vmf->vma->vm_flags;
f42003917b4569 Dave Jiang              2017-02-22   80  		__entry->address = vmf->address;
c93012d849c9e3 Matthew Wilcox (Oracle  2024-03-26   81) 		__entry->zero_folio = zero_folio;
653b2ea3396fda Ross Zwisler            2017-02-22   82  		__entry->radix_entry = radix_entry;
653b2ea3396fda Ross Zwisler            2017-02-22   83  	),
c93012d849c9e3 Matthew Wilcox (Oracle  2024-03-26   84) 	TP_printk("dev %d:%d ino %#lx %s address %#lx zero_folio %p "
653b2ea3396fda Ross Zwisler            2017-02-22   85  			"radix_entry %#lx",
653b2ea3396fda Ross Zwisler            2017-02-22   86  		MAJOR(__entry->dev),
653b2ea3396fda Ross Zwisler            2017-02-22   87  		MINOR(__entry->dev),
653b2ea3396fda Ross Zwisler            2017-02-22   88  		__entry->ino,
653b2ea3396fda Ross Zwisler            2017-02-22   89  		__entry->vm_flags & VM_SHARED ? "shared" : "private",
653b2ea3396fda Ross Zwisler            2017-02-22   90  		__entry->address,
c93012d849c9e3 Matthew Wilcox (Oracle  2024-03-26   91) 		__entry->zero_folio,
653b2ea3396fda Ross Zwisler            2017-02-22   92  		(unsigned long)__entry->radix_entry
653b2ea3396fda Ross Zwisler            2017-02-22   93  	)
653b2ea3396fda Ross Zwisler            2017-02-22   94  )
653b2ea3396fda Ross Zwisler            2017-02-22   95  
653b2ea3396fda Ross Zwisler            2017-02-22   96  #define DEFINE_PMD_LOAD_HOLE_EVENT(name) \
653b2ea3396fda Ross Zwisler            2017-02-22   97  DEFINE_EVENT(dax_pmd_load_hole_class, name, \
f42003917b4569 Dave Jiang              2017-02-22   98  	TP_PROTO(struct inode *inode, struct vm_fault *vmf, \
c93012d849c9e3 Matthew Wilcox (Oracle  2024-03-26   99) 		struct folio *zero_folio, void *radix_entry), \
c93012d849c9e3 Matthew Wilcox (Oracle  2024-03-26  100) 	TP_ARGS(inode, vmf, zero_folio, radix_entry))
653b2ea3396fda Ross Zwisler            2017-02-22  101  
653b2ea3396fda Ross Zwisler            2017-02-22  102  DEFINE_PMD_LOAD_HOLE_EVENT(dax_pmd_load_hole);
653b2ea3396fda Ross Zwisler            2017-02-22  103  DEFINE_PMD_LOAD_HOLE_EVENT(dax_pmd_load_hole_fallback);
282a8e0391c377 Ross Zwisler            2017-02-22  104  
a9c42b33ed8096 Ross Zwisler            2017-05-08  105  DECLARE_EVENT_CLASS(dax_pte_fault_class,
a9c42b33ed8096 Ross Zwisler            2017-05-08  106  	TP_PROTO(struct inode *inode, struct vm_fault *vmf, int result),
a9c42b33ed8096 Ross Zwisler            2017-05-08  107  	TP_ARGS(inode, vmf, result),
a9c42b33ed8096 Ross Zwisler            2017-05-08  108  	TP_STRUCT__entry(
a9c42b33ed8096 Ross Zwisler            2017-05-08  109  		__field(unsigned long, ino)
bfbe71109fa40e Lorenzo Stoakes         2025-06-18  110  		__field(vm_flags_t, vm_flags)
a9c42b33ed8096 Ross Zwisler            2017-05-08  111  		__field(unsigned long, address)
a9c42b33ed8096 Ross Zwisler            2017-05-08  112  		__field(pgoff_t, pgoff)
a9c42b33ed8096 Ross Zwisler            2017-05-08  113  		__field(dev_t, dev)
a9c42b33ed8096 Ross Zwisler            2017-05-08  114  		__field(unsigned int, flags)
a9c42b33ed8096 Ross Zwisler            2017-05-08  115  		__field(int, result)
a9c42b33ed8096 Ross Zwisler            2017-05-08  116  	),
a9c42b33ed8096 Ross Zwisler            2017-05-08  117  	TP_fast_assign(
a9c42b33ed8096 Ross Zwisler            2017-05-08  118  		__entry->dev = inode->i_sb->s_dev;
a9c42b33ed8096 Ross Zwisler            2017-05-08  119  		__entry->ino = inode->i_ino;
a9c42b33ed8096 Ross Zwisler            2017-05-08  120  		__entry->vm_flags = vmf->vma->vm_flags;
a9c42b33ed8096 Ross Zwisler            2017-05-08  121  		__entry->address = vmf->address;
a9c42b33ed8096 Ross Zwisler            2017-05-08  122  		__entry->flags = vmf->flags;
a9c42b33ed8096 Ross Zwisler            2017-05-08  123  		__entry->pgoff = vmf->pgoff;
a9c42b33ed8096 Ross Zwisler            2017-05-08  124  		__entry->result = result;
a9c42b33ed8096 Ross Zwisler            2017-05-08  125  	),
a9c42b33ed8096 Ross Zwisler            2017-05-08  126  	TP_printk("dev %d:%d ino %#lx %s %s address %#lx pgoff %#lx %s",
a9c42b33ed8096 Ross Zwisler            2017-05-08  127  		MAJOR(__entry->dev),
a9c42b33ed8096 Ross Zwisler            2017-05-08  128  		MINOR(__entry->dev),
a9c42b33ed8096 Ross Zwisler            2017-05-08  129  		__entry->ino,
a9c42b33ed8096 Ross Zwisler            2017-05-08  130  		__entry->vm_flags & VM_SHARED ? "shared" : "private",
a9c42b33ed8096 Ross Zwisler            2017-05-08  131  		__print_flags(__entry->flags, "|", FAULT_FLAG_TRACE),
a9c42b33ed8096 Ross Zwisler            2017-05-08  132  		__entry->address,
a9c42b33ed8096 Ross Zwisler            2017-05-08  133  		__entry->pgoff,
a9c42b33ed8096 Ross Zwisler            2017-05-08  134  		__print_flags(__entry->result, "|", VM_FAULT_RESULT_TRACE)
a9c42b33ed8096 Ross Zwisler            2017-05-08  135  	)
a9c42b33ed8096 Ross Zwisler            2017-05-08  136  )
a9c42b33ed8096 Ross Zwisler            2017-05-08  137  
a9c42b33ed8096 Ross Zwisler            2017-05-08  138  #define DEFINE_PTE_FAULT_EVENT(name) \
a9c42b33ed8096 Ross Zwisler            2017-05-08  139  DEFINE_EVENT(dax_pte_fault_class, name, \
a9c42b33ed8096 Ross Zwisler            2017-05-08  140  	TP_PROTO(struct inode *inode, struct vm_fault *vmf, int result), \
a9c42b33ed8096 Ross Zwisler            2017-05-08  141  	TP_ARGS(inode, vmf, result))
a9c42b33ed8096 Ross Zwisler            2017-05-08  142  
a9c42b33ed8096 Ross Zwisler            2017-05-08  143  DEFINE_PTE_FAULT_EVENT(dax_pte_fault);
a9c42b33ed8096 Ross Zwisler            2017-05-08  144  DEFINE_PTE_FAULT_EVENT(dax_pte_fault_done);
678c9fd0430a14 Ross Zwisler            2017-05-08  145  DEFINE_PTE_FAULT_EVENT(dax_load_hole);
71eab6dfd91eab Jan Kara                2017-11-01  146  DEFINE_PTE_FAULT_EVENT(dax_insert_pfn_mkwrite_no_entry);
71eab6dfd91eab Jan Kara                2017-11-01  147  DEFINE_PTE_FAULT_EVENT(dax_insert_pfn_mkwrite);
a9c42b33ed8096 Ross Zwisler            2017-05-08  148  
d14a3f48a152b7 Ross Zwisler            2017-05-08  149  DECLARE_EVENT_CLASS(dax_writeback_range_class,
d14a3f48a152b7 Ross Zwisler            2017-05-08  150  	TP_PROTO(struct inode *inode, pgoff_t start_index, pgoff_t end_index),
d14a3f48a152b7 Ross Zwisler            2017-05-08  151  	TP_ARGS(inode, start_index, end_index),
d14a3f48a152b7 Ross Zwisler            2017-05-08  152  	TP_STRUCT__entry(
d14a3f48a152b7 Ross Zwisler            2017-05-08  153  		__field(unsigned long, ino)
d14a3f48a152b7 Ross Zwisler            2017-05-08  154  		__field(pgoff_t, start_index)
d14a3f48a152b7 Ross Zwisler            2017-05-08  155  		__field(pgoff_t, end_index)
d14a3f48a152b7 Ross Zwisler            2017-05-08  156  		__field(dev_t, dev)
d14a3f48a152b7 Ross Zwisler            2017-05-08  157  	),
d14a3f48a152b7 Ross Zwisler            2017-05-08  158  	TP_fast_assign(
d14a3f48a152b7 Ross Zwisler            2017-05-08  159  		__entry->dev = inode->i_sb->s_dev;
d14a3f48a152b7 Ross Zwisler            2017-05-08  160  		__entry->ino = inode->i_ino;
d14a3f48a152b7 Ross Zwisler            2017-05-08  161  		__entry->start_index = start_index;
d14a3f48a152b7 Ross Zwisler            2017-05-08  162  		__entry->end_index = end_index;
d14a3f48a152b7 Ross Zwisler            2017-05-08  163  	),
d14a3f48a152b7 Ross Zwisler            2017-05-08  164  	TP_printk("dev %d:%d ino %#lx pgoff %#lx-%#lx",
d14a3f48a152b7 Ross Zwisler            2017-05-08  165  		MAJOR(__entry->dev),
d14a3f48a152b7 Ross Zwisler            2017-05-08  166  		MINOR(__entry->dev),
d14a3f48a152b7 Ross Zwisler            2017-05-08  167  		__entry->ino,
d14a3f48a152b7 Ross Zwisler            2017-05-08  168  		__entry->start_index,
d14a3f48a152b7 Ross Zwisler            2017-05-08  169  		__entry->end_index
d14a3f48a152b7 Ross Zwisler            2017-05-08  170  	)
d14a3f48a152b7 Ross Zwisler            2017-05-08  171  )
d14a3f48a152b7 Ross Zwisler            2017-05-08  172  
d14a3f48a152b7 Ross Zwisler            2017-05-08  173  #define DEFINE_WRITEBACK_RANGE_EVENT(name) \
d14a3f48a152b7 Ross Zwisler            2017-05-08  174  DEFINE_EVENT(dax_writeback_range_class, name, \
d14a3f48a152b7 Ross Zwisler            2017-05-08  175  	TP_PROTO(struct inode *inode, pgoff_t start_index, pgoff_t end_index),\
d14a3f48a152b7 Ross Zwisler            2017-05-08  176  	TP_ARGS(inode, start_index, end_index))
d14a3f48a152b7 Ross Zwisler            2017-05-08  177  
d14a3f48a152b7 Ross Zwisler            2017-05-08  178  DEFINE_WRITEBACK_RANGE_EVENT(dax_writeback_range);
d14a3f48a152b7 Ross Zwisler            2017-05-08  179  DEFINE_WRITEBACK_RANGE_EVENT(dax_writeback_range_done);
d14a3f48a152b7 Ross Zwisler            2017-05-08  180  
f9bc3a07539bc8 Ross Zwisler            2017-05-08  181  TRACE_EVENT(dax_writeback_one,
f9bc3a07539bc8 Ross Zwisler            2017-05-08  182  	TP_PROTO(struct inode *inode, pgoff_t pgoff, pgoff_t pglen),
f9bc3a07539bc8 Ross Zwisler            2017-05-08  183  	TP_ARGS(inode, pgoff, pglen),
f9bc3a07539bc8 Ross Zwisler            2017-05-08  184  	TP_STRUCT__entry(
f9bc3a07539bc8 Ross Zwisler            2017-05-08  185  		__field(unsigned long, ino)
f9bc3a07539bc8 Ross Zwisler            2017-05-08  186  		__field(pgoff_t, pgoff)
f9bc3a07539bc8 Ross Zwisler            2017-05-08  187  		__field(pgoff_t, pglen)
f9bc3a07539bc8 Ross Zwisler            2017-05-08  188  		__field(dev_t, dev)
f9bc3a07539bc8 Ross Zwisler            2017-05-08  189  	),
f9bc3a07539bc8 Ross Zwisler            2017-05-08  190  	TP_fast_assign(
f9bc3a07539bc8 Ross Zwisler            2017-05-08  191  		__entry->dev = inode->i_sb->s_dev;
f9bc3a07539bc8 Ross Zwisler            2017-05-08  192  		__entry->ino = inode->i_ino;
f9bc3a07539bc8 Ross Zwisler            2017-05-08  193  		__entry->pgoff = pgoff;
f9bc3a07539bc8 Ross Zwisler            2017-05-08  194  		__entry->pglen = pglen;
f9bc3a07539bc8 Ross Zwisler            2017-05-08  195  	),
f9bc3a07539bc8 Ross Zwisler            2017-05-08  196  	TP_printk("dev %d:%d ino %#lx pgoff %#lx pglen %#lx",
f9bc3a07539bc8 Ross Zwisler            2017-05-08  197  		MAJOR(__entry->dev),
f9bc3a07539bc8 Ross Zwisler            2017-05-08  198  		MINOR(__entry->dev),
f9bc3a07539bc8 Ross Zwisler            2017-05-08  199  		__entry->ino,
f9bc3a07539bc8 Ross Zwisler            2017-05-08  200  		__entry->pgoff,
f9bc3a07539bc8 Ross Zwisler            2017-05-08  201  		__entry->pglen
f9bc3a07539bc8 Ross Zwisler            2017-05-08  202  	)
f9bc3a07539bc8 Ross Zwisler            2017-05-08  203  )
f9bc3a07539bc8 Ross Zwisler            2017-05-08  204  
282a8e0391c377 Ross Zwisler            2017-02-22  205  #endif /* _TRACE_FS_DAX_H */
282a8e0391c377 Ross Zwisler            2017-02-22  206  
282a8e0391c377 Ross Zwisler            2017-02-22  207  /* This part must be outside protection */
282a8e0391c377 Ross Zwisler            2017-02-22 @208  #include <trace/define_trace.h>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
