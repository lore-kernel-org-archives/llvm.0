Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62B41C84CB;
	Fri, 19 Sep 2025 12:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758286056; cv=none; b=SbDKBNtMz8BrLGAyOjrR6HaxeRjncDxO12KJijPxFrHZksf2vxMMrhu7yZRyIaq9zwkMI6RG1dzHT48WrUFmo1xR8jRhK5D8DEYuMr6IfmYbeLc5VSMAzPkndW15rjO0oHP0xTSZk4NF10aN1vVwqhXNbvQsTQ/6hsSW4aT7DJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758286056; c=relaxed/simple;
	bh=vY3YxnQYrveFgzB7VJ4BUxX6qZ3N2zrkrh8Tp1EnLPg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GgCIvy1v1oiPKoyVs9leviI8NYp2cK4ZhbVQj78TXfrnskqDgPbVOVfTcZb3QlUBDGL5+hywAnC0fmX4xMcLeGEt8NT1JMrWrh/Llp4tHKS4wngE1JTMLpEQ7jHsPvl/oQFqXv9DU9uYXFBRWYL7lWP1hXWTljjMAk4fiW0Wfsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bn5X4qSw; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bn5X4qSw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758286055; x=1789822055;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vY3YxnQYrveFgzB7VJ4BUxX6qZ3N2zrkrh8Tp1EnLPg=;
  b=Bn5X4qSwqddXXcmQdCv0bQfWxdUkIdLFLQ785kws1//UlTPa9KRW9Fb6
   fMDVrNZeuEwddPnEAwcjvWzcGWGPgylx7ZkAFLrcJYqA/OToDcMSzfCom
   6lJED7CoT33BQwKTJt1WQBfgAAjo3/+/oxgmVEf30gOO9u1rv0WT3u0Ni
   qK2cPJ7Vf6XiZNWGd6+c2lmbu2vjr9AKcs9UBp3Yt6U0gXqWLnpvkWXbi
   uLwK4uaHWvTT5v7mcek8p67BBR6FN/4H6xkbM/fYqhJF9Pv7Kg5xnxsvN
   6EG+GOZhPeblxOGOKUjuYw7PomfPmEuLZOvGcbp839MlpTzPhNDYtzeel
   g==;
X-CSE-ConnectionGUID: rggwLhTTTJi9899NgEnZuw==
X-CSE-MsgGUID: 4uqjnXsvQCqr1mUcMQwMjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="78238832"
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; 
   d="scan'208";a="78238832"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 05:47:34 -0700
X-CSE-ConnectionGUID: Wj/blXOYTTOKFc0Jg3uqnA==
X-CSE-MsgGUID: MDjABkjsQd2Oo7zGXccTHw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 19 Sep 2025 05:47:33 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzaWQ-0004Ip-2c;
	Fri, 19 Sep 2025 12:47:30 +0000
Date: Fri, 19 Sep 2025 20:46:43 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [linux-next:master 9765/10654]
 drivers/gpu/drm/xe/tests/xe_pci.c:214:2: error: initializer element is not a
 compile-time constant
Message-ID: <202509192041.tQwdE4DS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8f7f8b1b3f4c613dd886f53f768f82816b41eaa3
commit: 5bb5258e357eb79719d1c998731b932c945cb52c [9765/10654] drm/xe/tests: Add pre-GMDID IP descriptors to param generators
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20250919/202509192041.tQwdE4DS-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250919/202509192041.tQwdE4DS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509192041.tQwdE4DS-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/xe/xe_pci.c:1104:
>> drivers/gpu/drm/xe/tests/xe_pci.c:214:2: error: initializer element is not a compile-time constant
           graphics_ip_xelp,
           ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/tests/xe_pci.c:221:2: error: initializer element is not a compile-time constant
           media_ip_xem,
           ^~~~~~~~~~~~
   2 errors generated.


vim +214 drivers/gpu/drm/xe/tests/xe_pci.c

   206	
   207	/*
   208	 * Pre-GMDID Graphics and Media IPs definitions.
   209	 *
   210	 * Mimic the way GMDID IPs are declared so the same
   211	 * param generator can be used for both
   212	 */
   213	static const struct xe_ip pre_gmdid_graphics_ips[] = {
 > 214		graphics_ip_xelp,
   215		graphics_ip_xelpp,
   216		graphics_ip_xehpg,
   217		graphics_ip_xehpc,
   218	};
   219	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
