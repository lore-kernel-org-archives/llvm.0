Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F352227CB2A;
	Fri, 20 Jun 2025 08:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750409273; cv=none; b=RigevE7ZmR1PStUGMitei1ex5Q9YuQnxYfVRLTxeTAigv4ZaWThVaO+HAgKq4L0EfFme5xyNYVKiaWKtmHtrkj/wg+PjWEyGWj2WjWmmYEdSlWdzDQ3TNtw5Ht0t6hi0pPncuapYCRdo1XONpLEE/XCkZR+sMDqKAPh45+D2pVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750409273; c=relaxed/simple;
	bh=2rm2AsVS0RkMxBq6eGjQQPXGOVduvaPUuRdUdDsBpeo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XfuWj/2SfANsf33gKoolsDbZ1SoNed07c/WklAqvCyXFbG+cwnHNptgCZuWRdnl3p/DL0Lyj2wqztspOMe/Xhdfq2/f14jkDjie5RpvoKW5SHX9+QUGot3M/3ultQgFfRb16R8Fezj8Njp6JSqeWmIpWFW9yuHOjY1q5wxiHjN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V0HZELS4; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V0HZELS4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750409272; x=1781945272;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2rm2AsVS0RkMxBq6eGjQQPXGOVduvaPUuRdUdDsBpeo=;
  b=V0HZELS48Jc50YmX4InlzoVCIXksQatlQQ2mA3MZYzOlg2qCPTWmxjN8
   qW2Q+W6hb4/JVKYGclpWD5KonbAOcROuPch5RfcmUUzUiQSi9yxsAyYZU
   mMXkw7iTbLstapaLl6fJ8wtrwniD3jPyLIsx9JcYNEPuMXg2H8BNmn6iB
   hwCojsqCsbANqI3lemH2tkBbXa264vLqgR7ikYcexTVcCIoDwJh0Kt0FA
   cxpXhPmAVEOYqXCdZVft9SgSOAqdXi9FFFLUunth+86tT+GpYNe8Aaxfj
   C7Q+6jGls3faMt1UEDFbBgxMuTfu6fZ6Y5NwVKf0icc8q186qw3LWz91+
   Q==;
X-CSE-ConnectionGUID: 1Fdj85FpRUmhyhlMY8S7gQ==
X-CSE-MsgGUID: feJMC//6QKSp0n6GgJQL7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="70100618"
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; 
   d="scan'208";a="70100618"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2025 01:47:52 -0700
X-CSE-ConnectionGUID: hmPohLSBSfmv7Xme/SUzkA==
X-CSE-MsgGUID: x6VoEcXvQY+BCpcA5VJzIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; 
   d="scan'208";a="188077706"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 20 Jun 2025 01:47:50 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSXPX-000LWw-1F;
	Fri, 20 Jun 2025 08:47:47 +0000
Date: Fri, 20 Jun 2025 16:47:24 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_5 2/10] include/linux/ftrace.h:557:5:
 warning: no previous prototype for function 'register_ftrace_direct_hash'
Message-ID: <202506201654.MhDdEOll-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_5
head:   b288c6b15d20122d59ddf3bce2fb86afe6ed56c3
commit: c9910285c9bbb6b3afad3d1048ef11abf71bcdeb [2/10] ftrace: Add register_ftrace_direct_hash function
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250620/202506201654.MhDdEOll-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250620/202506201654.MhDdEOll-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506201654.MhDdEOll-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/filemap.c:25:
   In file included from include/linux/syscalls.h:94:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:43:
>> include/linux/ftrace.h:557:5: warning: no previous prototype for function 'register_ftrace_direct_hash' [-Wmissing-prototypes]
     557 | int register_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
         |     ^
   include/linux/ftrace.h:557:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     557 | int register_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
         | ^
         | static 
   1 warning generated.
--
   In file included from mm/shmem.c:77:
   In file included from include/linux/syscalls.h:94:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:43:
>> include/linux/ftrace.h:557:5: warning: no previous prototype for function 'register_ftrace_direct_hash' [-Wmissing-prototypes]
     557 | int register_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
         |     ^
   include/linux/ftrace.h:557:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     557 | int register_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
         | ^
         | static 
   mm/shmem.c:1686:20: warning: unused function 'shmem_show_mpol' [-Wunused-function]
    1686 | static inline void shmem_show_mpol(struct seq_file *seq, struct mempolicy *mpol)
         |                    ^~~~~~~~~~~~~~~
   2 warnings generated.


vim +/register_ftrace_direct_hash +557 include/linux/ftrace.h

   556	
 > 557	int register_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
   558	{
   559		return -ENODEV;
   560	}
   561	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
