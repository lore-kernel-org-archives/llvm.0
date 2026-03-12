Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC77D3FE647;
	Thu, 12 Mar 2026 17:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773338050; cv=none; b=MxEyiAowOYReeMWZmOGvpZMWo76C5syJLB/x2Kq48ERzHgOg3DTZ+M2ACQ26zszFfr4wPvbHZl9mCgeWtegm3qhGUsg2k0FBhLQMn7npzNtdUCfohspxS0PfjUzM8LodeeGISYsEbNye4RGgtawmGOyIXkRido/nngyfYJ3UMLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773338050; c=relaxed/simple;
	bh=FcLAZQ1PMT5aEh0d51Os7N7jGkgtnOhbhE50umhUp6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lOLNpRfWsjhAUX/slesJMG+AWPLiCbcL8a3qPpgzrKThHnxn+L1EgyTZMBkoT2UjAQokKr9WTpqUhlrsJEbBE6uZzib6ABL/14szGrIpBLgxpoO2O+JCV+vov2f3/dvcLChNE3vv4LfdLinAMU75kM+bfdnDkTY6hNWE02BT1vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i6HQeuHm; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i6HQeuHm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773338049; x=1804874049;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FcLAZQ1PMT5aEh0d51Os7N7jGkgtnOhbhE50umhUp6U=;
  b=i6HQeuHm2i5NSkpzfGjoHxCIoFV25clY67BILf7DAq6SftdrwZLoKjWS
   tQcTXsdonIN89Ahjq8viAJMMJLrLnoR2OHk838h+X+WnXXsMI4H/W2SBz
   kmWCjCFWmgqaZhHLx81DNsGMVbH7ZmDzT29v8aCaJab5/bd+znLG6kZiS
   MszfO8XsRlHaXpaZiXj/yEAvkXua1mAJYGUWpuDqr/x3VlTJyZAH0K4Xb
   WI+NQ/dLWEengaEnFexMNGZwL7cKuzSKD8ujczcjW3WKL3pClcUXqqJa2
   Opl9UdAJ6chfvQJ3f/lNzBmhvkNyryEeJ+YHJlz7umWelax1vUv5d0N/8
   w==;
X-CSE-ConnectionGUID: QK4P+LoLRDq6jM5f8TQskA==
X-CSE-MsgGUID: UfCXar2xRBG1ihpv0/eCCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="77049153"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; 
   d="scan'208";a="77049153"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 10:54:08 -0700
X-CSE-ConnectionGUID: a6qGDw00TYGi77z7sFnAjw==
X-CSE-MsgGUID: B8HZEOlfRe2FBnXXYrViCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; 
   d="scan'208";a="217407757"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 Mar 2026 10:54:01 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0kEP-000000002mF-0RQc;
	Thu, 12 Mar 2026 17:53:57 +0000
Date: Fri, 13 Mar 2026 01:53:05 +0800
From: kernel test robot <lkp@intel.com>
To: Chengwen Feng <fengchengwen@huawei.com>,
	Bjorn Helgaas <helgaas@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>, Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Len Brown <lenb@kernel.org>, Sunil V L <sunilvl@ventanamicro.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Kees Cook <kees@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Sean Christopherson <seanjc@google.com>,
	Kai Huang <kai.huang@intel.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v6 2/3] x86: Implement acpi_get_cpu_uid()
Message-ID: <202603130128.58JEZ1Wg-lkp@intel.com>
References: <20260312072316.4806-3-fengchengwen@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312072316.4806-3-fengchengwen@huawei.com>

Hi Chengwen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on arm64/for-next/core]
[also build test WARNING on pci/next pci/for-linus rafael-pm/linux-next rafael-pm/bleeding-edge tip/x86/core linus/master v7.0-rc3 next-20260311]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chengwen-Feng/ACPI-Rename-get_acpi_id_for_cpu-to-acpi_get_cpu_uid-on-non-x86/20260312-152657
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20260312072316.4806-3-fengchengwen%40huawei.com
patch subject: [PATCH v6 2/3] x86: Implement acpi_get_cpu_uid()
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260313/202603130128.58JEZ1Wg-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260313/202603130128.58JEZ1Wg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603130128.58JEZ1Wg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/cpu/common.c:2652:5: warning: no previous prototype for function 'acpi_get_cpu_uid' [-Wmissing-prototypes]
    2652 | int acpi_get_cpu_uid(unsigned int cpu, u32 *uid)
         |     ^
   arch/x86/kernel/cpu/common.c:2652:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2652 | int acpi_get_cpu_uid(unsigned int cpu, u32 *uid)
         | ^
         | static 
   1 warning generated.


vim +/acpi_get_cpu_uid +2652 arch/x86/kernel/cpu/common.c

  2651	
> 2652	int acpi_get_cpu_uid(unsigned int cpu, u32 *uid)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
