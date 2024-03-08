Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB8E3BBE3;
	Fri,  8 Mar 2024 17:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709919122; cv=none; b=GmmHmd4Kb5BXm1NaPTr+O0g9DehfG7FJfPBiDgV/6DNvUtgRqQ7u0joe9RCYuz/r4YwMOdds8fpV7gbCIfqYc8iPeEP2fzsc79OLMSwHbhe6G4LUELmzYNGvWQU1DlaYeLoEmBGC/lkROjpYEd/naAlbaTxusgA1UmyO9MM5/7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709919122; c=relaxed/simple;
	bh=XCv9gfoTGr3MmK+OZwtqMysDfzCzJR9HuH+oBa6eqik=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kChFMbeoFKN2nDat/ZAe+TYopbtv0QOw5pl/UOSrcLM/OhvSyLBZcEYjntjozoCD58ZJL+a4fV4MdAeDZyHn9HuLIQHw5H2fZduJPxTMj04/lPg3RxvIrCHAZk5qpvrnLxGi5iSX3/xFuaOmAbiQNJOrKLgMucctja4WH2IWnM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ktxiD2Xd; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ktxiD2Xd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709919120; x=1741455120;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XCv9gfoTGr3MmK+OZwtqMysDfzCzJR9HuH+oBa6eqik=;
  b=ktxiD2XdZDv0R9Qat8E20RKrx1R2tNG1DaGcVMPo3wF+lIT7j8GE4WVp
   XNhjroIS2nwQmRH8vvmRh9HwcU//S07ILL/7ZL5VInatyenCyGTWB1E7k
   b/rrNdiJe4vucnyq4FBB/o9Quhg0IlYU5GdbscD5KmmN6rRnZd/HDARM/
   V23SxJeYJ03Rrprajv72NqNDC9s+QmbFvC1d+3wKR4LDRT1gaFIsrt1q2
   6TMcM9F231tmb7ZT0I1RLsYIKGD9nYNEFEN8Vx7TfoCzbzYZZr85oMij3
   7a2e7psn3SMvAa3XUJcKpdpE3CxYLZ1Xqk1Dzb/pbFKByOS7ZI9IyHlef
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11007"; a="7600576"
X-IronPort-AV: E=Sophos;i="6.07,110,1708416000"; 
   d="scan'208";a="7600576"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 09:31:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,110,1708416000"; 
   d="scan'208";a="10970671"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 08 Mar 2024 09:31:58 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rie4Z-0006Zv-2c;
	Fri, 08 Mar 2024 17:31:55 +0000
Date: Sat, 9 Mar 2024 01:31:49 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Thibault <samuel.thibault@ens-lyon.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [char-misc:char-misc-next 63/70]
 drivers/accessibility/speakup/devsynth.c:111:3: warning: label at end of
 compound statement is a C2x extension
Message-ID: <202403090122.cpUNsozM-lkp@intel.com>
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
config: i386-buildonly-randconfig-001-20240308 (https://download.01.org/0day-ci/archive/20240309/202403090122.cpUNsozM-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240309/202403090122.cpUNsozM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403090122.cpUNsozM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/accessibility/speakup/devsynth.c:111:3: warning: label at end of compound statement is a C2x extension [-Wc2x-extensions]
     111 |                 }
         |                 ^
   1 warning generated.


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
