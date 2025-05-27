Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F52A193077;
	Tue, 27 May 2025 19:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748373145; cv=none; b=ehugV2mAu572MTNDsefFQpHy1bWaJ88HYzn8Z9v+zfXKYz4KH8UKETvSct815UWMfIpN/tfozE2/XPgZ+rsdyrH8mQn+H+m/re7n/wQiuFh3xHe2kO33hNqqgybZMGkoKIFjXUirlH/xZySp+Y3FDzCmmj3iOzgSRJ/3K8o38Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748373145; c=relaxed/simple;
	bh=qxeoEo+O9hsGl0ocpjEEOE2LxIz0d/COZpSwq0Nm5AY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DS0PaSf59As4lkhgJ4yiL3qNZRG6ZgYCj/GqjtSH+ZYvq4keOWf/Sn3mHBmu3Bs95LDNVhHst+RJuy02/MFW/v6Qi/yI1ZAl2gukRblopb9T5ubEuLiNYzghCdf9xLhY02BAarhA4lYi8Td9b08tHF/mFjUgaxa+1GkJ3mD6M9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dYjghJuV; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dYjghJuV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748373144; x=1779909144;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qxeoEo+O9hsGl0ocpjEEOE2LxIz0d/COZpSwq0Nm5AY=;
  b=dYjghJuVWhsIhJmB1p7zV6B8gwKrm5oZ1lkQeQgFC0bnBBwVlEk9UajU
   x59kbuguyXbWgd5SeHX6+rpNN5S35InNVlCSNJkXeBqEzL9DDolc1MwIn
   mPhb2iwiqIxEPvbL0o1edPSKFqqQGsYKUh9kteVXX1gsqvoFtaXnMBgh+
   SjfK001PwW1AyeNJaZTeVV239qv16eZt7s34SXXjaGHnwR7alb0d5yuux
   v48wOIIqg97pF/QQynfPEI1sO+Wl5ULzBK/8RBiIQRumUF7dPVp3wDl7+
   lMwKZadV96N4vAhJwJl/quCBSIaWvQEdbKSxGOlu504VttE12ER1iCv4D
   g==;
X-CSE-ConnectionGUID: IwbNXQiRQt+j7GXvvGrHmg==
X-CSE-MsgGUID: M4Dq1j6bTXmw/n75J4MBXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="54177864"
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="54177864"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 12:12:23 -0700
X-CSE-ConnectionGUID: Yz2OKRDpSwmqgxdElGMtJw==
X-CSE-MsgGUID: utRMRtHeRyi2g2Osy6jKiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="143914044"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 27 May 2025 12:12:22 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJzil-000Uvm-1h;
	Tue, 27 May 2025 19:12:19 +0000
Date: Wed, 28 May 2025 03:11:57 +0800
From: kernel test robot <lkp@intel.com>
To: Kornel =?utf-8?Q?Dul=C4=99ba?= <korneld@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] power: supply: qcom_battmgr: Report battery capacity
Message-ID: <202505280344.GjzOItSS-lkp@intel.com>
References: <20250527121807.3597061-1-korneld@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527121807.3597061-1-korneld@google.com>

Hi Kornel,

kernel test robot noticed the following build errors:

[auto build test ERROR on sre-power-supply/for-next]
[also build test ERROR on linus/master v6.15 next-20250527]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kornel-Dul-ba/power-supply-qcom_battmgr-Report-battery-capacity/20250527-202035
base:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-power-supply.git for-next
patch link:    https://lore.kernel.org/r/20250527121807.3597061-1-korneld%40google.com
patch subject: [PATCH] power: supply: qcom_battmgr: Report battery capacity
config: i386-buildonly-randconfig-002-20250527 (https://download.01.org/0day-ci/archive/20250528/202505280344.GjzOItSS-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250528/202505280344.GjzOItSS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505280344.GjzOItSS-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in lib/zlib_inflate/zlib_inflate.o
>> ERROR: modpost: "__udivdi3" [drivers/power/supply/qcom_battmgr.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
