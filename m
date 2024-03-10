Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7583E364BC;
	Sun, 10 Mar 2024 19:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710097294; cv=none; b=kHMDMLFGO2hnODzRq9drFpfU2VRDJktM5i4cg60ASvmOif9/8LpPIhazF/AYG5w4xnHiLqhBU9dYar7MyBy+LdU7VwlDYn8oKG6y1A8PNAErokGfOu9Zqf05VdSOm2fxHdyx8O+raLHGdKMqQtuURNUs+AEZikrIfdSkFXZgtAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710097294; c=relaxed/simple;
	bh=19CZzY4uj+c65eg3DVnL2hCMoDW5ATn0He3b7Qvp7GU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rUP0aTkrBHcJwkF/sgrbTrFya8Et2pCL315T9OiDPnpv4a1n9AfHMj0j68XUvdpwhCLd6PvU7RLE1VRnlviDVZg+0B0OG7CgKvKhxG60M/P2pCiNSg4HUSvChP6b9haKzSdPhrvv9fOBjMEOZkL/TEKpyIJvRpCwx/UrQO80/7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VPh5HE6n; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VPh5HE6n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710097292; x=1741633292;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=19CZzY4uj+c65eg3DVnL2hCMoDW5ATn0He3b7Qvp7GU=;
  b=VPh5HE6nDUU7AQJBPl+2MXm5m6X1x6PZHOqK9SRh37txaiUm9vMh474E
   eSTPIjgBHJYWJjaBwEyknpAJjHZkuxFRB0Wz1skHEr+ZAI7TL0TMxTJTM
   0uHtIdM3PSyY82L82PbOntJa0Df60IHxR39ouBP9jSZVlqCOcZl6l3sY4
   tugx2ezcbTqU07PJJvAD21yAOXry9HFXzhOxHDEIHX5H+txC3N0+SHztR
   r/M4ZfXvWGdQpYilc2KJ7tCfedOXwKsChG3DRK/gTPO7SJOTvQO/6dHzV
   a3Wb5ftOtza0qLnoS/vjBL3Jbl3iWE2GJ53BDk60rxLQz4XKePqk7+scm
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="27226842"
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="27226842"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2024 12:01:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="34102885"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 10 Mar 2024 12:01:23 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjOQC-0008UJ-2J;
	Sun, 10 Mar 2024 19:01:20 +0000
Date: Mon, 11 Mar 2024 03:00:32 +0800
From: kernel test robot <lkp@intel.com>
To: Ian Rogers <irogers@google.com>, Arnd Bergmann <arnd@arndb.de>,
	Andrii Nakryiko <andrii@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Kees Cook <keescook@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [PATCH v1 12/13] tools headers: Sync compiler.h headers
Message-ID: <202403110212.7cBcgqJ5-lkp@intel.com>
References: <20240310020509.647319-13-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240310020509.647319-13-irogers@google.com>

Hi Ian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on perf-tools-next/perf-tools-next]
[also build test WARNING on perf-tools/perf-tools tip/perf/core]
[cannot apply to linus/master acme/perf/core v6.8-rc7 next-20240308]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ian-Rogers/tools-bpf-Synchronize-bpf-h-with-kernel-uapi-version/20240310-101251
base:   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git perf-tools-next
patch link:    https://lore.kernel.org/r/20240310020509.647319-13-irogers%40google.com
patch subject: [PATCH v1 12/13] tools headers: Sync compiler.h headers
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20240311/202403110212.7cBcgqJ5-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240311/202403110212.7cBcgqJ5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403110212.7cBcgqJ5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from exec-cmd.c:2:
   In file included from tools/include/linux/compiler.h:5:
   In file included from tools/include/linux/compiler_types.h:78:
>> tools/include/linux/compiler-clang.h:117:5: warning: 'CONFIG_CLANG_VERSION' is not defined, evaluates to 0 [-Wundef]
   117 | #if CONFIG_CLANG_VERSION >= 110000
   |     ^
   In file included from parse-options.c:2:
   In file included from tools/include/linux/compiler.h:5:
   In file included from tools/include/linux/compiler_types.h:78:
>> tools/include/linux/compiler-clang.h:117:5: warning: 'CONFIG_CLANG_VERSION' is not defined, evaluates to 0 [-Wundef]
   117 | #if CONFIG_CLANG_VERSION >= 110000
   |     ^
   In file included from run-command.c:7:
   In file included from tools/include/linux/string.h:6:
   In file included from tools/include/linux/compiler.h:5:
   In file included from tools/include/linux/compiler_types.h:78:
>> tools/include/linux/compiler-clang.h:117:5: warning: 'CONFIG_CLANG_VERSION' is not defined, evaluates to 0 [-Wundef]
   117 | #if CONFIG_CLANG_VERSION >= 110000
   |     ^
   In file included from help.c:5:
   In file included from tools/include/linux/string.h:6:
   In file included from tools/include/linux/compiler.h:5:
   In file included from tools/include/linux/compiler_types.h:78:
>> tools/include/linux/compiler-clang.h:117:5: warning: 'CONFIG_CLANG_VERSION' is not defined, evaluates to 0 [-Wundef]
   117 | #if CONFIG_CLANG_VERSION >= 110000
   |     ^
   In file included from sigchain.c:3:
   In file included from ./subcmd-util.h:8:
   In file included from tools/include/linux/compiler.h:5:
   In file included from tools/include/linux/compiler_types.h:78:
>> tools/include/linux/compiler-clang.h:117:5: warning: 'CONFIG_CLANG_VERSION' is not defined, evaluates to 0 [-Wundef]
   117 | #if CONFIG_CLANG_VERSION >= 110000
   |     ^
   1 warning generated.
   1 warning generated.
   1 warning generated.
   1 warning generated.
   1 warning generated.
   In file included from weak.c:10:
   In file included from tools/objtool/include/objtool/objtool.h:10:
   In file included from tools/include/linux/list.h:7:
   In file included from tools/include/linux/kernel.h:8:
   In file included from tools/include/linux/build_bug.h:5:
   In file included from tools/include/linux/compiler.h:5:
   In file included from tools/include/linux/compiler_types.h:78:
>> tools/include/linux/compiler-clang.h:117:5: warning: 'CONFIG_CLANG_VERSION' is not defined, evaluates to 0 [-Wundef]
   117 | #if CONFIG_CLANG_VERSION >= 110000
   |     ^
   In file included from builtin-check.c:6:
   In file included from tools/objtool/libsubcmd/include/subcmd/parse-options.h:5:
   In file included from tools/include/linux/kernel.h:8:
   In file included from tools/include/linux/build_bug.h:5:
   In file included from tools/include/linux/compiler.h:5:
   In file included from tools/include/linux/compiler_types.h:78:
>> tools/include/linux/compiler-clang.h:117:5: warning: 'CONFIG_CLANG_VERSION' is not defined, evaluates to 0 [-Wundef]
   117 | #if CONFIG_CLANG_VERSION >= 110000
   |     ^
   In file included from special.c:15:
   In file included from tools/objtool/include/objtool/builtin.h:8:
   In file included from tools/objtool/libsubcmd/include/subcmd/parse-options.h:5:
   In file included from tools/include/linux/kernel.h:8:
   In file included from tools/include/linux/build_bug.h:5:
   In file included from tools/include/linux/compiler.h:5:
   In file included from tools/include/linux/compiler_types.h:78:
>> tools/include/linux/compiler-clang.h:117:5: warning: 'CONFIG_CLANG_VERSION' is not defined, evaluates to 0 [-Wundef]
   117 | #if CONFIG_CLANG_VERSION >= 110000
   |     ^
   In file included from arch/x86/special.c:4:
   In file included from tools/objtool/include/objtool/special.h:10:
   In file included from tools/objtool/include/objtool/check.h:10:
   In file included from tools/objtool/include/objtool/cfi.h:10:
   In file included from tools/include/linux/list.h:7:
   In file included from tools/include/linux/kernel.h:8:
   In file included from tools/include/linux/build_bug.h:5:
   In file included from tools/include/linux/compiler.h:5:
   In file included from tools/include/linux/compiler_types.h:78:
>> tools/include/linux/compiler-clang.h:117:5: warning: 'CONFIG_CLANG_VERSION' is not defined, evaluates to 0 [-Wundef]
   117 | #if CONFIG_CLANG_VERSION >= 110000
   |     ^
   In file included from check.c:11:
   In file included from tools/objtool/include/objtool/builtin.h:8:
   In file included from tools/objtool/libsubcmd/include/subcmd/parse-options.h:5:
   In file included from tools/include/linux/kernel.h:8:
   In file included from tools/include/linux/build_bug.h:5:
   In file included from tools/include/linux/compiler.h:5:
   In file included from tools/include/linux/compiler_types.h:78:
>> tools/include/linux/compiler-clang.h:117:5: warning: 'CONFIG_CLANG_VERSION' is not defined, evaluates to 0 [-Wundef]
   117 | #if CONFIG_CLANG_VERSION >= 110000
   |     ^
   In file included from orc_dump.c:7:
   In file included from tools/arch/x86/include/asm/orc_types.h:10:
   In file included from tools/include/linux/compiler.h:5:
   In file included from tools/include/linux/compiler_types.h:78:
>> tools/include/linux/compiler-clang.h:117:5: warning: 'CONFIG_CLANG_VERSION' is not defined, evaluates to 0 [-Wundef]
   117 | #if CONFIG_CLANG_VERSION >= 110000
   |     ^
   In file included from ../lib/ctype.c:8:
   In file included from tools/include/linux/ctype.h:5:
   In file included from tools/include/linux/compiler.h:5:
   In file included from tools/include/linux/compiler_types.h:78:
>> tools/include/linux/compiler-clang.h:117:5: warning: 'CONFIG_CLANG_VERSION' is not defined, evaluates to 0 [-Wundef]
   117 | #if CONFIG_CLANG_VERSION >= 110000
   |     ^
   In file included from objtool.c:13:
   In file included from tools/include/linux/kernel.h:8:
   In file included from tools/include/linux/build_bug.h:5:
   In file included from tools/include/linux/compiler.h:5:
   In file included from tools/include/linux/compiler_types.h:78:
>> tools/include/linux/compiler-clang.h:117:5: warning: 'CONFIG_CLANG_VERSION' is not defined, evaluates to 0 [-Wundef]
   117 | #if CONFIG_CLANG_VERSION >= 110000
   |     ^
   In file included from orc_gen.c:10:
   In file included from tools/arch/x86/include/asm/orc_types.h:10:
   In file included from tools/include/linux/compiler.h:5:
   In file included from tools/include/linux/compiler_types.h:78:
>> tools/include/linux/compiler-clang.h:117:5: warning: 'CONFIG_CLANG_VERSION' is not defined, evaluates to 0 [-Wundef]
   117 | #if CONFIG_CLANG_VERSION >= 110000
   |     ^
   In file included from special.c:16:
   In file included from tools/objtool/include/objtool/special.h:10:
   In file included from tools/objtool/include/objtool/check.h:11:
   In file included from tools/objtool/include/objtool/arch.h:11:
>> tools/objtool/include/objtool/objtool.h:15:9: warning: '__weak' macro redefined [-Wmacro-redefined]In file included from elf.c:19:
   In file included from tools/include/linux/interval_tree_generic.h:10:
   In file included from tools/include/linux/rbtree_augmented.h:18:
   In file included from tools/include/linux/compiler.h:5:
   In file included from tools/include/linux/compiler_types.h:78:
>> tools/include/linux/compiler-clang.h:117:5: warning: 'CONFIG_CLANG_VERSION' is not defined, evaluates to 0 [-Wundef]
   117 | #if CONFIG_CLANG_VERSION >= 110000
   |     ^
--
   15 | #define __weak __attribute__((weak))
   |         ^
   tools/include/linux/compiler_attributes.h:437:10: note: previous definition is here
   437 | # define __weak                          __attribute__In file included from ../lib/rbtree.c:12:
   In file included from tools/include/linux/rbtree_augmented.h:18:
   In file included from tools/include/linux/compiler.h:5:
   In file included from tools/include/linux/compiler_types.h:78:
>> tools/include/linux/compiler-clang.h:117:5: warning: 'CONFIG_CLANG_VERSION' is not defined, evaluates to 0 [-Wundef]
   117 | #if CONFIG_CLANG_VERSION >= 110000
   |     ^
   ((__weak__))
   |          ^
   1 warning generated.
   In file included from weak.c:10:
>> tools/objtool/include/objtool/objtool.h:15:9: warning: '__weak' macro redefined [-Wmacro-redefined]
   15 | #define __weak __attribute__((weak))
   |         ^
   tools/include/linux/compiler_attributes.h:437:10: note: previous definition is here
   437 | # define __weak                          __attribute__((__weak__))
   |          ^
   In file included from arch/x86/special.c:4:
   In file included from tools/objtool/include/objtool/special.h:10:
   In file included from tools/objtool/include/objtool/check.h:11:
   In file included from tools/objtool/include/objtool/arch.h:11:
>> tools/objtool/include/objtool/objtool.h:15:9: warning: '__weak' macro redefined [-Wmacro-redefined]
   15 | #define __weak __attribute__((weak))
   |         ^
   tools/include/linux/compiler_attributes.h:437:10: note: previous definition is here
   437 | # define __weak                          __attribute__((__weak__))
   |          ^
   In file included from 2 warnings generated.
   ../lib/string.c:19:
   In file included from tools/include/linux/string.h:6:
   In file included from tools/include/linux/compiler.h:5:
   In file included from tools/include/linux/compiler_types.h:78:
>> tools/include/linux/compiler-clang.h:117:5: warning: 'CONFIG_CLANG_VERSION' is not defined, evaluates to 0 [-Wundef]
   117 | #if CONFIG_CLANG_VERSION >= 110000
   |     ^
   In file included from orc_gen.c:12:
   In file included from tools/objtool/include/objtool/check.h:11:
   In file included from tools/objtool/include/objtool/arch.h:11:
>> tools/objtool/include/objtool/objtool.h:15:9: warning: '__weak' macro redefined [-Wmacro-redefined]
   15 | #define __weak __attribute__((weak))
   |         ^
   tools/include/linux/compiler_attributes.h:437:10: note: previous definition is here
   437 | # define __weak                          __attribute__((__weak__))
   |          ^
   In file included from objtool.c:16:
>> tools/objtool/include/objtool/objtool.h:15:9: warning: '__weak' macro redefined [-Wmacro-redefined]
   15 | #define __weak __attribute__((weak))
   |         ^
   tools/include/linux/compiler_attributes.h:437:10: note: previous definition is here
   437 | # define __weak                          __attribute__((__weak__))
   |          ^
   In file included from builtin-check.c:10:
>> tools/objtool/include/objtool/objtool.h:15:9: warning: '__weak' macro redefined [-Wmacro-redefined]
   15 | #define __weak __attribute__((weak))
   |         ^
   tools/include/linux/compiler_attributes.h:437:10: note: previous definition is here
   437 | # define __weak                          __attribute__((__weak__))
   |          ^
   In file included from check.c:13:
   In file included from tools/objtool/include/objtool/arch.h:11:
>> tools/objtool/include/objtool/objtool.h:15:9: warning: '__weak' macro redefined [-Wmacro-redefined]
   15 | #define __weak __attribute__((weak))
   |         ^
   tools/include/linux/compiler_attributes.h:437:10: note: previous definition is here
   437 | # define __weak                          __attribute__((__weak__))
   |          ^
   2 warnings generated.
   In file included from orc_dump.c:8:
>> tools/objtool/include/objtool/objtool.h:15:9: warning: '__weak' macro redefined [-Wmacro-redefined]
   15 | #define __weak __attribute__((weak))
   |         ^
   tools/include/linux/compiler_attributes.h:437:10: note: previous definition is here
   437 | # define __weak                          __attribute__((__weak__))
   |          ^
   2 warnings generated.
   2 warnings generated.
   In file included from arch/x86/decode.c:12:
   In file included from arch/x86/../../../arch/x86/lib/insn.c:8:
   In file included from tools/include/linux/kernel.h:8:
   In file included from tools/include/linux/build_bug.h:5:
   In file included from tools/include/linux/compiler.h:5:
   In file included from tools/include/linux/compiler_types.h:78:
>> tools/include/linux/compiler-clang.h:117:5: warning: 'CONFIG_CLANG_VERSION' is not defined, evaluates to 0 [-Wundef]
   117 | #if CONFIG_CLANG_VERSION >= 110000
   |     ^
   2 warnings generated.
   2 warnings generated.
   In file included from ../lib/str_error_r.c:5:
   In file included from tools/include/linux/string.h:6:
   In file included from tools/include/linux/compiler.h:5:
   In file included from tools/include/linux/compiler_types.h:78:
>> tools/include/linux/compiler-clang.h:117:5: warning: 'CONFIG_CLANG_VERSION' is not defined, evaluates to 0 [-Wundef]
   117 | #if CONFIG_CLANG_VERSION >= 110000
   |     ^
   1 warning generated.
   1 warning generated.
   In file included from arch/x86/decode.c:18:
   In file included from tools/objtool/include/objtool/check.h:11:
   In file included from tools/objtool/include/objtool/arch.h:11:
>> tools/objtool/include/objtool/objtool.h:15:9: warning: '__weak' macro redefined [-Wmacro-redefined]
   15 | #define __weak __attribute__((weak))
   |         ^
   tools/include/linux/compiler_attributes.h:437:10: note: previous definition is here
   437 | # define __weak                          __attribute__((__weak__))
   |          ^
   2 warnings generated.
   1 warning generated.
   2 warnings generated.
   1 warning generated.
   2 warnings generated.
--
   In file included from exec-cmd.c:2:
   In file included from tools/include/linux/compiler.h:5:
   In file included from tools/include/linux/compiler_types.h:78:
>> tools/include/linux/compiler-clang.h:117:5: warning: 'CONFIG_CLANG_VERSION' is not defined, evaluates to 0 [-Wundef]
     117 | #if CONFIG_CLANG_VERSION >= 110000
         |     ^
   In file included from parse-options.c:2:
   In file included from tools/include/linux/compiler.h:5:
   In file included from tools/include/linux/compiler_types.h:78:
>> tools/include/linux/compiler-clang.h:117:5: warning: 'CONFIG_CLANG_VERSION' is not defined, evaluates to 0 [-Wundef]
     117 | #if CONFIG_CLANG_VERSION >= 110000
         |     ^
   In file included from help.c:5:
   In file included from tools/include/linux/string.h:6:
   In file included from tools/include/linux/compiler.h:5:
   In file included from tools/include/linux/compiler_types.h:78:
>> tools/include/linux/compiler-clang.h:117:5: warning: 'CONFIG_CLANG_VERSION' is not defined, evaluates to 0 [-Wundef]
     117 | #if CONFIG_CLANG_VERSION >= 110000
         |     ^
   In file included from sigchain.c:3:
   In file included from ./subcmd-util.h:8:
   In file included from tools/include/linux/compiler.h:5:
   In file included from tools/include/linux/compiler_types.h:78:
>> tools/include/linux/compiler-clang.h:117:5: warning: 'CONFIG_CLANG_VERSION' is not defined, evaluates to 0 [-Wundef]
     117 | #if CONFIG_CLANG_VERSION >= 110000
         |     ^
   In file included from run-command.c:7:
   In file included from tools/include/linux/string.h:6:
   In file included from tools/include/linux/compiler.h:5:
   In file included from tools/include/linux/compiler_types.h:78:
>> tools/include/linux/compiler-clang.h:117:5: warning: 'CONFIG_CLANG_VERSION' is not defined, evaluates to 0 [-Wundef]
     117 | #if CONFIG_CLANG_VERSION >= 110000
         |     ^
   1 warning generated.
   1 warning generated.
   1 warning generated.
   1 warning generated.
   1 warning generated.
   In file included from weak.c:10:
   In file included from tools/objtool/include/objtool/objtool.h:10:
   In file included from tools/include/linux/list.h:7:
   In file included from tools/include/linux/kernel.h:8:
   In file included from tools/include/linux/build_bug.h:5:
   In file included from tools/include/linux/compiler.h:5:
   In file included from tools/include/linux/compiler_types.h:78:
>> tools/include/linux/compiler-clang.h:117:5: warning: 'CONFIG_CLANG_VERSION' is not defined, evaluates to 0 [-Wundef]
     117 | #if CONFIG_CLANG_VERSION >= 110000
         |     ^
   In file included from builtin-check.c:6:
   In file included from tools/objtool/libsubcmd/include/subcmd/parse-options.h:5:
   In file included from tools/include/linux/kernel.h:8:
   In file included from tools/include/linux/build_bug.h:5:
   In file included from tools/include/linux/compiler.h:5:
   In file included from tools/include/linux/compiler_types.h:78:
>> tools/include/linux/compiler-clang.h:117:5: warning: 'CONFIG_CLANG_VERSION' is not defined, evaluates to 0 [-Wundef]
     117 | #if CONFIG_CLANG_VERSION >= 110000
         |     ^
   In file included from elf.c:19:
   In file included from tools/include/linux/interval_tree_generic.h:10:
   In file included from tools/include/linux/rbtree_augmented.h:18:
   In file included from tools/include/linux/compiler.h:5:
   In file included from tools/include/linux/compiler_types.h:78:
>> tools/include/linux/compiler-clang.h:117:5: warning: 'CONFIG_CLANG_VERSION' is not defined, evaluates to 0 [-Wundef]
     117 | #if CONFIG_CLANG_VERSION >= 110000
         |     ^
   In file included from orc_gen.c:10:
   In file included from tools/arch/x86/include/asm/orc_types.h:10:
   In file included from tools/include/linux/compiler.h:5:
   In file included from tools/include/linux/compiler_types.h:78:
>> tools/include/linux/compiler-clang.h:117:5: warning: 'CONFIG_CLANG_VERSION' is not defined, evaluates to 0 [-Wundef]
     117 | #if CONFIG_CLANG_VERSION >= 110000
         |     ^
   In file included from arch/x86/special.c:4:
   In file included from tools/objtool/include/objtool/special.h:10:
   In file included from tools/objtool/include/objtool/check.h:10:
   In file included from tools/objtool/include/objtool/cfi.h:10:
   In file included from tools/include/linux/list.h:7:
   In file included from tools/include/linux/kernel.h:8:
   In file included from tools/include/linux/build_bug.h:5:
   In file included from tools/include/linux/compiler.h:5:
   In file included from tools/include/linux/compiler_types.h:78:
>> tools/include/linux/compiler-clang.h:117:5: warning: 'CONFIG_CLANG_VERSION' is not defined, evaluates to 0 [-Wundef]
     117 | #if CONFIG_CLANG_VERSION >= 110000
         |     ^
   In file included from ../lib/string.c:19:
   In file included from tools/include/linux/string.h:6:
   In file included from tools/include/linux/compiler.h:5:
   In file included from tools/include/linux/compiler_types.h:78:
>> tools/include/linux/compiler-clang.h:117:5: warning: 'CONFIG_CLANG_VERSION' is not defined, evaluates to 0 [-Wundef]
     117 | #if CONFIG_CLANG_VERSION >= 110000
         |     ^
   In file included from special.c:15:
   In file included from tools/objtool/include/objtool/builtin.h:8:
   In file included from tools/objtool/libsubcmd/include/subcmd/parse-options.h:5:
   In file included from tools/include/linux/kernel.h:8:
   In file included from tools/include/linux/build_bug.h:5:
   In file included from tools/include/linux/compiler.h:5:
   In file included from tools/include/linux/compiler_types.h:78:
>> tools/include/linux/compiler-clang.h:117:5: warning: 'CONFIG_CLANG_VERSION' is not defined, evaluates to 0 [-Wundef]
   In file included from orc_dump.c:7:
   In file included from tools/arch/x86/include/asm/orc_types.h:10:
   In file included from tools/include/linux/compiler.h:5:
   In file included from tools/include/linux/compiler_types.h:78:
>> tools/include/linux/compiler-clang.h:117:5: warning: 'CONFIG_CLANG_VERSION' is not defined, evaluates to 0 [-Wundef]
       117 | #if CONFIG_CLANG_VERSION >= 110000
         |     ^
   In file included from weak.c:10:
>> tools/objtool/include/objtool/objtool.h:15:9: warning: '__weak' macro redefined [-Wmacro-redefined]
      15 | #define __weak __aIn file included from ttribute__((weak))
         |         ^
   tools/include/linux/compiler_attributes.h:437:10: note: previous definition is here
     437 | # define __weak                          __attribute__((__weak__))
         |          ^
   117 | #if CONFIG_CLANG_VERSION >= 110000
         |     ^
   ../lib/ctype.c:8:
   In file included from tools/include/linux/ctype.h:5:
   In file included from tools/include/linux/compiler.h:5:
   In file included from tools/include/linux/compiler_types.h:78:
>> tools/include/linux/compiler-clang.h:117:5: warning: 'CONFIG_CLANG_VERSION' is not defined, evaluates to 0 [-Wundef]
     117 | #if CONFIG_CLANG_VERSION >= 110000
         |     ^
   In file included from objtool.c:13:
   In file included from tools/include/linux/kernel.h:8:
   In file included from tools/include/linux/build_bug.h:5:
   In file included from tools/include/linux/compiler.h:5:
   In file included from tools/include/linux/compiler_types.h:78:
>> tools/include/linux/compiler-clang.h:117:5: warning: 'CONFIG_CLANG_VERSION' is not defined, evaluates to 0 [-Wundef]
     117 | #if CONFIG_CLANG_VERSION >= 110000
         |     ^
   In file included from check.c:11:
   In file included from tools/objtool/include/objtool/builtin.h:8:
   In file included from tools/objtool/libsubcmd/include/subcmd/parse-options.h:5:
   In file included from tools/include/linux/kernel.h:8:
   In file included from tools/include/linux/build_bug.h:5:
   In file included from tools/include/linux/compiler.h:5:
   In file included from tools/include/linux/compiler_types.h:78:
>> tools/include/linux/compiler-clang.h:117:5: warning: 'CONFIG_CLANG_VERSION' is not defined, evaluates to 0 [-Wundef]
     117 | #if CONFIG_CLANG_VERSION >= 110000
         |     ^
   In file included from ../lib/rbtree.c:12:
   In file included from tools/include/linux/rbtree_augmented.h:18:
   In file included from tools/include/linux/compiler.h:5:
   In file included from tools/include/linux/compiler_types.h:78:
>> tools/include/linux/compiler-clang.h:117:5: warning: 'CONFIG_CLANG_VERSION' is not defined, evaluates to 0 [-Wundef]
     117 | #if CONFIG_CLANG_VERSION >= 110000
         |     ^
   1 warning generated.
   2 warnings generated.
   In file included from orc_gen.c:12:
   In file included from tools/objtool/include/objtool/check.h:11:
   In file included from tools/objtool/include/objtool/arch.h:11:
>> tools/objtool/include/objtool/objtool.h:15:9: warning: '__weak' macro redefined [-Wmacro-redefined]
      15 | #define __weak __attribute__((weak))
         |         ^
   tools/include/linux/compiler_attributes.h:437:10: note: previous definition is here
     437 | # define __weak                          __attribute__((__weak__))
         |          ^
   In file included from arch/x86/decode.c:12:
   In file included from arch/x86/../../../arch/x86/lib/insn.c:8:
   In file included from tools/include/linux/kernel.h:8:
   In file included from tools/include/linux/build_bug.h:5:
   In file included from tools/include/linux/compiler.h:5:
   In file included from tools/include/linux/compiler_types.h:78:
>> tools/include/linux/compiler-clang.h:117:5: warning: 'CONFIG_CLANG_VERSION' is not defined, evaluates to 0 [-Wundef]
     117 | #if CONFIG_CLANG_VERSION >= 110000
         |     ^
   In file included from builtin-check.c:10:
   tools/objtool/include/objtool/objtool.h:15:9: warning: '__weak' macro redefined [-Wmacro-redefined]
      15 | #define __weak __attribute__((weak))
         |         ^
   tools/include/linux/compiler_attributes.h:437:10: note: previous definition is here
     437 | # define __weak                          __attribute__((__weak__))
         |          ^
   In file included from arch/x86/special.c:4:
   In file included from tools/objtool/include/objtool/special.h:10:
   In file included from tools/objtool/include/objtool/check.h:11:
   In file included from tools/objtool/include/objtool/arch.h:11:
   tools/objtool/include/objtool/objtool.h:15:9: warning: '__weak' macro redefined [-Wmacro-redefined]
      15 | #define __weak __attribute__((weak))
         |         ^
   tools/include/linux/compiler_attributes.h:437:10: note: previous definition is here
     437 | # define __weak                          __attribute__((__weak__))
         |          ^
   1 warning generated.
   In file included from orc_dump.c:8:
   tools/objtool/include/objtool/objtool.h:15:9: warning: '__weak' macro redefined [-Wmacro-redefined]
      15 | #define __weak __attribute__((weak))
         |         ^
   tools/include/linux/compiler_attributes.h:437:10: note: previous definition is here
     437 | # define __weak                          __attribute__((__weak__))
         |          ^
   2 warnings generated.
   In file included from In file included from check.c:13:
   In file included from tools/objtool/include/objtool/arch.h:11:
   tools/objtool/include/objtool/objtool.h:15:9: warning: '__weak' macro redefined [-Wmacro-redefined]
      15 | #define __weak __attribute__((weak))
         |         ^
   tools/include/linux/compiler_attributes.h:437:10: note: previous definition is here
     437 | # define __weak                          __attribute__((__weak__))
         |          ^
   In file included from arch/x86/decode.c:18:
   In file included from tools/objtool/include/objtool/check.h:11:
   In file included from tools/objtool/include/objtool/arch.h:11:
   tools/objtool/include/objtool/objtool.h:15:9: warning: '__weak' macro redefined [-Wmacro-redefined]
      15 | #define __weak __attributespecial.c__((weak))
         |         ^
   tools/include/linux/compiler_attributes.h:437:10: note: previous definition is here
     437 | # define __weak                          __attribute__((__weak__))
         |          ^
   :16:
   In file included from tools/objtool/include/objtool/special.h:10:
   In file included from tools/objtool/include/objtool/check.h:11:
   In file included from tools/objtool/include/objtool/arch.h:11:
   tools/objtool/include/objtool/objtool.h:15:9: warning: '__weak' macro redefined [-Wmacro-redefined]
      15 | #define __weak __attribute__((weak))
         |         ^
   tools/include/linux/compiler_attributes.h:437:10: note: previous definition is here
     437 | # define __weak                          __attribute__((__weak__))
         |          ^
   In file included from objtool.c:16:
   tools/objtool/include/objtool/objtool.h:15:9: warning: '__weak' macro redefined [-Wmacro-redefined]
      15 | #define __weak __attribute__((weak))
         |         ^
   tools/include/linux/compiler_attributes.h:437:10: note: previous definition is here
     437 | # define __weak                          __attribute__((__weak__))
         |          ^
   2 warnings generated.
   2 warnings generated.
   In file included from ../lib/str_error_r.c:5:
   In file included from tools/include/linux/string.h:6:
   In file included from tools/include/linux/compiler.h:5:
   In file included from tools/include/linux/compiler_types.h:78:
   tools/include/linux/compiler-clang.h:117:5: warning: 'CONFIG_CLANG_VERSION' is not defined, evaluates to 0 [-Wundef]
     117 | #if CONFIG_CLANG_VERSION >= 110000
         |     ^
   2 warnings generated.
   1 warning generated.
   2 warnings generated.
   2 warnings generated.
   1 warning generated.
   2 warnings generated.
   1 warning generated.
   2 warnings generated.


vim +/CONFIG_CLANG_VERSION +117 tools/include/linux/compiler-clang.h

   116	
 > 117	#if CONFIG_CLANG_VERSION >= 110000
   118	#define __diag_clang_11(s)	__diag(s)
   119	#else
   120	#define __diag_clang_11(s)
   121	#endif
   122	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
