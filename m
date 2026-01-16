Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C4B3375A6;
	Fri, 16 Jan 2026 14:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768574107; cv=none; b=dHFapELnOg+V8JZRyziHF8vCduGOA8F4HJFSlMjdRr4VHENE1uR7gPK2NeMyEwDTFb8jSYO0/FJMTgSsW25V0/4sOaQ3O50M/jQvBQ6bd9qFIFgd4m1rRVvskChi3Pqnmo04zzT33cFX+JO0M2zYUhM5GOAFTZVe/79ZrywjZZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768574107; c=relaxed/simple;
	bh=cnc7OnDqovMiZCNUVYyfI3G4JfIHnfxanw2SgK/zOq0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YjJ7DbA1dKS7XN50rgxklyV7C9hBVSiNlc/WQiP3uoD+ChMd9LO0fnH/tOs72YimbFJ/971mgyjy2EyGYcIKBmuRK2Vr1vh6MpDiTPF8FzPHE3cs8zDNIqA/RLNC3BFzYE0l9Vc6gGIiTKhhlVJBDZFFLJAxxvlojyrWrAZ6Kag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YaEmgIQi; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YaEmgIQi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768574106; x=1800110106;
  h=date:from:to:cc:subject:message-id;
  bh=cnc7OnDqovMiZCNUVYyfI3G4JfIHnfxanw2SgK/zOq0=;
  b=YaEmgIQiUvwEGkD33uMUqi56YQVOQd/WkOGmjlb9ckL5CGr/d+bWnaYb
   n4uTt8oGhi8/BAGAOsda4ZN5rs+Mg/xMvVZy1CKIJyr1O2pi7SBQ1z661
   5yRZezFTF8nvlEgXnpjGNjKKCntfIJAZuJduXB2Im/HM8lqIsIdVSr/4c
   NETeHMY8qqC1O+k24mmIykK/HByfxFvDFssLV6iuFnjixlw9jRP7W+Ad5
   dAzfLbHZQaypCU2UgOR3UR5qV9itClmcmn4xnFYa8nFYRNuQrvqh7NS0u
   omg/qJqRqPSh+h3HiOdi3ehscIPW+wZeeMnTfRxSafcqLZUh5BVqtQ2Im
   A==;
X-CSE-ConnectionGUID: mQWBeXl4R/2nJglQEDiuUw==
X-CSE-MsgGUID: TXXjSuh6QRiXvmdvD3aOcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="95364799"
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; 
   d="scan'208";a="95364799"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 06:35:05 -0800
X-CSE-ConnectionGUID: 9W7uoICBTluNWlEuXNcuLg==
X-CSE-MsgGUID: 5vwWPtr4Tiu2WHn1/ojXkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; 
   d="scan'208";a="204470460"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 16 Jan 2026 06:35:03 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgkui-00000000Kvk-24Pa;
	Fri, 16 Jan 2026 14:35:00 +0000
Date: Fri, 16 Jan 2026 22:34:25 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:keys-pqc 8/10] ERROR: modpost: "oid_to_hash"
 [crypto/asymmetric_keys/pkcs7_message.ko] undefined!
Message-ID: <202601162228.02cAZCjg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git keys-pqc
head:   573904dcb8c349de6c983c50f450c478decd9996
commit: 66c15603314346fe9045542103ca0cbd9381cc63 [8/10] pkcs7, x509: Add RSASSA-PSS support
config: arm64-randconfig-004-20260116 (https://download.01.org/0day-ci/archive/20260116/202601162228.02cAZCjg-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601162228.02cAZCjg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601162228.02cAZCjg-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "oid_to_hash" [crypto/asymmetric_keys/pkcs7_message.ko] undefined!
>> ERROR: modpost: "rsassa_parse_sig_params" [crypto/asymmetric_keys/pkcs7_message.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
