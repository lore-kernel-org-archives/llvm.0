Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7327A21E08B;
	Thu,  7 Aug 2025 21:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754602859; cv=none; b=AD/FZ2KMrTAzv6FCVWNHfQyT+918m84Tf1QWMPhRfNijI+nKeFyYpPaFo1k+3eOh1sbKbDn05C0VCHi9b7q06Ta59P8V/cuFP+Vcr1/6T/hUEgK6lKHq/IrTgAU00c8hwBJRlCrQ22X2/NdiZNbnwcKlQZLv3BUtu1WmSVYMa30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754602859; c=relaxed/simple;
	bh=3IQZp8dNIPZYW5biGgOsfY/hhjaXTR2L3INDHWS+epI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L55hvssEXqn1CYvINIgEuXF0AXE+AX5viM33kd/vByPmjNvLhNvEbTLYRHCIWzUMCKxLXEmfNviFGlijZvzJpkvzSYCmzBLcFoYE6VfMCgDYLPRQMhY5alPkDDOst8z02GqfwKZUKuhY0MRdaK8YWvei1vBp3B7DESoLbOX0PBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QRN9LKVR; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QRN9LKVR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754602858; x=1786138858;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3IQZp8dNIPZYW5biGgOsfY/hhjaXTR2L3INDHWS+epI=;
  b=QRN9LKVREGIIIybymUn6mG6sIxpSH2JiCC724lK6DaFXRqbC77mtRcQA
   7d3grE5gAvAQso7b7P6MgiJNTwucgv8U842AcL74A67d8PKGOlKqnR84+
   s4XL+TjSLrc/ZmqUZ+q5ww5mKvPbsZD0UBN6gP8bSkSTWgzPDi7RFMcGD
   v0NCsZaXwaycWzu6SgZRpLawPnhgpzOy08HP1TjxpU8FawsiY1trIKycA
   72RHx5WwbKP7xmHw062wJWlwUYFBqtGe4N1TqhNIn9WtSgNvIPkhJ4Cl5
   NRvqL4baOmaCPZe3k4qWEmZvdChxYwQrsOssK8lAolS4BrbClL1ABNaYQ
   Q==;
X-CSE-ConnectionGUID: 75QAgQpcSoq5kkCNoeAkaw==
X-CSE-MsgGUID: KYuJYkIOS1+RPz381htarw==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="79505447"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="79505447"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 14:40:57 -0700
X-CSE-ConnectionGUID: mk2QXNi9RJqchyR7igMW7Q==
X-CSE-MsgGUID: mPANNZifR96FZAeCjp4K4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="165587941"
Received: from unknown (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa008.fm.intel.com with ESMTP; 07 Aug 2025 14:40:55 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uk8M1-0002Wd-1S;
	Thu, 07 Aug 2025 21:40:53 +0000
Date: Thu, 7 Aug 2025 23:40:13 +0200
From: kernel test robot <lkp@intel.com>
To: Kundan Kumar <kundan.kumar@samsung.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Luis Chamberlain <mcgrof@kernel.org>,
	Anuj Gupta <anuj20.g@samsung.com>
Subject: [mcgrof:20250807-migrate-folios-stats-pw 2/16] Warning:
 fs/fs-writeback.c:1008 function parameter 'bdi_wb_ctx' not described in
 'bdi_split_work_to_wbs'
Message-ID: <202508072355.WudSLBwt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kundan,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git 20250807-migrate-folios-stats-pw
head:   9e85a0c893452d1be01703635526b5ce793760f3
commit: bff8f032a029ab66ff54c19048c9f45489da6a8e [2/16] writeback: add infra for parallel writeback
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250807/202508072355.WudSLBwt-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508072355.WudSLBwt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508072355.WudSLBwt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/fs-writeback.c:1008 function parameter 'bdi_wb_ctx' not described in 'bdi_split_work_to_wbs'
--
>> Warning: mm/backing-dev.c:788 function parameter 'bdi_wb_ctx' not described in 'wb_get_lookup'
>> Warning: mm/backing-dev.c:788 Excess function parameter 'bdi' description in 'wb_get_lookup'
>> Warning: mm/backing-dev.c:823 function parameter 'bdi_wb_ctx' not described in 'wb_get_create'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
