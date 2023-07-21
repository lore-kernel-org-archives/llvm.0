Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80585F9C6;
	Fri, 21 Jul 2023 22:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689977069; x=1721513069;
  h=date:from:cc:subject:message-id:mime-version;
  bh=TedFI6BZWw0omztDPhheTuUk9v3QRMkBihapKTuqEi0=;
  b=DBOSw4fTT5MatkZsEHD031p7+v7iuDF1iBoFYQ1VNFwjB6XwT4vtnsvd
   1N1SLy//7vspk17ghILeCloBhlgdvLI/Qpj3yspvANNKT0grXT8d/dZMV
   CTwB7nxSFQu6yNedM/fNY3S3bCqZcIRzHC8ibLUkYQajynyL6v6HfXva9
   M/1FhWMWzxpflP+dkOBTomf189jJQPP8TeSMIiSRXS+yfcDgf7LBF5Y4F
   GDZvW/45RBK7XtCUPbtgjGPZq95rHfHpW2BV0NNiWHIlmMXn0zgphW90+
   auwwUpB870STxRlIQjZa4SiPzn3GXODGmw2rs5aSV1B1E2+mqpDuh/IXW
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="430919252"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; 
   d="scan'208";a="430919252"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2023 15:04:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="718995837"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; 
   d="scan'208";a="718995837"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 21 Jul 2023 15:04:27 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMyEU-0007hZ-13;
	Fri, 21 Jul 2023 22:04:19 +0000
Date: Sat, 22 Jul 2023 06:03:33 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [stable:linux-5.15.y 127/9999] vmlinux.o: warning: objtool:
 crc_pcl()+0x78: missing int3 after indirect jump
Message-ID: <202307220541.Iyq4Zzxz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Peter Zijlstra <peterz@infradead.org>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Borislav Petkov <bp@suse.de>
CC: Sasha Levin <sashal@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
head:   d54cfc420586425d418a53871290cc4a59d33501
commit: 370d33da35e31c1544eb77bcf2539f09b1064b9c [127/9999] x86: Add straight-line-speculation mitigation
config: x86_64-randconfig-x013-20230719 (https://download.01.org/0day-ci/archive/20230722/202307220541.Iyq4Zzxz-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230722/202307220541.Iyq4Zzxz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307220541.Iyq4Zzxz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: crc_pcl()+0x78: missing int3 after indirect jump
   vmlinux.o: warning: objtool: .altinstr_replacement+0x1ac: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x1c4: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x253: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x2a7: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x2c7: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x2d3: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x2f8: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x304: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x854: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xa3b: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xaf1: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x103a: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x1318: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x16a5: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x1af4: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x1b00: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x1ec3: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x1eec: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x202a: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x20ba: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x20c7: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x20f7: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x211b: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x2230: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x2634: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x2805: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x2824: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x2faf: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x32e1: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x3311: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x33d5: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x387e: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x3b6b: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x3bd0: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x3df4: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x449f: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x4ab7: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x4ae8: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x4b2e: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x4c54: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x4ca8: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x4cc0: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x4cd8: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x4cf5: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x4d01: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x4d63: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x4e1e: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x4f51: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x52a2: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x52c6: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x52de: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x57a8: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x57b3: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x57cb: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x592b: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x5973: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x59b2: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x5a59: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x5d32: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x615b: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x671b: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x6733: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x6993: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x6a9d: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x6df5: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x6f71: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x70a3: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x70e6: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x7394: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x73b4: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x73f9: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x7a71: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x7ae9: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x8387: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x8461: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x84db: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xb3b9: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xb44b: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xb633: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xb652: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xb66a: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xc492: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xd320: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x10cfa: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x10d2a: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x10dbb: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x110bd: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x12582: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x125bd: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x12661: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x1305f: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x130bf: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x14414: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x1667e: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x17916: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x17c61: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x17cab: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x17cff: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x18126: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x18d89: redundant UACCESS disable


objdump-func vmlinux.o crc_pcl:
0000 000000000002dbe0 <crc_pcl>:
0000    2dbe0:	53                   	push   %rbx
0001    2dbe1:	57                   	push   %rdi
0002    2dbe2:	56                   	push   %rsi
0003    2dbe3:	49 89 d0             	mov    %rdx,%r8
0006    2dbe6:	48 89 f9             	mov    %rdi,%rcx
0009    2dbe9:	48 f7 df             	neg    %rdi
000c    2dbec:	48 83 e7 07          	and    $0x7,%rdi
0010    2dbf0:	74 26                	je     2dc18 <proc_block>
0012    2dbf2:	48 83 fe 08          	cmp    $0x8,%rsi
0016    2dbf6:	73 08                	jae    2dc00 <do_align>
0018    2dbf8:	c1 e6 1e             	shl    $0x1e,%esi
001b    2dbfb:	e9 7e 10 00 00       	jmp    2ec7e <less_than_8_post_shl1>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
