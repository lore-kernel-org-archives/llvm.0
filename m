Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A712566E2;
	Tue,  4 Nov 2025 15:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762270709; cv=none; b=O1mzA6KM7DqM73dGIFgrmbA8NErIHgSQUg5Uc6fsSXfh0n4AD55+TjQVNkbeZTErzQHv5q7giC8hdBt4pAWDMj6Y2dvEwVSDGekiR9gZJv2TnE1ETsbJF47gf8pI44PtnqtDtUcOxyFS9SbqT1O5YZhdU7h0A2CfO2VnQnOuCxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762270709; c=relaxed/simple;
	bh=Cy2J3fuWY60QkQU2M8ngzJ5eZQ2C5WxBRZsDSPR2PEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YTkwJmoOZNnjF8K4R7TSrIiMfl0j7EnVAcxJ1DY4DP0q2GWiZaC18ShUIaeosvkknWhgytTwFK4aKzgAQwajZEhEWmpmPR9dgNoDhnbX27EVXnMM3pb/sw0cmxajF2ihQokD3fj0BA9uQKgIOeypVq7mbL5vobeGj3mBRXxuDGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QOScfZaH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QOScfZaH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77FE7C116B1;
	Tue,  4 Nov 2025 15:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762270708;
	bh=Cy2J3fuWY60QkQU2M8ngzJ5eZQ2C5WxBRZsDSPR2PEk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QOScfZaHZ3az+dDuP50EvzmdN+lL8yV1bHUDHlYcjWAsL7QLDE3XzC0dRkfwZdr/q
	 tkzFsQoAh0QnlQr2erUlAfdglfTB/KIsIcTX+Mfa8mAe48pOr8bu+FEkys4Eboxluz
	 J2oFcJEmCXMsCJDf/BQRZjhDxVWs9otbXK2ODvX5ksOFoolvGOUktMBRGAVeImYsx+
	 cKBl8MJQyk4mQijeqp5yk+NU6LCNCan3LRmZiVX3mv6w2hqXuo8659s4WTS7jE0ADJ
	 zzz5u55ggzwP2KKYkyH1uzrQgpgZnf1c3uTFd/TH1gMuPcPzZSecVnABD5GgRNAP0s
	 ru4zV22/FXINA==
Date: Tue, 4 Nov 2025 17:38:22 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	kernel test robot <lkp@intel.com>
Subject: Re: [linux-next:master 4972/5926]
 kernel/kexec_handover_debug.c:16:18: error: use of undeclared identifier
 'kho_scratch_cnt'
Message-ID: <aQod7jDFBjw9T-u2@kernel.org>
References: <202511042251.paO6f5BZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202511042251.paO6f5BZ-lkp@intel.com>

(adding Pasha)

On Tue, Nov 04, 2025 at 10:48:31PM +0800, kernel test robot wrote:
> Hi Mike,
> 
> First bad commit (maybe != root cause):
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   17490bd0527f59d841168457b245581f314b5fa0
> commit: 8c211175c3abcebb8bffce8095d78d193e482105 [4972/5926] liveupdate-kho-warn-and-fail-on-metadata-or-preserved-memory-in-scratch-area-fix
> config: x86_64-randconfig-071-20251104 (https://download.01.org/0day-ci/archive/20251104/202511042251.paO6f5BZ-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251104/202511042251.paO6f5BZ-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202511042251.paO6f5BZ-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> kernel/kexec_handover_debug.c:16:18: error: use of undeclared identifier 'kho_scratch_cnt'
>       16 |         for (i = 0; i < kho_scratch_cnt; i++) {
>          |                         ^
> >> kernel/kexec_handover_debug.c:17:19: error: use of undeclared identifier 'kho_scratch'
>       17 |                 scratch_start = kho_scratch[i].addr;
>          |                                 ^
>    kernel/kexec_handover_debug.c:18:17: error: use of undeclared identifier 'kho_scratch'
>       18 |                 scratch_end = kho_scratch[i].addr + kho_scratch[i].size;
>          |                               ^
>    kernel/kexec_handover_debug.c:18:39: error: use of undeclared identifier 'kho_scratch'
>       18 |                 scratch_end = kho_scratch[i].addr + kho_scratch[i].size;
>          |                                                     ^
>    4 errors generated.
> 
> 
> vim +/kho_scratch_cnt +16 kernel/kexec_handover_debug.c
> 
> 4039a00022d42a Pasha Tatashin 2025-10-20  10  
> 4039a00022d42a Pasha Tatashin 2025-10-20  11  bool kho_scratch_overlap(phys_addr_t phys, size_t size)
> 4039a00022d42a Pasha Tatashin 2025-10-20  12  {
> 4039a00022d42a Pasha Tatashin 2025-10-20  13  	phys_addr_t scratch_start, scratch_end;
> 4039a00022d42a Pasha Tatashin 2025-10-20  14  	unsigned int i;
> 4039a00022d42a Pasha Tatashin 2025-10-20  15  
> 4039a00022d42a Pasha Tatashin 2025-10-20 @16  	for (i = 0; i < kho_scratch_cnt; i++) {
> 4039a00022d42a Pasha Tatashin 2025-10-20 @17  		scratch_start = kho_scratch[i].addr;
> 
> :::::: The code at line 16 was first introduced by commit
> :::::: 4039a00022d42ac3d68b2eea63066bc9f7ef89ce kho: warn and fail on metadata or preserved memory in scratch area
> 
> :::::: TO: Pasha Tatashin <pasha.tatashin@soleen.com>
> :::::: CC: Andrew Morton <akpm@linux-foundation.org>
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

-- 
Sincerely yours,
Mike.
