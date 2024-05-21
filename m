Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2A81CD11;
	Tue, 21 May 2024 03:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716260628; cv=none; b=CRmiAIIKk61QGaFODPJgmsb3NqTz3dFn9F5GvgfmfeU42odG2LiX5StJEh5ChkifPX15ePYoT5PUkIOzutpozkcSJBwnyiEkFjv74sz8DV4+POgx1/mjwUfq8iRkgUaN8365zCaLryP5VpoRqZ2gc0ACLMTXYUeoKF3Xtzoi4Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716260628; c=relaxed/simple;
	bh=a4+tPcw/1Kf2AK6xHP/I6VrHCagS3r5EQ8Xe3nxaqHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F4UBm7XY4nwCvmrv8pHf8NpYSXBVbkf2r5o1i75GSaLNBfDemM1NbjvWQK+6ups5WrLs5QnWcckelwAKMTE4vjIP/lzTb+yc9VpfoPRLZkteBsVvmV4W6EDaFtxlvOo5JpQzC59dYNLgkM/Skp8uPRWeq/z20Sfano5eIggWCRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g5o5fDVx; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g5o5fDVx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716260625; x=1747796625;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a4+tPcw/1Kf2AK6xHP/I6VrHCagS3r5EQ8Xe3nxaqHo=;
  b=g5o5fDVxeH8PpAgesYKP/hsAE3V+wlTbxaiQ1shlQgl1Q5W6vQEzesS9
   Os0BM6CLdojBpHb8xz1l2Sz9YE9t2OhT9Qe+wihjpCrxZK4J4JPwxtpaX
   JqtgT2K1RVxvvge/krhkhnMg2dB2C8/Q5Ct4VoUxE1iXx5InDRA4crBWF
   eBKT9x2iBjYCvR13DeefTU8XLwe3keSPIda0qN/lQLPZs/EdvGvItppP3
   kV5CdmPy8Xkdqs25+4Msk+NNgr6N0kzOML+q6MWS0AsWmzRoPOw+uQHXk
   1hlTv0K2ZdPFJc1gBN3l03R3Qb64CjLvvCeK1FKs9rhtdGmvzC0Grn/St
   Q==;
X-CSE-ConnectionGUID: IqXgQBJqR0+ZpYy1P2/5GQ==
X-CSE-MsgGUID: XC/y5FPpRF6Mjl+vHK3vqw==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="16215222"
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000"; 
   d="scan'208";a="16215222"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2024 20:03:45 -0700
X-CSE-ConnectionGUID: j6FDe+mHSAGFQow0q6JXzA==
X-CSE-MsgGUID: iLreU29wTbafAa/GqCNJaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000"; 
   d="scan'208";a="37587947"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 20 May 2024 20:03:45 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s9Fmg-0005TI-1D;
	Tue, 21 May 2024 03:03:34 +0000
Date: Tue, 21 May 2024 11:02:39 +0800
From: kernel test robot <lkp@intel.com>
To: Aleksa Sarai <cyphar@cyphar.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC] fhandle: expose u64 mount id to name_to_handle_at(2)
Message-ID: <202405211019.3ibjIxdf-lkp@intel.com>
References: <20240520-exportfs-u64-mount-id-v1-1-f55fd9215b8e@cyphar.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240520-exportfs-u64-mount-id-v1-1-f55fd9215b8e@cyphar.com>

Hi Aleksa,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 584bbf439d0fa83d728ec49f3a38c581bdc828b4]

url:    https://github.com/intel-lab-lkp/linux/commits/Aleksa-Sarai/fhandle-expose-u64-mount-id-to-name_to_handle_at-2/20240521-053815
base:   584bbf439d0fa83d728ec49f3a38c581bdc828b4
patch link:    https://lore.kernel.org/r/20240520-exportfs-u64-mount-id-v1-1-f55fd9215b8e%40cyphar.com
patch subject: [PATCH RFC] fhandle: expose u64 mount id to name_to_handle_at(2)
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20240521/202405211019.3ibjIxdf-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project fa9b1be45088dce1e4b602d451f118128b94237b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240521/202405211019.3ibjIxdf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405211019.3ibjIxdf-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/fhandle.c:2:
   In file included from include/linux/syscalls.h:93:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:6:
   In file included from include/linux/ring_buffer.h:5:
   In file included from include/linux/mm.h:2210:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> fs/fhandle.c:102:1: error: conflicting types for 'sys_name_to_handle_at'
     102 | SYSCALL_DEFINE5(name_to_handle_at, int, dfd, const char __user *, name,
         | ^
   include/linux/syscalls.h:227:36: note: expanded from macro 'SYSCALL_DEFINE5'
     227 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
         |                                    ^
   include/linux/syscalls.h:234:2: note: expanded from macro 'SYSCALL_DEFINEx'
     234 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^
   include/linux/syscalls.h:248:18: note: expanded from macro '__SYSCALL_DEFINEx'
     248 |         asmlinkage long sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))       \
         |                         ^
   <scratch space>:17:1: note: expanded from here
      17 | sys_name_to_handle_at
         | ^
   include/linux/syscalls.h:864:17: note: previous declaration is here
     864 | asmlinkage long sys_name_to_handle_at(int dfd, const char __user *name,
         |                 ^
   1 warning and 1 error generated.


vim +/sys_name_to_handle_at +102 fs/fhandle.c

990d6c2d7aee92 Aneesh Kumar K.V 2011-01-29   86  
990d6c2d7aee92 Aneesh Kumar K.V 2011-01-29   87  /**
990d6c2d7aee92 Aneesh Kumar K.V 2011-01-29   88   * sys_name_to_handle_at: convert name to handle
990d6c2d7aee92 Aneesh Kumar K.V 2011-01-29   89   * @dfd: directory relative to which name is interpreted if not absolute
990d6c2d7aee92 Aneesh Kumar K.V 2011-01-29   90   * @name: name that should be converted to handle.
990d6c2d7aee92 Aneesh Kumar K.V 2011-01-29   91   * @handle: resulting file handle
990d6c2d7aee92 Aneesh Kumar K.V 2011-01-29   92   * @mnt_id: mount id of the file system containing the file
1702d25fd14170 Aleksa Sarai     2024-05-20   93   *          (u64 if AT_HANDLE_UNIQUE_MNT_ID, otherwise int)
990d6c2d7aee92 Aneesh Kumar K.V 2011-01-29   94   * @flag: flag value to indicate whether to follow symlink or not
96b2b072ee62be Amir Goldstein   2023-05-02   95   *        and whether a decodable file handle is required.
990d6c2d7aee92 Aneesh Kumar K.V 2011-01-29   96   *
990d6c2d7aee92 Aneesh Kumar K.V 2011-01-29   97   * @handle->handle_size indicate the space available to store the
990d6c2d7aee92 Aneesh Kumar K.V 2011-01-29   98   * variable part of the file handle in bytes. If there is not
990d6c2d7aee92 Aneesh Kumar K.V 2011-01-29   99   * enough space, the field is updated to return the minimum
990d6c2d7aee92 Aneesh Kumar K.V 2011-01-29  100   * value required.
990d6c2d7aee92 Aneesh Kumar K.V 2011-01-29  101   */
990d6c2d7aee92 Aneesh Kumar K.V 2011-01-29 @102  SYSCALL_DEFINE5(name_to_handle_at, int, dfd, const char __user *, name,
1702d25fd14170 Aleksa Sarai     2024-05-20  103  		struct file_handle __user *, handle, void __user *, mnt_id,
990d6c2d7aee92 Aneesh Kumar K.V 2011-01-29  104  		int, flag)
990d6c2d7aee92 Aneesh Kumar K.V 2011-01-29  105  {
990d6c2d7aee92 Aneesh Kumar K.V 2011-01-29  106  	struct path path;
990d6c2d7aee92 Aneesh Kumar K.V 2011-01-29  107  	int lookup_flags;
96b2b072ee62be Amir Goldstein   2023-05-02  108  	int fh_flags;
990d6c2d7aee92 Aneesh Kumar K.V 2011-01-29  109  	int err;
990d6c2d7aee92 Aneesh Kumar K.V 2011-01-29  110  
1702d25fd14170 Aleksa Sarai     2024-05-20  111  	if (flag & ~(AT_SYMLINK_FOLLOW | AT_EMPTY_PATH | AT_HANDLE_FID |
1702d25fd14170 Aleksa Sarai     2024-05-20  112  		     AT_HANDLE_UNIQUE_MNT_ID))
990d6c2d7aee92 Aneesh Kumar K.V 2011-01-29  113  		return -EINVAL;
990d6c2d7aee92 Aneesh Kumar K.V 2011-01-29  114  
990d6c2d7aee92 Aneesh Kumar K.V 2011-01-29  115  	lookup_flags = (flag & AT_SYMLINK_FOLLOW) ? LOOKUP_FOLLOW : 0;
96b2b072ee62be Amir Goldstein   2023-05-02  116  	fh_flags = (flag & AT_HANDLE_FID) ? EXPORT_FH_FID : 0;
990d6c2d7aee92 Aneesh Kumar K.V 2011-01-29  117  	if (flag & AT_EMPTY_PATH)
990d6c2d7aee92 Aneesh Kumar K.V 2011-01-29  118  		lookup_flags |= LOOKUP_EMPTY;
990d6c2d7aee92 Aneesh Kumar K.V 2011-01-29  119  	err = user_path_at(dfd, name, lookup_flags, &path);
990d6c2d7aee92 Aneesh Kumar K.V 2011-01-29  120  	if (!err) {
1702d25fd14170 Aleksa Sarai     2024-05-20  121  		err = do_sys_name_to_handle(&path, handle, mnt_id,
1702d25fd14170 Aleksa Sarai     2024-05-20  122  					    flag & AT_HANDLE_UNIQUE_MNT_ID,
1702d25fd14170 Aleksa Sarai     2024-05-20  123  					    fh_flags);
990d6c2d7aee92 Aneesh Kumar K.V 2011-01-29  124  		path_put(&path);
990d6c2d7aee92 Aneesh Kumar K.V 2011-01-29  125  	}
990d6c2d7aee92 Aneesh Kumar K.V 2011-01-29  126  	return err;
990d6c2d7aee92 Aneesh Kumar K.V 2011-01-29  127  }
becfd1f3754479 Aneesh Kumar K.V 2011-01-29  128  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
