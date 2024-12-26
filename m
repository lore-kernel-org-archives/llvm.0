Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCA11EEF9;
	Thu, 26 Dec 2024 19:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735242076; cv=none; b=qV8MLlsRt1b3An+ja6U6sS//9WFM5u17Cv5A42EIEA9y8pMSI34PL3AX6+5f24Gy9fEkGEf3HLc/y7MsO/U7d9vmW4JDPnJvHKJdHF0oH12Hjq0665/0So6GZZEMj0wRiQBjmK8cWZBlx4pgLsIeaCCiBwNbmDOpWXB9tAZX6SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735242076; c=relaxed/simple;
	bh=w7x+cGlJQo4OAG4QOiEDUq48jcC4SxlFq1wVNWsTook=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Is/ZGJjT7VkVVc/YQvWpaJxioK+z6wIRyS1Bk14sfEntSzlvg4u9jGl3lDub7c8JUXBR8v+ocf4W8dMKM8qwv+RsK5dlhJy3aDSrLQUdxsHgGLk5r/HrYLJeqcbMuVUnsUB2LW0t8M7ABT0631ue3szKsbEC5GD9SRvb1+izVtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mekHBVEq; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mekHBVEq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735242074; x=1766778074;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=w7x+cGlJQo4OAG4QOiEDUq48jcC4SxlFq1wVNWsTook=;
  b=mekHBVEqkafFct2PEInUKq4bijmsL+4imHsx51OpUKREnFykzlxfZSM8
   BSq/vRVzOqCR4PgmseCtMbpD77d3ijslYbsH7ofXnOlBBDYATwlBnolGz
   QfO6VRcnRg+V3K7DVAD1D9pWfgDPNgGqbVPUMiNlBIAjAV8ddmMD+LGFC
   nyKn8QCYGU/652dIkY0sf6ZIoJzMvkqiN0ISFYKsWRaLAXGN6H7t2LCUN
   Yhq5+PDsJ10qBehrD/1QH88zSgWQVrvzrSmh/9xV5Bj46HZc3xBaVMpch
   q2szOUn1UftouSfZ6bKJgYO2FF/99e5BBpVEQAp3HSBBz6xoxVvK4BxjF
   Q==;
X-CSE-ConnectionGUID: cCSJN0S2TT6ahjslwStw3g==
X-CSE-MsgGUID: RB3TC7scRmWLU4OLXQf4zg==
X-IronPort-AV: E=McAfee;i="6700,10204,11297"; a="35800626"
X-IronPort-AV: E=Sophos;i="6.12,267,1728975600"; 
   d="scan'208";a="35800626"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2024 11:41:14 -0800
X-CSE-ConnectionGUID: r7DXRsMeRIaW/Akv1zS0qA==
X-CSE-MsgGUID: D969vo7cRTiQmlNGSWdByw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,267,1728975600"; 
   d="scan'208";a="104847705"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 26 Dec 2024 11:41:07 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQtjE-0002l0-2t;
	Thu, 26 Dec 2024 19:41:04 +0000
Date: Fri, 27 Dec 2024 03:40:49 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	peterz@infradead.org, willy@infradead.org, liam.howlett@oracle.com,
	lorenzo.stoakes@oracle.com, mhocko@suse.com, vbabka@suse.cz,
	hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com,
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com,
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org,
	brauner@kernel.org, dhowells@redhat.com, hdanton@sina.com,
	hughd@google.com, lokeshgidra@google.com, minchan@google.com,
	jannh@google.com, shakeel.butt@linux.dev, souravpanda@google.com,
	pasha.tatashin@soleen.com, klarasmodin@gmail.com, corbet@lwn.net,
	linux-doc@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v7 13/17] mm/debug: print vm_refcnt state when dumping
 the vma
Message-ID: <202412270328.HiJX1mRt-lkp@intel.com>
References: <20241226170710.1159679-14-surenb@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241226170710.1159679-14-surenb@google.com>

Hi Suren,

kernel test robot noticed the following build errors:

[auto build test ERROR on 431614f1580a03c1a653340c55ea76bd12a9403f]

url:    https://github.com/intel-lab-lkp/linux/commits/Suren-Baghdasaryan/mm-introduce-vma_start_read_locked-_nested-helpers/20241227-010925
base:   431614f1580a03c1a653340c55ea76bd12a9403f
patch link:    https://lore.kernel.org/r/20241226170710.1159679-14-surenb%40google.com
patch subject: [PATCH v7 13/17] mm/debug: print vm_refcnt state when dumping the vma
config: hexagon-randconfig-002-20241227 (https://download.01.org/0day-ci/archive/20241227/202412270328.HiJX1mRt-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241227/202412270328.HiJX1mRt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412270328.HiJX1mRt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/debug.c:189:54: error: no member named 'vm_refcnt' in 'struct vm_area_struct'
     189 |                 vma->vm_flags, &vma->vm_flags, refcount_read(&vma->vm_refcnt));
         |                                                               ~~~  ^
   include/linux/printk.h:514:35: note: expanded from macro 'pr_emerg'
     514 |         printk(KERN_EMERG pr_fmt(fmt), ##__VA_ARGS__)
         |                                          ^~~~~~~~~~~
   include/linux/printk.h:501:60: note: expanded from macro 'printk'
     501 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                            ^~~~~~~~~~~
   include/linux/printk.h:473:19: note: expanded from macro 'printk_index_wrap'
     473 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   1 error generated.


vim +189 mm/debug.c

   178	
   179	void dump_vma(const struct vm_area_struct *vma)
   180	{
   181		pr_emerg("vma %px start %px end %px mm %px\n"
   182			"prot %lx anon_vma %px vm_ops %px\n"
   183			"pgoff %lx file %px private_data %px\n"
   184			"flags: %#lx(%pGv) refcnt %x\n",
   185			vma, (void *)vma->vm_start, (void *)vma->vm_end, vma->vm_mm,
   186			(unsigned long)pgprot_val(vma->vm_page_prot),
   187			vma->anon_vma, vma->vm_ops, vma->vm_pgoff,
   188			vma->vm_file, vma->vm_private_data,
 > 189			vma->vm_flags, &vma->vm_flags, refcount_read(&vma->vm_refcnt));
   190	}
   191	EXPORT_SYMBOL(dump_vma);
   192	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
