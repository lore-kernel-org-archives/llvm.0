Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB21A3B2A0;
	Tue, 23 Jun 2026 17:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782235895; cv=none; b=f4mCk/pv4pJ3gEj6l0OWDRH8xcz4v2idLE+cebfaNbYZ1BuMc9Lo1orieHqG2WJTsuNENh8j2KQ1qsSkxCF0o9UzziAgG8OCUcttAyDuiHk+P8L+btJC6E+D/fkWbJvIkUwC+pmU4dcYqktUNPd5DlxbUVRsmhbXInwdeAuBoOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782235895; c=relaxed/simple;
	bh=50rZaIYt4nR5KuIabwutHUOc0tB5zl03LqW4obL6VaA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=NrUoI8x7+wb0uSmLxV6N9CFZJyNmpRdHl5auf1npSHFCP7sYhe6twX5Is3mm2dLFF3AzAYYg/wvbacM6lXIKdK3iLcerJh1qQhpWaYEQNo21B5VagTO30L15nuGfBQUmBSDIo5obT92ZctQn+hb3GIi7jq5P50PJdnx+pXzsijg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lgWtYmFv; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lgWtYmFv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782235894; x=1813771894;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=50rZaIYt4nR5KuIabwutHUOc0tB5zl03LqW4obL6VaA=;
  b=lgWtYmFvQ1NdT+TBszWaeXZZt02NPTqS4HoHuUENr33phBBx/J4Wf+Hk
   Yv7gVFoReGr5BvXUt1Bqcnr/PMqg0yMZpPYygG1BiZ4AbFN23p+APtnHy
   RAost/GXwwkiIOfkg+DbVpgPKbaOt9PCEedPwcK6wZjp+qcPIHyCxwQsG
   PUSacZmqCcJxzR9fHGpiXPEH/IgK02EY+6fI/maHJsoF+Hy9HO8w3DglJ
   EDzw4oUDxcQ81UhGtRzkYlvTnp2GApNLSa9dFH6xqgJg6AvndCFHVC12g
   mk9dwGG5wTXDWwUGqEDJniveVxYDJg5Ws6wmxVcPre4el0ejgny6FL1Wu
   Q==;
X-CSE-ConnectionGUID: 2AvuhdN0SvmnjObWta+IAg==
X-CSE-MsgGUID: nH/i3PuqRzySzKsNmnPaTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="82873142"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="82873142"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 10:31:34 -0700
X-CSE-ConnectionGUID: Y8yySiudQIym0N392oDMYw==
X-CSE-MsgGUID: PKzZwYaMRRyahcldtR2ULQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="249605184"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 23 Jun 2026 10:31:32 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wc4y9-000000002mT-3KTo;
	Tue, 23 Jun 2026 17:31:29 +0000
Date: Wed, 24 Jun 2026 01:30:45 +0800
From: kernel test robot <lkp@intel.com>
To: "Stefan =?utf-8?Q?D=C3=B6singer"?= <stefandoesinger@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [stefandoesinger-zx297520:dlink 37/120] ERROR: modpost:
 "rtl8192cu_fops" [drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.ko]
 undefined!
Message-ID: <202606240108.Pey63J0V-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://gitlab.com/stefandoesinger/zx297520-kernel dlink
head:   e837c4a4d860d6896e61ca44c5bac69b2500abcc
commit: df8834593648ab0294719594eecb9e2d2e2cb341 [37/120] Try to add the wifi card in the dlink device.
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260624/202606240108.Pey63J0V-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260624/202606240108.Pey63J0V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606240108.Pey63J0V-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "rtl8192cu_fops" [drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
