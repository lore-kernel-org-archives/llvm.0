Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C6C1411EE;
	Thu, 27 Jun 2024 11:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719487891; cv=none; b=kIrsd5nLJUNs8a/9gU3n9VM3sfO2VFqg5iu3SY7gm2HnAFR43nNtE7gDKRGH8OCTuRWiPH021UEXQiK5uVsCjy0Ej2K5p9aef72Q2mVMttd3tuKDBj2cMBtPceB6OYS/Lr2i+RB/QHzwomDCaiUqbsUawPgPOg+4GIXpWcgX2kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719487891; c=relaxed/simple;
	bh=M9Q75o1kuwUigzJKrsbFgOEKX5n/SvjlNrmrEt1udAY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CdXJyKC0HhxtyPJ62p4lDoUNCsL0umGvghkDo/QFHTQg0/nVjZLD61+UC/sqxWFaRS70qUttvF1HWPHA2U9KF4NNoH6Us1Zn2n/rYrK6erbusfJN6DYmTtxg4kBJRUkJ04hPVLmnj98/1p0NxFKVkNL8Amql/icc7QYDTuox+rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KjZ1mniX; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KjZ1mniX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719487889; x=1751023889;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M9Q75o1kuwUigzJKrsbFgOEKX5n/SvjlNrmrEt1udAY=;
  b=KjZ1mniXkXFYOsNPPq70Az3RK2DOMenL+89b83QGtMJvB/OYkfZAH7FI
   7Mm3IWIPFcvcPdhvRcXRUJODdZAewMZqDpcEdkUyQRZO5C98w7JPaOhsr
   Li31+Mr0OW0HRDMg4S+zDYcMEY/JPWdxQ/fD3kBIIjdAeiFTNed7GVq+N
   AlkP4rRK49GENqhXCrq4CRSXGYTOwN7vrVKoaCcRfM436Id5nbKUnH4LE
   UBhNY0EcQf8IDMMrD+2ZMZG/SJh/VuXOEiZqjo4YHzY7r/GF8PPEa+m/4
   8P2eV8AEenyNBXMn6HoyGbsOcsqJZJ4qEmx1Ga+s7228nS0cuWTfRVfpY
   A==;
X-CSE-ConnectionGUID: vlm3iatyRveC9bDGPKY+/g==
X-CSE-MsgGUID: LnsF7v8KRAuvBDZ/QEiEPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="27197992"
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; 
   d="scan'208";a="27197992"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 04:31:29 -0700
X-CSE-ConnectionGUID: YqkaLF+nS7OA3sU3TGthfQ==
X-CSE-MsgGUID: zzB7SNLQRXGbbT9RXCrmrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; 
   d="scan'208";a="75100423"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 27 Jun 2024 04:31:27 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMnLY-000G9w-31;
	Thu, 27 Jun 2024 11:31:24 +0000
Date: Thu, 27 Jun 2024 19:30:42 +0800
From: kernel test robot <lkp@intel.com>
To: Nuno Sa <nuno.sa@analog.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Nuno Sa <noname.nuno@gmail.com>
Subject: [nsa:b4/dev-iio-ad9467-new-devs 6/9] ld.lld: error: duplicate
 symbol: d
Message-ID: <202406271947.IfboRh7P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/nunojsa/linux b4/dev-iio-ad9467-new-devs
head:   07a190d5bdd96dcb948ba00339145f0bb2b461e9
commit: b649e7b925e48f2b8a29b04b71c46b7b24508787 [6/9] iio: backend: add debugFs interface
config: i386-buildonly-randconfig-004-20240627 (https://download.01.org/0day-ci/archive/20240627/202406271947.IfboRh7P-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240627/202406271947.IfboRh7P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406271947.IfboRh7P-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: duplicate symbol: d
   >>> defined at industrialio-backend.c
   >>>            drivers/iio/industrialio-backend.o:(d) in archive vmlinux.a
   >>> defined at adi-axi-adc.c
   >>>            drivers/iio/adc/adi-axi-adc.o:(.bss+0x0) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
