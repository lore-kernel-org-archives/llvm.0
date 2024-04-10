Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EABAC10F1;
	Wed, 10 Apr 2024 01:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712713457; cv=none; b=u3+SbtIxTW6qyXzEf1Fg42GJd/rm4JW4lZIPH21yS5rT0Fwo/BOwLJT5DwSSbF7OhIZtzRWj3zONSYXDp+QXWb1ecKTZlbniBU9bDzYCIYPB0IFOD48OIoiDLIDyM2zR1HE+bn1lHWwZ69WtXCKxG/CEJBIy0jUWZfXL5phHPis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712713457; c=relaxed/simple;
	bh=4+um5+em30SvCtzSwFQvCD2JVrLayHboJhHw4vcSzu8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m4Tbhc0KXvicjaAz3XYXfyMnH3nC8wTOWbMnpN2pcBepK8LA+d7jksntcnCXfCzWuVLGZjKFCxpJFGYiBO7g/ZnVKP6d7gs6ONJFlvBNRveU4b4Wg6atnbks1cLFGrHjvEp3Z6eZ9rBrERkJ2qvklMWXpIWlK2VXh+ndwPAtKh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UEwLkgBR; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UEwLkgBR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712713455; x=1744249455;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4+um5+em30SvCtzSwFQvCD2JVrLayHboJhHw4vcSzu8=;
  b=UEwLkgBRvpH3qBMjSxm5d/G52r6Mv7P0oGgXjJyEl4qsFb0DPRJTpVqc
   W81oVz9TCMYStyJVHzV1lAMThO3UdFEchwpfKI9b/CtoR9jxYKoKBiyX2
   jUvJcwafbuI+hrqCrqUWCynbeMGhLE1eFokCqLHo6MjGCkcvwsy6t11Jo
   /V7AQTxnYh1Fa4g3joNFsa5rCcrI8PagOw9zrc5wiKOi3W48A5XU/Agrc
   jm5jROEjMfYZkzZ+1P6oay4TdKNDJwDepEayl+Wm/ijZ2Ll4DpXND7Gvs
   D4pDlX4shmr4ZnW1vkHCG/ltK69pgoRreivicvM6vUQfMGkXyp+eFOueD
   g==;
X-CSE-ConnectionGUID: olXfJf84SuaHaSGd8vZaGQ==
X-CSE-MsgGUID: 92OREQslQvaLTZ2tEpL6tQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="11023128"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="11023128"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 18:44:14 -0700
X-CSE-ConnectionGUID: E7IGvE+AQcqhHZKpVJlDVQ==
X-CSE-MsgGUID: w1EebIoDQ4eEki0ZyThmlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="57846683"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 09 Apr 2024 18:44:13 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruN0U-0006h4-1N;
	Wed, 10 Apr 2024 01:44:10 +0000
Date: Wed, 10 Apr 2024 09:43:58 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 258/317] arch/s390/kernel/debug.c:458:9: error:
 redefinition of 'count'
Message-ID: <202404100923.tKl4NFHj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   ce74875ea91d3421b08ce15d34f1eccd90cebb2b
commit: 47f5beabd7c09536f0510ef3f440d09af5a08a50 [258/317] arch/s390: convert to read/write iterators
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20240410/202404100923.tKl4NFHj-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8b3b4a92adee40483c27f26c478a384cd69c6f05)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240410/202404100923.tKl4NFHj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404100923.tKl4NFHj-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/s390/kernel/debug.c:458:9: error: redefinition of 'count'
     458 |         size_t count = iov_iter_count(to);
         |                ^
   arch/s390/kernel/debug.c:455:9: note: previous definition is here
     455 |         size_t count = 0;
         |                ^
>> arch/s390/kernel/debug.c:461:7: error: use of undeclared identifier 'offset'
     461 |         if (*offset != p_info->offset)
         |              ^
>> arch/s390/kernel/debug.c:466:17: error: use of undeclared identifier 'len'
     466 |         while (count < len) {
         |                        ^
   arch/s390/kernel/debug.c:474:22: error: use of undeclared identifier 'len'
     474 |                 user_buf_residue = len-count;
         |                                    ^
>> arch/s390/kernel/debug.c:519:23: error: incompatible function pointer types passing 'ssize_t (struct file *, const char *, size_t, loff_t *)' (aka 'long (struct file *, const char *, unsigned long, long long *)') to parameter of type 'ssize_t (*)(struct file *, char *, size_t, loff_t *)' (aka 'long (*)(struct file *, char *, unsigned long, long long *)') [-Wincompatible-function-pointer-types]
     519 | FOPS_READ_ITER_HELPER(debug_input);
         |                       ^~~~~~~~~~~
   include/linux/fs.h:2155:33: note: expanded from macro 'FOPS_READ_ITER_HELPER'
    2155 |         return vfs_read_iter(iocb, to, name);                           \
         |                                        ^~~~
   include/linux/fs.h:2129:19: note: passing argument to parameter 'read' here
    2129 |                       ssize_t (*read)(struct file *, char __user *,
         |                                 ^
   5 errors generated.


vim +/count +458 arch/s390/kernel/debug.c

   447	
   448	/*
   449	 * debug_output:
   450	 * - called for user read()
   451	 * - copies formated debug entries to the user buffer
   452	 */
   453	static ssize_t debug_output(struct kiocb *iocb, struct iov_iter *to)
   454	{
   455		size_t count = 0;
   456		size_t entry_offset;
   457		file_private_info_t *p_info;
 > 458		size_t count = iov_iter_count(to);
   459	
   460		p_info = (file_private_info_t *) iocb->ki_filp->private_data;
 > 461		if (*offset != p_info->offset)
   462			return -EPIPE;
   463		if (p_info->act_area >= p_info->debug_info_snap->nr_areas)
   464			return 0;
   465		entry_offset = p_info->act_entry_offset;
 > 466		while (count < len) {
   467			int formatted_line_residue;
   468			int formatted_line_size;
   469			int user_buf_residue;
   470			size_t copy_size;
   471	
   472			formatted_line_size = debug_format_entry(p_info);
   473			formatted_line_residue = formatted_line_size - entry_offset;
   474			user_buf_residue = len-count;
   475			copy_size = min(user_buf_residue, formatted_line_residue);
   476			if (copy_size) {
   477				if (!copy_to_iter_full(p_info->temp_buf
   478						 + entry_offset, copy_size, to))
   479					return -EFAULT;
   480				count += copy_size;
   481				entry_offset += copy_size;
   482			}
   483			if (copy_size == formatted_line_residue) {
   484				entry_offset = 0;
   485				if (debug_next_entry(p_info))
   486					goto out;
   487			}
   488		}
   489	out:
   490		p_info->offset		 = iocb->ki_pos + count;
   491		p_info->act_entry_offset = entry_offset;
   492		iocb->ki_pos = p_info->offset;
   493		return count;
   494	}
   495	
   496	/*
   497	 * debug_input:
   498	 * - called for user write()
   499	 * - calls input function of view
   500	 */
   501	static ssize_t debug_input(struct file *file, const char __user *user_buf,
   502				   size_t length, loff_t *offset)
   503	{
   504		file_private_info_t *p_info;
   505		int rc = 0;
   506	
   507		mutex_lock(&debug_mutex);
   508		p_info = ((file_private_info_t *) file->private_data);
   509		if (p_info->view->input_proc) {
   510			rc = p_info->view->input_proc(p_info->debug_info_org,
   511						      p_info->view, file, user_buf,
   512						      length, offset);
   513		} else {
   514			rc = -EPERM;
   515		}
   516		mutex_unlock(&debug_mutex);
   517		return rc; /* number of input characters */
   518	}
 > 519	FOPS_READ_ITER_HELPER(debug_input);
   520	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
