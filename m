Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D1D6AA4
	for <llvm@lists.linux.dev>; Thu,  4 Aug 2022 21:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659649778; x=1691185778;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7rt23PMPBzBSBIB2zxEb7Hv++9uljuJHhPCfAnJfZWQ=;
  b=K0d9VPjJFtzJm73Wd16HW1WJZNVw6+I7L4BRSzZcZsAG668uc7jkY0Pz
   wZbY8+oTow1SDlg/Fz5jvEnjEKnyo7CW9vfhMlKzjnT5QWi7fHUvTNB+8
   ntrezVlX9iIKZToPmFnNWCprvND/RnMbndyBVHb2dlBJgg+rqPv6ZUEYC
   Mz8ag7db9pOS+X9Q0jlkGcTd77pTygaoib2GCBLThWMBFA5vQrqvyRLXE
   b0aqyH9XFy3rXbcM0N8+6Kxx7oL7pOPlCsc8u3XWXbMp5pntvg+RDdKXx
   jc5F/BGRAPW9KVqD7xyUdWHFOWltqse4ImvlHoNBYg03WBAENs/ItagIT
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10429"; a="376349840"
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; 
   d="scan'208";a="376349840"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2022 14:49:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; 
   d="scan'208";a="671427889"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 04 Aug 2022 14:49:36 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oJiil-000Isj-3D;
	Thu, 04 Aug 2022 21:49:35 +0000
Date: Fri, 5 Aug 2022 05:48:50 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [mark:arm64/stacktrace/data-driven 4/4]
 arch/arm64/include/asm/stacktrace.h:153:13: error: cannot compile this GNU
 array range designator extension yet
Message-ID: <202208050544.mUKbvIhP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git arm64/stacktrace/data-driven
head:   468d82fe55b7d215b8d1733a8b34a1fc94cd431b
commit: 468d82fe55b7d215b8d1733a8b34a1fc94cd431b [4/4] WIP: arm64: make stacktrace data-driven
config: arm64-randconfig-r003-20220803 (https://download.01.org/0day-ci/archive/20220805/202208050544.mUKbvIhP-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 26dd42705c2af0b8f6e5d6cdb32c9bd5ed9524eb)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/commit/?id=468d82fe55b7d215b8d1733a8b34a1fc94cd431b
        git remote add mark https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git
        git fetch --no-tags mark arm64/stacktrace/data-driven
        git checkout 468d82fe55b7d215b8d1733a8b34a1fc94cd431b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/arm64/kernel/stacktrace.c:19:
>> arch/arm64/include/asm/stacktrace.h:153:13: error: cannot compile this GNU array range designator extension yet
                   .stacks = {
                             ^
   1 error generated.


vim +153 arch/arm64/include/asm/stacktrace.h

   143	
   144	/*
   145	 * We can only safely access per-cpu stacks from current in a non-preemptible
   146	 * context.
   147	 */
   148	
   149	static __always_inline struct kernel_stack_info
   150	get_accessible_kernel_stacks(const struct task_struct *tsk)
   151	{
   152		struct kernel_stack_info info = {
 > 153			.stacks = {

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
