Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18FD79C8;
	Sun, 16 Jul 2023 22:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689545074; x=1721081074;
  h=date:from:cc:subject:message-id:mime-version;
  bh=dX6g9WpDqKwd+GRZPuJUNJxibgq10G/3iHxZIXzMU2g=;
  b=BJFF4chTEcq6+odW+KgKAFhI3qINpIsC7OAYkeKGu+DA8Bf6kaS207UQ
   dJOjU2gbPH6NIYEwccYNQmrkR5Xva9TfFO38eUGWoyaykwYMcN7ia8T1V
   c1EMo7peJyoFLPenC3X44SuVbjplRj5BnZXI/qHk209YdW4HSYE4uopXM
   Upeo0/bnu3DcTsCUHn6m4+HFfrMzPc0TkcYvoG7+aWDGMlL9WKBhFSJud
   Ckge1NAHbdPRbP9bndyQGsRHx7i9SykXEdXOWeAc22/qus1XG++Ez9B6T
   D5Hg3QeouP40NrL2QUfAW+laVtBi5Bo16VEf0PHYTMVNuaIj52YKhamqi
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="345392959"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="345392959"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2023 15:04:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="673325666"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="673325666"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 16 Jul 2023 15:04:31 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qL9qw-00091G-2o;
	Sun, 16 Jul 2023 22:04:30 +0000
Date: Mon, 17 Jul 2023 06:03:50 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [linux-stable-rc:linux-5.4.y 1093/24017]
 drivers/gpu/drm/savage/savage_state.o: warning: objtool:
 savage_dispatch_draw() falls through to next function
 savage_dispatch_state()
Message-ID: <202307170601.OVT1bqwt-lkp@intel.com>
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
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

Hi Kees,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.4.y
head:   79dde2ea800d791a8118548feb231713ed35a09f
commit: 24c792fb7cbc08e5c4b1f3fc4b926d665e64ce4d [1093/24017] uaccess: disallow > INT_MAX copy sizes
config: x86_64-randconfig-x016-20230717 (https://download.01.org/0day-ci/archive/20230717/202307170601.OVT1bqwt-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230717/202307170601.OVT1bqwt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307170601.OVT1bqwt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/savage/savage_state.o: warning: objtool: savage_dispatch_draw() falls through to next function savage_dispatch_state()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
