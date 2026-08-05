Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE2B3A9DAE;
	Wed,  5 Aug 2026 18:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785954610; cv=none; b=jmmHvFBEv+GaTw+m3L5y5GXpU9fq7gbmiZJbWcfzPO6/QrMosL6C18+FEOzzNF7YBB+pUH+hZrmXQfUX0ilCVtl6sIkzHeCJ7aUcoP8PI6OED/UuoNQl4o5G6nrHuqReSZdwIJ0Zkh2HxB7nandie2vMuulSpzqIlPsCdUxF7zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785954610; c=relaxed/simple;
	bh=fLlKhlYSSrhddHFlukq7lBIthEK4wWuu/Zuxuv6qRcY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=IxyUvIjgqhS54GdhJ/WiihqiBfFweoFxEdq5a19e8dzlgr5oLzE6Omqi+blKu/vSJ5w8Myh7JHtp2vE7KNX45EgFgaJ3IxhOT7G3a9fVjMDheAzipBlZiZwP0OmqlBTj94+6OYZMrz8ru90LUQRhly0YQHInuClsGsV5cUGuG7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e7Ch5G8V; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e7Ch5G8V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785954608; x=1817490608;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fLlKhlYSSrhddHFlukq7lBIthEK4wWuu/Zuxuv6qRcY=;
  b=e7Ch5G8Vtwz9qcJ1CHEXOFUwsiYxf+QcZAP6d5+htxOZ8+XGQ2d+Tnsk
   anEK4FxdxMxreHCq59b1p0rwKNHu9lyGmO5bRi5emaGiQAZKnSFCIpl7A
   FX3TIollyWEnkM2CzRGGoC8hVx3K/M3pv08zQzYX89qUqPotJhwW2bgM/
   Ul3/a/nwxcLxbruqghmW7lpXtcvkGLHJlDcRYPKjwn4ZzOb7GxFokssdR
   uDoWZrBqfUbJYx+NNADzMRWK2a55Cr+Xx2NfjWLY3dz6dvYhvZqy8uNvY
   2CNF/7d2jbEx+wniCxofYf1ajoYnwYSQsnmq3YfnFMvr+/vzyzzabq5OZ
   Q==;
X-CSE-ConnectionGUID: 8bO3aMRURoSRLmriTgbPBA==
X-CSE-MsgGUID: hpOsRF5AQe28KVzkrNlS4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="86653655"
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; 
   d="scan'208";a="86653655"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 11:30:04 -0700
X-CSE-ConnectionGUID: Ou4W+r/SSryh/aXMkJv69w==
X-CSE-MsgGUID: Po5rcsV+R523EMDcJCNYKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; 
   d="scan'208";a="267014821"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 05 Aug 2026 11:30:02 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrgNM-00000000DCF-0R37;
	Wed, 05 Aug 2026 18:30:00 +0000
Date: Thu, 06 Aug 2026 02:29:17 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/compat-32bit-time-ifdef 1/2] ld.lld:
 error: undefined symbol: put_old_timespec32
Message-ID: <202608060240.p4XnAQhr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/compat-32bit-time-ifdef
head:   7663b4d0ace6aad2eb71ebff8fef8c4bb0469903
commit: dc9f3c20e466c6e813f3cf09ffd5d276db7c3fd4 [1/2] ifdef
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20260806/202608060240.p4XnAQhr-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project bacfe2950f8218268fcc0a8765644ea0c15f0360)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260806/202608060240.p4XnAQhr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608060240.p4XnAQhr-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: get_old_timespec32
   >>> referenced by socket.c
   >>>               net/socket.o:(__sys_recvmmsg) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: put_old_timespec32
   >>> referenced by socket.c
   >>>               net/socket.o:(__sys_recvmmsg) in archive vmlinux.a

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
