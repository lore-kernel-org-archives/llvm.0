Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D18246770;
	Sun, 21 Dec 2025 23:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766359452; cv=none; b=gZBexKdbmaSc39R5aA5FoumDIaAQUOuP3NhO29f5HaGb3pBekBqFiAMUrht3ReFHEPWgAJ0ogau/Ce4mLC4ttFNJ45e1tZo4EQwF/BapdwlGYCls2VIE/PPa8Zmzl//Qt0JPgFOuFtYgMSTQrs1uX1clD+z5iox7ZvhSMbo1TnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766359452; c=relaxed/simple;
	bh=jRLHOAJOYUukmCjkRMqGhZNZ1EwcZGhWlFwAzjTVwiI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YEE3lCyZvdv6VspRhxkmjM4z2YvB2gB0FOJ6aK7zOWuNm28h7oeuh7aB9PsKrzKR3/DKwVk38ow74440UQkvd5Mf/V8Ng4mo7S6EAX9gg2S24J9aUKtSFQdI+orFnZaQ86za3ThoKSrx2q25RUUXjRBf8EqBI4qOr+LT9S2mA5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AbaSCYlr; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AbaSCYlr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766359451; x=1797895451;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jRLHOAJOYUukmCjkRMqGhZNZ1EwcZGhWlFwAzjTVwiI=;
  b=AbaSCYlrrlHDJBxdXn6n+k7p0vj/t8IU+yMKCdFDUEfgFu/QJ0wyVVrC
   zGe38pvZPjG+96698CB2U/tly2QmQfuOpvJVV+A3ip3e/ALzEwAAipTMN
   wPsNAkQrfsM0rXwEvPkPSdA6tHbNmFgTEbizdcJnfHErFpgk6KCMwT6iN
   VBjdgZgkPMHzZRJ7EmYu6agbOGyZLua+iFGi3YDCiD46wcPORA7rqBuMC
   RL3g2Eu/WZ0f3YzNg13GfgCKVsMI8PPmmziP6fn33mVwc93Yq1tIucGBf
   CTCNaUKoNi7Na4/NmNzyX1XWznrh5nDWE2ZamlSeJkFKLuZdo1MHu03oa
   g==;
X-CSE-ConnectionGUID: dGhy1uuuQWWsiZCMht3nlA==
X-CSE-MsgGUID: oUuFB9brQqSoLN4uMZsRgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="78542394"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="78542394"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 15:24:10 -0800
X-CSE-ConnectionGUID: 8F6rHHE0TEaXCrxBQY+cvw==
X-CSE-MsgGUID: rfKpAXK6T/+av2MM5Xkn9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="199284272"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 21 Dec 2025 15:24:09 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXSmV-000000005Ge-0lIO;
	Sun, 21 Dec 2025 23:24:07 +0000
Date: Mon, 22 Dec 2025 00:23:43 +0100
From: kernel test robot <lkp@intel.com>
To: hungkien05 <nguyenhunghnuekt@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:pr/24 1/1] arch/x86/kvm/emulate.c:1759:4: error:
 expected expression
Message-ID: <202512220002.VT40yPyF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa pr/24
head:   dcd699a99ce2f40e50263e0ec438e3b57b133598
commit: dcd699a99ce2f40e50263e0ec438e3b57b133598 [1/1] Fix potential vulnerability in cloned code (arch/x86/kvm/emulate.c)
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20251222/202512220002.VT40yPyF-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512220002.VT40yPyF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512220002.VT40yPyF-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> arch/x86/kvm/emulate.c:1741:2: warning: '/*' within block comment [-Wcomment]
    1741 |         /*
         |         ^
>> arch/x86/kvm/emulate.c:1759:4: error: expected expression
    1759 |          */
         |           ^
   arch/x86/kvm/emulate.c:1760:2: error: expected expression
    1760 |         if (seg == VCPU_SREG_SS && selector == 3 &&
         |         ^
   1 warning and 2 errors generated.


vim +1759 arch/x86/kvm/emulate.c

  1733	
  1734	static int load_segment_descriptor(struct x86_emulate_ctxt *ctxt,
  1735					   u16 selector, int seg)
  1736	{
  1737		u8 cpl = ctxt->ops->cpl(ctxt);
  1738	
  1739	
  1740		/*
> 1741		/*
  1742		 * None of MOV, POP and LSS can load a NULL selector in CPL=3, but
  1743		 * None of MOV, POP and LSS can load a NULL selector in CPL=3, but
  1744		 * they can load it at CPL<3 (Intel's manual says only LSS can,
  1745		 * they can load it at CPL<3 (Intel's manual says only LSS can,
  1746		 * but it's wrong).
  1747		 * but it's wrong).
  1748		 *
  1749		 *
  1750		 * However, the Intel manual says that putting IST=1/DPL=3 in
  1751		 * However, the Intel manual says that putting IST=1/DPL=3 in
  1752		 * an interrupt gate will result in SS=3 (the AMD manual instead
  1753		 * an interrupt gate will result in SS=3 (the AMD manual instead
  1754		 * says it doesn't), so allow SS=3 in __load_segment_descriptor
  1755		 * says it doesn't), so allow SS=3 in __load_segment_descriptor
  1756		 * and only forbid it here.
  1757		 * and only forbid it here.
  1758		 */
> 1759		 */
  1760		if (seg == VCPU_SREG_SS && selector == 3 &&
  1761		if (seg == VCPU_SREG_SS && selector == 3 &&
  1762		    ctxt->mode == X86EMUL_MODE_PROT64)
  1763		    ctxt->mode == X86EMUL_MODE_PROT64)
  1764			return emulate_exception(ctxt, GP_VECTOR, 0, true);
  1765			return emulate_exception(ctxt, GP_VECTOR, 0, true);
  1766	
  1767	
  1768		return __load_segment_descriptor(ctxt, selector, seg, cpl,
  1769						 X86_TRANSFER_NONE, NULL);
  1770	}
  1771	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
