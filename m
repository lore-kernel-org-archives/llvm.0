Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08115285041;
	Fri, 22 May 2026 05:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779428309; cv=none; b=Co+vnBdz2KtH2IOO+WKpasMOO0KjbGuRvM+95cIiZIAJiu8RmryVGHN8oOwy15dCRwrqgq4ZVM/PAhVk051GDhG5HIWdLKP+MJh35soqF+unJm8F6Ks464nIH9v1bFkS2dG+L7YracCKd2EIbbRfLqYOupq4fsE5Q/hkz3T950g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779428309; c=relaxed/simple;
	bh=v7QCzKVM9AeXBs3WQtoO47XFJLDA+Jw3yIo5yEaaaD0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MAwhnM5jtvaN6O3A9lvDr7+0ugp4vEN57VVO38Su7IGj1wrN1IKvfEaJPLmljVaU2IZP10u0T+L7WCSSCJvjOU5V39DQTOIpK7ovZq9oH708IzYBRjYqrHSqe9rdYa/UqUSB7wFyOE5snk/l+olFc4w7HSjtQD0+GPidogUiPMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IftHb3jz; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IftHb3jz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779428308; x=1810964308;
  h=date:from:to:cc:subject:message-id;
  bh=v7QCzKVM9AeXBs3WQtoO47XFJLDA+Jw3yIo5yEaaaD0=;
  b=IftHb3jz34jo/iFQWFT00BMeUx4uFfT3CqlvLt4TGwVBMFZ59z9S1cXi
   sOeWDfEen9OHMoM8Q0VSrBtswXWs0whjuiNjM4aMaSbpjUQ/iASwgiy/F
   rgge1aBQr3z+6eZ4zjmUCJSrx0/ACU54SSE7gVTc4UzMEn6Bl40d4r1rz
   X0IF4dlDJLsd/l4YVYYR/1mIOXGFHiOBtX1z9yd6ZDiXngvS2AkjZiEbE
   oNCRApM7mmG5JPEK2Ns7y5wSP2QJYki8dkA3kuTXMvLwTICHSCoS7hUZq
   ALb35ZXbt9jXqxWaC4OD1KQzX0AT+YHT5p/adLR7BI7FQrXX23EE/h/nc
   A==;
X-CSE-ConnectionGUID: MLKWoFBUR9m52wgtJSwnwA==
X-CSE-MsgGUID: ThKmdk4yTX+t0pQwPBDH3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="79505826"
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="79505826"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 22:38:27 -0700
X-CSE-ConnectionGUID: /FuDU5I2RumHmCBIKLlECg==
X-CSE-MsgGUID: Q44zuZY0S3yKR682yoB0NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="236581673"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 21 May 2026 22:38:25 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQIaU-000000001nx-1xaU;
	Fri, 22 May 2026 05:38:22 +0000
Date: Fri, 22 May 2026 13:37:55 +0800
From: kernel test robot <lkp@intel.com>
To: "Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [scosu-sched:topic/mmap-cap-prot-wip/v6.18 18/1130]
 ./usr/include/linux/route.h:39:25: error: // comments are not allowed in this
 language
Message-ID: <202605221328.sEbiklP9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot-wip/v6.18
head:   f69a5a9d9fee15edde28429e23a4c749a59937bd
commit: ff449510bed563971fd5f8a18111dc08c14744bd [18/1130] cheri: UAPI: Fix padding field in struct rt_entry
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260522/202605221328.sEbiklP9-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260522/202605221328.sEbiklP9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605221328.sEbiklP9-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/linux/route.h:39:25: error: // comments are not allowed in this language [-Werror,-Wcomment]
      39 |         unsigned long   rt_pad4;        // it is actually 8 bytes
         |                                         ^
   1 error generated.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
