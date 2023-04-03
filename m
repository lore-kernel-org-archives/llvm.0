Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50BCA7E;
	Mon,  3 Apr 2023 02:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680488867; x=1712024867;
  h=date:from:cc:subject:message-id:mime-version;
  bh=JtIs6Y1T9ECnqY+Bf3KT8RiAumErcpJdmZMfiPRfs0M=;
  b=RYcYv78PZfKWgoNqu795wVBKn4nkTPrNhdUox0HhQD6zZb1nEJDDmj22
   mmByqef82mwmp/uwpgzQ1xFbTZOrXoDUMzO/1wWYnyxa/5mRsaMIpo394
   pcFZ1lUR2vBr+B6O2WY7KPgQm+uWpUFsyB++JxVRSQRcK010kALN5AilC
   +lmUrvQfJwufEY1QXVjOth5+ykymoyVMsTc0Ae+IQ+WN2rdooRvx5igAA
   ZikqZofu7rfq3/EOailAZHsqJ2RtQBJV42WA7g9SZ8D5b7tfJMojUJggJ
   jHcd4xuBSj4YdlHj8TagdgjZa9HFGpdLokx3xI+vahUq3AHs6CIiUmV5Y
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="344346652"
X-IronPort-AV: E=Sophos;i="5.98,313,1673942400"; 
   d="scan'208";a="344346652"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2023 19:27:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="750331088"
X-IronPort-AV: E=Sophos;i="5.98,313,1673942400"; 
   d="scan'208";a="750331088"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 02 Apr 2023 19:27:44 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pj9v5-000NvZ-22;
	Mon, 03 Apr 2023 02:27:43 +0000
Date: Mon, 3 Apr 2023 10:26:49 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: fs/reiserfs/lbalance.o: warning: objtool:
 leaf_cut_from_buffer+0x1dba: stack state mismatch: cfa1=4+232 cfa2=4+248
Message-ID: <202304031059.sfcpF0gy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Kees Cook <keescook@chromium.org>

Hi Kees,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7e364e56293bb98cae1b55fd835f5991c4e96e7d
commit: 54d9469bc515dc5fcbc20eecbe19cea868b70d68 fortify: Add run-time WARN for cross-field memcpy()
date:   7 months ago
config: x86_64-randconfig-r005-20230403 (https://download.01.org/0day-ci/archive/20230403/202304031059.sfcpF0gy-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=54d9469bc515dc5fcbc20eecbe19cea868b70d68
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 54d9469bc515dc5fcbc20eecbe19cea868b70d68
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash fs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304031059.sfcpF0gy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/reiserfs/lbalance.o: warning: objtool: leaf_cut_from_buffer+0x1dba: stack state mismatch: cfa1=4+232 cfa2=4+248
   fs/reiserfs/lbalance.o: warning: objtool: leaf_copy_items_entirely+0xe58: stack state mismatch: cfa1=4+256 cfa2=4+248


objdump-func vmlinux.o leaf_cut_from_buffer:
0000 0000000000b37940 <leaf_cut_from_buffer>:
0000   b37940:	e8 00 00 00 00       	call   b37945 <leaf_cut_from_buffer+0x5>	b37941: R_X86_64_PLT32	__fentry__-0x4
0005   b37945:	55                   	push   %rbp
0006   b37946:	41 57                	push   %r15
0008   b37948:	41 56                	push   %r14
000a   b3794a:	41 55                	push   %r13
000c   b3794c:	41 54                	push   %r12
000e   b3794e:	53                   	push   %rbx
000f   b3794f:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
0016   b37956:	48 89 4c 24 28       	mov    %rcx,0x28(%rsp)
001b   b3795b:	41 89 d7             	mov    %edx,%r15d
001e   b3795e:	89 f5                	mov    %esi,%ebp
0020   b37960:	48 89 fb             	mov    %rdi,%rbx
0023   b37963:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
002d   b3796d:	e8 00 00 00 00       	call   b37972 <leaf_cut_from_buffer+0x32>	b3796e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0032   b37972:	48 89 9c 24 80 00 00 00 	mov    %rbx,0x80(%rsp)
003a   b3797a:	48 83 c3 08          	add    $0x8,%rbx
003e   b3797e:	48 89 d8             	mov    %rbx,%rax
0041   b37981:	48 c1 e8 03          	shr    $0x3,%rax
0045   b37985:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
004a   b3798a:	74 08                	je     b37994 <leaf_cut_from_buffer+0x54>
004c   b3798c:	48 89 df             	mov    %rbx,%rdi
004f   b3798f:	e8 00 00 00 00       	call   b37994 <leaf_cut_from_buffer+0x54>	b37990: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0054   b37994:	48 8b 03             	mov    (%rbx),%rax
0057   b37997:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
005c   b3799c:	4c 8d 68 28          	lea    0x28(%rax),%r13
0060   b379a0:	4c 89 e8             	mov    %r13,%rax
0063   b379a3:	48 c1 e8 03          	shr    $0x3,%rax
0067   b379a7:	48 89 44 24 68       	mov    %rax,0x68(%rsp)
006c   b379ac:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
0071   b379b1:	74 08                	je     b379bb <leaf_cut_from_buffer+0x7b>
0073   b379b3:	4c 89 ef             	mov    %r13,%rdi
0076   b379b6:	e8 00 00 00 00       	call   b379bb <leaf_cut_from_buffer+0x7b>	b379b7: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
007b   b379bb:	49 8b 5d 00          	mov    0x0(%r13),%rbx
007f   b379bf:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
0083   b379c3:	48 89 f8             	mov    %rdi,%rax
0086   b379c6:	48 c1 e8 03          	shr    $0x3,%rax
008a   b379ca:	42 8a 04 20          	mov    (%rax,%r12,1),%al
008e   b379ce:	84 c0                	test   %al,%al
0090   b379d0:	0f 85 ff 10 00 00    	jne    b38ad5 <leaf_cut_from_buffer+0x1195>
0096   b379d6:	0f b7 43 02          	movzwl 0x2(%rbx),%eax
009a   b379da:	48 89 44 24 78       	mov    %rax,0x78(%rsp)
009f   b379df:	48 89 6c 24 48       	mov    %rbp,0x48(%rsp)
00a4   b379e4:	48 63 c5             	movslq %ebp,%rax
00a7   b379e7:	48 89 84 24 a8 00 00 00 	mov    %rax,0xa8(%rsp)
00af   b379ef:	48 8d 2c 40          	lea    (%rax,%rax,2),%rbp
00b3   b379f3:	48 8d 04 eb          	lea    (%rbx,%rbp,8),%rax
00b7   b379f7:	48 83 c0 2e          	add    $0x2e,%rax
00bb   b379fb:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
00c0   b37a00:	4c 8d 34 eb          	lea    (%rbx,%rbp,8),%r14
00c4   b37a04:	49 83 c6 2f          	add    $0x2f,%r14
00c8   b37a08:	48 c1 e8 03          	shr    $0x3,%rax
00cc   b37a0c:	48 89 44 24 70       	mov    %rax,0x70(%rsp)
00d1   b37a11:	42 8a 04 20          	mov    (%rax,%r12,1),%al
00d5   b37a15:	84 c0                	test   %al,%al
00d7   b37a17:	0f 85 d1 10 00 00    	jne    b38aee <leaf_cut_from_buffer+0x11ae>
00dd   b37a1d:	48 8d 14 eb          	lea    (%rbx,%rbp,8),%rdx
00e1   b37a21:	48 83 c2 18          	add    $0x18,%rdx
00e5   b37a25:	4c 89 f0             	mov    %r14,%rax
00e8   b37a28:	48 c1 e8 03          	shr    $0x3,%rax
00ec   b37a2c:	42 8a 04 20          	mov    (%rax,%r12,1),%al
00f0   b37a30:	84 c0                	test   %al,%al
00f2   b37a32:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
00f7   b37a37:	0f 85 d5 10 00 00    	jne    b38b12 <leaf_cut_from_buffer+0x11d2>
00fd   b37a3d:	48 bd ff ff ff ff ff ff ff 0f 	movabs $0xfffffffffffffff,%rbp
0107   b37a47:	48 8d 7a 08          	lea    0x8(%rdx),%rdi
010b   b37a4b:	66 83 7a 16 00       	cmpw   $0x0,0x16(%rdx)
0110   b37a50:	48 89 5c 24 60       	mov    %rbx,0x60(%rsp)
0115   b37a55:	48 89 3c 24          	mov    %rdi,(%rsp)
0119   b37a59:	4c 89 7c 24 58       	mov    %r15,0x58(%rsp)
011e   b37a5e:	4c 89 ac 24 90 00 00 00 	mov    %r13,0x90(%rsp)
0126   b37a66:	74 56                	je     b37abe <leaf_cut_from_buffer+0x17e>
0128   b37a68:	48 8d 5f 07          	lea    0x7(%rdi),%rbx
012c   b37a6c:	48 89 f8             	mov    %rdi,%rax
012f   b37a6f:	48 c1 e8 03          	shr    $0x3,%rax
0133   b37a73:	42 8a 04 20          	mov    (%rax,%r12,1),%al
0137   b37a77:	84 c0                	test   %al,%al
0139   b37a79:	0f 85 ac 11 00 00    	jne    b38c2b <leaf_cut_from_buffer+0x12eb>
013f   b37a7f:	48 89 d8             	mov    %rbx,%rax
0142   b37a82:	48 c1 e8 03          	shr    $0x3,%rax
0146   b37a86:	42 8a 04 20          	mov    (%rax,%r12,1),%al
014a   b37a8a:	84 c0                	test   %al,%al
014c   b37a8c:	0f 85 b9 11 00 00    	jne    b38c4b <leaf_cut_from_buffer+0x130b>
0152   b37a92:	48 8b 07             	mov    (%rdi),%rax
0155   b37a95:	48 89 c1             	mov    %rax,%rcx
0158   b37a98:	48 ba 00 00 00 00 00 00 00 f0 	movabs $0xf000000000000000,%rdx
0162   b37aa2:	48 21 d1             	and    %rdx,%rcx
0165   b37aa5:	48 ba 00 00 00 00 00 00 00 30 	movabs $0x3000000000000000,%rdx
016f   b37aaf:	48 39 d1             	cmp    %rdx,%rcx
0172   b37ab2:	75 59                	jne    b37b0d <leaf_cut_from_buffer+0x1cd>
0174   b37ab4:	e8 00 00 00 00       	call   b37ab9 <leaf_cut_from_buffer+0x179>	b37ab5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0179   b37ab9:	e9 c0 00 00 00       	jmp    b37b7e <leaf_cut_from_buffer+0x23e>
017e   b37abe:	48 8d 5f 04          	lea    0x4(%rdi),%rbx
0182   b37ac2:	48 8d 6f 07          	lea    0x7(%rdi),%rbp
0186   b37ac6:	48 89 d8             	mov    %rbx,%rax
0189   b37ac9:	48 c1 e8 03          	shr    $0x3,%rax
018d   b37acd:	42 8a 04 20          	mov    (%rax,%r12,1),%al
0191   b37ad1:	84 c0                	test   %al,%al
0193   b37ad3:	0f 85 38 13 00 00    	jne    b38e11 <leaf_cut_from_buffer+0x14d1>
0199   b37ad9:	48 89 e8             	mov    %rbp,%rax
019c   b37adc:	48 c1 e8 03          	shr    $0x3,%rax
01a0   b37ae0:	42 8a 04 20          	mov    (%rax,%r12,1),%al
01a4   b37ae4:	84 c0                	test   %al,%al
01a6   b37ae6:	0f 85 44 13 00 00    	jne    b38e30 <leaf_cut_from_buffer+0x14f0>
01ac   b37aec:	8b 03                	mov    (%rbx),%eax
01ae   b37aee:	3d f4 01 00 00       	cmp    $0x1f4,%eax
01b3   b37af3:	0f 84 80 00 00 00    	je     b37b79 <leaf_cut_from_buffer+0x239>
01b9   b37af9:	85 c0                	test   %eax,%eax
01bb   b37afb:	48 8b 6c 24 28       	mov    0x28(%rsp),%rbp
01c0   b37b00:	0f 84 93 1b 00 00    	je     b39699 <leaf_cut_from_buffer+0x1d59>
01c6   b37b06:	e8 00 00 00 00       	call   b37b0b <leaf_cut_from_buffer+0x1cb>	b37b07: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
01cb   b37b0b:	eb 13                	jmp    b37b20 <leaf_cut_from_buffer+0x1e0>
01cd   b37b0d:	48 39 e8             	cmp    %rbp,%rax
01d0   b37b10:	0f 86 f1 1a 00 00    	jbe    b39607 <leaf_cut_from_buffer+0x1cc7>
01d6   b37b16:	e8 00 00 00 00       	call   b37b1b <leaf_cut_from_buffer+0x1db>	b37b17: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
01db   b37b1b:	48 8b 6c 24 28       	mov    0x28(%rsp),%rbp
01e0   b37b20:	45 85 ff             	test   %r15d,%r15d
01e3   b37b23:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
01e8   b37b28:	0f 84 63 02 00 00    	je     b37d91 <leaf_cut_from_buffer+0x451>
01ee   b37b2e:	48 8d 5a 12          	lea    0x12(%rdx),%rbx
01f2   b37b32:	4c 8d 72 13          	lea    0x13(%rdx),%r14
01f6   b37b36:	48 89 d8             	mov    %rbx,%rax
01f9   b37b39:	48 c1 e8 03          	shr    $0x3,%rax
01fd   b37b3d:	42 8a 04 20          	mov    (%rax,%r12,1),%al
0201   b37b41:	84 c0                	test   %al,%al
0203   b37b43:	0f 85 4a 13 00 00    	jne    b38e93 <leaf_cut_from_buffer+0x1553>
0209   b37b49:	44 01 fd             	add    %r15d,%ebp
020c   b37b4c:	4c 89 f0             	mov    %r14,%rax
020f   b37b4f:	48 c1 e8 03          	shr    $0x3,%rax
0213   b37b53:	42 8a 04 20          	mov    (%rax,%r12,1),%al
0217   b37b57:	84 c0                	test   %al,%al
0219   b37b59:	0f 85 53 13 00 00    	jne    b38eb2 <leaf_cut_from_buffer+0x1572>
021f   b37b5f:	0f b7 1b             	movzwl (%rbx),%ebx
0222   b37b62:	39 dd                	cmp    %ebx,%ebp
0224   b37b64:	0f 85 a7 1a 00 00    	jne    b39611 <leaf_cut_from_buffer+0x1cd1>
022a   b37b6a:	e8 00 00 00 00       	call   b37b6f <leaf_cut_from_buffer+0x22f>	b37b6b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
022f   b37b6f:	4c 8b 74 24 48       	mov    0x48(%rsp),%r14
0234   b37b74:	e9 79 06 00 00       	jmp    b381f2 <leaf_cut_from_buffer+0x8b2>
0239   b37b79:	e8 00 00 00 00       	call   b37b7e <leaf_cut_from_buffer+0x23e>	b37b7a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
023e   b37b7e:	48 8b 6c 24 28       	mov    0x28(%rsp),%rbp
0243   b37b83:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
0248   b37b88:	48 8d 7a 10          	lea    0x10(%rdx),%rdi
024c   b37b8c:	48 8d 5a 11          	lea    0x11(%rdx),%rbx
0250   b37b90:	48 89 f9             	mov    %rdi,%rcx
0253   b37b93:	48 c1 e9 03          	shr    $0x3,%rcx
0257   b37b97:	42 8a 04 21          	mov    (%rcx,%r12,1),%al
025b   b37b9b:	84 c0                	test   %al,%al
025d   b37b9d:	0f 85 b6 11 00 00    	jne    b38d59 <leaf_cut_from_buffer+0x1419>
0263   b37ba3:	48 89 d8             	mov    %rbx,%rax
0266   b37ba6:	48 c1 e8 03          	shr    $0x3,%rax
026a   b37baa:	42 8a 04 20          	mov    (%rax,%r12,1),%al
026e   b37bae:	84 c0                	test   %al,%al
0270   b37bb0:	0f 85 dc 11 00 00    	jne    b38d92 <leaf_cut_from_buffer+0x1452>
0276   b37bb6:	0f b7 37             	movzwl (%rdi),%esi
0279   b37bb9:	45 8d 34 2f          	lea    (%r15,%rbp,1),%r14d
027d   b37bbd:	41 39 f6             	cmp    %esi,%r14d
0280   b37bc0:	0f 8f 75 19 00 00    	jg     b3953b <leaf_cut_from_buffer+0x1bfb>
0286   b37bc6:	85 ed                	test   %ebp,%ebp
0288   b37bc8:	0f 84 ab 03 00 00    	je     b37f79 <leaf_cut_from_buffer+0x639>
028e   b37bce:	48 89 7c 24 38       	mov    %rdi,0x38(%rsp)
0293   b37bd3:	48 8d 7a 14          	lea    0x14(%rdx),%rdi
0297   b37bd7:	48 8d 5a 15          	lea    0x15(%rdx),%rbx
029b   b37bdb:	48 89 f8             	mov    %rdi,%rax
029e   b37bde:	48 c1 e8 03          	shr    $0x3,%rax
02a2   b37be2:	42 8a 04 20          	mov    (%rax,%r12,1),%al
02a6   b37be6:	84 c0                	test   %al,%al
02a8   b37be8:	0f 85 e4 12 00 00    	jne    b38ed2 <leaf_cut_from_buffer+0x1592>
02ae   b37bee:	48 89 8c 24 98 00 00 00 	mov    %rcx,0x98(%rsp)
02b6   b37bf6:	48 89 d8             	mov    %rbx,%rax
02b9   b37bf9:	48 c1 e8 03          	shr    $0x3,%rax
02bd   b37bfd:	42 8a 04 20          	mov    (%rax,%r12,1),%al
02c1   b37c01:	84 c0                	test   %al,%al
02c3   b37c03:	0f 85 fd 12 00 00    	jne    b38f06 <leaf_cut_from_buffer+0x15c6>
02c9   b37c09:	0f b7 4a 14          	movzwl 0x14(%rdx),%ecx
02cd   b37c0d:	48 8b 44 24 60       	mov    0x60(%rsp),%rax
02d2   b37c12:	48 89 8c 24 88 00 00 00 	mov    %rcx,0x88(%rsp)
02da   b37c1a:	48 01 c1             	add    %rax,%rcx
02dd   b37c1d:	41 8d 47 ff          	lea    -0x1(%r15),%eax
02e1   b37c21:	48 98                	cltq
02e3   b37c23:	48 c1 e0 04          	shl    $0x4,%rax
02e7   b37c27:	48 83 c2 12          	add    $0x12,%rdx
02eb   b37c2b:	41 83 ff 01          	cmp    $0x1,%r15d
02ef   b37c2f:	48 8d 5c 08 0c       	lea    0xc(%rax,%rcx,1),%rbx
02f4   b37c34:	48 89 94 24 a0 00 00 00 	mov    %rdx,0xa0(%rsp)
02fc   b37c3c:	48 0f 42 da          	cmovb  %rdx,%rbx
0300   b37c40:	48 8d 6b 01          	lea    0x1(%rbx),%rbp
0304   b37c44:	48 89 d8             	mov    %rbx,%rax
0307   b37c47:	48 c1 e8 03          	shr    $0x3,%rax
030b   b37c4b:	42 8a 04 20          	mov    (%rax,%r12,1),%al
030f   b37c4f:	84 c0                	test   %al,%al
0311   b37c51:	48 89 4c 24 20       	mov    %rcx,0x20(%rsp)
0316   b37c56:	0f 85 d4 12 00 00    	jne    b38f30 <leaf_cut_from_buffer+0x15f0>
031c   b37c5c:	48 89 e8             	mov    %rbp,%rax
031f   b37c5f:	48 c1 e8 03          	shr    $0x3,%rax
0323   b37c63:	42 8a 04 20          	mov    (%rax,%r12,1),%al
0327   b37c67:	84 c0                	test   %al,%al
0329   b37c69:	0f 85 f4 12 00 00    	jne    b38f63 <leaf_cut_from_buffer+0x1623>
032f   b37c6f:	0f b7 13             	movzwl (%rbx),%edx
0332   b37c72:	41 ff ce             	dec    %r14d
0335   b37c75:	49 63 c6             	movslq %r14d,%rax
0338   b37c78:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
033d   b37c7d:	48 c1 e0 04          	shl    $0x4,%rax
0341   b37c81:	48 8d 1c 01          	lea    (%rcx,%rax,1),%rbx
0345   b37c85:	48 83 c3 0c          	add    $0xc,%rbx
0349   b37c89:	48 8d 2c 01          	lea    (%rcx,%rax,1),%rbp
034d   b37c8d:	48 83 c5 0d          	add    $0xd,%rbp
0351   b37c91:	48 89 d8             	mov    %rbx,%rax
0354   b37c94:	48 c1 e8 03          	shr    $0x3,%rax
0358   b37c98:	42 8a 04 20          	mov    (%rax,%r12,1),%al
035c   b37c9c:	84 c0                	test   %al,%al
035e   b37c9e:	48 89 54 24 40       	mov    %rdx,0x40(%rsp)
0363   b37ca3:	0f 85 ed 12 00 00    	jne    b38f96 <leaf_cut_from_buffer+0x1656>
0369   b37ca9:	48 89 e8             	mov    %rbp,%rax
036c   b37cac:	48 c1 e8 03          	shr    $0x3,%rax
0370   b37cb0:	42 8a 04 20          	mov    (%rax,%r12,1),%al
0374   b37cb4:	84 c0                	test   %al,%al
0376   b37cb6:	0f 85 08 13 00 00    	jne    b38fc4 <leaf_cut_from_buffer+0x1684>
037c   b37cbc:	0f b7 03             	movzwl (%rbx),%eax
037f   b37cbf:	48 89 d1             	mov    %rdx,%rcx
0382   b37cc2:	48 29 c1             	sub    %rax,%rcx
0385   b37cc5:	48 89 4c 24 18       	mov    %rcx,0x18(%rsp)
038a   b37cca:	8d 46 ff             	lea    -0x1(%rsi),%eax
038d   b37ccd:	44 39 f0             	cmp    %r14d,%eax
0390   b37cd0:	0f 8e b0 02 00 00    	jle    b37f86 <leaf_cut_from_buffer+0x646>
0396   b37cd6:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
039b   b37cdb:	41 89 c6             	mov    %eax,%r14d
039e   b37cde:	41 c1 e6 04          	shl    $0x4,%r14d
03a2   b37ce2:	41 f7 de             	neg    %r14d
03a5   b37ce5:	89 f0                	mov    %esi,%eax
03a7   b37ce7:	4c 8d 60 fe          	lea    -0x2(%rax),%r12
03ab   b37ceb:	48 c1 e0 04          	shl    $0x4,%rax
03af   b37cef:	48 8b 54 24 60       	mov    0x60(%rsp),%rdx
03b4   b37cf4:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
03b8   b37cf8:	48 8b b4 24 88 00 00 00 	mov    0x88(%rsp),%rsi
03c0   b37d00:	48 8d 2c 0e          	lea    (%rsi,%rcx,1),%rbp
03c4   b37d04:	48 83 c5 fc          	add    $0xfffffffffffffffc,%rbp
03c8   b37d08:	48 01 f0             	add    %rsi,%rax
03cb   b37d0b:	4c 8d 2c 02          	lea    (%rdx,%rax,1),%r13
03cf   b37d0f:	49 83 c5 fc          	add    $0xfffffffffffffffc,%r13
03d3   b37d13:	49 bf 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r15
03dd   b37d1d:	48 8d 5d 01          	lea    0x1(%rbp),%rbx
03e1   b37d21:	48 89 e8             	mov    %rbp,%rax
03e4   b37d24:	48 c1 e8 03          	shr    $0x3,%rax
03e8   b37d28:	42 8a 04 38          	mov    (%rax,%r15,1),%al
03ec   b37d2c:	84 c0                	test   %al,%al
03ee   b37d2e:	75 31                	jne    b37d61 <leaf_cut_from_buffer+0x421>
03f0   b37d30:	48 89 d8             	mov    %rbx,%rax
03f3   b37d33:	48 c1 e8 03          	shr    $0x3,%rax
03f7   b37d37:	42 8a 04 38          	mov    (%rax,%r15,1),%al
03fb   b37d3b:	84 c0                	test   %al,%al
03fd   b37d3d:	75 3a                	jne    b37d79 <leaf_cut_from_buffer+0x439>
03ff   b37d3f:	66 45 01 75 00       	add    %r14w,0x0(%r13)
0404   b37d44:	4c 3b 64 24 30       	cmp    0x30(%rsp),%r12
0409   b37d49:	0f 8e 3e 02 00 00    	jle    b37f8d <leaf_cut_from_buffer+0x64d>
040f   b37d4f:	e8 00 00 00 00       	call   b37d54 <leaf_cut_from_buffer+0x414>	b37d50: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0414   b37d54:	49 ff cc             	dec    %r12
0417   b37d57:	48 83 c5 f0          	add    $0xfffffffffffffff0,%rbp
041b   b37d5b:	49 83 c5 f0          	add    $0xfffffffffffffff0,%r13
041f   b37d5f:	eb bc                	jmp    b37d1d <leaf_cut_from_buffer+0x3dd>
0421   b37d61:	89 e9                	mov    %ebp,%ecx
0423   b37d63:	80 e1 07             	and    $0x7,%cl
0426   b37d66:	38 c1                	cmp    %al,%cl
0428   b37d68:	7c c6                	jl     b37d30 <leaf_cut_from_buffer+0x3f0>
042a   b37d6a:	be 02 00 00 00       	mov    $0x2,%esi
042f   b37d6f:	48 89 ef             	mov    %rbp,%rdi
0432   b37d72:	e8 00 00 00 00       	call   b37d77 <leaf_cut_from_buffer+0x437>	b37d73: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
0437   b37d77:	eb b7                	jmp    b37d30 <leaf_cut_from_buffer+0x3f0>
0439   b37d79:	89 d9                	mov    %ebx,%ecx
043b   b37d7b:	80 e1 07             	and    $0x7,%cl
043e   b37d7e:	38 c1                	cmp    %al,%cl
0440   b37d80:	7c bd                	jl     b37d3f <leaf_cut_from_buffer+0x3ff>
0442   b37d82:	be 02 00 00 00       	mov    $0x2,%esi
0447   b37d87:	48 89 df             	mov    %rbx,%rdi
044a   b37d8a:	e8 00 00 00 00       	call   b37d8f <leaf_cut_from_buffer+0x44f>	b37d8b: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
044f   b37d8f:	eb ae                	jmp    b37d3f <leaf_cut_from_buffer+0x3ff>
0451   b37d91:	48 8d 4a 12          	lea    0x12(%rdx),%rcx
0455   b37d95:	48 8d 5a 13          	lea    0x13(%rdx),%rbx
0459   b37d99:	48 89 c8             	mov    %rcx,%rax
045c   b37d9c:	48 89 4c 24 18       	mov    %rcx,0x18(%rsp)
0461   b37da1:	48 c1 e9 03          	shr    $0x3,%rcx
0465   b37da5:	48 89 4c 24 40       	mov    %rcx,0x40(%rsp)
046a   b37daa:	42 8a 04 21          	mov    (%rcx,%r12,1),%al
046e   b37dae:	84 c0                	test   %al,%al
0470   b37db0:	0f 85 d5 12 00 00    	jne    b3908b <leaf_cut_from_buffer+0x174b>
0476   b37db6:	48 89 d8             	mov    %rbx,%rax
0479   b37db9:	48 c1 e8 03          	shr    $0x3,%rax
047d   b37dbd:	42 8a 04 20          	mov    (%rax,%r12,1),%al
0481   b37dc1:	84 c0                	test   %al,%al
0483   b37dc3:	4d 89 e6             	mov    %r12,%r14
0486   b37dc6:	0f 85 e8 12 00 00    	jne    b390b4 <leaf_cut_from_buffer+0x1774>
048c   b37dcc:	0f b7 6a 12          	movzwl 0x12(%rdx),%ebp
0490   b37dd0:	4c 8d 62 14          	lea    0x14(%rdx),%r12
0494   b37dd4:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	b37dd7: R_X86_64_32S	_ftrace_annotated_branch+0xbad20
049b   b37ddb:	31 f6                	xor    %esi,%esi
049d   b37ddd:	31 d2                	xor    %edx,%edx
049f   b37ddf:	b9 01 00 00 00       	mov    $0x1,%ecx
04a4   b37de4:	e8 00 00 00 00       	call   b37de9 <leaf_cut_from_buffer+0x4a9>	b37de5: R_X86_64_PLT32	ftrace_likely_update-0x4
04a9   b37de9:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	b37dec: R_X86_64_32S	_ftrace_annotated_branch+0xbad50
04b0   b37df0:	31 f6                	xor    %esi,%esi
04b2   b37df2:	31 d2                	xor    %edx,%edx
04b4   b37df4:	b9 01 00 00 00       	mov    $0x1,%ecx
04b9   b37df9:	e8 00 00 00 00       	call   b37dfe <leaf_cut_from_buffer+0x4be>	b37dfa: R_X86_64_PLT32	ftrace_likely_update-0x4
04be   b37dfe:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	b37e01: R_X86_64_32S	_ftrace_annotated_branch+0xbad80
04c5   b37e05:	31 f6                	xor    %esi,%esi
04c7   b37e07:	31 d2                	xor    %edx,%edx
04c9   b37e09:	b9 01 00 00 00       	mov    $0x1,%ecx
04ce   b37e0e:	e8 00 00 00 00       	call   b37e13 <leaf_cut_from_buffer+0x4d3>	b37e0f: R_X86_64_PLT32	ftrace_likely_update-0x4
04d3   b37e13:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
04d8   b37e18:	42 80 3c 30 00       	cmpb   $0x0,(%rax,%r14,1)
04dd   b37e1d:	74 08                	je     b37e27 <leaf_cut_from_buffer+0x4e7>
04df   b37e1f:	4c 89 ef             	mov    %r13,%rdi
04e2   b37e22:	e8 00 00 00 00       	call   b37e27 <leaf_cut_from_buffer+0x4e7>	b37e23: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
04e7   b37e27:	4c 8b 74 24 28       	mov    0x28(%rsp),%r14
04ec   b37e2c:	44 29 f5             	sub    %r14d,%ebp
04ef   b37e2f:	49 8b 5d 00          	mov    0x0(%r13),%rbx
04f3   b37e33:	49 8d 7c 24 01       	lea    0x1(%r12),%rdi
04f8   b37e38:	4c 89 e0             	mov    %r12,%rax
04fb   b37e3b:	48 c1 e8 03          	shr    $0x3,%rax
04ff   b37e3f:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
0509   b37e49:	42 8a 04 28          	mov    (%rax,%r13,1),%al
050d   b37e4d:	84 c0                	test   %al,%al
050f   b37e4f:	0f 85 83 12 00 00    	jne    b390d8 <leaf_cut_from_buffer+0x1798>
0515   b37e55:	4c 63 fd             	movslq %ebp,%r15
0518   b37e58:	49 63 d6             	movslq %r14d,%rdx
051b   b37e5b:	48 89 f8             	mov    %rdi,%rax
051e   b37e5e:	48 c1 e8 03          	shr    $0x3,%rax
0522   b37e62:	42 8a 04 28          	mov    (%rax,%r13,1),%al
0526   b37e66:	84 c0                	test   %al,%al
0528   b37e68:	0f 85 90 12 00 00    	jne    b390fe <leaf_cut_from_buffer+0x17be>
052e   b37e6e:	41 0f b7 04 24       	movzwl (%r12),%eax
0533   b37e73:	48 01 c3             	add    %rax,%rbx
0536   b37e76:	48 89 54 24 30       	mov    %rdx,0x30(%rsp)
053b   b37e7b:	48 8d 34 13          	lea    (%rbx,%rdx,1),%rsi
053f   b37e7f:	48 89 df             	mov    %rbx,%rdi
0542   b37e82:	4c 89 fa             	mov    %r15,%rdx
0545   b37e85:	e8 00 00 00 00       	call   b37e8a <leaf_cut_from_buffer+0x54a>	b37e86: R_X86_64_PLT32	memmove-0x4
054a   b37e8a:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
054f   b37e8f:	48 8d 5f 01          	lea    0x1(%rdi),%rbx
0553   b37e93:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
0558   b37e98:	42 8a 04 28          	mov    (%rax,%r13,1),%al
055c   b37e9c:	84 c0                	test   %al,%al
055e   b37e9e:	4d 89 ec             	mov    %r13,%r12
0561   b37ea1:	0f 85 79 12 00 00    	jne    b39120 <leaf_cut_from_buffer+0x17e0>
0567   b37ea7:	48 89 d8             	mov    %rbx,%rax
056a   b37eaa:	48 c1 e8 03          	shr    $0x3,%rax
056e   b37eae:	42 8a 04 20          	mov    (%rax,%r12,1),%al
0572   b37eb2:	84 c0                	test   %al,%al
0574   b37eb4:	48 8b 14 24          	mov    (%rsp),%rdx
0578   b37eb8:	0f 85 8b 12 00 00    	jne    b39149 <leaf_cut_from_buffer+0x1809>
057e   b37ebe:	44 0f b7 3f          	movzwl (%rdi),%r15d
0582   b37ec2:	66 45 85 ff          	test   %r15w,%r15w
0586   b37ec6:	0f 84 e3 04 00 00    	je     b383af <leaf_cut_from_buffer+0xa6f>
058c   b37ecc:	48 8d 72 07          	lea    0x7(%rdx),%rsi
0590   b37ed0:	49 89 d6             	mov    %rdx,%r14
0593   b37ed3:	49 c1 ee 03          	shr    $0x3,%r14
0597   b37ed7:	43 8a 04 26          	mov    (%r14,%r12,1),%al
059b   b37edb:	84 c0                	test   %al,%al
059d   b37edd:	4c 89 e3             	mov    %r12,%rbx
05a0   b37ee0:	48 89 74 24 20       	mov    %rsi,0x20(%rsp)
05a5   b37ee5:	0f 85 b6 13 00 00    	jne    b392a1 <leaf_cut_from_buffer+0x1961>
05ab   b37eeb:	49 89 f4             	mov    %rsi,%r12
05ae   b37eee:	49 c1 ec 03          	shr    $0x3,%r12
05b2   b37ef2:	41 8a 04 1c          	mov    (%r12,%rbx,1),%al
05b6   b37ef6:	84 c0                	test   %al,%al
05b8   b37ef8:	0f 85 cb 13 00 00    	jne    b392c9 <leaf_cut_from_buffer+0x1989>
05be   b37efe:	49 bd 00 00 00 00 00 00 00 20 	movabs $0x2000000000000000,%r13
05c8   b37f08:	48 8b 1a             	mov    (%rdx),%rbx
05cb   b37f0b:	48 89 dd             	mov    %rbx,%rbp
05ce   b37f0e:	48 b8 00 00 00 00 00 00 00 f0 	movabs $0xf000000000000000,%rax
05d8   b37f18:	48 21 c5             	and    %rax,%rbp
05db   b37f1b:	4c 39 ed             	cmp    %r13,%rbp
05de   b37f1e:	0f 85 40 0a 00 00    	jne    b38964 <leaf_cut_from_buffer+0x1024>
05e4   b37f24:	e8 00 00 00 00       	call   b37f29 <leaf_cut_from_buffer+0x5e9>	b37f25: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
05e9   b37f29:	48 03 5c 24 30       	add    0x30(%rsp),%rbx
05ee   b37f2e:	48 b8 ff ff ff ff ff ff ff 0f 	movabs $0xfffffffffffffff,%rax
05f8   b37f38:	48 21 c3             	and    %rax,%rbx
05fb   b37f3b:	48 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbp
0605   b37f45:	41 8a 04 2e          	mov    (%r14,%rbp,1),%al
0609   b37f49:	84 c0                	test   %al,%al
060b   b37f4b:	0f 85 c1 14 00 00    	jne    b39412 <leaf_cut_from_buffer+0x1ad2>
0611   b37f51:	4c 09 eb             	or     %r13,%rbx
0614   b37f54:	41 8a 04 2c          	mov    (%r12,%rbp,1),%al
0618   b37f58:	84 c0                	test   %al,%al
061a   b37f5a:	49 89 ec             	mov    %rbp,%r12
061d   b37f5d:	4c 8b 74 24 48       	mov    0x48(%rsp),%r14
0622   b37f62:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
0627   b37f67:	48 8b 34 24          	mov    (%rsp),%rsi
062b   b37f6b:	0f 85 c3 14 00 00    	jne    b39434 <leaf_cut_from_buffer+0x1af4>
0631   b37f71:	48 89 1e             	mov    %rbx,(%rsi)
0634   b37f74:	e9 7e 02 00 00       	jmp    b381f7 <leaf_cut_from_buffer+0x8b7>
0639   b37f79:	e8 00 00 00 00       	call   b37f7e <leaf_cut_from_buffer+0x63e>	b37f7a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
063e   b37f7e:	45 31 ed             	xor    %r13d,%r13d
0641   b37f81:	e9 54 02 00 00       	jmp    b381da <leaf_cut_from_buffer+0x89a>
0646   b37f86:	e8 00 00 00 00       	call   b37f8b <leaf_cut_from_buffer+0x64b>	b37f87: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
064b   b37f8b:	eb 0a                	jmp    b37f97 <leaf_cut_from_buffer+0x657>
064d   b37f8d:	e8 00 00 00 00       	call   b37f92 <leaf_cut_from_buffer+0x652>	b37f8e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0652   b37f92:	4c 8b 7c 24 58       	mov    0x58(%rsp),%r15
0657   b37f97:	48 8b 6c 24 28       	mov    0x28(%rsp),%rbp
065c   b37f9c:	44 8b 74 24 40       	mov    0x40(%rsp),%r14d
0661   b37fa1:	45 85 ff             	test   %r15d,%r15d
0664   b37fa4:	0f 8e d2 00 00 00    	jle    b3807c <leaf_cut_from_buffer+0x73c>
066a   b37faa:	4c 89 74 24 40       	mov    %r14,0x40(%rsp)
066f   b37faf:	41 89 ee             	mov    %ebp,%r14d
0672   b37fb2:	41 c1 e6 04          	shl    $0x4,%r14d
0676   b37fb6:	44 03 74 24 18       	add    0x18(%rsp),%r14d
067b   b37fbb:	41 f7 de             	neg    %r14d
067e   b37fbe:	45 89 ff             	mov    %r15d,%r15d
0681   b37fc1:	49 c1 e7 04          	shl    $0x4,%r15
0685   b37fc5:	49 83 c7 f0          	add    $0xfffffffffffffff0,%r15
0689   b37fc9:	48 8b 44 24 60       	mov    0x60(%rsp),%rax
068e   b37fce:	48 8b 8c 24 88 00 00 00 	mov    0x88(%rsp),%rcx
0696   b37fd6:	4c 8d 2c 08          	lea    (%rax,%rcx,1),%r13
069a   b37fda:	49 83 c5 0c          	add    $0xc,%r13
069e   b37fde:	48 01 c8             	add    %rcx,%rax
06a1   b37fe1:	48 83 c0 0d          	add    $0xd,%rax
06a5   b37fe5:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
06aa   b37fea:	31 ed                	xor    %ebp,%ebp
06ac   b37fec:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
06b6   b37ff6:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
06bb   b37ffb:	48 8d 1c 28          	lea    (%rax,%rbp,1),%rbx
06bf   b37fff:	4c 89 ef             	mov    %r13,%rdi
06c2   b38002:	48 01 ef             	add    %rbp,%rdi
06c5   b38005:	48 89 f8             	mov    %rdi,%rax
06c8   b38008:	48 c1 e8 03          	shr    $0x3,%rax
06cc   b3800c:	42 8a 04 20          	mov    (%rax,%r12,1),%al
06d0   b38010:	84 c0                	test   %al,%al
06d2   b38012:	75 25                	jne    b38039 <leaf_cut_from_buffer+0x6f9>
06d4   b38014:	48 89 d8             	mov    %rbx,%rax
06d7   b38017:	48 c1 e8 03          	shr    $0x3,%rax
06db   b3801b:	42 8a 04 20          	mov    (%rax,%r12,1),%al
06df   b3801f:	84 c0                	test   %al,%al
06e1   b38021:	75 2b                	jne    b3804e <leaf_cut_from_buffer+0x70e>
06e3   b38023:	66 45 01 74 2d 00    	add    %r14w,0x0(%r13,%rbp,1)
06e9   b38029:	49 39 ef             	cmp    %rbp,%r15
06ec   b3802c:	74 38                	je     b38066 <leaf_cut_from_buffer+0x726>
06ee   b3802e:	e8 00 00 00 00       	call   b38033 <leaf_cut_from_buffer+0x6f3>	b3802f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
06f3   b38033:	48 83 c5 10          	add    $0x10,%rbp
06f7   b38037:	eb bd                	jmp    b37ff6 <leaf_cut_from_buffer+0x6b6>
06f9   b38039:	89 f9                	mov    %edi,%ecx
06fb   b3803b:	80 e1 07             	and    $0x7,%cl
06fe   b3803e:	38 c1                	cmp    %al,%cl
0700   b38040:	7c d2                	jl     b38014 <leaf_cut_from_buffer+0x6d4>
0702   b38042:	be 02 00 00 00       	mov    $0x2,%esi
0707   b38047:	e8 00 00 00 00       	call   b3804c <leaf_cut_from_buffer+0x70c>	b38048: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
070c   b3804c:	eb c6                	jmp    b38014 <leaf_cut_from_buffer+0x6d4>
070e   b3804e:	89 d9                	mov    %ebx,%ecx
0710   b38050:	80 e1 07             	and    $0x7,%cl
0713   b38053:	38 c1                	cmp    %al,%cl
0715   b38055:	7c cc                	jl     b38023 <leaf_cut_from_buffer+0x6e3>
0717   b38057:	be 02 00 00 00       	mov    $0x2,%esi
071c   b3805c:	48 89 df             	mov    %rbx,%rdi
071f   b3805f:	e8 00 00 00 00       	call   b38064 <leaf_cut_from_buffer+0x724>	b38060: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
0724   b38064:	eb bd                	jmp    b38023 <leaf_cut_from_buffer+0x6e3>
0726   b38066:	e8 00 00 00 00       	call   b3806b <leaf_cut_from_buffer+0x72b>	b38067: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
072b   b3806b:	4c 8b 7c 24 58       	mov    0x58(%rsp),%r15
0730   b38070:	48 8b 6c 24 28       	mov    0x28(%rsp),%rbp
0735   b38075:	4c 8b 74 24 40       	mov    0x40(%rsp),%r14
073a   b3807a:	eb 05                	jmp    b38081 <leaf_cut_from_buffer+0x741>
073c   b3807c:	e8 00 00 00 00       	call   b38081 <leaf_cut_from_buffer+0x741>	b3807d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0741   b38081:	48 8b 54 24 38       	mov    0x38(%rsp),%rdx
0746   b38086:	48 8d 5a 01          	lea    0x1(%rdx),%rbx
074a   b3808a:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
0754   b38094:	48 8b 84 24 98 00 00 00 	mov    0x98(%rsp),%rax
075c   b3809c:	42 8a 04 20          	mov    (%rax,%r12,1),%al
0760   b380a0:	84 c0                	test   %al,%al
0762   b380a2:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
0767   b380a7:	0f 85 42 0f 00 00    	jne    b38fef <leaf_cut_from_buffer+0x16af>
076d   b380ad:	49 01 ce             	add    %rcx,%r14
0770   b380b0:	48 89 d8             	mov    %rbx,%rax
0773   b380b3:	48 c1 e8 03          	shr    $0x3,%rax
0777   b380b7:	42 8a 04 20          	mov    (%rax,%r12,1),%al
077b   b380bb:	84 c0                	test   %al,%al
077d   b380bd:	0f 85 5c 0f 00 00    	jne    b3901f <leaf_cut_from_buffer+0x16df>
0783   b380c3:	66 29 2a             	sub    %bp,(%rdx)
0786   b380c6:	4c 89 74 24 40       	mov    %r14,0x40(%rsp)
078b   b380cb:	4c 2b 74 24 18       	sub    0x18(%rsp),%r14
0790   b380d0:	49 63 df             	movslq %r15d,%rbx
0793   b380d3:	48 c1 e3 04          	shl    $0x4,%rbx
0797   b380d7:	48 01 cb             	add    %rcx,%rbx
079a   b380da:	48 63 ed             	movslq %ebp,%rbp
079d   b380dd:	48 c1 e5 04          	shl    $0x4,%rbp
07a1   b380e1:	49 89 ed             	mov    %rbp,%r13
07a4   b380e4:	48 01 dd             	add    %rbx,%rbp
07a7   b380e7:	4d 89 f7             	mov    %r14,%r15
07aa   b380ea:	49 29 ef             	sub    %rbp,%r15
07ad   b380ed:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	b380f0: R_X86_64_32S	_ftrace_annotated_branch+0xbb470
07b4   b380f4:	31 f6                	xor    %esi,%esi
07b6   b380f6:	31 d2                	xor    %edx,%edx
07b8   b380f8:	b9 01 00 00 00       	mov    $0x1,%ecx
07bd   b380fd:	e8 00 00 00 00       	call   b38102 <leaf_cut_from_buffer+0x7c2>	b380fe: R_X86_64_PLT32	ftrace_likely_update-0x4
07c2   b38102:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	b38105: R_X86_64_32S	_ftrace_annotated_branch+0xbb4a0
07c9   b38109:	31 f6                	xor    %esi,%esi
07cb   b3810b:	31 d2                	xor    %edx,%edx
07cd   b3810d:	b9 01 00 00 00       	mov    $0x1,%ecx
07d2   b38112:	e8 00 00 00 00       	call   b38117 <leaf_cut_from_buffer+0x7d7>	b38113: R_X86_64_PLT32	ftrace_likely_update-0x4
07d7   b38117:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	b3811a: R_X86_64_32S	_ftrace_annotated_branch+0xbb4d0
07de   b3811e:	31 f6                	xor    %esi,%esi
07e0   b38120:	31 d2                	xor    %edx,%edx
07e2   b38122:	b9 01 00 00 00       	mov    $0x1,%ecx
07e7   b38127:	e8 00 00 00 00       	call   b3812c <leaf_cut_from_buffer+0x7ec>	b38128: R_X86_64_PLT32	ftrace_likely_update-0x4
07ec   b3812c:	48 89 df             	mov    %rbx,%rdi
07ef   b3812f:	48 89 ee             	mov    %rbp,%rsi
07f2   b38132:	4c 89 fa             	mov    %r15,%rdx
07f5   b38135:	e8 00 00 00 00       	call   b3813a <leaf_cut_from_buffer+0x7fa>	b38136: R_X86_64_PLT32	memmove-0x4
07fa   b3813a:	48 8b ac 24 a0 00 00 00 	mov    0xa0(%rsp),%rbp
0802   b38142:	48 8d 5d 01          	lea    0x1(%rbp),%rbx
0806   b38146:	48 89 e8             	mov    %rbp,%rax
0809   b38149:	48 c1 e8 03          	shr    $0x3,%rax
080d   b3814d:	42 8a 04 20          	mov    (%rax,%r12,1),%al
0811   b38151:	84 c0                	test   %al,%al
0813   b38153:	0f 85 f4 0e 00 00    	jne    b3904d <leaf_cut_from_buffer+0x170d>
0819   b38159:	48 89 d8             	mov    %rbx,%rax
081c   b3815c:	48 c1 e8 03          	shr    $0x3,%rax
0820   b38160:	42 8a 04 20          	mov    (%rax,%r12,1),%al
0824   b38164:	84 c0                	test   %al,%al
0826   b38166:	0f 85 00 0f 00 00    	jne    b3906c <leaf_cut_from_buffer+0x172c>
082c   b3816c:	0f b7 45 00          	movzwl 0x0(%rbp),%eax
0830   b38170:	48 8b 5c 24 20       	mov    0x20(%rsp),%rbx
0835   b38175:	48 01 c3             	add    %rax,%rbx
0838   b38178:	48 8b 6c 24 40       	mov    0x40(%rsp),%rbp
083d   b3817d:	48 29 eb             	sub    %rbp,%rbx
0840   b38180:	4d 29 ee             	sub    %r13,%r14
0843   b38183:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	b38186: R_X86_64_32S	_ftrace_annotated_branch+0xbb500
084a   b3818a:	31 f6                	xor    %esi,%esi
084c   b3818c:	31 d2                	xor    %edx,%edx
084e   b3818e:	b9 01 00 00 00       	mov    $0x1,%ecx
0853   b38193:	e8 00 00 00 00       	call   b38198 <leaf_cut_from_buffer+0x858>	b38194: R_X86_64_PLT32	ftrace_likely_update-0x4
0858   b38198:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	b3819b: R_X86_64_32S	_ftrace_annotated_branch+0xbb530
085f   b3819f:	31 f6                	xor    %esi,%esi
0861   b381a1:	31 d2                	xor    %edx,%edx
0863   b381a3:	b9 01 00 00 00       	mov    $0x1,%ecx
0868   b381a8:	e8 00 00 00 00       	call   b381ad <leaf_cut_from_buffer+0x86d>	b381a9: R_X86_64_PLT32	ftrace_likely_update-0x4
086d   b381ad:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	b381b0: R_X86_64_32S	_ftrace_annotated_branch+0xbb560
0874   b381b4:	31 f6                	xor    %esi,%esi
0876   b381b6:	31 d2                	xor    %edx,%edx
0878   b381b8:	b9 01 00 00 00       	mov    $0x1,%ecx
087d   b381bd:	e8 00 00 00 00       	call   b381c2 <leaf_cut_from_buffer+0x882>	b381be: R_X86_64_PLT32	ftrace_likely_update-0x4
0882   b381c2:	4c 89 f7             	mov    %r14,%rdi
0885   b381c5:	48 89 ee             	mov    %rbp,%rsi
0888   b381c8:	48 89 da             	mov    %rbx,%rdx
088b   b381cb:	e8 00 00 00 00       	call   b381d0 <leaf_cut_from_buffer+0x890>	b381cc: R_X86_64_PLT32	memmove-0x4
0890   b381d0:	44 03 6c 24 18       	add    0x18(%rsp),%r13d
0895   b381d5:	4c 8b 7c 24 58       	mov    0x58(%rsp),%r15
089a   b381da:	45 85 ff             	test   %r15d,%r15d
089d   b381dd:	4c 8b 74 24 48       	mov    0x48(%rsp),%r14
08a2   b381e2:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
08a7   b381e7:	0f 84 a6 00 00 00    	je     b38293 <leaf_cut_from_buffer+0x953>
08ad   b381ed:	e8 00 00 00 00       	call   b381f2 <leaf_cut_from_buffer+0x8b2>	b381ee: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
08b2   b381f2:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
08b7   b381f7:	44 89 f0             	mov    %r14d,%eax
08ba   b381fa:	f7 d0                	not    %eax
08bc   b381fc:	03 44 24 78          	add    0x78(%rsp),%eax
08c0   b38200:	48 98                	cltq
08c2   b38202:	48 8d 04 40          	lea    (%rax,%rax,2),%rax
08c6   b38206:	48 8d 1c c2          	lea    (%rdx,%rax,8),%rbx
08ca   b3820a:	48 83 c3 14          	add    $0x14,%rbx
08ce   b3820e:	48 8d 2c c2          	lea    (%rdx,%rax,8),%rbp
08d2   b38212:	48 83 c5 15          	add    $0x15,%rbp
08d6   b38216:	48 89 d8             	mov    %rbx,%rax
08d9   b38219:	48 c1 e8 03          	shr    $0x3,%rax
08dd   b3821d:	42 8a 04 20          	mov    (%rax,%r12,1),%al
08e1   b38221:	84 c0                	test   %al,%al
08e3   b38223:	0f 85 c4 09 00 00    	jne    b38bed <leaf_cut_from_buffer+0x12ad>
08e9   b38229:	48 89 e8             	mov    %rbp,%rax
08ec   b3822c:	48 c1 e8 03          	shr    $0x3,%rax
08f0   b38230:	42 8a 04 20          	mov    (%rax,%r12,1),%al
08f4   b38234:	84 c0                	test   %al,%al
08f6   b38236:	0f 85 d0 09 00 00    	jne    b38c0c <leaf_cut_from_buffer+0x12cc>
08fc   b3823c:	44 0f b7 3b          	movzwl (%rbx),%r15d
0900   b38240:	41 0f b7 ef          	movzwl %r15w,%ebp
0904   b38244:	45 85 f6             	test   %r14d,%r14d
0907   b38247:	74 40                	je     b38289 <leaf_cut_from_buffer+0x949>
0909   b38249:	e8 00 00 00 00       	call   b3824e <leaf_cut_from_buffer+0x90e>	b3824a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
090e   b3824e:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
0913   b38253:	48 8d 58 fc          	lea    -0x4(%rax),%rbx
0917   b38257:	4c 8d 70 fd          	lea    -0x3(%rax),%r14
091b   b3825b:	48 89 d8             	mov    %rbx,%rax
091e   b3825e:	48 c1 e8 03          	shr    $0x3,%rax
0922   b38262:	42 8a 04 20          	mov    (%rax,%r12,1),%al
0926   b38266:	84 c0                	test   %al,%al
0928   b38268:	0f 85 ac 0a 00 00    	jne    b38d1a <leaf_cut_from_buffer+0x13da>
092e   b3826e:	4c 89 f0             	mov    %r14,%rax
0931   b38271:	48 c1 e8 03          	shr    $0x3,%rax
0935   b38275:	42 8a 04 20          	mov    (%rax,%r12,1),%al
0939   b38279:	84 c0                	test   %al,%al
093b   b3827b:	0f 85 b8 0a 00 00    	jne    b38d39 <leaf_cut_from_buffer+0x13f9>
0941   b38281:	0f b7 03             	movzwl (%rbx),%eax
0944   b38284:	e9 f3 02 00 00       	jmp    b3857c <leaf_cut_from_buffer+0xc3c>
0949   b38289:	e8 00 00 00 00       	call   b3828e <leaf_cut_from_buffer+0x94e>	b3828a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
094e   b3828e:	e9 c7 02 00 00       	jmp    b3855a <leaf_cut_from_buffer+0xc1a>
0953   b38293:	45 85 f6             	test   %r14d,%r14d
0956   b38296:	0f 85 30 14 00 00    	jne    b396cc <leaf_cut_from_buffer+0x1d8c>
095c   b3829c:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
0961   b382a1:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
0966   b382a6:	4c 8b ac 24 90 00 00 00 	mov    0x90(%rsp),%r13
096e   b382ae:	74 08                	je     b382b8 <leaf_cut_from_buffer+0x978>
0970   b382b0:	4c 89 ef             	mov    %r13,%rdi
0973   b382b3:	e8 00 00 00 00       	call   b382b8 <leaf_cut_from_buffer+0x978>	b382b4: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0978   b382b8:	49 8b 6d 00          	mov    0x0(%r13),%rbp
097c   b382bc:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
0981   b382c1:	48 8d 58 14          	lea    0x14(%rax),%rbx
0985   b382c5:	4c 8d 70 15          	lea    0x15(%rax),%r14
0989   b382c9:	48 89 d8             	mov    %rbx,%rax
098c   b382cc:	48 c1 e8 03          	shr    $0x3,%rax
0990   b382d0:	42 8a 04 20          	mov    (%rax,%r12,1),%al
0994   b382d4:	84 c0                	test   %al,%al
0996   b382d6:	0f 85 9a 0e 00 00    	jne    b39176 <leaf_cut_from_buffer+0x1836>
099c   b382dc:	4c 89 f0             	mov    %r14,%rax
099f   b382df:	48 c1 e8 03          	shr    $0x3,%rax
09a3   b382e3:	42 8a 04 20          	mov    (%rax,%r12,1),%al
09a7   b382e7:	84 c0                	test   %al,%al
09a9   b382e9:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
09ae   b382ee:	0f 85 a1 0e 00 00    	jne    b39195 <leaf_cut_from_buffer+0x1855>
09b4   b382f4:	0f b7 03             	movzwl (%rbx),%eax
09b7   b382f7:	48 8d 1c 28          	lea    (%rax,%rbp,1),%rbx
09bb   b382fb:	48 01 c5             	add    %rax,%rbp
09be   b382fe:	48 83 c5 03          	add    $0x3,%rbp
09c2   b38302:	48 89 d8             	mov    %rbx,%rax
09c5   b38305:	48 c1 e8 03          	shr    $0x3,%rax
09c9   b38309:	42 8a 04 20          	mov    (%rax,%r12,1),%al
09cd   b3830d:	84 c0                	test   %al,%al
09cf   b3830f:	0f 85 aa 0e 00 00    	jne    b391bf <leaf_cut_from_buffer+0x187f>
09d5   b38315:	48 89 e8             	mov    %rbp,%rax
09d8   b38318:	48 c1 e8 03          	shr    $0x3,%rax
09dc   b3831c:	42 8a 04 20          	mov    (%rax,%r12,1),%al
09e0   b38320:	84 c0                	test   %al,%al
09e2   b38322:	0f 85 c0 0e 00 00    	jne    b391e8 <leaf_cut_from_buffer+0x18a8>
09e8   b38328:	8b 2b                	mov    (%rbx),%ebp
09ea   b3832a:	48 8d 5f 01          	lea    0x1(%rdi),%rbx
09ee   b3832e:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
09f3   b38333:	42 8a 04 20          	mov    (%rax,%r12,1),%al
09f7   b38337:	84 c0                	test   %al,%al
09f9   b38339:	0f 85 d2 0e 00 00    	jne    b39211 <leaf_cut_from_buffer+0x18d1>
09ff   b3833f:	48 89 d8             	mov    %rbx,%rax
0a02   b38342:	48 c1 e8 03          	shr    $0x3,%rax
0a06   b38346:	42 8a 04 20          	mov    (%rax,%r12,1),%al
0a0a   b3834a:	84 c0                	test   %al,%al
0a0c   b3834c:	0f 85 e8 0e 00 00    	jne    b3923a <leaf_cut_from_buffer+0x18fa>
0a12   b38352:	66 83 3f 00          	cmpw   $0x0,(%rdi)
0a16   b38356:	0f 84 7d 01 00 00    	je     b384d9 <leaf_cut_from_buffer+0xb99>
0a1c   b3835c:	e8 00 00 00 00       	call   b38361 <leaf_cut_from_buffer+0xa21>	b3835d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0a21   b38361:	48 8b 3c 24          	mov    (%rsp),%rdi
0a25   b38365:	48 8d 5f 07          	lea    0x7(%rdi),%rbx
0a29   b38369:	48 89 f8             	mov    %rdi,%rax
0a2c   b3836c:	48 c1 e8 03          	shr    $0x3,%rax
0a30   b38370:	42 8a 04 20          	mov    (%rax,%r12,1),%al
0a34   b38374:	84 c0                	test   %al,%al
0a36   b38376:	0f 85 72 0f 00 00    	jne    b392ee <leaf_cut_from_buffer+0x19ae>
0a3c   b3837c:	48 89 d8             	mov    %rbx,%rax
0a3f   b3837f:	48 c1 e8 03          	shr    $0x3,%rax
0a43   b38383:	42 8a 04 20          	mov    (%rax,%r12,1),%al
0a47   b38387:	84 c0                	test   %al,%al
0a49   b38389:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
0a4e   b3838e:	0f 85 7a 0f 00 00    	jne    b3930e <leaf_cut_from_buffer+0x19ce>
0a54   b38394:	48 8b 07             	mov    (%rdi),%rax
0a57   b38397:	48 b9 00 00 00 00 00 00 00 f0 	movabs $0xf000000000000000,%rcx
0a61   b383a1:	48 21 c8             	and    %rcx,%rax
0a64   b383a4:	48 09 e8             	or     %rbp,%rax
0a67   b383a7:	48 89 07             	mov    %rax,(%rdi)
0a6a   b383aa:	e9 64 01 00 00       	jmp    b38513 <leaf_cut_from_buffer+0xbd3>
0a6f   b383af:	48 8d 7a 04          	lea    0x4(%rdx),%rdi
0a73   b383b3:	48 8d 5a 07          	lea    0x7(%rdx),%rbx
0a77   b383b7:	48 89 f8             	mov    %rdi,%rax
0a7a   b383ba:	48 c1 e8 03          	shr    $0x3,%rax
0a7e   b383be:	42 8a 04 20          	mov    (%rax,%r12,1),%al
0a82   b383c2:	84 c0                	test   %al,%al
0a84   b383c4:	0f 85 6c 0f 00 00    	jne    b39336 <leaf_cut_from_buffer+0x19f6>
0a8a   b383ca:	48 89 d8             	mov    %rbx,%rax
0a8d   b383cd:	48 c1 e8 03          	shr    $0x3,%rax
0a91   b383d1:	42 8a 04 20          	mov    (%rax,%r12,1),%al
0a95   b383d5:	84 c0                	test   %al,%al
0a97   b383d7:	0f 85 79 0f 00 00    	jne    b39356 <leaf_cut_from_buffer+0x1a16>
0a9d   b383dd:	8b 5a 04             	mov    0x4(%rdx),%ebx
0aa0   b383e0:	4c 8d 72 03          	lea    0x3(%rdx),%r14
0aa4   b383e4:	48 89 d5             	mov    %rdx,%rbp
0aa7   b383e7:	48 c1 ed 03          	shr    $0x3,%rbp
0aab   b383eb:	42 8a 44 25 00       	mov    0x0(%rbp,%r12,1),%al
0ab0   b383f0:	84 c0                	test   %al,%al
0ab2   b383f2:	4d 89 e7             	mov    %r12,%r15
0ab5   b383f5:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
0aba   b383fa:	0f 85 79 0f 00 00    	jne    b39379 <leaf_cut_from_buffer+0x1a39>
0ac0   b38400:	4d 89 f4             	mov    %r14,%r12
0ac3   b38403:	49 c1 ec 03          	shr    $0x3,%r12
0ac7   b38407:	43 8a 04 3c          	mov    (%r12,%r15,1),%al
0acb   b3840b:	84 c0                	test   %al,%al
0acd   b3840d:	0f 85 8e 0f 00 00    	jne    b393a1 <leaf_cut_from_buffer+0x1a61>
0ad3   b38413:	44 8b 3a             	mov    (%rdx),%r15d
0ad6   b38416:	83 fb ff             	cmp    $0xffffffff,%ebx
0ad9   b38419:	0f 84 67 06 00 00    	je     b38a86 <leaf_cut_from_buffer+0x1146>
0adf   b3841f:	48 c1 ef 02          	shr    $0x2,%rdi
0ae3   b38423:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
0ae8   b38428:	48 8d 58 20          	lea    0x20(%rax),%rbx
0aec   b3842c:	48 89 d8             	mov    %rbx,%rax
0aef   b3842f:	48 c1 e8 03          	shr    $0x3,%rax
0af3   b38433:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
0afd   b3843d:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
0b01   b38441:	74 1c                	je     b3845f <leaf_cut_from_buffer+0xb1f>
0b03   b38443:	4c 89 74 24 30       	mov    %r14,0x30(%rsp)
0b08   b38448:	49 89 fe             	mov    %rdi,%r14
0b0b   b3844b:	48 89 df             	mov    %rbx,%rdi
0b0e   b3844e:	e8 00 00 00 00       	call   b38453 <leaf_cut_from_buffer+0xb13>	b3844f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0b13   b38453:	4c 89 f7             	mov    %r14,%rdi
0b16   b38456:	4c 8b 74 24 30       	mov    0x30(%rsp),%r14
0b1b   b3845b:	48 8b 14 24          	mov    (%rsp),%rdx
0b1f   b3845f:	0f af 3b             	imul   (%rbx),%edi
0b22   b38462:	48 bb 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbx
0b2c   b3846c:	8a 44 1d 00          	mov    0x0(%rbp,%rbx,1),%al
0b30   b38470:	84 c0                	test   %al,%al
0b32   b38472:	0f 85 fd 10 00 00    	jne    b39575 <leaf_cut_from_buffer+0x1c35>
0b38   b38478:	41 01 ff             	add    %edi,%r15d
0b3b   b3847b:	41 8a 04 1c          	mov    (%r12,%rbx,1),%al
0b3f   b3847f:	84 c0                	test   %al,%al
0b41   b38481:	49 89 dc             	mov    %rbx,%r12
0b44   b38484:	48 8b 6c 24 28       	mov    0x28(%rsp),%rbp
0b49   b38489:	0f 85 0f 11 00 00    	jne    b3959e <leaf_cut_from_buffer+0x1c5e>
0b4f   b3848f:	44 89 3a             	mov    %r15d,(%rdx)
0b52   b38492:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
0b57   b38497:	48 8d 5f 01          	lea    0x1(%rdi),%rbx
0b5b   b3849b:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
0b60   b384a0:	42 8a 04 20          	mov    (%rax,%r12,1),%al
0b64   b384a4:	84 c0                	test   %al,%al
0b66   b384a6:	0f 85 16 11 00 00    	jne    b395c2 <leaf_cut_from_buffer+0x1c82>
0b6c   b384ac:	48 89 d8             	mov    %rbx,%rax
0b6f   b384af:	48 c1 e8 03          	shr    $0x3,%rax
0b73   b384b3:	42 8a 04 20          	mov    (%rax,%r12,1),%al
0b77   b384b7:	84 c0                	test   %al,%al
0b79   b384b9:	4c 8b 74 24 48       	mov    0x48(%rsp),%r14
0b7e   b384be:	0f 85 1f 11 00 00    	jne    b395e3 <leaf_cut_from_buffer+0x1ca3>
0b84   b384c4:	0f b7 07             	movzwl (%rdi),%eax
0b87   b384c7:	39 e8                	cmp    %ebp,%eax
0b89   b384c9:	0f 85 fc 05 00 00    	jne    b38acb <leaf_cut_from_buffer+0x118b>
0b8f   b384cf:	e8 00 00 00 00       	call   b384d4 <leaf_cut_from_buffer+0xb94>	b384d0: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0b94   b384d4:	e9 5c 05 00 00       	jmp    b38a35 <leaf_cut_from_buffer+0x10f5>
0b99   b384d9:	e8 00 00 00 00       	call   b384de <leaf_cut_from_buffer+0xb9e>	b384da: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0b9e   b384de:	48 8b 3c 24          	mov    (%rsp),%rdi
0ba2   b384e2:	48 8d 5f 03          	lea    0x3(%rdi),%rbx
0ba6   b384e6:	48 89 f8             	mov    %rdi,%rax
0ba9   b384e9:	48 c1 e8 03          	shr    $0x3,%rax
0bad   b384ed:	42 8a 04 20          	mov    (%rax,%r12,1),%al
0bb1   b384f1:	84 c0                	test   %al,%al
0bb3   b384f3:	0f 85 d1 0e 00 00    	jne    b393ca <leaf_cut_from_buffer+0x1a8a>
0bb9   b384f9:	48 89 d8             	mov    %rbx,%rax
0bbc   b384fc:	48 c1 e8 03          	shr    $0x3,%rax
0bc0   b38500:	42 8a 04 20          	mov    (%rax,%r12,1),%al
0bc4   b38504:	84 c0                	test   %al,%al
0bc6   b38506:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
0bcb   b3850b:	0f 85 d9 0e 00 00    	jne    b393ea <leaf_cut_from_buffer+0x1aaa>
0bd1   b38511:	89 2f                	mov    %ebp,(%rdi)
0bd3   b38513:	48 8b 44 24 78       	mov    0x78(%rsp),%rax
0bd8   b38518:	48 8d 04 40          	lea    (%rax,%rax,2),%rax
0bdc   b3851c:	48 8d 1c c2          	lea    (%rdx,%rax,8),%rbx
0be0   b38520:	48 83 c3 fc          	add    $0xfffffffffffffffc,%rbx
0be4   b38524:	48 8d 2c c2          	lea    (%rdx,%rax,8),%rbp
0be8   b38528:	48 83 c5 fd          	add    $0xfffffffffffffffd,%rbp
0bec   b3852c:	48 89 d8             	mov    %rbx,%rax
0bef   b3852f:	48 c1 e8 03          	shr    $0x3,%rax
0bf3   b38533:	42 8a 04 20          	mov    (%rax,%r12,1),%al
0bf7   b38537:	84 c0                	test   %al,%al
0bf9   b38539:	0f 85 24 0d 00 00    	jne    b39263 <leaf_cut_from_buffer+0x1923>
0bff   b3853f:	48 89 e8             	mov    %rbp,%rax
0c02   b38542:	48 c1 e8 03          	shr    $0x3,%rax
0c06   b38546:	42 8a 04 20          	mov    (%rax,%r12,1),%al
0c0a   b3854a:	84 c0                	test   %al,%al
0c0c   b3854c:	0f 85 30 0d 00 00    	jne    b39282 <leaf_cut_from_buffer+0x1942>
0c12   b38552:	44 0f b7 3b          	movzwl (%rbx),%r15d
0c16   b38556:	41 0f b7 ef          	movzwl %r15w,%ebp
0c1a   b3855a:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
0c1f   b3855f:	48 8d 58 20          	lea    0x20(%rax),%rbx
0c23   b38563:	48 89 d8             	mov    %rbx,%rax
0c26   b38566:	48 c1 e8 03          	shr    $0x3,%rax
0c2a   b3856a:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
0c2f   b3856f:	74 08                	je     b38579 <leaf_cut_from_buffer+0xc39>
0c31   b38571:	48 89 df             	mov    %rbx,%rdi
0c34   b38574:	e8 00 00 00 00       	call   b38579 <leaf_cut_from_buffer+0xc39>	b38575: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0c39   b38579:	48 8b 03             	mov    (%rbx),%rax
0c3c   b3857c:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
0c41   b38581:	01 cd                	add    %ecx,%ebp
0c43   b38583:	29 e8                	sub    %ebp,%eax
0c45   b38585:	4c 63 e8             	movslq %eax,%r13
0c48   b38588:	41 0f b7 ef          	movzwl %r15w,%ebp
0c4c   b3858c:	4c 63 f1             	movslq %ecx,%r14
0c4f   b3858f:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	b38592: R_X86_64_32S	_ftrace_annotated_branch+0xbadb0
0c56   b38596:	31 f6                	xor    %esi,%esi
0c58   b38598:	31 d2                	xor    %edx,%edx
0c5a   b3859a:	b9 01 00 00 00       	mov    $0x1,%ecx
0c5f   b3859f:	e8 00 00 00 00       	call   b385a4 <leaf_cut_from_buffer+0xc64>	b385a0: R_X86_64_PLT32	ftrace_likely_update-0x4
0c64   b385a4:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	b385a7: R_X86_64_32S	_ftrace_annotated_branch+0xbade0
0c6b   b385ab:	31 f6                	xor    %esi,%esi
0c6d   b385ad:	31 d2                	xor    %edx,%edx
0c6f   b385af:	b9 01 00 00 00       	mov    $0x1,%ecx
0c74   b385b4:	e8 00 00 00 00       	call   b385b9 <leaf_cut_from_buffer+0xc79>	b385b5: R_X86_64_PLT32	ftrace_likely_update-0x4
0c79   b385b9:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	b385bc: R_X86_64_32S	_ftrace_annotated_branch+0xbae10
0c80   b385c0:	31 f6                	xor    %esi,%esi
0c82   b385c2:	31 d2                	xor    %edx,%edx
0c84   b385c4:	b9 01 00 00 00       	mov    $0x1,%ecx
0c89   b385c9:	e8 00 00 00 00       	call   b385ce <leaf_cut_from_buffer+0xc8e>	b385ca: R_X86_64_PLT32	ftrace_likely_update-0x4
0c8e   b385ce:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
0c93   b385d3:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
0c98   b385d8:	48 8b 9c 24 90 00 00 00 	mov    0x90(%rsp),%rbx
0ca0   b385e0:	74 08                	je     b385ea <leaf_cut_from_buffer+0xcaa>
0ca2   b385e2:	48 89 df             	mov    %rbx,%rdi
0ca5   b385e5:	e8 00 00 00 00       	call   b385ea <leaf_cut_from_buffer+0xcaa>	b385e6: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0caa   b385ea:	48 03 2b             	add    (%rbx),%rbp
0cad   b385ed:	49 8d 3c 2e          	lea    (%r14,%rbp,1),%rdi
0cb1   b385f1:	48 89 ee             	mov    %rbp,%rsi
0cb4   b385f4:	4c 89 ea             	mov    %r13,%rdx
0cb7   b385f7:	e8 00 00 00 00       	call   b385fc <leaf_cut_from_buffer+0xcbc>	b385f8: R_X86_64_PLT32	memmove-0x4
0cbc   b385fc:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
0cc1   b38601:	48 8d 58 12          	lea    0x12(%rax),%rbx
0cc5   b38605:	48 8d 68 13          	lea    0x13(%rax),%rbp
0cc9   b38609:	48 89 d8             	mov    %rbx,%rax
0ccc   b3860c:	48 c1 e8 03          	shr    $0x3,%rax
0cd0   b38610:	42 8a 04 20          	mov    (%rax,%r12,1),%al
0cd4   b38614:	84 c0                	test   %al,%al
0cd6   b38616:	4c 8b 6c 24 58       	mov    0x58(%rsp),%r13
0cdb   b3861b:	0f 85 16 05 00 00    	jne    b38b37 <leaf_cut_from_buffer+0x11f7>
0ce1   b38621:	48 89 e8             	mov    %rbp,%rax
0ce4   b38624:	48 c1 e8 03          	shr    $0x3,%rax
0ce8   b38628:	42 8a 04 20          	mov    (%rax,%r12,1),%al
0cec   b3862c:	84 c0                	test   %al,%al
0cee   b3862e:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
0cf3   b38633:	0f 85 1d 05 00 00    	jne    b38b56 <leaf_cut_from_buffer+0x1216>
0cf9   b38639:	66 44 29 33          	sub    %r14w,(%rbx)
0cfd   b3863d:	48 8d 5f 01          	lea    0x1(%rdi),%rbx
0d01   b38641:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
0d06   b38646:	42 8a 04 20          	mov    (%rax,%r12,1),%al
0d0a   b3864a:	84 c0                	test   %al,%al
0d0c   b3864c:	0f 85 2d 05 00 00    	jne    b38b7f <leaf_cut_from_buffer+0x123f>
0d12   b38652:	48 89 d8             	mov    %rbx,%rax
0d15   b38655:	48 c1 e8 03          	shr    $0x3,%rax
0d19   b38659:	42 8a 04 20          	mov    (%rax,%r12,1),%al
0d1d   b3865d:	84 c0                	test   %al,%al
0d1f   b3865f:	0f 85 43 05 00 00    	jne    b38ba8 <leaf_cut_from_buffer+0x1268>
0d25   b38665:	66 83 3f 00          	cmpw   $0x0,(%rdi)
0d29   b38669:	74 52                	je     b386bd <leaf_cut_from_buffer+0xd7d>
0d2b   b3866b:	e8 00 00 00 00       	call   b38670 <leaf_cut_from_buffer+0xd30>	b3866c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0d30   b38670:	48 8b 3c 24          	mov    (%rsp),%rdi
0d34   b38674:	48 8d 5f 07          	lea    0x7(%rdi),%rbx
0d38   b38678:	48 89 f8             	mov    %rdi,%rax
0d3b   b3867b:	48 c1 e8 03          	shr    $0x3,%rax
0d3f   b3867f:	42 8a 04 20          	mov    (%rax,%r12,1),%al
0d43   b38683:	84 c0                	test   %al,%al
0d45   b38685:	0f 85 e3 05 00 00    	jne    b38c6e <leaf_cut_from_buffer+0x132e>
0d4b   b3868b:	48 89 d8             	mov    %rbx,%rax
0d4e   b3868e:	48 c1 e8 03          	shr    $0x3,%rax
0d52   b38692:	42 8a 04 20          	mov    (%rax,%r12,1),%al
0d56   b38696:	84 c0                	test   %al,%al
0d58   b38698:	0f 85 f0 05 00 00    	jne    b38c8e <leaf_cut_from_buffer+0x134e>
0d5e   b3869e:	48 b8 00 00 00 00 00 00 00 f0 	movabs $0xf000000000000000,%rax
0d68   b386a8:	48 23 07             	and    (%rdi),%rax
0d6b   b386ab:	48 b9 ff ff ff ff ff ff ff 0f 	movabs $0xfffffffffffffff,%rcx
0d75   b386b5:	48 ff c1             	inc    %rcx
0d78   b386b8:	48 39 c8             	cmp    %rcx,%rax
0d7b   b386bb:	eb 3a                	jmp    b386f7 <leaf_cut_from_buffer+0xdb7>
0d7d   b386bd:	e8 00 00 00 00       	call   b386c2 <leaf_cut_from_buffer+0xd82>	b386be: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0d82   b386c2:	48 8b 14 24          	mov    (%rsp),%rdx
0d86   b386c6:	48 8d 5a 04          	lea    0x4(%rdx),%rbx
0d8a   b386ca:	48 83 c2 07          	add    $0x7,%rdx
0d8e   b386ce:	48 89 d8             	mov    %rbx,%rax
0d91   b386d1:	48 c1 e8 03          	shr    $0x3,%rax
0d95   b386d5:	42 8a 04 20          	mov    (%rax,%r12,1),%al
0d99   b386d9:	84 c0                	test   %al,%al
0d9b   b386db:	0f 85 6e 07 00 00    	jne    b38e4f <leaf_cut_from_buffer+0x150f>
0da1   b386e1:	48 89 d0             	mov    %rdx,%rax
0da4   b386e4:	48 c1 e8 03          	shr    $0x3,%rax
0da8   b386e8:	42 8a 04 20          	mov    (%rax,%r12,1),%al
0dac   b386ec:	84 c0                	test   %al,%al
0dae   b386ee:	0f 85 80 07 00 00    	jne    b38e74 <leaf_cut_from_buffer+0x1534>
0db4   b386f4:	83 3b fe             	cmpl   $0xfffffffe,(%rbx)
0db7   b386f7:	0f 94 c0             	sete   %al
0dba   b386fa:	45 85 ed             	test   %r13d,%r13d
0dbd   b386fd:	74 43                	je     b38742 <leaf_cut_from_buffer+0xe02>
0dbf   b386ff:	84 c0                	test   %al,%al
0dc1   b38701:	74 3f                	je     b38742 <leaf_cut_from_buffer+0xe02>
0dc3   b38703:	e8 00 00 00 00       	call   b38708 <leaf_cut_from_buffer+0xdc8>	b38704: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0dc8   b38708:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
0dcd   b3870d:	48 8d 5a 10          	lea    0x10(%rdx),%rbx
0dd1   b38711:	48 8d 6a 11          	lea    0x11(%rdx),%rbp
0dd5   b38715:	48 89 d8             	mov    %rbx,%rax
0dd8   b38718:	48 c1 e8 03          	shr    $0x3,%rax
0ddc   b3871c:	42 8a 04 20          	mov    (%rax,%r12,1),%al
0de0   b38720:	84 c0                	test   %al,%al
0de2   b38722:	0f 85 a1 06 00 00    	jne    b38dc9 <leaf_cut_from_buffer+0x1489>
0de8   b38728:	48 89 e8             	mov    %rbp,%rax
0deb   b3872b:	48 c1 e8 03          	shr    $0x3,%rax
0def   b3872f:	42 8a 04 20          	mov    (%rax,%r12,1),%al
0df3   b38733:	84 c0                	test   %al,%al
0df5   b38735:	0f 85 b2 06 00 00    	jne    b38ded <leaf_cut_from_buffer+0x14ad>
0dfb   b3873b:	66 c7 03 00 00       	movw   $0x0,(%rbx)
0e00   b38740:	eb 0a                	jmp    b3874c <leaf_cut_from_buffer+0xe0c>
0e02   b38742:	e8 00 00 00 00       	call   b38747 <leaf_cut_from_buffer+0xe07>	b38743: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0e07   b38747:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
0e0c   b3874c:	48 8b 44 24 78       	mov    0x78(%rsp),%rax
0e11   b38751:	3b 44 24 48          	cmp    0x48(%rsp),%eax
0e15   b38755:	0f 8e 92 00 00 00    	jle    b387ed <leaf_cut_from_buffer+0xead>
0e1b   b3875b:	89 c0                	mov    %eax,%eax
0e1d   b3875d:	4c 8b ac 24 a8 00 00 00 	mov    0xa8(%rsp),%r13
0e25   b38765:	49 f7 d5             	not    %r13
0e28   b38768:	49 01 c5             	add    %rax,%r13
0e2b   b3876b:	45 31 ff             	xor    %r15d,%r15d
0e2e   b3876e:	49 63 c7             	movslq %r15d,%rax
0e31   b38771:	48 8d 2c 40          	lea    (%rax,%rax,2),%rbp
0e35   b38775:	48 8d 1c ea          	lea    (%rdx,%rbp,8),%rbx
0e39   b38779:	48 83 c3 14          	add    $0x14,%rbx
0e3d   b3877d:	48 89 d8             	mov    %rbx,%rax
0e40   b38780:	48 c1 e8 03          	shr    $0x3,%rax
0e44   b38784:	42 8a 04 20          	mov    (%rax,%r12,1),%al
0e48   b38788:	84 c0                	test   %al,%al
0e4a   b3878a:	75 2f                	jne    b387bb <leaf_cut_from_buffer+0xe7b>
0e4c   b3878c:	48 8d 3c ea          	lea    (%rdx,%rbp,8),%rdi
0e50   b38790:	48 83 c7 15          	add    $0x15,%rdi
0e54   b38794:	48 89 f8             	mov    %rdi,%rax
0e57   b38797:	48 c1 e8 03          	shr    $0x3,%rax
0e5b   b3879b:	42 8a 04 20          	mov    (%rax,%r12,1),%al
0e5f   b3879f:	84 c0                	test   %al,%al
0e61   b387a1:	75 35                	jne    b387d8 <leaf_cut_from_buffer+0xe98>
0e63   b387a3:	66 44 01 33          	add    %r14w,(%rbx)
0e67   b387a7:	4d 39 fd             	cmp    %r15,%r13
0e6a   b387aa:	74 48                	je     b387f4 <leaf_cut_from_buffer+0xeb4>
0e6c   b387ac:	e8 00 00 00 00       	call   b387b1 <leaf_cut_from_buffer+0xe71>	b387ad: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0e71   b387b1:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
0e76   b387b6:	49 ff c7             	inc    %r15
0e79   b387b9:	eb b3                	jmp    b3876e <leaf_cut_from_buffer+0xe2e>
0e7b   b387bb:	89 d9                	mov    %ebx,%ecx
0e7d   b387bd:	80 e1 07             	and    $0x7,%cl
0e80   b387c0:	38 c1                	cmp    %al,%cl
0e82   b387c2:	7c c8                	jl     b3878c <leaf_cut_from_buffer+0xe4c>
0e84   b387c4:	be 02 00 00 00       	mov    $0x2,%esi
0e89   b387c9:	48 89 df             	mov    %rbx,%rdi
0e8c   b387cc:	e8 00 00 00 00       	call   b387d1 <leaf_cut_from_buffer+0xe91>	b387cd: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
0e91   b387d1:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
0e96   b387d6:	eb b4                	jmp    b3878c <leaf_cut_from_buffer+0xe4c>
0e98   b387d8:	89 f9                	mov    %edi,%ecx
0e9a   b387da:	80 e1 07             	and    $0x7,%cl
0e9d   b387dd:	38 c1                	cmp    %al,%cl
0e9f   b387df:	7c c2                	jl     b387a3 <leaf_cut_from_buffer+0xe63>
0ea1   b387e1:	be 02 00 00 00       	mov    $0x2,%esi
0ea6   b387e6:	e8 00 00 00 00       	call   b387eb <leaf_cut_from_buffer+0xeab>	b387e7: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
0eab   b387eb:	eb b6                	jmp    b387a3 <leaf_cut_from_buffer+0xe63>
0ead   b387ed:	e8 00 00 00 00       	call   b387f2 <leaf_cut_from_buffer+0xeb2>	b387ee: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0eb2   b387f2:	eb 05                	jmp    b387f9 <leaf_cut_from_buffer+0xeb9>
0eb4   b387f4:	e8 00 00 00 00       	call   b387f9 <leaf_cut_from_buffer+0xeb9>	b387f5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0eb9   b387f9:	48 8b 5c 24 60       	mov    0x60(%rsp),%rbx
0ebe   b387fe:	48 83 c3 04          	add    $0x4,%rbx
0ec2   b38802:	48 89 d8             	mov    %rbx,%rax
0ec5   b38805:	48 c1 e8 03          	shr    $0x3,%rax
0ec9   b38809:	42 8a 04 20          	mov    (%rax,%r12,1),%al
0ecd   b3880d:	84 c0                	test   %al,%al
0ecf   b3880f:	0f 85 bc 03 00 00    	jne    b38bd1 <leaf_cut_from_buffer+0x1291>
0ed5   b38815:	66 44 01 33          	add    %r14w,(%rbx)
0ed9   b38819:	4c 8b ac 24 80 00 00 00 	mov    0x80(%rsp),%r13
0ee1   b38821:	4d 89 ef             	mov    %r13,%r15
0ee4   b38824:	49 c1 ef 03          	shr    $0x3,%r15
0ee8   b38828:	43 80 3c 27 00       	cmpb   $0x0,(%r15,%r12,1)
0eed   b3882d:	74 08                	je     b38837 <leaf_cut_from_buffer+0xef7>
0eef   b3882f:	4c 89 ef             	mov    %r13,%rdi
0ef2   b38832:	e8 00 00 00 00       	call   b38837 <leaf_cut_from_buffer+0xef7>	b38833: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0ef7   b38837:	49 8b 7d 00          	mov    0x0(%r13),%rdi
0efb   b3883b:	48 8b 74 24 50       	mov    0x50(%rsp),%rsi
0f00   b38840:	31 d2                	xor    %edx,%edx
0f02   b38842:	e8 00 00 00 00       	call   b38847 <leaf_cut_from_buffer+0xf07>	b38843: R_X86_64_PLT32	do_balance_mark_leaf_dirty-0x4
0f07   b38847:	49 83 c5 10          	add    $0x10,%r13
0f0b   b3884b:	4c 89 eb             	mov    %r13,%rbx
0f0e   b3884e:	48 c1 eb 03          	shr    $0x3,%rbx
0f12   b38852:	42 80 3c 23 00       	cmpb   $0x0,(%rbx,%r12,1)
0f17   b38857:	74 08                	je     b38861 <leaf_cut_from_buffer+0xf21>
0f19   b38859:	4c 89 ef             	mov    %r13,%rdi
0f1c   b3885c:	e8 00 00 00 00       	call   b38861 <leaf_cut_from_buffer+0xf21>	b3885d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0f21   b38861:	49 8b 6d 00          	mov    0x0(%r13),%rbp
0f25   b38865:	48 85 ed             	test   %rbp,%rbp
0f28   b38868:	0f 84 df 00 00 00    	je     b3894d <leaf_cut_from_buffer+0x100d>
0f2e   b3886e:	e8 00 00 00 00       	call   b38873 <leaf_cut_from_buffer+0xf33>	b3886f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0f33   b38873:	48 83 c5 28          	add    $0x28,%rbp
0f37   b38877:	48 89 e8             	mov    %rbp,%rax
0f3a   b3887a:	48 c1 e8 03          	shr    $0x3,%rax
0f3e   b3887e:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
0f43   b38883:	74 08                	je     b3888d <leaf_cut_from_buffer+0xf4d>
0f45   b38885:	48 89 ef             	mov    %rbp,%rdi
0f48   b38888:	e8 00 00 00 00       	call   b3888d <leaf_cut_from_buffer+0xf4d>	b38889: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0f4d   b3888d:	48 8b 6d 00          	mov    0x0(%rbp),%rbp
0f51   b38891:	4c 8d 65 18          	lea    0x18(%rbp),%r12
0f55   b38895:	48 83 c5 02          	add    $0x2,%rbp
0f59   b38899:	48 89 e8             	mov    %rbp,%rax
0f5c   b3889c:	48 c1 e8 03          	shr    $0x3,%rax
0f60   b388a0:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0f6a   b388aa:	8a 04 10             	mov    (%rax,%rdx,1),%al
0f6d   b388ad:	84 c0                	test   %al,%al
0f6f   b388af:	0f 85 fc 03 00 00    	jne    b38cb1 <leaf_cut_from_buffer+0x1371>
0f75   b388b5:	0f b7 45 00          	movzwl 0x0(%rbp),%eax
0f79   b388b9:	48 c1 e0 04          	shl    $0x4,%rax
0f7d   b388bd:	49 01 c4             	add    %rax,%r12
0f80   b388c0:	48 8b 84 24 80 00 00 00 	mov    0x80(%rsp),%rax
0f88   b388c8:	48 8d 68 18          	lea    0x18(%rax),%rbp
0f8c   b388cc:	48 89 e8             	mov    %rbp,%rax
0f8f   b388cf:	48 c1 e8 03          	shr    $0x3,%rax
0f93   b388d3:	8a 04 10             	mov    (%rax,%rdx,1),%al
0f96   b388d6:	84 c0                	test   %al,%al
0f98   b388d8:	0f 85 f9 03 00 00    	jne    b38cd7 <leaf_cut_from_buffer+0x1397>
0f9e   b388de:	48 63 45 00          	movslq 0x0(%rbp),%rax
0fa2   b388e2:	49 8d 2c c4          	lea    (%r12,%rax,8),%rbp
0fa6   b388e6:	48 83 c5 04          	add    $0x4,%rbp
0faa   b388ea:	48 89 e8             	mov    %rbp,%rax
0fad   b388ed:	48 c1 e8 03          	shr    $0x3,%rax
0fb1   b388f1:	8a 04 10             	mov    (%rax,%rdx,1),%al
0fb4   b388f4:	84 c0                	test   %al,%al
0fb6   b388f6:	49 89 d4             	mov    %rdx,%r12
0fb9   b388f9:	0f 85 ff 03 00 00    	jne    b38cfe <leaf_cut_from_buffer+0x13be>
0fbf   b388ff:	66 44 29 75 00       	sub    %r14w,0x0(%rbp)
0fc4   b38904:	43 80 3c 27 00       	cmpb   $0x0,(%r15,%r12,1)
0fc9   b38909:	48 8b ac 24 80 00 00 00 	mov    0x80(%rsp),%rbp
0fd1   b38911:	74 08                	je     b3891b <leaf_cut_from_buffer+0xfdb>
0fd3   b38913:	48 89 ef             	mov    %rbp,%rdi
0fd6   b38916:	e8 00 00 00 00       	call   b3891b <leaf_cut_from_buffer+0xfdb>	b38917: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0fdb   b3891b:	48 8b 6d 00          	mov    0x0(%rbp),%rbp
0fdf   b3891f:	42 80 3c 23 00       	cmpb   $0x0,(%rbx,%r12,1)
0fe4   b38924:	74 08                	je     b3892e <leaf_cut_from_buffer+0xfee>
0fe6   b38926:	4c 89 ef             	mov    %r13,%rdi
0fe9   b38929:	e8 00 00 00 00       	call   b3892e <leaf_cut_from_buffer+0xfee>	b3892a: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0fee   b3892e:	49 8b 75 00          	mov    0x0(%r13),%rsi
0ff2   b38932:	48 89 ef             	mov    %rbp,%rdi
0ff5   b38935:	31 d2                	xor    %edx,%edx
0ff7   b38937:	48 81 c4 b0 00 00 00 	add    $0xb0,%rsp
0ffe   b3893e:	5b                   	pop    %rbx
0fff   b3893f:	41 5c                	pop    %r12
1001   b38941:	41 5d                	pop    %r13
1003   b38943:	41 5e                	pop    %r14
1005   b38945:	41 5f                	pop    %r15
1007   b38947:	5d                   	pop    %rbp
1008   b38948:	e9 00 00 00 00       	jmp    b3894d <leaf_cut_from_buffer+0x100d>	b38949: R_X86_64_PLT32	do_balance_mark_leaf_dirty-0x4
100d   b3894d:	e8 00 00 00 00       	call   b38952 <leaf_cut_from_buffer+0x1012>	b3894e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1012   b38952:	48 81 c4 b0 00 00 00 	add    $0xb0,%rsp
1019   b38959:	5b                   	pop    %rbx
101a   b3895a:	41 5c                	pop    %r12
101c   b3895c:	41 5d                	pop    %r13
101e   b3895e:	41 5e                	pop    %r14
1020   b38960:	41 5f                	pop    %r15
1022   b38962:	5d                   	pop    %rbp
1023   b38963:	c3                   	ret
1024   b38964:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
1029   b38969:	48 c1 ef 02          	shr    $0x2,%rdi
102d   b3896d:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
1032   b38972:	4c 8d 68 20          	lea    0x20(%rax),%r13
1036   b38976:	4c 89 e8             	mov    %r13,%rax
1039   b38979:	48 c1 e8 03          	shr    $0x3,%rax
103d   b3897d:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
1047   b38987:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
104b   b3898b:	74 1e                	je     b389ab <leaf_cut_from_buffer+0x106b>
104d   b3898d:	66 44 89 7c 24 30    	mov    %r15w,0x30(%rsp)
1053   b38993:	49 89 ff             	mov    %rdi,%r15
1056   b38996:	4c 89 ef             	mov    %r13,%rdi
1059   b38999:	e8 00 00 00 00       	call   b3899e <leaf_cut_from_buffer+0x105e>	b3899a: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
105e   b3899e:	4c 89 ff             	mov    %r15,%rdi
1061   b389a1:	44 0f b7 7c 24 30    	movzwl 0x30(%rsp),%r15d
1067   b389a7:	48 8b 14 24          	mov    (%rsp),%rdx
106b   b389ab:	49 0f af 7d 00       	imul   0x0(%r13),%rdi
1070   b389b0:	48 01 df             	add    %rbx,%rdi
1073   b389b3:	48 b8 ff ff ff ff ff ff ff 0f 	movabs $0xfffffffffffffff,%rax
107d   b389bd:	48 21 c7             	and    %rax,%rdi
1080   b389c0:	48 bb 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbx
108a   b389ca:	41 8a 04 1e          	mov    (%r14,%rbx,1),%al
108e   b389ce:	84 c0                	test   %al,%al
1090   b389d0:	0f 85 8b 0a 00 00    	jne    b39461 <leaf_cut_from_buffer+0x1b21>
1096   b389d6:	48 09 ef             	or     %rbp,%rdi
1099   b389d9:	41 8a 04 1c          	mov    (%r12,%rbx,1),%al
109d   b389dd:	84 c0                	test   %al,%al
109f   b389df:	49 89 dc             	mov    %rbx,%r12
10a2   b389e2:	4c 8b 74 24 48       	mov    0x48(%rsp),%r14
10a7   b389e7:	0f 85 9d 0a 00 00    	jne    b3948a <leaf_cut_from_buffer+0x1b4a>
10ad   b389ed:	48 89 3a             	mov    %rdi,(%rdx)
10b0   b389f0:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
10b5   b389f5:	48 8d 5f 01          	lea    0x1(%rdi),%rbx
10b9   b389f9:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
10be   b389fe:	42 8a 04 20          	mov    (%rax,%r12,1),%al
10c2   b38a02:	84 c0                	test   %al,%al
10c4   b38a04:	48 8b 6c 24 28       	mov    0x28(%rsp),%rbp
10c9   b38a09:	0f 85 a9 0a 00 00    	jne    b394b8 <leaf_cut_from_buffer+0x1b78>
10cf   b38a0f:	48 89 d8             	mov    %rbx,%rax
10d2   b38a12:	48 c1 e8 03          	shr    $0x3,%rax
10d6   b38a16:	42 8a 04 20          	mov    (%rax,%r12,1),%al
10da   b38a1a:	84 c0                	test   %al,%al
10dc   b38a1c:	0f 85 b7 0a 00 00    	jne    b394d9 <leaf_cut_from_buffer+0x1b99>
10e2   b38a22:	0f b7 07             	movzwl (%rdi),%eax
10e5   b38a25:	39 e8                	cmp    %ebp,%eax
10e7   b38a27:	75 53                	jne    b38a7c <leaf_cut_from_buffer+0x113c>
10e9   b38a29:	66 41 83 ff 01       	cmp    $0x1,%r15w
10ee   b38a2e:	74 4c                	je     b38a7c <leaf_cut_from_buffer+0x113c>
10f0   b38a30:	e8 00 00 00 00       	call   b38a35 <leaf_cut_from_buffer+0x10f5>	b38a31: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
10f5   b38a35:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
10fa   b38a3a:	48 8d 58 10          	lea    0x10(%rax),%rbx
10fe   b38a3e:	48 8d 68 11          	lea    0x11(%rax),%rbp
1102   b38a42:	48 89 d8             	mov    %rbx,%rax
1105   b38a45:	48 c1 e8 03          	shr    $0x3,%rax
1109   b38a49:	42 8a 04 20          	mov    (%rax,%r12,1),%al
110d   b38a4d:	84 c0                	test   %al,%al
110f   b38a4f:	0f 85 a8 0a 00 00    	jne    b394fd <leaf_cut_from_buffer+0x1bbd>
1115   b38a55:	48 89 e8             	mov    %rbp,%rax
1118   b38a58:	48 c1 e8 03          	shr    $0x3,%rax
111c   b38a5c:	42 8a 04 20          	mov    (%rax,%r12,1),%al
1120   b38a60:	84 c0                	test   %al,%al
1122   b38a62:	0f 85 b4 0a 00 00    	jne    b3951c <leaf_cut_from_buffer+0x1bdc>
1128   b38a68:	66 83 3b 00          	cmpw   $0x0,(%rbx)
112c   b38a6c:	0f 85 8f 0c 00 00    	jne    b39701 <leaf_cut_from_buffer+0x1dc1>
1132   b38a72:	e8 00 00 00 00       	call   b38a77 <leaf_cut_from_buffer+0x1137>	b38a73: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1137   b38a77:	e9 76 f7 ff ff       	jmp    b381f2 <leaf_cut_from_buffer+0x8b2>
113c   b38a7c:	e8 00 00 00 00       	call   b38a81 <leaf_cut_from_buffer+0x1141>	b38a7d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1141   b38a81:	e9 6c f7 ff ff       	jmp    b381f2 <leaf_cut_from_buffer+0x8b2>
1146   b38a86:	e8 00 00 00 00       	call   b38a8b <leaf_cut_from_buffer+0x114b>	b38a87: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
114b   b38a8b:	48 bb 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbx
1155   b38a95:	8a 44 1d 00          	mov    0x0(%rbp,%rbx,1),%al
1159   b38a99:	84 c0                	test   %al,%al
115b   b38a9b:	0f 85 ad 0b 00 00    	jne    b3964e <leaf_cut_from_buffer+0x1d0e>
1161   b38aa1:	44 03 7c 24 28       	add    0x28(%rsp),%r15d
1166   b38aa6:	41 8a 04 1c          	mov    (%r12,%rbx,1),%al
116a   b38aaa:	84 c0                	test   %al,%al
116c   b38aac:	49 89 dc             	mov    %rbx,%r12
116f   b38aaf:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
1174   b38ab4:	48 8b 34 24          	mov    (%rsp),%rsi
1178   b38ab8:	0f 85 b2 0b 00 00    	jne    b39670 <leaf_cut_from_buffer+0x1d30>
117e   b38abe:	44 89 3e             	mov    %r15d,(%rsi)
1181   b38ac1:	4c 8b 74 24 48       	mov    0x48(%rsp),%r14
1186   b38ac6:	e9 2c f7 ff ff       	jmp    b381f7 <leaf_cut_from_buffer+0x8b7>
118b   b38acb:	e8 00 00 00 00       	call   b38ad0 <leaf_cut_from_buffer+0x1190>	b38acc: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1190   b38ad0:	e9 1d f7 ff ff       	jmp    b381f2 <leaf_cut_from_buffer+0x8b2>
1195   b38ad5:	89 f9                	mov    %edi,%ecx
1197   b38ad7:	80 e1 07             	and    $0x7,%cl
119a   b38ada:	fe c1                	inc    %cl
119c   b38adc:	38 c1                	cmp    %al,%cl
119e   b38ade:	0f 8c f2 ee ff ff    	jl     b379d6 <leaf_cut_from_buffer+0x96>
11a4   b38ae4:	e8 00 00 00 00       	call   b38ae9 <leaf_cut_from_buffer+0x11a9>	b38ae5: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
11a9   b38ae9:	e9 e8 ee ff ff       	jmp    b379d6 <leaf_cut_from_buffer+0x96>
11ae   b38aee:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
11b3   b38af3:	80 e1 07             	and    $0x7,%cl
11b6   b38af6:	38 c1                	cmp    %al,%cl
11b8   b38af8:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
11bd   b38afd:	0f 8c 1a ef ff ff    	jl     b37a1d <leaf_cut_from_buffer+0xdd>
11c3   b38b03:	be 02 00 00 00       	mov    $0x2,%esi
11c8   b38b08:	e8 00 00 00 00       	call   b38b0d <leaf_cut_from_buffer+0x11cd>	b38b09: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
11cd   b38b0d:	e9 0b ef ff ff       	jmp    b37a1d <leaf_cut_from_buffer+0xdd>
11d2   b38b12:	44 89 f1             	mov    %r14d,%ecx
11d5   b38b15:	80 e1 07             	and    $0x7,%cl
11d8   b38b18:	38 c1                	cmp    %al,%cl
11da   b38b1a:	0f 8c 1d ef ff ff    	jl     b37a3d <leaf_cut_from_buffer+0xfd>
11e0   b38b20:	be 02 00 00 00       	mov    $0x2,%esi
11e5   b38b25:	4c 89 f7             	mov    %r14,%rdi
11e8   b38b28:	e8 00 00 00 00       	call   b38b2d <leaf_cut_from_buffer+0x11ed>	b38b29: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
11ed   b38b2d:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
11f2   b38b32:	e9 06 ef ff ff       	jmp    b37a3d <leaf_cut_from_buffer+0xfd>
11f7   b38b37:	89 d9                	mov    %ebx,%ecx
11f9   b38b39:	80 e1 07             	and    $0x7,%cl
11fc   b38b3c:	38 c1                	cmp    %al,%cl
11fe   b38b3e:	0f 8c dd fa ff ff    	jl     b38621 <leaf_cut_from_buffer+0xce1>
1204   b38b44:	be 02 00 00 00       	mov    $0x2,%esi
1209   b38b49:	48 89 df             	mov    %rbx,%rdi
120c   b38b4c:	e8 00 00 00 00       	call   b38b51 <leaf_cut_from_buffer+0x1211>	b38b4d: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
1211   b38b51:	e9 cb fa ff ff       	jmp    b38621 <leaf_cut_from_buffer+0xce1>
1216   b38b56:	89 e9                	mov    %ebp,%ecx
1218   b38b58:	80 e1 07             	and    $0x7,%cl
121b   b38b5b:	38 c1                	cmp    %al,%cl
121d   b38b5d:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
1222   b38b62:	0f 8c d1 fa ff ff    	jl     b38639 <leaf_cut_from_buffer+0xcf9>
1228   b38b68:	be 02 00 00 00       	mov    $0x2,%esi
122d   b38b6d:	48 89 ef             	mov    %rbp,%rdi
1230   b38b70:	e8 00 00 00 00       	call   b38b75 <leaf_cut_from_buffer+0x1235>	b38b71: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
1235   b38b75:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
123a   b38b7a:	e9 ba fa ff ff       	jmp    b38639 <leaf_cut_from_buffer+0xcf9>
123f   b38b7f:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
1244   b38b84:	80 e1 07             	and    $0x7,%cl
1247   b38b87:	38 c1                	cmp    %al,%cl
1249   b38b89:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
124e   b38b8e:	0f 8c be fa ff ff    	jl     b38652 <leaf_cut_from_buffer+0xd12>
1254   b38b94:	be 02 00 00 00       	mov    $0x2,%esi
1259   b38b99:	e8 00 00 00 00       	call   b38b9e <leaf_cut_from_buffer+0x125e>	b38b9a: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
125e   b38b9e:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
1263   b38ba3:	e9 aa fa ff ff       	jmp    b38652 <leaf_cut_from_buffer+0xd12>
1268   b38ba8:	89 d9                	mov    %ebx,%ecx
126a   b38baa:	80 e1 07             	and    $0x7,%cl
126d   b38bad:	38 c1                	cmp    %al,%cl
126f   b38baf:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
1274   b38bb4:	0f 8c ab fa ff ff    	jl     b38665 <leaf_cut_from_buffer+0xd25>
127a   b38bba:	be 02 00 00 00       	mov    $0x2,%esi
127f   b38bbf:	48 89 df             	mov    %rbx,%rdi
1282   b38bc2:	e8 00 00 00 00       	call   b38bc7 <leaf_cut_from_buffer+0x1287>	b38bc3: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
1287   b38bc7:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
128c   b38bcc:	e9 94 fa ff ff       	jmp    b38665 <leaf_cut_from_buffer+0xd25>
1291   b38bd1:	89 d9                	mov    %ebx,%ecx
1293   b38bd3:	80 e1 07             	and    $0x7,%cl
1296   b38bd6:	fe c1                	inc    %cl
1298   b38bd8:	38 c1                	cmp    %al,%cl
129a   b38bda:	0f 8c 35 fc ff ff    	jl     b38815 <leaf_cut_from_buffer+0xed5>
12a0   b38be0:	48 89 df             	mov    %rbx,%rdi
12a3   b38be3:	e8 00 00 00 00       	call   b38be8 <leaf_cut_from_buffer+0x12a8>	b38be4: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
12a8   b38be8:	e9 28 fc ff ff       	jmp    b38815 <leaf_cut_from_buffer+0xed5>
12ad   b38bed:	89 d9                	mov    %ebx,%ecx
12af   b38bef:	80 e1 07             	and    $0x7,%cl
12b2   b38bf2:	38 c1                	cmp    %al,%cl
12b4   b38bf4:	0f 8c 2f f6 ff ff    	jl     b38229 <leaf_cut_from_buffer+0x8e9>
12ba   b38bfa:	be 02 00 00 00       	mov    $0x2,%esi
12bf   b38bff:	48 89 df             	mov    %rbx,%rdi
12c2   b38c02:	e8 00 00 00 00       	call   b38c07 <leaf_cut_from_buffer+0x12c7>	b38c03: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
12c7   b38c07:	e9 1d f6 ff ff       	jmp    b38229 <leaf_cut_from_buffer+0x8e9>
12cc   b38c0c:	89 e9                	mov    %ebp,%ecx
12ce   b38c0e:	80 e1 07             	and    $0x7,%cl
12d1   b38c11:	38 c1                	cmp    %al,%cl
12d3   b38c13:	0f 8c 23 f6 ff ff    	jl     b3823c <leaf_cut_from_buffer+0x8fc>
12d9   b38c19:	be 02 00 00 00       	mov    $0x2,%esi
12de   b38c1e:	48 89 ef             	mov    %rbp,%rdi
12e1   b38c21:	e8 00 00 00 00       	call   b38c26 <leaf_cut_from_buffer+0x12e6>	b38c22: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
12e6   b38c26:	e9 11 f6 ff ff       	jmp    b3823c <leaf_cut_from_buffer+0x8fc>
12eb   b38c2b:	89 f9                	mov    %edi,%ecx
12ed   b38c2d:	80 e1 07             	and    $0x7,%cl
12f0   b38c30:	38 c1                	cmp    %al,%cl
12f2   b38c32:	0f 8c 47 ee ff ff    	jl     b37a7f <leaf_cut_from_buffer+0x13f>
12f8   b38c38:	be 08 00 00 00       	mov    $0x8,%esi
12fd   b38c3d:	e8 00 00 00 00       	call   b38c42 <leaf_cut_from_buffer+0x1302>	b38c3e: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
1302   b38c42:	48 8b 3c 24          	mov    (%rsp),%rdi
1306   b38c46:	e9 34 ee ff ff       	jmp    b37a7f <leaf_cut_from_buffer+0x13f>
130b   b38c4b:	89 d9                	mov    %ebx,%ecx
130d   b38c4d:	80 e1 07             	and    $0x7,%cl
1310   b38c50:	38 c1                	cmp    %al,%cl
1312   b38c52:	0f 8c 3a ee ff ff    	jl     b37a92 <leaf_cut_from_buffer+0x152>
1318   b38c58:	be 08 00 00 00       	mov    $0x8,%esi
131d   b38c5d:	48 89 df             	mov    %rbx,%rdi
1320   b38c60:	e8 00 00 00 00       	call   b38c65 <leaf_cut_from_buffer+0x1325>	b38c61: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
1325   b38c65:	48 8b 3c 24          	mov    (%rsp),%rdi
1329   b38c69:	e9 24 ee ff ff       	jmp    b37a92 <leaf_cut_from_buffer+0x152>
132e   b38c6e:	89 f9                	mov    %edi,%ecx
1330   b38c70:	80 e1 07             	and    $0x7,%cl
1333   b38c73:	38 c1                	cmp    %al,%cl
1335   b38c75:	0f 8c 10 fa ff ff    	jl     b3868b <leaf_cut_from_buffer+0xd4b>
133b   b38c7b:	be 08 00 00 00       	mov    $0x8,%esi
1340   b38c80:	e8 00 00 00 00       	call   b38c85 <leaf_cut_from_buffer+0x1345>	b38c81: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
1345   b38c85:	48 8b 3c 24          	mov    (%rsp),%rdi
1349   b38c89:	e9 fd f9 ff ff       	jmp    b3868b <leaf_cut_from_buffer+0xd4b>
134e   b38c8e:	89 d9                	mov    %ebx,%ecx
1350   b38c90:	80 e1 07             	and    $0x7,%cl
1353   b38c93:	38 c1                	cmp    %al,%cl
1355   b38c95:	0f 8c 03 fa ff ff    	jl     b3869e <leaf_cut_from_buffer+0xd5e>
135b   b38c9b:	be 08 00 00 00       	mov    $0x8,%esi
1360   b38ca0:	48 89 df             	mov    %rbx,%rdi
1363   b38ca3:	e8 00 00 00 00       	call   b38ca8 <leaf_cut_from_buffer+0x1368>	b38ca4: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
1368   b38ca8:	48 8b 3c 24          	mov    (%rsp),%rdi
136c   b38cac:	e9 ed f9 ff ff       	jmp    b3869e <leaf_cut_from_buffer+0xd5e>
1371   b38cb1:	89 e9                	mov    %ebp,%ecx
1373   b38cb3:	80 e1 07             	and    $0x7,%cl
1376   b38cb6:	fe c1                	inc    %cl
1378   b38cb8:	38 c1                	cmp    %al,%cl
137a   b38cba:	0f 8c f5 fb ff ff    	jl     b388b5 <leaf_cut_from_buffer+0xf75>
1380   b38cc0:	48 89 ef             	mov    %rbp,%rdi
1383   b38cc3:	e8 00 00 00 00       	call   b38cc8 <leaf_cut_from_buffer+0x1388>	b38cc4: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
1388   b38cc8:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
1392   b38cd2:	e9 de fb ff ff       	jmp    b388b5 <leaf_cut_from_buffer+0xf75>
1397   b38cd7:	89 e9                	mov    %ebp,%ecx
1399   b38cd9:	80 e1 07             	and    $0x7,%cl
139c   b38cdc:	80 c1 03             	add    $0x3,%cl
139f   b38cdf:	38 c1                	cmp    %al,%cl
13a1   b38ce1:	0f 8c f7 fb ff ff    	jl     b388de <leaf_cut_from_buffer+0xf9e>
13a7   b38ce7:	48 89 ef             	mov    %rbp,%rdi
13aa   b38cea:	e8 00 00 00 00       	call   b38cef <leaf_cut_from_buffer+0x13af>	b38ceb: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
13af   b38cef:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
13b9   b38cf9:	e9 e0 fb ff ff       	jmp    b388de <leaf_cut_from_buffer+0xf9e>
13be   b38cfe:	89 e9                	mov    %ebp,%ecx
13c0   b38d00:	80 e1 07             	and    $0x7,%cl
13c3   b38d03:	fe c1                	inc    %cl
13c5   b38d05:	38 c1                	cmp    %al,%cl
13c7   b38d07:	0f 8c f2 fb ff ff    	jl     b388ff <leaf_cut_from_buffer+0xfbf>
13cd   b38d0d:	48 89 ef             	mov    %rbp,%rdi
13d0   b38d10:	e8 00 00 00 00       	call   b38d15 <leaf_cut_from_buffer+0x13d5>	b38d11: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
13d5   b38d15:	e9 e5 fb ff ff       	jmp    b388ff <leaf_cut_from_buffer+0xfbf>
13da   b38d1a:	89 d9                	mov    %ebx,%ecx
13dc   b38d1c:	80 e1 07             	and    $0x7,%cl
13df   b38d1f:	38 c1                	cmp    %al,%cl
13e1   b38d21:	0f 8c 47 f5 ff ff    	jl     b3826e <leaf_cut_from_buffer+0x92e>
13e7   b38d27:	be 02 00 00 00       	mov    $0x2,%esi
13ec   b38d2c:	48 89 df             	mov    %rbx,%rdi
13ef   b38d2f:	e8 00 00 00 00       	call   b38d34 <leaf_cut_from_buffer+0x13f4>	b38d30: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
13f4   b38d34:	e9 35 f5 ff ff       	jmp    b3826e <leaf_cut_from_buffer+0x92e>
13f9   b38d39:	44 89 f1             	mov    %r14d,%ecx
13fc   b38d3c:	80 e1 07             	and    $0x7,%cl
13ff   b38d3f:	38 c1                	cmp    %al,%cl
1401   b38d41:	0f 8c 3a f5 ff ff    	jl     b38281 <leaf_cut_from_buffer+0x941>
1407   b38d47:	be 02 00 00 00       	mov    $0x2,%esi
140c   b38d4c:	4c 89 f7             	mov    %r14,%rdi
140f   b38d4f:	e8 00 00 00 00       	call   b38d54 <leaf_cut_from_buffer+0x1414>	b38d50: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
1414   b38d54:	e9 28 f5 ff ff       	jmp    b38281 <leaf_cut_from_buffer+0x941>
1419   b38d59:	49 89 ce             	mov    %rcx,%r14
141c   b38d5c:	89 f9                	mov    %edi,%ecx
141e   b38d5e:	80 e1 07             	and    $0x7,%cl
1421   b38d61:	38 c1                	cmp    %al,%cl
1423   b38d63:	4c 89 f1             	mov    %r14,%rcx
1426   b38d66:	0f 8c 37 ee ff ff    	jl     b37ba3 <leaf_cut_from_buffer+0x263>
142c   b38d6c:	be 02 00 00 00       	mov    $0x2,%esi
1431   b38d71:	48 89 7c 24 38       	mov    %rdi,0x38(%rsp)
1436   b38d76:	48 8b 7c 24 38       	mov    0x38(%rsp),%rdi
143b   b38d7b:	e8 00 00 00 00       	call   b38d80 <leaf_cut_from_buffer+0x1440>	b38d7c: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
1440   b38d80:	4c 89 f1             	mov    %r14,%rcx
1443   b38d83:	48 8b 7c 24 38       	mov    0x38(%rsp),%rdi
1448   b38d88:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
144d   b38d8d:	e9 11 ee ff ff       	jmp    b37ba3 <leaf_cut_from_buffer+0x263>
1452   b38d92:	49 89 ce             	mov    %rcx,%r14
1455   b38d95:	89 d9                	mov    %ebx,%ecx
1457   b38d97:	80 e1 07             	and    $0x7,%cl
145a   b38d9a:	38 c1                	cmp    %al,%cl
145c   b38d9c:	4c 89 f1             	mov    %r14,%rcx
145f   b38d9f:	0f 8c 11 ee ff ff    	jl     b37bb6 <leaf_cut_from_buffer+0x276>
1465   b38da5:	be 02 00 00 00       	mov    $0x2,%esi
146a   b38daa:	48 89 7c 24 38       	mov    %rdi,0x38(%rsp)
146f   b38daf:	48 89 df             	mov    %rbx,%rdi
1472   b38db2:	e8 00 00 00 00       	call   b38db7 <leaf_cut_from_buffer+0x1477>	b38db3: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
1477   b38db7:	4c 89 f1             	mov    %r14,%rcx
147a   b38dba:	48 8b 7c 24 38       	mov    0x38(%rsp),%rdi
147f   b38dbf:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
1484   b38dc4:	e9 ed ed ff ff       	jmp    b37bb6 <leaf_cut_from_buffer+0x276>
1489   b38dc9:	89 d9                	mov    %ebx,%ecx
148b   b38dcb:	80 e1 07             	and    $0x7,%cl
148e   b38dce:	38 c1                	cmp    %al,%cl
1490   b38dd0:	0f 8c 52 f9 ff ff    	jl     b38728 <leaf_cut_from_buffer+0xde8>
1496   b38dd6:	be 02 00 00 00       	mov    $0x2,%esi
149b   b38ddb:	48 89 df             	mov    %rbx,%rdi
149e   b38dde:	e8 00 00 00 00       	call   b38de3 <leaf_cut_from_buffer+0x14a3>	b38ddf: R_X86_64_PLT32	__asan_report_store_n_noabort-0x4
14a3   b38de3:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
14a8   b38de8:	e9 3b f9 ff ff       	jmp    b38728 <leaf_cut_from_buffer+0xde8>
14ad   b38ded:	89 e9                	mov    %ebp,%ecx
14af   b38def:	80 e1 07             	and    $0x7,%cl
14b2   b38df2:	38 c1                	cmp    %al,%cl
14b4   b38df4:	0f 8c 41 f9 ff ff    	jl     b3873b <leaf_cut_from_buffer+0xdfb>
14ba   b38dfa:	be 02 00 00 00       	mov    $0x2,%esi
14bf   b38dff:	48 89 ef             	mov    %rbp,%rdi
14c2   b38e02:	e8 00 00 00 00       	call   b38e07 <leaf_cut_from_buffer+0x14c7>	b38e03: R_X86_64_PLT32	__asan_report_store_n_noabort-0x4
14c7   b38e07:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
14cc   b38e0c:	e9 2a f9 ff ff       	jmp    b3873b <leaf_cut_from_buffer+0xdfb>
14d1   b38e11:	89 d9                	mov    %ebx,%ecx
14d3   b38e13:	80 e1 07             	and    $0x7,%cl
14d6   b38e16:	38 c1                	cmp    %al,%cl
14d8   b38e18:	0f 8c bb ec ff ff    	jl     b37ad9 <leaf_cut_from_buffer+0x199>
14de   b38e1e:	be 04 00 00 00       	mov    $0x4,%esi
14e3   b38e23:	48 89 df             	mov    %rbx,%rdi
14e6   b38e26:	e8 00 00 00 00       	call   b38e2b <leaf_cut_from_buffer+0x14eb>	b38e27: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
14eb   b38e2b:	e9 a9 ec ff ff       	jmp    b37ad9 <leaf_cut_from_buffer+0x199>
14f0   b38e30:	89 e9                	mov    %ebp,%ecx
14f2   b38e32:	80 e1 07             	and    $0x7,%cl
14f5   b38e35:	38 c1                	cmp    %al,%cl
14f7   b38e37:	0f 8c af ec ff ff    	jl     b37aec <leaf_cut_from_buffer+0x1ac>
14fd   b38e3d:	be 04 00 00 00       	mov    $0x4,%esi
1502   b38e42:	48 89 ef             	mov    %rbp,%rdi
1505   b38e45:	e8 00 00 00 00       	call   b38e4a <leaf_cut_from_buffer+0x150a>	b38e46: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
150a   b38e4a:	e9 9d ec ff ff       	jmp    b37aec <leaf_cut_from_buffer+0x1ac>
150f   b38e4f:	89 d9                	mov    %ebx,%ecx
1511   b38e51:	80 e1 07             	and    $0x7,%cl
1514   b38e54:	38 c1                	cmp    %al,%cl
1516   b38e56:	0f 8c 85 f8 ff ff    	jl     b386e1 <leaf_cut_from_buffer+0xda1>
151c   b38e5c:	be 04 00 00 00       	mov    $0x4,%esi
1521   b38e61:	48 89 df             	mov    %rbx,%rdi
1524   b38e64:	48 89 d5             	mov    %rdx,%rbp
1527   b38e67:	e8 00 00 00 00       	call   b38e6c <leaf_cut_from_buffer+0x152c>	b38e68: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
152c   b38e6c:	48 89 ea             	mov    %rbp,%rdx
152f   b38e6f:	e9 6d f8 ff ff       	jmp    b386e1 <leaf_cut_from_buffer+0xda1>
1534   b38e74:	89 d1                	mov    %edx,%ecx
1536   b38e76:	80 e1 07             	and    $0x7,%cl
1539   b38e79:	38 c1                	cmp    %al,%cl
153b   b38e7b:	0f 8c 73 f8 ff ff    	jl     b386f4 <leaf_cut_from_buffer+0xdb4>
1541   b38e81:	be 04 00 00 00       	mov    $0x4,%esi
1546   b38e86:	48 89 d7             	mov    %rdx,%rdi
1549   b38e89:	e8 00 00 00 00       	call   b38e8e <leaf_cut_from_buffer+0x154e>	b38e8a: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
154e   b38e8e:	e9 61 f8 ff ff       	jmp    b386f4 <leaf_cut_from_buffer+0xdb4>
1553   b38e93:	89 d9                	mov    %ebx,%ecx
1555   b38e95:	80 e1 07             	and    $0x7,%cl
1558   b38e98:	38 c1                	cmp    %al,%cl
155a   b38e9a:	0f 8c a9 ec ff ff    	jl     b37b49 <leaf_cut_from_buffer+0x209>
1560   b38ea0:	be 02 00 00 00       	mov    $0x2,%esi
1565   b38ea5:	48 89 df             	mov    %rbx,%rdi
1568   b38ea8:	e8 00 00 00 00       	call   b38ead <leaf_cut_from_buffer+0x156d>	b38ea9: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
156d   b38ead:	e9 97 ec ff ff       	jmp    b37b49 <leaf_cut_from_buffer+0x209>
1572   b38eb2:	44 89 f1             	mov    %r14d,%ecx
1575   b38eb5:	80 e1 07             	and    $0x7,%cl
1578   b38eb8:	38 c1                	cmp    %al,%cl
157a   b38eba:	0f 8c 9f ec ff ff    	jl     b37b5f <leaf_cut_from_buffer+0x21f>
1580   b38ec0:	be 02 00 00 00       	mov    $0x2,%esi
1585   b38ec5:	4c 89 f7             	mov    %r14,%rdi
1588   b38ec8:	e8 00 00 00 00       	call   b38ecd <leaf_cut_from_buffer+0x158d>	b38ec9: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
158d   b38ecd:	e9 8d ec ff ff       	jmp    b37b5f <leaf_cut_from_buffer+0x21f>
1592   b38ed2:	48 89 cd             	mov    %rcx,%rbp
1595   b38ed5:	89 f9                	mov    %edi,%ecx
1597   b38ed7:	80 e1 07             	and    $0x7,%cl
159a   b38eda:	38 c1                	cmp    %al,%cl
159c   b38edc:	48 89 e9             	mov    %rbp,%rcx
159f   b38edf:	0f 8c 09 ed ff ff    	jl     b37bee <leaf_cut_from_buffer+0x2ae>
15a5   b38ee5:	48 89 74 24 18       	mov    %rsi,0x18(%rsp)
15aa   b38eea:	be 02 00 00 00       	mov    $0x2,%esi
15af   b38eef:	e8 00 00 00 00       	call   b38ef4 <leaf_cut_from_buffer+0x15b4>	b38ef0: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
15b4   b38ef4:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
15b9   b38ef9:	48 89 e9             	mov    %rbp,%rcx
15bc   b38efc:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
15c1   b38f01:	e9 e8 ec ff ff       	jmp    b37bee <leaf_cut_from_buffer+0x2ae>
15c6   b38f06:	89 d9                	mov    %ebx,%ecx
15c8   b38f08:	80 e1 07             	and    $0x7,%cl
15cb   b38f0b:	38 c1                	cmp    %al,%cl
15cd   b38f0d:	0f 8c f6 ec ff ff    	jl     b37c09 <leaf_cut_from_buffer+0x2c9>
15d3   b38f13:	48 89 f5             	mov    %rsi,%rbp
15d6   b38f16:	be 02 00 00 00       	mov    $0x2,%esi
15db   b38f1b:	48 89 df             	mov    %rbx,%rdi
15de   b38f1e:	e8 00 00 00 00       	call   b38f23 <leaf_cut_from_buffer+0x15e3>	b38f1f: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
15e3   b38f23:	48 89 ee             	mov    %rbp,%rsi
15e6   b38f26:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
15eb   b38f2b:	e9 d9 ec ff ff       	jmp    b37c09 <leaf_cut_from_buffer+0x2c9>
15f0   b38f30:	89 d9                	mov    %ebx,%ecx
15f2   b38f32:	80 e1 07             	and    $0x7,%cl
15f5   b38f35:	38 c1                	cmp    %al,%cl
15f7   b38f37:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
15fc   b38f3c:	0f 8c 1a ed ff ff    	jl     b37c5c <leaf_cut_from_buffer+0x31c>
1602   b38f42:	48 89 74 24 18       	mov    %rsi,0x18(%rsp)
1607   b38f47:	be 02 00 00 00       	mov    $0x2,%esi
160c   b38f4c:	48 89 df             	mov    %rbx,%rdi
160f   b38f4f:	e8 00 00 00 00       	call   b38f54 <leaf_cut_from_buffer+0x1614>	b38f50: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
1614   b38f54:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
1619   b38f59:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
161e   b38f5e:	e9 f9 ec ff ff       	jmp    b37c5c <leaf_cut_from_buffer+0x31c>
1623   b38f63:	89 e9                	mov    %ebp,%ecx
1625   b38f65:	80 e1 07             	and    $0x7,%cl
1628   b38f68:	38 c1                	cmp    %al,%cl
162a   b38f6a:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
162f   b38f6f:	0f 8c fa ec ff ff    	jl     b37c6f <leaf_cut_from_buffer+0x32f>
1635   b38f75:	48 89 74 24 18       	mov    %rsi,0x18(%rsp)
163a   b38f7a:	be 02 00 00 00       	mov    $0x2,%esi
163f   b38f7f:	48 89 ef             	mov    %rbp,%rdi
1642   b38f82:	e8 00 00 00 00       	call   b38f87 <leaf_cut_from_buffer+0x1647>	b38f83: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
1647   b38f87:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
164c   b38f8c:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
1651   b38f91:	e9 d9 ec ff ff       	jmp    b37c6f <leaf_cut_from_buffer+0x32f>
1656   b38f96:	89 d9                	mov    %ebx,%ecx
1658   b38f98:	80 e1 07             	and    $0x7,%cl
165b   b38f9b:	38 c1                	cmp    %al,%cl
165d   b38f9d:	0f 8c 06 ed ff ff    	jl     b37ca9 <leaf_cut_from_buffer+0x369>
1663   b38fa3:	48 89 74 24 18       	mov    %rsi,0x18(%rsp)
1668   b38fa8:	be 02 00 00 00       	mov    $0x2,%esi
166d   b38fad:	48 89 df             	mov    %rbx,%rdi
1670   b38fb0:	e8 00 00 00 00       	call   b38fb5 <leaf_cut_from_buffer+0x1675>	b38fb1: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
1675   b38fb5:	48 8b 54 24 40       	mov    0x40(%rsp),%rdx
167a   b38fba:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
167f   b38fbf:	e9 e5 ec ff ff       	jmp    b37ca9 <leaf_cut_from_buffer+0x369>
1684   b38fc4:	89 e9                	mov    %ebp,%ecx
1686   b38fc6:	80 e1 07             	and    $0x7,%cl
1689   b38fc9:	38 c1                	cmp    %al,%cl
168b   b38fcb:	0f 8c eb ec ff ff    	jl     b37cbc <leaf_cut_from_buffer+0x37c>
1691   b38fd1:	49 89 f4             	mov    %rsi,%r12
1694   b38fd4:	be 02 00 00 00       	mov    $0x2,%esi
1699   b38fd9:	48 89 ef             	mov    %rbp,%rdi
169c   b38fdc:	48 89 d5             	mov    %rdx,%rbp
169f   b38fdf:	e8 00 00 00 00       	call   b38fe4 <leaf_cut_from_buffer+0x16a4>	b38fe0: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
16a4   b38fe4:	48 89 ea             	mov    %rbp,%rdx
16a7   b38fe7:	4c 89 e6             	mov    %r12,%rsi
16aa   b38fea:	e9 cd ec ff ff       	jmp    b37cbc <leaf_cut_from_buffer+0x37c>
16af   b38fef:	89 d1                	mov    %edx,%ecx
16b1   b38ff1:	80 e1 07             	and    $0x7,%cl
16b4   b38ff4:	38 c1                	cmp    %al,%cl
16b6   b38ff6:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
16bb   b38ffb:	0f 8c ac f0 ff ff    	jl     b380ad <leaf_cut_from_buffer+0x76d>
16c1   b39001:	be 02 00 00 00       	mov    $0x2,%esi
16c6   b39006:	48 8b 7c 24 38       	mov    0x38(%rsp),%rdi
16cb   b3900b:	e8 00 00 00 00       	call   b39010 <leaf_cut_from_buffer+0x16d0>	b3900c: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
16d0   b39010:	48 8b 54 24 38       	mov    0x38(%rsp),%rdx
16d5   b39015:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
16da   b3901a:	e9 8e f0 ff ff       	jmp    b380ad <leaf_cut_from_buffer+0x76d>
16df   b3901f:	89 d9                	mov    %ebx,%ecx
16e1   b39021:	80 e1 07             	and    $0x7,%cl
16e4   b39024:	38 c1                	cmp    %al,%cl
16e6   b39026:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
16eb   b3902b:	0f 8c 92 f0 ff ff    	jl     b380c3 <leaf_cut_from_buffer+0x783>
16f1   b39031:	be 02 00 00 00       	mov    $0x2,%esi
16f6   b39036:	48 89 df             	mov    %rbx,%rdi
16f9   b39039:	e8 00 00 00 00       	call   b3903e <leaf_cut_from_buffer+0x16fe>	b3903a: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
16fe   b3903e:	48 8b 54 24 38       	mov    0x38(%rsp),%rdx
1703   b39043:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
1708   b39048:	e9 76 f0 ff ff       	jmp    b380c3 <leaf_cut_from_buffer+0x783>
170d   b3904d:	89 e9                	mov    %ebp,%ecx
170f   b3904f:	80 e1 07             	and    $0x7,%cl
1712   b39052:	38 c1                	cmp    %al,%cl
1714   b39054:	0f 8c ff f0 ff ff    	jl     b38159 <leaf_cut_from_buffer+0x819>
171a   b3905a:	be 02 00 00 00       	mov    $0x2,%esi
171f   b3905f:	48 89 ef             	mov    %rbp,%rdi
1722   b39062:	e8 00 00 00 00       	call   b39067 <leaf_cut_from_buffer+0x1727>	b39063: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
1727   b39067:	e9 ed f0 ff ff       	jmp    b38159 <leaf_cut_from_buffer+0x819>
172c   b3906c:	89 d9                	mov    %ebx,%ecx
172e   b3906e:	80 e1 07             	and    $0x7,%cl
1731   b39071:	38 c1                	cmp    %al,%cl
1733   b39073:	0f 8c f3 f0 ff ff    	jl     b3816c <leaf_cut_from_buffer+0x82c>
1739   b39079:	be 02 00 00 00       	mov    $0x2,%esi
173e   b3907e:	48 89 df             	mov    %rbx,%rdi
1741   b39081:	e8 00 00 00 00       	call   b39086 <leaf_cut_from_buffer+0x1746>	b39082: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
1746   b39086:	e9 e1 f0 ff ff       	jmp    b3816c <leaf_cut_from_buffer+0x82c>
174b   b3908b:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
1750   b39090:	80 e1 07             	and    $0x7,%cl
1753   b39093:	38 c1                	cmp    %al,%cl
1755   b39095:	0f 8c 1b ed ff ff    	jl     b37db6 <leaf_cut_from_buffer+0x476>
175b   b3909b:	be 02 00 00 00       	mov    $0x2,%esi
1760   b390a0:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
1765   b390a5:	e8 00 00 00 00       	call   b390aa <leaf_cut_from_buffer+0x176a>	b390a6: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
176a   b390aa:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
176f   b390af:	e9 02 ed ff ff       	jmp    b37db6 <leaf_cut_from_buffer+0x476>
1774   b390b4:	89 d9                	mov    %ebx,%ecx
1776   b390b6:	80 e1 07             	and    $0x7,%cl
1779   b390b9:	38 c1                	cmp    %al,%cl
177b   b390bb:	0f 8c 0b ed ff ff    	jl     b37dcc <leaf_cut_from_buffer+0x48c>
1781   b390c1:	be 02 00 00 00       	mov    $0x2,%esi
1786   b390c6:	48 89 df             	mov    %rbx,%rdi
1789   b390c9:	e8 00 00 00 00       	call   b390ce <leaf_cut_from_buffer+0x178e>	b390ca: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
178e   b390ce:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
1793   b390d3:	e9 f4 ec ff ff       	jmp    b37dcc <leaf_cut_from_buffer+0x48c>
1798   b390d8:	44 89 e1             	mov    %r12d,%ecx
179b   b390db:	80 e1 07             	and    $0x7,%cl
179e   b390de:	38 c1                	cmp    %al,%cl
17a0   b390e0:	0f 8c 6f ed ff ff    	jl     b37e55 <leaf_cut_from_buffer+0x515>
17a6   b390e6:	be 02 00 00 00       	mov    $0x2,%esi
17ab   b390eb:	49 89 ff             	mov    %rdi,%r15
17ae   b390ee:	4c 89 e7             	mov    %r12,%rdi
17b1   b390f1:	e8 00 00 00 00       	call   b390f6 <leaf_cut_from_buffer+0x17b6>	b390f2: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
17b6   b390f6:	4c 89 ff             	mov    %r15,%rdi
17b9   b390f9:	e9 57 ed ff ff       	jmp    b37e55 <leaf_cut_from_buffer+0x515>
17be   b390fe:	89 f9                	mov    %edi,%ecx
17c0   b39100:	80 e1 07             	and    $0x7,%cl
17c3   b39103:	38 c1                	cmp    %al,%cl
17c5   b39105:	0f 8c 63 ed ff ff    	jl     b37e6e <leaf_cut_from_buffer+0x52e>
17cb   b3910b:	be 02 00 00 00       	mov    $0x2,%esi
17d0   b39110:	48 89 d5             	mov    %rdx,%rbp
17d3   b39113:	e8 00 00 00 00       	call   b39118 <leaf_cut_from_buffer+0x17d8>	b39114: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
17d8   b39118:	48 89 ea             	mov    %rbp,%rdx
17db   b3911b:	e9 4e ed ff ff       	jmp    b37e6e <leaf_cut_from_buffer+0x52e>
17e0   b39120:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
17e5   b39125:	80 e1 07             	and    $0x7,%cl
17e8   b39128:	38 c1                	cmp    %al,%cl
17ea   b3912a:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
17ef   b3912f:	0f 8c 72 ed ff ff    	jl     b37ea7 <leaf_cut_from_buffer+0x567>
17f5   b39135:	be 02 00 00 00       	mov    $0x2,%esi
17fa   b3913a:	e8 00 00 00 00       	call   b3913f <leaf_cut_from_buffer+0x17ff>	b3913b: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
17ff   b3913f:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
1804   b39144:	e9 5e ed ff ff       	jmp    b37ea7 <leaf_cut_from_buffer+0x567>
1809   b39149:	89 d9                	mov    %ebx,%ecx
180b   b3914b:	80 e1 07             	and    $0x7,%cl
180e   b3914e:	38 c1                	cmp    %al,%cl
1810   b39150:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
1815   b39155:	0f 8c 63 ed ff ff    	jl     b37ebe <leaf_cut_from_buffer+0x57e>
181b   b3915b:	be 02 00 00 00       	mov    $0x2,%esi
1820   b39160:	48 89 df             	mov    %rbx,%rdi
1823   b39163:	e8 00 00 00 00       	call   b39168 <leaf_cut_from_buffer+0x1828>	b39164: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
1828   b39168:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
182d   b3916d:	48 8b 14 24          	mov    (%rsp),%rdx
1831   b39171:	e9 48 ed ff ff       	jmp    b37ebe <leaf_cut_from_buffer+0x57e>
1836   b39176:	89 d9                	mov    %ebx,%ecx
1838   b39178:	80 e1 07             	and    $0x7,%cl
183b   b3917b:	38 c1                	cmp    %al,%cl
183d   b3917d:	0f 8c 59 f1 ff ff    	jl     b382dc <leaf_cut_from_buffer+0x99c>
1843   b39183:	be 02 00 00 00       	mov    $0x2,%esi
1848   b39188:	48 89 df             	mov    %rbx,%rdi
184b   b3918b:	e8 00 00 00 00       	call   b39190 <leaf_cut_from_buffer+0x1850>	b3918c: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
1850   b39190:	e9 47 f1 ff ff       	jmp    b382dc <leaf_cut_from_buffer+0x99c>
1855   b39195:	44 89 f1             	mov    %r14d,%ecx
1858   b39198:	80 e1 07             	and    $0x7,%cl
185b   b3919b:	38 c1                	cmp    %al,%cl
185d   b3919d:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
1862   b391a2:	0f 8c 4c f1 ff ff    	jl     b382f4 <leaf_cut_from_buffer+0x9b4>
1868   b391a8:	be 02 00 00 00       	mov    $0x2,%esi
186d   b391ad:	4c 89 f7             	mov    %r14,%rdi
1870   b391b0:	e8 00 00 00 00       	call   b391b5 <leaf_cut_from_buffer+0x1875>	b391b1: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
1875   b391b5:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
187a   b391ba:	e9 35 f1 ff ff       	jmp    b382f4 <leaf_cut_from_buffer+0x9b4>
187f   b391bf:	89 d9                	mov    %ebx,%ecx
1881   b391c1:	80 e1 07             	and    $0x7,%cl
1884   b391c4:	38 c1                	cmp    %al,%cl
1886   b391c6:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
188b   b391cb:	0f 8c 44 f1 ff ff    	jl     b38315 <leaf_cut_from_buffer+0x9d5>
1891   b391d1:	be 04 00 00 00       	mov    $0x4,%esi
1896   b391d6:	48 89 df             	mov    %rbx,%rdi
1899   b391d9:	e8 00 00 00 00       	call   b391de <leaf_cut_from_buffer+0x189e>	b391da: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
189e   b391de:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
18a3   b391e3:	e9 2d f1 ff ff       	jmp    b38315 <leaf_cut_from_buffer+0x9d5>
18a8   b391e8:	89 e9                	mov    %ebp,%ecx
18aa   b391ea:	80 e1 07             	and    $0x7,%cl
18ad   b391ed:	38 c1                	cmp    %al,%cl
18af   b391ef:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
18b4   b391f4:	0f 8c 2e f1 ff ff    	jl     b38328 <leaf_cut_from_buffer+0x9e8>
18ba   b391fa:	be 04 00 00 00       	mov    $0x4,%esi
18bf   b391ff:	48 89 ef             	mov    %rbp,%rdi
18c2   b39202:	e8 00 00 00 00       	call   b39207 <leaf_cut_from_buffer+0x18c7>	b39203: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
18c7   b39207:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
18cc   b3920c:	e9 17 f1 ff ff       	jmp    b38328 <leaf_cut_from_buffer+0x9e8>
18d1   b39211:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
18d6   b39216:	80 e1 07             	and    $0x7,%cl
18d9   b39219:	38 c1                	cmp    %al,%cl
18db   b3921b:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
18e0   b39220:	0f 8c 19 f1 ff ff    	jl     b3833f <leaf_cut_from_buffer+0x9ff>
18e6   b39226:	be 02 00 00 00       	mov    $0x2,%esi
18eb   b3922b:	e8 00 00 00 00       	call   b39230 <leaf_cut_from_buffer+0x18f0>	b3922c: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
18f0   b39230:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
18f5   b39235:	e9 05 f1 ff ff       	jmp    b3833f <leaf_cut_from_buffer+0x9ff>
18fa   b3923a:	89 d9                	mov    %ebx,%ecx
18fc   b3923c:	80 e1 07             	and    $0x7,%cl
18ff   b3923f:	38 c1                	cmp    %al,%cl
1901   b39241:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
1906   b39246:	0f 8c 06 f1 ff ff    	jl     b38352 <leaf_cut_from_buffer+0xa12>
190c   b3924c:	be 02 00 00 00       	mov    $0x2,%esi
1911   b39251:	48 89 df             	mov    %rbx,%rdi
1914   b39254:	e8 00 00 00 00       	call   b39259 <leaf_cut_from_buffer+0x1919>	b39255: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
1919   b39259:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
191e   b3925e:	e9 ef f0 ff ff       	jmp    b38352 <leaf_cut_from_buffer+0xa12>
1923   b39263:	89 d9                	mov    %ebx,%ecx
1925   b39265:	80 e1 07             	and    $0x7,%cl
1928   b39268:	38 c1                	cmp    %al,%cl
192a   b3926a:	0f 8c cf f2 ff ff    	jl     b3853f <leaf_cut_from_buffer+0xbff>
1930   b39270:	be 02 00 00 00       	mov    $0x2,%esi
1935   b39275:	48 89 df             	mov    %rbx,%rdi
1938   b39278:	e8 00 00 00 00       	call   b3927d <leaf_cut_from_buffer+0x193d>	b39279: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
193d   b3927d:	e9 bd f2 ff ff       	jmp    b3853f <leaf_cut_from_buffer+0xbff>
1942   b39282:	89 e9                	mov    %ebp,%ecx
1944   b39284:	80 e1 07             	and    $0x7,%cl
1947   b39287:	38 c1                	cmp    %al,%cl
1949   b39289:	0f 8c c3 f2 ff ff    	jl     b38552 <leaf_cut_from_buffer+0xc12>
194f   b3928f:	be 02 00 00 00       	mov    $0x2,%esi
1954   b39294:	48 89 ef             	mov    %rbp,%rdi
1957   b39297:	e8 00 00 00 00       	call   b3929c <leaf_cut_from_buffer+0x195c>	b39298: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
195c   b3929c:	e9 b1 f2 ff ff       	jmp    b38552 <leaf_cut_from_buffer+0xc12>
1961   b392a1:	89 d1                	mov    %edx,%ecx
1963   b392a3:	80 e1 07             	and    $0x7,%cl
1966   b392a6:	38 c1                	cmp    %al,%cl
1968   b392a8:	0f 8c 3d ec ff ff    	jl     b37eeb <leaf_cut_from_buffer+0x5ab>
196e   b392ae:	be 08 00 00 00       	mov    $0x8,%esi
1973   b392b3:	48 89 d7             	mov    %rdx,%rdi
1976   b392b6:	e8 00 00 00 00       	call   b392bb <leaf_cut_from_buffer+0x197b>	b392b7: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
197b   b392bb:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
1980   b392c0:	48 8b 14 24          	mov    (%rsp),%rdx
1984   b392c4:	e9 22 ec ff ff       	jmp    b37eeb <leaf_cut_from_buffer+0x5ab>
1989   b392c9:	89 f1                	mov    %esi,%ecx
198b   b392cb:	80 e1 07             	and    $0x7,%cl
198e   b392ce:	38 c1                	cmp    %al,%cl
1990   b392d0:	0f 8c 28 ec ff ff    	jl     b37efe <leaf_cut_from_buffer+0x5be>
1996   b392d6:	be 08 00 00 00       	mov    $0x8,%esi
199b   b392db:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
19a0   b392e0:	e8 00 00 00 00       	call   b392e5 <leaf_cut_from_buffer+0x19a5>	b392e1: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
19a5   b392e5:	48 8b 14 24          	mov    (%rsp),%rdx
19a9   b392e9:	e9 10 ec ff ff       	jmp    b37efe <leaf_cut_from_buffer+0x5be>
19ae   b392ee:	89 f9                	mov    %edi,%ecx
19b0   b392f0:	80 e1 07             	and    $0x7,%cl
19b3   b392f3:	38 c1                	cmp    %al,%cl
19b5   b392f5:	0f 8c 81 f0 ff ff    	jl     b3837c <leaf_cut_from_buffer+0xa3c>
19bb   b392fb:	be 08 00 00 00       	mov    $0x8,%esi
19c0   b39300:	e8 00 00 00 00       	call   b39305 <leaf_cut_from_buffer+0x19c5>	b39301: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
19c5   b39305:	48 8b 3c 24          	mov    (%rsp),%rdi
19c9   b39309:	e9 6e f0 ff ff       	jmp    b3837c <leaf_cut_from_buffer+0xa3c>
19ce   b3930e:	89 d9                	mov    %ebx,%ecx
19d0   b39310:	80 e1 07             	and    $0x7,%cl
19d3   b39313:	38 c1                	cmp    %al,%cl
19d5   b39315:	0f 8c 79 f0 ff ff    	jl     b38394 <leaf_cut_from_buffer+0xa54>
19db   b3931b:	be 08 00 00 00       	mov    $0x8,%esi
19e0   b39320:	48 89 df             	mov    %rbx,%rdi
19e3   b39323:	e8 00 00 00 00       	call   b39328 <leaf_cut_from_buffer+0x19e8>	b39324: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
19e8   b39328:	48 8b 3c 24          	mov    (%rsp),%rdi
19ec   b3932c:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
19f1   b39331:	e9 5e f0 ff ff       	jmp    b38394 <leaf_cut_from_buffer+0xa54>
19f6   b39336:	89 f9                	mov    %edi,%ecx
19f8   b39338:	80 e1 07             	and    $0x7,%cl
19fb   b3933b:	38 c1                	cmp    %al,%cl
19fd   b3933d:	0f 8c 87 f0 ff ff    	jl     b383ca <leaf_cut_from_buffer+0xa8a>
1a03   b39343:	be 04 00 00 00       	mov    $0x4,%esi
1a08   b39348:	e8 00 00 00 00       	call   b3934d <leaf_cut_from_buffer+0x1a0d>	b39349: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
1a0d   b3934d:	48 8b 14 24          	mov    (%rsp),%rdx
1a11   b39351:	e9 74 f0 ff ff       	jmp    b383ca <leaf_cut_from_buffer+0xa8a>
1a16   b39356:	89 d9                	mov    %ebx,%ecx
1a18   b39358:	80 e1 07             	and    $0x7,%cl
1a1b   b3935b:	38 c1                	cmp    %al,%cl
1a1d   b3935d:	0f 8c 7a f0 ff ff    	jl     b383dd <leaf_cut_from_buffer+0xa9d>
1a23   b39363:	be 04 00 00 00       	mov    $0x4,%esi
1a28   b39368:	48 89 df             	mov    %rbx,%rdi
1a2b   b3936b:	e8 00 00 00 00       	call   b39370 <leaf_cut_from_buffer+0x1a30>	b3936c: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
1a30   b39370:	48 8b 14 24          	mov    (%rsp),%rdx
1a34   b39374:	e9 64 f0 ff ff       	jmp    b383dd <leaf_cut_from_buffer+0xa9d>
1a39   b39379:	89 d1                	mov    %edx,%ecx
1a3b   b3937b:	80 e1 07             	and    $0x7,%cl
1a3e   b3937e:	38 c1                	cmp    %al,%cl
1a40   b39380:	0f 8c 7a f0 ff ff    	jl     b38400 <leaf_cut_from_buffer+0xac0>
1a46   b39386:	be 04 00 00 00       	mov    $0x4,%esi
1a4b   b3938b:	48 89 d7             	mov    %rdx,%rdi
1a4e   b3938e:	e8 00 00 00 00       	call   b39393 <leaf_cut_from_buffer+0x1a53>	b3938f: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
1a53   b39393:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
1a58   b39398:	48 8b 14 24          	mov    (%rsp),%rdx
1a5c   b3939c:	e9 5f f0 ff ff       	jmp    b38400 <leaf_cut_from_buffer+0xac0>
1a61   b393a1:	44 89 f1             	mov    %r14d,%ecx
1a64   b393a4:	80 e1 07             	and    $0x7,%cl
1a67   b393a7:	38 c1                	cmp    %al,%cl
1a69   b393a9:	0f 8c 64 f0 ff ff    	jl     b38413 <leaf_cut_from_buffer+0xad3>
1a6f   b393af:	be 04 00 00 00       	mov    $0x4,%esi
1a74   b393b4:	4c 89 f7             	mov    %r14,%rdi
1a77   b393b7:	e8 00 00 00 00       	call   b393bc <leaf_cut_from_buffer+0x1a7c>	b393b8: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
1a7c   b393bc:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
1a81   b393c1:	48 8b 14 24          	mov    (%rsp),%rdx
1a85   b393c5:	e9 49 f0 ff ff       	jmp    b38413 <leaf_cut_from_buffer+0xad3>
1a8a   b393ca:	89 f9                	mov    %edi,%ecx
1a8c   b393cc:	80 e1 07             	and    $0x7,%cl
1a8f   b393cf:	38 c1                	cmp    %al,%cl
1a91   b393d1:	0f 8c 22 f1 ff ff    	jl     b384f9 <leaf_cut_from_buffer+0xbb9>
1a97   b393d7:	be 04 00 00 00       	mov    $0x4,%esi
1a9c   b393dc:	e8 00 00 00 00       	call   b393e1 <leaf_cut_from_buffer+0x1aa1>	b393dd: R_X86_64_PLT32	__asan_report_store_n_noabort-0x4
1aa1   b393e1:	48 8b 3c 24          	mov    (%rsp),%rdi
1aa5   b393e5:	e9 0f f1 ff ff       	jmp    b384f9 <leaf_cut_from_buffer+0xbb9>
1aaa   b393ea:	89 d9                	mov    %ebx,%ecx
1aac   b393ec:	80 e1 07             	and    $0x7,%cl
1aaf   b393ef:	38 c1                	cmp    %al,%cl
1ab1   b393f1:	0f 8c 1a f1 ff ff    	jl     b38511 <leaf_cut_from_buffer+0xbd1>
1ab7   b393f7:	be 04 00 00 00       	mov    $0x4,%esi
1abc   b393fc:	48 89 df             	mov    %rbx,%rdi
1abf   b393ff:	e8 00 00 00 00       	call   b39404 <leaf_cut_from_buffer+0x1ac4>	b39400: R_X86_64_PLT32	__asan_report_store_n_noabort-0x4
1ac4   b39404:	48 8b 3c 24          	mov    (%rsp),%rdi
1ac8   b39408:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
1acd   b3940d:	e9 ff f0 ff ff       	jmp    b38511 <leaf_cut_from_buffer+0xbd1>
1ad2   b39412:	48 8b 0c 24          	mov    (%rsp),%rcx
1ad6   b39416:	80 e1 07             	and    $0x7,%cl
1ad9   b39419:	38 c1                	cmp    %al,%cl
1adb   b3941b:	0f 8c 30 eb ff ff    	jl     b37f51 <leaf_cut_from_buffer+0x611>
1ae1   b39421:	be 08 00 00 00       	mov    $0x8,%esi
1ae6   b39426:	48 8b 3c 24          	mov    (%rsp),%rdi
1aea   b3942a:	e8 00 00 00 00       	call   b3942f <leaf_cut_from_buffer+0x1aef>	b3942b: R_X86_64_PLT32	__asan_report_store_n_noabort-0x4
1aef   b3942f:	e9 1d eb ff ff       	jmp    b37f51 <leaf_cut_from_buffer+0x611>
1af4   b39434:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
1af9   b39439:	80 e1 07             	and    $0x7,%cl
1afc   b3943c:	38 c1                	cmp    %al,%cl
1afe   b3943e:	0f 8c 2d eb ff ff    	jl     b37f71 <leaf_cut_from_buffer+0x631>
1b04   b39444:	be 08 00 00 00       	mov    $0x8,%esi
1b09   b39449:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
1b0e   b3944e:	e8 00 00 00 00       	call   b39453 <leaf_cut_from_buffer+0x1b13>	b3944f: R_X86_64_PLT32	__asan_report_store_n_noabort-0x4
1b13   b39453:	48 8b 34 24          	mov    (%rsp),%rsi
1b17   b39457:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
1b1c   b3945c:	e9 10 eb ff ff       	jmp    b37f71 <leaf_cut_from_buffer+0x631>
1b21   b39461:	89 d1                	mov    %edx,%ecx
1b23   b39463:	80 e1 07             	and    $0x7,%cl
1b26   b39466:	38 c1                	cmp    %al,%cl
1b28   b39468:	0f 8c 68 f5 ff ff    	jl     b389d6 <leaf_cut_from_buffer+0x1096>
1b2e   b3946e:	be 08 00 00 00       	mov    $0x8,%esi
1b33   b39473:	49 89 fe             	mov    %rdi,%r14
1b36   b39476:	48 89 d7             	mov    %rdx,%rdi
1b39   b39479:	e8 00 00 00 00       	call   b3947e <leaf_cut_from_buffer+0x1b3e>	b3947a: R_X86_64_PLT32	__asan_report_store_n_noabort-0x4
1b3e   b3947e:	4c 89 f7             	mov    %r14,%rdi
1b41   b39481:	48 8b 14 24          	mov    (%rsp),%rdx
1b45   b39485:	e9 4c f5 ff ff       	jmp    b389d6 <leaf_cut_from_buffer+0x1096>
1b4a   b3948a:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
1b4f   b3948f:	80 e1 07             	and    $0x7,%cl
1b52   b39492:	38 c1                	cmp    %al,%cl
1b54   b39494:	0f 8c 53 f5 ff ff    	jl     b389ed <leaf_cut_from_buffer+0x10ad>
1b5a   b3949a:	be 08 00 00 00       	mov    $0x8,%esi
1b5f   b3949f:	48 89 fb             	mov    %rdi,%rbx
1b62   b394a2:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
1b67   b394a7:	e8 00 00 00 00       	call   b394ac <leaf_cut_from_buffer+0x1b6c>	b394a8: R_X86_64_PLT32	__asan_report_store_n_noabort-0x4
1b6c   b394ac:	48 89 df             	mov    %rbx,%rdi
1b6f   b394af:	48 8b 14 24          	mov    (%rsp),%rdx
1b73   b394b3:	e9 35 f5 ff ff       	jmp    b389ed <leaf_cut_from_buffer+0x10ad>
1b78   b394b8:	89 f9                	mov    %edi,%ecx
1b7a   b394ba:	80 e1 07             	and    $0x7,%cl
1b7d   b394bd:	38 c1                	cmp    %al,%cl
1b7f   b394bf:	0f 8c 4a f5 ff ff    	jl     b38a0f <leaf_cut_from_buffer+0x10cf>
1b85   b394c5:	be 02 00 00 00       	mov    $0x2,%esi
1b8a   b394ca:	e8 00 00 00 00       	call   b394cf <leaf_cut_from_buffer+0x1b8f>	b394cb: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
1b8f   b394cf:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
1b94   b394d4:	e9 36 f5 ff ff       	jmp    b38a0f <leaf_cut_from_buffer+0x10cf>
1b99   b394d9:	89 d9                	mov    %ebx,%ecx
1b9b   b394db:	80 e1 07             	and    $0x7,%cl
1b9e   b394de:	38 c1                	cmp    %al,%cl
1ba0   b394e0:	0f 8c 3c f5 ff ff    	jl     b38a22 <leaf_cut_from_buffer+0x10e2>
1ba6   b394e6:	be 02 00 00 00       	mov    $0x2,%esi
1bab   b394eb:	48 89 df             	mov    %rbx,%rdi
1bae   b394ee:	e8 00 00 00 00       	call   b394f3 <leaf_cut_from_buffer+0x1bb3>	b394ef: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
1bb3   b394f3:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
1bb8   b394f8:	e9 25 f5 ff ff       	jmp    b38a22 <leaf_cut_from_buffer+0x10e2>
1bbd   b394fd:	89 d9                	mov    %ebx,%ecx
1bbf   b394ff:	80 e1 07             	and    $0x7,%cl
1bc2   b39502:	38 c1                	cmp    %al,%cl
1bc4   b39504:	0f 8c 4b f5 ff ff    	jl     b38a55 <leaf_cut_from_buffer+0x1115>
1bca   b3950a:	be 02 00 00 00       	mov    $0x2,%esi
1bcf   b3950f:	48 89 df             	mov    %rbx,%rdi
1bd2   b39512:	e8 00 00 00 00       	call   b39517 <leaf_cut_from_buffer+0x1bd7>	b39513: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
1bd7   b39517:	e9 39 f5 ff ff       	jmp    b38a55 <leaf_cut_from_buffer+0x1115>
1bdc   b3951c:	89 e9                	mov    %ebp,%ecx
1bde   b3951e:	80 e1 07             	and    $0x7,%cl
1be1   b39521:	38 c1                	cmp    %al,%cl
1be3   b39523:	0f 8c 3f f5 ff ff    	jl     b38a68 <leaf_cut_from_buffer+0x1128>
1be9   b39529:	be 02 00 00 00       	mov    $0x2,%esi
1bee   b3952e:	48 89 ef             	mov    %rbp,%rdi
1bf1   b39531:	e8 00 00 00 00       	call   b39536 <leaf_cut_from_buffer+0x1bf6>	b39532: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
1bf6   b39536:	e9 2d f5 ff ff       	jmp    b38a68 <leaf_cut_from_buffer+0x1128>
1bfb   b3953b:	48 89 f3             	mov    %rsi,%rbx
1bfe   b3953e:	e8 00 00 00 00       	call   b39543 <leaf_cut_from_buffer+0x1c03>	b3953f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1c03   b39543:	e8 00 00 00 00       	call   b39548 <leaf_cut_from_buffer+0x1c08>	b39544: R_X86_64_PLT32	__asan_handle_no_return-0x4
1c08   b39548:	31 ff                	xor    %edi,%edi
1c0a   b3954a:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	b3954d: R_X86_64_32S	.rodata+0x204780
1c11   b39551:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	b39554: R_X86_64_32S	.rodata.str1.1+0x4fdc9
1c18   b39558:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	b3955b: R_X86_64_32S	.rodata+0x206800
1c1f   b3955f:	41 b8 41 04 00 00    	mov    $0x441,%r8d
1c25   b39565:	49 c7 c1 00 00 00 00 	mov    $0x0,%r9	b39568: R_X86_64_32S	.rodata.str1.1+0x4fdc9
1c2c   b3956c:	55                   	push   %rbp
1c2d   b3956d:	41 57                	push   %r15
1c2f   b3956f:	53                   	push   %rbx
1c30   b39570:	e8 00 00 00 00       	call   b39575 <leaf_cut_from_buffer+0x1c35>	b39571: R_X86_64_PLT32	__reiserfs_panic-0x4
1c35   b39575:	89 d1                	mov    %edx,%ecx
1c37   b39577:	80 e1 07             	and    $0x7,%cl
1c3a   b3957a:	38 c1                	cmp    %al,%cl
1c3c   b3957c:	0f 8c f6 ee ff ff    	jl     b38478 <leaf_cut_from_buffer+0xb38>
1c42   b39582:	be 04 00 00 00       	mov    $0x4,%esi
1c47   b39587:	48 89 fd             	mov    %rdi,%rbp
1c4a   b3958a:	48 89 d7             	mov    %rdx,%rdi
1c4d   b3958d:	e8 00 00 00 00       	call   b39592 <leaf_cut_from_buffer+0x1c52>	b3958e: R_X86_64_PLT32	__asan_report_store_n_noabort-0x4
1c52   b39592:	48 89 ef             	mov    %rbp,%rdi
1c55   b39595:	48 8b 14 24          	mov    (%rsp),%rdx
1c59   b39599:	e9 da ee ff ff       	jmp    b38478 <leaf_cut_from_buffer+0xb38>
1c5e   b3959e:	44 89 f1             	mov    %r14d,%ecx
1c61   b395a1:	80 e1 07             	and    $0x7,%cl
1c64   b395a4:	38 c1                	cmp    %al,%cl
1c66   b395a6:	0f 8c e3 ee ff ff    	jl     b3848f <leaf_cut_from_buffer+0xb4f>
1c6c   b395ac:	be 04 00 00 00       	mov    $0x4,%esi
1c71   b395b1:	4c 89 f7             	mov    %r14,%rdi
1c74   b395b4:	e8 00 00 00 00       	call   b395b9 <leaf_cut_from_buffer+0x1c79>	b395b5: R_X86_64_PLT32	__asan_report_store_n_noabort-0x4
1c79   b395b9:	48 8b 14 24          	mov    (%rsp),%rdx
1c7d   b395bd:	e9 cd ee ff ff       	jmp    b3848f <leaf_cut_from_buffer+0xb4f>
1c82   b395c2:	89 f9                	mov    %edi,%ecx
1c84   b395c4:	80 e1 07             	and    $0x7,%cl
1c87   b395c7:	38 c1                	cmp    %al,%cl
1c89   b395c9:	0f 8c dd ee ff ff    	jl     b384ac <leaf_cut_from_buffer+0xb6c>
1c8f   b395cf:	be 02 00 00 00       	mov    $0x2,%esi
1c94   b395d4:	e8 00 00 00 00       	call   b395d9 <leaf_cut_from_buffer+0x1c99>	b395d5: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
1c99   b395d9:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
1c9e   b395de:	e9 c9 ee ff ff       	jmp    b384ac <leaf_cut_from_buffer+0xb6c>
1ca3   b395e3:	89 d9                	mov    %ebx,%ecx
1ca5   b395e5:	80 e1 07             	and    $0x7,%cl
1ca8   b395e8:	38 c1                	cmp    %al,%cl
1caa   b395ea:	0f 8c d4 ee ff ff    	jl     b384c4 <leaf_cut_from_buffer+0xb84>
1cb0   b395f0:	be 02 00 00 00       	mov    $0x2,%esi
1cb5   b395f5:	48 89 df             	mov    %rbx,%rdi
1cb8   b395f8:	e8 00 00 00 00       	call   b395fd <leaf_cut_from_buffer+0x1cbd>	b395f9: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
1cbd   b395fd:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
1cc2   b39602:	e9 bd ee ff ff       	jmp    b384c4 <leaf_cut_from_buffer+0xb84>
1cc7   b39607:	e8 00 00 00 00       	call   b3960c <leaf_cut_from_buffer+0x1ccc>	b39608: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1ccc   b3960c:	e9 8d 00 00 00       	jmp    b3969e <leaf_cut_from_buffer+0x1d5e>
1cd1   b39611:	e8 00 00 00 00       	call   b39616 <leaf_cut_from_buffer+0x1cd6>	b39612: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1cd6   b39616:	4d 63 f7             	movslq %r15d,%r14
1cd9   b39619:	48 63 6c 24 28       	movslq 0x28(%rsp),%rbp
1cde   b3961e:	e8 00 00 00 00       	call   b39623 <leaf_cut_from_buffer+0x1ce3>	b3961f: R_X86_64_PLT32	__asan_handle_no_return-0x4
1ce3   b39623:	31 ff                	xor    %edi,%edi
1ce5   b39625:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	b39628: R_X86_64_32S	.rodata+0x204780
1cec   b3962c:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	b3962f: R_X86_64_32S	.rodata.str1.1+0x78e38
1cf3   b39633:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	b39636: R_X86_64_32S	.rodata+0x205100
1cfa   b3963a:	41 b8 9a 04 00 00    	mov    $0x49a,%r8d
1d00   b39640:	49 c7 c1 00 00 00 00 	mov    $0x0,%r9	b39643: R_X86_64_32S	.rodata.str1.1+0x78e38
1d07   b39647:	53                   	push   %rbx
1d08   b39648:	55                   	push   %rbp
1d09   b39649:	e9 ac 00 00 00       	jmp    b396fa <leaf_cut_from_buffer+0x1dba>
1d0e   b3964e:	48 8b 0c 24          	mov    (%rsp),%rcx
1d12   b39652:	80 e1 07             	and    $0x7,%cl
1d15   b39655:	38 c1                	cmp    %al,%cl
1d17   b39657:	0f 8c 44 f4 ff ff    	jl     b38aa1 <leaf_cut_from_buffer+0x1161>
1d1d   b3965d:	be 04 00 00 00       	mov    $0x4,%esi
1d22   b39662:	48 8b 3c 24          	mov    (%rsp),%rdi
1d26   b39666:	e8 00 00 00 00       	call   b3966b <leaf_cut_from_buffer+0x1d2b>	b39667: R_X86_64_PLT32	__asan_report_store_n_noabort-0x4
1d2b   b3966b:	e9 31 f4 ff ff       	jmp    b38aa1 <leaf_cut_from_buffer+0x1161>
1d30   b39670:	44 89 f1             	mov    %r14d,%ecx
1d33   b39673:	80 e1 07             	and    $0x7,%cl
1d36   b39676:	38 c1                	cmp    %al,%cl
1d38   b39678:	0f 8c 40 f4 ff ff    	jl     b38abe <leaf_cut_from_buffer+0x117e>
1d3e   b3967e:	be 04 00 00 00       	mov    $0x4,%esi
1d43   b39683:	4c 89 f7             	mov    %r14,%rdi
1d46   b39686:	e8 00 00 00 00       	call   b3968b <leaf_cut_from_buffer+0x1d4b>	b39687: R_X86_64_PLT32	__asan_report_store_n_noabort-0x4
1d4b   b3968b:	48 8b 34 24          	mov    (%rsp),%rsi
1d4f   b3968f:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
1d54   b39694:	e9 25 f4 ff ff       	jmp    b38abe <leaf_cut_from_buffer+0x117e>
1d59   b39699:	e8 00 00 00 00       	call   b3969e <leaf_cut_from_buffer+0x1d5e>	b3969a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1d5e   b3969e:	e8 00 00 00 00       	call   b396a3 <leaf_cut_from_buffer+0x1d63>	b3969f: R_X86_64_PLT32	__asan_handle_no_return-0x4
1d63   b396a3:	31 ff                	xor    %edi,%edi
1d65   b396a5:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	b396a8: R_X86_64_32S	.rodata+0x204780
1d6c   b396ac:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	b396af: R_X86_64_32S	.rodata.str1.1+0x78e38
1d73   b396b3:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	b396b6: R_X86_64_32S	.rodata+0x205080
1d7a   b396ba:	41 b8 96 04 00 00    	mov    $0x496,%r8d
1d80   b396c0:	49 c7 c1 00 00 00 00 	mov    $0x0,%r9	b396c3: R_X86_64_32S	.rodata.str1.1+0x78e38
1d87   b396c7:	e8 00 00 00 00       	call   b396cc <leaf_cut_from_buffer+0x1d8c>	b396c8: R_X86_64_PLT32	__reiserfs_panic-0x4
1d8c   b396cc:	e8 00 00 00 00       	call   b396d1 <leaf_cut_from_buffer+0x1d91>	b396cd: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1d91   b396d1:	e8 00 00 00 00       	call   b396d6 <leaf_cut_from_buffer+0x1d96>	b396d2: R_X86_64_PLT32	__asan_handle_no_return-0x4
1d96   b396d6:	31 ff                	xor    %edi,%edi
1d98   b396d8:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	b396db: R_X86_64_32S	.rodata+0x204780
1d9f   b396df:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	b396e2: R_X86_64_32S	.rodata.str1.1+0x78e38
1da6   b396e6:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	b396e9: R_X86_64_32S	.rodata+0x204fc0
1dad   b396ed:	41 b8 90 04 00 00    	mov    $0x490,%r8d
1db3   b396f3:	49 c7 c1 00 00 00 00 	mov    $0x0,%r9	b396f6: R_X86_64_32S	.rodata.str1.1+0x78e38
1dba   b396fa:	41 56                	push   %r14
1dbc   b396fc:	e8 00 00 00 00       	call   b39701 <leaf_cut_from_buffer+0x1dc1>	b396fd: R_X86_64_PLT32	__reiserfs_panic-0x4
1dc1   b39701:	e8 00 00 00 00       	call   b39706 <leaf_cut_from_buffer+0x1dc6>	b39702: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1dc6   b39706:	e8 00 00 00 00       	call   b3970b <leaf_cut_from_buffer+0x1dcb>	b39707: R_X86_64_PLT32	__asan_handle_no_return-0x4
1dcb   b3970b:	31 ff                	xor    %edi,%edi
1dcd   b3970d:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	b39710: R_X86_64_32S	.rodata+0x204780
1dd4   b39714:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	b39717: R_X86_64_32S	.rodata.str1.1+0x78e38
1ddb   b3971b:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	b3971e: R_X86_64_32S	.rodata+0x2051e0
1de2   b39722:	41 b8 ae 04 00 00    	mov    $0x4ae,%r8d
1de8   b39728:	49 c7 c1 00 00 00 00 	mov    $0x0,%r9	b3972b: R_X86_64_32S	.rodata.str1.1+0x78e38
1def   b3972f:	ff 74 24 08          	push   0x8(%rsp)
1df3   b39733:	e8 00 00 00 00       	call   b39738 <leaf_cut_from_buffer+0x1df8>	b39734: R_X86_64_PLT32	__reiserfs_panic-0x4
1df8   b39738:	0f 1f 84 00 00 00 00 00 	nopl   0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
