Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE265251;
	Mon,  6 Feb 2023 14:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675692737; x=1707228737;
  h=date:from:cc:subject:message-id:mime-version;
  bh=IlEsHB/K5OuZH6THW3duLpQIdFemfZDU2sCCZKuTfR4=;
  b=ODzKaZkEfmxqmpAgAjsFa+YrrZ1FOnLU5Hpz0JFlD/+dQzBh/Xm2l1m3
   ay8DOhPSlsVh5XzfM+oyoeT8GGl7sFoiyLfo4Kbp0aCMQie9Ys9qep1+5
   umpY/L3L1x1rkiRQC+8uaJ4E0nin1Nru47fjwt2Q7CPSyQhW7q/dpdABa
   Ts0nOLV1/8SQ2uA7hjATvzBBMRrguKujnx7GeN366Bdi5olJNjs9hvWB9
   KpGI3/GKEcpkEPx01YEvuPU4KWUcmg1OzOrvrtZCsy2tGy/Pyx5LqBAQF
   BReFXxFUNVZCMdpCQHAqtUstbsJ8nTxBpA+Blfkvqj22Osl/MbKMEjFvh
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="312866041"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="312866041"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2023 06:10:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="911938519"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="911938519"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 06 Feb 2023 06:10:00 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pP2Bz-0002a5-1P;
	Mon, 06 Feb 2023 14:09:59 +0000
Date: Mon, 6 Feb 2023 22:09:06 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: drivers/hwmon/pmbus/adm1275.o: warning: objtool:
 adm1275_probe+0x7f0: unreachable instruction
Message-ID: <202302062253.6saMHKKn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Peter Zijlstra <peterz@infradead.org>
CC: Borislav Petkov <bp@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d2d11f342b179f1894a901f143ec7c008caba43e
commit: f43b9876e857c739d407bc56df288b0ebe1a9164 x86/retbleed: Add fine grained Kconfig knobs
date:   7 months ago
config: x86_64-buildonly-randconfig-r004-20230206 (https://download.01.org/0day-ci/archive/20230206/202302062253.6saMHKKn-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f43b9876e857c739d407bc56df288b0ebe1a9164
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout f43b9876e857c739d407bc56df288b0ebe1a9164
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/hwmon/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/hwmon/pmbus/adm1275.o: warning: objtool: adm1275_probe+0x7f0: unreachable instruction


objdump-func vmlinux.o adm1275_probe:
0000 0000000000b230e0 <adm1275_probe>:
0000   b230e0:	e8 00 00 00 00       	call   b230e5 <adm1275_probe+0x5>	b230e1: R_X86_64_PLT32	__fentry__-0x4
0005   b230e5:	55                   	push   %rbp
0006   b230e6:	48 89 e5             	mov    %rsp,%rbp
0009   b230e9:	41 57                	push   %r15
000b   b230eb:	41 56                	push   %r14
000d   b230ed:	41 55                	push   %r13
000f   b230ef:	41 54                	push   %r12
0011   b230f1:	53                   	push   %rbx
0012   b230f2:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
0016   b230f6:	48 83 ec 70          	sub    $0x70,%rsp
001a   b230fa:	49 89 ff             	mov    %rdi,%r15
001d   b230fd:	65 48 8b 04 25 28 00 00 00 	mov    %gs:0x28,%rax
0026   b23106:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
002b   b2310b:	e8 00 00 00 00       	call   b23110 <adm1275_probe+0x30>	b2310c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0030   b23110:	c6 44 24 50 00       	movb   $0x0,0x50(%rsp)
0035   b23115:	48 c7 44 24 48 00 00 00 00 	movq   $0x0,0x48(%rsp)
003e   b2311e:	48 c7 44 24 40 00 00 00 00 	movq   $0x0,0x40(%rsp)
0047   b23127:	48 c7 44 24 38 00 00 00 00 	movq   $0x0,0x38(%rsp)
0050   b23130:	48 c7 44 24 30 00 00 00 00 	movq   $0x0,0x30(%rsp)
0059   b23139:	49 8b 7f 18          	mov    0x18(%r15),%rdi
005d   b2313d:	48 8b 47 10          	mov    0x10(%rdi),%rax
0061   b23141:	ff 50 20             	call   *0x20(%rax)
0064   b23144:	f7 d0                	not    %eax
0066   b23146:	a9 00 00 08 03       	test   $0x3080000,%eax
006b   b2314b:	75 3a                	jne    b23187 <adm1275_probe+0xa7>
006d   b2314d:	48 8d 54 24 30       	lea    0x30(%rsp),%rdx
0072   b23152:	4c 89 ff             	mov    %r15,%rdi
0075   b23155:	be 99 00 00 00       	mov    $0x99,%esi
007a   b2315a:	e8 00 00 00 00       	call   b2315f <adm1275_probe+0x7f>	b2315b: R_X86_64_PLT32	i2c_smbus_read_block_data-0x4
007f   b2315f:	89 c3                	mov    %eax,%ebx
0081   b23161:	85 c0                	test   %eax,%eax
0083   b23163:	78 29                	js     b2318e <adm1275_probe+0xae>
0085   b23165:	83 fb 03             	cmp    $0x3,%ebx
0088   b23168:	75 2b                	jne    b23195 <adm1275_probe+0xb5>
008a   b2316a:	b8 41 44 00 00       	mov    $0x4441,%eax
008f   b2316f:	33 44 24 30          	xor    0x30(%rsp),%eax
0093   b23173:	0f b6 4c 24 32       	movzbl 0x32(%rsp),%ecx
0098   b23178:	83 f1 49             	xor    $0x49,%ecx
009b   b2317b:	66 09 c1             	or     %ax,%cx
009e   b2317e:	74 44                	je     b231c4 <adm1275_probe+0xe4>
00a0   b23180:	e8 00 00 00 00       	call   b23185 <adm1275_probe+0xa5>	b23181: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
00a5   b23185:	eb 13                	jmp    b2319a <adm1275_probe+0xba>
00a7   b23187:	e8 00 00 00 00       	call   b2318c <adm1275_probe+0xac>	b23188: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
00ac   b2318c:	eb 0c                	jmp    b2319a <adm1275_probe+0xba>
00ae   b2318e:	e8 00 00 00 00       	call   b23193 <adm1275_probe+0xb3>	b2318f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
00b3   b23193:	eb 0a                	jmp    b2319f <adm1275_probe+0xbf>
00b5   b23195:	e8 00 00 00 00       	call   b2319a <adm1275_probe+0xba>	b23196: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
00ba   b2319a:	bb ed ff ff ff       	mov    $0xffffffed,%ebx
00bf   b2319f:	65 48 8b 04 25 28 00 00 00 	mov    %gs:0x28,%rax
00c8   b231a8:	48 3b 44 24 60       	cmp    0x60(%rsp),%rax
00cd   b231ad:	0f 85 76 0a 00 00    	jne    b23c29 <adm1275_probe+0xb49>
00d3   b231b3:	89 d8                	mov    %ebx,%eax
00d5   b231b5:	48 8d 65 d8          	lea    -0x28(%rbp),%rsp
00d9   b231b9:	5b                   	pop    %rbx
00da   b231ba:	41 5c                	pop    %r12
00dc   b231bc:	41 5d                	pop    %r13
00de   b231be:	41 5e                	pop    %r14
00e0   b231c0:	41 5f                	pop    %r15
00e2   b231c2:	5d                   	pop    %rbp
00e3   b231c3:	c3                   	ret
00e4   b231c4:	48 8d 54 24 30       	lea    0x30(%rsp),%rdx
00e9   b231c9:	4c 89 ff             	mov    %r15,%rdi
00ec   b231cc:	be 9a 00 00 00       	mov    $0x9a,%esi
00f1   b231d1:	e8 00 00 00 00       	call   b231d6 <adm1275_probe+0xf6>	b231d2: R_X86_64_PLT32	i2c_smbus_read_block_data-0x4
00f6   b231d6:	85 c0                	test   %eax,%eax
00f8   b231d8:	0f 88 fa 01 00 00    	js     b233d8 <adm1275_probe+0x2f8>
00fe   b231de:	be 14 00 00 00       	mov    $0x14,%esi
0103   b231e3:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	b231e6: R_X86_64_32S	.rodata+0x620bd0
010a   b231ea:	e8 00 00 00 00       	call   b231ef <adm1275_probe+0x10f>	b231eb: R_X86_64_PLT32	strnlen-0x4
010f   b231ef:	48 83 f8 15          	cmp    $0x15,%rax
0113   b231f3:	0f 83 42 09 00 00    	jae    b23b3b <adm1275_probe+0xa5b>
0119   b231f9:	48 83 f8 14          	cmp    $0x14,%rax
011d   b231fd:	0f 84 49 09 00 00    	je     b23b4c <adm1275_probe+0xa6c>
0123   b23203:	49 c7 c6 00 00 00 00 	mov    $0x0,%r14	b23206: R_X86_64_32S	.rodata+0x620bd0
012a   b2320a:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
012f   b2320f:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	b23212: R_X86_64_32S	.rodata+0x620bd0
0136   b23216:	48 89 c2             	mov    %rax,%rdx
0139   b23219:	e8 00 00 00 00       	call   b2321e <adm1275_probe+0x13e>	b2321a: R_X86_64_PLT32	strncasecmp-0x4
013e   b2321e:	85 c0                	test   %eax,%eax
0140   b23220:	0f 84 be 01 00 00    	je     b233e4 <adm1275_probe+0x304>
0146   b23226:	be 14 00 00 00       	mov    $0x14,%esi
014b   b2322b:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	b2322e: R_X86_64_32S	.rodata+0x620bf0
0152   b23232:	e8 00 00 00 00       	call   b23237 <adm1275_probe+0x157>	b23233: R_X86_64_PLT32	strnlen-0x4
0157   b23237:	48 83 f8 15          	cmp    $0x15,%rax
015b   b2323b:	0f 83 1c 09 00 00    	jae    b23b5d <adm1275_probe+0xa7d>
0161   b23241:	48 83 f8 14          	cmp    $0x14,%rax
0165   b23245:	0f 84 23 09 00 00    	je     b23b6e <adm1275_probe+0xa8e>
016b   b2324b:	49 c7 c6 00 00 00 00 	mov    $0x0,%r14	b2324e: R_X86_64_32S	.rodata+0x620bf0
0172   b23252:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
0177   b23257:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	b2325a: R_X86_64_32S	.rodata+0x620bf0
017e   b2325e:	48 89 c2             	mov    %rax,%rdx
0181   b23261:	e8 00 00 00 00       	call   b23266 <adm1275_probe+0x186>	b23262: R_X86_64_PLT32	strncasecmp-0x4
0186   b23266:	85 c0                	test   %eax,%eax
0188   b23268:	0f 84 7d 01 00 00    	je     b233eb <adm1275_probe+0x30b>
018e   b2326e:	be 14 00 00 00       	mov    $0x14,%esi
0193   b23273:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	b23276: R_X86_64_32S	.rodata+0x620c10
019a   b2327a:	e8 00 00 00 00       	call   b2327f <adm1275_probe+0x19f>	b2327b: R_X86_64_PLT32	strnlen-0x4
019f   b2327f:	48 83 f8 15          	cmp    $0x15,%rax
01a3   b23283:	0f 83 f6 08 00 00    	jae    b23b7f <adm1275_probe+0xa9f>
01a9   b23289:	48 83 f8 14          	cmp    $0x14,%rax
01ad   b2328d:	0f 84 fd 08 00 00    	je     b23b90 <adm1275_probe+0xab0>
01b3   b23293:	49 c7 c6 00 00 00 00 	mov    $0x0,%r14	b23296: R_X86_64_32S	.rodata+0x620c10
01ba   b2329a:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
01bf   b2329f:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	b232a2: R_X86_64_32S	.rodata+0x620c10
01c6   b232a6:	48 89 c2             	mov    %rax,%rdx
01c9   b232a9:	e8 00 00 00 00       	call   b232ae <adm1275_probe+0x1ce>	b232aa: R_X86_64_PLT32	strncasecmp-0x4
01ce   b232ae:	85 c0                	test   %eax,%eax
01d0   b232b0:	0f 84 3c 01 00 00    	je     b233f2 <adm1275_probe+0x312>
01d6   b232b6:	be 14 00 00 00       	mov    $0x14,%esi
01db   b232bb:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	b232be: R_X86_64_32S	.rodata+0x620c30
01e2   b232c2:	e8 00 00 00 00       	call   b232c7 <adm1275_probe+0x1e7>	b232c3: R_X86_64_PLT32	strnlen-0x4
01e7   b232c7:	48 83 f8 15          	cmp    $0x15,%rax
01eb   b232cb:	0f 83 d0 08 00 00    	jae    b23ba1 <adm1275_probe+0xac1>
01f1   b232d1:	48 83 f8 14          	cmp    $0x14,%rax
01f5   b232d5:	0f 84 d7 08 00 00    	je     b23bb2 <adm1275_probe+0xad2>
01fb   b232db:	49 c7 c6 00 00 00 00 	mov    $0x0,%r14	b232de: R_X86_64_32S	.rodata+0x620c30
0202   b232e2:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
0207   b232e7:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	b232ea: R_X86_64_32S	.rodata+0x620c30
020e   b232ee:	48 89 c2             	mov    %rax,%rdx
0211   b232f1:	e8 00 00 00 00       	call   b232f6 <adm1275_probe+0x216>	b232f2: R_X86_64_PLT32	strncasecmp-0x4
0216   b232f6:	85 c0                	test   %eax,%eax
0218   b232f8:	0f 84 fb 00 00 00    	je     b233f9 <adm1275_probe+0x319>
021e   b232fe:	be 14 00 00 00       	mov    $0x14,%esi
0223   b23303:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	b23306: R_X86_64_32S	.rodata+0x620c50
022a   b2330a:	e8 00 00 00 00       	call   b2330f <adm1275_probe+0x22f>	b2330b: R_X86_64_PLT32	strnlen-0x4
022f   b2330f:	48 83 f8 15          	cmp    $0x15,%rax
0233   b23313:	0f 83 aa 08 00 00    	jae    b23bc3 <adm1275_probe+0xae3>
0239   b23319:	48 83 f8 14          	cmp    $0x14,%rax
023d   b2331d:	0f 84 b1 08 00 00    	je     b23bd4 <adm1275_probe+0xaf4>
0243   b23323:	49 c7 c6 00 00 00 00 	mov    $0x0,%r14	b23326: R_X86_64_32S	.rodata+0x620c50
024a   b2332a:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
024f   b2332f:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	b23332: R_X86_64_32S	.rodata+0x620c50
0256   b23336:	48 89 c2             	mov    %rax,%rdx
0259   b23339:	e8 00 00 00 00       	call   b2333e <adm1275_probe+0x25e>	b2333a: R_X86_64_PLT32	strncasecmp-0x4
025e   b2333e:	85 c0                	test   %eax,%eax
0260   b23340:	0f 84 ba 00 00 00    	je     b23400 <adm1275_probe+0x320>
0266   b23346:	be 14 00 00 00       	mov    $0x14,%esi
026b   b2334b:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	b2334e: R_X86_64_32S	.rodata+0x620c70
0272   b23352:	e8 00 00 00 00       	call   b23357 <adm1275_probe+0x277>	b23353: R_X86_64_PLT32	strnlen-0x4
0277   b23357:	48 83 f8 15          	cmp    $0x15,%rax
027b   b2335b:	0f 83 84 08 00 00    	jae    b23be5 <adm1275_probe+0xb05>
0281   b23361:	48 83 f8 14          	cmp    $0x14,%rax
0285   b23365:	0f 84 8b 08 00 00    	je     b23bf6 <adm1275_probe+0xb16>
028b   b2336b:	49 c7 c6 00 00 00 00 	mov    $0x0,%r14	b2336e: R_X86_64_32S	.rodata+0x620c70
0292   b23372:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
0297   b23377:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	b2337a: R_X86_64_32S	.rodata+0x620c70
029e   b2337e:	48 89 c2             	mov    %rax,%rdx
02a1   b23381:	e8 00 00 00 00       	call   b23386 <adm1275_probe+0x2a6>	b23382: R_X86_64_PLT32	strncasecmp-0x4
02a6   b23386:	85 c0                	test   %eax,%eax
02a8   b23388:	74 7d                	je     b23407 <adm1275_probe+0x327>
02aa   b2338a:	be 14 00 00 00       	mov    $0x14,%esi
02af   b2338f:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	b23392: R_X86_64_32S	.rodata+0x620c90
02b6   b23396:	e8 00 00 00 00       	call   b2339b <adm1275_probe+0x2bb>	b23397: R_X86_64_PLT32	strnlen-0x4
02bb   b2339b:	48 83 f8 15          	cmp    $0x15,%rax
02bf   b2339f:	0f 83 62 08 00 00    	jae    b23c07 <adm1275_probe+0xb27>
02c5   b233a5:	48 83 f8 14          	cmp    $0x14,%rax
02c9   b233a9:	0f 84 69 08 00 00    	je     b23c18 <adm1275_probe+0xb38>
02cf   b233af:	49 c7 c6 00 00 00 00 	mov    $0x0,%r14	b233b2: R_X86_64_32S	.rodata+0x620c90
02d6   b233b6:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
02db   b233bb:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	b233be: R_X86_64_32S	.rodata+0x620c90
02e2   b233c2:	48 89 c2             	mov    %rax,%rdx
02e5   b233c5:	e8 00 00 00 00       	call   b233ca <adm1275_probe+0x2ea>	b233c6: R_X86_64_PLT32	strncasecmp-0x4
02ea   b233ca:	85 c0                	test   %eax,%eax
02ec   b233cc:	74 40                	je     b2340e <adm1275_probe+0x32e>
02ee   b233ce:	e8 00 00 00 00       	call   b233d3 <adm1275_probe+0x2f3>	b233cf: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
02f3   b233d3:	e9 c2 fd ff ff       	jmp    b2319a <adm1275_probe+0xba>
02f8   b233d8:	89 c3                	mov    %eax,%ebx
02fa   b233da:	e8 00 00 00 00       	call   b233df <adm1275_probe+0x2ff>	b233db: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
02ff   b233df:	e9 bb fd ff ff       	jmp    b2319f <adm1275_probe+0xbf>
0304   b233e4:	e8 00 00 00 00       	call   b233e9 <adm1275_probe+0x309>	b233e5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0309   b233e9:	eb 28                	jmp    b23413 <adm1275_probe+0x333>
030b   b233eb:	e8 00 00 00 00       	call   b233f0 <adm1275_probe+0x310>	b233ec: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0310   b233f0:	eb 21                	jmp    b23413 <adm1275_probe+0x333>
0312   b233f2:	e8 00 00 00 00       	call   b233f7 <adm1275_probe+0x317>	b233f3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0317   b233f7:	eb 1a                	jmp    b23413 <adm1275_probe+0x333>
0319   b233f9:	e8 00 00 00 00       	call   b233fe <adm1275_probe+0x31e>	b233fa: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
031e   b233fe:	eb 13                	jmp    b23413 <adm1275_probe+0x333>
0320   b23400:	e8 00 00 00 00       	call   b23405 <adm1275_probe+0x325>	b23401: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0325   b23405:	eb 0c                	jmp    b23413 <adm1275_probe+0x333>
0327   b23407:	e8 00 00 00 00       	call   b2340c <adm1275_probe+0x32c>	b23408: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
032c   b2340c:	eb 05                	jmp    b23413 <adm1275_probe+0x333>
032e   b2340e:	e8 00 00 00 00       	call   b23413 <adm1275_probe+0x333>	b2340f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0333   b23413:	49 8b 5e 18          	mov    0x18(%r14),%rbx
0337   b23417:	48 8d 43 ff          	lea    -0x1(%rbx),%rax
033b   b2341b:	48 83 f8 06          	cmp    $0x6,%rax
033f   b2341f:	73 16                	jae    b23437 <adm1275_probe+0x357>
0341   b23421:	e8 00 00 00 00       	call   b23426 <adm1275_probe+0x346>	b23422: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0346   b23426:	48 c7 c0 f8 ff ff ff 	mov    $0xfffffffffffffff8,%rax
034d   b2342d:	4c 8b a4 d8 00 00 00 00 	mov    0x0(%rax,%rbx,8),%r12	b23431: R_X86_64_32S	.rodata+0x620e08
0355   b23435:	eb 0c                	jmp    b23443 <adm1275_probe+0x363>
0357   b23437:	e8 00 00 00 00       	call   b2343c <adm1275_probe+0x35c>	b23438: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
035c   b2343c:	49 c7 c4 00 00 00 00 	mov    $0x0,%r12	b2343f: R_X86_64_32S	i2c_smbus_read_byte_data
0363   b23443:	4c 89 ff             	mov    %r15,%rdi
0366   b23446:	be d4 00 00 00       	mov    $0xd4,%esi
036b   b2344b:	41 ff d4             	call   *%r12
036e   b2344e:	89 c3                	mov    %eax,%ebx
0370   b23450:	85 c0                	test   %eax,%eax
0372   b23452:	0f 88 b5 00 00 00    	js     b2350d <adm1275_probe+0x42d>
0378   b23458:	4c 89 ff             	mov    %r15,%rdi
037b   b2345b:	be d8 00 00 00       	mov    $0xd8,%esi
0380   b23460:	41 ff d4             	call   *%r12
0383   b23463:	41 89 c4             	mov    %eax,%r12d
0386   b23466:	85 c0                	test   %eax,%eax
0388   b23468:	0f 88 a9 00 00 00    	js     b23517 <adm1275_probe+0x437>
038e   b2346e:	49 8d 7f 20          	lea    0x20(%r15),%rdi
0392   b23472:	be 28 02 00 00       	mov    $0x228,%esi
0397   b23477:	ba c0 0d 00 00       	mov    $0xdc0,%edx
039c   b2347c:	e8 00 00 00 00       	call   b23481 <adm1275_probe+0x3a1>	b2347d: R_X86_64_PLT32	devm_kmalloc-0x4
03a1   b23481:	48 85 c0             	test   %rax,%rax
03a4   b23484:	0f 84 9a 00 00 00    	je     b23524 <adm1275_probe+0x444>
03aa   b2348a:	41 8b 56 18          	mov    0x18(%r14),%edx
03ae   b2348e:	89 10                	mov    %edx,(%rax)
03b0   b23490:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%rax)
03b7   b23497:	48 b9 01 00 00 00 01 00 00 00 	movabs $0x100000001,%rcx
03c1   b234a1:	48 89 48 34          	mov    %rcx,0x34(%rax)
03c5   b234a5:	48 89 48 40          	mov    %rcx,0x40(%rax)
03c9   b234a9:	c7 40 48 01 00 00 00 	movl   $0x1,0x48(%rax)
03d0   b234b0:	c7 80 34 01 00 00 10 20 40 00 	movl   $0x402010,0x134(%rax)
03da   b234ba:	48 c7 80 e8 01 00 00 00 00 00 00 	movq   $0x0,0x1e8(%rax)	b234c1: R_X86_64_32S	.text+0xb23c30
03e5   b234c5:	48 c7 80 e0 01 00 00 00 00 00 00 	movq   $0x0,0x1e0(%rax)	b234cc: R_X86_64_32S	.text+0xb23fb0
03f0   b234d0:	48 c7 80 f8 01 00 00 00 00 00 00 	movq   $0x0,0x1f8(%rax)	b234d7: R_X86_64_32S	.text+0xb24130
03fb   b234db:	48 83 fa 06          	cmp    $0x6,%rdx
03ff   b234df:	0f 87 b2 00 00 00    	ja     b23597 <adm1275_probe+0x4b7>
0405   b234e5:	49 89 c5             	mov    %rax,%r13
0408   b234e8:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
040d   b234ed:	ff 24 d5 00 00 00 00 	jmp    *0x0(,%rdx,8)	b234f0: R_X86_64_32S	.rodata+0x620700
0414   b234f4:	41 f6 c4 10          	test   $0x10,%r12b
0418   b234f8:	0f 85 32 02 00 00    	jne    b23730 <adm1275_probe+0x650>
041e   b234fe:	e8 00 00 00 00       	call   b23503 <adm1275_probe+0x423>	b234ff: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0423   b23503:	41 c6 45 05 01       	movb   $0x1,0x5(%r13)
0428   b23508:	e9 2d 02 00 00       	jmp    b2373a <adm1275_probe+0x65a>
042d   b2350d:	e8 00 00 00 00       	call   b23512 <adm1275_probe+0x432>	b2350e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0432   b23512:	e9 88 fc ff ff       	jmp    b2319f <adm1275_probe+0xbf>
0437   b23517:	e8 00 00 00 00       	call   b2351c <adm1275_probe+0x43c>	b23518: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
043c   b2351c:	44 89 e3             	mov    %r12d,%ebx
043f   b2351f:	e9 7b fc ff ff       	jmp    b2319f <adm1275_probe+0xbf>
0444   b23524:	e8 00 00 00 00       	call   b23529 <adm1275_probe+0x449>	b23525: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0449   b23529:	bb f4 ff ff ff       	mov    $0xfffffff4,%ebx
044e   b2352e:	e9 6c fc ff ff       	jmp    b2319f <adm1275_probe+0xbf>
0453   b23533:	41 c6 45 06 01       	movb   $0x1,0x6(%r13)
0458   b23538:	66 41 c7 45 0b 01 01 	movw   $0x101,0xb(%r13)
045f   b2353f:	41 c6 45 0d 01       	movb   $0x1,0xd(%r13)
0464   b23544:	41 c7 85 34 01 00 00 34 f2 40 00 	movl   $0x40f234,0x134(%r13)
046f   b2354f:	89 d8                	mov    %ebx,%eax
0471   b23551:	f7 d0                	not    %eax
0473   b23553:	a8 0a                	test   $0xa,%al
0475   b23555:	0f 85 c7 00 00 00    	jne    b23622 <adm1275_probe+0x542>
047b   b2355b:	e8 00 00 00 00       	call   b23560 <adm1275_probe+0x480>	b2355c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0480   b23560:	e9 dd 00 00 00       	jmp    b23642 <adm1275_probe+0x562>
0485   b23565:	41 f6 c4 10          	test   $0x10,%r12b
0489   b23569:	0f 85 12 01 00 00    	jne    b23681 <adm1275_probe+0x5a1>
048f   b2356f:	e8 00 00 00 00       	call   b23574 <adm1275_probe+0x494>	b23570: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0494   b23574:	41 c6 45 05 01       	movb   $0x1,0x5(%r13)
0499   b23579:	e9 0d 01 00 00       	jmp    b2368b <adm1275_probe+0x5ab>
049e   b2357e:	41 f6 c4 10          	test   $0x10,%r12b
04a2   b23582:	0f 85 41 01 00 00    	jne    b236c9 <adm1275_probe+0x5e9>
04a8   b23588:	e8 00 00 00 00       	call   b2358d <adm1275_probe+0x4ad>	b23589: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
04ad   b2358d:	41 c6 45 05 01       	movb   $0x1,0x5(%r13)
04b2   b23592:	e9 3c 01 00 00       	jmp    b236d3 <adm1275_probe+0x5f3>
04b7   b23597:	e8 00 00 00 00       	call   b2359c <adm1275_probe+0x4bc>	b23598: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
04bc   b2359c:	e9 f9 fb ff ff       	jmp    b2319a <adm1275_probe+0xba>
04c1   b235a1:	41 c6 45 06 01       	movb   $0x1,0x6(%r13)
04c6   b235a6:	66 41 c7 45 0b 01 01 	movw   $0x101,0xb(%r13)
04cd   b235ad:	41 c6 45 0d 01       	movb   $0x1,0xd(%r13)
04d2   b235b2:	41 89 de             	mov    %ebx,%r14d
04d5   b235b5:	44 89 f0             	mov    %r14d,%eax
04d8   b235b8:	83 e0 21             	and    $0x21,%eax
04db   b235bb:	ff 24 c5 00 00 00 00 	jmp    *0x0(,%rax,8)	b235be: R_X86_64_32S	.rodata+0x620738
04e2   b235c2:	e8 00 00 00 00       	call   b235c7 <adm1275_probe+0x4e7>	b235c3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
04e7   b235c7:	c7 44 24 0c 04 00 00 00 	movl   $0x4,0xc(%rsp)
04ef   b235cf:	e9 27 03 00 00       	jmp    b238fb <adm1275_probe+0x81b>
04f4   b235d4:	e8 00 00 00 00       	call   b235d9 <adm1275_probe+0x4f9>	b235d5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
04f9   b235d9:	eb 05                	jmp    b235e0 <adm1275_probe+0x500>
04fb   b235db:	e8 00 00 00 00       	call   b235e0 <adm1275_probe+0x500>	b235dc: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0500   b235e0:	41 c6 45 0d 01       	movb   $0x1,0xd(%r13)
0505   b235e5:	41 89 de             	mov    %ebx,%r14d
0508   b235e8:	44 89 f0             	mov    %r14d,%eax
050b   b235eb:	83 e0 0c             	and    $0xc,%eax
050e   b235ee:	41 c7 45 08 01 01 01 01 	movl   $0x1010101,0x8(%r13)
0516   b235f6:	48 83 f8 04          	cmp    $0x4,%rax
051a   b235fa:	0f 84 82 01 00 00    	je     b23782 <adm1275_probe+0x6a2>
0520   b23600:	83 f8 08             	cmp    $0x8,%eax
0523   b23603:	0f 84 6c 01 00 00    	je     b23775 <adm1275_probe+0x695>
0529   b23609:	83 f8 0c             	cmp    $0xc,%eax
052c   b2360c:	0f 85 7c 01 00 00    	jne    b2378e <adm1275_probe+0x6ae>
0532   b23612:	e8 00 00 00 00       	call   b23617 <adm1275_probe+0x537>	b23613: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0537   b23617:	41 bc 02 00 00 00    	mov    $0x2,%r12d
053d   b2361d:	e9 68 01 00 00       	jmp    b2378a <adm1275_probe+0x6aa>
0542   b23622:	83 cb 0a             	or     $0xa,%ebx
0545   b23625:	0f b7 d3             	movzwl %bx,%edx
0548   b23628:	4c 89 ff             	mov    %r15,%rdi
054b   b2362b:	be d4 00 00 00       	mov    $0xd4,%esi
0550   b23630:	e8 00 00 00 00       	call   b23635 <adm1275_probe+0x555>	b23631: R_X86_64_PLT32	i2c_smbus_write_word_data-0x4
0555   b23635:	85 c0                	test   %eax,%eax
0557   b23637:	0f 88 ea 04 00 00    	js     b23b27 <adm1275_probe+0xa47>
055d   b2363d:	e8 00 00 00 00       	call   b23642 <adm1275_probe+0x562>	b2363e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0562   b23642:	f6 c3 04             	test   $0x4,%bl
0565   b23645:	0f 85 f4 01 00 00    	jne    b2383f <adm1275_probe+0x75f>
056b   b2364b:	e8 00 00 00 00       	call   b23650 <adm1275_probe+0x570>	b2364c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0570   b23650:	49 c7 c6 00 00 00 00 	mov    $0x0,%r14	b23653: R_X86_64_32S	.rodata+0x620d70
0577   b23657:	31 db                	xor    %ebx,%ebx
0579   b23659:	c7 44 24 10 01 00 00 00 	movl   $0x1,0x10(%rsp)
0581   b23661:	c7 44 24 0c 02 00 00 00 	movl   $0x2,0xc(%rsp)
0589   b23669:	b0 01                	mov    $0x1,%al
058b   b2366b:	89 44 24 14          	mov    %eax,0x14(%rsp)
058f   b2366f:	b8 03 00 00 00       	mov    $0x3,%eax
0594   b23674:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
0599   b23679:	45 31 e4             	xor    %r12d,%r12d
059c   b2367c:	e9 31 03 00 00       	jmp    b239b2 <adm1275_probe+0x8d2>
05a1   b23681:	e8 00 00 00 00       	call   b23686 <adm1275_probe+0x5a6>	b23682: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
05a6   b23686:	41 c6 45 04 01       	movb   $0x1,0x4(%r13)
05ab   b2368b:	45 31 e4             	xor    %r12d,%r12d
05ae   b2368e:	f6 c3 20             	test   $0x20,%bl
05b1   b23691:	41 0f 94 c4          	sete   %r12b
05b5   b23695:	f6 c3 40             	test   $0x40,%bl
05b8   b23698:	b9 11 60 40 00       	mov    $0x406011,%ecx
05bd   b2369d:	b8 14 30 40 00       	mov    $0x403014,%eax
05c2   b236a2:	0f 44 c1             	cmove  %ecx,%eax
05c5   b236a5:	41 c6 45 06 01       	movb   $0x1,0x6(%r13)
05ca   b236aa:	c7 44 24 0c ff ff ff ff 	movl   $0xffffffff,0xc(%rsp)
05d2   b236b2:	c7 44 24 10 02 00 00 00 	movl   $0x2,0x10(%rsp)
05da   b236ba:	49 c7 c6 00 00 00 00 	mov    $0x0,%r14	b236bd: R_X86_64_32S	.rodata+0x620d30
05e1   b236c1:	44 89 e3             	mov    %r12d,%ebx
05e4   b236c4:	e9 2f 01 00 00       	jmp    b237f8 <adm1275_probe+0x718>
05e9   b236c9:	e8 00 00 00 00       	call   b236ce <adm1275_probe+0x5ee>	b236ca: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
05ee   b236ce:	41 c6 45 04 01       	movb   $0x1,0x4(%r13)
05f3   b236d3:	41 c6 45 06 01       	movb   $0x1,0x6(%r13)
05f8   b236d8:	41 c6 45 0b 01       	movb   $0x1,0xb(%r13)
05fd   b236dd:	89 d8                	mov    %ebx,%eax
05ff   b236df:	89 c1                	mov    %eax,%ecx
0601   b236e1:	83 e1 20             	and    $0x20,%ecx
0604   b236e4:	49 89 cc             	mov    %rcx,%r12
0607   b236e7:	49 c1 ec 05          	shr    $0x5,%r12
060b   b236eb:	41 83 f4 01          	xor    $0x1,%r12d
060f   b236ef:	48 83 f9 01          	cmp    $0x1,%rcx
0613   b236f3:	b9 03 00 00 00       	mov    $0x3,%ecx
0618   b236f8:	83 d1 00             	adc    $0x0,%ecx
061b   b236fb:	89 4c 24 0c          	mov    %ecx,0xc(%rsp)
061f   b236ff:	41 c7 85 34 01 00 00 31 60 40 00 	movl   $0x406031,0x134(%r13)
062a   b2370a:	a8 40                	test   $0x40,%al
062c   b2370c:	b9 31 60 40 00       	mov    $0x406031,%ecx
0631   b23711:	b8 35 70 40 00       	mov    $0x407035,%eax
0636   b23716:	0f 44 c1             	cmove  %ecx,%eax
0639   b23719:	c7 44 24 10 02 00 00 00 	movl   $0x2,0x10(%rsp)
0641   b23721:	49 c7 c6 00 00 00 00 	mov    $0x0,%r14	b23724: R_X86_64_32S	.rodata+0x620d50
0648   b23728:	44 89 e3             	mov    %r12d,%ebx
064b   b2372b:	e9 c8 00 00 00       	jmp    b237f8 <adm1275_probe+0x718>
0650   b23730:	e8 00 00 00 00       	call   b23735 <adm1275_probe+0x655>	b23731: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0655   b23735:	41 c6 45 04 01       	movb   $0x1,0x4(%r13)
065a   b2373a:	41 c6 45 0b 01       	movb   $0x1,0xb(%r13)
065f   b2373f:	41 c6 45 07 01       	movb   $0x1,0x7(%r13)
0664   b23744:	89 db                	mov    %ebx,%ebx
0666   b23746:	89 d8                	mov    %ebx,%eax
0668   b23748:	83 e0 18             	and    $0x18,%eax
066b   b2374b:	48 83 f8 10          	cmp    $0x10,%rax
066f   b2374f:	0f 84 17 01 00 00    	je     b2386c <adm1275_probe+0x78c>
0675   b23755:	83 f8 08             	cmp    $0x8,%eax
0678   b23758:	0f 85 22 01 00 00    	jne    b23880 <adm1275_probe+0x7a0>
067e   b2375e:	e8 00 00 00 00       	call   b23763 <adm1275_probe+0x683>	b2375f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0683   b23763:	c7 44 24 0c 03 00 00 00 	movl   $0x3,0xc(%rsp)
068b   b2376b:	b8 01 00 00 00       	mov    $0x1,%eax
0690   b23770:	e9 1d 01 00 00       	jmp    b23892 <adm1275_probe+0x7b2>
0695   b23775:	e8 00 00 00 00       	call   b2377a <adm1275_probe+0x69a>	b23776: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
069a   b2377a:	41 bc 01 00 00 00    	mov    $0x1,%r12d
06a0   b23780:	eb 08                	jmp    b2378a <adm1275_probe+0x6aa>
06a2   b23782:	e8 00 00 00 00       	call   b23787 <adm1275_probe+0x6a7>	b23783: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
06a7   b23787:	45 31 e4             	xor    %r12d,%r12d
06aa   b2378a:	b0 01                	mov    $0x1,%al
06ac   b2378c:	eb 0d                	jmp    b2379b <adm1275_probe+0x6bb>
06ae   b2378e:	e8 00 00 00 00       	call   b23793 <adm1275_probe+0x6b3>	b2378f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
06b3   b23793:	41 bc ff ff ff ff    	mov    $0xffffffff,%r12d
06b9   b23799:	31 c0                	xor    %eax,%eax
06bb   b2379b:	c1 eb 06             	shr    $0x6,%ebx
06be   b2379e:	83 e3 03             	and    $0x3,%ebx
06c1   b237a1:	89 d9                	mov    %ebx,%ecx
06c3   b237a3:	83 c1 03             	add    $0x3,%ecx
06c6   b237a6:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
06ca   b237aa:	42 8d 0c a3          	lea    (%rbx,%r12,4),%ecx
06ce   b237ae:	83 c1 07             	add    $0x7,%ecx
06d1   b237b1:	84 c0                	test   %al,%al
06d3   b237b3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
06d8   b237b8:	0f 45 c1             	cmovne %ecx,%eax
06db   b237bb:	89 44 24 0c          	mov    %eax,0xc(%rsp)
06df   b237bf:	41 f6 c6 02          	test   $0x2,%r14b
06e3   b237c3:	75 15                	jne    b237da <adm1275_probe+0x6fa>
06e5   b237c5:	e8 00 00 00 00       	call   b237ca <adm1275_probe+0x6ea>	b237c6: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
06ea   b237ca:	31 db                	xor    %ebx,%ebx
06ec   b237cc:	49 c7 c6 00 00 00 00 	mov    $0x0,%r14	b237cf: R_X86_64_32S	.rodata+0x620d90
06f3   b237d3:	b8 31 60 40 00       	mov    $0x406031,%eax
06f8   b237d8:	eb 1e                	jmp    b237f8 <adm1275_probe+0x718>
06fa   b237da:	e8 00 00 00 00       	call   b237df <adm1275_probe+0x6ff>	b237db: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
06ff   b237df:	41 c7 85 34 01 00 00 14 30 40 00 	movl   $0x403014,0x134(%r13)
070a   b237ea:	31 db                	xor    %ebx,%ebx
070c   b237ec:	49 c7 c6 00 00 00 00 	mov    $0x0,%r14	b237ef: R_X86_64_32S	.rodata+0x620d90
0713   b237f3:	b8 35 70 40 00       	mov    $0x407035,%eax
0718   b237f8:	41 89 85 34 01 00 00 	mov    %eax,0x134(%r13)
071f   b237ff:	45 85 e4             	test   %r12d,%r12d
0722   b23802:	78 1b                	js     b2381f <adm1275_probe+0x73f>
0724   b23804:	e8 00 00 00 00       	call   b23809 <adm1275_probe+0x729>	b23805: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0729   b23809:	48 c7 44 24 18 ff ff ff ff 	movq   $0xffffffffffffffff,0x18(%rsp)
0732   b23812:	c7 44 24 14 00 00 00 00 	movl   $0x0,0x14(%rsp)
073a   b2381a:	e9 93 01 00 00       	jmp    b239b2 <adm1275_probe+0x8d2>
073f   b2381f:	4c 89 74 24 20       	mov    %r14,0x20(%rsp)
0744   b23824:	e8 00 00 00 00       	call   b23829 <adm1275_probe+0x749>	b23825: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0749   b23829:	48 c7 44 24 18 ff ff ff ff 	movq   $0xffffffffffffffff,0x18(%rsp)
0752   b23832:	c7 44 24 14 00 00 00 00 	movl   $0x0,0x14(%rsp)
075a   b2383a:	e9 a5 01 00 00       	jmp    b239e4 <adm1275_probe+0x904>
075f   b2383f:	e8 00 00 00 00       	call   b23844 <adm1275_probe+0x764>	b23840: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0764   b23844:	49 c7 c6 00 00 00 00 	mov    $0x0,%r14	b23847: R_X86_64_32S	.rodata+0x620d70
076b   b2384b:	31 db                	xor    %ebx,%ebx
076d   b2384d:	c7 44 24 10 01 00 00 00 	movl   $0x1,0x10(%rsp)
0775   b23855:	c7 44 24 0c 02 00 00 00 	movl   $0x2,0xc(%rsp)
077d   b2385d:	b8 03 00 00 00       	mov    $0x3,%eax
0782   b23862:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
0787   b23867:	e9 2c 01 00 00       	jmp    b23998 <adm1275_probe+0x8b8>
078c   b2386c:	e8 00 00 00 00       	call   b23871 <adm1275_probe+0x791>	b2386d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0791   b23871:	c7 44 24 0c 04 00 00 00 	movl   $0x4,0xc(%rsp)
0799   b23879:	b8 02 00 00 00       	mov    $0x2,%eax
079e   b2387e:	eb 12                	jmp    b23892 <adm1275_probe+0x7b2>
07a0   b23880:	e8 00 00 00 00       	call   b23885 <adm1275_probe+0x7a5>	b23881: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
07a5   b23885:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
07aa   b2388a:	c7 44 24 0c ff ff ff ff 	movl   $0xffffffff,0xc(%rsp)
07b2   b23892:	89 44 24 10          	mov    %eax,0x10(%rsp)
07b6   b23896:	41 c7 85 34 01 00 00 31 60 40 00 	movl   $0x406031,0x134(%r13)
07c1   b238a1:	f6 c3 40             	test   $0x40,%bl
07c4   b238a4:	b9 31 60 40 00       	mov    $0x406031,%ecx
07c9   b238a9:	b8 35 70 40 00       	mov    $0x407035,%eax
07ce   b238ae:	0f 44 c1             	cmove  %ecx,%eax
07d1   b238b1:	49 c7 c6 00 00 00 00 	mov    $0x0,%r14	b238b4: R_X86_64_32S	.rodata+0x620cd0
07d8   b238b8:	c7 44 24 14 00 00 00 00 	movl   $0x0,0x14(%rsp)
07e0   b238c0:	48 c7 44 24 18 ff ff ff ff 	movq   $0xffffffffffffffff,0x18(%rsp)
07e9   b238c9:	31 db                	xor    %ebx,%ebx
07eb   b238cb:	e9 d8 00 00 00       	jmp    b239a8 <adm1275_probe+0x8c8>
07f0   b238d0:	e8 00 00 00 00       	call   b238d5 <adm1275_probe+0x7f5>	b238d1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
07f5   b238d5:	c7 44 24 0c 07 00 00 00 	movl   $0x7,0xc(%rsp)
07fd   b238dd:	eb 1c                	jmp    b238fb <adm1275_probe+0x81b>
07ff   b238df:	e8 00 00 00 00       	call   b238e4 <adm1275_probe+0x804>	b238e0: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0804   b238e4:	c7 44 24 0c 06 00 00 00 	movl   $0x6,0xc(%rsp)
080c   b238ec:	eb 0d                	jmp    b238fb <adm1275_probe+0x81b>
080e   b238ee:	e8 00 00 00 00       	call   b238f3 <adm1275_probe+0x813>	b238ef: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0813   b238f3:	c7 44 24 0c 05 00 00 00 	movl   $0x5,0xc(%rsp)
081b   b238fb:	41 c7 85 34 01 00 00 34 f2 40 00 	movl   $0x40f234,0x134(%r13)
0826   b23906:	41 f7 d6             	not    %r14d
0829   b23909:	41 f6 c6 0a          	test   $0xa,%r14b
082d   b2390d:	75 0a                	jne    b23919 <adm1275_probe+0x839>
082f   b2390f:	e8 00 00 00 00       	call   b23914 <adm1275_probe+0x834>	b23910: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0834   b23914:	41 89 dc             	mov    %ebx,%r12d
0837   b23917:	eb 25                	jmp    b2393e <adm1275_probe+0x85e>
0839   b23919:	41 89 dc             	mov    %ebx,%r12d
083c   b2391c:	41 83 cc 0a          	or     $0xa,%r12d
0840   b23920:	41 0f b6 d4          	movzbl %r12b,%edx
0844   b23924:	4c 89 ff             	mov    %r15,%rdi
0847   b23927:	be d4 00 00 00       	mov    $0xd4,%esi
084c   b2392c:	e8 00 00 00 00       	call   b23931 <adm1275_probe+0x851>	b2392d: R_X86_64_PLT32	i2c_smbus_write_byte_data-0x4
0851   b23931:	85 c0                	test   %eax,%eax
0853   b23933:	0f 88 f8 01 00 00    	js     b23b31 <adm1275_probe+0xa51>
0859   b23939:	e8 00 00 00 00       	call   b2393e <adm1275_probe+0x85e>	b2393a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
085e   b2393e:	89 d8                	mov    %ebx,%eax
0860   b23940:	c1 e8 05             	shr    $0x5,%eax
0863   b23943:	83 e0 01             	and    $0x1,%eax
0866   b23946:	89 44 24 20          	mov    %eax,0x20(%rsp)
086a   b2394a:	83 e3 01             	and    $0x1,%ebx
086d   b2394d:	89 d8                	mov    %ebx,%eax
086f   b2394f:	83 c8 02             	or     $0x2,%eax
0872   b23952:	89 44 24 10          	mov    %eax,0x10(%rsp)
0876   b23956:	41 f6 c4 04          	test   $0x4,%r12b
087a   b2395a:	75 22                	jne    b2397e <adm1275_probe+0x89e>
087c   b2395c:	e8 00 00 00 00       	call   b23961 <adm1275_probe+0x881>	b2395d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0881   b23961:	49 c7 c6 00 00 00 00 	mov    $0x0,%r14	b23964: R_X86_64_32S	.rodata+0x620cf0
0888   b23968:	b0 01                	mov    $0x1,%al
088a   b2396a:	89 44 24 14          	mov    %eax,0x14(%rsp)
088e   b2396e:	b8 08 00 00 00       	mov    $0x8,%eax
0893   b23973:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
0898   b23978:	8b 5c 24 20          	mov    0x20(%rsp),%ebx
089c   b2397c:	eb 31                	jmp    b239af <adm1275_probe+0x8cf>
089e   b2397e:	e8 00 00 00 00       	call   b23983 <adm1275_probe+0x8a3>	b2397f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
08a3   b23983:	49 c7 c6 00 00 00 00 	mov    $0x0,%r14	b23986: R_X86_64_32S	.rodata+0x620cf0
08aa   b2398a:	b8 08 00 00 00       	mov    $0x8,%eax
08af   b2398f:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
08b4   b23994:	8b 5c 24 20          	mov    0x20(%rsp),%ebx
08b8   b23998:	41 8b 85 34 01 00 00 	mov    0x134(%r13),%eax
08bf   b2399f:	83 c8 01             	or     $0x1,%eax
08c2   b239a2:	b1 01                	mov    $0x1,%cl
08c4   b239a4:	89 4c 24 14          	mov    %ecx,0x14(%rsp)
08c8   b239a8:	41 89 85 34 01 00 00 	mov    %eax,0x134(%r13)
08cf   b239af:	41 89 dc             	mov    %ebx,%r12d
08d2   b239b2:	44 89 e0             	mov    %r12d,%eax
08d5   b239b5:	48 8d 04 40          	lea    (%rax,%rax,2),%rax
08d9   b239b9:	41 0f bf 0c 46       	movswl (%r14,%rax,2),%ecx
08de   b239be:	41 89 8d d4 00 00 00 	mov    %ecx,0xd4(%r13)
08e5   b239c5:	41 0f bf 4c 46 02    	movswl 0x2(%r14,%rax,2),%ecx
08eb   b239cb:	41 89 8d f4 00 00 00 	mov    %ecx,0xf4(%r13)
08f2   b239d2:	4c 89 74 24 20       	mov    %r14,0x20(%rsp)
08f7   b239d7:	41 0f bf 44 46 04    	movswl 0x4(%r14,%rax,2),%eax
08fd   b239dd:	41 89 85 14 01 00 00 	mov    %eax,0x114(%r13)
0904   b239e4:	85 db                	test   %ebx,%ebx
0906   b239e6:	44 8b 74 24 10       	mov    0x10(%rsp),%r14d
090b   b239eb:	78 35                	js     b23a22 <adm1275_probe+0x942>
090d   b239ed:	e8 00 00 00 00       	call   b239f2 <adm1275_probe+0x912>	b239ee: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0912   b239f2:	89 d8                	mov    %ebx,%eax
0914   b239f4:	48 8d 04 40          	lea    (%rax,%rax,2),%rax
0918   b239f8:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
091d   b239fd:	0f bf 0c 42          	movswl (%rdx,%rax,2),%ecx
0921   b23a01:	41 89 8d d8 00 00 00 	mov    %ecx,0xd8(%r13)
0928   b23a08:	0f bf 4c 42 02       	movswl 0x2(%rdx,%rax,2),%ecx
092d   b23a0d:	41 89 8d f8 00 00 00 	mov    %ecx,0xf8(%r13)
0934   b23a14:	0f bf 44 42 04       	movswl 0x4(%rdx,%rax,2),%eax
0939   b23a19:	41 89 85 18 01 00 00 	mov    %eax,0x118(%r13)
0940   b23a20:	eb 05                	jmp    b23a27 <adm1275_probe+0x947>
0942   b23a22:	e8 00 00 00 00       	call   b23a27 <adm1275_probe+0x947>	b23a23: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0947   b23a27:	44 8b 64 24 0c       	mov    0xc(%rsp),%r12d
094c   b23a2c:	45 85 f6             	test   %r14d,%r14d
094f   b23a2f:	78 47                	js     b23a78 <adm1275_probe+0x998>
0951   b23a31:	e8 00 00 00 00       	call   b23a36 <adm1275_probe+0x956>	b23a32: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0956   b23a36:	44 89 f0             	mov    %r14d,%eax
0959   b23a39:	48 8d 04 40          	lea    (%rax,%rax,2),%rax
095d   b23a3d:	48 8b 5c 24 20       	mov    0x20(%rsp),%rbx
0962   b23a42:	0f bf 0c 43          	movswl (%rbx,%rax,2),%ecx
0966   b23a46:	69 c9 e8 03 00 00    	imul   $0x3e8,%ecx,%ecx
096c   b23a4c:	48 69 c9 d3 4d 62 10 	imul   $0x10624dd3,%rcx,%rcx
0973   b23a53:	48 c1 e9 26          	shr    $0x26,%rcx
0977   b23a57:	41 89 8d e0 00 00 00 	mov    %ecx,0xe0(%r13)
097e   b23a5e:	0f bf 4c 43 02       	movswl 0x2(%rbx,%rax,2),%ecx
0983   b23a63:	41 89 8d 00 01 00 00 	mov    %ecx,0x100(%r13)
098a   b23a6a:	0f bf 44 43 04       	movswl 0x4(%rbx,%rax,2),%eax
098f   b23a6f:	41 89 85 20 01 00 00 	mov    %eax,0x120(%r13)
0996   b23a76:	eb 0a                	jmp    b23a82 <adm1275_probe+0x9a2>
0998   b23a78:	e8 00 00 00 00       	call   b23a7d <adm1275_probe+0x99d>	b23a79: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
099d   b23a7d:	48 8b 5c 24 20       	mov    0x20(%rsp),%rbx
09a2   b23a82:	45 85 e4             	test   %r12d,%r12d
09a5   b23a85:	78 42                	js     b23ac9 <adm1275_probe+0x9e9>
09a7   b23a87:	e8 00 00 00 00       	call   b23a8c <adm1275_probe+0x9ac>	b23a88: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
09ac   b23a8c:	44 89 e0             	mov    %r12d,%eax
09af   b23a8f:	48 8d 04 40          	lea    (%rax,%rax,2),%rax
09b3   b23a93:	0f bf 0c 43          	movswl (%rbx,%rax,2),%ecx
09b7   b23a97:	69 c9 e8 03 00 00    	imul   $0x3e8,%ecx,%ecx
09bd   b23a9d:	48 69 c9 d3 4d 62 10 	imul   $0x10624dd3,%rcx,%rcx
09c4   b23aa4:	48 c1 e9 26          	shr    $0x26,%rcx
09c8   b23aa8:	41 89 8d e4 00 00 00 	mov    %ecx,0xe4(%r13)
09cf   b23aaf:	0f bf 4c 43 02       	movswl 0x2(%rbx,%rax,2),%ecx
09d4   b23ab4:	41 89 8d 04 01 00 00 	mov    %ecx,0x104(%r13)
09db   b23abb:	0f bf 44 43 04       	movswl 0x4(%rbx,%rax,2),%eax
09e0   b23ac0:	41 89 85 24 01 00 00 	mov    %eax,0x124(%r13)
09e7   b23ac7:	eb 05                	jmp    b23ace <adm1275_probe+0x9ee>
09e9   b23ac9:	e8 00 00 00 00       	call   b23ace <adm1275_probe+0x9ee>	b23aca: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
09ee   b23ace:	48 83 44 24 28 10    	addq   $0x10,0x28(%rsp)
09f4   b23ad4:	80 7c 24 14 00       	cmpb   $0x0,0x14(%rsp)
09f9   b23ad9:	74 33                	je     b23b0e <adm1275_probe+0xa2e>
09fb   b23adb:	e8 00 00 00 00       	call   b23ae0 <adm1275_probe+0xa00>	b23adc: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0a00   b23ae0:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
0a05   b23ae5:	48 8d 04 40          	lea    (%rax,%rax,2),%rax
0a09   b23ae9:	0f bf 0c 43          	movswl (%rbx,%rax,2),%ecx
0a0d   b23aed:	41 89 8d e8 00 00 00 	mov    %ecx,0xe8(%r13)
0a14   b23af4:	0f bf 4c 43 02       	movswl 0x2(%rbx,%rax,2),%ecx
0a19   b23af9:	41 89 8d 08 01 00 00 	mov    %ecx,0x108(%r13)
0a20   b23b00:	0f bf 44 43 04       	movswl 0x4(%rbx,%rax,2),%eax
0a25   b23b05:	41 89 85 28 01 00 00 	mov    %eax,0x128(%r13)
0a2c   b23b0c:	eb 05                	jmp    b23b13 <adm1275_probe+0xa33>
0a2e   b23b0e:	e8 00 00 00 00       	call   b23b13 <adm1275_probe+0xa33>	b23b0f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0a33   b23b13:	4c 89 ff             	mov    %r15,%rdi
0a36   b23b16:	48 8b 74 24 28       	mov    0x28(%rsp),%rsi
0a3b   b23b1b:	e8 00 00 00 00       	call   b23b20 <adm1275_probe+0xa40>	b23b1c: R_X86_64_PLT32	pmbus_do_probe-0x4
0a40   b23b20:	89 c3                	mov    %eax,%ebx
0a42   b23b22:	e9 78 f6 ff ff       	jmp    b2319f <adm1275_probe+0xbf>
0a47   b23b27:	e8 00 00 00 00       	call   b23b2c <adm1275_probe+0xa4c>	b23b28: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0a4c   b23b2c:	e9 69 f6 ff ff       	jmp    b2319a <adm1275_probe+0xba>
0a51   b23b31:	e8 00 00 00 00       	call   b23b36 <adm1275_probe+0xa56>	b23b32: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0a56   b23b36:	e9 5f f6 ff ff       	jmp    b2319a <adm1275_probe+0xba>
0a5b   b23b3b:	e8 00 00 00 00       	call   b23b40 <adm1275_probe+0xa60>	b23b3c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0a60   b23b40:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	b23b43: R_X86_64_32S	.rodata.str1.1+0x2eec0
0a67   b23b47:	e8 00 00 00 00       	call   b23b4c <adm1275_probe+0xa6c>	b23b48: R_X86_64_PLT32	fortify_panic-0x4
0a6c   b23b4c:	e8 00 00 00 00       	call   b23b51 <adm1275_probe+0xa71>	b23b4d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0a71   b23b51:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	b23b54: R_X86_64_32S	.rodata.str1.1+0xa0966
0a78   b23b58:	e8 00 00 00 00       	call   b23b5d <adm1275_probe+0xa7d>	b23b59: R_X86_64_PLT32	fortify_panic-0x4
0a7d   b23b5d:	e8 00 00 00 00       	call   b23b62 <adm1275_probe+0xa82>	b23b5e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0a82   b23b62:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	b23b65: R_X86_64_32S	.rodata.str1.1+0x2eec0
0a89   b23b69:	e8 00 00 00 00       	call   b23b6e <adm1275_probe+0xa8e>	b23b6a: R_X86_64_PLT32	fortify_panic-0x4
0a8e   b23b6e:	e8 00 00 00 00       	call   b23b73 <adm1275_probe+0xa93>	b23b6f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0a93   b23b73:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	b23b76: R_X86_64_32S	.rodata.str1.1+0xa0966
0a9a   b23b7a:	e8 00 00 00 00       	call   b23b7f <adm1275_probe+0xa9f>	b23b7b: R_X86_64_PLT32	fortify_panic-0x4
0a9f   b23b7f:	e8 00 00 00 00       	call   b23b84 <adm1275_probe+0xaa4>	b23b80: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0aa4   b23b84:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	b23b87: R_X86_64_32S	.rodata.str1.1+0x2eec0
0aab   b23b8b:	e8 00 00 00 00       	call   b23b90 <adm1275_probe+0xab0>	b23b8c: R_X86_64_PLT32	fortify_panic-0x4
0ab0   b23b90:	e8 00 00 00 00       	call   b23b95 <adm1275_probe+0xab5>	b23b91: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0ab5   b23b95:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	b23b98: R_X86_64_32S	.rodata.str1.1+0xa0966
0abc   b23b9c:	e8 00 00 00 00       	call   b23ba1 <adm1275_probe+0xac1>	b23b9d: R_X86_64_PLT32	fortify_panic-0x4
0ac1   b23ba1:	e8 00 00 00 00       	call   b23ba6 <adm1275_probe+0xac6>	b23ba2: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0ac6   b23ba6:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	b23ba9: R_X86_64_32S	.rodata.str1.1+0x2eec0
0acd   b23bad:	e8 00 00 00 00       	call   b23bb2 <adm1275_probe+0xad2>	b23bae: R_X86_64_PLT32	fortify_panic-0x4
0ad2   b23bb2:	e8 00 00 00 00       	call   b23bb7 <adm1275_probe+0xad7>	b23bb3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0ad7   b23bb7:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	b23bba: R_X86_64_32S	.rodata.str1.1+0xa0966
0ade   b23bbe:	e8 00 00 00 00       	call   b23bc3 <adm1275_probe+0xae3>	b23bbf: R_X86_64_PLT32	fortify_panic-0x4
0ae3   b23bc3:	e8 00 00 00 00       	call   b23bc8 <adm1275_probe+0xae8>	b23bc4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0ae8   b23bc8:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	b23bcb: R_X86_64_32S	.rodata.str1.1+0x2eec0
0aef   b23bcf:	e8 00 00 00 00       	call   b23bd4 <adm1275_probe+0xaf4>	b23bd0: R_X86_64_PLT32	fortify_panic-0x4
0af4   b23bd4:	e8 00 00 00 00       	call   b23bd9 <adm1275_probe+0xaf9>	b23bd5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0af9   b23bd9:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	b23bdc: R_X86_64_32S	.rodata.str1.1+0xa0966
0b00   b23be0:	e8 00 00 00 00       	call   b23be5 <adm1275_probe+0xb05>	b23be1: R_X86_64_PLT32	fortify_panic-0x4
0b05   b23be5:	e8 00 00 00 00       	call   b23bea <adm1275_probe+0xb0a>	b23be6: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0b0a   b23bea:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	b23bed: R_X86_64_32S	.rodata.str1.1+0x2eec0
0b11   b23bf1:	e8 00 00 00 00       	call   b23bf6 <adm1275_probe+0xb16>	b23bf2: R_X86_64_PLT32	fortify_panic-0x4
0b16   b23bf6:	e8 00 00 00 00       	call   b23bfb <adm1275_probe+0xb1b>	b23bf7: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0b1b   b23bfb:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	b23bfe: R_X86_64_32S	.rodata.str1.1+0xa0966
0b22   b23c02:	e8 00 00 00 00       	call   b23c07 <adm1275_probe+0xb27>	b23c03: R_X86_64_PLT32	fortify_panic-0x4
0b27   b23c07:	e8 00 00 00 00       	call   b23c0c <adm1275_probe+0xb2c>	b23c08: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0b2c   b23c0c:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	b23c0f: R_X86_64_32S	.rodata.str1.1+0x2eec0
0b33   b23c13:	e8 00 00 00 00       	call   b23c18 <adm1275_probe+0xb38>	b23c14: R_X86_64_PLT32	fortify_panic-0x4
0b38   b23c18:	e8 00 00 00 00       	call   b23c1d <adm1275_probe+0xb3d>	b23c19: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0b3d   b23c1d:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	b23c20: R_X86_64_32S	.rodata.str1.1+0xa0966
0b44   b23c24:	e8 00 00 00 00       	call   b23c29 <adm1275_probe+0xb49>	b23c25: R_X86_64_PLT32	fortify_panic-0x4
0b49   b23c29:	e8 00 00 00 00       	call   b23c2e <adm1275_probe+0xb4e>	b23c2a: R_X86_64_PLT32	__stack_chk_fail-0x4
0b4e   b23c2e:	66 90                	xchg   %ax,%ax

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
