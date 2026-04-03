Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8523876A4;
	Fri,  3 Apr 2026 08:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205908; cv=none; b=G3AjIbNk5sxHC5RkrXPX9KjQeKDiZDvvaUtl1jv1EEcge0nC+bHkqUA1pAiWD0tgk3yTx+7HuRijflZfBHdyJ32dODZPLizH0P9yxkZ4AKN7QHz/J1lecTFpa5MnKAT52E+T0pkMz0gbG+FNdFT0o4kOrNOiTZRPAvm3ffC7p7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205908; c=relaxed/simple;
	bh=tLTLzFAMTM1rw1Oww+ppWMIFA2Da83NWm0LlHMKNhlA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pDjaNYkHBPAIqgSedNhctVqU+KVGoeHbiP8dGvj0ahX7GAtfTeKL9tqDYCj0JG2w6R1mslNhCI59g2d2egBYyLn9uJo3sxFPAYbdYPR6MpjMPYX87CtSAIH4PMmyYiW+u6PQwl5UR+NeN7RkyeRo8fG0BLQRMkUorqAFtbi5iBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=acFQhkgB; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="acFQhkgB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775205907; x=1806741907;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tLTLzFAMTM1rw1Oww+ppWMIFA2Da83NWm0LlHMKNhlA=;
  b=acFQhkgBXT9t5IjpA7RmtBFnE35ursSczfXjWOV70WIJb1FtmZXQ0y6/
   pApRAavEQRZJH2Hc/k6rWIpfKFvX1682a6sXjl5U0IsC8RMzKKKS8sFyr
   r6+OqTdYBnWhVrYYGnFBur2FOprfVdc3Edj9yns1XsSWDBTwE7HOTx3nM
   5e2eCoGRey2E3dxwDvUikB2YiXlkf26v777z5l3/kZy7l/OWV2/7X8uDi
   nj5lsEAdoV05QojavfWX/VNdA9IjHZNM1GUlEdNy5uQWI97v7+h+oKGRv
   C45iD3jkjEGMk/0RtWTb9/mcVYltbm3nBfiQz5frGLuj7CT5ICrVohL9p
   A==;
X-CSE-ConnectionGUID: +Uh4lsb8ROq38swACE+KgQ==
X-CSE-MsgGUID: AVTsc+IYT0GpUPwWFNetIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="86888922"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="86888922"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:45:01 -0700
X-CSE-ConnectionGUID: 6gzePHlgQaGymIk0phTsEg==
X-CSE-MsgGUID: ub7Axl/9TLKpjeacaRUOmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="226368655"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 03 Apr 2026 01:44:58 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8a9A-0000000015L-18jz;
	Fri, 03 Apr 2026 08:44:56 +0000
Date: Fri, 3 Apr 2026 16:44:20 +0800
From: kernel test robot <lkp@intel.com>
To: Mathura_Kumar <academic1mathura@gmail.com>, brauner@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	academic1mathura@gmail.com, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, viro@zeniv.linux.org.uk
Subject: Re: [PATCH v1 1/4] IPC: Added New system call do_mq_timedreceive2()
 for non-destructive peek on posix mqueue
Message-ID: <202604030850.kLrlQyOM-lkp@intel.com>
References: <20260315040827.156558-2-academic1mathura@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260315040827.156558-2-academic1mathura@gmail.com>

Hi Mathura_Kumar,

kernel test robot noticed the following build warnings:

[auto build test WARNING on perf-tools-next/perf-tools-next]
[also build test WARNING on tip/perf/core perf-tools/perf-tools linus/master v7.0-rc6 next-20260401]
[cannot apply to acme/perf/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mathura_Kumar/IPC-Added-New-system-call-do_mq_timedreceive2-for-non-destructive-peek-on-posix-mqueue/20260315-143134
base:   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git perf-tools-next
patch link:    https://lore.kernel.org/r/20260315040827.156558-2-academic1mathura%40gmail.com
patch subject: [PATCH v1 1/4] IPC: Added New system call do_mq_timedreceive2() for non-destructive peek on posix mqueue
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20260403/202604030850.kLrlQyOM-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e3cbd9984a78422c3799629eb6b5f7f7818c1a11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260403/202604030850.kLrlQyOM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604030850.kLrlQyOM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from init/do_mounts.c:23:
   In file included from include/linux/nfs_fs.h:32:
   In file included from include/linux/sunrpc/clnt.h:29:
   In file included from include/net/ipv6.h:12:
   In file included from include/linux/ipv6.h:103:
   In file included from include/linux/tcp.h:19:
   In file included from include/net/sock.h:46:
   In file included from include/linux/netdevice.h:44:
   In file included from include/uapi/linux/neighbour.h:6:
   In file included from include/linux/netlink.h:9:
   In file included from include/net/scm.h:13:
   In file included from include/net/compat.h:8:
>> include/linux/compat.h:805:65: warning: declaration of 'struct compat_mq_timedreceive2_args' will not be visible outside of this function [-Wvisibility]
     805 | asmlinkage long compat_sys_mq_timedreceive2(mqd_t mqdes, struct compat_mq_timedreceive2_args __user *uargs,
         |                                                                 ^
   1 warning generated.


vim +805 include/linux/compat.h

   799	
   800	#ifdef __ARCH_WANT_COMPAT_SYS_PWRITEV64V2
   801	asmlinkage long compat_sys_pwritev64v2(unsigned long fd,
   802			const struct iovec __user *vec,
   803			unsigned long vlen, loff_t pos, rwf_t flags);
   804	#endif
 > 805	asmlinkage long compat_sys_mq_timedreceive2(mqd_t mqdes, struct compat_mq_timedreceive2_args __user *uargs,
   806												unsigned int flags, unsigned long index,
   807												struct old_timespec32 __user *abs_timeout);
   808	/*
   809	 * Deprecated system calls which are still defined in
   810	 * include/uapi/asm-generic/unistd.h and wanted by >= 1 arch
   811	 */
   812	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
