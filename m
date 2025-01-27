Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E511FCD05;
	Mon, 27 Jan 2025 11:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737975953; cv=none; b=bbHKKAsXdqLXquHdTCzJo5pfwrNY3aiHl9G3TOVS8vkz18jBGmVSFBUZF+S5T2LzCLGyvwYd8+QnRou1LL7LL4j/rfnzGoRNqWKRSEADH9PHeTNYcJSRSheU4JRt5G8U7nY8nUkVsi//XyJl5HvKAdsmrrayEuxUqHAXbd1ro0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737975953; c=relaxed/simple;
	bh=+TBZjqKeBR9Aa/uLLD+0SCEdwf2tp5lh2hJE7Mj3IQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N8jJxjUr5jMi8MU4SgyNJq20bZz9voX+8bUwTqBMwB+gtBR9hdCGfRMqWULU++RPpy2A8c977kCgiKa0CHd/TJ1gaHq33oijwM0bFCdmxNZLGAb3h5qK55/rBDgKhEfmITXB+rtb8XEFexqmLYtOr/MkyVHveEkdMP700B7JEc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DADnlQyt; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DADnlQyt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737975953; x=1769511953;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+TBZjqKeBR9Aa/uLLD+0SCEdwf2tp5lh2hJE7Mj3IQ0=;
  b=DADnlQytUDCa076oANtymCjUNCQkbBQDih7uHWR0e82KtkBbJfiuTy+h
   m7uVylfFpR8r4gBaEv0xbWYuLxDvPESvPxSiTBR1vZpqjlTV9iEJ1d/Mh
   MQT5klOKWv7i2+6kopLtbBiyRWhwZvBUQ39TdbTYlkD8yG8wbIDrN0Y25
   5RERPn+tji8qLBHnLveBQCNq9Gx74hECeBOXzVMF7N6G+lBV0muCsJIZf
   bYTsjX4zLTq8+IQXI7h45GuGkb4OlMRhEfPS7vSlr1M1oqraTTxLwoYHt
   q6ZU1iWP0UJ0xJQxHTHYIP/IsCFovy1pLE9etM0DkXf/n2CikCjhv7ih1
   w==;
X-CSE-ConnectionGUID: 9xD3ikN/RROtdJdeyPesQg==
X-CSE-MsgGUID: mfWnBDMkQdGMNLdkjajJ0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11327"; a="38461432"
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; 
   d="scan'208";a="38461432"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2025 03:05:52 -0800
X-CSE-ConnectionGUID: AbLAUpoTQHqTGEpitXRSGQ==
X-CSE-MsgGUID: iwjJ80d0R96aXxtuvQ/j4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; 
   d="scan'208";a="108510143"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 27 Jan 2025 03:05:51 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcMw7-000ggx-2o;
	Mon, 27 Jan 2025 11:05:47 +0000
Date: Mon, 27 Jan 2025 19:05:30 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20250124 17/17]
 kernel/bpf/core.c:2510:22: warning: comparison of distinct pointer types
 ('struct bpf_prog_array *' and 'struct bpf_prog_array_hdr *')
Message-ID: <202501271904.pGWAyWKF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20250124
head:   9fcf89847632bd963953b2f945fb3ce2277f1f97
commit: 54447c8c7cc239e559f3b58a7a70d9b776ed9b03 [17/17] treewide_some: fix multiple -Wfamnae warnings that must be audited separately
config: s390-randconfig-002-20250127 (https://download.01.org/0day-ci/archive/20250127/202501271904.pGWAyWKF-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 19306351a2c45e266fa11b41eb1362b20b6ca56d)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250127/202501271904.pGWAyWKF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501271904.pGWAyWKF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/bpf/core.c:21:
   In file included from include/linux/filter.h:21:
   In file included from include/linux/if_vlan.h:10:
   In file included from include/linux/netdevice.h:44:
   In file included from include/uapi/linux/neighbour.h:6:
   In file included from include/linux/netlink.h:9:
   In file included from include/net/scm.h:13:
   include/net/compat.h:33:25: error: field has incomplete type 'struct sockaddr_legacy'
      33 |         struct sockaddr_legacy  rt_dst;         /* target address               */
         |                                 ^
   include/net/compat.h:33:9: note: forward declaration of 'struct sockaddr_legacy'
      33 |         struct sockaddr_legacy  rt_dst;         /* target address               */
         |                ^
   include/net/compat.h:34:25: error: field has incomplete type 'struct sockaddr_legacy'
      34 |         struct sockaddr_legacy  rt_gateway;     /* gateway addr (RTF_GATEWAY)   */
         |                                 ^
   include/net/compat.h:33:9: note: forward declaration of 'struct sockaddr_legacy'
      33 |         struct sockaddr_legacy  rt_dst;         /* target address               */
         |                ^
   include/net/compat.h:35:25: error: field has incomplete type 'struct sockaddr_legacy'
      35 |         struct sockaddr_legacy  rt_genmask;     /* target network mask (IP)     */
         |                                 ^
   include/net/compat.h:33:9: note: forward declaration of 'struct sockaddr_legacy'
      33 |         struct sockaddr_legacy  rt_dst;         /* target address               */
         |                ^
>> kernel/bpf/core.c:2510:22: warning: comparison of distinct pointer types ('struct bpf_prog_array *' and 'struct bpf_prog_array_hdr *') [-Wcompare-distinct-pointer-types]
    2510 |         if (!progs || progs == &bpf_empty_prog_array.hdr)
         |                       ~~~~~ ^  ~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 3 errors generated.


vim +2510 kernel/bpf/core.c

8c7dcb84e3b744 Delyan Kratunov 2022-06-14  2507  
8c7dcb84e3b744 Delyan Kratunov 2022-06-14  2508  void bpf_prog_array_free_sleepable(struct bpf_prog_array *progs)
8c7dcb84e3b744 Delyan Kratunov 2022-06-14  2509  {
8c7dcb84e3b744 Delyan Kratunov 2022-06-14 @2510  	if (!progs || progs == &bpf_empty_prog_array.hdr)
8c7dcb84e3b744 Delyan Kratunov 2022-06-14  2511  		return;
8c7dcb84e3b744 Delyan Kratunov 2022-06-14  2512  	call_rcu_tasks_trace(&progs->rcu, __bpf_prog_array_free_sleepable_cb);
8c7dcb84e3b744 Delyan Kratunov 2022-06-14  2513  }
8c7dcb84e3b744 Delyan Kratunov 2022-06-14  2514  

:::::: The code at line 2510 was first introduced by commit
:::::: 8c7dcb84e3b744b2b70baa7a44a9b1881c33a9c9 bpf: implement sleepable uprobes by chaining gps

:::::: TO: Delyan Kratunov <delyank@fb.com>
:::::: CC: Alexei Starovoitov <ast@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
