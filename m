Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10C816631C;
	Sun, 29 Sep 2024 13:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727616873; cv=none; b=juvVV82ifAFw7UYRyEZM06cc+Gsq9GLtTi/lc8UHRE1YAuylIKCORGJPI7tFYHUA9hAD34hPmkKSTS/oILwHejWEyEtcT6QblQmz8rxEkyF/yaS7KzWySqiAw2SGOWDZPF07unbxAz1biM3L/C4GqOkxMLmsB3FSj25HN/saFHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727616873; c=relaxed/simple;
	bh=l9QW8lJj1kUiGFBw9aOQOTDUQoXKNPtn7vNrLDLmze8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WqFl5EJ5T0+iwqtbSjeGR383s6kOWpFralE+QnipB6whZZH6E2YAUe0nM/PdXLXCj4HvuXIXVib6oxHF6dngvKCWP2PX59kgj48HG3z9d0xe8TRGr2WGHTh23DbE2b2fanY3FOciCvt5VzqYEjiFj4qqnf2gEl7MP6JQTRh3gXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IgoCq+89; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IgoCq+89"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727616872; x=1759152872;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l9QW8lJj1kUiGFBw9aOQOTDUQoXKNPtn7vNrLDLmze8=;
  b=IgoCq+89i+wkfnDk4ggWcFBHuBR0Q04v+SugVCTX9Rt3bjHcgKyIMYaq
   XMyyzE73Wzu9ZXm7goZOgawNYM5E5wHdxwGtsfgomij/R0tz3T6lWPRJc
   oaZvYLdI5FiDKx8JtbTw4kr+yt9nJdOYLse55kBM3ZdV7EH8+YIW0Vhtr
   rF/Li3DZdK2JmMHoetJQEUYjiksRRfE+Z4hbPZWKYAaJ2LYor2iZx/+Uo
   pP0NWk57H+hTuKqsToS7ZgUQnA0Vj2Y2jUwy4fDxYKog0TBuCiNt8uGRB
   kiz7HTCcAHzF9wG9o1GxLwYXI3BalH+F+y+stthSCMfcnLNpD+OaeZXW8
   g==;
X-CSE-ConnectionGUID: +DLzpej+SyW2tlCeKjWerQ==
X-CSE-MsgGUID: +FZl3gCJQFmK71Yas//UqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="26885623"
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="26885623"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 06:34:31 -0700
X-CSE-ConnectionGUID: I+VaVAU2TpC6isEbJ2tRzQ==
X-CSE-MsgGUID: t65heNWGS3KpR2jivkFGCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="73178803"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 29 Sep 2024 06:34:30 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suu4B-000OJT-3C;
	Sun, 29 Sep 2024 13:34:27 +0000
Date: Sun, 29 Sep 2024 21:34:17 +0800
From: kernel test robot <lkp@intel.com>
To: Nuno Sa <nuno.sa@analog.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Nuno Sa <noname.nuno@gmail.com>
Subject: [nsa:b4/dev-adp5589-fw-conversion 5/14]
 drivers/input/keyboard/adp5589-keys.c:639:9: warning: implicit conversion
 from 'unsigned long' to 'int' changes value from 18446744073709551615 to -1
Message-ID: <202409292156.0rcdXulr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/nunojsa/linux b4/dev-adp5589-fw-conversion
head:   d8f775093f32be0f662a6093041d941d372d4830
commit: 6a5d4ac02d5c62d620ab4bc46c1cebf0cfe64436 [5/14] Input: adp5589-keys: support gpi key events as 'gpio keys'
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20240929/202409292156.0rcdXulr-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240929/202409292156.0rcdXulr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409292156.0rcdXulr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/input/keyboard/adp5589-keys.c:639:9: warning: implicit conversion from 'unsigned long' to 'int' changes value from 18446744073709551615 to -1 [-Wconstant-conversion]
     639 |         return INVALID_HWIRQ;
         |         ~~~~~~ ^~~~~~~~~~~~~
   include/linux/irq.h:1300:24: note: expanded from macro 'INVALID_HWIRQ'
    1300 | #define INVALID_HWIRQ   (~0UL)
         |                          ^~~~
   1 warning generated.


vim +639 drivers/input/keyboard/adp5589-keys.c

   626	
   627	static int adp5589_gpiomap_get_hwirq(struct device *dev, const u8 *map,
   628					     unsigned int gpio, unsigned int ngpios)
   629	{
   630		unsigned int hwirq;
   631	
   632		for (hwirq = 0; hwirq < ngpios; hwirq++)
   633			if (map[hwirq] == gpio)
   634				return hwirq;
   635	
   636		/* should never happen */
   637		dev_warn_ratelimited(dev, "could not find the hwirq for gpio(%u)\n", gpio);
   638	
 > 639		return INVALID_HWIRQ;
   640	}
   641	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
