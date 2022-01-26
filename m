Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1ED29CA
	for <llvm@lists.linux.dev>; Wed, 26 Jan 2022 13:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643205478; x=1674741478;
  h=date:from:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=E8t3LitSRBF/9GqXXOBVsEDeFLttFiDRQTVUOOe+3YU=;
  b=VgEZ14CGR6YEzZlRSQp0XpWjvoo3KyAN1iA/6LmpHiTsDaD/a0XfFb80
   kVex4n5dPSRJ/GpZfwizcQjSWSZ5XQwGc/4sxNQwe0h6b3nJd86DAXTlJ
   5yAMBK0zrnTeCJ9hxjUFFz9eEZIgyQ2kjxPMdjpP27EgBaLD0T+VaCmdD
   +Mp5QG8eQJQ3wJaVCMomv+RZ9XOAxl6tybAfTLgmzLm87g0hnaarwichk
   6jcOkSBSOhKxw/Im9QhxKbmN8eryRkXv9urW7alVhAEEWFkQhOTSc9RZh
   XZZxrCH7r2fsmTmmXiBNduo493mSkgVzvC4Dg9MU4xEbsg1CEC3siM5nN
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="227224204"
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; 
   d="scan'208";a="227224204"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2022 05:57:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; 
   d="scan'208";a="477486281"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 26 Jan 2022 05:57:56 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nCio7-000LGb-6b; Wed, 26 Jan 2022 13:57:55 +0000
Date: Wed, 26 Jan 2022 21:57:03 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: Re: [PATCH 1/7] crypto: DRBG - remove internal reseeding operation
Message-ID: <202201262115.AVuVkS5I-lkp@intel.com>
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

In-Reply-To: <2450379.h6RI2rZIcs@positron.chronox.de>
References: <2450379.h6RI2rZIcs@positron.chronox.de>
TO: "Stephan Müller" <smueller@chronox.de>
TO: herbert@gondor.apana.org.au
CC: linux-crypto@vger.kernel.org
CC: simo@redhat.com
CC: Nicolai Stange <nstange@suse.de>

Hi "Stephan,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on herbert-cryptodev-2.6/master]
[also build test ERROR on herbert-crypto-2.6/master linus/master v5.17-rc1 next-20220125]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Stephan-M-ller/Common-entropy-source-and-DRNG-management/20220126-150911
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
config: i386-randconfig-a006 (https://download.01.org/0day-ci/archive/20220126/202201262115.AVuVkS5I-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 2a1b7aa016c0f4b5598806205bdfbab1ea2d92c4)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/14ec08bbd20e04299353eb31a9d43d4ac9af2b22
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Stephan-M-ller/Common-entropy-source-and-DRNG-management/20220126-150911
        git checkout 14ec08bbd20e04299353eb31a9d43d4ac9af2b22
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: call to __compiletime_assert_220 marked "dontcall-error": BUILD_BUG_ON failed: ARRAY_SIZE(drbg_cores) != ARRAY_SIZE(drbg_algs)

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
