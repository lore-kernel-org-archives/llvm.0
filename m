Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79BC7F8;
	Sat,  9 Dec 2023 01:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mo3E+Pb9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702085627; x=1733621627;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6u1bdGnqaxTPzZjyGPeHqcOCEdEQuqsNCKNHyktM/+o=;
  b=Mo3E+Pb96XFRBhH8fr1LJYgTgQz/LR0NSOLOK2uhMBN7j5JulJXWx10B
   g8IHqj/lEYvi2Y8WseBJN57Ei2fsrbPFCfR9bS45Bxs29/3YiL0TV0xZP
   0+HTmUS78aPTaAnWCGQ6NhSH1rEkJWkOtLwEb6pvOWxWf3QUkbLG88xR2
   qQOHULZUAPpj86nkeA88DwrAJ/WRCUhlj/G8uiOe/CAD/nhNFTAx8v14i
   tttfqrjLL5C+Hol7XKjnbrRKnIsmjzHTTnx+kXJ7NGM3jnu2KaUYhNtEN
   l8PT9MqkH92ml+9L+9/ErOnQ4fxRd/Y5IcGE9OoLnL83M2BkQE/Q9Y3pB
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="1361996"
X-IronPort-AV: E=Sophos;i="6.04,262,1695711600"; 
   d="scan'208";a="1361996"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2023 17:33:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="916144024"
X-IronPort-AV: E=Sophos;i="6.04,262,1695711600"; 
   d="scan'208";a="916144024"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 08 Dec 2023 17:33:42 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBmDs-000Edn-0k;
	Sat, 09 Dec 2023 01:33:40 +0000
Date: Sat, 9 Dec 2023 09:33:10 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Uros Bizjak <ubizjak@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Arnd Bergmann <arnd@arndb.de>, "H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Kees Cook <keescook@chromium.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86/alternative: move apply_relocation() out of init
 section
Message-ID: <202312090936.qsdfR8TM-lkp@intel.com>
References: <20231204072856.1033621-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231204072856.1033621-1-arnd@kernel.org>

Hi Arnd,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/master]
[also build test WARNING on tip/x86/percpu next-20231208]
[cannot apply to tip/auto-latest linus/master v6.7-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Arnd-Bergmann/x86-alternative-move-apply_relocation-out-of-init-section/20231204-153129
base:   tip/master
patch link:    https://lore.kernel.org/r/20231204072856.1033621-1-arnd%40kernel.org
patch subject: [PATCH] x86/alternative: move apply_relocation() out of init section
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20231209/202312090936.qsdfR8TM-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231209/202312090936.qsdfR8TM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312090936.qsdfR8TM-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
>> WARNING: modpost: vmlinux: section mismatch in reference: __optimize_nops+0xa7 (section: .text) -> add_nop (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
