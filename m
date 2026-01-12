Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357E833E352;
	Mon, 12 Jan 2026 20:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768250037; cv=none; b=lhs9juyPTnQvZqxnDMfgZguXW4y5SHm8/I7/s8Fs0Mt0iUQYbTTDdvx5n63OAvKHBpYxkUfWKFKjS9oC1YMN5WFDds4U4fs8x4StQqbT3CI/E3HfCuHLjFGrk6iOHrzpGHbwEd3Xs2tg+TJsM1Jckm6EG/ctfHj2EO+pTqWWWx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768250037; c=relaxed/simple;
	bh=8BX5GpPt9sxcVrHLpwm2pr6ypxDcKVN5RIY9nBUe9jc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tkJ5uR3U2XgDT8yf0t5KYx+RWHCtzmXIahCDYi82TA6AdCUllpnS9I3Rv/T4l/mm4JwFg1dkLo1yVzScTDoJONJXJ66PXD/WX7M+n0YyC6V1iF05S7BngSj1b+VWXpCoRoXH4P1izH4BqTzzgVw2RjUi0FPejhREEob+6PBXmPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cgu6iFAy; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cgu6iFAy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768250036; x=1799786036;
  h=date:from:to:cc:subject:message-id;
  bh=8BX5GpPt9sxcVrHLpwm2pr6ypxDcKVN5RIY9nBUe9jc=;
  b=cgu6iFAyLvHgkGERqbcWjc+ne9R7X9lhyRRb/CXUHH7r4A7W3HRq/Zp4
   Nx8tshEeZUJ+WWZnr27RVIvS++EyFTvJgf07Ril7QYKw0I5RMGoIT3hmb
   DghOq65AQ28nyAXYt9nQkHg4S0GYxNTCpcPk8OPdFdpqAJqAwRw9dV17+
   j7XqqjALk3yJH9GhIRdE240FsX9hrY2oXaBNXjlQiI2PES1hCgBaqiXCa
   IzegWvFNFKUPAGlffwqKNGI1NtfZkZVHRN3gh60Lb8NGxczpPkFpPadte
   InrC2gsHCYuUd9xMOu5f3V1BLABzb0T0d5vmUfcGyUtGADkAnNwU/wTsn
   g==;
X-CSE-ConnectionGUID: 2sjpHeosSJyLiTKl/rqyag==
X-CSE-MsgGUID: vZUMZmb8ToWxNdJofBD21Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="73164092"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="73164092"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 12:33:54 -0800
X-CSE-ConnectionGUID: WArX1HSEQmWC338DwGdspg==
X-CSE-MsgGUID: OMxjS0bMRZOktnulur4ZDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="209021980"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 12 Jan 2026 12:33:53 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfObm-00000000Dqo-1dXn;
	Mon, 12 Jan 2026 20:33:50 +0000
Date: Tue, 13 Jan 2026 04:33:05 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-next 13/17] net/core/skbuff.c:7280:33:
 error: use of undeclared identifier 'bvec'
Message-ID: <202601130437.tJhWp6uK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-next
head:   8dc07632381d372883f12b9ca6da7438ce683a33
commit: 586e10988ec72acea43cbc695cec236fd69c57f3 [13/17] net: Perform special handling for a splice from a bvecq
config: i386-randconfig-011-20260113 (https://download.01.org/0day-ci/archive/20260113/202601130437.tJhWp6uK-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601130437.tJhWp6uK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601130437.tJhWp6uK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/core/skbuff.c:7280:33: error: use of undeclared identifier 'bvec'
    7280 |                 void *kaddr = kmap_local_bvec(bvec, offset);
         |                                               ^
   1 error generated.


vim +/bvec +7280 net/core/skbuff.c

  7265	
  7266	static __always_inline
  7267	size_t iterate_one_bvec(struct bio_vec *p, size_t skip, size_t len,
  7268				void *priv, void *priv2, iov_step_f step)
  7269	{
  7270	#ifdef CONFIG_HIGHMEM
  7271		size_t progress = 0;
  7272	
  7273		if (skip >= p->bv_len)
  7274			return 0;
  7275	
  7276		len = umin(len, p->bv_len - skip);
  7277		while (len > 0) {
  7278			size_t remain, consumed;
  7279			size_t offset = p->bv_offset + skip, part;
> 7280			void *kaddr = kmap_local_bvec(bvec, offset);
  7281	
  7282			part = umin(len, PAGE_SIZE - offset % PAGE_SIZE);
  7283			remain = step(kaddr, progress, part, priv, priv2);
  7284			kunmap_local(kaddr);
  7285	
  7286			consumed = part - remain;
  7287			len -= consumed;
  7288			progress += consumed;
  7289			skip += consumed;
  7290			if (remain)
  7291				break;
  7292		}
  7293	
  7294		return progress;
  7295	#else
  7296		return len - step(bvec_virt(p) + skip, 0, len, priv, priv2);
  7297	#endif
  7298	}
  7299	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
