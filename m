Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F172F3D544;
	Mon,  9 Jun 2025 16:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749485632; cv=none; b=Ng7V/ySW+iqC1luZsdydXl/S3QtLpX/F8lJ0WjGzlchpP7UOA3SxZEQEkXgB6Qz24vmRZMdqYd9B28Ut1D0TwC4eZ5fJkjKP+yDMAsZk3E5jpZ4M/R+CX3VtoBF9QL4kUnJDU5lFkZzLT83dK8znnMwF7iGs/YdwBpJ7Fnq+Ebk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749485632; c=relaxed/simple;
	bh=rR5X4MhdvIVyHHfn1QvZMTSQHbXFh8cct9zLuRjGhQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d62NtTEswnkGXWyUAgKeXFxLQcqt4Ao38BFPpfSRT5ilRPv7CYGRWSCO8rWKSUY2UMqi6jLN4V+sLWnfUdXHoZeZ/PDhY031VuYjrFiz6aRKMfxn9mq2utxrVRk8hPXjB/e70bhOCUMFv0BGoeQc6A1lGelaoRa/K0uNkusiuiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UOUsrjpi; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UOUsrjpi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749485631; x=1781021631;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rR5X4MhdvIVyHHfn1QvZMTSQHbXFh8cct9zLuRjGhQ8=;
  b=UOUsrjpi3SFIbMIaReuqmteUp8Xd77U6f/PTX0W/oCK/fdJRfZlJPflr
   sprO1ONI83bI0N9kid/F/+tVjNE+VuRBVX2THhx3ryNuiCbRpWOqt3hcy
   TPrIRTd6xqYaRSFq/623XMv0/rsGdgSRTegZaoFTpDUBtUNxiYWP0kd7n
   tbRxd5+k87N4k0koujCeHocLPmlHekWikFXHOH8gFnLO63AXhpV+YCVoj
   PyOzQ1NUiJDEUWajjmT3RJZ/2Joh7x/1Vf3XkIvQf0Ux4VgZMrDXMHMhG
   uJJjS1FNBypRO1iQOs8pj8wNqBUk85U6nQupiLRYJkamuCOYRiaPVEImi
   w==;
X-CSE-ConnectionGUID: /yCVKWb5R3K992Rb3HfzVA==
X-CSE-MsgGUID: pmKgwZ+eRwyDkbxZkmutZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="69016322"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="69016322"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 09:13:21 -0700
X-CSE-ConnectionGUID: /cCuLQ/jTAaOqFSimUqDtw==
X-CSE-MsgGUID: ixdbVnAARwS6dpIYTG0jBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="147519132"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 09 Jun 2025 09:13:19 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOf7b-0007BH-2c;
	Mon, 09 Jun 2025 16:13:15 +0000
Date: Tue, 10 Jun 2025 00:13:08 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: add mmap_prepare() compatibility layer for nested
 file systems
Message-ID: <202506100000.34KZcoZ5-lkp@intel.com>
References: <20250609092413.45435-1-lorenzo.stoakes@oracle.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609092413.45435-1-lorenzo.stoakes@oracle.com>

Hi Lorenzo,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Stoakes/mm-add-mmap_prepare-compatibility-layer-for-nested-file-systems/20250609-172628
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250609092413.45435-1-lorenzo.stoakes%40oracle.com
patch subject: [PATCH] mm: add mmap_prepare() compatibility layer for nested file systems
config: arm-randconfig-002-20250609 (https://download.01.org/0day-ci/archive/20250610/202506100000.34KZcoZ5-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250610/202506100000.34KZcoZ5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506100000.34KZcoZ5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: compat_vma_mmap_prepare
   >>> referenced by shm.c
   >>>               ipc/shm.o:(shm_mmap) in archive vmlinux.a
   >>> referenced by backing-file.c
   >>>               fs/backing-file.o:(backing_file_mmap) in archive vmlinux.a
   >>> referenced by nommu.c
   >>>               mm/nommu.o:(do_mmap) in archive vmlinux.a
   >>> referenced 2 more times

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
