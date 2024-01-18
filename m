Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C5328DA6;
	Thu, 18 Jan 2024 15:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705592965; cv=none; b=YVq3rcuhGEjZDyCMGkyDTNgIoWcqqRnt35oitXoNv6b3oIRLLGamKOv3SVH0y41E5U1s5Tx59T50U7E56og0soON83OtGezlfblQEM42FJQghqbuJTTh6aLjGdo40tN0pdcIdFlGEg1GPbX8sk4F3aK72DD6nyoIBLlfyZ4rPwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705592965; c=relaxed/simple;
	bh=MA2t7tS5gh7WozDgJtI8vdppZjC/LmNVLxq0gONG1UA=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:X-IronPort-AV:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	b=lqzRRFHpXrXRcDv0FdQ5agHd7JbsW5YKdEwkI83KzDB1YwxZfr8KeS5fudfpRdyKSaf2S0XGJVxP18NZnrl8WMGp1pqa6BIwoq/rhT+CQl/0dXaKutbS5X8q6VC6a/+IzeOAs6wrIrF/g9npNZ4cTeKYKebtIyRIJFCGoTUO/AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m4c3Dfe3; arc=none smtp.client-ip=192.55.52.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m4c3Dfe3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705592963; x=1737128963;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MA2t7tS5gh7WozDgJtI8vdppZjC/LmNVLxq0gONG1UA=;
  b=m4c3Dfe3gvPZXvD8KNub2jK/AGUtXZTShc2iIaR3uPMSGuKi1DOfpmvq
   Dwn2xBy3KB5ubZpgKjfsom3pfZkfPXR7/bONo5Fvlq4E+0NeZgoBeiYwV
   m7BBFrs+kSu/1jLTIg+kUytW1UXZO+zVBlPYkL54sdRueRj+/A+cm5ucW
   7p5WemVzPlVvy3vFhsgMbAqT6KyE0iiZigv8sKo+jdNXorTQ+jeVYpi6h
   eQ7HtJ1O+z8DIit1PYfR5SJCtz0eaNAFkwZg3IZBzKNNFSrnyd9g21DT6
   GmkzPtvcjkbGrXBb/jnJq9a4qEIZ22uTY+w32WuwUPBJRWMP0xxNZFCX+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="486633201"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="486633201"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2024 07:49:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="928140848"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="928140848"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 18 Jan 2024 07:49:20 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQUdq-00036W-0g;
	Thu, 18 Jan 2024 15:49:18 +0000
Date: Thu, 18 Jan 2024 23:48:54 +0800
From: kernel test robot <lkp@intel.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:n/audio-sm8650-on-neil-codelinaro-topic-sm8650-upstream-integ
 15603/15673] drivers/spmi/spmi-pmic-arb.c:5:10: fatal error: 'asm/memory.h'
 file not found
Message-ID: <202401182300.EiKtJ6oV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux n/audio-sm8650-on-neil-codelinaro-topic-sm8650-upstream-integ
head:   5cac1bb64a0300d340c5e369489c731b30aa5e79
commit: e21b73fba00f3539873c978ceaa948061687684f [15603/15673] spmi: pmic-arb: Add support for multi-master
config: i386-buildonly-randconfig-003-20240118 (https://download.01.org/0day-ci/archive/20240118/202401182300.EiKtJ6oV-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240118/202401182300.EiKtJ6oV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401182300.EiKtJ6oV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/spmi/spmi-pmic-arb.c:5:10: fatal error: 'asm/memory.h' file not found
       5 | #include "asm/memory.h"
         |          ^~~~~~~~~~~~~~
   1 error generated.


vim +5 drivers/spmi/spmi-pmic-arb.c

   > 5	#include "asm/memory.h"
     6	#include <linux/bitmap.h>
     7	#include <linux/delay.h>
     8	#include <linux/err.h>
     9	#include <linux/interrupt.h>
    10	#include <linux/io.h>
    11	#include <linux/irqchip/chained_irq.h>
    12	#include <linux/irqdomain.h>
    13	#include <linux/irq.h>
    14	#include <linux/kernel.h>
    15	#include <linux/module.h>
    16	#include <linux/of.h>
    17	#include <linux/of_address.h>
    18	#include <linux/of_irq.h>
    19	#include <linux/platform_device.h>
    20	#include <linux/slab.h>
    21	#include <linux/spmi.h>
    22	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
