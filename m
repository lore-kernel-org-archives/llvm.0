Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876DE168BD;
	Sun, 21 Sep 2025 04:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758429211; cv=none; b=F6riGVgMKOppVQJ3fpmUFRiER9T4KjbK2LNc03DEbxSONOnx/ZHYGx7ExCL2QXZJ+pxGIqobbdYYoc7nPRWU2MyicXLGMPs4TGY3/VGbqA9ZyhgYmIsn54opQMVV+zfWWD/lsD+aLWQNdeDjOkHedR5OrkS+EiADvVDH7z2OKz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758429211; c=relaxed/simple;
	bh=gbJfxmtq3k1FlJA+3r0ii67lNnO9adkk3yLmpIOoJRI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fOQ3uSFi4rJI9UmYopPQ9SrecegN29AD3meKjxIeUgTrs4qjjibEuY39TaoyDm0zuZs/nfmqM5LtpzN3YgG4aARKRZwuCWgl5APztaSsW+cW7WeTuwMDOCykqbWOhYabAwMdgxTbOwRYZtgMi77+4KMDpD4m6rFoB3/YJWbDVtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jbo0u3nz; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jbo0u3nz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758429210; x=1789965210;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gbJfxmtq3k1FlJA+3r0ii67lNnO9adkk3yLmpIOoJRI=;
  b=Jbo0u3nzmhZfv1PMYyP92wtoOM/tynswitD6uanw73M1YGd+B/Y2JuAK
   Pkp5cnok1DHP7nF9dBHl22bAcfXn4iCHUs6cU6eZRCfDsI3y5ta3FrrmE
   1Sd0SuGf4Fz3CWbCpRhnhLCqkRgCCWwifgKOYTYjTxJY59gnhZze3KJlC
   0+C61goFqsnGTs/S7+XVllmQfvuhK5KWMsNueH59j1Ebk1J1bFHpfbX6z
   L0Ax6NKA7YRGKYfRqKomHCxih0Vv3yWGs9OkG8o8we8VIaMLIeeaYyTmm
   K8qNc1B4zY1eVJWApVnqVdT3pghTPG7rRGuQMm0cbiL02iERKbn/eKELl
   Q==;
X-CSE-ConnectionGUID: owWy2TZwQjGCPyIuqi0mrw==
X-CSE-MsgGUID: 2COcHgpZTVmZSR+ti6ktrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60672828"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60672828"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2025 21:33:29 -0700
X-CSE-ConnectionGUID: qd8i5ZiNT8u/7oEFR+E7xA==
X-CSE-MsgGUID: Ob59BnwAT5WeDmcSzU0SsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,282,1751266800"; 
   d="scan'208";a="175323844"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 20 Sep 2025 21:33:27 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0BlM-0000Qr-2M;
	Sun, 21 Sep 2025 04:33:24 +0000
Date: Sun, 21 Sep 2025 12:32:27 +0800
From: kernel test robot <lkp@intel.com>
To: Qunqin Zhao <zhaoqunqin@loongson.cn>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Lee Jones <lee@kernel.org>, Yinggang Gu <guyinggang@loongson.cn>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Jarkko Sakkinen <jarkko@kernel.org>
Subject: [linux-next:master 4719/11136]
 drivers/char/tpm/tpm_loongson.c:48:10: error: incompatible function pointer
 types initializing 'int (*)(struct tpm_chip *, u8 *, size_t, size_t)' (aka
 'int (*)(struct tpm_chip *, unsigned char *, unsigned long, unsigned long)')
 with an expression of type ...
Message-ID: <202509211250.mD8JS2nu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   846bd2225ec3cfa8be046655e02b9457ed41973e
commit: 5c83b07df9c5a6e063328c5b885de79f8e8f0263 [4719/11136] tpm: Add a driver for Loongson TPM device
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20250921/202509211250.mD8JS2nu-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250921/202509211250.mD8JS2nu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509211250.mD8JS2nu-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/char/tpm/tpm_loongson.c:9:
   In file included from drivers/char/tpm/tpm.h:28:
   include/linux/tpm_eventlog.h:167:6: warning: variable 'mapping_size' set but not used [-Wunused-but-set-variable]
     167 |         int mapping_size;
         |             ^
>> drivers/char/tpm/tpm_loongson.c:48:10: error: incompatible function pointer types initializing 'int (*)(struct tpm_chip *, u8 *, size_t, size_t)' (aka 'int (*)(struct tpm_chip *, unsigned char *, unsigned long, unsigned long)') with an expression of type 'int (struct tpm_chip *, u8 *, size_t)' (aka 'int (struct tpm_chip *, unsigned char *, unsigned long)') [-Wincompatible-function-pointer-types]
      48 |         .send = tpm_loongson_send,
         |                 ^~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.


vim +48 drivers/char/tpm/tpm_loongson.c

    44	
    45	static const struct tpm_class_ops tpm_loongson_ops = {
    46		.flags = TPM_OPS_AUTO_STARTUP,
    47		.recv = tpm_loongson_recv,
  > 48		.send = tpm_loongson_send,
    49	};
    50	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
