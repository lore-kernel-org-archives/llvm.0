Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D7E8460;
	Mon, 21 Aug 2023 16:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692634177; x=1724170177;
  h=date:from:cc:subject:message-id:mime-version;
  bh=pxAcByPCQHOt4T+KXWQV68WkSd/2NPvIL34XP4QVpt4=;
  b=IP1I3asZOMOgEz8q9HyBNqu+enyU/ItjMwlAesSf7bzK5KVGfjLrHGph
   NfLUrELJLyqtWvpljAyyD131wjeDRDpHrQM2E8Z+1PefWZ/iFHXdchq9E
   AX60F48LmDPcS6l9piRuzfhYUN1Ub+q/XUQBFGv23SWNtsPTgswSzSAIk
   kCvc2Eq9TL+TZFx5jZBI9pSJqo7qwz95g9Ze5b3xsR4D196fRJCh+PLVO
   Z0UtzwmRco/d7BfCLJn/QIG8QmeSYl8ovJRFeZSHo6n0waitGoLQReV/9
   chL7FGBG+9LMrwxpclJ4luekVcgxCuJiNEjJ0K8DpobmXde17sP5sP1Ll
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="363800597"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="363800597"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 09:09:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="771014008"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="771014008"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 21 Aug 2023 09:08:59 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qY7Sc-0000fP-2T;
	Mon, 21 Aug 2023 16:08:58 +0000
Date: Tue, 22 Aug 2023 00:08:15 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [stable:linux-5.10.y 849/9999]
 drivers/media/test-drivers/vicodec/vicodec-core.o: warning: objtool:
 device_run() falls through to next function job_ready()
Message-ID: <202308212359.LVc7JSY9-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.10.y
head:   da742ebfa00c3add4a358dd79ec92161c07e1435
commit: 58823a9b097cf36dd59c4d463396e15a5ec4efb7 [849/9999] ubsan: remove CONFIG_UBSAN_OBJECT_SIZE
config: x86_64-randconfig-r036-20230821 (https://download.01.org/0day-ci/archive/20230821/202308212359.LVc7JSY9-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230821/202308212359.LVc7JSY9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308212359.LVc7JSY9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/test-drivers/vicodec/vicodec-core.o: warning: objtool: device_run() falls through to next function job_ready()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
