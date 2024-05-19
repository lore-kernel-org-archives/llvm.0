Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABD41EB46;
	Sun, 19 May 2024 15:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716133305; cv=none; b=YS8KiODOZ4+qiw0lq+nV9OM0+aNZKc+8bz6v2kT42IDkViIseLdUIj2iDExBwK4pPCGyfQ9PnMlJkeLxfDenawwhT+vNZMCMwNu0xqORwM65ej21vOPZE3eTRYTbToLHt/iHctL44RnEeXQtjLdrvk4x7x9GAZHCo2G4PeJBNB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716133305; c=relaxed/simple;
	bh=7t+HpUR8WdMiM1d8ZDxXrCCWs/CR3sM3ZsOsr7IQ930=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fv0oII52fB6nEFdQ2+Ks1dtSI8brPnGzadvJ3Icq5V7TbFKo7zXN65M3b4i6kMutKOzOj6A2oaTHnpGSVJs9aYEFxyPtNGvTQxgITinvMF/CPg0QVirEqo9vN1CoMDntuOPco9USEBc1q2dJXpE6yfHZMvH07cR6TdJf+/1oLRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iTbHoEE5; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iTbHoEE5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716133304; x=1747669304;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7t+HpUR8WdMiM1d8ZDxXrCCWs/CR3sM3ZsOsr7IQ930=;
  b=iTbHoEE5p5Z7dIE+W8ggMFhtfOT7mMR29F208feCUlwRmmxcEebH2WaE
   60Aacw0lEmxx0ik4dg2PXNNw4CtdVfUPfndnkHqE4kPV+HbllojlK6pCb
   7qWbllHEWp+451FmN6n6qAW3LIzfO9GbKJ2wAtvgS0XZU9mpFRGuRFpup
   qcJgG4nmRhSs+0OnV53akAAegPjlw6LWtaigN7tiV7XMfAHf2Bylf2xRa
   eiQGgrwW0rCE4EQubB/czSM2t/uQtJj8ATbratL6Y68RkSgMuhy5HqsQI
   CjGPLUFqJ2S3H4WeHqpAwrYEacgzM2a3zKJayr/8333EHRTs0VntmUmqN
   Q==;
X-CSE-ConnectionGUID: n7Gf/KwuTTWu5T4IDW810g==
X-CSE-MsgGUID: wVlolWncT2GoOWLCMRY8iA==
X-IronPort-AV: E=McAfee;i="6600,9927,11077"; a="37640853"
X-IronPort-AV: E=Sophos;i="6.08,173,1712646000"; 
   d="scan'208";a="37640853"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2024 08:41:43 -0700
X-CSE-ConnectionGUID: MxlpP9MXS2itA3zpUEXvwQ==
X-CSE-MsgGUID: X36e+/eeTi2JHA5NtlRNag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,173,1712646000"; 
   d="scan'208";a="32855013"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 19 May 2024 08:41:41 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s8ifK-0003lW-2R;
	Sun, 19 May 2024 15:41:38 +0000
Date: Sun, 19 May 2024 23:40:42 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:tpm2_key-2 6/7] drivers/char/tpm/tpm2_key.c:50:3:
 warning: label followed by a declaration is a C23 extension
Message-ID: <202405192308.79SMmvx5-lkp@intel.com>
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
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240519/202405192308.79SMmvx5-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240519/202405192308.79SMmvx5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405192308.79SMmvx5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/char/tpm/tpm2_key.c:50:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
      50 |                 char buffer[50];
         |                 ^
   1 warning generated.


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
8c36e89d6c31b4 Jarkko Sakkinen 2024-05-19  51  		sprint_oid(value, vlen, buffer, sizeof(buffer));
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
