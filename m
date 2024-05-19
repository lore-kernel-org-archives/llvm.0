Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD6F11CB8;
	Sun, 19 May 2024 15:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716133906; cv=none; b=ZN6Jhh6yiQc592m7FPOBmPUTTyGUwe0IptaMuDsQ8X83BoTJA5vZcLWOHoQTlf0Lnma85ayfzEdtpIPTmHVj5dLqvYUoANqlvGpw4FOT5z0VRZwx9SqTbrTldkZ2OOhG5v3okt2VL+4dwpkBhms5WBuC7ELW7VFypNHU0yyEW9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716133906; c=relaxed/simple;
	bh=R7YNWCquwoAEJB0oftPCx/RGdifHQt2sZrpNKgOn3jk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DEKo76+CvutmuBUgn8/kEM2ov6XuaSdeTvBqEFaUgRbpEAPeZ8gOG/GpsX8RgE0XZ/IobUa/BzJDU+ihJq1rSxcrx1/c1gEIjptW/HRSJ6JC+VTItUxqkECS9ld5F2srhp96yctkXWKctaXMuQsZVQXxCiZ9gsI8tzJ1EaZtjm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l7nHjUAA; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l7nHjUAA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716133904; x=1747669904;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R7YNWCquwoAEJB0oftPCx/RGdifHQt2sZrpNKgOn3jk=;
  b=l7nHjUAAalUOylQRNQXvbgjJ5Fokzuk93erF/BJLCgD+DSxK9M9n1oNl
   kO28FZ3CNT8Vw/5j9elbQaa2wGCx3Y49fWiIyAAyoerv5ies9Ctm5Uj/5
   qfM59/7hox90JaM8ccU/NgYSr7n7PEUq495n2zyslZKXtufUfBNXchJOD
   jQXmzcYgNSVwt+8UoTEk5zKI/lkoqC8gWDHca2Uswt5X+lJy6la6odRSd
   9k7Z9hwci4lxCmkwnINXb9JwgEHMnhT97Oh0Mc94f1RBBPsdWFJwjjHAa
   yy4t1ZHQ8t6b5R+05SkyMaSgAYl/WlNW2GyoVMzHRuTQ7mrLy6KaXpBGY
   Q==;
X-CSE-ConnectionGUID: BOpZ4MbkSf2v9Ppj9FiWqA==
X-CSE-MsgGUID: Zl1AQTGfSAmh7zcABek5hA==
X-IronPort-AV: E=McAfee;i="6600,9927,11077"; a="29771662"
X-IronPort-AV: E=Sophos;i="6.08,173,1712646000"; 
   d="scan'208";a="29771662"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2024 08:51:44 -0700
X-CSE-ConnectionGUID: BqDAHnEyRvevq7qbImrpTw==
X-CSE-MsgGUID: JeDHWUX/SBCeNZ1VcHm58w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,173,1712646000"; 
   d="scan'208";a="32714509"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 19 May 2024 08:51:43 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s8ip2-0003oK-1Y;
	Sun, 19 May 2024 15:51:40 +0000
Date: Sun, 19 May 2024 23:51:29 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:tpm2_key-2 6/7] drivers/char/tpm/tpm2_key.c:50:3:
 error: expected expression
Message-ID: <202405192342.I54wU5nk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm2_key-2
head:   fd3739a598738d788459238040fdb80b4213239a
commit: 59fab73fe3f5c4b13ebee9ea98a64fbaf523a5fc [6/7] tpm: tpm2_key: Extend parser to TPM_LoadableKey
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240519/202405192342.I54wU5nk-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240519/202405192342.I54wU5nk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405192342.I54wU5nk-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/char/tpm/tpm2_key.c:50:3: error: expected expression
                   char buffer[50];
                   ^
>> drivers/char/tpm/tpm2_key.c:51:42: error: use of undeclared identifier 'buffer'
                   sprint_oid(value, vlen, buffer, sizeof(buffer));
                                                          ^
   drivers/char/tpm/tpm2_key.c:51:27: error: use of undeclared identifier 'buffer'
                   sprint_oid(value, vlen, buffer, sizeof(buffer));
                                           ^
   drivers/char/tpm/tpm2_key.c:52:36: error: use of undeclared identifier 'buffer'
                   pr_debug("Unknown OID \"%s\"\n", buffer);
                                                    ^
   4 errors generated.


vim +50 drivers/char/tpm/tpm2_key.c

8c36e89d6c31b4 Jarkko Sakkinen 2024-05-19  34  
8c36e89d6c31b4 Jarkko Sakkinen 2024-05-19  35  int tpm2_key_type(void *context, size_t hdrlen,
8c36e89d6c31b4 Jarkko Sakkinen 2024-05-19  36  		  unsigned char tag,
8c36e89d6c31b4 Jarkko Sakkinen 2024-05-19  37  		  const void *value, size_t vlen)
8c36e89d6c31b4 Jarkko Sakkinen 2024-05-19  38  {
8c36e89d6c31b4 Jarkko Sakkinen 2024-05-19  39  	enum OID oid = look_up_OID(value, vlen);
59fab73fe3f5c4 Jarkko Sakkinen 2024-05-19  40  	struct tpm2_key *key = context;
59fab73fe3f5c4 Jarkko Sakkinen 2024-05-19  41  
59fab73fe3f5c4 Jarkko Sakkinen 2024-05-19  42  	switch (oid) {
59fab73fe3f5c4 Jarkko Sakkinen 2024-05-19  43  	case OID_TPMSealedData:
59fab73fe3f5c4 Jarkko Sakkinen 2024-05-19  44  		pr_info("TPMSealedData\n");
59fab73fe3f5c4 Jarkko Sakkinen 2024-05-19  45  		break;
59fab73fe3f5c4 Jarkko Sakkinen 2024-05-19  46  	case OID_TPMLoadableKey:
59fab73fe3f5c4 Jarkko Sakkinen 2024-05-19  47  		pr_info("TPMSealedData\n");
59fab73fe3f5c4 Jarkko Sakkinen 2024-05-19  48  		break;
59fab73fe3f5c4 Jarkko Sakkinen 2024-05-19  49  	default:
8c36e89d6c31b4 Jarkko Sakkinen 2024-05-19 @50  		char buffer[50];
8c36e89d6c31b4 Jarkko Sakkinen 2024-05-19 @51  		sprint_oid(value, vlen, buffer, sizeof(buffer));
59fab73fe3f5c4 Jarkko Sakkinen 2024-05-19  52  		pr_debug("Unknown OID \"%s\"\n", buffer);
8c36e89d6c31b4 Jarkko Sakkinen 2024-05-19  53  		return -EINVAL;
8c36e89d6c31b4 Jarkko Sakkinen 2024-05-19  54  	}
8c36e89d6c31b4 Jarkko Sakkinen 2024-05-19  55  
59fab73fe3f5c4 Jarkko Sakkinen 2024-05-19  56  	key->oid = oid;
8c36e89d6c31b4 Jarkko Sakkinen 2024-05-19  57  	return 0;
8c36e89d6c31b4 Jarkko Sakkinen 2024-05-19  58  }
8c36e89d6c31b4 Jarkko Sakkinen 2024-05-19  59  

:::::: The code at line 50 was first introduced by commit
:::::: 8c36e89d6c31b433e1f3e06541eed1f687eaac81 KEYS: trusted: Migrate tpm2_key_{encode,decode}() to TPM driver

:::::: TO: Jarkko Sakkinen <jarkko@kernel.org>
:::::: CC: Jarkko Sakkinen <jarkko@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
