Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F95149E15;
	Sun, 18 Feb 2024 06:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708236510; cv=none; b=e+M/rsLQ9TX/IVFnpETp96sLVVnWvnzZCtopql4Uvw+VRo2kzExRqlsfW1+r8o/udzgNUKkXhaYQocNcQPr9g9/JBBTMFyEiUZOPxrBB1LRb8j34aetX+Qz+w3YJcKAdfK2bI7J7Sx98KWveny/hSfZtEOMoVTRuxiJ5cOdFTbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708236510; c=relaxed/simple;
	bh=HOh2AqFepwaVnFOYrC++d3Goj6xYR5A1mKA41LPWT90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JBE997VFpm5vvAyQsFiUqpmNcbEBWgzmecTMRL5T0CtnUGpPi6hg7DIFB93JD1Ydg6Batfs9JjoFDdQ5T8LwOaRkMSOm6TfHolsjkcZ0LoRQRg4VrxKAPFeWdySy762kSTZUilh4jVKEpyadzVciEJj+3T7OIgRfbwd8vv1rmIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R9v2s/8k; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R9v2s/8k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708236509; x=1739772509;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HOh2AqFepwaVnFOYrC++d3Goj6xYR5A1mKA41LPWT90=;
  b=R9v2s/8kgRXRO0JauGQDptepA7CJph0H9aopWDH8fBmdzfm3b9/y3dvn
   ljP2bfQNom/mrPmI6IlCeVA4e1zPU0peBYSuyYVEEXTudUsIh6nSokLPg
   6dQWkeEhHtAsQ6V+bxMGlrAQM0YkR6DnpGBTRXw8unenDFifgBo5nNK4N
   o6T73JMu/cHyCL5VWZraUgkOAIzsypkuUXbAiJldtzZCYI4D8IbmW7UXS
   SjGqFkDICDP7PPO0ZriVOMvnrBKxAykS/qgX0R3oKerQ9DcJPp7QkxExR
   YfEh1hhKCJwyCghtZuRK3rDa+Zxixt8M2to8zqmKKsNHVwNG6dbP7mUhy
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10987"; a="2440748"
X-IronPort-AV: E=Sophos;i="6.06,168,1705392000"; 
   d="scan'208";a="2440748"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2024 22:08:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,168,1705392000"; 
   d="scan'208";a="4172125"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 17 Feb 2024 22:08:27 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbaLg-0002pg-2i;
	Sun, 18 Feb 2024 06:08:24 +0000
Date: Sun, 18 Feb 2024 14:07:44 +0800
From: kernel test robot <lkp@intel.com>
To: Petr Tesarik <petrtesarik@huaweicloud.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 7/8] KEYS: Run PGP key parser in a sandbox
Message-ID: <202402181348.UBJZpHnh-lkp@intel.com>
References: <20240216152435.1575-8-petrtesarik@huaweicloud.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240216152435.1575-8-petrtesarik@huaweicloud.com>

Hi Petr,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on herbert-cryptodev-2.6/master]
[also build test ERROR on herbert-crypto-2.6/master soc/for-next linus/master v6.8-rc4 next-20240216]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Petr-Tesarik/mpi-Introduce-mpi_key_length/20240216-233743
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/20240216152435.1575-8-petrtesarik%40huaweicloud.com
patch subject: [RFC 7/8] KEYS: Run PGP key parser in a sandbox
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240218/202402181348.UBJZpHnh-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 36adfec155de366d722f2bac8ff9162289dcf06c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240218/202402181348.UBJZpHnh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402181348.UBJZpHnh-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from crypto/asymmetric_keys/pgp_public_key.c:12:
   In file included from include/linux/mpi.h:21:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from crypto/asymmetric_keys/pgp_public_key.c:12:
   In file included from include/linux/mpi.h:21:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from crypto/asymmetric_keys/pgp_public_key.c:12:
   In file included from include/linux/mpi.h:21:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> crypto/asymmetric_keys/pgp_public_key.c:13:10: fatal error: 'linux/sbm.h' file not found
      13 | #include <linux/sbm.h>
         |          ^~~~~~~~~~~~~
   6 warnings and 1 error generated.


vim +13 crypto/asymmetric_keys/pgp_public_key.c

  > 13	#include <linux/sbm.h>
    14	#include <keys/asymmetric-subtype.h>
    15	#include <keys/asymmetric-parser.h>
    16	#include <crypto/hash.h>
    17	#include <crypto/public_key.h>
    18	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
