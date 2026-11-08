Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794121986;
	b=KCGM6vPMncbkDQa1OR6e3gO+cdl8ezk1JkJeVaQ/DPaPzGyLEhpcagAvTMSAvgO01cuy
	 JBLWWlse1Vs5JPWagLnq/VoYf1zqLf93zfqhlA8UvGzEQIPPgrpKtQitUFn8p7eELjPbV
	 xu3BkIJnUi1kCyLa/9/CFiJztAdcqLQ6MUnIqBuJhTa0ORqKKNbNswLAtC80sCW3ynlzN
	 J1oiCnLy/dTx8Ljs/camHw0s/o8PfVESFkIFb2bx1fubGHmCMMFonQzs6khz6GkDCXzHw
	 M4srx7kRu5JZ0aaRDiWWEQWQWIGNmdCYkQ8cq23sNT0GKD8gExCxkkJD+xu6eE2fnXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794121986;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=8Kzy8IWInEFboSRlDioR+c7wmWexSBkZjv0wSLrp5us=;
	b=aN89yTUILIkKuC3/GkCRmDzTOuV5iEOhWIr7/o+cUVNfIU4qnvyDbTspIbW5tNgUwTO9
	 ap49yZ1Bgv2ra7T1CeyZo/ZpOCtUaN/oZAWPlzrRQSgf3Sb1KGLCETv26gOvOuEqKIG0T
	 iEq5/tPL44T6MPxFV75Oi1micCaknnmYgvElwUqOpkit7mF2MW5XzeBvmZ1xRdxe6nMH6
	 vl92Q/CBaiWRXXWF2V87dEOIKMgGBWR6CcxXPQprfMmfWhmx9EEVFyi7OTbG5oWQusZdF
	 YQyxqE1/z9OjpGrXc+Ps3jO8upP3rSuYqhHLjHc3IiRpCgp1nMN7n5gKeb4LlSF0W0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DWZb33Z8;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF20606A31C;
	Sun,  8 Nov 2026 07:13:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DF20606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DWZb33Z8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794121984; x=1825657984;
  h=date:from:to:cc:subject:message-id;
  bh=bZdv0rzDTA6BdOGNfxKYX7e6ftjGCynvDCw1k5mMAA8=;
  b=DWZb33Z8FNQDASaysgLWX8Rr7Hx8MJLhIrFUPFjcfEEnmKmNVeCsqmYW
   hmRNOEJQGZnOiMkvEVbD2qrx3dgumYb+DUIhakP+oK45g9U5x67gQCIyA
   p8SRAeosOItv4TDuXx9RW4nC661G3w31gozMSA+J459RKf4Rk98rlRorX
   voXEqxuVdrJwOkc60nvge1B47DNuYMfNzrSRcQMF7zK5wzGbcYo+DY5dn
   W2CMVZ+ecanecNQCv68jzkTnQ2QqUSp7KGUpd8i2OjJUZsfiEYXmy/KM/
   z9L0DGKPiSx3Y03QogTsAzPe0LHIeeMwPIJTS19KOBkQgzPvxS7w83+tD
   Q==;
X-CSE-ConnectionGUID: jOCG5DBOSc+sNO0yliTgyA==
X-CSE-MsgGUID: 7xmiDzMPSzKw/ahO6it5XA==
X-IronPort-AV: E=McAfee;i="6800,10657,11959"; a="2880805"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2880805"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 23:13:04 -0800
X-CSE-ConnectionGUID: 8U2cS5AZSUSFah4UpY+Q9g==
X-CSE-MsgGUID: Iy1kfnsVTh66e4XJT2L/fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7641235"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 07 Nov 2026 23:13:01 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPx5F-00000000B5X-0PTc;
	Sun, 08 Nov 2026 07:12:57 +0000
Date: Sun, 08 Nov 2026 08:12:25 +0100
From: kernel test robot <lkp@intel.com>
To: Kurt Borja <kuurtb@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
 David Lechner <dlechner@baylibre.com>
Subject: [jic23-iio:testing 94/213] ld.lld: error: call to
 __compiletime_assert_587 marked "dontcall-error": min(count, (sizeof(pins) /
 sizeof((pins)[0]) + ((int)sizeof(struct
 {_Static_assert(!(!(!__builtin_types_compatible_p(typeof((pins)),
 typeof(&(pins)[0])))), "must be array");})))) sig...
Message-ID: <202611080814.7RmHoQ6e-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   08853c09ea2c89d0f48a67a5268e88d71fcf2263
commit: b0b43a26dfc946ea2f1478dbe8512478527d1271 [94/213] iio: adc: ti-ads1262: support excitation currents
config: riscv-randconfig-2002-20261107 (https://download.01.org/0day-ci/archive/20261108/202611080814.7RmHoQ6e-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 0fa861dbbf46e5a75f621406fd91cb015d8754bf)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261108/202611080814.7RmHoQ6e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611080814.7RmHoQ6e-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: call to __compiletime_assert_587 marked "dontcall-error": min(count, (sizeof(pins) / sizeof((pins)[0]) + ((int)sizeof(struct {_Static_assert(!(!(!__builtin_types_compatible_p(typeof((pins)), typeof(&(pins)[0])))), "must be array");})))) signedness error

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
