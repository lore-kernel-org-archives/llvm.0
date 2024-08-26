Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09471CD25;
	Mon, 26 Aug 2024 15:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724685855; cv=none; b=M/wDutKAL27hnD4USPLOpUj/T4deSz55KA6Dov+UJvK1ksbKZqte/erckDGOnPTt/7ivYdwVsswlZ4zGdlombz76vCTRWzN0TDS/TqwztazvZvlYEGsglqh0MazzJgOKVzIcfW+aQEKhXzWKKzSBLu1EXYxMKKSGHaQTQw+smb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724685855; c=relaxed/simple;
	bh=CaBbi3OQv9oAwXqvZefHAetx2+TNWlDRtz/czDbMKd8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=URDkSx5kML+DCz2ZovipnQ+/fVFGVE99TuNEWFrJSfVAxvaoezvjdCXlOdM+q1av3mX2gGECUGLRfeVl0U32X0E7ENAa0MNsRPYq2rtZPb2vVBnMPjvD78LNvGTZ9d48xEMqBfugpsq193RnM3QFYcPVI6lRMRbRCWnRfWKDZUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eCb5HGd2; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eCb5HGd2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724685852; x=1756221852;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CaBbi3OQv9oAwXqvZefHAetx2+TNWlDRtz/czDbMKd8=;
  b=eCb5HGd2O4wnrLcCKeEeM9/vxZnZaKd68QjCObbF7N+tfjPiYRfcOLjv
   Xuvgku0daPDZi+X3YeXBI5FPaec1WCaGjP66w0AKUV2ePtEpjCK21zFn3
   2LXTAHGX96jGuuNJHjamhLREZrdHdZ4C0VwbYO/k4t2uXhXGujlh/wCLy
   H/1X8N5G2nPpgr+Ka+neVXLiNMAYMU2/DjOiy1T14njbHLJQrZp1FdaA5
   nlBhWvmVD9zfmuYrIShSvaBXegWt1J66ohzdRuS7AtPFJnvbog4BItbU9
   PfMSQFNUOgkpWz3IryOjVHDL4e2LBXTkBMyFyem4S0GrB1P7QztdTJcoy
   w==;
X-CSE-ConnectionGUID: v4u+35YpTomxACHxu0K9xQ==
X-CSE-MsgGUID: /1XiBFLhQGavWSCn08Yp0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="23246729"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="23246729"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 08:24:11 -0700
X-CSE-ConnectionGUID: M+wg2UATRHmxjMnfplPWmw==
X-CSE-MsgGUID: 7Zy/U1HkROC40csSaOsdCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="93271804"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 26 Aug 2024 08:24:10 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sibZg-000HE7-0O;
	Mon, 26 Aug 2024 15:24:08 +0000
Date: Mon, 26 Aug 2024 23:23:31 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 5/6] xfs: call xfs_bmap_exact_minlen_extent_alloc from
 xfs_bmap_btalloc
Message-ID: <202408262312.ekF7lryy-lkp@intel.com>
References: <20240824034100.1163020-6-hch@lst.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240824034100.1163020-6-hch@lst.de>

Hi Christoph,

kernel test robot noticed the following build errors:

[auto build test ERROR on xfs-linux/for-next]
[also build test ERROR on linus/master v6.11-rc5 next-20240826]
[cannot apply to djwong-xfs/djwong-devel]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christoph-Hellwig/xfs-return-bool-from-xfs_attr3_leaf_add/20240826-140936
base:   https://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git for-next
patch link:    https://lore.kernel.org/r/20240824034100.1163020-6-hch%40lst.de
patch subject: [PATCH 5/6] xfs: call xfs_bmap_exact_minlen_extent_alloc from xfs_bmap_btalloc
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240826/202408262312.ekF7lryy-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240826/202408262312.ekF7lryy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408262312.ekF7lryy-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/xfs/libxfs/xfs_bmap.c:3762:50: error: too many arguments provided to function-like macro invocation
    3762 |                 error = xfs_bmap_exact_minlen_extent_alloc(ap, &args);
         |                                                                ^
   fs/xfs/libxfs/xfs_bmap.c:3500:9: note: macro 'xfs_bmap_exact_minlen_extent_alloc' defined here
    3500 | #define xfs_bmap_exact_minlen_extent_alloc(bma) (-EFSCORRUPTED)
         |         ^
>> fs/xfs/libxfs/xfs_bmap.c:3762:11: error: use of undeclared identifier 'xfs_bmap_exact_minlen_extent_alloc'
    3762 |                 error = xfs_bmap_exact_minlen_extent_alloc(ap, &args);
         |                         ^
   2 errors generated.


vim +3762 fs/xfs/libxfs/xfs_bmap.c

  3728	
  3729	static int
  3730	xfs_bmap_btalloc(
  3731		struct xfs_bmalloca	*ap)
  3732	{
  3733		struct xfs_mount	*mp = ap->ip->i_mount;
  3734		struct xfs_alloc_arg	args = {
  3735			.tp		= ap->tp,
  3736			.mp		= mp,
  3737			.fsbno		= NULLFSBLOCK,
  3738			.oinfo		= XFS_RMAP_OINFO_SKIP_UPDATE,
  3739			.minleft	= ap->minleft,
  3740			.wasdel		= ap->wasdel,
  3741			.resv		= XFS_AG_RESV_NONE,
  3742			.datatype	= ap->datatype,
  3743			.alignment	= 1,
  3744			.minalignslop	= 0,
  3745		};
  3746		xfs_fileoff_t		orig_offset;
  3747		xfs_extlen_t		orig_length;
  3748		int			error;
  3749		int			stripe_align;
  3750	
  3751		ASSERT(ap->length);
  3752		orig_offset = ap->offset;
  3753		orig_length = ap->length;
  3754	
  3755		stripe_align = xfs_bmap_compute_alignments(ap, &args);
  3756	
  3757		/* Trim the allocation back to the maximum an AG can fit. */
  3758		args.maxlen = min(ap->length, mp->m_ag_max_usable);
  3759	
  3760		if (unlikely(XFS_TEST_ERROR(false, mp,
  3761				XFS_ERRTAG_BMAP_ALLOC_MINLEN_EXTENT)))
> 3762			error = xfs_bmap_exact_minlen_extent_alloc(ap, &args);
  3763		else if ((ap->datatype & XFS_ALLOC_USERDATA) &&
  3764				xfs_inode_is_filestream(ap->ip))
  3765			error = xfs_bmap_btalloc_filestreams(ap, &args, stripe_align);
  3766		else
  3767			error = xfs_bmap_btalloc_best_length(ap, &args, stripe_align);
  3768		if (error)
  3769			return error;
  3770	
  3771		if (args.fsbno != NULLFSBLOCK) {
  3772			xfs_bmap_process_allocated_extent(ap, &args, orig_offset,
  3773				orig_length);
  3774		} else {
  3775			ap->blkno = NULLFSBLOCK;
  3776			ap->length = 0;
  3777		}
  3778		return 0;
  3779	}
  3780	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
