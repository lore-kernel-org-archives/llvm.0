Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE35818A6B6;
	Wed, 25 Sep 2024 12:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727265623; cv=none; b=gj1cAkuwZWmYL1FD0rBRcUAaJnFpQyjUVh54suF1vBLhVa2LyUv/23r7gLlmoH/jwklMC1m3rpDLQznvAxnaumjjjrA5OaIsX9OeKNOXZqk44uCkcxWYBbM0uIoppHQ1Ud+ErlNVodT+P/BpOmMdsQb8j8sWUoWGUzUvcia7HQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727265623; c=relaxed/simple;
	bh=m1qc7fAQ0cZYfNPNJ3zWH+FfsONqrrnHM/qkxad0qZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BOvkeuDE6GUk+y9XpreFmBJqKypr+XNK4KGiN3bC9XbJqtobX/3VEdnNVgse5UjQ3IekyqXF4jXGXrya372HKPEw8bV5fwnjVfuiNoMCwDuJ5DKY3b54ipA0/5ADrVzm417/fhOE/b6sGsVgzm7Tc7NHD/jLF+fKd0ccoopUiSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Th3nDU8N; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Th3nDU8N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727265622; x=1758801622;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=m1qc7fAQ0cZYfNPNJ3zWH+FfsONqrrnHM/qkxad0qZI=;
  b=Th3nDU8NQSEHVpxelADyRsz9KxL4GJVWmzIxxlv/mYBL0nDUt/0+4GyF
   G0mwW+w8VcYJ0EjAp0sG1ptH49EAQ+4Z+6j6NbMxKHC30TCZ5WfW1W7Ky
   MrbKpMuT2lxfSZGyJlir84LTgPQVGe+A4SGhYmFmlJuByry2NT4gdg67n
   0ve6qFXaBntU6d/JFx6UIY836d/j0SrDPzisEaZDEx99il70dnCRaMeg8
   9J5YAMC/vL2RGB4Mp6hom795ooH55TdJo6CbUrhD1sN2OIxHc/Dhlpp+4
   TzJZN2ZrTecmQcLqmSKcTkyffcxeyT2Lvko+UMLUjNfr0sqxkiDthkkop
   g==;
X-CSE-ConnectionGUID: TbmGgOhHTOq/27wArkoCzg==
X-CSE-MsgGUID: px7oqMRXQqCkdY5ITYYTeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="26255213"
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; 
   d="scan'208";a="26255213"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 05:00:21 -0700
X-CSE-ConnectionGUID: VGT8nKdfQl+z6j72aaS9CQ==
X-CSE-MsgGUID: BCscd2aMTgeZ1lQQkb8DGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; 
   d="scan'208";a="72564645"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 25 Sep 2024 05:00:17 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stQgo-000JWd-2w;
	Wed, 25 Sep 2024 12:00:14 +0000
Date: Wed, 25 Sep 2024 20:00:04 +0800
From: kernel test robot <lkp@intel.com>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Allison Henderson <allison.henderson@oracle.com>,
	Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
	rds-devel@oss.oracle.com, linux-mm@kvack.org,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: Re: [PATCH 4/4] selftests: exec: update gitignore for load_address
Message-ID: <202409251828.dMx8LnrF-lkp@intel.com>
References: <20240924-selftests-gitignore-v1-4-9755ac883388@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240924-selftests-gitignore-v1-4-9755ac883388@gmail.com>

Hi Javier,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 4d0326b60bb753627437fff0f76bf1525bcda422]

url:    https://github.com/intel-lab-lkp/linux/commits/Javier-Carrasco/selftests-add-unshare_test-and-msg_oob-to-gitignore/20240924-205133
base:   4d0326b60bb753627437fff0f76bf1525bcda422
patch link:    https://lore.kernel.org/r/20240924-selftests-gitignore-v1-4-9755ac883388%40gmail.com
patch subject: [PATCH 4/4] selftests: exec: update gitignore for load_address
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20240925/202409251828.dMx8LnrF-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240925/202409251828.dMx8LnrF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409251828.dMx8LnrF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   tools/testing/selftests/arm64/tags/.gitignore: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/Makefile: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/tags_test.c: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/exec/load_address.c: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
