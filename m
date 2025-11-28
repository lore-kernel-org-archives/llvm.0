Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF3F2AEE4;
	Fri, 28 Nov 2025 03:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764300472; cv=none; b=Lo2SYoOu12cLyn4CvrgSEqtHTh/VBGo2Rgo+Cg0pu5eIMADRR6vNHKiVxf+Jd54a5OGx1GF7FAzCyx+SHStSnwQGiLIMNhK+xUVvUyt+8opTuVZVJjNKFkZ58M9dH+iSFvV9Pw6rhyLlNoAyUsrzbDt8G2n4XKOhY1f/2BZ5cWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764300472; c=relaxed/simple;
	bh=bL7R1sPB35UMIRFSKgSootUfsdYsQLhKiDreJ8A29Bs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tyYYEbbLW/TaHxBVbv0cz/pNGoNd2mMKSkRshWiV1UH10gj7wcZ7QBCfk6V3GRfmBVydEdCy6rmHzTu/SOX4op8JnGnHN/9wGtADcxj3Egpd+UNQzogkfVSPI4IhRKf/FOXu5bo64ijQ3+Od8BbF3/rRnCJx4BtzCzVRTBBuG/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ViBUbKRA; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ViBUbKRA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764300472; x=1795836472;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bL7R1sPB35UMIRFSKgSootUfsdYsQLhKiDreJ8A29Bs=;
  b=ViBUbKRA2tL+R+Gn0R+x3pBMJK4RVAq3fHcrdKvQnM7McORS2CxUSiV5
   QgGsnEVGzQc7YHptdP4aWTQaLBtaOfqUcbhAP0ZlV4aAVnJkg6JO6ff5U
   H+kXruhbs5LNqL+9LQiq190X/mJf9xwopjE+XymPs7qn8NG9tSm5FKrMc
   y/lI7Zrk7Ger06T0nf/LAsunG4kRPOMJ1zT680lgEQNnyPKQK6J3Rbnvr
   URmQmQw+HCN0yw1QmgS67JBMxaQ5654mPY4X71nB2+4jRvE9MDPX6bjge
   /WDuuMOXHg9ppPiGVcKyKNcpynbiJBogbxSmm+PgWEewPGTSy7Q9E3gU0
   w==;
X-CSE-ConnectionGUID: W/Ty+SlZTB28eYUIR9GcTw==
X-CSE-MsgGUID: DzRUM/5mRHGtd2eTRz01zQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="88980906"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="88980906"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 19:27:51 -0800
X-CSE-ConnectionGUID: irUJX32mTeylTqOkkk53bA==
X-CSE-MsgGUID: cVGX9mwjROemAM6/s/HuqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="198314704"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 27 Nov 2025 19:27:49 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOp99-000000001vF-1Img;
	Fri, 28 Nov 2025 03:27:47 +0000
Date: Fri, 28 Nov 2025 04:27:17 +0100
From: kernel test robot <lkp@intel.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 4/5] guest_memfd: add support for userfaultfd minor
 mode
Message-ID: <202511280435.kT9zhWyV-lkp@intel.com>
References: <20251125183840.2368510-5-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125183840.2368510-5-rppt@kernel.org>

Hi Mike,

kernel test robot noticed the following build errors:

[auto build test ERROR on 6a23ae0a96a600d1d12557add110e0bb6e32730c]

url:    https://github.com/intel-lab-lkp/linux/commits/Mike-Rapoport/userfaultfd-move-vma_can_userfault-out-of-line/20251126-024059
base:   6a23ae0a96a600d1d12557add110e0bb6e32730c
patch link:    https://lore.kernel.org/r/20251125183840.2368510-5-rppt%40kernel.org
patch subject: [PATCH v2 4/5] guest_memfd: add support for userfaultfd minor mode
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20251128/202511280435.kT9zhWyV-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251128/202511280435.kT9zhWyV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511280435.kT9zhWyV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kvm/../../../virt/kvm/guest_memfd.c:401:22: error: redefinition of 'kvm_gmem_get_folio'
     401 | static struct folio *kvm_gmem_get_folio(struct inode *inode, pgoff_t pgoff)
         |                      ^
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:100:22: note: previous definition is here
     100 | static struct folio *kvm_gmem_get_folio(struct inode *inode, pgoff_t index)
         |                      ^
   1 error generated.


vim +/kvm_gmem_get_folio +401 arch/x86/kvm/../../../virt/kvm/guest_memfd.c

   399	
   400	#ifdef CONFIG_USERFAULTFD
 > 401	static struct folio *kvm_gmem_get_folio(struct inode *inode, pgoff_t pgoff)
   402	{
   403		struct folio *folio;
   404	
   405		folio = kvm_gmem_get_folio(inode, pgoff);
   406		if (IS_ERR_OR_NULL(folio))
   407			return folio;
   408	
   409		if (!folio_test_uptodate(folio)) {
   410			clear_highpage(folio_page(folio, 0));
   411			kvm_gmem_mark_prepared(folio);
   412		}
   413	
   414		return folio;
   415	}
   416	#endif
   417	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
