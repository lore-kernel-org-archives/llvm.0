Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA32BA33;
	Tue, 27 May 2025 01:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748308329; cv=none; b=dRbzMxWhHz1F6O06ZFow1kj9sKZe3gqWSNwY+Cra1z10Qd/EkJ5OFfwoJWc8E0AXyf07tlmQBVeC3nHdlJPVe5nrChg2BZF8RQgixk0oSc3r0biluZX+34/wf79SGqd/ONfj2a0JvkQZAEo9XK2A41T5obFk1tGyFOU1tUnwgPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748308329; c=relaxed/simple;
	bh=y9GvpIRBn7kmBz25CTFgEA3AEIlgz7nYnr+CJJJWYZY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NHPIOsGAUAxM4Qg/KtsaAzIek+yKc1vqUyk3aFToTENxHUF3XCYqlB6SfKn+7kEemOgbycjvCUjH3cQYKJv7x4A6vVUq2Ye/EvXbTKrzq4jf98Net2MxHoG4RJ0ayxZmJHQYms5A14Een9e3KeX8MLeMVTxwwaAg2ZdrS8LAauY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mJEj1MLo; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mJEj1MLo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748308328; x=1779844328;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y9GvpIRBn7kmBz25CTFgEA3AEIlgz7nYnr+CJJJWYZY=;
  b=mJEj1MLobUe+dTtgf1VNEocvZZlyVinr9NULjgOIcXNAm7bVWLHgHFU0
   FIE4Njeoohz4jmn/S1TBrGJJD3mvByHRhWjOGM053U6fcT0i5MZJMImri
   etzCT9qo4nBvic1/ZDvaiW+h8sAJPVwDNOuWzlsleqjCwBK/uWUsrAuiR
   PbbuBovaP9WMU9mzzuAnsDEFTdRri/ncrDWLAQPYLSfdux2H/9zp20CDB
   VzZvLxE+Ou48oL5um1FeP1xG2FemaEsfontkEFAVr7nkjmwWKomvH3BSa
   CwS9SBI+LQL2SvwRCgOHMtemoqFqb6lGN7YILh8BTjW21lkmebMHs94hB
   Q==;
X-CSE-ConnectionGUID: LOllKE73SE2jBBhsJtKY6g==
X-CSE-MsgGUID: KPThFHEoQVybeKi/nhszkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="50441032"
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="50441032"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 18:12:06 -0700
X-CSE-ConnectionGUID: vV/vUU52RJ6pZvx7trGeuw==
X-CSE-MsgGUID: rqd1VMf7S0u0g4KBh/ELnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="143026311"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 26 May 2025 18:12:04 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJirK-000Smg-1n;
	Tue, 27 May 2025 01:12:02 +0000
Date: Tue, 27 May 2025 09:11:52 +0800
From: kernel test robot <lkp@intel.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_sbi_mpxy_mailbox_v4 31/34] ERROR: modpost:
 "imsic_acpi_get_fwnode" [drivers/mailbox/riscv-sbi-mpxy-mbox.ko] undefined!
Message-ID: <202505270926.WHRRht1e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_sbi_mpxy_mailbox_v4
head:   a96afd809e1e11e31357e8936c5ba98e4b18f402
commit: fe469c80e363d4ba72ebe2689227b6fc00895cf3 [31/34] mailbox/riscv-sbi-mpxy: Add ACPI support
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20250527/202505270926.WHRRht1e-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250527/202505270926.WHRRht1e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505270926.WHRRht1e-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "imsic_acpi_get_fwnode" [drivers/mailbox/riscv-sbi-mpxy-mbox.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
