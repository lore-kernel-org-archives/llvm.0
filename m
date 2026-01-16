Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FB232D7FB;
	Fri, 16 Jan 2026 01:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768527046; cv=none; b=uEdlKbjHZKvf+Xi43A8KcZBJUqnhY2LcyibmhMdk6fMD6RZzWLyh1uQIXjIP5lqDTOjI40dya1CkbMiKGbX36uXQjkeXAj7m07I6Gy+c3js83BIrbhRU0Vgoczbnp2S9oZfkmkoWkTu2jOkBGcHaBBfEU2r2ZXIeZvsrMuzVevY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768527046; c=relaxed/simple;
	bh=UgLsH6ZaFK8pXrgYt6vs97kEThqFEQtzyuoGkVmRNE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=suqoDziSf/me/Nj1OUbSCMYjqmhshEPnbQhOVqkZ34SecvjWRa9hraP7Bk+WKhbFboRKMmj+NruJ41G151+lwostX9G+mqR7mL5dSqhrYMnOm+vdrPyWqc40w5N5xELh5CkCRogc3YDh2fBXKo4+sNrONed+g0CKMww2138OFoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YHPmz4sr; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YHPmz4sr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768527037; x=1800063037;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UgLsH6ZaFK8pXrgYt6vs97kEThqFEQtzyuoGkVmRNE8=;
  b=YHPmz4srZ5nABmUbhD3M7wEGu1fyls+tIyq7Zm7kV5o0TE0TEZDdB3ch
   gALRdLnINA9TpRb2ZReQP1U6NAUrw74B2a1U7Nco+ypKfLHEJuYiKPRFW
   ALPnJZLaZIL8Gc9ufCqtSjablPfigY6W0vbktSfXCFeXA91ylEDI+mCnY
   wfiabJr7uS7ZO6AeFUZ6m3eLf6DU9mHgf4lQcA635ipR9y/R41WN9J7YK
   1IFuopDohsuvkbmTfQC3sli00OAK9038AiTc+7NkKZemSJ7lDRnd+mhYU
   7+KjWB1T9R8xX7+SMDGRCgBEOAJQuMuO1KfS9lo20riFP0hMruz7I3nyg
   w==;
X-CSE-ConnectionGUID: +AjrHpTmTWeL4H70OdJ5Yw==
X-CSE-MsgGUID: yAVdHlwvRCCLw+oPM2Gvqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="69893591"
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; 
   d="scan'208";a="69893591"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 17:30:34 -0800
X-CSE-ConnectionGUID: UwGt3DyhQWi9BoxDtTCMkQ==
X-CSE-MsgGUID: ra/CJk6KQRGRn2yPb8TWmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; 
   d="scan'208";a="242654490"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 15 Jan 2026 17:30:29 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgYfS-00000000KDs-2rEG;
	Fri, 16 Jan 2026 01:30:26 +0000
Date: Fri, 16 Jan 2026 09:30:13 +0800
From: kernel test robot <lkp@intel.com>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org,
	Suren Baghdasaryan <surenb@google.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Pedro Falcato <pfalcato@suse.de>,
	David Hildenbrand <david@redhat.com>,
	Vlastimil Babka <vbabka@suse.cz>, Michal Hocko <mhocko@suse.com>,
	Jann Horn <jannh@google.com>, shikemeng@huaweicloud.com,
	kasong@tencent.com, nphamcs@gmail.com, bhe@redhat.com,
	baohua@kernel.org, chrisl@kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>
Subject: Re: [PATCH v2 08/10] mm/vma: Use unmap_desc in exit_mmap() and
 vms_clear_ptes()
Message-ID: <202601160919.v3GpIeUh-lkp@intel.com>
References: <20260115182720.1691130-9-Liam.Howlett@oracle.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115182720.1691130-9-Liam.Howlett@oracle.com>

Hi Liam,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master v6.19-rc5 next-20260115]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Liam-R-Howlett/mm-mmap-Move-exit_mmap-trace-point/20260116-023126
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260115182720.1691130-9-Liam.Howlett%40oracle.com
patch subject: [PATCH v2 08/10] mm/vma: Use unmap_desc in exit_mmap() and vms_clear_ptes()
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20260116/202601160919.v3GpIeUh-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601160919.v3GpIeUh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601160919.v3GpIeUh-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/filemap.c:54:
   In file included from mm/internal.h:23:
>> mm/vma.h:176:18: error: use of undeclared identifier 'USER_PGTABLES_CEILING'
     176 |         unmap->pg_end = USER_PGTABLES_CEILING;
         |                         ^~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +/USER_PGTABLES_CEILING +176 mm/vma.h

   169	
   170	static inline void unmap_all_init(struct unmap_desc *unmap,
   171			struct vma_iterator *vmi, struct vm_area_struct *vma)
   172	{
   173		unmap->mas = &vmi->mas;
   174		unmap->first = vma;
   175		unmap->pg_start = FIRST_USER_ADDRESS;
 > 176		unmap->pg_end = USER_PGTABLES_CEILING;
   177		unmap->vma_start = 0;
   178		unmap->vma_end = ULONG_MAX;
   179		unmap->tree_end = ULONG_MAX;
   180		unmap->tree_reset = vma->vm_end;
   181		unmap->mm_wr_locked = false;
   182	}
   183	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
