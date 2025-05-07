Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2EF148832;
	Wed,  7 May 2025 09:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746608484; cv=none; b=SIihKiNK9wNOlA0Tg3j+AWfI4l8/RPXvQyEtMA+s4r+534uDLoPQyanvIYg+yDUhSDMlVxGHcmaRPYuLCByYS8Ne9uF2K1waK6O3lSNe1dIir+SLAUSBVMnKcky4ThMAxjREyCtfc1TXyc0Zy2kkPRsHWF68nKTjJhtivKkwsH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746608484; c=relaxed/simple;
	bh=cB1ssunMZ2hnfS0Tfp2M5BYgWLLpSS38QwQRDoJmO3I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l63BzZT+EPjR29N/4A1HX9MffSmOwpKlPIr9xzzSwHbRx69fyJNC1mbYQ3qGSS3P2y2ZP/+kO8PDJ57dZoZ+XnteM+2SkGEIUJG6dMKJWOhWs+a+H04eEvCg6pm5cY6gkFHU9ebistu85NF7r2JCd/AZ9d3+VEzyYMFL/Fh16LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AWwH1HXa; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AWwH1HXa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746608482; x=1778144482;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cB1ssunMZ2hnfS0Tfp2M5BYgWLLpSS38QwQRDoJmO3I=;
  b=AWwH1HXaHWlp5mv0xMefCp8vdRiYj8UZgMLJ4qg/zus6Oq/OlPbTouxc
   VxTF5l0ilH4djU2SRFIfMRp1tHhHB+XRQjTvYfnECQ9Hh1Bj+m2C3jZuD
   JiAQlEz2HymrChOPI8XFG1WJ1OBR6yISjJBNaT1FULE7shufIKUzIC4Qc
   9ko2vsfiOfufFxOAJhODez104QhCorc5Yw8Sfp7QWe1Bv9vMJH+t5NTb0
   EJr7zdqcVj4QZYPZ2Ilj82rQ7dgr65iFJmxpkGX6XkRSrMGI/ZEttsWSz
   atuj6duEPDLxz7Uaj+zQgWAoeazE0vKtouQ7kbcXNaVYAVkHyJhjGcdch
   g==;
X-CSE-ConnectionGUID: R5b0THQlQLCpRD8CPonzyg==
X-CSE-MsgGUID: /RbIRhBAQCi472VgrB2+gQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="73716008"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="73716008"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 02:01:22 -0700
X-CSE-ConnectionGUID: oolfkHEQQBSOTa3kJD4hTQ==
X-CSE-MsgGUID: C7JJUk5AStaZPWiev+WPgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="135797172"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 07 May 2025 02:01:21 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCaeT-0007SL-1r;
	Wed, 07 May 2025 09:01:17 +0000
Date: Wed, 7 May 2025 17:01:09 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:nfs-client-leak 2/8] fs/nfs/pnfs.c:565:30: error: no member
 named 'pls_tracker' in 'struct pnfs_layout_segment'
Message-ID: <202505071627.0GqP7WYb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git nfs-client-leak
head:   6af305fb6b4bb0b9b5330286b4c66daf076b1145
commit: e805e02639509963455233d10a03edf7cbd38ee9 [2/8] nfs: add refcount tracking to pnfs_layout_segment
config: arm-defconfig (https://download.01.org/0day-ci/archive/20250507/202505071627.0GqP7WYb-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071627.0GqP7WYb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071627.0GqP7WYb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/nfs/pnfs.c:565:30: error: no member named 'pls_tracker' in 'struct pnfs_layout_segment'
     565 |         ref_tracker_dir_init(&lseg->pls_tracker, 128, "pnfs_layout_segment");
         |                               ~~~~  ^
   fs/nfs/pnfs.c:573:31: error: no member named 'pls_tracker' in 'struct pnfs_layout_segment'
     573 |                 ref_tracker_dir_exit(&lseg->pls_tracker);
         |                                       ~~~~  ^
   fs/nfs/pnfs.c:2599:30: error: no member named 'pls_tracker' in 'struct pnfs_layout_segment'
    2599 |         ref_tracker_dir_exit(&lseg->pls_tracker);
         |                               ~~~~  ^
   3 errors generated.


vim +565 fs/nfs/pnfs.c

   551	
   552	static void
   553	pnfs_init_lseg(struct pnfs_layout_hdr *lo, struct pnfs_layout_segment *lseg,
   554			const struct pnfs_layout_range *range,
   555			const nfs4_stateid *stateid)
   556	{
   557		INIT_LIST_HEAD(&lseg->pls_list);
   558		INIT_LIST_HEAD(&lseg->pls_lc_list);
   559		INIT_LIST_HEAD(&lseg->pls_commits);
   560		refcount_set(&lseg->pls_refcount, 1);
   561		set_bit(NFS_LSEG_VALID, &lseg->pls_flags);
   562		lseg->pls_layout = lo;
   563		lseg->pls_range = *range;
   564		lseg->pls_seq = be32_to_cpu(stateid->seqid);
 > 565		ref_tracker_dir_init(&lseg->pls_tracker, 128, "pnfs_layout_segment");
   566	}
   567	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
