Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0443B442C;
	Sun, 20 Apr 2025 05:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745126286; cv=none; b=VprxVyq1l30AjY8lwk21h0WRxiUrCDtA8MdfSTAX21wtlIud7FWi2aXy5pVVr0CHsS6ooqmofMtN1uwzMmcgnRpq+Zr1WZsVovEDrz71zNkbXWNxhxtJFTKWpXtcPgzCBvX3qKOVVbG0PyuTk5hVPdfYKrxX2sdprDy/GOX1ZW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745126286; c=relaxed/simple;
	bh=kALd7uzBQi4hQSWBc1DanYBb1A9XeSI+6BhB/tS4hHU=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dGnOwBfASCP32beW2OXYxOm6dEillbXPM9rHkXHTgb0SlDSXrb6GcEYF/AHl9IjiwsrDaGCzi1F/UEDoGvFJzEyKErcb1Ih7g6Icx1QVAliKfsP88B+lUGzNE7YUUHDnBY4R/Jvp9qXTAUT/Y+q3ozW/I1X4nYi/7x90+pxWHoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c02ZAotH; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c02ZAotH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745126284; x=1776662284;
  h=date:from:cc:subject:message-id:mime-version;
  bh=kALd7uzBQi4hQSWBc1DanYBb1A9XeSI+6BhB/tS4hHU=;
  b=c02ZAotHD5lFPnSQaRs/ks7aJjL4OSN+fy8fNlVgmLH92DtK02I8SLpc
   +/wzmlac9581imL/Ca/qGCzmwxGbpQZbQTpShUsvEvE9U9yA4RXQaMBcY
   Tdcj6JaekiAEcKf+qsoGyUjiogc2lRj/VH42K/xA7bj8gGX0t4oFEu6rj
   bkNQcByTj6Id4Ztyw+nEh3bkIij96LbRAMd3zVM0fUtgJRgT72mxe3zY1
   tVZTCdDpSQ6ajGmeNghDDTOWFoG1qeCKIunN+AB9otID0K0BWagILFRgu
   jcenE1vtXxf6Ofr+HUcZ68bsut7Zh2zUODuG6zh5Tm8ntdQjgAxLqWBMg
   w==;
X-CSE-ConnectionGUID: b0AyPXdPQMWigsnAo4mi3g==
X-CSE-MsgGUID: ik3BzekpTNKkB46gFkLGZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11408"; a="46587380"
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="46587380"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2025 22:18:04 -0700
X-CSE-ConnectionGUID: f3j1B9xwQ2qXohpnpGlV9w==
X-CSE-MsgGUID: grKtB9VZS4++oIqSoJ6yvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="136298995"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 19 Apr 2025 22:18:03 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6N44-0004RV-0n;
	Sun, 20 Apr 2025 05:18:00 +0000
Date: Sun, 20 Apr 2025 13:17:27 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: Re: [PATCH] kbuild: distributed build support for Clang ThinLTO
Message-ID: <202504201309.o2F1OHlm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In-Reply-To: <20250420010214.1963979-1-xur@google.com>
References: <20250420010214.1963979-1-xur@google.com>
TO: xur@google.com
TO: Masahiro Yamada <masahiroy@kernel.org>
TO: Nathan Chancellor <nathan@kernel.org>
TO: Nicolas Schier <nicolas.schier@linux.dev>
TO: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
TO: Bill Wendling <morbo@google.com>
TO: Justin Stitt <justinstitt@google.com>
TO: Miguel Ojeda <ojeda@kernel.org>
TO: Thomas Gleixner <tglx@linutronix.de>
TO: Alice Ryhl <aliceryhl@google.com>
TO: Sami Tolvanen <samitolvanen@google.com>
TO: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
TO: Rafael Aquini <aquini@redhat.com>
TO: Michael Ellerman <mpe@ellerman.id.au>
TO: Stafford Horne <shorne@gmail.com>
TO: Christophe Leroy <christophe.leroy@csgroup.eu>
TO: Rong Xu <xur@google.com>
TO: Teresa Johnson <tejohnson@google.com>
CC: linux-kernel@vger.kernel.org
CC: linux-kbuild@vger.kernel.org
CC: llvm@lists.linux.dev

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on masahiroy-kbuild/for-next]
[also build test ERROR on masahiroy-kbuild/fixes linus/master v6.15-rc2 next-20250417]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/xur-google-com/kbuild-distributed-build-support-for-Clang-ThinLTO/20250420-090244
base:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git for-next
patch link:    https://lore.kernel.org/r/20250420010214.1963979-1-xur%40google.com
patch subject: [PATCH] kbuild: distributed build support for Clang ThinLTO
config: i386-buildonly-randconfig-002-20250420 (https://download.01.org/0day-ci/archive/20250420/202504201309.o2F1OHlm-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250420/202504201309.o2F1OHlm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504201309.o2F1OHlm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error loading index file 'lib/is_single_threaded.o.thinlto.bc': No such file or directory
--
>> Error loading index file 'lib/plist.o.thinlto.bc': No such file or directory
--
>> Error loading index file 'lib/iomem_copy.o.thinlto.bc': No such file or directory
--
>> Error loading index file 'lib/clz_tab.o.thinlto.bc': No such file or directory
--
>> Error loading index file 'lib/string.o.thinlto.bc': No such file or directory
--
>> Error loading index file 'lib/decompress_unlz4.o.thinlto.bc': No such file or directory
--
>> Error loading index file 'lib/decompress.o.thinlto.bc': No such file or directory
--
>> Error loading index file 'lib/decompress_unxz.o.thinlto.bc': No such file or directory
--
>> Error loading index file 'lib/kobject.o.thinlto.bc': No such file or directory
--
>> Error loading index file 'lib/maple_tree.o.thinlto.bc': No such file or directory
--
>> Error loading index file 'lib/fdt_empty_tree.o.thinlto.bc': No such file or directory
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
