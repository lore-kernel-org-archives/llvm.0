Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27114414
	for <llvm@lists.linux.dev>; Tue, 12 Jul 2022 15:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657639230; x=1689175230;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m/Ljrzb0wdk+SuO1GdgtrcShfQPZzfMzULeN2HEj9R0=;
  b=jM8oSbQV/OmKCogiYFbfkkuwU7zfFijyuMzgiyVgOesqG3rakfOORUME
   tM2Ne/UxEtOhm5Jht4taZbTPbWKiXuKTTBxwMN3ca6F5jIyidPWVZb+9l
   /qiEBUL0rCSAeRy1K+59DyFBvl6+Ad4HWjq9NArkp6Nol0HogGkd+mibl
   CNkCj0nOXD2XYwJ3g9HytzaLze0CUsGcDJraLTNtEQa/lbaUFbE0e1XJE
   cSsFbfqPx9gba2h0rY1FtTThNZJ86P4RPC/+JjtN1TOyqBEZ4LSL8jR7S
   PKt38FF0aiB6nCOqBc+5Bel0PMFJn/4UFBN/LiZM7E9IbWGfcqindfEOs
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10406"; a="348937835"
X-IronPort-AV: E=Sophos;i="5.92,266,1650956400"; 
   d="scan'208";a="348937835"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2022 08:20:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,266,1650956400"; 
   d="scan'208";a="922247408"
Received: from lkp-server02.sh.intel.com (HELO 8708c84be1ad) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 12 Jul 2022 08:20:21 -0700
Received: from kbuild by 8708c84be1ad with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oBHgS-0002KZ-LE;
	Tue, 12 Jul 2022 15:20:20 +0000
Date: Tue, 12 Jul 2022 23:20:04 +0800
From: kernel test robot <lkp@intel.com>
To: Coiby Xu <coxu@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-integrity@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>
Subject: [zohar-integrity:next-integrity-testing 4/6]
 security/integrity/ima/ima_efi.c:72:4: error: call to undeclared function
 'set_kexec_sig_enforced'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202207122330.FCO2VFHx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/zohar/linux-integrity.git next-integrity-testing
head:   e56ed3d80c69511a4af9db0b76e54e6763a63ef1
commit: 7be7b6c5b42fe7661a3abfaecf0910255781771f [4/6] ima: force signature verification when CONFIG_KEXEC_SIG is configured
config: arm64-randconfig-r032-20220712 (https://download.01.org/0day-ci/archive/20220712/202207122330.FCO2VFHx-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project badda4ac3c489a8c8cccdad1f74b9308c350a9e0)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/zohar/linux-integrity.git/commit/?id=7be7b6c5b42fe7661a3abfaecf0910255781771f
        git remote add zohar-integrity https://git.kernel.org/pub/scm/linux/kernel/git/zohar/linux-integrity.git
        git fetch --no-tags zohar-integrity next-integrity-testing
        git checkout 7be7b6c5b42fe7661a3abfaecf0910255781771f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash security/integrity/ima/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> security/integrity/ima/ima_efi.c:72:4: error: call to undeclared function 'set_kexec_sig_enforced'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                           set_kexec_sig_enforced();
                           ^
   security/integrity/ima/ima_efi.c:72:4: note: did you mean 'set_module_sig_enforced'?
   include/linux/module.h:809:20: note: 'set_module_sig_enforced' declared here
   static inline void set_module_sig_enforced(void)
                      ^
   1 error generated.


vim +/set_kexec_sig_enforced +72 security/integrity/ima/ima_efi.c

    65	
    66	const char * const *arch_get_ima_policy(void)
    67	{
    68		if (IS_ENABLED(CONFIG_IMA_ARCH_POLICY) && arch_ima_get_secureboot()) {
    69			if (IS_ENABLED(CONFIG_MODULE_SIG))
    70				set_module_sig_enforced();
    71			if (IS_ENABLED(CONFIG_KEXEC_SIG))
  > 72				set_kexec_sig_enforced();

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
