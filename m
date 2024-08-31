Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB28DF6C;
	Sat, 31 Aug 2024 13:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725110771; cv=none; b=LZxXJkAt65PoxUqcKWRACT4iafpaJJBCX7CXmBBXngduI6B9IQ4T8S30TNsBa60fRhd0sy7cZsP5j3FCXC/kzo9fX/9mEpIaDqVBtN9TRn2LlWefXvtAC29whMirnOFEQaNa2pjzjk41rbHlN9dhbCONnmx3DnOVLVm1NJv+cww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725110771; c=relaxed/simple;
	bh=OC4rmvORSpYmjnKDhnmj+hVjo/qs2jDUPs4D6vQ7lN0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n1chj0JTzAIyTOIVuAUJ+tF04kVIPJdfGTtw9+W0tVjd5JNzyki+A5sStTk7/81WWonp2BZAtWKYY68QU9b6a9O9dye78RNVKoRL6zCwkThyFlgfhGjQ927lO7iDVM7E1vBl3Qqf92pPdYSzFZhso5QNiPXpFJLEgJAnArNWnww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fn8nFynr; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fn8nFynr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725110769; x=1756646769;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OC4rmvORSpYmjnKDhnmj+hVjo/qs2jDUPs4D6vQ7lN0=;
  b=fn8nFynrkMZW+fhsSifqkcGXmqhslwD2G+lKiyo9cjxEEkzPwy0fhdJx
   K0CqEamWse/LOKaWymeK7M5neXOBFy7ulywYw42x6R+7GMFlUJkuLZmOI
   lYI58jTqb5yTWVqdqbrW4VVo1G1Xga7CoPilhqrQ2NcQiJnZoEsGkDUtc
   mnDuKWdtqSlUg9S/xrOJ3ifseOBu0iDb7zyF0OZBXhpKwmloC8ADFtuyJ
   sYMmY314jNSgRkkFivA1gVQSvzqGQ2ZSd0aRMKxVM60VGRBqkmdwDLpoo
   8wXEQawwVBne+ifYV+bpxV1ZGKZ3hGiuyiIiZc3GoOqpo97Y50wO393OY
   w==;
X-CSE-ConnectionGUID: F41+Fo78Q32fNSCzLlnfqw==
X-CSE-MsgGUID: /jg72zyVRHGB3j6i87uSSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11181"; a="35150961"
X-IronPort-AV: E=Sophos;i="6.10,191,1719903600"; 
   d="scan'208";a="35150961"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2024 06:26:08 -0700
X-CSE-ConnectionGUID: /QIR/UK7RJKnlVkCl4k+9g==
X-CSE-MsgGUID: 93e+NOwpTRuBkkkGciamtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,191,1719903600"; 
   d="scan'208";a="94879440"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 31 Aug 2024 06:26:07 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skO7B-0002mg-06;
	Sat, 31 Aug 2024 13:26:05 +0000
Date: Sat, 31 Aug 2024 21:25:54 +0800
From: kernel test robot <lkp@intel.com>
To: Zhang Yi <yi.zhang@huaweicloud.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 08/10] ext4: factor out ext4_do_fallocate()
Message-ID: <202408312146.dOYN7mvc-lkp@intel.com>
References: <20240830073800.2131781-9-yi.zhang@huaweicloud.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830073800.2131781-9-yi.zhang@huaweicloud.com>

Hi Zhang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tytso-ext4/dev]
[also build test WARNING on linus/master v6.11-rc5 next-20240830]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhang-Yi/ext4-write-out-dirty-data-before-dropping-pages/20240830-154319
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
patch link:    https://lore.kernel.org/r/20240830073800.2131781-9-yi.zhang%40huaweicloud.com
patch subject: [PATCH 08/10] ext4: factor out ext4_do_fallocate()
config: i386-buildonly-randconfig-002-20240831 (https://download.01.org/0day-ci/archive/20240831/202408312146.dOYN7mvc-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240831/202408312146.dOYN7mvc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408312146.dOYN7mvc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/ext4/extents.c:4696:6: warning: variable 'len_lblk' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    4696 |         if (ret)
         |             ^~~
   fs/ext4/extents.c:4713:43: note: uninitialized use occurs here
    4713 |         trace_ext4_fallocate_exit(inode, offset, len_lblk, ret);
         |                                                  ^~~~~~~~
   fs/ext4/extents.c:4696:2: note: remove the 'if' if its condition is always false
    4696 |         if (ret)
         |         ^~~~~~~~
    4697 |                 goto out;
         |                 ~~~~~~~~
   fs/ext4/extents.c:4688:7: warning: variable 'len_lblk' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    4688 |                 if (ret)
         |                     ^~~
   fs/ext4/extents.c:4713:43: note: uninitialized use occurs here
    4713 |         trace_ext4_fallocate_exit(inode, offset, len_lblk, ret);
         |                                                  ^~~~~~~~
   fs/ext4/extents.c:4688:3: note: remove the 'if' if its condition is always false
    4688 |                 if (ret)
         |                 ^~~~~~~~
    4689 |                         goto out;
         |                         ~~~~~~~~
   fs/ext4/extents.c:4679:6: warning: variable 'len_lblk' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    4679 |         if (!(ext4_test_inode_flag(inode, EXT4_INODE_EXTENTS))) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/extents.c:4713:43: note: uninitialized use occurs here
    4713 |         trace_ext4_fallocate_exit(inode, offset, len_lblk, ret);
         |                                                  ^~~~~~~~
   fs/ext4/extents.c:4679:2: note: remove the 'if' if its condition is always false
    4679 |         if (!(ext4_test_inode_flag(inode, EXT4_INODE_EXTENTS))) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    4680 |                 ret = -EOPNOTSUPP;
         |                 ~~~~~~~~~~~~~~~~~~
    4681 |                 goto out;
         |                 ~~~~~~~~~
    4682 |         }
         |         ~
   fs/ext4/extents.c:4671:34: note: initialize the variable 'len_lblk' to silence this warning
    4671 |         ext4_lblk_t start_lblk, len_lblk;
         |                                         ^
         |                                          = 0
   3 warnings generated.


vim +4696 fs/ext4/extents.c

  4664	
  4665	static long ext4_do_fallocate(struct file *file, loff_t offset,
  4666				      loff_t len, int mode)
  4667	{
  4668		struct inode *inode = file_inode(file);
  4669		loff_t end = offset + len;
  4670		loff_t new_size = 0;
  4671		ext4_lblk_t start_lblk, len_lblk;
  4672		int ret;
  4673	
  4674		trace_ext4_fallocate_enter(inode, offset, len, mode);
  4675	
  4676		inode_lock(inode);
  4677	
  4678		/* We only support preallocation for extent-based files only. */
  4679		if (!(ext4_test_inode_flag(inode, EXT4_INODE_EXTENTS))) {
  4680			ret = -EOPNOTSUPP;
  4681			goto out;
  4682		}
  4683	
  4684		if (!(mode & FALLOC_FL_KEEP_SIZE) &&
  4685		    (end > inode->i_size || end > EXT4_I(inode)->i_disksize)) {
  4686			new_size = end;
  4687			ret = inode_newsize_ok(inode, new_size);
  4688			if (ret)
  4689				goto out;
  4690		}
  4691	
  4692		/* Wait all existing dio workers, newcomers will block on i_rwsem */
  4693		inode_dio_wait(inode);
  4694	
  4695		ret = file_modified(file);
> 4696		if (ret)
  4697			goto out;
  4698	
  4699		start_lblk = offset >> inode->i_blkbits;
  4700		len_lblk = EXT4_MAX_BLOCKS(len, offset, inode->i_blkbits);
  4701	
  4702		ret = ext4_alloc_file_blocks(file, start_lblk, len_lblk, new_size,
  4703					     EXT4_GET_BLOCKS_CREATE_UNWRIT_EXT);
  4704		if (ret)
  4705			goto out;
  4706	
  4707		if (file->f_flags & O_SYNC && EXT4_SB(inode->i_sb)->s_journal) {
  4708			ret = ext4_fc_commit(EXT4_SB(inode->i_sb)->s_journal,
  4709						EXT4_I(inode)->i_sync_tid);
  4710		}
  4711	out:
  4712		inode_unlock(inode);
  4713		trace_ext4_fallocate_exit(inode, offset, len_lblk, ret);
  4714		return ret;
  4715	}
  4716	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
