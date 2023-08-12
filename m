Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3AC1849;
	Sat, 12 Aug 2023 04:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691815988; x=1723351988;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rizJ4PqVdeBbOLj83uv+7ejLAmRCgZnwdpA1u0ZQkVY=;
  b=dbBmedV8zQ/P7mJl9BvEm9pLPGEiGObSqt5SxGBrR09bPzkpADOezq45
   g8c6lNr9lmNB9ktcR1GzRb+enkJVE72f6YhwBd5/1QBwrdxmpcGBvfY7D
   FTXYWYjespEyBmQ1T8nBkT7Ioh4R4wroFZkKM6eHrIsYjWliLCGJBOotx
   sPFuVj/sN054aZAu+W7D7ufKraGIcqk+YXdI10dgMK6daVKEKTOmH/5Ce
   QdcNqVNWPwJ6Q1A8xLC/ePrx4Dfl4lXuQ+ZJ+nLjKc+oFVm8PqmAUmzmj
   d0SM9SGHSCBp91DZXxZwgCGjATD6WNpH5Qwd4PxaunmCyUG/DOiEGSpJQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="375513440"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="375513440"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 21:53:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="767871956"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="767871956"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 11 Aug 2023 21:53:03 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUgcY-0008Gj-0W;
	Sat, 12 Aug 2023 04:53:02 +0000
Date: Sat, 12 Aug 2023 12:52:16 +0800
From: kernel test robot <lkp@intel.com>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Cannot find symbol for section 13: .text.release_thread.
Message-ID: <202308121246.0TYkHC1K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f8de32cc060ba3f63171aaa0e8764d22d8c37978
commit: 2be9880dc87342dc7ae459c9ea5c9ee2a45b33d8 kernel: exit: cleanup release_thread()
date:   11 months ago
config: mips-randconfig-r014-20230811 (https://download.01.org/0day-ci/archive/20230812/202308121246.0TYkHC1K-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308121246.0TYkHC1K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308121246.0TYkHC1K-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Cannot find symbol for section 13: .text.release_thread.
   kernel/exit.o: failed

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
