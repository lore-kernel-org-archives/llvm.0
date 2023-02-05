Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145352771B;
	Sun,  5 Feb 2023 21:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675633478; x=1707169478;
  h=date:from:cc:subject:message-id:mime-version;
  bh=SqSzKyx1D8XjbcL8N/0KDMXr0pL23dFlhde5gsyzL7A=;
  b=OWvr3B88chSZNyUFd39Fw0eI7h3dYcwbS+ZivfWQRTLOhHOkDYGxNgMN
   dxyC0Q0Gdnn/StfQVeRgSRpFP+TainjrKLarmP+KX8yrjJwHCkVYnrL67
   +7mkfTCiUvbR04NPIk74nRSKaGP8dZojSwJKw5H1InSJPka5FExtFNQb4
   tdDhDIVb/1U5fhAmcicGTn7XcQIENYmBCqqMH+rX25zH88q5OLPMgkyZL
   lQ21UQvRi7nbGCRHUrdyZ+gU/ZBPpEE+iBMWF5Fdcu9TZQce9WSwbbY6X
   NogUBPQhuHSa+5cXOeaeJeV54jRcu/6l/Q6DkEXwZDGOh4ZDNVyvugJqU
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="356444794"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="356444794"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2023 13:44:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="790263186"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="790263186"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 05 Feb 2023 13:44:35 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOmoM-0002Ea-2y;
	Sun, 05 Feb 2023 21:44:34 +0000
Date: Mon, 6 Feb 2023 05:43:54 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [stable:linux-5.15.y 4710/9999] drivers/hwmon/pmbus/adm1275.o:
 warning: objtool: adm1275_probe()+0x741: unreachable instruction
Message-ID: <202302060542.DhEtoyGi-lkp@intel.com>
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
CC: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
head:   9cf4111cdf9420fa99792ae16c8de23242bb2e0b
commit: cc3011cdbe5f834b0e9873b841d1be02be9a1524 [4710/9999] x86/retbleed: Add fine grained Kconfig knobs
config: x86_64-buildonly-randconfig-r004-20230206 (https://download.01.org/0day-ci/archive/20230206/202302060542.DhEtoyGi-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=cc3011cdbe5f834b0e9873b841d1be02be9a1524
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.15.y
        git checkout cc3011cdbe5f834b0e9873b841d1be02be9a1524
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/hwmon/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/hwmon/pmbus/adm1275.o: warning: objtool: adm1275_probe()+0x741: unreachable instruction


objdump-func vmlinux.o adm1275_probe:
0000 0000000000ac5960 <adm1275_probe>:
0000   ac5960:	e8 00 00 00 00       	call   ac5965 <adm1275_probe+0x5>	ac5961: R_X86_64_PLT32	__fentry__-0x4
0005   ac5965:	55                   	push   %rbp
0006   ac5966:	48 89 e5             	mov    %rsp,%rbp
0009   ac5969:	41 57                	push   %r15
000b   ac596b:	41 56                	push   %r14
000d   ac596d:	41 55                	push   %r13
000f   ac596f:	41 54                	push   %r12
0011   ac5971:	53                   	push   %rbx
0012   ac5972:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
0016   ac5976:	48 83 ec 70          	sub    $0x70,%rsp
001a   ac597a:	49 89 ff             	mov    %rdi,%r15
001d   ac597d:	65 48 8b 04 25 28 00 00 00 	mov    %gs:0x28,%rax
0026   ac5986:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
002b   ac598b:	e8 00 00 00 00       	call   ac5990 <adm1275_probe+0x30>	ac598c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0030   ac5990:	c6 44 24 50 00       	movb   $0x0,0x50(%rsp)
0035   ac5995:	48 c7 44 24 48 00 00 00 00 	movq   $0x0,0x48(%rsp)
003e   ac599e:	48 c7 44 24 40 00 00 00 00 	movq   $0x0,0x40(%rsp)
0047   ac59a7:	48 c7 44 24 38 00 00 00 00 	movq   $0x0,0x38(%rsp)
0050   ac59b0:	48 c7 44 24 30 00 00 00 00 	movq   $0x0,0x30(%rsp)
0059   ac59b9:	49 8b 7f 18          	mov    0x18(%r15),%rdi
005d   ac59bd:	48 8b 47 10          	mov    0x10(%rdi),%rax
0061   ac59c1:	ff 50 20             	call   *0x20(%rax)
0064   ac59c4:	f7 d0                	not    %eax
0066   ac59c6:	a9 00 00 08 03       	test   $0x3080000,%eax
006b   ac59cb:	75 3a                	jne    ac5a07 <adm1275_probe+0xa7>
006d   ac59cd:	48 8d 54 24 30       	lea    0x30(%rsp),%rdx
0072   ac59d2:	4c 89 ff             	mov    %r15,%rdi
0075   ac59d5:	be 99 00 00 00       	mov    $0x99,%esi
007a   ac59da:	e8 00 00 00 00       	call   ac59df <adm1275_probe+0x7f>	ac59db: R_X86_64_PLT32	i2c_smbus_read_block_data-0x4
007f   ac59df:	89 c3                	mov    %eax,%ebx
0081   ac59e1:	85 c0                	test   %eax,%eax
0083   ac59e3:	78 29                	js     ac5a0e <adm1275_probe+0xae>
0085   ac59e5:	83 fb 03             	cmp    $0x3,%ebx
0088   ac59e8:	75 2b                	jne    ac5a15 <adm1275_probe+0xb5>
008a   ac59ea:	b8 41 44 00 00       	mov    $0x4441,%eax
008f   ac59ef:	33 44 24 30          	xor    0x30(%rsp),%eax
0093   ac59f3:	0f b6 4c 24 32       	movzbl 0x32(%rsp),%ecx
0098   ac59f8:	83 f1 49             	xor    $0x49,%ecx
009b   ac59fb:	66 09 c1             	or     %ax,%cx
009e   ac59fe:	74 44                	je     ac5a44 <adm1275_probe+0xe4>
00a0   ac5a00:	e8 00 00 00 00       	call   ac5a05 <adm1275_probe+0xa5>	ac5a01: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
00a5   ac5a05:	eb 13                	jmp    ac5a1a <adm1275_probe+0xba>
00a7   ac5a07:	e8 00 00 00 00       	call   ac5a0c <adm1275_probe+0xac>	ac5a08: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
00ac   ac5a0c:	eb 0c                	jmp    ac5a1a <adm1275_probe+0xba>
00ae   ac5a0e:	e8 00 00 00 00       	call   ac5a13 <adm1275_probe+0xb3>	ac5a0f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
00b3   ac5a13:	eb 0a                	jmp    ac5a1f <adm1275_probe+0xbf>
00b5   ac5a15:	e8 00 00 00 00       	call   ac5a1a <adm1275_probe+0xba>	ac5a16: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
00ba   ac5a1a:	bb ed ff ff ff       	mov    $0xffffffed,%ebx
00bf   ac5a1f:	65 48 8b 04 25 28 00 00 00 	mov    %gs:0x28,%rax
00c8   ac5a28:	48 3b 44 24 60       	cmp    0x60(%rsp),%rax
00cd   ac5a2d:	0f 85 dc 08 00 00    	jne    ac630f <adm1275_probe+0x9af>
00d3   ac5a33:	89 d8                	mov    %ebx,%eax
00d5   ac5a35:	48 8d 65 d8          	lea    -0x28(%rbp),%rsp
00d9   ac5a39:	5b                   	pop    %rbx
00da   ac5a3a:	41 5c                	pop    %r12
00dc   ac5a3c:	41 5d                	pop    %r13
00de   ac5a3e:	41 5e                	pop    %r14
00e0   ac5a40:	41 5f                	pop    %r15
00e2   ac5a42:	5d                   	pop    %rbp
00e3   ac5a43:	c3                   	ret
00e4   ac5a44:	48 8d 54 24 30       	lea    0x30(%rsp),%rdx
00e9   ac5a49:	4c 89 ff             	mov    %r15,%rdi
00ec   ac5a4c:	be 9a 00 00 00       	mov    $0x9a,%esi
00f1   ac5a51:	e8 00 00 00 00       	call   ac5a56 <adm1275_probe+0xf6>	ac5a52: R_X86_64_PLT32	i2c_smbus_read_block_data-0x4
00f6   ac5a56:	85 c0                	test   %eax,%eax
00f8   ac5a58:	0f 88 4b 01 00 00    	js     ac5ba9 <adm1275_probe+0x249>
00fe   ac5a5e:	49 c7 c6 00 00 00 00 	mov    $0x0,%r14	ac5a61: R_X86_64_32S	.rodata+0x5e97c0
0105   ac5a65:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	ac5a68: R_X86_64_32S	.rodata+0x5e97c0
010c   ac5a6c:	e8 00 00 00 00       	call   ac5a71 <adm1275_probe+0x111>	ac5a6d: R_X86_64_PLT32	strlen-0x4
0111   ac5a71:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
0116   ac5a76:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	ac5a79: R_X86_64_32S	.rodata+0x5e97c0
011d   ac5a7d:	48 89 c2             	mov    %rax,%rdx
0120   ac5a80:	e8 00 00 00 00       	call   ac5a85 <adm1275_probe+0x125>	ac5a81: R_X86_64_PLT32	strncasecmp-0x4
0125   ac5a85:	85 c0                	test   %eax,%eax
0127   ac5a87:	0f 84 28 01 00 00    	je     ac5bb5 <adm1275_probe+0x255>
012d   ac5a8d:	49 c7 c6 00 00 00 00 	mov    $0x0,%r14	ac5a90: R_X86_64_32S	.rodata+0x5e97e0
0134   ac5a94:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	ac5a97: R_X86_64_32S	.rodata+0x5e97e0
013b   ac5a9b:	e8 00 00 00 00       	call   ac5aa0 <adm1275_probe+0x140>	ac5a9c: R_X86_64_PLT32	strlen-0x4
0140   ac5aa0:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
0145   ac5aa5:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	ac5aa8: R_X86_64_32S	.rodata+0x5e97e0
014c   ac5aac:	48 89 c2             	mov    %rax,%rdx
014f   ac5aaf:	e8 00 00 00 00       	call   ac5ab4 <adm1275_probe+0x154>	ac5ab0: R_X86_64_PLT32	strncasecmp-0x4
0154   ac5ab4:	85 c0                	test   %eax,%eax
0156   ac5ab6:	0f 84 00 01 00 00    	je     ac5bbc <adm1275_probe+0x25c>
015c   ac5abc:	49 c7 c6 00 00 00 00 	mov    $0x0,%r14	ac5abf: R_X86_64_32S	.rodata+0x5e9800
0163   ac5ac3:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	ac5ac6: R_X86_64_32S	.rodata+0x5e9800
016a   ac5aca:	e8 00 00 00 00       	call   ac5acf <adm1275_probe+0x16f>	ac5acb: R_X86_64_PLT32	strlen-0x4
016f   ac5acf:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
0174   ac5ad4:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	ac5ad7: R_X86_64_32S	.rodata+0x5e9800
017b   ac5adb:	48 89 c2             	mov    %rax,%rdx
017e   ac5ade:	e8 00 00 00 00       	call   ac5ae3 <adm1275_probe+0x183>	ac5adf: R_X86_64_PLT32	strncasecmp-0x4
0183   ac5ae3:	85 c0                	test   %eax,%eax
0185   ac5ae5:	0f 84 d8 00 00 00    	je     ac5bc3 <adm1275_probe+0x263>
018b   ac5aeb:	49 c7 c6 00 00 00 00 	mov    $0x0,%r14	ac5aee: R_X86_64_32S	.rodata+0x5e9820
0192   ac5af2:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	ac5af5: R_X86_64_32S	.rodata+0x5e9820
0199   ac5af9:	e8 00 00 00 00       	call   ac5afe <adm1275_probe+0x19e>	ac5afa: R_X86_64_PLT32	strlen-0x4
019e   ac5afe:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
01a3   ac5b03:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	ac5b06: R_X86_64_32S	.rodata+0x5e9820
01aa   ac5b0a:	48 89 c2             	mov    %rax,%rdx
01ad   ac5b0d:	e8 00 00 00 00       	call   ac5b12 <adm1275_probe+0x1b2>	ac5b0e: R_X86_64_PLT32	strncasecmp-0x4
01b2   ac5b12:	85 c0                	test   %eax,%eax
01b4   ac5b14:	0f 84 b0 00 00 00    	je     ac5bca <adm1275_probe+0x26a>
01ba   ac5b1a:	49 c7 c6 00 00 00 00 	mov    $0x0,%r14	ac5b1d: R_X86_64_32S	.rodata+0x5e9840
01c1   ac5b21:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	ac5b24: R_X86_64_32S	.rodata+0x5e9840
01c8   ac5b28:	e8 00 00 00 00       	call   ac5b2d <adm1275_probe+0x1cd>	ac5b29: R_X86_64_PLT32	strlen-0x4
01cd   ac5b2d:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
01d2   ac5b32:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	ac5b35: R_X86_64_32S	.rodata+0x5e9840
01d9   ac5b39:	48 89 c2             	mov    %rax,%rdx
01dc   ac5b3c:	e8 00 00 00 00       	call   ac5b41 <adm1275_probe+0x1e1>	ac5b3d: R_X86_64_PLT32	strncasecmp-0x4
01e1   ac5b41:	85 c0                	test   %eax,%eax
01e3   ac5b43:	0f 84 88 00 00 00    	je     ac5bd1 <adm1275_probe+0x271>
01e9   ac5b49:	49 c7 c6 00 00 00 00 	mov    $0x0,%r14	ac5b4c: R_X86_64_32S	.rodata+0x5e9860
01f0   ac5b50:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	ac5b53: R_X86_64_32S	.rodata+0x5e9860
01f7   ac5b57:	e8 00 00 00 00       	call   ac5b5c <adm1275_probe+0x1fc>	ac5b58: R_X86_64_PLT32	strlen-0x4
01fc   ac5b5c:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
0201   ac5b61:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	ac5b64: R_X86_64_32S	.rodata+0x5e9860
0208   ac5b68:	48 89 c2             	mov    %rax,%rdx
020b   ac5b6b:	e8 00 00 00 00       	call   ac5b70 <adm1275_probe+0x210>	ac5b6c: R_X86_64_PLT32	strncasecmp-0x4
0210   ac5b70:	85 c0                	test   %eax,%eax
0212   ac5b72:	74 64                	je     ac5bd8 <adm1275_probe+0x278>
0214   ac5b74:	49 c7 c6 00 00 00 00 	mov    $0x0,%r14	ac5b77: R_X86_64_32S	.rodata+0x5e9880
021b   ac5b7b:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	ac5b7e: R_X86_64_32S	.rodata+0x5e9880
0222   ac5b82:	e8 00 00 00 00       	call   ac5b87 <adm1275_probe+0x227>	ac5b83: R_X86_64_PLT32	strlen-0x4
0227   ac5b87:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
022c   ac5b8c:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	ac5b8f: R_X86_64_32S	.rodata+0x5e9880
0233   ac5b93:	48 89 c2             	mov    %rax,%rdx
0236   ac5b96:	e8 00 00 00 00       	call   ac5b9b <adm1275_probe+0x23b>	ac5b97: R_X86_64_PLT32	strncasecmp-0x4
023b   ac5b9b:	85 c0                	test   %eax,%eax
023d   ac5b9d:	74 40                	je     ac5bdf <adm1275_probe+0x27f>
023f   ac5b9f:	e8 00 00 00 00       	call   ac5ba4 <adm1275_probe+0x244>	ac5ba0: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0244   ac5ba4:	e9 71 fe ff ff       	jmp    ac5a1a <adm1275_probe+0xba>
0249   ac5ba9:	89 c3                	mov    %eax,%ebx
024b   ac5bab:	e8 00 00 00 00       	call   ac5bb0 <adm1275_probe+0x250>	ac5bac: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0250   ac5bb0:	e9 6a fe ff ff       	jmp    ac5a1f <adm1275_probe+0xbf>
0255   ac5bb5:	e8 00 00 00 00       	call   ac5bba <adm1275_probe+0x25a>	ac5bb6: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
025a   ac5bba:	eb 28                	jmp    ac5be4 <adm1275_probe+0x284>
025c   ac5bbc:	e8 00 00 00 00       	call   ac5bc1 <adm1275_probe+0x261>	ac5bbd: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0261   ac5bc1:	eb 21                	jmp    ac5be4 <adm1275_probe+0x284>
0263   ac5bc3:	e8 00 00 00 00       	call   ac5bc8 <adm1275_probe+0x268>	ac5bc4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0268   ac5bc8:	eb 1a                	jmp    ac5be4 <adm1275_probe+0x284>
026a   ac5bca:	e8 00 00 00 00       	call   ac5bcf <adm1275_probe+0x26f>	ac5bcb: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
026f   ac5bcf:	eb 13                	jmp    ac5be4 <adm1275_probe+0x284>
0271   ac5bd1:	e8 00 00 00 00       	call   ac5bd6 <adm1275_probe+0x276>	ac5bd2: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0276   ac5bd6:	eb 0c                	jmp    ac5be4 <adm1275_probe+0x284>
0278   ac5bd8:	e8 00 00 00 00       	call   ac5bdd <adm1275_probe+0x27d>	ac5bd9: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
027d   ac5bdd:	eb 05                	jmp    ac5be4 <adm1275_probe+0x284>
027f   ac5bdf:	e8 00 00 00 00       	call   ac5be4 <adm1275_probe+0x284>	ac5be0: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0284   ac5be4:	49 8b 5e 18          	mov    0x18(%r14),%rbx
0288   ac5be8:	48 8d 43 ff          	lea    -0x1(%rbx),%rax
028c   ac5bec:	48 83 f8 06          	cmp    $0x6,%rax
0290   ac5bf0:	73 16                	jae    ac5c08 <adm1275_probe+0x2a8>
0292   ac5bf2:	e8 00 00 00 00       	call   ac5bf7 <adm1275_probe+0x297>	ac5bf3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0297   ac5bf7:	48 c7 c0 f8 ff ff ff 	mov    $0xfffffffffffffff8,%rax
029e   ac5bfe:	4c 8b a4 d8 00 00 00 00 	mov    0x0(%rax,%rbx,8),%r12	ac5c02: R_X86_64_32S	.rodata+0x5e99f8
02a6   ac5c06:	eb 0c                	jmp    ac5c14 <adm1275_probe+0x2b4>
02a8   ac5c08:	e8 00 00 00 00       	call   ac5c0d <adm1275_probe+0x2ad>	ac5c09: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
02ad   ac5c0d:	49 c7 c4 00 00 00 00 	mov    $0x0,%r12	ac5c10: R_X86_64_32S	i2c_smbus_read_byte_data
02b4   ac5c14:	4c 89 ff             	mov    %r15,%rdi
02b7   ac5c17:	be d4 00 00 00       	mov    $0xd4,%esi
02bc   ac5c1c:	41 ff d4             	call   *%r12
02bf   ac5c1f:	89 c3                	mov    %eax,%ebx
02c1   ac5c21:	85 c0                	test   %eax,%eax
02c3   ac5c23:	0f 88 b5 00 00 00    	js     ac5cde <adm1275_probe+0x37e>
02c9   ac5c29:	4c 89 ff             	mov    %r15,%rdi
02cc   ac5c2c:	be d8 00 00 00       	mov    $0xd8,%esi
02d1   ac5c31:	41 ff d4             	call   *%r12
02d4   ac5c34:	41 89 c4             	mov    %eax,%r12d
02d7   ac5c37:	85 c0                	test   %eax,%eax
02d9   ac5c39:	0f 88 a9 00 00 00    	js     ac5ce8 <adm1275_probe+0x388>
02df   ac5c3f:	49 8d 7f 20          	lea    0x20(%r15),%rdi
02e3   ac5c43:	be 20 02 00 00       	mov    $0x220,%esi
02e8   ac5c48:	ba c0 0d 00 00       	mov    $0xdc0,%edx
02ed   ac5c4d:	e8 00 00 00 00       	call   ac5c52 <adm1275_probe+0x2f2>	ac5c4e: R_X86_64_PLT32	devm_kmalloc-0x4
02f2   ac5c52:	48 85 c0             	test   %rax,%rax
02f5   ac5c55:	0f 84 9a 00 00 00    	je     ac5cf5 <adm1275_probe+0x395>
02fb   ac5c5b:	41 8b 56 18          	mov    0x18(%r14),%edx
02ff   ac5c5f:	89 10                	mov    %edx,(%rax)
0301   ac5c61:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%rax)
0308   ac5c68:	48 b9 01 00 00 00 01 00 00 00 	movabs $0x100000001,%rcx
0312   ac5c72:	48 89 48 34          	mov    %rcx,0x34(%rax)
0316   ac5c76:	48 89 48 40          	mov    %rcx,0x40(%rax)
031a   ac5c7a:	c7 40 48 01 00 00 00 	movl   $0x1,0x48(%rax)
0321   ac5c81:	c7 80 34 01 00 00 10 20 40 00 	movl   $0x402010,0x134(%rax)
032b   ac5c8b:	48 c7 80 e8 01 00 00 00 00 00 00 	movq   $0x0,0x1e8(%rax)	ac5c92: R_X86_64_32S	.text+0xac6320
0336   ac5c96:	48 c7 80 e0 01 00 00 00 00 00 00 	movq   $0x0,0x1e0(%rax)	ac5c9d: R_X86_64_32S	.text+0xac66a0
0341   ac5ca1:	48 c7 80 f0 01 00 00 00 00 00 00 	movq   $0x0,0x1f0(%rax)	ac5ca8: R_X86_64_32S	.text+0xac6820
034c   ac5cac:	48 83 fa 06          	cmp    $0x6,%rdx
0350   ac5cb0:	0f 87 b2 00 00 00    	ja     ac5d68 <adm1275_probe+0x408>
0356   ac5cb6:	49 89 c5             	mov    %rax,%r13
0359   ac5cb9:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
035e   ac5cbe:	ff 24 d5 00 00 00 00 	jmp    *0x0(,%rdx,8)	ac5cc1: R_X86_64_32S	.rodata+0x5e92f0
0365   ac5cc5:	41 f6 c4 10          	test   $0x10,%r12b
0369   ac5cc9:	0f 85 32 02 00 00    	jne    ac5f01 <adm1275_probe+0x5a1>
036f   ac5ccf:	e8 00 00 00 00       	call   ac5cd4 <adm1275_probe+0x374>	ac5cd0: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0374   ac5cd4:	41 c6 45 05 01       	movb   $0x1,0x5(%r13)
0379   ac5cd9:	e9 2d 02 00 00       	jmp    ac5f0b <adm1275_probe+0x5ab>
037e   ac5cde:	e8 00 00 00 00       	call   ac5ce3 <adm1275_probe+0x383>	ac5cdf: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0383   ac5ce3:	e9 37 fd ff ff       	jmp    ac5a1f <adm1275_probe+0xbf>
0388   ac5ce8:	e8 00 00 00 00       	call   ac5ced <adm1275_probe+0x38d>	ac5ce9: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
038d   ac5ced:	44 89 e3             	mov    %r12d,%ebx
0390   ac5cf0:	e9 2a fd ff ff       	jmp    ac5a1f <adm1275_probe+0xbf>
0395   ac5cf5:	e8 00 00 00 00       	call   ac5cfa <adm1275_probe+0x39a>	ac5cf6: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
039a   ac5cfa:	bb f4 ff ff ff       	mov    $0xfffffff4,%ebx
039f   ac5cff:	e9 1b fd ff ff       	jmp    ac5a1f <adm1275_probe+0xbf>
03a4   ac5d04:	41 c6 45 06 01       	movb   $0x1,0x6(%r13)
03a9   ac5d09:	66 41 c7 45 0b 01 01 	movw   $0x101,0xb(%r13)
03b0   ac5d10:	41 c6 45 0d 01       	movb   $0x1,0xd(%r13)
03b5   ac5d15:	41 c7 85 34 01 00 00 34 f2 40 00 	movl   $0x40f234,0x134(%r13)
03c0   ac5d20:	89 d8                	mov    %ebx,%eax
03c2   ac5d22:	f7 d0                	not    %eax
03c4   ac5d24:	a8 0a                	test   $0xa,%al
03c6   ac5d26:	0f 85 c7 00 00 00    	jne    ac5df3 <adm1275_probe+0x493>
03cc   ac5d2c:	e8 00 00 00 00       	call   ac5d31 <adm1275_probe+0x3d1>	ac5d2d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
03d1   ac5d31:	e9 dd 00 00 00       	jmp    ac5e13 <adm1275_probe+0x4b3>
03d6   ac5d36:	41 f6 c4 10          	test   $0x10,%r12b
03da   ac5d3a:	0f 85 12 01 00 00    	jne    ac5e52 <adm1275_probe+0x4f2>
03e0   ac5d40:	e8 00 00 00 00       	call   ac5d45 <adm1275_probe+0x3e5>	ac5d41: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
03e5   ac5d45:	41 c6 45 05 01       	movb   $0x1,0x5(%r13)
03ea   ac5d4a:	e9 0d 01 00 00       	jmp    ac5e5c <adm1275_probe+0x4fc>
03ef   ac5d4f:	41 f6 c4 10          	test   $0x10,%r12b
03f3   ac5d53:	0f 85 41 01 00 00    	jne    ac5e9a <adm1275_probe+0x53a>
03f9   ac5d59:	e8 00 00 00 00       	call   ac5d5e <adm1275_probe+0x3fe>	ac5d5a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
03fe   ac5d5e:	41 c6 45 05 01       	movb   $0x1,0x5(%r13)
0403   ac5d63:	e9 3c 01 00 00       	jmp    ac5ea4 <adm1275_probe+0x544>
0408   ac5d68:	e8 00 00 00 00       	call   ac5d6d <adm1275_probe+0x40d>	ac5d69: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
040d   ac5d6d:	e9 a8 fc ff ff       	jmp    ac5a1a <adm1275_probe+0xba>
0412   ac5d72:	41 c6 45 06 01       	movb   $0x1,0x6(%r13)
0417   ac5d77:	66 41 c7 45 0b 01 01 	movw   $0x101,0xb(%r13)
041e   ac5d7e:	41 c6 45 0d 01       	movb   $0x1,0xd(%r13)
0423   ac5d83:	41 89 de             	mov    %ebx,%r14d
0426   ac5d86:	44 89 f0             	mov    %r14d,%eax
0429   ac5d89:	83 e0 21             	and    $0x21,%eax
042c   ac5d8c:	ff 24 c5 00 00 00 00 	jmp    *0x0(,%rax,8)	ac5d8f: R_X86_64_32S	.rodata+0x5e9328
0433   ac5d93:	e8 00 00 00 00       	call   ac5d98 <adm1275_probe+0x438>	ac5d94: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0438   ac5d98:	c7 44 24 0c 04 00 00 00 	movl   $0x4,0xc(%rsp)
0440   ac5da0:	e9 27 03 00 00       	jmp    ac60cc <adm1275_probe+0x76c>
0445   ac5da5:	e8 00 00 00 00       	call   ac5daa <adm1275_probe+0x44a>	ac5da6: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
044a   ac5daa:	eb 05                	jmp    ac5db1 <adm1275_probe+0x451>
044c   ac5dac:	e8 00 00 00 00       	call   ac5db1 <adm1275_probe+0x451>	ac5dad: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0451   ac5db1:	41 c6 45 0d 01       	movb   $0x1,0xd(%r13)
0456   ac5db6:	41 89 de             	mov    %ebx,%r14d
0459   ac5db9:	44 89 f0             	mov    %r14d,%eax
045c   ac5dbc:	83 e0 0c             	and    $0xc,%eax
045f   ac5dbf:	41 c7 45 08 01 01 01 01 	movl   $0x1010101,0x8(%r13)
0467   ac5dc7:	48 83 f8 04          	cmp    $0x4,%rax
046b   ac5dcb:	0f 84 82 01 00 00    	je     ac5f53 <adm1275_probe+0x5f3>
0471   ac5dd1:	83 f8 08             	cmp    $0x8,%eax
0474   ac5dd4:	0f 84 6c 01 00 00    	je     ac5f46 <adm1275_probe+0x5e6>
047a   ac5dda:	83 f8 0c             	cmp    $0xc,%eax
047d   ac5ddd:	0f 85 7c 01 00 00    	jne    ac5f5f <adm1275_probe+0x5ff>
0483   ac5de3:	e8 00 00 00 00       	call   ac5de8 <adm1275_probe+0x488>	ac5de4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0488   ac5de8:	41 bc 02 00 00 00    	mov    $0x2,%r12d
048e   ac5dee:	e9 68 01 00 00       	jmp    ac5f5b <adm1275_probe+0x5fb>
0493   ac5df3:	83 cb 0a             	or     $0xa,%ebx
0496   ac5df6:	0f b6 d3             	movzbl %bl,%edx
0499   ac5df9:	4c 89 ff             	mov    %r15,%rdi
049c   ac5dfc:	be d4 00 00 00       	mov    $0xd4,%esi
04a1   ac5e01:	e8 00 00 00 00       	call   ac5e06 <adm1275_probe+0x4a6>	ac5e02: R_X86_64_PLT32	i2c_smbus_write_byte_data-0x4
04a6   ac5e06:	85 c0                	test   %eax,%eax
04a8   ac5e08:	0f 88 ed 04 00 00    	js     ac62fb <adm1275_probe+0x99b>
04ae   ac5e0e:	e8 00 00 00 00       	call   ac5e13 <adm1275_probe+0x4b3>	ac5e0f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
04b3   ac5e13:	f6 c3 04             	test   $0x4,%bl
04b6   ac5e16:	0f 85 f4 01 00 00    	jne    ac6010 <adm1275_probe+0x6b0>
04bc   ac5e1c:	e8 00 00 00 00       	call   ac5e21 <adm1275_probe+0x4c1>	ac5e1d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
04c1   ac5e21:	b8 03 00 00 00       	mov    $0x3,%eax
04c6   ac5e26:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
04cb   ac5e2b:	b0 01                	mov    $0x1,%al
04cd   ac5e2d:	89 44 24 10          	mov    %eax,0x10(%rsp)
04d1   ac5e31:	c7 44 24 0c 02 00 00 00 	movl   $0x2,0xc(%rsp)
04d9   ac5e39:	c7 44 24 14 01 00 00 00 	movl   $0x1,0x14(%rsp)
04e1   ac5e41:	49 c7 c6 00 00 00 00 	mov    $0x0,%r14	ac5e44: R_X86_64_32S	.rodata+0x5e9960
04e8   ac5e48:	31 db                	xor    %ebx,%ebx
04ea   ac5e4a:	45 31 e4             	xor    %r12d,%r12d
04ed   ac5e4d:	e9 31 03 00 00       	jmp    ac6183 <adm1275_probe+0x823>
04f2   ac5e52:	e8 00 00 00 00       	call   ac5e57 <adm1275_probe+0x4f7>	ac5e53: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
04f7   ac5e57:	41 c6 45 04 01       	movb   $0x1,0x4(%r13)
04fc   ac5e5c:	45 31 e4             	xor    %r12d,%r12d
04ff   ac5e5f:	f6 c3 20             	test   $0x20,%bl
0502   ac5e62:	41 0f 94 c4          	sete   %r12b
0506   ac5e66:	f6 c3 40             	test   $0x40,%bl
0509   ac5e69:	b9 11 60 40 00       	mov    $0x406011,%ecx
050e   ac5e6e:	b8 14 30 40 00       	mov    $0x403014,%eax
0513   ac5e73:	0f 44 c1             	cmove  %ecx,%eax
0516   ac5e76:	41 c6 45 06 01       	movb   $0x1,0x6(%r13)
051b   ac5e7b:	49 c7 c6 00 00 00 00 	mov    $0x0,%r14	ac5e7e: R_X86_64_32S	.rodata+0x5e9920
0522   ac5e82:	c7 44 24 14 02 00 00 00 	movl   $0x2,0x14(%rsp)
052a   ac5e8a:	c7 44 24 0c ff ff ff ff 	movl   $0xffffffff,0xc(%rsp)
0532   ac5e92:	44 89 e3             	mov    %r12d,%ebx
0535   ac5e95:	e9 2f 01 00 00       	jmp    ac5fc9 <adm1275_probe+0x669>
053a   ac5e9a:	e8 00 00 00 00       	call   ac5e9f <adm1275_probe+0x53f>	ac5e9b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
053f   ac5e9f:	41 c6 45 04 01       	movb   $0x1,0x4(%r13)
0544   ac5ea4:	41 c6 45 06 01       	movb   $0x1,0x6(%r13)
0549   ac5ea9:	41 c6 45 0b 01       	movb   $0x1,0xb(%r13)
054e   ac5eae:	89 d8                	mov    %ebx,%eax
0550   ac5eb0:	89 c1                	mov    %eax,%ecx
0552   ac5eb2:	83 e1 20             	and    $0x20,%ecx
0555   ac5eb5:	49 89 cc             	mov    %rcx,%r12
0558   ac5eb8:	49 c1 ec 05          	shr    $0x5,%r12
055c   ac5ebc:	41 83 f4 01          	xor    $0x1,%r12d
0560   ac5ec0:	48 83 f9 01          	cmp    $0x1,%rcx
0564   ac5ec4:	b9 03 00 00 00       	mov    $0x3,%ecx
0569   ac5ec9:	83 d1 00             	adc    $0x0,%ecx
056c   ac5ecc:	89 4c 24 0c          	mov    %ecx,0xc(%rsp)
0570   ac5ed0:	41 c7 85 34 01 00 00 31 60 40 00 	movl   $0x406031,0x134(%r13)
057b   ac5edb:	a8 40                	test   $0x40,%al
057d   ac5edd:	b9 31 60 40 00       	mov    $0x406031,%ecx
0582   ac5ee2:	b8 35 70 40 00       	mov    $0x407035,%eax
0587   ac5ee7:	0f 44 c1             	cmove  %ecx,%eax
058a   ac5eea:	49 c7 c6 00 00 00 00 	mov    $0x0,%r14	ac5eed: R_X86_64_32S	.rodata+0x5e9940
0591   ac5ef1:	c7 44 24 14 02 00 00 00 	movl   $0x2,0x14(%rsp)
0599   ac5ef9:	44 89 e3             	mov    %r12d,%ebx
059c   ac5efc:	e9 c8 00 00 00       	jmp    ac5fc9 <adm1275_probe+0x669>
05a1   ac5f01:	e8 00 00 00 00       	call   ac5f06 <adm1275_probe+0x5a6>	ac5f02: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
05a6   ac5f06:	41 c6 45 04 01       	movb   $0x1,0x4(%r13)
05ab   ac5f0b:	41 c6 45 0b 01       	movb   $0x1,0xb(%r13)
05b0   ac5f10:	41 c6 45 07 01       	movb   $0x1,0x7(%r13)
05b5   ac5f15:	89 db                	mov    %ebx,%ebx
05b7   ac5f17:	89 d8                	mov    %ebx,%eax
05b9   ac5f19:	83 e0 18             	and    $0x18,%eax
05bc   ac5f1c:	48 83 f8 10          	cmp    $0x10,%rax
05c0   ac5f20:	0f 84 17 01 00 00    	je     ac603d <adm1275_probe+0x6dd>
05c6   ac5f26:	83 f8 08             	cmp    $0x8,%eax
05c9   ac5f29:	0f 85 22 01 00 00    	jne    ac6051 <adm1275_probe+0x6f1>
05cf   ac5f2f:	e8 00 00 00 00       	call   ac5f34 <adm1275_probe+0x5d4>	ac5f30: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
05d4   ac5f34:	c7 44 24 0c 03 00 00 00 	movl   $0x3,0xc(%rsp)
05dc   ac5f3c:	b8 01 00 00 00       	mov    $0x1,%eax
05e1   ac5f41:	e9 1d 01 00 00       	jmp    ac6063 <adm1275_probe+0x703>
05e6   ac5f46:	e8 00 00 00 00       	call   ac5f4b <adm1275_probe+0x5eb>	ac5f47: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
05eb   ac5f4b:	41 bc 01 00 00 00    	mov    $0x1,%r12d
05f1   ac5f51:	eb 08                	jmp    ac5f5b <adm1275_probe+0x5fb>
05f3   ac5f53:	e8 00 00 00 00       	call   ac5f58 <adm1275_probe+0x5f8>	ac5f54: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
05f8   ac5f58:	45 31 e4             	xor    %r12d,%r12d
05fb   ac5f5b:	b0 01                	mov    $0x1,%al
05fd   ac5f5d:	eb 0d                	jmp    ac5f6c <adm1275_probe+0x60c>
05ff   ac5f5f:	e8 00 00 00 00       	call   ac5f64 <adm1275_probe+0x604>	ac5f60: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0604   ac5f64:	41 bc ff ff ff ff    	mov    $0xffffffff,%r12d
060a   ac5f6a:	31 c0                	xor    %eax,%eax
060c   ac5f6c:	c1 eb 06             	shr    $0x6,%ebx
060f   ac5f6f:	83 e3 03             	and    $0x3,%ebx
0612   ac5f72:	89 d9                	mov    %ebx,%ecx
0614   ac5f74:	83 c1 03             	add    $0x3,%ecx
0617   ac5f77:	89 4c 24 14          	mov    %ecx,0x14(%rsp)
061b   ac5f7b:	42 8d 0c a3          	lea    (%rbx,%r12,4),%ecx
061f   ac5f7f:	83 c1 07             	add    $0x7,%ecx
0622   ac5f82:	84 c0                	test   %al,%al
0624   ac5f84:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
0629   ac5f89:	0f 45 c1             	cmovne %ecx,%eax
062c   ac5f8c:	89 44 24 0c          	mov    %eax,0xc(%rsp)
0630   ac5f90:	41 f6 c6 02          	test   $0x2,%r14b
0634   ac5f94:	75 15                	jne    ac5fab <adm1275_probe+0x64b>
0636   ac5f96:	e8 00 00 00 00       	call   ac5f9b <adm1275_probe+0x63b>	ac5f97: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
063b   ac5f9b:	31 db                	xor    %ebx,%ebx
063d   ac5f9d:	49 c7 c6 00 00 00 00 	mov    $0x0,%r14	ac5fa0: R_X86_64_32S	.rodata+0x5e9980
0644   ac5fa4:	b8 31 60 40 00       	mov    $0x406031,%eax
0649   ac5fa9:	eb 1e                	jmp    ac5fc9 <adm1275_probe+0x669>
064b   ac5fab:	e8 00 00 00 00       	call   ac5fb0 <adm1275_probe+0x650>	ac5fac: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0650   ac5fb0:	41 c7 85 34 01 00 00 14 30 40 00 	movl   $0x403014,0x134(%r13)
065b   ac5fbb:	31 db                	xor    %ebx,%ebx
065d   ac5fbd:	49 c7 c6 00 00 00 00 	mov    $0x0,%r14	ac5fc0: R_X86_64_32S	.rodata+0x5e9980
0664   ac5fc4:	b8 35 70 40 00       	mov    $0x407035,%eax
0669   ac5fc9:	41 89 85 34 01 00 00 	mov    %eax,0x134(%r13)
0670   ac5fd0:	45 85 e4             	test   %r12d,%r12d
0673   ac5fd3:	78 1b                	js     ac5ff0 <adm1275_probe+0x690>
0675   ac5fd5:	e8 00 00 00 00       	call   ac5fda <adm1275_probe+0x67a>	ac5fd6: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
067a   ac5fda:	48 c7 44 24 18 ff ff ff ff 	movq   $0xffffffffffffffff,0x18(%rsp)
0683   ac5fe3:	c7 44 24 10 00 00 00 00 	movl   $0x0,0x10(%rsp)
068b   ac5feb:	e9 93 01 00 00       	jmp    ac6183 <adm1275_probe+0x823>
0690   ac5ff0:	4c 89 74 24 20       	mov    %r14,0x20(%rsp)
0695   ac5ff5:	e8 00 00 00 00       	call   ac5ffa <adm1275_probe+0x69a>	ac5ff6: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
069a   ac5ffa:	48 c7 44 24 18 ff ff ff ff 	movq   $0xffffffffffffffff,0x18(%rsp)
06a3   ac6003:	c7 44 24 10 00 00 00 00 	movl   $0x0,0x10(%rsp)
06ab   ac600b:	e9 a5 01 00 00       	jmp    ac61b5 <adm1275_probe+0x855>
06b0   ac6010:	e8 00 00 00 00       	call   ac6015 <adm1275_probe+0x6b5>	ac6011: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
06b5   ac6015:	b8 03 00 00 00       	mov    $0x3,%eax
06ba   ac601a:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
06bf   ac601f:	c7 44 24 0c 02 00 00 00 	movl   $0x2,0xc(%rsp)
06c7   ac6027:	c7 44 24 14 01 00 00 00 	movl   $0x1,0x14(%rsp)
06cf   ac602f:	49 c7 c6 00 00 00 00 	mov    $0x0,%r14	ac6032: R_X86_64_32S	.rodata+0x5e9960
06d6   ac6036:	31 db                	xor    %ebx,%ebx
06d8   ac6038:	e9 2c 01 00 00       	jmp    ac6169 <adm1275_probe+0x809>
06dd   ac603d:	e8 00 00 00 00       	call   ac6042 <adm1275_probe+0x6e2>	ac603e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
06e2   ac6042:	c7 44 24 0c 04 00 00 00 	movl   $0x4,0xc(%rsp)
06ea   ac604a:	b8 02 00 00 00       	mov    $0x2,%eax
06ef   ac604f:	eb 12                	jmp    ac6063 <adm1275_probe+0x703>
06f1   ac6051:	e8 00 00 00 00       	call   ac6056 <adm1275_probe+0x6f6>	ac6052: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
06f6   ac6056:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
06fb   ac605b:	c7 44 24 0c ff ff ff ff 	movl   $0xffffffff,0xc(%rsp)
0703   ac6063:	89 44 24 14          	mov    %eax,0x14(%rsp)
0707   ac6067:	41 c7 85 34 01 00 00 31 60 40 00 	movl   $0x406031,0x134(%r13)
0712   ac6072:	f6 c3 40             	test   $0x40,%bl
0715   ac6075:	b9 31 60 40 00       	mov    $0x406031,%ecx
071a   ac607a:	b8 35 70 40 00       	mov    $0x407035,%eax
071f   ac607f:	0f 44 c1             	cmove  %ecx,%eax
0722   ac6082:	48 c7 44 24 18 ff ff ff ff 	movq   $0xffffffffffffffff,0x18(%rsp)
072b   ac608b:	49 c7 c6 00 00 00 00 	mov    $0x0,%r14	ac608e: R_X86_64_32S	.rodata+0x5e98c0
0732   ac6092:	31 db                	xor    %ebx,%ebx
0734   ac6094:	c7 44 24 10 00 00 00 00 	movl   $0x0,0x10(%rsp)
073c   ac609c:	e9 d8 00 00 00       	jmp    ac6179 <adm1275_probe+0x819>
0741   ac60a1:	e8 00 00 00 00       	call   ac60a6 <adm1275_probe+0x746>	ac60a2: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0746   ac60a6:	c7 44 24 0c 07 00 00 00 	movl   $0x7,0xc(%rsp)
074e   ac60ae:	eb 1c                	jmp    ac60cc <adm1275_probe+0x76c>
0750   ac60b0:	e8 00 00 00 00       	call   ac60b5 <adm1275_probe+0x755>	ac60b1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0755   ac60b5:	c7 44 24 0c 06 00 00 00 	movl   $0x6,0xc(%rsp)
075d   ac60bd:	eb 0d                	jmp    ac60cc <adm1275_probe+0x76c>
075f   ac60bf:	e8 00 00 00 00       	call   ac60c4 <adm1275_probe+0x764>	ac60c0: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0764   ac60c4:	c7 44 24 0c 05 00 00 00 	movl   $0x5,0xc(%rsp)
076c   ac60cc:	41 c7 85 34 01 00 00 34 f2 40 00 	movl   $0x40f234,0x134(%r13)
0777   ac60d7:	41 f7 d6             	not    %r14d
077a   ac60da:	41 f6 c6 0a          	test   $0xa,%r14b
077e   ac60de:	75 0a                	jne    ac60ea <adm1275_probe+0x78a>
0780   ac60e0:	e8 00 00 00 00       	call   ac60e5 <adm1275_probe+0x785>	ac60e1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0785   ac60e5:	41 89 dc             	mov    %ebx,%r12d
0788   ac60e8:	eb 25                	jmp    ac610f <adm1275_probe+0x7af>
078a   ac60ea:	41 89 dc             	mov    %ebx,%r12d
078d   ac60ed:	41 83 cc 0a          	or     $0xa,%r12d
0791   ac60f1:	41 0f b6 d4          	movzbl %r12b,%edx
0795   ac60f5:	4c 89 ff             	mov    %r15,%rdi
0798   ac60f8:	be d4 00 00 00       	mov    $0xd4,%esi
079d   ac60fd:	e8 00 00 00 00       	call   ac6102 <adm1275_probe+0x7a2>	ac60fe: R_X86_64_PLT32	i2c_smbus_write_byte_data-0x4
07a2   ac6102:	85 c0                	test   %eax,%eax
07a4   ac6104:	0f 88 fb 01 00 00    	js     ac6305 <adm1275_probe+0x9a5>
07aa   ac610a:	e8 00 00 00 00       	call   ac610f <adm1275_probe+0x7af>	ac610b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
07af   ac610f:	89 d8                	mov    %ebx,%eax
07b1   ac6111:	c1 e8 05             	shr    $0x5,%eax
07b4   ac6114:	83 e0 01             	and    $0x1,%eax
07b7   ac6117:	89 44 24 20          	mov    %eax,0x20(%rsp)
07bb   ac611b:	83 e3 01             	and    $0x1,%ebx
07be   ac611e:	89 d8                	mov    %ebx,%eax
07c0   ac6120:	83 c8 02             	or     $0x2,%eax
07c3   ac6123:	89 44 24 14          	mov    %eax,0x14(%rsp)
07c7   ac6127:	41 f6 c4 04          	test   $0x4,%r12b
07cb   ac612b:	75 22                	jne    ac614f <adm1275_probe+0x7ef>
07cd   ac612d:	e8 00 00 00 00       	call   ac6132 <adm1275_probe+0x7d2>	ac612e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
07d2   ac6132:	b8 08 00 00 00       	mov    $0x8,%eax
07d7   ac6137:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
07dc   ac613c:	b0 01                	mov    $0x1,%al
07de   ac613e:	89 44 24 10          	mov    %eax,0x10(%rsp)
07e2   ac6142:	49 c7 c6 00 00 00 00 	mov    $0x0,%r14	ac6145: R_X86_64_32S	.rodata+0x5e98e0
07e9   ac6149:	8b 5c 24 20          	mov    0x20(%rsp),%ebx
07ed   ac614d:	eb 31                	jmp    ac6180 <adm1275_probe+0x820>
07ef   ac614f:	e8 00 00 00 00       	call   ac6154 <adm1275_probe+0x7f4>	ac6150: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
07f4   ac6154:	b8 08 00 00 00       	mov    $0x8,%eax
07f9   ac6159:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
07fe   ac615e:	49 c7 c6 00 00 00 00 	mov    $0x0,%r14	ac6161: R_X86_64_32S	.rodata+0x5e98e0
0805   ac6165:	8b 5c 24 20          	mov    0x20(%rsp),%ebx
0809   ac6169:	41 8b 85 34 01 00 00 	mov    0x134(%r13),%eax
0810   ac6170:	83 c8 01             	or     $0x1,%eax
0813   ac6173:	b1 01                	mov    $0x1,%cl
0815   ac6175:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
0819   ac6179:	41 89 85 34 01 00 00 	mov    %eax,0x134(%r13)
0820   ac6180:	41 89 dc             	mov    %ebx,%r12d
0823   ac6183:	44 89 e0             	mov    %r12d,%eax
0826   ac6186:	48 8d 04 40          	lea    (%rax,%rax,2),%rax
082a   ac618a:	41 0f bf 0c 46       	movswl (%r14,%rax,2),%ecx
082f   ac618f:	41 89 8d d4 00 00 00 	mov    %ecx,0xd4(%r13)
0836   ac6196:	41 0f bf 4c 46 02    	movswl 0x2(%r14,%rax,2),%ecx
083c   ac619c:	41 89 8d f4 00 00 00 	mov    %ecx,0xf4(%r13)
0843   ac61a3:	4c 89 74 24 20       	mov    %r14,0x20(%rsp)
0848   ac61a8:	41 0f bf 44 46 04    	movswl 0x4(%r14,%rax,2),%eax
084e   ac61ae:	41 89 85 14 01 00 00 	mov    %eax,0x114(%r13)
0855   ac61b5:	85 db                	test   %ebx,%ebx
0857   ac61b7:	44 8b 74 24 14       	mov    0x14(%rsp),%r14d
085c   ac61bc:	78 35                	js     ac61f3 <adm1275_probe+0x893>
085e   ac61be:	e8 00 00 00 00       	call   ac61c3 <adm1275_probe+0x863>	ac61bf: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0863   ac61c3:	89 d8                	mov    %ebx,%eax
0865   ac61c5:	48 8d 04 40          	lea    (%rax,%rax,2),%rax
0869   ac61c9:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
086e   ac61ce:	0f bf 0c 42          	movswl (%rdx,%rax,2),%ecx
0872   ac61d2:	41 89 8d d8 00 00 00 	mov    %ecx,0xd8(%r13)
0879   ac61d9:	0f bf 4c 42 02       	movswl 0x2(%rdx,%rax,2),%ecx
087e   ac61de:	41 89 8d f8 00 00 00 	mov    %ecx,0xf8(%r13)
0885   ac61e5:	0f bf 44 42 04       	movswl 0x4(%rdx,%rax,2),%eax
088a   ac61ea:	41 89 85 18 01 00 00 	mov    %eax,0x118(%r13)
0891   ac61f1:	eb 05                	jmp    ac61f8 <adm1275_probe+0x898>
0893   ac61f3:	e8 00 00 00 00       	call   ac61f8 <adm1275_probe+0x898>	ac61f4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0898   ac61f8:	44 8b 64 24 0c       	mov    0xc(%rsp),%r12d
089d   ac61fd:	45 85 f6             	test   %r14d,%r14d
08a0   ac6200:	78 47                	js     ac6249 <adm1275_probe+0x8e9>
08a2   ac6202:	e8 00 00 00 00       	call   ac6207 <adm1275_probe+0x8a7>	ac6203: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
08a7   ac6207:	44 89 f0             	mov    %r14d,%eax
08aa   ac620a:	48 8d 04 40          	lea    (%rax,%rax,2),%rax
08ae   ac620e:	48 8b 5c 24 20       	mov    0x20(%rsp),%rbx
08b3   ac6213:	0f bf 0c 43          	movswl (%rbx,%rax,2),%ecx
08b7   ac6217:	69 c9 e8 03 00 00    	imul   $0x3e8,%ecx,%ecx
08bd   ac621d:	48 69 c9 d3 4d 62 10 	imul   $0x10624dd3,%rcx,%rcx
08c4   ac6224:	48 c1 e9 26          	shr    $0x26,%rcx
08c8   ac6228:	41 89 8d e0 00 00 00 	mov    %ecx,0xe0(%r13)
08cf   ac622f:	0f bf 4c 43 02       	movswl 0x2(%rbx,%rax,2),%ecx
08d4   ac6234:	41 89 8d 00 01 00 00 	mov    %ecx,0x100(%r13)
08db   ac623b:	0f bf 44 43 04       	movswl 0x4(%rbx,%rax,2),%eax
08e0   ac6240:	41 89 85 20 01 00 00 	mov    %eax,0x120(%r13)
08e7   ac6247:	eb 0a                	jmp    ac6253 <adm1275_probe+0x8f3>
08e9   ac6249:	e8 00 00 00 00       	call   ac624e <adm1275_probe+0x8ee>	ac624a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
08ee   ac624e:	48 8b 5c 24 20       	mov    0x20(%rsp),%rbx
08f3   ac6253:	44 8b 74 24 10       	mov    0x10(%rsp),%r14d
08f8   ac6258:	45 85 e4             	test   %r12d,%r12d
08fb   ac625b:	78 42                	js     ac629f <adm1275_probe+0x93f>
08fd   ac625d:	e8 00 00 00 00       	call   ac6262 <adm1275_probe+0x902>	ac625e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0902   ac6262:	44 89 e0             	mov    %r12d,%eax
0905   ac6265:	48 8d 04 40          	lea    (%rax,%rax,2),%rax
0909   ac6269:	0f bf 0c 43          	movswl (%rbx,%rax,2),%ecx
090d   ac626d:	69 c9 e8 03 00 00    	imul   $0x3e8,%ecx,%ecx
0913   ac6273:	48 69 c9 d3 4d 62 10 	imul   $0x10624dd3,%rcx,%rcx
091a   ac627a:	48 c1 e9 26          	shr    $0x26,%rcx
091e   ac627e:	41 89 8d e4 00 00 00 	mov    %ecx,0xe4(%r13)
0925   ac6285:	0f bf 4c 43 02       	movswl 0x2(%rbx,%rax,2),%ecx
092a   ac628a:	41 89 8d 04 01 00 00 	mov    %ecx,0x104(%r13)
0931   ac6291:	0f bf 44 43 04       	movswl 0x4(%rbx,%rax,2),%eax
0936   ac6296:	41 89 85 24 01 00 00 	mov    %eax,0x124(%r13)
093d   ac629d:	eb 05                	jmp    ac62a4 <adm1275_probe+0x944>
093f   ac629f:	e8 00 00 00 00       	call   ac62a4 <adm1275_probe+0x944>	ac62a0: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0944   ac62a4:	48 83 44 24 28 10    	addq   $0x10,0x28(%rsp)
094a   ac62aa:	45 84 f6             	test   %r14b,%r14b
094d   ac62ad:	74 33                	je     ac62e2 <adm1275_probe+0x982>
094f   ac62af:	e8 00 00 00 00       	call   ac62b4 <adm1275_probe+0x954>	ac62b0: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0954   ac62b4:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
0959   ac62b9:	48 8d 04 40          	lea    (%rax,%rax,2),%rax
095d   ac62bd:	0f bf 0c 43          	movswl (%rbx,%rax,2),%ecx
0961   ac62c1:	41 89 8d e8 00 00 00 	mov    %ecx,0xe8(%r13)
0968   ac62c8:	0f bf 4c 43 02       	movswl 0x2(%rbx,%rax,2),%ecx
096d   ac62cd:	41 89 8d 08 01 00 00 	mov    %ecx,0x108(%r13)
0974   ac62d4:	0f bf 44 43 04       	movswl 0x4(%rbx,%rax,2),%eax
0979   ac62d9:	41 89 85 28 01 00 00 	mov    %eax,0x128(%r13)
0980   ac62e0:	eb 05                	jmp    ac62e7 <adm1275_probe+0x987>
0982   ac62e2:	e8 00 00 00 00       	call   ac62e7 <adm1275_probe+0x987>	ac62e3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0987   ac62e7:	4c 89 ff             	mov    %r15,%rdi
098a   ac62ea:	48 8b 74 24 28       	mov    0x28(%rsp),%rsi
098f   ac62ef:	e8 00 00 00 00       	call   ac62f4 <adm1275_probe+0x994>	ac62f0: R_X86_64_PLT32	pmbus_do_probe-0x4
0994   ac62f4:	89 c3                	mov    %eax,%ebx
0996   ac62f6:	e9 24 f7 ff ff       	jmp    ac5a1f <adm1275_probe+0xbf>
099b   ac62fb:	e8 00 00 00 00       	call   ac6300 <adm1275_probe+0x9a0>	ac62fc: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
09a0   ac6300:	e9 15 f7 ff ff       	jmp    ac5a1a <adm1275_probe+0xba>
09a5   ac6305:	e8 00 00 00 00       	call   ac630a <adm1275_probe+0x9aa>	ac6306: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
09aa   ac630a:	e9 0b f7 ff ff       	jmp    ac5a1a <adm1275_probe+0xba>
09af   ac630f:	e8 00 00 00 00       	call   ac6314 <adm1275_probe+0x9b4>	ac6310: R_X86_64_PLT32	__stack_chk_fail-0x4
09b4   ac6314:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
09be   ac631e:	66 90                	xchg   %ax,%ax

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
