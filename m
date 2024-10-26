Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0694E18B484;
	Sat, 26 Oct 2024 08:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729933139; cv=none; b=Zo/L3zGMXSaQl2Llx32BtkBQ2DXy7jUqTCtzLg73G1Ycxk3ueb1mOToFYZKnDYk0K/oDJKBzlCbJZdq70Kj5f9hByIwPLHhq8HCzqQXyhMHQK8YqwCLkrLHQWHkWfEWmQhDT+gsHCs9AIEB1cUICkYXK6g20oqQz8Tjey2G9Qhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729933139; c=relaxed/simple;
	bh=J+ELgtFmzSshLRV2f9HM0tnB/bx/8I6tiy7m+oqGKfc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qqoWDNkcUoa6OeKzWRuq9HNYQzQXGlWb08TJ9Th9xEX0pegaSvjzK1FLRDMccDw2mBadNFDoPYK8XHu0wxFRkcrB2FRvFuGNGq/8JUf7TPcmsQX17HGTPj4oYYkeG+WnwIriyAclADt4VtocLSLdayZDRV2xQwXk7AIz8W5Zgus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G2PAcNQv; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G2PAcNQv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729933137; x=1761469137;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J+ELgtFmzSshLRV2f9HM0tnB/bx/8I6tiy7m+oqGKfc=;
  b=G2PAcNQvGkRnUwPhpMhZ7ky4cFIJUeMSAJP5Ux/WZu31pMyHPhnHKuU6
   I93xZ1MYy+TEHqKmp/M9QY+xaXlQuJ2qJ+S2H/1A6X006oPFEwaT+y6gr
   Oc5K/dBjJomdrNTIHMP3YMNa3lMXPd/o0M03FoAVyP5TJi0flhg5tUoGR
   zuPSWcpdGknOswv/G5R29UmWu98GDj4wfz+0qI507IrH1wF4rKUzzzfJz
   aSKojBKgY1KQXNY6U0UUbEQbYR5znsI7HQymuJNdapFK0yGvOCShyBl8/
   2marJK15qoJ4/DqT6MoTc7Wfka+f2Ky7hl3uoREpd/j5HfeeMNCpAeV/r
   A==;
X-CSE-ConnectionGUID: +tcEEhMlTEm5Js3WDUEzVw==
X-CSE-MsgGUID: KPOrz20bS+GEbVDGiS1ZDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29788353"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29788353"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 01:58:57 -0700
X-CSE-ConnectionGUID: eZgeNzm5SUKJCnzFYA0sdQ==
X-CSE-MsgGUID: sFu8TJmdRgWXHmvQdOyp7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,234,1725346800"; 
   d="scan'208";a="81295909"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 26 Oct 2024 01:58:54 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4cdI-000ZS4-0d;
	Sat, 26 Oct 2024 08:58:52 +0000
Date: Sat, 26 Oct 2024 16:58:45 +0800
From: kernel test robot <lkp@intel.com>
To: Wende Tan <twd2.me@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: ld.lld: error: Function Import: link error: linking module flags
 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1376452)'
 and 'vmlinux.a(trace.o at 1385932)'
Message-ID: <202410261627.2m4hohFx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   850925a8133c73c4a2453c360b2c3beb3bab67c9
commit: 021d23428bdbae032294e8f4a29cb53cb50ae71c RISC-V: build: Allow LTO to be selected
date:   9 months ago
config: riscv-randconfig-002-20241026 (https://download.01.org/0day-ci/archive/20241026/202410261627.2m4hohFx-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 5886454669c3c9026f7f27eab13509dd0241f2d6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241026/202410261627.2m4hohFx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410261627.2m4hohFx-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1376452)' and 'vmlinux.a(trace.o at 1385932)'
>> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1376452)' and 'vmlinux.a(mballoc.o at 1403092)'
>> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1376452)' and 'vmlinux.a(skbuff.o at 1611352)'
>> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1376452)' and 'vmlinux.a(tcp.o at 1616452)'
>> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1376452)' and 'vmlinux.a(ipr.o at 1522612)'
>> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1376452)' and 'vmlinux.a(raid5.o at 1566652)'
>> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1376452)' and 'vmlinux.a(filter.o at 1612432)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1376452)' and 'vmlinux.a(io_uring.o at 1460452)'
>> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1376452)' and 'vmlinux.a(segment.o at 1441492)'
>> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1376452)' and 'vmlinux.a(super.o at 1441132)'
>> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1376452)' and 'vmlinux.a(advansys.o at 1519012)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1376452)' and 'vmlinux.a(super.o at 1435732)'
>> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1376452)' and 'vmlinux.a(md.o at 1567792)'
>> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1376452)' and 'vmlinux.a(file.o at 1440892)'
>> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1376452)' and 'vmlinux.a(e1000_main.o at 1530892)'
>> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1376452)' and 'vmlinux.a(inode.o at 1436332)'
>> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1376452)' and 'vmlinux.a(mpt3sas_base.o at 1521592)'
>> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1376452)' and 'vmlinux.a(volumes.o at 1436872)'
>> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1376452)' and 'vmlinux.a(slub.o at 1390792)'
>> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1376452)' and 'vmlinux.a(data.o at 1441372)'
   ld.lld: error: too many errors emitted, stopping now (use --error-limit=0 to see all errors)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
