Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571D3157E9E;
	Thu,  1 Feb 2024 07:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706772255; cv=none; b=b3/86/zecphkAAr5I8hqOVkjxXXGeG14lj288goFhhAIJEbk/bCGqZMPdnMCN8eePMXHu+D5bBiyFHpd7LDtAx+p2Le0Qbr68Y+gT0vjlE2TiTPoqOXZn/Pqa70YIJ730u5OFQKLAdMTbLpL7plARFPu5oCz3T5U41XB9RZ5IfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706772255; c=relaxed/simple;
	bh=4MYSNxlWjGVCdX3cX5Nt41TGbFxjWVCbR3U/g9kBrDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cSlr9fOkZ0Z0z0d5kk/P8VaF6nXovJb8vx5OWs/QRC3JMquQ8OQfz0y2WhPjCUuRkGgn88hKFpOfzoBUA47IPfqdjrv065QvfzEN+zcr29l9QRTilWvMCylp1VDcCgiLvPhysuJo/+FxiDe5u1ciV3wq6dCW1roW+2l2PVW3dTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DJOsA+TP; arc=none smtp.client-ip=134.134.136.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DJOsA+TP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706772253; x=1738308253;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4MYSNxlWjGVCdX3cX5Nt41TGbFxjWVCbR3U/g9kBrDo=;
  b=DJOsA+TPX9LFduO+jnivuJQNdSXDJoIq2ceRVQ7xIBrtcHAsQzcYvVez
   Y26f7aeHcG/EshblQS5Je0fT388YfzjbXItO6ZQSkgdwfctxjuloow/05
   gHBMEhege86ngJZJT6Bf/ckUYhZCEw1lFyF6Gs3eB9CE4MmHgaDHvPKsk
   pxBlGZYjlRCU0cppX3z0CsDXBQmvvCuEqeayOpISS5Dcac6sEKSKU7/zs
   DokoSswy/hZNsg0T5oVgMGAAj6HM/PVFreldEBKd1EkqbxM2sSfmmt5VN
   kzGPZiXJPGd93Lh1xAjdBXFYpEbh333WVHznWaQkjM8wHAUUDddmJQskO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="468065271"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="468065271"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 23:24:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="4333852"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 31 Jan 2024 23:24:10 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rVRQc-0002WK-1J;
	Thu, 01 Feb 2024 07:24:06 +0000
Date: Thu, 1 Feb 2024 15:23:13 +0800
From: kernel test robot <lkp@intel.com>
To: Oleg Nesterov <oleg@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 1/1] pidfd: implement PIDFD_THREAD flag for
 pidfd_open()
Message-ID: <202402011558.BUpYBZyG-lkp@intel.com>
References: <20240131132602.GA23641@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240131132602.GA23641@redhat.com>

Hi Oleg,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brauner-vfs/vfs.all]
[cannot apply to kees/for-next/execve linus/master v6.8-rc2 next-20240201]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Oleg-Nesterov/pidfd-implement-PIDFD_THREAD-flag-for-pidfd_open/20240131-213408
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/20240131132602.GA23641%40redhat.com
patch subject: [PATCH v3 1/1] pidfd: implement PIDFD_THREAD flag for pidfd_open()
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240201/202402011558.BUpYBZyG-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240201/202402011558.BUpYBZyG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402011558.BUpYBZyG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/fork.c:2201:70: warning: if statement has empty body [-Wempty-body]
    2201 |         if (!pid || !pid_has_task(pid, thread ? PIDTYPE_PID : PIDTYPE_TGID));
         |                                                                             ^
   kernel/fork.c:2201:70: note: put the semicolon on a separate line to silence this warning
   1 warning generated.


vim +2201 kernel/fork.c

  2169	
  2170	/**
  2171	 * pidfd_prepare - allocate a new pidfd_file and reserve a pidfd
  2172	 * @pid:   the struct pid for which to create a pidfd
  2173	 * @flags: flags of the new @pidfd
  2174	 * @ret: Where to return the pidfd.
  2175	 *
  2176	 * Allocate a new file that stashes @pid and reserve a new pidfd number in the
  2177	 * caller's file descriptor table. The pidfd is reserved but not installed yet.
  2178	 *
  2179	 * The helper verifies that @pid is still in use, without PIDFD_THREAD the
  2180	 * task identified by @pid must be a thread-group leader.
  2181	 *
  2182	 * If this function returns successfully the caller is responsible to either
  2183	 * call fd_install() passing the returned pidfd and pidfd file as arguments in
  2184	 * order to install the pidfd into its file descriptor table or they must use
  2185	 * put_unused_fd() and fput() on the returned pidfd and pidfd file
  2186	 * respectively.
  2187	 *
  2188	 * This function is useful when a pidfd must already be reserved but there
  2189	 * might still be points of failure afterwards and the caller wants to ensure
  2190	 * that no pidfd is leaked into its file descriptor table.
  2191	 *
  2192	 * Return: On success, a reserved pidfd is returned from the function and a new
  2193	 *         pidfd file is returned in the last argument to the function. On
  2194	 *         error, a negative error code is returned from the function and the
  2195	 *         last argument remains unchanged.
  2196	 */
  2197	int pidfd_prepare(struct pid *pid, unsigned int flags, struct file **ret)
  2198	{
  2199		bool thread = flags & PIDFD_THREAD;
  2200	
> 2201		if (!pid || !pid_has_task(pid, thread ? PIDTYPE_PID : PIDTYPE_TGID));
  2202			return -EINVAL;
  2203	
  2204		return __pidfd_prepare(pid, flags, ret);
  2205	}
  2206	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
