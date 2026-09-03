Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23872E7380;
	Thu,  3 Sep 2026 02:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788401185; cv=none; b=OcmVr/TwwhBptJkVu1Mlut8gwZGbzMefKZcd0Uga68Dni/PbYkNTFqeo3RYy3pTZoggOoe8IC5WxNqJrWJnxz0o6O4znBhGOFFvXlev3VdmzOUa2WH9UksGfE9LB3eTrRfqSHV3mh153lcLt8woAPVg76cRsytwauNoHNmZGlbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788401185; c=relaxed/simple;
	bh=tedEEPcCReidk/8CfzxofH/Wfpdy/HPXNdiH8/ehg08=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=OmLuGii8fpS99ixcRyFp52KKqn4moe9mNHlZ17g3Zzm74zKr90lF+dqzxqPPwSfoMRI1zmW37g2jgBHb+YngaqqbYlh4TJ8r4KYTMjETDleTxhVVS6duEkTQU79pv+QNqdwAEMty9eSARDCuSBIh+m7tMNqhP7tho11bOdyVx9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z+iGoObJ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z+iGoObJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788401184; x=1819937184;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tedEEPcCReidk/8CfzxofH/Wfpdy/HPXNdiH8/ehg08=;
  b=Z+iGoObJfukzKti57FGWCq3DrCgpUCDty9n9dLyvVPmC8lDhl3o8Z4SR
   tjBE2Nw5rQPaf5HWfzpamoFs9VS19jBkLVs0t0ivZ8akTzYTm1Y6VPXcI
   A7VybdPSTlLW/Zeb2sB3zfdj+EB5MyYrh8ruyqAPvrSN6RPxmp+0iTL/H
   Rh+/PUQBhd3CzYeMFhfds8QamAPZGRrlH5crBwxyLYtdZkF8qQoEcV542
   C4mRMWMUrn8Dm8wYRbfomIuvaHLn3uhpp0ABtDGlNpeyH4zSBOcbHkD8m
   6P4r+rJVvdW55FOgFvPjIxG/yYwwp9WAJrnYQ+n8W/efd/qXLb26+dCfm
   w==;
X-CSE-ConnectionGUID: tYN2jzgJRMSoid2uOJwHBw==
X-CSE-MsgGUID: feptGpAPT4+rgYOje8kATQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="106237968"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="106237968"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 19:06:22 -0700
X-CSE-ConnectionGUID: j9akTHVwThOOtwaHyYQSHQ==
X-CSE-MsgGUID: CU/tUzPeRfqA8V3+/8WfWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="271538142"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 02 Sep 2026 19:06:19 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1wqH-000000003cb-1jil;
	Thu, 03 Sep 2026 02:06:17 +0000
Date: Thu, 03 Sep 2026 10:05:23 +0800
From: kernel test robot <lkp@intel.com>
To: "Stefan =?utf-8?Q?D=C3=B6singer"?= <stefandoesinger@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [stefandoesinger-zx297520:dlink 76/131]
 drivers/spi/spi-zx.c:477:17: warning: implicit conversion from 'unsigned
 long' to 'u32' (aka 'unsigned int') changes value from 18446744073709551614
 to 4294967294
Message-ID: <202609030957.sHim3B0q-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://gitlab.com/stefandoesinger/zx297520-kernel dlink
head:   4132307830800b020a6d29d27cb3fec3cb5fbb90
commit: fce785fadfd6abf34e775c2793e49a37e1c426d5 [76/131] zx29 qspi driver
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260903/202609030957.sHim3B0q-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260903/202609030957.sHim3B0q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609030957.sHim3B0q-lkp@intel.com/

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
