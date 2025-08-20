Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2818427D77B;
	Wed, 20 Aug 2025 19:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755716602; cv=none; b=OR/jZtXoXnpBKuMbb4nns3yYTu1aS6EvQlTf8QNix0ccNHklEOIV1X73T0qlsVJuAsJlhyzyf1lZWjTnquLB5AwCdq6Nd4K6EkuIkkkERUpcQoaNFiCIvdJlIV958Kub4WKxNSvwYGASkKAVKzRog/Oki8GCiED6cVLwqKz/k7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755716602; c=relaxed/simple;
	bh=5GfvpmvDEwt7/WHZ41ArcJBD9qOfspQN8odDWzwdDho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G44w5HFJ0X6BW8yTkVsYu37UszOtKKrms2bnPfLYkcAbVAKsd8Y5BEOPKnHUshsiO4z7dvbyD6CoYt76AnBuuHZKChYRM59SSo9W1gkKkPta6fjdeTI+rvpA5sgThq4nOGBUD9xZj1yKtpEzhqZ9elyTgcfSVVpLdOVzr3mx3DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q8FGzNCM; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q8FGzNCM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755716600; x=1787252600;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5GfvpmvDEwt7/WHZ41ArcJBD9qOfspQN8odDWzwdDho=;
  b=Q8FGzNCMNRohoPX9LmjtRR98F7ugAJ+fw7MEorLNmGAD3vedbZTxhT43
   4XIbdF8aw65ewf+O014sbvZnkPHzSrWeyIqa6IHXc1L3TaHK7BpCxwveh
   aw34AsEORxp+nuPhigu/ITXOX0xeZIl/de/F5C8rvLKxnFPvF+4E5Xllp
   waviboo+sUr2ZE3PyBY7kfpyF3FkYexJa1VhBL/z1mWIC+cDiyYa0I4AB
   gCCE/gnEXOaxtbJkVYMhAJlIYg0eRXkYmM1Pj0ORojeAK6X8WWaW6iA7X
   oMkSOY0oGcPrJW2MEApHcM2YH1q8Xwh/OfoDjWG5vE3HMfxd6w9i1PQsR
   w==;
X-CSE-ConnectionGUID: tJ28vlTiTmKlt12O6WlZGw==
X-CSE-MsgGUID: Qhht7fU3R5SP4ZvaaSkolg==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="58064888"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="58064888"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 12:03:19 -0700
X-CSE-ConnectionGUID: XsAQ5YMoRIiHW1uiss991A==
X-CSE-MsgGUID: 474uIyjeSk+QHWasyB2kSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="199075421"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 20 Aug 2025 12:03:12 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uoo5R-000Jbr-1r;
	Wed, 20 Aug 2025 19:03:07 +0000
Date: Thu, 21 Aug 2025 03:02:57 +0800
From: kernel test robot <lkp@intel.com>
To: Anthony Yznaga <anthony.yznaga@oracle.com>, linux-mm@kvack.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	akpm@linux-foundation.org, andreyknvl@gmail.com, arnd@arndb.de,
	bp@alien8.de, brauner@kernel.org, bsegall@google.com,
	corbet@lwn.net, dave.hansen@linux.intel.com, david@redhat.com,
	dietmar.eggemann@arm.com, ebiederm@xmission.com, hpa@zytor.com,
	jakub.wartak@mailbox.org, jannh@google.com, juri.lelli@redhat.com,
	khalid@kernel.org, liam.howlett@oracle.com,
	linyongting@bytedance.com, lorenzo.stoakes@oracle.com,
	luto@kernel.org, markhemm@googlemail.com, maz@kernel.org,
	mhiramat@kernel.org, mgorman@suse.de, mhocko@suse.com,
	mingo@redhat.com, muchun.song@linux.dev, neilb@suse.de,
	osalvador@suse.de
Subject: Re: [PATCH v3 07/22] mm/mshare: Add mmap support
Message-ID: <202508210230.0Zc3YDIy-lkp@intel.com>
References: <20250820010415.699353-8-anthony.yznaga@oracle.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820010415.699353-8-anthony.yznaga@oracle.com>

Hi Anthony,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on tip/sched/core trace/for-next tip/x86/core tip/x86/mm kees/for-next/execve linus/master v6.17-rc2 next-20250820]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Anthony-Yznaga/mm-Add-msharefs-filesystem/20250820-091021
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250820010415.699353-8-anthony.yznaga%40oracle.com
patch subject: [PATCH v3 07/22] mm/mshare: Add mmap support
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250821/202508210230.0Zc3YDIy-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250821/202508210230.0Zc3YDIy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508210230.0Zc3YDIy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/mshare.c:121:16: warning: variable 'mshare_start' set but not used [-Wunused-but-set-variable]
     121 |         unsigned long mshare_start, mshare_size;
         |                       ^
   1 warning generated.


vim +/mshare_start +121 mm/mshare.c

   113	
   114	static unsigned long
   115	msharefs_get_unmapped_area(struct file *file, unsigned long addr,
   116			unsigned long len, unsigned long pgoff, unsigned long flags)
   117	{
   118		struct mshare_data *m_data = file->private_data;
   119		struct mm_struct *mm = current->mm;
   120		struct vm_area_struct *vma, *prev;
 > 121		unsigned long mshare_start, mshare_size;
   122		const unsigned long mmap_end = arch_get_mmap_end(addr, len, flags);
   123	
   124		mmap_assert_write_locked(mm);
   125	
   126		if ((flags & MAP_TYPE) == MAP_PRIVATE)
   127			return -EINVAL;
   128	
   129		if (!mshare_is_initialized(m_data))
   130			return -EINVAL;
   131	
   132		mshare_start = m_data->start;
   133		mshare_size = m_data->size;
   134	
   135		if (len != mshare_size)
   136			return -EINVAL;
   137	
   138		if (len > mmap_end - mmap_min_addr)
   139			return -ENOMEM;
   140	
   141		if (flags & MAP_FIXED) {
   142			if (!IS_ALIGNED(addr, mshare_align))
   143				return -EINVAL;
   144			return addr;
   145		}
   146	
   147		if (addr) {
   148			addr = ALIGN(addr, mshare_align);
   149			vma = find_vma_prev(mm, addr, &prev);
   150			if (mmap_end - len >= addr && addr >= mmap_min_addr &&
   151			    (!vma || addr + len <= vm_start_gap(vma)) &&
   152			    (!prev || addr >= vm_end_gap(prev)))
   153				return addr;
   154		}
   155	
   156		if (!mm_flags_test(MMF_TOPDOWN, mm))
   157			return msharefs_get_unmapped_area_bottomup(file, addr, len,
   158					pgoff, flags);
   159		else
   160			return msharefs_get_unmapped_area_topdown(file, addr, len,
   161					pgoff, flags);
   162	}
   163	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
