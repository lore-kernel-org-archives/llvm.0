Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A9D28B7EA;
	Fri,  5 Dec 2025 22:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764975390; cv=none; b=AO/Q0FOIRTNdgmeeQyhI0VuXJAOWFj4qgMk3fktvxdRizBEdy/fsp41BW6m8oPDoZnoG8P89D3Z1TPzggB24If/a6f5XoEQK/dqiUwnoEgOr4kxJITFai+R4MleDnOl6ogZ9lzu+uqD6z5og425hT/nsWOquHhxApdsr8i1StWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764975390; c=relaxed/simple;
	bh=z2jIlg145utpQZXeiBtOBhh3JCKFhu/OxhLedPhRX0k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OSW10mnGXDnOU4YXoZzVGM8vEVwg9tKbVY1T/lMmIC76lmXRaiH8hup8n6uOotMRlTRv5d6x7YPlyMEazQcFNJuL2DoShMBoRsQ8ApV19+AMYFbqXOTRqOgUwqgA7DqxnQel3zhFG8UZcu4PXE8HvzGlQ1yePZ6aSzP2u/sCyDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YQ3AGxHY; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YQ3AGxHY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764975389; x=1796511389;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z2jIlg145utpQZXeiBtOBhh3JCKFhu/OxhLedPhRX0k=;
  b=YQ3AGxHYyz+wrXdDG7Hf1Lhu+DRoPPYCFQXFkiafeiRxbsgca3Lh5/vo
   l+Ys3USWtH6e2c2FHvzW9HhO6f5Ly8Uj3yv1hfSyxr5p3Cz1Uu94hYDRL
   Zy4aWzHlEJ3xMKwKhAMIC7ETi1QOV93t6DFZEUkStYCTSFmkFXaPCA2Te
   MqqYiA0TDsXiPuEWHry2DefvfasZ8ZK7/8RHOQPZg+GptqMm+h8lqXU3F
   0JAhFW6T0UWH1eUNgv/eL92YjgU+LECt44DCWDlPCMj7OtPe/aLe1vV5i
   YyUCciFoSAPsH0ndXhKHJCLJMrbbLF3ZBVESJLEphVlydUX+zCjGnthTg
   A==;
X-CSE-ConnectionGUID: owHSOfNDREaVQlqx9SIAZw==
X-CSE-MsgGUID: udDDXtQZSV2YOhp/uwaOug==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="66909094"
X-IronPort-AV: E=Sophos;i="6.20,253,1758610800"; 
   d="scan'208";a="66909094"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 14:56:27 -0800
X-CSE-ConnectionGUID: eU1kQ3nFR32Ft90bzKF/kA==
X-CSE-MsgGUID: szpbSbajQaiqF6dDVywQsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,253,1758610800"; 
   d="scan'208";a="196183494"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 05 Dec 2025 14:56:26 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vReiu-00000000FdR-1h1d;
	Fri, 05 Dec 2025 22:56:24 +0000
Date: Sat, 6 Dec 2025 06:55:43 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ardb:simplify-kallsyms 1/1] kallsyms failure: relative symbol value
 0xffff1004 out of range
Message-ID: <202512060650.TnfRk8Dv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git simplify-kallsyms
head:   1a0f4c7b0dd78403c70cf09ff6b4c0bb3813f52a
commit: 1a0f4c7b0dd78403c70cf09ff6b4c0bb3813f52a [1/1] kallsyms: Simplify handling of the relative base
config: arm-randconfig-002-20251206 (https://download.01.org/0day-ci/archive/20251206/202512060650.TnfRk8Dv-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 14bf95b06a18b9b59c89601cbc0e5a6f2176b118)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251206/202512060650.TnfRk8Dv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512060650.TnfRk8Dv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kallsyms failure: relative symbol value 0xffff1004 out of range

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
