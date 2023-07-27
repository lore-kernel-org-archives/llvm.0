Received: from mgamail.intel.com (unknown [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68065FBEF;
	Thu, 27 Jul 2023 09:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690450676; x=1721986676;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FbZpzQ1BBEni3dpBgEom4Ae/NvmcXhfPSy1l5qubcrs=;
  b=CyP1q4FI15w0Ew7wTTY0lWlG89c+2SlIx9kDwsYRKgQvIhDlYUI50RaA
   m7j+D7BaHHycdv7upg6Aetpke/nI2Z9NIxDoXso1WW70ip290r21zqsoS
   mOp7/8VNSGHAMSTa0XwKzliZuAcxc6mvctBNKTproyFyQgoSWcu3ZyBhB
   DZXdLqslvOfi7VP58StvXGeynvzxUrw4aZn+uITMzgvvuEe8zPtdih8ak
   A3IdFbzjl6lVCp9OEwlVol3Dhq3sv9K4YlAv0gXT9hrEojhskySQZaGhT
   VjHvk34mj75UmxVelP7SvrQnHev5I3V39uYVxjBQ3DklDvz6HD6rRWc1U
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="370937234"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="370937234"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 02:37:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="900832275"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="900832275"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 27 Jul 2023 02:37:54 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOxQ2-00028n-2v;
	Thu, 27 Jul 2023 09:36:54 +0000
Date: Thu, 27 Jul 2023 17:29:37 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 61/98] drivers/tty/tty_buffer.c:325:14: warning:
 comparison of distinct pointer types ('typeof (size - copied) *' (aka
 'unsigned int *') and 'typeof ((((((1UL) << 12) - sizeof(struct tty_buffer))
 / 2) & ~255)) *' (aka 'unsigned long *'))
Message-ID: <202307271754.XqkY0zbe-lkp@intel.com>
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
config: i386-buildonly-randconfig-r004-20230727 (https://download.01.org/0day-ci/archive/20230727/202307271754.XqkY0zbe-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230727/202307271754.XqkY0zbe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307271754.XqkY0zbe-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/tty/tty_buffer.c:325:14: warning: comparison of distinct pointer types ('typeof (size - copied) *' (aka 'unsigned int *') and 'typeof ((((((1UL) << 12) - sizeof(struct tty_buffer)) / 2) & ~255)) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
                   int goal = min(size - copied, TTY_BUFFER_PAGE);
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:67:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:36:24: note: expanded from macro '__careful_cmp'
           __builtin_choose_expr(__safe_cmp(x, y), \
                                 ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:26:4: note: expanded from macro '__safe_cmp'
                   (__typecheck(x, y) && __no_side_effects(x, y))
                    ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:20:28: note: expanded from macro '__typecheck'
           (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
                      ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
   drivers/tty/tty_buffer.c:363:14: warning: comparison of distinct pointer types ('typeof (size - copied) *' (aka 'unsigned int *') and 'typeof ((((((1UL) << 12) - sizeof(struct tty_buffer)) / 2) & ~255)) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
                   int goal = min(size - copied, TTY_BUFFER_PAGE);
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:67:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:36:24: note: expanded from macro '__careful_cmp'
           __builtin_choose_expr(__safe_cmp(x, y), \
                                 ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:26:4: note: expanded from macro '__safe_cmp'
                   (__typecheck(x, y) && __no_side_effects(x, y))
                    ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:20:28: note: expanded from macro '__typecheck'
           (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
                      ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
   2 warnings generated.


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
