Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828BB25785D;
	Sat, 13 Dec 2025 02:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765592754; cv=none; b=iaMnpFHLb6DQX0oLFcA9g4AaRm7oulEotHltkOA6wlEXid97Pf/KZK0eVZrB5mGdhoj7SRIldyZhoALRXbDMNutCF9Plj5AEfZBtkTh3Tv/9lnsnPk5WlMXmuaNcyn26slgkUcVHYFX6o4x0vLAbR/cNi7uWzVmSmWRWfNgInqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765592754; c=relaxed/simple;
	bh=2w++B4WUtAp0/JiOA04XB107DnE+ME+g0WvUCAa9Ps0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hWeCFcbxXgZmQUSvcBfiL4O2+xBhK15nEWvHMk1+arWOcHYH7qgmqahrMEXpMmkSgt/sEOTZnfCCD1wsCqGobWBoI2k4uAzMinEVsVvCdKA3vXweMx4LMLu/8NKIRdBlMyjPJ4rfRk9G6+MZAnTtgOqtbQhFe/cS9T95bXrghJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hcoeoAK2; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hcoeoAK2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765592752; x=1797128752;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2w++B4WUtAp0/JiOA04XB107DnE+ME+g0WvUCAa9Ps0=;
  b=hcoeoAK23e0ZccLCOec1cJHkV4Z4BG84R4wMxoWAHGIBkRWXafHJLU3P
   J+d2jDVZnO2WJnb4AFw0IOY68fjmI/6W3SexPJ1jWm3a1BjViWZ1rC8em
   ceRbDV7uOaX4B7YS7X6iWR1+26MALX3BKXsOMPcvx8CQatyXuOSWB6AQE
   JpmYHnOPQBI9XL8SVeM/fnGxFR78r11tovJZf+MqLw+adUwjIwp62blia
   g5M3AxnN8x8wt5nULGeZWCcg2cSjyOkA1siQmrZLFODzk0ycpARQUVT5n
   REBoHQ8Liek253x8flOfNaoMJx/OHxjx9U3BqyQPRrlonU55PdM1Dynq8
   g==;
X-CSE-ConnectionGUID: ARbm/jDNQUawS1MypHfCDQ==
X-CSE-MsgGUID: 02WuGP5qTjWVylLDdXEOng==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="66768505"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="66768505"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 18:25:52 -0800
X-CSE-ConnectionGUID: LR0lYWYORh2qL4yn3dKifw==
X-CSE-MsgGUID: zVrnVWYBRfuDE/3yD+Vl4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="196305677"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 Dec 2025 18:25:51 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUFKO-000000006w9-0zEK;
	Sat, 13 Dec 2025 02:25:48 +0000
Date: Sat, 13 Dec 2025 10:25:47 +0800
From: kernel test robot <lkp@intel.com>
To: Blaise Boscaccy <bboscaccy@linux.microsoft.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 08/11] security: Hornet LSM
Message-ID: <202512131027.LzV9ipd8-lkp@intel.com>
References: <20251211021257.1208712-9-bboscaccy@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211021257.1208712-9-bboscaccy@linux.microsoft.com>

Hi Blaise,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on herbert-cryptodev-2.6/master]
[also build test ERROR on herbert-crypto-2.6/master shuah-kselftest/next shuah-kselftest/fixes linus/master v6.18]
[cannot apply to next-20251212]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Blaise-Boscaccy/lsm-framework-for-BPF-integrity-verification/20251211-102027
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/20251211021257.1208712-9-bboscaccy%40linux.microsoft.com
patch subject: [RFC 08/11] security: Hornet LSM
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20251213/202512131027.LzV9ipd8-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131027.LzV9ipd8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131027.LzV9ipd8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> security/hornet/hornet_lsm.c:20:10: fatal error: 'hornet.asn1.h' file not found
      20 | #include "hornet.asn1.h"
         |          ^~~~~~~~~~~~~~~
   1 error generated.


vim +20 security/hornet/hornet_lsm.c

  > 20	#include "hornet.asn1.h"
    21	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
