Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469173D575;
	Wed, 31 Jan 2024 05:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706679278; cv=none; b=Vz3dmCxGMDTqwDi1g2Oc46Btze3/hQrIhhou8wv/Pl7rqGmJFoZp5LKdQ4/GUG3201z/EqSemLcracWStlmWNqX6X+y+eocrIubvzh/ldmCmxJqqpmn3jUg5dibFgFxf+pNEoPhEioqHMJA9omX80XpD2ocBatRSlKsw5MMU/lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706679278; c=relaxed/simple;
	bh=eXxQGeGgpBbPPmPuFjfOlQM1AFx6DbKtz6XNmbPJKuM=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BWPzijBaAQzLIsoFu5ZWrbGVBGEtWBQnzu2vTQJ0BW54L0jRdPZKOE/blqyVmu/Vw/bz78nl8jZBNvlhkagmvGHPo0Rq6/oBZPEPlw0HrNrOmfJQcpvY1Xdv42Pgnp86PBkRY8G/mOQ2S/4fAb/NJwrjxoTraabOh0D2MH4kuzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ERdjC+Pv; arc=none smtp.client-ip=134.134.136.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ERdjC+Pv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706679275; x=1738215275;
  h=date:from:cc:subject:message-id:mime-version;
  bh=eXxQGeGgpBbPPmPuFjfOlQM1AFx6DbKtz6XNmbPJKuM=;
  b=ERdjC+PvtL8Dpg5451Cw6CMwe9RqvAGvTBumcAYgl51FQ87ZFNHn5n4+
   jGzn9fc059XBbEFc/7xubHi/y0gKGFMfxo0JC7cdDYrDgIrjXaDBBMbur
   lPP3Cz36udpTmsiQFtkGAHu36fCtXlb4VHolrCWhVhh8Q8toFbdRXERWu
   wZQirc1OrkPLgCAyLE2AjkuxdL9q3yM/GXyNEE2V9QAgwQTwshs5Grlz2
   LZs+peym56PoPRL7R8FGcoCf1/uw2gQ2DXuIp1/fSOzH7RXC6IDvXC+BB
   22ZwP/GeAqSxpyoTDAfc2U00QHkID7eUIHMet1Il64zP/L0Qhedth2URP
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="393939715"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="393939715"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 21:34:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="911677053"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="911677053"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 30 Jan 2024 21:34:32 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rV3Dr-0001AK-1C;
	Wed, 31 Jan 2024 05:33:49 +0000
Date: Wed, 31 Jan 2024 13:33:10 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [ardb:x86-pie-for-sev-v3 17/22] arch/x86/kernel/sev.o: warning:
 objtool: snp_cpuid+0x120: can't find switch jump table
Message-ID: <202401311337.ltRQEEK6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Ard Biesheuvel <ardb@kernel.org>

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-for-sev-v3
head:   e808f1d9ecc40f701330869bdb4f8ce0ad23c774
commit: 842c40c07fd9f102438449c58bbfd8a1a640fbab [17/22] x86/sev: Use PIC codegen for early SEV startup code
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240131/202401311337.ltRQEEK6-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240131/202401311337.ltRQEEK6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401311337.ltRQEEK6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/sev.o: warning: objtool: snp_cpuid+0x120: can't find switch jump table


objdump-func vmlinux.o snp_cpuid:
0000 0000000000000760 <snp_cpuid>:
0000      760:	55                   	push   %rbp
0001      761:	41 56                	push   %r14
0003      763:	53                   	push   %rbx
0004      764:	48 83 ec 18          	sub    $0x18,%rsp
0008      768:	4c 8d 05 00 00 00 00 	lea    0x0(%rip),%r8        # 76f <snp_cpuid+0xf>	76b: R_X86_64_PC32	.data..ro_after_init+0x171b0
000f      76f:	41 8b 00             	mov    (%r8),%eax
0012      772:	85 c0                	test   %eax,%eax
0014      774:	0f 84 45 01 00 00    	je     8bf <snp_cpuid+0x15f>
001a      77a:	48 89 d3             	mov    %rdx,%rbx
001d      77d:	8b 0a                	mov    (%rdx),%ecx
001f      77f:	45 31 c9             	xor    %r9d,%r9d
0022      782:	b2 01                	mov    $0x1,%dl
0024      784:	41 ba 90 a8 95 e1    	mov    $0xe195a890,%r10d
002a      78a:	eb 0b                	jmp    797 <snp_cpuid+0x37>
002c      78c:	41 ff c1             	inc    %r9d
002f      78f:	41 39 c1             	cmp    %eax,%r9d
0032      792:	0f 92 c2             	setb   %dl
0035      795:	74 78                	je     80f <snp_cpuid+0xaf>
0037      797:	4d 63 d9             	movslq %r9d,%r11
003a      79a:	4f 8d 1c 5b          	lea    (%r11,%r11,2),%r11
003e      79e:	49 c1 e3 04          	shl    $0x4,%r11
0042      7a2:	43 39 4c 18 10       	cmp    %ecx,0x10(%r8,%r11,1)
0047      7a7:	75 e3                	jne    78c <snp_cpuid+0x2c>
0049      7a9:	83 f9 1f             	cmp    $0x1f,%ecx
004c      7ac:	77 33                	ja     7e1 <snp_cpuid+0x81>
004e      7ae:	41 0f a3 ca          	bt     %ecx,%r10d
0052      7b2:	73 2d                	jae    7e1 <snp_cpuid+0x81>
0054      7b4:	43 8b 6c 18 14       	mov    0x14(%r8,%r11,1),%ebp
0059      7b9:	3b 6b 04             	cmp    0x4(%rbx),%ebp
005c      7bc:	75 ce                	jne    78c <snp_cpuid+0x2c>
005e      7be:	83 f9 0d             	cmp    $0xd,%ecx
0061      7c1:	75 26                	jne    7e9 <snp_cpuid+0x89>
0063      7c3:	83 fd 01             	cmp    $0x1,%ebp
0066      7c6:	77 21                	ja     7e9 <snp_cpuid+0x89>
0068      7c8:	4f 8b 74 18 18       	mov    0x18(%r8,%r11,1),%r14
006d      7cd:	49 83 ce 02          	or     $0x2,%r14
0071      7d1:	49 83 fe 03          	cmp    $0x3,%r14
0075      7d5:	75 b5                	jne    78c <snp_cpuid+0x2c>
0077      7d7:	4b 83 7c 18 20 00    	cmpq   $0x0,0x20(%r8,%r11,1)
007d      7dd:	75 ad                	jne    78c <snp_cpuid+0x2c>
007f      7df:	eb 08                	jmp    7e9 <snp_cpuid+0x89>
0081      7e1:	81 f9 1d 00 00 80    	cmp    $0x8000001d,%ecx
0087      7e7:	74 cb                	je     7b4 <snp_cpuid+0x54>
0089      7e9:	43 8b 44 18 28       	mov    0x28(%r8,%r11,1),%eax
008e      7ee:	89 43 08             	mov    %eax,0x8(%rbx)
0091      7f1:	43 8b 44 18 2c       	mov    0x2c(%r8,%r11,1),%eax
0096      7f6:	89 43 0c             	mov    %eax,0xc(%rbx)
0099      7f9:	43 8b 44 18 30       	mov    0x30(%r8,%r11,1),%eax
009e      7fe:	89 43 10             	mov    %eax,0x10(%rbx)
00a1      801:	47 8b 4c 18 34       	mov    0x34(%r8,%r11,1),%r9d
00a6      806:	44 89 4b 14          	mov    %r9d,0x14(%rbx)
00aa      80a:	f6 c2 01             	test   $0x1,%dl
00ad      80d:	75 40                	jne    84f <snp_cpuid+0xef>
00af      80f:	48 c7 43 10 00 00 00 00 	movq   $0x0,0x10(%rbx)
00b7      817:	48 c7 43 08 00 00 00 00 	movq   $0x0,0x8(%rbx)
00bf      81f:	31 c0                	xor    %eax,%eax
00c1      821:	3b 0d 00 00 00 00    	cmp    0x0(%rip),%ecx        # 827 <snp_cpuid+0xc7>	823: R_X86_64_PC32	.data..ro_after_init+0x171a4
00c7      827:	76 26                	jbe    84f <snp_cpuid+0xef>
00c9      829:	81 f9 00 00 00 40    	cmp    $0x40000000,%ecx
00cf      82f:	72 08                	jb     839 <snp_cpuid+0xd9>
00d1      831:	3b 0d 00 00 00 00    	cmp    0x0(%rip),%ecx        # 837 <snp_cpuid+0xd7>	833: R_X86_64_PC32	.data..ro_after_init+0x171a8
00d7      837:	76 16                	jbe    84f <snp_cpuid+0xef>
00d9      839:	31 c0                	xor    %eax,%eax
00db      83b:	85 c9                	test   %ecx,%ecx
00dd      83d:	0f 89 e6 01 00 00    	jns    a29 <snp_cpuid+0x2c9>
00e3      843:	3b 0d 00 00 00 00    	cmp    0x0(%rip),%ecx        # 849 <snp_cpuid+0xe9>	845: R_X86_64_PC32	.data..ro_after_init+0x171ac
00e9      849:	0f 87 da 01 00 00    	ja     a29 <snp_cpuid+0x2c9>
00ef      84f:	48 8b 53 10          	mov    0x10(%rbx),%rdx
00f3      853:	48 89 54 24 10       	mov    %rdx,0x10(%rsp)
00f8      858:	48 8b 13             	mov    (%rbx),%rdx
00fb      85b:	4c 8b 4b 08          	mov    0x8(%rbx),%r9
00ff      85f:	4c 89 4c 24 08       	mov    %r9,0x8(%rsp)
0104      864:	48 89 14 24          	mov    %rdx,(%rsp)
0108      868:	31 ed                	xor    %ebp,%ebp
010a      86a:	8d 51 ff             	lea    -0x1(%rcx),%edx
010d      86d:	83 fa 0c             	cmp    $0xc,%edx
0110      870:	77 57                	ja     8c9 <snp_cpuid+0x169>
0112      872:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # 879 <snp_cpuid+0x119>	875: R_X86_64_PC32	.rodata+0xf670
0119      879:	48 63 14 91          	movslq (%rcx,%rdx,4),%rdx
011d      87d:	48 01 ca             	add    %rcx,%rdx
0120      880:	ff e2                	jmp    *%rdx
0122      882:	48 89 e2             	mov    %rsp,%rdx
0125      885:	e8 26 06 00 00       	call   eb0 <snp_cpuid_hv>
012a      88a:	0f b6 44 24 0f       	movzbl 0xf(%rsp),%eax
012f      88f:	88 43 0f             	mov    %al,0xf(%rbx)
0132      892:	b8 00 02 00 00       	mov    $0x200,%eax
0137      897:	23 44 24 14          	and    0x14(%rsp),%eax
013b      89b:	b9 ff fd ff ff       	mov    $0xfffffdff,%ecx
0140      8a0:	23 4b 14             	and    0x14(%rbx),%ecx
0143      8a3:	09 c1                	or     %eax,%ecx
0145      8a5:	89 4b 14             	mov    %ecx,0x14(%rbx)
0148      8a8:	0f 20 e0             	mov    %cr4,%rax
014b      8ab:	a9 00 00 04 00       	test   $0x40000,%eax
0150      8b0:	0f 84 71 01 00 00    	je     a27 <snp_cpuid+0x2c7>
0156      8b6:	80 4b 13 08          	orb    $0x8,0x13(%rbx)
015a      8ba:	e9 68 01 00 00       	jmp    a27 <snp_cpuid+0x2c7>
015f      8bf:	b8 a1 ff ff ff       	mov    $0xffffffa1,%eax
0164      8c4:	e9 60 01 00 00       	jmp    a29 <snp_cpuid+0x2c9>
0169      8c9:	81 f9 1e 00 00 80    	cmp    $0x8000001e,%ecx
016f      8cf:	0f 85 52 01 00 00    	jne    a27 <snp_cpuid+0x2c7>
0175      8d5:	48 89 e2             	mov    %rsp,%rdx
0178      8d8:	e8 d3 05 00 00       	call   eb0 <snp_cpuid_hv>
017d      8dd:	8b 44 24 08          	mov    0x8(%rsp),%eax
0181      8e1:	89 43 08             	mov    %eax,0x8(%rbx)
0184      8e4:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
0189      8e9:	88 43 0c             	mov    %al,0xc(%rbx)
018c      8ec:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
0191      8f1:	88 43 10             	mov    %al,0x10(%rbx)
0194      8f4:	e9 2e 01 00 00       	jmp    a27 <snp_cpuid+0x2c7>
0199      8f9:	83 e0 ef             	and    $0xffffffef,%eax
019c      8fc:	89 43 10             	mov    %eax,0x10(%rbx)
019f      8ff:	0f 20 e0             	mov    %cr4,%rax
01a2      902:	a9 00 00 40 00       	test   $0x400000,%eax
01a7      907:	0f 84 1a 01 00 00    	je     a27 <snp_cpuid+0x2c7>
01ad      90d:	80 4b 10 10          	orb    $0x10,0x10(%rbx)
01b1      911:	e9 11 01 00 00       	jmp    a27 <snp_cpuid+0x2c7>
01b6      916:	c7 44 24 04 00 00 00 00 	movl   $0x0,0x4(%rsp)
01be      91e:	48 89 e2             	mov    %rsp,%rdx
01c1      921:	e8 8a 05 00 00       	call   eb0 <snp_cpuid_hv>
01c6      926:	8b 44 24 14          	mov    0x14(%rsp),%eax
01ca      92a:	89 43 14             	mov    %eax,0x14(%rbx)
01cd      92d:	e9 f5 00 00 00       	jmp    a27 <snp_cpuid+0x2c7>
01d2      932:	83 7b 04 01          	cmpl   $0x1,0x4(%rbx)
01d6      936:	0f 87 eb 00 00 00    	ja     a27 <snp_cpuid+0x2c7>
01dc      93c:	0f 20 e0             	mov    %cr4,%rax
01df      93f:	be 01 00 00 00       	mov    $0x1,%esi
01e4      944:	a9 00 00 04 00       	test   $0x40000,%eax
01e9      949:	74 10                	je     95b <snp_cpuid+0x1fb>
01eb      94b:	31 c9                	xor    %ecx,%ecx
01ed      94d:	0f 01 d0             	xgetbv
01f0      950:	89 d6                	mov    %edx,%esi
01f2      952:	89 c0                	mov    %eax,%eax
01f4      954:	48 c1 e6 20          	shl    $0x20,%rsi
01f8      958:	48 09 c6             	or     %rax,%rsi
01fb      95b:	8b 7b 04             	mov    0x4(%rbx),%edi
01fe      95e:	83 ff 01             	cmp    $0x1,%edi
0201      961:	75 0b                	jne    96e <snp_cpuid+0x20e>
0203      963:	8b 43 08             	mov    0x8(%rbx),%eax
0206      966:	a8 08                	test   $0x8,%al
0208      968:	75 08                	jne    972 <snp_cpuid+0x212>
020a      96a:	31 d2                	xor    %edx,%edx
020c      96c:	eb 15                	jmp    983 <snp_cpuid+0x223>
020e      96e:	31 d2                	xor    %edx,%edx
0210      970:	eb 19                	jmp    98b <snp_cpuid+0x22b>
0212      972:	b9 a0 0d 00 00       	mov    $0xda0,%ecx
0217      977:	0f 32                	rdmsr
0219      979:	48 c1 e2 20          	shl    $0x20,%rdx
021d      97d:	48 09 c2             	or     %rax,%rdx
0220      980:	8b 43 08             	mov    0x8(%rbx),%eax
0223      983:	a8 0a                	test   $0xa,%al
0225      985:	0f 84 97 00 00 00    	je     a22 <snp_cpuid+0x2c2>
022b      98b:	48 09 f2             	or     %rsi,%rdx
022e      98e:	41 8b 30             	mov    (%r8),%esi
0231      991:	45 31 c9             	xor    %r9d,%r9d
0234      994:	b8 40 02 00 00       	mov    $0x240,%eax
0239      999:	85 f6                	test   %esi,%esi
023b      99b:	74 69                	je     a06 <snp_cpuid+0x2a6>
023d      99d:	45 31 db             	xor    %r11d,%r11d
0240      9a0:	eb 0e                	jmp    9b0 <snp_cpuid+0x250>
0242      9a2:	4d 89 da             	mov    %r11,%r10
0245      9a5:	41 ff c1             	inc    %r9d
0248      9a8:	4d 89 d3             	mov    %r10,%r11
024b      9ab:	44 39 ce             	cmp    %r9d,%esi
024e      9ae:	74 59                	je     a09 <snp_cpuid+0x2a9>
0250      9b0:	49 63 c9             	movslq %r9d,%rcx
0253      9b3:	4c 8d 34 49          	lea    (%rcx,%rcx,2),%r14
0257      9b7:	49 c1 e6 04          	shl    $0x4,%r14
025b      9bb:	43 83 7c 30 10 0d    	cmpl   $0xd,0x10(%r8,%r14,1)
0261      9c1:	75 df                	jne    9a2 <snp_cpuid+0x242>
0263      9c3:	43 8b 4c 30 14       	mov    0x14(%r8,%r14,1),%ecx
0268      9c8:	44 8d 51 fe          	lea    -0x2(%rcx),%r10d
026c      9cc:	41 83 fa 3d          	cmp    $0x3d,%r10d
0270      9d0:	77 d0                	ja     9a2 <snp_cpuid+0x242>
0272      9d2:	41 ba 01 00 00 00    	mov    $0x1,%r10d
0278      9d8:	49 d3 e2             	shl    %cl,%r10
027b      9db:	48 0f a3 ca          	bt     %rcx,%rdx
027f      9df:	73 c1                	jae    9a2 <snp_cpuid+0x242>
0281      9e1:	4c 89 d1             	mov    %r10,%rcx
0284      9e4:	4c 21 d9             	and    %r11,%rcx
0287      9e7:	75 b9                	jne    9a2 <snp_cpuid+0x242>
0289      9e9:	4d 09 da             	or     %r11,%r10
028c      9ec:	43 8b 4c 30 28       	mov    0x28(%r8,%r14,1),%ecx
0291      9f1:	83 ff 01             	cmp    $0x1,%edi
0294      9f4:	75 04                	jne    9fa <snp_cpuid+0x29a>
0296      9f6:	01 c8                	add    %ecx,%eax
0298      9f8:	eb ab                	jmp    9a5 <snp_cpuid+0x245>
029a      9fa:	43 03 4c 30 2c       	add    0x2c(%r8,%r14,1),%ecx
029f      9ff:	39 c8                	cmp    %ecx,%eax
02a1      a01:	0f 46 c1             	cmovbe %ecx,%eax
02a4      a04:	eb 9f                	jmp    9a5 <snp_cpuid+0x245>
02a6      a06:	45 31 d2             	xor    %r10d,%r10d
02a9      a09:	48 83 e2 fc          	and    $0xfffffffffffffffc,%rdx
02ad      a0d:	bd ea ff ff ff       	mov    $0xffffffea,%ebp
02b2      a12:	49 39 d2             	cmp    %rdx,%r10
02b5      a15:	75 10                	jne    a27 <snp_cpuid+0x2c7>
02b7      a17:	85 c0                	test   %eax,%eax
02b9      a19:	74 0c                	je     a27 <snp_cpuid+0x2c7>
02bb      a1b:	89 43 0c             	mov    %eax,0xc(%rbx)
02be      a1e:	31 ed                	xor    %ebp,%ebp
02c0      a20:	eb 05                	jmp    a27 <snp_cpuid+0x2c7>
02c2      a22:	bd ea ff ff ff       	mov    $0xffffffea,%ebp
02c7      a27:	89 e8                	mov    %ebp,%eax
02c9      a29:	48 83 c4 18          	add    $0x18,%rsp
02cd      a2d:	5b                   	pop    %rbx
02ce      a2e:	41 5e                	pop    %r14
02d0      a30:	5d                   	pop    %rbp
02d1      a31:	c3                   	ret
02d2      a32:	66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 	data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
0000 0000000000000eb0 <snp_cpuid_hv>:
0000      eb0:	49 89 d0             	mov    %rdx,%r8
0003      eb3:	48 85 ff             	test   %rdi,%rdi
0006      eb6:	74 4d                	je     f05 <snp_cpuid_hv+0x55>
0008      eb8:	0f 20 e0             	mov    %cr4,%rax
000b      ebb:	41 8b 08             	mov    (%r8),%ecx
000e      ebe:	ba 3f 00 00 00       	mov    $0x3f,%edx
0013      ec3:	48 0f ab 97 f0 03 00 00 	bts    %rdx,0x3f0(%rdi)
001b      ecb:	48 89 8f f8 01 00 00 	mov    %rcx,0x1f8(%rdi)
0022      ed2:	41 8b 48 04          	mov    0x4(%r8),%ecx
0026      ed6:	ba 61 00 00 00       	mov    $0x61,%edx
002b      edb:	48 0f ab 97 f0 03 00 00 	bts    %rdx,0x3f0(%rdi)
0033      ee3:	48 89 8f 08 03 00 00 	mov    %rcx,0x308(%rdi)
003a      eea:	a9 00 00 04 00       	test   $0x40000,%eax
003f      eef:	75 25                	jne    f16 <snp_cpuid_hv+0x66>
0041      ef1:	b8 7d 00 00 00       	mov    $0x7d,%eax
0046      ef6:	48 0f ab 87 f0 03 00 00 	bts    %rax,0x3f0(%rdi)
004e      efe:	b8 01 00 00 00       	mov    $0x1,%eax
0053      f03:	eb 2c                	jmp    f31 <snp_cpuid_hv+0x81>
0055      f05:	4c 89 c7             	mov    %r8,%rdi
0058      f08:	e8 33 fb ff ff       	call   a40 <__sev_cpuid_hv_msr>
005d      f0d:	85 c0                	test   %eax,%eax
005f      f0f:	0f 85 3e 01 00 00    	jne    1053 <snp_cpuid_hv+0x1a3>
0065      f15:	c3                   	ret
0066      f16:	31 c9                	xor    %ecx,%ecx
0068      f18:	0f 01 d0             	xgetbv
006b      f1b:	48 c1 e2 20          	shl    $0x20,%rdx
006f      f1f:	89 c0                	mov    %eax,%eax
0071      f21:	48 09 d0             	or     %rdx,%rax
0074      f24:	b9 7d 00 00 00       	mov    $0x7d,%ecx
0079      f29:	48 0f ab 8f f0 03 00 00 	bts    %rcx,0x3f0(%rdi)
0081      f31:	48 89 87 e8 03 00 00 	mov    %rax,0x3e8(%rdi)
0088      f38:	0f b7 05 00 00 00 00 	movzwl 0x0(%rip),%eax        # f3f <snp_cpuid_hv+0x8f>	f3b: R_X86_64_PC32	.data..ro_after_init+0x17dc0
008f      f3f:	66 89 87 fa 0f 00 00 	mov    %ax,0xffa(%rdi)
0096      f46:	c7 87 fc 0f 00 00 00 00 00 00 	movl   $0x0,0xffc(%rdi)
00a0      f50:	b8 72 00 00 00       	mov    $0x72,%eax
00a5      f55:	48 0f ab 87 f0 03 00 00 	bts    %rax,0x3f0(%rdi)
00ad      f5d:	48 c7 87 90 03 00 00 72 00 00 00 	movq   $0x72,0x390(%rdi)
00b8      f68:	b8 73 00 00 00       	mov    $0x73,%eax
00bd      f6d:	48 0f ab 87 f0 03 00 00 	bts    %rax,0x3f0(%rdi)
00c5      f75:	48 c7 87 98 03 00 00 00 00 00 00 	movq   $0x0,0x398(%rdi)
00d0      f80:	b8 74 00 00 00       	mov    $0x74,%eax
00d5      f85:	48 0f ab 87 f0 03 00 00 	bts    %rax,0x3f0(%rdi)
00dd      f8d:	48 c7 87 a0 03 00 00 00 00 00 00 	movq   $0x0,0x3a0(%rdi)
00e8      f98:	48 81 ff 00 00 00 80 	cmp    $0xffffffff80000000,%rdi
00ef      f9f:	72 09                	jb     faa <snp_cpuid_hv+0xfa>
00f1      fa1:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # fa8 <snp_cpuid_hv+0xf8>	fa4: R_X86_64_PC32	phys_base-0x4
00f8      fa8:	eb 0e                	jmp    fb8 <snp_cpuid_hv+0x108>
00fa      faa:	48 c7 c0 00 00 00 80 	mov    $0xffffffff80000000,%rax
0101      fb1:	48 2b 05 00 00 00 00 	sub    0x0(%rip),%rax        # fb8 <snp_cpuid_hv+0x108>	fb4: R_X86_64_PC32	page_offset_base-0x4
0108      fb8:	48 01 f8             	add    %rdi,%rax
010b      fbb:	48 2d 00 00 00 80    	sub    $0xffffffff80000000,%rax
0111      fc1:	48 89 c2             	mov    %rax,%rdx
0114      fc4:	48 c1 ea 20          	shr    $0x20,%rdx
0118      fc8:	b9 30 01 01 c0       	mov    $0xc0010130,%ecx
011d      fcd:	0f 30                	wrmsr
011f      fcf:	f3 0f 01 d9          	vmgexit
0123      fd3:	8b 87 98 03 00 00    	mov    0x398(%rdi),%eax
0129      fd9:	85 c0                	test   %eax,%eax
012b      fdb:	74 4b                	je     1028 <snp_cpuid_hv+0x178>
012d      fdd:	83 f8 01             	cmp    $0x1,%eax
0130      fe0:	75 71                	jne    1053 <snp_cpuid_hv+0x1a3>
0132      fe2:	48 8b 87 a0 03 00 00 	mov    0x3a0(%rdi),%rax
0139      fe9:	48 a9 00 00 00 80    	test   $0xffffffff80000000,%rax
013f      fef:	74 62                	je     1053 <snp_cpuid_hv+0x1a3>
0141      ff1:	3c 0d                	cmp    $0xd,%al
0143      ff3:	74 08                	je     ffd <snp_cpuid_hv+0x14d>
0145      ff5:	0f b6 c8             	movzbl %al,%ecx
0148      ff8:	83 f9 06             	cmp    $0x6,%ecx
014b      ffb:	75 56                	jne    1053 <snp_cpuid_hv+0x1a3>
014d      ffd:	89 c1                	mov    %eax,%ecx
014f      fff:	81 e1 00 07 00 00    	and    $0x700,%ecx
0155     1005:	81 f9 00 03 00 00    	cmp    $0x300,%ecx
015b     100b:	75 46                	jne    1053 <snp_cpuid_hv+0x1a3>
015d     100d:	0f b6 c8             	movzbl %al,%ecx
0160     1010:	48 89 4e 78          	mov    %rcx,0x78(%rsi)
0164     1014:	a9 00 08 00 00       	test   $0x800,%eax
0169     1019:	74 38                	je     1053 <snp_cpuid_hv+0x1a3>
016b     101b:	48 c1 e8 20          	shr    $0x20,%rax
016f     101f:	48 89 86 80 00 00 00 	mov    %rax,0x80(%rsi)
0176     1026:	eb 2b                	jmp    1053 <snp_cpuid_hv+0x1a3>
0178     1028:	48 83 bf f0 03 00 00 00 	cmpq   $0x0,0x3f0(%rdi)
0180     1030:	79 21                	jns    1053 <snp_cpuid_hv+0x1a3>
0182     1032:	48 0f ba a7 f8 03 00 00 23 	btq    $0x23,0x3f8(%rdi)
018b     103b:	73 16                	jae    1053 <snp_cpuid_hv+0x1a3>
018d     103d:	48 0f ba a7 f8 03 00 00 21 	btq    $0x21,0x3f8(%rdi)
0196     1046:	73 0b                	jae    1053 <snp_cpuid_hv+0x1a3>
0198     1048:	48 0f ba a7 f8 03 00 00 22 	btq    $0x22,0x3f8(%rdi)
01a1     1051:	72 15                	jb     1068 <snp_cpuid_hv+0x1b8>
01a3     1053:	b9 30 01 01 c0       	mov    $0xc0010130,%ecx
01a8     1058:	b8 00 11 05 00       	mov    $0x51100,%eax
01ad     105d:	31 d2                	xor    %edx,%edx
01af     105f:	0f 30                	wrmsr
01b1     1061:	f3 0f 01 d9          	vmgexit
01b5     1065:	f4                   	hlt
01b6     1066:	eb fd                	jmp    1065 <snp_cpuid_hv+0x1b5>
01b8     1068:	8b 87 f8 01 00 00    	mov    0x1f8(%rdi),%eax
01be     106e:	41 89 40 08          	mov    %eax,0x8(%r8)
01c2     1072:	8b 87 18 03 00 00    	mov    0x318(%rdi),%eax
01c8     1078:	41 89 40 0c          	mov    %eax,0xc(%r8)
01cc     107c:	8b 87 08 03 00 00    	mov    0x308(%rdi),%eax
01d2     1082:	41 89 40 10          	mov    %eax,0x10(%r8)
01d6     1086:	8b 87 10 03 00 00    	mov    0x310(%rdi),%eax
01dc     108c:	41 89 40 14          	mov    %eax,0x14(%r8)
01e0     1090:	c3                   	ret
01e1     1091:	cc                   	int3
01e2     1092:	cc                   	int3
01e3     1093:	cc                   	int3
01e4     1094:	cc                   	int3
01e5     1095:	cc                   	int3
01e6     1096:	cc                   	int3
01e7     1097:	cc                   	int3
01e8     1098:	cc                   	int3
01e9     1099:	cc                   	int3
01ea     109a:	cc                   	int3
01eb     109b:	cc                   	int3
01ec     109c:	cc                   	int3
01ed     109d:	cc                   	int3
01ee     109e:	cc                   	int3
01ef     109f:	cc                   	int3

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
