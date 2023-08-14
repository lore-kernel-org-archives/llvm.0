Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD179947E;
	Mon, 14 Aug 2023 12:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692016604; x=1723552604;
  h=date:from:cc:subject:message-id:mime-version;
  bh=SyRFhQC+24S8k/Ak+6StdZwEVT9QHeM2dar2nszIHJQ=;
  b=JAyddmAVasnmb5ICXTaufFt9auPGWW18KsYmwmg+mncii/qfqaP4VqGG
   frIfJH7o+VUc1E4Id4KBgJjtQU10XhNr2gLmJG3FV5HNbosz+TrcyV3FE
   pLYFeA4uxWB2HRWtKpMx3uznh9ul5WqrJRWHdRzah3ATIdrMMjJDdUJFV
   D3LI8xj4G5UddFSf+c84bWYoS7KN4jR1U+WpswbFKmh8g0Yf/wIJUSBef
   PI//s59Xggy5HQeQaMDLbdVIxpOI76OIpAhgWh4ZjCxwDACb4Bc8pqqVW
   DsXvXhu8+4pRhW7DX9PBc+lS/BqWBZAe4oIucxW4yx/IaJ8sci0wRzuzO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="374796908"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="scan'208";a="374796908"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 05:36:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="857071366"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="scan'208";a="857071366"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 14 Aug 2023 05:36:20 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVWnz-00008z-12;
	Mon, 14 Aug 2023 12:36:19 +0000
Date: Mon, 14 Aug 2023 20:35:47 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: Re: [PATCH v2 4/5] memfd: replace ratcheting feature from
 vm.memfd_noexec with hierarchy
Message-ID: <202308142051.QSBkwvO9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In-Reply-To: <20230814-memfd-vm-noexec-uapi-fixes-v2-4-7ff9e3e10ba6@cyphar.com>
References: <20230814-memfd-vm-noexec-uapi-fixes-v2-4-7ff9e3e10ba6@cyphar.com>
TO: Aleksa Sarai <cyphar@cyphar.com>
TO: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Shuah Khan <skhan@linuxfoundation.org>
TO: Jeff Xu <jeffxu@google.com>
TO: Kees Cook <keescook@chromium.org>
TO: Daniel Verkamp <dverkamp@chromium.org>
CC: Christian Brauner <brauner@kernel.org>
CC: Dominique Martinet <asmadeus@codewreck.org>
CC: stable@vger.kernel.org
CC: linux-api@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-kselftest@vger.kernel.org
CC: Aleksa Sarai <cyphar@cyphar.com>

Hi Aleksa,

kernel test robot noticed the following build errors:

[auto build test ERROR on 3ff995246e801ea4de0a30860a1d8da4aeb538e7]

url:    https://github.com/intel-lab-lkp/linux/commits/Aleksa-Sarai/selftests-memfd-error-out-test-process-when-child-test-fails/20230814-164743
base:   3ff995246e801ea4de0a30860a1d8da4aeb538e7
patch link:    https://lore.kernel.org/r/20230814-memfd-vm-noexec-uapi-fixes-v2-4-7ff9e3e10ba6%40cyphar.com
patch subject: [PATCH v2 4/5] memfd: replace ratcheting feature from vm.memfd_noexec with hierarchy
config: riscv-randconfig-r026-20230814 (https://download.01.org/0day-ci/archive/20230814/202308142051.QSBkwvO9-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230814/202308142051.QSBkwvO9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308142051.QSBkwvO9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(init/main.o):(function __traceiter_initcall_start: .text+0x5e): relocation R_RISCV_HI20 out of range: 528079 is not in [-524288, 524287]; references __tracepoint_initcall_start
   >>> referenced by main.c
   >>> defined in vmlinux.a(init/main.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function init_completion: .text+0x4b6): relocation R_RISCV_HI20 out of range: 526635 is not in [-524288, 524287]; references kthreadd_done
   >>> referenced by main.c
   >>> defined in vmlinux.a(init/main.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function init_completion: .text+0x4be): relocation R_RISCV_HI20 out of range: 527221 is not in [-524288, 524287]; references .L.str.33
   >>> referenced by main.c
   >>> defined in vmlinux.a(init/main.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function init_completion: .text+0x4c6): relocation R_RISCV_HI20 out of range: 528336 is not in [-524288, 524287]; references init_completion.__key
   >>> referenced by main.c
   >>> defined in vmlinux.a(init/main.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function do_one_initcall: .text+0x57e): relocation R_RISCV_HI20 out of range: 527221 is not in [-524288, 524287]; references .L.str.67
   >>> referenced by main.c
   >>> defined in vmlinux.a(init/main.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function __traceiter_initcall_finish: .text+0xae): relocation R_RISCV_HI20 out of range: 528079 is not in [-524288, 524287]; references __tracepoint_initcall_finish
   >>> referenced by main.c
   >>> defined in vmlinux.a(init/main.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function trace_event_raw_event_initcall_level: .text+0x156): relocation R_RISCV_HI20 out of range: 527221 is not in [-524288, 524287]; references .L.str.17
   >>> referenced by main.c
   >>> defined in vmlinux.a(init/main.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function perf_trace_initcall_level: .text+0x1d2): relocation R_RISCV_HI20 out of range: 527221 is not in [-524288, 524287]; references .L.str.17
   >>> referenced by main.c
   >>> defined in vmlinux.a(init/main.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
