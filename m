Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAFB215B1;
	Sat,  9 Mar 2024 00:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709945532; cv=none; b=DAOZCgFalhUf+7Med6YZ4vPH65RYfpuNRG60m2syiVoVYzTXLvyOL6hFDpZJLMJEUHStJF5w07EmHXKR/rsx38Y1BMWbK59IqNlbNCfKncEShJXJSpsm50wcf4I2kfDAvdrIdkiBvHR4h1ShJd1rbLK7J+AYFT59qtl0zp8gMMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709945532; c=relaxed/simple;
	bh=YsnXlp45JQHxNXdfJvP/Th3nB6mx87kKWioF+/UbuaE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kWmqrojjN/uYc//1ZuwZzQsHQS+FF26OQ4FcMloeC+NQ4I0XcqF8fiZy4GerVPQ67QfeSocrnRruWB9HoNm+QpDCU37HSb9XiOyf4EWJutv4V02CZDTIJkGpRnvBu1TG/DElKwkmnGJYyUcmA3p5o6iAGRY4F5XxSuBvtKTOtMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bzkzvREn; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bzkzvREn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709945530; x=1741481530;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YsnXlp45JQHxNXdfJvP/Th3nB6mx87kKWioF+/UbuaE=;
  b=bzkzvREnPsF6SBGhgJUDmyCnHwV54qYfOie0HKL5Omc2ekYYyRN8cBiz
   uaTp+S5zSc5M6dBG+axgHHlMMHHFhjTC12R76vHbpHEOExQL2HiKhccez
   ktqbYefrlI1r8UoXknkQm5wPfdacy7AL6Ftoy0DBmOP/TfeNy5LpI63W9
   I7zNXjUK/q0KbOAwKFQFNDi15Eqt5MNTyrhVmDLs4trJJUd6gwbQnLHyD
   ZXYW4FxxXhK84Ylq+Bu8J4P/5fRG5bBCrmEixEh582sADtMdVzX024aI+
   Mj74d85WqyfCGLoxFpsjk7iLyUbZS8uJBNY2+6uf2/zuzh44dXlXBjxCP
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11007"; a="22206055"
X-IronPort-AV: E=Sophos;i="6.07,111,1708416000"; 
   d="scan'208";a="22206055"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 16:52:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,111,1708416000"; 
   d="scan'208";a="10623467"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 Mar 2024 16:52:08 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rikwX-0006q3-0s;
	Sat, 09 Mar 2024 00:52:05 +0000
Date: Sat, 9 Mar 2024 08:51:24 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Thibault <samuel.thibault@ens-lyon.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [char-misc:char-misc-next 63/70]
 drivers/accessibility/speakup/devsynth.c:111:3: error: expected statement
Message-ID: <202403090806.3HFrQABh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git char-misc-next
head:   367b3560e10bbae3660d8ba4d0a7cc92170d8398
commit: 807977260ae4de1cf39cfc55713fc0bc56566f7a [63/70] speakup: Add /dev/synthu device
config: arm-randconfig-001-20240309 (https://download.01.org/0day-ci/archive/20240309/202403090806.3HFrQABh-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240309/202403090806.3HFrQABh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403090806.3HFrQABh-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/accessibility/speakup/devsynth.c:111:3: error: expected statement
                   }
                   ^
   1 error generated.


vim +111 drivers/accessibility/speakup/devsynth.c

    37	
    38	/* UTF-8 version */
    39	static ssize_t speakup_file_writeu(struct file *fp, const char __user *buffer,
    40					   size_t nbytes, loff_t *ppos)
    41	{
    42		size_t count = nbytes, want;
    43		const char __user *ptr = buffer;
    44		size_t bytes;
    45		unsigned long flags;
    46		unsigned char buf[256];
    47		u16 ubuf[256];
    48		size_t in, in2, out;
    49	
    50		if (!synth)
    51			return -ENODEV;
    52	
    53		want = 1;
    54		while (count >= want) {
    55			/* Copy some UTF-8 piece from userland */
    56			bytes = min(count, sizeof(buf));
    57			if (copy_from_user(buf, ptr, bytes))
    58				return -EFAULT;
    59	
    60			/* Convert to u16 */
    61			for (in = 0, out = 0; in < bytes; in++) {
    62				unsigned char c = buf[in];
    63				int nbytes = 8 - fls(c ^ 0xff);
    64				u32 value;
    65	
    66				switch (nbytes) {
    67				case 8: /* 0xff */
    68				case 7: /* 0xfe */
    69				case 1: /* 0x80 */
    70					/* Invalid, drop */
    71					goto drop;
    72	
    73				case 0:
    74					/* ASCII, copy */
    75					ubuf[out++] = c;
    76					continue;
    77	
    78				default:
    79					/* 2..6-byte UTF-8 */
    80	
    81					if (bytes - in < nbytes) {
    82						/* We don't have it all yet, stop here
    83						 * and wait for the rest
    84						 */
    85						bytes = in;
    86						want = nbytes;
    87						continue;
    88					}
    89	
    90					/* First byte */
    91					value = c & ((1u << (7 - nbytes)) - 1);
    92	
    93					/* Other bytes */
    94					for (in2 = 2; in2 <= nbytes; in2++) {
    95						c = buf[in + 1];
    96						if ((c & 0xc0) != 0x80)	{
    97							/* Invalid, drop the head */
    98							want = 1;
    99							goto drop;
   100						}
   101						value = (value << 6) | (c & 0x3f);
   102						in++;
   103					}
   104	
   105					if (value < 0x10000)
   106						ubuf[out++] = value;
   107					want = 1;
   108					break;
   109				}
   110	drop:
 > 111			}
   112	
   113			count -= bytes;
   114			ptr += bytes;
   115	
   116			/* And speak this up */
   117			if (out) {
   118				spin_lock_irqsave(&speakup_info.spinlock, flags);
   119				for (in = 0; in < out; in++)
   120					synth_buffer_add(ubuf[in]);
   121				synth_start();
   122				spin_unlock_irqrestore(&speakup_info.spinlock, flags);
   123			}
   124		}
   125	
   126		return (ssize_t)(nbytes - count);
   127	}
   128	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
