Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D84C59171;
	Fri,  8 Mar 2024 19:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709925367; cv=none; b=cXDzlPiUmzoehT4z+ErUr5CMKtbLUCVADKklLKVTbeAwIYxNlMrrAfPapiLRpfMnWCthMyhJOZqh14QR6yiRqH3GIhnpsMxFcen7t9OuhbSJ3tk2XvUb5ld5uUe/HlNdB44S4lsuizMqO6HDVJCAnbT7Qe+cvmU1IFZCzlisY2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709925367; c=relaxed/simple;
	bh=2H8UNu4um6CbQi+/cSJpOEj9iX8gVgfwHxkHUqHmqLw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OsDJq0LGSXGtxQnDXxysWeHcr7arwKFSPAkSCkixj43ptgGqdu8MIRPOr4cZxc5WLYhz3CQoXCKY7kUrjmeKhcakgYEUKXP2iUUPb4H0MrWc39QsClhOzbSnhXH6NnmbAVofJQxtKC9wSTCWpXD3eveRjUqy/30+9CdHHIntrf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SLwgukBR; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SLwgukBR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709925363; x=1741461363;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2H8UNu4um6CbQi+/cSJpOEj9iX8gVgfwHxkHUqHmqLw=;
  b=SLwgukBRjdR4S1E71Fucvd7IyNuHPFzXn+HAr5Al3LHAKa9z3lkZ+dZk
   dxf9CHSDM9sgEckzk/PXN6J2fcEy/MCJEre++Op2PSgLqFPNSxw3A1EJO
   iXi3dXNC7St35UFMdA5KbdmaeVKY+jAtLQmW95wCPErQRR/wJy5QOul3U
   +7Qz4MInPs/5NVd7MOjz8BC97MQPKAfCY0mrYXG7m5opSOSMvi2+MRwVd
   6CC2V3U73PI7qF5CNEuKT6jp/F3j9SYsnBb39m1Zq1O7OKz8r71ewsTsX
   hmx67OYKGJgfuSCNTm+NBTiC1rexb7g3jOa76OnfqWcNiJlRzlEDMJ+Um
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11007"; a="4508700"
X-IronPort-AV: E=Sophos;i="6.07,110,1708416000"; 
   d="scan'208";a="4508700"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 11:16:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,110,1708416000"; 
   d="scan'208";a="15138518"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 08 Mar 2024 11:15:59 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rifhF-0006dZ-1h;
	Fri, 08 Mar 2024 19:15:57 +0000
Date: Sat, 9 Mar 2024 03:15:55 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Thibault <samuel.thibault@ens-lyon.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [char-misc:char-misc-next 63/70]
 drivers/accessibility/speakup/devsynth.c:111:3: warning: label at end of
 compound statement is a C23 extension
Message-ID: <202403090339.FWOVWpIL-lkp@intel.com>
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
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240309/202403090339.FWOVWpIL-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 503c55e17037436dcd45ac69dea8967e67e3f5e8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240309/202403090339.FWOVWpIL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403090339.FWOVWpIL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2188:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/accessibility/speakup/devsynth.c:7:
   In file included from drivers/accessibility/speakup/speakup.h:5:
   In file included from drivers/accessibility/speakup/spk_types.h:14:
   In file included from include/linux/vt_kern.h:12:
   In file included from include/linux/tty.h:12:
   In file included from include/linux/tty_port.h:5:
   In file included from include/linux/kfifo.h:42:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from drivers/accessibility/speakup/devsynth.c:7:
   In file included from drivers/accessibility/speakup/speakup.h:5:
   In file included from drivers/accessibility/speakup/spk_types.h:14:
   In file included from include/linux/vt_kern.h:12:
   In file included from include/linux/tty.h:12:
   In file included from include/linux/tty_port.h:5:
   In file included from include/linux/kfifo.h:42:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/accessibility/speakup/devsynth.c:7:
   In file included from drivers/accessibility/speakup/speakup.h:5:
   In file included from drivers/accessibility/speakup/spk_types.h:14:
   In file included from include/linux/vt_kern.h:12:
   In file included from include/linux/tty.h:12:
   In file included from include/linux/tty_port.h:5:
   In file included from include/linux/kfifo.h:42:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> drivers/accessibility/speakup/devsynth.c:111:3: warning: label at end of compound statement is a C23 extension [-Wc23-extensions]
     111 |                 }
         |                 ^
   18 warnings generated.


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
