Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C23819B;
	Mon,  6 May 2024 00:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714954171; cv=none; b=fhuXsNPgudJ7lw9jKjZ5wkYba6tJ+TmGeQ3KXi+0OFnPPeto+a3e84L52qQ34GpBaS1nKl5G7h0N0TZ0e3+TUPA5X8KgahiTcyiSP6+2Zg9n1tTOakdDKepzF0ZYunzggAJEd59hY4dfR5NZtRVaCH21x6PRlF/6wSY/W3xQqII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714954171; c=relaxed/simple;
	bh=l/gUaMWWrGZe70FcNTbD7SPtov3SK461WP2gAaitOyY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rozfM0JbvJQEpjxf3H+56a2pMhjdXVG7IEX+DwP9tHDRmG0IF3r5K4q+r2WrO6gSRVIBq9zhAXzlbN0Jr/g5dqNHEtlXAt7CR4WnyOCon0RAdQaf4RjJNAjHXuwm3Enu3IRhNYdOff+zDkmTFvjpw2sm0xO88yZdeRGwDvkB79U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZOEEKr9T; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZOEEKr9T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714954170; x=1746490170;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l/gUaMWWrGZe70FcNTbD7SPtov3SK461WP2gAaitOyY=;
  b=ZOEEKr9TKZEKcAFAuaCVB4nD9iX3VGLVC4fKm8YdZcEdP6fpMWdXooEs
   1lm4VLFWiVV+AE7kbMcj4LXLELtKAHrTdRxivgeW762AMxOUtbdAx/qsJ
   kULeqK90A/c7vFwoMU8isaiMkLd9KtHW7SIgYw1IQCaUyUvWNej9YEBJ8
   5jOt91mFWirzJHk0yGbTBrmNGW47aZsDDIlhZj6SqVz6pG0G0ppHkRQsW
   HxlG8M4PN9F0di2pSMLSmpuO4wGCP55k7bB8vvYq9KGZWl5hCOz0W15aO
   ADCBQIHZiHd1AcuZBA7aLsrwDU/JVKUhtDztiVrdpwa+67A7aldVp8DBe
   Q==;
X-CSE-ConnectionGUID: JqPmpDXwSA+QCXnb18y/ZA==
X-CSE-MsgGUID: U0FUHsKFSa65pEtCeMBFEw==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="10809354"
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; 
   d="scan'208";a="10809354"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2024 17:09:28 -0700
X-CSE-ConnectionGUID: ju5+AlscSvelMZRD/2Nzjw==
X-CSE-MsgGUID: OoZvCnCnRTGuj8iOZmpAog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; 
   d="scan'208";a="32662671"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 05 May 2024 17:09:26 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3lv1-0000Ik-1g;
	Mon, 06 May 2024 00:09:23 +0000
Date: Mon, 6 May 2024 08:08:27 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Stefan Berger <stefanb@linux.ibm.com>
Subject: [jarkko-tpmdd:next 15/38] drivers/char/tpm/tpm-buf.c:62: warning:
 Function parameter or struct member 'buf' not described in 'tpm_buf_length'
Message-ID: <202405060827.XuRaAHPt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git next
head:   152585665f0f6b89e67ed6d04c17b18d1f0f4077
commit: 28a0675aa9964fd89e61248d4cfe49baf9151199 [15/38] tpm: Store the length of the tpm_buf data separately.
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240506/202405060827.XuRaAHPt-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 37ae4ad0eef338776c7e2cffb3896153d43dcd90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240506/202405060827.XuRaAHPt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405060827.XuRaAHPt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/char/tpm/tpm-buf.c:62: warning: Function parameter or struct member 'buf' not described in 'tpm_buf_length'


vim +62 drivers/char/tpm/tpm-buf.c

eb0a137505fd0b James Bottomley 2024-04-29  55  
28a0675aa9964f Jarkko Sakkinen 2024-04-29  56  /**
28a0675aa9964f Jarkko Sakkinen 2024-04-29  57   * tpm_buf_length() - Return the number of bytes consumed by the data
28a0675aa9964f Jarkko Sakkinen 2024-04-29  58   *
28a0675aa9964f Jarkko Sakkinen 2024-04-29  59   * Return: The number of bytes consumed by the buffer
28a0675aa9964f Jarkko Sakkinen 2024-04-29  60   */
eb0a137505fd0b James Bottomley 2024-04-29  61  u32 tpm_buf_length(struct tpm_buf *buf)
eb0a137505fd0b James Bottomley 2024-04-29 @62  {
28a0675aa9964f Jarkko Sakkinen 2024-04-29  63  	return buf->length;
eb0a137505fd0b James Bottomley 2024-04-29  64  }
eb0a137505fd0b James Bottomley 2024-04-29  65  EXPORT_SYMBOL_GPL(tpm_buf_length);
eb0a137505fd0b James Bottomley 2024-04-29  66  

:::::: The code at line 62 was first introduced by commit
:::::: eb0a137505fd0baf693173f3572b87e983bc0594 tpm: Move buffer handling from static inlines to real functions

:::::: TO: James Bottomley <James.Bottomley@HansenPartnership.com>
:::::: CC: Jarkko Sakkinen <jarkko@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
