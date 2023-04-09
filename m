Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02F51FBE;
	Sun,  9 Apr 2023 20:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681073446; x=1712609446;
  h=date:from:cc:subject:message-id:mime-version;
  bh=JiY8WEPFUUOmrSO8t3Cw6O7PppC0NN+EmJibdXjfhEs=;
  b=ZE5y87DgtkDO3UPXvqgs13hlEGTVcJdgM23S28/EX2CkuUvXjAERQQ/y
   awSp+Q+/xDjwDKTEmwSdhaFzgTdiIsLbTPOpZ5pcJ7Ibi32e5Ib95s+Wj
   pcYdiG7KK5B8GT9br4ki6e1mCtzTwLCMGCoeeUaREts1X8k1KrAUHM3hY
   5jGHh2U9zkmV7WSD+fPnjGhEF/1/f9q+VJ/3kKhVRnIAaX6pMUMB/AUZd
   p8d9hDNy4IUnc+1dfeZX3JLXSxSbgtQueWJjVXKWh2prI5fHUftJVQ/lX
   fc7b2NasUGFgzI6/29JPpC4kEfIk8kZkYXiJrCGko/D15DSihcuyRGVxx
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10675"; a="371086043"
X-IronPort-AV: E=Sophos;i="5.98,332,1673942400"; 
   d="scan'208";a="371086043"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2023 13:50:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10675"; a="831734110"
X-IronPort-AV: E=Sophos;i="5.98,332,1673942400"; 
   d="scan'208";a="831734110"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 09 Apr 2023 13:50:44 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1plbzo-000Uld-0m;
	Sun, 09 Apr 2023 20:50:44 +0000
Date: Mon, 10 Apr 2023 04:50:25 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: mptctl_timeout_expired+0x70:
 unreachable instruction
Message-ID: <202304100456.bH0AEBRg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Alexander Lobakin <alexandr.lobakin@intel.com>
CC: Yury Norov <yury.norov@gmail.com>
CC: Marco Elver <elver@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   09a9639e56c01c7a00d6c0ca63f4c7c41abe075d
commit: b03fc1173c0c2bb8fad61902a862985cecdc4b1b bitops: let optimize out non-atomic bitops on compile-time constants
date:   9 months ago
config: x86_64-randconfig-a006-20230410 (https://download.01.org/0day-ci/archive/20230410/202304100456.bH0AEBRg-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b03fc1173c0c2bb8fad61902a862985cecdc4b1b
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout b03fc1173c0c2bb8fad61902a862985cecdc4b1b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304100456.bH0AEBRg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: mptctl_timeout_expired+0x70: unreachable instruction


objdump-func vmlinux.o mptctl_timeout_expired:
0000 00000000024ccd40 <mptctl_timeout_expired>:
0000  24ccd40:	e8 00 00 00 00       	call   24ccd45 <mptctl_timeout_expired+0x5>	24ccd41: R_X86_64_PLT32	__fentry__-0x4
0005  24ccd45:	55                   	push   %rbp
0006  24ccd46:	41 57                	push   %r15
0008  24ccd48:	41 56                	push   %r14
000a  24ccd4a:	41 55                	push   %r13
000c  24ccd4c:	41 54                	push   %r12
000e  24ccd4e:	53                   	push   %rbx
000f  24ccd4f:	50                   	push   %rax
0010  24ccd50:	48 89 f3             	mov    %rsi,%rbx
0013  24ccd53:	49 89 ff             	mov    %rdi,%r15
0016  24ccd56:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
0020  24ccd60:	e8 00 00 00 00       	call   24ccd65 <mptctl_timeout_expired+0x25>	24ccd61: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0025  24ccd65:	48 89 1c 24          	mov    %rbx,(%rsp)
0029  24ccd69:	48 83 c3 03          	add    $0x3,%rbx
002d  24ccd6d:	48 89 d8             	mov    %rbx,%rax
0030  24ccd70:	48 c1 e8 03          	shr    $0x3,%rax
0034  24ccd74:	42 8a 04 28          	mov    (%rax,%r13,1),%al
0038  24ccd78:	84 c0                	test   %al,%al
003a  24ccd7a:	0f 85 fb 01 00 00    	jne    24ccf7b <mptctl_timeout_expired+0x23b>
0040  24ccd80:	40 8a 2b             	mov    (%rbx),%bpl
0043  24ccd83:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	24ccd86: R_X86_64_32S	mpt_fwfault_debug
004a  24ccd8a:	48 c1 e8 03          	shr    $0x3,%rax
004e  24ccd8e:	42 8a 04 28          	mov    (%rax,%r13,1),%al
0052  24ccd92:	84 c0                	test   %al,%al
0054  24ccd94:	0f 85 fb 01 00 00    	jne    24ccf95 <mptctl_timeout_expired+0x255>
005a  24ccd9a:	83 3d 00 00 00 00 00 	cmpl   $0x0,0x0(%rip)        # 24ccda1 <mptctl_timeout_expired+0x61>	24ccd9c: R_X86_64_PC32	mpt_fwfault_debug-0x5
0061  24ccda1:	74 0f                	je     24ccdb2 <mptctl_timeout_expired+0x72>
0063  24ccda3:	e8 00 00 00 00       	call   24ccda8 <mptctl_timeout_expired+0x68>	24ccda4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0068  24ccda8:	4c 89 ff             	mov    %r15,%rdi
006b  24ccdab:	e8 00 00 00 00       	call   24ccdb0 <mptctl_timeout_expired+0x70>	24ccdac: R_X86_64_PLT32	mpt_halt_firmware-0x4
0070  24ccdb0:	eb 05                	jmp    24ccdb7 <mptctl_timeout_expired+0x77>
0072  24ccdb2:	e8 00 00 00 00       	call   24ccdb7 <mptctl_timeout_expired+0x77>	24ccdb3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0077  24ccdb7:	49 8d 9f e0 10 00 00 	lea    0x10e0(%r15),%rbx
007e  24ccdbe:	48 89 df             	mov    %rbx,%rdi
0081  24ccdc1:	e8 00 00 00 00       	call   24ccdc6 <mptctl_timeout_expired+0x86>	24ccdc2: R_X86_64_PLT32	_raw_spin_lock_irqsave-0x4
0086  24ccdc6:	49 89 c4             	mov    %rax,%r12
0089  24ccdc9:	49 8d bf 25 11 00 00 	lea    0x1125(%r15),%rdi
0090  24ccdd0:	48 89 f8             	mov    %rdi,%rax
0093  24ccdd3:	48 c1 e8 03          	shr    $0x3,%rax
0097  24ccdd7:	42 8a 04 28          	mov    (%rax,%r13,1),%al
009b  24ccddb:	84 c0                	test   %al,%al
009d  24ccddd:	0f 85 d8 01 00 00    	jne    24ccfbb <mptctl_timeout_expired+0x27b>
00a3  24ccde3:	45 8a b7 25 11 00 00 	mov    0x1125(%r15),%r14b
00aa  24ccdea:	48 89 df             	mov    %rbx,%rdi
00ad  24ccded:	4c 89 e6             	mov    %r12,%rsi
00b0  24ccdf0:	e8 00 00 00 00       	call   24ccdf5 <mptctl_timeout_expired+0xb5>	24ccdf1: R_X86_64_PLT32	_raw_spin_unlock_irqrestore-0x4
00b5  24ccdf5:	49 8d 9f d0 10 00 00 	lea    0x10d0(%r15),%rbx
00bc  24ccdfc:	48 89 d8             	mov    %rbx,%rax
00bf  24ccdff:	48 c1 e8 03          	shr    $0x3,%rax
00c3  24cce03:	42 8a 04 28          	mov    (%rax,%r13,1),%al
00c7  24cce07:	84 c0                	test   %al,%al
00c9  24cce09:	0f 85 c3 01 00 00    	jne    24ccfd2 <mptctl_timeout_expired+0x292>
00cf  24cce0f:	80 23 fb             	andb   $0xfb,(%rbx)
00d2  24cce12:	45 84 f6             	test   %r14b,%r14b
00d5  24cce15:	74 0e                	je     24cce25 <mptctl_timeout_expired+0xe5>
00d7  24cce17:	e8 00 00 00 00       	call   24cce1c <mptctl_timeout_expired+0xdc>	24cce18: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
00dc  24cce1c:	48 8b 2c 24          	mov    (%rsp),%rbp
00e0  24cce20:	e9 22 01 00 00       	jmp    24ccf47 <mptctl_timeout_expired+0x207>
00e5  24cce25:	49 8d 9f 80 00 00 00 	lea    0x80(%r15),%rbx
00ec  24cce2c:	48 89 d8             	mov    %rbx,%rax
00ef  24cce2f:	48 c1 e8 03          	shr    $0x3,%rax
00f3  24cce33:	42 8a 04 28          	mov    (%rax,%r13,1),%al
00f7  24cce37:	84 c0                	test   %al,%al
00f9  24cce39:	0f 85 ad 01 00 00    	jne    24ccfec <mptctl_timeout_expired+0x2ac>
00ff  24cce3f:	80 3b 02             	cmpb   $0x2,(%rbx)
0102  24cce42:	75 3e                	jne    24cce82 <mptctl_timeout_expired+0x142>
0104  24cce44:	40 84 ed             	test   %bpl,%bpl
0107  24cce47:	74 4f                	je     24cce98 <mptctl_timeout_expired+0x158>
0109  24cce49:	40 80 fd 16          	cmp    $0x16,%bpl
010d  24cce4d:	0f 85 9a 00 00 00    	jne    24cceed <mptctl_timeout_expired+0x1ad>
0113  24cce53:	e8 00 00 00 00       	call   24cce58 <mptctl_timeout_expired+0x118>	24cce54: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0118  24cce58:	48 8b 2c 24          	mov    (%rsp),%rbp
011c  24cce5c:	48 8d 5d 01          	lea    0x1(%rbp),%rbx
0120  24cce60:	48 89 d8             	mov    %rbx,%rax
0123  24cce63:	48 c1 e8 03          	shr    $0x3,%rax
0127  24cce67:	42 8a 04 28          	mov    (%rax,%r13,1),%al
012b  24cce6b:	84 c0                	test   %al,%al
012d  24cce6d:	0f 85 ad 01 00 00    	jne    24cd020 <mptctl_timeout_expired+0x2e0>
0133  24cce73:	0f b6 13             	movzbl (%rbx),%edx
0136  24cce76:	4c 89 ff             	mov    %r15,%rdi
0139  24cce79:	be 04 00 00 00       	mov    $0x4,%esi
013e  24cce7e:	31 c9                	xor    %ecx,%ecx
0140  24cce80:	eb 5b                	jmp    24ccedd <mptctl_timeout_expired+0x19d>
0142  24cce82:	40 84 ed             	test   %bpl,%bpl
0145  24cce85:	74 6d                	je     24ccef4 <mptctl_timeout_expired+0x1b4>
0147  24cce87:	40 80 fd 16          	cmp    $0x16,%bpl
014b  24cce8b:	0f 85 a0 00 00 00    	jne    24ccf31 <mptctl_timeout_expired+0x1f1>
0151  24cce91:	e8 00 00 00 00       	call   24cce96 <mptctl_timeout_expired+0x156>	24cce92: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0156  24cce96:	eb 61                	jmp    24ccef9 <mptctl_timeout_expired+0x1b9>
0158  24cce98:	e8 00 00 00 00       	call   24cce9d <mptctl_timeout_expired+0x15d>	24cce99: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
015d  24cce9d:	48 8b 2c 24          	mov    (%rsp),%rbp
0161  24ccea1:	48 8d 7d 01          	lea    0x1(%rbp),%rdi
0165  24ccea5:	48 89 f8             	mov    %rdi,%rax
0168  24ccea8:	48 c1 e8 03          	shr    $0x3,%rax
016c  24cceac:	42 8a 04 28          	mov    (%rax,%r13,1),%al
0170  24cceb0:	84 c0                	test   %al,%al
0172  24cceb2:	0f 85 82 01 00 00    	jne    24cd03a <mptctl_timeout_expired+0x2fa>
0178  24cceb8:	8a 5d 01             	mov    0x1(%rbp),%bl
017b  24ccebb:	48 89 e8             	mov    %rbp,%rax
017e  24ccebe:	48 c1 e8 03          	shr    $0x3,%rax
0182  24ccec2:	42 8a 04 28          	mov    (%rax,%r13,1),%al
0186  24ccec6:	84 c0                	test   %al,%al
0188  24ccec8:	0f 85 83 01 00 00    	jne    24cd051 <mptctl_timeout_expired+0x311>
018e  24ccece:	0f b6 4d 00          	movzbl 0x0(%rbp),%ecx
0192  24cced2:	0f b6 d3             	movzbl %bl,%edx
0195  24cced5:	4c 89 ff             	mov    %r15,%rdi
0198  24cced8:	be 03 00 00 00       	mov    $0x3,%esi
019d  24ccedd:	e8 9e 05 00 00       	call   24cd480 <mptctl_do_taskmgmt>
01a2  24ccee2:	85 c0                	test   %eax,%eax
01a4  24ccee4:	74 7a                	je     24ccf60 <mptctl_timeout_expired+0x220>
01a6  24ccee6:	e8 00 00 00 00       	call   24cceeb <mptctl_timeout_expired+0x1ab>	24ccee7: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
01ab  24cceeb:	eb 4d                	jmp    24ccf3a <mptctl_timeout_expired+0x1fa>
01ad  24cceed:	e8 00 00 00 00       	call   24ccef2 <mptctl_timeout_expired+0x1b2>	24cceee: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
01b2  24ccef2:	eb 42                	jmp    24ccf36 <mptctl_timeout_expired+0x1f6>
01b4  24ccef4:	e8 00 00 00 00       	call   24ccef9 <mptctl_timeout_expired+0x1b9>	24ccef5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
01b9  24ccef9:	48 8b 2c 24          	mov    (%rsp),%rbp
01bd  24ccefd:	48 8d 5d 01          	lea    0x1(%rbp),%rbx
01c1  24ccf01:	48 89 d8             	mov    %rbx,%rax
01c4  24ccf04:	48 c1 e8 03          	shr    $0x3,%rax
01c8  24ccf08:	42 8a 04 28          	mov    (%rax,%r13,1),%al
01cc  24ccf0c:	84 c0                	test   %al,%al
01ce  24ccf0e:	0f 85 f2 00 00 00    	jne    24cd006 <mptctl_timeout_expired+0x2c6>
01d4  24ccf14:	0f b6 13             	movzbl (%rbx),%edx
01d7  24ccf17:	4c 89 ff             	mov    %r15,%rdi
01da  24ccf1a:	be 04 00 00 00       	mov    $0x4,%esi
01df  24ccf1f:	31 c9                	xor    %ecx,%ecx
01e1  24ccf21:	e8 5a 05 00 00       	call   24cd480 <mptctl_do_taskmgmt>
01e6  24ccf26:	85 c0                	test   %eax,%eax
01e8  24ccf28:	74 3d                	je     24ccf67 <mptctl_timeout_expired+0x227>
01ea  24ccf2a:	e8 00 00 00 00       	call   24ccf2f <mptctl_timeout_expired+0x1ef>	24ccf2b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
01ef  24ccf2f:	eb 09                	jmp    24ccf3a <mptctl_timeout_expired+0x1fa>
01f1  24ccf31:	e8 00 00 00 00       	call   24ccf36 <mptctl_timeout_expired+0x1f6>	24ccf32: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
01f6  24ccf36:	48 8b 2c 24          	mov    (%rsp),%rbp
01fa  24ccf3a:	4c 89 ff             	mov    %r15,%rdi
01fd  24ccf3d:	be 01 00 00 00       	mov    $0x1,%esi
0202  24ccf42:	e8 00 00 00 00       	call   24ccf47 <mptctl_timeout_expired+0x207>	24ccf43: R_X86_64_PLT32	mpt_Soft_Hard_ResetHandler-0x4
0207  24ccf47:	4c 89 ff             	mov    %r15,%rdi
020a  24ccf4a:	48 89 ee             	mov    %rbp,%rsi
020d  24ccf4d:	48 83 c4 08          	add    $0x8,%rsp
0211  24ccf51:	5b                   	pop    %rbx
0212  24ccf52:	41 5c                	pop    %r12
0214  24ccf54:	41 5d                	pop    %r13
0216  24ccf56:	41 5e                	pop    %r14
0218  24ccf58:	41 5f                	pop    %r15
021a  24ccf5a:	5d                   	pop    %rbp
021b  24ccf5b:	e9 00 00 00 00       	jmp    24ccf60 <mptctl_timeout_expired+0x220>	24ccf5c: R_X86_64_PLT32	mpt_free_msg_frame-0x4
0220  24ccf60:	e8 00 00 00 00       	call   24ccf65 <mptctl_timeout_expired+0x225>	24ccf61: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0225  24ccf65:	eb 05                	jmp    24ccf6c <mptctl_timeout_expired+0x22c>
0227  24ccf67:	e8 00 00 00 00       	call   24ccf6c <mptctl_timeout_expired+0x22c>	24ccf68: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
022c  24ccf6c:	48 83 c4 08          	add    $0x8,%rsp
0230  24ccf70:	5b                   	pop    %rbx
0231  24ccf71:	41 5c                	pop    %r12
0233  24ccf73:	41 5d                	pop    %r13
0235  24ccf75:	41 5e                	pop    %r14
0237  24ccf77:	41 5f                	pop    %r15
0239  24ccf79:	5d                   	pop    %rbp
023a  24ccf7a:	c3                   	ret
023b  24ccf7b:	89 d9                	mov    %ebx,%ecx
023d  24ccf7d:	80 e1 07             	and    $0x7,%cl
0240  24ccf80:	38 c1                	cmp    %al,%cl
0242  24ccf82:	0f 8c f8 fd ff ff    	jl     24ccd80 <mptctl_timeout_expired+0x40>
0248  24ccf88:	48 89 df             	mov    %rbx,%rdi
024b  24ccf8b:	e8 00 00 00 00       	call   24ccf90 <mptctl_timeout_expired+0x250>	24ccf8c: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
0250  24ccf90:	e9 eb fd ff ff       	jmp    24ccd80 <mptctl_timeout_expired+0x40>
0255  24ccf95:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	24ccf98: R_X86_64_32S	mpt_fwfault_debug
025c  24ccf9c:	80 e1 07             	and    $0x7,%cl
025f  24ccf9f:	80 c1 03             	add    $0x3,%cl
0262  24ccfa2:	38 c1                	cmp    %al,%cl
0264  24ccfa4:	0f 8c f0 fd ff ff    	jl     24ccd9a <mptctl_timeout_expired+0x5a>
026a  24ccfaa:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	24ccfad: R_X86_64_32S	mpt_fwfault_debug
0271  24ccfb1:	e8 00 00 00 00       	call   24ccfb6 <mptctl_timeout_expired+0x276>	24ccfb2: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0276  24ccfb6:	e9 df fd ff ff       	jmp    24ccd9a <mptctl_timeout_expired+0x5a>
027b  24ccfbb:	89 f9                	mov    %edi,%ecx
027d  24ccfbd:	80 e1 07             	and    $0x7,%cl
0280  24ccfc0:	38 c1                	cmp    %al,%cl
0282  24ccfc2:	0f 8c 1b fe ff ff    	jl     24ccde3 <mptctl_timeout_expired+0xa3>
0288  24ccfc8:	e8 00 00 00 00       	call   24ccfcd <mptctl_timeout_expired+0x28d>	24ccfc9: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
028d  24ccfcd:	e9 11 fe ff ff       	jmp    24ccde3 <mptctl_timeout_expired+0xa3>
0292  24ccfd2:	89 d9                	mov    %ebx,%ecx
0294  24ccfd4:	80 e1 07             	and    $0x7,%cl
0297  24ccfd7:	38 c1                	cmp    %al,%cl
0299  24ccfd9:	0f 8c 30 fe ff ff    	jl     24cce0f <mptctl_timeout_expired+0xcf>
029f  24ccfdf:	48 89 df             	mov    %rbx,%rdi
02a2  24ccfe2:	e8 00 00 00 00       	call   24ccfe7 <mptctl_timeout_expired+0x2a7>	24ccfe3: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
02a7  24ccfe7:	e9 23 fe ff ff       	jmp    24cce0f <mptctl_timeout_expired+0xcf>
02ac  24ccfec:	89 d9                	mov    %ebx,%ecx
02ae  24ccfee:	80 e1 07             	and    $0x7,%cl
02b1  24ccff1:	38 c1                	cmp    %al,%cl
02b3  24ccff3:	0f 8c 46 fe ff ff    	jl     24cce3f <mptctl_timeout_expired+0xff>
02b9  24ccff9:	48 89 df             	mov    %rbx,%rdi
02bc  24ccffc:	e8 00 00 00 00       	call   24cd001 <mptctl_timeout_expired+0x2c1>	24ccffd: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
02c1  24cd001:	e9 39 fe ff ff       	jmp    24cce3f <mptctl_timeout_expired+0xff>
02c6  24cd006:	89 d9                	mov    %ebx,%ecx
02c8  24cd008:	80 e1 07             	and    $0x7,%cl
02cb  24cd00b:	38 c1                	cmp    %al,%cl
02cd  24cd00d:	0f 8c 01 ff ff ff    	jl     24ccf14 <mptctl_timeout_expired+0x1d4>
02d3  24cd013:	48 89 df             	mov    %rbx,%rdi
02d6  24cd016:	e8 00 00 00 00       	call   24cd01b <mptctl_timeout_expired+0x2db>	24cd017: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
02db  24cd01b:	e9 f4 fe ff ff       	jmp    24ccf14 <mptctl_timeout_expired+0x1d4>
02e0  24cd020:	89 d9                	mov    %ebx,%ecx
02e2  24cd022:	80 e1 07             	and    $0x7,%cl
02e5  24cd025:	38 c1                	cmp    %al,%cl
02e7  24cd027:	0f 8c 46 fe ff ff    	jl     24cce73 <mptctl_timeout_expired+0x133>
02ed  24cd02d:	48 89 df             	mov    %rbx,%rdi
02f0  24cd030:	e8 00 00 00 00       	call   24cd035 <mptctl_timeout_expired+0x2f5>	24cd031: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
02f5  24cd035:	e9 39 fe ff ff       	jmp    24cce73 <mptctl_timeout_expired+0x133>
02fa  24cd03a:	89 f9                	mov    %edi,%ecx
02fc  24cd03c:	80 e1 07             	and    $0x7,%cl
02ff  24cd03f:	38 c1                	cmp    %al,%cl
0301  24cd041:	0f 8c 71 fe ff ff    	jl     24cceb8 <mptctl_timeout_expired+0x178>
0307  24cd047:	e8 00 00 00 00       	call   24cd04c <mptctl_timeout_expired+0x30c>	24cd048: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
030c  24cd04c:	e9 67 fe ff ff       	jmp    24cceb8 <mptctl_timeout_expired+0x178>
0311  24cd051:	89 e9                	mov    %ebp,%ecx
0313  24cd053:	80 e1 07             	and    $0x7,%cl
0316  24cd056:	38 c1                	cmp    %al,%cl
0318  24cd058:	0f 8c 70 fe ff ff    	jl     24ccece <mptctl_timeout_expired+0x18e>
031e  24cd05e:	48 89 ef             	mov    %rbp,%rdi
0321  24cd061:	e8 00 00 00 00       	call   24cd066 <mptctl_timeout_expired+0x326>	24cd062: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
0326  24cd066:	e9 63 fe ff ff       	jmp    24ccece <mptctl_timeout_expired+0x18e>
032b  24cd06b:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
0335  24cd075:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
033f  24cd07f:	90                   	nop

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
