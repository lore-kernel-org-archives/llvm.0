Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA841D5CC9;
	Mon, 29 Jun 2026 20:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782764151; cv=none; b=rUgUlcvzKvLZx50AyDLrW2pQBXjxlmXNUSEML3w48bQPr7J5WhGMr2CoUtgnxbyndIbvw5HuO87bE6WIV3sejZqwIKylyH7l1D9eL3/p2j7+qsNm1Qpcp/i2FOMVZv+Pl8KIi6R2gxfwTsf/OGIpZsNN3aCl5sUEIc3dwnhT2Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782764151; c=relaxed/simple;
	bh=MhEr/P73janjI3DekUsErC2kj3cjq1HtqgznfAjMlHk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=MaEr4ciJAV0DUGa3AQP+rBf7JOaSi6AKymYakQM2pnYwww5KRDNoW+u3Kwj6rkie7XMQCtrLb1rIp1uysqtFN4TxmJXUkfTuJ9elmiWjpofXxQOojttAe9yLhQk+l/NASsCPjf2gAaFTNFMLt02ngrEXas5ydq7Vco2Bb+1GMek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AxzB8sdk; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AxzB8sdk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782764150; x=1814300150;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MhEr/P73janjI3DekUsErC2kj3cjq1HtqgznfAjMlHk=;
  b=AxzB8sdkvZeV128l6IN27/xqKNYrLIxIip355Li3qwSXPTovKiXSAdDF
   NL//OXdNe/c1FfrzfqUIQAvbBkE8MbmDGUrZnTb7SHYGzW//z/UmarLpf
   KLjO+UiY1fk3o91dLojM5fVHv2rIuL4QgnMhrCJxdvRstqflyztNZlWL6
   TGt/K9U1XhaciVug1N9nojSGxeYBF+T0CFkqf6+YZH0xWVg49AhFOFYgK
   VH/uQK0g+fbLSHyTzdgxD7r6g7POvkbG+B8WmtbQHaAiYr29N/1+fKqNX
   dCTxhE3+XO25R0jd37Ux8pRHSs3U8e8iqdUlZ0iT798A0OMxsa9KMcDwX
   w==;
X-CSE-ConnectionGUID: tlf02Ho0RiOxe89NtJ5+gA==
X-CSE-MsgGUID: 6GkEN7yhRcKUjZ7+8HTtlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="83341503"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="83341503"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 13:15:49 -0700
X-CSE-ConnectionGUID: uhOhxiTgRPGC6vkiWwJ0CA==
X-CSE-MsgGUID: e8gVU7bEQF6JzahSLkSnGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="282132897"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 29 Jun 2026 13:15:48 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weIOO-000000007ix-443Y;
	Mon, 29 Jun 2026 20:15:44 +0000
Date: Tue, 30 Jun 2026 04:15:36 +0800
From: kernel test robot <lkp@intel.com>
To: "Stefan =?utf-8?Q?D=C3=B6singer"?= <stefandoesinger@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [stefandoesinger-zx297520:dlink 37/123] ERROR: modpost:
 "sdio_release_irq" [drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.ko]
 undefined!
Message-ID: <202606300453.1rvBKdGh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://gitlab.com/stefandoesinger/zx297520-kernel dlink
head:   657e76ed3917dff420bac3ef896d1a908149e32b
commit: 51bafe98304eac9c41f729864e1e9af307af9efc [37/123] Try to add the wifi card in the dlink device.
config: hexagon-randconfig-001-20260629 (https://download.01.org/0day-ci/archive/20260630/202606300453.1rvBKdGh-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260630/202606300453.1rvBKdGh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606300453.1rvBKdGh-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "sdio_claim_host" [drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.ko] undefined!
ERROR: modpost: "sdio_readb" [drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.ko] undefined!
ERROR: modpost: "sdio_release_host" [drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.ko] undefined!
ERROR: modpost: "sdio_writeb" [drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.ko] undefined!
ERROR: modpost: "__sdio_register_driver" [drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.ko] undefined!
ERROR: modpost: "sdio_unregister_driver" [drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.ko] undefined!
>> ERROR: modpost: "sdio_release_irq" [drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.ko] undefined!
ERROR: modpost: "sdio_enable_func" [drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.ko] undefined!
ERROR: modpost: "sdio_set_block_size" [drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.ko] undefined!
ERROR: modpost: "sdio_claim_irq" [drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.ko] undefined!
WARNING: modpost: suppressed 5 unresolved symbol warnings because there were too many)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
