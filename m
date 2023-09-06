Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B433125A4;
	Wed,  6 Sep 2023 22:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694038449; x=1725574449;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=foDuTahEzXPVoihmRP2VP39CyZ4Klb0IgnHAZEgS2PI=;
  b=kmj8gIjxzkzDm4jdGaw6L6G9jeQgepp5n40TlEVhpbCidOJLMscFStsJ
   Wi6nHBT2ivGKsyFyqhtA5SeDdQ5g0Mw4WzQXJPXPrce0OwXBhWIHQnpsi
   8+8vQFpR5WBrHugv5doZwdkAaw2Nu8Ge9ZJvMJlomi6aX+tLcA0NTxA+Y
   tKZZPkRzmV7Dbyy2cGy0X8V0nD8KNsLo1US47jNBELK+K12k5SwJL954P
   TN4y4+FMljjiUJMPJCDrrmR5xYZLno5hWoaigjItd95Vdu+hPOWez8YjR
   b48cqHXxENknnVEXxIibgj9J34jbfTmB8h+fEYgpiDWJ1Hz8A+FAsw/FW
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="362231075"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; 
   d="scan'208";a="362231075"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 15:14:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="988481269"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; 
   d="scan'208";a="988481269"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 06 Sep 2023 15:14:06 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qe0mi-0000dS-1H;
	Wed, 06 Sep 2023 22:14:04 +0000
Date: Thu, 7 Sep 2023 06:13:50 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kris Van Hees <kris.van.hees@oracle.com>,
	Tomas Jedlicka <tomas.jedlicka@oracle.com>,
	Victor Erminpour <victor.erminpour@oracle.com>
Subject: [oracle-dtrace:v2/6.5 12/13] ld.lld: error: no input files
Message-ID: <202309070648.I5OqZ3UX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/oracle/dtrace-linux-kernel v2/6.5
head:   1120d1c598d4ae2d08278969b9001a866aa8273a
commit: 8eb9c2162bfbe04cdd23185854d8d298497b35e8 [12/13] ctf: generate CTF information for the kernel
config: hexagon-randconfig-001-20230906 (https://download.01.org/0day-ci/archive/20230907/202309070648.I5OqZ3UX-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230907/202309070648.I5OqZ3UX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309070648.I5OqZ3UX-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld.lld: set maximum concurrency to 16, specify --threads= to change
>> ld.lld: error: no input files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
