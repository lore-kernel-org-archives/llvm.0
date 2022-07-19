Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45621C04
	for <llvm@lists.linux.dev>; Tue, 19 Jul 2022 13:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658235737; x=1689771737;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aS+GcxlKC0jA3okV/2u3UIxu+JofoO/qq8pfz+eWpow=;
  b=Cd44BTJxZ3ZxjCTkLSZSa8VMzsmH5cCf1Y5RpVEqH0VM5VnC+k3V2BIz
   3kwgnYTUVLUJ6lnsp/fldoT3sUjHI6XJ4moEQwot0Usb+/4Y1+kGM5eis
   gIBATZFYYfh/BI26PHei7QAljA3s8kZzgu1/gCUnxBpKPyGhbqGHnqXHH
   Ii3k/I6A5i6CPZkNo5YGVS6GC8+NH2dTojXLvoD6jmJ2wyS1ZsDj4G9D1
   u3M94ZkmFNMc3dwLaD8mn0G15AOKEsuQpttYL+4l2y9gR3VkKJvGes7B+
   wI3IeV1oGvKryThq3oJvgoTBgdbrGptqNCg2/bSMKm6Xt874kSkLbuO0/
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10412"; a="350447453"
X-IronPort-AV: E=Sophos;i="5.92,284,1650956400"; 
   d="scan'208";a="350447453"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2022 06:02:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,284,1650956400"; 
   d="scan'208";a="774114823"
Received: from lkp-server02.sh.intel.com (HELO ff137eb26ff1) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 19 Jul 2022 06:02:14 -0700
Received: from kbuild by ff137eb26ff1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oDmrd-0005fb-FX;
	Tue, 19 Jul 2022 13:02:13 +0000
Date: Tue, 19 Jul 2022 21:01:24 +0800
From: kernel test robot <lkp@intel.com>
To: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, netdev@vger.kernel.org,
	edumazet@google.com, pabeni@redhat.com, borisp@nvidia.com,
	john.fastabend@gmail.com, maximmi@nvidia.com, tariqt@nvidia.com,
	vfedorenko@novek.ru, Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH net-next 7/7] tls: rx: do not use the standard strparser
Message-ID: <202207192015.4YzT5lNo-lkp@intel.com>
References: <20220718194811.1728061-8-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220718194811.1728061-8-kuba@kernel.org>

Hi Jakub,

I love your patch! Perhaps something to improve:

[auto build test WARNING on net-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Jakub-Kicinski/tls-rx-decrypt-from-the-TCP-queue/20220719-035116
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git 6e693a104207fbf5a22795c987e8964c0a1ffe2d
config: i386-randconfig-a005-20220718 (https://download.01.org/0day-ci/archive/20220719/202207192015.4YzT5lNo-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d74b88c69dc2644bd0dc5d64e2d7413a0d4040e5)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/2a6e8eea293987aa4507bf82c5952f49752c9be3
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jakub-Kicinski/tls-rx-decrypt-from-the-TCP-queue/20220719-035116
        git checkout 2a6e8eea293987aa4507bf82c5952f49752c9be3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux.o(.init.text+0x4791a): Section mismatch in reference from the function tls_register() to the function .exit.text:tls_device_cleanup()
The function __init tls_register() references
a function __exit tls_device_cleanup().
This is often seen when error handling in the init function
uses functionality in the exit path.
The fix is often to remove the __exit annotation of
tls_device_cleanup() so it may be used outside an exit section.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
