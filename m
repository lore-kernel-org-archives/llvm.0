Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5257428C01E;
	Wed, 20 Aug 2025 20:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755722268; cv=none; b=pS0xsIvK6MVZ5sgrWRHu+iaFApRv8jz13lN19xte8yjmKI0vAE9G/L3ZEJjR3mHzl6uER4s7Xiw2tpmnnyss9b+LPm1KLVbOInR4VeRZszh3NvvqON9hHOoKLxDeTW4qIRojdsWiuB4U/TWFIbRDv0jOKPzFJH/BZj64RI90rTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755722268; c=relaxed/simple;
	bh=8QcGfN5TdHUtbZS2m0Ej+NCFDQ9y4qlsX6+iyfch6dY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uw/oxoj3pRg5YClWTVxU7J42AqkRGo6C27kL9E/IwWC6MIZWkzP606DE+NbfdYIvBvqECR++GtEORA51qdD3BxTnh35rJlO7itZ1cFltjAoeq0yB1Q+HTbAD0o8zJMBTFE08xh65hDI5I3tdA8y1zNdy804bx+T4gbn2T0YBDbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VPA/9K8i; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VPA/9K8i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755722268; x=1787258268;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8QcGfN5TdHUtbZS2m0Ej+NCFDQ9y4qlsX6+iyfch6dY=;
  b=VPA/9K8i17NETtTiLZwDo1P9OOnTcuJDxt2goA9Cfqiz1QUJI0cftZb5
   lXR1lFENVWPPi7piPEdQzkbI+z7LzQlUzg8dfRE9PY+gDumK2TqKjich5
   A5xgnf+rlzDtT50sSjSPg1Z/EP7QtoVff9ty0L6LLUiAXrPRstPsrLHMu
   4u3LMbQlrtDr+7oLwMTXUb5ADZnnjUuLnZaPqKgqSKEvsPhNVAe8RkfGv
   SrlJjv7FBrH32yac4JnF8FCNdx5Tst5hevcAIQxCV1QkFG+2GP1WpWkfB
   uogiu1y9j/TlBx7gWEJoFlqrP/YpAJ/F6SN9/lx2nJnh4aZVSYg8Ozi5W
   A==;
X-CSE-ConnectionGUID: nNfLU1G5SFWVxJAaQJdbsw==
X-CSE-MsgGUID: IqscCeXmQnyDab1XMRHKYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="75450452"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="75450452"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 13:37:46 -0700
X-CSE-ConnectionGUID: Qx5SML5/Rcq4Dz+k+Q3cHA==
X-CSE-MsgGUID: WmwMD/4fTSGku8VThrHu1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="173481976"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 20 Aug 2025 13:37:39 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uopYu-000JfX-35;
	Wed, 20 Aug 2025 20:37:36 +0000
Date: Thu, 21 Aug 2025 04:36:46 +0800
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
Subject: Re: [PATCH v3 18/22] mm/mshare: Add an ioctl for mapping objects in
 an mshare region
Message-ID: <202508210437.BXbf4eok-lkp@intel.com>
References: <20250820010415.699353-19-anthony.yznaga@oracle.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820010415.699353-19-anthony.yznaga@oracle.com>

Hi Anthony,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on next-20250820]
[cannot apply to tip/sched/core trace/for-next tip/x86/core tip/x86/mm kees/for-next/execve linus/master v6.17-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Anthony-Yznaga/mm-Add-msharefs-filesystem/20250820-091021
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250820010415.699353-19-anthony.yznaga%40oracle.com
patch subject: [PATCH v3 18/22] mm/mshare: Add an ioctl for mapping objects in an mshare region
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250821/202508210437.BXbf4eok-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250821/202508210437.BXbf4eok-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508210437.BXbf4eok-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/mshare.c:305:16: warning: variable 'mshare_start' set but not used [-Wunused-but-set-variable]
     305 |         unsigned long mshare_start, mshare_size;
         |                       ^
>> mm/mshare.c:386:57: warning: variable 'vm_flags' is uninitialized when used here [-Wuninitialized]
     386 |         mapped_addr = __do_mmap(NULL, addr, size, prot, flags, vm_flags,
         |                                                                ^~~~~~~~
   mm/mshare.c:361:21: note: initialize the variable 'vm_flags' to silence this warning
     361 |         vm_flags_t vm_flags;
         |                            ^
         |                             = 0
   2 warnings generated.


vim +/vm_flags +386 mm/mshare.c

   297	
   298	static unsigned long
   299	msharefs_get_unmapped_area(struct file *file, unsigned long addr,
   300			unsigned long len, unsigned long pgoff, unsigned long flags)
   301	{
   302		struct mshare_data *m_data = file->private_data;
   303		struct mm_struct *mm = current->mm;
   304		struct vm_area_struct *vma, *prev;
 > 305		unsigned long mshare_start, mshare_size;
   306		const unsigned long mmap_end = arch_get_mmap_end(addr, len, flags);
   307	
   308		mmap_assert_write_locked(mm);
   309	
   310		if ((flags & MAP_TYPE) == MAP_PRIVATE)
   311			return -EINVAL;
   312	
   313		if (!mshare_is_initialized(m_data) || !mshare_has_owner(m_data))
   314			return -EINVAL;
   315	
   316		mshare_start = m_data->start;
   317		mshare_size = m_data->size;
   318	
   319		if (len != mshare_size)
   320			return -EINVAL;
   321	
   322		if (len > mmap_end - mmap_min_addr)
   323			return -ENOMEM;
   324	
   325		if (flags & MAP_FIXED) {
   326			if (!IS_ALIGNED(addr, mshare_align))
   327				return -EINVAL;
   328			return addr;
   329		}
   330	
   331		if (addr) {
   332			addr = ALIGN(addr, mshare_align);
   333			vma = find_vma_prev(mm, addr, &prev);
   334			if (mmap_end - len >= addr && addr >= mmap_min_addr &&
   335			    (!vma || addr + len <= vm_start_gap(vma)) &&
   336			    (!prev || addr >= vm_end_gap(prev)))
   337				return addr;
   338		}
   339	
   340		if (!mm_flags_test(MMF_TOPDOWN, mm))
   341			return msharefs_get_unmapped_area_bottomup(file, addr, len,
   342					pgoff, flags);
   343		else
   344			return msharefs_get_unmapped_area_topdown(file, addr, len,
   345					pgoff, flags);
   346	}
   347	
   348	static long
   349	msharefs_create_mapping(struct mshare_data *m_data, struct mshare_create *mcreate)
   350	{
   351		struct mm_struct *host_mm = m_data->mm;
   352		unsigned long mshare_start, mshare_end;
   353		unsigned long region_offset = mcreate->region_offset;
   354		unsigned long size = mcreate->size;
   355		unsigned int fd = mcreate->fd;
   356		int flags = mcreate->flags;
   357		int prot = mcreate->prot;
   358		unsigned long populate = 0;
   359		unsigned long mapped_addr;
   360		unsigned long addr;
   361		vm_flags_t vm_flags;
   362		int error = -EINVAL;
   363	
   364		mshare_start = m_data->start;
   365		mshare_end = mshare_start + m_data->size;
   366		addr = mshare_start + region_offset;
   367	
   368		if ((addr < mshare_start) || (addr >= mshare_end) ||
   369		    (addr + size > mshare_end))
   370			goto out;
   371	
   372		/*
   373		 * Only anonymous shared memory at fixed addresses is allowed for now.
   374		 */
   375		if ((flags & (MAP_SHARED | MAP_FIXED)) != (MAP_SHARED | MAP_FIXED))
   376			goto out;
   377		if (fd != -1)
   378			goto out;
   379	
   380		if (mmap_write_lock_killable(host_mm)) {
   381			error = -EINTR;
   382			goto out;
   383		}
   384	
   385		error = 0;
 > 386		mapped_addr = __do_mmap(NULL, addr, size, prot, flags, vm_flags,
   387					0, &populate, NULL, host_mm);
   388	
   389		if (IS_ERR_VALUE(mapped_addr))
   390			error = (long)mapped_addr;
   391	
   392		mmap_write_unlock(host_mm);
   393	out:
   394		return error;
   395	}
   396	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
