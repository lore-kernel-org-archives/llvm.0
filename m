Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952411FBCB2;
	Wed, 25 Jun 2025 09:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750844964; cv=none; b=rNhLHA10Eyph1cxemuvNimyX8vY5HuBk5qg3HedYCV0LKVgrARS7OkHv7gzX/SUG+jqRLGinTlwekO53W2cpUg3280QTgzAl514Se3cUtmbmB5oxhlReTNnUgF9fAAaJxTZCDTOEgi3Q03U7PVOE0+g3/D0mCdZvJqMA6gPP2dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750844964; c=relaxed/simple;
	bh=b4vBu3r/OIu4EM24O85mVjLT0vCOiMfi1Eha73B7EA8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fmTXX17r/pEQBuZ/7bNfSr/9o64dWdpoL3Cy8Fh/Ad0JC14CtjfgAZBRFq9Y0+g2X2Eglkkz53nIrDRvVS5nwrqMQrZqN9y1T7tUqEfxIqiiPB3SbhtYRTR9QK1PrCfyM7+acDmcAZxP27vx4Aw/kHMzEuCqQ7/sIUNevEHKwnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YiTB8xQK; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YiTB8xQK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750844963; x=1782380963;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b4vBu3r/OIu4EM24O85mVjLT0vCOiMfi1Eha73B7EA8=;
  b=YiTB8xQK0sK0CZzlokXfUhV6esncJ9o+7vNjSsfGXf++uKl0xyWyhqW0
   BO/y+03GA3hU3zDIGfhD5Rb7j5I/nXiitg2PZVV8bsNMWaul/BY40I+bb
   Cb3vwtWWakHbqTgoDc/ReKbgg3jrV4rE0F2I2hE7Fy23rxazLs3PBGXG9
   xC5tDBHwYw/2Bw1yuivcHXFKTnfPjNPNSLc2J9rLS/el7LL0to4BkyVWe
   7fGzNfh6xEtlCkcZ52naX01JutJRMufqaZj2LQYnL8gr2Mlhmw7KSE/4M
   KZe5eXPJtk1vKG7uc8iAC2vzDmiIILLt0sch0SyrkeRPzXUzHSehhoe2P
   w==;
X-CSE-ConnectionGUID: u9QVh6qMTf2uZ92X71p0/g==
X-CSE-MsgGUID: vI5Ef6BFTZKsTEeb6S6jpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="64465469"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="64465469"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 02:49:20 -0700
X-CSE-ConnectionGUID: q5GhCXfqQvadsET1dy4A5w==
X-CSE-MsgGUID: irXJG23XSgK28IQnUsCV4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="156568630"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 25 Jun 2025 02:49:19 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUMkm-000SyU-1B;
	Wed, 25 Jun 2025 09:49:16 +0000
Date: Wed, 25 Jun 2025 17:48:36 +0800
From: kernel test robot <lkp@intel.com>
To: Konstantin Andreev <andreev@swemel.ru>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Casey Schaufler <casey@schaufler-ca.com>
Subject: [linux-next:master 5066/5232] Warning:
 security/smack/smack_access.c:650 function parameter 'label' not described
 in 'smk_import_valid_label'
Message-ID: <202506251712.x5SJiNlh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1b152eeca84a02bdb648f16b82ef3394007a9dcf
commit: 674e2b24791cbe8fd5dc8a0aed4cb4404fcd2028 [5066/5232] smack: fix bug: setting task label silently ignores input garbage
config: i386-buildonly-randconfig-001-20250625 (https://download.01.org/0day-ci/archive/20250625/202506251712.x5SJiNlh-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250625/202506251712.x5SJiNlh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506251712.x5SJiNlh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: security/smack/smack_access.c:650 function parameter 'label' not described in 'smk_import_valid_label'
>> Warning: security/smack/smack_access.c:650 function parameter 'label_len' not described in 'smk_import_valid_label'
>> Warning: security/smack/smack_access.c:650 function parameter 'gfp' not described in 'smk_import_valid_label'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
