Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DAEC48F852;
	Thu,  8 Oct 2026 23:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791501473; cv=none; b=to+peXO6M9oA9AudKC2z/VBw7ZPNMyc7VYHBSlz8UJyCbWlpzipgJTLYmcMcd4i/FjsOftr7nvKxlLrIlBb1jT6ZrZidg/xb4iJNXS0PgF3hg+z7Tx5fIUqzOHpqwvee0oOW6/MVfT+P8hrzYTSE5IoYRFv18s1ESNCkWNXA8IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791501473; c=relaxed/simple;
	bh=7IMyrLIyHxUk3/oM1yPSEktkn7NowIaxNojwvnWjw28=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=lVoI1ZI/o3ojl6vvrJHMJFkON0tOzlFXcOoGxhGwzQEanyMEqxhL9KToPPbSun/PasqiDoNxb42MU446/2rFKlk9RM3RqR9tS++gP1M+2BMCjte8bAhAYZ1EVzNRGvxNNX6xT/ZKOViLjAbBFn8VhrIeoDmWKPS5pZbfRLYsPeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JmQSr6Ld; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JmQSr6Ld"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791501472; x=1823037472;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7IMyrLIyHxUk3/oM1yPSEktkn7NowIaxNojwvnWjw28=;
  b=JmQSr6LdjvQm12Il57zuHoC/9VnovJV2v7lqZ1Ny6PjK9duzThnIlKuG
   JjfS43fVhVD8DFpAQRvCQ0BWTW2UZ44F2o81pDCZD0BXj+DhKsb01Sb72
   rR1rpMiI9xB6mzRBNSulrrxijwpASnIHSXl3ZYmrFYp8QDbwqegoJI4PN
   5CH64hXA5GQC/FRI22MB1S6JBWq0/PF7nbeW4EwsH4s1tOV4NIQh0nRQ/
   H1EHaWoyNovgemAy0uID56Xy3nobhfCIdhtNt7fZrP7ASnDA2aWeCi3cf
   EeBWu90wTmqt3QHmjKE7Nuy/fWGOMSGslCQJLa9HHGvLMJzc3Pm41dJMp
   g==;
X-CSE-ConnectionGUID: XCoszsLlQYaKzKaJfqnsIg==
X-CSE-MsgGUID: C7aeWv9IScq6Bhqa/ZDxKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="300833"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="300833"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 16:17:51 -0700
X-CSE-ConnectionGUID: ZEA085jMRUSHhGZKyDbrWw==
X-CSE-MsgGUID: l1un7IepT3qk3GxcWn4hWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="169067"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 08 Oct 2026 16:17:49 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xExMw-0000000052k-4036;
	Thu, 08 Oct 2026 23:17:46 +0000
Date: Fri, 09 Oct 2026 07:17:09 +0800
From: kernel test robot <lkp@intel.com>
To: "Stefan =?utf-8?Q?D=C3=B6singer"?= <stefandoesinger@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [stefandoesinger-zx297520:dlink 77/142]
 drivers/spi/spi-zx.c:477:17: warning: implicit conversion from 'unsigned
 long' to 'u32' (aka 'unsigned int') changes value from 18446744073709551614
 to 4294967294
Message-ID: <202610090757.KEcVFziz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://gitlab.com/stefandoesinger/zx297520-kernel dlink
head:   7998b6e929bb20ed66acafa33720d8e3533e1598
commit: 4fa1d7e70e05f781c1e9a1876619ad78b3297e19 [77/142] zx29 qspi driver
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20261009/202610090757.KEcVFziz-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261009/202610090757.KEcVFziz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610090757.KEcVFziz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/spi/spi-zx.c:477:17: warning: implicit conversion from 'unsigned long' to 'u32' (aka 'unsigned int') changes value from 18446744073709551614 to 4294967294 [-Wconstant-conversion]
     477 |         writel_relaxed(~ZX_QSPI_EN, qspi->io_base + ZX_QSPI_EN_REG);
         |         ~~~~~~~~~~~~~~ ^~~~~~~~~~~
   1 warning generated.


vim +477 drivers/spi/spi-zx.c

   473	
   474	static void zx_qspi_remove(struct platform_device *pdev)
   475	{
   476		struct zx_qspi *qspi = platform_get_drvdata(pdev);
 > 477		writel_relaxed(~ZX_QSPI_EN, qspi->io_base + ZX_QSPI_EN_REG);
   478	}
   479	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
