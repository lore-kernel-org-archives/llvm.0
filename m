Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D23244685;
	Sun, 21 Dec 2025 23:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766358625; cv=none; b=X/H3W7eP9TCmi1C4Lo2xE8tSHOGuyBz8Ue8WWEfTaVd8vvXIAWV96Px3XuRmlrWjyoU8QiVwKpxbGwj8d7T7hBR7SctzynSyYwkwGI40HXWB5SIiUV5M94Xm+nHgQ1bUmvN98vUTVKNauk6D4YuHDAXwd9V5/G7nHbSJ35HNSOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766358625; c=relaxed/simple;
	bh=6zpSdqdlSzoo8fCgyPSroS/HYQ+lMrvBg/qO7XNW5hQ=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K85nY7vr0iqWNXATCPnL6rv0y72N7ik7csaY3wUxZt0OjVsnuuR24haeT3QcQDCJULq6iok/QombhjyUgB0opCd9147ySlB+ya0QztxgZiR3rspmSSHNy6FSziFc7Uxb3uwkvxB0PlyksI7rngDPZ3cO372r9MMTTpDjQOYeqJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E/QR/F37; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E/QR/F37"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766358622; x=1797894622;
  h=date:from:cc:subject:message-id:mime-version;
  bh=6zpSdqdlSzoo8fCgyPSroS/HYQ+lMrvBg/qO7XNW5hQ=;
  b=E/QR/F37sTVquLA4KI4cy91PxXpL2WUqlwZ7LzuDcj31kI3JKQW3IZnm
   15F4lZYdK4BPHzQ6tHvHTUufM5zvbNaUy4YN2EXSoTekWkKxOda+1mSoM
   pm2uSo/dKLysY5zzq40SQDfVLXKvD5tUS7KSlDFMoEc4q5Cy44bQ/B8Nz
   5fJGhJlTW8u2jWFiOCA8Lp0eMBOodO7jx+jJYZBWy+9nOUsMdufc8lQMY
   nr5X+DFQDsF0GklnVYaFU7jinjL0yWCKt5h4uRmoyByKvtRWr+BBLn4C3
   yWXMwBs+vbvAa/GQfPha35r/ovKv7SlqYbLmgPn6pDZ43Bc+f4KLHpNeV
   A==;
X-CSE-ConnectionGUID: ABzX2IbTS6ubdIcDavPs4g==
X-CSE-MsgGUID: seFhtRyERgS0FVa3CLU7Gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="79341706"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="79341706"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 15:10:21 -0800
X-CSE-ConnectionGUID: MyFq2L5dSa+wvwmdNzsH+A==
X-CSE-MsgGUID: 2YFVCXFZQ1ytg3zrEhly7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="199901000"
Received: from lkp-server01.sh.intel.com (HELO 0713df988ca2) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 21 Dec 2025 15:10:22 -0800
Received: from kbuild by 0713df988ca2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXSZA-000000000HP-0bZy;
	Sun, 21 Dec 2025 23:10:20 +0000
Date: Mon, 22 Dec 2025 07:10:11 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: rust/helpers/pci.c:36:2: error: call to undeclared function
 'pci_free_irq_vectors'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202512220740.4Kexm4dW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Danilo Krummrich <dakr@kernel.org>
CC: Alice Ryhl <aliceryhl@google.com>
CC: Joel Fernandes <joelagnelf@nvidia.com>

Hi Danilo,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9094662f6707d1d4b53d18baba459604e8bb0783
commit: 473b9f331718267815649cd93801da832200db71 rust: pci: fix build failure when CONFIG_PCI_MSI is disabled
date:   3 weeks ago
config: x86_64-buildonly-randconfig-003-20251221 (https://download.01.org/0day-ci/archive/20251222/202512220740.4Kexm4dW-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512220740.4Kexm4dW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512220740.4Kexm4dW-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from rust/helpers/helpers.c:40:
>> rust/helpers/pci.c:36:2: error: call to undeclared function 'pci_free_irq_vectors'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   36 |         pci_free_irq_vectors(dev);
   |         ^
   rust/helpers/pci.c:36:2: note: did you mean 'pci_alloc_irq_vectors'?
   include/linux/pci.h:2161:1: note: 'pci_alloc_irq_vectors' declared here
   2161 | pci_alloc_irq_vectors(struct pci_dev *dev, unsigned int min_vecs,
   | ^
   1 error generated.
>> rust/helpers/pci.c:36:2: error: call to undeclared function 'pci_free_irq_vectors'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   make[3]: *** [rust/Makefile:495: rust/helpers/helpers.o] Error 1 shuffle=4010275255
>> Unable to generate bindings: clang diagnosed error: rust/helpers/pci.c:36:2: error: call to undeclared function 'pci_free_irq_vectors'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]


vim +/pci_free_irq_vectors +36 rust/helpers/pci.c

    33	
    34	void rust_helper_pci_free_irq_vectors(struct pci_dev *dev)
    35	{
  > 36		pci_free_irq_vectors(dev);
    37	}
    38	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
