Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2AE336D
	for <llvm@lists.linux.dev>; Wed,  1 Jun 2022 03:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654053101; x=1685589101;
  h=date:from:cc:subject:message-id:mime-version;
  bh=GgAxtssfa9QsbTT/PuyRUiwwOI/nOJ56NiQre7v6tNM=;
  b=E6qOXVMqzm586F8Et5DKH6LF+Yg7y6erEszaWhHm6afbtNtUJq14ovx6
   gTDuDcYEkAqzcylEILZGQbP2ksnAr50QiZQwBlh03JoneHAftL+08vTB+
   fBM5BsHCxnRASCv8D5a/1xrw4g720SBsarCrnJEhMiaRt51S8QTYVlfqu
   VlJ/SigG/rWccQb9/GFChHRLViFoz9FCp7jG2Fcy59NsRXa1cIMIPqeYN
   w2VpXat+03AO9NPG28hqgjBGczsVKZNxbJffNheWMqYSc+al04lSCdIuh
   n7fLTs7/F9/uj/f1Pw9O/S38du+SHNTpn1yq6y+z8zmU/Bn9YX5TPs9LJ
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10364"; a="300804851"
X-IronPort-AV: E=Sophos;i="5.91,266,1647327600"; 
   d="scan'208";a="300804851"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2022 20:11:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,266,1647327600"; 
   d="scan'208";a="576720573"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 31 May 2022 20:11:40 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nwEln-0003Qw-I7;
	Wed, 01 Jun 2022 03:11:39 +0000
Date: Wed, 1 Jun 2022 11:10:55 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [jpoimboe:objtool/urgent 1/1] arch/x86/kernel/ftrace_64.o: warning:
 objtool: return_to_handler+0x10: call without frame pointer save/setup
Message-ID: <202206011102.yMz4gzhk-lkp@intel.com>
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
TO: Josh Poimboeuf <jpoimboe@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool/urgent
head:   b08a44fa42a0924ac580e3a7cc940c728a653cf0
commit: b08a44fa42a0924ac580e3a7cc940c728a653cf0 [1/1] x86/ftrace: Fix objtool vmlinux.o __fentry__ warning
config: x86_64-randconfig-a012 (https://download.01.org/0day-ci/archive/20220601/202206011102.yMz4gzhk-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c825abd6b0198fb088d9752f556a70705bc99dfd)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git/commit/?id=b08a44fa42a0924ac580e3a7cc940c728a653cf0
        git remote add jpoimboe https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git
        git fetch --no-tags jpoimboe objtool/urgent
        git checkout b08a44fa42a0924ac580e3a7cc940c728a653cf0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/ftrace_64.o: warning: objtool: return_to_handler+0x10: call without frame pointer save/setup

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
