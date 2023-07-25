Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98081263D8;
	Tue, 25 Jul 2023 19:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690313838; x=1721849838;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iXbgVG18Y7RTGH9a4tg9bgDCR+4JUI1k2BMBe1/7ZtU=;
  b=TbGaEgUCZ0GluAW7zmbVcyV32tnjumJ9+GJpjoRhKlmlFJ0Db0HMpXY1
   7f5rkRSvGM1qgwr9KoPVAB7J/fuT/KsjJ6D6BT6FHDhgn0kraQGSYmK5j
   dWno/p0RsbB4k78ilwIW4NCBVCXdgL2H2Gj8QkukakkCmV9zX9tAp7low
   v5gFod5+34W4V2Kd0/kmptbKnrX3zBgnURV61dTWjmkha3SThctSQcbqs
   NaPntcQYw8WIp2Dz8wtE/9y+4YxegDQR4w0cnltWWRLonOXyGVWqqlzC/
   12KOf9c+xnmeTrUXtXqM34qC8fexgdRBFKVgnaF7Cwq2H6ZFKiqjE7LyB
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="367856218"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="367856218"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 12:37:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="791512095"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="791512095"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 25 Jul 2023 12:37:13 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qONqK-0000I3-1y;
	Tue, 25 Jul 2023 19:37:12 +0000
Date: Wed, 26 Jul 2023 03:36:39 +0800
From: kernel test robot <lkp@intel.com>
To: Petr Tesarik <petrtesarik@huaweicloud.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Li Huafei <lihuafei1@huawei.com>,
	Liao Chang <liaochang1@huawei.com>,
	Masahiro Yamada <masahiroy@kernel.org>, Alyssa Ross <hi@alyssa.is>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Kees Cook <keescook@chromium.org>, Heiko Stuebner <heiko@sntech.de>,
	Li Zhengyu <lizhengyu3@huawei.com>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Roberto Sassu <roberto.sassu@huaweicloud.com>, petr@tesarici.cz
Subject: Re: [PATCH v1 3/3] riscv/purgatory: do not link with string.o
Message-ID: <202307260325.E3Uh9dYf-lkp@intel.com>
References: <a083f38c7c3acd6ac9542228e36947be30b58188.1690274483.git.petr.tesarik.ext@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a083f38c7c3acd6ac9542228e36947be30b58188.1690274483.git.petr.tesarik.ext@huawei.com>

Hi Petr,

kernel test robot noticed the following build errors:

[auto build test ERROR on kees/for-next/pstore]
[also build test ERROR on kees/for-next/kspp linus/master v6.5-rc3 next-20230725]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Petr-Tesarik/riscv-kexec-handle-R_RISCV_CALL_PLT-relocation-type/20230725-165116
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/pstore
patch link:    https://lore.kernel.org/r/a083f38c7c3acd6ac9542228e36947be30b58188.1690274483.git.petr.tesarik.ext%40huawei.com
patch subject: [PATCH v1 3/3] riscv/purgatory: do not link with string.o
config: riscv-randconfig-r001-20230725 (https://download.01.org/0day-ci/archive/20230726/202307260325.E3Uh9dYf-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230726/202307260325.E3Uh9dYf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307260325.E3Uh9dYf-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: memcmp
   >>> referenced by ctype.c
   >>>               arch/riscv/purgatory/purgatory.ro:(purgatory)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
