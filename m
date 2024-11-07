Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720C3216449;
	Thu,  7 Nov 2024 19:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731007897; cv=none; b=s069jeLxMs7WnnM4gE4615uOAA4o9r1rjntRiNr1FFlDay1tVA5FC/CPx0v7ztjB+LnbxoGNlPUxeUpt0aHEp5LxLxSuBNcE4wwxSeS29kI69KdMZZUhHarvPkikZ6/Cf3dFLKZCw8ZOspDtINDPlEzYH+NSuB0Ihk5IcdL26to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731007897; c=relaxed/simple;
	bh=2NhBq2Rvaw3AwygHdmYrlmMK0IZQwrr0BGDPozBcT8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XZ0UE5opBlABaqZMesXyx4uihZKnuZQeJKO4QdH2Ka14By6EOjtK/EVET3schu3+SWt5Wc7+gCv6Gko2pEqMWs1gybCsgy+SWv7fX7KVqRK7+6/WWWRm/9TrHqs2tFfCLLLWUhYOk4DON+r2nlFbAlzxQF/VKj6zc2GFLmuRb8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RSSs/axx; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RSSs/axx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731007894; x=1762543894;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2NhBq2Rvaw3AwygHdmYrlmMK0IZQwrr0BGDPozBcT8U=;
  b=RSSs/axxwkfEYsFhvU2ZxXaI4TDsFYboFpokkD4iATjGIqOKJ9NcKiy1
   MmaCjYvME+lQfeJduq8oYcY5Oa43P7tgLIOK57ioscFmRDkhYNfuptQeK
   mSgzldJQvjjxitqMQqlNnx76WazyHc9YdzFvhV8H+NgaQRBhNDV/xmGco
   GgN9JMQJkFEr7IK/wTfq34cXfpej6KQq0kp6qen8az9RVQZO6r7jm/SmA
   SWaKNYbSS2wvys5AnogfTLukpmWY8D9Oz3MBCBc7F0g3rptr456FfX3Xd
   nGHmFpHMrPhgrvugd8FwqlT3VAzffcfWrhbemst9WeYqFMN8i2Xr25uOm
   w==;
X-CSE-ConnectionGUID: PwTdHrs1TlS1DsMM71oRyg==
X-CSE-MsgGUID: spAHRgBvTjeAGIMA++sSwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31044368"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31044368"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 11:31:32 -0800
X-CSE-ConnectionGUID: FwaUpT0wTmCFsegJmHSnGQ==
X-CSE-MsgGUID: lONXDlkQRryYdIGHChLV4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,135,1728975600"; 
   d="scan'208";a="85205060"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 07 Nov 2024 11:31:30 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t98E3-000qcF-0i;
	Thu, 07 Nov 2024 19:31:27 +0000
Date: Fri, 8 Nov 2024 03:30:32 +0800
From: kernel test robot <lkp@intel.com>
To: Ming Lei <ming.lei@redhat.com>, Jens Axboe <axboe@kernel.dk>,
	io-uring@vger.kernel.org, Pavel Begunkov <asml.silence@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-block@vger.kernel.org,
	Uday Shankar <ushankar@purestorage.com>,
	Akilesh Kailash <akailash@google.com>,
	Ming Lei <ming.lei@redhat.com>
Subject: Re: [PATCH V10 11/12] io_uring/uring_cmd: support leasing device
 kernel buffer to io_uring
Message-ID: <202411080354.5JXKXPEW-lkp@intel.com>
References: <20241107110149.890530-12-ming.lei@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241107110149.890530-12-ming.lei@redhat.com>

Hi Ming,

kernel test robot noticed the following build errors:

[auto build test ERROR on axboe-block/for-next]
[also build test ERROR on next-20241107]
[cannot apply to linus/master v6.12-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ming-Lei/io_uring-rsrc-pass-struct-io_ring_ctx-reference-to-rsrc-helpers/20241107-190456
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20241107110149.890530-12-ming.lei%40redhat.com
patch subject: [PATCH V10 11/12] io_uring/uring_cmd: support leasing device kernel buffer to io_uring
config: arm64-randconfig-001-20241108 (https://download.01.org/0day-ci/archive/20241108/202411080354.5JXKXPEW-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241108/202411080354.5JXKXPEW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411080354.5JXKXPEW-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from block/ioctl.c:4:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/arm64/include/asm/cacheflush.h:11:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from block/ioctl.c:15:
>> include/linux/io_uring/cmd.h:89:1: error: expected identifier or '('
      89 | {
         | ^
   3 warnings and 1 error generated.


vim +89 include/linux/io_uring/cmd.h

    62	
    63	int io_uring_cmd_lease_kbuf(struct io_uring_cmd *ioucmd,
    64				    struct io_rsrc_node *node);
    65	#else
    66	static inline int io_uring_cmd_import_fixed(u64 ubuf, unsigned long len, int rw,
    67				      struct iov_iter *iter, void *ioucmd)
    68	{
    69		return -EOPNOTSUPP;
    70	}
    71	static inline void io_uring_cmd_done(struct io_uring_cmd *cmd, ssize_t ret,
    72			ssize_t ret2, unsigned issue_flags)
    73	{
    74	}
    75	static inline void __io_uring_cmd_do_in_task(struct io_uring_cmd *ioucmd,
    76				    void (*task_work_cb)(struct io_uring_cmd *, unsigned),
    77				    unsigned flags)
    78	{
    79	}
    80	static inline void io_uring_cmd_mark_cancelable(struct io_uring_cmd *cmd,
    81			unsigned int issue_flags)
    82	{
    83	}
    84	static inline void io_uring_cmd_issue_blocking(struct io_uring_cmd *ioucmd)
    85	{
    86	}
    87	static inline int io_uring_cmd_lease_kbuf(struct io_uring_cmd *ioucmd,
    88						  struct io_rsrc_node *node);
  > 89	{
    90		return -EOPNOTSUPP;
    91	}
    92	#endif
    93	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
