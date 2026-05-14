Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813AE40757E;
	Thu, 14 May 2026 14:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778769182; cv=none; b=FgJugs8M0bdA9GYPboVjI8nM5Nl0Ra+d+3Q3bMlkS+06AuPEY6C4w2j/8EmyrKbWpiifhCV1wO0u/VzsesRmAonypIx42dHm/Bj93qFSAHLnTa2QMmIq6hkPz1hphIVYz4QUcPWL3GFVUhuWZ8Zmg6HGqBdbnGHKPsheADq3wUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778769182; c=relaxed/simple;
	bh=Tst1Ig3SEEctySjsTsBZnns8rg96uqGH/zsYg6n55/4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jPIly7WcNYiN4kvFiJ5tLe3RGaCrJnRmN8O5h+tEeCUmTtYiYy11nDlVKrqBiDZbDkmOsH73pc+92Z08gQ+v68Kg1gJvSI/cN5xVBMPi8f4Dij6+HHvxosPa8Gxh04IUOV1CEhaH9waiDRvUqR5gawsKtT5UHXOwr7tp2hJ6upI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Siots8Qb; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Siots8Qb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778769181; x=1810305181;
  h=date:from:to:cc:subject:message-id;
  bh=Tst1Ig3SEEctySjsTsBZnns8rg96uqGH/zsYg6n55/4=;
  b=Siots8QbtxiAwKK9haFAkFCoyzFmjoEeO/h0fdpE+YoYDP7/GW7PJsV3
   KoCZrRuil+XwtjhPBhohh2ECXWLwELD071VffQgGmaoRGKhhZgldzA6r1
   cseuIJ7gYKLLPz3ZQYI4l4JfoBu+15UXNXwwGeIZZ0Y4iz6WmF5D/hwpn
   WRQqPmRIR1vxJ5lnTmPhZfERHbMo924d0tiESF/0PErw0Eq+YQ5TKVuo6
   61+Yc+aNhOhyYRWhqz28ryr4lTOcUOXIz4wA9S/DBmFBeQSU1s08wtfTF
   kZppGYETZlk7/UcuFJGLU2W1jPtqUDywnprxhxUJP+5XKFQ7Pvo68D0S5
   w==;
X-CSE-ConnectionGUID: ybNeEXwySGWxaleBU56TmA==
X-CSE-MsgGUID: 1tvjocPcQPeV9Q8rETGqHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="79667057"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="79667057"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 07:33:00 -0700
X-CSE-ConnectionGUID: p8dcm+/sQ06WWJmZQCVe7Q==
X-CSE-MsgGUID: dePJKePVTmGedzoiDhMH9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="235756991"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 14 May 2026 07:32:58 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNX7Q-000000008oz-23ku;
	Thu, 14 May 2026 14:32:56 +0000
Date: Thu, 14 May 2026 16:32:52 +0200
From: kernel test robot <lkp@intel.com>
To: Nico Pache <npache@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: Warning: mm/huge_memory.c:4049 function parameter
 'is_underused_thp' not described in '__folio_split'
Message-ID: <202605141638.A4IZb8eE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Nico-Pache/mm-restrict-zero-page-remapping-to-underused-THP-splits/20260514-122010
head:   bc875ef7255782841252f6d9774dfd5b857cf52c
commit: bc875ef7255782841252f6d9774dfd5b857cf52c mm: restrict zero-page remapping to underused THP splits
date:   10 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260514/202605141638.A4IZb8eE-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605141638.A4IZb8eE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605141638.A4IZb8eE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: mm/huge_memory.c:4049 function parameter 'is_underused_thp' not described in '__folio_split'
>> Warning: mm/huge_memory.c:4049 function parameter 'is_underused_thp' not described in '__folio_split'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
