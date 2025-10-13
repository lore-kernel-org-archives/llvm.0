Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47EF3270576;
	Mon, 13 Oct 2025 12:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760358503; cv=none; b=RvNZvEvVkpGza1xZOiWRT+DRBMzgO0ONKng+nBibvm0685pTTXDY1npMoPoOpqM0LeicZ4bf1bsL4oj+60QFGaA/kRpidgzFhU4Nh3tKHNGRu5CB0zPywgo2pk1o34kL6KW87SwCUqAY7LCtoB7Yy4GKvxAE9Dox0CkvPv/4LMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760358503; c=relaxed/simple;
	bh=062beN90GWCCZdiCP0fTDtp5gYxwQtheCLAnof9Ihbs=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tpN/4jP1dNJ1qnOoVIwIg08A0IuVFG7gOEwzlYh5LxncNlvbEhoKfVeaZ+0nAF0nzmGJrTavWQ2FKe1y28nmPge03mrtebb64oDNgyPex+ne4vs8tDTg0zTThZghqlBKiS1/OB407bgOFzMXHhcZvX9ezWB1lGRBkB1oHOnW1Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jb+NHj2q; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jb+NHj2q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760358502; x=1791894502;
  h=date:from:cc:subject:message-id:mime-version;
  bh=062beN90GWCCZdiCP0fTDtp5gYxwQtheCLAnof9Ihbs=;
  b=jb+NHj2qCKD9luVrnB2353qMhx/tDe0OE6yyFkzF+9nZszFAA3B8X6dA
   dsSJEYW7vnYAfg7lu/hbrzMhYGLhtltlOJMdO8IZU5qFX9PJoYsZvKuv3
   vUeIRVu5lWAW1XIHftEx11LaD8LNlHX1wxTSFpPZW3xkKyttGOpWbsU3T
   qk1ZsRC6DnFymHtzTy8B5EOXcB4gfI6Z2LUi+RfRGWCgCpcuxodQrjqev
   Rgj+KurEsVCcailHPXxnMOzfN5iglUyNcNxr6bFoscSuSgkBPnaQ64SVW
   uXNdWigzLYo84NudYvt/Nk8dpw7TTcy7bi71QnQD7/1ZkW67VxnC4qnPu
   Q==;
X-CSE-ConnectionGUID: qoVThwOORFykABIEbYF3zQ==
X-CSE-MsgGUID: cvptwfb1RQ6xL3HRdPQ3YA==
X-IronPort-AV: E=McAfee;i="6800,10657,11580"; a="73840273"
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; 
   d="scan'208";a="73840273"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2025 05:28:20 -0700
X-CSE-ConnectionGUID: 4EQwnOmmSQ2xuh+b1ZiVMg==
X-CSE-MsgGUID: Z07tOXdFR4+9UXpDxr4yNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; 
   d="scan'208";a="212209652"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by orviesa002.jf.intel.com with ESMTP; 13 Oct 2025 05:28:19 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v8Hey-000000008sb-2R5a;
	Mon, 13 Oct 2025 12:28:16 +0000
Date: Mon, 13 Oct 2025 14:27:18 +0200
From: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jeff Layton <jlayton@kernel.org>
Subject: [jlayton:kdevops 1/3] fs/nfsd/nfsfh.c:699:16: warning: unused
 variable 'inode'
Message-ID: <202510112203.B1ZqlPPr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git kdevops
head:   111666a803b9733b5c590aec6312443ad3dac2f5
commit: 177818f176ef904fb18d237d1dbba00c2643aaf2 [1/3] Merge branch 'mrchuck/nfsd-next'
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20251011/202510112203.B1ZqlPPr-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251011/202510112203.B1ZqlPPr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510112203.B1ZqlPPr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/nfsd/nfsfh.c:699:16: warning: unused variable 'inode' [-Wunused-variable]
     699 |         struct inode *inode = d_inode(p.dentry);
         |                       ^~~~~
   1 warning generated.


vim +/inode +699 fs/nfsd/nfsfh.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  684  
c1f203e46c55ac Chuck Lever    2025-07-02  685  /**
c1f203e46c55ac Chuck Lever    2025-07-02  686   * fh_getattr - Retrieve attributes on a local file
c1f203e46c55ac Chuck Lever    2025-07-02  687   * @fhp: File handle of target file
c1f203e46c55ac Chuck Lever    2025-07-02  688   * @stat: Caller-supplied kstat buffer to be filled in
c1f203e46c55ac Chuck Lever    2025-07-02  689   *
c1f203e46c55ac Chuck Lever    2025-07-02  690   * Returns nfs_ok on success, otherwise an NFS status code is
c1f203e46c55ac Chuck Lever    2025-07-02  691   * returned.
c1f203e46c55ac Chuck Lever    2025-07-02  692   */
c1f203e46c55ac Chuck Lever    2025-07-02  693  __be32 fh_getattr(const struct svc_fh *fhp, struct kstat *stat)
c1f203e46c55ac Chuck Lever    2025-07-02  694  {
c1f203e46c55ac Chuck Lever    2025-07-02  695  	struct path p = {
c1f203e46c55ac Chuck Lever    2025-07-02  696  		.mnt		= fhp->fh_export->ex_path.mnt,
c1f203e46c55ac Chuck Lever    2025-07-02  697  		.dentry		= fhp->fh_dentry,
c1f203e46c55ac Chuck Lever    2025-07-02  698  	};
81538c8e42806e Linus Torvalds 2025-10-06 @699  	struct inode *inode = d_inode(p.dentry);
c1f203e46c55ac Chuck Lever    2025-07-02  700  	u32 request_mask = STATX_BASIC_STATS;
c1f203e46c55ac Chuck Lever    2025-07-02  701  
737a72eed2e505 Chuck Lever    2025-09-29  702  	if (d_is_reg(p.dentry))
6f322e6110a628 Mike Snitzer   2025-09-29  703  		request_mask |= (STATX_DIOALIGN | STATX_DIO_READ_ALIGN);
6f322e6110a628 Mike Snitzer   2025-09-29  704  
c1f203e46c55ac Chuck Lever    2025-07-02  705  	if (fhp->fh_maxsize == NFS4_FHSIZE)
c1f203e46c55ac Chuck Lever    2025-07-02  706  		request_mask |= (STATX_BTIME | STATX_CHANGE_COOKIE);
c1f203e46c55ac Chuck Lever    2025-07-02  707  
c1f203e46c55ac Chuck Lever    2025-07-02  708  	return nfserrno(vfs_getattr(&p, stat, request_mask,
c1f203e46c55ac Chuck Lever    2025-07-02  709  				    AT_STATX_SYNC_AS_STAT));
c1f203e46c55ac Chuck Lever    2025-07-02  710  }
c1f203e46c55ac Chuck Lever    2025-07-02  711  

:::::: The code at line 699 was first introduced by commit
:::::: 81538c8e42806eed71ce125723877a7c2307370c Merge tag 'nfsd-6.18' of git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux

:::::: TO: Linus Torvalds <torvalds@linux-foundation.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
