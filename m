Received: from mgamail.intel.com (unknown [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F87515499;
	Thu, 27 Jul 2023 10:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690452627; x=1721988627;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w15eqO8ix5dyezLLr8V0Y2/HfTZqBlKzK9E4unwFW+I=;
  b=nAoOMj6PFQROEVekwWUWRpOOho1k902wcLf6MqgTG3kEeCk6ptvqTh0H
   3W7clnwDAxYb8QN3TbBxBjdnEMkRBzHQbKkkRFr+JG8COCa+PhWHg/m0m
   xZcDDbOGCKMsdgEjyuzTRcea50zhgKmM837Av5S6kTsSfXyT7y18s4dEv
   02ZvZagcxncU92KAir1cnR2iZ8ktX62D0jl0mavj1saOKp3iGynKYDX3v
   m+A0dGKXW9eFpxd80E9adGJ7YW0Ak/IC6PUaqNa5BXqWxMqDKaVujMAHH
   LrVQ5bB05olMNsudvQ6yq41oS0xwNQ/0q5+fTGspXb5xhJbUvSPEH0n5W
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="358270188"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="358270188"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 03:02:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="870292798"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 27 Jul 2023 03:02:37 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOxod-00029x-36;
	Thu, 27 Jul 2023 10:02:05 +0000
Date: Thu, 27 Jul 2023 18:01:11 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 61/98] drivers/tty/tty_buffer.c:325:14: warning:
 comparison of distinct pointer types ('typeof (size - copied) *' (aka
 'unsigned int *') and 'typeof (((((1UL << 18) - sizeof(struct tty_buffer)) /
 2) & ~255)) *' (aka 'unsigned long *'))
Message-ID: <202307271740.14PYVBMD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   2400f7abb9deab7a2207b19d1fad47d9910077a9
commit: 58dea2bfdf65b65a29a79d6227bff708ea95dc7c [61/98] tty: tty_buffer: use min() instead of min_t()
config: hexagon-randconfig-r041-20230727 (https://download.01.org/0day-ci/archive/20230727/202307271740.14PYVBMD-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230727/202307271740.14PYVBMD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307271740.14PYVBMD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/tty/tty_buffer.c:9:
   In file included from include/linux/tty.h:12:
   In file included from include/linux/tty_port.h:5:
   In file included from include/linux/kfifo.h:42:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/tty/tty_buffer.c:9:
   In file included from include/linux/tty.h:12:
   In file included from include/linux/tty_port.h:5:
   In file included from include/linux/kfifo.h:42:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/tty/tty_buffer.c:9:
   In file included from include/linux/tty.h:12:
   In file included from include/linux/tty_port.h:5:
   In file included from include/linux/kfifo.h:42:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> drivers/tty/tty_buffer.c:325:14: warning: comparison of distinct pointer types ('typeof (size - copied) *' (aka 'unsigned int *') and 'typeof (((((1UL << 18) - sizeof(struct tty_buffer)) / 2) & ~255)) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
     325 |                 int goal = min(size - copied, TTY_BUFFER_PAGE);
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:67:19: note: expanded from macro 'min'
      67 | #define min(x, y)       __careful_cmp(x, y, <)
         |                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:36:24: note: expanded from macro '__careful_cmp'
      36 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |                               ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:26:4: note: expanded from macro '__safe_cmp'
      26 |                 (__typecheck(x, y) && __no_side_effects(x, y))
         |                  ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:20:28: note: expanded from macro '__typecheck'
      20 |         (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
         |                    ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
   drivers/tty/tty_buffer.c:363:14: warning: comparison of distinct pointer types ('typeof (size - copied) *' (aka 'unsigned int *') and 'typeof (((((1UL << 18) - sizeof(struct tty_buffer)) / 2) & ~255)) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
     363 |                 int goal = min(size - copied, TTY_BUFFER_PAGE);
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:67:19: note: expanded from macro 'min'
      67 | #define min(x, y)       __careful_cmp(x, y, <)
         |                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:36:24: note: expanded from macro '__careful_cmp'
      36 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |                               ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:26:4: note: expanded from macro '__safe_cmp'
      26 |                 (__typecheck(x, y) && __no_side_effects(x, y))
         |                  ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:20:28: note: expanded from macro '__typecheck'
      20 |         (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
         |                    ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
   8 warnings generated.


vim +325 drivers/tty/tty_buffer.c

   305	
   306	/**
   307	 * tty_insert_flip_string_fixed_flag - add characters to the tty buffer
   308	 * @port: tty port
   309	 * @chars: characters
   310	 * @flag: flag value for each character
   311	 * @size: size
   312	 *
   313	 * Queue a series of bytes to the tty buffering. All the characters passed are
   314	 * marked with the supplied flag.
   315	 *
   316	 * Returns: the number added.
   317	 */
   318	int tty_insert_flip_string_fixed_flag(struct tty_port *port, const u8 *chars,
   319					      u8 flag, size_t size)
   320	{
   321		int copied = 0;
   322		bool flags = flag != TTY_NORMAL;
   323	
   324		do {
 > 325			int goal = min(size - copied, TTY_BUFFER_PAGE);
   326			int space = __tty_buffer_request_room(port, goal, flags);
   327			struct tty_buffer *tb = port->buf.tail;
   328	
   329			if (unlikely(space == 0))
   330				break;
   331			memcpy(char_buf_ptr(tb, tb->used), chars, space);
   332			if (tb->flags)
   333				memset(flag_buf_ptr(tb, tb->used), flag, space);
   334			tb->used += space;
   335			copied += space;
   336			chars += space;
   337			/* There is a small chance that we need to split the data over
   338			 * several buffers. If this is the case we must loop.
   339			 */
   340		} while (unlikely(size > copied));
   341		return copied;
   342	}
   343	EXPORT_SYMBOL(tty_insert_flip_string_fixed_flag);
   344	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
