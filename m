Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4EF4A1F
	for <llvm@lists.linux.dev>; Tue,  9 Aug 2022 23:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660087928; x=1691623928;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GnyjgHSWMN0s1QRaGr/yenGO/uA3yDht7mg4g98kpS4=;
  b=fyCX3JiPZ4bWEaYUY9//cG8P888zG87KHzfpNUKg36olDPauDO6EjGvQ
   6aL5vL4batuH2PNg8PpGxdLiMy63FrUfyeJnDH+tV+TFILEfen56QsCys
   /eXTu4HDQ+NxC6EXOQL/b121/jPOKrSvVDxU7uzZczJY4t6WiyseGPZgE
   hK6b3OcIq85fmJmXvbgLIoUNOeR/FwDZiVJkL17jijR+JGRGKoLHLvlfF
   q9duG+m0E8ex/J5+2a4Oya0PQfLZm2DjfxRtkapvlFQ90u0p9PTUtV1NK
   82RHRnM9tj0o2O+WyUEBVgcHs5d31BAv2iQ7tEvF0eH/bva5qrr24t6LN
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10434"; a="377248037"
X-IronPort-AV: E=Sophos;i="5.93,225,1654585200"; 
   d="scan'208";a="377248037"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2022 16:32:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,225,1654585200"; 
   d="scan'208";a="781038055"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 09 Aug 2022 16:32:03 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oLYhe-000NLx-1n;
	Tue, 09 Aug 2022 23:32:02 +0000
Date: Wed, 10 Aug 2022 07:31:34 +0800
From: kernel test robot <lkp@intel.com>
To: Sathvika Vasireddy <sv@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, jpoimboe@redhat.com,
	peterz@infradead.org, linux-kernel@vger.kernel.org, aik@ozlabs.ru,
	mpe@ellerman.id.au, mingo@redhat.com, christophe.leroy@csgroup.eu,
	rostedt@goodmis.org, mbenes@suse.cz, npiggin@gmail.com,
	chenzhongjin@huawei.com, linux-arm-kernel@lists.infradead.org,
	naveen.n.rao@linux.vnet.ibm.com, sv@linux.ibm.com
Subject: Re: [PATCH 06/16] powerpc: Fix objtool unannotated intra-function
 call warnings on PPC32
Message-ID: <202208100751.LiiKZjrx-lkp@intel.com>
References: <20220808114908.240813-7-sv@linux.ibm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220808114908.240813-7-sv@linux.ibm.com>

Hi Sathvika,

I love your patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v5.19 next-20220809]
[cannot apply to powerpc/next powerpc/topic/ppc-kvm masahiroy-kbuild/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sathvika-Vasireddy/objtool-Enable-and-implement-mcount-option-on-powerpc/20220808-200702
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 4e23eeebb2e57f5a28b36221aa776b5a1122dde5
config: powerpc-randconfig-r024-20220808 (https://download.01.org/0day-ci/archive/20220810/202208100751.LiiKZjrx-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 5f1c7e2cc5a3c07cbc2412e851a7283c1841f520)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/bcefd9c9f24358413a1b210aa591c8758f58b3a9
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Sathvika-Vasireddy/objtool-Enable-and-implement-mcount-option-on-powerpc/20220808-200702
        git checkout bcefd9c9f24358413a1b210aa591c8758f58b3a9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash arch/powerpc/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> <unknown>:0: error: symbol '__kuep_lock' is already defined

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
