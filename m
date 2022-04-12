Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8738046A1
	for <llvm@lists.linux.dev>; Tue, 12 Apr 2022 05:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649741556; x=1681277556;
  h=date:from:cc:subject:message-id:mime-version;
  bh=99KcfcIm79ss33t1FNSaXnktDpD7Nt0bt3LjY+RoOVk=;
  b=JiqJ3DSAo5jO5N10DLb3F9mhfVOCTZW0e6y5E+Y3x9RiZeOrJ+uB+4IT
   AfS91FWKKOKfGoqnAPCA1b5CGp1POfiNo6gtOjhB5QSl1ac/cn4NKU870
   Jfk5r7fQEhh9ldF6ADNn4Bz1U2WWueftZAPGo46H8mmCRAsCazzP65l10
   cIPYeZwSVAq1FyMf/60EKJ6EbObDxHM3lHZukWZet28aeIWcEoC7QYihx
   wAFAPTU+AzfVjDgPtcY/UQIgZHE3+V7JKwPSIbhTEojtRt5TGgcAhVZc0
   czawd7/d0MDbsNT4+iFNqbToEKJgMskx6VLVp21M3b5dxVnRC+l+kEFLk
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="262026002"
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; 
   d="scan'208";a="262026002"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2022 22:32:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; 
   d="scan'208";a="551539960"
Received: from lkp-server02.sh.intel.com (HELO d3fc50ef50de) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 11 Apr 2022 22:32:35 -0700
Received: from kbuild by d3fc50ef50de with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ne98k-0002Xo-JB;
	Tue, 12 Apr 2022 05:32:34 +0000
Date: Tue, 12 Apr 2022 13:32:20 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [linux-stable-rc:queue/5.10 6589/9999] arch/x86/kernel/head_64.o:
 warning: objtool: .text+0x5: unreachable instruction
Message-ID: <202204121300.hLol6qNY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

BCC: lkp@intel.com
CC: linux-kernel@vger.kernel.org
TO: Peter Zijlstra <peterz@infradead.org>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Juergen Gross <jgross@suse.com>
CC: Miroslav Benes <mbenes@suse.cz>
CC: Sasha Levin <sashal@kernel.org>

Hi Peter,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git queue/5.10
head:   3a166b51d36ae1f85bed764b7c07a6ca6d6c73a1
commit: b36ab509e1817e60f73ce297494f0de1b7ed2c08 [6589/9999] x86/xen: Mark cpu_bringup_and_idle() as dead_end_function
config: x86_64-randconfig-a005-20220411 (https://download.01.org/0day-ci/archive/20220412/202204121300.hLol6qNY-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project fe2478d44e4f7f191c43fef629ac7a23d0251e72)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=b36ab509e1817e60f73ce297494f0de1b7ed2c08
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc queue/5.10
        git checkout b36ab509e1817e60f73ce297494f0de1b7ed2c08
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/head_64.o: warning: objtool: .text+0x5: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
