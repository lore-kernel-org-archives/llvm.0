Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9561866
	for <llvm@lists.linux.dev>; Wed, 23 Mar 2022 13:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648040913; x=1679576913;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i1O7g1/0dKBggLIHefOqOvGFhlN5lRiK17nkgLtYtdE=;
  b=V/jECGIljnhSLGowtvP/6VJUrvyaN5fCmzGHlGRNBaqgNSLhv21nCZQ3
   X+bKDI4itf+95rsXeJiwWSPCu8r0f/l/u6Z9dW6N9LD8lGT3jN/ftN6Z4
   H62mVRQ+unR2KJk0pM1TT6YIhwRYSA6rBJ2Z+oG9zsLkeTaFrNtGPjJJZ
   7V4K5S1gvxUVnXtIZrDR1TLFCsXtGEeQhEV/QOsOLa64bJcKuzMal/f02
   QWQ5aVv1dY+zPxUFoWm6kmd91Tc/CqXJfzNd8hZJw3SGZ+LUFXdBRCd4E
   qVfnPTX5ROHifqOWLXZnKC/3NVR1Otci5Z6mT3ZMrImyY9bQNAyAAdPWq
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10294"; a="255667475"
X-IronPort-AV: E=Sophos;i="5.90,204,1643702400"; 
   d="scan'208";a="255667475"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2022 06:08:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,204,1643702400"; 
   d="scan'208";a="544186349"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 23 Mar 2022 06:08:30 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nX0iz-000K4n-Jw; Wed, 23 Mar 2022 13:08:29 +0000
Date: Wed, 23 Mar 2022 21:08:26 +0800
From: kernel test robot <lkp@intel.com>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Tony Luck <tony.luck@intel.com>,
	Andi Kleen <ak@linux.intel.com>
Subject: [intel-tdx:guest-rebased 5/83] ./usr/include/misc/tdx.h:39:2: error:
 unknown type name 'size_t'
Message-ID: <202203232011.Qp6mjB89-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/intel/tdx.git guest-rebased
head:   2445b5e99855f3c241a44d2777a74a777f56048c
commit: a7b0255d5b64842244f1957e33eb514d8f82866f [5/83] platform/x86: intel_tdx_attest: Add TDX Guest attestation interface driver
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20220323/202203232011.Qp6mjB89-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 902f4708fe1d03b0de7e5315ef875006a6adc319)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/tdx/commit/a7b0255d5b64842244f1957e33eb514d8f82866f
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx guest-rebased
        git checkout a7b0255d5b64842244f1957e33eb514d8f82866f
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/misc/tdx.h:38:11: error: expected ';' at end of declaration list
           void *buf __user;
                    ^
                    ;
>> ./usr/include/misc/tdx.h:39:2: error: unknown type name 'size_t'
           size_t len;
           ^
   2 errors generated.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
