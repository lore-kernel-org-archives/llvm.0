Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3448029415;
	Thu,  9 May 2024 18:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715278581; cv=none; b=lClR9h/B5d6oq+QpnQu+5hCaeDGizWIG1fkxEqNgL+XBUb71CAUi1CaWnIOPawUvW5Cl8cm0++oDF8Few3xhnPOuvwS8lrwfnqWt/P9fxM1A4S//MNXCmh9S/RmNbw5YHP+WgOCsemmF/TTuBgF7W2TaEDoKcNrAie4wfDw9Lv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715278581; c=relaxed/simple;
	bh=L4gQYCBzpEUWB7FcwPzOUwmcJBWB3+fhGJNbP5Z/V/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LqU26O2Zq5OMxcTDuwYUIE4dYHc7lmjNOp3kOGwfYkFeOJDCIvmDdmtA/2Z0m82pd8Xet85fAiH8DLrG/EWDLfx2fUy6fNC3Y1Sn7VqZTU4FIo1LHOvXhRyMNIpXTPxOMcEvlEw4YWygTvTbvo8kSdn/iOIIqUpS/7X9UTOdkI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j+iC3yhS; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j+iC3yhS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715278580; x=1746814580;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=L4gQYCBzpEUWB7FcwPzOUwmcJBWB3+fhGJNbP5Z/V/c=;
  b=j+iC3yhS042ltkj0L0vCBYkmIVwLEyVxksVy8MdoGNo1O3aAshzVx1Gw
   qwAugpd9QtRBl7nShl4sd1X6nkQm/IHpTJuSpSMbdoKBDkVVWG2X35+/h
   G87ZhH9dDXv27VCNZg9L7eWt29Mor2FABTdla2oKJf527lgeQnsedvD4Z
   KfaeWTw9RKEw4NgfgNiXxSZLbtsH2TXISK5lNbQTLjh7qu1ZiA3eoprW8
   stJXpSeqbCi8oxDHW7j5TMSzm7B5I3QWDTKJ/uU/ntaZrma+2BhGR9tlf
   yHX5AqUDTbmtgxzIdbC7glbMNCp51UZZNYiCyPKpxTBDT3QOeFRO9Z08h
   w==;
X-CSE-ConnectionGUID: //BwoXqVRMOeIjFfrs3h3Q==
X-CSE-MsgGUID: 9hBkPPG9QOCjUSG2DBr3Pw==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="22618578"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="22618578"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 11:16:19 -0700
X-CSE-ConnectionGUID: h84P3MQ6SseUrDHM1dVPnQ==
X-CSE-MsgGUID: 2RgPIptIRHSric0f1QFJtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="60186190"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 09 May 2024 11:16:18 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s58JT-0005DF-1d;
	Thu, 09 May 2024 18:16:15 +0000
Date: Fri, 10 May 2024 02:15:55 +0800
From: kernel test robot <lkp@intel.com>
To: "Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/3] ACPI: extlog: Trace PCI Express Error Section
Message-ID: <202405100132.aORjn9Dh-lkp@intel.com>
References: <20240507190724.323269-3-fabio.m.de.francesco@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240507190724.323269-3-fabio.m.de.francesco@linux.intel.com>

Hi Fabio,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on rafael-pm/linux-next]
[also build test ERROR on rafael-pm/bleeding-edge linus/master v6.9-rc7 next-20240508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Fabio-M-De-Francesco/ACPI-extlog-Trace-CPER-Non-standard-Section-Body/20240508-031035
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20240507190724.323269-3-fabio.m.de.francesco%40linux.intel.com
patch subject: [RFC PATCH 2/3] ACPI: extlog: Trace PCI Express Error Section
config: x86_64-randconfig-015-20240508 (https://download.01.org/0day-ci/archive/20240510/202405100132.aORjn9Dh-lkp@intel.com/config)
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240510/202405100132.aORjn9Dh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405100132.aORjn9Dh-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: cper_severity_to_aer
   >>> referenced by acpi_extlog.c:213 (drivers/acpi/acpi_extlog.c:213)
   >>>               vmlinux.o:(extlog_print)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
