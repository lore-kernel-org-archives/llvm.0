Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645CB1104;
	Mon, 20 Mar 2023 06:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679294737; x=1710830737;
  h=date:from:cc:subject:message-id:mime-version;
  bh=uy2SIMQKE5gl0etjQr1tonhDCwdBtX7OoCpb8ku4cMI=;
  b=EI/frT9VViA4XrofRvCiyZ15Gm37xWbj3kv4dwMWWyRgT2H34/ESexul
   5yC7jIkO486IedZuUYTtbyxrr0CLCuMW098DAU+sc9kOHk99z2SqRJBpx
   JsTRLX4J/DR9m4QNfW1sUHRS6T0zDOcdtk1dYeJ+pT+1xu/j97vi7q3EB
   +ZYYY+jqExpbWMLmoLhJf1OLPqtlUlu1/DCreOos5QR6VOkG9WkW80eGX
   a4GI21Xa0wlKWDzF2dQxUIoHgjPSoAaXI3QhtxnvEXo3U+ebJjZYiCk/1
   IPVKMOoBRdXD4yZV5lsuiXxe7j3d8H5SFk+Bp2cjR4PlKodBeONYkTHvQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="337303553"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="337303553"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2023 23:45:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="631014344"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="631014344"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 19 Mar 2023 23:45:32 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pe9Gu-000AsM-0v;
	Mon, 20 Mar 2023 06:45:32 +0000
Date: Mon, 20 Mar 2023 14:44:53 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: kernel/bpf/core.o: warning: objtool: ___bpf_prog_run+0x252: sibling
 call from callable instruction with modified stack frame
Message-ID: <202303201433.hGCX2OqU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Alexander Potapenko <glider@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e8d018dd0257f744ca50a729e3d042cf2ec9da65
commit: 4ca8cc8d1bbe582bfc7a4d80bd72cfd8d3d0e2e8 x86: kmsan: enable KMSAN builds for x86
date:   6 months ago
config: x86_64-buildonly-randconfig-r005-20230320 (https://download.01.org/0day-ci/archive/20230320/202303201433.hGCX2OqU-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=4ca8cc8d1bbe582bfc7a4d80bd72cfd8d3d0e2e8
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 4ca8cc8d1bbe582bfc7a4d80bd72cfd8d3d0e2e8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303201433.hGCX2OqU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/core.c:1623:12: warning: no previous prototype for function 'bpf_probe_read_kernel' [-Wmissing-prototypes]
   u64 __weak bpf_probe_read_kernel(void *dst, u32 size, const void *unsafe_ptr)
              ^
   kernel/bpf/core.c:1623:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   u64 __weak bpf_probe_read_kernel(void *dst, u32 size, const void *unsafe_ptr)
   ^
   static 
   kernel/bpf/core.c:2062:6: warning: no previous prototype for function 'bpf_patch_call_args' [-Wmissing-prototypes]
   void bpf_patch_call_args(struct bpf_insn *insn, u32 stack_depth)
        ^
   kernel/bpf/core.c:2062:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void bpf_patch_call_args(struct bpf_insn *insn, u32 stack_depth)
   ^
   static 
   2 warnings generated.
>> kernel/bpf/core.o: warning: objtool: ___bpf_prog_run+0x252: sibling call from callable instruction with modified stack frame


objdump-func vmlinux.o ___bpf_prog_run:
0000 000000000093e840 <___bpf_prog_run>:
0000   93e840:	55                   	push   %rbp
0001   93e841:	41 57                	push   %r15
0003   93e843:	41 56                	push   %r14
0005   93e845:	41 55                	push   %r13
0007   93e847:	41 54                	push   %r12
0009   93e849:	53                   	push   %rbx
000a   93e84a:	48 81 ec d0 00 00 00 	sub    $0xd0,%rsp
0011   93e851:	49 89 f5             	mov    %rsi,%r13
0014   93e854:	48 89 fb             	mov    %rdi,%rbx
0017   93e857:	48 89 7c 24 30       	mov    %rdi,0x30(%rsp)
001c   93e85c:	e8 00 00 00 00       	call   93e861 <___bpf_prog_run+0x21>	93e85d: R_X86_64_PLT32	__msan_get_context_state-0x4
0021   93e861:	48 8b 08             	mov    (%rax),%rcx
0024   93e864:	48 89 4c 24 20       	mov    %rcx,0x20(%rsp)
0029   93e869:	4c 8b 70 08          	mov    0x8(%rax),%r14
002d   93e86d:	8b 88 88 0c 00 00    	mov    0xc88(%rax),%ecx
0033   93e873:	89 4c 24 04          	mov    %ecx,0x4(%rsp)
0037   93e877:	48 89 44 24 68       	mov    %rax,0x68(%rsp)
003c   93e87c:	8b 80 90 0c 00 00    	mov    0xc90(%rax),%eax
0042   93e882:	89 04 24             	mov    %eax,(%rsp)
0045   93e885:	e8 00 00 00 00       	call   93e88a <___bpf_prog_run+0x4a>	93e886: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
004a   93e88a:	48 8d 43 08          	lea    0x8(%rbx),%rax
004e   93e88e:	48 89 84 24 b0 00 00 00 	mov    %rax,0xb0(%rsp)
0056   93e896:	48 8d 43 10          	lea    0x10(%rbx),%rax
005a   93e89a:	48 89 84 24 90 00 00 00 	mov    %rax,0x90(%rsp)
0062   93e8a2:	48 8d 43 18          	lea    0x18(%rbx),%rax
0066   93e8a6:	48 89 84 24 88 00 00 00 	mov    %rax,0x88(%rsp)
006e   93e8ae:	48 8d 43 20          	lea    0x20(%rbx),%rax
0072   93e8b2:	48 89 84 24 a8 00 00 00 	mov    %rax,0xa8(%rsp)
007a   93e8ba:	48 8d 43 28          	lea    0x28(%rbx),%rax
007e   93e8be:	48 89 84 24 a0 00 00 00 	mov    %rax,0xa0(%rsp)
0086   93e8c6:	48 8d 43 58          	lea    0x58(%rbx),%rax
008a   93e8ca:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
008f   93e8cf:	c7 44 24 74 00 00 00 00 	movl   $0x0,0x74(%rsp)
0097   93e8d7:	eb 26                	jmp    93e8ff <___bpf_prog_run+0xbf>
0099   93e8d9:	e8 00 00 00 00       	call   93e8de <___bpf_prog_run+0x9e>	93e8da: R_X86_64_PLT32	__msan_chain_origin-0x4
009e   93e8de:	89 c0                	mov    %eax,%eax
00a0   93e8e0:	48 89 c1             	mov    %rax,%rcx
00a3   93e8e3:	48 c1 e1 20          	shl    $0x20,%rcx
00a7   93e8e7:	48 09 c1             	or     %rax,%rcx
00aa   93e8ea:	49 89 0e             	mov    %rcx,(%r14)
00ad   93e8ed:	4d 89 65 00          	mov    %r12,0x0(%r13)
00b1   93e8f1:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
00b6   93e8f6:	49 83 c5 08          	add    $0x8,%r13
00ba   93e8fa:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
00bf   93e8ff:	4d 85 f6             	test   %r14,%r14
00c2   93e902:	0f 85 67 01 00 00    	jne    93ea6f <___bpf_prog_run+0x22f>
00c8   93e908:	45 0f b6 7d 00       	movzbl 0x0(%r13),%r15d
00cd   93e90d:	4c 89 ef             	mov    %r13,%rdi
00d0   93e910:	e8 00 00 00 00       	call   93e915 <___bpf_prog_run+0xd5>	93e911: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
00d5   93e915:	40 8a 28             	mov    (%rax),%bpl
00d8   93e918:	44 8b 22             	mov    (%rdx),%r12d
00db   93e91b:	bf 00 00 00 00       	mov    $0x0,%edi
00e0   93e920:	40 84 ed             	test   %bpl,%bpl
00e3   93e923:	41 0f 45 fc          	cmovne %r12d,%edi
00e7   93e927:	0f 85 4f 01 00 00    	jne    93ea7c <___bpf_prog_run+0x23c>
00ed   93e92d:	4a 8d 1c fd 00 00 00 00 	lea    0x0(,%r15,8),%rbx	93e931: R_X86_64_32S	.rodata..c_jump_table
00f5   93e935:	48 89 df             	mov    %rbx,%rdi
00f8   93e938:	e8 00 00 00 00       	call   93e93d <___bpf_prog_run+0xfd>	93e939: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
00fd   93e93d:	48 83 38 00          	cmpq   $0x0,(%rax)
0101   93e941:	0f 85 3f 01 00 00    	jne    93ea86 <___bpf_prog_run+0x246>
0107   93e947:	4c 89 74 24 10       	mov    %r14,0x10(%rsp)
010c   93e94c:	ff 23                	jmp    *(%rbx)
010e   93e94e:	48 8b 5c 24 20       	mov    0x20(%rsp),%rbx
0113   93e953:	48 85 db             	test   %rbx,%rbx
0116   93e956:	0f 85 11 89 00 00    	jne    94726d <___bpf_prog_run+0x8a2d>
011c   93e95c:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
0121   93e961:	48 8b bc 24 90 00 00 00 	mov    0x90(%rsp),%rdi
0129   93e969:	48 8b 2f             	mov    (%rdi),%rbp
012c   93e96c:	e8 00 00 00 00       	call   93e971 <___bpf_prog_run+0x131>	93e96d: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
0131   93e971:	4c 8b 38             	mov    (%rax),%r15
0134   93e974:	8b 02                	mov    (%rdx),%eax
0136   93e976:	89 44 24 08          	mov    %eax,0x8(%rsp)
013a   93e97a:	48 85 db             	test   %rbx,%rbx
013d   93e97d:	0f 85 f8 88 00 00    	jne    94727b <___bpf_prog_run+0x8a3b>
0143   93e983:	48 8b bc 24 88 00 00 00 	mov    0x88(%rsp),%rdi
014b   93e98b:	4c 8b 27             	mov    (%rdi),%r12
014e   93e98e:	e8 00 00 00 00       	call   93e993 <___bpf_prog_run+0x153>	93e98f: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
0153   93e993:	4c 8b 30             	mov    (%rax),%r14
0156   93e996:	44 8b 2a             	mov    (%rdx),%r13d
0159   93e999:	48 89 6c 24 18       	mov    %rbp,0x18(%rsp)
015e   93e99e:	48 83 c5 1c          	add    $0x1c,%rbp
0162   93e9a2:	4d 85 ff             	test   %r15,%r15
0165   93e9a5:	0f 85 de 88 00 00    	jne    947289 <___bpf_prog_run+0x8a49>
016b   93e9ab:	8b 5d 00             	mov    0x0(%rbp),%ebx
016e   93e9ae:	48 89 ef             	mov    %rbp,%rdi
0171   93e9b1:	e8 00 00 00 00       	call   93e9b6 <___bpf_prog_run+0x176>	93e9b2: R_X86_64_PLT32	__msan_metadata_ptr_for_load_4-0x4
0176   93e9b6:	44 89 e9             	mov    %r13d,%ecx
0179   93e9b9:	45 85 f6             	test   %r14d,%r14d
017c   93e9bc:	75 02                	jne    93e9c0 <___bpf_prog_run+0x180>
017e   93e9be:	8b 0a                	mov    (%rdx),%ecx
0180   93e9c0:	4c 89 e5             	mov    %r12,%rbp
0183   93e9c3:	39 eb                	cmp    %ebp,%ebx
0185   93e9c5:	40 0f 96 c6          	setbe  %sil
0189   93e9c9:	83 7c 24 74 21       	cmpl   $0x21,0x74(%rsp)
018e   93e9ce:	0f 93 c3             	setae  %bl
0191   93e9d1:	0f 92 c2             	setb   %dl
0194   93e9d4:	31 ff                	xor    %edi,%edi
0196   93e9d6:	8b 00                	mov    (%rax),%eax
0198   93e9d8:	44 09 f0             	or     %r14d,%eax
019b   93e9db:	0f 45 f9             	cmovne %ecx,%edi
019e   93e9de:	0f 95 c0             	setne  %al
01a1   93e9e1:	20 d0                	and    %dl,%al
01a3   93e9e3:	40 08 f3             	or     %sil,%bl
01a6   93e9e6:	3c 01                	cmp    $0x1,%al
01a8   93e9e8:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
01ad   93e9ed:	0f 84 a4 88 00 00    	je     947297 <___bpf_prog_run+0x8a57>
01b3   93e9f3:	84 db                	test   %bl,%bl
01b5   93e9f5:	0f 85 a9 88 00 00    	jne    9472a4 <___bpf_prog_run+0x8a64>
01bb   93e9fb:	44 89 f0             	mov    %r14d,%eax
01be   93e9fe:	48 85 c0             	test   %rax,%rax
01c1   93ea01:	8b 7c 24 08          	mov    0x8(%rsp),%edi
01c5   93ea05:	41 0f 45 fd          	cmovne %r13d,%edi
01c9   93ea09:	49 09 c7             	or     %rax,%r15
01cc   93ea0c:	0f 85 18 a5 00 00    	jne    948f2a <___bpf_prog_run+0xa6ea>
01d2   93ea12:	89 e8                	mov    %ebp,%eax
01d4   93ea14:	49 8d 3c c4          	lea    (%r12,%rax,8),%rdi
01d8   93ea18:	48 81 c7 10 02 00 00 	add    $0x210,%rdi
01df   93ea1f:	4c 8b 2f             	mov    (%rdi),%r13
01e2   93ea22:	e8 00 00 00 00       	call   93ea27 <___bpf_prog_run+0x1e7>	93ea23: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
01e7   93ea27:	48 8b 18             	mov    (%rax),%rbx
01ea   93ea2a:	44 8b 32             	mov    (%rdx),%r14d
01ed   93ea2d:	48 85 db             	test   %rbx,%rbx
01f0   93ea30:	74 0f                	je     93ea41 <___bpf_prog_run+0x201>
01f2   93ea32:	48 89 d8             	mov    %rbx,%rax
01f5   93ea35:	48 f7 d0             	not    %rax
01f8   93ea38:	4c 21 e8             	and    %r13,%rax
01fb   93ea3b:	0f 84 f3 a4 00 00    	je     948f34 <___bpf_prog_run+0xa6f4>
0201   93ea41:	83 44 24 74 01       	addl   $0x1,0x74(%rsp)
0206   93ea46:	4d 85 ed             	test   %r13,%r13
0209   93ea49:	4c 8b 7c 24 28       	mov    0x28(%rsp),%r15
020e   93ea4e:	74 15                	je     93ea65 <___bpf_prog_run+0x225>
0210   93ea50:	e8 00 00 00 00       	call   93ea55 <___bpf_prog_run+0x215>	93ea51: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0215   93ea55:	49 83 c5 48          	add    $0x48,%r13
0219   93ea59:	44 89 34 24          	mov    %r14d,(%rsp)
021d   93ea5d:	49 89 de             	mov    %rbx,%r14
0220   93ea60:	e9 9a fe ff ff       	jmp    93e8ff <___bpf_prog_run+0xbf>
0225   93ea65:	e8 00 00 00 00       	call   93ea6a <___bpf_prog_run+0x22a>	93ea66: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
022a   93ea6a:	e9 3f 50 00 00       	jmp    943aae <___bpf_prog_run+0x526e>
022f   93ea6f:	8b 3c 24             	mov    (%rsp),%edi
0232   93ea72:	e8 00 00 00 00       	call   93ea77 <___bpf_prog_run+0x237>	93ea73: R_X86_64_PLT32	__msan_warning-0x4
0237   93ea77:	e9 8c fe ff ff       	jmp    93e908 <___bpf_prog_run+0xc8>
023c   93ea7c:	e8 00 00 00 00       	call   93ea81 <___bpf_prog_run+0x241>	93ea7d: R_X86_64_PLT32	__msan_warning-0x4
0241   93ea81:	e9 a7 fe ff ff       	jmp    93e92d <___bpf_prog_run+0xed>
0246   93ea86:	8b 3a                	mov    (%rdx),%edi
0248   93ea88:	e8 00 00 00 00       	call   93ea8d <___bpf_prog_run+0x24d>	93ea89: R_X86_64_PLT32	__msan_warning-0x4
024d   93ea8d:	4c 89 74 24 10       	mov    %r14,0x10(%rsp)
0252   93ea92:	ff 23                	jmp    *(%rbx)
0254   93ea94:	e8 00 00 00 00       	call   93ea99 <___bpf_prog_run+0x259>	93ea95: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0259   93ea99:	49 8d 5d 04          	lea    0x4(%r13),%rbx
025d   93ea9d:	4d 85 f6             	test   %r14,%r14
0260   93eaa0:	0f 85 0d 88 00 00    	jne    9472b3 <___bpf_prog_run+0x8a73>
0266   93eaa6:	4c 63 3b             	movslq (%rbx),%r15
0269   93eaa9:	48 89 df             	mov    %rbx,%rdi
026c   93eaac:	e8 00 00 00 00       	call   93eab1 <___bpf_prog_run+0x271>	93eaad: R_X86_64_PLT32	__msan_metadata_ptr_for_load_4-0x4
0271   93eab1:	48 8b 5c 24 20       	mov    0x20(%rsp),%rbx
0276   93eab6:	48 85 db             	test   %rbx,%rbx
0279   93eab9:	0f 85 01 88 00 00    	jne    9472c0 <___bpf_prog_run+0x8a80>
027f   93eabf:	48 8b bc 24 b0 00 00 00 	mov    0xb0(%rsp),%rdi
0287   93eac7:	48 8b 07             	mov    (%rdi),%rax
028a   93eaca:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
028f   93eacf:	e8 00 00 00 00       	call   93ead4 <___bpf_prog_run+0x294>	93ead0: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
0294   93ead4:	48 8b 00             	mov    (%rax),%rax
0297   93ead7:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
029c   93eadc:	8b 02                	mov    (%rdx),%eax
029e   93eade:	89 44 24 40          	mov    %eax,0x40(%rsp)
02a2   93eae2:	48 85 db             	test   %rbx,%rbx
02a5   93eae5:	0f 85 e3 87 00 00    	jne    9472ce <___bpf_prog_run+0x8a8e>
02ab   93eaeb:	48 8b bc 24 90 00 00 00 	mov    0x90(%rsp),%rdi
02b3   93eaf3:	48 8b 07             	mov    (%rdi),%rax
02b6   93eaf6:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
02bb   93eafb:	e8 00 00 00 00       	call   93eb00 <___bpf_prog_run+0x2c0>	93eafc: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
02c0   93eb00:	48 8b 00             	mov    (%rax),%rax
02c3   93eb03:	48 89 44 24 58       	mov    %rax,0x58(%rsp)
02c8   93eb08:	8b 02                	mov    (%rdx),%eax
02ca   93eb0a:	89 44 24 4c          	mov    %eax,0x4c(%rsp)
02ce   93eb0e:	48 85 db             	test   %rbx,%rbx
02d1   93eb11:	0f 85 c5 87 00 00    	jne    9472dc <___bpf_prog_run+0x8a9c>
02d7   93eb17:	48 8b bc 24 88 00 00 00 	mov    0x88(%rsp),%rdi
02df   93eb1f:	48 8b 07             	mov    (%rdi),%rax
02e2   93eb22:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
02e7   93eb27:	e8 00 00 00 00       	call   93eb2c <___bpf_prog_run+0x2ec>	93eb28: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
02ec   93eb2c:	48 8b 00             	mov    (%rax),%rax
02ef   93eb2f:	48 89 44 24 78       	mov    %rax,0x78(%rsp)
02f4   93eb34:	8b 02                	mov    (%rdx),%eax
02f6   93eb36:	89 44 24 70          	mov    %eax,0x70(%rsp)
02fa   93eb3a:	48 85 db             	test   %rbx,%rbx
02fd   93eb3d:	0f 85 a7 87 00 00    	jne    9472ea <___bpf_prog_run+0x8aaa>
0303   93eb43:	48 8b bc 24 a8 00 00 00 	mov    0xa8(%rsp),%rdi
030b   93eb4b:	48 8b 07             	mov    (%rdi),%rax
030e   93eb4e:	48 89 84 24 80 00 00 00 	mov    %rax,0x80(%rsp)
0316   93eb56:	e8 00 00 00 00       	call   93eb5b <___bpf_prog_run+0x31b>	93eb57: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
031b   93eb5b:	48 8b 00             	mov    (%rax),%rax
031e   93eb5e:	48 89 84 24 c0 00 00 00 	mov    %rax,0xc0(%rsp)
0326   93eb66:	8b 02                	mov    (%rdx),%eax
0328   93eb68:	89 84 24 9c 00 00 00 	mov    %eax,0x9c(%rsp)
032f   93eb6f:	48 85 db             	test   %rbx,%rbx
0332   93eb72:	0f 85 80 87 00 00    	jne    9472f8 <___bpf_prog_run+0x8ab8>
0338   93eb78:	48 8b bc 24 a0 00 00 00 	mov    0xa0(%rsp),%rdi
0340   93eb80:	48 8b 07             	mov    (%rdi),%rax
0343   93eb83:	48 89 84 24 c8 00 00 00 	mov    %rax,0xc8(%rsp)
034b   93eb8b:	e8 00 00 00 00       	call   93eb90 <___bpf_prog_run+0x350>	93eb8c: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
0350   93eb90:	4d 8d 75 02          	lea    0x2(%r13),%r14
0354   93eb94:	4c 8b 20             	mov    (%rax),%r12
0357   93eb97:	8b 2a                	mov    (%rdx),%ebp
0359   93eb99:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
035e   93eb9e:	48 85 db             	test   %rbx,%rbx
0361   93eba1:	0f 85 5f 87 00 00    	jne    947306 <___bpf_prog_run+0x8ac6>
0367   93eba7:	49 8d 87 00 00 00 00 	lea    0x0(%r15),%rax	93ebaa: R_X86_64_32S	__bpf_call_base
036e   93ebae:	48 89 84 24 b8 00 00 00 	mov    %rax,0xb8(%rsp)
0376   93ebb6:	4d 89 ef             	mov    %r13,%r15
0379   93ebb9:	4d 0f bf 6d 02       	movswq 0x2(%r13),%r13
037e   93ebbe:	4c 89 f7             	mov    %r14,%rdi
0381   93ebc1:	e8 00 00 00 00       	call   93ebc6 <___bpf_prog_run+0x386>	93ebc2: R_X86_64_PLT32	__msan_metadata_ptr_for_load_2-0x4
0386   93ebc6:	48 0f bf 30          	movswq (%rax),%rsi
038a   93ebca:	48 89 d8             	mov    %rbx,%rax
038d   93ebcd:	48 09 f0             	or     %rsi,%rax
0390   93ebd0:	8b 0c 24             	mov    (%rsp),%ecx
0393   93ebd3:	48 85 f6             	test   %rsi,%rsi
0396   93ebd6:	74 02                	je     93ebda <___bpf_prog_run+0x39a>
0398   93ebd8:	8b 0a                	mov    (%rdx),%ecx
039a   93ebda:	4f 8d 0c ef          	lea    (%r15,%r13,8),%r9
039e   93ebde:	49 83 c1 08          	add    $0x8,%r9
03a2   93ebe2:	4d 89 fd             	mov    %r15,%r13
03a5   93ebe5:	48 8b 5c 24 68       	mov    0x68(%rsp),%rbx
03aa   93ebea:	48 8b 54 24 38       	mov    0x38(%rsp),%rdx
03af   93ebef:	48 89 13             	mov    %rdx,(%rbx)
03b2   93ebf2:	8b 54 24 40          	mov    0x40(%rsp),%edx
03b6   93ebf6:	89 93 88 0c 00 00    	mov    %edx,0xc88(%rbx)
03bc   93ebfc:	48 8b 54 24 58       	mov    0x58(%rsp),%rdx
03c1   93ec01:	48 89 53 08          	mov    %rdx,0x8(%rbx)
03c5   93ec05:	8b 54 24 4c          	mov    0x4c(%rsp),%edx
03c9   93ec09:	89 93 90 0c 00 00    	mov    %edx,0xc90(%rbx)
03cf   93ec0f:	48 8b 54 24 78       	mov    0x78(%rsp),%rdx
03d4   93ec14:	48 89 53 10          	mov    %rdx,0x10(%rbx)
03d8   93ec18:	8b 54 24 70          	mov    0x70(%rsp),%edx
03dc   93ec1c:	89 93 98 0c 00 00    	mov    %edx,0xc98(%rbx)
03e2   93ec22:	48 8b 94 24 c0 00 00 00 	mov    0xc0(%rsp),%rdx
03ea   93ec2a:	48 89 53 18          	mov    %rdx,0x18(%rbx)
03ee   93ec2e:	8b 94 24 9c 00 00 00 	mov    0x9c(%rsp),%edx
03f5   93ec35:	89 93 a0 0c 00 00    	mov    %edx,0xca0(%rbx)
03fb   93ec3b:	4c 89 63 20          	mov    %r12,0x20(%rbx)
03ff   93ec3f:	89 ab a8 0c 00 00    	mov    %ebp,0xca8(%rbx)
0405   93ec45:	48 89 43 28          	mov    %rax,0x28(%rbx)
0409   93ec49:	89 8b b0 0c 00 00    	mov    %ecx,0xcb0(%rbx)
040f   93ec4f:	48 c7 83 20 03 00 00 00 00 00 00 	movq   $0x0,0x320(%rbx)
041a   93ec5a:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
041f   93ec5f:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
0424   93ec64:	48 8b 54 24 50       	mov    0x50(%rsp),%rdx
0429   93ec69:	48 8b 8c 24 80 00 00 00 	mov    0x80(%rsp),%rcx
0431   93ec71:	4c 8b 84 24 c8 00 00 00 	mov    0xc8(%rsp),%r8
0439   93ec79:	ff 94 24 b8 00 00 00 	call   *0xb8(%rsp)
0440   93ec80:	49 89 c4             	mov    %rax,%r12
0443   93ec83:	48 8b ab 20 03 00 00 	mov    0x320(%rbx),%rbp
044a   93ec8a:	44 8b b3 a8 0f 00 00 	mov    0xfa8(%rbx),%r14d
0451   93ec91:	48 83 7c 24 20 00    	cmpq   $0x0,0x20(%rsp)
0457   93ec97:	0f 85 76 86 00 00    	jne    947313 <___bpf_prog_run+0x8ad3>
045d   93ec9d:	48 8b 5c 24 30       	mov    0x30(%rsp),%rbx
0462   93eca2:	48 89 df             	mov    %rbx,%rdi
0465   93eca5:	e8 00 00 00 00       	call   93ecaa <___bpf_prog_run+0x46a>	93eca6: R_X86_64_PLT32	__msan_metadata_ptr_for_store_8-0x4
046a   93ecaa:	48 89 28             	mov    %rbp,(%rax)
046d   93ecad:	48 85 ed             	test   %rbp,%rbp
0470   93ecb0:	0f 85 6b 86 00 00    	jne    947321 <___bpf_prog_run+0x8ae1>
0476   93ecb6:	49 83 c5 08          	add    $0x8,%r13
047a   93ecba:	4c 89 23             	mov    %r12,(%rbx)
047d   93ecbd:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
0482   93ecc2:	e9 38 fc ff ff       	jmp    93e8ff <___bpf_prog_run+0xbf>
0487   93ecc7:	e8 00 00 00 00       	call   93eccc <___bpf_prog_run+0x48c>	93ecc8: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
048c   93eccc:	49 8d 5d 01          	lea    0x1(%r13),%rbx
0490   93ecd0:	4d 85 f6             	test   %r14,%r14
0493   93ecd3:	0f 85 67 86 00 00    	jne    947340 <___bpf_prog_run+0x8b00>
0499   93ecd9:	44 0f b6 23          	movzbl (%rbx),%r12d
049d   93ecdd:	48 89 df             	mov    %rbx,%rdi
04a0   93ece0:	e8 00 00 00 00       	call   93ece5 <___bpf_prog_run+0x4a5>	93ece1: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
04a5   93ece5:	44 0f b6 30          	movzbl (%rax),%r14d
04a9   93ece9:	8b 0a                	mov    (%rdx),%ecx
04ab   93eceb:	4c 89 f0             	mov    %r14,%rax
04ae   93ecee:	48 c1 e8 04          	shr    $0x4,%rax
04b2   93ecf2:	4c 89 e3             	mov    %r12,%rbx
04b5   93ecf5:	48 c1 eb 04          	shr    $0x4,%rbx
04b9   93ecf9:	48 85 c0             	test   %rax,%rax
04bc   93ecfc:	8b 7c 24 04          	mov    0x4(%rsp),%edi
04c0   93ed00:	89 4c 24 18          	mov    %ecx,0x18(%rsp)
04c4   93ed04:	0f 45 f9             	cmovne %ecx,%edi
04c7   93ed07:	48 0b 44 24 20       	or     0x20(%rsp),%rax
04cc   93ed0c:	0f 85 3b 86 00 00    	jne    94734d <___bpf_prog_run+0x8b0d>
04d2   93ed12:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
04d7   93ed17:	48 8d 3c d8          	lea    (%rax,%rbx,8),%rdi
04db   93ed1b:	48 8b 2f             	mov    (%rdi),%rbp
04de   93ed1e:	e8 00 00 00 00       	call   93ed23 <___bpf_prog_run+0x4e3>	93ed1f: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
04e3   93ed23:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
04e8   93ed28:	49 8d 5d 02          	lea    0x2(%r13),%rbx
04ec   93ed2c:	4c 8b 28             	mov    (%rax),%r13
04ef   93ed2f:	8b 02                	mov    (%rdx),%eax
04f1   93ed31:	89 44 24 08          	mov    %eax,0x8(%rsp)
04f5   93ed35:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
04fb   93ed3b:	0f 85 16 86 00 00    	jne    947357 <___bpf_prog_run+0x8b17>
0501   93ed41:	4c 0f bf 3b          	movswq (%rbx),%r15
0505   93ed45:	48 89 df             	mov    %rbx,%rdi
0508   93ed48:	e8 00 00 00 00       	call   93ed4d <___bpf_prog_run+0x50d>	93ed49: R_X86_64_PLT32	__msan_metadata_ptr_for_load_2-0x4
050d   93ed4d:	48 0f bf 00          	movswq (%rax),%rax
0511   93ed51:	48 85 c0             	test   %rax,%rax
0514   93ed54:	74 06                	je     93ed5c <___bpf_prog_run+0x51c>
0516   93ed56:	8b 0a                	mov    (%rdx),%ecx
0518   93ed58:	89 4c 24 08          	mov    %ecx,0x8(%rsp)
051c   93ed5c:	4c 01 fd             	add    %r15,%rbp
051f   93ed5f:	49 09 c5             	or     %rax,%r13
0522   93ed62:	0f 85 fc 85 00 00    	jne    947364 <___bpf_prog_run+0x8b24>
0528   93ed68:	4c 8b 6d 00          	mov    0x0(%rbp),%r13
052c   93ed6c:	48 89 ef             	mov    %rbp,%rdi
052f   93ed6f:	e8 00 00 00 00       	call   93ed74 <___bpf_prog_run+0x534>	93ed70: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
0534   93ed74:	48 8b 28             	mov    (%rax),%rbp
0537   93ed77:	44 8b 3a             	mov    (%rdx),%r15d
053a   93ed7a:	41 83 e6 0f          	and    $0xf,%r14d
053e   93ed7e:	41 83 e4 0f          	and    $0xf,%r12d
0542   93ed82:	4d 85 f6             	test   %r14,%r14
0545   93ed85:	8b 7c 24 18          	mov    0x18(%rsp),%edi
0549   93ed89:	0f 44 7c 24 04       	cmove  0x4(%rsp),%edi
054e   93ed8e:	4c 0b 74 24 20       	or     0x20(%rsp),%r14
0553   93ed93:	0f 84 33 63 00 00    	je     9450cc <___bpf_prog_run+0x688c>
0559   93ed99:	e8 00 00 00 00       	call   93ed9e <___bpf_prog_run+0x55e>	93ed9a: R_X86_64_PLT32	__msan_warning-0x4
055e   93ed9e:	e9 29 63 00 00       	jmp    9450cc <___bpf_prog_run+0x688c>
0563   93eda3:	49 8d 5d 01          	lea    0x1(%r13),%rbx
0567   93eda7:	4d 85 f6             	test   %r14,%r14
056a   93edaa:	0f 85 c2 85 00 00    	jne    947372 <___bpf_prog_run+0x8b32>
0570   93edb0:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
0575   93edb5:	44 0f b6 33          	movzbl (%rbx),%r14d
0579   93edb9:	48 89 df             	mov    %rbx,%rdi
057c   93edbc:	e8 00 00 00 00       	call   93edc1 <___bpf_prog_run+0x581>	93edbd: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
0581   93edc1:	0f b6 18             	movzbl (%rax),%ebx
0584   93edc4:	44 8b 22             	mov    (%rdx),%r12d
0587   93edc7:	89 d8                	mov    %ebx,%eax
0589   93edc9:	83 e0 0f             	and    $0xf,%eax
058c   93edcc:	44 89 f5             	mov    %r14d,%ebp
058f   93edcf:	83 e5 0f             	and    $0xf,%ebp
0592   93edd2:	48 85 c0             	test   %rax,%rax
0595   93edd5:	44 8b 7c 24 04       	mov    0x4(%rsp),%r15d
059a   93edda:	44 89 ff             	mov    %r15d,%edi
059d   93eddd:	41 0f 45 fc          	cmovne %r12d,%edi
05a1   93ede1:	48 0b 44 24 20       	or     0x20(%rsp),%rax
05a6   93ede6:	0f 85 93 85 00 00    	jne    94737f <___bpf_prog_run+0x8b3f>
05ac   93edec:	4c 8b 6c 24 30       	mov    0x30(%rsp),%r13
05b1   93edf1:	48 8d 3c ed 00 00 00 00 	lea    0x0(,%rbp,8),%rdi
05b9   93edf9:	4c 01 ef             	add    %r13,%rdi
05bc   93edfc:	48 8b 07             	mov    (%rdi),%rax
05bf   93edff:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
05c4   93ee04:	e8 00 00 00 00       	call   93ee09 <___bpf_prog_run+0x5c9>	93ee05: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
05c9   93ee09:	4c 89 ed             	mov    %r13,%rbp
05cc   93ee0c:	4c 8b 28             	mov    (%rax),%r13
05cf   93ee0f:	8b 02                	mov    (%rdx),%eax
05d1   93ee11:	89 44 24 08          	mov    %eax,0x8(%rsp)
05d5   93ee15:	48 c1 eb 04          	shr    $0x4,%rbx
05d9   93ee19:	49 c1 ee 04          	shr    $0x4,%r14
05dd   93ee1d:	48 85 db             	test   %rbx,%rbx
05e0   93ee20:	45 0f 44 e7          	cmove  %r15d,%r12d
05e4   93ee24:	48 0b 5c 24 20       	or     0x20(%rsp),%rbx
05e9   93ee29:	0f 85 5a 85 00 00    	jne    947389 <___bpf_prog_run+0x8b49>
05ef   93ee2f:	4a 8d 3c f5 00 00 00 00 	lea    0x0(,%r14,8),%rdi
05f7   93ee37:	48 01 ef             	add    %rbp,%rdi
05fa   93ee3a:	48 8b 1f             	mov    (%rdi),%rbx
05fd   93ee3d:	e8 00 00 00 00       	call   93ee42 <___bpf_prog_run+0x602>	93ee3e: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
0602   93ee42:	48 8b 00             	mov    (%rax),%rax
0605   93ee45:	48 85 c0             	test   %rax,%rax
0608   93ee48:	74 06                	je     93ee50 <___bpf_prog_run+0x610>
060a   93ee4a:	8b 0a                	mov    (%rdx),%ecx
060c   93ee4c:	89 4c 24 08          	mov    %ecx,0x8(%rsp)
0610   93ee50:	49 09 c5             	or     %rax,%r13
0613   93ee53:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
0618   93ee58:	0f 85 38 85 00 00    	jne    947396 <___bpf_prog_run+0x8b56>
061e   93ee5e:	48 39 5c 24 18       	cmp    %rbx,0x18(%rsp)
0623   93ee63:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
0628   93ee68:	0f 8e 6f 63 00 00    	jle    9451dd <___bpf_prog_run+0x699d>
062e   93ee6e:	e8 00 00 00 00       	call   93ee73 <___bpf_prog_run+0x633>	93ee6f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0633   93ee73:	49 8d 5d 02          	lea    0x2(%r13),%rbx
0637   93ee77:	4d 85 f6             	test   %r14,%r14
063a   93ee7a:	0f 84 3c 96 00 00    	je     9484bc <___bpf_prog_run+0x9c7c>
0640   93ee80:	8b 3c 24             	mov    (%rsp),%edi
0643   93ee83:	e8 00 00 00 00       	call   93ee88 <___bpf_prog_run+0x648>	93ee84: R_X86_64_PLT32	__msan_warning-0x4
0648   93ee88:	e9 2f 96 00 00       	jmp    9484bc <___bpf_prog_run+0x9c7c>
064d   93ee8d:	49 8d 5d 01          	lea    0x1(%r13),%rbx
0651   93ee91:	4d 85 f6             	test   %r14,%r14
0654   93ee94:	0f 85 0a 85 00 00    	jne    9473a4 <___bpf_prog_run+0x8b64>
065a   93ee9a:	0f b6 2b             	movzbl (%rbx),%ebp
065d   93ee9d:	48 89 df             	mov    %rbx,%rdi
0660   93eea0:	e8 00 00 00 00       	call   93eea5 <___bpf_prog_run+0x665>	93eea1: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
0665   93eea5:	0f b6 00             	movzbl (%rax),%eax
0668   93eea8:	83 e0 0f             	and    $0xf,%eax
066b   93eeab:	8b 7c 24 04          	mov    0x4(%rsp),%edi
066f   93eeaf:	48 85 c0             	test   %rax,%rax
0672   93eeb2:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
0677   93eeb7:	74 02                	je     93eebb <___bpf_prog_run+0x67b>
0679   93eeb9:	8b 3a                	mov    (%rdx),%edi
067b   93eebb:	83 e5 0f             	and    $0xf,%ebp
067e   93eebe:	48 09 c8             	or     %rcx,%rax
0681   93eec1:	0f 85 ea 84 00 00    	jne    9473b1 <___bpf_prog_run+0x8b71>
0687   93eec7:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
068c   93eecc:	48 8d 3c e8          	lea    (%rax,%rbp,8),%rdi
0690   93eed0:	44 8b 3f             	mov    (%rdi),%r15d
0693   93eed3:	e8 00 00 00 00       	call   93eed8 <___bpf_prog_run+0x698>	93eed4: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
0698   93eed8:	49 8d 6d 04          	lea    0x4(%r13),%rbp
069c   93eedc:	8b 18                	mov    (%rax),%ebx
069e   93eede:	44 8b 32             	mov    (%rdx),%r14d
06a1   93eee1:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
06a7   93eee7:	0f 85 ce 84 00 00    	jne    9473bb <___bpf_prog_run+0x8b7b>
06ad   93eeed:	44 8b 65 00          	mov    0x0(%rbp),%r12d
06b1   93eef1:	48 89 ef             	mov    %rbp,%rdi
06b4   93eef4:	e8 00 00 00 00       	call   93eef9 <___bpf_prog_run+0x6b9>	93eef5: R_X86_64_PLT32	__msan_metadata_ptr_for_load_4-0x4
06b9   93eef9:	85 db                	test   %ebx,%ebx
06bb   93eefb:	75 1e                	jne    93ef1b <___bpf_prog_run+0x6db>
06bd   93eefd:	44 8b 32             	mov    (%rdx),%r14d
06c0   93ef00:	0b 18                	or     (%rax),%ebx
06c2   93ef02:	74 1b                	je     93ef1f <___bpf_prog_run+0x6df>
06c4   93ef04:	44 89 f7             	mov    %r14d,%edi
06c7   93ef07:	e8 00 00 00 00       	call   93ef0c <___bpf_prog_run+0x6cc>	93ef08: R_X86_64_PLT32	__msan_warning-0x4
06cc   93ef0c:	45 39 fc             	cmp    %r15d,%r12d
06cf   93ef0f:	7c 13                	jl     93ef24 <___bpf_prog_run+0x6e4>
06d1   93ef11:	e8 00 00 00 00       	call   93ef16 <___bpf_prog_run+0x6d6>	93ef12: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
06d6   93ef16:	e9 db f9 ff ff       	jmp    93e8f6 <___bpf_prog_run+0xb6>
06db   93ef1b:	0b 18                	or     (%rax),%ebx
06dd   93ef1d:	75 e5                	jne    93ef04 <___bpf_prog_run+0x6c4>
06df   93ef1f:	45 39 fc             	cmp    %r15d,%r12d
06e2   93ef22:	7d ed                	jge    93ef11 <___bpf_prog_run+0x6d1>
06e4   93ef24:	e8 00 00 00 00       	call   93ef29 <___bpf_prog_run+0x6e9>	93ef25: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
06e9   93ef29:	49 8d 5d 02          	lea    0x2(%r13),%rbx
06ed   93ef2d:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
06f2   93ef32:	4d 85 f6             	test   %r14,%r14
06f5   93ef35:	0f 84 81 95 00 00    	je     9484bc <___bpf_prog_run+0x9c7c>
06fb   93ef3b:	8b 3c 24             	mov    (%rsp),%edi
06fe   93ef3e:	e8 00 00 00 00       	call   93ef43 <___bpf_prog_run+0x703>	93ef3f: R_X86_64_PLT32	__msan_warning-0x4
0703   93ef43:	e9 74 95 00 00       	jmp    9484bc <___bpf_prog_run+0x9c7c>
0708   93ef48:	e8 00 00 00 00       	call   93ef4d <___bpf_prog_run+0x70d>	93ef49: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
070d   93ef4d:	49 8d 5d 04          	lea    0x4(%r13),%rbx
0711   93ef51:	4d 85 f6             	test   %r14,%r14
0714   93ef54:	0f 85 6e 84 00 00    	jne    9473c8 <___bpf_prog_run+0x8b88>
071a   93ef5a:	48 63 2b             	movslq (%rbx),%rbp
071d   93ef5d:	48 89 df             	mov    %rbx,%rdi
0720   93ef60:	e8 00 00 00 00       	call   93ef65 <___bpf_prog_run+0x725>	93ef61: R_X86_64_PLT32	__msan_metadata_ptr_for_load_4-0x4
0725   93ef65:	48 8b 5c 24 20       	mov    0x20(%rsp),%rbx
072a   93ef6a:	48 85 db             	test   %rbx,%rbx
072d   93ef6d:	0f 85 62 84 00 00    	jne    9473d5 <___bpf_prog_run+0x8b95>
0733   93ef73:	48 8b bc 24 b0 00 00 00 	mov    0xb0(%rsp),%rdi
073b   93ef7b:	48 8b 07             	mov    (%rdi),%rax
073e   93ef7e:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
0743   93ef83:	e8 00 00 00 00       	call   93ef88 <___bpf_prog_run+0x748>	93ef84: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
0748   93ef88:	48 8b 00             	mov    (%rax),%rax
074b   93ef8b:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
0750   93ef90:	8b 02                	mov    (%rdx),%eax
0752   93ef92:	89 44 24 40          	mov    %eax,0x40(%rsp)
0756   93ef96:	48 85 db             	test   %rbx,%rbx
0759   93ef99:	0f 85 44 84 00 00    	jne    9473e3 <___bpf_prog_run+0x8ba3>
075f   93ef9f:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
0764   93efa4:	48 8b bc 24 90 00 00 00 	mov    0x90(%rsp),%rdi
076c   93efac:	48 8b 07             	mov    (%rdi),%rax
076f   93efaf:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
0774   93efb4:	e8 00 00 00 00       	call   93efb9 <___bpf_prog_run+0x779>	93efb5: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
0779   93efb9:	48 8b 00             	mov    (%rax),%rax
077c   93efbc:	48 89 44 24 58       	mov    %rax,0x58(%rsp)
0781   93efc1:	8b 02                	mov    (%rdx),%eax
0783   93efc3:	89 44 24 4c          	mov    %eax,0x4c(%rsp)
0787   93efc7:	48 85 db             	test   %rbx,%rbx
078a   93efca:	0f 85 21 84 00 00    	jne    9473f1 <___bpf_prog_run+0x8bb1>
0790   93efd0:	48 8b bc 24 88 00 00 00 	mov    0x88(%rsp),%rdi
0798   93efd8:	48 8b 07             	mov    (%rdi),%rax
079b   93efdb:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
07a0   93efe0:	e8 00 00 00 00       	call   93efe5 <___bpf_prog_run+0x7a5>	93efe1: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
07a5   93efe5:	48 8b 00             	mov    (%rax),%rax
07a8   93efe8:	48 89 44 24 78       	mov    %rax,0x78(%rsp)
07ad   93efed:	8b 02                	mov    (%rdx),%eax
07af   93efef:	89 44 24 70          	mov    %eax,0x70(%rsp)
07b3   93eff3:	48 85 db             	test   %rbx,%rbx
07b6   93eff6:	0f 85 03 84 00 00    	jne    9473ff <___bpf_prog_run+0x8bbf>
07bc   93effc:	48 8d 85 00 00 00 00 	lea    0x0(%rbp),%rax	93efff: R_X86_64_32S	__bpf_call_base
07c3   93f003:	48 89 84 24 80 00 00 00 	mov    %rax,0x80(%rsp)
07cb   93f00b:	48 8b bc 24 a8 00 00 00 	mov    0xa8(%rsp),%rdi
07d3   93f013:	4c 8b 2f             	mov    (%rdi),%r13
07d6   93f016:	e8 00 00 00 00       	call   93f01b <___bpf_prog_run+0x7db>	93f017: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
07db   93f01b:	4c 8b 20             	mov    (%rax),%r12
07de   93f01e:	44 8b 3a             	mov    (%rdx),%r15d
07e1   93f021:	48 85 db             	test   %rbx,%rbx
07e4   93f024:	0f 85 e3 83 00 00    	jne    94740d <___bpf_prog_run+0x8bcd>
07ea   93f02a:	48 8b bc 24 a0 00 00 00 	mov    0xa0(%rsp),%rdi
07f2   93f032:	48 8b 2f             	mov    (%rdi),%rbp
07f5   93f035:	e8 00 00 00 00       	call   93f03a <___bpf_prog_run+0x7fa>	93f036: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
07fa   93f03a:	48 8b 00             	mov    (%rax),%rax
07fd   93f03d:	8b 0a                	mov    (%rdx),%ecx
07ff   93f03f:	4c 8b 74 24 68       	mov    0x68(%rsp),%r14
0804   93f044:	48 8b 54 24 38       	mov    0x38(%rsp),%rdx
0809   93f049:	49 89 16             	mov    %rdx,(%r14)
080c   93f04c:	8b 54 24 40          	mov    0x40(%rsp),%edx
0810   93f050:	41 89 96 88 0c 00 00 	mov    %edx,0xc88(%r14)
0817   93f057:	48 8b 54 24 58       	mov    0x58(%rsp),%rdx
081c   93f05c:	49 89 56 08          	mov    %rdx,0x8(%r14)
0820   93f060:	8b 54 24 4c          	mov    0x4c(%rsp),%edx
0824   93f064:	41 89 96 90 0c 00 00 	mov    %edx,0xc90(%r14)
082b   93f06b:	48 8b 54 24 78       	mov    0x78(%rsp),%rdx
0830   93f070:	49 89 56 10          	mov    %rdx,0x10(%r14)
0834   93f074:	8b 54 24 70          	mov    0x70(%rsp),%edx
0838   93f078:	41 89 96 98 0c 00 00 	mov    %edx,0xc98(%r14)
083f   93f07f:	4d 89 66 18          	mov    %r12,0x18(%r14)
0843   93f083:	45 89 be a0 0c 00 00 	mov    %r15d,0xca0(%r14)
084a   93f08a:	49 89 46 20          	mov    %rax,0x20(%r14)
084e   93f08e:	41 89 8e a8 0c 00 00 	mov    %ecx,0xca8(%r14)
0855   93f095:	49 c7 86 20 03 00 00 00 00 00 00 	movq   $0x0,0x320(%r14)
0860   93f0a0:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
0865   93f0a5:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
086a   93f0aa:	48 8b 54 24 50       	mov    0x50(%rsp),%rdx
086f   93f0af:	4c 89 e9             	mov    %r13,%rcx
0872   93f0b2:	49 89 e8             	mov    %rbp,%r8
0875   93f0b5:	ff 94 24 80 00 00 00 	call   *0x80(%rsp)
087c   93f0bc:	49 89 c4             	mov    %rax,%r12
087f   93f0bf:	49 8b ae 20 03 00 00 	mov    0x320(%r14),%rbp
0886   93f0c6:	45 8b b6 a8 0f 00 00 	mov    0xfa8(%r14),%r14d
088d   93f0cd:	48 85 db             	test   %rbx,%rbx
0890   93f0d0:	0f 85 45 83 00 00    	jne    94741b <___bpf_prog_run+0x8bdb>
0896   93f0d6:	48 8b 5c 24 30       	mov    0x30(%rsp),%rbx
089b   93f0db:	48 89 df             	mov    %rbx,%rdi
089e   93f0de:	e8 00 00 00 00       	call   93f0e3 <___bpf_prog_run+0x8a3>	93f0df: R_X86_64_PLT32	__msan_metadata_ptr_for_store_8-0x4
08a3   93f0e3:	48 89 28             	mov    %rbp,(%rax)
08a6   93f0e6:	48 85 ed             	test   %rbp,%rbp
08a9   93f0e9:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
08ae   93f0ee:	0f 84 ac 64 00 00    	je     9455a0 <___bpf_prog_run+0x6d60>
08b4   93f0f4:	49 89 d7             	mov    %rdx,%r15
08b7   93f0f7:	44 89 f7             	mov    %r14d,%edi
08ba   93f0fa:	e8 00 00 00 00       	call   93f0ff <___bpf_prog_run+0x8bf>	93f0fb: R_X86_64_PLT32	__msan_chain_origin-0x4
08bf   93f0ff:	89 c0                	mov    %eax,%eax
08c1   93f101:	48 89 c1             	mov    %rax,%rcx
08c4   93f104:	48 c1 e1 20          	shl    $0x20,%rcx
08c8   93f108:	48 09 c1             	or     %rax,%rcx
08cb   93f10b:	49 89 0f             	mov    %rcx,(%r15)
08ce   93f10e:	4c 89 23             	mov    %r12,(%rbx)
08d1   93f111:	e9 e0 f7 ff ff       	jmp    93e8f6 <___bpf_prog_run+0xb6>
08d6   93f116:	49 8d 5d 01          	lea    0x1(%r13),%rbx
08da   93f11a:	4d 85 f6             	test   %r14,%r14
08dd   93f11d:	0f 85 06 83 00 00    	jne    947429 <___bpf_prog_run+0x8be9>
08e3   93f123:	0f b6 2b             	movzbl (%rbx),%ebp
08e6   93f126:	48 89 df             	mov    %rbx,%rdi
08e9   93f129:	e8 00 00 00 00       	call   93f12e <___bpf_prog_run+0x8ee>	93f12a: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
08ee   93f12e:	0f b6 00             	movzbl (%rax),%eax
08f1   93f131:	83 e0 0f             	and    $0xf,%eax
08f4   93f134:	8b 7c 24 04          	mov    0x4(%rsp),%edi
08f8   93f138:	48 85 c0             	test   %rax,%rax
08fb   93f13b:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
0900   93f140:	74 02                	je     93f144 <___bpf_prog_run+0x904>
0902   93f142:	8b 3a                	mov    (%rdx),%edi
0904   93f144:	83 e5 0f             	and    $0xf,%ebp
0907   93f147:	48 09 c8             	or     %rcx,%rax
090a   93f14a:	0f 85 e6 82 00 00    	jne    947436 <___bpf_prog_run+0x8bf6>
0910   93f150:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
0915   93f155:	48 8d 3c e8          	lea    (%rax,%rbp,8),%rdi
0919   93f159:	4c 8b 3f             	mov    (%rdi),%r15
091c   93f15c:	e8 00 00 00 00       	call   93f161 <___bpf_prog_run+0x921>	93f15d: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
0921   93f161:	49 8d 6d 04          	lea    0x4(%r13),%rbp
0925   93f165:	48 8b 18             	mov    (%rax),%rbx
0928   93f168:	44 8b 32             	mov    (%rdx),%r14d
092b   93f16b:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
0931   93f171:	0f 85 c9 82 00 00    	jne    947440 <___bpf_prog_run+0x8c00>
0937   93f177:	4c 63 65 00          	movslq 0x0(%rbp),%r12
093b   93f17b:	48 89 ef             	mov    %rbp,%rdi
093e   93f17e:	e8 00 00 00 00       	call   93f183 <___bpf_prog_run+0x943>	93f17f: R_X86_64_PLT32	__msan_metadata_ptr_for_load_4-0x4
0943   93f183:	48 63 00             	movslq (%rax),%rax
0946   93f186:	48 09 c3             	or     %rax,%rbx
0949   93f189:	48 85 c0             	test   %rax,%rax
094c   93f18c:	74 03                	je     93f191 <___bpf_prog_run+0x951>
094e   93f18e:	44 8b 32             	mov    (%rdx),%r14d
0951   93f191:	48 85 db             	test   %rbx,%rbx
0954   93f194:	74 12                	je     93f1a8 <___bpf_prog_run+0x968>
0956   93f196:	4c 89 f8             	mov    %r15,%rax
0959   93f199:	4c 31 e0             	xor    %r12,%rax
095c   93f19c:	48 f7 d3             	not    %rbx
095f   93f19f:	48 21 c3             	and    %rax,%rbx
0962   93f1a2:	0f 84 71 80 00 00    	je     947219 <___bpf_prog_run+0x89d9>
0968   93f1a8:	4d 39 e7             	cmp    %r12,%r15
096b   93f1ab:	0f 85 79 80 00 00    	jne    94722a <___bpf_prog_run+0x89ea>
0971   93f1b1:	e8 00 00 00 00       	call   93f1b6 <___bpf_prog_run+0x976>	93f1b2: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0976   93f1b6:	e9 3b f7 ff ff       	jmp    93e8f6 <___bpf_prog_run+0xb6>
097b   93f1bb:	e8 00 00 00 00       	call   93f1c0 <___bpf_prog_run+0x980>	93f1bc: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0980   93f1c0:	49 8d 5d 04          	lea    0x4(%r13),%rbx
0984   93f1c4:	4d 85 f6             	test   %r14,%r14
0987   93f1c7:	4c 89 f5             	mov    %r14,%rbp
098a   93f1ca:	0f 85 7d 82 00 00    	jne    94744d <___bpf_prog_run+0x8c0d>
0990   93f1d0:	41 8b 45 04          	mov    0x4(%r13),%eax
0994   93f1d4:	89 44 24 18          	mov    %eax,0x18(%rsp)
0998   93f1d8:	48 89 df             	mov    %rbx,%rdi
099b   93f1db:	e8 00 00 00 00       	call   93f1e0 <___bpf_prog_run+0x9a0>	93f1dc: R_X86_64_PLT32	__msan_metadata_ptr_for_load_4-0x4
09a0   93f1e0:	49 8d 5d 01          	lea    0x1(%r13),%rbx
09a4   93f1e4:	8b 00                	mov    (%rax),%eax
09a6   93f1e6:	89 44 24 08          	mov    %eax,0x8(%rsp)
09aa   93f1ea:	8b 02                	mov    (%rdx),%eax
09ac   93f1ec:	89 44 24 38          	mov    %eax,0x38(%rsp)
09b0   93f1f0:	48 85 ed             	test   %rbp,%rbp
09b3   93f1f3:	0f 85 61 82 00 00    	jne    94745a <___bpf_prog_run+0x8c1a>
09b9   93f1f9:	0f b6 2b             	movzbl (%rbx),%ebp
09bc   93f1fc:	48 89 df             	mov    %rbx,%rdi
09bf   93f1ff:	e8 00 00 00 00       	call   93f204 <___bpf_prog_run+0x9c4>	93f200: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
09c4   93f204:	0f b6 00             	movzbl (%rax),%eax
09c7   93f207:	83 e0 0f             	and    $0xf,%eax
09ca   93f20a:	8b 7c 24 04          	mov    0x4(%rsp),%edi
09ce   93f20e:	48 85 c0             	test   %rax,%rax
09d1   93f211:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
09d6   93f216:	74 02                	je     93f21a <___bpf_prog_run+0x9da>
09d8   93f218:	8b 3a                	mov    (%rdx),%edi
09da   93f21a:	83 e5 0f             	and    $0xf,%ebp
09dd   93f21d:	48 09 c8             	or     %rcx,%rax
09e0   93f220:	0f 85 41 82 00 00    	jne    947467 <___bpf_prog_run+0x8c27>
09e6   93f226:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
09eb   93f22b:	48 8d 3c e8          	lea    (%rax,%rbp,8),%rdi
09ef   93f22f:	48 8b 2f             	mov    (%rdi),%rbp
09f2   93f232:	e8 00 00 00 00       	call   93f237 <___bpf_prog_run+0x9f7>	93f233: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
09f7   93f237:	4d 89 ee             	mov    %r13,%r14
09fa   93f23a:	49 8d 5d 02          	lea    0x2(%r13),%rbx
09fe   93f23e:	4c 8b 28             	mov    (%rax),%r13
0a01   93f241:	44 8b 3a             	mov    (%rdx),%r15d
0a04   93f244:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
0a0a   93f24a:	0f 85 21 82 00 00    	jne    947471 <___bpf_prog_run+0x8c31>
0a10   93f250:	4c 0f bf 23          	movswq (%rbx),%r12
0a14   93f254:	48 89 df             	mov    %rbx,%rdi
0a17   93f257:	e8 00 00 00 00       	call   93f25c <___bpf_prog_run+0xa1c>	93f258: R_X86_64_PLT32	__msan_metadata_ptr_for_load_2-0x4
0a1c   93f25c:	48 0f bf 00          	movswq (%rax),%rax
0a20   93f260:	48 85 c0             	test   %rax,%rax
0a23   93f263:	74 03                	je     93f268 <___bpf_prog_run+0xa28>
0a25   93f265:	44 8b 3a             	mov    (%rdx),%r15d
0a28   93f268:	4c 01 e5             	add    %r12,%rbp
0a2b   93f26b:	49 09 c5             	or     %rax,%r13
0a2e   93f26e:	0f 85 0a 82 00 00    	jne    94747e <___bpf_prog_run+0x8c3e>
0a34   93f274:	48 89 ef             	mov    %rbp,%rdi
0a37   93f277:	e8 00 00 00 00       	call   93f27c <___bpf_prog_run+0xa3c>	93f278: R_X86_64_PLT32	__msan_metadata_ptr_for_store_4-0x4
0a3c   93f27c:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
0a40   93f280:	89 08                	mov    %ecx,(%rax)
0a42   93f282:	85 c9                	test   %ecx,%ecx
0a44   93f284:	0f 85 01 82 00 00    	jne    94748b <___bpf_prog_run+0x8c4b>
0a4a   93f28a:	8b 44 24 18          	mov    0x18(%rsp),%eax
0a4e   93f28e:	89 45 00             	mov    %eax,0x0(%rbp)
0a51   93f291:	e9 36 5f 00 00       	jmp    9451cc <___bpf_prog_run+0x698c>
0a56   93f296:	e8 00 00 00 00       	call   93f29b <___bpf_prog_run+0xa5b>	93f297: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0a5b   93f29b:	49 8d 5d 01          	lea    0x1(%r13),%rbx
0a5f   93f29f:	4d 85 f6             	test   %r14,%r14
0a62   93f2a2:	0f 85 f7 81 00 00    	jne    94749f <___bpf_prog_run+0x8c5f>
0a68   93f2a8:	44 0f b6 3b          	movzbl (%rbx),%r15d
0a6c   93f2ac:	48 89 df             	mov    %rbx,%rdi
0a6f   93f2af:	e8 00 00 00 00       	call   93f2b4 <___bpf_prog_run+0xa74>	93f2b0: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
0a74   93f2b4:	0f b6 28             	movzbl (%rax),%ebp
0a77   93f2b7:	83 e5 0f             	and    $0xf,%ebp
0a7a   93f2ba:	44 8b 74 24 04       	mov    0x4(%rsp),%r14d
0a7f   93f2bf:	48 85 ed             	test   %rbp,%rbp
0a82   93f2c2:	74 03                	je     93f2c7 <___bpf_prog_run+0xa87>
0a84   93f2c4:	44 8b 32             	mov    (%rdx),%r14d
0a87   93f2c7:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
0a8c   93f2cc:	41 83 e7 0f          	and    $0xf,%r15d
0a90   93f2d0:	48 0b 6c 24 20       	or     0x20(%rsp),%rbp
0a95   93f2d5:	0f 85 d1 81 00 00    	jne    9474ac <___bpf_prog_run+0x8c6c>
0a9b   93f2db:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
0aa0   93f2e0:	4e 8d 2c f8          	lea    (%rax,%r15,8),%r13
0aa4   93f2e4:	45 31 ff             	xor    %r15d,%r15d
0aa7   93f2e7:	49 8b 45 00          	mov    0x0(%r13),%rax
0aab   93f2eb:	45 31 e4             	xor    %r12d,%r12d
0aae   93f2ee:	49 29 c4             	sub    %rax,%r12
0ab1   93f2f1:	4c 89 ef             	mov    %r13,%rdi
0ab4   93f2f4:	e8 00 00 00 00       	call   93f2f9 <___bpf_prog_run+0xab9>	93f2f5: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
0ab9   93f2f9:	48 8b 18             	mov    (%rax),%rbx
0abc   93f2fc:	48 85 db             	test   %rbx,%rbx
0abf   93f2ff:	74 03                	je     93f304 <___bpf_prog_run+0xac4>
0ac1   93f301:	44 8b 3a             	mov    (%rdx),%r15d
0ac4   93f304:	48 85 ed             	test   %rbp,%rbp
0ac7   93f307:	0f 85 ac 81 00 00    	jne    9474b9 <___bpf_prog_run+0x8c79>
0acd   93f30d:	4c 89 ef             	mov    %r13,%rdi
0ad0   93f310:	e8 00 00 00 00       	call   93f315 <___bpf_prog_run+0xad5>	93f311: R_X86_64_PLT32	__msan_metadata_ptr_for_store_8-0x4
0ad5   93f315:	48 89 18             	mov    %rbx,(%rax)
0ad8   93f318:	48 85 db             	test   %rbx,%rbx
0adb   93f31b:	0f 84 cc f5 ff ff    	je     93e8ed <___bpf_prog_run+0xad>
0ae1   93f321:	49 89 d6             	mov    %rdx,%r14
0ae4   93f324:	44 89 ff             	mov    %r15d,%edi
0ae7   93f327:	e9 ad f5 ff ff       	jmp    93e8d9 <___bpf_prog_run+0x99>
0aec   93f32c:	e8 00 00 00 00       	call   93f331 <___bpf_prog_run+0xaf1>	93f32d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0af1   93f331:	49 8d 5d 01          	lea    0x1(%r13),%rbx
0af5   93f335:	4d 85 f6             	test   %r14,%r14
0af8   93f338:	0f 85 88 81 00 00    	jne    9474c6 <___bpf_prog_run+0x8c86>
0afe   93f33e:	0f b6 2b             	movzbl (%rbx),%ebp
0b01   93f341:	48 89 df             	mov    %rbx,%rdi
0b04   93f344:	e8 00 00 00 00       	call   93f349 <___bpf_prog_run+0xb09>	93f345: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
0b09   93f349:	44 0f b6 30          	movzbl (%rax),%r14d
0b0d   93f34d:	41 83 e6 0f          	and    $0xf,%r14d
0b11   93f351:	8b 5c 24 04          	mov    0x4(%rsp),%ebx
0b15   93f355:	4d 85 f6             	test   %r14,%r14
0b18   93f358:	74 02                	je     93f35c <___bpf_prog_run+0xb1c>
0b1a   93f35a:	8b 1a                	mov    (%rdx),%ebx
0b1c   93f35c:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
0b21   93f361:	83 e5 0f             	and    $0xf,%ebp
0b24   93f364:	4c 0b 74 24 20       	or     0x20(%rsp),%r14
0b29   93f369:	0f 85 64 81 00 00    	jne    9474d3 <___bpf_prog_run+0x8c93>
0b2f   93f36f:	89 5c 24 38          	mov    %ebx,0x38(%rsp)
0b33   93f373:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
0b38   93f378:	48 8d 3c e8          	lea    (%rax,%rbp,8),%rdi
0b3c   93f37c:	4c 8b 2f             	mov    (%rdi),%r13
0b3f   93f37f:	48 89 7c 24 18       	mov    %rdi,0x18(%rsp)
0b44   93f384:	e8 00 00 00 00       	call   93f389 <___bpf_prog_run+0xb49>	93f385: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
0b49   93f389:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
0b4e   93f38e:	48 8d 69 04          	lea    0x4(%rcx),%rbp
0b52   93f392:	4c 8b 20             	mov    (%rax),%r12
0b55   93f395:	8b 02                	mov    (%rdx),%eax
0b57   93f397:	89 44 24 08          	mov    %eax,0x8(%rsp)
0b5b   93f39b:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
0b61   93f3a1:	0f 85 38 81 00 00    	jne    9474df <___bpf_prog_run+0x8c9f>
0b67   93f3a7:	4c 63 7d 00          	movslq 0x0(%rbp),%r15
0b6b   93f3ab:	48 89 ef             	mov    %rbp,%rdi
0b6e   93f3ae:	e8 00 00 00 00       	call   93f3b3 <___bpf_prog_run+0xb73>	93f3af: R_X86_64_PLT32	__msan_metadata_ptr_for_load_4-0x4
0b73   93f3b3:	48 63 08             	movslq (%rax),%rcx
0b76   93f3b6:	4c 89 eb             	mov    %r13,%rbx
0b79   93f3b9:	48 f7 d3             	not    %rbx
0b7c   93f3bc:	4c 89 f8             	mov    %r15,%rax
0b7f   93f3bf:	48 f7 d0             	not    %rax
0b82   93f3c2:	4c 21 e0             	and    %r12,%rax
0b85   93f3c5:	4c 09 e3             	or     %r12,%rbx
0b88   93f3c8:	48 21 cb             	and    %rcx,%rbx
0b8b   93f3cb:	48 85 c9             	test   %rcx,%rcx
0b8e   93f3ce:	74 06                	je     93f3d6 <___bpf_prog_run+0xb96>
0b90   93f3d0:	8b 0a                	mov    (%rdx),%ecx
0b92   93f3d2:	89 4c 24 08          	mov    %ecx,0x8(%rsp)
0b96   93f3d6:	48 09 c3             	or     %rax,%rbx
0b99   93f3d9:	4d 85 f6             	test   %r14,%r14
0b9c   93f3dc:	0f 85 0a 81 00 00    	jne    9474ec <___bpf_prog_run+0x8cac>
0ba2   93f3e2:	4d 09 fd             	or     %r15,%r13
0ba5   93f3e5:	48 8b 6c 24 18       	mov    0x18(%rsp),%rbp
0baa   93f3ea:	48 89 ef             	mov    %rbp,%rdi
0bad   93f3ed:	e8 00 00 00 00       	call   93f3f2 <___bpf_prog_run+0xbb2>	93f3ee: R_X86_64_PLT32	__msan_metadata_ptr_for_store_8-0x4
0bb2   93f3f2:	48 89 18             	mov    %rbx,(%rax)
0bb5   93f3f5:	48 85 db             	test   %rbx,%rbx
0bb8   93f3f8:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
0bbd   93f3fd:	0f 85 f7 80 00 00    	jne    9474fa <___bpf_prog_run+0x8cba>
0bc3   93f403:	4c 89 6d 00          	mov    %r13,0x0(%rbp)
0bc7   93f407:	e9 0c 49 00 00       	jmp    943d18 <___bpf_prog_run+0x54d8>
0bcc   93f40c:	49 8d 5d 01          	lea    0x1(%r13),%rbx
0bd0   93f410:	4d 85 f6             	test   %r14,%r14
0bd3   93f413:	0f 85 01 81 00 00    	jne    94751a <___bpf_prog_run+0x8cda>
0bd9   93f419:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
0bde   93f41e:	44 0f b6 33          	movzbl (%rbx),%r14d
0be2   93f422:	48 89 df             	mov    %rbx,%rdi
0be5   93f425:	e8 00 00 00 00       	call   93f42a <___bpf_prog_run+0xbea>	93f426: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
0bea   93f42a:	0f b6 18             	movzbl (%rax),%ebx
0bed   93f42d:	44 8b 22             	mov    (%rdx),%r12d
0bf0   93f430:	89 d8                	mov    %ebx,%eax
0bf2   93f432:	83 e0 0f             	and    $0xf,%eax
0bf5   93f435:	44 89 f5             	mov    %r14d,%ebp
0bf8   93f438:	83 e5 0f             	and    $0xf,%ebp
0bfb   93f43b:	48 85 c0             	test   %rax,%rax
0bfe   93f43e:	44 8b 7c 24 04       	mov    0x4(%rsp),%r15d
0c03   93f443:	44 89 ff             	mov    %r15d,%edi
0c06   93f446:	41 0f 45 fc          	cmovne %r12d,%edi
0c0a   93f44a:	48 0b 44 24 20       	or     0x20(%rsp),%rax
0c0f   93f44f:	0f 85 d2 80 00 00    	jne    947527 <___bpf_prog_run+0x8ce7>
0c15   93f455:	4c 8b 6c 24 30       	mov    0x30(%rsp),%r13
0c1a   93f45a:	48 8d 3c ed 00 00 00 00 	lea    0x0(,%rbp,8),%rdi
0c22   93f462:	4c 01 ef             	add    %r13,%rdi
0c25   93f465:	48 8b 07             	mov    (%rdi),%rax
0c28   93f468:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
0c2d   93f46d:	e8 00 00 00 00       	call   93f472 <___bpf_prog_run+0xc32>	93f46e: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
0c32   93f472:	4c 89 ed             	mov    %r13,%rbp
0c35   93f475:	4c 8b 28             	mov    (%rax),%r13
0c38   93f478:	8b 02                	mov    (%rdx),%eax
0c3a   93f47a:	89 44 24 08          	mov    %eax,0x8(%rsp)
0c3e   93f47e:	48 c1 eb 04          	shr    $0x4,%rbx
0c42   93f482:	49 c1 ee 04          	shr    $0x4,%r14
0c46   93f486:	48 85 db             	test   %rbx,%rbx
0c49   93f489:	45 0f 44 e7          	cmove  %r15d,%r12d
0c4d   93f48d:	48 0b 5c 24 20       	or     0x20(%rsp),%rbx
0c52   93f492:	0f 85 99 80 00 00    	jne    947531 <___bpf_prog_run+0x8cf1>
0c58   93f498:	4a 8d 3c f5 00 00 00 00 	lea    0x0(,%r14,8),%rdi
0c60   93f4a0:	48 01 ef             	add    %rbp,%rdi
0c63   93f4a3:	8b 1f                	mov    (%rdi),%ebx
0c65   93f4a5:	e8 00 00 00 00       	call   93f4aa <___bpf_prog_run+0xc6a>	93f4a6: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
0c6a   93f4aa:	8b 00                	mov    (%rax),%eax
0c6c   93f4ac:	89 c1                	mov    %eax,%ecx
0c6e   93f4ae:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
0c73   93f4b3:	21 f1                	and    %esi,%ecx
0c75   93f4b5:	09 d8                	or     %ebx,%eax
0c77   93f4b7:	44 21 e8             	and    %r13d,%eax
0c7a   93f4ba:	09 c8                	or     %ecx,%eax
0c7c   93f4bc:	4d 85 ed             	test   %r13,%r13
0c7f   93f4bf:	75 06                	jne    93f4c7 <___bpf_prog_run+0xc87>
0c81   93f4c1:	8b 0a                	mov    (%rdx),%ecx
0c83   93f4c3:	89 4c 24 08          	mov    %ecx,0x8(%rsp)
0c87   93f4c7:	21 f3                	and    %esi,%ebx
0c89   93f4c9:	85 c0                	test   %eax,%eax
0c8b   93f4cb:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
0c90   93f4d0:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
0c95   93f4d5:	74 0a                	je     93f4e1 <___bpf_prog_run+0xca1>
0c97   93f4d7:	f7 d0                	not    %eax
0c99   93f4d9:	21 d8                	and    %ebx,%eax
0c9b   93f4db:	0f 84 6d 7d 00 00    	je     94724e <___bpf_prog_run+0x8a0e>
0ca1   93f4e1:	85 db                	test   %ebx,%ebx
0ca3   93f4e3:	0f 84 76 7d 00 00    	je     94725f <___bpf_prog_run+0x8a1f>
0ca9   93f4e9:	e8 00 00 00 00       	call   93f4ee <___bpf_prog_run+0xcae>	93f4ea: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0cae   93f4ee:	49 8d 5d 02          	lea    0x2(%r13),%rbx
0cb2   93f4f2:	4d 85 f6             	test   %r14,%r14
0cb5   93f4f5:	0f 84 c1 8f 00 00    	je     9484bc <___bpf_prog_run+0x9c7c>
0cbb   93f4fb:	8b 3c 24             	mov    (%rsp),%edi
0cbe   93f4fe:	e8 00 00 00 00       	call   93f503 <___bpf_prog_run+0xcc3>	93f4ff: R_X86_64_PLT32	__msan_warning-0x4
0cc3   93f503:	e9 b4 8f 00 00       	jmp    9484bc <___bpf_prog_run+0x9c7c>
0cc8   93f508:	e8 00 00 00 00       	call   93f50d <___bpf_prog_run+0xccd>	93f509: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0ccd   93f50d:	49 8d 5d 04          	lea    0x4(%r13),%rbx
0cd1   93f511:	4d 85 f6             	test   %r14,%r14
0cd4   93f514:	4c 89 f5             	mov    %r14,%rbp
0cd7   93f517:	0f 85 21 80 00 00    	jne    94753e <___bpf_prog_run+0x8cfe>
0cdd   93f51d:	49 63 45 04          	movslq 0x4(%r13),%rax
0ce1   93f521:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
0ce6   93f526:	48 89 df             	mov    %rbx,%rdi
0ce9   93f529:	e8 00 00 00 00       	call   93f52e <___bpf_prog_run+0xcee>	93f52a: R_X86_64_PLT32	__msan_metadata_ptr_for_load_4-0x4
0cee   93f52e:	49 8d 5d 01          	lea    0x1(%r13),%rbx
0cf2   93f532:	48 63 00             	movslq (%rax),%rax
0cf5   93f535:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
0cfa   93f53a:	8b 02                	mov    (%rdx),%eax
0cfc   93f53c:	89 44 24 38          	mov    %eax,0x38(%rsp)
0d00   93f540:	48 85 ed             	test   %rbp,%rbp
0d03   93f543:	0f 85 02 80 00 00    	jne    94754b <___bpf_prog_run+0x8d0b>
0d09   93f549:	0f b6 2b             	movzbl (%rbx),%ebp
0d0c   93f54c:	48 89 df             	mov    %rbx,%rdi
0d0f   93f54f:	e8 00 00 00 00       	call   93f554 <___bpf_prog_run+0xd14>	93f550: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
0d14   93f554:	0f b6 00             	movzbl (%rax),%eax
0d17   93f557:	83 e0 0f             	and    $0xf,%eax
0d1a   93f55a:	8b 7c 24 04          	mov    0x4(%rsp),%edi
0d1e   93f55e:	48 85 c0             	test   %rax,%rax
0d21   93f561:	74 02                	je     93f565 <___bpf_prog_run+0xd25>
0d23   93f563:	8b 3a                	mov    (%rdx),%edi
0d25   93f565:	4d 89 ee             	mov    %r13,%r14
0d28   93f568:	83 e5 0f             	and    $0xf,%ebp
0d2b   93f56b:	48 0b 44 24 20       	or     0x20(%rsp),%rax
0d30   93f570:	0f 85 e2 7f 00 00    	jne    947558 <___bpf_prog_run+0x8d18>
0d36   93f576:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
0d3b   93f57b:	48 8d 3c e8          	lea    (%rax,%rbp,8),%rdi
0d3f   93f57f:	4c 8b 2f             	mov    (%rdi),%r13
0d42   93f582:	e8 00 00 00 00       	call   93f587 <___bpf_prog_run+0xd47>	93f583: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
0d47   93f587:	49 8d 5e 02          	lea    0x2(%r14),%rbx
0d4b   93f58b:	48 8b 28             	mov    (%rax),%rbp
0d4e   93f58e:	44 8b 3a             	mov    (%rdx),%r15d
0d51   93f591:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
0d57   93f597:	0f 85 c5 7f 00 00    	jne    947562 <___bpf_prog_run+0x8d22>
0d5d   93f59d:	4c 0f bf 23          	movswq (%rbx),%r12
0d61   93f5a1:	48 89 df             	mov    %rbx,%rdi
0d64   93f5a4:	e8 00 00 00 00       	call   93f5a9 <___bpf_prog_run+0xd69>	93f5a5: R_X86_64_PLT32	__msan_metadata_ptr_for_load_2-0x4
0d69   93f5a9:	48 0f bf 00          	movswq (%rax),%rax
0d6d   93f5ad:	48 85 c0             	test   %rax,%rax
0d70   93f5b0:	74 03                	je     93f5b5 <___bpf_prog_run+0xd75>
0d72   93f5b2:	44 8b 3a             	mov    (%rdx),%r15d
0d75   93f5b5:	4d 01 e5             	add    %r12,%r13
0d78   93f5b8:	48 09 c5             	or     %rax,%rbp
0d7b   93f5bb:	0f 85 ae 7f 00 00    	jne    94756f <___bpf_prog_run+0x8d2f>
0d81   93f5c1:	4c 89 ef             	mov    %r13,%rdi
0d84   93f5c4:	e8 00 00 00 00       	call   93f5c9 <___bpf_prog_run+0xd89>	93f5c5: R_X86_64_PLT32	__msan_metadata_ptr_for_store_8-0x4
0d89   93f5c9:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
0d8e   93f5ce:	48 89 08             	mov    %rcx,(%rax)
0d91   93f5d1:	48 85 c9             	test   %rcx,%rcx
0d94   93f5d4:	0f 85 a2 7f 00 00    	jne    94757c <___bpf_prog_run+0x8d3c>
0d9a   93f5da:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
0d9f   93f5df:	49 89 45 00          	mov    %rax,0x0(%r13)
0da3   93f5e3:	4d 89 f5             	mov    %r14,%r13
0da6   93f5e6:	e9 0b f3 ff ff       	jmp    93e8f6 <___bpf_prog_run+0xb6>
0dab   93f5eb:	49 8d 5d 01          	lea    0x1(%r13),%rbx
0daf   93f5ef:	4d 85 f6             	test   %r14,%r14
0db2   93f5f2:	0f 85 a4 7f 00 00    	jne    94759c <___bpf_prog_run+0x8d5c>
0db8   93f5f8:	0f b6 2b             	movzbl (%rbx),%ebp
0dbb   93f5fb:	48 89 df             	mov    %rbx,%rdi
0dbe   93f5fe:	e8 00 00 00 00       	call   93f603 <___bpf_prog_run+0xdc3>	93f5ff: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
0dc3   93f603:	0f b6 00             	movzbl (%rax),%eax
0dc6   93f606:	83 e0 0f             	and    $0xf,%eax
0dc9   93f609:	8b 7c 24 04          	mov    0x4(%rsp),%edi
0dcd   93f60d:	48 85 c0             	test   %rax,%rax
0dd0   93f610:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
0dd5   93f615:	74 02                	je     93f619 <___bpf_prog_run+0xdd9>
0dd7   93f617:	8b 3a                	mov    (%rdx),%edi
0dd9   93f619:	83 e5 0f             	and    $0xf,%ebp
0ddc   93f61c:	48 09 c8             	or     %rcx,%rax
0ddf   93f61f:	0f 85 84 7f 00 00    	jne    9475a9 <___bpf_prog_run+0x8d69>
0de5   93f625:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
0dea   93f62a:	48 8d 3c e8          	lea    (%rax,%rbp,8),%rdi
0dee   93f62e:	4c 8b 3f             	mov    (%rdi),%r15
0df1   93f631:	e8 00 00 00 00       	call   93f636 <___bpf_prog_run+0xdf6>	93f632: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
0df6   93f636:	49 8d 6d 04          	lea    0x4(%r13),%rbp
0dfa   93f63a:	48 8b 18             	mov    (%rax),%rbx
0dfd   93f63d:	44 8b 32             	mov    (%rdx),%r14d
0e00   93f640:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
0e06   93f646:	0f 85 67 7f 00 00    	jne    9475b3 <___bpf_prog_run+0x8d73>
0e0c   93f64c:	4c 63 65 00          	movslq 0x0(%rbp),%r12
0e10   93f650:	48 89 ef             	mov    %rbp,%rdi
0e13   93f653:	e8 00 00 00 00       	call   93f658 <___bpf_prog_run+0xe18>	93f654: R_X86_64_PLT32	__msan_metadata_ptr_for_load_4-0x4
0e18   93f658:	48 63 00             	movslq (%rax),%rax
0e1b   93f65b:	48 85 c0             	test   %rax,%rax
0e1e   93f65e:	74 1f                	je     93f67f <___bpf_prog_run+0xe3f>
0e20   93f660:	44 8b 32             	mov    (%rdx),%r14d
0e23   93f663:	48 09 c3             	or     %rax,%rbx
0e26   93f666:	74 1c                	je     93f684 <___bpf_prog_run+0xe44>
0e28   93f668:	44 89 f7             	mov    %r14d,%edi
0e2b   93f66b:	e8 00 00 00 00       	call   93f670 <___bpf_prog_run+0xe30>	93f66c: R_X86_64_PLT32	__msan_warning-0x4
0e30   93f670:	4d 39 e7             	cmp    %r12,%r15
0e33   93f673:	77 14                	ja     93f689 <___bpf_prog_run+0xe49>
0e35   93f675:	e8 00 00 00 00       	call   93f67a <___bpf_prog_run+0xe3a>	93f676: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0e3a   93f67a:	e9 77 f2 ff ff       	jmp    93e8f6 <___bpf_prog_run+0xb6>
0e3f   93f67f:	48 09 c3             	or     %rax,%rbx
0e42   93f682:	75 e4                	jne    93f668 <___bpf_prog_run+0xe28>
0e44   93f684:	4d 39 e7             	cmp    %r12,%r15
0e47   93f687:	76 ec                	jbe    93f675 <___bpf_prog_run+0xe35>
0e49   93f689:	e8 00 00 00 00       	call   93f68e <___bpf_prog_run+0xe4e>	93f68a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0e4e   93f68e:	49 8d 5d 02          	lea    0x2(%r13),%rbx
0e52   93f692:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
0e57   93f697:	4d 85 f6             	test   %r14,%r14
0e5a   93f69a:	0f 84 1c 8e 00 00    	je     9484bc <___bpf_prog_run+0x9c7c>
0e60   93f6a0:	8b 3c 24             	mov    (%rsp),%edi
0e63   93f6a3:	e8 00 00 00 00       	call   93f6a8 <___bpf_prog_run+0xe68>	93f6a4: R_X86_64_PLT32	__msan_warning-0x4
0e68   93f6a8:	e9 0f 8e 00 00       	jmp    9484bc <___bpf_prog_run+0x9c7c>
0e6d   93f6ad:	e8 00 00 00 00       	call   93f6b2 <___bpf_prog_run+0xe72>	93f6ae: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0e72   93f6b2:	49 8d 5d 04          	lea    0x4(%r13),%rbx
0e76   93f6b6:	4d 85 f6             	test   %r14,%r14
0e79   93f6b9:	4c 89 f5             	mov    %r14,%rbp
0e7c   93f6bc:	0f 85 fe 7e 00 00    	jne    9475c0 <___bpf_prog_run+0x8d80>
0e82   93f6c2:	41 0f b7 45 04       	movzwl 0x4(%r13),%eax
0e87   93f6c7:	66 89 44 24 18       	mov    %ax,0x18(%rsp)
0e8c   93f6cc:	48 89 df             	mov    %rbx,%rdi
0e8f   93f6cf:	e8 00 00 00 00       	call   93f6d4 <___bpf_prog_run+0xe94>	93f6d0: R_X86_64_PLT32	__msan_metadata_ptr_for_load_4-0x4
0e94   93f6d4:	49 8d 5d 01          	lea    0x1(%r13),%rbx
0e98   93f6d8:	0f b7 00             	movzwl (%rax),%eax
0e9b   93f6db:	66 89 44 24 08       	mov    %ax,0x8(%rsp)
0ea0   93f6e0:	8b 02                	mov    (%rdx),%eax
0ea2   93f6e2:	89 44 24 38          	mov    %eax,0x38(%rsp)
0ea6   93f6e6:	48 85 ed             	test   %rbp,%rbp
0ea9   93f6e9:	0f 85 de 7e 00 00    	jne    9475cd <___bpf_prog_run+0x8d8d>
0eaf   93f6ef:	0f b6 2b             	movzbl (%rbx),%ebp
0eb2   93f6f2:	48 89 df             	mov    %rbx,%rdi
0eb5   93f6f5:	e8 00 00 00 00       	call   93f6fa <___bpf_prog_run+0xeba>	93f6f6: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
0eba   93f6fa:	0f b6 00             	movzbl (%rax),%eax
0ebd   93f6fd:	83 e0 0f             	and    $0xf,%eax
0ec0   93f700:	8b 7c 24 04          	mov    0x4(%rsp),%edi
0ec4   93f704:	48 85 c0             	test   %rax,%rax
0ec7   93f707:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
0ecc   93f70c:	74 02                	je     93f710 <___bpf_prog_run+0xed0>
0ece   93f70e:	8b 3a                	mov    (%rdx),%edi
0ed0   93f710:	83 e5 0f             	and    $0xf,%ebp
0ed3   93f713:	48 09 c8             	or     %rcx,%rax
0ed6   93f716:	0f 85 be 7e 00 00    	jne    9475da <___bpf_prog_run+0x8d9a>
0edc   93f71c:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
0ee1   93f721:	48 8d 3c e8          	lea    (%rax,%rbp,8),%rdi
0ee5   93f725:	48 8b 2f             	mov    (%rdi),%rbp
0ee8   93f728:	e8 00 00 00 00       	call   93f72d <___bpf_prog_run+0xeed>	93f729: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
0eed   93f72d:	4d 89 ee             	mov    %r13,%r14
0ef0   93f730:	49 8d 5d 02          	lea    0x2(%r13),%rbx
0ef4   93f734:	4c 8b 28             	mov    (%rax),%r13
0ef7   93f737:	44 8b 3a             	mov    (%rdx),%r15d
0efa   93f73a:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
0f00   93f740:	0f 85 9e 7e 00 00    	jne    9475e4 <___bpf_prog_run+0x8da4>
0f06   93f746:	4c 0f bf 23          	movswq (%rbx),%r12
0f0a   93f74a:	48 89 df             	mov    %rbx,%rdi
0f0d   93f74d:	e8 00 00 00 00       	call   93f752 <___bpf_prog_run+0xf12>	93f74e: R_X86_64_PLT32	__msan_metadata_ptr_for_load_2-0x4
0f12   93f752:	48 0f bf 00          	movswq (%rax),%rax
0f16   93f756:	48 85 c0             	test   %rax,%rax
0f19   93f759:	74 03                	je     93f75e <___bpf_prog_run+0xf1e>
0f1b   93f75b:	44 8b 3a             	mov    (%rdx),%r15d
0f1e   93f75e:	4c 01 e5             	add    %r12,%rbp
0f21   93f761:	49 09 c5             	or     %rax,%r13
0f24   93f764:	0f 85 87 7e 00 00    	jne    9475f1 <___bpf_prog_run+0x8db1>
0f2a   93f76a:	48 89 ef             	mov    %rbp,%rdi
0f2d   93f76d:	e8 00 00 00 00       	call   93f772 <___bpf_prog_run+0xf32>	93f76e: R_X86_64_PLT32	__msan_metadata_ptr_for_store_2-0x4
0f32   93f772:	0f b7 4c 24 08       	movzwl 0x8(%rsp),%ecx
0f37   93f777:	66 89 08             	mov    %cx,(%rax)
0f3a   93f77a:	66 85 c9             	test   %cx,%cx
0f3d   93f77d:	0f 85 7b 7e 00 00    	jne    9475fe <___bpf_prog_run+0x8dbe>
0f43   93f783:	0f b7 44 24 18       	movzwl 0x18(%rsp),%eax
0f48   93f788:	66 89 45 00          	mov    %ax,0x0(%rbp)
0f4c   93f78c:	e9 3b 5a 00 00       	jmp    9451cc <___bpf_prog_run+0x698c>
0f51   93f791:	e8 00 00 00 00       	call   93f796 <___bpf_prog_run+0xf56>	93f792: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0f56   93f796:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
0f5b   93f79b:	49 8d 5d 01          	lea    0x1(%r13),%rbx
0f5f   93f79f:	4d 85 f6             	test   %r14,%r14
0f62   93f7a2:	0f 85 6a 7e 00 00    	jne    947612 <___bpf_prog_run+0x8dd2>
0f68   93f7a8:	44 0f b6 23          	movzbl (%rbx),%r12d
0f6c   93f7ac:	48 89 df             	mov    %rbx,%rdi
0f6f   93f7af:	e8 00 00 00 00       	call   93f7b4 <___bpf_prog_run+0xf74>	93f7b0: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
0f74   93f7b4:	0f b6 18             	movzbl (%rax),%ebx
0f77   93f7b7:	44 8b 3a             	mov    (%rdx),%r15d
0f7a   93f7ba:	48 89 d8             	mov    %rbx,%rax
0f7d   93f7bd:	48 c1 e8 04          	shr    $0x4,%rax
0f81   93f7c1:	4c 89 e5             	mov    %r12,%rbp
0f84   93f7c4:	48 c1 ed 04          	shr    $0x4,%rbp
0f88   93f7c8:	48 85 c0             	test   %rax,%rax
0f8b   93f7cb:	44 8b 6c 24 04       	mov    0x4(%rsp),%r13d
0f90   93f7d0:	44 89 ef             	mov    %r13d,%edi
0f93   93f7d3:	41 0f 45 ff          	cmovne %r15d,%edi
0f97   93f7d7:	4c 8b 74 24 20       	mov    0x20(%rsp),%r14
0f9c   93f7dc:	4c 09 f0             	or     %r14,%rax
0f9f   93f7df:	0f 85 3a 7e 00 00    	jne    94761f <___bpf_prog_run+0x8ddf>
0fa5   93f7e5:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
0faa   93f7ea:	48 8d 3c e8          	lea    (%rax,%rbp,8),%rdi
0fae   93f7ee:	48 89 c5             	mov    %rax,%rbp
0fb1   93f7f1:	8b 07                	mov    (%rdi),%eax
0fb3   93f7f3:	89 44 24 18          	mov    %eax,0x18(%rsp)
0fb7   93f7f7:	e8 00 00 00 00       	call   93f7fc <___bpf_prog_run+0xfbc>	93f7f8: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
0fbc   93f7fc:	8b 00                	mov    (%rax),%eax
0fbe   93f7fe:	89 44 24 08          	mov    %eax,0x8(%rsp)
0fc2   93f802:	8b 02                	mov    (%rdx),%eax
0fc4   93f804:	89 44 24 38          	mov    %eax,0x38(%rsp)
0fc8   93f808:	83 e3 0f             	and    $0xf,%ebx
0fcb   93f80b:	41 83 e4 0f          	and    $0xf,%r12d
0fcf   93f80f:	48 85 db             	test   %rbx,%rbx
0fd2   93f812:	45 0f 44 fd          	cmove  %r13d,%r15d
0fd6   93f816:	4c 09 f3             	or     %r14,%rbx
0fd9   93f819:	0f 85 0a 7e 00 00    	jne    947629 <___bpf_prog_run+0x8de9>
0fdf   93f81f:	4a 8d 3c e5 00 00 00 00 	lea    0x0(,%r12,8),%rdi
0fe7   93f827:	48 01 ef             	add    %rbp,%rdi
0fea   93f82a:	48 8b 2f             	mov    (%rdi),%rbp
0fed   93f82d:	e8 00 00 00 00       	call   93f832 <___bpf_prog_run+0xff2>	93f82e: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
0ff2   93f832:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
0ff7   93f837:	48 8d 59 02          	lea    0x2(%rcx),%rbx
0ffb   93f83b:	4c 8b 28             	mov    (%rax),%r13
0ffe   93f83e:	44 8b 3a             	mov    (%rdx),%r15d
1001   93f841:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
1006   93f846:	4d 85 f6             	test   %r14,%r14
1009   93f849:	0f 85 e7 7d 00 00    	jne    947636 <___bpf_prog_run+0x8df6>
100f   93f84f:	4c 0f bf 23          	movswq (%rbx),%r12
1013   93f853:	48 89 df             	mov    %rbx,%rdi
1016   93f856:	e8 00 00 00 00       	call   93f85b <___bpf_prog_run+0x101b>	93f857: R_X86_64_PLT32	__msan_metadata_ptr_for_load_2-0x4
101b   93f85b:	48 0f bf 00          	movswq (%rax),%rax
101f   93f85f:	48 85 c0             	test   %rax,%rax
1022   93f862:	74 03                	je     93f867 <___bpf_prog_run+0x1027>
1024   93f864:	44 8b 3a             	mov    (%rdx),%r15d
1027   93f867:	4c 01 e5             	add    %r12,%rbp
102a   93f86a:	49 09 c5             	or     %rax,%r13
102d   93f86d:	0f 85 d0 7d 00 00    	jne    947643 <___bpf_prog_run+0x8e03>
1033   93f873:	48 89 ef             	mov    %rbp,%rdi
1036   93f876:	e8 00 00 00 00       	call   93f87b <___bpf_prog_run+0x103b>	93f877: R_X86_64_PLT32	__msan_metadata_ptr_for_store_4-0x4
103b   93f87b:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
103f   93f87f:	89 08                	mov    %ecx,(%rax)
1041   93f881:	85 c9                	test   %ecx,%ecx
1043   93f883:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
1048   93f888:	0f 85 c2 7d 00 00    	jne    947650 <___bpf_prog_run+0x8e10>
104e   93f88e:	8b 44 24 18          	mov    0x18(%rsp),%eax
1052   93f892:	89 45 00             	mov    %eax,0x0(%rbp)
1055   93f895:	49 83 c5 08          	add    $0x8,%r13
1059   93f899:	e9 61 f0 ff ff       	jmp    93e8ff <___bpf_prog_run+0xbf>
105e   93f89e:	49 8d 5d 01          	lea    0x1(%r13),%rbx
1062   93f8a2:	4d 85 f6             	test   %r14,%r14
1065   93f8a5:	0f 85 b9 7d 00 00    	jne    947664 <___bpf_prog_run+0x8e24>
106b   93f8ab:	0f b6 2b             	movzbl (%rbx),%ebp
106e   93f8ae:	48 89 df             	mov    %rbx,%rdi
1071   93f8b1:	e8 00 00 00 00       	call   93f8b6 <___bpf_prog_run+0x1076>	93f8b2: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
1076   93f8b6:	0f b6 00             	movzbl (%rax),%eax
1079   93f8b9:	83 e0 0f             	and    $0xf,%eax
107c   93f8bc:	8b 7c 24 04          	mov    0x4(%rsp),%edi
1080   93f8c0:	48 85 c0             	test   %rax,%rax
1083   93f8c3:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
1088   93f8c8:	74 02                	je     93f8cc <___bpf_prog_run+0x108c>
108a   93f8ca:	8b 3a                	mov    (%rdx),%edi
108c   93f8cc:	83 e5 0f             	and    $0xf,%ebp
108f   93f8cf:	48 09 c8             	or     %rcx,%rax
1092   93f8d2:	0f 85 99 7d 00 00    	jne    947671 <___bpf_prog_run+0x8e31>
1098   93f8d8:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
109d   93f8dd:	48 8d 3c e8          	lea    (%rax,%rbp,8),%rdi
10a1   93f8e1:	44 8b 3f             	mov    (%rdi),%r15d
10a4   93f8e4:	e8 00 00 00 00       	call   93f8e9 <___bpf_prog_run+0x10a9>	93f8e5: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
10a9   93f8e9:	49 8d 6d 04          	lea    0x4(%r13),%rbp
10ad   93f8ed:	8b 18                	mov    (%rax),%ebx
10af   93f8ef:	44 8b 32             	mov    (%rdx),%r14d
10b2   93f8f2:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
10b8   93f8f8:	0f 85 7d 7d 00 00    	jne    94767b <___bpf_prog_run+0x8e3b>
10be   93f8fe:	44 8b 65 00          	mov    0x0(%rbp),%r12d
10c2   93f902:	48 89 ef             	mov    %rbp,%rdi
10c5   93f905:	e8 00 00 00 00       	call   93f90a <___bpf_prog_run+0x10ca>	93f906: R_X86_64_PLT32	__msan_metadata_ptr_for_load_4-0x4
10ca   93f90a:	85 db                	test   %ebx,%ebx
10cc   93f90c:	0f 85 18 01 00 00    	jne    93fa2a <___bpf_prog_run+0x11ea>
10d2   93f912:	44 8b 32             	mov    (%rdx),%r14d
10d5   93f915:	0b 18                	or     (%rax),%ebx
10d7   93f917:	0f 84 15 01 00 00    	je     93fa32 <___bpf_prog_run+0x11f2>
10dd   93f91d:	44 89 f7             	mov    %r14d,%edi
10e0   93f920:	e8 00 00 00 00       	call   93f925 <___bpf_prog_run+0x10e5>	93f921: R_X86_64_PLT32	__msan_warning-0x4
10e5   93f925:	45 39 fc             	cmp    %r15d,%r12d
10e8   93f928:	0f 82 0d 01 00 00    	jb     93fa3b <___bpf_prog_run+0x11fb>
10ee   93f92e:	e8 00 00 00 00       	call   93f933 <___bpf_prog_run+0x10f3>	93f92f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
10f3   93f933:	49 8d 5d 02          	lea    0x2(%r13),%rbx
10f7   93f937:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
10fc   93f93c:	4d 85 f6             	test   %r14,%r14
10ff   93f93f:	0f 84 77 8b 00 00    	je     9484bc <___bpf_prog_run+0x9c7c>
1105   93f945:	8b 3c 24             	mov    (%rsp),%edi
1108   93f948:	e8 00 00 00 00       	call   93f94d <___bpf_prog_run+0x110d>	93f949: R_X86_64_PLT32	__msan_warning-0x4
110d   93f94d:	e9 6a 8b 00 00       	jmp    9484bc <___bpf_prog_run+0x9c7c>
1112   93f952:	e8 00 00 00 00       	call   93f957 <___bpf_prog_run+0x1117>	93f953: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1117   93f957:	49 8d 5d 01          	lea    0x1(%r13),%rbx
111b   93f95b:	4d 85 f6             	test   %r14,%r14
111e   93f95e:	0f 85 24 7d 00 00    	jne    947688 <___bpf_prog_run+0x8e48>
1124   93f964:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
1129   93f969:	44 0f b6 33          	movzbl (%rbx),%r14d
112d   93f96d:	48 89 df             	mov    %rbx,%rdi
1130   93f970:	e8 00 00 00 00       	call   93f975 <___bpf_prog_run+0x1135>	93f971: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
1135   93f975:	0f b6 28             	movzbl (%rax),%ebp
1138   93f978:	44 8b 22             	mov    (%rdx),%r12d
113b   93f97b:	48 89 e8             	mov    %rbp,%rax
113e   93f97e:	48 c1 e8 04          	shr    $0x4,%rax
1142   93f982:	4c 89 f3             	mov    %r14,%rbx
1145   93f985:	48 c1 eb 04          	shr    $0x4,%rbx
1149   93f989:	48 85 c0             	test   %rax,%rax
114c   93f98c:	8b 7c 24 04          	mov    0x4(%rsp),%edi
1150   93f990:	41 0f 45 fc          	cmovne %r12d,%edi
1154   93f994:	4c 8b 7c 24 20       	mov    0x20(%rsp),%r15
1159   93f999:	4c 09 f8             	or     %r15,%rax
115c   93f99c:	0f 85 f3 7c 00 00    	jne    947695 <___bpf_prog_run+0x8e55>
1162   93f9a2:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
1167   93f9a7:	48 8d 3c d8          	lea    (%rax,%rbx,8),%rdi
116b   93f9ab:	48 89 c3             	mov    %rax,%rbx
116e   93f9ae:	44 8b 2f             	mov    (%rdi),%r13d
1171   93f9b1:	e8 00 00 00 00       	call   93f9b6 <___bpf_prog_run+0x1176>	93f9b2: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
1176   93f9b6:	8b 00                	mov    (%rax),%eax
1178   93f9b8:	89 44 24 18          	mov    %eax,0x18(%rsp)
117c   93f9bc:	8b 02                	mov    (%rdx),%eax
117e   93f9be:	89 44 24 08          	mov    %eax,0x8(%rsp)
1182   93f9c2:	83 e5 0f             	and    $0xf,%ebp
1185   93f9c5:	41 83 e6 0f          	and    $0xf,%r14d
1189   93f9c9:	48 85 ed             	test   %rbp,%rbp
118c   93f9cc:	44 0f 44 64 24 04    	cmove  0x4(%rsp),%r12d
1192   93f9d2:	4c 09 fd             	or     %r15,%rbp
1195   93f9d5:	0f 85 c4 7c 00 00    	jne    94769f <___bpf_prog_run+0x8e5f>
119b   93f9db:	45 89 e7             	mov    %r12d,%r15d
119e   93f9de:	41 83 e5 1f          	and    $0x1f,%r13d
11a2   93f9e2:	4e 8d 24 f3          	lea    (%rbx,%r14,8),%r12
11a6   93f9e6:	45 8b 34 24          	mov    (%r12),%r14d
11aa   93f9ea:	4c 89 e7             	mov    %r12,%rdi
11ad   93f9ed:	e8 00 00 00 00       	call   93f9f2 <___bpf_prog_run+0x11b2>	93f9ee: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
11b2   93f9f2:	8b 18                	mov    (%rax),%ebx
11b4   93f9f4:	31 c0                	xor    %eax,%eax
11b6   93f9f6:	f6 44 24 18 1f       	testb  $0x1f,0x18(%rsp)
11bb   93f9fb:	0f 95 c1             	setne  %cl
11be   93f9fe:	75 06                	jne    93fa06 <___bpf_prog_run+0x11c6>
11c0   93fa00:	8b 12                	mov    (%rdx),%edx
11c2   93fa02:	89 54 24 08          	mov    %edx,0x8(%rsp)
11c6   93fa06:	88 c8                	mov    %cl,%al
11c8   93fa08:	f7 d8                	neg    %eax
11ca   93fa0a:	44 89 e9             	mov    %r13d,%ecx
11cd   93fa0d:	d3 e3                	shl    %cl,%ebx
11cf   93fa0f:	09 c3                	or     %eax,%ebx
11d1   93fa11:	41 d3 e6             	shl    %cl,%r14d
11d4   93fa14:	48 85 ed             	test   %rbp,%rbp
11d7   93fa17:	0f 84 f4 47 00 00    	je     944211 <___bpf_prog_run+0x59d1>
11dd   93fa1d:	44 89 ff             	mov    %r15d,%edi
11e0   93fa20:	e8 00 00 00 00       	call   93fa25 <___bpf_prog_run+0x11e5>	93fa21: R_X86_64_PLT32	__msan_warning-0x4
11e5   93fa25:	e9 e7 47 00 00       	jmp    944211 <___bpf_prog_run+0x59d1>
11ea   93fa2a:	0b 18                	or     (%rax),%ebx
11ec   93fa2c:	0f 85 eb fe ff ff    	jne    93f91d <___bpf_prog_run+0x10dd>
11f2   93fa32:	45 39 fc             	cmp    %r15d,%r12d
11f5   93fa35:	0f 83 f3 fe ff ff    	jae    93f92e <___bpf_prog_run+0x10ee>
11fb   93fa3b:	e8 00 00 00 00       	call   93fa40 <___bpf_prog_run+0x1200>	93fa3c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1200   93fa40:	e9 b1 ee ff ff       	jmp    93e8f6 <___bpf_prog_run+0xb6>
1205   93fa45:	49 8d 5d 01          	lea    0x1(%r13),%rbx
1209   93fa49:	4d 85 f6             	test   %r14,%r14
120c   93fa4c:	0f 85 5a 7c 00 00    	jne    9476ac <___bpf_prog_run+0x8e6c>
1212   93fa52:	0f b6 2b             	movzbl (%rbx),%ebp
1215   93fa55:	48 89 df             	mov    %rbx,%rdi
1218   93fa58:	e8 00 00 00 00       	call   93fa5d <___bpf_prog_run+0x121d>	93fa59: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
121d   93fa5d:	0f b6 00             	movzbl (%rax),%eax
1220   93fa60:	83 e0 0f             	and    $0xf,%eax
1223   93fa63:	8b 7c 24 04          	mov    0x4(%rsp),%edi
1227   93fa67:	48 85 c0             	test   %rax,%rax
122a   93fa6a:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
122f   93fa6f:	74 02                	je     93fa73 <___bpf_prog_run+0x1233>
1231   93fa71:	8b 3a                	mov    (%rdx),%edi
1233   93fa73:	83 e5 0f             	and    $0xf,%ebp
1236   93fa76:	48 09 c8             	or     %rcx,%rax
1239   93fa79:	0f 85 3a 7c 00 00    	jne    9476b9 <___bpf_prog_run+0x8e79>
123f   93fa7f:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
1244   93fa84:	48 8d 3c e8          	lea    (%rax,%rbp,8),%rdi
1248   93fa88:	4c 8b 3f             	mov    (%rdi),%r15
124b   93fa8b:	e8 00 00 00 00       	call   93fa90 <___bpf_prog_run+0x1250>	93fa8c: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
1250   93fa90:	49 8d 6d 04          	lea    0x4(%r13),%rbp
1254   93fa94:	48 8b 18             	mov    (%rax),%rbx
1257   93fa97:	44 8b 32             	mov    (%rdx),%r14d
125a   93fa9a:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
1260   93faa0:	0f 85 1d 7c 00 00    	jne    9476c3 <___bpf_prog_run+0x8e83>
1266   93faa6:	4c 63 65 00          	movslq 0x0(%rbp),%r12
126a   93faaa:	48 89 ef             	mov    %rbp,%rdi
126d   93faad:	e8 00 00 00 00       	call   93fab2 <___bpf_prog_run+0x1272>	93faae: R_X86_64_PLT32	__msan_metadata_ptr_for_load_4-0x4
1272   93fab2:	48 63 00             	movslq (%rax),%rax
1275   93fab5:	48 85 c0             	test   %rax,%rax
1278   93fab8:	74 1f                	je     93fad9 <___bpf_prog_run+0x1299>
127a   93faba:	44 8b 32             	mov    (%rdx),%r14d
127d   93fabd:	48 09 c3             	or     %rax,%rbx
1280   93fac0:	74 1c                	je     93fade <___bpf_prog_run+0x129e>
1282   93fac2:	44 89 f7             	mov    %r14d,%edi
1285   93fac5:	e8 00 00 00 00       	call   93faca <___bpf_prog_run+0x128a>	93fac6: R_X86_64_PLT32	__msan_warning-0x4
128a   93faca:	4d 39 e7             	cmp    %r12,%r15
128d   93facd:	72 14                	jb     93fae3 <___bpf_prog_run+0x12a3>
128f   93facf:	e8 00 00 00 00       	call   93fad4 <___bpf_prog_run+0x1294>	93fad0: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1294   93fad4:	e9 1d ee ff ff       	jmp    93e8f6 <___bpf_prog_run+0xb6>
1299   93fad9:	48 09 c3             	or     %rax,%rbx
129c   93fadc:	75 e4                	jne    93fac2 <___bpf_prog_run+0x1282>
129e   93fade:	4d 39 e7             	cmp    %r12,%r15
12a1   93fae1:	73 ec                	jae    93facf <___bpf_prog_run+0x128f>
12a3   93fae3:	e8 00 00 00 00       	call   93fae8 <___bpf_prog_run+0x12a8>	93fae4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
12a8   93fae8:	49 8d 5d 02          	lea    0x2(%r13),%rbx
12ac   93faec:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
12b1   93faf1:	4d 85 f6             	test   %r14,%r14
12b4   93faf4:	0f 84 c2 89 00 00    	je     9484bc <___bpf_prog_run+0x9c7c>
12ba   93fafa:	8b 3c 24             	mov    (%rsp),%edi
12bd   93fafd:	e8 00 00 00 00       	call   93fb02 <___bpf_prog_run+0x12c2>	93fafe: R_X86_64_PLT32	__msan_warning-0x4
12c2   93fb02:	e9 b5 89 00 00       	jmp    9484bc <___bpf_prog_run+0x9c7c>
12c7   93fb07:	e8 00 00 00 00       	call   93fb0c <___bpf_prog_run+0x12cc>	93fb08: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
12cc   93fb0c:	49 8d 5d 01          	lea    0x1(%r13),%rbx
12d0   93fb10:	4d 85 f6             	test   %r14,%r14
12d3   93fb13:	0f 85 b7 7b 00 00    	jne    9476d0 <___bpf_prog_run+0x8e90>
12d9   93fb19:	0f b6 2b             	movzbl (%rbx),%ebp
12dc   93fb1c:	48 89 df             	mov    %rbx,%rdi
12df   93fb1f:	e8 00 00 00 00       	call   93fb24 <___bpf_prog_run+0x12e4>	93fb20: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
12e4   93fb24:	44 0f b6 30          	movzbl (%rax),%r14d
12e8   93fb28:	41 83 e6 0f          	and    $0xf,%r14d
12ec   93fb2c:	8b 5c 24 04          	mov    0x4(%rsp),%ebx
12f0   93fb30:	4d 85 f6             	test   %r14,%r14
12f3   93fb33:	74 02                	je     93fb37 <___bpf_prog_run+0x12f7>
12f5   93fb35:	8b 1a                	mov    (%rdx),%ebx
12f7   93fb37:	4d 89 ef             	mov    %r13,%r15
12fa   93fb3a:	83 e5 0f             	and    $0xf,%ebp
12fd   93fb3d:	4c 0b 74 24 20       	or     0x20(%rsp),%r14
1302   93fb42:	0f 85 95 7b 00 00    	jne    9476dd <___bpf_prog_run+0x8e9d>
1308   93fb48:	89 5c 24 08          	mov    %ebx,0x8(%rsp)
130c   93fb4c:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
1311   93fb51:	4c 8d 2c e8          	lea    (%rax,%rbp,8),%r13
1315   93fb55:	45 8b 65 00          	mov    0x0(%r13),%r12d
1319   93fb59:	4c 89 ef             	mov    %r13,%rdi
131c   93fb5c:	e8 00 00 00 00       	call   93fb61 <___bpf_prog_run+0x1321>	93fb5d: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
1321   93fb61:	49 8d 6f 04          	lea    0x4(%r15),%rbp
1325   93fb65:	8b 18                	mov    (%rax),%ebx
1327   93fb67:	8b 02                	mov    (%rdx),%eax
1329   93fb69:	89 44 24 18          	mov    %eax,0x18(%rsp)
132d   93fb6d:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
1333   93fb73:	0f 85 70 7b 00 00    	jne    9476e9 <___bpf_prog_run+0x8ea9>
1339   93fb79:	44 33 65 00          	xor    0x0(%rbp),%r12d
133d   93fb7d:	48 89 ef             	mov    %rbp,%rdi
1340   93fb80:	e8 00 00 00 00       	call   93fb85 <___bpf_prog_run+0x1345>	93fb81: R_X86_64_PLT32	__msan_metadata_ptr_for_load_4-0x4
1345   93fb85:	8b 28                	mov    (%rax),%ebp
1347   93fb87:	09 dd                	or     %ebx,%ebp
1349   93fb89:	85 db                	test   %ebx,%ebx
134b   93fb8b:	75 06                	jne    93fb93 <___bpf_prog_run+0x1353>
134d   93fb8d:	8b 02                	mov    (%rdx),%eax
134f   93fb8f:	89 44 24 18          	mov    %eax,0x18(%rsp)
1353   93fb93:	4d 85 f6             	test   %r14,%r14
1356   93fb96:	0f 84 fa 3e 00 00    	je     943a96 <___bpf_prog_run+0x5256>
135c   93fb9c:	8b 7c 24 08          	mov    0x8(%rsp),%edi
1360   93fba0:	e8 00 00 00 00       	call   93fba5 <___bpf_prog_run+0x1365>	93fba1: R_X86_64_PLT32	__msan_warning-0x4
1365   93fba5:	e9 ec 3e 00 00       	jmp    943a96 <___bpf_prog_run+0x5256>
136a   93fbaa:	49 8d 5d 01          	lea    0x1(%r13),%rbx
136e   93fbae:	4d 85 f6             	test   %r14,%r14
1371   93fbb1:	0f 85 3f 7b 00 00    	jne    9476f6 <___bpf_prog_run+0x8eb6>
1377   93fbb7:	0f b6 2b             	movzbl (%rbx),%ebp
137a   93fbba:	48 89 df             	mov    %rbx,%rdi
137d   93fbbd:	e8 00 00 00 00       	call   93fbc2 <___bpf_prog_run+0x1382>	93fbbe: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
1382   93fbc2:	0f b6 00             	movzbl (%rax),%eax
1385   93fbc5:	83 e0 0f             	and    $0xf,%eax
1388   93fbc8:	8b 7c 24 04          	mov    0x4(%rsp),%edi
138c   93fbcc:	48 85 c0             	test   %rax,%rax
138f   93fbcf:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
1394   93fbd4:	74 02                	je     93fbd8 <___bpf_prog_run+0x1398>
1396   93fbd6:	8b 3a                	mov    (%rdx),%edi
1398   93fbd8:	83 e5 0f             	and    $0xf,%ebp
139b   93fbdb:	48 09 c8             	or     %rcx,%rax
139e   93fbde:	0f 85 1f 7b 00 00    	jne    947703 <___bpf_prog_run+0x8ec3>
13a4   93fbe4:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
13a9   93fbe9:	48 8d 3c e8          	lea    (%rax,%rbp,8),%rdi
13ad   93fbed:	44 8b 3f             	mov    (%rdi),%r15d
13b0   93fbf0:	e8 00 00 00 00       	call   93fbf5 <___bpf_prog_run+0x13b5>	93fbf1: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
13b5   93fbf5:	49 8d 6d 04          	lea    0x4(%r13),%rbp
13b9   93fbf9:	8b 18                	mov    (%rax),%ebx
13bb   93fbfb:	44 8b 32             	mov    (%rdx),%r14d
13be   93fbfe:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
13c4   93fc04:	0f 85 03 7b 00 00    	jne    94770d <___bpf_prog_run+0x8ecd>
13ca   93fc0a:	44 8b 65 00          	mov    0x0(%rbp),%r12d
13ce   93fc0e:	48 89 ef             	mov    %rbp,%rdi
13d1   93fc11:	e8 00 00 00 00       	call   93fc16 <___bpf_prog_run+0x13d6>	93fc12: R_X86_64_PLT32	__msan_metadata_ptr_for_load_4-0x4
13d6   93fc16:	85 db                	test   %ebx,%ebx
13d8   93fc18:	75 38                	jne    93fc52 <___bpf_prog_run+0x1412>
13da   93fc1a:	44 8b 32             	mov    (%rdx),%r14d
13dd   93fc1d:	0b 18                	or     (%rax),%ebx
13df   93fc1f:	74 35                	je     93fc56 <___bpf_prog_run+0x1416>
13e1   93fc21:	44 89 f7             	mov    %r14d,%edi
13e4   93fc24:	e8 00 00 00 00       	call   93fc29 <___bpf_prog_run+0x13e9>	93fc25: R_X86_64_PLT32	__msan_warning-0x4
13e9   93fc29:	45 39 fc             	cmp    %r15d,%r12d
13ec   93fc2c:	77 2d                	ja     93fc5b <___bpf_prog_run+0x141b>
13ee   93fc2e:	e8 00 00 00 00       	call   93fc33 <___bpf_prog_run+0x13f3>	93fc2f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
13f3   93fc33:	49 8d 5d 02          	lea    0x2(%r13),%rbx
13f7   93fc37:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
13fc   93fc3c:	4d 85 f6             	test   %r14,%r14
13ff   93fc3f:	0f 84 77 88 00 00    	je     9484bc <___bpf_prog_run+0x9c7c>
1405   93fc45:	8b 3c 24             	mov    (%rsp),%edi
1408   93fc48:	e8 00 00 00 00       	call   93fc4d <___bpf_prog_run+0x140d>	93fc49: R_X86_64_PLT32	__msan_warning-0x4
140d   93fc4d:	e9 6a 88 00 00       	jmp    9484bc <___bpf_prog_run+0x9c7c>
1412   93fc52:	0b 18                	or     (%rax),%ebx
1414   93fc54:	75 cb                	jne    93fc21 <___bpf_prog_run+0x13e1>
1416   93fc56:	45 39 fc             	cmp    %r15d,%r12d
1419   93fc59:	76 d3                	jbe    93fc2e <___bpf_prog_run+0x13ee>
141b   93fc5b:	e8 00 00 00 00       	call   93fc60 <___bpf_prog_run+0x1420>	93fc5c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1420   93fc60:	e9 91 ec ff ff       	jmp    93e8f6 <___bpf_prog_run+0xb6>
1425   93fc65:	e8 00 00 00 00       	call   93fc6a <___bpf_prog_run+0x142a>	93fc66: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
142a   93fc6a:	49 8d 5d 01          	lea    0x1(%r13),%rbx
142e   93fc6e:	4d 85 f6             	test   %r14,%r14
1431   93fc71:	0f 85 a3 7a 00 00    	jne    94771a <___bpf_prog_run+0x8eda>
1437   93fc77:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
143c   93fc7c:	44 0f b6 3b          	movzbl (%rbx),%r15d
1440   93fc80:	48 89 df             	mov    %rbx,%rdi
1443   93fc83:	e8 00 00 00 00       	call   93fc88 <___bpf_prog_run+0x1448>	93fc84: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
1448   93fc88:	0f b6 00             	movzbl (%rax),%eax
144b   93fc8b:	8b 3a                	mov    (%rdx),%edi
144d   93fc8d:	89 c5                	mov    %eax,%ebp
144f   93fc8f:	83 e5 0f             	and    $0xf,%ebp
1452   93fc92:	48 85 ed             	test   %rbp,%rbp
1455   93fc95:	8b 4c 24 04          	mov    0x4(%rsp),%ecx
1459   93fc99:	89 ca                	mov    %ecx,%edx
145b   93fc9b:	0f 45 d7             	cmovne %edi,%edx
145e   93fc9e:	89 54 24 18          	mov    %edx,0x18(%rsp)
1462   93fca2:	48 c1 e8 04          	shr    $0x4,%rax
1466   93fca6:	4c 89 fb             	mov    %r15,%rbx
1469   93fca9:	48 c1 eb 04          	shr    $0x4,%rbx
146d   93fcad:	48 85 c0             	test   %rax,%rax
1470   93fcb0:	0f 44 f9             	cmove  %ecx,%edi
1473   93fcb3:	48 0b 44 24 20       	or     0x20(%rsp),%rax
1478   93fcb8:	0f 85 69 7a 00 00    	jne    947727 <___bpf_prog_run+0x8ee7>
147e   93fcbe:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
1483   93fcc3:	48 8d 3c d8          	lea    (%rax,%rbx,8),%rdi
1487   93fcc7:	4c 8b 2f             	mov    (%rdi),%r13
148a   93fcca:	e8 00 00 00 00       	call   93fccf <___bpf_prog_run+0x148f>	93fccb: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
148f   93fccf:	4c 8b 64 24 28       	mov    0x28(%rsp),%r12
1494   93fcd4:	4d 8d 74 24 02       	lea    0x2(%r12),%r14
1499   93fcd9:	48 8b 18             	mov    (%rax),%rbx
149c   93fcdc:	8b 02                	mov    (%rdx),%eax
149e   93fcde:	89 44 24 08          	mov    %eax,0x8(%rsp)
14a2   93fce2:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
14a8   93fce8:	0f 85 43 7a 00 00    	jne    947731 <___bpf_prog_run+0x8ef1>
14ae   93fcee:	41 83 e7 0f          	and    $0xf,%r15d
14b2   93fcf2:	48 0b 6c 24 20       	or     0x20(%rsp),%rbp
14b7   93fcf7:	4d 0f bf 64 24 02    	movswq 0x2(%r12),%r12
14bd   93fcfd:	4c 89 f7             	mov    %r14,%rdi
14c0   93fd00:	e8 00 00 00 00       	call   93fd05 <___bpf_prog_run+0x14c5>	93fd01: R_X86_64_PLT32	__msan_metadata_ptr_for_load_2-0x4
14c5   93fd05:	48 0f bf 00          	movswq (%rax),%rax
14c9   93fd09:	48 09 c3             	or     %rax,%rbx
14cc   93fd0c:	48 85 c0             	test   %rax,%rax
14cf   93fd0f:	8b 74 24 08          	mov    0x8(%rsp),%esi
14d3   93fd13:	74 02                	je     93fd17 <___bpf_prog_run+0x14d7>
14d5   93fd15:	8b 32                	mov    (%rdx),%esi
14d7   93fd17:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
14dc   93fd1c:	4a 8d 3c f8          	lea    (%rax,%r15,8),%rdi
14e0   93fd20:	4d 01 e5             	add    %r12,%r13
14e3   93fd23:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
14e8   93fd28:	48 89 28             	mov    %rbp,(%rax)
14eb   93fd2b:	8b 4c 24 18          	mov    0x18(%rsp),%ecx
14ef   93fd2f:	89 88 88 0c 00 00    	mov    %ecx,0xc88(%rax)
14f5   93fd35:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
14fc   93fd3c:	48 89 58 10          	mov    %rbx,0x10(%rax)
1500   93fd40:	89 b0 98 0c 00 00    	mov    %esi,0xc98(%rax)
1506   93fd46:	48 c7 80 20 03 00 00 00 00 00 00 	movq   $0x0,0x320(%rax)
1511   93fd51:	be 08 00 00 00       	mov    $0x8,%esi
1516   93fd56:	4c 89 ea             	mov    %r13,%rdx
1519   93fd59:	e8 00 00 00 00       	call   93fd5e <___bpf_prog_run+0x151e>	93fd5a: R_X86_64_PLT32	bpf_probe_read_kernel-0x4
151e   93fd5e:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
1523   93fd63:	e9 8e eb ff ff       	jmp    93e8f6 <___bpf_prog_run+0xb6>
1528   93fd68:	e8 00 00 00 00       	call   93fd6d <___bpf_prog_run+0x152d>	93fd69: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
152d   93fd6d:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
1532   93fd72:	49 8d 5d 01          	lea    0x1(%r13),%rbx
1536   93fd76:	4d 85 f6             	test   %r14,%r14
1539   93fd79:	0f 85 bf 79 00 00    	jne    94773e <___bpf_prog_run+0x8efe>
153f   93fd7f:	44 0f b6 2b          	movzbl (%rbx),%r13d
1543   93fd83:	48 89 df             	mov    %rbx,%rdi
1546   93fd86:	e8 00 00 00 00       	call   93fd8b <___bpf_prog_run+0x154b>	93fd87: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
154b   93fd8b:	0f b6 18             	movzbl (%rax),%ebx
154e   93fd8e:	44 8b 32             	mov    (%rdx),%r14d
1551   93fd91:	41 89 dc             	mov    %ebx,%r12d
1554   93fd94:	41 83 e4 0f          	and    $0xf,%r12d
1558   93fd98:	44 89 ed             	mov    %r13d,%ebp
155b   93fd9b:	83 e5 0f             	and    $0xf,%ebp
155e   93fd9e:	4d 85 e4             	test   %r12,%r12
1561   93fda1:	8b 44 24 04          	mov    0x4(%rsp),%eax
1565   93fda5:	41 0f 45 c6          	cmovne %r14d,%eax
1569   93fda9:	89 44 24 40          	mov    %eax,0x40(%rsp)
156d   93fdad:	4c 8b 7c 24 20       	mov    0x20(%rsp),%r15
1572   93fdb2:	4d 09 fc             	or     %r15,%r12
1575   93fdb5:	0f 85 90 79 00 00    	jne    94774b <___bpf_prog_run+0x8f0b>
157b   93fdbb:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
1580   93fdc0:	48 8d 3c e8          	lea    (%rax,%rbp,8),%rdi
1584   93fdc4:	48 8b 07             	mov    (%rdi),%rax
1587   93fdc7:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
158c   93fdcc:	48 89 7c 24 18       	mov    %rdi,0x18(%rsp)
1591   93fdd1:	e8 00 00 00 00       	call   93fdd6 <___bpf_prog_run+0x1596>	93fdd2: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
1596   93fdd6:	48 8b 28             	mov    (%rax),%rbp
1599   93fdd9:	8b 02                	mov    (%rdx),%eax
159b   93fddb:	89 44 24 38          	mov    %eax,0x38(%rsp)
159f   93fddf:	48 c1 eb 04          	shr    $0x4,%rbx
15a3   93fde3:	49 c1 ed 04          	shr    $0x4,%r13
15a7   93fde7:	48 85 db             	test   %rbx,%rbx
15aa   93fdea:	44 0f 44 74 24 04    	cmove  0x4(%rsp),%r14d
15b0   93fdf0:	4c 09 fb             	or     %r15,%rbx
15b3   93fdf3:	0f 85 60 79 00 00    	jne    947759 <___bpf_prog_run+0x8f19>
15b9   93fdf9:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
15be   93fdfe:	4a 8d 3c e8          	lea    (%rax,%r13,8),%rdi
15c2   93fe02:	44 8b 37             	mov    (%rdi),%r14d
15c5   93fe05:	e8 00 00 00 00       	call   93fe0a <___bpf_prog_run+0x15ca>	93fe06: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
15ca   93fe0a:	8b 08                	mov    (%rax),%ecx
15cc   93fe0c:	44 89 f3             	mov    %r14d,%ebx
15cf   93fe0f:	f7 d3                	not    %ebx
15d1   93fe11:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
15d6   93fe16:	89 f0                	mov    %esi,%eax
15d8   93fe18:	f7 d0                	not    %eax
15da   93fe1a:	21 c8                	and    %ecx,%eax
15dc   93fe1c:	09 cb                	or     %ecx,%ebx
15de   93fe1e:	21 eb                	and    %ebp,%ebx
15e0   93fe20:	48 85 ed             	test   %rbp,%rbp
15e3   93fe23:	48 89 f5             	mov    %rsi,%rbp
15e6   93fe26:	75 06                	jne    93fe2e <___bpf_prog_run+0x15ee>
15e8   93fe28:	8b 0a                	mov    (%rdx),%ecx
15ea   93fe2a:	89 4c 24 38          	mov    %ecx,0x38(%rsp)
15ee   93fe2e:	09 c3                	or     %eax,%ebx
15f0   93fe30:	4d 85 e4             	test   %r12,%r12
15f3   93fe33:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
15f8   93fe38:	0f 85 28 79 00 00    	jne    947766 <___bpf_prog_run+0x8f26>
15fe   93fe3e:	41 09 ee             	or     %ebp,%r14d
1601   93fe41:	48 8b 6c 24 18       	mov    0x18(%rsp),%rbp
1606   93fe46:	48 89 ef             	mov    %rbp,%rdi
1609   93fe49:	e8 00 00 00 00       	call   93fe4e <___bpf_prog_run+0x160e>	93fe4a: R_X86_64_PLT32	__msan_metadata_ptr_for_store_8-0x4
160e   93fe4e:	48 89 18             	mov    %rbx,(%rax)
1611   93fe51:	48 85 db             	test   %rbx,%rbx
1614   93fe54:	0f 84 96 51 00 00    	je     944ff0 <___bpf_prog_run+0x67b0>
161a   93fe5a:	49 89 d7             	mov    %rdx,%r15
161d   93fe5d:	8b 7c 24 38          	mov    0x38(%rsp),%edi
1621   93fe61:	e9 9a 73 00 00       	jmp    947200 <___bpf_prog_run+0x89c0>
1626   93fe66:	49 8d 5d 01          	lea    0x1(%r13),%rbx
162a   93fe6a:	4d 85 f6             	test   %r14,%r14
162d   93fe6d:	0f 85 01 79 00 00    	jne    947774 <___bpf_prog_run+0x8f34>
1633   93fe73:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
1638   93fe78:	44 0f b6 33          	movzbl (%rbx),%r14d
163c   93fe7c:	48 89 df             	mov    %rbx,%rdi
163f   93fe7f:	e8 00 00 00 00       	call   93fe84 <___bpf_prog_run+0x1644>	93fe80: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
1644   93fe84:	0f b6 18             	movzbl (%rax),%ebx
1647   93fe87:	44 8b 22             	mov    (%rdx),%r12d
164a   93fe8a:	89 d8                	mov    %ebx,%eax
164c   93fe8c:	83 e0 0f             	and    $0xf,%eax
164f   93fe8f:	44 89 f5             	mov    %r14d,%ebp
1652   93fe92:	83 e5 0f             	and    $0xf,%ebp
1655   93fe95:	48 85 c0             	test   %rax,%rax
1658   93fe98:	44 8b 7c 24 04       	mov    0x4(%rsp),%r15d
165d   93fe9d:	44 89 ff             	mov    %r15d,%edi
1660   93fea0:	41 0f 45 fc          	cmovne %r12d,%edi
1664   93fea4:	48 0b 44 24 20       	or     0x20(%rsp),%rax
1669   93fea9:	0f 85 d2 78 00 00    	jne    947781 <___bpf_prog_run+0x8f41>
166f   93feaf:	4c 8b 6c 24 30       	mov    0x30(%rsp),%r13
1674   93feb4:	48 8d 3c ed 00 00 00 00 	lea    0x0(,%rbp,8),%rdi
167c   93febc:	4c 01 ef             	add    %r13,%rdi
167f   93febf:	8b 07                	mov    (%rdi),%eax
1681   93fec1:	89 44 24 18          	mov    %eax,0x18(%rsp)
1685   93fec5:	e8 00 00 00 00       	call   93feca <___bpf_prog_run+0x168a>	93fec6: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
168a   93feca:	4c 89 ed             	mov    %r13,%rbp
168d   93fecd:	44 8b 28             	mov    (%rax),%r13d
1690   93fed0:	8b 02                	mov    (%rdx),%eax
1692   93fed2:	89 44 24 08          	mov    %eax,0x8(%rsp)
1696   93fed6:	48 c1 eb 04          	shr    $0x4,%rbx
169a   93feda:	49 c1 ee 04          	shr    $0x4,%r14
169e   93fede:	48 85 db             	test   %rbx,%rbx
16a1   93fee1:	45 0f 44 e7          	cmove  %r15d,%r12d
16a5   93fee5:	48 0b 5c 24 20       	or     0x20(%rsp),%rbx
16aa   93feea:	0f 85 9b 78 00 00    	jne    94778b <___bpf_prog_run+0x8f4b>
16b0   93fef0:	4a 8d 3c f5 00 00 00 00 	lea    0x0(,%r14,8),%rdi
16b8   93fef8:	48 01 ef             	add    %rbp,%rdi
16bb   93fefb:	8b 1f                	mov    (%rdi),%ebx
16bd   93fefd:	e8 00 00 00 00       	call   93ff02 <___bpf_prog_run+0x16c2>	93fefe: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
16c2   93ff02:	8b 00                	mov    (%rax),%eax
16c4   93ff04:	85 c0                	test   %eax,%eax
16c6   93ff06:	74 06                	je     93ff0e <___bpf_prog_run+0x16ce>
16c8   93ff08:	8b 0a                	mov    (%rdx),%ecx
16ca   93ff0a:	89 4c 24 08          	mov    %ecx,0x8(%rsp)
16ce   93ff0e:	41 09 c5             	or     %eax,%r13d
16d1   93ff11:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
16d6   93ff16:	0f 85 7c 78 00 00    	jne    947798 <___bpf_prog_run+0x8f58>
16dc   93ff1c:	39 5c 24 18          	cmp    %ebx,0x18(%rsp)
16e0   93ff20:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
16e5   93ff25:	0f 86 c0 52 00 00    	jbe    9451eb <___bpf_prog_run+0x69ab>
16eb   93ff2b:	e8 00 00 00 00       	call   93ff30 <___bpf_prog_run+0x16f0>	93ff2c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
16f0   93ff30:	49 83 c5 08          	add    $0x8,%r13
16f4   93ff34:	e9 c6 e9 ff ff       	jmp    93e8ff <___bpf_prog_run+0xbf>
16f9   93ff39:	49 8d 5d 01          	lea    0x1(%r13),%rbx
16fd   93ff3d:	4d 85 f6             	test   %r14,%r14
1700   93ff40:	0f 85 60 78 00 00    	jne    9477a6 <___bpf_prog_run+0x8f66>
1706   93ff46:	0f b6 2b             	movzbl (%rbx),%ebp
1709   93ff49:	48 89 df             	mov    %rbx,%rdi
170c   93ff4c:	e8 00 00 00 00       	call   93ff51 <___bpf_prog_run+0x1711>	93ff4d: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
1711   93ff51:	0f b6 00             	movzbl (%rax),%eax
1714   93ff54:	83 e0 0f             	and    $0xf,%eax
1717   93ff57:	8b 7c 24 04          	mov    0x4(%rsp),%edi
171b   93ff5b:	48 85 c0             	test   %rax,%rax
171e   93ff5e:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
1723   93ff63:	74 02                	je     93ff67 <___bpf_prog_run+0x1727>
1725   93ff65:	8b 3a                	mov    (%rdx),%edi
1727   93ff67:	83 e5 0f             	and    $0xf,%ebp
172a   93ff6a:	48 09 c8             	or     %rcx,%rax
172d   93ff6d:	0f 85 40 78 00 00    	jne    9477b3 <___bpf_prog_run+0x8f73>
1733   93ff73:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
1738   93ff78:	48 8d 3c e8          	lea    (%rax,%rbp,8),%rdi
173c   93ff7c:	44 8b 3f             	mov    (%rdi),%r15d
173f   93ff7f:	e8 00 00 00 00       	call   93ff84 <___bpf_prog_run+0x1744>	93ff80: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
1744   93ff84:	49 8d 6d 04          	lea    0x4(%r13),%rbp
1748   93ff88:	44 8b 20             	mov    (%rax),%r12d
174b   93ff8b:	44 8b 32             	mov    (%rdx),%r14d
174e   93ff8e:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
1754   93ff94:	0f 85 23 78 00 00    	jne    9477bd <___bpf_prog_run+0x8f7d>
175a   93ff9a:	8b 5d 00             	mov    0x0(%rbp),%ebx
175d   93ff9d:	48 89 ef             	mov    %rbp,%rdi
1760   93ffa0:	e8 00 00 00 00       	call   93ffa5 <___bpf_prog_run+0x1765>	93ffa1: R_X86_64_PLT32	__msan_metadata_ptr_for_load_4-0x4
1765   93ffa5:	8b 00                	mov    (%rax),%eax
1767   93ffa7:	89 c1                	mov    %eax,%ecx
1769   93ffa9:	44 21 f9             	and    %r15d,%ecx
176c   93ffac:	09 d8                	or     %ebx,%eax
176e   93ffae:	44 21 e0             	and    %r12d,%eax
1771   93ffb1:	09 c8                	or     %ecx,%eax
1773   93ffb3:	45 85 e4             	test   %r12d,%r12d
1776   93ffb6:	75 03                	jne    93ffbb <___bpf_prog_run+0x177b>
1778   93ffb8:	44 8b 32             	mov    (%rdx),%r14d
177b   93ffbb:	44 21 fb             	and    %r15d,%ebx
177e   93ffbe:	85 c0                	test   %eax,%eax
1780   93ffc0:	74 0a                	je     93ffcc <___bpf_prog_run+0x178c>
1782   93ffc2:	f7 d0                	not    %eax
1784   93ffc4:	21 d8                	and    %ebx,%eax
1786   93ffc6:	0f 84 fe 77 00 00    	je     9477ca <___bpf_prog_run+0x8f8a>
178c   93ffcc:	85 db                	test   %ebx,%ebx
178e   93ffce:	0f 84 06 78 00 00    	je     9477da <___bpf_prog_run+0x8f9a>
1794   93ffd4:	e8 00 00 00 00       	call   93ffd9 <___bpf_prog_run+0x1799>	93ffd5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1799   93ffd9:	49 8d 5d 02          	lea    0x2(%r13),%rbx
179d   93ffdd:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
17a2   93ffe2:	4d 85 f6             	test   %r14,%r14
17a5   93ffe5:	0f 84 d1 84 00 00    	je     9484bc <___bpf_prog_run+0x9c7c>
17ab   93ffeb:	8b 3c 24             	mov    (%rsp),%edi
17ae   93ffee:	e8 00 00 00 00       	call   93fff3 <___bpf_prog_run+0x17b3>	93ffef: R_X86_64_PLT32	__msan_warning-0x4
17b3   93fff3:	e9 c4 84 00 00       	jmp    9484bc <___bpf_prog_run+0x9c7c>
17b8   93fff8:	e8 00 00 00 00       	call   93fffd <___bpf_prog_run+0x17bd>	93fff9: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
17bd   93fffd:	49 8d 5d 01          	lea    0x1(%r13),%rbx
17c1   940001:	4d 85 f6             	test   %r14,%r14
17c4   940004:	0f 85 da 77 00 00    	jne    9477e4 <___bpf_prog_run+0x8fa4>
17ca   94000a:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
17cf   94000f:	44 0f b6 33          	movzbl (%rbx),%r14d
17d3   940013:	48 89 df             	mov    %rbx,%rdi
17d6   940016:	e8 00 00 00 00       	call   94001b <___bpf_prog_run+0x17db>	940017: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
17db   94001b:	0f b6 18             	movzbl (%rax),%ebx
17de   94001e:	44 8b 22             	mov    (%rdx),%r12d
17e1   940021:	48 89 d8             	mov    %rbx,%rax
17e4   940024:	48 c1 e8 04          	shr    $0x4,%rax
17e8   940028:	4c 89 f5             	mov    %r14,%rbp
17eb   94002b:	48 c1 ed 04          	shr    $0x4,%rbp
17ef   94002f:	48 85 c0             	test   %rax,%rax
17f2   940032:	44 8b 7c 24 04       	mov    0x4(%rsp),%r15d
17f7   940037:	44 89 ff             	mov    %r15d,%edi
17fa   94003a:	41 0f 45 fc          	cmovne %r12d,%edi
17fe   94003e:	48 0b 44 24 20       	or     0x20(%rsp),%rax
1803   940043:	0f 85 a8 77 00 00    	jne    9477f1 <___bpf_prog_run+0x8fb1>
1809   940049:	4c 8b 6c 24 30       	mov    0x30(%rsp),%r13
180e   94004e:	48 8d 3c ed 00 00 00 00 	lea    0x0(,%rbp,8),%rdi
1816   940056:	4c 01 ef             	add    %r13,%rdi
1819   940059:	48 8b 07             	mov    (%rdi),%rax
181c   94005c:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
1821   940061:	e8 00 00 00 00       	call   940066 <___bpf_prog_run+0x1826>	940062: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
1826   940066:	4c 89 ed             	mov    %r13,%rbp
1829   940069:	4c 8b 28             	mov    (%rax),%r13
182c   94006c:	8b 02                	mov    (%rdx),%eax
182e   94006e:	89 44 24 08          	mov    %eax,0x8(%rsp)
1832   940072:	83 e3 0f             	and    $0xf,%ebx
1835   940075:	41 83 e6 0f          	and    $0xf,%r14d
1839   940079:	48 85 db             	test   %rbx,%rbx
183c   94007c:	45 0f 44 e7          	cmove  %r15d,%r12d
1840   940080:	48 0b 5c 24 20       	or     0x20(%rsp),%rbx
1845   940085:	0f 84 af 19 00 00    	je     941a3a <___bpf_prog_run+0x31fa>
184b   94008b:	44 89 e7             	mov    %r12d,%edi
184e   94008e:	e8 00 00 00 00       	call   940093 <___bpf_prog_run+0x1853>	94008f: R_X86_64_PLT32	__msan_warning-0x4
1853   940093:	e9 a2 19 00 00       	jmp    941a3a <___bpf_prog_run+0x31fa>
1858   940098:	e8 00 00 00 00       	call   94009d <___bpf_prog_run+0x185d>	940099: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
185d   94009d:	49 8d 5d 01          	lea    0x1(%r13),%rbx
1861   9400a1:	4d 85 f6             	test   %r14,%r14
1864   9400a4:	0f 85 51 77 00 00    	jne    9477fb <___bpf_prog_run+0x8fbb>
186a   9400aa:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
186f   9400af:	44 0f b6 33          	movzbl (%rbx),%r14d
1873   9400b3:	48 89 df             	mov    %rbx,%rdi
1876   9400b6:	e8 00 00 00 00       	call   9400bb <___bpf_prog_run+0x187b>	9400b7: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
187b   9400bb:	0f b6 28             	movzbl (%rax),%ebp
187e   9400be:	44 8b 22             	mov    (%rdx),%r12d
1881   9400c1:	48 89 e8             	mov    %rbp,%rax
1884   9400c4:	48 c1 e8 04          	shr    $0x4,%rax
1888   9400c8:	4c 89 f3             	mov    %r14,%rbx
188b   9400cb:	48 c1 eb 04          	shr    $0x4,%rbx
188f   9400cf:	48 85 c0             	test   %rax,%rax
1892   9400d2:	8b 7c 24 04          	mov    0x4(%rsp),%edi
1896   9400d6:	41 0f 45 fc          	cmovne %r12d,%edi
189a   9400da:	4c 8b 7c 24 20       	mov    0x20(%rsp),%r15
189f   9400df:	4c 09 f8             	or     %r15,%rax
18a2   9400e2:	0f 85 20 77 00 00    	jne    947808 <___bpf_prog_run+0x8fc8>
18a8   9400e8:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
18ad   9400ed:	48 8d 3c d8          	lea    (%rax,%rbx,8),%rdi
18b1   9400f1:	48 89 c3             	mov    %rax,%rbx
18b4   9400f4:	44 8b 2f             	mov    (%rdi),%r13d
18b7   9400f7:	e8 00 00 00 00       	call   9400fc <___bpf_prog_run+0x18bc>	9400f8: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
18bc   9400fc:	8b 00                	mov    (%rax),%eax
18be   9400fe:	89 44 24 18          	mov    %eax,0x18(%rsp)
18c2   940102:	8b 02                	mov    (%rdx),%eax
18c4   940104:	89 44 24 08          	mov    %eax,0x8(%rsp)
18c8   940108:	83 e5 0f             	and    $0xf,%ebp
18cb   94010b:	41 83 e6 0f          	and    $0xf,%r14d
18cf   94010f:	48 85 ed             	test   %rbp,%rbp
18d2   940112:	44 0f 44 64 24 04    	cmove  0x4(%rsp),%r12d
18d8   940118:	4c 09 fd             	or     %r15,%rbp
18db   94011b:	0f 85 f1 76 00 00    	jne    947812 <___bpf_prog_run+0x8fd2>
18e1   940121:	45 89 e7             	mov    %r12d,%r15d
18e4   940124:	41 83 e5 1f          	and    $0x1f,%r13d
18e8   940128:	4e 8d 24 f3          	lea    (%rbx,%r14,8),%r12
18ec   94012c:	45 8b 34 24          	mov    (%r12),%r14d
18f0   940130:	4c 89 e7             	mov    %r12,%rdi
18f3   940133:	e8 00 00 00 00       	call   940138 <___bpf_prog_run+0x18f8>	940134: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
18f8   940138:	8b 18                	mov    (%rax),%ebx
18fa   94013a:	31 c0                	xor    %eax,%eax
18fc   94013c:	f6 44 24 18 1f       	testb  $0x1f,0x18(%rsp)
1901   940141:	0f 95 c1             	setne  %cl
1904   940144:	75 06                	jne    94014c <___bpf_prog_run+0x190c>
1906   940146:	8b 12                	mov    (%rdx),%edx
1908   940148:	89 54 24 08          	mov    %edx,0x8(%rsp)
190c   94014c:	88 c8                	mov    %cl,%al
190e   94014e:	f7 d8                	neg    %eax
1910   940150:	44 89 e9             	mov    %r13d,%ecx
1913   940153:	d3 eb                	shr    %cl,%ebx
1915   940155:	09 c3                	or     %eax,%ebx
1917   940157:	41 d3 ee             	shr    %cl,%r14d
191a   94015a:	48 85 ed             	test   %rbp,%rbp
191d   94015d:	0f 84 ae 40 00 00    	je     944211 <___bpf_prog_run+0x59d1>
1923   940163:	44 89 ff             	mov    %r15d,%edi
1926   940166:	e8 00 00 00 00       	call   94016b <___bpf_prog_run+0x192b>	940167: R_X86_64_PLT32	__msan_warning-0x4
192b   94016b:	e9 a1 40 00 00       	jmp    944211 <___bpf_prog_run+0x59d1>
1930   940170:	49 8d 5d 01          	lea    0x1(%r13),%rbx
1934   940174:	4d 85 f6             	test   %r14,%r14
1937   940177:	0f 85 a2 76 00 00    	jne    94781f <___bpf_prog_run+0x8fdf>
193d   94017d:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
1942   940182:	44 0f b6 33          	movzbl (%rbx),%r14d
1946   940186:	48 89 df             	mov    %rbx,%rdi
1949   940189:	e8 00 00 00 00       	call   94018e <___bpf_prog_run+0x194e>	94018a: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
194e   94018e:	0f b6 18             	movzbl (%rax),%ebx
1951   940191:	44 8b 22             	mov    (%rdx),%r12d
1954   940194:	89 d8                	mov    %ebx,%eax
1956   940196:	83 e0 0f             	and    $0xf,%eax
1959   940199:	44 89 f5             	mov    %r14d,%ebp
195c   94019c:	83 e5 0f             	and    $0xf,%ebp
195f   94019f:	48 85 c0             	test   %rax,%rax
1962   9401a2:	44 8b 7c 24 04       	mov    0x4(%rsp),%r15d
1967   9401a7:	44 89 ff             	mov    %r15d,%edi
196a   9401aa:	41 0f 45 fc          	cmovne %r12d,%edi
196e   9401ae:	48 0b 44 24 20       	or     0x20(%rsp),%rax
1973   9401b3:	0f 85 73 76 00 00    	jne    94782c <___bpf_prog_run+0x8fec>
1979   9401b9:	4c 8b 6c 24 30       	mov    0x30(%rsp),%r13
197e   9401be:	48 8d 3c ed 00 00 00 00 	lea    0x0(,%rbp,8),%rdi
1986   9401c6:	4c 01 ef             	add    %r13,%rdi
1989   9401c9:	48 8b 07             	mov    (%rdi),%rax
198c   9401cc:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
1991   9401d1:	e8 00 00 00 00       	call   9401d6 <___bpf_prog_run+0x1996>	9401d2: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
1996   9401d6:	4c 89 ed             	mov    %r13,%rbp
1999   9401d9:	4c 8b 28             	mov    (%rax),%r13
199c   9401dc:	8b 02                	mov    (%rdx),%eax
199e   9401de:	89 44 24 08          	mov    %eax,0x8(%rsp)
19a2   9401e2:	48 c1 eb 04          	shr    $0x4,%rbx
19a6   9401e6:	49 c1 ee 04          	shr    $0x4,%r14
19aa   9401ea:	48 85 db             	test   %rbx,%rbx
19ad   9401ed:	45 0f 44 e7          	cmove  %r15d,%r12d
19b1   9401f1:	48 0b 5c 24 20       	or     0x20(%rsp),%rbx
19b6   9401f6:	0f 85 3a 76 00 00    	jne    947836 <___bpf_prog_run+0x8ff6>
19bc   9401fc:	4a 8d 3c f5 00 00 00 00 	lea    0x0(,%r14,8),%rdi
19c4   940204:	48 01 ef             	add    %rbp,%rdi
19c7   940207:	48 8b 1f             	mov    (%rdi),%rbx
19ca   94020a:	e8 00 00 00 00       	call   94020f <___bpf_prog_run+0x19cf>	94020b: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
19cf   94020f:	48 8b 00             	mov    (%rax),%rax
19d2   940212:	48 85 c0             	test   %rax,%rax
19d5   940215:	74 06                	je     94021d <___bpf_prog_run+0x19dd>
19d7   940217:	8b 0a                	mov    (%rdx),%ecx
19d9   940219:	89 4c 24 08          	mov    %ecx,0x8(%rsp)
19dd   94021d:	49 09 c5             	or     %rax,%r13
19e0   940220:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
19e5   940225:	0f 85 18 76 00 00    	jne    947843 <___bpf_prog_run+0x9003>
19eb   94022b:	48 39 5c 24 18       	cmp    %rbx,0x18(%rsp)
19f0   940230:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
19f5   940235:	0f 86 cf 4f 00 00    	jbe    94520a <___bpf_prog_run+0x69ca>
19fb   94023b:	e8 00 00 00 00       	call   940240 <___bpf_prog_run+0x1a00>	94023c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1a00   940240:	49 8d 5d 02          	lea    0x2(%r13),%rbx
1a04   940244:	4d 85 f6             	test   %r14,%r14
1a07   940247:	0f 84 6f 82 00 00    	je     9484bc <___bpf_prog_run+0x9c7c>
1a0d   94024d:	8b 3c 24             	mov    (%rsp),%edi
1a10   940250:	e8 00 00 00 00       	call   940255 <___bpf_prog_run+0x1a15>	940251: R_X86_64_PLT32	__msan_warning-0x4
1a15   940255:	e9 62 82 00 00       	jmp    9484bc <___bpf_prog_run+0x9c7c>
1a1a   94025a:	e8 00 00 00 00       	call   94025f <___bpf_prog_run+0x1a1f>	94025b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1a1f   94025f:	49 8d 5d 01          	lea    0x1(%r13),%rbx
1a23   940263:	4d 85 f6             	test   %r14,%r14
1a26   940266:	0f 85 e5 75 00 00    	jne    947851 <___bpf_prog_run+0x9011>
1a2c   94026c:	0f b6 2b             	movzbl (%rbx),%ebp
1a2f   94026f:	48 89 df             	mov    %rbx,%rdi
1a32   940272:	e8 00 00 00 00       	call   940277 <___bpf_prog_run+0x1a37>	940273: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
1a37   940277:	0f b6 18             	movzbl (%rax),%ebx
1a3a   94027a:	83 e3 0f             	and    $0xf,%ebx
1a3d   94027d:	44 8b 74 24 04       	mov    0x4(%rsp),%r14d
1a42   940282:	48 85 db             	test   %rbx,%rbx
1a45   940285:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
1a4a   94028a:	74 03                	je     94028f <___bpf_prog_run+0x1a4f>
1a4c   94028c:	44 8b 32             	mov    (%rdx),%r14d
1a4f   94028f:	83 e5 0f             	and    $0xf,%ebp
1a52   940292:	48 09 c3             	or     %rax,%rbx
1a55   940295:	0f 85 c3 75 00 00    	jne    94785e <___bpf_prog_run+0x901e>
1a5b   94029b:	44 89 74 24 38       	mov    %r14d,0x38(%rsp)
1a60   9402a0:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
1a65   9402a5:	48 8d 3c e8          	lea    (%rax,%rbp,8),%rdi
1a69   9402a9:	44 8b 27             	mov    (%rdi),%r12d
1a6c   9402ac:	48 89 7c 24 18       	mov    %rdi,0x18(%rsp)
1a71   9402b1:	e8 00 00 00 00       	call   9402b6 <___bpf_prog_run+0x1a76>	9402b2: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
1a76   9402b6:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
1a7b   9402bb:	49 8d 6d 04          	lea    0x4(%r13),%rbp
1a7f   9402bf:	44 8b 30             	mov    (%rax),%r14d
1a82   9402c2:	8b 02                	mov    (%rdx),%eax
1a84   9402c4:	89 44 24 08          	mov    %eax,0x8(%rsp)
1a88   9402c8:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
1a8e   9402ce:	0f 85 97 75 00 00    	jne    94786b <___bpf_prog_run+0x902b>
1a94   9402d4:	44 8b 7d 00          	mov    0x0(%rbp),%r15d
1a98   9402d8:	48 89 ef             	mov    %rbp,%rdi
1a9b   9402db:	e8 00 00 00 00       	call   9402e0 <___bpf_prog_run+0x1aa0>	9402dc: R_X86_64_PLT32	__msan_metadata_ptr_for_load_4-0x4
1aa0   9402e0:	8b 08                	mov    (%rax),%ecx
1aa2   9402e2:	45 89 fd             	mov    %r15d,%r13d
1aa5   9402e5:	41 f7 d5             	not    %r13d
1aa8   9402e8:	44 89 e0             	mov    %r12d,%eax
1aab   9402eb:	f7 d0                	not    %eax
1aad   9402ed:	21 c8                	and    %ecx,%eax
1aaf   9402ef:	41 09 cd             	or     %ecx,%r13d
1ab2   9402f2:	45 21 f5             	and    %r14d,%r13d
1ab5   9402f5:	45 85 f6             	test   %r14d,%r14d
1ab8   9402f8:	75 06                	jne    940300 <___bpf_prog_run+0x1ac0>
1aba   9402fa:	8b 0a                	mov    (%rdx),%ecx
1abc   9402fc:	89 4c 24 08          	mov    %ecx,0x8(%rsp)
1ac0   940300:	41 09 c5             	or     %eax,%r13d
1ac3   940303:	48 85 db             	test   %rbx,%rbx
1ac6   940306:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
1acb   94030b:	0f 85 67 75 00 00    	jne    947878 <___bpf_prog_run+0x9038>
1ad1   940311:	45 09 e7             	or     %r12d,%r15d
1ad4   940314:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
1ad9   940319:	48 89 df             	mov    %rbx,%rdi
1adc   94031c:	e8 00 00 00 00       	call   940321 <___bpf_prog_run+0x1ae1>	94031d: R_X86_64_PLT32	__msan_metadata_ptr_for_store_8-0x4
1ae1   940321:	4c 89 28             	mov    %r13,(%rax)
1ae4   940324:	4d 85 ed             	test   %r13,%r13
1ae7   940327:	0f 85 59 75 00 00    	jne    947886 <___bpf_prog_run+0x9046>
1aed   94032d:	4c 89 3b             	mov    %r15,(%rbx)
1af0   940330:	e9 e3 39 00 00       	jmp    943d18 <___bpf_prog_run+0x54d8>
1af5   940335:	49 8d 5d 01          	lea    0x1(%r13),%rbx
1af9   940339:	4d 85 f6             	test   %r14,%r14
1afc   94033c:	0f 85 65 75 00 00    	jne    9478a7 <___bpf_prog_run+0x9067>
1b02   940342:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
1b07   940347:	44 0f b6 33          	movzbl (%rbx),%r14d
1b0b   94034b:	48 89 df             	mov    %rbx,%rdi
1b0e   94034e:	e8 00 00 00 00       	call   940353 <___bpf_prog_run+0x1b13>	94034f: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
1b13   940353:	0f b6 28             	movzbl (%rax),%ebp
1b16   940356:	44 8b 22             	mov    (%rdx),%r12d
1b19   940359:	89 e8                	mov    %ebp,%eax
1b1b   94035b:	83 e0 0f             	and    $0xf,%eax
1b1e   94035e:	44 89 f3             	mov    %r14d,%ebx
1b21   940361:	83 e3 0f             	and    $0xf,%ebx
1b24   940364:	48 85 c0             	test   %rax,%rax
1b27   940367:	44 8b 7c 24 04       	mov    0x4(%rsp),%r15d
1b2c   94036c:	44 89 ff             	mov    %r15d,%edi
1b2f   94036f:	41 0f 45 fc          	cmovne %r12d,%edi
1b33   940373:	48 0b 44 24 20       	or     0x20(%rsp),%rax
1b38   940378:	0f 85 36 75 00 00    	jne    9478b4 <___bpf_prog_run+0x9074>
1b3e   94037e:	4c 8b 6c 24 30       	mov    0x30(%rsp),%r13
1b43   940383:	48 8d 3c dd 00 00 00 00 	lea    0x0(,%rbx,8),%rdi
1b4b   94038b:	4c 01 ef             	add    %r13,%rdi
1b4e   94038e:	48 8b 07             	mov    (%rdi),%rax
1b51   940391:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
1b56   940396:	e8 00 00 00 00       	call   94039b <___bpf_prog_run+0x1b5b>	940397: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
1b5b   94039b:	48 8b 18             	mov    (%rax),%rbx
1b5e   94039e:	8b 02                	mov    (%rdx),%eax
1b60   9403a0:	89 44 24 08          	mov    %eax,0x8(%rsp)
1b64   9403a4:	48 c1 ed 04          	shr    $0x4,%rbp
1b68   9403a8:	49 c1 ee 04          	shr    $0x4,%r14
1b6c   9403ac:	48 85 ed             	test   %rbp,%rbp
1b6f   9403af:	45 0f 44 e7          	cmove  %r15d,%r12d
1b73   9403b3:	48 0b 6c 24 20       	or     0x20(%rsp),%rbp
1b78   9403b8:	0f 85 00 75 00 00    	jne    9478be <___bpf_prog_run+0x907e>
1b7e   9403be:	4a 8d 3c f5 00 00 00 00 	lea    0x0(,%r14,8),%rdi
1b86   9403c6:	4c 01 ef             	add    %r13,%rdi
1b89   9403c9:	4c 8b 3f             	mov    (%rdi),%r15
1b8c   9403cc:	e8 00 00 00 00       	call   9403d1 <___bpf_prog_run+0x1b91>	9403cd: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
1b91   9403d1:	48 8b 00             	mov    (%rax),%rax
1b94   9403d4:	48 09 c3             	or     %rax,%rbx
1b97   9403d7:	48 85 c0             	test   %rax,%rax
1b9a   9403da:	74 06                	je     9403e2 <___bpf_prog_run+0x1ba2>
1b9c   9403dc:	8b 02                	mov    (%rdx),%eax
1b9e   9403de:	89 44 24 08          	mov    %eax,0x8(%rsp)
1ba2   9403e2:	48 85 db             	test   %rbx,%rbx
1ba5   9403e5:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
1baa   9403ea:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
1baf   9403ef:	48 8b 6c 24 18       	mov    0x18(%rsp),%rbp
1bb4   9403f4:	74 12                	je     940408 <___bpf_prog_run+0x1bc8>
1bb6   9403f6:	48 89 e8             	mov    %rbp,%rax
1bb9   9403f9:	4c 31 f8             	xor    %r15,%rax
1bbc   9403fc:	48 f7 d3             	not    %rbx
1bbf   9403ff:	48 21 c3             	and    %rax,%rbx
1bc2   940402:	0f 84 c3 74 00 00    	je     9478cb <___bpf_prog_run+0x908b>
1bc8   940408:	4c 39 fd             	cmp    %r15,%rbp
1bcb   94040b:	0f 85 cc 74 00 00    	jne    9478dd <___bpf_prog_run+0x909d>
1bd1   940411:	e8 00 00 00 00       	call   940416 <___bpf_prog_run+0x1bd6>	940412: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1bd6   940416:	49 83 c5 08          	add    $0x8,%r13
1bda   94041a:	e9 e0 e4 ff ff       	jmp    93e8ff <___bpf_prog_run+0xbf>
1bdf   94041f:	49 8d 5d 01          	lea    0x1(%r13),%rbx
1be3   940423:	4d 85 f6             	test   %r14,%r14
1be6   940426:	0f 85 d0 74 00 00    	jne    9478fc <___bpf_prog_run+0x90bc>
1bec   94042c:	0f b6 2b             	movzbl (%rbx),%ebp
1bef   94042f:	48 89 df             	mov    %rbx,%rdi
1bf2   940432:	e8 00 00 00 00       	call   940437 <___bpf_prog_run+0x1bf7>	940433: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
1bf7   940437:	0f b6 00             	movzbl (%rax),%eax
1bfa   94043a:	83 e0 0f             	and    $0xf,%eax
1bfd   94043d:	8b 7c 24 04          	mov    0x4(%rsp),%edi
1c01   940441:	48 85 c0             	test   %rax,%rax
1c04   940444:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
1c09   940449:	74 02                	je     94044d <___bpf_prog_run+0x1c0d>
1c0b   94044b:	8b 3a                	mov    (%rdx),%edi
1c0d   94044d:	83 e5 0f             	and    $0xf,%ebp
1c10   940450:	48 09 c8             	or     %rcx,%rax
1c13   940453:	0f 85 b0 74 00 00    	jne    947909 <___bpf_prog_run+0x90c9>
1c19   940459:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
1c1e   94045e:	48 8d 3c e8          	lea    (%rax,%rbp,8),%rdi
1c22   940462:	4c 8b 3f             	mov    (%rdi),%r15
1c25   940465:	e8 00 00 00 00       	call   94046a <___bpf_prog_run+0x1c2a>	940466: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
1c2a   94046a:	49 8d 6d 04          	lea    0x4(%r13),%rbp
1c2e   94046e:	48 8b 18             	mov    (%rax),%rbx
1c31   940471:	44 8b 32             	mov    (%rdx),%r14d
1c34   940474:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
1c3a   94047a:	0f 85 93 74 00 00    	jne    947913 <___bpf_prog_run+0x90d3>
1c40   940480:	4c 63 65 00          	movslq 0x0(%rbp),%r12
1c44   940484:	48 89 ef             	mov    %rbp,%rdi
1c47   940487:	e8 00 00 00 00       	call   94048c <___bpf_prog_run+0x1c4c>	940488: R_X86_64_PLT32	__msan_metadata_ptr_for_load_4-0x4
1c4c   94048c:	48 63 00             	movslq (%rax),%rax
1c4f   94048f:	48 85 c0             	test   %rax,%rax
1c52   940492:	74 1f                	je     9404b3 <___bpf_prog_run+0x1c73>
1c54   940494:	44 8b 32             	mov    (%rdx),%r14d
1c57   940497:	48 09 c3             	or     %rax,%rbx
1c5a   94049a:	74 1c                	je     9404b8 <___bpf_prog_run+0x1c78>
1c5c   94049c:	44 89 f7             	mov    %r14d,%edi
1c5f   94049f:	e8 00 00 00 00       	call   9404a4 <___bpf_prog_run+0x1c64>	9404a0: R_X86_64_PLT32	__msan_warning-0x4
1c64   9404a4:	4d 39 e7             	cmp    %r12,%r15
1c67   9404a7:	7c 14                	jl     9404bd <___bpf_prog_run+0x1c7d>
1c69   9404a9:	e8 00 00 00 00       	call   9404ae <___bpf_prog_run+0x1c6e>	9404aa: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1c6e   9404ae:	e9 43 e4 ff ff       	jmp    93e8f6 <___bpf_prog_run+0xb6>
1c73   9404b3:	48 09 c3             	or     %rax,%rbx
1c76   9404b6:	75 e4                	jne    94049c <___bpf_prog_run+0x1c5c>
1c78   9404b8:	4d 39 e7             	cmp    %r12,%r15
1c7b   9404bb:	7d ec                	jge    9404a9 <___bpf_prog_run+0x1c69>
1c7d   9404bd:	e8 00 00 00 00       	call   9404c2 <___bpf_prog_run+0x1c82>	9404be: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1c82   9404c2:	49 8d 5d 02          	lea    0x2(%r13),%rbx
1c86   9404c6:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
1c8b   9404cb:	4d 85 f6             	test   %r14,%r14
1c8e   9404ce:	0f 84 e8 7f 00 00    	je     9484bc <___bpf_prog_run+0x9c7c>
1c94   9404d4:	8b 3c 24             	mov    (%rsp),%edi
1c97   9404d7:	e8 00 00 00 00       	call   9404dc <___bpf_prog_run+0x1c9c>	9404d8: R_X86_64_PLT32	__msan_warning-0x4
1c9c   9404dc:	e9 db 7f 00 00       	jmp    9484bc <___bpf_prog_run+0x9c7c>
1ca1   9404e1:	49 8d 5d 01          	lea    0x1(%r13),%rbx
1ca5   9404e5:	4d 85 f6             	test   %r14,%r14
1ca8   9404e8:	0f 85 32 74 00 00    	jne    947920 <___bpf_prog_run+0x90e0>
1cae   9404ee:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
1cb3   9404f3:	44 0f b6 33          	movzbl (%rbx),%r14d
1cb7   9404f7:	48 89 df             	mov    %rbx,%rdi
1cba   9404fa:	e8 00 00 00 00       	call   9404ff <___bpf_prog_run+0x1cbf>	9404fb: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
1cbf   9404ff:	0f b6 18             	movzbl (%rax),%ebx
1cc2   940502:	44 8b 22             	mov    (%rdx),%r12d
1cc5   940505:	89 d8                	mov    %ebx,%eax
1cc7   940507:	83 e0 0f             	and    $0xf,%eax
1cca   94050a:	44 89 f5             	mov    %r14d,%ebp
1ccd   94050d:	83 e5 0f             	and    $0xf,%ebp
1cd0   940510:	48 85 c0             	test   %rax,%rax
1cd3   940513:	44 8b 7c 24 04       	mov    0x4(%rsp),%r15d
1cd8   940518:	44 89 ff             	mov    %r15d,%edi
1cdb   94051b:	41 0f 45 fc          	cmovne %r12d,%edi
1cdf   94051f:	48 0b 44 24 20       	or     0x20(%rsp),%rax
1ce4   940524:	0f 85 03 74 00 00    	jne    94792d <___bpf_prog_run+0x90ed>
1cea   94052a:	4c 8b 6c 24 30       	mov    0x30(%rsp),%r13
1cef   94052f:	48 8d 3c ed 00 00 00 00 	lea    0x0(,%rbp,8),%rdi
1cf7   940537:	4c 01 ef             	add    %r13,%rdi
1cfa   94053a:	8b 07                	mov    (%rdi),%eax
1cfc   94053c:	89 44 24 18          	mov    %eax,0x18(%rsp)
1d00   940540:	e8 00 00 00 00       	call   940545 <___bpf_prog_run+0x1d05>	940541: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
1d05   940545:	4c 89 ed             	mov    %r13,%rbp
1d08   940548:	44 8b 28             	mov    (%rax),%r13d
1d0b   94054b:	8b 02                	mov    (%rdx),%eax
1d0d   94054d:	89 44 24 08          	mov    %eax,0x8(%rsp)
1d11   940551:	48 c1 eb 04          	shr    $0x4,%rbx
1d15   940555:	49 c1 ee 04          	shr    $0x4,%r14
1d19   940559:	48 85 db             	test   %rbx,%rbx
1d1c   94055c:	45 0f 44 e7          	cmove  %r15d,%r12d
1d20   940560:	48 0b 5c 24 20       	or     0x20(%rsp),%rbx
1d25   940565:	0f 85 cc 73 00 00    	jne    947937 <___bpf_prog_run+0x90f7>
1d2b   94056b:	4a 8d 3c f5 00 00 00 00 	lea    0x0(,%r14,8),%rdi
1d33   940573:	48 01 ef             	add    %rbp,%rdi
1d36   940576:	8b 1f                	mov    (%rdi),%ebx
1d38   940578:	e8 00 00 00 00       	call   94057d <___bpf_prog_run+0x1d3d>	940579: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
1d3d   94057d:	8b 00                	mov    (%rax),%eax
1d3f   94057f:	85 c0                	test   %eax,%eax
1d41   940581:	74 06                	je     940589 <___bpf_prog_run+0x1d49>
1d43   940583:	8b 0a                	mov    (%rdx),%ecx
1d45   940585:	89 4c 24 08          	mov    %ecx,0x8(%rsp)
1d49   940589:	41 09 c5             	or     %eax,%r13d
1d4c   94058c:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
1d51   940591:	0f 85 ad 73 00 00    	jne    947944 <___bpf_prog_run+0x9104>
1d57   940597:	39 5c 24 18          	cmp    %ebx,0x18(%rsp)
1d5b   94059b:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
1d60   9405a0:	0f 8d 72 4c 00 00    	jge    945218 <___bpf_prog_run+0x69d8>
1d66   9405a6:	e8 00 00 00 00       	call   9405ab <___bpf_prog_run+0x1d6b>	9405a7: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1d6b   9405ab:	49 8d 5d 02          	lea    0x2(%r13),%rbx
1d6f   9405af:	4d 85 f6             	test   %r14,%r14
1d72   9405b2:	0f 84 04 7f 00 00    	je     9484bc <___bpf_prog_run+0x9c7c>
1d78   9405b8:	8b 3c 24             	mov    (%rsp),%edi
1d7b   9405bb:	e8 00 00 00 00       	call   9405c0 <___bpf_prog_run+0x1d80>	9405bc: R_X86_64_PLT32	__msan_warning-0x4
1d80   9405c0:	e9 f7 7e 00 00       	jmp    9484bc <___bpf_prog_run+0x9c7c>
1d85   9405c5:	49 8d 5d 01          	lea    0x1(%r13),%rbx
1d89   9405c9:	4d 85 f6             	test   %r14,%r14
1d8c   9405cc:	0f 85 80 73 00 00    	jne    947952 <___bpf_prog_run+0x9112>
1d92   9405d2:	0f b6 2b             	movzbl (%rbx),%ebp
1d95   9405d5:	48 89 df             	mov    %rbx,%rdi
1d98   9405d8:	e8 00 00 00 00       	call   9405dd <___bpf_prog_run+0x1d9d>	9405d9: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
1d9d   9405dd:	0f b6 00             	movzbl (%rax),%eax
1da0   9405e0:	83 e0 0f             	and    $0xf,%eax
1da3   9405e3:	8b 7c 24 04          	mov    0x4(%rsp),%edi
1da7   9405e7:	48 85 c0             	test   %rax,%rax
1daa   9405ea:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
1daf   9405ef:	74 02                	je     9405f3 <___bpf_prog_run+0x1db3>
1db1   9405f1:	8b 3a                	mov    (%rdx),%edi
1db3   9405f3:	83 e5 0f             	and    $0xf,%ebp
1db6   9405f6:	48 09 c8             	or     %rcx,%rax
1db9   9405f9:	0f 85 60 73 00 00    	jne    94795f <___bpf_prog_run+0x911f>
1dbf   9405ff:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
1dc4   940604:	48 8d 3c e8          	lea    (%rax,%rbp,8),%rdi
1dc8   940608:	44 8b 3f             	mov    (%rdi),%r15d
1dcb   94060b:	e8 00 00 00 00       	call   940610 <___bpf_prog_run+0x1dd0>	94060c: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
1dd0   940610:	49 8d 6d 04          	lea    0x4(%r13),%rbp
1dd4   940614:	8b 18                	mov    (%rax),%ebx
1dd6   940616:	44 8b 32             	mov    (%rdx),%r14d
1dd9   940619:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
1ddf   94061f:	0f 85 44 73 00 00    	jne    947969 <___bpf_prog_run+0x9129>
1de5   940625:	44 8b 65 00          	mov    0x0(%rbp),%r12d
1de9   940629:	48 89 ef             	mov    %rbp,%rdi
1dec   94062c:	e8 00 00 00 00       	call   940631 <___bpf_prog_run+0x1df1>	94062d: R_X86_64_PLT32	__msan_metadata_ptr_for_load_4-0x4
1df1   940631:	85 db                	test   %ebx,%ebx
1df3   940633:	0f 85 92 01 00 00    	jne    9407cb <___bpf_prog_run+0x1f8b>
1df9   940639:	44 8b 32             	mov    (%rdx),%r14d
1dfc   94063c:	0b 18                	or     (%rax),%ebx
1dfe   94063e:	0f 84 8f 01 00 00    	je     9407d3 <___bpf_prog_run+0x1f93>
1e04   940644:	44 89 f7             	mov    %r14d,%edi
1e07   940647:	e8 00 00 00 00       	call   94064c <___bpf_prog_run+0x1e0c>	940648: R_X86_64_PLT32	__msan_warning-0x4
1e0c   94064c:	45 39 fc             	cmp    %r15d,%r12d
1e0f   94064f:	0f 8f 87 01 00 00    	jg     9407dc <___bpf_prog_run+0x1f9c>
1e15   940655:	e8 00 00 00 00       	call   94065a <___bpf_prog_run+0x1e1a>	940656: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1e1a   94065a:	e9 97 e2 ff ff       	jmp    93e8f6 <___bpf_prog_run+0xb6>
1e1f   94065f:	e8 00 00 00 00       	call   940664 <___bpf_prog_run+0x1e24>	940660: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1e24   940664:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
1e29   940669:	49 8d 5d 01          	lea    0x1(%r13),%rbx
1e2d   94066d:	4d 85 f6             	test   %r14,%r14
1e30   940670:	0f 85 00 73 00 00    	jne    947976 <___bpf_prog_run+0x9136>
1e36   940676:	44 0f b6 3b          	movzbl (%rbx),%r15d
1e3a   94067a:	48 89 5c 24 18       	mov    %rbx,0x18(%rsp)
1e3f   94067f:	48 89 df             	mov    %rbx,%rdi
1e42   940682:	e8 00 00 00 00       	call   940687 <___bpf_prog_run+0x1e47>	940683: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
1e47   940687:	0f b6 00             	movzbl (%rax),%eax
1e4a   94068a:	8b 3a                	mov    (%rdx),%edi
1e4c   94068c:	89 c5                	mov    %eax,%ebp
1e4e   94068e:	83 e5 0f             	and    $0xf,%ebp
1e51   940691:	48 85 ed             	test   %rbp,%rbp
1e54   940694:	8b 4c 24 04          	mov    0x4(%rsp),%ecx
1e58   940698:	41 89 cd             	mov    %ecx,%r13d
1e5b   94069b:	44 0f 45 ef          	cmovne %edi,%r13d
1e5f   94069f:	48 c1 e8 04          	shr    $0x4,%rax
1e63   9406a3:	4c 89 fb             	mov    %r15,%rbx
1e66   9406a6:	48 c1 eb 04          	shr    $0x4,%rbx
1e6a   9406aa:	48 85 c0             	test   %rax,%rax
1e6d   9406ad:	0f 44 f9             	cmove  %ecx,%edi
1e70   9406b0:	48 0b 44 24 20       	or     0x20(%rsp),%rax
1e75   9406b5:	0f 85 c8 72 00 00    	jne    947983 <___bpf_prog_run+0x9143>
1e7b   9406bb:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
1e80   9406c0:	48 8d 3c d8          	lea    (%rax,%rbx,8),%rdi
1e84   9406c4:	4c 8b 27             	mov    (%rdi),%r12
1e87   9406c7:	e8 00 00 00 00       	call   9406cc <___bpf_prog_run+0x1e8c>	9406c8: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
1e8c   9406cc:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
1e91   9406d1:	48 8d 59 02          	lea    0x2(%rcx),%rbx
1e95   9406d5:	4c 8b 30             	mov    (%rax),%r14
1e98   9406d8:	8b 02                	mov    (%rdx),%eax
1e9a   9406da:	89 44 24 08          	mov    %eax,0x8(%rsp)
1e9e   9406de:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
1ea4   9406e4:	0f 85 a3 72 00 00    	jne    94798d <___bpf_prog_run+0x914d>
1eaa   9406ea:	41 83 e7 0f          	and    $0xf,%r15d
1eae   9406ee:	48 0b 6c 24 20       	or     0x20(%rsp),%rbp
1eb3   9406f3:	48 0f bf 03          	movswq (%rbx),%rax
1eb7   9406f7:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
1ebc   9406fc:	48 89 df             	mov    %rbx,%rdi
1ebf   9406ff:	e8 00 00 00 00       	call   940704 <___bpf_prog_run+0x1ec4>	940700: R_X86_64_PLT32	__msan_metadata_ptr_for_load_2-0x4
1ec4   940704:	48 0f bf 00          	movswq (%rax),%rax
1ec8   940708:	49 09 c6             	or     %rax,%r14
1ecb   94070b:	48 85 c0             	test   %rax,%rax
1ece   94070e:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
1ed2   940712:	74 02                	je     940716 <___bpf_prog_run+0x1ed6>
1ed4   940714:	8b 0a                	mov    (%rdx),%ecx
1ed6   940716:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
1edb   94071b:	4a 8d 3c f8          	lea    (%rax,%r15,8),%rdi
1edf   94071f:	4c 03 64 24 38       	add    0x38(%rsp),%r12
1ee4   940724:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
1ee9   940729:	48 89 28             	mov    %rbp,(%rax)
1eec   94072c:	44 89 a8 88 0c 00 00 	mov    %r13d,0xc88(%rax)
1ef3   940733:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
1efa   94073a:	4c 89 70 10          	mov    %r14,0x10(%rax)
1efe   94073e:	89 88 98 0c 00 00    	mov    %ecx,0xc98(%rax)
1f04   940744:	48 c7 80 20 03 00 00 00 00 00 00 	movq   $0x0,0x320(%rax)
1f0f   94074f:	be 01 00 00 00       	mov    $0x1,%esi
1f14   940754:	4c 89 e2             	mov    %r12,%rdx
1f17   940757:	e8 00 00 00 00       	call   94075c <___bpf_prog_run+0x1f1c>	940758: R_X86_64_PLT32	bpf_probe_read_kernel-0x4
1f1c   94075c:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
1f22   940762:	0f 85 32 72 00 00    	jne    94799a <___bpf_prog_run+0x915a>
1f28   940768:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
1f2d   94076d:	0f b6 1f             	movzbl (%rdi),%ebx
1f30   940770:	e8 00 00 00 00       	call   940775 <___bpf_prog_run+0x1f35>	940771: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
1f35   940775:	0f b6 28             	movzbl (%rax),%ebp
1f38   940778:	83 e5 0f             	and    $0xf,%ebp
1f3b   94077b:	44 8b 7c 24 04       	mov    0x4(%rsp),%r15d
1f40   940780:	48 85 ed             	test   %rbp,%rbp
1f43   940783:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
1f48   940788:	74 03                	je     94078d <___bpf_prog_run+0x1f4d>
1f4a   94078a:	44 8b 3a             	mov    (%rdx),%r15d
1f4d   94078d:	83 e3 0f             	and    $0xf,%ebx
1f50   940790:	48 09 c5             	or     %rax,%rbp
1f53   940793:	4c 8b 74 24 30       	mov    0x30(%rsp),%r14
1f58   940798:	0f 85 09 72 00 00    	jne    9479a7 <___bpf_prog_run+0x9167>
1f5e   94079e:	49 8d 1c de          	lea    (%r14,%rbx,8),%rbx
1f62   9407a2:	44 0f b6 23          	movzbl (%rbx),%r12d
1f66   9407a6:	48 89 df             	mov    %rbx,%rdi
1f69   9407a9:	e8 00 00 00 00       	call   9407ae <___bpf_prog_run+0x1f6e>	9407aa: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
1f6e   9407ae:	44 0f b6 28          	movzbl (%rax),%r13d
1f72   9407b2:	44 8b 32             	mov    (%rdx),%r14d
1f75   9407b5:	48 85 ed             	test   %rbp,%rbp
1f78   9407b8:	0f 84 1d 7b 00 00    	je     9482db <___bpf_prog_run+0x9a9b>
1f7e   9407be:	44 89 ff             	mov    %r15d,%edi
1f81   9407c1:	e8 00 00 00 00       	call   9407c6 <___bpf_prog_run+0x1f86>	9407c2: R_X86_64_PLT32	__msan_warning-0x4
1f86   9407c6:	e9 10 7b 00 00       	jmp    9482db <___bpf_prog_run+0x9a9b>
1f8b   9407cb:	0b 18                	or     (%rax),%ebx
1f8d   9407cd:	0f 85 71 fe ff ff    	jne    940644 <___bpf_prog_run+0x1e04>
1f93   9407d3:	45 39 fc             	cmp    %r15d,%r12d
1f96   9407d6:	0f 8e 79 fe ff ff    	jle    940655 <___bpf_prog_run+0x1e15>
1f9c   9407dc:	e8 00 00 00 00       	call   9407e1 <___bpf_prog_run+0x1fa1>	9407dd: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1fa1   9407e1:	49 8d 5d 02          	lea    0x2(%r13),%rbx
1fa5   9407e5:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
1faa   9407ea:	4d 85 f6             	test   %r14,%r14
1fad   9407ed:	0f 84 c9 7c 00 00    	je     9484bc <___bpf_prog_run+0x9c7c>
1fb3   9407f3:	8b 3c 24             	mov    (%rsp),%edi
1fb6   9407f6:	e8 00 00 00 00       	call   9407fb <___bpf_prog_run+0x1fbb>	9407f7: R_X86_64_PLT32	__msan_warning-0x4
1fbb   9407fb:	e9 bc 7c 00 00       	jmp    9484bc <___bpf_prog_run+0x9c7c>
1fc0   940800:	49 8d 5d 01          	lea    0x1(%r13),%rbx
1fc4   940804:	4d 85 f6             	test   %r14,%r14
1fc7   940807:	0f 85 a7 71 00 00    	jne    9479b4 <___bpf_prog_run+0x9174>
1fcd   94080d:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
1fd2   940812:	44 0f b6 33          	movzbl (%rbx),%r14d
1fd6   940816:	48 89 df             	mov    %rbx,%rdi
1fd9   940819:	e8 00 00 00 00       	call   94081e <___bpf_prog_run+0x1fde>	94081a: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
1fde   94081e:	0f b6 18             	movzbl (%rax),%ebx
1fe1   940821:	44 8b 22             	mov    (%rdx),%r12d
1fe4   940824:	89 d8                	mov    %ebx,%eax
1fe6   940826:	83 e0 0f             	and    $0xf,%eax
1fe9   940829:	44 89 f5             	mov    %r14d,%ebp
1fec   94082c:	83 e5 0f             	and    $0xf,%ebp
1fef   94082f:	48 85 c0             	test   %rax,%rax
1ff2   940832:	44 8b 7c 24 04       	mov    0x4(%rsp),%r15d
1ff7   940837:	44 89 ff             	mov    %r15d,%edi
1ffa   94083a:	41 0f 45 fc          	cmovne %r12d,%edi
1ffe   94083e:	48 0b 44 24 20       	or     0x20(%rsp),%rax
2003   940843:	0f 85 78 71 00 00    	jne    9479c1 <___bpf_prog_run+0x9181>
2009   940849:	4c 8b 6c 24 30       	mov    0x30(%rsp),%r13
200e   94084e:	48 8d 3c ed 00 00 00 00 	lea    0x0(,%rbp,8),%rdi
2016   940856:	4c 01 ef             	add    %r13,%rdi
2019   940859:	8b 07                	mov    (%rdi),%eax
201b   94085b:	89 44 24 18          	mov    %eax,0x18(%rsp)
201f   94085f:	e8 00 00 00 00       	call   940864 <___bpf_prog_run+0x2024>	940860: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
2024   940864:	4c 89 ed             	mov    %r13,%rbp
2027   940867:	44 8b 28             	mov    (%rax),%r13d
202a   94086a:	8b 02                	mov    (%rdx),%eax
202c   94086c:	89 44 24 08          	mov    %eax,0x8(%rsp)
2030   940870:	48 c1 eb 04          	shr    $0x4,%rbx
2034   940874:	49 c1 ee 04          	shr    $0x4,%r14
2038   940878:	48 85 db             	test   %rbx,%rbx
203b   94087b:	45 0f 44 e7          	cmove  %r15d,%r12d
203f   94087f:	48 0b 5c 24 20       	or     0x20(%rsp),%rbx
2044   940884:	0f 85 41 71 00 00    	jne    9479cb <___bpf_prog_run+0x918b>
204a   94088a:	4a 8d 3c f5 00 00 00 00 	lea    0x0(,%r14,8),%rdi
2052   940892:	48 01 ef             	add    %rbp,%rdi
2055   940895:	8b 1f                	mov    (%rdi),%ebx
2057   940897:	e8 00 00 00 00       	call   94089c <___bpf_prog_run+0x205c>	940898: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
205c   94089c:	8b 00                	mov    (%rax),%eax
205e   94089e:	85 c0                	test   %eax,%eax
2060   9408a0:	74 06                	je     9408a8 <___bpf_prog_run+0x2068>
2062   9408a2:	8b 0a                	mov    (%rdx),%ecx
2064   9408a4:	89 4c 24 08          	mov    %ecx,0x8(%rsp)
2068   9408a8:	41 09 c5             	or     %eax,%r13d
206b   9408ab:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
2070   9408b0:	0f 85 22 71 00 00    	jne    9479d8 <___bpf_prog_run+0x9198>
2076   9408b6:	39 5c 24 18          	cmp    %ebx,0x18(%rsp)
207a   9408ba:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
207f   9408bf:	0f 8e 61 49 00 00    	jle    945226 <___bpf_prog_run+0x69e6>
2085   9408c5:	e8 00 00 00 00       	call   9408ca <___bpf_prog_run+0x208a>	9408c6: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
208a   9408ca:	49 8d 5d 02          	lea    0x2(%r13),%rbx
208e   9408ce:	4d 85 f6             	test   %r14,%r14
2091   9408d1:	0f 84 e5 7b 00 00    	je     9484bc <___bpf_prog_run+0x9c7c>
2097   9408d7:	8b 3c 24             	mov    (%rsp),%edi
209a   9408da:	e8 00 00 00 00       	call   9408df <___bpf_prog_run+0x209f>	9408db: R_X86_64_PLT32	__msan_warning-0x4
209f   9408df:	e9 d8 7b 00 00       	jmp    9484bc <___bpf_prog_run+0x9c7c>
20a4   9408e4:	e8 00 00 00 00       	call   9408e9 <___bpf_prog_run+0x20a9>	9408e5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
20a9   9408e9:	49 8d 5d 01          	lea    0x1(%r13),%rbx
20ad   9408ed:	4d 85 f6             	test   %r14,%r14
20b0   9408f0:	0f 85 f0 70 00 00    	jne    9479e6 <___bpf_prog_run+0x91a6>
20b6   9408f6:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
20bb   9408fb:	44 0f b6 2b          	movzbl (%rbx),%r13d
20bf   9408ff:	48 89 df             	mov    %rbx,%rdi
20c2   940902:	e8 00 00 00 00       	call   940907 <___bpf_prog_run+0x20c7>	940903: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
20c7   940907:	44 0f b6 38          	movzbl (%rax),%r15d
20cb   94090b:	44 8b 22             	mov    (%rdx),%r12d
20ce   94090e:	45 89 fe             	mov    %r15d,%r14d
20d1   940911:	41 83 e6 0f          	and    $0xf,%r14d
20d5   940915:	44 89 ed             	mov    %r13d,%ebp
20d8   940918:	83 e5 0f             	and    $0xf,%ebp
20db   94091b:	4d 85 f6             	test   %r14,%r14
20de   94091e:	8b 5c 24 04          	mov    0x4(%rsp),%ebx
20e2   940922:	41 0f 45 dc          	cmovne %r12d,%ebx
20e6   940926:	4c 0b 74 24 20       	or     0x20(%rsp),%r14
20eb   94092b:	0f 85 c2 70 00 00    	jne    9479f3 <___bpf_prog_run+0x91b3>
20f1   940931:	89 5c 24 40          	mov    %ebx,0x40(%rsp)
20f5   940935:	48 8b 5c 24 30       	mov    0x30(%rsp),%rbx
20fa   94093a:	48 8d 3c eb          	lea    (%rbx,%rbp,8),%rdi
20fe   94093e:	48 8b 07             	mov    (%rdi),%rax
2101   940941:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
2106   940946:	48 89 7c 24 18       	mov    %rdi,0x18(%rsp)
210b   94094b:	e8 00 00 00 00       	call   940950 <___bpf_prog_run+0x2110>	94094c: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
2110   940950:	48 8b 28             	mov    (%rax),%rbp
2113   940953:	8b 02                	mov    (%rdx),%eax
2115   940955:	89 44 24 38          	mov    %eax,0x38(%rsp)
2119   940959:	49 c1 ef 04          	shr    $0x4,%r15
211d   94095d:	49 c1 ed 04          	shr    $0x4,%r13
2121   940961:	4d 85 ff             	test   %r15,%r15
2124   940964:	44 0f 44 64 24 04    	cmove  0x4(%rsp),%r12d
212a   94096a:	4c 0b 7c 24 20       	or     0x20(%rsp),%r15
212f   94096f:	0f 85 8a 70 00 00    	jne    9479ff <___bpf_prog_run+0x91bf>
2135   940975:	4a 8d 3c eb          	lea    (%rbx,%r13,8),%rdi
2139   940979:	44 8a 3f             	mov    (%rdi),%r15b
213c   94097c:	e8 00 00 00 00       	call   940981 <___bpf_prog_run+0x2141>	94097d: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
2141   940981:	31 f6                	xor    %esi,%esi
2143   940983:	f6 00 3f             	testb  $0x3f,(%rax)
2146   940986:	0f 95 c0             	setne  %al
2149   940989:	74 06                	je     940991 <___bpf_prog_run+0x2151>
214b   94098b:	8b 0a                	mov    (%rdx),%ecx
214d   94098d:	89 4c 24 38          	mov    %ecx,0x38(%rsp)
2151   940991:	40 88 c6             	mov    %al,%sil
2154   940994:	48 f7 de             	neg    %rsi
2157   940997:	44 89 f9             	mov    %r15d,%ecx
215a   94099a:	48 d3 fd             	sar    %cl,%rbp
215d   94099d:	48 09 f5             	or     %rsi,%rbp
2160   9409a0:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
2165   9409a5:	48 d3 fb             	sar    %cl,%rbx
2168   9409a8:	4d 85 f6             	test   %r14,%r14
216b   9409ab:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
2170   9409b0:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
2175   9409b5:	0f 85 51 70 00 00    	jne    947a0c <___bpf_prog_run+0x91cc>
217b   9409bb:	4c 89 e7             	mov    %r12,%rdi
217e   9409be:	e8 00 00 00 00       	call   9409c3 <___bpf_prog_run+0x2183>	9409bf: R_X86_64_PLT32	__msan_metadata_ptr_for_store_8-0x4
2183   9409c3:	48 89 28             	mov    %rbp,(%rax)
2186   9409c6:	48 85 ed             	test   %rbp,%rbp
2189   9409c9:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
218e   9409ce:	0f 84 e8 0e 00 00    	je     9418bc <___bpf_prog_run+0x307c>
2194   9409d4:	49 89 d7             	mov    %rdx,%r15
2197   9409d7:	8b 7c 24 38          	mov    0x38(%rsp),%edi
219b   9409db:	e9 3f 74 00 00       	jmp    947e1f <___bpf_prog_run+0x95df>
21a0   9409e0:	e8 00 00 00 00       	call   9409e5 <___bpf_prog_run+0x21a5>	9409e1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
21a5   9409e5:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
21aa   9409ea:	49 8d 5d 01          	lea    0x1(%r13),%rbx
21ae   9409ee:	4d 85 f6             	test   %r14,%r14
21b1   9409f1:	0f 85 23 70 00 00    	jne    947a1a <___bpf_prog_run+0x91da>
21b7   9409f7:	44 0f b6 3b          	movzbl (%rbx),%r15d
21bb   9409fb:	48 89 5c 24 18       	mov    %rbx,0x18(%rsp)
21c0   940a00:	48 89 df             	mov    %rbx,%rdi
21c3   940a03:	e8 00 00 00 00       	call   940a08 <___bpf_prog_run+0x21c8>	940a04: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
21c8   940a08:	0f b6 00             	movzbl (%rax),%eax
21cb   940a0b:	8b 3a                	mov    (%rdx),%edi
21cd   940a0d:	89 c5                	mov    %eax,%ebp
21cf   940a0f:	83 e5 0f             	and    $0xf,%ebp
21d2   940a12:	48 85 ed             	test   %rbp,%rbp
21d5   940a15:	8b 4c 24 04          	mov    0x4(%rsp),%ecx
21d9   940a19:	41 89 cd             	mov    %ecx,%r13d
21dc   940a1c:	44 0f 45 ef          	cmovne %edi,%r13d
21e0   940a20:	48 c1 e8 04          	shr    $0x4,%rax
21e4   940a24:	4c 89 fb             	mov    %r15,%rbx
21e7   940a27:	48 c1 eb 04          	shr    $0x4,%rbx
21eb   940a2b:	48 85 c0             	test   %rax,%rax
21ee   940a2e:	0f 44 f9             	cmove  %ecx,%edi
21f1   940a31:	48 0b 44 24 20       	or     0x20(%rsp),%rax
21f6   940a36:	0f 85 eb 6f 00 00    	jne    947a27 <___bpf_prog_run+0x91e7>
21fc   940a3c:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
2201   940a41:	48 8d 3c d8          	lea    (%rax,%rbx,8),%rdi
2205   940a45:	4c 8b 27             	mov    (%rdi),%r12
2208   940a48:	e8 00 00 00 00       	call   940a4d <___bpf_prog_run+0x220d>	940a49: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
220d   940a4d:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
2212   940a52:	48 8d 59 02          	lea    0x2(%rcx),%rbx
2216   940a56:	4c 8b 30             	mov    (%rax),%r14
2219   940a59:	8b 02                	mov    (%rdx),%eax
221b   940a5b:	89 44 24 08          	mov    %eax,0x8(%rsp)
221f   940a5f:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
2225   940a65:	0f 85 c6 6f 00 00    	jne    947a31 <___bpf_prog_run+0x91f1>
222b   940a6b:	41 83 e7 0f          	and    $0xf,%r15d
222f   940a6f:	48 0b 6c 24 20       	or     0x20(%rsp),%rbp
2234   940a74:	48 0f bf 03          	movswq (%rbx),%rax
2238   940a78:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
223d   940a7d:	48 89 df             	mov    %rbx,%rdi
2240   940a80:	e8 00 00 00 00       	call   940a85 <___bpf_prog_run+0x2245>	940a81: R_X86_64_PLT32	__msan_metadata_ptr_for_load_2-0x4
2245   940a85:	48 0f bf 00          	movswq (%rax),%rax
2249   940a89:	49 09 c6             	or     %rax,%r14
224c   940a8c:	48 85 c0             	test   %rax,%rax
224f   940a8f:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
2253   940a93:	74 02                	je     940a97 <___bpf_prog_run+0x2257>
2255   940a95:	8b 0a                	mov    (%rdx),%ecx
2257   940a97:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
225c   940a9c:	4a 8d 3c f8          	lea    (%rax,%r15,8),%rdi
2260   940aa0:	4c 03 64 24 38       	add    0x38(%rsp),%r12
2265   940aa5:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
226a   940aaa:	48 89 28             	mov    %rbp,(%rax)
226d   940aad:	44 89 a8 88 0c 00 00 	mov    %r13d,0xc88(%rax)
2274   940ab4:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
227b   940abb:	4c 89 70 10          	mov    %r14,0x10(%rax)
227f   940abf:	89 88 98 0c 00 00    	mov    %ecx,0xc98(%rax)
2285   940ac5:	48 c7 80 20 03 00 00 00 00 00 00 	movq   $0x0,0x320(%rax)
2290   940ad0:	be 02 00 00 00       	mov    $0x2,%esi
2295   940ad5:	4c 89 e2             	mov    %r12,%rdx
2298   940ad8:	e8 00 00 00 00       	call   940add <___bpf_prog_run+0x229d>	940ad9: R_X86_64_PLT32	bpf_probe_read_kernel-0x4
229d   940add:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
22a3   940ae3:	0f 85 55 6f 00 00    	jne    947a3e <___bpf_prog_run+0x91fe>
22a9   940ae9:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
22ae   940aee:	0f b6 1f             	movzbl (%rdi),%ebx
22b1   940af1:	e8 00 00 00 00       	call   940af6 <___bpf_prog_run+0x22b6>	940af2: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
22b6   940af6:	0f b6 28             	movzbl (%rax),%ebp
22b9   940af9:	83 e5 0f             	and    $0xf,%ebp
22bc   940afc:	44 8b 7c 24 04       	mov    0x4(%rsp),%r15d
22c1   940b01:	48 85 ed             	test   %rbp,%rbp
22c4   940b04:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
22c9   940b09:	74 03                	je     940b0e <___bpf_prog_run+0x22ce>
22cb   940b0b:	44 8b 3a             	mov    (%rdx),%r15d
22ce   940b0e:	83 e3 0f             	and    $0xf,%ebx
22d1   940b11:	48 09 c5             	or     %rax,%rbp
22d4   940b14:	4c 8b 74 24 30       	mov    0x30(%rsp),%r14
22d9   940b19:	0f 85 2c 6f 00 00    	jne    947a4b <___bpf_prog_run+0x920b>
22df   940b1f:	49 8d 1c de          	lea    (%r14,%rbx,8),%rbx
22e3   940b23:	44 0f b7 23          	movzwl (%rbx),%r12d
22e7   940b27:	48 89 df             	mov    %rbx,%rdi
22ea   940b2a:	e8 00 00 00 00       	call   940b2f <___bpf_prog_run+0x22ef>	940b2b: R_X86_64_PLT32	__msan_metadata_ptr_for_load_2-0x4
22ef   940b2f:	44 0f b7 28          	movzwl (%rax),%r13d
22f3   940b33:	44 8b 32             	mov    (%rdx),%r14d
22f6   940b36:	48 85 ed             	test   %rbp,%rbp
22f9   940b39:	0f 84 9c 77 00 00    	je     9482db <___bpf_prog_run+0x9a9b>
22ff   940b3f:	44 89 ff             	mov    %r15d,%edi
2302   940b42:	e8 00 00 00 00       	call   940b47 <___bpf_prog_run+0x2307>	940b43: R_X86_64_PLT32	__msan_warning-0x4
2307   940b47:	e9 8f 77 00 00       	jmp    9482db <___bpf_prog_run+0x9a9b>
230c   940b4c:	49 8d 5d 01          	lea    0x1(%r13),%rbx
2310   940b50:	4d 85 f6             	test   %r14,%r14
2313   940b53:	0f 85 ff 6e 00 00    	jne    947a58 <___bpf_prog_run+0x9218>
2319   940b59:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
231e   940b5e:	44 0f b6 33          	movzbl (%rbx),%r14d
2322   940b62:	48 89 df             	mov    %rbx,%rdi
2325   940b65:	e8 00 00 00 00       	call   940b6a <___bpf_prog_run+0x232a>	940b66: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
232a   940b6a:	0f b6 18             	movzbl (%rax),%ebx
232d   940b6d:	44 8b 22             	mov    (%rdx),%r12d
2330   940b70:	89 d8                	mov    %ebx,%eax
2332   940b72:	83 e0 0f             	and    $0xf,%eax
2335   940b75:	44 89 f5             	mov    %r14d,%ebp
2338   940b78:	83 e5 0f             	and    $0xf,%ebp
233b   940b7b:	48 85 c0             	test   %rax,%rax
233e   940b7e:	44 8b 7c 24 04       	mov    0x4(%rsp),%r15d
2343   940b83:	44 89 ff             	mov    %r15d,%edi
2346   940b86:	41 0f 45 fc          	cmovne %r12d,%edi
234a   940b8a:	48 0b 44 24 20       	or     0x20(%rsp),%rax
234f   940b8f:	0f 85 d0 6e 00 00    	jne    947a65 <___bpf_prog_run+0x9225>
2355   940b95:	4c 8b 6c 24 30       	mov    0x30(%rsp),%r13
235a   940b9a:	48 8d 3c ed 00 00 00 00 	lea    0x0(,%rbp,8),%rdi
2362   940ba2:	4c 01 ef             	add    %r13,%rdi
2365   940ba5:	48 8b 07             	mov    (%rdi),%rax
2368   940ba8:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
236d   940bad:	e8 00 00 00 00       	call   940bb2 <___bpf_prog_run+0x2372>	940bae: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
2372   940bb2:	4c 89 ed             	mov    %r13,%rbp
2375   940bb5:	4c 8b 28             	mov    (%rax),%r13
2378   940bb8:	8b 02                	mov    (%rdx),%eax
237a   940bba:	89 44 24 08          	mov    %eax,0x8(%rsp)
237e   940bbe:	48 c1 eb 04          	shr    $0x4,%rbx
2382   940bc2:	49 c1 ee 04          	shr    $0x4,%r14
2386   940bc6:	48 85 db             	test   %rbx,%rbx
2389   940bc9:	45 0f 44 e7          	cmove  %r15d,%r12d
238d   940bcd:	48 0b 5c 24 20       	or     0x20(%rsp),%rbx
2392   940bd2:	0f 85 97 6e 00 00    	jne    947a6f <___bpf_prog_run+0x922f>
2398   940bd8:	4a 8d 3c f5 00 00 00 00 	lea    0x0(,%r14,8),%rdi
23a0   940be0:	48 01 ef             	add    %rbp,%rdi
23a3   940be3:	48 8b 1f             	mov    (%rdi),%rbx
23a6   940be6:	e8 00 00 00 00       	call   940beb <___bpf_prog_run+0x23ab>	940be7: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
23ab   940beb:	48 8b 00             	mov    (%rax),%rax
23ae   940bee:	48 85 c0             	test   %rax,%rax
23b1   940bf1:	74 06                	je     940bf9 <___bpf_prog_run+0x23b9>
23b3   940bf3:	8b 0a                	mov    (%rdx),%ecx
23b5   940bf5:	89 4c 24 08          	mov    %ecx,0x8(%rsp)
23b9   940bf9:	49 09 c5             	or     %rax,%r13
23bc   940bfc:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
23c1   940c01:	0f 85 75 6e 00 00    	jne    947a7c <___bpf_prog_run+0x923c>
23c7   940c07:	48 39 5c 24 18       	cmp    %rbx,0x18(%rsp)
23cc   940c0c:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
23d1   940c11:	0f 83 1d 46 00 00    	jae    945234 <___bpf_prog_run+0x69f4>
23d7   940c17:	e8 00 00 00 00       	call   940c1c <___bpf_prog_run+0x23dc>	940c18: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
23dc   940c1c:	49 8d 5d 02          	lea    0x2(%r13),%rbx
23e0   940c20:	4d 85 f6             	test   %r14,%r14
23e3   940c23:	0f 84 93 78 00 00    	je     9484bc <___bpf_prog_run+0x9c7c>
23e9   940c29:	8b 3c 24             	mov    (%rsp),%edi
23ec   940c2c:	e8 00 00 00 00       	call   940c31 <___bpf_prog_run+0x23f1>	940c2d: R_X86_64_PLT32	__msan_warning-0x4
23f1   940c31:	e9 86 78 00 00       	jmp    9484bc <___bpf_prog_run+0x9c7c>
23f6   940c36:	e8 00 00 00 00       	call   940c3b <___bpf_prog_run+0x23fb>	940c37: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
23fb   940c3b:	4c 89 f0             	mov    %r14,%rax
23fe   940c3e:	4d 8d 75 01          	lea    0x1(%r13),%r14
2402   940c42:	48 85 c0             	test   %rax,%rax
2405   940c45:	0f 85 3f 6e 00 00    	jne    947a8a <___bpf_prog_run+0x924a>
240b   940c4b:	41 0f b6 1e          	movzbl (%r14),%ebx
240f   940c4f:	4c 89 f7             	mov    %r14,%rdi
2412   940c52:	e8 00 00 00 00       	call   940c57 <___bpf_prog_run+0x2417>	940c53: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
2417   940c57:	0f b6 00             	movzbl (%rax),%eax
241a   940c5a:	83 e0 0f             	and    $0xf,%eax
241d   940c5d:	8b 7c 24 04          	mov    0x4(%rsp),%edi
2421   940c61:	48 85 c0             	test   %rax,%rax
2424   940c64:	74 02                	je     940c68 <___bpf_prog_run+0x2428>
2426   940c66:	8b 3a                	mov    (%rdx),%edi
2428   940c68:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
242d   940c6d:	83 e3 0f             	and    $0xf,%ebx
2430   940c70:	48 8b 6c 24 20       	mov    0x20(%rsp),%rbp
2435   940c75:	48 09 e8             	or     %rbp,%rax
2438   940c78:	0f 85 19 6e 00 00    	jne    947a97 <___bpf_prog_run+0x9257>
243e   940c7e:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
2443   940c83:	48 8d 3c d8          	lea    (%rax,%rbx,8),%rdi
2447   940c87:	44 8b 2f             	mov    (%rdi),%r13d
244a   940c8a:	e8 00 00 00 00       	call   940c8f <___bpf_prog_run+0x244f>	940c8b: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
244f   940c8f:	44 8b 20             	mov    (%rax),%r12d
2452   940c92:	8b 02                	mov    (%rdx),%eax
2454   940c94:	89 44 24 08          	mov    %eax,0x8(%rsp)
2458   940c98:	48 85 ed             	test   %rbp,%rbp
245b   940c9b:	0f 85 00 6e 00 00    	jne    947aa1 <___bpf_prog_run+0x9261>
2461   940ca1:	48 8b 6c 24 60       	mov    0x60(%rsp),%rbp
2466   940ca6:	48 89 ef             	mov    %rbp,%rdi
2469   940ca9:	e8 00 00 00 00       	call   940cae <___bpf_prog_run+0x246e>	940caa: R_X86_64_PLT32	__msan_metadata_ptr_for_store_8-0x4
246e   940cae:	4c 89 20             	mov    %r12,(%rax)
2471   940cb1:	4d 85 e4             	test   %r12,%r12
2474   940cb4:	0f 85 f5 6d 00 00    	jne    947aaf <___bpf_prog_run+0x926f>
247a   940cba:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
247f   940cbf:	48 8d 58 04          	lea    0x4(%rax),%rbx
2483   940cc3:	4c 89 6d 00          	mov    %r13,0x0(%rbp)
2487   940cc7:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
248d   940ccd:	0f 85 fc 6d 00 00    	jne    947acf <___bpf_prog_run+0x928f>
2493   940cd3:	8b 2b                	mov    (%rbx),%ebp
2495   940cd5:	48 89 df             	mov    %rbx,%rdi
2498   940cd8:	e8 00 00 00 00       	call   940cdd <___bpf_prog_run+0x249d>	940cd9: R_X86_64_PLT32	__msan_metadata_ptr_for_load_4-0x4
249d   940cdd:	8b 18                	mov    (%rax),%ebx
249f   940cdf:	44 8b 3a             	mov    (%rdx),%r15d
24a2   940ce2:	85 db                	test   %ebx,%ebx
24a4   940ce4:	0f 85 f2 6d 00 00    	jne    947adc <___bpf_prog_run+0x929c>
24aa   940cea:	44 89 e8             	mov    %r13d,%eax
24ad   940ced:	31 d2                	xor    %edx,%edx
24af   940cef:	f7 f5                	div    %ebp
24b1   940cf1:	48 89 54 24 18       	mov    %rdx,0x18(%rsp)
24b6   940cf6:	85 db                	test   %ebx,%ebx
24b8   940cf8:	0f 85 eb 6d 00 00    	jne    947ae9 <___bpf_prog_run+0x92a9>
24be   940cfe:	44 89 e8             	mov    %r13d,%eax
24c1   940d01:	31 d2                	xor    %edx,%edx
24c3   940d03:	f7 f5                	div    %ebp
24c5   940d05:	41 89 c5             	mov    %eax,%r13d
24c8   940d08:	48 83 7c 24 20 00    	cmpq   $0x0,0x20(%rsp)
24ce   940d0e:	0f 85 e2 6d 00 00    	jne    947af6 <___bpf_prog_run+0x92b6>
24d4   940d14:	44 89 e5             	mov    %r12d,%ebp
24d7   940d17:	48 8b 5c 24 60       	mov    0x60(%rsp),%rbx
24dc   940d1c:	48 89 df             	mov    %rbx,%rdi
24df   940d1f:	e8 00 00 00 00       	call   940d24 <___bpf_prog_run+0x24e4>	940d20: R_X86_64_PLT32	__msan_metadata_ptr_for_store_8-0x4
24e4   940d24:	48 89 28             	mov    %rbp,(%rax)
24e7   940d27:	48 85 ed             	test   %rbp,%rbp
24ea   940d2a:	0f 85 d4 6d 00 00    	jne    947b04 <___bpf_prog_run+0x92c4>
24f0   940d30:	4c 89 2b             	mov    %r13,(%rbx)
24f3   940d33:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
24f9   940d39:	0f 85 e5 6d 00 00    	jne    947b24 <___bpf_prog_run+0x92e4>
24ff   940d3f:	41 0f b6 1e          	movzbl (%r14),%ebx
2503   940d43:	4c 89 f7             	mov    %r14,%rdi
2506   940d46:	e8 00 00 00 00       	call   940d4b <___bpf_prog_run+0x250b>	940d47: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
250b   940d4b:	0f b6 00             	movzbl (%rax),%eax
250e   940d4e:	83 e0 0f             	and    $0xf,%eax
2511   940d51:	8b 7c 24 04          	mov    0x4(%rsp),%edi
2515   940d55:	48 85 c0             	test   %rax,%rax
2518   940d58:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
251d   940d5d:	74 02                	je     940d61 <___bpf_prog_run+0x2521>
251f   940d5f:	8b 3a                	mov    (%rdx),%edi
2521   940d61:	83 e3 0f             	and    $0xf,%ebx
2524   940d64:	48 0b 44 24 20       	or     0x20(%rsp),%rax
2529   940d69:	0f 84 b0 32 00 00    	je     94401f <___bpf_prog_run+0x57df>
252f   940d6f:	e8 00 00 00 00       	call   940d74 <___bpf_prog_run+0x2534>	940d70: R_X86_64_PLT32	__msan_warning-0x4
2534   940d74:	e9 a6 32 00 00       	jmp    94401f <___bpf_prog_run+0x57df>
2539   940d79:	e8 00 00 00 00       	call   940d7e <___bpf_prog_run+0x253e>	940d7a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
253e   940d7e:	49 8d 5d 01          	lea    0x1(%r13),%rbx
2542   940d82:	4d 85 f6             	test   %r14,%r14
2545   940d85:	0f 85 a6 6d 00 00    	jne    947b31 <___bpf_prog_run+0x92f1>
254b   940d8b:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
2550   940d90:	44 0f b6 33          	movzbl (%rbx),%r14d
2554   940d94:	48 89 df             	mov    %rbx,%rdi
2557   940d97:	e8 00 00 00 00       	call   940d9c <___bpf_prog_run+0x255c>	940d98: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
255c   940d9c:	0f b6 28             	movzbl (%rax),%ebp
255f   940d9f:	44 8b 22             	mov    (%rdx),%r12d
2562   940da2:	48 89 e8             	mov    %rbp,%rax
2565   940da5:	48 c1 e8 04          	shr    $0x4,%rax
2569   940da9:	4c 89 f3             	mov    %r14,%rbx
256c   940dac:	48 c1 eb 04          	shr    $0x4,%rbx
2570   940db0:	48 85 c0             	test   %rax,%rax
2573   940db3:	8b 7c 24 04          	mov    0x4(%rsp),%edi
2577   940db7:	41 0f 45 fc          	cmovne %r12d,%edi
257b   940dbb:	4c 8b 7c 24 20       	mov    0x20(%rsp),%r15
2580   940dc0:	4c 09 f8             	or     %r15,%rax
2583   940dc3:	0f 85 75 6d 00 00    	jne    947b3e <___bpf_prog_run+0x92fe>
2589   940dc9:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
258e   940dce:	48 8d 3c d8          	lea    (%rax,%rbx,8),%rdi
2592   940dd2:	48 89 c3             	mov    %rax,%rbx
2595   940dd5:	44 8b 2f             	mov    (%rdi),%r13d
2598   940dd8:	e8 00 00 00 00       	call   940ddd <___bpf_prog_run+0x259d>	940dd9: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
259d   940ddd:	8b 00                	mov    (%rax),%eax
259f   940ddf:	89 44 24 18          	mov    %eax,0x18(%rsp)
25a3   940de3:	8b 02                	mov    (%rdx),%eax
25a5   940de5:	89 44 24 08          	mov    %eax,0x8(%rsp)
25a9   940de9:	83 e5 0f             	and    $0xf,%ebp
25ac   940dec:	41 83 e6 0f          	and    $0xf,%r14d
25b0   940df0:	48 85 ed             	test   %rbp,%rbp
25b3   940df3:	44 0f 44 64 24 04    	cmove  0x4(%rsp),%r12d
25b9   940df9:	4c 09 fd             	or     %r15,%rbp
25bc   940dfc:	0f 85 46 6d 00 00    	jne    947b48 <___bpf_prog_run+0x9308>
25c2   940e02:	45 89 e7             	mov    %r12d,%r15d
25c5   940e05:	41 83 e5 1f          	and    $0x1f,%r13d
25c9   940e09:	4e 8d 24 f3          	lea    (%rbx,%r14,8),%r12
25cd   940e0d:	45 8b 34 24          	mov    (%r12),%r14d
25d1   940e11:	4c 89 e7             	mov    %r12,%rdi
25d4   940e14:	e8 00 00 00 00       	call   940e19 <___bpf_prog_run+0x25d9>	940e15: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
25d9   940e19:	8b 18                	mov    (%rax),%ebx
25db   940e1b:	31 c0                	xor    %eax,%eax
25dd   940e1d:	f6 44 24 18 1f       	testb  $0x1f,0x18(%rsp)
25e2   940e22:	0f 95 c1             	setne  %cl
25e5   940e25:	75 06                	jne    940e2d <___bpf_prog_run+0x25ed>
25e7   940e27:	8b 12                	mov    (%rdx),%edx
25e9   940e29:	89 54 24 08          	mov    %edx,0x8(%rsp)
25ed   940e2d:	88 c8                	mov    %cl,%al
25ef   940e2f:	f7 d8                	neg    %eax
25f1   940e31:	44 89 e9             	mov    %r13d,%ecx
25f4   940e34:	d3 fb                	sar    %cl,%ebx
25f6   940e36:	09 c3                	or     %eax,%ebx
25f8   940e38:	41 d3 fe             	sar    %cl,%r14d
25fb   940e3b:	48 85 ed             	test   %rbp,%rbp
25fe   940e3e:	0f 84 cd 33 00 00    	je     944211 <___bpf_prog_run+0x59d1>
2604   940e44:	44 89 ff             	mov    %r15d,%edi
2607   940e47:	e8 00 00 00 00       	call   940e4c <___bpf_prog_run+0x260c>	940e48: R_X86_64_PLT32	__msan_warning-0x4
260c   940e4c:	e9 c0 33 00 00       	jmp    944211 <___bpf_prog_run+0x59d1>
2611   940e51:	49 8d 5d 01          	lea    0x1(%r13),%rbx
2615   940e55:	4d 85 f6             	test   %r14,%r14
2618   940e58:	0f 85 f7 6c 00 00    	jne    947b55 <___bpf_prog_run+0x9315>
261e   940e5e:	0f b6 2b             	movzbl (%rbx),%ebp
2621   940e61:	48 89 df             	mov    %rbx,%rdi
2624   940e64:	e8 00 00 00 00       	call   940e69 <___bpf_prog_run+0x2629>	940e65: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
2629   940e69:	0f b6 00             	movzbl (%rax),%eax
262c   940e6c:	83 e0 0f             	and    $0xf,%eax
262f   940e6f:	8b 7c 24 04          	mov    0x4(%rsp),%edi
2633   940e73:	48 85 c0             	test   %rax,%rax
2636   940e76:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
263b   940e7b:	74 02                	je     940e7f <___bpf_prog_run+0x263f>
263d   940e7d:	8b 3a                	mov    (%rdx),%edi
263f   940e7f:	83 e5 0f             	and    $0xf,%ebp
2642   940e82:	48 09 c8             	or     %rcx,%rax
2645   940e85:	0f 85 d7 6c 00 00    	jne    947b62 <___bpf_prog_run+0x9322>
264b   940e8b:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
2650   940e90:	48 8d 3c e8          	lea    (%rax,%rbp,8),%rdi
2654   940e94:	44 8b 3f             	mov    (%rdi),%r15d
2657   940e97:	e8 00 00 00 00       	call   940e9c <___bpf_prog_run+0x265c>	940e98: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
265c   940e9c:	49 8d 6d 04          	lea    0x4(%r13),%rbp
2660   940ea0:	8b 18                	mov    (%rax),%ebx
2662   940ea2:	44 8b 32             	mov    (%rdx),%r14d
2665   940ea5:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
266b   940eab:	0f 85 bb 6c 00 00    	jne    947b6c <___bpf_prog_run+0x932c>
2671   940eb1:	44 8b 65 00          	mov    0x0(%rbp),%r12d
2675   940eb5:	48 89 ef             	mov    %rbp,%rdi
2678   940eb8:	e8 00 00 00 00       	call   940ebd <___bpf_prog_run+0x267d>	940eb9: R_X86_64_PLT32	__msan_metadata_ptr_for_load_4-0x4
267d   940ebd:	85 db                	test   %ebx,%ebx
267f   940ebf:	75 38                	jne    940ef9 <___bpf_prog_run+0x26b9>
2681   940ec1:	44 8b 32             	mov    (%rdx),%r14d
2684   940ec4:	0b 18                	or     (%rax),%ebx
2686   940ec6:	74 35                	je     940efd <___bpf_prog_run+0x26bd>
2688   940ec8:	44 89 f7             	mov    %r14d,%edi
268b   940ecb:	e8 00 00 00 00       	call   940ed0 <___bpf_prog_run+0x2690>	940ecc: R_X86_64_PLT32	__msan_warning-0x4
2690   940ed0:	45 39 fc             	cmp    %r15d,%r12d
2693   940ed3:	7f 2d                	jg     940f02 <___bpf_prog_run+0x26c2>
2695   940ed5:	e8 00 00 00 00       	call   940eda <___bpf_prog_run+0x269a>	940ed6: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
269a   940eda:	49 8d 5d 02          	lea    0x2(%r13),%rbx
269e   940ede:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
26a3   940ee3:	4d 85 f6             	test   %r14,%r14
26a6   940ee6:	0f 84 d0 75 00 00    	je     9484bc <___bpf_prog_run+0x9c7c>
26ac   940eec:	8b 3c 24             	mov    (%rsp),%edi
26af   940eef:	e8 00 00 00 00       	call   940ef4 <___bpf_prog_run+0x26b4>	940ef0: R_X86_64_PLT32	__msan_warning-0x4
26b4   940ef4:	e9 c3 75 00 00       	jmp    9484bc <___bpf_prog_run+0x9c7c>
26b9   940ef9:	0b 18                	or     (%rax),%ebx
26bb   940efb:	75 cb                	jne    940ec8 <___bpf_prog_run+0x2688>
26bd   940efd:	45 39 fc             	cmp    %r15d,%r12d
26c0   940f00:	7e d3                	jle    940ed5 <___bpf_prog_run+0x2695>
26c2   940f02:	e8 00 00 00 00       	call   940f07 <___bpf_prog_run+0x26c7>	940f03: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
26c7   940f07:	e9 ea d9 ff ff       	jmp    93e8f6 <___bpf_prog_run+0xb6>
26cc   940f0c:	49 8d 5d 01          	lea    0x1(%r13),%rbx
26d0   940f10:	4d 85 f6             	test   %r14,%r14
26d3   940f13:	0f 85 60 6c 00 00    	jne    947b79 <___bpf_prog_run+0x9339>
26d9   940f19:	0f b6 2b             	movzbl (%rbx),%ebp
26dc   940f1c:	48 89 df             	mov    %rbx,%rdi
26df   940f1f:	e8 00 00 00 00       	call   940f24 <___bpf_prog_run+0x26e4>	940f20: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
26e4   940f24:	0f b6 00             	movzbl (%rax),%eax
26e7   940f27:	83 e0 0f             	and    $0xf,%eax
26ea   940f2a:	8b 7c 24 04          	mov    0x4(%rsp),%edi
26ee   940f2e:	48 85 c0             	test   %rax,%rax
26f1   940f31:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
26f6   940f36:	74 02                	je     940f3a <___bpf_prog_run+0x26fa>
26f8   940f38:	8b 3a                	mov    (%rdx),%edi
26fa   940f3a:	83 e5 0f             	and    $0xf,%ebp
26fd   940f3d:	48 09 c8             	or     %rcx,%rax
2700   940f40:	0f 85 40 6c 00 00    	jne    947b86 <___bpf_prog_run+0x9346>
2706   940f46:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
270b   940f4b:	48 8d 3c e8          	lea    (%rax,%rbp,8),%rdi
270f   940f4f:	4c 8b 3f             	mov    (%rdi),%r15
2712   940f52:	e8 00 00 00 00       	call   940f57 <___bpf_prog_run+0x2717>	940f53: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
2717   940f57:	49 8d 6d 04          	lea    0x4(%r13),%rbp
271b   940f5b:	48 8b 18             	mov    (%rax),%rbx
271e   940f5e:	44 8b 32             	mov    (%rdx),%r14d
2721   940f61:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
2727   940f67:	0f 85 23 6c 00 00    	jne    947b90 <___bpf_prog_run+0x9350>
272d   940f6d:	4c 63 65 00          	movslq 0x0(%rbp),%r12
2731   940f71:	48 89 ef             	mov    %rbp,%rdi
2734   940f74:	e8 00 00 00 00       	call   940f79 <___bpf_prog_run+0x2739>	940f75: R_X86_64_PLT32	__msan_metadata_ptr_for_load_4-0x4
2739   940f79:	48 63 00             	movslq (%rax),%rax
273c   940f7c:	48 85 c0             	test   %rax,%rax
273f   940f7f:	74 39                	je     940fba <___bpf_prog_run+0x277a>
2741   940f81:	44 8b 32             	mov    (%rdx),%r14d
2744   940f84:	48 09 c3             	or     %rax,%rbx
2747   940f87:	74 36                	je     940fbf <___bpf_prog_run+0x277f>
2749   940f89:	44 89 f7             	mov    %r14d,%edi
274c   940f8c:	e8 00 00 00 00       	call   940f91 <___bpf_prog_run+0x2751>	940f8d: R_X86_64_PLT32	__msan_warning-0x4
2751   940f91:	4d 39 e7             	cmp    %r12,%r15
2754   940f94:	77 2e                	ja     940fc4 <___bpf_prog_run+0x2784>
2756   940f96:	e8 00 00 00 00       	call   940f9b <___bpf_prog_run+0x275b>	940f97: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
275b   940f9b:	49 8d 5d 02          	lea    0x2(%r13),%rbx
275f   940f9f:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
2764   940fa4:	4d 85 f6             	test   %r14,%r14
2767   940fa7:	0f 84 0f 75 00 00    	je     9484bc <___bpf_prog_run+0x9c7c>
276d   940fad:	8b 3c 24             	mov    (%rsp),%edi
2770   940fb0:	e8 00 00 00 00       	call   940fb5 <___bpf_prog_run+0x2775>	940fb1: R_X86_64_PLT32	__msan_warning-0x4
2775   940fb5:	e9 02 75 00 00       	jmp    9484bc <___bpf_prog_run+0x9c7c>
277a   940fba:	48 09 c3             	or     %rax,%rbx
277d   940fbd:	75 ca                	jne    940f89 <___bpf_prog_run+0x2749>
277f   940fbf:	4d 39 e7             	cmp    %r12,%r15
2782   940fc2:	76 d2                	jbe    940f96 <___bpf_prog_run+0x2756>
2784   940fc4:	e8 00 00 00 00       	call   940fc9 <___bpf_prog_run+0x2789>	940fc5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2789   940fc9:	e9 28 d9 ff ff       	jmp    93e8f6 <___bpf_prog_run+0xb6>
278e   940fce:	49 8d 5d 01          	lea    0x1(%r13),%rbx
2792   940fd2:	4d 85 f6             	test   %r14,%r14
2795   940fd5:	0f 85 c2 6b 00 00    	jne    947b9d <___bpf_prog_run+0x935d>
279b   940fdb:	0f b6 2b             	movzbl (%rbx),%ebp
279e   940fde:	48 89 df             	mov    %rbx,%rdi
27a1   940fe1:	e8 00 00 00 00       	call   940fe6 <___bpf_prog_run+0x27a6>	940fe2: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
27a6   940fe6:	0f b6 00             	movzbl (%rax),%eax
27a9   940fe9:	83 e0 0f             	and    $0xf,%eax
27ac   940fec:	8b 7c 24 04          	mov    0x4(%rsp),%edi
27b0   940ff0:	48 85 c0             	test   %rax,%rax
27b3   940ff3:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
27b8   940ff8:	74 02                	je     940ffc <___bpf_prog_run+0x27bc>
27ba   940ffa:	8b 3a                	mov    (%rdx),%edi
27bc   940ffc:	83 e5 0f             	and    $0xf,%ebp
27bf   940fff:	48 09 c8             	or     %rcx,%rax
27c2   941002:	0f 85 a2 6b 00 00    	jne    947baa <___bpf_prog_run+0x936a>
27c8   941008:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
27cd   94100d:	48 8d 3c e8          	lea    (%rax,%rbp,8),%rdi
27d1   941011:	4c 8b 3f             	mov    (%rdi),%r15
27d4   941014:	e8 00 00 00 00       	call   941019 <___bpf_prog_run+0x27d9>	941015: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
27d9   941019:	49 8d 6d 04          	lea    0x4(%r13),%rbp
27dd   94101d:	48 8b 18             	mov    (%rax),%rbx
27e0   941020:	44 8b 32             	mov    (%rdx),%r14d
27e3   941023:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
27e9   941029:	0f 85 85 6b 00 00    	jne    947bb4 <___bpf_prog_run+0x9374>
27ef   94102f:	4c 63 65 00          	movslq 0x0(%rbp),%r12
27f3   941033:	48 89 ef             	mov    %rbp,%rdi
27f6   941036:	e8 00 00 00 00       	call   94103b <___bpf_prog_run+0x27fb>	941037: R_X86_64_PLT32	__msan_metadata_ptr_for_load_4-0x4
27fb   94103b:	48 63 00             	movslq (%rax),%rax
27fe   94103e:	48 09 c3             	or     %rax,%rbx
2801   941041:	48 85 c0             	test   %rax,%rax
2804   941044:	74 03                	je     941049 <___bpf_prog_run+0x2809>
2806   941046:	44 8b 32             	mov    (%rdx),%r14d
2809   941049:	48 85 db             	test   %rbx,%rbx
280c   94104c:	74 12                	je     941060 <___bpf_prog_run+0x2820>
280e   94104e:	4c 89 f8             	mov    %r15,%rax
2811   941051:	4c 31 e0             	xor    %r12,%rax
2814   941054:	48 f7 d3             	not    %rbx
2817   941057:	48 21 c3             	and    %rax,%rbx
281a   94105a:	0f 84 61 6b 00 00    	je     947bc1 <___bpf_prog_run+0x9381>
2820   941060:	4d 39 e7             	cmp    %r12,%r15
2823   941063:	0f 85 69 6b 00 00    	jne    947bd2 <___bpf_prog_run+0x9392>
2829   941069:	e8 00 00 00 00       	call   94106e <___bpf_prog_run+0x282e>	94106a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
282e   94106e:	49 8d 5d 02          	lea    0x2(%r13),%rbx
2832   941072:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
2837   941077:	4d 85 f6             	test   %r14,%r14
283a   94107a:	0f 84 3b 77 00 00    	je     9487bb <___bpf_prog_run+0x9f7b>
2840   941080:	8b 3c 24             	mov    (%rsp),%edi
2843   941083:	e8 00 00 00 00       	call   941088 <___bpf_prog_run+0x2848>	941084: R_X86_64_PLT32	__msan_warning-0x4
2848   941088:	e9 2e 77 00 00       	jmp    9487bb <___bpf_prog_run+0x9f7b>
284d   94108d:	49 8d 5d 01          	lea    0x1(%r13),%rbx
2851   941091:	4d 85 f6             	test   %r14,%r14
2854   941094:	0f 85 42 6b 00 00    	jne    947bdc <___bpf_prog_run+0x939c>
285a   94109a:	0f b6 2b             	movzbl (%rbx),%ebp
285d   94109d:	48 89 df             	mov    %rbx,%rdi
2860   9410a0:	e8 00 00 00 00       	call   9410a5 <___bpf_prog_run+0x2865>	9410a1: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
2865   9410a5:	0f b6 00             	movzbl (%rax),%eax
2868   9410a8:	83 e0 0f             	and    $0xf,%eax
286b   9410ab:	8b 7c 24 04          	mov    0x4(%rsp),%edi
286f   9410af:	48 85 c0             	test   %rax,%rax
2872   9410b2:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
2877   9410b7:	74 02                	je     9410bb <___bpf_prog_run+0x287b>
2879   9410b9:	8b 3a                	mov    (%rdx),%edi
287b   9410bb:	83 e5 0f             	and    $0xf,%ebp
287e   9410be:	48 09 c8             	or     %rcx,%rax
2881   9410c1:	0f 85 22 6b 00 00    	jne    947be9 <___bpf_prog_run+0x93a9>
2887   9410c7:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
288c   9410cc:	48 8d 3c e8          	lea    (%rax,%rbp,8),%rdi
2890   9410d0:	44 8b 3f             	mov    (%rdi),%r15d
2893   9410d3:	e8 00 00 00 00       	call   9410d8 <___bpf_prog_run+0x2898>	9410d4: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
2898   9410d8:	49 8d 6d 04          	lea    0x4(%r13),%rbp
289c   9410dc:	8b 18                	mov    (%rax),%ebx
289e   9410de:	44 8b 32             	mov    (%rdx),%r14d
28a1   9410e1:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
28a7   9410e7:	0f 85 06 6b 00 00    	jne    947bf3 <___bpf_prog_run+0x93b3>
28ad   9410ed:	44 8b 65 00          	mov    0x0(%rbp),%r12d
28b1   9410f1:	48 89 ef             	mov    %rbp,%rdi
28b4   9410f4:	e8 00 00 00 00       	call   9410f9 <___bpf_prog_run+0x28b9>	9410f5: R_X86_64_PLT32	__msan_metadata_ptr_for_load_4-0x4
28b9   9410f9:	8b 00                	mov    (%rax),%eax
28bb   9410fb:	09 d8                	or     %ebx,%eax
28bd   9410fd:	85 db                	test   %ebx,%ebx
28bf   9410ff:	75 03                	jne    941104 <___bpf_prog_run+0x28c4>
28c1   941101:	44 8b 32             	mov    (%rdx),%r14d
28c4   941104:	85 c0                	test   %eax,%eax
28c6   941106:	74 10                	je     941118 <___bpf_prog_run+0x28d8>
28c8   941108:	44 89 e1             	mov    %r12d,%ecx
28cb   94110b:	44 31 f9             	xor    %r15d,%ecx
28ce   94110e:	f7 d0                	not    %eax
28d0   941110:	21 c8                	and    %ecx,%eax
28d2   941112:	0f 84 e8 6a 00 00    	je     947c00 <___bpf_prog_run+0x93c0>
28d8   941118:	45 39 fc             	cmp    %r15d,%r12d
28db   94111b:	0f 85 f0 6a 00 00    	jne    947c11 <___bpf_prog_run+0x93d1>
28e1   941121:	e8 00 00 00 00       	call   941126 <___bpf_prog_run+0x28e6>	941122: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
28e6   941126:	49 8d 5d 02          	lea    0x2(%r13),%rbx
28ea   94112a:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
28ef   94112f:	4d 85 f6             	test   %r14,%r14
28f2   941132:	0f 84 83 76 00 00    	je     9487bb <___bpf_prog_run+0x9f7b>
28f8   941138:	8b 3c 24             	mov    (%rsp),%edi
28fb   94113b:	e8 00 00 00 00       	call   941140 <___bpf_prog_run+0x2900>	94113c: R_X86_64_PLT32	__msan_warning-0x4
2900   941140:	e9 76 76 00 00       	jmp    9487bb <___bpf_prog_run+0x9f7b>
2905   941145:	e8 00 00 00 00       	call   94114a <___bpf_prog_run+0x290a>	941146: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
290a   94114a:	90                   	nop
290b   94114b:	90                   	nop
290c   94114c:	90                   	nop
290d   94114d:	49 83 c5 08          	add    $0x8,%r13
2911   941151:	e9 a9 d7 ff ff       	jmp    93e8ff <___bpf_prog_run+0xbf>
2916   941156:	49 8d 5d 04          	lea    0x4(%r13),%rbx
291a   94115a:	4d 85 f6             	test   %r14,%r14
291d   94115d:	4c 89 f5             	mov    %r14,%rbp
2920   941160:	0f 85 b5 6a 00 00    	jne    947c1b <___bpf_prog_run+0x93db>
2926   941166:	45 8b 75 04          	mov    0x4(%r13),%r14d
292a   94116a:	48 89 df             	mov    %rbx,%rdi
292d   94116d:	e8 00 00 00 00       	call   941172 <___bpf_prog_run+0x2932>	94116e: R_X86_64_PLT32	__msan_metadata_ptr_for_load_4-0x4
2932   941172:	49 8d 5d 01          	lea    0x1(%r13),%rbx
2936   941176:	8b 00                	mov    (%rax),%eax
2938   941178:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
293d   94117d:	8b 02                	mov    (%rdx),%eax
293f   94117f:	89 44 24 18          	mov    %eax,0x18(%rsp)
2943   941183:	48 85 ed             	test   %rbp,%rbp
2946   941186:	0f 85 9c 6a 00 00    	jne    947c28 <___bpf_prog_run+0x93e8>
294c   94118c:	0f b6 2b             	movzbl (%rbx),%ebp
294f   94118f:	48 89 df             	mov    %rbx,%rdi
2952   941192:	e8 00 00 00 00       	call   941197 <___bpf_prog_run+0x2957>	941193: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
2957   941197:	44 0f b6 38          	movzbl (%rax),%r15d
295b   94119b:	41 83 e7 0f          	and    $0xf,%r15d
295f   94119f:	8b 5c 24 04          	mov    0x4(%rsp),%ebx
2963   9411a3:	4d 85 ff             	test   %r15,%r15
2966   9411a6:	74 02                	je     9411aa <___bpf_prog_run+0x296a>
2968   9411a8:	8b 1a                	mov    (%rdx),%ebx
296a   9411aa:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
296f   9411af:	83 e5 0f             	and    $0xf,%ebp
2972   9411b2:	4c 0b 7c 24 20       	or     0x20(%rsp),%r15
2977   9411b7:	0f 85 78 6a 00 00    	jne    947c35 <___bpf_prog_run+0x93f5>
297d   9411bd:	89 5c 24 38          	mov    %ebx,0x38(%rsp)
2981   9411c1:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
2986   9411c6:	48 8d 2c e8          	lea    (%rax,%rbp,8),%rbp
298a   9411ca:	4c 8b 6d 00          	mov    0x0(%rbp),%r13
298e   9411ce:	48 89 ef             	mov    %rbp,%rdi
2991   9411d1:	e8 00 00 00 00       	call   9411d6 <___bpf_prog_run+0x2996>	9411d2: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
2996   9411d6:	48 8b 18             	mov    (%rax),%rbx
2999   9411d9:	44 8b 22             	mov    (%rdx),%r12d
299c   9411dc:	41 83 fe 3f          	cmp    $0x3f,%r14d
29a0   9411e0:	0f 87 4b 87 00 00    	ja     949931 <___bpf_prog_run+0xb0f1>
29a6   9411e6:	e8 00 00 00 00       	call   9411eb <___bpf_prog_run+0x29ab>	9411e7: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
29ab   9411eb:	31 c0                	xor    %eax,%eax
29ad   9411ed:	48 83 7c 24 08 00    	cmpq   $0x0,0x8(%rsp)
29b3   9411f3:	0f 95 c0             	setne  %al
29b6   9411f6:	44 0f 45 64 24 18    	cmovne 0x18(%rsp),%r12d
29bc   9411fc:	48 f7 d8             	neg    %rax
29bf   9411ff:	44 89 f1             	mov    %r14d,%ecx
29c2   941202:	48 d3 fb             	sar    %cl,%rbx
29c5   941205:	48 09 c3             	or     %rax,%rbx
29c8   941208:	49 d3 fd             	sar    %cl,%r13
29cb   94120b:	4d 85 ff             	test   %r15,%r15
29ce   94120e:	0f 85 2d 6a 00 00    	jne    947c41 <___bpf_prog_run+0x9401>
29d4   941214:	48 89 ef             	mov    %rbp,%rdi
29d7   941217:	e8 00 00 00 00       	call   94121c <___bpf_prog_run+0x29dc>	941218: R_X86_64_PLT32	__msan_metadata_ptr_for_store_8-0x4
29dc   94121c:	48 89 18             	mov    %rbx,(%rax)
29df   94121f:	48 85 db             	test   %rbx,%rbx
29e2   941222:	0f 85 27 6a 00 00    	jne    947c4f <___bpf_prog_run+0x940f>
29e8   941228:	4c 89 6d 00          	mov    %r13,0x0(%rbp)
29ec   94122c:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
29f1   941231:	e9 c0 d6 ff ff       	jmp    93e8f6 <___bpf_prog_run+0xb6>
29f6   941236:	49 8d 5d 01          	lea    0x1(%r13),%rbx
29fa   94123a:	4d 85 f6             	test   %r14,%r14
29fd   94123d:	0f 85 2b 6a 00 00    	jne    947c6e <___bpf_prog_run+0x942e>
2a03   941243:	0f b6 2b             	movzbl (%rbx),%ebp
2a06   941246:	48 89 df             	mov    %rbx,%rdi
2a09   941249:	e8 00 00 00 00       	call   94124e <___bpf_prog_run+0x2a0e>	94124a: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
2a0e   94124e:	0f b6 00             	movzbl (%rax),%eax
2a11   941251:	83 e0 0f             	and    $0xf,%eax
2a14   941254:	8b 7c 24 04          	mov    0x4(%rsp),%edi
2a18   941258:	48 85 c0             	test   %rax,%rax
2a1b   94125b:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
2a20   941260:	74 02                	je     941264 <___bpf_prog_run+0x2a24>
2a22   941262:	8b 3a                	mov    (%rdx),%edi
2a24   941264:	83 e5 0f             	and    $0xf,%ebp
2a27   941267:	48 09 c8             	or     %rcx,%rax
2a2a   94126a:	0f 85 0b 6a 00 00    	jne    947c7b <___bpf_prog_run+0x943b>
2a30   941270:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
2a35   941275:	48 8d 3c e8          	lea    (%rax,%rbp,8),%rdi
2a39   941279:	44 8b 3f             	mov    (%rdi),%r15d
2a3c   94127c:	e8 00 00 00 00       	call   941281 <___bpf_prog_run+0x2a41>	94127d: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
2a41   941281:	49 8d 6d 04          	lea    0x4(%r13),%rbp
2a45   941285:	8b 18                	mov    (%rax),%ebx
2a47   941287:	44 8b 32             	mov    (%rdx),%r14d
2a4a   94128a:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
2a50   941290:	0f 85 ef 69 00 00    	jne    947c85 <___bpf_prog_run+0x9445>
2a56   941296:	44 8b 65 00          	mov    0x0(%rbp),%r12d
2a5a   94129a:	48 89 ef             	mov    %rbp,%rdi
2a5d   94129d:	e8 00 00 00 00       	call   9412a2 <___bpf_prog_run+0x2a62>	94129e: R_X86_64_PLT32	__msan_metadata_ptr_for_load_4-0x4
2a62   9412a2:	85 db                	test   %ebx,%ebx
2a64   9412a4:	75 38                	jne    9412de <___bpf_prog_run+0x2a9e>
2a66   9412a6:	44 8b 32             	mov    (%rdx),%r14d
2a69   9412a9:	0b 18                	or     (%rax),%ebx
2a6b   9412ab:	74 35                	je     9412e2 <___bpf_prog_run+0x2aa2>
2a6d   9412ad:	44 89 f7             	mov    %r14d,%edi
2a70   9412b0:	e8 00 00 00 00       	call   9412b5 <___bpf_prog_run+0x2a75>	9412b1: R_X86_64_PLT32	__msan_warning-0x4
2a75   9412b5:	45 39 fc             	cmp    %r15d,%r12d
2a78   9412b8:	7c 2d                	jl     9412e7 <___bpf_prog_run+0x2aa7>
2a7a   9412ba:	e8 00 00 00 00       	call   9412bf <___bpf_prog_run+0x2a7f>	9412bb: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2a7f   9412bf:	49 8d 5d 02          	lea    0x2(%r13),%rbx
2a83   9412c3:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
2a88   9412c8:	4d 85 f6             	test   %r14,%r14
2a8b   9412cb:	0f 84 eb 71 00 00    	je     9484bc <___bpf_prog_run+0x9c7c>
2a91   9412d1:	8b 3c 24             	mov    (%rsp),%edi
2a94   9412d4:	e8 00 00 00 00       	call   9412d9 <___bpf_prog_run+0x2a99>	9412d5: R_X86_64_PLT32	__msan_warning-0x4
2a99   9412d9:	e9 de 71 00 00       	jmp    9484bc <___bpf_prog_run+0x9c7c>
2a9e   9412de:	0b 18                	or     (%rax),%ebx
2aa0   9412e0:	75 cb                	jne    9412ad <___bpf_prog_run+0x2a6d>
2aa2   9412e2:	45 39 fc             	cmp    %r15d,%r12d
2aa5   9412e5:	7d d3                	jge    9412ba <___bpf_prog_run+0x2a7a>
2aa7   9412e7:	e8 00 00 00 00       	call   9412ec <___bpf_prog_run+0x2aac>	9412e8: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2aac   9412ec:	e9 05 d6 ff ff       	jmp    93e8f6 <___bpf_prog_run+0xb6>
2ab1   9412f1:	49 8d 5d 01          	lea    0x1(%r13),%rbx
2ab5   9412f5:	4d 85 f6             	test   %r14,%r14
2ab8   9412f8:	0f 85 94 69 00 00    	jne    947c92 <___bpf_prog_run+0x9452>
2abe   9412fe:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
2ac3   941303:	44 0f b6 33          	movzbl (%rbx),%r14d
2ac7   941307:	48 89 df             	mov    %rbx,%rdi
2aca   94130a:	e8 00 00 00 00       	call   94130f <___bpf_prog_run+0x2acf>	94130b: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
2acf   94130f:	0f b6 18             	movzbl (%rax),%ebx
2ad2   941312:	44 8b 22             	mov    (%rdx),%r12d
2ad5   941315:	89 d8                	mov    %ebx,%eax
2ad7   941317:	83 e0 0f             	and    $0xf,%eax
2ada   94131a:	44 89 f5             	mov    %r14d,%ebp
2add   94131d:	83 e5 0f             	and    $0xf,%ebp
2ae0   941320:	48 85 c0             	test   %rax,%rax
2ae3   941323:	44 8b 7c 24 04       	mov    0x4(%rsp),%r15d
2ae8   941328:	44 89 ff             	mov    %r15d,%edi
2aeb   94132b:	41 0f 45 fc          	cmovne %r12d,%edi
2aef   94132f:	48 0b 44 24 20       	or     0x20(%rsp),%rax
2af4   941334:	0f 85 65 69 00 00    	jne    947c9f <___bpf_prog_run+0x945f>
2afa   94133a:	4c 8b 6c 24 30       	mov    0x30(%rsp),%r13
2aff   94133f:	48 8d 3c ed 00 00 00 00 	lea    0x0(,%rbp,8),%rdi
2b07   941347:	4c 01 ef             	add    %r13,%rdi
2b0a   94134a:	48 8b 07             	mov    (%rdi),%rax
2b0d   94134d:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
2b12   941352:	e8 00 00 00 00       	call   941357 <___bpf_prog_run+0x2b17>	941353: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
2b17   941357:	4c 89 ed             	mov    %r13,%rbp
2b1a   94135a:	4c 8b 28             	mov    (%rax),%r13
2b1d   94135d:	8b 02                	mov    (%rdx),%eax
2b1f   94135f:	89 44 24 08          	mov    %eax,0x8(%rsp)
2b23   941363:	48 c1 eb 04          	shr    $0x4,%rbx
2b27   941367:	49 c1 ee 04          	shr    $0x4,%r14
2b2b   94136b:	48 85 db             	test   %rbx,%rbx
2b2e   94136e:	45 0f 44 e7          	cmove  %r15d,%r12d
2b32   941372:	48 0b 5c 24 20       	or     0x20(%rsp),%rbx
2b37   941377:	0f 85 2c 69 00 00    	jne    947ca9 <___bpf_prog_run+0x9469>
2b3d   94137d:	4a 8d 3c f5 00 00 00 00 	lea    0x0(,%r14,8),%rdi
2b45   941385:	48 01 ef             	add    %rbp,%rdi
2b48   941388:	48 8b 1f             	mov    (%rdi),%rbx
2b4b   94138b:	e8 00 00 00 00       	call   941390 <___bpf_prog_run+0x2b50>	94138c: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
2b50   941390:	48 8b 00             	mov    (%rax),%rax
2b53   941393:	48 85 c0             	test   %rax,%rax
2b56   941396:	74 06                	je     94139e <___bpf_prog_run+0x2b5e>
2b58   941398:	8b 0a                	mov    (%rdx),%ecx
2b5a   94139a:	89 4c 24 08          	mov    %ecx,0x8(%rsp)
2b5e   94139e:	49 09 c5             	or     %rax,%r13
2b61   9413a1:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
2b66   9413a6:	0f 85 0a 69 00 00    	jne    947cb6 <___bpf_prog_run+0x9476>
2b6c   9413ac:	48 39 5c 24 18       	cmp    %rbx,0x18(%rsp)
2b71   9413b1:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
2b76   9413b6:	0f 83 86 3e 00 00    	jae    945242 <___bpf_prog_run+0x6a02>
2b7c   9413bc:	e8 00 00 00 00       	call   9413c1 <___bpf_prog_run+0x2b81>	9413bd: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2b81   9413c1:	49 83 c5 08          	add    $0x8,%r13
2b85   9413c5:	e9 35 d5 ff ff       	jmp    93e8ff <___bpf_prog_run+0xbf>
2b8a   9413ca:	e8 00 00 00 00       	call   9413cf <___bpf_prog_run+0x2b8f>	9413cb: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2b8f   9413cf:	49 8d 5d 01          	lea    0x1(%r13),%rbx
2b93   9413d3:	4d 85 f6             	test   %r14,%r14
2b96   9413d6:	0f 85 e8 68 00 00    	jne    947cc4 <___bpf_prog_run+0x9484>
2b9c   9413dc:	0f b6 2b             	movzbl (%rbx),%ebp
2b9f   9413df:	48 89 df             	mov    %rbx,%rdi
2ba2   9413e2:	e8 00 00 00 00       	call   9413e7 <___bpf_prog_run+0x2ba7>	9413e3: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
2ba7   9413e7:	44 0f b6 30          	movzbl (%rax),%r14d
2bab   9413eb:	41 83 e6 0f          	and    $0xf,%r14d
2baf   9413ef:	8b 5c 24 04          	mov    0x4(%rsp),%ebx
2bb3   9413f3:	4d 85 f6             	test   %r14,%r14
2bb6   9413f6:	74 02                	je     9413fa <___bpf_prog_run+0x2bba>
2bb8   9413f8:	8b 1a                	mov    (%rdx),%ebx
2bba   9413fa:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
2bbf   9413ff:	83 e5 0f             	and    $0xf,%ebp
2bc2   941402:	4c 0b 74 24 20       	or     0x20(%rsp),%r14
2bc7   941407:	0f 85 c4 68 00 00    	jne    947cd1 <___bpf_prog_run+0x9491>
2bcd   94140d:	89 5c 24 08          	mov    %ebx,0x8(%rsp)
2bd1   941411:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
2bd6   941416:	4c 8d 2c e8          	lea    (%rax,%rbp,8),%r13
2bda   94141a:	4d 8b 65 00          	mov    0x0(%r13),%r12
2bde   94141e:	4c 89 ef             	mov    %r13,%rdi
2be1   941421:	e8 00 00 00 00       	call   941426 <___bpf_prog_run+0x2be6>	941422: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
2be6   941426:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
2beb   94142b:	48 8d 69 04          	lea    0x4(%rcx),%rbp
2bef   94142f:	48 8b 18             	mov    (%rax),%rbx
2bf2   941432:	8b 02                	mov    (%rdx),%eax
2bf4   941434:	89 44 24 18          	mov    %eax,0x18(%rsp)
2bf8   941438:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
2bfe   94143e:	0f 85 99 68 00 00    	jne    947cdd <___bpf_prog_run+0x949d>
2c04   941444:	4c 63 7d 00          	movslq 0x0(%rbp),%r15
2c08   941448:	48 89 ef             	mov    %rbp,%rdi
2c0b   94144b:	e8 00 00 00 00       	call   941450 <___bpf_prog_run+0x2c10>	94144c: R_X86_64_PLT32	__msan_metadata_ptr_for_load_4-0x4
2c10   941450:	48 63 00             	movslq (%rax),%rax
2c13   941453:	48 85 c0             	test   %rax,%rax
2c16   941456:	74 06                	je     94145e <___bpf_prog_run+0x2c1e>
2c18   941458:	8b 0a                	mov    (%rdx),%ecx
2c1a   94145a:	89 4c 24 18          	mov    %ecx,0x18(%rsp)
2c1e   94145e:	48 09 c3             	or     %rax,%rbx
2c21   941461:	4d 85 f6             	test   %r14,%r14
2c24   941464:	0f 85 80 68 00 00    	jne    947cea <___bpf_prog_run+0x94aa>
2c2a   94146a:	4d 31 fc             	xor    %r15,%r12
2c2d   94146d:	e9 89 28 00 00       	jmp    943cfb <___bpf_prog_run+0x54bb>
2c32   941472:	e8 00 00 00 00       	call   941477 <___bpf_prog_run+0x2c37>	941473: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2c37   941477:	49 8d 5d 01          	lea    0x1(%r13),%rbx
2c3b   94147b:	4d 85 f6             	test   %r14,%r14
2c3e   94147e:	0f 85 74 68 00 00    	jne    947cf8 <___bpf_prog_run+0x94b8>
2c44   941484:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
2c49   941489:	44 0f b6 3b          	movzbl (%rbx),%r15d
2c4d   94148d:	48 89 df             	mov    %rbx,%rdi
2c50   941490:	e8 00 00 00 00       	call   941495 <___bpf_prog_run+0x2c55>	941491: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
2c55   941495:	44 0f b6 30          	movzbl (%rax),%r14d
2c59   941499:	44 8b 2a             	mov    (%rdx),%r13d
2c5c   94149c:	45 89 f4             	mov    %r14d,%r12d
2c5f   94149f:	41 83 e4 0f          	and    $0xf,%r12d
2c63   9414a3:	44 89 fd             	mov    %r15d,%ebp
2c66   9414a6:	83 e5 0f             	and    $0xf,%ebp
2c69   9414a9:	4d 85 e4             	test   %r12,%r12
2c6c   9414ac:	8b 5c 24 04          	mov    0x4(%rsp),%ebx
2c70   9414b0:	41 0f 45 dd          	cmovne %r13d,%ebx
2c74   9414b4:	4c 0b 64 24 20       	or     0x20(%rsp),%r12
2c79   9414b9:	0f 85 46 68 00 00    	jne    947d05 <___bpf_prog_run+0x94c5>
2c7f   9414bf:	89 5c 24 40          	mov    %ebx,0x40(%rsp)
2c83   9414c3:	48 8b 5c 24 30       	mov    0x30(%rsp),%rbx
2c88   9414c8:	48 8d 3c eb          	lea    (%rbx,%rbp,8),%rdi
2c8c   9414cc:	48 8b 2f             	mov    (%rdi),%rbp
2c8f   9414cf:	48 89 7c 24 18       	mov    %rdi,0x18(%rsp)
2c94   9414d4:	e8 00 00 00 00       	call   9414d9 <___bpf_prog_run+0x2c99>	9414d5: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
2c99   9414d9:	48 8b 00             	mov    (%rax),%rax
2c9c   9414dc:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
2ca1   9414e1:	8b 02                	mov    (%rdx),%eax
2ca3   9414e3:	89 44 24 38          	mov    %eax,0x38(%rsp)
2ca7   9414e7:	49 c1 ee 04          	shr    $0x4,%r14
2cab   9414eb:	49 c1 ef 04          	shr    $0x4,%r15
2caf   9414ef:	4d 85 f6             	test   %r14,%r14
2cb2   9414f2:	44 0f 44 6c 24 04    	cmove  0x4(%rsp),%r13d
2cb8   9414f8:	4c 0b 74 24 20       	or     0x20(%rsp),%r14
2cbd   9414fd:	0f 85 0e 68 00 00    	jne    947d11 <___bpf_prog_run+0x94d1>
2cc3   941503:	4a 8d 3c fb          	lea    (%rbx,%r15,8),%rdi
2cc7   941507:	48 2b 2f             	sub    (%rdi),%rbp
2cca   94150a:	e8 00 00 00 00       	call   94150f <___bpf_prog_run+0x2ccf>	94150b: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
2ccf   94150f:	48 8b 00             	mov    (%rax),%rax
2cd2   941512:	48 85 c0             	test   %rax,%rax
2cd5   941515:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
2cda   94151a:	74 06                	je     941522 <___bpf_prog_run+0x2ce2>
2cdc   94151c:	8b 0a                	mov    (%rdx),%ecx
2cde   94151e:	89 4c 24 38          	mov    %ecx,0x38(%rsp)
2ce2   941522:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
2ce7   941527:	48 09 c3             	or     %rax,%rbx
2cea   94152a:	4d 85 e4             	test   %r12,%r12
2ced   94152d:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
2cf2   941532:	0f 85 e6 67 00 00    	jne    947d1e <___bpf_prog_run+0x94de>
2cf8   941538:	4c 8b 7c 24 18       	mov    0x18(%rsp),%r15
2cfd   94153d:	4c 89 ff             	mov    %r15,%rdi
2d00   941540:	e8 00 00 00 00       	call   941545 <___bpf_prog_run+0x2d05>	941541: R_X86_64_PLT32	__msan_metadata_ptr_for_store_8-0x4
2d05   941545:	48 89 18             	mov    %rbx,(%rax)
2d08   941548:	48 85 db             	test   %rbx,%rbx
2d0b   94154b:	0f 85 db 67 00 00    	jne    947d2c <___bpf_prog_run+0x94ec>
2d11   941551:	49 89 2f             	mov    %rbp,(%r15)
2d14   941554:	49 83 c5 08          	add    $0x8,%r13
2d18   941558:	e9 a2 d3 ff ff       	jmp    93e8ff <___bpf_prog_run+0xbf>
2d1d   94155d:	e8 00 00 00 00       	call   941562 <___bpf_prog_run+0x2d22>	94155e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2d22   941562:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
2d27   941567:	49 8d 5d 01          	lea    0x1(%r13),%rbx
2d2b   94156b:	4d 85 f6             	test   %r14,%r14
2d2e   94156e:	0f 85 d9 67 00 00    	jne    947d4d <___bpf_prog_run+0x950d>
2d34   941574:	44 0f b6 3b          	movzbl (%rbx),%r15d
2d38   941578:	48 89 5c 24 18       	mov    %rbx,0x18(%rsp)
2d3d   94157d:	48 89 df             	mov    %rbx,%rdi
2d40   941580:	e8 00 00 00 00       	call   941585 <___bpf_prog_run+0x2d45>	941581: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
2d45   941585:	0f b6 00             	movzbl (%rax),%eax
2d48   941588:	8b 3a                	mov    (%rdx),%edi
2d4a   94158a:	89 c5                	mov    %eax,%ebp
2d4c   94158c:	83 e5 0f             	and    $0xf,%ebp
2d4f   94158f:	48 85 ed             	test   %rbp,%rbp
2d52   941592:	8b 4c 24 04          	mov    0x4(%rsp),%ecx
2d56   941596:	41 89 cd             	mov    %ecx,%r13d
2d59   941599:	44 0f 45 ef          	cmovne %edi,%r13d
2d5d   94159d:	48 c1 e8 04          	shr    $0x4,%rax
2d61   9415a1:	4c 89 fb             	mov    %r15,%rbx
2d64   9415a4:	48 c1 eb 04          	shr    $0x4,%rbx
2d68   9415a8:	48 85 c0             	test   %rax,%rax
2d6b   9415ab:	0f 44 f9             	cmove  %ecx,%edi
2d6e   9415ae:	48 0b 44 24 20       	or     0x20(%rsp),%rax
2d73   9415b3:	0f 85 a1 67 00 00    	jne    947d5a <___bpf_prog_run+0x951a>
2d79   9415b9:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
2d7e   9415be:	48 8d 3c d8          	lea    (%rax,%rbx,8),%rdi
2d82   9415c2:	4c 8b 27             	mov    (%rdi),%r12
2d85   9415c5:	e8 00 00 00 00       	call   9415ca <___bpf_prog_run+0x2d8a>	9415c6: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
2d8a   9415ca:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
2d8f   9415cf:	48 8d 59 02          	lea    0x2(%rcx),%rbx
2d93   9415d3:	4c 8b 30             	mov    (%rax),%r14
2d96   9415d6:	8b 02                	mov    (%rdx),%eax
2d98   9415d8:	89 44 24 08          	mov    %eax,0x8(%rsp)
2d9c   9415dc:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
2da2   9415e2:	0f 85 7c 67 00 00    	jne    947d64 <___bpf_prog_run+0x9524>
2da8   9415e8:	41 83 e7 0f          	and    $0xf,%r15d
2dac   9415ec:	48 0b 6c 24 20       	or     0x20(%rsp),%rbp
2db1   9415f1:	48 0f bf 03          	movswq (%rbx),%rax
2db5   9415f5:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
2dba   9415fa:	48 89 df             	mov    %rbx,%rdi
2dbd   9415fd:	e8 00 00 00 00       	call   941602 <___bpf_prog_run+0x2dc2>	9415fe: R_X86_64_PLT32	__msan_metadata_ptr_for_load_2-0x4
2dc2   941602:	48 0f bf 00          	movswq (%rax),%rax
2dc6   941606:	49 09 c6             	or     %rax,%r14
2dc9   941609:	48 85 c0             	test   %rax,%rax
2dcc   94160c:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
2dd0   941610:	74 02                	je     941614 <___bpf_prog_run+0x2dd4>
2dd2   941612:	8b 0a                	mov    (%rdx),%ecx
2dd4   941614:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
2dd9   941619:	4a 8d 3c f8          	lea    (%rax,%r15,8),%rdi
2ddd   94161d:	4c 03 64 24 38       	add    0x38(%rsp),%r12
2de2   941622:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
2de7   941627:	48 89 28             	mov    %rbp,(%rax)
2dea   94162a:	44 89 a8 88 0c 00 00 	mov    %r13d,0xc88(%rax)
2df1   941631:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
2df8   941638:	4c 89 70 10          	mov    %r14,0x10(%rax)
2dfc   94163c:	89 88 98 0c 00 00    	mov    %ecx,0xc98(%rax)
2e02   941642:	48 c7 80 20 03 00 00 00 00 00 00 	movq   $0x0,0x320(%rax)
2e0d   94164d:	be 04 00 00 00       	mov    $0x4,%esi
2e12   941652:	4c 89 e2             	mov    %r12,%rdx
2e15   941655:	e8 00 00 00 00       	call   94165a <___bpf_prog_run+0x2e1a>	941656: R_X86_64_PLT32	bpf_probe_read_kernel-0x4
2e1a   94165a:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
2e20   941660:	0f 85 0b 67 00 00    	jne    947d71 <___bpf_prog_run+0x9531>
2e26   941666:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
2e2b   94166b:	0f b6 1f             	movzbl (%rdi),%ebx
2e2e   94166e:	e8 00 00 00 00       	call   941673 <___bpf_prog_run+0x2e33>	94166f: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
2e33   941673:	0f b6 28             	movzbl (%rax),%ebp
2e36   941676:	83 e5 0f             	and    $0xf,%ebp
2e39   941679:	44 8b 7c 24 04       	mov    0x4(%rsp),%r15d
2e3e   94167e:	48 85 ed             	test   %rbp,%rbp
2e41   941681:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
2e46   941686:	74 03                	je     94168b <___bpf_prog_run+0x2e4b>
2e48   941688:	44 8b 3a             	mov    (%rdx),%r15d
2e4b   94168b:	83 e3 0f             	and    $0xf,%ebx
2e4e   94168e:	48 09 c5             	or     %rax,%rbp
2e51   941691:	4c 8b 74 24 30       	mov    0x30(%rsp),%r14
2e56   941696:	0f 85 e2 66 00 00    	jne    947d7e <___bpf_prog_run+0x953e>
2e5c   94169c:	49 8d 1c de          	lea    (%r14,%rbx,8),%rbx
2e60   9416a0:	44 8b 23             	mov    (%rbx),%r12d
2e63   9416a3:	48 89 df             	mov    %rbx,%rdi
2e66   9416a6:	e8 00 00 00 00       	call   9416ab <___bpf_prog_run+0x2e6b>	9416a7: R_X86_64_PLT32	__msan_metadata_ptr_for_load_4-0x4
2e6b   9416ab:	44 8b 28             	mov    (%rax),%r13d
2e6e   9416ae:	44 8b 32             	mov    (%rdx),%r14d
2e71   9416b1:	48 85 ed             	test   %rbp,%rbp
2e74   9416b4:	0f 84 21 6c 00 00    	je     9482db <___bpf_prog_run+0x9a9b>
2e7a   9416ba:	44 89 ff             	mov    %r15d,%edi
2e7d   9416bd:	e8 00 00 00 00       	call   9416c2 <___bpf_prog_run+0x2e82>	9416be: R_X86_64_PLT32	__msan_warning-0x4
2e82   9416c2:	e9 14 6c 00 00       	jmp    9482db <___bpf_prog_run+0x9a9b>
2e87   9416c7:	e8 00 00 00 00       	call   9416cc <___bpf_prog_run+0x2e8c>	9416c8: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2e8c   9416cc:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
2e91   9416d1:	49 8d 5d 01          	lea    0x1(%r13),%rbx
2e95   9416d5:	4d 85 f6             	test   %r14,%r14
2e98   9416d8:	0f 85 ad 66 00 00    	jne    947d8b <___bpf_prog_run+0x954b>
2e9e   9416de:	44 0f b6 23          	movzbl (%rbx),%r12d
2ea2   9416e2:	48 89 df             	mov    %rbx,%rdi
2ea5   9416e5:	e8 00 00 00 00       	call   9416ea <___bpf_prog_run+0x2eaa>	9416e6: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
2eaa   9416ea:	0f b6 18             	movzbl (%rax),%ebx
2ead   9416ed:	44 8b 3a             	mov    (%rdx),%r15d
2eb0   9416f0:	48 89 d8             	mov    %rbx,%rax
2eb3   9416f3:	48 c1 e8 04          	shr    $0x4,%rax
2eb7   9416f7:	4c 89 e5             	mov    %r12,%rbp
2eba   9416fa:	48 c1 ed 04          	shr    $0x4,%rbp
2ebe   9416fe:	48 85 c0             	test   %rax,%rax
2ec1   941701:	44 8b 6c 24 04       	mov    0x4(%rsp),%r13d
2ec6   941706:	44 89 ef             	mov    %r13d,%edi
2ec9   941709:	41 0f 45 ff          	cmovne %r15d,%edi
2ecd   94170d:	4c 8b 74 24 20       	mov    0x20(%rsp),%r14
2ed2   941712:	4c 09 f0             	or     %r14,%rax
2ed5   941715:	0f 85 7d 66 00 00    	jne    947d98 <___bpf_prog_run+0x9558>
2edb   94171b:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
2ee0   941720:	48 8d 3c e8          	lea    (%rax,%rbp,8),%rdi
2ee4   941724:	48 89 c5             	mov    %rax,%rbp
2ee7   941727:	8a 07                	mov    (%rdi),%al
2ee9   941729:	88 44 24 18          	mov    %al,0x18(%rsp)
2eed   94172d:	e8 00 00 00 00       	call   941732 <___bpf_prog_run+0x2ef2>	94172e: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
2ef2   941732:	8a 00                	mov    (%rax),%al
2ef4   941734:	88 44 24 08          	mov    %al,0x8(%rsp)
2ef8   941738:	8b 02                	mov    (%rdx),%eax
2efa   94173a:	89 44 24 38          	mov    %eax,0x38(%rsp)
2efe   94173e:	83 e3 0f             	and    $0xf,%ebx
2f01   941741:	41 83 e4 0f          	and    $0xf,%r12d
2f05   941745:	48 85 db             	test   %rbx,%rbx
2f08   941748:	45 0f 44 fd          	cmove  %r13d,%r15d
2f0c   94174c:	4c 09 f3             	or     %r14,%rbx
2f0f   94174f:	0f 85 4d 66 00 00    	jne    947da2 <___bpf_prog_run+0x9562>
2f15   941755:	4a 8d 3c e5 00 00 00 00 	lea    0x0(,%r12,8),%rdi
2f1d   94175d:	48 01 ef             	add    %rbp,%rdi
2f20   941760:	48 8b 2f             	mov    (%rdi),%rbp
2f23   941763:	e8 00 00 00 00       	call   941768 <___bpf_prog_run+0x2f28>	941764: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
2f28   941768:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
2f2d   94176d:	48 8d 59 02          	lea    0x2(%rcx),%rbx
2f31   941771:	4c 8b 28             	mov    (%rax),%r13
2f34   941774:	44 8b 3a             	mov    (%rdx),%r15d
2f37   941777:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
2f3c   94177c:	4d 85 f6             	test   %r14,%r14
2f3f   94177f:	0f 85 2a 66 00 00    	jne    947daf <___bpf_prog_run+0x956f>
2f45   941785:	4c 0f bf 23          	movswq (%rbx),%r12
2f49   941789:	48 89 df             	mov    %rbx,%rdi
2f4c   94178c:	e8 00 00 00 00       	call   941791 <___bpf_prog_run+0x2f51>	94178d: R_X86_64_PLT32	__msan_metadata_ptr_for_load_2-0x4
2f51   941791:	48 0f bf 00          	movswq (%rax),%rax
2f55   941795:	48 85 c0             	test   %rax,%rax
2f58   941798:	74 03                	je     94179d <___bpf_prog_run+0x2f5d>
2f5a   94179a:	44 8b 3a             	mov    (%rdx),%r15d
2f5d   94179d:	4c 01 e5             	add    %r12,%rbp
2f60   9417a0:	49 09 c5             	or     %rax,%r13
2f63   9417a3:	0f 85 13 66 00 00    	jne    947dbc <___bpf_prog_run+0x957c>
2f69   9417a9:	48 89 ef             	mov    %rbp,%rdi
2f6c   9417ac:	e8 00 00 00 00       	call   9417b1 <___bpf_prog_run+0x2f71>	9417ad: R_X86_64_PLT32	__msan_metadata_ptr_for_store_1-0x4
2f71   9417b1:	8a 4c 24 08          	mov    0x8(%rsp),%cl
2f75   9417b5:	88 08                	mov    %cl,(%rax)
2f77   9417b7:	84 c9                	test   %cl,%cl
2f79   9417b9:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
2f7e   9417be:	0f 85 05 66 00 00    	jne    947dc9 <___bpf_prog_run+0x9589>
2f84   9417c4:	8a 44 24 18          	mov    0x18(%rsp),%al
2f88   9417c8:	88 45 00             	mov    %al,0x0(%rbp)
2f8b   9417cb:	49 83 c5 08          	add    $0x8,%r13
2f8f   9417cf:	e9 2b d1 ff ff       	jmp    93e8ff <___bpf_prog_run+0xbf>
2f94   9417d4:	e8 00 00 00 00       	call   9417d9 <___bpf_prog_run+0x2f99>	9417d5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2f99   9417d9:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
2f9e   9417de:	49 8d 5d 01          	lea    0x1(%r13),%rbx
2fa2   9417e2:	4d 85 f6             	test   %r14,%r14
2fa5   9417e5:	0f 85 f2 65 00 00    	jne    947ddd <___bpf_prog_run+0x959d>
2fab   9417eb:	44 0f b6 2b          	movzbl (%rbx),%r13d
2faf   9417ef:	48 89 df             	mov    %rbx,%rdi
2fb2   9417f2:	e8 00 00 00 00       	call   9417f7 <___bpf_prog_run+0x2fb7>	9417f3: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
2fb7   9417f7:	44 0f b6 30          	movzbl (%rax),%r14d
2fbb   9417fb:	8b 1a                	mov    (%rdx),%ebx
2fbd   9417fd:	45 89 f7             	mov    %r14d,%r15d
2fc0   941800:	41 83 e7 0f          	and    $0xf,%r15d
2fc4   941804:	44 89 ed             	mov    %r13d,%ebp
2fc7   941807:	83 e5 0f             	and    $0xf,%ebp
2fca   94180a:	4d 85 ff             	test   %r15,%r15
2fcd   94180d:	8b 44 24 04          	mov    0x4(%rsp),%eax
2fd1   941811:	0f 45 c3             	cmovne %ebx,%eax
2fd4   941814:	89 44 24 38          	mov    %eax,0x38(%rsp)
2fd8   941818:	4c 0b 7c 24 20       	or     0x20(%rsp),%r15
2fdd   94181d:	0f 85 c7 65 00 00    	jne    947dea <___bpf_prog_run+0x95aa>
2fe3   941823:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
2fe8   941828:	48 8d 3c e8          	lea    (%rax,%rbp,8),%rdi
2fec   94182c:	8b 2f                	mov    (%rdi),%ebp
2fee   94182e:	48 89 7c 24 18       	mov    %rdi,0x18(%rsp)
2ff3   941833:	e8 00 00 00 00       	call   941838 <___bpf_prog_run+0x2ff8>	941834: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
2ff8   941838:	44 8b 20             	mov    (%rax),%r12d
2ffb   94183b:	8b 02                	mov    (%rdx),%eax
2ffd   94183d:	89 44 24 08          	mov    %eax,0x8(%rsp)
3001   941841:	49 c1 ee 04          	shr    $0x4,%r14
3005   941845:	49 c1 ed 04          	shr    $0x4,%r13
3009   941849:	4d 85 f6             	test   %r14,%r14
300c   94184c:	0f 44 5c 24 04       	cmove  0x4(%rsp),%ebx
3011   941851:	4c 0b 74 24 20       	or     0x20(%rsp),%r14
3016   941856:	0f 85 9c 65 00 00    	jne    947df8 <___bpf_prog_run+0x95b8>
301c   94185c:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
3021   941861:	4a 8d 3c e8          	lea    (%rax,%r13,8),%rdi
3025   941865:	8b 1f                	mov    (%rdi),%ebx
3027   941867:	e8 00 00 00 00       	call   94186c <___bpf_prog_run+0x302c>	941868: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
302c   94186c:	89 de                	mov    %ebx,%esi
302e   94186e:	48 8b 08             	mov    (%rax),%rcx
3031   941871:	44 89 e0             	mov    %r12d,%eax
3034   941874:	21 d8                	and    %ebx,%eax
3036   941876:	48 89 eb             	mov    %rbp,%rbx
3039   941879:	41 09 ec             	or     %ebp,%r12d
303c   94187c:	89 cd                	mov    %ecx,%ebp
303e   94187e:	44 21 e5             	and    %r12d,%ebp
3041   941881:	48 85 c9             	test   %rcx,%rcx
3044   941884:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
3049   941889:	74 06                	je     941891 <___bpf_prog_run+0x3051>
304b   94188b:	8b 0a                	mov    (%rdx),%ecx
304d   94188d:	89 4c 24 08          	mov    %ecx,0x8(%rsp)
3051   941891:	09 c5                	or     %eax,%ebp
3053   941893:	4d 85 ff             	test   %r15,%r15
3056   941896:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
305b   94189b:	0f 85 63 65 00 00    	jne    947e04 <___bpf_prog_run+0x95c4>
3061   9418a1:	21 f3                	and    %esi,%ebx
3063   9418a3:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
3068   9418a8:	4c 89 e7             	mov    %r12,%rdi
306b   9418ab:	e8 00 00 00 00       	call   9418b0 <___bpf_prog_run+0x3070>	9418ac: R_X86_64_PLT32	__msan_metadata_ptr_for_store_8-0x4
3070   9418b0:	48 89 28             	mov    %rbp,(%rax)
3073   9418b3:	48 85 ed             	test   %rbp,%rbp
3076   9418b6:	0f 85 5c 65 00 00    	jne    947e18 <___bpf_prog_run+0x95d8>
307c   9418bc:	49 89 1c 24          	mov    %rbx,(%r12)
3080   9418c0:	49 83 c5 08          	add    $0x8,%r13
3084   9418c4:	e9 36 d0 ff ff       	jmp    93e8ff <___bpf_prog_run+0xbf>
3089   9418c9:	49 8d 5d 01          	lea    0x1(%r13),%rbx
308d   9418cd:	4d 85 f6             	test   %r14,%r14
3090   9418d0:	0f 85 62 65 00 00    	jne    947e38 <___bpf_prog_run+0x95f8>
3096   9418d6:	44 0f b6 23          	movzbl (%rbx),%r12d
309a   9418da:	48 89 df             	mov    %rbx,%rdi
309d   9418dd:	e8 00 00 00 00       	call   9418e2 <___bpf_prog_run+0x30a2>	9418de: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
30a2   9418e2:	0f b6 28             	movzbl (%rax),%ebp
30a5   9418e5:	8b 02                	mov    (%rdx),%eax
30a7   9418e7:	83 e5 0f             	and    $0xf,%ebp
30aa   9418ea:	41 83 e4 0f          	and    $0xf,%r12d
30ae   9418ee:	48 85 ed             	test   %rbp,%rbp
30b1   9418f1:	8b 7c 24 04          	mov    0x4(%rsp),%edi
30b5   9418f5:	89 44 24 38          	mov    %eax,0x38(%rsp)
30b9   9418f9:	0f 45 f8             	cmovne %eax,%edi
30bc   9418fc:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
30c1   941901:	48 09 e8             	or     %rbp,%rax
30c4   941904:	0f 85 3b 65 00 00    	jne    947e45 <___bpf_prog_run+0x9605>
30ca   94190a:	48 89 5c 24 40       	mov    %rbx,0x40(%rsp)
30cf   94190f:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
30d4   941914:	4a 8d 3c e0          	lea    (%rax,%r12,8),%rdi
30d8   941918:	48 8b 07             	mov    (%rdi),%rax
30db   94191b:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
30e0   941920:	e8 00 00 00 00       	call   941925 <___bpf_prog_run+0x30e5>	941921: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
30e5   941925:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
30ea   94192a:	4d 8d 75 04          	lea    0x4(%r13),%r14
30ee   94192e:	4c 8b 38             	mov    (%rax),%r15
30f1   941931:	8b 02                	mov    (%rdx),%eax
30f3   941933:	89 44 24 18          	mov    %eax,0x18(%rsp)
30f7   941937:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
30fd   94193d:	0f 85 0c 65 00 00    	jne    947e4f <___bpf_prog_run+0x960f>
3103   941943:	41 8b 1e             	mov    (%r14),%ebx
3106   941946:	4c 89 f7             	mov    %r14,%rdi
3109   941949:	e8 00 00 00 00       	call   94194e <___bpf_prog_run+0x310e>	94194a: R_X86_64_PLT32	__msan_metadata_ptr_for_load_4-0x4
310e   94194e:	44 8b 28             	mov    (%rax),%r13d
3111   941951:	44 8b 32             	mov    (%rdx),%r14d
3114   941954:	48 83 fb 3f          	cmp    $0x3f,%rbx
3118   941958:	0f 87 ef 7f 00 00    	ja     94994d <___bpf_prog_run+0xb10d>
311e   94195e:	e8 00 00 00 00       	call   941963 <___bpf_prog_run+0x3123>	94195f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3123   941963:	31 c0                	xor    %eax,%eax
3125   941965:	4d 85 ed             	test   %r13,%r13
3128   941968:	0f 95 c0             	setne  %al
312b   94196b:	8b 4c 24 18          	mov    0x18(%rsp),%ecx
312f   94196f:	41 0f 45 ce          	cmovne %r14d,%ecx
3133   941973:	89 4c 24 18          	mov    %ecx,0x18(%rsp)
3137   941977:	48 f7 d8             	neg    %rax
313a   94197a:	89 d9                	mov    %ebx,%ecx
313c   94197c:	49 d3 e7             	shl    %cl,%r15
313f   94197f:	49 09 c7             	or     %rax,%r15
3142   941982:	48 d3 64 24 08       	shlq   %cl,0x8(%rsp)
3147   941987:	48 85 ed             	test   %rbp,%rbp
314a   94198a:	8b 7c 24 38          	mov    0x38(%rsp),%edi
314e   94198e:	0f 44 7c 24 04       	cmove  0x4(%rsp),%edi
3153   941993:	48 0b 6c 24 20       	or     0x20(%rsp),%rbp
3158   941998:	0f 84 21 2d 00 00    	je     9446bf <___bpf_prog_run+0x5e7f>
315e   94199e:	e8 00 00 00 00       	call   9419a3 <___bpf_prog_run+0x3163>	94199f: R_X86_64_PLT32	__msan_warning-0x4
3163   9419a3:	e9 17 2d 00 00       	jmp    9446bf <___bpf_prog_run+0x5e7f>
3168   9419a8:	e8 00 00 00 00       	call   9419ad <___bpf_prog_run+0x316d>	9419a9: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
316d   9419ad:	49 8d 5d 01          	lea    0x1(%r13),%rbx
3171   9419b1:	4d 85 f6             	test   %r14,%r14
3174   9419b4:	0f 85 a2 64 00 00    	jne    947e5c <___bpf_prog_run+0x961c>
317a   9419ba:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
317f   9419bf:	44 0f b6 33          	movzbl (%rbx),%r14d
3183   9419c3:	48 89 df             	mov    %rbx,%rdi
3186   9419c6:	e8 00 00 00 00       	call   9419cb <___bpf_prog_run+0x318b>	9419c7: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
318b   9419cb:	0f b6 18             	movzbl (%rax),%ebx
318e   9419ce:	44 8b 22             	mov    (%rdx),%r12d
3191   9419d1:	48 89 d8             	mov    %rbx,%rax
3194   9419d4:	48 c1 e8 04          	shr    $0x4,%rax
3198   9419d8:	4c 89 f5             	mov    %r14,%rbp
319b   9419db:	48 c1 ed 04          	shr    $0x4,%rbp
319f   9419df:	48 85 c0             	test   %rax,%rax
31a2   9419e2:	44 8b 7c 24 04       	mov    0x4(%rsp),%r15d
31a7   9419e7:	44 89 ff             	mov    %r15d,%edi
31aa   9419ea:	41 0f 45 fc          	cmovne %r12d,%edi
31ae   9419ee:	48 0b 44 24 20       	or     0x20(%rsp),%rax
31b3   9419f3:	0f 85 70 64 00 00    	jne    947e69 <___bpf_prog_run+0x9629>
31b9   9419f9:	4c 8b 6c 24 30       	mov    0x30(%rsp),%r13
31be   9419fe:	48 8d 3c ed 00 00 00 00 	lea    0x0(,%rbp,8),%rdi
31c6   941a06:	4c 01 ef             	add    %r13,%rdi
31c9   941a09:	8b 07                	mov    (%rdi),%eax
31cb   941a0b:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
31d0   941a10:	e8 00 00 00 00       	call   941a15 <___bpf_prog_run+0x31d5>	941a11: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
31d5   941a15:	4c 89 ed             	mov    %r13,%rbp
31d8   941a18:	44 8b 28             	mov    (%rax),%r13d
31db   941a1b:	8b 02                	mov    (%rdx),%eax
31dd   941a1d:	89 44 24 08          	mov    %eax,0x8(%rsp)
31e1   941a21:	83 e3 0f             	and    $0xf,%ebx
31e4   941a24:	41 83 e6 0f          	and    $0xf,%r14d
31e8   941a28:	48 85 db             	test   %rbx,%rbx
31eb   941a2b:	45 0f 44 e7          	cmove  %r15d,%r12d
31ef   941a2f:	48 0b 5c 24 20       	or     0x20(%rsp),%rbx
31f4   941a34:	0f 85 39 64 00 00    	jne    947e73 <___bpf_prog_run+0x9633>
31fa   941a3a:	4a 8d 1c f5 00 00 00 00 	lea    0x0(,%r14,8),%rbx
3202   941a42:	48 01 eb             	add    %rbp,%rbx
3205   941a45:	48 89 df             	mov    %rbx,%rdi
3208   941a48:	e8 00 00 00 00       	call   941a4d <___bpf_prog_run+0x320d>	941a49: R_X86_64_PLT32	__msan_metadata_ptr_for_store_8-0x4
320d   941a4d:	4c 89 28             	mov    %r13,(%rax)
3210   941a50:	4d 85 ed             	test   %r13,%r13
3213   941a53:	0f 85 fd 56 00 00    	jne    947156 <___bpf_prog_run+0x8916>
3219   941a59:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
321e   941a5e:	48 89 03             	mov    %rax,(%rbx)
3221   941a61:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
3226   941a66:	e9 8b ce ff ff       	jmp    93e8f6 <___bpf_prog_run+0xb6>
322b   941a6b:	e8 00 00 00 00       	call   941a70 <___bpf_prog_run+0x3230>	941a6c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3230   941a70:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
3235   941a75:	49 8d 5d 01          	lea    0x1(%r13),%rbx
3239   941a79:	4d 85 f6             	test   %r14,%r14
323c   941a7c:	0f 85 fe 63 00 00    	jne    947e80 <___bpf_prog_run+0x9640>
3242   941a82:	44 0f b6 2b          	movzbl (%rbx),%r13d
3246   941a86:	48 89 df             	mov    %rbx,%rdi
3249   941a89:	e8 00 00 00 00       	call   941a8e <___bpf_prog_run+0x324e>	941a8a: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
324e   941a8e:	44 0f b6 30          	movzbl (%rax),%r14d
3252   941a92:	44 8b 22             	mov    (%rdx),%r12d
3255   941a95:	45 89 f7             	mov    %r14d,%r15d
3258   941a98:	41 83 e7 0f          	and    $0xf,%r15d
325c   941a9c:	44 89 ed             	mov    %r13d,%ebp
325f   941a9f:	83 e5 0f             	and    $0xf,%ebp
3262   941aa2:	4d 85 ff             	test   %r15,%r15
3265   941aa5:	8b 5c 24 04          	mov    0x4(%rsp),%ebx
3269   941aa9:	41 0f 45 dc          	cmovne %r12d,%ebx
326d   941aad:	4c 0b 7c 24 20       	or     0x20(%rsp),%r15
3272   941ab2:	0f 85 d5 63 00 00    	jne    947e8d <___bpf_prog_run+0x964d>
3278   941ab8:	89 5c 24 40          	mov    %ebx,0x40(%rsp)
327c   941abc:	48 8b 5c 24 30       	mov    0x30(%rsp),%rbx
3281   941ac1:	48 8d 3c eb          	lea    (%rbx,%rbp,8),%rdi
3285   941ac5:	48 8b 2f             	mov    (%rdi),%rbp
3288   941ac8:	48 89 7c 24 18       	mov    %rdi,0x18(%rsp)
328d   941acd:	e8 00 00 00 00       	call   941ad2 <___bpf_prog_run+0x3292>	941ace: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
3292   941ad2:	48 8b 00             	mov    (%rax),%rax
3295   941ad5:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
329a   941ada:	8b 02                	mov    (%rdx),%eax
329c   941adc:	89 44 24 38          	mov    %eax,0x38(%rsp)
32a0   941ae0:	49 c1 ee 04          	shr    $0x4,%r14
32a4   941ae4:	49 c1 ed 04          	shr    $0x4,%r13
32a8   941ae8:	4d 85 f6             	test   %r14,%r14
32ab   941aeb:	44 0f 44 64 24 04    	cmove  0x4(%rsp),%r12d
32b1   941af1:	4c 0b 74 24 20       	or     0x20(%rsp),%r14
32b6   941af6:	0f 85 9d 63 00 00    	jne    947e99 <___bpf_prog_run+0x9659>
32bc   941afc:	4a 8d 3c eb          	lea    (%rbx,%r13,8),%rdi
32c0   941b00:	03 2f                	add    (%rdi),%ebp
32c2   941b02:	e8 00 00 00 00       	call   941b07 <___bpf_prog_run+0x32c7>	941b03: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
32c7   941b07:	8b 18                	mov    (%rax),%ebx
32c9   941b09:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
32ce   941b0e:	09 c3                	or     %eax,%ebx
32d0   941b10:	48 85 c0             	test   %rax,%rax
32d3   941b13:	75 06                	jne    941b1b <___bpf_prog_run+0x32db>
32d5   941b15:	8b 02                	mov    (%rdx),%eax
32d7   941b17:	89 44 24 38          	mov    %eax,0x38(%rsp)
32db   941b1b:	49 89 ec             	mov    %rbp,%r12
32de   941b1e:	4d 85 ff             	test   %r15,%r15
32e1   941b21:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
32e6   941b26:	0f 84 f2 25 00 00    	je     94411e <___bpf_prog_run+0x58de>
32ec   941b2c:	8b 7c 24 40          	mov    0x40(%rsp),%edi
32f0   941b30:	e8 00 00 00 00       	call   941b35 <___bpf_prog_run+0x32f5>	941b31: R_X86_64_PLT32	__msan_warning-0x4
32f5   941b35:	e9 e4 25 00 00       	jmp    94411e <___bpf_prog_run+0x58de>
32fa   941b3a:	49 8d 5d 04          	lea    0x4(%r13),%rbx
32fe   941b3e:	4d 85 f6             	test   %r14,%r14
3301   941b41:	0f 85 5f 63 00 00    	jne    947ea6 <___bpf_prog_run+0x9666>
3307   941b47:	44 8b 33             	mov    (%rbx),%r14d
330a   941b4a:	48 89 df             	mov    %rbx,%rdi
330d   941b4d:	e8 00 00 00 00       	call   941b52 <___bpf_prog_run+0x3312>	941b4e: R_X86_64_PLT32	__msan_metadata_ptr_for_load_4-0x4
3312   941b52:	83 38 00             	cmpl   $0x0,(%rax)
3315   941b55:	0f 85 58 63 00 00    	jne    947eb3 <___bpf_prog_run+0x9673>
331b   941b5b:	41 81 fe 9f 00 00 00 	cmp    $0x9f,%r14d
3322   941b62:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
3327   941b67:	0f 8f f3 37 00 00    	jg     945360 <___bpf_prog_run+0x6b20>
332d   941b6d:	41 8d 46 c0          	lea    -0x40(%r14),%eax
3331   941b71:	83 f8 11             	cmp    $0x11,%eax
3334   941b74:	0f 87 f4 3a 00 00    	ja     94566e <___bpf_prog_run+0x6e2e>
333a   941b7a:	ff 24 c5 00 00 00 00 	jmp    *0x0(,%rax,8)	941b7d: R_X86_64_32S	.rodata+0x364a8
3341   941b81:	41 80 e7 18          	and    $0x18,%r15b
3345   941b85:	89 e8                	mov    %ebp,%eax
3347   941b87:	f6 d0                	not    %al
3349   941b89:	44 84 f8             	test   %r15b,%al
334c   941b8c:	41 0f 94 c6          	sete   %r14b
3350   941b90:	40 f6 c5 18          	test   $0x18,%bpl
3354   941b94:	4c 89 e8             	mov    %r13,%rax
3357   941b97:	41 0f 95 c5          	setne  %r13b
335b   941b9b:	48 8d 58 01          	lea    0x1(%rax),%rbx
335f   941b9f:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
3365   941ba5:	0f 85 d7 74 00 00    	jne    949082 <___bpf_prog_run+0xa842>
336b   941bab:	45 20 f5             	and    %r14b,%r13b
336e   941bae:	44 0f b6 33          	movzbl (%rbx),%r14d
3372   941bb2:	48 89 df             	mov    %rbx,%rdi
3375   941bb5:	e8 00 00 00 00       	call   941bba <___bpf_prog_run+0x337a>	941bb6: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
337a   941bba:	0f b6 18             	movzbl (%rax),%ebx
337d   941bbd:	8b 2a                	mov    (%rdx),%ebp
337f   941bbf:	48 89 d8             	mov    %rbx,%rax
3382   941bc2:	48 c1 e8 04          	shr    $0x4,%rax
3386   941bc6:	4c 89 74 24 38       	mov    %r14,0x38(%rsp)
338b   941bcb:	49 c1 ee 04          	shr    $0x4,%r14
338f   941bcf:	48 85 c0             	test   %rax,%rax
3392   941bd2:	8b 7c 24 04          	mov    0x4(%rsp),%edi
3396   941bd6:	0f 45 fd             	cmovne %ebp,%edi
3399   941bd9:	48 0b 44 24 20       	or     0x20(%rsp),%rax
339e   941bde:	0f 85 ab 74 00 00    	jne    94908f <___bpf_prog_run+0xa84f>
33a4   941be4:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
33a9   941be9:	4a 8d 3c f0          	lea    (%rax,%r14,8),%rdi
33ad   941bed:	4c 8b 37             	mov    (%rdi),%r14
33b0   941bf0:	e8 00 00 00 00       	call   941bf5 <___bpf_prog_run+0x33b5>	941bf1: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
33b5   941bf5:	48 8b 00             	mov    (%rax),%rax
33b8   941bf8:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
33bd   941bfd:	8b 02                	mov    (%rdx),%eax
33bf   941bff:	89 44 24 40          	mov    %eax,0x40(%rsp)
33c3   941c03:	45 84 ed             	test   %r13b,%r13b
33c6   941c06:	0f 85 8d 74 00 00    	jne    949099 <___bpf_prog_run+0xa859>
33cc   941c0c:	45 84 ff             	test   %r15b,%r15b
33cf   941c0f:	4c 8b 7c 24 20       	mov    0x20(%rsp),%r15
33d4   941c14:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
33d9   941c19:	4c 89 74 24 18       	mov    %r14,0x18(%rsp)
33de   941c1e:	0f 84 f1 4c 00 00    	je     946915 <___bpf_prog_run+0x80d5>
33e4   941c24:	e8 00 00 00 00       	call   941c29 <___bpf_prog_run+0x33e9>	941c25: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
33e9   941c29:	89 d8                	mov    %ebx,%eax
33eb   941c2b:	83 e0 0f             	and    $0xf,%eax
33ee   941c2e:	89 ef                	mov    %ebp,%edi
33f0   941c30:	48 8b 6c 24 38       	mov    0x38(%rsp),%rbp
33f5   941c35:	83 e5 0f             	and    $0xf,%ebp
33f8   941c38:	f6 c3 0f             	test   $0xf,%bl
33fb   941c3b:	0f 44 7c 24 04       	cmove  0x4(%rsp),%edi
3400   941c40:	4c 09 f8             	or     %r15,%rax
3403   941c43:	48 8b 5c 24 30       	mov    0x30(%rsp),%rbx
3408   941c48:	0f 85 c9 76 00 00    	jne    949317 <___bpf_prog_run+0xaad7>
340e   941c4e:	48 8d 3c eb          	lea    (%rbx,%rbp,8),%rdi
3412   941c52:	4c 8b 37             	mov    (%rdi),%r14
3415   941c55:	e8 00 00 00 00       	call   941c5a <___bpf_prog_run+0x341a>	941c56: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
341a   941c5a:	49 8d 5d 02          	lea    0x2(%r13),%rbx
341e   941c5e:	48 8b 28             	mov    (%rax),%rbp
3421   941c61:	44 8b 3a             	mov    (%rdx),%r15d
3424   941c64:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
342a   941c6a:	0f 85 b1 76 00 00    	jne    949321 <___bpf_prog_run+0xaae1>
3430   941c70:	4c 0f bf 23          	movswq (%rbx),%r12
3434   941c74:	48 89 df             	mov    %rbx,%rdi
3437   941c77:	e8 00 00 00 00       	call   941c7c <___bpf_prog_run+0x343c>	941c78: R_X86_64_PLT32	__msan_metadata_ptr_for_load_2-0x4
343c   941c7c:	48 0f bf 00          	movswq (%rax),%rax
3440   941c80:	48 85 c0             	test   %rax,%rax
3443   941c83:	74 03                	je     941c88 <___bpf_prog_run+0x3448>
3445   941c85:	44 8b 3a             	mov    (%rdx),%r15d
3448   941c88:	48 09 c5             	or     %rax,%rbp
344b   941c8b:	4d 01 e6             	add    %r12,%r14
344e   941c8e:	be 08 00 00 00       	mov    $0x8,%esi
3453   941c93:	4c 89 f7             	mov    %r14,%rdi
3456   941c96:	e8 00 00 00 00       	call   941c9b <___bpf_prog_run+0x345b>	941c97: R_X86_64_PLT32	__msan_instrument_asm_store-0x4
345b   941c9b:	48 83 7c 24 08 00    	cmpq   $0x0,0x8(%rsp)
3461   941ca1:	0f 85 87 76 00 00    	jne    94932e <___bpf_prog_run+0xaaee>
3467   941ca7:	48 85 ed             	test   %rbp,%rbp
346a   941caa:	0f 85 90 76 00 00    	jne    949340 <___bpf_prog_run+0xab00>
3470   941cb0:	48 85 ed             	test   %rbp,%rbp
3473   941cb3:	0f 85 98 76 00 00    	jne    949351 <___bpf_prog_run+0xab11>
3479   941cb9:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
347e   941cbe:	f0 49 09 06          	lock or %rax,(%r14)
3482   941cc2:	e9 2f cc ff ff       	jmp    93e8f6 <___bpf_prog_run+0xb6>
3487   941cc7:	e8 00 00 00 00       	call   941ccc <___bpf_prog_run+0x348c>	941cc8: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
348c   941ccc:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
3491   941cd1:	49 8d 5d 01          	lea    0x1(%r13),%rbx
3495   941cd5:	4d 85 f6             	test   %r14,%r14
3498   941cd8:	0f 85 e1 61 00 00    	jne    947ebf <___bpf_prog_run+0x967f>
349e   941cde:	44 0f b6 2b          	movzbl (%rbx),%r13d
34a2   941ce2:	48 89 df             	mov    %rbx,%rdi
34a5   941ce5:	e8 00 00 00 00       	call   941cea <___bpf_prog_run+0x34aa>	941ce6: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
34aa   941cea:	44 0f b6 30          	movzbl (%rax),%r14d
34ae   941cee:	44 8b 22             	mov    (%rdx),%r12d
34b1   941cf1:	45 89 f7             	mov    %r14d,%r15d
34b4   941cf4:	41 83 e7 0f          	and    $0xf,%r15d
34b8   941cf8:	44 89 ed             	mov    %r13d,%ebp
34bb   941cfb:	83 e5 0f             	and    $0xf,%ebp
34be   941cfe:	4d 85 ff             	test   %r15,%r15
34c1   941d01:	8b 5c 24 04          	mov    0x4(%rsp),%ebx
34c5   941d05:	41 0f 45 dc          	cmovne %r12d,%ebx
34c9   941d09:	4c 0b 7c 24 20       	or     0x20(%rsp),%r15
34ce   941d0e:	0f 85 b8 61 00 00    	jne    947ecc <___bpf_prog_run+0x968c>
34d4   941d14:	89 5c 24 40          	mov    %ebx,0x40(%rsp)
34d8   941d18:	48 8b 5c 24 30       	mov    0x30(%rsp),%rbx
34dd   941d1d:	48 8d 3c eb          	lea    (%rbx,%rbp,8),%rdi
34e1   941d21:	48 8b 2f             	mov    (%rdi),%rbp
34e4   941d24:	48 89 7c 24 18       	mov    %rdi,0x18(%rsp)
34e9   941d29:	e8 00 00 00 00       	call   941d2e <___bpf_prog_run+0x34ee>	941d2a: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
34ee   941d2e:	48 8b 00             	mov    (%rax),%rax
34f1   941d31:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
34f6   941d36:	8b 02                	mov    (%rdx),%eax
34f8   941d38:	89 44 24 38          	mov    %eax,0x38(%rsp)
34fc   941d3c:	49 c1 ee 04          	shr    $0x4,%r14
3500   941d40:	49 c1 ed 04          	shr    $0x4,%r13
3504   941d44:	4d 85 f6             	test   %r14,%r14
3507   941d47:	44 0f 44 64 24 04    	cmove  0x4(%rsp),%r12d
350d   941d4d:	4c 0b 74 24 20       	or     0x20(%rsp),%r14
3512   941d52:	0f 85 80 61 00 00    	jne    947ed8 <___bpf_prog_run+0x9698>
3518   941d58:	4a 8d 3c eb          	lea    (%rbx,%r13,8),%rdi
351c   941d5c:	33 2f                	xor    (%rdi),%ebp
351e   941d5e:	e8 00 00 00 00       	call   941d63 <___bpf_prog_run+0x3523>	941d5f: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
3523   941d63:	8b 18                	mov    (%rax),%ebx
3525   941d65:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
352a   941d6a:	09 c3                	or     %eax,%ebx
352c   941d6c:	48 85 c0             	test   %rax,%rax
352f   941d6f:	75 06                	jne    941d77 <___bpf_prog_run+0x3537>
3531   941d71:	8b 02                	mov    (%rdx),%eax
3533   941d73:	89 44 24 38          	mov    %eax,0x38(%rsp)
3537   941d77:	49 89 ec             	mov    %rbp,%r12
353a   941d7a:	4d 85 ff             	test   %r15,%r15
353d   941d7d:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
3542   941d82:	0f 84 96 23 00 00    	je     94411e <___bpf_prog_run+0x58de>
3548   941d88:	8b 7c 24 40          	mov    0x40(%rsp),%edi
354c   941d8c:	e8 00 00 00 00       	call   941d91 <___bpf_prog_run+0x3551>	941d8d: R_X86_64_PLT32	__msan_warning-0x4
3551   941d91:	e9 88 23 00 00       	jmp    94411e <___bpf_prog_run+0x58de>
3556   941d96:	e8 00 00 00 00       	call   941d9b <___bpf_prog_run+0x355b>	941d97: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
355b   941d9b:	49 8d 5d 01          	lea    0x1(%r13),%rbx
355f   941d9f:	4d 85 f6             	test   %r14,%r14
3562   941da2:	0f 85 3d 61 00 00    	jne    947ee5 <___bpf_prog_run+0x96a5>
3568   941da8:	0f b6 2b             	movzbl (%rbx),%ebp
356b   941dab:	48 89 df             	mov    %rbx,%rdi
356e   941dae:	e8 00 00 00 00       	call   941db3 <___bpf_prog_run+0x3573>	941daf: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
3573   941db3:	44 0f b6 30          	movzbl (%rax),%r14d
3577   941db7:	41 83 e6 0f          	and    $0xf,%r14d
357b   941dbb:	8b 5c 24 04          	mov    0x4(%rsp),%ebx
357f   941dbf:	4d 85 f6             	test   %r14,%r14
3582   941dc2:	74 02                	je     941dc6 <___bpf_prog_run+0x3586>
3584   941dc4:	8b 1a                	mov    (%rdx),%ebx
3586   941dc6:	4d 89 ef             	mov    %r13,%r15
3589   941dc9:	83 e5 0f             	and    $0xf,%ebp
358c   941dcc:	4c 0b 74 24 20       	or     0x20(%rsp),%r14
3591   941dd1:	0f 85 1b 61 00 00    	jne    947ef2 <___bpf_prog_run+0x96b2>
3597   941dd7:	89 5c 24 08          	mov    %ebx,0x8(%rsp)
359b   941ddb:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
35a0   941de0:	4c 8d 2c e8          	lea    (%rax,%rbp,8),%r13
35a4   941de4:	45 8b 65 00          	mov    0x0(%r13),%r12d
35a8   941de8:	4c 89 ef             	mov    %r13,%rdi
35ab   941deb:	e8 00 00 00 00       	call   941df0 <___bpf_prog_run+0x35b0>	941dec: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
35b0   941df0:	49 8d 6f 04          	lea    0x4(%r15),%rbp
35b4   941df4:	8b 18                	mov    (%rax),%ebx
35b6   941df6:	8b 02                	mov    (%rdx),%eax
35b8   941df8:	89 44 24 18          	mov    %eax,0x18(%rsp)
35bc   941dfc:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
35c2   941e02:	0f 85 f6 60 00 00    	jne    947efe <___bpf_prog_run+0x96be>
35c8   941e08:	44 03 65 00          	add    0x0(%rbp),%r12d
35cc   941e0c:	48 89 ef             	mov    %rbp,%rdi
35cf   941e0f:	e8 00 00 00 00       	call   941e14 <___bpf_prog_run+0x35d4>	941e10: R_X86_64_PLT32	__msan_metadata_ptr_for_load_4-0x4
35d4   941e14:	8b 28                	mov    (%rax),%ebp
35d6   941e16:	09 dd                	or     %ebx,%ebp
35d8   941e18:	85 db                	test   %ebx,%ebx
35da   941e1a:	75 06                	jne    941e22 <___bpf_prog_run+0x35e2>
35dc   941e1c:	8b 02                	mov    (%rdx),%eax
35de   941e1e:	89 44 24 18          	mov    %eax,0x18(%rsp)
35e2   941e22:	4d 85 f6             	test   %r14,%r14
35e5   941e25:	0f 84 6b 1c 00 00    	je     943a96 <___bpf_prog_run+0x5256>
35eb   941e2b:	8b 7c 24 08          	mov    0x8(%rsp),%edi
35ef   941e2f:	e8 00 00 00 00       	call   941e34 <___bpf_prog_run+0x35f4>	941e30: R_X86_64_PLT32	__msan_warning-0x4
35f4   941e34:	e9 5d 1c 00 00       	jmp    943a96 <___bpf_prog_run+0x5256>
35f9   941e39:	e8 00 00 00 00       	call   941e3e <___bpf_prog_run+0x35fe>	941e3a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
35fe   941e3e:	49 8d 5d 01          	lea    0x1(%r13),%rbx
3602   941e42:	4d 85 f6             	test   %r14,%r14
3605   941e45:	0f 85 c0 60 00 00    	jne    947f0b <___bpf_prog_run+0x96cb>
360b   941e4b:	0f b6 2b             	movzbl (%rbx),%ebp
360e   941e4e:	48 89 df             	mov    %rbx,%rdi
3611   941e51:	e8 00 00 00 00       	call   941e56 <___bpf_prog_run+0x3616>	941e52: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
3616   941e56:	44 0f b6 30          	movzbl (%rax),%r14d
361a   941e5a:	41 83 e6 0f          	and    $0xf,%r14d
361e   941e5e:	8b 5c 24 04          	mov    0x4(%rsp),%ebx
3622   941e62:	4d 85 f6             	test   %r14,%r14
3625   941e65:	74 02                	je     941e69 <___bpf_prog_run+0x3629>
3627   941e67:	8b 1a                	mov    (%rdx),%ebx
3629   941e69:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
362e   941e6e:	83 e5 0f             	and    $0xf,%ebp
3631   941e71:	4c 0b 74 24 20       	or     0x20(%rsp),%r14
3636   941e76:	0f 85 9c 60 00 00    	jne    947f18 <___bpf_prog_run+0x96d8>
363c   941e7c:	89 5c 24 08          	mov    %ebx,0x8(%rsp)
3640   941e80:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
3645   941e85:	4c 8d 2c e8          	lea    (%rax,%rbp,8),%r13
3649   941e89:	4d 8b 65 00          	mov    0x0(%r13),%r12
364d   941e8d:	4c 89 ef             	mov    %r13,%rdi
3650   941e90:	e8 00 00 00 00       	call   941e95 <___bpf_prog_run+0x3655>	941e91: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
3655   941e95:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
365a   941e9a:	48 8d 69 04          	lea    0x4(%rcx),%rbp
365e   941e9e:	48 8b 18             	mov    (%rax),%rbx
3661   941ea1:	8b 02                	mov    (%rdx),%eax
3663   941ea3:	89 44 24 18          	mov    %eax,0x18(%rsp)
3667   941ea7:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
366d   941ead:	0f 85 71 60 00 00    	jne    947f24 <___bpf_prog_run+0x96e4>
3673   941eb3:	4c 63 7d 00          	movslq 0x0(%rbp),%r15
3677   941eb7:	48 89 ef             	mov    %rbp,%rdi
367a   941eba:	e8 00 00 00 00       	call   941ebf <___bpf_prog_run+0x367f>	941ebb: R_X86_64_PLT32	__msan_metadata_ptr_for_load_4-0x4
367f   941ebf:	48 63 00             	movslq (%rax),%rax
3682   941ec2:	48 85 c0             	test   %rax,%rax
3685   941ec5:	74 06                	je     941ecd <___bpf_prog_run+0x368d>
3687   941ec7:	8b 0a                	mov    (%rdx),%ecx
3689   941ec9:	89 4c 24 18          	mov    %ecx,0x18(%rsp)
368d   941ecd:	48 09 c3             	or     %rax,%rbx
3690   941ed0:	4d 85 f6             	test   %r14,%r14
3693   941ed3:	0f 85 58 60 00 00    	jne    947f31 <___bpf_prog_run+0x96f1>
3699   941ed9:	4d 29 fc             	sub    %r15,%r12
369c   941edc:	e9 1a 1e 00 00       	jmp    943cfb <___bpf_prog_run+0x54bb>
36a1   941ee1:	e8 00 00 00 00       	call   941ee6 <___bpf_prog_run+0x36a6>	941ee2: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
36a6   941ee6:	49 8d 5d 01          	lea    0x1(%r13),%rbx
36aa   941eea:	4d 85 f6             	test   %r14,%r14
36ad   941eed:	0f 85 4c 60 00 00    	jne    947f3f <___bpf_prog_run+0x96ff>
36b3   941ef3:	0f b6 2b             	movzbl (%rbx),%ebp
36b6   941ef6:	48 89 df             	mov    %rbx,%rdi
36b9   941ef9:	e8 00 00 00 00       	call   941efe <___bpf_prog_run+0x36be>	941efa: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
36be   941efe:	44 0f b6 30          	movzbl (%rax),%r14d
36c2   941f02:	41 83 e6 0f          	and    $0xf,%r14d
36c6   941f06:	8b 5c 24 04          	mov    0x4(%rsp),%ebx
36ca   941f0a:	4d 85 f6             	test   %r14,%r14
36cd   941f0d:	74 02                	je     941f11 <___bpf_prog_run+0x36d1>
36cf   941f0f:	8b 1a                	mov    (%rdx),%ebx
36d1   941f11:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
36d6   941f16:	83 e5 0f             	and    $0xf,%ebp
36d9   941f19:	4c 0b 74 24 20       	or     0x20(%rsp),%r14
36de   941f1e:	0f 85 28 60 00 00    	jne    947f4c <___bpf_prog_run+0x970c>
36e4   941f24:	89 5c 24 08          	mov    %ebx,0x8(%rsp)
36e8   941f28:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
36ed   941f2d:	4c 8d 2c e8          	lea    (%rax,%rbp,8),%r13
36f1   941f31:	4d 8b 65 00          	mov    0x0(%r13),%r12
36f5   941f35:	4c 89 ef             	mov    %r13,%rdi
36f8   941f38:	e8 00 00 00 00       	call   941f3d <___bpf_prog_run+0x36fd>	941f39: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
36fd   941f3d:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
3702   941f42:	48 8d 69 04          	lea    0x4(%rcx),%rbp
3706   941f46:	48 8b 18             	mov    (%rax),%rbx
3709   941f49:	8b 02                	mov    (%rdx),%eax
370b   941f4b:	89 44 24 18          	mov    %eax,0x18(%rsp)
370f   941f4f:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
3715   941f55:	0f 85 fd 5f 00 00    	jne    947f58 <___bpf_prog_run+0x9718>
371b   941f5b:	4c 63 7d 00          	movslq 0x0(%rbp),%r15
371f   941f5f:	48 89 ef             	mov    %rbp,%rdi
3722   941f62:	e8 00 00 00 00       	call   941f67 <___bpf_prog_run+0x3727>	941f63: R_X86_64_PLT32	__msan_metadata_ptr_for_load_4-0x4
3727   941f67:	48 63 00             	movslq (%rax),%rax
372a   941f6a:	48 85 c0             	test   %rax,%rax
372d   941f6d:	74 06                	je     941f75 <___bpf_prog_run+0x3735>
372f   941f6f:	8b 0a                	mov    (%rdx),%ecx
3731   941f71:	89 4c 24 18          	mov    %ecx,0x18(%rsp)
3735   941f75:	48 09 c3             	or     %rax,%rbx
3738   941f78:	4d 85 f6             	test   %r14,%r14
373b   941f7b:	0f 85 e4 5f 00 00    	jne    947f65 <___bpf_prog_run+0x9725>
3741   941f81:	4d 01 fc             	add    %r15,%r12
3744   941f84:	e9 72 1d 00 00       	jmp    943cfb <___bpf_prog_run+0x54bb>
3749   941f89:	e8 00 00 00 00       	call   941f8e <___bpf_prog_run+0x374e>	941f8a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
374e   941f8e:	49 8d 5d 01          	lea    0x1(%r13),%rbx
3752   941f92:	4d 85 f6             	test   %r14,%r14
3755   941f95:	0f 85 d8 5f 00 00    	jne    947f73 <___bpf_prog_run+0x9733>
375b   941f9b:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
3760   941fa0:	44 0f b6 2b          	movzbl (%rbx),%r13d
3764   941fa4:	48 89 df             	mov    %rbx,%rdi
3767   941fa7:	e8 00 00 00 00       	call   941fac <___bpf_prog_run+0x376c>	941fa8: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
376c   941fac:	44 0f b6 30          	movzbl (%rax),%r14d
3770   941fb0:	44 8b 22             	mov    (%rdx),%r12d
3773   941fb3:	45 89 f7             	mov    %r14d,%r15d
3776   941fb6:	41 83 e7 0f          	and    $0xf,%r15d
377a   941fba:	44 89 ed             	mov    %r13d,%ebp
377d   941fbd:	83 e5 0f             	and    $0xf,%ebp
3780   941fc0:	4d 85 ff             	test   %r15,%r15
3783   941fc3:	8b 5c 24 04          	mov    0x4(%rsp),%ebx
3787   941fc7:	41 0f 45 dc          	cmovne %r12d,%ebx
378b   941fcb:	4c 0b 7c 24 20       	or     0x20(%rsp),%r15
3790   941fd0:	0f 85 aa 5f 00 00    	jne    947f80 <___bpf_prog_run+0x9740>
3796   941fd6:	89 5c 24 40          	mov    %ebx,0x40(%rsp)
379a   941fda:	48 8b 5c 24 30       	mov    0x30(%rsp),%rbx
379f   941fdf:	48 8d 3c eb          	lea    (%rbx,%rbp,8),%rdi
37a3   941fe3:	48 8b 2f             	mov    (%rdi),%rbp
37a6   941fe6:	48 89 7c 24 18       	mov    %rdi,0x18(%rsp)
37ab   941feb:	e8 00 00 00 00       	call   941ff0 <___bpf_prog_run+0x37b0>	941fec: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
37b0   941ff0:	48 8b 00             	mov    (%rax),%rax
37b3   941ff3:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
37b8   941ff8:	8b 02                	mov    (%rdx),%eax
37ba   941ffa:	89 44 24 38          	mov    %eax,0x38(%rsp)
37be   941ffe:	49 c1 ee 04          	shr    $0x4,%r14
37c2   942002:	49 c1 ed 04          	shr    $0x4,%r13
37c6   942006:	4d 85 f6             	test   %r14,%r14
37c9   942009:	44 0f 44 64 24 04    	cmove  0x4(%rsp),%r12d
37cf   94200f:	4c 0b 74 24 20       	or     0x20(%rsp),%r14
37d4   942014:	0f 85 72 5f 00 00    	jne    947f8c <___bpf_prog_run+0x974c>
37da   94201a:	4a 8d 3c eb          	lea    (%rbx,%r13,8),%rdi
37de   94201e:	48 03 2f             	add    (%rdi),%rbp
37e1   942021:	e8 00 00 00 00       	call   942026 <___bpf_prog_run+0x37e6>	942022: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
37e6   942026:	48 8b 18             	mov    (%rax),%rbx
37e9   942029:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
37ee   94202e:	48 09 c3             	or     %rax,%rbx
37f1   942031:	48 85 c0             	test   %rax,%rax
37f4   942034:	49 89 ec             	mov    %rbp,%r12
37f7   942037:	75 06                	jne    94203f <___bpf_prog_run+0x37ff>
37f9   942039:	8b 02                	mov    (%rdx),%eax
37fb   94203b:	89 44 24 38          	mov    %eax,0x38(%rsp)
37ff   94203f:	4d 85 ff             	test   %r15,%r15
3802   942042:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
3807   942047:	0f 84 d1 20 00 00    	je     94411e <___bpf_prog_run+0x58de>
380d   94204d:	8b 7c 24 40          	mov    0x40(%rsp),%edi
3811   942051:	e8 00 00 00 00       	call   942056 <___bpf_prog_run+0x3816>	942052: R_X86_64_PLT32	__msan_warning-0x4
3816   942056:	e9 c3 20 00 00       	jmp    94411e <___bpf_prog_run+0x58de>
381b   94205b:	e8 00 00 00 00       	call   942060 <___bpf_prog_run+0x3820>	94205c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3820   942060:	49 8d 5d 02          	lea    0x2(%r13),%rbx
3824   942064:	4d 85 f6             	test   %r14,%r14
3827   942067:	0f 84 4e 67 00 00    	je     9487bb <___bpf_prog_run+0x9f7b>
382d   94206d:	8b 3c 24             	mov    (%rsp),%edi
3830   942070:	e8 00 00 00 00       	call   942075 <___bpf_prog_run+0x3835>	942071: R_X86_64_PLT32	__msan_warning-0x4
3835   942075:	e9 41 67 00 00       	jmp    9487bb <___bpf_prog_run+0x9f7b>
383a   94207a:	49 8d 5d 01          	lea    0x1(%r13),%rbx
383e   94207e:	4d 85 f6             	test   %r14,%r14
3841   942081:	0f 85 12 5f 00 00    	jne    947f99 <___bpf_prog_run+0x9759>
3847   942087:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
384c   94208c:	44 0f b6 33          	movzbl (%rbx),%r14d
3850   942090:	48 89 df             	mov    %rbx,%rdi
3853   942093:	e8 00 00 00 00       	call   942098 <___bpf_prog_run+0x3858>	942094: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
3858   942098:	0f b6 18             	movzbl (%rax),%ebx
385b   94209b:	44 8b 22             	mov    (%rdx),%r12d
385e   94209e:	89 d8                	mov    %ebx,%eax
3860   9420a0:	83 e0 0f             	and    $0xf,%eax
3863   9420a3:	44 89 f5             	mov    %r14d,%ebp
3866   9420a6:	83 e5 0f             	and    $0xf,%ebp
3869   9420a9:	48 85 c0             	test   %rax,%rax
386c   9420ac:	44 8b 7c 24 04       	mov    0x4(%rsp),%r15d
3871   9420b1:	44 89 ff             	mov    %r15d,%edi
3874   9420b4:	41 0f 45 fc          	cmovne %r12d,%edi
3878   9420b8:	48 0b 44 24 20       	or     0x20(%rsp),%rax
387d   9420bd:	0f 85 e3 5e 00 00    	jne    947fa6 <___bpf_prog_run+0x9766>
3883   9420c3:	4c 8b 6c 24 30       	mov    0x30(%rsp),%r13
3888   9420c8:	48 8d 3c ed 00 00 00 00 	lea    0x0(,%rbp,8),%rdi
3890   9420d0:	4c 01 ef             	add    %r13,%rdi
3893   9420d3:	48 8b 07             	mov    (%rdi),%rax
3896   9420d6:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
389b   9420db:	e8 00 00 00 00       	call   9420e0 <___bpf_prog_run+0x38a0>	9420dc: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
38a0   9420e0:	4c 89 ed             	mov    %r13,%rbp
38a3   9420e3:	4c 8b 28             	mov    (%rax),%r13
38a6   9420e6:	8b 02                	mov    (%rdx),%eax
38a8   9420e8:	89 44 24 08          	mov    %eax,0x8(%rsp)
38ac   9420ec:	48 c1 eb 04          	shr    $0x4,%rbx
38b0   9420f0:	49 c1 ee 04          	shr    $0x4,%r14
38b4   9420f4:	48 85 db             	test   %rbx,%rbx
38b7   9420f7:	45 0f 44 e7          	cmove  %r15d,%r12d
38bb   9420fb:	48 0b 5c 24 20       	or     0x20(%rsp),%rbx
38c0   942100:	0f 85 aa 5e 00 00    	jne    947fb0 <___bpf_prog_run+0x9770>
38c6   942106:	4a 8d 3c f5 00 00 00 00 	lea    0x0(,%r14,8),%rdi
38ce   94210e:	48 01 ef             	add    %rbp,%rdi
38d1   942111:	48 8b 1f             	mov    (%rdi),%rbx
38d4   942114:	e8 00 00 00 00       	call   942119 <___bpf_prog_run+0x38d9>	942115: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
38d9   942119:	48 8b 00             	mov    (%rax),%rax
38dc   94211c:	48 89 c1             	mov    %rax,%rcx
38df   94211f:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
38e4   942124:	48 21 f1             	and    %rsi,%rcx
38e7   942127:	48 09 d8             	or     %rbx,%rax
38ea   94212a:	4c 21 e8             	and    %r13,%rax
38ed   94212d:	48 09 c8             	or     %rcx,%rax
38f0   942130:	4d 85 ed             	test   %r13,%r13
38f3   942133:	75 06                	jne    94213b <___bpf_prog_run+0x38fb>
38f5   942135:	8b 0a                	mov    (%rdx),%ecx
38f7   942137:	89 4c 24 08          	mov    %ecx,0x8(%rsp)
38fb   94213b:	48 21 f3             	and    %rsi,%rbx
38fe   94213e:	48 85 c0             	test   %rax,%rax
3901   942141:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
3906   942146:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
390b   94214b:	74 0c                	je     942159 <___bpf_prog_run+0x3919>
390d   94214d:	48 f7 d0             	not    %rax
3910   942150:	48 21 d8             	and    %rbx,%rax
3913   942153:	0f 84 64 5e 00 00    	je     947fbd <___bpf_prog_run+0x977d>
3919   942159:	48 85 db             	test   %rbx,%rbx
391c   94215c:	0f 84 6d 5e 00 00    	je     947fcf <___bpf_prog_run+0x978f>
3922   942162:	e8 00 00 00 00       	call   942167 <___bpf_prog_run+0x3927>	942163: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3927   942167:	49 8d 5d 02          	lea    0x2(%r13),%rbx
392b   94216b:	4d 85 f6             	test   %r14,%r14
392e   94216e:	0f 84 48 63 00 00    	je     9484bc <___bpf_prog_run+0x9c7c>
3934   942174:	8b 3c 24             	mov    (%rsp),%edi
3937   942177:	e8 00 00 00 00       	call   94217c <___bpf_prog_run+0x393c>	942178: R_X86_64_PLT32	__msan_warning-0x4
393c   94217c:	e9 3b 63 00 00       	jmp    9484bc <___bpf_prog_run+0x9c7c>
3941   942181:	49 8d 5d 01          	lea    0x1(%r13),%rbx
3945   942185:	4d 85 f6             	test   %r14,%r14
3948   942188:	0f 85 4f 5e 00 00    	jne    947fdd <___bpf_prog_run+0x979d>
394e   94218e:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
3953   942193:	44 0f b6 33          	movzbl (%rbx),%r14d
3957   942197:	48 89 df             	mov    %rbx,%rdi
395a   94219a:	e8 00 00 00 00       	call   94219f <___bpf_prog_run+0x395f>	94219b: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
395f   94219f:	0f b6 18             	movzbl (%rax),%ebx
3962   9421a2:	44 8b 22             	mov    (%rdx),%r12d
3965   9421a5:	89 d8                	mov    %ebx,%eax
3967   9421a7:	83 e0 0f             	and    $0xf,%eax
396a   9421aa:	44 89 f5             	mov    %r14d,%ebp
396d   9421ad:	83 e5 0f             	and    $0xf,%ebp
3970   9421b0:	48 85 c0             	test   %rax,%rax
3973   9421b3:	44 8b 7c 24 04       	mov    0x4(%rsp),%r15d
3978   9421b8:	44 89 ff             	mov    %r15d,%edi
397b   9421bb:	41 0f 45 fc          	cmovne %r12d,%edi
397f   9421bf:	48 0b 44 24 20       	or     0x20(%rsp),%rax
3984   9421c4:	0f 85 20 5e 00 00    	jne    947fea <___bpf_prog_run+0x97aa>
398a   9421ca:	4c 8b 6c 24 30       	mov    0x30(%rsp),%r13
398f   9421cf:	48 8d 3c ed 00 00 00 00 	lea    0x0(,%rbp,8),%rdi
3997   9421d7:	4c 01 ef             	add    %r13,%rdi
399a   9421da:	8b 07                	mov    (%rdi),%eax
399c   9421dc:	89 44 24 18          	mov    %eax,0x18(%rsp)
39a0   9421e0:	e8 00 00 00 00       	call   9421e5 <___bpf_prog_run+0x39a5>	9421e1: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
39a5   9421e5:	4c 89 ed             	mov    %r13,%rbp
39a8   9421e8:	44 8b 28             	mov    (%rax),%r13d
39ab   9421eb:	8b 02                	mov    (%rdx),%eax
39ad   9421ed:	89 44 24 08          	mov    %eax,0x8(%rsp)
39b1   9421f1:	48 c1 eb 04          	shr    $0x4,%rbx
39b5   9421f5:	49 c1 ee 04          	shr    $0x4,%r14
39b9   9421f9:	48 85 db             	test   %rbx,%rbx
39bc   9421fc:	45 0f 44 e7          	cmove  %r15d,%r12d
39c0   942200:	48 0b 5c 24 20       	or     0x20(%rsp),%rbx
39c5   942205:	0f 85 e9 5d 00 00    	jne    947ff4 <___bpf_prog_run+0x97b4>
39cb   94220b:	4a 8d 3c f5 00 00 00 00 	lea    0x0(,%r14,8),%rdi
39d3   942213:	48 01 ef             	add    %rbp,%rdi
39d6   942216:	8b 1f                	mov    (%rdi),%ebx
39d8   942218:	e8 00 00 00 00       	call   94221d <___bpf_prog_run+0x39dd>	942219: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
39dd   94221d:	8b 00                	mov    (%rax),%eax
39df   94221f:	85 c0                	test   %eax,%eax
39e1   942221:	74 06                	je     942229 <___bpf_prog_run+0x39e9>
39e3   942223:	8b 0a                	mov    (%rdx),%ecx
39e5   942225:	89 4c 24 08          	mov    %ecx,0x8(%rsp)
39e9   942229:	41 09 c5             	or     %eax,%r13d
39ec   94222c:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
39f1   942231:	0f 85 ca 5d 00 00    	jne    948001 <___bpf_prog_run+0x97c1>
39f7   942237:	39 5c 24 18          	cmp    %ebx,0x18(%rsp)
39fb   94223b:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
3a00   942240:	0f 83 1b 30 00 00    	jae    945261 <___bpf_prog_run+0x6a21>
3a06   942246:	e8 00 00 00 00       	call   94224b <___bpf_prog_run+0x3a0b>	942247: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3a0b   94224b:	49 83 c5 08          	add    $0x8,%r13
3a0f   94224f:	e9 ab c6 ff ff       	jmp    93e8ff <___bpf_prog_run+0xbf>
3a14   942254:	e8 00 00 00 00       	call   942259 <___bpf_prog_run+0x3a19>	942255: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3a19   942259:	49 8d 5d 01          	lea    0x1(%r13),%rbx
3a1d   94225d:	4d 85 f6             	test   %r14,%r14
3a20   942260:	0f 85 a9 5d 00 00    	jne    94800f <___bpf_prog_run+0x97cf>
3a26   942266:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
3a2b   94226b:	44 0f b6 23          	movzbl (%rbx),%r12d
3a2f   94226f:	48 89 df             	mov    %rbx,%rdi
3a32   942272:	e8 00 00 00 00       	call   942277 <___bpf_prog_run+0x3a37>	942273: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
3a37   942277:	44 0f b6 30          	movzbl (%rax),%r14d
3a3b   94227b:	44 8b 2a             	mov    (%rdx),%r13d
3a3e   94227e:	45 89 f7             	mov    %r14d,%r15d
3a41   942281:	41 83 e7 0f          	and    $0xf,%r15d
3a45   942285:	44 89 e5             	mov    %r12d,%ebp
3a48   942288:	83 e5 0f             	and    $0xf,%ebp
3a4b   94228b:	4d 85 ff             	test   %r15,%r15
3a4e   94228e:	8b 5c 24 04          	mov    0x4(%rsp),%ebx
3a52   942292:	41 0f 45 dd          	cmovne %r13d,%ebx
3a56   942296:	4c 0b 7c 24 20       	or     0x20(%rsp),%r15
3a5b   94229b:	0f 85 7b 5d 00 00    	jne    94801c <___bpf_prog_run+0x97dc>
3a61   9422a1:	89 5c 24 38          	mov    %ebx,0x38(%rsp)
3a65   9422a5:	48 8b 5c 24 30       	mov    0x30(%rsp),%rbx
3a6a   9422aa:	48 8d 2c eb          	lea    (%rbx,%rbp,8),%rbp
3a6e   9422ae:	48 8b 45 00          	mov    0x0(%rbp),%rax
3a72   9422b2:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
3a77   9422b7:	48 89 ef             	mov    %rbp,%rdi
3a7a   9422ba:	e8 00 00 00 00       	call   9422bf <___bpf_prog_run+0x3a7f>	9422bb: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
3a7f   9422bf:	48 8b 00             	mov    (%rax),%rax
3a82   9422c2:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
3a87   9422c7:	8b 02                	mov    (%rdx),%eax
3a89   9422c9:	89 44 24 40          	mov    %eax,0x40(%rsp)
3a8d   9422cd:	49 c1 ee 04          	shr    $0x4,%r14
3a91   9422d1:	49 c1 ec 04          	shr    $0x4,%r12
3a95   9422d5:	4d 85 f6             	test   %r14,%r14
3a98   9422d8:	44 0f 44 6c 24 04    	cmove  0x4(%rsp),%r13d
3a9e   9422de:	4c 0b 74 24 20       	or     0x20(%rsp),%r14
3aa3   9422e3:	0f 85 3f 5d 00 00    	jne    948028 <___bpf_prog_run+0x97e8>
3aa9   9422e9:	4a 8d 3c e3          	lea    (%rbx,%r12,8),%rdi
3aad   9422ed:	48 8b 1f             	mov    (%rdi),%rbx
3ab0   9422f0:	e8 00 00 00 00       	call   9422f5 <___bpf_prog_run+0x3ab5>	9422f1: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
3ab5   9422f5:	48 83 38 00          	cmpq   $0x0,(%rax)
3ab9   9422f9:	0f 85 36 5d 00 00    	jne    948035 <___bpf_prog_run+0x97f5>
3abf   9422ff:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
3ac4   942304:	48 89 c1             	mov    %rax,%rcx
3ac7   942307:	48 09 d9             	or     %rbx,%rcx
3aca   94230a:	48 c1 e9 20          	shr    $0x20,%rcx
3ace   94230e:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
3ad3   942313:	0f 84 a7 31 00 00    	je     9454c0 <___bpf_prog_run+0x6c80>
3ad9   942319:	31 d2                	xor    %edx,%edx
3adb   94231b:	48 f7 f3             	div    %rbx
3ade   94231e:	48 89 c3             	mov    %rax,%rbx
3ae1   942321:	4d 85 ff             	test   %r15,%r15
3ae4   942324:	0f 85 a5 31 00 00    	jne    9454cf <___bpf_prog_run+0x6c8f>
3aea   94232a:	48 89 ef             	mov    %rbp,%rdi
3aed   94232d:	e8 00 00 00 00       	call   942332 <___bpf_prog_run+0x3af2>	94232e: R_X86_64_PLT32	__msan_metadata_ptr_for_store_8-0x4
3af2   942332:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
3af7   942337:	48 89 08             	mov    %rcx,(%rax)
3afa   94233a:	48 85 c9             	test   %rcx,%rcx
3afd   94233d:	0f 85 fe 5c 00 00    	jne    948041 <___bpf_prog_run+0x9801>
3b03   942343:	48 89 5d 00          	mov    %rbx,0x0(%rbp)
3b07   942347:	e9 aa c5 ff ff       	jmp    93e8f6 <___bpf_prog_run+0xb6>
3b0c   94234c:	49 8d 5d 01          	lea    0x1(%r13),%rbx
3b10   942350:	4d 85 f6             	test   %r14,%r14
3b13   942353:	0f 85 08 5d 00 00    	jne    948061 <___bpf_prog_run+0x9821>
3b19   942359:	0f b6 2b             	movzbl (%rbx),%ebp
3b1c   94235c:	48 89 df             	mov    %rbx,%rdi
3b1f   94235f:	e8 00 00 00 00       	call   942364 <___bpf_prog_run+0x3b24>	942360: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
3b24   942364:	0f b6 00             	movzbl (%rax),%eax
3b27   942367:	83 e0 0f             	and    $0xf,%eax
3b2a   94236a:	8b 7c 24 04          	mov    0x4(%rsp),%edi
3b2e   94236e:	48 85 c0             	test   %rax,%rax
3b31   942371:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
3b36   942376:	74 02                	je     94237a <___bpf_prog_run+0x3b3a>
3b38   942378:	8b 3a                	mov    (%rdx),%edi
3b3a   94237a:	83 e5 0f             	and    $0xf,%ebp
3b3d   94237d:	48 09 c8             	or     %rcx,%rax
3b40   942380:	0f 85 e8 5c 00 00    	jne    94806e <___bpf_prog_run+0x982e>
3b46   942386:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
3b4b   94238b:	48 8d 3c e8          	lea    (%rax,%rbp,8),%rdi
3b4f   94238f:	44 8b 3f             	mov    (%rdi),%r15d
3b52   942392:	e8 00 00 00 00       	call   942397 <___bpf_prog_run+0x3b57>	942393: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
3b57   942397:	49 8d 6d 04          	lea    0x4(%r13),%rbp
3b5b   94239b:	8b 18                	mov    (%rax),%ebx
3b5d   94239d:	44 8b 32             	mov    (%rdx),%r14d
3b60   9423a0:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
3b66   9423a6:	0f 85 cc 5c 00 00    	jne    948078 <___bpf_prog_run+0x9838>
3b6c   9423ac:	44 8b 65 00          	mov    0x0(%rbp),%r12d
3b70   9423b0:	48 89 ef             	mov    %rbp,%rdi
3b73   9423b3:	e8 00 00 00 00       	call   9423b8 <___bpf_prog_run+0x3b78>	9423b4: R_X86_64_PLT32	__msan_metadata_ptr_for_load_4-0x4
3b78   9423b8:	85 db                	test   %ebx,%ebx
3b7a   9423ba:	75 1e                	jne    9423da <___bpf_prog_run+0x3b9a>
3b7c   9423bc:	44 8b 32             	mov    (%rdx),%r14d
3b7f   9423bf:	0b 18                	or     (%rax),%ebx
3b81   9423c1:	74 1b                	je     9423de <___bpf_prog_run+0x3b9e>
3b83   9423c3:	44 89 f7             	mov    %r14d,%edi
3b86   9423c6:	e8 00 00 00 00       	call   9423cb <___bpf_prog_run+0x3b8b>	9423c7: R_X86_64_PLT32	__msan_warning-0x4
3b8b   9423cb:	45 39 fc             	cmp    %r15d,%r12d
3b8e   9423ce:	77 13                	ja     9423e3 <___bpf_prog_run+0x3ba3>
3b90   9423d0:	e8 00 00 00 00       	call   9423d5 <___bpf_prog_run+0x3b95>	9423d1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3b95   9423d5:	e9 1c c5 ff ff       	jmp    93e8f6 <___bpf_prog_run+0xb6>
3b9a   9423da:	0b 18                	or     (%rax),%ebx
3b9c   9423dc:	75 e5                	jne    9423c3 <___bpf_prog_run+0x3b83>
3b9e   9423de:	45 39 fc             	cmp    %r15d,%r12d
3ba1   9423e1:	76 ed                	jbe    9423d0 <___bpf_prog_run+0x3b90>
3ba3   9423e3:	e8 00 00 00 00       	call   9423e8 <___bpf_prog_run+0x3ba8>	9423e4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3ba8   9423e8:	49 8d 5d 02          	lea    0x2(%r13),%rbx
3bac   9423ec:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
3bb1   9423f1:	4d 85 f6             	test   %r14,%r14
3bb4   9423f4:	0f 84 c2 60 00 00    	je     9484bc <___bpf_prog_run+0x9c7c>
3bba   9423fa:	8b 3c 24             	mov    (%rsp),%edi
3bbd   9423fd:	e8 00 00 00 00       	call   942402 <___bpf_prog_run+0x3bc2>	9423fe: R_X86_64_PLT32	__msan_warning-0x4
3bc2   942402:	e9 b5 60 00 00       	jmp    9484bc <___bpf_prog_run+0x9c7c>
3bc7   942407:	49 8d 5d 01          	lea    0x1(%r13),%rbx
3bcb   94240b:	4d 85 f6             	test   %r14,%r14
3bce   94240e:	0f 85 71 5c 00 00    	jne    948085 <___bpf_prog_run+0x9845>
3bd4   942414:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
3bd9   942419:	44 0f b6 33          	movzbl (%rbx),%r14d
3bdd   94241d:	48 89 df             	mov    %rbx,%rdi
3be0   942420:	e8 00 00 00 00       	call   942425 <___bpf_prog_run+0x3be5>	942421: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
3be5   942425:	0f b6 18             	movzbl (%rax),%ebx
3be8   942428:	44 8b 22             	mov    (%rdx),%r12d
3beb   94242b:	89 d8                	mov    %ebx,%eax
3bed   94242d:	83 e0 0f             	and    $0xf,%eax
3bf0   942430:	44 89 f5             	mov    %r14d,%ebp
3bf3   942433:	83 e5 0f             	and    $0xf,%ebp
3bf6   942436:	48 85 c0             	test   %rax,%rax
3bf9   942439:	44 8b 7c 24 04       	mov    0x4(%rsp),%r15d
3bfe   94243e:	44 89 ff             	mov    %r15d,%edi
3c01   942441:	41 0f 45 fc          	cmovne %r12d,%edi
3c05   942445:	48 0b 44 24 20       	or     0x20(%rsp),%rax
3c0a   94244a:	0f 85 42 5c 00 00    	jne    948092 <___bpf_prog_run+0x9852>
3c10   942450:	4c 8b 6c 24 30       	mov    0x30(%rsp),%r13
3c15   942455:	48 8d 3c ed 00 00 00 00 	lea    0x0(,%rbp,8),%rdi
3c1d   94245d:	4c 01 ef             	add    %r13,%rdi
3c20   942460:	48 8b 07             	mov    (%rdi),%rax
3c23   942463:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
3c28   942468:	e8 00 00 00 00       	call   94246d <___bpf_prog_run+0x3c2d>	942469: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
3c2d   94246d:	4c 89 ed             	mov    %r13,%rbp
3c30   942470:	4c 8b 28             	mov    (%rax),%r13
3c33   942473:	8b 02                	mov    (%rdx),%eax
3c35   942475:	89 44 24 08          	mov    %eax,0x8(%rsp)
3c39   942479:	48 c1 eb 04          	shr    $0x4,%rbx
3c3d   94247d:	49 c1 ee 04          	shr    $0x4,%r14
3c41   942481:	48 85 db             	test   %rbx,%rbx
3c44   942484:	45 0f 44 e7          	cmove  %r15d,%r12d
3c48   942488:	48 0b 5c 24 20       	or     0x20(%rsp),%rbx
3c4d   94248d:	0f 85 09 5c 00 00    	jne    94809c <___bpf_prog_run+0x985c>
3c53   942493:	4a 8d 3c f5 00 00 00 00 	lea    0x0(,%r14,8),%rdi
3c5b   94249b:	48 01 ef             	add    %rbp,%rdi
3c5e   94249e:	48 8b 1f             	mov    (%rdi),%rbx
3c61   9424a1:	e8 00 00 00 00       	call   9424a6 <___bpf_prog_run+0x3c66>	9424a2: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
3c66   9424a6:	48 8b 00             	mov    (%rax),%rax
3c69   9424a9:	48 85 c0             	test   %rax,%rax
3c6c   9424ac:	74 06                	je     9424b4 <___bpf_prog_run+0x3c74>
3c6e   9424ae:	8b 0a                	mov    (%rdx),%ecx
3c70   9424b0:	89 4c 24 08          	mov    %ecx,0x8(%rsp)
3c74   9424b4:	49 09 c5             	or     %rax,%r13
3c77   9424b7:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
3c7c   9424bc:	0f 85 e7 5b 00 00    	jne    9480a9 <___bpf_prog_run+0x9869>
3c82   9424c2:	48 39 5c 24 18       	cmp    %rbx,0x18(%rsp)
3c87   9424c7:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
3c8c   9424cc:	0f 8e ae 2d 00 00    	jle    945280 <___bpf_prog_run+0x6a40>
3c92   9424d2:	e8 00 00 00 00       	call   9424d7 <___bpf_prog_run+0x3c97>	9424d3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3c97   9424d7:	49 83 c5 08          	add    $0x8,%r13
3c9b   9424db:	e9 1f c4 ff ff       	jmp    93e8ff <___bpf_prog_run+0xbf>
3ca0   9424e0:	e8 00 00 00 00       	call   9424e5 <___bpf_prog_run+0x3ca5>	9424e1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3ca5   9424e5:	49 8d 5d 01          	lea    0x1(%r13),%rbx
3ca9   9424e9:	4d 85 f6             	test   %r14,%r14
3cac   9424ec:	0f 85 c5 5b 00 00    	jne    9480b7 <___bpf_prog_run+0x9877>
3cb2   9424f2:	0f b6 2b             	movzbl (%rbx),%ebp
3cb5   9424f5:	48 89 df             	mov    %rbx,%rdi
3cb8   9424f8:	e8 00 00 00 00       	call   9424fd <___bpf_prog_run+0x3cbd>	9424f9: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
3cbd   9424fd:	44 0f b6 30          	movzbl (%rax),%r14d
3cc1   942501:	41 83 e6 0f          	and    $0xf,%r14d
3cc5   942505:	8b 5c 24 04          	mov    0x4(%rsp),%ebx
3cc9   942509:	4d 85 f6             	test   %r14,%r14
3ccc   94250c:	74 02                	je     942510 <___bpf_prog_run+0x3cd0>
3cce   94250e:	8b 1a                	mov    (%rdx),%ebx
3cd0   942510:	4d 89 ef             	mov    %r13,%r15
3cd3   942513:	83 e5 0f             	and    $0xf,%ebp
3cd6   942516:	4c 0b 74 24 20       	or     0x20(%rsp),%r14
3cdb   94251b:	0f 85 a3 5b 00 00    	jne    9480c4 <___bpf_prog_run+0x9884>
3ce1   942521:	89 5c 24 08          	mov    %ebx,0x8(%rsp)
3ce5   942525:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
3cea   94252a:	4c 8d 2c e8          	lea    (%rax,%rbp,8),%r13
3cee   94252e:	45 8b 65 00          	mov    0x0(%r13),%r12d
3cf2   942532:	4c 89 ef             	mov    %r13,%rdi
3cf5   942535:	e8 00 00 00 00       	call   94253a <___bpf_prog_run+0x3cfa>	942536: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
3cfa   94253a:	49 8d 6f 04          	lea    0x4(%r15),%rbp
3cfe   94253e:	8b 18                	mov    (%rax),%ebx
3d00   942540:	8b 02                	mov    (%rdx),%eax
3d02   942542:	89 44 24 18          	mov    %eax,0x18(%rsp)
3d06   942546:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
3d0c   94254c:	0f 85 7e 5b 00 00    	jne    9480d0 <___bpf_prog_run+0x9890>
3d12   942552:	44 2b 65 00          	sub    0x0(%rbp),%r12d
3d16   942556:	48 89 ef             	mov    %rbp,%rdi
3d19   942559:	e8 00 00 00 00       	call   94255e <___bpf_prog_run+0x3d1e>	94255a: R_X86_64_PLT32	__msan_metadata_ptr_for_load_4-0x4
3d1e   94255e:	8b 00                	mov    (%rax),%eax
3d20   942560:	85 c0                	test   %eax,%eax
3d22   942562:	74 06                	je     94256a <___bpf_prog_run+0x3d2a>
3d24   942564:	8b 0a                	mov    (%rdx),%ecx
3d26   942566:	89 4c 24 18          	mov    %ecx,0x18(%rsp)
3d2a   94256a:	09 c3                	or     %eax,%ebx
3d2c   94256c:	4d 85 f6             	test   %r14,%r14
3d2f   94256f:	0f 85 68 5b 00 00    	jne    9480dd <___bpf_prog_run+0x989d>
3d35   942575:	4c 89 ef             	mov    %r13,%rdi
3d38   942578:	e8 00 00 00 00       	call   94257d <___bpf_prog_run+0x3d3d>	942579: R_X86_64_PLT32	__msan_metadata_ptr_for_store_8-0x4
3d3d   94257d:	48 89 18             	mov    %rbx,(%rax)
3d40   942580:	48 85 db             	test   %rbx,%rbx
3d43   942583:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
3d48   942588:	0f 85 5d 5b 00 00    	jne    9480eb <___bpf_prog_run+0x98ab>
3d4e   94258e:	4d 89 65 00          	mov    %r12,0x0(%r13)
3d52   942592:	4d 89 fd             	mov    %r15,%r13
3d55   942595:	49 83 c5 08          	add    $0x8,%r13
3d59   942599:	e9 61 c3 ff ff       	jmp    93e8ff <___bpf_prog_run+0xbf>
3d5e   94259e:	49 8d 5d 01          	lea    0x1(%r13),%rbx
3d62   9425a2:	4d 85 f6             	test   %r14,%r14
3d65   9425a5:	0f 85 61 5b 00 00    	jne    94810c <___bpf_prog_run+0x98cc>
3d6b   9425ab:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
3d70   9425b0:	44 0f b6 33          	movzbl (%rbx),%r14d
3d74   9425b4:	48 89 df             	mov    %rbx,%rdi
3d77   9425b7:	e8 00 00 00 00       	call   9425bc <___bpf_prog_run+0x3d7c>	9425b8: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
3d7c   9425bc:	0f b6 18             	movzbl (%rax),%ebx
3d7f   9425bf:	44 8b 22             	mov    (%rdx),%r12d
3d82   9425c2:	89 d8                	mov    %ebx,%eax
3d84   9425c4:	83 e0 0f             	and    $0xf,%eax
3d87   9425c7:	44 89 f5             	mov    %r14d,%ebp
3d8a   9425ca:	83 e5 0f             	and    $0xf,%ebp
3d8d   9425cd:	48 85 c0             	test   %rax,%rax
3d90   9425d0:	44 8b 7c 24 04       	mov    0x4(%rsp),%r15d
3d95   9425d5:	44 89 ff             	mov    %r15d,%edi
3d98   9425d8:	41 0f 45 fc          	cmovne %r12d,%edi
3d9c   9425dc:	48 0b 44 24 20       	or     0x20(%rsp),%rax
3da1   9425e1:	0f 85 32 5b 00 00    	jne    948119 <___bpf_prog_run+0x98d9>
3da7   9425e7:	4c 8b 6c 24 30       	mov    0x30(%rsp),%r13
3dac   9425ec:	48 8d 3c ed 00 00 00 00 	lea    0x0(,%rbp,8),%rdi
3db4   9425f4:	4c 01 ef             	add    %r13,%rdi
3db7   9425f7:	48 8b 07             	mov    (%rdi),%rax
3dba   9425fa:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
3dbf   9425ff:	e8 00 00 00 00       	call   942604 <___bpf_prog_run+0x3dc4>	942600: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
3dc4   942604:	4c 89 ed             	mov    %r13,%rbp
3dc7   942607:	4c 8b 28             	mov    (%rax),%r13
3dca   94260a:	8b 02                	mov    (%rdx),%eax
3dcc   94260c:	89 44 24 08          	mov    %eax,0x8(%rsp)
3dd0   942610:	48 c1 eb 04          	shr    $0x4,%rbx
3dd4   942614:	49 c1 ee 04          	shr    $0x4,%r14
3dd8   942618:	48 85 db             	test   %rbx,%rbx
3ddb   94261b:	45 0f 44 e7          	cmove  %r15d,%r12d
3ddf   94261f:	48 0b 5c 24 20       	or     0x20(%rsp),%rbx
3de4   942624:	0f 85 f9 5a 00 00    	jne    948123 <___bpf_prog_run+0x98e3>
3dea   94262a:	4a 8d 3c f5 00 00 00 00 	lea    0x0(,%r14,8),%rdi
3df2   942632:	48 01 ef             	add    %rbp,%rdi
3df5   942635:	48 8b 1f             	mov    (%rdi),%rbx
3df8   942638:	e8 00 00 00 00       	call   94263d <___bpf_prog_run+0x3dfd>	942639: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
3dfd   94263d:	48 8b 00             	mov    (%rax),%rax
3e00   942640:	48 85 c0             	test   %rax,%rax
3e03   942643:	74 06                	je     94264b <___bpf_prog_run+0x3e0b>
3e05   942645:	8b 0a                	mov    (%rdx),%ecx
3e07   942647:	89 4c 24 08          	mov    %ecx,0x8(%rsp)
3e0b   94264b:	49 09 c5             	or     %rax,%r13
3e0e   94264e:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
3e13   942653:	0f 85 d7 5a 00 00    	jne    948130 <___bpf_prog_run+0x98f0>
3e19   942659:	48 39 5c 24 18       	cmp    %rbx,0x18(%rsp)
3e1e   94265e:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
3e23   942663:	0f 8d 36 2c 00 00    	jge    94529f <___bpf_prog_run+0x6a5f>
3e29   942669:	e8 00 00 00 00       	call   94266e <___bpf_prog_run+0x3e2e>	94266a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3e2e   94266e:	49 8d 5d 02          	lea    0x2(%r13),%rbx
3e32   942672:	4d 85 f6             	test   %r14,%r14
3e35   942675:	0f 84 41 5e 00 00    	je     9484bc <___bpf_prog_run+0x9c7c>
3e3b   94267b:	8b 3c 24             	mov    (%rsp),%edi
3e3e   94267e:	e8 00 00 00 00       	call   942683 <___bpf_prog_run+0x3e43>	94267f: R_X86_64_PLT32	__msan_warning-0x4
3e43   942683:	e9 34 5e 00 00       	jmp    9484bc <___bpf_prog_run+0x9c7c>
3e48   942688:	49 8d 5d 04          	lea    0x4(%r13),%rbx
3e4c   94268c:	4d 85 f6             	test   %r14,%r14
3e4f   94268f:	0f 85 a9 5a 00 00    	jne    94813e <___bpf_prog_run+0x98fe>
3e55   942695:	8b 2b                	mov    (%rbx),%ebp
3e57   942697:	48 89 df             	mov    %rbx,%rdi
3e5a   94269a:	e8 00 00 00 00       	call   94269f <___bpf_prog_run+0x3e5f>	94269b: R_X86_64_PLT32	__msan_metadata_ptr_for_load_4-0x4
3e5f   94269f:	83 38 00             	cmpl   $0x0,(%rax)
3e62   9426a2:	0f 85 a3 5a 00 00    	jne    94814b <___bpf_prog_run+0x990b>
3e68   9426a8:	83 fd 10             	cmp    $0x10,%ebp
3e6b   9426ab:	0f 84 aa 5a 00 00    	je     94815b <___bpf_prog_run+0x991b>
3e71   9426b1:	83 fd 20             	cmp    $0x20,%ebp
3e74   9426b4:	0f 84 20 2f 00 00    	je     9455da <___bpf_prog_run+0x6d9a>
3e7a   9426ba:	83 fd 40             	cmp    $0x40,%ebp
3e7d   9426bd:	0f 85 9d 2f 00 00    	jne    945660 <___bpf_prog_run+0x6e20>
3e83   9426c3:	e8 00 00 00 00       	call   9426c8 <___bpf_prog_run+0x3e88>	9426c4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3e88   9426c8:	49 8d 5d 01          	lea    0x1(%r13),%rbx
3e8c   9426cc:	4d 85 f6             	test   %r14,%r14
3e8f   9426cf:	0f 85 ba 68 00 00    	jne    948f8f <___bpf_prog_run+0xa74f>
3e95   9426d5:	44 0f b6 33          	movzbl (%rbx),%r14d
3e99   9426d9:	48 89 df             	mov    %rbx,%rdi
3e9c   9426dc:	e8 00 00 00 00       	call   9426e1 <___bpf_prog_run+0x3ea1>	9426dd: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
3ea1   9426e1:	0f b6 28             	movzbl (%rax),%ebp
3ea4   9426e4:	83 e5 0f             	and    $0xf,%ebp
3ea7   9426e7:	44 8b 7c 24 04       	mov    0x4(%rsp),%r15d
3eac   9426ec:	48 85 ed             	test   %rbp,%rbp
3eaf   9426ef:	74 03                	je     9426f4 <___bpf_prog_run+0x3eb4>
3eb1   9426f1:	44 8b 3a             	mov    (%rdx),%r15d
3eb4   9426f4:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
3eb9   9426f9:	41 83 e6 0f          	and    $0xf,%r14d
3ebd   9426fd:	48 0b 6c 24 20       	or     0x20(%rsp),%rbp
3ec2   942702:	0f 85 94 68 00 00    	jne    948f9c <___bpf_prog_run+0xa75c>
3ec8   942708:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
3ecd   94270d:	4e 8d 2c f0          	lea    (%rax,%r14,8),%r13
3ed1   942711:	4d 8b 65 00          	mov    0x0(%r13),%r12
3ed5   942715:	4c 89 ef             	mov    %r13,%rdi
3ed8   942718:	e8 00 00 00 00       	call   94271d <___bpf_prog_run+0x3edd>	942719: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
3edd   94271d:	48 8b 18             	mov    (%rax),%rbx
3ee0   942720:	44 8b 32             	mov    (%rdx),%r14d
3ee3   942723:	48 85 ed             	test   %rbp,%rbp
3ee6   942726:	0f 85 7d 68 00 00    	jne    948fa9 <___bpf_prog_run+0xa769>
3eec   94272c:	48 0f cb             	bswap  %rbx
3eef   94272f:	4c 89 ef             	mov    %r13,%rdi
3ef2   942732:	e8 00 00 00 00       	call   942737 <___bpf_prog_run+0x3ef7>	942733: R_X86_64_PLT32	__msan_metadata_ptr_for_store_8-0x4
3ef7   942737:	48 89 18             	mov    %rbx,(%rax)
3efa   94273a:	48 85 db             	test   %rbx,%rbx
3efd   94273d:	0f 85 73 68 00 00    	jne    948fb6 <___bpf_prog_run+0xa776>
3f03   942743:	49 0f cc             	bswap  %r12
3f06   942746:	e9 a2 c1 ff ff       	jmp    93e8ed <___bpf_prog_run+0xad>
3f0b   94274b:	e8 00 00 00 00       	call   942750 <___bpf_prog_run+0x3f10>	94274c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3f10   942750:	49 8d 5d 04          	lea    0x4(%r13),%rbx
3f14   942754:	4d 85 f6             	test   %r14,%r14
3f17   942757:	0f 85 9a 5a 00 00    	jne    9481f7 <___bpf_prog_run+0x99b7>
3f1d   94275d:	4c 89 ed             	mov    %r13,%rbp
3f20   942760:	41 8b 45 04          	mov    0x4(%r13),%eax
3f24   942764:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
3f29   942769:	48 89 df             	mov    %rbx,%rdi
3f2c   94276c:	e8 00 00 00 00       	call   942771 <___bpf_prog_run+0x3f31>	94276d: R_X86_64_PLT32	__msan_metadata_ptr_for_load_4-0x4
3f31   942771:	49 8d 5d 0c          	lea    0xc(%r13),%rbx
3f35   942775:	44 8b 20             	mov    (%rax),%r12d
3f38   942778:	8b 02                	mov    (%rdx),%eax
3f3a   94277a:	89 44 24 08          	mov    %eax,0x8(%rsp)
3f3e   94277e:	4d 85 f6             	test   %r14,%r14
3f41   942781:	0f 85 7d 5a 00 00    	jne    948204 <___bpf_prog_run+0x99c4>
3f47   942787:	49 89 ed             	mov    %rbp,%r13
3f4a   94278a:	44 8b 7d 0c          	mov    0xc(%rbp),%r15d
3f4e   94278e:	48 89 df             	mov    %rbx,%rdi
3f51   942791:	e8 00 00 00 00       	call   942796 <___bpf_prog_run+0x3f56>	942792: R_X86_64_PLT32	__msan_metadata_ptr_for_load_4-0x4
3f56   942796:	8b 28                	mov    (%rax),%ebp
3f58   942798:	4d 85 e4             	test   %r12,%r12
3f5b   94279b:	75 06                	jne    9427a3 <___bpf_prog_run+0x3f63>
3f5d   94279d:	8b 02                	mov    (%rdx),%eax
3f5f   94279f:	89 44 24 08          	mov    %eax,0x8(%rsp)
3f63   9427a3:	49 8d 5d 01          	lea    0x1(%r13),%rbx
3f67   9427a7:	4d 85 f6             	test   %r14,%r14
3f6a   9427aa:	0f 85 61 5a 00 00    	jne    948211 <___bpf_prog_run+0x99d1>
3f70   9427b0:	48 c1 e5 20          	shl    $0x20,%rbp
3f74   9427b4:	44 0f b6 33          	movzbl (%rbx),%r14d
3f78   9427b8:	48 89 df             	mov    %rbx,%rdi
3f7b   9427bb:	e8 00 00 00 00       	call   9427c0 <___bpf_prog_run+0x3f80>	9427bc: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
3f80   9427c0:	0f b6 00             	movzbl (%rax),%eax
3f83   9427c3:	83 e0 0f             	and    $0xf,%eax
3f86   9427c6:	8b 7c 24 04          	mov    0x4(%rsp),%edi
3f8a   9427ca:	48 85 c0             	test   %rax,%rax
3f8d   9427cd:	74 02                	je     9427d1 <___bpf_prog_run+0x3f91>
3f8f   9427cf:	8b 3a                	mov    (%rdx),%edi
3f91   9427d1:	49 c1 e7 20          	shl    $0x20,%r15
3f95   9427d5:	41 83 e6 0f          	and    $0xf,%r14d
3f99   9427d9:	49 09 ec             	or     %rbp,%r12
3f9c   9427dc:	48 0b 44 24 20       	or     0x20(%rsp),%rax
3fa1   9427e1:	0f 85 37 5a 00 00    	jne    94821e <___bpf_prog_run+0x99de>
3fa7   9427e7:	4c 03 7c 24 18       	add    0x18(%rsp),%r15
3fac   9427ec:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
3fb1   9427f1:	4a 8d 2c f0          	lea    (%rax,%r14,8),%rbp
3fb5   9427f5:	48 89 ef             	mov    %rbp,%rdi
3fb8   9427f8:	e8 00 00 00 00       	call   9427fd <___bpf_prog_run+0x3fbd>	9427f9: R_X86_64_PLT32	__msan_metadata_ptr_for_store_8-0x4
3fbd   9427fd:	4c 89 20             	mov    %r12,(%rax)
3fc0   942800:	4d 85 e4             	test   %r12,%r12
3fc3   942803:	0f 85 1f 5a 00 00    	jne    948228 <___bpf_prog_run+0x99e8>
3fc9   942809:	4c 89 7d 00          	mov    %r15,0x0(%rbp)
3fcd   94280d:	49 83 c5 10          	add    $0x10,%r13
3fd1   942811:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
3fd6   942816:	e9 e4 c0 ff ff       	jmp    93e8ff <___bpf_prog_run+0xbf>
3fdb   94281b:	49 8d 5d 04          	lea    0x4(%r13),%rbx
3fdf   94281f:	4d 85 f6             	test   %r14,%r14
3fe2   942822:	0f 85 20 5a 00 00    	jne    948248 <___bpf_prog_run+0x9a08>
3fe8   942828:	8b 2b                	mov    (%rbx),%ebp
3fea   94282a:	48 89 df             	mov    %rbx,%rdi
3fed   94282d:	e8 00 00 00 00       	call   942832 <___bpf_prog_run+0x3ff2>	94282e: R_X86_64_PLT32	__msan_metadata_ptr_for_load_4-0x4
3ff2   942832:	83 38 00             	cmpl   $0x0,(%rax)
3ff5   942835:	0f 85 1a 5a 00 00    	jne    948255 <___bpf_prog_run+0x9a15>
3ffb   94283b:	83 fd 20             	cmp    $0x20,%ebp
3ffe   94283e:	0f 84 21 5a 00 00    	je     948265 <___bpf_prog_run+0x9a25>
4004   942844:	83 fd 10             	cmp    $0x10,%ebp
4007   942847:	0f 85 7f 2d 00 00    	jne    9455cc <___bpf_prog_run+0x6d8c>
400d   94284d:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
4012   942852:	e8 00 00 00 00       	call   942857 <___bpf_prog_run+0x4017>	942853: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4017   942857:	41 bd ff ff 00 00    	mov    $0xffff,%r13d
401d   94285d:	e9 13 5a 00 00       	jmp    948275 <___bpf_prog_run+0x9a35>
4022   942862:	49 8d 5d 01          	lea    0x1(%r13),%rbx
4026   942866:	4d 85 f6             	test   %r14,%r14
4029   942869:	0f 85 a5 5a 00 00    	jne    948314 <___bpf_prog_run+0x9ad4>
402f   94286f:	0f b6 2b             	movzbl (%rbx),%ebp
4032   942872:	48 89 df             	mov    %rbx,%rdi
4035   942875:	e8 00 00 00 00       	call   94287a <___bpf_prog_run+0x403a>	942876: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
403a   94287a:	0f b6 00             	movzbl (%rax),%eax
403d   94287d:	83 e0 0f             	and    $0xf,%eax
4040   942880:	8b 7c 24 04          	mov    0x4(%rsp),%edi
4044   942884:	48 85 c0             	test   %rax,%rax
4047   942887:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
404c   94288c:	74 02                	je     942890 <___bpf_prog_run+0x4050>
404e   94288e:	8b 3a                	mov    (%rdx),%edi
4050   942890:	83 e5 0f             	and    $0xf,%ebp
4053   942893:	48 09 c8             	or     %rcx,%rax
4056   942896:	0f 85 85 5a 00 00    	jne    948321 <___bpf_prog_run+0x9ae1>
405c   94289c:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
4061   9428a1:	48 8d 3c e8          	lea    (%rax,%rbp,8),%rdi
4065   9428a5:	4c 8b 3f             	mov    (%rdi),%r15
4068   9428a8:	e8 00 00 00 00       	call   9428ad <___bpf_prog_run+0x406d>	9428a9: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
406d   9428ad:	49 8d 6d 04          	lea    0x4(%r13),%rbp
4071   9428b1:	48 8b 18             	mov    (%rax),%rbx
4074   9428b4:	44 8b 32             	mov    (%rdx),%r14d
4077   9428b7:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
407d   9428bd:	0f 85 68 5a 00 00    	jne    94832b <___bpf_prog_run+0x9aeb>
4083   9428c3:	4c 63 65 00          	movslq 0x0(%rbp),%r12
4087   9428c7:	48 89 ef             	mov    %rbp,%rdi
408a   9428ca:	e8 00 00 00 00       	call   9428cf <___bpf_prog_run+0x408f>	9428cb: R_X86_64_PLT32	__msan_metadata_ptr_for_load_4-0x4
408f   9428cf:	48 63 00             	movslq (%rax),%rax
4092   9428d2:	48 85 c0             	test   %rax,%rax
4095   9428d5:	74 39                	je     942910 <___bpf_prog_run+0x40d0>
4097   9428d7:	44 8b 32             	mov    (%rdx),%r14d
409a   9428da:	48 09 c3             	or     %rax,%rbx
409d   9428dd:	74 36                	je     942915 <___bpf_prog_run+0x40d5>
409f   9428df:	44 89 f7             	mov    %r14d,%edi
40a2   9428e2:	e8 00 00 00 00       	call   9428e7 <___bpf_prog_run+0x40a7>	9428e3: R_X86_64_PLT32	__msan_warning-0x4
40a7   9428e7:	4d 39 e7             	cmp    %r12,%r15
40aa   9428ea:	7f 2e                	jg     94291a <___bpf_prog_run+0x40da>
40ac   9428ec:	e8 00 00 00 00       	call   9428f1 <___bpf_prog_run+0x40b1>	9428ed: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
40b1   9428f1:	49 8d 5d 02          	lea    0x2(%r13),%rbx
40b5   9428f5:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
40ba   9428fa:	4d 85 f6             	test   %r14,%r14
40bd   9428fd:	0f 84 b9 5b 00 00    	je     9484bc <___bpf_prog_run+0x9c7c>
40c3   942903:	8b 3c 24             	mov    (%rsp),%edi
40c6   942906:	e8 00 00 00 00       	call   94290b <___bpf_prog_run+0x40cb>	942907: R_X86_64_PLT32	__msan_warning-0x4
40cb   94290b:	e9 ac 5b 00 00       	jmp    9484bc <___bpf_prog_run+0x9c7c>
40d0   942910:	48 09 c3             	or     %rax,%rbx
40d3   942913:	75 ca                	jne    9428df <___bpf_prog_run+0x409f>
40d5   942915:	4d 39 e7             	cmp    %r12,%r15
40d8   942918:	7e d2                	jle    9428ec <___bpf_prog_run+0x40ac>
40da   94291a:	e8 00 00 00 00       	call   94291f <___bpf_prog_run+0x40df>	94291b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
40df   94291f:	e9 d2 bf ff ff       	jmp    93e8f6 <___bpf_prog_run+0xb6>
40e4   942924:	49 8d 5d 01          	lea    0x1(%r13),%rbx
40e8   942928:	4d 85 f6             	test   %r14,%r14
40eb   94292b:	0f 85 07 5a 00 00    	jne    948338 <___bpf_prog_run+0x9af8>
40f1   942931:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
40f6   942936:	44 0f b6 33          	movzbl (%rbx),%r14d
40fa   94293a:	48 89 df             	mov    %rbx,%rdi
40fd   94293d:	e8 00 00 00 00       	call   942942 <___bpf_prog_run+0x4102>	94293e: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
4102   942942:	0f b6 18             	movzbl (%rax),%ebx
4105   942945:	44 8b 22             	mov    (%rdx),%r12d
4108   942948:	89 d8                	mov    %ebx,%eax
410a   94294a:	83 e0 0f             	and    $0xf,%eax
410d   94294d:	44 89 f5             	mov    %r14d,%ebp
4110   942950:	83 e5 0f             	and    $0xf,%ebp
4113   942953:	48 85 c0             	test   %rax,%rax
4116   942956:	44 8b 7c 24 04       	mov    0x4(%rsp),%r15d
411b   94295b:	44 89 ff             	mov    %r15d,%edi
411e   94295e:	41 0f 45 fc          	cmovne %r12d,%edi
4122   942962:	48 0b 44 24 20       	or     0x20(%rsp),%rax
4127   942967:	0f 85 d8 59 00 00    	jne    948345 <___bpf_prog_run+0x9b05>
412d   94296d:	4c 8b 6c 24 30       	mov    0x30(%rsp),%r13
4132   942972:	48 8d 3c ed 00 00 00 00 	lea    0x0(,%rbp,8),%rdi
413a   94297a:	4c 01 ef             	add    %r13,%rdi
413d   94297d:	8b 07                	mov    (%rdi),%eax
413f   94297f:	89 44 24 18          	mov    %eax,0x18(%rsp)
4143   942983:	e8 00 00 00 00       	call   942988 <___bpf_prog_run+0x4148>	942984: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
4148   942988:	4c 89 ed             	mov    %r13,%rbp
414b   94298b:	44 8b 28             	mov    (%rax),%r13d
414e   94298e:	8b 02                	mov    (%rdx),%eax
4150   942990:	89 44 24 08          	mov    %eax,0x8(%rsp)
4154   942994:	48 c1 eb 04          	shr    $0x4,%rbx
4158   942998:	49 c1 ee 04          	shr    $0x4,%r14
415c   94299c:	48 85 db             	test   %rbx,%rbx
415f   94299f:	45 0f 44 e7          	cmove  %r15d,%r12d
4163   9429a3:	48 0b 5c 24 20       	or     0x20(%rsp),%rbx
4168   9429a8:	0f 85 a1 59 00 00    	jne    94834f <___bpf_prog_run+0x9b0f>
416e   9429ae:	4a 8d 3c f5 00 00 00 00 	lea    0x0(,%r14,8),%rdi
4176   9429b6:	48 01 ef             	add    %rbp,%rdi
4179   9429b9:	8b 1f                	mov    (%rdi),%ebx
417b   9429bb:	e8 00 00 00 00       	call   9429c0 <___bpf_prog_run+0x4180>	9429bc: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
4180   9429c0:	8b 00                	mov    (%rax),%eax
4182   9429c2:	85 c0                	test   %eax,%eax
4184   9429c4:	74 06                	je     9429cc <___bpf_prog_run+0x418c>
4186   9429c6:	8b 0a                	mov    (%rdx),%ecx
4188   9429c8:	89 4c 24 08          	mov    %ecx,0x8(%rsp)
418c   9429cc:	41 09 c5             	or     %eax,%r13d
418f   9429cf:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
4194   9429d4:	0f 85 82 59 00 00    	jne    94835c <___bpf_prog_run+0x9b1c>
419a   9429da:	39 5c 24 18          	cmp    %ebx,0x18(%rsp)
419e   9429de:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
41a3   9429e3:	0f 8e c4 28 00 00    	jle    9452ad <___bpf_prog_run+0x6a6d>
41a9   9429e9:	e8 00 00 00 00       	call   9429ee <___bpf_prog_run+0x41ae>	9429ea: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
41ae   9429ee:	49 83 c5 08          	add    $0x8,%r13
41b2   9429f2:	e9 08 bf ff ff       	jmp    93e8ff <___bpf_prog_run+0xbf>
41b7   9429f7:	49 8d 5d 01          	lea    0x1(%r13),%rbx
41bb   9429fb:	4d 85 f6             	test   %r14,%r14
41be   9429fe:	0f 85 66 59 00 00    	jne    94836a <___bpf_prog_run+0x9b2a>
41c4   942a04:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
41c9   942a09:	44 0f b6 33          	movzbl (%rbx),%r14d
41cd   942a0d:	48 89 df             	mov    %rbx,%rdi
41d0   942a10:	e8 00 00 00 00       	call   942a15 <___bpf_prog_run+0x41d5>	942a11: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
41d5   942a15:	0f b6 18             	movzbl (%rax),%ebx
41d8   942a18:	44 8b 22             	mov    (%rdx),%r12d
41db   942a1b:	89 d8                	mov    %ebx,%eax
41dd   942a1d:	83 e0 0f             	and    $0xf,%eax
41e0   942a20:	44 89 f5             	mov    %r14d,%ebp
41e3   942a23:	83 e5 0f             	and    $0xf,%ebp
41e6   942a26:	48 85 c0             	test   %rax,%rax
41e9   942a29:	44 8b 7c 24 04       	mov    0x4(%rsp),%r15d
41ee   942a2e:	44 89 ff             	mov    %r15d,%edi
41f1   942a31:	41 0f 45 fc          	cmovne %r12d,%edi
41f5   942a35:	48 0b 44 24 20       	or     0x20(%rsp),%rax
41fa   942a3a:	0f 85 37 59 00 00    	jne    948377 <___bpf_prog_run+0x9b37>
4200   942a40:	4c 8b 6c 24 30       	mov    0x30(%rsp),%r13
4205   942a45:	48 8d 3c ed 00 00 00 00 	lea    0x0(,%rbp,8),%rdi
420d   942a4d:	4c 01 ef             	add    %r13,%rdi
4210   942a50:	8b 07                	mov    (%rdi),%eax
4212   942a52:	89 44 24 18          	mov    %eax,0x18(%rsp)
4216   942a56:	e8 00 00 00 00       	call   942a5b <___bpf_prog_run+0x421b>	942a57: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
421b   942a5b:	4c 89 ed             	mov    %r13,%rbp
421e   942a5e:	44 8b 28             	mov    (%rax),%r13d
4221   942a61:	8b 02                	mov    (%rdx),%eax
4223   942a63:	89 44 24 08          	mov    %eax,0x8(%rsp)
4227   942a67:	48 c1 eb 04          	shr    $0x4,%rbx
422b   942a6b:	49 c1 ee 04          	shr    $0x4,%r14
422f   942a6f:	48 85 db             	test   %rbx,%rbx
4232   942a72:	45 0f 44 e7          	cmove  %r15d,%r12d
4236   942a76:	48 0b 5c 24 20       	or     0x20(%rsp),%rbx
423b   942a7b:	0f 85 00 59 00 00    	jne    948381 <___bpf_prog_run+0x9b41>
4241   942a81:	4a 8d 3c f5 00 00 00 00 	lea    0x0(,%r14,8),%rdi
4249   942a89:	48 01 ef             	add    %rbp,%rdi
424c   942a8c:	8b 1f                	mov    (%rdi),%ebx
424e   942a8e:	e8 00 00 00 00       	call   942a93 <___bpf_prog_run+0x4253>	942a8f: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
4253   942a93:	8b 00                	mov    (%rax),%eax
4255   942a95:	85 c0                	test   %eax,%eax
4257   942a97:	74 06                	je     942a9f <___bpf_prog_run+0x425f>
4259   942a99:	8b 0a                	mov    (%rdx),%ecx
425b   942a9b:	89 4c 24 08          	mov    %ecx,0x8(%rsp)
425f   942a9f:	41 09 c5             	or     %eax,%r13d
4262   942aa2:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
4267   942aa7:	0f 85 e1 58 00 00    	jne    94838e <___bpf_prog_run+0x9b4e>
426d   942aad:	39 5c 24 18          	cmp    %ebx,0x18(%rsp)
4271   942ab1:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
4276   942ab6:	0f 86 2b 28 00 00    	jbe    9452e7 <___bpf_prog_run+0x6aa7>
427c   942abc:	e8 00 00 00 00       	call   942ac1 <___bpf_prog_run+0x4281>	942abd: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4281   942ac1:	49 8d 5d 02          	lea    0x2(%r13),%rbx
4285   942ac5:	4d 85 f6             	test   %r14,%r14
4288   942ac8:	0f 84 ee 59 00 00    	je     9484bc <___bpf_prog_run+0x9c7c>
428e   942ace:	8b 3c 24             	mov    (%rsp),%edi
4291   942ad1:	e8 00 00 00 00       	call   942ad6 <___bpf_prog_run+0x4296>	942ad2: R_X86_64_PLT32	__msan_warning-0x4
4296   942ad6:	e9 e1 59 00 00       	jmp    9484bc <___bpf_prog_run+0x9c7c>
429b   942adb:	49 8d 5d 01          	lea    0x1(%r13),%rbx
429f   942adf:	4d 85 f6             	test   %r14,%r14
42a2   942ae2:	0f 85 b4 58 00 00    	jne    94839c <___bpf_prog_run+0x9b5c>
42a8   942ae8:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
42ad   942aed:	44 0f b6 33          	movzbl (%rbx),%r14d
42b1   942af1:	48 89 df             	mov    %rbx,%rdi
42b4   942af4:	e8 00 00 00 00       	call   942af9 <___bpf_prog_run+0x42b9>	942af5: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
42b9   942af9:	0f b6 28             	movzbl (%rax),%ebp
42bc   942afc:	44 8b 22             	mov    (%rdx),%r12d
42bf   942aff:	89 e8                	mov    %ebp,%eax
42c1   942b01:	83 e0 0f             	and    $0xf,%eax
42c4   942b04:	44 89 f3             	mov    %r14d,%ebx
42c7   942b07:	83 e3 0f             	and    $0xf,%ebx
42ca   942b0a:	48 85 c0             	test   %rax,%rax
42cd   942b0d:	44 8b 7c 24 04       	mov    0x4(%rsp),%r15d
42d2   942b12:	44 89 ff             	mov    %r15d,%edi
42d5   942b15:	41 0f 45 fc          	cmovne %r12d,%edi
42d9   942b19:	48 0b 44 24 20       	or     0x20(%rsp),%rax
42de   942b1e:	0f 85 85 58 00 00    	jne    9483a9 <___bpf_prog_run+0x9b69>
42e4   942b24:	4c 8b 6c 24 30       	mov    0x30(%rsp),%r13
42e9   942b29:	48 8d 3c dd 00 00 00 00 	lea    0x0(,%rbx,8),%rdi
42f1   942b31:	4c 01 ef             	add    %r13,%rdi
42f4   942b34:	48 8b 07             	mov    (%rdi),%rax
42f7   942b37:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
42fc   942b3c:	e8 00 00 00 00       	call   942b41 <___bpf_prog_run+0x4301>	942b3d: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
4301   942b41:	48 8b 18             	mov    (%rax),%rbx
4304   942b44:	8b 02                	mov    (%rdx),%eax
4306   942b46:	89 44 24 08          	mov    %eax,0x8(%rsp)
430a   942b4a:	48 c1 ed 04          	shr    $0x4,%rbp
430e   942b4e:	49 c1 ee 04          	shr    $0x4,%r14
4312   942b52:	48 85 ed             	test   %rbp,%rbp
4315   942b55:	45 0f 44 e7          	cmove  %r15d,%r12d
4319   942b59:	48 0b 6c 24 20       	or     0x20(%rsp),%rbp
431e   942b5e:	0f 85 4f 58 00 00    	jne    9483b3 <___bpf_prog_run+0x9b73>
4324   942b64:	4a 8d 3c f5 00 00 00 00 	lea    0x0(,%r14,8),%rdi
432c   942b6c:	4c 01 ef             	add    %r13,%rdi
432f   942b6f:	4c 8b 3f             	mov    (%rdi),%r15
4332   942b72:	e8 00 00 00 00       	call   942b77 <___bpf_prog_run+0x4337>	942b73: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
4337   942b77:	48 8b 00             	mov    (%rax),%rax
433a   942b7a:	48 09 c3             	or     %rax,%rbx
433d   942b7d:	48 85 c0             	test   %rax,%rax
4340   942b80:	74 06                	je     942b88 <___bpf_prog_run+0x4348>
4342   942b82:	8b 02                	mov    (%rdx),%eax
4344   942b84:	89 44 24 08          	mov    %eax,0x8(%rsp)
4348   942b88:	48 85 db             	test   %rbx,%rbx
434b   942b8b:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
4350   942b90:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
4355   942b95:	48 8b 6c 24 18       	mov    0x18(%rsp),%rbp
435a   942b9a:	74 12                	je     942bae <___bpf_prog_run+0x436e>
435c   942b9c:	48 89 e8             	mov    %rbp,%rax
435f   942b9f:	4c 31 f8             	xor    %r15,%rax
4362   942ba2:	48 f7 d3             	not    %rbx
4365   942ba5:	48 21 c3             	and    %rax,%rbx
4368   942ba8:	0f 84 12 58 00 00    	je     9483c0 <___bpf_prog_run+0x9b80>
436e   942bae:	4c 39 fd             	cmp    %r15,%rbp
4371   942bb1:	0f 85 1b 58 00 00    	jne    9483d2 <___bpf_prog_run+0x9b92>
4377   942bb7:	e8 00 00 00 00       	call   942bbc <___bpf_prog_run+0x437c>	942bb8: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
437c   942bbc:	49 8d 5d 02          	lea    0x2(%r13),%rbx
4380   942bc0:	4d 85 f6             	test   %r14,%r14
4383   942bc3:	0f 84 f2 5b 00 00    	je     9487bb <___bpf_prog_run+0x9f7b>
4389   942bc9:	8b 3c 24             	mov    (%rsp),%edi
438c   942bcc:	e8 00 00 00 00       	call   942bd1 <___bpf_prog_run+0x4391>	942bcd: R_X86_64_PLT32	__msan_warning-0x4
4391   942bd1:	e9 e5 5b 00 00       	jmp    9487bb <___bpf_prog_run+0x9f7b>
4396   942bd6:	49 8d 5d 01          	lea    0x1(%r13),%rbx
439a   942bda:	4d 85 f6             	test   %r14,%r14
439d   942bdd:	0f 85 fd 57 00 00    	jne    9483e0 <___bpf_prog_run+0x9ba0>
43a3   942be3:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
43a8   942be8:	44 0f b6 33          	movzbl (%rbx),%r14d
43ac   942bec:	48 89 df             	mov    %rbx,%rdi
43af   942bef:	e8 00 00 00 00       	call   942bf4 <___bpf_prog_run+0x43b4>	942bf0: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
43b4   942bf4:	0f b6 28             	movzbl (%rax),%ebp
43b7   942bf7:	44 8b 22             	mov    (%rdx),%r12d
43ba   942bfa:	89 e8                	mov    %ebp,%eax
43bc   942bfc:	83 e0 0f             	and    $0xf,%eax
43bf   942bff:	44 89 f3             	mov    %r14d,%ebx
43c2   942c02:	83 e3 0f             	and    $0xf,%ebx
43c5   942c05:	48 85 c0             	test   %rax,%rax
43c8   942c08:	44 8b 7c 24 04       	mov    0x4(%rsp),%r15d
43cd   942c0d:	44 89 ff             	mov    %r15d,%edi
43d0   942c10:	41 0f 45 fc          	cmovne %r12d,%edi
43d4   942c14:	48 0b 44 24 20       	or     0x20(%rsp),%rax
43d9   942c19:	0f 85 ce 57 00 00    	jne    9483ed <___bpf_prog_run+0x9bad>
43df   942c1f:	4c 8b 6c 24 30       	mov    0x30(%rsp),%r13
43e4   942c24:	48 8d 3c dd 00 00 00 00 	lea    0x0(,%rbx,8),%rdi
43ec   942c2c:	4c 01 ef             	add    %r13,%rdi
43ef   942c2f:	8b 07                	mov    (%rdi),%eax
43f1   942c31:	89 44 24 18          	mov    %eax,0x18(%rsp)
43f5   942c35:	e8 00 00 00 00       	call   942c3a <___bpf_prog_run+0x43fa>	942c36: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
43fa   942c3a:	8b 18                	mov    (%rax),%ebx
43fc   942c3c:	8b 02                	mov    (%rdx),%eax
43fe   942c3e:	89 44 24 08          	mov    %eax,0x8(%rsp)
4402   942c42:	48 c1 ed 04          	shr    $0x4,%rbp
4406   942c46:	49 c1 ee 04          	shr    $0x4,%r14
440a   942c4a:	48 85 ed             	test   %rbp,%rbp
440d   942c4d:	45 0f 44 e7          	cmove  %r15d,%r12d
4411   942c51:	48 0b 6c 24 20       	or     0x20(%rsp),%rbp
4416   942c56:	0f 85 9b 57 00 00    	jne    9483f7 <___bpf_prog_run+0x9bb7>
441c   942c5c:	4a 8d 3c f5 00 00 00 00 	lea    0x0(,%r14,8),%rdi
4424   942c64:	4c 01 ef             	add    %r13,%rdi
4427   942c67:	44 8b 3f             	mov    (%rdi),%r15d
442a   942c6a:	e8 00 00 00 00       	call   942c6f <___bpf_prog_run+0x442f>	942c6b: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
442f   942c6f:	8b 00                	mov    (%rax),%eax
4431   942c71:	09 c3                	or     %eax,%ebx
4433   942c73:	85 c0                	test   %eax,%eax
4435   942c75:	74 06                	je     942c7d <___bpf_prog_run+0x443d>
4437   942c77:	8b 02                	mov    (%rdx),%eax
4439   942c79:	89 44 24 08          	mov    %eax,0x8(%rsp)
443d   942c7d:	85 db                	test   %ebx,%ebx
443f   942c7f:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
4444   942c84:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
4449   942c89:	8b 6c 24 18          	mov    0x18(%rsp),%ebp
444d   942c8d:	74 0f                	je     942c9e <___bpf_prog_run+0x445e>
444f   942c8f:	89 e8                	mov    %ebp,%eax
4451   942c91:	44 31 f8             	xor    %r15d,%eax
4454   942c94:	f7 d3                	not    %ebx
4456   942c96:	21 c3                	and    %eax,%ebx
4458   942c98:	0f 84 66 57 00 00    	je     948404 <___bpf_prog_run+0x9bc4>
445e   942c9e:	44 39 fd             	cmp    %r15d,%ebp
4461   942ca1:	0f 85 6f 57 00 00    	jne    948416 <___bpf_prog_run+0x9bd6>
4467   942ca7:	e8 00 00 00 00       	call   942cac <___bpf_prog_run+0x446c>	942ca8: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
446c   942cac:	49 8d 5d 02          	lea    0x2(%r13),%rbx
4470   942cb0:	4d 85 f6             	test   %r14,%r14
4473   942cb3:	0f 84 02 5b 00 00    	je     9487bb <___bpf_prog_run+0x9f7b>
4479   942cb9:	8b 3c 24             	mov    (%rsp),%edi
447c   942cbc:	e8 00 00 00 00       	call   942cc1 <___bpf_prog_run+0x4481>	942cbd: R_X86_64_PLT32	__msan_warning-0x4
4481   942cc1:	e9 f5 5a 00 00       	jmp    9487bb <___bpf_prog_run+0x9f7b>
4486   942cc6:	49 8d 5d 01          	lea    0x1(%r13),%rbx
448a   942cca:	4d 85 f6             	test   %r14,%r14
448d   942ccd:	0f 85 51 57 00 00    	jne    948424 <___bpf_prog_run+0x9be4>
4493   942cd3:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
4498   942cd8:	44 0f b6 33          	movzbl (%rbx),%r14d
449c   942cdc:	48 89 df             	mov    %rbx,%rdi
449f   942cdf:	e8 00 00 00 00       	call   942ce4 <___bpf_prog_run+0x44a4>	942ce0: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
44a4   942ce4:	0f b6 18             	movzbl (%rax),%ebx
44a7   942ce7:	44 8b 22             	mov    (%rdx),%r12d
44aa   942cea:	89 d8                	mov    %ebx,%eax
44ac   942cec:	83 e0 0f             	and    $0xf,%eax
44af   942cef:	44 89 f5             	mov    %r14d,%ebp
44b2   942cf2:	83 e5 0f             	and    $0xf,%ebp
44b5   942cf5:	48 85 c0             	test   %rax,%rax
44b8   942cf8:	44 8b 7c 24 04       	mov    0x4(%rsp),%r15d
44bd   942cfd:	44 89 ff             	mov    %r15d,%edi
44c0   942d00:	41 0f 45 fc          	cmovne %r12d,%edi
44c4   942d04:	48 0b 44 24 20       	or     0x20(%rsp),%rax
44c9   942d09:	0f 85 22 57 00 00    	jne    948431 <___bpf_prog_run+0x9bf1>
44cf   942d0f:	4c 8b 6c 24 30       	mov    0x30(%rsp),%r13
44d4   942d14:	48 8d 3c ed 00 00 00 00 	lea    0x0(,%rbp,8),%rdi
44dc   942d1c:	4c 01 ef             	add    %r13,%rdi
44df   942d1f:	48 8b 07             	mov    (%rdi),%rax
44e2   942d22:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
44e7   942d27:	e8 00 00 00 00       	call   942d2c <___bpf_prog_run+0x44ec>	942d28: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
44ec   942d2c:	4c 89 ed             	mov    %r13,%rbp
44ef   942d2f:	4c 8b 28             	mov    (%rax),%r13
44f2   942d32:	8b 02                	mov    (%rdx),%eax
44f4   942d34:	89 44 24 08          	mov    %eax,0x8(%rsp)
44f8   942d38:	48 c1 eb 04          	shr    $0x4,%rbx
44fc   942d3c:	49 c1 ee 04          	shr    $0x4,%r14
4500   942d40:	48 85 db             	test   %rbx,%rbx
4503   942d43:	45 0f 44 e7          	cmove  %r15d,%r12d
4507   942d47:	48 0b 5c 24 20       	or     0x20(%rsp),%rbx
450c   942d4c:	0f 85 e9 56 00 00    	jne    94843b <___bpf_prog_run+0x9bfb>
4512   942d52:	4a 8d 3c f5 00 00 00 00 	lea    0x0(,%r14,8),%rdi
451a   942d5a:	48 01 ef             	add    %rbp,%rdi
451d   942d5d:	48 8b 1f             	mov    (%rdi),%rbx
4520   942d60:	e8 00 00 00 00       	call   942d65 <___bpf_prog_run+0x4525>	942d61: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
4525   942d65:	48 8b 00             	mov    (%rax),%rax
4528   942d68:	48 85 c0             	test   %rax,%rax
452b   942d6b:	74 06                	je     942d73 <___bpf_prog_run+0x4533>
452d   942d6d:	8b 0a                	mov    (%rdx),%ecx
452f   942d6f:	89 4c 24 08          	mov    %ecx,0x8(%rsp)
4533   942d73:	49 09 c5             	or     %rax,%r13
4536   942d76:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
453b   942d7b:	0f 85 c7 56 00 00    	jne    948448 <___bpf_prog_run+0x9c08>
4541   942d81:	48 39 5c 24 18       	cmp    %rbx,0x18(%rsp)
4546   942d86:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
454b   942d8b:	0f 86 64 25 00 00    	jbe    9452f5 <___bpf_prog_run+0x6ab5>
4551   942d91:	e8 00 00 00 00       	call   942d96 <___bpf_prog_run+0x4556>	942d92: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4556   942d96:	49 83 c5 08          	add    $0x8,%r13
455a   942d9a:	e9 60 bb ff ff       	jmp    93e8ff <___bpf_prog_run+0xbf>
455f   942d9f:	e8 00 00 00 00       	call   942da4 <___bpf_prog_run+0x4564>	942da0: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4564   942da4:	49 8d 5d 04          	lea    0x4(%r13),%rbx
4568   942da8:	4d 85 f6             	test   %r14,%r14
456b   942dab:	4c 89 f5             	mov    %r14,%rbp
456e   942dae:	0f 85 a2 56 00 00    	jne    948456 <___bpf_prog_run+0x9c16>
4574   942db4:	4d 63 7d 04          	movslq 0x4(%r13),%r15
4578   942db8:	48 89 df             	mov    %rbx,%rdi
457b   942dbb:	e8 00 00 00 00       	call   942dc0 <___bpf_prog_run+0x4580>	942dbc: R_X86_64_PLT32	__msan_metadata_ptr_for_load_4-0x4
4580   942dc0:	49 8d 5d 01          	lea    0x1(%r13),%rbx
4584   942dc4:	4c 63 20             	movslq (%rax),%r12
4587   942dc7:	44 8b 32             	mov    (%rdx),%r14d
458a   942dca:	48 85 ed             	test   %rbp,%rbp
458d   942dcd:	0f 85 90 56 00 00    	jne    948463 <___bpf_prog_run+0x9c23>
4593   942dd3:	0f b6 2b             	movzbl (%rbx),%ebp
4596   942dd6:	48 89 df             	mov    %rbx,%rdi
4599   942dd9:	e8 00 00 00 00       	call   942dde <___bpf_prog_run+0x459e>	942dda: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
459e   942dde:	0f b6 00             	movzbl (%rax),%eax
45a1   942de1:	83 e0 0f             	and    $0xf,%eax
45a4   942de4:	8b 7c 24 04          	mov    0x4(%rsp),%edi
45a8   942de8:	48 85 c0             	test   %rax,%rax
45ab   942deb:	74 02                	je     942def <___bpf_prog_run+0x45af>
45ad   942ded:	8b 3a                	mov    (%rdx),%edi
45af   942def:	83 e5 0f             	and    $0xf,%ebp
45b2   942df2:	48 0b 44 24 20       	or     0x20(%rsp),%rax
45b7   942df7:	0f 84 c7 17 00 00    	je     9445c4 <___bpf_prog_run+0x5d84>
45bd   942dfd:	e8 00 00 00 00       	call   942e02 <___bpf_prog_run+0x45c2>	942dfe: R_X86_64_PLT32	__msan_warning-0x4
45c2   942e02:	e9 bd 17 00 00       	jmp    9445c4 <___bpf_prog_run+0x5d84>
45c7   942e07:	49 8d 5d 01          	lea    0x1(%r13),%rbx
45cb   942e0b:	4d 85 f6             	test   %r14,%r14
45ce   942e0e:	0f 85 5c 56 00 00    	jne    948470 <___bpf_prog_run+0x9c30>
45d4   942e14:	0f b6 2b             	movzbl (%rbx),%ebp
45d7   942e17:	48 89 df             	mov    %rbx,%rdi
45da   942e1a:	e8 00 00 00 00       	call   942e1f <___bpf_prog_run+0x45df>	942e1b: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
45df   942e1f:	0f b6 00             	movzbl (%rax),%eax
45e2   942e22:	83 e0 0f             	and    $0xf,%eax
45e5   942e25:	8b 7c 24 04          	mov    0x4(%rsp),%edi
45e9   942e29:	48 85 c0             	test   %rax,%rax
45ec   942e2c:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
45f1   942e31:	74 02                	je     942e35 <___bpf_prog_run+0x45f5>
45f3   942e33:	8b 3a                	mov    (%rdx),%edi
45f5   942e35:	83 e5 0f             	and    $0xf,%ebp
45f8   942e38:	48 09 c8             	or     %rcx,%rax
45fb   942e3b:	0f 85 3c 56 00 00    	jne    94847d <___bpf_prog_run+0x9c3d>
4601   942e41:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
4606   942e46:	48 8d 3c e8          	lea    (%rax,%rbp,8),%rdi
460a   942e4a:	44 8b 3f             	mov    (%rdi),%r15d
460d   942e4d:	e8 00 00 00 00       	call   942e52 <___bpf_prog_run+0x4612>	942e4e: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
4612   942e52:	49 8d 6d 04          	lea    0x4(%r13),%rbp
4616   942e56:	8b 18                	mov    (%rax),%ebx
4618   942e58:	44 8b 32             	mov    (%rdx),%r14d
461b   942e5b:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
4621   942e61:	0f 85 20 56 00 00    	jne    948487 <___bpf_prog_run+0x9c47>
4627   942e67:	44 8b 65 00          	mov    0x0(%rbp),%r12d
462b   942e6b:	48 89 ef             	mov    %rbp,%rdi
462e   942e6e:	e8 00 00 00 00       	call   942e73 <___bpf_prog_run+0x4633>	942e6f: R_X86_64_PLT32	__msan_metadata_ptr_for_load_4-0x4
4633   942e73:	8b 00                	mov    (%rax),%eax
4635   942e75:	09 d8                	or     %ebx,%eax
4637   942e77:	85 db                	test   %ebx,%ebx
4639   942e79:	75 03                	jne    942e7e <___bpf_prog_run+0x463e>
463b   942e7b:	44 8b 32             	mov    (%rdx),%r14d
463e   942e7e:	85 c0                	test   %eax,%eax
4640   942e80:	74 10                	je     942e92 <___bpf_prog_run+0x4652>
4642   942e82:	44 89 e1             	mov    %r12d,%ecx
4645   942e85:	44 31 f9             	xor    %r15d,%ecx
4648   942e88:	f7 d0                	not    %eax
464a   942e8a:	21 c8                	and    %ecx,%eax
464c   942e8c:	0f 84 02 56 00 00    	je     948494 <___bpf_prog_run+0x9c54>
4652   942e92:	45 39 fc             	cmp    %r15d,%r12d
4655   942e95:	0f 85 0a 56 00 00    	jne    9484a5 <___bpf_prog_run+0x9c65>
465b   942e9b:	e8 00 00 00 00       	call   942ea0 <___bpf_prog_run+0x4660>	942e9c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4660   942ea0:	e9 51 ba ff ff       	jmp    93e8f6 <___bpf_prog_run+0xb6>
4665   942ea5:	49 8d 5d 01          	lea    0x1(%r13),%rbx
4669   942ea9:	4d 85 f6             	test   %r14,%r14
466c   942eac:	0f 85 32 56 00 00    	jne    9484e4 <___bpf_prog_run+0x9ca4>
4672   942eb2:	44 0f b6 33          	movzbl (%rbx),%r14d
4676   942eb6:	48 89 df             	mov    %rbx,%rdi
4679   942eb9:	e8 00 00 00 00       	call   942ebe <___bpf_prog_run+0x467e>	942eba: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
467e   942ebe:	44 0f b6 20          	movzbl (%rax),%r12d
4682   942ec2:	8b 02                	mov    (%rdx),%eax
4684   942ec4:	41 83 e4 0f          	and    $0xf,%r12d
4688   942ec8:	41 83 e6 0f          	and    $0xf,%r14d
468c   942ecc:	4d 85 e4             	test   %r12,%r12
468f   942ecf:	8b 7c 24 04          	mov    0x4(%rsp),%edi
4693   942ed3:	89 44 24 38          	mov    %eax,0x38(%rsp)
4697   942ed7:	0f 45 f8             	cmovne %eax,%edi
469a   942eda:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
469f   942edf:	4c 09 e0             	or     %r12,%rax
46a2   942ee2:	0f 85 09 56 00 00    	jne    9484f1 <___bpf_prog_run+0x9cb1>
46a8   942ee8:	48 89 5c 24 40       	mov    %rbx,0x40(%rsp)
46ad   942eed:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
46b2   942ef2:	4a 8d 3c f0          	lea    (%rax,%r14,8),%rdi
46b6   942ef6:	48 8b 07             	mov    (%rdi),%rax
46b9   942ef9:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
46be   942efe:	e8 00 00 00 00       	call   942f03 <___bpf_prog_run+0x46c3>	942eff: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
46c3   942f03:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
46c8   942f08:	49 8d 6d 04          	lea    0x4(%r13),%rbp
46cc   942f0c:	44 8b 38             	mov    (%rax),%r15d
46cf   942f0f:	8b 02                	mov    (%rdx),%eax
46d1   942f11:	89 44 24 08          	mov    %eax,0x8(%rsp)
46d5   942f15:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
46db   942f1b:	0f 85 da 55 00 00    	jne    9484fb <___bpf_prog_run+0x9cbb>
46e1   942f21:	8b 5d 00             	mov    0x0(%rbp),%ebx
46e4   942f24:	48 89 ef             	mov    %rbp,%rdi
46e7   942f27:	e8 00 00 00 00       	call   942f2c <___bpf_prog_run+0x46ec>	942f28: R_X86_64_PLT32	__msan_metadata_ptr_for_load_4-0x4
46ec   942f2c:	8b 28                	mov    (%rax),%ebp
46ee   942f2e:	44 8b 2a             	mov    (%rdx),%r13d
46f1   942f31:	48 83 fb 1f          	cmp    $0x1f,%rbx
46f5   942f35:	0f 87 5a 6a 00 00    	ja     949995 <___bpf_prog_run+0xb155>
46fb   942f3b:	e8 00 00 00 00       	call   942f40 <___bpf_prog_run+0x4700>	942f3c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4700   942f40:	31 c0                	xor    %eax,%eax
4702   942f42:	85 ed                	test   %ebp,%ebp
4704   942f44:	0f 95 c0             	setne  %al
4707   942f47:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
470b   942f4b:	41 0f 45 cd          	cmovne %r13d,%ecx
470f   942f4f:	89 4c 24 08          	mov    %ecx,0x8(%rsp)
4713   942f53:	f7 d8                	neg    %eax
4715   942f55:	89 d9                	mov    %ebx,%ecx
4717   942f57:	41 d3 ff             	sar    %cl,%r15d
471a   942f5a:	41 09 c7             	or     %eax,%r15d
471d   942f5d:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
4722   942f62:	d3 f8                	sar    %cl,%eax
4724   942f64:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
4729   942f69:	4d 85 e4             	test   %r12,%r12
472c   942f6c:	8b 7c 24 38          	mov    0x38(%rsp),%edi
4730   942f70:	0f 44 7c 24 04       	cmove  0x4(%rsp),%edi
4735   942f75:	4c 0b 64 24 20       	or     0x20(%rsp),%r12
473a   942f7a:	0f 84 3e 1b 00 00    	je     944abe <___bpf_prog_run+0x627e>
4740   942f80:	e8 00 00 00 00       	call   942f85 <___bpf_prog_run+0x4745>	942f81: R_X86_64_PLT32	__msan_warning-0x4
4745   942f85:	e9 34 1b 00 00       	jmp    944abe <___bpf_prog_run+0x627e>
474a   942f8a:	e8 00 00 00 00       	call   942f8f <___bpf_prog_run+0x474f>	942f8b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
474f   942f8f:	49 8d 5d 01          	lea    0x1(%r13),%rbx
4753   942f93:	4d 85 f6             	test   %r14,%r14
4756   942f96:	0f 85 6c 55 00 00    	jne    948508 <___bpf_prog_run+0x9cc8>
475c   942f9c:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
4761   942fa1:	44 0f b6 33          	movzbl (%rbx),%r14d
4765   942fa5:	48 89 df             	mov    %rbx,%rdi
4768   942fa8:	e8 00 00 00 00       	call   942fad <___bpf_prog_run+0x476d>	942fa9: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
476d   942fad:	0f b6 28             	movzbl (%rax),%ebp
4770   942fb0:	44 8b 22             	mov    (%rdx),%r12d
4773   942fb3:	48 89 e8             	mov    %rbp,%rax
4776   942fb6:	48 c1 e8 04          	shr    $0x4,%rax
477a   942fba:	4c 89 f3             	mov    %r14,%rbx
477d   942fbd:	48 c1 eb 04          	shr    $0x4,%rbx
4781   942fc1:	48 85 c0             	test   %rax,%rax
4784   942fc4:	8b 7c 24 04          	mov    0x4(%rsp),%edi
4788   942fc8:	41 0f 45 fc          	cmovne %r12d,%edi
478c   942fcc:	4c 8b 7c 24 20       	mov    0x20(%rsp),%r15
4791   942fd1:	4c 09 f8             	or     %r15,%rax
4794   942fd4:	0f 85 3b 55 00 00    	jne    948515 <___bpf_prog_run+0x9cd5>
479a   942fda:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
479f   942fdf:	48 8d 3c d8          	lea    (%rax,%rbx,8),%rdi
47a3   942fe3:	48 89 c3             	mov    %rax,%rbx
47a6   942fe6:	4c 8b 2f             	mov    (%rdi),%r13
47a9   942fe9:	e8 00 00 00 00       	call   942fee <___bpf_prog_run+0x47ae>	942fea: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
47ae   942fee:	48 8b 00             	mov    (%rax),%rax
47b1   942ff1:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
47b6   942ff6:	8b 02                	mov    (%rdx),%eax
47b8   942ff8:	89 44 24 08          	mov    %eax,0x8(%rsp)
47bc   942ffc:	83 e5 0f             	and    $0xf,%ebp
47bf   942fff:	41 83 e6 0f          	and    $0xf,%r14d
47c3   943003:	48 85 ed             	test   %rbp,%rbp
47c6   943006:	44 0f 44 64 24 04    	cmove  0x4(%rsp),%r12d
47cc   94300c:	4c 09 fd             	or     %r15,%rbp
47cf   94300f:	0f 85 0a 55 00 00    	jne    94851f <___bpf_prog_run+0x9cdf>
47d5   943015:	45 89 e7             	mov    %r12d,%r15d
47d8   943018:	41 83 e5 3f          	and    $0x3f,%r13d
47dc   94301c:	4e 8d 24 f3          	lea    (%rbx,%r14,8),%r12
47e0   943020:	4d 8b 34 24          	mov    (%r12),%r14
47e4   943024:	4c 89 e7             	mov    %r12,%rdi
47e7   943027:	e8 00 00 00 00       	call   94302c <___bpf_prog_run+0x47ec>	943028: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
47ec   94302c:	48 8b 18             	mov    (%rax),%rbx
47ef   94302f:	31 c0                	xor    %eax,%eax
47f1   943031:	f6 44 24 18 3f       	testb  $0x3f,0x18(%rsp)
47f6   943036:	0f 95 c1             	setne  %cl
47f9   943039:	75 06                	jne    943041 <___bpf_prog_run+0x4801>
47fb   94303b:	8b 12                	mov    (%rdx),%edx
47fd   94303d:	89 54 24 08          	mov    %edx,0x8(%rsp)
4801   943041:	88 c8                	mov    %cl,%al
4803   943043:	48 f7 d8             	neg    %rax
4806   943046:	44 89 e9             	mov    %r13d,%ecx
4809   943049:	48 d3 eb             	shr    %cl,%rbx
480c   94304c:	48 09 c3             	or     %rax,%rbx
480f   94304f:	49 d3 ee             	shr    %cl,%r14
4812   943052:	48 85 ed             	test   %rbp,%rbp
4815   943055:	0f 84 b6 11 00 00    	je     944211 <___bpf_prog_run+0x59d1>
481b   94305b:	44 89 ff             	mov    %r15d,%edi
481e   94305e:	e8 00 00 00 00       	call   943063 <___bpf_prog_run+0x4823>	94305f: R_X86_64_PLT32	__msan_warning-0x4
4823   943063:	e9 a9 11 00 00       	jmp    944211 <___bpf_prog_run+0x59d1>
4828   943068:	49 8d 5d 01          	lea    0x1(%r13),%rbx
482c   94306c:	4d 85 f6             	test   %r14,%r14
482f   94306f:	0f 85 b7 54 00 00    	jne    94852c <___bpf_prog_run+0x9cec>
4835   943075:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
483a   94307a:	44 0f b6 33          	movzbl (%rbx),%r14d
483e   94307e:	48 89 df             	mov    %rbx,%rdi
4841   943081:	e8 00 00 00 00       	call   943086 <___bpf_prog_run+0x4846>	943082: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
4846   943086:	0f b6 18             	movzbl (%rax),%ebx
4849   943089:	44 8b 22             	mov    (%rdx),%r12d
484c   94308c:	89 d8                	mov    %ebx,%eax
484e   94308e:	83 e0 0f             	and    $0xf,%eax
4851   943091:	44 89 f5             	mov    %r14d,%ebp
4854   943094:	83 e5 0f             	and    $0xf,%ebp
4857   943097:	48 85 c0             	test   %rax,%rax
485a   94309a:	44 8b 7c 24 04       	mov    0x4(%rsp),%r15d
485f   94309f:	44 89 ff             	mov    %r15d,%edi
4862   9430a2:	41 0f 45 fc          	cmovne %r12d,%edi
4866   9430a6:	48 0b 44 24 20       	or     0x20(%rsp),%rax
486b   9430ab:	0f 85 88 54 00 00    	jne    948539 <___bpf_prog_run+0x9cf9>
4871   9430b1:	4c 8b 6c 24 30       	mov    0x30(%rsp),%r13
4876   9430b6:	48 8d 3c ed 00 00 00 00 	lea    0x0(,%rbp,8),%rdi
487e   9430be:	4c 01 ef             	add    %r13,%rdi
4881   9430c1:	8b 07                	mov    (%rdi),%eax
4883   9430c3:	89 44 24 18          	mov    %eax,0x18(%rsp)
4887   9430c7:	e8 00 00 00 00       	call   9430cc <___bpf_prog_run+0x488c>	9430c8: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
488c   9430cc:	4c 89 ed             	mov    %r13,%rbp
488f   9430cf:	44 8b 28             	mov    (%rax),%r13d
4892   9430d2:	8b 02                	mov    (%rdx),%eax
4894   9430d4:	89 44 24 08          	mov    %eax,0x8(%rsp)
4898   9430d8:	48 c1 eb 04          	shr    $0x4,%rbx
489c   9430dc:	49 c1 ee 04          	shr    $0x4,%r14
48a0   9430e0:	48 85 db             	test   %rbx,%rbx
48a3   9430e3:	45 0f 44 e7          	cmove  %r15d,%r12d
48a7   9430e7:	48 0b 5c 24 20       	or     0x20(%rsp),%rbx
48ac   9430ec:	0f 85 51 54 00 00    	jne    948543 <___bpf_prog_run+0x9d03>
48b2   9430f2:	4a 8d 3c f5 00 00 00 00 	lea    0x0(,%r14,8),%rdi
48ba   9430fa:	48 01 ef             	add    %rbp,%rdi
48bd   9430fd:	8b 1f                	mov    (%rdi),%ebx
48bf   9430ff:	e8 00 00 00 00       	call   943104 <___bpf_prog_run+0x48c4>	943100: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
48c4   943104:	8b 00                	mov    (%rax),%eax
48c6   943106:	85 c0                	test   %eax,%eax
48c8   943108:	74 06                	je     943110 <___bpf_prog_run+0x48d0>
48ca   94310a:	8b 0a                	mov    (%rdx),%ecx
48cc   94310c:	89 4c 24 08          	mov    %ecx,0x8(%rsp)
48d0   943110:	41 09 c5             	or     %eax,%r13d
48d3   943113:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
48d8   943118:	0f 85 32 54 00 00    	jne    948550 <___bpf_prog_run+0x9d10>
48de   94311e:	39 5c 24 18          	cmp    %ebx,0x18(%rsp)
48e2   943122:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
48e7   943127:	0f 83 e7 21 00 00    	jae    945314 <___bpf_prog_run+0x6ad4>
48ed   94312d:	e8 00 00 00 00       	call   943132 <___bpf_prog_run+0x48f2>	94312e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
48f2   943132:	49 8d 5d 02          	lea    0x2(%r13),%rbx
48f6   943136:	4d 85 f6             	test   %r14,%r14
48f9   943139:	0f 84 7d 53 00 00    	je     9484bc <___bpf_prog_run+0x9c7c>
48ff   94313f:	8b 3c 24             	mov    (%rsp),%edi
4902   943142:	e8 00 00 00 00       	call   943147 <___bpf_prog_run+0x4907>	943143: R_X86_64_PLT32	__msan_warning-0x4
4907   943147:	e9 70 53 00 00       	jmp    9484bc <___bpf_prog_run+0x9c7c>
490c   94314c:	e8 00 00 00 00       	call   943151 <___bpf_prog_run+0x4911>	94314d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4911   943151:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
4916   943156:	49 83 c5 01          	add    $0x1,%r13
491a   94315a:	4d 85 f6             	test   %r14,%r14
491d   94315d:	0f 85 fb 53 00 00    	jne    94855e <___bpf_prog_run+0x9d1e>
4923   943163:	41 0f b6 5d 00       	movzbl 0x0(%r13),%ebx
4928   943168:	4c 89 ef             	mov    %r13,%rdi
492b   94316b:	e8 00 00 00 00       	call   943170 <___bpf_prog_run+0x4930>	94316c: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
4930   943170:	0f b6 00             	movzbl (%rax),%eax
4933   943173:	83 e0 0f             	and    $0xf,%eax
4936   943176:	8b 7c 24 04          	mov    0x4(%rsp),%edi
493a   94317a:	48 85 c0             	test   %rax,%rax
493d   94317d:	74 02                	je     943181 <___bpf_prog_run+0x4941>
493f   94317f:	8b 3a                	mov    (%rdx),%edi
4941   943181:	83 e3 0f             	and    $0xf,%ebx
4944   943184:	48 8b 6c 24 20       	mov    0x20(%rsp),%rbp
4949   943189:	48 09 e8             	or     %rbp,%rax
494c   94318c:	0f 85 d9 53 00 00    	jne    94856b <___bpf_prog_run+0x9d2b>
4952   943192:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
4957   943197:	48 8d 3c d8          	lea    (%rax,%rbx,8),%rdi
495b   94319b:	44 8b 3f             	mov    (%rdi),%r15d
495e   94319e:	e8 00 00 00 00       	call   9431a3 <___bpf_prog_run+0x4963>	94319f: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
4963   9431a3:	44 8b 20             	mov    (%rax),%r12d
4966   9431a6:	8b 02                	mov    (%rdx),%eax
4968   9431a8:	89 44 24 18          	mov    %eax,0x18(%rsp)
496c   9431ac:	48 85 ed             	test   %rbp,%rbp
496f   9431af:	0f 85 c0 53 00 00    	jne    948575 <___bpf_prog_run+0x9d35>
4975   9431b5:	48 8b 6c 24 60       	mov    0x60(%rsp),%rbp
497a   9431ba:	48 89 ef             	mov    %rbp,%rdi
497d   9431bd:	e8 00 00 00 00       	call   9431c2 <___bpf_prog_run+0x4982>	9431be: R_X86_64_PLT32	__msan_metadata_ptr_for_store_8-0x4
4982   9431c2:	4c 89 20             	mov    %r12,(%rax)
4985   9431c5:	4d 85 e4             	test   %r12,%r12
4988   9431c8:	0f 85 b5 53 00 00    	jne    948583 <___bpf_prog_run+0x9d43>
498e   9431ce:	4c 89 7d 00          	mov    %r15,0x0(%rbp)
4992   9431d2:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
4998   9431d8:	0f 85 c5 53 00 00    	jne    9485a3 <___bpf_prog_run+0x9d63>
499e   9431de:	41 0f b6 5d 00       	movzbl 0x0(%r13),%ebx
49a3   9431e3:	4c 89 ef             	mov    %r13,%rdi
49a6   9431e6:	e8 00 00 00 00       	call   9431eb <___bpf_prog_run+0x49ab>	9431e7: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
49ab   9431eb:	0f b6 00             	movzbl (%rax),%eax
49ae   9431ee:	48 c1 e8 04          	shr    $0x4,%rax
49b2   9431f2:	48 d1 eb             	shr    %rbx
49b5   9431f5:	83 e3 78             	and    $0x78,%ebx
49b8   9431f8:	8b 7c 24 04          	mov    0x4(%rsp),%edi
49bc   9431fc:	48 85 c0             	test   %rax,%rax
49bf   9431ff:	74 02                	je     943203 <___bpf_prog_run+0x49c3>
49c1   943201:	8b 3a                	mov    (%rdx),%edi
49c3   943203:	48 03 5c 24 30       	add    0x30(%rsp),%rbx
49c8   943208:	48 0b 44 24 20       	or     0x20(%rsp),%rax
49cd   94320d:	0f 85 9d 53 00 00    	jne    9485b0 <___bpf_prog_run+0x9d70>
49d3   943213:	8b 2b                	mov    (%rbx),%ebp
49d5   943215:	48 89 df             	mov    %rbx,%rdi
49d8   943218:	e8 00 00 00 00       	call   94321d <___bpf_prog_run+0x49dd>	943219: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
49dd   94321d:	83 38 00             	cmpl   $0x0,(%rax)
49e0   943220:	0f 85 94 53 00 00    	jne    9485ba <___bpf_prog_run+0x9d7a>
49e6   943226:	44 89 f8             	mov    %r15d,%eax
49e9   943229:	31 d2                	xor    %edx,%edx
49eb   94322b:	f7 f5                	div    %ebp
49ed   94322d:	41 89 c7             	mov    %eax,%r15d
49f0   943230:	48 83 7c 24 20 00    	cmpq   $0x0,0x20(%rsp)
49f6   943236:	0f 85 8a 53 00 00    	jne    9485c6 <___bpf_prog_run+0x9d86>
49fc   94323c:	45 89 e6             	mov    %r12d,%r14d
49ff   94323f:	48 8b 6c 24 60       	mov    0x60(%rsp),%rbp
4a04   943244:	48 89 ef             	mov    %rbp,%rdi
4a07   943247:	e8 00 00 00 00       	call   94324c <___bpf_prog_run+0x4a0c>	943248: R_X86_64_PLT32	__msan_metadata_ptr_for_store_8-0x4
4a0c   94324c:	4c 89 30             	mov    %r14,(%rax)
4a0f   94324f:	4d 85 f6             	test   %r14,%r14
4a12   943252:	0f 85 7c 53 00 00    	jne    9485d4 <___bpf_prog_run+0x9d94>
4a18   943258:	4c 89 7d 00          	mov    %r15,0x0(%rbp)
4a1c   94325c:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
4a22   943262:	0f 85 8d 53 00 00    	jne    9485f5 <___bpf_prog_run+0x9db5>
4a28   943268:	41 0f b6 6d 00       	movzbl 0x0(%r13),%ebp
4a2d   94326d:	4c 89 ef             	mov    %r13,%rdi
4a30   943270:	e8 00 00 00 00       	call   943275 <___bpf_prog_run+0x4a35>	943271: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
4a35   943275:	0f b6 00             	movzbl (%rax),%eax
4a38   943278:	83 e0 0f             	and    $0xf,%eax
4a3b   94327b:	8b 7c 24 04          	mov    0x4(%rsp),%edi
4a3f   94327f:	48 85 c0             	test   %rax,%rax
4a42   943282:	74 02                	je     943286 <___bpf_prog_run+0x4a46>
4a44   943284:	8b 3a                	mov    (%rdx),%edi
4a46   943286:	83 e5 0f             	and    $0xf,%ebp
4a49   943289:	48 0b 44 24 20       	or     0x20(%rsp),%rax
4a4e   94328e:	48 8b 5c 24 30       	mov    0x30(%rsp),%rbx
4a53   943293:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
4a58   943298:	0f 85 64 53 00 00    	jne    948602 <___bpf_prog_run+0x9dc2>
4a5e   94329e:	48 8d 2c eb          	lea    (%rbx,%rbp,8),%rbp
4a62   9432a2:	48 89 ef             	mov    %rbp,%rdi
4a65   9432a5:	e8 00 00 00 00       	call   9432aa <___bpf_prog_run+0x4a6a>	9432a6: R_X86_64_PLT32	__msan_metadata_ptr_for_store_8-0x4
4a6a   9432aa:	4c 89 30             	mov    %r14,(%rax)
4a6d   9432ad:	4d 85 f6             	test   %r14,%r14
4a70   9432b0:	0f 84 2b 13 00 00    	je     9445e1 <___bpf_prog_run+0x5da1>
4a76   9432b6:	49 89 d4             	mov    %rdx,%r12
4a79   9432b9:	8b 7c 24 18          	mov    0x18(%rsp),%edi
4a7d   9432bd:	e8 00 00 00 00       	call   9432c2 <___bpf_prog_run+0x4a82>	9432be: R_X86_64_PLT32	__msan_chain_origin-0x4
4a82   9432c2:	89 c0                	mov    %eax,%eax
4a84   9432c4:	48 89 c1             	mov    %rax,%rcx
4a87   9432c7:	48 c1 e1 20          	shl    $0x20,%rcx
4a8b   9432cb:	48 09 c1             	or     %rax,%rcx
4a8e   9432ce:	49 89 0c 24          	mov    %rcx,(%r12)
4a92   9432d2:	4c 89 7d 00          	mov    %r15,0x0(%rbp)
4a96   9432d6:	e9 1b b6 ff ff       	jmp    93e8f6 <___bpf_prog_run+0xb6>
4a9b   9432db:	e8 00 00 00 00       	call   9432e0 <___bpf_prog_run+0x4aa0>	9432dc: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4aa0   9432e0:	49 8d 5d 01          	lea    0x1(%r13),%rbx
4aa4   9432e4:	4d 85 f6             	test   %r14,%r14
4aa7   9432e7:	0f 85 1f 53 00 00    	jne    94860c <___bpf_prog_run+0x9dcc>
4aad   9432ed:	0f b6 2b             	movzbl (%rbx),%ebp
4ab0   9432f0:	48 89 df             	mov    %rbx,%rdi
4ab3   9432f3:	e8 00 00 00 00       	call   9432f8 <___bpf_prog_run+0x4ab8>	9432f4: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
4ab8   9432f8:	44 0f b6 30          	movzbl (%rax),%r14d
4abc   9432fc:	41 83 e6 0f          	and    $0xf,%r14d
4ac0   943300:	8b 5c 24 04          	mov    0x4(%rsp),%ebx
4ac4   943304:	4d 85 f6             	test   %r14,%r14
4ac7   943307:	74 02                	je     94330b <___bpf_prog_run+0x4acb>
4ac9   943309:	8b 1a                	mov    (%rdx),%ebx
4acb   94330b:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
4ad0   943310:	83 e5 0f             	and    $0xf,%ebp
4ad3   943313:	4c 0b 74 24 20       	or     0x20(%rsp),%r14
4ad8   943318:	0f 85 fb 52 00 00    	jne    948619 <___bpf_prog_run+0x9dd9>
4ade   94331e:	89 5c 24 08          	mov    %ebx,0x8(%rsp)
4ae2   943322:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
4ae7   943327:	4c 8d 2c e8          	lea    (%rax,%rbp,8),%r13
4aeb   94332b:	4d 8b 65 00          	mov    0x0(%r13),%r12
4aef   94332f:	4c 89 ef             	mov    %r13,%rdi
4af2   943332:	e8 00 00 00 00       	call   943337 <___bpf_prog_run+0x4af7>	943333: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
4af7   943337:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
4afc   94333c:	48 8d 69 04          	lea    0x4(%rcx),%rbp
4b00   943340:	48 8b 18             	mov    (%rax),%rbx
4b03   943343:	8b 02                	mov    (%rdx),%eax
4b05   943345:	89 44 24 18          	mov    %eax,0x18(%rsp)
4b09   943349:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
4b0f   94334f:	0f 85 d0 52 00 00    	jne    948625 <___bpf_prog_run+0x9de5>
4b15   943355:	4c 63 7d 00          	movslq 0x0(%rbp),%r15
4b19   943359:	48 89 ef             	mov    %rbp,%rdi
4b1c   94335c:	e8 00 00 00 00       	call   943361 <___bpf_prog_run+0x4b21>	94335d: R_X86_64_PLT32	__msan_metadata_ptr_for_load_4-0x4
4b21   943361:	48 63 00             	movslq (%rax),%rax
4b24   943364:	48 85 c0             	test   %rax,%rax
4b27   943367:	74 06                	je     94336f <___bpf_prog_run+0x4b2f>
4b29   943369:	8b 0a                	mov    (%rdx),%ecx
4b2b   94336b:	89 4c 24 18          	mov    %ecx,0x18(%rsp)
4b2f   94336f:	48 09 c3             	or     %rax,%rbx
4b32   943372:	4d 85 f6             	test   %r14,%r14
4b35   943375:	0f 85 b7 52 00 00    	jne    948632 <___bpf_prog_run+0x9df2>
4b3b   94337b:	4d 0f af e7          	imul   %r15,%r12
4b3f   94337f:	e9 77 09 00 00       	jmp    943cfb <___bpf_prog_run+0x54bb>
4b44   943384:	e8 00 00 00 00       	call   943389 <___bpf_prog_run+0x4b49>	943385: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4b49   943389:	49 8d 5d 01          	lea    0x1(%r13),%rbx
4b4d   94338d:	4d 85 f6             	test   %r14,%r14
4b50   943390:	0f 85 aa 52 00 00    	jne    948640 <___bpf_prog_run+0x9e00>
4b56   943396:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
4b5b   94339b:	44 0f b6 23          	movzbl (%rbx),%r12d
4b5f   94339f:	48 89 df             	mov    %rbx,%rdi
4b62   9433a2:	e8 00 00 00 00       	call   9433a7 <___bpf_prog_run+0x4b67>	9433a3: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
4b67   9433a7:	44 0f b6 30          	movzbl (%rax),%r14d
4b6b   9433ab:	44 8b 2a             	mov    (%rdx),%r13d
4b6e   9433ae:	45 89 f7             	mov    %r14d,%r15d
4b71   9433b1:	41 83 e7 0f          	and    $0xf,%r15d
4b75   9433b5:	44 89 e5             	mov    %r12d,%ebp
4b78   9433b8:	83 e5 0f             	and    $0xf,%ebp
4b7b   9433bb:	4d 85 ff             	test   %r15,%r15
4b7e   9433be:	8b 5c 24 04          	mov    0x4(%rsp),%ebx
4b82   9433c2:	41 0f 45 dd          	cmovne %r13d,%ebx
4b86   9433c6:	4c 0b 7c 24 20       	or     0x20(%rsp),%r15
4b8b   9433cb:	0f 85 7c 52 00 00    	jne    94864d <___bpf_prog_run+0x9e0d>
4b91   9433d1:	89 5c 24 40          	mov    %ebx,0x40(%rsp)
4b95   9433d5:	48 8b 5c 24 30       	mov    0x30(%rsp),%rbx
4b9a   9433da:	48 8d 3c eb          	lea    (%rbx,%rbp,8),%rdi
4b9e   9433de:	48 8b 2f             	mov    (%rdi),%rbp
4ba1   9433e1:	48 89 7c 24 18       	mov    %rdi,0x18(%rsp)
4ba6   9433e6:	e8 00 00 00 00       	call   9433eb <___bpf_prog_run+0x4bab>	9433e7: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
4bab   9433eb:	48 8b 00             	mov    (%rax),%rax
4bae   9433ee:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
4bb3   9433f3:	8b 02                	mov    (%rdx),%eax
4bb5   9433f5:	89 44 24 38          	mov    %eax,0x38(%rsp)
4bb9   9433f9:	49 c1 ee 04          	shr    $0x4,%r14
4bbd   9433fd:	49 c1 ec 04          	shr    $0x4,%r12
4bc1   943401:	4d 85 f6             	test   %r14,%r14
4bc4   943404:	44 0f 44 6c 24 04    	cmove  0x4(%rsp),%r13d
4bca   94340a:	4c 0b 74 24 20       	or     0x20(%rsp),%r14
4bcf   94340f:	0f 85 44 52 00 00    	jne    948659 <___bpf_prog_run+0x9e19>
4bd5   943415:	4a 8d 3c e3          	lea    (%rbx,%r12,8),%rdi
4bd9   943419:	2b 2f                	sub    (%rdi),%ebp
4bdb   94341b:	e8 00 00 00 00       	call   943420 <___bpf_prog_run+0x4be0>	94341c: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
4be0   943420:	48 8b 18             	mov    (%rax),%rbx
4be3   943423:	48 85 db             	test   %rbx,%rbx
4be6   943426:	49 89 ec             	mov    %rbp,%r12
4be9   943429:	74 06                	je     943431 <___bpf_prog_run+0x4bf1>
4beb   94342b:	8b 02                	mov    (%rdx),%eax
4bed   94342d:	89 44 24 38          	mov    %eax,0x38(%rsp)
4bf1   943431:	0b 5c 24 08          	or     0x8(%rsp),%ebx
4bf5   943435:	4d 85 ff             	test   %r15,%r15
4bf8   943438:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
4bfd   94343d:	0f 84 db 0c 00 00    	je     94411e <___bpf_prog_run+0x58de>
4c03   943443:	8b 7c 24 40          	mov    0x40(%rsp),%edi
4c07   943447:	e8 00 00 00 00       	call   94344c <___bpf_prog_run+0x4c0c>	943448: R_X86_64_PLT32	__msan_warning-0x4
4c0c   94344c:	e9 cd 0c 00 00       	jmp    94411e <___bpf_prog_run+0x58de>
4c11   943451:	e8 00 00 00 00       	call   943456 <___bpf_prog_run+0x4c16>	943452: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4c16   943456:	49 8d 5d 01          	lea    0x1(%r13),%rbx
4c1a   94345a:	4d 85 f6             	test   %r14,%r14
4c1d   94345d:	0f 85 03 52 00 00    	jne    948666 <___bpf_prog_run+0x9e26>
4c23   943463:	0f b6 2b             	movzbl (%rbx),%ebp
4c26   943466:	48 89 df             	mov    %rbx,%rdi
4c29   943469:	e8 00 00 00 00       	call   94346e <___bpf_prog_run+0x4c2e>	94346a: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
4c2e   94346e:	44 0f b6 30          	movzbl (%rax),%r14d
4c32   943472:	41 83 e6 0f          	and    $0xf,%r14d
4c36   943476:	8b 5c 24 04          	mov    0x4(%rsp),%ebx
4c3a   94347a:	4d 85 f6             	test   %r14,%r14
4c3d   94347d:	74 02                	je     943481 <___bpf_prog_run+0x4c41>
4c3f   94347f:	8b 1a                	mov    (%rdx),%ebx
4c41   943481:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
4c46   943486:	83 e5 0f             	and    $0xf,%ebp
4c49   943489:	4c 0b 74 24 20       	or     0x20(%rsp),%r14
4c4e   94348e:	0f 85 df 51 00 00    	jne    948673 <___bpf_prog_run+0x9e33>
4c54   943494:	89 5c 24 18          	mov    %ebx,0x18(%rsp)
4c58   943498:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
4c5d   94349d:	4c 8d 24 e8          	lea    (%rax,%rbp,8),%r12
4c61   9434a1:	4d 8b 2c 24          	mov    (%r12),%r13
4c65   9434a5:	4c 89 e7             	mov    %r12,%rdi
4c68   9434a8:	e8 00 00 00 00       	call   9434ad <___bpf_prog_run+0x4c6d>	9434a9: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
4c6d   9434ad:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
4c72   9434b2:	48 8d 59 04          	lea    0x4(%rcx),%rbx
4c76   9434b6:	4c 8b 38             	mov    (%rax),%r15
4c79   9434b9:	8b 02                	mov    (%rdx),%eax
4c7b   9434bb:	89 44 24 08          	mov    %eax,0x8(%rsp)
4c7f   9434bf:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
4c85   9434c5:	0f 85 b4 51 00 00    	jne    94867f <___bpf_prog_run+0x9e3f>
4c8b   9434cb:	48 63 2b             	movslq (%rbx),%rbp
4c8e   9434ce:	48 89 df             	mov    %rbx,%rdi
4c91   9434d1:	e8 00 00 00 00       	call   9434d6 <___bpf_prog_run+0x4c96>	9434d2: R_X86_64_PLT32	__msan_metadata_ptr_for_load_4-0x4
4c96   9434d6:	83 38 00             	cmpl   $0x0,(%rax)
4c99   9434d9:	0f 85 ad 51 00 00    	jne    94868c <___bpf_prog_run+0x9e4c>
4c9f   9434df:	4c 89 e8             	mov    %r13,%rax
4ca2   9434e2:	48 09 e8             	or     %rbp,%rax
4ca5   9434e5:	48 c1 e8 20          	shr    $0x20,%rax
4ca9   9434e9:	0f 84 ee 1f 00 00    	je     9454dd <___bpf_prog_run+0x6c9d>
4caf   9434ef:	4c 89 e8             	mov    %r13,%rax
4cb2   9434f2:	31 d2                	xor    %edx,%edx
4cb4   9434f4:	48 f7 f5             	div    %rbp
4cb7   9434f7:	48 89 c5             	mov    %rax,%rbp
4cba   9434fa:	e9 e7 1f 00 00       	jmp    9454e6 <___bpf_prog_run+0x6ca6>
4cbf   9434ff:	e8 00 00 00 00       	call   943504 <___bpf_prog_run+0x4cc4>	943500: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4cc4   943504:	49 8d 5d 01          	lea    0x1(%r13),%rbx
4cc8   943508:	4d 85 f6             	test   %r14,%r14
4ccb   94350b:	0f 85 87 51 00 00    	jne    948698 <___bpf_prog_run+0x9e58>
4cd1   943511:	0f b6 2b             	movzbl (%rbx),%ebp
4cd4   943514:	48 89 df             	mov    %rbx,%rdi
4cd7   943517:	e8 00 00 00 00       	call   94351c <___bpf_prog_run+0x4cdc>	943518: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
4cdc   94351c:	0f b6 18             	movzbl (%rax),%ebx
4cdf   94351f:	83 e3 0f             	and    $0xf,%ebx
4ce2   943522:	44 8b 74 24 04       	mov    0x4(%rsp),%r14d
4ce7   943527:	48 85 db             	test   %rbx,%rbx
4cea   94352a:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
4cef   94352f:	74 03                	je     943534 <___bpf_prog_run+0x4cf4>
4cf1   943531:	44 8b 32             	mov    (%rdx),%r14d
4cf4   943534:	83 e5 0f             	and    $0xf,%ebp
4cf7   943537:	48 09 c3             	or     %rax,%rbx
4cfa   94353a:	0f 85 65 51 00 00    	jne    9486a5 <___bpf_prog_run+0x9e65>
4d00   943540:	44 89 74 24 38       	mov    %r14d,0x38(%rsp)
4d05   943545:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
4d0a   94354a:	48 8d 3c e8          	lea    (%rax,%rbp,8),%rdi
4d0e   94354e:	44 8b 27             	mov    (%rdi),%r12d
4d11   943551:	48 89 7c 24 18       	mov    %rdi,0x18(%rsp)
4d16   943556:	e8 00 00 00 00       	call   94355b <___bpf_prog_run+0x4d1b>	943557: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
4d1b   94355b:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
4d20   943560:	49 8d 6d 04          	lea    0x4(%r13),%rbp
4d24   943564:	44 8b 30             	mov    (%rax),%r14d
4d27   943567:	8b 02                	mov    (%rdx),%eax
4d29   943569:	89 44 24 08          	mov    %eax,0x8(%rsp)
4d2d   94356d:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
4d33   943573:	0f 85 39 51 00 00    	jne    9486b2 <___bpf_prog_run+0x9e72>
4d39   943579:	44 8b 6d 00          	mov    0x0(%rbp),%r13d
4d3d   94357d:	48 89 ef             	mov    %rbp,%rdi
4d40   943580:	e8 00 00 00 00       	call   943585 <___bpf_prog_run+0x4d45>	943581: R_X86_64_PLT32	__msan_metadata_ptr_for_load_4-0x4
4d45   943585:	44 8b 38             	mov    (%rax),%r15d
4d48   943588:	44 89 f8             	mov    %r15d,%eax
4d4b   94358b:	44 21 e0             	and    %r12d,%eax
4d4e   94358e:	45 09 ef             	or     %r13d,%r15d
4d51   943591:	45 21 f7             	and    %r14d,%r15d
4d54   943594:	45 85 f6             	test   %r14d,%r14d
4d57   943597:	75 06                	jne    94359f <___bpf_prog_run+0x4d5f>
4d59   943599:	8b 0a                	mov    (%rdx),%ecx
4d5b   94359b:	89 4c 24 08          	mov    %ecx,0x8(%rsp)
4d5f   94359f:	41 09 c7             	or     %eax,%r15d
4d62   9435a2:	48 85 db             	test   %rbx,%rbx
4d65   9435a5:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
4d6a   9435aa:	0f 85 0f 51 00 00    	jne    9486bf <___bpf_prog_run+0x9e7f>
4d70   9435b0:	45 21 e5             	and    %r12d,%r13d
4d73   9435b3:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
4d78   9435b8:	48 89 df             	mov    %rbx,%rdi
4d7b   9435bb:	e8 00 00 00 00       	call   9435c0 <___bpf_prog_run+0x4d80>	9435bc: R_X86_64_PLT32	__msan_metadata_ptr_for_store_8-0x4
4d80   9435c0:	4c 89 38             	mov    %r15,(%rax)
4d83   9435c3:	4d 85 ff             	test   %r15,%r15
4d86   9435c6:	0f 85 01 51 00 00    	jne    9486cd <___bpf_prog_run+0x9e8d>
4d8c   9435cc:	4c 89 2b             	mov    %r13,(%rbx)
4d8f   9435cf:	e9 44 07 00 00       	jmp    943d18 <___bpf_prog_run+0x54d8>
4d94   9435d4:	e8 00 00 00 00       	call   9435d9 <___bpf_prog_run+0x4d99>	9435d5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4d99   9435d9:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
4d9e   9435de:	49 8d 5d 01          	lea    0x1(%r13),%rbx
4da2   9435e2:	4d 85 f6             	test   %r14,%r14
4da5   9435e5:	0f 85 03 51 00 00    	jne    9486ee <___bpf_prog_run+0x9eae>
4dab   9435eb:	44 0f b6 23          	movzbl (%rbx),%r12d
4daf   9435ef:	48 89 df             	mov    %rbx,%rdi
4db2   9435f2:	e8 00 00 00 00       	call   9435f7 <___bpf_prog_run+0x4db7>	9435f3: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
4db7   9435f7:	0f b6 18             	movzbl (%rax),%ebx
4dba   9435fa:	44 8b 3a             	mov    (%rdx),%r15d
4dbd   9435fd:	48 89 d8             	mov    %rbx,%rax
4dc0   943600:	48 c1 e8 04          	shr    $0x4,%rax
4dc4   943604:	4c 89 e5             	mov    %r12,%rbp
4dc7   943607:	48 c1 ed 04          	shr    $0x4,%rbp
4dcb   94360b:	48 85 c0             	test   %rax,%rax
4dce   94360e:	44 8b 6c 24 04       	mov    0x4(%rsp),%r13d
4dd3   943613:	44 89 ef             	mov    %r13d,%edi
4dd6   943616:	41 0f 45 ff          	cmovne %r15d,%edi
4dda   94361a:	4c 8b 74 24 20       	mov    0x20(%rsp),%r14
4ddf   94361f:	4c 09 f0             	or     %r14,%rax
4de2   943622:	0f 85 d3 50 00 00    	jne    9486fb <___bpf_prog_run+0x9ebb>
4de8   943628:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
4ded   94362d:	48 8d 3c e8          	lea    (%rax,%rbp,8),%rdi
4df1   943631:	48 89 c5             	mov    %rax,%rbp
4df4   943634:	48 8b 07             	mov    (%rdi),%rax
4df7   943637:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
4dfc   94363c:	e8 00 00 00 00       	call   943641 <___bpf_prog_run+0x4e01>	94363d: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
4e01   943641:	48 8b 00             	mov    (%rax),%rax
4e04   943644:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
4e09   943649:	8b 02                	mov    (%rdx),%eax
4e0b   94364b:	89 44 24 38          	mov    %eax,0x38(%rsp)
4e0f   94364f:	83 e3 0f             	and    $0xf,%ebx
4e12   943652:	41 83 e4 0f          	and    $0xf,%r12d
4e16   943656:	48 85 db             	test   %rbx,%rbx
4e19   943659:	45 0f 44 fd          	cmove  %r13d,%r15d
4e1d   94365d:	4c 09 f3             	or     %r14,%rbx
4e20   943660:	0f 85 9f 50 00 00    	jne    948705 <___bpf_prog_run+0x9ec5>
4e26   943666:	4a 8d 3c e5 00 00 00 00 	lea    0x0(,%r12,8),%rdi
4e2e   94366e:	48 01 ef             	add    %rbp,%rdi
4e31   943671:	4c 8b 2f             	mov    (%rdi),%r13
4e34   943674:	e8 00 00 00 00       	call   943679 <___bpf_prog_run+0x4e39>	943675: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
4e39   943679:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
4e3e   94367e:	48 8d 59 02          	lea    0x2(%rcx),%rbx
4e42   943682:	48 8b 28             	mov    (%rax),%rbp
4e45   943685:	44 8b 3a             	mov    (%rdx),%r15d
4e48   943688:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
4e4d   94368d:	4d 85 f6             	test   %r14,%r14
4e50   943690:	0f 85 7c 50 00 00    	jne    948712 <___bpf_prog_run+0x9ed2>
4e56   943696:	4c 0f bf 23          	movswq (%rbx),%r12
4e5a   94369a:	48 89 df             	mov    %rbx,%rdi
4e5d   94369d:	e8 00 00 00 00       	call   9436a2 <___bpf_prog_run+0x4e62>	94369e: R_X86_64_PLT32	__msan_metadata_ptr_for_load_2-0x4
4e62   9436a2:	48 0f bf 00          	movswq (%rax),%rax
4e66   9436a6:	48 85 c0             	test   %rax,%rax
4e69   9436a9:	74 03                	je     9436ae <___bpf_prog_run+0x4e6e>
4e6b   9436ab:	44 8b 3a             	mov    (%rdx),%r15d
4e6e   9436ae:	4d 01 e5             	add    %r12,%r13
4e71   9436b1:	48 09 c5             	or     %rax,%rbp
4e74   9436b4:	0f 85 65 50 00 00    	jne    94871f <___bpf_prog_run+0x9edf>
4e7a   9436ba:	4c 89 ef             	mov    %r13,%rdi
4e7d   9436bd:	e8 00 00 00 00       	call   9436c2 <___bpf_prog_run+0x4e82>	9436be: R_X86_64_PLT32	__msan_metadata_ptr_for_store_8-0x4
4e82   9436c2:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
4e87   9436c7:	48 89 08             	mov    %rcx,(%rax)
4e8a   9436ca:	48 85 c9             	test   %rcx,%rcx
4e8d   9436cd:	0f 85 59 50 00 00    	jne    94872c <___bpf_prog_run+0x9eec>
4e93   9436d3:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
4e98   9436d8:	49 89 45 00          	mov    %rax,0x0(%r13)
4e9c   9436dc:	e9 37 06 00 00       	jmp    943d18 <___bpf_prog_run+0x54d8>
4ea1   9436e1:	e8 00 00 00 00       	call   9436e6 <___bpf_prog_run+0x4ea6>	9436e2: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4ea6   9436e6:	49 8d 5d 01          	lea    0x1(%r13),%rbx
4eaa   9436ea:	4d 85 f6             	test   %r14,%r14
4ead   9436ed:	0f 85 59 50 00 00    	jne    94874c <___bpf_prog_run+0x9f0c>
4eb3   9436f3:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
4eb8   9436f8:	44 0f b6 3b          	movzbl (%rbx),%r15d
4ebc   9436fc:	48 89 5c 24 18       	mov    %rbx,0x18(%rsp)
4ec1   943701:	48 89 df             	mov    %rbx,%rdi
4ec4   943704:	e8 00 00 00 00       	call   943709 <___bpf_prog_run+0x4ec9>	943705: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
4ec9   943709:	0f b6 18             	movzbl (%rax),%ebx
4ecc   94370c:	44 8b 32             	mov    (%rdx),%r14d
4ecf   94370f:	89 d8                	mov    %ebx,%eax
4ed1   943711:	83 e0 0f             	and    $0xf,%eax
4ed4   943714:	44 89 fd             	mov    %r15d,%ebp
4ed7   943717:	83 e5 0f             	and    $0xf,%ebp
4eda   94371a:	48 85 c0             	test   %rax,%rax
4edd   94371d:	44 8b 64 24 04       	mov    0x4(%rsp),%r12d
4ee2   943722:	44 89 e7             	mov    %r12d,%edi
4ee5   943725:	41 0f 45 fe          	cmovne %r14d,%edi
4ee9   943729:	48 0b 44 24 20       	or     0x20(%rsp),%rax
4eee   94372e:	0f 85 25 50 00 00    	jne    948759 <___bpf_prog_run+0x9f19>
4ef4   943734:	4c 8b 6c 24 30       	mov    0x30(%rsp),%r13
4ef9   943739:	48 8d 3c ed 00 00 00 00 	lea    0x0(,%rbp,8),%rdi
4f01   943741:	4c 01 ef             	add    %r13,%rdi
4f04   943744:	48 8b 2f             	mov    (%rdi),%rbp
4f07   943747:	e8 00 00 00 00       	call   94374c <___bpf_prog_run+0x4f0c>	943748: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
4f0c   94374c:	48 8b 00             	mov    (%rax),%rax
4f0f   94374f:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
4f14   943754:	8b 02                	mov    (%rdx),%eax
4f16   943756:	89 44 24 38          	mov    %eax,0x38(%rsp)
4f1a   94375a:	48 c1 eb 04          	shr    $0x4,%rbx
4f1e   94375e:	49 c1 ef 04          	shr    $0x4,%r15
4f22   943762:	48 85 db             	test   %rbx,%rbx
4f25   943765:	45 0f 44 f4          	cmove  %r12d,%r14d
4f29   943769:	48 0b 5c 24 20       	or     0x20(%rsp),%rbx
4f2e   94376e:	0f 85 ef 4f 00 00    	jne    948763 <___bpf_prog_run+0x9f23>
4f34   943774:	4a 8d 3c fd 00 00 00 00 	lea    0x0(,%r15,8),%rdi
4f3c   94377c:	4c 01 ef             	add    %r13,%rdi
4f3f   94377f:	48 8b 1f             	mov    (%rdi),%rbx
4f42   943782:	e8 00 00 00 00       	call   943787 <___bpf_prog_run+0x4f47>	943783: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
4f47   943787:	48 83 38 00          	cmpq   $0x0,(%rax)
4f4b   94378b:	0f 85 df 4f 00 00    	jne    948770 <___bpf_prog_run+0x9f30>
4f51   943791:	48 89 e8             	mov    %rbp,%rax
4f54   943794:	48 09 d8             	or     %rbx,%rax
4f57   943797:	48 c1 e8 20          	shr    $0x20,%rax
4f5b   94379b:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
4f60   9437a0:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
4f65   9437a5:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
4f6a   9437aa:	0f 84 6a 1d 00 00    	je     94551a <___bpf_prog_run+0x6cda>
4f70   9437b0:	48 89 e8             	mov    %rbp,%rax
4f73   9437b3:	31 d2                	xor    %edx,%edx
4f75   9437b5:	48 f7 f3             	div    %rbx
4f78   9437b8:	49 89 d4             	mov    %rdx,%r12
4f7b   9437bb:	e9 63 1d 00 00       	jmp    945523 <___bpf_prog_run+0x6ce3>
4f80   9437c0:	e8 00 00 00 00       	call   9437c5 <___bpf_prog_run+0x4f85>	9437c1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4f85   9437c5:	49 8d 5d 01          	lea    0x1(%r13),%rbx
4f89   9437c9:	4d 85 f6             	test   %r14,%r14
4f8c   9437cc:	0f 85 a5 50 00 00    	jne    948877 <___bpf_prog_run+0xa037>
4f92   9437d2:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
4f97   9437d7:	44 0f b6 2b          	movzbl (%rbx),%r13d
4f9b   9437db:	48 89 df             	mov    %rbx,%rdi
4f9e   9437de:	e8 00 00 00 00       	call   9437e3 <___bpf_prog_run+0x4fa3>	9437df: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
4fa3   9437e3:	44 0f b6 30          	movzbl (%rax),%r14d
4fa7   9437e7:	44 8b 22             	mov    (%rdx),%r12d
4faa   9437ea:	45 89 f7             	mov    %r14d,%r15d
4fad   9437ed:	41 83 e7 0f          	and    $0xf,%r15d
4fb1   9437f1:	44 89 ed             	mov    %r13d,%ebp
4fb4   9437f4:	83 e5 0f             	and    $0xf,%ebp
4fb7   9437f7:	4d 85 ff             	test   %r15,%r15
4fba   9437fa:	8b 5c 24 04          	mov    0x4(%rsp),%ebx
4fbe   9437fe:	41 0f 45 dc          	cmovne %r12d,%ebx
4fc2   943802:	4c 0b 7c 24 20       	or     0x20(%rsp),%r15
4fc7   943807:	0f 85 77 50 00 00    	jne    948884 <___bpf_prog_run+0xa044>
4fcd   94380d:	89 5c 24 40          	mov    %ebx,0x40(%rsp)
4fd1   943811:	48 8b 5c 24 30       	mov    0x30(%rsp),%rbx
4fd6   943816:	48 8d 3c eb          	lea    (%rbx,%rbp,8),%rdi
4fda   94381a:	48 8b 2f             	mov    (%rdi),%rbp
4fdd   94381d:	48 89 7c 24 18       	mov    %rdi,0x18(%rsp)
4fe2   943822:	e8 00 00 00 00       	call   943827 <___bpf_prog_run+0x4fe7>	943823: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
4fe7   943827:	48 8b 00             	mov    (%rax),%rax
4fea   94382a:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
4fef   94382f:	8b 02                	mov    (%rdx),%eax
4ff1   943831:	89 44 24 38          	mov    %eax,0x38(%rsp)
4ff5   943835:	49 c1 ee 04          	shr    $0x4,%r14
4ff9   943839:	49 c1 ed 04          	shr    $0x4,%r13
4ffd   94383d:	4d 85 f6             	test   %r14,%r14
5000   943840:	44 0f 44 64 24 04    	cmove  0x4(%rsp),%r12d
5006   943846:	4c 0b 74 24 20       	or     0x20(%rsp),%r14
500b   94384b:	0f 85 3f 50 00 00    	jne    948890 <___bpf_prog_run+0xa050>
5011   943851:	4a 8d 3c eb          	lea    (%rbx,%r13,8),%rdi
5015   943855:	48 33 2f             	xor    (%rdi),%rbp
5018   943858:	e8 00 00 00 00       	call   94385d <___bpf_prog_run+0x501d>	943859: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
501d   94385d:	48 8b 18             	mov    (%rax),%rbx
5020   943860:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
5025   943865:	48 09 c3             	or     %rax,%rbx
5028   943868:	48 85 c0             	test   %rax,%rax
502b   94386b:	49 89 ec             	mov    %rbp,%r12
502e   94386e:	75 06                	jne    943876 <___bpf_prog_run+0x5036>
5030   943870:	8b 02                	mov    (%rdx),%eax
5032   943872:	89 44 24 38          	mov    %eax,0x38(%rsp)
5036   943876:	4d 85 ff             	test   %r15,%r15
5039   943879:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
503e   94387e:	0f 84 9a 08 00 00    	je     94411e <___bpf_prog_run+0x58de>
5044   943884:	8b 7c 24 40          	mov    0x40(%rsp),%edi
5048   943888:	e8 00 00 00 00       	call   94388d <___bpf_prog_run+0x504d>	943889: R_X86_64_PLT32	__msan_warning-0x4
504d   94388d:	e9 8c 08 00 00       	jmp    94411e <___bpf_prog_run+0x58de>
5052   943892:	49 8d 5d 01          	lea    0x1(%r13),%rbx
5056   943896:	4d 85 f6             	test   %r14,%r14
5059   943899:	0f 85 fe 4f 00 00    	jne    94889d <___bpf_prog_run+0xa05d>
505f   94389f:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
5064   9438a4:	44 0f b6 33          	movzbl (%rbx),%r14d
5068   9438a8:	48 89 df             	mov    %rbx,%rdi
506b   9438ab:	e8 00 00 00 00       	call   9438b0 <___bpf_prog_run+0x5070>	9438ac: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
5070   9438b0:	0f b6 18             	movzbl (%rax),%ebx
5073   9438b3:	44 8b 22             	mov    (%rdx),%r12d
5076   9438b6:	89 d8                	mov    %ebx,%eax
5078   9438b8:	83 e0 0f             	and    $0xf,%eax
507b   9438bb:	44 89 f5             	mov    %r14d,%ebp
507e   9438be:	83 e5 0f             	and    $0xf,%ebp
5081   9438c1:	48 85 c0             	test   %rax,%rax
5084   9438c4:	44 8b 7c 24 04       	mov    0x4(%rsp),%r15d
5089   9438c9:	44 89 ff             	mov    %r15d,%edi
508c   9438cc:	41 0f 45 fc          	cmovne %r12d,%edi
5090   9438d0:	48 0b 44 24 20       	or     0x20(%rsp),%rax
5095   9438d5:	0f 85 cf 4f 00 00    	jne    9488aa <___bpf_prog_run+0xa06a>
509b   9438db:	4c 8b 6c 24 30       	mov    0x30(%rsp),%r13
50a0   9438e0:	48 8d 3c ed 00 00 00 00 	lea    0x0(,%rbp,8),%rdi
50a8   9438e8:	4c 01 ef             	add    %r13,%rdi
50ab   9438eb:	48 8b 07             	mov    (%rdi),%rax
50ae   9438ee:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
50b3   9438f3:	e8 00 00 00 00       	call   9438f8 <___bpf_prog_run+0x50b8>	9438f4: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
50b8   9438f8:	4c 89 ed             	mov    %r13,%rbp
50bb   9438fb:	4c 8b 28             	mov    (%rax),%r13
50be   9438fe:	8b 02                	mov    (%rdx),%eax
50c0   943900:	89 44 24 08          	mov    %eax,0x8(%rsp)
50c4   943904:	48 c1 eb 04          	shr    $0x4,%rbx
50c8   943908:	49 c1 ee 04          	shr    $0x4,%r14
50cc   94390c:	48 85 db             	test   %rbx,%rbx
50cf   94390f:	45 0f 44 e7          	cmove  %r15d,%r12d
50d3   943913:	48 0b 5c 24 20       	or     0x20(%rsp),%rbx
50d8   943918:	0f 85 96 4f 00 00    	jne    9488b4 <___bpf_prog_run+0xa074>
50de   94391e:	4a 8d 3c f5 00 00 00 00 	lea    0x0(,%r14,8),%rdi
50e6   943926:	48 01 ef             	add    %rbp,%rdi
50e9   943929:	48 8b 1f             	mov    (%rdi),%rbx
50ec   94392c:	e8 00 00 00 00       	call   943931 <___bpf_prog_run+0x50f1>	94392d: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
50f1   943931:	48 8b 00             	mov    (%rax),%rax
50f4   943934:	48 85 c0             	test   %rax,%rax
50f7   943937:	74 06                	je     94393f <___bpf_prog_run+0x50ff>
50f9   943939:	8b 0a                	mov    (%rdx),%ecx
50fb   94393b:	89 4c 24 08          	mov    %ecx,0x8(%rsp)
50ff   94393f:	49 09 c5             	or     %rax,%r13
5102   943942:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
5107   943947:	0f 85 74 4f 00 00    	jne    9488c1 <___bpf_prog_run+0xa081>
510d   94394d:	48 39 5c 24 18       	cmp    %rbx,0x18(%rsp)
5112   943952:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
5117   943957:	0f 8d c5 19 00 00    	jge    945322 <___bpf_prog_run+0x6ae2>
511d   94395d:	e8 00 00 00 00       	call   943962 <___bpf_prog_run+0x5122>	94395e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5122   943962:	49 83 c5 08          	add    $0x8,%r13
5126   943966:	e9 94 af ff ff       	jmp    93e8ff <___bpf_prog_run+0xbf>
512b   94396b:	e8 00 00 00 00       	call   943970 <___bpf_prog_run+0x5130>	94396c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5130   943970:	49 8d 5d 01          	lea    0x1(%r13),%rbx
5134   943974:	4d 85 f6             	test   %r14,%r14
5137   943977:	0f 85 52 4f 00 00    	jne    9488cf <___bpf_prog_run+0xa08f>
513d   94397d:	44 0f b6 3b          	movzbl (%rbx),%r15d
5141   943981:	48 89 df             	mov    %rbx,%rdi
5144   943984:	e8 00 00 00 00       	call   943989 <___bpf_prog_run+0x5149>	943985: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
5149   943989:	0f b6 28             	movzbl (%rax),%ebp
514c   94398c:	83 e5 0f             	and    $0xf,%ebp
514f   94398f:	44 8b 74 24 04       	mov    0x4(%rsp),%r14d
5154   943994:	48 85 ed             	test   %rbp,%rbp
5157   943997:	74 03                	je     94399c <___bpf_prog_run+0x515c>
5159   943999:	44 8b 32             	mov    (%rdx),%r14d
515c   94399c:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
5161   9439a1:	41 83 e7 0f          	and    $0xf,%r15d
5165   9439a5:	48 0b 6c 24 20       	or     0x20(%rsp),%rbp
516a   9439aa:	0f 85 2c 4f 00 00    	jne    9488dc <___bpf_prog_run+0xa09c>
5170   9439b0:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
5175   9439b5:	4e 8d 2c f8          	lea    (%rax,%r15,8),%r13
5179   9439b9:	45 31 ff             	xor    %r15d,%r15d
517c   9439bc:	45 31 e4             	xor    %r12d,%r12d
517f   9439bf:	45 2b 65 00          	sub    0x0(%r13),%r12d
5183   9439c3:	4c 89 ef             	mov    %r13,%rdi
5186   9439c6:	e8 00 00 00 00       	call   9439cb <___bpf_prog_run+0x518b>	9439c7: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
518b   9439cb:	48 8b 18             	mov    (%rax),%rbx
518e   9439ce:	48 85 db             	test   %rbx,%rbx
5191   9439d1:	74 03                	je     9439d6 <___bpf_prog_run+0x5196>
5193   9439d3:	44 8b 3a             	mov    (%rdx),%r15d
5196   9439d6:	48 85 ed             	test   %rbp,%rbp
5199   9439d9:	0f 85 0a 4f 00 00    	jne    9488e9 <___bpf_prog_run+0xa0a9>
519f   9439df:	89 db                	mov    %ebx,%ebx
51a1   9439e1:	4c 89 ef             	mov    %r13,%rdi
51a4   9439e4:	e8 00 00 00 00       	call   9439e9 <___bpf_prog_run+0x51a9>	9439e5: R_X86_64_PLT32	__msan_metadata_ptr_for_store_8-0x4
51a9   9439e9:	48 89 18             	mov    %rbx,(%rax)
51ac   9439ec:	48 85 db             	test   %rbx,%rbx
51af   9439ef:	0f 84 f8 ae ff ff    	je     93e8ed <___bpf_prog_run+0xad>
51b5   9439f5:	49 89 d6             	mov    %rdx,%r14
51b8   9439f8:	44 89 ff             	mov    %r15d,%edi
51bb   9439fb:	e9 d9 ae ff ff       	jmp    93e8d9 <___bpf_prog_run+0x99>
51c0   943a00:	e8 00 00 00 00       	call   943a05 <___bpf_prog_run+0x51c5>	943a01: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
51c5   943a05:	49 8d 5d 01          	lea    0x1(%r13),%rbx
51c9   943a09:	4d 85 f6             	test   %r14,%r14
51cc   943a0c:	0f 85 e4 4e 00 00    	jne    9488f6 <___bpf_prog_run+0xa0b6>
51d2   943a12:	0f b6 2b             	movzbl (%rbx),%ebp
51d5   943a15:	48 89 df             	mov    %rbx,%rdi
51d8   943a18:	e8 00 00 00 00       	call   943a1d <___bpf_prog_run+0x51dd>	943a19: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
51dd   943a1d:	44 0f b6 30          	movzbl (%rax),%r14d
51e1   943a21:	41 83 e6 0f          	and    $0xf,%r14d
51e5   943a25:	8b 5c 24 04          	mov    0x4(%rsp),%ebx
51e9   943a29:	4d 85 f6             	test   %r14,%r14
51ec   943a2c:	74 02                	je     943a30 <___bpf_prog_run+0x51f0>
51ee   943a2e:	8b 1a                	mov    (%rdx),%ebx
51f0   943a30:	4d 89 ef             	mov    %r13,%r15
51f3   943a33:	83 e5 0f             	and    $0xf,%ebp
51f6   943a36:	4c 0b 74 24 20       	or     0x20(%rsp),%r14
51fb   943a3b:	0f 85 c2 4e 00 00    	jne    948903 <___bpf_prog_run+0xa0c3>
5201   943a41:	89 5c 24 08          	mov    %ebx,0x8(%rsp)
5205   943a45:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
520a   943a4a:	4c 8d 2c e8          	lea    (%rax,%rbp,8),%r13
520e   943a4e:	45 8b 65 00          	mov    0x0(%r13),%r12d
5212   943a52:	4c 89 ef             	mov    %r13,%rdi
5215   943a55:	e8 00 00 00 00       	call   943a5a <___bpf_prog_run+0x521a>	943a56: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
521a   943a5a:	49 8d 6f 04          	lea    0x4(%r15),%rbp
521e   943a5e:	8b 18                	mov    (%rax),%ebx
5220   943a60:	8b 02                	mov    (%rdx),%eax
5222   943a62:	89 44 24 18          	mov    %eax,0x18(%rsp)
5226   943a66:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
522c   943a6c:	0f 85 9d 4e 00 00    	jne    94890f <___bpf_prog_run+0xa0cf>
5232   943a72:	44 0f af 65 00       	imul   0x0(%rbp),%r12d
5237   943a77:	48 89 ef             	mov    %rbp,%rdi
523a   943a7a:	e8 00 00 00 00       	call   943a7f <___bpf_prog_run+0x523f>	943a7b: R_X86_64_PLT32	__msan_metadata_ptr_for_load_4-0x4
523f   943a7f:	8b 28                	mov    (%rax),%ebp
5241   943a81:	09 dd                	or     %ebx,%ebp
5243   943a83:	85 db                	test   %ebx,%ebx
5245   943a85:	75 06                	jne    943a8d <___bpf_prog_run+0x524d>
5247   943a87:	8b 02                	mov    (%rdx),%eax
5249   943a89:	89 44 24 18          	mov    %eax,0x18(%rsp)
524d   943a8d:	4d 85 f6             	test   %r14,%r14
5250   943a90:	0f 85 86 4e 00 00    	jne    94891c <___bpf_prog_run+0xa0dc>
5256   943a96:	4c 89 ef             	mov    %r13,%rdi
5259   943a99:	e8 00 00 00 00       	call   943a9e <___bpf_prog_run+0x525e>	943a9a: R_X86_64_PLT32	__msan_metadata_ptr_for_store_8-0x4
525e   943a9e:	48 89 28             	mov    %rbp,(%rax)
5261   943aa1:	48 85 ed             	test   %rbp,%rbp
5264   943aa4:	0f 85 8c 36 00 00    	jne    947136 <___bpf_prog_run+0x88f6>
526a   943aaa:	4d 89 65 00          	mov    %r12,0x0(%r13)
526e   943aae:	4d 89 fd             	mov    %r15,%r13
5271   943ab1:	e9 40 ae ff ff       	jmp    93e8f6 <___bpf_prog_run+0xb6>
5276   943ab6:	e8 00 00 00 00       	call   943abb <___bpf_prog_run+0x527b>	943ab7: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
527b   943abb:	49 8d 5d 01          	lea    0x1(%r13),%rbx
527f   943abf:	4d 85 f6             	test   %r14,%r14
5282   943ac2:	0f 85 62 4e 00 00    	jne    94892a <___bpf_prog_run+0xa0ea>
5288   943ac8:	44 0f b6 23          	movzbl (%rbx),%r12d
528c   943acc:	48 89 df             	mov    %rbx,%rdi
528f   943acf:	e8 00 00 00 00       	call   943ad4 <___bpf_prog_run+0x5294>	943ad0: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
5294   943ad4:	44 0f b6 30          	movzbl (%rax),%r14d
5298   943ad8:	8b 0a                	mov    (%rdx),%ecx
529a   943ada:	4c 89 f0             	mov    %r14,%rax
529d   943add:	48 c1 e8 04          	shr    $0x4,%rax
52a1   943ae1:	4c 89 e3             	mov    %r12,%rbx
52a4   943ae4:	48 c1 eb 04          	shr    $0x4,%rbx
52a8   943ae8:	48 85 c0             	test   %rax,%rax
52ab   943aeb:	8b 7c 24 04          	mov    0x4(%rsp),%edi
52af   943aef:	89 4c 24 18          	mov    %ecx,0x18(%rsp)
52b3   943af3:	0f 45 f9             	cmovne %ecx,%edi
52b6   943af6:	48 0b 44 24 20       	or     0x20(%rsp),%rax
52bb   943afb:	0f 85 36 4e 00 00    	jne    948937 <___bpf_prog_run+0xa0f7>
52c1   943b01:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
52c6   943b06:	48 8d 3c d8          	lea    (%rax,%rbx,8),%rdi
52ca   943b0a:	48 8b 2f             	mov    (%rdi),%rbp
52cd   943b0d:	e8 00 00 00 00       	call   943b12 <___bpf_prog_run+0x52d2>	943b0e: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
52d2   943b12:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
52d7   943b17:	49 8d 5d 02          	lea    0x2(%r13),%rbx
52db   943b1b:	4c 8b 28             	mov    (%rax),%r13
52de   943b1e:	8b 02                	mov    (%rdx),%eax
52e0   943b20:	89 44 24 08          	mov    %eax,0x8(%rsp)
52e4   943b24:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
52ea   943b2a:	0f 85 11 4e 00 00    	jne    948941 <___bpf_prog_run+0xa101>
52f0   943b30:	4c 0f bf 3b          	movswq (%rbx),%r15
52f4   943b34:	48 89 df             	mov    %rbx,%rdi
52f7   943b37:	e8 00 00 00 00       	call   943b3c <___bpf_prog_run+0x52fc>	943b38: R_X86_64_PLT32	__msan_metadata_ptr_for_load_2-0x4
52fc   943b3c:	48 0f bf 00          	movswq (%rax),%rax
5300   943b40:	48 85 c0             	test   %rax,%rax
5303   943b43:	74 06                	je     943b4b <___bpf_prog_run+0x530b>
5305   943b45:	8b 0a                	mov    (%rdx),%ecx
5307   943b47:	89 4c 24 08          	mov    %ecx,0x8(%rsp)
530b   943b4b:	4c 01 fd             	add    %r15,%rbp
530e   943b4e:	49 09 c5             	or     %rax,%r13
5311   943b51:	0f 85 f7 4d 00 00    	jne    94894e <___bpf_prog_run+0xa10e>
5317   943b57:	44 8b 6d 00          	mov    0x0(%rbp),%r13d
531b   943b5b:	48 89 ef             	mov    %rbp,%rdi
531e   943b5e:	e8 00 00 00 00       	call   943b63 <___bpf_prog_run+0x5323>	943b5f: R_X86_64_PLT32	__msan_metadata_ptr_for_load_4-0x4
5323   943b63:	8b 28                	mov    (%rax),%ebp
5325   943b65:	44 8b 3a             	mov    (%rdx),%r15d
5328   943b68:	41 83 e6 0f          	and    $0xf,%r14d
532c   943b6c:	41 83 e4 0f          	and    $0xf,%r12d
5330   943b70:	4d 85 f6             	test   %r14,%r14
5333   943b73:	8b 7c 24 18          	mov    0x18(%rsp),%edi
5337   943b77:	0f 44 7c 24 04       	cmove  0x4(%rsp),%edi
533c   943b7c:	4c 0b 74 24 20       	or     0x20(%rsp),%r14
5341   943b81:	0f 84 45 15 00 00    	je     9450cc <___bpf_prog_run+0x688c>
5347   943b87:	e8 00 00 00 00       	call   943b8c <___bpf_prog_run+0x534c>	943b88: R_X86_64_PLT32	__msan_warning-0x4
534c   943b8c:	e9 3b 15 00 00       	jmp    9450cc <___bpf_prog_run+0x688c>
5351   943b91:	49 8d 5d 01          	lea    0x1(%r13),%rbx
5355   943b95:	4d 85 f6             	test   %r14,%r14
5358   943b98:	0f 85 be 4d 00 00    	jne    94895c <___bpf_prog_run+0xa11c>
535e   943b9e:	0f b6 2b             	movzbl (%rbx),%ebp
5361   943ba1:	48 89 df             	mov    %rbx,%rdi
5364   943ba4:	e8 00 00 00 00       	call   943ba9 <___bpf_prog_run+0x5369>	943ba5: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
5369   943ba9:	0f b6 00             	movzbl (%rax),%eax
536c   943bac:	83 e0 0f             	and    $0xf,%eax
536f   943baf:	8b 7c 24 04          	mov    0x4(%rsp),%edi
5373   943bb3:	48 85 c0             	test   %rax,%rax
5376   943bb6:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
537b   943bbb:	74 02                	je     943bbf <___bpf_prog_run+0x537f>
537d   943bbd:	8b 3a                	mov    (%rdx),%edi
537f   943bbf:	83 e5 0f             	and    $0xf,%ebp
5382   943bc2:	48 09 c8             	or     %rcx,%rax
5385   943bc5:	0f 85 9e 4d 00 00    	jne    948969 <___bpf_prog_run+0xa129>
538b   943bcb:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
5390   943bd0:	48 8d 3c e8          	lea    (%rax,%rbp,8),%rdi
5394   943bd4:	44 8b 3f             	mov    (%rdi),%r15d
5397   943bd7:	e8 00 00 00 00       	call   943bdc <___bpf_prog_run+0x539c>	943bd8: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
539c   943bdc:	49 8d 6d 04          	lea    0x4(%r13),%rbp
53a0   943be0:	8b 18                	mov    (%rax),%ebx
53a2   943be2:	44 8b 32             	mov    (%rdx),%r14d
53a5   943be5:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
53ab   943beb:	0f 85 82 4d 00 00    	jne    948973 <___bpf_prog_run+0xa133>
53b1   943bf1:	44 8b 65 00          	mov    0x0(%rbp),%r12d
53b5   943bf5:	48 89 ef             	mov    %rbp,%rdi
53b8   943bf8:	e8 00 00 00 00       	call   943bfd <___bpf_prog_run+0x53bd>	943bf9: R_X86_64_PLT32	__msan_metadata_ptr_for_load_4-0x4
53bd   943bfd:	85 db                	test   %ebx,%ebx
53bf   943bff:	75 1e                	jne    943c1f <___bpf_prog_run+0x53df>
53c1   943c01:	44 8b 32             	mov    (%rdx),%r14d
53c4   943c04:	0b 18                	or     (%rax),%ebx
53c6   943c06:	74 1b                	je     943c23 <___bpf_prog_run+0x53e3>
53c8   943c08:	44 89 f7             	mov    %r14d,%edi
53cb   943c0b:	e8 00 00 00 00       	call   943c10 <___bpf_prog_run+0x53d0>	943c0c: R_X86_64_PLT32	__msan_warning-0x4
53d0   943c10:	45 39 fc             	cmp    %r15d,%r12d
53d3   943c13:	72 13                	jb     943c28 <___bpf_prog_run+0x53e8>
53d5   943c15:	e8 00 00 00 00       	call   943c1a <___bpf_prog_run+0x53da>	943c16: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
53da   943c1a:	e9 d7 ac ff ff       	jmp    93e8f6 <___bpf_prog_run+0xb6>
53df   943c1f:	0b 18                	or     (%rax),%ebx
53e1   943c21:	75 e5                	jne    943c08 <___bpf_prog_run+0x53c8>
53e3   943c23:	45 39 fc             	cmp    %r15d,%r12d
53e6   943c26:	73 ed                	jae    943c15 <___bpf_prog_run+0x53d5>
53e8   943c28:	e8 00 00 00 00       	call   943c2d <___bpf_prog_run+0x53ed>	943c29: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
53ed   943c2d:	49 8d 5d 02          	lea    0x2(%r13),%rbx
53f1   943c31:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
53f6   943c36:	4d 85 f6             	test   %r14,%r14
53f9   943c39:	0f 84 7d 48 00 00    	je     9484bc <___bpf_prog_run+0x9c7c>
53ff   943c3f:	8b 3c 24             	mov    (%rsp),%edi
5402   943c42:	e8 00 00 00 00       	call   943c47 <___bpf_prog_run+0x5407>	943c43: R_X86_64_PLT32	__msan_warning-0x4
5407   943c47:	e9 70 48 00 00       	jmp    9484bc <___bpf_prog_run+0x9c7c>
540c   943c4c:	e8 00 00 00 00       	call   943c51 <___bpf_prog_run+0x5411>	943c4d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5411   943c51:	49 8d 5d 01          	lea    0x1(%r13),%rbx
5415   943c55:	4d 85 f6             	test   %r14,%r14
5418   943c58:	0f 85 22 4d 00 00    	jne    948980 <___bpf_prog_run+0xa140>
541e   943c5e:	0f b6 2b             	movzbl (%rbx),%ebp
5421   943c61:	48 89 df             	mov    %rbx,%rdi
5424   943c64:	e8 00 00 00 00       	call   943c69 <___bpf_prog_run+0x5429>	943c65: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
5429   943c69:	44 0f b6 30          	movzbl (%rax),%r14d
542d   943c6d:	41 83 e6 0f          	and    $0xf,%r14d
5431   943c71:	8b 5c 24 04          	mov    0x4(%rsp),%ebx
5435   943c75:	4d 85 f6             	test   %r14,%r14
5438   943c78:	74 02                	je     943c7c <___bpf_prog_run+0x543c>
543a   943c7a:	8b 1a                	mov    (%rdx),%ebx
543c   943c7c:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
5441   943c81:	83 e5 0f             	and    $0xf,%ebp
5444   943c84:	4c 0b 74 24 20       	or     0x20(%rsp),%r14
5449   943c89:	0f 85 fe 4c 00 00    	jne    94898d <___bpf_prog_run+0xa14d>
544f   943c8f:	89 5c 24 08          	mov    %ebx,0x8(%rsp)
5453   943c93:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
5458   943c98:	4c 8d 2c e8          	lea    (%rax,%rbp,8),%r13
545c   943c9c:	4d 8b 65 00          	mov    0x0(%r13),%r12
5460   943ca0:	4c 89 ef             	mov    %r13,%rdi
5463   943ca3:	e8 00 00 00 00       	call   943ca8 <___bpf_prog_run+0x5468>	943ca4: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
5468   943ca8:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
546d   943cad:	48 8d 69 04          	lea    0x4(%rcx),%rbp
5471   943cb1:	48 8b 18             	mov    (%rax),%rbx
5474   943cb4:	8b 02                	mov    (%rdx),%eax
5476   943cb6:	89 44 24 18          	mov    %eax,0x18(%rsp)
547a   943cba:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
5480   943cc0:	0f 85 d3 4c 00 00    	jne    948999 <___bpf_prog_run+0xa159>
5486   943cc6:	4c 63 7d 00          	movslq 0x0(%rbp),%r15
548a   943cca:	48 89 ef             	mov    %rbp,%rdi
548d   943ccd:	e8 00 00 00 00       	call   943cd2 <___bpf_prog_run+0x5492>	943cce: R_X86_64_PLT32	__msan_metadata_ptr_for_load_4-0x4
5492   943cd2:	48 63 08             	movslq (%rax),%rcx
5495   943cd5:	48 89 d8             	mov    %rbx,%rax
5498   943cd8:	4c 21 f8             	and    %r15,%rax
549b   943cdb:	4c 09 e3             	or     %r12,%rbx
549e   943cde:	48 21 cb             	and    %rcx,%rbx
54a1   943ce1:	48 85 c9             	test   %rcx,%rcx
54a4   943ce4:	74 06                	je     943cec <___bpf_prog_run+0x54ac>
54a6   943ce6:	8b 0a                	mov    (%rdx),%ecx
54a8   943ce8:	89 4c 24 18          	mov    %ecx,0x18(%rsp)
54ac   943cec:	48 09 c3             	or     %rax,%rbx
54af   943cef:	4d 85 f6             	test   %r14,%r14
54b2   943cf2:	0f 85 ae 4c 00 00    	jne    9489a6 <___bpf_prog_run+0xa166>
54b8   943cf8:	4d 21 fc             	and    %r15,%r12
54bb   943cfb:	4c 89 ef             	mov    %r13,%rdi
54be   943cfe:	e8 00 00 00 00       	call   943d03 <___bpf_prog_run+0x54c3>	943cff: R_X86_64_PLT32	__msan_metadata_ptr_for_store_8-0x4
54c3   943d03:	48 89 18             	mov    %rbx,(%rax)
54c6   943d06:	48 85 db             	test   %rbx,%rbx
54c9   943d09:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
54ce   943d0e:	0f 85 c1 33 00 00    	jne    9470d5 <___bpf_prog_run+0x8895>
54d4   943d14:	4d 89 65 00          	mov    %r12,0x0(%r13)
54d8   943d18:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
54dd   943d1d:	49 83 c5 08          	add    $0x8,%r13
54e1   943d21:	e9 d9 ab ff ff       	jmp    93e8ff <___bpf_prog_run+0xbf>
54e6   943d26:	e8 00 00 00 00       	call   943d2b <___bpf_prog_run+0x54eb>	943d27: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
54eb   943d2b:	49 8d 5d 01          	lea    0x1(%r13),%rbx
54ef   943d2f:	4d 85 f6             	test   %r14,%r14
54f2   943d32:	0f 85 7c 4c 00 00    	jne    9489b4 <___bpf_prog_run+0xa174>
54f8   943d38:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
54fd   943d3d:	44 0f b6 2b          	movzbl (%rbx),%r13d
5501   943d41:	48 89 df             	mov    %rbx,%rdi
5504   943d44:	e8 00 00 00 00       	call   943d49 <___bpf_prog_run+0x5509>	943d45: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
5509   943d49:	44 0f b6 30          	movzbl (%rax),%r14d
550d   943d4d:	44 8b 22             	mov    (%rdx),%r12d
5510   943d50:	45 89 f7             	mov    %r14d,%r15d
5513   943d53:	41 83 e7 0f          	and    $0xf,%r15d
5517   943d57:	44 89 ed             	mov    %r13d,%ebp
551a   943d5a:	83 e5 0f             	and    $0xf,%ebp
551d   943d5d:	4d 85 ff             	test   %r15,%r15
5520   943d60:	8b 5c 24 04          	mov    0x4(%rsp),%ebx
5524   943d64:	41 0f 45 dc          	cmovne %r12d,%ebx
5528   943d68:	4c 0b 7c 24 20       	or     0x20(%rsp),%r15
552d   943d6d:	0f 85 4e 4c 00 00    	jne    9489c1 <___bpf_prog_run+0xa181>
5533   943d73:	89 5c 24 40          	mov    %ebx,0x40(%rsp)
5537   943d77:	48 8b 5c 24 30       	mov    0x30(%rsp),%rbx
553c   943d7c:	48 8d 3c eb          	lea    (%rbx,%rbp,8),%rdi
5540   943d80:	48 8b 2f             	mov    (%rdi),%rbp
5543   943d83:	48 89 7c 24 18       	mov    %rdi,0x18(%rsp)
5548   943d88:	e8 00 00 00 00       	call   943d8d <___bpf_prog_run+0x554d>	943d89: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
554d   943d8d:	48 8b 00             	mov    (%rax),%rax
5550   943d90:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
5555   943d95:	8b 02                	mov    (%rdx),%eax
5557   943d97:	89 44 24 38          	mov    %eax,0x38(%rsp)
555b   943d9b:	49 c1 ee 04          	shr    $0x4,%r14
555f   943d9f:	49 c1 ed 04          	shr    $0x4,%r13
5563   943da3:	4d 85 f6             	test   %r14,%r14
5566   943da6:	44 0f 44 64 24 04    	cmove  0x4(%rsp),%r12d
556c   943dac:	4c 0b 74 24 20       	or     0x20(%rsp),%r14
5571   943db1:	0f 85 16 4c 00 00    	jne    9489cd <___bpf_prog_run+0xa18d>
5577   943db7:	4a 8d 3c eb          	lea    (%rbx,%r13,8),%rdi
557b   943dbb:	48 0f af 2f          	imul   (%rdi),%rbp
557f   943dbf:	e8 00 00 00 00       	call   943dc4 <___bpf_prog_run+0x5584>	943dc0: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
5584   943dc4:	48 8b 18             	mov    (%rax),%rbx
5587   943dc7:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
558c   943dcc:	48 09 c3             	or     %rax,%rbx
558f   943dcf:	48 85 c0             	test   %rax,%rax
5592   943dd2:	49 89 ec             	mov    %rbp,%r12
5595   943dd5:	75 06                	jne    943ddd <___bpf_prog_run+0x559d>
5597   943dd7:	8b 02                	mov    (%rdx),%eax
5599   943dd9:	89 44 24 38          	mov    %eax,0x38(%rsp)
559d   943ddd:	4d 85 ff             	test   %r15,%r15
55a0   943de0:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
55a5   943de5:	0f 84 33 03 00 00    	je     94411e <___bpf_prog_run+0x58de>
55ab   943deb:	8b 7c 24 40          	mov    0x40(%rsp),%edi
55af   943def:	e8 00 00 00 00       	call   943df4 <___bpf_prog_run+0x55b4>	943df0: R_X86_64_PLT32	__msan_warning-0x4
55b4   943df4:	e9 25 03 00 00       	jmp    94411e <___bpf_prog_run+0x58de>
55b9   943df9:	49 8d 5d 01          	lea    0x1(%r13),%rbx
55bd   943dfd:	4d 85 f6             	test   %r14,%r14
55c0   943e00:	0f 85 d4 4b 00 00    	jne    9489da <___bpf_prog_run+0xa19a>
55c6   943e06:	0f b6 2b             	movzbl (%rbx),%ebp
55c9   943e09:	48 89 df             	mov    %rbx,%rdi
55cc   943e0c:	e8 00 00 00 00       	call   943e11 <___bpf_prog_run+0x55d1>	943e0d: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
55d1   943e11:	0f b6 00             	movzbl (%rax),%eax
55d4   943e14:	83 e0 0f             	and    $0xf,%eax
55d7   943e17:	8b 7c 24 04          	mov    0x4(%rsp),%edi
55db   943e1b:	48 85 c0             	test   %rax,%rax
55de   943e1e:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
55e3   943e23:	74 02                	je     943e27 <___bpf_prog_run+0x55e7>
55e5   943e25:	8b 3a                	mov    (%rdx),%edi
55e7   943e27:	83 e5 0f             	and    $0xf,%ebp
55ea   943e2a:	48 09 c8             	or     %rcx,%rax
55ed   943e2d:	0f 85 b4 4b 00 00    	jne    9489e7 <___bpf_prog_run+0xa1a7>
55f3   943e33:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
55f8   943e38:	48 8d 3c e8          	lea    (%rax,%rbp,8),%rdi
55fc   943e3c:	4c 8b 3f             	mov    (%rdi),%r15
55ff   943e3f:	e8 00 00 00 00       	call   943e44 <___bpf_prog_run+0x5604>	943e40: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
5604   943e44:	49 8d 6d 04          	lea    0x4(%r13),%rbp
5608   943e48:	48 8b 18             	mov    (%rax),%rbx
560b   943e4b:	44 8b 32             	mov    (%rdx),%r14d
560e   943e4e:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
5614   943e54:	0f 85 97 4b 00 00    	jne    9489f1 <___bpf_prog_run+0xa1b1>
561a   943e5a:	4c 63 65 00          	movslq 0x0(%rbp),%r12
561e   943e5e:	48 89 ef             	mov    %rbp,%rdi
5621   943e61:	e8 00 00 00 00       	call   943e66 <___bpf_prog_run+0x5626>	943e62: R_X86_64_PLT32	__msan_metadata_ptr_for_load_4-0x4
5626   943e66:	48 63 00             	movslq (%rax),%rax
5629   943e69:	48 85 c0             	test   %rax,%rax
562c   943e6c:	74 39                	je     943ea7 <___bpf_prog_run+0x5667>
562e   943e6e:	44 8b 32             	mov    (%rdx),%r14d
5631   943e71:	48 09 c3             	or     %rax,%rbx
5634   943e74:	74 36                	je     943eac <___bpf_prog_run+0x566c>
5636   943e76:	44 89 f7             	mov    %r14d,%edi
5639   943e79:	e8 00 00 00 00       	call   943e7e <___bpf_prog_run+0x563e>	943e7a: R_X86_64_PLT32	__msan_warning-0x4
563e   943e7e:	4d 39 e7             	cmp    %r12,%r15
5641   943e81:	72 2e                	jb     943eb1 <___bpf_prog_run+0x5671>
5643   943e83:	e8 00 00 00 00       	call   943e88 <___bpf_prog_run+0x5648>	943e84: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5648   943e88:	49 8d 5d 02          	lea    0x2(%r13),%rbx
564c   943e8c:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
5651   943e91:	4d 85 f6             	test   %r14,%r14
5654   943e94:	0f 84 22 46 00 00    	je     9484bc <___bpf_prog_run+0x9c7c>
565a   943e9a:	8b 3c 24             	mov    (%rsp),%edi
565d   943e9d:	e8 00 00 00 00       	call   943ea2 <___bpf_prog_run+0x5662>	943e9e: R_X86_64_PLT32	__msan_warning-0x4
5662   943ea2:	e9 15 46 00 00       	jmp    9484bc <___bpf_prog_run+0x9c7c>
5667   943ea7:	48 09 c3             	or     %rax,%rbx
566a   943eaa:	75 ca                	jne    943e76 <___bpf_prog_run+0x5636>
566c   943eac:	4d 39 e7             	cmp    %r12,%r15
566f   943eaf:	73 d2                	jae    943e83 <___bpf_prog_run+0x5643>
5671   943eb1:	e8 00 00 00 00       	call   943eb6 <___bpf_prog_run+0x5676>	943eb2: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5676   943eb6:	e9 3b aa ff ff       	jmp    93e8f6 <___bpf_prog_run+0xb6>
567b   943ebb:	e8 00 00 00 00       	call   943ec0 <___bpf_prog_run+0x5680>	943ebc: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5680   943ec0:	4c 89 f0             	mov    %r14,%rax
5683   943ec3:	4d 8d 75 01          	lea    0x1(%r13),%r14
5687   943ec7:	48 85 c0             	test   %rax,%rax
568a   943eca:	0f 85 2e 4b 00 00    	jne    9489fe <___bpf_prog_run+0xa1be>
5690   943ed0:	41 0f b6 1e          	movzbl (%r14),%ebx
5694   943ed4:	4c 89 f7             	mov    %r14,%rdi
5697   943ed7:	e8 00 00 00 00       	call   943edc <___bpf_prog_run+0x569c>	943ed8: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
569c   943edc:	0f b6 00             	movzbl (%rax),%eax
569f   943edf:	83 e0 0f             	and    $0xf,%eax
56a2   943ee2:	8b 7c 24 04          	mov    0x4(%rsp),%edi
56a6   943ee6:	48 85 c0             	test   %rax,%rax
56a9   943ee9:	74 02                	je     943eed <___bpf_prog_run+0x56ad>
56ab   943eeb:	8b 3a                	mov    (%rdx),%edi
56ad   943eed:	83 e3 0f             	and    $0xf,%ebx
56b0   943ef0:	48 8b 6c 24 20       	mov    0x20(%rsp),%rbp
56b5   943ef5:	48 09 e8             	or     %rbp,%rax
56b8   943ef8:	0f 85 0d 4b 00 00    	jne    948a0b <___bpf_prog_run+0xa1cb>
56be   943efe:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
56c3   943f03:	48 8d 3c d8          	lea    (%rax,%rbx,8),%rdi
56c7   943f07:	44 8b 3f             	mov    (%rdi),%r15d
56ca   943f0a:	e8 00 00 00 00       	call   943f0f <___bpf_prog_run+0x56cf>	943f0b: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
56cf   943f0f:	44 8b 20             	mov    (%rax),%r12d
56d2   943f12:	8b 02                	mov    (%rdx),%eax
56d4   943f14:	89 44 24 08          	mov    %eax,0x8(%rsp)
56d8   943f18:	48 85 ed             	test   %rbp,%rbp
56db   943f1b:	0f 85 f4 4a 00 00    	jne    948a15 <___bpf_prog_run+0xa1d5>
56e1   943f21:	48 8b 6c 24 60       	mov    0x60(%rsp),%rbp
56e6   943f26:	48 89 ef             	mov    %rbp,%rdi
56e9   943f29:	e8 00 00 00 00       	call   943f2e <___bpf_prog_run+0x56ee>	943f2a: R_X86_64_PLT32	__msan_metadata_ptr_for_store_8-0x4
56ee   943f2e:	4c 89 20             	mov    %r12,(%rax)
56f1   943f31:	4d 85 e4             	test   %r12,%r12
56f4   943f34:	0f 85 e9 4a 00 00    	jne    948a23 <___bpf_prog_run+0xa1e3>
56fa   943f3a:	4c 89 7d 00          	mov    %r15,0x0(%rbp)
56fe   943f3e:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
5704   943f44:	0f 85 f9 4a 00 00    	jne    948a43 <___bpf_prog_run+0xa203>
570a   943f4a:	41 0f b6 1e          	movzbl (%r14),%ebx
570e   943f4e:	4c 89 f7             	mov    %r14,%rdi
5711   943f51:	e8 00 00 00 00       	call   943f56 <___bpf_prog_run+0x5716>	943f52: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
5716   943f56:	0f b6 00             	movzbl (%rax),%eax
5719   943f59:	48 c1 e8 04          	shr    $0x4,%rax
571d   943f5d:	48 d1 eb             	shr    %rbx
5720   943f60:	83 e3 78             	and    $0x78,%ebx
5723   943f63:	8b 7c 24 04          	mov    0x4(%rsp),%edi
5727   943f67:	48 85 c0             	test   %rax,%rax
572a   943f6a:	74 02                	je     943f6e <___bpf_prog_run+0x572e>
572c   943f6c:	8b 3a                	mov    (%rdx),%edi
572e   943f6e:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
5733   943f73:	48 03 5c 24 30       	add    0x30(%rsp),%rbx
5738   943f78:	48 0b 44 24 20       	or     0x20(%rsp),%rax
573d   943f7d:	0f 85 cd 4a 00 00    	jne    948a50 <___bpf_prog_run+0xa210>
5743   943f83:	8b 2b                	mov    (%rbx),%ebp
5745   943f85:	48 89 df             	mov    %rbx,%rdi
5748   943f88:	e8 00 00 00 00       	call   943f8d <___bpf_prog_run+0x574d>	943f89: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
574d   943f8d:	8b 18                	mov    (%rax),%ebx
574f   943f8f:	44 8b 2a             	mov    (%rdx),%r13d
5752   943f92:	85 db                	test   %ebx,%ebx
5754   943f94:	0f 85 c0 4a 00 00    	jne    948a5a <___bpf_prog_run+0xa21a>
575a   943f9a:	44 89 f8             	mov    %r15d,%eax
575d   943f9d:	31 d2                	xor    %edx,%edx
575f   943f9f:	f7 f5                	div    %ebp
5761   943fa1:	48 89 54 24 18       	mov    %rdx,0x18(%rsp)
5766   943fa6:	85 db                	test   %ebx,%ebx
5768   943fa8:	0f 85 b9 4a 00 00    	jne    948a67 <___bpf_prog_run+0xa227>
576e   943fae:	44 89 f8             	mov    %r15d,%eax
5771   943fb1:	31 d2                	xor    %edx,%edx
5773   943fb3:	f7 f5                	div    %ebp
5775   943fb5:	41 89 c5             	mov    %eax,%r13d
5778   943fb8:	48 83 7c 24 20 00    	cmpq   $0x0,0x20(%rsp)
577e   943fbe:	0f 85 b0 4a 00 00    	jne    948a74 <___bpf_prog_run+0xa234>
5784   943fc4:	44 89 e5             	mov    %r12d,%ebp
5787   943fc7:	48 8b 5c 24 60       	mov    0x60(%rsp),%rbx
578c   943fcc:	48 89 df             	mov    %rbx,%rdi
578f   943fcf:	e8 00 00 00 00       	call   943fd4 <___bpf_prog_run+0x5794>	943fd0: R_X86_64_PLT32	__msan_metadata_ptr_for_store_8-0x4
5794   943fd4:	48 89 28             	mov    %rbp,(%rax)
5797   943fd7:	48 85 ed             	test   %rbp,%rbp
579a   943fda:	0f 85 a2 4a 00 00    	jne    948a82 <___bpf_prog_run+0xa242>
57a0   943fe0:	4c 89 2b             	mov    %r13,(%rbx)
57a3   943fe3:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
57a9   943fe9:	0f 85 b3 4a 00 00    	jne    948aa2 <___bpf_prog_run+0xa262>
57af   943fef:	41 0f b6 1e          	movzbl (%r14),%ebx
57b3   943ff3:	4c 89 f7             	mov    %r14,%rdi
57b6   943ff6:	e8 00 00 00 00       	call   943ffb <___bpf_prog_run+0x57bb>	943ff7: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
57bb   943ffb:	0f b6 00             	movzbl (%rax),%eax
57be   943ffe:	83 e0 0f             	and    $0xf,%eax
57c1   944001:	8b 7c 24 04          	mov    0x4(%rsp),%edi
57c5   944005:	48 85 c0             	test   %rax,%rax
57c8   944008:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
57cd   94400d:	74 02                	je     944011 <___bpf_prog_run+0x57d1>
57cf   94400f:	8b 3a                	mov    (%rdx),%edi
57d1   944011:	83 e3 0f             	and    $0xf,%ebx
57d4   944014:	48 0b 44 24 20       	or     0x20(%rsp),%rax
57d9   944019:	0f 85 90 4a 00 00    	jne    948aaf <___bpf_prog_run+0xa26f>
57df   94401f:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
57e4   944024:	48 8d 1c d8          	lea    (%rax,%rbx,8),%rbx
57e8   944028:	48 89 df             	mov    %rbx,%rdi
57eb   94402b:	e8 00 00 00 00       	call   944030 <___bpf_prog_run+0x57f0>	94402c: R_X86_64_PLT32	__msan_metadata_ptr_for_store_8-0x4
57f0   944030:	48 89 28             	mov    %rbp,(%rax)
57f3   944033:	48 85 ed             	test   %rbp,%rbp
57f6   944036:	0f 84 a4 0a 00 00    	je     944ae0 <___bpf_prog_run+0x62a0>
57fc   94403c:	49 89 d6             	mov    %rdx,%r14
57ff   94403f:	8b 7c 24 08          	mov    0x8(%rsp),%edi
5803   944043:	e8 00 00 00 00       	call   944048 <___bpf_prog_run+0x5808>	944044: R_X86_64_PLT32	__msan_chain_origin-0x4
5808   944048:	89 c0                	mov    %eax,%eax
580a   94404a:	48 89 c1             	mov    %rax,%rcx
580d   94404d:	48 c1 e1 20          	shl    $0x20,%rcx
5811   944051:	48 09 c1             	or     %rax,%rcx
5814   944054:	49 89 0e             	mov    %rcx,(%r14)
5817   944057:	e9 84 0a 00 00       	jmp    944ae0 <___bpf_prog_run+0x62a0>
581c   94405c:	e8 00 00 00 00       	call   944061 <___bpf_prog_run+0x5821>	94405d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5821   944061:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
5826   944066:	49 8d 5d 01          	lea    0x1(%r13),%rbx
582a   94406a:	4d 85 f6             	test   %r14,%r14
582d   94406d:	0f 85 46 4a 00 00    	jne    948ab9 <___bpf_prog_run+0xa279>
5833   944073:	44 0f b6 2b          	movzbl (%rbx),%r13d
5837   944077:	48 89 df             	mov    %rbx,%rdi
583a   94407a:	e8 00 00 00 00       	call   94407f <___bpf_prog_run+0x583f>	94407b: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
583f   94407f:	44 0f b6 30          	movzbl (%rax),%r14d
5843   944083:	44 8b 22             	mov    (%rdx),%r12d
5846   944086:	45 89 f7             	mov    %r14d,%r15d
5849   944089:	41 83 e7 0f          	and    $0xf,%r15d
584d   94408d:	44 89 ed             	mov    %r13d,%ebp
5850   944090:	83 e5 0f             	and    $0xf,%ebp
5853   944093:	4d 85 ff             	test   %r15,%r15
5856   944096:	8b 5c 24 04          	mov    0x4(%rsp),%ebx
585a   94409a:	41 0f 45 dc          	cmovne %r12d,%ebx
585e   94409e:	4c 0b 7c 24 20       	or     0x20(%rsp),%r15
5863   9440a3:	0f 85 1d 4a 00 00    	jne    948ac6 <___bpf_prog_run+0xa286>
5869   9440a9:	89 5c 24 40          	mov    %ebx,0x40(%rsp)
586d   9440ad:	48 8b 5c 24 30       	mov    0x30(%rsp),%rbx
5872   9440b2:	48 8d 3c eb          	lea    (%rbx,%rbp,8),%rdi
5876   9440b6:	48 8b 2f             	mov    (%rdi),%rbp
5879   9440b9:	48 89 7c 24 18       	mov    %rdi,0x18(%rsp)
587e   9440be:	e8 00 00 00 00       	call   9440c3 <___bpf_prog_run+0x5883>	9440bf: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
5883   9440c3:	48 8b 00             	mov    (%rax),%rax
5886   9440c6:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
588b   9440cb:	8b 02                	mov    (%rdx),%eax
588d   9440cd:	89 44 24 38          	mov    %eax,0x38(%rsp)
5891   9440d1:	49 c1 ee 04          	shr    $0x4,%r14
5895   9440d5:	49 c1 ed 04          	shr    $0x4,%r13
5899   9440d9:	4d 85 f6             	test   %r14,%r14
589c   9440dc:	44 0f 44 64 24 04    	cmove  0x4(%rsp),%r12d
58a2   9440e2:	4c 0b 74 24 20       	or     0x20(%rsp),%r14
58a7   9440e7:	0f 85 e5 49 00 00    	jne    948ad2 <___bpf_prog_run+0xa292>
58ad   9440ed:	4a 8d 3c eb          	lea    (%rbx,%r13,8),%rdi
58b1   9440f1:	0f af 2f             	imul   (%rdi),%ebp
58b4   9440f4:	e8 00 00 00 00       	call   9440f9 <___bpf_prog_run+0x58b9>	9440f5: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
58b9   9440f9:	8b 18                	mov    (%rax),%ebx
58bb   9440fb:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
58c0   944100:	09 c3                	or     %eax,%ebx
58c2   944102:	48 85 c0             	test   %rax,%rax
58c5   944105:	75 06                	jne    94410d <___bpf_prog_run+0x58cd>
58c7   944107:	8b 02                	mov    (%rdx),%eax
58c9   944109:	89 44 24 38          	mov    %eax,0x38(%rsp)
58cd   94410d:	49 89 ec             	mov    %rbp,%r12
58d0   944110:	4d 85 ff             	test   %r15,%r15
58d3   944113:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
58d8   944118:	0f 85 c1 49 00 00    	jne    948adf <___bpf_prog_run+0xa29f>
58de   94411e:	48 8b 6c 24 18       	mov    0x18(%rsp),%rbp
58e3   944123:	48 89 ef             	mov    %rbp,%rdi
58e6   944126:	e8 00 00 00 00       	call   94412b <___bpf_prog_run+0x58eb>	944127: R_X86_64_PLT32	__msan_metadata_ptr_for_store_8-0x4
58eb   94412b:	48 89 18             	mov    %rbx,(%rax)
58ee   94412e:	48 85 db             	test   %rbx,%rbx
58f1   944131:	0f 85 7e 2f 00 00    	jne    9470b5 <___bpf_prog_run+0x8875>
58f7   944137:	4c 89 65 00          	mov    %r12,0x0(%rbp)
58fb   94413b:	e9 b6 a7 ff ff       	jmp    93e8f6 <___bpf_prog_run+0xb6>
5900   944140:	e8 00 00 00 00       	call   944145 <___bpf_prog_run+0x5905>	944141: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5905   944145:	49 8d 5d 01          	lea    0x1(%r13),%rbx
5909   944149:	4d 85 f6             	test   %r14,%r14
590c   94414c:	0f 85 9b 49 00 00    	jne    948aed <___bpf_prog_run+0xa2ad>
5912   944152:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
5917   944157:	44 0f b6 33          	movzbl (%rbx),%r14d
591b   94415b:	48 89 df             	mov    %rbx,%rdi
591e   94415e:	e8 00 00 00 00       	call   944163 <___bpf_prog_run+0x5923>	94415f: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
5923   944163:	0f b6 28             	movzbl (%rax),%ebp
5926   944166:	44 8b 22             	mov    (%rdx),%r12d
5929   944169:	48 89 e8             	mov    %rbp,%rax
592c   94416c:	48 c1 e8 04          	shr    $0x4,%rax
5930   944170:	4c 89 f3             	mov    %r14,%rbx
5933   944173:	48 c1 eb 04          	shr    $0x4,%rbx
5937   944177:	48 85 c0             	test   %rax,%rax
593a   94417a:	8b 7c 24 04          	mov    0x4(%rsp),%edi
593e   94417e:	41 0f 45 fc          	cmovne %r12d,%edi
5942   944182:	4c 8b 7c 24 20       	mov    0x20(%rsp),%r15
5947   944187:	4c 09 f8             	or     %r15,%rax
594a   94418a:	0f 85 6a 49 00 00    	jne    948afa <___bpf_prog_run+0xa2ba>
5950   944190:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
5955   944195:	48 8d 3c d8          	lea    (%rax,%rbx,8),%rdi
5959   944199:	48 89 c3             	mov    %rax,%rbx
595c   94419c:	4c 8b 2f             	mov    (%rdi),%r13
595f   94419f:	e8 00 00 00 00       	call   9441a4 <___bpf_prog_run+0x5964>	9441a0: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
5964   9441a4:	48 8b 00             	mov    (%rax),%rax
5967   9441a7:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
596c   9441ac:	8b 02                	mov    (%rdx),%eax
596e   9441ae:	89 44 24 08          	mov    %eax,0x8(%rsp)
5972   9441b2:	83 e5 0f             	and    $0xf,%ebp
5975   9441b5:	41 83 e6 0f          	and    $0xf,%r14d
5979   9441b9:	48 85 ed             	test   %rbp,%rbp
597c   9441bc:	44 0f 44 64 24 04    	cmove  0x4(%rsp),%r12d
5982   9441c2:	4c 09 fd             	or     %r15,%rbp
5985   9441c5:	0f 85 39 49 00 00    	jne    948b04 <___bpf_prog_run+0xa2c4>
598b   9441cb:	45 89 e7             	mov    %r12d,%r15d
598e   9441ce:	41 83 e5 3f          	and    $0x3f,%r13d
5992   9441d2:	4e 8d 24 f3          	lea    (%rbx,%r14,8),%r12
5996   9441d6:	4d 8b 34 24          	mov    (%r12),%r14
599a   9441da:	4c 89 e7             	mov    %r12,%rdi
599d   9441dd:	e8 00 00 00 00       	call   9441e2 <___bpf_prog_run+0x59a2>	9441de: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
59a2   9441e2:	48 8b 18             	mov    (%rax),%rbx
59a5   9441e5:	31 c0                	xor    %eax,%eax
59a7   9441e7:	f6 44 24 18 3f       	testb  $0x3f,0x18(%rsp)
59ac   9441ec:	0f 95 c1             	setne  %cl
59af   9441ef:	75 06                	jne    9441f7 <___bpf_prog_run+0x59b7>
59b1   9441f1:	8b 12                	mov    (%rdx),%edx
59b3   9441f3:	89 54 24 08          	mov    %edx,0x8(%rsp)
59b7   9441f7:	88 c8                	mov    %cl,%al
59b9   9441f9:	48 f7 d8             	neg    %rax
59bc   9441fc:	44 89 e9             	mov    %r13d,%ecx
59bf   9441ff:	48 d3 e3             	shl    %cl,%rbx
59c2   944202:	48 09 c3             	or     %rax,%rbx
59c5   944205:	49 d3 e6             	shl    %cl,%r14
59c8   944208:	48 85 ed             	test   %rbp,%rbp
59cb   94420b:	0f 85 00 49 00 00    	jne    948b11 <___bpf_prog_run+0xa2d1>
59d1   944211:	4c 89 e7             	mov    %r12,%rdi
59d4   944214:	e8 00 00 00 00       	call   944219 <___bpf_prog_run+0x59d9>	944215: R_X86_64_PLT32	__msan_metadata_ptr_for_store_8-0x4
59d9   944219:	48 89 18             	mov    %rbx,(%rax)
59dc   94421c:	48 85 db             	test   %rbx,%rbx
59df   94421f:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
59e4   944224:	0f 85 cc 2e 00 00    	jne    9470f6 <___bpf_prog_run+0x88b6>
59ea   94422a:	4d 89 34 24          	mov    %r14,(%r12)
59ee   94422e:	e9 c3 a6 ff ff       	jmp    93e8f6 <___bpf_prog_run+0xb6>
59f3   944233:	e8 00 00 00 00       	call   944238 <___bpf_prog_run+0x59f8>	944234: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
59f8   944238:	4d 8d 65 01          	lea    0x1(%r13),%r12
59fc   94423c:	4d 85 f6             	test   %r14,%r14
59ff   94423f:	0f 85 d9 48 00 00    	jne    948b1e <___bpf_prog_run+0xa2de>
5a05   944245:	41 0f b6 1c 24       	movzbl (%r12),%ebx
5a0a   94424a:	4c 89 e7             	mov    %r12,%rdi
5a0d   94424d:	e8 00 00 00 00       	call   944252 <___bpf_prog_run+0x5a12>	94424e: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
5a12   944252:	0f b6 00             	movzbl (%rax),%eax
5a15   944255:	83 e0 0f             	and    $0xf,%eax
5a18   944258:	8b 7c 24 04          	mov    0x4(%rsp),%edi
5a1c   94425c:	48 85 c0             	test   %rax,%rax
5a1f   94425f:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
5a24   944264:	74 02                	je     944268 <___bpf_prog_run+0x5a28>
5a26   944266:	8b 3a                	mov    (%rdx),%edi
5a28   944268:	83 e3 0f             	and    $0xf,%ebx
5a2b   94426b:	48 09 c8             	or     %rcx,%rax
5a2e   94426e:	0f 85 b7 48 00 00    	jne    948b2b <___bpf_prog_run+0xa2eb>
5a34   944274:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
5a39   944279:	48 8d 3c d8          	lea    (%rax,%rbx,8),%rdi
5a3d   94427d:	4c 8b 3f             	mov    (%rdi),%r15
5a40   944280:	e8 00 00 00 00       	call   944285 <___bpf_prog_run+0x5a45>	944281: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
5a45   944285:	49 8d 5d 04          	lea    0x4(%r13),%rbx
5a49   944289:	4c 8b 30             	mov    (%rax),%r14
5a4c   94428c:	8b 02                	mov    (%rdx),%eax
5a4e   94428e:	89 44 24 18          	mov    %eax,0x18(%rsp)
5a52   944292:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
5a58   944298:	0f 85 97 48 00 00    	jne    948b35 <___bpf_prog_run+0xa2f5>
5a5e   94429e:	48 63 2b             	movslq (%rbx),%rbp
5a61   9442a1:	48 89 df             	mov    %rbx,%rdi
5a64   9442a4:	e8 00 00 00 00       	call   9442a9 <___bpf_prog_run+0x5a69>	9442a5: R_X86_64_PLT32	__msan_metadata_ptr_for_load_4-0x4
5a69   9442a9:	83 38 00             	cmpl   $0x0,(%rax)
5a6c   9442ac:	0f 85 90 48 00 00    	jne    948b42 <___bpf_prog_run+0xa302>
5a72   9442b2:	4c 89 f8             	mov    %r15,%rax
5a75   9442b5:	48 09 e8             	or     %rbp,%rax
5a78   9442b8:	48 c1 e8 20          	shr    $0x20,%rax
5a7c   9442bc:	48 8b 5c 24 60       	mov    0x60(%rsp),%rbx
5a81   9442c1:	0f 84 e1 12 00 00    	je     9455a8 <___bpf_prog_run+0x6d68>
5a87   9442c7:	4c 89 f8             	mov    %r15,%rax
5a8a   9442ca:	31 d2                	xor    %edx,%edx
5a8c   9442cc:	48 f7 f5             	div    %rbp
5a8f   9442cf:	49 89 d7             	mov    %rdx,%r15
5a92   9442d2:	48 83 7c 24 20 00    	cmpq   $0x0,0x20(%rsp)
5a98   9442d8:	0f 85 e0 12 00 00    	jne    9455be <___bpf_prog_run+0x6d7e>
5a9e   9442de:	48 89 df             	mov    %rbx,%rdi
5aa1   9442e1:	e8 00 00 00 00       	call   9442e6 <___bpf_prog_run+0x5aa6>	9442e2: R_X86_64_PLT32	__msan_metadata_ptr_for_store_8-0x4
5aa6   9442e6:	4c 89 30             	mov    %r14,(%rax)
5aa9   9442e9:	4d 85 f6             	test   %r14,%r14
5aac   9442ec:	0f 85 5c 48 00 00    	jne    948b4e <___bpf_prog_run+0xa30e>
5ab2   9442f2:	4c 89 3b             	mov    %r15,(%rbx)
5ab5   9442f5:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
5abb   9442fb:	0f 85 6e 48 00 00    	jne    948b6f <___bpf_prog_run+0xa32f>
5ac1   944301:	41 0f b6 1c 24       	movzbl (%r12),%ebx
5ac6   944306:	4c 89 e7             	mov    %r12,%rdi
5ac9   944309:	e8 00 00 00 00       	call   94430e <___bpf_prog_run+0x5ace>	94430a: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
5ace   94430e:	0f b6 00             	movzbl (%rax),%eax
5ad1   944311:	83 e0 0f             	and    $0xf,%eax
5ad4   944314:	8b 7c 24 04          	mov    0x4(%rsp),%edi
5ad8   944318:	48 85 c0             	test   %rax,%rax
5adb   94431b:	74 02                	je     94431f <___bpf_prog_run+0x5adf>
5add   94431d:	8b 3a                	mov    (%rdx),%edi
5adf   94431f:	83 e3 0f             	and    $0xf,%ebx
5ae2   944322:	48 0b 44 24 20       	or     0x20(%rsp),%rax
5ae7   944327:	0f 84 2a 01 00 00    	je     944457 <___bpf_prog_run+0x5c17>
5aed   94432d:	e8 00 00 00 00       	call   944332 <___bpf_prog_run+0x5af2>	94432e: R_X86_64_PLT32	__msan_warning-0x4
5af2   944332:	e9 20 01 00 00       	jmp    944457 <___bpf_prog_run+0x5c17>
5af7   944337:	e8 00 00 00 00       	call   94433c <___bpf_prog_run+0x5afc>	944338: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5afc   94433c:	4d 8d 65 01          	lea    0x1(%r13),%r12
5b00   944340:	4d 85 f6             	test   %r14,%r14
5b03   944343:	0f 85 33 48 00 00    	jne    948b7c <___bpf_prog_run+0xa33c>
5b09   944349:	41 0f b6 1c 24       	movzbl (%r12),%ebx
5b0e   94434e:	4c 89 e7             	mov    %r12,%rdi
5b11   944351:	e8 00 00 00 00       	call   944356 <___bpf_prog_run+0x5b16>	944352: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
5b16   944356:	0f b6 00             	movzbl (%rax),%eax
5b19   944359:	83 e0 0f             	and    $0xf,%eax
5b1c   94435c:	8b 7c 24 04          	mov    0x4(%rsp),%edi
5b20   944360:	48 85 c0             	test   %rax,%rax
5b23   944363:	48 8b 6c 24 20       	mov    0x20(%rsp),%rbp
5b28   944368:	74 02                	je     94436c <___bpf_prog_run+0x5b2c>
5b2a   94436a:	8b 3a                	mov    (%rdx),%edi
5b2c   94436c:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
5b31   944371:	83 e3 0f             	and    $0xf,%ebx
5b34   944374:	48 09 e8             	or     %rbp,%rax
5b37   944377:	0f 85 0c 48 00 00    	jne    948b89 <___bpf_prog_run+0xa349>
5b3d   94437d:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
5b42   944382:	48 8d 3c d8          	lea    (%rax,%rbx,8),%rdi
5b46   944386:	44 8b 37             	mov    (%rdi),%r14d
5b49   944389:	e8 00 00 00 00       	call   94438e <___bpf_prog_run+0x5b4e>	94438a: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
5b4e   94438e:	44 8b 28             	mov    (%rax),%r13d
5b51   944391:	8b 02                	mov    (%rdx),%eax
5b53   944393:	89 44 24 18          	mov    %eax,0x18(%rsp)
5b57   944397:	48 85 ed             	test   %rbp,%rbp
5b5a   94439a:	0f 85 f3 47 00 00    	jne    948b93 <___bpf_prog_run+0xa353>
5b60   9443a0:	48 8b 6c 24 60       	mov    0x60(%rsp),%rbp
5b65   9443a5:	48 89 ef             	mov    %rbp,%rdi
5b68   9443a8:	e8 00 00 00 00       	call   9443ad <___bpf_prog_run+0x5b6d>	9443a9: R_X86_64_PLT32	__msan_metadata_ptr_for_store_8-0x4
5b6d   9443ad:	4c 89 28             	mov    %r13,(%rax)
5b70   9443b0:	4d 85 ed             	test   %r13,%r13
5b73   9443b3:	0f 85 e8 47 00 00    	jne    948ba1 <___bpf_prog_run+0xa361>
5b79   9443b9:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
5b7e   9443be:	48 8d 58 04          	lea    0x4(%rax),%rbx
5b82   9443c2:	4c 89 75 00          	mov    %r14,0x0(%rbp)
5b86   9443c6:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
5b8c   9443cc:	0f 85 ef 47 00 00    	jne    948bc1 <___bpf_prog_run+0xa381>
5b92   9443d2:	8b 2b                	mov    (%rbx),%ebp
5b94   9443d4:	48 89 df             	mov    %rbx,%rdi
5b97   9443d7:	e8 00 00 00 00       	call   9443dc <___bpf_prog_run+0x5b9c>	9443d8: R_X86_64_PLT32	__msan_metadata_ptr_for_load_4-0x4
5b9c   9443dc:	83 38 00             	cmpl   $0x0,(%rax)
5b9f   9443df:	0f 85 e9 47 00 00    	jne    948bce <___bpf_prog_run+0xa38e>
5ba5   9443e5:	44 89 f0             	mov    %r14d,%eax
5ba8   9443e8:	31 d2                	xor    %edx,%edx
5baa   9443ea:	f7 f5                	div    %ebp
5bac   9443ec:	41 89 c7             	mov    %eax,%r15d
5baf   9443ef:	48 83 7c 24 20 00    	cmpq   $0x0,0x20(%rsp)
5bb5   9443f5:	48 8b 5c 24 60       	mov    0x60(%rsp),%rbx
5bba   9443fa:	0f 85 da 47 00 00    	jne    948bda <___bpf_prog_run+0xa39a>
5bc0   944400:	45 89 ee             	mov    %r13d,%r14d
5bc3   944403:	48 89 df             	mov    %rbx,%rdi
5bc6   944406:	e8 00 00 00 00       	call   94440b <___bpf_prog_run+0x5bcb>	944407: R_X86_64_PLT32	__msan_metadata_ptr_for_store_8-0x4
5bcb   94440b:	4c 89 30             	mov    %r14,(%rax)
5bce   94440e:	4d 85 f6             	test   %r14,%r14
5bd1   944411:	0f 85 d1 47 00 00    	jne    948be8 <___bpf_prog_run+0xa3a8>
5bd7   944417:	4c 89 3b             	mov    %r15,(%rbx)
5bda   94441a:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
5be0   944420:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
5be5   944425:	0f 85 de 47 00 00    	jne    948c09 <___bpf_prog_run+0xa3c9>
5beb   94442b:	41 0f b6 1c 24       	movzbl (%r12),%ebx
5bf0   944430:	4c 89 e7             	mov    %r12,%rdi
5bf3   944433:	e8 00 00 00 00       	call   944438 <___bpf_prog_run+0x5bf8>	944434: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
5bf8   944438:	0f b6 00             	movzbl (%rax),%eax
5bfb   94443b:	83 e0 0f             	and    $0xf,%eax
5bfe   94443e:	8b 7c 24 04          	mov    0x4(%rsp),%edi
5c02   944442:	48 85 c0             	test   %rax,%rax
5c05   944445:	74 02                	je     944449 <___bpf_prog_run+0x5c09>
5c07   944447:	8b 3a                	mov    (%rdx),%edi
5c09   944449:	83 e3 0f             	and    $0xf,%ebx
5c0c   94444c:	48 0b 44 24 20       	or     0x20(%rsp),%rax
5c11   944451:	0f 85 bf 47 00 00    	jne    948c16 <___bpf_prog_run+0xa3d6>
5c17   944457:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
5c1c   94445c:	48 8d 1c d8          	lea    (%rax,%rbx,8),%rbx
5c20   944460:	48 89 df             	mov    %rbx,%rdi
5c23   944463:	e8 00 00 00 00       	call   944468 <___bpf_prog_run+0x5c28>	944464: R_X86_64_PLT32	__msan_metadata_ptr_for_store_8-0x4
5c28   944468:	4c 89 30             	mov    %r14,(%rax)
5c2b   94446b:	4d 85 f6             	test   %r14,%r14
5c2e   94446e:	0f 85 43 2d 00 00    	jne    9471b7 <___bpf_prog_run+0x8977>
5c34   944474:	4c 89 3b             	mov    %r15,(%rbx)
5c37   944477:	e9 7a a4 ff ff       	jmp    93e8f6 <___bpf_prog_run+0xb6>
5c3c   94447c:	e8 00 00 00 00       	call   944481 <___bpf_prog_run+0x5c41>	94447d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5c41   944481:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
5c46   944486:	49 8d 5d 01          	lea    0x1(%r13),%rbx
5c4a   94448a:	4d 85 f6             	test   %r14,%r14
5c4d   94448d:	0f 85 8d 47 00 00    	jne    948c20 <___bpf_prog_run+0xa3e0>
5c53   944493:	44 0f b6 23          	movzbl (%rbx),%r12d
5c57   944497:	48 89 df             	mov    %rbx,%rdi
5c5a   94449a:	e8 00 00 00 00       	call   94449f <___bpf_prog_run+0x5c5f>	94449b: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
5c5f   94449f:	0f b6 18             	movzbl (%rax),%ebx
5c62   9444a2:	44 8b 3a             	mov    (%rdx),%r15d
5c65   9444a5:	89 d8                	mov    %ebx,%eax
5c67   9444a7:	83 e0 0f             	and    $0xf,%eax
5c6a   9444aa:	4c 89 64 24 08       	mov    %r12,0x8(%rsp)
5c6f   9444af:	41 83 e4 0f          	and    $0xf,%r12d
5c73   9444b3:	48 85 c0             	test   %rax,%rax
5c76   9444b6:	8b 6c 24 04          	mov    0x4(%rsp),%ebp
5c7a   9444ba:	41 0f 45 ef          	cmovne %r15d,%ebp
5c7e   9444be:	4c 8b 6c 24 20       	mov    0x20(%rsp),%r13
5c83   9444c3:	4c 09 e8             	or     %r13,%rax
5c86   9444c6:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
5c8b   9444cb:	0f 85 5c 47 00 00    	jne    948c2d <___bpf_prog_run+0xa3ed>
5c91   9444d1:	89 6c 24 50          	mov    %ebp,0x50(%rsp)
5c95   9444d5:	4c 8b 74 24 30       	mov    0x30(%rsp),%r14
5c9a   9444da:	4b 8d 3c e6          	lea    (%r14,%r12,8),%rdi
5c9e   9444de:	4c 8b 27             	mov    (%rdi),%r12
5ca1   9444e1:	48 89 7c 24 18       	mov    %rdi,0x18(%rsp)
5ca6   9444e6:	e8 00 00 00 00       	call   9444eb <___bpf_prog_run+0x5cab>	9444e7: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
5cab   9444eb:	48 8b 28             	mov    (%rax),%rbp
5cae   9444ee:	8b 02                	mov    (%rdx),%eax
5cb0   9444f0:	89 44 24 40          	mov    %eax,0x40(%rsp)
5cb4   9444f4:	48 c1 eb 04          	shr    $0x4,%rbx
5cb8   9444f8:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
5cbd   9444fd:	48 c1 e8 04          	shr    $0x4,%rax
5cc1   944501:	48 85 db             	test   %rbx,%rbx
5cc4   944504:	44 0f 44 7c 24 04    	cmove  0x4(%rsp),%r15d
5cca   94450a:	4c 09 eb             	or     %r13,%rbx
5ccd   94450d:	48 89 c3             	mov    %rax,%rbx
5cd0   944510:	0f 85 23 47 00 00    	jne    948c39 <___bpf_prog_run+0xa3f9>
5cd6   944516:	49 8d 3c de          	lea    (%r14,%rbx,8),%rdi
5cda   94451a:	4c 8b 37             	mov    (%rdi),%r14
5cdd   94451d:	e8 00 00 00 00       	call   944522 <___bpf_prog_run+0x5ce2>	94451e: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
5ce2   944522:	48 8b 08             	mov    (%rax),%rcx
5ce5   944525:	4c 89 f3             	mov    %r14,%rbx
5ce8   944528:	48 f7 d3             	not    %rbx
5ceb   94452b:	4c 89 e0             	mov    %r12,%rax
5cee   94452e:	48 f7 d0             	not    %rax
5cf1   944531:	48 21 c8             	and    %rcx,%rax
5cf4   944534:	48 09 cb             	or     %rcx,%rbx
5cf7   944537:	48 21 eb             	and    %rbp,%rbx
5cfa   94453a:	48 85 ed             	test   %rbp,%rbp
5cfd   94453d:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
5d02   944542:	75 06                	jne    94454a <___bpf_prog_run+0x5d0a>
5d04   944544:	8b 0a                	mov    (%rdx),%ecx
5d06   944546:	89 4c 24 40          	mov    %ecx,0x40(%rsp)
5d0a   94454a:	48 09 c3             	or     %rax,%rbx
5d0d   94454d:	48 83 7c 24 38 00    	cmpq   $0x0,0x38(%rsp)
5d13   944553:	48 8b 6c 24 18       	mov    0x18(%rsp),%rbp
5d18   944558:	0f 85 e8 46 00 00    	jne    948c46 <___bpf_prog_run+0xa406>
5d1e   94455e:	4d 09 e6             	or     %r12,%r14
5d21   944561:	e9 76 0a 00 00       	jmp    944fdc <___bpf_prog_run+0x679c>
5d26   944566:	e8 00 00 00 00       	call   94456b <___bpf_prog_run+0x5d2b>	944567: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5d2b   94456b:	49 8d 5d 04          	lea    0x4(%r13),%rbx
5d2f   94456f:	4d 85 f6             	test   %r14,%r14
5d32   944572:	4c 89 f5             	mov    %r14,%rbp
5d35   944575:	0f 85 d9 46 00 00    	jne    948c54 <___bpf_prog_run+0xa414>
5d3b   94457b:	45 8b 7d 04          	mov    0x4(%r13),%r15d
5d3f   94457f:	48 89 df             	mov    %rbx,%rdi
5d42   944582:	e8 00 00 00 00       	call   944587 <___bpf_prog_run+0x5d47>	944583: R_X86_64_PLT32	__msan_metadata_ptr_for_load_4-0x4
5d47   944587:	49 8d 5d 01          	lea    0x1(%r13),%rbx
5d4b   94458b:	44 8b 20             	mov    (%rax),%r12d
5d4e   94458e:	44 8b 32             	mov    (%rdx),%r14d
5d51   944591:	48 85 ed             	test   %rbp,%rbp
5d54   944594:	0f 85 c7 46 00 00    	jne    948c61 <___bpf_prog_run+0xa421>
5d5a   94459a:	0f b6 2b             	movzbl (%rbx),%ebp
5d5d   94459d:	48 89 df             	mov    %rbx,%rdi
5d60   9445a0:	e8 00 00 00 00       	call   9445a5 <___bpf_prog_run+0x5d65>	9445a1: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
5d65   9445a5:	0f b6 00             	movzbl (%rax),%eax
5d68   9445a8:	83 e0 0f             	and    $0xf,%eax
5d6b   9445ab:	8b 7c 24 04          	mov    0x4(%rsp),%edi
5d6f   9445af:	48 85 c0             	test   %rax,%rax
5d72   9445b2:	74 02                	je     9445b6 <___bpf_prog_run+0x5d76>
5d74   9445b4:	8b 3a                	mov    (%rdx),%edi
5d76   9445b6:	83 e5 0f             	and    $0xf,%ebp
5d79   9445b9:	48 0b 44 24 20       	or     0x20(%rsp),%rax
5d7e   9445be:	0f 85 aa 46 00 00    	jne    948c6e <___bpf_prog_run+0xa42e>
5d84   9445c4:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
5d89   9445c9:	48 8d 2c e8          	lea    (%rax,%rbp,8),%rbp
5d8d   9445cd:	48 89 ef             	mov    %rbp,%rdi
5d90   9445d0:	e8 00 00 00 00       	call   9445d5 <___bpf_prog_run+0x5d95>	9445d1: R_X86_64_PLT32	__msan_metadata_ptr_for_store_8-0x4
5d95   9445d5:	4c 89 20             	mov    %r12,(%rax)
5d98   9445d8:	4d 85 e4             	test   %r12,%r12
5d9b   9445db:	0f 85 96 2b 00 00    	jne    947177 <___bpf_prog_run+0x8937>
5da1   9445e1:	4c 89 7d 00          	mov    %r15,0x0(%rbp)
5da5   9445e5:	e9 0c a3 ff ff       	jmp    93e8f6 <___bpf_prog_run+0xb6>
5daa   9445ea:	49 8d 5d 01          	lea    0x1(%r13),%rbx
5dae   9445ee:	4d 85 f6             	test   %r14,%r14
5db1   9445f1:	0f 85 81 46 00 00    	jne    948c78 <___bpf_prog_run+0xa438>
5db7   9445f7:	44 0f b6 23          	movzbl (%rbx),%r12d
5dbb   9445fb:	48 89 df             	mov    %rbx,%rdi
5dbe   9445fe:	e8 00 00 00 00       	call   944603 <___bpf_prog_run+0x5dc3>	9445ff: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
5dc3   944603:	0f b6 28             	movzbl (%rax),%ebp
5dc6   944606:	8b 02                	mov    (%rdx),%eax
5dc8   944608:	83 e5 0f             	and    $0xf,%ebp
5dcb   94460b:	41 83 e4 0f          	and    $0xf,%r12d
5dcf   94460f:	48 85 ed             	test   %rbp,%rbp
5dd2   944612:	8b 7c 24 04          	mov    0x4(%rsp),%edi
5dd6   944616:	89 44 24 38          	mov    %eax,0x38(%rsp)
5dda   94461a:	0f 45 f8             	cmovne %eax,%edi
5ddd   94461d:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
5de2   944622:	48 09 e8             	or     %rbp,%rax
5de5   944625:	0f 85 5a 46 00 00    	jne    948c85 <___bpf_prog_run+0xa445>
5deb   94462b:	48 89 5c 24 40       	mov    %rbx,0x40(%rsp)
5df0   944630:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
5df5   944635:	4a 8d 3c e0          	lea    (%rax,%r12,8),%rdi
5df9   944639:	48 8b 07             	mov    (%rdi),%rax
5dfc   94463c:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
5e01   944641:	e8 00 00 00 00       	call   944646 <___bpf_prog_run+0x5e06>	944642: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
5e06   944646:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
5e0b   94464b:	4d 8d 75 04          	lea    0x4(%r13),%r14
5e0f   94464f:	4c 8b 38             	mov    (%rax),%r15
5e12   944652:	8b 02                	mov    (%rdx),%eax
5e14   944654:	89 44 24 18          	mov    %eax,0x18(%rsp)
5e18   944658:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
5e1e   94465e:	0f 85 2b 46 00 00    	jne    948c8f <___bpf_prog_run+0xa44f>
5e24   944664:	41 8b 1e             	mov    (%r14),%ebx
5e27   944667:	4c 89 f7             	mov    %r14,%rdi
5e2a   94466a:	e8 00 00 00 00       	call   94466f <___bpf_prog_run+0x5e2f>	94466b: R_X86_64_PLT32	__msan_metadata_ptr_for_load_4-0x4
5e2f   94466f:	44 8b 28             	mov    (%rax),%r13d
5e32   944672:	44 8b 32             	mov    (%rdx),%r14d
5e35   944675:	48 83 fb 3f          	cmp    $0x3f,%rbx
5e39   944679:	0f 87 63 53 00 00    	ja     9499e2 <___bpf_prog_run+0xb1a2>
5e3f   94467f:	e8 00 00 00 00       	call   944684 <___bpf_prog_run+0x5e44>	944680: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5e44   944684:	31 c0                	xor    %eax,%eax
5e46   944686:	4d 85 ed             	test   %r13,%r13
5e49   944689:	0f 95 c0             	setne  %al
5e4c   94468c:	8b 4c 24 18          	mov    0x18(%rsp),%ecx
5e50   944690:	41 0f 45 ce          	cmovne %r14d,%ecx
5e54   944694:	89 4c 24 18          	mov    %ecx,0x18(%rsp)
5e58   944698:	48 f7 d8             	neg    %rax
5e5b   94469b:	89 d9                	mov    %ebx,%ecx
5e5d   94469d:	49 d3 ef             	shr    %cl,%r15
5e60   9446a0:	49 09 c7             	or     %rax,%r15
5e63   9446a3:	48 d3 6c 24 08       	shrq   %cl,0x8(%rsp)
5e68   9446a8:	48 85 ed             	test   %rbp,%rbp
5e6b   9446ab:	8b 7c 24 38          	mov    0x38(%rsp),%edi
5e6f   9446af:	0f 44 7c 24 04       	cmove  0x4(%rsp),%edi
5e74   9446b4:	48 0b 6c 24 20       	or     0x20(%rsp),%rbp
5e79   9446b9:	0f 85 dd 45 00 00    	jne    948c9c <___bpf_prog_run+0xa45c>
5e7f   9446bf:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
5e84   9446c4:	4a 8d 1c e0          	lea    (%rax,%r12,8),%rbx
5e88   9446c8:	48 89 df             	mov    %rbx,%rdi
5e8b   9446cb:	e8 00 00 00 00       	call   9446d0 <___bpf_prog_run+0x5e90>	9446cc: R_X86_64_PLT32	__msan_metadata_ptr_for_store_8-0x4
5e90   9446d0:	4c 89 38             	mov    %r15,(%rax)
5e93   9446d3:	4d 85 ff             	test   %r15,%r15
5e96   9446d6:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
5e9b   9446db:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
5ea0   9446e0:	0f 85 b0 2a 00 00    	jne    947196 <___bpf_prog_run+0x8956>
5ea6   9446e6:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
5eab   9446eb:	48 89 03             	mov    %rax,(%rbx)
5eae   9446ee:	49 83 c5 08          	add    $0x8,%r13
5eb2   9446f2:	e9 08 a2 ff ff       	jmp    93e8ff <___bpf_prog_run+0xbf>
5eb7   9446f7:	e8 00 00 00 00       	call   9446fc <___bpf_prog_run+0x5ebc>	9446f8: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5ebc   9446fc:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
5ec1   944701:	49 8d 5d 01          	lea    0x1(%r13),%rbx
5ec5   944705:	4d 85 f6             	test   %r14,%r14
5ec8   944708:	0f 85 98 45 00 00    	jne    948ca6 <___bpf_prog_run+0xa466>
5ece   94470e:	44 0f b6 23          	movzbl (%rbx),%r12d
5ed2   944712:	48 89 df             	mov    %rbx,%rdi
5ed5   944715:	e8 00 00 00 00       	call   94471a <___bpf_prog_run+0x5eda>	944716: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
5eda   94471a:	0f b6 18             	movzbl (%rax),%ebx
5edd   94471d:	44 8b 3a             	mov    (%rdx),%r15d
5ee0   944720:	48 89 d8             	mov    %rbx,%rax
5ee3   944723:	48 c1 e8 04          	shr    $0x4,%rax
5ee7   944727:	4c 89 e5             	mov    %r12,%rbp
5eea   94472a:	48 c1 ed 04          	shr    $0x4,%rbp
5eee   94472e:	48 85 c0             	test   %rax,%rax
5ef1   944731:	44 8b 6c 24 04       	mov    0x4(%rsp),%r13d
5ef6   944736:	44 89 ef             	mov    %r13d,%edi
5ef9   944739:	41 0f 45 ff          	cmovne %r15d,%edi
5efd   94473d:	4c 8b 74 24 20       	mov    0x20(%rsp),%r14
5f02   944742:	4c 09 f0             	or     %r14,%rax
5f05   944745:	0f 85 68 45 00 00    	jne    948cb3 <___bpf_prog_run+0xa473>
5f0b   94474b:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
5f10   944750:	48 8d 3c e8          	lea    (%rax,%rbp,8),%rdi
5f14   944754:	48 89 c5             	mov    %rax,%rbp
5f17   944757:	0f b7 07             	movzwl (%rdi),%eax
5f1a   94475a:	66 89 44 24 18       	mov    %ax,0x18(%rsp)
5f1f   94475f:	e8 00 00 00 00       	call   944764 <___bpf_prog_run+0x5f24>	944760: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
5f24   944764:	0f b7 00             	movzwl (%rax),%eax
5f27   944767:	66 89 44 24 08       	mov    %ax,0x8(%rsp)
5f2c   94476c:	8b 02                	mov    (%rdx),%eax
5f2e   94476e:	89 44 24 38          	mov    %eax,0x38(%rsp)
5f32   944772:	83 e3 0f             	and    $0xf,%ebx
5f35   944775:	41 83 e4 0f          	and    $0xf,%r12d
5f39   944779:	48 85 db             	test   %rbx,%rbx
5f3c   94477c:	45 0f 44 fd          	cmove  %r13d,%r15d
5f40   944780:	4c 09 f3             	or     %r14,%rbx
5f43   944783:	0f 85 34 45 00 00    	jne    948cbd <___bpf_prog_run+0xa47d>
5f49   944789:	4a 8d 3c e5 00 00 00 00 	lea    0x0(,%r12,8),%rdi
5f51   944791:	48 01 ef             	add    %rbp,%rdi
5f54   944794:	48 8b 2f             	mov    (%rdi),%rbp
5f57   944797:	e8 00 00 00 00       	call   94479c <___bpf_prog_run+0x5f5c>	944798: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
5f5c   94479c:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
5f61   9447a1:	48 8d 59 02          	lea    0x2(%rcx),%rbx
5f65   9447a5:	4c 8b 28             	mov    (%rax),%r13
5f68   9447a8:	44 8b 3a             	mov    (%rdx),%r15d
5f6b   9447ab:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
5f70   9447b0:	4d 85 f6             	test   %r14,%r14
5f73   9447b3:	0f 85 11 45 00 00    	jne    948cca <___bpf_prog_run+0xa48a>
5f79   9447b9:	4c 0f bf 23          	movswq (%rbx),%r12
5f7d   9447bd:	48 89 df             	mov    %rbx,%rdi
5f80   9447c0:	e8 00 00 00 00       	call   9447c5 <___bpf_prog_run+0x5f85>	9447c1: R_X86_64_PLT32	__msan_metadata_ptr_for_load_2-0x4
5f85   9447c5:	48 0f bf 00          	movswq (%rax),%rax
5f89   9447c9:	48 85 c0             	test   %rax,%rax
5f8c   9447cc:	74 03                	je     9447d1 <___bpf_prog_run+0x5f91>
5f8e   9447ce:	44 8b 3a             	mov    (%rdx),%r15d
5f91   9447d1:	4c 01 e5             	add    %r12,%rbp
5f94   9447d4:	49 09 c5             	or     %rax,%r13
5f97   9447d7:	0f 85 fa 44 00 00    	jne    948cd7 <___bpf_prog_run+0xa497>
5f9d   9447dd:	48 89 ef             	mov    %rbp,%rdi
5fa0   9447e0:	e8 00 00 00 00       	call   9447e5 <___bpf_prog_run+0x5fa5>	9447e1: R_X86_64_PLT32	__msan_metadata_ptr_for_store_2-0x4
5fa5   9447e5:	0f b7 4c 24 08       	movzwl 0x8(%rsp),%ecx
5faa   9447ea:	66 89 08             	mov    %cx,(%rax)
5fad   9447ed:	66 85 c9             	test   %cx,%cx
5fb0   9447f0:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
5fb5   9447f5:	0f 85 e9 44 00 00    	jne    948ce4 <___bpf_prog_run+0xa4a4>
5fbb   9447fb:	0f b7 44 24 18       	movzwl 0x18(%rsp),%eax
5fc0   944800:	66 89 45 00          	mov    %ax,0x0(%rbp)
5fc4   944804:	49 83 c5 08          	add    $0x8,%r13
5fc8   944808:	e9 f2 a0 ff ff       	jmp    93e8ff <___bpf_prog_run+0xbf>
5fcd   94480d:	49 8d 5d 01          	lea    0x1(%r13),%rbx
5fd1   944811:	4d 85 f6             	test   %r14,%r14
5fd4   944814:	0f 85 de 44 00 00    	jne    948cf8 <___bpf_prog_run+0xa4b8>
5fda   94481a:	44 0f b6 23          	movzbl (%rbx),%r12d
5fde   94481e:	48 89 5c 24 40       	mov    %rbx,0x40(%rsp)
5fe3   944823:	48 89 df             	mov    %rbx,%rdi
5fe6   944826:	e8 00 00 00 00       	call   94482b <___bpf_prog_run+0x5feb>	944827: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
5feb   94482b:	0f b6 28             	movzbl (%rax),%ebp
5fee   94482e:	8b 02                	mov    (%rdx),%eax
5ff0   944830:	83 e5 0f             	and    $0xf,%ebp
5ff3   944833:	41 83 e4 0f          	and    $0xf,%r12d
5ff7   944837:	48 85 ed             	test   %rbp,%rbp
5ffa   94483a:	8b 7c 24 04          	mov    0x4(%rsp),%edi
5ffe   94483e:	89 44 24 38          	mov    %eax,0x38(%rsp)
6002   944842:	0f 45 f8             	cmovne %eax,%edi
6005   944845:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
600a   94484a:	48 09 e8             	or     %rbp,%rax
600d   94484d:	0f 85 b2 44 00 00    	jne    948d05 <___bpf_prog_run+0xa4c5>
6013   944853:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
6018   944858:	4a 8d 3c e0          	lea    (%rax,%r12,8),%rdi
601c   94485c:	4c 8b 3f             	mov    (%rdi),%r15
601f   94485f:	e8 00 00 00 00       	call   944864 <___bpf_prog_run+0x6024>	944860: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
6024   944864:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
6029   944869:	4d 8d 75 04          	lea    0x4(%r13),%r14
602d   94486d:	8b 18                	mov    (%rax),%ebx
602f   94486f:	8b 02                	mov    (%rdx),%eax
6031   944871:	89 44 24 18          	mov    %eax,0x18(%rsp)
6035   944875:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
603b   94487b:	0f 85 8e 44 00 00    	jne    948d0f <___bpf_prog_run+0xa4cf>
6041   944881:	44 89 f8             	mov    %r15d,%eax
6044   944884:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
6049   944889:	45 8b 3e             	mov    (%r14),%r15d
604c   94488c:	4c 89 f7             	mov    %r14,%rdi
604f   94488f:	e8 00 00 00 00       	call   944894 <___bpf_prog_run+0x6054>	944890: R_X86_64_PLT32	__msan_metadata_ptr_for_load_4-0x4
6054   944894:	44 8b 28             	mov    (%rax),%r13d
6057   944897:	44 8b 32             	mov    (%rdx),%r14d
605a   94489a:	49 83 ff 1f          	cmp    $0x1f,%r15
605e   94489e:	0f 87 86 51 00 00    	ja     949a2a <___bpf_prog_run+0xb1ea>
6064   9448a4:	e8 00 00 00 00       	call   9448a9 <___bpf_prog_run+0x6069>	9448a5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
6069   9448a9:	31 c0                	xor    %eax,%eax
606b   9448ab:	45 85 ed             	test   %r13d,%r13d
606e   9448ae:	0f 95 c0             	setne  %al
6071   9448b1:	8b 4c 24 18          	mov    0x18(%rsp),%ecx
6075   9448b5:	41 0f 45 ce          	cmovne %r14d,%ecx
6079   9448b9:	89 4c 24 18          	mov    %ecx,0x18(%rsp)
607d   9448bd:	f7 d8                	neg    %eax
607f   9448bf:	44 89 f9             	mov    %r15d,%ecx
6082   9448c2:	d3 eb                	shr    %cl,%ebx
6084   9448c4:	09 c3                	or     %eax,%ebx
6086   9448c6:	48 d3 6c 24 08       	shrq   %cl,0x8(%rsp)
608b   9448cb:	48 85 ed             	test   %rbp,%rbp
608e   9448ce:	8b 7c 24 38          	mov    0x38(%rsp),%edi
6092   9448d2:	0f 44 7c 24 04       	cmove  0x4(%rsp),%edi
6097   9448d7:	48 0b 6c 24 20       	or     0x20(%rsp),%rbp
609c   9448dc:	0f 85 3a 44 00 00    	jne    948d1c <___bpf_prog_run+0xa4dc>
60a2   9448e2:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
60a7   9448e7:	4a 8d 2c e0          	lea    (%rax,%r12,8),%rbp
60ab   9448eb:	48 89 ef             	mov    %rbp,%rdi
60ae   9448ee:	e8 00 00 00 00       	call   9448f3 <___bpf_prog_run+0x60b3>	9448ef: R_X86_64_PLT32	__msan_metadata_ptr_for_store_8-0x4
60b3   9448f3:	48 89 18             	mov    %rbx,(%rax)
60b6   9448f6:	48 85 db             	test   %rbx,%rbx
60b9   9448f9:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
60be   9448fe:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
60c3   944903:	0f 85 1d 44 00 00    	jne    948d26 <___bpf_prog_run+0xa4e6>
60c9   944909:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
60ce   94490e:	48 89 45 00          	mov    %rax,0x0(%rbp)
60d2   944912:	49 83 c5 08          	add    $0x8,%r13
60d6   944916:	e9 e4 9f ff ff       	jmp    93e8ff <___bpf_prog_run+0xbf>
60db   94491b:	49 8d 5d 01          	lea    0x1(%r13),%rbx
60df   94491f:	4d 85 f6             	test   %r14,%r14
60e2   944922:	0f 85 1e 44 00 00    	jne    948d46 <___bpf_prog_run+0xa506>
60e8   944928:	0f b6 2b             	movzbl (%rbx),%ebp
60eb   94492b:	48 89 df             	mov    %rbx,%rdi
60ee   94492e:	e8 00 00 00 00       	call   944933 <___bpf_prog_run+0x60f3>	94492f: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
60f3   944933:	0f b6 00             	movzbl (%rax),%eax
60f6   944936:	83 e0 0f             	and    $0xf,%eax
60f9   944939:	8b 7c 24 04          	mov    0x4(%rsp),%edi
60fd   94493d:	48 85 c0             	test   %rax,%rax
6100   944940:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
6105   944945:	74 02                	je     944949 <___bpf_prog_run+0x6109>
6107   944947:	8b 3a                	mov    (%rdx),%edi
6109   944949:	83 e5 0f             	and    $0xf,%ebp
610c   94494c:	48 09 c8             	or     %rcx,%rax
610f   94494f:	0f 85 fe 43 00 00    	jne    948d53 <___bpf_prog_run+0xa513>
6115   944955:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
611a   94495a:	48 8d 3c e8          	lea    (%rax,%rbp,8),%rdi
611e   94495e:	4c 8b 3f             	mov    (%rdi),%r15
6121   944961:	e8 00 00 00 00       	call   944966 <___bpf_prog_run+0x6126>	944962: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
6126   944966:	49 8d 6d 04          	lea    0x4(%r13),%rbp
612a   94496a:	48 8b 18             	mov    (%rax),%rbx
612d   94496d:	44 8b 32             	mov    (%rdx),%r14d
6130   944970:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
6136   944976:	0f 85 e1 43 00 00    	jne    948d5d <___bpf_prog_run+0xa51d>
613c   94497c:	4c 63 65 00          	movslq 0x0(%rbp),%r12
6140   944980:	48 89 ef             	mov    %rbp,%rdi
6143   944983:	e8 00 00 00 00       	call   944988 <___bpf_prog_run+0x6148>	944984: R_X86_64_PLT32	__msan_metadata_ptr_for_load_4-0x4
6148   944988:	48 63 00             	movslq (%rax),%rax
614b   94498b:	48 89 d9             	mov    %rbx,%rcx
614e   94498e:	4c 21 e1             	and    %r12,%rcx
6151   944991:	4c 09 fb             	or     %r15,%rbx
6154   944994:	48 21 c3             	and    %rax,%rbx
6157   944997:	48 09 cb             	or     %rcx,%rbx
615a   94499a:	48 85 c0             	test   %rax,%rax
615d   94499d:	74 03                	je     9449a2 <___bpf_prog_run+0x6162>
615f   94499f:	44 8b 32             	mov    (%rdx),%r14d
6162   9449a2:	4d 21 e7             	and    %r12,%r15
6165   9449a5:	48 85 db             	test   %rbx,%rbx
6168   9449a8:	74 0c                	je     9449b6 <___bpf_prog_run+0x6176>
616a   9449aa:	48 f7 d3             	not    %rbx
616d   9449ad:	4c 21 fb             	and    %r15,%rbx
6170   9449b0:	0f 84 c6 3d 00 00    	je     94877c <___bpf_prog_run+0x9f3c>
6176   9449b6:	4d 85 ff             	test   %r15,%r15
6179   9449b9:	0f 84 ce 3d 00 00    	je     94878d <___bpf_prog_run+0x9f4d>
617f   9449bf:	e8 00 00 00 00       	call   9449c4 <___bpf_prog_run+0x6184>	9449c0: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
6184   9449c4:	49 8d 5d 02          	lea    0x2(%r13),%rbx
6188   9449c8:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
618d   9449cd:	4d 85 f6             	test   %r14,%r14
6190   9449d0:	0f 84 e6 3a 00 00    	je     9484bc <___bpf_prog_run+0x9c7c>
6196   9449d6:	8b 3c 24             	mov    (%rsp),%edi
6199   9449d9:	e8 00 00 00 00       	call   9449de <___bpf_prog_run+0x619e>	9449da: R_X86_64_PLT32	__msan_warning-0x4
619e   9449de:	e9 d9 3a 00 00       	jmp    9484bc <___bpf_prog_run+0x9c7c>
61a3   9449e3:	49 8d 5d 01          	lea    0x1(%r13),%rbx
61a7   9449e7:	4d 85 f6             	test   %r14,%r14
61aa   9449ea:	0f 85 7a 43 00 00    	jne    948d6a <___bpf_prog_run+0xa52a>
61b0   9449f0:	44 0f b6 33          	movzbl (%rbx),%r14d
61b4   9449f4:	48 89 df             	mov    %rbx,%rdi
61b7   9449f7:	e8 00 00 00 00       	call   9449fc <___bpf_prog_run+0x61bc>	9449f8: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
61bc   9449fc:	44 0f b6 20          	movzbl (%rax),%r12d
61c0   944a00:	8b 02                	mov    (%rdx),%eax
61c2   944a02:	41 83 e4 0f          	and    $0xf,%r12d
61c6   944a06:	41 83 e6 0f          	and    $0xf,%r14d
61ca   944a0a:	4d 85 e4             	test   %r12,%r12
61cd   944a0d:	8b 7c 24 04          	mov    0x4(%rsp),%edi
61d1   944a11:	89 44 24 38          	mov    %eax,0x38(%rsp)
61d5   944a15:	0f 45 f8             	cmovne %eax,%edi
61d8   944a18:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
61dd   944a1d:	4c 09 e0             	or     %r12,%rax
61e0   944a20:	0f 85 51 43 00 00    	jne    948d77 <___bpf_prog_run+0xa537>
61e6   944a26:	48 89 5c 24 40       	mov    %rbx,0x40(%rsp)
61eb   944a2b:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
61f0   944a30:	4a 8d 3c f0          	lea    (%rax,%r14,8),%rdi
61f4   944a34:	48 8b 07             	mov    (%rdi),%rax
61f7   944a37:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
61fc   944a3c:	e8 00 00 00 00       	call   944a41 <___bpf_prog_run+0x6201>	944a3d: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
6201   944a41:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
6206   944a46:	49 8d 6d 04          	lea    0x4(%r13),%rbp
620a   944a4a:	44 8b 38             	mov    (%rax),%r15d
620d   944a4d:	8b 02                	mov    (%rdx),%eax
620f   944a4f:	89 44 24 08          	mov    %eax,0x8(%rsp)
6213   944a53:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
6219   944a59:	0f 85 22 43 00 00    	jne    948d81 <___bpf_prog_run+0xa541>
621f   944a5f:	8b 5d 00             	mov    0x0(%rbp),%ebx
6222   944a62:	48 89 ef             	mov    %rbp,%rdi
6225   944a65:	e8 00 00 00 00       	call   944a6a <___bpf_prog_run+0x622a>	944a66: R_X86_64_PLT32	__msan_metadata_ptr_for_load_4-0x4
622a   944a6a:	8b 28                	mov    (%rax),%ebp
622c   944a6c:	44 8b 2a             	mov    (%rdx),%r13d
622f   944a6f:	48 83 fb 1f          	cmp    $0x1f,%rbx
6233   944a73:	0f 87 f9 4f 00 00    	ja     949a72 <___bpf_prog_run+0xb232>
6239   944a79:	e8 00 00 00 00       	call   944a7e <___bpf_prog_run+0x623e>	944a7a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
623e   944a7e:	31 c0                	xor    %eax,%eax
6240   944a80:	85 ed                	test   %ebp,%ebp
6242   944a82:	0f 95 c0             	setne  %al
6245   944a85:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
6249   944a89:	41 0f 45 cd          	cmovne %r13d,%ecx
624d   944a8d:	89 4c 24 08          	mov    %ecx,0x8(%rsp)
6251   944a91:	f7 d8                	neg    %eax
6253   944a93:	89 d9                	mov    %ebx,%ecx
6255   944a95:	41 d3 e7             	shl    %cl,%r15d
6258   944a98:	41 09 c7             	or     %eax,%r15d
625b   944a9b:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
6260   944aa0:	d3 e0                	shl    %cl,%eax
6262   944aa2:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
6267   944aa7:	4d 85 e4             	test   %r12,%r12
626a   944aaa:	8b 7c 24 38          	mov    0x38(%rsp),%edi
626e   944aae:	0f 44 7c 24 04       	cmove  0x4(%rsp),%edi
6273   944ab3:	4c 0b 64 24 20       	or     0x20(%rsp),%r12
6278   944ab8:	0f 85 d0 42 00 00    	jne    948d8e <___bpf_prog_run+0xa54e>
627e   944abe:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
6283   944ac3:	4a 8d 1c f0          	lea    (%rax,%r14,8),%rbx
6287   944ac7:	48 89 df             	mov    %rbx,%rdi
628a   944aca:	e8 00 00 00 00       	call   944acf <___bpf_prog_run+0x628f>	944acb: R_X86_64_PLT32	__msan_metadata_ptr_for_store_8-0x4
628f   944acf:	4c 89 38             	mov    %r15,(%rax)
6292   944ad2:	4d 85 ff             	test   %r15,%r15
6295   944ad5:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
629a   944ada:	0f 85 f8 26 00 00    	jne    9471d8 <___bpf_prog_run+0x8998>
62a0   944ae0:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
62a5   944ae5:	48 89 03             	mov    %rax,(%rbx)
62a8   944ae8:	e9 09 9e ff ff       	jmp    93e8f6 <___bpf_prog_run+0xb6>
62ad   944aed:	49 8d 5d 01          	lea    0x1(%r13),%rbx
62b1   944af1:	4d 85 f6             	test   %r14,%r14
62b4   944af4:	0f 85 9e 42 00 00    	jne    948d98 <___bpf_prog_run+0xa558>
62ba   944afa:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
62bf   944aff:	44 0f b6 33          	movzbl (%rbx),%r14d
62c3   944b03:	48 89 df             	mov    %rbx,%rdi
62c6   944b06:	e8 00 00 00 00       	call   944b0b <___bpf_prog_run+0x62cb>	944b07: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
62cb   944b0b:	0f b6 18             	movzbl (%rax),%ebx
62ce   944b0e:	44 8b 22             	mov    (%rdx),%r12d
62d1   944b11:	89 d8                	mov    %ebx,%eax
62d3   944b13:	83 e0 0f             	and    $0xf,%eax
62d6   944b16:	44 89 f5             	mov    %r14d,%ebp
62d9   944b19:	83 e5 0f             	and    $0xf,%ebp
62dc   944b1c:	48 85 c0             	test   %rax,%rax
62df   944b1f:	44 8b 7c 24 04       	mov    0x4(%rsp),%r15d
62e4   944b24:	44 89 ff             	mov    %r15d,%edi
62e7   944b27:	41 0f 45 fc          	cmovne %r12d,%edi
62eb   944b2b:	48 0b 44 24 20       	or     0x20(%rsp),%rax
62f0   944b30:	0f 85 6f 42 00 00    	jne    948da5 <___bpf_prog_run+0xa565>
62f6   944b36:	4c 8b 6c 24 30       	mov    0x30(%rsp),%r13
62fb   944b3b:	48 8d 3c ed 00 00 00 00 	lea    0x0(,%rbp,8),%rdi
6303   944b43:	4c 01 ef             	add    %r13,%rdi
6306   944b46:	8b 07                	mov    (%rdi),%eax
6308   944b48:	89 44 24 18          	mov    %eax,0x18(%rsp)
630c   944b4c:	e8 00 00 00 00       	call   944b51 <___bpf_prog_run+0x6311>	944b4d: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
6311   944b51:	4c 89 ed             	mov    %r13,%rbp
6314   944b54:	44 8b 28             	mov    (%rax),%r13d
6317   944b57:	8b 02                	mov    (%rdx),%eax
6319   944b59:	89 44 24 08          	mov    %eax,0x8(%rsp)
631d   944b5d:	48 c1 eb 04          	shr    $0x4,%rbx
6321   944b61:	49 c1 ee 04          	shr    $0x4,%r14
6325   944b65:	48 85 db             	test   %rbx,%rbx
6328   944b68:	45 0f 44 e7          	cmove  %r15d,%r12d
632c   944b6c:	48 0b 5c 24 20       	or     0x20(%rsp),%rbx
6331   944b71:	0f 85 38 42 00 00    	jne    948daf <___bpf_prog_run+0xa56f>
6337   944b77:	4a 8d 3c f5 00 00 00 00 	lea    0x0(,%r14,8),%rdi
633f   944b7f:	48 01 ef             	add    %rbp,%rdi
6342   944b82:	8b 1f                	mov    (%rdi),%ebx
6344   944b84:	e8 00 00 00 00       	call   944b89 <___bpf_prog_run+0x6349>	944b85: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
6349   944b89:	8b 00                	mov    (%rax),%eax
634b   944b8b:	85 c0                	test   %eax,%eax
634d   944b8d:	74 06                	je     944b95 <___bpf_prog_run+0x6355>
634f   944b8f:	8b 0a                	mov    (%rdx),%ecx
6351   944b91:	89 4c 24 08          	mov    %ecx,0x8(%rsp)
6355   944b95:	41 09 c5             	or     %eax,%r13d
6358   944b98:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
635d   944b9d:	0f 85 19 42 00 00    	jne    948dbc <___bpf_prog_run+0xa57c>
6363   944ba3:	39 5c 24 18          	cmp    %ebx,0x18(%rsp)
6367   944ba7:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
636c   944bac:	0f 8d 8f 07 00 00    	jge    945341 <___bpf_prog_run+0x6b01>
6372   944bb2:	e8 00 00 00 00       	call   944bb7 <___bpf_prog_run+0x6377>	944bb3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
6377   944bb7:	49 83 c5 08          	add    $0x8,%r13
637b   944bbb:	e9 3f 9d ff ff       	jmp    93e8ff <___bpf_prog_run+0xbf>
6380   944bc0:	e8 00 00 00 00       	call   944bc5 <___bpf_prog_run+0x6385>	944bc1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
6385   944bc5:	49 8d 5d 01          	lea    0x1(%r13),%rbx
6389   944bc9:	4d 85 f6             	test   %r14,%r14
638c   944bcc:	0f 85 f8 41 00 00    	jne    948dca <___bpf_prog_run+0xa58a>
6392   944bd2:	44 0f b6 23          	movzbl (%rbx),%r12d
6396   944bd6:	48 89 df             	mov    %rbx,%rdi
6399   944bd9:	e8 00 00 00 00       	call   944bde <___bpf_prog_run+0x639e>	944bda: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
639e   944bde:	44 0f b6 30          	movzbl (%rax),%r14d
63a2   944be2:	8b 0a                	mov    (%rdx),%ecx
63a4   944be4:	4c 89 f0             	mov    %r14,%rax
63a7   944be7:	48 c1 e8 04          	shr    $0x4,%rax
63ab   944beb:	4c 89 e3             	mov    %r12,%rbx
63ae   944bee:	48 c1 eb 04          	shr    $0x4,%rbx
63b2   944bf2:	48 85 c0             	test   %rax,%rax
63b5   944bf5:	8b 7c 24 04          	mov    0x4(%rsp),%edi
63b9   944bf9:	89 4c 24 18          	mov    %ecx,0x18(%rsp)
63bd   944bfd:	0f 45 f9             	cmovne %ecx,%edi
63c0   944c00:	48 0b 44 24 20       	or     0x20(%rsp),%rax
63c5   944c05:	0f 85 cc 41 00 00    	jne    948dd7 <___bpf_prog_run+0xa597>
63cb   944c0b:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
63d0   944c10:	48 8d 3c d8          	lea    (%rax,%rbx,8),%rdi
63d4   944c14:	48 8b 2f             	mov    (%rdi),%rbp
63d7   944c17:	e8 00 00 00 00       	call   944c1c <___bpf_prog_run+0x63dc>	944c18: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
63dc   944c1c:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
63e1   944c21:	49 8d 5d 02          	lea    0x2(%r13),%rbx
63e5   944c25:	4c 8b 28             	mov    (%rax),%r13
63e8   944c28:	8b 02                	mov    (%rdx),%eax
63ea   944c2a:	89 44 24 08          	mov    %eax,0x8(%rsp)
63ee   944c2e:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
63f4   944c34:	0f 85 a7 41 00 00    	jne    948de1 <___bpf_prog_run+0xa5a1>
63fa   944c3a:	4c 0f bf 3b          	movswq (%rbx),%r15
63fe   944c3e:	48 89 df             	mov    %rbx,%rdi
6401   944c41:	e8 00 00 00 00       	call   944c46 <___bpf_prog_run+0x6406>	944c42: R_X86_64_PLT32	__msan_metadata_ptr_for_load_2-0x4
6406   944c46:	48 0f bf 00          	movswq (%rax),%rax
640a   944c4a:	48 85 c0             	test   %rax,%rax
640d   944c4d:	74 06                	je     944c55 <___bpf_prog_run+0x6415>
640f   944c4f:	8b 0a                	mov    (%rdx),%ecx
6411   944c51:	89 4c 24 08          	mov    %ecx,0x8(%rsp)
6415   944c55:	4c 01 fd             	add    %r15,%rbp
6418   944c58:	49 09 c5             	or     %rax,%r13
641b   944c5b:	0f 85 8d 41 00 00    	jne    948dee <___bpf_prog_run+0xa5ae>
6421   944c61:	44 0f b6 6d 00       	movzbl 0x0(%rbp),%r13d
6426   944c66:	48 89 ef             	mov    %rbp,%rdi
6429   944c69:	e8 00 00 00 00       	call   944c6e <___bpf_prog_run+0x642e>	944c6a: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
642e   944c6e:	0f b6 28             	movzbl (%rax),%ebp
6431   944c71:	44 8b 3a             	mov    (%rdx),%r15d
6434   944c74:	41 83 e6 0f          	and    $0xf,%r14d
6438   944c78:	41 83 e4 0f          	and    $0xf,%r12d
643c   944c7c:	4d 85 f6             	test   %r14,%r14
643f   944c7f:	8b 7c 24 18          	mov    0x18(%rsp),%edi
6443   944c83:	0f 44 7c 24 04       	cmove  0x4(%rsp),%edi
6448   944c88:	4c 0b 74 24 20       	or     0x20(%rsp),%r14
644d   944c8d:	0f 84 39 04 00 00    	je     9450cc <___bpf_prog_run+0x688c>
6453   944c93:	e8 00 00 00 00       	call   944c98 <___bpf_prog_run+0x6458>	944c94: R_X86_64_PLT32	__msan_warning-0x4
6458   944c98:	e9 2f 04 00 00       	jmp    9450cc <___bpf_prog_run+0x688c>
645d   944c9d:	49 8d 5d 01          	lea    0x1(%r13),%rbx
6461   944ca1:	4d 85 f6             	test   %r14,%r14
6464   944ca4:	0f 85 52 41 00 00    	jne    948dfc <___bpf_prog_run+0xa5bc>
646a   944caa:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
646f   944caf:	44 0f b6 33          	movzbl (%rbx),%r14d
6473   944cb3:	48 89 df             	mov    %rbx,%rdi
6476   944cb6:	e8 00 00 00 00       	call   944cbb <___bpf_prog_run+0x647b>	944cb7: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
647b   944cbb:	0f b6 28             	movzbl (%rax),%ebp
647e   944cbe:	44 8b 22             	mov    (%rdx),%r12d
6481   944cc1:	89 e8                	mov    %ebp,%eax
6483   944cc3:	83 e0 0f             	and    $0xf,%eax
6486   944cc6:	44 89 f3             	mov    %r14d,%ebx
6489   944cc9:	83 e3 0f             	and    $0xf,%ebx
648c   944ccc:	48 85 c0             	test   %rax,%rax
648f   944ccf:	44 8b 7c 24 04       	mov    0x4(%rsp),%r15d
6494   944cd4:	44 89 ff             	mov    %r15d,%edi
6497   944cd7:	41 0f 45 fc          	cmovne %r12d,%edi
649b   944cdb:	48 0b 44 24 20       	or     0x20(%rsp),%rax
64a0   944ce0:	0f 85 23 41 00 00    	jne    948e09 <___bpf_prog_run+0xa5c9>
64a6   944ce6:	4c 8b 6c 24 30       	mov    0x30(%rsp),%r13
64ab   944ceb:	48 8d 3c dd 00 00 00 00 	lea    0x0(,%rbx,8),%rdi
64b3   944cf3:	4c 01 ef             	add    %r13,%rdi
64b6   944cf6:	8b 07                	mov    (%rdi),%eax
64b8   944cf8:	89 44 24 18          	mov    %eax,0x18(%rsp)
64bc   944cfc:	e8 00 00 00 00       	call   944d01 <___bpf_prog_run+0x64c1>	944cfd: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
64c1   944d01:	8b 18                	mov    (%rax),%ebx
64c3   944d03:	8b 02                	mov    (%rdx),%eax
64c5   944d05:	89 44 24 08          	mov    %eax,0x8(%rsp)
64c9   944d09:	48 c1 ed 04          	shr    $0x4,%rbp
64cd   944d0d:	49 c1 ee 04          	shr    $0x4,%r14
64d1   944d11:	48 85 ed             	test   %rbp,%rbp
64d4   944d14:	45 0f 44 e7          	cmove  %r15d,%r12d
64d8   944d18:	48 0b 6c 24 20       	or     0x20(%rsp),%rbp
64dd   944d1d:	0f 85 f0 40 00 00    	jne    948e13 <___bpf_prog_run+0xa5d3>
64e3   944d23:	4a 8d 3c f5 00 00 00 00 	lea    0x0(,%r14,8),%rdi
64eb   944d2b:	4c 01 ef             	add    %r13,%rdi
64ee   944d2e:	44 8b 3f             	mov    (%rdi),%r15d
64f1   944d31:	e8 00 00 00 00       	call   944d36 <___bpf_prog_run+0x64f6>	944d32: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
64f6   944d36:	8b 00                	mov    (%rax),%eax
64f8   944d38:	09 c3                	or     %eax,%ebx
64fa   944d3a:	85 c0                	test   %eax,%eax
64fc   944d3c:	74 06                	je     944d44 <___bpf_prog_run+0x6504>
64fe   944d3e:	8b 02                	mov    (%rdx),%eax
6500   944d40:	89 44 24 08          	mov    %eax,0x8(%rsp)
6504   944d44:	85 db                	test   %ebx,%ebx
6506   944d46:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
650b   944d4b:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
6510   944d50:	8b 6c 24 18          	mov    0x18(%rsp),%ebp
6514   944d54:	74 0f                	je     944d65 <___bpf_prog_run+0x6525>
6516   944d56:	89 e8                	mov    %ebp,%eax
6518   944d58:	44 31 f8             	xor    %r15d,%eax
651b   944d5b:	f7 d3                	not    %ebx
651d   944d5d:	21 c3                	and    %eax,%ebx
651f   944d5f:	0f 84 32 3a 00 00    	je     948797 <___bpf_prog_run+0x9f57>
6525   944d65:	44 39 fd             	cmp    %r15d,%ebp
6528   944d68:	0f 85 3b 3a 00 00    	jne    9487a9 <___bpf_prog_run+0x9f69>
652e   944d6e:	e8 00 00 00 00       	call   944d73 <___bpf_prog_run+0x6533>	944d6f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
6533   944d73:	49 83 c5 08          	add    $0x8,%r13
6537   944d77:	e9 83 9b ff ff       	jmp    93e8ff <___bpf_prog_run+0xbf>
653c   944d7c:	49 8d 5d 01          	lea    0x1(%r13),%rbx
6540   944d80:	4d 85 f6             	test   %r14,%r14
6543   944d83:	0f 85 97 40 00 00    	jne    948e20 <___bpf_prog_run+0xa5e0>
6549   944d89:	0f b6 2b             	movzbl (%rbx),%ebp
654c   944d8c:	48 89 df             	mov    %rbx,%rdi
654f   944d8f:	e8 00 00 00 00       	call   944d94 <___bpf_prog_run+0x6554>	944d90: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
6554   944d94:	0f b6 00             	movzbl (%rax),%eax
6557   944d97:	83 e0 0f             	and    $0xf,%eax
655a   944d9a:	8b 7c 24 04          	mov    0x4(%rsp),%edi
655e   944d9e:	48 85 c0             	test   %rax,%rax
6561   944da1:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
6566   944da6:	74 02                	je     944daa <___bpf_prog_run+0x656a>
6568   944da8:	8b 3a                	mov    (%rdx),%edi
656a   944daa:	83 e5 0f             	and    $0xf,%ebp
656d   944dad:	48 09 c8             	or     %rcx,%rax
6570   944db0:	0f 85 77 40 00 00    	jne    948e2d <___bpf_prog_run+0xa5ed>
6576   944db6:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
657b   944dbb:	48 8d 3c e8          	lea    (%rax,%rbp,8),%rdi
657f   944dbf:	4c 8b 3f             	mov    (%rdi),%r15
6582   944dc2:	e8 00 00 00 00       	call   944dc7 <___bpf_prog_run+0x6587>	944dc3: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
6587   944dc7:	49 8d 6d 04          	lea    0x4(%r13),%rbp
658b   944dcb:	48 8b 18             	mov    (%rax),%rbx
658e   944dce:	44 8b 32             	mov    (%rdx),%r14d
6591   944dd1:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
6597   944dd7:	0f 85 5a 40 00 00    	jne    948e37 <___bpf_prog_run+0xa5f7>
659d   944ddd:	4c 63 65 00          	movslq 0x0(%rbp),%r12
65a1   944de1:	48 89 ef             	mov    %rbp,%rdi
65a4   944de4:	e8 00 00 00 00       	call   944de9 <___bpf_prog_run+0x65a9>	944de5: R_X86_64_PLT32	__msan_metadata_ptr_for_load_4-0x4
65a9   944de9:	48 63 00             	movslq (%rax),%rax
65ac   944dec:	48 85 c0             	test   %rax,%rax
65af   944def:	74 1f                	je     944e10 <___bpf_prog_run+0x65d0>
65b1   944df1:	44 8b 32             	mov    (%rdx),%r14d
65b4   944df4:	48 09 c3             	or     %rax,%rbx
65b7   944df7:	74 1c                	je     944e15 <___bpf_prog_run+0x65d5>
65b9   944df9:	44 89 f7             	mov    %r14d,%edi
65bc   944dfc:	e8 00 00 00 00       	call   944e01 <___bpf_prog_run+0x65c1>	944dfd: R_X86_64_PLT32	__msan_warning-0x4
65c1   944e01:	4d 39 e7             	cmp    %r12,%r15
65c4   944e04:	7f 14                	jg     944e1a <___bpf_prog_run+0x65da>
65c6   944e06:	e8 00 00 00 00       	call   944e0b <___bpf_prog_run+0x65cb>	944e07: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
65cb   944e0b:	e9 e6 9a ff ff       	jmp    93e8f6 <___bpf_prog_run+0xb6>
65d0   944e10:	48 09 c3             	or     %rax,%rbx
65d3   944e13:	75 e4                	jne    944df9 <___bpf_prog_run+0x65b9>
65d5   944e15:	4d 39 e7             	cmp    %r12,%r15
65d8   944e18:	7e ec                	jle    944e06 <___bpf_prog_run+0x65c6>
65da   944e1a:	e8 00 00 00 00       	call   944e1f <___bpf_prog_run+0x65df>	944e1b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
65df   944e1f:	49 8d 5d 02          	lea    0x2(%r13),%rbx
65e3   944e23:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
65e8   944e28:	4d 85 f6             	test   %r14,%r14
65eb   944e2b:	0f 84 8b 36 00 00    	je     9484bc <___bpf_prog_run+0x9c7c>
65f1   944e31:	8b 3c 24             	mov    (%rsp),%edi
65f4   944e34:	e8 00 00 00 00       	call   944e39 <___bpf_prog_run+0x65f9>	944e35: R_X86_64_PLT32	__msan_warning-0x4
65f9   944e39:	e9 7e 36 00 00       	jmp    9484bc <___bpf_prog_run+0x9c7c>
65fe   944e3e:	49 8d 5d 01          	lea    0x1(%r13),%rbx
6602   944e42:	4d 85 f6             	test   %r14,%r14
6605   944e45:	0f 85 f9 3f 00 00    	jne    948e44 <___bpf_prog_run+0xa604>
660b   944e4b:	0f b6 2b             	movzbl (%rbx),%ebp
660e   944e4e:	48 89 df             	mov    %rbx,%rdi
6611   944e51:	e8 00 00 00 00       	call   944e56 <___bpf_prog_run+0x6616>	944e52: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
6616   944e56:	0f b6 00             	movzbl (%rax),%eax
6619   944e59:	83 e0 0f             	and    $0xf,%eax
661c   944e5c:	8b 7c 24 04          	mov    0x4(%rsp),%edi
6620   944e60:	48 85 c0             	test   %rax,%rax
6623   944e63:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
6628   944e68:	74 02                	je     944e6c <___bpf_prog_run+0x662c>
662a   944e6a:	8b 3a                	mov    (%rdx),%edi
662c   944e6c:	83 e5 0f             	and    $0xf,%ebp
662f   944e6f:	48 09 c8             	or     %rcx,%rax
6632   944e72:	0f 85 d9 3f 00 00    	jne    948e51 <___bpf_prog_run+0xa611>
6638   944e78:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
663d   944e7d:	48 8d 3c e8          	lea    (%rax,%rbp,8),%rdi
6641   944e81:	4c 8b 3f             	mov    (%rdi),%r15
6644   944e84:	e8 00 00 00 00       	call   944e89 <___bpf_prog_run+0x6649>	944e85: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
6649   944e89:	49 8d 6d 04          	lea    0x4(%r13),%rbp
664d   944e8d:	48 8b 18             	mov    (%rax),%rbx
6650   944e90:	44 8b 32             	mov    (%rdx),%r14d
6653   944e93:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
6659   944e99:	0f 85 bc 3f 00 00    	jne    948e5b <___bpf_prog_run+0xa61b>
665f   944e9f:	4c 63 65 00          	movslq 0x0(%rbp),%r12
6663   944ea3:	48 89 ef             	mov    %rbp,%rdi
6666   944ea6:	e8 00 00 00 00       	call   944eab <___bpf_prog_run+0x666b>	944ea7: R_X86_64_PLT32	__msan_metadata_ptr_for_load_4-0x4
666b   944eab:	48 63 00             	movslq (%rax),%rax
666e   944eae:	48 85 c0             	test   %rax,%rax
6671   944eb1:	74 39                	je     944eec <___bpf_prog_run+0x66ac>
6673   944eb3:	44 8b 32             	mov    (%rdx),%r14d
6676   944eb6:	48 09 c3             	or     %rax,%rbx
6679   944eb9:	74 36                	je     944ef1 <___bpf_prog_run+0x66b1>
667b   944ebb:	44 89 f7             	mov    %r14d,%edi
667e   944ebe:	e8 00 00 00 00       	call   944ec3 <___bpf_prog_run+0x6683>	944ebf: R_X86_64_PLT32	__msan_warning-0x4
6683   944ec3:	4d 39 e7             	cmp    %r12,%r15
6686   944ec6:	7c 2e                	jl     944ef6 <___bpf_prog_run+0x66b6>
6688   944ec8:	e8 00 00 00 00       	call   944ecd <___bpf_prog_run+0x668d>	944ec9: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
668d   944ecd:	49 8d 5d 02          	lea    0x2(%r13),%rbx
6691   944ed1:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
6696   944ed6:	4d 85 f6             	test   %r14,%r14
6699   944ed9:	0f 84 dd 35 00 00    	je     9484bc <___bpf_prog_run+0x9c7c>
669f   944edf:	8b 3c 24             	mov    (%rsp),%edi
66a2   944ee2:	e8 00 00 00 00       	call   944ee7 <___bpf_prog_run+0x66a7>	944ee3: R_X86_64_PLT32	__msan_warning-0x4
66a7   944ee7:	e9 d0 35 00 00       	jmp    9484bc <___bpf_prog_run+0x9c7c>
66ac   944eec:	48 09 c3             	or     %rax,%rbx
66af   944eef:	75 ca                	jne    944ebb <___bpf_prog_run+0x667b>
66b1   944ef1:	4d 39 e7             	cmp    %r12,%r15
66b4   944ef4:	7d d2                	jge    944ec8 <___bpf_prog_run+0x6688>
66b6   944ef6:	e8 00 00 00 00       	call   944efb <___bpf_prog_run+0x66bb>	944ef7: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
66bb   944efb:	e9 f6 99 ff ff       	jmp    93e8f6 <___bpf_prog_run+0xb6>
66c0   944f00:	e8 00 00 00 00       	call   944f05 <___bpf_prog_run+0x66c5>	944f01: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
66c5   944f05:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
66ca   944f0a:	49 8d 5d 01          	lea    0x1(%r13),%rbx
66ce   944f0e:	4d 85 f6             	test   %r14,%r14
66d1   944f11:	0f 85 51 3f 00 00    	jne    948e68 <___bpf_prog_run+0xa628>
66d7   944f17:	44 0f b6 23          	movzbl (%rbx),%r12d
66db   944f1b:	48 89 df             	mov    %rbx,%rdi
66de   944f1e:	e8 00 00 00 00       	call   944f23 <___bpf_prog_run+0x66e3>	944f1f: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
66e3   944f23:	0f b6 18             	movzbl (%rax),%ebx
66e6   944f26:	44 8b 3a             	mov    (%rdx),%r15d
66e9   944f29:	89 d8                	mov    %ebx,%eax
66eb   944f2b:	83 e0 0f             	and    $0xf,%eax
66ee   944f2e:	4c 89 64 24 08       	mov    %r12,0x8(%rsp)
66f3   944f33:	41 83 e4 0f          	and    $0xf,%r12d
66f7   944f37:	48 85 c0             	test   %rax,%rax
66fa   944f3a:	8b 6c 24 04          	mov    0x4(%rsp),%ebp
66fe   944f3e:	41 0f 45 ef          	cmovne %r15d,%ebp
6702   944f42:	4c 8b 6c 24 20       	mov    0x20(%rsp),%r13
6707   944f47:	4c 09 e8             	or     %r13,%rax
670a   944f4a:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
670f   944f4f:	0f 85 20 3f 00 00    	jne    948e75 <___bpf_prog_run+0xa635>
6715   944f55:	89 6c 24 50          	mov    %ebp,0x50(%rsp)
6719   944f59:	4c 8b 74 24 30       	mov    0x30(%rsp),%r14
671e   944f5e:	4b 8d 3c e6          	lea    (%r14,%r12,8),%rdi
6722   944f62:	4c 8b 27             	mov    (%rdi),%r12
6725   944f65:	48 89 7c 24 18       	mov    %rdi,0x18(%rsp)
672a   944f6a:	e8 00 00 00 00       	call   944f6f <___bpf_prog_run+0x672f>	944f6b: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
672f   944f6f:	48 8b 28             	mov    (%rax),%rbp
6732   944f72:	8b 02                	mov    (%rdx),%eax
6734   944f74:	89 44 24 40          	mov    %eax,0x40(%rsp)
6738   944f78:	48 c1 eb 04          	shr    $0x4,%rbx
673c   944f7c:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
6741   944f81:	48 c1 e8 04          	shr    $0x4,%rax
6745   944f85:	48 85 db             	test   %rbx,%rbx
6748   944f88:	44 0f 44 7c 24 04    	cmove  0x4(%rsp),%r15d
674e   944f8e:	4c 09 eb             	or     %r13,%rbx
6751   944f91:	48 89 c3             	mov    %rax,%rbx
6754   944f94:	0f 85 e7 3e 00 00    	jne    948e81 <___bpf_prog_run+0xa641>
675a   944f9a:	49 8d 3c de          	lea    (%r14,%rbx,8),%rdi
675e   944f9e:	4c 8b 37             	mov    (%rdi),%r14
6761   944fa1:	e8 00 00 00 00       	call   944fa6 <___bpf_prog_run+0x6766>	944fa2: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
6766   944fa6:	48 8b 18             	mov    (%rax),%rbx
6769   944fa9:	48 89 d8             	mov    %rbx,%rax
676c   944fac:	4c 21 e0             	and    %r12,%rax
676f   944faf:	4c 09 f3             	or     %r14,%rbx
6772   944fb2:	48 21 eb             	and    %rbp,%rbx
6775   944fb5:	48 85 ed             	test   %rbp,%rbp
6778   944fb8:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
677d   944fbd:	75 06                	jne    944fc5 <___bpf_prog_run+0x6785>
677f   944fbf:	8b 0a                	mov    (%rdx),%ecx
6781   944fc1:	89 4c 24 40          	mov    %ecx,0x40(%rsp)
6785   944fc5:	48 09 c3             	or     %rax,%rbx
6788   944fc8:	48 83 7c 24 38 00    	cmpq   $0x0,0x38(%rsp)
678e   944fce:	48 8b 6c 24 18       	mov    0x18(%rsp),%rbp
6793   944fd3:	0f 85 b5 3e 00 00    	jne    948e8e <___bpf_prog_run+0xa64e>
6799   944fd9:	4d 21 e6             	and    %r12,%r14
679c   944fdc:	48 89 ef             	mov    %rbp,%rdi
679f   944fdf:	e8 00 00 00 00       	call   944fe4 <___bpf_prog_run+0x67a4>	944fe0: R_X86_64_PLT32	__msan_metadata_ptr_for_store_8-0x4
67a4   944fe4:	48 89 18             	mov    %rbx,(%rax)
67a7   944fe7:	48 85 db             	test   %rbx,%rbx
67aa   944fea:	0f 85 09 22 00 00    	jne    9471f9 <___bpf_prog_run+0x89b9>
67b0   944ff0:	4c 89 75 00          	mov    %r14,0x0(%rbp)
67b4   944ff4:	e9 fd 98 ff ff       	jmp    93e8f6 <___bpf_prog_run+0xb6>
67b9   944ff9:	e8 00 00 00 00       	call   944ffe <___bpf_prog_run+0x67be>	944ffa: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
67be   944ffe:	49 8d 5d 01          	lea    0x1(%r13),%rbx
67c2   945002:	4d 85 f6             	test   %r14,%r14
67c5   945005:	0f 85 91 3e 00 00    	jne    948e9c <___bpf_prog_run+0xa65c>
67cb   94500b:	44 0f b6 23          	movzbl (%rbx),%r12d
67cf   94500f:	48 89 df             	mov    %rbx,%rdi
67d2   945012:	e8 00 00 00 00       	call   945017 <___bpf_prog_run+0x67d7>	945013: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
67d7   945017:	44 0f b6 30          	movzbl (%rax),%r14d
67db   94501b:	8b 0a                	mov    (%rdx),%ecx
67dd   94501d:	4c 89 f0             	mov    %r14,%rax
67e0   945020:	48 c1 e8 04          	shr    $0x4,%rax
67e4   945024:	4c 89 e3             	mov    %r12,%rbx
67e7   945027:	48 c1 eb 04          	shr    $0x4,%rbx
67eb   94502b:	48 85 c0             	test   %rax,%rax
67ee   94502e:	8b 7c 24 04          	mov    0x4(%rsp),%edi
67f2   945032:	89 4c 24 18          	mov    %ecx,0x18(%rsp)
67f6   945036:	0f 45 f9             	cmovne %ecx,%edi
67f9   945039:	48 0b 44 24 20       	or     0x20(%rsp),%rax
67fe   94503e:	0f 85 65 3e 00 00    	jne    948ea9 <___bpf_prog_run+0xa669>
6804   945044:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
6809   945049:	48 8d 3c d8          	lea    (%rax,%rbx,8),%rdi
680d   94504d:	48 8b 2f             	mov    (%rdi),%rbp
6810   945050:	e8 00 00 00 00       	call   945055 <___bpf_prog_run+0x6815>	945051: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
6815   945055:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
681a   94505a:	49 8d 5d 02          	lea    0x2(%r13),%rbx
681e   94505e:	4c 8b 28             	mov    (%rax),%r13
6821   945061:	8b 02                	mov    (%rdx),%eax
6823   945063:	89 44 24 08          	mov    %eax,0x8(%rsp)
6827   945067:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
682d   94506d:	0f 85 40 3e 00 00    	jne    948eb3 <___bpf_prog_run+0xa673>
6833   945073:	4c 0f bf 3b          	movswq (%rbx),%r15
6837   945077:	48 89 df             	mov    %rbx,%rdi
683a   94507a:	e8 00 00 00 00       	call   94507f <___bpf_prog_run+0x683f>	94507b: R_X86_64_PLT32	__msan_metadata_ptr_for_load_2-0x4
683f   94507f:	48 0f bf 00          	movswq (%rax),%rax
6843   945083:	48 85 c0             	test   %rax,%rax
6846   945086:	74 06                	je     94508e <___bpf_prog_run+0x684e>
6848   945088:	8b 0a                	mov    (%rdx),%ecx
684a   94508a:	89 4c 24 08          	mov    %ecx,0x8(%rsp)
684e   94508e:	4c 01 fd             	add    %r15,%rbp
6851   945091:	49 09 c5             	or     %rax,%r13
6854   945094:	0f 85 26 3e 00 00    	jne    948ec0 <___bpf_prog_run+0xa680>
685a   94509a:	44 0f b7 6d 00       	movzwl 0x0(%rbp),%r13d
685f   94509f:	48 89 ef             	mov    %rbp,%rdi
6862   9450a2:	e8 00 00 00 00       	call   9450a7 <___bpf_prog_run+0x6867>	9450a3: R_X86_64_PLT32	__msan_metadata_ptr_for_load_2-0x4
6867   9450a7:	0f b7 28             	movzwl (%rax),%ebp
686a   9450aa:	44 8b 3a             	mov    (%rdx),%r15d
686d   9450ad:	41 83 e6 0f          	and    $0xf,%r14d
6871   9450b1:	41 83 e4 0f          	and    $0xf,%r12d
6875   9450b5:	4d 85 f6             	test   %r14,%r14
6878   9450b8:	8b 7c 24 18          	mov    0x18(%rsp),%edi
687c   9450bc:	0f 44 7c 24 04       	cmove  0x4(%rsp),%edi
6881   9450c1:	4c 0b 74 24 20       	or     0x20(%rsp),%r14
6886   9450c6:	0f 85 02 3e 00 00    	jne    948ece <___bpf_prog_run+0xa68e>
688c   9450cc:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
6891   9450d1:	4a 8d 1c e0          	lea    (%rax,%r12,8),%rbx
6895   9450d5:	48 89 df             	mov    %rbx,%rdi
6898   9450d8:	e8 00 00 00 00       	call   9450dd <___bpf_prog_run+0x689d>	9450d9: R_X86_64_PLT32	__msan_metadata_ptr_for_store_8-0x4
689d   9450dd:	48 89 28             	mov    %rbp,(%rax)
68a0   9450e0:	48 85 ed             	test   %rbp,%rbp
68a3   9450e3:	0f 85 2e 20 00 00    	jne    947117 <___bpf_prog_run+0x88d7>
68a9   9450e9:	4c 89 2b             	mov    %r13,(%rbx)
68ac   9450ec:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
68b1   9450f1:	e9 00 98 ff ff       	jmp    93e8f6 <___bpf_prog_run+0xb6>
68b6   9450f6:	e8 00 00 00 00       	call   9450fb <___bpf_prog_run+0x68bb>	9450f7: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
68bb   9450fb:	49 8d 5d 04          	lea    0x4(%r13),%rbx
68bf   9450ff:	4d 85 f6             	test   %r14,%r14
68c2   945102:	4c 89 f5             	mov    %r14,%rbp
68c5   945105:	0f 85 cd 3d 00 00    	jne    948ed8 <___bpf_prog_run+0xa698>
68cb   94510b:	41 8a 45 04          	mov    0x4(%r13),%al
68cf   94510f:	88 44 24 18          	mov    %al,0x18(%rsp)
68d3   945113:	48 89 df             	mov    %rbx,%rdi
68d6   945116:	e8 00 00 00 00       	call   94511b <___bpf_prog_run+0x68db>	945117: R_X86_64_PLT32	__msan_metadata_ptr_for_load_4-0x4
68db   94511b:	49 8d 5d 01          	lea    0x1(%r13),%rbx
68df   94511f:	8a 00                	mov    (%rax),%al
68e1   945121:	88 44 24 08          	mov    %al,0x8(%rsp)
68e5   945125:	8b 02                	mov    (%rdx),%eax
68e7   945127:	89 44 24 38          	mov    %eax,0x38(%rsp)
68eb   94512b:	48 85 ed             	test   %rbp,%rbp
68ee   94512e:	0f 85 b1 3d 00 00    	jne    948ee5 <___bpf_prog_run+0xa6a5>
68f4   945134:	0f b6 2b             	movzbl (%rbx),%ebp
68f7   945137:	48 89 df             	mov    %rbx,%rdi
68fa   94513a:	e8 00 00 00 00       	call   94513f <___bpf_prog_run+0x68ff>	94513b: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
68ff   94513f:	0f b6 00             	movzbl (%rax),%eax
6902   945142:	83 e0 0f             	and    $0xf,%eax
6905   945145:	8b 7c 24 04          	mov    0x4(%rsp),%edi
6909   945149:	48 85 c0             	test   %rax,%rax
690c   94514c:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
6911   945151:	74 02                	je     945155 <___bpf_prog_run+0x6915>
6913   945153:	8b 3a                	mov    (%rdx),%edi
6915   945155:	83 e5 0f             	and    $0xf,%ebp
6918   945158:	48 09 c8             	or     %rcx,%rax
691b   94515b:	0f 85 91 3d 00 00    	jne    948ef2 <___bpf_prog_run+0xa6b2>
6921   945161:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
6926   945166:	48 8d 3c e8          	lea    (%rax,%rbp,8),%rdi
692a   94516a:	48 8b 2f             	mov    (%rdi),%rbp
692d   94516d:	e8 00 00 00 00       	call   945172 <___bpf_prog_run+0x6932>	94516e: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
6932   945172:	4d 89 ee             	mov    %r13,%r14
6935   945175:	49 8d 5d 02          	lea    0x2(%r13),%rbx
6939   945179:	4c 8b 28             	mov    (%rax),%r13
693c   94517c:	44 8b 3a             	mov    (%rdx),%r15d
693f   94517f:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
6945   945185:	0f 85 71 3d 00 00    	jne    948efc <___bpf_prog_run+0xa6bc>
694b   94518b:	4c 0f bf 23          	movswq (%rbx),%r12
694f   94518f:	48 89 df             	mov    %rbx,%rdi
6952   945192:	e8 00 00 00 00       	call   945197 <___bpf_prog_run+0x6957>	945193: R_X86_64_PLT32	__msan_metadata_ptr_for_load_2-0x4
6957   945197:	48 0f bf 00          	movswq (%rax),%rax
695b   94519b:	48 85 c0             	test   %rax,%rax
695e   94519e:	74 03                	je     9451a3 <___bpf_prog_run+0x6963>
6960   9451a0:	44 8b 3a             	mov    (%rdx),%r15d
6963   9451a3:	4c 01 e5             	add    %r12,%rbp
6966   9451a6:	49 09 c5             	or     %rax,%r13
6969   9451a9:	0f 85 5a 3d 00 00    	jne    948f09 <___bpf_prog_run+0xa6c9>
696f   9451af:	48 89 ef             	mov    %rbp,%rdi
6972   9451b2:	e8 00 00 00 00       	call   9451b7 <___bpf_prog_run+0x6977>	9451b3: R_X86_64_PLT32	__msan_metadata_ptr_for_store_1-0x4
6977   9451b7:	8a 4c 24 08          	mov    0x8(%rsp),%cl
697b   9451bb:	88 08                	mov    %cl,(%rax)
697d   9451bd:	84 c9                	test   %cl,%cl
697f   9451bf:	0f 85 51 3d 00 00    	jne    948f16 <___bpf_prog_run+0xa6d6>
6985   9451c5:	8a 44 24 18          	mov    0x18(%rsp),%al
6989   9451c9:	88 45 00             	mov    %al,0x0(%rbp)
698c   9451cc:	49 83 c6 08          	add    $0x8,%r14
6990   9451d0:	4d 89 f5             	mov    %r14,%r13
6993   9451d3:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
6998   9451d8:	e9 22 97 ff ff       	jmp    93e8ff <___bpf_prog_run+0xbf>
699d   9451dd:	e8 00 00 00 00       	call   9451e2 <___bpf_prog_run+0x69a2>	9451de: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
69a2   9451e2:	49 83 c5 08          	add    $0x8,%r13
69a6   9451e6:	e9 14 97 ff ff       	jmp    93e8ff <___bpf_prog_run+0xbf>
69ab   9451eb:	e8 00 00 00 00       	call   9451f0 <___bpf_prog_run+0x69b0>	9451ec: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
69b0   9451f0:	49 8d 5d 02          	lea    0x2(%r13),%rbx
69b4   9451f4:	4d 85 f6             	test   %r14,%r14
69b7   9451f7:	0f 84 bf 32 00 00    	je     9484bc <___bpf_prog_run+0x9c7c>
69bd   9451fd:	8b 3c 24             	mov    (%rsp),%edi
69c0   945200:	e8 00 00 00 00       	call   945205 <___bpf_prog_run+0x69c5>	945201: R_X86_64_PLT32	__msan_warning-0x4
69c5   945205:	e9 b2 32 00 00       	jmp    9484bc <___bpf_prog_run+0x9c7c>
69ca   94520a:	e8 00 00 00 00       	call   94520f <___bpf_prog_run+0x69cf>	94520b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
69cf   94520f:	49 83 c5 08          	add    $0x8,%r13
69d3   945213:	e9 e7 96 ff ff       	jmp    93e8ff <___bpf_prog_run+0xbf>
69d8   945218:	e8 00 00 00 00       	call   94521d <___bpf_prog_run+0x69dd>	945219: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
69dd   94521d:	49 83 c5 08          	add    $0x8,%r13
69e1   945221:	e9 d9 96 ff ff       	jmp    93e8ff <___bpf_prog_run+0xbf>
69e6   945226:	e8 00 00 00 00       	call   94522b <___bpf_prog_run+0x69eb>	945227: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
69eb   94522b:	49 83 c5 08          	add    $0x8,%r13
69ef   94522f:	e9 cb 96 ff ff       	jmp    93e8ff <___bpf_prog_run+0xbf>
69f4   945234:	e8 00 00 00 00       	call   945239 <___bpf_prog_run+0x69f9>	945235: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
69f9   945239:	49 83 c5 08          	add    $0x8,%r13
69fd   94523d:	e9 bd 96 ff ff       	jmp    93e8ff <___bpf_prog_run+0xbf>
6a02   945242:	e8 00 00 00 00       	call   945247 <___bpf_prog_run+0x6a07>	945243: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
6a07   945247:	49 8d 5d 02          	lea    0x2(%r13),%rbx
6a0b   94524b:	4d 85 f6             	test   %r14,%r14
6a0e   94524e:	0f 84 68 32 00 00    	je     9484bc <___bpf_prog_run+0x9c7c>
6a14   945254:	8b 3c 24             	mov    (%rsp),%edi
6a17   945257:	e8 00 00 00 00       	call   94525c <___bpf_prog_run+0x6a1c>	945258: R_X86_64_PLT32	__msan_warning-0x4
6a1c   94525c:	e9 5b 32 00 00       	jmp    9484bc <___bpf_prog_run+0x9c7c>
6a21   945261:	e8 00 00 00 00       	call   945266 <___bpf_prog_run+0x6a26>	945262: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
6a26   945266:	49 8d 5d 02          	lea    0x2(%r13),%rbx
6a2a   94526a:	4d 85 f6             	test   %r14,%r14
6a2d   94526d:	0f 84 49 32 00 00    	je     9484bc <___bpf_prog_run+0x9c7c>
6a33   945273:	8b 3c 24             	mov    (%rsp),%edi
6a36   945276:	e8 00 00 00 00       	call   94527b <___bpf_prog_run+0x6a3b>	945277: R_X86_64_PLT32	__msan_warning-0x4
6a3b   94527b:	e9 3c 32 00 00       	jmp    9484bc <___bpf_prog_run+0x9c7c>
6a40   945280:	e8 00 00 00 00       	call   945285 <___bpf_prog_run+0x6a45>	945281: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
6a45   945285:	49 8d 5d 02          	lea    0x2(%r13),%rbx
6a49   945289:	4d 85 f6             	test   %r14,%r14
6a4c   94528c:	0f 84 2a 32 00 00    	je     9484bc <___bpf_prog_run+0x9c7c>
6a52   945292:	8b 3c 24             	mov    (%rsp),%edi
6a55   945295:	e8 00 00 00 00       	call   94529a <___bpf_prog_run+0x6a5a>	945296: R_X86_64_PLT32	__msan_warning-0x4
6a5a   94529a:	e9 1d 32 00 00       	jmp    9484bc <___bpf_prog_run+0x9c7c>
6a5f   94529f:	e8 00 00 00 00       	call   9452a4 <___bpf_prog_run+0x6a64>	9452a0: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
6a64   9452a4:	49 83 c5 08          	add    $0x8,%r13
6a68   9452a8:	e9 52 96 ff ff       	jmp    93e8ff <___bpf_prog_run+0xbf>
6a6d   9452ad:	e8 00 00 00 00       	call   9452b2 <___bpf_prog_run+0x6a72>	9452ae: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
6a72   9452b2:	4d 8d 65 02          	lea    0x2(%r13),%r12
6a76   9452b6:	4d 85 f6             	test   %r14,%r14
6a79   9452b9:	0f 85 a9 3c 00 00    	jne    948f68 <___bpf_prog_run+0xa728>
6a7f   9452bf:	4d 0f bf 7d 02       	movswq 0x2(%r13),%r15
6a84   9452c4:	4c 89 e7             	mov    %r12,%rdi
6a87   9452c7:	e8 00 00 00 00       	call   9452cc <___bpf_prog_run+0x6a8c>	9452c8: R_X86_64_PLT32	__msan_metadata_ptr_for_load_2-0x4
6a8c   9452cc:	48 0f bf 00          	movswq (%rax),%rax
6a90   9452d0:	48 85 c0             	test   %rax,%rax
6a93   9452d3:	74 05                	je     9452da <___bpf_prog_run+0x6a9a>
6a95   9452d5:	8b 0a                	mov    (%rdx),%ecx
6a97   9452d7:	89 0c 24             	mov    %ecx,(%rsp)
6a9a   9452da:	49 09 c6             	or     %rax,%r14
6a9d   9452dd:	4f 8d 6c fd 08       	lea    0x8(%r13,%r15,8),%r13
6aa2   9452e2:	e9 18 96 ff ff       	jmp    93e8ff <___bpf_prog_run+0xbf>
6aa7   9452e7:	e8 00 00 00 00       	call   9452ec <___bpf_prog_run+0x6aac>	9452e8: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
6aac   9452ec:	49 83 c5 08          	add    $0x8,%r13
6ab0   9452f0:	e9 0a 96 ff ff       	jmp    93e8ff <___bpf_prog_run+0xbf>
6ab5   9452f5:	e8 00 00 00 00       	call   9452fa <___bpf_prog_run+0x6aba>	9452f6: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
6aba   9452fa:	49 8d 5d 02          	lea    0x2(%r13),%rbx
6abe   9452fe:	4d 85 f6             	test   %r14,%r14
6ac1   945301:	0f 84 b5 31 00 00    	je     9484bc <___bpf_prog_run+0x9c7c>
6ac7   945307:	8b 3c 24             	mov    (%rsp),%edi
6aca   94530a:	e8 00 00 00 00       	call   94530f <___bpf_prog_run+0x6acf>	94530b: R_X86_64_PLT32	__msan_warning-0x4
6acf   94530f:	e9 a8 31 00 00       	jmp    9484bc <___bpf_prog_run+0x9c7c>
6ad4   945314:	e8 00 00 00 00       	call   945319 <___bpf_prog_run+0x6ad9>	945315: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
6ad9   945319:	49 83 c5 08          	add    $0x8,%r13
6add   94531d:	e9 dd 95 ff ff       	jmp    93e8ff <___bpf_prog_run+0xbf>
6ae2   945322:	e8 00 00 00 00       	call   945327 <___bpf_prog_run+0x6ae7>	945323: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
6ae7   945327:	49 8d 5d 02          	lea    0x2(%r13),%rbx
6aeb   94532b:	4d 85 f6             	test   %r14,%r14
6aee   94532e:	0f 84 88 31 00 00    	je     9484bc <___bpf_prog_run+0x9c7c>
6af4   945334:	8b 3c 24             	mov    (%rsp),%edi
6af7   945337:	e8 00 00 00 00       	call   94533c <___bpf_prog_run+0x6afc>	945338: R_X86_64_PLT32	__msan_warning-0x4
6afc   94533c:	e9 7b 31 00 00       	jmp    9484bc <___bpf_prog_run+0x9c7c>
6b01   945341:	e8 00 00 00 00       	call   945346 <___bpf_prog_run+0x6b06>	945342: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
6b06   945346:	49 8d 5d 02          	lea    0x2(%r13),%rbx
6b0a   94534a:	4d 85 f6             	test   %r14,%r14
6b0d   94534d:	0f 84 69 31 00 00    	je     9484bc <___bpf_prog_run+0x9c7c>
6b13   945353:	8b 3c 24             	mov    (%rsp),%edi
6b16   945356:	e8 00 00 00 00       	call   94535b <___bpf_prog_run+0x6b1b>	945357: R_X86_64_PLT32	__msan_warning-0x4
6b1b   94535b:	e9 5c 31 00 00       	jmp    9484bc <___bpf_prog_run+0x9c7c>
6b20   945360:	41 81 fe e0 00 00 00 	cmp    $0xe0,%r14d
6b27   945367:	0f 8f 50 04 00 00    	jg     9457bd <___bpf_prog_run+0x6f7d>
6b2d   94536d:	41 81 fe a0 00 00 00 	cmp    $0xa0,%r14d
6b34   945374:	0f 85 fb 0c 00 00    	jne    946075 <___bpf_prog_run+0x7835>
6b3a   94537a:	41 80 e7 18          	and    $0x18,%r15b
6b3e   94537e:	89 e8                	mov    %ebp,%eax
6b40   945380:	f6 d0                	not    %al
6b42   945382:	44 84 f8             	test   %r15b,%al
6b45   945385:	41 0f 94 c6          	sete   %r14b
6b49   945389:	40 f6 c5 18          	test   $0x18,%bpl
6b4d   94538d:	4c 89 e8             	mov    %r13,%rax
6b50   945390:	41 0f 95 c5          	setne  %r13b
6b54   945394:	48 8d 58 01          	lea    0x1(%rax),%rbx
6b58   945398:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
6b5e   94539e:	0f 85 02 3d 00 00    	jne    9490a6 <___bpf_prog_run+0xa866>
6b64   9453a4:	45 20 f5             	and    %r14b,%r13b
6b67   9453a7:	44 0f b6 33          	movzbl (%rbx),%r14d
6b6b   9453ab:	48 89 df             	mov    %rbx,%rdi
6b6e   9453ae:	e8 00 00 00 00       	call   9453b3 <___bpf_prog_run+0x6b73>	9453af: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
6b73   9453b3:	0f b6 18             	movzbl (%rax),%ebx
6b76   9453b6:	8b 2a                	mov    (%rdx),%ebp
6b78   9453b8:	48 89 d8             	mov    %rbx,%rax
6b7b   9453bb:	48 c1 e8 04          	shr    $0x4,%rax
6b7f   9453bf:	4c 89 74 24 38       	mov    %r14,0x38(%rsp)
6b84   9453c4:	49 c1 ee 04          	shr    $0x4,%r14
6b88   9453c8:	48 85 c0             	test   %rax,%rax
6b8b   9453cb:	8b 7c 24 04          	mov    0x4(%rsp),%edi
6b8f   9453cf:	0f 45 fd             	cmovne %ebp,%edi
6b92   9453d2:	48 0b 44 24 20       	or     0x20(%rsp),%rax
6b97   9453d7:	0f 85 d6 3c 00 00    	jne    9490b3 <___bpf_prog_run+0xa873>
6b9d   9453dd:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
6ba2   9453e2:	4a 8d 3c f0          	lea    (%rax,%r14,8),%rdi
6ba6   9453e6:	4c 8b 37             	mov    (%rdi),%r14
6ba9   9453e9:	e8 00 00 00 00       	call   9453ee <___bpf_prog_run+0x6bae>	9453ea: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
6bae   9453ee:	48 8b 00             	mov    (%rax),%rax
6bb1   9453f1:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
6bb6   9453f6:	8b 02                	mov    (%rdx),%eax
6bb8   9453f8:	89 44 24 40          	mov    %eax,0x40(%rsp)
6bbc   9453fc:	45 84 ed             	test   %r13b,%r13b
6bbf   9453ff:	0f 85 b8 3c 00 00    	jne    9490bd <___bpf_prog_run+0xa87d>
6bc5   945405:	45 84 ff             	test   %r15b,%r15b
6bc8   945408:	4c 8b 7c 24 20       	mov    0x20(%rsp),%r15
6bcd   94540d:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
6bd2   945412:	4c 89 74 24 18       	mov    %r14,0x18(%rsp)
6bd7   945417:	0f 84 97 15 00 00    	je     9469b4 <___bpf_prog_run+0x8174>
6bdd   94541d:	e8 00 00 00 00       	call   945422 <___bpf_prog_run+0x6be2>	94541e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
6be2   945422:	89 d8                	mov    %ebx,%eax
6be4   945424:	83 e0 0f             	and    $0xf,%eax
6be7   945427:	89 ef                	mov    %ebp,%edi
6be9   945429:	48 8b 6c 24 38       	mov    0x38(%rsp),%rbp
6bee   94542e:	83 e5 0f             	and    $0xf,%ebp
6bf1   945431:	f6 c3 0f             	test   $0xf,%bl
6bf4   945434:	0f 44 7c 24 04       	cmove  0x4(%rsp),%edi
6bf9   945439:	4c 09 f8             	or     %r15,%rax
6bfc   94543c:	48 8b 5c 24 30       	mov    0x30(%rsp),%rbx
6c01   945441:	0f 85 17 3f 00 00    	jne    94935e <___bpf_prog_run+0xab1e>
6c07   945447:	48 8d 3c eb          	lea    (%rbx,%rbp,8),%rdi
6c0b   94544b:	4c 8b 37             	mov    (%rdi),%r14
6c0e   94544e:	e8 00 00 00 00       	call   945453 <___bpf_prog_run+0x6c13>	94544f: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
6c13   945453:	49 8d 5d 02          	lea    0x2(%r13),%rbx
6c17   945457:	48 8b 28             	mov    (%rax),%rbp
6c1a   94545a:	44 8b 3a             	mov    (%rdx),%r15d
6c1d   94545d:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
6c23   945463:	0f 85 ff 3e 00 00    	jne    949368 <___bpf_prog_run+0xab28>
6c29   945469:	4c 0f bf 23          	movswq (%rbx),%r12
6c2d   94546d:	48 89 df             	mov    %rbx,%rdi
6c30   945470:	e8 00 00 00 00       	call   945475 <___bpf_prog_run+0x6c35>	945471: R_X86_64_PLT32	__msan_metadata_ptr_for_load_2-0x4
6c35   945475:	48 0f bf 00          	movswq (%rax),%rax
6c39   945479:	48 85 c0             	test   %rax,%rax
6c3c   94547c:	74 03                	je     945481 <___bpf_prog_run+0x6c41>
6c3e   94547e:	44 8b 3a             	mov    (%rdx),%r15d
6c41   945481:	48 09 c5             	or     %rax,%rbp
6c44   945484:	4d 01 e6             	add    %r12,%r14
6c47   945487:	be 08 00 00 00       	mov    $0x8,%esi
6c4c   94548c:	4c 89 f7             	mov    %r14,%rdi
6c4f   94548f:	e8 00 00 00 00       	call   945494 <___bpf_prog_run+0x6c54>	945490: R_X86_64_PLT32	__msan_instrument_asm_store-0x4
6c54   945494:	48 83 7c 24 08 00    	cmpq   $0x0,0x8(%rsp)
6c5a   94549a:	0f 85 d5 3e 00 00    	jne    949375 <___bpf_prog_run+0xab35>
6c60   9454a0:	48 85 ed             	test   %rbp,%rbp
6c63   9454a3:	0f 85 de 3e 00 00    	jne    949387 <___bpf_prog_run+0xab47>
6c69   9454a9:	48 85 ed             	test   %rbp,%rbp
6c6c   9454ac:	0f 85 e6 3e 00 00    	jne    949398 <___bpf_prog_run+0xab58>
6c72   9454b2:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
6c77   9454b7:	f0 49 31 06          	lock xor %rax,(%r14)
6c7b   9454bb:	e9 36 94 ff ff       	jmp    93e8f6 <___bpf_prog_run+0xb6>
6c80   9454c0:	31 d2                	xor    %edx,%edx
6c82   9454c2:	f7 f3                	div    %ebx
6c84   9454c4:	89 c3                	mov    %eax,%ebx
6c86   9454c6:	4d 85 ff             	test   %r15,%r15
6c89   9454c9:	0f 84 5b ce ff ff    	je     94232a <___bpf_prog_run+0x3aea>
6c8f   9454cf:	8b 7c 24 38          	mov    0x38(%rsp),%edi
6c93   9454d3:	e8 00 00 00 00       	call   9454d8 <___bpf_prog_run+0x6c98>	9454d4: R_X86_64_PLT32	__msan_warning-0x4
6c98   9454d8:	e9 4d ce ff ff       	jmp    94232a <___bpf_prog_run+0x3aea>
6c9d   9454dd:	44 89 e8             	mov    %r13d,%eax
6ca0   9454e0:	31 d2                	xor    %edx,%edx
6ca2   9454e2:	f7 f5                	div    %ebp
6ca4   9454e4:	89 c5                	mov    %eax,%ebp
6ca6   9454e6:	4d 85 f6             	test   %r14,%r14
6ca9   9454e9:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
6cae   9454ee:	0f 85 ef 32 00 00    	jne    9487e3 <___bpf_prog_run+0x9fa3>
6cb4   9454f4:	4c 89 e7             	mov    %r12,%rdi
6cb7   9454f7:	e8 00 00 00 00       	call   9454fc <___bpf_prog_run+0x6cbc>	9454f8: R_X86_64_PLT32	__msan_metadata_ptr_for_store_8-0x4
6cbc   9454fc:	4c 89 38             	mov    %r15,(%rax)
6cbf   9454ff:	4d 85 ff             	test   %r15,%r15
6cc2   945502:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
6cc7   945507:	0f 85 e4 32 00 00    	jne    9487f1 <___bpf_prog_run+0x9fb1>
6ccd   94550d:	49 89 2c 24          	mov    %rbp,(%r12)
6cd1   945511:	49 83 c5 08          	add    $0x8,%r13
6cd5   945515:	e9 e5 93 ff ff       	jmp    93e8ff <___bpf_prog_run+0xbf>
6cda   94551a:	89 e8                	mov    %ebp,%eax
6cdc   94551c:	31 d2                	xor    %edx,%edx
6cde   94551e:	f7 f3                	div    %ebx
6ce0   945520:	41 89 d4             	mov    %edx,%r12d
6ce3   945523:	48 83 7c 24 20 00    	cmpq   $0x0,0x20(%rsp)
6ce9   945529:	48 8b 5c 24 60       	mov    0x60(%rsp),%rbx
6cee   94552e:	0f 85 dd 32 00 00    	jne    948811 <___bpf_prog_run+0x9fd1>
6cf4   945534:	48 89 df             	mov    %rbx,%rdi
6cf7   945537:	e8 00 00 00 00       	call   94553c <___bpf_prog_run+0x6cfc>	945538: R_X86_64_PLT32	__msan_metadata_ptr_for_store_8-0x4
6cfc   94553c:	4c 89 38             	mov    %r15,(%rax)
6cff   94553f:	4d 85 ff             	test   %r15,%r15
6d02   945542:	0f 85 d7 32 00 00    	jne    94881f <___bpf_prog_run+0x9fdf>
6d08   945548:	4c 89 23             	mov    %r12,(%rbx)
6d0b   94554b:	4d 85 f6             	test   %r14,%r14
6d0e   94554e:	0f 85 ec 32 00 00    	jne    948840 <___bpf_prog_run+0xa000>
6d14   945554:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
6d19   945559:	0f b6 1f             	movzbl (%rdi),%ebx
6d1c   94555c:	e8 00 00 00 00       	call   945561 <___bpf_prog_run+0x6d21>	94555d: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
6d21   945561:	0f b6 00             	movzbl (%rax),%eax
6d24   945564:	83 e0 0f             	and    $0xf,%eax
6d27   945567:	8b 7c 24 04          	mov    0x4(%rsp),%edi
6d2b   94556b:	48 85 c0             	test   %rax,%rax
6d2e   94556e:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
6d33   945573:	74 02                	je     945577 <___bpf_prog_run+0x6d37>
6d35   945575:	8b 3a                	mov    (%rdx),%edi
6d37   945577:	83 e3 0f             	and    $0xf,%ebx
6d3a   94557a:	48 09 c8             	or     %rcx,%rax
6d3d   94557d:	0f 85 ca 32 00 00    	jne    94884d <___bpf_prog_run+0xa00d>
6d43   945583:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
6d48   945588:	48 8d 1c d8          	lea    (%rax,%rbx,8),%rbx
6d4c   94558c:	48 89 df             	mov    %rbx,%rdi
6d4f   94558f:	e8 00 00 00 00       	call   945594 <___bpf_prog_run+0x6d54>	945590: R_X86_64_PLT32	__msan_metadata_ptr_for_store_8-0x4
6d54   945594:	4c 89 38             	mov    %r15,(%rax)
6d57   945597:	4d 85 ff             	test   %r15,%r15
6d5a   94559a:	0f 85 b7 32 00 00    	jne    948857 <___bpf_prog_run+0xa017>
6d60   9455a0:	4c 89 23             	mov    %r12,(%rbx)
6d63   9455a3:	e9 4e 93 ff ff       	jmp    93e8f6 <___bpf_prog_run+0xb6>
6d68   9455a8:	44 89 f8             	mov    %r15d,%eax
6d6b   9455ab:	31 d2                	xor    %edx,%edx
6d6d   9455ad:	f7 f5                	div    %ebp
6d6f   9455af:	41 89 d7             	mov    %edx,%r15d
6d72   9455b2:	48 83 7c 24 20 00    	cmpq   $0x0,0x20(%rsp)
6d78   9455b8:	0f 84 20 ed ff ff    	je     9442de <___bpf_prog_run+0x5a9e>
6d7e   9455be:	8b 7c 24 04          	mov    0x4(%rsp),%edi
6d82   9455c2:	e8 00 00 00 00       	call   9455c7 <___bpf_prog_run+0x6d87>	9455c3: R_X86_64_PLT32	__msan_warning-0x4
6d87   9455c7:	e9 12 ed ff ff       	jmp    9442de <___bpf_prog_run+0x5a9e>
6d8c   9455cc:	e8 00 00 00 00       	call   9455d1 <___bpf_prog_run+0x6d91>	9455cd: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
6d91   9455d1:	49 83 c5 08          	add    $0x8,%r13
6d95   9455d5:	e9 25 93 ff ff       	jmp    93e8ff <___bpf_prog_run+0xbf>
6d9a   9455da:	e8 00 00 00 00       	call   9455df <___bpf_prog_run+0x6d9f>	9455db: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
6d9f   9455df:	49 8d 5d 01          	lea    0x1(%r13),%rbx
6da3   9455e3:	4d 85 f6             	test   %r14,%r14
6da6   9455e6:	0f 85 e9 39 00 00    	jne    948fd5 <___bpf_prog_run+0xa795>
6dac   9455ec:	44 0f b6 33          	movzbl (%rbx),%r14d
6db0   9455f0:	48 89 df             	mov    %rbx,%rdi
6db3   9455f3:	e8 00 00 00 00       	call   9455f8 <___bpf_prog_run+0x6db8>	9455f4: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
6db8   9455f8:	0f b6 28             	movzbl (%rax),%ebp
6dbb   9455fb:	83 e5 0f             	and    $0xf,%ebp
6dbe   9455fe:	44 8b 7c 24 04       	mov    0x4(%rsp),%r15d
6dc3   945603:	48 85 ed             	test   %rbp,%rbp
6dc6   945606:	74 03                	je     94560b <___bpf_prog_run+0x6dcb>
6dc8   945608:	44 8b 3a             	mov    (%rdx),%r15d
6dcb   94560b:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
6dd0   945610:	41 83 e6 0f          	and    $0xf,%r14d
6dd4   945614:	48 0b 6c 24 20       	or     0x20(%rsp),%rbp
6dd9   945619:	0f 85 c3 39 00 00    	jne    948fe2 <___bpf_prog_run+0xa7a2>
6ddf   94561f:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
6de4   945624:	4e 8d 2c f0          	lea    (%rax,%r14,8),%r13
6de8   945628:	45 8b 65 00          	mov    0x0(%r13),%r12d
6dec   94562c:	4c 89 ef             	mov    %r13,%rdi
6def   94562f:	e8 00 00 00 00       	call   945634 <___bpf_prog_run+0x6df4>	945630: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
6df4   945634:	8b 18                	mov    (%rax),%ebx
6df6   945636:	44 8b 32             	mov    (%rdx),%r14d
6df9   945639:	48 85 ed             	test   %rbp,%rbp
6dfc   94563c:	0f 85 ad 39 00 00    	jne    948fef <___bpf_prog_run+0xa7af>
6e02   945642:	0f cb                	bswap  %ebx
6e04   945644:	4c 89 ef             	mov    %r13,%rdi
6e07   945647:	e8 00 00 00 00       	call   94564c <___bpf_prog_run+0x6e0c>	945648: R_X86_64_PLT32	__msan_metadata_ptr_for_store_8-0x4
6e0c   94564c:	48 89 18             	mov    %rbx,(%rax)
6e0f   94564f:	48 85 db             	test   %rbx,%rbx
6e12   945652:	0f 85 a4 39 00 00    	jne    948ffc <___bpf_prog_run+0xa7bc>
6e18   945658:	41 0f cc             	bswap  %r12d
6e1b   94565b:	e9 8d 92 ff ff       	jmp    93e8ed <___bpf_prog_run+0xad>
6e20   945660:	e8 00 00 00 00       	call   945665 <___bpf_prog_run+0x6e25>	945661: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
6e25   945665:	49 83 c5 08          	add    $0x8,%r13
6e29   945669:	e9 91 92 ff ff       	jmp    93e8ff <___bpf_prog_run+0xbf>
6e2e   94566e:	45 85 f6             	test   %r14d,%r14d
6e31   945671:	0f 85 0f 03 00 00    	jne    945986 <___bpf_prog_run+0x7146>
6e37   945677:	41 80 e7 18          	and    $0x18,%r15b
6e3b   94567b:	89 e8                	mov    %ebp,%eax
6e3d   94567d:	f6 d0                	not    %al
6e3f   94567f:	44 84 f8             	test   %r15b,%al
6e42   945682:	41 0f 94 c6          	sete   %r14b
6e46   945686:	40 f6 c5 18          	test   $0x18,%bpl
6e4a   94568a:	4c 89 e8             	mov    %r13,%rax
6e4d   94568d:	41 0f 95 c5          	setne  %r13b
6e51   945691:	48 8d 58 01          	lea    0x1(%rax),%rbx
6e55   945695:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
6e5b   94569b:	0f 85 29 3a 00 00    	jne    9490ca <___bpf_prog_run+0xa88a>
6e61   9456a1:	45 20 f5             	and    %r14b,%r13b
6e64   9456a4:	44 0f b6 33          	movzbl (%rbx),%r14d
6e68   9456a8:	48 89 df             	mov    %rbx,%rdi
6e6b   9456ab:	e8 00 00 00 00       	call   9456b0 <___bpf_prog_run+0x6e70>	9456ac: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
6e70   9456b0:	0f b6 18             	movzbl (%rax),%ebx
6e73   9456b3:	8b 2a                	mov    (%rdx),%ebp
6e75   9456b5:	48 89 d8             	mov    %rbx,%rax
6e78   9456b8:	48 c1 e8 04          	shr    $0x4,%rax
6e7c   9456bc:	4c 89 74 24 38       	mov    %r14,0x38(%rsp)
6e81   9456c1:	49 c1 ee 04          	shr    $0x4,%r14
6e85   9456c5:	48 85 c0             	test   %rax,%rax
6e88   9456c8:	8b 7c 24 04          	mov    0x4(%rsp),%edi
6e8c   9456cc:	0f 45 fd             	cmovne %ebp,%edi
6e8f   9456cf:	48 0b 44 24 20       	or     0x20(%rsp),%rax
6e94   9456d4:	0f 85 fd 39 00 00    	jne    9490d7 <___bpf_prog_run+0xa897>
6e9a   9456da:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
6e9f   9456df:	4a 8d 3c f0          	lea    (%rax,%r14,8),%rdi
6ea3   9456e3:	4c 8b 37             	mov    (%rdi),%r14
6ea6   9456e6:	e8 00 00 00 00       	call   9456eb <___bpf_prog_run+0x6eab>	9456e7: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
6eab   9456eb:	48 8b 00             	mov    (%rax),%rax
6eae   9456ee:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
6eb3   9456f3:	8b 02                	mov    (%rdx),%eax
6eb5   9456f5:	89 44 24 40          	mov    %eax,0x40(%rsp)
6eb9   9456f9:	45 84 ed             	test   %r13b,%r13b
6ebc   9456fc:	0f 85 df 39 00 00    	jne    9490e1 <___bpf_prog_run+0xa8a1>
6ec2   945702:	45 84 ff             	test   %r15b,%r15b
6ec5   945705:	4c 8b 7c 24 20       	mov    0x20(%rsp),%r15
6eca   94570a:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
6ecf   94570f:	4c 89 74 24 18       	mov    %r14,0x18(%rsp)
6ed4   945714:	0f 84 58 0f 00 00    	je     946672 <___bpf_prog_run+0x7e32>
6eda   94571a:	e8 00 00 00 00       	call   94571f <___bpf_prog_run+0x6edf>	94571b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
6edf   94571f:	89 d8                	mov    %ebx,%eax
6ee1   945721:	83 e0 0f             	and    $0xf,%eax
6ee4   945724:	89 ef                	mov    %ebp,%edi
6ee6   945726:	48 8b 6c 24 38       	mov    0x38(%rsp),%rbp
6eeb   94572b:	83 e5 0f             	and    $0xf,%ebp
6eee   94572e:	f6 c3 0f             	test   $0xf,%bl
6ef1   945731:	0f 44 7c 24 04       	cmove  0x4(%rsp),%edi
6ef6   945736:	4c 09 f8             	or     %r15,%rax
6ef9   945739:	48 8b 5c 24 30       	mov    0x30(%rsp),%rbx
6efe   94573e:	0f 85 61 3c 00 00    	jne    9493a5 <___bpf_prog_run+0xab65>
6f04   945744:	48 8d 3c eb          	lea    (%rbx,%rbp,8),%rdi
6f08   945748:	4c 8b 37             	mov    (%rdi),%r14
6f0b   94574b:	e8 00 00 00 00       	call   945750 <___bpf_prog_run+0x6f10>	94574c: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
6f10   945750:	49 8d 5d 02          	lea    0x2(%r13),%rbx
6f14   945754:	48 8b 28             	mov    (%rax),%rbp
6f17   945757:	44 8b 3a             	mov    (%rdx),%r15d
6f1a   94575a:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
6f20   945760:	0f 85 49 3c 00 00    	jne    9493af <___bpf_prog_run+0xab6f>
6f26   945766:	4c 0f bf 23          	movswq (%rbx),%r12
6f2a   94576a:	48 89 df             	mov    %rbx,%rdi
6f2d   94576d:	e8 00 00 00 00       	call   945772 <___bpf_prog_run+0x6f32>	94576e: R_X86_64_PLT32	__msan_metadata_ptr_for_load_2-0x4
6f32   945772:	48 0f bf 00          	movswq (%rax),%rax
6f36   945776:	48 85 c0             	test   %rax,%rax
6f39   945779:	74 03                	je     94577e <___bpf_prog_run+0x6f3e>
6f3b   94577b:	44 8b 3a             	mov    (%rdx),%r15d
6f3e   94577e:	48 09 c5             	or     %rax,%rbp
6f41   945781:	4d 01 e6             	add    %r12,%r14
6f44   945784:	be 08 00 00 00       	mov    $0x8,%esi
6f49   945789:	4c 89 f7             	mov    %r14,%rdi
6f4c   94578c:	e8 00 00 00 00       	call   945791 <___bpf_prog_run+0x6f51>	94578d: R_X86_64_PLT32	__msan_instrument_asm_store-0x4
6f51   945791:	48 83 7c 24 08 00    	cmpq   $0x0,0x8(%rsp)
6f57   945797:	0f 85 1f 3c 00 00    	jne    9493bc <___bpf_prog_run+0xab7c>
6f5d   94579d:	48 85 ed             	test   %rbp,%rbp
6f60   9457a0:	0f 85 28 3c 00 00    	jne    9493ce <___bpf_prog_run+0xab8e>
6f66   9457a6:	48 85 ed             	test   %rbp,%rbp
6f69   9457a9:	0f 85 30 3c 00 00    	jne    9493df <___bpf_prog_run+0xab9f>
6f6f   9457af:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
6f74   9457b4:	f0 49 01 06          	lock add %rax,(%r14)
6f78   9457b8:	e9 39 91 ff ff       	jmp    93e8f6 <___bpf_prog_run+0xb6>
6f7d   9457bd:	41 81 fe e1 00 00 00 	cmp    $0xe1,%r14d
6f84   9457c4:	0f 85 a7 0b 00 00    	jne    946371 <___bpf_prog_run+0x7b31>
6f8a   9457ca:	41 80 e7 18          	and    $0x18,%r15b
6f8e   9457ce:	89 e8                	mov    %ebp,%eax
6f90   9457d0:	f6 d0                	not    %al
6f92   9457d2:	44 84 f8             	test   %r15b,%al
6f95   9457d5:	0f 94 44 24 58       	sete   0x58(%rsp)
6f9a   9457da:	40 f6 c5 18          	test   $0x18,%bpl
6f9e   9457de:	0f 95 c3             	setne  %bl
6fa1   9457e1:	49 8d 6d 01          	lea    0x1(%r13),%rbp
6fa5   9457e5:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
6fab   9457eb:	0f 85 fd 38 00 00    	jne    9490ee <___bpf_prog_run+0xa8ae>
6fb1   9457f1:	44 0f b6 6d 00       	movzbl 0x0(%rbp),%r13d
6fb6   9457f6:	48 89 6c 24 18       	mov    %rbp,0x18(%rsp)
6fbb   9457fb:	48 89 ef             	mov    %rbp,%rdi
6fbe   9457fe:	e8 00 00 00 00       	call   945803 <___bpf_prog_run+0x6fc3>	9457ff: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
6fc3   945803:	44 0f b6 30          	movzbl (%rax),%r14d
6fc7   945807:	8b 0a                	mov    (%rdx),%ecx
6fc9   945809:	44 89 f0             	mov    %r14d,%eax
6fcc   94580c:	83 e0 0f             	and    $0xf,%eax
6fcf   94580f:	4c 89 6c 24 08       	mov    %r13,0x8(%rsp)
6fd4   945814:	44 89 ed             	mov    %r13d,%ebp
6fd7   945817:	83 e5 0f             	and    $0xf,%ebp
6fda   94581a:	48 85 c0             	test   %rax,%rax
6fdd   94581d:	8b 7c 24 04          	mov    0x4(%rsp),%edi
6fe1   945821:	89 4c 24 38          	mov    %ecx,0x38(%rsp)
6fe5   945825:	0f 45 f9             	cmovne %ecx,%edi
6fe8   945828:	48 0b 44 24 20       	or     0x20(%rsp),%rax
6fed   94582d:	0f 85 c8 38 00 00    	jne    9490fb <___bpf_prog_run+0xa8bb>
6ff3   945833:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
6ff8   945838:	48 8d 3c e8          	lea    (%rax,%rbp,8),%rdi
6ffc   94583c:	48 8b 07             	mov    (%rdi),%rax
6fff   94583f:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
7004   945844:	e8 00 00 00 00       	call   945849 <___bpf_prog_run+0x7009>	945845: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
7009   945849:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
700e   94584e:	48 8d 69 02          	lea    0x2(%rcx),%rbp
7012   945852:	48 8b 00             	mov    (%rax),%rax
7015   945855:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
701a   94585a:	8b 02                	mov    (%rdx),%eax
701c   94585c:	89 44 24 4c          	mov    %eax,0x4c(%rsp)
7020   945860:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
7026   945866:	0f 85 99 38 00 00    	jne    949105 <___bpf_prog_run+0xa8c5>
702c   94586c:	22 5c 24 58          	and    0x58(%rsp),%bl
7030   945870:	4c 0f bf 6d 00       	movswq 0x0(%rbp),%r13
7035   945875:	48 89 ef             	mov    %rbp,%rdi
7038   945878:	e8 00 00 00 00       	call   94587d <___bpf_prog_run+0x703d>	945879: R_X86_64_PLT32	__msan_metadata_ptr_for_load_2-0x4
703d   94587d:	48 0f bf 28          	movswq (%rax),%rbp
7041   945881:	48 85 ed             	test   %rbp,%rbp
7044   945884:	74 06                	je     94588c <___bpf_prog_run+0x704c>
7046   945886:	8b 02                	mov    (%rdx),%eax
7048   945888:	89 44 24 4c          	mov    %eax,0x4c(%rsp)
704c   94588c:	84 db                	test   %bl,%bl
704e   94588e:	0f 85 7e 38 00 00    	jne    949112 <___bpf_prog_run+0xa8d2>
7054   945894:	48 8b 4c 24 50       	mov    0x50(%rsp),%rcx
7059   945899:	48 09 e9             	or     %rbp,%rcx
705c   94589c:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
7061   9458a1:	4c 01 e8             	add    %r13,%rax
7064   9458a4:	49 89 c5             	mov    %rax,%r13
7067   9458a7:	45 84 ff             	test   %r15b,%r15b
706a   9458aa:	0f 84 a3 11 00 00    	je     946a53 <___bpf_prog_run+0x8213>
7070   9458b0:	49 89 cf             	mov    %rcx,%r15
7073   9458b3:	e8 00 00 00 00       	call   9458b8 <___bpf_prog_run+0x7078>	9458b4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7078   9458b8:	41 c0 ee 04          	shr    $0x4,%r14b
707c   9458bc:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
7081   9458c1:	c0 eb 04             	shr    $0x4,%bl
7084   9458c4:	41 0f b6 c6          	movzbl %r14b,%eax
7088   9458c8:	84 c0                	test   %al,%al
708a   9458ca:	8b 7c 24 38          	mov    0x38(%rsp),%edi
708e   9458ce:	0f 44 7c 24 04       	cmove  0x4(%rsp),%edi
7093   9458d3:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
7098   9458d8:	48 09 c1             	or     %rax,%rcx
709b   9458db:	48 8b 6c 24 30       	mov    0x30(%rsp),%rbp
70a0   9458e0:	0f 85 06 3b 00 00    	jne    9493ec <___bpf_prog_run+0xabac>
70a6   9458e6:	0f b6 c3             	movzbl %bl,%eax
70a9   9458e9:	48 8d 3c c5 00 00 00 00 	lea    0x0(,%rax,8),%rdi
70b1   9458f1:	48 01 ef             	add    %rbp,%rdi
70b4   9458f4:	4c 8b 27             	mov    (%rdi),%r12
70b7   9458f7:	e8 00 00 00 00       	call   9458fc <___bpf_prog_run+0x70bc>	9458f8: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
70bc   9458fc:	44 8b 32             	mov    (%rdx),%r14d
70bf   9458ff:	48 8b 18             	mov    (%rax),%rbx
70c2   945902:	be 08 00 00 00       	mov    $0x8,%esi
70c7   945907:	4c 89 ef             	mov    %r13,%rdi
70ca   94590a:	e8 00 00 00 00       	call   94590f <___bpf_prog_run+0x70cf>	94590b: R_X86_64_PLT32	__msan_instrument_asm_store-0x4
70cf   94590f:	48 85 db             	test   %rbx,%rbx
70d2   945912:	0f 85 de 3a 00 00    	jne    9493f6 <___bpf_prog_run+0xabb6>
70d8   945918:	4d 85 ff             	test   %r15,%r15
70db   94591b:	0f 85 e6 3a 00 00    	jne    949407 <___bpf_prog_run+0xabc7>
70e1   945921:	4d 85 ff             	test   %r15,%r15
70e4   945924:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
70e9   945929:	0f 85 e6 3a 00 00    	jne    949415 <___bpf_prog_run+0xabd5>
70ef   94592f:	4d 87 65 00          	xchg   %r12,0x0(%r13)
70f3   945933:	4d 85 f6             	test   %r14,%r14
70f6   945936:	0f 85 e7 3a 00 00    	jne    949423 <___bpf_prog_run+0xabe3>
70fc   94593c:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
7101   945941:	0f b6 1f             	movzbl (%rdi),%ebx
7104   945944:	e8 00 00 00 00       	call   945949 <___bpf_prog_run+0x7109>	945945: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
7109   945949:	0f b6 00             	movzbl (%rax),%eax
710c   94594c:	48 c1 e8 04          	shr    $0x4,%rax
7110   945950:	48 d1 eb             	shr    %rbx
7113   945953:	83 e3 78             	and    $0x78,%ebx
7116   945956:	8b 7c 24 04          	mov    0x4(%rsp),%edi
711a   94595a:	48 85 c0             	test   %rax,%rax
711d   94595d:	74 02                	je     945961 <___bpf_prog_run+0x7121>
711f   94595f:	8b 3a                	mov    (%rdx),%edi
7121   945961:	48 01 eb             	add    %rbp,%rbx
7124   945964:	48 0b 44 24 20       	or     0x20(%rsp),%rax
7129   945969:	0f 85 c1 3a 00 00    	jne    949430 <___bpf_prog_run+0xabf0>
712f   94596f:	48 89 df             	mov    %rbx,%rdi
7132   945972:	e8 00 00 00 00       	call   945977 <___bpf_prog_run+0x7137>	945973: R_X86_64_PLT32	__msan_metadata_ptr_for_store_8-0x4
7137   945977:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
713e   94597e:	4c 89 23             	mov    %r12,(%rbx)
7141   945981:	e9 92 e3 ff ff       	jmp    943d18 <___bpf_prog_run+0x54d8>
7146   945986:	41 83 fe 01          	cmp    $0x1,%r14d
714a   94598a:	0f 85 ba 41 00 00    	jne    949b4a <___bpf_prog_run+0xb30a>
7150   945990:	41 80 e7 18          	and    $0x18,%r15b
7154   945994:	89 e8                	mov    %ebp,%eax
7156   945996:	f6 d0                	not    %al
7158   945998:	44 84 f8             	test   %r15b,%al
715b   94599b:	41 0f 94 c6          	sete   %r14b
715f   94599f:	40 f6 c5 18          	test   $0x18,%bpl
7163   9459a3:	0f 95 c3             	setne  %bl
7166   9459a6:	49 8d 6d 01          	lea    0x1(%r13),%rbp
716a   9459aa:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
7170   9459b0:	0f 85 69 37 00 00    	jne    94911f <___bpf_prog_run+0xa8df>
7176   9459b6:	44 20 f3             	and    %r14b,%bl
7179   9459b9:	44 0f b6 6d 00       	movzbl 0x0(%rbp),%r13d
717e   9459be:	48 89 6c 24 08       	mov    %rbp,0x8(%rsp)
7183   9459c3:	48 89 ef             	mov    %rbp,%rdi
7186   9459c6:	e8 00 00 00 00       	call   9459cb <___bpf_prog_run+0x718b>	9459c7: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
718b   9459cb:	44 0f b6 30          	movzbl (%rax),%r14d
718f   9459cf:	8b 0a                	mov    (%rdx),%ecx
7191   9459d1:	4c 89 f0             	mov    %r14,%rax
7194   9459d4:	48 c1 e8 04          	shr    $0x4,%rax
7198   9459d8:	4c 89 ed             	mov    %r13,%rbp
719b   9459db:	48 c1 ed 04          	shr    $0x4,%rbp
719f   9459df:	48 85 c0             	test   %rax,%rax
71a2   9459e2:	8b 7c 24 04          	mov    0x4(%rsp),%edi
71a6   9459e6:	89 4c 24 40          	mov    %ecx,0x40(%rsp)
71aa   9459ea:	0f 45 f9             	cmovne %ecx,%edi
71ad   9459ed:	48 0b 44 24 20       	or     0x20(%rsp),%rax
71b2   9459f2:	0f 85 34 37 00 00    	jne    94912c <___bpf_prog_run+0xa8ec>
71b8   9459f8:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
71bd   9459fd:	48 8d 3c e8          	lea    (%rax,%rbp,8),%rdi
71c1   945a01:	48 8b 07             	mov    (%rdi),%rax
71c4   945a04:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
71c9   945a09:	e8 00 00 00 00       	call   945a0e <___bpf_prog_run+0x71ce>	945a0a: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
71ce   945a0e:	48 8b 00             	mov    (%rax),%rax
71d1   945a11:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
71d6   945a16:	8b 02                	mov    (%rdx),%eax
71d8   945a18:	89 44 24 50          	mov    %eax,0x50(%rsp)
71dc   945a1c:	84 db                	test   %bl,%bl
71de   945a1e:	0f 85 12 37 00 00    	jne    949136 <___bpf_prog_run+0xa8f6>
71e4   945a24:	45 84 ff             	test   %r15b,%r15b
71e7   945a27:	0f 84 1a 37 00 00    	je     949147 <___bpf_prog_run+0xa907>
71ed   945a2d:	e8 00 00 00 00       	call   945a32 <___bpf_prog_run+0x71f2>	945a2e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
71f2   945a32:	44 89 f0             	mov    %r14d,%eax
71f5   945a35:	83 e0 0f             	and    $0xf,%eax
71f8   945a38:	41 83 e5 0f          	and    $0xf,%r13d
71fc   945a3c:	41 f6 c6 0f          	test   $0xf,%r14b
7200   945a40:	8b 7c 24 40          	mov    0x40(%rsp),%edi
7204   945a44:	0f 44 7c 24 04       	cmove  0x4(%rsp),%edi
7209   945a49:	48 0b 44 24 20       	or     0x20(%rsp),%rax
720e   945a4e:	0f 85 e6 39 00 00    	jne    94943a <___bpf_prog_run+0xabfa>
7214   945a54:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
7219   945a59:	4a 8d 3c e8          	lea    (%rax,%r13,8),%rdi
721d   945a5d:	4c 8b 37             	mov    (%rdi),%r14
7220   945a60:	e8 00 00 00 00       	call   945a65 <___bpf_prog_run+0x7225>	945a61: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
7225   945a65:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
722a   945a6a:	49 8d 6d 02          	lea    0x2(%r13),%rbp
722e   945a6e:	48 8b 18             	mov    (%rax),%rbx
7231   945a71:	44 8b 3a             	mov    (%rdx),%r15d
7234   945a74:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
723a   945a7a:	0f 85 c4 39 00 00    	jne    949444 <___bpf_prog_run+0xac04>
7240   945a80:	4c 0f bf 65 00       	movswq 0x0(%rbp),%r12
7245   945a85:	48 89 ef             	mov    %rbp,%rdi
7248   945a88:	e8 00 00 00 00       	call   945a8d <___bpf_prog_run+0x724d>	945a89: R_X86_64_PLT32	__msan_metadata_ptr_for_load_2-0x4
724d   945a8d:	48 0f bf 00          	movswq (%rax),%rax
7251   945a91:	48 85 c0             	test   %rax,%rax
7254   945a94:	74 03                	je     945a99 <___bpf_prog_run+0x7259>
7256   945a96:	44 8b 3a             	mov    (%rdx),%r15d
7259   945a99:	48 09 c3             	or     %rax,%rbx
725c   945a9c:	4d 01 e6             	add    %r12,%r14
725f   945a9f:	be 08 00 00 00       	mov    $0x8,%esi
7264   945aa4:	4c 89 f7             	mov    %r14,%rdi
7267   945aa7:	e8 00 00 00 00       	call   945aac <___bpf_prog_run+0x726c>	945aa8: R_X86_64_PLT32	__msan_instrument_asm_store-0x4
726c   945aac:	48 83 7c 24 38 00    	cmpq   $0x0,0x38(%rsp)
7272   945ab2:	0f 85 99 39 00 00    	jne    949451 <___bpf_prog_run+0xac11>
7278   945ab8:	48 85 db             	test   %rbx,%rbx
727b   945abb:	0f 85 a2 39 00 00    	jne    949463 <___bpf_prog_run+0xac23>
7281   945ac1:	48 85 db             	test   %rbx,%rbx
7284   945ac4:	0f 85 aa 39 00 00    	jne    949474 <___bpf_prog_run+0xac34>
728a   945aca:	48 8b 6c 24 18       	mov    0x18(%rsp),%rbp
728f   945acf:	f0 49 0f c1 2e       	lock xadd %rbp,(%r14)
7294   945ad4:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
7299   945ad9:	4d 85 f6             	test   %r14,%r14
729c   945adc:	0f 85 9f 39 00 00    	jne    949481 <___bpf_prog_run+0xac41>
72a2   945ae2:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
72a7   945ae7:	0f b6 1f             	movzbl (%rdi),%ebx
72aa   945aea:	e8 00 00 00 00       	call   945aef <___bpf_prog_run+0x72af>	945aeb: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
72af   945aef:	0f b6 00             	movzbl (%rax),%eax
72b2   945af2:	48 c1 e8 04          	shr    $0x4,%rax
72b6   945af6:	48 d1 eb             	shr    %rbx
72b9   945af9:	83 e3 78             	and    $0x78,%ebx
72bc   945afc:	8b 7c 24 04          	mov    0x4(%rsp),%edi
72c0   945b00:	48 85 c0             	test   %rax,%rax
72c3   945b03:	74 02                	je     945b07 <___bpf_prog_run+0x72c7>
72c5   945b05:	8b 3a                	mov    (%rdx),%edi
72c7   945b07:	48 03 5c 24 30       	add    0x30(%rsp),%rbx
72cc   945b0c:	48 0b 44 24 20       	or     0x20(%rsp),%rax
72d1   945b11:	0f 84 18 37 00 00    	je     94922f <___bpf_prog_run+0xa9ef>
72d7   945b17:	e8 00 00 00 00       	call   945b1c <___bpf_prog_run+0x72dc>	945b18: R_X86_64_PLT32	__msan_warning-0x4
72dc   945b1c:	e9 0e 37 00 00       	jmp    94922f <___bpf_prog_run+0xa9ef>
72e1   945b21:	41 80 e7 18          	and    $0x18,%r15b
72e5   945b25:	89 e8                	mov    %ebp,%eax
72e7   945b27:	f6 d0                	not    %al
72e9   945b29:	44 84 f8             	test   %r15b,%al
72ec   945b2c:	0f 94 c3             	sete   %bl
72ef   945b2f:	40 f6 c5 18          	test   $0x18,%bpl
72f3   945b33:	4c 89 e8             	mov    %r13,%rax
72f6   945b36:	41 0f 95 c5          	setne  %r13b
72fa   945b3a:	48 8d 78 01          	lea    0x1(%rax),%rdi
72fe   945b3e:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
7304   945b44:	0f 85 00 37 00 00    	jne    94924a <___bpf_prog_run+0xaa0a>
730a   945b4a:	41 20 dd             	and    %bl,%r13b
730d   945b4d:	44 0f b6 37          	movzbl (%rdi),%r14d
7311   945b51:	48 89 7c 24 58       	mov    %rdi,0x58(%rsp)
7316   945b56:	e8 00 00 00 00       	call   945b5b <___bpf_prog_run+0x731b>	945b57: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
731b   945b5b:	0f b6 18             	movzbl (%rax),%ebx
731e   945b5e:	8b 0a                	mov    (%rdx),%ecx
7320   945b60:	48 89 d8             	mov    %rbx,%rax
7323   945b63:	48 c1 e8 04          	shr    $0x4,%rax
7327   945b67:	4c 89 f5             	mov    %r14,%rbp
732a   945b6a:	48 c1 ed 04          	shr    $0x4,%rbp
732e   945b6e:	48 85 c0             	test   %rax,%rax
7331   945b71:	8b 7c 24 04          	mov    0x4(%rsp),%edi
7335   945b75:	89 4c 24 08          	mov    %ecx,0x8(%rsp)
7339   945b79:	0f 45 f9             	cmovne %ecx,%edi
733c   945b7c:	48 0b 44 24 20       	or     0x20(%rsp),%rax
7341   945b81:	0f 85 d6 36 00 00    	jne    94925d <___bpf_prog_run+0xaa1d>
7347   945b87:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
734c   945b8c:	48 8d 3c e8          	lea    (%rax,%rbp,8),%rdi
7350   945b90:	48 8b 07             	mov    (%rdi),%rax
7353   945b93:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
7358   945b98:	e8 00 00 00 00       	call   945b9d <___bpf_prog_run+0x735d>	945b99: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
735d   945b9d:	48 8b 00             	mov    (%rax),%rax
7360   945ba0:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
7365   945ba5:	8b 02                	mov    (%rdx),%eax
7367   945ba7:	89 44 24 40          	mov    %eax,0x40(%rsp)
736b   945bab:	45 84 ed             	test   %r13b,%r13b
736e   945bae:	0f 85 b3 36 00 00    	jne    949267 <___bpf_prog_run+0xaa27>
7374   945bb4:	45 84 ff             	test   %r15b,%r15b
7377   945bb7:	8b 4c 24 04          	mov    0x4(%rsp),%ecx
737b   945bbb:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
7380   945bc0:	4c 8b 7c 24 28       	mov    0x28(%rsp),%r15
7385   945bc5:	0f 84 46 0b 00 00    	je     946711 <___bpf_prog_run+0x7ed1>
738b   945bcb:	89 d8                	mov    %ebx,%eax
738d   945bcd:	83 e0 0f             	and    $0xf,%eax
7390   945bd0:	41 83 e6 0f          	and    $0xf,%r14d
7394   945bd4:	f6 c3 0f             	test   $0xf,%bl
7397   945bd7:	8b 7c 24 08          	mov    0x8(%rsp),%edi
739b   945bdb:	0f 44 f9             	cmove  %ecx,%edi
739e   945bde:	48 09 d0             	or     %rdx,%rax
73a1   945be1:	48 8b 5c 24 30       	mov    0x30(%rsp),%rbx
73a6   945be6:	0f 85 a2 38 00 00    	jne    94948e <___bpf_prog_run+0xac4e>
73ac   945bec:	4a 8d 3c f3          	lea    (%rbx,%r14,8),%rdi
73b0   945bf0:	48 8b 2f             	mov    (%rdi),%rbp
73b3   945bf3:	e8 00 00 00 00       	call   945bf8 <___bpf_prog_run+0x73b8>	945bf4: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
73b8   945bf8:	49 8d 5f 02          	lea    0x2(%r15),%rbx
73bc   945bfc:	48 8b 00             	mov    (%rax),%rax
73bf   945bff:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
73c4   945c04:	44 8b 3a             	mov    (%rdx),%r15d
73c7   945c07:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
73cd   945c0d:	0f 85 85 38 00 00    	jne    949498 <___bpf_prog_run+0xac58>
73d3   945c13:	4c 0f bf 33          	movswq (%rbx),%r14
73d7   945c17:	48 89 df             	mov    %rbx,%rdi
73da   945c1a:	e8 00 00 00 00       	call   945c1f <___bpf_prog_run+0x73df>	945c1b: R_X86_64_PLT32	__msan_metadata_ptr_for_load_2-0x4
73df   945c1f:	48 0f bf 00          	movswq (%rax),%rax
73e3   945c23:	48 85 c0             	test   %rax,%rax
73e6   945c26:	74 03                	je     945c2b <___bpf_prog_run+0x73eb>
73e8   945c28:	44 8b 3a             	mov    (%rdx),%r15d
73eb   945c2b:	4c 01 f5             	add    %r14,%rbp
73ee   945c2e:	48 09 44 24 08       	or     %rax,0x8(%rsp)
73f3   945c33:	0f 85 6c 38 00 00    	jne    9494a5 <___bpf_prog_run+0xac65>
73f9   945c39:	44 89 7c 24 4c       	mov    %r15d,0x4c(%rsp)
73fe   945c3e:	4c 8b 65 00          	mov    0x0(%rbp),%r12
7402   945c42:	49 89 ef             	mov    %rbp,%r15
7405   945c45:	48 89 ef             	mov    %rbp,%rdi
7408   945c48:	e8 00 00 00 00       	call   945c4d <___bpf_prog_run+0x740d>	945c49: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
740d   945c4d:	4c 8b 30             	mov    (%rax),%r14
7410   945c50:	8b 02                	mov    (%rdx),%eax
7412   945c52:	89 44 24 50          	mov    %eax,0x50(%rsp)
7416   945c56:	4c 89 f5             	mov    %r14,%rbp
7419   945c59:	48 23 6c 24 18       	and    0x18(%rsp),%rbp
741e   945c5e:	4c 89 f3             	mov    %r14,%rbx
7421   945c61:	4c 09 e3             	or     %r12,%rbx
7424   945c64:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
7429   945c69:	48 21 c3             	and    %rax,%rbx
742c   945c6c:	48 85 c0             	test   %rax,%rax
742f   945c6f:	44 8b 6c 24 50       	mov    0x50(%rsp),%r13d
7434   945c74:	44 0f 45 6c 24 40    	cmovne 0x40(%rsp),%r13d
743a   945c7a:	be 08 00 00 00       	mov    $0x8,%esi
743f   945c7f:	4c 89 ff             	mov    %r15,%rdi
7442   945c82:	e8 00 00 00 00       	call   945c87 <___bpf_prog_run+0x7447>	945c83: R_X86_64_PLT32	__msan_instrument_asm_store-0x4
7447   945c87:	48 09 eb             	or     %rbp,%rbx
744a   945c8a:	75 62                	jne    945cee <___bpf_prog_run+0x74ae>
744c   945c8c:	48 83 7c 24 08 00    	cmpq   $0x0,0x8(%rsp)
7452   945c92:	75 6a                	jne    945cfe <___bpf_prog_run+0x74be>
7454   945c94:	4d 85 f6             	test   %r14,%r14
7457   945c97:	4c 8b 6c 24 30       	mov    0x30(%rsp),%r13
745c   945c9c:	75 6b                	jne    945d09 <___bpf_prog_run+0x74c9>
745e   945c9e:	4c 89 e5             	mov    %r12,%rbp
7461   945ca1:	48 23 6c 24 18       	and    0x18(%rsp),%rbp
7466   945ca6:	48 83 7c 24 08 00    	cmpq   $0x0,0x8(%rsp)
746c   945cac:	75 66                	jne    945d14 <___bpf_prog_run+0x74d4>
746e   945cae:	31 db                	xor    %ebx,%ebx
7470   945cb0:	4c 89 e0             	mov    %r12,%rax
7473   945cb3:	f0 49 0f b1 2f       	lock cmpxchg %rbp,(%r15)
7478   945cb8:	48 89 c5             	mov    %rax,%rbp
747b   945cbb:	0f 94 c3             	sete   %bl
747e   945cbe:	80 fb 01             	cmp    $0x1,%bl
7481   945cc1:	77 5c                	ja     945d1f <___bpf_prog_run+0x74df>
7483   945cc3:	e8 00 00 00 00       	call   945cc8 <___bpf_prog_run+0x7488>	945cc4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7488   945cc8:	48 85 db             	test   %rbx,%rbx
748b   945ccb:	74 6b                	je     945d38 <___bpf_prog_run+0x74f8>
748d   945ccd:	e8 00 00 00 00       	call   945cd2 <___bpf_prog_run+0x7492>	945cce: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7492   945cd2:	80 fb 01             	cmp    $0x1,%bl
7495   945cd5:	77 79                	ja     945d50 <___bpf_prog_run+0x7510>
7497   945cd7:	e8 00 00 00 00       	call   945cdc <___bpf_prog_run+0x749c>	945cd8: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
749c   945cdc:	84 db                	test   %bl,%bl
749e   945cde:	0f 85 88 00 00 00    	jne    945d6c <___bpf_prog_run+0x752c>
74a4   945ce4:	e8 00 00 00 00       	call   945ce9 <___bpf_prog_run+0x74a9>	945ce5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
74a9   945ce9:	e9 68 ff ff ff       	jmp    945c56 <___bpf_prog_run+0x7416>
74ae   945cee:	44 89 ef             	mov    %r13d,%edi
74b1   945cf1:	e8 00 00 00 00       	call   945cf6 <___bpf_prog_run+0x74b6>	945cf2: R_X86_64_PLT32	__msan_warning-0x4
74b6   945cf6:	48 83 7c 24 08 00    	cmpq   $0x0,0x8(%rsp)
74bc   945cfc:	74 96                	je     945c94 <___bpf_prog_run+0x7454>
74be   945cfe:	8b 7c 24 4c          	mov    0x4c(%rsp),%edi
74c2   945d02:	e8 00 00 00 00       	call   945d07 <___bpf_prog_run+0x74c7>	945d03: R_X86_64_PLT32	__msan_warning-0x4
74c7   945d07:	eb 8b                	jmp    945c94 <___bpf_prog_run+0x7454>
74c9   945d09:	8b 7c 24 50          	mov    0x50(%rsp),%edi
74cd   945d0d:	e8 00 00 00 00       	call   945d12 <___bpf_prog_run+0x74d2>	945d0e: R_X86_64_PLT32	__msan_warning-0x4
74d2   945d12:	eb 8a                	jmp    945c9e <___bpf_prog_run+0x745e>
74d4   945d14:	8b 7c 24 4c          	mov    0x4c(%rsp),%edi
74d8   945d18:	e8 00 00 00 00       	call   945d1d <___bpf_prog_run+0x74dd>	945d19: R_X86_64_PLT32	__msan_warning-0x4
74dd   945d1d:	eb 8f                	jmp    945cae <___bpf_prog_run+0x746e>
74df   945d1f:	e8 00 00 00 00       	call   945d24 <___bpf_prog_run+0x74e4>	945d20: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
74e4   945d24:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	945d27: R_X86_64_32S	.data+0x137040
74eb   945d2b:	48 89 de             	mov    %rbx,%rsi
74ee   945d2e:	e8 00 00 00 00       	call   945d33 <___bpf_prog_run+0x74f3>	945d2f: R_X86_64_PLT32	__ubsan_handle_load_invalid_value-0x4
74f3   945d33:	48 85 db             	test   %rbx,%rbx
74f6   945d36:	75 95                	jne    945ccd <___bpf_prog_run+0x748d>
74f8   945d38:	e8 00 00 00 00       	call   945d3d <___bpf_prog_run+0x74fd>	945d39: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
74fd   945d3d:	45 31 f6             	xor    %r14d,%r14d
7500   945d40:	c7 44 24 50 00 00 00 00 	movl   $0x0,0x50(%rsp)
7508   945d48:	49 89 ec             	mov    %rbp,%r12
750b   945d4b:	80 fb 01             	cmp    $0x1,%bl
750e   945d4e:	76 87                	jbe    945cd7 <___bpf_prog_run+0x7497>
7510   945d50:	e8 00 00 00 00       	call   945d55 <___bpf_prog_run+0x7515>	945d51: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7515   945d55:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	945d58: R_X86_64_32S	.data+0x137060
751c   945d5c:	48 89 de             	mov    %rbx,%rsi
751f   945d5f:	e8 00 00 00 00       	call   945d64 <___bpf_prog_run+0x7524>	945d60: R_X86_64_PLT32	__ubsan_handle_load_invalid_value-0x4
7524   945d64:	84 db                	test   %bl,%bl
7526   945d66:	0f 84 78 ff ff ff    	je     945ce4 <___bpf_prog_run+0x74a4>
752c   945d6c:	e8 00 00 00 00       	call   945d71 <___bpf_prog_run+0x7531>	945d6d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7531   945d71:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
7537   945d77:	4c 8b 7c 24 28       	mov    0x28(%rsp),%r15
753c   945d7c:	0f 85 30 37 00 00    	jne    9494b2 <___bpf_prog_run+0xac72>
7542   945d82:	48 8b 7c 24 58       	mov    0x58(%rsp),%rdi
7547   945d87:	0f b6 1f             	movzbl (%rdi),%ebx
754a   945d8a:	e8 00 00 00 00       	call   945d8f <___bpf_prog_run+0x754f>	945d8b: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
754f   945d8f:	0f b6 00             	movzbl (%rax),%eax
7552   945d92:	48 c1 e8 04          	shr    $0x4,%rax
7556   945d96:	48 d1 eb             	shr    %rbx
7559   945d99:	83 e3 78             	and    $0x78,%ebx
755c   945d9c:	8b 7c 24 04          	mov    0x4(%rsp),%edi
7560   945da0:	48 85 c0             	test   %rax,%rax
7563   945da3:	74 02                	je     945da7 <___bpf_prog_run+0x7567>
7565   945da5:	8b 3a                	mov    (%rdx),%edi
7567   945da7:	4c 01 eb             	add    %r13,%rbx
756a   945daa:	48 0b 44 24 20       	or     0x20(%rsp),%rax
756f   945daf:	0f 84 a4 02 00 00    	je     946059 <___bpf_prog_run+0x7819>
7575   945db5:	e8 00 00 00 00       	call   945dba <___bpf_prog_run+0x757a>	945db6: R_X86_64_PLT32	__msan_warning-0x4
757a   945dba:	e9 9a 02 00 00       	jmp    946059 <___bpf_prog_run+0x7819>
757f   945dbf:	41 80 e7 18          	and    $0x18,%r15b
7583   945dc3:	89 e8                	mov    %ebp,%eax
7585   945dc5:	f6 d0                	not    %al
7587   945dc7:	44 84 f8             	test   %r15b,%al
758a   945dca:	0f 94 c3             	sete   %bl
758d   945dcd:	40 f6 c5 18          	test   $0x18,%bpl
7591   945dd1:	4c 89 e8             	mov    %r13,%rax
7594   945dd4:	41 0f 95 c5          	setne  %r13b
7598   945dd8:	48 8d 78 01          	lea    0x1(%rax),%rdi
759c   945ddc:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
75a2   945de2:	0f 85 8c 34 00 00    	jne    949274 <___bpf_prog_run+0xaa34>
75a8   945de8:	41 20 dd             	and    %bl,%r13b
75ab   945deb:	44 0f b6 37          	movzbl (%rdi),%r14d
75af   945def:	48 89 7c 24 58       	mov    %rdi,0x58(%rsp)
75b4   945df4:	e8 00 00 00 00       	call   945df9 <___bpf_prog_run+0x75b9>	945df5: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
75b9   945df9:	0f b6 18             	movzbl (%rax),%ebx
75bc   945dfc:	8b 0a                	mov    (%rdx),%ecx
75be   945dfe:	48 89 d8             	mov    %rbx,%rax
75c1   945e01:	48 c1 e8 04          	shr    $0x4,%rax
75c5   945e05:	4c 89 f5             	mov    %r14,%rbp
75c8   945e08:	48 c1 ed 04          	shr    $0x4,%rbp
75cc   945e0c:	48 85 c0             	test   %rax,%rax
75cf   945e0f:	8b 7c 24 04          	mov    0x4(%rsp),%edi
75d3   945e13:	89 4c 24 08          	mov    %ecx,0x8(%rsp)
75d7   945e17:	0f 45 f9             	cmovne %ecx,%edi
75da   945e1a:	48 0b 44 24 20       	or     0x20(%rsp),%rax
75df   945e1f:	0f 85 62 34 00 00    	jne    949287 <___bpf_prog_run+0xaa47>
75e5   945e25:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
75ea   945e2a:	48 8d 3c e8          	lea    (%rax,%rbp,8),%rdi
75ee   945e2e:	48 8b 07             	mov    (%rdi),%rax
75f1   945e31:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
75f6   945e36:	e8 00 00 00 00       	call   945e3b <___bpf_prog_run+0x75fb>	945e37: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
75fb   945e3b:	48 8b 00             	mov    (%rax),%rax
75fe   945e3e:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
7603   945e43:	8b 02                	mov    (%rdx),%eax
7605   945e45:	89 44 24 40          	mov    %eax,0x40(%rsp)
7609   945e49:	45 84 ed             	test   %r13b,%r13b
760c   945e4c:	0f 85 3f 34 00 00    	jne    949291 <___bpf_prog_run+0xaa51>
7612   945e52:	45 84 ff             	test   %r15b,%r15b
7615   945e55:	8b 4c 24 04          	mov    0x4(%rsp),%ecx
7619   945e59:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
761e   945e5e:	4c 8b 7c 24 28       	mov    0x28(%rsp),%r15
7623   945e63:	0f 84 b9 0c 00 00    	je     946b22 <___bpf_prog_run+0x82e2>
7629   945e69:	89 d8                	mov    %ebx,%eax
762b   945e6b:	83 e0 0f             	and    $0xf,%eax
762e   945e6e:	41 83 e6 0f          	and    $0xf,%r14d
7632   945e72:	f6 c3 0f             	test   $0xf,%bl
7635   945e75:	8b 7c 24 08          	mov    0x8(%rsp),%edi
7639   945e79:	0f 44 f9             	cmove  %ecx,%edi
763c   945e7c:	48 09 d0             	or     %rdx,%rax
763f   945e7f:	48 8b 5c 24 30       	mov    0x30(%rsp),%rbx
7644   945e84:	0f 85 35 36 00 00    	jne    9494bf <___bpf_prog_run+0xac7f>
764a   945e8a:	4a 8d 3c f3          	lea    (%rbx,%r14,8),%rdi
764e   945e8e:	48 8b 2f             	mov    (%rdi),%rbp
7651   945e91:	e8 00 00 00 00       	call   945e96 <___bpf_prog_run+0x7656>	945e92: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
7656   945e96:	49 8d 5f 02          	lea    0x2(%r15),%rbx
765a   945e9a:	48 8b 00             	mov    (%rax),%rax
765d   945e9d:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
7662   945ea2:	44 8b 3a             	mov    (%rdx),%r15d
7665   945ea5:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
766b   945eab:	0f 85 18 36 00 00    	jne    9494c9 <___bpf_prog_run+0xac89>
7671   945eb1:	4c 0f bf 33          	movswq (%rbx),%r14
7675   945eb5:	48 89 df             	mov    %rbx,%rdi
7678   945eb8:	e8 00 00 00 00       	call   945ebd <___bpf_prog_run+0x767d>	945eb9: R_X86_64_PLT32	__msan_metadata_ptr_for_load_2-0x4
767d   945ebd:	48 0f bf 00          	movswq (%rax),%rax
7681   945ec1:	48 85 c0             	test   %rax,%rax
7684   945ec4:	74 03                	je     945ec9 <___bpf_prog_run+0x7689>
7686   945ec6:	44 8b 3a             	mov    (%rdx),%r15d
7689   945ec9:	4c 01 f5             	add    %r14,%rbp
768c   945ecc:	48 09 44 24 08       	or     %rax,0x8(%rsp)
7691   945ed1:	0f 85 ff 35 00 00    	jne    9494d6 <___bpf_prog_run+0xac96>
7697   945ed7:	44 89 7c 24 4c       	mov    %r15d,0x4c(%rsp)
769c   945edc:	4c 8b 65 00          	mov    0x0(%rbp),%r12
76a0   945ee0:	49 89 ef             	mov    %rbp,%r15
76a3   945ee3:	48 89 ef             	mov    %rbp,%rdi
76a6   945ee6:	e8 00 00 00 00       	call   945eeb <___bpf_prog_run+0x76ab>	945ee7: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
76ab   945eeb:	4c 8b 30             	mov    (%rax),%r14
76ae   945eee:	8b 02                	mov    (%rdx),%eax
76b0   945ef0:	89 44 24 50          	mov    %eax,0x50(%rsp)
76b4   945ef4:	4c 89 e5             	mov    %r12,%rbp
76b7   945ef7:	48 f7 d5             	not    %rbp
76ba   945efa:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
76bf   945eff:	48 f7 d3             	not    %rbx
76c2   945f02:	4c 21 f3             	and    %r14,%rbx
76c5   945f05:	4c 09 f5             	or     %r14,%rbp
76c8   945f08:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
76cd   945f0d:	48 21 c5             	and    %rax,%rbp
76d0   945f10:	48 85 c0             	test   %rax,%rax
76d3   945f13:	44 8b 6c 24 50       	mov    0x50(%rsp),%r13d
76d8   945f18:	44 0f 45 6c 24 40    	cmovne 0x40(%rsp),%r13d
76de   945f1e:	be 08 00 00 00       	mov    $0x8,%esi
76e3   945f23:	4c 89 ff             	mov    %r15,%rdi
76e6   945f26:	e8 00 00 00 00       	call   945f2b <___bpf_prog_run+0x76eb>	945f27: R_X86_64_PLT32	__msan_instrument_asm_store-0x4
76eb   945f2b:	48 09 dd             	or     %rbx,%rbp
76ee   945f2e:	75 62                	jne    945f92 <___bpf_prog_run+0x7752>
76f0   945f30:	48 83 7c 24 08 00    	cmpq   $0x0,0x8(%rsp)
76f6   945f36:	75 6a                	jne    945fa2 <___bpf_prog_run+0x7762>
76f8   945f38:	4d 85 f6             	test   %r14,%r14
76fb   945f3b:	4c 8b 6c 24 30       	mov    0x30(%rsp),%r13
7700   945f40:	75 6b                	jne    945fad <___bpf_prog_run+0x776d>
7702   945f42:	4c 89 e5             	mov    %r12,%rbp
7705   945f45:	48 0b 6c 24 18       	or     0x18(%rsp),%rbp
770a   945f4a:	48 83 7c 24 08 00    	cmpq   $0x0,0x8(%rsp)
7710   945f50:	75 66                	jne    945fb8 <___bpf_prog_run+0x7778>
7712   945f52:	31 db                	xor    %ebx,%ebx
7714   945f54:	4c 89 e0             	mov    %r12,%rax
7717   945f57:	f0 49 0f b1 2f       	lock cmpxchg %rbp,(%r15)
771c   945f5c:	48 89 c5             	mov    %rax,%rbp
771f   945f5f:	0f 94 c3             	sete   %bl
7722   945f62:	80 fb 01             	cmp    $0x1,%bl
7725   945f65:	77 5c                	ja     945fc3 <___bpf_prog_run+0x7783>
7727   945f67:	e8 00 00 00 00       	call   945f6c <___bpf_prog_run+0x772c>	945f68: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
772c   945f6c:	48 85 db             	test   %rbx,%rbx
772f   945f6f:	74 6b                	je     945fdc <___bpf_prog_run+0x779c>
7731   945f71:	e8 00 00 00 00       	call   945f76 <___bpf_prog_run+0x7736>	945f72: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7736   945f76:	80 fb 01             	cmp    $0x1,%bl
7739   945f79:	77 79                	ja     945ff4 <___bpf_prog_run+0x77b4>
773b   945f7b:	e8 00 00 00 00       	call   945f80 <___bpf_prog_run+0x7740>	945f7c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7740   945f80:	84 db                	test   %bl,%bl
7742   945f82:	0f 85 88 00 00 00    	jne    946010 <___bpf_prog_run+0x77d0>
7748   945f88:	e8 00 00 00 00       	call   945f8d <___bpf_prog_run+0x774d>	945f89: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
774d   945f8d:	e9 62 ff ff ff       	jmp    945ef4 <___bpf_prog_run+0x76b4>
7752   945f92:	44 89 ef             	mov    %r13d,%edi
7755   945f95:	e8 00 00 00 00       	call   945f9a <___bpf_prog_run+0x775a>	945f96: R_X86_64_PLT32	__msan_warning-0x4
775a   945f9a:	48 83 7c 24 08 00    	cmpq   $0x0,0x8(%rsp)
7760   945fa0:	74 96                	je     945f38 <___bpf_prog_run+0x76f8>
7762   945fa2:	8b 7c 24 4c          	mov    0x4c(%rsp),%edi
7766   945fa6:	e8 00 00 00 00       	call   945fab <___bpf_prog_run+0x776b>	945fa7: R_X86_64_PLT32	__msan_warning-0x4
776b   945fab:	eb 8b                	jmp    945f38 <___bpf_prog_run+0x76f8>
776d   945fad:	8b 7c 24 50          	mov    0x50(%rsp),%edi
7771   945fb1:	e8 00 00 00 00       	call   945fb6 <___bpf_prog_run+0x7776>	945fb2: R_X86_64_PLT32	__msan_warning-0x4
7776   945fb6:	eb 8a                	jmp    945f42 <___bpf_prog_run+0x7702>
7778   945fb8:	8b 7c 24 4c          	mov    0x4c(%rsp),%edi
777c   945fbc:	e8 00 00 00 00       	call   945fc1 <___bpf_prog_run+0x7781>	945fbd: R_X86_64_PLT32	__msan_warning-0x4
7781   945fc1:	eb 8f                	jmp    945f52 <___bpf_prog_run+0x7712>
7783   945fc3:	e8 00 00 00 00       	call   945fc8 <___bpf_prog_run+0x7788>	945fc4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7788   945fc8:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	945fcb: R_X86_64_32S	.data+0x137040
778f   945fcf:	48 89 de             	mov    %rbx,%rsi
7792   945fd2:	e8 00 00 00 00       	call   945fd7 <___bpf_prog_run+0x7797>	945fd3: R_X86_64_PLT32	__ubsan_handle_load_invalid_value-0x4
7797   945fd7:	48 85 db             	test   %rbx,%rbx
779a   945fda:	75 95                	jne    945f71 <___bpf_prog_run+0x7731>
779c   945fdc:	e8 00 00 00 00       	call   945fe1 <___bpf_prog_run+0x77a1>	945fdd: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
77a1   945fe1:	45 31 f6             	xor    %r14d,%r14d
77a4   945fe4:	c7 44 24 50 00 00 00 00 	movl   $0x0,0x50(%rsp)
77ac   945fec:	49 89 ec             	mov    %rbp,%r12
77af   945fef:	80 fb 01             	cmp    $0x1,%bl
77b2   945ff2:	76 87                	jbe    945f7b <___bpf_prog_run+0x773b>
77b4   945ff4:	e8 00 00 00 00       	call   945ff9 <___bpf_prog_run+0x77b9>	945ff5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
77b9   945ff9:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	945ffc: R_X86_64_32S	.data+0x137060
77c0   946000:	48 89 de             	mov    %rbx,%rsi
77c3   946003:	e8 00 00 00 00       	call   946008 <___bpf_prog_run+0x77c8>	946004: R_X86_64_PLT32	__ubsan_handle_load_invalid_value-0x4
77c8   946008:	84 db                	test   %bl,%bl
77ca   94600a:	0f 84 78 ff ff ff    	je     945f88 <___bpf_prog_run+0x7748>
77d0   946010:	e8 00 00 00 00       	call   946015 <___bpf_prog_run+0x77d5>	946011: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
77d5   946015:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
77db   94601b:	4c 8b 7c 24 28       	mov    0x28(%rsp),%r15
77e0   946020:	0f 85 bd 34 00 00    	jne    9494e3 <___bpf_prog_run+0xaca3>
77e6   946026:	48 8b 7c 24 58       	mov    0x58(%rsp),%rdi
77eb   94602b:	0f b6 1f             	movzbl (%rdi),%ebx
77ee   94602e:	e8 00 00 00 00       	call   946033 <___bpf_prog_run+0x77f3>	94602f: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
77f3   946033:	0f b6 00             	movzbl (%rax),%eax
77f6   946036:	48 c1 e8 04          	shr    $0x4,%rax
77fa   94603a:	48 d1 eb             	shr    %rbx
77fd   94603d:	83 e3 78             	and    $0x78,%ebx
7800   946040:	8b 7c 24 04          	mov    0x4(%rsp),%edi
7804   946044:	48 85 c0             	test   %rax,%rax
7807   946047:	74 02                	je     94604b <___bpf_prog_run+0x780b>
7809   946049:	8b 3a                	mov    (%rdx),%edi
780b   94604b:	4c 01 eb             	add    %r13,%rbx
780e   94604e:	48 0b 44 24 20       	or     0x20(%rsp),%rax
7813   946053:	0f 85 97 34 00 00    	jne    9494f0 <___bpf_prog_run+0xacb0>
7819   946059:	48 89 df             	mov    %rbx,%rdi
781c   94605c:	e8 00 00 00 00       	call   946061 <___bpf_prog_run+0x7821>	94605d: R_X86_64_PLT32	__msan_metadata_ptr_for_store_8-0x4
7821   946061:	4c 89 30             	mov    %r14,(%rax)
7824   946064:	4d 85 f6             	test   %r14,%r14
7827   946067:	0f 85 f4 2f 00 00    	jne    949061 <___bpf_prog_run+0xa821>
782d   94606d:	4c 89 23             	mov    %r12,(%rbx)
7830   946070:	e9 39 da ff ff       	jmp    943aae <___bpf_prog_run+0x526e>
7835   946075:	41 81 fe a1 00 00 00 	cmp    $0xa1,%r14d
783c   94607c:	0f 85 c8 3a 00 00    	jne    949b4a <___bpf_prog_run+0xb30a>
7842   946082:	41 80 e7 18          	and    $0x18,%r15b
7846   946086:	89 e8                	mov    %ebp,%eax
7848   946088:	f6 d0                	not    %al
784a   94608a:	44 84 f8             	test   %r15b,%al
784d   94608d:	0f 94 c3             	sete   %bl
7850   946090:	40 f6 c5 18          	test   $0x18,%bpl
7854   946094:	4c 89 e8             	mov    %r13,%rax
7857   946097:	41 0f 95 c5          	setne  %r13b
785b   94609b:	48 8d 68 01          	lea    0x1(%rax),%rbp
785f   94609f:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
7865   9460a5:	0f 85 f3 31 00 00    	jne    94929e <___bpf_prog_run+0xaa5e>
786b   9460ab:	41 20 dd             	and    %bl,%r13b
786e   9460ae:	44 0f b6 75 00       	movzbl 0x0(%rbp),%r14d
7873   9460b3:	48 89 6c 24 58       	mov    %rbp,0x58(%rsp)
7878   9460b8:	48 89 ef             	mov    %rbp,%rdi
787b   9460bb:	e8 00 00 00 00       	call   9460c0 <___bpf_prog_run+0x7880>	9460bc: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
7880   9460c0:	0f b6 18             	movzbl (%rax),%ebx
7883   9460c3:	8b 0a                	mov    (%rdx),%ecx
7885   9460c5:	48 89 d8             	mov    %rbx,%rax
7888   9460c8:	48 c1 e8 04          	shr    $0x4,%rax
788c   9460cc:	4c 89 f5             	mov    %r14,%rbp
788f   9460cf:	48 c1 ed 04          	shr    $0x4,%rbp
7893   9460d3:	48 85 c0             	test   %rax,%rax
7896   9460d6:	8b 7c 24 04          	mov    0x4(%rsp),%edi
789a   9460da:	89 4c 24 18          	mov    %ecx,0x18(%rsp)
789e   9460de:	0f 45 f9             	cmovne %ecx,%edi
78a1   9460e1:	48 0b 44 24 20       	or     0x20(%rsp),%rax
78a6   9460e6:	0f 85 bf 31 00 00    	jne    9492ab <___bpf_prog_run+0xaa6b>
78ac   9460ec:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
78b1   9460f1:	48 8d 3c e8          	lea    (%rax,%rbp,8),%rdi
78b5   9460f5:	48 8b 07             	mov    (%rdi),%rax
78b8   9460f8:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
78bd   9460fd:	e8 00 00 00 00       	call   946102 <___bpf_prog_run+0x78c2>	9460fe: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
78c2   946102:	48 8b 00             	mov    (%rax),%rax
78c5   946105:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
78ca   94610a:	8b 02                	mov    (%rdx),%eax
78cc   94610c:	89 44 24 40          	mov    %eax,0x40(%rsp)
78d0   946110:	45 84 ed             	test   %r13b,%r13b
78d3   946113:	0f 85 9c 31 00 00    	jne    9492b5 <___bpf_prog_run+0xaa75>
78d9   946119:	45 84 ff             	test   %r15b,%r15b
78dc   94611c:	8b 4c 24 04          	mov    0x4(%rsp),%ecx
78e0   946120:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
78e5   946125:	48 8b 6c 24 28       	mov    0x28(%rsp),%rbp
78ea   94612a:	0f 84 fd 0b 00 00    	je     946d2d <___bpf_prog_run+0x84ed>
78f0   946130:	89 d8                	mov    %ebx,%eax
78f2   946132:	83 e0 0f             	and    $0xf,%eax
78f5   946135:	41 83 e6 0f          	and    $0xf,%r14d
78f9   946139:	f6 c3 0f             	test   $0xf,%bl
78fc   94613c:	8b 7c 24 18          	mov    0x18(%rsp),%edi
7900   946140:	0f 44 f9             	cmove  %ecx,%edi
7903   946143:	48 09 d0             	or     %rdx,%rax
7906   946146:	48 8b 5c 24 30       	mov    0x30(%rsp),%rbx
790b   94614b:	0f 85 a9 33 00 00    	jne    9494fa <___bpf_prog_run+0xacba>
7911   946151:	4a 8d 3c f3          	lea    (%rbx,%r14,8),%rdi
7915   946155:	4c 8b 37             	mov    (%rdi),%r14
7918   946158:	e8 00 00 00 00       	call   94615d <___bpf_prog_run+0x791d>	946159: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
791d   94615d:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
7922   946162:	48 8d 69 02          	lea    0x2(%rcx),%rbp
7926   946166:	48 8b 00             	mov    (%rax),%rax
7929   946169:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
792e   94616e:	44 8b 3a             	mov    (%rdx),%r15d
7931   946171:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
7937   946177:	0f 85 87 33 00 00    	jne    949504 <___bpf_prog_run+0xacc4>
793d   94617d:	48 0f bf 5d 00       	movswq 0x0(%rbp),%rbx
7942   946182:	48 89 ef             	mov    %rbp,%rdi
7945   946185:	e8 00 00 00 00       	call   94618a <___bpf_prog_run+0x794a>	946186: R_X86_64_PLT32	__msan_metadata_ptr_for_load_2-0x4
794a   94618a:	48 0f bf 00          	movswq (%rax),%rax
794e   94618e:	48 85 c0             	test   %rax,%rax
7951   946191:	74 03                	je     946196 <___bpf_prog_run+0x7956>
7953   946193:	44 8b 3a             	mov    (%rdx),%r15d
7956   946196:	49 01 de             	add    %rbx,%r14
7959   946199:	48 09 44 24 18       	or     %rax,0x18(%rsp)
795e   94619e:	0f 85 6d 33 00 00    	jne    949511 <___bpf_prog_run+0xacd1>
7964   9461a4:	44 89 7c 24 4c       	mov    %r15d,0x4c(%rsp)
7969   9461a9:	4d 8b 2e             	mov    (%r14),%r13
796c   9461ac:	4c 89 f7             	mov    %r14,%rdi
796f   9461af:	e8 00 00 00 00       	call   9461b4 <___bpf_prog_run+0x7974>	9461b0: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
7974   9461b4:	4c 8b 38             	mov    (%rax),%r15
7977   9461b7:	8b 02                	mov    (%rdx),%eax
7979   9461b9:	89 44 24 50          	mov    %eax,0x50(%rsp)
797d   9461bd:	48 8b 5c 24 38       	mov    0x38(%rsp),%rbx
7982   9461c2:	48 85 db             	test   %rbx,%rbx
7985   9461c5:	8b 6c 24 50          	mov    0x50(%rsp),%ebp
7989   9461c9:	0f 45 6c 24 40       	cmovne 0x40(%rsp),%ebp
798e   9461ce:	be 08 00 00 00       	mov    $0x8,%esi
7993   9461d3:	4c 89 f7             	mov    %r14,%rdi
7996   9461d6:	e8 00 00 00 00       	call   9461db <___bpf_prog_run+0x799b>	9461d7: R_X86_64_PLT32	__msan_instrument_asm_store-0x4
799b   9461db:	4c 89 f8             	mov    %r15,%rax
799e   9461de:	48 09 d8             	or     %rbx,%rax
79a1   9461e1:	0f 85 81 00 00 00    	jne    946268 <___bpf_prog_run+0x7a28>
79a7   9461e7:	48 83 7c 24 18 00    	cmpq   $0x0,0x18(%rsp)
79ad   9461ed:	0f 85 88 00 00 00    	jne    94627b <___bpf_prog_run+0x7a3b>
79b3   9461f3:	4d 85 ff             	test   %r15,%r15
79b6   9461f6:	0f 85 91 00 00 00    	jne    94628d <___bpf_prog_run+0x7a4d>
79bc   9461fc:	4d 89 fc             	mov    %r15,%r12
79bf   9461ff:	4c 89 eb             	mov    %r13,%rbx
79c2   946202:	48 33 5c 24 08       	xor    0x8(%rsp),%rbx
79c7   946207:	48 83 7c 24 18 00    	cmpq   $0x0,0x18(%rsp)
79cd   94620d:	0f 85 88 00 00 00    	jne    94629b <___bpf_prog_run+0x7a5b>
79d3   946213:	31 ed                	xor    %ebp,%ebp
79d5   946215:	4d 89 ef             	mov    %r13,%r15
79d8   946218:	4c 89 e8             	mov    %r13,%rax
79db   94621b:	f0 49 0f b1 1e       	lock cmpxchg %rbx,(%r14)
79e0   946220:	49 89 c5             	mov    %rax,%r13
79e3   946223:	40 0f 94 c5          	sete   %bpl
79e7   946227:	40 80 fd 01          	cmp    $0x1,%bpl
79eb   94622b:	77 7c                	ja     9462a9 <___bpf_prog_run+0x7a69>
79ed   94622d:	e8 00 00 00 00       	call   946232 <___bpf_prog_run+0x79f2>	94622e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
79f2   946232:	48 85 ed             	test   %rbp,%rbp
79f5   946235:	0f 84 8b 00 00 00    	je     9462c6 <___bpf_prog_run+0x7a86>
79fb   94623b:	e8 00 00 00 00       	call   946240 <___bpf_prog_run+0x7a00>	94623c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7a00   946240:	4d 89 fd             	mov    %r15,%r13
7a03   946243:	4d 89 e7             	mov    %r12,%r15
7a06   946246:	40 80 fd 01          	cmp    $0x1,%bpl
7a0a   94624a:	0f 87 90 00 00 00    	ja     9462e0 <___bpf_prog_run+0x7aa0>
7a10   946250:	e8 00 00 00 00       	call   946255 <___bpf_prog_run+0x7a15>	946251: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7a15   946255:	40 84 ed             	test   %bpl,%bpl
7a18   946258:	0f 85 9f 00 00 00    	jne    9462fd <___bpf_prog_run+0x7abd>
7a1e   94625e:	e8 00 00 00 00       	call   946263 <___bpf_prog_run+0x7a23>	94625f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7a23   946263:	e9 55 ff ff ff       	jmp    9461bd <___bpf_prog_run+0x797d>
7a28   946268:	89 ef                	mov    %ebp,%edi
7a2a   94626a:	e8 00 00 00 00       	call   94626f <___bpf_prog_run+0x7a2f>	94626b: R_X86_64_PLT32	__msan_warning-0x4
7a2f   94626f:	48 83 7c 24 18 00    	cmpq   $0x0,0x18(%rsp)
7a35   946275:	0f 84 78 ff ff ff    	je     9461f3 <___bpf_prog_run+0x79b3>
7a3b   94627b:	8b 7c 24 4c          	mov    0x4c(%rsp),%edi
7a3f   94627f:	e8 00 00 00 00       	call   946284 <___bpf_prog_run+0x7a44>	946280: R_X86_64_PLT32	__msan_warning-0x4
7a44   946284:	4d 85 ff             	test   %r15,%r15
7a47   946287:	0f 84 6f ff ff ff    	je     9461fc <___bpf_prog_run+0x79bc>
7a4d   94628d:	8b 7c 24 50          	mov    0x50(%rsp),%edi
7a51   946291:	e8 00 00 00 00       	call   946296 <___bpf_prog_run+0x7a56>	946292: R_X86_64_PLT32	__msan_warning-0x4
7a56   946296:	e9 61 ff ff ff       	jmp    9461fc <___bpf_prog_run+0x79bc>
7a5b   94629b:	8b 7c 24 4c          	mov    0x4c(%rsp),%edi
7a5f   94629f:	e8 00 00 00 00       	call   9462a4 <___bpf_prog_run+0x7a64>	9462a0: R_X86_64_PLT32	__msan_warning-0x4
7a64   9462a4:	e9 6a ff ff ff       	jmp    946213 <___bpf_prog_run+0x79d3>
7a69   9462a9:	e8 00 00 00 00       	call   9462ae <___bpf_prog_run+0x7a6e>	9462aa: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7a6e   9462ae:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	9462b1: R_X86_64_32S	.data+0x137040
7a75   9462b5:	48 89 ee             	mov    %rbp,%rsi
7a78   9462b8:	e8 00 00 00 00       	call   9462bd <___bpf_prog_run+0x7a7d>	9462b9: R_X86_64_PLT32	__ubsan_handle_load_invalid_value-0x4
7a7d   9462bd:	48 85 ed             	test   %rbp,%rbp
7a80   9462c0:	0f 85 75 ff ff ff    	jne    94623b <___bpf_prog_run+0x79fb>
7a86   9462c6:	e8 00 00 00 00       	call   9462cb <___bpf_prog_run+0x7a8b>	9462c7: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7a8b   9462cb:	45 31 ff             	xor    %r15d,%r15d
7a8e   9462ce:	c7 44 24 50 00 00 00 00 	movl   $0x0,0x50(%rsp)
7a96   9462d6:	40 80 fd 01          	cmp    $0x1,%bpl
7a9a   9462da:	0f 86 70 ff ff ff    	jbe    946250 <___bpf_prog_run+0x7a10>
7aa0   9462e0:	e8 00 00 00 00       	call   9462e5 <___bpf_prog_run+0x7aa5>	9462e1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7aa5   9462e5:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	9462e8: R_X86_64_32S	.data+0x137060
7aac   9462ec:	48 89 ee             	mov    %rbp,%rsi
7aaf   9462ef:	e8 00 00 00 00       	call   9462f4 <___bpf_prog_run+0x7ab4>	9462f0: R_X86_64_PLT32	__ubsan_handle_load_invalid_value-0x4
7ab4   9462f4:	40 84 ed             	test   %bpl,%bpl
7ab7   9462f7:	0f 84 61 ff ff ff    	je     94625e <___bpf_prog_run+0x7a1e>
7abd   9462fd:	e8 00 00 00 00       	call   946302 <___bpf_prog_run+0x7ac2>	9462fe: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7ac2   946302:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
7ac8   946308:	48 8b 6c 24 58       	mov    0x58(%rsp),%rbp
7acd   94630d:	0f 85 0b 32 00 00    	jne    94951e <___bpf_prog_run+0xacde>
7ad3   946313:	0f b6 5d 00          	movzbl 0x0(%rbp),%ebx
7ad7   946317:	48 89 ef             	mov    %rbp,%rdi
7ada   94631a:	e8 00 00 00 00       	call   94631f <___bpf_prog_run+0x7adf>	94631b: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
7adf   94631f:	0f b6 00             	movzbl (%rax),%eax
7ae2   946322:	48 c1 e8 04          	shr    $0x4,%rax
7ae6   946326:	48 d1 eb             	shr    %rbx
7ae9   946329:	83 e3 78             	and    $0x78,%ebx
7aec   94632c:	8b 7c 24 04          	mov    0x4(%rsp),%edi
7af0   946330:	48 85 c0             	test   %rax,%rax
7af3   946333:	48 8b 6c 24 30       	mov    0x30(%rsp),%rbp
7af8   946338:	4c 8b 64 24 28       	mov    0x28(%rsp),%r12
7afd   94633d:	74 02                	je     946341 <___bpf_prog_run+0x7b01>
7aff   94633f:	8b 3a                	mov    (%rdx),%edi
7b01   946341:	4d 89 fe             	mov    %r15,%r14
7b04   946344:	48 01 eb             	add    %rbp,%rbx
7b07   946347:	48 0b 44 24 20       	or     0x20(%rsp),%rax
7b0c   94634c:	0f 85 d9 31 00 00    	jne    94952b <___bpf_prog_run+0xaceb>
7b12   946352:	48 89 df             	mov    %rbx,%rdi
7b15   946355:	e8 00 00 00 00       	call   94635a <___bpf_prog_run+0x7b1a>	946356: R_X86_64_PLT32	__msan_metadata_ptr_for_store_8-0x4
7b1a   94635a:	4c 89 30             	mov    %r14,(%rax)
7b1d   94635d:	4d 85 f6             	test   %r14,%r14
7b20   946360:	0f 85 cf 31 00 00    	jne    949535 <___bpf_prog_run+0xacf5>
7b26   946366:	4c 89 2b             	mov    %r13,(%rbx)
7b29   946369:	4d 89 e5             	mov    %r12,%r13
7b2c   94636c:	e9 85 85 ff ff       	jmp    93e8f6 <___bpf_prog_run+0xb6>
7b31   946371:	41 81 fe f1 00 00 00 	cmp    $0xf1,%r14d
7b38   946378:	0f 85 cc 37 00 00    	jne    949b4a <___bpf_prog_run+0xb30a>
7b3e   94637e:	41 80 e7 18          	and    $0x18,%r15b
7b42   946382:	89 e8                	mov    %ebp,%eax
7b44   946384:	f6 d0                	not    %al
7b46   946386:	44 84 f8             	test   %r15b,%al
7b49   946389:	0f 94 44 24 50       	sete   0x50(%rsp)
7b4e   94638e:	40 f6 c5 18          	test   $0x18,%bpl
7b52   946392:	41 0f 95 c6          	setne  %r14b
7b56   946396:	49 8d 5d 01          	lea    0x1(%r13),%rbx
7b5a   94639a:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
7b60   9463a0:	0f 85 1c 2f 00 00    	jne    9492c2 <___bpf_prog_run+0xaa82>
7b66   9463a6:	0f b6 2b             	movzbl (%rbx),%ebp
7b69   9463a9:	48 89 df             	mov    %rbx,%rdi
7b6c   9463ac:	e8 00 00 00 00       	call   9463b1 <___bpf_prog_run+0x7b71>	9463ad: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
7b71   9463b1:	44 0f b6 28          	movzbl (%rax),%r13d
7b75   9463b5:	8b 0a                	mov    (%rdx),%ecx
7b77   9463b7:	44 89 e8             	mov    %r13d,%eax
7b7a   9463ba:	83 e0 0f             	and    $0xf,%eax
7b7d   9463bd:	48 89 6c 24 38       	mov    %rbp,0x38(%rsp)
7b82   9463c2:	89 eb                	mov    %ebp,%ebx
7b84   9463c4:	83 e3 0f             	and    $0xf,%ebx
7b87   9463c7:	48 85 c0             	test   %rax,%rax
7b8a   9463ca:	8b 7c 24 04          	mov    0x4(%rsp),%edi
7b8e   9463ce:	89 4c 24 40          	mov    %ecx,0x40(%rsp)
7b92   9463d2:	0f 45 f9             	cmovne %ecx,%edi
7b95   9463d5:	48 0b 44 24 20       	or     0x20(%rsp),%rax
7b9a   9463da:	0f 85 ef 2e 00 00    	jne    9492cf <___bpf_prog_run+0xaa8f>
7ba0   9463e0:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
7ba5   9463e5:	48 8d 3c d8          	lea    (%rax,%rbx,8),%rdi
7ba9   9463e9:	48 8b 07             	mov    (%rdi),%rax
7bac   9463ec:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
7bb1   9463f1:	e8 00 00 00 00       	call   9463f6 <___bpf_prog_run+0x7bb6>	9463f2: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
7bb6   9463f6:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
7bbb   9463fb:	48 8d 69 02          	lea    0x2(%rcx),%rbp
7bbf   9463ff:	48 8b 00             	mov    (%rax),%rax
7bc2   946402:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
7bc7   946407:	8b 02                	mov    (%rdx),%eax
7bc9   946409:	89 44 24 58          	mov    %eax,0x58(%rsp)
7bcd   94640d:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
7bd3   946413:	0f 85 c0 2e 00 00    	jne    9492d9 <___bpf_prog_run+0xaa99>
7bd9   946419:	44 22 74 24 50       	and    0x50(%rsp),%r14b
7bde   94641e:	48 0f bf 5d 00       	movswq 0x0(%rbp),%rbx
7be3   946423:	48 89 ef             	mov    %rbp,%rdi
7be6   946426:	e8 00 00 00 00       	call   94642b <___bpf_prog_run+0x7beb>	946427: R_X86_64_PLT32	__msan_metadata_ptr_for_load_2-0x4
7beb   94642b:	48 0f bf 28          	movswq (%rax),%rbp
7bef   94642f:	48 85 ed             	test   %rbp,%rbp
7bf2   946432:	74 06                	je     94643a <___bpf_prog_run+0x7bfa>
7bf4   946434:	8b 02                	mov    (%rdx),%eax
7bf6   946436:	89 44 24 58          	mov    %eax,0x58(%rsp)
7bfa   94643a:	45 84 f6             	test   %r14b,%r14b
7bfd   94643d:	0f 85 a3 2e 00 00    	jne    9492e6 <___bpf_prog_run+0xaaa6>
7c03   946443:	48 09 6c 24 08       	or     %rbp,0x8(%rsp)
7c08   946448:	48 01 5c 24 18       	add    %rbx,0x18(%rsp)
7c0d   94644d:	45 84 ff             	test   %r15b,%r15b
7c10   946450:	0f 84 eb 0a 00 00    	je     946f41 <___bpf_prog_run+0x8701>
7c16   946456:	e8 00 00 00 00       	call   94645b <___bpf_prog_run+0x7c1b>	946457: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7c1b   94645b:	4c 8b 64 24 20       	mov    0x20(%rsp),%r12
7c20   946460:	4d 85 e4             	test   %r12,%r12
7c23   946463:	48 8b 6c 24 38       	mov    0x38(%rsp),%rbp
7c28   946468:	0f 85 e7 30 00 00    	jne    949555 <___bpf_prog_run+0xad15>
7c2e   94646e:	48 8b 5c 24 30       	mov    0x30(%rsp),%rbx
7c33   946473:	4c 8b 33             	mov    (%rbx),%r14
7c36   946476:	48 89 df             	mov    %rbx,%rdi
7c39   946479:	e8 00 00 00 00       	call   94647e <___bpf_prog_run+0x7c3e>	94647a: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
7c3e   94647e:	4c 8b 38             	mov    (%rax),%r15
7c41   946481:	8b 02                	mov    (%rdx),%eax
7c43   946483:	89 44 24 50          	mov    %eax,0x50(%rsp)
7c47   946487:	41 c0 ed 04          	shr    $0x4,%r13b
7c4b   94648b:	40 c0 ed 04          	shr    $0x4,%bpl
7c4f   94648f:	41 0f b6 c5          	movzbl %r13b,%eax
7c53   946493:	84 c0                	test   %al,%al
7c55   946495:	8b 7c 24 40          	mov    0x40(%rsp),%edi
7c59   946499:	0f 44 7c 24 04       	cmove  0x4(%rsp),%edi
7c5e   94649e:	4c 89 e1             	mov    %r12,%rcx
7c61   9464a1:	48 09 c1             	or     %rax,%rcx
7c64   9464a4:	0f 85 b9 30 00 00    	jne    949563 <___bpf_prog_run+0xad23>
7c6a   9464aa:	40 0f b6 c5          	movzbl %bpl,%eax
7c6e   9464ae:	48 8d 3c c3          	lea    (%rbx,%rax,8),%rdi
7c72   9464b2:	4c 8b 27             	mov    (%rdi),%r12
7c75   9464b5:	e8 00 00 00 00       	call   9464ba <___bpf_prog_run+0x7c7a>	9464b6: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
7c7a   9464ba:	44 8b 2a             	mov    (%rdx),%r13d
7c7d   9464bd:	48 8b 18             	mov    (%rax),%rbx
7c80   9464c0:	be 08 00 00 00       	mov    $0x8,%esi
7c85   9464c5:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
7c8a   9464ca:	e8 00 00 00 00       	call   9464cf <___bpf_prog_run+0x7c8f>	9464cb: R_X86_64_PLT32	__msan_instrument_asm_store-0x4
7c8f   9464cf:	48 85 db             	test   %rbx,%rbx
7c92   9464d2:	0f 85 95 30 00 00    	jne    94956d <___bpf_prog_run+0xad2d>
7c98   9464d8:	4d 85 ff             	test   %r15,%r15
7c9b   9464db:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
7ca0   9464e0:	0f 85 94 30 00 00    	jne    94957a <___bpf_prog_run+0xad3a>
7ca6   9464e6:	48 85 db             	test   %rbx,%rbx
7ca9   9464e9:	48 8b 6c 24 30       	mov    0x30(%rsp),%rbp
7cae   9464ee:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
7cb3   9464f3:	0f 85 8f 30 00 00    	jne    949588 <___bpf_prog_run+0xad48>
7cb9   9464f9:	48 85 db             	test   %rbx,%rbx
7cbc   9464fc:	0f 85 98 30 00 00    	jne    94959a <___bpf_prog_run+0xad5a>
7cc2   946502:	4c 89 f0             	mov    %r14,%rax
7cc5   946505:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
7cca   94650a:	f0 4c 0f b1 21       	lock cmpxchg %r12,(%rcx)
7ccf   94650f:	48 89 c3             	mov    %rax,%rbx
7cd2   946512:	48 83 7c 24 20 00    	cmpq   $0x0,0x20(%rsp)
7cd8   946518:	0f 84 e0 0a 00 00    	je     946ffe <___bpf_prog_run+0x87be>
7cde   94651e:	8b 7c 24 04          	mov    0x4(%rsp),%edi
7ce2   946522:	e8 00 00 00 00       	call   946527 <___bpf_prog_run+0x7ce7>	946523: R_X86_64_PLT32	__msan_warning-0x4
7ce7   946527:	e9 d2 0a 00 00       	jmp    946ffe <___bpf_prog_run+0x87be>
7cec   94652c:	41 80 e7 18          	and    $0x18,%r15b
7cf0   946530:	89 e8                	mov    %ebp,%eax
7cf2   946532:	f6 d0                	not    %al
7cf4   946534:	44 84 f8             	test   %r15b,%al
7cf7   946537:	41 0f 94 c6          	sete   %r14b
7cfb   94653b:	40 f6 c5 18          	test   $0x18,%bpl
7cff   94653f:	4c 89 e8             	mov    %r13,%rax
7d02   946542:	41 0f 95 c5          	setne  %r13b
7d06   946546:	48 8d 58 01          	lea    0x1(%rax),%rbx
7d0a   94654a:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
7d10   946550:	0f 85 9d 2d 00 00    	jne    9492f3 <___bpf_prog_run+0xaab3>
7d16   946556:	45 20 f5             	and    %r14b,%r13b
7d19   946559:	44 0f b6 33          	movzbl (%rbx),%r14d
7d1d   94655d:	48 89 df             	mov    %rbx,%rdi
7d20   946560:	e8 00 00 00 00       	call   946565 <___bpf_prog_run+0x7d25>	946561: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
7d25   946565:	0f b6 18             	movzbl (%rax),%ebx
7d28   946568:	8b 2a                	mov    (%rdx),%ebp
7d2a   94656a:	48 89 d8             	mov    %rbx,%rax
7d2d   94656d:	48 c1 e8 04          	shr    $0x4,%rax
7d31   946571:	4c 89 74 24 38       	mov    %r14,0x38(%rsp)
7d36   946576:	49 c1 ee 04          	shr    $0x4,%r14
7d3a   94657a:	48 85 c0             	test   %rax,%rax
7d3d   94657d:	8b 7c 24 04          	mov    0x4(%rsp),%edi
7d41   946581:	0f 45 fd             	cmovne %ebp,%edi
7d44   946584:	48 0b 44 24 20       	or     0x20(%rsp),%rax
7d49   946589:	0f 85 71 2d 00 00    	jne    949300 <___bpf_prog_run+0xaac0>
7d4f   94658f:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
7d54   946594:	4a 8d 3c f0          	lea    (%rax,%r14,8),%rdi
7d58   946598:	4c 8b 37             	mov    (%rdi),%r14
7d5b   94659b:	e8 00 00 00 00       	call   9465a0 <___bpf_prog_run+0x7d60>	94659c: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
7d60   9465a0:	48 8b 00             	mov    (%rax),%rax
7d63   9465a3:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
7d68   9465a8:	8b 02                	mov    (%rdx),%eax
7d6a   9465aa:	89 44 24 40          	mov    %eax,0x40(%rsp)
7d6e   9465ae:	45 84 ed             	test   %r13b,%r13b
7d71   9465b1:	0f 85 53 2d 00 00    	jne    94930a <___bpf_prog_run+0xaaca>
7d77   9465b7:	45 84 ff             	test   %r15b,%r15b
7d7a   9465ba:	4c 8b 7c 24 20       	mov    0x20(%rsp),%r15
7d7f   9465bf:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
7d84   9465c4:	4c 89 74 24 18       	mov    %r14,0x18(%rsp)
7d89   9465c9:	0f 84 47 0a 00 00    	je     947016 <___bpf_prog_run+0x87d6>
7d8f   9465cf:	e8 00 00 00 00       	call   9465d4 <___bpf_prog_run+0x7d94>	9465d0: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7d94   9465d4:	89 d8                	mov    %ebx,%eax
7d96   9465d6:	83 e0 0f             	and    $0xf,%eax
7d99   9465d9:	89 ef                	mov    %ebp,%edi
7d9b   9465db:	48 8b 6c 24 38       	mov    0x38(%rsp),%rbp
7da0   9465e0:	83 e5 0f             	and    $0xf,%ebp
7da3   9465e3:	f6 c3 0f             	test   $0xf,%bl
7da6   9465e6:	0f 44 7c 24 04       	cmove  0x4(%rsp),%edi
7dab   9465eb:	4c 09 f8             	or     %r15,%rax
7dae   9465ee:	48 8b 5c 24 30       	mov    0x30(%rsp),%rbx
7db3   9465f3:	0f 85 af 2f 00 00    	jne    9495a8 <___bpf_prog_run+0xad68>
7db9   9465f9:	48 8d 3c eb          	lea    (%rbx,%rbp,8),%rdi
7dbd   9465fd:	4c 8b 37             	mov    (%rdi),%r14
7dc0   946600:	e8 00 00 00 00       	call   946605 <___bpf_prog_run+0x7dc5>	946601: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
7dc5   946605:	49 8d 5d 02          	lea    0x2(%r13),%rbx
7dc9   946609:	48 8b 28             	mov    (%rax),%rbp
7dcc   94660c:	44 8b 3a             	mov    (%rdx),%r15d
7dcf   94660f:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
7dd5   946615:	0f 85 97 2f 00 00    	jne    9495b2 <___bpf_prog_run+0xad72>
7ddb   94661b:	4c 0f bf 23          	movswq (%rbx),%r12
7ddf   94661f:	48 89 df             	mov    %rbx,%rdi
7de2   946622:	e8 00 00 00 00       	call   946627 <___bpf_prog_run+0x7de7>	946623: R_X86_64_PLT32	__msan_metadata_ptr_for_load_2-0x4
7de7   946627:	48 0f bf 00          	movswq (%rax),%rax
7deb   94662b:	48 85 c0             	test   %rax,%rax
7dee   94662e:	74 03                	je     946633 <___bpf_prog_run+0x7df3>
7df0   946630:	44 8b 3a             	mov    (%rdx),%r15d
7df3   946633:	48 09 c5             	or     %rax,%rbp
7df6   946636:	4d 01 e6             	add    %r12,%r14
7df9   946639:	be 08 00 00 00       	mov    $0x8,%esi
7dfe   94663e:	4c 89 f7             	mov    %r14,%rdi
7e01   946641:	e8 00 00 00 00       	call   946646 <___bpf_prog_run+0x7e06>	946642: R_X86_64_PLT32	__msan_instrument_asm_store-0x4
7e06   946646:	48 83 7c 24 08 00    	cmpq   $0x0,0x8(%rsp)
7e0c   94664c:	0f 85 6d 2f 00 00    	jne    9495bf <___bpf_prog_run+0xad7f>
7e12   946652:	48 85 ed             	test   %rbp,%rbp
7e15   946655:	0f 85 76 2f 00 00    	jne    9495d1 <___bpf_prog_run+0xad91>
7e1b   94665b:	48 85 ed             	test   %rbp,%rbp
7e1e   94665e:	0f 85 7e 2f 00 00    	jne    9495e2 <___bpf_prog_run+0xada2>
7e24   946664:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
7e29   946669:	f0 49 21 06          	lock and %rax,(%r14)
7e2d   94666d:	e9 84 82 ff ff       	jmp    93e8f6 <___bpf_prog_run+0xb6>
7e32   946672:	e8 00 00 00 00       	call   946677 <___bpf_prog_run+0x7e37>	946673: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7e37   946677:	83 e3 0f             	and    $0xf,%ebx
7e3a   94667a:	4c 8b 74 24 38       	mov    0x38(%rsp),%r14
7e3f   94667f:	41 83 e6 0f          	and    $0xf,%r14d
7e43   946683:	48 85 db             	test   %rbx,%rbx
7e46   946686:	0f 44 6c 24 04       	cmove  0x4(%rsp),%ebp
7e4b   94668b:	4c 09 fb             	or     %r15,%rbx
7e4e   94668e:	48 8b 5c 24 30       	mov    0x30(%rsp),%rbx
7e53   946693:	0f 85 56 2f 00 00    	jne    9495ef <___bpf_prog_run+0xadaf>
7e59   946699:	4a 8d 3c f3          	lea    (%rbx,%r14,8),%rdi
7e5d   94669d:	4c 8b 37             	mov    (%rdi),%r14
7e60   9466a0:	e8 00 00 00 00       	call   9466a5 <___bpf_prog_run+0x7e65>	9466a1: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
7e65   9466a5:	49 8d 5d 02          	lea    0x2(%r13),%rbx
7e69   9466a9:	48 8b 28             	mov    (%rax),%rbp
7e6c   9466ac:	44 8b 3a             	mov    (%rdx),%r15d
7e6f   9466af:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
7e75   9466b5:	0f 85 40 2f 00 00    	jne    9495fb <___bpf_prog_run+0xadbb>
7e7b   9466bb:	4c 0f bf 23          	movswq (%rbx),%r12
7e7f   9466bf:	48 89 df             	mov    %rbx,%rdi
7e82   9466c2:	e8 00 00 00 00       	call   9466c7 <___bpf_prog_run+0x7e87>	9466c3: R_X86_64_PLT32	__msan_metadata_ptr_for_load_2-0x4
7e87   9466c7:	48 0f bf 00          	movswq (%rax),%rax
7e8b   9466cb:	48 85 c0             	test   %rax,%rax
7e8e   9466ce:	74 03                	je     9466d3 <___bpf_prog_run+0x7e93>
7e90   9466d0:	44 8b 3a             	mov    (%rdx),%r15d
7e93   9466d3:	48 09 c5             	or     %rax,%rbp
7e96   9466d6:	4d 01 e6             	add    %r12,%r14
7e99   9466d9:	be 04 00 00 00       	mov    $0x4,%esi
7e9e   9466de:	4c 89 f7             	mov    %r14,%rdi
7ea1   9466e1:	e8 00 00 00 00       	call   9466e6 <___bpf_prog_run+0x7ea6>	9466e2: R_X86_64_PLT32	__msan_instrument_asm_store-0x4
7ea6   9466e6:	83 7c 24 08 00       	cmpl   $0x0,0x8(%rsp)
7eab   9466eb:	0f 85 17 2f 00 00    	jne    949608 <___bpf_prog_run+0xadc8>
7eb1   9466f1:	48 85 ed             	test   %rbp,%rbp
7eb4   9466f4:	0f 85 20 2f 00 00    	jne    94961a <___bpf_prog_run+0xadda>
7eba   9466fa:	48 85 ed             	test   %rbp,%rbp
7ebd   9466fd:	0f 85 28 2f 00 00    	jne    94962b <___bpf_prog_run+0xadeb>
7ec3   946703:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
7ec8   946708:	f0 41 01 06          	lock add %eax,(%r14)
7ecc   94670c:	e9 e5 81 ff ff       	jmp    93e8f6 <___bpf_prog_run+0xb6>
7ed1   946711:	83 e3 0f             	and    $0xf,%ebx
7ed4   946714:	41 83 e6 0f          	and    $0xf,%r14d
7ed8   946718:	48 85 db             	test   %rbx,%rbx
7edb   94671b:	8b 7c 24 08          	mov    0x8(%rsp),%edi
7edf   94671f:	0f 44 f9             	cmove  %ecx,%edi
7ee2   946722:	48 09 d3             	or     %rdx,%rbx
7ee5   946725:	48 8b 5c 24 30       	mov    0x30(%rsp),%rbx
7eea   94672a:	0f 85 08 2f 00 00    	jne    949638 <___bpf_prog_run+0xadf8>
7ef0   946730:	4a 8d 3c f3          	lea    (%rbx,%r14,8),%rdi
7ef4   946734:	48 8b 2f             	mov    (%rdi),%rbp
7ef7   946737:	e8 00 00 00 00       	call   94673c <___bpf_prog_run+0x7efc>	946738: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
7efc   94673c:	49 8d 5f 02          	lea    0x2(%r15),%rbx
7f00   946740:	48 8b 00             	mov    (%rax),%rax
7f03   946743:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
7f08   946748:	44 8b 3a             	mov    (%rdx),%r15d
7f0b   94674b:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
7f11   946751:	0f 85 eb 2e 00 00    	jne    949642 <___bpf_prog_run+0xae02>
7f17   946757:	4c 0f bf 33          	movswq (%rbx),%r14
7f1b   94675b:	48 89 df             	mov    %rbx,%rdi
7f1e   94675e:	e8 00 00 00 00       	call   946763 <___bpf_prog_run+0x7f23>	94675f: R_X86_64_PLT32	__msan_metadata_ptr_for_load_2-0x4
7f23   946763:	48 0f bf 00          	movswq (%rax),%rax
7f27   946767:	48 85 c0             	test   %rax,%rax
7f2a   94676a:	74 03                	je     94676f <___bpf_prog_run+0x7f2f>
7f2c   94676c:	44 8b 3a             	mov    (%rdx),%r15d
7f2f   94676f:	4c 01 f5             	add    %r14,%rbp
7f32   946772:	48 09 44 24 08       	or     %rax,0x8(%rsp)
7f37   946777:	0f 85 d2 2e 00 00    	jne    94964f <___bpf_prog_run+0xae0f>
7f3d   94677d:	44 89 7c 24 4c       	mov    %r15d,0x4c(%rsp)
7f42   946782:	44 8b 65 00          	mov    0x0(%rbp),%r12d
7f46   946786:	49 89 ee             	mov    %rbp,%r14
7f49   946789:	48 89 ef             	mov    %rbp,%rdi
7f4c   94678c:	e8 00 00 00 00       	call   946791 <___bpf_prog_run+0x7f51>	94678d: R_X86_64_PLT32	__msan_metadata_ptr_for_load_4-0x4
7f51   946791:	44 8b 38             	mov    (%rax),%r15d
7f54   946794:	8b 02                	mov    (%rdx),%eax
7f56   946796:	89 44 24 50          	mov    %eax,0x50(%rsp)
7f5a   94679a:	44 89 fd             	mov    %r15d,%ebp
7f5d   94679d:	23 6c 24 18          	and    0x18(%rsp),%ebp
7f61   9467a1:	44 89 fb             	mov    %r15d,%ebx
7f64   9467a4:	44 09 e3             	or     %r12d,%ebx
7f67   9467a7:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
7f6c   9467ac:	21 c3                	and    %eax,%ebx
7f6e   9467ae:	85 c0                	test   %eax,%eax
7f70   9467b0:	44 8b 6c 24 50       	mov    0x50(%rsp),%r13d
7f75   9467b5:	44 0f 45 6c 24 40    	cmovne 0x40(%rsp),%r13d
7f7b   9467bb:	be 04 00 00 00       	mov    $0x4,%esi
7f80   9467c0:	4c 89 f7             	mov    %r14,%rdi
7f83   9467c3:	e8 00 00 00 00       	call   9467c8 <___bpf_prog_run+0x7f88>	9467c4: R_X86_64_PLT32	__msan_instrument_asm_store-0x4
7f88   9467c8:	09 eb                	or     %ebp,%ebx
7f8a   9467ca:	75 5b                	jne    946827 <___bpf_prog_run+0x7fe7>
7f8c   9467cc:	48 83 7c 24 08 00    	cmpq   $0x0,0x8(%rsp)
7f92   9467d2:	75 63                	jne    946837 <___bpf_prog_run+0x7ff7>
7f94   9467d4:	45 85 ff             	test   %r15d,%r15d
7f97   9467d7:	75 6c                	jne    946845 <___bpf_prog_run+0x8005>
7f99   9467d9:	44 89 e5             	mov    %r12d,%ebp
7f9c   9467dc:	23 6c 24 18          	and    0x18(%rsp),%ebp
7fa0   9467e0:	48 83 7c 24 08 00    	cmpq   $0x0,0x8(%rsp)
7fa6   9467e6:	75 68                	jne    946850 <___bpf_prog_run+0x8010>
7fa8   9467e8:	31 db                	xor    %ebx,%ebx
7faa   9467ea:	44 89 e0             	mov    %r12d,%eax
7fad   9467ed:	f0 41 0f b1 2e       	lock cmpxchg %ebp,(%r14)
7fb2   9467f2:	89 c5                	mov    %eax,%ebp
7fb4   9467f4:	0f 94 c3             	sete   %bl
7fb7   9467f7:	80 fb 01             	cmp    $0x1,%bl
7fba   9467fa:	77 5f                	ja     94685b <___bpf_prog_run+0x801b>
7fbc   9467fc:	e8 00 00 00 00       	call   946801 <___bpf_prog_run+0x7fc1>	9467fd: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7fc1   946801:	48 85 db             	test   %rbx,%rbx
7fc4   946804:	74 6e                	je     946874 <___bpf_prog_run+0x8034>
7fc6   946806:	e8 00 00 00 00       	call   94680b <___bpf_prog_run+0x7fcb>	946807: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7fcb   94680b:	80 fb 01             	cmp    $0x1,%bl
7fce   94680e:	77 7c                	ja     94688c <___bpf_prog_run+0x804c>
7fd0   946810:	e8 00 00 00 00       	call   946815 <___bpf_prog_run+0x7fd5>	946811: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7fd5   946815:	84 db                	test   %bl,%bl
7fd7   946817:	0f 85 8b 00 00 00    	jne    9468a8 <___bpf_prog_run+0x8068>
7fdd   94681d:	e8 00 00 00 00       	call   946822 <___bpf_prog_run+0x7fe2>	94681e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7fe2   946822:	e9 73 ff ff ff       	jmp    94679a <___bpf_prog_run+0x7f5a>
7fe7   946827:	44 89 ef             	mov    %r13d,%edi
7fea   94682a:	e8 00 00 00 00       	call   94682f <___bpf_prog_run+0x7fef>	94682b: R_X86_64_PLT32	__msan_warning-0x4
7fef   94682f:	48 83 7c 24 08 00    	cmpq   $0x0,0x8(%rsp)
7ff5   946835:	74 9d                	je     9467d4 <___bpf_prog_run+0x7f94>
7ff7   946837:	8b 7c 24 4c          	mov    0x4c(%rsp),%edi
7ffb   94683b:	e8 00 00 00 00       	call   946840 <___bpf_prog_run+0x8000>	94683c: R_X86_64_PLT32	__msan_warning-0x4
8000   946840:	45 85 ff             	test   %r15d,%r15d
8003   946843:	74 94                	je     9467d9 <___bpf_prog_run+0x7f99>
8005   946845:	8b 7c 24 50          	mov    0x50(%rsp),%edi
8009   946849:	e8 00 00 00 00       	call   94684e <___bpf_prog_run+0x800e>	94684a: R_X86_64_PLT32	__msan_warning-0x4
800e   94684e:	eb 89                	jmp    9467d9 <___bpf_prog_run+0x7f99>
8010   946850:	8b 7c 24 4c          	mov    0x4c(%rsp),%edi
8014   946854:	e8 00 00 00 00       	call   946859 <___bpf_prog_run+0x8019>	946855: R_X86_64_PLT32	__msan_warning-0x4
8019   946859:	eb 8d                	jmp    9467e8 <___bpf_prog_run+0x7fa8>
801b   94685b:	e8 00 00 00 00       	call   946860 <___bpf_prog_run+0x8020>	94685c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
8020   946860:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	946863: R_X86_64_32S	.data+0x137000
8027   946867:	48 89 de             	mov    %rbx,%rsi
802a   94686a:	e8 00 00 00 00       	call   94686f <___bpf_prog_run+0x802f>	94686b: R_X86_64_PLT32	__ubsan_handle_load_invalid_value-0x4
802f   94686f:	48 85 db             	test   %rbx,%rbx
8032   946872:	75 92                	jne    946806 <___bpf_prog_run+0x7fc6>
8034   946874:	e8 00 00 00 00       	call   946879 <___bpf_prog_run+0x8039>	946875: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
8039   946879:	45 31 ff             	xor    %r15d,%r15d
803c   94687c:	c7 44 24 50 00 00 00 00 	movl   $0x0,0x50(%rsp)
8044   946884:	41 89 ec             	mov    %ebp,%r12d
8047   946887:	80 fb 01             	cmp    $0x1,%bl
804a   94688a:	76 84                	jbe    946810 <___bpf_prog_run+0x7fd0>
804c   94688c:	e8 00 00 00 00       	call   946891 <___bpf_prog_run+0x8051>	94688d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
8051   946891:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	946894: R_X86_64_32S	.data+0x137020
8058   946898:	48 89 de             	mov    %rbx,%rsi
805b   94689b:	e8 00 00 00 00       	call   9468a0 <___bpf_prog_run+0x8060>	94689c: R_X86_64_PLT32	__ubsan_handle_load_invalid_value-0x4
8060   9468a0:	84 db                	test   %bl,%bl
8062   9468a2:	0f 84 75 ff ff ff    	je     94681d <___bpf_prog_run+0x7fdd>
8068   9468a8:	e8 00 00 00 00       	call   9468ad <___bpf_prog_run+0x806d>	9468a9: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
806d   9468ad:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
8073   9468b3:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
8078   9468b8:	0f 85 9e 2d 00 00    	jne    94965c <___bpf_prog_run+0xae1c>
807e   9468be:	48 8b 7c 24 58       	mov    0x58(%rsp),%rdi
8083   9468c3:	0f b6 1f             	movzbl (%rdi),%ebx
8086   9468c6:	e8 00 00 00 00       	call   9468cb <___bpf_prog_run+0x808b>	9468c7: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
808b   9468cb:	0f b6 00             	movzbl (%rax),%eax
808e   9468ce:	48 c1 e8 04          	shr    $0x4,%rax
8092   9468d2:	48 d1 eb             	shr    %rbx
8095   9468d5:	83 e3 78             	and    $0x78,%ebx
8098   9468d8:	8b 7c 24 04          	mov    0x4(%rsp),%edi
809c   9468dc:	48 85 c0             	test   %rax,%rax
809f   9468df:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
80a4   9468e4:	74 02                	je     9468e8 <___bpf_prog_run+0x80a8>
80a6   9468e6:	8b 3a                	mov    (%rdx),%edi
80a8   9468e8:	48 03 5c 24 30       	add    0x30(%rsp),%rbx
80ad   9468ed:	48 09 c8             	or     %rcx,%rax
80b0   9468f0:	0f 85 73 2d 00 00    	jne    949669 <___bpf_prog_run+0xae29>
80b6   9468f6:	44 89 fd             	mov    %r15d,%ebp
80b9   9468f9:	48 89 df             	mov    %rbx,%rdi
80bc   9468fc:	e8 00 00 00 00       	call   946901 <___bpf_prog_run+0x80c1>	9468fd: R_X86_64_PLT32	__msan_metadata_ptr_for_store_8-0x4
80c1   946901:	48 89 28             	mov    %rbp,(%rax)
80c4   946904:	48 85 ed             	test   %rbp,%rbp
80c7   946907:	0f 85 66 2d 00 00    	jne    949673 <___bpf_prog_run+0xae33>
80cd   94690d:	44 89 e0             	mov    %r12d,%eax
80d0   946910:	e9 d0 e1 ff ff       	jmp    944ae5 <___bpf_prog_run+0x62a5>
80d5   946915:	e8 00 00 00 00       	call   94691a <___bpf_prog_run+0x80da>	946916: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
80da   94691a:	83 e3 0f             	and    $0xf,%ebx
80dd   94691d:	4c 8b 74 24 38       	mov    0x38(%rsp),%r14
80e2   946922:	41 83 e6 0f          	and    $0xf,%r14d
80e6   946926:	48 85 db             	test   %rbx,%rbx
80e9   946929:	0f 44 6c 24 04       	cmove  0x4(%rsp),%ebp
80ee   94692e:	4c 09 fb             	or     %r15,%rbx
80f1   946931:	48 8b 5c 24 30       	mov    0x30(%rsp),%rbx
80f6   946936:	0f 85 57 2d 00 00    	jne    949693 <___bpf_prog_run+0xae53>
80fc   94693c:	4a 8d 3c f3          	lea    (%rbx,%r14,8),%rdi
8100   946940:	4c 8b 37             	mov    (%rdi),%r14
8103   946943:	e8 00 00 00 00       	call   946948 <___bpf_prog_run+0x8108>	946944: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
8108   946948:	49 8d 5d 02          	lea    0x2(%r13),%rbx
810c   94694c:	48 8b 28             	mov    (%rax),%rbp
810f   94694f:	44 8b 3a             	mov    (%rdx),%r15d
8112   946952:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
8118   946958:	0f 85 41 2d 00 00    	jne    94969f <___bpf_prog_run+0xae5f>
811e   94695e:	4c 0f bf 23          	movswq (%rbx),%r12
8122   946962:	48 89 df             	mov    %rbx,%rdi
8125   946965:	e8 00 00 00 00       	call   94696a <___bpf_prog_run+0x812a>	946966: R_X86_64_PLT32	__msan_metadata_ptr_for_load_2-0x4
812a   94696a:	48 0f bf 00          	movswq (%rax),%rax
812e   94696e:	48 85 c0             	test   %rax,%rax
8131   946971:	74 03                	je     946976 <___bpf_prog_run+0x8136>
8133   946973:	44 8b 3a             	mov    (%rdx),%r15d
8136   946976:	48 09 c5             	or     %rax,%rbp
8139   946979:	4d 01 e6             	add    %r12,%r14
813c   94697c:	be 04 00 00 00       	mov    $0x4,%esi
8141   946981:	4c 89 f7             	mov    %r14,%rdi
8144   946984:	e8 00 00 00 00       	call   946989 <___bpf_prog_run+0x8149>	946985: R_X86_64_PLT32	__msan_instrument_asm_store-0x4
8149   946989:	83 7c 24 08 00       	cmpl   $0x0,0x8(%rsp)
814e   94698e:	0f 85 18 2d 00 00    	jne    9496ac <___bpf_prog_run+0xae6c>
8154   946994:	48 85 ed             	test   %rbp,%rbp
8157   946997:	0f 85 21 2d 00 00    	jne    9496be <___bpf_prog_run+0xae7e>
815d   94699d:	48 85 ed             	test   %rbp,%rbp
8160   9469a0:	0f 85 29 2d 00 00    	jne    9496cf <___bpf_prog_run+0xae8f>
8166   9469a6:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
816b   9469ab:	f0 41 09 06          	lock or %eax,(%r14)
816f   9469af:	e9 42 7f ff ff       	jmp    93e8f6 <___bpf_prog_run+0xb6>
8174   9469b4:	e8 00 00 00 00       	call   9469b9 <___bpf_prog_run+0x8179>	9469b5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
8179   9469b9:	83 e3 0f             	and    $0xf,%ebx
817c   9469bc:	4c 8b 74 24 38       	mov    0x38(%rsp),%r14
8181   9469c1:	41 83 e6 0f          	and    $0xf,%r14d
8185   9469c5:	48 85 db             	test   %rbx,%rbx
8188   9469c8:	0f 44 6c 24 04       	cmove  0x4(%rsp),%ebp
818d   9469cd:	4c 09 fb             	or     %r15,%rbx
8190   9469d0:	48 8b 5c 24 30       	mov    0x30(%rsp),%rbx
8195   9469d5:	0f 85 01 2d 00 00    	jne    9496dc <___bpf_prog_run+0xae9c>
819b   9469db:	4a 8d 3c f3          	lea    (%rbx,%r14,8),%rdi
819f   9469df:	4c 8b 37             	mov    (%rdi),%r14
81a2   9469e2:	e8 00 00 00 00       	call   9469e7 <___bpf_prog_run+0x81a7>	9469e3: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
81a7   9469e7:	49 8d 5d 02          	lea    0x2(%r13),%rbx
81ab   9469eb:	48 8b 28             	mov    (%rax),%rbp
81ae   9469ee:	44 8b 3a             	mov    (%rdx),%r15d
81b1   9469f1:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
81b7   9469f7:	0f 85 eb 2c 00 00    	jne    9496e8 <___bpf_prog_run+0xaea8>
81bd   9469fd:	4c 0f bf 23          	movswq (%rbx),%r12
81c1   946a01:	48 89 df             	mov    %rbx,%rdi
81c4   946a04:	e8 00 00 00 00       	call   946a09 <___bpf_prog_run+0x81c9>	946a05: R_X86_64_PLT32	__msan_metadata_ptr_for_load_2-0x4
81c9   946a09:	48 0f bf 00          	movswq (%rax),%rax
81cd   946a0d:	48 85 c0             	test   %rax,%rax
81d0   946a10:	74 03                	je     946a15 <___bpf_prog_run+0x81d5>
81d2   946a12:	44 8b 3a             	mov    (%rdx),%r15d
81d5   946a15:	48 09 c5             	or     %rax,%rbp
81d8   946a18:	4d 01 e6             	add    %r12,%r14
81db   946a1b:	be 04 00 00 00       	mov    $0x4,%esi
81e0   946a20:	4c 89 f7             	mov    %r14,%rdi
81e3   946a23:	e8 00 00 00 00       	call   946a28 <___bpf_prog_run+0x81e8>	946a24: R_X86_64_PLT32	__msan_instrument_asm_store-0x4
81e8   946a28:	83 7c 24 08 00       	cmpl   $0x0,0x8(%rsp)
81ed   946a2d:	0f 85 c2 2c 00 00    	jne    9496f5 <___bpf_prog_run+0xaeb5>
81f3   946a33:	48 85 ed             	test   %rbp,%rbp
81f6   946a36:	0f 85 cb 2c 00 00    	jne    949707 <___bpf_prog_run+0xaec7>
81fc   946a3c:	48 85 ed             	test   %rbp,%rbp
81ff   946a3f:	0f 85 d3 2c 00 00    	jne    949718 <___bpf_prog_run+0xaed8>
8205   946a45:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
820a   946a4a:	f0 41 31 06          	lock xor %eax,(%r14)
820e   946a4e:	e9 a3 7e ff ff       	jmp    93e8f6 <___bpf_prog_run+0xb6>
8213   946a53:	49 89 cf             	mov    %rcx,%r15
8216   946a56:	e8 00 00 00 00       	call   946a5b <___bpf_prog_run+0x821b>	946a57: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
821b   946a5b:	49 c1 ee 04          	shr    $0x4,%r14
821f   946a5f:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
8224   946a64:	48 c1 eb 04          	shr    $0x4,%rbx
8228   946a68:	4d 85 f6             	test   %r14,%r14
822b   946a6b:	8b 7c 24 38          	mov    0x38(%rsp),%edi
822f   946a6f:	0f 44 7c 24 04       	cmove  0x4(%rsp),%edi
8234   946a74:	4c 0b 74 24 20       	or     0x20(%rsp),%r14
8239   946a79:	48 8b 6c 24 30       	mov    0x30(%rsp),%rbp
823e   946a7e:	0f 85 a1 2c 00 00    	jne    949725 <___bpf_prog_run+0xaee5>
8244   946a84:	48 8d 3c dd 00 00 00 00 	lea    0x0(,%rbx,8),%rdi
824c   946a8c:	48 01 ef             	add    %rbp,%rdi
824f   946a8f:	44 8b 27             	mov    (%rdi),%r12d
8252   946a92:	e8 00 00 00 00       	call   946a97 <___bpf_prog_run+0x8257>	946a93: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
8257   946a97:	44 8b 32             	mov    (%rdx),%r14d
825a   946a9a:	8b 18                	mov    (%rax),%ebx
825c   946a9c:	be 04 00 00 00       	mov    $0x4,%esi
8261   946aa1:	4c 89 ef             	mov    %r13,%rdi
8264   946aa4:	e8 00 00 00 00       	call   946aa9 <___bpf_prog_run+0x8269>	946aa5: R_X86_64_PLT32	__msan_instrument_asm_store-0x4
8269   946aa9:	85 db                	test   %ebx,%ebx
826b   946aab:	0f 85 7e 2c 00 00    	jne    94972f <___bpf_prog_run+0xaeef>
8271   946ab1:	4d 85 ff             	test   %r15,%r15
8274   946ab4:	0f 85 86 2c 00 00    	jne    949740 <___bpf_prog_run+0xaf00>
827a   946aba:	4d 85 ff             	test   %r15,%r15
827d   946abd:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
8282   946ac2:	0f 85 86 2c 00 00    	jne    94974e <___bpf_prog_run+0xaf0e>
8288   946ac8:	45 87 65 00          	xchg   %r12d,0x0(%r13)
828c   946acc:	4d 85 f6             	test   %r14,%r14
828f   946acf:	0f 85 87 2c 00 00    	jne    94975c <___bpf_prog_run+0xaf1c>
8295   946ad5:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
829a   946ada:	0f b6 1f             	movzbl (%rdi),%ebx
829d   946add:	e8 00 00 00 00       	call   946ae2 <___bpf_prog_run+0x82a2>	946ade: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
82a2   946ae2:	0f b6 00             	movzbl (%rax),%eax
82a5   946ae5:	48 c1 e8 04          	shr    $0x4,%rax
82a9   946ae9:	48 d1 eb             	shr    %rbx
82ac   946aec:	83 e3 78             	and    $0x78,%ebx
82af   946aef:	8b 7c 24 04          	mov    0x4(%rsp),%edi
82b3   946af3:	48 85 c0             	test   %rax,%rax
82b6   946af6:	74 02                	je     946afa <___bpf_prog_run+0x82ba>
82b8   946af8:	8b 3a                	mov    (%rdx),%edi
82ba   946afa:	48 01 eb             	add    %rbp,%rbx
82bd   946afd:	48 0b 44 24 20       	or     0x20(%rsp),%rax
82c2   946b02:	0f 85 61 2c 00 00    	jne    949769 <___bpf_prog_run+0xaf29>
82c8   946b08:	44 89 e5             	mov    %r12d,%ebp
82cb   946b0b:	48 89 df             	mov    %rbx,%rdi
82ce   946b0e:	e8 00 00 00 00       	call   946b13 <___bpf_prog_run+0x82d3>	946b0f: R_X86_64_PLT32	__msan_metadata_ptr_for_store_8-0x4
82d3   946b13:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
82da   946b1a:	48 89 2b             	mov    %rbp,(%rbx)
82dd   946b1d:	e9 f6 d1 ff ff       	jmp    943d18 <___bpf_prog_run+0x54d8>
82e2   946b22:	83 e3 0f             	and    $0xf,%ebx
82e5   946b25:	41 83 e6 0f          	and    $0xf,%r14d
82e9   946b29:	48 85 db             	test   %rbx,%rbx
82ec   946b2c:	8b 7c 24 08          	mov    0x8(%rsp),%edi
82f0   946b30:	0f 44 f9             	cmove  %ecx,%edi
82f3   946b33:	48 09 d3             	or     %rdx,%rbx
82f6   946b36:	48 8b 5c 24 30       	mov    0x30(%rsp),%rbx
82fb   946b3b:	0f 85 32 2c 00 00    	jne    949773 <___bpf_prog_run+0xaf33>
8301   946b41:	4a 8d 3c f3          	lea    (%rbx,%r14,8),%rdi
8305   946b45:	48 8b 2f             	mov    (%rdi),%rbp
8308   946b48:	e8 00 00 00 00       	call   946b4d <___bpf_prog_run+0x830d>	946b49: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
830d   946b4d:	49 8d 5f 02          	lea    0x2(%r15),%rbx
8311   946b51:	48 8b 00             	mov    (%rax),%rax
8314   946b54:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
8319   946b59:	44 8b 3a             	mov    (%rdx),%r15d
831c   946b5c:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
8322   946b62:	0f 85 15 2c 00 00    	jne    94977d <___bpf_prog_run+0xaf3d>
8328   946b68:	4c 0f bf 33          	movswq (%rbx),%r14
832c   946b6c:	48 89 df             	mov    %rbx,%rdi
832f   946b6f:	e8 00 00 00 00       	call   946b74 <___bpf_prog_run+0x8334>	946b70: R_X86_64_PLT32	__msan_metadata_ptr_for_load_2-0x4
8334   946b74:	48 0f bf 00          	movswq (%rax),%rax
8338   946b78:	48 85 c0             	test   %rax,%rax
833b   946b7b:	74 03                	je     946b80 <___bpf_prog_run+0x8340>
833d   946b7d:	44 8b 3a             	mov    (%rdx),%r15d
8340   946b80:	4c 01 f5             	add    %r14,%rbp
8343   946b83:	48 09 44 24 08       	or     %rax,0x8(%rsp)
8348   946b88:	0f 85 fc 2b 00 00    	jne    94978a <___bpf_prog_run+0xaf4a>
834e   946b8e:	44 89 7c 24 4c       	mov    %r15d,0x4c(%rsp)
8353   946b93:	44 8b 7d 00          	mov    0x0(%rbp),%r15d
8357   946b97:	49 89 ee             	mov    %rbp,%r14
835a   946b9a:	48 89 ef             	mov    %rbp,%rdi
835d   946b9d:	e8 00 00 00 00       	call   946ba2 <___bpf_prog_run+0x8362>	946b9e: R_X86_64_PLT32	__msan_metadata_ptr_for_load_4-0x4
8362   946ba2:	44 8b 20             	mov    (%rax),%r12d
8365   946ba5:	8b 02                	mov    (%rdx),%eax
8367   946ba7:	89 44 24 50          	mov    %eax,0x50(%rsp)
836b   946bab:	44 89 fd             	mov    %r15d,%ebp
836e   946bae:	f7 d5                	not    %ebp
8370   946bb0:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
8375   946bb5:	89 c3                	mov    %eax,%ebx
8377   946bb7:	f7 d3                	not    %ebx
8379   946bb9:	44 21 e3             	and    %r12d,%ebx
837c   946bbc:	44 09 e5             	or     %r12d,%ebp
837f   946bbf:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
8384   946bc4:	21 c5                	and    %eax,%ebp
8386   946bc6:	85 c0                	test   %eax,%eax
8388   946bc8:	44 8b 6c 24 50       	mov    0x50(%rsp),%r13d
838d   946bcd:	44 0f 45 6c 24 40    	cmovne 0x40(%rsp),%r13d
8393   946bd3:	be 04 00 00 00       	mov    $0x4,%esi
8398   946bd8:	4c 89 f7             	mov    %r14,%rdi
839b   946bdb:	e8 00 00 00 00       	call   946be0 <___bpf_prog_run+0x83a0>	946bdc: R_X86_64_PLT32	__msan_instrument_asm_store-0x4
83a0   946be0:	09 dd                	or     %ebx,%ebp
83a2   946be2:	75 5b                	jne    946c3f <___bpf_prog_run+0x83ff>
83a4   946be4:	48 83 7c 24 08 00    	cmpq   $0x0,0x8(%rsp)
83aa   946bea:	75 63                	jne    946c4f <___bpf_prog_run+0x840f>
83ac   946bec:	45 85 e4             	test   %r12d,%r12d
83af   946bef:	75 6c                	jne    946c5d <___bpf_prog_run+0x841d>
83b1   946bf1:	44 89 fd             	mov    %r15d,%ebp
83b4   946bf4:	0b 6c 24 18          	or     0x18(%rsp),%ebp
83b8   946bf8:	48 83 7c 24 08 00    	cmpq   $0x0,0x8(%rsp)
83be   946bfe:	75 68                	jne    946c68 <___bpf_prog_run+0x8428>
83c0   946c00:	31 db                	xor    %ebx,%ebx
83c2   946c02:	44 89 f8             	mov    %r15d,%eax
83c5   946c05:	f0 41 0f b1 2e       	lock cmpxchg %ebp,(%r14)
83ca   946c0a:	89 c5                	mov    %eax,%ebp
83cc   946c0c:	0f 94 c3             	sete   %bl
83cf   946c0f:	80 fb 01             	cmp    $0x1,%bl
83d2   946c12:	77 5f                	ja     946c73 <___bpf_prog_run+0x8433>
83d4   946c14:	e8 00 00 00 00       	call   946c19 <___bpf_prog_run+0x83d9>	946c15: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
83d9   946c19:	48 85 db             	test   %rbx,%rbx
83dc   946c1c:	74 6e                	je     946c8c <___bpf_prog_run+0x844c>
83de   946c1e:	e8 00 00 00 00       	call   946c23 <___bpf_prog_run+0x83e3>	946c1f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
83e3   946c23:	80 fb 01             	cmp    $0x1,%bl
83e6   946c26:	77 7c                	ja     946ca4 <___bpf_prog_run+0x8464>
83e8   946c28:	e8 00 00 00 00       	call   946c2d <___bpf_prog_run+0x83ed>	946c29: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
83ed   946c2d:	84 db                	test   %bl,%bl
83ef   946c2f:	0f 85 8b 00 00 00    	jne    946cc0 <___bpf_prog_run+0x8480>
83f5   946c35:	e8 00 00 00 00       	call   946c3a <___bpf_prog_run+0x83fa>	946c36: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
83fa   946c3a:	e9 6c ff ff ff       	jmp    946bab <___bpf_prog_run+0x836b>
83ff   946c3f:	44 89 ef             	mov    %r13d,%edi
8402   946c42:	e8 00 00 00 00       	call   946c47 <___bpf_prog_run+0x8407>	946c43: R_X86_64_PLT32	__msan_warning-0x4
8407   946c47:	48 83 7c 24 08 00    	cmpq   $0x0,0x8(%rsp)
840d   946c4d:	74 9d                	je     946bec <___bpf_prog_run+0x83ac>
840f   946c4f:	8b 7c 24 4c          	mov    0x4c(%rsp),%edi
8413   946c53:	e8 00 00 00 00       	call   946c58 <___bpf_prog_run+0x8418>	946c54: R_X86_64_PLT32	__msan_warning-0x4
8418   946c58:	45 85 e4             	test   %r12d,%r12d
841b   946c5b:	74 94                	je     946bf1 <___bpf_prog_run+0x83b1>
841d   946c5d:	8b 7c 24 50          	mov    0x50(%rsp),%edi
8421   946c61:	e8 00 00 00 00       	call   946c66 <___bpf_prog_run+0x8426>	946c62: R_X86_64_PLT32	__msan_warning-0x4
8426   946c66:	eb 89                	jmp    946bf1 <___bpf_prog_run+0x83b1>
8428   946c68:	8b 7c 24 4c          	mov    0x4c(%rsp),%edi
842c   946c6c:	e8 00 00 00 00       	call   946c71 <___bpf_prog_run+0x8431>	946c6d: R_X86_64_PLT32	__msan_warning-0x4
8431   946c71:	eb 8d                	jmp    946c00 <___bpf_prog_run+0x83c0>
8433   946c73:	e8 00 00 00 00       	call   946c78 <___bpf_prog_run+0x8438>	946c74: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
8438   946c78:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	946c7b: R_X86_64_32S	.data+0x137000
843f   946c7f:	48 89 de             	mov    %rbx,%rsi
8442   946c82:	e8 00 00 00 00       	call   946c87 <___bpf_prog_run+0x8447>	946c83: R_X86_64_PLT32	__ubsan_handle_load_invalid_value-0x4
8447   946c87:	48 85 db             	test   %rbx,%rbx
844a   946c8a:	75 92                	jne    946c1e <___bpf_prog_run+0x83de>
844c   946c8c:	e8 00 00 00 00       	call   946c91 <___bpf_prog_run+0x8451>	946c8d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
8451   946c91:	45 31 e4             	xor    %r12d,%r12d
8454   946c94:	c7 44 24 50 00 00 00 00 	movl   $0x0,0x50(%rsp)
845c   946c9c:	41 89 ef             	mov    %ebp,%r15d
845f   946c9f:	80 fb 01             	cmp    $0x1,%bl
8462   946ca2:	76 84                	jbe    946c28 <___bpf_prog_run+0x83e8>
8464   946ca4:	e8 00 00 00 00       	call   946ca9 <___bpf_prog_run+0x8469>	946ca5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
8469   946ca9:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	946cac: R_X86_64_32S	.data+0x137020
8470   946cb0:	48 89 de             	mov    %rbx,%rsi
8473   946cb3:	e8 00 00 00 00       	call   946cb8 <___bpf_prog_run+0x8478>	946cb4: R_X86_64_PLT32	__ubsan_handle_load_invalid_value-0x4
8478   946cb8:	84 db                	test   %bl,%bl
847a   946cba:	0f 84 75 ff ff ff    	je     946c35 <___bpf_prog_run+0x83f5>
8480   946cc0:	e8 00 00 00 00       	call   946cc5 <___bpf_prog_run+0x8485>	946cc1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
8485   946cc5:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
848b   946ccb:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
8490   946cd0:	0f 85 c1 2a 00 00    	jne    949797 <___bpf_prog_run+0xaf57>
8496   946cd6:	48 8b 7c 24 58       	mov    0x58(%rsp),%rdi
849b   946cdb:	0f b6 1f             	movzbl (%rdi),%ebx
849e   946cde:	e8 00 00 00 00       	call   946ce3 <___bpf_prog_run+0x84a3>	946cdf: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
84a3   946ce3:	0f b6 00             	movzbl (%rax),%eax
84a6   946ce6:	48 c1 e8 04          	shr    $0x4,%rax
84aa   946cea:	48 d1 eb             	shr    %rbx
84ad   946ced:	83 e3 78             	and    $0x78,%ebx
84b0   946cf0:	8b 7c 24 04          	mov    0x4(%rsp),%edi
84b4   946cf4:	48 85 c0             	test   %rax,%rax
84b7   946cf7:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
84bc   946cfc:	74 02                	je     946d00 <___bpf_prog_run+0x84c0>
84be   946cfe:	8b 3a                	mov    (%rdx),%edi
84c0   946d00:	48 03 5c 24 30       	add    0x30(%rsp),%rbx
84c5   946d05:	48 09 c8             	or     %rcx,%rax
84c8   946d08:	0f 85 96 2a 00 00    	jne    9497a4 <___bpf_prog_run+0xaf64>
84ce   946d0e:	44 89 e5             	mov    %r12d,%ebp
84d1   946d11:	48 89 df             	mov    %rbx,%rdi
84d4   946d14:	e8 00 00 00 00       	call   946d19 <___bpf_prog_run+0x84d9>	946d15: R_X86_64_PLT32	__msan_metadata_ptr_for_store_8-0x4
84d9   946d19:	48 89 28             	mov    %rbp,(%rax)
84dc   946d1c:	48 85 ed             	test   %rbp,%rbp
84df   946d1f:	0f 85 89 2a 00 00    	jne    9497ae <___bpf_prog_run+0xaf6e>
84e5   946d25:	44 89 f8             	mov    %r15d,%eax
84e8   946d28:	e9 b8 dd ff ff       	jmp    944ae5 <___bpf_prog_run+0x62a5>
84ed   946d2d:	83 e3 0f             	and    $0xf,%ebx
84f0   946d30:	41 83 e6 0f          	and    $0xf,%r14d
84f4   946d34:	48 85 db             	test   %rbx,%rbx
84f7   946d37:	8b 7c 24 18          	mov    0x18(%rsp),%edi
84fb   946d3b:	0f 44 f9             	cmove  %ecx,%edi
84fe   946d3e:	48 09 d3             	or     %rdx,%rbx
8501   946d41:	48 8b 5c 24 30       	mov    0x30(%rsp),%rbx
8506   946d46:	0f 85 82 2a 00 00    	jne    9497ce <___bpf_prog_run+0xaf8e>
850c   946d4c:	4a 8d 3c f3          	lea    (%rbx,%r14,8),%rdi
8510   946d50:	48 8b 1f             	mov    (%rdi),%rbx
8513   946d53:	e8 00 00 00 00       	call   946d58 <___bpf_prog_run+0x8518>	946d54: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
8518   946d58:	48 83 c5 02          	add    $0x2,%rbp
851c   946d5c:	48 8b 00             	mov    (%rax),%rax
851f   946d5f:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
8524   946d64:	44 8b 32             	mov    (%rdx),%r14d
8527   946d67:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
852d   946d6d:	0f 85 65 2a 00 00    	jne    9497d8 <___bpf_prog_run+0xaf98>
8533   946d73:	4c 0f bf 7d 00       	movswq 0x0(%rbp),%r15
8538   946d78:	48 89 ef             	mov    %rbp,%rdi
853b   946d7b:	e8 00 00 00 00       	call   946d80 <___bpf_prog_run+0x8540>	946d7c: R_X86_64_PLT32	__msan_metadata_ptr_for_load_2-0x4
8540   946d80:	48 0f bf 00          	movswq (%rax),%rax
8544   946d84:	48 85 c0             	test   %rax,%rax
8547   946d87:	74 03                	je     946d8c <___bpf_prog_run+0x854c>
8549   946d89:	44 8b 32             	mov    (%rdx),%r14d
854c   946d8c:	4c 01 fb             	add    %r15,%rbx
854f   946d8f:	48 09 44 24 18       	or     %rax,0x18(%rsp)
8554   946d94:	0f 85 4b 2a 00 00    	jne    9497e5 <___bpf_prog_run+0xafa5>
855a   946d9a:	44 89 74 24 4c       	mov    %r14d,0x4c(%rsp)
855f   946d9f:	44 8b 2b             	mov    (%rbx),%r13d
8562   946da2:	49 89 dc             	mov    %rbx,%r12
8565   946da5:	48 89 df             	mov    %rbx,%rdi
8568   946da8:	e8 00 00 00 00       	call   946dad <___bpf_prog_run+0x856d>	946da9: R_X86_64_PLT32	__msan_metadata_ptr_for_load_4-0x4
856d   946dad:	44 8b 30             	mov    (%rax),%r14d
8570   946db0:	8b 02                	mov    (%rdx),%eax
8572   946db2:	89 44 24 50          	mov    %eax,0x50(%rsp)
8576   946db6:	48 8b 5c 24 38       	mov    0x38(%rsp),%rbx
857b   946dbb:	85 db                	test   %ebx,%ebx
857d   946dbd:	8b 6c 24 50          	mov    0x50(%rsp),%ebp
8581   946dc1:	0f 45 6c 24 40       	cmovne 0x40(%rsp),%ebp
8586   946dc6:	be 04 00 00 00       	mov    $0x4,%esi
858b   946dcb:	4c 89 e7             	mov    %r12,%rdi
858e   946dce:	e8 00 00 00 00       	call   946dd3 <___bpf_prog_run+0x8593>	946dcf: R_X86_64_PLT32	__msan_instrument_asm_store-0x4
8593   946dd3:	44 89 f0             	mov    %r14d,%eax
8596   946dd6:	09 d8                	or     %ebx,%eax
8598   946dd8:	75 6b                	jne    946e45 <___bpf_prog_run+0x8605>
859a   946dda:	48 83 7c 24 18 00    	cmpq   $0x0,0x18(%rsp)
85a0   946de0:	75 72                	jne    946e54 <___bpf_prog_run+0x8614>
85a2   946de2:	45 85 f6             	test   %r14d,%r14d
85a5   946de5:	75 7b                	jne    946e62 <___bpf_prog_run+0x8622>
85a7   946de7:	44 89 eb             	mov    %r13d,%ebx
85aa   946dea:	33 5c 24 08          	xor    0x8(%rsp),%ebx
85ae   946dee:	48 83 7c 24 18 00    	cmpq   $0x0,0x18(%rsp)
85b4   946df4:	75 7a                	jne    946e70 <___bpf_prog_run+0x8630>
85b6   946df6:	31 ed                	xor    %ebp,%ebp
85b8   946df8:	45 89 ef             	mov    %r13d,%r15d
85bb   946dfb:	44 89 e8             	mov    %r13d,%eax
85be   946dfe:	f0 41 0f b1 1c 24    	lock cmpxchg %ebx,(%r12)
85c4   946e04:	41 89 c5             	mov    %eax,%r13d
85c7   946e07:	40 0f 94 c5          	sete   %bpl
85cb   946e0b:	40 80 fd 01          	cmp    $0x1,%bpl
85cf   946e0f:	77 6d                	ja     946e7e <___bpf_prog_run+0x863e>
85d1   946e11:	e8 00 00 00 00       	call   946e16 <___bpf_prog_run+0x85d6>	946e12: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
85d6   946e16:	48 85 ed             	test   %rbp,%rbp
85d9   946e19:	74 7c                	je     946e97 <___bpf_prog_run+0x8657>
85db   946e1b:	e8 00 00 00 00       	call   946e20 <___bpf_prog_run+0x85e0>	946e1c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
85e0   946e20:	45 89 fd             	mov    %r15d,%r13d
85e3   946e23:	40 80 fd 01          	cmp    $0x1,%bpl
85e7   946e27:	0f 87 80 00 00 00    	ja     946ead <___bpf_prog_run+0x866d>
85ed   946e2d:	e8 00 00 00 00       	call   946e32 <___bpf_prog_run+0x85f2>	946e2e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
85f2   946e32:	40 84 ed             	test   %bpl,%bpl
85f5   946e35:	0f 85 8f 00 00 00    	jne    946eca <___bpf_prog_run+0x868a>
85fb   946e3b:	e8 00 00 00 00       	call   946e40 <___bpf_prog_run+0x8600>	946e3c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
8600   946e40:	e9 71 ff ff ff       	jmp    946db6 <___bpf_prog_run+0x8576>
8605   946e45:	89 ef                	mov    %ebp,%edi
8607   946e47:	e8 00 00 00 00       	call   946e4c <___bpf_prog_run+0x860c>	946e48: R_X86_64_PLT32	__msan_warning-0x4
860c   946e4c:	48 83 7c 24 18 00    	cmpq   $0x0,0x18(%rsp)
8612   946e52:	74 8e                	je     946de2 <___bpf_prog_run+0x85a2>
8614   946e54:	8b 7c 24 4c          	mov    0x4c(%rsp),%edi
8618   946e58:	e8 00 00 00 00       	call   946e5d <___bpf_prog_run+0x861d>	946e59: R_X86_64_PLT32	__msan_warning-0x4
861d   946e5d:	45 85 f6             	test   %r14d,%r14d
8620   946e60:	74 85                	je     946de7 <___bpf_prog_run+0x85a7>
8622   946e62:	8b 7c 24 50          	mov    0x50(%rsp),%edi
8626   946e66:	e8 00 00 00 00       	call   946e6b <___bpf_prog_run+0x862b>	946e67: R_X86_64_PLT32	__msan_warning-0x4
862b   946e6b:	e9 77 ff ff ff       	jmp    946de7 <___bpf_prog_run+0x85a7>
8630   946e70:	8b 7c 24 4c          	mov    0x4c(%rsp),%edi
8634   946e74:	e8 00 00 00 00       	call   946e79 <___bpf_prog_run+0x8639>	946e75: R_X86_64_PLT32	__msan_warning-0x4
8639   946e79:	e9 78 ff ff ff       	jmp    946df6 <___bpf_prog_run+0x85b6>
863e   946e7e:	e8 00 00 00 00       	call   946e83 <___bpf_prog_run+0x8643>	946e7f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
8643   946e83:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	946e86: R_X86_64_32S	.data+0x137000
864a   946e8a:	48 89 ee             	mov    %rbp,%rsi
864d   946e8d:	e8 00 00 00 00       	call   946e92 <___bpf_prog_run+0x8652>	946e8e: R_X86_64_PLT32	__ubsan_handle_load_invalid_value-0x4
8652   946e92:	48 85 ed             	test   %rbp,%rbp
8655   946e95:	75 84                	jne    946e1b <___bpf_prog_run+0x85db>
8657   946e97:	e8 00 00 00 00       	call   946e9c <___bpf_prog_run+0x865c>	946e98: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
865c   946e9c:	45 31 f6             	xor    %r14d,%r14d
865f   946e9f:	c7 44 24 50 00 00 00 00 	movl   $0x0,0x50(%rsp)
8667   946ea7:	40 80 fd 01          	cmp    $0x1,%bpl
866b   946eab:	76 80                	jbe    946e2d <___bpf_prog_run+0x85ed>
866d   946ead:	e8 00 00 00 00       	call   946eb2 <___bpf_prog_run+0x8672>	946eae: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
8672   946eb2:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	946eb5: R_X86_64_32S	.data+0x137020
8679   946eb9:	48 89 ee             	mov    %rbp,%rsi
867c   946ebc:	e8 00 00 00 00       	call   946ec1 <___bpf_prog_run+0x8681>	946ebd: R_X86_64_PLT32	__ubsan_handle_load_invalid_value-0x4
8681   946ec1:	40 84 ed             	test   %bpl,%bpl
8684   946ec4:	0f 84 71 ff ff ff    	je     946e3b <___bpf_prog_run+0x85fb>
868a   946eca:	e8 00 00 00 00       	call   946ecf <___bpf_prog_run+0x868f>	946ecb: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
868f   946ecf:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
8695   946ed5:	48 8b 6c 24 58       	mov    0x58(%rsp),%rbp
869a   946eda:	0f 85 12 29 00 00    	jne    9497f2 <___bpf_prog_run+0xafb2>
86a0   946ee0:	0f b6 5d 00          	movzbl 0x0(%rbp),%ebx
86a4   946ee4:	48 89 ef             	mov    %rbp,%rdi
86a7   946ee7:	e8 00 00 00 00       	call   946eec <___bpf_prog_run+0x86ac>	946ee8: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
86ac   946eec:	0f b6 00             	movzbl (%rax),%eax
86af   946eef:	48 c1 e8 04          	shr    $0x4,%rax
86b3   946ef3:	48 d1 eb             	shr    %rbx
86b6   946ef6:	83 e3 78             	and    $0x78,%ebx
86b9   946ef9:	8b 7c 24 04          	mov    0x4(%rsp),%edi
86bd   946efd:	48 85 c0             	test   %rax,%rax
86c0   946f00:	48 8b 6c 24 30       	mov    0x30(%rsp),%rbp
86c5   946f05:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
86ca   946f0a:	4c 8b 7c 24 28       	mov    0x28(%rsp),%r15
86cf   946f0f:	74 02                	je     946f13 <___bpf_prog_run+0x86d3>
86d1   946f11:	8b 3a                	mov    (%rdx),%edi
86d3   946f13:	48 01 eb             	add    %rbp,%rbx
86d6   946f16:	48 09 c8             	or     %rcx,%rax
86d9   946f19:	0f 85 e0 28 00 00    	jne    9497ff <___bpf_prog_run+0xafbf>
86df   946f1f:	44 89 f5             	mov    %r14d,%ebp
86e2   946f22:	48 89 df             	mov    %rbx,%rdi
86e5   946f25:	e8 00 00 00 00       	call   946f2a <___bpf_prog_run+0x86ea>	946f26: R_X86_64_PLT32	__msan_metadata_ptr_for_store_8-0x4
86ea   946f2a:	48 89 28             	mov    %rbp,(%rax)
86ed   946f2d:	48 85 ed             	test   %rbp,%rbp
86f0   946f30:	0f 85 d3 28 00 00    	jne    949809 <___bpf_prog_run+0xafc9>
86f6   946f36:	44 89 e8             	mov    %r13d,%eax
86f9   946f39:	48 89 03             	mov    %rax,(%rbx)
86fc   946f3c:	e9 6d cb ff ff       	jmp    943aae <___bpf_prog_run+0x526e>
8701   946f41:	e8 00 00 00 00       	call   946f46 <___bpf_prog_run+0x8706>	946f42: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
8706   946f46:	4c 8b 64 24 20       	mov    0x20(%rsp),%r12
870b   946f4b:	4d 85 e4             	test   %r12,%r12
870e   946f4e:	48 8b 6c 24 38       	mov    0x38(%rsp),%rbp
8713   946f53:	0f 85 d0 28 00 00    	jne    949829 <___bpf_prog_run+0xafe9>
8719   946f59:	48 8b 5c 24 30       	mov    0x30(%rsp),%rbx
871e   946f5e:	44 8b 33             	mov    (%rbx),%r14d
8721   946f61:	48 89 df             	mov    %rbx,%rdi
8724   946f64:	e8 00 00 00 00       	call   946f69 <___bpf_prog_run+0x8729>	946f65: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
8729   946f69:	44 8b 38             	mov    (%rax),%r15d
872c   946f6c:	8b 02                	mov    (%rdx),%eax
872e   946f6e:	89 44 24 50          	mov    %eax,0x50(%rsp)
8732   946f72:	49 c1 ed 04          	shr    $0x4,%r13
8736   946f76:	48 c1 ed 04          	shr    $0x4,%rbp
873a   946f7a:	4d 85 ed             	test   %r13,%r13
873d   946f7d:	8b 7c 24 40          	mov    0x40(%rsp),%edi
8741   946f81:	0f 44 7c 24 04       	cmove  0x4(%rsp),%edi
8746   946f86:	4d 09 e5             	or     %r12,%r13
8749   946f89:	0f 85 a8 28 00 00    	jne    949837 <___bpf_prog_run+0xaff7>
874f   946f8f:	48 8d 3c eb          	lea    (%rbx,%rbp,8),%rdi
8753   946f93:	44 8b 27             	mov    (%rdi),%r12d
8756   946f96:	e8 00 00 00 00       	call   946f9b <___bpf_prog_run+0x875b>	946f97: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
875b   946f9b:	44 8b 2a             	mov    (%rdx),%r13d
875e   946f9e:	8b 18                	mov    (%rax),%ebx
8760   946fa0:	be 04 00 00 00       	mov    $0x4,%esi
8765   946fa5:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
876a   946faa:	e8 00 00 00 00       	call   946faf <___bpf_prog_run+0x876f>	946fab: R_X86_64_PLT32	__msan_instrument_asm_store-0x4
876f   946faf:	85 db                	test   %ebx,%ebx
8771   946fb1:	0f 85 8a 28 00 00    	jne    949841 <___bpf_prog_run+0xb001>
8777   946fb7:	45 85 ff             	test   %r15d,%r15d
877a   946fba:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
877f   946fbf:	0f 85 89 28 00 00    	jne    94984e <___bpf_prog_run+0xb00e>
8785   946fc5:	48 85 db             	test   %rbx,%rbx
8788   946fc8:	48 8b 6c 24 30       	mov    0x30(%rsp),%rbp
878d   946fcd:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
8792   946fd2:	0f 85 84 28 00 00    	jne    94985c <___bpf_prog_run+0xb01c>
8798   946fd8:	48 85 db             	test   %rbx,%rbx
879b   946fdb:	0f 85 8d 28 00 00    	jne    94986e <___bpf_prog_run+0xb02e>
87a1   946fe1:	44 89 f0             	mov    %r14d,%eax
87a4   946fe4:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
87a9   946fe9:	f0 44 0f b1 21       	lock cmpxchg %r12d,(%rcx)
87ae   946fee:	89 c3                	mov    %eax,%ebx
87b0   946ff0:	48 83 7c 24 20 00    	cmpq   $0x0,0x20(%rsp)
87b6   946ff6:	0f 85 80 28 00 00    	jne    94987c <___bpf_prog_run+0xb03c>
87bc   946ffc:	89 db                	mov    %ebx,%ebx
87be   946ffe:	48 89 ef             	mov    %rbp,%rdi
87c1   947001:	e8 00 00 00 00       	call   947006 <___bpf_prog_run+0x87c6>	947002: R_X86_64_PLT32	__msan_metadata_ptr_for_store_8-0x4
87c6   947006:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
87cd   94700d:	48 89 5d 00          	mov    %rbx,0x0(%rbp)
87d1   947011:	e9 e0 78 ff ff       	jmp    93e8f6 <___bpf_prog_run+0xb6>
87d6   947016:	e8 00 00 00 00       	call   94701b <___bpf_prog_run+0x87db>	947017: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
87db   94701b:	83 e3 0f             	and    $0xf,%ebx
87de   94701e:	4c 8b 74 24 38       	mov    0x38(%rsp),%r14
87e3   947023:	41 83 e6 0f          	and    $0xf,%r14d
87e7   947027:	48 85 db             	test   %rbx,%rbx
87ea   94702a:	0f 44 6c 24 04       	cmove  0x4(%rsp),%ebp
87ef   94702f:	4c 09 fb             	or     %r15,%rbx
87f2   947032:	48 8b 5c 24 30       	mov    0x30(%rsp),%rbx
87f7   947037:	0f 85 4d 28 00 00    	jne    94988a <___bpf_prog_run+0xb04a>
87fd   94703d:	4a 8d 3c f3          	lea    (%rbx,%r14,8),%rdi
8801   947041:	4c 8b 37             	mov    (%rdi),%r14
8804   947044:	e8 00 00 00 00       	call   947049 <___bpf_prog_run+0x8809>	947045: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
8809   947049:	49 8d 5d 02          	lea    0x2(%r13),%rbx
880d   94704d:	48 8b 28             	mov    (%rax),%rbp
8810   947050:	44 8b 3a             	mov    (%rdx),%r15d
8813   947053:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
8819   947059:	0f 85 37 28 00 00    	jne    949896 <___bpf_prog_run+0xb056>
881f   94705f:	4c 0f bf 23          	movswq (%rbx),%r12
8823   947063:	48 89 df             	mov    %rbx,%rdi
8826   947066:	e8 00 00 00 00       	call   94706b <___bpf_prog_run+0x882b>	947067: R_X86_64_PLT32	__msan_metadata_ptr_for_load_2-0x4
882b   94706b:	48 0f bf 00          	movswq (%rax),%rax
882f   94706f:	48 85 c0             	test   %rax,%rax
8832   947072:	74 03                	je     947077 <___bpf_prog_run+0x8837>
8834   947074:	44 8b 3a             	mov    (%rdx),%r15d
8837   947077:	48 09 c5             	or     %rax,%rbp
883a   94707a:	4d 01 e6             	add    %r12,%r14
883d   94707d:	be 04 00 00 00       	mov    $0x4,%esi
8842   947082:	4c 89 f7             	mov    %r14,%rdi
8845   947085:	e8 00 00 00 00       	call   94708a <___bpf_prog_run+0x884a>	947086: R_X86_64_PLT32	__msan_instrument_asm_store-0x4
884a   94708a:	83 7c 24 08 00       	cmpl   $0x0,0x8(%rsp)
884f   94708f:	0f 85 0e 28 00 00    	jne    9498a3 <___bpf_prog_run+0xb063>
8855   947095:	48 85 ed             	test   %rbp,%rbp
8858   947098:	0f 85 17 28 00 00    	jne    9498b5 <___bpf_prog_run+0xb075>
885e   94709e:	48 85 ed             	test   %rbp,%rbp
8861   9470a1:	0f 85 1f 28 00 00    	jne    9498c6 <___bpf_prog_run+0xb086>
8867   9470a7:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
886c   9470ac:	f0 41 21 06          	lock and %eax,(%r14)
8870   9470b0:	e9 41 78 ff ff       	jmp    93e8f6 <___bpf_prog_run+0xb6>
8875   9470b5:	49 89 d6             	mov    %rdx,%r14
8878   9470b8:	8b 7c 24 38          	mov    0x38(%rsp),%edi
887c   9470bc:	e8 00 00 00 00       	call   9470c1 <___bpf_prog_run+0x8881>	9470bd: R_X86_64_PLT32	__msan_chain_origin-0x4
8881   9470c1:	89 c0                	mov    %eax,%eax
8883   9470c3:	48 89 c1             	mov    %rax,%rcx
8886   9470c6:	48 c1 e1 20          	shl    $0x20,%rcx
888a   9470ca:	48 09 c1             	or     %rax,%rcx
888d   9470cd:	49 89 0e             	mov    %rcx,(%r14)
8890   9470d0:	e9 62 d0 ff ff       	jmp    944137 <___bpf_prog_run+0x58f7>
8895   9470d5:	48 89 d5             	mov    %rdx,%rbp
8898   9470d8:	8b 7c 24 18          	mov    0x18(%rsp),%edi
889c   9470dc:	e8 00 00 00 00       	call   9470e1 <___bpf_prog_run+0x88a1>	9470dd: R_X86_64_PLT32	__msan_chain_origin-0x4
88a1   9470e1:	89 c0                	mov    %eax,%eax
88a3   9470e3:	48 89 c1             	mov    %rax,%rcx
88a6   9470e6:	48 c1 e1 20          	shl    $0x20,%rcx
88aa   9470ea:	48 09 c1             	or     %rax,%rcx
88ad   9470ed:	48 89 4d 00          	mov    %rcx,0x0(%rbp)
88b1   9470f1:	e9 1e cc ff ff       	jmp    943d14 <___bpf_prog_run+0x54d4>
88b6   9470f6:	48 89 d5             	mov    %rdx,%rbp
88b9   9470f9:	8b 7c 24 08          	mov    0x8(%rsp),%edi
88bd   9470fd:	e8 00 00 00 00       	call   947102 <___bpf_prog_run+0x88c2>	9470fe: R_X86_64_PLT32	__msan_chain_origin-0x4
88c2   947102:	89 c0                	mov    %eax,%eax
88c4   947104:	48 89 c1             	mov    %rax,%rcx
88c7   947107:	48 c1 e1 20          	shl    $0x20,%rcx
88cb   94710b:	48 09 c1             	or     %rax,%rcx
88ce   94710e:	48 89 4d 00          	mov    %rcx,0x0(%rbp)
88d2   947112:	e9 13 d1 ff ff       	jmp    94422a <___bpf_prog_run+0x59ea>
88d7   947117:	49 89 d6             	mov    %rdx,%r14
88da   94711a:	44 89 ff             	mov    %r15d,%edi
88dd   94711d:	e8 00 00 00 00       	call   947122 <___bpf_prog_run+0x88e2>	94711e: R_X86_64_PLT32	__msan_chain_origin-0x4
88e2   947122:	89 c0                	mov    %eax,%eax
88e4   947124:	48 89 c1             	mov    %rax,%rcx
88e7   947127:	48 c1 e1 20          	shl    $0x20,%rcx
88eb   94712b:	48 09 c1             	or     %rax,%rcx
88ee   94712e:	49 89 0e             	mov    %rcx,(%r14)
88f1   947131:	e9 b3 df ff ff       	jmp    9450e9 <___bpf_prog_run+0x68a9>
88f6   947136:	49 89 d6             	mov    %rdx,%r14
88f9   947139:	8b 7c 24 18          	mov    0x18(%rsp),%edi
88fd   94713d:	e8 00 00 00 00       	call   947142 <___bpf_prog_run+0x8902>	94713e: R_X86_64_PLT32	__msan_chain_origin-0x4
8902   947142:	89 c0                	mov    %eax,%eax
8904   947144:	48 89 c1             	mov    %rax,%rcx
8907   947147:	48 c1 e1 20          	shl    $0x20,%rcx
890b   94714b:	48 09 c1             	or     %rax,%rcx
890e   94714e:	49 89 0e             	mov    %rcx,(%r14)
8911   947151:	e9 54 c9 ff ff       	jmp    943aaa <___bpf_prog_run+0x526a>
8916   947156:	48 89 d5             	mov    %rdx,%rbp
8919   947159:	8b 7c 24 08          	mov    0x8(%rsp),%edi
891d   94715d:	e8 00 00 00 00       	call   947162 <___bpf_prog_run+0x8922>	94715e: R_X86_64_PLT32	__msan_chain_origin-0x4
8922   947162:	89 c0                	mov    %eax,%eax
8924   947164:	48 89 c1             	mov    %rax,%rcx
8927   947167:	48 c1 e1 20          	shl    $0x20,%rcx
892b   94716b:	48 09 c1             	or     %rax,%rcx
892e   94716e:	48 89 4d 00          	mov    %rcx,0x0(%rbp)
8932   947172:	e9 e2 a8 ff ff       	jmp    941a59 <___bpf_prog_run+0x3219>
8937   947177:	48 89 d3             	mov    %rdx,%rbx
893a   94717a:	44 89 f7             	mov    %r14d,%edi
893d   94717d:	e8 00 00 00 00       	call   947182 <___bpf_prog_run+0x8942>	94717e: R_X86_64_PLT32	__msan_chain_origin-0x4
8942   947182:	89 c0                	mov    %eax,%eax
8944   947184:	48 89 c1             	mov    %rax,%rcx
8947   947187:	48 c1 e1 20          	shl    $0x20,%rcx
894b   94718b:	48 09 c1             	or     %rax,%rcx
894e   94718e:	48 89 0b             	mov    %rcx,(%rbx)
8951   947191:	e9 4b d4 ff ff       	jmp    9445e1 <___bpf_prog_run+0x5da1>
8956   947196:	48 89 d5             	mov    %rdx,%rbp
8959   947199:	8b 7c 24 18          	mov    0x18(%rsp),%edi
895d   94719d:	e8 00 00 00 00       	call   9471a2 <___bpf_prog_run+0x8962>	94719e: R_X86_64_PLT32	__msan_chain_origin-0x4
8962   9471a2:	89 c0                	mov    %eax,%eax
8964   9471a4:	48 89 c1             	mov    %rax,%rcx
8967   9471a7:	48 c1 e1 20          	shl    $0x20,%rcx
896b   9471ab:	48 09 c1             	or     %rax,%rcx
896e   9471ae:	48 89 4d 00          	mov    %rcx,0x0(%rbp)
8972   9471b2:	e9 2f d5 ff ff       	jmp    9446e6 <___bpf_prog_run+0x5ea6>
8977   9471b7:	48 89 d5             	mov    %rdx,%rbp
897a   9471ba:	8b 7c 24 18          	mov    0x18(%rsp),%edi
897e   9471be:	e8 00 00 00 00       	call   9471c3 <___bpf_prog_run+0x8983>	9471bf: R_X86_64_PLT32	__msan_chain_origin-0x4
8983   9471c3:	89 c0                	mov    %eax,%eax
8985   9471c5:	48 89 c1             	mov    %rax,%rcx
8988   9471c8:	48 c1 e1 20          	shl    $0x20,%rcx
898c   9471cc:	48 09 c1             	or     %rax,%rcx
898f   9471cf:	48 89 4d 00          	mov    %rcx,0x0(%rbp)
8993   9471d3:	e9 9c d2 ff ff       	jmp    944474 <___bpf_prog_run+0x5c34>
8998   9471d8:	48 89 d5             	mov    %rdx,%rbp
899b   9471db:	8b 7c 24 08          	mov    0x8(%rsp),%edi
899f   9471df:	e8 00 00 00 00       	call   9471e4 <___bpf_prog_run+0x89a4>	9471e0: R_X86_64_PLT32	__msan_chain_origin-0x4
89a4   9471e4:	89 c0                	mov    %eax,%eax
89a6   9471e6:	48 89 c1             	mov    %rax,%rcx
89a9   9471e9:	48 c1 e1 20          	shl    $0x20,%rcx
89ad   9471ed:	48 09 c1             	or     %rax,%rcx
89b0   9471f0:	48 89 4d 00          	mov    %rcx,0x0(%rbp)
89b4   9471f4:	e9 e7 d8 ff ff       	jmp    944ae0 <___bpf_prog_run+0x62a0>
89b9   9471f9:	49 89 d7             	mov    %rdx,%r15
89bc   9471fc:	8b 7c 24 40          	mov    0x40(%rsp),%edi
89c0   947200:	e8 00 00 00 00       	call   947205 <___bpf_prog_run+0x89c5>	947201: R_X86_64_PLT32	__msan_chain_origin-0x4
89c5   947205:	89 c0                	mov    %eax,%eax
89c7   947207:	48 89 c1             	mov    %rax,%rcx
89ca   94720a:	48 c1 e1 20          	shl    $0x20,%rcx
89ce   94720e:	48 09 c1             	or     %rax,%rcx
89d1   947211:	49 89 0f             	mov    %rcx,(%r15)
89d4   947214:	e9 d7 dd ff ff       	jmp    944ff0 <___bpf_prog_run+0x67b0>
89d9   947219:	44 89 f7             	mov    %r14d,%edi
89dc   94721c:	e8 00 00 00 00       	call   947221 <___bpf_prog_run+0x89e1>	94721d: R_X86_64_PLT32	__msan_warning-0x4
89e1   947221:	4d 39 e7             	cmp    %r12,%r15
89e4   947224:	0f 84 87 7f ff ff    	je     93f1b1 <___bpf_prog_run+0x971>
89ea   94722a:	e8 00 00 00 00       	call   94722f <___bpf_prog_run+0x89ef>	94722b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
89ef   94722f:	49 8d 5d 02          	lea    0x2(%r13),%rbx
89f3   947233:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
89f8   947238:	4d 85 f6             	test   %r14,%r14
89fb   94723b:	0f 84 7b 12 00 00    	je     9484bc <___bpf_prog_run+0x9c7c>
8a01   947241:	8b 3c 24             	mov    (%rsp),%edi
8a04   947244:	e8 00 00 00 00       	call   947249 <___bpf_prog_run+0x8a09>	947245: R_X86_64_PLT32	__msan_warning-0x4
8a09   947249:	e9 6e 12 00 00       	jmp    9484bc <___bpf_prog_run+0x9c7c>
8a0e   94724e:	8b 7c 24 08          	mov    0x8(%rsp),%edi
8a12   947252:	e8 00 00 00 00       	call   947257 <___bpf_prog_run+0x8a17>	947253: R_X86_64_PLT32	__msan_warning-0x4
8a17   947257:	85 db                	test   %ebx,%ebx
8a19   947259:	0f 85 8a 82 ff ff    	jne    93f4e9 <___bpf_prog_run+0xca9>
8a1f   94725f:	e8 00 00 00 00       	call   947264 <___bpf_prog_run+0x8a24>	947260: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
8a24   947264:	49 83 c5 08          	add    $0x8,%r13
8a28   947268:	e9 92 76 ff ff       	jmp    93e8ff <___bpf_prog_run+0xbf>
8a2d   94726d:	8b 7c 24 04          	mov    0x4(%rsp),%edi
8a31   947271:	e8 00 00 00 00       	call   947276 <___bpf_prog_run+0x8a36>	947272: R_X86_64_PLT32	__msan_warning-0x4
8a36   947276:	e9 e1 76 ff ff       	jmp    93e95c <___bpf_prog_run+0x11c>
8a3b   94727b:	8b 7c 24 04          	mov    0x4(%rsp),%edi
8a3f   94727f:	e8 00 00 00 00       	call   947284 <___bpf_prog_run+0x8a44>	947280: R_X86_64_PLT32	__msan_warning-0x4
8a44   947284:	e9 fa 76 ff ff       	jmp    93e983 <___bpf_prog_run+0x143>
8a49   947289:	8b 7c 24 08          	mov    0x8(%rsp),%edi
8a4d   94728d:	e8 00 00 00 00       	call   947292 <___bpf_prog_run+0x8a52>	94728e: R_X86_64_PLT32	__msan_warning-0x4
8a52   947292:	e9 14 77 ff ff       	jmp    93e9ab <___bpf_prog_run+0x16b>
8a57   947297:	e8 00 00 00 00       	call   94729c <___bpf_prog_run+0x8a5c>	947298: R_X86_64_PLT32	__msan_warning-0x4
8a5c   94729c:	84 db                	test   %bl,%bl
8a5e   94729e:	0f 84 57 77 ff ff    	je     93e9fb <___bpf_prog_run+0x1bb>
8a64   9472a4:	e8 00 00 00 00       	call   9472a9 <___bpf_prog_run+0x8a69>	9472a5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
8a69   9472a9:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
8a6e   9472ae:	e9 43 76 ff ff       	jmp    93e8f6 <___bpf_prog_run+0xb6>
8a73   9472b3:	8b 3c 24             	mov    (%rsp),%edi
8a76   9472b6:	e8 00 00 00 00       	call   9472bb <___bpf_prog_run+0x8a7b>	9472b7: R_X86_64_PLT32	__msan_warning-0x4
8a7b   9472bb:	e9 e6 77 ff ff       	jmp    93eaa6 <___bpf_prog_run+0x266>
8a80   9472c0:	8b 7c 24 04          	mov    0x4(%rsp),%edi
8a84   9472c4:	e8 00 00 00 00       	call   9472c9 <___bpf_prog_run+0x8a89>	9472c5: R_X86_64_PLT32	__msan_warning-0x4
8a89   9472c9:	e9 f1 77 ff ff       	jmp    93eabf <___bpf_prog_run+0x27f>
8a8e   9472ce:	8b 7c 24 04          	mov    0x4(%rsp),%edi
8a92   9472d2:	e8 00 00 00 00       	call   9472d7 <___bpf_prog_run+0x8a97>	9472d3: R_X86_64_PLT32	__msan_warning-0x4
8a97   9472d7:	e9 0f 78 ff ff       	jmp    93eaeb <___bpf_prog_run+0x2ab>
8a9c   9472dc:	8b 7c 24 04          	mov    0x4(%rsp),%edi
8aa0   9472e0:	e8 00 00 00 00       	call   9472e5 <___bpf_prog_run+0x8aa5>	9472e1: R_X86_64_PLT32	__msan_warning-0x4
8aa5   9472e5:	e9 2d 78 ff ff       	jmp    93eb17 <___bpf_prog_run+0x2d7>
8aaa   9472ea:	8b 7c 24 04          	mov    0x4(%rsp),%edi
8aae   9472ee:	e8 00 00 00 00       	call   9472f3 <___bpf_prog_run+0x8ab3>	9472ef: R_X86_64_PLT32	__msan_warning-0x4
8ab3   9472f3:	e9 4b 78 ff ff       	jmp    93eb43 <___bpf_prog_run+0x303>
8ab8   9472f8:	8b 7c 24 04          	mov    0x4(%rsp),%edi
8abc   9472fc:	e8 00 00 00 00       	call   947301 <___bpf_prog_run+0x8ac1>	9472fd: R_X86_64_PLT32	__msan_warning-0x4
8ac1   947301:	e9 72 78 ff ff       	jmp    93eb78 <___bpf_prog_run+0x338>
8ac6   947306:	8b 3c 24             	mov    (%rsp),%edi
8ac9   947309:	e8 00 00 00 00       	call   94730e <___bpf_prog_run+0x8ace>	94730a: R_X86_64_PLT32	__msan_warning-0x4
8ace   94730e:	e9 94 78 ff ff       	jmp    93eba7 <___bpf_prog_run+0x367>
8ad3   947313:	8b 7c 24 04          	mov    0x4(%rsp),%edi
8ad7   947317:	e8 00 00 00 00       	call   94731c <___bpf_prog_run+0x8adc>	947318: R_X86_64_PLT32	__msan_warning-0x4
8adc   94731c:	e9 7c 79 ff ff       	jmp    93ec9d <___bpf_prog_run+0x45d>
8ae1   947321:	49 89 d7             	mov    %rdx,%r15
8ae4   947324:	44 89 f7             	mov    %r14d,%edi
8ae7   947327:	e8 00 00 00 00       	call   94732c <___bpf_prog_run+0x8aec>	947328: R_X86_64_PLT32	__msan_chain_origin-0x4
8aec   94732c:	89 c0                	mov    %eax,%eax
8aee   94732e:	48 89 c1             	mov    %rax,%rcx
8af1   947331:	48 c1 e1 20          	shl    $0x20,%rcx
8af5   947335:	48 09 c1             	or     %rax,%rcx
8af8   947338:	49 89 0f             	mov    %rcx,(%r15)
8afb   94733b:	e9 76 79 ff ff       	jmp    93ecb6 <___bpf_prog_run+0x476>
8b00   947340:	8b 3c 24             	mov    (%rsp),%edi
8b03   947343:	e8 00 00 00 00       	call   947348 <___bpf_prog_run+0x8b08>	947344: R_X86_64_PLT32	__msan_warning-0x4
8b08   947348:	e9 8c 79 ff ff       	jmp    93ecd9 <___bpf_prog_run+0x499>
8b0d   94734d:	e8 00 00 00 00       	call   947352 <___bpf_prog_run+0x8b12>	94734e: R_X86_64_PLT32	__msan_warning-0x4
8b12   947352:	e9 bb 79 ff ff       	jmp    93ed12 <___bpf_prog_run+0x4d2>
8b17   947357:	8b 3c 24             	mov    (%rsp),%edi
8b1a   94735a:	e8 00 00 00 00       	call   94735f <___bpf_prog_run+0x8b1f>	94735b: R_X86_64_PLT32	__msan_warning-0x4
8b1f   94735f:	e9 dd 79 ff ff       	jmp    93ed41 <___bpf_prog_run+0x501>
8b24   947364:	8b 7c 24 08          	mov    0x8(%rsp),%edi
8b28   947368:	e8 00 00 00 00       	call   94736d <___bpf_prog_run+0x8b2d>	947369: R_X86_64_PLT32	__msan_warning-0x4
8b2d   94736d:	e9 f6 79 ff ff       	jmp    93ed68 <___bpf_prog_run+0x528>
8b32   947372:	8b 3c 24             	mov    (%rsp),%edi
8b35   947375:	e8 00 00 00 00       	call   94737a <___bpf_prog_run+0x8b3a>	947376: R_X86_64_PLT32	__msan_warning-0x4
8b3a   94737a:	e9 31 7a ff ff       	jmp    93edb0 <___bpf_prog_run+0x570>
8b3f   94737f:	e8 00 00 00 00       	call   947384 <___bpf_prog_run+0x8b44>	947380: R_X86_64_PLT32	__msan_warning-0x4
8b44   947384:	e9 63 7a ff ff       	jmp    93edec <___bpf_prog_run+0x5ac>
8b49   947389:	44 89 e7             	mov    %r12d,%edi
8b4c   94738c:	e8 00 00 00 00       	call   947391 <___bpf_prog_run+0x8b51>	94738d: R_X86_64_PLT32	__msan_warning-0x4
8b51   947391:	e9 99 7a ff ff       	jmp    93ee2f <___bpf_prog_run+0x5ef>
8b56   947396:	8b 7c 24 08          	mov    0x8(%rsp),%edi
8b5a   94739a:	e8 00 00 00 00       	call   94739f <___bpf_prog_run+0x8b5f>	94739b: R_X86_64_PLT32	__msan_warning-0x4
8b5f   94739f:	e9 ba 7a ff ff       	jmp    93ee5e <___bpf_prog_run+0x61e>
8b64   9473a4:	8b 3c 24             	mov    (%rsp),%edi
8b67   9473a7:	e8 00 00 00 00       	call   9473ac <___bpf_prog_run+0x8b6c>	9473a8: R_X86_64_PLT32	__msan_warning-0x4
8b6c   9473ac:	e9 e9 7a ff ff       	jmp    93ee9a <___bpf_prog_run+0x65a>
8b71   9473b1:	e8 00 00 00 00       	call   9473b6 <___bpf_prog_run+0x8b76>	9473b2: R_X86_64_PLT32	__msan_warning-0x4
8b76   9473b6:	e9 0c 7b ff ff       	jmp    93eec7 <___bpf_prog_run+0x687>
8b7b   9473bb:	8b 3c 24             	mov    (%rsp),%edi
8b7e   9473be:	e8 00 00 00 00       	call   9473c3 <___bpf_prog_run+0x8b83>	9473bf: R_X86_64_PLT32	__msan_warning-0x4
8b83   9473c3:	e9 25 7b ff ff       	jmp    93eeed <___bpf_prog_run+0x6ad>
8b88   9473c8:	8b 3c 24             	mov    (%rsp),%edi
8b8b   9473cb:	e8 00 00 00 00       	call   9473d0 <___bpf_prog_run+0x8b90>	9473cc: R_X86_64_PLT32	__msan_warning-0x4
8b90   9473d0:	e9 85 7b ff ff       	jmp    93ef5a <___bpf_prog_run+0x71a>
8b95   9473d5:	8b 7c 24 04          	mov    0x4(%rsp),%edi
8b99   9473d9:	e8 00 00 00 00       	call   9473de <___bpf_prog_run+0x8b9e>	9473da: R_X86_64_PLT32	__msan_warning-0x4
8b9e   9473de:	e9 90 7b ff ff       	jmp    93ef73 <___bpf_prog_run+0x733>
8ba3   9473e3:	8b 7c 24 04          	mov    0x4(%rsp),%edi
8ba7   9473e7:	e8 00 00 00 00       	call   9473ec <___bpf_prog_run+0x8bac>	9473e8: R_X86_64_PLT32	__msan_warning-0x4
8bac   9473ec:	e9 ae 7b ff ff       	jmp    93ef9f <___bpf_prog_run+0x75f>
8bb1   9473f1:	8b 7c 24 04          	mov    0x4(%rsp),%edi
8bb5   9473f5:	e8 00 00 00 00       	call   9473fa <___bpf_prog_run+0x8bba>	9473f6: R_X86_64_PLT32	__msan_warning-0x4
8bba   9473fa:	e9 d1 7b ff ff       	jmp    93efd0 <___bpf_prog_run+0x790>
8bbf   9473ff:	8b 7c 24 04          	mov    0x4(%rsp),%edi
8bc3   947403:	e8 00 00 00 00       	call   947408 <___bpf_prog_run+0x8bc8>	947404: R_X86_64_PLT32	__msan_warning-0x4
8bc8   947408:	e9 ef 7b ff ff       	jmp    93effc <___bpf_prog_run+0x7bc>
8bcd   94740d:	8b 7c 24 04          	mov    0x4(%rsp),%edi
8bd1   947411:	e8 00 00 00 00       	call   947416 <___bpf_prog_run+0x8bd6>	947412: R_X86_64_PLT32	__msan_warning-0x4
8bd6   947416:	e9 0f 7c ff ff       	jmp    93f02a <___bpf_prog_run+0x7ea>
8bdb   94741b:	8b 7c 24 04          	mov    0x4(%rsp),%edi
8bdf   94741f:	e8 00 00 00 00       	call   947424 <___bpf_prog_run+0x8be4>	947420: R_X86_64_PLT32	__msan_warning-0x4
8be4   947424:	e9 ad 7c ff ff       	jmp    93f0d6 <___bpf_prog_run+0x896>
8be9   947429:	8b 3c 24             	mov    (%rsp),%edi
8bec   94742c:	e8 00 00 00 00       	call   947431 <___bpf_prog_run+0x8bf1>	94742d: R_X86_64_PLT32	__msan_warning-0x4
8bf1   947431:	e9 ed 7c ff ff       	jmp    93f123 <___bpf_prog_run+0x8e3>
8bf6   947436:	e8 00 00 00 00       	call   94743b <___bpf_prog_run+0x8bfb>	947437: R_X86_64_PLT32	__msan_warning-0x4
8bfb   94743b:	e9 10 7d ff ff       	jmp    93f150 <___bpf_prog_run+0x910>
8c00   947440:	8b 3c 24             	mov    (%rsp),%edi
8c03   947443:	e8 00 00 00 00       	call   947448 <___bpf_prog_run+0x8c08>	947444: R_X86_64_PLT32	__msan_warning-0x4
8c08   947448:	e9 2a 7d ff ff       	jmp    93f177 <___bpf_prog_run+0x937>
8c0d   94744d:	8b 3c 24             	mov    (%rsp),%edi
8c10   947450:	e8 00 00 00 00       	call   947455 <___bpf_prog_run+0x8c15>	947451: R_X86_64_PLT32	__msan_warning-0x4
8c15   947455:	e9 76 7d ff ff       	jmp    93f1d0 <___bpf_prog_run+0x990>
8c1a   94745a:	8b 3c 24             	mov    (%rsp),%edi
8c1d   94745d:	e8 00 00 00 00       	call   947462 <___bpf_prog_run+0x8c22>	94745e: R_X86_64_PLT32	__msan_warning-0x4
8c22   947462:	e9 92 7d ff ff       	jmp    93f1f9 <___bpf_prog_run+0x9b9>
8c27   947467:	e8 00 00 00 00       	call   94746c <___bpf_prog_run+0x8c2c>	947468: R_X86_64_PLT32	__msan_warning-0x4
8c2c   94746c:	e9 b5 7d ff ff       	jmp    93f226 <___bpf_prog_run+0x9e6>
8c31   947471:	8b 3c 24             	mov    (%rsp),%edi
8c34   947474:	e8 00 00 00 00       	call   947479 <___bpf_prog_run+0x8c39>	947475: R_X86_64_PLT32	__msan_warning-0x4
8c39   947479:	e9 d2 7d ff ff       	jmp    93f250 <___bpf_prog_run+0xa10>
8c3e   94747e:	44 89 ff             	mov    %r15d,%edi
8c41   947481:	e8 00 00 00 00       	call   947486 <___bpf_prog_run+0x8c46>	947482: R_X86_64_PLT32	__msan_warning-0x4
8c46   947486:	e9 e9 7d ff ff       	jmp    93f274 <___bpf_prog_run+0xa34>
8c4b   94748b:	49 89 d7             	mov    %rdx,%r15
8c4e   94748e:	8b 7c 24 38          	mov    0x38(%rsp),%edi
8c52   947492:	e8 00 00 00 00       	call   947497 <___bpf_prog_run+0x8c57>	947493: R_X86_64_PLT32	__msan_chain_origin-0x4
8c57   947497:	41 89 07             	mov    %eax,(%r15)
8c5a   94749a:	e9 eb 7d ff ff       	jmp    93f28a <___bpf_prog_run+0xa4a>
8c5f   94749f:	8b 3c 24             	mov    (%rsp),%edi
8c62   9474a2:	e8 00 00 00 00       	call   9474a7 <___bpf_prog_run+0x8c67>	9474a3: R_X86_64_PLT32	__msan_warning-0x4
8c67   9474a7:	e9 fc 7d ff ff       	jmp    93f2a8 <___bpf_prog_run+0xa68>
8c6c   9474ac:	44 89 f7             	mov    %r14d,%edi
8c6f   9474af:	e8 00 00 00 00       	call   9474b4 <___bpf_prog_run+0x8c74>	9474b0: R_X86_64_PLT32	__msan_warning-0x4
8c74   9474b4:	e9 22 7e ff ff       	jmp    93f2db <___bpf_prog_run+0xa9b>
8c79   9474b9:	44 89 f7             	mov    %r14d,%edi
8c7c   9474bc:	e8 00 00 00 00       	call   9474c1 <___bpf_prog_run+0x8c81>	9474bd: R_X86_64_PLT32	__msan_warning-0x4
8c81   9474c1:	e9 47 7e ff ff       	jmp    93f30d <___bpf_prog_run+0xacd>
8c86   9474c6:	8b 3c 24             	mov    (%rsp),%edi
8c89   9474c9:	e8 00 00 00 00       	call   9474ce <___bpf_prog_run+0x8c8e>	9474ca: R_X86_64_PLT32	__msan_warning-0x4
8c8e   9474ce:	e9 6b 7e ff ff       	jmp    93f33e <___bpf_prog_run+0xafe>
8c93   9474d3:	89 df                	mov    %ebx,%edi
8c95   9474d5:	e8 00 00 00 00       	call   9474da <___bpf_prog_run+0x8c9a>	9474d6: R_X86_64_PLT32	__msan_warning-0x4
8c9a   9474da:	e9 90 7e ff ff       	jmp    93f36f <___bpf_prog_run+0xb2f>
8c9f   9474df:	8b 3c 24             	mov    (%rsp),%edi
8ca2   9474e2:	e8 00 00 00 00       	call   9474e7 <___bpf_prog_run+0x8ca7>	9474e3: R_X86_64_PLT32	__msan_warning-0x4
8ca7   9474e7:	e9 bb 7e ff ff       	jmp    93f3a7 <___bpf_prog_run+0xb67>
8cac   9474ec:	8b 7c 24 38          	mov    0x38(%rsp),%edi
8cb0   9474f0:	e8 00 00 00 00       	call   9474f5 <___bpf_prog_run+0x8cb5>	9474f1: R_X86_64_PLT32	__msan_warning-0x4
8cb5   9474f5:	e9 e8 7e ff ff       	jmp    93f3e2 <___bpf_prog_run+0xba2>
8cba   9474fa:	49 89 d7             	mov    %rdx,%r15
8cbd   9474fd:	8b 7c 24 08          	mov    0x8(%rsp),%edi
8cc1   947501:	e8 00 00 00 00       	call   947506 <___bpf_prog_run+0x8cc6>	947502: R_X86_64_PLT32	__msan_chain_origin-0x4
8cc6   947506:	89 c0                	mov    %eax,%eax
8cc8   947508:	48 89 c1             	mov    %rax,%rcx
8ccb   94750b:	48 c1 e1 20          	shl    $0x20,%rcx
8ccf   94750f:	48 09 c1             	or     %rax,%rcx
8cd2   947512:	49 89 0f             	mov    %rcx,(%r15)
8cd5   947515:	e9 e9 7e ff ff       	jmp    93f403 <___bpf_prog_run+0xbc3>
8cda   94751a:	8b 3c 24             	mov    (%rsp),%edi
8cdd   94751d:	e8 00 00 00 00       	call   947522 <___bpf_prog_run+0x8ce2>	94751e: R_X86_64_PLT32	__msan_warning-0x4
8ce2   947522:	e9 f2 7e ff ff       	jmp    93f419 <___bpf_prog_run+0xbd9>
8ce7   947527:	e8 00 00 00 00       	call   94752c <___bpf_prog_run+0x8cec>	947528: R_X86_64_PLT32	__msan_warning-0x4
8cec   94752c:	e9 24 7f ff ff       	jmp    93f455 <___bpf_prog_run+0xc15>
8cf1   947531:	44 89 e7             	mov    %r12d,%edi
8cf4   947534:	e8 00 00 00 00       	call   947539 <___bpf_prog_run+0x8cf9>	947535: R_X86_64_PLT32	__msan_warning-0x4
8cf9   947539:	e9 5a 7f ff ff       	jmp    93f498 <___bpf_prog_run+0xc58>
8cfe   94753e:	8b 3c 24             	mov    (%rsp),%edi
8d01   947541:	e8 00 00 00 00       	call   947546 <___bpf_prog_run+0x8d06>	947542: R_X86_64_PLT32	__msan_warning-0x4
8d06   947546:	e9 d2 7f ff ff       	jmp    93f51d <___bpf_prog_run+0xcdd>
8d0b   94754b:	8b 3c 24             	mov    (%rsp),%edi
8d0e   94754e:	e8 00 00 00 00       	call   947553 <___bpf_prog_run+0x8d13>	94754f: R_X86_64_PLT32	__msan_warning-0x4
8d13   947553:	e9 f1 7f ff ff       	jmp    93f549 <___bpf_prog_run+0xd09>
8d18   947558:	e8 00 00 00 00       	call   94755d <___bpf_prog_run+0x8d1d>	947559: R_X86_64_PLT32	__msan_warning-0x4
8d1d   94755d:	e9 14 80 ff ff       	jmp    93f576 <___bpf_prog_run+0xd36>
8d22   947562:	8b 3c 24             	mov    (%rsp),%edi
8d25   947565:	e8 00 00 00 00       	call   94756a <___bpf_prog_run+0x8d2a>	947566: R_X86_64_PLT32	__msan_warning-0x4
8d2a   94756a:	e9 2e 80 ff ff       	jmp    93f59d <___bpf_prog_run+0xd5d>
8d2f   94756f:	44 89 ff             	mov    %r15d,%edi
8d32   947572:	e8 00 00 00 00       	call   947577 <___bpf_prog_run+0x8d37>	947573: R_X86_64_PLT32	__msan_warning-0x4
8d37   947577:	e9 45 80 ff ff       	jmp    93f5c1 <___bpf_prog_run+0xd81>
8d3c   94757c:	48 89 d3             	mov    %rdx,%rbx
8d3f   94757f:	8b 7c 24 38          	mov    0x38(%rsp),%edi
8d43   947583:	e8 00 00 00 00       	call   947588 <___bpf_prog_run+0x8d48>	947584: R_X86_64_PLT32	__msan_chain_origin-0x4
8d48   947588:	89 c0                	mov    %eax,%eax
8d4a   94758a:	48 89 c1             	mov    %rax,%rcx
8d4d   94758d:	48 c1 e1 20          	shl    $0x20,%rcx
8d51   947591:	48 09 c1             	or     %rax,%rcx
8d54   947594:	48 89 0b             	mov    %rcx,(%rbx)
8d57   947597:	e9 3e 80 ff ff       	jmp    93f5da <___bpf_prog_run+0xd9a>
8d5c   94759c:	8b 3c 24             	mov    (%rsp),%edi
8d5f   94759f:	e8 00 00 00 00       	call   9475a4 <___bpf_prog_run+0x8d64>	9475a0: R_X86_64_PLT32	__msan_warning-0x4
8d64   9475a4:	e9 4f 80 ff ff       	jmp    93f5f8 <___bpf_prog_run+0xdb8>
8d69   9475a9:	e8 00 00 00 00       	call   9475ae <___bpf_prog_run+0x8d6e>	9475aa: R_X86_64_PLT32	__msan_warning-0x4
8d6e   9475ae:	e9 72 80 ff ff       	jmp    93f625 <___bpf_prog_run+0xde5>
8d73   9475b3:	8b 3c 24             	mov    (%rsp),%edi
8d76   9475b6:	e8 00 00 00 00       	call   9475bb <___bpf_prog_run+0x8d7b>	9475b7: R_X86_64_PLT32	__msan_warning-0x4
8d7b   9475bb:	e9 8c 80 ff ff       	jmp    93f64c <___bpf_prog_run+0xe0c>
8d80   9475c0:	8b 3c 24             	mov    (%rsp),%edi
8d83   9475c3:	e8 00 00 00 00       	call   9475c8 <___bpf_prog_run+0x8d88>	9475c4: R_X86_64_PLT32	__msan_warning-0x4
8d88   9475c8:	e9 f5 80 ff ff       	jmp    93f6c2 <___bpf_prog_run+0xe82>
8d8d   9475cd:	8b 3c 24             	mov    (%rsp),%edi
8d90   9475d0:	e8 00 00 00 00       	call   9475d5 <___bpf_prog_run+0x8d95>	9475d1: R_X86_64_PLT32	__msan_warning-0x4
8d95   9475d5:	e9 15 81 ff ff       	jmp    93f6ef <___bpf_prog_run+0xeaf>
8d9a   9475da:	e8 00 00 00 00       	call   9475df <___bpf_prog_run+0x8d9f>	9475db: R_X86_64_PLT32	__msan_warning-0x4
8d9f   9475df:	e9 38 81 ff ff       	jmp    93f71c <___bpf_prog_run+0xedc>
8da4   9475e4:	8b 3c 24             	mov    (%rsp),%edi
8da7   9475e7:	e8 00 00 00 00       	call   9475ec <___bpf_prog_run+0x8dac>	9475e8: R_X86_64_PLT32	__msan_warning-0x4
8dac   9475ec:	e9 55 81 ff ff       	jmp    93f746 <___bpf_prog_run+0xf06>
8db1   9475f1:	44 89 ff             	mov    %r15d,%edi
8db4   9475f4:	e8 00 00 00 00       	call   9475f9 <___bpf_prog_run+0x8db9>	9475f5: R_X86_64_PLT32	__msan_warning-0x4
8db9   9475f9:	e9 6c 81 ff ff       	jmp    93f76a <___bpf_prog_run+0xf2a>
8dbe   9475fe:	49 89 d7             	mov    %rdx,%r15
8dc1   947601:	8b 7c 24 38          	mov    0x38(%rsp),%edi
8dc5   947605:	e8 00 00 00 00       	call   94760a <___bpf_prog_run+0x8dca>	947606: R_X86_64_PLT32	__msan_chain_origin-0x4
8dca   94760a:	41 89 07             	mov    %eax,(%r15)
8dcd   94760d:	e9 71 81 ff ff       	jmp    93f783 <___bpf_prog_run+0xf43>
8dd2   947612:	8b 3c 24             	mov    (%rsp),%edi
8dd5   947615:	e8 00 00 00 00       	call   94761a <___bpf_prog_run+0x8dda>	947616: R_X86_64_PLT32	__msan_warning-0x4
8dda   94761a:	e9 89 81 ff ff       	jmp    93f7a8 <___bpf_prog_run+0xf68>
8ddf   94761f:	e8 00 00 00 00       	call   947624 <___bpf_prog_run+0x8de4>	947620: R_X86_64_PLT32	__msan_warning-0x4
8de4   947624:	e9 bc 81 ff ff       	jmp    93f7e5 <___bpf_prog_run+0xfa5>
8de9   947629:	44 89 ff             	mov    %r15d,%edi
8dec   94762c:	e8 00 00 00 00       	call   947631 <___bpf_prog_run+0x8df1>	94762d: R_X86_64_PLT32	__msan_warning-0x4
8df1   947631:	e9 e9 81 ff ff       	jmp    93f81f <___bpf_prog_run+0xfdf>
8df6   947636:	8b 3c 24             	mov    (%rsp),%edi
8df9   947639:	e8 00 00 00 00       	call   94763e <___bpf_prog_run+0x8dfe>	94763a: R_X86_64_PLT32	__msan_warning-0x4
8dfe   94763e:	e9 0c 82 ff ff       	jmp    93f84f <___bpf_prog_run+0x100f>
8e03   947643:	44 89 ff             	mov    %r15d,%edi
8e06   947646:	e8 00 00 00 00       	call   94764b <___bpf_prog_run+0x8e0b>	947647: R_X86_64_PLT32	__msan_warning-0x4
8e0b   94764b:	e9 23 82 ff ff       	jmp    93f873 <___bpf_prog_run+0x1033>
8e10   947650:	49 89 d7             	mov    %rdx,%r15
8e13   947653:	8b 7c 24 38          	mov    0x38(%rsp),%edi
8e17   947657:	e8 00 00 00 00       	call   94765c <___bpf_prog_run+0x8e1c>	947658: R_X86_64_PLT32	__msan_chain_origin-0x4
8e1c   94765c:	41 89 07             	mov    %eax,(%r15)
8e1f   94765f:	e9 2a 82 ff ff       	jmp    93f88e <___bpf_prog_run+0x104e>
8e24   947664:	8b 3c 24             	mov    (%rsp),%edi
8e27   947667:	e8 00 00 00 00       	call   94766c <___bpf_prog_run+0x8e2c>	947668: R_X86_64_PLT32	__msan_warning-0x4
8e2c   94766c:	e9 3a 82 ff ff       	jmp    93f8ab <___bpf_prog_run+0x106b>
8e31   947671:	e8 00 00 00 00       	call   947676 <___bpf_prog_run+0x8e36>	947672: R_X86_64_PLT32	__msan_warning-0x4
8e36   947676:	e9 5d 82 ff ff       	jmp    93f8d8 <___bpf_prog_run+0x1098>
8e3b   94767b:	8b 3c 24             	mov    (%rsp),%edi
8e3e   94767e:	e8 00 00 00 00       	call   947683 <___bpf_prog_run+0x8e43>	94767f: R_X86_64_PLT32	__msan_warning-0x4
8e43   947683:	e9 76 82 ff ff       	jmp    93f8fe <___bpf_prog_run+0x10be>
8e48   947688:	8b 3c 24             	mov    (%rsp),%edi
8e4b   94768b:	e8 00 00 00 00       	call   947690 <___bpf_prog_run+0x8e50>	94768c: R_X86_64_PLT32	__msan_warning-0x4
8e50   947690:	e9 cf 82 ff ff       	jmp    93f964 <___bpf_prog_run+0x1124>
8e55   947695:	e8 00 00 00 00       	call   94769a <___bpf_prog_run+0x8e5a>	947696: R_X86_64_PLT32	__msan_warning-0x4
8e5a   94769a:	e9 03 83 ff ff       	jmp    93f9a2 <___bpf_prog_run+0x1162>
8e5f   94769f:	44 89 e7             	mov    %r12d,%edi
8e62   9476a2:	e8 00 00 00 00       	call   9476a7 <___bpf_prog_run+0x8e67>	9476a3: R_X86_64_PLT32	__msan_warning-0x4
8e67   9476a7:	e9 2f 83 ff ff       	jmp    93f9db <___bpf_prog_run+0x119b>
8e6c   9476ac:	8b 3c 24             	mov    (%rsp),%edi
8e6f   9476af:	e8 00 00 00 00       	call   9476b4 <___bpf_prog_run+0x8e74>	9476b0: R_X86_64_PLT32	__msan_warning-0x4
8e74   9476b4:	e9 99 83 ff ff       	jmp    93fa52 <___bpf_prog_run+0x1212>
8e79   9476b9:	e8 00 00 00 00       	call   9476be <___bpf_prog_run+0x8e7e>	9476ba: R_X86_64_PLT32	__msan_warning-0x4
8e7e   9476be:	e9 bc 83 ff ff       	jmp    93fa7f <___bpf_prog_run+0x123f>
8e83   9476c3:	8b 3c 24             	mov    (%rsp),%edi
8e86   9476c6:	e8 00 00 00 00       	call   9476cb <___bpf_prog_run+0x8e8b>	9476c7: R_X86_64_PLT32	__msan_warning-0x4
8e8b   9476cb:	e9 d6 83 ff ff       	jmp    93faa6 <___bpf_prog_run+0x1266>
8e90   9476d0:	8b 3c 24             	mov    (%rsp),%edi
8e93   9476d3:	e8 00 00 00 00       	call   9476d8 <___bpf_prog_run+0x8e98>	9476d4: R_X86_64_PLT32	__msan_warning-0x4
8e98   9476d8:	e9 3c 84 ff ff       	jmp    93fb19 <___bpf_prog_run+0x12d9>
8e9d   9476dd:	89 df                	mov    %ebx,%edi
8e9f   9476df:	e8 00 00 00 00       	call   9476e4 <___bpf_prog_run+0x8ea4>	9476e0: R_X86_64_PLT32	__msan_warning-0x4
8ea4   9476e4:	e9 5f 84 ff ff       	jmp    93fb48 <___bpf_prog_run+0x1308>
8ea9   9476e9:	8b 3c 24             	mov    (%rsp),%edi
8eac   9476ec:	e8 00 00 00 00       	call   9476f1 <___bpf_prog_run+0x8eb1>	9476ed: R_X86_64_PLT32	__msan_warning-0x4
8eb1   9476f1:	e9 83 84 ff ff       	jmp    93fb79 <___bpf_prog_run+0x1339>
8eb6   9476f6:	8b 3c 24             	mov    (%rsp),%edi
8eb9   9476f9:	e8 00 00 00 00       	call   9476fe <___bpf_prog_run+0x8ebe>	9476fa: R_X86_64_PLT32	__msan_warning-0x4
8ebe   9476fe:	e9 b4 84 ff ff       	jmp    93fbb7 <___bpf_prog_run+0x1377>
8ec3   947703:	e8 00 00 00 00       	call   947708 <___bpf_prog_run+0x8ec8>	947704: R_X86_64_PLT32	__msan_warning-0x4
8ec8   947708:	e9 d7 84 ff ff       	jmp    93fbe4 <___bpf_prog_run+0x13a4>
8ecd   94770d:	8b 3c 24             	mov    (%rsp),%edi
8ed0   947710:	e8 00 00 00 00       	call   947715 <___bpf_prog_run+0x8ed5>	947711: R_X86_64_PLT32	__msan_warning-0x4
8ed5   947715:	e9 f0 84 ff ff       	jmp    93fc0a <___bpf_prog_run+0x13ca>
8eda   94771a:	8b 3c 24             	mov    (%rsp),%edi
8edd   94771d:	e8 00 00 00 00       	call   947722 <___bpf_prog_run+0x8ee2>	94771e: R_X86_64_PLT32	__msan_warning-0x4
8ee2   947722:	e9 50 85 ff ff       	jmp    93fc77 <___bpf_prog_run+0x1437>
8ee7   947727:	e8 00 00 00 00       	call   94772c <___bpf_prog_run+0x8eec>	947728: R_X86_64_PLT32	__msan_warning-0x4
8eec   94772c:	e9 8d 85 ff ff       	jmp    93fcbe <___bpf_prog_run+0x147e>
8ef1   947731:	8b 3c 24             	mov    (%rsp),%edi
8ef4   947734:	e8 00 00 00 00       	call   947739 <___bpf_prog_run+0x8ef9>	947735: R_X86_64_PLT32	__msan_warning-0x4
8ef9   947739:	e9 b0 85 ff ff       	jmp    93fcee <___bpf_prog_run+0x14ae>
8efe   94773e:	8b 3c 24             	mov    (%rsp),%edi
8f01   947741:	e8 00 00 00 00       	call   947746 <___bpf_prog_run+0x8f06>	947742: R_X86_64_PLT32	__msan_warning-0x4
8f06   947746:	e9 34 86 ff ff       	jmp    93fd7f <___bpf_prog_run+0x153f>
8f0b   94774b:	8b 7c 24 40          	mov    0x40(%rsp),%edi
8f0f   94774f:	e8 00 00 00 00       	call   947754 <___bpf_prog_run+0x8f14>	947750: R_X86_64_PLT32	__msan_warning-0x4
8f14   947754:	e9 62 86 ff ff       	jmp    93fdbb <___bpf_prog_run+0x157b>
8f19   947759:	44 89 f7             	mov    %r14d,%edi
8f1c   94775c:	e8 00 00 00 00       	call   947761 <___bpf_prog_run+0x8f21>	94775d: R_X86_64_PLT32	__msan_warning-0x4
8f21   947761:	e9 93 86 ff ff       	jmp    93fdf9 <___bpf_prog_run+0x15b9>
8f26   947766:	8b 7c 24 40          	mov    0x40(%rsp),%edi
8f2a   94776a:	e8 00 00 00 00       	call   94776f <___bpf_prog_run+0x8f2f>	94776b: R_X86_64_PLT32	__msan_warning-0x4
8f2f   94776f:	e9 ca 86 ff ff       	jmp    93fe3e <___bpf_prog_run+0x15fe>
8f34   947774:	8b 3c 24             	mov    (%rsp),%edi
8f37   947777:	e8 00 00 00 00       	call   94777c <___bpf_prog_run+0x8f3c>	947778: R_X86_64_PLT32	__msan_warning-0x4
8f3c   94777c:	e9 f2 86 ff ff       	jmp    93fe73 <___bpf_prog_run+0x1633>
8f41   947781:	e8 00 00 00 00       	call   947786 <___bpf_prog_run+0x8f46>	947782: R_X86_64_PLT32	__msan_warning-0x4
8f46   947786:	e9 24 87 ff ff       	jmp    93feaf <___bpf_prog_run+0x166f>
8f4b   94778b:	44 89 e7             	mov    %r12d,%edi
8f4e   94778e:	e8 00 00 00 00       	call   947793 <___bpf_prog_run+0x8f53>	94778f: R_X86_64_PLT32	__msan_warning-0x4
8f53   947793:	e9 58 87 ff ff       	jmp    93fef0 <___bpf_prog_run+0x16b0>
8f58   947798:	8b 7c 24 08          	mov    0x8(%rsp),%edi
8f5c   94779c:	e8 00 00 00 00       	call   9477a1 <___bpf_prog_run+0x8f61>	94779d: R_X86_64_PLT32	__msan_warning-0x4
8f61   9477a1:	e9 76 87 ff ff       	jmp    93ff1c <___bpf_prog_run+0x16dc>
8f66   9477a6:	8b 3c 24             	mov    (%rsp),%edi
8f69   9477a9:	e8 00 00 00 00       	call   9477ae <___bpf_prog_run+0x8f6e>	9477aa: R_X86_64_PLT32	__msan_warning-0x4
8f6e   9477ae:	e9 93 87 ff ff       	jmp    93ff46 <___bpf_prog_run+0x1706>
8f73   9477b3:	e8 00 00 00 00       	call   9477b8 <___bpf_prog_run+0x8f78>	9477b4: R_X86_64_PLT32	__msan_warning-0x4
8f78   9477b8:	e9 b6 87 ff ff       	jmp    93ff73 <___bpf_prog_run+0x1733>
8f7d   9477bd:	8b 3c 24             	mov    (%rsp),%edi
8f80   9477c0:	e8 00 00 00 00       	call   9477c5 <___bpf_prog_run+0x8f85>	9477c1: R_X86_64_PLT32	__msan_warning-0x4
8f85   9477c5:	e9 d0 87 ff ff       	jmp    93ff9a <___bpf_prog_run+0x175a>
8f8a   9477ca:	44 89 f7             	mov    %r14d,%edi
8f8d   9477cd:	e8 00 00 00 00       	call   9477d2 <___bpf_prog_run+0x8f92>	9477ce: R_X86_64_PLT32	__msan_warning-0x4
8f92   9477d2:	85 db                	test   %ebx,%ebx
8f94   9477d4:	0f 85 fa 87 ff ff    	jne    93ffd4 <___bpf_prog_run+0x1794>
8f9a   9477da:	e8 00 00 00 00       	call   9477df <___bpf_prog_run+0x8f9f>	9477db: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
8f9f   9477df:	e9 12 71 ff ff       	jmp    93e8f6 <___bpf_prog_run+0xb6>
8fa4   9477e4:	8b 3c 24             	mov    (%rsp),%edi
8fa7   9477e7:	e8 00 00 00 00       	call   9477ec <___bpf_prog_run+0x8fac>	9477e8: R_X86_64_PLT32	__msan_warning-0x4
8fac   9477ec:	e9 19 88 ff ff       	jmp    94000a <___bpf_prog_run+0x17ca>
8fb1   9477f1:	e8 00 00 00 00       	call   9477f6 <___bpf_prog_run+0x8fb6>	9477f2: R_X86_64_PLT32	__msan_warning-0x4
8fb6   9477f6:	e9 4e 88 ff ff       	jmp    940049 <___bpf_prog_run+0x1809>
8fbb   9477fb:	8b 3c 24             	mov    (%rsp),%edi
8fbe   9477fe:	e8 00 00 00 00       	call   947803 <___bpf_prog_run+0x8fc3>	9477ff: R_X86_64_PLT32	__msan_warning-0x4
8fc3   947803:	e9 a2 88 ff ff       	jmp    9400aa <___bpf_prog_run+0x186a>
8fc8   947808:	e8 00 00 00 00       	call   94780d <___bpf_prog_run+0x8fcd>	947809: R_X86_64_PLT32	__msan_warning-0x4
8fcd   94780d:	e9 d6 88 ff ff       	jmp    9400e8 <___bpf_prog_run+0x18a8>
8fd2   947812:	44 89 e7             	mov    %r12d,%edi
8fd5   947815:	e8 00 00 00 00       	call   94781a <___bpf_prog_run+0x8fda>	947816: R_X86_64_PLT32	__msan_warning-0x4
8fda   94781a:	e9 02 89 ff ff       	jmp    940121 <___bpf_prog_run+0x18e1>
8fdf   94781f:	8b 3c 24             	mov    (%rsp),%edi
8fe2   947822:	e8 00 00 00 00       	call   947827 <___bpf_prog_run+0x8fe7>	947823: R_X86_64_PLT32	__msan_warning-0x4
8fe7   947827:	e9 51 89 ff ff       	jmp    94017d <___bpf_prog_run+0x193d>
8fec   94782c:	e8 00 00 00 00       	call   947831 <___bpf_prog_run+0x8ff1>	94782d: R_X86_64_PLT32	__msan_warning-0x4
8ff1   947831:	e9 83 89 ff ff       	jmp    9401b9 <___bpf_prog_run+0x1979>
8ff6   947836:	44 89 e7             	mov    %r12d,%edi
8ff9   947839:	e8 00 00 00 00       	call   94783e <___bpf_prog_run+0x8ffe>	94783a: R_X86_64_PLT32	__msan_warning-0x4
8ffe   94783e:	e9 b9 89 ff ff       	jmp    9401fc <___bpf_prog_run+0x19bc>
9003   947843:	8b 7c 24 08          	mov    0x8(%rsp),%edi
9007   947847:	e8 00 00 00 00       	call   94784c <___bpf_prog_run+0x900c>	947848: R_X86_64_PLT32	__msan_warning-0x4
900c   94784c:	e9 da 89 ff ff       	jmp    94022b <___bpf_prog_run+0x19eb>
9011   947851:	8b 3c 24             	mov    (%rsp),%edi
9014   947854:	e8 00 00 00 00       	call   947859 <___bpf_prog_run+0x9019>	947855: R_X86_64_PLT32	__msan_warning-0x4
9019   947859:	e9 0e 8a ff ff       	jmp    94026c <___bpf_prog_run+0x1a2c>
901e   94785e:	44 89 f7             	mov    %r14d,%edi
9021   947861:	e8 00 00 00 00       	call   947866 <___bpf_prog_run+0x9026>	947862: R_X86_64_PLT32	__msan_warning-0x4
9026   947866:	e9 30 8a ff ff       	jmp    94029b <___bpf_prog_run+0x1a5b>
902b   94786b:	8b 3c 24             	mov    (%rsp),%edi
902e   94786e:	e8 00 00 00 00       	call   947873 <___bpf_prog_run+0x9033>	94786f: R_X86_64_PLT32	__msan_warning-0x4
9033   947873:	e9 5c 8a ff ff       	jmp    9402d4 <___bpf_prog_run+0x1a94>
9038   947878:	8b 7c 24 38          	mov    0x38(%rsp),%edi
903c   94787c:	e8 00 00 00 00       	call   947881 <___bpf_prog_run+0x9041>	94787d: R_X86_64_PLT32	__msan_warning-0x4
9041   947881:	e9 8b 8a ff ff       	jmp    940311 <___bpf_prog_run+0x1ad1>
9046   947886:	48 89 d5             	mov    %rdx,%rbp
9049   947889:	8b 7c 24 08          	mov    0x8(%rsp),%edi
904d   94788d:	e8 00 00 00 00       	call   947892 <___bpf_prog_run+0x9052>	94788e: R_X86_64_PLT32	__msan_chain_origin-0x4
9052   947892:	89 c0                	mov    %eax,%eax
9054   947894:	48 89 c1             	mov    %rax,%rcx
9057   947897:	48 c1 e1 20          	shl    $0x20,%rcx
905b   94789b:	48 09 c1             	or     %rax,%rcx
905e   94789e:	48 89 4d 00          	mov    %rcx,0x0(%rbp)
9062   9478a2:	e9 86 8a ff ff       	jmp    94032d <___bpf_prog_run+0x1aed>
9067   9478a7:	8b 3c 24             	mov    (%rsp),%edi
906a   9478aa:	e8 00 00 00 00       	call   9478af <___bpf_prog_run+0x906f>	9478ab: R_X86_64_PLT32	__msan_warning-0x4
906f   9478af:	e9 8e 8a ff ff       	jmp    940342 <___bpf_prog_run+0x1b02>
9074   9478b4:	e8 00 00 00 00       	call   9478b9 <___bpf_prog_run+0x9079>	9478b5: R_X86_64_PLT32	__msan_warning-0x4
9079   9478b9:	e9 c0 8a ff ff       	jmp    94037e <___bpf_prog_run+0x1b3e>
907e   9478be:	44 89 e7             	mov    %r12d,%edi
9081   9478c1:	e8 00 00 00 00       	call   9478c6 <___bpf_prog_run+0x9086>	9478c2: R_X86_64_PLT32	__msan_warning-0x4
9086   9478c6:	e9 f3 8a ff ff       	jmp    9403be <___bpf_prog_run+0x1b7e>
908b   9478cb:	8b 7c 24 08          	mov    0x8(%rsp),%edi
908f   9478cf:	e8 00 00 00 00       	call   9478d4 <___bpf_prog_run+0x9094>	9478d0: R_X86_64_PLT32	__msan_warning-0x4
9094   9478d4:	4c 39 fd             	cmp    %r15,%rbp
9097   9478d7:	0f 84 34 8b ff ff    	je     940411 <___bpf_prog_run+0x1bd1>
909d   9478dd:	e8 00 00 00 00       	call   9478e2 <___bpf_prog_run+0x90a2>	9478de: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
90a2   9478e2:	49 8d 5d 02          	lea    0x2(%r13),%rbx
90a6   9478e6:	4d 85 f6             	test   %r14,%r14
90a9   9478e9:	0f 84 cc 0e 00 00    	je     9487bb <___bpf_prog_run+0x9f7b>
90af   9478ef:	8b 3c 24             	mov    (%rsp),%edi
90b2   9478f2:	e8 00 00 00 00       	call   9478f7 <___bpf_prog_run+0x90b7>	9478f3: R_X86_64_PLT32	__msan_warning-0x4
90b7   9478f7:	e9 bf 0e 00 00       	jmp    9487bb <___bpf_prog_run+0x9f7b>
90bc   9478fc:	8b 3c 24             	mov    (%rsp),%edi
90bf   9478ff:	e8 00 00 00 00       	call   947904 <___bpf_prog_run+0x90c4>	947900: R_X86_64_PLT32	__msan_warning-0x4
90c4   947904:	e9 23 8b ff ff       	jmp    94042c <___bpf_prog_run+0x1bec>
90c9   947909:	e8 00 00 00 00       	call   94790e <___bpf_prog_run+0x90ce>	94790a: R_X86_64_PLT32	__msan_warning-0x4
90ce   94790e:	e9 46 8b ff ff       	jmp    940459 <___bpf_prog_run+0x1c19>
90d3   947913:	8b 3c 24             	mov    (%rsp),%edi
90d6   947916:	e8 00 00 00 00       	call   94791b <___bpf_prog_run+0x90db>	947917: R_X86_64_PLT32	__msan_warning-0x4
90db   94791b:	e9 60 8b ff ff       	jmp    940480 <___bpf_prog_run+0x1c40>
90e0   947920:	8b 3c 24             	mov    (%rsp),%edi
90e3   947923:	e8 00 00 00 00       	call   947928 <___bpf_prog_run+0x90e8>	947924: R_X86_64_PLT32	__msan_warning-0x4
90e8   947928:	e9 c1 8b ff ff       	jmp    9404ee <___bpf_prog_run+0x1cae>
90ed   94792d:	e8 00 00 00 00       	call   947932 <___bpf_prog_run+0x90f2>	94792e: R_X86_64_PLT32	__msan_warning-0x4
90f2   947932:	e9 f3 8b ff ff       	jmp    94052a <___bpf_prog_run+0x1cea>
90f7   947937:	44 89 e7             	mov    %r12d,%edi
90fa   94793a:	e8 00 00 00 00       	call   94793f <___bpf_prog_run+0x90ff>	94793b: R_X86_64_PLT32	__msan_warning-0x4
90ff   94793f:	e9 27 8c ff ff       	jmp    94056b <___bpf_prog_run+0x1d2b>
9104   947944:	8b 7c 24 08          	mov    0x8(%rsp),%edi
9108   947948:	e8 00 00 00 00       	call   94794d <___bpf_prog_run+0x910d>	947949: R_X86_64_PLT32	__msan_warning-0x4
910d   94794d:	e9 45 8c ff ff       	jmp    940597 <___bpf_prog_run+0x1d57>
9112   947952:	8b 3c 24             	mov    (%rsp),%edi
9115   947955:	e8 00 00 00 00       	call   94795a <___bpf_prog_run+0x911a>	947956: R_X86_64_PLT32	__msan_warning-0x4
911a   94795a:	e9 73 8c ff ff       	jmp    9405d2 <___bpf_prog_run+0x1d92>
911f   94795f:	e8 00 00 00 00       	call   947964 <___bpf_prog_run+0x9124>	947960: R_X86_64_PLT32	__msan_warning-0x4
9124   947964:	e9 96 8c ff ff       	jmp    9405ff <___bpf_prog_run+0x1dbf>
9129   947969:	8b 3c 24             	mov    (%rsp),%edi
912c   94796c:	e8 00 00 00 00       	call   947971 <___bpf_prog_run+0x9131>	94796d: R_X86_64_PLT32	__msan_warning-0x4
9131   947971:	e9 af 8c ff ff       	jmp    940625 <___bpf_prog_run+0x1de5>
9136   947976:	8b 3c 24             	mov    (%rsp),%edi
9139   947979:	e8 00 00 00 00       	call   94797e <___bpf_prog_run+0x913e>	94797a: R_X86_64_PLT32	__msan_warning-0x4
913e   94797e:	e9 f3 8c ff ff       	jmp    940676 <___bpf_prog_run+0x1e36>
9143   947983:	e8 00 00 00 00       	call   947988 <___bpf_prog_run+0x9148>	947984: R_X86_64_PLT32	__msan_warning-0x4
9148   947988:	e9 2e 8d ff ff       	jmp    9406bb <___bpf_prog_run+0x1e7b>
914d   94798d:	8b 3c 24             	mov    (%rsp),%edi
9150   947990:	e8 00 00 00 00       	call   947995 <___bpf_prog_run+0x9155>	947991: R_X86_64_PLT32	__msan_warning-0x4
9155   947995:	e9 50 8d ff ff       	jmp    9406ea <___bpf_prog_run+0x1eaa>
915a   94799a:	8b 3c 24             	mov    (%rsp),%edi
915d   94799d:	e8 00 00 00 00       	call   9479a2 <___bpf_prog_run+0x9162>	94799e: R_X86_64_PLT32	__msan_warning-0x4
9162   9479a2:	e9 c1 8d ff ff       	jmp    940768 <___bpf_prog_run+0x1f28>
9167   9479a7:	44 89 ff             	mov    %r15d,%edi
916a   9479aa:	e8 00 00 00 00       	call   9479af <___bpf_prog_run+0x916f>	9479ab: R_X86_64_PLT32	__msan_warning-0x4
916f   9479af:	e9 ea 8d ff ff       	jmp    94079e <___bpf_prog_run+0x1f5e>
9174   9479b4:	8b 3c 24             	mov    (%rsp),%edi
9177   9479b7:	e8 00 00 00 00       	call   9479bc <___bpf_prog_run+0x917c>	9479b8: R_X86_64_PLT32	__msan_warning-0x4
917c   9479bc:	e9 4c 8e ff ff       	jmp    94080d <___bpf_prog_run+0x1fcd>
9181   9479c1:	e8 00 00 00 00       	call   9479c6 <___bpf_prog_run+0x9186>	9479c2: R_X86_64_PLT32	__msan_warning-0x4
9186   9479c6:	e9 7e 8e ff ff       	jmp    940849 <___bpf_prog_run+0x2009>
918b   9479cb:	44 89 e7             	mov    %r12d,%edi
918e   9479ce:	e8 00 00 00 00       	call   9479d3 <___bpf_prog_run+0x9193>	9479cf: R_X86_64_PLT32	__msan_warning-0x4
9193   9479d3:	e9 b2 8e ff ff       	jmp    94088a <___bpf_prog_run+0x204a>
9198   9479d8:	8b 7c 24 08          	mov    0x8(%rsp),%edi
919c   9479dc:	e8 00 00 00 00       	call   9479e1 <___bpf_prog_run+0x91a1>	9479dd: R_X86_64_PLT32	__msan_warning-0x4
91a1   9479e1:	e9 d0 8e ff ff       	jmp    9408b6 <___bpf_prog_run+0x2076>
91a6   9479e6:	8b 3c 24             	mov    (%rsp),%edi
91a9   9479e9:	e8 00 00 00 00       	call   9479ee <___bpf_prog_run+0x91ae>	9479ea: R_X86_64_PLT32	__msan_warning-0x4
91ae   9479ee:	e9 03 8f ff ff       	jmp    9408f6 <___bpf_prog_run+0x20b6>
91b3   9479f3:	89 df                	mov    %ebx,%edi
91b5   9479f5:	e8 00 00 00 00       	call   9479fa <___bpf_prog_run+0x91ba>	9479f6: R_X86_64_PLT32	__msan_warning-0x4
91ba   9479fa:	e9 32 8f ff ff       	jmp    940931 <___bpf_prog_run+0x20f1>
91bf   9479ff:	44 89 e7             	mov    %r12d,%edi
91c2   947a02:	e8 00 00 00 00       	call   947a07 <___bpf_prog_run+0x91c7>	947a03: R_X86_64_PLT32	__msan_warning-0x4
91c7   947a07:	e9 69 8f ff ff       	jmp    940975 <___bpf_prog_run+0x2135>
91cc   947a0c:	8b 7c 24 40          	mov    0x40(%rsp),%edi
91d0   947a10:	e8 00 00 00 00       	call   947a15 <___bpf_prog_run+0x91d5>	947a11: R_X86_64_PLT32	__msan_warning-0x4
91d5   947a15:	e9 a1 8f ff ff       	jmp    9409bb <___bpf_prog_run+0x217b>
91da   947a1a:	8b 3c 24             	mov    (%rsp),%edi
91dd   947a1d:	e8 00 00 00 00       	call   947a22 <___bpf_prog_run+0x91e2>	947a1e: R_X86_64_PLT32	__msan_warning-0x4
91e2   947a22:	e9 d0 8f ff ff       	jmp    9409f7 <___bpf_prog_run+0x21b7>
91e7   947a27:	e8 00 00 00 00       	call   947a2c <___bpf_prog_run+0x91ec>	947a28: R_X86_64_PLT32	__msan_warning-0x4
91ec   947a2c:	e9 0b 90 ff ff       	jmp    940a3c <___bpf_prog_run+0x21fc>
91f1   947a31:	8b 3c 24             	mov    (%rsp),%edi
91f4   947a34:	e8 00 00 00 00       	call   947a39 <___bpf_prog_run+0x91f9>	947a35: R_X86_64_PLT32	__msan_warning-0x4
91f9   947a39:	e9 2d 90 ff ff       	jmp    940a6b <___bpf_prog_run+0x222b>
91fe   947a3e:	8b 3c 24             	mov    (%rsp),%edi
9201   947a41:	e8 00 00 00 00       	call   947a46 <___bpf_prog_run+0x9206>	947a42: R_X86_64_PLT32	__msan_warning-0x4
9206   947a46:	e9 9e 90 ff ff       	jmp    940ae9 <___bpf_prog_run+0x22a9>
920b   947a4b:	44 89 ff             	mov    %r15d,%edi
920e   947a4e:	e8 00 00 00 00       	call   947a53 <___bpf_prog_run+0x9213>	947a4f: R_X86_64_PLT32	__msan_warning-0x4
9213   947a53:	e9 c7 90 ff ff       	jmp    940b1f <___bpf_prog_run+0x22df>
9218   947a58:	8b 3c 24             	mov    (%rsp),%edi
921b   947a5b:	e8 00 00 00 00       	call   947a60 <___bpf_prog_run+0x9220>	947a5c: R_X86_64_PLT32	__msan_warning-0x4
9220   947a60:	e9 f4 90 ff ff       	jmp    940b59 <___bpf_prog_run+0x2319>
9225   947a65:	e8 00 00 00 00       	call   947a6a <___bpf_prog_run+0x922a>	947a66: R_X86_64_PLT32	__msan_warning-0x4
922a   947a6a:	e9 26 91 ff ff       	jmp    940b95 <___bpf_prog_run+0x2355>
922f   947a6f:	44 89 e7             	mov    %r12d,%edi
9232   947a72:	e8 00 00 00 00       	call   947a77 <___bpf_prog_run+0x9237>	947a73: R_X86_64_PLT32	__msan_warning-0x4
9237   947a77:	e9 5c 91 ff ff       	jmp    940bd8 <___bpf_prog_run+0x2398>
923c   947a7c:	8b 7c 24 08          	mov    0x8(%rsp),%edi
9240   947a80:	e8 00 00 00 00       	call   947a85 <___bpf_prog_run+0x9245>	947a81: R_X86_64_PLT32	__msan_warning-0x4
9245   947a85:	e9 7d 91 ff ff       	jmp    940c07 <___bpf_prog_run+0x23c7>
924a   947a8a:	8b 3c 24             	mov    (%rsp),%edi
924d   947a8d:	e8 00 00 00 00       	call   947a92 <___bpf_prog_run+0x9252>	947a8e: R_X86_64_PLT32	__msan_warning-0x4
9252   947a92:	e9 b4 91 ff ff       	jmp    940c4b <___bpf_prog_run+0x240b>
9257   947a97:	e8 00 00 00 00       	call   947a9c <___bpf_prog_run+0x925c>	947a98: R_X86_64_PLT32	__msan_warning-0x4
925c   947a9c:	e9 dd 91 ff ff       	jmp    940c7e <___bpf_prog_run+0x243e>
9261   947aa1:	8b 7c 24 04          	mov    0x4(%rsp),%edi
9265   947aa5:	e8 00 00 00 00       	call   947aaa <___bpf_prog_run+0x926a>	947aa6: R_X86_64_PLT32	__msan_warning-0x4
926a   947aaa:	e9 f2 91 ff ff       	jmp    940ca1 <___bpf_prog_run+0x2461>
926f   947aaf:	48 89 d3             	mov    %rdx,%rbx
9272   947ab2:	8b 7c 24 08          	mov    0x8(%rsp),%edi
9276   947ab6:	e8 00 00 00 00       	call   947abb <___bpf_prog_run+0x927b>	947ab7: R_X86_64_PLT32	__msan_chain_origin-0x4
927b   947abb:	89 c0                	mov    %eax,%eax
927d   947abd:	48 89 c1             	mov    %rax,%rcx
9280   947ac0:	48 c1 e1 20          	shl    $0x20,%rcx
9284   947ac4:	48 09 c1             	or     %rax,%rcx
9287   947ac7:	48 89 0b             	mov    %rcx,(%rbx)
928a   947aca:	e9 eb 91 ff ff       	jmp    940cba <___bpf_prog_run+0x247a>
928f   947acf:	8b 3c 24             	mov    (%rsp),%edi
9292   947ad2:	e8 00 00 00 00       	call   947ad7 <___bpf_prog_run+0x9297>	947ad3: R_X86_64_PLT32	__msan_warning-0x4
9297   947ad7:	e9 f7 91 ff ff       	jmp    940cd3 <___bpf_prog_run+0x2493>
929c   947adc:	44 89 ff             	mov    %r15d,%edi
929f   947adf:	e8 00 00 00 00       	call   947ae4 <___bpf_prog_run+0x92a4>	947ae0: R_X86_64_PLT32	__msan_warning-0x4
92a4   947ae4:	e9 01 92 ff ff       	jmp    940cea <___bpf_prog_run+0x24aa>
92a9   947ae9:	44 89 ff             	mov    %r15d,%edi
92ac   947aec:	e8 00 00 00 00       	call   947af1 <___bpf_prog_run+0x92b1>	947aed: R_X86_64_PLT32	__msan_warning-0x4
92b1   947af1:	e9 08 92 ff ff       	jmp    940cfe <___bpf_prog_run+0x24be>
92b6   947af6:	8b 7c 24 04          	mov    0x4(%rsp),%edi
92ba   947afa:	e8 00 00 00 00       	call   947aff <___bpf_prog_run+0x92bf>	947afb: R_X86_64_PLT32	__msan_warning-0x4
92bf   947aff:	e9 10 92 ff ff       	jmp    940d14 <___bpf_prog_run+0x24d4>
92c4   947b04:	49 89 d7             	mov    %rdx,%r15
92c7   947b07:	8b 7c 24 08          	mov    0x8(%rsp),%edi
92cb   947b0b:	e8 00 00 00 00       	call   947b10 <___bpf_prog_run+0x92d0>	947b0c: R_X86_64_PLT32	__msan_chain_origin-0x4
92d0   947b10:	89 c0                	mov    %eax,%eax
92d2   947b12:	48 89 c1             	mov    %rax,%rcx
92d5   947b15:	48 c1 e1 20          	shl    $0x20,%rcx
92d9   947b19:	48 09 c1             	or     %rax,%rcx
92dc   947b1c:	49 89 0f             	mov    %rcx,(%r15)
92df   947b1f:	e9 0c 92 ff ff       	jmp    940d30 <___bpf_prog_run+0x24f0>
92e4   947b24:	8b 3c 24             	mov    (%rsp),%edi
92e7   947b27:	e8 00 00 00 00       	call   947b2c <___bpf_prog_run+0x92ec>	947b28: R_X86_64_PLT32	__msan_warning-0x4
92ec   947b2c:	e9 0e 92 ff ff       	jmp    940d3f <___bpf_prog_run+0x24ff>
92f1   947b31:	8b 3c 24             	mov    (%rsp),%edi
92f4   947b34:	e8 00 00 00 00       	call   947b39 <___bpf_prog_run+0x92f9>	947b35: R_X86_64_PLT32	__msan_warning-0x4
92f9   947b39:	e9 4d 92 ff ff       	jmp    940d8b <___bpf_prog_run+0x254b>
92fe   947b3e:	e8 00 00 00 00       	call   947b43 <___bpf_prog_run+0x9303>	947b3f: R_X86_64_PLT32	__msan_warning-0x4
9303   947b43:	e9 81 92 ff ff       	jmp    940dc9 <___bpf_prog_run+0x2589>
9308   947b48:	44 89 e7             	mov    %r12d,%edi
930b   947b4b:	e8 00 00 00 00       	call   947b50 <___bpf_prog_run+0x9310>	947b4c: R_X86_64_PLT32	__msan_warning-0x4
9310   947b50:	e9 ad 92 ff ff       	jmp    940e02 <___bpf_prog_run+0x25c2>
9315   947b55:	8b 3c 24             	mov    (%rsp),%edi
9318   947b58:	e8 00 00 00 00       	call   947b5d <___bpf_prog_run+0x931d>	947b59: R_X86_64_PLT32	__msan_warning-0x4
931d   947b5d:	e9 fc 92 ff ff       	jmp    940e5e <___bpf_prog_run+0x261e>
9322   947b62:	e8 00 00 00 00       	call   947b67 <___bpf_prog_run+0x9327>	947b63: R_X86_64_PLT32	__msan_warning-0x4
9327   947b67:	e9 1f 93 ff ff       	jmp    940e8b <___bpf_prog_run+0x264b>
932c   947b6c:	8b 3c 24             	mov    (%rsp),%edi
932f   947b6f:	e8 00 00 00 00       	call   947b74 <___bpf_prog_run+0x9334>	947b70: R_X86_64_PLT32	__msan_warning-0x4
9334   947b74:	e9 38 93 ff ff       	jmp    940eb1 <___bpf_prog_run+0x2671>
9339   947b79:	8b 3c 24             	mov    (%rsp),%edi
933c   947b7c:	e8 00 00 00 00       	call   947b81 <___bpf_prog_run+0x9341>	947b7d: R_X86_64_PLT32	__msan_warning-0x4
9341   947b81:	e9 93 93 ff ff       	jmp    940f19 <___bpf_prog_run+0x26d9>
9346   947b86:	e8 00 00 00 00       	call   947b8b <___bpf_prog_run+0x934b>	947b87: R_X86_64_PLT32	__msan_warning-0x4
934b   947b8b:	e9 b6 93 ff ff       	jmp    940f46 <___bpf_prog_run+0x2706>
9350   947b90:	8b 3c 24             	mov    (%rsp),%edi
9353   947b93:	e8 00 00 00 00       	call   947b98 <___bpf_prog_run+0x9358>	947b94: R_X86_64_PLT32	__msan_warning-0x4
9358   947b98:	e9 d0 93 ff ff       	jmp    940f6d <___bpf_prog_run+0x272d>
935d   947b9d:	8b 3c 24             	mov    (%rsp),%edi
9360   947ba0:	e8 00 00 00 00       	call   947ba5 <___bpf_prog_run+0x9365>	947ba1: R_X86_64_PLT32	__msan_warning-0x4
9365   947ba5:	e9 31 94 ff ff       	jmp    940fdb <___bpf_prog_run+0x279b>
936a   947baa:	e8 00 00 00 00       	call   947baf <___bpf_prog_run+0x936f>	947bab: R_X86_64_PLT32	__msan_warning-0x4
936f   947baf:	e9 54 94 ff ff       	jmp    941008 <___bpf_prog_run+0x27c8>
9374   947bb4:	8b 3c 24             	mov    (%rsp),%edi
9377   947bb7:	e8 00 00 00 00       	call   947bbc <___bpf_prog_run+0x937c>	947bb8: R_X86_64_PLT32	__msan_warning-0x4
937c   947bbc:	e9 6e 94 ff ff       	jmp    94102f <___bpf_prog_run+0x27ef>
9381   947bc1:	44 89 f7             	mov    %r14d,%edi
9384   947bc4:	e8 00 00 00 00       	call   947bc9 <___bpf_prog_run+0x9389>	947bc5: R_X86_64_PLT32	__msan_warning-0x4
9389   947bc9:	4d 39 e7             	cmp    %r12,%r15
938c   947bcc:	0f 84 97 94 ff ff    	je     941069 <___bpf_prog_run+0x2829>
9392   947bd2:	e8 00 00 00 00       	call   947bd7 <___bpf_prog_run+0x9397>	947bd3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
9397   947bd7:	e9 1a 6d ff ff       	jmp    93e8f6 <___bpf_prog_run+0xb6>
939c   947bdc:	8b 3c 24             	mov    (%rsp),%edi
939f   947bdf:	e8 00 00 00 00       	call   947be4 <___bpf_prog_run+0x93a4>	947be0: R_X86_64_PLT32	__msan_warning-0x4
93a4   947be4:	e9 b1 94 ff ff       	jmp    94109a <___bpf_prog_run+0x285a>
93a9   947be9:	e8 00 00 00 00       	call   947bee <___bpf_prog_run+0x93ae>	947bea: R_X86_64_PLT32	__msan_warning-0x4
93ae   947bee:	e9 d4 94 ff ff       	jmp    9410c7 <___bpf_prog_run+0x2887>
93b3   947bf3:	8b 3c 24             	mov    (%rsp),%edi
93b6   947bf6:	e8 00 00 00 00       	call   947bfb <___bpf_prog_run+0x93bb>	947bf7: R_X86_64_PLT32	__msan_warning-0x4
93bb   947bfb:	e9 ed 94 ff ff       	jmp    9410ed <___bpf_prog_run+0x28ad>
93c0   947c00:	44 89 f7             	mov    %r14d,%edi
93c3   947c03:	e8 00 00 00 00       	call   947c08 <___bpf_prog_run+0x93c8>	947c04: R_X86_64_PLT32	__msan_warning-0x4
93c8   947c08:	45 39 fc             	cmp    %r15d,%r12d
93cb   947c0b:	0f 84 10 95 ff ff    	je     941121 <___bpf_prog_run+0x28e1>
93d1   947c11:	e8 00 00 00 00       	call   947c16 <___bpf_prog_run+0x93d6>	947c12: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
93d6   947c16:	e9 db 6c ff ff       	jmp    93e8f6 <___bpf_prog_run+0xb6>
93db   947c1b:	8b 3c 24             	mov    (%rsp),%edi
93de   947c1e:	e8 00 00 00 00       	call   947c23 <___bpf_prog_run+0x93e3>	947c1f: R_X86_64_PLT32	__msan_warning-0x4
93e3   947c23:	e9 3e 95 ff ff       	jmp    941166 <___bpf_prog_run+0x2926>
93e8   947c28:	8b 3c 24             	mov    (%rsp),%edi
93eb   947c2b:	e8 00 00 00 00       	call   947c30 <___bpf_prog_run+0x93f0>	947c2c: R_X86_64_PLT32	__msan_warning-0x4
93f0   947c30:	e9 57 95 ff ff       	jmp    94118c <___bpf_prog_run+0x294c>
93f5   947c35:	89 df                	mov    %ebx,%edi
93f7   947c37:	e8 00 00 00 00       	call   947c3c <___bpf_prog_run+0x93fc>	947c38: R_X86_64_PLT32	__msan_warning-0x4
93fc   947c3c:	e9 7c 95 ff ff       	jmp    9411bd <___bpf_prog_run+0x297d>
9401   947c41:	8b 7c 24 38          	mov    0x38(%rsp),%edi
9405   947c45:	e8 00 00 00 00       	call   947c4a <___bpf_prog_run+0x940a>	947c46: R_X86_64_PLT32	__msan_warning-0x4
940a   947c4a:	e9 c5 95 ff ff       	jmp    941214 <___bpf_prog_run+0x29d4>
940f   947c4f:	49 89 d6             	mov    %rdx,%r14
9412   947c52:	44 89 e7             	mov    %r12d,%edi
9415   947c55:	e8 00 00 00 00       	call   947c5a <___bpf_prog_run+0x941a>	947c56: R_X86_64_PLT32	__msan_chain_origin-0x4
941a   947c5a:	89 c0                	mov    %eax,%eax
941c   947c5c:	48 89 c1             	mov    %rax,%rcx
941f   947c5f:	48 c1 e1 20          	shl    $0x20,%rcx
9423   947c63:	48 09 c1             	or     %rax,%rcx
9426   947c66:	49 89 0e             	mov    %rcx,(%r14)
9429   947c69:	e9 ba 95 ff ff       	jmp    941228 <___bpf_prog_run+0x29e8>
942e   947c6e:	8b 3c 24             	mov    (%rsp),%edi
9431   947c71:	e8 00 00 00 00       	call   947c76 <___bpf_prog_run+0x9436>	947c72: R_X86_64_PLT32	__msan_warning-0x4
9436   947c76:	e9 c8 95 ff ff       	jmp    941243 <___bpf_prog_run+0x2a03>
943b   947c7b:	e8 00 00 00 00       	call   947c80 <___bpf_prog_run+0x9440>	947c7c: R_X86_64_PLT32	__msan_warning-0x4
9440   947c80:	e9 eb 95 ff ff       	jmp    941270 <___bpf_prog_run+0x2a30>
9445   947c85:	8b 3c 24             	mov    (%rsp),%edi
9448   947c88:	e8 00 00 00 00       	call   947c8d <___bpf_prog_run+0x944d>	947c89: R_X86_64_PLT32	__msan_warning-0x4
944d   947c8d:	e9 04 96 ff ff       	jmp    941296 <___bpf_prog_run+0x2a56>
9452   947c92:	8b 3c 24             	mov    (%rsp),%edi
9455   947c95:	e8 00 00 00 00       	call   947c9a <___bpf_prog_run+0x945a>	947c96: R_X86_64_PLT32	__msan_warning-0x4
945a   947c9a:	e9 5f 96 ff ff       	jmp    9412fe <___bpf_prog_run+0x2abe>
945f   947c9f:	e8 00 00 00 00       	call   947ca4 <___bpf_prog_run+0x9464>	947ca0: R_X86_64_PLT32	__msan_warning-0x4
9464   947ca4:	e9 91 96 ff ff       	jmp    94133a <___bpf_prog_run+0x2afa>
9469   947ca9:	44 89 e7             	mov    %r12d,%edi
946c   947cac:	e8 00 00 00 00       	call   947cb1 <___bpf_prog_run+0x9471>	947cad: R_X86_64_PLT32	__msan_warning-0x4
9471   947cb1:	e9 c7 96 ff ff       	jmp    94137d <___bpf_prog_run+0x2b3d>
9476   947cb6:	8b 7c 24 08          	mov    0x8(%rsp),%edi
947a   947cba:	e8 00 00 00 00       	call   947cbf <___bpf_prog_run+0x947f>	947cbb: R_X86_64_PLT32	__msan_warning-0x4
947f   947cbf:	e9 e8 96 ff ff       	jmp    9413ac <___bpf_prog_run+0x2b6c>
9484   947cc4:	8b 3c 24             	mov    (%rsp),%edi
9487   947cc7:	e8 00 00 00 00       	call   947ccc <___bpf_prog_run+0x948c>	947cc8: R_X86_64_PLT32	__msan_warning-0x4
948c   947ccc:	e9 0b 97 ff ff       	jmp    9413dc <___bpf_prog_run+0x2b9c>
9491   947cd1:	89 df                	mov    %ebx,%edi
9493   947cd3:	e8 00 00 00 00       	call   947cd8 <___bpf_prog_run+0x9498>	947cd4: R_X86_64_PLT32	__msan_warning-0x4
9498   947cd8:	e9 30 97 ff ff       	jmp    94140d <___bpf_prog_run+0x2bcd>
949d   947cdd:	8b 3c 24             	mov    (%rsp),%edi
94a0   947ce0:	e8 00 00 00 00       	call   947ce5 <___bpf_prog_run+0x94a5>	947ce1: R_X86_64_PLT32	__msan_warning-0x4
94a5   947ce5:	e9 5a 97 ff ff       	jmp    941444 <___bpf_prog_run+0x2c04>
94aa   947cea:	8b 7c 24 08          	mov    0x8(%rsp),%edi
94ae   947cee:	e8 00 00 00 00       	call   947cf3 <___bpf_prog_run+0x94b3>	947cef: R_X86_64_PLT32	__msan_warning-0x4
94b3   947cf3:	e9 72 97 ff ff       	jmp    94146a <___bpf_prog_run+0x2c2a>
94b8   947cf8:	8b 3c 24             	mov    (%rsp),%edi
94bb   947cfb:	e8 00 00 00 00       	call   947d00 <___bpf_prog_run+0x94c0>	947cfc: R_X86_64_PLT32	__msan_warning-0x4
94c0   947d00:	e9 7f 97 ff ff       	jmp    941484 <___bpf_prog_run+0x2c44>
94c5   947d05:	89 df                	mov    %ebx,%edi
94c7   947d07:	e8 00 00 00 00       	call   947d0c <___bpf_prog_run+0x94cc>	947d08: R_X86_64_PLT32	__msan_warning-0x4
94cc   947d0c:	e9 ae 97 ff ff       	jmp    9414bf <___bpf_prog_run+0x2c7f>
94d1   947d11:	44 89 ef             	mov    %r13d,%edi
94d4   947d14:	e8 00 00 00 00       	call   947d19 <___bpf_prog_run+0x94d9>	947d15: R_X86_64_PLT32	__msan_warning-0x4
94d9   947d19:	e9 e5 97 ff ff       	jmp    941503 <___bpf_prog_run+0x2cc3>
94de   947d1e:	8b 7c 24 40          	mov    0x40(%rsp),%edi
94e2   947d22:	e8 00 00 00 00       	call   947d27 <___bpf_prog_run+0x94e7>	947d23: R_X86_64_PLT32	__msan_warning-0x4
94e7   947d27:	e9 0c 98 ff ff       	jmp    941538 <___bpf_prog_run+0x2cf8>
94ec   947d2c:	49 89 d4             	mov    %rdx,%r12
94ef   947d2f:	8b 7c 24 38          	mov    0x38(%rsp),%edi
94f3   947d33:	e8 00 00 00 00       	call   947d38 <___bpf_prog_run+0x94f8>	947d34: R_X86_64_PLT32	__msan_chain_origin-0x4
94f8   947d38:	89 c0                	mov    %eax,%eax
94fa   947d3a:	48 89 c1             	mov    %rax,%rcx
94fd   947d3d:	48 c1 e1 20          	shl    $0x20,%rcx
9501   947d41:	48 09 c1             	or     %rax,%rcx
9504   947d44:	49 89 0c 24          	mov    %rcx,(%r12)
9508   947d48:	e9 04 98 ff ff       	jmp    941551 <___bpf_prog_run+0x2d11>
950d   947d4d:	8b 3c 24             	mov    (%rsp),%edi
9510   947d50:	e8 00 00 00 00       	call   947d55 <___bpf_prog_run+0x9515>	947d51: R_X86_64_PLT32	__msan_warning-0x4
9515   947d55:	e9 1a 98 ff ff       	jmp    941574 <___bpf_prog_run+0x2d34>
951a   947d5a:	e8 00 00 00 00       	call   947d5f <___bpf_prog_run+0x951f>	947d5b: R_X86_64_PLT32	__msan_warning-0x4
951f   947d5f:	e9 55 98 ff ff       	jmp    9415b9 <___bpf_prog_run+0x2d79>
9524   947d64:	8b 3c 24             	mov    (%rsp),%edi
9527   947d67:	e8 00 00 00 00       	call   947d6c <___bpf_prog_run+0x952c>	947d68: R_X86_64_PLT32	__msan_warning-0x4
952c   947d6c:	e9 77 98 ff ff       	jmp    9415e8 <___bpf_prog_run+0x2da8>
9531   947d71:	8b 3c 24             	mov    (%rsp),%edi
9534   947d74:	e8 00 00 00 00       	call   947d79 <___bpf_prog_run+0x9539>	947d75: R_X86_64_PLT32	__msan_warning-0x4
9539   947d79:	e9 e8 98 ff ff       	jmp    941666 <___bpf_prog_run+0x2e26>
953e   947d7e:	44 89 ff             	mov    %r15d,%edi
9541   947d81:	e8 00 00 00 00       	call   947d86 <___bpf_prog_run+0x9546>	947d82: R_X86_64_PLT32	__msan_warning-0x4
9546   947d86:	e9 11 99 ff ff       	jmp    94169c <___bpf_prog_run+0x2e5c>
954b   947d8b:	8b 3c 24             	mov    (%rsp),%edi
954e   947d8e:	e8 00 00 00 00       	call   947d93 <___bpf_prog_run+0x9553>	947d8f: R_X86_64_PLT32	__msan_warning-0x4
9553   947d93:	e9 46 99 ff ff       	jmp    9416de <___bpf_prog_run+0x2e9e>
9558   947d98:	e8 00 00 00 00       	call   947d9d <___bpf_prog_run+0x955d>	947d99: R_X86_64_PLT32	__msan_warning-0x4
955d   947d9d:	e9 79 99 ff ff       	jmp    94171b <___bpf_prog_run+0x2edb>
9562   947da2:	44 89 ff             	mov    %r15d,%edi
9565   947da5:	e8 00 00 00 00       	call   947daa <___bpf_prog_run+0x956a>	947da6: R_X86_64_PLT32	__msan_warning-0x4
956a   947daa:	e9 a6 99 ff ff       	jmp    941755 <___bpf_prog_run+0x2f15>
956f   947daf:	8b 3c 24             	mov    (%rsp),%edi
9572   947db2:	e8 00 00 00 00       	call   947db7 <___bpf_prog_run+0x9577>	947db3: R_X86_64_PLT32	__msan_warning-0x4
9577   947db7:	e9 c9 99 ff ff       	jmp    941785 <___bpf_prog_run+0x2f45>
957c   947dbc:	44 89 ff             	mov    %r15d,%edi
957f   947dbf:	e8 00 00 00 00       	call   947dc4 <___bpf_prog_run+0x9584>	947dc0: R_X86_64_PLT32	__msan_warning-0x4
9584   947dc4:	e9 e0 99 ff ff       	jmp    9417a9 <___bpf_prog_run+0x2f69>
9589   947dc9:	49 89 d7             	mov    %rdx,%r15
958c   947dcc:	8b 7c 24 38          	mov    0x38(%rsp),%edi
9590   947dd0:	e8 00 00 00 00       	call   947dd5 <___bpf_prog_run+0x9595>	947dd1: R_X86_64_PLT32	__msan_chain_origin-0x4
9595   947dd5:	41 89 07             	mov    %eax,(%r15)
9598   947dd8:	e9 e7 99 ff ff       	jmp    9417c4 <___bpf_prog_run+0x2f84>
959d   947ddd:	8b 3c 24             	mov    (%rsp),%edi
95a0   947de0:	e8 00 00 00 00       	call   947de5 <___bpf_prog_run+0x95a5>	947de1: R_X86_64_PLT32	__msan_warning-0x4
95a5   947de5:	e9 01 9a ff ff       	jmp    9417eb <___bpf_prog_run+0x2fab>
95aa   947dea:	8b 7c 24 38          	mov    0x38(%rsp),%edi
95ae   947dee:	e8 00 00 00 00       	call   947df3 <___bpf_prog_run+0x95b3>	947def: R_X86_64_PLT32	__msan_warning-0x4
95b3   947df3:	e9 2b 9a ff ff       	jmp    941823 <___bpf_prog_run+0x2fe3>
95b8   947df8:	89 df                	mov    %ebx,%edi
95ba   947dfa:	e8 00 00 00 00       	call   947dff <___bpf_prog_run+0x95bf>	947dfb: R_X86_64_PLT32	__msan_warning-0x4
95bf   947dff:	e9 58 9a ff ff       	jmp    94185c <___bpf_prog_run+0x301c>
95c4   947e04:	8b 7c 24 38          	mov    0x38(%rsp),%edi
95c8   947e08:	41 89 f7             	mov    %esi,%r15d
95cb   947e0b:	e8 00 00 00 00       	call   947e10 <___bpf_prog_run+0x95d0>	947e0c: R_X86_64_PLT32	__msan_warning-0x4
95d0   947e10:	44 89 fe             	mov    %r15d,%esi
95d3   947e13:	e9 89 9a ff ff       	jmp    9418a1 <___bpf_prog_run+0x3061>
95d8   947e18:	49 89 d7             	mov    %rdx,%r15
95db   947e1b:	8b 7c 24 08          	mov    0x8(%rsp),%edi
95df   947e1f:	e8 00 00 00 00       	call   947e24 <___bpf_prog_run+0x95e4>	947e20: R_X86_64_PLT32	__msan_chain_origin-0x4
95e4   947e24:	89 c0                	mov    %eax,%eax
95e6   947e26:	48 89 c1             	mov    %rax,%rcx
95e9   947e29:	48 c1 e1 20          	shl    $0x20,%rcx
95ed   947e2d:	48 09 c1             	or     %rax,%rcx
95f0   947e30:	49 89 0f             	mov    %rcx,(%r15)
95f3   947e33:	e9 84 9a ff ff       	jmp    9418bc <___bpf_prog_run+0x307c>
95f8   947e38:	8b 3c 24             	mov    (%rsp),%edi
95fb   947e3b:	e8 00 00 00 00       	call   947e40 <___bpf_prog_run+0x9600>	947e3c: R_X86_64_PLT32	__msan_warning-0x4
9600   947e40:	e9 91 9a ff ff       	jmp    9418d6 <___bpf_prog_run+0x3096>
9605   947e45:	e8 00 00 00 00       	call   947e4a <___bpf_prog_run+0x960a>	947e46: R_X86_64_PLT32	__msan_warning-0x4
960a   947e4a:	e9 bb 9a ff ff       	jmp    94190a <___bpf_prog_run+0x30ca>
960f   947e4f:	8b 3c 24             	mov    (%rsp),%edi
9612   947e52:	e8 00 00 00 00       	call   947e57 <___bpf_prog_run+0x9617>	947e53: R_X86_64_PLT32	__msan_warning-0x4
9617   947e57:	e9 e7 9a ff ff       	jmp    941943 <___bpf_prog_run+0x3103>
961c   947e5c:	8b 3c 24             	mov    (%rsp),%edi
961f   947e5f:	e8 00 00 00 00       	call   947e64 <___bpf_prog_run+0x9624>	947e60: R_X86_64_PLT32	__msan_warning-0x4
9624   947e64:	e9 51 9b ff ff       	jmp    9419ba <___bpf_prog_run+0x317a>
9629   947e69:	e8 00 00 00 00       	call   947e6e <___bpf_prog_run+0x962e>	947e6a: R_X86_64_PLT32	__msan_warning-0x4
962e   947e6e:	e9 86 9b ff ff       	jmp    9419f9 <___bpf_prog_run+0x31b9>
9633   947e73:	44 89 e7             	mov    %r12d,%edi
9636   947e76:	e8 00 00 00 00       	call   947e7b <___bpf_prog_run+0x963b>	947e77: R_X86_64_PLT32	__msan_warning-0x4
963b   947e7b:	e9 ba 9b ff ff       	jmp    941a3a <___bpf_prog_run+0x31fa>
9640   947e80:	8b 3c 24             	mov    (%rsp),%edi
9643   947e83:	e8 00 00 00 00       	call   947e88 <___bpf_prog_run+0x9648>	947e84: R_X86_64_PLT32	__msan_warning-0x4
9648   947e88:	e9 f5 9b ff ff       	jmp    941a82 <___bpf_prog_run+0x3242>
964d   947e8d:	89 df                	mov    %ebx,%edi
964f   947e8f:	e8 00 00 00 00       	call   947e94 <___bpf_prog_run+0x9654>	947e90: R_X86_64_PLT32	__msan_warning-0x4
9654   947e94:	e9 1f 9c ff ff       	jmp    941ab8 <___bpf_prog_run+0x3278>
9659   947e99:	44 89 e7             	mov    %r12d,%edi
965c   947e9c:	e8 00 00 00 00       	call   947ea1 <___bpf_prog_run+0x9661>	947e9d: R_X86_64_PLT32	__msan_warning-0x4
9661   947ea1:	e9 56 9c ff ff       	jmp    941afc <___bpf_prog_run+0x32bc>
9666   947ea6:	8b 3c 24             	mov    (%rsp),%edi
9669   947ea9:	e8 00 00 00 00       	call   947eae <___bpf_prog_run+0x966e>	947eaa: R_X86_64_PLT32	__msan_warning-0x4
966e   947eae:	e9 94 9c ff ff       	jmp    941b47 <___bpf_prog_run+0x3307>
9673   947eb3:	8b 3a                	mov    (%rdx),%edi
9675   947eb5:	e8 00 00 00 00       	call   947eba <___bpf_prog_run+0x967a>	947eb6: R_X86_64_PLT32	__msan_warning-0x4
967a   947eba:	e9 9c 9c ff ff       	jmp    941b5b <___bpf_prog_run+0x331b>
967f   947ebf:	8b 3c 24             	mov    (%rsp),%edi
9682   947ec2:	e8 00 00 00 00       	call   947ec7 <___bpf_prog_run+0x9687>	947ec3: R_X86_64_PLT32	__msan_warning-0x4
9687   947ec7:	e9 12 9e ff ff       	jmp    941cde <___bpf_prog_run+0x349e>
968c   947ecc:	89 df                	mov    %ebx,%edi
968e   947ece:	e8 00 00 00 00       	call   947ed3 <___bpf_prog_run+0x9693>	947ecf: R_X86_64_PLT32	__msan_warning-0x4
9693   947ed3:	e9 3c 9e ff ff       	jmp    941d14 <___bpf_prog_run+0x34d4>
9698   947ed8:	44 89 e7             	mov    %r12d,%edi
969b   947edb:	e8 00 00 00 00       	call   947ee0 <___bpf_prog_run+0x96a0>	947edc: R_X86_64_PLT32	__msan_warning-0x4
96a0   947ee0:	e9 73 9e ff ff       	jmp    941d58 <___bpf_prog_run+0x3518>
96a5   947ee5:	8b 3c 24             	mov    (%rsp),%edi
96a8   947ee8:	e8 00 00 00 00       	call   947eed <___bpf_prog_run+0x96ad>	947ee9: R_X86_64_PLT32	__msan_warning-0x4
96ad   947eed:	e9 b6 9e ff ff       	jmp    941da8 <___bpf_prog_run+0x3568>
96b2   947ef2:	89 df                	mov    %ebx,%edi
96b4   947ef4:	e8 00 00 00 00       	call   947ef9 <___bpf_prog_run+0x96b9>	947ef5: R_X86_64_PLT32	__msan_warning-0x4
96b9   947ef9:	e9 d9 9e ff ff       	jmp    941dd7 <___bpf_prog_run+0x3597>
96be   947efe:	8b 3c 24             	mov    (%rsp),%edi
96c1   947f01:	e8 00 00 00 00       	call   947f06 <___bpf_prog_run+0x96c6>	947f02: R_X86_64_PLT32	__msan_warning-0x4
96c6   947f06:	e9 fd 9e ff ff       	jmp    941e08 <___bpf_prog_run+0x35c8>
96cb   947f0b:	8b 3c 24             	mov    (%rsp),%edi
96ce   947f0e:	e8 00 00 00 00       	call   947f13 <___bpf_prog_run+0x96d3>	947f0f: R_X86_64_PLT32	__msan_warning-0x4
96d3   947f13:	e9 33 9f ff ff       	jmp    941e4b <___bpf_prog_run+0x360b>
96d8   947f18:	89 df                	mov    %ebx,%edi
96da   947f1a:	e8 00 00 00 00       	call   947f1f <___bpf_prog_run+0x96df>	947f1b: R_X86_64_PLT32	__msan_warning-0x4
96df   947f1f:	e9 58 9f ff ff       	jmp    941e7c <___bpf_prog_run+0x363c>
96e4   947f24:	8b 3c 24             	mov    (%rsp),%edi
96e7   947f27:	e8 00 00 00 00       	call   947f2c <___bpf_prog_run+0x96ec>	947f28: R_X86_64_PLT32	__msan_warning-0x4
96ec   947f2c:	e9 82 9f ff ff       	jmp    941eb3 <___bpf_prog_run+0x3673>
96f1   947f31:	8b 7c 24 08          	mov    0x8(%rsp),%edi
96f5   947f35:	e8 00 00 00 00       	call   947f3a <___bpf_prog_run+0x96fa>	947f36: R_X86_64_PLT32	__msan_warning-0x4
96fa   947f3a:	e9 9a 9f ff ff       	jmp    941ed9 <___bpf_prog_run+0x3699>
96ff   947f3f:	8b 3c 24             	mov    (%rsp),%edi
9702   947f42:	e8 00 00 00 00       	call   947f47 <___bpf_prog_run+0x9707>	947f43: R_X86_64_PLT32	__msan_warning-0x4
9707   947f47:	e9 a7 9f ff ff       	jmp    941ef3 <___bpf_prog_run+0x36b3>
970c   947f4c:	89 df                	mov    %ebx,%edi
970e   947f4e:	e8 00 00 00 00       	call   947f53 <___bpf_prog_run+0x9713>	947f4f: R_X86_64_PLT32	__msan_warning-0x4
9713   947f53:	e9 cc 9f ff ff       	jmp    941f24 <___bpf_prog_run+0x36e4>
9718   947f58:	8b 3c 24             	mov    (%rsp),%edi
971b   947f5b:	e8 00 00 00 00       	call   947f60 <___bpf_prog_run+0x9720>	947f5c: R_X86_64_PLT32	__msan_warning-0x4
9720   947f60:	e9 f6 9f ff ff       	jmp    941f5b <___bpf_prog_run+0x371b>
9725   947f65:	8b 7c 24 08          	mov    0x8(%rsp),%edi
9729   947f69:	e8 00 00 00 00       	call   947f6e <___bpf_prog_run+0x972e>	947f6a: R_X86_64_PLT32	__msan_warning-0x4
972e   947f6e:	e9 0e a0 ff ff       	jmp    941f81 <___bpf_prog_run+0x3741>
9733   947f73:	8b 3c 24             	mov    (%rsp),%edi
9736   947f76:	e8 00 00 00 00       	call   947f7b <___bpf_prog_run+0x973b>	947f77: R_X86_64_PLT32	__msan_warning-0x4
973b   947f7b:	e9 1b a0 ff ff       	jmp    941f9b <___bpf_prog_run+0x375b>
9740   947f80:	89 df                	mov    %ebx,%edi
9742   947f82:	e8 00 00 00 00       	call   947f87 <___bpf_prog_run+0x9747>	947f83: R_X86_64_PLT32	__msan_warning-0x4
9747   947f87:	e9 4a a0 ff ff       	jmp    941fd6 <___bpf_prog_run+0x3796>
974c   947f8c:	44 89 e7             	mov    %r12d,%edi
974f   947f8f:	e8 00 00 00 00       	call   947f94 <___bpf_prog_run+0x9754>	947f90: R_X86_64_PLT32	__msan_warning-0x4
9754   947f94:	e9 81 a0 ff ff       	jmp    94201a <___bpf_prog_run+0x37da>
9759   947f99:	8b 3c 24             	mov    (%rsp),%edi
975c   947f9c:	e8 00 00 00 00       	call   947fa1 <___bpf_prog_run+0x9761>	947f9d: R_X86_64_PLT32	__msan_warning-0x4
9761   947fa1:	e9 e1 a0 ff ff       	jmp    942087 <___bpf_prog_run+0x3847>
9766   947fa6:	e8 00 00 00 00       	call   947fab <___bpf_prog_run+0x976b>	947fa7: R_X86_64_PLT32	__msan_warning-0x4
976b   947fab:	e9 13 a1 ff ff       	jmp    9420c3 <___bpf_prog_run+0x3883>
9770   947fb0:	44 89 e7             	mov    %r12d,%edi
9773   947fb3:	e8 00 00 00 00       	call   947fb8 <___bpf_prog_run+0x9778>	947fb4: R_X86_64_PLT32	__msan_warning-0x4
9778   947fb8:	e9 49 a1 ff ff       	jmp    942106 <___bpf_prog_run+0x38c6>
977d   947fbd:	8b 7c 24 08          	mov    0x8(%rsp),%edi
9781   947fc1:	e8 00 00 00 00       	call   947fc6 <___bpf_prog_run+0x9786>	947fc2: R_X86_64_PLT32	__msan_warning-0x4
9786   947fc6:	48 85 db             	test   %rbx,%rbx
9789   947fc9:	0f 85 93 a1 ff ff    	jne    942162 <___bpf_prog_run+0x3922>
978f   947fcf:	e8 00 00 00 00       	call   947fd4 <___bpf_prog_run+0x9794>	947fd0: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
9794   947fd4:	49 83 c5 08          	add    $0x8,%r13
9798   947fd8:	e9 22 69 ff ff       	jmp    93e8ff <___bpf_prog_run+0xbf>
979d   947fdd:	8b 3c 24             	mov    (%rsp),%edi
97a0   947fe0:	e8 00 00 00 00       	call   947fe5 <___bpf_prog_run+0x97a5>	947fe1: R_X86_64_PLT32	__msan_warning-0x4
97a5   947fe5:	e9 a4 a1 ff ff       	jmp    94218e <___bpf_prog_run+0x394e>
97aa   947fea:	e8 00 00 00 00       	call   947fef <___bpf_prog_run+0x97af>	947feb: R_X86_64_PLT32	__msan_warning-0x4
97af   947fef:	e9 d6 a1 ff ff       	jmp    9421ca <___bpf_prog_run+0x398a>
97b4   947ff4:	44 89 e7             	mov    %r12d,%edi
97b7   947ff7:	e8 00 00 00 00       	call   947ffc <___bpf_prog_run+0x97bc>	947ff8: R_X86_64_PLT32	__msan_warning-0x4
97bc   947ffc:	e9 0a a2 ff ff       	jmp    94220b <___bpf_prog_run+0x39cb>
97c1   948001:	8b 7c 24 08          	mov    0x8(%rsp),%edi
97c5   948005:	e8 00 00 00 00       	call   94800a <___bpf_prog_run+0x97ca>	948006: R_X86_64_PLT32	__msan_warning-0x4
97ca   94800a:	e9 28 a2 ff ff       	jmp    942237 <___bpf_prog_run+0x39f7>
97cf   94800f:	8b 3c 24             	mov    (%rsp),%edi
97d2   948012:	e8 00 00 00 00       	call   948017 <___bpf_prog_run+0x97d7>	948013: R_X86_64_PLT32	__msan_warning-0x4
97d7   948017:	e9 4a a2 ff ff       	jmp    942266 <___bpf_prog_run+0x3a26>
97dc   94801c:	89 df                	mov    %ebx,%edi
97de   94801e:	e8 00 00 00 00       	call   948023 <___bpf_prog_run+0x97e3>	94801f: R_X86_64_PLT32	__msan_warning-0x4
97e3   948023:	e9 79 a2 ff ff       	jmp    9422a1 <___bpf_prog_run+0x3a61>
97e8   948028:	44 89 ef             	mov    %r13d,%edi
97eb   94802b:	e8 00 00 00 00       	call   948030 <___bpf_prog_run+0x97f0>	94802c: R_X86_64_PLT32	__msan_warning-0x4
97f0   948030:	e9 b4 a2 ff ff       	jmp    9422e9 <___bpf_prog_run+0x3aa9>
97f5   948035:	8b 3a                	mov    (%rdx),%edi
97f7   948037:	e8 00 00 00 00       	call   94803c <___bpf_prog_run+0x97fc>	948038: R_X86_64_PLT32	__msan_warning-0x4
97fc   94803c:	e9 be a2 ff ff       	jmp    9422ff <___bpf_prog_run+0x3abf>
9801   948041:	49 89 d6             	mov    %rdx,%r14
9804   948044:	8b 7c 24 40          	mov    0x40(%rsp),%edi
9808   948048:	e8 00 00 00 00       	call   94804d <___bpf_prog_run+0x980d>	948049: R_X86_64_PLT32	__msan_chain_origin-0x4
980d   94804d:	89 c0                	mov    %eax,%eax
980f   94804f:	48 89 c1             	mov    %rax,%rcx
9812   948052:	48 c1 e1 20          	shl    $0x20,%rcx
9816   948056:	48 09 c1             	or     %rax,%rcx
9819   948059:	49 89 0e             	mov    %rcx,(%r14)
981c   94805c:	e9 e2 a2 ff ff       	jmp    942343 <___bpf_prog_run+0x3b03>
9821   948061:	8b 3c 24             	mov    (%rsp),%edi
9824   948064:	e8 00 00 00 00       	call   948069 <___bpf_prog_run+0x9829>	948065: R_X86_64_PLT32	__msan_warning-0x4
9829   948069:	e9 eb a2 ff ff       	jmp    942359 <___bpf_prog_run+0x3b19>
982e   94806e:	e8 00 00 00 00       	call   948073 <___bpf_prog_run+0x9833>	94806f: R_X86_64_PLT32	__msan_warning-0x4
9833   948073:	e9 0e a3 ff ff       	jmp    942386 <___bpf_prog_run+0x3b46>
9838   948078:	8b 3c 24             	mov    (%rsp),%edi
983b   94807b:	e8 00 00 00 00       	call   948080 <___bpf_prog_run+0x9840>	94807c: R_X86_64_PLT32	__msan_warning-0x4
9840   948080:	e9 27 a3 ff ff       	jmp    9423ac <___bpf_prog_run+0x3b6c>
9845   948085:	8b 3c 24             	mov    (%rsp),%edi
9848   948088:	e8 00 00 00 00       	call   94808d <___bpf_prog_run+0x984d>	948089: R_X86_64_PLT32	__msan_warning-0x4
984d   94808d:	e9 82 a3 ff ff       	jmp    942414 <___bpf_prog_run+0x3bd4>
9852   948092:	e8 00 00 00 00       	call   948097 <___bpf_prog_run+0x9857>	948093: R_X86_64_PLT32	__msan_warning-0x4
9857   948097:	e9 b4 a3 ff ff       	jmp    942450 <___bpf_prog_run+0x3c10>
985c   94809c:	44 89 e7             	mov    %r12d,%edi
985f   94809f:	e8 00 00 00 00       	call   9480a4 <___bpf_prog_run+0x9864>	9480a0: R_X86_64_PLT32	__msan_warning-0x4
9864   9480a4:	e9 ea a3 ff ff       	jmp    942493 <___bpf_prog_run+0x3c53>
9869   9480a9:	8b 7c 24 08          	mov    0x8(%rsp),%edi
986d   9480ad:	e8 00 00 00 00       	call   9480b2 <___bpf_prog_run+0x9872>	9480ae: R_X86_64_PLT32	__msan_warning-0x4
9872   9480b2:	e9 0b a4 ff ff       	jmp    9424c2 <___bpf_prog_run+0x3c82>
9877   9480b7:	8b 3c 24             	mov    (%rsp),%edi
987a   9480ba:	e8 00 00 00 00       	call   9480bf <___bpf_prog_run+0x987f>	9480bb: R_X86_64_PLT32	__msan_warning-0x4
987f   9480bf:	e9 2e a4 ff ff       	jmp    9424f2 <___bpf_prog_run+0x3cb2>
9884   9480c4:	89 df                	mov    %ebx,%edi
9886   9480c6:	e8 00 00 00 00       	call   9480cb <___bpf_prog_run+0x988b>	9480c7: R_X86_64_PLT32	__msan_warning-0x4
988b   9480cb:	e9 51 a4 ff ff       	jmp    942521 <___bpf_prog_run+0x3ce1>
9890   9480d0:	8b 3c 24             	mov    (%rsp),%edi
9893   9480d3:	e8 00 00 00 00       	call   9480d8 <___bpf_prog_run+0x9898>	9480d4: R_X86_64_PLT32	__msan_warning-0x4
9898   9480d8:	e9 75 a4 ff ff       	jmp    942552 <___bpf_prog_run+0x3d12>
989d   9480dd:	8b 7c 24 08          	mov    0x8(%rsp),%edi
98a1   9480e1:	e8 00 00 00 00       	call   9480e6 <___bpf_prog_run+0x98a6>	9480e2: R_X86_64_PLT32	__msan_warning-0x4
98a6   9480e6:	e9 8a a4 ff ff       	jmp    942575 <___bpf_prog_run+0x3d35>
98ab   9480eb:	48 89 d5             	mov    %rdx,%rbp
98ae   9480ee:	8b 7c 24 18          	mov    0x18(%rsp),%edi
98b2   9480f2:	e8 00 00 00 00       	call   9480f7 <___bpf_prog_run+0x98b7>	9480f3: R_X86_64_PLT32	__msan_chain_origin-0x4
98b7   9480f7:	89 c0                	mov    %eax,%eax
98b9   9480f9:	48 89 c1             	mov    %rax,%rcx
98bc   9480fc:	48 c1 e1 20          	shl    $0x20,%rcx
98c0   948100:	48 09 c1             	or     %rax,%rcx
98c3   948103:	48 89 4d 00          	mov    %rcx,0x0(%rbp)
98c7   948107:	e9 82 a4 ff ff       	jmp    94258e <___bpf_prog_run+0x3d4e>
98cc   94810c:	8b 3c 24             	mov    (%rsp),%edi
98cf   94810f:	e8 00 00 00 00       	call   948114 <___bpf_prog_run+0x98d4>	948110: R_X86_64_PLT32	__msan_warning-0x4
98d4   948114:	e9 92 a4 ff ff       	jmp    9425ab <___bpf_prog_run+0x3d6b>
98d9   948119:	e8 00 00 00 00       	call   94811e <___bpf_prog_run+0x98de>	94811a: R_X86_64_PLT32	__msan_warning-0x4
98de   94811e:	e9 c4 a4 ff ff       	jmp    9425e7 <___bpf_prog_run+0x3da7>
98e3   948123:	44 89 e7             	mov    %r12d,%edi
98e6   948126:	e8 00 00 00 00       	call   94812b <___bpf_prog_run+0x98eb>	948127: R_X86_64_PLT32	__msan_warning-0x4
98eb   94812b:	e9 fa a4 ff ff       	jmp    94262a <___bpf_prog_run+0x3dea>
98f0   948130:	8b 7c 24 08          	mov    0x8(%rsp),%edi
98f4   948134:	e8 00 00 00 00       	call   948139 <___bpf_prog_run+0x98f9>	948135: R_X86_64_PLT32	__msan_warning-0x4
98f9   948139:	e9 1b a5 ff ff       	jmp    942659 <___bpf_prog_run+0x3e19>
98fe   94813e:	8b 3c 24             	mov    (%rsp),%edi
9901   948141:	e8 00 00 00 00       	call   948146 <___bpf_prog_run+0x9906>	948142: R_X86_64_PLT32	__msan_warning-0x4
9906   948146:	e9 4a a5 ff ff       	jmp    942695 <___bpf_prog_run+0x3e55>
990b   94814b:	8b 3a                	mov    (%rdx),%edi
990d   94814d:	e8 00 00 00 00       	call   948152 <___bpf_prog_run+0x9912>	94814e: R_X86_64_PLT32	__msan_warning-0x4
9912   948152:	83 fd 10             	cmp    $0x10,%ebp
9915   948155:	0f 85 56 a5 ff ff    	jne    9426b1 <___bpf_prog_run+0x3e71>
991b   94815b:	e8 00 00 00 00       	call   948160 <___bpf_prog_run+0x9920>	94815c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
9920   948160:	49 8d 5d 01          	lea    0x1(%r13),%rbx
9924   948164:	4d 85 f6             	test   %r14,%r14
9927   948167:	0f 85 ae 0e 00 00    	jne    94901b <___bpf_prog_run+0xa7db>
992d   94816d:	44 0f b6 33          	movzbl (%rbx),%r14d
9931   948171:	48 89 df             	mov    %rbx,%rdi
9934   948174:	e8 00 00 00 00       	call   948179 <___bpf_prog_run+0x9939>	948175: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
9939   948179:	0f b6 28             	movzbl (%rax),%ebp
993c   94817c:	83 e5 0f             	and    $0xf,%ebp
993f   94817f:	44 8b 7c 24 04       	mov    0x4(%rsp),%r15d
9944   948184:	48 85 ed             	test   %rbp,%rbp
9947   948187:	74 03                	je     94818c <___bpf_prog_run+0x994c>
9949   948189:	44 8b 3a             	mov    (%rdx),%r15d
994c   94818c:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
9951   948191:	41 83 e6 0f          	and    $0xf,%r14d
9955   948195:	48 0b 6c 24 20       	or     0x20(%rsp),%rbp
995a   94819a:	0f 85 88 0e 00 00    	jne    949028 <___bpf_prog_run+0xa7e8>
9960   9481a0:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
9965   9481a5:	4e 8d 2c f0          	lea    (%rax,%r14,8),%r13
9969   9481a9:	45 0f b7 65 00       	movzwl 0x0(%r13),%r12d
996e   9481ae:	4c 89 ef             	mov    %r13,%rdi
9971   9481b1:	e8 00 00 00 00       	call   9481b6 <___bpf_prog_run+0x9976>	9481b2: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
9976   9481b6:	0f b7 18             	movzwl (%rax),%ebx
9979   9481b9:	66 c1 c3 08          	rol    $0x8,%bx
997d   9481bd:	44 8b 32             	mov    (%rdx),%r14d
9980   9481c0:	48 85 ed             	test   %rbp,%rbp
9983   9481c3:	0f 85 6c 0e 00 00    	jne    949035 <___bpf_prog_run+0xa7f5>
9989   9481c9:	66 41 c1 c4 08       	rol    $0x8,%r12w
998e   9481ce:	0f b7 db             	movzwl %bx,%ebx
9991   9481d1:	4c 89 ef             	mov    %r13,%rdi
9994   9481d4:	e8 00 00 00 00       	call   9481d9 <___bpf_prog_run+0x9999>	9481d5: R_X86_64_PLT32	__msan_metadata_ptr_for_store_8-0x4
9999   9481d9:	48 89 18             	mov    %rbx,(%rax)
999c   9481dc:	48 85 db             	test   %rbx,%rbx
999f   9481df:	0f 85 5d 0e 00 00    	jne    949042 <___bpf_prog_run+0xa802>
99a5   9481e5:	41 0f b7 c4          	movzwl %r12w,%eax
99a9   9481e9:	49 89 45 00          	mov    %rax,0x0(%r13)
99ad   9481ed:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
99b2   9481f2:	e9 ff 66 ff ff       	jmp    93e8f6 <___bpf_prog_run+0xb6>
99b7   9481f7:	8b 3c 24             	mov    (%rsp),%edi
99ba   9481fa:	e8 00 00 00 00       	call   9481ff <___bpf_prog_run+0x99bf>	9481fb: R_X86_64_PLT32	__msan_warning-0x4
99bf   9481ff:	e9 59 a5 ff ff       	jmp    94275d <___bpf_prog_run+0x3f1d>
99c4   948204:	8b 3c 24             	mov    (%rsp),%edi
99c7   948207:	e8 00 00 00 00       	call   94820c <___bpf_prog_run+0x99cc>	948208: R_X86_64_PLT32	__msan_warning-0x4
99cc   94820c:	e9 76 a5 ff ff       	jmp    942787 <___bpf_prog_run+0x3f47>
99d1   948211:	8b 3c 24             	mov    (%rsp),%edi
99d4   948214:	e8 00 00 00 00       	call   948219 <___bpf_prog_run+0x99d9>	948215: R_X86_64_PLT32	__msan_warning-0x4
99d9   948219:	e9 92 a5 ff ff       	jmp    9427b0 <___bpf_prog_run+0x3f70>
99de   94821e:	e8 00 00 00 00       	call   948223 <___bpf_prog_run+0x99e3>	94821f: R_X86_64_PLT32	__msan_warning-0x4
99e3   948223:	e9 bf a5 ff ff       	jmp    9427e7 <___bpf_prog_run+0x3fa7>
99e8   948228:	48 89 d3             	mov    %rdx,%rbx
99eb   94822b:	8b 7c 24 08          	mov    0x8(%rsp),%edi
99ef   94822f:	e8 00 00 00 00       	call   948234 <___bpf_prog_run+0x99f4>	948230: R_X86_64_PLT32	__msan_chain_origin-0x4
99f4   948234:	89 c0                	mov    %eax,%eax
99f6   948236:	48 89 c1             	mov    %rax,%rcx
99f9   948239:	48 c1 e1 20          	shl    $0x20,%rcx
99fd   94823d:	48 09 c1             	or     %rax,%rcx
9a00   948240:	48 89 0b             	mov    %rcx,(%rbx)
9a03   948243:	e9 c1 a5 ff ff       	jmp    942809 <___bpf_prog_run+0x3fc9>
9a08   948248:	8b 3c 24             	mov    (%rsp),%edi
9a0b   94824b:	e8 00 00 00 00       	call   948250 <___bpf_prog_run+0x9a10>	94824c: R_X86_64_PLT32	__msan_warning-0x4
9a10   948250:	e9 d3 a5 ff ff       	jmp    942828 <___bpf_prog_run+0x3fe8>
9a15   948255:	8b 3a                	mov    (%rdx),%edi
9a17   948257:	e8 00 00 00 00       	call   94825c <___bpf_prog_run+0x9a1c>	948258: R_X86_64_PLT32	__msan_warning-0x4
9a1c   94825c:	83 fd 20             	cmp    $0x20,%ebp
9a1f   94825f:	0f 85 df a5 ff ff    	jne    942844 <___bpf_prog_run+0x4004>
9a25   948265:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
9a2a   94826a:	e8 00 00 00 00       	call   94826f <___bpf_prog_run+0x9a2f>	94826b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
9a2f   94826f:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
9a35   948275:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
9a3a   94827a:	48 8d 58 01          	lea    0x1(%rax),%rbx
9a3e   94827e:	4d 85 f6             	test   %r14,%r14
9a41   948281:	0f 85 ba 0c 00 00    	jne    948f41 <___bpf_prog_run+0xa701>
9a47   948287:	44 0f b6 33          	movzbl (%rbx),%r14d
9a4b   94828b:	48 89 df             	mov    %rbx,%rdi
9a4e   94828e:	e8 00 00 00 00       	call   948293 <___bpf_prog_run+0x9a53>	94828f: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
9a53   948293:	0f b6 28             	movzbl (%rax),%ebp
9a56   948296:	83 e5 0f             	and    $0xf,%ebp
9a59   948299:	44 8b 7c 24 04       	mov    0x4(%rsp),%r15d
9a5e   94829e:	48 85 ed             	test   %rbp,%rbp
9a61   9482a1:	74 03                	je     9482a6 <___bpf_prog_run+0x9a66>
9a63   9482a3:	44 8b 3a             	mov    (%rdx),%r15d
9a66   9482a6:	41 83 e6 0f          	and    $0xf,%r14d
9a6a   9482aa:	48 0b 6c 24 20       	or     0x20(%rsp),%rbp
9a6f   9482af:	0f 85 99 0c 00 00    	jne    948f4e <___bpf_prog_run+0xa70e>
9a75   9482b5:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
9a7a   9482ba:	4a 8d 1c f0          	lea    (%rax,%r14,8),%rbx
9a7e   9482be:	44 8b 23             	mov    (%rbx),%r12d
9a81   9482c1:	45 21 ec             	and    %r13d,%r12d
9a84   9482c4:	48 89 df             	mov    %rbx,%rdi
9a87   9482c7:	e8 00 00 00 00       	call   9482cc <___bpf_prog_run+0x9a8c>	9482c8: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
9a8c   9482cc:	44 23 28             	and    (%rax),%r13d
9a8f   9482cf:	44 8b 32             	mov    (%rdx),%r14d
9a92   9482d2:	48 85 ed             	test   %rbp,%rbp
9a95   9482d5:	0f 85 80 0c 00 00    	jne    948f5b <___bpf_prog_run+0xa71b>
9a9b   9482db:	48 89 df             	mov    %rbx,%rdi
9a9e   9482de:	e8 00 00 00 00       	call   9482e3 <___bpf_prog_run+0x9aa3>	9482df: R_X86_64_PLT32	__msan_metadata_ptr_for_store_8-0x4
9aa3   9482e3:	4c 89 28             	mov    %r13,(%rax)
9aa6   9482e6:	4d 85 ed             	test   %r13,%r13
9aa9   9482e9:	75 0d                	jne    9482f8 <___bpf_prog_run+0x9ab8>
9aab   9482eb:	4c 89 23             	mov    %r12,(%rbx)
9aae   9482ee:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
9ab3   9482f3:	e9 fe 65 ff ff       	jmp    93e8f6 <___bpf_prog_run+0xb6>
9ab8   9482f8:	49 89 d7             	mov    %rdx,%r15
9abb   9482fb:	44 89 f7             	mov    %r14d,%edi
9abe   9482fe:	e8 00 00 00 00       	call   948303 <___bpf_prog_run+0x9ac3>	9482ff: R_X86_64_PLT32	__msan_chain_origin-0x4
9ac3   948303:	89 c0                	mov    %eax,%eax
9ac5   948305:	48 89 c1             	mov    %rax,%rcx
9ac8   948308:	48 c1 e1 20          	shl    $0x20,%rcx
9acc   94830c:	48 09 c1             	or     %rax,%rcx
9acf   94830f:	49 89 0f             	mov    %rcx,(%r15)
9ad2   948312:	eb d7                	jmp    9482eb <___bpf_prog_run+0x9aab>
9ad4   948314:	8b 3c 24             	mov    (%rsp),%edi
9ad7   948317:	e8 00 00 00 00       	call   94831c <___bpf_prog_run+0x9adc>	948318: R_X86_64_PLT32	__msan_warning-0x4
9adc   94831c:	e9 4e a5 ff ff       	jmp    94286f <___bpf_prog_run+0x402f>
9ae1   948321:	e8 00 00 00 00       	call   948326 <___bpf_prog_run+0x9ae6>	948322: R_X86_64_PLT32	__msan_warning-0x4
9ae6   948326:	e9 71 a5 ff ff       	jmp    94289c <___bpf_prog_run+0x405c>
9aeb   94832b:	8b 3c 24             	mov    (%rsp),%edi
9aee   94832e:	e8 00 00 00 00       	call   948333 <___bpf_prog_run+0x9af3>	94832f: R_X86_64_PLT32	__msan_warning-0x4
9af3   948333:	e9 8b a5 ff ff       	jmp    9428c3 <___bpf_prog_run+0x4083>
9af8   948338:	8b 3c 24             	mov    (%rsp),%edi
9afb   94833b:	e8 00 00 00 00       	call   948340 <___bpf_prog_run+0x9b00>	94833c: R_X86_64_PLT32	__msan_warning-0x4
9b00   948340:	e9 ec a5 ff ff       	jmp    942931 <___bpf_prog_run+0x40f1>
9b05   948345:	e8 00 00 00 00       	call   94834a <___bpf_prog_run+0x9b0a>	948346: R_X86_64_PLT32	__msan_warning-0x4
9b0a   94834a:	e9 1e a6 ff ff       	jmp    94296d <___bpf_prog_run+0x412d>
9b0f   94834f:	44 89 e7             	mov    %r12d,%edi
9b12   948352:	e8 00 00 00 00       	call   948357 <___bpf_prog_run+0x9b17>	948353: R_X86_64_PLT32	__msan_warning-0x4
9b17   948357:	e9 52 a6 ff ff       	jmp    9429ae <___bpf_prog_run+0x416e>
9b1c   94835c:	8b 7c 24 08          	mov    0x8(%rsp),%edi
9b20   948360:	e8 00 00 00 00       	call   948365 <___bpf_prog_run+0x9b25>	948361: R_X86_64_PLT32	__msan_warning-0x4
9b25   948365:	e9 70 a6 ff ff       	jmp    9429da <___bpf_prog_run+0x419a>
9b2a   94836a:	8b 3c 24             	mov    (%rsp),%edi
9b2d   94836d:	e8 00 00 00 00       	call   948372 <___bpf_prog_run+0x9b32>	94836e: R_X86_64_PLT32	__msan_warning-0x4
9b32   948372:	e9 8d a6 ff ff       	jmp    942a04 <___bpf_prog_run+0x41c4>
9b37   948377:	e8 00 00 00 00       	call   94837c <___bpf_prog_run+0x9b3c>	948378: R_X86_64_PLT32	__msan_warning-0x4
9b3c   94837c:	e9 bf a6 ff ff       	jmp    942a40 <___bpf_prog_run+0x4200>
9b41   948381:	44 89 e7             	mov    %r12d,%edi
9b44   948384:	e8 00 00 00 00       	call   948389 <___bpf_prog_run+0x9b49>	948385: R_X86_64_PLT32	__msan_warning-0x4
9b49   948389:	e9 f3 a6 ff ff       	jmp    942a81 <___bpf_prog_run+0x4241>
9b4e   94838e:	8b 7c 24 08          	mov    0x8(%rsp),%edi
9b52   948392:	e8 00 00 00 00       	call   948397 <___bpf_prog_run+0x9b57>	948393: R_X86_64_PLT32	__msan_warning-0x4
9b57   948397:	e9 11 a7 ff ff       	jmp    942aad <___bpf_prog_run+0x426d>
9b5c   94839c:	8b 3c 24             	mov    (%rsp),%edi
9b5f   94839f:	e8 00 00 00 00       	call   9483a4 <___bpf_prog_run+0x9b64>	9483a0: R_X86_64_PLT32	__msan_warning-0x4
9b64   9483a4:	e9 3f a7 ff ff       	jmp    942ae8 <___bpf_prog_run+0x42a8>
9b69   9483a9:	e8 00 00 00 00       	call   9483ae <___bpf_prog_run+0x9b6e>	9483aa: R_X86_64_PLT32	__msan_warning-0x4
9b6e   9483ae:	e9 71 a7 ff ff       	jmp    942b24 <___bpf_prog_run+0x42e4>
9b73   9483b3:	44 89 e7             	mov    %r12d,%edi
9b76   9483b6:	e8 00 00 00 00       	call   9483bb <___bpf_prog_run+0x9b7b>	9483b7: R_X86_64_PLT32	__msan_warning-0x4
9b7b   9483bb:	e9 a4 a7 ff ff       	jmp    942b64 <___bpf_prog_run+0x4324>
9b80   9483c0:	8b 7c 24 08          	mov    0x8(%rsp),%edi
9b84   9483c4:	e8 00 00 00 00       	call   9483c9 <___bpf_prog_run+0x9b89>	9483c5: R_X86_64_PLT32	__msan_warning-0x4
9b89   9483c9:	4c 39 fd             	cmp    %r15,%rbp
9b8c   9483cc:	0f 84 e5 a7 ff ff    	je     942bb7 <___bpf_prog_run+0x4377>
9b92   9483d2:	e8 00 00 00 00       	call   9483d7 <___bpf_prog_run+0x9b97>	9483d3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
9b97   9483d7:	49 83 c5 08          	add    $0x8,%r13
9b9b   9483db:	e9 1f 65 ff ff       	jmp    93e8ff <___bpf_prog_run+0xbf>
9ba0   9483e0:	8b 3c 24             	mov    (%rsp),%edi
9ba3   9483e3:	e8 00 00 00 00       	call   9483e8 <___bpf_prog_run+0x9ba8>	9483e4: R_X86_64_PLT32	__msan_warning-0x4
9ba8   9483e8:	e9 f6 a7 ff ff       	jmp    942be3 <___bpf_prog_run+0x43a3>
9bad   9483ed:	e8 00 00 00 00       	call   9483f2 <___bpf_prog_run+0x9bb2>	9483ee: R_X86_64_PLT32	__msan_warning-0x4
9bb2   9483f2:	e9 28 a8 ff ff       	jmp    942c1f <___bpf_prog_run+0x43df>
9bb7   9483f7:	44 89 e7             	mov    %r12d,%edi
9bba   9483fa:	e8 00 00 00 00       	call   9483ff <___bpf_prog_run+0x9bbf>	9483fb: R_X86_64_PLT32	__msan_warning-0x4
9bbf   9483ff:	e9 58 a8 ff ff       	jmp    942c5c <___bpf_prog_run+0x441c>
9bc4   948404:	8b 7c 24 08          	mov    0x8(%rsp),%edi
9bc8   948408:	e8 00 00 00 00       	call   94840d <___bpf_prog_run+0x9bcd>	948409: R_X86_64_PLT32	__msan_warning-0x4
9bcd   94840d:	44 39 fd             	cmp    %r15d,%ebp
9bd0   948410:	0f 84 91 a8 ff ff    	je     942ca7 <___bpf_prog_run+0x4467>
9bd6   948416:	e8 00 00 00 00       	call   94841b <___bpf_prog_run+0x9bdb>	948417: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
9bdb   94841b:	49 83 c5 08          	add    $0x8,%r13
9bdf   94841f:	e9 db 64 ff ff       	jmp    93e8ff <___bpf_prog_run+0xbf>
9be4   948424:	8b 3c 24             	mov    (%rsp),%edi
9be7   948427:	e8 00 00 00 00       	call   94842c <___bpf_prog_run+0x9bec>	948428: R_X86_64_PLT32	__msan_warning-0x4
9bec   94842c:	e9 a2 a8 ff ff       	jmp    942cd3 <___bpf_prog_run+0x4493>
9bf1   948431:	e8 00 00 00 00       	call   948436 <___bpf_prog_run+0x9bf6>	948432: R_X86_64_PLT32	__msan_warning-0x4
9bf6   948436:	e9 d4 a8 ff ff       	jmp    942d0f <___bpf_prog_run+0x44cf>
9bfb   94843b:	44 89 e7             	mov    %r12d,%edi
9bfe   94843e:	e8 00 00 00 00       	call   948443 <___bpf_prog_run+0x9c03>	94843f: R_X86_64_PLT32	__msan_warning-0x4
9c03   948443:	e9 0a a9 ff ff       	jmp    942d52 <___bpf_prog_run+0x4512>
9c08   948448:	8b 7c 24 08          	mov    0x8(%rsp),%edi
9c0c   94844c:	e8 00 00 00 00       	call   948451 <___bpf_prog_run+0x9c11>	94844d: R_X86_64_PLT32	__msan_warning-0x4
9c11   948451:	e9 2b a9 ff ff       	jmp    942d81 <___bpf_prog_run+0x4541>
9c16   948456:	8b 3c 24             	mov    (%rsp),%edi
9c19   948459:	e8 00 00 00 00       	call   94845e <___bpf_prog_run+0x9c1e>	94845a: R_X86_64_PLT32	__msan_warning-0x4
9c1e   94845e:	e9 51 a9 ff ff       	jmp    942db4 <___bpf_prog_run+0x4574>
9c23   948463:	8b 3c 24             	mov    (%rsp),%edi
9c26   948466:	e8 00 00 00 00       	call   94846b <___bpf_prog_run+0x9c2b>	948467: R_X86_64_PLT32	__msan_warning-0x4
9c2b   94846b:	e9 63 a9 ff ff       	jmp    942dd3 <___bpf_prog_run+0x4593>
9c30   948470:	8b 3c 24             	mov    (%rsp),%edi
9c33   948473:	e8 00 00 00 00       	call   948478 <___bpf_prog_run+0x9c38>	948474: R_X86_64_PLT32	__msan_warning-0x4
9c38   948478:	e9 97 a9 ff ff       	jmp    942e14 <___bpf_prog_run+0x45d4>
9c3d   94847d:	e8 00 00 00 00       	call   948482 <___bpf_prog_run+0x9c42>	94847e: R_X86_64_PLT32	__msan_warning-0x4
9c42   948482:	e9 ba a9 ff ff       	jmp    942e41 <___bpf_prog_run+0x4601>
9c47   948487:	8b 3c 24             	mov    (%rsp),%edi
9c4a   94848a:	e8 00 00 00 00       	call   94848f <___bpf_prog_run+0x9c4f>	94848b: R_X86_64_PLT32	__msan_warning-0x4
9c4f   94848f:	e9 d3 a9 ff ff       	jmp    942e67 <___bpf_prog_run+0x4627>
9c54   948494:	44 89 f7             	mov    %r14d,%edi
9c57   948497:	e8 00 00 00 00       	call   94849c <___bpf_prog_run+0x9c5c>	948498: R_X86_64_PLT32	__msan_warning-0x4
9c5c   94849c:	45 39 fc             	cmp    %r15d,%r12d
9c5f   94849f:	0f 84 f6 a9 ff ff    	je     942e9b <___bpf_prog_run+0x465b>
9c65   9484a5:	e8 00 00 00 00       	call   9484aa <___bpf_prog_run+0x9c6a>	9484a6: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
9c6a   9484aa:	49 8d 5d 02          	lea    0x2(%r13),%rbx
9c6e   9484ae:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
9c73   9484b3:	4d 85 f6             	test   %r14,%r14
9c76   9484b6:	0f 85 b9 0a 00 00    	jne    948f75 <___bpf_prog_run+0xa735>
9c7c   9484bc:	49 0f bf 6d 02       	movswq 0x2(%r13),%rbp
9c81   9484c1:	48 89 df             	mov    %rbx,%rdi
9c84   9484c4:	e8 00 00 00 00       	call   9484c9 <___bpf_prog_run+0x9c89>	9484c5: R_X86_64_PLT32	__msan_metadata_ptr_for_load_2-0x4
9c89   9484c9:	48 0f bf 00          	movswq (%rax),%rax
9c8d   9484cd:	48 85 c0             	test   %rax,%rax
9c90   9484d0:	74 05                	je     9484d7 <___bpf_prog_run+0x9c97>
9c92   9484d2:	8b 0a                	mov    (%rdx),%ecx
9c94   9484d4:	89 0c 24             	mov    %ecx,(%rsp)
9c97   9484d7:	49 09 c6             	or     %rax,%r14
9c9a   9484da:	4d 8d 6c ed 08       	lea    0x8(%r13,%rbp,8),%r13
9c9f   9484df:	e9 1b 64 ff ff       	jmp    93e8ff <___bpf_prog_run+0xbf>
9ca4   9484e4:	8b 3c 24             	mov    (%rsp),%edi
9ca7   9484e7:	e8 00 00 00 00       	call   9484ec <___bpf_prog_run+0x9cac>	9484e8: R_X86_64_PLT32	__msan_warning-0x4
9cac   9484ec:	e9 c1 a9 ff ff       	jmp    942eb2 <___bpf_prog_run+0x4672>
9cb1   9484f1:	e8 00 00 00 00       	call   9484f6 <___bpf_prog_run+0x9cb6>	9484f2: R_X86_64_PLT32	__msan_warning-0x4
9cb6   9484f6:	e9 ed a9 ff ff       	jmp    942ee8 <___bpf_prog_run+0x46a8>
9cbb   9484fb:	8b 3c 24             	mov    (%rsp),%edi
9cbe   9484fe:	e8 00 00 00 00       	call   948503 <___bpf_prog_run+0x9cc3>	9484ff: R_X86_64_PLT32	__msan_warning-0x4
9cc3   948503:	e9 19 aa ff ff       	jmp    942f21 <___bpf_prog_run+0x46e1>
9cc8   948508:	8b 3c 24             	mov    (%rsp),%edi
9ccb   94850b:	e8 00 00 00 00       	call   948510 <___bpf_prog_run+0x9cd0>	94850c: R_X86_64_PLT32	__msan_warning-0x4
9cd0   948510:	e9 87 aa ff ff       	jmp    942f9c <___bpf_prog_run+0x475c>
9cd5   948515:	e8 00 00 00 00       	call   94851a <___bpf_prog_run+0x9cda>	948516: R_X86_64_PLT32	__msan_warning-0x4
9cda   94851a:	e9 bb aa ff ff       	jmp    942fda <___bpf_prog_run+0x479a>
9cdf   94851f:	44 89 e7             	mov    %r12d,%edi
9ce2   948522:	e8 00 00 00 00       	call   948527 <___bpf_prog_run+0x9ce7>	948523: R_X86_64_PLT32	__msan_warning-0x4
9ce7   948527:	e9 e9 aa ff ff       	jmp    943015 <___bpf_prog_run+0x47d5>
9cec   94852c:	8b 3c 24             	mov    (%rsp),%edi
9cef   94852f:	e8 00 00 00 00       	call   948534 <___bpf_prog_run+0x9cf4>	948530: R_X86_64_PLT32	__msan_warning-0x4
9cf4   948534:	e9 3c ab ff ff       	jmp    943075 <___bpf_prog_run+0x4835>
9cf9   948539:	e8 00 00 00 00       	call   94853e <___bpf_prog_run+0x9cfe>	94853a: R_X86_64_PLT32	__msan_warning-0x4
9cfe   94853e:	e9 6e ab ff ff       	jmp    9430b1 <___bpf_prog_run+0x4871>
9d03   948543:	44 89 e7             	mov    %r12d,%edi
9d06   948546:	e8 00 00 00 00       	call   94854b <___bpf_prog_run+0x9d0b>	948547: R_X86_64_PLT32	__msan_warning-0x4
9d0b   94854b:	e9 a2 ab ff ff       	jmp    9430f2 <___bpf_prog_run+0x48b2>
9d10   948550:	8b 7c 24 08          	mov    0x8(%rsp),%edi
9d14   948554:	e8 00 00 00 00       	call   948559 <___bpf_prog_run+0x9d19>	948555: R_X86_64_PLT32	__msan_warning-0x4
9d19   948559:	e9 c0 ab ff ff       	jmp    94311e <___bpf_prog_run+0x48de>
9d1e   94855e:	8b 3c 24             	mov    (%rsp),%edi
9d21   948561:	e8 00 00 00 00       	call   948566 <___bpf_prog_run+0x9d26>	948562: R_X86_64_PLT32	__msan_warning-0x4
9d26   948566:	e9 f8 ab ff ff       	jmp    943163 <___bpf_prog_run+0x4923>
9d2b   94856b:	e8 00 00 00 00       	call   948570 <___bpf_prog_run+0x9d30>	94856c: R_X86_64_PLT32	__msan_warning-0x4
9d30   948570:	e9 1d ac ff ff       	jmp    943192 <___bpf_prog_run+0x4952>
9d35   948575:	8b 7c 24 04          	mov    0x4(%rsp),%edi
9d39   948579:	e8 00 00 00 00       	call   94857e <___bpf_prog_run+0x9d3e>	94857a: R_X86_64_PLT32	__msan_warning-0x4
9d3e   94857e:	e9 32 ac ff ff       	jmp    9431b5 <___bpf_prog_run+0x4975>
9d43   948583:	48 89 d3             	mov    %rdx,%rbx
9d46   948586:	8b 7c 24 18          	mov    0x18(%rsp),%edi
9d4a   94858a:	e8 00 00 00 00       	call   94858f <___bpf_prog_run+0x9d4f>	94858b: R_X86_64_PLT32	__msan_chain_origin-0x4
9d4f   94858f:	89 c0                	mov    %eax,%eax
9d51   948591:	48 89 c1             	mov    %rax,%rcx
9d54   948594:	48 c1 e1 20          	shl    $0x20,%rcx
9d58   948598:	48 09 c1             	or     %rax,%rcx
9d5b   94859b:	48 89 0b             	mov    %rcx,(%rbx)
9d5e   94859e:	e9 2b ac ff ff       	jmp    9431ce <___bpf_prog_run+0x498e>
9d63   9485a3:	8b 3c 24             	mov    (%rsp),%edi
9d66   9485a6:	e8 00 00 00 00       	call   9485ab <___bpf_prog_run+0x9d6b>	9485a7: R_X86_64_PLT32	__msan_warning-0x4
9d6b   9485ab:	e9 2e ac ff ff       	jmp    9431de <___bpf_prog_run+0x499e>
9d70   9485b0:	e8 00 00 00 00       	call   9485b5 <___bpf_prog_run+0x9d75>	9485b1: R_X86_64_PLT32	__msan_warning-0x4
9d75   9485b5:	e9 59 ac ff ff       	jmp    943213 <___bpf_prog_run+0x49d3>
9d7a   9485ba:	8b 3a                	mov    (%rdx),%edi
9d7c   9485bc:	e8 00 00 00 00       	call   9485c1 <___bpf_prog_run+0x9d81>	9485bd: R_X86_64_PLT32	__msan_warning-0x4
9d81   9485c1:	e9 60 ac ff ff       	jmp    943226 <___bpf_prog_run+0x49e6>
9d86   9485c6:	8b 7c 24 04          	mov    0x4(%rsp),%edi
9d8a   9485ca:	e8 00 00 00 00       	call   9485cf <___bpf_prog_run+0x9d8f>	9485cb: R_X86_64_PLT32	__msan_warning-0x4
9d8f   9485cf:	e9 68 ac ff ff       	jmp    94323c <___bpf_prog_run+0x49fc>
9d94   9485d4:	49 89 d4             	mov    %rdx,%r12
9d97   9485d7:	8b 7c 24 18          	mov    0x18(%rsp),%edi
9d9b   9485db:	e8 00 00 00 00       	call   9485e0 <___bpf_prog_run+0x9da0>	9485dc: R_X86_64_PLT32	__msan_chain_origin-0x4
9da0   9485e0:	89 c0                	mov    %eax,%eax
9da2   9485e2:	48 89 c1             	mov    %rax,%rcx
9da5   9485e5:	48 c1 e1 20          	shl    $0x20,%rcx
9da9   9485e9:	48 09 c1             	or     %rax,%rcx
9dac   9485ec:	49 89 0c 24          	mov    %rcx,(%r12)
9db0   9485f0:	e9 63 ac ff ff       	jmp    943258 <___bpf_prog_run+0x4a18>
9db5   9485f5:	8b 3c 24             	mov    (%rsp),%edi
9db8   9485f8:	e8 00 00 00 00       	call   9485fd <___bpf_prog_run+0x9dbd>	9485f9: R_X86_64_PLT32	__msan_warning-0x4
9dbd   9485fd:	e9 66 ac ff ff       	jmp    943268 <___bpf_prog_run+0x4a28>
9dc2   948602:	e8 00 00 00 00       	call   948607 <___bpf_prog_run+0x9dc7>	948603: R_X86_64_PLT32	__msan_warning-0x4
9dc7   948607:	e9 92 ac ff ff       	jmp    94329e <___bpf_prog_run+0x4a5e>
9dcc   94860c:	8b 3c 24             	mov    (%rsp),%edi
9dcf   94860f:	e8 00 00 00 00       	call   948614 <___bpf_prog_run+0x9dd4>	948610: R_X86_64_PLT32	__msan_warning-0x4
9dd4   948614:	e9 d4 ac ff ff       	jmp    9432ed <___bpf_prog_run+0x4aad>
9dd9   948619:	89 df                	mov    %ebx,%edi
9ddb   94861b:	e8 00 00 00 00       	call   948620 <___bpf_prog_run+0x9de0>	94861c: R_X86_64_PLT32	__msan_warning-0x4
9de0   948620:	e9 f9 ac ff ff       	jmp    94331e <___bpf_prog_run+0x4ade>
9de5   948625:	8b 3c 24             	mov    (%rsp),%edi
9de8   948628:	e8 00 00 00 00       	call   94862d <___bpf_prog_run+0x9ded>	948629: R_X86_64_PLT32	__msan_warning-0x4
9ded   94862d:	e9 23 ad ff ff       	jmp    943355 <___bpf_prog_run+0x4b15>
9df2   948632:	8b 7c 24 08          	mov    0x8(%rsp),%edi
9df6   948636:	e8 00 00 00 00       	call   94863b <___bpf_prog_run+0x9dfb>	948637: R_X86_64_PLT32	__msan_warning-0x4
9dfb   94863b:	e9 3b ad ff ff       	jmp    94337b <___bpf_prog_run+0x4b3b>
9e00   948640:	8b 3c 24             	mov    (%rsp),%edi
9e03   948643:	e8 00 00 00 00       	call   948648 <___bpf_prog_run+0x9e08>	948644: R_X86_64_PLT32	__msan_warning-0x4
9e08   948648:	e9 49 ad ff ff       	jmp    943396 <___bpf_prog_run+0x4b56>
9e0d   94864d:	89 df                	mov    %ebx,%edi
9e0f   94864f:	e8 00 00 00 00       	call   948654 <___bpf_prog_run+0x9e14>	948650: R_X86_64_PLT32	__msan_warning-0x4
9e14   948654:	e9 78 ad ff ff       	jmp    9433d1 <___bpf_prog_run+0x4b91>
9e19   948659:	44 89 ef             	mov    %r13d,%edi
9e1c   94865c:	e8 00 00 00 00       	call   948661 <___bpf_prog_run+0x9e21>	94865d: R_X86_64_PLT32	__msan_warning-0x4
9e21   948661:	e9 af ad ff ff       	jmp    943415 <___bpf_prog_run+0x4bd5>
9e26   948666:	8b 3c 24             	mov    (%rsp),%edi
9e29   948669:	e8 00 00 00 00       	call   94866e <___bpf_prog_run+0x9e2e>	94866a: R_X86_64_PLT32	__msan_warning-0x4
9e2e   94866e:	e9 f0 ad ff ff       	jmp    943463 <___bpf_prog_run+0x4c23>
9e33   948673:	89 df                	mov    %ebx,%edi
9e35   948675:	e8 00 00 00 00       	call   94867a <___bpf_prog_run+0x9e3a>	948676: R_X86_64_PLT32	__msan_warning-0x4
9e3a   94867a:	e9 15 ae ff ff       	jmp    943494 <___bpf_prog_run+0x4c54>
9e3f   94867f:	8b 3c 24             	mov    (%rsp),%edi
9e42   948682:	e8 00 00 00 00       	call   948687 <___bpf_prog_run+0x9e47>	948683: R_X86_64_PLT32	__msan_warning-0x4
9e47   948687:	e9 3f ae ff ff       	jmp    9434cb <___bpf_prog_run+0x4c8b>
9e4c   94868c:	8b 3a                	mov    (%rdx),%edi
9e4e   94868e:	e8 00 00 00 00       	call   948693 <___bpf_prog_run+0x9e53>	94868f: R_X86_64_PLT32	__msan_warning-0x4
9e53   948693:	e9 47 ae ff ff       	jmp    9434df <___bpf_prog_run+0x4c9f>
9e58   948698:	8b 3c 24             	mov    (%rsp),%edi
9e5b   94869b:	e8 00 00 00 00       	call   9486a0 <___bpf_prog_run+0x9e60>	94869c: R_X86_64_PLT32	__msan_warning-0x4
9e60   9486a0:	e9 6c ae ff ff       	jmp    943511 <___bpf_prog_run+0x4cd1>
9e65   9486a5:	44 89 f7             	mov    %r14d,%edi
9e68   9486a8:	e8 00 00 00 00       	call   9486ad <___bpf_prog_run+0x9e6d>	9486a9: R_X86_64_PLT32	__msan_warning-0x4
9e6d   9486ad:	e9 8e ae ff ff       	jmp    943540 <___bpf_prog_run+0x4d00>
9e72   9486b2:	8b 3c 24             	mov    (%rsp),%edi
9e75   9486b5:	e8 00 00 00 00       	call   9486ba <___bpf_prog_run+0x9e7a>	9486b6: R_X86_64_PLT32	__msan_warning-0x4
9e7a   9486ba:	e9 ba ae ff ff       	jmp    943579 <___bpf_prog_run+0x4d39>
9e7f   9486bf:	8b 7c 24 38          	mov    0x38(%rsp),%edi
9e83   9486c3:	e8 00 00 00 00       	call   9486c8 <___bpf_prog_run+0x9e88>	9486c4: R_X86_64_PLT32	__msan_warning-0x4
9e88   9486c8:	e9 e3 ae ff ff       	jmp    9435b0 <___bpf_prog_run+0x4d70>
9e8d   9486cd:	48 89 d5             	mov    %rdx,%rbp
9e90   9486d0:	8b 7c 24 08          	mov    0x8(%rsp),%edi
9e94   9486d4:	e8 00 00 00 00       	call   9486d9 <___bpf_prog_run+0x9e99>	9486d5: R_X86_64_PLT32	__msan_chain_origin-0x4
9e99   9486d9:	89 c0                	mov    %eax,%eax
9e9b   9486db:	48 89 c1             	mov    %rax,%rcx
9e9e   9486de:	48 c1 e1 20          	shl    $0x20,%rcx
9ea2   9486e2:	48 09 c1             	or     %rax,%rcx
9ea5   9486e5:	48 89 4d 00          	mov    %rcx,0x0(%rbp)
9ea9   9486e9:	e9 de ae ff ff       	jmp    9435cc <___bpf_prog_run+0x4d8c>
9eae   9486ee:	8b 3c 24             	mov    (%rsp),%edi
9eb1   9486f1:	e8 00 00 00 00       	call   9486f6 <___bpf_prog_run+0x9eb6>	9486f2: R_X86_64_PLT32	__msan_warning-0x4
9eb6   9486f6:	e9 f0 ae ff ff       	jmp    9435eb <___bpf_prog_run+0x4dab>
9ebb   9486fb:	e8 00 00 00 00       	call   948700 <___bpf_prog_run+0x9ec0>	9486fc: R_X86_64_PLT32	__msan_warning-0x4
9ec0   948700:	e9 23 af ff ff       	jmp    943628 <___bpf_prog_run+0x4de8>
9ec5   948705:	44 89 ff             	mov    %r15d,%edi
9ec8   948708:	e8 00 00 00 00       	call   94870d <___bpf_prog_run+0x9ecd>	948709: R_X86_64_PLT32	__msan_warning-0x4
9ecd   94870d:	e9 54 af ff ff       	jmp    943666 <___bpf_prog_run+0x4e26>
9ed2   948712:	8b 3c 24             	mov    (%rsp),%edi
9ed5   948715:	e8 00 00 00 00       	call   94871a <___bpf_prog_run+0x9eda>	948716: R_X86_64_PLT32	__msan_warning-0x4
9eda   94871a:	e9 77 af ff ff       	jmp    943696 <___bpf_prog_run+0x4e56>
9edf   94871f:	44 89 ff             	mov    %r15d,%edi
9ee2   948722:	e8 00 00 00 00       	call   948727 <___bpf_prog_run+0x9ee7>	948723: R_X86_64_PLT32	__msan_warning-0x4
9ee7   948727:	e9 8e af ff ff       	jmp    9436ba <___bpf_prog_run+0x4e7a>
9eec   94872c:	48 89 d3             	mov    %rdx,%rbx
9eef   94872f:	8b 7c 24 38          	mov    0x38(%rsp),%edi
9ef3   948733:	e8 00 00 00 00       	call   948738 <___bpf_prog_run+0x9ef8>	948734: R_X86_64_PLT32	__msan_chain_origin-0x4
9ef8   948738:	89 c0                	mov    %eax,%eax
9efa   94873a:	48 89 c1             	mov    %rax,%rcx
9efd   94873d:	48 c1 e1 20          	shl    $0x20,%rcx
9f01   948741:	48 09 c1             	or     %rax,%rcx
9f04   948744:	48 89 0b             	mov    %rcx,(%rbx)
9f07   948747:	e9 87 af ff ff       	jmp    9436d3 <___bpf_prog_run+0x4e93>
9f0c   94874c:	8b 3c 24             	mov    (%rsp),%edi
9f0f   94874f:	e8 00 00 00 00       	call   948754 <___bpf_prog_run+0x9f14>	948750: R_X86_64_PLT32	__msan_warning-0x4
9f14   948754:	e9 9a af ff ff       	jmp    9436f3 <___bpf_prog_run+0x4eb3>
9f19   948759:	e8 00 00 00 00       	call   94875e <___bpf_prog_run+0x9f1e>	94875a: R_X86_64_PLT32	__msan_warning-0x4
9f1e   94875e:	e9 d1 af ff ff       	jmp    943734 <___bpf_prog_run+0x4ef4>
9f23   948763:	44 89 f7             	mov    %r14d,%edi
9f26   948766:	e8 00 00 00 00       	call   94876b <___bpf_prog_run+0x9f2b>	948767: R_X86_64_PLT32	__msan_warning-0x4
9f2b   94876b:	e9 04 b0 ff ff       	jmp    943774 <___bpf_prog_run+0x4f34>
9f30   948770:	8b 3a                	mov    (%rdx),%edi
9f32   948772:	e8 00 00 00 00       	call   948777 <___bpf_prog_run+0x9f37>	948773: R_X86_64_PLT32	__msan_warning-0x4
9f37   948777:	e9 15 b0 ff ff       	jmp    943791 <___bpf_prog_run+0x4f51>
9f3c   94877c:	44 89 f7             	mov    %r14d,%edi
9f3f   94877f:	e8 00 00 00 00       	call   948784 <___bpf_prog_run+0x9f44>	948780: R_X86_64_PLT32	__msan_warning-0x4
9f44   948784:	4d 85 ff             	test   %r15,%r15
9f47   948787:	0f 85 32 c2 ff ff    	jne    9449bf <___bpf_prog_run+0x617f>
9f4d   94878d:	e8 00 00 00 00       	call   948792 <___bpf_prog_run+0x9f52>	94878e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
9f52   948792:	e9 5f 61 ff ff       	jmp    93e8f6 <___bpf_prog_run+0xb6>
9f57   948797:	8b 7c 24 08          	mov    0x8(%rsp),%edi
9f5b   94879b:	e8 00 00 00 00       	call   9487a0 <___bpf_prog_run+0x9f60>	94879c: R_X86_64_PLT32	__msan_warning-0x4
9f60   9487a0:	44 39 fd             	cmp    %r15d,%ebp
9f63   9487a3:	0f 84 c5 c5 ff ff    	je     944d6e <___bpf_prog_run+0x652e>
9f69   9487a9:	e8 00 00 00 00       	call   9487ae <___bpf_prog_run+0x9f6e>	9487aa: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
9f6e   9487ae:	49 8d 5d 02          	lea    0x2(%r13),%rbx
9f72   9487b2:	4d 85 f6             	test   %r14,%r14
9f75   9487b5:	0f 85 c7 07 00 00    	jne    948f82 <___bpf_prog_run+0xa742>
9f7b   9487bb:	49 0f bf 6d 02       	movswq 0x2(%r13),%rbp
9f80   9487c0:	48 89 df             	mov    %rbx,%rdi
9f83   9487c3:	e8 00 00 00 00       	call   9487c8 <___bpf_prog_run+0x9f88>	9487c4: R_X86_64_PLT32	__msan_metadata_ptr_for_load_2-0x4
9f88   9487c8:	48 0f bf 00          	movswq (%rax),%rax
9f8c   9487cc:	48 85 c0             	test   %rax,%rax
9f8f   9487cf:	74 05                	je     9487d6 <___bpf_prog_run+0x9f96>
9f91   9487d1:	8b 0a                	mov    (%rdx),%ecx
9f93   9487d3:	89 0c 24             	mov    %ecx,(%rsp)
9f96   9487d6:	49 09 c6             	or     %rax,%r14
9f99   9487d9:	4d 8d 6c ed 08       	lea    0x8(%r13,%rbp,8),%r13
9f9e   9487de:	e9 1c 61 ff ff       	jmp    93e8ff <___bpf_prog_run+0xbf>
9fa3   9487e3:	8b 7c 24 18          	mov    0x18(%rsp),%edi
9fa7   9487e7:	e8 00 00 00 00       	call   9487ec <___bpf_prog_run+0x9fac>	9487e8: R_X86_64_PLT32	__msan_warning-0x4
9fac   9487ec:	e9 03 cd ff ff       	jmp    9454f4 <___bpf_prog_run+0x6cb4>
9fb1   9487f1:	48 89 d3             	mov    %rdx,%rbx
9fb4   9487f4:	8b 7c 24 08          	mov    0x8(%rsp),%edi
9fb8   9487f8:	e8 00 00 00 00       	call   9487fd <___bpf_prog_run+0x9fbd>	9487f9: R_X86_64_PLT32	__msan_chain_origin-0x4
9fbd   9487fd:	89 c0                	mov    %eax,%eax
9fbf   9487ff:	48 89 c1             	mov    %rax,%rcx
9fc2   948802:	48 c1 e1 20          	shl    $0x20,%rcx
9fc6   948806:	48 09 c1             	or     %rax,%rcx
9fc9   948809:	48 89 0b             	mov    %rcx,(%rbx)
9fcc   94880c:	e9 fc cc ff ff       	jmp    94550d <___bpf_prog_run+0x6ccd>
9fd1   948811:	8b 7c 24 04          	mov    0x4(%rsp),%edi
9fd5   948815:	e8 00 00 00 00       	call   94881a <___bpf_prog_run+0x9fda>	948816: R_X86_64_PLT32	__msan_warning-0x4
9fda   94881a:	e9 15 cd ff ff       	jmp    945534 <___bpf_prog_run+0x6cf4>
9fdf   94881f:	48 89 d5             	mov    %rdx,%rbp
9fe2   948822:	8b 7c 24 38          	mov    0x38(%rsp),%edi
9fe6   948826:	e8 00 00 00 00       	call   94882b <___bpf_prog_run+0x9feb>	948827: R_X86_64_PLT32	__msan_chain_origin-0x4
9feb   94882b:	89 c0                	mov    %eax,%eax
9fed   94882d:	48 89 c1             	mov    %rax,%rcx
9ff0   948830:	48 c1 e1 20          	shl    $0x20,%rcx
9ff4   948834:	48 09 c1             	or     %rax,%rcx
9ff7   948837:	48 89 4d 00          	mov    %rcx,0x0(%rbp)
9ffb   94883b:	e9 08 cd ff ff       	jmp    945548 <___bpf_prog_run+0x6d08>
a000   948840:	8b 3c 24             	mov    (%rsp),%edi
a003   948843:	e8 00 00 00 00       	call   948848 <___bpf_prog_run+0xa008>	948844: R_X86_64_PLT32	__msan_warning-0x4
a008   948848:	e9 07 cd ff ff       	jmp    945554 <___bpf_prog_run+0x6d14>
a00d   94884d:	e8 00 00 00 00       	call   948852 <___bpf_prog_run+0xa012>	94884e: R_X86_64_PLT32	__msan_warning-0x4
a012   948852:	e9 2c cd ff ff       	jmp    945583 <___bpf_prog_run+0x6d43>
a017   948857:	49 89 d6             	mov    %rdx,%r14
a01a   94885a:	8b 7c 24 38          	mov    0x38(%rsp),%edi
a01e   94885e:	e8 00 00 00 00       	call   948863 <___bpf_prog_run+0xa023>	94885f: R_X86_64_PLT32	__msan_chain_origin-0x4
a023   948863:	89 c0                	mov    %eax,%eax
a025   948865:	48 89 c1             	mov    %rax,%rcx
a028   948868:	48 c1 e1 20          	shl    $0x20,%rcx
a02c   94886c:	48 09 c1             	or     %rax,%rcx
a02f   94886f:	49 89 0e             	mov    %rcx,(%r14)
a032   948872:	e9 29 cd ff ff       	jmp    9455a0 <___bpf_prog_run+0x6d60>
a037   948877:	8b 3c 24             	mov    (%rsp),%edi
a03a   94887a:	e8 00 00 00 00       	call   94887f <___bpf_prog_run+0xa03f>	94887b: R_X86_64_PLT32	__msan_warning-0x4
a03f   94887f:	e9 4e af ff ff       	jmp    9437d2 <___bpf_prog_run+0x4f92>
a044   948884:	89 df                	mov    %ebx,%edi
a046   948886:	e8 00 00 00 00       	call   94888b <___bpf_prog_run+0xa04b>	948887: R_X86_64_PLT32	__msan_warning-0x4
a04b   94888b:	e9 7d af ff ff       	jmp    94380d <___bpf_prog_run+0x4fcd>
a050   948890:	44 89 e7             	mov    %r12d,%edi
a053   948893:	e8 00 00 00 00       	call   948898 <___bpf_prog_run+0xa058>	948894: R_X86_64_PLT32	__msan_warning-0x4
a058   948898:	e9 b4 af ff ff       	jmp    943851 <___bpf_prog_run+0x5011>
a05d   94889d:	8b 3c 24             	mov    (%rsp),%edi
a060   9488a0:	e8 00 00 00 00       	call   9488a5 <___bpf_prog_run+0xa065>	9488a1: R_X86_64_PLT32	__msan_warning-0x4
a065   9488a5:	e9 f5 af ff ff       	jmp    94389f <___bpf_prog_run+0x505f>
a06a   9488aa:	e8 00 00 00 00       	call   9488af <___bpf_prog_run+0xa06f>	9488ab: R_X86_64_PLT32	__msan_warning-0x4
a06f   9488af:	e9 27 b0 ff ff       	jmp    9438db <___bpf_prog_run+0x509b>
a074   9488b4:	44 89 e7             	mov    %r12d,%edi
a077   9488b7:	e8 00 00 00 00       	call   9488bc <___bpf_prog_run+0xa07c>	9488b8: R_X86_64_PLT32	__msan_warning-0x4
a07c   9488bc:	e9 5d b0 ff ff       	jmp    94391e <___bpf_prog_run+0x50de>
a081   9488c1:	8b 7c 24 08          	mov    0x8(%rsp),%edi
a085   9488c5:	e8 00 00 00 00       	call   9488ca <___bpf_prog_run+0xa08a>	9488c6: R_X86_64_PLT32	__msan_warning-0x4
a08a   9488ca:	e9 7e b0 ff ff       	jmp    94394d <___bpf_prog_run+0x510d>
a08f   9488cf:	8b 3c 24             	mov    (%rsp),%edi
a092   9488d2:	e8 00 00 00 00       	call   9488d7 <___bpf_prog_run+0xa097>	9488d3: R_X86_64_PLT32	__msan_warning-0x4
a097   9488d7:	e9 a1 b0 ff ff       	jmp    94397d <___bpf_prog_run+0x513d>
a09c   9488dc:	44 89 f7             	mov    %r14d,%edi
a09f   9488df:	e8 00 00 00 00       	call   9488e4 <___bpf_prog_run+0xa0a4>	9488e0: R_X86_64_PLT32	__msan_warning-0x4
a0a4   9488e4:	e9 c7 b0 ff ff       	jmp    9439b0 <___bpf_prog_run+0x5170>
a0a9   9488e9:	44 89 f7             	mov    %r14d,%edi
a0ac   9488ec:	e8 00 00 00 00       	call   9488f1 <___bpf_prog_run+0xa0b1>	9488ed: R_X86_64_PLT32	__msan_warning-0x4
a0b1   9488f1:	e9 e9 b0 ff ff       	jmp    9439df <___bpf_prog_run+0x519f>
a0b6   9488f6:	8b 3c 24             	mov    (%rsp),%edi
a0b9   9488f9:	e8 00 00 00 00       	call   9488fe <___bpf_prog_run+0xa0be>	9488fa: R_X86_64_PLT32	__msan_warning-0x4
a0be   9488fe:	e9 0f b1 ff ff       	jmp    943a12 <___bpf_prog_run+0x51d2>
a0c3   948903:	89 df                	mov    %ebx,%edi
a0c5   948905:	e8 00 00 00 00       	call   94890a <___bpf_prog_run+0xa0ca>	948906: R_X86_64_PLT32	__msan_warning-0x4
a0ca   94890a:	e9 32 b1 ff ff       	jmp    943a41 <___bpf_prog_run+0x5201>
a0cf   94890f:	8b 3c 24             	mov    (%rsp),%edi
a0d2   948912:	e8 00 00 00 00       	call   948917 <___bpf_prog_run+0xa0d7>	948913: R_X86_64_PLT32	__msan_warning-0x4
a0d7   948917:	e9 56 b1 ff ff       	jmp    943a72 <___bpf_prog_run+0x5232>
a0dc   94891c:	8b 7c 24 08          	mov    0x8(%rsp),%edi
a0e0   948920:	e8 00 00 00 00       	call   948925 <___bpf_prog_run+0xa0e5>	948921: R_X86_64_PLT32	__msan_warning-0x4
a0e5   948925:	e9 6c b1 ff ff       	jmp    943a96 <___bpf_prog_run+0x5256>
a0ea   94892a:	8b 3c 24             	mov    (%rsp),%edi
a0ed   94892d:	e8 00 00 00 00       	call   948932 <___bpf_prog_run+0xa0f2>	94892e: R_X86_64_PLT32	__msan_warning-0x4
a0f2   948932:	e9 91 b1 ff ff       	jmp    943ac8 <___bpf_prog_run+0x5288>
a0f7   948937:	e8 00 00 00 00       	call   94893c <___bpf_prog_run+0xa0fc>	948938: R_X86_64_PLT32	__msan_warning-0x4
a0fc   94893c:	e9 c0 b1 ff ff       	jmp    943b01 <___bpf_prog_run+0x52c1>
a101   948941:	8b 3c 24             	mov    (%rsp),%edi
a104   948944:	e8 00 00 00 00       	call   948949 <___bpf_prog_run+0xa109>	948945: R_X86_64_PLT32	__msan_warning-0x4
a109   948949:	e9 e2 b1 ff ff       	jmp    943b30 <___bpf_prog_run+0x52f0>
a10e   94894e:	8b 7c 24 08          	mov    0x8(%rsp),%edi
a112   948952:	e8 00 00 00 00       	call   948957 <___bpf_prog_run+0xa117>	948953: R_X86_64_PLT32	__msan_warning-0x4
a117   948957:	e9 fb b1 ff ff       	jmp    943b57 <___bpf_prog_run+0x5317>
a11c   94895c:	8b 3c 24             	mov    (%rsp),%edi
a11f   94895f:	e8 00 00 00 00       	call   948964 <___bpf_prog_run+0xa124>	948960: R_X86_64_PLT32	__msan_warning-0x4
a124   948964:	e9 35 b2 ff ff       	jmp    943b9e <___bpf_prog_run+0x535e>
a129   948969:	e8 00 00 00 00       	call   94896e <___bpf_prog_run+0xa12e>	94896a: R_X86_64_PLT32	__msan_warning-0x4
a12e   94896e:	e9 58 b2 ff ff       	jmp    943bcb <___bpf_prog_run+0x538b>
a133   948973:	8b 3c 24             	mov    (%rsp),%edi
a136   948976:	e8 00 00 00 00       	call   94897b <___bpf_prog_run+0xa13b>	948977: R_X86_64_PLT32	__msan_warning-0x4
a13b   94897b:	e9 71 b2 ff ff       	jmp    943bf1 <___bpf_prog_run+0x53b1>
a140   948980:	8b 3c 24             	mov    (%rsp),%edi
a143   948983:	e8 00 00 00 00       	call   948988 <___bpf_prog_run+0xa148>	948984: R_X86_64_PLT32	__msan_warning-0x4
a148   948988:	e9 d1 b2 ff ff       	jmp    943c5e <___bpf_prog_run+0x541e>
a14d   94898d:	89 df                	mov    %ebx,%edi
a14f   94898f:	e8 00 00 00 00       	call   948994 <___bpf_prog_run+0xa154>	948990: R_X86_64_PLT32	__msan_warning-0x4
a154   948994:	e9 f6 b2 ff ff       	jmp    943c8f <___bpf_prog_run+0x544f>
a159   948999:	8b 3c 24             	mov    (%rsp),%edi
a15c   94899c:	e8 00 00 00 00       	call   9489a1 <___bpf_prog_run+0xa161>	94899d: R_X86_64_PLT32	__msan_warning-0x4
a161   9489a1:	e9 20 b3 ff ff       	jmp    943cc6 <___bpf_prog_run+0x5486>
a166   9489a6:	8b 7c 24 08          	mov    0x8(%rsp),%edi
a16a   9489aa:	e8 00 00 00 00       	call   9489af <___bpf_prog_run+0xa16f>	9489ab: R_X86_64_PLT32	__msan_warning-0x4
a16f   9489af:	e9 44 b3 ff ff       	jmp    943cf8 <___bpf_prog_run+0x54b8>
a174   9489b4:	8b 3c 24             	mov    (%rsp),%edi
a177   9489b7:	e8 00 00 00 00       	call   9489bc <___bpf_prog_run+0xa17c>	9489b8: R_X86_64_PLT32	__msan_warning-0x4
a17c   9489bc:	e9 77 b3 ff ff       	jmp    943d38 <___bpf_prog_run+0x54f8>
a181   9489c1:	89 df                	mov    %ebx,%edi
a183   9489c3:	e8 00 00 00 00       	call   9489c8 <___bpf_prog_run+0xa188>	9489c4: R_X86_64_PLT32	__msan_warning-0x4
a188   9489c8:	e9 a6 b3 ff ff       	jmp    943d73 <___bpf_prog_run+0x5533>
a18d   9489cd:	44 89 e7             	mov    %r12d,%edi
a190   9489d0:	e8 00 00 00 00       	call   9489d5 <___bpf_prog_run+0xa195>	9489d1: R_X86_64_PLT32	__msan_warning-0x4
a195   9489d5:	e9 dd b3 ff ff       	jmp    943db7 <___bpf_prog_run+0x5577>
a19a   9489da:	8b 3c 24             	mov    (%rsp),%edi
a19d   9489dd:	e8 00 00 00 00       	call   9489e2 <___bpf_prog_run+0xa1a2>	9489de: R_X86_64_PLT32	__msan_warning-0x4
a1a2   9489e2:	e9 1f b4 ff ff       	jmp    943e06 <___bpf_prog_run+0x55c6>
a1a7   9489e7:	e8 00 00 00 00       	call   9489ec <___bpf_prog_run+0xa1ac>	9489e8: R_X86_64_PLT32	__msan_warning-0x4
a1ac   9489ec:	e9 42 b4 ff ff       	jmp    943e33 <___bpf_prog_run+0x55f3>
a1b1   9489f1:	8b 3c 24             	mov    (%rsp),%edi
a1b4   9489f4:	e8 00 00 00 00       	call   9489f9 <___bpf_prog_run+0xa1b9>	9489f5: R_X86_64_PLT32	__msan_warning-0x4
a1b9   9489f9:	e9 5c b4 ff ff       	jmp    943e5a <___bpf_prog_run+0x561a>
a1be   9489fe:	8b 3c 24             	mov    (%rsp),%edi
a1c1   948a01:	e8 00 00 00 00       	call   948a06 <___bpf_prog_run+0xa1c6>	948a02: R_X86_64_PLT32	__msan_warning-0x4
a1c6   948a06:	e9 c5 b4 ff ff       	jmp    943ed0 <___bpf_prog_run+0x5690>
a1cb   948a0b:	e8 00 00 00 00       	call   948a10 <___bpf_prog_run+0xa1d0>	948a0c: R_X86_64_PLT32	__msan_warning-0x4
a1d0   948a10:	e9 e9 b4 ff ff       	jmp    943efe <___bpf_prog_run+0x56be>
a1d5   948a15:	8b 7c 24 04          	mov    0x4(%rsp),%edi
a1d9   948a19:	e8 00 00 00 00       	call   948a1e <___bpf_prog_run+0xa1de>	948a1a: R_X86_64_PLT32	__msan_warning-0x4
a1de   948a1e:	e9 fe b4 ff ff       	jmp    943f21 <___bpf_prog_run+0x56e1>
a1e3   948a23:	48 89 d3             	mov    %rdx,%rbx
a1e6   948a26:	8b 7c 24 08          	mov    0x8(%rsp),%edi
a1ea   948a2a:	e8 00 00 00 00       	call   948a2f <___bpf_prog_run+0xa1ef>	948a2b: R_X86_64_PLT32	__msan_chain_origin-0x4
a1ef   948a2f:	89 c0                	mov    %eax,%eax
a1f1   948a31:	48 89 c1             	mov    %rax,%rcx
a1f4   948a34:	48 c1 e1 20          	shl    $0x20,%rcx
a1f8   948a38:	48 09 c1             	or     %rax,%rcx
a1fb   948a3b:	48 89 0b             	mov    %rcx,(%rbx)
a1fe   948a3e:	e9 f7 b4 ff ff       	jmp    943f3a <___bpf_prog_run+0x56fa>
a203   948a43:	8b 3c 24             	mov    (%rsp),%edi
a206   948a46:	e8 00 00 00 00       	call   948a4b <___bpf_prog_run+0xa20b>	948a47: R_X86_64_PLT32	__msan_warning-0x4
a20b   948a4b:	e9 fa b4 ff ff       	jmp    943f4a <___bpf_prog_run+0x570a>
a210   948a50:	e8 00 00 00 00       	call   948a55 <___bpf_prog_run+0xa215>	948a51: R_X86_64_PLT32	__msan_warning-0x4
a215   948a55:	e9 29 b5 ff ff       	jmp    943f83 <___bpf_prog_run+0x5743>
a21a   948a5a:	44 89 ef             	mov    %r13d,%edi
a21d   948a5d:	e8 00 00 00 00       	call   948a62 <___bpf_prog_run+0xa222>	948a5e: R_X86_64_PLT32	__msan_warning-0x4
a222   948a62:	e9 33 b5 ff ff       	jmp    943f9a <___bpf_prog_run+0x575a>
a227   948a67:	44 89 ef             	mov    %r13d,%edi
a22a   948a6a:	e8 00 00 00 00       	call   948a6f <___bpf_prog_run+0xa22f>	948a6b: R_X86_64_PLT32	__msan_warning-0x4
a22f   948a6f:	e9 3a b5 ff ff       	jmp    943fae <___bpf_prog_run+0x576e>
a234   948a74:	8b 7c 24 04          	mov    0x4(%rsp),%edi
a238   948a78:	e8 00 00 00 00       	call   948a7d <___bpf_prog_run+0xa23d>	948a79: R_X86_64_PLT32	__msan_warning-0x4
a23d   948a7d:	e9 42 b5 ff ff       	jmp    943fc4 <___bpf_prog_run+0x5784>
a242   948a82:	49 89 d7             	mov    %rdx,%r15
a245   948a85:	8b 7c 24 08          	mov    0x8(%rsp),%edi
a249   948a89:	e8 00 00 00 00       	call   948a8e <___bpf_prog_run+0xa24e>	948a8a: R_X86_64_PLT32	__msan_chain_origin-0x4
a24e   948a8e:	89 c0                	mov    %eax,%eax
a250   948a90:	48 89 c1             	mov    %rax,%rcx
a253   948a93:	48 c1 e1 20          	shl    $0x20,%rcx
a257   948a97:	48 09 c1             	or     %rax,%rcx
a25a   948a9a:	49 89 0f             	mov    %rcx,(%r15)
a25d   948a9d:	e9 3e b5 ff ff       	jmp    943fe0 <___bpf_prog_run+0x57a0>
a262   948aa2:	8b 3c 24             	mov    (%rsp),%edi
a265   948aa5:	e8 00 00 00 00       	call   948aaa <___bpf_prog_run+0xa26a>	948aa6: R_X86_64_PLT32	__msan_warning-0x4
a26a   948aaa:	e9 40 b5 ff ff       	jmp    943fef <___bpf_prog_run+0x57af>
a26f   948aaf:	e8 00 00 00 00       	call   948ab4 <___bpf_prog_run+0xa274>	948ab0: R_X86_64_PLT32	__msan_warning-0x4
a274   948ab4:	e9 66 b5 ff ff       	jmp    94401f <___bpf_prog_run+0x57df>
a279   948ab9:	8b 3c 24             	mov    (%rsp),%edi
a27c   948abc:	e8 00 00 00 00       	call   948ac1 <___bpf_prog_run+0xa281>	948abd: R_X86_64_PLT32	__msan_warning-0x4
a281   948ac1:	e9 ad b5 ff ff       	jmp    944073 <___bpf_prog_run+0x5833>
a286   948ac6:	89 df                	mov    %ebx,%edi
a288   948ac8:	e8 00 00 00 00       	call   948acd <___bpf_prog_run+0xa28d>	948ac9: R_X86_64_PLT32	__msan_warning-0x4
a28d   948acd:	e9 d7 b5 ff ff       	jmp    9440a9 <___bpf_prog_run+0x5869>
a292   948ad2:	44 89 e7             	mov    %r12d,%edi
a295   948ad5:	e8 00 00 00 00       	call   948ada <___bpf_prog_run+0xa29a>	948ad6: R_X86_64_PLT32	__msan_warning-0x4
a29a   948ada:	e9 0e b6 ff ff       	jmp    9440ed <___bpf_prog_run+0x58ad>
a29f   948adf:	8b 7c 24 40          	mov    0x40(%rsp),%edi
a2a3   948ae3:	e8 00 00 00 00       	call   948ae8 <___bpf_prog_run+0xa2a8>	948ae4: R_X86_64_PLT32	__msan_warning-0x4
a2a8   948ae8:	e9 31 b6 ff ff       	jmp    94411e <___bpf_prog_run+0x58de>
a2ad   948aed:	8b 3c 24             	mov    (%rsp),%edi
a2b0   948af0:	e8 00 00 00 00       	call   948af5 <___bpf_prog_run+0xa2b5>	948af1: R_X86_64_PLT32	__msan_warning-0x4
a2b5   948af5:	e9 58 b6 ff ff       	jmp    944152 <___bpf_prog_run+0x5912>
a2ba   948afa:	e8 00 00 00 00       	call   948aff <___bpf_prog_run+0xa2bf>	948afb: R_X86_64_PLT32	__msan_warning-0x4
a2bf   948aff:	e9 8c b6 ff ff       	jmp    944190 <___bpf_prog_run+0x5950>
a2c4   948b04:	44 89 e7             	mov    %r12d,%edi
a2c7   948b07:	e8 00 00 00 00       	call   948b0c <___bpf_prog_run+0xa2cc>	948b08: R_X86_64_PLT32	__msan_warning-0x4
a2cc   948b0c:	e9 ba b6 ff ff       	jmp    9441cb <___bpf_prog_run+0x598b>
a2d1   948b11:	44 89 ff             	mov    %r15d,%edi
a2d4   948b14:	e8 00 00 00 00       	call   948b19 <___bpf_prog_run+0xa2d9>	948b15: R_X86_64_PLT32	__msan_warning-0x4
a2d9   948b19:	e9 f3 b6 ff ff       	jmp    944211 <___bpf_prog_run+0x59d1>
a2de   948b1e:	8b 3c 24             	mov    (%rsp),%edi
a2e1   948b21:	e8 00 00 00 00       	call   948b26 <___bpf_prog_run+0xa2e6>	948b22: R_X86_64_PLT32	__msan_warning-0x4
a2e6   948b26:	e9 1a b7 ff ff       	jmp    944245 <___bpf_prog_run+0x5a05>
a2eb   948b2b:	e8 00 00 00 00       	call   948b30 <___bpf_prog_run+0xa2f0>	948b2c: R_X86_64_PLT32	__msan_warning-0x4
a2f0   948b30:	e9 3f b7 ff ff       	jmp    944274 <___bpf_prog_run+0x5a34>
a2f5   948b35:	8b 3c 24             	mov    (%rsp),%edi
a2f8   948b38:	e8 00 00 00 00       	call   948b3d <___bpf_prog_run+0xa2fd>	948b39: R_X86_64_PLT32	__msan_warning-0x4
a2fd   948b3d:	e9 5c b7 ff ff       	jmp    94429e <___bpf_prog_run+0x5a5e>
a302   948b42:	8b 3a                	mov    (%rdx),%edi
a304   948b44:	e8 00 00 00 00       	call   948b49 <___bpf_prog_run+0xa309>	948b45: R_X86_64_PLT32	__msan_warning-0x4
a309   948b49:	e9 64 b7 ff ff       	jmp    9442b2 <___bpf_prog_run+0x5a72>
a30e   948b4e:	48 89 d5             	mov    %rdx,%rbp
a311   948b51:	8b 7c 24 18          	mov    0x18(%rsp),%edi
a315   948b55:	e8 00 00 00 00       	call   948b5a <___bpf_prog_run+0xa31a>	948b56: R_X86_64_PLT32	__msan_chain_origin-0x4
a31a   948b5a:	89 c0                	mov    %eax,%eax
a31c   948b5c:	48 89 c1             	mov    %rax,%rcx
a31f   948b5f:	48 c1 e1 20          	shl    $0x20,%rcx
a323   948b63:	48 09 c1             	or     %rax,%rcx
a326   948b66:	48 89 4d 00          	mov    %rcx,0x0(%rbp)
a32a   948b6a:	e9 83 b7 ff ff       	jmp    9442f2 <___bpf_prog_run+0x5ab2>
a32f   948b6f:	8b 3c 24             	mov    (%rsp),%edi
a332   948b72:	e8 00 00 00 00       	call   948b77 <___bpf_prog_run+0xa337>	948b73: R_X86_64_PLT32	__msan_warning-0x4
a337   948b77:	e9 85 b7 ff ff       	jmp    944301 <___bpf_prog_run+0x5ac1>
a33c   948b7c:	8b 3c 24             	mov    (%rsp),%edi
a33f   948b7f:	e8 00 00 00 00       	call   948b84 <___bpf_prog_run+0xa344>	948b80: R_X86_64_PLT32	__msan_warning-0x4
a344   948b84:	e9 c0 b7 ff ff       	jmp    944349 <___bpf_prog_run+0x5b09>
a349   948b89:	e8 00 00 00 00       	call   948b8e <___bpf_prog_run+0xa34e>	948b8a: R_X86_64_PLT32	__msan_warning-0x4
a34e   948b8e:	e9 ea b7 ff ff       	jmp    94437d <___bpf_prog_run+0x5b3d>
a353   948b93:	8b 7c 24 04          	mov    0x4(%rsp),%edi
a357   948b97:	e8 00 00 00 00       	call   948b9c <___bpf_prog_run+0xa35c>	948b98: R_X86_64_PLT32	__msan_warning-0x4
a35c   948b9c:	e9 ff b7 ff ff       	jmp    9443a0 <___bpf_prog_run+0x5b60>
a361   948ba1:	49 89 d7             	mov    %rdx,%r15
a364   948ba4:	8b 7c 24 18          	mov    0x18(%rsp),%edi
a368   948ba8:	e8 00 00 00 00       	call   948bad <___bpf_prog_run+0xa36d>	948ba9: R_X86_64_PLT32	__msan_chain_origin-0x4
a36d   948bad:	89 c0                	mov    %eax,%eax
a36f   948baf:	48 89 c1             	mov    %rax,%rcx
a372   948bb2:	48 c1 e1 20          	shl    $0x20,%rcx
a376   948bb6:	48 09 c1             	or     %rax,%rcx
a379   948bb9:	49 89 0f             	mov    %rcx,(%r15)
a37c   948bbc:	e9 f8 b7 ff ff       	jmp    9443b9 <___bpf_prog_run+0x5b79>
a381   948bc1:	8b 3c 24             	mov    (%rsp),%edi
a384   948bc4:	e8 00 00 00 00       	call   948bc9 <___bpf_prog_run+0xa389>	948bc5: R_X86_64_PLT32	__msan_warning-0x4
a389   948bc9:	e9 04 b8 ff ff       	jmp    9443d2 <___bpf_prog_run+0x5b92>
a38e   948bce:	8b 3a                	mov    (%rdx),%edi
a390   948bd0:	e8 00 00 00 00       	call   948bd5 <___bpf_prog_run+0xa395>	948bd1: R_X86_64_PLT32	__msan_warning-0x4
a395   948bd5:	e9 0b b8 ff ff       	jmp    9443e5 <___bpf_prog_run+0x5ba5>
a39a   948bda:	8b 7c 24 04          	mov    0x4(%rsp),%edi
a39e   948bde:	e8 00 00 00 00       	call   948be3 <___bpf_prog_run+0xa3a3>	948bdf: R_X86_64_PLT32	__msan_warning-0x4
a3a3   948be3:	e9 18 b8 ff ff       	jmp    944400 <___bpf_prog_run+0x5bc0>
a3a8   948be8:	48 89 d5             	mov    %rdx,%rbp
a3ab   948beb:	8b 7c 24 18          	mov    0x18(%rsp),%edi
a3af   948bef:	e8 00 00 00 00       	call   948bf4 <___bpf_prog_run+0xa3b4>	948bf0: R_X86_64_PLT32	__msan_chain_origin-0x4
a3b4   948bf4:	89 c0                	mov    %eax,%eax
a3b6   948bf6:	48 89 c1             	mov    %rax,%rcx
a3b9   948bf9:	48 c1 e1 20          	shl    $0x20,%rcx
a3bd   948bfd:	48 09 c1             	or     %rax,%rcx
a3c0   948c00:	48 89 4d 00          	mov    %rcx,0x0(%rbp)
a3c4   948c04:	e9 0e b8 ff ff       	jmp    944417 <___bpf_prog_run+0x5bd7>
a3c9   948c09:	8b 3c 24             	mov    (%rsp),%edi
a3cc   948c0c:	e8 00 00 00 00       	call   948c11 <___bpf_prog_run+0xa3d1>	948c0d: R_X86_64_PLT32	__msan_warning-0x4
a3d1   948c11:	e9 15 b8 ff ff       	jmp    94442b <___bpf_prog_run+0x5beb>
a3d6   948c16:	e8 00 00 00 00       	call   948c1b <___bpf_prog_run+0xa3db>	948c17: R_X86_64_PLT32	__msan_warning-0x4
a3db   948c1b:	e9 37 b8 ff ff       	jmp    944457 <___bpf_prog_run+0x5c17>
a3e0   948c20:	8b 3c 24             	mov    (%rsp),%edi
a3e3   948c23:	e8 00 00 00 00       	call   948c28 <___bpf_prog_run+0xa3e8>	948c24: R_X86_64_PLT32	__msan_warning-0x4
a3e8   948c28:	e9 66 b8 ff ff       	jmp    944493 <___bpf_prog_run+0x5c53>
a3ed   948c2d:	89 ef                	mov    %ebp,%edi
a3ef   948c2f:	e8 00 00 00 00       	call   948c34 <___bpf_prog_run+0xa3f4>	948c30: R_X86_64_PLT32	__msan_warning-0x4
a3f4   948c34:	e9 98 b8 ff ff       	jmp    9444d1 <___bpf_prog_run+0x5c91>
a3f9   948c39:	44 89 ff             	mov    %r15d,%edi
a3fc   948c3c:	e8 00 00 00 00       	call   948c41 <___bpf_prog_run+0xa401>	948c3d: R_X86_64_PLT32	__msan_warning-0x4
a401   948c41:	e9 d0 b8 ff ff       	jmp    944516 <___bpf_prog_run+0x5cd6>
a406   948c46:	8b 7c 24 50          	mov    0x50(%rsp),%edi
a40a   948c4a:	e8 00 00 00 00       	call   948c4f <___bpf_prog_run+0xa40f>	948c4b: R_X86_64_PLT32	__msan_warning-0x4
a40f   948c4f:	e9 0a b9 ff ff       	jmp    94455e <___bpf_prog_run+0x5d1e>
a414   948c54:	8b 3c 24             	mov    (%rsp),%edi
a417   948c57:	e8 00 00 00 00       	call   948c5c <___bpf_prog_run+0xa41c>	948c58: R_X86_64_PLT32	__msan_warning-0x4
a41c   948c5c:	e9 1a b9 ff ff       	jmp    94457b <___bpf_prog_run+0x5d3b>
a421   948c61:	8b 3c 24             	mov    (%rsp),%edi
a424   948c64:	e8 00 00 00 00       	call   948c69 <___bpf_prog_run+0xa429>	948c65: R_X86_64_PLT32	__msan_warning-0x4
a429   948c69:	e9 2c b9 ff ff       	jmp    94459a <___bpf_prog_run+0x5d5a>
a42e   948c6e:	e8 00 00 00 00       	call   948c73 <___bpf_prog_run+0xa433>	948c6f: R_X86_64_PLT32	__msan_warning-0x4
a433   948c73:	e9 4c b9 ff ff       	jmp    9445c4 <___bpf_prog_run+0x5d84>
a438   948c78:	8b 3c 24             	mov    (%rsp),%edi
a43b   948c7b:	e8 00 00 00 00       	call   948c80 <___bpf_prog_run+0xa440>	948c7c: R_X86_64_PLT32	__msan_warning-0x4
a440   948c80:	e9 72 b9 ff ff       	jmp    9445f7 <___bpf_prog_run+0x5db7>
a445   948c85:	e8 00 00 00 00       	call   948c8a <___bpf_prog_run+0xa44a>	948c86: R_X86_64_PLT32	__msan_warning-0x4
a44a   948c8a:	e9 9c b9 ff ff       	jmp    94462b <___bpf_prog_run+0x5deb>
a44f   948c8f:	8b 3c 24             	mov    (%rsp),%edi
a452   948c92:	e8 00 00 00 00       	call   948c97 <___bpf_prog_run+0xa457>	948c93: R_X86_64_PLT32	__msan_warning-0x4
a457   948c97:	e9 c8 b9 ff ff       	jmp    944664 <___bpf_prog_run+0x5e24>
a45c   948c9c:	e8 00 00 00 00       	call   948ca1 <___bpf_prog_run+0xa461>	948c9d: R_X86_64_PLT32	__msan_warning-0x4
a461   948ca1:	e9 19 ba ff ff       	jmp    9446bf <___bpf_prog_run+0x5e7f>
a466   948ca6:	8b 3c 24             	mov    (%rsp),%edi
a469   948ca9:	e8 00 00 00 00       	call   948cae <___bpf_prog_run+0xa46e>	948caa: R_X86_64_PLT32	__msan_warning-0x4
a46e   948cae:	e9 5b ba ff ff       	jmp    94470e <___bpf_prog_run+0x5ece>
a473   948cb3:	e8 00 00 00 00       	call   948cb8 <___bpf_prog_run+0xa478>	948cb4: R_X86_64_PLT32	__msan_warning-0x4
a478   948cb8:	e9 8e ba ff ff       	jmp    94474b <___bpf_prog_run+0x5f0b>
a47d   948cbd:	44 89 ff             	mov    %r15d,%edi
a480   948cc0:	e8 00 00 00 00       	call   948cc5 <___bpf_prog_run+0xa485>	948cc1: R_X86_64_PLT32	__msan_warning-0x4
a485   948cc5:	e9 bf ba ff ff       	jmp    944789 <___bpf_prog_run+0x5f49>
a48a   948cca:	8b 3c 24             	mov    (%rsp),%edi
a48d   948ccd:	e8 00 00 00 00       	call   948cd2 <___bpf_prog_run+0xa492>	948cce: R_X86_64_PLT32	__msan_warning-0x4
a492   948cd2:	e9 e2 ba ff ff       	jmp    9447b9 <___bpf_prog_run+0x5f79>
a497   948cd7:	44 89 ff             	mov    %r15d,%edi
a49a   948cda:	e8 00 00 00 00       	call   948cdf <___bpf_prog_run+0xa49f>	948cdb: R_X86_64_PLT32	__msan_warning-0x4
a49f   948cdf:	e9 f9 ba ff ff       	jmp    9447dd <___bpf_prog_run+0x5f9d>
a4a4   948ce4:	49 89 d7             	mov    %rdx,%r15
a4a7   948ce7:	8b 7c 24 38          	mov    0x38(%rsp),%edi
a4ab   948ceb:	e8 00 00 00 00       	call   948cf0 <___bpf_prog_run+0xa4b0>	948cec: R_X86_64_PLT32	__msan_chain_origin-0x4
a4b0   948cf0:	41 89 07             	mov    %eax,(%r15)
a4b3   948cf3:	e9 03 bb ff ff       	jmp    9447fb <___bpf_prog_run+0x5fbb>
a4b8   948cf8:	8b 3c 24             	mov    (%rsp),%edi
a4bb   948cfb:	e8 00 00 00 00       	call   948d00 <___bpf_prog_run+0xa4c0>	948cfc: R_X86_64_PLT32	__msan_warning-0x4
a4c0   948d00:	e9 15 bb ff ff       	jmp    94481a <___bpf_prog_run+0x5fda>
a4c5   948d05:	e8 00 00 00 00       	call   948d0a <___bpf_prog_run+0xa4ca>	948d06: R_X86_64_PLT32	__msan_warning-0x4
a4ca   948d0a:	e9 44 bb ff ff       	jmp    944853 <___bpf_prog_run+0x6013>
a4cf   948d0f:	8b 3c 24             	mov    (%rsp),%edi
a4d2   948d12:	e8 00 00 00 00       	call   948d17 <___bpf_prog_run+0xa4d7>	948d13: R_X86_64_PLT32	__msan_warning-0x4
a4d7   948d17:	e9 65 bb ff ff       	jmp    944881 <___bpf_prog_run+0x6041>
a4dc   948d1c:	e8 00 00 00 00       	call   948d21 <___bpf_prog_run+0xa4e1>	948d1d: R_X86_64_PLT32	__msan_warning-0x4
a4e1   948d21:	e9 bc bb ff ff       	jmp    9448e2 <___bpf_prog_run+0x60a2>
a4e6   948d26:	49 89 d7             	mov    %rdx,%r15
a4e9   948d29:	8b 7c 24 18          	mov    0x18(%rsp),%edi
a4ed   948d2d:	e8 00 00 00 00       	call   948d32 <___bpf_prog_run+0xa4f2>	948d2e: R_X86_64_PLT32	__msan_chain_origin-0x4
a4f2   948d32:	89 c0                	mov    %eax,%eax
a4f4   948d34:	48 89 c1             	mov    %rax,%rcx
a4f7   948d37:	48 c1 e1 20          	shl    $0x20,%rcx
a4fb   948d3b:	48 09 c1             	or     %rax,%rcx
a4fe   948d3e:	49 89 0f             	mov    %rcx,(%r15)
a501   948d41:	e9 c3 bb ff ff       	jmp    944909 <___bpf_prog_run+0x60c9>
a506   948d46:	8b 3c 24             	mov    (%rsp),%edi
a509   948d49:	e8 00 00 00 00       	call   948d4e <___bpf_prog_run+0xa50e>	948d4a: R_X86_64_PLT32	__msan_warning-0x4
a50e   948d4e:	e9 d5 bb ff ff       	jmp    944928 <___bpf_prog_run+0x60e8>
a513   948d53:	e8 00 00 00 00       	call   948d58 <___bpf_prog_run+0xa518>	948d54: R_X86_64_PLT32	__msan_warning-0x4
a518   948d58:	e9 f8 bb ff ff       	jmp    944955 <___bpf_prog_run+0x6115>
a51d   948d5d:	8b 3c 24             	mov    (%rsp),%edi
a520   948d60:	e8 00 00 00 00       	call   948d65 <___bpf_prog_run+0xa525>	948d61: R_X86_64_PLT32	__msan_warning-0x4
a525   948d65:	e9 12 bc ff ff       	jmp    94497c <___bpf_prog_run+0x613c>
a52a   948d6a:	8b 3c 24             	mov    (%rsp),%edi
a52d   948d6d:	e8 00 00 00 00       	call   948d72 <___bpf_prog_run+0xa532>	948d6e: R_X86_64_PLT32	__msan_warning-0x4
a532   948d72:	e9 79 bc ff ff       	jmp    9449f0 <___bpf_prog_run+0x61b0>
a537   948d77:	e8 00 00 00 00       	call   948d7c <___bpf_prog_run+0xa53c>	948d78: R_X86_64_PLT32	__msan_warning-0x4
a53c   948d7c:	e9 a5 bc ff ff       	jmp    944a26 <___bpf_prog_run+0x61e6>
a541   948d81:	8b 3c 24             	mov    (%rsp),%edi
a544   948d84:	e8 00 00 00 00       	call   948d89 <___bpf_prog_run+0xa549>	948d85: R_X86_64_PLT32	__msan_warning-0x4
a549   948d89:	e9 d1 bc ff ff       	jmp    944a5f <___bpf_prog_run+0x621f>
a54e   948d8e:	e8 00 00 00 00       	call   948d93 <___bpf_prog_run+0xa553>	948d8f: R_X86_64_PLT32	__msan_warning-0x4
a553   948d93:	e9 26 bd ff ff       	jmp    944abe <___bpf_prog_run+0x627e>
a558   948d98:	8b 3c 24             	mov    (%rsp),%edi
a55b   948d9b:	e8 00 00 00 00       	call   948da0 <___bpf_prog_run+0xa560>	948d9c: R_X86_64_PLT32	__msan_warning-0x4
a560   948da0:	e9 55 bd ff ff       	jmp    944afa <___bpf_prog_run+0x62ba>
a565   948da5:	e8 00 00 00 00       	call   948daa <___bpf_prog_run+0xa56a>	948da6: R_X86_64_PLT32	__msan_warning-0x4
a56a   948daa:	e9 87 bd ff ff       	jmp    944b36 <___bpf_prog_run+0x62f6>
a56f   948daf:	44 89 e7             	mov    %r12d,%edi
a572   948db2:	e8 00 00 00 00       	call   948db7 <___bpf_prog_run+0xa577>	948db3: R_X86_64_PLT32	__msan_warning-0x4
a577   948db7:	e9 bb bd ff ff       	jmp    944b77 <___bpf_prog_run+0x6337>
a57c   948dbc:	8b 7c 24 08          	mov    0x8(%rsp),%edi
a580   948dc0:	e8 00 00 00 00       	call   948dc5 <___bpf_prog_run+0xa585>	948dc1: R_X86_64_PLT32	__msan_warning-0x4
a585   948dc5:	e9 d9 bd ff ff       	jmp    944ba3 <___bpf_prog_run+0x6363>
a58a   948dca:	8b 3c 24             	mov    (%rsp),%edi
a58d   948dcd:	e8 00 00 00 00       	call   948dd2 <___bpf_prog_run+0xa592>	948dce: R_X86_64_PLT32	__msan_warning-0x4
a592   948dd2:	e9 fb bd ff ff       	jmp    944bd2 <___bpf_prog_run+0x6392>
a597   948dd7:	e8 00 00 00 00       	call   948ddc <___bpf_prog_run+0xa59c>	948dd8: R_X86_64_PLT32	__msan_warning-0x4
a59c   948ddc:	e9 2a be ff ff       	jmp    944c0b <___bpf_prog_run+0x63cb>
a5a1   948de1:	8b 3c 24             	mov    (%rsp),%edi
a5a4   948de4:	e8 00 00 00 00       	call   948de9 <___bpf_prog_run+0xa5a9>	948de5: R_X86_64_PLT32	__msan_warning-0x4
a5a9   948de9:	e9 4c be ff ff       	jmp    944c3a <___bpf_prog_run+0x63fa>
a5ae   948dee:	8b 7c 24 08          	mov    0x8(%rsp),%edi
a5b2   948df2:	e8 00 00 00 00       	call   948df7 <___bpf_prog_run+0xa5b7>	948df3: R_X86_64_PLT32	__msan_warning-0x4
a5b7   948df7:	e9 65 be ff ff       	jmp    944c61 <___bpf_prog_run+0x6421>
a5bc   948dfc:	8b 3c 24             	mov    (%rsp),%edi
a5bf   948dff:	e8 00 00 00 00       	call   948e04 <___bpf_prog_run+0xa5c4>	948e00: R_X86_64_PLT32	__msan_warning-0x4
a5c4   948e04:	e9 a1 be ff ff       	jmp    944caa <___bpf_prog_run+0x646a>
a5c9   948e09:	e8 00 00 00 00       	call   948e0e <___bpf_prog_run+0xa5ce>	948e0a: R_X86_64_PLT32	__msan_warning-0x4
a5ce   948e0e:	e9 d3 be ff ff       	jmp    944ce6 <___bpf_prog_run+0x64a6>
a5d3   948e13:	44 89 e7             	mov    %r12d,%edi
a5d6   948e16:	e8 00 00 00 00       	call   948e1b <___bpf_prog_run+0xa5db>	948e17: R_X86_64_PLT32	__msan_warning-0x4
a5db   948e1b:	e9 03 bf ff ff       	jmp    944d23 <___bpf_prog_run+0x64e3>
a5e0   948e20:	8b 3c 24             	mov    (%rsp),%edi
a5e3   948e23:	e8 00 00 00 00       	call   948e28 <___bpf_prog_run+0xa5e8>	948e24: R_X86_64_PLT32	__msan_warning-0x4
a5e8   948e28:	e9 5c bf ff ff       	jmp    944d89 <___bpf_prog_run+0x6549>
a5ed   948e2d:	e8 00 00 00 00       	call   948e32 <___bpf_prog_run+0xa5f2>	948e2e: R_X86_64_PLT32	__msan_warning-0x4
a5f2   948e32:	e9 7f bf ff ff       	jmp    944db6 <___bpf_prog_run+0x6576>
a5f7   948e37:	8b 3c 24             	mov    (%rsp),%edi
a5fa   948e3a:	e8 00 00 00 00       	call   948e3f <___bpf_prog_run+0xa5ff>	948e3b: R_X86_64_PLT32	__msan_warning-0x4
a5ff   948e3f:	e9 99 bf ff ff       	jmp    944ddd <___bpf_prog_run+0x659d>
a604   948e44:	8b 3c 24             	mov    (%rsp),%edi
a607   948e47:	e8 00 00 00 00       	call   948e4c <___bpf_prog_run+0xa60c>	948e48: R_X86_64_PLT32	__msan_warning-0x4
a60c   948e4c:	e9 fa bf ff ff       	jmp    944e4b <___bpf_prog_run+0x660b>
a611   948e51:	e8 00 00 00 00       	call   948e56 <___bpf_prog_run+0xa616>	948e52: R_X86_64_PLT32	__msan_warning-0x4
a616   948e56:	e9 1d c0 ff ff       	jmp    944e78 <___bpf_prog_run+0x6638>
a61b   948e5b:	8b 3c 24             	mov    (%rsp),%edi
a61e   948e5e:	e8 00 00 00 00       	call   948e63 <___bpf_prog_run+0xa623>	948e5f: R_X86_64_PLT32	__msan_warning-0x4
a623   948e63:	e9 37 c0 ff ff       	jmp    944e9f <___bpf_prog_run+0x665f>
a628   948e68:	8b 3c 24             	mov    (%rsp),%edi
a62b   948e6b:	e8 00 00 00 00       	call   948e70 <___bpf_prog_run+0xa630>	948e6c: R_X86_64_PLT32	__msan_warning-0x4
a630   948e70:	e9 a2 c0 ff ff       	jmp    944f17 <___bpf_prog_run+0x66d7>
a635   948e75:	89 ef                	mov    %ebp,%edi
a637   948e77:	e8 00 00 00 00       	call   948e7c <___bpf_prog_run+0xa63c>	948e78: R_X86_64_PLT32	__msan_warning-0x4
a63c   948e7c:	e9 d4 c0 ff ff       	jmp    944f55 <___bpf_prog_run+0x6715>
a641   948e81:	44 89 ff             	mov    %r15d,%edi
a644   948e84:	e8 00 00 00 00       	call   948e89 <___bpf_prog_run+0xa649>	948e85: R_X86_64_PLT32	__msan_warning-0x4
a649   948e89:	e9 0c c1 ff ff       	jmp    944f9a <___bpf_prog_run+0x675a>
a64e   948e8e:	8b 7c 24 50          	mov    0x50(%rsp),%edi
a652   948e92:	e8 00 00 00 00       	call   948e97 <___bpf_prog_run+0xa657>	948e93: R_X86_64_PLT32	__msan_warning-0x4
a657   948e97:	e9 3d c1 ff ff       	jmp    944fd9 <___bpf_prog_run+0x6799>
a65c   948e9c:	8b 3c 24             	mov    (%rsp),%edi
a65f   948e9f:	e8 00 00 00 00       	call   948ea4 <___bpf_prog_run+0xa664>	948ea0: R_X86_64_PLT32	__msan_warning-0x4
a664   948ea4:	e9 62 c1 ff ff       	jmp    94500b <___bpf_prog_run+0x67cb>
a669   948ea9:	e8 00 00 00 00       	call   948eae <___bpf_prog_run+0xa66e>	948eaa: R_X86_64_PLT32	__msan_warning-0x4
a66e   948eae:	e9 91 c1 ff ff       	jmp    945044 <___bpf_prog_run+0x6804>
a673   948eb3:	8b 3c 24             	mov    (%rsp),%edi
a676   948eb6:	e8 00 00 00 00       	call   948ebb <___bpf_prog_run+0xa67b>	948eb7: R_X86_64_PLT32	__msan_warning-0x4
a67b   948ebb:	e9 b3 c1 ff ff       	jmp    945073 <___bpf_prog_run+0x6833>
a680   948ec0:	8b 7c 24 08          	mov    0x8(%rsp),%edi
a684   948ec4:	e8 00 00 00 00       	call   948ec9 <___bpf_prog_run+0xa689>	948ec5: R_X86_64_PLT32	__msan_warning-0x4
a689   948ec9:	e9 cc c1 ff ff       	jmp    94509a <___bpf_prog_run+0x685a>
a68e   948ece:	e8 00 00 00 00       	call   948ed3 <___bpf_prog_run+0xa693>	948ecf: R_X86_64_PLT32	__msan_warning-0x4
a693   948ed3:	e9 f4 c1 ff ff       	jmp    9450cc <___bpf_prog_run+0x688c>
a698   948ed8:	8b 3c 24             	mov    (%rsp),%edi
a69b   948edb:	e8 00 00 00 00       	call   948ee0 <___bpf_prog_run+0xa6a0>	948edc: R_X86_64_PLT32	__msan_warning-0x4
a6a0   948ee0:	e9 26 c2 ff ff       	jmp    94510b <___bpf_prog_run+0x68cb>
a6a5   948ee5:	8b 3c 24             	mov    (%rsp),%edi
a6a8   948ee8:	e8 00 00 00 00       	call   948eed <___bpf_prog_run+0xa6ad>	948ee9: R_X86_64_PLT32	__msan_warning-0x4
a6ad   948eed:	e9 42 c2 ff ff       	jmp    945134 <___bpf_prog_run+0x68f4>
a6b2   948ef2:	e8 00 00 00 00       	call   948ef7 <___bpf_prog_run+0xa6b7>	948ef3: R_X86_64_PLT32	__msan_warning-0x4
a6b7   948ef7:	e9 65 c2 ff ff       	jmp    945161 <___bpf_prog_run+0x6921>
a6bc   948efc:	8b 3c 24             	mov    (%rsp),%edi
a6bf   948eff:	e8 00 00 00 00       	call   948f04 <___bpf_prog_run+0xa6c4>	948f00: R_X86_64_PLT32	__msan_warning-0x4
a6c4   948f04:	e9 82 c2 ff ff       	jmp    94518b <___bpf_prog_run+0x694b>
a6c9   948f09:	44 89 ff             	mov    %r15d,%edi
a6cc   948f0c:	e8 00 00 00 00       	call   948f11 <___bpf_prog_run+0xa6d1>	948f0d: R_X86_64_PLT32	__msan_warning-0x4
a6d1   948f11:	e9 99 c2 ff ff       	jmp    9451af <___bpf_prog_run+0x696f>
a6d6   948f16:	49 89 d7             	mov    %rdx,%r15
a6d9   948f19:	8b 7c 24 38          	mov    0x38(%rsp),%edi
a6dd   948f1d:	e8 00 00 00 00       	call   948f22 <___bpf_prog_run+0xa6e2>	948f1e: R_X86_64_PLT32	__msan_chain_origin-0x4
a6e2   948f22:	41 89 07             	mov    %eax,(%r15)
a6e5   948f25:	e9 9b c2 ff ff       	jmp    9451c5 <___bpf_prog_run+0x6985>
a6ea   948f2a:	e8 00 00 00 00       	call   948f2f <___bpf_prog_run+0xa6ef>	948f2b: R_X86_64_PLT32	__msan_warning-0x4
a6ef   948f2f:	e9 de 5a ff ff       	jmp    93ea12 <___bpf_prog_run+0x1d2>
a6f4   948f34:	44 89 f7             	mov    %r14d,%edi
a6f7   948f37:	e8 00 00 00 00       	call   948f3c <___bpf_prog_run+0xa6fc>	948f38: R_X86_64_PLT32	__msan_warning-0x4
a6fc   948f3c:	e9 00 5b ff ff       	jmp    93ea41 <___bpf_prog_run+0x201>
a701   948f41:	8b 3c 24             	mov    (%rsp),%edi
a704   948f44:	e8 00 00 00 00       	call   948f49 <___bpf_prog_run+0xa709>	948f45: R_X86_64_PLT32	__msan_warning-0x4
a709   948f49:	e9 39 f3 ff ff       	jmp    948287 <___bpf_prog_run+0x9a47>
a70e   948f4e:	44 89 ff             	mov    %r15d,%edi
a711   948f51:	e8 00 00 00 00       	call   948f56 <___bpf_prog_run+0xa716>	948f52: R_X86_64_PLT32	__msan_warning-0x4
a716   948f56:	e9 5a f3 ff ff       	jmp    9482b5 <___bpf_prog_run+0x9a75>
a71b   948f5b:	44 89 ff             	mov    %r15d,%edi
a71e   948f5e:	e8 00 00 00 00       	call   948f63 <___bpf_prog_run+0xa723>	948f5f: R_X86_64_PLT32	__msan_warning-0x4
a723   948f63:	e9 73 f3 ff ff       	jmp    9482db <___bpf_prog_run+0x9a9b>
a728   948f68:	8b 3c 24             	mov    (%rsp),%edi
a72b   948f6b:	e8 00 00 00 00       	call   948f70 <___bpf_prog_run+0xa730>	948f6c: R_X86_64_PLT32	__msan_warning-0x4
a730   948f70:	e9 4a c3 ff ff       	jmp    9452bf <___bpf_prog_run+0x6a7f>
a735   948f75:	8b 3c 24             	mov    (%rsp),%edi
a738   948f78:	e8 00 00 00 00       	call   948f7d <___bpf_prog_run+0xa73d>	948f79: R_X86_64_PLT32	__msan_warning-0x4
a73d   948f7d:	e9 3a f5 ff ff       	jmp    9484bc <___bpf_prog_run+0x9c7c>
a742   948f82:	8b 3c 24             	mov    (%rsp),%edi
a745   948f85:	e8 00 00 00 00       	call   948f8a <___bpf_prog_run+0xa74a>	948f86: R_X86_64_PLT32	__msan_warning-0x4
a74a   948f8a:	e9 2c f8 ff ff       	jmp    9487bb <___bpf_prog_run+0x9f7b>
a74f   948f8f:	8b 3c 24             	mov    (%rsp),%edi
a752   948f92:	e8 00 00 00 00       	call   948f97 <___bpf_prog_run+0xa757>	948f93: R_X86_64_PLT32	__msan_warning-0x4
a757   948f97:	e9 39 97 ff ff       	jmp    9426d5 <___bpf_prog_run+0x3e95>
a75c   948f9c:	44 89 ff             	mov    %r15d,%edi
a75f   948f9f:	e8 00 00 00 00       	call   948fa4 <___bpf_prog_run+0xa764>	948fa0: R_X86_64_PLT32	__msan_warning-0x4
a764   948fa4:	e9 5f 97 ff ff       	jmp    942708 <___bpf_prog_run+0x3ec8>
a769   948fa9:	44 89 ff             	mov    %r15d,%edi
a76c   948fac:	e8 00 00 00 00       	call   948fb1 <___bpf_prog_run+0xa771>	948fad: R_X86_64_PLT32	__msan_warning-0x4
a771   948fb1:	e9 76 97 ff ff       	jmp    94272c <___bpf_prog_run+0x3eec>
a776   948fb6:	49 89 d7             	mov    %rdx,%r15
a779   948fb9:	44 89 f7             	mov    %r14d,%edi
a77c   948fbc:	e8 00 00 00 00       	call   948fc1 <___bpf_prog_run+0xa781>	948fbd: R_X86_64_PLT32	__msan_chain_origin-0x4
a781   948fc1:	89 c0                	mov    %eax,%eax
a783   948fc3:	48 89 c1             	mov    %rax,%rcx
a786   948fc6:	48 c1 e1 20          	shl    $0x20,%rcx
a78a   948fca:	48 09 c1             	or     %rax,%rcx
a78d   948fcd:	49 89 0f             	mov    %rcx,(%r15)
a790   948fd0:	e9 6e 97 ff ff       	jmp    942743 <___bpf_prog_run+0x3f03>
a795   948fd5:	8b 3c 24             	mov    (%rsp),%edi
a798   948fd8:	e8 00 00 00 00       	call   948fdd <___bpf_prog_run+0xa79d>	948fd9: R_X86_64_PLT32	__msan_warning-0x4
a79d   948fdd:	e9 0a c6 ff ff       	jmp    9455ec <___bpf_prog_run+0x6dac>
a7a2   948fe2:	44 89 ff             	mov    %r15d,%edi
a7a5   948fe5:	e8 00 00 00 00       	call   948fea <___bpf_prog_run+0xa7aa>	948fe6: R_X86_64_PLT32	__msan_warning-0x4
a7aa   948fea:	e9 30 c6 ff ff       	jmp    94561f <___bpf_prog_run+0x6ddf>
a7af   948fef:	44 89 ff             	mov    %r15d,%edi
a7b2   948ff2:	e8 00 00 00 00       	call   948ff7 <___bpf_prog_run+0xa7b7>	948ff3: R_X86_64_PLT32	__msan_warning-0x4
a7b7   948ff7:	e9 46 c6 ff ff       	jmp    945642 <___bpf_prog_run+0x6e02>
a7bc   948ffc:	49 89 d7             	mov    %rdx,%r15
a7bf   948fff:	44 89 f7             	mov    %r14d,%edi
a7c2   949002:	e8 00 00 00 00       	call   949007 <___bpf_prog_run+0xa7c7>	949003: R_X86_64_PLT32	__msan_chain_origin-0x4
a7c7   949007:	89 c0                	mov    %eax,%eax
a7c9   949009:	48 89 c1             	mov    %rax,%rcx
a7cc   94900c:	48 c1 e1 20          	shl    $0x20,%rcx
a7d0   949010:	48 09 c1             	or     %rax,%rcx
a7d3   949013:	49 89 0f             	mov    %rcx,(%r15)
a7d6   949016:	e9 3d c6 ff ff       	jmp    945658 <___bpf_prog_run+0x6e18>
a7db   94901b:	8b 3c 24             	mov    (%rsp),%edi
a7de   94901e:	e8 00 00 00 00       	call   949023 <___bpf_prog_run+0xa7e3>	94901f: R_X86_64_PLT32	__msan_warning-0x4
a7e3   949023:	e9 45 f1 ff ff       	jmp    94816d <___bpf_prog_run+0x992d>
a7e8   949028:	44 89 ff             	mov    %r15d,%edi
a7eb   94902b:	e8 00 00 00 00       	call   949030 <___bpf_prog_run+0xa7f0>	94902c: R_X86_64_PLT32	__msan_warning-0x4
a7f0   949030:	e9 6b f1 ff ff       	jmp    9481a0 <___bpf_prog_run+0x9960>
a7f5   949035:	44 89 ff             	mov    %r15d,%edi
a7f8   949038:	e8 00 00 00 00       	call   94903d <___bpf_prog_run+0xa7fd>	949039: R_X86_64_PLT32	__msan_warning-0x4
a7fd   94903d:	e9 87 f1 ff ff       	jmp    9481c9 <___bpf_prog_run+0x9989>
a802   949042:	49 89 d7             	mov    %rdx,%r15
a805   949045:	44 89 f7             	mov    %r14d,%edi
a808   949048:	e8 00 00 00 00       	call   94904d <___bpf_prog_run+0xa80d>	949049: R_X86_64_PLT32	__msan_chain_origin-0x4
a80d   94904d:	89 c0                	mov    %eax,%eax
a80f   94904f:	48 89 c1             	mov    %rax,%rcx
a812   949052:	48 c1 e1 20          	shl    $0x20,%rcx
a816   949056:	48 09 c1             	or     %rax,%rcx
a819   949059:	49 89 0f             	mov    %rcx,(%r15)
a81c   94905c:	e9 84 f1 ff ff       	jmp    9481e5 <___bpf_prog_run+0x99a5>
a821   949061:	48 89 d5             	mov    %rdx,%rbp
a824   949064:	8b 7c 24 50          	mov    0x50(%rsp),%edi
a828   949068:	e8 00 00 00 00       	call   94906d <___bpf_prog_run+0xa82d>	949069: R_X86_64_PLT32	__msan_chain_origin-0x4
a82d   94906d:	89 c0                	mov    %eax,%eax
a82f   94906f:	48 89 c1             	mov    %rax,%rcx
a832   949072:	48 c1 e1 20          	shl    $0x20,%rcx
a836   949076:	48 09 c1             	or     %rax,%rcx
a839   949079:	48 89 4d 00          	mov    %rcx,0x0(%rbp)
a83d   94907d:	e9 eb cf ff ff       	jmp    94606d <___bpf_prog_run+0x782d>
a842   949082:	8b 3c 24             	mov    (%rsp),%edi
a845   949085:	e8 00 00 00 00       	call   94908a <___bpf_prog_run+0xa84a>	949086: R_X86_64_PLT32	__msan_warning-0x4
a84a   94908a:	e9 1c 8b ff ff       	jmp    941bab <___bpf_prog_run+0x336b>
a84f   94908f:	e8 00 00 00 00       	call   949094 <___bpf_prog_run+0xa854>	949090: R_X86_64_PLT32	__msan_warning-0x4
a854   949094:	e9 4b 8b ff ff       	jmp    941be4 <___bpf_prog_run+0x33a4>
a859   949099:	44 89 e7             	mov    %r12d,%edi
a85c   94909c:	e8 00 00 00 00       	call   9490a1 <___bpf_prog_run+0xa861>	94909d: R_X86_64_PLT32	__msan_warning-0x4
a861   9490a1:	e9 66 8b ff ff       	jmp    941c0c <___bpf_prog_run+0x33cc>
a866   9490a6:	8b 3c 24             	mov    (%rsp),%edi
a869   9490a9:	e8 00 00 00 00       	call   9490ae <___bpf_prog_run+0xa86e>	9490aa: R_X86_64_PLT32	__msan_warning-0x4
a86e   9490ae:	e9 f1 c2 ff ff       	jmp    9453a4 <___bpf_prog_run+0x6b64>
a873   9490b3:	e8 00 00 00 00       	call   9490b8 <___bpf_prog_run+0xa878>	9490b4: R_X86_64_PLT32	__msan_warning-0x4
a878   9490b8:	e9 20 c3 ff ff       	jmp    9453dd <___bpf_prog_run+0x6b9d>
a87d   9490bd:	44 89 e7             	mov    %r12d,%edi
a880   9490c0:	e8 00 00 00 00       	call   9490c5 <___bpf_prog_run+0xa885>	9490c1: R_X86_64_PLT32	__msan_warning-0x4
a885   9490c5:	e9 3b c3 ff ff       	jmp    945405 <___bpf_prog_run+0x6bc5>
a88a   9490ca:	8b 3c 24             	mov    (%rsp),%edi
a88d   9490cd:	e8 00 00 00 00       	call   9490d2 <___bpf_prog_run+0xa892>	9490ce: R_X86_64_PLT32	__msan_warning-0x4
a892   9490d2:	e9 ca c5 ff ff       	jmp    9456a1 <___bpf_prog_run+0x6e61>
a897   9490d7:	e8 00 00 00 00       	call   9490dc <___bpf_prog_run+0xa89c>	9490d8: R_X86_64_PLT32	__msan_warning-0x4
a89c   9490dc:	e9 f9 c5 ff ff       	jmp    9456da <___bpf_prog_run+0x6e9a>
a8a1   9490e1:	44 89 e7             	mov    %r12d,%edi
a8a4   9490e4:	e8 00 00 00 00       	call   9490e9 <___bpf_prog_run+0xa8a9>	9490e5: R_X86_64_PLT32	__msan_warning-0x4
a8a9   9490e9:	e9 14 c6 ff ff       	jmp    945702 <___bpf_prog_run+0x6ec2>
a8ae   9490ee:	8b 3c 24             	mov    (%rsp),%edi
a8b1   9490f1:	e8 00 00 00 00       	call   9490f6 <___bpf_prog_run+0xa8b6>	9490f2: R_X86_64_PLT32	__msan_warning-0x4
a8b6   9490f6:	e9 f6 c6 ff ff       	jmp    9457f1 <___bpf_prog_run+0x6fb1>
a8bb   9490fb:	e8 00 00 00 00       	call   949100 <___bpf_prog_run+0xa8c0>	9490fc: R_X86_64_PLT32	__msan_warning-0x4
a8c0   949100:	e9 2e c7 ff ff       	jmp    945833 <___bpf_prog_run+0x6ff3>
a8c5   949105:	8b 3c 24             	mov    (%rsp),%edi
a8c8   949108:	e8 00 00 00 00       	call   94910d <___bpf_prog_run+0xa8cd>	949109: R_X86_64_PLT32	__msan_warning-0x4
a8cd   94910d:	e9 5a c7 ff ff       	jmp    94586c <___bpf_prog_run+0x702c>
a8d2   949112:	44 89 e7             	mov    %r12d,%edi
a8d5   949115:	e8 00 00 00 00       	call   94911a <___bpf_prog_run+0xa8da>	949116: R_X86_64_PLT32	__msan_warning-0x4
a8da   94911a:	e9 75 c7 ff ff       	jmp    945894 <___bpf_prog_run+0x7054>
a8df   94911f:	8b 3c 24             	mov    (%rsp),%edi
a8e2   949122:	e8 00 00 00 00       	call   949127 <___bpf_prog_run+0xa8e7>	949123: R_X86_64_PLT32	__msan_warning-0x4
a8e7   949127:	e9 8a c8 ff ff       	jmp    9459b6 <___bpf_prog_run+0x7176>
a8ec   94912c:	e8 00 00 00 00       	call   949131 <___bpf_prog_run+0xa8f1>	94912d: R_X86_64_PLT32	__msan_warning-0x4
a8f1   949131:	e9 c2 c8 ff ff       	jmp    9459f8 <___bpf_prog_run+0x71b8>
a8f6   949136:	44 89 e7             	mov    %r12d,%edi
a8f9   949139:	e8 00 00 00 00       	call   94913e <___bpf_prog_run+0xa8fe>	94913a: R_X86_64_PLT32	__msan_warning-0x4
a8fe   94913e:	45 84 ff             	test   %r15b,%r15b
a901   949141:	0f 85 e6 c8 ff ff    	jne    945a2d <___bpf_prog_run+0x71ed>
a907   949147:	e8 00 00 00 00       	call   94914c <___bpf_prog_run+0xa90c>	949148: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
a90c   94914c:	41 83 e6 0f          	and    $0xf,%r14d
a910   949150:	41 83 e5 0f          	and    $0xf,%r13d
a914   949154:	4d 85 f6             	test   %r14,%r14
a917   949157:	8b 7c 24 40          	mov    0x40(%rsp),%edi
a91b   94915b:	0f 44 7c 24 04       	cmove  0x4(%rsp),%edi
a920   949160:	4c 0b 74 24 20       	or     0x20(%rsp),%r14
a925   949165:	0f 85 68 07 00 00    	jne    9498d3 <___bpf_prog_run+0xb093>
a92b   94916b:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
a930   949170:	4a 8d 3c e8          	lea    (%rax,%r13,8),%rdi
a934   949174:	4c 8b 37             	mov    (%rdi),%r14
a937   949177:	e8 00 00 00 00       	call   94917c <___bpf_prog_run+0xa93c>	949178: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
a93c   94917c:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
a941   949181:	49 8d 6d 02          	lea    0x2(%r13),%rbp
a945   949185:	48 8b 18             	mov    (%rax),%rbx
a948   949188:	44 8b 3a             	mov    (%rdx),%r15d
a94b   94918b:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
a951   949191:	0f 85 46 07 00 00    	jne    9498dd <___bpf_prog_run+0xb09d>
a957   949197:	4c 0f bf 65 00       	movswq 0x0(%rbp),%r12
a95c   94919c:	48 89 ef             	mov    %rbp,%rdi
a95f   94919f:	e8 00 00 00 00       	call   9491a4 <___bpf_prog_run+0xa964>	9491a0: R_X86_64_PLT32	__msan_metadata_ptr_for_load_2-0x4
a964   9491a4:	48 0f bf 00          	movswq (%rax),%rax
a968   9491a8:	48 85 c0             	test   %rax,%rax
a96b   9491ab:	74 03                	je     9491b0 <___bpf_prog_run+0xa970>
a96d   9491ad:	44 8b 3a             	mov    (%rdx),%r15d
a970   9491b0:	48 09 c3             	or     %rax,%rbx
a973   9491b3:	4d 01 e6             	add    %r12,%r14
a976   9491b6:	be 04 00 00 00       	mov    $0x4,%esi
a97b   9491bb:	4c 89 f7             	mov    %r14,%rdi
a97e   9491be:	e8 00 00 00 00       	call   9491c3 <___bpf_prog_run+0xa983>	9491bf: R_X86_64_PLT32	__msan_instrument_asm_store-0x4
a983   9491c3:	83 7c 24 38 00       	cmpl   $0x0,0x38(%rsp)
a988   9491c8:	0f 85 1c 07 00 00    	jne    9498ea <___bpf_prog_run+0xb0aa>
a98e   9491ce:	48 85 db             	test   %rbx,%rbx
a991   9491d1:	0f 85 25 07 00 00    	jne    9498fc <___bpf_prog_run+0xb0bc>
a997   9491d7:	48 85 db             	test   %rbx,%rbx
a99a   9491da:	0f 85 2d 07 00 00    	jne    94990d <___bpf_prog_run+0xb0cd>
a9a0   9491e0:	48 8b 6c 24 18       	mov    0x18(%rsp),%rbp
a9a5   9491e5:	f0 41 0f c1 2e       	lock xadd %ebp,(%r14)
a9aa   9491ea:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
a9af   9491ef:	4d 85 f6             	test   %r14,%r14
a9b2   9491f2:	0f 85 22 07 00 00    	jne    94991a <___bpf_prog_run+0xb0da>
a9b8   9491f8:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
a9bd   9491fd:	0f b6 1f             	movzbl (%rdi),%ebx
a9c0   949200:	e8 00 00 00 00       	call   949205 <___bpf_prog_run+0xa9c5>	949201: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
a9c5   949205:	0f b6 00             	movzbl (%rax),%eax
a9c8   949208:	48 c1 e8 04          	shr    $0x4,%rax
a9cc   94920c:	48 d1 eb             	shr    %rbx
a9cf   94920f:	83 e3 78             	and    $0x78,%ebx
a9d2   949212:	8b 7c 24 04          	mov    0x4(%rsp),%edi
a9d6   949216:	48 85 c0             	test   %rax,%rax
a9d9   949219:	74 02                	je     94921d <___bpf_prog_run+0xa9dd>
a9db   94921b:	8b 3a                	mov    (%rdx),%edi
a9dd   94921d:	48 03 5c 24 30       	add    0x30(%rsp),%rbx
a9e2   949222:	48 0b 44 24 20       	or     0x20(%rsp),%rax
a9e7   949227:	0f 85 fa 06 00 00    	jne    949927 <___bpf_prog_run+0xb0e7>
a9ed   94922d:	89 ed                	mov    %ebp,%ebp
a9ef   94922f:	48 89 df             	mov    %rbx,%rdi
a9f2   949232:	e8 00 00 00 00       	call   949237 <___bpf_prog_run+0xa9f7>	949233: R_X86_64_PLT32	__msan_metadata_ptr_for_store_8-0x4
a9f7   949237:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
a9fe   94923e:	48 89 2b             	mov    %rbp,(%rbx)
aa01   949241:	49 83 c5 08          	add    $0x8,%r13
aa05   949245:	e9 b5 56 ff ff       	jmp    93e8ff <___bpf_prog_run+0xbf>
aa0a   94924a:	48 89 fd             	mov    %rdi,%rbp
aa0d   94924d:	8b 3c 24             	mov    (%rsp),%edi
aa10   949250:	e8 00 00 00 00       	call   949255 <___bpf_prog_run+0xaa15>	949251: R_X86_64_PLT32	__msan_warning-0x4
aa15   949255:	48 89 ef             	mov    %rbp,%rdi
aa18   949258:	e9 ed c8 ff ff       	jmp    945b4a <___bpf_prog_run+0x730a>
aa1d   94925d:	e8 00 00 00 00       	call   949262 <___bpf_prog_run+0xaa22>	94925e: R_X86_64_PLT32	__msan_warning-0x4
aa22   949262:	e9 20 c9 ff ff       	jmp    945b87 <___bpf_prog_run+0x7347>
aa27   949267:	44 89 e7             	mov    %r12d,%edi
aa2a   94926a:	e8 00 00 00 00       	call   94926f <___bpf_prog_run+0xaa2f>	94926b: R_X86_64_PLT32	__msan_warning-0x4
aa2f   94926f:	e9 40 c9 ff ff       	jmp    945bb4 <___bpf_prog_run+0x7374>
aa34   949274:	48 89 fd             	mov    %rdi,%rbp
aa37   949277:	8b 3c 24             	mov    (%rsp),%edi
aa3a   94927a:	e8 00 00 00 00       	call   94927f <___bpf_prog_run+0xaa3f>	94927b: R_X86_64_PLT32	__msan_warning-0x4
aa3f   94927f:	48 89 ef             	mov    %rbp,%rdi
aa42   949282:	e9 61 cb ff ff       	jmp    945de8 <___bpf_prog_run+0x75a8>
aa47   949287:	e8 00 00 00 00       	call   94928c <___bpf_prog_run+0xaa4c>	949288: R_X86_64_PLT32	__msan_warning-0x4
aa4c   94928c:	e9 94 cb ff ff       	jmp    945e25 <___bpf_prog_run+0x75e5>
aa51   949291:	44 89 e7             	mov    %r12d,%edi
aa54   949294:	e8 00 00 00 00       	call   949299 <___bpf_prog_run+0xaa59>	949295: R_X86_64_PLT32	__msan_warning-0x4
aa59   949299:	e9 b4 cb ff ff       	jmp    945e52 <___bpf_prog_run+0x7612>
aa5e   94929e:	8b 3c 24             	mov    (%rsp),%edi
aa61   9492a1:	e8 00 00 00 00       	call   9492a6 <___bpf_prog_run+0xaa66>	9492a2: R_X86_64_PLT32	__msan_warning-0x4
aa66   9492a6:	e9 00 ce ff ff       	jmp    9460ab <___bpf_prog_run+0x786b>
aa6b   9492ab:	e8 00 00 00 00       	call   9492b0 <___bpf_prog_run+0xaa70>	9492ac: R_X86_64_PLT32	__msan_warning-0x4
aa70   9492b0:	e9 37 ce ff ff       	jmp    9460ec <___bpf_prog_run+0x78ac>
aa75   9492b5:	44 89 e7             	mov    %r12d,%edi
aa78   9492b8:	e8 00 00 00 00       	call   9492bd <___bpf_prog_run+0xaa7d>	9492b9: R_X86_64_PLT32	__msan_warning-0x4
aa7d   9492bd:	e9 57 ce ff ff       	jmp    946119 <___bpf_prog_run+0x78d9>
aa82   9492c2:	8b 3c 24             	mov    (%rsp),%edi
aa85   9492c5:	e8 00 00 00 00       	call   9492ca <___bpf_prog_run+0xaa8a>	9492c6: R_X86_64_PLT32	__msan_warning-0x4
aa8a   9492ca:	e9 d7 d0 ff ff       	jmp    9463a6 <___bpf_prog_run+0x7b66>
aa8f   9492cf:	e8 00 00 00 00       	call   9492d4 <___bpf_prog_run+0xaa94>	9492d0: R_X86_64_PLT32	__msan_warning-0x4
aa94   9492d4:	e9 07 d1 ff ff       	jmp    9463e0 <___bpf_prog_run+0x7ba0>
aa99   9492d9:	8b 3c 24             	mov    (%rsp),%edi
aa9c   9492dc:	e8 00 00 00 00       	call   9492e1 <___bpf_prog_run+0xaaa1>	9492dd: R_X86_64_PLT32	__msan_warning-0x4
aaa1   9492e1:	e9 33 d1 ff ff       	jmp    946419 <___bpf_prog_run+0x7bd9>
aaa6   9492e6:	44 89 e7             	mov    %r12d,%edi
aaa9   9492e9:	e8 00 00 00 00       	call   9492ee <___bpf_prog_run+0xaaae>	9492ea: R_X86_64_PLT32	__msan_warning-0x4
aaae   9492ee:	e9 50 d1 ff ff       	jmp    946443 <___bpf_prog_run+0x7c03>
aab3   9492f3:	8b 3c 24             	mov    (%rsp),%edi
aab6   9492f6:	e8 00 00 00 00       	call   9492fb <___bpf_prog_run+0xaabb>	9492f7: R_X86_64_PLT32	__msan_warning-0x4
aabb   9492fb:	e9 56 d2 ff ff       	jmp    946556 <___bpf_prog_run+0x7d16>
aac0   949300:	e8 00 00 00 00       	call   949305 <___bpf_prog_run+0xaac5>	949301: R_X86_64_PLT32	__msan_warning-0x4
aac5   949305:	e9 85 d2 ff ff       	jmp    94658f <___bpf_prog_run+0x7d4f>
aaca   94930a:	44 89 e7             	mov    %r12d,%edi
aacd   94930d:	e8 00 00 00 00       	call   949312 <___bpf_prog_run+0xaad2>	94930e: R_X86_64_PLT32	__msan_warning-0x4
aad2   949312:	e9 a0 d2 ff ff       	jmp    9465b7 <___bpf_prog_run+0x7d77>
aad7   949317:	e8 00 00 00 00       	call   94931c <___bpf_prog_run+0xaadc>	949318: R_X86_64_PLT32	__msan_warning-0x4
aadc   94931c:	e9 2d 89 ff ff       	jmp    941c4e <___bpf_prog_run+0x340e>
aae1   949321:	8b 3c 24             	mov    (%rsp),%edi
aae4   949324:	e8 00 00 00 00       	call   949329 <___bpf_prog_run+0xaae9>	949325: R_X86_64_PLT32	__msan_warning-0x4
aae9   949329:	e9 42 89 ff ff       	jmp    941c70 <___bpf_prog_run+0x3430>
aaee   94932e:	8b 7c 24 40          	mov    0x40(%rsp),%edi
aaf2   949332:	e8 00 00 00 00       	call   949337 <___bpf_prog_run+0xaaf7>	949333: R_X86_64_PLT32	__msan_warning-0x4
aaf7   949337:	48 85 ed             	test   %rbp,%rbp
aafa   94933a:	0f 84 70 89 ff ff    	je     941cb0 <___bpf_prog_run+0x3470>
ab00   949340:	44 89 ff             	mov    %r15d,%edi
ab03   949343:	e8 00 00 00 00       	call   949348 <___bpf_prog_run+0xab08>	949344: R_X86_64_PLT32	__msan_warning-0x4
ab08   949348:	48 85 ed             	test   %rbp,%rbp
ab0b   94934b:	0f 84 68 89 ff ff    	je     941cb9 <___bpf_prog_run+0x3479>
ab11   949351:	44 89 ff             	mov    %r15d,%edi
ab14   949354:	e8 00 00 00 00       	call   949359 <___bpf_prog_run+0xab19>	949355: R_X86_64_PLT32	__msan_warning-0x4
ab19   949359:	e9 5b 89 ff ff       	jmp    941cb9 <___bpf_prog_run+0x3479>
ab1e   94935e:	e8 00 00 00 00       	call   949363 <___bpf_prog_run+0xab23>	94935f: R_X86_64_PLT32	__msan_warning-0x4
ab23   949363:	e9 df c0 ff ff       	jmp    945447 <___bpf_prog_run+0x6c07>
ab28   949368:	8b 3c 24             	mov    (%rsp),%edi
ab2b   94936b:	e8 00 00 00 00       	call   949370 <___bpf_prog_run+0xab30>	94936c: R_X86_64_PLT32	__msan_warning-0x4
ab30   949370:	e9 f4 c0 ff ff       	jmp    945469 <___bpf_prog_run+0x6c29>
ab35   949375:	8b 7c 24 40          	mov    0x40(%rsp),%edi
ab39   949379:	e8 00 00 00 00       	call   94937e <___bpf_prog_run+0xab3e>	94937a: R_X86_64_PLT32	__msan_warning-0x4
ab3e   94937e:	48 85 ed             	test   %rbp,%rbp
ab41   949381:	0f 84 22 c1 ff ff    	je     9454a9 <___bpf_prog_run+0x6c69>
ab47   949387:	44 89 ff             	mov    %r15d,%edi
ab4a   94938a:	e8 00 00 00 00       	call   94938f <___bpf_prog_run+0xab4f>	94938b: R_X86_64_PLT32	__msan_warning-0x4
ab4f   94938f:	48 85 ed             	test   %rbp,%rbp
ab52   949392:	0f 84 1a c1 ff ff    	je     9454b2 <___bpf_prog_run+0x6c72>
ab58   949398:	44 89 ff             	mov    %r15d,%edi
ab5b   94939b:	e8 00 00 00 00       	call   9493a0 <___bpf_prog_run+0xab60>	94939c: R_X86_64_PLT32	__msan_warning-0x4
ab60   9493a0:	e9 0d c1 ff ff       	jmp    9454b2 <___bpf_prog_run+0x6c72>
ab65   9493a5:	e8 00 00 00 00       	call   9493aa <___bpf_prog_run+0xab6a>	9493a6: R_X86_64_PLT32	__msan_warning-0x4
ab6a   9493aa:	e9 95 c3 ff ff       	jmp    945744 <___bpf_prog_run+0x6f04>
ab6f   9493af:	8b 3c 24             	mov    (%rsp),%edi
ab72   9493b2:	e8 00 00 00 00       	call   9493b7 <___bpf_prog_run+0xab77>	9493b3: R_X86_64_PLT32	__msan_warning-0x4
ab77   9493b7:	e9 aa c3 ff ff       	jmp    945766 <___bpf_prog_run+0x6f26>
ab7c   9493bc:	8b 7c 24 40          	mov    0x40(%rsp),%edi
ab80   9493c0:	e8 00 00 00 00       	call   9493c5 <___bpf_prog_run+0xab85>	9493c1: R_X86_64_PLT32	__msan_warning-0x4
ab85   9493c5:	48 85 ed             	test   %rbp,%rbp
ab88   9493c8:	0f 84 d8 c3 ff ff    	je     9457a6 <___bpf_prog_run+0x6f66>
ab8e   9493ce:	44 89 ff             	mov    %r15d,%edi
ab91   9493d1:	e8 00 00 00 00       	call   9493d6 <___bpf_prog_run+0xab96>	9493d2: R_X86_64_PLT32	__msan_warning-0x4
ab96   9493d6:	48 85 ed             	test   %rbp,%rbp
ab99   9493d9:	0f 84 d0 c3 ff ff    	je     9457af <___bpf_prog_run+0x6f6f>
ab9f   9493df:	44 89 ff             	mov    %r15d,%edi
aba2   9493e2:	e8 00 00 00 00       	call   9493e7 <___bpf_prog_run+0xaba7>	9493e3: R_X86_64_PLT32	__msan_warning-0x4
aba7   9493e7:	e9 c3 c3 ff ff       	jmp    9457af <___bpf_prog_run+0x6f6f>
abac   9493ec:	e8 00 00 00 00       	call   9493f1 <___bpf_prog_run+0xabb1>	9493ed: R_X86_64_PLT32	__msan_warning-0x4
abb1   9493f1:	e9 f0 c4 ff ff       	jmp    9458e6 <___bpf_prog_run+0x70a6>
abb6   9493f6:	44 89 f7             	mov    %r14d,%edi
abb9   9493f9:	e8 00 00 00 00       	call   9493fe <___bpf_prog_run+0xabbe>	9493fa: R_X86_64_PLT32	__msan_warning-0x4
abbe   9493fe:	4d 85 ff             	test   %r15,%r15
abc1   949401:	0f 84 1a c5 ff ff    	je     945921 <___bpf_prog_run+0x70e1>
abc7   949407:	8b 7c 24 4c          	mov    0x4c(%rsp),%edi
abcb   94940b:	e8 00 00 00 00       	call   949410 <___bpf_prog_run+0xabd0>	94940c: R_X86_64_PLT32	__msan_warning-0x4
abd0   949410:	e9 0c c5 ff ff       	jmp    945921 <___bpf_prog_run+0x70e1>
abd5   949415:	8b 7c 24 4c          	mov    0x4c(%rsp),%edi
abd9   949419:	e8 00 00 00 00       	call   94941e <___bpf_prog_run+0xabde>	94941a: R_X86_64_PLT32	__msan_warning-0x4
abde   94941e:	e9 0c c5 ff ff       	jmp    94592f <___bpf_prog_run+0x70ef>
abe3   949423:	8b 3c 24             	mov    (%rsp),%edi
abe6   949426:	e8 00 00 00 00       	call   94942b <___bpf_prog_run+0xabeb>	949427: R_X86_64_PLT32	__msan_warning-0x4
abeb   94942b:	e9 0c c5 ff ff       	jmp    94593c <___bpf_prog_run+0x70fc>
abf0   949430:	e8 00 00 00 00       	call   949435 <___bpf_prog_run+0xabf5>	949431: R_X86_64_PLT32	__msan_warning-0x4
abf5   949435:	e9 35 c5 ff ff       	jmp    94596f <___bpf_prog_run+0x712f>
abfa   94943a:	e8 00 00 00 00       	call   94943f <___bpf_prog_run+0xabff>	94943b: R_X86_64_PLT32	__msan_warning-0x4
abff   94943f:	e9 10 c6 ff ff       	jmp    945a54 <___bpf_prog_run+0x7214>
ac04   949444:	8b 3c 24             	mov    (%rsp),%edi
ac07   949447:	e8 00 00 00 00       	call   94944c <___bpf_prog_run+0xac0c>	949448: R_X86_64_PLT32	__msan_warning-0x4
ac0c   94944c:	e9 2f c6 ff ff       	jmp    945a80 <___bpf_prog_run+0x7240>
ac11   949451:	8b 7c 24 50          	mov    0x50(%rsp),%edi
ac15   949455:	e8 00 00 00 00       	call   94945a <___bpf_prog_run+0xac1a>	949456: R_X86_64_PLT32	__msan_warning-0x4
ac1a   94945a:	48 85 db             	test   %rbx,%rbx
ac1d   94945d:	0f 84 5e c6 ff ff    	je     945ac1 <___bpf_prog_run+0x7281>
ac23   949463:	44 89 ff             	mov    %r15d,%edi
ac26   949466:	e8 00 00 00 00       	call   94946b <___bpf_prog_run+0xac2b>	949467: R_X86_64_PLT32	__msan_warning-0x4
ac2b   94946b:	48 85 db             	test   %rbx,%rbx
ac2e   94946e:	0f 84 56 c6 ff ff    	je     945aca <___bpf_prog_run+0x728a>
ac34   949474:	44 89 ff             	mov    %r15d,%edi
ac37   949477:	e8 00 00 00 00       	call   94947c <___bpf_prog_run+0xac3c>	949478: R_X86_64_PLT32	__msan_warning-0x4
ac3c   94947c:	e9 49 c6 ff ff       	jmp    945aca <___bpf_prog_run+0x728a>
ac41   949481:	8b 3c 24             	mov    (%rsp),%edi
ac44   949484:	e8 00 00 00 00       	call   949489 <___bpf_prog_run+0xac49>	949485: R_X86_64_PLT32	__msan_warning-0x4
ac49   949489:	e9 54 c6 ff ff       	jmp    945ae2 <___bpf_prog_run+0x72a2>
ac4e   94948e:	e8 00 00 00 00       	call   949493 <___bpf_prog_run+0xac53>	94948f: R_X86_64_PLT32	__msan_warning-0x4
ac53   949493:	e9 54 c7 ff ff       	jmp    945bec <___bpf_prog_run+0x73ac>
ac58   949498:	8b 3c 24             	mov    (%rsp),%edi
ac5b   94949b:	e8 00 00 00 00       	call   9494a0 <___bpf_prog_run+0xac60>	94949c: R_X86_64_PLT32	__msan_warning-0x4
ac60   9494a0:	e9 6e c7 ff ff       	jmp    945c13 <___bpf_prog_run+0x73d3>
ac65   9494a5:	44 89 ff             	mov    %r15d,%edi
ac68   9494a8:	e8 00 00 00 00       	call   9494ad <___bpf_prog_run+0xac6d>	9494a9: R_X86_64_PLT32	__msan_warning-0x4
ac6d   9494ad:	e9 87 c7 ff ff       	jmp    945c39 <___bpf_prog_run+0x73f9>
ac72   9494b2:	8b 3c 24             	mov    (%rsp),%edi
ac75   9494b5:	e8 00 00 00 00       	call   9494ba <___bpf_prog_run+0xac7a>	9494b6: R_X86_64_PLT32	__msan_warning-0x4
ac7a   9494ba:	e9 c3 c8 ff ff       	jmp    945d82 <___bpf_prog_run+0x7542>
ac7f   9494bf:	e8 00 00 00 00       	call   9494c4 <___bpf_prog_run+0xac84>	9494c0: R_X86_64_PLT32	__msan_warning-0x4
ac84   9494c4:	e9 c1 c9 ff ff       	jmp    945e8a <___bpf_prog_run+0x764a>
ac89   9494c9:	8b 3c 24             	mov    (%rsp),%edi
ac8c   9494cc:	e8 00 00 00 00       	call   9494d1 <___bpf_prog_run+0xac91>	9494cd: R_X86_64_PLT32	__msan_warning-0x4
ac91   9494d1:	e9 db c9 ff ff       	jmp    945eb1 <___bpf_prog_run+0x7671>
ac96   9494d6:	44 89 ff             	mov    %r15d,%edi
ac99   9494d9:	e8 00 00 00 00       	call   9494de <___bpf_prog_run+0xac9e>	9494da: R_X86_64_PLT32	__msan_warning-0x4
ac9e   9494de:	e9 f4 c9 ff ff       	jmp    945ed7 <___bpf_prog_run+0x7697>
aca3   9494e3:	8b 3c 24             	mov    (%rsp),%edi
aca6   9494e6:	e8 00 00 00 00       	call   9494eb <___bpf_prog_run+0xacab>	9494e7: R_X86_64_PLT32	__msan_warning-0x4
acab   9494eb:	e9 36 cb ff ff       	jmp    946026 <___bpf_prog_run+0x77e6>
acb0   9494f0:	e8 00 00 00 00       	call   9494f5 <___bpf_prog_run+0xacb5>	9494f1: R_X86_64_PLT32	__msan_warning-0x4
acb5   9494f5:	e9 5f cb ff ff       	jmp    946059 <___bpf_prog_run+0x7819>
acba   9494fa:	e8 00 00 00 00       	call   9494ff <___bpf_prog_run+0xacbf>	9494fb: R_X86_64_PLT32	__msan_warning-0x4
acbf   9494ff:	e9 4d cc ff ff       	jmp    946151 <___bpf_prog_run+0x7911>
acc4   949504:	8b 3c 24             	mov    (%rsp),%edi
acc7   949507:	e8 00 00 00 00       	call   94950c <___bpf_prog_run+0xaccc>	949508: R_X86_64_PLT32	__msan_warning-0x4
accc   94950c:	e9 6c cc ff ff       	jmp    94617d <___bpf_prog_run+0x793d>
acd1   949511:	44 89 ff             	mov    %r15d,%edi
acd4   949514:	e8 00 00 00 00       	call   949519 <___bpf_prog_run+0xacd9>	949515: R_X86_64_PLT32	__msan_warning-0x4
acd9   949519:	e9 86 cc ff ff       	jmp    9461a4 <___bpf_prog_run+0x7964>
acde   94951e:	8b 3c 24             	mov    (%rsp),%edi
ace1   949521:	e8 00 00 00 00       	call   949526 <___bpf_prog_run+0xace6>	949522: R_X86_64_PLT32	__msan_warning-0x4
ace6   949526:	e9 e8 cd ff ff       	jmp    946313 <___bpf_prog_run+0x7ad3>
aceb   94952b:	e8 00 00 00 00       	call   949530 <___bpf_prog_run+0xacf0>	94952c: R_X86_64_PLT32	__msan_warning-0x4
acf0   949530:	e9 1d ce ff ff       	jmp    946352 <___bpf_prog_run+0x7b12>
acf5   949535:	49 89 d7             	mov    %rdx,%r15
acf8   949538:	8b 7c 24 50          	mov    0x50(%rsp),%edi
acfc   94953c:	e8 00 00 00 00       	call   949541 <___bpf_prog_run+0xad01>	94953d: R_X86_64_PLT32	__msan_chain_origin-0x4
ad01   949541:	89 c0                	mov    %eax,%eax
ad03   949543:	48 89 c1             	mov    %rax,%rcx
ad06   949546:	48 c1 e1 20          	shl    $0x20,%rcx
ad0a   94954a:	48 09 c1             	or     %rax,%rcx
ad0d   94954d:	49 89 0f             	mov    %rcx,(%r15)
ad10   949550:	e9 11 ce ff ff       	jmp    946366 <___bpf_prog_run+0x7b26>
ad15   949555:	8b 7c 24 04          	mov    0x4(%rsp),%edi
ad19   949559:	e8 00 00 00 00       	call   94955e <___bpf_prog_run+0xad1e>	94955a: R_X86_64_PLT32	__msan_warning-0x4
ad1e   94955e:	e9 0b cf ff ff       	jmp    94646e <___bpf_prog_run+0x7c2e>
ad23   949563:	e8 00 00 00 00       	call   949568 <___bpf_prog_run+0xad28>	949564: R_X86_64_PLT32	__msan_warning-0x4
ad28   949568:	e9 3d cf ff ff       	jmp    9464aa <___bpf_prog_run+0x7c6a>
ad2d   94956d:	44 89 ef             	mov    %r13d,%edi
ad30   949570:	e8 00 00 00 00       	call   949575 <___bpf_prog_run+0xad35>	949571: R_X86_64_PLT32	__msan_warning-0x4
ad35   949575:	e9 5e cf ff ff       	jmp    9464d8 <___bpf_prog_run+0x7c98>
ad3a   94957a:	8b 7c 24 50          	mov    0x50(%rsp),%edi
ad3e   94957e:	e8 00 00 00 00       	call   949583 <___bpf_prog_run+0xad43>	94957f: R_X86_64_PLT32	__msan_warning-0x4
ad43   949583:	e9 5e cf ff ff       	jmp    9464e6 <___bpf_prog_run+0x7ca6>
ad48   949588:	8b 7c 24 58          	mov    0x58(%rsp),%edi
ad4c   94958c:	e8 00 00 00 00       	call   949591 <___bpf_prog_run+0xad51>	94958d: R_X86_64_PLT32	__msan_warning-0x4
ad51   949591:	48 85 db             	test   %rbx,%rbx
ad54   949594:	0f 84 68 cf ff ff    	je     946502 <___bpf_prog_run+0x7cc2>
ad5a   94959a:	8b 7c 24 58          	mov    0x58(%rsp),%edi
ad5e   94959e:	e8 00 00 00 00       	call   9495a3 <___bpf_prog_run+0xad63>	94959f: R_X86_64_PLT32	__msan_warning-0x4
ad63   9495a3:	e9 5a cf ff ff       	jmp    946502 <___bpf_prog_run+0x7cc2>
ad68   9495a8:	e8 00 00 00 00       	call   9495ad <___bpf_prog_run+0xad6d>	9495a9: R_X86_64_PLT32	__msan_warning-0x4
ad6d   9495ad:	e9 47 d0 ff ff       	jmp    9465f9 <___bpf_prog_run+0x7db9>
ad72   9495b2:	8b 3c 24             	mov    (%rsp),%edi
ad75   9495b5:	e8 00 00 00 00       	call   9495ba <___bpf_prog_run+0xad7a>	9495b6: R_X86_64_PLT32	__msan_warning-0x4
ad7a   9495ba:	e9 5c d0 ff ff       	jmp    94661b <___bpf_prog_run+0x7ddb>
ad7f   9495bf:	8b 7c 24 40          	mov    0x40(%rsp),%edi
ad83   9495c3:	e8 00 00 00 00       	call   9495c8 <___bpf_prog_run+0xad88>	9495c4: R_X86_64_PLT32	__msan_warning-0x4
ad88   9495c8:	48 85 ed             	test   %rbp,%rbp
ad8b   9495cb:	0f 84 8a d0 ff ff    	je     94665b <___bpf_prog_run+0x7e1b>
ad91   9495d1:	44 89 ff             	mov    %r15d,%edi
ad94   9495d4:	e8 00 00 00 00       	call   9495d9 <___bpf_prog_run+0xad99>	9495d5: R_X86_64_PLT32	__msan_warning-0x4
ad99   9495d9:	48 85 ed             	test   %rbp,%rbp
ad9c   9495dc:	0f 84 82 d0 ff ff    	je     946664 <___bpf_prog_run+0x7e24>
ada2   9495e2:	44 89 ff             	mov    %r15d,%edi
ada5   9495e5:	e8 00 00 00 00       	call   9495ea <___bpf_prog_run+0xadaa>	9495e6: R_X86_64_PLT32	__msan_warning-0x4
adaa   9495ea:	e9 75 d0 ff ff       	jmp    946664 <___bpf_prog_run+0x7e24>
adaf   9495ef:	89 ef                	mov    %ebp,%edi
adb1   9495f1:	e8 00 00 00 00       	call   9495f6 <___bpf_prog_run+0xadb6>	9495f2: R_X86_64_PLT32	__msan_warning-0x4
adb6   9495f6:	e9 9e d0 ff ff       	jmp    946699 <___bpf_prog_run+0x7e59>
adbb   9495fb:	8b 3c 24             	mov    (%rsp),%edi
adbe   9495fe:	e8 00 00 00 00       	call   949603 <___bpf_prog_run+0xadc3>	9495ff: R_X86_64_PLT32	__msan_warning-0x4
adc3   949603:	e9 b3 d0 ff ff       	jmp    9466bb <___bpf_prog_run+0x7e7b>
adc8   949608:	8b 7c 24 40          	mov    0x40(%rsp),%edi
adcc   94960c:	e8 00 00 00 00       	call   949611 <___bpf_prog_run+0xadd1>	94960d: R_X86_64_PLT32	__msan_warning-0x4
add1   949611:	48 85 ed             	test   %rbp,%rbp
add4   949614:	0f 84 e0 d0 ff ff    	je     9466fa <___bpf_prog_run+0x7eba>
adda   94961a:	44 89 ff             	mov    %r15d,%edi
addd   94961d:	e8 00 00 00 00       	call   949622 <___bpf_prog_run+0xade2>	94961e: R_X86_64_PLT32	__msan_warning-0x4
ade2   949622:	48 85 ed             	test   %rbp,%rbp
ade5   949625:	0f 84 d8 d0 ff ff    	je     946703 <___bpf_prog_run+0x7ec3>
adeb   94962b:	44 89 ff             	mov    %r15d,%edi
adee   94962e:	e8 00 00 00 00       	call   949633 <___bpf_prog_run+0xadf3>	94962f: R_X86_64_PLT32	__msan_warning-0x4
adf3   949633:	e9 cb d0 ff ff       	jmp    946703 <___bpf_prog_run+0x7ec3>
adf8   949638:	e8 00 00 00 00       	call   94963d <___bpf_prog_run+0xadfd>	949639: R_X86_64_PLT32	__msan_warning-0x4
adfd   94963d:	e9 ee d0 ff ff       	jmp    946730 <___bpf_prog_run+0x7ef0>
ae02   949642:	8b 3c 24             	mov    (%rsp),%edi
ae05   949645:	e8 00 00 00 00       	call   94964a <___bpf_prog_run+0xae0a>	949646: R_X86_64_PLT32	__msan_warning-0x4
ae0a   94964a:	e9 08 d1 ff ff       	jmp    946757 <___bpf_prog_run+0x7f17>
ae0f   94964f:	44 89 ff             	mov    %r15d,%edi
ae12   949652:	e8 00 00 00 00       	call   949657 <___bpf_prog_run+0xae17>	949653: R_X86_64_PLT32	__msan_warning-0x4
ae17   949657:	e9 21 d1 ff ff       	jmp    94677d <___bpf_prog_run+0x7f3d>
ae1c   94965c:	8b 3c 24             	mov    (%rsp),%edi
ae1f   94965f:	e8 00 00 00 00       	call   949664 <___bpf_prog_run+0xae24>	949660: R_X86_64_PLT32	__msan_warning-0x4
ae24   949664:	e9 55 d2 ff ff       	jmp    9468be <___bpf_prog_run+0x807e>
ae29   949669:	e8 00 00 00 00       	call   94966e <___bpf_prog_run+0xae2e>	94966a: R_X86_64_PLT32	__msan_warning-0x4
ae2e   94966e:	e9 83 d2 ff ff       	jmp    9468f6 <___bpf_prog_run+0x80b6>
ae33   949673:	49 89 d6             	mov    %rdx,%r14
ae36   949676:	8b 7c 24 50          	mov    0x50(%rsp),%edi
ae3a   94967a:	e8 00 00 00 00       	call   94967f <___bpf_prog_run+0xae3f>	94967b: R_X86_64_PLT32	__msan_chain_origin-0x4
ae3f   94967f:	89 c0                	mov    %eax,%eax
ae41   949681:	48 89 c1             	mov    %rax,%rcx
ae44   949684:	48 c1 e1 20          	shl    $0x20,%rcx
ae48   949688:	48 09 c1             	or     %rax,%rcx
ae4b   94968b:	49 89 0e             	mov    %rcx,(%r14)
ae4e   94968e:	e9 7a d2 ff ff       	jmp    94690d <___bpf_prog_run+0x80cd>
ae53   949693:	89 ef                	mov    %ebp,%edi
ae55   949695:	e8 00 00 00 00       	call   94969a <___bpf_prog_run+0xae5a>	949696: R_X86_64_PLT32	__msan_warning-0x4
ae5a   94969a:	e9 9d d2 ff ff       	jmp    94693c <___bpf_prog_run+0x80fc>
ae5f   94969f:	8b 3c 24             	mov    (%rsp),%edi
ae62   9496a2:	e8 00 00 00 00       	call   9496a7 <___bpf_prog_run+0xae67>	9496a3: R_X86_64_PLT32	__msan_warning-0x4
ae67   9496a7:	e9 b2 d2 ff ff       	jmp    94695e <___bpf_prog_run+0x811e>
ae6c   9496ac:	8b 7c 24 40          	mov    0x40(%rsp),%edi
ae70   9496b0:	e8 00 00 00 00       	call   9496b5 <___bpf_prog_run+0xae75>	9496b1: R_X86_64_PLT32	__msan_warning-0x4
ae75   9496b5:	48 85 ed             	test   %rbp,%rbp
ae78   9496b8:	0f 84 df d2 ff ff    	je     94699d <___bpf_prog_run+0x815d>
ae7e   9496be:	44 89 ff             	mov    %r15d,%edi
ae81   9496c1:	e8 00 00 00 00       	call   9496c6 <___bpf_prog_run+0xae86>	9496c2: R_X86_64_PLT32	__msan_warning-0x4
ae86   9496c6:	48 85 ed             	test   %rbp,%rbp
ae89   9496c9:	0f 84 d7 d2 ff ff    	je     9469a6 <___bpf_prog_run+0x8166>
ae8f   9496cf:	44 89 ff             	mov    %r15d,%edi
ae92   9496d2:	e8 00 00 00 00       	call   9496d7 <___bpf_prog_run+0xae97>	9496d3: R_X86_64_PLT32	__msan_warning-0x4
ae97   9496d7:	e9 ca d2 ff ff       	jmp    9469a6 <___bpf_prog_run+0x8166>
ae9c   9496dc:	89 ef                	mov    %ebp,%edi
ae9e   9496de:	e8 00 00 00 00       	call   9496e3 <___bpf_prog_run+0xaea3>	9496df: R_X86_64_PLT32	__msan_warning-0x4
aea3   9496e3:	e9 f3 d2 ff ff       	jmp    9469db <___bpf_prog_run+0x819b>
aea8   9496e8:	8b 3c 24             	mov    (%rsp),%edi
aeab   9496eb:	e8 00 00 00 00       	call   9496f0 <___bpf_prog_run+0xaeb0>	9496ec: R_X86_64_PLT32	__msan_warning-0x4
aeb0   9496f0:	e9 08 d3 ff ff       	jmp    9469fd <___bpf_prog_run+0x81bd>
aeb5   9496f5:	8b 7c 24 40          	mov    0x40(%rsp),%edi
aeb9   9496f9:	e8 00 00 00 00       	call   9496fe <___bpf_prog_run+0xaebe>	9496fa: R_X86_64_PLT32	__msan_warning-0x4
aebe   9496fe:	48 85 ed             	test   %rbp,%rbp
aec1   949701:	0f 84 35 d3 ff ff    	je     946a3c <___bpf_prog_run+0x81fc>
aec7   949707:	44 89 ff             	mov    %r15d,%edi
aeca   94970a:	e8 00 00 00 00       	call   94970f <___bpf_prog_run+0xaecf>	94970b: R_X86_64_PLT32	__msan_warning-0x4
aecf   94970f:	48 85 ed             	test   %rbp,%rbp
aed2   949712:	0f 84 2d d3 ff ff    	je     946a45 <___bpf_prog_run+0x8205>
aed8   949718:	44 89 ff             	mov    %r15d,%edi
aedb   94971b:	e8 00 00 00 00       	call   949720 <___bpf_prog_run+0xaee0>	94971c: R_X86_64_PLT32	__msan_warning-0x4
aee0   949720:	e9 20 d3 ff ff       	jmp    946a45 <___bpf_prog_run+0x8205>
aee5   949725:	e8 00 00 00 00       	call   94972a <___bpf_prog_run+0xaeea>	949726: R_X86_64_PLT32	__msan_warning-0x4
aeea   94972a:	e9 55 d3 ff ff       	jmp    946a84 <___bpf_prog_run+0x8244>
aeef   94972f:	44 89 f7             	mov    %r14d,%edi
aef2   949732:	e8 00 00 00 00       	call   949737 <___bpf_prog_run+0xaef7>	949733: R_X86_64_PLT32	__msan_warning-0x4
aef7   949737:	4d 85 ff             	test   %r15,%r15
aefa   94973a:	0f 84 7a d3 ff ff    	je     946aba <___bpf_prog_run+0x827a>
af00   949740:	8b 7c 24 4c          	mov    0x4c(%rsp),%edi
af04   949744:	e8 00 00 00 00       	call   949749 <___bpf_prog_run+0xaf09>	949745: R_X86_64_PLT32	__msan_warning-0x4
af09   949749:	e9 6c d3 ff ff       	jmp    946aba <___bpf_prog_run+0x827a>
af0e   94974e:	8b 7c 24 4c          	mov    0x4c(%rsp),%edi
af12   949752:	e8 00 00 00 00       	call   949757 <___bpf_prog_run+0xaf17>	949753: R_X86_64_PLT32	__msan_warning-0x4
af17   949757:	e9 6c d3 ff ff       	jmp    946ac8 <___bpf_prog_run+0x8288>
af1c   94975c:	8b 3c 24             	mov    (%rsp),%edi
af1f   94975f:	e8 00 00 00 00       	call   949764 <___bpf_prog_run+0xaf24>	949760: R_X86_64_PLT32	__msan_warning-0x4
af24   949764:	e9 6c d3 ff ff       	jmp    946ad5 <___bpf_prog_run+0x8295>
af29   949769:	e8 00 00 00 00       	call   94976e <___bpf_prog_run+0xaf2e>	94976a: R_X86_64_PLT32	__msan_warning-0x4
af2e   94976e:	e9 95 d3 ff ff       	jmp    946b08 <___bpf_prog_run+0x82c8>
af33   949773:	e8 00 00 00 00       	call   949778 <___bpf_prog_run+0xaf38>	949774: R_X86_64_PLT32	__msan_warning-0x4
af38   949778:	e9 c4 d3 ff ff       	jmp    946b41 <___bpf_prog_run+0x8301>
af3d   94977d:	8b 3c 24             	mov    (%rsp),%edi
af40   949780:	e8 00 00 00 00       	call   949785 <___bpf_prog_run+0xaf45>	949781: R_X86_64_PLT32	__msan_warning-0x4
af45   949785:	e9 de d3 ff ff       	jmp    946b68 <___bpf_prog_run+0x8328>
af4a   94978a:	44 89 ff             	mov    %r15d,%edi
af4d   94978d:	e8 00 00 00 00       	call   949792 <___bpf_prog_run+0xaf52>	94978e: R_X86_64_PLT32	__msan_warning-0x4
af52   949792:	e9 f7 d3 ff ff       	jmp    946b8e <___bpf_prog_run+0x834e>
af57   949797:	8b 3c 24             	mov    (%rsp),%edi
af5a   94979a:	e8 00 00 00 00       	call   94979f <___bpf_prog_run+0xaf5f>	94979b: R_X86_64_PLT32	__msan_warning-0x4
af5f   94979f:	e9 32 d5 ff ff       	jmp    946cd6 <___bpf_prog_run+0x8496>
af64   9497a4:	e8 00 00 00 00       	call   9497a9 <___bpf_prog_run+0xaf69>	9497a5: R_X86_64_PLT32	__msan_warning-0x4
af69   9497a9:	e9 60 d5 ff ff       	jmp    946d0e <___bpf_prog_run+0x84ce>
af6e   9497ae:	49 89 d6             	mov    %rdx,%r14
af71   9497b1:	8b 7c 24 50          	mov    0x50(%rsp),%edi
af75   9497b5:	e8 00 00 00 00       	call   9497ba <___bpf_prog_run+0xaf7a>	9497b6: R_X86_64_PLT32	__msan_chain_origin-0x4
af7a   9497ba:	89 c0                	mov    %eax,%eax
af7c   9497bc:	48 89 c1             	mov    %rax,%rcx
af7f   9497bf:	48 c1 e1 20          	shl    $0x20,%rcx
af83   9497c3:	48 09 c1             	or     %rax,%rcx
af86   9497c6:	49 89 0e             	mov    %rcx,(%r14)
af89   9497c9:	e9 57 d5 ff ff       	jmp    946d25 <___bpf_prog_run+0x84e5>
af8e   9497ce:	e8 00 00 00 00       	call   9497d3 <___bpf_prog_run+0xaf93>	9497cf: R_X86_64_PLT32	__msan_warning-0x4
af93   9497d3:	e9 74 d5 ff ff       	jmp    946d4c <___bpf_prog_run+0x850c>
af98   9497d8:	8b 3c 24             	mov    (%rsp),%edi
af9b   9497db:	e8 00 00 00 00       	call   9497e0 <___bpf_prog_run+0xafa0>	9497dc: R_X86_64_PLT32	__msan_warning-0x4
afa0   9497e0:	e9 8e d5 ff ff       	jmp    946d73 <___bpf_prog_run+0x8533>
afa5   9497e5:	44 89 f7             	mov    %r14d,%edi
afa8   9497e8:	e8 00 00 00 00       	call   9497ed <___bpf_prog_run+0xafad>	9497e9: R_X86_64_PLT32	__msan_warning-0x4
afad   9497ed:	e9 a8 d5 ff ff       	jmp    946d9a <___bpf_prog_run+0x855a>
afb2   9497f2:	8b 3c 24             	mov    (%rsp),%edi
afb5   9497f5:	e8 00 00 00 00       	call   9497fa <___bpf_prog_run+0xafba>	9497f6: R_X86_64_PLT32	__msan_warning-0x4
afba   9497fa:	e9 e1 d6 ff ff       	jmp    946ee0 <___bpf_prog_run+0x86a0>
afbf   9497ff:	e8 00 00 00 00       	call   949804 <___bpf_prog_run+0xafc4>	949800: R_X86_64_PLT32	__msan_warning-0x4
afc4   949804:	e9 16 d7 ff ff       	jmp    946f1f <___bpf_prog_run+0x86df>
afc9   949809:	49 89 d6             	mov    %rdx,%r14
afcc   94980c:	8b 7c 24 50          	mov    0x50(%rsp),%edi
afd0   949810:	e8 00 00 00 00       	call   949815 <___bpf_prog_run+0xafd5>	949811: R_X86_64_PLT32	__msan_chain_origin-0x4
afd5   949815:	89 c0                	mov    %eax,%eax
afd7   949817:	48 89 c1             	mov    %rax,%rcx
afda   94981a:	48 c1 e1 20          	shl    $0x20,%rcx
afde   94981e:	48 09 c1             	or     %rax,%rcx
afe1   949821:	49 89 0e             	mov    %rcx,(%r14)
afe4   949824:	e9 0d d7 ff ff       	jmp    946f36 <___bpf_prog_run+0x86f6>
afe9   949829:	8b 7c 24 04          	mov    0x4(%rsp),%edi
afed   94982d:	e8 00 00 00 00       	call   949832 <___bpf_prog_run+0xaff2>	94982e: R_X86_64_PLT32	__msan_warning-0x4
aff2   949832:	e9 22 d7 ff ff       	jmp    946f59 <___bpf_prog_run+0x8719>
aff7   949837:	e8 00 00 00 00       	call   94983c <___bpf_prog_run+0xaffc>	949838: R_X86_64_PLT32	__msan_warning-0x4
affc   94983c:	e9 4e d7 ff ff       	jmp    946f8f <___bpf_prog_run+0x874f>
b001   949841:	44 89 ef             	mov    %r13d,%edi
b004   949844:	e8 00 00 00 00       	call   949849 <___bpf_prog_run+0xb009>	949845: R_X86_64_PLT32	__msan_warning-0x4
b009   949849:	e9 69 d7 ff ff       	jmp    946fb7 <___bpf_prog_run+0x8777>
b00e   94984e:	8b 7c 24 50          	mov    0x50(%rsp),%edi
b012   949852:	e8 00 00 00 00       	call   949857 <___bpf_prog_run+0xb017>	949853: R_X86_64_PLT32	__msan_warning-0x4
b017   949857:	e9 69 d7 ff ff       	jmp    946fc5 <___bpf_prog_run+0x8785>
b01c   94985c:	8b 7c 24 58          	mov    0x58(%rsp),%edi
b020   949860:	e8 00 00 00 00       	call   949865 <___bpf_prog_run+0xb025>	949861: R_X86_64_PLT32	__msan_warning-0x4
b025   949865:	48 85 db             	test   %rbx,%rbx
b028   949868:	0f 84 73 d7 ff ff    	je     946fe1 <___bpf_prog_run+0x87a1>
b02e   94986e:	8b 7c 24 58          	mov    0x58(%rsp),%edi
b032   949872:	e8 00 00 00 00       	call   949877 <___bpf_prog_run+0xb037>	949873: R_X86_64_PLT32	__msan_warning-0x4
b037   949877:	e9 65 d7 ff ff       	jmp    946fe1 <___bpf_prog_run+0x87a1>
b03c   94987c:	8b 7c 24 04          	mov    0x4(%rsp),%edi
b040   949880:	e8 00 00 00 00       	call   949885 <___bpf_prog_run+0xb045>	949881: R_X86_64_PLT32	__msan_warning-0x4
b045   949885:	e9 72 d7 ff ff       	jmp    946ffc <___bpf_prog_run+0x87bc>
b04a   94988a:	89 ef                	mov    %ebp,%edi
b04c   94988c:	e8 00 00 00 00       	call   949891 <___bpf_prog_run+0xb051>	94988d: R_X86_64_PLT32	__msan_warning-0x4
b051   949891:	e9 a7 d7 ff ff       	jmp    94703d <___bpf_prog_run+0x87fd>
b056   949896:	8b 3c 24             	mov    (%rsp),%edi
b059   949899:	e8 00 00 00 00       	call   94989e <___bpf_prog_run+0xb05e>	94989a: R_X86_64_PLT32	__msan_warning-0x4
b05e   94989e:	e9 bc d7 ff ff       	jmp    94705f <___bpf_prog_run+0x881f>
b063   9498a3:	8b 7c 24 40          	mov    0x40(%rsp),%edi
b067   9498a7:	e8 00 00 00 00       	call   9498ac <___bpf_prog_run+0xb06c>	9498a8: R_X86_64_PLT32	__msan_warning-0x4
b06c   9498ac:	48 85 ed             	test   %rbp,%rbp
b06f   9498af:	0f 84 e9 d7 ff ff    	je     94709e <___bpf_prog_run+0x885e>
b075   9498b5:	44 89 ff             	mov    %r15d,%edi
b078   9498b8:	e8 00 00 00 00       	call   9498bd <___bpf_prog_run+0xb07d>	9498b9: R_X86_64_PLT32	__msan_warning-0x4
b07d   9498bd:	48 85 ed             	test   %rbp,%rbp
b080   9498c0:	0f 84 e1 d7 ff ff    	je     9470a7 <___bpf_prog_run+0x8867>
b086   9498c6:	44 89 ff             	mov    %r15d,%edi
b089   9498c9:	e8 00 00 00 00       	call   9498ce <___bpf_prog_run+0xb08e>	9498ca: R_X86_64_PLT32	__msan_warning-0x4
b08e   9498ce:	e9 d4 d7 ff ff       	jmp    9470a7 <___bpf_prog_run+0x8867>
b093   9498d3:	e8 00 00 00 00       	call   9498d8 <___bpf_prog_run+0xb098>	9498d4: R_X86_64_PLT32	__msan_warning-0x4
b098   9498d8:	e9 8e f8 ff ff       	jmp    94916b <___bpf_prog_run+0xa92b>
b09d   9498dd:	8b 3c 24             	mov    (%rsp),%edi
b0a0   9498e0:	e8 00 00 00 00       	call   9498e5 <___bpf_prog_run+0xb0a5>	9498e1: R_X86_64_PLT32	__msan_warning-0x4
b0a5   9498e5:	e9 ad f8 ff ff       	jmp    949197 <___bpf_prog_run+0xa957>
b0aa   9498ea:	8b 7c 24 50          	mov    0x50(%rsp),%edi
b0ae   9498ee:	e8 00 00 00 00       	call   9498f3 <___bpf_prog_run+0xb0b3>	9498ef: R_X86_64_PLT32	__msan_warning-0x4
b0b3   9498f3:	48 85 db             	test   %rbx,%rbx
b0b6   9498f6:	0f 84 db f8 ff ff    	je     9491d7 <___bpf_prog_run+0xa997>
b0bc   9498fc:	44 89 ff             	mov    %r15d,%edi
b0bf   9498ff:	e8 00 00 00 00       	call   949904 <___bpf_prog_run+0xb0c4>	949900: R_X86_64_PLT32	__msan_warning-0x4
b0c4   949904:	48 85 db             	test   %rbx,%rbx
b0c7   949907:	0f 84 d3 f8 ff ff    	je     9491e0 <___bpf_prog_run+0xa9a0>
b0cd   94990d:	44 89 ff             	mov    %r15d,%edi
b0d0   949910:	e8 00 00 00 00       	call   949915 <___bpf_prog_run+0xb0d5>	949911: R_X86_64_PLT32	__msan_warning-0x4
b0d5   949915:	e9 c6 f8 ff ff       	jmp    9491e0 <___bpf_prog_run+0xa9a0>
b0da   94991a:	8b 3c 24             	mov    (%rsp),%edi
b0dd   94991d:	e8 00 00 00 00       	call   949922 <___bpf_prog_run+0xb0e2>	94991e: R_X86_64_PLT32	__msan_warning-0x4
b0e2   949922:	e9 d1 f8 ff ff       	jmp    9491f8 <___bpf_prog_run+0xa9b8>
b0e7   949927:	e8 00 00 00 00       	call   94992c <___bpf_prog_run+0xb0ec>	949928: R_X86_64_PLT32	__msan_warning-0x4
b0ec   94992c:	e9 fc f8 ff ff       	jmp    94922d <___bpf_prog_run+0xa9ed>
b0f1   949931:	e8 00 00 00 00       	call   949936 <___bpf_prog_run+0xb0f6>	949932: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
b0f6   949936:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	949939: R_X86_64_32S	.data+0x136fe0
b0fd   94993d:	4c 89 ee             	mov    %r13,%rsi
b100   949940:	4c 89 f2             	mov    %r14,%rdx
b103   949943:	e8 00 00 00 00       	call   949948 <___bpf_prog_run+0xb108>	949944: R_X86_64_PLT32	__ubsan_handle_shift_out_of_bounds-0x4
b108   949948:	e9 9e 78 ff ff       	jmp    9411eb <___bpf_prog_run+0x29ab>
b10d   94994d:	e8 00 00 00 00       	call   949952 <___bpf_prog_run+0xb112>	94994e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
b112   949952:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	949955: R_X86_64_32S	.data+0x136f40
b119   949959:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
b11e   94995e:	48 89 da             	mov    %rbx,%rdx
b121   949961:	e8 00 00 00 00       	call   949966 <___bpf_prog_run+0xb126>	949962: R_X86_64_PLT32	__ubsan_handle_shift_out_of_bounds-0x4
b126   949966:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
b12c   94996c:	0f 85 49 01 00 00    	jne    949abb <___bpf_prog_run+0xb27b>
b132   949972:	48 8b 7c 24 40       	mov    0x40(%rsp),%rdi
b137   949977:	44 0f b6 27          	movzbl (%rdi),%r12d
b13b   94997b:	e8 00 00 00 00       	call   949980 <___bpf_prog_run+0xb140>	94997c: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
b140   949980:	0f b6 28             	movzbl (%rax),%ebp
b143   949983:	8b 02                	mov    (%rdx),%eax
b145   949985:	89 44 24 38          	mov    %eax,0x38(%rsp)
b149   949989:	83 e5 0f             	and    $0xf,%ebp
b14c   94998c:	41 83 e4 0f          	and    $0xf,%r12d
b150   949990:	e9 ce 7f ff ff       	jmp    941963 <___bpf_prog_run+0x3123>
b155   949995:	44 8b 74 24 18       	mov    0x18(%rsp),%r14d
b15a   94999a:	e8 00 00 00 00       	call   94999f <___bpf_prog_run+0xb15f>	94999b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
b15f   94999f:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	9499a2: R_X86_64_32S	.data+0x136fc0
b166   9499a6:	4c 89 f6             	mov    %r14,%rsi
b169   9499a9:	48 89 da             	mov    %rbx,%rdx
b16c   9499ac:	e8 00 00 00 00       	call   9499b1 <___bpf_prog_run+0xb171>	9499ad: R_X86_64_PLT32	__ubsan_handle_shift_out_of_bounds-0x4
b171   9499b1:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
b177   9499b7:	0f 85 0b 01 00 00    	jne    949ac8 <___bpf_prog_run+0xb288>
b17d   9499bd:	48 8b 7c 24 40       	mov    0x40(%rsp),%rdi
b182   9499c2:	44 0f b6 37          	movzbl (%rdi),%r14d
b186   9499c6:	e8 00 00 00 00       	call   9499cb <___bpf_prog_run+0xb18b>	9499c7: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
b18b   9499cb:	44 0f b6 20          	movzbl (%rax),%r12d
b18f   9499cf:	8b 02                	mov    (%rdx),%eax
b191   9499d1:	89 44 24 38          	mov    %eax,0x38(%rsp)
b195   9499d5:	41 83 e4 0f          	and    $0xf,%r12d
b199   9499d9:	41 83 e6 0f          	and    $0xf,%r14d
b19d   9499dd:	e9 5e 95 ff ff       	jmp    942f40 <___bpf_prog_run+0x4700>
b1a2   9499e2:	e8 00 00 00 00       	call   9499e7 <___bpf_prog_run+0xb1a7>	9499e3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
b1a7   9499e7:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	9499ea: R_X86_64_32S	.data+0x136f80
b1ae   9499ee:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
b1b3   9499f3:	48 89 da             	mov    %rbx,%rdx
b1b6   9499f6:	e8 00 00 00 00       	call   9499fb <___bpf_prog_run+0xb1bb>	9499f7: R_X86_64_PLT32	__ubsan_handle_shift_out_of_bounds-0x4
b1bb   9499fb:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
b1c1   949a01:	0f 85 ce 00 00 00    	jne    949ad5 <___bpf_prog_run+0xb295>
b1c7   949a07:	48 8b 7c 24 40       	mov    0x40(%rsp),%rdi
b1cc   949a0c:	44 0f b6 27          	movzbl (%rdi),%r12d
b1d0   949a10:	e8 00 00 00 00       	call   949a15 <___bpf_prog_run+0xb1d5>	949a11: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
b1d5   949a15:	0f b6 28             	movzbl (%rax),%ebp
b1d8   949a18:	8b 02                	mov    (%rdx),%eax
b1da   949a1a:	89 44 24 38          	mov    %eax,0x38(%rsp)
b1de   949a1e:	83 e5 0f             	and    $0xf,%ebp
b1e1   949a21:	41 83 e4 0f          	and    $0xf,%r12d
b1e5   949a25:	e9 5a ac ff ff       	jmp    944684 <___bpf_prog_run+0x5e44>
b1ea   949a2a:	e8 00 00 00 00       	call   949a2f <___bpf_prog_run+0xb1ef>	949a2b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
b1ef   949a2f:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	949a32: R_X86_64_32S	.data+0x136fa0
b1f6   949a36:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
b1fb   949a3b:	4c 89 fa             	mov    %r15,%rdx
b1fe   949a3e:	e8 00 00 00 00       	call   949a43 <___bpf_prog_run+0xb203>	949a3f: R_X86_64_PLT32	__ubsan_handle_shift_out_of_bounds-0x4
b203   949a43:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
b209   949a49:	0f 85 93 00 00 00    	jne    949ae2 <___bpf_prog_run+0xb2a2>
b20f   949a4f:	48 8b 7c 24 40       	mov    0x40(%rsp),%rdi
b214   949a54:	44 0f b6 27          	movzbl (%rdi),%r12d
b218   949a58:	e8 00 00 00 00       	call   949a5d <___bpf_prog_run+0xb21d>	949a59: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
b21d   949a5d:	0f b6 28             	movzbl (%rax),%ebp
b220   949a60:	8b 02                	mov    (%rdx),%eax
b222   949a62:	89 44 24 38          	mov    %eax,0x38(%rsp)
b226   949a66:	83 e5 0f             	and    $0xf,%ebp
b229   949a69:	41 83 e4 0f          	and    $0xf,%r12d
b22d   949a6d:	e9 37 ae ff ff       	jmp    9448a9 <___bpf_prog_run+0x6069>
b232   949a72:	44 8b 74 24 18       	mov    0x18(%rsp),%r14d
b237   949a77:	e8 00 00 00 00       	call   949a7c <___bpf_prog_run+0xb23c>	949a78: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
b23c   949a7c:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	949a7f: R_X86_64_32S	.data+0x136f60
b243   949a83:	4c 89 f6             	mov    %r14,%rsi
b246   949a86:	48 89 da             	mov    %rbx,%rdx
b249   949a89:	e8 00 00 00 00       	call   949a8e <___bpf_prog_run+0xb24e>	949a8a: R_X86_64_PLT32	__ubsan_handle_shift_out_of_bounds-0x4
b24e   949a8e:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
b254   949a94:	75 59                	jne    949aef <___bpf_prog_run+0xb2af>
b256   949a96:	48 8b 7c 24 40       	mov    0x40(%rsp),%rdi
b25b   949a9b:	44 0f b6 37          	movzbl (%rdi),%r14d
b25f   949a9f:	e8 00 00 00 00       	call   949aa4 <___bpf_prog_run+0xb264>	949aa0: R_X86_64_PLT32	__msan_metadata_ptr_for_load_1-0x4
b264   949aa4:	44 0f b6 20          	movzbl (%rax),%r12d
b268   949aa8:	8b 02                	mov    (%rdx),%eax
b26a   949aaa:	89 44 24 38          	mov    %eax,0x38(%rsp)
b26e   949aae:	41 83 e4 0f          	and    $0xf,%r12d
b272   949ab2:	41 83 e6 0f          	and    $0xf,%r14d
b276   949ab6:	e9 c3 af ff ff       	jmp    944a7e <___bpf_prog_run+0x623e>
b27b   949abb:	8b 3c 24             	mov    (%rsp),%edi
b27e   949abe:	e8 00 00 00 00       	call   949ac3 <___bpf_prog_run+0xb283>	949abf: R_X86_64_PLT32	__msan_warning-0x4
b283   949ac3:	e9 aa fe ff ff       	jmp    949972 <___bpf_prog_run+0xb132>
b288   949ac8:	8b 3c 24             	mov    (%rsp),%edi
b28b   949acb:	e8 00 00 00 00       	call   949ad0 <___bpf_prog_run+0xb290>	949acc: R_X86_64_PLT32	__msan_warning-0x4
b290   949ad0:	e9 e8 fe ff ff       	jmp    9499bd <___bpf_prog_run+0xb17d>
b295   949ad5:	8b 3c 24             	mov    (%rsp),%edi
b298   949ad8:	e8 00 00 00 00       	call   949add <___bpf_prog_run+0xb29d>	949ad9: R_X86_64_PLT32	__msan_warning-0x4
b29d   949add:	e9 25 ff ff ff       	jmp    949a07 <___bpf_prog_run+0xb1c7>
b2a2   949ae2:	8b 3c 24             	mov    (%rsp),%edi
b2a5   949ae5:	e8 00 00 00 00       	call   949aea <___bpf_prog_run+0xb2aa>	949ae6: R_X86_64_PLT32	__msan_warning-0x4
b2aa   949aea:	e9 60 ff ff ff       	jmp    949a4f <___bpf_prog_run+0xb20f>
b2af   949aef:	8b 3c 24             	mov    (%rsp),%edi
b2b2   949af2:	e8 00 00 00 00       	call   949af7 <___bpf_prog_run+0xb2b7>	949af3: R_X86_64_PLT32	__msan_warning-0x4
b2b7   949af7:	eb 9d                	jmp    949a96 <___bpf_prog_run+0xb256>
b2b9   949af9:	e8 00 00 00 00       	call   949afe <___bpf_prog_run+0xb2be>	949afa: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
b2be   949afe:	48 83 7c 24 20 00    	cmpq   $0x0,0x20(%rsp)
b2c4   949b04:	75 39                	jne    949b3f <___bpf_prog_run+0xb2ff>
b2c6   949b06:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
b2cb   949b0b:	48 8b 1f             	mov    (%rdi),%rbx
b2ce   949b0e:	e8 00 00 00 00       	call   949b13 <___bpf_prog_run+0xb2d3>	949b0f: R_X86_64_PLT32	__msan_metadata_ptr_for_load_8-0x4
b2d3   949b13:	48 8b 00             	mov    (%rax),%rax
b2d6   949b16:	8b 0a                	mov    (%rdx),%ecx
b2d8   949b18:	48 8b 54 24 68       	mov    0x68(%rsp),%rdx
b2dd   949b1d:	48 89 82 20 03 00 00 	mov    %rax,0x320(%rdx)
b2e4   949b24:	89 8a a8 0f 00 00    	mov    %ecx,0xfa8(%rdx)
b2ea   949b2a:	48 89 d8             	mov    %rbx,%rax
b2ed   949b2d:	48 81 c4 d0 00 00 00 	add    $0xd0,%rsp
b2f4   949b34:	5b                   	pop    %rbx
b2f5   949b35:	41 5c                	pop    %r12
b2f7   949b37:	41 5d                	pop    %r13
b2f9   949b39:	41 5e                	pop    %r14
b2fb   949b3b:	41 5f                	pop    %r15
b2fd   949b3d:	5d                   	pop    %rbp
b2fe   949b3e:	c3                   	ret
b2ff   949b3f:	8b 7c 24 04          	mov    0x4(%rsp),%edi
b303   949b43:	e8 00 00 00 00       	call   949b48 <___bpf_prog_run+0xb308>	949b44: R_X86_64_PLT32	__msan_warning-0x4
b308   949b48:	eb bc                	jmp    949b06 <___bpf_prog_run+0xb2c6>
b30a   949b4a:	e8 00 00 00 00       	call   949b4f <___bpf_prog_run+0xb30f>	949b4b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
b30f   949b4f:	e8 00 00 00 00       	call   949b54 <___bpf_prog_run+0xb314>	949b50: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
b314   949b54:	90                   	nop
b315   949b55:	0f 0b                	ud2
b317   949b57:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
b321   949b61:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
b32b   949b6b:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
b335   949b75:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
b33f   949b7f:	90                   	nop

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
