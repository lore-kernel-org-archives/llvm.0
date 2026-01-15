Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E9317B505;
	Thu, 15 Jan 2026 10:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768473962; cv=none; b=X3kWtDIlzVg4CEOX0Bvx91U+7QO4cQzhaolLMMBvQqCIqlRufZyntfKZmYg/e9z3JYWR6lJbIHIhNvTmJKgS8EtFQPjogknBYzxhP+d/WGbaQJu1Q4zWBVrZ0CRuN0TVHYVDr969Puje1XrAUOqfSJrq86KBoc50eSoPONwynsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768473962; c=relaxed/simple;
	bh=tRXyI7pnEXKZ3if45n1yvRYI50Ey2GlVTBzohEtnCyg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PHshYBuSGdWsibB/Ep8eK5yUwxwvxVarSymoLWUboQFfujV7VVjrNAD6GcpPgoLccqkfGRzDpn0KubH+4TsCSYPsw3+gXZDgfvDAX5XevvHNJ7+IurTBDRQ/ZafKM7n0Ji72MIhYrBtfsjBCG63EWZjPhMNWPHrY4wpz7oZ4ITQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PdTYuS6I; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PdTYuS6I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768473961; x=1800009961;
  h=date:from:to:cc:subject:message-id;
  bh=tRXyI7pnEXKZ3if45n1yvRYI50Ey2GlVTBzohEtnCyg=;
  b=PdTYuS6IZEQeYrOa1k1K89SO7v6+ZYwR9iPiEFTVxOXUDHIUU+oBd5Nb
   UAJ4JFRYqC8tWiQnU/kKH00eM1k4ekzSDgk/0+Hbwsuf0O9H6PI1IEpym
   BMO/DSpp4NDT//NLHwiwo72YpwDJ4LXgl+m2ToJlUAKPDi+zl4pcq50ou
   p0jiPDMtFGWnLnfx8+W1ZaXWyZU04ep0HXRW8DR5xUfT+6toKIOXvCnq6
   BJ1z4GrR4Q7BMVj/H/RIWojvy59Q+ZoLGpUpHnv2JX7hnmImbqc/7Ryoa
   W+8v30X8oCUDGywc2amkrmZrE2Wknhr4JTCGT7e4dHqV2BZspdezZROdc
   g==;
X-CSE-ConnectionGUID: rz0DXTxZQLmJxf7bnJdX8w==
X-CSE-MsgGUID: iV3NvUriRUK5lIAax8AX2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="80499587"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="80499587"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 02:46:00 -0800
X-CSE-ConnectionGUID: h9scHwPHT2CzDh9hNrRJNA==
X-CSE-MsgGUID: fgCY4IG0TBSrHeJ6Y/Qh5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="204956908"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 15 Jan 2026 02:45:58 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgKrU-00000000HrM-0QZP;
	Thu, 15 Jan 2026 10:45:56 +0000
Date: Thu, 15 Jan 2026 18:45:08 +0800
From: kernel test robot <lkp@intel.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Mark Brown <broonie@kernel.org>,
 "Pierre-Louis Bossart" <pierre-louis.bossart@linux.dev>
Subject: [linux-next:master 6348/6771]
 sound/soc/sdca/sdca_interrupts.c:212:34: error: no member named 'completion'
 in 'struct dev_pm_info'
Message-ID: <202601151803.XY7KryHC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9b7977f9e39b7768c70c2aa497f04e7569fd3e00
commit: ffd7e8a101110cba86925a2906d925e0db7102f3 [6348/6771] ASoC: SDCA: Device boot into the system suspend process
config: i386-randconfig-004-20260115 (https://download.01.org/0day-ci/archive/20260115/202601151803.XY7KryHC-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260115/202601151803.XY7KryHC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601151803.XY7KryHC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/sdca/sdca_interrupts.c:212:34: error: no member named 'completion' in 'struct dev_pm_info'
     212 |         if (completion_done(&dev->power.completion)) {
         |                              ~~~~~~~~~~ ^
   sound/soc/sdca/sdca_interrupts.c:226:34: error: no member named 'completion' in 'struct dev_pm_info'
     226 |         if (completion_done(&dev->power.completion))
         |                              ~~~~~~~~~~ ^
   2 errors generated.


vim +212 sound/soc/sdca/sdca_interrupts.c

   200	
   201	static irqreturn_t fdl_owner_handler(int irq, void *data)
   202	{
   203		struct sdca_interrupt *interrupt = data;
   204		struct device *dev = interrupt->dev;
   205		irqreturn_t irqret = IRQ_NONE;
   206		int ret;
   207	
   208		/*
   209		 * FDL has to run from the system resume handler, at which point
   210		 * we can't wait for the pm runtime.
   211		 */
 > 212		if (completion_done(&dev->power.completion)) {
   213			ret = pm_runtime_get_sync(dev);
   214			if (ret < 0) {
   215				dev_err(dev, "failed to resume for fdl: %d\n", ret);
   216				goto error;
   217			}
   218		}
   219	
   220		ret = sdca_fdl_process(interrupt);
   221		if (ret)
   222			goto error;
   223	
   224		irqret = IRQ_HANDLED;
   225	error:
   226		if (completion_done(&dev->power.completion))
   227			pm_runtime_put(dev);
   228		return irqret;
   229	}
   230	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
