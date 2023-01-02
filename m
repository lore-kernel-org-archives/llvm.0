Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949CD2597;
	Mon,  2 Jan 2023 10:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672656027; x=1704192027;
  h=date:from:cc:subject:message-id:mime-version;
  bh=pUKRK/pAzWSWQJy7cDcFON8+5GfbWz/DwowgYnqgGaI=;
  b=JDdXCTOB4GjtzaD3TjOd/zoFuQCzubBGtTaFtVWFFJNWtnjzO7XNm4QO
   BWtSdx5QJFCboYaFpgonsRyuMAjTwZmrzHi0WuPLwRH3jXRkYHFp6CO5W
   JaPdLZ0DkyAH6RIQoDLA/VwqevJ7ItO2vPFGopUiB1iYlVeFS0bNbw+7Z
   2ZGpKR1tw3GGvGZEpOCrRO7/p49BtGA/IWmwZz13huJ2prEdnX+NiSLde
   4o01EKnpGaSXrT5M3EX737CNT+w6OfBjEkSA9jlKm9BslEAHHatMCTBgs
   9uMJ4OVwXtysucn577Cc77GvGKHExKEDlsYNs25l8BsIuneRsp12dHsmm
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10577"; a="304971569"
X-IronPort-AV: E=Sophos;i="5.96,293,1665471600"; 
   d="scan'208";a="304971569"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2023 02:40:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10577"; a="828532389"
X-IronPort-AV: E=Sophos;i="5.96,293,1665471600"; 
   d="scan'208";a="828532389"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 02 Jan 2023 02:40:22 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pCIEv-000QyL-1g;
	Mon, 02 Jan 2023 10:40:21 +0000
Date: Mon, 2 Jan 2023 18:39:45 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: mm/vmscan.o: warning: objtool: shrink_lruvec+0x498e: sibling call
 from callable instruction with modified stack frame
Message-ID: <202301021804.oJMy43Eq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="aFyeVoEmScvBAg7o"
Content-Disposition: inline


--aFyeVoEmScvBAg7o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Yu Zhao <yuzhao@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

Hi Yu,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   88603b6dc419445847923fcb7fe5080067a30f98
commit: 354ed597442952fb680c9cafc7e4eb8a76f9514c mm: multi-gen LRU: kill switch
date:   3 months ago
config: x86_64-randconfig-k001-20230102
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=354ed597442952fb680c9cafc7e4eb8a76f9514c
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 354ed597442952fb680c9cafc7e4eb8a76f9514c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> mm/vmscan.o: warning: objtool: shrink_lruvec+0x498e: sibling call from callable instruction with modified stack frame


objdump-func vmlinux.o shrink_lruvec:
0000 0000000000591c7a <shrink_lruvec>:
0000   591c7a:	55                   	push   %rbp
0001   591c7b:	48 89 e5             	mov    %rsp,%rbp
0004   591c7e:	41 57                	push   %r15
0006   591c80:	41 56                	push   %r14
0008   591c82:	41 55                	push   %r13
000a   591c84:	41 54                	push   %r12
000c   591c86:	53                   	push   %rbx
000d   591c87:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
0011   591c8b:	48 81 ec 50 03 00 00 	sub    $0x350,%rsp
0018   591c92:	49 89 f4             	mov    %rsi,%r12
001b   591c95:	48 89 7c 24 10       	mov    %rdi,0x10(%rsp)
0020   591c9a:	49 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r14
002a   591ca4:	e8 00 00 00 00       	call   591ca9 <shrink_lruvec+0x2f>	591ca5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
002f   591ca9:	48 8d bc 24 b0 01 00 00 	lea    0x1b0(%rsp),%rdi
0037   591cb1:	ba 28 00 00 00       	mov    $0x28,%edx
003c   591cb6:	be aa 00 00 00       	mov    $0xaa,%esi
0041   591cbb:	e8 00 00 00 00       	call   591cc0 <shrink_lruvec+0x46>	591cbc: R_X86_64_PLT32	memset-0x4
0046   591cc0:	48 8d bc 24 80 02 00 00 	lea    0x280(%rsp),%rdi
004e   591cc8:	ba 28 00 00 00       	mov    $0x28,%edx
0053   591ccd:	be aa 00 00 00       	mov    $0xaa,%esi
0058   591cd2:	e8 00 00 00 00       	call   591cd7 <shrink_lruvec+0x5d>	591cd3: R_X86_64_PLT32	memset-0x4
005d   591cd7:	4c 89 e1             	mov    %r12,%rcx
0060   591cda:	48 c1 e9 03          	shr    $0x3,%rcx
0064   591cde:	48 89 8c 24 38 02 00 00 	mov    %rcx,0x238(%rsp)
006c   591ce6:	42 80 3c 31 00       	cmpb   $0x0,(%rcx,%r14,1)
0071   591ceb:	4c 89 64 24 50       	mov    %r12,0x50(%rsp)
0076   591cf0:	74 0d                	je     591cff <shrink_lruvec+0x85>
0078   591cf2:	4c 89 e7             	mov    %r12,%rdi
007b   591cf5:	e8 00 00 00 00       	call   591cfa <shrink_lruvec+0x80>	591cf6: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0080   591cfa:	4c 8b 64 24 50       	mov    0x50(%rsp),%r12
0085   591cff:	4c 8d b4 24 88 02 00 00 	lea    0x288(%rsp),%r14
008d   591d07:	4c 8d ac 24 90 02 00 00 	lea    0x290(%rsp),%r13
0095   591d0f:	4c 8d bc 24 98 02 00 00 	lea    0x298(%rsp),%r15
009d   591d17:	49 8b 1c 24          	mov    (%r12),%rbx
00a1   591d1b:	48 8d bc 24 20 03 00 00 	lea    0x320(%rsp),%rdi
00a9   591d23:	ba 28 00 00 00       	mov    $0x28,%edx
00ae   591d28:	be aa 00 00 00       	mov    $0xaa,%esi
00b3   591d2d:	e8 00 00 00 00       	call   591d32 <shrink_lruvec+0xb8>	591d2e: R_X86_64_PLT32	memset-0x4
00b8   591d32:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
00bd   591d37:	48 8d bc 24 58 02 00 00 	lea    0x258(%rsp),%rdi
00c5   591d3f:	ba 28 00 00 00       	mov    $0x28,%edx
00ca   591d44:	be aa 00 00 00       	mov    $0xaa,%esi
00cf   591d49:	e8 00 00 00 00       	call   591d4e <shrink_lruvec+0xd4>	591d4a: R_X86_64_PLT32	memset-0x4
00d4   591d4e:	49 8d 5c 24 48       	lea    0x48(%r12),%rbx
00d9   591d53:	48 89 d9             	mov    %rbx,%rcx
00dc   591d56:	48 c1 e9 03          	shr    $0x3,%rcx
00e0   591d5a:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
00ea   591d64:	48 89 8c 24 e0 01 00 00 	mov    %rcx,0x1e0(%rsp)
00f2   591d6c:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
00f6   591d70:	74 08                	je     591d7a <shrink_lruvec+0x100>
00f8   591d72:	48 89 df             	mov    %rbx,%rdi
00fb   591d75:	e8 00 00 00 00       	call   591d7a <shrink_lruvec+0x100>	591d76: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0100   591d7a:	48 89 9c 24 d8 00 00 00 	mov    %rbx,0xd8(%rsp)
0108   591d82:	48 8b 03             	mov    (%rbx),%rax
010b   591d85:	48 89 84 24 e8 02 00 00 	mov    %rax,0x2e8(%rsp)
0113   591d8d:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
0118   591d92:	48 8d 98 c0 00 00 00 	lea    0xc0(%rax),%rbx
011f   591d99:	48 89 d9             	mov    %rbx,%rcx
0122   591d9c:	48 c1 e9 03          	shr    $0x3,%rcx
0126   591da0:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0130   591daa:	48 89 8c 24 e8 01 00 00 	mov    %rcx,0x1e8(%rsp)
0138   591db2:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
013c   591db6:	74 08                	je     591dc0 <shrink_lruvec+0x146>
013e   591db8:	48 89 df             	mov    %rbx,%rdi
0141   591dbb:	e8 00 00 00 00       	call   591dc0 <shrink_lruvec+0x146>	591dbc: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0146   591dc0:	48 89 9c 24 b0 00 00 00 	mov    %rbx,0xb0(%rsp)
014e   591dc8:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
0153   591dcd:	48 8b 83 c0 00 00 00 	mov    0xc0(%rbx),%rax
015a   591dd4:	48 89 84 24 f8 02 00 00 	mov    %rax,0x2f8(%rsp)
0162   591ddc:	e8 00 00 00 00       	call   591de1 <shrink_lruvec+0x167>	591ddd: R_X86_64_PLT32	lru_add_drain-0x4
0167   591de1:	48 8d bc 24 58 02 00 00 	lea    0x258(%rsp),%rdi
016f   591de9:	e8 00 00 00 00       	call   591dee <shrink_lruvec+0x174>	591dea: R_X86_64_PLT32	blk_start_plug-0x4
0174   591dee:	48 8d bb 18 c1 ff ff 	lea    -0x3ee8(%rbx),%rdi
017b   591df5:	48 89 bc 24 88 00 00 00 	mov    %rdi,0x88(%rsp)
0183   591dfd:	e8 36 6f 00 00       	call   598d38 <set_mm_walk>
0188   591e02:	4c 8b 7c 24 50       	mov    0x50(%rsp),%r15
018d   591e07:	49 8d 47 28          	lea    0x28(%r15),%rax
0191   591e0b:	4c 8d ac 24 38 01 00 00 	lea    0x138(%rsp),%r13
0199   591e13:	48 8d 8b c8 00 00 00 	lea    0xc8(%rbx),%rcx
01a0   591e1a:	48 89 8c 24 78 01 00 00 	mov    %rcx,0x178(%rsp)
01a8   591e22:	48 8d 8b d0 00 00 00 	lea    0xd0(%rbx),%rcx
01af   591e29:	48 89 8c 24 20 02 00 00 	mov    %rcx,0x220(%rsp)
01b7   591e31:	48 8d 4c 24 60       	lea    0x60(%rsp),%rcx
01bc   591e36:	48 c1 e9 03          	shr    $0x3,%rcx
01c0   591e3a:	48 89 8c 24 a0 00 00 00 	mov    %rcx,0xa0(%rsp)
01c8   591e42:	48 8d 8c 24 30 01 00 00 	lea    0x130(%rsp),%rcx
01d0   591e4a:	48 c1 e9 03          	shr    $0x3,%rcx
01d4   591e4e:	48 89 8c 24 08 03 00 00 	mov    %rcx,0x308(%rsp)
01dc   591e56:	48 8d 8c 24 f8 00 00 00 	lea    0xf8(%rsp),%rcx
01e4   591e5e:	48 c1 e9 03          	shr    $0x3,%rcx
01e8   591e62:	48 89 8c 24 80 01 00 00 	mov    %rcx,0x180(%rsp)
01f0   591e6a:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	591e6d: R_X86_64_32S	debug_locks
01f7   591e71:	48 c1 e9 03          	shr    $0x3,%rcx
01fb   591e75:	48 89 8c 24 80 00 00 00 	mov    %rcx,0x80(%rsp)
0203   591e7d:	48 8d 8c 24 10 01 00 00 	lea    0x110(%rsp),%rcx
020b   591e85:	48 c1 e9 03          	shr    $0x3,%rcx
020f   591e89:	48 89 8c 24 e0 02 00 00 	mov    %rcx,0x2e0(%rsp)
0217   591e91:	49 8d 4f 39          	lea    0x39(%r15),%rcx
021b   591e95:	48 89 8c 24 10 02 00 00 	mov    %rcx,0x210(%rsp)
0223   591e9d:	48 8d 4b 50          	lea    0x50(%rbx),%rcx
0227   591ea1:	48 89 8c 24 18 02 00 00 	mov    %rcx,0x218(%rsp)
022f   591ea9:	48 8d 8b d8 03 00 00 	lea    0x3d8(%rbx),%rcx
0236   591eb0:	48 89 8c 24 08 02 00 00 	mov    %rcx,0x208(%rsp)
023e   591eb8:	48 8d 8b c8 04 00 00 	lea    0x4c8(%rbx),%rcx
0245   591ebf:	48 89 8c 24 d8 02 00 00 	mov    %rcx,0x2d8(%rsp)
024d   591ec7:	48 8d 8b 18 04 00 00 	lea    0x418(%rbx),%rcx
0254   591ece:	48 89 8c 24 d0 02 00 00 	mov    %rcx,0x2d0(%rsp)
025c   591ed6:	48 8d 8b 88 04 00 00 	lea    0x488(%rbx),%rcx
0263   591edd:	48 89 8c 24 c8 02 00 00 	mov    %rcx,0x2c8(%rsp)
026b   591ee5:	48 8d 8b f8 03 00 00 	lea    0x3f8(%rbx),%rcx
0272   591eec:	48 89 8c 24 c0 02 00 00 	mov    %rcx,0x2c0(%rsp)
027a   591ef4:	48 8d 8b e8 04 00 00 	lea    0x4e8(%rbx),%rcx
0281   591efb:	48 89 8c 24 b8 02 00 00 	mov    %rcx,0x2b8(%rsp)
0289   591f03:	48 8d 8b 38 04 00 00 	lea    0x438(%rbx),%rcx
0290   591f0a:	48 89 8c 24 b0 02 00 00 	mov    %rcx,0x2b0(%rsp)
0298   591f12:	48 8d 8b a8 04 00 00 	lea    0x4a8(%rbx),%rcx
029f   591f19:	48 89 8c 24 a8 02 00 00 	mov    %rcx,0x2a8(%rsp)
02a7   591f21:	49 8d 4f 3a          	lea    0x3a(%r15),%rcx
02ab   591f25:	48 89 8c 24 f0 00 00 00 	mov    %rcx,0xf0(%rsp)
02b3   591f2d:	48 8d 4b 68          	lea    0x68(%rbx),%rcx
02b7   591f31:	48 89 8c 24 88 01 00 00 	mov    %rcx,0x188(%rsp)
02bf   591f39:	49 8d 4f 3c          	lea    0x3c(%r15),%rcx
02c3   591f3d:	48 89 8c 24 28 02 00 00 	mov    %rcx,0x228(%rsp)
02cb   591f45:	49 8d 4f 30          	lea    0x30(%r15),%rcx
02cf   591f49:	48 89 8c 24 f0 02 00 00 	mov    %rcx,0x2f0(%rsp)
02d7   591f51:	48 8d 8b d8 00 00 00 	lea    0xd8(%rbx),%rcx
02de   591f58:	48 89 8c 24 00 03 00 00 	mov    %rcx,0x300(%rsp)
02e6   591f60:	c7 84 24 0c 01 00 00 00 00 00 00 	movl   $0x0,0x10c(%rsp)
02f1   591f6b:	31 c9                	xor    %ecx,%ecx
02f3   591f6d:	48 89 8c 24 40 02 00 00 	mov    %rcx,0x240(%rsp)
02fb   591f75:	48 89 84 24 90 00 00 00 	mov    %rax,0x90(%rsp)
0303   591f7d:	48 c1 e8 03          	shr    $0x3,%rax
0307   591f81:	49 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r14
0311   591f8b:	48 89 84 24 f8 01 00 00 	mov    %rax,0x1f8(%rsp)
0319   591f93:	42 8a 04 30          	mov    (%rax,%r14,1),%al
031d   591f97:	84 c0                	test   %al,%al
031f   591f99:	0f 85 0f 40 00 00    	jne    595fae <shrink_lruvec+0x4334>
0325   591f9f:	45 0f b7 67 28       	movzwl 0x28(%r15),%r12d
032a   591fa4:	44 89 e6             	mov    %r12d,%esi
032d   591fa7:	83 e6 40             	and    $0x40,%esi
0330   591faa:	31 ff                	xor    %edi,%edi
0332   591fac:	e8 00 00 00 00       	call   591fb1 <shrink_lruvec+0x337>	591fad: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp2-0x4
0337   591fb1:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
033c   591fb6:	4c 89 fe             	mov    %r15,%rsi
033f   591fb9:	e8 fb 6e 00 00       	call   598eb9 <get_swappiness>
0344   591fbe:	31 db                	xor    %ebx,%ebx
0346   591fc0:	85 c0                	test   %eax,%eax
0348   591fc2:	0f 95 c3             	setne  %bl
034b   591fc5:	41 83 e4 40          	and    $0x40,%r12d
034f   591fc9:	0f 45 d8             	cmovne %eax,%ebx
0352   591fcc:	31 ff                	xor    %edi,%edi
0354   591fce:	89 c6                	mov    %eax,%esi
0356   591fd0:	e8 00 00 00 00       	call   591fd5 <shrink_lruvec+0x35b>	591fd1: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
035b   591fd5:	31 ff                	xor    %edi,%edi
035d   591fd7:	89 5c 24 34          	mov    %ebx,0x34(%rsp)
0361   591fdb:	89 de                	mov    %ebx,%esi
0363   591fdd:	e8 00 00 00 00       	call   591fe2 <shrink_lruvec+0x368>	591fde: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0368   591fe2:	48 8b 84 24 a0 00 00 00 	mov    0xa0(%rsp),%rax
0370   591fea:	42 80 3c 30 00       	cmpb   $0x0,(%rax,%r14,1)
0375   591fef:	74 0a                	je     591ffb <shrink_lruvec+0x381>
0377   591ff1:	48 8d 7c 24 60       	lea    0x60(%rsp),%rdi
037c   591ff6:	e8 00 00 00 00       	call   591ffb <shrink_lruvec+0x381>	591ff7: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0381   591ffb:	48 b8 aa aa aa aa aa aa aa aa 	movabs $0xaaaaaaaaaaaaaaaa,%rax
038b   592005:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
0390   59200a:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
039a   592014:	48 8b 8c 24 e8 01 00 00 	mov    0x1e8(%rsp),%rcx
03a2   59201c:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
03a6   592020:	48 8b 9c 24 b0 00 00 00 	mov    0xb0(%rsp),%rbx
03ae   592028:	74 08                	je     592032 <shrink_lruvec+0x3b8>
03b0   59202a:	48 89 df             	mov    %rbx,%rdi
03b3   59202d:	e8 00 00 00 00       	call   592032 <shrink_lruvec+0x3b8>	59202e: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
03b8   592032:	4c 8b 33             	mov    (%rbx),%r14
03bb   592035:	48 8b 8c 24 78 01 00 00 	mov    0x178(%rsp),%rcx
03c3   59203d:	48 89 ca             	mov    %rcx,%rdx
03c6   592040:	48 c1 ea 03          	shr    $0x3,%rdx
03ca   592044:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
03d4   59204e:	48 89 94 24 50 02 00 00 	mov    %rdx,0x250(%rsp)
03dc   592056:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
03e0   59205a:	74 15                	je     592071 <shrink_lruvec+0x3f7>
03e2   59205c:	48 8b bc 24 78 01 00 00 	mov    0x178(%rsp),%rdi
03ea   592064:	e8 00 00 00 00       	call   592069 <shrink_lruvec+0x3ef>	592065: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
03ef   592069:	48 8b 8c 24 78 01 00 00 	mov    0x178(%rsp),%rcx
03f7   592071:	48 8b 19             	mov    (%rcx),%rbx
03fa   592074:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0404   59207e:	48 8b 8c 24 08 03 00 00 	mov    0x308(%rsp),%rcx
040c   592086:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
0410   59208a:	74 0d                	je     592099 <shrink_lruvec+0x41f>
0412   59208c:	48 8d bc 24 30 01 00 00 	lea    0x130(%rsp),%rdi
041a   592094:	e8 00 00 00 00       	call   592099 <shrink_lruvec+0x41f>	592095: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
041f   592099:	48 89 9c 24 30 01 00 00 	mov    %rbx,0x130(%rsp)
0427   5920a1:	48 8b 9c 24 20 02 00 00 	mov    0x220(%rsp),%rbx
042f   5920a9:	48 89 d9             	mov    %rbx,%rcx
0432   5920ac:	48 c1 e9 03          	shr    $0x3,%rcx
0436   5920b0:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0440   5920ba:	48 89 8c 24 48 02 00 00 	mov    %rcx,0x248(%rsp)
0448   5920c2:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
044c   5920c6:	74 08                	je     5920d0 <shrink_lruvec+0x456>
044e   5920c8:	48 89 df             	mov    %rbx,%rdi
0451   5920cb:	e8 00 00 00 00       	call   5920d0 <shrink_lruvec+0x456>	5920cc: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0456   5920d0:	48 8b 1b             	mov    (%rbx),%rbx
0459   5920d3:	4c 89 e8             	mov    %r13,%rax
045c   5920d6:	48 c1 e8 03          	shr    $0x3,%rax
0460   5920da:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
046a   5920e4:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
046e   5920e8:	74 08                	je     5920f2 <shrink_lruvec+0x478>
0470   5920ea:	4c 89 ef             	mov    %r13,%rdi
0473   5920ed:	e8 00 00 00 00       	call   5920f2 <shrink_lruvec+0x478>	5920ee: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0478   5920f2:	45 31 c0             	xor    %r8d,%r8d
047b   5920f5:	83 7c 24 34 00       	cmpl   $0x0,0x34(%rsp)
0480   5920fa:	41 0f 95 c0          	setne  %r8b
0484   5920fe:	48 89 9c 24 38 01 00 00 	mov    %rbx,0x138(%rsp)
048c   592106:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
0491   59210b:	4c 89 f6             	mov    %r14,%rsi
0494   59210e:	48 8d 94 24 30 01 00 00 	lea    0x130(%rsp),%rdx
049c   592116:	48 8b 4c 24 50       	mov    0x50(%rsp),%rcx
04a1   59211b:	4c 8d 4c 24 60       	lea    0x60(%rsp),%r9
04a6   592120:	e8 16 70 00 00       	call   59913b <should_run_aging>
04ab   592125:	88 84 24 c7 00 00 00 	mov    %al,0xc7(%rsp)
04b2   59212c:	84 c0                	test   %al,%al
04b4   59212e:	74 3f                	je     59216f <shrink_lruvec+0x4f5>
04b6   592130:	48 8b 9c 24 10 02 00 00 	mov    0x210(%rsp),%rbx
04be   592138:	48 89 d8             	mov    %rbx,%rax
04c1   59213b:	48 c1 e8 03          	shr    $0x3,%rax
04c5   59213f:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
04cf   592149:	8a 04 08             	mov    (%rax,%rcx,1),%al
04d2   59214c:	84 c0                	test   %al,%al
04d4   59214e:	0f 85 db 3e 00 00    	jne    59602f <shrink_lruvec+0x43b5>
04da   592154:	0f b6 1b             	movzbl (%rbx),%ebx
04dd   592157:	bf 0c 00 00 00       	mov    $0xc,%edi
04e2   59215c:	89 de                	mov    %ebx,%esi
04e4   59215e:	e8 00 00 00 00       	call   592163 <shrink_lruvec+0x4e9>	59215f: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
04e9   592163:	83 fb 0c             	cmp    $0xc,%ebx
04ec   592166:	75 11                	jne    592179 <shrink_lruvec+0x4ff>
04ee   592168:	e8 00 00 00 00       	call   59216d <shrink_lruvec+0x4f3>	592169: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
04f3   59216d:	eb 7c                	jmp    5921eb <shrink_lruvec+0x571>
04f5   59216f:	e8 00 00 00 00       	call   592174 <shrink_lruvec+0x4fa>	592170: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
04fa   592174:	e9 c6 00 00 00       	jmp    59223f <shrink_lruvec+0x5c5>
04ff   592179:	65 48 8b 1c 25 00 00 00 00 	mov    %gs:0x0,%rbx	59217e: R_X86_64_32S	current_task
0508   592182:	48 83 c3 2c          	add    $0x2c,%rbx
050c   592186:	48 89 d8             	mov    %rbx,%rax
050f   592189:	48 c1 e8 03          	shr    $0x3,%rax
0513   59218d:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
051d   592197:	8a 04 08             	mov    (%rax,%rcx,1),%al
0520   59219a:	84 c0                	test   %al,%al
0522   59219c:	0f 85 ec 3e 00 00    	jne    59608e <shrink_lruvec+0x4414>
0528   5921a2:	8b 1b                	mov    (%rbx),%ebx
052a   5921a4:	be 00 00 02 00       	mov    $0x20000,%esi
052f   5921a9:	21 de                	and    %ebx,%esi
0531   5921ab:	31 ff                	xor    %edi,%edi
0533   5921ad:	e8 00 00 00 00       	call   5921b2 <shrink_lruvec+0x538>	5921ae: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0538   5921b2:	b8 00 00 02 00       	mov    $0x20000,%eax
053d   5921b7:	21 c3                	and    %eax,%ebx
053f   5921b9:	0f 85 d6 40 00 00    	jne    596295 <shrink_lruvec+0x461b>
0545   5921bf:	31 c9                	xor    %ecx,%ecx
0547   5921c1:	83 7c 24 34 00       	cmpl   $0x0,0x34(%rsp)
054c   5921c6:	0f 95 c1             	setne  %cl
054f   5921c9:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
0554   5921ce:	4c 89 f6             	mov    %r14,%rsi
0557   5921d1:	48 8b 54 24 50       	mov    0x50(%rsp),%rdx
055c   5921d6:	e8 6e 72 00 00       	call   599449 <try_to_inc_max_seq>
0561   5921db:	84 c0                	test   %al,%al
0563   5921dd:	74 07                	je     5921e6 <shrink_lruvec+0x56c>
0565   5921df:	e8 00 00 00 00       	call   5921e4 <shrink_lruvec+0x56a>	5921e0: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
056a   5921e4:	eb 59                	jmp    59223f <shrink_lruvec+0x5c5>
056c   5921e6:	e8 00 00 00 00       	call   5921eb <shrink_lruvec+0x571>	5921e7: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0571   5921eb:	31 c0                	xor    %eax,%eax
0573   5921ed:	83 7c 24 34 00       	cmpl   $0x0,0x34(%rsp)
0578   5921f2:	0f 94 c0             	sete   %al
057b   5921f5:	48 8d 1c c4          	lea    (%rsp,%rax,8),%rbx
057f   5921f9:	48 81 c3 30 01 00 00 	add    $0x130,%rbx
0586   592200:	48 89 d8             	mov    %rbx,%rax
0589   592203:	48 c1 e8 03          	shr    $0x3,%rax
058d   592207:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
0597   592211:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
059b   592215:	74 08                	je     59221f <shrink_lruvec+0x5a5>
059d   592217:	48 89 df             	mov    %rbx,%rdi
05a0   59221a:	e8 00 00 00 00       	call   59221f <shrink_lruvec+0x5a5>	59221b: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
05a5   59221f:	48 8b 1b             	mov    (%rbx),%rbx
05a8   592222:	48 83 c3 02          	add    $0x2,%rbx
05ac   592226:	48 89 df             	mov    %rbx,%rdi
05af   592229:	4c 89 f6             	mov    %r14,%rsi
05b2   59222c:	e8 00 00 00 00       	call   592231 <shrink_lruvec+0x5b7>	59222d: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
05b7   592231:	4c 39 f3             	cmp    %r14,%rbx
05ba   592234:	0f 87 4a 40 00 00    	ja     596284 <shrink_lruvec+0x460a>
05c0   59223a:	e8 00 00 00 00       	call   59223f <shrink_lruvec+0x5c5>	59223b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
05c5   59223f:	4c 8d bc 24 f8 00 00 00 	lea    0xf8(%rsp),%r15
05cd   592247:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
05d7   592251:	48 8b 8c 24 a0 00 00 00 	mov    0xa0(%rsp),%rcx
05df   592259:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
05e3   59225d:	4c 8d b4 24 00 01 00 00 	lea    0x100(%rsp),%r14
05eb   592265:	74 0a                	je     592271 <shrink_lruvec+0x5f7>
05ed   592267:	48 8d 7c 24 60       	lea    0x60(%rsp),%rdi
05f2   59226c:	e8 00 00 00 00       	call   592271 <shrink_lruvec+0x5f7>	59226d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
05f7   592271:	48 8b 5c 24 60       	mov    0x60(%rsp),%rbx
05fc   592276:	31 ff                	xor    %edi,%edi
05fe   592278:	48 89 de             	mov    %rbx,%rsi
0601   59227b:	e8 00 00 00 00       	call   592280 <shrink_lruvec+0x606>	59227c: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0606   592280:	48 89 9c 24 10 03 00 00 	mov    %rbx,0x310(%rsp)
060e   592288:	48 85 db             	test   %rbx,%rbx
0611   59228b:	0f 84 2a 3f 00 00    	je     5961bb <shrink_lruvec+0x4541>
0617   592291:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0621   59229b:	48 8b 8c 24 80 01 00 00 	mov    0x180(%rsp),%rcx
0629   5922a3:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
062d   5922a7:	74 08                	je     5922b1 <shrink_lruvec+0x637>
062f   5922a9:	4c 89 ff             	mov    %r15,%rdi
0632   5922ac:	e8 00 00 00 00       	call   5922b1 <shrink_lruvec+0x637>	5922ad: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0637   5922b1:	4c 89 bc 24 f8 00 00 00 	mov    %r15,0xf8(%rsp)
063f   5922b9:	4c 89 f0             	mov    %r14,%rax
0642   5922bc:	48 c1 e8 03          	shr    $0x3,%rax
0646   5922c0:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
0650   5922ca:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
0654   5922ce:	74 08                	je     5922d8 <shrink_lruvec+0x65e>
0656   5922d0:	4c 89 f7             	mov    %r14,%rdi
0659   5922d3:	e8 00 00 00 00       	call   5922d8 <shrink_lruvec+0x65e>	5922d4: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
065e   5922d8:	4c 89 bc 24 00 01 00 00 	mov    %r15,0x100(%rsp)
0666   5922e0:	ba 2c 00 00 00       	mov    $0x2c,%edx
066b   5922e5:	48 8d bc 24 30 01 00 00 	lea    0x130(%rsp),%rdi
0673   5922ed:	be aa 00 00 00       	mov    $0xaa,%esi
0678   5922f2:	e8 00 00 00 00       	call   5922f7 <shrink_lruvec+0x67d>	5922f3: R_X86_64_PLT32	memset-0x4
067d   5922f7:	48 8b bc 24 18 02 00 00 	mov    0x218(%rsp),%rdi
0685   5922ff:	e8 00 00 00 00       	call   592304 <shrink_lruvec+0x68a>	592300: R_X86_64_PLT32	_raw_spin_lock_irq-0x4
068a   592304:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0694   59230e:	48 8b 8c 24 50 02 00 00 	mov    0x250(%rsp),%rcx
069c   592316:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
06a0   59231a:	48 8b 9c 24 78 01 00 00 	mov    0x178(%rsp),%rbx
06a8   592322:	74 08                	je     59232c <shrink_lruvec+0x6b2>
06aa   592324:	48 89 df             	mov    %rbx,%rdi
06ad   592327:	e8 00 00 00 00       	call   59232c <shrink_lruvec+0x6b2>	592328: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
06b2   59232c:	4c 8b 33             	mov    (%rbx),%r14
06b5   59232f:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
06bf   592339:	48 8b 8c 24 48 02 00 00 	mov    0x248(%rsp),%rcx
06c7   592341:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
06cb   592345:	48 8b 9c 24 20 02 00 00 	mov    0x220(%rsp),%rbx
06d3   59234d:	74 08                	je     592357 <shrink_lruvec+0x6dd>
06d5   59234f:	48 89 df             	mov    %rbx,%rdi
06d8   592352:	e8 00 00 00 00       	call   592357 <shrink_lruvec+0x6dd>	592353: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
06dd   592357:	4c 8b 3b             	mov    (%rbx),%r15
06e0   59235a:	31 ff                	xor    %edi,%edi
06e2   59235c:	8b 5c 24 34          	mov    0x34(%rsp),%ebx
06e6   592360:	89 de                	mov    %ebx,%esi
06e8   592362:	e8 00 00 00 00       	call   592367 <shrink_lruvec+0x6ed>	592363: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
06ed   592367:	85 db                	test   %ebx,%ebx
06ef   592369:	74 1d                	je     592388 <shrink_lruvec+0x70e>
06f1   59236b:	4c 89 f7             	mov    %r14,%rdi
06f4   59236e:	4c 89 fe             	mov    %r15,%rsi
06f7   592371:	e8 00 00 00 00       	call   592376 <shrink_lruvec+0x6fc>	592372: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
06fc   592376:	4d 39 fe             	cmp    %r15,%r14
06ff   592379:	0f 83 59 2f 00 00    	jae    5952d8 <shrink_lruvec+0x365e>
0705   59237f:	e8 00 00 00 00       	call   592384 <shrink_lruvec+0x70a>	592380: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
070a   592384:	31 c0                	xor    %eax,%eax
070c   592386:	eb 0a                	jmp    592392 <shrink_lruvec+0x718>
070e   592388:	e8 00 00 00 00       	call   59238d <shrink_lruvec+0x713>	592389: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0713   59238d:	b8 01 00 00 00       	mov    $0x1,%eax
0718   592392:	48 89 84 24 98 00 00 00 	mov    %rax,0x98(%rsp)
0720   59239a:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
0726   5923a0:	4c 8b b4 24 b0 00 00 00 	mov    0xb0(%rsp),%r14
072e   5923a8:	8b 44 24 34          	mov    0x34(%rsp),%eax
0732   5923ac:	31 c9                	xor    %ecx,%ecx
0734   5923ae:	85 c0                	test   %eax,%eax
0736   5923b0:	0f 94 c1             	sete   %cl
0739   5923b3:	89 8c 24 f0 01 00 00 	mov    %ecx,0x1f0(%rsp)
0740   5923ba:	31 ff                	xor    %edi,%edi
0742   5923bc:	44 89 ee             	mov    %r13d,%esi
0745   5923bf:	e8 00 00 00 00       	call   5923c4 <shrink_lruvec+0x74a>	5923c0: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
074a   5923c4:	45 85 ed             	test   %r13d,%r13d
074d   5923c7:	78 0a                	js     5923d3 <shrink_lruvec+0x759>
074f   5923c9:	e8 00 00 00 00       	call   5923ce <shrink_lruvec+0x754>	5923ca: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0754   5923ce:	e9 1e 02 00 00       	jmp    5925f1 <shrink_lruvec+0x977>
0759   5923d3:	ba 18 00 00 00       	mov    $0x18,%edx
075e   5923d8:	48 8d 5c 24 60       	lea    0x60(%rsp),%rbx
0763   5923dd:	48 89 df             	mov    %rbx,%rdi
0766   5923e0:	be aa 00 00 00       	mov    $0xaa,%esi
076b   5923e5:	e8 00 00 00 00       	call   5923ea <shrink_lruvec+0x770>	5923e6: R_X86_64_PLT32	memset-0x4
0770   5923ea:	ba 18 00 00 00       	mov    $0x18,%edx
0775   5923ef:	48 8d bc 24 18 01 00 00 	lea    0x118(%rsp),%rdi
077d   5923f7:	be aa 00 00 00       	mov    $0xaa,%esi
0782   5923fc:	e8 00 00 00 00       	call   592401 <shrink_lruvec+0x787>	5923fd: R_X86_64_PLT32	memset-0x4
0787   592401:	41 bd 01 00 00 00    	mov    $0x1,%r13d
078d   592407:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
0792   59240c:	48 8b b4 24 98 00 00 00 	mov    0x98(%rsp),%rsi
079a   592414:	31 d2                	xor    %edx,%edx
079c   592416:	b9 01 00 00 00       	mov    $0x1,%ecx
07a1   59241b:	49 89 d8             	mov    %rbx,%r8
07a4   59241e:	48 8d 9c 24 18 01 00 00 	lea    0x118(%rsp),%rbx
07ac   592426:	e8 e2 ba 00 00       	call   59df0d <read_ctrl_pos>
07b1   59242b:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
07b6   592430:	48 8b b4 24 98 00 00 00 	mov    0x98(%rsp),%rsi
07be   592438:	44 89 ea             	mov    %r13d,%edx
07c1   59243b:	b9 02 00 00 00       	mov    $0x2,%ecx
07c6   592440:	49 89 d8             	mov    %rbx,%r8
07c9   592443:	e8 c5 ba 00 00       	call   59df0d <read_ctrl_pos>
07ce   592448:	48 89 d8             	mov    %rbx,%rax
07d1   59244b:	48 c1 e8 03          	shr    $0x3,%rax
07d5   59244f:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
07df   592459:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
07e3   59245d:	74 08                	je     592467 <shrink_lruvec+0x7ed>
07e5   59245f:	48 89 df             	mov    %rbx,%rdi
07e8   592462:	e8 00 00 00 00       	call   592467 <shrink_lruvec+0x7ed>	592463: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
07ed   592467:	48 8b 9c 24 18 01 00 00 	mov    0x118(%rsp),%rbx
07f5   59246f:	bf 40 00 00 00       	mov    $0x40,%edi
07fa   592474:	48 89 de             	mov    %rbx,%rsi
07fd   592477:	e8 00 00 00 00       	call   59247c <shrink_lruvec+0x802>	592478: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0802   59247c:	48 83 fb 3f          	cmp    $0x3f,%rbx
0806   592480:	77 0a                	ja     59248c <shrink_lruvec+0x812>
0808   592482:	e8 00 00 00 00       	call   592487 <shrink_lruvec+0x80d>	592483: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
080d   592487:	e9 ed 00 00 00       	jmp    592579 <shrink_lruvec+0x8ff>
0812   59248c:	48 8d 7c 24 68       	lea    0x68(%rsp),%rdi
0817   592491:	48 89 f8             	mov    %rdi,%rax
081a   592494:	48 c1 e8 03          	shr    $0x3,%rax
081e   592498:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
0828   5924a2:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
082c   5924a6:	74 05                	je     5924ad <shrink_lruvec+0x833>
082e   5924a8:	e8 00 00 00 00       	call   5924ad <shrink_lruvec+0x833>	5924a9: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0833   5924ad:	4c 8b 74 24 68       	mov    0x68(%rsp),%r14
0838   5924b2:	48 8d 44 24 70       	lea    0x70(%rsp),%rax
083d   5924b7:	48 c1 e8 03          	shr    $0x3,%rax
0841   5924bb:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
084b   5924c5:	42 8a 04 20          	mov    (%rax,%r12,1),%al
084f   5924c9:	84 c0                	test   %al,%al
0851   5924cb:	0f 85 c3 00 00 00    	jne    592594 <shrink_lruvec+0x91a>
0857   5924d1:	49 83 c6 40          	add    $0x40,%r14
085b   5924d5:	4c 63 7c 24 70       	movslq 0x70(%rsp),%r15
0860   5924da:	48 8b 84 24 a0 00 00 00 	mov    0xa0(%rsp),%rax
0868   5924e2:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
086d   5924e7:	74 0a                	je     5924f3 <shrink_lruvec+0x879>
086f   5924e9:	48 8d 7c 24 60       	lea    0x60(%rsp),%rdi
0874   5924ee:	e8 00 00 00 00       	call   5924f3 <shrink_lruvec+0x879>	5924ef: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0879   5924f3:	4c 0f af f3          	imul   %rbx,%r14
087d   5924f7:	48 8b 5c 24 60       	mov    0x60(%rsp),%rbx
0882   5924fc:	48 ff c3             	inc    %rbx
0885   5924ff:	48 8d bc 24 20 01 00 00 	lea    0x120(%rsp),%rdi
088d   592507:	48 89 f8             	mov    %rdi,%rax
0890   59250a:	48 c1 e8 03          	shr    $0x3,%rax
0894   59250e:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
089e   592518:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
08a2   59251c:	74 05                	je     592523 <shrink_lruvec+0x8a9>
08a4   59251e:	e8 00 00 00 00       	call   592523 <shrink_lruvec+0x8a9>	59251f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
08a9   592523:	48 0f af 9c 24 20 01 00 00 	imul   0x120(%rsp),%rbx
08b2   59252c:	4d 0f af f7          	imul   %r15,%r14
08b6   592530:	48 8d 94 24 28 01 00 00 	lea    0x128(%rsp),%rdx
08be   592538:	48 89 d0             	mov    %rdx,%rax
08c1   59253b:	48 c1 e8 03          	shr    $0x3,%rax
08c5   59253f:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
08cf   592549:	8a 04 08             	mov    (%rax,%rcx,1),%al
08d2   59254c:	84 c0                	test   %al,%al
08d4   59254e:	75 66                	jne    5925b6 <shrink_lruvec+0x93c>
08d6   592550:	48 63 84 24 28 01 00 00 	movslq 0x128(%rsp),%rax
08de   592558:	48 0f af d8          	imul   %rax,%rbx
08e2   59255c:	4c 89 f7             	mov    %r14,%rdi
08e5   59255f:	48 89 de             	mov    %rbx,%rsi
08e8   592562:	e8 00 00 00 00       	call   592567 <shrink_lruvec+0x8ed>	592563: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
08ed   592567:	49 39 de             	cmp    %rbx,%r14
08f0   59256a:	77 75                	ja     5925e1 <shrink_lruvec+0x967>
08f2   59256c:	e8 00 00 00 00       	call   592571 <shrink_lruvec+0x8f7>	59256d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
08f7   592571:	4c 8b b4 24 b0 00 00 00 	mov    0xb0(%rsp),%r14
08ff   592579:	48 8d 9c 24 18 01 00 00 	lea    0x118(%rsp),%rbx
0907   592581:	41 83 fd 03          	cmp    $0x3,%r13d
090b   592585:	74 4d                	je     5925d4 <shrink_lruvec+0x95a>
090d   592587:	e8 00 00 00 00       	call   59258c <shrink_lruvec+0x912>	592588: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0912   59258c:	41 ff c5             	inc    %r13d
0915   59258f:	e9 97 fe ff ff       	jmp    59242b <shrink_lruvec+0x7b1>
091a   592594:	48 8d 4c 24 70       	lea    0x70(%rsp),%rcx
091f   592599:	80 e1 07             	and    $0x7,%cl
0922   59259c:	80 c1 03             	add    $0x3,%cl
0925   59259f:	38 c1                	cmp    %al,%cl
0927   5925a1:	0f 8c 2a ff ff ff    	jl     5924d1 <shrink_lruvec+0x857>
092d   5925a7:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
0932   5925ac:	e8 00 00 00 00       	call   5925b1 <shrink_lruvec+0x937>	5925ad: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0937   5925b1:	e9 1b ff ff ff       	jmp    5924d1 <shrink_lruvec+0x857>
093c   5925b6:	89 d1                	mov    %edx,%ecx
093e   5925b8:	80 e1 07             	and    $0x7,%cl
0941   5925bb:	80 c1 03             	add    $0x3,%cl
0944   5925be:	38 c1                	cmp    %al,%cl
0946   5925c0:	7c 8e                	jl     592550 <shrink_lruvec+0x8d6>
0948   5925c2:	48 8d bc 24 28 01 00 00 	lea    0x128(%rsp),%rdi
0950   5925ca:	e8 00 00 00 00       	call   5925cf <shrink_lruvec+0x955>	5925cb: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0955   5925cf:	e9 7c ff ff ff       	jmp    592550 <shrink_lruvec+0x8d6>
095a   5925d4:	e8 00 00 00 00       	call   5925d9 <shrink_lruvec+0x95f>	5925d5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
095f   5925d9:	41 bd 04 00 00 00    	mov    $0x4,%r13d
0965   5925df:	eb 0d                	jmp    5925ee <shrink_lruvec+0x974>
0967   5925e1:	e8 00 00 00 00       	call   5925e6 <shrink_lruvec+0x96c>	5925e2: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
096c   5925e6:	4c 8b b4 24 b0 00 00 00 	mov    0xb0(%rsp),%r14
0974   5925ee:	41 ff cd             	dec    %r13d
0977   5925f1:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0981   5925fb:	48 8b 8c 24 e8 01 00 00 	mov    0x1e8(%rsp),%rcx
0989   592603:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
098d   592607:	74 08                	je     592611 <shrink_lruvec+0x997>
098f   592609:	4c 89 f7             	mov    %r14,%rdi
0992   59260c:	e8 00 00 00 00       	call   592611 <shrink_lruvec+0x997>	59260d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0997   592611:	8b 8c 24 98 00 00 00 	mov    0x98(%rsp),%ecx
099e   592618:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
09a3   59261d:	48 8b 98 c0 00 00 00 	mov    0xc0(%rax),%rbx
09aa   592624:	48 89 8c 24 c8 00 00 00 	mov    %rcx,0xc8(%rsp)
09b2   59262c:	4c 8d 34 c8          	lea    (%rax,%rcx,8),%r14
09b6   592630:	49 81 c6 c8 00 00 00 	add    $0xc8,%r14
09bd   592637:	4c 89 f0             	mov    %r14,%rax
09c0   59263a:	48 c1 e8 03          	shr    $0x3,%rax
09c4   59263e:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
09ce   592648:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
09d2   59264c:	74 08                	je     592656 <shrink_lruvec+0x9dc>
09d4   59264e:	4c 89 f7             	mov    %r14,%rdi
09d7   592651:	e8 00 00 00 00       	call   592656 <shrink_lruvec+0x9dc>	592652: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
09dc   592656:	49 8b 06             	mov    (%r14),%rax
09df   592659:	48 89 84 24 68 01 00 00 	mov    %rax,0x168(%rsp)
09e7   592661:	29 c3                	sub    %eax,%ebx
09e9   592663:	bf 01 00 00 00       	mov    $0x1,%edi
09ee   592668:	89 de                	mov    %ebx,%esi
09f0   59266a:	e8 00 00 00 00       	call   59266f <shrink_lruvec+0x9f5>	59266b: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
09f5   59266f:	83 fb 01             	cmp    $0x1,%ebx
09f8   592672:	75 0a                	jne    59267e <shrink_lruvec+0xa04>
09fa   592674:	e8 00 00 00 00       	call   592679 <shrink_lruvec+0x9ff>	592675: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
09ff   592679:	e9 04 24 00 00       	jmp    594a82 <shrink_lruvec+0x2e08>
0a04   59267e:	48 8b 94 24 f0 00 00 00 	mov    0xf0(%rsp),%rdx
0a0c   592686:	48 89 d0             	mov    %rdx,%rax
0a0f   592689:	48 c1 e8 03          	shr    $0x3,%rax
0a13   59268d:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
0a1d   592697:	8a 04 08             	mov    (%rax,%rcx,1),%al
0a20   59269a:	84 c0                	test   %al,%al
0a22   59269c:	0f 85 2f 24 00 00    	jne    594ad1 <shrink_lruvec+0x2e57>
0a28   5926a2:	0f b6 1a             	movzbl (%rdx),%ebx
0a2b   5926a5:	bf ff 00 00 00       	mov    $0xff,%edi
0a30   5926aa:	89 de                	mov    %ebx,%esi
0a32   5926ac:	e8 00 00 00 00       	call   5926b1 <shrink_lruvec+0xa37>	5926ad: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
0a37   5926b1:	84 db                	test   %bl,%bl
0a39   5926b3:	0f 88 fe 22 00 00    	js     5949b7 <shrink_lruvec+0x2d3d>
0a3f   5926b9:	48 89 9c 24 e8 00 00 00 	mov    %rbx,0xe8(%rsp)
0a47   5926c1:	44 89 ac 24 a8 01 00 00 	mov    %r13d,0x1a8(%rsp)
0a4f   5926c9:	48 8b 84 24 68 01 00 00 	mov    0x168(%rsp),%rax
0a57   5926d1:	83 e0 03             	and    $0x3,%eax
0a5a   5926d4:	48 89 84 24 68 01 00 00 	mov    %rax,0x168(%rsp)
0a62   5926dc:	c7 44 24 48 00 00 00 00 	movl   $0x0,0x48(%rsp)
0a6a   5926e4:	41 bf 00 10 00 00    	mov    $0x1000,%r15d
0a70   5926ea:	45 31 ed             	xor    %r13d,%r13d
0a73   5926ed:	c7 44 24 38 00 00 00 00 	movl   $0x0,0x38(%rsp)
0a7b   5926f5:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0a85   5926ff:	48 8b 8c 24 a0 00 00 00 	mov    0xa0(%rsp),%rcx
0a8d   592707:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
0a91   59270b:	48 8d 7c 24 60       	lea    0x60(%rsp),%rdi
0a96   592710:	74 0a                	je     59271c <shrink_lruvec+0xaa2>
0a98   592712:	e8 00 00 00 00       	call   592717 <shrink_lruvec+0xa9d>	592713: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0a9d   592717:	48 8d 7c 24 60       	lea    0x60(%rsp),%rdi
0aa2   59271c:	48 89 7c 24 60       	mov    %rdi,0x60(%rsp)
0aa7   592721:	48 8d 4c 24 68       	lea    0x68(%rsp),%rcx
0aac   592726:	48 89 ca             	mov    %rcx,%rdx
0aaf   592729:	48 c1 ea 03          	shr    $0x3,%rdx
0ab3   59272d:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0abd   592737:	48 89 94 24 90 01 00 00 	mov    %rdx,0x190(%rsp)
0ac5   59273f:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
0ac9   592743:	74 0d                	je     592752 <shrink_lruvec+0xad8>
0acb   592745:	48 89 cf             	mov    %rcx,%rdi
0ace   592748:	e8 00 00 00 00       	call   59274d <shrink_lruvec+0xad3>	592749: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0ad3   59274d:	48 8d 7c 24 60       	lea    0x60(%rsp),%rdi
0ad8   592752:	48 89 7c 24 68       	mov    %rdi,0x68(%rsp)
0add   592757:	bf 05 00 00 00       	mov    $0x5,%edi
0ae2   59275c:	48 8b 9c 24 e8 00 00 00 	mov    0xe8(%rsp),%rbx
0aea   592764:	48 89 de             	mov    %rbx,%rsi
0aed   592767:	e8 00 00 00 00       	call   59276c <shrink_lruvec+0xaf2>	592768: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0af2   59276c:	48 83 fb 04          	cmp    $0x4,%rbx
0af6   592770:	0f 87 ff 21 00 00    	ja     594975 <shrink_lruvec+0x2cfb>
0afc   592776:	e8 00 00 00 00       	call   59277b <shrink_lruvec+0xb01>	592777: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0b01   59277b:	48 8b 84 24 68 01 00 00 	mov    0x168(%rsp),%rax
0b09   592783:	48 c1 e0 07          	shl    $0x7,%rax
0b0d   592787:	48 03 44 24 10       	add    0x10(%rsp),%rax
0b12   59278c:	48 8b 8c 24 c8 00 00 00 	mov    0xc8(%rsp),%rcx
0b1a   592794:	48 c1 e1 06          	shl    $0x6,%rcx
0b1e   592798:	48 01 c1             	add    %rax,%rcx
0b21   59279b:	48 8b 84 24 e8 00 00 00 	mov    0xe8(%rsp),%rax
0b29   5927a3:	48 c1 e0 04          	shl    $0x4,%rax
0b2d   5927a7:	48 8d 1c 08          	lea    (%rax,%rcx,1),%rbx
0b31   5927ab:	48 81 c3 d8 00 00 00 	add    $0xd8,%rbx
0b38   5927b2:	48 01 c8             	add    %rcx,%rax
0b3b   5927b5:	48 05 e0 00 00 00    	add    $0xe0,%rax
0b41   5927bb:	48 89 84 24 70 01 00 00 	mov    %rax,0x170(%rsp)
0b49   5927c3:	c7 44 24 78 00 00 00 00 	movl   $0x0,0x78(%rsp)
0b51   5927cb:	48 89 9c 24 e0 00 00 00 	mov    %rbx,0xe0(%rsp)
0b59   5927d3:	49 89 de             	mov    %rbx,%r14
0b5c   5927d6:	49 c1 ee 03          	shr    $0x3,%r14
0b60   5927da:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0b6a   5927e4:	41 80 3c 06 00       	cmpb   $0x0,(%r14,%rax,1)
0b6f   5927e9:	74 08                	je     5927f3 <shrink_lruvec+0xb79>
0b71   5927eb:	48 89 df             	mov    %rbx,%rdi
0b74   5927ee:	e8 00 00 00 00       	call   5927f3 <shrink_lruvec+0xb79>	5927ef: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0b79   5927f3:	48 8b 03             	mov    (%rbx),%rax
0b7c   5927f6:	48 39 d8             	cmp    %rbx,%rax
0b7f   5927f9:	4c 89 b4 24 a8 00 00 00 	mov    %r14,0xa8(%rsp)
0b87   592801:	0f 84 83 1f 00 00    	je     59478a <shrink_lruvec+0x2b10>
0b8d   592807:	44 89 6c 24 40       	mov    %r13d,0x40(%rsp)
0b92   59280c:	48 8b 9c 24 70 01 00 00 	mov    0x170(%rsp),%rbx
0b9a   592814:	48 89 d8             	mov    %rbx,%rax
0b9d   592817:	48 c1 e8 03          	shr    $0x3,%rax
0ba1   59281b:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
0bab   592825:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
0baf   592829:	74 08                	je     592833 <shrink_lruvec+0xbb9>
0bb1   59282b:	48 89 df             	mov    %rbx,%rdi
0bb4   59282e:	e8 00 00 00 00       	call   592833 <shrink_lruvec+0xbb9>	59282f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0bb9   592833:	48 8b 03             	mov    (%rbx),%rax
0bbc   592836:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
0bc1   59283b:	4c 8d 68 f8          	lea    -0x8(%rax),%r13
0bc5   59283f:	4c 89 ef             	mov    %r13,%rdi
0bc8   592842:	be 08 00 00 00       	mov    $0x8,%esi
0bcd   592847:	e8 00 00 00 00       	call   59284c <shrink_lruvec+0xbd2>	592848: R_X86_64_PLT32	__kasan_check_read-0x4
0bd2   59284c:	4d 89 ec             	mov    %r13,%r12
0bd5   59284f:	49 c1 ec 03          	shr    $0x3,%r12
0bd9   592853:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0be3   59285d:	41 80 3c 04 00       	cmpb   $0x0,(%r12,%rax,1)
0be8   592862:	74 08                	je     59286c <shrink_lruvec+0xbf2>
0bea   592864:	4c 89 ef             	mov    %r13,%rdi
0bed   592867:	e8 00 00 00 00       	call   59286c <shrink_lruvec+0xbf2>	592868: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0bf2   59286c:	49 8b 5d 00          	mov    0x0(%r13),%rbx
0bf6   592870:	be 00 00 01 00       	mov    $0x10000,%esi
0bfb   592875:	48 21 de             	and    %rbx,%rsi
0bfe   592878:	31 ff                	xor    %edi,%edi
0c00   59287a:	e8 00 00 00 00       	call   59287f <shrink_lruvec+0xc05>	59287b: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0c05   59287f:	b8 00 00 01 00       	mov    $0x10000,%eax
0c0a   592884:	48 21 c3             	and    %rax,%rbx
0c0d   592887:	75 0f                	jne    592898 <shrink_lruvec+0xc1e>
0c0f   592889:	e8 00 00 00 00       	call   59288e <shrink_lruvec+0xc14>	59288a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0c14   59288e:	c7 44 24 20 01 00 00 00 	movl   $0x1,0x20(%rsp)
0c1c   592896:	eb 30                	jmp    5928c8 <shrink_lruvec+0xc4e>
0c1e   592898:	e8 00 00 00 00       	call   59289d <shrink_lruvec+0xc23>	592899: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0c23   59289d:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
0c28   5928a2:	48 8d 58 54          	lea    0x54(%rax),%rbx
0c2c   5928a6:	48 89 d8             	mov    %rbx,%rax
0c2f   5928a9:	48 c1 e8 03          	shr    $0x3,%rax
0c33   5928ad:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
0c3d   5928b7:	8a 04 08             	mov    (%rax,%rcx,1),%al
0c40   5928ba:	84 c0                	test   %al,%al
0c42   5928bc:	0f 85 83 1c 00 00    	jne    594545 <shrink_lruvec+0x28cb>
0c48   5928c2:	8b 03                	mov    (%rbx),%eax
0c4a   5928c4:	89 44 24 20          	mov    %eax,0x20(%rsp)
0c4e   5928c8:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0c58   5928d2:	4c 89 64 24 08       	mov    %r12,0x8(%rsp)
0c5d   5928d7:	41 80 3c 04 00       	cmpb   $0x0,(%r12,%rax,1)
0c62   5928dc:	74 08                	je     5928e6 <shrink_lruvec+0xc6c>
0c64   5928de:	4c 89 ef             	mov    %r13,%rdi
0c67   5928e1:	e8 00 00 00 00       	call   5928e6 <shrink_lruvec+0xc6c>	5928e2: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0c6c   5928e6:	4d 8b 65 00          	mov    0x0(%r13),%r12
0c70   5928ea:	4c 89 ef             	mov    %r13,%rdi
0c73   5928ed:	be 08 00 00 00       	mov    $0x8,%esi
0c78   5928f2:	e8 00 00 00 00       	call   5928f7 <shrink_lruvec+0xc7d>	5928f3: R_X86_64_PLT32	__kasan_check_read-0x4
0c7d   5928f7:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0c87   592901:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
0c8c   592906:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
0c90   59290a:	74 08                	je     592914 <shrink_lruvec+0xc9a>
0c92   59290c:	4c 89 ef             	mov    %r13,%rdi
0c95   59290f:	e8 00 00 00 00       	call   592914 <shrink_lruvec+0xc9a>	592910: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0c9a   592914:	49 8b 45 00          	mov    0x0(%r13),%rax
0c9e   592918:	48 89 04 24          	mov    %rax,(%rsp)
0ca2   59291c:	4c 89 ef             	mov    %r13,%rdi
0ca5   59291f:	be 08 00 00 00       	mov    $0x8,%esi
0caa   592924:	e8 00 00 00 00       	call   592929 <shrink_lruvec+0xcaf>	592925: R_X86_64_PLT32	__kasan_check_read-0x4
0caf   592929:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0cb9   592933:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
0cbe   592938:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
0cc2   59293c:	74 08                	je     592946 <shrink_lruvec+0xccc>
0cc4   59293e:	4c 89 ef             	mov    %r13,%rdi
0cc7   592941:	e8 00 00 00 00       	call   592946 <shrink_lruvec+0xccc>	592942: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0ccc   592946:	49 8b 5d 00          	mov    0x0(%r13),%rbx
0cd0   59294a:	be 00 00 01 00       	mov    $0x10000,%esi
0cd5   59294f:	48 21 de             	and    %rbx,%rsi
0cd8   592952:	31 ff                	xor    %edi,%edi
0cda   592954:	e8 00 00 00 00       	call   592959 <shrink_lruvec+0xcdf>	592955: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0cdf   592959:	b8 00 00 01 00       	mov    $0x10000,%eax
0ce4   59295e:	48 21 c3             	and    %rax,%rbx
0ce7   592961:	75 0c                	jne    59296f <shrink_lruvec+0xcf5>
0ce9   592963:	e8 00 00 00 00       	call   592968 <shrink_lruvec+0xcee>	592964: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0cee   592968:	b8 01 00 00 00       	mov    $0x1,%eax
0cf3   59296d:	eb 2c                	jmp    59299b <shrink_lruvec+0xd21>
0cf5   59296f:	e8 00 00 00 00       	call   592974 <shrink_lruvec+0xcfa>	592970: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0cfa   592974:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
0cff   592979:	48 8d 58 54          	lea    0x54(%rax),%rbx
0d03   59297d:	48 89 d8             	mov    %rbx,%rax
0d06   592980:	48 c1 e8 03          	shr    $0x3,%rax
0d0a   592984:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
0d14   59298e:	8a 04 08             	mov    (%rax,%rcx,1),%al
0d17   592991:	84 c0                	test   %al,%al
0d19   592993:	0f 85 c9 1b 00 00    	jne    594562 <shrink_lruvec+0x28e8>
0d1f   592999:	8b 03                	mov    (%rbx),%eax
0d21   59299b:	48 89 44 24 58       	mov    %rax,0x58(%rsp)
0d26   5929a0:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0d30   5929aa:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
0d35   5929af:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
0d39   5929b3:	74 08                	je     5929bd <shrink_lruvec+0xd43>
0d3b   5929b5:	4c 89 ef             	mov    %r13,%rdi
0d3e   5929b8:	e8 00 00 00 00       	call   5929bd <shrink_lruvec+0xd43>	5929b9: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0d43   5929bd:	4c 89 7c 24 28       	mov    %r15,0x28(%rsp)
0d48   5929c2:	49 8b 5d 00          	mov    0x0(%r13),%rbx
0d4c   5929c6:	49 89 de             	mov    %rbx,%r14
0d4f   5929c9:	49 c1 ee 25          	shr    $0x25,%r14
0d53   5929cd:	41 83 e6 03          	and    $0x3,%r14d
0d57   5929d1:	c1 eb 06             	shr    $0x6,%ebx
0d5a   5929d4:	83 e3 01             	and    $0x1,%ebx
0d5d   5929d7:	49 8d 34 1e          	lea    (%r14,%rbx,1),%rsi
0d61   5929db:	31 ff                	xor    %edi,%edi
0d63   5929dd:	e8 00 00 00 00       	call   5929e2 <shrink_lruvec+0xd68>	5929de: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0d68   5929e2:	49 01 de             	add    %rbx,%r14
0d6b   5929e5:	74 21                	je     592a08 <shrink_lruvec+0xd8e>
0d6d   5929e7:	e8 00 00 00 00       	call   5929ec <shrink_lruvec+0xd72>	5929e8: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0d72   5929ec:	4c 89 b4 24 18 03 00 00 	mov    %r14,0x318(%rsp)
0d7a   5929f4:	41 bf ff ff ff ff    	mov    $0xffffffff,%r15d
0d80   5929fa:	4c 0f bd bc 24 18 03 00 00 	bsr    0x318(%rsp),%r15
0d89   592a03:	41 ff c7             	inc    %r15d
0d8c   592a06:	eb 08                	jmp    592a10 <shrink_lruvec+0xd96>
0d8e   592a08:	e8 00 00 00 00       	call   592a0d <shrink_lruvec+0xd93>	592a09: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0d93   592a0d:	45 31 ff             	xor    %r15d,%r15d
0d96   592a10:	4c 8b 74 24 18       	mov    0x18(%rsp),%r14
0d9b   592a15:	4c 89 ef             	mov    %r13,%rdi
0d9e   592a18:	e8 1a 8f ff ff       	call   58b937 <folio_evictable>
0da3   592a1d:	84 c0                	test   %al,%al
0da5   592a1f:	74 68                	je     592a89 <shrink_lruvec+0xe0f>
0da7   592a21:	48 8b 04 24          	mov    (%rsp),%rax
0dab   592a25:	89 c3                	mov    %eax,%ebx
0dad   592a27:	c1 eb 13             	shr    $0x13,%ebx
0db0   592a2a:	83 e3 01             	and    $0x1,%ebx
0db3   592a2d:	31 ff                	xor    %edi,%edi
0db5   592a2f:	89 de                	mov    %ebx,%esi
0db7   592a31:	e8 00 00 00 00       	call   592a36 <shrink_lruvec+0xdbc>	592a32: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0dbc   592a36:	85 db                	test   %ebx,%ebx
0dbe   592a38:	0f 85 0d 02 00 00    	jne    592c4b <shrink_lruvec+0xfd1>
0dc4   592a3e:	4c 89 f0             	mov    %r14,%rax
0dc7   592a41:	41 89 de             	mov    %ebx,%r14d
0dca   592a44:	48 8d 58 10          	lea    0x10(%rax),%rbx
0dce   592a48:	48 89 d8             	mov    %rbx,%rax
0dd1   592a4b:	48 c1 e8 03          	shr    $0x3,%rax
0dd5   592a4f:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
0ddf   592a59:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
0de3   592a5d:	74 08                	je     592a67 <shrink_lruvec+0xded>
0de5   592a5f:	48 89 df             	mov    %rbx,%rdi
0de8   592a62:	e8 00 00 00 00       	call   592a67 <shrink_lruvec+0xded>	592a63: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0ded   592a67:	48 8b 1b             	mov    (%rbx),%rbx
0df0   592a6a:	89 de                	mov    %ebx,%esi
0df2   592a6c:	83 e6 01             	and    $0x1,%esi
0df5   592a6f:	31 ff                	xor    %edi,%edi
0df7   592a71:	e8 00 00 00 00       	call   592a76 <shrink_lruvec+0xdfc>	592a72: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0dfc   592a76:	f6 c3 01             	test   $0x1,%bl
0dff   592a79:	0f 85 51 03 00 00    	jne    592dd0 <shrink_lruvec+0x1156>
0e05   592a7f:	e8 00 00 00 00       	call   592a84 <shrink_lruvec+0xe0a>	592a80: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0e0a   592a84:	e9 92 03 00 00       	jmp    592e1b <shrink_lruvec+0x11a1>
0e0f   592a89:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0e19   592a93:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
0e1e   592a98:	41 80 3c 04 00       	cmpb   $0x0,(%r12,%rax,1)
0e23   592a9d:	74 08                	je     592aa7 <shrink_lruvec+0xe2d>
0e25   592a9f:	4c 89 ef             	mov    %r13,%rdi
0e28   592aa2:	e8 00 00 00 00       	call   592aa7 <shrink_lruvec+0xe2d>	592aa3: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0e2d   592aa7:	49 8b 5d 00          	mov    0x0(%r13),%rbx
0e31   592aab:	49 be 00 00 00 00 80 03 00 00 	movabs $0x38000000000,%r14
0e3b   592ab5:	4c 89 f6             	mov    %r14,%rsi
0e3e   592ab8:	48 21 de             	and    %rbx,%rsi
0e41   592abb:	31 ff                	xor    %edi,%edi
0e43   592abd:	e8 00 00 00 00       	call   592ac2 <shrink_lruvec+0xe48>	592abe: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0e48   592ac2:	4c 21 f3             	and    %r14,%rbx
0e4b   592ac5:	49 bf ff ff ff ff 7f fc ff ff 	movabs $0xfffffc7fffffffff,%r15
0e55   592acf:	0f 84 80 01 00 00    	je     592c55 <shrink_lruvec+0xfdb>
0e5b   592ad5:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0e65   592adf:	41 80 3c 04 00       	cmpb   $0x0,(%r12,%rax,1)
0e6a   592ae4:	74 08                	je     592aee <shrink_lruvec+0xe74>
0e6c   592ae6:	4c 89 ef             	mov    %r13,%rdi
0e6f   592ae9:	e8 00 00 00 00       	call   592aee <shrink_lruvec+0xe74>	592aea: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0e74   592aee:	4d 8b 75 00          	mov    0x0(%r13),%r14
0e78   592af2:	4c 89 f3             	mov    %r14,%rbx
0e7b   592af5:	4c 21 fb             	and    %r15,%rbx
0e7e   592af8:	4c 89 ef             	mov    %r13,%rdi
0e81   592afb:	be 08 00 00 00       	mov    $0x8,%esi
0e86   592b00:	e8 00 00 00 00       	call   592b05 <shrink_lruvec+0xe8b>	592b01: R_X86_64_PLT32	__kasan_check_write-0x4
0e8b   592b05:	4c 89 f0             	mov    %r14,%rax
0e8e   592b08:	f0 49 0f b1 5d 00    	lock cmpxchg %rbx,0x0(%r13)
0e94   592b0e:	4c 39 f0             	cmp    %r14,%rax
0e97   592b11:	74 07                	je     592b1a <shrink_lruvec+0xea0>
0e99   592b13:	e8 00 00 00 00       	call   592b18 <shrink_lruvec+0xe9e>	592b14: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0e9e   592b18:	eb bb                	jmp    592ad5 <shrink_lruvec+0xe5b>
0ea0   592b1a:	e8 00 00 00 00       	call   592b1f <shrink_lruvec+0xea5>	592b1b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0ea5   592b1f:	49 c1 ee 27          	shr    $0x27,%r14
0ea9   592b23:	41 83 e6 07          	and    $0x7,%r14d
0ead   592b27:	41 ff ce             	dec    %r14d
0eb0   592b2a:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
0eb5   592b2f:	4c 89 ee             	mov    %r13,%rsi
0eb8   592b32:	44 89 f2             	mov    %r14d,%edx
0ebb   592b35:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
0ec0   592b3a:	e8 b0 42 ff ff       	call   586def <lru_gen_update_size>
0ec5   592b3f:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
0eca   592b44:	4c 8d 73 08          	lea    0x8(%rbx),%r14
0ece   592b48:	4d 89 f4             	mov    %r14,%r12
0ed1   592b4b:	49 c1 ec 03          	shr    $0x3,%r12
0ed5   592b4f:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0edf   592b59:	41 80 3c 04 00       	cmpb   $0x0,(%r12,%rax,1)
0ee4   592b5e:	74 08                	je     592b68 <shrink_lruvec+0xeee>
0ee6   592b60:	4c 89 f7             	mov    %r14,%rdi
0ee9   592b63:	e8 00 00 00 00       	call   592b68 <shrink_lruvec+0xeee>	592b64: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0eee   592b68:	4c 89 34 24          	mov    %r14,(%rsp)
0ef2   592b6c:	4c 8b 7b 08          	mov    0x8(%rbx),%r15
0ef6   592b70:	49 89 de             	mov    %rbx,%r14
0ef9   592b73:	49 c1 ee 03          	shr    $0x3,%r14
0efd   592b77:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0f07   592b81:	41 80 3c 06 00       	cmpb   $0x0,(%r14,%rax,1)
0f0c   592b86:	74 08                	je     592b90 <shrink_lruvec+0xf16>
0f0e   592b88:	48 89 df             	mov    %rbx,%rdi
0f11   592b8b:	e8 00 00 00 00       	call   592b90 <shrink_lruvec+0xf16>	592b8c: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0f16   592b90:	48 8b 03             	mov    (%rbx),%rax
0f19   592b93:	48 89 84 24 b8 00 00 00 	mov    %rax,0xb8(%rsp)
0f21   592b9b:	48 8d 58 08          	lea    0x8(%rax),%rbx
0f25   592b9f:	48 89 d8             	mov    %rbx,%rax
0f28   592ba2:	48 c1 e8 03          	shr    $0x3,%rax
0f2c   592ba6:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
0f36   592bb0:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
0f3a   592bb4:	74 08                	je     592bbe <shrink_lruvec+0xf44>
0f3c   592bb6:	48 89 df             	mov    %rbx,%rdi
0f3f   592bb9:	e8 00 00 00 00       	call   592bbe <shrink_lruvec+0xf44>	592bba: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0f44   592bbe:	4c 89 3b             	mov    %r15,(%rbx)
0f47   592bc1:	4c 89 f8             	mov    %r15,%rax
0f4a   592bc4:	48 c1 e8 03          	shr    $0x3,%rax
0f4e   592bc8:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
0f58   592bd2:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
0f5c   592bd6:	74 08                	je     592be0 <shrink_lruvec+0xf66>
0f5e   592bd8:	4c 89 ff             	mov    %r15,%rdi
0f61   592bdb:	e8 00 00 00 00       	call   592be0 <shrink_lruvec+0xf66>	592bdc: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0f66   592be0:	48 8b 84 24 b8 00 00 00 	mov    0xb8(%rsp),%rax
0f6e   592be8:	49 89 07             	mov    %rax,(%r15)
0f71   592beb:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0f7b   592bf5:	41 80 3c 06 00       	cmpb   $0x0,(%r14,%rax,1)
0f80   592bfa:	4c 8b 74 24 18       	mov    0x18(%rsp),%r14
0f85   592bff:	74 08                	je     592c09 <shrink_lruvec+0xf8f>
0f87   592c01:	4c 89 f7             	mov    %r14,%rdi
0f8a   592c04:	e8 00 00 00 00       	call   592c09 <shrink_lruvec+0xf8f>	592c05: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0f8f   592c09:	48 b8 00 01 00 00 00 00 ad de 	movabs $0xdead000000000100,%rax
0f99   592c13:	49 89 06             	mov    %rax,(%r14)
0f9c   592c16:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0fa6   592c20:	41 80 3c 04 00       	cmpb   $0x0,(%r12,%rax,1)
0fab   592c25:	48 8b 1c 24          	mov    (%rsp),%rbx
0faf   592c29:	74 08                	je     592c33 <shrink_lruvec+0xfb9>
0fb1   592c2b:	48 89 df             	mov    %rbx,%rdi
0fb4   592c2e:	e8 00 00 00 00       	call   592c33 <shrink_lruvec+0xfb9>	592c2f: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0fb9   592c33:	48 b8 00 01 00 00 00 00 ad de 	movabs $0xdead000000000100,%rax
0fc3   592c3d:	48 83 c0 22          	add    $0x22,%rax
0fc7   592c41:	48 89 03             	mov    %rax,(%rbx)
0fca   592c44:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
0fcf   592c49:	eb 14                	jmp    592c5f <shrink_lruvec+0xfe5>
0fd1   592c4b:	e8 00 00 00 00       	call   592c50 <shrink_lruvec+0xfd6>	592c4c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0fd6   592c50:	e9 ce 01 00 00       	jmp    592e23 <shrink_lruvec+0x11a9>
0fdb   592c55:	e8 00 00 00 00       	call   592c5a <shrink_lruvec+0xfe0>	592c56: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0fe0   592c5a:	4c 8b 74 24 18       	mov    0x18(%rsp),%r14
0fe5   592c5f:	4c 89 ef             	mov    %r13,%rdi
0fe8   592c62:	be 08 00 00 00       	mov    $0x8,%esi
0fed   592c67:	e8 00 00 00 00       	call   592c6c <shrink_lruvec+0xff2>	592c68: R_X86_64_PLT32	__kasan_check_write-0x4
0ff2   592c6c:	f0 41 80 4e fa 10    	lock orb $0x10,-0x6(%r14)
0ff8   592c72:	4c 89 ef             	mov    %r13,%rdi
0ffb   592c75:	be 08 00 00 00       	mov    $0x8,%esi
1000   592c7a:	e8 00 00 00 00       	call   592c7f <shrink_lruvec+0x1005>	592c7b: R_X86_64_PLT32	__kasan_check_read-0x4
1005   592c7f:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
100f   592c89:	41 80 3c 04 00       	cmpb   $0x0,(%r12,%rax,1)
1014   592c8e:	74 08                	je     592c98 <shrink_lruvec+0x101e>
1016   592c90:	4c 89 ef             	mov    %r13,%rdi
1019   592c93:	e8 00 00 00 00       	call   592c98 <shrink_lruvec+0x101e>	592c94: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
101e   592c98:	49 8b 5d 00          	mov    0x0(%r13),%rbx
1022   592c9c:	be 00 00 10 00       	mov    $0x100000,%esi
1027   592ca1:	48 21 de             	and    %rbx,%rsi
102a   592ca4:	31 ff                	xor    %edi,%edi
102c   592ca6:	e8 00 00 00 00       	call   592cab <shrink_lruvec+0x1031>	592ca7: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
1031   592cab:	b8 00 00 10 00       	mov    $0x100000,%eax
1036   592cb0:	48 21 c3             	and    %rax,%rbx
1039   592cb3:	75 70                	jne    592d25 <shrink_lruvec+0x10ab>
103b   592cb5:	e8 00 00 00 00       	call   592cba <shrink_lruvec+0x1040>	592cb6: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1040   592cba:	4c 89 ef             	mov    %r13,%rdi
1043   592cbd:	be 08 00 00 00       	mov    $0x8,%esi
1048   592cc2:	e8 00 00 00 00       	call   592cc7 <shrink_lruvec+0x104d>	592cc3: R_X86_64_PLT32	__kasan_check_read-0x4
104d   592cc7:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
1057   592cd1:	41 80 3c 04 00       	cmpb   $0x0,(%r12,%rax,1)
105c   592cd6:	74 08                	je     592ce0 <shrink_lruvec+0x1066>
105e   592cd8:	4c 89 ef             	mov    %r13,%rdi
1061   592cdb:	e8 00 00 00 00       	call   592ce0 <shrink_lruvec+0x1066>	592cdc: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1066   592ce0:	49 8b 5d 00          	mov    0x0(%r13),%rbx
106a   592ce4:	c1 eb 12             	shr    $0x12,%ebx
106d   592ce7:	83 e3 02             	and    $0x2,%ebx
1070   592cea:	4c 89 ef             	mov    %r13,%rdi
1073   592ced:	be 08 00 00 00       	mov    $0x8,%esi
1078   592cf2:	e8 00 00 00 00       	call   592cf7 <shrink_lruvec+0x107d>	592cf3: R_X86_64_PLT32	__kasan_check_read-0x4
107d   592cf7:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
1087   592d01:	41 80 3c 04 00       	cmpb   $0x0,(%r12,%rax,1)
108c   592d06:	74 08                	je     592d10 <shrink_lruvec+0x1096>
108e   592d08:	4c 89 ef             	mov    %r13,%rdi
1091   592d0b:	e8 00 00 00 00       	call   592d10 <shrink_lruvec+0x1096>	592d0c: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1096   592d10:	4d 8b 7d 00          	mov    0x0(%r13),%r15
109a   592d14:	41 c1 ef 05          	shr    $0x5,%r15d
109e   592d18:	41 83 e7 01          	and    $0x1,%r15d
10a2   592d1c:	41 09 df             	or     %ebx,%r15d
10a5   592d1f:	41 83 f7 02          	xor    $0x2,%r15d
10a9   592d23:	eb 0b                	jmp    592d30 <shrink_lruvec+0x10b6>
10ab   592d25:	e8 00 00 00 00       	call   592d2a <shrink_lruvec+0x10b0>	592d26: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
10b0   592d2a:	41 bf 04 00 00 00    	mov    $0x4,%r15d
10b6   592d30:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
10bb   592d35:	4c 89 ee             	mov    %r13,%rsi
10be   592d38:	31 d2                	xor    %edx,%edx
10c0   592d3a:	e8 eb c6 ff ff       	call   58f42a <lru_gen_add_folio>
10c5   592d3f:	84 c0                	test   %al,%al
10c7   592d41:	74 0f                	je     592d52 <shrink_lruvec+0x10d8>
10c9   592d43:	e8 00 00 00 00       	call   592d48 <shrink_lruvec+0x10ce>	592d44: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
10ce   592d48:	44 8b 6c 24 40       	mov    0x40(%rsp),%r13d
10d3   592d4d:	e9 a3 07 00 00       	jmp    5934f5 <shrink_lruvec+0x187b>
10d8   592d52:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
10e2   592d5c:	41 80 3c 04 00       	cmpb   $0x0,(%r12,%rax,1)
10e7   592d61:	74 08                	je     592d6b <shrink_lruvec+0x10f1>
10e9   592d63:	4c 89 ef             	mov    %r13,%rdi
10ec   592d66:	e8 00 00 00 00       	call   592d6b <shrink_lruvec+0x10f1>	592d67: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
10f1   592d6b:	45 0f b6 65 07       	movzbl 0x7(%r13),%r12d
10f6   592d70:	4c 89 ef             	mov    %r13,%rdi
10f9   592d73:	be 08 00 00 00       	mov    $0x8,%esi
10fe   592d78:	e8 00 00 00 00       	call   592d7d <shrink_lruvec+0x1103>	592d79: R_X86_64_PLT32	__kasan_check_read-0x4
1103   592d7d:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
110d   592d87:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
1112   592d8c:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
1116   592d90:	74 08                	je     592d9a <shrink_lruvec+0x1120>
1118   592d92:	4c 89 ef             	mov    %r13,%rdi
111b   592d95:	e8 00 00 00 00       	call   592d9a <shrink_lruvec+0x1120>	592d96: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1120   592d9a:	49 8b 5d 00          	mov    0x0(%r13),%rbx
1124   592d9e:	be 00 00 01 00       	mov    $0x10000,%esi
1129   592da3:	48 21 de             	and    %rbx,%rsi
112c   592da6:	31 ff                	xor    %edi,%edi
112e   592da8:	e8 00 00 00 00       	call   592dad <shrink_lruvec+0x1133>	592da9: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
1133   592dad:	b8 00 00 01 00       	mov    $0x10000,%eax
1138   592db2:	48 21 c3             	and    %rax,%rbx
113b   592db5:	0f 85 44 05 00 00    	jne    5932ff <shrink_lruvec+0x1685>
1141   592dbb:	e8 00 00 00 00       	call   592dc0 <shrink_lruvec+0x1146>	592dbc: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1146   592dc0:	41 be 01 00 00 00    	mov    $0x1,%r14d
114c   592dc6:	44 8b 6c 24 40       	mov    0x40(%rsp),%r13d
1151   592dcb:	e9 5c 05 00 00       	jmp    59332c <shrink_lruvec+0x16b2>
1156   592dd0:	4c 89 ef             	mov    %r13,%rdi
1159   592dd3:	be 08 00 00 00       	mov    $0x8,%esi
115e   592dd8:	e8 00 00 00 00       	call   592ddd <shrink_lruvec+0x1163>	592dd9: R_X86_64_PLT32	__kasan_check_read-0x4
1163   592ddd:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
116d   592de7:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
1172   592dec:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
1176   592df0:	74 08                	je     592dfa <shrink_lruvec+0x1180>
1178   592df2:	4c 89 ef             	mov    %r13,%rdi
117b   592df5:	e8 00 00 00 00       	call   592dfa <shrink_lruvec+0x1180>	592df6: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1180   592dfa:	49 8b 5d 00          	mov    0x0(%r13),%rbx
1184   592dfe:	48 89 de             	mov    %rbx,%rsi
1187   592e01:	48 83 e6 08          	and    $0x8,%rsi
118b   592e05:	31 ff                	xor    %edi,%edi
118d   592e07:	e8 00 00 00 00       	call   592e0c <shrink_lruvec+0x1192>	592e08: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
1192   592e0c:	48 83 e3 08          	and    $0x8,%rbx
1196   592e10:	0f 85 d0 07 00 00    	jne    5935e6 <shrink_lruvec+0x196c>
119c   592e16:	e8 00 00 00 00       	call   592e1b <shrink_lruvec+0x11a1>	592e17: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
11a1   592e1b:	44 89 f3             	mov    %r14d,%ebx
11a4   592e1e:	4c 8b 74 24 18       	mov    0x18(%rsp),%r14
11a9   592e23:	49 c1 ec 27          	shr    $0x27,%r12
11ad   592e27:	41 83 e4 07          	and    $0x7,%r12d
11b1   592e2b:	48 c1 2c 24 38       	shrq   $0x38,(%rsp)
11b6   592e30:	41 ff cc             	dec    %r12d
11b9   592e33:	89 9c 24 d0 00 00 00 	mov    %ebx,0xd0(%rsp)
11c0   592e3a:	83 f3 01             	xor    $0x1,%ebx
11c3   592e3d:	89 d9                	mov    %ebx,%ecx
11c5   592e3f:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
11ca   592e44:	48 89 8c 24 b8 00 00 00 	mov    %rcx,0xb8(%rsp)
11d2   592e4c:	48 8d 1c c8          	lea    (%rax,%rcx,8),%rbx
11d6   592e50:	48 81 c3 c8 00 00 00 	add    $0xc8,%rbx
11dd   592e57:	48 89 d8             	mov    %rbx,%rax
11e0   592e5a:	48 c1 e8 03          	shr    $0x3,%rax
11e4   592e5e:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
11ee   592e68:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
11f2   592e6c:	74 08                	je     592e76 <shrink_lruvec+0x11fc>
11f4   592e6e:	48 89 df             	mov    %rbx,%rdi
11f7   592e71:	e8 00 00 00 00       	call   592e76 <shrink_lruvec+0x11fc>	592e72: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
11fc   592e76:	48 8b 04 24          	mov    (%rsp),%rax
1200   592e7a:	83 e0 03             	and    $0x3,%eax
1203   592e7d:	48 89 04 24          	mov    %rax,(%rsp)
1207   592e81:	8b 1b                	mov    (%rbx),%ebx
1209   592e83:	83 e3 03             	and    $0x3,%ebx
120c   592e86:	44 89 e7             	mov    %r12d,%edi
120f   592e89:	89 de                	mov    %ebx,%esi
1211   592e8b:	e8 00 00 00 00       	call   592e90 <shrink_lruvec+0x1216>	592e8c: R_X86_64_PLT32	__sanitizer_cov_trace_cmp4-0x4
1216   592e90:	41 39 dc             	cmp    %ebx,%r12d
1219   592e93:	0f 85 b5 02 00 00    	jne    59314e <shrink_lruvec+0x14d4>
121f   592e99:	44 89 ff             	mov    %r15d,%edi
1222   592e9c:	8b 9c 24 a8 01 00 00 	mov    0x1a8(%rsp),%ebx
1229   592ea3:	89 de                	mov    %ebx,%esi
122b   592ea5:	e8 00 00 00 00       	call   592eaa <shrink_lruvec+0x1230>	592ea6: R_X86_64_PLT32	__sanitizer_cov_trace_cmp4-0x4
1230   592eaa:	41 39 df             	cmp    %ebx,%r15d
1233   592ead:	0f 8e dc 04 00 00    	jle    59338f <shrink_lruvec+0x1715>
1239   592eb3:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
123e   592eb8:	4c 89 ee             	mov    %r13,%rsi
1241   592ebb:	31 d2                	xor    %edx,%edx
1243   592ebd:	e8 6f b2 00 00       	call   59e131 <folio_inc_gen>
1248   592ec2:	41 89 c5             	mov    %eax,%r13d
124b   592ec5:	bf 04 00 00 00       	mov    $0x4,%edi
1250   592eca:	89 c6                	mov    %eax,%esi
1252   592ecc:	e8 00 00 00 00       	call   592ed1 <shrink_lruvec+0x1257>	592ecd: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
1257   592ed1:	41 83 fd 03          	cmp    $0x3,%r13d
125b   592ed5:	0f 87 a1 17 00 00    	ja     59467c <shrink_lruvec+0x2a02>
1261   592edb:	e8 00 00 00 00       	call   592ee0 <shrink_lruvec+0x1266>	592edc: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1266   592ee0:	49 8d 5e 08          	lea    0x8(%r14),%rbx
126a   592ee4:	48 89 d9             	mov    %rbx,%rcx
126d   592ee7:	48 c1 e9 03          	shr    $0x3,%rcx
1271   592eeb:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
127b   592ef5:	48 89 8c 24 00 02 00 00 	mov    %rcx,0x200(%rsp)
1283   592efd:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
1287   592f01:	74 08                	je     592f0b <shrink_lruvec+0x1291>
1289   592f03:	48 89 df             	mov    %rbx,%rdi
128c   592f06:	e8 00 00 00 00       	call   592f0b <shrink_lruvec+0x1291>	592f07: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1291   592f0b:	48 89 9c 24 30 02 00 00 	mov    %rbx,0x230(%rsp)
1299   592f13:	4d 63 f5             	movslq %r13d,%r14
129c   592f16:	49 c1 e6 07          	shl    $0x7,%r14
12a0   592f1a:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
12a5   592f1f:	4c 8b 6b 08          	mov    0x8(%rbx),%r13
12a9   592f23:	48 89 d9             	mov    %rbx,%rcx
12ac   592f26:	48 c1 e9 03          	shr    $0x3,%rcx
12b0   592f2a:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
12ba   592f34:	48 89 8c 24 a0 01 00 00 	mov    %rcx,0x1a0(%rsp)
12c2   592f3c:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
12c6   592f40:	74 08                	je     592f4a <shrink_lruvec+0x12d0>
12c8   592f42:	48 89 df             	mov    %rbx,%rdi
12cb   592f45:	e8 00 00 00 00       	call   592f4a <shrink_lruvec+0x12d0>	592f46: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
12d0   592f4a:	4c 03 74 24 10       	add    0x10(%rsp),%r14
12d5   592f4f:	4c 8b a4 24 b8 00 00 00 	mov    0xb8(%rsp),%r12
12dd   592f57:	49 c1 e4 06          	shl    $0x6,%r12
12e1   592f5b:	48 8b 03             	mov    (%rbx),%rax
12e4   592f5e:	48 89 84 24 98 01 00 00 	mov    %rax,0x198(%rsp)
12ec   592f66:	48 8d 58 08          	lea    0x8(%rax),%rbx
12f0   592f6a:	48 89 d8             	mov    %rbx,%rax
12f3   592f6d:	48 c1 e8 03          	shr    $0x3,%rax
12f7   592f71:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
1301   592f7b:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
1305   592f7f:	74 08                	je     592f89 <shrink_lruvec+0x130f>
1307   592f81:	48 89 df             	mov    %rbx,%rdi
130a   592f84:	e8 00 00 00 00       	call   592f89 <shrink_lruvec+0x130f>	592f85: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
130f   592f89:	8b 04 24             	mov    (%rsp),%eax
1312   592f8c:	4d 01 e6             	add    %r12,%r14
1315   592f8f:	48 c1 e0 04          	shl    $0x4,%rax
1319   592f93:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
131e   592f98:	4c 89 2b             	mov    %r13,(%rbx)
1321   592f9b:	4c 89 e8             	mov    %r13,%rax
1324   592f9e:	48 c1 e8 03          	shr    $0x3,%rax
1328   592fa2:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
1332   592fac:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
1336   592fb0:	74 08                	je     592fba <shrink_lruvec+0x1340>
1338   592fb2:	4c 89 ef             	mov    %r13,%rdi
133b   592fb5:	e8 00 00 00 00       	call   592fba <shrink_lruvec+0x1340>	592fb6: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
1340   592fba:	48 8b 84 24 98 01 00 00 	mov    0x198(%rsp),%rax
1348   592fc2:	49 89 45 00          	mov    %rax,0x0(%r13)
134c   592fc6:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
1351   592fcb:	4e 8d 24 30          	lea    (%rax,%r14,1),%r12
1355   592fcf:	49 81 c4 e0 00 00 00 	add    $0xe0,%r12
135c   592fd6:	4c 89 e3             	mov    %r12,%rbx
135f   592fd9:	48 c1 eb 03          	shr    $0x3,%rbx
1363   592fdd:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
136d   592fe7:	80 3c 03 00          	cmpb   $0x0,(%rbx,%rax,1)
1371   592feb:	74 08                	je     592ff5 <shrink_lruvec+0x137b>
1373   592fed:	4c 89 e7             	mov    %r12,%rdi
1376   592ff0:	e8 00 00 00 00       	call   592ff5 <shrink_lruvec+0x137b>	592ff1: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
137b   592ff5:	4d 8b 2c 24          	mov    (%r12),%r13
137f   592ff9:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
1389   593003:	80 3c 03 00          	cmpb   $0x0,(%rbx,%rax,1)
138d   593007:	74 08                	je     593011 <shrink_lruvec+0x1397>
138f   593009:	4c 89 e7             	mov    %r12,%rdi
1392   59300c:	e8 00 00 00 00       	call   593011 <shrink_lruvec+0x1397>	59300d: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
1397   593011:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
139c   593016:	49 89 1c 24          	mov    %rbx,(%r12)
13a0   59301a:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
13aa   593024:	48 8b 8c 24 a0 01 00 00 	mov    0x1a0(%rsp),%rcx
13b2   59302c:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
13b6   593030:	74 08                	je     59303a <shrink_lruvec+0x13c0>
13b8   593032:	48 89 df             	mov    %rbx,%rdi
13bb   593035:	e8 00 00 00 00       	call   59303a <shrink_lruvec+0x13c0>	593036: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
13c0   59303a:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
13c5   59303f:	4c 01 f0             	add    %r14,%rax
13c8   593042:	48 05 d8 00 00 00    	add    $0xd8,%rax
13ce   593048:	48 89 03             	mov    %rax,(%rbx)
13d1   59304b:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
13db   593055:	48 8b 8c 24 00 02 00 00 	mov    0x200(%rsp),%rcx
13e3   59305d:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
13e7   593061:	4c 8b b4 24 30 02 00 00 	mov    0x230(%rsp),%r14
13ef   593069:	74 08                	je     593073 <shrink_lruvec+0x13f9>
13f1   59306b:	4c 89 f7             	mov    %r14,%rdi
13f4   59306e:	e8 00 00 00 00       	call   593073 <shrink_lruvec+0x13f9>	59306f: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
13f9   593073:	4d 89 2e             	mov    %r13,(%r14)
13fc   593076:	4c 89 e8             	mov    %r13,%rax
13ff   593079:	48 c1 e8 03          	shr    $0x3,%rax
1403   59307d:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
140d   593087:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
1411   59308b:	74 08                	je     593095 <shrink_lruvec+0x141b>
1413   59308d:	4c 89 ef             	mov    %r13,%rdi
1416   593090:	e8 00 00 00 00       	call   593095 <shrink_lruvec+0x141b>	593091: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
141b   593095:	49 89 5d 00          	mov    %rbx,0x0(%r13)
141f   593099:	41 ff cf             	dec    %r15d
1422   59309c:	49 63 df             	movslq %r15d,%rbx
1425   59309f:	bf 03 00 00 00       	mov    $0x3,%edi
142a   5930a4:	89 de                	mov    %ebx,%esi
142c   5930a6:	e8 00 00 00 00       	call   5930ab <shrink_lruvec+0x1431>	5930a7: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
1431   5930ab:	83 fb 02             	cmp    $0x2,%ebx
1434   5930ae:	0f 87 e1 15 00 00    	ja     594695 <shrink_lruvec+0x2a1b>
143a   5930b4:	e8 00 00 00 00       	call   5930b9 <shrink_lruvec+0x143f>	5930b5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
143f   5930b9:	48 8b 84 24 b8 00 00 00 	mov    0xb8(%rsp),%rax
1447   5930c1:	48 8d 04 40          	lea    (%rax,%rax,2),%rax
144b   5930c5:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
1450   5930ca:	48 8d 04 c1          	lea    (%rcx,%rax,8),%rax
1454   5930ce:	48 8d 1c d8          	lea    (%rax,%rbx,8),%rbx
1458   5930d2:	48 81 c3 58 04 00 00 	add    $0x458,%rbx
145f   5930d9:	48 89 d8             	mov    %rbx,%rax
1462   5930dc:	48 c1 e8 03          	shr    $0x3,%rax
1466   5930e0:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
1470   5930ea:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
1474   5930ee:	74 08                	je     5930f8 <shrink_lruvec+0x147e>
1476   5930f0:	48 89 df             	mov    %rbx,%rdi
1479   5930f3:	e8 00 00 00 00       	call   5930f8 <shrink_lruvec+0x147e>	5930f4: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
147e   5930f8:	4c 63 64 24 58       	movslq 0x58(%rsp),%r12
1483   5930fd:	4c 8b 33             	mov    (%rbx),%r14
1486   593100:	4d 01 e6             	add    %r12,%r14
1489   593103:	44 8b 6c 24 40       	mov    0x40(%rsp),%r13d
148e   593108:	4c 8b 7c 24 28       	mov    0x28(%rsp),%r15
1493   59310d:	48 89 d8             	mov    %rbx,%rax
1496   593110:	48 c1 e8 03          	shr    $0x3,%rax
149a   593114:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
14a4   59311e:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
14a8   593122:	74 08                	je     59312c <shrink_lruvec+0x14b2>
14aa   593124:	48 89 df             	mov    %rbx,%rdi
14ad   593127:	e8 00 00 00 00       	call   59312c <shrink_lruvec+0x14b2>	593128: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
14b2   59312c:	4c 89 33             	mov    %r14,(%rbx)
14b5   59312f:	8b b4 24 d0 00 00 00 	mov    0xd0(%rsp),%esi
14bc   593136:	83 f6 0d             	xor    $0xd,%esi
14bf   593139:	48 8b bc 24 88 00 00 00 	mov    0x88(%rsp),%rdi
14c7   593141:	4c 89 e2             	mov    %r12,%rdx
14ca   593144:	e8 00 00 00 00       	call   593149 <shrink_lruvec+0x14cf>	593145: R_X86_64_PLT32	__mod_node_page_state-0x4
14cf   593149:	e9 a2 09 00 00       	jmp    593af0 <shrink_lruvec+0x1e76>
14d4   59314e:	bf 04 00 00 00       	mov    $0x4,%edi
14d9   593153:	44 89 e6             	mov    %r12d,%esi
14dc   593156:	e8 00 00 00 00       	call   59315b <shrink_lruvec+0x14e1>	593157: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
14e1   59315b:	41 83 fc 03          	cmp    $0x3,%r12d
14e5   59315f:	0f 87 8e 14 00 00    	ja     5945f3 <shrink_lruvec+0x2979>
14eb   593165:	e8 00 00 00 00       	call   59316a <shrink_lruvec+0x14f0>	593166: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
14f0   59316a:	49 8d 5e 08          	lea    0x8(%r14),%rbx
14f4   59316e:	48 89 d9             	mov    %rbx,%rcx
14f7   593171:	48 c1 e9 03          	shr    $0x3,%rcx
14fb   593175:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
1505   59317f:	48 89 4c 24 58       	mov    %rcx,0x58(%rsp)
150a   593184:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
150e   593188:	74 08                	je     593192 <shrink_lruvec+0x1518>
1510   59318a:	48 89 df             	mov    %rbx,%rdi
1513   59318d:	e8 00 00 00 00       	call   593192 <shrink_lruvec+0x1518>	59318e: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1518   593192:	48 89 5c 24 08       	mov    %rbx,0x8(%rsp)
151d   593197:	49 63 dc             	movslq %r12d,%rbx
1520   59319a:	48 c1 e3 07          	shl    $0x7,%rbx
1524   59319e:	4d 8b 66 08          	mov    0x8(%r14),%r12
1528   5931a2:	4c 89 f1             	mov    %r14,%rcx
152b   5931a5:	48 c1 e9 03          	shr    $0x3,%rcx
152f   5931a9:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
1539   5931b3:	48 89 8c 24 d0 00 00 00 	mov    %rcx,0xd0(%rsp)
1541   5931bb:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
1545   5931bf:	74 08                	je     5931c9 <shrink_lruvec+0x154f>
1547   5931c1:	4c 89 f7             	mov    %r14,%rdi
154a   5931c4:	e8 00 00 00 00       	call   5931c9 <shrink_lruvec+0x154f>	5931c5: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
154f   5931c9:	48 03 5c 24 10       	add    0x10(%rsp),%rbx
1554   5931ce:	48 8b 94 24 b8 00 00 00 	mov    0xb8(%rsp),%rdx
155c   5931d6:	48 c1 e2 06          	shl    $0x6,%rdx
1560   5931da:	4d 8b 2e             	mov    (%r14),%r13
1563   5931dd:	4d 8d 7d 08          	lea    0x8(%r13),%r15
1567   5931e1:	4c 89 f8             	mov    %r15,%rax
156a   5931e4:	48 c1 e8 03          	shr    $0x3,%rax
156e   5931e8:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
1578   5931f2:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
157c   5931f6:	74 0e                	je     593206 <shrink_lruvec+0x158c>
157e   5931f8:	4c 89 ff             	mov    %r15,%rdi
1581   5931fb:	49 89 d6             	mov    %rdx,%r14
1584   5931fe:	e8 00 00 00 00       	call   593203 <shrink_lruvec+0x1589>	5931ff: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
1589   593203:	4c 89 f2             	mov    %r14,%rdx
158c   593206:	44 8b 34 24          	mov    (%rsp),%r14d
1590   59320a:	48 01 d3             	add    %rdx,%rbx
1593   59320d:	49 c1 e6 04          	shl    $0x4,%r14
1597   593211:	4d 89 27             	mov    %r12,(%r15)
159a   593214:	4c 89 e0             	mov    %r12,%rax
159d   593217:	48 c1 e8 03          	shr    $0x3,%rax
15a1   59321b:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
15ab   593225:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
15af   593229:	74 08                	je     593233 <shrink_lruvec+0x15b9>
15b1   59322b:	4c 89 e7             	mov    %r12,%rdi
15b4   59322e:	e8 00 00 00 00       	call   593233 <shrink_lruvec+0x15b9>	59322f: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
15b9   593233:	4d 8d 3c 1e          	lea    (%r14,%rbx,1),%r15
15bd   593237:	49 81 c7 d8 00 00 00 	add    $0xd8,%r15
15c4   59323e:	4d 89 2c 24          	mov    %r13,(%r12)
15c8   593242:	4d 89 fc             	mov    %r15,%r12
15cb   593245:	49 c1 ec 03          	shr    $0x3,%r12
15cf   593249:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
15d9   593253:	41 80 3c 04 00       	cmpb   $0x0,(%r12,%rax,1)
15de   593258:	74 08                	je     593262 <shrink_lruvec+0x15e8>
15e0   59325a:	4c 89 ff             	mov    %r15,%rdi
15e3   59325d:	e8 00 00 00 00       	call   593262 <shrink_lruvec+0x15e8>	59325e: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
15e8   593262:	4d 8b 2f             	mov    (%r15),%r13
15eb   593265:	49 8d 5d 08          	lea    0x8(%r13),%rbx
15ef   593269:	48 89 d8             	mov    %rbx,%rax
15f2   59326c:	48 c1 e8 03          	shr    $0x3,%rax
15f6   593270:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
1600   59327a:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
1604   59327e:	4c 8b 74 24 18       	mov    0x18(%rsp),%r14
1609   593283:	74 08                	je     59328d <shrink_lruvec+0x1613>
160b   593285:	48 89 df             	mov    %rbx,%rdi
160e   593288:	e8 00 00 00 00       	call   59328d <shrink_lruvec+0x1613>	593289: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
1613   59328d:	4c 89 33             	mov    %r14,(%rbx)
1616   593290:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
1620   59329a:	48 8b 8c 24 d0 00 00 00 	mov    0xd0(%rsp),%rcx
1628   5932a2:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
162c   5932a6:	74 08                	je     5932b0 <shrink_lruvec+0x1636>
162e   5932a8:	4c 89 f7             	mov    %r14,%rdi
1631   5932ab:	e8 00 00 00 00       	call   5932b0 <shrink_lruvec+0x1636>	5932ac: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
1636   5932b0:	4d 89 2e             	mov    %r13,(%r14)
1639   5932b3:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
1643   5932bd:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
1648   5932c2:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
164c   5932c6:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
1651   5932cb:	74 08                	je     5932d5 <shrink_lruvec+0x165b>
1653   5932cd:	48 89 df             	mov    %rbx,%rdi
1656   5932d0:	e8 00 00 00 00       	call   5932d5 <shrink_lruvec+0x165b>	5932d1: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
165b   5932d5:	4c 89 3b             	mov    %r15,(%rbx)
165e   5932d8:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
1668   5932e2:	41 80 3c 04 00       	cmpb   $0x0,(%r12,%rax,1)
166d   5932e7:	44 8b 6c 24 40       	mov    0x40(%rsp),%r13d
1672   5932ec:	0f 84 f6 07 00 00    	je     593ae8 <shrink_lruvec+0x1e6e>
1678   5932f2:	4c 89 ff             	mov    %r15,%rdi
167b   5932f5:	e8 00 00 00 00       	call   5932fa <shrink_lruvec+0x1680>	5932f6: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
1680   5932fa:	e9 e9 07 00 00       	jmp    593ae8 <shrink_lruvec+0x1e6e>
1685   5932ff:	e8 00 00 00 00       	call   593304 <shrink_lruvec+0x168a>	593300: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
168a   593304:	49 83 c6 54          	add    $0x54,%r14
168e   593308:	4c 89 f0             	mov    %r14,%rax
1691   59330b:	48 c1 e8 03          	shr    $0x3,%rax
1695   59330f:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
169f   593319:	8a 04 08             	mov    (%rax,%rcx,1),%al
16a2   59331c:	84 c0                	test   %al,%al
16a4   59331e:	44 8b 6c 24 40       	mov    0x40(%rsp),%r13d
16a9   593323:	0f 85 86 12 00 00    	jne    5945af <shrink_lruvec+0x2935>
16af   593329:	45 8b 36             	mov    (%r14),%r14d
16b2   59332c:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
16bc   593336:	48 8b 8c 24 80 00 00 00 	mov    0x80(%rsp),%rcx
16c4   59333e:	8a 04 01             	mov    (%rcx,%rax,1),%al
16c7   593341:	84 c0                	test   %al,%al
16c9   593343:	0f 85 40 12 00 00    	jne    594589 <shrink_lruvec+0x290f>
16cf   593349:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 59334f <shrink_lruvec+0x16d5>	59334b: R_X86_64_PC32	debug_locks-0x4
16d5   59334f:	31 ff                	xor    %edi,%edi
16d7   593351:	89 de                	mov    %ebx,%esi
16d9   593353:	e8 00 00 00 00       	call   593358 <shrink_lruvec+0x16de>	593354: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
16de   593358:	85 db                	test   %ebx,%ebx
16e0   59335a:	0f 84 28 01 00 00    	je     593488 <shrink_lruvec+0x180e>
16e6   593360:	48 8b bc 24 88 01 00 00 	mov    0x188(%rsp),%rdi
16ee   593368:	be ff ff ff ff       	mov    $0xffffffff,%esi
16f3   59336d:	e8 00 00 00 00       	call   593372 <shrink_lruvec+0x16f8>	59336e: R_X86_64_PLT32	lock_is_held_type-0x4
16f8   593372:	89 c3                	mov    %eax,%ebx
16fa   593374:	31 ff                	xor    %edi,%edi
16fc   593376:	89 c6                	mov    %eax,%esi
16fe   593378:	e8 00 00 00 00       	call   59337d <shrink_lruvec+0x1703>	593379: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
1703   59337d:	85 db                	test   %ebx,%ebx
1705   59337f:	0f 84 9c 11 00 00    	je     594521 <shrink_lruvec+0x28a7>
170b   593385:	e8 00 00 00 00       	call   59338a <shrink_lruvec+0x1710>	593386: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1710   59338a:	e9 fe 00 00 00       	jmp    59348d <shrink_lruvec+0x1813>
1715   59338f:	4c 89 ef             	mov    %r13,%rdi
1718   593392:	be 08 00 00 00       	mov    $0x8,%esi
171d   593397:	e8 00 00 00 00       	call   59339c <shrink_lruvec+0x1722>	593398: R_X86_64_PLT32	__kasan_check_read-0x4
1722   59339c:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
172c   5933a6:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
1731   5933ab:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
1735   5933af:	49 bc ff ff ff ff 7f fc ff ff 	movabs $0xfffffc7fffffffff,%r12
173f   5933b9:	74 08                	je     5933c3 <shrink_lruvec+0x1749>
1741   5933bb:	4c 89 ef             	mov    %r13,%rdi
1744   5933be:	e8 00 00 00 00       	call   5933c3 <shrink_lruvec+0x1749>	5933bf: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1749   5933c3:	49 8b 5d 00          	mov    0x0(%r13),%rbx
174d   5933c7:	48 89 de             	mov    %rbx,%rsi
1750   5933ca:	48 83 e6 01          	and    $0x1,%rsi
1754   5933ce:	31 ff                	xor    %edi,%edi
1756   5933d0:	e8 00 00 00 00       	call   5933d5 <shrink_lruvec+0x175b>	5933d1: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
175b   5933d5:	48 83 e3 01          	and    $0x1,%rbx
175f   5933d9:	0f 85 90 04 00 00    	jne    59386f <shrink_lruvec+0x1bf5>
1765   5933df:	4c 89 ef             	mov    %r13,%rdi
1768   5933e2:	be 08 00 00 00       	mov    $0x8,%esi
176d   5933e7:	e8 00 00 00 00       	call   5933ec <shrink_lruvec+0x1772>	5933e8: R_X86_64_PLT32	__kasan_check_read-0x4
1772   5933ec:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
177c   5933f6:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
1781   5933fb:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
1785   5933ff:	74 08                	je     593409 <shrink_lruvec+0x178f>
1787   593401:	4c 89 ef             	mov    %r13,%rdi
178a   593404:	e8 00 00 00 00       	call   593409 <shrink_lruvec+0x178f>	593405: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
178f   593409:	49 8b 5d 00          	mov    0x0(%r13),%rbx
1793   59340d:	be 00 80 00 00       	mov    $0x8000,%esi
1798   593412:	48 21 de             	and    %rbx,%rsi
179b   593415:	31 ff                	xor    %edi,%edi
179d   593417:	e8 00 00 00 00       	call   59341c <shrink_lruvec+0x17a2>	593418: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
17a2   59341c:	b8 00 80 00 00       	mov    $0x8000,%eax
17a7   593421:	48 21 c3             	and    %rax,%rbx
17aa   593424:	0f 85 fd 04 00 00    	jne    593927 <shrink_lruvec+0x1cad>
17b0   59342a:	83 bc 24 d0 00 00 00 00 	cmpl   $0x0,0xd0(%rsp)
17b8   593432:	0f 85 ab 07 00 00    	jne    593be3 <shrink_lruvec+0x1f69>
17be   593438:	4c 89 ef             	mov    %r13,%rdi
17c1   59343b:	be 08 00 00 00       	mov    $0x8,%esi
17c6   593440:	e8 00 00 00 00       	call   593445 <shrink_lruvec+0x17cb>	593441: R_X86_64_PLT32	__kasan_check_read-0x4
17cb   593445:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
17d5   59344f:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
17da   593454:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
17de   593458:	74 08                	je     593462 <shrink_lruvec+0x17e8>
17e0   59345a:	4c 89 ef             	mov    %r13,%rdi
17e3   59345d:	e8 00 00 00 00       	call   593462 <shrink_lruvec+0x17e8>	59345e: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
17e8   593462:	49 8b 5d 00          	mov    0x0(%r13),%rbx
17ec   593466:	48 89 de             	mov    %rbx,%rsi
17ef   593469:	48 83 e6 08          	and    $0x8,%rsi
17f3   59346d:	31 ff                	xor    %edi,%edi
17f5   59346f:	e8 00 00 00 00       	call   593474 <shrink_lruvec+0x17fa>	593470: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
17fa   593474:	48 83 e3 08          	and    $0x8,%rbx
17fe   593478:	0f 85 f3 08 00 00    	jne    593d71 <shrink_lruvec+0x20f7>
1804   59347e:	e8 00 00 00 00       	call   593483 <shrink_lruvec+0x1809>	59347f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1809   593483:	e9 60 07 00 00       	jmp    593be8 <shrink_lruvec+0x1f6e>
180e   593488:	e8 00 00 00 00       	call   59348d <shrink_lruvec+0x1813>	593489: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1813   59348d:	41 83 e4 03          	and    $0x3,%r12d
1817   593491:	bf 00 00 00 80       	mov    $0x80000000,%edi
181c   593496:	4c 89 f6             	mov    %r14,%rsi
181f   593499:	e8 00 00 00 00       	call   59349e <shrink_lruvec+0x1824>	59349a: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
1824   59349e:	b8 00 00 00 80       	mov    $0x80000000,%eax
1829   5934a3:	49 39 c6             	cmp    %rax,%r14
182c   5934a6:	0f 83 69 10 00 00    	jae    594515 <shrink_lruvec+0x289b>
1832   5934ac:	e8 00 00 00 00       	call   5934b1 <shrink_lruvec+0x1837>	5934ad: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1837   5934b1:	49 63 d6             	movslq %r14d,%rdx
183a   5934b4:	48 8b 9c 24 88 00 00 00 	mov    0x88(%rsp),%rbx
1842   5934bc:	48 89 df             	mov    %rbx,%rdi
1845   5934bf:	44 89 fe             	mov    %r15d,%esi
1848   5934c2:	e8 00 00 00 00       	call   5934c7 <shrink_lruvec+0x184d>	5934c3: R_X86_64_PLT32	__mod_node_page_state-0x4
184d   5934c7:	49 69 fc c0 06 00 00 	imul   $0x6c0,%r12,%rdi
1854   5934ce:	48 01 df             	add    %rbx,%rdi
1857   5934d1:	41 8d 77 01          	lea    0x1(%r15),%esi
185b   5934d5:	4c 89 f2             	mov    %r14,%rdx
185e   5934d8:	e8 00 00 00 00       	call   5934dd <shrink_lruvec+0x1863>	5934d9: R_X86_64_PLT32	__mod_zone_page_state-0x4
1863   5934dd:	bf 04 00 00 00       	mov    $0x4,%edi
1868   5934e2:	44 89 fe             	mov    %r15d,%esi
186b   5934e5:	e8 00 00 00 00       	call   5934ea <shrink_lruvec+0x1870>	5934e6: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
1870   5934ea:	41 83 ff 04          	cmp    $0x4,%r15d
1874   5934ee:	75 0f                	jne    5934ff <shrink_lruvec+0x1885>
1876   5934f0:	e8 00 00 00 00       	call   5934f5 <shrink_lruvec+0x187b>	5934f1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
187b   5934f5:	4c 8b 7c 24 28       	mov    0x28(%rsp),%r15
1880   5934fa:	e9 d5 00 00 00       	jmp    5935d4 <shrink_lruvec+0x195a>
1885   5934ff:	e8 00 00 00 00       	call   593504 <shrink_lruvec+0x188a>	593500: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
188a   593504:	45 89 ff             	mov    %r15d,%r15d
188d   593507:	49 c1 e7 04          	shl    $0x4,%r15
1891   59350b:	4c 03 7c 24 10       	add    0x10(%rsp),%r15
1896   593510:	4d 89 fd             	mov    %r15,%r13
1899   593513:	49 c1 ed 03          	shr    $0x3,%r13
189d   593517:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
18a7   593521:	41 80 7c 05 00 00    	cmpb   $0x0,0x0(%r13,%rax,1)
18ad   593527:	74 08                	je     593531 <shrink_lruvec+0x18b7>
18af   593529:	4c 89 ff             	mov    %r15,%rdi
18b2   59352c:	e8 00 00 00 00       	call   593531 <shrink_lruvec+0x18b7>	59352d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
18b7   593531:	4d 8b 27             	mov    (%r15),%r12
18ba   593534:	4d 8d 74 24 08       	lea    0x8(%r12),%r14
18bf   593539:	4c 89 f0             	mov    %r14,%rax
18c2   59353c:	48 c1 e8 03          	shr    $0x3,%rax
18c6   593540:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
18d0   59354a:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
18d4   59354e:	74 08                	je     593558 <shrink_lruvec+0x18de>
18d6   593550:	4c 89 f7             	mov    %r14,%rdi
18d9   593553:	e8 00 00 00 00       	call   593558 <shrink_lruvec+0x18de>	593554: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
18de   593558:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
18e3   59355d:	49 89 1e             	mov    %rbx,(%r14)
18e6   593560:	48 89 d8             	mov    %rbx,%rax
18e9   593563:	48 c1 e8 03          	shr    $0x3,%rax
18ed   593567:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
18f7   593571:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
18fb   593575:	74 08                	je     59357f <shrink_lruvec+0x1905>
18fd   593577:	48 89 df             	mov    %rbx,%rdi
1900   59357a:	e8 00 00 00 00       	call   59357f <shrink_lruvec+0x1905>	59357b: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
1905   59357f:	4c 89 23             	mov    %r12,(%rbx)
1908   593582:	4c 8d 73 08          	lea    0x8(%rbx),%r14
190c   593586:	4c 89 f0             	mov    %r14,%rax
190f   593589:	48 c1 e8 03          	shr    $0x3,%rax
1913   59358d:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
191d   593597:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
1921   59359b:	74 08                	je     5935a5 <shrink_lruvec+0x192b>
1923   59359d:	4c 89 f7             	mov    %r14,%rdi
1926   5935a0:	e8 00 00 00 00       	call   5935a5 <shrink_lruvec+0x192b>	5935a1: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
192b   5935a5:	4d 89 3e             	mov    %r15,(%r14)
192e   5935a8:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
1938   5935b2:	41 80 7c 05 00 00    	cmpb   $0x0,0x0(%r13,%rax,1)
193e   5935b8:	74 08                	je     5935c2 <shrink_lruvec+0x1948>
1940   5935ba:	4c 89 ff             	mov    %r15,%rdi
1943   5935bd:	e8 00 00 00 00       	call   5935c2 <shrink_lruvec+0x1948>	5935be: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
1948   5935c2:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
194d   5935c7:	49 89 07             	mov    %rax,(%r15)
1950   5935ca:	4c 8b 7c 24 28       	mov    0x28(%rsp),%r15
1955   5935cf:	44 8b 6c 24 40       	mov    0x40(%rsp),%r13d
195a   5935d4:	48 63 44 24 58       	movslq 0x58(%rsp),%rax
195f   5935d9:	65 48 01 05 00 00 00 00 	add    %rax,%gs:0x0(%rip)        # 5935e1 <shrink_lruvec+0x1967>	5935dd: R_X86_64_PC32	vm_event_states+0x21c
1967   5935e1:	e9 0a 05 00 00       	jmp    593af0 <shrink_lruvec+0x1e76>
196c   5935e6:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
1976   5935f0:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
197b   5935f5:	41 80 3c 04 00       	cmpb   $0x0,(%r12,%rax,1)
1980   5935fa:	74 08                	je     593604 <shrink_lruvec+0x198a>
1982   5935fc:	4c 89 ef             	mov    %r13,%rdi
1985   5935ff:	e8 00 00 00 00       	call   593604 <shrink_lruvec+0x198a>	593600: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
198a   593604:	49 8b 5d 00          	mov    0x0(%r13),%rbx
198e   593608:	49 be 00 00 00 00 80 03 00 00 	movabs $0x38000000000,%r14
1998   593612:	4c 89 f6             	mov    %r14,%rsi
199b   593615:	48 21 de             	and    %rbx,%rsi
199e   593618:	31 ff                	xor    %edi,%edi
19a0   59361a:	e8 00 00 00 00       	call   59361f <shrink_lruvec+0x19a5>	59361b: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
19a5   59361f:	4c 21 f3             	and    %r14,%rbx
19a8   593622:	49 bf ff ff ff ff 7f fc ff ff 	movabs $0xfffffc7fffffffff,%r15
19b2   59362c:	75 14                	jne    593642 <shrink_lruvec+0x19c8>
19b4   59362e:	e8 00 00 00 00       	call   593633 <shrink_lruvec+0x19b9>	59362f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
19b9   593633:	4c 8b 74 24 18       	mov    0x18(%rsp),%r14
19be   593638:	e9 6c 01 00 00       	jmp    5937a9 <shrink_lruvec+0x1b2f>
19c3   59363d:	e8 00 00 00 00       	call   593642 <shrink_lruvec+0x19c8>	59363e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
19c8   593642:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
19d2   59364c:	41 80 3c 04 00       	cmpb   $0x0,(%r12,%rax,1)
19d7   593651:	74 08                	je     59365b <shrink_lruvec+0x19e1>
19d9   593653:	4c 89 ef             	mov    %r13,%rdi
19dc   593656:	e8 00 00 00 00       	call   59365b <shrink_lruvec+0x19e1>	593657: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
19e1   59365b:	4d 8b 75 00          	mov    0x0(%r13),%r14
19e5   59365f:	4c 89 f3             	mov    %r14,%rbx
19e8   593662:	4c 21 fb             	and    %r15,%rbx
19eb   593665:	4c 89 ef             	mov    %r13,%rdi
19ee   593668:	be 08 00 00 00       	mov    $0x8,%esi
19f3   59366d:	e8 00 00 00 00       	call   593672 <shrink_lruvec+0x19f8>	59366e: R_X86_64_PLT32	__kasan_check_write-0x4
19f8   593672:	4c 89 f0             	mov    %r14,%rax
19fb   593675:	f0 49 0f b1 5d 00    	lock cmpxchg %rbx,0x0(%r13)
1a01   59367b:	4c 39 f0             	cmp    %r14,%rax
1a04   59367e:	75 bd                	jne    59363d <shrink_lruvec+0x19c3>
1a06   593680:	e8 00 00 00 00       	call   593685 <shrink_lruvec+0x1a0b>	593681: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1a0b   593685:	49 c1 ee 27          	shr    $0x27,%r14
1a0f   593689:	41 83 e6 07          	and    $0x7,%r14d
1a13   59368d:	41 ff ce             	dec    %r14d
1a16   593690:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
1a1b   593695:	4c 89 ee             	mov    %r13,%rsi
1a1e   593698:	44 89 f2             	mov    %r14d,%edx
1a21   59369b:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
1a26   5936a0:	e8 4a 37 ff ff       	call   586def <lru_gen_update_size>
1a2b   5936a5:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
1a30   5936aa:	4c 8d 73 08          	lea    0x8(%rbx),%r14
1a34   5936ae:	4d 89 f4             	mov    %r14,%r12
1a37   5936b1:	49 c1 ec 03          	shr    $0x3,%r12
1a3b   5936b5:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
1a45   5936bf:	41 80 3c 04 00       	cmpb   $0x0,(%r12,%rax,1)
1a4a   5936c4:	74 08                	je     5936ce <shrink_lruvec+0x1a54>
1a4c   5936c6:	4c 89 f7             	mov    %r14,%rdi
1a4f   5936c9:	e8 00 00 00 00       	call   5936ce <shrink_lruvec+0x1a54>	5936ca: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1a54   5936ce:	4c 89 34 24          	mov    %r14,(%rsp)
1a58   5936d2:	4c 8b 7b 08          	mov    0x8(%rbx),%r15
1a5c   5936d6:	49 89 de             	mov    %rbx,%r14
1a5f   5936d9:	49 c1 ee 03          	shr    $0x3,%r14
1a63   5936dd:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
1a6d   5936e7:	41 80 3c 06 00       	cmpb   $0x0,(%r14,%rax,1)
1a72   5936ec:	74 08                	je     5936f6 <shrink_lruvec+0x1a7c>
1a74   5936ee:	48 89 df             	mov    %rbx,%rdi
1a77   5936f1:	e8 00 00 00 00       	call   5936f6 <shrink_lruvec+0x1a7c>	5936f2: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1a7c   5936f6:	48 8b 03             	mov    (%rbx),%rax
1a7f   5936f9:	48 89 44 24 58       	mov    %rax,0x58(%rsp)
1a84   5936fe:	48 8d 58 08          	lea    0x8(%rax),%rbx
1a88   593702:	48 89 d8             	mov    %rbx,%rax
1a8b   593705:	48 c1 e8 03          	shr    $0x3,%rax
1a8f   593709:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
1a99   593713:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
1a9d   593717:	74 08                	je     593721 <shrink_lruvec+0x1aa7>
1a9f   593719:	48 89 df             	mov    %rbx,%rdi
1aa2   59371c:	e8 00 00 00 00       	call   593721 <shrink_lruvec+0x1aa7>	59371d: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
1aa7   593721:	4c 89 3b             	mov    %r15,(%rbx)
1aaa   593724:	4c 89 f8             	mov    %r15,%rax
1aad   593727:	48 c1 e8 03          	shr    $0x3,%rax
1ab1   59372b:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
1abb   593735:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
1abf   593739:	74 08                	je     593743 <shrink_lruvec+0x1ac9>
1ac1   59373b:	4c 89 ff             	mov    %r15,%rdi
1ac4   59373e:	e8 00 00 00 00       	call   593743 <shrink_lruvec+0x1ac9>	59373f: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
1ac9   593743:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
1ace   593748:	49 89 07             	mov    %rax,(%r15)
1ad1   59374b:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
1adb   593755:	41 80 3c 06 00       	cmpb   $0x0,(%r14,%rax,1)
1ae0   59375a:	4c 8b 74 24 18       	mov    0x18(%rsp),%r14
1ae5   59375f:	74 08                	je     593769 <shrink_lruvec+0x1aef>
1ae7   593761:	4c 89 f7             	mov    %r14,%rdi
1aea   593764:	e8 00 00 00 00       	call   593769 <shrink_lruvec+0x1aef>	593765: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
1aef   593769:	48 b8 00 01 00 00 00 00 ad de 	movabs $0xdead000000000100,%rax
1af9   593773:	49 89 06             	mov    %rax,(%r14)
1afc   593776:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
1b06   593780:	41 80 3c 04 00       	cmpb   $0x0,(%r12,%rax,1)
1b0b   593785:	48 8b 1c 24          	mov    (%rsp),%rbx
1b0f   593789:	74 08                	je     593793 <shrink_lruvec+0x1b19>
1b11   59378b:	48 89 df             	mov    %rbx,%rdi
1b14   59378e:	e8 00 00 00 00       	call   593793 <shrink_lruvec+0x1b19>	59378f: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
1b19   593793:	48 b8 00 01 00 00 00 00 ad de 	movabs $0xdead000000000100,%rax
1b23   59379d:	48 83 c0 22          	add    $0x22,%rax
1b27   5937a1:	48 89 03             	mov    %rax,(%rbx)
1b2a   5937a4:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
1b2f   5937a9:	4c 89 ef             	mov    %r13,%rdi
1b32   5937ac:	be 08 00 00 00       	mov    $0x8,%esi
1b37   5937b1:	e8 00 00 00 00       	call   5937b6 <shrink_lruvec+0x1b3c>	5937b2: R_X86_64_PLT32	__kasan_check_write-0x4
1b3c   5937b6:	f0 41 80 4e fa 08    	lock orb $0x8,-0x6(%r14)
1b42   5937bc:	4c 89 ef             	mov    %r13,%rdi
1b45   5937bf:	be 08 00 00 00       	mov    $0x8,%esi
1b4a   5937c4:	e8 00 00 00 00       	call   5937c9 <shrink_lruvec+0x1b4f>	5937c5: R_X86_64_PLT32	__kasan_check_read-0x4
1b4f   5937c9:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
1b59   5937d3:	41 80 3c 04 00       	cmpb   $0x0,(%r12,%rax,1)
1b5e   5937d8:	74 08                	je     5937e2 <shrink_lruvec+0x1b68>
1b60   5937da:	4c 89 ef             	mov    %r13,%rdi
1b63   5937dd:	e8 00 00 00 00       	call   5937e2 <shrink_lruvec+0x1b68>	5937de: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1b68   5937e2:	49 8b 5d 00          	mov    0x0(%r13),%rbx
1b6c   5937e6:	be 00 00 10 00       	mov    $0x100000,%esi
1b71   5937eb:	48 21 de             	and    %rbx,%rsi
1b74   5937ee:	31 ff                	xor    %edi,%edi
1b76   5937f0:	e8 00 00 00 00       	call   5937f5 <shrink_lruvec+0x1b7b>	5937f1: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
1b7b   5937f5:	b8 00 00 10 00       	mov    $0x100000,%eax
1b80   5937fa:	48 21 c3             	and    %rax,%rbx
1b83   5937fd:	75 7a                	jne    593879 <shrink_lruvec+0x1bff>
1b85   5937ff:	e8 00 00 00 00       	call   593804 <shrink_lruvec+0x1b8a>	593800: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1b8a   593804:	4c 89 ef             	mov    %r13,%rdi
1b8d   593807:	be 08 00 00 00       	mov    $0x8,%esi
1b92   59380c:	e8 00 00 00 00       	call   593811 <shrink_lruvec+0x1b97>	59380d: R_X86_64_PLT32	__kasan_check_read-0x4
1b97   593811:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
1ba1   59381b:	41 80 3c 04 00       	cmpb   $0x0,(%r12,%rax,1)
1ba6   593820:	74 08                	je     59382a <shrink_lruvec+0x1bb0>
1ba8   593822:	4c 89 ef             	mov    %r13,%rdi
1bab   593825:	e8 00 00 00 00       	call   59382a <shrink_lruvec+0x1bb0>	593826: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1bb0   59382a:	49 8b 5d 00          	mov    0x0(%r13),%rbx
1bb4   59382e:	c1 eb 12             	shr    $0x12,%ebx
1bb7   593831:	83 e3 02             	and    $0x2,%ebx
1bba   593834:	4c 89 ef             	mov    %r13,%rdi
1bbd   593837:	be 08 00 00 00       	mov    $0x8,%esi
1bc2   59383c:	e8 00 00 00 00       	call   593841 <shrink_lruvec+0x1bc7>	59383d: R_X86_64_PLT32	__kasan_check_read-0x4
1bc7   593841:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
1bd1   59384b:	41 80 3c 04 00       	cmpb   $0x0,(%r12,%rax,1)
1bd6   593850:	74 08                	je     59385a <shrink_lruvec+0x1be0>
1bd8   593852:	4c 89 ef             	mov    %r13,%rdi
1bdb   593855:	e8 00 00 00 00       	call   59385a <shrink_lruvec+0x1be0>	593856: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1be0   59385a:	4d 8b 7d 00          	mov    0x0(%r13),%r15
1be4   59385e:	41 c1 ef 05          	shr    $0x5,%r15d
1be8   593862:	41 83 e7 01          	and    $0x1,%r15d
1bec   593866:	41 09 df             	or     %ebx,%r15d
1bef   593869:	41 83 f7 02          	xor    $0x2,%r15d
1bf3   59386d:	eb 15                	jmp    593884 <shrink_lruvec+0x1c0a>
1bf5   59386f:	e8 00 00 00 00       	call   593874 <shrink_lruvec+0x1bfa>	593870: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1bfa   593874:	e9 b3 00 00 00       	jmp    59392c <shrink_lruvec+0x1cb2>
1bff   593879:	e8 00 00 00 00       	call   59387e <shrink_lruvec+0x1c04>	59387a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1c04   59387e:	41 bf 04 00 00 00    	mov    $0x4,%r15d
1c0a   593884:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
1c0f   593889:	4c 89 ee             	mov    %r13,%rsi
1c12   59388c:	ba 01 00 00 00       	mov    $0x1,%edx
1c17   593891:	e8 94 bb ff ff       	call   58f42a <lru_gen_add_folio>
1c1c   593896:	84 c0                	test   %al,%al
1c1e   593898:	74 0f                	je     5938a9 <shrink_lruvec+0x1c2f>
1c20   59389a:	e8 00 00 00 00       	call   59389f <shrink_lruvec+0x1c25>	59389b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1c25   59389f:	44 8b 6c 24 40       	mov    0x40(%rsp),%r13d
1c2a   5938a4:	e9 42 02 00 00       	jmp    593aeb <shrink_lruvec+0x1e71>
1c2f   5938a9:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
1c39   5938b3:	41 80 3c 04 00       	cmpb   $0x0,(%r12,%rax,1)
1c3e   5938b8:	74 08                	je     5938c2 <shrink_lruvec+0x1c48>
1c40   5938ba:	4c 89 ef             	mov    %r13,%rdi
1c43   5938bd:	e8 00 00 00 00       	call   5938c2 <shrink_lruvec+0x1c48>	5938be: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1c48   5938c2:	45 0f b6 65 07       	movzbl 0x7(%r13),%r12d
1c4d   5938c7:	4c 89 ef             	mov    %r13,%rdi
1c50   5938ca:	be 08 00 00 00       	mov    $0x8,%esi
1c55   5938cf:	e8 00 00 00 00       	call   5938d4 <shrink_lruvec+0x1c5a>	5938d0: R_X86_64_PLT32	__kasan_check_read-0x4
1c5a   5938d4:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
1c64   5938de:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
1c69   5938e3:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
1c6d   5938e7:	74 08                	je     5938f1 <shrink_lruvec+0x1c77>
1c6f   5938e9:	4c 89 ef             	mov    %r13,%rdi
1c72   5938ec:	e8 00 00 00 00       	call   5938f1 <shrink_lruvec+0x1c77>	5938ed: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1c77   5938f1:	49 8b 5d 00          	mov    0x0(%r13),%rbx
1c7b   5938f5:	be 00 00 01 00       	mov    $0x10000,%esi
1c80   5938fa:	48 21 de             	and    %rbx,%rsi
1c83   5938fd:	31 ff                	xor    %edi,%edi
1c85   5938ff:	e8 00 00 00 00       	call   593904 <shrink_lruvec+0x1c8a>	593900: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
1c8a   593904:	b8 00 00 01 00       	mov    $0x10000,%eax
1c8f   593909:	48 21 c3             	and    %rax,%rbx
1c92   59390c:	0f 85 44 02 00 00    	jne    593b56 <shrink_lruvec+0x1edc>
1c98   593912:	e8 00 00 00 00       	call   593917 <shrink_lruvec+0x1c9d>	593913: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1c9d   593917:	41 be 01 00 00 00    	mov    $0x1,%r14d
1ca3   59391d:	44 8b 6c 24 40       	mov    0x40(%rsp),%r13d
1ca8   593922:	e9 5c 02 00 00       	jmp    593b83 <shrink_lruvec+0x1f09>
1cad   593927:	e8 00 00 00 00       	call   59392c <shrink_lruvec+0x1cb2>	593928: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1cb2   59392c:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
1cb7   593931:	4c 89 ee             	mov    %r13,%rsi
1cba   593934:	ba 01 00 00 00       	mov    $0x1,%edx
1cbf   593939:	e8 f3 a7 00 00       	call   59e131 <folio_inc_gen>
1cc4   59393e:	41 89 c7             	mov    %eax,%r15d
1cc7   593941:	bf 04 00 00 00       	mov    $0x4,%edi
1ccc   593946:	89 c6                	mov    %eax,%esi
1cce   593948:	e8 00 00 00 00       	call   59394d <shrink_lruvec+0x1cd3>	593949: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
1cd3   59394d:	41 83 ff 03          	cmp    $0x3,%r15d
1cd7   593951:	0f 87 b7 0d 00 00    	ja     59470e <shrink_lruvec+0x2a94>
1cdd   593957:	e8 00 00 00 00       	call   59395c <shrink_lruvec+0x1ce2>	593958: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1ce2   59395c:	49 8d 5e 08          	lea    0x8(%r14),%rbx
1ce6   593960:	48 89 d9             	mov    %rbx,%rcx
1ce9   593963:	48 c1 e9 03          	shr    $0x3,%rcx
1ced   593967:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
1cf7   593971:	48 89 4c 24 58       	mov    %rcx,0x58(%rsp)
1cfc   593976:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
1d00   59397a:	74 08                	je     593984 <shrink_lruvec+0x1d0a>
1d02   59397c:	48 89 df             	mov    %rbx,%rdi
1d05   59397f:	e8 00 00 00 00       	call   593984 <shrink_lruvec+0x1d0a>	593980: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1d0a   593984:	48 89 5c 24 08       	mov    %rbx,0x8(%rsp)
1d0f   593989:	49 63 df             	movslq %r15d,%rbx
1d12   59398c:	48 c1 e3 07          	shl    $0x7,%rbx
1d16   593990:	4d 8b 66 08          	mov    0x8(%r14),%r12
1d1a   593994:	4c 89 f1             	mov    %r14,%rcx
1d1d   593997:	48 c1 e9 03          	shr    $0x3,%rcx
1d21   59399b:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
1d2b   5939a5:	48 89 8c 24 d0 00 00 00 	mov    %rcx,0xd0(%rsp)
1d33   5939ad:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
1d37   5939b1:	74 08                	je     5939bb <shrink_lruvec+0x1d41>
1d39   5939b3:	4c 89 f7             	mov    %r14,%rdi
1d3c   5939b6:	e8 00 00 00 00       	call   5939bb <shrink_lruvec+0x1d41>	5939b7: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1d41   5939bb:	48 03 5c 24 10       	add    0x10(%rsp),%rbx
1d46   5939c0:	48 8b 94 24 b8 00 00 00 	mov    0xb8(%rsp),%rdx
1d4e   5939c8:	48 c1 e2 06          	shl    $0x6,%rdx
1d52   5939cc:	4d 8b 2e             	mov    (%r14),%r13
1d55   5939cf:	4d 8d 7d 08          	lea    0x8(%r13),%r15
1d59   5939d3:	4c 89 f8             	mov    %r15,%rax
1d5c   5939d6:	48 c1 e8 03          	shr    $0x3,%rax
1d60   5939da:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
1d6a   5939e4:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
1d6e   5939e8:	74 0e                	je     5939f8 <shrink_lruvec+0x1d7e>
1d70   5939ea:	4c 89 ff             	mov    %r15,%rdi
1d73   5939ed:	49 89 d6             	mov    %rdx,%r14
1d76   5939f0:	e8 00 00 00 00       	call   5939f5 <shrink_lruvec+0x1d7b>	5939f1: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
1d7b   5939f5:	4c 89 f2             	mov    %r14,%rdx
1d7e   5939f8:	44 8b 34 24          	mov    (%rsp),%r14d
1d82   5939fc:	48 01 d3             	add    %rdx,%rbx
1d85   5939ff:	49 c1 e6 04          	shl    $0x4,%r14
1d89   593a03:	4d 89 27             	mov    %r12,(%r15)
1d8c   593a06:	4c 89 e0             	mov    %r12,%rax
1d8f   593a09:	48 c1 e8 03          	shr    $0x3,%rax
1d93   593a0d:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
1d9d   593a17:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
1da1   593a1b:	74 08                	je     593a25 <shrink_lruvec+0x1dab>
1da3   593a1d:	4c 89 e7             	mov    %r12,%rdi
1da6   593a20:	e8 00 00 00 00       	call   593a25 <shrink_lruvec+0x1dab>	593a21: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
1dab   593a25:	4d 8d 3c 1e          	lea    (%r14,%rbx,1),%r15
1daf   593a29:	49 81 c7 d8 00 00 00 	add    $0xd8,%r15
1db6   593a30:	4d 89 2c 24          	mov    %r13,(%r12)
1dba   593a34:	4d 89 fc             	mov    %r15,%r12
1dbd   593a37:	49 c1 ec 03          	shr    $0x3,%r12
1dc1   593a3b:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
1dcb   593a45:	41 80 3c 04 00       	cmpb   $0x0,(%r12,%rax,1)
1dd0   593a4a:	74 08                	je     593a54 <shrink_lruvec+0x1dda>
1dd2   593a4c:	4c 89 ff             	mov    %r15,%rdi
1dd5   593a4f:	e8 00 00 00 00       	call   593a54 <shrink_lruvec+0x1dda>	593a50: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1dda   593a54:	4d 8b 2f             	mov    (%r15),%r13
1ddd   593a57:	49 8d 5d 08          	lea    0x8(%r13),%rbx
1de1   593a5b:	48 89 d8             	mov    %rbx,%rax
1de4   593a5e:	48 c1 e8 03          	shr    $0x3,%rax
1de8   593a62:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
1df2   593a6c:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
1df6   593a70:	4c 8b 74 24 18       	mov    0x18(%rsp),%r14
1dfb   593a75:	74 08                	je     593a7f <shrink_lruvec+0x1e05>
1dfd   593a77:	48 89 df             	mov    %rbx,%rdi
1e00   593a7a:	e8 00 00 00 00       	call   593a7f <shrink_lruvec+0x1e05>	593a7b: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
1e05   593a7f:	4c 89 33             	mov    %r14,(%rbx)
1e08   593a82:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
1e12   593a8c:	48 8b 8c 24 d0 00 00 00 	mov    0xd0(%rsp),%rcx
1e1a   593a94:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
1e1e   593a98:	74 08                	je     593aa2 <shrink_lruvec+0x1e28>
1e20   593a9a:	4c 89 f7             	mov    %r14,%rdi
1e23   593a9d:	e8 00 00 00 00       	call   593aa2 <shrink_lruvec+0x1e28>	593a9e: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
1e28   593aa2:	4d 89 2e             	mov    %r13,(%r14)
1e2b   593aa5:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
1e35   593aaf:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
1e3a   593ab4:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
1e3e   593ab8:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
1e43   593abd:	74 08                	je     593ac7 <shrink_lruvec+0x1e4d>
1e45   593abf:	48 89 df             	mov    %rbx,%rdi
1e48   593ac2:	e8 00 00 00 00       	call   593ac7 <shrink_lruvec+0x1e4d>	593ac3: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
1e4d   593ac7:	4c 89 3b             	mov    %r15,(%rbx)
1e50   593aca:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
1e5a   593ad4:	41 80 3c 04 00       	cmpb   $0x0,(%r12,%rax,1)
1e5f   593ad9:	44 8b 6c 24 40       	mov    0x40(%rsp),%r13d
1e64   593ade:	74 08                	je     593ae8 <shrink_lruvec+0x1e6e>
1e66   593ae0:	4c 89 ff             	mov    %r15,%rdi
1e69   593ae3:	e8 00 00 00 00       	call   593ae8 <shrink_lruvec+0x1e6e>	593ae4: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
1e6e   593ae8:	4d 89 37             	mov    %r14,(%r15)
1e71   593aeb:	4c 8b 7c 24 28       	mov    0x28(%rsp),%r15
1e76   593af0:	8b 44 24 38          	mov    0x38(%rsp),%eax
1e7a   593af4:	8b 4c 24 20          	mov    0x20(%rsp),%ecx
1e7e   593af8:	01 c8                	add    %ecx,%eax
1e80   593afa:	89 44 24 38          	mov    %eax,0x38(%rsp)
1e84   593afe:	41 01 cd             	add    %ecx,%r13d
1e87   593b01:	41 8d 77 ff          	lea    -0x1(%r15),%esi
1e8b   593b05:	31 ff                	xor    %edi,%edi
1e8d   593b07:	e8 00 00 00 00       	call   593b0c <shrink_lruvec+0x1e92>	593b08: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
1e92   593b0c:	44 8b 74 24 48       	mov    0x48(%rsp),%r14d
1e97   593b11:	44 89 f7             	mov    %r14d,%edi
1e9a   593b14:	8b 5c 24 78          	mov    0x78(%rsp),%ebx
1e9e   593b18:	89 de                	mov    %ebx,%esi
1ea0   593b1a:	e8 00 00 00 00       	call   593b1f <shrink_lruvec+0x1ea5>	593b1b: R_X86_64_PLT32	__sanitizer_cov_trace_cmp4-0x4
1ea5   593b1f:	41 39 de             	cmp    %ebx,%r14d
1ea8   593b22:	41 0f 4f de          	cmovg  %r14d,%ebx
1eac   593b26:	bf 40 00 00 00       	mov    $0x40,%edi
1eb1   593b2b:	89 de                	mov    %ebx,%esi
1eb3   593b2d:	e8 00 00 00 00       	call   593b32 <shrink_lruvec+0x1eb8>	593b2e: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
1eb8   593b32:	41 ff cf             	dec    %r15d
1ebb   593b35:	0f 84 56 0c 00 00    	je     594791 <shrink_lruvec+0x2b17>
1ec1   593b3b:	83 fb 40             	cmp    $0x40,%ebx
1ec4   593b3e:	0f 8d 4d 0c 00 00    	jge    594791 <shrink_lruvec+0x2b17>
1eca   593b44:	e8 00 00 00 00       	call   593b49 <shrink_lruvec+0x1ecf>	593b45: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1ecf   593b49:	48 8b 9c 24 e0 00 00 00 	mov    0xe0(%rsp),%rbx
1ed7   593b51:	e9 7d ec ff ff       	jmp    5927d3 <shrink_lruvec+0xb59>
1edc   593b56:	e8 00 00 00 00       	call   593b5b <shrink_lruvec+0x1ee1>	593b57: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1ee1   593b5b:	49 83 c6 54          	add    $0x54,%r14
1ee5   593b5f:	4c 89 f0             	mov    %r14,%rax
1ee8   593b62:	48 c1 e8 03          	shr    $0x3,%rax
1eec   593b66:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
1ef6   593b70:	8a 04 08             	mov    (%rax,%rcx,1),%al
1ef9   593b73:	84 c0                	test   %al,%al
1efb   593b75:	44 8b 6c 24 40       	mov    0x40(%rsp),%r13d
1f00   593b7a:	0f 85 b5 0a 00 00    	jne    594635 <shrink_lruvec+0x29bb>
1f06   593b80:	45 8b 36             	mov    (%r14),%r14d
1f09   593b83:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
1f13   593b8d:	48 8b 8c 24 80 00 00 00 	mov    0x80(%rsp),%rcx
1f1b   593b95:	8a 04 01             	mov    (%rcx,%rax,1),%al
1f1e   593b98:	84 c0                	test   %al,%al
1f20   593b9a:	0f 85 2d 0a 00 00    	jne    5945cd <shrink_lruvec+0x2953>
1f26   593ba0:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 593ba6 <shrink_lruvec+0x1f2c>	593ba2: R_X86_64_PC32	debug_locks-0x4
1f2c   593ba6:	31 ff                	xor    %edi,%edi
1f2e   593ba8:	89 de                	mov    %ebx,%esi
1f30   593baa:	e8 00 00 00 00       	call   593baf <shrink_lruvec+0x1f35>	593bab: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
1f35   593baf:	85 db                	test   %ebx,%ebx
1f37   593bb1:	0f 84 88 00 00 00    	je     593c3f <shrink_lruvec+0x1fc5>
1f3d   593bb7:	48 8b bc 24 88 01 00 00 	mov    0x188(%rsp),%rdi
1f45   593bbf:	be ff ff ff ff       	mov    $0xffffffff,%esi
1f4a   593bc4:	e8 00 00 00 00       	call   593bc9 <shrink_lruvec+0x1f4f>	593bc5: R_X86_64_PLT32	lock_is_held_type-0x4
1f4f   593bc9:	89 c3                	mov    %eax,%ebx
1f51   593bcb:	31 ff                	xor    %edi,%edi
1f53   593bcd:	89 c6                	mov    %eax,%esi
1f55   593bcf:	e8 00 00 00 00       	call   593bd4 <shrink_lruvec+0x1f5a>	593bd0: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
1f5a   593bd4:	85 db                	test   %ebx,%ebx
1f5c   593bd6:	0f 84 5d 09 00 00    	je     594539 <shrink_lruvec+0x28bf>
1f62   593bdc:	e8 00 00 00 00       	call   593be1 <shrink_lruvec+0x1f67>	593bdd: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1f67   593be1:	eb 61                	jmp    593c44 <shrink_lruvec+0x1fca>
1f69   593be3:	e8 00 00 00 00       	call   593be8 <shrink_lruvec+0x1f6e>	593be4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1f6e   593be8:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
1f78   593bf2:	48 8b 8c 24 f8 01 00 00 	mov    0x1f8(%rsp),%rcx
1f80   593bfa:	8a 04 01             	mov    (%rcx,%rax,1),%al
1f83   593bfd:	84 c0                	test   %al,%al
1f85   593bff:	48 8b 94 24 90 00 00 00 	mov    0x90(%rsp),%rdx
1f8d   593c07:	0f 85 ff 09 00 00    	jne    59460c <shrink_lruvec+0x2992>
1f93   593c0d:	0f b7 1a             	movzwl (%rdx),%ebx
1f96   593c10:	89 de                	mov    %ebx,%esi
1f98   593c12:	83 e6 20             	and    $0x20,%esi
1f9b   593c15:	31 ff                	xor    %edi,%edi
1f9d   593c17:	e8 00 00 00 00       	call   593c1c <shrink_lruvec+0x1fa2>	593c18: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp2-0x4
1fa2   593c1c:	83 e3 20             	and    $0x20,%ebx
1fa5   593c1f:	0f 85 45 01 00 00    	jne    593d6a <shrink_lruvec+0x20f0>
1fab   593c25:	4c 89 ef             	mov    %r13,%rdi
1fae   593c28:	e8 00 00 00 00       	call   593c2d <shrink_lruvec+0x1fb3>	593c29: R_X86_64_PLT32	folio_mapped-0x4
1fb3   593c2d:	84 c0                	test   %al,%al
1fb5   593c2f:	0f 84 46 01 00 00    	je     593d7b <shrink_lruvec+0x2101>
1fbb   593c35:	e8 00 00 00 00       	call   593c3a <shrink_lruvec+0x1fc0>	593c36: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1fc0   593c3a:	e9 76 06 00 00       	jmp    5942b5 <shrink_lruvec+0x263b>
1fc5   593c3f:	e8 00 00 00 00       	call   593c44 <shrink_lruvec+0x1fca>	593c40: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1fca   593c44:	41 83 e4 03          	and    $0x3,%r12d
1fce   593c48:	bf 00 00 00 80       	mov    $0x80000000,%edi
1fd3   593c4d:	4c 89 f6             	mov    %r14,%rsi
1fd6   593c50:	e8 00 00 00 00       	call   593c55 <shrink_lruvec+0x1fdb>	593c51: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
1fdb   593c55:	b8 00 00 00 80       	mov    $0x80000000,%eax
1fe0   593c5a:	49 39 c6             	cmp    %rax,%r14
1fe3   593c5d:	0f 83 ca 08 00 00    	jae    59452d <shrink_lruvec+0x28b3>
1fe9   593c63:	e8 00 00 00 00       	call   593c68 <shrink_lruvec+0x1fee>	593c64: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1fee   593c68:	49 63 d6             	movslq %r14d,%rdx
1ff1   593c6b:	48 8b 9c 24 88 00 00 00 	mov    0x88(%rsp),%rbx
1ff9   593c73:	48 89 df             	mov    %rbx,%rdi
1ffc   593c76:	44 89 fe             	mov    %r15d,%esi
1fff   593c79:	e8 00 00 00 00       	call   593c7e <shrink_lruvec+0x2004>	593c7a: R_X86_64_PLT32	__mod_node_page_state-0x4
2004   593c7e:	49 69 fc c0 06 00 00 	imul   $0x6c0,%r12,%rdi
200b   593c85:	48 01 df             	add    %rbx,%rdi
200e   593c88:	41 8d 77 01          	lea    0x1(%r15),%esi
2012   593c8c:	4c 89 f2             	mov    %r14,%rdx
2015   593c8f:	e8 00 00 00 00       	call   593c94 <shrink_lruvec+0x201a>	593c90: R_X86_64_PLT32	__mod_zone_page_state-0x4
201a   593c94:	45 89 ff             	mov    %r15d,%r15d
201d   593c97:	49 c1 e7 04          	shl    $0x4,%r15
2021   593c9b:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
2026   593ca0:	4e 8d 24 38          	lea    (%rax,%r15,1),%r12
202a   593ca4:	49 83 c4 08          	add    $0x8,%r12
202e   593ca8:	4c 89 e3             	mov    %r12,%rbx
2031   593cab:	48 c1 eb 03          	shr    $0x3,%rbx
2035   593caf:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
203f   593cb9:	80 3c 03 00          	cmpb   $0x0,(%rbx,%rax,1)
2043   593cbd:	74 08                	je     593cc7 <shrink_lruvec+0x204d>
2045   593cbf:	4c 89 e7             	mov    %r12,%rdi
2048   593cc2:	e8 00 00 00 00       	call   593cc7 <shrink_lruvec+0x204d>	593cc3: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
204d   593cc7:	4d 8b 34 24          	mov    (%r12),%r14
2051   593ccb:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
205b   593cd5:	80 3c 03 00          	cmpb   $0x0,(%rbx,%rax,1)
205f   593cd9:	74 08                	je     593ce3 <shrink_lruvec+0x2069>
2061   593cdb:	4c 89 e7             	mov    %r12,%rdi
2064   593cde:	e8 00 00 00 00       	call   593ce3 <shrink_lruvec+0x2069>	593cdf: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
2069   593ce3:	4c 03 7c 24 10       	add    0x10(%rsp),%r15
206e   593ce8:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
2073   593ced:	49 89 1c 24          	mov    %rbx,(%r12)
2077   593cf1:	48 89 d8             	mov    %rbx,%rax
207a   593cf4:	48 c1 e8 03          	shr    $0x3,%rax
207e   593cf8:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
2088   593d02:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
208c   593d06:	74 08                	je     593d10 <shrink_lruvec+0x2096>
208e   593d08:	48 89 df             	mov    %rbx,%rdi
2091   593d0b:	e8 00 00 00 00       	call   593d10 <shrink_lruvec+0x2096>	593d0c: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
2096   593d10:	4c 89 3b             	mov    %r15,(%rbx)
2099   593d13:	48 83 c3 08          	add    $0x8,%rbx
209d   593d17:	48 89 d8             	mov    %rbx,%rax
20a0   593d1a:	48 c1 e8 03          	shr    $0x3,%rax
20a4   593d1e:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
20ae   593d28:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
20b2   593d2c:	74 08                	je     593d36 <shrink_lruvec+0x20bc>
20b4   593d2e:	48 89 df             	mov    %rbx,%rdi
20b7   593d31:	e8 00 00 00 00       	call   593d36 <shrink_lruvec+0x20bc>	593d32: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
20bc   593d36:	4c 89 33             	mov    %r14,(%rbx)
20bf   593d39:	4c 89 f0             	mov    %r14,%rax
20c2   593d3c:	48 c1 e8 03          	shr    $0x3,%rax
20c6   593d40:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
20d0   593d4a:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
20d4   593d4e:	4c 8b 7c 24 28       	mov    0x28(%rsp),%r15
20d9   593d53:	74 08                	je     593d5d <shrink_lruvec+0x20e3>
20db   593d55:	4c 89 f7             	mov    %r14,%rdi
20de   593d58:	e8 00 00 00 00       	call   593d5d <shrink_lruvec+0x20e3>	593d59: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
20e3   593d5d:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
20e8   593d62:	49 89 06             	mov    %rax,(%r14)
20eb   593d65:	e9 86 fd ff ff       	jmp    593af0 <shrink_lruvec+0x1e76>
20f0   593d6a:	e8 00 00 00 00       	call   593d6f <shrink_lruvec+0x20f5>	593d6b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
20f5   593d6f:	eb 0f                	jmp    593d80 <shrink_lruvec+0x2106>
20f7   593d71:	e8 00 00 00 00       	call   593d76 <shrink_lruvec+0x20fc>	593d72: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
20fc   593d76:	e9 b1 fb ff ff       	jmp    59392c <shrink_lruvec+0x1cb2>
2101   593d7b:	e8 00 00 00 00       	call   593d80 <shrink_lruvec+0x2106>	593d7c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2106   593d80:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
2110   593d8a:	48 8b 8c 24 f8 01 00 00 	mov    0x1f8(%rsp),%rcx
2118   593d92:	8a 04 01             	mov    (%rcx,%rax,1),%al
211b   593d95:	84 c0                	test   %al,%al
211d   593d97:	48 8b 94 24 90 00 00 00 	mov    0x90(%rsp),%rdx
2125   593d9f:	0f 85 ae 08 00 00    	jne    594653 <shrink_lruvec+0x29d9>
212b   593da5:	0f b7 1a             	movzwl (%rdx),%ebx
212e   593da8:	89 de                	mov    %ebx,%esi
2130   593daa:	83 e6 10             	and    $0x10,%esi
2133   593dad:	31 ff                	xor    %edi,%edi
2135   593daf:	e8 00 00 00 00       	call   593db4 <shrink_lruvec+0x213a>	593db0: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp2-0x4
213a   593db4:	83 e3 10             	and    $0x10,%ebx
213d   593db7:	75 07                	jne    593dc0 <shrink_lruvec+0x2146>
213f   593db9:	e8 00 00 00 00       	call   593dbe <shrink_lruvec+0x2144>	593dba: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2144   593dbe:	eb 40                	jmp    593e00 <shrink_lruvec+0x2186>
2146   593dc0:	48 8b 9c 24 28 02 00 00 	mov    0x228(%rsp),%rbx
214e   593dc8:	48 89 d8             	mov    %rbx,%rax
2151   593dcb:	48 c1 e8 03          	shr    $0x3,%rax
2155   593dcf:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
215f   593dd9:	8a 04 08             	mov    (%rax,%rcx,1),%al
2162   593ddc:	84 c0                	test   %al,%al
2164   593dde:	0f 85 43 09 00 00    	jne    594727 <shrink_lruvec+0x2aad>
216a   593de4:	8b 1b                	mov    (%rbx),%ebx
216c   593de6:	89 de                	mov    %ebx,%esi
216e   593de8:	83 e6 40             	and    $0x40,%esi
2171   593deb:	31 ff                	xor    %edi,%edi
2173   593ded:	e8 00 00 00 00       	call   593df2 <shrink_lruvec+0x2178>	593dee: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
2178   593df2:	83 e3 40             	and    $0x40,%ebx
217b   593df5:	0f 85 93 00 00 00    	jne    593e8e <shrink_lruvec+0x2214>
2181   593dfb:	e8 00 00 00 00       	call   593e00 <shrink_lruvec+0x2186>	593dfc: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2186   593e00:	4c 89 ef             	mov    %r13,%rdi
2189   593e03:	be 08 00 00 00       	mov    $0x8,%esi
218e   593e08:	e8 00 00 00 00       	call   593e0d <shrink_lruvec+0x2193>	593e09: R_X86_64_PLT32	__kasan_check_read-0x4
2193   593e0d:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
219d   593e17:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
21a2   593e1c:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
21a6   593e20:	74 08                	je     593e2a <shrink_lruvec+0x21b0>
21a8   593e22:	4c 89 ef             	mov    %r13,%rdi
21ab   593e25:	e8 00 00 00 00       	call   593e2a <shrink_lruvec+0x21b0>	593e26: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
21b0   593e2a:	49 8b 5d 00          	mov    0x0(%r13),%rbx
21b4   593e2e:	48 89 de             	mov    %rbx,%rsi
21b7   593e31:	48 83 e6 08          	and    $0x8,%rsi
21bb   593e35:	31 ff                	xor    %edi,%edi
21bd   593e37:	e8 00 00 00 00       	call   593e3c <shrink_lruvec+0x21c2>	593e38: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
21c2   593e3c:	48 83 e3 08          	and    $0x8,%rbx
21c6   593e40:	75 42                	jne    593e84 <shrink_lruvec+0x220a>
21c8   593e42:	49 8d 5e 10          	lea    0x10(%r14),%rbx
21cc   593e46:	48 89 d8             	mov    %rbx,%rax
21cf   593e49:	48 c1 e8 03          	shr    $0x3,%rax
21d3   593e4d:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
21dd   593e57:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
21e1   593e5b:	74 08                	je     593e65 <shrink_lruvec+0x21eb>
21e3   593e5d:	48 89 df             	mov    %rbx,%rdi
21e6   593e60:	e8 00 00 00 00       	call   593e65 <shrink_lruvec+0x21eb>	593e61: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
21eb   593e65:	48 8b 1b             	mov    (%rbx),%rbx
21ee   593e68:	89 de                	mov    %ebx,%esi
21f0   593e6a:	83 e6 01             	and    $0x1,%esi
21f3   593e6d:	31 ff                	xor    %edi,%edi
21f5   593e6f:	e8 00 00 00 00       	call   593e74 <shrink_lruvec+0x21fa>	593e70: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
21fa   593e74:	f6 c3 01             	test   $0x1,%bl
21fd   593e77:	0f 85 8b 01 00 00    	jne    594008 <shrink_lruvec+0x238e>
2203   593e7d:	e8 00 00 00 00       	call   593e82 <shrink_lruvec+0x2208>	593e7e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2208   593e82:	eb 0f                	jmp    593e93 <shrink_lruvec+0x2219>
220a   593e84:	e8 00 00 00 00       	call   593e89 <shrink_lruvec+0x220f>	593e85: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
220f   593e89:	e9 27 04 00 00       	jmp    5942b5 <shrink_lruvec+0x263b>
2214   593e8e:	e8 00 00 00 00       	call   593e93 <shrink_lruvec+0x2219>	593e8f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2219   593e93:	4d 8d 7e 2c          	lea    0x2c(%r14),%r15
221d   593e97:	4c 89 ff             	mov    %r15,%rdi
2220   593e9a:	be 04 00 00 00       	mov    $0x4,%esi
2225   593e9f:	e8 00 00 00 00       	call   593ea4 <shrink_lruvec+0x222a>	593ea0: R_X86_64_PLT32	__kasan_check_write-0x4
222a   593ea4:	4c 89 f8             	mov    %r15,%rax
222d   593ea7:	48 c1 e8 03          	shr    $0x3,%rax
2231   593eab:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
223b   593eb5:	8a 04 08             	mov    (%rax,%rcx,1),%al
223e   593eb8:	84 c0                	test   %al,%al
2240   593eba:	0f 85 84 08 00 00    	jne    594744 <shrink_lruvec+0x2aca>
2246   593ec0:	41 8b 1f             	mov    (%r15),%ebx
2249   593ec3:	31 ff                	xor    %edi,%edi
224b   593ec5:	89 de                	mov    %ebx,%esi
224d   593ec7:	e8 00 00 00 00       	call   593ecc <shrink_lruvec+0x2252>	593ec8: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
2252   593ecc:	85 db                	test   %ebx,%ebx
2254   593ece:	0f 84 ab 06 00 00    	je     59457f <shrink_lruvec+0x2905>
225a   593ed4:	8d 4b 01             	lea    0x1(%rbx),%ecx
225d   593ed7:	31 f6                	xor    %esi,%esi
225f   593ed9:	89 d8                	mov    %ebx,%eax
2261   593edb:	f0 41 0f b1 0f       	lock cmpxchg %ecx,(%r15)
2266   593ee0:	41 0f 94 c6          	sete   %r14b
226a   593ee4:	40 0f 94 c6          	sete   %sil
226e   593ee8:	89 c3                	mov    %eax,%ebx
2270   593eea:	31 ff                	xor    %edi,%edi
2272   593eec:	e8 00 00 00 00       	call   593ef1 <shrink_lruvec+0x2277>	593eed: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
2277   593ef1:	45 84 f6             	test   %r14b,%r14b
227a   593ef4:	75 0f                	jne    593f05 <shrink_lruvec+0x228b>
227c   593ef6:	85 db                	test   %ebx,%ebx
227e   593ef8:	0f 84 64 08 00 00    	je     594762 <shrink_lruvec+0x2ae8>
2284   593efe:	e8 00 00 00 00       	call   593f03 <shrink_lruvec+0x2289>	593eff: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2289   593f03:	eb cf                	jmp    593ed4 <shrink_lruvec+0x225a>
228b   593f05:	4c 89 ef             	mov    %r13,%rdi
228e   593f08:	be 08 00 00 00       	mov    $0x8,%esi
2293   593f0d:	e8 00 00 00 00       	call   593f12 <shrink_lruvec+0x2298>	593f0e: R_X86_64_PLT32	__kasan_check_write-0x4
2298   593f12:	31 f6                	xor    %esi,%esi
229a   593f14:	f0 49 0f ba 75 00 04 	lock btrq $0x4,0x0(%r13)
22a1   593f1b:	0f 92 c3             	setb   %bl
22a4   593f1e:	40 0f 92 c6          	setb   %sil
22a8   593f22:	31 ff                	xor    %edi,%edi
22aa   593f24:	e8 00 00 00 00       	call   593f29 <shrink_lruvec+0x22af>	593f25: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
22af   593f29:	84 db                	test   %bl,%bl
22b1   593f2b:	75 38                	jne    593f65 <shrink_lruvec+0x22eb>
22b3   593f2d:	4c 89 ff             	mov    %r15,%rdi
22b6   593f30:	be 04 00 00 00       	mov    $0x4,%esi
22bb   593f35:	e8 00 00 00 00       	call   593f3a <shrink_lruvec+0x22c0>	593f36: R_X86_64_PLT32	__kasan_check_write-0x4
22c0   593f3a:	31 f6                	xor    %esi,%esi
22c2   593f3c:	f0 41 ff 0f          	lock decl (%r15)
22c6   593f40:	0f 94 c3             	sete   %bl
22c9   593f43:	40 0f 94 c6          	sete   %sil
22cd   593f47:	31 ff                	xor    %edi,%edi
22cf   593f49:	e8 00 00 00 00       	call   593f4e <shrink_lruvec+0x22d4>	593f4a: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
22d4   593f4e:	84 db                	test   %bl,%bl
22d6   593f50:	4c 8b 74 24 18       	mov    0x18(%rsp),%r14
22db   593f55:	0f 85 02 01 00 00    	jne    59405d <shrink_lruvec+0x23e3>
22e1   593f5b:	e8 00 00 00 00       	call   593f60 <shrink_lruvec+0x22e6>	593f5c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
22e6   593f60:	e9 50 03 00 00       	jmp    5942b5 <shrink_lruvec+0x263b>
22eb   593f65:	4c 89 ef             	mov    %r13,%rdi
22ee   593f68:	be 08 00 00 00       	mov    $0x8,%esi
22f3   593f6d:	e8 00 00 00 00       	call   593f72 <shrink_lruvec+0x22f8>	593f6e: R_X86_64_PLT32	__kasan_check_read-0x4
22f8   593f72:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
2302   593f7c:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
2307   593f81:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
230b   593f85:	4c 8b 74 24 18       	mov    0x18(%rsp),%r14
2310   593f8a:	74 08                	je     593f94 <shrink_lruvec+0x231a>
2312   593f8c:	4c 89 ef             	mov    %r13,%rdi
2315   593f8f:	e8 00 00 00 00       	call   593f94 <shrink_lruvec+0x231a>	593f90: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
231a   593f94:	49 8b 5d 00          	mov    0x0(%r13),%rbx
231e   593f98:	48 89 de             	mov    %rbx,%rsi
2321   593f9b:	48 83 e6 02          	and    $0x2,%rsi
2325   593f9f:	31 ff                	xor    %edi,%edi
2327   593fa1:	e8 00 00 00 00       	call   593fa6 <shrink_lruvec+0x232c>	593fa2: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
232c   593fa6:	48 83 e3 02          	and    $0x2,%rbx
2330   593faa:	4c 8b 7c 24 28       	mov    0x28(%rsp),%r15
2335   593faf:	0f 85 ba 00 00 00    	jne    59406f <shrink_lruvec+0x23f5>
233b   593fb5:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
2345   593fbf:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
234a   593fc4:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
234e   593fc8:	74 08                	je     593fd2 <shrink_lruvec+0x2358>
2350   593fca:	4c 89 ef             	mov    %r13,%rdi
2353   593fcd:	e8 00 00 00 00       	call   593fd2 <shrink_lruvec+0x2358>	593fce: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2358   593fd2:	4d 8b 75 00          	mov    0x0(%r13),%r14
235c   593fd6:	4c 89 f3             	mov    %r14,%rbx
235f   593fd9:	48 b8 bd ff ff ff 9f ff ff ff 	movabs $0xffffff9fffffffbd,%rax
2369   593fe3:	48 21 c3             	and    %rax,%rbx
236c   593fe6:	4c 89 ef             	mov    %r13,%rdi
236f   593fe9:	be 08 00 00 00       	mov    $0x8,%esi
2374   593fee:	e8 00 00 00 00       	call   593ff3 <shrink_lruvec+0x2379>	593fef: R_X86_64_PLT32	__kasan_check_write-0x4
2379   593ff3:	4c 89 f0             	mov    %r14,%rax
237c   593ff6:	f0 49 0f b1 5d 00    	lock cmpxchg %rbx,0x0(%r13)
2382   593ffc:	4c 39 f0             	cmp    %r14,%rax
2385   593fff:	74 75                	je     594076 <shrink_lruvec+0x23fc>
2387   594001:	e8 00 00 00 00       	call   594006 <shrink_lruvec+0x238c>	594002: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
238c   594006:	eb ad                	jmp    593fb5 <shrink_lruvec+0x233b>
238e   594008:	4c 89 ef             	mov    %r13,%rdi
2391   59400b:	be 08 00 00 00       	mov    $0x8,%esi
2396   594010:	e8 00 00 00 00       	call   594015 <shrink_lruvec+0x239b>	594011: R_X86_64_PLT32	__kasan_check_read-0x4
239b   594015:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
23a5   59401f:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
23aa   594024:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
23ae   594028:	74 08                	je     594032 <shrink_lruvec+0x23b8>
23b0   59402a:	4c 89 ef             	mov    %r13,%rdi
23b3   59402d:	e8 00 00 00 00       	call   594032 <shrink_lruvec+0x23b8>	59402e: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
23b8   594032:	49 8b 5d 00          	mov    0x0(%r13),%rbx
23bc   594036:	be 00 00 08 00       	mov    $0x80000,%esi
23c1   59403b:	48 21 de             	and    %rbx,%rsi
23c4   59403e:	31 ff                	xor    %edi,%edi
23c6   594040:	e8 00 00 00 00       	call   594045 <shrink_lruvec+0x23cb>	594041: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
23cb   594045:	b8 00 00 08 00       	mov    $0x80000,%eax
23d0   59404a:	48 21 c3             	and    %rax,%rbx
23d3   59404d:	0f 85 12 02 00 00    	jne    594265 <shrink_lruvec+0x25eb>
23d9   594053:	e8 00 00 00 00       	call   594058 <shrink_lruvec+0x23de>	594054: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
23de   594058:	e9 58 02 00 00       	jmp    5942b5 <shrink_lruvec+0x263b>
23e3   59405d:	e8 00 00 00 00       	call   594062 <shrink_lruvec+0x23e8>	59405e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
23e8   594062:	4c 89 ef             	mov    %r13,%rdi
23eb   594065:	e8 00 00 00 00       	call   59406a <shrink_lruvec+0x23f0>	594066: R_X86_64_PLT32	__folio_put-0x4
23f0   59406a:	e9 46 02 00 00       	jmp    5942b5 <shrink_lruvec+0x263b>
23f5   59406f:	e8 00 00 00 00       	call   594074 <shrink_lruvec+0x23fa>	594070: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
23fa   594074:	eb 0a                	jmp    594080 <shrink_lruvec+0x2406>
23fc   594076:	e8 00 00 00 00       	call   59407b <shrink_lruvec+0x2401>	594077: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2401   59407b:	4c 8b 74 24 18       	mov    0x18(%rsp),%r14
2406   594080:	4c 89 ef             	mov    %r13,%rdi
2409   594083:	be 08 00 00 00       	mov    $0x8,%esi
240e   594088:	e8 00 00 00 00       	call   59408d <shrink_lruvec+0x2413>	594089: R_X86_64_PLT32	__kasan_check_write-0x4
2413   59408d:	f0 41 80 66 fa fb    	lock andb $0xfb,-0x6(%r14)
2419   594093:	4c 89 ef             	mov    %r13,%rdi
241c   594096:	be 08 00 00 00       	mov    $0x8,%esi
2421   59409b:	e8 00 00 00 00       	call   5940a0 <shrink_lruvec+0x2426>	59409c: R_X86_64_PLT32	__kasan_check_write-0x4
2426   5940a0:	f0 41 80 66 f8 fd    	lock andb $0xfd,-0x8(%r14)
242c   5940a6:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
2436   5940b0:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
243b   5940b5:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
243f   5940b9:	74 08                	je     5940c3 <shrink_lruvec+0x2449>
2441   5940bb:	4c 89 ef             	mov    %r13,%rdi
2444   5940be:	e8 00 00 00 00       	call   5940c3 <shrink_lruvec+0x2449>	5940bf: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2449   5940c3:	49 8b 5d 00          	mov    0x0(%r13),%rbx
244d   5940c7:	49 be 00 00 00 00 80 03 00 00 	movabs $0x38000000000,%r14
2457   5940d1:	4c 89 f6             	mov    %r14,%rsi
245a   5940d4:	48 21 de             	and    %rbx,%rsi
245d   5940d7:	31 ff                	xor    %edi,%edi
245f   5940d9:	e8 00 00 00 00       	call   5940de <shrink_lruvec+0x2464>	5940da: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
2464   5940de:	4c 21 f3             	and    %r14,%rbx
2467   5940e1:	0f 84 3c 03 00 00    	je     594423 <shrink_lruvec+0x27a9>
246d   5940e7:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
2477   5940f1:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
247c   5940f6:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
2480   5940fa:	74 08                	je     594104 <shrink_lruvec+0x248a>
2482   5940fc:	4c 89 ef             	mov    %r13,%rdi
2485   5940ff:	e8 00 00 00 00       	call   594104 <shrink_lruvec+0x248a>	594100: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
248a   594104:	4d 8b 75 00          	mov    0x0(%r13),%r14
248e   594108:	4c 89 f3             	mov    %r14,%rbx
2491   59410b:	4c 21 e3             	and    %r12,%rbx
2494   59410e:	4c 89 ef             	mov    %r13,%rdi
2497   594111:	be 08 00 00 00       	mov    $0x8,%esi
249c   594116:	e8 00 00 00 00       	call   59411b <shrink_lruvec+0x24a1>	594117: R_X86_64_PLT32	__kasan_check_write-0x4
24a1   59411b:	4c 89 f0             	mov    %r14,%rax
24a4   59411e:	f0 49 0f b1 5d 00    	lock cmpxchg %rbx,0x0(%r13)
24aa   594124:	4c 39 f0             	cmp    %r14,%rax
24ad   594127:	74 07                	je     594130 <shrink_lruvec+0x24b6>
24af   594129:	e8 00 00 00 00       	call   59412e <shrink_lruvec+0x24b4>	59412a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
24b4   59412e:	eb b7                	jmp    5940e7 <shrink_lruvec+0x246d>
24b6   594130:	e8 00 00 00 00       	call   594135 <shrink_lruvec+0x24bb>	594131: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
24bb   594135:	49 c1 ee 27          	shr    $0x27,%r14
24bf   594139:	41 83 e6 07          	and    $0x7,%r14d
24c3   59413d:	41 ff ce             	dec    %r14d
24c6   594140:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
24cb   594145:	4c 89 ee             	mov    %r13,%rsi
24ce   594148:	44 89 f2             	mov    %r14d,%edx
24d1   59414b:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
24d6   594150:	e8 9a 2c ff ff       	call   586def <lru_gen_update_size>
24db   594155:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
24e0   59415a:	4c 8d 73 08          	lea    0x8(%rbx),%r14
24e4   59415e:	4d 89 f4             	mov    %r14,%r12
24e7   594161:	49 c1 ec 03          	shr    $0x3,%r12
24eb   594165:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
24f5   59416f:	41 80 3c 04 00       	cmpb   $0x0,(%r12,%rax,1)
24fa   594174:	74 08                	je     59417e <shrink_lruvec+0x2504>
24fc   594176:	4c 89 f7             	mov    %r14,%rdi
24ff   594179:	e8 00 00 00 00       	call   59417e <shrink_lruvec+0x2504>	59417a: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2504   59417e:	4c 89 74 24 08       	mov    %r14,0x8(%rsp)
2509   594183:	4c 8b 7b 08          	mov    0x8(%rbx),%r15
250d   594187:	49 89 dd             	mov    %rbx,%r13
2510   59418a:	49 c1 ed 03          	shr    $0x3,%r13
2514   59418e:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
251e   594198:	41 80 7c 05 00 00    	cmpb   $0x0,0x0(%r13,%rax,1)
2524   59419e:	74 08                	je     5941a8 <shrink_lruvec+0x252e>
2526   5941a0:	48 89 df             	mov    %rbx,%rdi
2529   5941a3:	e8 00 00 00 00       	call   5941a8 <shrink_lruvec+0x252e>	5941a4: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
252e   5941a8:	4c 8b 33             	mov    (%rbx),%r14
2531   5941ab:	49 8d 5e 08          	lea    0x8(%r14),%rbx
2535   5941af:	48 89 d8             	mov    %rbx,%rax
2538   5941b2:	48 c1 e8 03          	shr    $0x3,%rax
253c   5941b6:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
2546   5941c0:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
254a   5941c4:	74 08                	je     5941ce <shrink_lruvec+0x2554>
254c   5941c6:	48 89 df             	mov    %rbx,%rdi
254f   5941c9:	e8 00 00 00 00       	call   5941ce <shrink_lruvec+0x2554>	5941ca: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
2554   5941ce:	4c 89 3b             	mov    %r15,(%rbx)
2557   5941d1:	4c 89 f8             	mov    %r15,%rax
255a   5941d4:	48 c1 e8 03          	shr    $0x3,%rax
255e   5941d8:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
2568   5941e2:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
256c   5941e6:	74 08                	je     5941f0 <shrink_lruvec+0x2576>
256e   5941e8:	4c 89 ff             	mov    %r15,%rdi
2571   5941eb:	e8 00 00 00 00       	call   5941f0 <shrink_lruvec+0x2576>	5941ec: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
2576   5941f0:	4d 89 37             	mov    %r14,(%r15)
2579   5941f3:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
2583   5941fd:	41 80 7c 05 00 00    	cmpb   $0x0,0x0(%r13,%rax,1)
2589   594203:	4c 8d b4 24 f8 00 00 00 	lea    0xf8(%rsp),%r14
2591   59420b:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
2596   594210:	74 08                	je     59421a <shrink_lruvec+0x25a0>
2598   594212:	48 89 df             	mov    %rbx,%rdi
259b   594215:	e8 00 00 00 00       	call   59421a <shrink_lruvec+0x25a0>	594216: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
25a0   59421a:	48 b8 00 01 00 00 00 00 ad de 	movabs $0xdead000000000100,%rax
25aa   594224:	48 89 03             	mov    %rax,(%rbx)
25ad   594227:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
25b7   594231:	41 80 3c 04 00       	cmpb   $0x0,(%r12,%rax,1)
25bc   594236:	44 8b 6c 24 40       	mov    0x40(%rsp),%r13d
25c1   59423b:	4c 8b 7c 24 28       	mov    0x28(%rsp),%r15
25c6   594240:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
25cb   594245:	74 08                	je     59424f <shrink_lruvec+0x25d5>
25cd   594247:	48 89 df             	mov    %rbx,%rdi
25d0   59424a:	e8 00 00 00 00       	call   59424f <shrink_lruvec+0x25d5>	59424b: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
25d5   59424f:	48 b8 00 01 00 00 00 00 ad de 	movabs $0xdead000000000100,%rax
25df   594259:	48 83 c0 22          	add    $0x22,%rax
25e3   59425d:	48 89 03             	mov    %rax,(%rbx)
25e6   594260:	e9 d0 01 00 00       	jmp    594435 <shrink_lruvec+0x27bb>
25eb   594265:	4c 89 ef             	mov    %r13,%rdi
25ee   594268:	be 08 00 00 00       	mov    $0x8,%esi
25f3   59426d:	e8 00 00 00 00       	call   594272 <shrink_lruvec+0x25f8>	59426e: R_X86_64_PLT32	__kasan_check_read-0x4
25f8   594272:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
2602   59427c:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
2607   594281:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
260b   594285:	74 08                	je     59428f <shrink_lruvec+0x2615>
260d   594287:	4c 89 ef             	mov    %r13,%rdi
2610   59428a:	e8 00 00 00 00       	call   59428f <shrink_lruvec+0x2615>	59428b: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2615   59428f:	49 8b 5d 00          	mov    0x0(%r13),%rbx
2619   594293:	be 00 04 00 00       	mov    $0x400,%esi
261e   594298:	48 21 de             	and    %rbx,%rsi
2621   59429b:	31 ff                	xor    %edi,%edi
2623   59429d:	e8 00 00 00 00       	call   5942a2 <shrink_lruvec+0x2628>	59429e: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
2628   5942a2:	b8 00 04 00 00       	mov    $0x400,%eax
262d   5942a7:	48 21 c3             	and    %rax,%rbx
2630   5942aa:	0f 85 5b 02 00 00    	jne    59450b <shrink_lruvec+0x2891>
2636   5942b0:	e8 00 00 00 00       	call   5942b5 <shrink_lruvec+0x263b>	5942b1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
263b   5942b5:	49 8d 5e 08          	lea    0x8(%r14),%rbx
263f   5942b9:	48 89 d9             	mov    %rbx,%rcx
2642   5942bc:	48 c1 e9 03          	shr    $0x3,%rcx
2646   5942c0:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
2650   5942ca:	48 89 0c 24          	mov    %rcx,(%rsp)
2654   5942ce:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
2658   5942d2:	74 08                	je     5942dc <shrink_lruvec+0x2662>
265a   5942d4:	48 89 df             	mov    %rbx,%rdi
265d   5942d7:	e8 00 00 00 00       	call   5942dc <shrink_lruvec+0x2662>	5942d8: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2662   5942dc:	48 89 5c 24 08       	mov    %rbx,0x8(%rsp)
2667   5942e1:	4d 8b 7e 08          	mov    0x8(%r14),%r15
266b   5942e5:	4d 89 f5             	mov    %r14,%r13
266e   5942e8:	49 c1 ed 03          	shr    $0x3,%r13
2672   5942ec:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
267c   5942f6:	41 80 7c 05 00 00    	cmpb   $0x0,0x0(%r13,%rax,1)
2682   5942fc:	74 08                	je     594306 <shrink_lruvec+0x268c>
2684   5942fe:	4c 89 f7             	mov    %r14,%rdi
2687   594301:	e8 00 00 00 00       	call   594306 <shrink_lruvec+0x268c>	594302: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
268c   594306:	4d 8b 36             	mov    (%r14),%r14
268f   594309:	49 8d 5e 08          	lea    0x8(%r14),%rbx
2693   59430d:	48 89 d8             	mov    %rbx,%rax
2696   594310:	48 c1 e8 03          	shr    $0x3,%rax
269a   594314:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
26a4   59431e:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
26a8   594322:	74 08                	je     59432c <shrink_lruvec+0x26b2>
26aa   594324:	48 89 df             	mov    %rbx,%rdi
26ad   594327:	e8 00 00 00 00       	call   59432c <shrink_lruvec+0x26b2>	594328: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
26b2   59432c:	4c 89 3b             	mov    %r15,(%rbx)
26b5   59432f:	4c 89 f8             	mov    %r15,%rax
26b8   594332:	48 c1 e8 03          	shr    $0x3,%rax
26bc   594336:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
26c6   594340:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
26ca   594344:	74 08                	je     59434e <shrink_lruvec+0x26d4>
26cc   594346:	4c 89 ff             	mov    %r15,%rdi
26cf   594349:	e8 00 00 00 00       	call   59434e <shrink_lruvec+0x26d4>	59434a: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
26d4   59434e:	4d 89 37             	mov    %r14,(%r15)
26d7   594351:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
26e1   59435b:	48 8b 8c 24 a0 00 00 00 	mov    0xa0(%rsp),%rcx
26e9   594363:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
26ed   594367:	74 0a                	je     594373 <shrink_lruvec+0x26f9>
26ef   594369:	48 8d 7c 24 60       	lea    0x60(%rsp),%rdi
26f4   59436e:	e8 00 00 00 00       	call   594373 <shrink_lruvec+0x26f9>	59436f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
26f9   594373:	4c 8b 74 24 60       	mov    0x60(%rsp),%r14
26fe   594378:	49 8d 5e 08          	lea    0x8(%r14),%rbx
2702   59437c:	48 89 d8             	mov    %rbx,%rax
2705   59437f:	48 c1 e8 03          	shr    $0x3,%rax
2709   594383:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
2713   59438d:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
2717   594391:	4c 8b 7c 24 28       	mov    0x28(%rsp),%r15
271c   594396:	74 08                	je     5943a0 <shrink_lruvec+0x2726>
271e   594398:	48 89 df             	mov    %rbx,%rdi
2721   59439b:	e8 00 00 00 00       	call   5943a0 <shrink_lruvec+0x2726>	59439c: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
2726   5943a0:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
272b   5943a5:	4c 89 23             	mov    %r12,(%rbx)
272e   5943a8:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
2738   5943b2:	41 80 7c 05 00 00    	cmpb   $0x0,0x0(%r13,%rax,1)
273e   5943b8:	74 08                	je     5943c2 <shrink_lruvec+0x2748>
2740   5943ba:	4c 89 e7             	mov    %r12,%rdi
2743   5943bd:	e8 00 00 00 00       	call   5943c2 <shrink_lruvec+0x2748>	5943be: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
2748   5943c2:	4d 89 34 24          	mov    %r14,(%r12)
274c   5943c6:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
2756   5943d0:	48 8b 0c 24          	mov    (%rsp),%rcx
275a   5943d4:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
275e   5943d8:	44 8b 6c 24 40       	mov    0x40(%rsp),%r13d
2763   5943dd:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
2768   5943e2:	74 08                	je     5943ec <shrink_lruvec+0x2772>
276a   5943e4:	48 89 df             	mov    %rbx,%rdi
276d   5943e7:	e8 00 00 00 00       	call   5943ec <shrink_lruvec+0x2772>	5943e8: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
2772   5943ec:	48 8d 7c 24 60       	lea    0x60(%rsp),%rdi
2777   5943f1:	48 89 3b             	mov    %rdi,(%rbx)
277a   5943f4:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
2784   5943fe:	48 8b 8c 24 a0 00 00 00 	mov    0xa0(%rsp),%rcx
278c   594406:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
2790   59440a:	74 05                	je     594411 <shrink_lruvec+0x2797>
2792   59440c:	e8 00 00 00 00       	call   594411 <shrink_lruvec+0x2797>	59440d: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
2797   594411:	4c 89 64 24 60       	mov    %r12,0x60(%rsp)
279c   594416:	8b 4c 24 20          	mov    0x20(%rsp),%ecx
27a0   59441a:	01 4c 24 78          	add    %ecx,0x78(%rsp)
27a4   59441e:	e9 db f6 ff ff       	jmp    593afe <shrink_lruvec+0x1e84>
27a9   594423:	e8 00 00 00 00       	call   594428 <shrink_lruvec+0x27ae>	594424: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
27ae   594428:	4c 8d b4 24 f8 00 00 00 	lea    0xf8(%rsp),%r14
27b6   594430:	44 8b 6c 24 40       	mov    0x40(%rsp),%r13d
27bb   594435:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
27c5   59443f:	48 8b 8c 24 80 01 00 00 	mov    0x180(%rsp),%rcx
27cd   594447:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
27d1   59444b:	74 08                	je     594455 <shrink_lruvec+0x27db>
27d3   59444d:	4c 89 f7             	mov    %r14,%rdi
27d6   594450:	e8 00 00 00 00       	call   594455 <shrink_lruvec+0x27db>	594451: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
27db   594455:	4c 8b b4 24 f8 00 00 00 	mov    0xf8(%rsp),%r14
27e3   59445d:	4d 8d 66 08          	lea    0x8(%r14),%r12
27e7   594461:	4c 89 e0             	mov    %r12,%rax
27ea   594464:	48 c1 e8 03          	shr    $0x3,%rax
27ee   594468:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
27f8   594472:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
27fc   594476:	74 08                	je     594480 <shrink_lruvec+0x2806>
27fe   594478:	4c 89 e7             	mov    %r12,%rdi
2801   59447b:	e8 00 00 00 00       	call   594480 <shrink_lruvec+0x2806>	59447c: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
2806   594480:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
280b   594485:	49 89 1c 24          	mov    %rbx,(%r12)
280f   594489:	48 89 d8             	mov    %rbx,%rax
2812   59448c:	48 c1 e8 03          	shr    $0x3,%rax
2816   594490:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
2820   59449a:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
2824   59449e:	74 08                	je     5944a8 <shrink_lruvec+0x282e>
2826   5944a0:	48 89 df             	mov    %rbx,%rdi
2829   5944a3:	e8 00 00 00 00       	call   5944a8 <shrink_lruvec+0x282e>	5944a4: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
282e   5944a8:	4c 89 33             	mov    %r14,(%rbx)
2831   5944ab:	4c 8d 73 08          	lea    0x8(%rbx),%r14
2835   5944af:	4c 89 f0             	mov    %r14,%rax
2838   5944b2:	48 c1 e8 03          	shr    $0x3,%rax
283c   5944b6:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
2846   5944c0:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
284a   5944c4:	74 08                	je     5944ce <shrink_lruvec+0x2854>
284c   5944c6:	4c 89 f7             	mov    %r14,%rdi
284f   5944c9:	e8 00 00 00 00       	call   5944ce <shrink_lruvec+0x2854>	5944ca: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
2854   5944ce:	48 8d bc 24 f8 00 00 00 	lea    0xf8(%rsp),%rdi
285c   5944d6:	49 89 3e             	mov    %rdi,(%r14)
285f   5944d9:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
2869   5944e3:	48 8b 8c 24 80 01 00 00 	mov    0x180(%rsp),%rcx
2871   5944eb:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
2875   5944ef:	74 05                	je     5944f6 <shrink_lruvec+0x287c>
2877   5944f1:	e8 00 00 00 00       	call   5944f6 <shrink_lruvec+0x287c>	5944f2: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
287c   5944f6:	48 89 9c 24 f8 00 00 00 	mov    %rbx,0xf8(%rsp)
2884   5944fe:	8b 4c 24 20          	mov    0x20(%rsp),%ecx
2888   594502:	01 4c 24 48          	add    %ecx,0x48(%rsp)
288c   594506:	e9 f3 f5 ff ff       	jmp    593afe <shrink_lruvec+0x1e84>
2891   59450b:	e8 00 00 00 00       	call   594510 <shrink_lruvec+0x2896>	59450c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2896   594510:	e9 7e f9 ff ff       	jmp    593e93 <shrink_lruvec+0x2219>
289b   594515:	e8 00 00 00 00       	call   59451a <shrink_lruvec+0x28a0>	594516: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
28a0   59451a:	0f 0b                	ud2
28a2   59451c:	e9 90 ef ff ff       	jmp    5934b1 <shrink_lruvec+0x1837>
28a7   594521:	e8 00 00 00 00       	call   594526 <shrink_lruvec+0x28ac>	594522: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
28ac   594526:	0f 0b                	ud2
28ae   594528:	e9 60 ef ff ff       	jmp    59348d <shrink_lruvec+0x1813>
28b3   59452d:	e8 00 00 00 00       	call   594532 <shrink_lruvec+0x28b8>	59452e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
28b8   594532:	0f 0b                	ud2
28ba   594534:	e9 2f f7 ff ff       	jmp    593c68 <shrink_lruvec+0x1fee>
28bf   594539:	e8 00 00 00 00       	call   59453e <shrink_lruvec+0x28c4>	59453a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
28c4   59453e:	0f 0b                	ud2
28c6   594540:	e9 ff f6 ff ff       	jmp    593c44 <shrink_lruvec+0x1fca>
28cb   594545:	89 d9                	mov    %ebx,%ecx
28cd   594547:	80 e1 07             	and    $0x7,%cl
28d0   59454a:	80 c1 03             	add    $0x3,%cl
28d3   59454d:	38 c1                	cmp    %al,%cl
28d5   59454f:	0f 8c 6d e3 ff ff    	jl     5928c2 <shrink_lruvec+0xc48>
28db   594555:	48 89 df             	mov    %rbx,%rdi
28de   594558:	e8 00 00 00 00       	call   59455d <shrink_lruvec+0x28e3>	594559: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
28e3   59455d:	e9 60 e3 ff ff       	jmp    5928c2 <shrink_lruvec+0xc48>
28e8   594562:	89 d9                	mov    %ebx,%ecx
28ea   594564:	80 e1 07             	and    $0x7,%cl
28ed   594567:	80 c1 03             	add    $0x3,%cl
28f0   59456a:	38 c1                	cmp    %al,%cl
28f2   59456c:	0f 8c 27 e4 ff ff    	jl     592999 <shrink_lruvec+0xd1f>
28f8   594572:	48 89 df             	mov    %rbx,%rdi
28fb   594575:	e8 00 00 00 00       	call   59457a <shrink_lruvec+0x2900>	594576: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
2900   59457a:	e9 1a e4 ff ff       	jmp    592999 <shrink_lruvec+0xd1f>
2905   59457f:	e8 00 00 00 00       	call   594584 <shrink_lruvec+0x290a>	594580: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
290a   594584:	e9 2c fd ff ff       	jmp    5942b5 <shrink_lruvec+0x263b>
290f   594589:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	59458c: R_X86_64_32S	debug_locks
2916   594590:	80 e1 07             	and    $0x7,%cl
2919   594593:	80 c1 03             	add    $0x3,%cl
291c   594596:	38 c1                	cmp    %al,%cl
291e   594598:	0f 8c ab ed ff ff    	jl     593349 <shrink_lruvec+0x16cf>
2924   59459e:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	5945a1: R_X86_64_32S	debug_locks
292b   5945a5:	e8 00 00 00 00       	call   5945aa <shrink_lruvec+0x2930>	5945a6: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
2930   5945aa:	e9 9a ed ff ff       	jmp    593349 <shrink_lruvec+0x16cf>
2935   5945af:	44 89 f1             	mov    %r14d,%ecx
2938   5945b2:	80 e1 07             	and    $0x7,%cl
293b   5945b5:	80 c1 03             	add    $0x3,%cl
293e   5945b8:	38 c1                	cmp    %al,%cl
2940   5945ba:	0f 8c 69 ed ff ff    	jl     593329 <shrink_lruvec+0x16af>
2946   5945c0:	4c 89 f7             	mov    %r14,%rdi
2949   5945c3:	e8 00 00 00 00       	call   5945c8 <shrink_lruvec+0x294e>	5945c4: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
294e   5945c8:	e9 5c ed ff ff       	jmp    593329 <shrink_lruvec+0x16af>
2953   5945cd:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	5945d0: R_X86_64_32S	debug_locks
295a   5945d4:	80 e1 07             	and    $0x7,%cl
295d   5945d7:	80 c1 03             	add    $0x3,%cl
2960   5945da:	38 c1                	cmp    %al,%cl
2962   5945dc:	0f 8c be f5 ff ff    	jl     593ba0 <shrink_lruvec+0x1f26>
2968   5945e2:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	5945e5: R_X86_64_32S	debug_locks
296f   5945e9:	e8 00 00 00 00       	call   5945ee <shrink_lruvec+0x2974>	5945ea: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
2974   5945ee:	e9 ad f5 ff ff       	jmp    593ba0 <shrink_lruvec+0x1f26>
2979   5945f3:	e8 00 00 00 00       	call   5945f8 <shrink_lruvec+0x297e>	5945f4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
297e   5945f8:	44 89 e6             	mov    %r12d,%esi
2981   5945fb:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	5945fe: R_X86_64_32S	.data+0x599a40
2988   594602:	e8 00 00 00 00       	call   594607 <shrink_lruvec+0x298d>	594603: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
298d   594607:	e9 5e eb ff ff       	jmp    59316a <shrink_lruvec+0x14f0>
2992   59460c:	89 d1                	mov    %edx,%ecx
2994   59460e:	80 e1 07             	and    $0x7,%cl
2997   594611:	fe c1                	inc    %cl
2999   594613:	38 c1                	cmp    %al,%cl
299b   594615:	0f 8c f2 f5 ff ff    	jl     593c0d <shrink_lruvec+0x1f93>
29a1   59461b:	48 8b bc 24 90 00 00 00 	mov    0x90(%rsp),%rdi
29a9   594623:	e8 00 00 00 00       	call   594628 <shrink_lruvec+0x29ae>	594624: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
29ae   594628:	48 8b 94 24 90 00 00 00 	mov    0x90(%rsp),%rdx
29b6   594630:	e9 d8 f5 ff ff       	jmp    593c0d <shrink_lruvec+0x1f93>
29bb   594635:	44 89 f1             	mov    %r14d,%ecx
29be   594638:	80 e1 07             	and    $0x7,%cl
29c1   59463b:	80 c1 03             	add    $0x3,%cl
29c4   59463e:	38 c1                	cmp    %al,%cl
29c6   594640:	0f 8c 3a f5 ff ff    	jl     593b80 <shrink_lruvec+0x1f06>
29cc   594646:	4c 89 f7             	mov    %r14,%rdi
29cf   594649:	e8 00 00 00 00       	call   59464e <shrink_lruvec+0x29d4>	59464a: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
29d4   59464e:	e9 2d f5 ff ff       	jmp    593b80 <shrink_lruvec+0x1f06>
29d9   594653:	89 d1                	mov    %edx,%ecx
29db   594655:	80 e1 07             	and    $0x7,%cl
29de   594658:	fe c1                	inc    %cl
29e0   59465a:	38 c1                	cmp    %al,%cl
29e2   59465c:	0f 8c 43 f7 ff ff    	jl     593da5 <shrink_lruvec+0x212b>
29e8   594662:	48 8b bc 24 90 00 00 00 	mov    0x90(%rsp),%rdi
29f0   59466a:	e8 00 00 00 00       	call   59466f <shrink_lruvec+0x29f5>	59466b: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
29f5   59466f:	48 8b 94 24 90 00 00 00 	mov    0x90(%rsp),%rdx
29fd   594677:	e9 29 f7 ff ff       	jmp    593da5 <shrink_lruvec+0x212b>
2a02   59467c:	e8 00 00 00 00       	call   594681 <shrink_lruvec+0x2a07>	59467d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2a07   594681:	44 89 ee             	mov    %r13d,%esi
2a0a   594684:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	594687: R_X86_64_32S	.data+0x599a60
2a11   59468b:	e8 00 00 00 00       	call   594690 <shrink_lruvec+0x2a16>	59468c: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
2a16   594690:	e9 4b e8 ff ff       	jmp    592ee0 <shrink_lruvec+0x1266>
2a1b   594695:	45 89 fd             	mov    %r15d,%r13d
2a1e   594698:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	59469b: R_X86_64_32S	.data+0x599a80
2a25   59469f:	4c 89 ee             	mov    %r13,%rsi
2a28   5946a2:	e8 00 00 00 00       	call   5946a7 <shrink_lruvec+0x2a2d>	5946a3: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
2a2d   5946a7:	48 8b 84 24 b8 00 00 00 	mov    0xb8(%rsp),%rax
2a35   5946af:	48 8d 04 40          	lea    (%rax,%rax,2),%rax
2a39   5946b3:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
2a3e   5946b8:	48 8d 04 c1          	lea    (%rcx,%rax,8),%rax
2a42   5946bc:	48 8d 1c d8          	lea    (%rax,%rbx,8),%rbx
2a46   5946c0:	48 81 c3 58 04 00 00 	add    $0x458,%rbx
2a4d   5946c7:	48 89 d8             	mov    %rbx,%rax
2a50   5946ca:	48 c1 e8 03          	shr    $0x3,%rax
2a54   5946ce:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
2a5e   5946d8:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
2a62   5946dc:	74 08                	je     5946e6 <shrink_lruvec+0x2a6c>
2a64   5946de:	48 89 df             	mov    %rbx,%rdi
2a67   5946e1:	e8 00 00 00 00       	call   5946e6 <shrink_lruvec+0x2a6c>	5946e2: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2a6c   5946e6:	4c 63 64 24 58       	movslq 0x58(%rsp),%r12
2a71   5946eb:	4c 8b 33             	mov    (%rbx),%r14
2a74   5946ee:	4d 01 e6             	add    %r12,%r14
2a77   5946f1:	bf 03 00 00 00       	mov    $0x3,%edi
2a7c   5946f6:	44 89 fe             	mov    %r15d,%esi
2a7f   5946f9:	e8 00 00 00 00       	call   5946fe <shrink_lruvec+0x2a84>	5946fa: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
2a84   5946fe:	41 83 ff 03          	cmp    $0x3,%r15d
2a88   594702:	75 6d                	jne    594771 <shrink_lruvec+0x2af7>
2a8a   594704:	e8 00 00 00 00       	call   594709 <shrink_lruvec+0x2a8f>	594705: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2a8f   594709:	e9 f5 e9 ff ff       	jmp    593103 <shrink_lruvec+0x1489>
2a94   59470e:	e8 00 00 00 00       	call   594713 <shrink_lruvec+0x2a99>	59470f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2a99   594713:	44 89 fe             	mov    %r15d,%esi
2a9c   594716:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	594719: R_X86_64_32S	.data+0x599ac0
2aa3   59471d:	e8 00 00 00 00       	call   594722 <shrink_lruvec+0x2aa8>	59471e: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
2aa8   594722:	e9 35 f2 ff ff       	jmp    59395c <shrink_lruvec+0x1ce2>
2aad   594727:	89 d9                	mov    %ebx,%ecx
2aaf   594729:	80 e1 07             	and    $0x7,%cl
2ab2   59472c:	80 c1 03             	add    $0x3,%cl
2ab5   59472f:	38 c1                	cmp    %al,%cl
2ab7   594731:	0f 8c ad f6 ff ff    	jl     593de4 <shrink_lruvec+0x216a>
2abd   594737:	48 89 df             	mov    %rbx,%rdi
2ac0   59473a:	e8 00 00 00 00       	call   59473f <shrink_lruvec+0x2ac5>	59473b: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
2ac5   59473f:	e9 a0 f6 ff ff       	jmp    593de4 <shrink_lruvec+0x216a>
2aca   594744:	44 89 f9             	mov    %r15d,%ecx
2acd   594747:	80 e1 07             	and    $0x7,%cl
2ad0   59474a:	80 c1 03             	add    $0x3,%cl
2ad3   59474d:	38 c1                	cmp    %al,%cl
2ad5   59474f:	0f 8c 6b f7 ff ff    	jl     593ec0 <shrink_lruvec+0x2246>
2adb   594755:	4c 89 ff             	mov    %r15,%rdi
2ade   594758:	e8 00 00 00 00       	call   59475d <shrink_lruvec+0x2ae3>	594759: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
2ae3   59475d:	e9 5e f7 ff ff       	jmp    593ec0 <shrink_lruvec+0x2246>
2ae8   594762:	e8 00 00 00 00       	call   594767 <shrink_lruvec+0x2aed>	594763: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2aed   594767:	4c 8b 74 24 18       	mov    0x18(%rsp),%r14
2af2   59476c:	e9 44 fb ff ff       	jmp    5942b5 <shrink_lruvec+0x263b>
2af7   594771:	e8 00 00 00 00       	call   594776 <shrink_lruvec+0x2afc>	594772: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2afc   594776:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	594779: R_X86_64_32S	.data+0x599aa0
2b03   59477d:	4c 89 ee             	mov    %r13,%rsi
2b06   594780:	e8 00 00 00 00       	call   594785 <shrink_lruvec+0x2b0b>	594781: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
2b0b   594785:	e9 79 e9 ff ff       	jmp    593103 <shrink_lruvec+0x1489>
2b10   59478a:	e8 00 00 00 00       	call   59478f <shrink_lruvec+0x2b15>	59478b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2b15   59478f:	eb 0d                	jmp    59479e <shrink_lruvec+0x2b24>
2b17   594791:	e8 00 00 00 00       	call   594796 <shrink_lruvec+0x2b1c>	594792: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2b1c   594796:	4c 8b b4 24 a8 00 00 00 	mov    0xa8(%rsp),%r14
2b24   59479e:	31 ff                	xor    %edi,%edi
2b26   5947a0:	8b 5c 24 78          	mov    0x78(%rsp),%ebx
2b2a   5947a4:	89 de                	mov    %ebx,%esi
2b2c   5947a6:	e8 00 00 00 00       	call   5947ab <shrink_lruvec+0x2b31>	5947a7: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
2b31   5947ab:	85 db                	test   %ebx,%ebx
2b33   5947ad:	0f 84 2c 01 00 00    	je     5948df <shrink_lruvec+0x2c65>
2b39   5947b3:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
2b43   5947bd:	48 8b 8c 24 a0 00 00 00 	mov    0xa0(%rsp),%rcx
2b4b   5947c5:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
2b4f   5947c9:	48 8d 5c 24 60       	lea    0x60(%rsp),%rbx
2b54   5947ce:	74 08                	je     5947d8 <shrink_lruvec+0x2b5e>
2b56   5947d0:	48 89 df             	mov    %rbx,%rdi
2b59   5947d3:	e8 00 00 00 00       	call   5947d8 <shrink_lruvec+0x2b5e>	5947d4: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2b5e   5947d8:	4c 8b 64 24 60       	mov    0x60(%rsp),%r12
2b63   5947dd:	49 39 dc             	cmp    %rbx,%r12
2b66   5947e0:	0f 84 08 01 00 00    	je     5948ee <shrink_lruvec+0x2c74>
2b6c   5947e6:	4c 89 7c 24 28       	mov    %r15,0x28(%rsp)
2b71   5947eb:	e8 00 00 00 00       	call   5947f0 <shrink_lruvec+0x2b76>	5947ec: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2b76   5947f0:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
2b80   5947fa:	41 80 3c 06 00       	cmpb   $0x0,(%r14,%rax,1)
2b85   5947ff:	48 8b 9c 24 e0 00 00 00 	mov    0xe0(%rsp),%rbx
2b8d   594807:	74 08                	je     594811 <shrink_lruvec+0x2b97>
2b8f   594809:	48 89 df             	mov    %rbx,%rdi
2b92   59480c:	e8 00 00 00 00       	call   594811 <shrink_lruvec+0x2b97>	59480d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2b97   594811:	4c 8b 3b             	mov    (%rbx),%r15
2b9a   594814:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
2ba4   59481e:	48 8b 8c 24 90 01 00 00 	mov    0x190(%rsp),%rcx
2bac   594826:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
2bb0   59482a:	74 0a                	je     594836 <shrink_lruvec+0x2bbc>
2bb2   59482c:	48 8d 7c 24 68       	lea    0x68(%rsp),%rdi
2bb7   594831:	e8 00 00 00 00       	call   594836 <shrink_lruvec+0x2bbc>	594832: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2bbc   594836:	4c 8b 74 24 68       	mov    0x68(%rsp),%r14
2bc1   59483b:	49 8d 5c 24 08       	lea    0x8(%r12),%rbx
2bc6   594840:	48 89 d8             	mov    %rbx,%rax
2bc9   594843:	48 c1 e8 03          	shr    $0x3,%rax
2bcd   594847:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
2bd7   594851:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
2bdb   594855:	74 08                	je     59485f <shrink_lruvec+0x2be5>
2bdd   594857:	48 89 df             	mov    %rbx,%rdi
2be0   59485a:	e8 00 00 00 00       	call   59485f <shrink_lruvec+0x2be5>	59485b: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
2be5   59485f:	48 8b 84 24 e0 00 00 00 	mov    0xe0(%rsp),%rax
2bed   594867:	48 89 03             	mov    %rax,(%rbx)
2bf0   59486a:	48 89 c3             	mov    %rax,%rbx
2bf3   59486d:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
2bfd   594877:	48 8b 8c 24 a8 00 00 00 	mov    0xa8(%rsp),%rcx
2c05   59487f:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
2c09   594883:	74 08                	je     59488d <shrink_lruvec+0x2c13>
2c0b   594885:	48 89 df             	mov    %rbx,%rdi
2c0e   594888:	e8 00 00 00 00       	call   59488d <shrink_lruvec+0x2c13>	594889: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
2c13   59488d:	4c 89 23             	mov    %r12,(%rbx)
2c16   594890:	4c 89 f0             	mov    %r14,%rax
2c19   594893:	48 c1 e8 03          	shr    $0x3,%rax
2c1d   594897:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
2c27   5948a1:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
2c2b   5948a5:	74 08                	je     5948af <shrink_lruvec+0x2c35>
2c2d   5948a7:	4c 89 f7             	mov    %r14,%rdi
2c30   5948aa:	e8 00 00 00 00       	call   5948af <shrink_lruvec+0x2c35>	5948ab: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
2c35   5948af:	4d 89 3e             	mov    %r15,(%r14)
2c38   5948b2:	49 83 c7 08          	add    $0x8,%r15
2c3c   5948b6:	4c 89 f8             	mov    %r15,%rax
2c3f   5948b9:	48 c1 e8 03          	shr    $0x3,%rax
2c43   5948bd:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
2c4d   5948c7:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
2c51   5948cb:	74 08                	je     5948d5 <shrink_lruvec+0x2c5b>
2c53   5948cd:	4c 89 ff             	mov    %r15,%rdi
2c56   5948d0:	e8 00 00 00 00       	call   5948d5 <shrink_lruvec+0x2c5b>	5948d1: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
2c5b   5948d5:	4d 89 37             	mov    %r14,(%r15)
2c5e   5948d8:	4c 8b 7c 24 28       	mov    0x28(%rsp),%r15
2c63   5948dd:	eb 14                	jmp    5948f3 <shrink_lruvec+0x2c79>
2c65   5948df:	e8 00 00 00 00       	call   5948e4 <shrink_lruvec+0x2c6a>	5948e0: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2c6a   5948e4:	48 8b 9c 24 e8 00 00 00 	mov    0xe8(%rsp),%rbx
2c72   5948ec:	eb 3f                	jmp    59492d <shrink_lruvec+0x2cb3>
2c74   5948ee:	e8 00 00 00 00       	call   5948f3 <shrink_lruvec+0x2c79>	5948ef: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2c79   5948f3:	bf 44 00 00 00       	mov    $0x44,%edi
2c7e   5948f8:	48 8b 9c 24 e8 00 00 00 	mov    0xe8(%rsp),%rbx
2c86   594900:	48 89 de             	mov    %rbx,%rsi
2c89   594903:	e8 00 00 00 00       	call   594908 <shrink_lruvec+0x2c8e>	594904: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
2c8e   594908:	48 83 fb 43          	cmp    $0x43,%rbx
2c92   59490c:	0f 87 81 00 00 00    	ja     594993 <shrink_lruvec+0x2d19>
2c98   594912:	e8 00 00 00 00       	call   594917 <shrink_lruvec+0x2c9d>	594913: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2c9d   594917:	48 63 44 24 78       	movslq 0x78(%rsp),%rax
2ca2   59491c:	48 8b 9c 24 e8 00 00 00 	mov    0xe8(%rsp),%rbx
2caa   594924:	65 48 01 04 dd 00 00 00 00 	add    %rax,%gs:0x0(,%rbx,8)	594929: R_X86_64_32S	vm_event_states+0x60
2cb3   59492d:	31 ff                	xor    %edi,%edi
2cb5   59492f:	44 89 fe             	mov    %r15d,%esi
2cb8   594932:	e8 00 00 00 00       	call   594937 <shrink_lruvec+0x2cbd>	594933: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
2cbd   594937:	bf 40 00 00 00       	mov    $0x40,%edi
2cc2   59493c:	8b 74 24 48          	mov    0x48(%rsp),%esi
2cc6   594940:	e8 00 00 00 00       	call   594945 <shrink_lruvec+0x2ccb>	594941: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
2ccb   594945:	31 ff                	xor    %edi,%edi
2ccd   594947:	48 89 de             	mov    %rbx,%rsi
2cd0   59494a:	e8 00 00 00 00       	call   59494f <shrink_lruvec+0x2cd5>	59494b: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
2cd5   59494f:	45 85 ff             	test   %r15d,%r15d
2cd8   594952:	74 5c                	je     5949b0 <shrink_lruvec+0x2d36>
2cda   594954:	83 7c 24 48 3f       	cmpl   $0x3f,0x48(%rsp)
2cdf   594959:	7f 55                	jg     5949b0 <shrink_lruvec+0x2d36>
2ce1   59495b:	48 85 db             	test   %rbx,%rbx
2ce4   59495e:	7e 50                	jle    5949b0 <shrink_lruvec+0x2d36>
2ce6   594960:	48 ff cb             	dec    %rbx
2ce9   594963:	48 89 9c 24 e8 00 00 00 	mov    %rbx,0xe8(%rsp)
2cf1   59496b:	e8 00 00 00 00       	call   594970 <shrink_lruvec+0x2cf6>	59496c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2cf6   594970:	e9 80 dd ff ff       	jmp    5926f5 <shrink_lruvec+0xa7b>
2cfb   594975:	e8 00 00 00 00       	call   59497a <shrink_lruvec+0x2d00>	594976: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2d00   59497a:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	59497d: R_X86_64_32S	.data+0x599a20
2d07   594981:	48 8b b4 24 e8 00 00 00 	mov    0xe8(%rsp),%rsi
2d0f   594989:	e8 00 00 00 00       	call   59498e <shrink_lruvec+0x2d14>	59498a: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
2d14   59498e:	e9 e8 dd ff ff       	jmp    59277b <shrink_lruvec+0xb01>
2d19   594993:	48 83 c3 0c          	add    $0xc,%rbx
2d1d   594997:	e8 00 00 00 00       	call   59499c <shrink_lruvec+0x2d22>	594998: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2d22   59499c:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	59499f: R_X86_64_32S	.data+0x599d00
2d29   5949a3:	48 89 de             	mov    %rbx,%rsi
2d2c   5949a6:	e8 00 00 00 00       	call   5949ab <shrink_lruvec+0x2d31>	5949a7: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
2d31   5949ab:	e9 67 ff ff ff       	jmp    594917 <shrink_lruvec+0x2c9d>
2d36   5949b0:	e8 00 00 00 00       	call   5949b5 <shrink_lruvec+0x2d3b>	5949b1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2d3b   5949b5:	eb 1e                	jmp    5949d5 <shrink_lruvec+0x2d5b>
2d3d   5949b7:	e8 00 00 00 00       	call   5949bc <shrink_lruvec+0x2d42>	5949b8: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2d42   5949bc:	41 bf 00 10 00 00    	mov    $0x1000,%r15d
2d48   5949c2:	c7 44 24 38 00 00 00 00 	movl   $0x0,0x38(%rsp)
2d50   5949ca:	45 31 ed             	xor    %r13d,%r13d
2d53   5949cd:	c7 44 24 48 00 00 00 00 	movl   $0x0,0x48(%rsp)
2d5b   5949d5:	4d 89 fc             	mov    %r15,%r12
2d5e   5949d8:	65 4c 8b 34 25 00 00 00 00 	mov    %gs:0x0,%r14	5949dd: R_X86_64_32S	current_task
2d67   5949e1:	49 83 c6 2c          	add    $0x2c,%r14
2d6b   5949e5:	4c 89 f0             	mov    %r14,%rax
2d6e   5949e8:	48 c1 e8 03          	shr    $0x3,%rax
2d72   5949ec:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
2d7c   5949f6:	8a 04 08             	mov    (%rax,%rcx,1),%al
2d7f   5949f9:	84 c0                	test   %al,%al
2d81   5949fb:	0f 85 f7 00 00 00    	jne    594af8 <shrink_lruvec+0x2e7e>
2d87   594a01:	4c 63 7c 24 48       	movslq 0x48(%rsp),%r15
2d8c   594a06:	31 db                	xor    %ebx,%ebx
2d8e   594a08:	41 8b 36             	mov    (%r14),%esi
2d91   594a0b:	b8 00 00 02 00       	mov    $0x20000,%eax
2d96   594a10:	21 c6                	and    %eax,%esi
2d98   594a12:	0f 94 c3             	sete   %bl
2d9b   594a15:	31 ff                	xor    %edi,%edi
2d9d   594a17:	e8 00 00 00 00       	call   594a1c <shrink_lruvec+0x2da2>	594a18: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
2da2   594a1c:	65 4c 01 3c dd 00 00 00 00 	add    %r15,%gs:0x0(,%rbx,8)	594a21: R_X86_64_32S	vm_event_states+0xe8
2dab   594a25:	48 63 44 24 38       	movslq 0x38(%rsp),%rax
2db0   594a2a:	65 48 01 05 00 00 00 00 	add    %rax,%gs:0x0(%rip)        # 594a32 <shrink_lruvec+0x2db8>	594a2e: R_X86_64_PC32	vm_event_states+0xb4
2db8   594a32:	48 8b 84 24 c8 00 00 00 	mov    0xc8(%rsp),%rax
2dc0   594a3a:	65 4c 01 3c c5 00 00 00 00 	add    %r15,%gs:0x0(,%rax,8)	594a3f: R_X86_64_32S	vm_event_states+0x100
2dc9   594a43:	31 ff                	xor    %edi,%edi
2dcb   594a45:	44 89 fe             	mov    %r15d,%esi
2dce   594a48:	e8 00 00 00 00       	call   594a4d <shrink_lruvec+0x2dd3>	594a49: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
2dd3   594a4d:	45 85 ff             	test   %r15d,%r15d
2dd6   594a50:	41 0f 94 c6          	sete   %r14b
2dda   594a54:	31 ff                	xor    %edi,%edi
2ddc   594a56:	4c 89 e3             	mov    %r12,%rbx
2ddf   594a59:	89 de                	mov    %ebx,%esi
2de1   594a5b:	e8 00 00 00 00       	call   594a60 <shrink_lruvec+0x2de6>	594a5c: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
2de6   594a60:	85 db                	test   %ebx,%ebx
2de8   594a62:	0f 95 c3             	setne  %bl
2deb   594a65:	31 ff                	xor    %edi,%edi
2ded   594a67:	44 89 ee             	mov    %r13d,%esi
2df0   594a6a:	e8 00 00 00 00       	call   594a6f <shrink_lruvec+0x2df5>	594a6b: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
2df5   594a6f:	41 84 de             	test   %bl,%r14b
2df8   594a72:	75 09                	jne    594a7d <shrink_lruvec+0x2e03>
2dfa   594a74:	45 85 ed             	test   %r13d,%r13d
2dfd   594a77:	0f 85 a3 00 00 00    	jne    594b20 <shrink_lruvec+0x2ea6>
2e03   594a7d:	e8 00 00 00 00       	call   594a82 <shrink_lruvec+0x2e08>	594a7e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2e08   594a82:	4c 8b b4 24 b0 00 00 00 	mov    0xb0(%rsp),%r14
2e10   594a8a:	31 ff                	xor    %edi,%edi
2e12   594a8c:	48 8b 9c 24 98 00 00 00 	mov    0x98(%rsp),%rbx
2e1a   594a94:	89 de                	mov    %ebx,%esi
2e1c   594a96:	e8 00 00 00 00       	call   594a9b <shrink_lruvec+0x2e21>	594a97: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
2e21   594a9b:	85 db                	test   %ebx,%ebx
2e23   594a9d:	0f 94 c0             	sete   %al
2e26   594aa0:	31 c9                	xor    %ecx,%ecx
2e28   594aa2:	88 c1                	mov    %al,%cl
2e2a   594aa4:	48 89 8c 24 98 00 00 00 	mov    %rcx,0x98(%rsp)
2e32   594aac:	8b 84 24 f0 01 00 00 	mov    0x1f0(%rsp),%eax
2e39   594ab3:	ff c0                	inc    %eax
2e3b   594ab5:	83 f8 02             	cmp    $0x2,%eax
2e3e   594ab8:	74 5c                	je     594b16 <shrink_lruvec+0x2e9c>
2e40   594aba:	89 84 24 f0 01 00 00 	mov    %eax,0x1f0(%rsp)
2e47   594ac1:	e8 00 00 00 00       	call   594ac6 <shrink_lruvec+0x2e4c>	594ac2: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2e4c   594ac6:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
2e52   594acc:	e9 e9 d8 ff ff       	jmp    5923ba <shrink_lruvec+0x740>
2e57   594ad1:	89 d1                	mov    %edx,%ecx
2e59   594ad3:	80 e1 07             	and    $0x7,%cl
2e5c   594ad6:	38 c1                	cmp    %al,%cl
2e5e   594ad8:	0f 8c c4 db ff ff    	jl     5926a2 <shrink_lruvec+0xa28>
2e64   594ade:	48 8b bc 24 f0 00 00 00 	mov    0xf0(%rsp),%rdi
2e6c   594ae6:	e8 00 00 00 00       	call   594aeb <shrink_lruvec+0x2e71>	594ae7: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
2e71   594aeb:	48 8b 94 24 f0 00 00 00 	mov    0xf0(%rsp),%rdx
2e79   594af3:	e9 aa db ff ff       	jmp    5926a2 <shrink_lruvec+0xa28>
2e7e   594af8:	44 89 f1             	mov    %r14d,%ecx
2e81   594afb:	80 e1 07             	and    $0x7,%cl
2e84   594afe:	80 c1 03             	add    $0x3,%cl
2e87   594b01:	38 c1                	cmp    %al,%cl
2e89   594b03:	0f 8c f8 fe ff ff    	jl     594a01 <shrink_lruvec+0x2d87>
2e8f   594b09:	4c 89 f7             	mov    %r14,%rdi
2e92   594b0c:	e8 00 00 00 00       	call   594b11 <shrink_lruvec+0x2e97>	594b0d: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
2e97   594b11:	e9 eb fe ff ff       	jmp    594a01 <shrink_lruvec+0x2d87>
2e9c   594b16:	e8 00 00 00 00       	call   594b1b <shrink_lruvec+0x2ea1>	594b17: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2ea1   594b1b:	45 31 ed             	xor    %r13d,%r13d
2ea4   594b1e:	eb 0d                	jmp    594b2d <shrink_lruvec+0x2eb3>
2ea6   594b20:	e8 00 00 00 00       	call   594b25 <shrink_lruvec+0x2eab>	594b21: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2eab   594b25:	4c 8b b4 24 b0 00 00 00 	mov    0xb0(%rsp),%r14
2eb3   594b2d:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
2ebd   594b37:	48 8b 8c 24 50 02 00 00 	mov    0x250(%rsp),%rcx
2ec5   594b3f:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
2ec9   594b43:	48 8b 84 24 78 01 00 00 	mov    0x178(%rsp),%rax
2ed1   594b4b:	74 15                	je     594b62 <shrink_lruvec+0x2ee8>
2ed3   594b4d:	48 8b bc 24 78 01 00 00 	mov    0x178(%rsp),%rdi
2edb   594b55:	e8 00 00 00 00       	call   594b5a <shrink_lruvec+0x2ee0>	594b56: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2ee0   594b5a:	48 8b 84 24 78 01 00 00 	mov    0x178(%rsp),%rax
2ee8   594b62:	48 8b 18             	mov    (%rax),%rbx
2eeb   594b65:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
2ef5   594b6f:	48 8b 8c 24 a0 00 00 00 	mov    0xa0(%rsp),%rcx
2efd   594b77:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
2f01   594b7b:	74 0a                	je     594b87 <shrink_lruvec+0x2f0d>
2f03   594b7d:	48 8d 7c 24 60       	lea    0x60(%rsp),%rdi
2f08   594b82:	e8 00 00 00 00       	call   594b87 <shrink_lruvec+0x2f0d>	594b83: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
2f0d   594b87:	48 89 5c 24 60       	mov    %rbx,0x60(%rsp)
2f12   594b8c:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
2f1c   594b96:	48 8b 8c 24 48 02 00 00 	mov    0x248(%rsp),%rcx
2f24   594b9e:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
2f28   594ba2:	48 8b 9c 24 20 02 00 00 	mov    0x220(%rsp),%rbx
2f30   594baa:	74 08                	je     594bb4 <shrink_lruvec+0x2f3a>
2f32   594bac:	48 89 df             	mov    %rbx,%rdi
2f35   594baf:	e8 00 00 00 00       	call   594bb4 <shrink_lruvec+0x2f3a>	594bb0: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2f3a   594bb4:	48 8b 03             	mov    (%rbx),%rax
2f3d   594bb7:	48 89 44 24 78       	mov    %rax,0x78(%rsp)
2f42   594bbc:	48 8d 7c 24 68       	lea    0x68(%rsp),%rdi
2f47   594bc1:	48 89 f9             	mov    %rdi,%rcx
2f4a   594bc4:	48 c1 e9 03          	shr    $0x3,%rcx
2f4e   594bc8:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
2f58   594bd2:	48 89 4c 24 48       	mov    %rcx,0x48(%rsp)
2f5d   594bd7:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
2f61   594bdb:	74 05                	je     594be2 <shrink_lruvec+0x2f68>
2f63   594bdd:	e8 00 00 00 00       	call   594be2 <shrink_lruvec+0x2f68>	594bde: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
2f68   594be2:	45 31 ff             	xor    %r15d,%r15d
2f6b   594be5:	83 7c 24 34 00       	cmpl   $0x0,0x34(%rsp)
2f70   594bea:	0f 94 c3             	sete   %bl
2f73   594bed:	48 8b 44 24 78       	mov    0x78(%rsp),%rax
2f78   594bf2:	48 89 44 24 68       	mov    %rax,0x68(%rsp)
2f7d   594bf7:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
2f87   594c01:	48 8b 8c 24 e8 01 00 00 	mov    0x1e8(%rsp),%rcx
2f8f   594c09:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
2f93   594c0d:	74 08                	je     594c17 <shrink_lruvec+0x2f9d>
2f95   594c0f:	4c 89 f7             	mov    %r14,%rdi
2f98   594c12:	e8 00 00 00 00       	call   594c17 <shrink_lruvec+0x2f9d>	594c13: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2f9d   594c17:	41 88 df             	mov    %bl,%r15b
2fa0   594c1a:	49 8b 06             	mov    (%r14),%rax
2fa3   594c1d:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
2fa8   594c22:	4c 89 fa             	mov    %r15,%rdx
2fab   594c25:	48 c1 e2 06          	shl    $0x6,%rdx
2faf   594c29:	48 8b 84 24 00 03 00 00 	mov    0x300(%rsp),%rax
2fb7   594c31:	48 8d 0c 10          	lea    (%rax,%rdx,1),%rcx
2fbb   594c35:	48 89 4c 24 28       	mov    %rcx,0x28(%rsp)
2fc0   594c3a:	48 01 c2             	add    %rax,%rdx
2fc3   594c3d:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
2fc8   594c42:	4c 89 f8             	mov    %r15,%rax
2fcb   594c45:	4c 89 7c 24 58       	mov    %r15,0x58(%rsp)
2fd0   594c4a:	44 89 6c 24 40       	mov    %r13d,0x40(%rsp)
2fd5   594c4f:	4a 8d 1c fc          	lea    (%rsp,%r15,8),%rbx
2fd9   594c53:	48 83 c3 60          	add    $0x60,%rbx
2fdd   594c57:	48 89 d9             	mov    %rbx,%rcx
2fe0   594c5a:	48 c1 e9 03          	shr    $0x3,%rcx
2fe4   594c5e:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
2fee   594c68:	48 89 0c 24          	mov    %rcx,(%rsp)
2ff2   594c6c:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
2ff6   594c70:	74 08                	je     594c7a <shrink_lruvec+0x3000>
2ff8   594c72:	48 89 df             	mov    %rbx,%rdi
2ffb   594c75:	e8 00 00 00 00       	call   594c7a <shrink_lruvec+0x3000>	594c76: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
3000   594c7a:	48 89 5c 24 18       	mov    %rbx,0x18(%rsp)
3005   594c7f:	48 8b 03             	mov    (%rbx),%rax
3008   594c82:	49 89 c4             	mov    %rax,%r12
300b   594c85:	4c 8d 70 02          	lea    0x2(%rax),%r14
300f   594c89:	4c 89 f7             	mov    %r14,%rdi
3012   594c8c:	48 8b 5c 24 38       	mov    0x38(%rsp),%rbx
3017   594c91:	48 89 de             	mov    %rbx,%rsi
301a   594c94:	e8 00 00 00 00       	call   594c99 <shrink_lruvec+0x301f>	594c95: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
301f   594c99:	49 39 de             	cmp    %rbx,%r14
3022   594c9c:	76 13                	jbe    594cb1 <shrink_lruvec+0x3037>
3024   594c9e:	e8 00 00 00 00       	call   594ca3 <shrink_lruvec+0x3029>	594c9f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3029   594ca3:	48 8b 0c 24          	mov    (%rsp),%rcx
302d   594ca7:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
3032   594cac:	e9 8c 00 00 00       	jmp    594d3d <shrink_lruvec+0x30c3>
3037   594cb1:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
303c   594cb6:	4c 89 64 24 20       	mov    %r12,0x20(%rsp)
3041   594cbb:	44 89 e3             	mov    %r12d,%ebx
3044   594cbe:	83 e3 03             	and    $0x3,%ebx
3047   594cc1:	48 c1 e3 07          	shl    $0x7,%rbx
304b   594cc5:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
3050   594cca:	4c 8d 34 18          	lea    (%rax,%rbx,1),%r14
3054   594cce:	48 01 cb             	add    %rcx,%rbx
3057   594cd1:	45 31 e4             	xor    %r12d,%r12d
305a   594cd4:	4f 8d 2c 26          	lea    (%r14,%r12,1),%r13
305e   594cd8:	4a 8d 3c 23          	lea    (%rbx,%r12,1),%rdi
3062   594cdc:	48 89 f8             	mov    %rdi,%rax
3065   594cdf:	48 c1 e8 03          	shr    $0x3,%rax
3069   594ce3:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
3073   594ced:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
3077   594cf1:	74 05                	je     594cf8 <shrink_lruvec+0x307e>
3079   594cf3:	e8 00 00 00 00       	call   594cf8 <shrink_lruvec+0x307e>	594cf4: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
307e   594cf8:	4d 3b 6d 00          	cmp    0x0(%r13),%r13
3082   594cfc:	75 2c                	jne    594d2a <shrink_lruvec+0x30b0>
3084   594cfe:	49 83 fc 30          	cmp    $0x30,%r12
3088   594d02:	74 0b                	je     594d0f <shrink_lruvec+0x3095>
308a   594d04:	e8 00 00 00 00       	call   594d09 <shrink_lruvec+0x308f>	594d05: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
308f   594d09:	49 83 c4 10          	add    $0x10,%r12
3093   594d0d:	eb c5                	jmp    594cd4 <shrink_lruvec+0x305a>
3095   594d0f:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
309a   594d14:	4c 8d 60 01          	lea    0x1(%rax),%r12
309e   594d18:	48 83 c0 03          	add    $0x3,%rax
30a2   594d1c:	48 3b 44 24 38       	cmp    0x38(%rsp),%rax
30a7   594d21:	77 5b                	ja     594d7e <shrink_lruvec+0x3104>
30a9   594d23:	e8 00 00 00 00       	call   594d28 <shrink_lruvec+0x30ae>	594d24: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
30ae   594d28:	eb 87                	jmp    594cb1 <shrink_lruvec+0x3037>
30b0   594d2a:	e8 00 00 00 00       	call   594d2f <shrink_lruvec+0x30b5>	594d2b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
30b5   594d2f:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
30ba   594d34:	48 8b 0c 24          	mov    (%rsp),%rcx
30be   594d38:	4c 8b 64 24 20       	mov    0x20(%rsp),%r12
30c3   594d3d:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
30cd   594d47:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
30d1   594d4b:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
30d6   594d50:	74 05                	je     594d57 <shrink_lruvec+0x30dd>
30d8   594d52:	e8 00 00 00 00       	call   594d57 <shrink_lruvec+0x30dd>	594d53: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
30dd   594d57:	4e 89 64 fc 60       	mov    %r12,0x60(%rsp,%r15,8)
30e2   594d5c:	49 ff c7             	inc    %r15
30e5   594d5f:	49 83 ff 02          	cmp    $0x2,%r15
30e9   594d63:	74 29                	je     594d8e <shrink_lruvec+0x3114>
30eb   594d65:	e8 00 00 00 00       	call   594d6a <shrink_lruvec+0x30f0>	594d66: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
30f0   594d6a:	48 83 44 24 28 40    	addq   $0x40,0x28(%rsp)
30f6   594d70:	48 83 c3 40          	add    $0x40,%rbx
30fa   594d74:	48 89 5c 24 08       	mov    %rbx,0x8(%rsp)
30ff   594d79:	e9 d1 fe ff ff       	jmp    594c4f <shrink_lruvec+0x2fd5>
3104   594d7e:	e8 00 00 00 00       	call   594d83 <shrink_lruvec+0x3109>	594d7f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3109   594d83:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
310e   594d88:	48 8b 0c 24          	mov    (%rsp),%rcx
3112   594d8c:	eb af                	jmp    594d3d <shrink_lruvec+0x30c3>
3114   594d8e:	83 7c 24 34 00       	cmpl   $0x0,0x34(%rsp)
3119   594d93:	0f 84 cb 00 00 00    	je     594e64 <shrink_lruvec+0x31ea>
311f   594d99:	e8 00 00 00 00       	call   594d9e <shrink_lruvec+0x3124>	594d9a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3124   594d9e:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
312e   594da8:	48 8b 8c 24 a0 00 00 00 	mov    0xa0(%rsp),%rcx
3136   594db0:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
313a   594db4:	74 0a                	je     594dc0 <shrink_lruvec+0x3146>
313c   594db6:	48 8d 7c 24 60       	lea    0x60(%rsp),%rdi
3141   594dbb:	e8 00 00 00 00       	call   594dc0 <shrink_lruvec+0x3146>	594dbc: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
3146   594dc0:	4c 8b 7c 24 60       	mov    0x60(%rsp),%r15
314b   594dc5:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
3155   594dcf:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
315a   594dd4:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
315e   594dd8:	74 0a                	je     594de4 <shrink_lruvec+0x316a>
3160   594dda:	48 8d 7c 24 68       	lea    0x68(%rsp),%rdi
3165   594ddf:	e8 00 00 00 00       	call   594de4 <shrink_lruvec+0x316a>	594de0: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
316a   594de4:	4c 8b 74 24 68       	mov    0x68(%rsp),%r14
316f   594de9:	4c 89 ff             	mov    %r15,%rdi
3172   594dec:	4c 89 f6             	mov    %r14,%rsi
3175   594def:	e8 00 00 00 00       	call   594df4 <shrink_lruvec+0x317a>	594df0: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
317a   594df4:	4d 39 f7             	cmp    %r14,%r15
317d   594df7:	4d 0f 42 f7          	cmovb  %r15,%r14
3181   594dfb:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
318b   594e05:	48 8b 8c 24 a0 00 00 00 	mov    0xa0(%rsp),%rcx
3193   594e0d:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
3197   594e11:	74 0a                	je     594e1d <shrink_lruvec+0x31a3>
3199   594e13:	48 8d 7c 24 60       	lea    0x60(%rsp),%rdi
319e   594e18:	e8 00 00 00 00       	call   594e1d <shrink_lruvec+0x31a3>	594e19: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
31a3   594e1d:	4c 89 74 24 60       	mov    %r14,0x60(%rsp)
31a8   594e22:	4c 89 f7             	mov    %r14,%rdi
31ab   594e25:	48 8b 5c 24 78       	mov    0x78(%rsp),%rbx
31b0   594e2a:	48 89 de             	mov    %rbx,%rsi
31b3   594e2d:	e8 00 00 00 00       	call   594e32 <shrink_lruvec+0x31b8>	594e2e: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
31b8   594e32:	49 39 de             	cmp    %rbx,%r14
31bb   594e35:	49 0f 47 de          	cmova  %r14,%rbx
31bf   594e39:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
31c9   594e43:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
31ce   594e48:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
31d2   594e4c:	4c 8b 7c 24 58       	mov    0x58(%rsp),%r15
31d7   594e51:	74 0a                	je     594e5d <shrink_lruvec+0x31e3>
31d9   594e53:	48 8d 7c 24 68       	lea    0x68(%rsp),%rdi
31de   594e58:	e8 00 00 00 00       	call   594e5d <shrink_lruvec+0x31e3>	594e59: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
31e3   594e5d:	48 89 5c 24 68       	mov    %rbx,0x68(%rsp)
31e8   594e62:	eb 0a                	jmp    594e6e <shrink_lruvec+0x31f4>
31ea   594e64:	e8 00 00 00 00       	call   594e69 <shrink_lruvec+0x31ef>	594e65: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
31ef   594e69:	4c 8b 7c 24 58       	mov    0x58(%rsp),%r15
31f4   594e6e:	c7 44 24 08 00 00 00 00 	movl   $0x0,0x8(%rsp)
31fc   594e76:	4a 8d 3c fc          	lea    (%rsp,%r15,8),%rdi
3200   594e7a:	48 83 c7 60          	add    $0x60,%rdi
3204   594e7e:	48 89 f8             	mov    %rdi,%rax
3207   594e81:	48 c1 e8 03          	shr    $0x3,%rax
320b   594e85:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
3215   594e8f:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
3219   594e93:	74 05                	je     594e9a <shrink_lruvec+0x3220>
321b   594e95:	e8 00 00 00 00       	call   594e9a <shrink_lruvec+0x3220>	594e96: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
3220   594e9a:	4e 8b 74 fc 60       	mov    0x60(%rsp,%r15,8),%r14
3225   594e9f:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
322a   594ea4:	4e 8d 24 f8          	lea    (%rax,%r15,8),%r12
322e   594ea8:	49 81 c4 c8 00 00 00 	add    $0xc8,%r12
3235   594eaf:	4d 89 e5             	mov    %r12,%r13
3238   594eb2:	49 c1 ed 03          	shr    $0x3,%r13
323c   594eb6:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
3246   594ec0:	41 80 7c 05 00 00    	cmpb   $0x0,0x0(%r13,%rax,1)
324c   594ec6:	74 08                	je     594ed0 <shrink_lruvec+0x3256>
324e   594ec8:	4c 89 e7             	mov    %r12,%rdi
3251   594ecb:	e8 00 00 00 00       	call   594ed0 <shrink_lruvec+0x3256>	594ecc: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
3256   594ed0:	49 8b 1c 24          	mov    (%r12),%rbx
325a   594ed4:	4c 89 f7             	mov    %r14,%rdi
325d   594ed7:	48 89 de             	mov    %rbx,%rsi
3260   594eda:	e8 00 00 00 00       	call   594edf <shrink_lruvec+0x3265>	594edb: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
3265   594edf:	49 39 de             	cmp    %rbx,%r14
3268   594ee2:	75 07                	jne    594eeb <shrink_lruvec+0x3271>
326a   594ee4:	e8 00 00 00 00       	call   594ee9 <shrink_lruvec+0x326f>	594ee5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
326f   594ee9:	eb 3b                	jmp    594f26 <shrink_lruvec+0x32ac>
3271   594eeb:	e8 00 00 00 00       	call   594ef0 <shrink_lruvec+0x3276>	594eec: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3276   594ef0:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
327b   594ef5:	44 89 fe             	mov    %r15d,%esi
327e   594ef8:	ba 01 00 00 00       	mov    $0x1,%edx
3283   594efd:	e8 a2 81 00 00       	call   59d0a4 <reset_ctrl_pos>
3288   594f02:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
3292   594f0c:	41 80 7c 05 00 00    	cmpb   $0x0,0x0(%r13,%rax,1)
3298   594f12:	74 08                	je     594f1c <shrink_lruvec+0x32a2>
329a   594f14:	4c 89 e7             	mov    %r12,%rdi
329d   594f17:	e8 00 00 00 00       	call   594f1c <shrink_lruvec+0x32a2>	594f18: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
32a2   594f1c:	4d 89 34 24          	mov    %r14,(%r12)
32a6   594f20:	b0 01                	mov    $0x1,%al
32a8   594f22:	89 44 24 08          	mov    %eax,0x8(%rsp)
32ac   594f26:	4c 8d ac 24 38 01 00 00 	lea    0x138(%rsp),%r13
32b4   594f2e:	4d 85 ff             	test   %r15,%r15
32b7   594f31:	48 8b 9c 24 b0 00 00 00 	mov    0xb0(%rsp),%rbx
32bf   594f39:	75 10                	jne    594f4b <shrink_lruvec+0x32d1>
32c1   594f3b:	e8 00 00 00 00       	call   594f40 <shrink_lruvec+0x32c6>	594f3c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
32c6   594f40:	41 bf 01 00 00 00    	mov    $0x1,%r15d
32cc   594f46:	e9 2b ff ff ff       	jmp    594e76 <shrink_lruvec+0x31fc>
32d1   594f4b:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
32db   594f55:	48 8b 8c 24 e8 01 00 00 	mov    0x1e8(%rsp),%rcx
32e3   594f5d:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
32e7   594f61:	74 08                	je     594f6b <shrink_lruvec+0x32f1>
32e9   594f63:	48 89 df             	mov    %rbx,%rdi
32ec   594f66:	e8 00 00 00 00       	call   594f6b <shrink_lruvec+0x32f1>	594f67: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
32f1   594f6b:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
32f6   594f70:	4c 8b b8 c0 00 00 00 	mov    0xc0(%rax),%r15
32fd   594f77:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
3302   594f7c:	4c 8d 34 c8          	lea    (%rax,%rcx,8),%r14
3306   594f80:	49 81 c6 c8 00 00 00 	add    $0xc8,%r14
330d   594f87:	4c 89 f0             	mov    %r14,%rax
3310   594f8a:	48 c1 e8 03          	shr    $0x3,%rax
3314   594f8e:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
331e   594f98:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
3322   594f9c:	74 08                	je     594fa6 <shrink_lruvec+0x332c>
3324   594f9e:	4c 89 f7             	mov    %r14,%rdi
3327   594fa1:	e8 00 00 00 00       	call   594fa6 <shrink_lruvec+0x332c>	594fa2: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
332c   594fa6:	4d 8b 26             	mov    (%r14),%r12
332f   594fa9:	48 8b bc 24 18 02 00 00 	mov    0x218(%rsp),%rdi
3337   594fb1:	e8 00 00 00 00       	call   594fb6 <shrink_lruvec+0x333c>	594fb2: R_X86_64_PLT32	_raw_spin_unlock_irq-0x4
333c   594fb6:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
3346   594fc0:	48 8b 8c 24 80 01 00 00 	mov    0x180(%rsp),%rcx
334e   594fc8:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
3352   594fcc:	4c 8d b4 24 f8 00 00 00 	lea    0xf8(%rsp),%r14
335a   594fd4:	74 08                	je     594fde <shrink_lruvec+0x3364>
335c   594fd6:	4c 89 f7             	mov    %r14,%rdi
335f   594fd9:	e8 00 00 00 00       	call   594fde <shrink_lruvec+0x3364>	594fda: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
3364   594fde:	48 8b 84 24 f8 00 00 00 	mov    0xf8(%rsp),%rax
336c   594fe6:	4c 39 f0             	cmp    %r14,%rax
336f   594fe9:	0f 84 df 02 00 00    	je     5952ce <shrink_lruvec+0x3654>
3375   594fef:	4c 89 64 24 18       	mov    %r12,0x18(%rsp)
337a   594ff4:	4c 89 f7             	mov    %r14,%rdi
337d   594ff7:	48 8b b4 24 88 00 00 00 	mov    0x88(%rsp),%rsi
3385   594fff:	48 8b 54 24 50       	mov    0x50(%rsp),%rdx
338a   595004:	48 8d 8c 24 30 01 00 00 	lea    0x130(%rsp),%rcx
3392   59500c:	45 31 c0             	xor    %r8d,%r8d
3395   59500f:	e8 0e bf fe ff       	call   580f22 <shrink_page_list>
339a   595014:	89 04 24             	mov    %eax,(%rsp)
339d   595017:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
33a7   595021:	48 8b 8c 24 80 01 00 00 	mov    0x180(%rsp),%rcx
33af   595029:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
33b3   59502d:	4c 89 f3             	mov    %r14,%rbx
33b6   595030:	74 08                	je     59503a <shrink_lruvec+0x33c0>
33b8   595032:	48 89 df             	mov    %rbx,%rdi
33bb   595035:	e8 00 00 00 00       	call   59503a <shrink_lruvec+0x33c0>	595036: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
33c0   59503a:	4c 8b a4 24 f8 00 00 00 	mov    0xf8(%rsp),%r12
33c8   595042:	4c 39 e3             	cmp    %r12,%rbx
33cb   595045:	75 0f                	jne    595056 <shrink_lruvec+0x33dc>
33cd   595047:	e8 00 00 00 00       	call   59504c <shrink_lruvec+0x33d2>	595048: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
33d2   59504c:	e9 b9 01 00 00       	jmp    59520a <shrink_lruvec+0x3590>
33d7   595051:	e8 00 00 00 00       	call   595056 <shrink_lruvec+0x33dc>	595052: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
33dc   595056:	4d 8d 6c 24 f8       	lea    -0x8(%r12),%r13
33e1   59505b:	4c 89 ef             	mov    %r13,%rdi
33e4   59505e:	be 08 00 00 00       	mov    $0x8,%esi
33e9   595063:	e8 00 00 00 00       	call   595068 <shrink_lruvec+0x33ee>	595064: R_X86_64_PLT32	__kasan_check_read-0x4
33ee   595068:	4d 89 ee             	mov    %r13,%r14
33f1   59506b:	49 c1 ee 03          	shr    $0x3,%r14
33f5   59506f:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
33ff   595079:	41 80 3c 06 00       	cmpb   $0x0,(%r14,%rax,1)
3404   59507e:	74 08                	je     595088 <shrink_lruvec+0x340e>
3406   595080:	4c 89 ef             	mov    %r13,%rdi
3409   595083:	e8 00 00 00 00       	call   595088 <shrink_lruvec+0x340e>	595084: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
340e   595088:	49 8b 5d 00          	mov    0x0(%r13),%rbx
3412   59508c:	48 89 de             	mov    %rbx,%rsi
3415   59508f:	48 83 e6 40          	and    $0x40,%rsi
3419   595093:	31 ff                	xor    %edi,%edi
341b   595095:	e8 00 00 00 00       	call   59509a <shrink_lruvec+0x3420>	595096: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
3420   59509a:	48 83 e3 40          	and    $0x40,%rbx
3424   59509e:	75 07                	jne    5950a7 <shrink_lruvec+0x342d>
3426   5950a0:	e8 00 00 00 00       	call   5950a5 <shrink_lruvec+0x342b>	5950a1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
342b   5950a5:	eb 18                	jmp    5950bf <shrink_lruvec+0x3445>
342d   5950a7:	e8 00 00 00 00       	call   5950ac <shrink_lruvec+0x3432>	5950a8: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3432   5950ac:	4c 89 ef             	mov    %r13,%rdi
3435   5950af:	be 08 00 00 00       	mov    $0x8,%esi
343a   5950b4:	e8 00 00 00 00       	call   5950b9 <shrink_lruvec+0x343f>	5950b5: R_X86_64_PLT32	__kasan_check_write-0x4
343f   5950b9:	f0 41 80 4d 00 02    	lock orb $0x2,0x0(%r13)
3445   5950bf:	4c 89 ef             	mov    %r13,%rdi
3448   5950c2:	be 08 00 00 00       	mov    $0x8,%esi
344d   5950c7:	e8 00 00 00 00       	call   5950cc <shrink_lruvec+0x3452>	5950c8: R_X86_64_PLT32	__kasan_check_read-0x4
3452   5950cc:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
345c   5950d6:	41 80 3c 06 00       	cmpb   $0x0,(%r14,%rax,1)
3461   5950db:	74 08                	je     5950e5 <shrink_lruvec+0x346b>
3463   5950dd:	4c 89 ef             	mov    %r13,%rdi
3466   5950e0:	e8 00 00 00 00       	call   5950e5 <shrink_lruvec+0x346b>	5950e1: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
346b   5950e5:	49 8b 5d 00          	mov    0x0(%r13),%rbx
346f   5950e9:	be 00 00 04 00       	mov    $0x40000,%esi
3474   5950ee:	48 21 de             	and    %rbx,%rsi
3477   5950f1:	31 ff                	xor    %edi,%edi
3479   5950f3:	e8 00 00 00 00       	call   5950f8 <shrink_lruvec+0x347e>	5950f4: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
347e   5950f8:	b8 00 00 04 00       	mov    $0x40000,%eax
3483   5950fd:	48 21 c3             	and    %rax,%rbx
3486   595100:	75 25                	jne    595127 <shrink_lruvec+0x34ad>
3488   595102:	e8 00 00 00 00       	call   595107 <shrink_lruvec+0x348d>	595103: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
348d   595107:	48 8d 9c 24 f8 00 00 00 	lea    0xf8(%rsp),%rbx
3495   59510f:	4c 89 ef             	mov    %r13,%rdi
3498   595112:	be 08 00 00 00       	mov    $0x8,%esi
349d   595117:	e8 00 00 00 00       	call   59511c <shrink_lruvec+0x34a2>	595118: R_X86_64_PLT32	__kasan_check_write-0x4
34a2   59511c:	f0 41 80 4d 00 20    	lock orb $0x20,0x0(%r13)
34a8   595122:	e9 b2 00 00 00       	jmp    5951d9 <shrink_lruvec+0x355f>
34ad   595127:	4c 89 ef             	mov    %r13,%rdi
34b0   59512a:	be 08 00 00 00       	mov    $0x8,%esi
34b5   59512f:	e8 00 00 00 00       	call   595134 <shrink_lruvec+0x34ba>	595130: R_X86_64_PLT32	__kasan_check_read-0x4
34ba   595134:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
34c4   59513e:	41 80 3c 06 00       	cmpb   $0x0,(%r14,%rax,1)
34c9   595143:	74 08                	je     59514d <shrink_lruvec+0x34d3>
34cb   595145:	4c 89 ef             	mov    %r13,%rdi
34ce   595148:	e8 00 00 00 00       	call   59514d <shrink_lruvec+0x34d3>	595149: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
34d3   59514d:	49 8b 5d 00          	mov    0x0(%r13),%rbx
34d7   595151:	48 89 de             	mov    %rbx,%rsi
34da   595154:	48 83 e6 08          	and    $0x8,%rsi
34de   595158:	31 ff                	xor    %edi,%edi
34e0   59515a:	e8 00 00 00 00       	call   59515f <shrink_lruvec+0x34e5>	59515b: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
34e5   59515f:	48 83 e3 08          	and    $0x8,%rbx
34e9   595163:	75 4d                	jne    5951b2 <shrink_lruvec+0x3538>
34eb   595165:	4c 89 ef             	mov    %r13,%rdi
34ee   595168:	be 08 00 00 00       	mov    $0x8,%esi
34f3   59516d:	e8 00 00 00 00       	call   595172 <shrink_lruvec+0x34f8>	59516e: R_X86_64_PLT32	__kasan_check_read-0x4
34f8   595172:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
3502   59517c:	41 80 3c 06 00       	cmpb   $0x0,(%r14,%rax,1)
3507   595181:	74 08                	je     59518b <shrink_lruvec+0x3511>
3509   595183:	4c 89 ef             	mov    %r13,%rdi
350c   595186:	e8 00 00 00 00       	call   59518b <shrink_lruvec+0x3511>	595187: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
3511   59518b:	49 8b 5d 00          	mov    0x0(%r13),%rbx
3515   59518f:	be 00 80 00 00       	mov    $0x8000,%esi
351a   595194:	48 21 de             	and    %rbx,%rsi
351d   595197:	31 ff                	xor    %edi,%edi
351f   595199:	e8 00 00 00 00       	call   59519e <shrink_lruvec+0x3524>	59519a: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
3524   59519e:	b8 00 80 00 00       	mov    $0x8000,%eax
3529   5951a3:	48 21 c3             	and    %rax,%rbx
352c   5951a6:	75 11                	jne    5951b9 <shrink_lruvec+0x353f>
352e   5951a8:	e8 00 00 00 00       	call   5951ad <shrink_lruvec+0x3533>	5951a9: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3533   5951ad:	e9 55 ff ff ff       	jmp    595107 <shrink_lruvec+0x348d>
3538   5951b2:	e8 00 00 00 00       	call   5951b7 <shrink_lruvec+0x353d>	5951b3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
353d   5951b7:	eb 05                	jmp    5951be <shrink_lruvec+0x3544>
353f   5951b9:	e8 00 00 00 00       	call   5951be <shrink_lruvec+0x3544>	5951ba: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3544   5951be:	48 8d 9c 24 f8 00 00 00 	lea    0xf8(%rsp),%rbx
354c   5951c6:	4c 89 ef             	mov    %r13,%rdi
354f   5951c9:	be 08 00 00 00       	mov    $0x8,%esi
3554   5951ce:	e8 00 00 00 00       	call   5951d3 <shrink_lruvec+0x3559>	5951cf: R_X86_64_PLT32	__kasan_check_write-0x4
3559   5951d3:	f0 41 80 65 00 df    	lock andb $0xdf,0x0(%r13)
355f   5951d9:	4c 89 e0             	mov    %r12,%rax
3562   5951dc:	48 c1 e8 03          	shr    $0x3,%rax
3566   5951e0:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
3570   5951ea:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
3574   5951ee:	74 08                	je     5951f8 <shrink_lruvec+0x357e>
3576   5951f0:	4c 89 e7             	mov    %r12,%rdi
3579   5951f3:	e8 00 00 00 00       	call   5951f8 <shrink_lruvec+0x357e>	5951f4: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
357e   5951f8:	4d 8b 24 24          	mov    (%r12),%r12
3582   5951fc:	4c 39 e3             	cmp    %r12,%rbx
3585   5951ff:	0f 85 4c fe ff ff    	jne    595051 <shrink_lruvec+0x33d7>
358b   595205:	e8 00 00 00 00       	call   59520a <shrink_lruvec+0x3590>	595206: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3590   59520a:	48 8b bc 24 18 02 00 00 	mov    0x218(%rsp),%rdi
3598   595212:	e8 00 00 00 00       	call   595217 <shrink_lruvec+0x359d>	595213: R_X86_64_PLT32	_raw_spin_lock_irq-0x4
359d   595217:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
35a2   59521c:	48 89 de             	mov    %rbx,%rsi
35a5   59521f:	e8 80 82 00 00       	call   59d4a4 <move_pages_to_lru>
35aa   595224:	65 4c 8b 34 25 00 00 00 00 	mov    %gs:0x0,%r14	595229: R_X86_64_32S	current_task
35b3   59522d:	49 8d 9e 08 11 00 00 	lea    0x1108(%r14),%rbx
35ba   595234:	48 89 d8             	mov    %rbx,%rax
35bd   595237:	48 c1 e8 03          	shr    $0x3,%rax
35c1   59523b:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
35cb   595245:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
35cf   595249:	74 08                	je     595253 <shrink_lruvec+0x35d9>
35d1   59524b:	48 89 df             	mov    %rbx,%rdi
35d4   59524e:	e8 00 00 00 00       	call   595253 <shrink_lruvec+0x35d9>	59524f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
35d9   595253:	48 8b 1b             	mov    (%rbx),%rbx
35dc   595256:	48 83 c3 08          	add    $0x8,%rbx
35e0   59525a:	48 89 d8             	mov    %rbx,%rax
35e3   59525d:	48 c1 e8 03          	shr    $0x3,%rax
35e7   595261:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
35f1   59526b:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
35f5   59526f:	74 08                	je     595279 <shrink_lruvec+0x35ff>
35f7   595271:	48 89 df             	mov    %rbx,%rdi
35fa   595274:	e8 00 00 00 00       	call   595279 <shrink_lruvec+0x35ff>	595275: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
35ff   595279:	4c 8b 23             	mov    (%rbx),%r12
3602   59527c:	4d 85 e4             	test   %r12,%r12
3605   59527f:	0f 84 a2 00 00 00    	je     595327 <shrink_lruvec+0x36ad>
360b   595285:	4d 8d ac 24 b0 00 00 00 	lea    0xb0(%r12),%r13
3613   59528d:	4c 89 e8             	mov    %r13,%rax
3616   595290:	48 c1 e8 03          	shr    $0x3,%rax
361a   595294:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
3624   59529e:	8a 04 08             	mov    (%rax,%rcx,1),%al
3627   5952a1:	84 c0                	test   %al,%al
3629   5952a3:	0f 85 a0 0d 00 00    	jne    596049 <shrink_lruvec+0x43cf>
362f   5952a9:	41 8b 5d 00          	mov    0x0(%r13),%ebx
3633   5952ad:	31 ff                	xor    %edi,%edi
3635   5952af:	89 de                	mov    %ebx,%esi
3637   5952b1:	e8 00 00 00 00       	call   5952b6 <shrink_lruvec+0x363c>	5952b2: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
363c   5952b6:	85 db                	test   %ebx,%ebx
363e   5952b8:	74 74                	je     59532e <shrink_lruvec+0x36b4>
3640   5952ba:	e8 00 00 00 00       	call   5952bf <shrink_lruvec+0x3645>	5952bb: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3645   5952bf:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
364a   5952c4:	4c 89 e6             	mov    %r12,%rsi
364d   5952c7:	e8 89 60 00 00       	call   59b355 <reset_batch_size>
3652   5952cc:	eb 65                	jmp    595333 <shrink_lruvec+0x36b9>
3654   5952ce:	e8 00 00 00 00       	call   5952d3 <shrink_lruvec+0x3659>	5952cf: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3659   5952d3:	e9 32 01 00 00       	jmp    59540a <shrink_lruvec+0x3790>
365e   5952d8:	8b 5c 24 34          	mov    0x34(%rsp),%ebx
3662   5952dc:	89 df                	mov    %ebx,%edi
3664   5952de:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	5952e1: R_X86_64_32S	.data+0x599df0
366b   5952e5:	e8 00 00 00 00       	call   5952ea <shrink_lruvec+0x3670>	5952e6: R_X86_64_PLT32	__sanitizer_cov_trace_switch-0x4
3670   5952ea:	81 fb c8 00 00 00    	cmp    $0xc8,%ebx
3676   5952f0:	4c 8b b4 24 b0 00 00 00 	mov    0xb0(%rsp),%r14
367e   5952f8:	0f 84 a4 06 00 00    	je     5959a2 <shrink_lruvec+0x3d28>
3684   5952fe:	89 da                	mov    %ebx,%edx
3686   595300:	83 fb 01             	cmp    $0x1,%ebx
3689   595303:	0f 85 b7 06 00 00    	jne    5959c0 <shrink_lruvec+0x3d46>
368f   595309:	e8 00 00 00 00       	call   59530e <shrink_lruvec+0x3694>	59530a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3694   59530e:	8b 44 24 34          	mov    0x34(%rsp),%eax
3698   595312:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
369e   595318:	89 c1                	mov    %eax,%ecx
36a0   59531a:	48 89 8c 24 98 00 00 00 	mov    %rcx,0x98(%rsp)
36a8   595322:	e9 85 d0 ff ff       	jmp    5923ac <shrink_lruvec+0x732>
36ad   595327:	e8 00 00 00 00       	call   59532c <shrink_lruvec+0x36b2>	595328: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
36b2   59532c:	eb 05                	jmp    595333 <shrink_lruvec+0x36b9>
36b4   59532e:	e8 00 00 00 00       	call   595333 <shrink_lruvec+0x36b9>	59532f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
36b9   595333:	8b 1c 24             	mov    (%rsp),%ebx
36bc   595336:	49 83 c6 2c          	add    $0x2c,%r14
36c0   59533a:	4c 89 f0             	mov    %r14,%rax
36c3   59533d:	48 c1 e8 03          	shr    $0x3,%rax
36c7   595341:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
36d1   59534b:	42 8a 04 28          	mov    (%rax,%r13,1),%al
36d5   59534f:	84 c0                	test   %al,%al
36d7   595351:	0f 85 ba 0c 00 00    	jne    596011 <shrink_lruvec+0x4397>
36dd   595357:	4c 63 e3             	movslq %ebx,%r12
36e0   59535a:	31 db                	xor    %ebx,%ebx
36e2   59535c:	41 8b 36             	mov    (%r14),%esi
36e5   59535f:	b8 00 00 02 00       	mov    $0x20000,%eax
36ea   595364:	21 c6                	and    %eax,%esi
36ec   595366:	0f 94 c3             	sete   %bl
36ef   595369:	31 ff                	xor    %edi,%edi
36f1   59536b:	e8 00 00 00 00       	call   595370 <shrink_lruvec+0x36f6>	59536c: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
36f6   595370:	65 4c 01 24 dd 00 00 00 00 	add    %r12,%gs:0x0(,%rbx,8)	595375: R_X86_64_32S	vm_event_states+0xc8
36ff   595379:	48 8b 84 24 98 00 00 00 	mov    0x98(%rsp),%rax
3707   595381:	83 c0 22             	add    $0x22,%eax
370a   595384:	65 4c 01 24 c5 00 00 00 00 	add    %r12,%gs:0x0(,%rax,8)	595389: R_X86_64_32S	vm_event_states
3713   59538d:	48 8b bc 24 18 02 00 00 	mov    0x218(%rsp),%rdi
371b   595395:	e8 00 00 00 00       	call   59539a <shrink_lruvec+0x3720>	595396: R_X86_64_PLT32	_raw_spin_unlock_irq-0x4
3720   59539a:	48 8d bc 24 f8 00 00 00 	lea    0xf8(%rsp),%rdi
3728   5953a2:	e8 00 00 00 00       	call   5953a7 <shrink_lruvec+0x372d>	5953a3: R_X86_64_PLT32	free_unref_page_list-0x4
372d   5953a7:	48 8b 84 24 e0 01 00 00 	mov    0x1e0(%rsp),%rax
3735   5953af:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
373a   5953b4:	48 8b 9c 24 d8 00 00 00 	mov    0xd8(%rsp),%rbx
3742   5953bc:	74 08                	je     5953c6 <shrink_lruvec+0x374c>
3744   5953be:	48 89 df             	mov    %rbx,%rdi
3747   5953c1:	e8 00 00 00 00       	call   5953c6 <shrink_lruvec+0x374c>	5953c2: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
374c   5953c6:	4c 01 23             	add    %r12,(%rbx)
374f   5953c9:	31 ff                	xor    %edi,%edi
3751   5953cb:	48 8b 9c 24 98 00 00 00 	mov    0x98(%rsp),%rbx
3759   5953d3:	89 de                	mov    %ebx,%esi
375b   5953d5:	e8 00 00 00 00       	call   5953da <shrink_lruvec+0x3760>	5953d6: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
3760   5953da:	85 db                	test   %ebx,%ebx
3762   5953dc:	8b 8c 24 0c 01 00 00 	mov    0x10c(%rsp),%ecx
3769   5953e3:	0f b6 c9             	movzbl %cl,%ecx
376c   5953e6:	b8 01 00 00 00       	mov    $0x1,%eax
3771   5953eb:	0f 44 c8             	cmove  %eax,%ecx
3774   5953ee:	89 8c 24 0c 01 00 00 	mov    %ecx,0x10c(%rsp)
377b   5953f5:	48 8b 9c 24 b0 00 00 00 	mov    0xb0(%rsp),%rbx
3783   5953fd:	4c 8d ac 24 38 01 00 00 	lea    0x138(%rsp),%r13
378b   595405:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
3790   59540a:	45 29 e7             	sub    %r12d,%r15d
3793   59540d:	bf 01 00 00 00       	mov    $0x1,%edi
3798   595412:	44 89 fe             	mov    %r15d,%esi
379b   595415:	e8 00 00 00 00       	call   59541a <shrink_lruvec+0x37a0>	595416: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
37a0   59541a:	8b 44 24 08          	mov    0x8(%rsp),%eax
37a4   59541e:	24 01                	and    $0x1,%al
37a6   595420:	0f b6 c0             	movzbl %al,%eax
37a9   595423:	44 8b 74 24 40       	mov    0x40(%rsp),%r14d
37ae   595428:	41 01 c6             	add    %eax,%r14d
37b1   59542b:	31 ff                	xor    %edi,%edi
37b3   59542d:	44 89 f6             	mov    %r14d,%esi
37b6   595430:	e8 00 00 00 00       	call   595435 <shrink_lruvec+0x37bb>	595431: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
37bb   595435:	41 83 ff 01          	cmp    $0x1,%r15d
37bf   595439:	0f 84 86 0d 00 00    	je     5961c5 <shrink_lruvec+0x454b>
37c5   59543f:	45 85 f6             	test   %r14d,%r14d
37c8   595442:	0f 84 7d 0d 00 00    	je     5961c5 <shrink_lruvec+0x454b>
37ce   595448:	49 63 c6             	movslq %r14d,%rax
37d1   59544b:	4c 8b b4 24 40 02 00 00 	mov    0x240(%rsp),%r14
37d9   595453:	49 01 c6             	add    %rax,%r14
37dc   595456:	4c 89 f7             	mov    %r14,%rdi
37df   595459:	4c 8b bc 24 10 03 00 00 	mov    0x310(%rsp),%r15
37e7   595461:	4c 89 fe             	mov    %r15,%rsi
37ea   595464:	e8 00 00 00 00       	call   595469 <shrink_lruvec+0x37ef>	595465: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
37ef   595469:	4d 39 fe             	cmp    %r15,%r14
37f2   59546c:	0f 83 5d 0d 00 00    	jae    5961cf <shrink_lruvec+0x4555>
37f8   595472:	4c 89 b4 24 40 02 00 00 	mov    %r14,0x240(%rsp)
3800   59547a:	0f b6 b4 24 0c 01 00 00 	movzbl 0x10c(%rsp),%esi
3808   595482:	31 ff                	xor    %edi,%edi
380a   595484:	e8 00 00 00 00       	call   595489 <shrink_lruvec+0x380f>	595485: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
380f   595489:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
3819   595493:	48 8b 8c 24 e8 01 00 00 	mov    0x1e8(%rsp),%rcx
3821   59549b:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
3825   59549f:	74 08                	je     5954a9 <shrink_lruvec+0x382f>
3827   5954a1:	48 89 df             	mov    %rbx,%rdi
382a   5954a4:	e8 00 00 00 00       	call   5954a9 <shrink_lruvec+0x382f>	5954a5: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
382f   5954a9:	4c 8b 33             	mov    (%rbx),%r14
3832   5954ac:	65 4c 8b 3c 25 00 00 00 00 	mov    %gs:0x0,%r15	5954b1: R_X86_64_32S	current_task
383b   5954b5:	49 8d 5f 2c          	lea    0x2c(%r15),%rbx
383f   5954b9:	48 89 d9             	mov    %rbx,%rcx
3842   5954bc:	48 c1 e9 03          	shr    $0x3,%rcx
3846   5954c0:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
3850   5954ca:	48 89 4c 24 18       	mov    %rcx,0x18(%rsp)
3855   5954cf:	8a 04 01             	mov    (%rcx,%rax,1),%al
3858   5954d2:	84 c0                	test   %al,%al
385a   5954d4:	0f 85 00 0b 00 00    	jne    595fda <shrink_lruvec+0x4360>
3860   5954da:	48 89 5c 24 08       	mov    %rbx,0x8(%rsp)
3865   5954df:	8b 1b                	mov    (%rbx),%ebx
3867   5954e1:	be 00 00 02 00       	mov    $0x20000,%esi
386c   5954e6:	21 de                	and    %ebx,%esi
386e   5954e8:	31 ff                	xor    %edi,%edi
3870   5954ea:	e8 00 00 00 00       	call   5954ef <shrink_lruvec+0x3875>	5954eb: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
3875   5954ef:	b8 00 00 02 00       	mov    $0x20000,%eax
387a   5954f4:	21 c3                	and    %eax,%ebx
387c   5954f6:	0f 85 e1 00 00 00    	jne    5955dd <shrink_lruvec+0x3963>
3882   5954fc:	4c 2b b4 24 f8 02 00 00 	sub    0x2f8(%rsp),%r14
388a   595504:	bf 01 00 00 00       	mov    $0x1,%edi
388f   595509:	4c 89 f6             	mov    %r14,%rsi
3892   59550c:	e8 00 00 00 00       	call   595511 <shrink_lruvec+0x3897>	59550d: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
3897   595511:	49 83 fe 02          	cmp    $0x2,%r14
389b   595515:	0f 83 bb 0c 00 00    	jae    5961d6 <shrink_lruvec+0x455c>
38a1   59551b:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
38ab   595525:	48 8b 8c 24 e0 01 00 00 	mov    0x1e0(%rsp),%rcx
38b3   59552d:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
38b7   595531:	74 0d                	je     595540 <shrink_lruvec+0x38c6>
38b9   595533:	48 8b bc 24 d8 00 00 00 	mov    0xd8(%rsp),%rdi
38c1   59553b:	e8 00 00 00 00       	call   595540 <shrink_lruvec+0x38c6>	59553c: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
38c6   595540:	48 8b 7c 24 50       	mov    0x50(%rsp),%rdi
38cb   595545:	4c 8b 67 48          	mov    0x48(%rdi),%r12
38cf   595549:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
38d9   595553:	48 8b 8c 24 38 02 00 00 	mov    0x238(%rsp),%rcx
38e1   59555b:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
38e5   59555f:	74 0a                	je     59556b <shrink_lruvec+0x38f1>
38e7   595561:	e8 00 00 00 00       	call   595566 <shrink_lruvec+0x38ec>	595562: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
38ec   595566:	48 8b 7c 24 50       	mov    0x50(%rsp),%rdi
38f1   59556b:	48 8b 1f             	mov    (%rdi),%rbx
38f4   59556e:	4c 89 e7             	mov    %r12,%rdi
38f7   595571:	48 89 de             	mov    %rbx,%rsi
38fa   595574:	e8 00 00 00 00       	call   595579 <shrink_lruvec+0x38ff>	595575: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
38ff   595579:	80 bc 24 0c 01 00 00 00 	cmpb   $0x0,0x10c(%rsp)
3907   595581:	74 09                	je     59558c <shrink_lruvec+0x3912>
3909   595583:	49 39 dc             	cmp    %rbx,%r12
390c   595586:	0f 83 51 0c 00 00    	jae    5961dd <shrink_lruvec+0x4563>
3912   59558c:	4c 89 ff             	mov    %r15,%rdi
3915   59558f:	be 08 00 00 00       	mov    $0x8,%esi
391a   595594:	e8 00 00 00 00       	call   595599 <shrink_lruvec+0x391f>	595595: R_X86_64_PLT32	__kasan_check_read-0x4
391f   595599:	4c 89 f8             	mov    %r15,%rax
3922   59559c:	48 c1 e8 03          	shr    $0x3,%rax
3926   5955a0:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
3930   5955aa:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
3934   5955ae:	74 08                	je     5955b8 <shrink_lruvec+0x393e>
3936   5955b0:	4c 89 ff             	mov    %r15,%rdi
3939   5955b3:	e8 00 00 00 00       	call   5955b8 <shrink_lruvec+0x393e>	5955b4: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
393e   5955b8:	49 8b 1f             	mov    (%r15),%rbx
3941   5955bb:	48 89 de             	mov    %rbx,%rsi
3944   5955be:	48 83 e6 04          	and    $0x4,%rsi
3948   5955c2:	31 ff                	xor    %edi,%edi
394a   5955c4:	e8 00 00 00 00       	call   5955c9 <shrink_lruvec+0x394f>	5955c5: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
394f   5955c9:	48 83 e3 04          	and    $0x4,%rbx
3953   5955cd:	0f 85 a8 00 00 00    	jne    59567b <shrink_lruvec+0x3a01>
3959   5955d3:	e8 00 00 00 00       	call   5955d8 <shrink_lruvec+0x395e>	5955d4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
395e   5955d8:	e9 e9 00 00 00       	jmp    5956c6 <shrink_lruvec+0x3a4c>
3963   5955dd:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
396d   5955e7:	48 8b 8c 24 e0 01 00 00 	mov    0x1e0(%rsp),%rcx
3975   5955ef:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
3979   5955f3:	48 8b 9c 24 d8 00 00 00 	mov    0xd8(%rsp),%rbx
3981   5955fb:	74 08                	je     595605 <shrink_lruvec+0x398b>
3983   5955fd:	48 89 df             	mov    %rbx,%rdi
3986   595600:	e8 00 00 00 00       	call   595605 <shrink_lruvec+0x398b>	595601: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
398b   595605:	4c 8b 3b             	mov    (%rbx),%r15
398e   595608:	48 8b bc 24 f0 02 00 00 	mov    0x2f0(%rsp),%rdi
3996   595610:	48 89 f8             	mov    %rdi,%rax
3999   595613:	48 c1 e8 03          	shr    $0x3,%rax
399d   595617:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
39a7   595621:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
39ab   595625:	74 05                	je     59562c <shrink_lruvec+0x39b2>
39ad   595627:	e8 00 00 00 00       	call   59562c <shrink_lruvec+0x39b2>	595628: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
39b2   59562c:	48 8b 7c 24 50       	mov    0x50(%rsp),%rdi
39b7   595631:	4c 2b 7f 30          	sub    0x30(%rdi),%r15
39bb   595635:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
39c5   59563f:	48 8b 8c 24 38 02 00 00 	mov    0x238(%rsp),%rcx
39cd   595647:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
39d1   59564b:	74 0a                	je     595657 <shrink_lruvec+0x39dd>
39d3   59564d:	e8 00 00 00 00       	call   595652 <shrink_lruvec+0x39d8>	59564e: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
39d8   595652:	48 8b 7c 24 50       	mov    0x50(%rsp),%rdi
39dd   595657:	48 8b 1f             	mov    (%rdi),%rbx
39e0   59565a:	4c 89 ff             	mov    %r15,%rdi
39e3   59565d:	48 89 de             	mov    %rbx,%rsi
39e6   595660:	e8 00 00 00 00       	call   595665 <shrink_lruvec+0x39eb>	595661: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
39eb   595665:	49 39 df             	cmp    %rbx,%r15
39ee   595668:	73 0a                	jae    595674 <shrink_lruvec+0x39fa>
39f0   59566a:	e8 00 00 00 00       	call   59566f <shrink_lruvec+0x39f5>	59566b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
39f5   59566f:	e9 04 03 00 00       	jmp    595978 <shrink_lruvec+0x3cfe>
39fa   595674:	e8 00 00 00 00       	call   595679 <shrink_lruvec+0x39ff>	595675: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
39ff   595679:	eb 4b                	jmp    5956c6 <shrink_lruvec+0x3a4c>
3a01   59567b:	49 81 c7 d0 07 00 00 	add    $0x7d0,%r15
3a08   595682:	4c 89 f8             	mov    %r15,%rax
3a0b   595685:	48 c1 e8 03          	shr    $0x3,%rax
3a0f   595689:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
3a19   595693:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
3a1d   595697:	74 08                	je     5956a1 <shrink_lruvec+0x3a27>
3a1f   595699:	4c 89 ff             	mov    %r15,%rdi
3a22   59569c:	e8 00 00 00 00       	call   5956a1 <shrink_lruvec+0x3a27>	59569d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
3a27   5956a1:	49 8b 1f             	mov    (%r15),%rbx
3a2a   5956a4:	be 00 01 00 00       	mov    $0x100,%esi
3a2f   5956a9:	48 21 de             	and    %rbx,%rsi
3a32   5956ac:	31 ff                	xor    %edi,%edi
3a34   5956ae:	e8 00 00 00 00       	call   5956b3 <shrink_lruvec+0x3a39>	5956af: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
3a39   5956b3:	b8 00 01 00 00       	mov    $0x100,%eax
3a3e   5956b8:	48 21 c3             	and    %rax,%rbx
3a41   5956bb:	0f 85 db 0b 00 00    	jne    59629c <shrink_lruvec+0x4622>
3a47   5956c1:	e8 00 00 00 00       	call   5956c6 <shrink_lruvec+0x3a4c>	5956c2: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3a4c   5956c6:	4c 8b bc 24 d8 00 00 00 	mov    0xd8(%rsp),%r15
3a54   5956ce:	48 8b 9c 24 10 02 00 00 	mov    0x210(%rsp),%rbx
3a5c   5956d6:	48 89 d8             	mov    %rbx,%rax
3a5f   5956d9:	48 c1 e8 03          	shr    $0x3,%rax
3a63   5956dd:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
3a6d   5956e7:	8a 04 08             	mov    (%rax,%rcx,1),%al
3a70   5956ea:	84 c0                	test   %al,%al
3a72   5956ec:	0f 85 05 09 00 00    	jne    595ff7 <shrink_lruvec+0x437d>
3a78   5956f2:	0f b6 1b             	movzbl (%rbx),%ebx
3a7b   5956f5:	bf 0a 00 00 00       	mov    $0xa,%edi
3a80   5956fa:	89 de                	mov    %ebx,%esi
3a82   5956fc:	e8 00 00 00 00       	call   595701 <shrink_lruvec+0x3a87>	5956fd: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
3a87   595701:	80 fb 0b             	cmp    $0xb,%bl
3a8a   595704:	7c 0a                	jl     595710 <shrink_lruvec+0x3a96>
3a8c   595706:	e8 00 00 00 00       	call   59570b <shrink_lruvec+0x3a91>	595707: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3a91   59570b:	e9 68 02 00 00       	jmp    595978 <shrink_lruvec+0x3cfe>
3a96   595710:	48 8b 94 24 f0 00 00 00 	mov    0xf0(%rsp),%rdx
3a9e   595718:	49 89 d6             	mov    %rdx,%r14
3aa1   59571b:	49 c1 ee 03          	shr    $0x3,%r14
3aa5   59571f:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
3aaf   595729:	41 8a 04 06          	mov    (%r14,%rax,1),%al
3ab3   59572d:	84 c0                	test   %al,%al
3ab5   59572f:	0f 85 32 09 00 00    	jne    596067 <shrink_lruvec+0x43ed>
3abb   595735:	0f b6 1a             	movzbl (%rdx),%ebx
3abe   595738:	31 ff                	xor    %edi,%edi
3ac0   59573a:	89 de                	mov    %ebx,%esi
3ac2   59573c:	e8 00 00 00 00       	call   595741 <shrink_lruvec+0x3ac7>	59573d: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
3ac7   595741:	84 db                	test   %bl,%bl
3ac9   595743:	0f 88 42 0b 00 00    	js     59628b <shrink_lruvec+0x4611>
3acf   595749:	45 31 ed             	xor    %r13d,%r13d
3ad2   59574c:	45 31 ff             	xor    %r15d,%r15d
3ad5   59574f:	bf 05 00 00 00       	mov    $0x5,%edi
3ada   595754:	4c 89 fe             	mov    %r15,%rsi
3add   595757:	e8 00 00 00 00       	call   59575c <shrink_lruvec+0x3ae2>	595758: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
3ae2   59575c:	49 83 ff 04          	cmp    $0x4,%r15
3ae6   595760:	0f 87 ec 01 00 00    	ja     595952 <shrink_lruvec+0x3cd8>
3aec   595766:	e8 00 00 00 00       	call   59576b <shrink_lruvec+0x3af1>	595767: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3af1   59576b:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
3af6   595770:	4a 8d 1c 28          	lea    (%rax,%r13,1),%rbx
3afa   595774:	48 81 c3 98 c1 ff ff 	add    $0xffffffffffffc198,%rbx
3b01   59577b:	48 89 df             	mov    %rbx,%rdi
3b04   59577e:	be 08 00 00 00       	mov    $0x8,%esi
3b09   595783:	e8 00 00 00 00       	call   595788 <shrink_lruvec+0x3b0e>	595784: R_X86_64_PLT32	__kasan_check_read-0x4
3b0e   595788:	48 89 d8             	mov    %rbx,%rax
3b11   59578b:	48 c1 e8 03          	shr    $0x3,%rax
3b15   59578f:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
3b1f   595799:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
3b23   59579d:	74 08                	je     5957a7 <shrink_lruvec+0x3b2d>
3b25   59579f:	48 89 df             	mov    %rbx,%rdi
3b28   5957a2:	e8 00 00 00 00       	call   5957a7 <shrink_lruvec+0x3b2d>	5957a3: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
3b2d   5957a7:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
3b32   5957ac:	4a 8b 9c 28 98 c1 ff ff 	mov    -0x3e68(%rax,%r13,1),%rbx
3b3a   5957b4:	31 ff                	xor    %edi,%edi
3b3c   5957b6:	48 89 de             	mov    %rbx,%rsi
3b3f   5957b9:	e8 00 00 00 00       	call   5957be <shrink_lruvec+0x3b44>	5957ba: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
3b44   5957be:	48 85 db             	test   %rbx,%rbx
3b47   5957c1:	0f 84 0e 01 00 00    	je     5958d5 <shrink_lruvec+0x3c5b>
3b4d   5957c7:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
3b57   5957d1:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
3b5c   5957d6:	42 8a 04 20          	mov    (%rax,%r12,1),%al
3b60   5957da:	84 c0                	test   %al,%al
3b62   5957dc:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
3b67   5957e1:	0f 85 4e 01 00 00    	jne    595935 <shrink_lruvec+0x3cbb>
3b6d   5957e7:	8b 1b                	mov    (%rbx),%ebx
3b6f   5957e9:	b8 00 00 02 00       	mov    $0x20000,%eax
3b74   5957ee:	21 c3                	and    %eax,%ebx
3b76   5957f0:	31 ff                	xor    %edi,%edi
3b78   5957f2:	89 de                	mov    %ebx,%esi
3b7a   5957f4:	e8 00 00 00 00       	call   5957f9 <shrink_lruvec+0x3b7f>	5957f5: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
3b7f   5957f9:	c1 eb 11             	shr    $0x11,%ebx
3b82   5957fc:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
3b87   595801:	4c 01 e8             	add    %r13,%rax
3b8a   595804:	48 8d 1c d8          	lea    (%rax,%rbx,8),%rbx
3b8e   595808:	48 81 c3 20 c1 ff ff 	add    $0xffffffffffffc120,%rbx
3b95   59580f:	48 89 d8             	mov    %rbx,%rax
3b98   595812:	48 c1 e8 03          	shr    $0x3,%rax
3b9c   595816:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
3ba1   59581b:	74 08                	je     595825 <shrink_lruvec+0x3bab>
3ba3   59581d:	48 89 df             	mov    %rbx,%rdi
3ba6   595820:	e8 00 00 00 00       	call   595825 <shrink_lruvec+0x3bab>	595821: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
3bab   595825:	4c 8b 23             	mov    (%rbx),%r12
3bae   595828:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
3bb3   59582d:	4a 8d 3c 28          	lea    (%rax,%r13,1),%rdi
3bb7   595831:	48 81 c7 38 c1 ff ff 	add    $0xffffffffffffc138,%rdi
3bbe   595838:	48 89 f8             	mov    %rdi,%rax
3bc1   59583b:	48 c1 e8 03          	shr    $0x3,%rax
3bc5   59583f:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
3bcf   595849:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
3bd3   59584d:	74 05                	je     595854 <shrink_lruvec+0x3bda>
3bd5   59584f:	e8 00 00 00 00       	call   595854 <shrink_lruvec+0x3bda>	595850: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
3bda   595854:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
3bdf   595859:	4a 8d 1c 28          	lea    (%rax,%r13,1),%rbx
3be3   59585d:	48 81 c3 58 c7 ff ff 	add    $0xffffffffffffc758,%rbx
3bea   595864:	4c 03 a3 e0 f9 ff ff 	add    -0x620(%rbx),%r12
3bf1   59586b:	48 89 df             	mov    %rbx,%rdi
3bf4   59586e:	be 08 00 00 00       	mov    $0x8,%esi
3bf9   595873:	e8 00 00 00 00       	call   595878 <shrink_lruvec+0x3bfe>	595874: R_X86_64_PLT32	__kasan_check_read-0x4
3bfe   595878:	48 89 d8             	mov    %rbx,%rax
3c01   59587b:	48 c1 e8 03          	shr    $0x3,%rax
3c05   59587f:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
3c0f   595889:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
3c13   59588d:	74 08                	je     595897 <shrink_lruvec+0x3c1d>
3c15   59588f:	48 89 df             	mov    %rbx,%rdi
3c18   595892:	e8 00 00 00 00       	call   595897 <shrink_lruvec+0x3c1d>	595893: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
3c1d   595897:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
3c22   59589c:	4a 8b 9c 28 58 c7 ff ff 	mov    -0x38a8(%rax,%r13,1),%rbx
3c2a   5958a4:	31 ff                	xor    %edi,%edi
3c2c   5958a6:	48 89 de             	mov    %rbx,%rsi
3c2f   5958a9:	e8 00 00 00 00       	call   5958ae <shrink_lruvec+0x3c34>	5958aa: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
3c34   5958ae:	48 85 db             	test   %rbx,%rbx
3c37   5958b1:	b8 00 00 00 00       	mov    $0x0,%eax
3c3c   5958b6:	48 0f 48 d8          	cmovs  %rax,%rbx
3c40   5958ba:	4c 89 e7             	mov    %r12,%rdi
3c43   5958bd:	48 89 de             	mov    %rbx,%rsi
3c46   5958c0:	e8 00 00 00 00       	call   5958c5 <shrink_lruvec+0x3c4b>	5958c1: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
3c4b   5958c5:	49 39 dc             	cmp    %rbx,%r12
3c4e   5958c8:	0f 87 9d 00 00 00    	ja     59596b <shrink_lruvec+0x3cf1>
3c54   5958ce:	e8 00 00 00 00       	call   5958d3 <shrink_lruvec+0x3c59>	5958cf: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3c59   5958d3:	eb 05                	jmp    5958da <shrink_lruvec+0x3c60>
3c5b   5958d5:	e8 00 00 00 00       	call   5958da <shrink_lruvec+0x3c60>	5958d6: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3c60   5958da:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
3c6a   5958e4:	41 8a 04 06          	mov    (%r14,%rax,1),%al
3c6e   5958e8:	84 c0                	test   %al,%al
3c70   5958ea:	48 8b 94 24 f0 00 00 00 	mov    0xf0(%rsp),%rdx
3c78   5958f2:	75 21                	jne    595915 <shrink_lruvec+0x3c9b>
3c7a   5958f4:	48 0f be 02          	movsbq (%rdx),%rax
3c7e   5958f8:	49 39 c7             	cmp    %rax,%r15
3c81   5958fb:	0f 8d 87 08 00 00    	jge    596188 <shrink_lruvec+0x450e>
3c87   595901:	e8 00 00 00 00       	call   595906 <shrink_lruvec+0x3c8c>	595902: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3c8c   595906:	49 81 c5 c0 06 00 00 	add    $0x6c0,%r13
3c93   59590d:	49 ff c7             	inc    %r15
3c96   595910:	e9 3a fe ff ff       	jmp    59574f <shrink_lruvec+0x3ad5>
3c9b   595915:	89 d1                	mov    %edx,%ecx
3c9d   595917:	80 e1 07             	and    $0x7,%cl
3ca0   59591a:	38 c1                	cmp    %al,%cl
3ca2   59591c:	7c d6                	jl     5958f4 <shrink_lruvec+0x3c7a>
3ca4   59591e:	48 8b bc 24 f0 00 00 00 	mov    0xf0(%rsp),%rdi
3cac   595926:	e8 00 00 00 00       	call   59592b <shrink_lruvec+0x3cb1>	595927: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
3cb1   59592b:	48 8b 94 24 f0 00 00 00 	mov    0xf0(%rsp),%rdx
3cb9   595933:	eb bf                	jmp    5958f4 <shrink_lruvec+0x3c7a>
3cbb   595935:	89 d9                	mov    %ebx,%ecx
3cbd   595937:	80 e1 07             	and    $0x7,%cl
3cc0   59593a:	80 c1 03             	add    $0x3,%cl
3cc3   59593d:	38 c1                	cmp    %al,%cl
3cc5   59593f:	0f 8c a2 fe ff ff    	jl     5957e7 <shrink_lruvec+0x3b6d>
3ccb   595945:	48 89 df             	mov    %rbx,%rdi
3cce   595948:	e8 00 00 00 00       	call   59594d <shrink_lruvec+0x3cd3>	595949: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
3cd3   59594d:	e9 95 fe ff ff       	jmp    5957e7 <shrink_lruvec+0x3b6d>
3cd8   595952:	e8 00 00 00 00       	call   595957 <shrink_lruvec+0x3cdd>	595953: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3cdd   595957:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	59595a: R_X86_64_32S	.data+0x599ae0
3ce4   59595e:	4c 89 fe             	mov    %r15,%rsi
3ce7   595961:	e8 00 00 00 00       	call   595966 <shrink_lruvec+0x3cec>	595962: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
3cec   595966:	e9 00 fe ff ff       	jmp    59576b <shrink_lruvec+0x3af1>
3cf1   59596b:	e8 00 00 00 00       	call   595970 <shrink_lruvec+0x3cf6>	59596c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3cf6   595970:	4c 8d ac 24 38 01 00 00 	lea    0x138(%rsp),%r13
3cfe   595978:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	59597b: R_X86_64_32S	.rodata+0x129ac0
3d05   59597f:	be d5 13 00 00       	mov    $0x13d5,%esi
3d0a   595984:	31 d2                	xor    %edx,%edx
3d0c   595986:	e8 00 00 00 00       	call   59598b <shrink_lruvec+0x3d11>	595987: R_X86_64_PLT32	__might_resched-0x4
3d11   59598b:	e8 00 00 00 00       	call   595990 <shrink_lruvec+0x3d16>	59598c: R_X86_64_PLT32	__cond_resched-0x4
3d16   595990:	4c 8b 7c 24 50       	mov    0x50(%rsp),%r15
3d1b   595995:	48 8b 84 24 90 00 00 00 	mov    0x90(%rsp),%rax
3d23   59599d:	e9 db c5 ff ff       	jmp    591f7d <shrink_lruvec+0x303>
3d28   5959a2:	e8 00 00 00 00       	call   5959a7 <shrink_lruvec+0x3d2d>	5959a3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3d2d   5959a7:	8b 44 24 34          	mov    0x34(%rsp),%eax
3d31   5959ab:	31 c9                	xor    %ecx,%ecx
3d33   5959ad:	48 89 8c 24 98 00 00 00 	mov    %rcx,0x98(%rsp)
3d3b   5959b5:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
3d41   5959bb:	e9 ec c9 ff ff       	jmp    5923ac <shrink_lruvec+0x732>
3d46   5959c0:	4c 8d 74 24 70       	lea    0x70(%rsp),%r14
3d4b   5959c5:	4c 89 f1             	mov    %r14,%rcx
3d4e   5959c8:	48 c1 e9 03          	shr    $0x3,%rcx
3d52   5959cc:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
3d5c   5959d6:	48 89 4c 24 18       	mov    %rcx,0x18(%rsp)
3d61   5959db:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
3d65   5959df:	74 0c                	je     5959ed <shrink_lruvec+0x3d73>
3d67   5959e1:	4c 89 f7             	mov    %r14,%rdi
3d6a   5959e4:	e8 00 00 00 00       	call   5959e9 <shrink_lruvec+0x3d6f>	5959e5: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
3d6f   5959e9:	8b 54 24 34          	mov    0x34(%rsp),%edx
3d73   5959ed:	48 b8 aa aa aa aa aa aa aa aa 	movabs $0xaaaaaaaaaaaaaaaa,%rax
3d7d   5959f7:	48 89 44 24 70       	mov    %rax,0x70(%rsp)
3d82   5959fc:	48 8d 8c 24 28 01 00 00 	lea    0x128(%rsp),%rcx
3d8a   595a04:	48 c1 e9 03          	shr    $0x3,%rcx
3d8e   595a08:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
3d98   595a12:	48 89 0c 24          	mov    %rcx,(%rsp)
3d9c   595a16:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
3da0   595a1a:	74 11                	je     595a2d <shrink_lruvec+0x3db3>
3da2   595a1c:	48 8d bc 24 28 01 00 00 	lea    0x128(%rsp),%rdi
3daa   595a24:	e8 00 00 00 00       	call   595a29 <shrink_lruvec+0x3daf>	595a25: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
3daf   595a29:	8b 54 24 34          	mov    0x34(%rsp),%edx
3db3   595a2d:	48 b8 aa aa aa aa aa aa aa aa 	movabs $0xaaaaaaaaaaaaaaaa,%rax
3dbd   595a37:	48 89 84 24 28 01 00 00 	mov    %rax,0x128(%rsp)
3dc5   595a3f:	48 bb 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbx
3dcf   595a49:	48 8b 84 24 e0 02 00 00 	mov    0x2e0(%rsp),%rax
3dd7   595a51:	8a 04 18             	mov    (%rax,%rbx,1),%al
3dda   595a54:	84 c0                	test   %al,%al
3ddc   595a56:	0f 85 4f 06 00 00    	jne    5960ab <shrink_lruvec+0x4431>
3de2   595a5c:	89 94 24 10 01 00 00 	mov    %edx,0x110(%rsp)
3de9   595a63:	41 bd c8 00 00 00    	mov    $0xc8,%r13d
3def   595a69:	41 29 d5             	sub    %edx,%r13d
3df2   595a6c:	48 8d 84 24 14 01 00 00 	lea    0x114(%rsp),%rax
3dfa   595a74:	48 c1 e8 03          	shr    $0x3,%rax
3dfe   595a78:	8a 04 18             	mov    (%rax,%rbx,1),%al
3e01   595a7b:	84 c0                	test   %al,%al
3e03   595a7d:	48 8b 94 24 08 02 00 00 	mov    0x208(%rsp),%rdx
3e0b   595a85:	0f 85 4c 06 00 00    	jne    5960d7 <shrink_lruvec+0x445d>
3e11   595a8b:	44 89 ac 24 14 01 00 00 	mov    %r13d,0x114(%rsp)
3e19   595a93:	48 89 d0             	mov    %rdx,%rax
3e1c   595a96:	48 c1 e8 03          	shr    $0x3,%rax
3e20   595a9a:	80 3c 18 00          	cmpb   $0x0,(%rax,%rbx,1)
3e24   595a9e:	74 15                	je     595ab5 <shrink_lruvec+0x3e3b>
3e26   595aa0:	48 8b bc 24 08 02 00 00 	mov    0x208(%rsp),%rdi
3e2e   595aa8:	e8 00 00 00 00       	call   595aad <shrink_lruvec+0x3e33>	595aa9: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
3e33   595aad:	48 8b 94 24 08 02 00 00 	mov    0x208(%rsp),%rdx
3e3b   595ab5:	4c 8b 3a             	mov    (%rdx),%r15
3e3e   595ab8:	48 8b 9c 24 d8 02 00 00 	mov    0x2d8(%rsp),%rbx
3e46   595ac0:	48 89 df             	mov    %rbx,%rdi
3e49   595ac3:	be 08 00 00 00       	mov    $0x8,%esi
3e4e   595ac8:	e8 00 00 00 00       	call   595acd <shrink_lruvec+0x3e53>	595ac9: R_X86_64_PLT32	__kasan_check_read-0x4
3e53   595acd:	48 89 d8             	mov    %rbx,%rax
3e56   595ad0:	48 c1 e8 03          	shr    $0x3,%rax
3e5a   595ad4:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
3e64   595ade:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
3e68   595ae2:	74 08                	je     595aec <shrink_lruvec+0x3e72>
3e6a   595ae4:	48 89 df             	mov    %rbx,%rdi
3e6d   595ae7:	e8 00 00 00 00       	call   595aec <shrink_lruvec+0x3e72>	595ae8: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
3e72   595aec:	4c 03 3b             	add    (%rbx),%r15
3e75   595aef:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
3e7f   595af9:	48 8b 8c 24 a0 00 00 00 	mov    0xa0(%rsp),%rcx
3e87   595b01:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
3e8b   595b05:	74 0a                	je     595b11 <shrink_lruvec+0x3e97>
3e8d   595b07:	48 8d 7c 24 60       	lea    0x60(%rsp),%rdi
3e92   595b0c:	e8 00 00 00 00       	call   595b11 <shrink_lruvec+0x3e97>	595b0d: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
3e97   595b11:	4c 89 7c 24 60       	mov    %r15,0x60(%rsp)
3e9c   595b16:	48 8b 9c 24 d0 02 00 00 	mov    0x2d0(%rsp),%rbx
3ea4   595b1e:	48 89 d8             	mov    %rbx,%rax
3ea7   595b21:	48 c1 e8 03          	shr    $0x3,%rax
3eab   595b25:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
3eb5   595b2f:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
3eb9   595b33:	74 08                	je     595b3d <shrink_lruvec+0x3ec3>
3ebb   595b35:	48 89 df             	mov    %rbx,%rdi
3ebe   595b38:	e8 00 00 00 00       	call   595b3d <shrink_lruvec+0x3ec3>	595b39: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
3ec3   595b3d:	4c 8b 23             	mov    (%rbx),%r12
3ec6   595b40:	48 8b 9c 24 c8 02 00 00 	mov    0x2c8(%rsp),%rbx
3ece   595b48:	48 89 df             	mov    %rbx,%rdi
3ed1   595b4b:	be 08 00 00 00       	mov    $0x8,%esi
3ed6   595b50:	e8 00 00 00 00       	call   595b55 <shrink_lruvec+0x3edb>	595b51: R_X86_64_PLT32	__kasan_check_read-0x4
3edb   595b55:	48 89 d8             	mov    %rbx,%rax
3ede   595b58:	48 c1 e8 03          	shr    $0x3,%rax
3ee2   595b5c:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
3eec   595b66:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
3ef0   595b6a:	74 08                	je     595b74 <shrink_lruvec+0x3efa>
3ef2   595b6c:	48 89 df             	mov    %rbx,%rdi
3ef5   595b6f:	e8 00 00 00 00       	call   595b74 <shrink_lruvec+0x3efa>	595b70: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
3efa   595b74:	4c 89 7c 24 20       	mov    %r15,0x20(%rsp)
3eff   595b79:	48 8d 4c 24 68       	lea    0x68(%rsp),%rcx
3f04   595b7e:	48 c1 e9 03          	shr    $0x3,%rcx
3f08   595b82:	4c 03 23             	add    (%rbx),%r12
3f0b   595b85:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
3f15   595b8f:	48 89 4c 24 40       	mov    %rcx,0x40(%rsp)
3f1a   595b94:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
3f1e   595b98:	74 0a                	je     595ba4 <shrink_lruvec+0x3f2a>
3f20   595b9a:	48 8d 7c 24 68       	lea    0x68(%rsp),%rdi
3f25   595b9f:	e8 00 00 00 00       	call   595ba4 <shrink_lruvec+0x3f2a>	595ba0: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
3f2a   595ba4:	4c 89 64 24 68       	mov    %r12,0x68(%rsp)
3f2f   595ba9:	49 bf 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r15
3f39   595bb3:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
3f3e   595bb8:	42 8a 04 38          	mov    (%rax,%r15,1),%al
3f42   595bbc:	84 c0                	test   %al,%al
3f44   595bbe:	0f 85 43 05 00 00    	jne    596107 <shrink_lruvec+0x448d>
3f4a   595bc4:	8b 44 24 34          	mov    0x34(%rsp),%eax
3f4e   595bc8:	89 44 24 70          	mov    %eax,0x70(%rsp)
3f52   595bcc:	48 8b 9c 24 c0 02 00 00 	mov    0x2c0(%rsp),%rbx
3f5a   595bd4:	48 89 d8             	mov    %rbx,%rax
3f5d   595bd7:	48 c1 e8 03          	shr    $0x3,%rax
3f61   595bdb:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1)
3f66   595be0:	74 08                	je     595bea <shrink_lruvec+0x3f70>
3f68   595be2:	48 89 df             	mov    %rbx,%rdi
3f6b   595be5:	e8 00 00 00 00       	call   595bea <shrink_lruvec+0x3f70>	595be6: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
3f70   595bea:	4c 8b 33             	mov    (%rbx),%r14
3f73   595bed:	48 8b 9c 24 b8 02 00 00 	mov    0x2b8(%rsp),%rbx
3f7b   595bf5:	48 89 df             	mov    %rbx,%rdi
3f7e   595bf8:	be 08 00 00 00       	mov    $0x8,%esi
3f83   595bfd:	e8 00 00 00 00       	call   595c02 <shrink_lruvec+0x3f88>	595bfe: R_X86_64_PLT32	__kasan_check_read-0x4
3f88   595c02:	48 89 d8             	mov    %rbx,%rax
3f8b   595c05:	48 c1 e8 03          	shr    $0x3,%rax
3f8f   595c09:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
3f99   595c13:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
3f9d   595c17:	74 08                	je     595c21 <shrink_lruvec+0x3fa7>
3f9f   595c19:	48 89 df             	mov    %rbx,%rdi
3fa2   595c1c:	e8 00 00 00 00       	call   595c21 <shrink_lruvec+0x3fa7>	595c1d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
3fa7   595c21:	48 8d bc 24 18 01 00 00 	lea    0x118(%rsp),%rdi
3faf   595c29:	48 89 f9             	mov    %rdi,%rcx
3fb2   595c2c:	48 c1 e9 03          	shr    $0x3,%rcx
3fb6   595c30:	4c 03 33             	add    (%rbx),%r14
3fb9   595c33:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
3fc3   595c3d:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
3fc8   595c42:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
3fcc   595c46:	74 05                	je     595c4d <shrink_lruvec+0x3fd3>
3fce   595c48:	e8 00 00 00 00       	call   595c4d <shrink_lruvec+0x3fd3>	595c49: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
3fd3   595c4d:	4c 89 b4 24 18 01 00 00 	mov    %r14,0x118(%rsp)
3fdb   595c55:	48 8b 9c 24 b0 02 00 00 	mov    0x2b0(%rsp),%rbx
3fe3   595c5d:	48 89 d8             	mov    %rbx,%rax
3fe6   595c60:	48 c1 e8 03          	shr    $0x3,%rax
3fea   595c64:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
3ff4   595c6e:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
3ff8   595c72:	74 08                	je     595c7c <shrink_lruvec+0x4002>
3ffa   595c74:	48 89 df             	mov    %rbx,%rdi
3ffd   595c77:	e8 00 00 00 00       	call   595c7c <shrink_lruvec+0x4002>	595c78: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
4002   595c7c:	4c 8b 3b             	mov    (%rbx),%r15
4005   595c7f:	48 8b 9c 24 a8 02 00 00 	mov    0x2a8(%rsp),%rbx
400d   595c87:	48 89 df             	mov    %rbx,%rdi
4010   595c8a:	be 08 00 00 00       	mov    $0x8,%esi
4015   595c8f:	e8 00 00 00 00       	call   595c94 <shrink_lruvec+0x401a>	595c90: R_X86_64_PLT32	__kasan_check_read-0x4
401a   595c94:	48 89 d8             	mov    %rbx,%rax
401d   595c97:	48 c1 e8 03          	shr    $0x3,%rax
4021   595c9b:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
402b   595ca5:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
402f   595ca9:	74 08                	je     595cb3 <shrink_lruvec+0x4039>
4031   595cab:	48 89 df             	mov    %rbx,%rdi
4034   595cae:	e8 00 00 00 00       	call   595cb3 <shrink_lruvec+0x4039>	595caf: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
4039   595cb3:	48 8d bc 24 20 01 00 00 	lea    0x120(%rsp),%rdi
4041   595cbb:	48 89 f9             	mov    %rdi,%rcx
4044   595cbe:	48 c1 e9 03          	shr    $0x3,%rcx
4048   595cc2:	4c 03 3b             	add    (%rbx),%r15
404b   595cc5:	4c 89 fb             	mov    %r15,%rbx
404e   595cc8:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
4058   595cd2:	48 89 4c 24 28       	mov    %rcx,0x28(%rsp)
405d   595cd7:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
4061   595cdb:	74 05                	je     595ce2 <shrink_lruvec+0x4068>
4063   595cdd:	e8 00 00 00 00       	call   595ce2 <shrink_lruvec+0x4068>	595cde: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
4068   595ce2:	48 89 9c 24 20 01 00 00 	mov    %rbx,0x120(%rsp)
4070   595cea:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
407a   595cf4:	48 8b 0c 24          	mov    (%rsp),%rcx
407e   595cf8:	8a 04 01             	mov    (%rcx,%rax,1),%al
4081   595cfb:	84 c0                	test   %al,%al
4083   595cfd:	0f 85 22 04 00 00    	jne    596125 <shrink_lruvec+0x44ab>
4089   595d03:	44 89 ac 24 28 01 00 00 	mov    %r13d,0x128(%rsp)
4091   595d0b:	bf 40 00 00 00       	mov    $0x40,%edi
4096   595d10:	4c 89 f6             	mov    %r14,%rsi
4099   595d13:	e8 00 00 00 00       	call   595d18 <shrink_lruvec+0x409e>	595d14: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
409e   595d18:	49 83 fe 3f          	cmp    $0x3f,%r14
40a2   595d1c:	77 0a                	ja     595d28 <shrink_lruvec+0x40ae>
40a4   595d1e:	e8 00 00 00 00       	call   595d23 <shrink_lruvec+0x40a9>	595d1f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
40a9   595d23:	41 b7 01             	mov    $0x1,%r15b
40ac   595d26:	eb 3e                	jmp    595d66 <shrink_lruvec+0x40ec>
40ae   595d28:	e8 00 00 00 00       	call   595d2d <shrink_lruvec+0x40b3>	595d29: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
40b3   595d2d:	49 83 c4 40          	add    $0x40,%r12
40b7   595d31:	4c 63 7c 24 34       	movslq 0x34(%rsp),%r15
40bc   595d36:	4d 0f af fc          	imul   %r12,%r15
40c0   595d3a:	4d 0f af fe          	imul   %r14,%r15
40c4   595d3e:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
40c9   595d43:	48 ff c0             	inc    %rax
40cc   595d46:	48 89 d9             	mov    %rbx,%rcx
40cf   595d49:	49 63 dd             	movslq %r13d,%rbx
40d2   595d4c:	48 0f af d8          	imul   %rax,%rbx
40d6   595d50:	48 0f af d9          	imul   %rcx,%rbx
40da   595d54:	4c 89 ff             	mov    %r15,%rdi
40dd   595d57:	48 89 de             	mov    %rbx,%rsi
40e0   595d5a:	e8 00 00 00 00       	call   595d5f <shrink_lruvec+0x40e5>	595d5b: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
40e5   595d5f:	49 39 df             	cmp    %rbx,%r15
40e8   595d62:	41 0f 96 c7          	setbe  %r15b
40ec   595d66:	44 89 f8             	mov    %r15d,%eax
40ef   595d69:	34 01                	xor    $0x1,%al
40f1   595d6b:	44 0f b6 f0          	movzbl %al,%r14d
40f5   595d6f:	4e 8d 2c b4          	lea    (%rsp,%r14,4),%r13
40f9   595d73:	49 81 c5 10 01 00 00 	add    $0x110,%r13
4100   595d7a:	4c 89 e8             	mov    %r13,%rax
4103   595d7d:	48 c1 e8 03          	shr    $0x3,%rax
4107   595d81:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
4111   595d8b:	42 8a 04 20          	mov    (%rax,%r12,1),%al
4115   595d8f:	84 c0                	test   %al,%al
4117   595d91:	0f 85 b6 03 00 00    	jne    59614d <shrink_lruvec+0x44d3>
411d   595d97:	41 0f b6 df          	movzbl %r15b,%ebx
4121   595d9b:	41 8b 4d 00          	mov    0x0(%r13),%ecx
4125   595d9f:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
412a   595da4:	44 89 f6             	mov    %r14d,%esi
412d   595da7:	31 d2                	xor    %edx,%edx
412f   595da9:	4c 8d 44 24 60       	lea    0x60(%rsp),%r8
4134   595dae:	e8 5a 81 00 00       	call   59df0d <read_ctrl_pos>
4139   595db3:	48 89 9c 24 98 00 00 00 	mov    %rbx,0x98(%rsp)
4141   595dbb:	89 d8                	mov    %ebx,%eax
4143   595dbd:	48 8d 1c 84          	lea    (%rsp,%rax,4),%rbx
4147   595dc1:	48 81 c3 10 01 00 00 	add    $0x110,%rbx
414e   595dc8:	48 89 d8             	mov    %rbx,%rax
4151   595dcb:	48 c1 e8 03          	shr    $0x3,%rax
4155   595dcf:	42 8a 04 20          	mov    (%rax,%r12,1),%al
4159   595dd3:	84 c0                	test   %al,%al
415b   595dd5:	0f 85 90 03 00 00    	jne    59616b <shrink_lruvec+0x44f1>
4161   595ddb:	44 8b 33             	mov    (%rbx),%r14d
4164   595dde:	41 bd 01 00 00 00    	mov    $0x1,%r13d
416a   595de4:	48 8d 9c 24 18 01 00 00 	lea    0x118(%rsp),%rbx
4172   595dec:	44 89 74 24 20       	mov    %r14d,0x20(%rsp)
4177   595df1:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
417c   595df6:	48 8b b4 24 98 00 00 00 	mov    0x98(%rsp),%rsi
4184   595dfe:	44 89 ea             	mov    %r13d,%edx
4187   595e01:	44 89 f1             	mov    %r14d,%ecx
418a   595e04:	49 89 d8             	mov    %rbx,%r8
418d   595e07:	e8 01 81 00 00       	call   59df0d <read_ctrl_pos>
4192   595e0c:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
419c   595e16:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
41a1   595e1b:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
41a5   595e1f:	74 08                	je     595e29 <shrink_lruvec+0x41af>
41a7   595e21:	48 89 df             	mov    %rbx,%rdi
41aa   595e24:	e8 00 00 00 00       	call   595e29 <shrink_lruvec+0x41af>	595e25: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
41af   595e29:	48 8b 9c 24 18 01 00 00 	mov    0x118(%rsp),%rbx
41b7   595e31:	bf 40 00 00 00       	mov    $0x40,%edi
41bc   595e36:	48 89 de             	mov    %rbx,%rsi
41bf   595e39:	e8 00 00 00 00       	call   595e3e <shrink_lruvec+0x41c4>	595e3a: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
41c4   595e3e:	48 83 fb 3f          	cmp    $0x3f,%rbx
41c8   595e42:	77 12                	ja     595e56 <shrink_lruvec+0x41dc>
41ca   595e44:	e8 00 00 00 00       	call   595e49 <shrink_lruvec+0x41cf>	595e45: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
41cf   595e49:	48 8d 9c 24 18 01 00 00 	lea    0x118(%rsp),%rbx
41d7   595e51:	e9 e5 00 00 00       	jmp    595f3b <shrink_lruvec+0x42c1>
41dc   595e56:	45 89 ee             	mov    %r13d,%r14d
41df   595e59:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
41e9   595e63:	48 8b 4c 24 40       	mov    0x40(%rsp),%rcx
41ee   595e68:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
41f2   595e6c:	74 0a                	je     595e78 <shrink_lruvec+0x41fe>
41f4   595e6e:	48 8d 7c 24 68       	lea    0x68(%rsp),%rdi
41f9   595e73:	e8 00 00 00 00       	call   595e78 <shrink_lruvec+0x41fe>	595e74: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
41fe   595e78:	4c 8b 7c 24 68       	mov    0x68(%rsp),%r15
4203   595e7d:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
420d   595e87:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
4212   595e8c:	42 8a 04 28          	mov    (%rax,%r13,1),%al
4216   595e90:	84 c0                	test   %al,%al
4218   595e92:	0f 85 b6 00 00 00    	jne    595f4e <shrink_lruvec+0x42d4>
421e   595e98:	49 83 c7 40          	add    $0x40,%r15
4222   595e9c:	4c 63 64 24 70       	movslq 0x70(%rsp),%r12
4227   595ea1:	48 8b 84 24 a0 00 00 00 	mov    0xa0(%rsp),%rax
422f   595ea9:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
4234   595eae:	74 0a                	je     595eba <shrink_lruvec+0x4240>
4236   595eb0:	48 8d 7c 24 60       	lea    0x60(%rsp),%rdi
423b   595eb5:	e8 00 00 00 00       	call   595eba <shrink_lruvec+0x4240>	595eb6: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
4240   595eba:	4c 0f af fb          	imul   %rbx,%r15
4244   595ebe:	48 8b 5c 24 60       	mov    0x60(%rsp),%rbx
4249   595ec3:	48 ff c3             	inc    %rbx
424c   595ec6:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
4256   595ed0:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
425b   595ed5:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
425f   595ed9:	45 89 f5             	mov    %r14d,%r13d
4262   595edc:	74 0d                	je     595eeb <shrink_lruvec+0x4271>
4264   595ede:	48 8d bc 24 20 01 00 00 	lea    0x120(%rsp),%rdi
426c   595ee6:	e8 00 00 00 00       	call   595eeb <shrink_lruvec+0x4271>	595ee7: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
4271   595eeb:	4d 0f af fc          	imul   %r12,%r15
4275   595eef:	48 0f af 9c 24 20 01 00 00 	imul   0x120(%rsp),%rbx
427e   595ef8:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
4288   595f02:	48 8b 0c 24          	mov    (%rsp),%rcx
428c   595f06:	8a 04 01             	mov    (%rcx,%rax,1),%al
428f   595f09:	84 c0                	test   %al,%al
4291   595f0b:	75 63                	jne    595f70 <shrink_lruvec+0x42f6>
4293   595f0d:	48 63 84 24 28 01 00 00 	movslq 0x128(%rsp),%rax
429b   595f15:	48 0f af d8          	imul   %rax,%rbx
429f   595f19:	4c 89 ff             	mov    %r15,%rdi
42a2   595f1c:	48 89 de             	mov    %rbx,%rsi
42a5   595f1f:	e8 00 00 00 00       	call   595f24 <shrink_lruvec+0x42aa>	595f20: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
42aa   595f24:	49 39 df             	cmp    %rbx,%r15
42ad   595f27:	77 78                	ja     595fa1 <shrink_lruvec+0x4327>
42af   595f29:	e8 00 00 00 00       	call   595f2e <shrink_lruvec+0x42b4>	595f2a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
42b4   595f2e:	48 8d 9c 24 18 01 00 00 	lea    0x118(%rsp),%rbx
42bc   595f36:	44 8b 74 24 20       	mov    0x20(%rsp),%r14d
42c1   595f3b:	41 83 fd 03          	cmp    $0x3,%r13d
42c5   595f3f:	74 53                	je     595f94 <shrink_lruvec+0x431a>
42c7   595f41:	e8 00 00 00 00       	call   595f46 <shrink_lruvec+0x42cc>	595f42: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
42cc   595f46:	41 ff c5             	inc    %r13d
42cf   595f49:	e9 a3 fe ff ff       	jmp    595df1 <shrink_lruvec+0x4177>
42d4   595f4e:	48 8d 4c 24 70       	lea    0x70(%rsp),%rcx
42d9   595f53:	80 e1 07             	and    $0x7,%cl
42dc   595f56:	80 c1 03             	add    $0x3,%cl
42df   595f59:	38 c1                	cmp    %al,%cl
42e1   595f5b:	0f 8c 37 ff ff ff    	jl     595e98 <shrink_lruvec+0x421e>
42e7   595f61:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
42ec   595f66:	e8 00 00 00 00       	call   595f6b <shrink_lruvec+0x42f1>	595f67: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
42f1   595f6b:	e9 28 ff ff ff       	jmp    595e98 <shrink_lruvec+0x421e>
42f6   595f70:	48 8d 8c 24 28 01 00 00 	lea    0x128(%rsp),%rcx
42fe   595f78:	80 e1 07             	and    $0x7,%cl
4301   595f7b:	80 c1 03             	add    $0x3,%cl
4304   595f7e:	38 c1                	cmp    %al,%cl
4306   595f80:	7c 8b                	jl     595f0d <shrink_lruvec+0x4293>
4308   595f82:	48 8d bc 24 28 01 00 00 	lea    0x128(%rsp),%rdi
4310   595f8a:	e8 00 00 00 00       	call   595f8f <shrink_lruvec+0x4315>	595f8b: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
4315   595f8f:	e9 79 ff ff ff       	jmp    595f0d <shrink_lruvec+0x4293>
431a   595f94:	e8 00 00 00 00       	call   595f99 <shrink_lruvec+0x431f>	595f95: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
431f   595f99:	41 bd 04 00 00 00    	mov    $0x4,%r13d
4325   595f9f:	eb 05                	jmp    595fa6 <shrink_lruvec+0x432c>
4327   595fa1:	e8 00 00 00 00       	call   595fa6 <shrink_lruvec+0x432c>	595fa2: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
432c   595fa6:	41 ff cd             	dec    %r13d
432f   595fa9:	e9 f2 c3 ff ff       	jmp    5923a0 <shrink_lruvec+0x726>
4334   595fae:	48 8b 8c 24 90 00 00 00 	mov    0x90(%rsp),%rcx
433c   595fb6:	80 e1 07             	and    $0x7,%cl
433f   595fb9:	fe c1                	inc    %cl
4341   595fbb:	38 c1                	cmp    %al,%cl
4343   595fbd:	0f 8c dc bf ff ff    	jl     591f9f <shrink_lruvec+0x325>
4349   595fc3:	48 8b bc 24 90 00 00 00 	mov    0x90(%rsp),%rdi
4351   595fcb:	e8 00 00 00 00       	call   595fd0 <shrink_lruvec+0x4356>	595fcc: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
4356   595fd0:	4c 8b 7c 24 50       	mov    0x50(%rsp),%r15
435b   595fd5:	e9 c5 bf ff ff       	jmp    591f9f <shrink_lruvec+0x325>
4360   595fda:	89 d9                	mov    %ebx,%ecx
4362   595fdc:	80 e1 07             	and    $0x7,%cl
4365   595fdf:	80 c1 03             	add    $0x3,%cl
4368   595fe2:	38 c1                	cmp    %al,%cl
436a   595fe4:	0f 8c f0 f4 ff ff    	jl     5954da <shrink_lruvec+0x3860>
4370   595fea:	48 89 df             	mov    %rbx,%rdi
4373   595fed:	e8 00 00 00 00       	call   595ff2 <shrink_lruvec+0x4378>	595fee: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
4378   595ff2:	e9 e3 f4 ff ff       	jmp    5954da <shrink_lruvec+0x3860>
437d   595ff7:	89 d9                	mov    %ebx,%ecx
437f   595ff9:	80 e1 07             	and    $0x7,%cl
4382   595ffc:	38 c1                	cmp    %al,%cl
4384   595ffe:	0f 8c ee f6 ff ff    	jl     5956f2 <shrink_lruvec+0x3a78>
438a   596004:	48 89 df             	mov    %rbx,%rdi
438d   596007:	e8 00 00 00 00       	call   59600c <shrink_lruvec+0x4392>	596008: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
4392   59600c:	e9 e1 f6 ff ff       	jmp    5956f2 <shrink_lruvec+0x3a78>
4397   596011:	44 89 f1             	mov    %r14d,%ecx
439a   596014:	80 e1 07             	and    $0x7,%cl
439d   596017:	80 c1 03             	add    $0x3,%cl
43a0   59601a:	38 c1                	cmp    %al,%cl
43a2   59601c:	0f 8c 35 f3 ff ff    	jl     595357 <shrink_lruvec+0x36dd>
43a8   596022:	4c 89 f7             	mov    %r14,%rdi
43ab   596025:	e8 00 00 00 00       	call   59602a <shrink_lruvec+0x43b0>	596026: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
43b0   59602a:	e9 28 f3 ff ff       	jmp    595357 <shrink_lruvec+0x36dd>
43b5   59602f:	89 d9                	mov    %ebx,%ecx
43b7   596031:	80 e1 07             	and    $0x7,%cl
43ba   596034:	38 c1                	cmp    %al,%cl
43bc   596036:	0f 8c 18 c1 ff ff    	jl     592154 <shrink_lruvec+0x4da>
43c2   59603c:	48 89 df             	mov    %rbx,%rdi
43c5   59603f:	e8 00 00 00 00       	call   596044 <shrink_lruvec+0x43ca>	596040: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
43ca   596044:	e9 0b c1 ff ff       	jmp    592154 <shrink_lruvec+0x4da>
43cf   596049:	44 89 e9             	mov    %r13d,%ecx
43d2   59604c:	80 e1 07             	and    $0x7,%cl
43d5   59604f:	80 c1 03             	add    $0x3,%cl
43d8   596052:	38 c1                	cmp    %al,%cl
43da   596054:	0f 8c 4f f2 ff ff    	jl     5952a9 <shrink_lruvec+0x362f>
43e0   59605a:	4c 89 ef             	mov    %r13,%rdi
43e3   59605d:	e8 00 00 00 00       	call   596062 <shrink_lruvec+0x43e8>	59605e: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
43e8   596062:	e9 42 f2 ff ff       	jmp    5952a9 <shrink_lruvec+0x362f>
43ed   596067:	89 d1                	mov    %edx,%ecx
43ef   596069:	80 e1 07             	and    $0x7,%cl
43f2   59606c:	38 c1                	cmp    %al,%cl
43f4   59606e:	0f 8c c1 f6 ff ff    	jl     595735 <shrink_lruvec+0x3abb>
43fa   596074:	48 8b bc 24 f0 00 00 00 	mov    0xf0(%rsp),%rdi
4402   59607c:	e8 00 00 00 00       	call   596081 <shrink_lruvec+0x4407>	59607d: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
4407   596081:	48 8b 94 24 f0 00 00 00 	mov    0xf0(%rsp),%rdx
440f   596089:	e9 a7 f6 ff ff       	jmp    595735 <shrink_lruvec+0x3abb>
4414   59608e:	89 d9                	mov    %ebx,%ecx
4416   596090:	80 e1 07             	and    $0x7,%cl
4419   596093:	80 c1 03             	add    $0x3,%cl
441c   596096:	38 c1                	cmp    %al,%cl
441e   596098:	0f 8c 04 c1 ff ff    	jl     5921a2 <shrink_lruvec+0x528>
4424   59609e:	48 89 df             	mov    %rbx,%rdi
4427   5960a1:	e8 00 00 00 00       	call   5960a6 <shrink_lruvec+0x442c>	5960a2: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
442c   5960a6:	e9 f7 c0 ff ff       	jmp    5921a2 <shrink_lruvec+0x528>
4431   5960ab:	48 8d 8c 24 10 01 00 00 	lea    0x110(%rsp),%rcx
4439   5960b3:	80 e1 04             	and    $0x4,%cl
443c   5960b6:	80 c9 03             	or     $0x3,%cl
443f   5960b9:	38 c1                	cmp    %al,%cl
4441   5960bb:	0f 8c 9b f9 ff ff    	jl     595a5c <shrink_lruvec+0x3de2>
4447   5960c1:	48 8d bc 24 10 01 00 00 	lea    0x110(%rsp),%rdi
444f   5960c9:	e8 00 00 00 00       	call   5960ce <shrink_lruvec+0x4454>	5960ca: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
4454   5960ce:	8b 54 24 34          	mov    0x34(%rsp),%edx
4458   5960d2:	e9 85 f9 ff ff       	jmp    595a5c <shrink_lruvec+0x3de2>
445d   5960d7:	48 8d 8c 24 14 01 00 00 	lea    0x114(%rsp),%rcx
4465   5960df:	80 e1 07             	and    $0x7,%cl
4468   5960e2:	80 c1 03             	add    $0x3,%cl
446b   5960e5:	38 c1                	cmp    %al,%cl
446d   5960e7:	0f 8c 9e f9 ff ff    	jl     595a8b <shrink_lruvec+0x3e11>
4473   5960ed:	48 8d bc 24 14 01 00 00 	lea    0x114(%rsp),%rdi
447b   5960f5:	e8 00 00 00 00       	call   5960fa <shrink_lruvec+0x4480>	5960f6: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
4480   5960fa:	48 8b 94 24 08 02 00 00 	mov    0x208(%rsp),%rdx
4488   596102:	e9 84 f9 ff ff       	jmp    595a8b <shrink_lruvec+0x3e11>
448d   596107:	44 89 f1             	mov    %r14d,%ecx
4490   59610a:	80 e1 07             	and    $0x7,%cl
4493   59610d:	80 c1 03             	add    $0x3,%cl
4496   596110:	38 c1                	cmp    %al,%cl
4498   596112:	0f 8c ac fa ff ff    	jl     595bc4 <shrink_lruvec+0x3f4a>
449e   596118:	4c 89 f7             	mov    %r14,%rdi
44a1   59611b:	e8 00 00 00 00       	call   596120 <shrink_lruvec+0x44a6>	59611c: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
44a6   596120:	e9 9f fa ff ff       	jmp    595bc4 <shrink_lruvec+0x3f4a>
44ab   596125:	48 8d 8c 24 28 01 00 00 	lea    0x128(%rsp),%rcx
44b3   59612d:	80 e1 07             	and    $0x7,%cl
44b6   596130:	80 c1 03             	add    $0x3,%cl
44b9   596133:	38 c1                	cmp    %al,%cl
44bb   596135:	0f 8c c8 fb ff ff    	jl     595d03 <shrink_lruvec+0x4089>
44c1   59613b:	48 8d bc 24 28 01 00 00 	lea    0x128(%rsp),%rdi
44c9   596143:	e8 00 00 00 00       	call   596148 <shrink_lruvec+0x44ce>	596144: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
44ce   596148:	e9 b6 fb ff ff       	jmp    595d03 <shrink_lruvec+0x4089>
44d3   59614d:	44 89 e9             	mov    %r13d,%ecx
44d6   596150:	80 e1 07             	and    $0x7,%cl
44d9   596153:	80 c1 03             	add    $0x3,%cl
44dc   596156:	38 c1                	cmp    %al,%cl
44de   596158:	0f 8c 39 fc ff ff    	jl     595d97 <shrink_lruvec+0x411d>
44e4   59615e:	4c 89 ef             	mov    %r13,%rdi
44e7   596161:	e8 00 00 00 00       	call   596166 <shrink_lruvec+0x44ec>	596162: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
44ec   596166:	e9 2c fc ff ff       	jmp    595d97 <shrink_lruvec+0x411d>
44f1   59616b:	89 d9                	mov    %ebx,%ecx
44f3   59616d:	80 e1 07             	and    $0x7,%cl
44f6   596170:	80 c1 03             	add    $0x3,%cl
44f9   596173:	38 c1                	cmp    %al,%cl
44fb   596175:	0f 8c 60 fc ff ff    	jl     595ddb <shrink_lruvec+0x4161>
4501   59617b:	48 89 df             	mov    %rbx,%rdi
4504   59617e:	e8 00 00 00 00       	call   596183 <shrink_lruvec+0x4509>	59617f: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
4509   596183:	e9 53 fc ff ff       	jmp    595ddb <shrink_lruvec+0x4161>
450e   596188:	e8 00 00 00 00       	call   59618d <shrink_lruvec+0x4513>	596189: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4513   59618d:	4c 8b bc 24 d8 00 00 00 	mov    0xd8(%rsp),%r15
451b   596195:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
4525   59619f:	48 8b 8c 24 e0 01 00 00 	mov    0x1e0(%rsp),%rcx
452d   5961a7:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
4531   5961ab:	74 08                	je     5961b5 <shrink_lruvec+0x453b>
4533   5961ad:	4c 89 ff             	mov    %r15,%rdi
4536   5961b0:	e8 00 00 00 00       	call   5961b5 <shrink_lruvec+0x453b>	5961b1: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
453b   5961b5:	49 83 07 40          	addq   $0x40,(%r15)
453f   5961b9:	eb 2f                	jmp    5961ea <shrink_lruvec+0x4570>
4541   5961bb:	e8 00 00 00 00       	call   5961c0 <shrink_lruvec+0x4546>	5961bc: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4546   5961c0:	e9 9e 00 00 00       	jmp    596263 <shrink_lruvec+0x45e9>
454b   5961c5:	e8 00 00 00 00       	call   5961ca <shrink_lruvec+0x4550>	5961c6: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4550   5961ca:	e9 94 00 00 00       	jmp    596263 <shrink_lruvec+0x45e9>
4555   5961cf:	e8 00 00 00 00       	call   5961d4 <shrink_lruvec+0x455a>	5961d0: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
455a   5961d4:	eb 0c                	jmp    5961e2 <shrink_lruvec+0x4568>
455c   5961d6:	e8 00 00 00 00       	call   5961db <shrink_lruvec+0x4561>	5961d7: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4561   5961db:	eb 05                	jmp    5961e2 <shrink_lruvec+0x4568>
4563   5961dd:	e8 00 00 00 00       	call   5961e2 <shrink_lruvec+0x4568>	5961de: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4568   5961e2:	4c 8b bc 24 d8 00 00 00 	mov    0xd8(%rsp),%r15
4570   5961ea:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
457a   5961f4:	48 8b 8c 24 e0 01 00 00 	mov    0x1e0(%rsp),%rcx
4582   5961fc:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
4586   596200:	74 08                	je     59620a <shrink_lruvec+0x4590>
4588   596202:	4c 89 ff             	mov    %r15,%rdi
458b   596205:	e8 00 00 00 00       	call   59620a <shrink_lruvec+0x4590>	596206: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
4590   59620a:	49 8b 1f             	mov    (%r15),%rbx
4593   59620d:	48 2b 9c 24 e8 02 00 00 	sub    0x2e8(%rsp),%rbx
459b   596215:	bf 3f 00 00 00       	mov    $0x3f,%edi
45a0   59621a:	48 89 de             	mov    %rbx,%rsi
45a3   59621d:	e8 00 00 00 00       	call   596222 <shrink_lruvec+0x45a8>	59621e: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
45a8   596222:	48 83 fb 40          	cmp    $0x40,%rbx
45ac   596226:	72 36                	jb     59625e <shrink_lruvec+0x45e4>
45ae   596228:	80 b4 24 c7 00 00 00 01 	xorb   $0x1,0xc7(%rsp)
45b6   596230:	74 2c                	je     59625e <shrink_lruvec+0x45e4>
45b8   596232:	e8 00 00 00 00       	call   596237 <shrink_lruvec+0x45bd>	596233: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
45bd   596237:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
45c7   596241:	48 8b 8c 24 f8 01 00 00 	mov    0x1f8(%rsp),%rcx
45cf   596249:	8a 04 01             	mov    (%rcx,%rax,1),%al
45d2   59624c:	84 c0                	test   %al,%al
45d4   59624e:	75 56                	jne    5962a6 <shrink_lruvec+0x462c>
45d6   596250:	48 8b 84 24 90 00 00 00 	mov    0x90(%rsp),%rax
45de   596258:	80 60 01 7f          	andb   $0x7f,0x1(%rax)
45e2   59625c:	eb 05                	jmp    596263 <shrink_lruvec+0x45e9>
45e4   59625e:	e8 00 00 00 00       	call   596263 <shrink_lruvec+0x45e9>	59625f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
45e9   596263:	e8 f4 2d 00 00       	call   59905c <clear_mm_walk>
45ee   596268:	48 8d bc 24 58 02 00 00 	lea    0x258(%rsp),%rdi
45f6   596270:	e8 00 00 00 00       	call   596275 <shrink_lruvec+0x45fb>	596271: R_X86_64_PLT32	blk_finish_plug-0x4
45fb   596275:	48 8d 65 d8          	lea    -0x28(%rbp),%rsp
45ff   596279:	5b                   	pop    %rbx
4600   59627a:	41 5c                	pop    %r12
4602   59627c:	41 5d                	pop    %r13
4604   59627e:	41 5e                	pop    %r14
4606   596280:	41 5f                	pop    %r15
4608   596282:	5d                   	pop    %rbp
4609   596283:	c3                   	ret
460a   596284:	e8 00 00 00 00       	call   596289 <shrink_lruvec+0x460f>	596285: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
460f   596289:	eb d8                	jmp    596263 <shrink_lruvec+0x45e9>
4611   59628b:	e8 00 00 00 00       	call   596290 <shrink_lruvec+0x4616>	59628c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4616   596290:	e9 00 ff ff ff       	jmp    596195 <shrink_lruvec+0x451b>
461b   596295:	e8 00 00 00 00       	call   59629a <shrink_lruvec+0x4620>	596296: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4620   59629a:	eb c7                	jmp    596263 <shrink_lruvec+0x45e9>
4622   59629c:	e8 00 00 00 00       	call   5962a1 <shrink_lruvec+0x4627>	59629d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4627   5962a1:	e9 e7 fe ff ff       	jmp    59618d <shrink_lruvec+0x4513>
462c   5962a6:	48 8b 8c 24 90 00 00 00 	mov    0x90(%rsp),%rcx
4634   5962ae:	80 e1 07             	and    $0x7,%cl
4637   5962b1:	fe c1                	inc    %cl
4639   5962b3:	38 c1                	cmp    %al,%cl
463b   5962b5:	7c 99                	jl     596250 <shrink_lruvec+0x45d6>
463d   5962b7:	48 8b bc 24 90 00 00 00 	mov    0x90(%rsp),%rdi
4645   5962bf:	e8 00 00 00 00       	call   5962c4 <shrink_lruvec+0x464a>	5962c0: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
464a   5962c4:	eb 8a                	jmp    596250 <shrink_lruvec+0x45d6>
464c   5962c6:	48 63 05 00 00 00 00 	movslq 0x0(%rip),%rax        # 5962cd <shrink_lruvec+0x4653>	5962c9: R_X86_64_PC32	vm_swappiness-0x4
4653   5962cd:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
4658   5962d2:	49 83 c4 28          	add    $0x28,%r12
465c   5962d6:	48 8d bc 24 30 01 00 00 	lea    0x130(%rsp),%rdi
4664   5962de:	ba 10 00 00 00       	mov    $0x10,%edx
4669   5962e3:	be aa 00 00 00       	mov    $0xaa,%esi
466e   5962e8:	e8 00 00 00 00       	call   5962ed <shrink_lruvec+0x4673>	5962e9: R_X86_64_PLT32	memset-0x4
4673   5962ed:	4c 89 e0             	mov    %r12,%rax
4676   5962f0:	4c 89 a4 24 80 00 00 00 	mov    %r12,0x80(%rsp)
467e   5962f8:	49 c1 ec 03          	shr    $0x3,%r12
4682   5962fc:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
468c   596306:	4c 89 a4 24 a8 01 00 00 	mov    %r12,0x1a8(%rsp)
4694   59630e:	41 8a 04 04          	mov    (%r12,%rax,1),%al
4698   596312:	84 c0                	test   %al,%al
469a   596314:	0f 85 fd 1c 00 00    	jne    598017 <shrink_lruvec+0x639d>
46a0   59631a:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
46a5   59631f:	48 05 18 c1 ff ff    	add    $0xffffffffffffc118,%rax
46ab   596325:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
46b0   59632a:	48 8b 84 24 80 00 00 00 	mov    0x80(%rsp),%rax
46b8   596332:	44 0f b7 20          	movzwl (%rax),%r12d
46bc   596336:	44 89 e6             	mov    %r12d,%esi
46bf   596339:	83 e6 40             	and    $0x40,%esi
46c2   59633c:	31 ff                	xor    %edi,%edi
46c4   59633e:	e8 00 00 00 00       	call   596343 <shrink_lruvec+0x46c9>	59633f: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp2-0x4
46c9   596343:	41 83 e4 40          	and    $0x40,%r12d
46cd   596347:	0f 85 ed 04 00 00    	jne    59683a <shrink_lruvec+0x4bc0>
46d3   59634d:	e8 00 00 00 00       	call   596352 <shrink_lruvec+0x46d8>	59634e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
46d8   596352:	b8 03 00 00 00       	mov    $0x3,%eax
46dd   596357:	b9 01 00 00 00       	mov    $0x1,%ecx
46e2   59635c:	48 89 8c 24 a8 00 00 00 	mov    %rcx,0xa8(%rsp)
46ea   596364:	31 c9                	xor    %ecx,%ecx
46ec   596366:	48 89 8c 24 88 00 00 00 	mov    %rcx,0x88(%rsp)
46f4   59636e:	48 8b 4c 24 50       	mov    0x50(%rsp),%rcx
46f9   596373:	48 8d 51 3a          	lea    0x3a(%rcx),%rdx
46fd   596377:	48 83 c1 39          	add    $0x39,%rcx
4701   59637b:	48 89 8c 24 c8 00 00 00 	mov    %rcx,0xc8(%rsp)
4709   596383:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
470e   596388:	48 8d b1 60 c7 ff ff 	lea    -0x38a0(%rcx),%rsi
4715   59638f:	48 89 d1             	mov    %rdx,%rcx
4718   596392:	48 89 94 24 e0 00 00 00 	mov    %rdx,0xe0(%rsp)
4720   59639a:	48 c1 ea 03          	shr    $0x3,%rdx
4724   59639e:	48 89 94 24 70 01 00 00 	mov    %rdx,0x170(%rsp)
472c   5963a6:	89 c0                	mov    %eax,%eax
472e   5963a8:	48 89 84 24 b8 00 00 00 	mov    %rax,0xb8(%rsp)
4736   5963b0:	48 8b 04 c5 00 00 00 00 	mov    0x0(,%rax,8),%rax	5963b4: R_X86_64_32S	.rodata+0x129580
473e   5963b8:	48 89 84 24 d0 00 00 00 	mov    %rax,0xd0(%rsp)
4746   5963c0:	48 89 74 24 40       	mov    %rsi,0x40(%rsp)
474b   5963c5:	48 89 74 24 38       	mov    %rsi,0x38(%rsp)
4750   5963ca:	31 c0                	xor    %eax,%eax
4752   5963cc:	48 89 44 24 58       	mov    %rax,0x58(%rsp)
4757   5963d1:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
475c   5963d6:	41 89 c4             	mov    %eax,%r12d
475f   5963d9:	41 83 e4 fe          	and    $0xfffffffe,%r12d
4763   5963dd:	bf 02 00 00 00       	mov    $0x2,%edi
4768   5963e2:	4c 89 e6             	mov    %r12,%rsi
476b   5963e5:	e8 00 00 00 00       	call   5963ea <shrink_lruvec+0x4770>	5963e6: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
4770   5963ea:	4c 89 64 24 48       	mov    %r12,0x48(%rsp)
4775   5963ef:	49 83 fc 02          	cmp    $0x2,%r12
4779   5963f3:	0f 94 44 24 78       	sete   0x78(%rsp)
477e   5963f8:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
4788   596402:	48 8b 8c 24 70 01 00 00 	mov    0x170(%rsp),%rcx
4790   59640a:	8a 04 01             	mov    (%rcx,%rax,1),%al
4793   59640d:	84 c0                	test   %al,%al
4795   59640f:	0f 85 fd 02 00 00    	jne    596712 <shrink_lruvec+0x4a98>
479b   596415:	48 8b 84 24 e0 00 00 00 	mov    0xe0(%rsp),%rax
47a3   59641d:	44 0f b6 20          	movzbl (%rax),%r12d
47a7   596421:	31 ff                	xor    %edi,%edi
47a9   596423:	44 89 e6             	mov    %r12d,%esi
47ac   596426:	e8 00 00 00 00       	call   59642b <shrink_lruvec+0x47b1>	596427: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
47b1   59642b:	45 84 e4             	test   %r12b,%r12b
47b4   59642e:	0f 88 58 01 00 00    	js     59658c <shrink_lruvec+0x4912>
47ba   596434:	49 69 c4 c0 06 00 00 	imul   $0x6c0,%r12,%rax
47c1   59643b:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
47c6   596440:	31 c0                	xor    %eax,%eax
47c8   596442:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
47cd   596447:	31 c0                	xor    %eax,%eax
47cf   596449:	48 89 04 24          	mov    %rax,(%rsp)
47d3   59644d:	31 c0                	xor    %eax,%eax
47d5   59644f:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
47da   596454:	bf 05 00 00 00       	mov    $0x5,%edi
47df   596459:	4c 8b 24 24          	mov    (%rsp),%r12
47e3   59645d:	4c 89 e6             	mov    %r12,%rsi
47e6   596460:	e8 00 00 00 00       	call   596465 <shrink_lruvec+0x47eb>	596461: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
47eb   596465:	49 83 fc 04          	cmp    $0x4,%r12
47ef   596469:	0f 87 fc 00 00 00    	ja     59656b <shrink_lruvec+0x48f1>
47f5   59646f:	e8 00 00 00 00       	call   596474 <shrink_lruvec+0x47fa>	596470: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
47fa   596474:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
47ff   596479:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
4804   59647e:	4c 8d 24 08          	lea    (%rax,%rcx,1),%r12
4808   596482:	49 81 c4 98 c1 ff ff 	add    $0xffffffffffffc198,%r12
480f   596489:	4c 89 e7             	mov    %r12,%rdi
4812   59648c:	be 08 00 00 00       	mov    $0x8,%esi
4817   596491:	e8 00 00 00 00       	call   596496 <shrink_lruvec+0x481c>	596492: R_X86_64_PLT32	__kasan_check_read-0x4
481c   596496:	4c 89 e0             	mov    %r12,%rax
481f   596499:	48 c1 e8 03          	shr    $0x3,%rax
4823   59649d:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
482d   5964a7:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
4831   5964ab:	74 08                	je     5964b5 <shrink_lruvec+0x483b>
4833   5964ad:	4c 89 e7             	mov    %r12,%rdi
4836   5964b0:	e8 00 00 00 00       	call   5964b5 <shrink_lruvec+0x483b>	5964b1: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
483b   5964b5:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
4840   5964ba:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
4845   5964bf:	4c 8b a4 08 98 c1 ff ff 	mov    -0x3e68(%rax,%rcx,1),%r12
484d   5964c7:	31 ff                	xor    %edi,%edi
484f   5964c9:	4c 89 e6             	mov    %r12,%rsi
4852   5964cc:	e8 00 00 00 00       	call   5964d1 <shrink_lruvec+0x4857>	5964cd: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
4857   5964d1:	4d 85 e4             	test   %r12,%r12
485a   5964d4:	74 6d                	je     596543 <shrink_lruvec+0x48c9>
485c   5964d6:	e8 00 00 00 00       	call   5964db <shrink_lruvec+0x4861>	5964d7: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4861   5964db:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
4866   5964e0:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
486b   5964e5:	4a 8d 3c 20          	lea    (%rax,%r12,1),%rdi
486f   5964e9:	be 08 00 00 00       	mov    $0x8,%esi
4874   5964ee:	e8 00 00 00 00       	call   5964f3 <shrink_lruvec+0x4879>	5964ef: R_X86_64_PLT32	__kasan_check_read-0x4
4879   5964f3:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
487e   5964f8:	4a 8d 3c 20          	lea    (%rax,%r12,1),%rdi
4882   5964fc:	48 89 f8             	mov    %rdi,%rax
4885   5964ff:	48 c1 e8 03          	shr    $0x3,%rax
4889   596503:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
4893   59650d:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
4897   596511:	74 05                	je     596518 <shrink_lruvec+0x489e>
4899   596513:	e8 00 00 00 00       	call   596518 <shrink_lruvec+0x489e>	596514: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
489e   596518:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
48a3   59651d:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
48a8   596522:	4c 8b 24 08          	mov    (%rax,%rcx,1),%r12
48ac   596526:	31 ff                	xor    %edi,%edi
48ae   596528:	4c 89 e6             	mov    %r12,%rsi
48b1   59652b:	e8 00 00 00 00       	call   596530 <shrink_lruvec+0x48b6>	59652c: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
48b6   596530:	4d 85 e4             	test   %r12,%r12
48b9   596533:	b8 00 00 00 00       	mov    $0x0,%eax
48be   596538:	4c 0f 48 e0          	cmovs  %rax,%r12
48c2   59653c:	4c 01 64 24 20       	add    %r12,0x20(%rsp)
48c7   596541:	eb 05                	jmp    596548 <shrink_lruvec+0x48ce>
48c9   596543:	e8 00 00 00 00       	call   596548 <shrink_lruvec+0x48ce>	596544: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
48ce   596548:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
48d3   59654d:	48 39 44 24 28       	cmp    %rax,0x28(%rsp)
48d8   596552:	74 31                	je     596585 <shrink_lruvec+0x490b>
48da   596554:	e8 00 00 00 00       	call   596559 <shrink_lruvec+0x48df>	596555: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
48df   596559:	48 81 44 24 08 c0 06 00 00 	addq   $0x6c0,0x8(%rsp)
48e8   596562:	48 ff 04 24          	incq   (%rsp)
48ec   596566:	e9 e9 fe ff ff       	jmp    596454 <shrink_lruvec+0x47da>
48f1   59656b:	e8 00 00 00 00       	call   596570 <shrink_lruvec+0x48f6>	59656c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
48f6   596570:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	596573: R_X86_64_32S	.data+0x599b20
48fd   596577:	48 8b 34 24          	mov    (%rsp),%rsi
4901   59657b:	e8 00 00 00 00       	call   596580 <shrink_lruvec+0x4906>	59657c: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
4906   596580:	e9 ef fe ff ff       	jmp    596474 <shrink_lruvec+0x47fa>
490b   596585:	e8 00 00 00 00       	call   59658a <shrink_lruvec+0x4910>	596586: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4910   59658a:	eb 0c                	jmp    596598 <shrink_lruvec+0x491e>
4912   59658c:	e8 00 00 00 00       	call   596591 <shrink_lruvec+0x4917>	59658d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4917   596591:	31 c0                	xor    %eax,%eax
4919   596593:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
491e   596598:	48 8b 8c 24 c8 00 00 00 	mov    0xc8(%rsp),%rcx
4926   5965a0:	48 c1 e9 03          	shr    $0x3,%rcx
492a   5965a4:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
4934   5965ae:	48 89 8c 24 b0 00 00 00 	mov    %rcx,0xb0(%rsp)
493c   5965b6:	8a 04 01             	mov    (%rcx,%rax,1),%al
493f   5965b9:	84 c0                	test   %al,%al
4941   5965bb:	0f 85 76 01 00 00    	jne    596737 <shrink_lruvec+0x4abd>
4947   5965c1:	48 8b 84 24 c8 00 00 00 	mov    0xc8(%rsp),%rax
494f   5965c9:	48 0f be 00          	movsbq (%rax),%rax
4953   5965cd:	41 89 c4             	mov    %eax,%r12d
4956   5965d0:	bf 40 00 00 00       	mov    $0x40,%edi
495b   5965d5:	4c 89 e6             	mov    %r12,%rsi
495e   5965d8:	e8 00 00 00 00       	call   5965dd <shrink_lruvec+0x4963>	5965d9: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
4963   5965dd:	49 83 fc 3f          	cmp    $0x3f,%r12
4967   5965e1:	0f 87 75 01 00 00    	ja     59675c <shrink_lruvec+0x4ae2>
496d   5965e7:	e8 00 00 00 00       	call   5965ec <shrink_lruvec+0x4972>	5965e8: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4972   5965ec:	44 89 e1             	mov    %r12d,%ecx
4975   5965ef:	48 d3 6c 24 20       	shrq   %cl,0x20(%rsp)
497a   5965f4:	48 8b bc 24 b8 00 00 00 	mov    0xb8(%rsp),%rdi
4982   5965fc:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	5965ff: R_X86_64_32S	.data+0x599e10
4989   596603:	e8 00 00 00 00       	call   596608 <shrink_lruvec+0x498e>	596604: R_X86_64_PLT32	__sanitizer_cov_trace_switch-0x4
498e   596608:	ff a4 24 d0 00 00 00 	jmp    *0xd0(%rsp)
4995   59660f:	e8 00 00 00 00       	call   596614 <shrink_lruvec+0x499a>	596610: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
499a   596614:	e9 97 00 00 00       	jmp    5966b0 <shrink_lruvec+0x4a36>
499f   596619:	45 31 e4             	xor    %r12d,%r12d
49a2   59661c:	83 7c 24 48 02       	cmpl   $0x2,0x48(%rsp)
49a7   596621:	41 0f 94 c4          	sete   %r12b
49ab   596625:	e8 00 00 00 00       	call   59662a <shrink_lruvec+0x49b0>	596626: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
49b0   59662a:	4e 8d 24 e4          	lea    (%rsp,%r12,8),%r12
49b4   59662e:	49 81 c4 30 01 00 00 	add    $0x130,%r12
49bb   596635:	4c 89 e0             	mov    %r12,%rax
49be   596638:	48 c1 e8 03          	shr    $0x3,%rax
49c2   59663c:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
49cc   596646:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
49d0   59664a:	74 08                	je     596654 <shrink_lruvec+0x49da>
49d2   59664c:	4c 89 e7             	mov    %r12,%rdi
49d5   59664f:	e8 00 00 00 00       	call   596654 <shrink_lruvec+0x49da>	596650: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
49da   596654:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
49df   596659:	49 0f af 04 24       	imul   (%r12),%rax
49e4   59665e:	31 d2                	xor    %edx,%edx
49e6   596660:	48 f7 b4 24 88 00 00 00 	divq   0x88(%rsp)
49ee   596668:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
49f3   59666d:	eb 41                	jmp    5966b0 <shrink_lruvec+0x4a36>
49f5   59666f:	e8 00 00 00 00       	call   596674 <shrink_lruvec+0x49fa>	596670: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
49fa   596674:	eb 05                	jmp    59667b <shrink_lruvec+0x4a01>
49fc   596676:	e8 00 00 00 00       	call   59667b <shrink_lruvec+0x4a01>	596677: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4a01   59667b:	45 31 e4             	xor    %r12d,%r12d
4a04   59667e:	8a 44 24 78          	mov    0x78(%rsp),%al
4a08   596682:	41 88 c4             	mov    %al,%r12b
4a0b   596685:	48 8b bc 24 a8 00 00 00 	mov    0xa8(%rsp),%rdi
4a13   59668d:	44 89 e6             	mov    %r12d,%esi
4a16   596690:	e8 00 00 00 00       	call   596695 <shrink_lruvec+0x4a1b>	596691: R_X86_64_PLT32	__sanitizer_cov_trace_cmp4-0x4
4a1b   596695:	44 39 a4 24 a8 00 00 00 	cmp    %r12d,0xa8(%rsp)
4a23   59669d:	b8 00 00 00 00       	mov    $0x0,%eax
4a28   5966a2:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
4a2d   5966a7:	48 0f 45 c8          	cmovne %rax,%rcx
4a31   5966ab:	48 89 4c 24 20       	mov    %rcx,0x20(%rsp)
4a36   5966b0:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
4a3b   5966b5:	48 8d 3c c4          	lea    (%rsp,%rax,8),%rdi
4a3f   5966b9:	48 81 c7 b0 01 00 00 	add    $0x1b0,%rdi
4a46   5966c0:	48 89 f8             	mov    %rdi,%rax
4a49   5966c3:	48 c1 e8 03          	shr    $0x3,%rax
4a4d   5966c7:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
4a57   5966d1:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
4a5b   5966d5:	74 05                	je     5966dc <shrink_lruvec+0x4a62>
4a5d   5966d7:	e8 00 00 00 00       	call   5966dc <shrink_lruvec+0x4a62>	5966d8: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
4a62   5966dc:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
4a67   5966e1:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
4a6c   5966e6:	48 89 8c c4 b0 01 00 00 	mov    %rcx,0x1b0(%rsp,%rax,8)
4a74   5966ee:	48 ff c0             	inc    %rax
4a77   5966f1:	48 89 44 24 58       	mov    %rax,0x58(%rsp)
4a7c   5966f6:	48 83 f8 04          	cmp    $0x4,%rax
4a80   5966fa:	74 7e                	je     59677a <shrink_lruvec+0x4b00>
4a82   5966fc:	e8 00 00 00 00       	call   596701 <shrink_lruvec+0x4a87>	5966fd: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4a87   596701:	48 83 44 24 38 08    	addq   $0x8,0x38(%rsp)
4a8d   596707:	48 83 44 24 40 08    	addq   $0x8,0x40(%rsp)
4a93   59670d:	e9 bf fc ff ff       	jmp    5963d1 <shrink_lruvec+0x4757>
4a98   596712:	48 8b 8c 24 e0 00 00 00 	mov    0xe0(%rsp),%rcx
4aa0   59671a:	80 e1 07             	and    $0x7,%cl
4aa3   59671d:	38 c1                	cmp    %al,%cl
4aa5   59671f:	0f 8c f0 fc ff ff    	jl     596415 <shrink_lruvec+0x479b>
4aab   596725:	48 8b bc 24 e0 00 00 00 	mov    0xe0(%rsp),%rdi
4ab3   59672d:	e8 00 00 00 00       	call   596732 <shrink_lruvec+0x4ab8>	59672e: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
4ab8   596732:	e9 de fc ff ff       	jmp    596415 <shrink_lruvec+0x479b>
4abd   596737:	48 8b 8c 24 c8 00 00 00 	mov    0xc8(%rsp),%rcx
4ac5   59673f:	80 e1 07             	and    $0x7,%cl
4ac8   596742:	38 c1                	cmp    %al,%cl
4aca   596744:	0f 8c 77 fe ff ff    	jl     5965c1 <shrink_lruvec+0x4947>
4ad0   59674a:	48 8b bc 24 c8 00 00 00 	mov    0xc8(%rsp),%rdi
4ad8   596752:	e8 00 00 00 00       	call   596757 <shrink_lruvec+0x4add>	596753: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
4add   596757:	e9 65 fe ff ff       	jmp    5965c1 <shrink_lruvec+0x4947>
4ae2   59675c:	e8 00 00 00 00       	call   596761 <shrink_lruvec+0x4ae7>	59675d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4ae7   596761:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	596764: R_X86_64_32S	.data+0x599b00
4aee   596768:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
4af3   59676d:	4c 89 e2             	mov    %r12,%rdx
4af6   596770:	e8 00 00 00 00       	call   596775 <shrink_lruvec+0x4afb>	596771: R_X86_64_PLT32	__ubsan_handle_shift_out_of_bounds-0x4
4afb   596775:	e9 72 fe ff ff       	jmp    5965ec <shrink_lruvec+0x4972>
4b00   59677a:	48 8d bc 24 80 02 00 00 	lea    0x280(%rsp),%rdi
4b08   596782:	48 8d b4 24 b0 01 00 00 	lea    0x1b0(%rsp),%rsi
4b10   59678a:	ba 28 00 00 00       	mov    $0x28,%edx
4b15   59678f:	e8 00 00 00 00       	call   596794 <shrink_lruvec+0x4b1a>	596790: R_X86_64_PLT32	memcpy-0x4
4b1a   596794:	65 48 8b 04 25 00 00 00 00 	mov    %gs:0x0,%rax	596799: R_X86_64_32S	current_task
4b23   59679d:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
4b28   5967a2:	48 8d 48 2c          	lea    0x2c(%rax),%rcx
4b2c   5967a6:	48 89 c8             	mov    %rcx,%rax
4b2f   5967a9:	48 89 4c 24 48       	mov    %rcx,0x48(%rsp)
4b34   5967ae:	48 c1 e9 03          	shr    $0x3,%rcx
4b38   5967b2:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
4b42   5967bc:	48 89 8c 24 a8 00 00 00 	mov    %rcx,0xa8(%rsp)
4b4a   5967c4:	8a 04 01             	mov    (%rcx,%rax,1),%al
4b4d   5967c7:	84 c0                	test   %al,%al
4b4f   5967c9:	0f 85 6f 18 00 00    	jne    59803e <shrink_lruvec+0x63c4>
4b55   5967cf:	48 8b 44 24 48       	mov    0x48(%rsp),%rax
4b5a   5967d4:	44 8b 20             	mov    (%rax),%r12d
4b5d   5967d7:	c7 04 24 00 00 02 00 	movl   $0x20000,(%rsp)
4b64   5967de:	be 00 00 02 00       	mov    $0x20000,%esi
4b69   5967e3:	44 21 e6             	and    %r12d,%esi
4b6c   5967e6:	31 ff                	xor    %edi,%edi
4b6e   5967e8:	e8 00 00 00 00       	call   5967ed <shrink_lruvec+0x4b73>	5967e9: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
4b73   5967ed:	44 21 24 24          	and    %r12d,(%rsp)
4b77   5967f1:	0f 85 3e 01 00 00    	jne    596935 <shrink_lruvec+0x4cbb>
4b7d   5967f7:	e8 00 00 00 00       	call   5967fc <shrink_lruvec+0x4b82>	5967f8: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4b82   5967fc:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
4b8c   596806:	48 8b 8c 24 b0 00 00 00 	mov    0xb0(%rsp),%rcx
4b94   59680e:	8a 04 01             	mov    (%rcx,%rax,1),%al
4b97   596811:	84 c0                	test   %al,%al
4b99   596813:	0f 85 47 18 00 00    	jne    598060 <shrink_lruvec+0x63e6>
4b9f   596819:	48 8b 84 24 c8 00 00 00 	mov    0xc8(%rsp),%rax
4ba7   596821:	0f b6 30             	movzbl (%rax),%esi
4baa   596824:	83 fe 0c             	cmp    $0xc,%esi
4bad   596827:	41 0f 94 c4          	sete   %r12b
4bb1   59682b:	bf 0c 00 00 00       	mov    $0xc,%edi
4bb6   596830:	e8 00 00 00 00       	call   596835 <shrink_lruvec+0x4bbb>	596831: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
4bbb   596835:	e9 03 01 00 00       	jmp    59693d <shrink_lruvec+0x4cc3>
4bc0   59683a:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
4bc5   59683f:	4c 8d a0 80 3b 00 00 	lea    0x3b80(%rax),%r12
4bcc   596846:	4c 89 e0             	mov    %r12,%rax
4bcf   596849:	48 c1 e8 03          	shr    $0x3,%rax
4bd3   59684d:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
4bdd   596857:	8a 04 08             	mov    (%rax,%rcx,1),%al
4be0   59685a:	84 c0                	test   %al,%al
4be2   59685c:	0f 85 23 18 00 00    	jne    598085 <shrink_lruvec+0x640b>
4be8   596862:	41 8b 04 24          	mov    (%r12),%eax
4bec   596866:	89 04 24             	mov    %eax,(%rsp)
4bef   596869:	49 c7 c4 00 00 00 00 	mov    $0x0,%r12	59686c: R_X86_64_32S	nr_swap_pages
4bf6   596870:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	596873: R_X86_64_32S	nr_swap_pages
4bfd   596877:	be 08 00 00 00       	mov    $0x8,%esi
4c02   59687c:	e8 00 00 00 00       	call   596881 <shrink_lruvec+0x4c07>	59687d: R_X86_64_PLT32	__kasan_check_read-0x4
4c07   596881:	49 c1 ec 03          	shr    $0x3,%r12
4c0b   596885:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
4c15   59688f:	41 80 3c 04 00       	cmpb   $0x0,(%r12,%rax,1)
4c1a   596894:	74 0c                	je     5968a2 <shrink_lruvec+0x4c28>
4c1c   596896:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	596899: R_X86_64_32S	nr_swap_pages
4c23   59689d:	e8 00 00 00 00       	call   5968a2 <shrink_lruvec+0x4c28>	59689e: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
4c28   5968a2:	4c 8b 25 00 00 00 00 	mov    0x0(%rip),%r12        # 5968a9 <shrink_lruvec+0x4c2f>	5968a5: R_X86_64_PC32	nr_swap_pages-0x4
4c2f   5968a9:	31 ff                	xor    %edi,%edi
4c31   5968ab:	4c 89 e6             	mov    %r12,%rsi
4c34   5968ae:	e8 00 00 00 00       	call   5968b3 <shrink_lruvec+0x4c39>	5968af: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
4c39   5968b3:	4d 85 e4             	test   %r12,%r12
4c3c   5968b6:	0f 8e c5 14 00 00    	jle    597d81 <shrink_lruvec+0x6107>
4c42   5968bc:	e8 00 00 00 00       	call   5968c1 <shrink_lruvec+0x4c47>	5968bd: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4c47   5968c1:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
4c4c   5968c6:	4c 8d 60 39          	lea    0x39(%rax),%r12
4c50   5968ca:	4c 89 e0             	mov    %r12,%rax
4c53   5968cd:	48 c1 e8 03          	shr    $0x3,%rax
4c57   5968d1:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
4c61   5968db:	8a 04 08             	mov    (%rax,%rcx,1),%al
4c64   5968de:	84 c0                	test   %al,%al
4c66   5968e0:	0f 85 bd 17 00 00    	jne    5980a3 <shrink_lruvec+0x6429>
4c6c   5968e6:	45 0f b6 24 24       	movzbl (%r12),%r12d
4c71   5968eb:	31 ff                	xor    %edi,%edi
4c73   5968ed:	44 89 e6             	mov    %r12d,%esi
4c76   5968f0:	e8 00 00 00 00       	call   5968f5 <shrink_lruvec+0x4c7b>	5968f1: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
4c7b   5968f5:	31 ff                	xor    %edi,%edi
4c7d   5968f7:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
4c82   5968fc:	e8 00 00 00 00       	call   596901 <shrink_lruvec+0x4c87>	5968fd: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
4c87   596901:	45 85 e4             	test   %r12d,%r12d
4c8a   596904:	0f 85 0e 15 00 00    	jne    597e18 <shrink_lruvec+0x619e>
4c90   59690a:	83 7c 24 08 00       	cmpl   $0x0,0x8(%rsp)
4c95   59690f:	0f 84 03 15 00 00    	je     597e18 <shrink_lruvec+0x619e>
4c9b   596915:	e8 00 00 00 00       	call   59691a <shrink_lruvec+0x4ca0>	596916: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4ca0   59691a:	31 c0                	xor    %eax,%eax
4ca2   59691c:	48 89 84 24 88 00 00 00 	mov    %rax,0x88(%rsp)
4caa   596924:	31 c0                	xor    %eax,%eax
4cac   596926:	48 89 84 24 a8 00 00 00 	mov    %rax,0xa8(%rsp)
4cb4   59692e:	31 c0                	xor    %eax,%eax
4cb6   596930:	e9 39 fa ff ff       	jmp    59636e <shrink_lruvec+0x46f4>
4cbb   596935:	e8 00 00 00 00       	call   59693a <shrink_lruvec+0x4cc0>	596936: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4cc0   59693a:	45 31 e4             	xor    %r12d,%r12d
4cc3   59693d:	48 8d bc 24 20 03 00 00 	lea    0x320(%rsp),%rdi
4ccb   596945:	e8 00 00 00 00       	call   59694a <shrink_lruvec+0x4cd0>	596946: R_X86_64_PLT32	blk_start_plug-0x4
4cd0   59694a:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
4cd5   59694f:	48 8d 48 3c          	lea    0x3c(%rax),%rcx
4cd9   596953:	48 89 4c 24 40       	mov    %rcx,0x40(%rsp)
4cde   596958:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
4ce3   59695d:	48 81 c1 d0 07 00 00 	add    $0x7d0,%rcx
4cea   596964:	48 89 4c 24 58       	mov    %rcx,0x58(%rsp)
4cef   596969:	48 8b 54 24 18       	mov    0x18(%rsp),%rdx
4cf4   59696e:	48 8d 8a b8 3c 00 00 	lea    0x3cb8(%rdx),%rcx
4cfb   596975:	48 89 8c 24 00 02 00 00 	mov    %rcx,0x200(%rsp)
4d03   59697d:	48 8d 8a 78 3c 00 00 	lea    0x3c78(%rdx),%rcx
4d0a   596984:	48 89 8c 24 f8 01 00 00 	mov    %rcx,0x1f8(%rsp)
4d12   59698c:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
4d17   596991:	48 83 c1 50          	add    $0x50,%rcx
4d1b   596995:	48 89 8c 24 88 00 00 00 	mov    %rcx,0x88(%rsp)
4d23   59699d:	48 8d 8c 24 b0 01 00 00 	lea    0x1b0(%rsp),%rcx
4d2b   5969a5:	48 c1 e9 03          	shr    $0x3,%rcx
4d2f   5969a9:	48 89 8c 24 f0 01 00 00 	mov    %rcx,0x1f0(%rsp)
4d37   5969b1:	48 8d 8c 24 80 02 00 00 	lea    0x280(%rsp),%rcx
4d3f   5969b9:	48 c1 e9 03          	shr    $0x3,%rcx
4d43   5969bd:	48 89 8c 24 28 02 00 00 	mov    %rcx,0x228(%rsp)
4d4b   5969c5:	48 8d 8c 24 58 02 00 00 	lea    0x258(%rsp),%rcx
4d53   5969cd:	48 c1 e9 03          	shr    $0x3,%rcx
4d57   5969d1:	48 89 8c 24 30 02 00 00 	mov    %rcx,0x230(%rsp)
4d5f   5969d9:	48 8d 4c 24 60       	lea    0x60(%rsp),%rcx
4d64   5969de:	48 c1 e9 03          	shr    $0x3,%rcx
4d68   5969e2:	48 89 8c 24 e8 00 00 00 	mov    %rcx,0xe8(%rsp)
4d70   5969ea:	48 8d 48 50          	lea    0x50(%rax),%rcx
4d74   5969ee:	48 89 8c 24 a0 01 00 00 	mov    %rcx,0x1a0(%rsp)
4d7c   5969f6:	48 8d 48 58          	lea    0x58(%rax),%rcx
4d80   5969fa:	48 89 8c 24 98 01 00 00 	mov    %rcx,0x198(%rsp)
4d88   596a02:	48 8d 48 54          	lea    0x54(%rax),%rcx
4d8c   596a06:	48 89 8c 24 88 01 00 00 	mov    %rcx,0x188(%rsp)
4d94   596a0e:	48 8d 48 5c          	lea    0x5c(%rax),%rcx
4d98   596a12:	48 89 8c 24 a0 00 00 00 	mov    %rcx,0xa0(%rsp)
4da0   596a1a:	48 8d 48 60          	lea    0x60(%rax),%rcx
4da4   596a1e:	48 89 8c 24 90 01 00 00 	mov    %rcx,0x190(%rsp)
4dac   596a26:	48 8d 48 68          	lea    0x68(%rax),%rcx
4db0   596a2a:	48 89 8c 24 98 00 00 00 	mov    %rcx,0x98(%rsp)
4db8   596a32:	48 83 c0 64          	add    $0x64,%rax
4dbc   596a36:	48 89 84 24 90 00 00 00 	mov    %rax,0x90(%rsp)
4dc4   596a3e:	48 8d 82 80 3b 00 00 	lea    0x3b80(%rdx),%rax
4dcb   596a45:	48 89 84 24 68 01 00 00 	mov    %rax,0x168(%rsp)
4dd3   596a4d:	31 c0                	xor    %eax,%eax
4dd5   596a4f:	48 89 84 24 d0 00 00 00 	mov    %rax,0xd0(%rsp)
4ddd   596a57:	41 80 e4 01          	and    $0x1,%r12b
4de1   596a5b:	44 89 a4 24 80 01 00 00 	mov    %r12d,0x180(%rsp)
4de9   596a63:	41 0f b6 f4          	movzbl %r12b,%esi
4ded   596a67:	31 ff                	xor    %edi,%edi
4def   596a69:	e8 00 00 00 00       	call   596a6e <shrink_lruvec+0x4df4>	596a6a: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
4df4   596a6e:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
4dfe   596a78:	48 8b 8c 24 f0 01 00 00 	mov    0x1f0(%rsp),%rcx
4e06   596a80:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
4e0a   596a84:	74 0d                	je     596a93 <shrink_lruvec+0x4e19>
4e0c   596a86:	48 8d bc 24 b0 01 00 00 	lea    0x1b0(%rsp),%rdi
4e14   596a8e:	e8 00 00 00 00       	call   596a93 <shrink_lruvec+0x4e19>	596a8f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
4e19   596a93:	4c 8b a4 24 b0 01 00 00 	mov    0x1b0(%rsp),%r12
4e21   596a9b:	31 ff                	xor    %edi,%edi
4e23   596a9d:	4c 89 e6             	mov    %r12,%rsi
4e26   596aa0:	e8 00 00 00 00       	call   596aa5 <shrink_lruvec+0x4e2b>	596aa1: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
4e2b   596aa5:	4d 85 e4             	test   %r12,%r12
4e2e   596aa8:	74 0a                	je     596ab4 <shrink_lruvec+0x4e3a>
4e30   596aaa:	e8 00 00 00 00       	call   596aaf <shrink_lruvec+0x4e35>	596aab: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4e35   596aaf:	e9 90 00 00 00       	jmp    596b44 <shrink_lruvec+0x4eca>
4e3a   596ab4:	48 8d 84 24 c8 01 00 00 	lea    0x1c8(%rsp),%rax
4e42   596abc:	48 c1 e8 03          	shr    $0x3,%rax
4e46   596ac0:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
4e50   596aca:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
4e54   596ace:	74 0d                	je     596add <shrink_lruvec+0x4e63>
4e56   596ad0:	48 8d bc 24 c8 01 00 00 	lea    0x1c8(%rsp),%rdi
4e5e   596ad8:	e8 00 00 00 00       	call   596add <shrink_lruvec+0x4e63>	596ad9: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
4e63   596add:	4c 8b a4 24 c8 01 00 00 	mov    0x1c8(%rsp),%r12
4e6b   596ae5:	31 ff                	xor    %edi,%edi
4e6d   596ae7:	4c 89 e6             	mov    %r12,%rsi
4e70   596aea:	e8 00 00 00 00       	call   596aef <shrink_lruvec+0x4e75>	596aeb: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
4e75   596aef:	4d 85 e4             	test   %r12,%r12
4e78   596af2:	74 07                	je     596afb <shrink_lruvec+0x4e81>
4e7a   596af4:	e8 00 00 00 00       	call   596af9 <shrink_lruvec+0x4e7f>	596af5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4e7f   596af9:	eb 49                	jmp    596b44 <shrink_lruvec+0x4eca>
4e81   596afb:	48 8d 84 24 c0 01 00 00 	lea    0x1c0(%rsp),%rax
4e89   596b03:	48 c1 e8 03          	shr    $0x3,%rax
4e8d   596b07:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
4e97   596b11:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
4e9b   596b15:	74 0d                	je     596b24 <shrink_lruvec+0x4eaa>
4e9d   596b17:	48 8d bc 24 c0 01 00 00 	lea    0x1c0(%rsp),%rdi
4ea5   596b1f:	e8 00 00 00 00       	call   596b24 <shrink_lruvec+0x4eaa>	596b20: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
4eaa   596b24:	4c 8b a4 24 c0 01 00 00 	mov    0x1c0(%rsp),%r12
4eb2   596b2c:	31 ff                	xor    %edi,%edi
4eb4   596b2e:	4c 89 e6             	mov    %r12,%rsi
4eb7   596b31:	e8 00 00 00 00       	call   596b36 <shrink_lruvec+0x4ebc>	596b32: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
4ebc   596b36:	4d 85 e4             	test   %r12,%r12
4ebf   596b39:	0f 84 a5 11 00 00    	je     597ce4 <shrink_lruvec+0x606a>
4ec5   596b3f:	e8 00 00 00 00       	call   596b44 <shrink_lruvec+0x4eca>	596b40: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4eca   596b44:	31 c0                	xor    %eax,%eax
4ecc   596b46:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
4ed1   596b4b:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
4ed6   596b50:	48 8d 0c c4          	lea    (%rsp,%rax,8),%rcx
4eda   596b54:	48 81 c1 b0 01 00 00 	add    $0x1b0,%rcx
4ee1   596b5b:	48 89 0c 24          	mov    %rcx,(%rsp)
4ee5   596b5f:	48 c1 e9 03          	shr    $0x3,%rcx
4ee9   596b63:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
4ef3   596b6d:	48 89 4c 24 28       	mov    %rcx,0x28(%rsp)
4ef8   596b72:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
4efc   596b76:	74 09                	je     596b81 <shrink_lruvec+0x4f07>
4efe   596b78:	48 8b 3c 24          	mov    (%rsp),%rdi
4f02   596b7c:	e8 00 00 00 00       	call   596b81 <shrink_lruvec+0x4f07>	596b7d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
4f07   596b81:	48 8b 04 24          	mov    (%rsp),%rax
4f0b   596b85:	4c 8b 20             	mov    (%rax),%r12
4f0e   596b88:	31 ff                	xor    %edi,%edi
4f10   596b8a:	4c 89 e6             	mov    %r12,%rsi
4f13   596b8d:	e8 00 00 00 00       	call   596b92 <shrink_lruvec+0x4f18>	596b8e: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
4f18   596b92:	4d 85 e4             	test   %r12,%r12
4f1b   596b95:	0f 84 04 01 00 00    	je     596c9f <shrink_lruvec+0x5025>
4f21   596b9b:	4c 89 e0             	mov    %r12,%rax
4f24   596b9e:	bf 20 00 00 00       	mov    $0x20,%edi
4f29   596ba3:	48 89 c6             	mov    %rax,%rsi
4f2c   596ba6:	e8 00 00 00 00       	call   596bab <shrink_lruvec+0x4f31>	596ba7: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
4f31   596bab:	49 83 fc 20          	cmp    $0x20,%r12
4f35   596baf:	b8 20 00 00 00       	mov    $0x20,%eax
4f3a   596bb4:	49 0f 42 c4          	cmovb  %r12,%rax
4f3e   596bb8:	48 89 84 24 70 01 00 00 	mov    %rax,0x170(%rsp)
4f46   596bc0:	49 29 c4             	sub    %rax,%r12
4f49   596bc3:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
4f53   596bcd:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
4f58   596bd2:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
4f5c   596bd6:	74 09                	je     596be1 <shrink_lruvec+0x4f67>
4f5e   596bd8:	48 8b 3c 24          	mov    (%rsp),%rdi
4f62   596bdc:	e8 00 00 00 00       	call   596be1 <shrink_lruvec+0x4f67>	596bdd: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
4f67   596be1:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
4f6c   596be6:	4c 89 a4 c4 b0 01 00 00 	mov    %r12,0x1b0(%rsp,%rax,8)
4f74   596bee:	41 89 c4             	mov    %eax,%r12d
4f77   596bf1:	41 83 e4 fd          	and    $0xfffffffd,%r12d
4f7b   596bf5:	bf 01 00 00 00       	mov    $0x1,%edi
4f80   596bfa:	44 89 e6             	mov    %r12d,%esi
4f83   596bfd:	e8 00 00 00 00       	call   596c02 <shrink_lruvec+0x4f88>	596bfe: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
4f88   596c02:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
4f92   596c0c:	41 83 fc 01          	cmp    $0x1,%r12d
4f96   596c10:	0f 85 93 00 00 00    	jne    596ca9 <shrink_lruvec+0x502f>
4f9c   596c16:	48 8b 8c 24 a8 01 00 00 	mov    0x1a8(%rsp),%rcx
4fa4   596c1e:	8a 04 01             	mov    (%rcx,%rax,1),%al
4fa7   596c21:	84 c0                	test   %al,%al
4fa9   596c23:	0f 85 75 09 00 00    	jne    59759e <shrink_lruvec+0x5924>
4faf   596c29:	48 8b 84 24 80 00 00 00 	mov    0x80(%rsp),%rax
4fb7   596c31:	44 0f b7 20          	movzwl (%rax),%r12d
4fbb   596c35:	44 89 24 24          	mov    %r12d,(%rsp)
4fbf   596c39:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
4fc4   596c3e:	89 c6                	mov    %eax,%esi
4fc6   596c40:	83 e6 fe             	and    $0xfffffffe,%esi
4fc9   596c43:	89 74 24 28          	mov    %esi,0x28(%rsp)
4fcd   596c47:	bf 02 00 00 00       	mov    $0x2,%edi
4fd2   596c4c:	e8 00 00 00 00       	call   596c51 <shrink_lruvec+0x4fd7>	596c4d: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
4fd7   596c51:	83 7c 24 28 02       	cmpl   $0x2,0x28(%rsp)
4fdc   596c56:	0f 94 c1             	sete   %cl
4fdf   596c59:	b8 01 00 00 00       	mov    $0x1,%eax
4fe4   596c5e:	d3 e0                	shl    %cl,%eax
4fe6   596c60:	44 89 e6             	mov    %r12d,%esi
4fe9   596c63:	21 c6                	and    %eax,%esi
4feb   596c65:	41 89 c4             	mov    %eax,%r12d
4fee   596c68:	31 ff                	xor    %edi,%edi
4ff0   596c6a:	e8 00 00 00 00       	call   596c6f <shrink_lruvec+0x4ff5>	596c6b: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
4ff5   596c6f:	44 23 24 24          	and    (%rsp),%r12d
4ff9   596c73:	0f 84 fb 02 00 00    	je     596f74 <shrink_lruvec+0x52fa>
4fff   596c79:	e8 00 00 00 00       	call   596c7e <shrink_lruvec+0x5004>	596c7a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5004   596c7e:	48 8b bc 24 70 01 00 00 	mov    0x170(%rsp),%rdi
500c   596c86:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
5011   596c8b:	48 8b 54 24 50       	mov    0x50(%rsp),%rdx
5016   596c90:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
501b   596c95:	e8 13 16 00 00       	call   5982ad <shrink_active_list>
5020   596c9a:	e9 2c 06 00 00       	jmp    5972cb <shrink_lruvec+0x5651>
5025   596c9f:	e8 00 00 00 00       	call   596ca4 <shrink_lruvec+0x502a>	596ca0: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
502a   596ca4:	e9 34 06 00 00       	jmp    5972dd <shrink_lruvec+0x5663>
502f   596ca9:	48 8b 8c 24 30 02 00 00 	mov    0x230(%rsp),%rcx
5037   596cb1:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
503b   596cb5:	74 0d                	je     596cc4 <shrink_lruvec+0x504a>
503d   596cb7:	48 8d bc 24 58 02 00 00 	lea    0x258(%rsp),%rdi
5045   596cbf:	e8 00 00 00 00       	call   596cc4 <shrink_lruvec+0x504a>	596cc0: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
504a   596cc4:	48 8d 84 24 58 02 00 00 	lea    0x258(%rsp),%rax
5052   596ccc:	48 89 84 24 58 02 00 00 	mov    %rax,0x258(%rsp)
505a   596cd4:	48 8d 84 24 60 02 00 00 	lea    0x260(%rsp),%rax
5062   596cdc:	48 c1 e8 03          	shr    $0x3,%rax
5066   596ce0:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
5070   596cea:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
5074   596cee:	74 0d                	je     596cfd <shrink_lruvec+0x5083>
5076   596cf0:	48 8d bc 24 60 02 00 00 	lea    0x260(%rsp),%rdi
507e   596cf8:	e8 00 00 00 00       	call   596cfd <shrink_lruvec+0x5083>	596cf9: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
5083   596cfd:	48 8d 84 24 58 02 00 00 	lea    0x258(%rsp),%rax
508b   596d05:	48 89 84 24 60 02 00 00 	mov    %rax,0x260(%rsp)
5093   596d0d:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
509d   596d17:	48 8b 8c 24 e8 00 00 00 	mov    0xe8(%rsp),%rcx
50a5   596d1f:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
50a9   596d23:	74 0a                	je     596d2f <shrink_lruvec+0x50b5>
50ab   596d25:	48 8d 7c 24 60       	lea    0x60(%rsp),%rdi
50b0   596d2a:	e8 00 00 00 00       	call   596d2f <shrink_lruvec+0x50b5>	596d2b: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
50b5   596d2f:	48 b8 aa aa aa aa aa aa aa aa 	movabs $0xaaaaaaaaaaaaaaaa,%rax
50bf   596d39:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
50c4   596d3e:	ba 2c 00 00 00       	mov    $0x2c,%edx
50c9   596d43:	48 8d bc 24 30 01 00 00 	lea    0x130(%rsp),%rdi
50d1   596d4b:	be aa 00 00 00       	mov    $0xaa,%esi
50d6   596d50:	e8 00 00 00 00       	call   596d55 <shrink_lruvec+0x50db>	596d51: R_X86_64_PLT32	memset-0x4
50db   596d55:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
50e0   596d5a:	41 89 c4             	mov    %eax,%r12d
50e3   596d5d:	41 83 e4 fe          	and    $0xfffffffe,%r12d
50e7   596d61:	bf 02 00 00 00       	mov    $0x2,%edi
50ec   596d66:	44 89 e6             	mov    %r12d,%esi
50ef   596d69:	e8 00 00 00 00       	call   596d6e <shrink_lruvec+0x50f4>	596d6a: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
50f4   596d6e:	31 c0                	xor    %eax,%eax
50f6   596d70:	44 89 a4 24 b8 00 00 00 	mov    %r12d,0xb8(%rsp)
50fe   596d78:	41 83 fc 02          	cmp    $0x2,%r12d
5102   596d7c:	0f 94 c0             	sete   %al
5105   596d7f:	8d 0c 00             	lea    (%rax,%rax,1),%ecx
5108   596d82:	89 8c 24 e0 00 00 00 	mov    %ecx,0xe0(%rsp)
510f   596d89:	83 c0 07             	add    $0x7,%eax
5112   596d8c:	48 89 44 24 78       	mov    %rax,0x78(%rsp)
5117   596d91:	c7 04 24 00 00 00 00 	movl   $0x0,(%rsp)
511e   596d98:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
5128   596da2:	48 8b 8c 24 a8 00 00 00 	mov    0xa8(%rsp),%rcx
5130   596daa:	8a 04 01             	mov    (%rcx,%rax,1),%al
5133   596dad:	84 c0                	test   %al,%al
5135   596daf:	0f 85 7b 01 00 00    	jne    596f30 <shrink_lruvec+0x52b6>
513b   596db5:	48 8b 44 24 48       	mov    0x48(%rsp),%rax
5140   596dba:	44 8b 20             	mov    (%rax),%r12d
5143   596dbd:	be 00 00 02 00       	mov    $0x20000,%esi
5148   596dc2:	44 21 e6             	and    %r12d,%esi
514b   596dc5:	31 ff                	xor    %edi,%edi
514d   596dc7:	e8 00 00 00 00       	call   596dcc <shrink_lruvec+0x5152>	596dc8: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
5152   596dcc:	b8 00 00 02 00       	mov    $0x20000,%eax
5157   596dd1:	41 21 c4             	and    %eax,%r12d
515a   596dd4:	0f 85 d3 01 00 00    	jne    596fad <shrink_lruvec+0x5333>
5160   596dda:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
5165   596ddf:	4c 89 e7             	mov    %r12,%rdi
5168   596de2:	8b b4 24 e0 00 00 00 	mov    0xe0(%rsp),%esi
516f   596de9:	e8 00 00 00 00       	call   596dee <shrink_lruvec+0x5174>	596dea: R_X86_64_PLT32	node_page_state-0x4
5174   596dee:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
5179   596df3:	4c 89 e7             	mov    %r12,%rdi
517c   596df6:	48 8b 74 24 78       	mov    0x78(%rsp),%rsi
5181   596dfb:	e8 00 00 00 00       	call   596e00 <shrink_lruvec+0x5186>	596dfc: R_X86_64_PLT32	node_page_state-0x4
5186   596e00:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
518b   596e05:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
5190   596e0a:	48 c1 e8 03          	shr    $0x3,%rax
5194   596e0e:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
519e   596e18:	8a 04 08             	mov    (%rax,%rcx,1),%al
51a1   596e1b:	84 c0                	test   %al,%al
51a3   596e1d:	0f 85 2f 01 00 00    	jne    596f52 <shrink_lruvec+0x52d8>
51a9   596e23:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
51ae   596e28:	44 8b 20             	mov    (%rax),%r12d
51b1   596e2b:	b8 c0 00 00 00       	mov    $0xc0,%eax
51b6   596e30:	41 21 c4             	and    %eax,%r12d
51b9   596e33:	bf c0 00 00 00       	mov    $0xc0,%edi
51be   596e38:	44 89 e6             	mov    %r12d,%esi
51c1   596e3b:	e8 00 00 00 00       	call   596e40 <shrink_lruvec+0x51c6>	596e3c: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
51c6   596e40:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
51cb   596e45:	48 89 c6             	mov    %rax,%rsi
51ce   596e48:	48 c1 ee 03          	shr    $0x3,%rsi
51d2   596e4c:	b9 c0 00 00 00       	mov    $0xc0,%ecx
51d7   596e51:	41 39 cc             	cmp    %ecx,%r12d
51da   596e54:	48 0f 45 f0          	cmovne %rax,%rsi
51de   596e58:	48 89 74 24 20       	mov    %rsi,0x20(%rsp)
51e3   596e5d:	4c 8b 64 24 28       	mov    0x28(%rsp),%r12
51e8   596e62:	4c 89 e7             	mov    %r12,%rdi
51eb   596e65:	e8 00 00 00 00       	call   596e6a <shrink_lruvec+0x51f0>	596e66: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
51f0   596e6a:	4c 3b 64 24 20       	cmp    0x20(%rsp),%r12
51f5   596e6f:	0f 86 3f 01 00 00    	jbe    596fb4 <shrink_lruvec+0x533a>
51fb   596e75:	f6 04 24 01          	testb  $0x1,(%rsp)
51ff   596e79:	0f 85 8e 01 00 00    	jne    59700d <shrink_lruvec+0x5393>
5205   596e7f:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
520a   596e84:	be 01 00 00 00       	mov    $0x1,%esi
520f   596e89:	e8 00 00 00 00       	call   596e8e <shrink_lruvec+0x5214>	596e8a: R_X86_64_PLT32	reclaim_throttle-0x4
5214   596e8e:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
5219   596e93:	4c 89 e7             	mov    %r12,%rdi
521c   596e96:	be 08 00 00 00       	mov    $0x8,%esi
5221   596e9b:	e8 00 00 00 00       	call   596ea0 <shrink_lruvec+0x5226>	596e9c: R_X86_64_PLT32	__kasan_check_read-0x4
5226   596ea0:	49 c1 ec 03          	shr    $0x3,%r12
522a   596ea4:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
5234   596eae:	41 80 3c 0c 00       	cmpb   $0x0,(%r12,%rcx,1)
5239   596eb3:	74 0a                	je     596ebf <shrink_lruvec+0x5245>
523b   596eb5:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
5240   596eba:	e8 00 00 00 00       	call   596ebf <shrink_lruvec+0x5245>	596ebb: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
5245   596ebf:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
524a   596ec4:	4c 8b 20             	mov    (%rax),%r12
524d   596ec7:	4c 89 e6             	mov    %r12,%rsi
5250   596eca:	48 83 e6 04          	and    $0x4,%rsi
5254   596ece:	31 ff                	xor    %edi,%edi
5256   596ed0:	e8 00 00 00 00       	call   596ed5 <shrink_lruvec+0x525b>	596ed1: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
525b   596ed5:	49 83 e4 04          	and    $0x4,%r12
525f   596ed9:	75 09                	jne    596ee4 <shrink_lruvec+0x526a>
5261   596edb:	e8 00 00 00 00       	call   596ee0 <shrink_lruvec+0x5266>	596edc: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5266   596ee0:	31 c0                	xor    %eax,%eax
5268   596ee2:	eb 35                	jmp    596f19 <shrink_lruvec+0x529f>
526a   596ee4:	e8 00 00 00 00       	call   596ee9 <shrink_lruvec+0x526f>	596ee5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
526f   596ee9:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
5274   596eee:	48 c1 e8 03          	shr    $0x3,%rax
5278   596ef2:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
5282   596efc:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
5286   596f00:	74 0a                	je     596f0c <shrink_lruvec+0x5292>
5288   596f02:	48 8b 7c 24 58       	mov    0x58(%rsp),%rdi
528d   596f07:	e8 00 00 00 00       	call   596f0c <shrink_lruvec+0x5292>	596f08: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
5292   596f0c:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
5297   596f11:	8b 00                	mov    (%rax),%eax
5299   596f13:	c1 e8 08             	shr    $0x8,%eax
529c   596f16:	83 e0 01             	and    $0x1,%eax
529f   596f19:	85 c0                	test   %eax,%eax
52a1   596f1b:	0f 85 f6 00 00 00    	jne    597017 <shrink_lruvec+0x539d>
52a7   596f21:	e8 00 00 00 00       	call   596f26 <shrink_lruvec+0x52ac>	596f22: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
52ac   596f26:	b0 01                	mov    $0x1,%al
52ae   596f28:	89 04 24             	mov    %eax,(%rsp)
52b1   596f2b:	e9 68 fe ff ff       	jmp    596d98 <shrink_lruvec+0x511e>
52b6   596f30:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
52bb   596f35:	80 e1 07             	and    $0x7,%cl
52be   596f38:	80 c1 03             	add    $0x3,%cl
52c1   596f3b:	38 c1                	cmp    %al,%cl
52c3   596f3d:	0f 8c 72 fe ff ff    	jl     596db5 <shrink_lruvec+0x513b>
52c9   596f43:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
52ce   596f48:	e8 00 00 00 00       	call   596f4d <shrink_lruvec+0x52d3>	596f49: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
52d3   596f4d:	e9 63 fe ff ff       	jmp    596db5 <shrink_lruvec+0x513b>
52d8   596f52:	48 8b 4c 24 40       	mov    0x40(%rsp),%rcx
52dd   596f57:	80 e1 07             	and    $0x7,%cl
52e0   596f5a:	80 c1 03             	add    $0x3,%cl
52e3   596f5d:	38 c1                	cmp    %al,%cl
52e5   596f5f:	0f 8c be fe ff ff    	jl     596e23 <shrink_lruvec+0x51a9>
52eb   596f65:	48 8b 7c 24 40       	mov    0x40(%rsp),%rdi
52f0   596f6a:	e8 00 00 00 00       	call   596f6f <shrink_lruvec+0x52f5>	596f6b: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
52f5   596f6f:	e9 af fe ff ff       	jmp    596e23 <shrink_lruvec+0x51a9>
52fa   596f74:	e8 00 00 00 00       	call   596f79 <shrink_lruvec+0x52ff>	596f75: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
52ff   596f79:	83 0c 24 08          	orl    $0x8,(%rsp)
5303   596f7d:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
530d   596f87:	48 8b 8c 24 a8 01 00 00 	mov    0x1a8(%rsp),%rcx
5315   596f8f:	8a 04 01             	mov    (%rcx,%rax,1),%al
5318   596f92:	84 c0                	test   %al,%al
531a   596f94:	0f 85 4d 06 00 00    	jne    5975e7 <shrink_lruvec+0x596d>
5320   596f9a:	48 8b 84 24 80 00 00 00 	mov    0x80(%rsp),%rax
5328   596fa2:	8b 0c 24             	mov    (%rsp),%ecx
532b   596fa5:	66 89 08             	mov    %cx,(%rax)
532e   596fa8:	e9 1e 03 00 00       	jmp    5972cb <shrink_lruvec+0x5651>
5333   596fad:	e8 00 00 00 00       	call   596fb2 <shrink_lruvec+0x5338>	596fae: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5338   596fb2:	eb 77                	jmp    59702b <shrink_lruvec+0x53b1>
533a   596fb4:	48 8b 84 24 00 02 00 00 	mov    0x200(%rsp),%rax
5342   596fbc:	48 c1 e8 03          	shr    $0x3,%rax
5346   596fc0:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
5350   596fca:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
5354   596fce:	74 0d                	je     596fdd <shrink_lruvec+0x5363>
5356   596fd0:	48 8b bc 24 00 02 00 00 	mov    0x200(%rsp),%rdi
535e   596fd8:	e8 00 00 00 00       	call   596fdd <shrink_lruvec+0x5363>	596fd9: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
5363   596fdd:	48 8b 8c 24 00 02 00 00 	mov    0x200(%rsp),%rcx
536b   596fe5:	48 8b 01             	mov    (%rcx),%rax
536e   596fe8:	48 39 c8             	cmp    %rcx,%rax
5371   596feb:	74 39                	je     597026 <shrink_lruvec+0x53ac>
5373   596fed:	e8 00 00 00 00       	call   596ff2 <shrink_lruvec+0x5378>	596fee: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5378   596ff2:	48 8b bc 24 f8 01 00 00 	mov    0x1f8(%rsp),%rdi
5380   596ffa:	be 03 00 00 00       	mov    $0x3,%esi
5385   596fff:	ba 01 00 00 00       	mov    $0x1,%edx
538a   597004:	31 c9                	xor    %ecx,%ecx
538c   597006:	e8 00 00 00 00       	call   59700b <shrink_lruvec+0x5391>	597007: R_X86_64_PLT32	__wake_up-0x4
5391   59700b:	eb 1e                	jmp    59702b <shrink_lruvec+0x53b1>
5393   59700d:	e8 00 00 00 00       	call   597012 <shrink_lruvec+0x5398>	59700e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5398   597012:	e9 b4 02 00 00       	jmp    5972cb <shrink_lruvec+0x5651>
539d   597017:	e8 00 00 00 00       	call   59701c <shrink_lruvec+0x53a2>	597018: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
53a2   59701c:	b8 20 00 00 00       	mov    $0x20,%eax
53a7   597021:	e9 a7 02 00 00       	jmp    5972cd <shrink_lruvec+0x5653>
53ac   597026:	e8 00 00 00 00       	call   59702b <shrink_lruvec+0x53b1>	597027: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
53b1   59702b:	83 bc 24 b8 00 00 00 02 	cmpl   $0x2,0xb8(%rsp)
53b9   597033:	0f 94 84 24 e0 00 00 00 	sete   0xe0(%rsp)
53c1   59703b:	e8 00 00 00 00       	call   597040 <shrink_lruvec+0x53c6>	59703c: R_X86_64_PLT32	lru_add_drain-0x4
53c6   597040:	48 8b bc 24 88 00 00 00 	mov    0x88(%rsp),%rdi
53ce   597048:	e8 00 00 00 00       	call   59704d <shrink_lruvec+0x53d3>	597049: R_X86_64_PLT32	_raw_spin_lock_irq-0x4
53d3   59704d:	48 8b bc 24 70 01 00 00 	mov    0x170(%rsp),%rdi
53db   597055:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
53e0   59705a:	48 8d 94 24 58 02 00 00 	lea    0x258(%rsp),%rdx
53e8   597062:	48 8d 4c 24 60       	lea    0x60(%rsp),%rcx
53ed   597067:	4c 8b 44 24 50       	mov    0x50(%rsp),%r8
53f2   59706c:	4c 8b 4c 24 38       	mov    0x38(%rsp),%r9
53f7   597071:	e8 d7 72 00 00       	call   59e34d <isolate_lru_pages>
53fc   597076:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
5401   59707b:	48 8b 74 24 78       	mov    0x78(%rsp),%rsi
5406   597080:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
540b   597085:	48 89 c2             	mov    %rax,%rdx
540e   597088:	e8 00 00 00 00       	call   59708d <shrink_lruvec+0x5413>	597089: R_X86_64_PLT32	__mod_node_page_state-0x4
5413   59708d:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
541d   597097:	48 8b 8c 24 e8 00 00 00 	mov    0xe8(%rsp),%rcx
5425   59709f:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
5429   5970a3:	74 0a                	je     5970af <shrink_lruvec+0x5435>
542b   5970a5:	48 8d 7c 24 60       	lea    0x60(%rsp),%rdi
5430   5970aa:	e8 00 00 00 00       	call   5970af <shrink_lruvec+0x5435>	5970ab: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
5435   5970af:	48 8b 44 24 60       	mov    0x60(%rsp),%rax
543a   5970b4:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
543f   5970b9:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
5449   5970c3:	48 8b 8c 24 a8 00 00 00 	mov    0xa8(%rsp),%rcx
5451   5970cb:	8a 04 01             	mov    (%rcx,%rax,1),%al
5454   5970ce:	84 c0                	test   %al,%al
5456   5970d0:	0f 85 ef 04 00 00    	jne    5975c5 <shrink_lruvec+0x594b>
545c   5970d6:	45 31 e4             	xor    %r12d,%r12d
545f   5970d9:	83 bc 24 b8 00 00 00 02 	cmpl   $0x2,0xb8(%rsp)
5467   5970e1:	41 0f 94 c4          	sete   %r12b
546b   5970e5:	31 c9                	xor    %ecx,%ecx
546d   5970e7:	48 8b 44 24 48       	mov    0x48(%rsp),%rax
5472   5970ec:	8b 30                	mov    (%rax),%esi
5474   5970ee:	b8 00 00 02 00       	mov    $0x20000,%eax
5479   5970f3:	21 c6                	and    %eax,%esi
547b   5970f5:	0f 94 c1             	sete   %cl
547e   5970f8:	48 89 0c 24          	mov    %rcx,(%rsp)
5482   5970fc:	31 ff                	xor    %edi,%edi
5484   5970fe:	e8 00 00 00 00       	call   597103 <shrink_lruvec+0x5489>	5970ff: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
5489   597103:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
548e   597108:	48 8b 0c 24          	mov    (%rsp),%rcx
5492   59710c:	65 48 01 04 cd 00 00 00 00 	add    %rax,%gs:0x0(,%rcx,8)	597111: R_X86_64_32S	vm_event_states+0xe8
549b   597115:	65 4a 01 04 e5 00 00 00 00 	add    %rax,%gs:0x0(,%r12,8)	59711a: R_X86_64_32S	vm_event_states+0x100
54a4   59711e:	48 8b bc 24 88 00 00 00 	mov    0x88(%rsp),%rdi
54ac   597126:	e8 00 00 00 00       	call   59712b <shrink_lruvec+0x54b1>	597127: R_X86_64_PLT32	_raw_spin_unlock_irq-0x4
54b1   59712b:	31 ff                	xor    %edi,%edi
54b3   59712d:	4c 8b 64 24 28       	mov    0x28(%rsp),%r12
54b8   597132:	4c 89 e6             	mov    %r12,%rsi
54bb   597135:	e8 00 00 00 00       	call   59713a <shrink_lruvec+0x54c0>	597136: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
54c0   59713a:	4d 85 e4             	test   %r12,%r12
54c3   59713d:	0f 84 83 01 00 00    	je     5972c6 <shrink_lruvec+0x564c>
54c9   597143:	48 8d bc 24 58 02 00 00 	lea    0x258(%rsp),%rdi
54d1   59714b:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
54d6   597150:	4c 89 e6             	mov    %r12,%rsi
54d9   597153:	48 8b 54 24 50       	mov    0x50(%rsp),%rdx
54de   597158:	48 8d 8c 24 30 01 00 00 	lea    0x130(%rsp),%rcx
54e6   597160:	45 31 c0             	xor    %r8d,%r8d
54e9   597163:	e8 ba 9d fe ff       	call   580f22 <shrink_page_list>
54ee   597168:	89 04 24             	mov    %eax,(%rsp)
54f1   59716b:	48 8b bc 24 88 00 00 00 	mov    0x88(%rsp),%rdi
54f9   597173:	e8 00 00 00 00       	call   597178 <shrink_lruvec+0x54fe>	597174: R_X86_64_PLT32	_raw_spin_lock_irq-0x4
54fe   597178:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
5503   59717d:	48 8d b4 24 58 02 00 00 	lea    0x258(%rsp),%rsi
550b   597185:	e8 1a 63 00 00       	call   59d4a4 <move_pages_to_lru>
5510   59718a:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
5515   59718f:	48 f7 da             	neg    %rdx
5518   597192:	4c 89 e7             	mov    %r12,%rdi
551b   597195:	48 8b 74 24 78       	mov    0x78(%rsp),%rsi
5520   59719a:	e8 00 00 00 00       	call   59719f <shrink_lruvec+0x5525>	59719b: R_X86_64_PLT32	__mod_node_page_state-0x4
5525   59719f:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
552f   5971a9:	48 8b 8c 24 a8 00 00 00 	mov    0xa8(%rsp),%rcx
5537   5971b1:	8a 04 01             	mov    (%rcx,%rax,1),%al
553a   5971b4:	84 c0                	test   %al,%al
553c   5971b6:	0f 85 52 04 00 00    	jne    59760e <shrink_lruvec+0x5994>
5542   5971bc:	44 8b 24 24          	mov    (%rsp),%r12d
5546   5971c0:	31 c0                	xor    %eax,%eax
5548   5971c2:	83 bc 24 b8 00 00 00 02 	cmpl   $0x2,0xb8(%rsp)
5550   5971ca:	0f 94 c0             	sete   %al
5553   5971cd:	48 89 44 24 78       	mov    %rax,0x78(%rsp)
5558   5971d2:	31 c9                	xor    %ecx,%ecx
555a   5971d4:	48 8b 44 24 48       	mov    0x48(%rsp),%rax
555f   5971d9:	8b 30                	mov    (%rax),%esi
5561   5971db:	b8 00 00 02 00       	mov    $0x20000,%eax
5566   5971e0:	21 c6                	and    %eax,%esi
5568   5971e2:	0f 94 c1             	sete   %cl
556b   5971e5:	48 89 0c 24          	mov    %rcx,(%rsp)
556f   5971e9:	31 ff                	xor    %edi,%edi
5571   5971eb:	e8 00 00 00 00       	call   5971f0 <shrink_lruvec+0x5576>	5971ec: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
5576   5971f0:	48 8b 04 24          	mov    (%rsp),%rax
557a   5971f4:	65 4c 01 24 c5 00 00 00 00 	add    %r12,%gs:0x0(,%rax,8)	5971f9: R_X86_64_32S	vm_event_states+0xc8
5583   5971fd:	4c 89 24 24          	mov    %r12,(%rsp)
5587   597201:	48 8b 44 24 78       	mov    0x78(%rsp),%rax
558c   597206:	65 4c 01 24 c5 00 00 00 00 	add    %r12,%gs:0x0(,%rax,8)	59720b: R_X86_64_32S	vm_event_states+0x110
5595   59720f:	48 8b bc 24 88 00 00 00 	mov    0x88(%rsp),%rdi
559d   597217:	e8 00 00 00 00       	call   59721c <shrink_lruvec+0x55a2>	597218: R_X86_64_PLT32	_raw_spin_unlock_irq-0x4
55a2   59721c:	48 8d 84 24 44 01 00 00 	lea    0x144(%rsp),%rax
55aa   597224:	48 c1 e8 03          	shr    $0x3,%rax
55ae   597228:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
55b8   597232:	8a 04 08             	mov    (%rax,%rcx,1),%al
55bb   597235:	84 c0                	test   %al,%al
55bd   597237:	0f 85 f3 03 00 00    	jne    597630 <shrink_lruvec+0x59b6>
55c3   59723d:	31 f6                	xor    %esi,%esi
55c5   59723f:	83 bc 24 b8 00 00 00 02 	cmpl   $0x2,0xb8(%rsp)
55cd   597247:	40 0f 94 c6          	sete   %sil
55d1   59724b:	8b 94 24 44 01 00 00 	mov    0x144(%rsp),%edx
55d8   597252:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
55dd   597257:	e8 00 00 00 00       	call   59725c <shrink_lruvec+0x55e2>	597258: R_X86_64_PLT32	lru_note_cost-0x4
55e2   59725c:	48 8d bc 24 58 02 00 00 	lea    0x258(%rsp),%rdi
55ea   597264:	e8 00 00 00 00       	call   597269 <shrink_lruvec+0x55ef>	597265: R_X86_64_PLT32	free_unref_page_list-0x4
55ef   597269:	48 8d 8c 24 34 01 00 00 	lea    0x134(%rsp),%rcx
55f7   597271:	48 c1 e9 03          	shr    $0x3,%rcx
55fb   597275:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
5605   59727f:	48 89 4c 24 78       	mov    %rcx,0x78(%rsp)
560a   597284:	8a 04 01             	mov    (%rcx,%rax,1),%al
560d   597287:	84 c0                	test   %al,%al
560f   597289:	0f 85 c9 03 00 00    	jne    597658 <shrink_lruvec+0x59de>
5615   59728f:	8b b4 24 34 01 00 00 	mov    0x134(%rsp),%esi
561c   597296:	48 89 b4 24 70 01 00 00 	mov    %rsi,0x170(%rsp)
5624   59729e:	4c 8b 64 24 28       	mov    0x28(%rsp),%r12
5629   5972a3:	4c 89 e7             	mov    %r12,%rdi
562c   5972a6:	e8 00 00 00 00       	call   5972ab <shrink_lruvec+0x5631>	5972a7: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
5631   5972ab:	4c 3b a4 24 70 01 00 00 	cmp    0x170(%rsp),%r12
5639   5972b3:	75 4c                	jne    597301 <shrink_lruvec+0x5687>
563b   5972b5:	e8 00 00 00 00       	call   5972ba <shrink_lruvec+0x5640>	5972b6: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5640   5972ba:	bf 01 00 00 00       	mov    $0x1,%edi
5645   5972bf:	e8 00 00 00 00       	call   5972c4 <shrink_lruvec+0x564a>	5972c0: R_X86_64_PLT32	wakeup_flusher_threads-0x4
564a   5972c4:	eb 40                	jmp    597306 <shrink_lruvec+0x568c>
564c   5972c6:	e8 00 00 00 00       	call   5972cb <shrink_lruvec+0x5651>	5972c7: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5651   5972cb:	31 c0                	xor    %eax,%eax
5653   5972cd:	48 89 04 24          	mov    %rax,(%rsp)
5657   5972d1:	48 8b 04 24          	mov    (%rsp),%rax
565b   5972d5:	48 01 84 24 d0 00 00 00 	add    %rax,0xd0(%rsp)
5663   5972dd:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
5668   5972e2:	48 ff c1             	inc    %rcx
566b   5972e5:	48 89 c8             	mov    %rcx,%rax
566e   5972e8:	48 89 4c 24 38       	mov    %rcx,0x38(%rsp)
5673   5972ed:	48 83 f9 04          	cmp    $0x4,%rcx
5677   5972f1:	0f 84 a8 05 00 00    	je     59789f <shrink_lruvec+0x5c25>
567d   5972f7:	e8 00 00 00 00       	call   5972fc <shrink_lruvec+0x5682>	5972f8: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5682   5972fc:	e9 4a f8 ff ff       	jmp    596b4b <shrink_lruvec+0x4ed1>
5687   597301:	e8 00 00 00 00       	call   597306 <shrink_lruvec+0x568c>	597302: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
568c   597306:	48 8d 84 24 30 01 00 00 	lea    0x130(%rsp),%rax
5694   59730e:	48 c1 e8 03          	shr    $0x3,%rax
5698   597312:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
56a2   59731c:	8a 04 08             	mov    (%rax,%rcx,1),%al
56a5   59731f:	84 c0                	test   %al,%al
56a7   597321:	0f 85 59 03 00 00    	jne    597680 <shrink_lruvec+0x5a06>
56ad   597327:	44 8b a4 24 30 01 00 00 	mov    0x130(%rsp),%r12d
56b5   59732f:	48 8b 84 24 a0 01 00 00 	mov    0x1a0(%rsp),%rax
56bd   597337:	48 c1 e8 03          	shr    $0x3,%rax
56c1   59733b:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
56cb   597345:	8a 04 08             	mov    (%rax,%rcx,1),%al
56ce   597348:	84 c0                	test   %al,%al
56d0   59734a:	0f 85 4a 03 00 00    	jne    59769a <shrink_lruvec+0x5a20>
56d6   597350:	48 8b 84 24 a0 01 00 00 	mov    0x1a0(%rsp),%rax
56de   597358:	44 01 20             	add    %r12d,(%rax)
56e1   59735b:	48 8d 84 24 38 01 00 00 	lea    0x138(%rsp),%rax
56e9   597363:	48 c1 e8 03          	shr    $0x3,%rax
56ed   597367:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
56f7   597371:	8a 04 08             	mov    (%rax,%rcx,1),%al
56fa   597374:	84 c0                	test   %al,%al
56fc   597376:	0f 85 46 03 00 00    	jne    5976c2 <shrink_lruvec+0x5a48>
5702   59737c:	44 8b a4 24 38 01 00 00 	mov    0x138(%rsp),%r12d
570a   597384:	48 8b 84 24 98 01 00 00 	mov    0x198(%rsp),%rax
5712   59738c:	48 c1 e8 03          	shr    $0x3,%rax
5716   597390:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
5720   59739a:	8a 04 08             	mov    (%rax,%rcx,1),%al
5723   59739d:	84 c0                	test   %al,%al
5725   59739f:	0f 85 45 03 00 00    	jne    5976ea <shrink_lruvec+0x5a70>
572b   5973a5:	48 8b 84 24 98 01 00 00 	mov    0x198(%rsp),%rax
5733   5973ad:	44 01 20             	add    %r12d,(%rax)
5736   5973b0:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
5740   5973ba:	48 8b 4c 24 78       	mov    0x78(%rsp),%rcx
5745   5973bf:	8a 04 01             	mov    (%rcx,%rax,1),%al
5748   5973c2:	84 c0                	test   %al,%al
574a   5973c4:	0f 85 48 03 00 00    	jne    597712 <shrink_lruvec+0x5a98>
5750   5973ca:	44 8b a4 24 34 01 00 00 	mov    0x134(%rsp),%r12d
5758   5973d2:	48 8b 84 24 88 01 00 00 	mov    0x188(%rsp),%rax
5760   5973da:	48 c1 e8 03          	shr    $0x3,%rax
5764   5973de:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
576e   5973e8:	8a 04 08             	mov    (%rax,%rcx,1),%al
5771   5973eb:	84 c0                	test   %al,%al
5773   5973ed:	0f 85 47 03 00 00    	jne    59773a <shrink_lruvec+0x5ac0>
5779   5973f3:	48 8b 84 24 88 01 00 00 	mov    0x188(%rsp),%rax
5781   5973fb:	44 01 20             	add    %r12d,(%rax)
5784   5973fe:	48 8d 84 24 3c 01 00 00 	lea    0x13c(%rsp),%rax
578c   597406:	48 c1 e8 03          	shr    $0x3,%rax
5790   59740a:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
579a   597414:	8a 04 08             	mov    (%rax,%rcx,1),%al
579d   597417:	84 c0                	test   %al,%al
579f   597419:	0f 85 43 03 00 00    	jne    597762 <shrink_lruvec+0x5ae8>
57a5   59741f:	44 8b a4 24 3c 01 00 00 	mov    0x13c(%rsp),%r12d
57ad   597427:	48 8b 84 24 a0 00 00 00 	mov    0xa0(%rsp),%rax
57b5   59742f:	48 c1 e8 03          	shr    $0x3,%rax
57b9   597433:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
57c3   59743d:	8a 04 08             	mov    (%rax,%rcx,1),%al
57c6   597440:	84 c0                	test   %al,%al
57c8   597442:	0f 85 42 03 00 00    	jne    59778a <shrink_lruvec+0x5b10>
57ce   597448:	48 8b 84 24 a0 00 00 00 	mov    0xa0(%rsp),%rax
57d6   597450:	44 01 20             	add    %r12d,(%rax)
57d9   597453:	48 8d 84 24 40 01 00 00 	lea    0x140(%rsp),%rax
57e1   59745b:	48 c1 e8 03          	shr    $0x3,%rax
57e5   59745f:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
57ef   597469:	8a 04 08             	mov    (%rax,%rcx,1),%al
57f2   59746c:	84 c0                	test   %al,%al
57f4   59746e:	0f 85 3e 03 00 00    	jne    5977b2 <shrink_lruvec+0x5b38>
57fa   597474:	44 8b a4 24 40 01 00 00 	mov    0x140(%rsp),%r12d
5802   59747c:	48 8b 84 24 90 01 00 00 	mov    0x190(%rsp),%rax
580a   597484:	48 c1 e8 03          	shr    $0x3,%rax
580e   597488:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
5818   597492:	8a 04 08             	mov    (%rax,%rcx,1),%al
581b   597495:	84 c0                	test   %al,%al
581d   597497:	0f 85 3d 03 00 00    	jne    5977da <shrink_lruvec+0x5b60>
5823   59749d:	48 8b 84 24 90 01 00 00 	mov    0x190(%rsp),%rax
582b   5974a5:	44 01 20             	add    %r12d,(%rax)
582e   5974a8:	48 8b 84 24 98 00 00 00 	mov    0x98(%rsp),%rax
5836   5974b0:	48 c1 e8 03          	shr    $0x3,%rax
583a   5974b4:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
5844   5974be:	8a 04 08             	mov    (%rax,%rcx,1),%al
5847   5974c1:	84 c0                	test   %al,%al
5849   5974c3:	0f 85 39 03 00 00    	jne    597802 <shrink_lruvec+0x5b88>
584f   5974c9:	48 8b 84 24 98 00 00 00 	mov    0x98(%rsp),%rax
5857   5974d1:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
585c   5974d6:	01 08                	add    %ecx,(%rax)
585e   5974d8:	83 bc 24 b8 00 00 00 02 	cmpl   $0x2,0xb8(%rsp)
5866   5974e0:	75 37                	jne    597519 <shrink_lruvec+0x589f>
5868   5974e2:	e8 00 00 00 00       	call   5974e7 <shrink_lruvec+0x586d>	5974e3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
586d   5974e7:	48 8b 84 24 90 00 00 00 	mov    0x90(%rsp),%rax
5875   5974ef:	48 c1 e8 03          	shr    $0x3,%rax
5879   5974f3:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
5883   5974fd:	8a 04 08             	mov    (%rax,%rcx,1),%al
5886   597500:	84 c0                	test   %al,%al
5888   597502:	0f 85 6f 03 00 00    	jne    597877 <shrink_lruvec+0x5bfd>
588e   597508:	48 8b 84 24 90 00 00 00 	mov    0x90(%rsp),%rax
5896   597510:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
589b   597515:	01 08                	add    %ecx,(%rax)
589d   597517:	eb 05                	jmp    59751e <shrink_lruvec+0x58a4>
589f   597519:	e8 00 00 00 00       	call   59751e <shrink_lruvec+0x58a4>	59751a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
58a4   59751e:	48 8b 84 24 68 01 00 00 	mov    0x168(%rsp),%rax
58ac   597526:	48 c1 e8 03          	shr    $0x3,%rax
58b0   59752a:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
58ba   597534:	8a 04 08             	mov    (%rax,%rcx,1),%al
58bd   597537:	84 c0                	test   %al,%al
58bf   597539:	0f 85 eb 02 00 00    	jne    59782a <shrink_lruvec+0x5bb0>
58c5   59753f:	48 8b 84 24 68 01 00 00 	mov    0x168(%rsp),%rax
58cd   597547:	44 8b 20             	mov    (%rax),%r12d
58d0   59754a:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
58da   597554:	48 8b 8c 24 b0 00 00 00 	mov    0xb0(%rsp),%rcx
58e2   59755c:	8a 04 01             	mov    (%rcx,%rax,1),%al
58e5   59755f:	84 c0                	test   %al,%al
58e7   597561:	0f 85 eb 02 00 00    	jne    597852 <shrink_lruvec+0x5bd8>
58ed   597567:	45 31 c9             	xor    %r9d,%r9d
58f0   59756a:	8a 84 24 e0 00 00 00 	mov    0xe0(%rsp),%al
58f7   597571:	41 88 c1             	mov    %al,%r9b
58fa   597574:	48 8b 84 24 c8 00 00 00 	mov    0xc8(%rsp),%rax
5902   59757c:	44 0f be 00          	movsbl (%rax),%r8d
5906   597580:	44 89 e7             	mov    %r12d,%edi
5909   597583:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
590e   597588:	48 8b 14 24          	mov    (%rsp),%rdx
5912   59758c:	48 8d 8c 24 30 01 00 00 	lea    0x130(%rsp),%rcx
591a   597594:	e8 e8 78 00 00       	call   59ee81 <trace_mm_vmscan_lru_shrink_inactive>
591f   597599:	e9 33 fd ff ff       	jmp    5972d1 <shrink_lruvec+0x5657>
5924   59759e:	48 8b 8c 24 80 00 00 00 	mov    0x80(%rsp),%rcx
592c   5975a6:	80 e1 07             	and    $0x7,%cl
592f   5975a9:	fe c1                	inc    %cl
5931   5975ab:	38 c1                	cmp    %al,%cl
5933   5975ad:	0f 8c 76 f6 ff ff    	jl     596c29 <shrink_lruvec+0x4faf>
5939   5975b3:	48 8b bc 24 80 00 00 00 	mov    0x80(%rsp),%rdi
5941   5975bb:	e8 00 00 00 00       	call   5975c0 <shrink_lruvec+0x5946>	5975bc: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5946   5975c0:	e9 64 f6 ff ff       	jmp    596c29 <shrink_lruvec+0x4faf>
594b   5975c5:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
5950   5975ca:	80 e1 07             	and    $0x7,%cl
5953   5975cd:	80 c1 03             	add    $0x3,%cl
5956   5975d0:	38 c1                	cmp    %al,%cl
5958   5975d2:	0f 8c fe fa ff ff    	jl     5970d6 <shrink_lruvec+0x545c>
595e   5975d8:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
5963   5975dd:	e8 00 00 00 00       	call   5975e2 <shrink_lruvec+0x5968>	5975de: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5968   5975e2:	e9 ef fa ff ff       	jmp    5970d6 <shrink_lruvec+0x545c>
596d   5975e7:	48 8b 8c 24 80 00 00 00 	mov    0x80(%rsp),%rcx
5975   5975ef:	80 e1 07             	and    $0x7,%cl
5978   5975f2:	fe c1                	inc    %cl
597a   5975f4:	38 c1                	cmp    %al,%cl
597c   5975f6:	0f 8c 9e f9 ff ff    	jl     596f9a <shrink_lruvec+0x5320>
5982   5975fc:	48 8b bc 24 80 00 00 00 	mov    0x80(%rsp),%rdi
598a   597604:	e8 00 00 00 00       	call   597609 <shrink_lruvec+0x598f>	597605: R_X86_64_PLT32	__asan_report_store2_noabort-0x4
598f   597609:	e9 8c f9 ff ff       	jmp    596f9a <shrink_lruvec+0x5320>
5994   59760e:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
5999   597613:	80 e1 07             	and    $0x7,%cl
599c   597616:	80 c1 03             	add    $0x3,%cl
599f   597619:	38 c1                	cmp    %al,%cl
59a1   59761b:	0f 8c 9b fb ff ff    	jl     5971bc <shrink_lruvec+0x5542>
59a7   597621:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
59ac   597626:	e8 00 00 00 00       	call   59762b <shrink_lruvec+0x59b1>	597627: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
59b1   59762b:	e9 8c fb ff ff       	jmp    5971bc <shrink_lruvec+0x5542>
59b6   597630:	48 8d 8c 24 44 01 00 00 	lea    0x144(%rsp),%rcx
59be   597638:	80 e1 07             	and    $0x7,%cl
59c1   59763b:	80 c1 03             	add    $0x3,%cl
59c4   59763e:	38 c1                	cmp    %al,%cl
59c6   597640:	0f 8c f7 fb ff ff    	jl     59723d <shrink_lruvec+0x55c3>
59cc   597646:	48 8d bc 24 44 01 00 00 	lea    0x144(%rsp),%rdi
59d4   59764e:	e8 00 00 00 00       	call   597653 <shrink_lruvec+0x59d9>	59764f: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
59d9   597653:	e9 e5 fb ff ff       	jmp    59723d <shrink_lruvec+0x55c3>
59de   597658:	48 8d 8c 24 34 01 00 00 	lea    0x134(%rsp),%rcx
59e6   597660:	80 e1 07             	and    $0x7,%cl
59e9   597663:	80 c1 03             	add    $0x3,%cl
59ec   597666:	38 c1                	cmp    %al,%cl
59ee   597668:	0f 8c 21 fc ff ff    	jl     59728f <shrink_lruvec+0x5615>
59f4   59766e:	48 8d bc 24 34 01 00 00 	lea    0x134(%rsp),%rdi
59fc   597676:	e8 00 00 00 00       	call   59767b <shrink_lruvec+0x5a01>	597677: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5a01   59767b:	e9 0f fc ff ff       	jmp    59728f <shrink_lruvec+0x5615>
5a06   597680:	3c 03                	cmp    $0x3,%al
5a08   597682:	0f 8f 9f fc ff ff    	jg     597327 <shrink_lruvec+0x56ad>
5a0e   597688:	48 8d bc 24 30 01 00 00 	lea    0x130(%rsp),%rdi
5a16   597690:	e8 00 00 00 00       	call   597695 <shrink_lruvec+0x5a1b>	597691: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5a1b   597695:	e9 8d fc ff ff       	jmp    597327 <shrink_lruvec+0x56ad>
5a20   59769a:	48 8b 8c 24 a0 01 00 00 	mov    0x1a0(%rsp),%rcx
5a28   5976a2:	80 e1 07             	and    $0x7,%cl
5a2b   5976a5:	80 c1 03             	add    $0x3,%cl
5a2e   5976a8:	38 c1                	cmp    %al,%cl
5a30   5976aa:	0f 8c a0 fc ff ff    	jl     597350 <shrink_lruvec+0x56d6>
5a36   5976b0:	48 8b bc 24 a0 01 00 00 	mov    0x1a0(%rsp),%rdi
5a3e   5976b8:	e8 00 00 00 00       	call   5976bd <shrink_lruvec+0x5a43>	5976b9: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5a43   5976bd:	e9 8e fc ff ff       	jmp    597350 <shrink_lruvec+0x56d6>
5a48   5976c2:	48 8d 8c 24 38 01 00 00 	lea    0x138(%rsp),%rcx
5a50   5976ca:	80 e1 07             	and    $0x7,%cl
5a53   5976cd:	80 c1 03             	add    $0x3,%cl
5a56   5976d0:	38 c1                	cmp    %al,%cl
5a58   5976d2:	0f 8c a4 fc ff ff    	jl     59737c <shrink_lruvec+0x5702>
5a5e   5976d8:	48 8d bc 24 38 01 00 00 	lea    0x138(%rsp),%rdi
5a66   5976e0:	e8 00 00 00 00       	call   5976e5 <shrink_lruvec+0x5a6b>	5976e1: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5a6b   5976e5:	e9 92 fc ff ff       	jmp    59737c <shrink_lruvec+0x5702>
5a70   5976ea:	48 8b 8c 24 98 01 00 00 	mov    0x198(%rsp),%rcx
5a78   5976f2:	80 e1 07             	and    $0x7,%cl
5a7b   5976f5:	80 c1 03             	add    $0x3,%cl
5a7e   5976f8:	38 c1                	cmp    %al,%cl
5a80   5976fa:	0f 8c a5 fc ff ff    	jl     5973a5 <shrink_lruvec+0x572b>
5a86   597700:	48 8b bc 24 98 01 00 00 	mov    0x198(%rsp),%rdi
5a8e   597708:	e8 00 00 00 00       	call   59770d <shrink_lruvec+0x5a93>	597709: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5a93   59770d:	e9 93 fc ff ff       	jmp    5973a5 <shrink_lruvec+0x572b>
5a98   597712:	48 8d 8c 24 34 01 00 00 	lea    0x134(%rsp),%rcx
5aa0   59771a:	80 e1 07             	and    $0x7,%cl
5aa3   59771d:	80 c1 03             	add    $0x3,%cl
5aa6   597720:	38 c1                	cmp    %al,%cl
5aa8   597722:	0f 8c a2 fc ff ff    	jl     5973ca <shrink_lruvec+0x5750>
5aae   597728:	48 8d bc 24 34 01 00 00 	lea    0x134(%rsp),%rdi
5ab6   597730:	e8 00 00 00 00       	call   597735 <shrink_lruvec+0x5abb>	597731: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5abb   597735:	e9 90 fc ff ff       	jmp    5973ca <shrink_lruvec+0x5750>
5ac0   59773a:	48 8b 8c 24 88 01 00 00 	mov    0x188(%rsp),%rcx
5ac8   597742:	80 e1 07             	and    $0x7,%cl
5acb   597745:	80 c1 03             	add    $0x3,%cl
5ace   597748:	38 c1                	cmp    %al,%cl
5ad0   59774a:	0f 8c a3 fc ff ff    	jl     5973f3 <shrink_lruvec+0x5779>
5ad6   597750:	48 8b bc 24 88 01 00 00 	mov    0x188(%rsp),%rdi
5ade   597758:	e8 00 00 00 00       	call   59775d <shrink_lruvec+0x5ae3>	597759: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5ae3   59775d:	e9 91 fc ff ff       	jmp    5973f3 <shrink_lruvec+0x5779>
5ae8   597762:	48 8d 8c 24 3c 01 00 00 	lea    0x13c(%rsp),%rcx
5af0   59776a:	80 e1 07             	and    $0x7,%cl
5af3   59776d:	80 c1 03             	add    $0x3,%cl
5af6   597770:	38 c1                	cmp    %al,%cl
5af8   597772:	0f 8c a7 fc ff ff    	jl     59741f <shrink_lruvec+0x57a5>
5afe   597778:	48 8d bc 24 3c 01 00 00 	lea    0x13c(%rsp),%rdi
5b06   597780:	e8 00 00 00 00       	call   597785 <shrink_lruvec+0x5b0b>	597781: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5b0b   597785:	e9 95 fc ff ff       	jmp    59741f <shrink_lruvec+0x57a5>
5b10   59778a:	48 8b 8c 24 a0 00 00 00 	mov    0xa0(%rsp),%rcx
5b18   597792:	80 e1 07             	and    $0x7,%cl
5b1b   597795:	80 c1 03             	add    $0x3,%cl
5b1e   597798:	38 c1                	cmp    %al,%cl
5b20   59779a:	0f 8c a8 fc ff ff    	jl     597448 <shrink_lruvec+0x57ce>
5b26   5977a0:	48 8b bc 24 a0 00 00 00 	mov    0xa0(%rsp),%rdi
5b2e   5977a8:	e8 00 00 00 00       	call   5977ad <shrink_lruvec+0x5b33>	5977a9: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5b33   5977ad:	e9 96 fc ff ff       	jmp    597448 <shrink_lruvec+0x57ce>
5b38   5977b2:	48 8d 8c 24 40 01 00 00 	lea    0x140(%rsp),%rcx
5b40   5977ba:	80 e1 07             	and    $0x7,%cl
5b43   5977bd:	80 c1 03             	add    $0x3,%cl
5b46   5977c0:	38 c1                	cmp    %al,%cl
5b48   5977c2:	0f 8c ac fc ff ff    	jl     597474 <shrink_lruvec+0x57fa>
5b4e   5977c8:	48 8d bc 24 40 01 00 00 	lea    0x140(%rsp),%rdi
5b56   5977d0:	e8 00 00 00 00       	call   5977d5 <shrink_lruvec+0x5b5b>	5977d1: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5b5b   5977d5:	e9 9a fc ff ff       	jmp    597474 <shrink_lruvec+0x57fa>
5b60   5977da:	48 8b 8c 24 90 01 00 00 	mov    0x190(%rsp),%rcx
5b68   5977e2:	80 e1 07             	and    $0x7,%cl
5b6b   5977e5:	80 c1 03             	add    $0x3,%cl
5b6e   5977e8:	38 c1                	cmp    %al,%cl
5b70   5977ea:	0f 8c ad fc ff ff    	jl     59749d <shrink_lruvec+0x5823>
5b76   5977f0:	48 8b bc 24 90 01 00 00 	mov    0x190(%rsp),%rdi
5b7e   5977f8:	e8 00 00 00 00       	call   5977fd <shrink_lruvec+0x5b83>	5977f9: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5b83   5977fd:	e9 9b fc ff ff       	jmp    59749d <shrink_lruvec+0x5823>
5b88   597802:	48 8b 8c 24 98 00 00 00 	mov    0x98(%rsp),%rcx
5b90   59780a:	80 e1 07             	and    $0x7,%cl
5b93   59780d:	80 c1 03             	add    $0x3,%cl
5b96   597810:	38 c1                	cmp    %al,%cl
5b98   597812:	0f 8c b1 fc ff ff    	jl     5974c9 <shrink_lruvec+0x584f>
5b9e   597818:	48 8b bc 24 98 00 00 00 	mov    0x98(%rsp),%rdi
5ba6   597820:	e8 00 00 00 00       	call   597825 <shrink_lruvec+0x5bab>	597821: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5bab   597825:	e9 9f fc ff ff       	jmp    5974c9 <shrink_lruvec+0x584f>
5bb0   59782a:	48 8b 8c 24 68 01 00 00 	mov    0x168(%rsp),%rcx
5bb8   597832:	80 e1 07             	and    $0x7,%cl
5bbb   597835:	80 c1 03             	add    $0x3,%cl
5bbe   597838:	38 c1                	cmp    %al,%cl
5bc0   59783a:	0f 8c ff fc ff ff    	jl     59753f <shrink_lruvec+0x58c5>
5bc6   597840:	48 8b bc 24 68 01 00 00 	mov    0x168(%rsp),%rdi
5bce   597848:	e8 00 00 00 00       	call   59784d <shrink_lruvec+0x5bd3>	597849: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5bd3   59784d:	e9 ed fc ff ff       	jmp    59753f <shrink_lruvec+0x58c5>
5bd8   597852:	48 8b 8c 24 c8 00 00 00 	mov    0xc8(%rsp),%rcx
5be0   59785a:	80 e1 07             	and    $0x7,%cl
5be3   59785d:	38 c1                	cmp    %al,%cl
5be5   59785f:	0f 8c 02 fd ff ff    	jl     597567 <shrink_lruvec+0x58ed>
5beb   597865:	48 8b bc 24 c8 00 00 00 	mov    0xc8(%rsp),%rdi
5bf3   59786d:	e8 00 00 00 00       	call   597872 <shrink_lruvec+0x5bf8>	59786e: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
5bf8   597872:	e9 f0 fc ff ff       	jmp    597567 <shrink_lruvec+0x58ed>
5bfd   597877:	48 8b 8c 24 90 00 00 00 	mov    0x90(%rsp),%rcx
5c05   59787f:	80 e1 07             	and    $0x7,%cl
5c08   597882:	80 c1 03             	add    $0x3,%cl
5c0b   597885:	38 c1                	cmp    %al,%cl
5c0d   597887:	0f 8c 7b fc ff ff    	jl     597508 <shrink_lruvec+0x588e>
5c13   59788d:	48 8b bc 24 90 00 00 00 	mov    0x90(%rsp),%rdi
5c1b   597895:	e8 00 00 00 00       	call   59789a <shrink_lruvec+0x5c20>	597896: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5c20   59789a:	e9 69 fc ff ff       	jmp    597508 <shrink_lruvec+0x588e>
5c25   59789f:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	5978a2: R_X86_64_32S	.rodata+0x129ac0
5c2c   5978a6:	be 23 15 00 00       	mov    $0x1523,%esi
5c31   5978ab:	31 d2                	xor    %edx,%edx
5c33   5978ad:	e8 00 00 00 00       	call   5978b2 <shrink_lruvec+0x5c38>	5978ae: R_X86_64_PLT32	__might_resched-0x4
5c38   5978b2:	e8 00 00 00 00       	call   5978b7 <shrink_lruvec+0x5c3d>	5978b3: R_X86_64_PLT32	__cond_resched-0x4
5c3d   5978b7:	4c 8b a4 24 d0 00 00 00 	mov    0xd0(%rsp),%r12
5c45   5978bf:	4c 89 e7             	mov    %r12,%rdi
5c48   5978c2:	48 89 de             	mov    %rbx,%rsi
5c4b   5978c5:	e8 00 00 00 00       	call   5978ca <shrink_lruvec+0x5c50>	5978c6: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
5c50   5978ca:	49 39 dc             	cmp    %rbx,%r12
5c53   5978cd:	72 0a                	jb     5978d9 <shrink_lruvec+0x5c5f>
5c55   5978cf:	80 bc 24 80 01 00 00 00 	cmpb   $0x0,0x180(%rsp)
5c5d   5978d7:	74 0a                	je     5978e3 <shrink_lruvec+0x5c69>
5c5f   5978d9:	e8 00 00 00 00       	call   5978de <shrink_lruvec+0x5c64>	5978da: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5c64   5978de:	e9 8b f1 ff ff       	jmp    596a6e <shrink_lruvec+0x4df4>
5c69   5978e3:	48 8d 84 24 c0 01 00 00 	lea    0x1c0(%rsp),%rax
5c71   5978eb:	48 c1 e8 03          	shr    $0x3,%rax
5c75   5978ef:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
5c7f   5978f9:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
5c83   5978fd:	74 0d                	je     59790c <shrink_lruvec+0x5c92>
5c85   5978ff:	48 8d bc 24 c0 01 00 00 	lea    0x1c0(%rsp),%rdi
5c8d   597907:	e8 00 00 00 00       	call   59790c <shrink_lruvec+0x5c92>	597908: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
5c92   59790c:	48 8b 84 24 c0 01 00 00 	mov    0x1c0(%rsp),%rax
5c9a   597914:	48 89 04 24          	mov    %rax,(%rsp)
5c9e   597918:	48 8d 84 24 c8 01 00 00 	lea    0x1c8(%rsp),%rax
5ca6   597920:	48 c1 e8 03          	shr    $0x3,%rax
5caa   597924:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
5cb4   59792e:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
5cb8   597932:	74 0d                	je     597941 <shrink_lruvec+0x5cc7>
5cba   597934:	48 8d bc 24 c8 01 00 00 	lea    0x1c8(%rsp),%rdi
5cc2   59793c:	e8 00 00 00 00       	call   597941 <shrink_lruvec+0x5cc7>	59793d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
5cc7   597941:	48 8b 04 24          	mov    (%rsp),%rax
5ccb   597945:	48 03 84 24 c8 01 00 00 	add    0x1c8(%rsp),%rax
5cd3   59794d:	48 89 04 24          	mov    %rax,(%rsp)
5cd7   597951:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
5ce1   59795b:	48 8b 8c 24 f0 01 00 00 	mov    0x1f0(%rsp),%rcx
5ce9   597963:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
5ced   597967:	74 0d                	je     597976 <shrink_lruvec+0x5cfc>
5cef   597969:	48 8d bc 24 b0 01 00 00 	lea    0x1b0(%rsp),%rdi
5cf7   597971:	e8 00 00 00 00       	call   597976 <shrink_lruvec+0x5cfc>	597972: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
5cfc   597976:	4c 8b a4 24 b0 01 00 00 	mov    0x1b0(%rsp),%r12
5d04   59797e:	48 8d 84 24 b8 01 00 00 	lea    0x1b8(%rsp),%rax
5d0c   597986:	48 c1 e8 03          	shr    $0x3,%rax
5d10   59798a:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
5d1a   597994:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
5d1e   597998:	74 0d                	je     5979a7 <shrink_lruvec+0x5d2d>
5d20   59799a:	48 8d bc 24 b8 01 00 00 	lea    0x1b8(%rsp),%rdi
5d28   5979a2:	e8 00 00 00 00       	call   5979a7 <shrink_lruvec+0x5d2d>	5979a3: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
5d2d   5979a7:	4c 03 a4 24 b8 01 00 00 	add    0x1b8(%rsp),%r12
5d35   5979af:	31 ff                	xor    %edi,%edi
5d37   5979b1:	48 8b 34 24          	mov    (%rsp),%rsi
5d3b   5979b5:	e8 00 00 00 00       	call   5979ba <shrink_lruvec+0x5d40>	5979b6: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
5d40   5979ba:	31 ff                	xor    %edi,%edi
5d42   5979bc:	4c 89 64 24 28       	mov    %r12,0x28(%rsp)
5d47   5979c1:	4c 89 e6             	mov    %r12,%rsi
5d4a   5979c4:	e8 00 00 00 00       	call   5979c9 <shrink_lruvec+0x5d4f>	5979c5: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
5d4f   5979c9:	48 83 3c 24 00       	cmpq   $0x0,(%rsp)
5d54   5979ce:	0f 84 d6 05 00 00    	je     597faa <shrink_lruvec+0x6330>
5d5a   5979d4:	48 83 7c 24 28 00    	cmpq   $0x0,0x28(%rsp)
5d60   5979da:	0f 84 ca 05 00 00    	je     597faa <shrink_lruvec+0x6330>
5d66   5979e0:	48 8b 3c 24          	mov    (%rsp),%rdi
5d6a   5979e4:	4c 8b 64 24 28       	mov    0x28(%rsp),%r12
5d6f   5979e9:	4c 89 e6             	mov    %r12,%rsi
5d72   5979ec:	e8 00 00 00 00       	call   5979f1 <shrink_lruvec+0x5d77>	5979ed: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
5d77   5979f1:	4c 39 24 24          	cmp    %r12,(%rsp)
5d7b   5979f5:	76 4a                	jbe    597a41 <shrink_lruvec+0x5dc7>
5d7d   5979f7:	e8 00 00 00 00       	call   5979fc <shrink_lruvec+0x5d82>	5979f8: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5d82   5979fc:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
5d8c   597a06:	48 8b 8c 24 28 02 00 00 	mov    0x228(%rsp),%rcx
5d94   597a0e:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
5d98   597a12:	74 0d                	je     597a21 <shrink_lruvec+0x5da7>
5d9a   597a14:	48 8d bc 24 80 02 00 00 	lea    0x280(%rsp),%rdi
5da2   597a1c:	e8 00 00 00 00       	call   597a21 <shrink_lruvec+0x5da7>	597a1d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
5da7   597a21:	31 c0                	xor    %eax,%eax
5da9   597a23:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
5dae   597a28:	b8 02 00 00 00       	mov    $0x2,%eax
5db3   597a2d:	48 89 44 24 78       	mov    %rax,0x78(%rsp)
5db8   597a32:	4c 8b a4 24 80 02 00 00 	mov    0x280(%rsp),%r12
5dc0   597a3a:	4c 89 74 24 20       	mov    %r14,0x20(%rsp)
5dc5   597a3f:	eb 4b                	jmp    597a8c <shrink_lruvec+0x5e12>
5dc7   597a41:	e8 00 00 00 00       	call   597a46 <shrink_lruvec+0x5dcc>	597a42: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5dcc   597a46:	4c 89 e8             	mov    %r13,%rax
5dcf   597a49:	48 c1 e8 03          	shr    $0x3,%rax
5dd3   597a4d:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
5ddd   597a57:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
5de1   597a5b:	74 08                	je     597a65 <shrink_lruvec+0x5deb>
5de3   597a5d:	4c 89 ef             	mov    %r13,%rdi
5de6   597a60:	e8 00 00 00 00       	call   597a65 <shrink_lruvec+0x5deb>	597a61: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
5deb   597a65:	b8 02 00 00 00       	mov    $0x2,%eax
5df0   597a6a:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
5df5   597a6f:	31 c0                	xor    %eax,%eax
5df7   597a71:	48 89 44 24 78       	mov    %rax,0x78(%rsp)
5dfc   597a76:	4c 8b a4 24 90 02 00 00 	mov    0x290(%rsp),%r12
5e04   597a7e:	4c 89 7c 24 20       	mov    %r15,0x20(%rsp)
5e09   597a83:	48 8b 04 24          	mov    (%rsp),%rax
5e0d   597a87:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
5e12   597a8c:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
5e17   597a91:	48 c1 e8 03          	shr    $0x3,%rax
5e1b   597a95:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
5e25   597a9f:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
5e29   597aa3:	74 0a                	je     597aaf <shrink_lruvec+0x5e35>
5e2b   597aa5:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
5e30   597aaa:	e8 00 00 00 00       	call   597aaf <shrink_lruvec+0x5e35>	597aab: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
5e35   597aaf:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
5e3a   597ab4:	48 8b 00             	mov    (%rax),%rax
5e3d   597ab7:	49 8d 0c 04          	lea    (%r12,%rax,1),%rcx
5e41   597abb:	48 ff c1             	inc    %rcx
5e44   597abe:	48 6b 44 24 28 64    	imul   $0x64,0x28(%rsp),%rax
5e4a   597ac4:	31 d2                	xor    %edx,%edx
5e4c   597ac6:	48 f7 f1             	div    %rcx
5e4f   597ac9:	48 89 04 24          	mov    %rax,(%rsp)
5e53   597acd:	8b 44 24 38          	mov    0x38(%rsp),%eax
5e57   597ad1:	4c 8d 24 c4          	lea    (%rsp,%rax,8),%r12
5e5b   597ad5:	49 81 c4 b0 01 00 00 	add    $0x1b0,%r12
5e62   597adc:	4c 89 e0             	mov    %r12,%rax
5e65   597adf:	48 c1 e8 03          	shr    $0x3,%rax
5e69   597ae3:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
5e73   597aed:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
5e77   597af1:	74 08                	je     597afb <shrink_lruvec+0x5e81>
5e79   597af3:	4c 89 e7             	mov    %r12,%rdi
5e7c   597af6:	e8 00 00 00 00       	call   597afb <shrink_lruvec+0x5e81>	597af7: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
5e81   597afb:	49 c7 04 24 00 00 00 00 	movq   $0x0,(%r12)
5e89   597b03:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
5e8e   597b08:	83 c8 01             	or     $0x1,%eax
5e91   597b0b:	4c 8d 24 c4          	lea    (%rsp,%rax,8),%r12
5e95   597b0f:	49 81 c4 b0 01 00 00 	add    $0x1b0,%r12
5e9c   597b16:	4c 89 e0             	mov    %r12,%rax
5e9f   597b19:	48 c1 e8 03          	shr    $0x3,%rax
5ea3   597b1d:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
5ead   597b27:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
5eb1   597b2b:	74 08                	je     597b35 <shrink_lruvec+0x5ebb>
5eb3   597b2d:	4c 89 e7             	mov    %r12,%rdi
5eb6   597b30:	e8 00 00 00 00       	call   597b35 <shrink_lruvec+0x5ebb>	597b31: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
5ebb   597b35:	49 c7 04 24 00 00 00 00 	movq   $0x0,(%r12)
5ec3   597b3d:	44 8b 64 24 78       	mov    0x78(%rsp),%r12d
5ec8   597b42:	4a 8d 3c e4          	lea    (%rsp,%r12,8),%rdi
5ecc   597b46:	48 81 c7 80 02 00 00 	add    $0x280,%rdi
5ed3   597b4d:	48 89 f8             	mov    %rdi,%rax
5ed6   597b50:	48 c1 e8 03          	shr    $0x3,%rax
5eda   597b54:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
5ee4   597b5e:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
5ee8   597b62:	74 05                	je     597b69 <shrink_lruvec+0x5eef>
5eea   597b64:	e8 00 00 00 00       	call   597b69 <shrink_lruvec+0x5eef>	597b65: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
5eef   597b69:	4a 8b 84 e4 80 02 00 00 	mov    0x280(%rsp,%r12,8),%rax
5ef7   597b71:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
5efc   597b76:	4a 8d 04 e4          	lea    (%rsp,%r12,8),%rax
5f00   597b7a:	48 05 b0 01 00 00    	add    $0x1b0,%rax
5f06   597b80:	49 89 c4             	mov    %rax,%r12
5f09   597b83:	48 89 c1             	mov    %rax,%rcx
5f0c   597b86:	48 c1 e9 03          	shr    $0x3,%rcx
5f10   597b8a:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
5f1a   597b94:	48 89 4c 24 28       	mov    %rcx,0x28(%rsp)
5f1f   597b99:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
5f23   597b9d:	74 08                	je     597ba7 <shrink_lruvec+0x5f2d>
5f25   597b9f:	4c 89 e7             	mov    %r12,%rdi
5f28   597ba2:	e8 00 00 00 00       	call   597ba7 <shrink_lruvec+0x5f2d>	597ba3: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
5f2d   597ba7:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
5f32   597bac:	48 89 c1             	mov    %rax,%rcx
5f35   597baf:	49 2b 0c 24          	sub    (%r12),%rcx
5f39   597bb3:	ba 64 00 00 00       	mov    $0x64,%edx
5f3e   597bb8:	48 2b 14 24          	sub    (%rsp),%rdx
5f42   597bbc:	48 89 14 24          	mov    %rdx,(%rsp)
5f46   597bc0:	48 0f af c2          	imul   %rdx,%rax
5f4a   597bc4:	48 c1 e8 02          	shr    $0x2,%rax
5f4e   597bc8:	48 ba c3 f5 28 5c 8f c2 f5 28 	movabs $0x28f5c28f5c28f5c3,%rdx
5f58   597bd2:	48 f7 e2             	mul    %rdx
5f5b   597bd5:	48 c1 ea 02          	shr    $0x2,%rdx
5f5f   597bd9:	48 29 ca             	sub    %rcx,%rdx
5f62   597bdc:	b8 00 00 00 00       	mov    $0x0,%eax
5f67   597be1:	48 0f 43 c2          	cmovae %rdx,%rax
5f6b   597be5:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
5f70   597bea:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
5f7a   597bf4:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
5f7f   597bf9:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
5f83   597bfd:	74 08                	je     597c07 <shrink_lruvec+0x5f8d>
5f85   597bff:	4c 89 e7             	mov    %r12,%rdi
5f88   597c02:	e8 00 00 00 00       	call   597c07 <shrink_lruvec+0x5f8d>	597c03: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
5f8d   597c07:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
5f92   597c0c:	49 89 04 24          	mov    %rax,(%r12)
5f96   597c10:	48 8b 44 24 78       	mov    0x78(%rsp),%rax
5f9b   597c15:	83 c8 01             	or     $0x1,%eax
5f9e   597c18:	49 89 c4             	mov    %rax,%r12
5fa1   597c1b:	48 8d 3c c4          	lea    (%rsp,%rax,8),%rdi
5fa5   597c1f:	48 81 c7 80 02 00 00 	add    $0x280,%rdi
5fac   597c26:	48 89 f8             	mov    %rdi,%rax
5faf   597c29:	48 c1 e8 03          	shr    $0x3,%rax
5fb3   597c2d:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
5fbd   597c37:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
5fc1   597c3b:	74 05                	je     597c42 <shrink_lruvec+0x5fc8>
5fc3   597c3d:	e8 00 00 00 00       	call   597c42 <shrink_lruvec+0x5fc8>	597c3e: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
5fc8   597c42:	4a 8b 84 e4 80 02 00 00 	mov    0x280(%rsp,%r12,8),%rax
5fd0   597c4a:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
5fd5   597c4f:	4e 8d 24 e4          	lea    (%rsp,%r12,8),%r12
5fd9   597c53:	49 81 c4 b0 01 00 00 	add    $0x1b0,%r12
5fe0   597c5a:	4c 89 e1             	mov    %r12,%rcx
5fe3   597c5d:	48 c1 e9 03          	shr    $0x3,%rcx
5fe7   597c61:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
5ff1   597c6b:	48 89 4c 24 28       	mov    %rcx,0x28(%rsp)
5ff6   597c70:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
5ffa   597c74:	74 08                	je     597c7e <shrink_lruvec+0x6004>
5ffc   597c76:	4c 89 e7             	mov    %r12,%rdi
5fff   597c79:	e8 00 00 00 00       	call   597c7e <shrink_lruvec+0x6004>	597c7a: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6004   597c7e:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
6009   597c83:	48 89 d1             	mov    %rdx,%rcx
600c   597c86:	49 2b 0c 24          	sub    (%r12),%rcx
6010   597c8a:	48 8b 04 24          	mov    (%rsp),%rax
6014   597c8e:	48 0f af c2          	imul   %rdx,%rax
6018   597c92:	48 c1 e8 02          	shr    $0x2,%rax
601c   597c96:	48 ba c3 f5 28 5c 8f c2 f5 28 	movabs $0x28f5c28f5c28f5c3,%rdx
6026   597ca0:	48 f7 e2             	mul    %rdx
6029   597ca3:	48 c1 ea 02          	shr    $0x2,%rdx
602d   597ca7:	48 29 ca             	sub    %rcx,%rdx
6030   597caa:	b8 00 00 00 00       	mov    $0x0,%eax
6035   597caf:	48 0f 43 c2          	cmovae %rdx,%rax
6039   597cb3:	48 89 04 24          	mov    %rax,(%rsp)
603d   597cb7:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
6047   597cc1:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
604c   597cc6:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
6050   597cca:	74 08                	je     597cd4 <shrink_lruvec+0x605a>
6052   597ccc:	4c 89 e7             	mov    %r12,%rdi
6055   597ccf:	e8 00 00 00 00       	call   597cd4 <shrink_lruvec+0x605a>	597cd0: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
605a   597cd4:	48 8b 04 24          	mov    (%rsp),%rax
605e   597cd8:	49 89 04 24          	mov    %rax,(%r12)
6062   597cdc:	41 b4 01             	mov    $0x1,%r12b
6065   597cdf:	e9 73 ed ff ff       	jmp    596a57 <shrink_lruvec+0x4ddd>
606a   597ce4:	e8 00 00 00 00       	call   597ce9 <shrink_lruvec+0x606f>	597ce5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
606f   597ce9:	48 8d bc 24 20 03 00 00 	lea    0x320(%rsp),%rdi
6077   597cf1:	e8 00 00 00 00       	call   597cf6 <shrink_lruvec+0x607c>	597cf2: R_X86_64_PLT32	blk_finish_plug-0x4
607c   597cf6:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
6081   597cfb:	48 8d 78 48          	lea    0x48(%rax),%rdi
6085   597cff:	48 89 f8             	mov    %rdi,%rax
6088   597d02:	48 c1 e8 03          	shr    $0x3,%rax
608c   597d06:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
6096   597d10:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
609a   597d14:	74 05                	je     597d1b <shrink_lruvec+0x60a1>
609c   597d16:	e8 00 00 00 00       	call   597d1b <shrink_lruvec+0x60a1>	597d17: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
60a1   597d1b:	48 8b 74 24 50       	mov    0x50(%rsp),%rsi
60a6   597d20:	48 8b 84 24 d0 00 00 00 	mov    0xd0(%rsp),%rax
60ae   597d28:	48 01 46 48          	add    %rax,0x48(%rsi)
60b2   597d2c:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
60b7   597d31:	e8 f9 03 00 00       	call   59812f <can_age_anon_pages>
60bc   597d36:	84 c0                	test   %al,%al
60be   597d38:	74 33                	je     597d6d <shrink_lruvec+0x60f3>
60c0   597d3a:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
60c5   597d3f:	31 f6                	xor    %esi,%esi
60c7   597d41:	e8 9e 9e ff ff       	call   591be4 <inactive_is_low>
60cc   597d46:	84 c0                	test   %al,%al
60ce   597d48:	74 2d                	je     597d77 <shrink_lruvec+0x60fd>
60d0   597d4a:	e8 00 00 00 00       	call   597d4f <shrink_lruvec+0x60d5>	597d4b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
60d5   597d4f:	bf 20 00 00 00       	mov    $0x20,%edi
60da   597d54:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
60df   597d59:	48 8b 54 24 50       	mov    0x50(%rsp),%rdx
60e4   597d5e:	b9 01 00 00 00       	mov    $0x1,%ecx
60e9   597d63:	e8 45 05 00 00       	call   5982ad <shrink_active_list>
60ee   597d68:	e9 08 e5 ff ff       	jmp    596275 <shrink_lruvec+0x45fb>
60f3   597d6d:	e8 00 00 00 00       	call   597d72 <shrink_lruvec+0x60f8>	597d6e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
60f8   597d72:	e9 fe e4 ff ff       	jmp    596275 <shrink_lruvec+0x45fb>
60fd   597d77:	e8 00 00 00 00       	call   597d7c <shrink_lruvec+0x6102>	597d78: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
6102   597d7c:	e9 f4 e4 ff ff       	jmp    596275 <shrink_lruvec+0x45fb>
6107   597d81:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	597d84: R_X86_64_32S	numa_demotion_enabled
610e   597d88:	48 c1 e8 03          	shr    $0x3,%rax
6112   597d8c:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
611c   597d96:	8a 04 08             	mov    (%rax,%rcx,1),%al
611f   597d99:	84 c0                	test   %al,%al
6121   597d9b:	0f 85 1d 03 00 00    	jne    5980be <shrink_lruvec+0x6444>
6127   597da1:	44 0f b6 25 00 00 00 00 	movzbl 0x0(%rip),%r12d        # 597da9 <shrink_lruvec+0x612f>	597da5: R_X86_64_PC32	numa_demotion_enabled-0x4
612f   597da9:	31 ff                	xor    %edi,%edi
6131   597dab:	44 89 e6             	mov    %r12d,%esi
6134   597dae:	e8 00 00 00 00       	call   597db3 <shrink_lruvec+0x6139>	597daf: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
6139   597db3:	45 85 e4             	test   %r12d,%r12d
613c   597db6:	0f 84 07 02 00 00    	je     597fc3 <shrink_lruvec+0x6349>
6142   597dbc:	48 83 7c 24 50 00    	cmpq   $0x0,0x50(%rsp)
6148   597dc2:	0f 84 0f 02 00 00    	je     597fd7 <shrink_lruvec+0x635d>
614e   597dc8:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
6158   597dd2:	48 8b 8c 24 a8 01 00 00 	mov    0x1a8(%rsp),%rcx
6160   597dda:	8a 04 01             	mov    (%rcx,%rax,1),%al
6163   597ddd:	84 c0                	test   %al,%al
6165   597ddf:	0f 85 fc 02 00 00    	jne    5980e1 <shrink_lruvec+0x6467>
616b   597de5:	48 8b 84 24 80 00 00 00 	mov    0x80(%rsp),%rax
6173   597ded:	44 0f b7 20          	movzwl (%rax),%r12d
6177   597df1:	44 89 e6             	mov    %r12d,%esi
617a   597df4:	81 e6 00 40 00 00    	and    $0x4000,%esi
6180   597dfa:	31 ff                	xor    %edi,%edi
6182   597dfc:	e8 00 00 00 00       	call   597e01 <shrink_lruvec+0x6187>	597dfd: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp2-0x4
6187   597e01:	41 81 e4 00 40 00 00 	and    $0x4000,%r12d
618e   597e08:	0f 85 f5 01 00 00    	jne    598003 <shrink_lruvec+0x6389>
6194   597e0e:	e8 00 00 00 00       	call   597e13 <shrink_lruvec+0x6199>	597e0f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
6199   597e13:	e9 c4 01 00 00       	jmp    597fdc <shrink_lruvec+0x6362>
619e   597e18:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
61a8   597e22:	48 8b 8c 24 a8 01 00 00 	mov    0x1a8(%rsp),%rcx
61b0   597e2a:	8a 04 01             	mov    (%rcx,%rax,1),%al
61b3   597e2d:	84 c0                	test   %al,%al
61b5   597e2f:	0f 85 d3 02 00 00    	jne    598108 <shrink_lruvec+0x648e>
61bb   597e35:	48 8b 84 24 80 00 00 00 	mov    0x80(%rsp),%rax
61c3   597e3d:	44 0f b7 20          	movzwl (%rax),%r12d
61c7   597e41:	44 89 e6             	mov    %r12d,%esi
61ca   597e44:	81 e6 00 20 00 00    	and    $0x2000,%esi
61d0   597e4a:	31 c0                	xor    %eax,%eax
61d2   597e4c:	48 89 84 24 a8 00 00 00 	mov    %rax,0xa8(%rsp)
61da   597e54:	31 ff                	xor    %edi,%edi
61dc   597e56:	e8 00 00 00 00       	call   597e5b <shrink_lruvec+0x61e1>	597e57: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp2-0x4
61e1   597e5b:	44 89 e0             	mov    %r12d,%eax
61e4   597e5e:	25 00 20 00 00       	and    $0x2000,%eax
61e9   597e63:	0f 85 4b 01 00 00    	jne    597fb4 <shrink_lruvec+0x633a>
61ef   597e69:	41 81 e4 00 10 00 00 	and    $0x1000,%r12d
61f6   597e70:	31 ff                	xor    %edi,%edi
61f8   597e72:	44 89 e6             	mov    %r12d,%esi
61fb   597e75:	e8 00 00 00 00       	call   597e7a <shrink_lruvec+0x6200>	597e76: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp2-0x4
6200   597e7a:	45 85 e4             	test   %r12d,%r12d
6203   597e7d:	0f 85 4a 01 00 00    	jne    597fcd <shrink_lruvec+0x6353>
6209   597e83:	e8 00 00 00 00       	call   597e88 <shrink_lruvec+0x620e>	597e84: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
620e   597e88:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
6213   597e8d:	48 8d 78 18          	lea    0x18(%rax),%rdi
6217   597e91:	48 89 f8             	mov    %rdi,%rax
621a   597e94:	48 c1 e8 03          	shr    $0x3,%rax
621e   597e98:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
6228   597ea2:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
622c   597ea6:	74 05                	je     597ead <shrink_lruvec+0x6233>
622e   597ea8:	e8 00 00 00 00       	call   597ead <shrink_lruvec+0x6233>	597ea9: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6233   597ead:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
6238   597eb2:	4c 8b 60 18          	mov    0x18(%rax),%r12
623c   597eb6:	48 83 c0 20          	add    $0x20,%rax
6240   597eba:	48 89 04 24          	mov    %rax,(%rsp)
6244   597ebe:	48 c1 e8 03          	shr    $0x3,%rax
6248   597ec2:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
6252   597ecc:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
6256   597ed0:	74 09                	je     597edb <shrink_lruvec+0x6261>
6258   597ed2:	48 8b 3c 24          	mov    (%rsp),%rdi
625c   597ed6:	e8 00 00 00 00       	call   597edb <shrink_lruvec+0x6261>	597ed7: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6261   597edb:	48 8b 04 24          	mov    (%rsp),%rax
6265   597edf:	48 8b 00             	mov    (%rax),%rax
6268   597ee2:	4a 8d 0c 20          	lea    (%rax,%r12,1),%rcx
626c   597ee6:	4a 8d 34 21          	lea    (%rcx,%r12,1),%rsi
6270   597eea:	4c 8d 04 08          	lea    (%rax,%rcx,1),%r8
6274   597eee:	49 ff c0             	inc    %r8
6277   597ef1:	4c 01 c6             	add    %r8,%rsi
627a   597ef4:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
627f   597ef9:	48 89 f8             	mov    %rdi,%rax
6282   597efc:	48 0f af c6          	imul   %rsi,%rax
6286   597f00:	4c 01 e1             	add    %r12,%rcx
6289   597f03:	48 ff c1             	inc    %rcx
628c   597f06:	31 d2                	xor    %edx,%edx
628e   597f08:	48 f7 f1             	div    %rcx
6291   597f0b:	48 89 04 24          	mov    %rax,(%rsp)
6295   597f0f:	b8 c8 00 00 00       	mov    $0xc8,%eax
629a   597f14:	29 f8                	sub    %edi,%eax
629c   597f16:	48 98                	cltq
629e   597f18:	48 0f af c6          	imul   %rsi,%rax
62a2   597f1c:	31 d2                	xor    %edx,%edx
62a4   597f1e:	49 f7 f0             	div    %r8
62a7   597f21:	49 89 c4             	mov    %rax,%r12
62aa   597f24:	48 8d 84 24 30 01 00 00 	lea    0x130(%rsp),%rax
62b2   597f2c:	48 c1 e8 03          	shr    $0x3,%rax
62b6   597f30:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
62c0   597f3a:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
62c4   597f3e:	74 0d                	je     597f4d <shrink_lruvec+0x62d3>
62c6   597f40:	48 8d bc 24 30 01 00 00 	lea    0x130(%rsp),%rdi
62ce   597f48:	e8 00 00 00 00       	call   597f4d <shrink_lruvec+0x62d3>	597f49: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
62d3   597f4d:	48 8b 04 24          	mov    (%rsp),%rax
62d7   597f51:	48 89 84 24 30 01 00 00 	mov    %rax,0x130(%rsp)
62df   597f59:	48 8d 84 24 38 01 00 00 	lea    0x138(%rsp),%rax
62e7   597f61:	48 c1 e8 03          	shr    $0x3,%rax
62eb   597f65:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
62f5   597f6f:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
62f9   597f73:	74 0d                	je     597f82 <shrink_lruvec+0x6308>
62fb   597f75:	48 8d bc 24 38 01 00 00 	lea    0x138(%rsp),%rdi
6303   597f7d:	e8 00 00 00 00       	call   597f82 <shrink_lruvec+0x6308>	597f7e: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
6308   597f82:	4c 89 a4 24 38 01 00 00 	mov    %r12,0x138(%rsp)
6310   597f8a:	4c 03 24 24          	add    (%rsp),%r12
6314   597f8e:	4c 89 a4 24 88 00 00 00 	mov    %r12,0x88(%rsp)
631c   597f96:	b8 01 00 00 00       	mov    $0x1,%eax
6321   597f9b:	31 c9                	xor    %ecx,%ecx
6323   597f9d:	48 89 8c 24 a8 00 00 00 	mov    %rcx,0xa8(%rsp)
632b   597fa5:	e9 c4 e3 ff ff       	jmp    59636e <shrink_lruvec+0x46f4>
6330   597faa:	e8 00 00 00 00       	call   597faf <shrink_lruvec+0x6335>	597fab: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
6335   597faf:	e9 35 fd ff ff       	jmp    597ce9 <shrink_lruvec+0x606f>
633a   597fb4:	e8 00 00 00 00       	call   597fb9 <shrink_lruvec+0x633f>	597fb5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
633f   597fb9:	b8 02 00 00 00       	mov    $0x2,%eax
6344   597fbe:	e9 a1 e3 ff ff       	jmp    596364 <shrink_lruvec+0x46ea>
6349   597fc3:	e8 00 00 00 00       	call   597fc8 <shrink_lruvec+0x634e>	597fc4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
634e   597fc8:	e9 85 e3 ff ff       	jmp    596352 <shrink_lruvec+0x46d8>
6353   597fcd:	e8 00 00 00 00       	call   597fd2 <shrink_lruvec+0x6358>	597fce: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
6358   597fd2:	e9 7b e3 ff ff       	jmp    596352 <shrink_lruvec+0x46d8>
635d   597fd7:	e8 00 00 00 00       	call   597fdc <shrink_lruvec+0x6362>	597fd8: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
6362   597fdc:	8b 3c 24             	mov    (%rsp),%edi
6365   597fdf:	e8 00 00 00 00       	call   597fe4 <shrink_lruvec+0x636a>	597fe0: R_X86_64_PLT32	next_demotion_node-0x4
636a   597fe4:	41 89 c4             	mov    %eax,%r12d
636d   597fe7:	bf ff ff ff ff       	mov    $0xffffffff,%edi
6372   597fec:	89 c6                	mov    %eax,%esi
6374   597fee:	e8 00 00 00 00       	call   597ff3 <shrink_lruvec+0x6379>	597fef: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
6379   597ff3:	41 83 fc ff          	cmp    $0xffffffff,%r12d
637d   597ff7:	74 14                	je     59800d <shrink_lruvec+0x6393>
637f   597ff9:	e8 00 00 00 00       	call   597ffe <shrink_lruvec+0x6384>	597ffa: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
6384   597ffe:	e9 be e8 ff ff       	jmp    5968c1 <shrink_lruvec+0x4c47>
6389   598003:	e8 00 00 00 00       	call   598008 <shrink_lruvec+0x638e>	598004: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
638e   598008:	e9 45 e3 ff ff       	jmp    596352 <shrink_lruvec+0x46d8>
6393   59800d:	e8 00 00 00 00       	call   598012 <shrink_lruvec+0x6398>	59800e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
6398   598012:	e9 3b e3 ff ff       	jmp    596352 <shrink_lruvec+0x46d8>
639d   598017:	48 8b 8c 24 80 00 00 00 	mov    0x80(%rsp),%rcx
63a5   59801f:	80 e1 07             	and    $0x7,%cl
63a8   598022:	fe c1                	inc    %cl
63aa   598024:	38 c1                	cmp    %al,%cl
63ac   598026:	0f 8c ee e2 ff ff    	jl     59631a <shrink_lruvec+0x46a0>
63b2   59802c:	48 8b bc 24 80 00 00 00 	mov    0x80(%rsp),%rdi
63ba   598034:	e8 00 00 00 00       	call   598039 <shrink_lruvec+0x63bf>	598035: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
63bf   598039:	e9 dc e2 ff ff       	jmp    59631a <shrink_lruvec+0x46a0>
63c4   59803e:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
63c9   598043:	80 e1 07             	and    $0x7,%cl
63cc   598046:	80 c1 03             	add    $0x3,%cl
63cf   598049:	38 c1                	cmp    %al,%cl
63d1   59804b:	0f 8c 7e e7 ff ff    	jl     5967cf <shrink_lruvec+0x4b55>
63d7   598051:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
63dc   598056:	e8 00 00 00 00       	call   59805b <shrink_lruvec+0x63e1>	598057: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
63e1   59805b:	e9 6f e7 ff ff       	jmp    5967cf <shrink_lruvec+0x4b55>
63e6   598060:	48 8b 8c 24 c8 00 00 00 	mov    0xc8(%rsp),%rcx
63ee   598068:	80 e1 07             	and    $0x7,%cl
63f1   59806b:	38 c1                	cmp    %al,%cl
63f3   59806d:	0f 8c a6 e7 ff ff    	jl     596819 <shrink_lruvec+0x4b9f>
63f9   598073:	48 8b bc 24 c8 00 00 00 	mov    0xc8(%rsp),%rdi
6401   59807b:	e8 00 00 00 00       	call   598080 <shrink_lruvec+0x6406>	59807c: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6406   598080:	e9 94 e7 ff ff       	jmp    596819 <shrink_lruvec+0x4b9f>
640b   598085:	44 89 e1             	mov    %r12d,%ecx
640e   598088:	80 e1 07             	and    $0x7,%cl
6411   59808b:	80 c1 03             	add    $0x3,%cl
6414   59808e:	38 c1                	cmp    %al,%cl
6416   598090:	0f 8c cc e7 ff ff    	jl     596862 <shrink_lruvec+0x4be8>
641c   598096:	4c 89 e7             	mov    %r12,%rdi
641f   598099:	e8 00 00 00 00       	call   59809e <shrink_lruvec+0x6424>	59809a: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
6424   59809e:	e9 bf e7 ff ff       	jmp    596862 <shrink_lruvec+0x4be8>
6429   5980a3:	44 89 e1             	mov    %r12d,%ecx
642c   5980a6:	80 e1 07             	and    $0x7,%cl
642f   5980a9:	38 c1                	cmp    %al,%cl
6431   5980ab:	0f 8c 35 e8 ff ff    	jl     5968e6 <shrink_lruvec+0x4c6c>
6437   5980b1:	4c 89 e7             	mov    %r12,%rdi
643a   5980b4:	e8 00 00 00 00       	call   5980b9 <shrink_lruvec+0x643f>	5980b5: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
643f   5980b9:	e9 28 e8 ff ff       	jmp    5968e6 <shrink_lruvec+0x4c6c>
6444   5980be:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	5980c1: R_X86_64_32S	numa_demotion_enabled
644b   5980c5:	80 e1 07             	and    $0x7,%cl
644e   5980c8:	38 c1                	cmp    %al,%cl
6450   5980ca:	0f 8c d1 fc ff ff    	jl     597da1 <shrink_lruvec+0x6127>
6456   5980d0:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	5980d3: R_X86_64_32S	numa_demotion_enabled
645d   5980d7:	e8 00 00 00 00       	call   5980dc <shrink_lruvec+0x6462>	5980d8: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6462   5980dc:	e9 c0 fc ff ff       	jmp    597da1 <shrink_lruvec+0x6127>
6467   5980e1:	48 8b 8c 24 80 00 00 00 	mov    0x80(%rsp),%rcx
646f   5980e9:	80 e1 07             	and    $0x7,%cl
6472   5980ec:	fe c1                	inc    %cl
6474   5980ee:	38 c1                	cmp    %al,%cl
6476   5980f0:	0f 8c ef fc ff ff    	jl     597de5 <shrink_lruvec+0x616b>
647c   5980f6:	48 8b bc 24 80 00 00 00 	mov    0x80(%rsp),%rdi
6484   5980fe:	e8 00 00 00 00       	call   598103 <shrink_lruvec+0x6489>	5980ff: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
6489   598103:	e9 dd fc ff ff       	jmp    597de5 <shrink_lruvec+0x616b>
648e   598108:	48 8b 8c 24 80 00 00 00 	mov    0x80(%rsp),%rcx
6496   598110:	80 e1 07             	and    $0x7,%cl
6499   598113:	fe c1                	inc    %cl
649b   598115:	38 c1                	cmp    %al,%cl
649d   598117:	0f 8c 18 fd ff ff    	jl     597e35 <shrink_lruvec+0x61bb>
64a3   59811d:	48 8b bc 24 80 00 00 00 	mov    0x80(%rsp),%rdi
64ab   598125:	e8 00 00 00 00       	call   59812a <shrink_lruvec+0x64b0>	598126: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
64b0   59812a:	e9 06 fd ff ff       	jmp    597e35 <shrink_lruvec+0x61bb>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

--aFyeVoEmScvBAg7o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=config

#
# Automatically generated file; DO NOT EDIT.
# Linux/x86_64 6.0.0-rc3 Kernel Configuration
#
CONFIG_CC_VERSION_TEXT="clang version 14.0.6 (git://gitmirror/llvm_project f28c006a5895fc0e329fe15fead81e37457cb1d1)"
CONFIG_GCC_VERSION=0
CONFIG_CC_IS_CLANG=y
CONFIG_CLANG_VERSION=140006
CONFIG_AS_IS_LLVM=y
CONFIG_AS_VERSION=140006
CONFIG_LD_VERSION=0
CONFIG_LD_IS_LLD=y
CONFIG_LLD_VERSION=140006
CONFIG_CC_CAN_LINK=y
CONFIG_CC_CAN_LINK_STATIC=y
CONFIG_CC_HAS_ASM_GOTO_OUTPUT=y
CONFIG_TOOLS_SUPPORT_RELR=y
CONFIG_CC_HAS_ASM_INLINE=y
CONFIG_CC_HAS_NO_PROFILE_FN_ATTR=y
CONFIG_PAHOLE_VERSION=123
CONFIG_CONSTRUCTORS=y
CONFIG_IRQ_WORK=y
CONFIG_BUILDTIME_TABLE_SORT=y
CONFIG_THREAD_INFO_IN_TASK=y

#
# General setup
#
CONFIG_INIT_ENV_ARG_LIMIT=32
# CONFIG_COMPILE_TEST is not set
# CONFIG_WERROR is not set
CONFIG_UAPI_HEADER_TEST=y
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
CONFIG_KERNEL_GZIP=y
# CONFIG_KERNEL_BZIP2 is not set
# CONFIG_KERNEL_LZMA is not set
# CONFIG_KERNEL_XZ is not set
# CONFIG_KERNEL_LZO is not set
# CONFIG_KERNEL_LZ4 is not set
# CONFIG_KERNEL_ZSTD is not set
CONFIG_DEFAULT_INIT=""
CONFIG_DEFAULT_HOSTNAME="(none)"
CONFIG_SYSVIPC=y
CONFIG_SYSVIPC_SYSCTL=y
CONFIG_POSIX_MQUEUE=y
CONFIG_POSIX_MQUEUE_SYSCTL=y
# CONFIG_WATCH_QUEUE is not set
CONFIG_CROSS_MEMORY_ATTACH=y
CONFIG_USELIB=y
CONFIG_AUDIT=y
CONFIG_HAVE_ARCH_AUDITSYSCALL=y
CONFIG_AUDITSYSCALL=y

#
# IRQ subsystem
#
CONFIG_GENERIC_IRQ_PROBE=y
CONFIG_GENERIC_IRQ_SHOW=y
CONFIG_GENERIC_IRQ_EFFECTIVE_AFF_MASK=y
CONFIG_GENERIC_PENDING_IRQ=y
CONFIG_GENERIC_IRQ_MIGRATION=y
CONFIG_GENERIC_IRQ_INJECTION=y
CONFIG_HARDIRQS_SW_RESEND=y
CONFIG_IRQ_DOMAIN=y
CONFIG_IRQ_SIM=y
CONFIG_IRQ_DOMAIN_HIERARCHY=y
CONFIG_IRQ_MSI_IOMMU=y
CONFIG_GENERIC_IRQ_MATRIX_ALLOCATOR=y
CONFIG_GENERIC_IRQ_RESERVATION_MODE=y
CONFIG_IRQ_FORCED_THREADING=y
CONFIG_SPARSE_IRQ=y
CONFIG_GENERIC_IRQ_DEBUGFS=y
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
CONFIG_CONTEXT_TRACKING=y
CONFIG_CONTEXT_TRACKING_IDLE=y

#
# Timers subsystem
#
CONFIG_TICK_ONESHOT=y
CONFIG_NO_HZ_COMMON=y
# CONFIG_HZ_PERIODIC is not set
CONFIG_NO_HZ_IDLE=y
# CONFIG_NO_HZ_FULL is not set
# CONFIG_NO_HZ is not set
# CONFIG_HIGH_RES_TIMERS is not set
CONFIG_CLOCKSOURCE_WATCHDOG_MAX_SKEW_US=100
# end of Timers subsystem

CONFIG_BPF=y
CONFIG_HAVE_EBPF_JIT=y
CONFIG_ARCH_WANT_DEFAULT_BPF_JIT=y

#
# BPF subsystem
#
# CONFIG_BPF_SYSCALL is not set
# CONFIG_BPF_JIT is not set
# end of BPF subsystem

CONFIG_PREEMPT_VOLUNTARY_BUILD=y
# CONFIG_PREEMPT_NONE is not set
CONFIG_PREEMPT_VOLUNTARY=y
# CONFIG_PREEMPT is not set
CONFIG_PREEMPT_COUNT=y
# CONFIG_PREEMPT_DYNAMIC is not set
# CONFIG_SCHED_CORE is not set

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

CONFIG_CPU_ISOLATION=y

#
# RCU Subsystem
#
CONFIG_TREE_RCU=y
CONFIG_RCU_EXPERT=y
CONFIG_SRCU=y
CONFIG_TREE_SRCU=y
CONFIG_TASKS_RCU_GENERIC=y
CONFIG_FORCE_TASKS_RCU=y
CONFIG_TASKS_RCU=y
CONFIG_FORCE_TASKS_RUDE_RCU=y
CONFIG_TASKS_RUDE_RCU=y
CONFIG_FORCE_TASKS_TRACE_RCU=y
CONFIG_TASKS_TRACE_RCU=y
CONFIG_RCU_STALL_COMMON=y
CONFIG_RCU_NEED_SEGCBLIST=y
CONFIG_RCU_FANOUT=64
CONFIG_RCU_FANOUT_LEAF=16
CONFIG_RCU_NOCB_CPU=y
# CONFIG_RCU_NOCB_CPU_DEFAULT_ALL is not set
# CONFIG_TASKS_TRACE_RCU_READ_MB is not set
# end of RCU Subsystem

CONFIG_IKCONFIG=y
CONFIG_IKCONFIG_PROC=y
# CONFIG_IKHEADERS is not set
CONFIG_LOG_BUF_SHIFT=20
CONFIG_LOG_CPU_MAX_BUF_SHIFT=12
CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=13
CONFIG_PRINTK_INDEX=y
CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=y

#
# Scheduler features
#
CONFIG_UCLAMP_TASK=y
CONFIG_UCLAMP_BUCKETS_COUNT=5
# end of Scheduler features

CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=y
CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=y
CONFIG_CC_HAS_INT128=y
CONFIG_CC_IMPLICIT_FALLTHROUGH="-Wimplicit-fallthrough"
CONFIG_GCC12_NO_ARRAY_BOUNDS=y
CONFIG_ARCH_SUPPORTS_INT128=y
CONFIG_NUMA_BALANCING=y
CONFIG_NUMA_BALANCING_DEFAULT_ENABLED=y
CONFIG_CGROUPS=y
CONFIG_CGROUP_FAVOR_DYNMODS=y
# CONFIG_MEMCG is not set
CONFIG_BLK_CGROUP=y
# CONFIG_CGROUP_SCHED is not set
CONFIG_CGROUP_PIDS=y
CONFIG_CGROUP_RDMA=y
# CONFIG_CGROUP_FREEZER is not set
CONFIG_CPUSETS=y
# CONFIG_PROC_PID_CPUSET is not set
# CONFIG_CGROUP_DEVICE is not set
# CONFIG_CGROUP_CPUACCT is not set
CONFIG_CGROUP_PERF=y
CONFIG_CGROUP_MISC=y
# CONFIG_CGROUP_DEBUG is not set
CONFIG_SOCK_CGROUP_DATA=y
CONFIG_NAMESPACES=y
CONFIG_UTS_NS=y
CONFIG_TIME_NS=y
# CONFIG_IPC_NS is not set
# CONFIG_USER_NS is not set
# CONFIG_PID_NS is not set
# CONFIG_NET_NS is not set
# CONFIG_CHECKPOINT_RESTORE is not set
# CONFIG_SCHED_AUTOGROUP is not set
# CONFIG_SYSFS_DEPRECATED is not set
CONFIG_RELAY=y
CONFIG_BLK_DEV_INITRD=y
CONFIG_INITRAMFS_SOURCE=""
CONFIG_RD_GZIP=y
CONFIG_RD_BZIP2=y
CONFIG_RD_LZMA=y
CONFIG_RD_XZ=y
CONFIG_RD_LZO=y
CONFIG_RD_LZ4=y
CONFIG_RD_ZSTD=y
CONFIG_BOOT_CONFIG=y
CONFIG_BOOT_CONFIG_EMBED=y
CONFIG_BOOT_CONFIG_EMBED_FILE=""
CONFIG_INITRAMFS_PRESERVE_MTIME=y
# CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE is not set
CONFIG_CC_OPTIMIZE_FOR_SIZE=y
CONFIG_LD_ORPHAN_WARN=y
CONFIG_SYSCTL=y
CONFIG_SYSCTL_EXCEPTION_TRACE=y
CONFIG_HAVE_PCSPKR_PLATFORM=y
# CONFIG_EXPERT is not set
CONFIG_MULTIUSER=y
CONFIG_SGETMASK_SYSCALL=y
CONFIG_SYSFS_SYSCALL=y
CONFIG_FHANDLE=y
CONFIG_POSIX_TIMERS=y
CONFIG_PRINTK=y
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
CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=y
CONFIG_RSEQ=y
# CONFIG_EMBEDDED is not set
CONFIG_HAVE_PERF_EVENTS=y

#
# Kernel Performance Events And Counters
#
CONFIG_PERF_EVENTS=y
# CONFIG_DEBUG_PERF_USE_VMALLOC is not set
# end of Kernel Performance Events And Counters

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
CONFIG_ARCH_HIBERNATION_POSSIBLE=y
CONFIG_ARCH_NR_GPIO=1024
CONFIG_ARCH_SUSPEND_POSSIBLE=y
CONFIG_AUDIT_ARCH=y
CONFIG_KASAN_SHADOW_OFFSET=0xdffffc0000000000
CONFIG_X86_64_SMP=y
CONFIG_ARCH_SUPPORTS_UPROBES=y
CONFIG_FIX_EARLYCON_MEM=y
CONFIG_PGTABLE_LEVELS=5
CONFIG_CC_HAS_SANE_STACKPROTECTOR=y

#
# Processor type and features
#
CONFIG_SMP=y
CONFIG_X86_FEATURE_NAMES=y
# CONFIG_X86_X2APIC is not set
CONFIG_X86_MPPARSE=y
CONFIG_GOLDFISH=y
# CONFIG_X86_CPU_RESCTRL is not set
CONFIG_X86_EXTENDED_PLATFORM=y
# CONFIG_X86_VSMP is not set
# CONFIG_X86_GOLDFISH is not set
# CONFIG_X86_INTEL_LPSS is not set
# CONFIG_X86_AMD_PLATFORM_DEVICE is not set
# CONFIG_IOSF_MBI is not set
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
# CONFIG_MPSC is not set
# CONFIG_MCORE2 is not set
# CONFIG_MATOM is not set
CONFIG_GENERIC_CPU=y
CONFIG_X86_INTERNODE_CACHE_SHIFT=6
CONFIG_X86_L1_CACHE_SHIFT=6
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
CONFIG_HPET_EMULATE_RTC=y
CONFIG_DMI=y
# CONFIG_GART_IOMMU is not set
CONFIG_BOOT_VESA_SUPPORT=y
# CONFIG_MAXSMP is not set
CONFIG_NR_CPUS_RANGE_BEGIN=2
CONFIG_NR_CPUS_RANGE_END=512
CONFIG_NR_CPUS_DEFAULT=64
CONFIG_NR_CPUS=64
# CONFIG_SCHED_CLUSTER is not set
CONFIG_SCHED_SMT=y
CONFIG_SCHED_MC=y
CONFIG_SCHED_MC_PRIO=y
CONFIG_X86_LOCAL_APIC=y
CONFIG_X86_IO_APIC=y
# CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS is not set
# CONFIG_X86_MCE is not set

#
# Performance monitoring
#
CONFIG_PERF_EVENTS_INTEL_UNCORE=y
CONFIG_PERF_EVENTS_INTEL_RAPL=y
CONFIG_PERF_EVENTS_INTEL_CSTATE=y
# CONFIG_PERF_EVENTS_AMD_POWER is not set
# CONFIG_PERF_EVENTS_AMD_UNCORE is not set
# CONFIG_PERF_EVENTS_AMD_BRS is not set
# end of Performance monitoring

CONFIG_X86_16BIT=y
CONFIG_X86_ESPFIX64=y
CONFIG_X86_VSYSCALL_EMULATION=y
CONFIG_X86_IOPL_IOPERM=y
# CONFIG_MICROCODE is not set
CONFIG_X86_MSR=y
CONFIG_X86_CPUID=m
CONFIG_X86_5LEVEL=y
CONFIG_X86_DIRECT_GBPAGES=y
# CONFIG_X86_CPA_STATISTICS is not set
# CONFIG_AMD_MEM_ENCRYPT is not set
CONFIG_NUMA=y
# CONFIG_AMD_NUMA is not set
CONFIG_X86_64_ACPI_NUMA=y
CONFIG_NUMA_EMU=y
CONFIG_NODES_SHIFT=6
CONFIG_ARCH_SPARSEMEM_ENABLE=y
CONFIG_ARCH_SPARSEMEM_DEFAULT=y
CONFIG_ARCH_MEMORY_PROBE=y
CONFIG_ILLEGAL_POINTER_VALUE=0xdead000000000000
# CONFIG_X86_PMEM_LEGACY is not set
# CONFIG_X86_CHECK_BIOS_CORRUPTION is not set
CONFIG_MTRR=y
# CONFIG_MTRR_SANITIZER is not set
CONFIG_X86_PAT=y
CONFIG_ARCH_USES_PG_UNCACHED=y
CONFIG_X86_UMIP=y
CONFIG_CC_HAS_IBT=y
# CONFIG_X86_KERNEL_IBT is not set
# CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS is not set
# CONFIG_X86_INTEL_TSX_MODE_OFF is not set
# CONFIG_X86_INTEL_TSX_MODE_ON is not set
CONFIG_X86_INTEL_TSX_MODE_AUTO=y
# CONFIG_X86_SGX is not set
CONFIG_EFI=y
CONFIG_EFI_STUB=y
CONFIG_EFI_MIXED=y
# CONFIG_HZ_100 is not set
# CONFIG_HZ_250 is not set
# CONFIG_HZ_300 is not set
CONFIG_HZ_1000=y
CONFIG_HZ=1000
CONFIG_KEXEC=y
CONFIG_KEXEC_FILE=y
CONFIG_ARCH_HAS_KEXEC_PURGATORY=y
CONFIG_KEXEC_SIG=y
# CONFIG_KEXEC_SIG_FORCE is not set
CONFIG_CRASH_DUMP=y
CONFIG_PHYSICAL_START=0x1000000
CONFIG_RELOCATABLE=y
# CONFIG_RANDOMIZE_BASE is not set
CONFIG_PHYSICAL_ALIGN=0x200000
CONFIG_DYNAMIC_MEMORY_LAYOUT=y
CONFIG_HOTPLUG_CPU=y
# CONFIG_BOOTPARAM_HOTPLUG_CPU0 is not set
# CONFIG_DEBUG_HOTPLUG_CPU0 is not set
CONFIG_LEGACY_VSYSCALL_XONLY=y
# CONFIG_LEGACY_VSYSCALL_NONE is not set
# CONFIG_CMDLINE_BOOL is not set
CONFIG_MODIFY_LDT_SYSCALL=y
CONFIG_STRICT_SIGALTSTACK_SIZE=y
CONFIG_HAVE_LIVEPATCH=y
# end of Processor type and features

# CONFIG_SPECULATION_MITIGATIONS is not set
CONFIG_ARCH_HAS_ADD_PAGES=y
CONFIG_ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE=y

#
# Power management and ACPI options
#
# CONFIG_SUSPEND is not set
# CONFIG_HIBERNATION is not set
CONFIG_PM=y
CONFIG_PM_DEBUG=y
# CONFIG_PM_ADVANCED_DEBUG is not set
CONFIG_PM_CLK=y
CONFIG_WQ_POWER_EFFICIENT_DEFAULT=y
# CONFIG_ENERGY_MODEL is not set
CONFIG_ARCH_SUPPORTS_ACPI=y
CONFIG_ACPI=y
CONFIG_ACPI_LEGACY_TABLES_LOOKUP=y
CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=y
CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=y
# CONFIG_ACPI_DEBUGGER is not set
CONFIG_ACPI_SPCR_TABLE=y
# CONFIG_ACPI_FPDT is not set
CONFIG_ACPI_LPIT=y
# CONFIG_ACPI_REV_OVERRIDE_POSSIBLE is not set
CONFIG_ACPI_EC_DEBUGFS=y
CONFIG_ACPI_AC=m
CONFIG_ACPI_BATTERY=m
CONFIG_ACPI_BUTTON=y
# CONFIG_ACPI_VIDEO is not set
CONFIG_ACPI_FAN=m
CONFIG_ACPI_DOCK=y
CONFIG_ACPI_CPU_FREQ_PSS=y
CONFIG_ACPI_PROCESSOR_CSTATE=y
CONFIG_ACPI_PROCESSOR_IDLE=y
CONFIG_ACPI_CPPC_LIB=y
CONFIG_ACPI_PROCESSOR=y
CONFIG_ACPI_IPMI=m
CONFIG_ACPI_HOTPLUG_CPU=y
# CONFIG_ACPI_PROCESSOR_AGGREGATOR is not set
CONFIG_ACPI_THERMAL=m
CONFIG_ACPI_CUSTOM_DSDT_FILE=""
CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=y
CONFIG_ACPI_TABLE_UPGRADE=y
CONFIG_ACPI_DEBUG=y
# CONFIG_ACPI_PCI_SLOT is not set
CONFIG_ACPI_CONTAINER=y
CONFIG_ACPI_HOTPLUG_MEMORY=y
CONFIG_ACPI_HOTPLUG_IOAPIC=y
CONFIG_ACPI_SBS=y
CONFIG_ACPI_HED=m
# CONFIG_ACPI_CUSTOM_METHOD is not set
# CONFIG_ACPI_BGRT is not set
# CONFIG_ACPI_NFIT is not set
CONFIG_ACPI_NUMA=y
# CONFIG_ACPI_HMAT is not set
CONFIG_HAVE_ACPI_APEI=y
CONFIG_HAVE_ACPI_APEI_NMI=y
# CONFIG_ACPI_APEI is not set
# CONFIG_ACPI_DPTF is not set
CONFIG_ACPI_WATCHDOG=y
CONFIG_ACPI_CONFIGFS=y
CONFIG_ACPI_PFRUT=y
CONFIG_ACPI_PCC=y
CONFIG_PMIC_OPREGION=y
CONFIG_ACPI_VIOT=y
CONFIG_ACPI_PRMT=y
CONFIG_X86_PM_TIMER=y

#
# CPU Frequency scaling
#
CONFIG_CPU_FREQ=y
CONFIG_CPU_FREQ_GOV_ATTR_SET=y
CONFIG_CPU_FREQ_GOV_COMMON=y
CONFIG_CPU_FREQ_STAT=y
# CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL=y
CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
CONFIG_CPU_FREQ_GOV_POWERSAVE=y
CONFIG_CPU_FREQ_GOV_USERSPACE=m
# CONFIG_CPU_FREQ_GOV_ONDEMAND is not set
CONFIG_CPU_FREQ_GOV_CONSERVATIVE=m
CONFIG_CPU_FREQ_GOV_SCHEDUTIL=y

#
# CPU frequency scaling drivers
#
CONFIG_X86_INTEL_PSTATE=y
# CONFIG_X86_PCC_CPUFREQ is not set
# CONFIG_X86_AMD_PSTATE is not set
CONFIG_X86_ACPI_CPUFREQ=y
# CONFIG_X86_ACPI_CPUFREQ_CPB is not set
# CONFIG_X86_POWERNOW_K8 is not set
CONFIG_X86_SPEEDSTEP_CENTRINO=m
# CONFIG_X86_P4_CLOCKMOD is not set

#
# shared options
#
# end of CPU Frequency scaling

#
# CPU Idle
#
CONFIG_CPU_IDLE=y
CONFIG_CPU_IDLE_GOV_LADDER=y
CONFIG_CPU_IDLE_GOV_MENU=y
# CONFIG_CPU_IDLE_GOV_TEO is not set
# CONFIG_CPU_IDLE_GOV_HALTPOLL is not set
CONFIG_HALTPOLL_CPUIDLE=y
# end of CPU Idle

CONFIG_INTEL_IDLE=y
# end of Power management and ACPI options

#
# Bus options (PCI etc.)
#
CONFIG_PCI_DIRECT=y
CONFIG_PCI_MMCONFIG=y
CONFIG_MMCONF_FAM10H=y
CONFIG_ISA_DMA_API=y
CONFIG_AMD_NB=y
# end of Bus options (PCI etc.)

#
# Binary Emulations
#
# CONFIG_IA32_EMULATION is not set
# end of Binary Emulations

CONFIG_HAVE_KVM=y
CONFIG_VIRTUALIZATION=y
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
CONFIG_KPROBES=y
CONFIG_JUMP_LABEL=y
# CONFIG_STATIC_KEYS_SELFTEST is not set
# CONFIG_STATIC_CALL_SELFTEST is not set
CONFIG_OPTPROBES=y
CONFIG_UPROBES=y
CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=y
CONFIG_ARCH_USE_BUILTIN_BSWAP=y
CONFIG_KRETPROBES=y
CONFIG_KRETPROBE_ON_RETHOOK=y
CONFIG_HAVE_IOREMAP_PROT=y
CONFIG_HAVE_KPROBES=y
CONFIG_HAVE_KRETPROBES=y
CONFIG_HAVE_OPTPROBES=y
CONFIG_HAVE_KPROBES_ON_FTRACE=y
CONFIG_ARCH_CORRECT_STACKTRACE_ON_KRETPROBE=y
CONFIG_HAVE_FUNCTION_ERROR_INJECTION=y
CONFIG_HAVE_NMI=y
CONFIG_TRACE_IRQFLAGS_SUPPORT=y
CONFIG_TRACE_IRQFLAGS_NMI_SUPPORT=y
CONFIG_HAVE_ARCH_TRACEHOOK=y
CONFIG_HAVE_DMA_CONTIGUOUS=y
CONFIG_GENERIC_SMP_IDLE_THREAD=y
CONFIG_ARCH_HAS_FORTIFY_SOURCE=y
CONFIG_ARCH_HAS_SET_MEMORY=y
CONFIG_ARCH_HAS_SET_DIRECT_MAP=y
CONFIG_HAVE_ARCH_THREAD_STRUCT_WHITELIST=y
CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=y
CONFIG_ARCH_WANTS_NO_INSTR=y
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
CONFIG_MMU_GATHER_MERGE_VMAS=y
CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=y
CONFIG_HAVE_ALIGNED_STRUCT_PAGE=y
CONFIG_HAVE_CMPXCHG_LOCAL=y
CONFIG_HAVE_CMPXCHG_DOUBLE=y
CONFIG_HAVE_ARCH_SECCOMP=y
CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
CONFIG_SECCOMP=y
CONFIG_SECCOMP_FILTER=y
# CONFIG_SECCOMP_CACHE_DEBUG is not set
CONFIG_HAVE_ARCH_STACKLEAK=y
CONFIG_HAVE_STACKPROTECTOR=y
# CONFIG_STACKPROTECTOR is not set
CONFIG_ARCH_SUPPORTS_LTO_CLANG=y
CONFIG_ARCH_SUPPORTS_LTO_CLANG_THIN=y
CONFIG_LTO_NONE=y
CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=y
CONFIG_HAVE_CONTEXT_TRACKING_USER=y
CONFIG_HAVE_CONTEXT_TRACKING_USER_OFFSTACK=y
CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=y
CONFIG_HAVE_IRQ_TIME_ACCOUNTING=y
CONFIG_HAVE_MOVE_PUD=y
CONFIG_HAVE_MOVE_PMD=y
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=y
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD=y
CONFIG_HAVE_ARCH_HUGE_VMAP=y
CONFIG_HAVE_ARCH_HUGE_VMALLOC=y
CONFIG_ARCH_WANT_HUGE_PMD_SHARE=y
CONFIG_HAVE_ARCH_SOFT_DIRTY=y
CONFIG_HAVE_MOD_ARCH_SPECIFIC=y
CONFIG_MODULES_USE_ELF_RELA=y
CONFIG_HAVE_IRQ_EXIT_ON_IRQ_STACK=y
CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK=y
CONFIG_ARCH_HAS_ELF_RANDOMIZE=y
CONFIG_HAVE_ARCH_MMAP_RND_BITS=y
CONFIG_HAVE_EXIT_THREAD=y
CONFIG_ARCH_MMAP_RND_BITS=28
CONFIG_PAGE_SIZE_LESS_THAN_64KB=y
CONFIG_PAGE_SIZE_LESS_THAN_256KB=y
CONFIG_HAVE_OBJTOOL=y
CONFIG_HAVE_JUMP_LABEL_HACK=y
CONFIG_HAVE_NOINSTR_HACK=y
CONFIG_HAVE_NOINSTR_VALIDATION=y
CONFIG_HAVE_UACCESS_VALIDATION=y
CONFIG_HAVE_STACK_VALIDATION=y
CONFIG_HAVE_RELIABLE_STACKTRACE=y
CONFIG_ISA_BUS_API=y
CONFIG_COMPAT_32BIT_TIME=y
CONFIG_HAVE_ARCH_VMAP_STACK=y
# CONFIG_VMAP_STACK is not set
CONFIG_HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET=y
CONFIG_RANDOMIZE_KSTACK_OFFSET=y
# CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT is not set
CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=y
CONFIG_STRICT_KERNEL_RWX=y
CONFIG_ARCH_HAS_STRICT_MODULE_RWX=y
CONFIG_STRICT_MODULE_RWX=y
CONFIG_HAVE_ARCH_PREL32_RELOCATIONS=y
CONFIG_ARCH_USE_MEMREMAP_PROT=y
CONFIG_LOCK_EVENT_COUNTS=y
CONFIG_ARCH_HAS_MEM_ENCRYPT=y
CONFIG_HAVE_STATIC_CALL=y
CONFIG_HAVE_STATIC_CALL_INLINE=y
CONFIG_HAVE_PREEMPT_DYNAMIC=y
CONFIG_HAVE_PREEMPT_DYNAMIC_CALL=y
CONFIG_ARCH_WANT_LD_ORPHAN_WARN=y
CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=y
CONFIG_ARCH_SUPPORTS_PAGE_TABLE_CHECK=y
CONFIG_ARCH_HAS_ELFCORE_COMPAT=y
CONFIG_ARCH_HAS_PARANOID_L1D_FLUSH=y
CONFIG_DYNAMIC_SIGFRAME=y
CONFIG_ARCH_HAS_NONLEAF_PMD_YOUNG=y

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
CONFIG_MODULE_UNLOAD_TAINT_TRACKING=y
# CONFIG_MODVERSIONS is not set
# CONFIG_MODULE_SRCVERSION_ALL is not set
# CONFIG_MODULE_SIG is not set
CONFIG_MODULE_COMPRESS_NONE=y
# CONFIG_MODULE_COMPRESS_GZIP is not set
# CONFIG_MODULE_COMPRESS_XZ is not set
# CONFIG_MODULE_COMPRESS_ZSTD is not set
# CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS is not set
CONFIG_MODPROBE_PATH="/sbin/modprobe"
CONFIG_MODULES_TREE_LOOKUP=y
CONFIG_BLOCK=y
# CONFIG_BLOCK_LEGACY_AUTOLOAD is not set
CONFIG_BLK_RQ_ALLOC_TIME=y
CONFIG_BLK_CGROUP_RWSTAT=y
CONFIG_BLK_DEV_BSG_COMMON=y
CONFIG_BLK_DEV_BSGLIB=y
CONFIG_BLK_DEV_INTEGRITY=y
CONFIG_BLK_DEV_INTEGRITY_T10=y
CONFIG_BLK_DEV_ZONED=y
CONFIG_BLK_DEV_THROTTLING=y
# CONFIG_BLK_DEV_THROTTLING_LOW is not set
CONFIG_BLK_WBT=y
# CONFIG_BLK_WBT_MQ is not set
# CONFIG_BLK_CGROUP_IOLATENCY is not set
CONFIG_BLK_CGROUP_FC_APPID=y
CONFIG_BLK_CGROUP_IOCOST=y
# CONFIG_BLK_CGROUP_IOPRIO is not set
# CONFIG_BLK_DEBUG_FS is not set
CONFIG_BLK_SED_OPAL=y
# CONFIG_BLK_INLINE_ENCRYPTION is not set

#
# Partition Types
#
CONFIG_PARTITION_ADVANCED=y
# CONFIG_ACORN_PARTITION is not set
CONFIG_AIX_PARTITION=y
# CONFIG_OSF_PARTITION is not set
CONFIG_AMIGA_PARTITION=y
# CONFIG_ATARI_PARTITION is not set
CONFIG_MAC_PARTITION=y
CONFIG_MSDOS_PARTITION=y
CONFIG_BSD_DISKLABEL=y
# CONFIG_MINIX_SUBPARTITION is not set
# CONFIG_SOLARIS_X86_PARTITION is not set
# CONFIG_UNIXWARE_DISKLABEL is not set
# CONFIG_LDM_PARTITION is not set
CONFIG_SGI_PARTITION=y
CONFIG_ULTRIX_PARTITION=y
# CONFIG_SUN_PARTITION is not set
CONFIG_KARMA_PARTITION=y
# CONFIG_EFI_PARTITION is not set
# CONFIG_SYSV68_PARTITION is not set
# CONFIG_CMDLINE_PARTITION is not set
# end of Partition Types

CONFIG_BLK_MQ_PCI=y
CONFIG_BLK_MQ_VIRTIO=y
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

#
# Executable file formats
#
CONFIG_BINFMT_ELF=y
CONFIG_ELFCORE=y
CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS=y
CONFIG_BINFMT_SCRIPT=y
CONFIG_BINFMT_MISC=m
CONFIG_COREDUMP=y
# end of Executable file formats

#
# Memory Management options
#
CONFIG_SWAP=y
# CONFIG_ZSWAP is not set

#
# SLAB allocator options
#
# CONFIG_SLAB is not set
CONFIG_SLUB=y
CONFIG_SLAB_MERGE_DEFAULT=y
# CONFIG_SLAB_FREELIST_RANDOM is not set
CONFIG_SLAB_FREELIST_HARDENED=y
# CONFIG_SLUB_STATS is not set
CONFIG_SLUB_CPU_PARTIAL=y
# end of SLAB allocator options

# CONFIG_SHUFFLE_PAGE_ALLOCATOR is not set
# CONFIG_COMPAT_BRK is not set
CONFIG_SPARSEMEM=y
CONFIG_SPARSEMEM_EXTREME=y
CONFIG_SPARSEMEM_VMEMMAP_ENABLE=y
CONFIG_SPARSEMEM_VMEMMAP=y
CONFIG_HAVE_FAST_GUP=y
CONFIG_NUMA_KEEP_MEMINFO=y
CONFIG_MEMORY_ISOLATION=y
CONFIG_EXCLUSIVE_SYSTEM_RAM=y
CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=y
CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE=y
CONFIG_MEMORY_HOTPLUG=y
CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE=y
# CONFIG_MEMORY_HOTREMOVE is not set
CONFIG_MHP_MEMMAP_ON_MEMORY=y
CONFIG_SPLIT_PTLOCK_CPUS=4
CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=y
CONFIG_COMPACTION=y
CONFIG_PAGE_REPORTING=y
CONFIG_MIGRATION=y
CONFIG_CONTIG_ALLOC=y
CONFIG_PHYS_ADDR_T_64BIT=y
# CONFIG_KSM is not set
CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
CONFIG_ARCH_WANT_GENERAL_HUGETLB=y
CONFIG_ARCH_WANTS_THP_SWAP=y
# CONFIG_TRANSPARENT_HUGEPAGE is not set
CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=y
CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=y
CONFIG_USE_PERCPU_NUMA_NODE_ID=y
CONFIG_HAVE_SETUP_PER_CPU_AREA=y
CONFIG_CMA=y
# CONFIG_CMA_DEBUG is not set
CONFIG_CMA_DEBUGFS=y
CONFIG_CMA_SYSFS=y
CONFIG_CMA_AREAS=19
CONFIG_GENERIC_EARLY_IOREMAP=y
CONFIG_DEFERRED_STRUCT_PAGE_INIT=y
# CONFIG_IDLE_PAGE_TRACKING is not set
CONFIG_ARCH_HAS_CACHE_LINE_SIZE=y
CONFIG_ARCH_HAS_CURRENT_STACK_POINTER=y
CONFIG_ARCH_HAS_PTE_DEVMAP=y
CONFIG_ZONE_DMA=y
CONFIG_ZONE_DMA32=y
CONFIG_VM_EVENT_COUNTERS=y
# CONFIG_PERCPU_STATS is not set
# CONFIG_GUP_TEST is not set
CONFIG_ARCH_HAS_PTE_SPECIAL=y
CONFIG_SECRETMEM=y
# CONFIG_ANON_VMA_NAME is not set
CONFIG_USERFAULTFD=y
CONFIG_HAVE_ARCH_USERFAULTFD_WP=y
CONFIG_HAVE_ARCH_USERFAULTFD_MINOR=y
# CONFIG_PTE_MARKER_UFFD_WP is not set
CONFIG_LRU_GEN=y
CONFIG_LRU_GEN_ENABLED=y
# CONFIG_LRU_GEN_STATS is not set

#
# Data Access Monitoring
#
# CONFIG_DAMON is not set
# end of Data Access Monitoring
# end of Memory Management options

CONFIG_NET=y
CONFIG_NET_INGRESS=y
CONFIG_NET_EGRESS=y

#
# Networking options
#
CONFIG_PACKET=y
CONFIG_PACKET_DIAG=m
CONFIG_UNIX=y
CONFIG_UNIX_SCM=y
CONFIG_AF_UNIX_OOB=y
# CONFIG_UNIX_DIAG is not set
# CONFIG_TLS is not set
# CONFIG_XFRM_USER is not set
# CONFIG_NET_KEY is not set
CONFIG_INET=y
# CONFIG_IP_MULTICAST is not set
# CONFIG_IP_ADVANCED_ROUTER is not set
CONFIG_IP_PNP=y
CONFIG_IP_PNP_DHCP=y
# CONFIG_IP_PNP_BOOTP is not set
# CONFIG_IP_PNP_RARP is not set
# CONFIG_NET_IPIP is not set
# CONFIG_NET_IPGRE_DEMUX is not set
CONFIG_NET_IP_TUNNEL=y
# CONFIG_SYN_COOKIES is not set
# CONFIG_NET_IPVTI is not set
# CONFIG_NET_FOU is not set
# CONFIG_NET_FOU_IP_TUNNELS is not set
# CONFIG_INET_AH is not set
# CONFIG_INET_ESP is not set
# CONFIG_INET_IPCOMP is not set
CONFIG_INET_TUNNEL=y
CONFIG_INET_DIAG=y
CONFIG_INET_TCP_DIAG=y
# CONFIG_INET_UDP_DIAG is not set
# CONFIG_INET_RAW_DIAG is not set
# CONFIG_INET_DIAG_DESTROY is not set
# CONFIG_TCP_CONG_ADVANCED is not set
CONFIG_TCP_CONG_CUBIC=y
CONFIG_DEFAULT_TCP_CONG="cubic"
# CONFIG_TCP_MD5SIG is not set
CONFIG_IPV6=y
# CONFIG_IPV6_ROUTER_PREF is not set
# CONFIG_IPV6_OPTIMISTIC_DAD is not set
# CONFIG_INET6_AH is not set
# CONFIG_INET6_ESP is not set
# CONFIG_INET6_IPCOMP is not set
# CONFIG_IPV6_MIP6 is not set
# CONFIG_IPV6_ILA is not set
# CONFIG_IPV6_VTI is not set
CONFIG_IPV6_SIT=y
# CONFIG_IPV6_SIT_6RD is not set
CONFIG_IPV6_NDISC_NODETYPE=y
# CONFIG_IPV6_TUNNEL is not set
# CONFIG_IPV6_MULTIPLE_TABLES is not set
# CONFIG_IPV6_MROUTE is not set
# CONFIG_IPV6_SEG6_LWTUNNEL is not set
# CONFIG_IPV6_SEG6_HMAC is not set
# CONFIG_IPV6_RPL_LWTUNNEL is not set
# CONFIG_IPV6_IOAM6_LWTUNNEL is not set
# CONFIG_NETLABEL is not set
# CONFIG_MPTCP is not set
# CONFIG_NETWORK_SECMARK is not set
CONFIG_NET_PTP_CLASSIFY=y
CONFIG_NETWORK_PHY_TIMESTAMPING=y
CONFIG_NETFILTER=y
# CONFIG_NETFILTER_ADVANCED is not set

#
# Core Netfilter Configuration
#
CONFIG_NETFILTER_INGRESS=y
CONFIG_NETFILTER_EGRESS=y
CONFIG_NETFILTER_NETLINK=m
CONFIG_NETFILTER_NETLINK_LOG=m
CONFIG_NF_CONNTRACK=m
CONFIG_NF_LOG_SYSLOG=m
# CONFIG_NF_CONNTRACK_PROCFS is not set
# CONFIG_NF_CONNTRACK_LABELS is not set
CONFIG_NF_CONNTRACK_FTP=m
CONFIG_NF_CONNTRACK_IRC=m
# CONFIG_NF_CONNTRACK_NETBIOS_NS is not set
CONFIG_NF_CONNTRACK_SIP=m
CONFIG_NF_CT_NETLINK=m
# CONFIG_NETFILTER_NETLINK_GLUE_CT is not set
CONFIG_NF_NAT=m
CONFIG_NF_NAT_FTP=m
CONFIG_NF_NAT_IRC=m
CONFIG_NF_NAT_SIP=m
CONFIG_NF_NAT_MASQUERADE=y
# CONFIG_NF_TABLES is not set
CONFIG_NETFILTER_XTABLES=m

#
# Xtables combined modules
#
CONFIG_NETFILTER_XT_MARK=m

#
# Xtables targets
#
CONFIG_NETFILTER_XT_TARGET_LOG=m
CONFIG_NETFILTER_XT_NAT=m
# CONFIG_NETFILTER_XT_TARGET_NETMAP is not set
CONFIG_NETFILTER_XT_TARGET_NFLOG=m
# CONFIG_NETFILTER_XT_TARGET_REDIRECT is not set
CONFIG_NETFILTER_XT_TARGET_MASQUERADE=m
CONFIG_NETFILTER_XT_TARGET_TCPMSS=m

#
# Xtables matches
#
CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=m
CONFIG_NETFILTER_XT_MATCH_CONNTRACK=m
CONFIG_NETFILTER_XT_MATCH_STATE=m
# end of Core Netfilter Configuration

# CONFIG_IP_SET is not set
# CONFIG_IP_VS is not set

#
# IP: Netfilter Configuration
#
CONFIG_NF_DEFRAG_IPV4=m
# CONFIG_NF_SOCKET_IPV4 is not set
# CONFIG_NF_TPROXY_IPV4 is not set
# CONFIG_NF_DUP_IPV4 is not set
CONFIG_NF_LOG_ARP=m
CONFIG_NF_LOG_IPV4=m
CONFIG_NF_REJECT_IPV4=m
CONFIG_IP_NF_IPTABLES=m
CONFIG_IP_NF_FILTER=m
CONFIG_IP_NF_TARGET_REJECT=m
CONFIG_IP_NF_NAT=m
# CONFIG_IP_NF_TARGET_MASQUERADE is not set
CONFIG_IP_NF_MANGLE=m
# CONFIG_IP_NF_RAW is not set
# end of IP: Netfilter Configuration

#
# IPv6: Netfilter Configuration
#
# CONFIG_NF_SOCKET_IPV6 is not set
# CONFIG_NF_TPROXY_IPV6 is not set
# CONFIG_NF_DUP_IPV6 is not set
CONFIG_NF_REJECT_IPV6=m
CONFIG_NF_LOG_IPV6=m
CONFIG_IP6_NF_IPTABLES=m
CONFIG_IP6_NF_MATCH_IPV6HEADER=m
CONFIG_IP6_NF_FILTER=m
CONFIG_IP6_NF_TARGET_REJECT=m
CONFIG_IP6_NF_MANGLE=m
# CONFIG_IP6_NF_RAW is not set
# end of IPv6: Netfilter Configuration

CONFIG_NF_DEFRAG_IPV6=m
# CONFIG_NF_CONNTRACK_BRIDGE is not set
# CONFIG_BPFILTER is not set
# CONFIG_IP_DCCP is not set
# CONFIG_IP_SCTP is not set
# CONFIG_RDS is not set
# CONFIG_TIPC is not set
CONFIG_ATM=m
# CONFIG_ATM_CLIP is not set
# CONFIG_ATM_LANE is not set
# CONFIG_ATM_BR2684 is not set
# CONFIG_L2TP is not set
# CONFIG_BRIDGE is not set
# CONFIG_NET_DSA is not set
# CONFIG_VLAN_8021Q is not set
# CONFIG_DECNET is not set
CONFIG_LLC=y
CONFIG_LLC2=y
CONFIG_ATALK=y
# CONFIG_DEV_APPLETALK is not set
# CONFIG_X25 is not set
CONFIG_LAPB=m
# CONFIG_PHONET is not set
# CONFIG_6LOWPAN is not set
CONFIG_IEEE802154=m
# CONFIG_IEEE802154_NL802154_EXPERIMENTAL is not set
CONFIG_IEEE802154_SOCKET=m
# CONFIG_MAC802154 is not set
# CONFIG_NET_SCHED is not set
CONFIG_DCB=y
CONFIG_DNS_RESOLVER=m
CONFIG_BATMAN_ADV=m
# CONFIG_BATMAN_ADV_BATMAN_V is not set
CONFIG_BATMAN_ADV_BLA=y
CONFIG_BATMAN_ADV_DAT=y
CONFIG_BATMAN_ADV_NC=y
CONFIG_BATMAN_ADV_MCAST=y
CONFIG_BATMAN_ADV_DEBUG=y
# CONFIG_BATMAN_ADV_TRACING is not set
# CONFIG_OPENVSWITCH is not set
# CONFIG_VSOCKETS is not set
# CONFIG_NETLINK_DIAG is not set
CONFIG_MPLS=y
CONFIG_NET_MPLS_GSO=m
CONFIG_MPLS_ROUTING=y
CONFIG_NET_NSH=y
CONFIG_HSR=y
# CONFIG_NET_SWITCHDEV is not set
# CONFIG_NET_L3_MASTER_DEV is not set
CONFIG_QRTR=y
CONFIG_QRTR_SMD=m
# CONFIG_QRTR_TUN is not set
# CONFIG_NET_NCSI is not set
CONFIG_PCPU_DEV_REFCNT=y
CONFIG_RPS=y
CONFIG_RFS_ACCEL=y
CONFIG_SOCK_RX_QUEUE_MAPPING=y
CONFIG_XPS=y
# CONFIG_CGROUP_NET_PRIO is not set
CONFIG_CGROUP_NET_CLASSID=y
CONFIG_NET_RX_BUSY_POLL=y
CONFIG_BQL=y
CONFIG_NET_FLOW_LIMIT=y

#
# Network testing
#
# CONFIG_NET_PKTGEN is not set
# CONFIG_NET_DROP_MONITOR is not set
# end of Network testing
# end of Networking options

CONFIG_HAMRADIO=y

#
# Packet Radio protocols
#
CONFIG_AX25=m
# CONFIG_AX25_DAMA_SLAVE is not set
CONFIG_NETROM=m
CONFIG_ROSE=m

#
# AX.25 network device drivers
#
# CONFIG_MKISS is not set
# CONFIG_6PACK is not set
# CONFIG_BPQETHER is not set
# CONFIG_BAYCOM_SER_FDX is not set
# CONFIG_BAYCOM_SER_HDX is not set
CONFIG_BAYCOM_PAR=m
CONFIG_YAM=m
# end of AX.25 network device drivers

CONFIG_CAN=y
# CONFIG_CAN_RAW is not set
CONFIG_CAN_BCM=m
CONFIG_CAN_GW=m
# CONFIG_CAN_J1939 is not set
# CONFIG_CAN_ISOTP is not set
CONFIG_BT=m
# CONFIG_BT_BREDR is not set
CONFIG_BT_LE=y
CONFIG_BT_LEDS=y
# CONFIG_BT_MSFTEXT is not set
CONFIG_BT_AOSPEXT=y
# CONFIG_BT_DEBUGFS is not set
# CONFIG_BT_SELFTEST is not set
# CONFIG_BT_FEATURE_DEBUG is not set

#
# Bluetooth device drivers
#
CONFIG_BT_MTK=m
# CONFIG_BT_HCIUART is not set
# CONFIG_BT_HCIVHCI is not set
CONFIG_BT_MRVL=m
CONFIG_BT_MTKUART=m
CONFIG_BT_HCIRSI=m
# CONFIG_BT_VIRTIO is not set
# end of Bluetooth device drivers

# CONFIG_AF_RXRPC is not set
# CONFIG_AF_KCM is not set
# CONFIG_MCTP is not set
CONFIG_WIRELESS=y
CONFIG_WIRELESS_EXT=y
CONFIG_WEXT_CORE=y
CONFIG_WEXT_PROC=y
CONFIG_WEXT_SPY=y
CONFIG_CFG80211=m
# CONFIG_NL80211_TESTMODE is not set
CONFIG_CFG80211_DEVELOPER_WARNINGS=y
CONFIG_CFG80211_REQUIRE_SIGNED_REGDB=y
CONFIG_CFG80211_USE_KERNEL_REGDB_KEYS=y
# CONFIG_CFG80211_DEFAULT_PS is not set
CONFIG_CFG80211_DEBUGFS=y
CONFIG_CFG80211_CRDA_SUPPORT=y
CONFIG_CFG80211_WEXT=y
CONFIG_LIB80211=m
CONFIG_LIB80211_DEBUG=y
CONFIG_MAC80211=m
CONFIG_MAC80211_HAS_RC=y
CONFIG_MAC80211_RC_MINSTREL=y
CONFIG_MAC80211_RC_DEFAULT_MINSTREL=y
CONFIG_MAC80211_RC_DEFAULT="minstrel_ht"
# CONFIG_MAC80211_MESH is not set
CONFIG_MAC80211_LEDS=y
CONFIG_MAC80211_DEBUGFS=y
# CONFIG_MAC80211_MESSAGE_TRACING is not set
# CONFIG_MAC80211_DEBUG_MENU is not set
CONFIG_MAC80211_STA_HASH_MAX_SIZE=0
CONFIG_RFKILL=y
CONFIG_RFKILL_LEDS=y
CONFIG_RFKILL_INPUT=y
CONFIG_RFKILL_GPIO=m
CONFIG_NET_9P=y
# CONFIG_NET_9P_FD is not set
CONFIG_NET_9P_VIRTIO=y
CONFIG_NET_9P_DEBUG=y
# CONFIG_CAIF is not set
# CONFIG_CEPH_LIB is not set
CONFIG_NFC=m
CONFIG_NFC_DIGITAL=m
CONFIG_NFC_NCI=m
# CONFIG_NFC_NCI_UART is not set
CONFIG_NFC_HCI=m
# CONFIG_NFC_SHDLC is not set

#
# Near Field Communication (NFC) devices
#
CONFIG_NFC_SIM=m
# CONFIG_NFC_VIRTUAL_NCI is not set
CONFIG_NFC_FDP=m
CONFIG_NFC_PN533=m
CONFIG_NFC_PN532_UART=m
CONFIG_NFC_NXP_NCI=m
CONFIG_NFC_S3FWRN5=m
CONFIG_NFC_S3FWRN82_UART=m
# end of Near Field Communication (NFC) devices

CONFIG_PSAMPLE=y
CONFIG_NET_IFE=y
# CONFIG_LWTUNNEL is not set
CONFIG_DST_CACHE=y
CONFIG_GRO_CELLS=y
CONFIG_NET_SELFTESTS=y
CONFIG_PAGE_POOL=y
CONFIG_PAGE_POOL_STATS=y
CONFIG_FAILOVER=y
# CONFIG_ETHTOOL_NETLINK is not set

#
# Device Drivers
#
CONFIG_HAVE_EISA=y
# CONFIG_EISA is not set
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
CONFIG_VGA_ARB=y
CONFIG_VGA_ARB_MAX_GPUS=16
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

# CONFIG_CXL_BUS is not set
CONFIG_PCCARD=m
# CONFIG_PCMCIA is not set
CONFIG_CARDBUS=y

#
# PC-card bridges
#
# CONFIG_YENTA is not set
# CONFIG_RAPIDIO is not set

#
# Generic Driver Options
#
# CONFIG_UEVENT_HELPER is not set
CONFIG_DEVTMPFS=y
CONFIG_DEVTMPFS_MOUNT=y
CONFIG_DEVTMPFS_SAFE=y
# CONFIG_STANDALONE is not set
# CONFIG_PREVENT_FIRMWARE_BUILD is not set

#
# Firmware loader
#
CONFIG_FW_LOADER=y
CONFIG_FW_LOADER_PAGED_BUF=y
CONFIG_FW_LOADER_SYSFS=y
CONFIG_EXTRA_FIRMWARE=""
CONFIG_FW_LOADER_USER_HELPER=y
CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y
CONFIG_FW_LOADER_COMPRESS=y
# CONFIG_FW_LOADER_COMPRESS_XZ is not set
# CONFIG_FW_LOADER_COMPRESS_ZSTD is not set
# CONFIG_FW_UPLOAD is not set
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
CONFIG_REGMAP_SPMI=m
CONFIG_REGMAP_MMIO=y
CONFIG_REGMAP_IRQ=y
CONFIG_DMA_SHARED_BUFFER=y
CONFIG_DMA_FENCE_TRACE=y
# end of Generic Driver Options

#
# Bus devices
#
# CONFIG_MHI_BUS is not set
CONFIG_MHI_BUS_EP=y
# end of Bus devices

CONFIG_CONNECTOR=m

#
# Firmware Drivers
#

#
# ARM System Control and Management Interface Protocol
#
# end of ARM System Control and Management Interface Protocol

# CONFIG_EDD is not set
CONFIG_FIRMWARE_MEMMAP=y
CONFIG_DMIID=y
# CONFIG_DMI_SYSFS is not set
CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK=y
CONFIG_FW_CFG_SYSFS=y
CONFIG_FW_CFG_SYSFS_CMDLINE=y
CONFIG_SYSFB=y
CONFIG_SYSFB_SIMPLEFB=y
CONFIG_GOOGLE_FIRMWARE=y
CONFIG_GOOGLE_SMI=y
CONFIG_GOOGLE_COREBOOT_TABLE=m
CONFIG_GOOGLE_MEMCONSOLE=m
CONFIG_GOOGLE_MEMCONSOLE_X86_LEGACY=m
CONFIG_GOOGLE_MEMCONSOLE_COREBOOT=m
CONFIG_GOOGLE_VPD=m

#
# EFI (Extensible Firmware Interface) Support
#
CONFIG_EFI_ESRT=y
CONFIG_EFI_RUNTIME_MAP=y
# CONFIG_EFI_FAKE_MEMMAP is not set
CONFIG_EFI_DXE_MEM_ATTRIBUTES=y
CONFIG_EFI_RUNTIME_WRAPPERS=y
CONFIG_EFI_GENERIC_STUB_INITRD_CMDLINE_LOADER=y
CONFIG_EFI_BOOTLOADER_CONTROL=y
CONFIG_EFI_CAPSULE_LOADER=m
# CONFIG_EFI_TEST is not set
# CONFIG_APPLE_PROPERTIES is not set
# CONFIG_RESET_ATTACK_MITIGATION is not set
CONFIG_EFI_RCI2_TABLE=y
CONFIG_EFI_DISABLE_PCI_DMA=y
CONFIG_EFI_EARLYCON=y
# CONFIG_EFI_CUSTOM_SSDT_OVERLAYS is not set
# CONFIG_EFI_DISABLE_RUNTIME is not set
CONFIG_EFI_COCO_SECRET=y
# end of EFI (Extensible Firmware Interface) Support

#
# Tegra firmware driver
#
# end of Tegra firmware driver
# end of Firmware Drivers

CONFIG_GNSS=m
CONFIG_GNSS_SERIAL=m
# CONFIG_GNSS_MTK_SERIAL is not set
# CONFIG_GNSS_SIRF_SERIAL is not set
CONFIG_GNSS_UBX_SERIAL=m
# CONFIG_MTD is not set
# CONFIG_OF is not set
CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=y
CONFIG_PARPORT=m
CONFIG_PARPORT_PC=m
# CONFIG_PARPORT_SERIAL is not set
CONFIG_PARPORT_PC_FIFO=y
CONFIG_PARPORT_PC_SUPERIO=y
# CONFIG_PARPORT_AX88796 is not set
# CONFIG_PARPORT_1284 is not set
CONFIG_PNP=y
CONFIG_PNP_DEBUG_MESSAGES=y

#
# Protocols
#
CONFIG_PNPACPI=y
CONFIG_BLK_DEV=y
# CONFIG_BLK_DEV_NULL_BLK is not set
# CONFIG_BLK_DEV_FD is not set
# CONFIG_PARIDE is not set
# CONFIG_BLK_DEV_PCIESSD_MTIP32XX is not set
# CONFIG_ZRAM is not set
# CONFIG_BLK_DEV_LOOP is not set
# CONFIG_BLK_DEV_DRBD is not set
# CONFIG_BLK_DEV_NBD is not set
# CONFIG_BLK_DEV_RAM is not set
# CONFIG_CDROM_PKTCDVD is not set
# CONFIG_ATA_OVER_ETH is not set
# CONFIG_VIRTIO_BLK is not set
# CONFIG_BLK_DEV_RBD is not set
# CONFIG_BLK_DEV_UBLK is not set

#
# NVME Support
#
CONFIG_NVME_COMMON=y
CONFIG_NVME_CORE=y
# CONFIG_BLK_DEV_NVME is not set
# CONFIG_NVME_MULTIPATH is not set
# CONFIG_NVME_VERBOSE_ERRORS is not set
# CONFIG_NVME_HWMON is not set
CONFIG_NVME_FABRICS=y
CONFIG_NVME_FC=y
# CONFIG_NVME_TCP is not set
CONFIG_NVME_AUTH=y
CONFIG_NVME_TARGET=y
CONFIG_NVME_TARGET_PASSTHRU=y
CONFIG_NVME_TARGET_LOOP=y
# CONFIG_NVME_TARGET_FC is not set
# CONFIG_NVME_TARGET_TCP is not set
# CONFIG_NVME_TARGET_AUTH is not set
# end of NVME Support

#
# Misc devices
#
# CONFIG_DUMMY_IRQ is not set
# CONFIG_IBM_ASM is not set
# CONFIG_PHANTOM is not set
# CONFIG_TIFM_CORE is not set
# CONFIG_ENCLOSURE_SERVICES is not set
# CONFIG_HP_ILO is not set
# CONFIG_SRAM is not set
# CONFIG_DW_XDATA_PCIE is not set
# CONFIG_PCI_ENDPOINT_TEST is not set
# CONFIG_XILINX_SDFEC is not set
CONFIG_C2PORT=m
# CONFIG_C2PORT_DURAMAR_2150 is not set

#
# EEPROM support
#
CONFIG_EEPROM_93CX6=y
# end of EEPROM support

# CONFIG_CB710_CORE is not set

#
# Texas Instruments shared transport line discipline
#
# CONFIG_TI_ST is not set
# end of Texas Instruments shared transport line discipline

#
# Altera FPGA firmware download module (requires I2C)
#
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
CONFIG_PVPANIC=y
CONFIG_PVPANIC_MMIO=m
# CONFIG_PVPANIC_PCI is not set
# end of Misc devices

#
# SCSI device support
#
CONFIG_SCSI_MOD=y
CONFIG_RAID_ATTRS=y
CONFIG_SCSI_COMMON=y
CONFIG_SCSI=y
CONFIG_SCSI_DMA=y
CONFIG_SCSI_NETLINK=y
CONFIG_SCSI_PROC_FS=y

#
# SCSI support type (disk, tape, CD-ROM)
#
# CONFIG_BLK_DEV_SD is not set
CONFIG_CHR_DEV_ST=y
# CONFIG_BLK_DEV_SR is not set
# CONFIG_CHR_DEV_SG is not set
CONFIG_BLK_DEV_BSG=y
CONFIG_CHR_DEV_SCH=m
# CONFIG_SCSI_CONSTANTS is not set
# CONFIG_SCSI_LOGGING is not set
CONFIG_SCSI_SCAN_ASYNC=y

#
# SCSI Transports
#
CONFIG_SCSI_SPI_ATTRS=m
CONFIG_SCSI_FC_ATTRS=m
# CONFIG_SCSI_ISCSI_ATTRS is not set
CONFIG_SCSI_SAS_ATTRS=y
# CONFIG_SCSI_SAS_LIBSAS is not set
CONFIG_SCSI_SRP_ATTRS=y
# end of SCSI Transports

# CONFIG_SCSI_LOWLEVEL is not set
CONFIG_SCSI_DH=y
CONFIG_SCSI_DH_RDAC=m
# CONFIG_SCSI_DH_HP_SW is not set
CONFIG_SCSI_DH_EMC=m
# CONFIG_SCSI_DH_ALUA is not set
# end of SCSI device support

CONFIG_ATA=m
CONFIG_SATA_HOST=y
# CONFIG_ATA_VERBOSE_ERROR is not set
CONFIG_ATA_FORCE=y
# CONFIG_ATA_ACPI is not set
# CONFIG_SATA_PMP is not set

#
# Controllers with non-SFF native interface
#
# CONFIG_SATA_AHCI is not set
CONFIG_SATA_AHCI_PLATFORM=m
# CONFIG_SATA_INIC162X is not set
# CONFIG_SATA_ACARD_AHCI is not set
# CONFIG_SATA_SIL24 is not set
# CONFIG_ATA_SFF is not set
# CONFIG_MD is not set
CONFIG_TARGET_CORE=m
# CONFIG_TCM_IBLOCK is not set
CONFIG_TCM_FILEIO=m
CONFIG_TCM_PSCSI=m
# CONFIG_LOOPBACK_TARGET is not set
# CONFIG_ISCSI_TARGET is not set
# CONFIG_FUSION is not set

#
# IEEE 1394 (FireWire) support
#
# CONFIG_FIREWIRE is not set
# CONFIG_FIREWIRE_NOSY is not set
# end of IEEE 1394 (FireWire) support

CONFIG_MACINTOSH_DRIVERS=y
# CONFIG_MAC_EMUMOUSEBTN is not set
CONFIG_NETDEVICES=y
CONFIG_MII=y
# CONFIG_NET_CORE is not set
# CONFIG_ARCNET is not set
CONFIG_ATM_DRIVERS=y
CONFIG_ATM_DUMMY=m
# CONFIG_ATM_TCP is not set
# CONFIG_ATM_LANAI is not set
# CONFIG_ATM_ENI is not set
# CONFIG_ATM_NICSTAR is not set
# CONFIG_ATM_IDT77252 is not set
# CONFIG_ATM_IA is not set
# CONFIG_ATM_FORE200E is not set
# CONFIG_ATM_HE is not set
# CONFIG_ATM_SOLOS is not set
CONFIG_ETHERNET=y
CONFIG_NET_VENDOR_3COM=y
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
CONFIG_ALTERA_TSE=m
CONFIG_NET_VENDOR_AMAZON=y
# CONFIG_NET_VENDOR_AMD is not set
CONFIG_NET_VENDOR_AQUANTIA=y
# CONFIG_AQTION is not set
# CONFIG_NET_VENDOR_ARC is not set
# CONFIG_NET_VENDOR_ASIX is not set
CONFIG_NET_VENDOR_ATHEROS=y
# CONFIG_ATL2 is not set
# CONFIG_ATL1 is not set
# CONFIG_ATL1E is not set
# CONFIG_ATL1C is not set
# CONFIG_ALX is not set
# CONFIG_CX_ECAT is not set
CONFIG_NET_VENDOR_BROADCOM=y
# CONFIG_B44 is not set
CONFIG_BCMGENET=y
# CONFIG_BNX2 is not set
# CONFIG_CNIC is not set
# CONFIG_TIGON3 is not set
# CONFIG_BNX2X is not set
CONFIG_SYSTEMPORT=m
# CONFIG_BNXT is not set
CONFIG_NET_VENDOR_CADENCE=y
# CONFIG_MACB is not set
CONFIG_NET_VENDOR_CAVIUM=y
# CONFIG_THUNDER_NIC_PF is not set
# CONFIG_THUNDER_NIC_VF is not set
# CONFIG_THUNDER_NIC_BGX is not set
# CONFIG_THUNDER_NIC_RGX is not set
# CONFIG_CAVIUM_PTP is not set
# CONFIG_LIQUIDIO is not set
CONFIG_NET_VENDOR_CHELSIO=y
# CONFIG_CHELSIO_T1 is not set
# CONFIG_CHELSIO_T3 is not set
# CONFIG_CHELSIO_T4 is not set
# CONFIG_CHELSIO_T4VF is not set
CONFIG_NET_VENDOR_CISCO=y
# CONFIG_ENIC is not set
CONFIG_NET_VENDOR_CORTINA=y
# CONFIG_NET_VENDOR_DAVICOM is not set
# CONFIG_DNET is not set
CONFIG_NET_VENDOR_DEC=y
# CONFIG_NET_TULIP is not set
CONFIG_NET_VENDOR_DLINK=y
# CONFIG_DL2K is not set
# CONFIG_SUNDANCE is not set
CONFIG_NET_VENDOR_EMULEX=y
# CONFIG_BE2NET is not set
# CONFIG_NET_VENDOR_ENGLEDER is not set
CONFIG_NET_VENDOR_EZCHIP=y
CONFIG_NET_VENDOR_FUNGIBLE=y
# CONFIG_NET_VENDOR_GOOGLE is not set
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
# CONFIG_NET_VENDOR_WANGXUN is not set
# CONFIG_JME is not set
CONFIG_NET_VENDOR_LITEX=y
CONFIG_NET_VENDOR_MARVELL=y
CONFIG_MVMDIO=m
# CONFIG_SKGE is not set
# CONFIG_SKY2 is not set
# CONFIG_OCTEON_EP is not set
CONFIG_NET_VENDOR_MELLANOX=y
# CONFIG_MLX4_EN is not set
# CONFIG_MLX5_CORE is not set
# CONFIG_MLXSW_CORE is not set
# CONFIG_MLXFW is not set
# CONFIG_NET_VENDOR_MICREL is not set
# CONFIG_NET_VENDOR_MICROCHIP is not set
CONFIG_NET_VENDOR_MICROSEMI=y
CONFIG_NET_VENDOR_MICROSOFT=y
CONFIG_NET_VENDOR_MYRI=y
# CONFIG_MYRI10GE is not set
# CONFIG_FEALNX is not set
CONFIG_NET_VENDOR_NI=y
CONFIG_NI_XGE_MANAGEMENT_ENET=y
CONFIG_NET_VENDOR_NATSEMI=y
# CONFIG_NATSEMI is not set
# CONFIG_NS83820 is not set
CONFIG_NET_VENDOR_NETERION=y
# CONFIG_S2IO is not set
# CONFIG_NET_VENDOR_NETRONOME is not set
CONFIG_NET_VENDOR_8390=y
# CONFIG_NE2K_PCI is not set
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
CONFIG_NET_VENDOR_BROCADE=y
# CONFIG_BNA is not set
# CONFIG_NET_VENDOR_QUALCOMM is not set
CONFIG_NET_VENDOR_RDC=y
# CONFIG_R6040 is not set
CONFIG_NET_VENDOR_REALTEK=y
CONFIG_ATP=m
# CONFIG_8139CP is not set
# CONFIG_8139TOO is not set
# CONFIG_R8169 is not set
CONFIG_NET_VENDOR_RENESAS=y
CONFIG_NET_VENDOR_ROCKER=y
CONFIG_NET_VENDOR_SAMSUNG=y
# CONFIG_SXGBE_ETH is not set
# CONFIG_NET_VENDOR_SEEQ is not set
CONFIG_NET_VENDOR_SILAN=y
# CONFIG_SC92031 is not set
CONFIG_NET_VENDOR_SIS=y
# CONFIG_SIS900 is not set
# CONFIG_SIS190 is not set
# CONFIG_NET_VENDOR_SOLARFLARE is not set
# CONFIG_NET_VENDOR_SMSC is not set
CONFIG_NET_VENDOR_SOCIONEXT=y
CONFIG_NET_VENDOR_STMICRO=y
CONFIG_STMMAC_ETH=m
# CONFIG_STMMAC_SELFTESTS is not set
# CONFIG_STMMAC_PLATFORM is not set
CONFIG_DWMAC_INTEL=m
# CONFIG_DWMAC_LOONGSON is not set
# CONFIG_STMMAC_PCI is not set
CONFIG_NET_VENDOR_SUN=y
# CONFIG_HAPPYMEAL is not set
# CONFIG_SUNGEM is not set
# CONFIG_CASSINI is not set
# CONFIG_NIU is not set
CONFIG_NET_VENDOR_SYNOPSYS=y
CONFIG_DWC_XLGMAC=y
# CONFIG_DWC_XLGMAC_PCI is not set
CONFIG_NET_VENDOR_TEHUTI=y
# CONFIG_TEHUTI is not set
CONFIG_NET_VENDOR_TI=y
# CONFIG_TI_CPSW_PHY_SEL is not set
# CONFIG_TLAN is not set
# CONFIG_NET_VENDOR_VERTEXCOM is not set
# CONFIG_NET_VENDOR_VIA is not set
CONFIG_NET_VENDOR_WIZNET=y
# CONFIG_WIZNET_W5100 is not set
CONFIG_WIZNET_W5300=y
# CONFIG_WIZNET_BUS_DIRECT is not set
# CONFIG_WIZNET_BUS_INDIRECT is not set
CONFIG_WIZNET_BUS_ANY=y
# CONFIG_NET_VENDOR_XILINX is not set
# CONFIG_FDDI is not set
# CONFIG_HIPPI is not set
CONFIG_NET_SB1000=m
CONFIG_PHYLINK=m
CONFIG_PHYLIB=y
CONFIG_SWPHY=y
# CONFIG_LED_TRIGGER_PHY is not set
CONFIG_FIXED_PHY=y

#
# MII PHY device drivers
#
# CONFIG_AMD_PHY is not set
CONFIG_ADIN_PHY=m
CONFIG_ADIN1100_PHY=m
CONFIG_AQUANTIA_PHY=y
# CONFIG_AX88796B_PHY is not set
# CONFIG_BROADCOM_PHY is not set
CONFIG_BCM54140_PHY=m
CONFIG_BCM7XXX_PHY=y
# CONFIG_BCM84881_PHY is not set
CONFIG_BCM87XX_PHY=y
CONFIG_BCM_NET_PHYLIB=y
CONFIG_CICADA_PHY=m
CONFIG_CORTINA_PHY=y
CONFIG_DAVICOM_PHY=m
CONFIG_ICPLUS_PHY=y
CONFIG_LXT_PHY=m
CONFIG_INTEL_XWAY_PHY=y
CONFIG_LSI_ET1011C_PHY=m
CONFIG_MARVELL_PHY=y
CONFIG_MARVELL_10G_PHY=y
# CONFIG_MARVELL_88X2222_PHY is not set
# CONFIG_MAXLINEAR_GPHY is not set
# CONFIG_MEDIATEK_GE_PHY is not set
CONFIG_MICREL_PHY=y
CONFIG_MICROCHIP_PHY=m
CONFIG_MICROCHIP_T1_PHY=y
# CONFIG_MICROSEMI_PHY is not set
CONFIG_MOTORCOMM_PHY=m
# CONFIG_NATIONAL_PHY is not set
# CONFIG_NXP_C45_TJA11XX_PHY is not set
CONFIG_NXP_TJA11XX_PHY=y
CONFIG_AT803X_PHY=m
# CONFIG_QSEMI_PHY is not set
CONFIG_REALTEK_PHY=m
# CONFIG_RENESAS_PHY is not set
CONFIG_ROCKCHIP_PHY=y
CONFIG_SMSC_PHY=m
CONFIG_STE10XP=m
CONFIG_TERANETICS_PHY=y
CONFIG_DP83822_PHY=y
# CONFIG_DP83TC811_PHY is not set
CONFIG_DP83848_PHY=m
# CONFIG_DP83867_PHY is not set
# CONFIG_DP83869_PHY is not set
CONFIG_DP83TD510_PHY=m
CONFIG_VITESSE_PHY=m
CONFIG_XILINX_GMII2RGMII=y
# CONFIG_CAN_DEV is not set
CONFIG_MDIO_DEVICE=y
CONFIG_MDIO_BUS=y
CONFIG_FWNODE_MDIO=y
CONFIG_ACPI_MDIO=y
CONFIG_MDIO_DEVRES=y
CONFIG_MDIO_BITBANG=y
CONFIG_MDIO_BCM_UNIMAC=y
# CONFIG_MDIO_GPIO is not set
CONFIG_MDIO_MSCC_MIIM=m
# CONFIG_MDIO_THUNDER is not set

#
# MDIO Multiplexers
#

#
# PCS device drivers
#
CONFIG_PCS_XPCS=m
# end of PCS device drivers

CONFIG_PLIP=m
CONFIG_PPP=m
CONFIG_PPP_BSDCOMP=m
CONFIG_PPP_DEFLATE=m
CONFIG_PPP_FILTER=y
CONFIG_PPP_MPPE=m
# CONFIG_PPP_MULTILINK is not set
CONFIG_PPPOATM=m
CONFIG_PPPOE=m
CONFIG_PPP_ASYNC=m
CONFIG_PPP_SYNC_TTY=m
# CONFIG_SLIP is not set
CONFIG_SLHC=m

#
# Host-side USB support is needed for USB Network Adapter support
#
CONFIG_WLAN=y
CONFIG_WLAN_VENDOR_ADMTEK=y
# CONFIG_ADM8211 is not set
CONFIG_ATH_COMMON=m
CONFIG_WLAN_VENDOR_ATH=y
# CONFIG_ATH_DEBUG is not set
# CONFIG_ATH5K is not set
# CONFIG_ATH5K_PCI is not set
CONFIG_ATH9K_HW=m
CONFIG_ATH9K_COMMON=m
CONFIG_ATH9K_COMMON_DEBUG=y
CONFIG_ATH9K_BTCOEX_SUPPORT=y
CONFIG_ATH9K=m
CONFIG_ATH9K_PCI=y
# CONFIG_ATH9K_AHB is not set
CONFIG_ATH9K_DEBUGFS=y
CONFIG_ATH9K_STATION_STATISTICS=y
# CONFIG_ATH9K_DYNACK is not set
# CONFIG_ATH9K_WOW is not set
CONFIG_ATH9K_RFKILL=y
# CONFIG_ATH9K_CHANNEL_CONTEXT is not set
CONFIG_ATH9K_PCOEM=y
# CONFIG_ATH9K_PCI_NO_EEPROM is not set
# CONFIG_ATH9K_HWRNG is not set
# CONFIG_ATH9K_COMMON_SPECTRAL is not set
CONFIG_ATH6KL=m
# CONFIG_ATH6KL_DEBUG is not set
# CONFIG_ATH6KL_TRACING is not set
# CONFIG_WIL6210 is not set
# CONFIG_ATH10K is not set
# CONFIG_WCN36XX is not set
CONFIG_WLAN_VENDOR_ATMEL=y
# CONFIG_ATMEL is not set
# CONFIG_WLAN_VENDOR_BROADCOM is not set
CONFIG_WLAN_VENDOR_CISCO=y
# CONFIG_AIRO is not set
# CONFIG_WLAN_VENDOR_INTEL is not set
CONFIG_WLAN_VENDOR_INTERSIL=y
# CONFIG_HOSTAP is not set
# CONFIG_HERMES is not set
CONFIG_P54_COMMON=m
# CONFIG_P54_PCI is not set
CONFIG_P54_LEDS=y
CONFIG_WLAN_VENDOR_MARVELL=y
CONFIG_LIBERTAS=m
# CONFIG_LIBERTAS_DEBUG is not set
# CONFIG_LIBERTAS_MESH is not set
# CONFIG_LIBERTAS_THINFIRM is not set
CONFIG_MWIFIEX=m
# CONFIG_MWIFIEX_PCIE is not set
# CONFIG_MWL8K is not set
CONFIG_WLAN_VENDOR_MEDIATEK=y
# CONFIG_MT76x0E is not set
# CONFIG_MT76x2E is not set
# CONFIG_MT7603E is not set
# CONFIG_MT7615E is not set
# CONFIG_MT7915E is not set
# CONFIG_MT7921E is not set
# CONFIG_WLAN_VENDOR_MICROCHIP is not set
CONFIG_WLAN_VENDOR_PURELIFI=y
# CONFIG_WLAN_VENDOR_RALINK is not set
# CONFIG_WLAN_VENDOR_REALTEK is not set
CONFIG_WLAN_VENDOR_RSI=y
CONFIG_RSI_91X=m
CONFIG_RSI_DEBUGFS=y
CONFIG_RSI_COEX=y
# CONFIG_WLAN_VENDOR_SILABS is not set
# CONFIG_WLAN_VENDOR_ST is not set
CONFIG_WLAN_VENDOR_TI=y
CONFIG_WL1251=m
CONFIG_WL12XX=m
CONFIG_WL18XX=m
CONFIG_WLCORE=m
# CONFIG_WLAN_VENDOR_ZYDAS is not set
# CONFIG_WLAN_VENDOR_QUANTENNA is not set
CONFIG_MAC80211_HWSIM=m
# CONFIG_VIRT_WIFI is not set
# CONFIG_WAN is not set
CONFIG_IEEE802154_DRIVERS=m

#
# Wireless WAN
#
# CONFIG_WWAN is not set
# end of Wireless WAN

# CONFIG_VMXNET3 is not set
CONFIG_FUJITSU_ES=y
# CONFIG_NETDEVSIM is not set
CONFIG_NET_FAILOVER=y
CONFIG_ISDN=y
CONFIG_ISDN_CAPI=y
# CONFIG_MISDN is not set

#
# Input device support
#
CONFIG_INPUT=y
# CONFIG_INPUT_LEDS is not set
CONFIG_INPUT_FF_MEMLESS=y
CONFIG_INPUT_SPARSEKMAP=y
CONFIG_INPUT_MATRIXKMAP=y
CONFIG_INPUT_VIVALDIFMAP=y

#
# Userland interfaces
#
CONFIG_INPUT_MOUSEDEV=m
CONFIG_INPUT_MOUSEDEV_PSAUX=y
CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
CONFIG_INPUT_JOYDEV=m
# CONFIG_INPUT_EVDEV is not set
CONFIG_INPUT_EVBUG=m

#
# Input Device Drivers
#
CONFIG_INPUT_KEYBOARD=y
# CONFIG_KEYBOARD_ADC is not set
CONFIG_KEYBOARD_ATKBD=y
# CONFIG_KEYBOARD_LKKBD is not set
# CONFIG_KEYBOARD_GPIO is not set
# CONFIG_KEYBOARD_GPIO_POLLED is not set
# CONFIG_KEYBOARD_MATRIX is not set
# CONFIG_KEYBOARD_NEWTON is not set
# CONFIG_KEYBOARD_OPENCORES is not set
# CONFIG_KEYBOARD_SAMSUNG is not set
# CONFIG_KEYBOARD_GOLDFISH_EVENTS is not set
# CONFIG_KEYBOARD_STOWAWAY is not set
# CONFIG_KEYBOARD_SUNKBD is not set
# CONFIG_KEYBOARD_XTKBD is not set
# CONFIG_KEYBOARD_MTK_PMIC is not set
CONFIG_INPUT_MOUSE=y
CONFIG_MOUSE_PS2=m
CONFIG_MOUSE_PS2_ALPS=y
CONFIG_MOUSE_PS2_BYD=y
CONFIG_MOUSE_PS2_LOGIPS2PP=y
CONFIG_MOUSE_PS2_SYNAPTICS=y
CONFIG_MOUSE_PS2_CYPRESS=y
CONFIG_MOUSE_PS2_LIFEBOOK=y
CONFIG_MOUSE_PS2_TRACKPOINT=y
# CONFIG_MOUSE_PS2_ELANTECH is not set
# CONFIG_MOUSE_PS2_SENTELIC is not set
CONFIG_MOUSE_PS2_TOUCHKIT=y
CONFIG_MOUSE_PS2_FOCALTECH=y
# CONFIG_MOUSE_PS2_VMMOUSE is not set
CONFIG_MOUSE_SERIAL=m
# CONFIG_MOUSE_APPLETOUCH is not set
# CONFIG_MOUSE_BCM5974 is not set
CONFIG_MOUSE_VSXXXAA=m
CONFIG_MOUSE_GPIO=y
# CONFIG_MOUSE_SYNAPTICS_USB is not set
# CONFIG_INPUT_JOYSTICK is not set
CONFIG_INPUT_TABLET=y
# CONFIG_TABLET_USB_ACECAD is not set
# CONFIG_TABLET_USB_AIPTEK is not set
# CONFIG_TABLET_USB_HANWANG is not set
# CONFIG_TABLET_USB_KBTAB is not set
# CONFIG_TABLET_USB_PEGASUS is not set
# CONFIG_TABLET_SERIAL_WACOM4 is not set
# CONFIG_INPUT_TOUCHSCREEN is not set
# CONFIG_INPUT_MISC is not set
CONFIG_RMI4_CORE=m
# CONFIG_RMI4_F03 is not set
CONFIG_RMI4_2D_SENSOR=y
# CONFIG_RMI4_F11 is not set
CONFIG_RMI4_F12=y
# CONFIG_RMI4_F30 is not set
CONFIG_RMI4_F34=y
CONFIG_RMI4_F3A=y
CONFIG_RMI4_F55=y

#
# Hardware I/O ports
#
CONFIG_SERIO=y
CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=y
CONFIG_SERIO_I8042=y
# CONFIG_SERIO_SERPORT is not set
# CONFIG_SERIO_CT82C710 is not set
CONFIG_SERIO_PARKBD=m
# CONFIG_SERIO_PCIPS2 is not set
CONFIG_SERIO_LIBPS2=y
CONFIG_SERIO_RAW=y
CONFIG_SERIO_ALTERA_PS2=m
# CONFIG_SERIO_PS2MULT is not set
CONFIG_SERIO_ARC_PS2=m
# CONFIG_SERIO_GPIO_PS2 is not set
# CONFIG_USERIO is not set
CONFIG_GAMEPORT=y
CONFIG_GAMEPORT_NS558=y
CONFIG_GAMEPORT_L4=m
# CONFIG_GAMEPORT_EMU10K1 is not set
# CONFIG_GAMEPORT_FM801 is not set
# end of Hardware I/O ports
# end of Input device support

#
# Character devices
#
CONFIG_TTY=y
CONFIG_VT=y
CONFIG_CONSOLE_TRANSLATIONS=y
CONFIG_VT_CONSOLE=y
CONFIG_HW_CONSOLE=y
CONFIG_VT_HW_CONSOLE_BINDING=y
CONFIG_UNIX98_PTYS=y
CONFIG_LEGACY_PTYS=y
CONFIG_LEGACY_PTY_COUNT=256
CONFIG_LDISC_AUTOLOAD=y

#
# Serial drivers
#
CONFIG_SERIAL_EARLYCON=y
CONFIG_SERIAL_8250=y
# CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
CONFIG_SERIAL_8250_PNP=y
CONFIG_SERIAL_8250_16550A_VARIANTS=y
CONFIG_SERIAL_8250_FINTEK=y
CONFIG_SERIAL_8250_CONSOLE=y
CONFIG_SERIAL_8250_DMA=y
CONFIG_SERIAL_8250_PCI=y
CONFIG_SERIAL_8250_EXAR=y
# CONFIG_SERIAL_8250_MEN_MCB is not set
CONFIG_SERIAL_8250_NR_UARTS=4
CONFIG_SERIAL_8250_RUNTIME_UARTS=4
CONFIG_SERIAL_8250_EXTENDED=y
CONFIG_SERIAL_8250_MANY_PORTS=y
CONFIG_SERIAL_8250_SHARE_IRQ=y
CONFIG_SERIAL_8250_DETECT_IRQ=y
CONFIG_SERIAL_8250_RSA=y
CONFIG_SERIAL_8250_DWLIB=y
CONFIG_SERIAL_8250_DW=m
# CONFIG_SERIAL_8250_RT288X is not set
CONFIG_SERIAL_8250_LPSS=y
CONFIG_SERIAL_8250_MID=y
CONFIG_SERIAL_8250_PERICOM=y

#
# Non-8250 serial port support
#
# CONFIG_SERIAL_UARTLITE is not set
CONFIG_SERIAL_CORE=y
CONFIG_SERIAL_CORE_CONSOLE=y
# CONFIG_SERIAL_JSM is not set
CONFIG_SERIAL_LANTIQ=m
CONFIG_SERIAL_SCCNXP=m
# CONFIG_SERIAL_ALTERA_JTAGUART is not set
CONFIG_SERIAL_ALTERA_UART=y
CONFIG_SERIAL_ALTERA_UART_MAXPORTS=4
CONFIG_SERIAL_ALTERA_UART_BAUDRATE=115200
CONFIG_SERIAL_ALTERA_UART_CONSOLE=y
# CONFIG_SERIAL_ARC is not set
# CONFIG_SERIAL_RP2 is not set
CONFIG_SERIAL_FSL_LPUART=y
CONFIG_SERIAL_FSL_LPUART_CONSOLE=y
CONFIG_SERIAL_FSL_LINFLEXUART=m
CONFIG_SERIAL_MEN_Z135=m
# CONFIG_SERIAL_SPRD is not set
# end of Serial drivers

CONFIG_SERIAL_MCTRL_GPIO=y
# CONFIG_SERIAL_NONSTANDARD is not set
CONFIG_GOLDFISH_TTY=m
CONFIG_N_GSM=m
# CONFIG_NOZOMI is not set
CONFIG_NULL_TTY=m
CONFIG_HVC_DRIVER=y
# CONFIG_RPMSG_TTY is not set
CONFIG_SERIAL_DEV_BUS=m
# CONFIG_PRINTER is not set
CONFIG_PPDEV=m
CONFIG_VIRTIO_CONSOLE=m
CONFIG_IPMI_HANDLER=m
CONFIG_IPMI_DMI_DECODE=y
CONFIG_IPMI_PLAT_DATA=y
# CONFIG_IPMI_PANIC_EVENT is not set
CONFIG_IPMI_DEVICE_INTERFACE=m
CONFIG_IPMI_SI=m
CONFIG_IPMI_WATCHDOG=m
CONFIG_IPMI_POWEROFF=m
CONFIG_HW_RANDOM=y
# CONFIG_HW_RANDOM_TIMERIOMEM is not set
CONFIG_HW_RANDOM_INTEL=y
# CONFIG_HW_RANDOM_AMD is not set
# CONFIG_HW_RANDOM_BA431 is not set
CONFIG_HW_RANDOM_VIA=y
CONFIG_HW_RANDOM_VIRTIO=m
# CONFIG_HW_RANDOM_XIPHERA is not set
# CONFIG_APPLICOM is not set
CONFIG_MWAVE=m
# CONFIG_DEVMEM is not set
CONFIG_NVRAM=m
CONFIG_DEVPORT=y
CONFIG_HPET=y
CONFIG_HPET_MMAP=y
# CONFIG_HPET_MMAP_DEFAULT is not set
CONFIG_HANGCHECK_TIMER=m
# CONFIG_TCG_TPM is not set
CONFIG_TELCLOCK=y
# CONFIG_XILLYBUS is not set
# CONFIG_RANDOM_TRUST_CPU is not set
CONFIG_RANDOM_TRUST_BOOTLOADER=y
# end of Character devices

#
# I2C support
#
# CONFIG_I2C is not set
# end of I2C support

# CONFIG_I3C is not set
# CONFIG_SPI is not set
CONFIG_SPMI=m
# CONFIG_SPMI_HISI3670 is not set
# CONFIG_HSI is not set
CONFIG_PPS=y
# CONFIG_PPS_DEBUG is not set

#
# PPS clients support
#
CONFIG_PPS_CLIENT_KTIMER=m
CONFIG_PPS_CLIENT_LDISC=m
CONFIG_PPS_CLIENT_PARPORT=m
CONFIG_PPS_CLIENT_GPIO=m

#
# PPS generators support
#

#
# PTP clock support
#
CONFIG_PTP_1588_CLOCK=y
CONFIG_PTP_1588_CLOCK_OPTIONAL=y
# CONFIG_DP83640_PHY is not set
CONFIG_PTP_1588_CLOCK_INES=y
CONFIG_PTP_1588_CLOCK_KVM=y
# CONFIG_PTP_1588_CLOCK_VMW is not set
# end of PTP clock support

CONFIG_PINCTRL=y
CONFIG_PINMUX=y
CONFIG_PINCONF=y
CONFIG_GENERIC_PINCONF=y
# CONFIG_DEBUG_PINCTRL is not set
# CONFIG_PINCTRL_AMD is not set
CONFIG_PINCTRL_MADERA=y
CONFIG_PINCTRL_CS47L85=y
CONFIG_PINCTRL_CS47L90=y

#
# Intel pinctrl drivers
#
CONFIG_PINCTRL_BAYTRAIL=y
# CONFIG_PINCTRL_CHERRYVIEW is not set
CONFIG_PINCTRL_LYNXPOINT=m
CONFIG_PINCTRL_INTEL=y
CONFIG_PINCTRL_ALDERLAKE=y
CONFIG_PINCTRL_BROXTON=y
# CONFIG_PINCTRL_CANNONLAKE is not set
CONFIG_PINCTRL_CEDARFORK=m
# CONFIG_PINCTRL_DENVERTON is not set
# CONFIG_PINCTRL_ELKHARTLAKE is not set
CONFIG_PINCTRL_EMMITSBURG=m
CONFIG_PINCTRL_GEMINILAKE=m
CONFIG_PINCTRL_ICELAKE=y
CONFIG_PINCTRL_JASPERLAKE=y
CONFIG_PINCTRL_LAKEFIELD=y
CONFIG_PINCTRL_LEWISBURG=m
# CONFIG_PINCTRL_METEORLAKE is not set
CONFIG_PINCTRL_SUNRISEPOINT=m
CONFIG_PINCTRL_TIGERLAKE=m
# end of Intel pinctrl drivers

#
# Renesas pinctrl drivers
#
# end of Renesas pinctrl drivers

CONFIG_GPIOLIB=y
CONFIG_GPIOLIB_FASTPATH_LIMIT=512
CONFIG_GPIO_ACPI=y
CONFIG_GPIOLIB_IRQCHIP=y
# CONFIG_DEBUG_GPIO is not set
CONFIG_GPIO_CDEV=y
# CONFIG_GPIO_CDEV_V1 is not set
CONFIG_GPIO_GENERIC=y

#
# Memory mapped GPIO drivers
#
# CONFIG_GPIO_AMDPT is not set
# CONFIG_GPIO_DWAPB is not set
# CONFIG_GPIO_EXAR is not set
CONFIG_GPIO_GENERIC_PLATFORM=y
# CONFIG_GPIO_MB86S7X is not set
CONFIG_GPIO_MENZ127=m
# CONFIG_GPIO_SIOX is not set
# CONFIG_GPIO_VX855 is not set
# CONFIG_GPIO_AMD_FCH is not set
# end of Memory mapped GPIO drivers

#
# Port-mapped I/O GPIO drivers
#
CONFIG_GPIO_F7188X=m
CONFIG_GPIO_IT87=y
CONFIG_GPIO_SCH311X=y
CONFIG_GPIO_WINBOND=y
# CONFIG_GPIO_WS16C48 is not set
# end of Port-mapped I/O GPIO drivers

#
# MFD GPIO expanders
#
CONFIG_GPIO_KEMPLD=m
# CONFIG_GPIO_MADERA is not set
# CONFIG_GPIO_TQMX86 is not set
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
# Virtual GPIO drivers
#
# CONFIG_GPIO_AGGREGATOR is not set
CONFIG_GPIO_MOCKUP=y
# CONFIG_GPIO_VIRTIO is not set
# CONFIG_GPIO_SIM is not set
# end of Virtual GPIO drivers

CONFIG_W1=m
# CONFIG_W1_CON is not set

#
# 1-wire Bus Masters
#
# CONFIG_W1_MASTER_MATROX is not set
CONFIG_W1_MASTER_DS1WM=m
CONFIG_W1_MASTER_GPIO=m
CONFIG_W1_MASTER_SGI=m
# end of 1-wire Bus Masters

#
# 1-wire Slaves
#
CONFIG_W1_SLAVE_THERM=m
CONFIG_W1_SLAVE_SMEM=m
CONFIG_W1_SLAVE_DS2405=m
CONFIG_W1_SLAVE_DS2408=m
# CONFIG_W1_SLAVE_DS2408_READBACK is not set
# CONFIG_W1_SLAVE_DS2413 is not set
CONFIG_W1_SLAVE_DS2406=m
# CONFIG_W1_SLAVE_DS2423 is not set
# CONFIG_W1_SLAVE_DS2805 is not set
CONFIG_W1_SLAVE_DS2430=m
CONFIG_W1_SLAVE_DS2431=m
CONFIG_W1_SLAVE_DS2433=m
CONFIG_W1_SLAVE_DS2433_CRC=y
CONFIG_W1_SLAVE_DS2438=m
CONFIG_W1_SLAVE_DS250X=m
CONFIG_W1_SLAVE_DS2780=m
CONFIG_W1_SLAVE_DS2781=m
CONFIG_W1_SLAVE_DS28E04=m
# end of 1-wire Slaves

# CONFIG_POWER_RESET is not set
CONFIG_POWER_SUPPLY=y
# CONFIG_POWER_SUPPLY_DEBUG is not set
CONFIG_POWER_SUPPLY_HWMON=y
CONFIG_PDA_POWER=y
CONFIG_GENERIC_ADC_BATTERY=y
# CONFIG_TEST_POWER is not set
CONFIG_BATTERY_DS2760=m
CONFIG_BATTERY_DS2780=m
# CONFIG_BATTERY_DS2781 is not set
CONFIG_BATTERY_SAMSUNG_SDI=y
CONFIG_BATTERY_BQ27XXX=m
# CONFIG_BATTERY_BQ27XXX_HDQ is not set
# CONFIG_BATTERY_MAX1721X is not set
# CONFIG_CHARGER_MAX8903 is not set
# CONFIG_CHARGER_GPIO is not set
CONFIG_CHARGER_MANAGER=m
CONFIG_CHARGER_LT3651=y
CONFIG_BATTERY_GOLDFISH=m
CONFIG_HWMON=y
CONFIG_HWMON_VID=m
CONFIG_HWMON_DEBUG_CHIP=y

#
# Native drivers
#
CONFIG_SENSORS_ABITUGURU=m
CONFIG_SENSORS_ABITUGURU3=m
CONFIG_SENSORS_AS370=y
CONFIG_SENSORS_AXI_FAN_CONTROL=m
# CONFIG_SENSORS_K8TEMP is not set
# CONFIG_SENSORS_K10TEMP is not set
# CONFIG_SENSORS_FAM15H_POWER is not set
CONFIG_SENSORS_APPLESMC=m
# CONFIG_SENSORS_ASPEED is not set
CONFIG_SENSORS_CORSAIR_CPRO=m
CONFIG_SENSORS_CORSAIR_PSU=m
# CONFIG_SENSORS_DRIVETEMP is not set
CONFIG_SENSORS_DELL_SMM=y
CONFIG_I8K=y
# CONFIG_SENSORS_I5K_AMB is not set
CONFIG_SENSORS_F71805F=y
CONFIG_SENSORS_F71882FG=y
CONFIG_SENSORS_IBMAEM=m
# CONFIG_SENSORS_IBMPEX is not set
CONFIG_SENSORS_IIO_HWMON=y
# CONFIG_SENSORS_I5500 is not set
CONFIG_SENSORS_CORETEMP=m
# CONFIG_SENSORS_IT87 is not set
CONFIG_SENSORS_MAX197=y
CONFIG_SENSORS_MR75203=y
# CONFIG_SENSORS_PC87360 is not set
CONFIG_SENSORS_PC87427=y
CONFIG_SENSORS_NTC_THERMISTOR=m
CONFIG_SENSORS_NCT6683=m
CONFIG_SENSORS_NCT6775_CORE=m
CONFIG_SENSORS_NCT6775=m
# CONFIG_SENSORS_NPCM7XX is not set
# CONFIG_SENSORS_PECI_CPUTEMP is not set
# CONFIG_SENSORS_PECI_DIMMTEMP is not set
# CONFIG_SENSORS_SHT15 is not set
# CONFIG_SENSORS_SIS5595 is not set
# CONFIG_SENSORS_SY7636A is not set
CONFIG_SENSORS_SMSC47M1=y
# CONFIG_SENSORS_SMSC47B397 is not set
CONFIG_SENSORS_SCH56XX_COMMON=m
# CONFIG_SENSORS_SCH5627 is not set
CONFIG_SENSORS_SCH5636=m
# CONFIG_SENSORS_VIA_CPUTEMP is not set
# CONFIG_SENSORS_VIA686A is not set
# CONFIG_SENSORS_VT1211 is not set
# CONFIG_SENSORS_VT8231 is not set
# CONFIG_SENSORS_W83627HF is not set
CONFIG_SENSORS_W83627EHF=m
CONFIG_SENSORS_XGENE=y

#
# ACPI drivers
#
# CONFIG_SENSORS_ACPI_POWER is not set
CONFIG_SENSORS_ATK0110=m
CONFIG_SENSORS_ASUS_EC=m
CONFIG_THERMAL=y
# CONFIG_THERMAL_NETLINK is not set
# CONFIG_THERMAL_STATISTICS is not set
CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=0
CONFIG_THERMAL_HWMON=y
CONFIG_THERMAL_WRITABLE_TRIPS=y
CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=y
# CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
# CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
CONFIG_THERMAL_GOV_FAIR_SHARE=y
CONFIG_THERMAL_GOV_STEP_WISE=y
# CONFIG_THERMAL_GOV_BANG_BANG is not set
CONFIG_THERMAL_GOV_USER_SPACE=y
CONFIG_DEVFREQ_THERMAL=y
CONFIG_THERMAL_EMULATION=y

#
# Intel thermal drivers
#
CONFIG_INTEL_POWERCLAMP=m
CONFIG_X86_THERMAL_VECTOR=y
CONFIG_X86_PKG_TEMP_THERMAL=y
# CONFIG_INTEL_SOC_DTS_THERMAL is not set

#
# ACPI INT340X thermal drivers
#
# CONFIG_INT340X_THERMAL is not set
# end of ACPI INT340X thermal drivers

# CONFIG_INTEL_PCH_THERMAL is not set
# CONFIG_INTEL_TCC_COOLING is not set
CONFIG_INTEL_MENLOW=m
# CONFIG_INTEL_HFI_THERMAL is not set
# end of Intel thermal drivers

# CONFIG_GENERIC_ADC_THERMAL is not set
CONFIG_WATCHDOG=y
CONFIG_WATCHDOG_CORE=y
# CONFIG_WATCHDOG_NOWAYOUT is not set
# CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED is not set
CONFIG_WATCHDOG_OPEN_TIMEOUT=0
# CONFIG_WATCHDOG_SYSFS is not set
CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT=y

#
# Watchdog Pretimeout Governors
#
# CONFIG_WATCHDOG_PRETIMEOUT_GOV is not set

#
# Watchdog Device Drivers
#
CONFIG_SOFT_WATCHDOG=m
# CONFIG_MENZ069_WATCHDOG is not set
CONFIG_WDAT_WDT=m
# CONFIG_XILINX_WATCHDOG is not set
# CONFIG_RAVE_SP_WATCHDOG is not set
CONFIG_CADENCE_WATCHDOG=m
# CONFIG_DW_WATCHDOG is not set
CONFIG_MAX63XX_WATCHDOG=m
CONFIG_ACQUIRE_WDT=m
# CONFIG_ADVANTECH_WDT is not set
# CONFIG_ALIM1535_WDT is not set
# CONFIG_ALIM7101_WDT is not set
# CONFIG_EBC_C384_WDT is not set
CONFIG_F71808E_WDT=y
# CONFIG_SP5100_TCO is not set
CONFIG_SBC_FITPC2_WATCHDOG=y
# CONFIG_EUROTECH_WDT is not set
CONFIG_IB700_WDT=m
CONFIG_IBMASR=y
CONFIG_WAFER_WDT=y
# CONFIG_I6300ESB_WDT is not set
# CONFIG_IE6XX_WDT is not set
# CONFIG_ITCO_WDT is not set
CONFIG_IT8712F_WDT=y
# CONFIG_IT87_WDT is not set
# CONFIG_HP_WATCHDOG is not set
# CONFIG_KEMPLD_WDT is not set
CONFIG_SC1200_WDT=m
CONFIG_PC87413_WDT=y
# CONFIG_NV_TCO is not set
CONFIG_60XX_WDT=m
CONFIG_CPU5_WDT=m
CONFIG_SMSC_SCH311X_WDT=y
# CONFIG_SMSC37B787_WDT is not set
CONFIG_TQMX86_WDT=m
# CONFIG_VIA_WDT is not set
# CONFIG_W83627HF_WDT is not set
CONFIG_W83877F_WDT=m
CONFIG_W83977F_WDT=y
CONFIG_MACHZ_WDT=m
CONFIG_SBC_EPX_C3_WATCHDOG=m
CONFIG_NI903X_WDT=y
CONFIG_NIC7018_WDT=y
CONFIG_MEN_A21_WDT=m

#
# PCI-based Watchdog Cards
#
# CONFIG_PCIPCWATCHDOG is not set
# CONFIG_WDTPCI is not set
CONFIG_SSB_POSSIBLE=y
CONFIG_SSB=m
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
CONFIG_BCMA_SFLASH=y
# CONFIG_BCMA_DRIVER_GMAC_CMN is not set
CONFIG_BCMA_DRIVER_GPIO=y
# CONFIG_BCMA_DEBUG is not set

#
# Multifunction device drivers
#
CONFIG_MFD_CORE=y
CONFIG_MFD_MADERA=y
# CONFIG_MFD_CS47L15 is not set
# CONFIG_MFD_CS47L35 is not set
CONFIG_MFD_CS47L85=y
CONFIG_MFD_CS47L90=y
# CONFIG_MFD_CS47L92 is not set
CONFIG_HTC_PASIC3=y
# CONFIG_MFD_INTEL_QUARK_I2C_GPIO is not set
# CONFIG_LPC_ICH is not set
# CONFIG_LPC_SCH is not set
CONFIG_MFD_INTEL_LPSS=m
CONFIG_MFD_INTEL_LPSS_ACPI=m
# CONFIG_MFD_INTEL_LPSS_PCI is not set
# CONFIG_MFD_JANZ_CMODIO is not set
CONFIG_MFD_KEMPLD=y
CONFIG_MFD_MT6397=y
# CONFIG_MFD_RDC321X is not set
CONFIG_MFD_SM501=y
CONFIG_MFD_SM501_GPIO=y
CONFIG_MFD_SYSCON=y
# CONFIG_MFD_TI_AM335X_TSCADC is not set
CONFIG_MFD_TQMX86=m
# CONFIG_MFD_VX855 is not set
# CONFIG_MFD_WCD934X is not set
CONFIG_RAVE_SP_CORE=m
# end of Multifunction device drivers

CONFIG_REGULATOR=y
CONFIG_REGULATOR_DEBUG=y
CONFIG_REGULATOR_FIXED_VOLTAGE=y
CONFIG_REGULATOR_VIRTUAL_CONSUMER=m
CONFIG_REGULATOR_USERSPACE_CONSUMER=m
CONFIG_REGULATOR_GPIO=y
# CONFIG_REGULATOR_MT6315 is not set
# CONFIG_REGULATOR_MT6323 is not set
# CONFIG_REGULATOR_MT6358 is not set
CONFIG_REGULATOR_MT6359=y
# CONFIG_REGULATOR_MT6397 is not set
CONFIG_REGULATOR_PWM=y
CONFIG_REGULATOR_QCOM_SPMI=m
# CONFIG_REGULATOR_QCOM_USB_VBUS is not set
# CONFIG_REGULATOR_SY7636A is not set
# CONFIG_REGULATOR_QCOM_LABIBB is not set
CONFIG_RC_CORE=m
CONFIG_LIRC=y
CONFIG_RC_MAP=m
CONFIG_RC_DECODERS=y
CONFIG_IR_IMON_DECODER=m
CONFIG_IR_JVC_DECODER=m
# CONFIG_IR_MCE_KBD_DECODER is not set
CONFIG_IR_NEC_DECODER=m
CONFIG_IR_RC5_DECODER=m
# CONFIG_IR_RC6_DECODER is not set
CONFIG_IR_RCMM_DECODER=m
CONFIG_IR_SANYO_DECODER=m
CONFIG_IR_SHARP_DECODER=m
# CONFIG_IR_SONY_DECODER is not set
CONFIG_IR_XMP_DECODER=m
CONFIG_RC_DEVICES=y
CONFIG_IR_ENE=m
# CONFIG_IR_FINTEK is not set
CONFIG_IR_ITE_CIR=m
CONFIG_IR_NUVOTON=m
CONFIG_IR_SERIAL=m
# CONFIG_IR_SERIAL_TRANSMITTER is not set
CONFIG_IR_WINBOND_CIR=m
CONFIG_RC_LOOPBACK=m

#
# CEC support
#
CONFIG_MEDIA_CEC_SUPPORT=y
# CONFIG_CEC_SECO is not set
# CONFIG_USB_PULSE8_CEC is not set
# CONFIG_USB_RAINSHADOW_CEC is not set
# end of CEC support

# CONFIG_MEDIA_SUPPORT is not set

#
# Graphics support
#
CONFIG_APERTURE_HELPERS=y
# CONFIG_AGP is not set
# CONFIG_DRM is not set

#
# ARM devices
#
# end of ARM devices

#
# Frame buffer Devices
#
CONFIG_FB_CMDLINE=y
CONFIG_FB_NOTIFY=y
CONFIG_FB=m
CONFIG_FIRMWARE_EDID=y
CONFIG_FB_CFB_FILLRECT=m
CONFIG_FB_CFB_COPYAREA=m
CONFIG_FB_CFB_IMAGEBLIT=m
CONFIG_FB_SYS_FILLRECT=m
CONFIG_FB_SYS_COPYAREA=m
CONFIG_FB_SYS_IMAGEBLIT=m
CONFIG_FB_FOREIGN_ENDIAN=y
# CONFIG_FB_BOTH_ENDIAN is not set
CONFIG_FB_BIG_ENDIAN=y
# CONFIG_FB_LITTLE_ENDIAN is not set
CONFIG_FB_SYS_FOPS=m
CONFIG_FB_DEFERRED_IO=y
CONFIG_FB_HECUBA=m
CONFIG_FB_MODE_HELPERS=y
CONFIG_FB_TILEBLITTING=y

#
# Frame buffer hardware drivers
#
# CONFIG_FB_CIRRUS is not set
# CONFIG_FB_PM2 is not set
# CONFIG_FB_CYBER2000 is not set
# CONFIG_FB_ARC is not set
# CONFIG_FB_VGA16 is not set
# CONFIG_FB_UVESA is not set
CONFIG_FB_N411=m
CONFIG_FB_HGA=m
# CONFIG_FB_OPENCORES is not set
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
# CONFIG_FB_NEOMAGIC is not set
# CONFIG_FB_KYRO is not set
# CONFIG_FB_3DFX is not set
# CONFIG_FB_VOODOO1 is not set
# CONFIG_FB_VT8623 is not set
# CONFIG_FB_TRIDENT is not set
# CONFIG_FB_ARK is not set
# CONFIG_FB_PM3 is not set
# CONFIG_FB_CARMINE is not set
CONFIG_FB_SM501=m
# CONFIG_FB_IBM_GXT4500 is not set
CONFIG_FB_GOLDFISH=m
CONFIG_FB_VIRTUAL=m
CONFIG_FB_METRONOME=m
# CONFIG_FB_MB862XX is not set
# CONFIG_FB_SIMPLE is not set
# CONFIG_FB_SM712 is not set
# end of Frame buffer Devices

#
# Backlight & LCD device support
#
CONFIG_LCD_CLASS_DEVICE=y
CONFIG_LCD_PLATFORM=y
CONFIG_BACKLIGHT_CLASS_DEVICE=m
CONFIG_BACKLIGHT_KTD253=m
# CONFIG_BACKLIGHT_PWM is not set
CONFIG_BACKLIGHT_APPLE=m
CONFIG_BACKLIGHT_QCOM_WLED=m
CONFIG_BACKLIGHT_SAHARA=m
CONFIG_BACKLIGHT_GPIO=m
CONFIG_BACKLIGHT_RAVE_SP=m
# end of Backlight & LCD device support

#
# Console display driver support
#
CONFIG_VGA_CONSOLE=y
CONFIG_DUMMY_CONSOLE=y
CONFIG_DUMMY_CONSOLE_COLUMNS=80
CONFIG_DUMMY_CONSOLE_ROWS=25
CONFIG_FRAMEBUFFER_CONSOLE=y
# CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION is not set
# CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY is not set
CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
# end of Console display driver support

CONFIG_LOGO=y
CONFIG_LOGO_LINUX_MONO=y
CONFIG_LOGO_LINUX_VGA16=y
# CONFIG_LOGO_LINUX_CLUT224 is not set
# end of Graphics support

CONFIG_SOUND=y
# CONFIG_SND is not set

#
# HID support
#
CONFIG_HID=y
# CONFIG_HID_BATTERY_STRENGTH is not set
CONFIG_HIDRAW=y
CONFIG_UHID=m
CONFIG_HID_GENERIC=y

#
# Special HID drivers
#
# CONFIG_HID_A4TECH is not set
CONFIG_HID_ACRUX=m
# CONFIG_HID_ACRUX_FF is not set
# CONFIG_HID_APPLE is not set
# CONFIG_HID_AUREAL is not set
CONFIG_HID_BELKIN=y
# CONFIG_HID_CHERRY is not set
CONFIG_HID_COUGAR=m
# CONFIG_HID_MACALLY is not set
CONFIG_HID_CMEDIA=m
# CONFIG_HID_CYPRESS is not set
CONFIG_HID_DRAGONRISE=m
# CONFIG_DRAGONRISE_FF is not set
# CONFIG_HID_EMS_FF is not set
CONFIG_HID_ELECOM=y
# CONFIG_HID_EZKEY is not set
CONFIG_HID_GEMBIRD=y
CONFIG_HID_GFRM=m
# CONFIG_HID_GLORIOUS is not set
# CONFIG_HID_VIVALDI is not set
# CONFIG_HID_KEYTOUCH is not set
CONFIG_HID_KYE=y
CONFIG_HID_WALTOP=y
# CONFIG_HID_VIEWSONIC is not set
CONFIG_HID_XIAOMI=m
# CONFIG_HID_GYRATION is not set
CONFIG_HID_ICADE=y
# CONFIG_HID_ITE is not set
CONFIG_HID_JABRA=m
CONFIG_HID_TWINHAN=y
# CONFIG_HID_KENSINGTON is not set
CONFIG_HID_LCPOWER=y
CONFIG_HID_LED=y
CONFIG_HID_LENOVO=m
CONFIG_HID_MAGICMOUSE=y
# CONFIG_HID_MALTRON is not set
CONFIG_HID_MAYFLASH=y
CONFIG_HID_REDRAGON=y
# CONFIG_HID_MICROSOFT is not set
# CONFIG_HID_MONTEREY is not set
CONFIG_HID_MULTITOUCH=y
# CONFIG_HID_NINTENDO is not set
CONFIG_HID_NTI=m
# CONFIG_HID_ORTEK is not set
CONFIG_HID_PANTHERLORD=y
# CONFIG_PANTHERLORD_FF is not set
# CONFIG_HID_PETALYNX is not set
# CONFIG_HID_PICOLCD is not set
CONFIG_HID_PLANTRONICS=y
CONFIG_HID_PLAYSTATION=m
CONFIG_PLAYSTATION_FF=y
CONFIG_HID_RAZER=y
# CONFIG_HID_PRIMAX is not set
CONFIG_HID_SAITEK=y
CONFIG_HID_SEMITEK=y
CONFIG_HID_SPEEDLINK=y
# CONFIG_HID_STEAM is not set
CONFIG_HID_STEELSERIES=m
CONFIG_HID_SUNPLUS=m
# CONFIG_HID_RMI is not set
# CONFIG_HID_GREENASIA is not set
CONFIG_HID_SMARTJOYPLUS=y
CONFIG_SMARTJOYPLUS_FF=y
CONFIG_HID_TIVO=m
CONFIG_HID_TOPSEED=y
CONFIG_HID_THINGM=y
# CONFIG_HID_UDRAW_PS3 is not set
CONFIG_HID_WIIMOTE=y
CONFIG_HID_XINMO=y
# CONFIG_HID_ZEROPLUS is not set
# CONFIG_HID_ZYDACRON is not set
# CONFIG_HID_SENSOR_HUB is not set
CONFIG_HID_ALPS=y
# end of Special HID drivers

#
# Intel ISH HID support
#
# CONFIG_INTEL_ISH_HID is not set
# end of Intel ISH HID support

#
# AMD SFH HID Support
#
# CONFIG_AMD_SFH_HID is not set
# end of AMD SFH HID Support
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
# CONFIG_MMC is not set
CONFIG_SCSI_UFSHCD=y
# CONFIG_SCSI_UFS_BSG is not set
# CONFIG_SCSI_UFS_HPB is not set
# CONFIG_SCSI_UFS_HWMON is not set
# CONFIG_SCSI_UFSHCD_PCI is not set
CONFIG_SCSI_UFSHCD_PLATFORM=m
# CONFIG_SCSI_UFS_CDNS_PLATFORM is not set
# CONFIG_SCSI_UFS_DWC_TC_PLATFORM is not set
# CONFIG_MEMSTICK is not set
CONFIG_NEW_LEDS=y
CONFIG_LEDS_CLASS=y
# CONFIG_LEDS_CLASS_FLASH is not set
CONFIG_LEDS_CLASS_MULTICOLOR=m
# CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not set

#
# LED drivers
#
CONFIG_LEDS_APU=y
# CONFIG_LEDS_MT6323 is not set
CONFIG_LEDS_GPIO=y
CONFIG_LEDS_PWM=m
CONFIG_LEDS_REGULATOR=m
# CONFIG_LEDS_INTEL_SS4200 is not set
CONFIG_LEDS_LT3593=m

#
# LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
#
CONFIG_LEDS_MLXCPLD=y
CONFIG_LEDS_MLXREG=m
CONFIG_LEDS_USER=y
CONFIG_LEDS_NIC78BX=m
CONFIG_LEDS_TI_LMU_COMMON=m

#
# Flash and Torch LED drivers
#

#
# RGB LED drivers
#
CONFIG_LEDS_PWM_MULTICOLOR=m

#
# LED Triggers
#
CONFIG_LEDS_TRIGGERS=y
CONFIG_LEDS_TRIGGER_TIMER=m
CONFIG_LEDS_TRIGGER_ONESHOT=m
CONFIG_LEDS_TRIGGER_DISK=y
CONFIG_LEDS_TRIGGER_HEARTBEAT=m
CONFIG_LEDS_TRIGGER_BACKLIGHT=m
CONFIG_LEDS_TRIGGER_CPU=y
CONFIG_LEDS_TRIGGER_ACTIVITY=y
# CONFIG_LEDS_TRIGGER_GPIO is not set
# CONFIG_LEDS_TRIGGER_DEFAULT_ON is not set

#
# iptables trigger is under Netfilter config (LED target)
#
CONFIG_LEDS_TRIGGER_TRANSIENT=m
CONFIG_LEDS_TRIGGER_CAMERA=y
CONFIG_LEDS_TRIGGER_PANIC=y
# CONFIG_LEDS_TRIGGER_NETDEV is not set
CONFIG_LEDS_TRIGGER_PATTERN=m
# CONFIG_LEDS_TRIGGER_AUDIO is not set
CONFIG_LEDS_TRIGGER_TTY=m

#
# Simple LED drivers
#
# CONFIG_ACCESSIBILITY is not set
# CONFIG_INFINIBAND is not set
CONFIG_EDAC_ATOMIC_SCRUB=y
CONFIG_EDAC_SUPPORT=y
CONFIG_RTC_LIB=y
CONFIG_RTC_MC146818_LIB=y
CONFIG_RTC_CLASS=y
CONFIG_RTC_HCTOSYS=y
CONFIG_RTC_HCTOSYS_DEVICE="rtc0"
# CONFIG_RTC_SYSTOHC is not set
# CONFIG_RTC_DEBUG is not set
CONFIG_RTC_NVMEM=y

#
# RTC interfaces
#
# CONFIG_RTC_INTF_SYSFS is not set
# CONFIG_RTC_INTF_PROC is not set
CONFIG_RTC_INTF_DEV=y
CONFIG_RTC_INTF_DEV_UIE_EMUL=y
# CONFIG_RTC_DRV_TEST is not set

#
# I2C RTC drivers
#

#
# SPI RTC drivers
#

#
# SPI and I2C RTC drivers
#

#
# Platform RTC drivers
#
CONFIG_RTC_DRV_CMOS=y
# CONFIG_RTC_DRV_DS1286 is not set
CONFIG_RTC_DRV_DS1511=y
CONFIG_RTC_DRV_DS1553=m
CONFIG_RTC_DRV_DS1685_FAMILY=y
# CONFIG_RTC_DRV_DS1685 is not set
# CONFIG_RTC_DRV_DS1689 is not set
# CONFIG_RTC_DRV_DS17285 is not set
# CONFIG_RTC_DRV_DS17485 is not set
CONFIG_RTC_DRV_DS17885=y
CONFIG_RTC_DRV_DS1742=m
CONFIG_RTC_DRV_DS2404=m
CONFIG_RTC_DRV_STK17TA8=y
CONFIG_RTC_DRV_M48T86=m
# CONFIG_RTC_DRV_M48T35 is not set
CONFIG_RTC_DRV_M48T59=y
CONFIG_RTC_DRV_MSM6242=m
CONFIG_RTC_DRV_BQ4802=y
CONFIG_RTC_DRV_RP5C01=y
CONFIG_RTC_DRV_V3020=m

#
# on-CPU RTC drivers
#
CONFIG_RTC_DRV_FTRTC010=y
CONFIG_RTC_DRV_MT6397=y

#
# HID Sensor RTC drivers
#
CONFIG_RTC_DRV_GOLDFISH=m
CONFIG_DMADEVICES=y
# CONFIG_DMADEVICES_DEBUG is not set

#
# DMA Devices
#
CONFIG_DMA_ENGINE=y
CONFIG_DMA_VIRTUAL_CHANNELS=y
CONFIG_DMA_ACPI=y
# CONFIG_ALTERA_MSGDMA is not set
# CONFIG_INTEL_IDMA64 is not set
# CONFIG_INTEL_IDXD_COMPAT is not set
# CONFIG_INTEL_IOATDMA is not set
# CONFIG_PLX_DMA is not set
# CONFIG_AMD_PTDMA is not set
# CONFIG_QCOM_HIDMA_MGMT is not set
# CONFIG_QCOM_HIDMA is not set
CONFIG_DW_DMAC_CORE=y
CONFIG_DW_DMAC=m
# CONFIG_DW_DMAC_PCI is not set
CONFIG_HSU_DMA=y
CONFIG_SF_PDMA=m
# CONFIG_INTEL_LDMA is not set

#
# DMA Clients
#
CONFIG_ASYNC_TX_DMA=y
CONFIG_DMATEST=y
CONFIG_DMA_ENGINE_RAID=y

#
# DMABUF options
#
# CONFIG_SYNC_FILE is not set
# CONFIG_UDMABUF is not set
# CONFIG_DMABUF_MOVE_NOTIFY is not set
CONFIG_DMABUF_DEBUG=y
# CONFIG_DMABUF_SELFTESTS is not set
# CONFIG_DMABUF_HEAPS is not set
# CONFIG_DMABUF_SYSFS_STATS is not set
# end of DMABUF options

CONFIG_AUXDISPLAY=y
CONFIG_CHARLCD=y
CONFIG_LINEDISP=y
CONFIG_HD44780_COMMON=y
CONFIG_HD44780=y
CONFIG_KS0108=m
CONFIG_KS0108_PORT=0x378
CONFIG_KS0108_DELAY=2
# CONFIG_CFAG12864B is not set
CONFIG_IMG_ASCII_LCD=y
CONFIG_PARPORT_PANEL=m
CONFIG_PANEL_PARPORT=0
CONFIG_PANEL_PROFILE=5
# CONFIG_PANEL_CHANGE_MESSAGE is not set
# CONFIG_CHARLCD_BL_OFF is not set
CONFIG_CHARLCD_BL_ON=y
# CONFIG_CHARLCD_BL_FLASH is not set
CONFIG_PANEL=m
# CONFIG_UIO is not set
CONFIG_VFIO=y
CONFIG_VFIO_IOMMU_TYPE1=y
# CONFIG_VFIO_NOIOMMU is not set
CONFIG_VFIO_PCI_MMAP=y
CONFIG_VFIO_PCI_INTX=y
# CONFIG_VFIO_PCI is not set
CONFIG_VFIO_MDEV=y
# CONFIG_VIRT_DRIVERS is not set
CONFIG_VIRTIO_ANCHOR=y
CONFIG_VIRTIO=y
CONFIG_VIRTIO_MENU=y
# CONFIG_VIRTIO_PCI is not set
CONFIG_VIRTIO_VDPA=m
# CONFIG_VIRTIO_BALLOON is not set
# CONFIG_VIRTIO_INPUT is not set
CONFIG_VIRTIO_MMIO=y
# CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES is not set
CONFIG_VDPA=m
CONFIG_VDPA_SIM=m
CONFIG_VDPA_SIM_NET=m
# CONFIG_VDPA_SIM_BLOCK is not set
CONFIG_VDPA_USER=m
CONFIG_VHOST_IOTLB=m
CONFIG_VHOST_RING=m
# CONFIG_VHOST_MENU is not set

#
# Microsoft Hyper-V guest support
#
# CONFIG_HYPERV is not set
# end of Microsoft Hyper-V guest support

# CONFIG_GREYBUS is not set
CONFIG_COMEDI=m
CONFIG_COMEDI_DEBUG=y
CONFIG_COMEDI_DEFAULT_BUF_SIZE_KB=2048
CONFIG_COMEDI_DEFAULT_BUF_MAXSIZE_KB=20480
# CONFIG_COMEDI_MISC_DRIVERS is not set
# CONFIG_COMEDI_ISA_DRIVERS is not set
# CONFIG_COMEDI_PCI_DRIVERS is not set
# CONFIG_COMEDI_8255_SA is not set
CONFIG_COMEDI_KCOMEDILIB=m
# CONFIG_COMEDI_TESTS is not set
# CONFIG_STAGING is not set
CONFIG_GOLDFISH_PIPE=y
# CONFIG_CHROME_PLATFORMS is not set
# CONFIG_MELLANOX_PLATFORM is not set
# CONFIG_SURFACE_PLATFORMS is not set
# CONFIG_X86_PLATFORM_DEVICES is not set
# CONFIG_P2SB is not set
CONFIG_HAVE_CLK=y
CONFIG_HAVE_CLK_PREPARE=y
CONFIG_COMMON_CLK=y
CONFIG_COMMON_CLK_PWM=y
CONFIG_XILINX_VCU=y
CONFIG_HWSPINLOCK=y

#
# Clock Source drivers
#
CONFIG_CLKEVT_I8253=y
CONFIG_I8253_LOCK=y
CONFIG_CLKBLD_I8253=y
# end of Clock Source drivers

CONFIG_MAILBOX=y
CONFIG_PCC=y
CONFIG_ALTERA_MBOX=m
CONFIG_IOMMU_IOVA=y
CONFIG_IOMMU_API=y
CONFIG_IOMMU_SUPPORT=y

#
# Generic IOMMU Pagetable Support
#
# end of Generic IOMMU Pagetable Support

# CONFIG_IOMMU_DEBUGFS is not set
# CONFIG_IOMMU_DEFAULT_DMA_STRICT is not set
CONFIG_IOMMU_DEFAULT_DMA_LAZY=y
# CONFIG_IOMMU_DEFAULT_PASSTHROUGH is not set
CONFIG_IOMMU_DMA=y
# CONFIG_AMD_IOMMU is not set
CONFIG_VIRTIO_IOMMU=y

#
# Remoteproc drivers
#
CONFIG_REMOTEPROC=y
# CONFIG_REMOTEPROC_CDEV is not set
# end of Remoteproc drivers

#
# Rpmsg drivers
#
CONFIG_RPMSG=m
CONFIG_RPMSG_CHAR=m
# CONFIG_RPMSG_CTRL is not set
CONFIG_RPMSG_NS=m
CONFIG_RPMSG_QCOM_GLINK=m
CONFIG_RPMSG_QCOM_GLINK_RPM=m
CONFIG_RPMSG_VIRTIO=m
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
# Broadcom SoC drivers
#
# end of Broadcom SoC drivers

#
# NXP/Freescale QorIQ SoC drivers
#
# end of NXP/Freescale QorIQ SoC drivers

#
# fujitsu SoC drivers
#
# end of fujitsu SoC drivers

#
# i.MX SoC drivers
#
# end of i.MX SoC drivers

#
# Enable LiteX SoC Builder specific drivers
#
# end of Enable LiteX SoC Builder specific drivers

#
# Qualcomm SoC drivers
#
# end of Qualcomm SoC drivers

CONFIG_SOC_TI=y

#
# Xilinx SoC drivers
#
# end of Xilinx SoC drivers
# end of SOC (System On Chip) specific Drivers

CONFIG_PM_DEVFREQ=y

#
# DEVFREQ Governors
#
CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=y
CONFIG_DEVFREQ_GOV_PERFORMANCE=m
CONFIG_DEVFREQ_GOV_POWERSAVE=y
CONFIG_DEVFREQ_GOV_USERSPACE=y
CONFIG_DEVFREQ_GOV_PASSIVE=y

#
# DEVFREQ Drivers
#
CONFIG_PM_DEVFREQ_EVENT=y
CONFIG_EXTCON=m

#
# Extcon Device Drivers
#
# CONFIG_EXTCON_ADC_JACK is not set
CONFIG_EXTCON_GPIO=m
# CONFIG_EXTCON_INTEL_INT3496 is not set
CONFIG_EXTCON_MAX3355=m
CONFIG_EXTCON_USB_GPIO=m
CONFIG_MEMORY=y
CONFIG_IIO=y
CONFIG_IIO_BUFFER=y
CONFIG_IIO_BUFFER_CB=y
CONFIG_IIO_BUFFER_DMA=y
CONFIG_IIO_BUFFER_DMAENGINE=m
# CONFIG_IIO_BUFFER_HW_CONSUMER is not set
CONFIG_IIO_KFIFO_BUF=y
CONFIG_IIO_TRIGGERED_BUFFER=y
CONFIG_IIO_CONFIGFS=y
CONFIG_IIO_TRIGGER=y
CONFIG_IIO_CONSUMERS_PER_TRIGGER=2
CONFIG_IIO_SW_DEVICE=y
CONFIG_IIO_SW_TRIGGER=m
# CONFIG_IIO_TRIGGERED_EVENT is not set

#
# Accelerometers
#
CONFIG_BMA400=m
CONFIG_BMC150_ACCEL=m
# CONFIG_KXSD9 is not set
# end of Accelerometers

#
# Analog to digital converters
#
# CONFIG_AD7606_IFACE_PARALLEL is not set
CONFIG_CC10001_ADC=y
CONFIG_ENVELOPE_DETECTOR=m
CONFIG_HX711=y
CONFIG_MEN_Z188_ADC=m
CONFIG_QCOM_VADC_COMMON=m
# CONFIG_QCOM_SPMI_IADC is not set
CONFIG_QCOM_SPMI_VADC=m
# CONFIG_QCOM_SPMI_ADC5 is not set
CONFIG_SD_ADC_MODULATOR=y
CONFIG_VF610_ADC=y
CONFIG_XILINX_XADC=y
# end of Analog to digital converters

#
# Analog to digital and digital to analog converters
#
# end of Analog to digital and digital to analog converters

#
# Analog Front Ends
#
CONFIG_IIO_RESCALE=m
# end of Analog Front Ends

#
# Amplifiers
#
CONFIG_HMC425=y
# end of Amplifiers

#
# Capacitance to digital converters
#
# end of Capacitance to digital converters

#
# Chemical Sensors
#
CONFIG_PMS7003=m
# CONFIG_SCD30_CORE is not set
# CONFIG_SPS30_SERIAL is not set
# end of Chemical Sensors

#
# Hid Sensor IIO Common
#
# end of Hid Sensor IIO Common

#
# IIO SCMI Sensors
#
# end of IIO SCMI Sensors

#
# SSP Sensor Common
#
# end of SSP Sensor Common

#
# Digital to analog converters
#
# CONFIG_DPOT_DAC is not set
CONFIG_VF610_DAC=m
# end of Digital to analog converters

#
# IIO dummy driver
#
# CONFIG_IIO_SIMPLE_DUMMY is not set
# end of IIO dummy driver

#
# Filters
#
# end of Filters

#
# Frequency Synthesizers DDS/PLL
#

#
# Clock Generator/Distribution
#
# end of Clock Generator/Distribution

#
# Phase-Locked Loop (PLL) frequency synthesizers
#
# end of Phase-Locked Loop (PLL) frequency synthesizers
# end of Frequency Synthesizers DDS/PLL

#
# Digital gyroscope sensors
#
# end of Digital gyroscope sensors

#
# Health Sensors
#

#
# Heart Rate Monitors
#
# end of Heart Rate Monitors
# end of Health Sensors

#
# Humidity sensors
#
CONFIG_DHT11=y
# end of Humidity sensors

#
# Inertial measurement units
#
# end of Inertial measurement units

#
# Light sensors
#
CONFIG_ACPI_ALS=y
CONFIG_CM3605=m
# end of Light sensors

#
# Magnetometer sensors
#
# end of Magnetometer sensors

#
# Multiplexers
#
CONFIG_IIO_MUX=y
# end of Multiplexers

#
# Inclinometer sensors
#
# end of Inclinometer sensors

#
# Triggers - standalone
#
# CONFIG_IIO_HRTIMER_TRIGGER is not set
# CONFIG_IIO_INTERRUPT_TRIGGER is not set
CONFIG_IIO_TIGHTLOOP_TRIGGER=m
# CONFIG_IIO_SYSFS_TRIGGER is not set
# end of Triggers - standalone

#
# Linear and angular position sensors
#
# end of Linear and angular position sensors

#
# Digital potentiometers
#
# end of Digital potentiometers

#
# Digital potentiostats
#
# end of Digital potentiostats

#
# Pressure sensors
#
CONFIG_MS5611=m
CONFIG_ZPA2326=m
# end of Pressure sensors

#
# Lightning sensors
#
# end of Lightning sensors

#
# Proximity and distance sensors
#
# CONFIG_PING is not set
CONFIG_SRF04=m
# end of Proximity and distance sensors

#
# Resolver to digital converters
#
# end of Resolver to digital converters

#
# Temperature sensors
#
# end of Temperature sensors

# CONFIG_NTB is not set
CONFIG_PWM=y
CONFIG_PWM_SYSFS=y
# CONFIG_PWM_DEBUG is not set
CONFIG_PWM_CLK=y
# CONFIG_PWM_DWC is not set
CONFIG_PWM_LPSS=y
# CONFIG_PWM_LPSS_PCI is not set
CONFIG_PWM_LPSS_PLATFORM=y

#
# IRQ chip support
#
CONFIG_MADERA_IRQ=y
# end of IRQ chip support

CONFIG_IPACK_BUS=y
# CONFIG_BOARD_TPCI200 is not set
CONFIG_SERIAL_IPOCTAL=m
CONFIG_RESET_CONTROLLER=y
# CONFIG_RESET_TI_SYSCON is not set
CONFIG_RESET_TI_TPS380X=m

#
# PHY Subsystem
#
CONFIG_GENERIC_PHY=y
# CONFIG_USB_LGM_PHY is not set
# CONFIG_PHY_CAN_TRANSCEIVER is not set

#
# PHY drivers for Broadcom platforms
#
# CONFIG_BCM_KONA_USB2_PHY is not set
# end of PHY drivers for Broadcom platforms

CONFIG_PHY_PXA_28NM_HSIC=y
CONFIG_PHY_PXA_28NM_USB2=y
# CONFIG_PHY_CPCAP_USB is not set
# CONFIG_PHY_INTEL_LGM_EMMC is not set
# end of PHY Subsystem

# CONFIG_POWERCAP is not set
CONFIG_MCB=m
# CONFIG_MCB_PCI is not set
CONFIG_MCB_LPC=m

#
# Performance monitor support
#
# end of Performance monitor support

# CONFIG_RAS is not set
# CONFIG_USB4 is not set

#
# Android
#
CONFIG_ANDROID_BINDER_IPC=y
CONFIG_ANDROID_BINDERFS=y
CONFIG_ANDROID_BINDER_DEVICES="binder,hwbinder,vndbinder"
# CONFIG_ANDROID_BINDER_IPC_SELFTEST is not set
# end of Android

# CONFIG_LIBNVDIMM is not set
# CONFIG_DAX is not set
CONFIG_NVMEM=y
CONFIG_NVMEM_SYSFS=y
CONFIG_NVMEM_SPMI_SDAM=m
# CONFIG_RAVE_SP_EEPROM is not set
CONFIG_NVMEM_RMEM=y

#
# HW tracing support
#
# CONFIG_STM is not set
# CONFIG_INTEL_TH is not set
# end of HW tracing support

CONFIG_FPGA=y
# CONFIG_ALTERA_PR_IP_CORE is not set
# CONFIG_FPGA_MGR_ALTERA_CVP is not set
CONFIG_FPGA_BRIDGE=y
CONFIG_ALTERA_FREEZE_BRIDGE=y
CONFIG_XILINX_PR_DECOUPLER=m
CONFIG_FPGA_REGION=y
# CONFIG_FPGA_DFL is not set
CONFIG_TEE=m
CONFIG_MULTIPLEXER=y

#
# Multiplexer drivers
#
CONFIG_MUX_GPIO=y
# end of Multiplexer drivers

CONFIG_PM_OPP=y
CONFIG_SIOX=m
CONFIG_SIOX_BUS_GPIO=m
CONFIG_SLIMBUS=y
CONFIG_SLIM_QCOM_CTRL=y
CONFIG_INTERCONNECT=y
# CONFIG_COUNTER is not set
CONFIG_MOST=m
# CONFIG_MOST_CDEV is not set
CONFIG_PECI=y
# CONFIG_PECI_CPU is not set
# CONFIG_HTE is not set
# end of Device Drivers

#
# File systems
#
CONFIG_DCACHE_WORD_ACCESS=y
# CONFIG_VALIDATE_FS_PARSER is not set
CONFIG_FS_IOMAP=y
CONFIG_EXT2_FS=m
CONFIG_EXT2_FS_XATTR=y
# CONFIG_EXT2_FS_POSIX_ACL is not set
CONFIG_EXT2_FS_SECURITY=y
CONFIG_EXT3_FS=m
# CONFIG_EXT3_FS_POSIX_ACL is not set
CONFIG_EXT3_FS_SECURITY=y
CONFIG_EXT4_FS=m
CONFIG_EXT4_FS_POSIX_ACL=y
CONFIG_EXT4_FS_SECURITY=y
# CONFIG_EXT4_DEBUG is not set
CONFIG_JBD2=m
# CONFIG_JBD2_DEBUG is not set
CONFIG_FS_MBCACHE=m
# CONFIG_REISERFS_FS is not set
# CONFIG_JFS_FS is not set
CONFIG_XFS_FS=y
CONFIG_XFS_SUPPORT_V4=y
# CONFIG_XFS_QUOTA is not set
# CONFIG_XFS_POSIX_ACL is not set
# CONFIG_XFS_RT is not set
CONFIG_XFS_ONLINE_SCRUB=y
CONFIG_XFS_ONLINE_REPAIR=y
CONFIG_XFS_DEBUG=y
# CONFIG_XFS_ASSERT_FATAL is not set
# CONFIG_GFS2_FS is not set
# CONFIG_OCFS2_FS is not set
CONFIG_BTRFS_FS=y
# CONFIG_BTRFS_FS_POSIX_ACL is not set
CONFIG_BTRFS_FS_CHECK_INTEGRITY=y
# CONFIG_BTRFS_FS_RUN_SANITY_TESTS is not set
# CONFIG_BTRFS_DEBUG is not set
CONFIG_BTRFS_ASSERT=y
CONFIG_BTRFS_FS_REF_VERIFY=y
CONFIG_NILFS2_FS=m
CONFIG_F2FS_FS=y
CONFIG_F2FS_STAT_FS=y
CONFIG_F2FS_FS_XATTR=y
# CONFIG_F2FS_FS_POSIX_ACL is not set
CONFIG_F2FS_FS_SECURITY=y
CONFIG_F2FS_CHECK_FS=y
# CONFIG_F2FS_FAULT_INJECTION is not set
# CONFIG_F2FS_FS_COMPRESSION is not set
CONFIG_F2FS_IOSTAT=y
# CONFIG_F2FS_UNFAIR_RWSEM is not set
# CONFIG_ZONEFS_FS is not set
CONFIG_FS_POSIX_ACL=y
CONFIG_EXPORTFS=y
# CONFIG_EXPORTFS_BLOCK_OPS is not set
CONFIG_FILE_LOCKING=y
CONFIG_FS_ENCRYPTION=y
CONFIG_FS_ENCRYPTION_ALGS=y
CONFIG_FS_VERITY=y
# CONFIG_FS_VERITY_DEBUG is not set
# CONFIG_FS_VERITY_BUILTIN_SIGNATURES is not set
CONFIG_FSNOTIFY=y
CONFIG_DNOTIFY=y
CONFIG_INOTIFY_USER=y
# CONFIG_FANOTIFY is not set
CONFIG_QUOTA=y
CONFIG_QUOTA_NETLINK_INTERFACE=y
# CONFIG_PRINT_QUOTA_WARNING is not set
# CONFIG_QUOTA_DEBUG is not set
CONFIG_QUOTA_TREE=y
# CONFIG_QFMT_V1 is not set
CONFIG_QFMT_V2=y
CONFIG_QUOTACTL=y
CONFIG_AUTOFS4_FS=y
CONFIG_AUTOFS_FS=y
# CONFIG_FUSE_FS is not set
# CONFIG_OVERLAY_FS is not set

#
# Caches
#
# CONFIG_FSCACHE is not set
# end of Caches

#
# CD-ROM/DVD Filesystems
#
CONFIG_ISO9660_FS=y
# CONFIG_JOLIET is not set
CONFIG_ZISOFS=y
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
CONFIG_EXFAT_FS=m
CONFIG_EXFAT_DEFAULT_IOCHARSET="utf8"
CONFIG_NTFS_FS=m
# CONFIG_NTFS_DEBUG is not set
# CONFIG_NTFS_RW is not set
# CONFIG_NTFS3_FS is not set
# end of DOS/FAT/EXFAT/NT Filesystems

#
# Pseudo filesystems
#
CONFIG_PROC_FS=y
# CONFIG_PROC_KCORE is not set
# CONFIG_PROC_VMCORE is not set
CONFIG_PROC_SYSCTL=y
CONFIG_PROC_PAGE_MONITOR=y
CONFIG_PROC_CHILDREN=y
CONFIG_PROC_PID_ARCH_STATUS=y
CONFIG_KERNFS=y
CONFIG_SYSFS=y
CONFIG_TMPFS=y
# CONFIG_TMPFS_POSIX_ACL is not set
CONFIG_TMPFS_XATTR=y
CONFIG_TMPFS_INODE64=y
# CONFIG_HUGETLBFS is not set
CONFIG_ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP=y
CONFIG_MEMFD_CREATE=y
CONFIG_ARCH_HAS_GIGANTIC_PAGE=y
CONFIG_CONFIGFS_FS=y
CONFIG_EFIVAR_FS=y
# end of Pseudo filesystems

CONFIG_MISC_FILESYSTEMS=y
CONFIG_ORANGEFS_FS=y
# CONFIG_ADFS_FS is not set
CONFIG_AFFS_FS=m
CONFIG_ECRYPT_FS=m
CONFIG_ECRYPT_FS_MESSAGING=y
CONFIG_HFS_FS=m
# CONFIG_HFSPLUS_FS is not set
CONFIG_BEFS_FS=m
# CONFIG_BEFS_DEBUG is not set
CONFIG_BFS_FS=y
CONFIG_EFS_FS=m
CONFIG_CRAMFS=m
CONFIG_CRAMFS_BLOCKDEV=y
CONFIG_SQUASHFS=m
CONFIG_SQUASHFS_FILE_CACHE=y
# CONFIG_SQUASHFS_FILE_DIRECT is not set
CONFIG_SQUASHFS_DECOMP_SINGLE=y
# CONFIG_SQUASHFS_DECOMP_MULTI is not set
# CONFIG_SQUASHFS_DECOMP_MULTI_PERCPU is not set
CONFIG_SQUASHFS_XATTR=y
# CONFIG_SQUASHFS_ZLIB is not set
# CONFIG_SQUASHFS_LZ4 is not set
# CONFIG_SQUASHFS_LZO is not set
# CONFIG_SQUASHFS_XZ is not set
CONFIG_SQUASHFS_ZSTD=y
# CONFIG_SQUASHFS_4K_DEVBLK_SIZE is not set
CONFIG_SQUASHFS_EMBEDDED=y
CONFIG_SQUASHFS_FRAGMENT_CACHE_SIZE=3
CONFIG_VXFS_FS=y
CONFIG_MINIX_FS=m
CONFIG_OMFS_FS=y
# CONFIG_HPFS_FS is not set
CONFIG_QNX4FS_FS=y
CONFIG_QNX6FS_FS=m
CONFIG_QNX6FS_DEBUG=y
CONFIG_ROMFS_FS=m
CONFIG_ROMFS_BACKED_BY_BLOCK=y
CONFIG_ROMFS_ON_BLOCK=y
# CONFIG_PSTORE is not set
CONFIG_SYSV_FS=y
CONFIG_UFS_FS=y
# CONFIG_UFS_FS_WRITE is not set
CONFIG_UFS_DEBUG=y
CONFIG_EROFS_FS=y
CONFIG_EROFS_FS_DEBUG=y
# CONFIG_EROFS_FS_XATTR is not set
CONFIG_EROFS_FS_ZIP=y
# CONFIG_EROFS_FS_ZIP_LZMA is not set
CONFIG_NETWORK_FILESYSTEMS=y
CONFIG_NFS_FS=y
CONFIG_NFS_V2=y
CONFIG_NFS_V3=y
# CONFIG_NFS_V3_ACL is not set
CONFIG_NFS_V4=m
# CONFIG_NFS_SWAP is not set
# CONFIG_NFS_V4_1 is not set
# CONFIG_ROOT_NFS is not set
# CONFIG_NFS_USE_LEGACY_DNS is not set
CONFIG_NFS_USE_KERNEL_DNS=y
CONFIG_NFS_DISABLE_UDP_SUPPORT=y
# CONFIG_NFSD is not set
CONFIG_GRACE_PERIOD=y
CONFIG_LOCKD=y
CONFIG_LOCKD_V4=y
CONFIG_NFS_COMMON=y
CONFIG_SUNRPC=y
CONFIG_SUNRPC_GSS=m
CONFIG_RPCSEC_GSS_KRB5=m
# CONFIG_SUNRPC_DISABLE_INSECURE_ENCTYPES is not set
# CONFIG_SUNRPC_DEBUG is not set
# CONFIG_CEPH_FS is not set
CONFIG_CIFS=m
CONFIG_CIFS_STATS2=y
CONFIG_CIFS_ALLOW_INSECURE_LEGACY=y
# CONFIG_CIFS_UPCALL is not set
# CONFIG_CIFS_XATTR is not set
CONFIG_CIFS_DEBUG=y
# CONFIG_CIFS_DEBUG2 is not set
# CONFIG_CIFS_DEBUG_DUMP_KEYS is not set
# CONFIG_CIFS_DFS_UPCALL is not set
# CONFIG_CIFS_SWN_UPCALL is not set
# CONFIG_SMB_SERVER is not set
CONFIG_SMBFS_COMMON=m
# CONFIG_CODA_FS is not set
# CONFIG_AFS_FS is not set
# CONFIG_9P_FS is not set
CONFIG_NLS=y
CONFIG_NLS_DEFAULT="iso8859-1"
CONFIG_NLS_CODEPAGE_437=m
# CONFIG_NLS_CODEPAGE_737 is not set
CONFIG_NLS_CODEPAGE_775=m
# CONFIG_NLS_CODEPAGE_850 is not set
CONFIG_NLS_CODEPAGE_852=m
# CONFIG_NLS_CODEPAGE_855 is not set
# CONFIG_NLS_CODEPAGE_857 is not set
CONFIG_NLS_CODEPAGE_860=y
CONFIG_NLS_CODEPAGE_861=m
CONFIG_NLS_CODEPAGE_862=y
CONFIG_NLS_CODEPAGE_863=y
CONFIG_NLS_CODEPAGE_864=m
# CONFIG_NLS_CODEPAGE_865 is not set
# CONFIG_NLS_CODEPAGE_866 is not set
CONFIG_NLS_CODEPAGE_869=m
CONFIG_NLS_CODEPAGE_936=m
CONFIG_NLS_CODEPAGE_950=m
# CONFIG_NLS_CODEPAGE_932 is not set
# CONFIG_NLS_CODEPAGE_949 is not set
# CONFIG_NLS_CODEPAGE_874 is not set
CONFIG_NLS_ISO8859_8=m
CONFIG_NLS_CODEPAGE_1250=y
# CONFIG_NLS_CODEPAGE_1251 is not set
CONFIG_NLS_ASCII=y
CONFIG_NLS_ISO8859_1=m
CONFIG_NLS_ISO8859_2=y
# CONFIG_NLS_ISO8859_3 is not set
CONFIG_NLS_ISO8859_4=m
CONFIG_NLS_ISO8859_5=y
# CONFIG_NLS_ISO8859_6 is not set
CONFIG_NLS_ISO8859_7=m
CONFIG_NLS_ISO8859_9=y
CONFIG_NLS_ISO8859_13=y
CONFIG_NLS_ISO8859_14=y
CONFIG_NLS_ISO8859_15=y
CONFIG_NLS_KOI8_R=m
# CONFIG_NLS_KOI8_U is not set
CONFIG_NLS_MAC_ROMAN=y
CONFIG_NLS_MAC_CELTIC=m
CONFIG_NLS_MAC_CENTEURO=m
CONFIG_NLS_MAC_CROATIAN=y
CONFIG_NLS_MAC_CYRILLIC=m
CONFIG_NLS_MAC_GAELIC=y
# CONFIG_NLS_MAC_GREEK is not set
# CONFIG_NLS_MAC_ICELAND is not set
CONFIG_NLS_MAC_INUIT=m
CONFIG_NLS_MAC_ROMANIAN=y
CONFIG_NLS_MAC_TURKISH=y
CONFIG_NLS_UTF8=m
# CONFIG_DLM is not set
CONFIG_UNICODE=y
# CONFIG_UNICODE_NORMALIZATION_SELFTEST is not set
CONFIG_IO_WQ=y
# end of File systems

#
# Security options
#
CONFIG_KEYS=y
# CONFIG_KEYS_REQUEST_CACHE is not set
CONFIG_PERSISTENT_KEYRINGS=y
CONFIG_TRUSTED_KEYS=m
CONFIG_TRUSTED_KEYS_TEE=y
CONFIG_ENCRYPTED_KEYS=y
# CONFIG_USER_DECRYPTED_DATA is not set
# CONFIG_KEY_DH_OPERATIONS is not set
# CONFIG_SECURITY_DMESG_RESTRICT is not set
CONFIG_SECURITY=y
CONFIG_SECURITYFS=y
CONFIG_SECURITY_NETWORK=y
CONFIG_SECURITY_PATH=y
CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=y
CONFIG_HARDENED_USERCOPY=y
CONFIG_FORTIFY_SOURCE=y
CONFIG_STATIC_USERMODEHELPER=y
CONFIG_STATIC_USERMODEHELPER_PATH="/sbin/usermode-helper"
# CONFIG_SECURITY_SELINUX is not set
# CONFIG_SECURITY_SMACK is not set
# CONFIG_SECURITY_TOMOYO is not set
CONFIG_SECURITY_APPARMOR=y
# CONFIG_SECURITY_APPARMOR_DEBUG is not set
# CONFIG_SECURITY_APPARMOR_INTROSPECT_POLICY is not set
CONFIG_SECURITY_APPARMOR_PARANOID_LOAD=y
# CONFIG_SECURITY_LOADPIN is not set
# CONFIG_SECURITY_YAMA is not set
# CONFIG_SECURITY_SAFESETID is not set
# CONFIG_SECURITY_LOCKDOWN_LSM is not set
CONFIG_SECURITY_LANDLOCK=y
# CONFIG_INTEGRITY is not set
# CONFIG_IMA_SECURE_AND_OR_TRUSTED_BOOT is not set
CONFIG_DEFAULT_SECURITY_APPARMOR=y
# CONFIG_DEFAULT_SECURITY_DAC is not set
CONFIG_LSM="landlock,lockdown,yama,loadpin,safesetid,integrity,tomoyo,bpf"

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

CONFIG_RANDSTRUCT_NONE=y
# end of Kernel hardening options
# end of Security options

CONFIG_XOR_BLOCKS=y
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
CONFIG_CRYPTO_USER=m
CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
CONFIG_CRYPTO_GF128MUL=y
CONFIG_CRYPTO_NULL=y
CONFIG_CRYPTO_NULL2=y
CONFIG_CRYPTO_PCRYPT=m
CONFIG_CRYPTO_CRYPTD=y
CONFIG_CRYPTO_AUTHENC=y
# CONFIG_CRYPTO_TEST is not set
CONFIG_CRYPTO_SIMD=y

#
# Public-key cryptography
#
CONFIG_CRYPTO_RSA=y
CONFIG_CRYPTO_DH=y
CONFIG_CRYPTO_DH_RFC7919_GROUPS=y
CONFIG_CRYPTO_ECC=y
CONFIG_CRYPTO_ECDH=y
CONFIG_CRYPTO_ECDSA=y
# CONFIG_CRYPTO_ECRDSA is not set
CONFIG_CRYPTO_SM2=y
CONFIG_CRYPTO_CURVE25519=y
CONFIG_CRYPTO_CURVE25519_X86=y

#
# Authenticated Encryption with Associated Data
#
CONFIG_CRYPTO_CCM=y
CONFIG_CRYPTO_GCM=m
CONFIG_CRYPTO_CHACHA20POLY1305=y
CONFIG_CRYPTO_AEGIS128=y
# CONFIG_CRYPTO_AEGIS128_AESNI_SSE2 is not set
CONFIG_CRYPTO_SEQIV=y
CONFIG_CRYPTO_ECHAINIV=y

#
# Block modes
#
CONFIG_CRYPTO_CBC=y
CONFIG_CRYPTO_CFB=y
CONFIG_CRYPTO_CTR=y
CONFIG_CRYPTO_CTS=y
CONFIG_CRYPTO_ECB=m
# CONFIG_CRYPTO_LRW is not set
CONFIG_CRYPTO_OFB=m
CONFIG_CRYPTO_PCBC=m
CONFIG_CRYPTO_XCTR=y
CONFIG_CRYPTO_XTS=m
CONFIG_CRYPTO_KEYWRAP=m
CONFIG_CRYPTO_NHPOLY1305=y
CONFIG_CRYPTO_NHPOLY1305_SSE2=m
CONFIG_CRYPTO_NHPOLY1305_AVX2=y
# CONFIG_CRYPTO_ADIANTUM is not set
CONFIG_CRYPTO_HCTR2=y
# CONFIG_CRYPTO_ESSIV is not set

#
# Hash modes
#
CONFIG_CRYPTO_CMAC=y
CONFIG_CRYPTO_HMAC=y
CONFIG_CRYPTO_XCBC=y
# CONFIG_CRYPTO_VMAC is not set

#
# Digest
#
CONFIG_CRYPTO_CRC32C=y
# CONFIG_CRYPTO_CRC32C_INTEL is not set
CONFIG_CRYPTO_CRC32=y
# CONFIG_CRYPTO_CRC32_PCLMUL is not set
CONFIG_CRYPTO_XXHASH=y
CONFIG_CRYPTO_BLAKE2B=y
# CONFIG_CRYPTO_BLAKE2S_X86 is not set
CONFIG_CRYPTO_CRCT10DIF=y
CONFIG_CRYPTO_CRCT10DIF_PCLMUL=y
CONFIG_CRYPTO_CRC64_ROCKSOFT=y
CONFIG_CRYPTO_GHASH=m
CONFIG_CRYPTO_POLYVAL=y
CONFIG_CRYPTO_POLYVAL_CLMUL_NI=y
CONFIG_CRYPTO_POLY1305=y
# CONFIG_CRYPTO_POLY1305_X86_64 is not set
CONFIG_CRYPTO_MD4=y
CONFIG_CRYPTO_MD5=y
# CONFIG_CRYPTO_MICHAEL_MIC is not set
CONFIG_CRYPTO_RMD160=m
CONFIG_CRYPTO_SHA1=y
CONFIG_CRYPTO_SHA1_SSSE3=y
CONFIG_CRYPTO_SHA256_SSSE3=y
CONFIG_CRYPTO_SHA512_SSSE3=m
CONFIG_CRYPTO_SHA256=y
CONFIG_CRYPTO_SHA512=y
CONFIG_CRYPTO_SHA3=y
CONFIG_CRYPTO_SM3=y
# CONFIG_CRYPTO_SM3_GENERIC is not set
# CONFIG_CRYPTO_SM3_AVX_X86_64 is not set
CONFIG_CRYPTO_STREEBOG=m
CONFIG_CRYPTO_WP512=m
# CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL is not set

#
# Ciphers
#
CONFIG_CRYPTO_AES=y
CONFIG_CRYPTO_AES_TI=y
CONFIG_CRYPTO_AES_NI_INTEL=y
CONFIG_CRYPTO_ANUBIS=m
# CONFIG_CRYPTO_ARC4 is not set
CONFIG_CRYPTO_BLOWFISH=m
CONFIG_CRYPTO_BLOWFISH_COMMON=y
CONFIG_CRYPTO_BLOWFISH_X86_64=y
CONFIG_CRYPTO_CAMELLIA=m
CONFIG_CRYPTO_CAMELLIA_X86_64=y
CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64=y
CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64=m
CONFIG_CRYPTO_CAST_COMMON=m
CONFIG_CRYPTO_CAST5=m
CONFIG_CRYPTO_CAST5_AVX_X86_64=m
CONFIG_CRYPTO_CAST6=m
CONFIG_CRYPTO_CAST6_AVX_X86_64=m
CONFIG_CRYPTO_DES=m
# CONFIG_CRYPTO_DES3_EDE_X86_64 is not set
CONFIG_CRYPTO_FCRYPT=y
# CONFIG_CRYPTO_KHAZAD is not set
CONFIG_CRYPTO_CHACHA20=y
# CONFIG_CRYPTO_CHACHA20_X86_64 is not set
# CONFIG_CRYPTO_SEED is not set
CONFIG_CRYPTO_ARIA=m
CONFIG_CRYPTO_SERPENT=m
CONFIG_CRYPTO_SERPENT_SSE2_X86_64=m
CONFIG_CRYPTO_SERPENT_AVX_X86_64=m
CONFIG_CRYPTO_SERPENT_AVX2_X86_64=m
CONFIG_CRYPTO_SM4=y
# CONFIG_CRYPTO_SM4_GENERIC is not set
CONFIG_CRYPTO_SM4_AESNI_AVX_X86_64=y
CONFIG_CRYPTO_SM4_AESNI_AVX2_X86_64=y
CONFIG_CRYPTO_TEA=y
CONFIG_CRYPTO_TWOFISH=m
CONFIG_CRYPTO_TWOFISH_COMMON=y
CONFIG_CRYPTO_TWOFISH_X86_64=y
CONFIG_CRYPTO_TWOFISH_X86_64_3WAY=y
CONFIG_CRYPTO_TWOFISH_AVX_X86_64=m

#
# Compression
#
CONFIG_CRYPTO_DEFLATE=y
CONFIG_CRYPTO_LZO=y
CONFIG_CRYPTO_842=m
CONFIG_CRYPTO_LZ4=m
CONFIG_CRYPTO_LZ4HC=y
CONFIG_CRYPTO_ZSTD=m

#
# Random Number Generation
#
CONFIG_CRYPTO_ANSI_CPRNG=y
CONFIG_CRYPTO_DRBG_MENU=y
CONFIG_CRYPTO_DRBG_HMAC=y
CONFIG_CRYPTO_DRBG_HASH=y
CONFIG_CRYPTO_DRBG_CTR=y
CONFIG_CRYPTO_DRBG=y
CONFIG_CRYPTO_JITTERENTROPY=y
CONFIG_CRYPTO_USER_API=y
CONFIG_CRYPTO_USER_API_HASH=m
CONFIG_CRYPTO_USER_API_SKCIPHER=m
# CONFIG_CRYPTO_USER_API_RNG is not set
CONFIG_CRYPTO_USER_API_AEAD=y
CONFIG_CRYPTO_USER_API_ENABLE_OBSOLETE=y
CONFIG_CRYPTO_STATS=y
CONFIG_CRYPTO_HASH_INFO=y
CONFIG_CRYPTO_HW=y
# CONFIG_CRYPTO_DEV_PADLOCK is not set
# CONFIG_CRYPTO_DEV_CCP is not set
# CONFIG_CRYPTO_DEV_QAT_DH895xCC is not set
# CONFIG_CRYPTO_DEV_QAT_C3XXX is not set
# CONFIG_CRYPTO_DEV_QAT_C62X is not set
# CONFIG_CRYPTO_DEV_QAT_4XXX is not set
# CONFIG_CRYPTO_DEV_QAT_DH895xCCVF is not set
# CONFIG_CRYPTO_DEV_QAT_C3XXXVF is not set
# CONFIG_CRYPTO_DEV_QAT_C62XVF is not set
# CONFIG_CRYPTO_DEV_VIRTIO is not set
CONFIG_CRYPTO_DEV_SAFEXCEL=y
# CONFIG_CRYPTO_DEV_AMLOGIC_GXL is not set
CONFIG_ASYMMETRIC_KEY_TYPE=y
CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=y
CONFIG_X509_CERTIFICATE_PARSER=y
# CONFIG_PKCS8_PRIVATE_KEY_PARSER is not set
CONFIG_PKCS7_MESSAGE_PARSER=y
# CONFIG_PKCS7_TEST_KEY is not set
# CONFIG_SIGNED_PE_FILE_VERIFICATION is not set
# CONFIG_FIPS_SIGNATURE_SELFTEST is not set

#
# Certificates for signature checking
#
CONFIG_SYSTEM_TRUSTED_KEYRING=y
CONFIG_SYSTEM_TRUSTED_KEYS=""
CONFIG_SYSTEM_EXTRA_CERTIFICATE=y
CONFIG_SYSTEM_EXTRA_CERTIFICATE_SIZE=4096
# CONFIG_SECONDARY_TRUSTED_KEYRING is not set
# CONFIG_SYSTEM_BLACKLIST_KEYRING is not set
# end of Certificates for signature checking

CONFIG_BINARY_PRINTF=y

#
# Library routines
#
CONFIG_RAID6_PQ=y
# CONFIG_RAID6_PQ_BENCHMARK is not set
CONFIG_LINEAR_RANGES=y
# CONFIG_PACKING is not set
CONFIG_BITREVERSE=y
CONFIG_GENERIC_STRNCPY_FROM_USER=y
CONFIG_GENERIC_STRNLEN_USER=y
CONFIG_GENERIC_NET_UTILS=y
# CONFIG_CORDIC is not set
CONFIG_PRIME_NUMBERS=y
CONFIG_RATIONAL=y
CONFIG_GENERIC_PCI_IOMAP=y
CONFIG_GENERIC_IOMAP=y
CONFIG_ARCH_USE_CMPXCHG_LOCKREF=y
CONFIG_ARCH_HAS_FAST_MULTIPLIER=y
CONFIG_ARCH_USE_SYM_ANNOTATIONS=y

#
# Crypto library routines
#
CONFIG_CRYPTO_LIB_AES=y
CONFIG_CRYPTO_LIB_ARC4=m
CONFIG_CRYPTO_LIB_BLAKE2S_GENERIC=y
CONFIG_CRYPTO_LIB_CHACHA_GENERIC=y
CONFIG_CRYPTO_LIB_CHACHA=m
CONFIG_CRYPTO_ARCH_HAVE_LIB_CURVE25519=y
CONFIG_CRYPTO_LIB_CURVE25519_GENERIC=y
CONFIG_CRYPTO_LIB_CURVE25519=y
CONFIG_CRYPTO_LIB_DES=y
CONFIG_CRYPTO_LIB_POLY1305_RSIZE=11
CONFIG_CRYPTO_LIB_POLY1305_GENERIC=y
CONFIG_CRYPTO_LIB_POLY1305=m
CONFIG_CRYPTO_LIB_CHACHA20POLY1305=m
CONFIG_CRYPTO_LIB_SHA1=y
CONFIG_CRYPTO_LIB_SHA256=y
# end of Crypto library routines

CONFIG_LIB_MEMNEQ=y
CONFIG_CRC_CCITT=y
CONFIG_CRC16=m
CONFIG_CRC_T10DIF=y
CONFIG_CRC64_ROCKSOFT=y
CONFIG_CRC_ITU_T=y
CONFIG_CRC32=y
# CONFIG_CRC32_SELFTEST is not set
CONFIG_CRC32_SLICEBY8=y
# CONFIG_CRC32_SLICEBY4 is not set
# CONFIG_CRC32_SARWATE is not set
# CONFIG_CRC32_BIT is not set
CONFIG_CRC64=y
CONFIG_CRC4=m
CONFIG_CRC7=y
CONFIG_LIBCRC32C=y
CONFIG_CRC8=y
CONFIG_XXHASH=y
# CONFIG_RANDOM32_SELFTEST is not set
CONFIG_842_COMPRESS=m
CONFIG_842_DECOMPRESS=m
CONFIG_ZLIB_INFLATE=y
CONFIG_ZLIB_DEFLATE=y
CONFIG_LZO_COMPRESS=y
CONFIG_LZO_DECOMPRESS=y
CONFIG_LZ4_COMPRESS=m
CONFIG_LZ4HC_COMPRESS=y
CONFIG_LZ4_DECOMPRESS=y
CONFIG_ZSTD_COMPRESS=y
CONFIG_ZSTD_DECOMPRESS=y
CONFIG_XZ_DEC=y
CONFIG_XZ_DEC_X86=y
CONFIG_XZ_DEC_POWERPC=y
CONFIG_XZ_DEC_IA64=y
CONFIG_XZ_DEC_ARM=y
CONFIG_XZ_DEC_ARMTHUMB=y
CONFIG_XZ_DEC_SPARC=y
CONFIG_XZ_DEC_MICROLZMA=y
CONFIG_XZ_DEC_BCJ=y
# CONFIG_XZ_DEC_TEST is not set
CONFIG_DECOMPRESS_GZIP=y
CONFIG_DECOMPRESS_BZIP2=y
CONFIG_DECOMPRESS_LZMA=y
CONFIG_DECOMPRESS_XZ=y
CONFIG_DECOMPRESS_LZO=y
CONFIG_DECOMPRESS_LZ4=y
CONFIG_DECOMPRESS_ZSTD=y
CONFIG_GENERIC_ALLOCATOR=y
CONFIG_INTERVAL_TREE=y
CONFIG_ASSOCIATIVE_ARRAY=y
CONFIG_HAS_IOMEM=y
CONFIG_HAS_IOPORT_MAP=y
CONFIG_HAS_DMA=y
CONFIG_DMA_OPS=y
CONFIG_NEED_SG_DMA_LENGTH=y
CONFIG_NEED_DMA_MAP_STATE=y
CONFIG_ARCH_DMA_ADDR_T_64BIT=y
CONFIG_SWIOTLB=y
CONFIG_DMA_CMA=y
# CONFIG_DMA_PERNUMA_CMA is not set

#
# Default contiguous memory area size:
#
CONFIG_CMA_SIZE_MBYTES=0
CONFIG_CMA_SIZE_PERCENTAGE=0
# CONFIG_CMA_SIZE_SEL_MBYTES is not set
# CONFIG_CMA_SIZE_SEL_PERCENTAGE is not set
# CONFIG_CMA_SIZE_SEL_MIN is not set
CONFIG_CMA_SIZE_SEL_MAX=y
CONFIG_CMA_ALIGNMENT=8
# CONFIG_DMA_API_DEBUG is not set
CONFIG_DMA_MAP_BENCHMARK=y
CONFIG_SGL_ALLOC=y
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
CONFIG_UCS2_STRING=y
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
CONFIG_STACKDEPOT_ALWAYS_INIT=y
CONFIG_SBITMAP=y
# end of Library routines

#
# Kernel hacking
#

#
# printk and dmesg options
#
CONFIG_PRINTK_TIME=y
CONFIG_PRINTK_CALLER=y
# CONFIG_STACKTRACE_BUILD_ID is not set
CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
CONFIG_CONSOLE_LOGLEVEL_QUIET=4
CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
# CONFIG_BOOT_PRINTK_DELAY is not set
# CONFIG_DYNAMIC_DEBUG is not set
CONFIG_DYNAMIC_DEBUG_CORE=y
# CONFIG_SYMBOLIC_ERRNAME is not set
CONFIG_DEBUG_BUGVERBOSE=y
# end of printk and dmesg options

CONFIG_DEBUG_KERNEL=y
CONFIG_DEBUG_MISC=y

#
# Compile-time checks and compiler options
#
CONFIG_DEBUG_INFO=y
# CONFIG_DEBUG_INFO_NONE is not set
CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
# CONFIG_DEBUG_INFO_DWARF4 is not set
# CONFIG_DEBUG_INFO_DWARF5 is not set
CONFIG_DEBUG_INFO_REDUCED=y
# CONFIG_DEBUG_INFO_SPLIT is not set
CONFIG_PAHOLE_HAS_SPLIT_BTF=y
CONFIG_PAHOLE_HAS_BTF_TAG=y
# CONFIG_GDB_SCRIPTS is not set
CONFIG_FRAME_WARN=8192
# CONFIG_STRIP_ASM_SYMS is not set
CONFIG_HEADERS_INSTALL=y
CONFIG_SECTION_MISMATCH_WARN_ONLY=y
CONFIG_FRAME_POINTER=y
CONFIG_OBJTOOL=y
CONFIG_STACK_VALIDATION=y
# CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
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
CONFIG_DEBUG_FS_DISALLOW_MOUNT=y
# CONFIG_DEBUG_FS_ALLOW_NONE is not set
CONFIG_HAVE_ARCH_KGDB=y
# CONFIG_KGDB is not set
CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=y
CONFIG_UBSAN=y
# CONFIG_UBSAN_TRAP is not set
CONFIG_CC_HAS_UBSAN_BOUNDS=y
CONFIG_CC_HAS_UBSAN_ARRAY_BOUNDS=y
CONFIG_UBSAN_BOUNDS=y
CONFIG_UBSAN_ARRAY_BOUNDS=y
CONFIG_UBSAN_SHIFT=y
# CONFIG_UBSAN_BOOL is not set
# CONFIG_UBSAN_ENUM is not set
# CONFIG_UBSAN_ALIGNMENT is not set
CONFIG_UBSAN_SANITIZE_ALL=y
# CONFIG_TEST_UBSAN is not set
CONFIG_HAVE_ARCH_KCSAN=y
CONFIG_HAVE_KCSAN_COMPILER=y
# end of Generic Kernel Debugging Instruments

#
# Networking Debugging
#
# CONFIG_NET_DEV_REFCNT_TRACKER is not set
# CONFIG_NET_NS_REFCNT_TRACKER is not set
# CONFIG_DEBUG_NET is not set
# end of Networking Debugging

#
# Memory Debugging
#
CONFIG_PAGE_EXTENSION=y
# CONFIG_DEBUG_PAGEALLOC is not set
CONFIG_SLUB_DEBUG=y
# CONFIG_SLUB_DEBUG_ON is not set
CONFIG_PAGE_OWNER=y
CONFIG_PAGE_TABLE_CHECK=y
CONFIG_PAGE_TABLE_CHECK_ENFORCED=y
CONFIG_PAGE_POISONING=y
# CONFIG_DEBUG_PAGE_REF is not set
# CONFIG_DEBUG_RODATA_TEST is not set
CONFIG_ARCH_HAS_DEBUG_WX=y
CONFIG_DEBUG_WX=y
CONFIG_GENERIC_PTDUMP=y
CONFIG_PTDUMP_CORE=y
# CONFIG_PTDUMP_DEBUGFS is not set
# CONFIG_DEBUG_OBJECTS is not set
# CONFIG_SHRINKER_DEBUG is not set
CONFIG_HAVE_DEBUG_KMEMLEAK=y
# CONFIG_DEBUG_KMEMLEAK is not set
# CONFIG_DEBUG_STACK_USAGE is not set
# CONFIG_SCHED_STACK_END_CHECK is not set
CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE=y
# CONFIG_DEBUG_VM is not set
CONFIG_DEBUG_VM_PGTABLE=y
CONFIG_ARCH_HAS_DEBUG_VIRTUAL=y
# CONFIG_DEBUG_VIRTUAL is not set
CONFIG_DEBUG_MEMORY_INIT=y
# CONFIG_DEBUG_PER_CPU_MAPS is not set
CONFIG_ARCH_SUPPORTS_KMAP_LOCAL_FORCE_MAP=y
# CONFIG_DEBUG_KMAP_LOCAL_FORCE_MAP is not set
CONFIG_HAVE_ARCH_KASAN=y
CONFIG_HAVE_ARCH_KASAN_VMALLOC=y
CONFIG_CC_HAS_KASAN_GENERIC=y
CONFIG_CC_HAS_KASAN_SW_TAGS=y
CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=y
CONFIG_KASAN=y
CONFIG_KASAN_GENERIC=y
# CONFIG_KASAN_OUTLINE is not set
CONFIG_KASAN_INLINE=y
# CONFIG_KASAN_STACK is not set
CONFIG_KASAN_VMALLOC=y
# CONFIG_KASAN_MODULE_TEST is not set
CONFIG_HAVE_ARCH_KFENCE=y
# CONFIG_KFENCE is not set
# end of Memory Debugging

# CONFIG_DEBUG_SHIRQ is not set

#
# Debug Oops, Lockups and Hangs
#
CONFIG_PANIC_ON_OOPS=y
CONFIG_PANIC_ON_OOPS_VALUE=1
CONFIG_PANIC_TIMEOUT=0
CONFIG_LOCKUP_DETECTOR=y
CONFIG_SOFTLOCKUP_DETECTOR=y
# CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
CONFIG_HARDLOCKUP_CHECK_TIMESTAMP=y
# CONFIG_HARDLOCKUP_DETECTOR is not set
CONFIG_DETECT_HUNG_TASK=y
CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=480
# CONFIG_BOOTPARAM_HUNG_TASK_PANIC is not set
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

CONFIG_DEBUG_TIMEKEEPING=y

#
# Lock Debugging (spinlocks, mutexes, etc...)
#
CONFIG_LOCK_DEBUGGING_SUPPORT=y
CONFIG_PROVE_LOCKING=y
# CONFIG_PROVE_RAW_LOCK_NESTING is not set
# CONFIG_LOCK_STAT is not set
CONFIG_DEBUG_RT_MUTEXES=y
CONFIG_DEBUG_SPINLOCK=y
CONFIG_DEBUG_MUTEXES=y
CONFIG_DEBUG_WW_MUTEX_SLOWPATH=y
CONFIG_DEBUG_RWSEMS=y
CONFIG_DEBUG_LOCK_ALLOC=y
CONFIG_LOCKDEP=y
CONFIG_LOCKDEP_BITS=15
CONFIG_LOCKDEP_CHAINS_BITS=16
CONFIG_LOCKDEP_STACK_TRACE_BITS=19
CONFIG_LOCKDEP_STACK_TRACE_HASH_BITS=14
CONFIG_LOCKDEP_CIRCULAR_QUEUE_BITS=12
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
CONFIG_DEBUG_IRQFLAGS=y
CONFIG_STACKTRACE=y
# CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
# CONFIG_DEBUG_KOBJECT is not set

#
# Debug kernel data structures
#
# CONFIG_DEBUG_LIST is not set
# CONFIG_DEBUG_PLIST is not set
# CONFIG_DEBUG_SG is not set
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
CONFIG_RCU_EXP_CPU_STALL_TIMEOUT=0
CONFIG_RCU_TRACE=y
# CONFIG_RCU_EQS_DEBUG is not set
# end of RCU Debugging

# CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
# CONFIG_CPU_HOTPLUG_STATE_CONTROL is not set
CONFIG_LATENCYTOP=y
CONFIG_USER_STACKTRACE_SUPPORT=y
CONFIG_NOP_TRACER=y
CONFIG_HAVE_RETHOOK=y
CONFIG_RETHOOK=y
CONFIG_HAVE_FUNCTION_TRACER=y
CONFIG_HAVE_DYNAMIC_FTRACE=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS=y
CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
CONFIG_HAVE_FENTRY=y
CONFIG_HAVE_OBJTOOL_MCOUNT=y
CONFIG_HAVE_C_RECORDMCOUNT=y
CONFIG_HAVE_BUILDTIME_MCOUNT_SORT=y
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
# CONFIG_OSNOISE_TRACER is not set
# CONFIG_TIMERLAT_TRACER is not set
# CONFIG_MMIOTRACE is not set
# CONFIG_ENABLE_DEFAULT_TRACERS is not set
# CONFIG_FTRACE_SYSCALLS is not set
# CONFIG_TRACER_SNAPSHOT is not set
CONFIG_BRANCH_PROFILE_NONE=y
# CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
# CONFIG_BLK_DEV_IO_TRACE is not set
CONFIG_KPROBE_EVENTS=y
CONFIG_UPROBE_EVENTS=y
CONFIG_DYNAMIC_EVENTS=y
CONFIG_PROBE_EVENTS=y
# CONFIG_SYNTH_EVENTS is not set
# CONFIG_HIST_TRIGGERS is not set
# CONFIG_TRACE_EVENT_INJECT is not set
# CONFIG_TRACEPOINT_BENCHMARK is not set
# CONFIG_RING_BUFFER_BENCHMARK is not set
# CONFIG_TRACE_EVAL_MAP_FILE is not set
# CONFIG_RING_BUFFER_STARTUP_TEST is not set
# CONFIG_RING_BUFFER_VALIDATE_TIME_DELTAS is not set
# CONFIG_PREEMPTIRQ_DELAY_TEST is not set
# CONFIG_KPROBE_EVENT_GEN_TEST is not set
# CONFIG_RV is not set
# CONFIG_PROVIDE_OHCI1394_DMA_INIT is not set
CONFIG_SAMPLES=y
CONFIG_SAMPLE_AUXDISPLAY=y
# CONFIG_SAMPLE_TRACE_EVENTS is not set
# CONFIG_SAMPLE_TRACE_CUSTOM_EVENTS is not set
# CONFIG_SAMPLE_TRACE_PRINTK is not set
# CONFIG_SAMPLE_TRACE_ARRAY is not set
CONFIG_SAMPLE_KOBJECT=m
CONFIG_SAMPLE_KPROBES=m
# CONFIG_SAMPLE_KRETPROBES is not set
CONFIG_SAMPLE_HW_BREAKPOINT=m
CONFIG_SAMPLE_KFIFO=m
CONFIG_SAMPLE_RPMSG_CLIENT=m
# CONFIG_SAMPLE_CONFIGFS is not set
# CONFIG_SAMPLE_CONNECTOR is not set
CONFIG_SAMPLE_HIDRAW=y
# CONFIG_SAMPLE_LANDLOCK is not set
# CONFIG_SAMPLE_PIDFD is not set
CONFIG_SAMPLE_SECCOMP=y
# CONFIG_SAMPLE_TIMER is not set
# CONFIG_SAMPLE_UHID is not set
# CONFIG_SAMPLE_VFIO_MDEV_MTTY is not set
CONFIG_SAMPLE_VFIO_MDEV_MDPY=m
CONFIG_SAMPLE_VFIO_MDEV_MDPY_FB=m
# CONFIG_SAMPLE_VFIO_MDEV_MBOCHS is not set
CONFIG_SAMPLE_ANDROID_BINDERFS=y
# CONFIG_SAMPLE_VFS is not set
CONFIG_SAMPLE_WATCHDOG=y
CONFIG_SAMPLE_WATCH_QUEUE=y
CONFIG_HAVE_SAMPLE_FTRACE_DIRECT=y
CONFIG_HAVE_SAMPLE_FTRACE_DIRECT_MULTI=y
CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=y
# CONFIG_STRICT_DEVMEM is not set

#
# x86 Debugging
#
CONFIG_EARLY_PRINTK_USB=y
CONFIG_X86_VERBOSE_BOOTUP=y
CONFIG_EARLY_PRINTK=y
CONFIG_EARLY_PRINTK_DBGP=y
CONFIG_EARLY_PRINTK_USB_XDBC=y
CONFIG_EFI_PGT_DUMP=y
# CONFIG_DEBUG_TLBFLUSH is not set
CONFIG_HAVE_MMIOTRACE_SUPPORT=y
# CONFIG_X86_DECODER_SELFTEST is not set
CONFIG_IO_DELAY_0X80=y
# CONFIG_IO_DELAY_0XED is not set
# CONFIG_IO_DELAY_UDELAY is not set
# CONFIG_IO_DELAY_NONE is not set
# CONFIG_DEBUG_BOOT_PARAMS is not set
# CONFIG_CPA_DEBUG is not set
# CONFIG_DEBUG_ENTRY is not set
# CONFIG_DEBUG_NMI_SELFTEST is not set
CONFIG_X86_DEBUG_FPU=y
# CONFIG_PUNIT_ATOM_DEBUG is not set
# CONFIG_UNWINDER_ORC is not set
CONFIG_UNWINDER_FRAME_POINTER=y
# end of x86 Debugging

#
# Kernel Testing and Coverage
#
# CONFIG_KUNIT is not set
# CONFIG_NOTIFIER_ERROR_INJECTION is not set
CONFIG_FUNCTION_ERROR_INJECTION=y
# CONFIG_FAULT_INJECTION is not set
CONFIG_ARCH_HAS_KCOV=y
CONFIG_CC_HAS_SANCOV_TRACE_PC=y
CONFIG_KCOV=y
CONFIG_KCOV_ENABLE_COMPARISONS=y
CONFIG_KCOV_INSTRUMENT_ALL=y
CONFIG_KCOV_IRQ_AREA_SIZE=0x40000
CONFIG_RUNTIME_TESTING_MENU=y
# CONFIG_LKDTM is not set
# CONFIG_TEST_MIN_HEAP is not set
# CONFIG_TEST_DIV64 is not set
# CONFIG_BACKTRACE_SELF_TEST is not set
# CONFIG_TEST_REF_TRACKER is not set
# CONFIG_RBTREE_TEST is not set
# CONFIG_REED_SOLOMON_TEST is not set
# CONFIG_INTERVAL_TREE_TEST is not set
# CONFIG_PERCPU_TEST is not set
# CONFIG_ATOMIC64_SELFTEST is not set
# CONFIG_TEST_HEXDUMP is not set
# CONFIG_STRING_SELFTEST is not set
# CONFIG_TEST_STRING_HELPERS is not set
# CONFIG_TEST_STRSCPY is not set
# CONFIG_TEST_KSTRTOX is not set
# CONFIG_TEST_PRINTF is not set
# CONFIG_TEST_SCANF is not set
# CONFIG_TEST_BITMAP is not set
# CONFIG_TEST_UUID is not set
# CONFIG_TEST_XARRAY is not set
# CONFIG_TEST_RHASHTABLE is not set
# CONFIG_TEST_SIPHASH is not set
# CONFIG_TEST_IDA is not set
# CONFIG_TEST_LKM is not set
# CONFIG_TEST_BITOPS is not set
# CONFIG_TEST_VMALLOC is not set
# CONFIG_TEST_USER_COPY is not set
# CONFIG_TEST_BPF is not set
# CONFIG_TEST_BLACKHOLE_DEV is not set
# CONFIG_FIND_BIT_BENCHMARK is not set
# CONFIG_TEST_FIRMWARE is not set
# CONFIG_TEST_SYSCTL is not set
# CONFIG_TEST_UDELAY is not set
# CONFIG_TEST_STATIC_KEYS is not set
# CONFIG_TEST_MEMCAT_P is not set
# CONFIG_TEST_MEMINIT is not set
# CONFIG_TEST_FREE_PAGES is not set
# CONFIG_TEST_CLOCKSOURCE_WATCHDOG is not set
CONFIG_ARCH_USE_MEMTEST=y
# CONFIG_MEMTEST is not set
# end of Kernel Testing and Coverage
# end of Kernel hacking

--aFyeVoEmScvBAg7o--
