Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2394920B0F;
	Wed,  9 Oct 2024 02:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728442525; cv=none; b=WjGIUzvcNcdetfDE3r53wizvxdRe+Om7wZQvku5/DJfcmi9hO89oURUG0gSugaLVCctGjXHUM+BpbqkFNOeXohsNjXA57XFV9lDiKZiokE38DrITd+3JkfFg3kDM7D5Zhp3/Syh+iNarliJ205w60LIquiy9MY6IJQAwKeErDkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728442525; c=relaxed/simple;
	bh=IKAx6DCqtMaamqHSW4Z4VEl/bc8Clk7e32rT50Bgq80=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YLoeC3TJ7tndjatJE24KhYeMF75oOIpZIrm5KXfAGMBeGvh4Pm1t8AaX/KK53UkHv9qIF3MOtGDZyzlzS+xGVrlvCmE8KtcRDt35g/FkDrX1voJWFsiy+oDMtQFI5ElujSYgFINOaCiNRAH+vDysBZ3ooDRzLSv6JmXyKG8PXUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M06Rp+7K; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M06Rp+7K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728442524; x=1759978524;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IKAx6DCqtMaamqHSW4Z4VEl/bc8Clk7e32rT50Bgq80=;
  b=M06Rp+7KpIyoGRvktrY37FH3aZDB6b2z06PHYlWyY+ujsBNOyQtc59Fn
   dNUUU+nWzw5AhooDyAPAOkZTMoCxSMwao8HosD50eCdxV2VvOfYIvuV2h
   XWbPsZMCrDbn+JvqtudP7NyuXPfwfIRHeBnoQ1NaHGO1Z8HXYQTF0Ly48
   p8KmklQ7O0YTGGqrkdypXYa3eZDo9yGsRpc0SmOGae6mN/xPbkF5O3Fx6
   6f0qWORC8M4Nrug6fIttkM2Dd1vz3FYV5VwYgskNBG1LTvSefi0wdGunQ
   oy7ocKbl3EdSOqEdl1zhQ8S6bF3kSwt7tg6XgTUoEbsxjWLvcsH2H1xHS
   Q==;
X-CSE-ConnectionGUID: P6fzk7jMSGK3hkx8h9EQLg==
X-CSE-MsgGUID: NfLjQp63QaqsYQDLo/RlVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="50252873"
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; 
   d="scan'208";a="50252873"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 19:55:24 -0700
X-CSE-ConnectionGUID: dAXbqeetSWygckUWRdCqnw==
X-CSE-MsgGUID: N68XK36ATyKW7x14TFrPhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; 
   d="scan'208";a="80919228"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 08 Oct 2024 19:55:22 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syMr9-0008dU-23;
	Wed, 09 Oct 2024 02:55:19 +0000
Date: Wed, 9 Oct 2024 10:54:53 +0800
From: kernel test robot <lkp@intel.com>
To: Filipe Manana <fdmanana@suse.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	David Sterba <dsterba@suse.com>, Qu Wenruo <wqu@suse.com>
Subject: [linux-next:pending-fixes 207/319] fs/btrfs/qgroup.c:2014:6: error:
 use of undeclared identifier 'bytenr'
Message-ID: <202410091038.SI34ZULQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git pending-fixes
head:   47fa0de9b07c6214b57458e965646a3e25656b69
commit: 5c0ea18d992fffc948e087c0002560d747e6edd9 [207/319] btrfs: use sector numbers as keys for the dirty extents xarray
config: arm-randconfig-002-20241009 (https://download.01.org/0day-ci/archive/20241009/202410091038.SI34ZULQ-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241009/202410091038.SI34ZULQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410091038.SI34ZULQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/btrfs/qgroup.c:2014:6: error: use of undeclared identifier 'bytenr'
           if (bytenr >= MAX_LFS_FILESIZE) {
               ^
   fs/btrfs/qgroup.c:2017:9: error: use of undeclared identifier 'bytenr'
                                bytenr);
                                ^
   2 errors generated.


vim +/bytenr +2014 fs/btrfs/qgroup.c

  1991	
  1992	/*
  1993	 * Inform qgroup to trace one dirty extent, its info is recorded in @record.
  1994	 * So qgroup can account it at transaction committing time.
  1995	 *
  1996	 * No lock version, caller must acquire delayed ref lock and allocated memory,
  1997	 * then call btrfs_qgroup_trace_extent_post() after exiting lock context.
  1998	 *
  1999	 * Return 0 for success insert
  2000	 * Return >0 for existing record, caller can free @record safely.
  2001	 * Return <0 for insertion failure, caller can free @record safely.
  2002	 */
  2003	int btrfs_qgroup_trace_extent_nolock(struct btrfs_fs_info *fs_info,
  2004					struct btrfs_delayed_ref_root *delayed_refs,
  2005					struct btrfs_qgroup_extent_record *record)
  2006	{
  2007		struct btrfs_qgroup_extent_record *existing, *ret;
  2008		const unsigned long index = (record->bytenr >> fs_info->sectorsize_bits);
  2009	
  2010		if (!btrfs_qgroup_full_accounting(fs_info))
  2011			return 1;
  2012	
  2013	#if BITS_PER_LONG == 32
> 2014		if (bytenr >= MAX_LFS_FILESIZE) {
  2015			btrfs_err_rl(fs_info,
  2016	"qgroup record for extent at %llu is beyond 32bit page cache and xarray index limit",
  2017				     bytenr);
  2018			btrfs_err_32bit_limit(fs_info);
  2019			return -EOVERFLOW;
  2020		}
  2021	#endif
  2022	
  2023		lockdep_assert_held(&delayed_refs->lock);
  2024		trace_btrfs_qgroup_trace_extent(fs_info, record);
  2025	
  2026		xa_lock(&delayed_refs->dirty_extents);
  2027		existing = xa_load(&delayed_refs->dirty_extents, index);
  2028		if (existing) {
  2029			if (record->data_rsv && !existing->data_rsv) {
  2030				existing->data_rsv = record->data_rsv;
  2031				existing->data_rsv_refroot = record->data_rsv_refroot;
  2032			}
  2033			xa_unlock(&delayed_refs->dirty_extents);
  2034			return 1;
  2035		}
  2036	
  2037		ret = __xa_store(&delayed_refs->dirty_extents, index, record, GFP_ATOMIC);
  2038		xa_unlock(&delayed_refs->dirty_extents);
  2039		if (xa_is_err(ret)) {
  2040			qgroup_mark_inconsistent(fs_info);
  2041			return xa_err(ret);
  2042		}
  2043	
  2044		return 0;
  2045	}
  2046	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
