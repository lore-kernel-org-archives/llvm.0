Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D03D2EC;
	Sat, 25 Feb 2023 01:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677288858; x=1708824858;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vxe6CDj1Lm1+rHMcUhTMcojlb9dqwqcr/HMs0NPEDxg=;
  b=ZtSfrBRoqmvqXdj/95h7igdiE969tmKgWVqjXxgOKv/+Cbf4+Q46hvFf
   BloVH9mwAaOXbM51pCWw75WVfAqDEs51vmKAnm3ZIs10BSEzCdRDtFe7f
   e4AxqLPXsYwa8Uj4RLw93t006o+TVWtmrcq9CGgG8XcUAh4gDFC9YAnOb
   lcMqdaCW6ngqNc3LQDhYC2HH4Ud7wTO+IYap/H4/wlu6yB/cUFC3hTfQ6
   ijo2k9TDJA1ilbpaQlURDHdBx2jwdQvtrKTmx9b/r7+0/yFkejBeXTSEH
   ZUT+pGDzCg/N4z1ylxdt+io8MCtccbF+O4mIZG1WsliaflpdhZKBEzrDH
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="332306946"
X-IronPort-AV: E=Sophos;i="5.97,326,1669104000"; 
   d="scan'208";a="332306946"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2023 17:34:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="815926834"
X-IronPort-AV: E=Sophos;i="5.97,326,1669104000"; 
   d="scan'208";a="815926834"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 24 Feb 2023 17:34:13 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVjS0-0002qB-3B;
	Sat, 25 Feb 2023 01:34:12 +0000
Date: Sat, 25 Feb 2023 09:33:30 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Chiu <andy.chiu@sifive.com>, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, anup@brainfault.org, atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	vineetg@rivosinc.com, greentime.hu@sifive.com,
	guoren@linux.alibaba.com, Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH -next v14 19/19] riscv: Enable Vector code to be built
Message-ID: <202302250924.ukv4ZxOc-lkp@intel.com>
References: <20230224170118.16766-20-andy.chiu@sifive.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230224170118.16766-20-andy.chiu@sifive.com>

Hi Andy,

I love your patch! Perhaps something to improve:

[auto build test WARNING on next-20230224]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Chiu/riscv-Rename-__switch_to_aux-fpu/20230225-011059
patch link:    https://lore.kernel.org/r/20230224170118.16766-20-andy.chiu%40sifive.com
patch subject: [PATCH -next v14 19/19] riscv: Enable Vector code to be built
config: riscv-randconfig-r014-20230222 (https://download.01.org/0day-ci/archive/20230225/202302250924.ukv4ZxOc-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/cd0ad21a9ef9d63f1eef80fd3b09ae6e0d884ce3
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Andy-Chiu/riscv-Rename-__switch_to_aux-fpu/20230225-011059
        git checkout cd0ad21a9ef9d63f1eef80fd3b09ae6e0d884ce3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash lib/zstd/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302250924.ukv4ZxOc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
--
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
--
   lib/zstd/compress/huf_compress.c:471:16: warning: unused function 'HUF_isSorted' [-Wunused-function]
   MEM_STATIC int HUF_isSorted(nodeElt huffNode[], U32 const maxSymbolValue1) {
                  ^
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   1 warning generated.
--
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
--
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
--
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
--
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
--
   lib/zstd/compress/zstd_lazy.c:835:16: warning: unused function 'ZSTD_isAligned' [-Wunused-function]
   MEM_STATIC int ZSTD_isAligned(void const* ptr, size_t align) {
                  ^
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   1 warning generated.
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
