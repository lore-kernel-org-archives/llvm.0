Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DA71805B;
	Wed, 14 May 2025 01:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747184789; cv=none; b=FA6Z88yMx4rcM7AIuRhki2G6q3hvzPxuVxdyUsZYtlxHCJ3H2YCXENVFm57ICGmSwJSD4/M0CyN0A005ez1dGAX6+x3kqu6YdRGFCxZqfn6yFJkMLyRXWnFjh9b2JOexT3vReqS7i5v3K732J6poQl0u3H3hAO7YIqCa44QyVC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747184789; c=relaxed/simple;
	bh=NJ0b30KBaX9VelElH0H7+UsyL/b/km+fKJDIlff0YIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WlYHbx3AbvGMl+BGEeJh0NJ30oWSwEv3+mek/LaRiMa6XLA3EH2sGZ+lbkrUQOfKXuFaqpGuUhlOFbGzb5SA+cJMkxGXVtAn1nCR5TlDsSoV2yAwbg/nX6oPe8FyvJcdaICTIneu1IHxp15I0gKrwBEHKVr9vZMoDUSDrDKoKoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mWQXa6rm; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mWQXa6rm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747184787; x=1778720787;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NJ0b30KBaX9VelElH0H7+UsyL/b/km+fKJDIlff0YIQ=;
  b=mWQXa6rmWxw4yQIyaU5BLJS9nCNfR0ariVLdomOAjsyGzZ6WnNNF6O0G
   1f9w/N/lbHqw5tSdIeV2v8huw+4fA4+NAemcspwuYoQwL4RacwJJrlAbP
   sy3Q074mhqfzYg72CDM+zxHpXWkTrY3vD7Ch2Cl2lfeI6PR5RUdyhuTvs
   n2Y55PTB3ErTNCuJZkvW9zzxEYD+vuQ4ZSgLKxue9Lv/6qDo99+aSYV/a
   rur+xJUa5d7fpdeo76EmArAp8X/s18IyVB0Ej/VNt4vm5Le9iI+6vEbVe
   MNEm/LTvNhH3ASXd4nimqcS+zNlpGmkkOyz3Xbqz9Mhb268BN3qUmX3xh
   A==;
X-CSE-ConnectionGUID: +uGpv52FRimzCTa70PkoAA==
X-CSE-MsgGUID: GgnwFuGCQUOpVWsqSSOIzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="48170797"
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; 
   d="scan'208";a="48170797"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 18:06:26 -0700
X-CSE-ConnectionGUID: xZU5yL4HQSeNHMYaJpQRpA==
X-CSE-MsgGUID: KeDHipFnTNKH2qHW0fUn4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; 
   d="scan'208";a="138378166"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 May 2025 18:06:25 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uF0Zi-000GYe-2d;
	Wed, 14 May 2025 01:06:22 +0000
Date: Wed, 14 May 2025 09:05:43 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jfern:nova/sequencer 5/9]
 drivers/gpu/nova-core/nvfw/r570_144_bindings.h: warning: ignored by one of
 the .gitignore files
Message-ID: <202505140855.tihMj8uO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova/sequencer
head:   246c38c07bbe2dab172d908da953e3baf44b9693
commit: 4a21552e9ef5b6729524eb24288a9a91d4cfff72 [5/9] JOEL: Update .gitignore
config: arm-randconfig-002-20250514 (https://download.01.org/0day-ci/archive/20250514/202505140855.tihMj8uO-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250514/202505140855.tihMj8uO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505140855.tihMj8uO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/nova-core/nvfw/r570_144_bindings.h: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
