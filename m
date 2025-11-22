Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACB51FF7BC;
	Sat, 22 Nov 2025 14:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763820651; cv=none; b=WbURQ+drtIPEFBq9i5KnwKXzUUrKUlfCdeLO484g56liOiaTDsue9AAJtHvVwO/Ac1vkIt9AWw90mrryBZXvkk9KEiMe3gzCs/BBbpy09yT8Igorlnn7dCoJ7TI/3s00eBYJQY8c+q4guCCbkb5cwzpT8jiqfPJetIULZJpqAkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763820651; c=relaxed/simple;
	bh=YbN9mKHHNXtcGsxvQBPj/UvTK0B/6cKHEbw9qnuhfQs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eWwO7KCujwa6I5Gq6ThIIKO+QZS7/rNSrd7bffpOIkQRcLs/KpHNBqrnZySjFGnAqTlOV+ARSoMzUYPjRYCLDEQYYkgtK9tmDSx2308jHEY3XFNO/gBe2ZjrQd9OXmCSI5GvLPR2SNUnyYJ94Lfw8M77d+rG6nd02+zpeargORM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ny1l6zpx; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ny1l6zpx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763820650; x=1795356650;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YbN9mKHHNXtcGsxvQBPj/UvTK0B/6cKHEbw9qnuhfQs=;
  b=ny1l6zpxwjxiNGinbYwx/Z24azMsGAreVWdWnPGSMkt3SBjcjwpj/Sdd
   q6U/c8q7km2a0j6Xs+PXQx1k+agSJnssOyoCknii//ap7R1VUVyF8J/Hz
   xhOykTFG8bEzD81uNtq5npu3tw34GJ6MoidIQTPXj8ecQmGm0SKzsCoF6
   JtPan91qNjGYKBZm9mX1E8o7/ayAwQm+g8cNKh0xXs6mCf9rsEoQ7HcEN
   jadYPZt2WarsEF+1+VXdpwV1UKFSqwaIax1ZZOxDyR1ML9WZxyd8x2uwc
   8t7iaKX4Ef5RE9cTu8eG6/8fPN+0yiRMuGxvozbumKE29iEcLK1fCr5Ij
   g==;
X-CSE-ConnectionGUID: yHSKP5hiSVKy7si+0YIWdg==
X-CSE-MsgGUID: 3sODVOthRyeDC0lH6mtz1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="66052257"
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="66052257"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 06:10:48 -0800
X-CSE-ConnectionGUID: u2DitLsCQna0/TpSvfBQvg==
X-CSE-MsgGUID: SI3cEa4IRaygOd1MVsBJ8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="222877261"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 22 Nov 2025 06:10:47 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMoK5-0007Zz-0R;
	Sat, 22 Nov 2025 14:10:45 +0000
Date: Sat, 22 Nov 2025 22:10:32 +0800
From: kernel test robot <lkp@intel.com>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [cel:nfsv3-xdrgen 54/63] fs/nfsd/xdr3.h:247:20: error: field has
 incomplete type 'struct nfsd_attrs'
Message-ID: <202511222219.KDWogUrH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsv3-xdrgen
head:   9800773e205f87c3811bef2f1837a30e969c7687
commit: 10ec55d7aca3286d82f1228529656ab0b3c8a673 [54/63] NFSD: Use xdrgen XDR functions for NFSv3 SETATTR procedure
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20251122/202511222219.KDWogUrH-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251122/202511222219.KDWogUrH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511222219.KDWogUrH-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/nfsd/nfs2acl.c:13:
>> fs/nfsd/xdr3.h:247:20: error: field has incomplete type 'struct nfsd_attrs'
     247 |         struct nfsd_attrs       nattrs;
         |                                 ^
   fs/nfsd/xdr3.h:247:9: note: forward declaration of 'struct nfsd_attrs'
     247 |         struct nfsd_attrs       nattrs;
         |                ^
   1 error generated.


vim +247 fs/nfsd/xdr3.h

   242	
   243	struct nfsd3_setattr3args {
   244		struct SETATTR3args	arg;
   245		struct svc_fh		fh;
   246		struct iattr		iattrs;
 > 247		struct nfsd_attrs	nattrs;
   248	};
   249	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
