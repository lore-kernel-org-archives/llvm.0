Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001BF255F5E;
	Tue, 13 Jan 2026 13:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768312454; cv=none; b=awW5sw/RrGSKUjpE1h1ZqJ36E/TVZtyZTnLMvCePl+S/OSYcRwVGYIhxqLTh4vqq9hg6yQOg0wMtOe/fts5NzQKEc5SGVizVHOUQjbz1wgHeylZ/2f3vO1DOcatKAjtF2NR3fWGLPzkrYHYYB/GDdaqB+OpGGpN4cQcLpdlJ/fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768312454; c=relaxed/simple;
	bh=pyA/JgmKFyglfXBKM3H2uiwcjz9QpGlzDqpt96DXDVo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=SGldNp6pq2+IQxxfo1nCeonkFWKaEuGI45pvW76QVrKjVmx8TrVyJvRbt0hC+LFi7uYkxR5C59ChUiCBXVwZjVI7jrexGMfxgmGHgeB/DK6NW6qBJOoQXHtOOS9wUQPX1LfPqbNAXlvQ0De9bKmCyHpCkpL2ZXp2ncPLcf5+gEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YHCllw6T; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YHCllw6T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768312453; x=1799848453;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pyA/JgmKFyglfXBKM3H2uiwcjz9QpGlzDqpt96DXDVo=;
  b=YHCllw6TDpYwlqzZW85CCrQRgeqpXM9wDHVMf7H2fFe7XoU5lcycybtE
   LDum9KMrDJlBNTuvXZ53zc2PYII0BZv0qcqk1DLR76DsbBmE7d4zmk6x5
   bXJs8b3wl6X2bJUiPnzaSoyoIAe7Nn6ei9Vxx07emVdflxlIuAvBbYCLn
   R0QMI1cEXtMLu0aZtn1q6A2r49e46pMz3gggh4L0goWqF8fo1are7pgqt
   +crjgWQDUrAoYtoD9US7VU1zxwI2ip8/Z7T0mw6Nq/8QeboY95LibqBsw
   kmmq4fC95q/zd8jSv9qtqMNCfAF63EnGUiAZca0H0GCSkEWkZnefj8Vwt
   g==;
X-CSE-ConnectionGUID: vRe40V6YTDOAKF1BEJTe4w==
X-CSE-MsgGUID: E9Dm8IFfTUy75768ubQYFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69518441"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69518441"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 05:54:13 -0800
X-CSE-ConnectionGUID: Y7iOaemZRGmaxAZowsWL3w==
X-CSE-MsgGUID: cIbd/nVtQGm1DCqZ87mvqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="208550529"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 13 Jan 2026 05:54:10 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfeqV-00000000ErQ-2Lz6;
	Tue, 13 Jan 2026 13:54:07 +0000
Date: Tue, 13 Jan 2026 21:53:27 +0800
From: kernel test robot <lkp@intel.com>
To: "Uwe =?utf-8?Q?Kleine-K=C3=B6nig"?= <u.kleine-koenig@baylibre.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Sumit Garg <sumit.garg@oss.qualcomm.com>,
 Jarkko Sakkinen <jarkko@kernel.org>
Subject: [linux-next:master 3691/5774] Warning:
 drivers/char/tpm/tpm_ftpm_tee.c:172 expecting prototype for ftpm_tee_probe().
 Prototype was for ftpm_tee_probe_generic() instead
Message-ID: <202601132105.9lgSsC4U-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0f853ca2a798ead9d24d39cad99b0966815c582a
commit: 92fad96aea24fc19abe1eae2249402b61de3a3e2 [3691/5774] tpm/tpm_ftpm_tee: Make use of tee bus methods
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260113/202601132105.9lgSsC4U-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601132105.9lgSsC4U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601132105.9lgSsC4U-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/char/tpm/tpm_ftpm_tee.c:172 expecting prototype for ftpm_tee_probe(). Prototype was for ftpm_tee_probe_generic() instead
>> Warning: drivers/char/tpm/tpm_ftpm_tee.c:275 expecting prototype for ftpm_tee_remove(). Prototype was for ftpm_tee_remove_generic() instead

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
