Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D95628F2;
	Sun,  7 May 2023 21:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683494631; x=1715030631;
  h=date:from:cc:subject:message-id:mime-version;
  bh=VC0r2uDsLrvZOZdzDUmv8VIOOgRnK+zpSiU84dEKXSg=;
  b=Shh2mTpQlFfdxu3+jppKb0HxHjem6VTG7UpNxoLRDTx3/SN+FkPowNa0
   Ce3nVm8FlWy5wCRlcOm5oOdkbwCfs5OWBrRdw49EI9bHP069ImFeFrloE
   1Og/EjLJdJrekJJG9USIUPuDMfAM5OE+wUo3p8x2PaTgEXzA2qoW3nCr0
   OvCXp8mJXsnTEdxqtHH9xaFsBUOXUvUG06u7w7Fpd7mVQgpV28MgkW7Wf
   iUaowHscCPpZC09mQvodPso7ihQTfJzwz9TgUBCvFBMSjRg7Y5MELzZdz
   eOvKFhgSQye9R+GGg91w4Vt2Ayo4CjnofeEmYKNPPrchGB5OzBvNvzUDr
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="435832238"
X-IronPort-AV: E=Sophos;i="5.99,257,1677571200"; 
   d="scan'208";a="435832238"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2023 14:23:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="767840339"
X-IronPort-AV: E=Sophos;i="5.99,257,1677571200"; 
   d="scan'208";a="767840339"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 07 May 2023 14:23:49 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pvlrB-0000s5-0I;
	Sun, 07 May 2023 21:23:49 +0000
Date: Mon, 8 May 2023 05:23:20 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [stable:linux-5.10.y 2649/9999] fs/ocfs2/cluster/heartbeat.o:
 warning: objtool: o2hb_setup_one_bio() falls through to next function
 o2hb_wait_on_io()
Message-ID: <202305080522.sda9FnaL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Kees Cook <keescook@chromium.org>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Marco Elver <elver@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Tadeusz Struk <tadeusz.struk@linaro.org>

Hi Kees,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.10.y
head:   f1b32fda06d2cfb8eea9680b0ba7a8b0d5b81eeb
commit: 58823a9b097cf36dd59c4d463396e15a5ec4efb7 [2649/9999] ubsan: remove CONFIG_UBSAN_OBJECT_SIZE
config: x86_64-randconfig-a004-20230508 (https://download.01.org/0day-ci/archive/20230508/202305080522.sda9FnaL-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=58823a9b097cf36dd59c4d463396e15a5ec4efb7
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.10.y
        git checkout 58823a9b097cf36dd59c4d463396e15a5ec4efb7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash fs/ocfs2/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305080522.sda9FnaL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/ocfs2/cluster/heartbeat.o: warning: objtool: o2hb_setup_one_bio() falls through to next function o2hb_wait_on_io()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
