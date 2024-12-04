Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E1B2F26;
	Wed,  4 Dec 2024 04:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733285067; cv=none; b=Cfrx/99mU08/w8IePkvc3j5Fpq6zWTywX+GzzCmEeJFjXOPsMkZS1Sa5OKiFG/vD2+ZntY3RNi9wfqd6CtkmY3f5X2uKK6/6Qo+cbaA8lksUSraBz+hA3xSrf5npEGMeWUuFBeSOkiEXZUN12YHL3ncdt6s52c/dV0Q7ZBGeieE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733285067; c=relaxed/simple;
	bh=HkXOxuzx3FkqU8ePQaJ1hwBBy27i74qANr9DQrRAStk=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sK+2FCTCSlvFBBUoXmlp3DwjxBZvbwdJMrNIdujcW2860PwYbHuzPqEIf26TKtCPKlQTmTs0Bk9sGav5BKLAPlMTLOMD3kgV248hgjjFJ6VUsTX0okDljg/PHggHPsWTqiJrQgdKdGgnAJxfOHWBUCnhKAOF3KKZK/NXyjjIDw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kuBhRQ+z; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kuBhRQ+z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733285066; x=1764821066;
  h=date:from:cc:subject:message-id:mime-version;
  bh=HkXOxuzx3FkqU8ePQaJ1hwBBy27i74qANr9DQrRAStk=;
  b=kuBhRQ+zXoOEaabYcI4UjV900msPgjqNHQpwrJyJsYFo+JblJqW6e09U
   Eoww8mavzab/SL8Dp/BKUvAjFlRGbZ/QG0mGb+NER1K13CV5MywivwNuL
   AgndLaFfRuN0J1u1LKW/659inblca+bpldNqUuD3rj9b+4IsmRcUa2lqV
   cl6FJ7zF4lHjYuRDfDk/PiQdvBIt41TTBmMS+JeeKivIyOfeGSuICg9Q+
   ILRYVpaV+PV07cdiWeIF/8oQ+oPA64Pygxk2fh7DfllqWlr/ahn/1iw+b
   zMa17e+OzKTSBokRqVW+o4dbWAbrbA0fbE+i6Fy4bUte0VxpjjqCrfCYo
   A==;
X-CSE-ConnectionGUID: hEX/RePYT5+4fXTY7wC5cw==
X-CSE-MsgGUID: JRpF56L9SOyWC6z13Sp+yg==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="44194462"
X-IronPort-AV: E=Sophos;i="6.12,206,1728975600"; 
   d="scan'208";a="44194462"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 20:04:25 -0800
X-CSE-ConnectionGUID: ASMJx+MhRu2CiqkeMRXXhw==
X-CSE-MsgGUID: /tjSIpc1RzCOtx2xSBVF0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,206,1728975600"; 
   d="scan'208";a="93488982"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 03 Dec 2024 20:04:24 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIgcf-0002UN-38;
	Wed, 04 Dec 2024 04:04:21 +0000
Date: Wed, 4 Dec 2024 12:04:10 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: sound/soc/codecs/snd-soc-max98090.o: warning: objtool:
 max98090_jack_work+0xc4: can't find switch jump table
Message-ID: <202412041132.Meh1wWSZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Sean Christopherson <seanjc@google.com>
CC: "Borislav Petkov (AMD)" <bp@alien8.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cdd30ebb1b9f36159d66f088b61aee264e649d7a
commit: fe42754b94a42d08cf9501790afc25c4f6a5f631 cpu: Re-enable CPU mitigations by default for !X86 architectures
date:   7 months ago
config: x86_64-buildonly-randconfig-002 (https://download.01.org/0day-ci/archive/20241204/202412041132.Meh1wWSZ-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241204/202412041132.Meh1wWSZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412041132.Meh1wWSZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/snd-soc-max98090.o: warning: objtool: max98090_jack_work+0xc4: can't find switch jump table
--
>> sound/soc/codecs/snd-soc-rt5670.o: warning: objtool: rt5670_probe+0x6e: can't find switch jump table

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
