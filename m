Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F6CD2E4;
	Mon, 15 May 2023 19:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684179640; x=1715715640;
  h=date:from:cc:subject:message-id:mime-version;
  bh=CTHe+D1rHOhlwbe6A6f1v9pNCtcW1iMiJwLpqrXNfzI=;
  b=ckBpA07LPakdy8JabgH9cITg/hGn1sz13iOqPZWLAb0rONIQQ6B0T5ZQ
   EjXsY2MaPWV6W/dWD2UJ3un5w9rqcISLq212OuSUKqmEVMXzP8YnGCoTV
   hPYnTzNbmQ3DdhGOJVHLiZCncJv54TsO5bPpfTsfUpxcQAL2Ej1uVZ6A7
   H/eDO9NwKhipR7FVIwQYVnMQEkVsufC0d5jehNH3mIbHPEQG4ZjwToBLw
   IDYLQpoX8W+1VXxN1rYa1fe1sS2+LuOziVuH1sR/n1o4/2MPP93UWdcDW
   90830Z6IRHBPzEwr+LpYX1zJAFO2w08lYdW2OqgNVm3gC6TMlmxHEt1ar
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="340656205"
X-IronPort-AV: E=Sophos;i="5.99,277,1677571200"; 
   d="scan'208";a="340656205"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2023 12:40:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="678554353"
X-IronPort-AV: E=Sophos;i="5.99,277,1677571200"; 
   d="scan'208";a="678554353"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 15 May 2023 12:40:33 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pye3c-0006ag-1J;
	Mon, 15 May 2023 19:40:32 +0000
Date: Tue, 16 May 2023 03:39:59 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [stable:linux-5.10.y 2793/9999] net/netlink/af_netlink.o: warning:
 objtool: netlink_dump()+0xaf3: unreachable instruction
Message-ID: <202305160344.x4wWIQet-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="mK1WX8aRyJytxJjx"
Content-Disposition: inline


--mK1WX8aRyJytxJjx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Eric Dumazet <edumazet@google.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Sasha Levin <sashal@kernel.org>

Hi Eric,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.10.y
head:   f1b32fda06d2cfb8eea9680b0ba7a8b0d5b81eeb
commit: 3d55b195747c1259c994b868a509beae947a7c6e [2793/9999] netlink: reset network and mac headers in netlink_dump()
config: x86_64-randconfig-x072-20230515
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
| Link: https://lore.kernel.org/oe-kbuild-all/202305160344.x4wWIQet-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/netlink/af_netlink.o: warning: objtool: netlink_dump()+0xaf3: unreachable instruction


objdump-func vmlinux.o netlink_dump:
0000 0000000001f8fa40 <netlink_dump>:
0000  1f8fa40:	55                   	push   %rbp
0001  1f8fa41:	41 57                	push   %r15
0003  1f8fa43:	41 56                	push   %r14
0005  1f8fa45:	41 55                	push   %r13
0007  1f8fa47:	41 54                	push   %r12
0009  1f8fa49:	53                   	push   %rbx
000a  1f8fa4a:	48 81 ec c0 00 00 00 	sub    $0xc0,%rsp
0011  1f8fa51:	65 48 8b 04 25 28 00 00 00 	mov    %gs:0x28,%rax
001a  1f8fa5a:	49 89 fe             	mov    %rdi,%r14
001d  1f8fa5d:	48 8d bc 24 88 00 00 00 	lea    0x88(%rsp),%rdi
0025  1f8fa65:	ba 30 00 00 00       	mov    $0x30,%edx
002a  1f8fa6a:	31 f6                	xor    %esi,%esi
002c  1f8fa6c:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
0036  1f8fa76:	48 89 84 24 b8 00 00 00 	mov    %rax,0xb8(%rsp)
003e  1f8fa7e:	e8 00 00 00 00       	call   1f8fa83 <netlink_dump+0x43>	1f8fa7f: R_X86_64_PLT32	memset-0x4
0043  1f8fa83:	4d 8d ae 40 06 00 00 	lea    0x640(%r14),%r13
004a  1f8fa8a:	4c 89 eb             	mov    %r13,%rbx
004d  1f8fa8d:	48 c1 eb 03          	shr    $0x3,%rbx
0051  1f8fa91:	42 80 3c 23 00       	cmpb   $0x0,(%rbx,%r12,1)
0056  1f8fa96:	74 08                	je     1f8faa0 <netlink_dump+0x60>
0058  1f8fa98:	4c 89 ef             	mov    %r13,%rdi
005b  1f8fa9b:	e8 00 00 00 00       	call   1f8faa0 <netlink_dump+0x60>	1f8fa9c: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0060  1f8faa0:	49 8b be 40 06 00 00 	mov    0x640(%r14),%rdi
0067  1f8faa7:	31 f6                	xor    %esi,%esi
0069  1f8faa9:	e8 00 00 00 00       	call   1f8faae <netlink_dump+0x6e>	1f8faaa: R_X86_64_PLT32	mutex_lock_nested-0x4
006e  1f8faae:	4d 8d be b9 05 00 00 	lea    0x5b9(%r14),%r15
0075  1f8fab5:	4c 89 fa             	mov    %r15,%rdx
0078  1f8fab8:	48 c1 ea 03          	shr    $0x3,%rdx
007c  1f8fabc:	42 8a 04 22          	mov    (%rdx,%r12,1),%al
0080  1f8fac0:	84 c0                	test   %al,%al
0082  1f8fac2:	75 67                	jne    1f8fb2b <netlink_dump+0xeb>
0084  1f8fac4:	41 0f b6 2f          	movzbl (%r15),%ebp
0088  1f8fac8:	48 83 fd 02          	cmp    $0x2,%rbp
008c  1f8facc:	73 7a                	jae    1f8fb48 <netlink_dump+0x108>
008e  1f8face:	40 f6 c5 01          	test   $0x1,%bpl
0092  1f8fad2:	0f 85 93 00 00 00    	jne    1f8fb6b <netlink_dump+0x12b>
0098  1f8fad8:	bd ea ff ff ff       	mov    $0xffffffea,%ebp
009d  1f8fadd:	45 31 f6             	xor    %r14d,%r14d
00a0  1f8fae0:	42 80 3c 23 00       	cmpb   $0x0,(%rbx,%r12,1)
00a5  1f8fae5:	74 08                	je     1f8faef <netlink_dump+0xaf>
00a7  1f8fae7:	4c 89 ef             	mov    %r13,%rdi
00aa  1f8faea:	e8 00 00 00 00       	call   1f8faef <netlink_dump+0xaf>	1f8faeb: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
00af  1f8faef:	49 8b 7d 00          	mov    0x0(%r13),%rdi
00b3  1f8faf3:	e8 00 00 00 00       	call   1f8faf8 <netlink_dump+0xb8>	1f8faf4: R_X86_64_PLT32	mutex_unlock-0x4
00b8  1f8faf8:	4c 89 f7             	mov    %r14,%rdi
00bb  1f8fafb:	e8 00 00 00 00       	call   1f8fb00 <netlink_dump+0xc0>	1f8fafc: R_X86_64_PLT32	kfree_skb-0x4
00c0  1f8fb00:	65 48 8b 04 25 28 00 00 00 	mov    %gs:0x28,%rax
00c9  1f8fb09:	48 3b 84 24 b8 00 00 00 	cmp    0xb8(%rsp),%rax
00d1  1f8fb11:	0f 85 c8 0f 00 00    	jne    1f90adf <netlink_dump+0x109f>
00d7  1f8fb17:	89 e8                	mov    %ebp,%eax
00d9  1f8fb19:	48 81 c4 c0 00 00 00 	add    $0xc0,%rsp
00e0  1f8fb20:	5b                   	pop    %rbx
00e1  1f8fb21:	41 5c                	pop    %r12
00e3  1f8fb23:	41 5d                	pop    %r13
00e5  1f8fb25:	41 5e                	pop    %r14
00e7  1f8fb27:	41 5f                	pop    %r15
00e9  1f8fb29:	5d                   	pop    %rbp
00ea  1f8fb2a:	c3                   	ret
00eb  1f8fb2b:	44 89 f9             	mov    %r15d,%ecx
00ee  1f8fb2e:	80 e1 07             	and    $0x7,%cl
00f1  1f8fb31:	38 c1                	cmp    %al,%cl
00f3  1f8fb33:	7c 8f                	jl     1f8fac4 <netlink_dump+0x84>
00f5  1f8fb35:	4c 89 ff             	mov    %r15,%rdi
00f8  1f8fb38:	48 89 d5             	mov    %rdx,%rbp
00fb  1f8fb3b:	e8 00 00 00 00       	call   1f8fb40 <netlink_dump+0x100>	1f8fb3c: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
0100  1f8fb40:	48 89 ea             	mov    %rbp,%rdx
0103  1f8fb43:	e9 7c ff ff ff       	jmp    1f8fac4 <netlink_dump+0x84>
0108  1f8fb48:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1f8fb4b: R_X86_64_32S	.data+0xa74c60
010f  1f8fb4f:	48 89 ee             	mov    %rbp,%rsi
0112  1f8fb52:	48 89 54 24 50       	mov    %rdx,0x50(%rsp)
0117  1f8fb57:	e8 00 00 00 00       	call   1f8fb5c <netlink_dump+0x11c>	1f8fb58: R_X86_64_PLT32	__ubsan_handle_load_invalid_value-0x4
011c  1f8fb5c:	48 8b 54 24 50       	mov    0x50(%rsp),%rdx
0121  1f8fb61:	40 f6 c5 01          	test   $0x1,%bpl
0125  1f8fb65:	0f 84 6d ff ff ff    	je     1f8fad8 <netlink_dump+0x98>
012b  1f8fb6b:	48 89 5c 24 30       	mov    %rbx,0x30(%rsp)
0130  1f8fb70:	49 8d 9e 28 02 00 00 	lea    0x228(%r14),%rbx
0137  1f8fb77:	be 04 00 00 00       	mov    $0x4,%esi
013c  1f8fb7c:	48 89 54 24 50       	mov    %rdx,0x50(%rsp)
0141  1f8fb81:	4c 89 7c 24 68       	mov    %r15,0x68(%rsp)
0146  1f8fb86:	48 89 df             	mov    %rbx,%rdi
0149  1f8fb89:	e8 00 00 00 00       	call   1f8fb8e <netlink_dump+0x14e>	1f8fb8a: R_X86_64_PLT32	__kasan_check_read-0x4
014e  1f8fb8e:	48 89 d8             	mov    %rbx,%rax
0151  1f8fb91:	48 c1 e8 03          	shr    $0x3,%rax
0155  1f8fb95:	42 8a 04 20          	mov    (%rax,%r12,1),%al
0159  1f8fb99:	84 c0                	test   %al,%al
015b  1f8fb9b:	0f 85 9f 09 00 00    	jne    1f90540 <netlink_dump+0xb00>
0161  1f8fba1:	49 8d ae 4c 02 00 00 	lea    0x24c(%r14),%rbp
0168  1f8fba8:	45 8b be 28 02 00 00 	mov    0x228(%r14),%r15d
016f  1f8fbaf:	48 89 e8             	mov    %rbp,%rax
0172  1f8fbb2:	48 c1 e8 03          	shr    $0x3,%rax
0176  1f8fbb6:	42 8a 04 20          	mov    (%rax,%r12,1),%al
017a  1f8fbba:	84 c0                	test   %al,%al
017c  1f8fbbc:	0f 85 9b 09 00 00    	jne    1f9055d <netlink_dump+0xb1d>
0182  1f8fbc2:	44 3b 7d 00          	cmp    0x0(%rbp),%r15d
0186  1f8fbc6:	0f 8d 9f 04 00 00    	jge    1f9006b <netlink_dump+0x62b>
018c  1f8fbcc:	49 8d be fc 05 00 00 	lea    0x5fc(%r14),%rdi
0193  1f8fbd3:	48 89 5c 24 28       	mov    %rbx,0x28(%rsp)
0198  1f8fbd8:	48 89 f8             	mov    %rdi,%rax
019b  1f8fbdb:	48 c1 e8 03          	shr    $0x3,%rax
019f  1f8fbdf:	42 8a 04 20          	mov    (%rax,%r12,1),%al
01a3  1f8fbe3:	84 c0                	test   %al,%al
01a5  1f8fbe5:	0f 85 8f 09 00 00    	jne    1f9057a <netlink_dump+0xb3a>
01ab  1f8fbeb:	41 8b 86 fc 05 00 00 	mov    0x5fc(%r14),%eax
01b2  1f8fbf2:	49 8d 9e 58 05 00 00 	lea    0x558(%r14),%rbx
01b9  1f8fbf9:	bd 80 0e 00 00       	mov    $0xe80,%ebp
01be  1f8fbfe:	4c 89 6c 24 38       	mov    %r13,0x38(%rsp)
01c3  1f8fc03:	48 89 d9             	mov    %rbx,%rcx
01c6  1f8fc06:	3d 81 0e 00 00       	cmp    $0xe81,%eax
01cb  1f8fc0b:	0f 4d e8             	cmovge %eax,%ebp
01ce  1f8fc0e:	48 c1 e9 03          	shr    $0x3,%rcx
01d2  1f8fc12:	42 80 3c 21 00       	cmpb   $0x0,(%rcx,%r12,1)
01d7  1f8fc17:	74 08                	je     1f8fc21 <netlink_dump+0x1e1>
01d9  1f8fc19:	48 89 df             	mov    %rbx,%rdi
01dc  1f8fc1c:	e8 00 00 00 00       	call   1f8fc21 <netlink_dump+0x1e1>	1f8fc1d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
01e1  1f8fc21:	4c 8b 3b             	mov    (%rbx),%r15
01e4  1f8fc24:	49 39 ef             	cmp    %rbp,%r15
01e7  1f8fc27:	76 1c                	jbe    1f8fc45 <netlink_dump+0x205>
01e9  1f8fc29:	44 89 ff             	mov    %r15d,%edi
01ec  1f8fc2c:	be c0 28 01 00       	mov    $0x128c0,%esi
01f1  1f8fc31:	31 d2                	xor    %edx,%edx
01f3  1f8fc33:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
01f8  1f8fc38:	e8 00 00 00 00       	call   1f8fc3d <netlink_dump+0x1fd>	1f8fc39: R_X86_64_PLT32	__alloc_skb-0x4
01fd  1f8fc3d:	49 89 c5             	mov    %rax,%r13
0200  1f8fc40:	48 85 c0             	test   %rax,%rax
0203  1f8fc43:	75 22                	jne    1f8fc67 <netlink_dump+0x227>
0205  1f8fc45:	89 ef                	mov    %ebp,%edi
0207  1f8fc47:	be c0 0c 00 00       	mov    $0xcc0,%esi
020c  1f8fc4c:	31 d2                	xor    %edx,%edx
020e  1f8fc4e:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
0213  1f8fc53:	e8 00 00 00 00       	call   1f8fc58 <netlink_dump+0x218>	1f8fc54: R_X86_64_PLT32	__alloc_skb-0x4
0218  1f8fc58:	49 89 c5             	mov    %rax,%r13
021b  1f8fc5b:	48 85 c0             	test   %rax,%rax
021e  1f8fc5e:	41 89 ef             	mov    %ebp,%r15d
0221  1f8fc61:	0f 84 ff 03 00 00    	je     1f90066 <netlink_dump+0x626>
0227  1f8fc67:	49 8d 5d 6c          	lea    0x6c(%r13),%rbx
022b  1f8fc6b:	48 89 d8             	mov    %rbx,%rax
022e  1f8fc6e:	48 c1 e8 03          	shr    $0x3,%rax
0232  1f8fc72:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
0237  1f8fc77:	42 8a 04 20          	mov    (%rax,%r12,1),%al
023b  1f8fc7b:	84 c0                	test   %al,%al
023d  1f8fc7d:	0f 85 11 09 00 00    	jne    1f90594 <netlink_dump+0xb54>
0243  1f8fc83:	45 31 e4             	xor    %r12d,%r12d
0246  1f8fc86:	83 3b 00             	cmpl   $0x0,(%rbx)
0249  1f8fc89:	48 89 5c 24 08       	mov    %rbx,0x8(%rsp)
024e  1f8fc8e:	75 47                	jne    1f8fcd7 <netlink_dump+0x297>
0250  1f8fc90:	49 8d bd b4 00 00 00 	lea    0xb4(%r13),%rdi
0257  1f8fc97:	48 bb 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbx
0261  1f8fca1:	48 89 f8             	mov    %rdi,%rax
0264  1f8fca4:	48 c1 e8 03          	shr    $0x3,%rax
0268  1f8fca8:	8a 04 18             	mov    (%rax,%rbx,1),%al
026b  1f8fcab:	84 c0                	test   %al,%al
026d  1f8fcad:	0f 85 13 0a 00 00    	jne    1f906c6 <netlink_dump+0xc86>
0273  1f8fcb3:	49 8d ad b0 00 00 00 	lea    0xb0(%r13),%rbp
027a  1f8fcba:	45 8b a5 b4 00 00 00 	mov    0xb4(%r13),%r12d
0281  1f8fcc1:	48 89 e8             	mov    %rbp,%rax
0284  1f8fcc4:	48 c1 e8 03          	shr    $0x3,%rax
0288  1f8fcc8:	8a 04 18             	mov    (%rax,%rbx,1),%al
028b  1f8fccb:	84 c0                	test   %al,%al
028d  1f8fccd:	0f 85 0d 0a 00 00    	jne    1f906e0 <netlink_dump+0xca0>
0293  1f8fcd3:	44 2b 65 00          	sub    0x0(%rbp),%r12d
0297  1f8fcd7:	49 8d bd c0 00 00 00 	lea    0xc0(%r13),%rdi
029e  1f8fcde:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
02a8  1f8fce8:	45 29 fc             	sub    %r15d,%r12d
02ab  1f8fceb:	48 89 f8             	mov    %rdi,%rax
02ae  1f8fcee:	48 c1 e8 03          	shr    $0x3,%rax
02b2  1f8fcf2:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
02b6  1f8fcf6:	74 05                	je     1f8fcfd <netlink_dump+0x2bd>
02b8  1f8fcf8:	e8 00 00 00 00       	call   1f8fcfd <netlink_dump+0x2bd>	1f8fcf9: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
02bd  1f8fcfd:	49 63 dc             	movslq %r12d,%rbx
02c0  1f8fd00:	49 8d 8d b0 00 00 00 	lea    0xb0(%r13),%rcx
02c7  1f8fd07:	49 bf 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r15
02d1  1f8fd11:	49 03 9d c0 00 00 00 	add    0xc0(%r13),%rbx
02d8  1f8fd18:	48 89 c8             	mov    %rcx,%rax
02db  1f8fd1b:	48 89 4c 24 20       	mov    %rcx,0x20(%rsp)
02e0  1f8fd20:	48 c1 e9 03          	shr    $0x3,%rcx
02e4  1f8fd24:	48 89 4c 24 40       	mov    %rcx,0x40(%rsp)
02e9  1f8fd29:	49 89 9d c0 00 00 00 	mov    %rbx,0xc0(%r13)
02f0  1f8fd30:	42 8a 04 39          	mov    (%rcx,%r15,1),%al
02f4  1f8fd34:	84 c0                	test   %al,%al
02f6  1f8fd36:	0f 85 75 08 00 00    	jne    1f905b1 <netlink_dump+0xb71>
02fc  1f8fd3c:	49 8d ad b8 00 00 00 	lea    0xb8(%r13),%rbp
0303  1f8fd43:	45 01 a5 b0 00 00 00 	add    %r12d,0xb0(%r13)
030a  1f8fd4a:	48 89 e8             	mov    %rbp,%rax
030d  1f8fd4d:	48 c1 e8 03          	shr    $0x3,%rax
0311  1f8fd51:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1)
0316  1f8fd56:	48 89 44 24 78       	mov    %rax,0x78(%rsp)
031b  1f8fd5b:	74 08                	je     1f8fd65 <netlink_dump+0x325>
031d  1f8fd5d:	48 89 ef             	mov    %rbp,%rdi
0320  1f8fd60:	e8 00 00 00 00       	call   1f8fd65 <netlink_dump+0x325>	1f8fd61: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0325  1f8fd65:	49 8d bd ac 00 00 00 	lea    0xac(%r13),%rdi
032c  1f8fd6c:	41 2b 9d b8 00 00 00 	sub    0xb8(%r13),%ebx
0333  1f8fd73:	48 89 f8             	mov    %rdi,%rax
0336  1f8fd76:	48 c1 e8 03          	shr    $0x3,%rax
033a  1f8fd7a:	42 8a 04 38          	mov    (%rax,%r15,1),%al
033e  1f8fd7e:	84 c0                	test   %al,%al
0340  1f8fd80:	0f 85 4d 08 00 00    	jne    1f905d3 <netlink_dump+0xb93>
0346  1f8fd86:	49 8d bd ae 00 00 00 	lea    0xae(%r13),%rdi
034d  1f8fd8d:	66 41 89 9d ac 00 00 00 	mov    %bx,0xac(%r13)
0355  1f8fd95:	48 89 ac 24 80 00 00 00 	mov    %rbp,0x80(%rsp)
035d  1f8fd9d:	48 89 f8             	mov    %rdi,%rax
0360  1f8fda0:	48 c1 e8 03          	shr    $0x3,%rax
0364  1f8fda4:	42 8a 04 38          	mov    (%rax,%r15,1),%al
0368  1f8fda8:	84 c0                	test   %al,%al
036a  1f8fdaa:	0f 85 3c 08 00 00    	jne    1f905ec <netlink_dump+0xbac>
0370  1f8fdb0:	49 8d 6d 18          	lea    0x18(%r13),%rbp
0374  1f8fdb4:	66 41 89 9d ae 00 00 00 	mov    %bx,0xae(%r13)
037c  1f8fdbc:	48 89 eb             	mov    %rbp,%rbx
037f  1f8fdbf:	48 c1 eb 03          	shr    $0x3,%rbx
0383  1f8fdc3:	42 80 3c 3b 00       	cmpb   $0x0,(%rbx,%r15,1)
0388  1f8fdc8:	74 08                	je     1f8fdd2 <netlink_dump+0x392>
038a  1f8fdca:	48 89 ef             	mov    %rbp,%rdi
038d  1f8fdcd:	e8 00 00 00 00       	call   1f8fdd2 <netlink_dump+0x392>	1f8fdce: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0392  1f8fdd2:	48 83 7d 00 00       	cmpq   $0x0,0x0(%rbp)
0397  1f8fdd7:	0f 85 42 07 00 00    	jne    1f9051f <netlink_dump+0xadf>
039d  1f8fddd:	42 80 3c 3b 00       	cmpb   $0x0,(%rbx,%r15,1)
03a2  1f8fde2:	74 08                	je     1f8fdec <netlink_dump+0x3ac>
03a4  1f8fde4:	48 89 ef             	mov    %rbp,%rdi
03a7  1f8fde7:	e8 00 00 00 00       	call   1f8fdec <netlink_dump+0x3ac>	1f8fde8: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
03ac  1f8fdec:	49 8d 7d 60          	lea    0x60(%r13),%rdi
03b0  1f8fdf0:	4d 89 75 18          	mov    %r14,0x18(%r13)
03b4  1f8fdf4:	48 89 f8             	mov    %rdi,%rax
03b7  1f8fdf7:	48 c1 e8 03          	shr    $0x3,%rax
03bb  1f8fdfb:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1)
03c0  1f8fe00:	74 05                	je     1f8fe07 <netlink_dump+0x3c7>
03c2  1f8fe02:	e8 00 00 00 00       	call   1f8fe07 <netlink_dump+0x3c7>	1f8fe03: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
03c7  1f8fe07:	4d 8d bd c8 00 00 00 	lea    0xc8(%r13),%r15
03ce  1f8fe0e:	49 c7 45 60 00 00 00 00 	movq   $0x0,0x60(%r13)	1f8fe12: R_X86_64_32S	.text+0x1f91890
03d6  1f8fe16:	48 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbp
03e0  1f8fe20:	4d 89 fc             	mov    %r15,%r12
03e3  1f8fe23:	49 c1 ec 03          	shr    $0x3,%r12
03e7  1f8fe27:	41 8a 04 2c          	mov    (%r12,%rbp,1),%al
03eb  1f8fe2b:	84 c0                	test   %al,%al
03ed  1f8fe2d:	0f 85 d2 07 00 00    	jne    1f90605 <netlink_dump+0xbc5>
03f3  1f8fe33:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
03f8  1f8fe38:	41 8b 1f             	mov    (%r15),%ebx
03fb  1f8fe3b:	be 04 00 00 00       	mov    $0x4,%esi
0400  1f8fe40:	e8 00 00 00 00       	call   1f8fe45 <netlink_dump+0x405>	1f8fe41: R_X86_64_PLT32	__kasan_check_write-0x4
0405  1f8fe45:	f0 41 01 9e 28 02 00 00 	lock add %ebx,0x228(%r14)
040d  1f8fe4d:	49 8d 5e 28          	lea    0x28(%r14),%rbx
0411  1f8fe51:	48 89 d8             	mov    %rbx,%rax
0414  1f8fe54:	48 c1 e8 03          	shr    $0x3,%rax
0418  1f8fe58:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
041c  1f8fe5c:	74 08                	je     1f8fe66 <netlink_dump+0x426>
041e  1f8fe5e:	48 89 df             	mov    %rbx,%rdi
0421  1f8fe61:	e8 00 00 00 00       	call   1f8fe66 <netlink_dump+0x426>	1f8fe62: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0426  1f8fe66:	bd e0 00 00 00       	mov    $0xe0,%ebp
042b  1f8fe6b:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
0435  1f8fe75:	48 03 2b             	add    (%rbx),%rbp
0438  1f8fe78:	48 89 e8             	mov    %rbp,%rax
043b  1f8fe7b:	48 c1 e8 03          	shr    $0x3,%rax
043f  1f8fe7f:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
0443  1f8fe83:	74 08                	je     1f8fe8d <netlink_dump+0x44d>
0445  1f8fe85:	48 89 ef             	mov    %rbp,%rdi
0448  1f8fe88:	e8 00 00 00 00       	call   1f8fe8d <netlink_dump+0x44d>	1f8fe89: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
044d  1f8fe8d:	48 83 7d 00 00       	cmpq   $0x0,0x0(%rbp)
0452  1f8fe92:	74 39                	je     1f8fecd <netlink_dump+0x48d>
0454  1f8fe94:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
045e  1f8fe9e:	41 8a 04 0c          	mov    (%r12,%rcx,1),%al
0462  1f8fea2:	49 89 cc             	mov    %rcx,%r12
0465  1f8fea5:	84 c0                	test   %al,%al
0467  1f8fea7:	0f 85 9a 07 00 00    	jne    1f90647 <netlink_dump+0xc07>
046d  1f8fead:	49 8d ae 40 02 00 00 	lea    0x240(%r14),%rbp
0474  1f8feb4:	41 8b 1f             	mov    (%r15),%ebx
0477  1f8feb7:	48 89 e8             	mov    %rbp,%rax
047a  1f8feba:	48 c1 e8 03          	shr    $0x3,%rax
047e  1f8febe:	42 8a 04 20          	mov    (%rax,%r12,1),%al
0482  1f8fec2:	84 c0                	test   %al,%al
0484  1f8fec4:	0f 85 9b 07 00 00    	jne    1f90665 <netlink_dump+0xc25>
048a  1f8feca:	29 5d 00             	sub    %ebx,0x0(%rbp)
048d  1f8fecd:	49 8d 96 bc 05 00 00 	lea    0x5bc(%r14),%rdx
0494  1f8fed4:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
049e  1f8fede:	48 89 d0             	mov    %rdx,%rax
04a1  1f8fee1:	48 89 54 24 10       	mov    %rdx,0x10(%rsp)
04a6  1f8fee6:	48 c1 e8 03          	shr    $0x3,%rax
04aa  1f8feea:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
04af  1f8feef:	42 8a 04 20          	mov    (%rax,%r12,1),%al
04b3  1f8fef3:	84 c0                	test   %al,%al
04b5  1f8fef5:	0f 85 28 07 00 00    	jne    1f90623 <netlink_dump+0xbe3>
04bb  1f8fefb:	83 3a 00             	cmpl   $0x0,(%rdx)
04be  1f8fefe:	49 8d ae c0 05 00 00 	lea    0x5c0(%r14),%rbp
04c5  1f8ff05:	0f 8e b5 00 00 00    	jle    1f8ffc0 <netlink_dump+0x580>
04cb  1f8ff0b:	4c 89 e0             	mov    %r12,%rax
04ce  1f8ff0e:	4d 8d a6 f0 05 00 00 	lea    0x5f0(%r14),%r12
04d5  1f8ff15:	4d 89 e7             	mov    %r12,%r15
04d8  1f8ff18:	49 c1 ef 03          	shr    $0x3,%r15
04dc  1f8ff1c:	41 80 3c 07 00       	cmpb   $0x0,(%r15,%rax,1)
04e1  1f8ff21:	74 08                	je     1f8ff2b <netlink_dump+0x4eb>
04e3  1f8ff23:	4c 89 e7             	mov    %r12,%rdi
04e6  1f8ff26:	e8 00 00 00 00       	call   1f8ff2b <netlink_dump+0x4eb>	1f8ff27: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
04eb  1f8ff2b:	49 8d 9e d0 05 00 00 	lea    0x5d0(%r14),%rbx
04f2  1f8ff32:	48 8d 84 24 88 00 00 00 	lea    0x88(%rsp),%rax
04fa  1f8ff3a:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
0504  1f8ff44:	48 89 da             	mov    %rbx,%rdx
0507  1f8ff47:	49 89 86 f0 05 00 00 	mov    %rax,0x5f0(%r14)
050e  1f8ff4e:	48 c1 ea 03          	shr    $0x3,%rdx
0512  1f8ff52:	80 3c 0a 00          	cmpb   $0x0,(%rdx,%rcx,1)
0516  1f8ff56:	74 08                	je     1f8ff60 <netlink_dump+0x520>
0518  1f8ff58:	48 89 df             	mov    %rbx,%rdi
051b  1f8ff5b:	e8 00 00 00 00       	call   1f8ff60 <netlink_dump+0x520>	1f8ff5c: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0520  1f8ff60:	4c 8b 1b             	mov    (%rbx),%r11
0523  1f8ff63:	4c 89 ef             	mov    %r13,%rdi
0526  1f8ff66:	48 89 ee             	mov    %rbp,%rsi
0529  1f8ff69:	48 89 6c 24 28       	mov    %rbp,0x28(%rsp)
052e  1f8ff6e:	e8 00 00 00 00       	call   1f8ff73 <netlink_dump+0x533>	1f8ff6f: R_X86_64_PLT32	__x86_indirect_thunk_r11-0x4
0533  1f8ff73:	89 c5                	mov    %eax,%ebp
0535  1f8ff75:	48 8b 44 24 60       	mov    0x60(%rsp),%rax
053a  1f8ff7a:	48 bb 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbx
0544  1f8ff84:	8a 04 18             	mov    (%rax,%rbx,1),%al
0547  1f8ff87:	84 c0                	test   %al,%al
0549  1f8ff89:	0f 85 f3 06 00 00    	jne    1f90682 <netlink_dump+0xc42>
054f  1f8ff8f:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
0554  1f8ff94:	89 28                	mov    %ebp,(%rax)
0556  1f8ff96:	41 80 3c 1f 00       	cmpb   $0x0,(%r15,%rbx,1)
055b  1f8ff9b:	74 08                	je     1f8ffa5 <netlink_dump+0x565>
055d  1f8ff9d:	4c 89 e7             	mov    %r12,%rdi
0560  1f8ffa0:	e8 00 00 00 00       	call   1f8ffa5 <netlink_dump+0x565>	1f8ffa1: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0565  1f8ffa5:	85 ed                	test   %ebp,%ebp
0567  1f8ffa7:	48 8b 6c 24 28       	mov    0x28(%rsp),%rbp
056c  1f8ffac:	49 c7 04 24 00 00 00 00 	movq   $0x0,(%r12)
0574  1f8ffb4:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
057e  1f8ffbe:	7f 63                	jg     1f90023 <netlink_dump+0x5e3>
0580  1f8ffc0:	48 8b 44 24 48       	mov    0x48(%rsp),%rax
0585  1f8ffc5:	42 8a 04 20          	mov    (%rax,%r12,1),%al
0589  1f8ffc9:	84 c0                	test   %al,%al
058b  1f8ffcb:	0f 85 d3 06 00 00    	jne    1f906a4 <netlink_dump+0xc64>
0591  1f8ffd1:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
0596  1f8ffd6:	83 38 00             	cmpl   $0x0,(%rax)
0599  1f8ffd9:	75 48                	jne    1f90023 <netlink_dump+0x5e3>
059b  1f8ffdb:	4d 8d bd b4 00 00 00 	lea    0xb4(%r13),%r15
05a2  1f8ffe2:	48 89 6c 24 28       	mov    %rbp,0x28(%rsp)
05a7  1f8ffe7:	4c 89 fb             	mov    %r15,%rbx
05aa  1f8ffea:	48 c1 eb 03          	shr    $0x3,%rbx
05ae  1f8ffee:	42 8a 04 23          	mov    (%rbx,%r12,1),%al
05b2  1f8fff2:	84 c0                	test   %al,%al
05b4  1f8fff4:	0f 85 03 07 00 00    	jne    1f906fd <netlink_dump+0xcbd>
05ba  1f8fffa:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
05bf  1f8ffff:	41 8b 2f             	mov    (%r15),%ebp
05c2  1f90002:	42 8a 04 20          	mov    (%rax,%r12,1),%al
05c6  1f90006:	84 c0                	test   %al,%al
05c8  1f90008:	0f 85 0d 07 00 00    	jne    1f9071b <netlink_dump+0xcdb>
05ce  1f9000e:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
05d3  1f90013:	2b 28                	sub    (%rax),%ebp
05d5  1f90015:	83 fd 13             	cmp    $0x13,%ebp
05d8  1f90018:	48 8b 6c 24 28       	mov    0x28(%rsp),%rbp
05dd  1f9001d:	0f 8f aa 00 00 00    	jg     1f900cd <netlink_dump+0x68d>
05e3  1f90023:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
05e8  1f90028:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
05ed  1f9002d:	74 0a                	je     1f90039 <netlink_dump+0x5f9>
05ef  1f9002f:	48 8b 7c 24 38       	mov    0x38(%rsp),%rdi
05f4  1f90034:	e8 00 00 00 00       	call   1f90039 <netlink_dump+0x5f9>	1f90035: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
05f9  1f90039:	49 8b be 40 06 00 00 	mov    0x640(%r14),%rdi
0600  1f90040:	e8 00 00 00 00       	call   1f90045 <netlink_dump+0x605>	1f90041: R_X86_64_PLT32	mutex_unlock-0x4
0605  1f90045:	4c 89 f7             	mov    %r14,%rdi
0608  1f90048:	4c 89 ee             	mov    %r13,%rsi
060b  1f9004b:	ba 01 00 00 00       	mov    $0x1,%edx
0610  1f90050:	e8 00 00 00 00       	call   1f90055 <netlink_dump+0x615>	1f90051: R_X86_64_PLT32	sk_filter_trim_cap-0x4
0615  1f90055:	85 c0                	test   %eax,%eax
0617  1f90057:	74 2f                	je     1f90088 <netlink_dump+0x648>
0619  1f90059:	4c 89 ef             	mov    %r13,%rdi
061c  1f9005c:	e8 00 00 00 00       	call   1f90061 <netlink_dump+0x621>	1f9005d: R_X86_64_PLT32	kfree_skb-0x4
0621  1f90061:	e9 b2 04 00 00       	jmp    1f90518 <netlink_dump+0xad8>
0626  1f90066:	4c 8b 6c 24 38       	mov    0x38(%rsp),%r13
062b  1f9006b:	45 31 f6             	xor    %r14d,%r14d
062e  1f9006e:	48 8b 5c 24 30       	mov    0x30(%rsp),%rbx
0633  1f90073:	bd 97 ff ff ff       	mov    $0xffffff97,%ebp
0638  1f90078:	42 80 3c 23 00       	cmpb   $0x0,(%rbx,%r12,1)
063d  1f9007d:	0f 85 64 fa ff ff    	jne    1f8fae7 <netlink_dump+0xa7>
0643  1f90083:	e9 67 fa ff ff       	jmp    1f8faef <netlink_dump+0xaf>
0648  1f90088:	4c 89 ef             	mov    %r13,%rdi
064b  1f9008b:	e8 70 19 00 00       	call   1f91a00 <netlink_deliver_tap>
0650  1f90090:	49 8d be c8 01 00 00 	lea    0x1c8(%r14),%rdi
0657  1f90097:	4c 89 ee             	mov    %r13,%rsi
065a  1f9009a:	e8 00 00 00 00       	call   1f9009f <netlink_dump+0x65f>	1f9009b: R_X86_64_PLT32	skb_queue_tail-0x4
065f  1f9009f:	49 8d be e8 04 00 00 	lea    0x4e8(%r14),%rdi
0666  1f900a6:	48 89 f8             	mov    %rdi,%rax
0669  1f900a9:	48 c1 e8 03          	shr    $0x3,%rax
066d  1f900ad:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
0672  1f900b2:	74 05                	je     1f900b9 <netlink_dump+0x679>
0674  1f900b4:	e8 00 00 00 00       	call   1f900b9 <netlink_dump+0x679>	1f900b5: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0679  1f900b9:	4d 8b 9e e8 04 00 00 	mov    0x4e8(%r14),%r11
0680  1f900c0:	4c 89 f7             	mov    %r14,%rdi
0683  1f900c3:	e8 00 00 00 00       	call   1f900c8 <netlink_dump+0x688>	1f900c4: R_X86_64_PLT32	__x86_indirect_thunk_r11-0x4
0688  1f900c8:	e9 4b 04 00 00       	jmp    1f90518 <netlink_dump+0xad8>
068d  1f900cd:	48 8d 7d 3a          	lea    0x3a(%rbp),%rdi
0691  1f900d1:	48 89 f8             	mov    %rdi,%rax
0694  1f900d4:	48 c1 e8 03          	shr    $0x3,%rax
0698  1f900d8:	42 8a 04 20          	mov    (%rax,%r12,1),%al
069c  1f900dc:	84 c0                	test   %al,%al
069e  1f900de:	0f 85 59 06 00 00    	jne    1f9073d <netlink_dump+0xcfd>
06a4  1f900e4:	42 8a 04 23          	mov    (%rbx,%r12,1),%al
06a8  1f900e8:	0f b7 55 3a          	movzwl 0x3a(%rbp),%edx
06ac  1f900ec:	84 c0                	test   %al,%al
06ae  1f900ee:	0f 85 62 06 00 00    	jne    1f90756 <netlink_dump+0xd16>
06b4  1f900f4:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
06b9  1f900f9:	41 8b 1f             	mov    (%r15),%ebx
06bc  1f900fc:	42 8a 04 20          	mov    (%rax,%r12,1),%al
06c0  1f90100:	84 c0                	test   %al,%al
06c2  1f90102:	0f 85 70 06 00 00    	jne    1f90778 <netlink_dump+0xd38>
06c8  1f90108:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
06cd  1f9010d:	2b 18                	sub    (%rax),%ebx
06cf  1f9010f:	83 fb 14             	cmp    $0x14,%ebx
06d2  1f90112:	0f 8c 19 04 00 00    	jl     1f90531 <netlink_dump+0xaf1>
06d8  1f90118:	48 8d 5d 08          	lea    0x8(%rbp),%rbx
06dc  1f9011c:	89 54 24 08          	mov    %edx,0x8(%rsp)
06e0  1f90120:	48 89 d8             	mov    %rbx,%rax
06e3  1f90123:	48 c1 e8 03          	shr    $0x3,%rax
06e7  1f90127:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
06ec  1f9012c:	74 08                	je     1f90136 <netlink_dump+0x6f6>
06ee  1f9012e:	48 89 df             	mov    %rbx,%rdi
06f1  1f90131:	e8 00 00 00 00       	call   1f90136 <netlink_dump+0x6f6>	1f90132: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
06f6  1f90136:	48 8b 2b             	mov    (%rbx),%rbp
06f9  1f90139:	48 83 c5 08          	add    $0x8,%rbp
06fd  1f9013d:	48 89 e8             	mov    %rbp,%rax
0700  1f90140:	48 c1 e8 03          	shr    $0x3,%rax
0704  1f90144:	42 8a 04 20          	mov    (%rax,%r12,1),%al
0708  1f90148:	84 c0                	test   %al,%al
070a  1f9014a:	0f 85 50 06 00 00    	jne    1f907a0 <netlink_dump+0xd60>
0710  1f90150:	48 8b 5c 24 28       	mov    0x28(%rsp),%rbx
0715  1f90155:	44 8b 7d 00          	mov    0x0(%rbp),%r15d
0719  1f90159:	48 89 d8             	mov    %rbx,%rax
071c  1f9015c:	48 c1 e8 03          	shr    $0x3,%rax
0720  1f90160:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
0725  1f90165:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
072a  1f9016a:	74 08                	je     1f90174 <netlink_dump+0x734>
072c  1f9016c:	48 89 df             	mov    %rbx,%rdi
072f  1f9016f:	e8 00 00 00 00       	call   1f90174 <netlink_dump+0x734>	1f90170: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0734  1f90174:	48 8b 2b             	mov    (%rbx),%rbp
0737  1f90177:	48 83 c5 34          	add    $0x34,%rbp
073b  1f9017b:	48 89 e8             	mov    %rbp,%rax
073e  1f9017e:	48 c1 e8 03          	shr    $0x3,%rax
0742  1f90182:	42 8a 04 20          	mov    (%rax,%r12,1),%al
0746  1f90186:	84 c0                	test   %al,%al
0748  1f90188:	0f 85 2f 06 00 00    	jne    1f907bd <netlink_dump+0xd7d>
074e  1f9018e:	8b 6d 00             	mov    0x0(%rbp),%ebp
0751  1f90191:	4c 89 ef             	mov    %r13,%rdi
0754  1f90194:	be 14 00 00 00       	mov    $0x14,%esi
0759  1f90199:	e8 00 00 00 00       	call   1f9019e <netlink_dump+0x75e>	1f9019a: R_X86_64_PLT32	skb_put-0x4
075e  1f9019e:	48 8d 78 04          	lea    0x4(%rax),%rdi
0762  1f901a2:	48 89 c6             	mov    %rax,%rsi
0765  1f901a5:	48 89 f8             	mov    %rdi,%rax
0768  1f901a8:	48 89 34 24          	mov    %rsi,(%rsp)
076c  1f901ac:	48 c1 e8 03          	shr    $0x3,%rax
0770  1f901b0:	42 8a 04 20          	mov    (%rax,%r12,1),%al
0774  1f901b4:	84 c0                	test   %al,%al
0776  1f901b6:	0f 85 1e 06 00 00    	jne    1f907da <netlink_dump+0xd9a>
077c  1f901bc:	48 89 f0             	mov    %rsi,%rax
077f  1f901bf:	44 8b 4c 24 08       	mov    0x8(%rsp),%r9d
0784  1f901c4:	66 c7 46 04 03 00    	movw   $0x3,0x4(%rsi)
078a  1f901ca:	48 c1 e8 03          	shr    $0x3,%rax
078e  1f901ce:	48 89 44 24 70       	mov    %rax,0x70(%rsp)
0793  1f901d3:	42 8a 04 20          	mov    (%rax,%r12,1),%al
0797  1f901d7:	44 89 cb             	mov    %r9d,%ebx
079a  1f901da:	83 cb 02             	or     $0x2,%ebx
079d  1f901dd:	84 c0                	test   %al,%al
079f  1f901df:	0f 85 12 06 00 00    	jne    1f907f7 <netlink_dump+0xdb7>
07a5  1f901e5:	4c 8d 46 06          	lea    0x6(%rsi),%r8
07a9  1f901e9:	c7 06 14 00 00 00    	movl   $0x14,(%rsi)
07af  1f901ef:	4c 89 c0             	mov    %r8,%rax
07b2  1f901f2:	48 c1 e8 03          	shr    $0x3,%rax
07b6  1f901f6:	48 89 44 24 58       	mov    %rax,0x58(%rsp)
07bb  1f901fb:	42 8a 04 20          	mov    (%rax,%r12,1),%al
07bf  1f901ff:	84 c0                	test   %al,%al
07c1  1f90201:	0f 85 16 06 00 00    	jne    1f9081d <netlink_dump+0xddd>
07c7  1f90207:	48 8d 7e 0c          	lea    0xc(%rsi),%rdi
07cb  1f9020b:	66 89 5e 06          	mov    %bx,0x6(%rsi)
07cf  1f9020f:	48 89 f8             	mov    %rdi,%rax
07d2  1f90212:	48 c1 e8 03          	shr    $0x3,%rax
07d6  1f90216:	42 8a 04 20          	mov    (%rax,%r12,1),%al
07da  1f9021a:	84 c0                	test   %al,%al
07dc  1f9021c:	0f 85 2b 06 00 00    	jne    1f9084d <netlink_dump+0xe0d>
07e2  1f90222:	48 8d 7e 08          	lea    0x8(%rsi),%rdi
07e6  1f90226:	89 6e 0c             	mov    %ebp,0xc(%rsi)
07e9  1f90229:	48 89 f8             	mov    %rdi,%rax
07ec  1f9022c:	48 c1 e8 03          	shr    $0x3,%rax
07f0  1f90230:	42 8a 04 20          	mov    (%rax,%r12,1),%al
07f4  1f90234:	84 c0                	test   %al,%al
07f6  1f90236:	0f 85 3a 06 00 00    	jne    1f90876 <netlink_dump+0xe36>
07fc  1f9023c:	48 8b 6c 24 28       	mov    0x28(%rsp),%rbp
0801  1f90241:	48 85 f6             	test   %rsi,%rsi
0804  1f90244:	44 89 7e 08          	mov    %r15d,0x8(%rsi)
0808  1f90248:	0f 84 e3 02 00 00    	je     1f90531 <netlink_dump+0xaf1>
080e  1f9024e:	48 8d 55 40          	lea    0x40(%rbp),%rdx
0812  1f90252:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
0817  1f90257:	49 89 d7             	mov    %rdx,%r15
081a  1f9025a:	49 c1 ef 03          	shr    $0x3,%r15
081e  1f9025e:	43 8a 04 27          	mov    (%r15,%r12,1),%al
0822  1f90262:	84 c0                	test   %al,%al
0824  1f90264:	0f 85 35 06 00 00    	jne    1f9089f <netlink_dump+0xe5f>
082a  1f9026a:	8b 1a                	mov    (%rdx),%ebx
082c  1f9026c:	85 db                	test   %ebx,%ebx
082e  1f9026e:	74 4c                	je     1f902bc <netlink_dump+0x87c>
0830  1f90270:	48 83 c5 44          	add    $0x44,%rbp
0834  1f90274:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
083e  1f9027e:	48 89 e8             	mov    %rbp,%rax
0841  1f90281:	48 c1 e8 03          	shr    $0x3,%rax
0845  1f90285:	8a 04 08             	mov    (%rax,%rcx,1),%al
0848  1f90288:	84 c0                	test   %al,%al
084a  1f9028a:	0f 85 46 07 00 00    	jne    1f909d6 <netlink_dump+0xf96>
0850  1f90290:	39 5d 00             	cmp    %ebx,0x0(%rbp)
0853  1f90293:	48 8b 6c 24 28       	mov    0x28(%rsp),%rbp
0858  1f90298:	74 22                	je     1f902bc <netlink_dump+0x87c>
085a  1f9029a:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
085f  1f9029f:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0869  1f902a9:	41 83 c9 12          	or     $0x12,%r9d
086d  1f902ad:	8a 04 01             	mov    (%rcx,%rax,1),%al
0870  1f902b0:	84 c0                	test   %al,%al
0872  1f902b2:	0f 85 80 07 00 00    	jne    1f90a38 <netlink_dump+0xff8>
0878  1f902b8:	66 45 89 08          	mov    %r9w,(%r8)
087c  1f902bc:	48 83 c5 44          	add    $0x44,%rbp
0880  1f902c0:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
088a  1f902ca:	48 89 e8             	mov    %rbp,%rax
088d  1f902cd:	48 c1 e8 03          	shr    $0x3,%rax
0891  1f902d1:	42 8a 04 20          	mov    (%rax,%r12,1),%al
0895  1f902d5:	84 c0                	test   %al,%al
0897  1f902d7:	0f 85 f9 05 00 00    	jne    1f908d6 <netlink_dump+0xe96>
089d  1f902dd:	43 8a 04 27          	mov    (%r15,%r12,1),%al
08a1  1f902e1:	8b 5d 00             	mov    0x0(%rbp),%ebx
08a4  1f902e4:	84 c0                	test   %al,%al
08a6  1f902e6:	0f 85 20 06 00 00    	jne    1f9090c <netlink_dump+0xecc>
08ac  1f902ec:	48 8b 44 24 60       	mov    0x60(%rsp),%rax
08b1  1f902f1:	89 1a                	mov    %ebx,(%rdx)
08b3  1f902f3:	48 89 f5             	mov    %rsi,%rbp
08b6  1f902f6:	48 83 c5 10          	add    $0x10,%rbp
08ba  1f902fa:	42 8a 04 20          	mov    (%rax,%r12,1),%al
08be  1f902fe:	84 c0                	test   %al,%al
08c0  1f90300:	0f 85 38 06 00 00    	jne    1f9093e <netlink_dump+0xefe>
08c6  1f90306:	48 89 e8             	mov    %rbp,%rax
08c9  1f90309:	8b 1f                	mov    (%rdi),%ebx
08cb  1f9030b:	4c 8d 7d 03          	lea    0x3(%rbp),%r15
08cf  1f9030f:	48 c1 e8 03          	shr    $0x3,%rax
08d3  1f90313:	42 8a 04 20          	mov    (%rax,%r12,1),%al
08d7  1f90317:	84 c0                	test   %al,%al
08d9  1f90319:	0f 85 49 06 00 00    	jne    1f90968 <netlink_dump+0xf28>
08df  1f9031f:	4c 89 f8             	mov    %r15,%rax
08e2  1f90322:	48 c1 e8 03          	shr    $0x3,%rax
08e6  1f90326:	42 8a 04 20          	mov    (%rax,%r12,1),%al
08ea  1f9032a:	84 c0                	test   %al,%al
08ec  1f9032c:	0f 85 5f 06 00 00    	jne    1f90991 <netlink_dump+0xf51>
08f2  1f90332:	48 8d 84 24 88 00 00 00 	lea    0x88(%rsp),%rax
08fa  1f9033a:	89 5d 00             	mov    %ebx,0x0(%rbp)
08fd  1f9033d:	48 c1 e8 03          	shr    $0x3,%rax
0901  1f90341:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
0906  1f90346:	48 89 c3             	mov    %rax,%rbx
0909  1f90349:	74 13                	je     1f9035e <netlink_dump+0x91e>
090b  1f9034b:	48 8d bc 24 88 00 00 00 	lea    0x88(%rsp),%rdi
0913  1f90353:	4c 89 c5             	mov    %r8,%rbp
0916  1f90356:	e8 00 00 00 00       	call   1f9035b <netlink_dump+0x91b>	1f90357: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
091b  1f9035b:	49 89 e8             	mov    %rbp,%r8
091e  1f9035e:	48 83 bc 24 88 00 00 00 00 	cmpq   $0x0,0x88(%rsp)
0927  1f90367:	4c 8b 7c 24 38       	mov    0x38(%rsp),%r15
092c  1f9036c:	48 8b 6c 24 28       	mov    0x28(%rsp),%rbp
0931  1f90371:	0f 84 ce 00 00 00    	je     1f90445 <netlink_dump+0xa05>
0937  1f90377:	49 8d ae 3c 05 00 00 	lea    0x53c(%r14),%rbp
093e  1f9037e:	48 89 e8             	mov    %rbp,%rax
0941  1f90381:	48 c1 e8 03          	shr    $0x3,%rax
0945  1f90385:	42 8a 04 20          	mov    (%rax,%r12,1),%al
0949  1f90389:	84 c0                	test   %al,%al
094b  1f9038b:	0f 85 80 06 00 00    	jne    1f90a11 <netlink_dump+0xfd1>
0951  1f90391:	f6 45 00 40          	testb  $0x40,0x0(%rbp)
0955  1f90395:	48 8b 6c 24 28       	mov    0x28(%rsp),%rbp
095a  1f9039a:	0f 84 a5 00 00 00    	je     1f90445 <netlink_dump+0xa05>
0960  1f903a0:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
0965  1f903a5:	42 8a 04 20          	mov    (%rax,%r12,1),%al
0969  1f903a9:	84 c0                	test   %al,%al
096b  1f903ab:	0f 85 c3 06 00 00    	jne    1f90a74 <netlink_dump+0x1034>
0971  1f903b1:	41 80 48 01 02       	orb    $0x2,0x1(%r8)
0976  1f903b6:	42 80 3c 23 00       	cmpb   $0x0,(%rbx,%r12,1)
097b  1f903bb:	74 0d                	je     1f903ca <netlink_dump+0x98a>
097d  1f903bd:	48 8d bc 24 88 00 00 00 	lea    0x88(%rsp),%rdi
0985  1f903c5:	e8 00 00 00 00       	call   1f903ca <netlink_dump+0x98a>	1f903c6: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
098a  1f903ca:	48 8b 9c 24 88 00 00 00 	mov    0x88(%rsp),%rbx
0992  1f903d2:	48 89 df             	mov    %rbx,%rdi
0995  1f903d5:	e8 00 00 00 00       	call   1f903da <netlink_dump+0x99a>	1f903d6: R_X86_64_PLT32	strlen-0x4
099a  1f903da:	8d 50 01             	lea    0x1(%rax),%edx
099d  1f903dd:	4c 89 ef             	mov    %r13,%rdi
09a0  1f903e0:	be 01 00 00 00       	mov    $0x1,%esi
09a5  1f903e5:	48 89 d9             	mov    %rbx,%rcx
09a8  1f903e8:	e8 00 00 00 00       	call   1f903ed <netlink_dump+0x9ad>	1f903e9: R_X86_64_PLT32	nla_put-0x4
09ad  1f903ed:	48 8b 3c 24          	mov    (%rsp),%rdi
09b1  1f903f1:	85 c0                	test   %eax,%eax
09b3  1f903f3:	75 50                	jne    1f90445 <netlink_dump+0xa05>
09b5  1f903f5:	48 8b 44 24 78       	mov    0x78(%rsp),%rax
09ba  1f903fa:	48 8b 9c 24 80 00 00 00 	mov    0x80(%rsp),%rbx
09c2  1f90402:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
09c7  1f90407:	74 0c                	je     1f90415 <netlink_dump+0x9d5>
09c9  1f90409:	48 89 df             	mov    %rbx,%rdi
09cc  1f9040c:	e8 00 00 00 00       	call   1f90411 <netlink_dump+0x9d1>	1f9040d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
09d1  1f90411:	48 8b 3c 24          	mov    (%rsp),%rdi
09d5  1f90415:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
09da  1f9041a:	48 8b 1b             	mov    (%rbx),%rbx
09dd  1f9041d:	42 8a 04 20          	mov    (%rax,%r12,1),%al
09e1  1f90421:	84 c0                	test   %al,%al
09e3  1f90423:	0f 85 72 06 00 00    	jne    1f90a9b <netlink_dump+0x105b>
09e9  1f90429:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
09ee  1f9042e:	03 18                	add    (%rax),%ebx
09f0  1f90430:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
09f5  1f90435:	42 8a 04 20          	mov    (%rax,%r12,1),%al
09f9  1f90439:	29 fb                	sub    %edi,%ebx
09fb  1f9043b:	84 c0                	test   %al,%al
09fd  1f9043d:	0f 85 7e 06 00 00    	jne    1f90ac1 <netlink_dump+0x1081>
0a03  1f90443:	89 1f                	mov    %ebx,(%rdi)
0a05  1f90445:	4c 89 f7             	mov    %r14,%rdi
0a08  1f90448:	4c 89 ee             	mov    %r13,%rsi
0a0b  1f9044b:	ba 01 00 00 00       	mov    $0x1,%edx
0a10  1f90450:	e8 00 00 00 00       	call   1f90455 <netlink_dump+0xa15>	1f90451: R_X86_64_PLT32	sk_filter_trim_cap-0x4
0a15  1f90455:	85 c0                	test   %eax,%eax
0a17  1f90457:	74 0a                	je     1f90463 <netlink_dump+0xa23>
0a19  1f90459:	4c 89 ef             	mov    %r13,%rdi
0a1c  1f9045c:	e8 00 00 00 00       	call   1f90461 <netlink_dump+0xa21>	1f9045d: R_X86_64_PLT32	kfree_skb-0x4
0a21  1f90461:	eb 0b                	jmp    1f9046e <netlink_dump+0xa2e>
0a23  1f90463:	4c 89 f7             	mov    %r14,%rdi
0a26  1f90466:	4c 89 ee             	mov    %r13,%rsi
0a29  1f90469:	e8 72 b0 ff ff       	call   1f8b4e0 <__netlink_sendskb>
0a2e  1f9046e:	49 8d 9e d8 05 00 00 	lea    0x5d8(%r14),%rbx
0a35  1f90475:	48 89 d8             	mov    %rbx,%rax
0a38  1f90478:	48 c1 e8 03          	shr    $0x3,%rax
0a3c  1f9047c:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
0a41  1f90481:	74 08                	je     1f9048b <netlink_dump+0xa4b>
0a43  1f90483:	48 89 df             	mov    %rbx,%rdi
0a46  1f90486:	e8 00 00 00 00       	call   1f9048b <netlink_dump+0xa4b>	1f90487: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0a4b  1f9048b:	4c 8b 1b             	mov    (%rbx),%r11
0a4e  1f9048e:	4d 85 db             	test   %r11,%r11
0a51  1f90491:	74 08                	je     1f9049b <netlink_dump+0xa5b>
0a53  1f90493:	48 89 ef             	mov    %rbp,%rdi
0a56  1f90496:	e8 00 00 00 00       	call   1f9049b <netlink_dump+0xa5b>	1f90497: R_X86_64_PLT32	__x86_indirect_thunk_r11-0x4
0a5b  1f9049b:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
0a60  1f904a0:	42 8a 04 20          	mov    (%rax,%r12,1),%al
0a64  1f904a4:	84 c0                	test   %al,%al
0a66  1f904a6:	0f 85 0b 05 00 00    	jne    1f909b7 <netlink_dump+0xf77>
0a6c  1f904ac:	41 c6 86 b9 05 00 00 00 	movb   $0x0,0x5b9(%r14)
0a74  1f904b4:	49 81 c6 e8 05 00 00 	add    $0x5e8,%r14
0a7b  1f904bb:	4c 89 f0             	mov    %r14,%rax
0a7e  1f904be:	48 c1 e8 03          	shr    $0x3,%rax
0a82  1f904c2:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
0a87  1f904c7:	74 08                	je     1f904d1 <netlink_dump+0xa91>
0a89  1f904c9:	4c 89 f7             	mov    %r14,%rdi
0a8c  1f904cc:	e8 00 00 00 00       	call   1f904d1 <netlink_dump+0xa91>	1f904cd: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0a91  1f904d1:	48 8b 44 24 48       	mov    0x48(%rsp),%rax
0a96  1f904d6:	49 8b 1e             	mov    (%r14),%rbx
0a99  1f904d9:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
0a9e  1f904de:	74 08                	je     1f904e8 <netlink_dump+0xaa8>
0aa0  1f904e0:	48 89 ef             	mov    %rbp,%rdi
0aa3  1f904e3:	e8 00 00 00 00       	call   1f904e8 <netlink_dump+0xaa8>	1f904e4: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0aa8  1f904e8:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
0aad  1f904ed:	48 8b 6d 00          	mov    0x0(%rbp),%rbp
0ab1  1f904f1:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
0ab6  1f904f6:	74 08                	je     1f90500 <netlink_dump+0xac0>
0ab8  1f904f8:	4c 89 ff             	mov    %r15,%rdi
0abb  1f904fb:	e8 00 00 00 00       	call   1f90500 <netlink_dump+0xac0>	1f904fc: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0ac0  1f90500:	49 8b 3f             	mov    (%r15),%rdi
0ac3  1f90503:	e8 00 00 00 00       	call   1f90508 <netlink_dump+0xac8>	1f90504: R_X86_64_PLT32	mutex_unlock-0x4
0ac8  1f90508:	48 89 df             	mov    %rbx,%rdi
0acb  1f9050b:	e8 00 00 00 00       	call   1f90510 <netlink_dump+0xad0>	1f9050c: R_X86_64_PLT32	module_put-0x4
0ad0  1f90510:	48 89 ef             	mov    %rbp,%rdi
0ad3  1f90513:	e8 00 00 00 00       	call   1f90518 <netlink_dump+0xad8>	1f90514: R_X86_64_PLT32	consume_skb-0x4
0ad8  1f90518:	31 ed                	xor    %ebp,%ebp
0ada  1f9051a:	e9 e1 f5 ff ff       	jmp    1f8fb00 <netlink_dump+0xc0>
0adf  1f9051f:	0f 0b                	ud2
0ae1  1f90521:	42 80 3c 3b 00       	cmpb   $0x0,(%rbx,%r15,1)
0ae6  1f90526:	0f 85 b8 f8 ff ff    	jne    1f8fde4 <netlink_dump+0x3a4>
0aec  1f9052c:	e9 bb f8 ff ff       	jmp    1f8fdec <netlink_dump+0x3ac>
0af1  1f90531:	0f 0b                	ud2
0af3  1f90533:	4d 89 ee             	mov    %r13,%r14
0af6  1f90536:	4c 8b 6c 24 38       	mov    0x38(%rsp),%r13
0afb  1f9053b:	e9 2e fb ff ff       	jmp    1f9006e <netlink_dump+0x62e>
0b00  1f90540:	89 d9                	mov    %ebx,%ecx
0b02  1f90542:	80 e1 07             	and    $0x7,%cl
0b05  1f90545:	80 c1 03             	add    $0x3,%cl
0b08  1f90548:	38 c1                	cmp    %al,%cl
0b0a  1f9054a:	0f 8c 51 f6 ff ff    	jl     1f8fba1 <netlink_dump+0x161>
0b10  1f90550:	48 89 df             	mov    %rbx,%rdi
0b13  1f90553:	e8 00 00 00 00       	call   1f90558 <netlink_dump+0xb18>	1f90554: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0b18  1f90558:	e9 44 f6 ff ff       	jmp    1f8fba1 <netlink_dump+0x161>
0b1d  1f9055d:	89 e9                	mov    %ebp,%ecx
0b1f  1f9055f:	80 e1 07             	and    $0x7,%cl
0b22  1f90562:	80 c1 03             	add    $0x3,%cl
0b25  1f90565:	38 c1                	cmp    %al,%cl
0b27  1f90567:	0f 8c 55 f6 ff ff    	jl     1f8fbc2 <netlink_dump+0x182>
0b2d  1f9056d:	48 89 ef             	mov    %rbp,%rdi
0b30  1f90570:	e8 00 00 00 00       	call   1f90575 <netlink_dump+0xb35>	1f90571: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0b35  1f90575:	e9 48 f6 ff ff       	jmp    1f8fbc2 <netlink_dump+0x182>
0b3a  1f9057a:	89 f9                	mov    %edi,%ecx
0b3c  1f9057c:	80 e1 07             	and    $0x7,%cl
0b3f  1f9057f:	80 c1 03             	add    $0x3,%cl
0b42  1f90582:	38 c1                	cmp    %al,%cl
0b44  1f90584:	0f 8c 61 f6 ff ff    	jl     1f8fbeb <netlink_dump+0x1ab>
0b4a  1f9058a:	e8 00 00 00 00       	call   1f9058f <netlink_dump+0xb4f>	1f9058b: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0b4f  1f9058f:	e9 57 f6 ff ff       	jmp    1f8fbeb <netlink_dump+0x1ab>
0b54  1f90594:	89 d9                	mov    %ebx,%ecx
0b56  1f90596:	80 e1 07             	and    $0x7,%cl
0b59  1f90599:	80 c1 03             	add    $0x3,%cl
0b5c  1f9059c:	38 c1                	cmp    %al,%cl
0b5e  1f9059e:	0f 8c df f6 ff ff    	jl     1f8fc83 <netlink_dump+0x243>
0b64  1f905a4:	48 89 df             	mov    %rbx,%rdi
0b67  1f905a7:	e8 00 00 00 00       	call   1f905ac <netlink_dump+0xb6c>	1f905a8: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0b6c  1f905ac:	e9 d2 f6 ff ff       	jmp    1f8fc83 <netlink_dump+0x243>
0b71  1f905b1:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
0b76  1f905b6:	80 e1 07             	and    $0x7,%cl
0b79  1f905b9:	80 c1 03             	add    $0x3,%cl
0b7c  1f905bc:	38 c1                	cmp    %al,%cl
0b7e  1f905be:	0f 8c 78 f7 ff ff    	jl     1f8fd3c <netlink_dump+0x2fc>
0b84  1f905c4:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
0b89  1f905c9:	e8 00 00 00 00       	call   1f905ce <netlink_dump+0xb8e>	1f905ca: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0b8e  1f905ce:	e9 69 f7 ff ff       	jmp    1f8fd3c <netlink_dump+0x2fc>
0b93  1f905d3:	89 f9                	mov    %edi,%ecx
0b95  1f905d5:	80 e1 07             	and    $0x7,%cl
0b98  1f905d8:	fe c1                	inc    %cl
0b9a  1f905da:	38 c1                	cmp    %al,%cl
0b9c  1f905dc:	0f 8c a4 f7 ff ff    	jl     1f8fd86 <netlink_dump+0x346>
0ba2  1f905e2:	e8 00 00 00 00       	call   1f905e7 <netlink_dump+0xba7>	1f905e3: R_X86_64_PLT32	__asan_report_store2_noabort-0x4
0ba7  1f905e7:	e9 9a f7 ff ff       	jmp    1f8fd86 <netlink_dump+0x346>
0bac  1f905ec:	89 f9                	mov    %edi,%ecx
0bae  1f905ee:	80 e1 07             	and    $0x7,%cl
0bb1  1f905f1:	fe c1                	inc    %cl
0bb3  1f905f3:	38 c1                	cmp    %al,%cl
0bb5  1f905f5:	0f 8c b5 f7 ff ff    	jl     1f8fdb0 <netlink_dump+0x370>
0bbb  1f905fb:	e8 00 00 00 00       	call   1f90600 <netlink_dump+0xbc0>	1f905fc: R_X86_64_PLT32	__asan_report_store2_noabort-0x4
0bc0  1f90600:	e9 ab f7 ff ff       	jmp    1f8fdb0 <netlink_dump+0x370>
0bc5  1f90605:	44 89 f9             	mov    %r15d,%ecx
0bc8  1f90608:	80 e1 07             	and    $0x7,%cl
0bcb  1f9060b:	80 c1 03             	add    $0x3,%cl
0bce  1f9060e:	38 c1                	cmp    %al,%cl
0bd0  1f90610:	0f 8c 1d f8 ff ff    	jl     1f8fe33 <netlink_dump+0x3f3>
0bd6  1f90616:	4c 89 ff             	mov    %r15,%rdi
0bd9  1f90619:	e8 00 00 00 00       	call   1f9061e <netlink_dump+0xbde>	1f9061a: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0bde  1f9061e:	e9 10 f8 ff ff       	jmp    1f8fe33 <netlink_dump+0x3f3>
0be3  1f90623:	89 d1                	mov    %edx,%ecx
0be5  1f90625:	80 e1 07             	and    $0x7,%cl
0be8  1f90628:	80 c1 03             	add    $0x3,%cl
0beb  1f9062b:	38 c1                	cmp    %al,%cl
0bed  1f9062d:	0f 8c c8 f8 ff ff    	jl     1f8fefb <netlink_dump+0x4bb>
0bf3  1f90633:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
0bf8  1f90638:	e8 00 00 00 00       	call   1f9063d <netlink_dump+0xbfd>	1f90639: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0bfd  1f9063d:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
0c02  1f90642:	e9 b4 f8 ff ff       	jmp    1f8fefb <netlink_dump+0x4bb>
0c07  1f90647:	44 89 f9             	mov    %r15d,%ecx
0c0a  1f9064a:	80 e1 07             	and    $0x7,%cl
0c0d  1f9064d:	80 c1 03             	add    $0x3,%cl
0c10  1f90650:	38 c1                	cmp    %al,%cl
0c12  1f90652:	0f 8c 55 f8 ff ff    	jl     1f8fead <netlink_dump+0x46d>
0c18  1f90658:	4c 89 ff             	mov    %r15,%rdi
0c1b  1f9065b:	e8 00 00 00 00       	call   1f90660 <netlink_dump+0xc20>	1f9065c: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0c20  1f90660:	e9 48 f8 ff ff       	jmp    1f8fead <netlink_dump+0x46d>
0c25  1f90665:	89 e9                	mov    %ebp,%ecx
0c27  1f90667:	80 e1 07             	and    $0x7,%cl
0c2a  1f9066a:	80 c1 03             	add    $0x3,%cl
0c2d  1f9066d:	38 c1                	cmp    %al,%cl
0c2f  1f9066f:	0f 8c 55 f8 ff ff    	jl     1f8feca <netlink_dump+0x48a>
0c35  1f90675:	48 89 ef             	mov    %rbp,%rdi
0c38  1f90678:	e8 00 00 00 00       	call   1f9067d <netlink_dump+0xc3d>	1f90679: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0c3d  1f9067d:	e9 48 f8 ff ff       	jmp    1f8feca <netlink_dump+0x48a>
0c42  1f90682:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
0c47  1f90687:	80 e1 07             	and    $0x7,%cl
0c4a  1f9068a:	80 c1 03             	add    $0x3,%cl
0c4d  1f9068d:	38 c1                	cmp    %al,%cl
0c4f  1f9068f:	0f 8c fa f8 ff ff    	jl     1f8ff8f <netlink_dump+0x54f>
0c55  1f90695:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
0c5a  1f9069a:	e8 00 00 00 00       	call   1f9069f <netlink_dump+0xc5f>	1f9069b: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
0c5f  1f9069f:	e9 eb f8 ff ff       	jmp    1f8ff8f <netlink_dump+0x54f>
0c64  1f906a4:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
0c69  1f906a9:	80 e1 07             	and    $0x7,%cl
0c6c  1f906ac:	80 c1 03             	add    $0x3,%cl
0c6f  1f906af:	38 c1                	cmp    %al,%cl
0c71  1f906b1:	0f 8c 1a f9 ff ff    	jl     1f8ffd1 <netlink_dump+0x591>
0c77  1f906b7:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
0c7c  1f906bc:	e8 00 00 00 00       	call   1f906c1 <netlink_dump+0xc81>	1f906bd: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0c81  1f906c1:	e9 0b f9 ff ff       	jmp    1f8ffd1 <netlink_dump+0x591>
0c86  1f906c6:	89 f9                	mov    %edi,%ecx
0c88  1f906c8:	80 e1 07             	and    $0x7,%cl
0c8b  1f906cb:	80 c1 03             	add    $0x3,%cl
0c8e  1f906ce:	38 c1                	cmp    %al,%cl
0c90  1f906d0:	0f 8c dd f5 ff ff    	jl     1f8fcb3 <netlink_dump+0x273>
0c96  1f906d6:	e8 00 00 00 00       	call   1f906db <netlink_dump+0xc9b>	1f906d7: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0c9b  1f906db:	e9 d3 f5 ff ff       	jmp    1f8fcb3 <netlink_dump+0x273>
0ca0  1f906e0:	89 e9                	mov    %ebp,%ecx
0ca2  1f906e2:	80 e1 07             	and    $0x7,%cl
0ca5  1f906e5:	80 c1 03             	add    $0x3,%cl
0ca8  1f906e8:	38 c1                	cmp    %al,%cl
0caa  1f906ea:	0f 8c e3 f5 ff ff    	jl     1f8fcd3 <netlink_dump+0x293>
0cb0  1f906f0:	48 89 ef             	mov    %rbp,%rdi
0cb3  1f906f3:	e8 00 00 00 00       	call   1f906f8 <netlink_dump+0xcb8>	1f906f4: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0cb8  1f906f8:	e9 d6 f5 ff ff       	jmp    1f8fcd3 <netlink_dump+0x293>
0cbd  1f906fd:	44 89 f9             	mov    %r15d,%ecx
0cc0  1f90700:	80 e1 07             	and    $0x7,%cl
0cc3  1f90703:	80 c1 03             	add    $0x3,%cl
0cc6  1f90706:	38 c1                	cmp    %al,%cl
0cc8  1f90708:	0f 8c ec f8 ff ff    	jl     1f8fffa <netlink_dump+0x5ba>
0cce  1f9070e:	4c 89 ff             	mov    %r15,%rdi
0cd1  1f90711:	e8 00 00 00 00       	call   1f90716 <netlink_dump+0xcd6>	1f90712: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0cd6  1f90716:	e9 df f8 ff ff       	jmp    1f8fffa <netlink_dump+0x5ba>
0cdb  1f9071b:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
0ce0  1f90720:	80 e1 07             	and    $0x7,%cl
0ce3  1f90723:	80 c1 03             	add    $0x3,%cl
0ce6  1f90726:	38 c1                	cmp    %al,%cl
0ce8  1f90728:	0f 8c e0 f8 ff ff    	jl     1f9000e <netlink_dump+0x5ce>
0cee  1f9072e:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
0cf3  1f90733:	e8 00 00 00 00       	call   1f90738 <netlink_dump+0xcf8>	1f90734: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0cf8  1f90738:	e9 d1 f8 ff ff       	jmp    1f9000e <netlink_dump+0x5ce>
0cfd  1f9073d:	89 f9                	mov    %edi,%ecx
0cff  1f9073f:	80 e1 07             	and    $0x7,%cl
0d02  1f90742:	fe c1                	inc    %cl
0d04  1f90744:	38 c1                	cmp    %al,%cl
0d06  1f90746:	0f 8c 98 f9 ff ff    	jl     1f900e4 <netlink_dump+0x6a4>
0d0c  1f9074c:	e8 00 00 00 00       	call   1f90751 <netlink_dump+0xd11>	1f9074d: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
0d11  1f90751:	e9 8e f9 ff ff       	jmp    1f900e4 <netlink_dump+0x6a4>
0d16  1f90756:	44 89 f9             	mov    %r15d,%ecx
0d19  1f90759:	80 e1 07             	and    $0x7,%cl
0d1c  1f9075c:	80 c1 03             	add    $0x3,%cl
0d1f  1f9075f:	38 c1                	cmp    %al,%cl
0d21  1f90761:	0f 8c 8d f9 ff ff    	jl     1f900f4 <netlink_dump+0x6b4>
0d27  1f90767:	4c 89 ff             	mov    %r15,%rdi
0d2a  1f9076a:	89 d3                	mov    %edx,%ebx
0d2c  1f9076c:	e8 00 00 00 00       	call   1f90771 <netlink_dump+0xd31>	1f9076d: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0d31  1f90771:	89 da                	mov    %ebx,%edx
0d33  1f90773:	e9 7c f9 ff ff       	jmp    1f900f4 <netlink_dump+0x6b4>
0d38  1f90778:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
0d3d  1f9077d:	80 e1 07             	and    $0x7,%cl
0d40  1f90780:	80 c1 03             	add    $0x3,%cl
0d43  1f90783:	38 c1                	cmp    %al,%cl
0d45  1f90785:	0f 8c 7d f9 ff ff    	jl     1f90108 <netlink_dump+0x6c8>
0d4b  1f9078b:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
0d50  1f90790:	41 89 d7             	mov    %edx,%r15d
0d53  1f90793:	e8 00 00 00 00       	call   1f90798 <netlink_dump+0xd58>	1f90794: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0d58  1f90798:	44 89 fa             	mov    %r15d,%edx
0d5b  1f9079b:	e9 68 f9 ff ff       	jmp    1f90108 <netlink_dump+0x6c8>
0d60  1f907a0:	89 e9                	mov    %ebp,%ecx
0d62  1f907a2:	80 e1 07             	and    $0x7,%cl
0d65  1f907a5:	80 c1 03             	add    $0x3,%cl
0d68  1f907a8:	38 c1                	cmp    %al,%cl
0d6a  1f907aa:	0f 8c a0 f9 ff ff    	jl     1f90150 <netlink_dump+0x710>
0d70  1f907b0:	48 89 ef             	mov    %rbp,%rdi
0d73  1f907b3:	e8 00 00 00 00       	call   1f907b8 <netlink_dump+0xd78>	1f907b4: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0d78  1f907b8:	e9 93 f9 ff ff       	jmp    1f90150 <netlink_dump+0x710>
0d7d  1f907bd:	89 e9                	mov    %ebp,%ecx
0d7f  1f907bf:	80 e1 07             	and    $0x7,%cl
0d82  1f907c2:	80 c1 03             	add    $0x3,%cl
0d85  1f907c5:	38 c1                	cmp    %al,%cl
0d87  1f907c7:	0f 8c c1 f9 ff ff    	jl     1f9018e <netlink_dump+0x74e>
0d8d  1f907cd:	48 89 ef             	mov    %rbp,%rdi
0d90  1f907d0:	e8 00 00 00 00       	call   1f907d5 <netlink_dump+0xd95>	1f907d1: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0d95  1f907d5:	e9 b4 f9 ff ff       	jmp    1f9018e <netlink_dump+0x74e>
0d9a  1f907da:	89 f9                	mov    %edi,%ecx
0d9c  1f907dc:	80 e1 07             	and    $0x7,%cl
0d9f  1f907df:	fe c1                	inc    %cl
0da1  1f907e1:	38 c1                	cmp    %al,%cl
0da3  1f907e3:	0f 8c d3 f9 ff ff    	jl     1f901bc <netlink_dump+0x77c>
0da9  1f907e9:	e8 00 00 00 00       	call   1f907ee <netlink_dump+0xdae>	1f907ea: R_X86_64_PLT32	__asan_report_store2_noabort-0x4
0dae  1f907ee:	48 8b 34 24          	mov    (%rsp),%rsi
0db2  1f907f2:	e9 c5 f9 ff ff       	jmp    1f901bc <netlink_dump+0x77c>
0db7  1f907f7:	89 f1                	mov    %esi,%ecx
0db9  1f907f9:	80 e1 07             	and    $0x7,%cl
0dbc  1f907fc:	80 c1 03             	add    $0x3,%cl
0dbf  1f907ff:	38 c1                	cmp    %al,%cl
0dc1  1f90801:	0f 8c de f9 ff ff    	jl     1f901e5 <netlink_dump+0x7a5>
0dc7  1f90807:	48 89 f7             	mov    %rsi,%rdi
0dca  1f9080a:	e8 00 00 00 00       	call   1f9080f <netlink_dump+0xdcf>	1f9080b: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
0dcf  1f9080f:	44 8b 4c 24 08       	mov    0x8(%rsp),%r9d
0dd4  1f90814:	48 8b 34 24          	mov    (%rsp),%rsi
0dd8  1f90818:	e9 c8 f9 ff ff       	jmp    1f901e5 <netlink_dump+0x7a5>
0ddd  1f9081d:	44 89 c1             	mov    %r8d,%ecx
0de0  1f90820:	80 e1 07             	and    $0x7,%cl
0de3  1f90823:	fe c1                	inc    %cl
0de5  1f90825:	38 c1                	cmp    %al,%cl
0de7  1f90827:	0f 8c da f9 ff ff    	jl     1f90207 <netlink_dump+0x7c7>
0ded  1f9082d:	4c 89 c7             	mov    %r8,%rdi
0df0  1f90830:	4c 89 44 24 18       	mov    %r8,0x18(%rsp)
0df5  1f90835:	e8 00 00 00 00       	call   1f9083a <netlink_dump+0xdfa>	1f90836: R_X86_64_PLT32	__asan_report_store2_noabort-0x4
0dfa  1f9083a:	4c 8b 44 24 18       	mov    0x18(%rsp),%r8
0dff  1f9083f:	44 8b 4c 24 08       	mov    0x8(%rsp),%r9d
0e04  1f90844:	48 8b 34 24          	mov    (%rsp),%rsi
0e08  1f90848:	e9 ba f9 ff ff       	jmp    1f90207 <netlink_dump+0x7c7>
0e0d  1f9084d:	89 f9                	mov    %edi,%ecx
0e0f  1f9084f:	80 e1 07             	and    $0x7,%cl
0e12  1f90852:	80 c1 03             	add    $0x3,%cl
0e15  1f90855:	38 c1                	cmp    %al,%cl
0e17  1f90857:	0f 8c c5 f9 ff ff    	jl     1f90222 <netlink_dump+0x7e2>
0e1d  1f9085d:	4c 89 c3             	mov    %r8,%rbx
0e20  1f90860:	e8 00 00 00 00       	call   1f90865 <netlink_dump+0xe25>	1f90861: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
0e25  1f90865:	44 8b 4c 24 08       	mov    0x8(%rsp),%r9d
0e2a  1f9086a:	48 8b 34 24          	mov    (%rsp),%rsi
0e2e  1f9086e:	49 89 d8             	mov    %rbx,%r8
0e31  1f90871:	e9 ac f9 ff ff       	jmp    1f90222 <netlink_dump+0x7e2>
0e36  1f90876:	89 f9                	mov    %edi,%ecx
0e38  1f90878:	80 e1 07             	and    $0x7,%cl
0e3b  1f9087b:	80 c1 03             	add    $0x3,%cl
0e3e  1f9087e:	38 c1                	cmp    %al,%cl
0e40  1f90880:	0f 8c b6 f9 ff ff    	jl     1f9023c <netlink_dump+0x7fc>
0e46  1f90886:	4c 89 c3             	mov    %r8,%rbx
0e49  1f90889:	e8 00 00 00 00       	call   1f9088e <netlink_dump+0xe4e>	1f9088a: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
0e4e  1f9088e:	44 8b 4c 24 08       	mov    0x8(%rsp),%r9d
0e53  1f90893:	48 8b 34 24          	mov    (%rsp),%rsi
0e57  1f90897:	49 89 d8             	mov    %rbx,%r8
0e5a  1f9089a:	e9 9d f9 ff ff       	jmp    1f9023c <netlink_dump+0x7fc>
0e5f  1f9089f:	89 d1                	mov    %edx,%ecx
0e61  1f908a1:	80 e1 07             	and    $0x7,%cl
0e64  1f908a4:	80 c1 03             	add    $0x3,%cl
0e67  1f908a7:	38 c1                	cmp    %al,%cl
0e69  1f908a9:	0f 8c bb f9 ff ff    	jl     1f9026a <netlink_dump+0x82a>
0e6f  1f908af:	48 89 d7             	mov    %rdx,%rdi
0e72  1f908b2:	4d 89 c4             	mov    %r8,%r12
0e75  1f908b5:	48 89 d3             	mov    %rdx,%rbx
0e78  1f908b8:	e8 00 00 00 00       	call   1f908bd <netlink_dump+0xe7d>	1f908b9: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0e7d  1f908bd:	44 8b 4c 24 08       	mov    0x8(%rsp),%r9d
0e82  1f908c2:	48 8b 34 24          	mov    (%rsp),%rsi
0e86  1f908c6:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
0e8b  1f908cb:	48 89 da             	mov    %rbx,%rdx
0e8e  1f908ce:	4d 89 e0             	mov    %r12,%r8
0e91  1f908d1:	e9 94 f9 ff ff       	jmp    1f9026a <netlink_dump+0x82a>
0e96  1f908d6:	89 e9                	mov    %ebp,%ecx
0e98  1f908d8:	80 e1 07             	and    $0x7,%cl
0e9b  1f908db:	80 c1 03             	add    $0x3,%cl
0e9e  1f908de:	38 c1                	cmp    %al,%cl
0ea0  1f908e0:	0f 8c f7 f9 ff ff    	jl     1f902dd <netlink_dump+0x89d>
0ea6  1f908e6:	48 89 ef             	mov    %rbp,%rdi
0ea9  1f908e9:	4c 89 c3             	mov    %r8,%rbx
0eac  1f908ec:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
0eb1  1f908f1:	e8 00 00 00 00       	call   1f908f6 <netlink_dump+0xeb6>	1f908f2: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0eb6  1f908f6:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
0ebb  1f908fb:	48 8b 34 24          	mov    (%rsp),%rsi
0ebf  1f908ff:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
0ec4  1f90904:	49 89 d8             	mov    %rbx,%r8
0ec7  1f90907:	e9 d1 f9 ff ff       	jmp    1f902dd <netlink_dump+0x89d>
0ecc  1f9090c:	89 d1                	mov    %edx,%ecx
0ece  1f9090e:	80 e1 07             	and    $0x7,%cl
0ed1  1f90911:	80 c1 03             	add    $0x3,%cl
0ed4  1f90914:	38 c1                	cmp    %al,%cl
0ed6  1f90916:	0f 8c d0 f9 ff ff    	jl     1f902ec <netlink_dump+0x8ac>
0edc  1f9091c:	48 89 d7             	mov    %rdx,%rdi
0edf  1f9091f:	4c 89 c5             	mov    %r8,%rbp
0ee2  1f90922:	49 89 d7             	mov    %rdx,%r15
0ee5  1f90925:	e8 00 00 00 00       	call   1f9092a <netlink_dump+0xeea>	1f90926: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
0eea  1f9092a:	48 8b 34 24          	mov    (%rsp),%rsi
0eee  1f9092e:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
0ef3  1f90933:	4c 89 fa             	mov    %r15,%rdx
0ef6  1f90936:	49 89 e8             	mov    %rbp,%r8
0ef9  1f90939:	e9 ae f9 ff ff       	jmp    1f902ec <netlink_dump+0x8ac>
0efe  1f9093e:	89 f9                	mov    %edi,%ecx
0f00  1f90940:	80 e1 07             	and    $0x7,%cl
0f03  1f90943:	80 c1 03             	add    $0x3,%cl
0f06  1f90946:	38 c1                	cmp    %al,%cl
0f08  1f90948:	0f 8c b8 f9 ff ff    	jl     1f90306 <netlink_dump+0x8c6>
0f0e  1f9094e:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
0f13  1f90953:	4c 89 c3             	mov    %r8,%rbx
0f16  1f90956:	e8 00 00 00 00       	call   1f9095b <netlink_dump+0xf1b>	1f90957: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0f1b  1f9095b:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
0f20  1f90960:	49 89 d8             	mov    %rbx,%r8
0f23  1f90963:	e9 9e f9 ff ff       	jmp    1f90306 <netlink_dump+0x8c6>
0f28  1f90968:	89 e9                	mov    %ebp,%ecx
0f2a  1f9096a:	80 e1 07             	and    $0x7,%cl
0f2d  1f9096d:	38 c1                	cmp    %al,%cl
0f2f  1f9096f:	0f 8c aa f9 ff ff    	jl     1f9031f <netlink_dump+0x8df>
0f35  1f90975:	be 04 00 00 00       	mov    $0x4,%esi
0f3a  1f9097a:	48 89 ef             	mov    %rbp,%rdi
0f3d  1f9097d:	4c 89 44 24 18       	mov    %r8,0x18(%rsp)
0f42  1f90982:	e8 00 00 00 00       	call   1f90987 <netlink_dump+0xf47>	1f90983: R_X86_64_PLT32	__asan_report_store_n_noabort-0x4
0f47  1f90987:	4c 8b 44 24 18       	mov    0x18(%rsp),%r8
0f4c  1f9098c:	e9 8e f9 ff ff       	jmp    1f9031f <netlink_dump+0x8df>
0f51  1f90991:	44 89 f9             	mov    %r15d,%ecx
0f54  1f90994:	80 e1 07             	and    $0x7,%cl
0f57  1f90997:	38 c1                	cmp    %al,%cl
0f59  1f90999:	0f 8c 93 f9 ff ff    	jl     1f90332 <netlink_dump+0x8f2>
0f5f  1f9099f:	4c 89 ff             	mov    %r15,%rdi
0f62  1f909a2:	be 04 00 00 00       	mov    $0x4,%esi
0f67  1f909a7:	4d 89 c7             	mov    %r8,%r15
0f6a  1f909aa:	e8 00 00 00 00       	call   1f909af <netlink_dump+0xf6f>	1f909ab: R_X86_64_PLT32	__asan_report_store_n_noabort-0x4
0f6f  1f909af:	4d 89 f8             	mov    %r15,%r8
0f72  1f909b2:	e9 7b f9 ff ff       	jmp    1f90332 <netlink_dump+0x8f2>
0f77  1f909b7:	48 8b 4c 24 68       	mov    0x68(%rsp),%rcx
0f7c  1f909bc:	80 e1 07             	and    $0x7,%cl
0f7f  1f909bf:	38 c1                	cmp    %al,%cl
0f81  1f909c1:	0f 8c e5 fa ff ff    	jl     1f904ac <netlink_dump+0xa6c>
0f87  1f909c7:	48 8b 7c 24 68       	mov    0x68(%rsp),%rdi
0f8c  1f909cc:	e8 00 00 00 00       	call   1f909d1 <netlink_dump+0xf91>	1f909cd: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
0f91  1f909d1:	e9 d6 fa ff ff       	jmp    1f904ac <netlink_dump+0xa6c>
0f96  1f909d6:	89 e9                	mov    %ebp,%ecx
0f98  1f909d8:	80 e1 07             	and    $0x7,%cl
0f9b  1f909db:	80 c1 03             	add    $0x3,%cl
0f9e  1f909de:	38 c1                	cmp    %al,%cl
0fa0  1f909e0:	0f 8c aa f8 ff ff    	jl     1f90290 <netlink_dump+0x850>
0fa6  1f909e6:	48 89 ef             	mov    %rbp,%rdi
0fa9  1f909e9:	4c 89 44 24 18       	mov    %r8,0x18(%rsp)
0fae  1f909ee:	49 89 d4             	mov    %rdx,%r12
0fb1  1f909f1:	e8 00 00 00 00       	call   1f909f6 <netlink_dump+0xfb6>	1f909f2: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0fb6  1f909f6:	4c 8b 44 24 18       	mov    0x18(%rsp),%r8
0fbb  1f909fb:	44 8b 4c 24 08       	mov    0x8(%rsp),%r9d
0fc0  1f90a00:	48 8b 34 24          	mov    (%rsp),%rsi
0fc4  1f90a04:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
0fc9  1f90a09:	4c 89 e2             	mov    %r12,%rdx
0fcc  1f90a0c:	e9 7f f8 ff ff       	jmp    1f90290 <netlink_dump+0x850>
0fd1  1f90a11:	89 e9                	mov    %ebp,%ecx
0fd3  1f90a13:	80 e1 07             	and    $0x7,%cl
0fd6  1f90a16:	80 c1 03             	add    $0x3,%cl
0fd9  1f90a19:	38 c1                	cmp    %al,%cl
0fdb  1f90a1b:	0f 8c 70 f9 ff ff    	jl     1f90391 <netlink_dump+0x951>
0fe1  1f90a21:	48 89 ef             	mov    %rbp,%rdi
0fe4  1f90a24:	4c 89 44 24 18       	mov    %r8,0x18(%rsp)
0fe9  1f90a29:	e8 00 00 00 00       	call   1f90a2e <netlink_dump+0xfee>	1f90a2a: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0fee  1f90a2e:	4c 8b 44 24 18       	mov    0x18(%rsp),%r8
0ff3  1f90a33:	e9 59 f9 ff ff       	jmp    1f90391 <netlink_dump+0x951>
0ff8  1f90a38:	44 89 c1             	mov    %r8d,%ecx
0ffb  1f90a3b:	80 e1 07             	and    $0x7,%cl
0ffe  1f90a3e:	fe c1                	inc    %cl
1000  1f90a40:	38 c1                	cmp    %al,%cl
1002  1f90a42:	0f 8c 70 f8 ff ff    	jl     1f902b8 <netlink_dump+0x878>
1008  1f90a48:	4c 89 c7             	mov    %r8,%rdi
100b  1f90a4b:	44 89 cb             	mov    %r9d,%ebx
100e  1f90a4e:	4c 89 44 24 18       	mov    %r8,0x18(%rsp)
1013  1f90a53:	49 89 d4             	mov    %rdx,%r12
1016  1f90a56:	e8 00 00 00 00       	call   1f90a5b <netlink_dump+0x101b>	1f90a57: R_X86_64_PLT32	__asan_report_store2_noabort-0x4
101b  1f90a5b:	4c 8b 44 24 18       	mov    0x18(%rsp),%r8
1020  1f90a60:	48 8b 34 24          	mov    (%rsp),%rsi
1024  1f90a64:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
1029  1f90a69:	4c 89 e2             	mov    %r12,%rdx
102c  1f90a6c:	41 89 d9             	mov    %ebx,%r9d
102f  1f90a6f:	e9 44 f8 ff ff       	jmp    1f902b8 <netlink_dump+0x878>
1034  1f90a74:	44 89 c1             	mov    %r8d,%ecx
1037  1f90a77:	80 e1 07             	and    $0x7,%cl
103a  1f90a7a:	fe c1                	inc    %cl
103c  1f90a7c:	38 c1                	cmp    %al,%cl
103e  1f90a7e:	0f 8c 2d f9 ff ff    	jl     1f903b1 <netlink_dump+0x971>
1044  1f90a84:	4c 89 c7             	mov    %r8,%rdi
1047  1f90a87:	4c 89 44 24 18       	mov    %r8,0x18(%rsp)
104c  1f90a8c:	e8 00 00 00 00       	call   1f90a91 <netlink_dump+0x1051>	1f90a8d: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
1051  1f90a91:	4c 8b 44 24 18       	mov    0x18(%rsp),%r8
1056  1f90a96:	e9 16 f9 ff ff       	jmp    1f903b1 <netlink_dump+0x971>
105b  1f90a9b:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
1060  1f90aa0:	80 e1 07             	and    $0x7,%cl
1063  1f90aa3:	80 c1 03             	add    $0x3,%cl
1066  1f90aa6:	38 c1                	cmp    %al,%cl
1068  1f90aa8:	0f 8c 7b f9 ff ff    	jl     1f90429 <netlink_dump+0x9e9>
106e  1f90aae:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
1073  1f90ab3:	e8 00 00 00 00       	call   1f90ab8 <netlink_dump+0x1078>	1f90ab4: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
1078  1f90ab8:	48 8b 3c 24          	mov    (%rsp),%rdi
107c  1f90abc:	e9 68 f9 ff ff       	jmp    1f90429 <netlink_dump+0x9e9>
1081  1f90ac1:	89 f9                	mov    %edi,%ecx
1083  1f90ac3:	80 e1 07             	and    $0x7,%cl
1086  1f90ac6:	80 c1 03             	add    $0x3,%cl
1089  1f90ac9:	38 c1                	cmp    %al,%cl
108b  1f90acb:	0f 8c 72 f9 ff ff    	jl     1f90443 <netlink_dump+0xa03>
1091  1f90ad1:	e8 00 00 00 00       	call   1f90ad6 <netlink_dump+0x1096>	1f90ad2: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
1096  1f90ad6:	48 8b 3c 24          	mov    (%rsp),%rdi
109a  1f90ada:	e9 64 f9 ff ff       	jmp    1f90443 <netlink_dump+0xa03>
109f  1f90adf:	e8 00 00 00 00       	call   1f90ae4 <netlink_dump+0x10a4>	1f90ae0: R_X86_64_PLT32	__stack_chk_fail-0x4
10a4  1f90ae4:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
10af  1f90aef:	90                   	nop

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

--mK1WX8aRyJytxJjx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=config

#
# Automatically generated file; DO NOT EDIT.
# Linux/x86_64 5.10.112 Kernel Configuration
#
CONFIG_CC_VERSION_TEXT="clang version 14.0.6 (git://gitmirror/llvm_project f28c006a5895fc0e329fe15fead81e37457cb1d1)"
CONFIG_GCC_VERSION=0
CONFIG_LD_VERSION=0
CONFIG_CC_IS_CLANG=y
CONFIG_LD_IS_LLD=y
CONFIG_CLANG_VERSION=140006
CONFIG_LLD_VERSION=140006
CONFIG_CC_CAN_LINK=y
CONFIG_CC_CAN_LINK_STATIC=y
CONFIG_CC_HAS_ASM_GOTO=y
CONFIG_CC_HAS_ASM_GOTO_OUTPUT=y
CONFIG_TOOLS_SUPPORT_RELR=y
CONFIG_CC_HAS_ASM_INLINE=y
CONFIG_CONSTRUCTORS=y
CONFIG_IRQ_WORK=y
CONFIG_BUILDTIME_TABLE_SORT=y
CONFIG_THREAD_INFO_IN_TASK=y

#
# General setup
#
CONFIG_INIT_ENV_ARG_LIMIT=32
# CONFIG_COMPILE_TEST is not set
# CONFIG_UAPI_HEADER_TEST is not set
CONFIG_LOCALVERSION=""
CONFIG_LOCALVERSION_AUTO=y
CONFIG_BUILD_SALT=""
CONFIG_HAVE_KERNEL_GZIP=y
CONFIG_HAVE_KERNEL_BZIP2=y
CONFIG_HAVE_KERNEL_LZMA=y
CONFIG_HAVE_KERNEL_XZ=y
CONFIG_HAVE_KERNEL_LZO=y
CONFIG_HAVE_KERNEL_LZ4=y
CONFIG_HAVE_KERNEL_ZSTD=y
# CONFIG_KERNEL_GZIP is not set
# CONFIG_KERNEL_BZIP2 is not set
# CONFIG_KERNEL_LZMA is not set
# CONFIG_KERNEL_XZ is not set
CONFIG_KERNEL_LZO=y
# CONFIG_KERNEL_LZ4 is not set
# CONFIG_KERNEL_ZSTD is not set
CONFIG_DEFAULT_INIT=""
CONFIG_DEFAULT_HOSTNAME="(none)"
# CONFIG_SWAP is not set
CONFIG_SYSVIPC=y
CONFIG_SYSVIPC_SYSCTL=y
# CONFIG_POSIX_MQUEUE is not set
CONFIG_WATCH_QUEUE=y
CONFIG_CROSS_MEMORY_ATTACH=y
CONFIG_USELIB=y
# CONFIG_AUDIT is not set
CONFIG_HAVE_ARCH_AUDITSYSCALL=y

#
# IRQ subsystem
#
CONFIG_GENERIC_IRQ_PROBE=y
CONFIG_GENERIC_IRQ_SHOW=y
CONFIG_GENERIC_IRQ_EFFECTIVE_AFF_MASK=y
CONFIG_GENERIC_PENDING_IRQ=y
CONFIG_GENERIC_IRQ_MIGRATION=y
CONFIG_HARDIRQS_SW_RESEND=y
CONFIG_IRQ_DOMAIN=y
CONFIG_IRQ_DOMAIN_HIERARCHY=y
CONFIG_GENERIC_IRQ_MATRIX_ALLOCATOR=y
CONFIG_GENERIC_IRQ_RESERVATION_MODE=y
CONFIG_IRQ_FORCED_THREADING=y
CONFIG_SPARSE_IRQ=y
# CONFIG_GENERIC_IRQ_DEBUGFS is not set
# end of IRQ subsystem

CONFIG_CLOCKSOURCE_WATCHDOG=y
CONFIG_ARCH_CLOCKSOURCE_INIT=y
CONFIG_CLOCKSOURCE_VALIDATE_LAST_CYCLE=y
CONFIG_GENERIC_TIME_VSYSCALL=y
CONFIG_GENERIC_CLOCKEVENTS=y
CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=y
CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST=y
CONFIG_GENERIC_CMOS_UPDATE=y
CONFIG_HAVE_POSIX_CPU_TIMERS_TASK_WORK=y
CONFIG_POSIX_CPU_TIMERS_TASK_WORK=y

#
# Timers subsystem
#
CONFIG_HZ_PERIODIC=y
# CONFIG_NO_HZ_IDLE is not set
# CONFIG_NO_HZ_FULL is not set
CONFIG_NO_HZ=y
# CONFIG_HIGH_RES_TIMERS is not set
# end of Timers subsystem

# CONFIG_PREEMPT_NONE is not set
CONFIG_PREEMPT_VOLUNTARY=y
# CONFIG_PREEMPT is not set
CONFIG_PREEMPT_COUNT=y

#
# CPU/Task time and stats accounting
#
CONFIG_TICK_CPU_ACCOUNTING=y
# CONFIG_VIRT_CPU_ACCOUNTING_GEN is not set
# CONFIG_IRQ_TIME_ACCOUNTING is not set
CONFIG_BSD_PROCESS_ACCT=y
CONFIG_BSD_PROCESS_ACCT_V3=y
# CONFIG_TASKSTATS is not set
CONFIG_PSI=y
CONFIG_PSI_DEFAULT_DISABLED=y
# end of CPU/Task time and stats accounting

# CONFIG_CPU_ISOLATION is not set

#
# RCU Subsystem
#
CONFIG_TREE_RCU=y
CONFIG_RCU_EXPERT=y
CONFIG_SRCU=y
CONFIG_TREE_SRCU=y
CONFIG_TASKS_RCU_GENERIC=y
CONFIG_TASKS_RCU=y
CONFIG_TASKS_RUDE_RCU=y
CONFIG_TASKS_TRACE_RCU=y
CONFIG_RCU_STALL_COMMON=y
CONFIG_RCU_NEED_SEGCBLIST=y
CONFIG_RCU_FANOUT=64
CONFIG_RCU_FANOUT_LEAF=16
# CONFIG_RCU_NOCB_CPU is not set
CONFIG_TASKS_TRACE_RCU_READ_MB=y
# end of RCU Subsystem

CONFIG_IKCONFIG=y
CONFIG_IKCONFIG_PROC=y
CONFIG_IKHEADERS=m
CONFIG_LOG_BUF_SHIFT=20
CONFIG_LOG_CPU_MAX_BUF_SHIFT=12
CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=13
CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=y

#
# Scheduler features
#
# end of Scheduler features

CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=y
CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=y
CONFIG_CC_HAS_INT128=y
CONFIG_ARCH_SUPPORTS_INT128=y
# CONFIG_NUMA_BALANCING is not set
CONFIG_CGROUPS=y
# CONFIG_MEMCG is not set
# CONFIG_BLK_CGROUP is not set
# CONFIG_CGROUP_SCHED is not set
CONFIG_CGROUP_PIDS=y
CONFIG_CGROUP_RDMA=y
CONFIG_CGROUP_FREEZER=y
CONFIG_CPUSETS=y
# CONFIG_PROC_PID_CPUSET is not set
CONFIG_CGROUP_DEVICE=y
# CONFIG_CGROUP_CPUACCT is not set
CONFIG_CGROUP_PERF=y
# CONFIG_CGROUP_BPF is not set
CONFIG_CGROUP_DEBUG=y
CONFIG_SOCK_CGROUP_DATA=y
CONFIG_NAMESPACES=y
# CONFIG_UTS_NS is not set
CONFIG_TIME_NS=y
CONFIG_IPC_NS=y
# CONFIG_USER_NS is not set
# CONFIG_PID_NS is not set
# CONFIG_NET_NS is not set
# CONFIG_CHECKPOINT_RESTORE is not set
# CONFIG_SCHED_AUTOGROUP is not set
# CONFIG_SYSFS_DEPRECATED is not set
# CONFIG_RELAY is not set
CONFIG_BLK_DEV_INITRD=y
CONFIG_INITRAMFS_SOURCE=""
CONFIG_RD_GZIP=y
CONFIG_RD_BZIP2=y
CONFIG_RD_LZMA=y
# CONFIG_RD_XZ is not set
# CONFIG_RD_LZO is not set
CONFIG_RD_LZ4=y
CONFIG_RD_ZSTD=y
CONFIG_BOOT_CONFIG=y
CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=y
# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
CONFIG_LD_ORPHAN_WARN=y
CONFIG_SYSCTL=y
CONFIG_SYSCTL_EXCEPTION_TRACE=y
CONFIG_HAVE_PCSPKR_PLATFORM=y
CONFIG_BPF=y
# CONFIG_EXPERT is not set
CONFIG_MULTIUSER=y
CONFIG_SGETMASK_SYSCALL=y
CONFIG_SYSFS_SYSCALL=y
CONFIG_FHANDLE=y
CONFIG_POSIX_TIMERS=y
CONFIG_PRINTK=y
CONFIG_PRINTK_NMI=y
CONFIG_BUG=y
CONFIG_ELF_CORE=y
CONFIG_PCSPKR_PLATFORM=y
CONFIG_BASE_FULL=y
CONFIG_FUTEX=y
CONFIG_FUTEX_PI=y
CONFIG_EPOLL=y
CONFIG_SIGNALFD=y
CONFIG_TIMERFD=y
CONFIG_EVENTFD=y
CONFIG_SHMEM=y
CONFIG_AIO=y
CONFIG_IO_URING=y
CONFIG_ADVISE_SYSCALLS=y
CONFIG_MEMBARRIER=y
CONFIG_KALLSYMS=y
CONFIG_KALLSYMS_ALL=y
CONFIG_KALLSYMS_ABSOLUTE_PERCPU=y
CONFIG_KALLSYMS_BASE_RELATIVE=y
# CONFIG_BPF_LSM is not set
CONFIG_BPF_SYSCALL=y
CONFIG_ARCH_WANT_DEFAULT_BPF_JIT=y
CONFIG_BPF_JIT_ALWAYS_ON=y
CONFIG_BPF_JIT_DEFAULT_ON=y
# CONFIG_BPF_UNPRIV_DEFAULT_OFF is not set
CONFIG_USERMODE_DRIVER=y
# CONFIG_BPF_PRELOAD is not set
# CONFIG_USERFAULTFD is not set
CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=y
CONFIG_KCMP=y
CONFIG_RSEQ=y
# CONFIG_EMBEDDED is not set
CONFIG_HAVE_PERF_EVENTS=y

#
# Kernel Performance Events And Counters
#
CONFIG_PERF_EVENTS=y
# CONFIG_DEBUG_PERF_USE_VMALLOC is not set
# end of Kernel Performance Events And Counters

CONFIG_VM_EVENT_COUNTERS=y
CONFIG_SLUB_DEBUG=y
# CONFIG_COMPAT_BRK is not set
# CONFIG_SLAB is not set
CONFIG_SLUB=y
# CONFIG_SLAB_MERGE_DEFAULT is not set
# CONFIG_SLAB_FREELIST_RANDOM is not set
# CONFIG_SLAB_FREELIST_HARDENED is not set
CONFIG_SHUFFLE_PAGE_ALLOCATOR=y
CONFIG_SLUB_CPU_PARTIAL=y
CONFIG_SYSTEM_DATA_VERIFICATION=y
CONFIG_PROFILING=y
CONFIG_TRACEPOINTS=y
# end of General setup

CONFIG_64BIT=y
CONFIG_X86_64=y
CONFIG_X86=y
CONFIG_INSTRUCTION_DECODER=y
CONFIG_OUTPUT_FORMAT="elf64-x86-64"
CONFIG_LOCKDEP_SUPPORT=y
CONFIG_STACKTRACE_SUPPORT=y
CONFIG_MMU=y
CONFIG_ARCH_MMAP_RND_BITS_MIN=28
CONFIG_ARCH_MMAP_RND_BITS_MAX=32
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=8
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=16
CONFIG_GENERIC_ISA_DMA=y
CONFIG_GENERIC_BUG=y
CONFIG_GENERIC_BUG_RELATIVE_POINTERS=y
CONFIG_ARCH_MAY_HAVE_PC_FDC=y
CONFIG_GENERIC_CALIBRATE_DELAY=y
CONFIG_ARCH_HAS_CPU_RELAX=y
CONFIG_ARCH_HAS_CACHE_LINE_SIZE=y
CONFIG_ARCH_HAS_FILTER_PGPROT=y
CONFIG_HAVE_SETUP_PER_CPU_AREA=y
CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=y
CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=y
CONFIG_ARCH_HIBERNATION_POSSIBLE=y
CONFIG_ARCH_SUSPEND_POSSIBLE=y
CONFIG_ARCH_WANT_GENERAL_HUGETLB=y
CONFIG_ZONE_DMA32=y
CONFIG_AUDIT_ARCH=y
CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=y
CONFIG_KASAN_SHADOW_OFFSET=0xdffffc0000000000
CONFIG_X86_64_SMP=y
CONFIG_ARCH_SUPPORTS_UPROBES=y
CONFIG_FIX_EARLYCON_MEM=y
CONFIG_PGTABLE_LEVELS=5
CONFIG_CC_HAS_SANE_STACKPROTECTOR=y

#
# Processor type and features
#
CONFIG_ZONE_DMA=y
CONFIG_SMP=y
CONFIG_X86_FEATURE_NAMES=y
# CONFIG_X86_X2APIC is not set
CONFIG_X86_MPPARSE=y
CONFIG_GOLDFISH=y
CONFIG_RETPOLINE=y
CONFIG_X86_CPU_RESCTRL=y
# CONFIG_X86_EXTENDED_PLATFORM is not set
# CONFIG_X86_INTEL_LPSS is not set
# CONFIG_X86_AMD_PLATFORM_DEVICE is not set
# CONFIG_IOSF_MBI is not set
CONFIG_X86_SUPPORTS_MEMORY_FAILURE=y
# CONFIG_SCHED_OMIT_FRAME_POINTER is not set
CONFIG_HYPERVISOR_GUEST=y
CONFIG_PARAVIRT=y
# CONFIG_PARAVIRT_DEBUG is not set
# CONFIG_PARAVIRT_SPINLOCKS is not set
CONFIG_X86_HV_CALLBACK_VECTOR=y
# CONFIG_XEN is not set
CONFIG_KVM_GUEST=y
CONFIG_ARCH_CPUIDLE_HALTPOLL=y
# CONFIG_PVH is not set
# CONFIG_PARAVIRT_TIME_ACCOUNTING is not set
CONFIG_PARAVIRT_CLOCK=y
# CONFIG_JAILHOUSE_GUEST is not set
# CONFIG_ACRN_GUEST is not set
# CONFIG_MK8 is not set
CONFIG_MPSC=y
# CONFIG_MCORE2 is not set
# CONFIG_MATOM is not set
# CONFIG_GENERIC_CPU is not set
CONFIG_X86_INTERNODE_CACHE_SHIFT=7
CONFIG_X86_L1_CACHE_SHIFT=7
CONFIG_X86_P6_NOP=y
CONFIG_X86_TSC=y
CONFIG_X86_CMPXCHG64=y
CONFIG_X86_CMOV=y
CONFIG_X86_MINIMUM_CPU_FAMILY=64
CONFIG_X86_DEBUGCTLMSR=y
CONFIG_IA32_FEAT_CTL=y
CONFIG_X86_VMX_FEATURE_NAMES=y
CONFIG_CPU_SUP_INTEL=y
CONFIG_CPU_SUP_AMD=y
CONFIG_CPU_SUP_HYGON=y
CONFIG_CPU_SUP_CENTAUR=y
CONFIG_CPU_SUP_ZHAOXIN=y
CONFIG_HPET_TIMER=y
CONFIG_DMI=y
# CONFIG_GART_IOMMU is not set
# CONFIG_MAXSMP is not set
CONFIG_NR_CPUS_RANGE_BEGIN=2
CONFIG_NR_CPUS_RANGE_END=512
CONFIG_NR_CPUS_DEFAULT=64
CONFIG_NR_CPUS=64
CONFIG_SCHED_SMT=y
CONFIG_SCHED_MC=y
# CONFIG_SCHED_MC_PRIO is not set
CONFIG_X86_LOCAL_APIC=y
CONFIG_X86_IO_APIC=y
CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS=y
CONFIG_X86_MCE=y
CONFIG_X86_MCELOG_LEGACY=y
# CONFIG_X86_MCE_INTEL is not set
# CONFIG_X86_MCE_AMD is not set
CONFIG_X86_MCE_INJECT=y

#
# Performance monitoring
#
CONFIG_PERF_EVENTS_INTEL_UNCORE=y
CONFIG_PERF_EVENTS_INTEL_RAPL=y
CONFIG_PERF_EVENTS_INTEL_CSTATE=y
# CONFIG_PERF_EVENTS_AMD_POWER is not set
# end of Performance monitoring

CONFIG_X86_16BIT=y
CONFIG_X86_ESPFIX64=y
CONFIG_X86_VSYSCALL_EMULATION=y
# CONFIG_X86_IOPL_IOPERM is not set
CONFIG_MICROCODE=y
CONFIG_MICROCODE_INTEL=y
# CONFIG_MICROCODE_AMD is not set
# CONFIG_MICROCODE_OLD_INTERFACE is not set
CONFIG_X86_MSR=y
CONFIG_X86_CPUID=y
CONFIG_X86_5LEVEL=y
CONFIG_X86_DIRECT_GBPAGES=y
CONFIG_X86_CPA_STATISTICS=y
# CONFIG_AMD_MEM_ENCRYPT is not set
CONFIG_NUMA=y
# CONFIG_AMD_NUMA is not set
CONFIG_X86_64_ACPI_NUMA=y
CONFIG_NUMA_EMU=y
CONFIG_NODES_SHIFT=6
CONFIG_ARCH_SPARSEMEM_ENABLE=y
CONFIG_ARCH_SPARSEMEM_DEFAULT=y
CONFIG_ARCH_SELECT_MEMORY_MODEL=y
CONFIG_ILLEGAL_POINTER_VALUE=0xdead000000000000
# CONFIG_X86_PMEM_LEGACY is not set
# CONFIG_X86_CHECK_BIOS_CORRUPTION is not set
CONFIG_X86_RESERVE_LOW=64
CONFIG_MTRR=y
# CONFIG_MTRR_SANITIZER is not set
CONFIG_X86_PAT=y
CONFIG_ARCH_USES_PG_UNCACHED=y
CONFIG_ARCH_RANDOM=y
CONFIG_X86_SMAP=y
CONFIG_X86_UMIP=y
# CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS is not set
CONFIG_X86_INTEL_TSX_MODE_OFF=y
# CONFIG_X86_INTEL_TSX_MODE_ON is not set
# CONFIG_X86_INTEL_TSX_MODE_AUTO is not set
# CONFIG_EFI is not set
# CONFIG_HZ_100 is not set
# CONFIG_HZ_250 is not set
# CONFIG_HZ_300 is not set
CONFIG_HZ_1000=y
CONFIG_HZ=1000
CONFIG_KEXEC=y
# CONFIG_KEXEC_FILE is not set
# CONFIG_CRASH_DUMP is not set
CONFIG_PHYSICAL_START=0x1000000
# CONFIG_RELOCATABLE is not set
CONFIG_PHYSICAL_ALIGN=0x200000
CONFIG_DYNAMIC_MEMORY_LAYOUT=y
CONFIG_HOTPLUG_CPU=y
CONFIG_BOOTPARAM_HOTPLUG_CPU0=y
CONFIG_DEBUG_HOTPLUG_CPU0=y
CONFIG_LEGACY_VSYSCALL_EMULATE=y
# CONFIG_LEGACY_VSYSCALL_XONLY is not set
# CONFIG_LEGACY_VSYSCALL_NONE is not set
# CONFIG_CMDLINE_BOOL is not set
CONFIG_MODIFY_LDT_SYSCALL=y
CONFIG_HAVE_LIVEPATCH=y
# end of Processor type and features

CONFIG_ARCH_HAS_ADD_PAGES=y
CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=y
CONFIG_USE_PERCPU_NUMA_NODE_ID=y
CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=y
CONFIG_ARCH_ENABLE_THP_MIGRATION=y

#
# Power management and ACPI options
#
CONFIG_SUSPEND=y
CONFIG_SUSPEND_FREEZER=y
CONFIG_PM_SLEEP=y
CONFIG_PM_SLEEP_SMP=y
CONFIG_PM_AUTOSLEEP=y
CONFIG_PM_WAKELOCKS=y
CONFIG_PM_WAKELOCKS_LIMIT=100
# CONFIG_PM_WAKELOCKS_GC is not set
CONFIG_PM=y
CONFIG_PM_DEBUG=y
CONFIG_PM_ADVANCED_DEBUG=y
CONFIG_PM_SLEEP_DEBUG=y
CONFIG_PM_TRACE=y
CONFIG_PM_TRACE_RTC=y
CONFIG_PM_CLK=y
# CONFIG_WQ_POWER_EFFICIENT_DEFAULT is not set
CONFIG_ARCH_SUPPORTS_ACPI=y
CONFIG_ACPI=y
CONFIG_ACPI_LEGACY_TABLES_LOOKUP=y
CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=y
CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=y
CONFIG_ACPI_DEBUGGER=y
CONFIG_ACPI_DEBUGGER_USER=m
CONFIG_ACPI_SPCR_TABLE=y
CONFIG_ACPI_LPIT=y
CONFIG_ACPI_SLEEP=y
CONFIG_ACPI_REV_OVERRIDE_POSSIBLE=y
# CONFIG_ACPI_EC_DEBUGFS is not set
CONFIG_ACPI_AC=y
# CONFIG_ACPI_BATTERY is not set
CONFIG_ACPI_BUTTON=m
CONFIG_ACPI_TINY_POWER_BUTTON=m
CONFIG_ACPI_TINY_POWER_BUTTON_SIGNAL=38
# CONFIG_ACPI_VIDEO is not set
CONFIG_ACPI_FAN=m
CONFIG_ACPI_TAD=m
# CONFIG_ACPI_DOCK is not set
CONFIG_ACPI_CPU_FREQ_PSS=y
CONFIG_ACPI_PROCESSOR_CSTATE=y
CONFIG_ACPI_PROCESSOR_IDLE=y
CONFIG_ACPI_PROCESSOR=m
CONFIG_ACPI_HOTPLUG_CPU=y
CONFIG_ACPI_PROCESSOR_AGGREGATOR=m
# CONFIG_ACPI_THERMAL is not set
CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=y
# CONFIG_ACPI_TABLE_UPGRADE is not set
CONFIG_ACPI_DEBUG=y
# CONFIG_ACPI_PCI_SLOT is not set
CONFIG_ACPI_CONTAINER=y
CONFIG_ACPI_HOTPLUG_IOAPIC=y
# CONFIG_ACPI_SBS is not set
# CONFIG_ACPI_HED is not set
CONFIG_ACPI_CUSTOM_METHOD=y
# CONFIG_ACPI_NFIT is not set
CONFIG_ACPI_NUMA=y
# CONFIG_ACPI_HMAT is not set
CONFIG_HAVE_ACPI_APEI=y
CONFIG_HAVE_ACPI_APEI_NMI=y
# CONFIG_ACPI_APEI is not set
CONFIG_ACPI_DPTF=y
CONFIG_DPTF_POWER=y
# CONFIG_DPTF_PCH_FIVR is not set
# CONFIG_ACPI_EXTLOG is not set
CONFIG_ACPI_CONFIGFS=m
CONFIG_PMIC_OPREGION=y
CONFIG_BYTCRC_PMIC_OPREGION=y
# CONFIG_CHTCRC_PMIC_OPREGION is not set
CONFIG_CHT_WC_PMIC_OPREGION=y
# CONFIG_CHT_DC_TI_PMIC_OPREGION is not set
CONFIG_X86_PM_TIMER=y
# CONFIG_SFI is not set

#
# CPU Frequency scaling
#
# CONFIG_CPU_FREQ is not set
# end of CPU Frequency scaling

#
# CPU Idle
#
CONFIG_CPU_IDLE=y
# CONFIG_CPU_IDLE_GOV_LADDER is not set
# CONFIG_CPU_IDLE_GOV_MENU is not set
CONFIG_CPU_IDLE_GOV_TEO=y
# CONFIG_CPU_IDLE_GOV_HALTPOLL is not set
CONFIG_HALTPOLL_CPUIDLE=y
# end of CPU Idle

# CONFIG_INTEL_IDLE is not set
# end of Power management and ACPI options

#
# Bus options (PCI etc.)
#
CONFIG_PCI_DIRECT=y
CONFIG_PCI_MMCONFIG=y
CONFIG_MMCONF_FAM10H=y
CONFIG_ISA_DMA_API=y
CONFIG_AMD_NB=y
# CONFIG_X86_SYSFB is not set
# end of Bus options (PCI etc.)

#
# Binary Emulations
#
# CONFIG_IA32_EMULATION is not set
# end of Binary Emulations

#
# Firmware Drivers
#
CONFIG_EDD=m
CONFIG_EDD_OFF=y
CONFIG_FIRMWARE_MEMMAP=y
# CONFIG_DMIID is not set
CONFIG_DMI_SYSFS=m
CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK=y
# CONFIG_ISCSI_IBFT is not set
# CONFIG_FW_CFG_SYSFS is not set
CONFIG_GOOGLE_FIRMWARE=y
# CONFIG_GOOGLE_SMI is not set
CONFIG_GOOGLE_COREBOOT_TABLE=y
CONFIG_GOOGLE_MEMCONSOLE=y
CONFIG_GOOGLE_MEMCONSOLE_X86_LEGACY=m
CONFIG_GOOGLE_MEMCONSOLE_COREBOOT=y
CONFIG_GOOGLE_VPD=y

#
# Tegra firmware driver
#
# end of Tegra firmware driver
# end of Firmware Drivers

CONFIG_HAVE_KVM=y
# CONFIG_VIRTUALIZATION is not set
CONFIG_AS_AVX512=y
CONFIG_AS_SHA1_NI=y
CONFIG_AS_SHA256_NI=y
CONFIG_AS_TPAUSE=y

#
# General architecture-dependent options
#
CONFIG_CRASH_CORE=y
CONFIG_KEXEC_CORE=y
CONFIG_HOTPLUG_SMT=y
CONFIG_GENERIC_ENTRY=y
# CONFIG_OPROFILE is not set
CONFIG_HAVE_OPROFILE=y
CONFIG_OPROFILE_NMI_TIMER=y
CONFIG_KPROBES=y
CONFIG_JUMP_LABEL=y
# CONFIG_STATIC_KEYS_SELFTEST is not set
# CONFIG_STATIC_CALL_SELFTEST is not set
CONFIG_OPTPROBES=y
CONFIG_UPROBES=y
CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=y
CONFIG_ARCH_USE_BUILTIN_BSWAP=y
CONFIG_KRETPROBES=y
CONFIG_HAVE_IOREMAP_PROT=y
CONFIG_HAVE_KPROBES=y
CONFIG_HAVE_KRETPROBES=y
CONFIG_HAVE_OPTPROBES=y
CONFIG_HAVE_KPROBES_ON_FTRACE=y
CONFIG_HAVE_FUNCTION_ERROR_INJECTION=y
CONFIG_HAVE_NMI=y
CONFIG_HAVE_ARCH_TRACEHOOK=y
CONFIG_HAVE_DMA_CONTIGUOUS=y
CONFIG_GENERIC_SMP_IDLE_THREAD=y
CONFIG_ARCH_HAS_FORTIFY_SOURCE=y
CONFIG_ARCH_HAS_SET_MEMORY=y
CONFIG_ARCH_HAS_SET_DIRECT_MAP=y
CONFIG_HAVE_ARCH_THREAD_STRUCT_WHITELIST=y
CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=y
CONFIG_HAVE_ASM_MODVERSIONS=y
CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
CONFIG_HAVE_RSEQ=y
CONFIG_HAVE_FUNCTION_ARG_ACCESS_API=y
CONFIG_HAVE_HW_BREAKPOINT=y
CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=y
CONFIG_HAVE_USER_RETURN_NOTIFIER=y
CONFIG_HAVE_PERF_EVENTS_NMI=y
CONFIG_HAVE_HARDLOCKUP_DETECTOR_PERF=y
CONFIG_HAVE_PERF_REGS=y
CONFIG_HAVE_PERF_USER_STACK_DUMP=y
CONFIG_HAVE_ARCH_JUMP_LABEL=y
CONFIG_HAVE_ARCH_JUMP_LABEL_RELATIVE=y
CONFIG_MMU_GATHER_TABLE_FREE=y
CONFIG_MMU_GATHER_RCU_TABLE_FREE=y
CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=y
CONFIG_HAVE_ALIGNED_STRUCT_PAGE=y
CONFIG_HAVE_CMPXCHG_LOCAL=y
CONFIG_HAVE_CMPXCHG_DOUBLE=y
CONFIG_HAVE_ARCH_SECCOMP=y
CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
CONFIG_SECCOMP=y
CONFIG_SECCOMP_FILTER=y
CONFIG_HAVE_ARCH_STACKLEAK=y
CONFIG_HAVE_STACKPROTECTOR=y
CONFIG_STACKPROTECTOR=y
CONFIG_STACKPROTECTOR_STRONG=y
CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=y
CONFIG_HAVE_CONTEXT_TRACKING=y
CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=y
CONFIG_HAVE_IRQ_TIME_ACCOUNTING=y
CONFIG_HAVE_MOVE_PMD=y
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=y
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD=y
CONFIG_HAVE_ARCH_HUGE_VMAP=y
CONFIG_ARCH_WANT_HUGE_PMD_SHARE=y
CONFIG_HAVE_ARCH_SOFT_DIRTY=y
CONFIG_HAVE_MOD_ARCH_SPECIFIC=y
CONFIG_MODULES_USE_ELF_RELA=y
CONFIG_ARCH_HAS_ELF_RANDOMIZE=y
CONFIG_HAVE_ARCH_MMAP_RND_BITS=y
CONFIG_HAVE_EXIT_THREAD=y
CONFIG_ARCH_MMAP_RND_BITS=28
CONFIG_HAVE_STACK_VALIDATION=y
CONFIG_HAVE_RELIABLE_STACKTRACE=y
CONFIG_ISA_BUS_API=y
CONFIG_COMPAT_32BIT_TIME=y
CONFIG_HAVE_ARCH_VMAP_STACK=y
CONFIG_VMAP_STACK=y
CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=y
CONFIG_STRICT_KERNEL_RWX=y
CONFIG_ARCH_HAS_STRICT_MODULE_RWX=y
CONFIG_STRICT_MODULE_RWX=y
CONFIG_HAVE_ARCH_PREL32_RELOCATIONS=y
# CONFIG_LOCK_EVENT_COUNTS is not set
CONFIG_ARCH_HAS_MEM_ENCRYPT=y
CONFIG_HAVE_STATIC_CALL=y
CONFIG_HAVE_STATIC_CALL_INLINE=y
CONFIG_ARCH_WANT_LD_ORPHAN_WARN=y

#
# GCOV-based kernel profiling
#
# CONFIG_GCOV_KERNEL is not set
CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=y
# end of GCOV-based kernel profiling

CONFIG_HAVE_GCC_PLUGINS=y
# end of General architecture-dependent options

CONFIG_RT_MUTEXES=y
CONFIG_BASE_SMALL=0
CONFIG_MODULES=y
CONFIG_MODULE_FORCE_LOAD=y
CONFIG_MODULE_UNLOAD=y
CONFIG_MODULE_FORCE_UNLOAD=y
# CONFIG_MODVERSIONS is not set
# CONFIG_MODULE_SRCVERSION_ALL is not set
# CONFIG_MODULE_SIG is not set
# CONFIG_MODULE_COMPRESS is not set
CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS=y
CONFIG_UNUSED_SYMBOLS=y
CONFIG_MODULES_TREE_LOOKUP=y
CONFIG_BLOCK=y
CONFIG_BLK_SCSI_REQUEST=y
CONFIG_BLK_DEV_BSG=y
CONFIG_BLK_DEV_BSGLIB=y
# CONFIG_BLK_DEV_INTEGRITY is not set
CONFIG_BLK_DEV_ZONED=y
CONFIG_BLK_CMDLINE_PARSER=y
CONFIG_BLK_WBT=y
CONFIG_BLK_WBT_MQ=y
CONFIG_BLK_DEBUG_FS=y
CONFIG_BLK_DEBUG_FS_ZONED=y
CONFIG_BLK_SED_OPAL=y
CONFIG_BLK_INLINE_ENCRYPTION=y
CONFIG_BLK_INLINE_ENCRYPTION_FALLBACK=y

#
# Partition Types
#
CONFIG_PARTITION_ADVANCED=y
CONFIG_ACORN_PARTITION=y
CONFIG_ACORN_PARTITION_CUMANA=y
# CONFIG_ACORN_PARTITION_EESOX is not set
# CONFIG_ACORN_PARTITION_ICS is not set
# CONFIG_ACORN_PARTITION_ADFS is not set
CONFIG_ACORN_PARTITION_POWERTEC=y
CONFIG_ACORN_PARTITION_RISCIX=y
# CONFIG_AIX_PARTITION is not set
# CONFIG_OSF_PARTITION is not set
# CONFIG_AMIGA_PARTITION is not set
CONFIG_ATARI_PARTITION=y
# CONFIG_MAC_PARTITION is not set
# CONFIG_MSDOS_PARTITION is not set
# CONFIG_LDM_PARTITION is not set
CONFIG_SGI_PARTITION=y
CONFIG_ULTRIX_PARTITION=y
CONFIG_SUN_PARTITION=y
CONFIG_KARMA_PARTITION=y
# CONFIG_EFI_PARTITION is not set
CONFIG_SYSV68_PARTITION=y
CONFIG_CMDLINE_PARTITION=y
# end of Partition Types

CONFIG_BLK_MQ_PCI=y
CONFIG_BLK_MQ_VIRTIO=y
CONFIG_BLK_MQ_RDMA=y
CONFIG_BLK_PM=y

#
# IO Schedulers
#
CONFIG_MQ_IOSCHED_DEADLINE=y
CONFIG_MQ_IOSCHED_KYBER=m
# CONFIG_IOSCHED_BFQ is not set
# end of IO Schedulers

CONFIG_PADATA=y
CONFIG_ASN1=y
CONFIG_UNINLINE_SPIN_UNLOCK=y
CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=y
CONFIG_MUTEX_SPIN_ON_OWNER=y
CONFIG_RWSEM_SPIN_ON_OWNER=y
CONFIG_LOCK_SPIN_ON_OWNER=y
CONFIG_ARCH_USE_QUEUED_SPINLOCKS=y
CONFIG_QUEUED_SPINLOCKS=y
CONFIG_ARCH_USE_QUEUED_RWLOCKS=y
CONFIG_QUEUED_RWLOCKS=y
CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE=y
CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE=y
CONFIG_ARCH_HAS_SYSCALL_WRAPPER=y
CONFIG_FREEZER=y

#
# Executable file formats
#
CONFIG_BINFMT_ELF=y
CONFIG_ELFCORE=y
CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS=y
CONFIG_BINFMT_SCRIPT=y
CONFIG_BINFMT_MISC=y
CONFIG_COREDUMP=y
# end of Executable file formats

#
# Memory Management options
#
CONFIG_SELECT_MEMORY_MODEL=y
CONFIG_SPARSEMEM_MANUAL=y
CONFIG_SPARSEMEM=y
CONFIG_NEED_MULTIPLE_NODES=y
CONFIG_SPARSEMEM_EXTREME=y
CONFIG_SPARSEMEM_VMEMMAP_ENABLE=y
CONFIG_SPARSEMEM_VMEMMAP=y
CONFIG_HAVE_FAST_GUP=y
CONFIG_MEMORY_ISOLATION=y
# CONFIG_MEMORY_HOTPLUG is not set
CONFIG_SPLIT_PTLOCK_CPUS=4
CONFIG_COMPACTION=y
# CONFIG_PAGE_REPORTING is not set
CONFIG_MIGRATION=y
CONFIG_CONTIG_ALLOC=y
CONFIG_PHYS_ADDR_T_64BIT=y
CONFIG_BOUNCE=y
CONFIG_VIRT_TO_BUS=y
CONFIG_MMU_NOTIFIER=y
# CONFIG_KSM is not set
CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
CONFIG_ARCH_SUPPORTS_MEMORY_FAILURE=y
CONFIG_MEMORY_FAILURE=y
# CONFIG_HWPOISON_INJECT is not set
CONFIG_TRANSPARENT_HUGEPAGE=y
CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS=y
# CONFIG_TRANSPARENT_HUGEPAGE_MADVISE is not set
CONFIG_ARCH_WANTS_THP_SWAP=y
# CONFIG_CLEANCACHE is not set
CONFIG_CMA=y
# CONFIG_CMA_DEBUG is not set
CONFIG_CMA_DEBUGFS=y
CONFIG_CMA_AREAS=19
# CONFIG_ZPOOL is not set
# CONFIG_ZBUD is not set
# CONFIG_ZSMALLOC is not set
CONFIG_GENERIC_EARLY_IOREMAP=y
CONFIG_DEFERRED_STRUCT_PAGE_INIT=y
# CONFIG_IDLE_PAGE_TRACKING is not set
CONFIG_ARCH_HAS_PTE_DEVMAP=y
CONFIG_HMM_MIRROR=y
CONFIG_FRAME_VECTOR=y
# CONFIG_PERCPU_STATS is not set
# CONFIG_GUP_BENCHMARK is not set
# CONFIG_READ_ONLY_THP_FOR_FS is not set
CONFIG_ARCH_HAS_PTE_SPECIAL=y
# end of Memory Management options

CONFIG_NET=y
CONFIG_NET_REDIRECT=y
CONFIG_SKB_EXTENSIONS=y

#
# Networking options
#
CONFIG_PACKET=y
# CONFIG_PACKET_DIAG is not set
CONFIG_UNIX=y
CONFIG_UNIX_SCM=y
CONFIG_UNIX_DIAG=y
# CONFIG_TLS is not set
CONFIG_XFRM=y
CONFIG_XFRM_ALGO=m
# CONFIG_XFRM_USER is not set
CONFIG_XFRM_INTERFACE=m
CONFIG_XFRM_SUB_POLICY=y
# CONFIG_XFRM_MIGRATE is not set
# CONFIG_XFRM_STATISTICS is not set
CONFIG_XFRM_AH=m
CONFIG_XFRM_ESP=m
CONFIG_XFRM_IPCOMP=m
CONFIG_NET_KEY=m
# CONFIG_NET_KEY_MIGRATE is not set
CONFIG_XFRM_ESPINTCP=y
CONFIG_SMC=m
CONFIG_SMC_DIAG=m
CONFIG_XDP_SOCKETS=y
CONFIG_XDP_SOCKETS_DIAG=m
CONFIG_INET=y
CONFIG_IP_MULTICAST=y
# CONFIG_IP_ADVANCED_ROUTER is not set
CONFIG_IP_ROUTE_CLASSID=y
CONFIG_IP_PNP=y
CONFIG_IP_PNP_DHCP=y
# CONFIG_IP_PNP_BOOTP is not set
# CONFIG_IP_PNP_RARP is not set
# CONFIG_NET_IPIP is not set
CONFIG_NET_IPGRE_DEMUX=m
CONFIG_NET_IP_TUNNEL=y
CONFIG_NET_IPGRE=m
CONFIG_NET_IPGRE_BROADCAST=y
CONFIG_IP_MROUTE_COMMON=y
# CONFIG_IP_MROUTE is not set
CONFIG_SYN_COOKIES=y
CONFIG_NET_IPVTI=m
CONFIG_NET_UDP_TUNNEL=y
CONFIG_NET_FOU=m
CONFIG_NET_FOU_IP_TUNNELS=y
CONFIG_INET_AH=m
CONFIG_INET_ESP=m
# CONFIG_INET_ESP_OFFLOAD is not set
CONFIG_INET_ESPINTCP=y
CONFIG_INET_IPCOMP=m
CONFIG_INET_XFRM_TUNNEL=m
CONFIG_INET_TUNNEL=m
CONFIG_INET_DIAG=m
CONFIG_INET_TCP_DIAG=m
# CONFIG_INET_UDP_DIAG is not set
CONFIG_INET_RAW_DIAG=m
# CONFIG_INET_DIAG_DESTROY is not set
CONFIG_TCP_CONG_ADVANCED=y
CONFIG_TCP_CONG_BIC=y
CONFIG_TCP_CONG_CUBIC=y
CONFIG_TCP_CONG_WESTWOOD=y
CONFIG_TCP_CONG_HTCP=y
# CONFIG_TCP_CONG_HSTCP is not set
# CONFIG_TCP_CONG_HYBLA is not set
CONFIG_TCP_CONG_VEGAS=y
CONFIG_TCP_CONG_NV=m
# CONFIG_TCP_CONG_SCALABLE is not set
# CONFIG_TCP_CONG_LP is not set
# CONFIG_TCP_CONG_VENO is not set
CONFIG_TCP_CONG_YEAH=m
# CONFIG_TCP_CONG_ILLINOIS is not set
CONFIG_TCP_CONG_DCTCP=m
CONFIG_TCP_CONG_CDG=y
CONFIG_TCP_CONG_BBR=m
# CONFIG_DEFAULT_BIC is not set
CONFIG_DEFAULT_CUBIC=y
# CONFIG_DEFAULT_HTCP is not set
# CONFIG_DEFAULT_VEGAS is not set
# CONFIG_DEFAULT_WESTWOOD is not set
# CONFIG_DEFAULT_CDG is not set
# CONFIG_DEFAULT_RENO is not set
CONFIG_DEFAULT_TCP_CONG="cubic"
CONFIG_TCP_MD5SIG=y
CONFIG_IPV6=m
CONFIG_IPV6_ROUTER_PREF=y
# CONFIG_IPV6_ROUTE_INFO is not set
CONFIG_IPV6_OPTIMISTIC_DAD=y
CONFIG_INET6_AH=m
CONFIG_INET6_ESP=m
# CONFIG_INET6_ESP_OFFLOAD is not set
# CONFIG_INET6_ESPINTCP is not set
CONFIG_INET6_IPCOMP=m
CONFIG_IPV6_MIP6=m
CONFIG_INET6_XFRM_TUNNEL=m
CONFIG_INET6_TUNNEL=m
# CONFIG_IPV6_VTI is not set
# CONFIG_IPV6_SIT is not set
CONFIG_IPV6_TUNNEL=m
CONFIG_IPV6_GRE=m
CONFIG_IPV6_FOU=m
CONFIG_IPV6_FOU_TUNNEL=m
CONFIG_IPV6_MULTIPLE_TABLES=y
CONFIG_IPV6_SUBTREES=y
CONFIG_IPV6_MROUTE=y
# CONFIG_IPV6_MROUTE_MULTIPLE_TABLES is not set
CONFIG_IPV6_PIMSM_V2=y
# CONFIG_IPV6_SEG6_LWTUNNEL is not set
CONFIG_IPV6_SEG6_HMAC=y
CONFIG_IPV6_RPL_LWTUNNEL=y
# CONFIG_NETLABEL is not set
# CONFIG_MPTCP is not set
CONFIG_NETWORK_SECMARK=y
CONFIG_NET_PTP_CLASSIFY=y
CONFIG_NETWORK_PHY_TIMESTAMPING=y
# CONFIG_NETFILTER is not set
CONFIG_BPFILTER=y
# CONFIG_BPFILTER_UMH is not set
CONFIG_IP_DCCP=y
CONFIG_INET_DCCP_DIAG=m

#
# DCCP CCIDs Configuration
#
# CONFIG_IP_DCCP_CCID2_DEBUG is not set
# CONFIG_IP_DCCP_CCID3 is not set
# end of DCCP CCIDs Configuration

#
# DCCP Kernel Hacking
#
# CONFIG_IP_DCCP_DEBUG is not set
# end of DCCP Kernel Hacking

CONFIG_IP_SCTP=m
CONFIG_SCTP_DBG_OBJCNT=y
CONFIG_SCTP_DEFAULT_COOKIE_HMAC_MD5=y
# CONFIG_SCTP_DEFAULT_COOKIE_HMAC_SHA1 is not set
# CONFIG_SCTP_DEFAULT_COOKIE_HMAC_NONE is not set
CONFIG_SCTP_COOKIE_HMAC_MD5=y
CONFIG_SCTP_COOKIE_HMAC_SHA1=y
CONFIG_INET_SCTP_DIAG=m
# CONFIG_RDS is not set
CONFIG_TIPC=m
CONFIG_TIPC_MEDIA_IB=y
CONFIG_TIPC_MEDIA_UDP=y
CONFIG_TIPC_CRYPTO=y
CONFIG_TIPC_DIAG=m
CONFIG_ATM=y
CONFIG_ATM_CLIP=y
# CONFIG_ATM_CLIP_NO_ICMP is not set
CONFIG_ATM_LANE=y
CONFIG_ATM_MPOA=y
# CONFIG_ATM_BR2684 is not set
# CONFIG_L2TP is not set
CONFIG_STP=m
CONFIG_BRIDGE=m
CONFIG_BRIDGE_IGMP_SNOOPING=y
# CONFIG_BRIDGE_VLAN_FILTERING is not set
# CONFIG_BRIDGE_MRP is not set
CONFIG_HAVE_NET_DSA=y
CONFIG_NET_DSA=m
CONFIG_NET_DSA_TAG_8021Q=m
CONFIG_NET_DSA_TAG_AR9331=m
CONFIG_NET_DSA_TAG_BRCM_COMMON=m
CONFIG_NET_DSA_TAG_BRCM=m
CONFIG_NET_DSA_TAG_BRCM_PREPEND=m
CONFIG_NET_DSA_TAG_GSWIP=m
CONFIG_NET_DSA_TAG_DSA=m
CONFIG_NET_DSA_TAG_EDSA=m
CONFIG_NET_DSA_TAG_MTK=m
CONFIG_NET_DSA_TAG_KSZ=m
CONFIG_NET_DSA_TAG_RTL4_A=m
# CONFIG_NET_DSA_TAG_OCELOT is not set
CONFIG_NET_DSA_TAG_QCA=m
CONFIG_NET_DSA_TAG_LAN9303=m
CONFIG_NET_DSA_TAG_SJA1105=m
CONFIG_NET_DSA_TAG_TRAILER=m
CONFIG_VLAN_8021Q=m
# CONFIG_VLAN_8021Q_GVRP is not set
# CONFIG_VLAN_8021Q_MVRP is not set
# CONFIG_DECNET is not set
CONFIG_LLC=y
CONFIG_LLC2=y
# CONFIG_ATALK is not set
CONFIG_X25=m
# CONFIG_LAPB is not set
# CONFIG_PHONET is not set
CONFIG_6LOWPAN=m
CONFIG_6LOWPAN_DEBUGFS=y
CONFIG_6LOWPAN_NHC=m
# CONFIG_6LOWPAN_NHC_DEST is not set
CONFIG_6LOWPAN_NHC_FRAGMENT=m
# CONFIG_6LOWPAN_NHC_HOP is not set
CONFIG_6LOWPAN_NHC_IPV6=m
# CONFIG_6LOWPAN_NHC_MOBILITY is not set
# CONFIG_6LOWPAN_NHC_ROUTING is not set
CONFIG_6LOWPAN_NHC_UDP=m
# CONFIG_6LOWPAN_GHC_EXT_HDR_HOP is not set
CONFIG_6LOWPAN_GHC_UDP=m
CONFIG_6LOWPAN_GHC_ICMPV6=m
# CONFIG_6LOWPAN_GHC_EXT_HDR_DEST is not set
# CONFIG_6LOWPAN_GHC_EXT_HDR_FRAG is not set
CONFIG_6LOWPAN_GHC_EXT_HDR_ROUTE=m
# CONFIG_IEEE802154 is not set
CONFIG_NET_SCHED=y

#
# Queueing/Scheduling
#
# CONFIG_NET_SCH_CBQ is not set
# CONFIG_NET_SCH_HTB is not set
CONFIG_NET_SCH_HFSC=y
# CONFIG_NET_SCH_ATM is not set
CONFIG_NET_SCH_PRIO=y
CONFIG_NET_SCH_MULTIQ=y
CONFIG_NET_SCH_RED=y
CONFIG_NET_SCH_SFB=y
# CONFIG_NET_SCH_SFQ is not set
# CONFIG_NET_SCH_TEQL is not set
CONFIG_NET_SCH_TBF=y
# CONFIG_NET_SCH_CBS is not set
# CONFIG_NET_SCH_ETF is not set
# CONFIG_NET_SCH_TAPRIO is not set
# CONFIG_NET_SCH_GRED is not set
# CONFIG_NET_SCH_DSMARK is not set
CONFIG_NET_SCH_NETEM=m
# CONFIG_NET_SCH_DRR is not set
CONFIG_NET_SCH_MQPRIO=y
# CONFIG_NET_SCH_SKBPRIO is not set
# CONFIG_NET_SCH_CHOKE is not set
# CONFIG_NET_SCH_QFQ is not set
# CONFIG_NET_SCH_CODEL is not set
CONFIG_NET_SCH_FQ_CODEL=m
# CONFIG_NET_SCH_CAKE is not set
CONFIG_NET_SCH_FQ=m
# CONFIG_NET_SCH_HHF is not set
CONFIG_NET_SCH_PIE=y
# CONFIG_NET_SCH_FQ_PIE is not set
# CONFIG_NET_SCH_INGRESS is not set
CONFIG_NET_SCH_PLUG=y
CONFIG_NET_SCH_ETS=y
# CONFIG_NET_SCH_DEFAULT is not set

#
# Classification
#
CONFIG_NET_CLS=y
# CONFIG_NET_CLS_BASIC is not set
# CONFIG_NET_CLS_TCINDEX is not set
CONFIG_NET_CLS_ROUTE4=y
CONFIG_NET_CLS_FW=y
CONFIG_NET_CLS_U32=m
# CONFIG_CLS_U32_PERF is not set
# CONFIG_CLS_U32_MARK is not set
# CONFIG_NET_CLS_RSVP is not set
# CONFIG_NET_CLS_RSVP6 is not set
CONFIG_NET_CLS_FLOW=y
CONFIG_NET_CLS_CGROUP=m
CONFIG_NET_CLS_BPF=m
CONFIG_NET_CLS_FLOWER=m
# CONFIG_NET_CLS_MATCHALL is not set
# CONFIG_NET_EMATCH is not set
CONFIG_NET_CLS_ACT=y
CONFIG_NET_ACT_POLICE=m
CONFIG_NET_ACT_GACT=y
CONFIG_GACT_PROB=y
CONFIG_NET_ACT_MIRRED=m
# CONFIG_NET_ACT_SAMPLE is not set
CONFIG_NET_ACT_NAT=m
CONFIG_NET_ACT_PEDIT=y
CONFIG_NET_ACT_SIMP=y
CONFIG_NET_ACT_SKBEDIT=y
CONFIG_NET_ACT_CSUM=m
CONFIG_NET_ACT_MPLS=m
CONFIG_NET_ACT_VLAN=m
CONFIG_NET_ACT_BPF=y
# CONFIG_NET_ACT_SKBMOD is not set
CONFIG_NET_ACT_IFE=m
CONFIG_NET_ACT_TUNNEL_KEY=y
CONFIG_NET_ACT_GATE=m
CONFIG_NET_IFE_SKBMARK=m
# CONFIG_NET_IFE_SKBPRIO is not set
CONFIG_NET_IFE_SKBTCINDEX=m
CONFIG_NET_TC_SKB_EXT=y
CONFIG_NET_SCH_FIFO=y
# CONFIG_DCB is not set
CONFIG_DNS_RESOLVER=y
# CONFIG_BATMAN_ADV is not set
# CONFIG_OPENVSWITCH is not set
CONFIG_VSOCKETS=m
CONFIG_VSOCKETS_DIAG=m
# CONFIG_VSOCKETS_LOOPBACK is not set
CONFIG_VIRTIO_VSOCKETS=m
CONFIG_VIRTIO_VSOCKETS_COMMON=m
CONFIG_NETLINK_DIAG=m
CONFIG_MPLS=y
CONFIG_NET_MPLS_GSO=y
CONFIG_MPLS_ROUTING=y
CONFIG_MPLS_IPTUNNEL=m
CONFIG_NET_NSH=m
# CONFIG_HSR is not set
CONFIG_NET_SWITCHDEV=y
CONFIG_NET_L3_MASTER_DEV=y
CONFIG_QRTR=y
CONFIG_QRTR_SMD=y
# CONFIG_QRTR_TUN is not set
# CONFIG_QRTR_MHI is not set
# CONFIG_NET_NCSI is not set
CONFIG_RPS=y
CONFIG_RFS_ACCEL=y
CONFIG_XPS=y
CONFIG_CGROUP_NET_PRIO=y
CONFIG_CGROUP_NET_CLASSID=y
CONFIG_NET_RX_BUSY_POLL=y
CONFIG_BQL=y
CONFIG_BPF_JIT=y
CONFIG_NET_FLOW_LIMIT=y

#
# Network testing
#
CONFIG_NET_PKTGEN=y
# CONFIG_NET_DROP_MONITOR is not set
# end of Network testing
# end of Networking options

# CONFIG_HAMRADIO is not set
# CONFIG_CAN is not set
# CONFIG_BT is not set
CONFIG_AF_RXRPC=y
# CONFIG_AF_RXRPC_INJECT_LOSS is not set
# CONFIG_AF_RXRPC_DEBUG is not set
# CONFIG_RXKAD is not set
# CONFIG_AF_KCM is not set
CONFIG_STREAM_PARSER=y
CONFIG_FIB_RULES=y
CONFIG_WIRELESS=y
CONFIG_CFG80211=y
CONFIG_NL80211_TESTMODE=y
CONFIG_CFG80211_DEVELOPER_WARNINGS=y
CONFIG_CFG80211_REQUIRE_SIGNED_REGDB=y
CONFIG_CFG80211_USE_KERNEL_REGDB_KEYS=y
# CONFIG_CFG80211_DEFAULT_PS is not set
CONFIG_CFG80211_DEBUGFS=y
CONFIG_CFG80211_CRDA_SUPPORT=y
# CONFIG_CFG80211_WEXT is not set
CONFIG_MAC80211=y
CONFIG_MAC80211_HAS_RC=y
CONFIG_MAC80211_RC_MINSTREL=y
CONFIG_MAC80211_RC_DEFAULT_MINSTREL=y
CONFIG_MAC80211_RC_DEFAULT="minstrel_ht"
# CONFIG_MAC80211_MESH is not set
# CONFIG_MAC80211_LEDS is not set
# CONFIG_MAC80211_DEBUGFS is not set
# CONFIG_MAC80211_MESSAGE_TRACING is not set
# CONFIG_MAC80211_DEBUG_MENU is not set
CONFIG_MAC80211_STA_HASH_MAX_SIZE=0
# CONFIG_WIMAX is not set
CONFIG_RFKILL=y
CONFIG_RFKILL_LEDS=y
CONFIG_RFKILL_INPUT=y
# CONFIG_RFKILL_GPIO is not set
CONFIG_NET_9P=y
CONFIG_NET_9P_VIRTIO=y
# CONFIG_NET_9P_DEBUG is not set
CONFIG_CAIF=m
CONFIG_CAIF_DEBUG=y
CONFIG_CAIF_NETDEV=m
# CONFIG_CAIF_USB is not set
CONFIG_CEPH_LIB=y
# CONFIG_CEPH_LIB_PRETTYDEBUG is not set
CONFIG_CEPH_LIB_USE_DNS_RESOLVER=y
# CONFIG_NFC is not set
CONFIG_PSAMPLE=m
CONFIG_NET_IFE=y
CONFIG_LWTUNNEL=y
CONFIG_LWTUNNEL_BPF=y
CONFIG_DST_CACHE=y
CONFIG_GRO_CELLS=y
CONFIG_NET_SOCK_MSG=y
CONFIG_NET_DEVLINK=y
CONFIG_FAILOVER=m
CONFIG_ETHTOOL_NETLINK=y
CONFIG_HAVE_EBPF_JIT=y

#
# Device Drivers
#
CONFIG_HAVE_EISA=y
CONFIG_EISA=y
# CONFIG_EISA_VLB_PRIMING is not set
CONFIG_EISA_PCI_EISA=y
CONFIG_EISA_VIRTUAL_ROOT=y
CONFIG_EISA_NAMES=y
CONFIG_HAVE_PCI=y
CONFIG_PCI=y
CONFIG_PCI_DOMAINS=y
# CONFIG_PCIEPORTBUS is not set
CONFIG_PCIEASPM=y
CONFIG_PCIEASPM_DEFAULT=y
# CONFIG_PCIEASPM_POWERSAVE is not set
# CONFIG_PCIEASPM_POWER_SUPERSAVE is not set
# CONFIG_PCIEASPM_PERFORMANCE is not set
# CONFIG_PCIE_PTM is not set
# CONFIG_PCI_MSI is not set
CONFIG_PCI_QUIRKS=y
# CONFIG_PCI_DEBUG is not set
# CONFIG_PCI_STUB is not set
CONFIG_PCI_LOCKLESS_CONFIG=y
# CONFIG_PCI_IOV is not set
# CONFIG_PCI_PRI is not set
# CONFIG_PCI_PASID is not set
CONFIG_PCI_LABEL=y
# CONFIG_HOTPLUG_PCI is not set

#
# PCI controller drivers
#

#
# DesignWare PCI Core Support
#
# end of DesignWare PCI Core Support

#
# Mobiveil PCIe Core Support
#
# end of Mobiveil PCIe Core Support

#
# Cadence PCIe controllers support
#
# end of Cadence PCIe controllers support
# end of PCI controller drivers

#
# PCI Endpoint
#
# CONFIG_PCI_ENDPOINT is not set
# end of PCI Endpoint

#
# PCI switch controller drivers
#
# CONFIG_PCI_SW_SWITCHTEC is not set
# end of PCI switch controller drivers

CONFIG_PCCARD=m
CONFIG_PCMCIA=m
CONFIG_PCMCIA_LOAD_CIS=y
CONFIG_CARDBUS=y

#
# PC-card bridges
#
# CONFIG_YENTA is not set
# CONFIG_PD6729 is not set
# CONFIG_I82092 is not set
# CONFIG_RAPIDIO is not set

#
# Generic Driver Options
#
# CONFIG_UEVENT_HELPER is not set
CONFIG_DEVTMPFS=y
# CONFIG_DEVTMPFS_MOUNT is not set
CONFIG_STANDALONE=y
CONFIG_PREVENT_FIRMWARE_BUILD=y

#
# Firmware loader
#
CONFIG_FW_LOADER=y
CONFIG_FW_LOADER_PAGED_BUF=y
CONFIG_EXTRA_FIRMWARE=""
CONFIG_FW_LOADER_USER_HELPER=y
# CONFIG_FW_LOADER_USER_HELPER_FALLBACK is not set
# CONFIG_FW_LOADER_COMPRESS is not set
CONFIG_FW_CACHE=y
# end of Firmware loader

CONFIG_WANT_DEV_COREDUMP=y
CONFIG_ALLOW_DEV_COREDUMP=y
CONFIG_DEV_COREDUMP=y
# CONFIG_DEBUG_DRIVER is not set
# CONFIG_DEBUG_DEVRES is not set
# CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
# CONFIG_TEST_ASYNC_DRIVER_PROBE is not set
CONFIG_GENERIC_CPU_AUTOPROBE=y
CONFIG_GENERIC_CPU_VULNERABILITIES=y
CONFIG_REGMAP=y
CONFIG_REGMAP_I2C=y
CONFIG_REGMAP_SLIMBUS=m
CONFIG_REGMAP_SPI=m
CONFIG_REGMAP_MMIO=y
CONFIG_REGMAP_IRQ=y
CONFIG_REGMAP_SCCB=m
CONFIG_DMA_SHARED_BUFFER=y
# CONFIG_DMA_FENCE_TRACE is not set
# end of Generic Driver Options

#
# Bus devices
#
CONFIG_MHI_BUS=y
# CONFIG_MHI_BUS_DEBUG is not set
# end of Bus devices

CONFIG_CONNECTOR=m
CONFIG_GNSS=m
CONFIG_GNSS_SERIAL=m
CONFIG_GNSS_MTK_SERIAL=m
CONFIG_GNSS_SIRF_SERIAL=m
CONFIG_GNSS_UBX_SERIAL=m
# CONFIG_MTD is not set
# CONFIG_OF is not set
CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=y
CONFIG_PARPORT=y
CONFIG_PARPORT_PC=m
# CONFIG_PARPORT_SERIAL is not set
CONFIG_PARPORT_PC_FIFO=y
CONFIG_PARPORT_PC_SUPERIO=y
CONFIG_PARPORT_PC_PCMCIA=m
# CONFIG_PARPORT_AX88796 is not set
CONFIG_PARPORT_1284=y
CONFIG_PNP=y
# CONFIG_PNP_DEBUG_MESSAGES is not set

#
# Protocols
#
CONFIG_PNPACPI=y
CONFIG_BLK_DEV=y
# CONFIG_BLK_DEV_NULL_BLK is not set
# CONFIG_BLK_DEV_FD is not set
# CONFIG_PARIDE is not set
# CONFIG_BLK_DEV_PCIESSD_MTIP32XX is not set
# CONFIG_BLK_DEV_UMEM is not set
# CONFIG_BLK_DEV_LOOP is not set
# CONFIG_BLK_DEV_DRBD is not set
# CONFIG_BLK_DEV_NBD is not set
# CONFIG_BLK_DEV_SKD is not set
# CONFIG_BLK_DEV_SX8 is not set
# CONFIG_BLK_DEV_RAM is not set
# CONFIG_CDROM_PKTCDVD is not set
# CONFIG_ATA_OVER_ETH is not set
# CONFIG_VIRTIO_BLK is not set
# CONFIG_BLK_DEV_RBD is not set
# CONFIG_BLK_DEV_RSXX is not set

#
# NVME Support
#
CONFIG_NVME_CORE=m
# CONFIG_BLK_DEV_NVME is not set
# CONFIG_NVME_MULTIPATH is not set
CONFIG_NVME_FABRICS=m
# CONFIG_NVME_FC is not set
CONFIG_NVME_TCP=m
CONFIG_NVME_TARGET=y
CONFIG_NVME_TARGET_LOOP=m
CONFIG_NVME_TARGET_FC=y
CONFIG_NVME_TARGET_TCP=m
# end of NVME Support

#
# Misc devices
#
# CONFIG_AD525X_DPOT is not set
# CONFIG_DUMMY_IRQ is not set
# CONFIG_IBM_ASM is not set
# CONFIG_PHANTOM is not set
# CONFIG_TIFM_CORE is not set
CONFIG_ICS932S401=y
CONFIG_ENCLOSURE_SERVICES=y
# CONFIG_HP_ILO is not set
CONFIG_APDS9802ALS=m
# CONFIG_ISL29003 is not set
CONFIG_ISL29020=y
CONFIG_SENSORS_TSL2550=m
CONFIG_SENSORS_BH1770=y
CONFIG_SENSORS_APDS990X=y
CONFIG_HMC6352=m
CONFIG_DS1682=m
CONFIG_LATTICE_ECP3_CONFIG=m
CONFIG_SRAM=y
# CONFIG_PCI_ENDPOINT_TEST is not set
# CONFIG_XILINX_SDFEC is not set
CONFIG_PVPANIC=y
CONFIG_C2PORT=y
# CONFIG_C2PORT_DURAMAR_2150 is not set

#
# EEPROM support
#
CONFIG_EEPROM_AT24=y
CONFIG_EEPROM_AT25=m
# CONFIG_EEPROM_LEGACY is not set
CONFIG_EEPROM_MAX6875=y
# CONFIG_EEPROM_93CX6 is not set
# CONFIG_EEPROM_93XX46 is not set
# CONFIG_EEPROM_IDT_89HPESX is not set
# CONFIG_EEPROM_EE1004 is not set
# end of EEPROM support

# CONFIG_CB710_CORE is not set

#
# Texas Instruments shared transport line discipline
#
CONFIG_TI_ST=y
# end of Texas Instruments shared transport line discipline

# CONFIG_SENSORS_LIS3_I2C is not set
CONFIG_ALTERA_STAPL=m
# CONFIG_INTEL_MEI is not set
# CONFIG_INTEL_MEI_ME is not set
# CONFIG_INTEL_MEI_TXE is not set
# CONFIG_VMWARE_VMCI is not set
# CONFIG_GENWQE is not set
CONFIG_ECHO=m
# CONFIG_MISC_ALCOR_PCI is not set
# CONFIG_MISC_RTSX_PCI is not set
# CONFIG_HABANA_AI is not set
CONFIG_UACCE=m
# end of Misc devices

CONFIG_HAVE_IDE=y
# CONFIG_IDE is not set

#
# SCSI device support
#
CONFIG_SCSI_MOD=y
CONFIG_RAID_ATTRS=y
CONFIG_SCSI=y
CONFIG_SCSI_DMA=y
CONFIG_SCSI_NETLINK=y
# CONFIG_SCSI_PROC_FS is not set

#
# SCSI support type (disk, tape, CD-ROM)
#
CONFIG_BLK_DEV_SD=y
CONFIG_CHR_DEV_ST=y
# CONFIG_BLK_DEV_SR is not set
CONFIG_CHR_DEV_SG=m
CONFIG_CHR_DEV_SCH=m
CONFIG_SCSI_ENCLOSURE=y
# CONFIG_SCSI_CONSTANTS is not set
# CONFIG_SCSI_LOGGING is not set
CONFIG_SCSI_SCAN_ASYNC=y

#
# SCSI Transports
#
CONFIG_SCSI_SPI_ATTRS=m
CONFIG_SCSI_FC_ATTRS=m
CONFIG_SCSI_ISCSI_ATTRS=y
CONFIG_SCSI_SAS_ATTRS=y
# CONFIG_SCSI_SAS_LIBSAS is not set
CONFIG_SCSI_SRP_ATTRS=m
# end of SCSI Transports

CONFIG_SCSI_LOWLEVEL=y
CONFIG_ISCSI_TCP=y
# CONFIG_ISCSI_BOOT_SYSFS is not set
# CONFIG_SCSI_CXGB3_ISCSI is not set
# CONFIG_SCSI_CXGB4_ISCSI is not set
# CONFIG_SCSI_BNX2_ISCSI is not set
# CONFIG_BE2ISCSI is not set
# CONFIG_BLK_DEV_3W_XXXX_RAID is not set
# CONFIG_SCSI_HPSA is not set
# CONFIG_SCSI_3W_9XXX is not set
# CONFIG_SCSI_3W_SAS is not set
# CONFIG_SCSI_ACARD is not set
CONFIG_SCSI_AHA1740=m
# CONFIG_SCSI_AACRAID is not set
# CONFIG_SCSI_AIC7XXX is not set
# CONFIG_SCSI_AIC79XX is not set
# CONFIG_SCSI_AIC94XX is not set
# CONFIG_SCSI_MVSAS is not set
# CONFIG_SCSI_MVUMI is not set
# CONFIG_SCSI_DPT_I2O is not set
# CONFIG_SCSI_ADVANSYS is not set
# CONFIG_SCSI_ARCMSR is not set
# CONFIG_SCSI_ESAS2R is not set
# CONFIG_MEGARAID_NEWGEN is not set
# CONFIG_MEGARAID_LEGACY is not set
# CONFIG_MEGARAID_SAS is not set
# CONFIG_SCSI_MPT3SAS is not set
# CONFIG_SCSI_MPT2SAS is not set
# CONFIG_SCSI_SMARTPQI is not set
CONFIG_SCSI_UFSHCD=m
# CONFIG_SCSI_UFSHCD_PCI is not set
# CONFIG_SCSI_UFSHCD_PLATFORM is not set
# CONFIG_SCSI_UFS_BSG is not set
CONFIG_SCSI_UFS_CRYPTO=y
# CONFIG_SCSI_HPTIOP is not set
# CONFIG_SCSI_BUSLOGIC is not set
# CONFIG_SCSI_MYRB is not set
# CONFIG_SCSI_MYRS is not set
# CONFIG_VMWARE_PVSCSI is not set
CONFIG_LIBFC=m
# CONFIG_LIBFCOE is not set
# CONFIG_SCSI_SNIC is not set
# CONFIG_SCSI_DMX3191D is not set
# CONFIG_SCSI_FDOMAIN_PCI is not set
# CONFIG_SCSI_GDTH is not set
# CONFIG_SCSI_ISCI is not set
# CONFIG_SCSI_IPS is not set
# CONFIG_SCSI_INITIO is not set
# CONFIG_SCSI_INIA100 is not set
CONFIG_SCSI_PPA=m
CONFIG_SCSI_IMM=m
CONFIG_SCSI_IZIP_EPP16=y
CONFIG_SCSI_IZIP_SLOW_CTR=y
# CONFIG_SCSI_STEX is not set
# CONFIG_SCSI_SYM53C8XX_2 is not set
# CONFIG_SCSI_QLOGIC_1280 is not set
# CONFIG_SCSI_QLA_FC is not set
# CONFIG_SCSI_QLA_ISCSI is not set
CONFIG_SCSI_SIM710=m
# CONFIG_SCSI_DC395x is not set
# CONFIG_SCSI_AM53C974 is not set
# CONFIG_SCSI_WD719X is not set
# CONFIG_SCSI_DEBUG is not set
# CONFIG_SCSI_PMCRAID is not set
# CONFIG_SCSI_PM8001 is not set
# CONFIG_SCSI_BFA_FC is not set
CONFIG_SCSI_VIRTIO=m
# CONFIG_SCSI_CHELSIO_FCOE is not set
# CONFIG_SCSI_LOWLEVEL_PCMCIA is not set
CONFIG_SCSI_DH=y
# CONFIG_SCSI_DH_RDAC is not set
CONFIG_SCSI_DH_HP_SW=m
# CONFIG_SCSI_DH_EMC is not set
# CONFIG_SCSI_DH_ALUA is not set
# end of SCSI device support

# CONFIG_ATA is not set
# CONFIG_MD is not set
# CONFIG_TARGET_CORE is not set
# CONFIG_FUSION is not set

#
# IEEE 1394 (FireWire) support
#
CONFIG_FIREWIRE=m
# CONFIG_FIREWIRE_OHCI is not set
# CONFIG_FIREWIRE_SBP2 is not set
# CONFIG_FIREWIRE_NET is not set
# CONFIG_FIREWIRE_NOSY is not set
# end of IEEE 1394 (FireWire) support

# CONFIG_MACINTOSH_DRIVERS is not set
CONFIG_NETDEVICES=y
CONFIG_NET_CORE=y
# CONFIG_BONDING is not set
CONFIG_DUMMY=m
CONFIG_WIREGUARD=m
# CONFIG_WIREGUARD_DEBUG is not set
CONFIG_EQUALIZER=m
# CONFIG_NET_FC is not set
CONFIG_IFB=m
CONFIG_NET_TEAM=y
CONFIG_NET_TEAM_MODE_BROADCAST=y
CONFIG_NET_TEAM_MODE_ROUNDROBIN=m
# CONFIG_NET_TEAM_MODE_RANDOM is not set
CONFIG_NET_TEAM_MODE_ACTIVEBACKUP=y
CONFIG_NET_TEAM_MODE_LOADBALANCE=m
CONFIG_MACVLAN=m
# CONFIG_MACVTAP is not set
# CONFIG_IPVLAN is not set
# CONFIG_VXLAN is not set
CONFIG_GENEVE=m
CONFIG_BAREUDP=m
CONFIG_GTP=y
CONFIG_MACSEC=m
CONFIG_NETCONSOLE=m
# CONFIG_NETCONSOLE_DYNAMIC is not set
CONFIG_NETPOLL=y
CONFIG_NET_POLL_CONTROLLER=y
# CONFIG_TUN is not set
CONFIG_TUN_VNET_CROSS_LE=y
CONFIG_VETH=m
CONFIG_VIRTIO_NET=m
CONFIG_NLMON=m
# CONFIG_ARCNET is not set
CONFIG_ATM_DRIVERS=y
# CONFIG_ATM_DUMMY is not set
CONFIG_ATM_TCP=m
# CONFIG_ATM_LANAI is not set
# CONFIG_ATM_ENI is not set
# CONFIG_ATM_FIRESTREAM is not set
# CONFIG_ATM_ZATM is not set
# CONFIG_ATM_NICSTAR is not set
# CONFIG_ATM_IDT77252 is not set
# CONFIG_ATM_AMBASSADOR is not set
# CONFIG_ATM_HORIZON is not set
# CONFIG_ATM_IA is not set
# CONFIG_ATM_FORE200E is not set
# CONFIG_ATM_HE is not set
# CONFIG_ATM_SOLOS is not set
CONFIG_CAIF_DRIVERS=y
# CONFIG_CAIF_TTY is not set
# CONFIG_CAIF_HSI is not set
CONFIG_CAIF_VIRTIO=m

#
# Distributed Switch Architecture drivers
#
CONFIG_B53=m
# CONFIG_B53_SPI_DRIVER is not set
# CONFIG_B53_MDIO_DRIVER is not set
CONFIG_B53_MMAP_DRIVER=m
# CONFIG_B53_SRAB_DRIVER is not set
CONFIG_B53_SERDES=m
CONFIG_NET_DSA_BCM_SF2=m
CONFIG_NET_DSA_LOOP=m
CONFIG_NET_DSA_LANTIQ_GSWIP=m
CONFIG_NET_DSA_MT7530=m
# CONFIG_NET_DSA_MV88E6060 is not set
# CONFIG_NET_DSA_MICROCHIP_KSZ9477 is not set
# CONFIG_NET_DSA_MICROCHIP_KSZ8795 is not set
CONFIG_NET_DSA_MV88E6XXX=m
CONFIG_NET_DSA_MV88E6XXX_GLOBAL2=y
# CONFIG_NET_DSA_MSCC_SEVILLE is not set
CONFIG_NET_DSA_AR9331=m
CONFIG_NET_DSA_SJA1105=m
# CONFIG_NET_DSA_QCA8K is not set
# CONFIG_NET_DSA_REALTEK_SMI is not set
CONFIG_NET_DSA_SMSC_LAN9303=m
CONFIG_NET_DSA_SMSC_LAN9303_I2C=m
# CONFIG_NET_DSA_SMSC_LAN9303_MDIO is not set
CONFIG_NET_DSA_VITESSE_VSC73XX=m
CONFIG_NET_DSA_VITESSE_VSC73XX_SPI=m
# CONFIG_NET_DSA_VITESSE_VSC73XX_PLATFORM is not set
# end of Distributed Switch Architecture drivers

CONFIG_ETHERNET=y
CONFIG_NET_VENDOR_3COM=y
# CONFIG_EL3 is not set
# CONFIG_PCMCIA_3C574 is not set
# CONFIG_PCMCIA_3C589 is not set
# CONFIG_VORTEX is not set
# CONFIG_TYPHOON is not set
CONFIG_NET_VENDOR_ADAPTEC=y
# CONFIG_ADAPTEC_STARFIRE is not set
CONFIG_NET_VENDOR_AGERE=y
# CONFIG_ET131X is not set
CONFIG_NET_VENDOR_ALACRITECH=y
# CONFIG_SLICOSS is not set
CONFIG_NET_VENDOR_ALTEON=y
# CONFIG_ACENIC is not set
# CONFIG_ALTERA_TSE is not set
CONFIG_NET_VENDOR_AMAZON=y
# CONFIG_NET_VENDOR_AMD is not set
CONFIG_NET_VENDOR_AQUANTIA=y
# CONFIG_AQTION is not set
CONFIG_NET_VENDOR_ARC=y
CONFIG_NET_VENDOR_ATHEROS=y
# CONFIG_ATL2 is not set
# CONFIG_ATL1 is not set
# CONFIG_ATL1E is not set
# CONFIG_ATL1C is not set
# CONFIG_ALX is not set
CONFIG_NET_VENDOR_AURORA=y
# CONFIG_AURORA_NB8800 is not set
CONFIG_NET_VENDOR_BROADCOM=y
# CONFIG_B44 is not set
# CONFIG_BCMGENET is not set
# CONFIG_BNX2 is not set
# CONFIG_CNIC is not set
# CONFIG_TIGON3 is not set
# CONFIG_BNX2X is not set
# CONFIG_SYSTEMPORT is not set
# CONFIG_BNXT is not set
CONFIG_NET_VENDOR_BROCADE=y
# CONFIG_BNA is not set
CONFIG_NET_VENDOR_CADENCE=y
# CONFIG_MACB is not set
CONFIG_NET_VENDOR_CAVIUM=y
# CONFIG_THUNDER_NIC_PF is not set
# CONFIG_THUNDER_NIC_VF is not set
# CONFIG_THUNDER_NIC_BGX is not set
# CONFIG_THUNDER_NIC_RGX is not set
# CONFIG_LIQUIDIO is not set
CONFIG_NET_VENDOR_CHELSIO=y
# CONFIG_CHELSIO_T1 is not set
# CONFIG_CHELSIO_T3 is not set
# CONFIG_CHELSIO_T4 is not set
# CONFIG_CHELSIO_T4VF is not set
CONFIG_NET_VENDOR_CIRRUS=y
# CONFIG_CS89x0 is not set
CONFIG_NET_VENDOR_CISCO=y
# CONFIG_ENIC is not set
CONFIG_NET_VENDOR_CORTINA=y
# CONFIG_CX_ECAT is not set
# CONFIG_DNET is not set
CONFIG_NET_VENDOR_DEC=y
# CONFIG_NET_TULIP is not set
CONFIG_NET_VENDOR_DLINK=y
# CONFIG_DL2K is not set
# CONFIG_SUNDANCE is not set
CONFIG_NET_VENDOR_EMULEX=y
# CONFIG_BE2NET is not set
CONFIG_NET_VENDOR_EZCHIP=y
CONFIG_NET_VENDOR_FUJITSU=y
# CONFIG_PCMCIA_FMVJ18X is not set
CONFIG_NET_VENDOR_GOOGLE=y
CONFIG_NET_VENDOR_HUAWEI=y
CONFIG_NET_VENDOR_I825XX=y
CONFIG_NET_VENDOR_INTEL=y
# CONFIG_E100 is not set
CONFIG_E1000=y
# CONFIG_E1000E is not set
# CONFIG_IGB is not set
# CONFIG_IGBVF is not set
# CONFIG_IXGB is not set
# CONFIG_IXGBE is not set
# CONFIG_I40E is not set
# CONFIG_IGC is not set
# CONFIG_JME is not set
CONFIG_NET_VENDOR_MARVELL=y
# CONFIG_MVMDIO is not set
# CONFIG_SKGE is not set
# CONFIG_SKY2 is not set
# CONFIG_PRESTERA is not set
CONFIG_NET_VENDOR_MELLANOX=y
# CONFIG_MLX4_EN is not set
# CONFIG_MLX5_CORE is not set
# CONFIG_MLXSW_CORE is not set
# CONFIG_MLXFW is not set
CONFIG_NET_VENDOR_MICREL=y
# CONFIG_KS8851 is not set
# CONFIG_KSZ884X_PCI is not set
CONFIG_NET_VENDOR_MICROCHIP=y
# CONFIG_ENC28J60 is not set
# CONFIG_ENCX24J600 is not set
# CONFIG_LAN743X is not set
CONFIG_NET_VENDOR_MICROSEMI=y
CONFIG_NET_VENDOR_MYRI=y
# CONFIG_MYRI10GE is not set
# CONFIG_FEALNX is not set
CONFIG_NET_VENDOR_NATSEMI=y
# CONFIG_NATSEMI is not set
# CONFIG_NS83820 is not set
CONFIG_NET_VENDOR_NETERION=y
# CONFIG_S2IO is not set
# CONFIG_VXGE is not set
CONFIG_NET_VENDOR_NETRONOME=y
CONFIG_NET_VENDOR_NI=y
# CONFIG_NI_XGE_MANAGEMENT_ENET is not set
CONFIG_NET_VENDOR_8390=y
# CONFIG_PCMCIA_AXNET is not set
# CONFIG_NE2K_PCI is not set
# CONFIG_PCMCIA_PCNET is not set
CONFIG_NET_VENDOR_NVIDIA=y
# CONFIG_FORCEDETH is not set
CONFIG_NET_VENDOR_OKI=y
# CONFIG_ETHOC is not set
CONFIG_NET_VENDOR_PACKET_ENGINES=y
# CONFIG_HAMACHI is not set
# CONFIG_YELLOWFIN is not set
CONFIG_NET_VENDOR_PENSANDO=y
# CONFIG_IONIC is not set
CONFIG_NET_VENDOR_QLOGIC=y
# CONFIG_QLA3XXX is not set
# CONFIG_QLCNIC is not set
# CONFIG_NETXEN_NIC is not set
# CONFIG_QED is not set
CONFIG_NET_VENDOR_QUALCOMM=y
# CONFIG_QCOM_EMAC is not set
# CONFIG_RMNET is not set
CONFIG_NET_VENDOR_RDC=y
# CONFIG_R6040 is not set
CONFIG_NET_VENDOR_REALTEK=y
# CONFIG_ATP is not set
# CONFIG_8139CP is not set
# CONFIG_8139TOO is not set
# CONFIG_R8169 is not set
CONFIG_NET_VENDOR_RENESAS=y
CONFIG_NET_VENDOR_ROCKER=y
# CONFIG_ROCKER is not set
CONFIG_NET_VENDOR_SAMSUNG=y
# CONFIG_SXGBE_ETH is not set
CONFIG_NET_VENDOR_SEEQ=y
CONFIG_NET_VENDOR_SOLARFLARE=y
# CONFIG_SFC is not set
# CONFIG_SFC_FALCON is not set
CONFIG_NET_VENDOR_SILAN=y
# CONFIG_SC92031 is not set
CONFIG_NET_VENDOR_SIS=y
# CONFIG_SIS900 is not set
# CONFIG_SIS190 is not set
CONFIG_NET_VENDOR_SMSC=y
# CONFIG_PCMCIA_SMC91C92 is not set
# CONFIG_EPIC100 is not set
# CONFIG_SMSC911X is not set
# CONFIG_SMSC9420 is not set
CONFIG_NET_VENDOR_SOCIONEXT=y
CONFIG_NET_VENDOR_STMICRO=y
# CONFIG_STMMAC_ETH is not set
CONFIG_NET_VENDOR_SUN=y
# CONFIG_HAPPYMEAL is not set
# CONFIG_SUNGEM is not set
# CONFIG_CASSINI is not set
# CONFIG_NIU is not set
CONFIG_NET_VENDOR_SYNOPSYS=y
# CONFIG_DWC_XLGMAC is not set
CONFIG_NET_VENDOR_TEHUTI=y
# CONFIG_TEHUTI is not set
CONFIG_NET_VENDOR_TI=y
# CONFIG_TI_CPSW_PHY_SEL is not set
# CONFIG_TLAN is not set
CONFIG_NET_VENDOR_VIA=y
# CONFIG_VIA_RHINE is not set
# CONFIG_VIA_VELOCITY is not set
CONFIG_NET_VENDOR_WIZNET=y
# CONFIG_WIZNET_W5100 is not set
# CONFIG_WIZNET_W5300 is not set
CONFIG_NET_VENDOR_XILINX=y
# CONFIG_XILINX_AXI_EMAC is not set
# CONFIG_XILINX_LL_TEMAC is not set
CONFIG_NET_VENDOR_XIRCOM=y
# CONFIG_PCMCIA_XIRC2PS is not set
# CONFIG_FDDI is not set
# CONFIG_HIPPI is not set
CONFIG_NET_SB1000=y
CONFIG_PHYLINK=m
CONFIG_PHYLIB=y
CONFIG_SWPHY=y
CONFIG_LED_TRIGGER_PHY=y
CONFIG_FIXED_PHY=y
CONFIG_SFP=m

#
# MII PHY device drivers
#
# CONFIG_AMD_PHY is not set
CONFIG_ADIN_PHY=y
# CONFIG_AQUANTIA_PHY is not set
# CONFIG_AX88796B_PHY is not set
CONFIG_BROADCOM_PHY=y
CONFIG_BCM54140_PHY=m
CONFIG_BCM7XXX_PHY=y
CONFIG_BCM84881_PHY=y
CONFIG_BCM87XX_PHY=y
CONFIG_BCM_NET_PHYLIB=y
CONFIG_CICADA_PHY=y
CONFIG_CORTINA_PHY=y
CONFIG_DAVICOM_PHY=y
CONFIG_ICPLUS_PHY=m
CONFIG_LXT_PHY=y
# CONFIG_INTEL_XWAY_PHY is not set
CONFIG_LSI_ET1011C_PHY=y
# CONFIG_MARVELL_PHY is not set
CONFIG_MARVELL_10G_PHY=m
CONFIG_MICREL_PHY=m
CONFIG_MICROCHIP_PHY=y
CONFIG_MICROCHIP_T1_PHY=m
CONFIG_MICROSEMI_PHY=m
CONFIG_NATIONAL_PHY=y
# CONFIG_AT803X_PHY is not set
CONFIG_QSEMI_PHY=y
CONFIG_REALTEK_PHY=m
CONFIG_RENESAS_PHY=y
CONFIG_ROCKCHIP_PHY=y
CONFIG_SMSC_PHY=m
# CONFIG_STE10XP is not set
# CONFIG_TERANETICS_PHY is not set
CONFIG_DP83822_PHY=y
CONFIG_DP83TC811_PHY=y
CONFIG_DP83848_PHY=y
CONFIG_DP83867_PHY=m
CONFIG_DP83869_PHY=m
CONFIG_VITESSE_PHY=m
CONFIG_XILINX_GMII2RGMII=y
CONFIG_MICREL_KS8995MA=m
CONFIG_MDIO_DEVICE=y
CONFIG_MDIO_BUS=y
CONFIG_MDIO_DEVRES=y
CONFIG_MDIO_BITBANG=y
CONFIG_MDIO_BCM_UNIMAC=m
# CONFIG_MDIO_GPIO is not set
CONFIG_MDIO_I2C=m
CONFIG_MDIO_MSCC_MIIM=y
# CONFIG_MDIO_THUNDER is not set

#
# MDIO Multiplexers
#

#
# PCS device drivers
#
CONFIG_PCS_XPCS=m
# end of PCS device drivers

CONFIG_PLIP=y
CONFIG_PPP=m
CONFIG_PPP_BSDCOMP=m
# CONFIG_PPP_DEFLATE is not set
# CONFIG_PPP_FILTER is not set
# CONFIG_PPP_MPPE is not set
CONFIG_PPP_MULTILINK=y
CONFIG_PPPOATM=m
CONFIG_PPPOE=m
CONFIG_PPTP=m
CONFIG_PPP_ASYNC=m
CONFIG_PPP_SYNC_TTY=m
# CONFIG_SLIP is not set
CONFIG_SLHC=m

#
# Host-side USB support is needed for USB Network Adapter support
#
# CONFIG_WLAN is not set

#
# Enable WiMAX (Networking options) to see the WiMAX drivers
#
CONFIG_WAN=y
# CONFIG_HDLC is not set
# CONFIG_DLCI is not set
# CONFIG_SBNI is not set
# CONFIG_VMXNET3 is not set
CONFIG_FUJITSU_ES=y
CONFIG_NETDEVSIM=m
CONFIG_NET_FAILOVER=m
# CONFIG_ISDN is not set
# CONFIG_NVM is not set

#
# Input device support
#
CONFIG_INPUT=y
CONFIG_INPUT_LEDS=m
CONFIG_INPUT_FF_MEMLESS=y
# CONFIG_INPUT_POLLDEV is not set
CONFIG_INPUT_SPARSEKMAP=y
CONFIG_INPUT_MATRIXKMAP=y

#
# Userland interfaces
#
# CONFIG_INPUT_MOUSEDEV is not set
# CONFIG_INPUT_JOYDEV is not set
CONFIG_INPUT_EVDEV=y
CONFIG_INPUT_EVBUG=m

#
# Input Device Drivers
#
CONFIG_INPUT_KEYBOARD=y
# CONFIG_KEYBOARD_ADP5588 is not set
# CONFIG_KEYBOARD_ADP5589 is not set
CONFIG_KEYBOARD_ATKBD=y
# CONFIG_KEYBOARD_QT1050 is not set
# CONFIG_KEYBOARD_QT1070 is not set
# CONFIG_KEYBOARD_QT2160 is not set
# CONFIG_KEYBOARD_DLINK_DIR685 is not set
# CONFIG_KEYBOARD_LKKBD is not set
# CONFIG_KEYBOARD_GPIO is not set
# CONFIG_KEYBOARD_GPIO_POLLED is not set
# CONFIG_KEYBOARD_TCA6416 is not set
# CONFIG_KEYBOARD_TCA8418 is not set
# CONFIG_KEYBOARD_MATRIX is not set
# CONFIG_KEYBOARD_LM8323 is not set
# CONFIG_KEYBOARD_LM8333 is not set
# CONFIG_KEYBOARD_MAX7359 is not set
# CONFIG_KEYBOARD_MCS is not set
# CONFIG_KEYBOARD_MPR121 is not set
# CONFIG_KEYBOARD_NEWTON is not set
# CONFIG_KEYBOARD_OPENCORES is not set
# CONFIG_KEYBOARD_SAMSUNG is not set
# CONFIG_KEYBOARD_GOLDFISH_EVENTS is not set
# CONFIG_KEYBOARD_STOWAWAY is not set
# CONFIG_KEYBOARD_SUNKBD is not set
# CONFIG_KEYBOARD_IQS62X is not set
# CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
# CONFIG_KEYBOARD_TWL4030 is not set
# CONFIG_KEYBOARD_XTKBD is not set
# CONFIG_KEYBOARD_MTK_PMIC is not set
# CONFIG_INPUT_MOUSE is not set
# CONFIG_INPUT_JOYSTICK is not set
CONFIG_INPUT_TABLET=y
# CONFIG_TABLET_USB_ACECAD is not set
# CONFIG_TABLET_USB_AIPTEK is not set
# CONFIG_TABLET_USB_HANWANG is not set
# CONFIG_TABLET_USB_KBTAB is not set
# CONFIG_TABLET_USB_PEGASUS is not set
CONFIG_TABLET_SERIAL_WACOM4=m
# CONFIG_INPUT_TOUCHSCREEN is not set
CONFIG_INPUT_MISC=y
CONFIG_INPUT_88PM860X_ONKEY=m
# CONFIG_INPUT_88PM80X_ONKEY is not set
# CONFIG_INPUT_AD714X is not set
CONFIG_INPUT_ARIZONA_HAPTICS=m
CONFIG_INPUT_BMA150=m
CONFIG_INPUT_E3X0_BUTTON=y
CONFIG_INPUT_PCSPKR=y
# CONFIG_INPUT_MAX77693_HAPTIC is not set
CONFIG_INPUT_MAX8997_HAPTIC=y
CONFIG_INPUT_MC13783_PWRBUTTON=m
CONFIG_INPUT_MMA8450=m
CONFIG_INPUT_APANEL=y
CONFIG_INPUT_GPIO_BEEPER=y
CONFIG_INPUT_GPIO_DECODER=m
CONFIG_INPUT_GPIO_VIBRA=y
CONFIG_INPUT_ATLAS_BTNS=m
# CONFIG_INPUT_ATI_REMOTE2 is not set
# CONFIG_INPUT_KEYSPAN_REMOTE is not set
CONFIG_INPUT_KXTJ9=y
# CONFIG_INPUT_POWERMATE is not set
# CONFIG_INPUT_YEALINK is not set
# CONFIG_INPUT_CM109 is not set
CONFIG_INPUT_REGULATOR_HAPTIC=y
CONFIG_INPUT_AXP20X_PEK=m
CONFIG_INPUT_TWL4030_PWRBUTTON=m
CONFIG_INPUT_TWL4030_VIBRA=m
CONFIG_INPUT_TWL6040_VIBRA=m
CONFIG_INPUT_UINPUT=m
# CONFIG_INPUT_PCF8574 is not set
# CONFIG_INPUT_PWM_BEEPER is not set
# CONFIG_INPUT_PWM_VIBRA is not set
# CONFIG_INPUT_GPIO_ROTARY_ENCODER is not set
# CONFIG_INPUT_DA9052_ONKEY is not set
CONFIG_INPUT_DA9055_ONKEY=y
# CONFIG_INPUT_DA9063_ONKEY is not set
# CONFIG_INPUT_WM831X_ON is not set
# CONFIG_INPUT_PCAP is not set
# CONFIG_INPUT_ADXL34X is not set
# CONFIG_INPUT_IQS269A is not set
# CONFIG_INPUT_CMA3000 is not set
# CONFIG_INPUT_IDEAPAD_SLIDEBAR is not set
CONFIG_INPUT_DRV260X_HAPTICS=m
CONFIG_INPUT_DRV2665_HAPTICS=y
# CONFIG_INPUT_DRV2667_HAPTICS is not set
# CONFIG_INPUT_RAVE_SP_PWRBUTTON is not set
CONFIG_RMI4_CORE=y
CONFIG_RMI4_I2C=m
CONFIG_RMI4_SPI=y
CONFIG_RMI4_SMB=m
# CONFIG_RMI4_F03 is not set
# CONFIG_RMI4_F11 is not set
# CONFIG_RMI4_F12 is not set
CONFIG_RMI4_F30=y
CONFIG_RMI4_F34=y
CONFIG_RMI4_F3A=y
# CONFIG_RMI4_F54 is not set
# CONFIG_RMI4_F55 is not set

#
# Hardware I/O ports
#
CONFIG_SERIO=y
CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=y
CONFIG_SERIO_I8042=y
CONFIG_SERIO_SERPORT=m
CONFIG_SERIO_CT82C710=m
CONFIG_SERIO_PARKBD=m
# CONFIG_SERIO_PCIPS2 is not set
CONFIG_SERIO_LIBPS2=y
CONFIG_SERIO_RAW=m
# CONFIG_SERIO_ALTERA_PS2 is not set
# CONFIG_SERIO_PS2MULT is not set
CONFIG_SERIO_ARC_PS2=m
CONFIG_SERIO_GPIO_PS2=m
CONFIG_USERIO=m
# CONFIG_GAMEPORT is not set
# end of Hardware I/O ports
# end of Input device support

#
# Character devices
#
CONFIG_TTY=y
CONFIG_VT=y
CONFIG_CONSOLE_TRANSLATIONS=y
CONFIG_VT_CONSOLE=y
CONFIG_VT_CONSOLE_SLEEP=y
CONFIG_HW_CONSOLE=y
CONFIG_VT_HW_CONSOLE_BINDING=y
CONFIG_UNIX98_PTYS=y
CONFIG_LEGACY_PTYS=y
CONFIG_LEGACY_PTY_COUNT=256
# CONFIG_LDISC_AUTOLOAD is not set

#
# Serial drivers
#
CONFIG_SERIAL_EARLYCON=y
CONFIG_SERIAL_8250=y
CONFIG_SERIAL_8250_DEPRECATED_OPTIONS=y
CONFIG_SERIAL_8250_PNP=y
# CONFIG_SERIAL_8250_16550A_VARIANTS is not set
# CONFIG_SERIAL_8250_FINTEK is not set
CONFIG_SERIAL_8250_CONSOLE=y
CONFIG_SERIAL_8250_PCI=y
CONFIG_SERIAL_8250_EXAR=y
# CONFIG_SERIAL_8250_CS is not set
# CONFIG_SERIAL_8250_MEN_MCB is not set
CONFIG_SERIAL_8250_NR_UARTS=4
CONFIG_SERIAL_8250_RUNTIME_UARTS=4
# CONFIG_SERIAL_8250_EXTENDED is not set
CONFIG_SERIAL_8250_DWLIB=y
# CONFIG_SERIAL_8250_DW is not set
# CONFIG_SERIAL_8250_RT288X is not set
CONFIG_SERIAL_8250_LPSS=y
CONFIG_SERIAL_8250_MID=y

#
# Non-8250 serial port support
#
CONFIG_SERIAL_MAX3100=m
# CONFIG_SERIAL_MAX310X is not set
# CONFIG_SERIAL_UARTLITE is not set
CONFIG_SERIAL_CORE=y
CONFIG_SERIAL_CORE_CONSOLE=y
# CONFIG_SERIAL_JSM is not set
CONFIG_SERIAL_LANTIQ=m
# CONFIG_SERIAL_SCCNXP is not set
CONFIG_SERIAL_SC16IS7XX_CORE=m
CONFIG_SERIAL_SC16IS7XX=m
CONFIG_SERIAL_SC16IS7XX_I2C=y
CONFIG_SERIAL_SC16IS7XX_SPI=y
# CONFIG_SERIAL_ALTERA_JTAGUART is not set
# CONFIG_SERIAL_ALTERA_UART is not set
# CONFIG_SERIAL_IFX6X60 is not set
CONFIG_SERIAL_ARC=m
CONFIG_SERIAL_ARC_NR_PORTS=1
# CONFIG_SERIAL_RP2 is not set
CONFIG_SERIAL_FSL_LPUART=y
CONFIG_SERIAL_FSL_LPUART_CONSOLE=y
CONFIG_SERIAL_FSL_LINFLEXUART=y
CONFIG_SERIAL_FSL_LINFLEXUART_CONSOLE=y
CONFIG_SERIAL_MEN_Z135=m
# CONFIG_SERIAL_SPRD is not set
# end of Serial drivers

CONFIG_SERIAL_MCTRL_GPIO=y
# CONFIG_SERIAL_NONSTANDARD is not set
# CONFIG_GOLDFISH_TTY is not set
# CONFIG_N_GSM is not set
# CONFIG_NOZOMI is not set
# CONFIG_NULL_TTY is not set
# CONFIG_TRACE_SINK is not set
CONFIG_SERIAL_DEV_BUS=y
# CONFIG_SERIAL_DEV_CTRL_TTYPORT is not set
# CONFIG_PRINTER is not set
CONFIG_PPDEV=m
# CONFIG_VIRTIO_CONSOLE is not set
# CONFIG_IPMI_HANDLER is not set
# CONFIG_IPMB_DEVICE_INTERFACE is not set
CONFIG_HW_RANDOM=m
# CONFIG_HW_RANDOM_TIMERIOMEM is not set
CONFIG_HW_RANDOM_INTEL=m
# CONFIG_HW_RANDOM_AMD is not set
CONFIG_HW_RANDOM_BA431=m
# CONFIG_HW_RANDOM_VIA is not set
CONFIG_HW_RANDOM_VIRTIO=m
# CONFIG_HW_RANDOM_XIPHERA is not set
# CONFIG_APPLICOM is not set

#
# PCMCIA character devices
#
# CONFIG_SYNCLINK_CS is not set
# CONFIG_CARDMAN_4000 is not set
# CONFIG_CARDMAN_4040 is not set
# CONFIG_SCR24X is not set
CONFIG_IPWIRELESS=m
# end of PCMCIA character devices

# CONFIG_MWAVE is not set
# CONFIG_DEVMEM is not set
# CONFIG_DEVKMEM is not set
# CONFIG_NVRAM is not set
# CONFIG_RAW_DRIVER is not set
CONFIG_DEVPORT=y
# CONFIG_HPET is not set
CONFIG_HANGCHECK_TIMER=m
# CONFIG_TCG_TPM is not set
# CONFIG_TELCLOCK is not set
# CONFIG_XILLYBUS is not set
# end of Character devices

CONFIG_RANDOM_TRUST_CPU=y
CONFIG_RANDOM_TRUST_BOOTLOADER=y

#
# I2C support
#
CONFIG_I2C=y
# CONFIG_ACPI_I2C_OPREGION is not set
CONFIG_I2C_BOARDINFO=y
# CONFIG_I2C_COMPAT is not set
CONFIG_I2C_CHARDEV=y
# CONFIG_I2C_MUX is not set
# CONFIG_I2C_HELPER_AUTO is not set
CONFIG_I2C_SMBUS=y

#
# I2C Algorithms
#
CONFIG_I2C_ALGOBIT=y
CONFIG_I2C_ALGOPCF=y
CONFIG_I2C_ALGOPCA=m
# end of I2C Algorithms

#
# I2C Hardware Bus support
#

#
# PC SMBus host controller drivers
#
# CONFIG_I2C_ALI1535 is not set
# CONFIG_I2C_ALI1563 is not set
# CONFIG_I2C_ALI15X3 is not set
# CONFIG_I2C_AMD756 is not set
# CONFIG_I2C_AMD8111 is not set
# CONFIG_I2C_AMD_MP2 is not set
# CONFIG_I2C_I801 is not set
# CONFIG_I2C_ISCH is not set
# CONFIG_I2C_ISMT is not set
# CONFIG_I2C_PIIX4 is not set
CONFIG_I2C_CHT_WC=m
# CONFIG_I2C_NFORCE2 is not set
# CONFIG_I2C_NVIDIA_GPU is not set
# CONFIG_I2C_SIS5595 is not set
# CONFIG_I2C_SIS630 is not set
# CONFIG_I2C_SIS96X is not set
# CONFIG_I2C_VIA is not set
# CONFIG_I2C_VIAPRO is not set

#
# ACPI drivers
#
CONFIG_I2C_SCMI=m

#
# I2C system bus drivers (mostly embedded / system-on-chip)
#
# CONFIG_I2C_CBUS_GPIO is not set
CONFIG_I2C_DESIGNWARE_CORE=y
# CONFIG_I2C_DESIGNWARE_SLAVE is not set
CONFIG_I2C_DESIGNWARE_PLATFORM=y
# CONFIG_I2C_DESIGNWARE_PCI is not set
CONFIG_I2C_EMEV2=y
# CONFIG_I2C_GPIO is not set
CONFIG_I2C_KEMPLD=y
# CONFIG_I2C_OCORES is not set
# CONFIG_I2C_PCA_PLATFORM is not set
CONFIG_I2C_SIMTEC=y
CONFIG_I2C_XILINX=m

#
# External I2C/SMBus adapter drivers
#
CONFIG_I2C_PARPORT=y
# CONFIG_I2C_TAOS_EVM is not set

#
# Other I2C/SMBus bus drivers
#
CONFIG_I2C_MLXCPLD=m
# end of I2C Hardware Bus support

# CONFIG_I2C_STUB is not set
CONFIG_I2C_SLAVE=y
CONFIG_I2C_SLAVE_EEPROM=y
CONFIG_I2C_SLAVE_TESTUNIT=m
# CONFIG_I2C_DEBUG_CORE is not set
# CONFIG_I2C_DEBUG_ALGO is not set
# CONFIG_I2C_DEBUG_BUS is not set
# end of I2C support

CONFIG_I3C=y
CONFIG_CDNS_I3C_MASTER=y
# CONFIG_DW_I3C_MASTER is not set
CONFIG_SPI=y
# CONFIG_SPI_DEBUG is not set
CONFIG_SPI_MASTER=y
# CONFIG_SPI_MEM is not set

#
# SPI Master Controller Drivers
#
CONFIG_SPI_ALTERA=y
CONFIG_SPI_AXI_SPI_ENGINE=y
CONFIG_SPI_BITBANG=y
CONFIG_SPI_BUTTERFLY=y
CONFIG_SPI_CADENCE=y
CONFIG_SPI_DESIGNWARE=m
# CONFIG_SPI_DW_DMA is not set
# CONFIG_SPI_DW_PCI is not set
# CONFIG_SPI_DW_MMIO is not set
CONFIG_SPI_NXP_FLEXSPI=m
CONFIG_SPI_GPIO=y
# CONFIG_SPI_LM70_LLP is not set
# CONFIG_SPI_LANTIQ_SSC is not set
CONFIG_SPI_OC_TINY=m
CONFIG_SPI_PXA2XX=y
CONFIG_SPI_PXA2XX_PCI=y
CONFIG_SPI_ROCKCHIP=y
# CONFIG_SPI_SC18IS602 is not set
CONFIG_SPI_SIFIVE=m
# CONFIG_SPI_MXIC is not set
# CONFIG_SPI_XCOMM is not set
CONFIG_SPI_XILINX=m
CONFIG_SPI_ZYNQMP_GQSPI=y
# CONFIG_SPI_AMD is not set

#
# SPI Multiplexer support
#
CONFIG_SPI_MUX=y

#
# SPI Protocol Masters
#
CONFIG_SPI_SPIDEV=y
# CONFIG_SPI_LOOPBACK_TEST is not set
# CONFIG_SPI_TLE62X0 is not set
# CONFIG_SPI_SLAVE is not set
CONFIG_SPI_DYNAMIC=y
CONFIG_SPMI=y
CONFIG_HSI=m
CONFIG_HSI_BOARDINFO=y

#
# HSI controllers
#

#
# HSI clients
#
CONFIG_HSI_CHAR=m
CONFIG_PPS=m
# CONFIG_PPS_DEBUG is not set
CONFIG_NTP_PPS=y

#
# PPS clients support
#
# CONFIG_PPS_CLIENT_KTIMER is not set
# CONFIG_PPS_CLIENT_LDISC is not set
# CONFIG_PPS_CLIENT_PARPORT is not set
# CONFIG_PPS_CLIENT_GPIO is not set

#
# PPS generators support
#

#
# PTP clock support
#
# CONFIG_PTP_1588_CLOCK is not set
# end of PTP clock support

CONFIG_PINCTRL=y
CONFIG_PINMUX=y
CONFIG_PINCONF=y
CONFIG_GENERIC_PINCONF=y
# CONFIG_DEBUG_PINCTRL is not set
# CONFIG_PINCTRL_AMD is not set
CONFIG_PINCTRL_DA9062=m
# CONFIG_PINCTRL_MCP23S08 is not set
# CONFIG_PINCTRL_SX150X is not set
# CONFIG_PINCTRL_BAYTRAIL is not set
# CONFIG_PINCTRL_CHERRYVIEW is not set
# CONFIG_PINCTRL_LYNXPOINT is not set
CONFIG_PINCTRL_INTEL=y
CONFIG_PINCTRL_BROXTON=m
CONFIG_PINCTRL_CANNONLAKE=y
# CONFIG_PINCTRL_CEDARFORK is not set
CONFIG_PINCTRL_DENVERTON=y
CONFIG_PINCTRL_EMMITSBURG=y
CONFIG_PINCTRL_GEMINILAKE=y
# CONFIG_PINCTRL_ICELAKE is not set
CONFIG_PINCTRL_JASPERLAKE=m
# CONFIG_PINCTRL_LEWISBURG is not set
# CONFIG_PINCTRL_SUNRISEPOINT is not set
CONFIG_PINCTRL_TIGERLAKE=m

#
# Renesas pinctrl drivers
#
# end of Renesas pinctrl drivers

CONFIG_GPIOLIB=y
CONFIG_GPIOLIB_FASTPATH_LIMIT=512
CONFIG_GPIO_ACPI=y
CONFIG_GPIOLIB_IRQCHIP=y
CONFIG_DEBUG_GPIO=y
# CONFIG_GPIO_SYSFS is not set
CONFIG_GPIO_CDEV=y
CONFIG_GPIO_CDEV_V1=y
CONFIG_GPIO_GENERIC=y

#
# Memory mapped GPIO drivers
#
# CONFIG_GPIO_AMDPT is not set
CONFIG_GPIO_DWAPB=y
# CONFIG_GPIO_EXAR is not set
# CONFIG_GPIO_GENERIC_PLATFORM is not set
# CONFIG_GPIO_ICH is not set
CONFIG_GPIO_MB86S7X=m
CONFIG_GPIO_MENZ127=m
CONFIG_GPIO_SIOX=m
# CONFIG_GPIO_VX855 is not set
# CONFIG_GPIO_XILINX is not set
# CONFIG_GPIO_AMD_FCH is not set
# end of Memory mapped GPIO drivers

#
# Port-mapped I/O GPIO drivers
#
CONFIG_GPIO_F7188X=m
CONFIG_GPIO_IT87=y
# CONFIG_GPIO_SCH is not set
CONFIG_GPIO_SCH311X=y
CONFIG_GPIO_WINBOND=m
CONFIG_GPIO_WS16C48=y
# end of Port-mapped I/O GPIO drivers

#
# I2C GPIO expanders
#
# CONFIG_GPIO_ADP5588 is not set
# CONFIG_GPIO_MAX7300 is not set
# CONFIG_GPIO_MAX732X is not set
CONFIG_GPIO_PCA953X=m
CONFIG_GPIO_PCA953X_IRQ=y
CONFIG_GPIO_PCA9570=m
# CONFIG_GPIO_PCF857X is not set
CONFIG_GPIO_TPIC2810=y
# end of I2C GPIO expanders

#
# MFD GPIO expanders
#
CONFIG_GPIO_ARIZONA=m
CONFIG_GPIO_BD9571MWV=m
CONFIG_GPIO_CRYSTAL_COVE=m
CONFIG_GPIO_DA9052=m
CONFIG_GPIO_DA9055=m
CONFIG_GPIO_KEMPLD=y
CONFIG_GPIO_LP873X=m
CONFIG_GPIO_RC5T583=y
# CONFIG_GPIO_TPS65086 is not set
# CONFIG_GPIO_TPS6586X is not set
CONFIG_GPIO_TQMX86=y
# CONFIG_GPIO_TWL4030 is not set
CONFIG_GPIO_TWL6040=m
# CONFIG_GPIO_WM831X is not set
CONFIG_GPIO_WM8350=y
CONFIG_GPIO_WM8994=m
# end of MFD GPIO expanders

#
# PCI GPIO expanders
#
# CONFIG_GPIO_AMD8111 is not set
# CONFIG_GPIO_BT8XX is not set
# CONFIG_GPIO_ML_IOH is not set
# CONFIG_GPIO_PCI_IDIO_16 is not set
# CONFIG_GPIO_PCIE_IDIO_24 is not set
# CONFIG_GPIO_RDC321X is not set
# end of PCI GPIO expanders

#
# SPI GPIO expanders
#
CONFIG_GPIO_MAX3191X=m
# CONFIG_GPIO_MAX7301 is not set
CONFIG_GPIO_MC33880=y
CONFIG_GPIO_PISOSR=y
CONFIG_GPIO_XRA1403=m
# end of SPI GPIO expanders

CONFIG_GPIO_AGGREGATOR=m
# CONFIG_GPIO_MOCKUP is not set
CONFIG_W1=y
CONFIG_W1_CON=y

#
# 1-wire Bus Masters
#
# CONFIG_W1_MASTER_MATROX is not set
CONFIG_W1_MASTER_DS2482=m
# CONFIG_W1_MASTER_DS1WM is not set
CONFIG_W1_MASTER_GPIO=m
CONFIG_W1_MASTER_SGI=m
# end of 1-wire Bus Masters

#
# 1-wire Slaves
#
CONFIG_W1_SLAVE_THERM=y
# CONFIG_W1_SLAVE_SMEM is not set
CONFIG_W1_SLAVE_DS2405=y
CONFIG_W1_SLAVE_DS2408=m
# CONFIG_W1_SLAVE_DS2408_READBACK is not set
CONFIG_W1_SLAVE_DS2413=y
CONFIG_W1_SLAVE_DS2406=m
CONFIG_W1_SLAVE_DS2423=y
CONFIG_W1_SLAVE_DS2805=y
CONFIG_W1_SLAVE_DS2430=y
CONFIG_W1_SLAVE_DS2431=m
CONFIG_W1_SLAVE_DS2433=m
# CONFIG_W1_SLAVE_DS2433_CRC is not set
CONFIG_W1_SLAVE_DS2438=m
CONFIG_W1_SLAVE_DS250X=m
CONFIG_W1_SLAVE_DS2780=y
CONFIG_W1_SLAVE_DS2781=y
CONFIG_W1_SLAVE_DS28E04=y
CONFIG_W1_SLAVE_DS28E17=m
# end of 1-wire Slaves

# CONFIG_POWER_RESET is not set
CONFIG_POWER_SUPPLY=y
# CONFIG_POWER_SUPPLY_DEBUG is not set
# CONFIG_PDA_POWER is not set
# CONFIG_WM831X_BACKUP is not set
# CONFIG_WM831X_POWER is not set
# CONFIG_WM8350_POWER is not set
# CONFIG_TEST_POWER is not set
# CONFIG_BATTERY_88PM860X is not set
CONFIG_CHARGER_ADP5061=y
CONFIG_BATTERY_CW2015=y
CONFIG_BATTERY_DS2760=y
CONFIG_BATTERY_DS2780=y
# CONFIG_BATTERY_DS2781 is not set
# CONFIG_BATTERY_DS2782 is not set
CONFIG_BATTERY_SBS=m
CONFIG_CHARGER_SBS=m
# CONFIG_BATTERY_BQ27XXX is not set
# CONFIG_BATTERY_DA9030 is not set
CONFIG_BATTERY_DA9052=y
# CONFIG_BATTERY_MAX17040 is not set
# CONFIG_BATTERY_MAX17042 is not set
# CONFIG_BATTERY_MAX1721X is not set
# CONFIG_CHARGER_MAX8903 is not set
# CONFIG_CHARGER_LP8727 is not set
# CONFIG_CHARGER_GPIO is not set
CONFIG_CHARGER_MANAGER=y
CONFIG_CHARGER_LT3651=m
CONFIG_CHARGER_MAX8998=m
# CONFIG_CHARGER_BQ2415X is not set
# CONFIG_CHARGER_BQ24190 is not set
CONFIG_CHARGER_BQ24257=y
# CONFIG_CHARGER_BQ24735 is not set
CONFIG_CHARGER_BQ2515X=m
CONFIG_CHARGER_BQ25890=m
CONFIG_CHARGER_BQ25980=m
CONFIG_CHARGER_SMB347=m
# CONFIG_CHARGER_TPS65090 is not set
# CONFIG_BATTERY_GAUGE_LTC2941 is not set
# CONFIG_BATTERY_GOLDFISH is not set
# CONFIG_BATTERY_RT5033 is not set
CONFIG_CHARGER_RT9455=m
CONFIG_CHARGER_BD99954=m
# CONFIG_HWMON is not set
CONFIG_THERMAL=y
CONFIG_THERMAL_NETLINK=y
CONFIG_THERMAL_STATISTICS=y
CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=0
# CONFIG_THERMAL_WRITABLE_TRIPS is not set
CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=y
# CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
# CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
# CONFIG_THERMAL_GOV_FAIR_SHARE is not set
CONFIG_THERMAL_GOV_STEP_WISE=y
CONFIG_THERMAL_GOV_BANG_BANG=y
CONFIG_THERMAL_GOV_USER_SPACE=y
CONFIG_DEVFREQ_THERMAL=y
CONFIG_THERMAL_EMULATION=y

#
# Intel thermal drivers
#
# CONFIG_INTEL_POWERCLAMP is not set
# CONFIG_INTEL_SOC_DTS_THERMAL is not set

#
# ACPI INT340X thermal drivers
#
# CONFIG_INT340X_THERMAL is not set
# end of ACPI INT340X thermal drivers

# CONFIG_INTEL_PCH_THERMAL is not set
# end of Intel thermal drivers

# CONFIG_WATCHDOG is not set
CONFIG_SSB_POSSIBLE=y
CONFIG_SSB=y
CONFIG_SSB_SPROM=y
CONFIG_SSB_PCIHOST_POSSIBLE=y
CONFIG_SSB_PCIHOST=y
CONFIG_SSB_DRIVER_PCICORE_POSSIBLE=y
# CONFIG_SSB_DRIVER_PCICORE is not set
# CONFIG_SSB_DRIVER_GPIO is not set
CONFIG_BCMA_POSSIBLE=y
CONFIG_BCMA=y
CONFIG_BCMA_HOST_PCI_POSSIBLE=y
CONFIG_BCMA_HOST_PCI=y
CONFIG_BCMA_HOST_SOC=y
CONFIG_BCMA_DRIVER_PCI=y
# CONFIG_BCMA_SFLASH is not set
# CONFIG_BCMA_DRIVER_GMAC_CMN is not set
# CONFIG_BCMA_DRIVER_GPIO is not set
# CONFIG_BCMA_DEBUG is not set

#
# Multifunction device drivers
#
CONFIG_MFD_CORE=y
CONFIG_MFD_AS3711=y
# CONFIG_PMIC_ADP5520 is not set
CONFIG_MFD_AAT2870_CORE=y
CONFIG_MFD_BCM590XX=y
CONFIG_MFD_BD9571MWV=m
CONFIG_MFD_AXP20X=y
CONFIG_MFD_AXP20X_I2C=y
# CONFIG_MFD_MADERA is not set
CONFIG_PMIC_DA903X=y
CONFIG_PMIC_DA9052=y
# CONFIG_MFD_DA9052_SPI is not set
CONFIG_MFD_DA9052_I2C=y
CONFIG_MFD_DA9055=y
CONFIG_MFD_DA9062=m
# CONFIG_MFD_DA9063 is not set
# CONFIG_MFD_DA9150 is not set
CONFIG_MFD_MC13XXX=m
# CONFIG_MFD_MC13XXX_SPI is not set
CONFIG_MFD_MC13XXX_I2C=m
CONFIG_MFD_MP2629=m
# CONFIG_HTC_PASIC3 is not set
# CONFIG_HTC_I2CPLD is not set
# CONFIG_MFD_INTEL_QUARK_I2C_GPIO is not set
# CONFIG_LPC_ICH is not set
# CONFIG_LPC_SCH is not set
CONFIG_INTEL_SOC_PMIC=y
CONFIG_INTEL_SOC_PMIC_CHTWC=y
CONFIG_INTEL_SOC_PMIC_CHTDC_TI=m
# CONFIG_INTEL_SOC_PMIC_MRFLD is not set
CONFIG_MFD_INTEL_LPSS=y
CONFIG_MFD_INTEL_LPSS_ACPI=y
# CONFIG_MFD_INTEL_LPSS_PCI is not set
# CONFIG_MFD_INTEL_MSIC is not set
# CONFIG_MFD_INTEL_PMC_BXT is not set
CONFIG_MFD_IQS62X=m
# CONFIG_MFD_JANZ_CMODIO is not set
CONFIG_MFD_KEMPLD=y
CONFIG_MFD_88PM800=y
# CONFIG_MFD_88PM805 is not set
CONFIG_MFD_88PM860X=y
# CONFIG_MFD_MAX14577 is not set
# CONFIG_MFD_MAX77693 is not set
CONFIG_MFD_MAX77843=y
CONFIG_MFD_MAX8907=m
# CONFIG_MFD_MAX8925 is not set
CONFIG_MFD_MAX8997=y
CONFIG_MFD_MAX8998=y
# CONFIG_MFD_MT6360 is not set
CONFIG_MFD_MT6397=m
CONFIG_MFD_MENF21BMC=y
CONFIG_EZX_PCAP=y
# CONFIG_MFD_RETU is not set
# CONFIG_MFD_PCF50633 is not set
# CONFIG_MFD_RDC321X is not set
CONFIG_MFD_RT5033=m
CONFIG_MFD_RC5T583=y
# CONFIG_MFD_SEC_CORE is not set
CONFIG_MFD_SI476X_CORE=m
CONFIG_MFD_SM501=y
CONFIG_MFD_SM501_GPIO=y
# CONFIG_MFD_SKY81452 is not set
CONFIG_ABX500_CORE=y
# CONFIG_AB3100_CORE is not set
CONFIG_MFD_SYSCON=y
CONFIG_MFD_TI_AM335X_TSCADC=y
# CONFIG_MFD_LP3943 is not set
# CONFIG_MFD_LP8788 is not set
CONFIG_MFD_TI_LMU=y
# CONFIG_MFD_PALMAS is not set
CONFIG_TPS6105X=y
# CONFIG_TPS65010 is not set
CONFIG_TPS6507X=m
CONFIG_MFD_TPS65086=y
CONFIG_MFD_TPS65090=y
# CONFIG_MFD_TPS68470 is not set
CONFIG_MFD_TI_LP873X=m
CONFIG_MFD_TPS6586X=y
# CONFIG_MFD_TPS65910 is not set
# CONFIG_MFD_TPS65912_I2C is not set
# CONFIG_MFD_TPS65912_SPI is not set
# CONFIG_MFD_TPS80031 is not set
CONFIG_TWL4030_CORE=y
CONFIG_MFD_TWL4030_AUDIO=y
CONFIG_TWL6040_CORE=y
# CONFIG_MFD_WL1273_CORE is not set
# CONFIG_MFD_LM3533 is not set
CONFIG_MFD_TQMX86=y
# CONFIG_MFD_VX855 is not set
CONFIG_MFD_ARIZONA=y
CONFIG_MFD_ARIZONA_I2C=m
# CONFIG_MFD_ARIZONA_SPI is not set
CONFIG_MFD_CS47L24=y
CONFIG_MFD_WM5102=y
CONFIG_MFD_WM5110=y
# CONFIG_MFD_WM8997 is not set
# CONFIG_MFD_WM8998 is not set
CONFIG_MFD_WM8400=y
CONFIG_MFD_WM831X=y
CONFIG_MFD_WM831X_I2C=y
# CONFIG_MFD_WM831X_SPI is not set
CONFIG_MFD_WM8350=y
CONFIG_MFD_WM8350_I2C=y
CONFIG_MFD_WM8994=m
CONFIG_MFD_WCD934X=m
CONFIG_RAVE_SP_CORE=y
# CONFIG_MFD_INTEL_M10_BMC is not set
# end of Multifunction device drivers

CONFIG_REGULATOR=y
# CONFIG_REGULATOR_DEBUG is not set
CONFIG_REGULATOR_FIXED_VOLTAGE=y
# CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
# CONFIG_REGULATOR_USERSPACE_CONSUMER is not set
CONFIG_REGULATOR_88PG86X=y
# CONFIG_REGULATOR_88PM800 is not set
CONFIG_REGULATOR_88PM8607=y
CONFIG_REGULATOR_ACT8865=m
CONFIG_REGULATOR_AD5398=y
CONFIG_REGULATOR_AAT2870=m
# CONFIG_REGULATOR_ARIZONA_LDO1 is not set
CONFIG_REGULATOR_ARIZONA_MICSUPP=m
# CONFIG_REGULATOR_AS3711 is not set
CONFIG_REGULATOR_AXP20X=m
CONFIG_REGULATOR_BCM590XX=y
# CONFIG_REGULATOR_BD9571MWV is not set
CONFIG_REGULATOR_DA9052=y
CONFIG_REGULATOR_DA9055=y
CONFIG_REGULATOR_DA9062=m
CONFIG_REGULATOR_DA9210=y
# CONFIG_REGULATOR_DA9211 is not set
CONFIG_REGULATOR_FAN53555=y
CONFIG_REGULATOR_GPIO=y
CONFIG_REGULATOR_ISL9305=y
CONFIG_REGULATOR_ISL6271A=m
CONFIG_REGULATOR_LM363X=y
# CONFIG_REGULATOR_LP3971 is not set
CONFIG_REGULATOR_LP3972=m
CONFIG_REGULATOR_LP872X=m
CONFIG_REGULATOR_LP8755=m
# CONFIG_REGULATOR_LTC3589 is not set
CONFIG_REGULATOR_LTC3676=m
CONFIG_REGULATOR_MAX1586=m
# CONFIG_REGULATOR_MAX8649 is not set
CONFIG_REGULATOR_MAX8660=m
# CONFIG_REGULATOR_MAX8907 is not set
# CONFIG_REGULATOR_MAX8952 is not set
# CONFIG_REGULATOR_MAX8997 is not set
CONFIG_REGULATOR_MAX8998=m
CONFIG_REGULATOR_MAX77693=m
CONFIG_REGULATOR_MAX77826=y
CONFIG_REGULATOR_MC13XXX_CORE=m
# CONFIG_REGULATOR_MC13783 is not set
CONFIG_REGULATOR_MC13892=m
# CONFIG_REGULATOR_MP8859 is not set
# CONFIG_REGULATOR_MT6311 is not set
# CONFIG_REGULATOR_MT6323 is not set
CONFIG_REGULATOR_MT6358=m
# CONFIG_REGULATOR_MT6397 is not set
CONFIG_REGULATOR_PCA9450=y
CONFIG_REGULATOR_PCAP=m
# CONFIG_REGULATOR_PFUZE100 is not set
# CONFIG_REGULATOR_PV88060 is not set
CONFIG_REGULATOR_PV88080=y
CONFIG_REGULATOR_PV88090=m
CONFIG_REGULATOR_PWM=y
CONFIG_REGULATOR_QCOM_SPMI=m
# CONFIG_REGULATOR_QCOM_USB_VBUS is not set
# CONFIG_REGULATOR_RASPBERRYPI_TOUCHSCREEN_ATTINY is not set
# CONFIG_REGULATOR_RC5T583 is not set
CONFIG_REGULATOR_RT4801=y
CONFIG_REGULATOR_RT5033=m
# CONFIG_REGULATOR_RTMV20 is not set
CONFIG_REGULATOR_SLG51000=y
CONFIG_REGULATOR_TPS51632=m
CONFIG_REGULATOR_TPS6105X=m
CONFIG_REGULATOR_TPS62360=y
# CONFIG_REGULATOR_TPS65023 is not set
# CONFIG_REGULATOR_TPS6507X is not set
CONFIG_REGULATOR_TPS65086=m
# CONFIG_REGULATOR_TPS65090 is not set
# CONFIG_REGULATOR_TPS65132 is not set
CONFIG_REGULATOR_TPS6524X=m
# CONFIG_REGULATOR_TPS6586X is not set
CONFIG_REGULATOR_TWL4030=y
CONFIG_REGULATOR_WM831X=m
CONFIG_REGULATOR_WM8350=m
CONFIG_REGULATOR_WM8400=y
# CONFIG_REGULATOR_WM8994 is not set
CONFIG_REGULATOR_QCOM_LABIBB=y
CONFIG_RC_CORE=y
CONFIG_RC_MAP=y
CONFIG_LIRC=y
CONFIG_BPF_LIRC_MODE2=y
# CONFIG_RC_DECODERS is not set
CONFIG_RC_DEVICES=y
# CONFIG_RC_ATI_REMOTE is not set
# CONFIG_IR_ENE is not set
# CONFIG_IR_IMON is not set
# CONFIG_IR_IMON_RAW is not set
# CONFIG_IR_MCEUSB is not set
# CONFIG_IR_ITE_CIR is not set
CONFIG_IR_FINTEK=m
CONFIG_IR_NUVOTON=y
# CONFIG_IR_REDRAT3 is not set
# CONFIG_IR_STREAMZAP is not set
CONFIG_IR_WINBOND_CIR=m
# CONFIG_IR_IGORPLUGUSB is not set
# CONFIG_IR_IGUANA is not set
# CONFIG_IR_TTUSBIR is not set
CONFIG_RC_LOOPBACK=m
CONFIG_IR_SERIAL=m
# CONFIG_IR_SERIAL_TRANSMITTER is not set
# CONFIG_IR_SIR is not set
# CONFIG_RC_XBOX_DVD is not set
# CONFIG_IR_TOY is not set
CONFIG_CEC_CORE=m
CONFIG_CEC_NOTIFIER=y
CONFIG_MEDIA_CEC_RC=y
CONFIG_MEDIA_CEC_SUPPORT=y
# CONFIG_CEC_CH7322 is not set
# CONFIG_CEC_SECO is not set
# CONFIG_USB_PULSE8_CEC is not set
# CONFIG_USB_RAINSHADOW_CEC is not set
CONFIG_MEDIA_SUPPORT=y
CONFIG_MEDIA_SUPPORT_FILTER=y
# CONFIG_MEDIA_SUBDRV_AUTOSELECT is not set

#
# Media device types
#
CONFIG_MEDIA_CAMERA_SUPPORT=y
CONFIG_MEDIA_ANALOG_TV_SUPPORT=y
# CONFIG_MEDIA_DIGITAL_TV_SUPPORT is not set
# CONFIG_MEDIA_RADIO_SUPPORT is not set
CONFIG_MEDIA_SDR_SUPPORT=y
CONFIG_MEDIA_PLATFORM_SUPPORT=y
# CONFIG_MEDIA_TEST_SUPPORT is not set
# end of Media device types

CONFIG_VIDEO_DEV=y
CONFIG_MEDIA_CONTROLLER=y

#
# Video4Linux options
#
CONFIG_VIDEO_V4L2=y
CONFIG_VIDEO_V4L2_I2C=y
CONFIG_VIDEO_V4L2_SUBDEV_API=y
CONFIG_VIDEO_ADV_DEBUG=y
# CONFIG_VIDEO_FIXED_MINOR_RANGES is not set
CONFIG_V4L2_FLASH_LED_CLASS=m
CONFIG_V4L2_FWNODE=y
# end of Video4Linux options

#
# Media controller options
#
# end of Media controller options

#
# Media drivers
#

#
# Drivers filtered as selected at 'Filter media drivers'
#
# CONFIG_MEDIA_PCI_SUPPORT is not set
CONFIG_VIDEOBUF2_CORE=y
CONFIG_VIDEOBUF2_V4L2=y
CONFIG_VIDEOBUF2_MEMOPS=y
CONFIG_VIDEOBUF2_VMALLOC=y
# CONFIG_V4L_PLATFORM_DRIVERS is not set
# CONFIG_V4L_MEM2MEM_DRIVERS is not set
# CONFIG_SDR_PLATFORM_DRIVERS is not set
# end of Media drivers

#
# Media ancillary drivers
#
CONFIG_MEDIA_ATTACH=y
CONFIG_VIDEO_IR_I2C=y

#
# Audio decoders, processors and mixers
#
CONFIG_VIDEO_TVAUDIO=y
# CONFIG_VIDEO_TDA7432 is not set
CONFIG_VIDEO_TDA9840=y
CONFIG_VIDEO_TDA1997X=m
CONFIG_VIDEO_TEA6415C=m
# CONFIG_VIDEO_TEA6420 is not set
CONFIG_VIDEO_MSP3400=m
CONFIG_VIDEO_CS3308=y
CONFIG_VIDEO_CS5345=m
CONFIG_VIDEO_CS53L32A=y
CONFIG_VIDEO_TLV320AIC23B=y
CONFIG_VIDEO_UDA1342=m
# CONFIG_VIDEO_WM8775 is not set
CONFIG_VIDEO_WM8739=m
CONFIG_VIDEO_VP27SMPX=y
CONFIG_VIDEO_SONY_BTF_MPX=m
# end of Audio decoders, processors and mixers

#
# RDS decoders
#
CONFIG_VIDEO_SAA6588=y
# end of RDS decoders

#
# Video decoders
#
# CONFIG_VIDEO_ADV7180 is not set
CONFIG_VIDEO_ADV7183=m
CONFIG_VIDEO_ADV7604=m
# CONFIG_VIDEO_ADV7604_CEC is not set
# CONFIG_VIDEO_ADV7842 is not set
CONFIG_VIDEO_BT819=y
CONFIG_VIDEO_BT856=y
CONFIG_VIDEO_BT866=m
CONFIG_VIDEO_KS0127=y
# CONFIG_VIDEO_ML86V7667 is not set
# CONFIG_VIDEO_SAA7110 is not set
# CONFIG_VIDEO_SAA711X is not set
CONFIG_VIDEO_TC358743=m
# CONFIG_VIDEO_TC358743_CEC is not set
# CONFIG_VIDEO_TVP514X is not set
# CONFIG_VIDEO_TVP5150 is not set
CONFIG_VIDEO_TVP7002=m
# CONFIG_VIDEO_TW2804 is not set
# CONFIG_VIDEO_TW9903 is not set
CONFIG_VIDEO_TW9906=m
CONFIG_VIDEO_TW9910=m
CONFIG_VIDEO_VPX3220=m

#
# Video and audio decoders
#
CONFIG_VIDEO_SAA717X=y
CONFIG_VIDEO_CX25840=y
# end of Video decoders

#
# Video encoders
#
CONFIG_VIDEO_SAA7127=y
# CONFIG_VIDEO_SAA7185 is not set
CONFIG_VIDEO_ADV7170=y
# CONFIG_VIDEO_ADV7175 is not set
# CONFIG_VIDEO_ADV7343 is not set
# CONFIG_VIDEO_ADV7393 is not set
CONFIG_VIDEO_ADV7511=m
# CONFIG_VIDEO_ADV7511_CEC is not set
# CONFIG_VIDEO_AD9389B is not set
CONFIG_VIDEO_AK881X=m
# CONFIG_VIDEO_THS8200 is not set
# end of Video encoders

#
# Video improvement chips
#
CONFIG_VIDEO_UPD64031A=y
# CONFIG_VIDEO_UPD64083 is not set
# end of Video improvement chips

#
# Audio/Video compression chips
#
CONFIG_VIDEO_SAA6752HS=m
# end of Audio/Video compression chips

#
# SDR tuner chips
#
# CONFIG_SDR_MAX2175 is not set
# end of SDR tuner chips

#
# Miscellaneous helper chips
#
CONFIG_VIDEO_THS7303=y
# CONFIG_VIDEO_M52790 is not set
CONFIG_VIDEO_I2C=y
# CONFIG_VIDEO_ST_MIPID02 is not set
# end of Miscellaneous helper chips

#
# Camera sensor devices
#
CONFIG_VIDEO_HI556=m
CONFIG_VIDEO_IMX214=y
CONFIG_VIDEO_IMX219=m
# CONFIG_VIDEO_IMX258 is not set
CONFIG_VIDEO_IMX274=m
# CONFIG_VIDEO_IMX290 is not set
# CONFIG_VIDEO_IMX319 is not set
CONFIG_VIDEO_IMX355=y
CONFIG_VIDEO_OV2640=y
# CONFIG_VIDEO_OV2659 is not set
# CONFIG_VIDEO_OV2680 is not set
CONFIG_VIDEO_OV2685=m
# CONFIG_VIDEO_OV2740 is not set
# CONFIG_VIDEO_OV5647 is not set
# CONFIG_VIDEO_OV6650 is not set
CONFIG_VIDEO_OV5670=m
CONFIG_VIDEO_OV5675=m
CONFIG_VIDEO_OV5695=y
CONFIG_VIDEO_OV7251=y
CONFIG_VIDEO_OV772X=m
CONFIG_VIDEO_OV7640=y
CONFIG_VIDEO_OV7670=m
# CONFIG_VIDEO_OV7740 is not set
# CONFIG_VIDEO_OV8856 is not set
CONFIG_VIDEO_OV9640=y
# CONFIG_VIDEO_OV9650 is not set
# CONFIG_VIDEO_OV13858 is not set
# CONFIG_VIDEO_VS6624 is not set
# CONFIG_VIDEO_MT9M001 is not set
# CONFIG_VIDEO_MT9M032 is not set
# CONFIG_VIDEO_MT9M111 is not set
# CONFIG_VIDEO_MT9P031 is not set
# CONFIG_VIDEO_MT9T001 is not set
CONFIG_VIDEO_MT9T112=y
CONFIG_VIDEO_MT9V011=m
CONFIG_VIDEO_MT9V032=y
CONFIG_VIDEO_MT9V111=m
# CONFIG_VIDEO_SR030PC30 is not set
# CONFIG_VIDEO_NOON010PC30 is not set
# CONFIG_VIDEO_M5MOLS is not set
CONFIG_VIDEO_RDACM20=m
CONFIG_VIDEO_RJ54N1=m
# CONFIG_VIDEO_S5K6AA is not set
CONFIG_VIDEO_S5K6A3=m
# CONFIG_VIDEO_S5K4ECGX is not set
CONFIG_VIDEO_S5K5BAF=y
# CONFIG_VIDEO_SMIAPP is not set
# CONFIG_VIDEO_ET8EK8 is not set
# CONFIG_VIDEO_S5C73M3 is not set
# end of Camera sensor devices

#
# Lens drivers
#
CONFIG_VIDEO_AD5820=y
CONFIG_VIDEO_AK7375=y
CONFIG_VIDEO_DW9714=m
CONFIG_VIDEO_DW9768=m
CONFIG_VIDEO_DW9807_VCM=y
# end of Lens drivers

#
# Flash devices
#
CONFIG_VIDEO_ADP1653=m
# CONFIG_VIDEO_LM3560 is not set
CONFIG_VIDEO_LM3646=m
# end of Flash devices

#
# SPI helper chips
#
CONFIG_VIDEO_GS1662=y
# end of SPI helper chips

#
# Media SPI Adapters
#
# end of Media SPI Adapters

CONFIG_MEDIA_TUNER=y

#
# Customize TV tuners
#
CONFIG_MEDIA_TUNER_SIMPLE=y
CONFIG_MEDIA_TUNER_TDA18250=y
CONFIG_MEDIA_TUNER_TDA8290=m
CONFIG_MEDIA_TUNER_TDA827X=m
CONFIG_MEDIA_TUNER_TDA18271=m
CONFIG_MEDIA_TUNER_TDA9887=y
# CONFIG_MEDIA_TUNER_TEA5761 is not set
CONFIG_MEDIA_TUNER_TEA5767=y
CONFIG_MEDIA_TUNER_MSI001=y
CONFIG_MEDIA_TUNER_MT20XX=y
CONFIG_MEDIA_TUNER_MT2060=y
CONFIG_MEDIA_TUNER_MT2063=y
# CONFIG_MEDIA_TUNER_MT2266 is not set
# CONFIG_MEDIA_TUNER_MT2131 is not set
CONFIG_MEDIA_TUNER_QT1010=m
CONFIG_MEDIA_TUNER_XC2028=m
CONFIG_MEDIA_TUNER_XC5000=m
CONFIG_MEDIA_TUNER_XC4000=y
CONFIG_MEDIA_TUNER_MXL5005S=m
CONFIG_MEDIA_TUNER_MXL5007T=m
CONFIG_MEDIA_TUNER_MC44S803=y
CONFIG_MEDIA_TUNER_MAX2165=y
# CONFIG_MEDIA_TUNER_TDA18218 is not set
# CONFIG_MEDIA_TUNER_FC0011 is not set
# CONFIG_MEDIA_TUNER_FC0012 is not set
CONFIG_MEDIA_TUNER_FC0013=m
CONFIG_MEDIA_TUNER_TDA18212=y
CONFIG_MEDIA_TUNER_E4000=y
CONFIG_MEDIA_TUNER_FC2580=y
# CONFIG_MEDIA_TUNER_M88RS6000T is not set
# CONFIG_MEDIA_TUNER_TUA9001 is not set
CONFIG_MEDIA_TUNER_SI2157=m
CONFIG_MEDIA_TUNER_IT913X=m
# CONFIG_MEDIA_TUNER_R820T is not set
CONFIG_MEDIA_TUNER_MXL301RF=y
CONFIG_MEDIA_TUNER_QM1D1C0042=m
CONFIG_MEDIA_TUNER_QM1D1B0004=m
# end of Customize TV tuners
# end of Media ancillary drivers

#
# Graphics support
#
# CONFIG_AGP is not set
CONFIG_VGA_ARB=y
CONFIG_VGA_ARB_MAX_GPUS=16
# CONFIG_VGA_SWITCHEROO is not set
CONFIG_DRM=y
CONFIG_DRM_MIPI_DBI=y
CONFIG_DRM_DP_AUX_CHARDEV=y
# CONFIG_DRM_DEBUG_MM is not set
# CONFIG_DRM_DEBUG_SELFTEST is not set
CONFIG_DRM_KMS_HELPER=y
CONFIG_DRM_KMS_FB_HELPER=y
CONFIG_DRM_FBDEV_EMULATION=y
CONFIG_DRM_FBDEV_OVERALLOC=100
# CONFIG_DRM_LOAD_EDID_FIRMWARE is not set
# CONFIG_DRM_DP_CEC is not set
CONFIG_DRM_GEM_CMA_HELPER=y
CONFIG_DRM_KMS_CMA_HELPER=y
CONFIG_DRM_SCHED=y

#
# I2C encoder or helper chips
#
# CONFIG_DRM_I2C_CH7006 is not set
# CONFIG_DRM_I2C_SIL164 is not set
CONFIG_DRM_I2C_NXP_TDA998X=m
CONFIG_DRM_I2C_NXP_TDA9950=m
# end of I2C encoder or helper chips

#
# ARM devices
#
# end of ARM devices

# CONFIG_DRM_RADEON is not set
# CONFIG_DRM_AMDGPU is not set
# CONFIG_DRM_NOUVEAU is not set
# CONFIG_DRM_I915 is not set
# CONFIG_DRM_VGEM is not set
# CONFIG_DRM_VKMS is not set
# CONFIG_DRM_VMWGFX is not set
# CONFIG_DRM_GMA500 is not set
# CONFIG_DRM_AST is not set
# CONFIG_DRM_MGAG200 is not set
# CONFIG_DRM_QXL is not set
# CONFIG_DRM_BOCHS is not set
CONFIG_DRM_PANEL=y

#
# Display Panels
#
# end of Display Panels

CONFIG_DRM_BRIDGE=y
CONFIG_DRM_PANEL_BRIDGE=y

#
# Display Interface Bridges
#
CONFIG_DRM_ANALOGIX_ANX78XX=y
CONFIG_DRM_ANALOGIX_DP=y
# end of Display Interface Bridges

CONFIG_DRM_ETNAVIV=y
CONFIG_DRM_ETNAVIV_THERMAL=y
# CONFIG_DRM_CIRRUS_QEMU is not set
CONFIG_TINYDRM_HX8357D=y
CONFIG_TINYDRM_ILI9225=m
CONFIG_TINYDRM_ILI9341=m
CONFIG_TINYDRM_ILI9486=m
CONFIG_TINYDRM_MI0283QT=m
CONFIG_TINYDRM_REPAPER=y
CONFIG_TINYDRM_ST7586=y
CONFIG_TINYDRM_ST7735R=y
# CONFIG_DRM_VBOXVIDEO is not set
# CONFIG_DRM_LEGACY is not set
CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=y

#
# Frame buffer Devices
#
CONFIG_FB_CMDLINE=y
CONFIG_FB_NOTIFY=y
CONFIG_FB=y
# CONFIG_FIRMWARE_EDID is not set
CONFIG_FB_BOOT_VESA_SUPPORT=y
CONFIG_FB_CFB_FILLRECT=y
CONFIG_FB_CFB_COPYAREA=y
CONFIG_FB_CFB_IMAGEBLIT=y
CONFIG_FB_SYS_FILLRECT=y
CONFIG_FB_SYS_COPYAREA=y
CONFIG_FB_SYS_IMAGEBLIT=y
CONFIG_FB_FOREIGN_ENDIAN=y
CONFIG_FB_BOTH_ENDIAN=y
# CONFIG_FB_BIG_ENDIAN is not set
# CONFIG_FB_LITTLE_ENDIAN is not set
CONFIG_FB_SYS_FOPS=y
CONFIG_FB_DEFERRED_IO=y
CONFIG_FB_HECUBA=y
CONFIG_FB_BACKLIGHT=y
CONFIG_FB_MODE_HELPERS=y
# CONFIG_FB_TILEBLITTING is not set

#
# Frame buffer hardware drivers
#
# CONFIG_FB_CIRRUS is not set
# CONFIG_FB_PM2 is not set
# CONFIG_FB_CYBER2000 is not set
CONFIG_FB_ARC=m
# CONFIG_FB_ASILIANT is not set
# CONFIG_FB_IMSTT is not set
# CONFIG_FB_VGA16 is not set
CONFIG_FB_UVESA=m
CONFIG_FB_VESA=y
CONFIG_FB_N411=y
CONFIG_FB_HGA=y
CONFIG_FB_OPENCORES=y
# CONFIG_FB_S1D13XXX is not set
# CONFIG_FB_NVIDIA is not set
# CONFIG_FB_RIVA is not set
# CONFIG_FB_I740 is not set
# CONFIG_FB_LE80578 is not set
# CONFIG_FB_MATROX is not set
# CONFIG_FB_RADEON is not set
# CONFIG_FB_ATY128 is not set
# CONFIG_FB_ATY is not set
# CONFIG_FB_S3 is not set
# CONFIG_FB_SAVAGE is not set
# CONFIG_FB_SIS is not set
# CONFIG_FB_VIA is not set
# CONFIG_FB_NEOMAGIC is not set
# CONFIG_FB_KYRO is not set
# CONFIG_FB_3DFX is not set
# CONFIG_FB_VOODOO1 is not set
# CONFIG_FB_VT8623 is not set
# CONFIG_FB_TRIDENT is not set
# CONFIG_FB_ARK is not set
# CONFIG_FB_PM3 is not set
# CONFIG_FB_CARMINE is not set
# CONFIG_FB_SM501 is not set
# CONFIG_FB_IBM_GXT4500 is not set
CONFIG_FB_GOLDFISH=y
CONFIG_FB_VIRTUAL=y
CONFIG_FB_METRONOME=m
# CONFIG_FB_MB862XX is not set
# CONFIG_FB_SIMPLE is not set
# CONFIG_FB_SM712 is not set
# end of Frame buffer Devices

#
# Backlight & LCD device support
#
CONFIG_LCD_CLASS_DEVICE=y
# CONFIG_LCD_L4F00242T03 is not set
CONFIG_LCD_LMS283GF05=y
# CONFIG_LCD_LTV350QV is not set
CONFIG_LCD_ILI922X=y
CONFIG_LCD_ILI9320=m
CONFIG_LCD_TDO24M=y
# CONFIG_LCD_VGG2432A4 is not set
# CONFIG_LCD_PLATFORM is not set
CONFIG_LCD_AMS369FG06=m
CONFIG_LCD_LMS501KF03=m
CONFIG_LCD_HX8357=y
# CONFIG_LCD_OTM3225A is not set
CONFIG_BACKLIGHT_CLASS_DEVICE=y
# CONFIG_BACKLIGHT_KTD253 is not set
CONFIG_BACKLIGHT_PWM=m
CONFIG_BACKLIGHT_DA903X=m
# CONFIG_BACKLIGHT_DA9052 is not set
CONFIG_BACKLIGHT_APPLE=m
CONFIG_BACKLIGHT_QCOM_WLED=y
CONFIG_BACKLIGHT_SAHARA=m
CONFIG_BACKLIGHT_WM831X=y
CONFIG_BACKLIGHT_ADP8860=y
# CONFIG_BACKLIGHT_ADP8870 is not set
CONFIG_BACKLIGHT_88PM860X=m
CONFIG_BACKLIGHT_AAT2870=m
# CONFIG_BACKLIGHT_LM3630A is not set
CONFIG_BACKLIGHT_LM3639=y
# CONFIG_BACKLIGHT_LP855X is not set
CONFIG_BACKLIGHT_PANDORA=m
CONFIG_BACKLIGHT_AS3711=y
# CONFIG_BACKLIGHT_GPIO is not set
# CONFIG_BACKLIGHT_LV5207LP is not set
# CONFIG_BACKLIGHT_BD6107 is not set
# CONFIG_BACKLIGHT_ARCXCNN is not set
# CONFIG_BACKLIGHT_RAVE_SP is not set
# end of Backlight & LCD device support

CONFIG_HDMI=y

#
# Console display driver support
#
CONFIG_VGA_CONSOLE=y
CONFIG_DUMMY_CONSOLE=y
CONFIG_DUMMY_CONSOLE_COLUMNS=80
CONFIG_DUMMY_CONSOLE_ROWS=25
CONFIG_FRAMEBUFFER_CONSOLE=y
# CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION is not set
CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=y
# CONFIG_FRAMEBUFFER_CONSOLE_ROTATION is not set
CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER=y
# end of Console display driver support

CONFIG_LOGO=y
# CONFIG_LOGO_LINUX_MONO is not set
# CONFIG_LOGO_LINUX_VGA16 is not set
# CONFIG_LOGO_LINUX_CLUT224 is not set
# end of Graphics support

CONFIG_SOUND=m
CONFIG_SND=m
CONFIG_SND_TIMER=m
CONFIG_SND_PCM=m
CONFIG_SND_PCM_ELD=y
CONFIG_SND_PCM_IEC958=y
CONFIG_SND_DMAENGINE_PCM=m
CONFIG_SND_HWDEP=m
CONFIG_SND_SEQ_DEVICE=m
CONFIG_SND_JACK=y
CONFIG_SND_JACK_INPUT_DEV=y
# CONFIG_SND_OSSEMUL is not set
CONFIG_SND_PCM_TIMER=y
CONFIG_SND_DYNAMIC_MINORS=y
CONFIG_SND_MAX_CARDS=32
CONFIG_SND_SUPPORT_OLD_API=y
CONFIG_SND_PROC_FS=y
CONFIG_SND_VERBOSE_PROCFS=y
# CONFIG_SND_VERBOSE_PRINTK is not set
CONFIG_SND_DEBUG=y
CONFIG_SND_DEBUG_VERBOSE=y
CONFIG_SND_PCM_XRUN_DEBUG=y
# CONFIG_SND_CTL_VALIDATION is not set
CONFIG_SND_DMA_SGBUF=y
CONFIG_SND_SEQUENCER=m
# CONFIG_SND_SEQ_DUMMY is not set
CONFIG_SND_VX_LIB=m
# CONFIG_SND_DRIVERS is not set
CONFIG_SND_PCI=y
# CONFIG_SND_AD1889 is not set
# CONFIG_SND_ALS300 is not set
# CONFIG_SND_ALS4000 is not set
# CONFIG_SND_ALI5451 is not set
# CONFIG_SND_ASIHPI is not set
# CONFIG_SND_ATIIXP is not set
# CONFIG_SND_ATIIXP_MODEM is not set
# CONFIG_SND_AU8810 is not set
# CONFIG_SND_AU8820 is not set
# CONFIG_SND_AU8830 is not set
# CONFIG_SND_AW2 is not set
# CONFIG_SND_AZT3328 is not set
# CONFIG_SND_BT87X is not set
# CONFIG_SND_CA0106 is not set
# CONFIG_SND_CMIPCI is not set
# CONFIG_SND_OXYGEN is not set
# CONFIG_SND_CS4281 is not set
# CONFIG_SND_CS46XX is not set
# CONFIG_SND_CTXFI is not set
# CONFIG_SND_DARLA20 is not set
# CONFIG_SND_GINA20 is not set
# CONFIG_SND_LAYLA20 is not set
# CONFIG_SND_DARLA24 is not set
# CONFIG_SND_GINA24 is not set
# CONFIG_SND_LAYLA24 is not set
# CONFIG_SND_MONA is not set
# CONFIG_SND_MIA is not set
# CONFIG_SND_ECHO3G is not set
# CONFIG_SND_INDIGO is not set
# CONFIG_SND_INDIGOIO is not set
# CONFIG_SND_INDIGODJ is not set
# CONFIG_SND_INDIGOIOX is not set
# CONFIG_SND_INDIGODJX is not set
# CONFIG_SND_EMU10K1 is not set
# CONFIG_SND_EMU10K1X is not set
# CONFIG_SND_ENS1370 is not set
# CONFIG_SND_ENS1371 is not set
# CONFIG_SND_ES1938 is not set
# CONFIG_SND_ES1968 is not set
# CONFIG_SND_FM801 is not set
# CONFIG_SND_HDSP is not set
# CONFIG_SND_HDSPM is not set
# CONFIG_SND_ICE1712 is not set
# CONFIG_SND_ICE1724 is not set
# CONFIG_SND_INTEL8X0 is not set
# CONFIG_SND_INTEL8X0M is not set
# CONFIG_SND_KORG1212 is not set
# CONFIG_SND_LOLA is not set
# CONFIG_SND_LX6464ES is not set
# CONFIG_SND_MAESTRO3 is not set
# CONFIG_SND_MIXART is not set
# CONFIG_SND_NM256 is not set
# CONFIG_SND_PCXHR is not set
# CONFIG_SND_RIPTIDE is not set
# CONFIG_SND_RME32 is not set
# CONFIG_SND_RME96 is not set
# CONFIG_SND_RME9652 is not set
# CONFIG_SND_SE6X is not set
# CONFIG_SND_SONICVIBES is not set
# CONFIG_SND_TRIDENT is not set
# CONFIG_SND_VIA82XX is not set
# CONFIG_SND_VIA82XX_MODEM is not set
# CONFIG_SND_VIRTUOSO is not set
# CONFIG_SND_VX222 is not set
# CONFIG_SND_YMFPCI is not set

#
# HD-Audio
#
# CONFIG_SND_HDA_INTEL is not set
# end of HD-Audio

CONFIG_SND_HDA_PREALLOC_SIZE=0
# CONFIG_SND_SPI is not set
# CONFIG_SND_FIREWIRE is not set
CONFIG_SND_PCMCIA=y
CONFIG_SND_VXPOCKET=m
CONFIG_SND_PDAUDIOCF=m
CONFIG_SND_SOC=m
CONFIG_SND_SOC_GENERIC_DMAENGINE_PCM=y
# CONFIG_SND_SOC_AMD_ACP is not set
# CONFIG_SND_SOC_AMD_ACP3x is not set
# CONFIG_SND_SOC_AMD_RENOIR is not set
CONFIG_SND_ATMEL_SOC=m
CONFIG_SND_BCM63XX_I2S_WHISTLER=m
CONFIG_SND_DESIGNWARE_I2S=m
CONFIG_SND_DESIGNWARE_PCM=y

#
# SoC Audio for Freescale CPUs
#

#
# Common SoC Audio options for Freescale CPUs:
#
# CONFIG_SND_SOC_FSL_ASRC is not set
CONFIG_SND_SOC_FSL_SAI=m
CONFIG_SND_SOC_FSL_MQS=m
CONFIG_SND_SOC_FSL_AUDMIX=m
# CONFIG_SND_SOC_FSL_SSI is not set
CONFIG_SND_SOC_FSL_SPDIF=m
CONFIG_SND_SOC_FSL_ESAI=m
# CONFIG_SND_SOC_FSL_MICFIL is not set
# CONFIG_SND_SOC_IMX_AUDMUX is not set
# end of SoC Audio for Freescale CPUs

CONFIG_SND_I2S_HI6210_I2S=m
CONFIG_SND_SOC_IMG=y
CONFIG_SND_SOC_IMG_I2S_IN=m
CONFIG_SND_SOC_IMG_I2S_OUT=m
CONFIG_SND_SOC_IMG_PARALLEL_OUT=m
CONFIG_SND_SOC_IMG_SPDIF_IN=m
# CONFIG_SND_SOC_IMG_SPDIF_OUT is not set
# CONFIG_SND_SOC_IMG_PISTACHIO_INTERNAL_DAC is not set
# CONFIG_SND_SOC_INTEL_SST_TOPLEVEL is not set
# CONFIG_SND_SOC_MTK_BTCVSD is not set
# CONFIG_SND_SOC_SOF_TOPLEVEL is not set

#
# STMicroelectronics STM32 SOC audio support
#
# end of STMicroelectronics STM32 SOC audio support

# CONFIG_SND_SOC_XILINX_I2S is not set
CONFIG_SND_SOC_XILINX_AUDIO_FORMATTER=m
CONFIG_SND_SOC_XILINX_SPDIF=m
CONFIG_SND_SOC_XTFPGA_I2S=m
# CONFIG_ZX_TDM is not set
CONFIG_SND_SOC_I2C_AND_SPI=m

#
# CODEC drivers
#
# CONFIG_SND_SOC_AC97_CODEC is not set
CONFIG_SND_SOC_ADAU_UTILS=m
# CONFIG_SND_SOC_ADAU1701 is not set
CONFIG_SND_SOC_ADAU17X1=m
CONFIG_SND_SOC_ADAU1761=m
CONFIG_SND_SOC_ADAU1761_I2C=m
CONFIG_SND_SOC_ADAU1761_SPI=m
CONFIG_SND_SOC_ADAU7002=m
CONFIG_SND_SOC_ADAU7118=m
# CONFIG_SND_SOC_ADAU7118_HW is not set
CONFIG_SND_SOC_ADAU7118_I2C=m
CONFIG_SND_SOC_AK4104=m
CONFIG_SND_SOC_AK4118=m
CONFIG_SND_SOC_AK4458=m
# CONFIG_SND_SOC_AK4554 is not set
# CONFIG_SND_SOC_AK4613 is not set
CONFIG_SND_SOC_AK4642=m
CONFIG_SND_SOC_AK5386=m
CONFIG_SND_SOC_AK5558=m
# CONFIG_SND_SOC_ALC5623 is not set
# CONFIG_SND_SOC_BD28623 is not set
CONFIG_SND_SOC_BT_SCO=m
# CONFIG_SND_SOC_CS35L32 is not set
CONFIG_SND_SOC_CS35L33=m
CONFIG_SND_SOC_CS35L34=m
# CONFIG_SND_SOC_CS35L35 is not set
CONFIG_SND_SOC_CS35L36=m
CONFIG_SND_SOC_CS42L42=m
CONFIG_SND_SOC_CS42L51=m
CONFIG_SND_SOC_CS42L51_I2C=m
CONFIG_SND_SOC_CS42L52=m
CONFIG_SND_SOC_CS42L56=m
# CONFIG_SND_SOC_CS42L73 is not set
CONFIG_SND_SOC_CS4234=m
CONFIG_SND_SOC_CS4265=m
CONFIG_SND_SOC_CS4270=m
CONFIG_SND_SOC_CS4271=m
CONFIG_SND_SOC_CS4271_I2C=m
CONFIG_SND_SOC_CS4271_SPI=m
CONFIG_SND_SOC_CS42XX8=m
CONFIG_SND_SOC_CS42XX8_I2C=m
# CONFIG_SND_SOC_CS43130 is not set
# CONFIG_SND_SOC_CS4341 is not set
CONFIG_SND_SOC_CS4349=m
CONFIG_SND_SOC_CS53L30=m
# CONFIG_SND_SOC_CX2072X is not set
CONFIG_SND_SOC_DA7213=m
# CONFIG_SND_SOC_DMIC is not set
CONFIG_SND_SOC_HDMI_CODEC=m
CONFIG_SND_SOC_ES7134=m
CONFIG_SND_SOC_ES7241=m
CONFIG_SND_SOC_ES8316=m
CONFIG_SND_SOC_ES8328=m
CONFIG_SND_SOC_ES8328_I2C=m
CONFIG_SND_SOC_ES8328_SPI=m
CONFIG_SND_SOC_GTM601=m
# CONFIG_SND_SOC_INNO_RK3036 is not set
CONFIG_SND_SOC_MAX98088=m
CONFIG_SND_SOC_MAX98357A=m
CONFIG_SND_SOC_MAX98504=m
CONFIG_SND_SOC_MAX9867=m
# CONFIG_SND_SOC_MAX98927 is not set
CONFIG_SND_SOC_MAX98373=m
CONFIG_SND_SOC_MAX98373_I2C=m
CONFIG_SND_SOC_MAX98390=m
CONFIG_SND_SOC_MAX9860=m
CONFIG_SND_SOC_MSM8916_WCD_ANALOG=m
# CONFIG_SND_SOC_MSM8916_WCD_DIGITAL is not set
CONFIG_SND_SOC_PCM1681=m
CONFIG_SND_SOC_PCM1789=m
CONFIG_SND_SOC_PCM1789_I2C=m
CONFIG_SND_SOC_PCM179X=m
CONFIG_SND_SOC_PCM179X_I2C=m
CONFIG_SND_SOC_PCM179X_SPI=m
# CONFIG_SND_SOC_PCM186X_I2C is not set
# CONFIG_SND_SOC_PCM186X_SPI is not set
CONFIG_SND_SOC_PCM3060=m
CONFIG_SND_SOC_PCM3060_I2C=m
CONFIG_SND_SOC_PCM3060_SPI=m
CONFIG_SND_SOC_PCM3168A=m
CONFIG_SND_SOC_PCM3168A_I2C=m
CONFIG_SND_SOC_PCM3168A_SPI=m
CONFIG_SND_SOC_PCM512x=m
# CONFIG_SND_SOC_PCM512x_I2C is not set
CONFIG_SND_SOC_PCM512x_SPI=m
CONFIG_SND_SOC_RK3328=m
CONFIG_SND_SOC_RL6231=m
CONFIG_SND_SOC_RT5616=m
CONFIG_SND_SOC_RT5631=m
CONFIG_SND_SOC_SGTL5000=m
CONFIG_SND_SOC_SIGMADSP=m
CONFIG_SND_SOC_SIGMADSP_REGMAP=m
# CONFIG_SND_SOC_SIMPLE_AMPLIFIER is not set
# CONFIG_SND_SOC_SIRF_AUDIO_CODEC is not set
CONFIG_SND_SOC_SPDIF=m
# CONFIG_SND_SOC_SSM2305 is not set
CONFIG_SND_SOC_SSM2602=m
CONFIG_SND_SOC_SSM2602_SPI=m
CONFIG_SND_SOC_SSM2602_I2C=m
CONFIG_SND_SOC_SSM4567=m
# CONFIG_SND_SOC_STA32X is not set
CONFIG_SND_SOC_STA350=m
# CONFIG_SND_SOC_STI_SAS is not set
CONFIG_SND_SOC_TAS2552=m
CONFIG_SND_SOC_TAS2562=m
# CONFIG_SND_SOC_TAS2764 is not set
CONFIG_SND_SOC_TAS2770=m
# CONFIG_SND_SOC_TAS5086 is not set
CONFIG_SND_SOC_TAS571X=m
CONFIG_SND_SOC_TAS5720=m
CONFIG_SND_SOC_TAS6424=m
CONFIG_SND_SOC_TDA7419=m
# CONFIG_SND_SOC_TFA9879 is not set
CONFIG_SND_SOC_TLV320AIC23=m
CONFIG_SND_SOC_TLV320AIC23_I2C=m
CONFIG_SND_SOC_TLV320AIC23_SPI=m
CONFIG_SND_SOC_TLV320AIC31XX=m
CONFIG_SND_SOC_TLV320AIC32X4=m
CONFIG_SND_SOC_TLV320AIC32X4_I2C=m
CONFIG_SND_SOC_TLV320AIC32X4_SPI=m
CONFIG_SND_SOC_TLV320AIC3X=m
# CONFIG_SND_SOC_TLV320ADCX140 is not set
# CONFIG_SND_SOC_TS3A227E is not set
CONFIG_SND_SOC_TSCS42XX=m
# CONFIG_SND_SOC_TSCS454 is not set
CONFIG_SND_SOC_UDA1334=m
# CONFIG_SND_SOC_WCD9335 is not set
CONFIG_SND_SOC_WCD934X=m
CONFIG_SND_SOC_WM8510=m
# CONFIG_SND_SOC_WM8523 is not set
CONFIG_SND_SOC_WM8524=m
CONFIG_SND_SOC_WM8580=m
# CONFIG_SND_SOC_WM8711 is not set
CONFIG_SND_SOC_WM8728=m
CONFIG_SND_SOC_WM8731=m
# CONFIG_SND_SOC_WM8737 is not set
CONFIG_SND_SOC_WM8741=m
# CONFIG_SND_SOC_WM8750 is not set
CONFIG_SND_SOC_WM8753=m
CONFIG_SND_SOC_WM8770=m
# CONFIG_SND_SOC_WM8776 is not set
CONFIG_SND_SOC_WM8782=m
CONFIG_SND_SOC_WM8804=m
CONFIG_SND_SOC_WM8804_I2C=m
CONFIG_SND_SOC_WM8804_SPI=m
CONFIG_SND_SOC_WM8903=m
CONFIG_SND_SOC_WM8904=m
CONFIG_SND_SOC_WM8960=m
CONFIG_SND_SOC_WM8962=m
# CONFIG_SND_SOC_WM8974 is not set
# CONFIG_SND_SOC_WM8978 is not set
CONFIG_SND_SOC_WM8985=m
CONFIG_SND_SOC_ZL38060=m
# CONFIG_SND_SOC_ZX_AUD96P22 is not set
CONFIG_SND_SOC_MAX9759=m
CONFIG_SND_SOC_MT6351=m
CONFIG_SND_SOC_MT6358=m
CONFIG_SND_SOC_MT6660=m
CONFIG_SND_SOC_NAU8540=m
CONFIG_SND_SOC_NAU8810=m
CONFIG_SND_SOC_NAU8822=m
CONFIG_SND_SOC_NAU8824=m
# CONFIG_SND_SOC_TPA6130A2 is not set
# end of CODEC drivers

CONFIG_SND_SIMPLE_CARD_UTILS=m
CONFIG_SND_SIMPLE_CARD=m
CONFIG_SND_X86=y

#
# HID support
#
# CONFIG_HID is not set

#
# I2C HID support
#
# CONFIG_I2C_HID is not set
# end of I2C HID support

#
# Intel ISH HID support
#
# CONFIG_INTEL_ISH_HID is not set
# end of Intel ISH HID support
# end of HID support

CONFIG_USB_OHCI_LITTLE_ENDIAN=y
CONFIG_USB_SUPPORT=y
# CONFIG_USB_ULPI_BUS is not set
# CONFIG_USB_CONN_GPIO is not set
CONFIG_USB_ARCH_HAS_HCD=y
# CONFIG_USB is not set
CONFIG_USB_PCI=y

#
# USB port drivers
#

#
# USB Physical Layer drivers
#
# CONFIG_NOP_USB_XCEIV is not set
# CONFIG_USB_GPIO_VBUS is not set
# end of USB Physical Layer drivers

# CONFIG_USB_GADGET is not set
# CONFIG_TYPEC is not set
# CONFIG_USB_ROLE_SWITCH is not set
CONFIG_MMC=m
# CONFIG_MMC_BLOCK is not set
CONFIG_SDIO_UART=m
# CONFIG_MMC_TEST is not set

#
# MMC/SD/SDIO Host Controller Drivers
#
CONFIG_MMC_DEBUG=y
CONFIG_MMC_SDHCI=m
# CONFIG_MMC_SDHCI_PCI is not set
# CONFIG_MMC_SDHCI_ACPI is not set
CONFIG_MMC_SDHCI_PLTFM=m
# CONFIG_MMC_SDHCI_F_SDH30 is not set
# CONFIG_MMC_WBSD is not set
# CONFIG_MMC_TIFM_SD is not set
# CONFIG_MMC_GOLDFISH is not set
# CONFIG_MMC_SPI is not set
# CONFIG_MMC_SDRICOH_CS is not set
# CONFIG_MMC_CB710 is not set
# CONFIG_MMC_VIA_SDMMC is not set
CONFIG_MMC_USDHI6ROL0=m
CONFIG_MMC_CQHCI=m
CONFIG_MMC_HSQ=m
# CONFIG_MMC_TOSHIBA_PCI is not set
CONFIG_MMC_MTK=m
CONFIG_MMC_SDHCI_XENON=m
# CONFIG_MEMSTICK is not set
CONFIG_NEW_LEDS=y
CONFIG_LEDS_CLASS=y
CONFIG_LEDS_CLASS_FLASH=m
# CONFIG_LEDS_CLASS_MULTICOLOR is not set
CONFIG_LEDS_BRIGHTNESS_HW_CHANGED=y

#
# LED drivers
#
CONFIG_LEDS_88PM860X=y
CONFIG_LEDS_APU=y
CONFIG_LEDS_AS3645A=m
CONFIG_LEDS_LM3530=m
# CONFIG_LEDS_LM3532 is not set
CONFIG_LEDS_LM3642=y
# CONFIG_LEDS_LM3601X is not set
# CONFIG_LEDS_MT6323 is not set
# CONFIG_LEDS_PCA9532 is not set
CONFIG_LEDS_GPIO=y
CONFIG_LEDS_LP3944=m
CONFIG_LEDS_LP3952=m
CONFIG_LEDS_LP50XX=m
# CONFIG_LEDS_CLEVO_MAIL is not set
CONFIG_LEDS_PCA955X=y
CONFIG_LEDS_PCA955X_GPIO=y
# CONFIG_LEDS_PCA963X is not set
# CONFIG_LEDS_WM831X_STATUS is not set
CONFIG_LEDS_WM8350=m
CONFIG_LEDS_DA903X=m
CONFIG_LEDS_DA9052=y
# CONFIG_LEDS_DAC124S085 is not set
CONFIG_LEDS_PWM=m
# CONFIG_LEDS_REGULATOR is not set
CONFIG_LEDS_BD2802=m
# CONFIG_LEDS_INTEL_SS4200 is not set
CONFIG_LEDS_MC13783=m
CONFIG_LEDS_TCA6507=y
CONFIG_LEDS_TLC591XX=m
CONFIG_LEDS_MAX8997=m
CONFIG_LEDS_LM355x=y
CONFIG_LEDS_MENF21BMC=y

#
# LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
#
# CONFIG_LEDS_BLINKM is not set
CONFIG_LEDS_MLXCPLD=y
CONFIG_LEDS_MLXREG=m
CONFIG_LEDS_USER=m
CONFIG_LEDS_NIC78BX=m
CONFIG_LEDS_TI_LMU_COMMON=m
CONFIG_LEDS_LM36274=m
CONFIG_LEDS_TPS6105X=m
CONFIG_LEDS_SGM3140=m

#
# LED Triggers
#
CONFIG_LEDS_TRIGGERS=y
CONFIG_LEDS_TRIGGER_TIMER=y
CONFIG_LEDS_TRIGGER_ONESHOT=m
CONFIG_LEDS_TRIGGER_HEARTBEAT=m
CONFIG_LEDS_TRIGGER_BACKLIGHT=m
# CONFIG_LEDS_TRIGGER_CPU is not set
CONFIG_LEDS_TRIGGER_ACTIVITY=y
# CONFIG_LEDS_TRIGGER_GPIO is not set
# CONFIG_LEDS_TRIGGER_DEFAULT_ON is not set

#
# iptables trigger is under Netfilter config (LED target)
#
# CONFIG_LEDS_TRIGGER_TRANSIENT is not set
CONFIG_LEDS_TRIGGER_CAMERA=y
# CONFIG_LEDS_TRIGGER_PANIC is not set
CONFIG_LEDS_TRIGGER_NETDEV=m
# CONFIG_LEDS_TRIGGER_PATTERN is not set
CONFIG_LEDS_TRIGGER_AUDIO=y
# CONFIG_ACCESSIBILITY is not set
CONFIG_INFINIBAND=m
CONFIG_INFINIBAND_USER_MAD=m
CONFIG_INFINIBAND_USER_ACCESS=m
CONFIG_INFINIBAND_USER_MEM=y
CONFIG_INFINIBAND_ON_DEMAND_PAGING=y
# CONFIG_INFINIBAND_ADDR_TRANS is not set
CONFIG_INFINIBAND_VIRT_DMA=y
# CONFIG_INFINIBAND_MTHCA is not set
# CONFIG_MLX4_INFINIBAND is not set
# CONFIG_INFINIBAND_OCRDMA is not set
# CONFIG_INFINIBAND_RDMAVT is not set
# CONFIG_RDMA_RXE is not set
# CONFIG_RDMA_SIW is not set
CONFIG_INFINIBAND_IPOIB=m
# CONFIG_INFINIBAND_IPOIB_CM is not set
CONFIG_INFINIBAND_IPOIB_DEBUG=y
# CONFIG_INFINIBAND_IPOIB_DEBUG_DATA is not set
CONFIG_INFINIBAND_OPA_VNIC=m
CONFIG_EDAC_ATOMIC_SCRUB=y
CONFIG_EDAC_SUPPORT=y
CONFIG_EDAC=y
CONFIG_EDAC_LEGACY_SYSFS=y
CONFIG_EDAC_DEBUG=y
# CONFIG_EDAC_E752X is not set
# CONFIG_EDAC_I82975X is not set
# CONFIG_EDAC_I3000 is not set
# CONFIG_EDAC_I3200 is not set
# CONFIG_EDAC_IE31200 is not set
# CONFIG_EDAC_X38 is not set
# CONFIG_EDAC_I5400 is not set
# CONFIG_EDAC_I5000 is not set
# CONFIG_EDAC_I5100 is not set
# CONFIG_EDAC_I7300 is not set
CONFIG_RTC_LIB=y
CONFIG_RTC_MC146818_LIB=y
# CONFIG_RTC_CLASS is not set
# CONFIG_DMADEVICES is not set

#
# DMABUF options
#
CONFIG_SYNC_FILE=y
CONFIG_SW_SYNC=y
CONFIG_UDMABUF=y
CONFIG_DMABUF_MOVE_NOTIFY=y
# CONFIG_DMABUF_SELFTESTS is not set
CONFIG_DMABUF_HEAPS=y
CONFIG_DMABUF_HEAPS_SYSTEM=y
# CONFIG_DMABUF_HEAPS_CMA is not set
# end of DMABUF options

CONFIG_AUXDISPLAY=y
# CONFIG_HD44780 is not set
# CONFIG_KS0108 is not set
# CONFIG_IMG_ASCII_LCD is not set
CONFIG_PARPORT_PANEL=y
CONFIG_PANEL_PARPORT=0
CONFIG_PANEL_PROFILE=5
# CONFIG_PANEL_CHANGE_MESSAGE is not set
# CONFIG_CHARLCD_BL_OFF is not set
# CONFIG_CHARLCD_BL_ON is not set
CONFIG_CHARLCD_BL_FLASH=y
CONFIG_PANEL=y
CONFIG_CHARLCD=y
CONFIG_UIO=y
# CONFIG_UIO_CIF is not set
CONFIG_UIO_PDRV_GENIRQ=m
# CONFIG_UIO_DMEM_GENIRQ is not set
# CONFIG_UIO_AEC is not set
# CONFIG_UIO_SERCOS3 is not set
# CONFIG_UIO_PCI_GENERIC is not set
# CONFIG_UIO_NETX is not set
CONFIG_UIO_PRUSS=y
# CONFIG_UIO_MF624 is not set
CONFIG_VFIO_IOMMU_TYPE1=m
CONFIG_VFIO=m
# CONFIG_VFIO_NOIOMMU is not set
# CONFIG_VFIO_PCI is not set
# CONFIG_VFIO_MDEV is not set
CONFIG_VIRT_DRIVERS=y
# CONFIG_VBOXGUEST is not set
# CONFIG_NITRO_ENCLAVES is not set
CONFIG_VIRTIO=y
# CONFIG_VIRTIO_MENU is not set
# CONFIG_VDPA is not set
CONFIG_VHOST_IOTLB=m
CONFIG_VHOST_RING=m
# CONFIG_VHOST_MENU is not set

#
# Microsoft Hyper-V guest support
#
# CONFIG_HYPERV is not set
# end of Microsoft Hyper-V guest support

CONFIG_GREYBUS=y
CONFIG_STAGING=y
CONFIG_COMEDI=y
# CONFIG_COMEDI_DEBUG is not set
CONFIG_COMEDI_DEFAULT_BUF_SIZE_KB=2048
CONFIG_COMEDI_DEFAULT_BUF_MAXSIZE_KB=20480
CONFIG_COMEDI_MISC_DRIVERS=y
CONFIG_COMEDI_BOND=y
# CONFIG_COMEDI_TEST is not set
CONFIG_COMEDI_PARPORT=y
# CONFIG_COMEDI_ISA_DRIVERS is not set
# CONFIG_COMEDI_PCI_DRIVERS is not set
# CONFIG_COMEDI_PCMCIA_DRIVERS is not set
CONFIG_COMEDI_8255=y
CONFIG_COMEDI_8255_SA=y
CONFIG_COMEDI_KCOMEDILIB=y
# CONFIG_RTS5208 is not set
# CONFIG_VT6655 is not set
# CONFIG_FB_SM750 is not set
# CONFIG_STAGING_MEDIA is not set

#
# Android
#
# end of Android

# CONFIG_FIREWIRE_SERIAL is not set
# CONFIG_GOLDFISH_AUDIO is not set
# CONFIG_GS_FPGABOOT is not set
# CONFIG_UNISYSSPAR is not set
CONFIG_FB_TFT=y
CONFIG_FB_TFT_AGM1264K_FL=m
CONFIG_FB_TFT_BD663474=m
CONFIG_FB_TFT_HX8340BN=y
CONFIG_FB_TFT_HX8347D=y
CONFIG_FB_TFT_HX8353D=y
CONFIG_FB_TFT_HX8357D=y
CONFIG_FB_TFT_ILI9163=m
# CONFIG_FB_TFT_ILI9320 is not set
CONFIG_FB_TFT_ILI9325=m
CONFIG_FB_TFT_ILI9340=m
CONFIG_FB_TFT_ILI9341=y
# CONFIG_FB_TFT_ILI9481 is not set
CONFIG_FB_TFT_ILI9486=m
CONFIG_FB_TFT_PCD8544=y
# CONFIG_FB_TFT_RA8875 is not set
CONFIG_FB_TFT_S6D02A1=y
# CONFIG_FB_TFT_S6D1121 is not set
# CONFIG_FB_TFT_SEPS525 is not set
CONFIG_FB_TFT_SH1106=y
# CONFIG_FB_TFT_SSD1289 is not set
# CONFIG_FB_TFT_SSD1305 is not set
CONFIG_FB_TFT_SSD1306=y
CONFIG_FB_TFT_SSD1331=m
CONFIG_FB_TFT_SSD1351=m
CONFIG_FB_TFT_ST7735R=m
# CONFIG_FB_TFT_ST7789V is not set
CONFIG_FB_TFT_TINYLCD=m
CONFIG_FB_TFT_TLS8204=m
# CONFIG_FB_TFT_UC1611 is not set
CONFIG_FB_TFT_UC1701=y
CONFIG_FB_TFT_UPD161704=m
# CONFIG_FB_TFT_WATTEROTT is not set
# CONFIG_KS7010 is not set
CONFIG_GREYBUS_AUDIO=m
CONFIG_GREYBUS_AUDIO_APB_CODEC=m
# CONFIG_GREYBUS_BOOTROM is not set
CONFIG_GREYBUS_FIRMWARE=y
CONFIG_GREYBUS_LIGHT=y
CONFIG_GREYBUS_LOG=m
CONFIG_GREYBUS_LOOPBACK=y
CONFIG_GREYBUS_POWER=y
CONFIG_GREYBUS_RAW=m
CONFIG_GREYBUS_VIBRATOR=y
CONFIG_GREYBUS_BRIDGED_PHY=m
CONFIG_GREYBUS_GPIO=m
CONFIG_GREYBUS_I2C=m
CONFIG_GREYBUS_PWM=m
CONFIG_GREYBUS_SDIO=m
CONFIG_GREYBUS_SPI=m
# CONFIG_GREYBUS_UART is not set
# CONFIG_PI433 is not set

#
# Gasket devices
#
# CONFIG_STAGING_GASKET_FRAMEWORK is not set
# end of Gasket devices

# CONFIG_FIELDBUS_DEV is not set
# CONFIG_KPC2000 is not set
# CONFIG_QLGE is not set
# CONFIG_WFX is not set
CONFIG_SPMI_HISI3670=m
CONFIG_X86_PLATFORM_DEVICES=y
# CONFIG_ACPI_WMI is not set
CONFIG_ACERHDF=y
CONFIG_ACER_WIRELESS=m
# CONFIG_APPLE_GMUX is not set
CONFIG_ASUS_LAPTOP=m
# CONFIG_ASUS_WIRELESS is not set
# CONFIG_DCDBAS is not set
# CONFIG_DELL_SMBIOS is not set
# CONFIG_DELL_RBTN is not set
# CONFIG_DELL_RBU is not set
# CONFIG_DELL_SMO8800 is not set
# CONFIG_AMILO_RFKILL is not set
CONFIG_FUJITSU_LAPTOP=y
# CONFIG_FUJITSU_TABLET is not set
# CONFIG_GPD_POCKET_FAN is not set
# CONFIG_HP_ACCEL is not set
# CONFIG_HP_WIRELESS is not set
# CONFIG_IBM_RTL is not set
# CONFIG_IDEAPAD_LAPTOP is not set
# CONFIG_SENSORS_HDAPS is not set
CONFIG_INTEL_ATOMISP2_LED=y
CONFIG_INTEL_HID_EVENT=y
CONFIG_INTEL_INT0002_VGPIO=m
CONFIG_INTEL_OAKTRAIL=m
CONFIG_INTEL_VBTN=y
# CONFIG_SURFACE_3_POWER_OPREGION is not set
# CONFIG_SURFACE_PRO3_BUTTON is not set
# CONFIG_MSI_LAPTOP is not set
# CONFIG_PCENGINES_APU2 is not set
# CONFIG_SAMSUNG_LAPTOP is not set
CONFIG_SAMSUNG_Q10=y
# CONFIG_TOSHIBA_BT_RFKILL is not set
# CONFIG_TOSHIBA_HAPS is not set
# CONFIG_ACPI_CMPC is not set
CONFIG_PANASONIC_LAPTOP=y
# CONFIG_SONY_LAPTOP is not set
# CONFIG_SYSTEM76_ACPI is not set
# CONFIG_TOPSTAR_LAPTOP is not set
# CONFIG_I2C_MULTI_INSTANTIATE is not set
CONFIG_MLX_PLATFORM=m
# CONFIG_INTEL_IPS is not set
# CONFIG_INTEL_RST is not set
CONFIG_INTEL_SMARTCONNECT=m

#
# Intel Speed Select Technology interface support
#
# CONFIG_INTEL_SPEED_SELECT_INTERFACE is not set
# end of Intel Speed Select Technology interface support

# CONFIG_INTEL_UNCORE_FREQ_CONTROL is not set
CONFIG_INTEL_CHTDC_TI_PWRBTN=m
# CONFIG_INTEL_MID_POWER_BUTTON is not set
# CONFIG_INTEL_PMC_CORE is not set
CONFIG_INTEL_PUNIT_IPC=m
CONFIG_INTEL_SCU_IPC=y
CONFIG_INTEL_SCU=y
# CONFIG_INTEL_SCU_PCI is not set
CONFIG_INTEL_SCU_PLATFORM=y
# CONFIG_INTEL_SCU_IPC_UTIL is not set
CONFIG_PMC_ATOM=y
# CONFIG_GOLDFISH_PIPE is not set
# CONFIG_CHROME_PLATFORMS is not set
CONFIG_MELLANOX_PLATFORM=y
CONFIG_HAVE_CLK=y
CONFIG_CLKDEV_LOOKUP=y
CONFIG_HAVE_CLK_PREPARE=y
CONFIG_COMMON_CLK=y
CONFIG_COMMON_CLK_WM831X=m
# CONFIG_COMMON_CLK_MAX9485 is not set
# CONFIG_COMMON_CLK_SI5341 is not set
# CONFIG_COMMON_CLK_SI5351 is not set
# CONFIG_COMMON_CLK_SI544 is not set
CONFIG_COMMON_CLK_CDCE706=y
CONFIG_COMMON_CLK_CS2000_CP=y
CONFIG_CLK_TWL6040=m
# CONFIG_COMMON_CLK_PWM is not set
# CONFIG_HWSPINLOCK is not set

#
# Clock Source drivers
#
CONFIG_CLKEVT_I8253=y
CONFIG_I8253_LOCK=y
CONFIG_CLKBLD_I8253=y
# end of Clock Source drivers

CONFIG_MAILBOX=y
CONFIG_PCC=y
# CONFIG_ALTERA_MBOX is not set
CONFIG_IOMMU_API=y
CONFIG_IOMMU_SUPPORT=y

#
# Generic IOMMU Pagetable Support
#
# end of Generic IOMMU Pagetable Support

# CONFIG_IOMMU_DEBUGFS is not set
CONFIG_IOMMU_DEFAULT_PASSTHROUGH=y
# CONFIG_AMD_IOMMU is not set

#
# Remoteproc drivers
#
# CONFIG_REMOTEPROC is not set
# end of Remoteproc drivers

#
# Rpmsg drivers
#
CONFIG_RPMSG=y
# CONFIG_RPMSG_CHAR is not set
CONFIG_RPMSG_QCOM_GLINK=m
CONFIG_RPMSG_QCOM_GLINK_RPM=m
CONFIG_RPMSG_VIRTIO=y
# end of Rpmsg drivers

# CONFIG_SOUNDWIRE is not set

#
# SOC (System On Chip) specific Drivers
#

#
# Amlogic SoC drivers
#
# end of Amlogic SoC drivers

#
# Aspeed SoC drivers
#
# end of Aspeed SoC drivers

#
# Broadcom SoC drivers
#
# end of Broadcom SoC drivers

#
# NXP/Freescale QorIQ SoC drivers
#
# end of NXP/Freescale QorIQ SoC drivers

#
# i.MX SoC drivers
#
# end of i.MX SoC drivers

#
# Qualcomm SoC drivers
#
# end of Qualcomm SoC drivers

CONFIG_SOC_TI=y

#
# Xilinx SoC drivers
#
CONFIG_XILINX_VCU=m
# end of Xilinx SoC drivers
# end of SOC (System On Chip) specific Drivers

CONFIG_PM_DEVFREQ=y

#
# DEVFREQ Governors
#
CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=y
CONFIG_DEVFREQ_GOV_PERFORMANCE=y
# CONFIG_DEVFREQ_GOV_POWERSAVE is not set
CONFIG_DEVFREQ_GOV_USERSPACE=m
CONFIG_DEVFREQ_GOV_PASSIVE=m

#
# DEVFREQ Drivers
#
# CONFIG_PM_DEVFREQ_EVENT is not set
CONFIG_EXTCON=y

#
# Extcon Device Drivers
#
# CONFIG_EXTCON_ARIZONA is not set
# CONFIG_EXTCON_AXP288 is not set
CONFIG_EXTCON_FSA9480=m
CONFIG_EXTCON_GPIO=y
CONFIG_EXTCON_INTEL_INT3496=y
# CONFIG_EXTCON_INTEL_CHT_WC is not set
CONFIG_EXTCON_MAX3355=m
CONFIG_EXTCON_MAX77843=m
# CONFIG_EXTCON_MAX8997 is not set
CONFIG_EXTCON_PTN5150=m
CONFIG_EXTCON_RT8973A=m
# CONFIG_EXTCON_SM5502 is not set
CONFIG_EXTCON_USB_GPIO=y
# CONFIG_MEMORY is not set
# CONFIG_IIO is not set
# CONFIG_NTB is not set
# CONFIG_VME_BUS is not set
CONFIG_PWM=y
CONFIG_PWM_SYSFS=y
# CONFIG_PWM_DEBUG is not set
CONFIG_PWM_CRC=y
CONFIG_PWM_IQS620A=m
CONFIG_PWM_LPSS=m
# CONFIG_PWM_LPSS_PCI is not set
CONFIG_PWM_LPSS_PLATFORM=m
CONFIG_PWM_PCA9685=m
# CONFIG_PWM_TWL is not set
CONFIG_PWM_TWL_LED=m

#
# IRQ chip support
#
# end of IRQ chip support

CONFIG_IPACK_BUS=m
# CONFIG_BOARD_TPCI200 is not set
CONFIG_SERIAL_IPOCTAL=m
CONFIG_RESET_CONTROLLER=y
# CONFIG_RESET_TI_SYSCON is not set

#
# PHY Subsystem
#
CONFIG_GENERIC_PHY=y
# CONFIG_USB_LGM_PHY is not set
# CONFIG_BCM_KONA_USB2_PHY is not set
# CONFIG_PHY_PXA_28NM_HSIC is not set
CONFIG_PHY_PXA_28NM_USB2=y
CONFIG_PHY_INTEL_LGM_EMMC=y
# end of PHY Subsystem

# CONFIG_POWERCAP is not set
CONFIG_MCB=m
# CONFIG_MCB_PCI is not set
CONFIG_MCB_LPC=m

#
# Performance monitor support
#
# end of Performance monitor support

CONFIG_RAS=y
CONFIG_RAS_CEC=y
CONFIG_RAS_CEC_DEBUG=y
# CONFIG_USB4 is not set

#
# Android
#
# CONFIG_ANDROID is not set
# end of Android

# CONFIG_LIBNVDIMM is not set
# CONFIG_DAX is not set
CONFIG_NVMEM=y
CONFIG_NVMEM_SYSFS=y
CONFIG_NVMEM_SPMI_SDAM=m
# CONFIG_RAVE_SP_EEPROM is not set

#
# HW tracing support
#
# CONFIG_STM is not set
# CONFIG_INTEL_TH is not set
# end of HW tracing support

CONFIG_FPGA=y
CONFIG_ALTERA_PR_IP_CORE=m
CONFIG_FPGA_MGR_ALTERA_PS_SPI=m
# CONFIG_FPGA_MGR_ALTERA_CVP is not set
CONFIG_FPGA_MGR_XILINX_SPI=m
CONFIG_FPGA_MGR_MACHXO2_SPI=m
CONFIG_FPGA_BRIDGE=y
# CONFIG_ALTERA_FREEZE_BRIDGE is not set
# CONFIG_XILINX_PR_DECOUPLER is not set
CONFIG_FPGA_REGION=y
CONFIG_FPGA_DFL=y
CONFIG_FPGA_DFL_AFU=y
# CONFIG_FPGA_DFL_PCI is not set
CONFIG_TEE=m

#
# TEE drivers
#
# end of TEE drivers

CONFIG_MULTIPLEXER=y

#
# Multiplexer drivers
#
CONFIG_MUX_ADG792A=m
CONFIG_MUX_ADGS1408=m
CONFIG_MUX_GPIO=m
# end of Multiplexer drivers

CONFIG_PM_OPP=y
# CONFIG_UNISYS_VISORBUS is not set
CONFIG_SIOX=m
# CONFIG_SIOX_BUS_GPIO is not set
CONFIG_SLIMBUS=m
CONFIG_SLIM_QCOM_CTRL=m
# CONFIG_INTERCONNECT is not set
# CONFIG_COUNTER is not set
# CONFIG_MOST is not set
# end of Device Drivers

#
# File systems
#
CONFIG_DCACHE_WORD_ACCESS=y
# CONFIG_VALIDATE_FS_PARSER is not set
CONFIG_FS_IOMAP=y
CONFIG_EXT2_FS=y
CONFIG_EXT2_FS_XATTR=y
CONFIG_EXT2_FS_POSIX_ACL=y
# CONFIG_EXT2_FS_SECURITY is not set
CONFIG_EXT3_FS=y
# CONFIG_EXT3_FS_POSIX_ACL is not set
# CONFIG_EXT3_FS_SECURITY is not set
CONFIG_EXT4_FS=y
# CONFIG_EXT4_FS_POSIX_ACL is not set
# CONFIG_EXT4_FS_SECURITY is not set
CONFIG_EXT4_DEBUG=y
CONFIG_JBD2=y
# CONFIG_JBD2_DEBUG is not set
CONFIG_FS_MBCACHE=y
CONFIG_REISERFS_FS=m
CONFIG_REISERFS_CHECK=y
CONFIG_REISERFS_PROC_INFO=y
# CONFIG_REISERFS_FS_XATTR is not set
CONFIG_JFS_FS=m
# CONFIG_JFS_POSIX_ACL is not set
# CONFIG_JFS_SECURITY is not set
CONFIG_JFS_DEBUG=y
CONFIG_JFS_STATISTICS=y
# CONFIG_XFS_FS is not set
CONFIG_GFS2_FS=y
CONFIG_OCFS2_FS=y
CONFIG_OCFS2_FS_O2CB=y
# CONFIG_OCFS2_FS_USERSPACE_CLUSTER is not set
CONFIG_OCFS2_FS_STATS=y
CONFIG_OCFS2_DEBUG_MASKLOG=y
CONFIG_OCFS2_DEBUG_FS=y
# CONFIG_BTRFS_FS is not set
CONFIG_NILFS2_FS=y
CONFIG_F2FS_FS=m
# CONFIG_F2FS_STAT_FS is not set
CONFIG_F2FS_FS_XATTR=y
# CONFIG_F2FS_FS_POSIX_ACL is not set
# CONFIG_F2FS_FS_SECURITY is not set
CONFIG_F2FS_CHECK_FS=y
# CONFIG_F2FS_FAULT_INJECTION is not set
# CONFIG_F2FS_FS_COMPRESSION is not set
# CONFIG_ZONEFS_FS is not set
# CONFIG_FS_DAX is not set
CONFIG_FS_POSIX_ACL=y
CONFIG_EXPORTFS=y
# CONFIG_EXPORTFS_BLOCK_OPS is not set
CONFIG_FILE_LOCKING=y
CONFIG_MANDATORY_FILE_LOCKING=y
CONFIG_FS_ENCRYPTION=y
CONFIG_FS_ENCRYPTION_ALGS=y
# CONFIG_FS_ENCRYPTION_INLINE_CRYPT is not set
# CONFIG_FS_VERITY is not set
CONFIG_FSNOTIFY=y
CONFIG_DNOTIFY=y
CONFIG_INOTIFY_USER=y
# CONFIG_FANOTIFY is not set
CONFIG_QUOTA=y
# CONFIG_QUOTA_NETLINK_INTERFACE is not set
CONFIG_PRINT_QUOTA_WARNING=y
CONFIG_QUOTA_DEBUG=y
CONFIG_QUOTA_TREE=y
CONFIG_QFMT_V1=m
CONFIG_QFMT_V2=y
CONFIG_QUOTACTL=y
CONFIG_AUTOFS4_FS=y
CONFIG_AUTOFS_FS=y
# CONFIG_FUSE_FS is not set
CONFIG_OVERLAY_FS=m
# CONFIG_OVERLAY_FS_REDIRECT_DIR is not set
CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW=y
# CONFIG_OVERLAY_FS_INDEX is not set
# CONFIG_OVERLAY_FS_XINO_AUTO is not set
# CONFIG_OVERLAY_FS_METACOPY is not set

#
# Caches
#
CONFIG_FSCACHE=y
# CONFIG_FSCACHE_STATS is not set
# CONFIG_FSCACHE_HISTOGRAM is not set
CONFIG_FSCACHE_DEBUG=y
# CONFIG_FSCACHE_OBJECT_LIST is not set
CONFIG_CACHEFILES=y
# CONFIG_CACHEFILES_DEBUG is not set
# CONFIG_CACHEFILES_HISTOGRAM is not set
# end of Caches

#
# CD-ROM/DVD Filesystems
#
CONFIG_ISO9660_FS=m
CONFIG_JOLIET=y
# CONFIG_ZISOFS is not set
CONFIG_UDF_FS=m
# end of CD-ROM/DVD Filesystems

#
# DOS/FAT/EXFAT/NT Filesystems
#
CONFIG_FAT_FS=y
# CONFIG_MSDOS_FS is not set
CONFIG_VFAT_FS=y
CONFIG_FAT_DEFAULT_CODEPAGE=437
CONFIG_FAT_DEFAULT_IOCHARSET="iso8859-1"
# CONFIG_FAT_DEFAULT_UTF8 is not set
# CONFIG_EXFAT_FS is not set
CONFIG_NTFS_FS=m
CONFIG_NTFS_DEBUG=y
# CONFIG_NTFS_RW is not set
# end of DOS/FAT/EXFAT/NT Filesystems

#
# Pseudo filesystems
#
CONFIG_PROC_FS=y
# CONFIG_PROC_KCORE is not set
CONFIG_PROC_SYSCTL=y
CONFIG_PROC_PAGE_MONITOR=y
# CONFIG_PROC_CHILDREN is not set
CONFIG_PROC_PID_ARCH_STATUS=y
CONFIG_PROC_CPU_RESCTRL=y
CONFIG_KERNFS=y
CONFIG_SYSFS=y
CONFIG_TMPFS=y
CONFIG_TMPFS_POSIX_ACL=y
CONFIG_TMPFS_XATTR=y
CONFIG_TMPFS_INODE64=y
# CONFIG_HUGETLBFS is not set
CONFIG_MEMFD_CREATE=y
CONFIG_ARCH_HAS_GIGANTIC_PAGE=y
CONFIG_CONFIGFS_FS=y
# end of Pseudo filesystems

CONFIG_MISC_FILESYSTEMS=y
CONFIG_ORANGEFS_FS=y
CONFIG_ADFS_FS=m
# CONFIG_ADFS_FS_RW is not set
CONFIG_AFFS_FS=m
CONFIG_ECRYPT_FS=m
CONFIG_ECRYPT_FS_MESSAGING=y
CONFIG_HFS_FS=m
# CONFIG_HFSPLUS_FS is not set
CONFIG_BEFS_FS=y
CONFIG_BEFS_DEBUG=y
# CONFIG_BFS_FS is not set
CONFIG_EFS_FS=m
CONFIG_CRAMFS=y
CONFIG_CRAMFS_BLOCKDEV=y
CONFIG_SQUASHFS=m
# CONFIG_SQUASHFS_FILE_CACHE is not set
CONFIG_SQUASHFS_FILE_DIRECT=y
# CONFIG_SQUASHFS_DECOMP_SINGLE is not set
# CONFIG_SQUASHFS_DECOMP_MULTI is not set
CONFIG_SQUASHFS_DECOMP_MULTI_PERCPU=y
CONFIG_SQUASHFS_XATTR=y
# CONFIG_SQUASHFS_ZLIB is not set
# CONFIG_SQUASHFS_LZ4 is not set
CONFIG_SQUASHFS_LZO=y
CONFIG_SQUASHFS_XZ=y
CONFIG_SQUASHFS_ZSTD=y
CONFIG_SQUASHFS_4K_DEVBLK_SIZE=y
# CONFIG_SQUASHFS_EMBEDDED is not set
CONFIG_SQUASHFS_FRAGMENT_CACHE_SIZE=3
CONFIG_VXFS_FS=y
# CONFIG_MINIX_FS is not set
CONFIG_OMFS_FS=y
CONFIG_HPFS_FS=y
# CONFIG_QNX4FS_FS is not set
CONFIG_QNX6FS_FS=y
CONFIG_QNX6FS_DEBUG=y
CONFIG_ROMFS_FS=y
CONFIG_ROMFS_BACKED_BY_BLOCK=y
CONFIG_ROMFS_ON_BLOCK=y
# CONFIG_PSTORE is not set
CONFIG_SYSV_FS=y
CONFIG_UFS_FS=y
# CONFIG_UFS_FS_WRITE is not set
# CONFIG_UFS_DEBUG is not set
CONFIG_EROFS_FS=y
# CONFIG_EROFS_FS_DEBUG is not set
CONFIG_EROFS_FS_XATTR=y
# CONFIG_EROFS_FS_POSIX_ACL is not set
CONFIG_EROFS_FS_SECURITY=y
CONFIG_EROFS_FS_ZIP=y
CONFIG_EROFS_FS_CLUSTER_PAGE_LIMIT=1
# CONFIG_NETWORK_FILESYSTEMS is not set
CONFIG_NLS=y
CONFIG_NLS_DEFAULT="iso8859-1"
CONFIG_NLS_CODEPAGE_437=y
CONFIG_NLS_CODEPAGE_737=m
CONFIG_NLS_CODEPAGE_775=y
CONFIG_NLS_CODEPAGE_850=y
# CONFIG_NLS_CODEPAGE_852 is not set
# CONFIG_NLS_CODEPAGE_855 is not set
# CONFIG_NLS_CODEPAGE_857 is not set
# CONFIG_NLS_CODEPAGE_860 is not set
CONFIG_NLS_CODEPAGE_861=y
CONFIG_NLS_CODEPAGE_862=m
CONFIG_NLS_CODEPAGE_863=m
# CONFIG_NLS_CODEPAGE_864 is not set
CONFIG_NLS_CODEPAGE_865=y
CONFIG_NLS_CODEPAGE_866=y
# CONFIG_NLS_CODEPAGE_869 is not set
CONFIG_NLS_CODEPAGE_936=y
# CONFIG_NLS_CODEPAGE_950 is not set
# CONFIG_NLS_CODEPAGE_932 is not set
# CONFIG_NLS_CODEPAGE_949 is not set
# CONFIG_NLS_CODEPAGE_874 is not set
CONFIG_NLS_ISO8859_8=m
CONFIG_NLS_CODEPAGE_1250=m
# CONFIG_NLS_CODEPAGE_1251 is not set
CONFIG_NLS_ASCII=m
CONFIG_NLS_ISO8859_1=m
CONFIG_NLS_ISO8859_2=m
# CONFIG_NLS_ISO8859_3 is not set
# CONFIG_NLS_ISO8859_4 is not set
CONFIG_NLS_ISO8859_5=y
CONFIG_NLS_ISO8859_6=m
CONFIG_NLS_ISO8859_7=y
CONFIG_NLS_ISO8859_9=m
CONFIG_NLS_ISO8859_13=y
CONFIG_NLS_ISO8859_14=m
CONFIG_NLS_ISO8859_15=y
# CONFIG_NLS_KOI8_R is not set
CONFIG_NLS_KOI8_U=y
CONFIG_NLS_MAC_ROMAN=y
# CONFIG_NLS_MAC_CELTIC is not set
CONFIG_NLS_MAC_CENTEURO=m
# CONFIG_NLS_MAC_CROATIAN is not set
# CONFIG_NLS_MAC_CYRILLIC is not set
CONFIG_NLS_MAC_GAELIC=y
CONFIG_NLS_MAC_GREEK=m
CONFIG_NLS_MAC_ICELAND=y
CONFIG_NLS_MAC_INUIT=y
# CONFIG_NLS_MAC_ROMANIAN is not set
CONFIG_NLS_MAC_TURKISH=m
CONFIG_NLS_UTF8=m
CONFIG_DLM=m
CONFIG_DLM_DEBUG=y
CONFIG_UNICODE=y
# CONFIG_UNICODE_NORMALIZATION_SELFTEST is not set
CONFIG_IO_WQ=y
# end of File systems

#
# Security options
#
CONFIG_KEYS=y
# CONFIG_KEYS_REQUEST_CACHE is not set
# CONFIG_PERSISTENT_KEYRINGS is not set
CONFIG_ENCRYPTED_KEYS=y
CONFIG_KEY_DH_OPERATIONS=y
# CONFIG_KEY_NOTIFICATIONS is not set
CONFIG_SECURITY_DMESG_RESTRICT=y
CONFIG_SECURITY=y
# CONFIG_SECURITYFS is not set
# CONFIG_SECURITY_NETWORK is not set
CONFIG_PAGE_TABLE_ISOLATION=y
# CONFIG_SECURITY_INFINIBAND is not set
# CONFIG_SECURITY_PATH is not set
CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=y
CONFIG_HARDENED_USERCOPY=y
CONFIG_HARDENED_USERCOPY_FALLBACK=y
# CONFIG_STATIC_USERMODEHELPER is not set
# CONFIG_SECURITY_SMACK is not set
# CONFIG_SECURITY_TOMOYO is not set
# CONFIG_SECURITY_APPARMOR is not set
# CONFIG_SECURITY_LOADPIN is not set
# CONFIG_SECURITY_YAMA is not set
# CONFIG_SECURITY_SAFESETID is not set
# CONFIG_SECURITY_LOCKDOWN_LSM is not set
CONFIG_INTEGRITY=y
# CONFIG_INTEGRITY_SIGNATURE is not set
# CONFIG_IMA is not set
# CONFIG_EVM is not set
CONFIG_DEFAULT_SECURITY_DAC=y
CONFIG_LSM="landlock,lockdown,yama,loadpin,safesetid,bpf"

#
# Kernel hardening options
#

#
# Memory initialization
#
CONFIG_CC_HAS_AUTO_VAR_INIT_PATTERN=y
CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO=y
# CONFIG_INIT_STACK_NONE is not set
CONFIG_INIT_STACK_ALL_PATTERN=y
# CONFIG_INIT_STACK_ALL_ZERO is not set
# CONFIG_INIT_ON_ALLOC_DEFAULT_ON is not set
# CONFIG_INIT_ON_FREE_DEFAULT_ON is not set
# end of Memory initialization
# end of Kernel hardening options
# end of Security options

CONFIG_CRYPTO=y

#
# Crypto core or helper
#
CONFIG_CRYPTO_ALGAPI=y
CONFIG_CRYPTO_ALGAPI2=y
CONFIG_CRYPTO_AEAD=y
CONFIG_CRYPTO_AEAD2=y
CONFIG_CRYPTO_SKCIPHER=y
CONFIG_CRYPTO_SKCIPHER2=y
CONFIG_CRYPTO_HASH=y
CONFIG_CRYPTO_HASH2=y
CONFIG_CRYPTO_RNG=y
CONFIG_CRYPTO_RNG2=y
CONFIG_CRYPTO_RNG_DEFAULT=y
CONFIG_CRYPTO_AKCIPHER2=y
CONFIG_CRYPTO_AKCIPHER=y
CONFIG_CRYPTO_KPP2=y
CONFIG_CRYPTO_KPP=y
CONFIG_CRYPTO_ACOMP2=y
CONFIG_CRYPTO_MANAGER=y
CONFIG_CRYPTO_MANAGER2=y
# CONFIG_CRYPTO_USER is not set
CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
CONFIG_CRYPTO_GF128MUL=y
CONFIG_CRYPTO_NULL=y
CONFIG_CRYPTO_NULL2=y
CONFIG_CRYPTO_PCRYPT=m
CONFIG_CRYPTO_CRYPTD=y
CONFIG_CRYPTO_AUTHENC=y
# CONFIG_CRYPTO_TEST is not set
CONFIG_CRYPTO_SIMD=y
CONFIG_CRYPTO_GLUE_HELPER_X86=y

#
# Public-key cryptography
#
CONFIG_CRYPTO_RSA=y
CONFIG_CRYPTO_DH=y
# CONFIG_CRYPTO_ECDH is not set
# CONFIG_CRYPTO_ECRDSA is not set
# CONFIG_CRYPTO_SM2 is not set
# CONFIG_CRYPTO_CURVE25519 is not set
CONFIG_CRYPTO_CURVE25519_X86=m

#
# Authenticated Encryption with Associated Data
#
CONFIG_CRYPTO_CCM=y
CONFIG_CRYPTO_GCM=y
# CONFIG_CRYPTO_CHACHA20POLY1305 is not set
# CONFIG_CRYPTO_AEGIS128 is not set
# CONFIG_CRYPTO_AEGIS128_AESNI_SSE2 is not set
CONFIG_CRYPTO_SEQIV=m
CONFIG_CRYPTO_ECHAINIV=y

#
# Block modes
#
CONFIG_CRYPTO_CBC=y
CONFIG_CRYPTO_CFB=y
CONFIG_CRYPTO_CTR=y
CONFIG_CRYPTO_CTS=y
CONFIG_CRYPTO_ECB=y
# CONFIG_CRYPTO_LRW is not set
CONFIG_CRYPTO_OFB=m
CONFIG_CRYPTO_PCBC=m
CONFIG_CRYPTO_XTS=y
CONFIG_CRYPTO_KEYWRAP=y
CONFIG_CRYPTO_NHPOLY1305=y
CONFIG_CRYPTO_NHPOLY1305_SSE2=y
# CONFIG_CRYPTO_NHPOLY1305_AVX2 is not set
CONFIG_CRYPTO_ADIANTUM=y
CONFIG_CRYPTO_ESSIV=y

#
# Hash modes
#
CONFIG_CRYPTO_CMAC=y
CONFIG_CRYPTO_HMAC=y
CONFIG_CRYPTO_XCBC=m
# CONFIG_CRYPTO_VMAC is not set

#
# Digest
#
CONFIG_CRYPTO_CRC32C=y
CONFIG_CRYPTO_CRC32C_INTEL=y
CONFIG_CRYPTO_CRC32=m
# CONFIG_CRYPTO_CRC32_PCLMUL is not set
# CONFIG_CRYPTO_XXHASH is not set
CONFIG_CRYPTO_BLAKE2B=y
# CONFIG_CRYPTO_BLAKE2S is not set
CONFIG_CRYPTO_BLAKE2S_X86=y
CONFIG_CRYPTO_CRCT10DIF=m
CONFIG_CRYPTO_GHASH=y
# CONFIG_CRYPTO_POLY1305 is not set
CONFIG_CRYPTO_POLY1305_X86_64=m
CONFIG_CRYPTO_MD4=m
CONFIG_CRYPTO_MD5=y
# CONFIG_CRYPTO_MICHAEL_MIC is not set
# CONFIG_CRYPTO_RMD128 is not set
# CONFIG_CRYPTO_RMD160 is not set
# CONFIG_CRYPTO_RMD256 is not set
# CONFIG_CRYPTO_RMD320 is not set
CONFIG_CRYPTO_SHA1=m
CONFIG_CRYPTO_SHA1_SSSE3=m
CONFIG_CRYPTO_SHA256_SSSE3=y
# CONFIG_CRYPTO_SHA512_SSSE3 is not set
CONFIG_CRYPTO_SHA256=y
CONFIG_CRYPTO_SHA512=y
CONFIG_CRYPTO_SHA3=y
CONFIG_CRYPTO_SM3=y
CONFIG_CRYPTO_STREEBOG=m
# CONFIG_CRYPTO_TGR192 is not set
CONFIG_CRYPTO_WP512=y
CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL=y

#
# Ciphers
#
CONFIG_CRYPTO_AES=y
CONFIG_CRYPTO_AES_TI=y
# CONFIG_CRYPTO_AES_NI_INTEL is not set
CONFIG_CRYPTO_BLOWFISH=y
CONFIG_CRYPTO_BLOWFISH_COMMON=y
CONFIG_CRYPTO_BLOWFISH_X86_64=m
# CONFIG_CRYPTO_CAMELLIA is not set
CONFIG_CRYPTO_CAMELLIA_X86_64=y
CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64=m
# CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64 is not set
CONFIG_CRYPTO_CAST_COMMON=m
# CONFIG_CRYPTO_CAST5 is not set
# CONFIG_CRYPTO_CAST5_AVX_X86_64 is not set
CONFIG_CRYPTO_CAST6=m
CONFIG_CRYPTO_CAST6_AVX_X86_64=m
# CONFIG_CRYPTO_DES is not set
# CONFIG_CRYPTO_DES3_EDE_X86_64 is not set
CONFIG_CRYPTO_FCRYPT=y
# CONFIG_CRYPTO_SALSA20 is not set
CONFIG_CRYPTO_CHACHA20=y
CONFIG_CRYPTO_CHACHA20_X86_64=y
CONFIG_CRYPTO_SERPENT=y
CONFIG_CRYPTO_SERPENT_SSE2_X86_64=y
# CONFIG_CRYPTO_SERPENT_AVX_X86_64 is not set
# CONFIG_CRYPTO_SERPENT_AVX2_X86_64 is not set
CONFIG_CRYPTO_SM4=y
# CONFIG_CRYPTO_TWOFISH is not set
CONFIG_CRYPTO_TWOFISH_COMMON=y
CONFIG_CRYPTO_TWOFISH_X86_64=y
CONFIG_CRYPTO_TWOFISH_X86_64_3WAY=y
CONFIG_CRYPTO_TWOFISH_AVX_X86_64=y

#
# Compression
#
CONFIG_CRYPTO_DEFLATE=m
CONFIG_CRYPTO_LZO=m
CONFIG_CRYPTO_842=m
# CONFIG_CRYPTO_LZ4 is not set
# CONFIG_CRYPTO_LZ4HC is not set
# CONFIG_CRYPTO_ZSTD is not set

#
# Random Number Generation
#
CONFIG_CRYPTO_ANSI_CPRNG=y
CONFIG_CRYPTO_DRBG_MENU=y
CONFIG_CRYPTO_DRBG_HMAC=y
# CONFIG_CRYPTO_DRBG_HASH is not set
# CONFIG_CRYPTO_DRBG_CTR is not set
CONFIG_CRYPTO_DRBG=y
CONFIG_CRYPTO_JITTERENTROPY=y
# CONFIG_CRYPTO_USER_API_HASH is not set
# CONFIG_CRYPTO_USER_API_SKCIPHER is not set
# CONFIG_CRYPTO_USER_API_RNG is not set
# CONFIG_CRYPTO_USER_API_AEAD is not set
CONFIG_CRYPTO_HASH_INFO=y

#
# Crypto library routines
#
CONFIG_CRYPTO_LIB_AES=y
CONFIG_CRYPTO_LIB_ARC4=y
CONFIG_CRYPTO_ARCH_HAVE_LIB_BLAKE2S=y
CONFIG_CRYPTO_LIB_BLAKE2S_GENERIC=y
CONFIG_CRYPTO_LIB_BLAKE2S=m
CONFIG_CRYPTO_ARCH_HAVE_LIB_CHACHA=y
CONFIG_CRYPTO_LIB_CHACHA_GENERIC=y
CONFIG_CRYPTO_LIB_CHACHA=y
CONFIG_CRYPTO_ARCH_HAVE_LIB_CURVE25519=m
CONFIG_CRYPTO_LIB_CURVE25519_GENERIC=m
CONFIG_CRYPTO_LIB_CURVE25519=m
CONFIG_CRYPTO_LIB_POLY1305_RSIZE=11
CONFIG_CRYPTO_ARCH_HAVE_LIB_POLY1305=m
CONFIG_CRYPTO_LIB_POLY1305_GENERIC=y
CONFIG_CRYPTO_LIB_POLY1305=m
CONFIG_CRYPTO_LIB_CHACHA20POLY1305=m
CONFIG_CRYPTO_LIB_SHA256=y
# CONFIG_CRYPTO_HW is not set
CONFIG_ASYMMETRIC_KEY_TYPE=y
CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=y
CONFIG_X509_CERTIFICATE_PARSER=y
# CONFIG_PKCS8_PRIVATE_KEY_PARSER is not set
CONFIG_PKCS7_MESSAGE_PARSER=y
# CONFIG_PKCS7_TEST_KEY is not set
# CONFIG_SIGNED_PE_FILE_VERIFICATION is not set

#
# Certificates for signature checking
#
CONFIG_SYSTEM_TRUSTED_KEYRING=y
CONFIG_SYSTEM_TRUSTED_KEYS=""
# CONFIG_SYSTEM_EXTRA_CERTIFICATE is not set
# CONFIG_SECONDARY_TRUSTED_KEYRING is not set
CONFIG_SYSTEM_BLACKLIST_KEYRING=y
CONFIG_SYSTEM_BLACKLIST_HASH_LIST=""
CONFIG_SYSTEM_REVOCATION_LIST=y
CONFIG_SYSTEM_REVOCATION_KEYS=""
# end of Certificates for signature checking

CONFIG_BINARY_PRINTF=y

#
# Library routines
#
CONFIG_LINEAR_RANGES=y
CONFIG_PACKING=y
CONFIG_BITREVERSE=y
CONFIG_GENERIC_STRNCPY_FROM_USER=y
CONFIG_GENERIC_STRNLEN_USER=y
CONFIG_GENERIC_NET_UTILS=y
CONFIG_GENERIC_FIND_FIRST_BIT=y
CONFIG_CORDIC=y
CONFIG_PRIME_NUMBERS=y
CONFIG_RATIONAL=y
CONFIG_GENERIC_PCI_IOMAP=y
CONFIG_GENERIC_IOMAP=y
CONFIG_ARCH_USE_CMPXCHG_LOCKREF=y
CONFIG_ARCH_HAS_FAST_MULTIPLIER=y
CONFIG_ARCH_USE_SYM_ANNOTATIONS=y
CONFIG_CRC_CCITT=y
CONFIG_CRC16=y
# CONFIG_CRC_T10DIF is not set
CONFIG_CRC_ITU_T=y
CONFIG_CRC32=y
# CONFIG_CRC32_SELFTEST is not set
# CONFIG_CRC32_SLICEBY8 is not set
# CONFIG_CRC32_SLICEBY4 is not set
CONFIG_CRC32_SARWATE=y
# CONFIG_CRC32_BIT is not set
# CONFIG_CRC64 is not set
# CONFIG_CRC4 is not set
CONFIG_CRC7=m
CONFIG_LIBCRC32C=y
CONFIG_CRC8=y
CONFIG_XXHASH=y
# CONFIG_RANDOM32_SELFTEST is not set
CONFIG_842_COMPRESS=m
CONFIG_842_DECOMPRESS=m
CONFIG_ZLIB_INFLATE=y
CONFIG_ZLIB_DEFLATE=m
CONFIG_LZO_COMPRESS=m
CONFIG_LZO_DECOMPRESS=m
CONFIG_LZ4_DECOMPRESS=y
CONFIG_ZSTD_DECOMPRESS=y
CONFIG_XZ_DEC=y
CONFIG_XZ_DEC_X86=y
CONFIG_XZ_DEC_POWERPC=y
CONFIG_XZ_DEC_IA64=y
CONFIG_XZ_DEC_ARM=y
CONFIG_XZ_DEC_ARMTHUMB=y
CONFIG_XZ_DEC_SPARC=y
CONFIG_XZ_DEC_BCJ=y
# CONFIG_XZ_DEC_TEST is not set
CONFIG_DECOMPRESS_GZIP=y
CONFIG_DECOMPRESS_BZIP2=y
CONFIG_DECOMPRESS_LZMA=y
CONFIG_DECOMPRESS_LZ4=y
CONFIG_DECOMPRESS_ZSTD=y
CONFIG_GENERIC_ALLOCATOR=y
CONFIG_INTERVAL_TREE=y
CONFIG_XARRAY_MULTI=y
CONFIG_ASSOCIATIVE_ARRAY=y
CONFIG_HAS_IOMEM=y
CONFIG_HAS_IOPORT_MAP=y
CONFIG_HAS_DMA=y
CONFIG_NEED_SG_DMA_LENGTH=y
CONFIG_NEED_DMA_MAP_STATE=y
CONFIG_ARCH_DMA_ADDR_T_64BIT=y
CONFIG_SWIOTLB=y
CONFIG_DMA_CMA=y
CONFIG_DMA_PERNUMA_CMA=y

#
# Default contiguous memory area size:
#
CONFIG_CMA_SIZE_PERCENTAGE=0
# CONFIG_CMA_SIZE_SEL_MBYTES is not set
CONFIG_CMA_SIZE_SEL_PERCENTAGE=y
# CONFIG_CMA_SIZE_SEL_MIN is not set
# CONFIG_CMA_SIZE_SEL_MAX is not set
CONFIG_CMA_ALIGNMENT=8
# CONFIG_DMA_API_DEBUG is not set
CONFIG_SGL_ALLOC=y
CONFIG_CHECK_SIGNATURE=y
# CONFIG_CPUMASK_OFFSTACK is not set
CONFIG_CPU_RMAP=y
CONFIG_DQL=y
CONFIG_GLOB=y
# CONFIG_GLOB_SELFTEST is not set
CONFIG_NLATTR=y
CONFIG_CLZ_TAB=y
CONFIG_IRQ_POLL=y
CONFIG_MPILIB=y
CONFIG_DIMLIB=y
CONFIG_OID_REGISTRY=y
CONFIG_HAVE_GENERIC_VDSO=y
CONFIG_GENERIC_GETTIMEOFDAY=y
CONFIG_GENERIC_VDSO_TIME_NS=y
CONFIG_FONT_SUPPORT=y
# CONFIG_FONTS is not set
CONFIG_FONT_8x8=y
CONFIG_FONT_8x16=y
CONFIG_SG_POOL=y
CONFIG_ARCH_HAS_PMEM_API=y
CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE=y
CONFIG_ARCH_HAS_COPY_MC=y
CONFIG_ARCH_STACKWALK=y
CONFIG_STACKDEPOT=y
CONFIG_SBITMAP=y
# CONFIG_STRING_SELFTEST is not set
# end of Library routines

#
# Kernel hacking
#

#
# printk and dmesg options
#
CONFIG_PRINTK_TIME=y
CONFIG_PRINTK_CALLER=y
CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
CONFIG_CONSOLE_LOGLEVEL_QUIET=4
CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
# CONFIG_BOOT_PRINTK_DELAY is not set
# CONFIG_DYNAMIC_DEBUG is not set
CONFIG_DYNAMIC_DEBUG_CORE=y
# CONFIG_SYMBOLIC_ERRNAME is not set
CONFIG_DEBUG_BUGVERBOSE=y
# end of printk and dmesg options

#
# Compile-time checks and compiler options
#
CONFIG_DEBUG_INFO=y
CONFIG_DEBUG_INFO_REDUCED=y
# CONFIG_DEBUG_INFO_SPLIT is not set
# CONFIG_DEBUG_INFO_DWARF4 is not set
# CONFIG_GDB_SCRIPTS is not set
CONFIG_ENABLE_MUST_CHECK=y
CONFIG_FRAME_WARN=8192
# CONFIG_STRIP_ASM_SYMS is not set
# CONFIG_READABLE_ASM is not set
CONFIG_HEADERS_INSTALL=y
CONFIG_DEBUG_SECTION_MISMATCH=y
CONFIG_SECTION_MISMATCH_WARN_ONLY=y
CONFIG_STACK_VALIDATION=y
CONFIG_DEBUG_FORCE_WEAK_PER_CPU=y
# end of Compile-time checks and compiler options

#
# Generic Kernel Debugging Instruments
#
CONFIG_MAGIC_SYSRQ=y
CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=0x1
CONFIG_MAGIC_SYSRQ_SERIAL=y
CONFIG_MAGIC_SYSRQ_SERIAL_SEQUENCE=""
CONFIG_DEBUG_FS=y
# CONFIG_DEBUG_FS_ALLOW_ALL is not set
# CONFIG_DEBUG_FS_DISALLOW_MOUNT is not set
CONFIG_DEBUG_FS_ALLOW_NONE=y
CONFIG_HAVE_ARCH_KGDB=y
# CONFIG_KGDB is not set
CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=y
CONFIG_UBSAN=y
# CONFIG_UBSAN_TRAP is not set
CONFIG_UBSAN_BOUNDS=y
CONFIG_UBSAN_MISC=y
CONFIG_UBSAN_SANITIZE_ALL=y
# CONFIG_UBSAN_ALIGNMENT is not set
# CONFIG_TEST_UBSAN is not set
CONFIG_HAVE_ARCH_KCSAN=y
CONFIG_HAVE_KCSAN_COMPILER=y
# end of Generic Kernel Debugging Instruments

CONFIG_DEBUG_KERNEL=y
# CONFIG_DEBUG_MISC is not set

#
# Memory Debugging
#
CONFIG_PAGE_EXTENSION=y
# CONFIG_DEBUG_PAGEALLOC is not set
CONFIG_PAGE_OWNER=y
CONFIG_PAGE_POISONING=y
# CONFIG_PAGE_POISONING_NO_SANITY is not set
# CONFIG_PAGE_POISONING_ZERO is not set
# CONFIG_DEBUG_PAGE_REF is not set
# CONFIG_DEBUG_RODATA_TEST is not set
CONFIG_ARCH_HAS_DEBUG_WX=y
CONFIG_DEBUG_WX=y
CONFIG_GENERIC_PTDUMP=y
CONFIG_PTDUMP_CORE=y
# CONFIG_PTDUMP_DEBUGFS is not set
CONFIG_DEBUG_OBJECTS=y
# CONFIG_DEBUG_OBJECTS_SELFTEST is not set
# CONFIG_DEBUG_OBJECTS_FREE is not set
# CONFIG_DEBUG_OBJECTS_TIMERS is not set
# CONFIG_DEBUG_OBJECTS_WORK is not set
# CONFIG_DEBUG_OBJECTS_RCU_HEAD is not set
# CONFIG_DEBUG_OBJECTS_PERCPU_COUNTER is not set
CONFIG_DEBUG_OBJECTS_ENABLE_DEFAULT=1
# CONFIG_SLUB_DEBUG_ON is not set
# CONFIG_SLUB_STATS is not set
CONFIG_HAVE_DEBUG_KMEMLEAK=y
CONFIG_DEBUG_KMEMLEAK=y
CONFIG_DEBUG_KMEMLEAK_MEM_POOL_SIZE=16000
# CONFIG_DEBUG_KMEMLEAK_TEST is not set
# CONFIG_DEBUG_KMEMLEAK_DEFAULT_OFF is not set
CONFIG_DEBUG_KMEMLEAK_AUTO_SCAN=y
# CONFIG_DEBUG_STACK_USAGE is not set
# CONFIG_SCHED_STACK_END_CHECK is not set
CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE=y
CONFIG_DEBUG_VM=y
# CONFIG_DEBUG_VM_VMACACHE is not set
# CONFIG_DEBUG_VM_RB is not set
CONFIG_DEBUG_VM_PGFLAGS=y
CONFIG_DEBUG_VM_PGTABLE=y
CONFIG_ARCH_HAS_DEBUG_VIRTUAL=y
# CONFIG_DEBUG_VIRTUAL is not set
CONFIG_DEBUG_MEMORY_INIT=y
CONFIG_DEBUG_PER_CPU_MAPS=y
CONFIG_HAVE_ARCH_KASAN=y
CONFIG_HAVE_ARCH_KASAN_VMALLOC=y
CONFIG_CC_HAS_KASAN_GENERIC=y
CONFIG_CC_HAS_KASAN_SW_TAGS=y
CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=y
CONFIG_KASAN=y
CONFIG_KASAN_GENERIC=y
# CONFIG_KASAN_OUTLINE is not set
CONFIG_KASAN_INLINE=y
# CONFIG_KASAN_STACK_ENABLE is not set
CONFIG_KASAN_STACK=0
CONFIG_KASAN_VMALLOC=y
# CONFIG_TEST_KASAN_MODULE is not set
# end of Memory Debugging

CONFIG_DEBUG_SHIRQ=y

#
# Debug Oops, Lockups and Hangs
#
CONFIG_PANIC_ON_OOPS=y
CONFIG_PANIC_ON_OOPS_VALUE=1
CONFIG_PANIC_TIMEOUT=0
CONFIG_LOCKUP_DETECTOR=y
CONFIG_SOFTLOCKUP_DETECTOR=y
# CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE=0
CONFIG_HARDLOCKUP_DETECTOR_PERF=y
CONFIG_HARDLOCKUP_CHECK_TIMESTAMP=y
CONFIG_HARDLOCKUP_DETECTOR=y
CONFIG_BOOTPARAM_HARDLOCKUP_PANIC=y
CONFIG_BOOTPARAM_HARDLOCKUP_PANIC_VALUE=1
CONFIG_DETECT_HUNG_TASK=y
CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=480
# CONFIG_BOOTPARAM_HUNG_TASK_PANIC is not set
CONFIG_BOOTPARAM_HUNG_TASK_PANIC_VALUE=0
CONFIG_WQ_WATCHDOG=y
# CONFIG_TEST_LOCKUP is not set
# end of Debug Oops, Lockups and Hangs

#
# Scheduler Debugging
#
CONFIG_SCHED_DEBUG=y
CONFIG_SCHED_INFO=y
CONFIG_SCHEDSTATS=y
# end of Scheduler Debugging

# CONFIG_DEBUG_TIMEKEEPING is not set

#
# Lock Debugging (spinlocks, mutexes, etc...)
#
CONFIG_LOCK_DEBUGGING_SUPPORT=y
CONFIG_PROVE_LOCKING=y
# CONFIG_PROVE_RAW_LOCK_NESTING is not set
CONFIG_LOCK_STAT=y
CONFIG_DEBUG_RT_MUTEXES=y
CONFIG_DEBUG_SPINLOCK=y
CONFIG_DEBUG_MUTEXES=y
CONFIG_DEBUG_WW_MUTEX_SLOWPATH=y
CONFIG_DEBUG_RWSEMS=y
CONFIG_DEBUG_LOCK_ALLOC=y
CONFIG_LOCKDEP=y
# CONFIG_DEBUG_LOCKDEP is not set
CONFIG_DEBUG_ATOMIC_SLEEP=y
# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
CONFIG_LOCK_TORTURE_TEST=m
# CONFIG_WW_MUTEX_SELFTEST is not set
# CONFIG_SCF_TORTURE_TEST is not set
# CONFIG_CSD_LOCK_WAIT_DEBUG is not set
# end of Lock Debugging (spinlocks, mutexes, etc...)

CONFIG_TRACE_IRQFLAGS=y
CONFIG_TRACE_IRQFLAGS_NMI=y
CONFIG_STACKTRACE=y
# CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
# CONFIG_DEBUG_KOBJECT is not set

#
# Debug kernel data structures
#
# CONFIG_DEBUG_LIST is not set
CONFIG_DEBUG_PLIST=y
CONFIG_DEBUG_SG=y
# CONFIG_DEBUG_NOTIFIERS is not set
# CONFIG_BUG_ON_DATA_CORRUPTION is not set
# end of Debug kernel data structures

# CONFIG_DEBUG_CREDENTIALS is not set

#
# RCU Debugging
#
CONFIG_PROVE_RCU=y
# CONFIG_PROVE_RCU_LIST is not set
CONFIG_TORTURE_TEST=m
CONFIG_RCU_SCALE_TEST=m
CONFIG_RCU_TORTURE_TEST=m
CONFIG_RCU_REF_SCALE_TEST=m
CONFIG_RCU_CPU_STALL_TIMEOUT=21
# CONFIG_RCU_TRACE is not set
CONFIG_RCU_EQS_DEBUG=y
# CONFIG_RCU_STRICT_GRACE_PERIOD is not set
# end of RCU Debugging

CONFIG_DEBUG_WQ_FORCE_RR_CPU=y
# CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
CONFIG_CPU_HOTPLUG_STATE_CONTROL=y
CONFIG_LATENCYTOP=y
CONFIG_USER_STACKTRACE_SUPPORT=y
CONFIG_NOP_TRACER=y
CONFIG_HAVE_FUNCTION_TRACER=y
CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
CONFIG_HAVE_DYNAMIC_FTRACE=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=y
CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
CONFIG_HAVE_FENTRY=y
CONFIG_HAVE_C_RECORDMCOUNT=y
CONFIG_TRACE_CLOCK=y
CONFIG_RING_BUFFER=y
CONFIG_EVENT_TRACING=y
CONFIG_CONTEXT_SWITCH_TRACER=y
CONFIG_PREEMPTIRQ_TRACEPOINTS=y
CONFIG_TRACING=y
CONFIG_TRACING_SUPPORT=y
CONFIG_FTRACE=y
# CONFIG_BOOTTIME_TRACING is not set
# CONFIG_FUNCTION_TRACER is not set
# CONFIG_STACK_TRACER is not set
# CONFIG_IRQSOFF_TRACER is not set
# CONFIG_SCHED_TRACER is not set
# CONFIG_HWLAT_TRACER is not set
# CONFIG_MMIOTRACE is not set
# CONFIG_ENABLE_DEFAULT_TRACERS is not set
# CONFIG_FTRACE_SYSCALLS is not set
# CONFIG_TRACER_SNAPSHOT is not set
CONFIG_BRANCH_PROFILE_NONE=y
# CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
# CONFIG_PROFILE_ALL_BRANCHES is not set
# CONFIG_BLK_DEV_IO_TRACE is not set
CONFIG_KPROBE_EVENTS=y
CONFIG_UPROBE_EVENTS=y
CONFIG_BPF_EVENTS=y
CONFIG_DYNAMIC_EVENTS=y
CONFIG_PROBE_EVENTS=y
CONFIG_BPF_KPROBE_OVERRIDE=y
# CONFIG_SYNTH_EVENTS is not set
# CONFIG_HIST_TRIGGERS is not set
# CONFIG_TRACE_EVENT_INJECT is not set
# CONFIG_TRACEPOINT_BENCHMARK is not set
# CONFIG_RING_BUFFER_BENCHMARK is not set
# CONFIG_TRACE_EVAL_MAP_FILE is not set
# CONFIG_RING_BUFFER_STARTUP_TEST is not set
# CONFIG_PREEMPTIRQ_DELAY_TEST is not set
# CONFIG_KPROBE_EVENT_GEN_TEST is not set
# CONFIG_PROVIDE_OHCI1394_DMA_INIT is not set
# CONFIG_SAMPLES is not set
CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=y
# CONFIG_STRICT_DEVMEM is not set

#
# x86 Debugging
#
CONFIG_TRACE_IRQFLAGS_SUPPORT=y
CONFIG_TRACE_IRQFLAGS_NMI_SUPPORT=y
CONFIG_EARLY_PRINTK_USB=y
CONFIG_X86_VERBOSE_BOOTUP=y
CONFIG_EARLY_PRINTK=y
CONFIG_EARLY_PRINTK_DBGP=y
CONFIG_EARLY_PRINTK_USB_XDBC=y
# CONFIG_DEBUG_TLBFLUSH is not set
CONFIG_HAVE_MMIOTRACE_SUPPORT=y
# CONFIG_X86_DECODER_SELFTEST is not set
# CONFIG_IO_DELAY_0X80 is not set
CONFIG_IO_DELAY_0XED=y
# CONFIG_IO_DELAY_UDELAY is not set
# CONFIG_IO_DELAY_NONE is not set
CONFIG_DEBUG_BOOT_PARAMS=y
# CONFIG_CPA_DEBUG is not set
# CONFIG_DEBUG_ENTRY is not set
# CONFIG_DEBUG_NMI_SELFTEST is not set
CONFIG_X86_DEBUG_FPU=y
# CONFIG_PUNIT_ATOM_DEBUG is not set
CONFIG_UNWINDER_ORC=y
# CONFIG_UNWINDER_FRAME_POINTER is not set
# end of x86 Debugging

#
# Kernel Testing and Coverage
#
# CONFIG_KUNIT is not set
CONFIG_NOTIFIER_ERROR_INJECTION=y
# CONFIG_PM_NOTIFIER_ERROR_INJECT is not set
CONFIG_NETDEV_NOTIFIER_ERROR_INJECT=y
CONFIG_FUNCTION_ERROR_INJECTION=y
# CONFIG_FAULT_INJECTION is not set
CONFIG_ARCH_HAS_KCOV=y
CONFIG_CC_HAS_SANCOV_TRACE_PC=y
CONFIG_KCOV=y
# CONFIG_KCOV_ENABLE_COMPARISONS is not set
# CONFIG_KCOV_INSTRUMENT_ALL is not set
CONFIG_KCOV_IRQ_AREA_SIZE=0x40000
# CONFIG_RUNTIME_TESTING_MENU is not set
# CONFIG_MEMTEST is not set
# end of Kernel Testing and Coverage
# end of Kernel hacking

--mK1WX8aRyJytxJjx--
