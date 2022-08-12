Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7EC46AB
	for <llvm@lists.linux.dev>; Fri, 12 Aug 2022 19:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660331394; x=1691867394;
  h=date:from:cc:subject:message-id:mime-version;
  bh=fPOWvNaouFHaEXBLeHMJCnfFrQ2HIJXfWcVY9MHrTV0=;
  b=NrmvvomZSKWLSzu3x8lP9jyIRLPo1AU/we8ptg4N98ayB2Ep1JeXqpMi
   QbJPQf3BFdn4av/TBw0ynVxc3l1oPyrA4ueUeo762xTajmr90TEroYChb
   4LrztI9qmL9E+TmFz4TtpQJieJdePLk5+T7H4IrEeN6VSoFXD4uquyacs
   71a755e25ilxquP+zlR6uijVDEhQZHPQ6Qta+tpwxIwcG0pQ0dkeGSTb3
   siwJSrTUN9EF/58Jx42mQwhFCBldnjDMc0lsqkOgrdSeV/OK5Xck/wIuK
   YcozH1Vo1M6/oWr5w2MYA8JVOwE4/PTgoaAcOb25uSPAf65YkX64Q50GI
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10437"; a="290424244"
X-IronPort-AV: E=Sophos;i="5.93,233,1654585200"; 
   d="scan'208";a="290424244"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2022 12:09:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,233,1654585200"; 
   d="scan'208";a="851665292"
Received: from lkp-server02.sh.intel.com (HELO 8745164cafc7) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 12 Aug 2022 12:09:52 -0700
Received: from kbuild by 8745164cafc7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oMa2a-0000qZ-0L;
	Fri, 12 Aug 2022 19:09:52 +0000
Date: Sat, 13 Aug 2022 03:09:42 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: Re: [Intel-wired-lan] [PATCH net v5 4/4] ice: Ignore error message
 when setting same promiscuous mode
Message-ID: <202208130335.KFEhPChm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In-Reply-To: <1660310750-290943-5-git-send-email-grzegorz.siwik@intel.com>
References: <1660310750-290943-5-git-send-email-grzegorz.siwik@intel.com>
TO: Grzegorz Siwik <grzegorz.siwik@intel.com>
TO: intel-wired-lan@lists.osuosl.org
CC: Benjamin Mikailenko <benjamin.mikailenko@intel.com>
CC: Grzegorz Siwik <grzegorz.siwik@intel.com>

Hi Grzegorz,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on net/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Grzegorz-Siwik/ice-Fixes-for-double-vlan-promiscuous-mode/20220812-212847
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net.git 40b4ac880e21d917da7f3752332fa57564a4c202
config: riscv-randconfig-r031-20220812 (https://download.01.org/0day-ci/archive/20220813/202208130335.KFEhPChm-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 5f1c7e2cc5a3c07cbc2412e851a7283c1841f520)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/54c8cc1f59ac62b3293ef19c2cf35fcd546041a0
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Grzegorz-Siwik/ice-Fixes-for-double-vlan-promiscuous-mode/20220812-212847
        git checkout 54c8cc1f59ac62b3293ef19c2cf35fcd546041a0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: kernel/built-in.a(bpf/btf.o):(function btf_parse_vmlinux: .text+0x2974): relocation R_RISCV_PCREL_HI20 out of range: -524728 is not in [-524288, 524287]; references __stop_BTF
   >>> referenced by btf.c:817 (kernel/bpf/btf.c:817)
   >>> defined in kernel/built-in.a(bpf/btf.o)
--
>> ld.lld: error: kernel/built-in.a(bpf/btf.o):(function btf_parse_vmlinux: .text+0x296a): relocation R_RISCV_PCREL_HI20 out of range: -524728 is not in [-524288, 524287]; references __start_BTF
   >>> referenced by btf.c:817 (kernel/bpf/btf.c:817)
   >>> defined in kernel/built-in.a(bpf/btf.o)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
