Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23199626
	for <llvm@lists.linux.dev>; Wed,  1 Jun 2022 10:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654079820; x=1685615820;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yRzXRhmweAXGfPI0innNsyhnWdgFvifkjj5F+obP+I4=;
  b=l5gwSJ3PtY7K5a6ZeKTT0lb3ZvamfQmxRn8YqSjzRaYF/JUQ6fnlobEy
   qLBHAIk/+/GpnA6DFjxD+KEHj2RexmInvIElqcU7Aq5LceXCFdQQdfqxM
   osxlZ4hW+CtsFf9HVwvAf5u7vegONFpYvfcUFSKPtwga2JhvvyrRUHGK/
   cix28gPWgvaaphVtQJA771f9QUYJkwoQAZHg33IOsuJv11qwbaP/QzVJY
   M1xnSJ+c05yFsqs1ize1TCyBJ84oFWoKiNkcakJp+ATehnpmpS+ItKYLW
   lh1Bpfg85Tf6cx//ItCMNib2OlTxzXhXI4POmfwPFN0O1SA9TIMR2/gq/
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10364"; a="255416596"
X-IronPort-AV: E=Sophos;i="5.91,268,1647327600"; 
   d="scan'208";a="255416596"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2022 03:36:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,268,1647327600"; 
   d="scan'208";a="612264968"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 01 Jun 2022 03:36:56 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nwLih-0003rO-OH;
	Wed, 01 Jun 2022 10:36:55 +0000
Date: Wed, 1 Jun 2022 18:36:21 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Xu <dxu@dxuuu.xyz>, bpf@vger.kernel.org, ast@kernel.org,
	daniel@iogearbox.net, andrii@kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Daniel Xu <dxu@dxuuu.xyz>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next 1/2] bpf, test_run: Add PROG_TEST_RUN support to
 kprobe
Message-ID: <202206011814.9lsKlbB0-lkp@intel.com>
References: <b544771c7bce102f2a97a34e2f5e7ebbb9ea0a24.1653861287.git.dxu@dxuuu.xyz>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b544771c7bce102f2a97a34e2f5e7ebbb9ea0a24.1653861287.git.dxu@dxuuu.xyz>

Hi Daniel,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Xu/Add-PROG_TEST_RUN-support-to-BPF_PROG_TYPE_KPROBE/20220530-060742
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
config: s390-randconfig-r002-20220531 (https://download.01.org/0day-ci/archive/20220601/202206011814.9lsKlbB0-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c825abd6b0198fb088d9752f556a70705bc99dfd)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/a547a4c795103fd002d3bbb5ee4d7141113716c0
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Daniel-Xu/Add-PROG_TEST_RUN-support-to-BPF_PROG_TYPE_KPROBE/20220530-060742
        git checkout a547a4c795103fd002d3bbb5ee4d7141113716c0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> /opt/cross/gcc-11.3.0-nolibc/s390x-linux/bin/s390x-linux-ld: kernel/trace/bpf_trace.o:kernel/trace/bpf_trace.c:1365: undefined reference to `bpf_prog_test_run_kprobe'

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
