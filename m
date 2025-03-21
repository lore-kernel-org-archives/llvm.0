Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B481E3DE8;
	Fri, 21 Mar 2025 02:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742524940; cv=none; b=s6woDp53v8rGDXlxk0YpKleAyjcywIxHJosdgZUTfVA8fm8llmC4uKUSxLkgZTqVE3UiitgTq0kcvO5xPdbYbhtwvs8awFnTETJnu0eqoxzTpqUMLMo3axL4JiMXwQQ+9ryXKu2xpM2Vyo0cUGQ86p6yrcuwImK+9DFla6u2Uck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742524940; c=relaxed/simple;
	bh=iRzCCEjN74qme9k2+0cNrmsvBzSueF0KdDdEk7TCWOc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GeKNhxRQI/njJINm0xsf2NPmd573sipDM7Rex0gK6gSjQXO0sglDFfvTzPeEUWK02VqyFPQ2E23RF1dCaN2Rt5X6JTIH2gNe6eBFWaBf/gtllEYYR50xYCglTxSKz9TShXT37NqiJDJoyA+lV++E+Gp+/uslsrEXt9ECPZNEm28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gf8IHCTI; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gf8IHCTI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742524937; x=1774060937;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=iRzCCEjN74qme9k2+0cNrmsvBzSueF0KdDdEk7TCWOc=;
  b=gf8IHCTI5jkLWToUhoh8iDST/HLbuqt02h4EuJhHpJwYhh8elROSrAe3
   zGDZiKkbv/wFR7BNyw+QG5puklsSdOXNyDZUGRArhgmFMgwn4nDgmTJjs
   XSey6t79hV5ad+W9QnrcYIB6x4oStDJhYccgWNN9g7gMrD0sVEgGnJSuc
   BrsyY/IRn8OOMZyncYx2tbkriLTiMqXCH5CHHVWHu+4dJqGg7Kb90amqM
   vLF93BwlWAStQDesnRBDwe9anv5r9F+APV99j5VDoeUg4LO/ZCCAf5dq4
   Dnlb70bTq1kJrYufywnPDsbD+JT75eGb3HsSlX1/bah0TXmRg+arLSGan
   g==;
X-CSE-ConnectionGUID: Px/94Np6TQW/X4HEOvZEBg==
X-CSE-MsgGUID: nG0MxMekRhqVTB3QT69ciQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="54418811"
X-IronPort-AV: E=Sophos;i="6.14,263,1736841600"; 
   d="scan'208";a="54418811"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2025 19:42:13 -0700
X-CSE-ConnectionGUID: 7+s6t2UdSsihDe1CDCpqIA==
X-CSE-MsgGUID: SJovzMsPS96ZEY/ZtVF8MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,263,1736841600"; 
   d="scan'208";a="154171390"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 20 Mar 2025 19:42:11 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvSKn-0000xd-1X;
	Fri, 21 Mar 2025 02:42:09 +0000
Date: Fri, 21 Mar 2025 10:41:40 +0800
From: kernel test robot <lkp@intel.com>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, arm@kernel.org,
	Arnd Bergmann <arnd@arndb.de>
Subject: [soc:soc/drivers 22/24]
 drivers/platform/cznic/turris-signing-key.c:25:55: warning: omitting the
 parameter name in a function definition is a C2x extension
Message-ID: <202503211042.Uf5Ln7hI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Marek,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc/drivers
head:   ba8755ab541fc629948233125db870d4dbf00a75
commit: df94a2f1eb455b57dd01f9b64419e3163d44df7f [22/24] platform: cznic: turris-omnia-mcu: Add support for digital message signing with HW private key
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20250321/202503211042.Uf5Ln7hI-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250321/202503211042.Uf5Ln7hI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503211042.Uf5Ln7hI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/platform/cznic/turris-signing-key.c:25:55: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
      25 | static int turris_signing_key_instantiate(struct key *, struct key_preparsed_payload *)
         |                                                       ^
   drivers/platform/cznic/turris-signing-key.c:25:87: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
      25 | static int turris_signing_key_instantiate(struct key *, struct key_preparsed_payload *)
         |                                                                                       ^
   2 warnings generated.


vim +25 drivers/platform/cznic/turris-signing-key.c

0b28b7080ef5a3 Marek Behún 2025-02-04  24  
0b28b7080ef5a3 Marek Behún 2025-02-04 @25  static int turris_signing_key_instantiate(struct key *, struct key_preparsed_payload *)
0b28b7080ef5a3 Marek Behún 2025-02-04  26  {
0b28b7080ef5a3 Marek Behún 2025-02-04  27  	return 0;
0b28b7080ef5a3 Marek Behún 2025-02-04  28  }
0b28b7080ef5a3 Marek Behún 2025-02-04  29  

:::::: The code at line 25 was first introduced by commit
:::::: 0b28b7080ef5a323c3afa3860c3d45d627629830 platform: cznic: Add keyctl helpers for Turris platform

:::::: TO: Marek Behún <kabel@kernel.org>
:::::: CC: Arnd Bergmann <arnd@arndb.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
