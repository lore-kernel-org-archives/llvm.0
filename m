Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391A4173
	for <llvm@lists.linux.dev>; Fri, 10 Dec 2021 22:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639176562; x=1670712562;
  h=date:from:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=xnGUiH2xBo93rP//UiobvnuEPVpahvRM4l2eIjRWQaI=;
  b=II3Qlg2tarO1jtgHeXVd1OXijsJip6SZbGOPa09hZmWuYeG48JapC59E
   BSAVf7+fkurghcuzN/8kXOfhMI5ofMz6j0u33LWSctlmBA379Rc2/DJUm
   cwk9Ih3usgB3/OStKSGCw/Nm39FIll63jRBWhPm3FK4ReZNoKgcMP9Edg
   Ln7yXLNqyqkl9sc3U+xidlOTL77ANecVJ2SZED26445/g0n1kcIS2wFSa
   1hoG5wlGX+/lSK3mHOm8PJhey3la9P148JeWX8Up3DgYXWGVD03crnqH/
   TeXbAWNwCKYlzRwMmuSOMDOPxV/PaKyX9kxyfA09c5YuiXiYt8sn1KDUj
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10194"; a="238688638"
X-IronPort-AV: E=Sophos;i="5.88,196,1635231600"; 
   d="scan'208";a="238688638"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2021 14:49:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,196,1635231600"; 
   d="scan'208";a="516964400"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 10 Dec 2021 14:49:20 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mvohb-0003lb-Vp; Fri, 10 Dec 2021 22:49:19 +0000
Date: Sat, 11 Dec 2021 06:48:33 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [linux-next:master 2994/5842] crypto/kdf_sp800108.o: warning:
 objtool: crypto_kdf108_init()+0x194: unreachable instruction
Message-ID: <202112110621.5er4Fgds-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.10.1 (2018-07-13)

CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "Stephan Müller" <smueller@chronox.de>
CC: Herbert Xu <herbert@gondor.apana.org.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4eee8d0b64ecc3231040fa68ba750317ffca5c52
commit: d3b04a4398fe8022c9ca4b5ac6ab08059334b180 [2994/5842] security: DH - use KDF implementation from crypto API
config: x86_64-randconfig-a015-20211205 (https://download.01.org/0day-ci/archive/20211211/202112110621.5er4Fgds-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5f1d1854eb1450d352663ee732235893c5782237)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=d3b04a4398fe8022c9ca4b5ac6ab08059334b180
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout d3b04a4398fe8022c9ca4b5ac6ab08059334b180
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> crypto/kdf_sp800108.o: warning: objtool: crypto_kdf108_init()+0x194: unreachable instruction

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
