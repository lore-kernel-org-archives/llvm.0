Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C387D53161C;
	Wed, 23 Sep 2026 16:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790181632; cv=none; b=W5A2Y/lhR6kkYp16WZ0iuvWfzhEVIvJ5RC3wLGo31ahvBwD1mdyqtoqWROctkMfFa+xx26llJqeDnNcxgYZxuMi1K7A8QW9H6/LghPiy03NfMVBGrsj0+Puwx+QCSF93jtnlhxJr7tpWsOsuxoQmJZiik1y8c2/PwwAI78UvGUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790181632; c=relaxed/simple;
	bh=REPxjHD1y/zYH6TZHZ01Uu9WQCyhCrSQnAbPvqxHgiY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bQFnRtOviP7Z/uWWjzUjYyBYeAfyPNe7lxx0zZeg6aIvzXd13gDle3Qm80j7BSGSRAirfloBbL1swFEgL21DAFkZlRmdXah2Rja1ePkSamcG6yRIi+9WDvwmt+kqEABI5Qq23Ci0o+y2p4MA6nFjb3vQcSmZnioK+QeT59gZ3/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uem+Zn+V; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uem+Zn+V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790181623; x=1821717623;
  h=date:from:to:cc:subject:message-id;
  bh=REPxjHD1y/zYH6TZHZ01Uu9WQCyhCrSQnAbPvqxHgiY=;
  b=Uem+Zn+VU0b4eTKkHTZRxUgTl8YqS0YHwOONwZbP5TXfacH3yNQbSrJD
   WIzgb0oDQtRj2J2GWTDcbLRLd400TBB/H25xTSGnaB1EaRSCrk0Wxl1b4
   k4UOvFMJrzOWMio11Y0bgxsxgItJSM+17L63mvnsdvK+SvgFXHg1mxiP4
   6ICWTQ5CMEtM91EnJxQQCGqgB1s+xyg8GUiAu/DWq3MzBN/0H1K6qRZYz
   Ozwjej1ouVG+CJPCaZQngQDXdSfhgjdAPIF2WhzLTR34sOM+lU/oZp+p9
   QmlH6SbOwbYLRn8QfAgEmD6IydI+edd3KXfWIBtJYDQunoRsWe5zlCZ50
   A==;
X-CSE-ConnectionGUID: vXGqsfYZSwaeJsZ751hSGg==
X-CSE-MsgGUID: r1FsjeowSmWZ+Vq+0d66Eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="102258598"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="102258598"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 09:39:59 -0700
X-CSE-ConnectionGUID: GRjC+BcoQU+7PGWwFLgm+Q==
X-CSE-MsgGUID: zyV/Pn5qT/SeAnO6fyrbag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="4947902"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa013.fm.intel.com with ESMTP; 23 Sep 2026 09:39:57 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9Q0g-00000000HOo-2VDd;
	Wed, 23 Sep 2026 16:39:54 +0000
Date: Thu, 24 Sep 2026 00:39:36 +0800
From: kernel test robot <lkp@intel.com>
To: Ross Philipson <ross.philipson@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Jarkko Sakkinen <jarkko@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Alec Brown <alec.r.brown@oracle.com>
Subject: include/linux/tpm_command.h:515:2: warning: field  within
 'struct tpm_header' is less aligned than 'union tpm_header::(anonymous at
 include/linux/tpm_command.h:515:2)' and is usually due to 'struct tpm_header'
 being packed, which can lead to unaligned acc...
Message-ID: <202609240044.aAnGhdJw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fe2ec83746e501645709761605c2464a44fd2929
commit: 88c5a62c3af7ca6f36dc6ffc52bcfb29cd2990cb tpm: Move TPM common base definitions to the command header
date:   4 weeks ago
config: arm-randconfig-1001-20260923 (https://download.01.org/0day-ci/archive/20260924/202609240044.aAnGhdJw-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5dc57157f12f0ff676e823d9b4d98b45c07e5df2)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260924/202609240044.aAnGhdJw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 88c5a62c3af7 ("tpm: Move TPM common base definitions to the command header")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609240044.aAnGhdJw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from security/keys/trusted-keys/trusted_tpm2.c:11:
   In file included from include/linux/tpm.h:28:
>> include/linux/tpm_command.h:515:2: warning: field  within 'struct tpm_header' is less aligned than 'union tpm_header::(anonymous at include/linux/tpm_command.h:515:2)' and is usually due to 'struct tpm_header' being packed, which can lead to unaligned accesses [-Wunaligned-access]
     515 |         union {
         |         ^
   1 warning generated.


vim +515 include/linux/tpm_command.h

   511	
   512	struct tpm_header {
   513		__be16 tag;
   514		__be32 length;
 > 515		union {
   516			__be32 ordinal;
   517			__be32 return_code;
   518		};
   519	} __packed;
   520	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
