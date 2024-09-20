Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB6B1F951;
	Fri, 20 Sep 2024 04:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726807822; cv=none; b=A5SzrD6fduCoHAlJiUvsi345c3LnCs0FKyeAYI8c3zbKBHYfTfNusY9ubX7u1/x6Fjqdz9YDIKE4wgGSnFCh/ltfo3x+6w/LLvfQ+H9kaK/N3csf7Mb1tlb1RbRdv3KgzhkhDOUnC76EMfiBmQp/cFYzz18gXfz9ASf6YL4CUDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726807822; c=relaxed/simple;
	bh=6E8cL8FKa3ivxWtflBs9LeHMSoiTBeiAJKQ6x68RAR0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SKkZV3nn2wQ/rvmhk+spVyEa6A7NHNMJYkJzxz/Gtg4GAZWhVv6V9QpdRxOFYVgmAaFC/eOeRlTglY9VUBTQVtx+zy5aSdB+dk9jNLi23eAYD93qC52zIAlbAUnDaO4pOC3qxtMs54/vaVwsO00PHSqDc5TBcWhsogDgWduxcqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CekfqDdI; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CekfqDdI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726807820; x=1758343820;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6E8cL8FKa3ivxWtflBs9LeHMSoiTBeiAJKQ6x68RAR0=;
  b=CekfqDdIYSpue9vm6ogxijy1/K8+KDVPH0ofVWu6qJ0Qlzv0Rt42GTi9
   lpB0wHM5hR3PiJqszYJy6RZja9K6RZNOryPGH+WzVoSD0qZUKO8U0xAXK
   zFjFNdiRT2im5EnmTEUt5pNvsF2b9SLbXRHm7LkhYuHgu34n4Mv+3RoZ3
   LEpsp4tQQ0+jne0x5SWukw8yfWaaHY8vPG4Lrg/wcKxWrIV+nyyUQg2jg
   Q0MsNOAjWnBDBp3jYhWmsfr+s6O+d1cZTuIvUlWSV5CBaucRmJ5BT0ewI
   7RSexNkIGxG0vEmGGcaOvWunYqkYvDdqADdPuMeiQvuj4Ys/6ddPR9OTc
   Q==;
X-CSE-ConnectionGUID: x+aL7JY5SA2vb18YWj2nIQ==
X-CSE-MsgGUID: feghh2HlQLGxBSedZMwDvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="25947506"
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; 
   d="scan'208";a="25947506"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2024 21:50:20 -0700
X-CSE-ConnectionGUID: 6D9qTGbTTV6sPRzTbgnUzg==
X-CSE-MsgGUID: QYNRjVVbRF+MS6w/ARxg5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; 
   d="scan'208";a="101000069"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 19 Sep 2024 21:50:18 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1srVax-000Dye-2p;
	Fri, 20 Sep 2024 04:50:15 +0000
Date: Fri, 20 Sep 2024 12:50:08 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-remove-absolute-percpu 4/5] scripts/kallsyms.c:479:5:
 error: call to undeclared function 'symbol_absolute'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202409201256.WLAe87H8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-remove-absolute-percpu
head:   67e86d7019bb6713f5e8a2a2d46a42dd4f56720e
commit: 664e6ea70ed0b9558e678dd5d293978eda4d642e [4/5] scripts/kallsyms: Remove support for absolute per-CPU variables
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20240920/202409201256.WLAe87H8-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240920/202409201256.WLAe87H8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409201256.WLAe87H8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> scripts/kallsyms.c:479:5: error: call to undeclared function 'symbol_absolute'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     479 |                                 symbol_absolute(table[i]) ? "absolute" : "relative",
         |                                 ^
   1 error generated.
   make[3]: *** [scripts/Makefile.host:116: scripts/kallsyms] Error 1
   make[3]: Target 'scripts/' not remade because of errors.
   make[2]: *** [Makefile:1178: scripts] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:224: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:224: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/symbol_absolute +479 scripts/kallsyms.c

60443c88f3a89f Zhen Lei        2022-11-02  360  
b3dbb4ecd46767 Paulo Marques   2005-09-06  361  static void write_src(void)
^1da177e4c3f41 Linus Torvalds  2005-04-16  362  {
b3dbb4ecd46767 Paulo Marques   2005-09-06  363  	unsigned int i, k, off;
^1da177e4c3f41 Linus Torvalds  2005-04-16  364  	unsigned int best_idx[256];
bde6fb37bbc3a4 Masahiro Yamada 2024-07-20  365  	unsigned int *markers, markers_cnt;
9281acea6a3687 Tejun Heo       2007-07-17  366  	char buf[KSYM_NAME_LEN];
^1da177e4c3f41 Linus Torvalds  2005-04-16  367  
500193ec57fddf Masahiro Yamada 2019-02-04  368  	printf("#include <asm/bitsperlong.h>\n");
^1da177e4c3f41 Linus Torvalds  2005-04-16  369  	printf("#if BITS_PER_LONG == 64\n");
^1da177e4c3f41 Linus Torvalds  2005-04-16  370  	printf("#define PTR .quad\n");
72d3ebb929de33 Mathias Krause  2018-12-30  371  	printf("#define ALGN .balign 8\n");
^1da177e4c3f41 Linus Torvalds  2005-04-16  372  	printf("#else\n");
^1da177e4c3f41 Linus Torvalds  2005-04-16  373  	printf("#define PTR .long\n");
72d3ebb929de33 Mathias Krause  2018-12-30  374  	printf("#define ALGN .balign 4\n");
^1da177e4c3f41 Linus Torvalds  2005-04-16  375  	printf("#endif\n");
^1da177e4c3f41 Linus Torvalds  2005-04-16  376  
aad094701c6355 Jan Beulich     2006-12-08  377  	printf("\t.section .rodata, \"a\"\n");
^1da177e4c3f41 Linus Torvalds  2005-04-16  378  
^1da177e4c3f41 Linus Torvalds  2005-04-16  379  	output_label("kallsyms_num_syms");
80ffbaa5b1bd98 Jan Beulich     2018-09-03  380  	printf("\t.long\t%u\n", table_cnt);
^1da177e4c3f41 Linus Torvalds  2005-04-16  381  	printf("\n");
^1da177e4c3f41 Linus Torvalds  2005-04-16  382  
^1da177e4c3f41 Linus Torvalds  2005-04-16  383  	/* table of offset markers, that give the offset in the compressed stream
^1da177e4c3f41 Linus Torvalds  2005-04-16  384  	 * every 256 symbols */
bde6fb37bbc3a4 Masahiro Yamada 2024-07-20  385  	markers_cnt = (table_cnt + 255) / 256;
bde6fb37bbc3a4 Masahiro Yamada 2024-07-20  386  	markers = malloc(sizeof(*markers) * markers_cnt);
f1a136e0d098a4 Jesper Juhl     2006-03-25  387  	if (!markers) {
f1a136e0d098a4 Jesper Juhl     2006-03-25  388  		fprintf(stderr, "kallsyms failure: "
f1a136e0d098a4 Jesper Juhl     2006-03-25  389  			"unable to allocate required memory\n");
f1a136e0d098a4 Jesper Juhl     2006-03-25  390  		exit(EXIT_FAILURE);
f1a136e0d098a4 Jesper Juhl     2006-03-25  391  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  392  
^1da177e4c3f41 Linus Torvalds  2005-04-16  393  	output_label("kallsyms_names");
^1da177e4c3f41 Linus Torvalds  2005-04-16  394  	off = 0;
b3dbb4ecd46767 Paulo Marques   2005-09-06  395  	for (i = 0; i < table_cnt; i++) {
b3dbb4ecd46767 Paulo Marques   2005-09-06  396  		if ((i & 0xFF) == 0)
b3dbb4ecd46767 Paulo Marques   2005-09-06  397  			markers[i >> 8] = off;
60443c88f3a89f Zhen Lei        2022-11-02  398  		table[i]->seq = i;
^1da177e4c3f41 Linus Torvalds  2005-04-16  399  
73bbb94466fd3f Miguel Ojeda    2021-04-05  400  		/* There cannot be any symbol of length zero. */
73bbb94466fd3f Miguel Ojeda    2021-04-05  401  		if (table[i]->len == 0) {
73bbb94466fd3f Miguel Ojeda    2021-04-05  402  			fprintf(stderr, "kallsyms failure: "
73bbb94466fd3f Miguel Ojeda    2021-04-05  403  				"unexpected zero symbol length\n");
73bbb94466fd3f Miguel Ojeda    2021-04-05  404  			exit(EXIT_FAILURE);
73bbb94466fd3f Miguel Ojeda    2021-04-05  405  		}
73bbb94466fd3f Miguel Ojeda    2021-04-05  406  
73bbb94466fd3f Miguel Ojeda    2021-04-05  407  		/* Only lengths that fit in up-to-two-byte ULEB128 are supported. */
73bbb94466fd3f Miguel Ojeda    2021-04-05  408  		if (table[i]->len > 0x3FFF) {
73bbb94466fd3f Miguel Ojeda    2021-04-05  409  			fprintf(stderr, "kallsyms failure: "
73bbb94466fd3f Miguel Ojeda    2021-04-05  410  				"unexpected huge symbol length\n");
73bbb94466fd3f Miguel Ojeda    2021-04-05  411  			exit(EXIT_FAILURE);
73bbb94466fd3f Miguel Ojeda    2021-04-05  412  		}
73bbb94466fd3f Miguel Ojeda    2021-04-05  413  
73bbb94466fd3f Miguel Ojeda    2021-04-05  414  		/* Encode length with ULEB128. */
73bbb94466fd3f Miguel Ojeda    2021-04-05  415  		if (table[i]->len <= 0x7F) {
73bbb94466fd3f Miguel Ojeda    2021-04-05  416  			/* Most symbols use a single byte for the length. */
8d60526999aace Masahiro Yamada 2020-02-02  417  			printf("\t.byte 0x%02x", table[i]->len);
73bbb94466fd3f Miguel Ojeda    2021-04-05  418  			off += table[i]->len + 1;
73bbb94466fd3f Miguel Ojeda    2021-04-05  419  		} else {
73bbb94466fd3f Miguel Ojeda    2021-04-05  420  			/* "Big" symbols use two bytes. */
73bbb94466fd3f Miguel Ojeda    2021-04-05  421  			printf("\t.byte 0x%02x, 0x%02x",
73bbb94466fd3f Miguel Ojeda    2021-04-05  422  				(table[i]->len & 0x7F) | 0x80,
73bbb94466fd3f Miguel Ojeda    2021-04-05  423  				(table[i]->len >> 7) & 0x7F);
73bbb94466fd3f Miguel Ojeda    2021-04-05  424  			off += table[i]->len + 2;
73bbb94466fd3f Miguel Ojeda    2021-04-05  425  		}
8d60526999aace Masahiro Yamada 2020-02-02  426  		for (k = 0; k < table[i]->len; k++)
8d60526999aace Masahiro Yamada 2020-02-02  427  			printf(", 0x%02x", table[i]->sym[k]);
^1da177e4c3f41 Linus Torvalds  2005-04-16  428  
dd1553b8a5f2ef Masahiro Yamada 2023-03-08  429  		/*
f9c3d671dd816e Masahiro Yamada 2024-07-20  430  		 * Now that we wrote out the compressed symbol name, restore the
f9c3d671dd816e Masahiro Yamada 2024-07-20  431  		 * original name and print it in the comment.
dd1553b8a5f2ef Masahiro Yamada 2023-03-08  432  		 */
dd1553b8a5f2ef Masahiro Yamada 2023-03-08  433  		expand_symbol(table[i]->sym, table[i]->len, buf);
dd1553b8a5f2ef Masahiro Yamada 2023-03-08  434  		strcpy((char *)table[i]->sym, buf);
f9c3d671dd816e Masahiro Yamada 2024-07-20  435  		printf("\t/* %s */\n", table[i]->sym);
dd1553b8a5f2ef Masahiro Yamada 2023-03-08  436  	}
f9c3d671dd816e Masahiro Yamada 2024-07-20  437  	printf("\n");
dd1553b8a5f2ef Masahiro Yamada 2023-03-08  438  
^1da177e4c3f41 Linus Torvalds  2005-04-16  439  	output_label("kallsyms_markers");
bde6fb37bbc3a4 Masahiro Yamada 2024-07-20  440  	for (i = 0; i < markers_cnt; i++)
80ffbaa5b1bd98 Jan Beulich     2018-09-03  441  		printf("\t.long\t%u\n", markers[i]);
^1da177e4c3f41 Linus Torvalds  2005-04-16  442  	printf("\n");
^1da177e4c3f41 Linus Torvalds  2005-04-16  443  
^1da177e4c3f41 Linus Torvalds  2005-04-16  444  	free(markers);
^1da177e4c3f41 Linus Torvalds  2005-04-16  445  
^1da177e4c3f41 Linus Torvalds  2005-04-16  446  	output_label("kallsyms_token_table");
^1da177e4c3f41 Linus Torvalds  2005-04-16  447  	off = 0;
^1da177e4c3f41 Linus Torvalds  2005-04-16  448  	for (i = 0; i < 256; i++) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  449  		best_idx[i] = off;
^1da177e4c3f41 Linus Torvalds  2005-04-16  450  		expand_symbol(best_table[i], best_table_len[i], buf);
^1da177e4c3f41 Linus Torvalds  2005-04-16  451  		printf("\t.asciz\t\"%s\"\n", buf);
^1da177e4c3f41 Linus Torvalds  2005-04-16  452  		off += strlen(buf) + 1;
^1da177e4c3f41 Linus Torvalds  2005-04-16  453  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  454  	printf("\n");
^1da177e4c3f41 Linus Torvalds  2005-04-16  455  
^1da177e4c3f41 Linus Torvalds  2005-04-16  456  	output_label("kallsyms_token_index");
^1da177e4c3f41 Linus Torvalds  2005-04-16  457  	for (i = 0; i < 256; i++)
^1da177e4c3f41 Linus Torvalds  2005-04-16  458  		printf("\t.short\t%d\n", best_idx[i]);
^1da177e4c3f41 Linus Torvalds  2005-04-16  459  	printf("\n");
404bad70fcf7cb Masahiro Yamada 2023-03-08  460  
404bad70fcf7cb Masahiro Yamada 2023-03-08  461  	output_label("kallsyms_offsets");
404bad70fcf7cb Masahiro Yamada 2023-03-08  462  
404bad70fcf7cb Masahiro Yamada 2023-03-08  463  	for (i = 0; i < table_cnt; i++) {
404bad70fcf7cb Masahiro Yamada 2023-03-08  464  		/*
404bad70fcf7cb Masahiro Yamada 2023-03-08  465  		 * Use the offset relative to the lowest value
404bad70fcf7cb Masahiro Yamada 2023-03-08  466  		 * encountered of all relative symbols, and emit
404bad70fcf7cb Masahiro Yamada 2023-03-08  467  		 * non-relocatable fixed offsets that will be fixed
404bad70fcf7cb Masahiro Yamada 2023-03-08  468  		 * up at runtime.
404bad70fcf7cb Masahiro Yamada 2023-03-08  469  		 */
404bad70fcf7cb Masahiro Yamada 2023-03-08  470  
404bad70fcf7cb Masahiro Yamada 2023-03-08  471  		long long offset;
404bad70fcf7cb Masahiro Yamada 2023-03-08  472  		int overflow;
404bad70fcf7cb Masahiro Yamada 2023-03-08  473  
404bad70fcf7cb Masahiro Yamada 2023-03-08  474  		offset = table[i]->addr - relative_base;
404bad70fcf7cb Masahiro Yamada 2023-03-08  475  		overflow = (offset < 0 || offset > UINT_MAX);
404bad70fcf7cb Masahiro Yamada 2023-03-08  476  		if (overflow) {
404bad70fcf7cb Masahiro Yamada 2023-03-08  477  			fprintf(stderr, "kallsyms failure: "
404bad70fcf7cb Masahiro Yamada 2023-03-08  478  				"%s symbol value %#llx out of range in relative mode\n",
404bad70fcf7cb Masahiro Yamada 2023-03-08 @479  				symbol_absolute(table[i]) ? "absolute" : "relative",
404bad70fcf7cb Masahiro Yamada 2023-03-08  480  				table[i]->addr);
404bad70fcf7cb Masahiro Yamada 2023-03-08  481  			exit(EXIT_FAILURE);
404bad70fcf7cb Masahiro Yamada 2023-03-08  482  		}
b07e1810094041 Masahiro Yamada 2024-07-20  483  		printf("\t.long\t%#x\t/* %s */\n", (int)offset, table[i]->sym);
404bad70fcf7cb Masahiro Yamada 2023-03-08  484  	}
404bad70fcf7cb Masahiro Yamada 2023-03-08  485  	printf("\n");
404bad70fcf7cb Masahiro Yamada 2023-03-08  486  
404bad70fcf7cb Masahiro Yamada 2023-03-08  487  	output_label("kallsyms_relative_base");
404bad70fcf7cb Masahiro Yamada 2023-03-08  488  	output_address(relative_base);
404bad70fcf7cb Masahiro Yamada 2023-03-08  489  	printf("\n");
404bad70fcf7cb Masahiro Yamada 2023-03-08  490  
404bad70fcf7cb Masahiro Yamada 2023-03-08  491  	sort_symbols_by_name();
404bad70fcf7cb Masahiro Yamada 2023-03-08  492  	output_label("kallsyms_seqs_of_names");
404bad70fcf7cb Masahiro Yamada 2023-03-08  493  	for (i = 0; i < table_cnt; i++)
f9c3d671dd816e Masahiro Yamada 2024-07-20  494  		printf("\t.byte 0x%02x, 0x%02x, 0x%02x\t/* %s */\n",
404bad70fcf7cb Masahiro Yamada 2023-03-08  495  			(unsigned char)(table[i]->seq >> 16),
404bad70fcf7cb Masahiro Yamada 2023-03-08  496  			(unsigned char)(table[i]->seq >> 8),
f9c3d671dd816e Masahiro Yamada 2024-07-20  497  			(unsigned char)(table[i]->seq >> 0),
f9c3d671dd816e Masahiro Yamada 2024-07-20  498  		       table[i]->sym);
404bad70fcf7cb Masahiro Yamada 2023-03-08  499  	printf("\n");
^1da177e4c3f41 Linus Torvalds  2005-04-16  500  }
^1da177e4c3f41 Linus Torvalds  2005-04-16  501  

:::::: The code at line 479 was first introduced by commit
:::::: 404bad70fcf7cb1a36198581e6904637f3c36846 scripts/kallsyms: change the output order

:::::: TO: Masahiro Yamada <masahiroy@kernel.org>
:::::: CC: Masahiro Yamada <masahiroy@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
