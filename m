Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D368327F00;
	Fri, 21 Jul 2023 18:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689962839; x=1721498839;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qPkjEnLyyo1zjcfe5ik3baUNOb9UtXmslVsWPY4/zKg=;
  b=Z2oCKEVJQl6Uk2emfhIjsRhI7bPTzdfDcmS+07FhypVcbCQhvpKIIn0p
   X4mGHq8UWAh94Ln2BuhRFliy4gDydhnzr8ORRupuJZUKCKUEhY6+aFd8B
   2z5DdX/UMdHYxGSPm8ftk/ZMrqQMs1OBMaM7bXwDpfe4J1IvLcOtOxOhQ
   fuCayW/sYGdbHK3jbW8zxikB1Y3MzCNAaN8f7h5LIjgzpe7jYfjQjF98e
   xd64TEubZ3Q0zyXm7YRlWZQ+IQMG1TSQy+/rVNAqvezharT3Tn6nR80sO
   cxK0gflo0yjFTdixeouHFNNsi7ShLUGnPMKiGgbXiRLuhJaK8liL/ERcH
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="357078802"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; 
   d="scan'208";a="357078802"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2023 11:07:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="848902555"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; 
   d="scan'208";a="848902555"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 21 Jul 2023 11:07:16 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMuX5-0007W3-34;
	Fri, 21 Jul 2023 18:07:15 +0000
Date: Sat, 22 Jul 2023 02:06:44 +0800
From: kernel test robot <lkp@intel.com>
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, x86@kernel.org,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"Borislav Petkov (AMD)" <bp@alien8.de>,
	Kees Cook <keescook@chromium.org>
Subject: [tip:x86/shstk 36/42] Cannot find symbol for section 10:
 .text.arch_proc_pid_thread_features.
Message-ID: <202307220111.5MVJk5cq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/shstk
head:   c19a153cc0b172c8e1869d6dee52f6aadd73d3c4
commit: d21da223567ebdcd7c3ba53e77eddcf95082d218 [36/42] x86: Expose thread features in /proc/$PID/status
config: mips-randconfig-r002-20230720 (https://download.01.org/0day-ci/archive/20230722/202307220111.5MVJk5cq-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230722/202307220111.5MVJk5cq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307220111.5MVJk5cq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Cannot find symbol for section 10: .text.arch_proc_pid_thread_features.
   fs/proc/array.o: failed

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
