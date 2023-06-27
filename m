Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDB11386;
	Tue, 27 Jun 2023 08:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687854888; x=1719390888;
  h=date:from:cc:subject:message-id:mime-version;
  bh=rO5d6eJVnjclI79/gdLC3qnZXV+fqM/bfTQfWr7iNHM=;
  b=I5Iw8CPMAtIEJbx2d/79YZvQ0a4EWrR/l6PeihWWwmj5Na5WWsrER45Z
   vKgDSFt3XN6nw+0mL2u8QceCm6YkKdbiahe0pmlEXdXhCTu7wDfFbteiX
   B/0DrQGqNcEdjbTqjXtMdjj7SoIrLTcSSL8EeZyCoa+NAfm0q2XWvJRRI
   DAwPRSwWwx8T3VOIBzRBloirnM6Fe2IXwfPlSqIu5e4BTWvDJHWFN5M5T
   r8j5eGJ/J+jcr5d6cKKYC46kRp9iAkyjkh6INd1on6zkcMc7M5UanVMcm
   TRnCLH/vK+mVSzMEHDvZTioOCjpg2oiiqxmRhVMvlPJinCuGxfmaTJRMk
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="341854444"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="341854444"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 01:34:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="719700786"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="719700786"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 27 Jun 2023 01:34:41 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qE49B-000Bof-0y;
	Tue, 27 Jun 2023 08:34:01 +0000
Date: Tue, 27 Jun 2023 16:33:10 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [stable:linux-5.10.y 1755/9999] fs/freevxfs/vxfs_olt.o: warning:
 objtool: .text: unexpected end of section
Message-ID: <202306271602.C1jbpWOA-lkp@intel.com>
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
head:   ef0d5feb32ab7007d1316e9c5037cd7d9f7febbf
commit: 58823a9b097cf36dd59c4d463396e15a5ec4efb7 [1755/9999] ubsan: remove CONFIG_UBSAN_OBJECT_SIZE
config: x86_64-randconfig-a004-20230626 (https://download.01.org/0day-ci/archive/20230627/202306271602.C1jbpWOA-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230627/202306271602.C1jbpWOA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306271602.C1jbpWOA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/freevxfs/vxfs_olt.o: warning: objtool: .text: unexpected end of section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
