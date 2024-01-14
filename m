Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D8F1845;
	Sun, 14 Jan 2024 03:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JTU/9gDH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705202491; x=1736738491;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dXDD8oPvjiwGvhH7U/KlYHnlAJDHV4588ItGjtMOvag=;
  b=JTU/9gDH1/WUy4um0Jeu3kUNxy5x/TtvLyjCnf5VXDvHKyO/mjKL5Es+
   N1agAeTcGL+nAvCG+nTNNf86ZN5dS1MtVm1g0SUJPVDAQXTdL5lSXWcu3
   ksskQF6y5PnloS5QYB6JYWP+nUeFv7hF+X5jG/wlRP099RyO/OA3pk+t2
   Tez2wL/L3BHMTepgHi3AucMDrh5YsmRtalXp2GhSQbzxrgQIiGZQcZ8Sv
   qdRgyBoL3Awo1h+C9xoSLW/W6Hl0vH4baao1jEekvqqwREfJUqpKHtb24
   iW8nsAFRKatZygs+Bme7hFg48FF0l86mOUYcNUxXzSfV5tQ6a6gaOUIxK
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="6795800"
X-IronPort-AV: E=Sophos;i="6.04,193,1695711600"; 
   d="scan'208";a="6795800"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2024 19:21:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="956484270"
X-IronPort-AV: E=Sophos;i="6.04,193,1695711600"; 
   d="scan'208";a="956484270"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 13 Jan 2024 19:21:28 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOr3u-000B9I-1R;
	Sun, 14 Jan 2024 03:21:26 +0000
Date: Sun, 14 Jan 2024 11:20:35 +0800
From: kernel test robot <lkp@intel.com>
To: Steve Jeong <how2soft@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Dongjin Kim <tobetter@gmail.com>, linux-doc@vger.kernel.org
Subject: [tobetter:odroid-6.1.y 1/84] drivers/char/rk3568-gpiomem.c:2:
 warning: This comment starts with '/**', but isn't a kernel-doc comment.
 Refer Documentation/doc-guide/kernel-doc.rst
Message-ID: <202401141148.UUGFAYJe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Steve,

FYI, the error/warning still remains.

tree:   https://github.com/tobetter/linux odroid-6.1.y
head:   b0ba08f75cf1fc43c19f57ea6930f3358bd2e196
commit: 161dee9509736facbf1906dd1005e70e240389fa [1/84] ODROID-M1: Add /dev/gpiomem device
config: arm-randconfig-004-20240114 (https://download.01.org/0day-ci/archive/20240114/202401141148.UUGFAYJe-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project 9bde5becb44ea071f5e1fa1f5d4071dc8788b18c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240114/202401141148.UUGFAYJe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401141148.UUGFAYJe-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/char/rk3568-gpiomem.c:2: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * GPIO memory device driver


vim +2 drivers/char/rk3568-gpiomem.c

   > 2	 * GPIO memory device driver
     3	 *
     4	 * Creates a chardev /dev/gpiomem which will provide user access to
     5	 * the rk3568's GPIO registers when it is mmap()'d.
     6	 * No longer need root for user GPIO access, but without relaxing permissions
     7	 * on /dev/mem.
     8	 *
     9	 * Written by Luke Wren <luke@raspberrypi.org>
    10	 * Copyright (c) 2015, Raspberry Pi (Trading) Ltd.
    11	 *
    12	 * Redistribution and use in source and binary forms, with or without
    13	 * modification, are permitted provided that the following conditions
    14	 * are met:
    15	 * 1. Redistributions of source code must retain the above copyright
    16	 *    notice, this list of conditions, and the following disclaimer,
    17	 *    without modification.
    18	 * 2. Redistributions in binary form must reproduce the above copyright
    19	 *    notice, this list of conditions and the following disclaimer in the
    20	 *    documentation and/or other materials provided with the distribution.
    21	 * 3. The names of the above-listed copyright holders may not be used
    22	 *    to endorse or promote products derived from this software without
    23	 *    specific prior written permission.
    24	 *
    25	 * ALTERNATIVELY, this software may be distributed under the terms of the
    26	 * GNU General Public License ("GPL") version 2, as published by the Free
    27	 * Software Foundation.
    28	 *
    29	 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
    30	 * IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
    31	 * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
    32	 * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
    33	 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
    34	 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
    35	 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
    36	 * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
    37	 * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
    38	 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
    39	 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
    40	 */
    41	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
