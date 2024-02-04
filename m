Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA39444363;
	Sun,  4 Feb 2024 22:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707084498; cv=none; b=KpeQ8abdQ2Oo1dyK4qm0vpYBJk7QqK/zFPctOI9L15Y0YjOz8OILiK+3Q30EF42rtJiYJH/w1Ty6otzjp8G8kVFcbtmCIQqdXdocZnb0uN2WWOrpcDyCs57Wuws67mMbKo+kcae3jsROYYHzgGm4eX+FgDomE9kOEfAvVT1GvpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707084498; c=relaxed/simple;
	bh=Hr47usnLc+kaE0ZaS9ydUZMU8BC6lS7lUOfByuPm9+s=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=um3UP5R/YjD5v3lUH13mvOyy8geVi/VW6KIwSr5LOGyyPtHxC/JNS2YbGuxJfrql8PD4f1Yfwehmb9PUz14MnWR/fnPiVVTtM8sbdKeAnAm2bhb1HKPlY+/JJaSuVbPpynKBGFgRiSauWR22rsxaWS0qFnhhSvUkNWq7lymItFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OlmtzRo9; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OlmtzRo9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707084497; x=1738620497;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Hr47usnLc+kaE0ZaS9ydUZMU8BC6lS7lUOfByuPm9+s=;
  b=OlmtzRo9WLKk6BpvYxZCVo90Cr7dR0W3oOfLlO5DGDeKXvVwz4+qIDed
   AITkBxWohr/KC5h9worIBwAnkGF1kos8+HK/K9PMqH7D1Hu3eepiUrQxU
   1pdbnPpxBkfZZOS9vZ4YtdO7i9DgJ/+aRuebZaY3HDxAH9czrO2ZavLcL
   nDQI3/8TEh0BFROTX2Y6oPrmYPXCMrKXKVqDuGVC6zURRr0/7oKzwFPT7
   cX3/jcffUmENJBV9nXFEHAAT7bZUplN4jPQ/w8IBwJtF7qPUD1l+5Zypt
   qSY0eGaOzAtVJNZvnCnH8IKops3DeD6+NfBlgay6FCDrWXdx8bvm0ZHC/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="11157965"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="11157965"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2024 14:08:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="823701052"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="823701052"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 04 Feb 2024 14:08:14 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWkep-0006j6-0E;
	Sun, 04 Feb 2024 22:08:11 +0000
Date: Mon, 5 Feb 2024 06:07:52 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [ardb:x86-pie-for-sev-v3 15/17] arch/x86/lib/cmdline.o: warning:
 objtool: cmdline_find_option+0x5b: can't find switch jump table
Message-ID: <202402050617.0glCfwoN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Ard Biesheuvel <ardb@kernel.org>

Hi Ard,

First bad commit (maybe != root cause):

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-for-sev-v3
head:   e808f1d9ecc40f701330869bdb4f8ce0ad23c774
commit: acd3567a5b3ca947e3fda608da2efdd29fb8a4a4 [15/17] x86/sev: Use PIC codegen for early SEV startup code
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240205/202402050617.0glCfwoN-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240205/202402050617.0glCfwoN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402050617.0glCfwoN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/lib/cmdline.o: warning: objtool: cmdline_find_option+0x5b: can't find switch jump table
--
>> arch/x86/kernel/sev.o: warning: objtool: snp_cpuid+0x120: can't find switch jump table

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
