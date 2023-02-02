Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0668110FD;
	Thu,  2 Feb 2023 09:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675330413; x=1706866413;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aIiyDgv/qmZGr3jDNkPYzcbCICg4MgEqP2BLjAJlMts=;
  b=lk6poxTvtTNKQaCFen5csdQbcM+hX0E60hlKQlik3XryDmrrtahDRJRJ
   mbI3NaqCopAeADTCoIB7K2bsYBNNbs/j/bzjuIbCM2nnfF07Mypd+3Xn4
   QWrrdayx5kB+SEqqN4h7maSpYPSkWT4CiZsQ2KVMz+0+ZS+ZAEbsVGaRn
   dPearp/pqnrO794GI+++cj5rhTOu7mOEhH1uFuLP54pRClVilHRtEhlu9
   Md2/wk5D6Ly8IjGbNURV0/2JY8N701Ra2zgrrueBWqLuywueIYzI53+VE
   jZNHKZDIJHuL+Lc3z/SSwJNEP4SrAlvEzjgyMd81QclG/qR9vaCBIdgH2
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="308742900"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="308742900"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2023 01:33:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="697626494"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="697626494"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 02 Feb 2023 01:33:27 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNVy6-0006O0-0g;
	Thu, 02 Feb 2023 09:33:22 +0000
Date: Thu, 2 Feb 2023 17:32:40 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Desaulniers <ndesaulniers@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>,
	Tom Rix <trix@redhat.com>, Nicolas Schier <nicolas@fjasle.eu>,
	Jonathan Corbet <corbet@lwn.net>, llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Bill Wendling <morbo@google.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Yonghong Song <yhs@fb.com>, Daniel Kolesa <q66@chimera-linux.org>,
	Chris Mason <chris.mason@fusionio.com>
Subject: Re: [PATCH] Documentation/llvm: add Chimera Linux, Google and Meta
 datacenters
Message-ID: <202302021759.syE8waoZ-lkp@intel.com>
References: <20230201192509.4124319-1-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230201192509.4124319-1-ndesaulniers@google.com>

Hi Nick,

I love your patch! Perhaps something to improve:

[auto build test WARNING on masahiroy-kbuild/for-next]
[also build test WARNING on masahiroy-kbuild/fixes linus/master v6.2-rc6 next-20230202]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nick-Desaulniers/Documentation-llvm-add-Chimera-Linux-Google-and-Meta-datacenters/20230202-032729
base:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git for-next
patch link:    https://lore.kernel.org/r/20230201192509.4124319-1-ndesaulniers%40google.com
patch subject: [PATCH] Documentation/llvm: add Chimera Linux, Google and Meta datacenters
reproduce:
        # https://github.com/intel-lab-lkp/linux/commit/fb73005aa3c6a4052e30f0f0dc2c608bafd8acce
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Nick-Desaulniers/Documentation-llvm-add-Chimera-Linux-Google-and-Meta-datacenters/20230202-032729
        git checkout fb73005aa3c6a4052e30f0f0dc2c608bafd8acce
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> Documentation/kbuild/llvm.rst:13: WARNING: Unknown target name: "chromeos https://www.chromium.org/chromium-os>".

vim +13 Documentation/kbuild/llvm.rst

fcf1b6a35c16ac5 Nick Desaulniers 2020-02-26  12  
fcf1b6a35c16ac5 Nick Desaulniers 2020-02-26 @13  The Linux kernel has always traditionally been compiled with GNU toolchains
fcf1b6a35c16ac5 Nick Desaulniers 2020-02-26  14  such as GCC and binutils. Ongoing work has allowed for `Clang
fcf1b6a35c16ac5 Nick Desaulniers 2020-02-26  15  <https://clang.llvm.org/>`_ and `LLVM <https://llvm.org/>`_ utilities to be
fcf1b6a35c16ac5 Nick Desaulniers 2020-02-26  16  used as viable substitutes. Distributions such as `Android
fcf1b6a35c16ac5 Nick Desaulniers 2020-02-26  17  <https://www.android.com/>`_, `ChromeOS
fb73005aa3c6a40 Nick Desaulniers 2023-02-01  18  https://www.chromium.org/chromium-os>`_, `OpenMandriva
fb73005aa3c6a40 Nick Desaulniers 2023-02-01  19  <https://www.openmandriva.org/>`_, and `Chimera Linux
fb73005aa3c6a40 Nick Desaulniers 2023-02-01  20  <https://chimera-linux.org/>`_ use Clang built kernels. Google's and Meta's
fb73005aa3c6a40 Nick Desaulniers 2023-02-01  21  datacenter fleets also run kernels built with Clang.
fb73005aa3c6a40 Nick Desaulniers 2023-02-01  22  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
