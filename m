Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49EBE15B2;
	Wed, 22 Nov 2023 01:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IWDpGbMV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700616332; x=1732152332;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=t8oT6RUsi73gqqA7YznCIrpliumT0ylzF6sXsPx7xLk=;
  b=IWDpGbMV8Aznxb5ray1RiHFReSyUrH8CvHmH/dMVJ+GHkUTOH5GjOaGE
   PuYApMyJzEc+iPwMmS8UnkAa+eRQQMxyPdKCP3qFdDG+uFQHhMdO5R8So
   wK+4pbJiJWVfJ4AevqJDogw9SGStV1JSquhApVI28HQols+EuVq7hbvyY
   JoyHFGcY74XfgSlGxOlSFjP3DN6/5k8wXpUl+yW9Ug4US2O9442dCMns9
   VWstMHaPGQo0ZZYESz99D0bPzB/TxjcefQnCK3UdiIatScrXRXiT45TK4
   KOIZBHzUbVIdI6bOZBajldQhRq19eXR+u/5dh90Ny3KmdbHgDyoRRHCCl
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="382354356"
X-IronPort-AV: E=Sophos;i="6.04,217,1695711600"; 
   d="scan'208";a="382354356"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 17:25:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="766827289"
X-IronPort-AV: E=Sophos;i="6.04,217,1695711600"; 
   d="scan'208";a="766827289"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 21 Nov 2023 17:25:27 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5bzH-0008UM-0y;
	Wed, 22 Nov 2023 01:25:24 +0000
Date: Wed, 22 Nov 2023 09:24:43 +0800
From: kernel test robot <lkp@intel.com>
To: Sanath S <Sanath.S@amd.com>, andreas.noever@gmail.com,
	michael.jamet@intel.com, mika.westerberg@linux.intel.com,
	YehezkelShB@gmail.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Sanath S <Sanath.S@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	stable@vger.kernel.org
Subject: Re: [Patch] thunderbolt: Add quirk to reset downstream port
Message-ID: <202311220931.2IqiKNXr-lkp@intel.com>
References: <20231121174701.3922587-1-Sanath.S@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231121174701.3922587-1-Sanath.S@amd.com>

Hi Sanath,

kernel test robot noticed the following build warnings:

[auto build test WARNING on westeri-thunderbolt/next]
[also build test WARNING on linus/master v6.7-rc2 next-20231121]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sanath-S/thunderbolt-Add-quirk-to-reset-downstream-port/20231122-014913
base:   https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git next
patch link:    https://lore.kernel.org/r/20231121174701.3922587-1-Sanath.S%40amd.com
patch subject: [Patch] thunderbolt: Add quirk to reset downstream port
config: x86_64-buildonly-randconfig-003-20231122 (https://download.01.org/0day-ci/archive/20231122/202311220931.2IqiKNXr-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231122/202311220931.2IqiKNXr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311220931.2IqiKNXr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/thunderbolt/switch.c:1556:2: warning: variable 'ret' is used uninitialized whenever 'for' loop exits because its condition is false [-Wsometimes-uninitialized]
           tb_switch_for_each_port(sw, port) {
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/thunderbolt/tb.h:821:7: note: expanded from macro 'tb_switch_for_each_port'
                (p) <= &(sw)->ports[(sw)->config.max_port_number]; (p)++)
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/thunderbolt/switch.c:1564:9: note: uninitialized use occurs here
           return ret;
                  ^~~
   drivers/thunderbolt/switch.c:1556:2: note: remove the condition if it is always true
           tb_switch_for_each_port(sw, port) {
           ^
   drivers/thunderbolt/tb.h:821:7: note: expanded from macro 'tb_switch_for_each_port'
                (p) <= &(sw)->ports[(sw)->config.max_port_number]; (p)++)
                ^
   drivers/thunderbolt/switch.c:1554:9: note: initialize the variable 'ret' to silence this warning
           int ret;
                  ^
                   = 0
   1 warning generated.


vim +1556 drivers/thunderbolt/switch.c

  1549	
  1550	static int tb_switch_reset_downstream_port(struct tb_switch *sw)
  1551	{
  1552		struct tb_port *port;
  1553		uint32_t val = 0;
  1554		int ret;
  1555	
> 1556		tb_switch_for_each_port(sw, port) {
  1557			if (port->config.type == TB_TYPE_PORT) {
  1558				val = val | PORT_CS_19_DPR;
  1559				ret = tb_port_write(port, &val, TB_CFG_PORT,
  1560						port->cap_usb4 + PORT_CS_19, 1);
  1561				break;
  1562			}
  1563		}
  1564		return ret;
  1565	}
  1566	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
