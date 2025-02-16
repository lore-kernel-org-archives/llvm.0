Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55313199EAF;
	Sun, 16 Feb 2025 16:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739723792; cv=none; b=b5A4YTZ0wdNogDOtpNN3TmASGkKT6ym4r8s2WqaGNrzpeVCsupHhYZudXhiQks/a7JEjmUUwPfoWIyE860OXY+7aw3XlLd+kKOicY8kdOVhO11KyxICC6++ERTB/9TDnrvA2C9IaEUFmroc187mmI1JEJEu1PtrSUhXFUB9OOZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739723792; c=relaxed/simple;
	bh=TAQp3lYKe0zsk2AdrffIzcaR3k2Fdy2b/Ma99g3300E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z7PDiyPvVaLNTSA0vr0GGQ3nk1ACNy6WOkJosD9zD3yt54EU7aMdJHH1yTgeAFQk7ye9qgXl4zn5fCGJP4lGdjq62Eb1GY8dGv3+60hwpQg/wBL8S2n70TOoRFzdq6zdwJuizbqhMJejMbfNCzKDUlrybRTCr+NRCpZF4jh7Ym8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FdsBJ2SX; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FdsBJ2SX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739723790; x=1771259790;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TAQp3lYKe0zsk2AdrffIzcaR3k2Fdy2b/Ma99g3300E=;
  b=FdsBJ2SX123AV01Bmy3RX6Hn7HXA/+eaTcfGrh59ggpItilHZkVrSEzc
   yTDiujnvFfZHl6Ot9fHxTGnYUYdkPaPEiBnbSmCwab7LNEFx75d9hg0YM
   aNXz1ukIZXvNPe6e2RbncjRjF/vGzIilpEbWsJ32/laEUnZ5ZYdZ0lSWJ
   Ec2iYMplQUGC3TdSeridfNIIoN3VQYk38B2kiU0TGzUKc9SwowLPN29Xw
   gOwTpw1Y8JOyaMleFo/FMF5z/8tDt+FcRFel4QORbuFRBXb/pKfgXm5VT
   TMkM6fqfGEvUIEdzU+pUK51mj3qGtQRHj1U3WxkwlCzO0TEXT76hsSc8B
   g==;
X-CSE-ConnectionGUID: 3dhL41ptTHappKzgXyU6kA==
X-CSE-MsgGUID: VUEMEAYfQOKc2Jlk+0sNIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="62883188"
X-IronPort-AV: E=Sophos;i="6.13,291,1732608000"; 
   d="scan'208";a="62883188"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2025 08:36:29 -0800
X-CSE-ConnectionGUID: HQqmdKjqT8aRBc60Eh9/Yw==
X-CSE-MsgGUID: 7s48cWsVRmuZzLgi+h9a+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,291,1732608000"; 
   d="scan'208";a="114112488"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 16 Feb 2025 08:36:28 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjhd4-001C4v-1B;
	Sun, 16 Feb 2025 16:36:26 +0000
Date: Mon, 17 Feb 2025 00:35:58 +0800
From: kernel test robot <lkp@intel.com>
To: Yunsheng Lin <yunshenglin0825@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [linyunsheng:page_bulk_alloc_opt 1/1] fs/xfs/xfs_buf.c:382:57:
 error: use of undeclared identifier 'refill'
Message-ID: <202502170011.yexpDjyi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gestionlin/linux.git page_bulk_alloc_opt
head:   a4f123e5e9347f8f9302bcc6b0a05c8a5a9ff4b8
commit: a4f123e5e9347f8f9302bcc6b0a05c8a5a9ff4b8 [1/1] mm: alloc_pages_bulk: remove assumption of populating only NULL elements
config: s390-randconfig-001-20250216 (https://download.01.org/0day-ci/archive/20250217/202502170011.yexpDjyi-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250217/202502170011.yexpDjyi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502170011.yexpDjyi-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/xfs/xfs_buf.c:382:57: error: use of undeclared identifier 'refill'
     382 |                 alloc = alloc_pages_bulk(gfp_mask, bp->b_page_count - refill,
         |                                                                       ^
   fs/xfs/xfs_buf.c:383:21: error: use of undeclared identifier 'refill'
     383 |                                          bp->b_pages + refill);
         |                                                        ^
>> fs/xfs/xfs_buf.c:382:57: error: use of undeclared identifier 'refill'
     382 |                 alloc = alloc_pages_bulk(gfp_mask, bp->b_page_count - refill,
         |                                                                       ^
   fs/xfs/xfs_buf.c:383:21: error: use of undeclared identifier 'refill'
     383 |                                          bp->b_pages + refill);
         |                                                        ^
>> fs/xfs/xfs_buf.c:382:57: error: use of undeclared identifier 'refill'
     382 |                 alloc = alloc_pages_bulk(gfp_mask, bp->b_page_count - refill,
         |                                                                       ^
   fs/xfs/xfs_buf.c:383:21: error: use of undeclared identifier 'refill'
     383 |                                          bp->b_pages + refill);
         |                                                        ^
   fs/xfs/xfs_buf.c:384:3: error: use of undeclared identifier 'refill'
     384 |                 refill += alloc;
         |                 ^
   7 errors generated.


vim +/refill +382 fs/xfs/xfs_buf.c

   346	
   347	static int
   348	xfs_buf_alloc_pages(
   349		struct xfs_buf	*bp,
   350		xfs_buf_flags_t	flags)
   351	{
   352		gfp_t		gfp_mask = GFP_KERNEL | __GFP_NOLOCKDEP | __GFP_NOWARN;
   353		long		filled = 0;
   354	
   355		if (flags & XBF_READ_AHEAD)
   356			gfp_mask |= __GFP_NORETRY;
   357	
   358		/* Make sure that we have a page list */
   359		bp->b_page_count = DIV_ROUND_UP(BBTOB(bp->b_length), PAGE_SIZE);
   360		if (bp->b_page_count <= XB_PAGES) {
   361			bp->b_pages = bp->b_page_array;
   362		} else {
   363			bp->b_pages = kzalloc(sizeof(struct page *) * bp->b_page_count,
   364						gfp_mask);
   365			if (!bp->b_pages)
   366				return -ENOMEM;
   367		}
   368		bp->b_flags |= _XBF_PAGES;
   369	
   370		/* Assure zeroed buffer for non-read cases. */
   371		if (!(flags & XBF_READ))
   372			gfp_mask |= __GFP_ZERO;
   373	
   374		/*
   375		 * Bulk filling of pages can take multiple calls. Not filling the entire
   376		 * array is not an allocation failure, so don't back off if we get at
   377		 * least one extra page.
   378		 */
   379		for (;;) {
   380			long	alloc;
   381	
 > 382			alloc = alloc_pages_bulk(gfp_mask, bp->b_page_count - refill,
   383						 bp->b_pages + refill);
   384			refill += alloc;
   385			if (filled == bp->b_page_count) {
   386				XFS_STATS_INC(bp->b_mount, xb_page_found);
   387				break;
   388			}
   389	
   390			if (alloc)
   391				continue;
   392	
   393			if (flags & XBF_READ_AHEAD) {
   394				xfs_buf_free_pages(bp);
   395				return -ENOMEM;
   396			}
   397	
   398			XFS_STATS_INC(bp->b_mount, xb_page_retries);
   399			memalloc_retry_wait(gfp_mask);
   400		}
   401		return 0;
   402	}
   403	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
