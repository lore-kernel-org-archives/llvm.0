Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE13366
	for <llvm@lists.linux.dev>; Tue, 22 Feb 2022 04:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645504133; x=1677040133;
  h=date:from:cc:subject:message-id:mime-version;
  bh=4f97yIgjgPUd2mGTZBavtt8O7TGhwbT+krRdEzJeQl0=;
  b=mFZ7srrdGbSEdWH0I9aqOiOxJZOM0pXRTZ2T1GNmqq1kxlHUzruwDrNi
   WsABofT0bvYg+D1FUjJA+xsfV3/NcvoAAHAxca1px59i5FoCm9zh2vnAw
   IdBn0A6JUU3NO3Y+uERz7Nh7/eIqCg89qNpcvnee4k4gVlApsJIG2aoU4
   fff91Rr5QJEEffoL8YXiGSqX1KEh3lw0mLbIYcnPL60yms916GfA5VHw8
   HrBDhkjac+KJnLuhim2WLVFS1dySNqLYrmAWp2j+cuoKM3+tIeRf7UvYN
   vBFuGDeGSDhHY43c9F9yGOx3Z8h//YKegGPMtUCT3aeqLa7j1+ru+rxk/
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="235150652"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; 
   d="scan'208";a="235150652"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2022 20:28:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; 
   d="scan'208";a="591165211"
Received: from lkp-server01.sh.intel.com (HELO da3212ac2f54) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 21 Feb 2022 20:28:51 -0800
Received: from kbuild by da3212ac2f54 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nMMnC-0002KE-Tb; Tue, 22 Feb 2022 04:28:50 +0000
Date: Tue, 22 Feb 2022 12:28:09 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [peterz-queue:x86/wip.ibt 31/39] arch/x86/kernel/head_64.o: warning:
 objtool: .noinstr.text: unexpected end of section
Message-ID: <202202221234.OvYj6llE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

CC: linux-kernel@vger.kernel.org
TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/wip.ibt
head:   1436dce5f32d577e8cef693e09f4bb1faa0e2692
commit: 3c80adbe1204e92a048cb149b966c2a990c89ec6 [31/39] x86/ibt,xen: Annotate away warnings
config: x86_64-randconfig-a011-20220221 (https://download.01.org/0day-ci/archive/20220222/202202221234.OvYj6llE-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=3c80adbe1204e92a048cb149b966c2a990c89ec6
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue x86/wip.ibt
        git checkout 3c80adbe1204e92a048cb149b966c2a990c89ec6
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/head_64.o: warning: objtool: .noinstr.text: unexpected end of section

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
