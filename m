Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7916AA6
	for <llvm@lists.linux.dev>; Thu, 16 Jun 2022 22:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655420300; x=1686956300;
  h=date:from:cc:subject:message-id:mime-version;
  bh=gZDIln4R4v1GecgQMVWbV44VyldG07MeOv876GHmWyw=;
  b=k0m0JAvTnvd5c4j1lHQTZkDHzB2aRjqa/6eptSWplB4oHQ2kfbRzuY2R
   aMNEexTXXeYMko306U6SCCvb0Or9F5inQz9ktspYo51EcmxLJoYJWQbuQ
   WzSLM+edq2bzkd6NtEXtmjDbI4KIBvsy65TdwySV926xCdncArdbDsAwU
   Jz0Dpnm7txeRNY7IBjUtWyqCh2HSKk5zLPYDeuGYD57TR0t6ez3R59VdA
   uqv52s2imj5Nvay9P48wXuw7mvBsDdbCAWxiVM6j3FHHOTaV40SGc1Y0B
   C0P2IH1MA6xwhDF44WOngZrABNYE2s+x5MLb5TiRPF4qFr0agRfgEVYDQ
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="262389619"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="262389619"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2022 15:58:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="641760557"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 16 Jun 2022 15:58:18 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o1yRN-000Oqf-Lv;
	Thu, 16 Jun 2022 22:58:17 +0000
Date: Fri, 17 Jun 2022 06:58:02 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [linux-stable-rc:linux-5.18.y 1350/1352] vmlinux.o: warning:
 objtool: vmx_vcpu_enter_exit()+0x17a: call to do_trace_write_msr() leaves
 .noinstr.text section
Message-ID: <202206170628.KvJyzdfX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: linux-kernel@vger.kernel.org
TO: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Borislav Petkov <bp@suse.de>
CC: Thomas Gleixner <tglx@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.18.y
head:   71563d69a8ec34d41857aca6040e90d54f566ee4
commit: 0b4bd3f44c674ba215f8f7918e4145d045bf5396 [1350/1352] KVM: x86/speculation: Disable Fill buffer clear within guests
config: x86_64-randconfig-a014 (https://download.01.org/0day-ci/archive/20220617/202206170628.KvJyzdfX-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project f0e608de27b3d568000046eebf3712ab542979d6)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=0b4bd3f44c674ba215f8f7918e4145d045bf5396
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc linux-5.18.y
        git checkout 0b4bd3f44c674ba215f8f7918e4145d045bf5396
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: vmx_vcpu_enter_exit()+0x17a: call to do_trace_write_msr() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret()+0x2f: call to memset() leaves .noinstr.text section
   vmlinux.o: warning: objtool: in_task_stack()+0xc: call to task_stack_page() leaves .noinstr.text section
   vmlinux.o: warning: objtool: in_entry_stack()+0x10: call to cpu_entry_stack() leaves .noinstr.text section

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
