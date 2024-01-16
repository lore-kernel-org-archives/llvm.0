Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EDA71BF4C;
	Tue, 16 Jan 2024 15:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gJKchYGH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705418360; x=1736954360;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=dlMMeeahAep7axxyd28etL86y6XFk0z/4H2vZSYSxNc=;
  b=gJKchYGHEUt1/GTLLatMm16+AeaTFoVvfXpRpIuK2DB8hISw33Dx8bbq
   Mpmwmz5y2iGeT6KpCOtapt+l5YBR8DBZEwQn0GcghEvKcOkdvUl0PQS0q
   7CeqZ+wh0aDgW7KT7JUh/QkVdKM4UnMBuJNbX+PyV9yAoW4rNb+W0hgJO
   8ygqsZ9U/gpni3m0vCbDqgwBreZm9kcpFrDy+UmOem5jZDPYgIkO5MBvW
   2yacuMxbk1Xermyb9AS5e222ayMnYKXO7rszj3JYKcvuZdfYNIQoAymGT
   Jig0HkY7+hLdS4/Bmppo2ikRJ7+ZDey43c1qoxoEyDravkHm+/PmoCpk8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="7276387"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; 
   d="scan'208";a="7276387"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 07:19:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="787468970"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; 
   d="scan'208";a="787468970"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 16 Jan 2024 07:19:15 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rPlDc-0000qA-25;
	Tue, 16 Jan 2024 15:19:12 +0000
Date: Tue, 16 Jan 2024 23:18:18 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 2/3] riscv: add support for SBI Supervisor
 Software Events extension
Message-ID: <202401162229.iHwdIu0n-lkp@intel.com>
References: <20240112111720.2975069-3-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240112111720.2975069-3-cleger@rivosinc.com>

Hi Clément,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.7]
[cannot apply to next-20240112]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cl-ment-L-ger/riscv-add-SBI-SSE-extension-definitions/20240112-191943
base:   linus/master
patch link:    https://lore.kernel.org/r/20240112111720.2975069-3-cleger%40rivosinc.com
patch subject: [RFC PATCH v2 2/3] riscv: add support for SBI Supervisor Software Events extension
config: riscv-nommu_virt_defconfig (https://download.01.org/0day-ci/archive/20240116/202401162229.iHwdIu0n-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project 9bde5becb44ea071f5e1fa1f5d4071dc8788b18c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240116/202401162229.iHwdIu0n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401162229.iHwdIu0n-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: ret_from_sse
   >>> referenced by stacktrace.c
   >>>               arch/riscv/kernel/stacktrace.o:(walk_stackframe) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
