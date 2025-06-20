Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069A7EBE;
	Fri, 20 Jun 2025 00:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750377724; cv=none; b=rkbwcGYwoW1T2H324FjhByOHIwQlwybOKlJX/UrXOWUU30fJmWwbTqFq4vhbrOO5bFLrfoodWoBkAkw3zUPWSVNE23MtFqsCXMmjExxfrZowFNe6giuEJ6k+JsRGhWVjWM71A462dkmKNWNDIAf6klyvejSSkjvfrpxsdoolac4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750377724; c=relaxed/simple;
	bh=pcxHMNTqZnA5m+9XpTrrTWFDeVlHehoNu/2R24iyzrU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A7ync2WkAtr0Dy8TP1CQ16EpIf0DCI+bDyI/vE7YoTC5gZNDgTnHp0MDemwoUCUxSHql0fIWd4texn9t9dVsy6LoHC+JblNqQPSukseafQpx/Ac9apT7aC9GSF/hEiQ+DbIUItE5H66h0TnDCfOL4Jpd9zmvUg0zjKQYVpdwcPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JVp9VxI5; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JVp9VxI5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750377723; x=1781913723;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pcxHMNTqZnA5m+9XpTrrTWFDeVlHehoNu/2R24iyzrU=;
  b=JVp9VxI5REyEQSSRon+XOu1XWEKHzTxKaPwGrxaFun8A06A5wLFPyZDn
   sd2OmCBovWkspZin0i67mlHW0dU+mhUdRx5Y+yhhN7nQ9UIgzuFAW0ytT
   KfKtZk+TRaMmwJ9OurUjVtf5jTTTan5F/oNRQTyd/mJcZRXFutKox8W2l
   dxMGDtS9hJ+zuq7E1e/ItbCU34g3fK1AA6pu4VRVkOJofvXnbxTb6Yse+
   lS02UpuWpQLtAbsdlnxI/HY1FI4IJU18ZzTdJjm88HCq0lfRpYcMN0mMw
   cwCF9/TVSEX2owz2YLsJNAe3ehkWPUGK6V/9v+xJwpt5ltVGpfO939so5
   Q==;
X-CSE-ConnectionGUID: NlSueVZCSW2hpusH2xn1gw==
X-CSE-MsgGUID: sTT5WwwjSs+wd+vlUc6PIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="52774952"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="52774952"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 17:02:02 -0700
X-CSE-ConnectionGUID: EwtHJ5AVS3CMnWdc1Rv93Q==
X-CSE-MsgGUID: jwwPQeVzSEaDTdXekH4Zag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="155136510"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 19 Jun 2025 17:02:00 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSPCg-000LBi-2o;
	Fri, 20 Jun 2025 00:01:58 +0000
Date: Fri, 20 Jun 2025 08:01:21 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-vfs:work.pidfs.setns 6/9] fs/pidfs.c:36:6: error:
 redefinition of 'pidfs_root_path' as different kind of symbol
Message-ID: <202506200716.BoGofYZq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git work.pidfs.setns
head:   80432e84dc3a17336efd11282d8c5db368ed827b
commit: 90c48e2619324e40223af34ff8aed6480b9d19c1 [6/9] pidfs: add pidfs_root_path() helper
config: x86_64-buildonly-randconfig-006-20250620 (https://download.01.org/0day-ci/archive/20250620/202506200716.BoGofYZq-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250620/202506200716.BoGofYZq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506200716.BoGofYZq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/pidfs.c:36:6: error: redefinition of 'pidfs_root_path' as different kind of symbol
      36 | void pidfs_root_path(struct path *path)
         |      ^
   fs/pidfs.c:34:20: note: previous definition is here
      34 | static struct path pidfs_root_path = {};
         |                    ^
   1 error generated.


vim +/pidfs_root_path +36 fs/pidfs.c

    35	
  > 36	void pidfs_root_path(struct path *path)
    37	{
    38		*path = pidfs_root_path;
    39		path_get(path);
    40	}
    41	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
