Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08FF5146019;
	Mon,  8 Apr 2024 19:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712606286; cv=none; b=Za7Cnbqo8c60y21FpEBEl0mfkT3ZJYdxJGmnapzBfEXCPAQrKkKNbgU45CrXAiPg9/JCVtpbYvHrMsz1b2zkJFT0ZhEfCHBi9/6gY7PBzR7VjIhpnWE8f6n2vobeR04MyLmRdOYRbFEd/xqs9DuvGnfPszgLWSWqDlyKgsovL/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712606286; c=relaxed/simple;
	bh=JnTckfwWaqMinmPxg1aoKVjtg+utyLyB/AYY52zEp0c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p/FN1HGquxsBf7SnxZ8jKCGRH+6Mpyx1VT50R3uKkKWaviHFlWdxuSrvJG7pTBkUejX0S7MEvVo+7KPjrY+CRkMAT260DjgEt6Fie1O+2vsKAxyit1NWD5TiTeq1yPqQNN6VMLWjxsfdECWDeAN2EpEJAZ6+R+AeHXOrvqejDtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CjgwQDR6; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CjgwQDR6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712606285; x=1744142285;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JnTckfwWaqMinmPxg1aoKVjtg+utyLyB/AYY52zEp0c=;
  b=CjgwQDR6guQKX6RhzdFm5RZg+sCThh/7wdFlS99PRwkqm6Dz3eNnbtQ8
   q87w36JLXMsq3T+RjTSVA3M3B/ojxbYyANHwlBo45Nn1bKDtNmy4LW6ep
   a4IOQLHNAE5XIiG5PeHUGe/2ZFhV9eu4EQURSRPWsZziLAH4FoTfwXq7c
   dnGMGSKB6zofd/rAiq+DwXpyQT3TrLghdJ6pZGs5LBpHy99laef0Bfth3
   3WoHhS4sUCDA/jduOl4//gycZhBrv4CuN5I2I+yIu1B7+SV0Ubz5xApje
   3GLXgh8yKQAXnsU+CGCT14IuhfcTraY2Gl43l+348Se4rPJ+aLr5JRbBN
   w==;
X-CSE-ConnectionGUID: wvX4zOewS02PTjAlIzgODg==
X-CSE-MsgGUID: df0rY9W8QoekffixPkd5Tg==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="11700307"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="11700307"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 12:58:04 -0700
X-CSE-ConnectionGUID: 7S0j0hg4RY2Ah+fHjILtdg==
X-CSE-MsgGUID: FPRQmvhAQDauyZfX/8ZDqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="24472514"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 08 Apr 2024 12:58:03 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rtv7v-0005SQ-2Z;
	Mon, 08 Apr 2024 19:57:59 +0000
Date: Tue, 9 Apr 2024 03:57:08 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 7/153] mm/util.c:244:35: error: passing 'const
 struct iov_iter *' to parameter of type 'struct iov_iter *' discards
 qualifiers
Message-ID: <202404090321.N6kPiG6y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   b32f790cdb298ce85171870c8bf5557dc35a51a5
commit: 3e9d81869cd2122f3a282bd2c507b11a1b41e7de [7/153] mm/util: add iterdup_nul() and iterdup() helpers
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20240409/202404090321.N6kPiG6y-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8b3b4a92adee40483c27f26c478a384cd69c6f05)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240409/202404090321.N6kPiG6y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404090321.N6kPiG6y-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/util.c:2:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> mm/util.c:244:35: error: passing 'const struct iov_iter *' to parameter of type 'struct iov_iter *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     244 |         if (!copy_from_iter_full(p, len, src)) {
         |                                          ^~~
   include/linux/uio.h:219:69: note: passing argument to parameter 'i' here
     219 | bool copy_from_iter_full(void *addr, size_t bytes, struct iov_iter *i)
         |                                                                     ^
>> mm/util.c:362:35: error: use of undeclared identifier 'from'
     362 |         if (!copy_from_iter_full(p, len, from)) {
         |                                          ^
   1 warning and 2 errors generated.


vim +244 mm/util.c

   226	
   227	/**
   228	 * iterdup_user - duplicate memory region
   229	 *
   230	 * @src: source iov_iter
   231	 * @len: number of bytes to copy
   232	 *
   233	 * Return: an ERR_PTR() on failure.  Result is physically
   234	 * contiguous, to be freed by kfree().
   235	 */
   236	void *iterdup(const struct iov_iter *src, size_t len)
   237	{
   238		void *p;
   239	
   240		p = kmalloc_track_caller(len, GFP_USER | __GFP_NOWARN);
   241		if (!p)
   242			return ERR_PTR(-ENOMEM);
   243	
 > 244		if (!copy_from_iter_full(p, len, src)) {
   245			kfree(p);
   246			return ERR_PTR(-EFAULT);
   247		}
   248	
   249		return p;
   250	}
   251	EXPORT_SYMBOL(iterdup);
   252	
   253	/**
   254	 * vmemdup_user - duplicate memory region from user space
   255	 *
   256	 * @src: source address in user space
   257	 * @len: number of bytes to copy
   258	 *
   259	 * Return: an ERR_PTR() on failure.  Result may be not
   260	 * physically contiguous.  Use kvfree() to free.
   261	 */
   262	void *vmemdup_user(const void __user *src, size_t len)
   263	{
   264		void *p;
   265	
   266		p = kvmalloc(len, GFP_USER);
   267		if (!p)
   268			return ERR_PTR(-ENOMEM);
   269	
   270		if (copy_from_user(p, src, len)) {
   271			kvfree(p);
   272			return ERR_PTR(-EFAULT);
   273		}
   274	
   275		return p;
   276	}
   277	EXPORT_SYMBOL(vmemdup_user);
   278	
   279	/**
   280	 * strndup_user - duplicate an existing string from user space
   281	 * @s: The string to duplicate
   282	 * @n: Maximum number of bytes to copy, including the trailing NUL.
   283	 *
   284	 * Return: newly allocated copy of @s or an ERR_PTR() in case of error
   285	 */
   286	char *strndup_user(const char __user *s, long n)
   287	{
   288		char *p;
   289		long length;
   290	
   291		length = strnlen_user(s, n);
   292	
   293		if (!length)
   294			return ERR_PTR(-EFAULT);
   295	
   296		if (length > n)
   297			return ERR_PTR(-EINVAL);
   298	
   299		p = memdup_user(s, length);
   300	
   301		if (IS_ERR(p))
   302			return p;
   303	
   304		p[length - 1] = '\0';
   305	
   306		return p;
   307	}
   308	EXPORT_SYMBOL(strndup_user);
   309	
   310	/**
   311	 * memdup_user_nul - duplicate memory region from user space and NUL-terminate
   312	 *
   313	 * @src: source address in user space
   314	 * @len: number of bytes to copy
   315	 *
   316	 * Return: an ERR_PTR() on failure.
   317	 */
   318	void *memdup_user_nul(const void __user *src, size_t len)
   319	{
   320		char *p;
   321	
   322		/*
   323		 * Always use GFP_KERNEL, since copy_from_user() can sleep and
   324		 * cause pagefault, which makes it pointless to use GFP_NOFS
   325		 * or GFP_ATOMIC.
   326		 */
   327		p = kmalloc_track_caller(len + 1, GFP_KERNEL);
   328		if (!p)
   329			return ERR_PTR(-ENOMEM);
   330	
   331		if (copy_from_user(p, src, len)) {
   332			kfree(p);
   333			return ERR_PTR(-EFAULT);
   334		}
   335		p[len] = '\0';
   336	
   337		return p;
   338	}
   339	EXPORT_SYMBOL(memdup_user_nul);
   340	
   341	/**
   342	 * iterdup_nul - duplicate memory region from iov_iter and NUL-terminate
   343	 *
   344	 * @src: source address to copy from
   345	 * @len: number of bytes to copy
   346	 *
   347	 * Return: an ERR_PTR() on failure.
   348	 */
   349	void *iterdup_nul(const struct iov_iter *src, size_t len)
   350	{
   351		char *p;
   352	
   353		/*
   354		 * Always use GFP_KERNEL, since copy_from_iter_full() can sleep and
   355		 * cause pagefault, which makes it pointless to use GFP_NOFS
   356		 * or GFP_ATOMIC.
   357		 */
   358		p = kmalloc_track_caller(len + 1, GFP_KERNEL);
   359		if (!p)
   360			return ERR_PTR(-ENOMEM);
   361	
 > 362		if (!copy_from_iter_full(p, len, from)) {
   363			kfree(p);
   364			return ERR_PTR(-EFAULT);
   365		}
   366		p[len] = '\0';
   367	
   368		return p;
   369	}
   370	EXPORT_SYMBOL(iterdup_nul);
   371	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
