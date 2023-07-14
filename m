Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3651453AF;
	Fri, 14 Jul 2023 21:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689369948; x=1720905948;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FBim1Jqhx7Bm961IiDiXRuR53DvmgiQ9kaQDTyyInTc=;
  b=R7jh7QKEzKfoNWM+SJc06CJWeEJTvotn+F3e3eLSuG8YwQ/Knfxecj+X
   J1rffF2brcM4E+pdbChyIVUOAtyzM8OKhsM6DVT5Zm7JR+u/OYUNS93vf
   gUsD2nJkqUXvsPiO87bQrablv0lyrqlyIoRn9h6+Tr2Ysaz9o9QErABB1
   HIic87cZUIvUD8PL2Rt9KVgoOI8M7Mo03SnZwqcFqL8OtoTDqAbM7dFr/
   DxR+NVsktoevOHz0kGjq9JrK7xbM75ft2hk9Ij+mactGmj03XSzefCSDj
   ywqUpiEescGsNdnmFO1Xtd7RnweVPkF4bKzHyFskoeJPu2OmUOCl97jEL
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="431757632"
X-IronPort-AV: E=Sophos;i="6.01,206,1684825200"; 
   d="scan'208";a="431757632"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2023 14:25:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="722545785"
X-IronPort-AV: E=Sophos;i="6.01,206,1684825200"; 
   d="scan'208";a="722545785"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 14 Jul 2023 14:25:44 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKQIJ-0007i1-1z;
	Fri, 14 Jul 2023 21:25:43 +0000
Date: Sat, 15 Jul 2023 05:24:48 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Wilczynski <michal.wilczynski@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-acpi@vger.kernel.org, devel@acpica.org,
	linux-pm@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [rafael-pm:bleeding-edge 22/40] drivers/acpi/internal.h:161:6:
 warning: no previous prototype for function
 'acpi_early_processor_control_setup'
Message-ID: <202307150527.HDJ9XJMo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git bleeding-edge
head:   4f9dd7927c1cdbaffb20fcdbcc2bdc6caa0b4736
commit: ca805e0f04a5f9a773875ad6de914e54e41d43c7 [22/40] ACPI: processor: Use _OSC to convey OSPM processor support information
config: arm64-randconfig-r021-20230714 (https://download.01.org/0day-ci/archive/20230715/202307150527.HDJ9XJMo-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230715/202307150527.HDJ9XJMo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307150527.HDJ9XJMo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/acpi/acpi_processor.c:27:
>> drivers/acpi/internal.h:161:6: warning: no previous prototype for function 'acpi_early_processor_control_setup' [-Wmissing-prototypes]
     161 | void acpi_early_processor_control_setup(void) {}
         |      ^
   drivers/acpi/internal.h:161:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     161 | void acpi_early_processor_control_setup(void) {}
         | ^
         | static 
   1 warning generated.
--
   In file included from drivers/acpi/dptf/int340x_thermal.c:12:
>> drivers/acpi/dptf/../internal.h:161:6: warning: no previous prototype for function 'acpi_early_processor_control_setup' [-Wmissing-prototypes]
     161 | void acpi_early_processor_control_setup(void) {}
         |      ^
   drivers/acpi/dptf/../internal.h:161:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     161 | void acpi_early_processor_control_setup(void) {}
         | ^
         | static 
   1 warning generated.


vim +/acpi_early_processor_control_setup +161 drivers/acpi/internal.h

   157	
   158	void acpi_proc_quirk_mwait_check(void);
   159	bool processor_physically_present(acpi_handle handle);
   160	#else
 > 161	void acpi_early_processor_control_setup(void) {}
   162	#endif
   163	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
