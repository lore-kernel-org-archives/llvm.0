Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E760A41;
	Tue,  5 Aug 2025 01:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754356833; cv=none; b=E8QnHi5+I1NdS39K3oK2K/U4lI0qYcOEVSg80drJBBBYTSSz21bn52gjj9lmtsYVTJvk953CvzW9i/e4DH/Afnrp6Qm232bgkUFLaz0m6cGwBc1Qdp/Ccsv9RTK3HFf8lIw/6AU49344IsnwkpLBJoqyvs9Luh7b9GrV0yUIJ3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754356833; c=relaxed/simple;
	bh=3TK5NuTlj5f5BuNbmc030Sp7GuaGongNzpzt5+AGsiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m2lbFWAwNAy9bkfYTmqlgRd7OSXpFb3B1I/JTWIZTZx6dQjqFU3l3wxs9AeBwUtN/CXq9aHLikD4q0l4mhtEDHSs0VerFoYBX4OmCNLzIOVHAqFmQsypfLrWLs0KoyYATGBOK4eWut01HgCUxSyViTFbj1j8Cj/orEL3VtTexX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fRz+G05x; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fRz+G05x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754356832; x=1785892832;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3TK5NuTlj5f5BuNbmc030Sp7GuaGongNzpzt5+AGsiQ=;
  b=fRz+G05xv37uFjgZiSptvR77hmm9olvIDkXNqWTWUF/4dOqePiQLyyjg
   P/szfHtPrJUhjRw/rHACLWRAqyDSThhfFBDlimagrxPMW/+wyqNGxf5HM
   KYzbKX4aE6T/nGUASD0L5CO+py2hUHCkhaUfch1CMp9j2mPOwTek6F2wc
   l4BOqG+Y3B27NwpxWw7/c1lIWeiEhJDe33qa5dPK05w6HhvWiy9EIvQTQ
   CuqFNL+fq5tZUF92t62+Y5wsKqC0pHHnNhid8sy0lEDCTAB/ZeAUmAzdc
   y0fJlhoVE1rPzev3ak9EteMxDHnIgF7DCkjPiW+GgujS6QBiIlEd/tqod
   w==;
X-CSE-ConnectionGUID: VUGL8bK/QJe/vge+XbL2SA==
X-CSE-MsgGUID: xvvVy4vrToytHUp0OOqFlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="55843761"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; 
   d="scan'208";a="55843761"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 18:20:31 -0700
X-CSE-ConnectionGUID: /GTsUFOLQuetAzXaQ8WgQQ==
X-CSE-MsgGUID: e6SRY+l7QU2EFzanGKwSEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; 
   d="scan'208";a="168508367"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 04 Aug 2025 18:20:30 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uj6Ls-0000MN-11;
	Tue, 05 Aug 2025 01:20:28 +0000
Date: Tue, 5 Aug 2025 09:19:56 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/250-aop 58/85] warning: associated items `zeroed`
 and `as_raw` are never used
Message-ID: <202508050919.LC8FqyKy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/250-aop
head:   800be80e4ce2e4872e0d8f2716b2b7c79a0511ef
commit: 589bf67694fd455396952ab520e7219e3b2ae481 [58/85] rust: io: resource: Add owned Resource initialiser
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250805/202508050919.LC8FqyKy-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250805/202508050919.LC8FqyKy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508050919.LC8FqyKy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: associated items `zeroed` and `as_raw` are never used
   --> rust/kernel/io/resource.rs:93:19
   |
   91  | impl Resource {
   | ------------- associated items in this implementation
   92  |     /// Create a new zeroed [`Resource`]
   93  |     pub(crate) fn zeroed() -> Self {
   |                   ^^^^^^
   ...
   100 |     pub(crate) fn as_raw(&self) -> *mut bindings::resource {
   |                   ^^^^^^
   |
   = note: `#[warn(dead_code)]` on by default

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
