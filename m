Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73960A2A;
	Thu,  2 Feb 2023 05:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675314253; x=1706850253;
  h=date:from:cc:subject:message-id:mime-version;
  bh=qTyWBQQxY2YjMg3wB1hUdNhGHv4ksbTjMjS1gOvX+Nw=;
  b=YO6JVo1Zz4r8jueFdMUYzuuiDiQdCsKRnGRhzcjeOK4kieSVYC8GiHQb
   BnsgnkHD+8k0I2QZ51U7FBILBT0FoBJcX5PnIbY4goIqLXb4+DgViJ2ho
   x3wDuePJHvPQLhtrQc0mqw4/WbK2akPimOX0Y4LSprSv3m6QJy1HFFwD7
   fAZaUeJSAYW7EzfkhzBFbhddHPr4Qg8hSd1Q5e3SSpeBWizcVx22H+1RD
   fTjiK0148CNHt9nSWN7fU8RBNpQIEPALNCMz5gKeuzSxyfhYkPnoXWywP
   SGFyVMfKFP7Ymm6w9PwIm4IfSWkldakne6hB7Nw69gKCULod5J6SXNOxm
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="316351587"
X-IronPort-AV: E=Sophos;i="5.97,266,1669104000"; 
   d="scan'208";a="316351587"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 21:04:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="697557687"
X-IronPort-AV: E=Sophos;i="5.97,266,1669104000"; 
   d="scan'208";a="697557687"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 01 Feb 2023 21:04:11 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNRla-0006Ae-1n;
	Thu, 02 Feb 2023 05:04:10 +0000
Date: Thu, 2 Feb 2023 13:03:41 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [stable:linux-5.10.y 4130/9999] net/netlink/af_netlink.o: warning:
 objtool: netlink_dump()+0xb28: unreachable instruction
Message-ID: <202302021326.jKVKVPsj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Eric Dumazet <edumazet@google.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Sasha Levin <sashal@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.10.y
head:   8d823aaa220eebec88c9f307225d3e163252ea95
commit: 3d55b195747c1259c994b868a509beae947a7c6e [4130/9999] netlink: reset network and mac headers in netlink_dump()
config: x86_64-randconfig-r025-20230130 (https://download.01.org/0day-ci/archive/20230202/202302021326.jKVKVPsj-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=3d55b195747c1259c994b868a509beae947a7c6e
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.10.y
        git checkout 3d55b195747c1259c994b868a509beae947a7c6e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash net/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> net/netlink/af_netlink.o: warning: objtool: netlink_dump()+0xb28: unreachable instruction


objdump-func vmlinux.o netlink_dump:
0000 000000000220ac20 <netlink_dump>:
0000  220ac20:	55                   	push   %rbp
0001  220ac21:	41 57                	push   %r15
0003  220ac23:	41 56                	push   %r14
0005  220ac25:	41 55                	push   %r13
0007  220ac27:	41 54                	push   %r12
0009  220ac29:	53                   	push   %rbx
000a  220ac2a:	48 81 ec c0 00 00 00 	sub    $0xc0,%rsp
0011  220ac31:	65 48 8b 04 25 28 00 00 00 	mov    %gs:0x28,%rax
001a  220ac3a:	49 89 fe             	mov    %rdi,%r14
001d  220ac3d:	48 8d bc 24 88 00 00 00 	lea    0x88(%rsp),%rdi
0025  220ac45:	ba 30 00 00 00       	mov    $0x30,%edx
002a  220ac4a:	31 f6                	xor    %esi,%esi
002c  220ac4c:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
0036  220ac56:	48 89 84 24 b8 00 00 00 	mov    %rax,0xb8(%rsp)
003e  220ac5e:	e8 00 00 00 00       	call   220ac63 <netlink_dump+0x43>	220ac5f: R_X86_64_PLT32	memset-0x4
0043  220ac63:	4d 8d a6 d0 05 00 00 	lea    0x5d0(%r14),%r12
004a  220ac6a:	4c 89 e3             	mov    %r12,%rbx
004d  220ac6d:	48 c1 eb 03          	shr    $0x3,%rbx
0051  220ac71:	42 80 3c 2b 00       	cmpb   $0x0,(%rbx,%r13,1)
0056  220ac76:	74 08                	je     220ac80 <netlink_dump+0x60>
0058  220ac78:	4c 89 e7             	mov    %r12,%rdi
005b  220ac7b:	e8 00 00 00 00       	call   220ac80 <netlink_dump+0x60>	220ac7c: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0060  220ac80:	49 8b be d0 05 00 00 	mov    0x5d0(%r14),%rdi
0067  220ac87:	31 f6                	xor    %esi,%esi
0069  220ac89:	e8 00 00 00 00       	call   220ac8e <netlink_dump+0x6e>	220ac8a: R_X86_64_PLT32	mutex_lock_nested-0x4
006e  220ac8e:	4d 8d be 49 05 00 00 	lea    0x549(%r14),%r15
0075  220ac95:	4c 89 fa             	mov    %r15,%rdx
0078  220ac98:	48 c1 ea 03          	shr    $0x3,%rdx
007c  220ac9c:	42 8a 04 2a          	mov    (%rdx,%r13,1),%al
0080  220aca0:	84 c0                	test   %al,%al
0082  220aca2:	75 67                	jne    220ad0b <netlink_dump+0xeb>
0084  220aca4:	41 0f b6 2f          	movzbl (%r15),%ebp
0088  220aca8:	48 83 fd 02          	cmp    $0x2,%rbp
008c  220acac:	73 7a                	jae    220ad28 <netlink_dump+0x108>
008e  220acae:	40 f6 c5 01          	test   $0x1,%bpl
0092  220acb2:	0f 85 93 00 00 00    	jne    220ad4b <netlink_dump+0x12b>
0098  220acb8:	bd ea ff ff ff       	mov    $0xffffffea,%ebp
009d  220acbd:	45 31 f6             	xor    %r14d,%r14d
00a0  220acc0:	42 80 3c 2b 00       	cmpb   $0x0,(%rbx,%r13,1)
00a5  220acc5:	74 08                	je     220accf <netlink_dump+0xaf>
00a7  220acc7:	4c 89 e7             	mov    %r12,%rdi
00aa  220acca:	e8 00 00 00 00       	call   220accf <netlink_dump+0xaf>	220accb: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
00af  220accf:	49 8b 3c 24          	mov    (%r12),%rdi
00b3  220acd3:	e8 00 00 00 00       	call   220acd8 <netlink_dump+0xb8>	220acd4: R_X86_64_PLT32	mutex_unlock-0x4
00b8  220acd8:	4c 89 f7             	mov    %r14,%rdi
00bb  220acdb:	e8 00 00 00 00       	call   220ace0 <netlink_dump+0xc0>	220acdc: R_X86_64_PLT32	kfree_skb-0x4
00c0  220ace0:	65 48 8b 04 25 28 00 00 00 	mov    %gs:0x28,%rax
00c9  220ace9:	48 3b 84 24 b8 00 00 00 	cmp    0xb8(%rsp),%rax
00d1  220acf1:	0f 85 fe 0f 00 00    	jne    220bcf5 <netlink_dump+0x10d5>
00d7  220acf7:	89 e8                	mov    %ebp,%eax
00d9  220acf9:	48 81 c4 c0 00 00 00 	add    $0xc0,%rsp
00e0  220ad00:	5b                   	pop    %rbx
00e1  220ad01:	41 5c                	pop    %r12
00e3  220ad03:	41 5d                	pop    %r13
00e5  220ad05:	41 5e                	pop    %r14
00e7  220ad07:	41 5f                	pop    %r15
00e9  220ad09:	5d                   	pop    %rbp
00ea  220ad0a:	c3                   	ret
00eb  220ad0b:	44 89 f9             	mov    %r15d,%ecx
00ee  220ad0e:	80 e1 07             	and    $0x7,%cl
00f1  220ad11:	38 c1                	cmp    %al,%cl
00f3  220ad13:	7c 8f                	jl     220aca4 <netlink_dump+0x84>
00f5  220ad15:	4c 89 ff             	mov    %r15,%rdi
00f8  220ad18:	48 89 d5             	mov    %rdx,%rbp
00fb  220ad1b:	e8 00 00 00 00       	call   220ad20 <netlink_dump+0x100>	220ad1c: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
0100  220ad20:	48 89 ea             	mov    %rbp,%rdx
0103  220ad23:	e9 7c ff ff ff       	jmp    220aca4 <netlink_dump+0x84>
0108  220ad28:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	220ad2b: R_X86_64_32S	.data+0xb7f200
010f  220ad2f:	48 89 ee             	mov    %rbp,%rsi
0112  220ad32:	48 89 54 24 50       	mov    %rdx,0x50(%rsp)
0117  220ad37:	e8 00 00 00 00       	call   220ad3c <netlink_dump+0x11c>	220ad38: R_X86_64_PLT32	__ubsan_handle_load_invalid_value-0x4
011c  220ad3c:	48 8b 54 24 50       	mov    0x50(%rsp),%rdx
0121  220ad41:	40 f6 c5 01          	test   $0x1,%bpl
0125  220ad45:	0f 84 6d ff ff ff    	je     220acb8 <netlink_dump+0x98>
012b  220ad4b:	48 89 5c 24 30       	mov    %rbx,0x30(%rsp)
0130  220ad50:	49 8d 9e 08 02 00 00 	lea    0x208(%r14),%rbx
0137  220ad57:	be 04 00 00 00       	mov    $0x4,%esi
013c  220ad5c:	48 89 54 24 50       	mov    %rdx,0x50(%rsp)
0141  220ad61:	4c 89 7c 24 68       	mov    %r15,0x68(%rsp)
0146  220ad66:	48 89 df             	mov    %rbx,%rdi
0149  220ad69:	e8 00 00 00 00       	call   220ad6e <netlink_dump+0x14e>	220ad6a: R_X86_64_PLT32	__kasan_check_read-0x4
014e  220ad6e:	48 89 d8             	mov    %rbx,%rax
0151  220ad71:	48 c1 e8 03          	shr    $0x3,%rax
0155  220ad75:	42 8a 04 28          	mov    (%rax,%r13,1),%al
0159  220ad79:	84 c0                	test   %al,%al
015b  220ad7b:	0f 85 d4 09 00 00    	jne    220b755 <netlink_dump+0xb35>
0161  220ad81:	49 8d ae 2c 02 00 00 	lea    0x22c(%r14),%rbp
0168  220ad88:	45 8b be 08 02 00 00 	mov    0x208(%r14),%r15d
016f  220ad8f:	48 89 e8             	mov    %rbp,%rax
0172  220ad92:	48 c1 e8 03          	shr    $0x3,%rax
0176  220ad96:	42 8a 04 28          	mov    (%rax,%r13,1),%al
017a  220ad9a:	84 c0                	test   %al,%al
017c  220ad9c:	0f 85 d0 09 00 00    	jne    220b772 <netlink_dump+0xb52>
0182  220ada2:	44 3b 7d 00          	cmp    0x0(%rbp),%r15d
0186  220ada6:	0f 8d b0 04 00 00    	jge    220b25c <netlink_dump+0x63c>
018c  220adac:	49 8d be 8c 05 00 00 	lea    0x58c(%r14),%rdi
0193  220adb3:	48 89 5c 24 28       	mov    %rbx,0x28(%rsp)
0198  220adb8:	48 89 f8             	mov    %rdi,%rax
019b  220adbb:	48 c1 e8 03          	shr    $0x3,%rax
019f  220adbf:	42 8a 04 28          	mov    (%rax,%r13,1),%al
01a3  220adc3:	84 c0                	test   %al,%al
01a5  220adc5:	0f 85 c4 09 00 00    	jne    220b78f <netlink_dump+0xb6f>
01ab  220adcb:	41 8b 86 8c 05 00 00 	mov    0x58c(%r14),%eax
01b2  220add2:	49 8d 9e f0 04 00 00 	lea    0x4f0(%r14),%rbx
01b9  220add9:	bd 80 0e 00 00       	mov    $0xe80,%ebp
01be  220adde:	4c 89 64 24 38       	mov    %r12,0x38(%rsp)
01c3  220ade3:	48 89 d9             	mov    %rbx,%rcx
01c6  220ade6:	3d 81 0e 00 00       	cmp    $0xe81,%eax
01cb  220adeb:	0f 4d e8             	cmovge %eax,%ebp
01ce  220adee:	48 c1 e9 03          	shr    $0x3,%rcx
01d2  220adf2:	42 80 3c 29 00       	cmpb   $0x0,(%rcx,%r13,1)
01d7  220adf7:	74 08                	je     220ae01 <netlink_dump+0x1e1>
01d9  220adf9:	48 89 df             	mov    %rbx,%rdi
01dc  220adfc:	e8 00 00 00 00       	call   220ae01 <netlink_dump+0x1e1>	220adfd: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
01e1  220ae01:	4c 8b 3b             	mov    (%rbx),%r15
01e4  220ae04:	49 39 ef             	cmp    %rbp,%r15
01e7  220ae07:	76 1c                	jbe    220ae25 <netlink_dump+0x205>
01e9  220ae09:	44 89 ff             	mov    %r15d,%edi
01ec  220ae0c:	be c0 28 01 00       	mov    $0x128c0,%esi
01f1  220ae11:	31 d2                	xor    %edx,%edx
01f3  220ae13:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
01f8  220ae18:	e8 00 00 00 00       	call   220ae1d <netlink_dump+0x1fd>	220ae19: R_X86_64_PLT32	__alloc_skb-0x4
01fd  220ae1d:	49 89 c4             	mov    %rax,%r12
0200  220ae20:	48 85 c0             	test   %rax,%rax
0203  220ae23:	75 22                	jne    220ae47 <netlink_dump+0x227>
0205  220ae25:	89 ef                	mov    %ebp,%edi
0207  220ae27:	be c0 0c 00 00       	mov    $0xcc0,%esi
020c  220ae2c:	31 d2                	xor    %edx,%edx
020e  220ae2e:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
0213  220ae33:	e8 00 00 00 00       	call   220ae38 <netlink_dump+0x218>	220ae34: R_X86_64_PLT32	__alloc_skb-0x4
0218  220ae38:	49 89 c4             	mov    %rax,%r12
021b  220ae3b:	48 85 c0             	test   %rax,%rax
021e  220ae3e:	41 89 ef             	mov    %ebp,%r15d
0221  220ae41:	0f 84 10 04 00 00    	je     220b257 <netlink_dump+0x637>
0227  220ae47:	49 8d 5c 24 6c       	lea    0x6c(%r12),%rbx
022c  220ae4c:	48 89 d8             	mov    %rbx,%rax
022f  220ae4f:	48 c1 e8 03          	shr    $0x3,%rax
0233  220ae53:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
0238  220ae58:	42 8a 04 28          	mov    (%rax,%r13,1),%al
023c  220ae5c:	84 c0                	test   %al,%al
023e  220ae5e:	0f 85 45 09 00 00    	jne    220b7a9 <netlink_dump+0xb89>
0244  220ae64:	45 31 ed             	xor    %r13d,%r13d
0247  220ae67:	83 3b 00             	cmpl   $0x0,(%rbx)
024a  220ae6a:	48 89 5c 24 08       	mov    %rbx,0x8(%rsp)
024f  220ae6f:	75 4a                	jne    220aebb <netlink_dump+0x29b>
0251  220ae71:	49 8d bc 24 ac 00 00 00 	lea    0xac(%r12),%rdi
0259  220ae79:	48 bb 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbx
0263  220ae83:	48 89 f8             	mov    %rdi,%rax
0266  220ae86:	48 c1 e8 03          	shr    $0x3,%rax
026a  220ae8a:	8a 04 18             	mov    (%rax,%rbx,1),%al
026d  220ae8d:	84 c0                	test   %al,%al
026f  220ae8f:	0f 85 46 0a 00 00    	jne    220b8db <netlink_dump+0xcbb>
0275  220ae95:	49 8d ac 24 a8 00 00 00 	lea    0xa8(%r12),%rbp
027d  220ae9d:	45 8b ac 24 ac 00 00 00 	mov    0xac(%r12),%r13d
0285  220aea5:	48 89 e8             	mov    %rbp,%rax
0288  220aea8:	48 c1 e8 03          	shr    $0x3,%rax
028c  220aeac:	8a 04 18             	mov    (%rax,%rbx,1),%al
028f  220aeaf:	84 c0                	test   %al,%al
0291  220aeb1:	0f 85 3e 0a 00 00    	jne    220b8f5 <netlink_dump+0xcd5>
0297  220aeb7:	44 2b 6d 00          	sub    0x0(%rbp),%r13d
029b  220aebb:	49 8d bc 24 b8 00 00 00 	lea    0xb8(%r12),%rdi
02a3  220aec3:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
02ad  220aecd:	45 29 fd             	sub    %r15d,%r13d
02b0  220aed0:	48 89 f8             	mov    %rdi,%rax
02b3  220aed3:	48 c1 e8 03          	shr    $0x3,%rax
02b7  220aed7:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
02bb  220aedb:	74 05                	je     220aee2 <netlink_dump+0x2c2>
02bd  220aedd:	e8 00 00 00 00       	call   220aee2 <netlink_dump+0x2c2>	220aede: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
02c2  220aee2:	49 63 dd             	movslq %r13d,%rbx
02c5  220aee5:	49 8d 8c 24 a8 00 00 00 	lea    0xa8(%r12),%rcx
02cd  220aeed:	49 bf 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r15
02d7  220aef7:	49 03 9c 24 b8 00 00 00 	add    0xb8(%r12),%rbx
02df  220aeff:	48 89 c8             	mov    %rcx,%rax
02e2  220af02:	48 89 4c 24 20       	mov    %rcx,0x20(%rsp)
02e7  220af07:	48 c1 e9 03          	shr    $0x3,%rcx
02eb  220af0b:	48 89 4c 24 40       	mov    %rcx,0x40(%rsp)
02f0  220af10:	49 89 9c 24 b8 00 00 00 	mov    %rbx,0xb8(%r12)
02f8  220af18:	42 8a 04 39          	mov    (%rcx,%r15,1),%al
02fc  220af1c:	84 c0                	test   %al,%al
02fe  220af1e:	0f 85 a2 08 00 00    	jne    220b7c6 <netlink_dump+0xba6>
0304  220af24:	49 8d ac 24 b0 00 00 00 	lea    0xb0(%r12),%rbp
030c  220af2c:	45 01 ac 24 a8 00 00 00 	add    %r13d,0xa8(%r12)
0314  220af34:	48 89 e8             	mov    %rbp,%rax
0317  220af37:	48 c1 e8 03          	shr    $0x3,%rax
031b  220af3b:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1)
0320  220af40:	48 89 44 24 78       	mov    %rax,0x78(%rsp)
0325  220af45:	74 08                	je     220af4f <netlink_dump+0x32f>
0327  220af47:	48 89 ef             	mov    %rbp,%rdi
032a  220af4a:	e8 00 00 00 00       	call   220af4f <netlink_dump+0x32f>	220af4b: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
032f  220af4f:	49 8d bc 24 a4 00 00 00 	lea    0xa4(%r12),%rdi
0337  220af57:	41 2b 9c 24 b0 00 00 00 	sub    0xb0(%r12),%ebx
033f  220af5f:	48 89 f8             	mov    %rdi,%rax
0342  220af62:	48 c1 e8 03          	shr    $0x3,%rax
0346  220af66:	42 8a 04 38          	mov    (%rax,%r15,1),%al
034a  220af6a:	84 c0                	test   %al,%al
034c  220af6c:	0f 85 76 08 00 00    	jne    220b7e8 <netlink_dump+0xbc8>
0352  220af72:	49 8d bc 24 a6 00 00 00 	lea    0xa6(%r12),%rdi
035a  220af7a:	66 41 89 9c 24 a4 00 00 00 	mov    %bx,0xa4(%r12)
0363  220af83:	48 89 ac 24 80 00 00 00 	mov    %rbp,0x80(%rsp)
036b  220af8b:	48 89 f8             	mov    %rdi,%rax
036e  220af8e:	48 c1 e8 03          	shr    $0x3,%rax
0372  220af92:	42 8a 04 38          	mov    (%rax,%r15,1),%al
0376  220af96:	84 c0                	test   %al,%al
0378  220af98:	0f 85 63 08 00 00    	jne    220b801 <netlink_dump+0xbe1>
037e  220af9e:	49 8d 6c 24 18       	lea    0x18(%r12),%rbp
0383  220afa3:	66 41 89 9c 24 a6 00 00 00 	mov    %bx,0xa6(%r12)
038c  220afac:	48 89 eb             	mov    %rbp,%rbx
038f  220afaf:	48 c1 eb 03          	shr    $0x3,%rbx
0393  220afb3:	42 80 3c 3b 00       	cmpb   $0x0,(%rbx,%r15,1)
0398  220afb8:	74 08                	je     220afc2 <netlink_dump+0x3a2>
039a  220afba:	48 89 ef             	mov    %rbp,%rdi
039d  220afbd:	e8 00 00 00 00       	call   220afc2 <netlink_dump+0x3a2>	220afbe: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
03a2  220afc2:	48 83 7d 00 00       	cmpq   $0x0,0x0(%rbp)
03a7  220afc7:	0f 85 67 07 00 00    	jne    220b734 <netlink_dump+0xb14>
03ad  220afcd:	42 80 3c 3b 00       	cmpb   $0x0,(%rbx,%r15,1)
03b2  220afd2:	74 08                	je     220afdc <netlink_dump+0x3bc>
03b4  220afd4:	48 89 ef             	mov    %rbp,%rdi
03b7  220afd7:	e8 00 00 00 00       	call   220afdc <netlink_dump+0x3bc>	220afd8: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
03bc  220afdc:	49 8d 7c 24 60       	lea    0x60(%r12),%rdi
03c1  220afe1:	4d 89 74 24 18       	mov    %r14,0x18(%r12)
03c6  220afe6:	48 89 f8             	mov    %rdi,%rax
03c9  220afe9:	48 c1 e8 03          	shr    $0x3,%rax
03cd  220afed:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1)
03d2  220aff2:	74 05                	je     220aff9 <netlink_dump+0x3d9>
03d4  220aff4:	e8 00 00 00 00       	call   220aff9 <netlink_dump+0x3d9>	220aff5: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
03d9  220aff9:	4d 8d bc 24 c0 00 00 00 	lea    0xc0(%r12),%r15
03e1  220b001:	49 c7 44 24 60 00 00 00 00 	movq   $0x0,0x60(%r12)	220b006: R_X86_64_32S	.text+0x220caa0
03ea  220b00a:	48 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbp
03f4  220b014:	4d 89 fd             	mov    %r15,%r13
03f7  220b017:	49 c1 ed 03          	shr    $0x3,%r13
03fb  220b01b:	41 8a 44 2d 00       	mov    0x0(%r13,%rbp,1),%al
0400  220b020:	84 c0                	test   %al,%al
0402  220b022:	0f 85 f2 07 00 00    	jne    220b81a <netlink_dump+0xbfa>
0408  220b028:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
040d  220b02d:	41 8b 1f             	mov    (%r15),%ebx
0410  220b030:	be 04 00 00 00       	mov    $0x4,%esi
0415  220b035:	e8 00 00 00 00       	call   220b03a <netlink_dump+0x41a>	220b036: R_X86_64_PLT32	__kasan_check_write-0x4
041a  220b03a:	41 01 9e 08 02 00 00 	add    %ebx,0x208(%r14)
0421  220b041:	49 8d 5e 28          	lea    0x28(%r14),%rbx
0425  220b045:	48 89 d8             	mov    %rbx,%rax
0428  220b048:	48 c1 e8 03          	shr    $0x3,%rax
042c  220b04c:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
0430  220b050:	74 08                	je     220b05a <netlink_dump+0x43a>
0432  220b052:	48 89 df             	mov    %rbx,%rdi
0435  220b055:	e8 00 00 00 00       	call   220b05a <netlink_dump+0x43a>	220b056: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
043a  220b05a:	bd e8 00 00 00       	mov    $0xe8,%ebp
043f  220b05f:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
0449  220b069:	48 03 2b             	add    (%rbx),%rbp
044c  220b06c:	48 89 e8             	mov    %rbp,%rax
044f  220b06f:	48 c1 e8 03          	shr    $0x3,%rax
0453  220b073:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
0457  220b077:	74 08                	je     220b081 <netlink_dump+0x461>
0459  220b079:	48 89 ef             	mov    %rbp,%rdi
045c  220b07c:	e8 00 00 00 00       	call   220b081 <netlink_dump+0x461>	220b07d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0461  220b081:	48 83 7d 00 00       	cmpq   $0x0,0x0(%rbp)
0466  220b086:	74 3a                	je     220b0c2 <netlink_dump+0x4a2>
0468  220b088:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
0472  220b092:	41 8a 44 0d 00       	mov    0x0(%r13,%rcx,1),%al
0477  220b097:	49 89 cd             	mov    %rcx,%r13
047a  220b09a:	84 c0                	test   %al,%al
047c  220b09c:	0f 85 ba 07 00 00    	jne    220b85c <netlink_dump+0xc3c>
0482  220b0a2:	49 8d ae 20 02 00 00 	lea    0x220(%r14),%rbp
0489  220b0a9:	41 8b 1f             	mov    (%r15),%ebx
048c  220b0ac:	48 89 e8             	mov    %rbp,%rax
048f  220b0af:	48 c1 e8 03          	shr    $0x3,%rax
0493  220b0b3:	42 8a 04 28          	mov    (%rax,%r13,1),%al
0497  220b0b7:	84 c0                	test   %al,%al
0499  220b0b9:	0f 85 bb 07 00 00    	jne    220b87a <netlink_dump+0xc5a>
049f  220b0bf:	29 5d 00             	sub    %ebx,0x0(%rbp)
04a2  220b0c2:	49 8d 96 4c 05 00 00 	lea    0x54c(%r14),%rdx
04a9  220b0c9:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
04b3  220b0d3:	48 89 d0             	mov    %rdx,%rax
04b6  220b0d6:	48 89 54 24 10       	mov    %rdx,0x10(%rsp)
04bb  220b0db:	48 c1 e8 03          	shr    $0x3,%rax
04bf  220b0df:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
04c4  220b0e4:	42 8a 04 28          	mov    (%rax,%r13,1),%al
04c8  220b0e8:	84 c0                	test   %al,%al
04ca  220b0ea:	0f 85 48 07 00 00    	jne    220b838 <netlink_dump+0xc18>
04d0  220b0f0:	83 3a 00             	cmpl   $0x0,(%rdx)
04d3  220b0f3:	49 8d ae 50 05 00 00 	lea    0x550(%r14),%rbp
04da  220b0fa:	0f 8e b5 00 00 00    	jle    220b1b5 <netlink_dump+0x595>
04e0  220b100:	4c 89 e8             	mov    %r13,%rax
04e3  220b103:	4d 8d ae 80 05 00 00 	lea    0x580(%r14),%r13
04ea  220b10a:	4d 89 ef             	mov    %r13,%r15
04ed  220b10d:	49 c1 ef 03          	shr    $0x3,%r15
04f1  220b111:	41 80 3c 07 00       	cmpb   $0x0,(%r15,%rax,1)
04f6  220b116:	74 08                	je     220b120 <netlink_dump+0x500>
04f8  220b118:	4c 89 ef             	mov    %r13,%rdi
04fb  220b11b:	e8 00 00 00 00       	call   220b120 <netlink_dump+0x500>	220b11c: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0500  220b120:	49 8d 9e 60 05 00 00 	lea    0x560(%r14),%rbx
0507  220b127:	48 8d 84 24 88 00 00 00 	lea    0x88(%rsp),%rax
050f  220b12f:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
0519  220b139:	48 89 da             	mov    %rbx,%rdx
051c  220b13c:	49 89 86 80 05 00 00 	mov    %rax,0x580(%r14)
0523  220b143:	48 c1 ea 03          	shr    $0x3,%rdx
0527  220b147:	80 3c 0a 00          	cmpb   $0x0,(%rdx,%rcx,1)
052b  220b14b:	74 08                	je     220b155 <netlink_dump+0x535>
052d  220b14d:	48 89 df             	mov    %rbx,%rdi
0530  220b150:	e8 00 00 00 00       	call   220b155 <netlink_dump+0x535>	220b151: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0535  220b155:	4c 8b 1b             	mov    (%rbx),%r11
0538  220b158:	4c 89 e7             	mov    %r12,%rdi
053b  220b15b:	48 89 ee             	mov    %rbp,%rsi
053e  220b15e:	48 89 6c 24 28       	mov    %rbp,0x28(%rsp)
0543  220b163:	e8 00 00 00 00       	call   220b168 <netlink_dump+0x548>	220b164: R_X86_64_PLT32	__x86_indirect_thunk_r11-0x4
0548  220b168:	89 c5                	mov    %eax,%ebp
054a  220b16a:	48 8b 44 24 60       	mov    0x60(%rsp),%rax
054f  220b16f:	48 bb 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbx
0559  220b179:	8a 04 18             	mov    (%rax,%rbx,1),%al
055c  220b17c:	84 c0                	test   %al,%al
055e  220b17e:	0f 85 13 07 00 00    	jne    220b897 <netlink_dump+0xc77>
0564  220b184:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
0569  220b189:	89 28                	mov    %ebp,(%rax)
056b  220b18b:	41 80 3c 1f 00       	cmpb   $0x0,(%r15,%rbx,1)
0570  220b190:	74 08                	je     220b19a <netlink_dump+0x57a>
0572  220b192:	4c 89 ef             	mov    %r13,%rdi
0575  220b195:	e8 00 00 00 00       	call   220b19a <netlink_dump+0x57a>	220b196: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
057a  220b19a:	85 ed                	test   %ebp,%ebp
057c  220b19c:	48 8b 6c 24 28       	mov    0x28(%rsp),%rbp
0581  220b1a1:	49 c7 45 00 00 00 00 00 	movq   $0x0,0x0(%r13)
0589  220b1a9:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
0593  220b1b3:	7f 5f                	jg     220b214 <netlink_dump+0x5f4>
0595  220b1b5:	48 8b 44 24 48       	mov    0x48(%rsp),%rax
059a  220b1ba:	42 8a 04 28          	mov    (%rax,%r13,1),%al
059e  220b1be:	84 c0                	test   %al,%al
05a0  220b1c0:	0f 85 f3 06 00 00    	jne    220b8b9 <netlink_dump+0xc99>
05a6  220b1c6:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
05ab  220b1cb:	83 38 00             	cmpl   $0x0,(%rax)
05ae  220b1ce:	75 44                	jne    220b214 <netlink_dump+0x5f4>
05b0  220b1d0:	4d 8d bc 24 ac 00 00 00 	lea    0xac(%r12),%r15
05b8  220b1d8:	48 89 6c 24 28       	mov    %rbp,0x28(%rsp)
05bd  220b1dd:	4c 89 fb             	mov    %r15,%rbx
05c0  220b1e0:	48 c1 eb 03          	shr    $0x3,%rbx
05c4  220b1e4:	42 8a 04 2b          	mov    (%rbx,%r13,1),%al
05c8  220b1e8:	84 c0                	test   %al,%al
05ca  220b1ea:	0f 85 22 07 00 00    	jne    220b912 <netlink_dump+0xcf2>
05d0  220b1f0:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
05d5  220b1f5:	41 8b 2f             	mov    (%r15),%ebp
05d8  220b1f8:	42 8a 04 28          	mov    (%rax,%r13,1),%al
05dc  220b1fc:	84 c0                	test   %al,%al
05de  220b1fe:	0f 85 2c 07 00 00    	jne    220b930 <netlink_dump+0xd10>
05e4  220b204:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
05e9  220b209:	2b 28                	sub    (%rax),%ebp
05eb  220b20b:	83 fd 13             	cmp    $0x13,%ebp
05ee  220b20e:	0f 8f c5 00 00 00    	jg     220b2d9 <netlink_dump+0x6b9>
05f4  220b214:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
05f9  220b219:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
05fe  220b21e:	74 0a                	je     220b22a <netlink_dump+0x60a>
0600  220b220:	48 8b 7c 24 38       	mov    0x38(%rsp),%rdi
0605  220b225:	e8 00 00 00 00       	call   220b22a <netlink_dump+0x60a>	220b226: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
060a  220b22a:	49 8b be d0 05 00 00 	mov    0x5d0(%r14),%rdi
0611  220b231:	e8 00 00 00 00       	call   220b236 <netlink_dump+0x616>	220b232: R_X86_64_PLT32	mutex_unlock-0x4
0616  220b236:	4c 89 f7             	mov    %r14,%rdi
0619  220b239:	4c 89 e6             	mov    %r12,%rsi
061c  220b23c:	ba 01 00 00 00       	mov    $0x1,%edx
0621  220b241:	e8 00 00 00 00       	call   220b246 <netlink_dump+0x626>	220b242: R_X86_64_PLT32	sk_filter_trim_cap-0x4
0626  220b246:	85 c0                	test   %eax,%eax
0628  220b248:	74 2f                	je     220b279 <netlink_dump+0x659>
062a  220b24a:	4c 89 e7             	mov    %r12,%rdi
062d  220b24d:	e8 00 00 00 00       	call   220b252 <netlink_dump+0x632>	220b24e: R_X86_64_PLT32	kfree_skb-0x4
0632  220b252:	e9 d6 04 00 00       	jmp    220b72d <netlink_dump+0xb0d>
0637  220b257:	4c 8b 64 24 38       	mov    0x38(%rsp),%r12
063c  220b25c:	45 31 f6             	xor    %r14d,%r14d
063f  220b25f:	48 8b 5c 24 30       	mov    0x30(%rsp),%rbx
0644  220b264:	bd 97 ff ff ff       	mov    $0xffffff97,%ebp
0649  220b269:	42 80 3c 2b 00       	cmpb   $0x0,(%rbx,%r13,1)
064e  220b26e:	0f 85 53 fa ff ff    	jne    220acc7 <netlink_dump+0xa7>
0654  220b274:	e9 56 fa ff ff       	jmp    220accf <netlink_dump+0xaf>
0659  220b279:	49 8d 7e 30          	lea    0x30(%r14),%rdi
065d  220b27d:	48 89 f8             	mov    %rdi,%rax
0660  220b280:	48 c1 e8 03          	shr    $0x3,%rax
0664  220b284:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
0669  220b289:	74 05                	je     220b290 <netlink_dump+0x670>
066b  220b28b:	e8 00 00 00 00       	call   220b290 <netlink_dump+0x670>	220b28c: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0670  220b290:	49 8b 7e 30          	mov    0x30(%r14),%rdi
0674  220b294:	4c 89 e6             	mov    %r12,%rsi
0677  220b297:	e8 74 19 00 00       	call   220cc10 <netlink_deliver_tap>
067c  220b29c:	49 8d be b0 01 00 00 	lea    0x1b0(%r14),%rdi
0683  220b2a3:	4c 89 e6             	mov    %r12,%rsi
0686  220b2a6:	e8 00 00 00 00       	call   220b2ab <netlink_dump+0x68b>	220b2a7: R_X86_64_PLT32	skb_queue_tail-0x4
068b  220b2ab:	49 8d be 88 04 00 00 	lea    0x488(%r14),%rdi
0692  220b2b2:	48 89 f8             	mov    %rdi,%rax
0695  220b2b5:	48 c1 e8 03          	shr    $0x3,%rax
0699  220b2b9:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
069e  220b2be:	74 05                	je     220b2c5 <netlink_dump+0x6a5>
06a0  220b2c0:	e8 00 00 00 00       	call   220b2c5 <netlink_dump+0x6a5>	220b2c1: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
06a5  220b2c5:	4d 8b 9e 88 04 00 00 	mov    0x488(%r14),%r11
06ac  220b2cc:	4c 89 f7             	mov    %r14,%rdi
06af  220b2cf:	e8 00 00 00 00       	call   220b2d4 <netlink_dump+0x6b4>	220b2d0: R_X86_64_PLT32	__x86_indirect_thunk_r11-0x4
06b4  220b2d4:	e9 54 04 00 00       	jmp    220b72d <netlink_dump+0xb0d>
06b9  220b2d9:	49 8d ae 8a 05 00 00 	lea    0x58a(%r14),%rbp
06c0  220b2e0:	48 89 e8             	mov    %rbp,%rax
06c3  220b2e3:	48 c1 e8 03          	shr    $0x3,%rax
06c7  220b2e7:	42 8a 04 28          	mov    (%rax,%r13,1),%al
06cb  220b2eb:	84 c0                	test   %al,%al
06cd  220b2ed:	0f 85 5f 06 00 00    	jne    220b952 <netlink_dump+0xd32>
06d3  220b2f3:	42 8a 04 2b          	mov    (%rbx,%r13,1),%al
06d7  220b2f7:	0f b7 55 00          	movzwl 0x0(%rbp),%edx
06db  220b2fb:	84 c0                	test   %al,%al
06dd  220b2fd:	0f 85 6b 06 00 00    	jne    220b96e <netlink_dump+0xd4e>
06e3  220b303:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
06e8  220b308:	41 8b 1f             	mov    (%r15),%ebx
06eb  220b30b:	42 8a 04 28          	mov    (%rax,%r13,1),%al
06ef  220b30f:	84 c0                	test   %al,%al
06f1  220b311:	0f 85 79 06 00 00    	jne    220b990 <netlink_dump+0xd70>
06f7  220b317:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
06fc  220b31c:	2b 18                	sub    (%rax),%ebx
06fe  220b31e:	83 fb 14             	cmp    $0x14,%ebx
0701  220b321:	0f 8c 1f 04 00 00    	jl     220b746 <netlink_dump+0xb26>
0707  220b327:	49 8d 9e 58 05 00 00 	lea    0x558(%r14),%rbx
070e  220b32e:	89 54 24 08          	mov    %edx,0x8(%rsp)
0712  220b332:	48 89 d8             	mov    %rbx,%rax
0715  220b335:	48 c1 e8 03          	shr    $0x3,%rax
0719  220b339:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
071e  220b33e:	74 08                	je     220b348 <netlink_dump+0x728>
0720  220b340:	48 89 df             	mov    %rbx,%rdi
0723  220b343:	e8 00 00 00 00       	call   220b348 <netlink_dump+0x728>	220b344: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0728  220b348:	48 8b 2b             	mov    (%rbx),%rbp
072b  220b34b:	48 83 c5 08          	add    $0x8,%rbp
072f  220b34f:	48 89 e8             	mov    %rbp,%rax
0732  220b352:	48 c1 e8 03          	shr    $0x3,%rax
0736  220b356:	42 8a 04 28          	mov    (%rax,%r13,1),%al
073a  220b35a:	84 c0                	test   %al,%al
073c  220b35c:	0f 85 54 06 00 00    	jne    220b9b6 <netlink_dump+0xd96>
0742  220b362:	48 8b 5c 24 28       	mov    0x28(%rsp),%rbx
0747  220b367:	44 8b 7d 00          	mov    0x0(%rbp),%r15d
074b  220b36b:	48 89 d8             	mov    %rbx,%rax
074e  220b36e:	48 c1 e8 03          	shr    $0x3,%rax
0752  220b372:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
0757  220b377:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
075c  220b37c:	74 08                	je     220b386 <netlink_dump+0x766>
075e  220b37e:	48 89 df             	mov    %rbx,%rdi
0761  220b381:	e8 00 00 00 00       	call   220b386 <netlink_dump+0x766>	220b382: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0766  220b386:	48 8b 2b             	mov    (%rbx),%rbp
0769  220b389:	48 83 c5 34          	add    $0x34,%rbp
076d  220b38d:	48 89 e8             	mov    %rbp,%rax
0770  220b390:	48 c1 e8 03          	shr    $0x3,%rax
0774  220b394:	42 8a 04 28          	mov    (%rax,%r13,1),%al
0778  220b398:	84 c0                	test   %al,%al
077a  220b39a:	0f 85 33 06 00 00    	jne    220b9d3 <netlink_dump+0xdb3>
0780  220b3a0:	8b 6d 00             	mov    0x0(%rbp),%ebp
0783  220b3a3:	4c 89 e7             	mov    %r12,%rdi
0786  220b3a6:	be 14 00 00 00       	mov    $0x14,%esi
078b  220b3ab:	e8 00 00 00 00       	call   220b3b0 <netlink_dump+0x790>	220b3ac: R_X86_64_PLT32	skb_put-0x4
0790  220b3b0:	48 8d 78 04          	lea    0x4(%rax),%rdi
0794  220b3b4:	48 89 c6             	mov    %rax,%rsi
0797  220b3b7:	48 89 f8             	mov    %rdi,%rax
079a  220b3ba:	48 89 34 24          	mov    %rsi,(%rsp)
079e  220b3be:	48 c1 e8 03          	shr    $0x3,%rax
07a2  220b3c2:	42 8a 04 28          	mov    (%rax,%r13,1),%al
07a6  220b3c6:	84 c0                	test   %al,%al
07a8  220b3c8:	0f 85 22 06 00 00    	jne    220b9f0 <netlink_dump+0xdd0>
07ae  220b3ce:	48 89 f0             	mov    %rsi,%rax
07b1  220b3d1:	44 8b 4c 24 08       	mov    0x8(%rsp),%r9d
07b6  220b3d6:	66 c7 46 04 03 00    	movw   $0x3,0x4(%rsi)
07bc  220b3dc:	48 c1 e8 03          	shr    $0x3,%rax
07c0  220b3e0:	48 89 44 24 70       	mov    %rax,0x70(%rsp)
07c5  220b3e5:	42 8a 04 28          	mov    (%rax,%r13,1),%al
07c9  220b3e9:	44 89 cb             	mov    %r9d,%ebx
07cc  220b3ec:	83 cb 02             	or     $0x2,%ebx
07cf  220b3ef:	84 c0                	test   %al,%al
07d1  220b3f1:	0f 85 16 06 00 00    	jne    220ba0d <netlink_dump+0xded>
07d7  220b3f7:	4c 8d 46 06          	lea    0x6(%rsi),%r8
07db  220b3fb:	c7 06 14 00 00 00    	movl   $0x14,(%rsi)
07e1  220b401:	4c 89 c0             	mov    %r8,%rax
07e4  220b404:	48 c1 e8 03          	shr    $0x3,%rax
07e8  220b408:	48 89 44 24 58       	mov    %rax,0x58(%rsp)
07ed  220b40d:	42 8a 04 28          	mov    (%rax,%r13,1),%al
07f1  220b411:	84 c0                	test   %al,%al
07f3  220b413:	0f 85 1a 06 00 00    	jne    220ba33 <netlink_dump+0xe13>
07f9  220b419:	48 8d 7e 0c          	lea    0xc(%rsi),%rdi
07fd  220b41d:	66 89 5e 06          	mov    %bx,0x6(%rsi)
0801  220b421:	48 89 f8             	mov    %rdi,%rax
0804  220b424:	48 c1 e8 03          	shr    $0x3,%rax
0808  220b428:	42 8a 04 28          	mov    (%rax,%r13,1),%al
080c  220b42c:	84 c0                	test   %al,%al
080e  220b42e:	0f 85 2f 06 00 00    	jne    220ba63 <netlink_dump+0xe43>
0814  220b434:	48 8d 7e 08          	lea    0x8(%rsi),%rdi
0818  220b438:	89 6e 0c             	mov    %ebp,0xc(%rsi)
081b  220b43b:	48 89 f8             	mov    %rdi,%rax
081e  220b43e:	48 c1 e8 03          	shr    $0x3,%rax
0822  220b442:	42 8a 04 28          	mov    (%rax,%r13,1),%al
0826  220b446:	84 c0                	test   %al,%al
0828  220b448:	0f 85 3e 06 00 00    	jne    220ba8c <netlink_dump+0xe6c>
082e  220b44e:	48 8b 6c 24 28       	mov    0x28(%rsp),%rbp
0833  220b453:	48 85 f6             	test   %rsi,%rsi
0836  220b456:	44 89 7e 08          	mov    %r15d,0x8(%rsi)
083a  220b45a:	0f 84 e6 02 00 00    	je     220b746 <netlink_dump+0xb26>
0840  220b460:	49 8d 96 90 05 00 00 	lea    0x590(%r14),%rdx
0847  220b467:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
084c  220b46c:	49 89 d7             	mov    %rdx,%r15
084f  220b46f:	49 c1 ef 03          	shr    $0x3,%r15
0853  220b473:	43 8a 04 2f          	mov    (%r15,%r13,1),%al
0857  220b477:	84 c0                	test   %al,%al
0859  220b479:	0f 85 36 06 00 00    	jne    220bab5 <netlink_dump+0xe95>
085f  220b47f:	8b 1a                	mov    (%rdx),%ebx
0861  220b481:	85 db                	test   %ebx,%ebx
0863  220b483:	74 4c                	je     220b4d1 <netlink_dump+0x8b1>
0865  220b485:	48 83 c5 44          	add    $0x44,%rbp
0869  220b489:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
0873  220b493:	48 89 e8             	mov    %rbp,%rax
0876  220b496:	48 c1 e8 03          	shr    $0x3,%rax
087a  220b49a:	8a 04 08             	mov    (%rax,%rcx,1),%al
087d  220b49d:	84 c0                	test   %al,%al
087f  220b49f:	0f 85 47 07 00 00    	jne    220bbec <netlink_dump+0xfcc>
0885  220b4a5:	39 5d 00             	cmp    %ebx,0x0(%rbp)
0888  220b4a8:	48 8b 6c 24 28       	mov    0x28(%rsp),%rbp
088d  220b4ad:	74 22                	je     220b4d1 <netlink_dump+0x8b1>
088f  220b4af:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
0894  220b4b4:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
089e  220b4be:	41 83 c9 12          	or     $0x12,%r9d
08a2  220b4c2:	8a 04 01             	mov    (%rcx,%rax,1),%al
08a5  220b4c5:	84 c0                	test   %al,%al
08a7  220b4c7:	0f 85 81 07 00 00    	jne    220bc4e <netlink_dump+0x102e>
08ad  220b4cd:	66 45 89 08          	mov    %r9w,(%r8)
08b1  220b4d1:	48 83 c5 44          	add    $0x44,%rbp
08b5  220b4d5:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
08bf  220b4df:	48 89 e8             	mov    %rbp,%rax
08c2  220b4e2:	48 c1 e8 03          	shr    $0x3,%rax
08c6  220b4e6:	42 8a 04 28          	mov    (%rax,%r13,1),%al
08ca  220b4ea:	84 c0                	test   %al,%al
08cc  220b4ec:	0f 85 fa 05 00 00    	jne    220baec <netlink_dump+0xecc>
08d2  220b4f2:	43 8a 04 2f          	mov    (%r15,%r13,1),%al
08d6  220b4f6:	8b 5d 00             	mov    0x0(%rbp),%ebx
08d9  220b4f9:	84 c0                	test   %al,%al
08db  220b4fb:	0f 85 21 06 00 00    	jne    220bb22 <netlink_dump+0xf02>
08e1  220b501:	48 8b 44 24 60       	mov    0x60(%rsp),%rax
08e6  220b506:	89 1a                	mov    %ebx,(%rdx)
08e8  220b508:	48 89 f5             	mov    %rsi,%rbp
08eb  220b50b:	48 83 c5 10          	add    $0x10,%rbp
08ef  220b50f:	42 8a 04 28          	mov    (%rax,%r13,1),%al
08f3  220b513:	84 c0                	test   %al,%al
08f5  220b515:	0f 85 39 06 00 00    	jne    220bb54 <netlink_dump+0xf34>
08fb  220b51b:	48 89 e8             	mov    %rbp,%rax
08fe  220b51e:	8b 1f                	mov    (%rdi),%ebx
0900  220b520:	4c 8d 7d 03          	lea    0x3(%rbp),%r15
0904  220b524:	48 c1 e8 03          	shr    $0x3,%rax
0908  220b528:	42 8a 04 28          	mov    (%rax,%r13,1),%al
090c  220b52c:	84 c0                	test   %al,%al
090e  220b52e:	0f 85 4a 06 00 00    	jne    220bb7e <netlink_dump+0xf5e>
0914  220b534:	4c 89 f8             	mov    %r15,%rax
0917  220b537:	48 c1 e8 03          	shr    $0x3,%rax
091b  220b53b:	42 8a 04 28          	mov    (%rax,%r13,1),%al
091f  220b53f:	84 c0                	test   %al,%al
0921  220b541:	0f 85 60 06 00 00    	jne    220bba7 <netlink_dump+0xf87>
0927  220b547:	48 8d 84 24 88 00 00 00 	lea    0x88(%rsp),%rax
092f  220b54f:	89 5d 00             	mov    %ebx,0x0(%rbp)
0932  220b552:	48 c1 e8 03          	shr    $0x3,%rax
0936  220b556:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
093b  220b55b:	48 89 c3             	mov    %rax,%rbx
093e  220b55e:	74 13                	je     220b573 <netlink_dump+0x953>
0940  220b560:	48 8d bc 24 88 00 00 00 	lea    0x88(%rsp),%rdi
0948  220b568:	4c 89 c5             	mov    %r8,%rbp
094b  220b56b:	e8 00 00 00 00       	call   220b570 <netlink_dump+0x950>	220b56c: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0950  220b570:	49 89 e8             	mov    %rbp,%r8
0953  220b573:	48 83 bc 24 88 00 00 00 00 	cmpq   $0x0,0x88(%rsp)
095c  220b57c:	4c 8b 7c 24 38       	mov    0x38(%rsp),%r15
0961  220b581:	48 8b 6c 24 28       	mov    0x28(%rsp),%rbp
0966  220b586:	0f 84 ce 00 00 00    	je     220b65a <netlink_dump+0xa3a>
096c  220b58c:	49 8d ae d4 04 00 00 	lea    0x4d4(%r14),%rbp
0973  220b593:	48 89 e8             	mov    %rbp,%rax
0976  220b596:	48 c1 e8 03          	shr    $0x3,%rax
097a  220b59a:	42 8a 04 28          	mov    (%rax,%r13,1),%al
097e  220b59e:	84 c0                	test   %al,%al
0980  220b5a0:	0f 85 81 06 00 00    	jne    220bc27 <netlink_dump+0x1007>
0986  220b5a6:	f6 45 00 40          	testb  $0x40,0x0(%rbp)
098a  220b5aa:	48 8b 6c 24 28       	mov    0x28(%rsp),%rbp
098f  220b5af:	0f 84 a5 00 00 00    	je     220b65a <netlink_dump+0xa3a>
0995  220b5b5:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
099a  220b5ba:	42 8a 04 28          	mov    (%rax,%r13,1),%al
099e  220b5be:	84 c0                	test   %al,%al
09a0  220b5c0:	0f 85 c4 06 00 00    	jne    220bc8a <netlink_dump+0x106a>
09a6  220b5c6:	41 80 48 01 02       	orb    $0x2,0x1(%r8)
09ab  220b5cb:	42 80 3c 2b 00       	cmpb   $0x0,(%rbx,%r13,1)
09b0  220b5d0:	74 0d                	je     220b5df <netlink_dump+0x9bf>
09b2  220b5d2:	48 8d bc 24 88 00 00 00 	lea    0x88(%rsp),%rdi
09ba  220b5da:	e8 00 00 00 00       	call   220b5df <netlink_dump+0x9bf>	220b5db: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
09bf  220b5df:	48 8b 9c 24 88 00 00 00 	mov    0x88(%rsp),%rbx
09c7  220b5e7:	48 89 df             	mov    %rbx,%rdi
09ca  220b5ea:	e8 00 00 00 00       	call   220b5ef <netlink_dump+0x9cf>	220b5eb: R_X86_64_PLT32	strlen-0x4
09cf  220b5ef:	8d 50 01             	lea    0x1(%rax),%edx
09d2  220b5f2:	4c 89 e7             	mov    %r12,%rdi
09d5  220b5f5:	be 01 00 00 00       	mov    $0x1,%esi
09da  220b5fa:	48 89 d9             	mov    %rbx,%rcx
09dd  220b5fd:	e8 00 00 00 00       	call   220b602 <netlink_dump+0x9e2>	220b5fe: R_X86_64_PLT32	nla_put-0x4
09e2  220b602:	48 8b 3c 24          	mov    (%rsp),%rdi
09e6  220b606:	85 c0                	test   %eax,%eax
09e8  220b608:	75 50                	jne    220b65a <netlink_dump+0xa3a>
09ea  220b60a:	48 8b 44 24 78       	mov    0x78(%rsp),%rax
09ef  220b60f:	48 8b 9c 24 80 00 00 00 	mov    0x80(%rsp),%rbx
09f7  220b617:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
09fc  220b61c:	74 0c                	je     220b62a <netlink_dump+0xa0a>
09fe  220b61e:	48 89 df             	mov    %rbx,%rdi
0a01  220b621:	e8 00 00 00 00       	call   220b626 <netlink_dump+0xa06>	220b622: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0a06  220b626:	48 8b 3c 24          	mov    (%rsp),%rdi
0a0a  220b62a:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
0a0f  220b62f:	48 8b 1b             	mov    (%rbx),%rbx
0a12  220b632:	42 8a 04 28          	mov    (%rax,%r13,1),%al
0a16  220b636:	84 c0                	test   %al,%al
0a18  220b638:	0f 85 73 06 00 00    	jne    220bcb1 <netlink_dump+0x1091>
0a1e  220b63e:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
0a23  220b643:	03 18                	add    (%rax),%ebx
0a25  220b645:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
0a2a  220b64a:	42 8a 04 28          	mov    (%rax,%r13,1),%al
0a2e  220b64e:	29 fb                	sub    %edi,%ebx
0a30  220b650:	84 c0                	test   %al,%al
0a32  220b652:	0f 85 7f 06 00 00    	jne    220bcd7 <netlink_dump+0x10b7>
0a38  220b658:	89 1f                	mov    %ebx,(%rdi)
0a3a  220b65a:	4c 89 f7             	mov    %r14,%rdi
0a3d  220b65d:	4c 89 e6             	mov    %r12,%rsi
0a40  220b660:	ba 01 00 00 00       	mov    $0x1,%edx
0a45  220b665:	e8 00 00 00 00       	call   220b66a <netlink_dump+0xa4a>	220b666: R_X86_64_PLT32	sk_filter_trim_cap-0x4
0a4a  220b66a:	85 c0                	test   %eax,%eax
0a4c  220b66c:	74 0a                	je     220b678 <netlink_dump+0xa58>
0a4e  220b66e:	4c 89 e7             	mov    %r12,%rdi
0a51  220b671:	e8 00 00 00 00       	call   220b676 <netlink_dump+0xa56>	220b672: R_X86_64_PLT32	kfree_skb-0x4
0a56  220b676:	eb 0b                	jmp    220b683 <netlink_dump+0xa63>
0a58  220b678:	4c 89 f7             	mov    %r14,%rdi
0a5b  220b67b:	4c 89 e6             	mov    %r12,%rsi
0a5e  220b67e:	e8 1d ae ff ff       	call   22064a0 <__netlink_sendskb>
0a63  220b683:	49 8d 9e 68 05 00 00 	lea    0x568(%r14),%rbx
0a6a  220b68a:	48 89 d8             	mov    %rbx,%rax
0a6d  220b68d:	48 c1 e8 03          	shr    $0x3,%rax
0a71  220b691:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
0a76  220b696:	74 08                	je     220b6a0 <netlink_dump+0xa80>
0a78  220b698:	48 89 df             	mov    %rbx,%rdi
0a7b  220b69b:	e8 00 00 00 00       	call   220b6a0 <netlink_dump+0xa80>	220b69c: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0a80  220b6a0:	4c 8b 1b             	mov    (%rbx),%r11
0a83  220b6a3:	4d 85 db             	test   %r11,%r11
0a86  220b6a6:	74 08                	je     220b6b0 <netlink_dump+0xa90>
0a88  220b6a8:	48 89 ef             	mov    %rbp,%rdi
0a8b  220b6ab:	e8 00 00 00 00       	call   220b6b0 <netlink_dump+0xa90>	220b6ac: R_X86_64_PLT32	__x86_indirect_thunk_r11-0x4
0a90  220b6b0:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
0a95  220b6b5:	42 8a 04 28          	mov    (%rax,%r13,1),%al
0a99  220b6b9:	84 c0                	test   %al,%al
0a9b  220b6bb:	0f 85 0c 05 00 00    	jne    220bbcd <netlink_dump+0xfad>
0aa1  220b6c1:	41 c6 86 49 05 00 00 00 	movb   $0x0,0x549(%r14)
0aa9  220b6c9:	49 81 c6 78 05 00 00 	add    $0x578,%r14
0ab0  220b6d0:	4c 89 f0             	mov    %r14,%rax
0ab3  220b6d3:	48 c1 e8 03          	shr    $0x3,%rax
0ab7  220b6d7:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
0abc  220b6dc:	74 08                	je     220b6e6 <netlink_dump+0xac6>
0abe  220b6de:	4c 89 f7             	mov    %r14,%rdi
0ac1  220b6e1:	e8 00 00 00 00       	call   220b6e6 <netlink_dump+0xac6>	220b6e2: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0ac6  220b6e6:	48 8b 44 24 48       	mov    0x48(%rsp),%rax
0acb  220b6eb:	49 8b 1e             	mov    (%r14),%rbx
0ace  220b6ee:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
0ad3  220b6f3:	74 08                	je     220b6fd <netlink_dump+0xadd>
0ad5  220b6f5:	48 89 ef             	mov    %rbp,%rdi
0ad8  220b6f8:	e8 00 00 00 00       	call   220b6fd <netlink_dump+0xadd>	220b6f9: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0add  220b6fd:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
0ae2  220b702:	48 8b 6d 00          	mov    0x0(%rbp),%rbp
0ae6  220b706:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
0aeb  220b70b:	74 08                	je     220b715 <netlink_dump+0xaf5>
0aed  220b70d:	4c 89 ff             	mov    %r15,%rdi
0af0  220b710:	e8 00 00 00 00       	call   220b715 <netlink_dump+0xaf5>	220b711: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0af5  220b715:	49 8b 3f             	mov    (%r15),%rdi
0af8  220b718:	e8 00 00 00 00       	call   220b71d <netlink_dump+0xafd>	220b719: R_X86_64_PLT32	mutex_unlock-0x4
0afd  220b71d:	48 89 df             	mov    %rbx,%rdi
0b00  220b720:	e8 00 00 00 00       	call   220b725 <netlink_dump+0xb05>	220b721: R_X86_64_PLT32	module_put-0x4
0b05  220b725:	48 89 ef             	mov    %rbp,%rdi
0b08  220b728:	e8 00 00 00 00       	call   220b72d <netlink_dump+0xb0d>	220b729: R_X86_64_PLT32	consume_skb-0x4
0b0d  220b72d:	31 ed                	xor    %ebp,%ebp
0b0f  220b72f:	e9 ac f5 ff ff       	jmp    220ace0 <netlink_dump+0xc0>
0b14  220b734:	0f 0b                	ud2
0b16  220b736:	42 80 3c 3b 00       	cmpb   $0x0,(%rbx,%r15,1)
0b1b  220b73b:	0f 85 93 f8 ff ff    	jne    220afd4 <netlink_dump+0x3b4>
0b21  220b741:	e9 96 f8 ff ff       	jmp    220afdc <netlink_dump+0x3bc>
0b26  220b746:	0f 0b                	ud2
0b28  220b748:	4d 89 e6             	mov    %r12,%r14
0b2b  220b74b:	4c 8b 64 24 38       	mov    0x38(%rsp),%r12
0b30  220b750:	e9 0a fb ff ff       	jmp    220b25f <netlink_dump+0x63f>
0b35  220b755:	89 d9                	mov    %ebx,%ecx
0b37  220b757:	80 e1 07             	and    $0x7,%cl
0b3a  220b75a:	80 c1 03             	add    $0x3,%cl
0b3d  220b75d:	38 c1                	cmp    %al,%cl
0b3f  220b75f:	0f 8c 1c f6 ff ff    	jl     220ad81 <netlink_dump+0x161>
0b45  220b765:	48 89 df             	mov    %rbx,%rdi
0b48  220b768:	e8 00 00 00 00       	call   220b76d <netlink_dump+0xb4d>	220b769: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0b4d  220b76d:	e9 0f f6 ff ff       	jmp    220ad81 <netlink_dump+0x161>
0b52  220b772:	89 e9                	mov    %ebp,%ecx
0b54  220b774:	80 e1 07             	and    $0x7,%cl
0b57  220b777:	80 c1 03             	add    $0x3,%cl
0b5a  220b77a:	38 c1                	cmp    %al,%cl
0b5c  220b77c:	0f 8c 20 f6 ff ff    	jl     220ada2 <netlink_dump+0x182>
0b62  220b782:	48 89 ef             	mov    %rbp,%rdi
0b65  220b785:	e8 00 00 00 00       	call   220b78a <netlink_dump+0xb6a>	220b786: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0b6a  220b78a:	e9 13 f6 ff ff       	jmp    220ada2 <netlink_dump+0x182>
0b6f  220b78f:	89 f9                	mov    %edi,%ecx
0b71  220b791:	80 e1 07             	and    $0x7,%cl
0b74  220b794:	80 c1 03             	add    $0x3,%cl
0b77  220b797:	38 c1                	cmp    %al,%cl
0b79  220b799:	0f 8c 2c f6 ff ff    	jl     220adcb <netlink_dump+0x1ab>
0b7f  220b79f:	e8 00 00 00 00       	call   220b7a4 <netlink_dump+0xb84>	220b7a0: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0b84  220b7a4:	e9 22 f6 ff ff       	jmp    220adcb <netlink_dump+0x1ab>
0b89  220b7a9:	89 d9                	mov    %ebx,%ecx
0b8b  220b7ab:	80 e1 07             	and    $0x7,%cl
0b8e  220b7ae:	80 c1 03             	add    $0x3,%cl
0b91  220b7b1:	38 c1                	cmp    %al,%cl
0b93  220b7b3:	0f 8c ab f6 ff ff    	jl     220ae64 <netlink_dump+0x244>
0b99  220b7b9:	48 89 df             	mov    %rbx,%rdi
0b9c  220b7bc:	e8 00 00 00 00       	call   220b7c1 <netlink_dump+0xba1>	220b7bd: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0ba1  220b7c1:	e9 9e f6 ff ff       	jmp    220ae64 <netlink_dump+0x244>
0ba6  220b7c6:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
0bab  220b7cb:	80 e1 07             	and    $0x7,%cl
0bae  220b7ce:	80 c1 03             	add    $0x3,%cl
0bb1  220b7d1:	38 c1                	cmp    %al,%cl
0bb3  220b7d3:	0f 8c 4b f7 ff ff    	jl     220af24 <netlink_dump+0x304>
0bb9  220b7d9:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
0bbe  220b7de:	e8 00 00 00 00       	call   220b7e3 <netlink_dump+0xbc3>	220b7df: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0bc3  220b7e3:	e9 3c f7 ff ff       	jmp    220af24 <netlink_dump+0x304>
0bc8  220b7e8:	89 f9                	mov    %edi,%ecx
0bca  220b7ea:	80 e1 07             	and    $0x7,%cl
0bcd  220b7ed:	fe c1                	inc    %cl
0bcf  220b7ef:	38 c1                	cmp    %al,%cl
0bd1  220b7f1:	0f 8c 7b f7 ff ff    	jl     220af72 <netlink_dump+0x352>
0bd7  220b7f7:	e8 00 00 00 00       	call   220b7fc <netlink_dump+0xbdc>	220b7f8: R_X86_64_PLT32	__asan_report_store2_noabort-0x4
0bdc  220b7fc:	e9 71 f7 ff ff       	jmp    220af72 <netlink_dump+0x352>
0be1  220b801:	89 f9                	mov    %edi,%ecx
0be3  220b803:	80 e1 07             	and    $0x7,%cl
0be6  220b806:	fe c1                	inc    %cl
0be8  220b808:	38 c1                	cmp    %al,%cl
0bea  220b80a:	0f 8c 8e f7 ff ff    	jl     220af9e <netlink_dump+0x37e>
0bf0  220b810:	e8 00 00 00 00       	call   220b815 <netlink_dump+0xbf5>	220b811: R_X86_64_PLT32	__asan_report_store2_noabort-0x4
0bf5  220b815:	e9 84 f7 ff ff       	jmp    220af9e <netlink_dump+0x37e>
0bfa  220b81a:	44 89 f9             	mov    %r15d,%ecx
0bfd  220b81d:	80 e1 07             	and    $0x7,%cl
0c00  220b820:	80 c1 03             	add    $0x3,%cl
0c03  220b823:	38 c1                	cmp    %al,%cl
0c05  220b825:	0f 8c fd f7 ff ff    	jl     220b028 <netlink_dump+0x408>
0c0b  220b82b:	4c 89 ff             	mov    %r15,%rdi
0c0e  220b82e:	e8 00 00 00 00       	call   220b833 <netlink_dump+0xc13>	220b82f: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0c13  220b833:	e9 f0 f7 ff ff       	jmp    220b028 <netlink_dump+0x408>
0c18  220b838:	89 d1                	mov    %edx,%ecx
0c1a  220b83a:	80 e1 07             	and    $0x7,%cl
0c1d  220b83d:	80 c1 03             	add    $0x3,%cl
0c20  220b840:	38 c1                	cmp    %al,%cl
0c22  220b842:	0f 8c a8 f8 ff ff    	jl     220b0f0 <netlink_dump+0x4d0>
0c28  220b848:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
0c2d  220b84d:	e8 00 00 00 00       	call   220b852 <netlink_dump+0xc32>	220b84e: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0c32  220b852:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
0c37  220b857:	e9 94 f8 ff ff       	jmp    220b0f0 <netlink_dump+0x4d0>
0c3c  220b85c:	44 89 f9             	mov    %r15d,%ecx
0c3f  220b85f:	80 e1 07             	and    $0x7,%cl
0c42  220b862:	80 c1 03             	add    $0x3,%cl
0c45  220b865:	38 c1                	cmp    %al,%cl
0c47  220b867:	0f 8c 35 f8 ff ff    	jl     220b0a2 <netlink_dump+0x482>
0c4d  220b86d:	4c 89 ff             	mov    %r15,%rdi
0c50  220b870:	e8 00 00 00 00       	call   220b875 <netlink_dump+0xc55>	220b871: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0c55  220b875:	e9 28 f8 ff ff       	jmp    220b0a2 <netlink_dump+0x482>
0c5a  220b87a:	89 e9                	mov    %ebp,%ecx
0c5c  220b87c:	80 e1 07             	and    $0x7,%cl
0c5f  220b87f:	80 c1 03             	add    $0x3,%cl
0c62  220b882:	38 c1                	cmp    %al,%cl
0c64  220b884:	0f 8c 35 f8 ff ff    	jl     220b0bf <netlink_dump+0x49f>
0c6a  220b88a:	48 89 ef             	mov    %rbp,%rdi
0c6d  220b88d:	e8 00 00 00 00       	call   220b892 <netlink_dump+0xc72>	220b88e: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0c72  220b892:	e9 28 f8 ff ff       	jmp    220b0bf <netlink_dump+0x49f>
0c77  220b897:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
0c7c  220b89c:	80 e1 07             	and    $0x7,%cl
0c7f  220b89f:	80 c1 03             	add    $0x3,%cl
0c82  220b8a2:	38 c1                	cmp    %al,%cl
0c84  220b8a4:	0f 8c da f8 ff ff    	jl     220b184 <netlink_dump+0x564>
0c8a  220b8aa:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
0c8f  220b8af:	e8 00 00 00 00       	call   220b8b4 <netlink_dump+0xc94>	220b8b0: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
0c94  220b8b4:	e9 cb f8 ff ff       	jmp    220b184 <netlink_dump+0x564>
0c99  220b8b9:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
0c9e  220b8be:	80 e1 07             	and    $0x7,%cl
0ca1  220b8c1:	80 c1 03             	add    $0x3,%cl
0ca4  220b8c4:	38 c1                	cmp    %al,%cl
0ca6  220b8c6:	0f 8c fa f8 ff ff    	jl     220b1c6 <netlink_dump+0x5a6>
0cac  220b8cc:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
0cb1  220b8d1:	e8 00 00 00 00       	call   220b8d6 <netlink_dump+0xcb6>	220b8d2: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0cb6  220b8d6:	e9 eb f8 ff ff       	jmp    220b1c6 <netlink_dump+0x5a6>
0cbb  220b8db:	89 f9                	mov    %edi,%ecx
0cbd  220b8dd:	80 e1 07             	and    $0x7,%cl
0cc0  220b8e0:	80 c1 03             	add    $0x3,%cl
0cc3  220b8e3:	38 c1                	cmp    %al,%cl
0cc5  220b8e5:	0f 8c aa f5 ff ff    	jl     220ae95 <netlink_dump+0x275>
0ccb  220b8eb:	e8 00 00 00 00       	call   220b8f0 <netlink_dump+0xcd0>	220b8ec: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0cd0  220b8f0:	e9 a0 f5 ff ff       	jmp    220ae95 <netlink_dump+0x275>
0cd5  220b8f5:	89 e9                	mov    %ebp,%ecx
0cd7  220b8f7:	80 e1 07             	and    $0x7,%cl
0cda  220b8fa:	80 c1 03             	add    $0x3,%cl
0cdd  220b8fd:	38 c1                	cmp    %al,%cl
0cdf  220b8ff:	0f 8c b2 f5 ff ff    	jl     220aeb7 <netlink_dump+0x297>
0ce5  220b905:	48 89 ef             	mov    %rbp,%rdi
0ce8  220b908:	e8 00 00 00 00       	call   220b90d <netlink_dump+0xced>	220b909: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0ced  220b90d:	e9 a5 f5 ff ff       	jmp    220aeb7 <netlink_dump+0x297>
0cf2  220b912:	44 89 f9             	mov    %r15d,%ecx
0cf5  220b915:	80 e1 07             	and    $0x7,%cl
0cf8  220b918:	80 c1 03             	add    $0x3,%cl
0cfb  220b91b:	38 c1                	cmp    %al,%cl
0cfd  220b91d:	0f 8c cd f8 ff ff    	jl     220b1f0 <netlink_dump+0x5d0>
0d03  220b923:	4c 89 ff             	mov    %r15,%rdi
0d06  220b926:	e8 00 00 00 00       	call   220b92b <netlink_dump+0xd0b>	220b927: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0d0b  220b92b:	e9 c0 f8 ff ff       	jmp    220b1f0 <netlink_dump+0x5d0>
0d10  220b930:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
0d15  220b935:	80 e1 07             	and    $0x7,%cl
0d18  220b938:	80 c1 03             	add    $0x3,%cl
0d1b  220b93b:	38 c1                	cmp    %al,%cl
0d1d  220b93d:	0f 8c c1 f8 ff ff    	jl     220b204 <netlink_dump+0x5e4>
0d23  220b943:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
0d28  220b948:	e8 00 00 00 00       	call   220b94d <netlink_dump+0xd2d>	220b949: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0d2d  220b94d:	e9 b2 f8 ff ff       	jmp    220b204 <netlink_dump+0x5e4>
0d32  220b952:	89 e9                	mov    %ebp,%ecx
0d34  220b954:	80 e1 07             	and    $0x7,%cl
0d37  220b957:	fe c1                	inc    %cl
0d39  220b959:	38 c1                	cmp    %al,%cl
0d3b  220b95b:	0f 8c 92 f9 ff ff    	jl     220b2f3 <netlink_dump+0x6d3>
0d41  220b961:	48 89 ef             	mov    %rbp,%rdi
0d44  220b964:	e8 00 00 00 00       	call   220b969 <netlink_dump+0xd49>	220b965: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
0d49  220b969:	e9 85 f9 ff ff       	jmp    220b2f3 <netlink_dump+0x6d3>
0d4e  220b96e:	44 89 f9             	mov    %r15d,%ecx
0d51  220b971:	80 e1 07             	and    $0x7,%cl
0d54  220b974:	80 c1 03             	add    $0x3,%cl
0d57  220b977:	38 c1                	cmp    %al,%cl
0d59  220b979:	0f 8c 84 f9 ff ff    	jl     220b303 <netlink_dump+0x6e3>
0d5f  220b97f:	4c 89 ff             	mov    %r15,%rdi
0d62  220b982:	89 d3                	mov    %edx,%ebx
0d64  220b984:	e8 00 00 00 00       	call   220b989 <netlink_dump+0xd69>	220b985: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0d69  220b989:	89 da                	mov    %ebx,%edx
0d6b  220b98b:	e9 73 f9 ff ff       	jmp    220b303 <netlink_dump+0x6e3>
0d70  220b990:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
0d75  220b995:	80 e1 07             	and    $0x7,%cl
0d78  220b998:	80 c1 03             	add    $0x3,%cl
0d7b  220b99b:	38 c1                	cmp    %al,%cl
0d7d  220b99d:	0f 8c 74 f9 ff ff    	jl     220b317 <netlink_dump+0x6f7>
0d83  220b9a3:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
0d88  220b9a8:	89 d5                	mov    %edx,%ebp
0d8a  220b9aa:	e8 00 00 00 00       	call   220b9af <netlink_dump+0xd8f>	220b9ab: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0d8f  220b9af:	89 ea                	mov    %ebp,%edx
0d91  220b9b1:	e9 61 f9 ff ff       	jmp    220b317 <netlink_dump+0x6f7>
0d96  220b9b6:	89 e9                	mov    %ebp,%ecx
0d98  220b9b8:	80 e1 07             	and    $0x7,%cl
0d9b  220b9bb:	80 c1 03             	add    $0x3,%cl
0d9e  220b9be:	38 c1                	cmp    %al,%cl
0da0  220b9c0:	0f 8c 9c f9 ff ff    	jl     220b362 <netlink_dump+0x742>
0da6  220b9c6:	48 89 ef             	mov    %rbp,%rdi
0da9  220b9c9:	e8 00 00 00 00       	call   220b9ce <netlink_dump+0xdae>	220b9ca: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0dae  220b9ce:	e9 8f f9 ff ff       	jmp    220b362 <netlink_dump+0x742>
0db3  220b9d3:	89 e9                	mov    %ebp,%ecx
0db5  220b9d5:	80 e1 07             	and    $0x7,%cl
0db8  220b9d8:	80 c1 03             	add    $0x3,%cl
0dbb  220b9db:	38 c1                	cmp    %al,%cl
0dbd  220b9dd:	0f 8c bd f9 ff ff    	jl     220b3a0 <netlink_dump+0x780>
0dc3  220b9e3:	48 89 ef             	mov    %rbp,%rdi
0dc6  220b9e6:	e8 00 00 00 00       	call   220b9eb <netlink_dump+0xdcb>	220b9e7: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0dcb  220b9eb:	e9 b0 f9 ff ff       	jmp    220b3a0 <netlink_dump+0x780>
0dd0  220b9f0:	89 f9                	mov    %edi,%ecx
0dd2  220b9f2:	80 e1 07             	and    $0x7,%cl
0dd5  220b9f5:	fe c1                	inc    %cl
0dd7  220b9f7:	38 c1                	cmp    %al,%cl
0dd9  220b9f9:	0f 8c cf f9 ff ff    	jl     220b3ce <netlink_dump+0x7ae>
0ddf  220b9ff:	e8 00 00 00 00       	call   220ba04 <netlink_dump+0xde4>	220ba00: R_X86_64_PLT32	__asan_report_store2_noabort-0x4
0de4  220ba04:	48 8b 34 24          	mov    (%rsp),%rsi
0de8  220ba08:	e9 c1 f9 ff ff       	jmp    220b3ce <netlink_dump+0x7ae>
0ded  220ba0d:	89 f1                	mov    %esi,%ecx
0def  220ba0f:	80 e1 07             	and    $0x7,%cl
0df2  220ba12:	80 c1 03             	add    $0x3,%cl
0df5  220ba15:	38 c1                	cmp    %al,%cl
0df7  220ba17:	0f 8c da f9 ff ff    	jl     220b3f7 <netlink_dump+0x7d7>
0dfd  220ba1d:	48 89 f7             	mov    %rsi,%rdi
0e00  220ba20:	e8 00 00 00 00       	call   220ba25 <netlink_dump+0xe05>	220ba21: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
0e05  220ba25:	44 8b 4c 24 08       	mov    0x8(%rsp),%r9d
0e0a  220ba2a:	48 8b 34 24          	mov    (%rsp),%rsi
0e0e  220ba2e:	e9 c4 f9 ff ff       	jmp    220b3f7 <netlink_dump+0x7d7>
0e13  220ba33:	44 89 c1             	mov    %r8d,%ecx
0e16  220ba36:	80 e1 07             	and    $0x7,%cl
0e19  220ba39:	fe c1                	inc    %cl
0e1b  220ba3b:	38 c1                	cmp    %al,%cl
0e1d  220ba3d:	0f 8c d6 f9 ff ff    	jl     220b419 <netlink_dump+0x7f9>
0e23  220ba43:	4c 89 c7             	mov    %r8,%rdi
0e26  220ba46:	4c 89 44 24 18       	mov    %r8,0x18(%rsp)
0e2b  220ba4b:	e8 00 00 00 00       	call   220ba50 <netlink_dump+0xe30>	220ba4c: R_X86_64_PLT32	__asan_report_store2_noabort-0x4
0e30  220ba50:	4c 8b 44 24 18       	mov    0x18(%rsp),%r8
0e35  220ba55:	44 8b 4c 24 08       	mov    0x8(%rsp),%r9d
0e3a  220ba5a:	48 8b 34 24          	mov    (%rsp),%rsi
0e3e  220ba5e:	e9 b6 f9 ff ff       	jmp    220b419 <netlink_dump+0x7f9>
0e43  220ba63:	89 f9                	mov    %edi,%ecx
0e45  220ba65:	80 e1 07             	and    $0x7,%cl
0e48  220ba68:	80 c1 03             	add    $0x3,%cl
0e4b  220ba6b:	38 c1                	cmp    %al,%cl
0e4d  220ba6d:	0f 8c c1 f9 ff ff    	jl     220b434 <netlink_dump+0x814>
0e53  220ba73:	4c 89 c3             	mov    %r8,%rbx
0e56  220ba76:	e8 00 00 00 00       	call   220ba7b <netlink_dump+0xe5b>	220ba77: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
0e5b  220ba7b:	44 8b 4c 24 08       	mov    0x8(%rsp),%r9d
0e60  220ba80:	48 8b 34 24          	mov    (%rsp),%rsi
0e64  220ba84:	49 89 d8             	mov    %rbx,%r8
0e67  220ba87:	e9 a8 f9 ff ff       	jmp    220b434 <netlink_dump+0x814>
0e6c  220ba8c:	89 f9                	mov    %edi,%ecx
0e6e  220ba8e:	80 e1 07             	and    $0x7,%cl
0e71  220ba91:	80 c1 03             	add    $0x3,%cl
0e74  220ba94:	38 c1                	cmp    %al,%cl
0e76  220ba96:	0f 8c b2 f9 ff ff    	jl     220b44e <netlink_dump+0x82e>
0e7c  220ba9c:	4c 89 c3             	mov    %r8,%rbx
0e7f  220ba9f:	e8 00 00 00 00       	call   220baa4 <netlink_dump+0xe84>	220baa0: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
0e84  220baa4:	44 8b 4c 24 08       	mov    0x8(%rsp),%r9d
0e89  220baa9:	48 8b 34 24          	mov    (%rsp),%rsi
0e8d  220baad:	49 89 d8             	mov    %rbx,%r8
0e90  220bab0:	e9 99 f9 ff ff       	jmp    220b44e <netlink_dump+0x82e>
0e95  220bab5:	89 d1                	mov    %edx,%ecx
0e97  220bab7:	80 e1 07             	and    $0x7,%cl
0e9a  220baba:	80 c1 03             	add    $0x3,%cl
0e9d  220babd:	38 c1                	cmp    %al,%cl
0e9f  220babf:	0f 8c ba f9 ff ff    	jl     220b47f <netlink_dump+0x85f>
0ea5  220bac5:	48 89 d7             	mov    %rdx,%rdi
0ea8  220bac8:	4d 89 c5             	mov    %r8,%r13
0eab  220bacb:	48 89 d3             	mov    %rdx,%rbx
0eae  220bace:	e8 00 00 00 00       	call   220bad3 <netlink_dump+0xeb3>	220bacf: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0eb3  220bad3:	44 8b 4c 24 08       	mov    0x8(%rsp),%r9d
0eb8  220bad8:	48 8b 34 24          	mov    (%rsp),%rsi
0ebc  220badc:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
0ec1  220bae1:	48 89 da             	mov    %rbx,%rdx
0ec4  220bae4:	4d 89 e8             	mov    %r13,%r8
0ec7  220bae7:	e9 93 f9 ff ff       	jmp    220b47f <netlink_dump+0x85f>
0ecc  220baec:	89 e9                	mov    %ebp,%ecx
0ece  220baee:	80 e1 07             	and    $0x7,%cl
0ed1  220baf1:	80 c1 03             	add    $0x3,%cl
0ed4  220baf4:	38 c1                	cmp    %al,%cl
0ed6  220baf6:	0f 8c f6 f9 ff ff    	jl     220b4f2 <netlink_dump+0x8d2>
0edc  220bafc:	48 89 ef             	mov    %rbp,%rdi
0edf  220baff:	4c 89 c3             	mov    %r8,%rbx
0ee2  220bb02:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
0ee7  220bb07:	e8 00 00 00 00       	call   220bb0c <netlink_dump+0xeec>	220bb08: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0eec  220bb0c:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
0ef1  220bb11:	48 8b 34 24          	mov    (%rsp),%rsi
0ef5  220bb15:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
0efa  220bb1a:	49 89 d8             	mov    %rbx,%r8
0efd  220bb1d:	e9 d0 f9 ff ff       	jmp    220b4f2 <netlink_dump+0x8d2>
0f02  220bb22:	89 d1                	mov    %edx,%ecx
0f04  220bb24:	80 e1 07             	and    $0x7,%cl
0f07  220bb27:	80 c1 03             	add    $0x3,%cl
0f0a  220bb2a:	38 c1                	cmp    %al,%cl
0f0c  220bb2c:	0f 8c cf f9 ff ff    	jl     220b501 <netlink_dump+0x8e1>
0f12  220bb32:	48 89 d7             	mov    %rdx,%rdi
0f15  220bb35:	4c 89 c5             	mov    %r8,%rbp
0f18  220bb38:	49 89 d7             	mov    %rdx,%r15
0f1b  220bb3b:	e8 00 00 00 00       	call   220bb40 <netlink_dump+0xf20>	220bb3c: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
0f20  220bb40:	48 8b 34 24          	mov    (%rsp),%rsi
0f24  220bb44:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
0f29  220bb49:	4c 89 fa             	mov    %r15,%rdx
0f2c  220bb4c:	49 89 e8             	mov    %rbp,%r8
0f2f  220bb4f:	e9 ad f9 ff ff       	jmp    220b501 <netlink_dump+0x8e1>
0f34  220bb54:	89 f9                	mov    %edi,%ecx
0f36  220bb56:	80 e1 07             	and    $0x7,%cl
0f39  220bb59:	80 c1 03             	add    $0x3,%cl
0f3c  220bb5c:	38 c1                	cmp    %al,%cl
0f3e  220bb5e:	0f 8c b7 f9 ff ff    	jl     220b51b <netlink_dump+0x8fb>
0f44  220bb64:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
0f49  220bb69:	4c 89 c3             	mov    %r8,%rbx
0f4c  220bb6c:	e8 00 00 00 00       	call   220bb71 <netlink_dump+0xf51>	220bb6d: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0f51  220bb71:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
0f56  220bb76:	49 89 d8             	mov    %rbx,%r8
0f59  220bb79:	e9 9d f9 ff ff       	jmp    220b51b <netlink_dump+0x8fb>
0f5e  220bb7e:	89 e9                	mov    %ebp,%ecx
0f60  220bb80:	80 e1 07             	and    $0x7,%cl
0f63  220bb83:	38 c1                	cmp    %al,%cl
0f65  220bb85:	0f 8c a9 f9 ff ff    	jl     220b534 <netlink_dump+0x914>
0f6b  220bb8b:	be 04 00 00 00       	mov    $0x4,%esi
0f70  220bb90:	48 89 ef             	mov    %rbp,%rdi
0f73  220bb93:	4c 89 44 24 18       	mov    %r8,0x18(%rsp)
0f78  220bb98:	e8 00 00 00 00       	call   220bb9d <netlink_dump+0xf7d>	220bb99: R_X86_64_PLT32	__asan_report_store_n_noabort-0x4
0f7d  220bb9d:	4c 8b 44 24 18       	mov    0x18(%rsp),%r8
0f82  220bba2:	e9 8d f9 ff ff       	jmp    220b534 <netlink_dump+0x914>
0f87  220bba7:	44 89 f9             	mov    %r15d,%ecx
0f8a  220bbaa:	80 e1 07             	and    $0x7,%cl
0f8d  220bbad:	38 c1                	cmp    %al,%cl
0f8f  220bbaf:	0f 8c 92 f9 ff ff    	jl     220b547 <netlink_dump+0x927>
0f95  220bbb5:	4c 89 ff             	mov    %r15,%rdi
0f98  220bbb8:	be 04 00 00 00       	mov    $0x4,%esi
0f9d  220bbbd:	4d 89 c7             	mov    %r8,%r15
0fa0  220bbc0:	e8 00 00 00 00       	call   220bbc5 <netlink_dump+0xfa5>	220bbc1: R_X86_64_PLT32	__asan_report_store_n_noabort-0x4
0fa5  220bbc5:	4d 89 f8             	mov    %r15,%r8
0fa8  220bbc8:	e9 7a f9 ff ff       	jmp    220b547 <netlink_dump+0x927>
0fad  220bbcd:	48 8b 4c 24 68       	mov    0x68(%rsp),%rcx
0fb2  220bbd2:	80 e1 07             	and    $0x7,%cl
0fb5  220bbd5:	38 c1                	cmp    %al,%cl
0fb7  220bbd7:	0f 8c e4 fa ff ff    	jl     220b6c1 <netlink_dump+0xaa1>
0fbd  220bbdd:	48 8b 7c 24 68       	mov    0x68(%rsp),%rdi
0fc2  220bbe2:	e8 00 00 00 00       	call   220bbe7 <netlink_dump+0xfc7>	220bbe3: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
0fc7  220bbe7:	e9 d5 fa ff ff       	jmp    220b6c1 <netlink_dump+0xaa1>
0fcc  220bbec:	89 e9                	mov    %ebp,%ecx
0fce  220bbee:	80 e1 07             	and    $0x7,%cl
0fd1  220bbf1:	80 c1 03             	add    $0x3,%cl
0fd4  220bbf4:	38 c1                	cmp    %al,%cl
0fd6  220bbf6:	0f 8c a9 f8 ff ff    	jl     220b4a5 <netlink_dump+0x885>
0fdc  220bbfc:	48 89 ef             	mov    %rbp,%rdi
0fdf  220bbff:	4c 89 44 24 18       	mov    %r8,0x18(%rsp)
0fe4  220bc04:	49 89 d5             	mov    %rdx,%r13
0fe7  220bc07:	e8 00 00 00 00       	call   220bc0c <netlink_dump+0xfec>	220bc08: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0fec  220bc0c:	4c 8b 44 24 18       	mov    0x18(%rsp),%r8
0ff1  220bc11:	44 8b 4c 24 08       	mov    0x8(%rsp),%r9d
0ff6  220bc16:	48 8b 34 24          	mov    (%rsp),%rsi
0ffa  220bc1a:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
0fff  220bc1f:	4c 89 ea             	mov    %r13,%rdx
1002  220bc22:	e9 7e f8 ff ff       	jmp    220b4a5 <netlink_dump+0x885>
1007  220bc27:	89 e9                	mov    %ebp,%ecx
1009  220bc29:	80 e1 07             	and    $0x7,%cl
100c  220bc2c:	80 c1 03             	add    $0x3,%cl
100f  220bc2f:	38 c1                	cmp    %al,%cl
1011  220bc31:	0f 8c 6f f9 ff ff    	jl     220b5a6 <netlink_dump+0x986>
1017  220bc37:	48 89 ef             	mov    %rbp,%rdi
101a  220bc3a:	4c 89 44 24 18       	mov    %r8,0x18(%rsp)
101f  220bc3f:	e8 00 00 00 00       	call   220bc44 <netlink_dump+0x1024>	220bc40: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
1024  220bc44:	4c 8b 44 24 18       	mov    0x18(%rsp),%r8
1029  220bc49:	e9 58 f9 ff ff       	jmp    220b5a6 <netlink_dump+0x986>
102e  220bc4e:	44 89 c1             	mov    %r8d,%ecx
1031  220bc51:	80 e1 07             	and    $0x7,%cl
1034  220bc54:	fe c1                	inc    %cl
1036  220bc56:	38 c1                	cmp    %al,%cl
1038  220bc58:	0f 8c 6f f8 ff ff    	jl     220b4cd <netlink_dump+0x8ad>
103e  220bc5e:	4c 89 c7             	mov    %r8,%rdi
1041  220bc61:	44 89 cb             	mov    %r9d,%ebx
1044  220bc64:	4c 89 44 24 18       	mov    %r8,0x18(%rsp)
1049  220bc69:	49 89 d5             	mov    %rdx,%r13
104c  220bc6c:	e8 00 00 00 00       	call   220bc71 <netlink_dump+0x1051>	220bc6d: R_X86_64_PLT32	__asan_report_store2_noabort-0x4
1051  220bc71:	4c 8b 44 24 18       	mov    0x18(%rsp),%r8
1056  220bc76:	48 8b 34 24          	mov    (%rsp),%rsi
105a  220bc7a:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
105f  220bc7f:	4c 89 ea             	mov    %r13,%rdx
1062  220bc82:	41 89 d9             	mov    %ebx,%r9d
1065  220bc85:	e9 43 f8 ff ff       	jmp    220b4cd <netlink_dump+0x8ad>
106a  220bc8a:	44 89 c1             	mov    %r8d,%ecx
106d  220bc8d:	80 e1 07             	and    $0x7,%cl
1070  220bc90:	fe c1                	inc    %cl
1072  220bc92:	38 c1                	cmp    %al,%cl
1074  220bc94:	0f 8c 2c f9 ff ff    	jl     220b5c6 <netlink_dump+0x9a6>
107a  220bc9a:	4c 89 c7             	mov    %r8,%rdi
107d  220bc9d:	4c 89 44 24 18       	mov    %r8,0x18(%rsp)
1082  220bca2:	e8 00 00 00 00       	call   220bca7 <netlink_dump+0x1087>	220bca3: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
1087  220bca7:	4c 8b 44 24 18       	mov    0x18(%rsp),%r8
108c  220bcac:	e9 15 f9 ff ff       	jmp    220b5c6 <netlink_dump+0x9a6>
1091  220bcb1:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
1096  220bcb6:	80 e1 07             	and    $0x7,%cl
1099  220bcb9:	80 c1 03             	add    $0x3,%cl
109c  220bcbc:	38 c1                	cmp    %al,%cl
109e  220bcbe:	0f 8c 7a f9 ff ff    	jl     220b63e <netlink_dump+0xa1e>
10a4  220bcc4:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
10a9  220bcc9:	e8 00 00 00 00       	call   220bcce <netlink_dump+0x10ae>	220bcca: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
10ae  220bcce:	48 8b 3c 24          	mov    (%rsp),%rdi
10b2  220bcd2:	e9 67 f9 ff ff       	jmp    220b63e <netlink_dump+0xa1e>
10b7  220bcd7:	89 f9                	mov    %edi,%ecx
10b9  220bcd9:	80 e1 07             	and    $0x7,%cl
10bc  220bcdc:	80 c1 03             	add    $0x3,%cl
10bf  220bcdf:	38 c1                	cmp    %al,%cl
10c1  220bce1:	0f 8c 71 f9 ff ff    	jl     220b658 <netlink_dump+0xa38>
10c7  220bce7:	e8 00 00 00 00       	call   220bcec <netlink_dump+0x10cc>	220bce8: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
10cc  220bcec:	48 8b 3c 24          	mov    (%rsp),%rdi
10d0  220bcf0:	e9 63 f9 ff ff       	jmp    220b658 <netlink_dump+0xa38>
10d5  220bcf5:	e8 00 00 00 00       	call   220bcfa <netlink_dump+0x10da>	220bcf6: R_X86_64_PLT32	__stack_chk_fail-0x4
10da  220bcfa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
