Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3691173;
	Tue, 30 Jul 2024 00:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722297973; cv=none; b=AYebpEoMrV137a04tWw4QSieVuv4s7j8kOigGNadrKvcr3CDIfiBYDfxL8snbN5veJyQ2fm30dGuwCdogzYxMR54DdGGsNMpUv/ZCHeP3GyhVa6oPkYYlDR4DrYY69sU2RbDBcAvnPf6YTjqWnVukS7EBhTz4SxU6CaJm4bfk6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722297973; c=relaxed/simple;
	bh=JdV5Zi/voKmoumEx0xFyRRVJpUhApKDdBNAJ5k6Bec8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YbjXsljmlimvNEeSQD5nAzoMWU9O1pPf+JLjN+8j/MSQlLQP9VM9oFi/PByewQ0gtWK5af+TTchvTO74NzlqmqZt8EcdVa7ui3KtSentlsc9Dr3/kl6FkPrKGEhOUIolZSVYGy0ezswakVQ0II7NhYnt76Tb/7DwA0w1m+0NdQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fuIAJS9g; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fuIAJS9g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722297972; x=1753833972;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JdV5Zi/voKmoumEx0xFyRRVJpUhApKDdBNAJ5k6Bec8=;
  b=fuIAJS9gjsGzx5kew9O2pUlnmazjB76QdVM50dKV9VYPA2DqOyxtzGsp
   xpTKg/ZR7/gLkfpvGdufyW0Azxn0Qju9ppkN1ss/JnTYEqphSh8KLquj/
   F2WMkOEsTA/+orpac5kfzBZGhs3UNnEM1dNivn+K5q+1N/FnFRIJcvPc2
   O7Dyqbgl1LRgZXNlmkSK1+6Hy1Zg9tDQTR/1+9FanwyAqP1SXRtdP9KwH
   i5p3qyqrOyoYR2U2OaZpy7UibQoZ6NmKadK2rY4kgYJFALoxXujmU7x2Z
   GPeUWxiTxj5SEDU48uL3vsUh1mrmWphr1ELV1hDKOJm4fXRyVU4jBuGfF
   Q==;
X-CSE-ConnectionGUID: owPqLQATTyWRBTFcyJCcnA==
X-CSE-MsgGUID: UthRZG9jSgyOdoHXezUx5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="19889466"
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; 
   d="scan'208";a="19889466"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 17:06:11 -0700
X-CSE-ConnectionGUID: Qjz/n4GYTkeMIWmfYwuvDg==
X-CSE-MsgGUID: hyBqoLUhTb+0ogX0jRq+Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; 
   d="scan'208";a="77373738"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 29 Jul 2024 17:06:10 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYaNT-000sD2-1A;
	Tue, 30 Jul 2024 00:06:07 +0000
Date: Tue, 30 Jul 2024 08:05:36 +0800
From: kernel test robot <lkp@intel.com>
To: John Johansen <john.johansen@canonical.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jj-apparmor:apparmor-next 4/4] security/apparmor/af_unix.c:604:3:
 error: call to undeclared function 'unix_state_lock_nested'; ISO C99 and
 later do not support implicit function declarations
Message-ID: <202407300828.EbdfjLX0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jj/linux-apparmor.git apparmor-next
head:   e6b2ff78a1aeb16f290e483536dedf626ba2d1e9
commit: e6b2ff78a1aeb16f290e483536dedf626ba2d1e9 [4/4] apparmor: add fine grained af_unix mediation
config: i386-buildonly-randconfig-004-20240730 (https://download.01.org/0day-ci/archive/20240730/202407300828.EbdfjLX0-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240730/202407300828.EbdfjLX0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407300828.EbdfjLX0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> security/apparmor/af_unix.c:604:3: error: call to undeclared function 'unix_state_lock_nested'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     604 |                 unix_state_lock_nested(sk2, U_LOCK_SECOND);
         |                 ^
>> security/apparmor/af_unix.c:604:31: error: use of undeclared identifier 'U_LOCK_SECOND'
     604 |                 unix_state_lock_nested(sk2, U_LOCK_SECOND);
         |                                             ^
   security/apparmor/af_unix.c:607:3: error: call to undeclared function 'unix_state_lock_nested'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     607 |                 unix_state_lock_nested(sk1, U_LOCK_SECOND);
         |                 ^
   security/apparmor/af_unix.c:607:31: error: use of undeclared identifier 'U_LOCK_SECOND'
     607 |                 unix_state_lock_nested(sk1, U_LOCK_SECOND);
         |                                             ^
   4 errors generated.


vim +/unix_state_lock_nested +604 security/apparmor/af_unix.c

   595	
   596	static void unix_state_double_lock(struct sock *sk1, struct sock *sk2)
   597	{
   598		if (unlikely(sk1 == sk2) || !sk2) {
   599			unix_state_lock(sk1);
   600			return;
   601		}
   602		if (sk1 < sk2) {
   603			unix_state_lock(sk1);
 > 604			unix_state_lock_nested(sk2, U_LOCK_SECOND);
   605		} else {
   606			unix_state_lock(sk2);
   607			unix_state_lock_nested(sk1, U_LOCK_SECOND);
   608		}
   609	}
   610	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
