Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599733BF688;
	Fri, 10 Apr 2026 13:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775828505; cv=none; b=Y/RVjN0FrHQhotbzHgJItlw8HsuLElvpDIjh4Iurkq8oJ9hql+VGbz98yFa1Srvm7R/dC3DdMPAPO2NFYqhGZATqEf8g2707f2WDIK/NG2tiHlsvNrVS6wcMmyD/dgjm/TvBN1dASXcHYfGauUD9akyhFiThDQAS6LoXpwBS298=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775828505; c=relaxed/simple;
	bh=7P6nz2nAQUJtRRr3bL1WPs6uOzDtXpVigTEJZIKHnV0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sWJfm0subhuhjWWqiTtlG1SRp623JmOIosCY6wnmtZEwKaOQQCl4immueNPSaoL9U1fzNjltO0GdV2+mOAjrCeT8hfsRQmCElFWYnhfOmn4iUcro2idTw9wCoIYDadsrSA6i/FcFo/30bciP1DtEPTa/jU6ffoPNLLK8rnR1gNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZJk3ne3o; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZJk3ne3o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775828505; x=1807364505;
  h=date:from:to:cc:subject:message-id;
  bh=7P6nz2nAQUJtRRr3bL1WPs6uOzDtXpVigTEJZIKHnV0=;
  b=ZJk3ne3o4mIewEqz2r52EZscubOCls4LdSKkJejpkGqgqFhjThrDpfQU
   +vrvyZY4MpO2BPpapobyTzQ8IzvRSUi7SQQkg71+hfrEPb+82wB0ZnMyH
   hRVbHRvRmaVY1t6Ku0y+fwr7zA5HKnhlMBpDW2h4kMig8zlPWOFR9jIKd
   ofkWwvdbdVDcWQAml+xfxXa23iRiEam+O9H1R9El6rJQaFVFEyHqHXEW7
   gSwUKC+s7EF5GJWpWE1vXQ8q4s4YrGPg9merUPXzOnuXSERgvQI+zwfk8
   aOiIyxO9J2iQxpKQrU4gdEQsmRQ+zLLS2dero4svsTIucMwynSmzv9eul
   w==;
X-CSE-ConnectionGUID: 3Bsf6POsQiuYFaXw/Vhlqw==
X-CSE-MsgGUID: 0AXpAXmEQemUn0vt45KM9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="99481560"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="99481560"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 06:41:44 -0700
X-CSE-ConnectionGUID: NprA7rynQAurl9RUnLzcIA==
X-CSE-MsgGUID: Uqd0NApuQV67PK31iG94HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="230812275"
Received: from lkp-server01.sh.intel.com (HELO 6449335cace3) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 Apr 2026 06:41:42 -0700
Received: from kbuild by 6449335cace3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBC79-000000003mf-34d4;
	Fri, 10 Apr 2026 13:41:39 +0000
Date: Fri, 10 Apr 2026 21:40:43 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>
Subject: [linusw-pinctrl:ib-mux-pinctrl 5/5] ERROR: modpost:
 "pinctrl_generic_to_map" [drivers/pinctrl/pinctrl-generic-mux.ko] undefined!
Message-ID: <202604102148.hRtBBCXr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git ib-mux-pinctrl
head:   62f97854fd4bf56e5eb15970787aa4125ea912cd
commit: 62f97854fd4bf56e5eb15970787aa4125ea912cd [5/5] pinctrl: add generic board-level pinctrl driver using mux framework
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260410/202604102148.hRtBBCXr-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260410/202604102148.hRtBBCXr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604102148.hRtBBCXr-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "pinctrl_generic_to_map" [drivers/pinctrl/pinctrl-generic-mux.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
