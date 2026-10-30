Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793397667;
	b=vx2D/tWTN+7ph/aQ6EdANqCbMUr6cumqrF6PfnGQHMw7TpgBSt8V9XAxsgjqP9fLmFUC
	 irWic5bxTDQp6p6eGBpulLS+ji6ZWLZZdLS4TGzV5bYM+D0DmvzOAvMFR/JQ9t7ZWbSpS
	 zYn9Sm2WCPhFJCT9S4KBemLwVuBENWawaP8+9kep4lQdZZJPVErisEYAa6muCrIWyz3Ob
	 4nyaY5Y9wZV0C8I7/AOjxXItJgBdyoo0hBHQ30pPRwT+EWBfzmuDwXs1lyhYtkTNWBHAE
	 H0V7GTxD1MquiqFNVdHWA4ZmViQteDmwowfV3RX7oi1GFFgGPDqqyh0LXxa3soCCIsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793397667;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=eC5A6pHAnZ0aE2KsQp0iN/0xlnhAOejQmwk5XYY9Wwg=;
	b=PIoiNlYUKTH34zxJu5/aw1sSQ7REtqlYP2l25tIF5N6hl3LzZ8vxJ7CM7BptBp5wpRyo
	 VlAlzosdjIIJ1d+NpxMsv/DVbCrhtK2+NK7XGP22vU3f0CVOK1MAGj6VikDzfclyXLCdl
	 OTqxJJHTVNu5BdF5fqZksdpDIkZyfPQmSXvBjtEe7EzRY0ecUEQDxOc2zCW1Xl4TstfiJ
	 TEkBHIhucaEGc6u9sEmJTA3VyHwL+aByOf+CwVqu9pYtGiRJa8vxv9LoIrE4eGQBx0NRj
	 wETFr9VZA4haHIANW6PSuAEs1vnUvFEHe4S7NSGEgJSHMgeeg71NpvjM3DcECsGCg+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DV0d0HjL;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C851B606A31F;
	Fri, 30 Oct 2026 22:01:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C851B606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DV0d0HjL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793397667; x=1824933667;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=w31wXGRTOhUvzCl07DAy2h+Ynmh/ZR5jn1N9SMn3Isg=;
  b=DV0d0HjLTtU4VGcEXHQgrC/kyHM4p77W0c+dqKjPwdg0DYery+6yaJyc
   pxndYhSILCbjaGL04vNup9NUSfPMX9/0kMiJQ+ewYFNgCM3H7xvcyOq7u
   m/OZz1nmYF0KfADOFP/1M/vrMmMIxbG/oP+eRJXKxIF6QL3hQZGKhUHLB
   VumbuJNhKw6xdjJcnpD/2rYFKHL5iujC6turfsqzTcwZD6KtU6ptV1kNq
   utLFYswusSSb4vdYYuycO91a+qsdf9OutgchfYJJz+Op5EPS1BKIHcGXw
   osbRwoZ3Pc/UFU04WJd9ooUKfqGiw6xtQjuZaAnilYACQpG2SPxk0slti
   Q==;
X-CSE-ConnectionGUID: TahJkAmkTJm+QR1C7tW1Ig==
X-CSE-MsgGUID: te1zm9cySKSHFyTwv63G6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2203063"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2203063"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 15:01:07 -0700
X-CSE-ConnectionGUID: OXSaNlHyS1arWzlEY+TGQA==
X-CSE-MsgGUID: kW0MS3YuSjaBb215Zgq1vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5426391"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 30 Oct 2026 15:01:04 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMuek-00000000cHM-1Mbk;
	Fri, 30 Oct 2026 22:01:02 +0000
Date: Sat, 31 Oct 2026 06:00:37 +0800
From: kernel test robot <lkp@intel.com>
To: Saranya Gopal <saranya.gopal@intel.com>, linux-acpi@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	rafael.j.wysocki@intel.com
Subject: Re: [PATCH] ACPI: s2idle: Handle shared _Ixx GPEs without an EC
Message-ID: <202610310520.ZvkDiItr-lkp@intel.com>
References: <20261030030515.3127310-1-saranya.gopal@intel.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261030030515.3127310-1-saranya.gopal@intel.com>

Hi Saranya,

kernel test robot noticed the following build errors:

[auto build test ERROR on rafael-pm/linux-next]
[also build test ERROR on rafael-pm/bleeding-edge amd-pstate/linux-next amd-pstate/bleeding-edge linus/master next-20261029]
[cannot apply to v7.3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Saranya-Gopal/ACPI-s2idle-Handle-shared-_Ixx-GPEs-without-an-EC/20261030-083515
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20261030030515.3127310-1-saranya.gopal%40intel.com
patch subject: [PATCH] ACPI: s2idle: Handle shared _Ixx GPEs without an EC
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20261031/202610310520.ZvkDiItr-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261031/202610310520.ZvkDiItr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610310520.ZvkDiItr-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/acpi/tables.c:26:
>> drivers/acpi/internal.h:262:10: error: use of undeclared identifier 'ENOTSUP'
     262 |         return -ENOTSUP;
         |                 ^
   1 error generated.


vim +/ENOTSUP +262 drivers/acpi/internal.h

   258	
   259	static inline void acpi_ec_flush_work(void) {}
   260	static inline int acpi_ec_dispatch_gpe(void)
   261	{
 > 262		return -ENOTSUP;
   263	}
   264	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
