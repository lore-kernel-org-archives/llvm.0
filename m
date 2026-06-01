Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3FF36657C;
	Mon,  1 Jun 2026 21:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780349841; cv=none; b=Iuep2pXEBServBP++ofv3QhvSmIWQom8bVafxadJX6te0Z6d7DzuVB4Y2pJbMWS41XuBI0yG8hcDvKhxbOEwjbcYGfjkKd+b9FSmgfy9EuYGGcQ+ibPBHWHrGiAKjXlJKLl+TsNhbgULNTDw0/qopFtZgnOssmrViBmVih1AmqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780349841; c=relaxed/simple;
	bh=2dkwDCe29lu6lJakw2UrOD+pXL8yD3L1ISUDKp+52PM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ahYFkiWEEz+q6DDh/yJnjuYaFivLnDsKYD3Ypb34Snqwfs9yMVkCMkVpZSEVeB2aVZiVVNfqn3Hsoj0PjpC43Ye1goYf+4ylL5Ds5MfRHA/SjsQazRB5v3Mu3lhslG9/r9LiOwBFqpJHOi1fxWq7SpcM5AYIGEXEh6f2iA+AIvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XFP9/Zc3; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XFP9/Zc3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780349840; x=1811885840;
  h=date:from:to:cc:subject:message-id;
  bh=2dkwDCe29lu6lJakw2UrOD+pXL8yD3L1ISUDKp+52PM=;
  b=XFP9/Zc3Zn8td1scEii52qux1xzRbiEw2t97bNIBRdgTUfYaF8dHDdEp
   J6x8PweKKKGh12hG5S1QeyMWFjJ82lRxKCZWpoI8BFp1jsoTEsQFevkwH
   LxGnAaOG+x3yzQEn/aa342HQ5Pvk/koEmkWM74By2XdHDFJCikxFNOcIp
   /cfyiVv2lZqdtrvHXfzPKUO2uc1ics0yE37Ju0M6SKhf6EzcML1i8yAET
   U5clP0LqU/fCUc5S7T3nsP1uOgqenbiZt4NUegosTDJBIVEDpWRb9dw7e
   drh7WYpTjlSh4VwYyN1aEGV/21skOtPwAo40mHaBD6K8JOnHiKZKGatm8
   Q==;
X-CSE-ConnectionGUID: DxLA5vUwQtOGldA+obL1aQ==
X-CSE-MsgGUID: GugWXye0QXiJi0aIyVTndQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="98538252"
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="98538252"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 14:37:19 -0700
X-CSE-ConnectionGUID: RuIGsxTJQgO36WwrtLXkHA==
X-CSE-MsgGUID: jmnD0wA4SXStT6Jq8Ze2pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="248782303"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 01 Jun 2026 14:37:18 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUAJw-000000001dl-0nSI;
	Mon, 01 Jun 2026 21:37:16 +0000
Date: Mon, 01 Jun 2026 23:36:29 +0200
From: kernel test robot <lkp@intel.com>
To: "Jamie Hill-Daniel" <clubby789@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: Warning: kernel/seccomp.c:442 function parameter
 'seccomp_mode' not described in 'seccomp_needs_combined'
Message-ID: <202606012301.umaY87cU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Jamie-Hill-Daniel/seccomp-Allow-using-SECCOMP_MODE_STRICT-with-SECCOMP_MODE_FILTER/20260527-001624
head:   f22fa82eaf67776ab7116506faf0926af86bdac7
commit: f92ac9d5b6ec95cf664a18e58daaa5c9c29e91bd seccomp: Allow using `SECCOMP_MODE_STRICT` with `SECCOMP_MODE_FILTER`
date:   6 days ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260601/202606012301.umaY87cU-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260601/202606012301.umaY87cU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606012301.umaY87cU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: kernel/seccomp.c:442 function parameter 'seccomp_mode' not described in 'seccomp_needs_combined'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
