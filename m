Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E149F61FDD;
	Fri, 28 Jun 2024 18:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719601030; cv=none; b=aA6U8aXYUa9yKY9g/aDZpTLJMaaAaefyNFksJ/gtxaM0jZW0cmXI0B4q/L6Kf326TQXZVTS+i2S84SrGZ6pEhSkK5Jcezy3f/VLRLK6rZxl25B79IaLAKz9Ij0NjdX9MEbVm3d0TiPeIFlEmidFYkJPIZz1SOeMz8cmXwqPrMJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719601030; c=relaxed/simple;
	bh=nBHL9Mhy2PUkr/VGgez2e5viO4TExv4p/2gPVPJvjgI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=shAFuRX1qVM/sG9tfGyMHQ3YurAqlPU7gTbrgF2vBU4Qk11RG43iLnh4b/fxbp7LdnoRwwx44dy01/V/0XTZlSQmZeSp/0LZOo7hdAaQfLbWgxghjq4M5bg5RbzExEczYNuFlDmZeXL3dwzfAJq31y2Aap90i31brC9awqkxudQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ja8ThAI3; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ja8ThAI3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719601029; x=1751137029;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nBHL9Mhy2PUkr/VGgez2e5viO4TExv4p/2gPVPJvjgI=;
  b=ja8ThAI3I1Ob80LOD5NyMA55GhBjH2nLunRmsrs/tgxWwEXkJIURkuWN
   IYPfLBeq3R+xF6q6ko+Bc+ZHzg8R96srUuWFP5t9/VcEwAuqDgzSpNknY
   vI+53OFEYdcfnlkyX5LqwVdbFkpKlwxskdCFmAynT7nx34yQemJIS3Dzi
   ypgj7/+MrO7xY2fqZ0qRhPUjH7aYqCZSILSRAStud4GxY3NGizIsr52iB
   yJRJfw+O+sHM5bcYnM70hdqgnb3cu89zsAxuQhRlbhmp1zG4mO327BP6X
   1unQV846PhJwPUzUP+DUNFmCGEGdLku5CWnI245TpmmRDIaF+Xc8E+vVp
   w==;
X-CSE-ConnectionGUID: kJf2CNHtRIO7jIVmEORcVQ==
X-CSE-MsgGUID: ZRmoA8v2RHChlwv52A0DiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="16471637"
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; 
   d="scan'208";a="16471637"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 11:57:08 -0700
X-CSE-ConnectionGUID: EQqKlcWBSNiA9FLsk7Q6bQ==
X-CSE-MsgGUID: h/9eI9YHTLWcq69FfPTWpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; 
   d="scan'208";a="68017751"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 28 Jun 2024 11:57:06 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sNGmO-000Hqp-0V;
	Fri, 28 Jun 2024 18:57:04 +0000
Date: Sat, 29 Jun 2024 02:56:20 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Jeff Layton <jlayton@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>,
	Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
Subject: [brauner-vfs:vfs.nsfs.2024-06-28 4/5] fs/nsfs.c:96:19: error: use of
 undeclared identifier '__free_path_put'
Message-ID: <202406290204.8DT6lYeX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.nsfs.2024-06-28
head:   1cbcd0fbb586ed09ba76dfb4e65cab2bcaec7e5e
commit: 4cf9ee1f184ddc959556337a53075a3b824f3642 [4/5] nsfs: add open_namespace()
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20240629/202406290204.8DT6lYeX-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 326ba38a991250a8587a399a260b0f7af2c9166a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240629/202406290204.8DT6lYeX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406290204.8DT6lYeX-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/nsfs.c:3:
   In file included from include/linux/pseudo_fs.h:4:
   In file included from include/linux/fs_context.h:14:
   In file included from include/linux/security.h:33:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> fs/nsfs.c:96:19: error: use of undeclared identifier '__free_path_put'
      96 |         struct path path __free(path_put) = {};
         |                          ^
   include/linux/cleanup.h:64:33: note: expanded from macro '__free'
      64 | #define __free(_name)   __cleanup(__free_##_name)
         |                                   ^
   <scratch space>:28:1: note: expanded from here
      28 | __free_path_put
         | ^
   1 warning and 1 error generated.


vim +/__free_path_put +96 fs/nsfs.c

    85	
    86	/**
    87	 * open_namespace - open a namespace
    88	 * @ns: the namespace to open
    89	 *
    90	 * This will consume a reference to @ns indendent of success or failure.
    91	 *
    92	 * Return: A file descriptor on success or a negative error code on failure.
    93	 */
    94	int open_namespace(struct ns_common *ns)
    95	{
  > 96		struct path path __free(path_put) = {};
    97		struct file *f;
    98		int err;
    99	
   100		/* call first to consume reference */
   101		err = path_from_stashed(&ns->stashed, nsfs_mnt, ns, &path);
   102		if (err < 0)
   103			return err;
   104	
   105		CLASS(get_unused_fd, fd)(O_CLOEXEC);
   106		if (fd < 0)
   107			return fd;
   108	
   109		f = dentry_open(&path, O_RDONLY, current_cred());
   110		if (IS_ERR(f))
   111			return PTR_ERR(f);
   112	
   113		fd_install(fd, f);
   114		return take_fd(fd);
   115	}
   116	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
