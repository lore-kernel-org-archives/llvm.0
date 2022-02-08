Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CF52F27
	for <llvm@lists.linux.dev>; Tue,  8 Feb 2022 19:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644347858; x=1675883858;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Z+/ZhlZfN8urvngUZOAkwEthFZweIWqTp3B3BsJLz/Y=;
  b=UIX80OQZzlG2Fh7c1tvV79d+bQMJ1h/QDgYIcM+SPKBSxyqSi2GIT3r+
   qmPorV1v0p8kJIfjGgKTwXZeoHSg46eobPXsDL8LQtER1yEcJaxuGHBSk
   vmEC5Z+WuKNROZcKGW1XbKKxBdMvVTnZmKN1CKLUma365G/ECCO982ALj
   5k3/8HPn/g3+HYizxm9TLve5ZfPi/aVCxEsizTMYeRUNbTyoN4mFuhTKB
   w7pyxfFSZHxuO9SmsMLMgs5aMZGmUQOM9A7mWL2tR3nqvmo6E1W/N+4XC
   1Fhetw7TpQHpCMjlhB69XaUAdyPbAxxWgYFPIlrCXIOBamGxqmmxC6v/q
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="248978052"
X-IronPort-AV: E=Sophos;i="5.88,353,1635231600"; 
   d="scan'208";a="248978052"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2022 11:16:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,353,1635231600"; 
   d="scan'208";a="484924865"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 08 Feb 2022 11:16:04 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nHVy7-0000cj-JR; Tue, 08 Feb 2022 19:16:03 +0000
Date: Wed, 9 Feb 2022 03:15:31 +0800
From: kernel test robot <lkp@intel.com>
To: Tong Zhang <ztong0001@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH] KEYS: trusted: fix crash when TPM/TEE are built as module
Message-ID: <202202090354.jnH19acv-lkp@intel.com>
References: <20220204200342.48665-1-ztong0001@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220204200342.48665-1-ztong0001@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Tong,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on v5.17-rc2]
[also build test ERROR on next-20220208]
[cannot apply to jmorris-security/next-testing]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Tong-Zhang/KEYS-trusted-fix-crash-when-TPM-TEE-are-built-as-module/20220205-040706
base:    26291c54e111ff6ba87a164d85d4a4e134b7315c
config: i386-randconfig-a011 (https://download.01.org/0day-ci/archive/20220209/202202090354.jnH19acv-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project e8bff9ae54a55b4dbfeb6ba55f723abbd81bf494)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/1f9dab49ae11af2bde1b057f7104ded0714ae7dd
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Tong-Zhang/KEYS-trusted-fix-crash-when-TPM-TEE-are-built-as-module/20220205-040706
        git checkout 1f9dab49ae11af2bde1b057f7104ded0714ae7dd
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: trusted_key_tee_ops
   >>> referenced by trusted_core.c
   >>>               keys/trusted-keys/trusted_core.o:(trusted_key_sources) in archive security/built-in.a

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
