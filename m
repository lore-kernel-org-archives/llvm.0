Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120372D606;
	Thu, 30 Nov 2023 08:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n+2oiEFj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701333298; x=1732869298;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a2emFW/pYIZT22CzuAF7ilu2Gp7hHYy2RbRZGPMx4AQ=;
  b=n+2oiEFjpVBfi7ILc9T5CS+MaZcH+vXnwtuHFRz/YyM0QybToXgvWL5m
   f87Wjlvd7hzO+Tz9njmhWl1U5xvHbOTQHputsgdwxclh24lrBc8L2N92O
   oULQ3XUa08jJ5aPxCJne6kt68eHpM1rAcP3vTq8IPKQuj3jtOG0iMF+qA
   hKzW7DnnAfkEDYazi5an/LJV5JGhal6qwcoGZurZ9iHFOxSMQuP2QjC3Y
   6cSLStlaCplc5U5AZmwB6b1wyIlaKyJ1j2aT0c1ljAw+FHUGA1Qqh91RX
   gUelHIHN5rrZNV8DnR7wmicQoM0IGZkkB8Q1I5+GT2fIgWmsdrFSg972Y
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="390451528"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="390451528"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 00:34:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="17314277"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 30 Nov 2023 00:34:56 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8cVZ-0001aC-1M;
	Thu, 30 Nov 2023 08:34:53 +0000
Date: Thu, 30 Nov 2023 16:34:18 +0800
From: kernel test robot <lkp@intel.com>
To: Masahisa Kojima <masahisa.kojima@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>
Subject: [linux-next:master 3754/4102]
 drivers/firmware/efi/stmm/tee_stmm_efi.c:524:6: warning: no previous
 prototype for function 'tee_stmm_restore_efivars_generic_ops'
Message-ID: <202311301520.nKnDVxjA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3cd3fe06ff81cfb3a969acb12a56796cff5af23d
commit: 8ffb9a25b9d5947cb4a2442754cbaee82d98f8a0 [3754/4102] efi: Add tee-based EFI variable driver
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20231130/202311301520.nKnDVxjA-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231130/202311301520.nKnDVxjA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311301520.nKnDVxjA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/efi/stmm/tee_stmm_efi.c:524:6: warning: no previous prototype for function 'tee_stmm_restore_efivars_generic_ops' [-Wmissing-prototypes]
     524 | void tee_stmm_restore_efivars_generic_ops(void)
         |      ^
   drivers/firmware/efi/stmm/tee_stmm_efi.c:524:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     524 | void tee_stmm_restore_efivars_generic_ops(void)
         | ^
         | static 
   1 warning generated.


vim +/tee_stmm_restore_efivars_generic_ops +524 drivers/firmware/efi/stmm/tee_stmm_efi.c

   523	
 > 524	void tee_stmm_restore_efivars_generic_ops(void)
   525	{
   526		efivars_unregister(&tee_efivars);
   527		efivars_generic_ops_register();
   528	}
   529	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
