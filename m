Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7064F192D77;
	Sun, 16 Feb 2025 14:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739714902; cv=none; b=cQ9/6cw3nV7y+howft1zUcFOQuCFv9DUwdpAycKaZoxS+bYVeMeN6DBoTsyxcSr1addSnnFR19iYBK0rfNC0UwdfwmpES+nEaaOedovUVHZ7XruBOiLueZjXQGvMT3zQCpnAKnxFlZKlapxGhZszOOzkixSL8OxScnF29NXaHTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739714902; c=relaxed/simple;
	bh=9U1SbcyuKT/9AM4ZIsNUKKd0YmfxcKqCMRSD3rg+DIw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dp2mx+cHoANBCoV88X/crP7Fb4FfXpgE3utvfYzA7baGCGZLCL1TjzrJDa8AtIjOe3fB34FQYZNkqjq0qD+ZON+2ppE1rQCUlGt6FyljvQtTQbCRnAHF8te5eZKEF4mEg1qND0AqfFz5PCmjzA2c9xNZP5wpSMc2+mlKxm2oBXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OJ/h9ajV; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OJ/h9ajV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739714900; x=1771250900;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9U1SbcyuKT/9AM4ZIsNUKKd0YmfxcKqCMRSD3rg+DIw=;
  b=OJ/h9ajV2GP5+4aR5Iey7CBymwjDSp7ic/1n/2jhBSdo9Yj2l0kfXYWJ
   Enjl0GEvQpfpKn3aFb5eGfYi9IFaq5UYcFxoRRlKV14gMfzK3y9rpZLcb
   mq+S3Bdr71cYfsSZY+A3+9yThHgyu0eHAFf0m9N9FmbeWQCEOeUb/jLWk
   i70VRxc6ZIV7OJKvnypn06D87/6VXoAwlBVJs0yDOsSXCPsD1oTsNNzYW
   vFf8UinM3Rymv1af7R0Oez+n+6cbGl+C8eT9pFsqNV9InyYqv3DVvzrf+
   WEalmJf3q4TEt5bmGCRS6szcdEUKtIfZpF8vExl872W8RwYAn1REDQ67M
   g==;
X-CSE-ConnectionGUID: yFzWyPS5QMee9XJfUudcoQ==
X-CSE-MsgGUID: 5T8oEyvaSlqHniy12KQiHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="51833087"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="51833087"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2025 06:08:15 -0800
X-CSE-ConnectionGUID: uYJZrgzzToiNFy2Zb7mKrw==
X-CSE-MsgGUID: a36bBDl1TWiQzrU1giFDwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,291,1732608000"; 
   d="scan'208";a="113766256"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 16 Feb 2025 06:08:14 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjfJc-001Byd-0W;
	Sun, 16 Feb 2025 14:08:12 +0000
Date: Sun, 16 Feb 2025 22:08:11 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Vyukov <dvyukov@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dvyukov:dvyukov-rseq-pkey 1/3] arch/x86/kernel/process.c:270:2:
 error: call to undeclared function 'pkru_write_default'; ISO C99 and later
 do not support implicit function declarations
Message-ID: <202502162255.fYDLueTx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/dvyukov/linux dvyukov-rseq-pkey
head:   1063b1cd65e97d1ec20c1e016f8d4414d1c40df8
commit: 963efc053e92eb50c830ad41445a77e8607b5d98 [1/3] pkeys: add API to switch to permissive pkey register
config: i386-buildonly-randconfig-003-20250216 (https://download.01.org/0day-ci/archive/20250216/202502162255.fYDLueTx-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250216/202502162255.fYDLueTx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502162255.fYDLueTx-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/process.c:270:2: error: call to undeclared function 'pkru_write_default'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     270 |         pkru_write_default();
         |         ^
   1 error generated.
--
>> arch/x86/kernel/fpu/core.c:706:2: error: call to undeclared function 'pkru_write_default'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     706 |         pkru_write_default();
         |         ^
   1 error generated.
--
>> arch/x86/kernel/cpu/common.c:534:2: error: call to undeclared function 'pkru_write_default'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     534 |         pkru_write_default();
         |         ^
   1 error generated.


vim +/pkru_write_default +270 arch/x86/kernel/process.c

2fff071d28b54f Thomas Gleixner 2019-11-11  263  
33344368cb08f8 Andy Lutomirski 2021-06-23  264  static void pkru_flush_thread(void)
33344368cb08f8 Andy Lutomirski 2021-06-23  265  {
33344368cb08f8 Andy Lutomirski 2021-06-23  266  	/*
33344368cb08f8 Andy Lutomirski 2021-06-23  267  	 * If PKRU is enabled the default PKRU value has to be loaded into
33344368cb08f8 Andy Lutomirski 2021-06-23  268  	 * the hardware right here (similar to context switch).
33344368cb08f8 Andy Lutomirski 2021-06-23  269  	 */
33344368cb08f8 Andy Lutomirski 2021-06-23 @270  	pkru_write_default();
33344368cb08f8 Andy Lutomirski 2021-06-23  271  }
33344368cb08f8 Andy Lutomirski 2021-06-23  272  

:::::: The code at line 270 was first introduced by commit
:::::: 33344368cb08f8d6bf55a32aa052318d3a69ea84 x86/fpu: Clean up the fpu__clear() variants

:::::: TO: Andy Lutomirski <luto@kernel.org>
:::::: CC: Borislav Petkov <bp@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
