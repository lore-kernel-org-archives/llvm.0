Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE9A637;
	Sun, 22 Sep 2024 12:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727008806; cv=none; b=XPOIbyT2rJ+SsrOhSgEH9jizwEdtOH+CLpmzERClDjjMPMALpWzjMx0VN5EM2N1iEyjNlmv+GBKNbcNXlxR1dIyLXQpR0U5XgK8Xm1zNWN5WvEDRwXC6LexQnMBRto9heptmK1HS6ZPTIs3LcTL/+H4sFZRzLrYAM+KKCLPlRys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727008806; c=relaxed/simple;
	bh=j3S4QXNY7s0pXS8746qktzBpb04n9Oja/OrXLCwksdM=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UTFfhkWRO+GUX/aHpjhAN53IDt4bJTWCNOofuP7Gsbndd0NM2pyijNkG4P+oAN59eKCVn/kmKFEkaupX6P5uodoeRkU6ZpXgP0HhaVzgEONToh14aqm7PUczTYuRaB8LyIKgc1hRMsOvlmygC5oCX0wya4w2jj0u2Ng6m/VFz64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WdMkGSRQ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WdMkGSRQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727008795; x=1758544795;
  h=date:from:cc:subject:message-id:mime-version;
  bh=j3S4QXNY7s0pXS8746qktzBpb04n9Oja/OrXLCwksdM=;
  b=WdMkGSRQ1cTruxOGuTrW7k36FtLMEW0oTzlGbMEx61/Iz0/ddv7piJZD
   lYx1OjYfQM4XTR5JSaR2p6HAs9SxFutTeZTvztOubpZrn7cMtYKuhx3yP
   X0XMiE5D8Z11dHJd5L6alJVRE5pVFZy/6tgpch7CrabMIv+kNSFsDESHW
   yr4l/mVC7TtEjst2DIfg04rKnkAgFx84Fer/+fYp/FUZta5/6cqCH1rRi
   gUhCWuDxFg/S7tAfOdlxnQFDXIt/pLnvLBJ5xWlcreMN5PCHoKBlRgrzK
   Chek6TNS5CJRY22swuVfvixRdS8o/mn/P/4hvg2MVEobsyYlJ+qLkTysj
   Q==;
X-CSE-ConnectionGUID: C6bN3llJS8uze0/rXGMJAA==
X-CSE-MsgGUID: 8iTgm8KbQlO9DmKm9XR4CA==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="43479916"
X-IronPort-AV: E=Sophos;i="6.10,249,1719903600"; 
   d="scan'208";a="43479916"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2024 05:39:55 -0700
X-CSE-ConnectionGUID: pMz+H5D8SMmFsHTZOjBeDg==
X-CSE-MsgGUID: Le07At+KQLGgUadLnyRaOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,249,1719903600"; 
   d="scan'208";a="75346732"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 22 Sep 2024 05:39:54 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssLsV-000GJm-0N;
	Sun, 22 Sep 2024 12:39:51 +0000
Date: Sun, 22 Sep 2024 20:39:00 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: s5m8767_pmic_probe+0x2f79: unreachable
 instruction
Message-ID: <202409222042.xWn5coUt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Sean Christopherson <seanjc@google.com>
CC: "Borislav Petkov (AMD)" <bp@alien8.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   88264981f2082248e892a706b2c5004650faac54
commit: fe42754b94a42d08cf9501790afc25c4f6a5f631 cpu: Re-enable CPU mitigations by default for !X86 architectures
date:   5 months ago
config: x86_64-randconfig-073-20240921 (https://download.01.org/0day-ci/archive/20240922/202409222042.xWn5coUt-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240922/202409222042.xWn5coUt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409222042.xWn5coUt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: s5m8767_pmic_probe+0x2f79: unreachable instruction

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for FB_IOMEM_HELPERS
   Depends on [n]: HAS_IOMEM [=y] && FB_CORE [=n]
   Selected by [m]:
   - DRM_XE_DISPLAY [=y] && HAS_IOMEM [=y] && DRM_XE [=m] && DRM_XE [=m]=m


objdump-func vmlinux.o s5m8767_pmic_probe:
0000 0000000000000000 <s5m8767_pmic_probe>:
0000        0:	55                   	push   %rbp
0001        1:	41 57                	push   %r15
0003        3:	41 56                	push   %r14
0005        5:	41 55                	push   %r13
0007        7:	41 54                	push   %r12
0009        9:	53                   	push   %rbx
000a        a:	48 81 ec 90 01 00 00 	sub    $0x190,%rsp
0011       11:	49 89 ff             	mov    %rdi,%r15
0014       14:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
001e       1e:	48 8d 5f 50          	lea    0x50(%rdi),%rbx
0022       22:	48 89 d8             	mov    %rbx,%rax
0025       25:	48 c1 e8 03          	shr    $0x3,%rax
0029       29:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
002d       2d:	74 12                	je     41 <s5m8767_pmic_probe+0x41>
002f       2f:	48 89 df             	mov    %rbx,%rdi
0032       32:	e8 00 00 00 00       	call   37 <s5m8767_pmic_probe+0x37>	33: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0037       37:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
0041       41:	48 8b 1b             	mov    (%rbx),%rbx
0044       44:	4c 8d 73 78          	lea    0x78(%rbx),%r14
0048       48:	4c 89 f0             	mov    %r14,%rax
004b       4b:	48 c1 e8 03          	shr    $0x3,%rax
004f       4f:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
0053       53:	74 12                	je     67 <s5m8767_pmic_probe+0x67>
0055       55:	4c 89 f7             	mov    %r14,%rdi
0058       58:	e8 00 00 00 00       	call   5d <s5m8767_pmic_probe+0x5d>	59: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
005d       5d:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
0067       67:	49 8b 06             	mov    (%r14),%rax
006a       6a:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
006f       6f:	4c 8d 70 08          	lea    0x8(%rax),%r14
0073       73:	4c 89 f0             	mov    %r14,%rax
0076       76:	48 c1 e8 03          	shr    $0x3,%rax
007a       7a:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
007e       7e:	74 08                	je     88 <s5m8767_pmic_probe+0x88>
0080       80:	4c 89 f7             	mov    %r14,%rdi
0083       83:	e8 00 00 00 00       	call   88 <s5m8767_pmic_probe+0x88>	84: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0088       88:	4d 8b 36             	mov    (%r14),%r14
008b       8b:	48 8d bc 24 60 01 00 00 	lea    0x160(%rsp),%rdi
0093       93:	ba 30 00 00 00       	mov    $0x30,%edx
0098       98:	31 f6                	xor    %esi,%esi
009a       9a:	e8 00 00 00 00       	call   9f <s5m8767_pmic_probe+0x9f>	9b: R_X86_64_PLT32	__asan_memset-0x4
009f       9f:	4d 85 f6             	test   %r14,%r14
00a2       a2:	0f 84 11 0a 00 00    	je     ab9 <s5m8767_pmic_probe+0xab9>
00a8       a8:	4c 89 f0             	mov    %r14,%rax
00ab       ab:	4c 89 34 24          	mov    %r14,(%rsp)
00af       af:	4c 8b 74 24 60       	mov    0x60(%rsp),%r14
00b4       b4:	4c 89 f0             	mov    %r14,%rax
00b7       b7:	48 c1 e8 03          	shr    $0x3,%rax
00bb       bb:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
00c5       c5:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
00ca       ca:	80 3c 30 00          	cmpb   $0x0,(%rax,%rsi,1)
00ce       ce:	74 12                	je     e2 <s5m8767_pmic_probe+0xe2>
00d0       d0:	4c 89 f7             	mov    %r14,%rdi
00d3       d3:	e8 00 00 00 00       	call   d8 <s5m8767_pmic_probe+0xd8>	d4: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
00d8       d8:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
00e2       e2:	bb b0 03 00 00       	mov    $0x3b0,%ebx
00e7       e7:	49 03 1e             	add    (%r14),%rbx
00ea       ea:	48 89 d8             	mov    %rbx,%rax
00ed       ed:	48 c1 e8 03          	shr    $0x3,%rax
00f1       f1:	80 3c 30 00          	cmpb   $0x0,(%rax,%rsi,1)
00f5       f5:	74 12                	je     109 <s5m8767_pmic_probe+0x109>
00f7       f7:	48 89 df             	mov    %rbx,%rdi
00fa       fa:	e8 00 00 00 00       	call   ff <s5m8767_pmic_probe+0xff>	fb: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
00ff       ff:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
0109      109:	4c 89 7c 24 48       	mov    %r15,0x48(%rsp)
010e      10e:	49 8d 47 10          	lea    0x10(%r15),%rax
0112      112:	48 89 44 24 68       	mov    %rax,0x68(%rsp)
0117      117:	48 8b 1b             	mov    (%rbx),%rbx
011a      11a:	48 85 db             	test   %rbx,%rbx
011d      11d:	0f 84 27 0c 00 00    	je     d4a <s5m8767_pmic_probe+0xd4a>
0123      123:	48 89 df             	mov    %rbx,%rdi
0126      126:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	129: R_X86_64_32S	.rodata..str.15.101074
012d      12d:	e8 00 00 00 00       	call   132 <s5m8767_pmic_probe+0x132>	12e: R_X86_64_PLT32	of_get_child_by_name-0x4
0132      132:	48 85 c0             	test   %rax,%rax
0135      135:	0f 84 b9 24 00 00    	je     25f4 <s5m8767_pmic_probe+0x25f4>
013b      13b:	49 89 c6             	mov    %rax,%r14
013e      13e:	48 89 5c 24 28       	mov    %rbx,0x28(%rsp)
0143      143:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	146: R_X86_64_32S	devtree_lock
014a      14a:	e8 00 00 00 00       	call   14f <s5m8767_pmic_probe+0x14f>	14b: R_X86_64_PLT32	_raw_spin_lock_irqsave-0x4
014f      14f:	48 89 c3             	mov    %rax,%rbx
0152      152:	4c 89 74 24 18       	mov    %r14,0x18(%rsp)
0157      157:	4d 8d 6e 70          	lea    0x70(%r14),%r13
015b      15b:	4d 89 ec             	mov    %r13,%r12
015e      15e:	49 c1 ec 03          	shr    $0x3,%r12
0162      162:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
016c      16c:	41 80 3c 04 00       	cmpb   $0x0,(%r12,%rax,1)
0171      171:	74 08                	je     17b <s5m8767_pmic_probe+0x17b>
0173      173:	4c 89 ef             	mov    %r13,%rdi
0176      176:	e8 00 00 00 00       	call   17b <s5m8767_pmic_probe+0x17b>	177: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
017b      17b:	4d 8b 75 00          	mov    0x0(%r13),%r14
017f      17f:	4d 85 f6             	test   %r14,%r14
0182      182:	0f 84 cc 00 00 00    	je     254 <s5m8767_pmic_probe+0x254>
0188      188:	49 8d be 80 00 00 00 	lea    0x80(%r14),%rdi
018f      18f:	e8 00 00 00 00       	call   194 <s5m8767_pmic_probe+0x194>	190: R_X86_64_PLT32	kobject_get-0x4
0194      194:	bd 01 00 00 00       	mov    $0x1,%ebp
0199      199:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
01a0      1a0:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1a3: R_X86_64_32S	devtree_lock
01a7      1a7:	48 89 de             	mov    %rbx,%rsi
01aa      1aa:	e8 00 00 00 00       	call   1af <s5m8767_pmic_probe+0x1af>	1ab: R_X86_64_PLT32	_raw_spin_unlock_irqrestore-0x4
01af      1af:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1b2: R_X86_64_32S	devtree_lock
01b6      1b6:	e8 00 00 00 00       	call   1bb <s5m8767_pmic_probe+0x1bb>	1b7: R_X86_64_PLT32	_raw_spin_lock_irqsave-0x4
01bb      1bb:	48 89 c3             	mov    %rax,%rbx
01be      1be:	4d 8d 7e 78          	lea    0x78(%r14),%r15
01c2      1c2:	4c 89 f8             	mov    %r15,%rax
01c5      1c5:	48 c1 e8 03          	shr    $0x3,%rax
01c9      1c9:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
01d3      1d3:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
01d7      1d7:	74 08                	je     1e1 <s5m8767_pmic_probe+0x1e1>
01d9      1d9:	4c 89 ff             	mov    %r15,%rdi
01dc      1dc:	e8 00 00 00 00       	call   1e1 <s5m8767_pmic_probe+0x1e1>	1dd: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
01e1      1e1:	4d 8b 3f             	mov    (%r15),%r15
01e4      1e4:	4d 85 ff             	test   %r15,%r15
01e7      1e7:	74 1f                	je     208 <s5m8767_pmic_probe+0x208>
01e9      1e9:	49 8d bf 80 00 00 00 	lea    0x80(%r15),%rdi
01f0      1f0:	e8 00 00 00 00       	call   1f5 <s5m8767_pmic_probe+0x1f5>	1f1: R_X86_64_PLT32	kobject_get-0x4
01f5      1f5:	49 83 ee 80          	sub    $0xffffffffffffff80,%r14
01f9      1f9:	4c 89 f7             	mov    %r14,%rdi
01fc      1fc:	e8 00 00 00 00       	call   201 <s5m8767_pmic_probe+0x201>	1fd: R_X86_64_PLT32	kobject_put-0x4
0201      201:	ff c5                	inc    %ebp
0203      203:	4d 89 fe             	mov    %r15,%r14
0206      206:	eb 98                	jmp    1a0 <s5m8767_pmic_probe+0x1a0>
0208      208:	49 83 ee 80          	sub    $0xffffffffffffff80,%r14
020c      20c:	4c 89 f7             	mov    %r14,%rdi
020f      20f:	e8 00 00 00 00       	call   214 <s5m8767_pmic_probe+0x214>	210: R_X86_64_PLT32	kobject_put-0x4
0214      214:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	217: R_X86_64_32S	devtree_lock
021b      21b:	48 89 de             	mov    %rbx,%rsi
021e      21e:	e8 00 00 00 00       	call   223 <s5m8767_pmic_probe+0x223>	21f: R_X86_64_PLT32	_raw_spin_unlock_irqrestore-0x4
0223      223:	48 8b 04 24          	mov    (%rsp),%rax
0227      227:	4c 8d 70 10          	lea    0x10(%rax),%r14
022b      22b:	4c 89 f0             	mov    %r14,%rax
022e      22e:	48 c1 e8 03          	shr    $0x3,%rax
0232      232:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
023c      23c:	0f b6 04 08          	movzbl (%rax,%rcx,1),%eax
0240      240:	84 c0                	test   %al,%al
0242      242:	0f 85 0c 39 00 00    	jne    3b54 <s5m8767_pmic_probe+0x3b54>
0248      248:	41 89 2e             	mov    %ebp,(%r14)
024b      24b:	85 ed                	test   %ebp,%ebp
024d      24d:	79 42                	jns    291 <s5m8767_pmic_probe+0x291>
024f      24f:	e9 20 05 00 00       	jmp    774 <s5m8767_pmic_probe+0x774>
0254      254:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	257: R_X86_64_32S	devtree_lock
025b      25b:	48 89 de             	mov    %rbx,%rsi
025e      25e:	e8 00 00 00 00       	call   263 <s5m8767_pmic_probe+0x263>	25f: R_X86_64_PLT32	_raw_spin_unlock_irqrestore-0x4
0263      263:	48 8b 04 24          	mov    (%rsp),%rax
0267      267:	4c 8d 70 10          	lea    0x10(%rax),%r14
026b      26b:	4c 89 f0             	mov    %r14,%rax
026e      26e:	48 c1 e8 03          	shr    $0x3,%rax
0272      272:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
027c      27c:	0f b6 04 08          	movzbl (%rax,%rcx,1),%eax
0280      280:	84 c0                	test   %al,%al
0282      282:	0f 85 ed 45 00 00    	jne    4875 <s5m8767_pmic_probe+0x4875>
0288      288:	41 c7 06 00 00 00 00 	movl   $0x0,(%r14)
028f      28f:	31 ed                	xor    %ebp,%ebp
0291      291:	89 ee                	mov    %ebp,%esi
0293      293:	48 c1 e6 05          	shl    $0x5,%rsi
0297      297:	48 8b 7c 24 68       	mov    0x68(%rsp),%rdi
029c      29c:	ba c0 0d 00 00       	mov    $0xdc0,%edx
02a1      2a1:	e8 00 00 00 00       	call   2a6 <s5m8767_pmic_probe+0x2a6>	2a2: R_X86_64_PLT32	devm_kmalloc-0x4
02a6      2a6:	48 89 44 24 70       	mov    %rax,0x70(%rsp)
02ab      2ab:	48 85 c0             	test   %rax,%rax
02ae      2ae:	0f 84 c0 04 00 00    	je     774 <s5m8767_pmic_probe+0x774>
02b4      2b4:	4c 89 f0             	mov    %r14,%rax
02b7      2b7:	48 c1 e8 03          	shr    $0x3,%rax
02bb      2bb:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
02c5      2c5:	0f b6 04 08          	movzbl (%rax,%rcx,1),%eax
02c9      2c9:	84 c0                	test   %al,%al
02cb      2cb:	0f 85 a1 38 00 00    	jne    3b72 <s5m8767_pmic_probe+0x3b72>
02d1      2d1:	41 8b 36             	mov    (%r14),%esi
02d4      2d4:	85 f6                	test   %esi,%esi
02d6      2d6:	0f 88 98 04 00 00    	js     774 <s5m8767_pmic_probe+0x774>
02dc      2dc:	48 c1 e6 03          	shl    $0x3,%rsi
02e0      2e0:	48 8b 7c 24 68       	mov    0x68(%rsp),%rdi
02e5      2e5:	ba c0 0d 00 00       	mov    $0xdc0,%edx
02ea      2ea:	e8 00 00 00 00       	call   2ef <s5m8767_pmic_probe+0x2ef>	2eb: R_X86_64_PLT32	devm_kmalloc-0x4
02ef      2ef:	48 85 c0             	test   %rax,%rax
02f2      2f2:	0f 84 7c 04 00 00    	je     774 <s5m8767_pmic_probe+0x774>
02f8      2f8:	49 89 c7             	mov    %rax,%r15
02fb      2fb:	48 8b 3c 24          	mov    (%rsp),%rdi
02ff      2ff:	48 89 f8             	mov    %rdi,%rax
0302      302:	48 c1 e8 03          	shr    $0x3,%rax
0306      306:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
0310      310:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
0314      314:	74 13                	je     329 <s5m8767_pmic_probe+0x329>
0316      316:	e8 00 00 00 00       	call   31b <s5m8767_pmic_probe+0x31b>	317: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
031b      31b:	48 8b 3c 24          	mov    (%rsp),%rdi
031f      31f:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
0329      329:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
032e      32e:	48 89 07             	mov    %rax,(%rdi)
0331      331:	48 8d 5f 08          	lea    0x8(%rdi),%rbx
0335      335:	48 89 d8             	mov    %rbx,%rax
0338      338:	48 c1 e8 03          	shr    $0x3,%rax
033c      33c:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
0340      340:	74 08                	je     34a <s5m8767_pmic_probe+0x34a>
0342      342:	48 89 df             	mov    %rbx,%rdi
0345      345:	e8 00 00 00 00       	call   34a <s5m8767_pmic_probe+0x34a>	346: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
034a      34a:	4c 89 3b             	mov    %r15,(%rbx)
034d      34d:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	350: R_X86_64_32S	devtree_lock
0354      354:	e8 00 00 00 00       	call   359 <s5m8767_pmic_probe+0x359>	355: R_X86_64_PLT32	_raw_spin_lock_irqsave-0x4
0359      359:	49 89 c6             	mov    %rax,%r14
035c      35c:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0366      366:	41 80 3c 04 00       	cmpb   $0x0,(%r12,%rax,1)
036b      36b:	74 08                	je     375 <s5m8767_pmic_probe+0x375>
036d      36d:	4c 89 ef             	mov    %r13,%rdi
0370      370:	e8 00 00 00 00       	call   375 <s5m8767_pmic_probe+0x375>	371: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0375      375:	49 8b 5d 00          	mov    0x0(%r13),%rbx
0379      379:	48 85 db             	test   %rbx,%rbx
037c      37c:	0f 84 16 04 00 00    	je     798 <s5m8767_pmic_probe+0x798>
0382      382:	4c 89 7c 24 08       	mov    %r15,0x8(%rsp)
0387      387:	48 8d bb 80 00 00 00 	lea    0x80(%rbx),%rdi
038e      38e:	e8 00 00 00 00       	call   393 <s5m8767_pmic_probe+0x393>	38f: R_X86_64_PLT32	kobject_get-0x4
0393      393:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	396: R_X86_64_32S	.data.regulators.101070
039a      39a:	48 c1 e9 03          	shr    $0x3,%rcx
039e      39e:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
03a8      3a8:	48 01 c1             	add    %rax,%rcx
03ab      3ab:	48 89 4c 24 20       	mov    %rcx,0x20(%rsp)
03b0      3b0:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	3b3: R_X86_64_32S	devtree_lock
03b7      3b7:	4c 89 f6             	mov    %r14,%rsi
03ba      3ba:	e8 00 00 00 00       	call   3bf <s5m8767_pmic_probe+0x3bf>	3bb: R_X86_64_PLT32	_raw_spin_unlock_irqrestore-0x4
03bf      3bf:	48 89 5c 24 58       	mov    %rbx,0x58(%rsp)
03c4      3c4:	48 83 c3 10          	add    $0x10,%rbx
03c8      3c8:	48 89 d8             	mov    %rbx,%rax
03cb      3cb:	48 c1 e8 03          	shr    $0x3,%rax
03cf      3cf:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
03d4      3d4:	48 8b 6c 24 20       	mov    0x20(%rsp),%rbp
03d9      3d9:	49 c7 c4 00 00 00 00 	mov    $0x0,%r12	3dc: R_X86_64_32S	.data.regulators.101070
03e0      3e0:	45 31 f6             	xor    %r14d,%r14d
03e3      3e3:	48 89 5c 24 38       	mov    %rbx,0x38(%rsp)
03e8      3e8:	eb 23                	jmp    40d <s5m8767_pmic_probe+0x40d>
03ea      3ea:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
03f0      3f0:	49 ff c6             	inc    %r14
03f3      3f3:	49 81 c4 30 01 00 00 	add    $0x130,%r12
03fa      3fa:	48 83 c5 26          	add    $0x26,%rbp
03fe      3fe:	49 83 fe 25          	cmp    $0x25,%r14
0402      402:	48 8b 5c 24 38       	mov    0x38(%rsp),%rbx
0407      407:	0f 84 5d 02 00 00    	je     66a <s5m8767_pmic_probe+0x66a>
040d      40d:	80 7d 00 00          	cmpb   $0x0,0x0(%rbp)
0411      411:	74 08                	je     41b <s5m8767_pmic_probe+0x41b>
0413      413:	4c 89 e7             	mov    %r12,%rdi
0416      416:	e8 00 00 00 00       	call   41b <s5m8767_pmic_probe+0x41b>	417: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
041b      41b:	4d 8b 3c 24          	mov    (%r12),%r15
041f      41f:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0429      429:	48 8b 4c 24 40       	mov    0x40(%rsp),%rcx
042e      42e:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
0432      432:	74 08                	je     43c <s5m8767_pmic_probe+0x43c>
0434      434:	48 89 df             	mov    %rbx,%rdi
0437      437:	e8 00 00 00 00       	call   43c <s5m8767_pmic_probe+0x43c>	438: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
043c      43c:	4c 8b 2b             	mov    (%rbx),%r13
043f      43f:	4c 89 ef             	mov    %r13,%rdi
0442      442:	be 2f 00 00 00       	mov    $0x2f,%esi
0447      447:	e8 00 00 00 00       	call   44c <s5m8767_pmic_probe+0x44c>	448: R_X86_64_PLT32	strrchr-0x4
044c      44c:	48 8d 58 01          	lea    0x1(%rax),%rbx
0450      450:	48 85 c0             	test   %rax,%rax
0453      453:	49 0f 44 dd          	cmove  %r13,%rbx
0457      457:	48 89 df             	mov    %rbx,%rdi
045a      45a:	be 40 00 00 00       	mov    $0x40,%esi
045f      45f:	e8 00 00 00 00       	call   464 <s5m8767_pmic_probe+0x464>	460: R_X86_64_PLT32	strchrnul-0x4
0464      464:	49 89 c5             	mov    %rax,%r13
0467      467:	49 29 dd             	sub    %rbx,%r13
046a      46a:	4c 89 ff             	mov    %r15,%rdi
046d      46d:	e8 00 00 00 00       	call   472 <s5m8767_pmic_probe+0x472>	46e: R_X86_64_PLT32	strlen-0x4
0472      472:	4c 39 e8             	cmp    %r13,%rax
0475      475:	0f 85 75 ff ff ff    	jne    3f0 <s5m8767_pmic_probe+0x3f0>
047b      47b:	48 89 df             	mov    %rbx,%rdi
047e      47e:	4c 89 fe             	mov    %r15,%rsi
0481      481:	4c 89 ea             	mov    %r13,%rdx
0484      484:	e8 00 00 00 00       	call   489 <s5m8767_pmic_probe+0x489>	485: R_X86_64_PLT32	strncmp-0x4
0489      489:	85 c0                	test   %eax,%eax
048b      48b:	0f 85 5f ff ff ff    	jne    3f0 <s5m8767_pmic_probe+0x3f0>
0491      491:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
0496      496:	48 8d 70 18          	lea    0x18(%rax),%rsi
049a      49a:	48 8b 7c 24 68       	mov    0x68(%rsp),%rdi
049f      49f:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	4a2: R_X86_64_32S	.rodata..str.18.101077
04a6      4a6:	31 c9                	xor    %ecx,%ecx
04a8      4a8:	41 b8 17 00 00 00    	mov    $0x17,%r8d
04ae      4ae:	49 c7 c1 00 00 00 00 	mov    $0x0,%r9	4b1: R_X86_64_32S	.rodata..str.19.101078
04b5      4b5:	e8 00 00 00 00       	call   4ba <s5m8767_pmic_probe+0x4ba>	4b6: R_X86_64_PLT32	devm_fwnode_gpiod_get_index-0x4
04ba      4ba:	48 89 c3             	mov    %rax,%rbx
04bd      4bd:	4c 8b 6c 24 70       	mov    0x70(%rsp),%r13
04c2      4c2:	49 8d 6d 18          	lea    0x18(%r13),%rbp
04c6      4c6:	49 89 ef             	mov    %rbp,%r15
04c9      4c9:	49 c1 ef 03          	shr    $0x3,%r15
04cd      4cd:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
04d7      4d7:	41 80 3c 0f 00       	cmpb   $0x0,(%r15,%rcx,1)
04dc      4dc:	74 12                	je     4f0 <s5m8767_pmic_probe+0x4f0>
04de      4de:	48 89 ef             	mov    %rbp,%rdi
04e1      4e1:	e8 00 00 00 00       	call   4e6 <s5m8767_pmic_probe+0x4e6>	4e2: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
04e6      4e6:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
04f0      4f0:	48 89 5d 00          	mov    %rbx,0x0(%rbp)
04f4      4f4:	48 83 fb fe          	cmp    $0xfffffffffffffffe,%rbx
04f8      4f8:	74 16                	je     510 <s5m8767_pmic_probe+0x510>
04fa      4fa:	48 81 fb 00 f0 ff ff 	cmp    $0xfffffffffffff000,%rbx
0501      501:	76 2e                	jbe    531 <s5m8767_pmic_probe+0x531>
0503      503:	e9 ca 05 00 00       	jmp    ad2 <s5m8767_pmic_probe+0xad2>
0508      508:	0f 1f 84 00 00 00 00 00 	nopl   0x0(%rax,%rax,1)
0510      510:	41 80 3c 0f 00       	cmpb   $0x0,(%r15,%rcx,1)
0515      515:	74 12                	je     529 <s5m8767_pmic_probe+0x529>
0517      517:	48 89 ef             	mov    %rbp,%rdi
051a      51a:	e8 00 00 00 00       	call   51f <s5m8767_pmic_probe+0x51f>	51b: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
051f      51f:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
0529      529:	48 c7 45 00 00 00 00 00 	movq   $0x0,0x0(%rbp)
0531      531:	4c 89 e8             	mov    %r13,%rax
0534      534:	48 c1 e8 03          	shr    $0x3,%rax
0538      538:	0f b6 04 08          	movzbl (%rax,%rcx,1),%eax
053c      53c:	84 c0                	test   %al,%al
053e      53e:	0f 85 c9 01 00 00    	jne    70d <s5m8767_pmic_probe+0x70d>
0544      544:	45 89 75 00          	mov    %r14d,0x0(%r13)
0548      548:	41 83 fe 26          	cmp    $0x26,%r14d
054c      54c:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
0551      551:	48 8b 6c 24 58       	mov    0x58(%rsp),%rbp
0556      556:	0f 83 ed 01 00 00    	jae    749 <s5m8767_pmic_probe+0x749>
055c      55c:	48 8b 7c 24 68       	mov    0x68(%rsp),%rdi
0561      561:	48 89 ee             	mov    %rbp,%rsi
0564      564:	4c 89 e2             	mov    %r12,%rdx
0567      567:	e8 00 00 00 00       	call   56c <s5m8767_pmic_probe+0x56c>	568: R_X86_64_PLT32	of_get_regulator_init_data-0x4
056c      56c:	48 89 c3             	mov    %rax,%rbx
056f      56f:	49 8d 7d 08          	lea    0x8(%r13),%rdi
0573      573:	48 89 f8             	mov    %rdi,%rax
0576      576:	48 c1 e8 03          	shr    $0x3,%rax
057a      57a:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
0584      584:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
0588      588:	74 0f                	je     599 <s5m8767_pmic_probe+0x599>
058a      58a:	e8 00 00 00 00       	call   58f <s5m8767_pmic_probe+0x58f>	58b: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
058f      58f:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
0599      599:	49 89 5d 08          	mov    %rbx,0x8(%r13)
059d      59d:	49 8d 7d 10          	lea    0x10(%r13),%rdi
05a1      5a1:	48 89 f8             	mov    %rdi,%rax
05a4      5a4:	48 c1 e8 03          	shr    $0x3,%rax
05a8      5a8:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
05ac      5ac:	74 0f                	je     5bd <s5m8767_pmic_probe+0x5bd>
05ae      5ae:	e8 00 00 00 00       	call   5b3 <s5m8767_pmic_probe+0x5b3>	5af: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
05b3      5b3:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
05bd      5bd:	49 89 6d 10          	mov    %rbp,0x10(%r13)
05c1      5c1:	4c 89 f8             	mov    %r15,%rax
05c4      5c4:	48 c1 e8 03          	shr    $0x3,%rax
05c8      5c8:	0f b6 04 08          	movzbl (%rax,%rcx,1),%eax
05cc      5cc:	84 c0                	test   %al,%al
05ce      5ce:	0f 85 57 01 00 00    	jne    72b <s5m8767_pmic_probe+0x72b>
05d4      5d4:	45 89 37             	mov    %r14d,(%r15)
05d7      5d7:	4d 8d 77 04          	lea    0x4(%r15),%r14
05db      5db:	b9 01 00 00 00       	mov    $0x1,%ecx
05e0      5e0:	48 89 ef             	mov    %rbp,%rdi
05e3      5e3:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	5e6: R_X86_64_32S	.rodata..str.20.101079
05ea      5ea:	4c 89 f2             	mov    %r14,%rdx
05ed      5ed:	45 31 c0             	xor    %r8d,%r8d
05f0      5f0:	e8 00 00 00 00       	call   5f5 <s5m8767_pmic_probe+0x5f5>	5f1: R_X86_64_PLT32	of_property_read_variable_u32_array-0x4
05f5      5f5:	85 c0                	test   %eax,%eax
05f7      5f7:	0f 88 b5 00 00 00    	js     6b2 <s5m8767_pmic_probe+0x6b2>
05fd      5fd:	49 83 c5 20          	add    $0x20,%r13
0601      601:	49 83 c7 08          	add    $0x8,%r15
0605      605:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	608: R_X86_64_32S	devtree_lock
060c      60c:	e8 00 00 00 00       	call   611 <s5m8767_pmic_probe+0x611>	60d: R_X86_64_PLT32	_raw_spin_lock_irqsave-0x4
0611      611:	49 89 c6             	mov    %rax,%r14
0614      614:	48 8d 5d 78          	lea    0x78(%rbp),%rbx
0618      618:	48 89 d8             	mov    %rbx,%rax
061b      61b:	48 c1 e8 03          	shr    $0x3,%rax
061f      61f:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
0629      629:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
062d      62d:	74 08                	je     637 <s5m8767_pmic_probe+0x637>
062f      62f:	48 89 df             	mov    %rbx,%rdi
0632      632:	e8 00 00 00 00       	call   637 <s5m8767_pmic_probe+0x637>	633: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0637      637:	48 8b 1b             	mov    (%rbx),%rbx
063a      63a:	48 85 db             	test   %rbx,%rbx
063d      63d:	0f 84 49 01 00 00    	je     78c <s5m8767_pmic_probe+0x78c>
0643      643:	4c 89 7c 24 08       	mov    %r15,0x8(%rsp)
0648      648:	4c 89 6c 24 70       	mov    %r13,0x70(%rsp)
064d      64d:	48 8d bb 80 00 00 00 	lea    0x80(%rbx),%rdi
0654      654:	e8 00 00 00 00       	call   659 <s5m8767_pmic_probe+0x659>	655: R_X86_64_PLT32	kobject_get-0x4
0659      659:	48 83 ed 80          	sub    $0xffffffffffffff80,%rbp
065d      65d:	48 89 ef             	mov    %rbp,%rdi
0660      660:	e8 00 00 00 00       	call   665 <s5m8767_pmic_probe+0x665>	661: R_X86_64_PLT32	kobject_put-0x4
0665      665:	e9 46 fd ff ff       	jmp    3b0 <s5m8767_pmic_probe+0x3b0>
066a      66a:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0674      674:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
0679      679:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
067d      67d:	48 8b 5c 24 60       	mov    0x60(%rsp),%rbx
0682      682:	74 08                	je     68c <s5m8767_pmic_probe+0x68c>
0684      684:	48 89 df             	mov    %rbx,%rdi
0687      687:	e8 00 00 00 00       	call   68c <s5m8767_pmic_probe+0x68c>	688: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
068c      68c:	48 8b 3b             	mov    (%rbx),%rdi
068f      68f:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	692: R_X86_64_32S	.rodata..str.17.101076
0696      696:	48 8b 6c 24 58       	mov    0x58(%rsp),%rbp
069b      69b:	48 89 ea             	mov    %rbp,%rdx
069e      69e:	e8 00 00 00 00       	call   6a3 <s5m8767_pmic_probe+0x6a3>	69f: R_X86_64_PLT32	_dev_warn-0x4
06a3      6a3:	4c 8b 6c 24 70       	mov    0x70(%rsp),%r13
06a8      6a8:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
06ad      6ad:	e9 53 ff ff ff       	jmp    605 <s5m8767_pmic_probe+0x605>
06b2      6b2:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
06bc      6bc:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
06c1      6c1:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
06c5      6c5:	74 0a                	je     6d1 <s5m8767_pmic_probe+0x6d1>
06c7      6c7:	48 8b 7c 24 60       	mov    0x60(%rsp),%rdi
06cc      6cc:	e8 00 00 00 00       	call   6d1 <s5m8767_pmic_probe+0x6d1>	6cd: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
06d1      6d1:	48 8b 44 24 60       	mov    0x60(%rsp),%rax
06d6      6d6:	48 8b 38             	mov    (%rax),%rdi
06d9      6d9:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	6dc: R_X86_64_32S	.rodata..str.21.101080
06e0      6e0:	48 89 ea             	mov    %rbp,%rdx
06e3      6e3:	e8 00 00 00 00       	call   6e8 <s5m8767_pmic_probe+0x6e8>	6e4: R_X86_64_PLT32	_dev_warn-0x4
06e8      6e8:	4c 89 f0             	mov    %r14,%rax
06eb      6eb:	48 c1 e8 03          	shr    $0x3,%rax
06ef      6ef:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
06f9      6f9:	0f b6 04 08          	movzbl (%rax,%rcx,1),%eax
06fd      6fd:	84 c0                	test   %al,%al
06ff      6ff:	75 5c                	jne    75d <s5m8767_pmic_probe+0x75d>
0701      701:	41 c7 06 01 00 00 00 	movl   $0x1,(%r14)
0708      708:	e9 f0 fe ff ff       	jmp    5fd <s5m8767_pmic_probe+0x5fd>
070d      70d:	44 89 e9             	mov    %r13d,%ecx
0710      710:	80 e1 07             	and    $0x7,%cl
0713      713:	80 c1 03             	add    $0x3,%cl
0716      716:	38 c1                	cmp    %al,%cl
0718      718:	0f 8c 26 fe ff ff    	jl     544 <s5m8767_pmic_probe+0x544>
071e      71e:	4c 89 ef             	mov    %r13,%rdi
0721      721:	e8 00 00 00 00       	call   726 <s5m8767_pmic_probe+0x726>	722: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
0726      726:	e9 19 fe ff ff       	jmp    544 <s5m8767_pmic_probe+0x544>
072b      72b:	44 89 f9             	mov    %r15d,%ecx
072e      72e:	80 e1 07             	and    $0x7,%cl
0731      731:	80 c1 03             	add    $0x3,%cl
0734      734:	38 c1                	cmp    %al,%cl
0736      736:	0f 8c 98 fe ff ff    	jl     5d4 <s5m8767_pmic_probe+0x5d4>
073c      73c:	4c 89 ff             	mov    %r15,%rdi
073f      73f:	e8 00 00 00 00       	call   744 <s5m8767_pmic_probe+0x744>	740: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
0744      744:	e9 8b fe ff ff       	jmp    5d4 <s5m8767_pmic_probe+0x5d4>
0749      749:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	74c: R_X86_64_32S	.data..Lanon.a908a6475a134ff59edcbee9bcfd235f.4
0750      750:	4c 89 f6             	mov    %r14,%rsi
0753      753:	e8 00 00 00 00       	call   758 <s5m8767_pmic_probe+0x758>	754: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
0758      758:	e9 ff fd ff ff       	jmp    55c <s5m8767_pmic_probe+0x55c>
075d      75d:	44 89 f1             	mov    %r14d,%ecx
0760      760:	80 e1 07             	and    $0x7,%cl
0763      763:	80 c1 03             	add    $0x3,%cl
0766      766:	38 c1                	cmp    %al,%cl
0768      768:	7c 97                	jl     701 <s5m8767_pmic_probe+0x701>
076a      76a:	4c 89 f7             	mov    %r14,%rdi
076d      76d:	e8 00 00 00 00       	call   772 <s5m8767_pmic_probe+0x772>	76e: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
0772      772:	eb 8d                	jmp    701 <s5m8767_pmic_probe+0x701>
0774      774:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
0779      779:	48 83 ef 80          	sub    $0xffffffffffffff80,%rdi
077d      77d:	e8 00 00 00 00       	call   782 <s5m8767_pmic_probe+0x782>	77e: R_X86_64_PLT32	kobject_put-0x4
0782      782:	b8 f4 ff ff ff       	mov    $0xfffffff4,%eax
0787      787:	e9 4c 4e 00 00       	jmp    55d8 <s5m8767_pmic_probe+0x55d8>
078c      78c:	48 83 ed 80          	sub    $0xffffffffffffff80,%rbp
0790      790:	48 89 ef             	mov    %rbp,%rdi
0793      793:	e8 00 00 00 00       	call   798 <s5m8767_pmic_probe+0x798>	794: R_X86_64_PLT32	kobject_put-0x4
0798      798:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	79b: R_X86_64_32S	devtree_lock
079f      79f:	4c 89 f6             	mov    %r14,%rsi
07a2      7a2:	e8 00 00 00 00       	call   7a7 <s5m8767_pmic_probe+0x7a7>	7a3: R_X86_64_PLT32	_raw_spin_unlock_irqrestore-0x4
07a7      7a7:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
07ac      7ac:	48 83 ef 80          	sub    $0xffffffffffffff80,%rdi
07b0      7b0:	e8 00 00 00 00       	call   7b5 <s5m8767_pmic_probe+0x7b5>	7b1: R_X86_64_PLT32	kobject_put-0x4
07b5      7b5:	4c 8b 74 24 28       	mov    0x28(%rsp),%r14
07ba      7ba:	4c 89 f7             	mov    %r14,%rdi
07bd      7bd:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	7c0: R_X86_64_32S	.rodata..str.22.101081
07c4      7c4:	31 d2                	xor    %edx,%edx
07c6      7c6:	e8 00 00 00 00       	call   7cb <s5m8767_pmic_probe+0x7cb>	7c7: R_X86_64_PLT32	of_find_property-0x4
07cb      7cb:	48 85 c0             	test   %rax,%rax
07ce      7ce:	48 8b 5c 24 60       	mov    0x60(%rsp),%rbx
07d3      7d3:	74 4c                	je     821 <s5m8767_pmic_probe+0x821>
07d5      7d5:	48 8b 14 24          	mov    (%rsp),%rdx
07d9      7d9:	48 8d 7a 4c          	lea    0x4c(%rdx),%rdi
07dd      7dd:	48 89 f8             	mov    %rdi,%rax
07e0      7e0:	48 c1 e8 03          	shr    $0x3,%rax
07e4      7e4:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
07ee      7ee:	0f b6 04 08          	movzbl (%rax,%rcx,1),%eax
07f2      7f2:	84 c0                	test   %al,%al
07f4      7f4:	0f 85 ac 4e 00 00    	jne    56a6 <s5m8767_pmic_probe+0x56a6>
07fa      7fa:	c6 42 4c 01          	movb   $0x1,0x4c(%rdx)
07fe      7fe:	48 83 c2 2c          	add    $0x2c,%rdx
0802      802:	b9 08 00 00 00       	mov    $0x8,%ecx
0807      807:	4c 89 f7             	mov    %r14,%rdi
080a      80a:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	80d: R_X86_64_32S	.rodata..str.23.101082
0811      811:	45 31 c0             	xor    %r8d,%r8d
0814      814:	e8 00 00 00 00       	call   819 <s5m8767_pmic_probe+0x819>	815: R_X86_64_PLT32	of_property_read_variable_u32_array-0x4
0819      819:	85 c0                	test   %eax,%eax
081b      81b:	0f 88 db 21 00 00    	js     29fc <s5m8767_pmic_probe+0x29fc>
0821      821:	4c 89 f7             	mov    %r14,%rdi
0824      824:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	827: R_X86_64_32S	.rodata..str.25.101084
082b      82b:	31 d2                	xor    %edx,%edx
082d      82d:	e8 00 00 00 00       	call   832 <s5m8767_pmic_probe+0x832>	82e: R_X86_64_PLT32	of_find_property-0x4
0832      832:	48 85 c0             	test   %rax,%rax
0835      835:	74 4c                	je     883 <s5m8767_pmic_probe+0x883>
0837      837:	48 8b 14 24          	mov    (%rsp),%rdx
083b      83b:	48 8d 7a 70          	lea    0x70(%rdx),%rdi
083f      83f:	48 89 f8             	mov    %rdi,%rax
0842      842:	48 c1 e8 03          	shr    $0x3,%rax
0846      846:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
0850      850:	0f b6 04 08          	movzbl (%rax,%rcx,1),%eax
0854      854:	84 c0                	test   %al,%al
0856      856:	0f 85 65 4e 00 00    	jne    56c1 <s5m8767_pmic_probe+0x56c1>
085c      85c:	c6 42 70 01          	movb   $0x1,0x70(%rdx)
0860      860:	48 83 c2 50          	add    $0x50,%rdx
0864      864:	b9 08 00 00 00       	mov    $0x8,%ecx
0869      869:	4c 89 f7             	mov    %r14,%rdi
086c      86c:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	86f: R_X86_64_32S	.rodata..str.26.101085
0873      873:	45 31 c0             	xor    %r8d,%r8d
0876      876:	e8 00 00 00 00       	call   87b <s5m8767_pmic_probe+0x87b>	877: R_X86_64_PLT32	of_property_read_variable_u32_array-0x4
087b      87b:	85 c0                	test   %eax,%eax
087d      87d:	0f 88 a5 21 00 00    	js     2a28 <s5m8767_pmic_probe+0x2a28>
0883      883:	4c 89 f7             	mov    %r14,%rdi
0886      886:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	889: R_X86_64_32S	.rodata..str.28.101087
088d      88d:	31 d2                	xor    %edx,%edx
088f      88f:	e8 00 00 00 00       	call   894 <s5m8767_pmic_probe+0x894>	890: R_X86_64_PLT32	of_find_property-0x4
0894      894:	48 85 c0             	test   %rax,%rax
0897      897:	4c 8b 34 24          	mov    (%rsp),%r14
089b      89b:	74 51                	je     8ee <s5m8767_pmic_probe+0x8ee>
089d      89d:	49 8d be 94 00 00 00 	lea    0x94(%r14),%rdi
08a4      8a4:	48 89 f8             	mov    %rdi,%rax
08a7      8a7:	48 c1 e8 03          	shr    $0x3,%rax
08ab      8ab:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
08b5      8b5:	0f b6 04 08          	movzbl (%rax,%rcx,1),%eax
08b9      8b9:	84 c0                	test   %al,%al
08bb      8bb:	0f 85 1b 4e 00 00    	jne    56dc <s5m8767_pmic_probe+0x56dc>
08c1      8c1:	41 c6 86 94 00 00 00 01 	movb   $0x1,0x94(%r14)
08c9      8c9:	49 8d 56 74          	lea    0x74(%r14),%rdx
08cd      8cd:	b9 08 00 00 00       	mov    $0x8,%ecx
08d2      8d2:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
08d7      8d7:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	8da: R_X86_64_32S	.rodata..str.29.101088
08de      8de:	45 31 c0             	xor    %r8d,%r8d
08e1      8e1:	e8 00 00 00 00       	call   8e6 <s5m8767_pmic_probe+0x8e6>	8e2: R_X86_64_PLT32	of_property_read_variable_u32_array-0x4
08e6      8e6:	85 c0                	test   %eax,%eax
08e8      8e8:	0f 88 66 21 00 00    	js     2a54 <s5m8767_pmic_probe+0x2a54>
08ee      8ee:	49 8d 5e 4c          	lea    0x4c(%r14),%rbx
08f2      8f2:	48 89 d8             	mov    %rbx,%rax
08f5      8f5:	48 c1 e8 03          	shr    $0x3,%rax
08f9      8f9:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0903      903:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
0907      907:	84 c0                	test   %al,%al
0909      909:	4c 89 f6             	mov    %r14,%rsi
090c      90c:	0f 85 97 4b 00 00    	jne    54a9 <s5m8767_pmic_probe+0x54a9>
0912      912:	80 3b 00             	cmpb   $0x0,(%rbx)
0915      915:	75 3f                	jne    956 <s5m8767_pmic_probe+0x956>
0917      917:	48 8d 5e 70          	lea    0x70(%rsi),%rbx
091b      91b:	48 89 d8             	mov    %rbx,%rax
091e      91e:	48 c1 e8 03          	shr    $0x3,%rax
0922      922:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
0926      926:	84 c0                	test   %al,%al
0928      928:	0f 85 3e 4e 00 00    	jne    576c <s5m8767_pmic_probe+0x576c>
092e      92e:	80 3b 00             	cmpb   $0x0,(%rbx)
0931      931:	75 23                	jne    956 <s5m8767_pmic_probe+0x956>
0933      933:	48 8d 9e 94 00 00 00 	lea    0x94(%rsi),%rbx
093a      93a:	48 89 d8             	mov    %rbx,%rax
093d      93d:	48 c1 e8 03          	shr    $0x3,%rax
0941      941:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
0945      945:	84 c0                	test   %al,%al
0947      947:	0f 85 33 4f 00 00    	jne    5880 <s5m8767_pmic_probe+0x5880>
094d      94d:	80 3b 00             	cmpb   $0x0,(%rbx)
0950      950:	0f 84 d9 01 00 00    	je     b2f <s5m8767_pmic_probe+0xb2f>
0956      956:	31 db                	xor    %ebx,%ebx
0958      958:	4c 8b 74 24 28       	mov    0x28(%rsp),%r14
095d      95d:	4c 89 f7             	mov    %r14,%rdi
0960      960:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	963: R_X86_64_32S	.rodata..str.38.101096
0967      967:	31 d2                	xor    %edx,%edx
0969      969:	e8 00 00 00 00       	call   96e <s5m8767_pmic_probe+0x96e>	96a: R_X86_64_PLT32	of_get_named_gpio-0x4
096e      96e:	85 c0                	test   %eax,%eax
0970      970:	0f 88 3c 20 00 00    	js     29b2 <s5m8767_pmic_probe+0x29b2>
0976      976:	48 8b 0c 24          	mov    (%rsp),%rcx
097a      97a:	48 8d 59 14          	lea    0x14(%rcx),%rbx
097e      97e:	48 89 d9             	mov    %rbx,%rcx
0981      981:	48 c1 e9 03          	shr    $0x3,%rcx
0985      985:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
098f      98f:	0f b6 0c 11          	movzbl (%rcx,%rdx,1),%ecx
0993      993:	84 c9                	test   %cl,%cl
0995      995:	0f 85 36 4b 00 00    	jne    54d1 <s5m8767_pmic_probe+0x54d1>
099b      99b:	89 03                	mov    %eax,(%rbx)
099d      99d:	bb 01 00 00 00       	mov    $0x1,%ebx
09a2      9a2:	4c 89 f7             	mov    %r14,%rdi
09a5      9a5:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	9a8: R_X86_64_32S	.rodata..str.38.101096
09ac      9ac:	ba 01 00 00 00       	mov    $0x1,%edx
09b1      9b1:	e8 00 00 00 00       	call   9b6 <s5m8767_pmic_probe+0x9b6>	9b2: R_X86_64_PLT32	of_get_named_gpio-0x4
09b6      9b6:	85 c0                	test   %eax,%eax
09b8      9b8:	0f 88 f4 1f 00 00    	js     29b2 <s5m8767_pmic_probe+0x29b2>
09be      9be:	48 8b 0c 24          	mov    (%rsp),%rcx
09c2      9c2:	48 8d 59 18          	lea    0x18(%rcx),%rbx
09c6      9c6:	48 89 d9             	mov    %rbx,%rcx
09c9      9c9:	48 c1 e9 03          	shr    $0x3,%rcx
09cd      9cd:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
09d7      9d7:	0f b6 0c 11          	movzbl (%rcx,%rdx,1),%ecx
09db      9db:	84 c9                	test   %cl,%cl
09dd      9dd:	0f 85 0f 4b 00 00    	jne    54f2 <s5m8767_pmic_probe+0x54f2>
09e3      9e3:	89 03                	mov    %eax,(%rbx)
09e5      9e5:	bb 02 00 00 00       	mov    $0x2,%ebx
09ea      9ea:	4c 89 f7             	mov    %r14,%rdi
09ed      9ed:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	9f0: R_X86_64_32S	.rodata..str.38.101096
09f4      9f4:	ba 02 00 00 00       	mov    $0x2,%edx
09f9      9f9:	e8 00 00 00 00       	call   9fe <s5m8767_pmic_probe+0x9fe>	9fa: R_X86_64_PLT32	of_get_named_gpio-0x4
09fe      9fe:	85 c0                	test   %eax,%eax
0a00      a00:	4c 8b 74 24 60       	mov    0x60(%rsp),%r14
0a05      a05:	0f 88 b8 1f 00 00    	js     29c3 <s5m8767_pmic_probe+0x29c3>
0a0b      a0b:	48 8b 34 24          	mov    (%rsp),%rsi
0a0f      a0f:	48 8d 7e 1c          	lea    0x1c(%rsi),%rdi
0a13      a13:	48 89 f9             	mov    %rdi,%rcx
0a16      a16:	48 c1 e9 03          	shr    $0x3,%rcx
0a1a      a1a:	49 bf 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r15
0a24      a24:	42 0f b6 0c 39       	movzbl (%rcx,%r15,1),%ecx
0a29      a29:	84 c9                	test   %cl,%cl
0a2b      a2b:	0f 85 03 4b 00 00    	jne    5534 <s5m8767_pmic_probe+0x5534>
0a31      a31:	89 46 1c             	mov    %eax,0x1c(%rsi)
0a34      a34:	48 8d 9e 98 00 00 00 	lea    0x98(%rsi),%rbx
0a3b      a3b:	b9 01 00 00 00       	mov    $0x1,%ecx
0a40      a40:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
0a45      a45:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	a48: R_X86_64_32S	.rodata..str.31.101090
0a4c      a4c:	48 89 da             	mov    %rbx,%rdx
0a4f      a4f:	45 31 c0             	xor    %r8d,%r8d
0a52      a52:	e8 00 00 00 00       	call   a57 <s5m8767_pmic_probe+0xa57>	a53: R_X86_64_PLT32	of_property_read_variable_u32_array-0x4
0a57      a57:	49 89 de             	mov    %rbx,%r14
0a5a      a5a:	49 c1 ee 03          	shr    $0x3,%r14
0a5e      a5e:	43 0f b6 0c 3e       	movzbl (%r14,%r15,1),%ecx
0a63      a63:	85 c0                	test   %eax,%eax
0a65      a65:	0f 88 b6 00 00 00    	js     b21 <s5m8767_pmic_probe+0xb21>
0a6b      a6b:	84 c9                	test   %cl,%cl
0a6d      a6d:	0f 85 d4 4c 00 00    	jne    5747 <s5m8767_pmic_probe+0x5747>
0a73      a73:	83 3b 08             	cmpl   $0x8,(%rbx)
0a76      a76:	0f 8c b3 00 00 00    	jl     b2f <s5m8767_pmic_probe+0xb2f>
0a7c      a7c:	43 0f b6 04 3e       	movzbl (%r14,%r15,1),%eax
0a81      a81:	84 c0                	test   %al,%al
0a83      a83:	0f 85 43 4f 00 00    	jne    59cc <s5m8767_pmic_probe+0x59cc>
0a89      a89:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
0a8f      a8f:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
0a94      a94:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1)
0a99      a99:	48 8b 5c 24 60       	mov    0x60(%rsp),%rbx
0a9e      a9e:	74 08                	je     aa8 <s5m8767_pmic_probe+0xaa8>
0aa0      aa0:	48 89 df             	mov    %rbx,%rdi
0aa3      aa3:	e8 00 00 00 00       	call   aa8 <s5m8767_pmic_probe+0xaa8>	aa4: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0aa8      aa8:	48 8b 3b             	mov    (%rbx),%rdi
0aab      aab:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	aae: R_X86_64_32S	.rodata..str.32.101091
0ab2      ab2:	e8 00 00 00 00       	call   ab7 <s5m8767_pmic_probe+0xab7>	ab3: R_X86_64_PLT32	_dev_info-0x4
0ab7      ab7:	eb 76                	jmp    b2f <s5m8767_pmic_probe+0xb2f>
0ab9      ab9:	48 89 df             	mov    %rbx,%rdi
0abc      abc:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	abf: R_X86_64_32S	.rodata..str.1.101060
0ac3      ac3:	e8 00 00 00 00       	call   ac8 <s5m8767_pmic_probe+0xac8>	ac4: R_X86_64_PLT32	_dev_err-0x4
0ac8      ac8:	b8 ed ff ff ff       	mov    $0xffffffed,%eax
0acd      acd:	e9 06 4b 00 00       	jmp    55d8 <s5m8767_pmic_probe+0x55d8>
0ad2      ad2:	48 8b 7c 24 58       	mov    0x58(%rsp),%rdi
0ad7      ad7:	48 83 ef 80          	sub    $0xffffffffffffff80,%rdi
0adb      adb:	e8 00 00 00 00       	call   ae0 <s5m8767_pmic_probe+0xae0>	adc: R_X86_64_PLT32	kobject_put-0x4
0ae0      ae0:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
0ae5      ae5:	48 83 ef 80          	sub    $0xffffffffffffff80,%rdi
0ae9      ae9:	e8 00 00 00 00       	call   aee <s5m8767_pmic_probe+0xaee>	aea: R_X86_64_PLT32	kobject_put-0x4
0aee      aee:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
0af8      af8:	41 80 3c 37 00       	cmpb   $0x0,(%r15,%rsi,1)
0afd      afd:	74 12                	je     b11 <s5m8767_pmic_probe+0xb11>
0aff      aff:	48 89 ef             	mov    %rbp,%rdi
0b02      b02:	e8 00 00 00 00       	call   b07 <s5m8767_pmic_probe+0xb07>	b03: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0b07      b07:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
0b11      b11:	8b 45 00             	mov    0x0(%rbp),%eax
0b14      b14:	85 c0                	test   %eax,%eax
0b16      b16:	0f 85 bc 4a 00 00    	jne    55d8 <s5m8767_pmic_probe+0x55d8>
0b1c      b1c:	e9 29 02 00 00       	jmp    d4a <s5m8767_pmic_probe+0xd4a>
0b21      b21:	84 c9                	test   %cl,%cl
0b23      b23:	0f 85 6b 4c 00 00    	jne    5794 <s5m8767_pmic_probe+0x5794>
0b29      b29:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
0b2f      b2f:	31 db                	xor    %ebx,%ebx
0b31      b31:	4c 8b 74 24 28       	mov    0x28(%rsp),%r14
0b36      b36:	4c 89 f7             	mov    %r14,%rdi
0b39      b39:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	b3c: R_X86_64_32S	.rodata..str.40.101098
0b40      b40:	31 d2                	xor    %edx,%edx
0b42      b42:	e8 00 00 00 00       	call   b47 <s5m8767_pmic_probe+0xb47>	b43: R_X86_64_PLT32	of_get_named_gpio-0x4
0b47      b47:	85 c0                	test   %eax,%eax
0b49      b49:	0f 88 3d 1e 00 00    	js     298c <s5m8767_pmic_probe+0x298c>
0b4f      b4f:	48 8b 0c 24          	mov    (%rsp),%rcx
0b53      b53:	48 8d 59 20          	lea    0x20(%rcx),%rbx
0b57      b57:	48 89 d9             	mov    %rbx,%rcx
0b5a      b5a:	48 c1 e9 03          	shr    $0x3,%rcx
0b5e      b5e:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0b68      b68:	0f b6 0c 11          	movzbl (%rcx,%rdx,1),%ecx
0b6c      b6c:	84 c9                	test   %cl,%cl
0b6e      b6e:	0f 85 9f 49 00 00    	jne    5513 <s5m8767_pmic_probe+0x5513>
0b74      b74:	89 03                	mov    %eax,(%rbx)
0b76      b76:	bb 01 00 00 00       	mov    $0x1,%ebx
0b7b      b7b:	4c 89 f7             	mov    %r14,%rdi
0b7e      b7e:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	b81: R_X86_64_32S	.rodata..str.40.101098
0b85      b85:	ba 01 00 00 00       	mov    $0x1,%edx
0b8a      b8a:	e8 00 00 00 00       	call   b8f <s5m8767_pmic_probe+0xb8f>	b8b: R_X86_64_PLT32	of_get_named_gpio-0x4
0b8f      b8f:	85 c0                	test   %eax,%eax
0b91      b91:	0f 88 f5 1d 00 00    	js     298c <s5m8767_pmic_probe+0x298c>
0b97      b97:	48 8b 0c 24          	mov    (%rsp),%rcx
0b9b      b9b:	48 8d 59 24          	lea    0x24(%rcx),%rbx
0b9f      b9f:	48 89 d9             	mov    %rbx,%rcx
0ba2      ba2:	48 c1 e9 03          	shr    $0x3,%rcx
0ba6      ba6:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0bb0      bb0:	0f b6 0c 11          	movzbl (%rcx,%rdx,1),%ecx
0bb4      bb4:	84 c9                	test   %cl,%cl
0bb6      bb6:	0f 85 bf 49 00 00    	jne    557b <s5m8767_pmic_probe+0x557b>
0bbc      bbc:	89 03                	mov    %eax,(%rbx)
0bbe      bbe:	bb 02 00 00 00       	mov    $0x2,%ebx
0bc3      bc3:	4c 89 f7             	mov    %r14,%rdi
0bc6      bc6:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	bc9: R_X86_64_32S	.rodata..str.40.101098
0bcd      bcd:	ba 02 00 00 00       	mov    $0x2,%edx
0bd2      bd2:	e8 00 00 00 00       	call   bd7 <s5m8767_pmic_probe+0xbd7>	bd3: R_X86_64_PLT32	of_get_named_gpio-0x4
0bd7      bd7:	85 c0                	test   %eax,%eax
0bd9      bd9:	0f 88 ad 1d 00 00    	js     298c <s5m8767_pmic_probe+0x298c>
0bdf      bdf:	48 8b 34 24          	mov    (%rsp),%rsi
0be3      be3:	48 8d 7e 28          	lea    0x28(%rsi),%rdi
0be7      be7:	48 89 f9             	mov    %rdi,%rcx
0bea      bea:	48 c1 e9 03          	shr    $0x3,%rcx
0bee      bee:	49 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r14
0bf8      bf8:	42 0f b6 0c 31       	movzbl (%rcx,%r14,1),%ecx
0bfd      bfd:	84 c9                	test   %cl,%cl
0bff      bff:	0f 85 e5 49 00 00    	jne    55ea <s5m8767_pmic_probe+0x55ea>
0c05      c05:	89 46 28             	mov    %eax,0x28(%rsi)
0c08      c08:	4c 8b 7c 24 28       	mov    0x28(%rsp),%r15
0c0d      c0d:	4c 89 ff             	mov    %r15,%rdi
0c10      c10:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	c13: R_X86_64_32S	.rodata..str.33.101092
0c17      c17:	31 d2                	xor    %edx,%edx
0c19      c19:	e8 00 00 00 00       	call   c1e <s5m8767_pmic_probe+0xc1e>	c1a: R_X86_64_PLT32	of_find_property-0x4
0c1e      c1e:	48 8b 14 24          	mov    (%rsp),%rdx
0c22      c22:	48 85 c0             	test   %rax,%rax
0c25      c25:	40 0f 95 c5          	setne  %bpl
0c29      c29:	48 8d 9a a0 00 00 00 	lea    0xa0(%rdx),%rbx
0c30      c30:	49 89 dc             	mov    %rbx,%r12
0c33      c33:	49 c1 ec 03          	shr    $0x3,%r12
0c37      c37:	43 0f b6 04 34       	movzbl (%r12,%r14,1),%eax
0c3c      c3c:	84 c0                	test   %al,%al
0c3e      c3e:	0f 85 c8 49 00 00    	jne    560c <s5m8767_pmic_probe+0x560c>
0c44      c44:	40 88 aa a0 00 00 00 	mov    %bpl,0xa0(%rdx)
0c4b      c4b:	4c 89 ff             	mov    %r15,%rdi
0c4e      c4e:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	c51: R_X86_64_32S	.rodata..str.34.101093
0c55      c55:	31 d2                	xor    %edx,%edx
0c57      c57:	e8 00 00 00 00       	call   c5c <s5m8767_pmic_probe+0xc5c>	c58: R_X86_64_PLT32	of_find_property-0x4
0c5c      c5c:	48 8b 14 24          	mov    (%rsp),%rdx
0c60      c60:	48 85 c0             	test   %rax,%rax
0c63      c63:	40 0f 95 c5          	setne  %bpl
0c67      c67:	4c 8d aa a1 00 00 00 	lea    0xa1(%rdx),%r13
0c6e      c6e:	4c 89 e8             	mov    %r13,%rax
0c71      c71:	4c 89 6c 24 40       	mov    %r13,0x40(%rsp)
0c76      c76:	49 c1 ed 03          	shr    $0x3,%r13
0c7a      c7a:	43 0f b6 44 35 00    	movzbl 0x0(%r13,%r14,1),%eax
0c80      c80:	84 c0                	test   %al,%al
0c82      c82:	0f 85 a2 49 00 00    	jne    562a <s5m8767_pmic_probe+0x562a>
0c88      c88:	40 88 aa a1 00 00 00 	mov    %bpl,0xa1(%rdx)
0c8f      c8f:	4c 89 ff             	mov    %r15,%rdi
0c92      c92:	49 89 d7             	mov    %rdx,%r15
0c95      c95:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	c98: R_X86_64_32S	.rodata..str.35.101094
0c9c      c9c:	31 d2                	xor    %edx,%edx
0c9e      c9e:	e8 00 00 00 00       	call   ca3 <s5m8767_pmic_probe+0xca3>	c9f: R_X86_64_PLT32	of_find_property-0x4
0ca3      ca3:	48 85 c0             	test   %rax,%rax
0ca6      ca6:	40 0f 95 c5          	setne  %bpl
0caa      caa:	49 81 c7 a2 00 00 00 	add    $0xa2,%r15
0cb1      cb1:	4c 89 f9             	mov    %r15,%rcx
0cb4      cb4:	48 c1 e9 03          	shr    $0x3,%rcx
0cb8      cb8:	42 0f b6 0c 31       	movzbl (%rcx,%r14,1),%ecx
0cbd      cbd:	84 c9                	test   %cl,%cl
0cbf      cbf:	4c 89 f6             	mov    %r14,%rsi
0cc2      cc2:	0f 85 85 49 00 00    	jne    564d <s5m8767_pmic_probe+0x564d>
0cc8      cc8:	41 88 2f             	mov    %bpl,(%r15)
0ccb      ccb:	41 0f b6 0c 34       	movzbl (%r12,%rsi,1),%ecx
0cd0      cd0:	84 c9                	test   %cl,%cl
0cd2      cd2:	0f 85 a4 49 00 00    	jne    567c <s5m8767_pmic_probe+0x567c>
0cd8      cd8:	80 3b 00             	cmpb   $0x0,(%rbx)
0cdb      cdb:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
0ce0      ce0:	74 4b                	je     d2d <s5m8767_pmic_probe+0xd2d>
0ce2      ce2:	48 8b 04 24          	mov    (%rsp),%rax
0ce6      ce6:	48 8d 98 9c 00 00 00 	lea    0x9c(%rax),%rbx
0ced      ced:	b9 01 00 00 00       	mov    $0x1,%ecx
0cf2      cf2:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	cf5: R_X86_64_32S	.rodata..str.36.101095
0cf9      cf9:	48 89 da             	mov    %rbx,%rdx
0cfc      cfc:	45 31 c0             	xor    %r8d,%r8d
0cff      cff:	e8 00 00 00 00       	call   d04 <s5m8767_pmic_probe+0xd04>	d00: R_X86_64_PLT32	of_property_read_variable_u32_array-0x4
0d04      d04:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
0d0e      d0e:	85 c0                	test   %eax,%eax
0d10      d10:	79 38                	jns    d4a <s5m8767_pmic_probe+0xd4a>
0d12      d12:	48 89 d8             	mov    %rbx,%rax
0d15      d15:	48 c1 e8 03          	shr    $0x3,%rax
0d19      d19:	0f b6 04 30          	movzbl (%rax,%rsi,1),%eax
0d1d      d1d:	84 c0                	test   %al,%al
0d1f      d1f:	0f 85 f3 4a 00 00    	jne    5818 <s5m8767_pmic_probe+0x5818>
0d25      d25:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
0d2b      d2b:	eb 1d                	jmp    d4a <s5m8767_pmic_probe+0xd4a>
0d2d      d2d:	41 0f b6 4c 35 00    	movzbl 0x0(%r13,%rsi,1),%ecx
0d33      d33:	84 c9                	test   %cl,%cl
0d35      d35:	0f 85 74 4a 00 00    	jne    57af <s5m8767_pmic_probe+0x57af>
0d3b      d3b:	48 8b 4c 24 40       	mov    0x40(%rsp),%rcx
0d40      d40:	80 39 00             	cmpb   $0x0,(%rcx)
0d43      d43:	75 9d                	jne    ce2 <s5m8767_pmic_probe+0xce2>
0d45      d45:	48 85 c0             	test   %rax,%rax
0d48      d48:	75 98                	jne    ce2 <s5m8767_pmic_probe+0xce2>
0d4a      d4a:	4c 8b 34 24          	mov    (%rsp),%r14
0d4e      d4e:	49 8d 6e 4c          	lea    0x4c(%r14),%rbp
0d52      d52:	48 89 e8             	mov    %rbp,%rax
0d55      d55:	48 89 6c 24 40       	mov    %rbp,0x40(%rsp)
0d5a      d5a:	48 c1 ed 03          	shr    $0x3,%rbp
0d5e      d5e:	0f b6 44 35 00       	movzbl 0x0(%rbp,%rsi,1),%eax
0d63      d63:	84 c0                	test   %al,%al
0d65      d65:	0f 85 9b 2d 00 00    	jne    3b06 <s5m8767_pmic_probe+0x3b06>
0d6b      d6b:	41 0f b6 5e 4c       	movzbl 0x4c(%r14),%ebx
0d70      d70:	4d 8d 66 70          	lea    0x70(%r14),%r12
0d74      d74:	4d 89 e5             	mov    %r12,%r13
0d77      d77:	49 c1 ed 03          	shr    $0x3,%r13
0d7b      d7b:	41 0f b6 44 35 00    	movzbl 0x0(%r13,%rsi,1),%eax
0d81      d81:	84 c0                	test   %al,%al
0d83      d83:	0f 85 a6 2d 00 00    	jne    3b2f <s5m8767_pmic_probe+0x3b2f>
0d89      d89:	41 0f b6 04 24       	movzbl (%r12),%eax
0d8e      d8e:	84 db                	test   %bl,%bl
0d90      d90:	74 65                	je     df7 <s5m8767_pmic_probe+0xdf7>
0d92      d92:	84 c0                	test   %al,%al
0d94      d94:	4c 8b 74 24 60       	mov    0x60(%rsp),%r14
0d99      d99:	0f 85 23 48 00 00    	jne    55c2 <s5m8767_pmic_probe+0x55c2>
0d9f      d9f:	48 8b 04 24          	mov    (%rsp),%rax
0da3      da3:	4c 8d b8 94 00 00 00 	lea    0x94(%rax),%r15
0daa      daa:	4c 89 fb             	mov    %r15,%rbx
0dad      dad:	48 c1 eb 03          	shr    $0x3,%rbx
0db1      db1:	0f b6 04 33          	movzbl (%rbx,%rsi,1),%eax
0db5      db5:	84 c0                	test   %al,%al
0db7      db7:	0f 85 d3 2d 00 00    	jne    3b90 <s5m8767_pmic_probe+0x3b90>
0dbd      dbd:	41 80 3f 00          	cmpb   $0x0,(%r15)
0dc1      dc1:	0f 85 fb 47 00 00    	jne    55c2 <s5m8767_pmic_probe+0x55c2>
0dc7      dc7:	41 0f b6 44 35 00    	movzbl 0x0(%r13,%rsi,1),%eax
0dcd      dcd:	84 c0                	test   %al,%al
0dcf      dcf:	0f 85 e0 2d 00 00    	jne    3bb5 <s5m8767_pmic_probe+0x3bb5>
0dd5      dd5:	41 80 3c 24 00       	cmpb   $0x0,(%r12)
0dda      dda:	0f 85 e2 47 00 00    	jne    55c2 <s5m8767_pmic_probe+0x55c2>
0de0      de0:	0f b6 04 33          	movzbl (%rbx,%rsi,1),%eax
0de4      de4:	84 c0                	test   %al,%al
0de6      de6:	0f 85 d9 39 00 00    	jne    47c5 <s5m8767_pmic_probe+0x47c5>
0dec      dec:	41 80 3f 00          	cmpb   $0x0,(%r15)
0df0      df0:	74 42                	je     e34 <s5m8767_pmic_probe+0xe34>
0df2      df2:	e9 cb 47 00 00       	jmp    55c2 <s5m8767_pmic_probe+0x55c2>
0df7      df7:	48 8b 0c 24          	mov    (%rsp),%rcx
0dfb      dfb:	4c 8d b9 94 00 00 00 	lea    0x94(%rcx),%r15
0e02      e02:	84 c0                	test   %al,%al
0e04      e04:	4c 8b 74 24 60       	mov    0x60(%rsp),%r14
0e09      e09:	74 29                	je     e34 <s5m8767_pmic_probe+0xe34>
0e0b      e0b:	4c 89 fb             	mov    %r15,%rbx
0e0e      e0e:	48 c1 eb 03          	shr    $0x3,%rbx
0e12      e12:	0f b6 04 33          	movzbl (%rbx,%rsi,1),%eax
0e16      e16:	84 c0                	test   %al,%al
0e18      e18:	0f 85 38 47 00 00    	jne    5556 <s5m8767_pmic_probe+0x5556>
0e1e      e1e:	41 80 3f 00          	cmpb   $0x0,(%r15)
0e22      e22:	0f 85 9a 47 00 00    	jne    55c2 <s5m8767_pmic_probe+0x55c2>
0e28      e28:	0f b6 04 33          	movzbl (%rbx,%rsi,1),%eax
0e2c      e2c:	84 c0                	test   %al,%al
0e2e      e2e:	0f 85 68 47 00 00    	jne    559c <s5m8767_pmic_probe+0x559c>
0e34      e34:	4c 89 64 24 70       	mov    %r12,0x70(%rsp)
0e39      e39:	be 60 00 00 00       	mov    $0x60,%esi
0e3e      e3e:	48 8b 7c 24 68       	mov    0x68(%rsp),%rdi
0e43      e43:	ba c0 0d 00 00       	mov    $0xdc0,%edx
0e48      e48:	e8 00 00 00 00       	call   e4d <s5m8767_pmic_probe+0xe4d>	e49: R_X86_64_PLT32	devm_kmalloc-0x4
0e4d      e4d:	48 85 c0             	test   %rax,%rax
0e50      e50:	0f 84 83 17 00 00    	je     25d9 <s5m8767_pmic_probe+0x25d9>
0e56      e56:	49 89 c4             	mov    %rax,%r12
0e59      e59:	48 c1 e8 03          	shr    $0x3,%rax
0e5d      e5d:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0e67      e67:	48 89 84 24 e8 00 00 00 	mov    %rax,0xe8(%rsp)
0e6f      e6f:	80 3c 10 00          	cmpb   $0x0,(%rax,%rdx,1)
0e73      e73:	74 12                	je     e87 <s5m8767_pmic_probe+0xe87>
0e75      e75:	4c 89 e7             	mov    %r12,%rdi
0e78      e78:	e8 00 00 00 00       	call   e7d <s5m8767_pmic_probe+0xe7d>	e79: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0e7d      e7d:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0e87      e87:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
0e8c      e8c:	49 89 04 24          	mov    %rax,(%r12)
0e90      e90:	49 8d 5c 24 08       	lea    0x8(%r12),%rbx
0e95      e95:	48 89 d8             	mov    %rbx,%rax
0e98      e98:	48 c1 e8 03          	shr    $0x3,%rax
0e9c      e9c:	48 89 44 24 58       	mov    %rax,0x58(%rsp)
0ea1      ea1:	80 3c 10 00          	cmpb   $0x0,(%rax,%rdx,1)
0ea5      ea5:	74 12                	je     eb9 <s5m8767_pmic_probe+0xeb9>
0ea7      ea7:	48 89 df             	mov    %rbx,%rdi
0eaa      eaa:	e8 00 00 00 00       	call   eaf <s5m8767_pmic_probe+0xeaf>	eab: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0eaf      eaf:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0eb9      eb9:	4c 89 bc 24 90 00 00 00 	mov    %r15,0x90(%rsp)
0ec1      ec1:	48 89 5c 24 38       	mov    %rbx,0x38(%rsp)
0ec6      ec6:	4c 89 33             	mov    %r14,(%rbx)
0ec9      ec9:	48 8b 34 24          	mov    (%rsp),%rsi
0ecd      ecd:	4c 8d 76 10          	lea    0x10(%rsi),%r14
0ed1      ed1:	4c 89 f0             	mov    %r14,%rax
0ed4      ed4:	48 c1 e8 03          	shr    $0x3,%rax
0ed8      ed8:	48 89 84 24 18 01 00 00 	mov    %rax,0x118(%rsp)
0ee0      ee0:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
0ee4      ee4:	84 c0                	test   %al,%al
0ee6      ee6:	0f 85 ee 2c 00 00    	jne    3bda <s5m8767_pmic_probe+0x3bda>
0eec      eec:	41 8b 1e             	mov    (%r14),%ebx
0eef      eef:	4d 8d 7c 24 10       	lea    0x10(%r12),%r15
0ef4      ef4:	4c 89 f8             	mov    %r15,%rax
0ef7      ef7:	48 c1 e8 03          	shr    $0x3,%rax
0efb      efb:	48 89 84 24 58 01 00 00 	mov    %rax,0x158(%rsp)
0f03      f03:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
0f07      f07:	84 c0                	test   %al,%al
0f09      f09:	0f 85 f7 2c 00 00    	jne    3c06 <s5m8767_pmic_probe+0x3c06>
0f0f      f0f:	41 89 1f             	mov    %ebx,(%r15)
0f12      f12:	48 8b 5c 24 48       	mov    0x48(%rsp),%rbx
0f17      f17:	48 81 c3 88 00 00 00 	add    $0x88,%rbx
0f1e      f1e:	48 89 d8             	mov    %rbx,%rax
0f21      f21:	48 c1 e8 03          	shr    $0x3,%rax
0f25      f25:	80 3c 10 00          	cmpb   $0x0,(%rax,%rdx,1)
0f29      f29:	74 16                	je     f41 <s5m8767_pmic_probe+0xf41>
0f2b      f2b:	48 89 df             	mov    %rbx,%rdi
0f2e      f2e:	e8 00 00 00 00       	call   f33 <s5m8767_pmic_probe+0xf33>	f2f: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0f33      f33:	48 8b 34 24          	mov    (%rsp),%rsi
0f37      f37:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0f41      f41:	4c 89 23             	mov    %r12,(%rbx)
0f44      f44:	48 8d 9e 98 00 00 00 	lea    0x98(%rsi),%rbx
0f4b      f4b:	48 89 d8             	mov    %rbx,%rax
0f4e      f4e:	48 c1 e8 03          	shr    $0x3,%rax
0f52      f52:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
0f56      f56:	84 c0                	test   %al,%al
0f58      f58:	0f 85 d4 2c 00 00    	jne    3c32 <s5m8767_pmic_probe+0x3c32>
0f5e      f5e:	8b 1b                	mov    (%rbx),%ebx
0f60      f60:	49 8d 7c 24 5c       	lea    0x5c(%r12),%rdi
0f65      f65:	48 89 f8             	mov    %rdi,%rax
0f68      f68:	48 c1 e8 03          	shr    $0x3,%rax
0f6c      f6c:	48 89 84 24 c8 00 00 00 	mov    %rax,0xc8(%rsp)
0f74      f74:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
0f78      f78:	84 c0                	test   %al,%al
0f7a      f7a:	48 89 f9             	mov    %rdi,%rcx
0f7d      f7d:	48 89 7c 24 30       	mov    %rdi,0x30(%rsp)
0f82      f82:	0f 85 d5 2c 00 00    	jne    3c5d <s5m8767_pmic_probe+0x3c5d>
0f88      f88:	89 1f                	mov    %ebx,(%rdi)
0f8a      f8a:	0f b6 44 15 00       	movzbl 0x0(%rbp,%rdx,1),%eax
0f8f      f8f:	84 c0                	test   %al,%al
0f91      f91:	0f 85 fb 2c 00 00    	jne    3c92 <s5m8767_pmic_probe+0x3c92>
0f97      f97:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
0f9c      f9c:	0f b6 18             	movzbl (%rax),%ebx
0f9f      f9f:	49 8d 7c 24 27       	lea    0x27(%r12),%rdi
0fa4      fa4:	48 89 f8             	mov    %rdi,%rax
0fa7      fa7:	48 c1 e8 03          	shr    $0x3,%rax
0fab      fab:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
0fb0      fb0:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
0fb4      fb4:	84 c0                	test   %al,%al
0fb6      fb6:	48 89 7c 24 18       	mov    %rdi,0x18(%rsp)
0fbb      fbb:	0f 85 fe 2c 00 00    	jne    3cbf <s5m8767_pmic_probe+0x3cbf>
0fc1      fc1:	88 1f                	mov    %bl,(%rdi)
0fc3      fc3:	41 0f b6 44 15 00    	movzbl 0x0(%r13,%rdx,1),%eax
0fc9      fc9:	84 c0                	test   %al,%al
0fcb      fcb:	0f 85 1d 2d 00 00    	jne    3cee <s5m8767_pmic_probe+0x3cee>
0fd1      fd1:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
0fd6      fd6:	0f b6 18             	movzbl (%rax),%ebx
0fd9      fd9:	49 8d 7c 24 28       	lea    0x28(%r12),%rdi
0fde      fde:	48 89 f8             	mov    %rdi,%rax
0fe1      fe1:	48 c1 e8 03          	shr    $0x3,%rax
0fe5      fe5:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
0fea      fea:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
0fee      fee:	84 c0                	test   %al,%al
0ff0      ff0:	48 89 7c 24 20       	mov    %rdi,0x20(%rsp)
0ff5      ff5:	0f 85 20 2d 00 00    	jne    3d1b <s5m8767_pmic_probe+0x3d1b>
0ffb      ffb:	4c 89 bc 24 08 01 00 00 	mov    %r15,0x108(%rsp)
1003     1003:	4c 89 b4 24 e0 00 00 00 	mov    %r14,0xe0(%rsp)
100b     100b:	88 1f                	mov    %bl,(%rdi)
100d     100d:	48 8b 9c 24 90 00 00 00 	mov    0x90(%rsp),%rbx
1015     1015:	48 89 d8             	mov    %rbx,%rax
1018     1018:	48 c1 e8 03          	shr    $0x3,%rax
101c     101c:	48 89 84 24 d0 00 00 00 	mov    %rax,0xd0(%rsp)
1024     1024:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
1028     1028:	84 c0                	test   %al,%al
102a     102a:	0f 85 15 2d 00 00    	jne    3d45 <s5m8767_pmic_probe+0x3d45>
1030     1030:	0f b6 1b             	movzbl (%rbx),%ebx
1033     1033:	49 8d 7c 24 29       	lea    0x29(%r12),%rdi
1038     1038:	49 89 ff             	mov    %rdi,%r15
103b     103b:	49 c1 ef 03          	shr    $0x3,%r15
103f     103f:	41 0f b6 04 17       	movzbl (%r15,%rdx,1),%eax
1044     1044:	84 c0                	test   %al,%al
1046     1046:	48 89 7c 24 08       	mov    %rdi,0x8(%rsp)
104b     104b:	0f 85 1c 2d 00 00    	jne    3d6d <s5m8767_pmic_probe+0x3d6d>
1051     1051:	88 1f                	mov    %bl,(%rdi)
1053     1053:	48 8d 5e 14          	lea    0x14(%rsi),%rbx
1057     1057:	48 89 d8             	mov    %rbx,%rax
105a     105a:	48 c1 e8 03          	shr    $0x3,%rax
105e     105e:	48 89 84 24 80 00 00 00 	mov    %rax,0x80(%rsp)
1066     1066:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
106a     106a:	84 c0                	test   %al,%al
106c     106c:	0f 85 25 2d 00 00    	jne    3d97 <s5m8767_pmic_probe+0x3d97>
1072     1072:	48 89 9c 24 88 00 00 00 	mov    %rbx,0x88(%rsp)
107a     107a:	44 8b 33             	mov    (%rbx),%r14d
107d     107d:	49 8d 5c 24 44       	lea    0x44(%r12),%rbx
1082     1082:	48 89 d8             	mov    %rbx,%rax
1085     1085:	48 c1 e8 03          	shr    $0x3,%rax
1089     1089:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
108d     108d:	84 c0                	test   %al,%al
108f     108f:	0f 85 2d 2d 00 00    	jne    3dc2 <s5m8767_pmic_probe+0x3dc2>
1095     1095:	44 89 33             	mov    %r14d,(%rbx)
1098     1098:	48 8d 7e 18          	lea    0x18(%rsi),%rdi
109c     109c:	48 89 f8             	mov    %rdi,%rax
109f     109f:	48 c1 e8 03          	shr    $0x3,%rax
10a3     10a3:	48 89 84 24 d8 00 00 00 	mov    %rax,0xd8(%rsp)
10ab     10ab:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
10af     10af:	84 c0                	test   %al,%al
10b1     10b1:	48 89 7c 24 78       	mov    %rdi,0x78(%rsp)
10b6     10b6:	0f 85 31 2d 00 00    	jne    3ded <s5m8767_pmic_probe+0x3ded>
10bc     10bc:	44 8b 37             	mov    (%rdi),%r14d
10bf     10bf:	49 8d 5c 24 48       	lea    0x48(%r12),%rbx
10c4     10c4:	48 89 d8             	mov    %rbx,%rax
10c7     10c7:	48 c1 e8 03          	shr    $0x3,%rax
10cb     10cb:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
10cf     10cf:	84 c0                	test   %al,%al
10d1     10d1:	0f 85 48 2d 00 00    	jne    3e1f <s5m8767_pmic_probe+0x3e1f>
10d7     10d7:	44 89 33             	mov    %r14d,(%rbx)
10da     10da:	48 8d 5e 1c          	lea    0x1c(%rsi),%rbx
10de     10de:	48 89 d8             	mov    %rbx,%rax
10e1     10e1:	48 c1 e8 03          	shr    $0x3,%rax
10e5     10e5:	48 89 84 24 f0 00 00 00 	mov    %rax,0xf0(%rsp)
10ed     10ed:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
10f1     10f1:	84 c0                	test   %al,%al
10f3     10f3:	0f 85 51 2d 00 00    	jne    3e4a <s5m8767_pmic_probe+0x3e4a>
10f9     10f9:	48 89 9c 24 b0 00 00 00 	mov    %rbx,0xb0(%rsp)
1101     1101:	44 8b 33             	mov    (%rbx),%r14d
1104     1104:	49 8d 5c 24 4c       	lea    0x4c(%r12),%rbx
1109     1109:	48 89 d8             	mov    %rbx,%rax
110c     110c:	48 c1 e8 03          	shr    $0x3,%rax
1110     1110:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
1114     1114:	84 c0                	test   %al,%al
1116     1116:	0f 85 59 2d 00 00    	jne    3e75 <s5m8767_pmic_probe+0x3e75>
111c     111c:	44 89 33             	mov    %r14d,(%rbx)
111f     111f:	48 8d 7e 20          	lea    0x20(%rsi),%rdi
1123     1123:	48 89 f8             	mov    %rdi,%rax
1126     1126:	48 c1 e8 03          	shr    $0x3,%rax
112a     112a:	48 89 84 24 28 01 00 00 	mov    %rax,0x128(%rsp)
1132     1132:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
1136     1136:	84 c0                	test   %al,%al
1138     1138:	48 89 7c 24 50       	mov    %rdi,0x50(%rsp)
113d     113d:	0f 85 5d 2d 00 00    	jne    3ea0 <s5m8767_pmic_probe+0x3ea0>
1143     1143:	44 8b 37             	mov    (%rdi),%r14d
1146     1146:	49 8d 5c 24 50       	lea    0x50(%r12),%rbx
114b     114b:	48 89 d8             	mov    %rbx,%rax
114e     114e:	48 c1 e8 03          	shr    $0x3,%rax
1152     1152:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
1156     1156:	84 c0                	test   %al,%al
1158     1158:	0f 85 74 2d 00 00    	jne    3ed2 <s5m8767_pmic_probe+0x3ed2>
115e     115e:	44 89 33             	mov    %r14d,(%rbx)
1161     1161:	48 8d 5e 24          	lea    0x24(%rsi),%rbx
1165     1165:	48 89 d8             	mov    %rbx,%rax
1168     1168:	48 c1 e8 03          	shr    $0x3,%rax
116c     116c:	48 89 84 24 20 01 00 00 	mov    %rax,0x120(%rsp)
1174     1174:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
1178     1178:	84 c0                	test   %al,%al
117a     117a:	0f 85 7d 2d 00 00    	jne    3efd <s5m8767_pmic_probe+0x3efd>
1180     1180:	48 89 9c 24 00 01 00 00 	mov    %rbx,0x100(%rsp)
1188     1188:	44 8b 33             	mov    (%rbx),%r14d
118b     118b:	49 8d 5c 24 54       	lea    0x54(%r12),%rbx
1190     1190:	48 89 d8             	mov    %rbx,%rax
1193     1193:	48 c1 e8 03          	shr    $0x3,%rax
1197     1197:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
119b     119b:	84 c0                	test   %al,%al
119d     119d:	0f 85 85 2d 00 00    	jne    3f28 <s5m8767_pmic_probe+0x3f28>
11a3     11a3:	44 89 33             	mov    %r14d,(%rbx)
11a6     11a6:	48 8d 5e 28          	lea    0x28(%rsi),%rbx
11aa     11aa:	48 89 d8             	mov    %rbx,%rax
11ad     11ad:	48 c1 e8 03          	shr    $0x3,%rax
11b1     11b1:	48 89 84 24 10 01 00 00 	mov    %rax,0x110(%rsp)
11b9     11b9:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
11bd     11bd:	84 c0                	test   %al,%al
11bf     11bf:	0f 85 8e 2d 00 00    	jne    3f53 <s5m8767_pmic_probe+0x3f53>
11c5     11c5:	48 89 9c 24 c0 00 00 00 	mov    %rbx,0xc0(%rsp)
11cd     11cd:	44 8b 33             	mov    (%rbx),%r14d
11d0     11d0:	49 8d 5c 24 58       	lea    0x58(%r12),%rbx
11d5     11d5:	48 89 d8             	mov    %rbx,%rax
11d8     11d8:	48 c1 e8 03          	shr    $0x3,%rax
11dc     11dc:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
11e0     11e0:	84 c0                	test   %al,%al
11e2     11e2:	0f 85 96 2d 00 00    	jne    3f7e <s5m8767_pmic_probe+0x3f7e>
11e8     11e8:	44 89 33             	mov    %r14d,(%rbx)
11eb     11eb:	48 8d 9e 9c 00 00 00 	lea    0x9c(%rsi),%rbx
11f2     11f2:	48 89 d8             	mov    %rbx,%rax
11f5     11f5:	48 c1 e8 03          	shr    $0x3,%rax
11f9     11f9:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
11fd     11fd:	84 c0                	test   %al,%al
11ff     11ff:	0f 85 a4 2d 00 00    	jne    3fa9 <s5m8767_pmic_probe+0x3fa9>
1205     1205:	8b 1b                	mov    (%rbx),%ebx
1207     1207:	49 8d 7c 24 20       	lea    0x20(%r12),%rdi
120c     120c:	48 89 f8             	mov    %rdi,%rax
120f     120f:	48 c1 e8 03          	shr    $0x3,%rax
1213     1213:	48 89 84 24 30 01 00 00 	mov    %rax,0x130(%rsp)
121b     121b:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
121f     121f:	84 c0                	test   %al,%al
1221     1221:	4c 8b 74 24 60       	mov    0x60(%rsp),%r14
1226     1226:	48 89 f9             	mov    %rdi,%rcx
1229     1229:	48 89 bc 24 b8 00 00 00 	mov    %rdi,0xb8(%rsp)
1231     1231:	0f 85 9d 2d 00 00    	jne    3fd4 <s5m8767_pmic_probe+0x3fd4>
1237     1237:	89 1f                	mov    %ebx,(%rdi)
1239     1239:	48 8d 9e a0 00 00 00 	lea    0xa0(%rsi),%rbx
1240     1240:	48 89 d8             	mov    %rbx,%rax
1243     1243:	48 c1 e8 03          	shr    $0x3,%rax
1247     1247:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
124b     124b:	84 c0                	test   %al,%al
124d     124d:	0f 85 bf 2d 00 00    	jne    4012 <s5m8767_pmic_probe+0x4012>
1253     1253:	0f b6 1b             	movzbl (%rbx),%ebx
1256     1256:	49 8d 7c 24 24       	lea    0x24(%r12),%rdi
125b     125b:	48 89 f8             	mov    %rdi,%rax
125e     125e:	48 c1 e8 03          	shr    $0x3,%rax
1262     1262:	48 89 84 24 40 01 00 00 	mov    %rax,0x140(%rsp)
126a     126a:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
126e     126e:	84 c0                	test   %al,%al
1270     1270:	48 89 f9             	mov    %rdi,%rcx
1273     1273:	48 89 bc 24 a8 00 00 00 	mov    %rdi,0xa8(%rsp)
127b     127b:	0f 85 b9 2d 00 00    	jne    403a <s5m8767_pmic_probe+0x403a>
1281     1281:	88 1f                	mov    %bl,(%rdi)
1283     1283:	48 8d 9e a1 00 00 00 	lea    0xa1(%rsi),%rbx
128a     128a:	48 89 d8             	mov    %rbx,%rax
128d     128d:	48 c1 e8 03          	shr    $0x3,%rax
1291     1291:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
1295     1295:	84 c0                	test   %al,%al
1297     1297:	0f 85 d8 2d 00 00    	jne    4075 <s5m8767_pmic_probe+0x4075>
129d     129d:	0f b6 1b             	movzbl (%rbx),%ebx
12a0     12a0:	49 8d 7c 24 25       	lea    0x25(%r12),%rdi
12a5     12a5:	48 89 f8             	mov    %rdi,%rax
12a8     12a8:	48 c1 e8 03          	shr    $0x3,%rax
12ac     12ac:	48 89 84 24 38 01 00 00 	mov    %rax,0x138(%rsp)
12b4     12b4:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
12b8     12b8:	84 c0                	test   %al,%al
12ba     12ba:	48 89 f9             	mov    %rdi,%rcx
12bd     12bd:	48 89 bc 24 a0 00 00 00 	mov    %rdi,0xa0(%rsp)
12c5     12c5:	0f 85 d2 2d 00 00    	jne    409d <s5m8767_pmic_probe+0x409d>
12cb     12cb:	88 1f                	mov    %bl,(%rdi)
12cd     12cd:	48 8d 9e a2 00 00 00 	lea    0xa2(%rsi),%rbx
12d4     12d4:	48 89 d8             	mov    %rbx,%rax
12d7     12d7:	48 c1 e8 03          	shr    $0x3,%rax
12db     12db:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
12df     12df:	84 c0                	test   %al,%al
12e1     12e1:	0f 85 f1 2d 00 00    	jne    40d8 <s5m8767_pmic_probe+0x40d8>
12e7     12e7:	0f b6 1b             	movzbl (%rbx),%ebx
12ea     12ea:	49 8d 7c 24 26       	lea    0x26(%r12),%rdi
12ef     12ef:	48 89 f8             	mov    %rdi,%rax
12f2     12f2:	48 c1 e8 03          	shr    $0x3,%rax
12f6     12f6:	48 89 84 24 f8 00 00 00 	mov    %rax,0xf8(%rsp)
12fe     12fe:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
1302     1302:	84 c0                	test   %al,%al
1304     1304:	48 89 f9             	mov    %rdi,%rcx
1307     1307:	48 89 bc 24 98 00 00 00 	mov    %rdi,0x98(%rsp)
130f     130f:	0f 85 eb 2d 00 00    	jne    4100 <s5m8767_pmic_probe+0x4100>
1315     1315:	88 1f                	mov    %bl,(%rdi)
1317     1317:	48 8d 5e 08          	lea    0x8(%rsi),%rbx
131b     131b:	48 89 d8             	mov    %rbx,%rax
131e     131e:	48 c1 e8 03          	shr    $0x3,%rax
1322     1322:	80 3c 10 00          	cmpb   $0x0,(%rax,%rdx,1)
1326     1326:	74 16                	je     133e <s5m8767_pmic_probe+0x133e>
1328     1328:	48 89 df             	mov    %rbx,%rdi
132b     132b:	e8 00 00 00 00       	call   1330 <s5m8767_pmic_probe+0x1330>	132c: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1330     1330:	48 8b 34 24          	mov    (%rsp),%rsi
1334     1334:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
133e     133e:	48 8b 1b             	mov    (%rbx),%rbx
1341     1341:	49 8d 44 24 18       	lea    0x18(%r12),%rax
1346     1346:	48 89 c1             	mov    %rax,%rcx
1349     1349:	48 c1 e9 03          	shr    $0x3,%rcx
134d     134d:	48 89 8c 24 50 01 00 00 	mov    %rcx,0x150(%rsp)
1355     1355:	80 3c 11 00          	cmpb   $0x0,(%rcx,%rdx,1)
1359     1359:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
135e     135e:	74 1d                	je     137d <s5m8767_pmic_probe+0x137d>
1360     1360:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
1365     1365:	e8 00 00 00 00       	call   136a <s5m8767_pmic_probe+0x136a>	1366: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
136a     136a:	48 8b 44 24 48       	mov    0x48(%rsp),%rax
136f     136f:	48 8b 34 24          	mov    (%rsp),%rsi
1373     1373:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
137d     137d:	48 89 18             	mov    %rbx,(%rax)
1380     1380:	48 8d 9e a4 00 00 00 	lea    0xa4(%rsi),%rbx
1387     1387:	48 89 d8             	mov    %rbx,%rax
138a     138a:	48 c1 e8 03          	shr    $0x3,%rax
138e     138e:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
1392     1392:	84 c0                	test   %al,%al
1394     1394:	0f 85 a1 2d 00 00    	jne    413b <s5m8767_pmic_probe+0x413b>
139a     139a:	8b 03                	mov    (%rbx),%eax
139c     139c:	bb ea ff ff ff       	mov    $0xffffffea,%ebx
13a1     13a1:	3d 00 6a 18 00       	cmp    $0x186a00,%eax
13a6     13a6:	7f 20                	jg     13c8 <s5m8767_pmic_probe+0x13c8>
13a8     13a8:	3d c1 27 09 00       	cmp    $0x927c1,%eax
13ad     13ad:	b9 c0 27 09 00       	mov    $0x927c0,%ecx
13b2     13b2:	0f 4d c8             	cmovge %eax,%ecx
13b5     13b5:	81 c1 a9 f0 f6 ff    	add    $0xfff6f0a9,%ecx
13bb     13bb:	d1 e9                	shr    %ecx
13bd     13bd:	48 69 d9 89 b5 f8 14 	imul   $0x14f8b589,%rcx,%rbx
13c4     13c4:	48 c1 eb 28          	shr    $0x28,%rbx
13c8     13c8:	49 83 c6 10          	add    $0x10,%r14
13cc     13cc:	4c 89 f0             	mov    %r14,%rax
13cf     13cf:	48 c1 e8 03          	shr    $0x3,%rax
13d3     13d3:	48 89 84 24 48 01 00 00 	mov    %rax,0x148(%rsp)
13db     13db:	80 3c 10 00          	cmpb   $0x0,(%rax,%rdx,1)
13df     13df:	74 08                	je     13e9 <s5m8767_pmic_probe+0x13e9>
13e1     13e1:	4c 89 f7             	mov    %r14,%rdi
13e4     13e4:	e8 00 00 00 00       	call   13e9 <s5m8767_pmic_probe+0x13e9>	13e5: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
13e9     13e9:	49 8b 3e             	mov    (%r14),%rdi
13ec     13ec:	be 36 00 00 00       	mov    $0x36,%esi
13f1     13f1:	89 da                	mov    %ebx,%edx
13f3     13f3:	e8 00 00 00 00       	call   13f8 <s5m8767_pmic_probe+0x13f8>	13f4: R_X86_64_PLT32	regmap_write-0x4
13f8     13f8:	48 8b 04 24          	mov    (%rsp),%rax
13fc     13fc:	48 8d 98 a8 00 00 00 	lea    0xa8(%rax),%rbx
1403     1403:	48 89 d8             	mov    %rbx,%rax
1406     1406:	48 c1 e8 03          	shr    $0x3,%rax
140a     140a:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
1414     1414:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
1418     1418:	84 c0                	test   %al,%al
141a     141a:	0f 85 42 2d 00 00    	jne    4162 <s5m8767_pmic_probe+0x4162>
1420     1420:	8b 03                	mov    (%rbx),%eax
1422     1422:	bb ea ff ff ff       	mov    $0xffffffea,%ebx
1427     1427:	3d 00 6a 18 00       	cmp    $0x186a00,%eax
142c     142c:	7f 20                	jg     144e <s5m8767_pmic_probe+0x144e>
142e     142e:	3d c1 27 09 00       	cmp    $0x927c1,%eax
1433     1433:	b9 c0 27 09 00       	mov    $0x927c0,%ecx
1438     1438:	0f 4d c8             	cmovge %eax,%ecx
143b     143b:	81 c1 a9 f0 f6 ff    	add    $0xfff6f0a9,%ecx
1441     1441:	d1 e9                	shr    %ecx
1443     1443:	48 69 d9 89 b5 f8 14 	imul   $0x14f8b589,%rcx,%rbx
144a     144a:	48 c1 eb 28          	shr    $0x28,%rbx
144e     144e:	4c 89 74 24 60       	mov    %r14,0x60(%rsp)
1453     1453:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
1458     1458:	80 3c 10 00          	cmpb   $0x0,(%rax,%rdx,1)
145c     145c:	4c 8b 74 24 38       	mov    0x38(%rsp),%r14
1461     1461:	74 12                	je     1475 <s5m8767_pmic_probe+0x1475>
1463     1463:	4c 89 f7             	mov    %r14,%rdi
1466     1466:	e8 00 00 00 00       	call   146b <s5m8767_pmic_probe+0x146b>	1467: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
146b     146b:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
1475     1475:	4d 8b 36             	mov    (%r14),%r14
1478     1478:	49 83 c6 10          	add    $0x10,%r14
147c     147c:	4c 89 f0             	mov    %r14,%rax
147f     147f:	48 c1 e8 03          	shr    $0x3,%rax
1483     1483:	80 3c 10 00          	cmpb   $0x0,(%rax,%rdx,1)
1487     1487:	74 08                	je     1491 <s5m8767_pmic_probe+0x1491>
1489     1489:	4c 89 f7             	mov    %r14,%rdi
148c     148c:	e8 00 00 00 00       	call   1491 <s5m8767_pmic_probe+0x1491>	148d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1491     1491:	49 8b 3e             	mov    (%r14),%rdi
1494     1494:	be 3f 00 00 00       	mov    $0x3f,%esi
1499     1499:	89 da                	mov    %ebx,%edx
149b     149b:	e8 00 00 00 00       	call   14a0 <s5m8767_pmic_probe+0x14a0>	149c: R_X86_64_PLT32	regmap_write-0x4
14a0     14a0:	48 8b 04 24          	mov    (%rsp),%rax
14a4     14a4:	48 8d 98 ac 00 00 00 	lea    0xac(%rax),%rbx
14ab     14ab:	48 89 d8             	mov    %rbx,%rax
14ae     14ae:	48 c1 e8 03          	shr    $0x3,%rax
14b2     14b2:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
14bc     14bc:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
14c0     14c0:	84 c0                	test   %al,%al
14c2     14c2:	0f 85 c1 2c 00 00    	jne    4189 <s5m8767_pmic_probe+0x4189>
14c8     14c8:	8b 03                	mov    (%rbx),%eax
14ca     14ca:	bb ea ff ff ff       	mov    $0xffffffea,%ebx
14cf     14cf:	3d 00 6a 18 00       	cmp    $0x186a00,%eax
14d4     14d4:	7f 20                	jg     14f6 <s5m8767_pmic_probe+0x14f6>
14d6     14d6:	3d c1 27 09 00       	cmp    $0x927c1,%eax
14db     14db:	b9 c0 27 09 00       	mov    $0x927c0,%ecx
14e0     14e0:	0f 4d c8             	cmovge %eax,%ecx
14e3     14e3:	81 c1 a9 f0 f6 ff    	add    $0xfff6f0a9,%ecx
14e9     14e9:	d1 e9                	shr    %ecx
14eb     14eb:	48 69 d9 89 b5 f8 14 	imul   $0x14f8b589,%rcx,%rbx
14f2     14f2:	48 c1 eb 28          	shr    $0x28,%rbx
14f6     14f6:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
14fb     14fb:	80 3c 10 00          	cmpb   $0x0,(%rax,%rdx,1)
14ff     14ff:	4c 8b 74 24 38       	mov    0x38(%rsp),%r14
1504     1504:	74 12                	je     1518 <s5m8767_pmic_probe+0x1518>
1506     1506:	4c 89 f7             	mov    %r14,%rdi
1509     1509:	e8 00 00 00 00       	call   150e <s5m8767_pmic_probe+0x150e>	150a: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
150e     150e:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
1518     1518:	4d 8b 36             	mov    (%r14),%r14
151b     151b:	49 83 c6 10          	add    $0x10,%r14
151f     151f:	4c 89 f0             	mov    %r14,%rax
1522     1522:	48 c1 e8 03          	shr    $0x3,%rax
1526     1526:	80 3c 10 00          	cmpb   $0x0,(%rax,%rdx,1)
152a     152a:	74 08                	je     1534 <s5m8767_pmic_probe+0x1534>
152c     152c:	4c 89 f7             	mov    %r14,%rdi
152f     152f:	e8 00 00 00 00       	call   1534 <s5m8767_pmic_probe+0x1534>	1530: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1534     1534:	49 8b 3e             	mov    (%r14),%rdi
1537     1537:	be 48 00 00 00       	mov    $0x48,%esi
153c     153c:	89 da                	mov    %ebx,%edx
153e     153e:	e8 00 00 00 00       	call   1543 <s5m8767_pmic_probe+0x1543>	153f: R_X86_64_PLT32	regmap_write-0x4
1543     1543:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
154d     154d:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
1552     1552:	41 0f b6 04 10       	movzbl (%r8,%rdx,1),%eax
1557     1557:	84 c0                	test   %al,%al
1559     1559:	0f 85 51 2c 00 00    	jne    41b0 <s5m8767_pmic_probe+0x41b0>
155f     155f:	4c 8b 4c 24 18       	mov    0x18(%rsp),%r9
1564     1564:	41 80 39 00          	cmpb   $0x0,(%r9)
1568     1568:	48 8b 34 24          	mov    (%rsp),%rsi
156c     156c:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
1571     1571:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
1576     1576:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
157b     157b:	74 61                	je     15de <s5m8767_pmic_probe+0x15de>
157d     157d:	48 8d 5e 2c          	lea    0x2c(%rsi),%rbx
1581     1581:	48 89 d8             	mov    %rbx,%rax
1584     1584:	48 c1 e8 03          	shr    $0x3,%rax
1588     1588:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
158c     158c:	84 c0                	test   %al,%al
158e     158e:	0f 85 ff 32 00 00    	jne    4893 <s5m8767_pmic_probe+0x4893>
1594     1594:	8b 03                	mov    (%rbx),%eax
1596     1596:	41 be ea ff ff ff    	mov    $0xffffffea,%r14d
159c     159c:	3d 00 6a 18 00       	cmp    $0x186a00,%eax
15a1     15a1:	7f 20                	jg     15c3 <s5m8767_pmic_probe+0x15c3>
15a3     15a3:	3d c1 27 09 00       	cmp    $0x927c1,%eax
15a8     15a8:	b9 c0 27 09 00       	mov    $0x927c0,%ecx
15ad     15ad:	0f 4d c8             	cmovge %eax,%ecx
15b0     15b0:	81 c1 a9 f0 f6 ff    	add    $0xfff6f0a9,%ecx
15b6     15b6:	d1 e9                	shr    %ecx
15b8     15b8:	4c 69 f1 89 b5 f8 14 	imul   $0x14f8b589,%rcx,%r14
15bf     15bf:	49 c1 ee 28          	shr    $0x28,%r14
15c3     15c3:	49 8d 5c 24 2a       	lea    0x2a(%r12),%rbx
15c8     15c8:	48 89 d8             	mov    %rbx,%rax
15cb     15cb:	48 c1 e8 03          	shr    $0x3,%rax
15cf     15cf:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
15d3     15d3:	84 c0                	test   %al,%al
15d5     15d5:	0f 85 fc 32 00 00    	jne    48d7 <s5m8767_pmic_probe+0x48d7>
15db     15db:	44 88 33             	mov    %r14b,(%rbx)
15de     15de:	41 0f b6 04 12       	movzbl (%r10,%rdx,1),%eax
15e3     15e3:	84 c0                	test   %al,%al
15e5     15e5:	0f 85 f3 2b 00 00    	jne    41de <s5m8767_pmic_probe+0x41de>
15eb     15eb:	80 3f 00             	cmpb   $0x0,(%rdi)
15ee     15ee:	74 61                	je     1651 <s5m8767_pmic_probe+0x1651>
15f0     15f0:	48 8d 5e 50          	lea    0x50(%rsi),%rbx
15f4     15f4:	48 89 d8             	mov    %rbx,%rax
15f7     15f7:	48 c1 e8 03          	shr    $0x3,%rax
15fb     15fb:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
15ff     15ff:	84 c0                	test   %al,%al
1601     1601:	0f 85 11 33 00 00    	jne    4918 <s5m8767_pmic_probe+0x4918>
1607     1607:	8b 03                	mov    (%rbx),%eax
1609     1609:	41 be ea ff ff ff    	mov    $0xffffffea,%r14d
160f     160f:	3d 00 6a 18 00       	cmp    $0x186a00,%eax
1614     1614:	7f 20                	jg     1636 <s5m8767_pmic_probe+0x1636>
1616     1616:	3d c1 27 09 00       	cmp    $0x927c1,%eax
161b     161b:	b9 c0 27 09 00       	mov    $0x927c0,%ecx
1620     1620:	0f 4d c8             	cmovge %eax,%ecx
1623     1623:	81 c1 a9 f0 f6 ff    	add    $0xfff6f0a9,%ecx
1629     1629:	d1 e9                	shr    %ecx
162b     162b:	4c 69 f1 89 b5 f8 14 	imul   $0x14f8b589,%rcx,%r14
1632     1632:	49 c1 ee 28          	shr    $0x28,%r14
1636     1636:	49 8d 5c 24 32       	lea    0x32(%r12),%rbx
163b     163b:	48 89 d8             	mov    %rbx,%rax
163e     163e:	48 c1 e8 03          	shr    $0x3,%rax
1642     1642:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
1646     1646:	84 c0                	test   %al,%al
1648     1648:	0f 85 0e 33 00 00    	jne    495c <s5m8767_pmic_probe+0x495c>
164e     164e:	44 88 33             	mov    %r14b,(%rbx)
1651     1651:	41 0f b6 04 17       	movzbl (%r15,%rdx,1),%eax
1656     1656:	84 c0                	test   %al,%al
1658     1658:	0f 85 be 2b 00 00    	jne    421c <s5m8767_pmic_probe+0x421c>
165e     165e:	41 80 3b 00          	cmpb   $0x0,(%r11)
1662     1662:	74 61                	je     16c5 <s5m8767_pmic_probe+0x16c5>
1664     1664:	48 8d 5e 74          	lea    0x74(%rsi),%rbx
1668     1668:	48 89 d8             	mov    %rbx,%rax
166b     166b:	48 c1 e8 03          	shr    $0x3,%rax
166f     166f:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
1673     1673:	84 c0                	test   %al,%al
1675     1675:	0f 85 22 33 00 00    	jne    499d <s5m8767_pmic_probe+0x499d>
167b     167b:	8b 03                	mov    (%rbx),%eax
167d     167d:	41 be ea ff ff ff    	mov    $0xffffffea,%r14d
1683     1683:	3d 00 6a 18 00       	cmp    $0x186a00,%eax
1688     1688:	7f 20                	jg     16aa <s5m8767_pmic_probe+0x16aa>
168a     168a:	3d c1 27 09 00       	cmp    $0x927c1,%eax
168f     168f:	b9 c0 27 09 00       	mov    $0x927c0,%ecx
1694     1694:	0f 4d c8             	cmovge %eax,%ecx
1697     1697:	81 c1 a9 f0 f6 ff    	add    $0xfff6f0a9,%ecx
169d     169d:	d1 e9                	shr    %ecx
169f     169f:	4c 69 f1 89 b5 f8 14 	imul   $0x14f8b589,%rcx,%r14
16a6     16a6:	49 c1 ee 28          	shr    $0x28,%r14
16aa     16aa:	49 8d 5c 24 3a       	lea    0x3a(%r12),%rbx
16af     16af:	48 89 d8             	mov    %rbx,%rax
16b2     16b2:	48 c1 e8 03          	shr    $0x3,%rax
16b6     16b6:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
16ba     16ba:	84 c0                	test   %al,%al
16bc     16bc:	0f 85 1f 33 00 00    	jne    49e1 <s5m8767_pmic_probe+0x49e1>
16c2     16c2:	44 88 33             	mov    %r14b,(%rbx)
16c5     16c5:	41 0f b6 04 10       	movzbl (%r8,%rdx,1),%eax
16ca     16ca:	84 c0                	test   %al,%al
16cc     16cc:	0f 85 8c 2b 00 00    	jne    425e <s5m8767_pmic_probe+0x425e>
16d2     16d2:	41 80 39 00          	cmpb   $0x0,(%r9)
16d6     16d6:	74 61                	je     1739 <s5m8767_pmic_probe+0x1739>
16d8     16d8:	48 8d 5e 30          	lea    0x30(%rsi),%rbx
16dc     16dc:	48 89 d8             	mov    %rbx,%rax
16df     16df:	48 c1 e8 03          	shr    $0x3,%rax
16e3     16e3:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
16e7     16e7:	84 c0                	test   %al,%al
16e9     16e9:	0f 85 33 33 00 00    	jne    4a22 <s5m8767_pmic_probe+0x4a22>
16ef     16ef:	8b 03                	mov    (%rbx),%eax
16f1     16f1:	41 be ea ff ff ff    	mov    $0xffffffea,%r14d
16f7     16f7:	3d 00 6a 18 00       	cmp    $0x186a00,%eax
16fc     16fc:	7f 20                	jg     171e <s5m8767_pmic_probe+0x171e>
16fe     16fe:	3d c1 27 09 00       	cmp    $0x927c1,%eax
1703     1703:	b9 c0 27 09 00       	mov    $0x927c0,%ecx
1708     1708:	0f 4d c8             	cmovge %eax,%ecx
170b     170b:	81 c1 a9 f0 f6 ff    	add    $0xfff6f0a9,%ecx
1711     1711:	d1 e9                	shr    %ecx
1713     1713:	4c 69 f1 89 b5 f8 14 	imul   $0x14f8b589,%rcx,%r14
171a     171a:	49 c1 ee 28          	shr    $0x28,%r14
171e     171e:	49 8d 5c 24 2b       	lea    0x2b(%r12),%rbx
1723     1723:	48 89 d8             	mov    %rbx,%rax
1726     1726:	48 c1 e8 03          	shr    $0x3,%rax
172a     172a:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
172e     172e:	84 c0                	test   %al,%al
1730     1730:	0f 85 30 33 00 00    	jne    4a66 <s5m8767_pmic_probe+0x4a66>
1736     1736:	44 88 33             	mov    %r14b,(%rbx)
1739     1739:	41 0f b6 04 12       	movzbl (%r10,%rdx,1),%eax
173e     173e:	84 c0                	test   %al,%al
1740     1740:	0f 85 5c 2b 00 00    	jne    42a2 <s5m8767_pmic_probe+0x42a2>
1746     1746:	80 3f 00             	cmpb   $0x0,(%rdi)
1749     1749:	74 61                	je     17ac <s5m8767_pmic_probe+0x17ac>
174b     174b:	48 8d 5e 54          	lea    0x54(%rsi),%rbx
174f     174f:	48 89 d8             	mov    %rbx,%rax
1752     1752:	48 c1 e8 03          	shr    $0x3,%rax
1756     1756:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
175a     175a:	84 c0                	test   %al,%al
175c     175c:	0f 85 45 33 00 00    	jne    4aa7 <s5m8767_pmic_probe+0x4aa7>
1762     1762:	8b 03                	mov    (%rbx),%eax
1764     1764:	41 be ea ff ff ff    	mov    $0xffffffea,%r14d
176a     176a:	3d 00 6a 18 00       	cmp    $0x186a00,%eax
176f     176f:	7f 20                	jg     1791 <s5m8767_pmic_probe+0x1791>
1771     1771:	3d c1 27 09 00       	cmp    $0x927c1,%eax
1776     1776:	b9 c0 27 09 00       	mov    $0x927c0,%ecx
177b     177b:	0f 4d c8             	cmovge %eax,%ecx
177e     177e:	81 c1 a9 f0 f6 ff    	add    $0xfff6f0a9,%ecx
1784     1784:	d1 e9                	shr    %ecx
1786     1786:	4c 69 f1 89 b5 f8 14 	imul   $0x14f8b589,%rcx,%r14
178d     178d:	49 c1 ee 28          	shr    $0x28,%r14
1791     1791:	49 8d 5c 24 33       	lea    0x33(%r12),%rbx
1796     1796:	48 89 d8             	mov    %rbx,%rax
1799     1799:	48 c1 e8 03          	shr    $0x3,%rax
179d     179d:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
17a1     17a1:	84 c0                	test   %al,%al
17a3     17a3:	0f 85 42 33 00 00    	jne    4aeb <s5m8767_pmic_probe+0x4aeb>
17a9     17a9:	44 88 33             	mov    %r14b,(%rbx)
17ac     17ac:	41 0f b6 04 17       	movzbl (%r15,%rdx,1),%eax
17b1     17b1:	84 c0                	test   %al,%al
17b3     17b3:	0f 85 27 2b 00 00    	jne    42e0 <s5m8767_pmic_probe+0x42e0>
17b9     17b9:	41 80 3b 00          	cmpb   $0x0,(%r11)
17bd     17bd:	74 61                	je     1820 <s5m8767_pmic_probe+0x1820>
17bf     17bf:	48 8d 5e 78          	lea    0x78(%rsi),%rbx
17c3     17c3:	48 89 d8             	mov    %rbx,%rax
17c6     17c6:	48 c1 e8 03          	shr    $0x3,%rax
17ca     17ca:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
17ce     17ce:	84 c0                	test   %al,%al
17d0     17d0:	0f 85 56 33 00 00    	jne    4b2c <s5m8767_pmic_probe+0x4b2c>
17d6     17d6:	8b 03                	mov    (%rbx),%eax
17d8     17d8:	41 be ea ff ff ff    	mov    $0xffffffea,%r14d
17de     17de:	3d 00 6a 18 00       	cmp    $0x186a00,%eax
17e3     17e3:	7f 20                	jg     1805 <s5m8767_pmic_probe+0x1805>
17e5     17e5:	3d c1 27 09 00       	cmp    $0x927c1,%eax
17ea     17ea:	b9 c0 27 09 00       	mov    $0x927c0,%ecx
17ef     17ef:	0f 4d c8             	cmovge %eax,%ecx
17f2     17f2:	81 c1 a9 f0 f6 ff    	add    $0xfff6f0a9,%ecx
17f8     17f8:	d1 e9                	shr    %ecx
17fa     17fa:	4c 69 f1 89 b5 f8 14 	imul   $0x14f8b589,%rcx,%r14
1801     1801:	49 c1 ee 28          	shr    $0x28,%r14
1805     1805:	49 8d 5c 24 3b       	lea    0x3b(%r12),%rbx
180a     180a:	48 89 d8             	mov    %rbx,%rax
180d     180d:	48 c1 e8 03          	shr    $0x3,%rax
1811     1811:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
1815     1815:	84 c0                	test   %al,%al
1817     1817:	0f 85 53 33 00 00    	jne    4b70 <s5m8767_pmic_probe+0x4b70>
181d     181d:	44 88 33             	mov    %r14b,(%rbx)
1820     1820:	41 0f b6 04 10       	movzbl (%r8,%rdx,1),%eax
1825     1825:	84 c0                	test   %al,%al
1827     1827:	0f 85 f5 2a 00 00    	jne    4322 <s5m8767_pmic_probe+0x4322>
182d     182d:	41 80 39 00          	cmpb   $0x0,(%r9)
1831     1831:	74 61                	je     1894 <s5m8767_pmic_probe+0x1894>
1833     1833:	48 8d 5e 34          	lea    0x34(%rsi),%rbx
1837     1837:	48 89 d8             	mov    %rbx,%rax
183a     183a:	48 c1 e8 03          	shr    $0x3,%rax
183e     183e:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
1842     1842:	84 c0                	test   %al,%al
1844     1844:	0f 85 67 33 00 00    	jne    4bb1 <s5m8767_pmic_probe+0x4bb1>
184a     184a:	8b 03                	mov    (%rbx),%eax
184c     184c:	41 be ea ff ff ff    	mov    $0xffffffea,%r14d
1852     1852:	3d 00 6a 18 00       	cmp    $0x186a00,%eax
1857     1857:	7f 20                	jg     1879 <s5m8767_pmic_probe+0x1879>
1859     1859:	3d c1 27 09 00       	cmp    $0x927c1,%eax
185e     185e:	b9 c0 27 09 00       	mov    $0x927c0,%ecx
1863     1863:	0f 4d c8             	cmovge %eax,%ecx
1866     1866:	81 c1 a9 f0 f6 ff    	add    $0xfff6f0a9,%ecx
186c     186c:	d1 e9                	shr    %ecx
186e     186e:	4c 69 f1 89 b5 f8 14 	imul   $0x14f8b589,%rcx,%r14
1875     1875:	49 c1 ee 28          	shr    $0x28,%r14
1879     1879:	49 8d 5c 24 2c       	lea    0x2c(%r12),%rbx
187e     187e:	48 89 d8             	mov    %rbx,%rax
1881     1881:	48 c1 e8 03          	shr    $0x3,%rax
1885     1885:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
1889     1889:	84 c0                	test   %al,%al
188b     188b:	0f 85 64 33 00 00    	jne    4bf5 <s5m8767_pmic_probe+0x4bf5>
1891     1891:	44 88 33             	mov    %r14b,(%rbx)
1894     1894:	41 0f b6 04 12       	movzbl (%r10,%rdx,1),%eax
1899     1899:	84 c0                	test   %al,%al
189b     189b:	0f 85 c5 2a 00 00    	jne    4366 <s5m8767_pmic_probe+0x4366>
18a1     18a1:	80 3f 00             	cmpb   $0x0,(%rdi)
18a4     18a4:	74 61                	je     1907 <s5m8767_pmic_probe+0x1907>
18a6     18a6:	48 8d 5e 58          	lea    0x58(%rsi),%rbx
18aa     18aa:	48 89 d8             	mov    %rbx,%rax
18ad     18ad:	48 c1 e8 03          	shr    $0x3,%rax
18b1     18b1:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
18b5     18b5:	84 c0                	test   %al,%al
18b7     18b7:	0f 85 79 33 00 00    	jne    4c36 <s5m8767_pmic_probe+0x4c36>
18bd     18bd:	8b 03                	mov    (%rbx),%eax
18bf     18bf:	41 be ea ff ff ff    	mov    $0xffffffea,%r14d
18c5     18c5:	3d 00 6a 18 00       	cmp    $0x186a00,%eax
18ca     18ca:	7f 20                	jg     18ec <s5m8767_pmic_probe+0x18ec>
18cc     18cc:	3d c1 27 09 00       	cmp    $0x927c1,%eax
18d1     18d1:	b9 c0 27 09 00       	mov    $0x927c0,%ecx
18d6     18d6:	0f 4d c8             	cmovge %eax,%ecx
18d9     18d9:	81 c1 a9 f0 f6 ff    	add    $0xfff6f0a9,%ecx
18df     18df:	d1 e9                	shr    %ecx
18e1     18e1:	4c 69 f1 89 b5 f8 14 	imul   $0x14f8b589,%rcx,%r14
18e8     18e8:	49 c1 ee 28          	shr    $0x28,%r14
18ec     18ec:	49 8d 5c 24 34       	lea    0x34(%r12),%rbx
18f1     18f1:	48 89 d8             	mov    %rbx,%rax
18f4     18f4:	48 c1 e8 03          	shr    $0x3,%rax
18f8     18f8:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
18fc     18fc:	84 c0                	test   %al,%al
18fe     18fe:	0f 85 76 33 00 00    	jne    4c7a <s5m8767_pmic_probe+0x4c7a>
1904     1904:	44 88 33             	mov    %r14b,(%rbx)
1907     1907:	41 0f b6 04 17       	movzbl (%r15,%rdx,1),%eax
190c     190c:	84 c0                	test   %al,%al
190e     190e:	0f 85 90 2a 00 00    	jne    43a4 <s5m8767_pmic_probe+0x43a4>
1914     1914:	41 80 3b 00          	cmpb   $0x0,(%r11)
1918     1918:	74 61                	je     197b <s5m8767_pmic_probe+0x197b>
191a     191a:	48 8d 5e 7c          	lea    0x7c(%rsi),%rbx
191e     191e:	48 89 d8             	mov    %rbx,%rax
1921     1921:	48 c1 e8 03          	shr    $0x3,%rax
1925     1925:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
1929     1929:	84 c0                	test   %al,%al
192b     192b:	0f 85 8a 33 00 00    	jne    4cbb <s5m8767_pmic_probe+0x4cbb>
1931     1931:	8b 03                	mov    (%rbx),%eax
1933     1933:	41 be ea ff ff ff    	mov    $0xffffffea,%r14d
1939     1939:	3d 00 6a 18 00       	cmp    $0x186a00,%eax
193e     193e:	7f 20                	jg     1960 <s5m8767_pmic_probe+0x1960>
1940     1940:	3d c1 27 09 00       	cmp    $0x927c1,%eax
1945     1945:	b9 c0 27 09 00       	mov    $0x927c0,%ecx
194a     194a:	0f 4d c8             	cmovge %eax,%ecx
194d     194d:	81 c1 a9 f0 f6 ff    	add    $0xfff6f0a9,%ecx
1953     1953:	d1 e9                	shr    %ecx
1955     1955:	4c 69 f1 89 b5 f8 14 	imul   $0x14f8b589,%rcx,%r14
195c     195c:	49 c1 ee 28          	shr    $0x28,%r14
1960     1960:	49 8d 5c 24 3c       	lea    0x3c(%r12),%rbx
1965     1965:	48 89 d8             	mov    %rbx,%rax
1968     1968:	48 c1 e8 03          	shr    $0x3,%rax
196c     196c:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
1970     1970:	84 c0                	test   %al,%al
1972     1972:	0f 85 87 33 00 00    	jne    4cff <s5m8767_pmic_probe+0x4cff>
1978     1978:	44 88 33             	mov    %r14b,(%rbx)
197b     197b:	41 0f b6 04 10       	movzbl (%r8,%rdx,1),%eax
1980     1980:	84 c0                	test   %al,%al
1982     1982:	0f 85 5e 2a 00 00    	jne    43e6 <s5m8767_pmic_probe+0x43e6>
1988     1988:	41 80 39 00          	cmpb   $0x0,(%r9)
198c     198c:	74 61                	je     19ef <s5m8767_pmic_probe+0x19ef>
198e     198e:	48 8d 5e 38          	lea    0x38(%rsi),%rbx
1992     1992:	48 89 d8             	mov    %rbx,%rax
1995     1995:	48 c1 e8 03          	shr    $0x3,%rax
1999     1999:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
199d     199d:	84 c0                	test   %al,%al
199f     199f:	0f 85 9b 33 00 00    	jne    4d40 <s5m8767_pmic_probe+0x4d40>
19a5     19a5:	8b 03                	mov    (%rbx),%eax
19a7     19a7:	41 be ea ff ff ff    	mov    $0xffffffea,%r14d
19ad     19ad:	3d 00 6a 18 00       	cmp    $0x186a00,%eax
19b2     19b2:	7f 20                	jg     19d4 <s5m8767_pmic_probe+0x19d4>
19b4     19b4:	3d c1 27 09 00       	cmp    $0x927c1,%eax
19b9     19b9:	b9 c0 27 09 00       	mov    $0x927c0,%ecx
19be     19be:	0f 4d c8             	cmovge %eax,%ecx
19c1     19c1:	81 c1 a9 f0 f6 ff    	add    $0xfff6f0a9,%ecx
19c7     19c7:	d1 e9                	shr    %ecx
19c9     19c9:	4c 69 f1 89 b5 f8 14 	imul   $0x14f8b589,%rcx,%r14
19d0     19d0:	49 c1 ee 28          	shr    $0x28,%r14
19d4     19d4:	49 8d 5c 24 2d       	lea    0x2d(%r12),%rbx
19d9     19d9:	48 89 d8             	mov    %rbx,%rax
19dc     19dc:	48 c1 e8 03          	shr    $0x3,%rax
19e0     19e0:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
19e4     19e4:	84 c0                	test   %al,%al
19e6     19e6:	0f 85 98 33 00 00    	jne    4d84 <s5m8767_pmic_probe+0x4d84>
19ec     19ec:	44 88 33             	mov    %r14b,(%rbx)
19ef     19ef:	41 0f b6 04 12       	movzbl (%r10,%rdx,1),%eax
19f4     19f4:	84 c0                	test   %al,%al
19f6     19f6:	0f 85 2e 2a 00 00    	jne    442a <s5m8767_pmic_probe+0x442a>
19fc     19fc:	80 3f 00             	cmpb   $0x0,(%rdi)
19ff     19ff:	74 61                	je     1a62 <s5m8767_pmic_probe+0x1a62>
1a01     1a01:	48 8d 5e 5c          	lea    0x5c(%rsi),%rbx
1a05     1a05:	48 89 d8             	mov    %rbx,%rax
1a08     1a08:	48 c1 e8 03          	shr    $0x3,%rax
1a0c     1a0c:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
1a10     1a10:	84 c0                	test   %al,%al
1a12     1a12:	0f 85 ad 33 00 00    	jne    4dc5 <s5m8767_pmic_probe+0x4dc5>
1a18     1a18:	8b 03                	mov    (%rbx),%eax
1a1a     1a1a:	41 be ea ff ff ff    	mov    $0xffffffea,%r14d
1a20     1a20:	3d 00 6a 18 00       	cmp    $0x186a00,%eax
1a25     1a25:	7f 20                	jg     1a47 <s5m8767_pmic_probe+0x1a47>
1a27     1a27:	3d c1 27 09 00       	cmp    $0x927c1,%eax
1a2c     1a2c:	b9 c0 27 09 00       	mov    $0x927c0,%ecx
1a31     1a31:	0f 4d c8             	cmovge %eax,%ecx
1a34     1a34:	81 c1 a9 f0 f6 ff    	add    $0xfff6f0a9,%ecx
1a3a     1a3a:	d1 e9                	shr    %ecx
1a3c     1a3c:	4c 69 f1 89 b5 f8 14 	imul   $0x14f8b589,%rcx,%r14
1a43     1a43:	49 c1 ee 28          	shr    $0x28,%r14
1a47     1a47:	49 8d 5c 24 35       	lea    0x35(%r12),%rbx
1a4c     1a4c:	48 89 d8             	mov    %rbx,%rax
1a4f     1a4f:	48 c1 e8 03          	shr    $0x3,%rax
1a53     1a53:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
1a57     1a57:	84 c0                	test   %al,%al
1a59     1a59:	0f 85 aa 33 00 00    	jne    4e09 <s5m8767_pmic_probe+0x4e09>
1a5f     1a5f:	44 88 33             	mov    %r14b,(%rbx)
1a62     1a62:	41 0f b6 04 17       	movzbl (%r15,%rdx,1),%eax
1a67     1a67:	84 c0                	test   %al,%al
1a69     1a69:	0f 85 f9 29 00 00    	jne    4468 <s5m8767_pmic_probe+0x4468>
1a6f     1a6f:	41 80 3b 00          	cmpb   $0x0,(%r11)
1a73     1a73:	74 64                	je     1ad9 <s5m8767_pmic_probe+0x1ad9>
1a75     1a75:	48 8d 9e 80 00 00 00 	lea    0x80(%rsi),%rbx
1a7c     1a7c:	48 89 d8             	mov    %rbx,%rax
1a7f     1a7f:	48 c1 e8 03          	shr    $0x3,%rax
1a83     1a83:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
1a87     1a87:	84 c0                	test   %al,%al
1a89     1a89:	0f 85 bb 33 00 00    	jne    4e4a <s5m8767_pmic_probe+0x4e4a>
1a8f     1a8f:	8b 03                	mov    (%rbx),%eax
1a91     1a91:	41 be ea ff ff ff    	mov    $0xffffffea,%r14d
1a97     1a97:	3d 00 6a 18 00       	cmp    $0x186a00,%eax
1a9c     1a9c:	7f 20                	jg     1abe <s5m8767_pmic_probe+0x1abe>
1a9e     1a9e:	3d c1 27 09 00       	cmp    $0x927c1,%eax
1aa3     1aa3:	b9 c0 27 09 00       	mov    $0x927c0,%ecx
1aa8     1aa8:	0f 4d c8             	cmovge %eax,%ecx
1aab     1aab:	81 c1 a9 f0 f6 ff    	add    $0xfff6f0a9,%ecx
1ab1     1ab1:	d1 e9                	shr    %ecx
1ab3     1ab3:	4c 69 f1 89 b5 f8 14 	imul   $0x14f8b589,%rcx,%r14
1aba     1aba:	49 c1 ee 28          	shr    $0x28,%r14
1abe     1abe:	49 8d 5c 24 3d       	lea    0x3d(%r12),%rbx
1ac3     1ac3:	48 89 d8             	mov    %rbx,%rax
1ac6     1ac6:	48 c1 e8 03          	shr    $0x3,%rax
1aca     1aca:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
1ace     1ace:	84 c0                	test   %al,%al
1ad0     1ad0:	0f 85 b8 33 00 00    	jne    4e8e <s5m8767_pmic_probe+0x4e8e>
1ad6     1ad6:	44 88 33             	mov    %r14b,(%rbx)
1ad9     1ad9:	41 0f b6 04 10       	movzbl (%r8,%rdx,1),%eax
1ade     1ade:	84 c0                	test   %al,%al
1ae0     1ae0:	0f 85 c4 29 00 00    	jne    44aa <s5m8767_pmic_probe+0x44aa>
1ae6     1ae6:	41 80 39 00          	cmpb   $0x0,(%r9)
1aea     1aea:	74 61                	je     1b4d <s5m8767_pmic_probe+0x1b4d>
1aec     1aec:	48 8d 5e 3c          	lea    0x3c(%rsi),%rbx
1af0     1af0:	48 89 d8             	mov    %rbx,%rax
1af3     1af3:	48 c1 e8 03          	shr    $0x3,%rax
1af7     1af7:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
1afb     1afb:	84 c0                	test   %al,%al
1afd     1afd:	0f 85 cc 33 00 00    	jne    4ecf <s5m8767_pmic_probe+0x4ecf>
1b03     1b03:	8b 03                	mov    (%rbx),%eax
1b05     1b05:	41 be ea ff ff ff    	mov    $0xffffffea,%r14d
1b0b     1b0b:	3d 00 6a 18 00       	cmp    $0x186a00,%eax
1b10     1b10:	7f 20                	jg     1b32 <s5m8767_pmic_probe+0x1b32>
1b12     1b12:	3d c1 27 09 00       	cmp    $0x927c1,%eax
1b17     1b17:	b9 c0 27 09 00       	mov    $0x927c0,%ecx
1b1c     1b1c:	0f 4d c8             	cmovge %eax,%ecx
1b1f     1b1f:	81 c1 a9 f0 f6 ff    	add    $0xfff6f0a9,%ecx
1b25     1b25:	d1 e9                	shr    %ecx
1b27     1b27:	4c 69 f1 89 b5 f8 14 	imul   $0x14f8b589,%rcx,%r14
1b2e     1b2e:	49 c1 ee 28          	shr    $0x28,%r14
1b32     1b32:	49 8d 5c 24 2e       	lea    0x2e(%r12),%rbx
1b37     1b37:	48 89 d8             	mov    %rbx,%rax
1b3a     1b3a:	48 c1 e8 03          	shr    $0x3,%rax
1b3e     1b3e:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
1b42     1b42:	84 c0                	test   %al,%al
1b44     1b44:	0f 85 c9 33 00 00    	jne    4f13 <s5m8767_pmic_probe+0x4f13>
1b4a     1b4a:	44 88 33             	mov    %r14b,(%rbx)
1b4d     1b4d:	41 0f b6 04 12       	movzbl (%r10,%rdx,1),%eax
1b52     1b52:	84 c0                	test   %al,%al
1b54     1b54:	0f 85 94 29 00 00    	jne    44ee <s5m8767_pmic_probe+0x44ee>
1b5a     1b5a:	80 3f 00             	cmpb   $0x0,(%rdi)
1b5d     1b5d:	74 61                	je     1bc0 <s5m8767_pmic_probe+0x1bc0>
1b5f     1b5f:	48 8d 5e 60          	lea    0x60(%rsi),%rbx
1b63     1b63:	48 89 d8             	mov    %rbx,%rax
1b66     1b66:	48 c1 e8 03          	shr    $0x3,%rax
1b6a     1b6a:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
1b6e     1b6e:	84 c0                	test   %al,%al
1b70     1b70:	0f 85 de 33 00 00    	jne    4f54 <s5m8767_pmic_probe+0x4f54>
1b76     1b76:	8b 03                	mov    (%rbx),%eax
1b78     1b78:	41 be ea ff ff ff    	mov    $0xffffffea,%r14d
1b7e     1b7e:	3d 00 6a 18 00       	cmp    $0x186a00,%eax
1b83     1b83:	7f 20                	jg     1ba5 <s5m8767_pmic_probe+0x1ba5>
1b85     1b85:	3d c1 27 09 00       	cmp    $0x927c1,%eax
1b8a     1b8a:	b9 c0 27 09 00       	mov    $0x927c0,%ecx
1b8f     1b8f:	0f 4d c8             	cmovge %eax,%ecx
1b92     1b92:	81 c1 a9 f0 f6 ff    	add    $0xfff6f0a9,%ecx
1b98     1b98:	d1 e9                	shr    %ecx
1b9a     1b9a:	4c 69 f1 89 b5 f8 14 	imul   $0x14f8b589,%rcx,%r14
1ba1     1ba1:	49 c1 ee 28          	shr    $0x28,%r14
1ba5     1ba5:	49 8d 5c 24 36       	lea    0x36(%r12),%rbx
1baa     1baa:	48 89 d8             	mov    %rbx,%rax
1bad     1bad:	48 c1 e8 03          	shr    $0x3,%rax
1bb1     1bb1:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
1bb5     1bb5:	84 c0                	test   %al,%al
1bb7     1bb7:	0f 85 db 33 00 00    	jne    4f98 <s5m8767_pmic_probe+0x4f98>
1bbd     1bbd:	44 88 33             	mov    %r14b,(%rbx)
1bc0     1bc0:	41 0f b6 04 17       	movzbl (%r15,%rdx,1),%eax
1bc5     1bc5:	84 c0                	test   %al,%al
1bc7     1bc7:	0f 85 5f 29 00 00    	jne    452c <s5m8767_pmic_probe+0x452c>
1bcd     1bcd:	41 80 3b 00          	cmpb   $0x0,(%r11)
1bd1     1bd1:	74 64                	je     1c37 <s5m8767_pmic_probe+0x1c37>
1bd3     1bd3:	48 8d 9e 84 00 00 00 	lea    0x84(%rsi),%rbx
1bda     1bda:	48 89 d8             	mov    %rbx,%rax
1bdd     1bdd:	48 c1 e8 03          	shr    $0x3,%rax
1be1     1be1:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
1be5     1be5:	84 c0                	test   %al,%al
1be7     1be7:	0f 85 ec 33 00 00    	jne    4fd9 <s5m8767_pmic_probe+0x4fd9>
1bed     1bed:	8b 03                	mov    (%rbx),%eax
1bef     1bef:	41 be ea ff ff ff    	mov    $0xffffffea,%r14d
1bf5     1bf5:	3d 00 6a 18 00       	cmp    $0x186a00,%eax
1bfa     1bfa:	7f 20                	jg     1c1c <s5m8767_pmic_probe+0x1c1c>
1bfc     1bfc:	3d c1 27 09 00       	cmp    $0x927c1,%eax
1c01     1c01:	b9 c0 27 09 00       	mov    $0x927c0,%ecx
1c06     1c06:	0f 4d c8             	cmovge %eax,%ecx
1c09     1c09:	81 c1 a9 f0 f6 ff    	add    $0xfff6f0a9,%ecx
1c0f     1c0f:	d1 e9                	shr    %ecx
1c11     1c11:	4c 69 f1 89 b5 f8 14 	imul   $0x14f8b589,%rcx,%r14
1c18     1c18:	49 c1 ee 28          	shr    $0x28,%r14
1c1c     1c1c:	49 8d 5c 24 3e       	lea    0x3e(%r12),%rbx
1c21     1c21:	48 89 d8             	mov    %rbx,%rax
1c24     1c24:	48 c1 e8 03          	shr    $0x3,%rax
1c28     1c28:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
1c2c     1c2c:	84 c0                	test   %al,%al
1c2e     1c2e:	0f 85 e9 33 00 00    	jne    501d <s5m8767_pmic_probe+0x501d>
1c34     1c34:	44 88 33             	mov    %r14b,(%rbx)
1c37     1c37:	41 0f b6 04 10       	movzbl (%r8,%rdx,1),%eax
1c3c     1c3c:	84 c0                	test   %al,%al
1c3e     1c3e:	0f 85 2a 29 00 00    	jne    456e <s5m8767_pmic_probe+0x456e>
1c44     1c44:	41 80 39 00          	cmpb   $0x0,(%r9)
1c48     1c48:	74 61                	je     1cab <s5m8767_pmic_probe+0x1cab>
1c4a     1c4a:	48 8d 5e 40          	lea    0x40(%rsi),%rbx
1c4e     1c4e:	48 89 d8             	mov    %rbx,%rax
1c51     1c51:	48 c1 e8 03          	shr    $0x3,%rax
1c55     1c55:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
1c59     1c59:	84 c0                	test   %al,%al
1c5b     1c5b:	0f 85 fd 33 00 00    	jne    505e <s5m8767_pmic_probe+0x505e>
1c61     1c61:	8b 03                	mov    (%rbx),%eax
1c63     1c63:	41 be ea ff ff ff    	mov    $0xffffffea,%r14d
1c69     1c69:	3d 00 6a 18 00       	cmp    $0x186a00,%eax
1c6e     1c6e:	7f 20                	jg     1c90 <s5m8767_pmic_probe+0x1c90>
1c70     1c70:	3d c1 27 09 00       	cmp    $0x927c1,%eax
1c75     1c75:	b9 c0 27 09 00       	mov    $0x927c0,%ecx
1c7a     1c7a:	0f 4d c8             	cmovge %eax,%ecx
1c7d     1c7d:	81 c1 a9 f0 f6 ff    	add    $0xfff6f0a9,%ecx
1c83     1c83:	d1 e9                	shr    %ecx
1c85     1c85:	4c 69 f1 89 b5 f8 14 	imul   $0x14f8b589,%rcx,%r14
1c8c     1c8c:	49 c1 ee 28          	shr    $0x28,%r14
1c90     1c90:	49 8d 5c 24 2f       	lea    0x2f(%r12),%rbx
1c95     1c95:	48 89 d8             	mov    %rbx,%rax
1c98     1c98:	48 c1 e8 03          	shr    $0x3,%rax
1c9c     1c9c:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
1ca0     1ca0:	84 c0                	test   %al,%al
1ca2     1ca2:	0f 85 fa 33 00 00    	jne    50a2 <s5m8767_pmic_probe+0x50a2>
1ca8     1ca8:	44 88 33             	mov    %r14b,(%rbx)
1cab     1cab:	41 0f b6 04 12       	movzbl (%r10,%rdx,1),%eax
1cb0     1cb0:	84 c0                	test   %al,%al
1cb2     1cb2:	0f 85 fa 28 00 00    	jne    45b2 <s5m8767_pmic_probe+0x45b2>
1cb8     1cb8:	80 3f 00             	cmpb   $0x0,(%rdi)
1cbb     1cbb:	74 61                	je     1d1e <s5m8767_pmic_probe+0x1d1e>
1cbd     1cbd:	48 8d 5e 64          	lea    0x64(%rsi),%rbx
1cc1     1cc1:	48 89 d8             	mov    %rbx,%rax
1cc4     1cc4:	48 c1 e8 03          	shr    $0x3,%rax
1cc8     1cc8:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
1ccc     1ccc:	84 c0                	test   %al,%al
1cce     1cce:	0f 85 0f 34 00 00    	jne    50e3 <s5m8767_pmic_probe+0x50e3>
1cd4     1cd4:	8b 03                	mov    (%rbx),%eax
1cd6     1cd6:	41 be ea ff ff ff    	mov    $0xffffffea,%r14d
1cdc     1cdc:	3d 00 6a 18 00       	cmp    $0x186a00,%eax
1ce1     1ce1:	7f 20                	jg     1d03 <s5m8767_pmic_probe+0x1d03>
1ce3     1ce3:	3d c1 27 09 00       	cmp    $0x927c1,%eax
1ce8     1ce8:	b9 c0 27 09 00       	mov    $0x927c0,%ecx
1ced     1ced:	0f 4d c8             	cmovge %eax,%ecx
1cf0     1cf0:	81 c1 a9 f0 f6 ff    	add    $0xfff6f0a9,%ecx
1cf6     1cf6:	d1 e9                	shr    %ecx
1cf8     1cf8:	4c 69 f1 89 b5 f8 14 	imul   $0x14f8b589,%rcx,%r14
1cff     1cff:	49 c1 ee 28          	shr    $0x28,%r14
1d03     1d03:	49 8d 5c 24 37       	lea    0x37(%r12),%rbx
1d08     1d08:	48 89 d8             	mov    %rbx,%rax
1d0b     1d0b:	48 c1 e8 03          	shr    $0x3,%rax
1d0f     1d0f:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
1d13     1d13:	84 c0                	test   %al,%al
1d15     1d15:	0f 85 0c 34 00 00    	jne    5127 <s5m8767_pmic_probe+0x5127>
1d1b     1d1b:	44 88 33             	mov    %r14b,(%rbx)
1d1e     1d1e:	41 0f b6 04 17       	movzbl (%r15,%rdx,1),%eax
1d23     1d23:	84 c0                	test   %al,%al
1d25     1d25:	0f 85 c5 28 00 00    	jne    45f0 <s5m8767_pmic_probe+0x45f0>
1d2b     1d2b:	41 80 3b 00          	cmpb   $0x0,(%r11)
1d2f     1d2f:	74 64                	je     1d95 <s5m8767_pmic_probe+0x1d95>
1d31     1d31:	48 8d 9e 88 00 00 00 	lea    0x88(%rsi),%rbx
1d38     1d38:	48 89 d8             	mov    %rbx,%rax
1d3b     1d3b:	48 c1 e8 03          	shr    $0x3,%rax
1d3f     1d3f:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
1d43     1d43:	84 c0                	test   %al,%al
1d45     1d45:	0f 85 1d 34 00 00    	jne    5168 <s5m8767_pmic_probe+0x5168>
1d4b     1d4b:	8b 03                	mov    (%rbx),%eax
1d4d     1d4d:	41 be ea ff ff ff    	mov    $0xffffffea,%r14d
1d53     1d53:	3d 00 6a 18 00       	cmp    $0x186a00,%eax
1d58     1d58:	7f 20                	jg     1d7a <s5m8767_pmic_probe+0x1d7a>
1d5a     1d5a:	3d c1 27 09 00       	cmp    $0x927c1,%eax
1d5f     1d5f:	b9 c0 27 09 00       	mov    $0x927c0,%ecx
1d64     1d64:	0f 4d c8             	cmovge %eax,%ecx
1d67     1d67:	81 c1 a9 f0 f6 ff    	add    $0xfff6f0a9,%ecx
1d6d     1d6d:	d1 e9                	shr    %ecx
1d6f     1d6f:	4c 69 f1 89 b5 f8 14 	imul   $0x14f8b589,%rcx,%r14
1d76     1d76:	49 c1 ee 28          	shr    $0x28,%r14
1d7a     1d7a:	49 8d 5c 24 3f       	lea    0x3f(%r12),%rbx
1d7f     1d7f:	48 89 d8             	mov    %rbx,%rax
1d82     1d82:	48 c1 e8 03          	shr    $0x3,%rax
1d86     1d86:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
1d8a     1d8a:	84 c0                	test   %al,%al
1d8c     1d8c:	0f 85 1a 34 00 00    	jne    51ac <s5m8767_pmic_probe+0x51ac>
1d92     1d92:	44 88 33             	mov    %r14b,(%rbx)
1d95     1d95:	41 0f b6 04 10       	movzbl (%r8,%rdx,1),%eax
1d9a     1d9a:	84 c0                	test   %al,%al
1d9c     1d9c:	0f 85 90 28 00 00    	jne    4632 <s5m8767_pmic_probe+0x4632>
1da2     1da2:	41 80 39 00          	cmpb   $0x0,(%r9)
1da6     1da6:	74 61                	je     1e09 <s5m8767_pmic_probe+0x1e09>
1da8     1da8:	48 8d 5e 44          	lea    0x44(%rsi),%rbx
1dac     1dac:	48 89 d8             	mov    %rbx,%rax
1daf     1daf:	48 c1 e8 03          	shr    $0x3,%rax
1db3     1db3:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
1db7     1db7:	84 c0                	test   %al,%al
1db9     1db9:	0f 85 2e 34 00 00    	jne    51ed <s5m8767_pmic_probe+0x51ed>
1dbf     1dbf:	8b 03                	mov    (%rbx),%eax
1dc1     1dc1:	41 be ea ff ff ff    	mov    $0xffffffea,%r14d
1dc7     1dc7:	3d 00 6a 18 00       	cmp    $0x186a00,%eax
1dcc     1dcc:	7f 20                	jg     1dee <s5m8767_pmic_probe+0x1dee>
1dce     1dce:	3d c1 27 09 00       	cmp    $0x927c1,%eax
1dd3     1dd3:	b9 c0 27 09 00       	mov    $0x927c0,%ecx
1dd8     1dd8:	0f 4d c8             	cmovge %eax,%ecx
1ddb     1ddb:	81 c1 a9 f0 f6 ff    	add    $0xfff6f0a9,%ecx
1de1     1de1:	d1 e9                	shr    %ecx
1de3     1de3:	4c 69 f1 89 b5 f8 14 	imul   $0x14f8b589,%rcx,%r14
1dea     1dea:	49 c1 ee 28          	shr    $0x28,%r14
1dee     1dee:	49 8d 5c 24 30       	lea    0x30(%r12),%rbx
1df3     1df3:	48 89 d8             	mov    %rbx,%rax
1df6     1df6:	48 c1 e8 03          	shr    $0x3,%rax
1dfa     1dfa:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
1dfe     1dfe:	84 c0                	test   %al,%al
1e00     1e00:	0f 85 2b 34 00 00    	jne    5231 <s5m8767_pmic_probe+0x5231>
1e06     1e06:	44 88 33             	mov    %r14b,(%rbx)
1e09     1e09:	41 0f b6 04 12       	movzbl (%r10,%rdx,1),%eax
1e0e     1e0e:	84 c0                	test   %al,%al
1e10     1e10:	0f 85 60 28 00 00    	jne    4676 <s5m8767_pmic_probe+0x4676>
1e16     1e16:	80 3f 00             	cmpb   $0x0,(%rdi)
1e19     1e19:	74 61                	je     1e7c <s5m8767_pmic_probe+0x1e7c>
1e1b     1e1b:	48 8d 5e 68          	lea    0x68(%rsi),%rbx
1e1f     1e1f:	48 89 d8             	mov    %rbx,%rax
1e22     1e22:	48 c1 e8 03          	shr    $0x3,%rax
1e26     1e26:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
1e2a     1e2a:	84 c0                	test   %al,%al
1e2c     1e2c:	0f 85 40 34 00 00    	jne    5272 <s5m8767_pmic_probe+0x5272>
1e32     1e32:	8b 03                	mov    (%rbx),%eax
1e34     1e34:	41 be ea ff ff ff    	mov    $0xffffffea,%r14d
1e3a     1e3a:	3d 00 6a 18 00       	cmp    $0x186a00,%eax
1e3f     1e3f:	7f 20                	jg     1e61 <s5m8767_pmic_probe+0x1e61>
1e41     1e41:	3d c1 27 09 00       	cmp    $0x927c1,%eax
1e46     1e46:	b9 c0 27 09 00       	mov    $0x927c0,%ecx
1e4b     1e4b:	0f 4d c8             	cmovge %eax,%ecx
1e4e     1e4e:	81 c1 a9 f0 f6 ff    	add    $0xfff6f0a9,%ecx
1e54     1e54:	d1 e9                	shr    %ecx
1e56     1e56:	4c 69 f1 89 b5 f8 14 	imul   $0x14f8b589,%rcx,%r14
1e5d     1e5d:	49 c1 ee 28          	shr    $0x28,%r14
1e61     1e61:	49 8d 5c 24 38       	lea    0x38(%r12),%rbx
1e66     1e66:	48 89 d8             	mov    %rbx,%rax
1e69     1e69:	48 c1 e8 03          	shr    $0x3,%rax
1e6d     1e6d:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
1e71     1e71:	84 c0                	test   %al,%al
1e73     1e73:	0f 85 3d 34 00 00    	jne    52b6 <s5m8767_pmic_probe+0x52b6>
1e79     1e79:	44 88 33             	mov    %r14b,(%rbx)
1e7c     1e7c:	41 0f b6 04 17       	movzbl (%r15,%rdx,1),%eax
1e81     1e81:	84 c0                	test   %al,%al
1e83     1e83:	0f 85 2b 28 00 00    	jne    46b4 <s5m8767_pmic_probe+0x46b4>
1e89     1e89:	41 80 3b 00          	cmpb   $0x0,(%r11)
1e8d     1e8d:	74 64                	je     1ef3 <s5m8767_pmic_probe+0x1ef3>
1e8f     1e8f:	48 8d 9e 8c 00 00 00 	lea    0x8c(%rsi),%rbx
1e96     1e96:	48 89 d8             	mov    %rbx,%rax
1e99     1e99:	48 c1 e8 03          	shr    $0x3,%rax
1e9d     1e9d:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
1ea1     1ea1:	84 c0                	test   %al,%al
1ea3     1ea3:	0f 85 4e 34 00 00    	jne    52f7 <s5m8767_pmic_probe+0x52f7>
1ea9     1ea9:	8b 03                	mov    (%rbx),%eax
1eab     1eab:	41 be ea ff ff ff    	mov    $0xffffffea,%r14d
1eb1     1eb1:	3d 00 6a 18 00       	cmp    $0x186a00,%eax
1eb6     1eb6:	7f 20                	jg     1ed8 <s5m8767_pmic_probe+0x1ed8>
1eb8     1eb8:	3d c1 27 09 00       	cmp    $0x927c1,%eax
1ebd     1ebd:	b9 c0 27 09 00       	mov    $0x927c0,%ecx
1ec2     1ec2:	0f 4d c8             	cmovge %eax,%ecx
1ec5     1ec5:	81 c1 a9 f0 f6 ff    	add    $0xfff6f0a9,%ecx
1ecb     1ecb:	d1 e9                	shr    %ecx
1ecd     1ecd:	4c 69 f1 89 b5 f8 14 	imul   $0x14f8b589,%rcx,%r14
1ed4     1ed4:	49 c1 ee 28          	shr    $0x28,%r14
1ed8     1ed8:	49 8d 5c 24 40       	lea    0x40(%r12),%rbx
1edd     1edd:	48 89 d8             	mov    %rbx,%rax
1ee0     1ee0:	48 c1 e8 03          	shr    $0x3,%rax
1ee4     1ee4:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
1ee8     1ee8:	84 c0                	test   %al,%al
1eea     1eea:	0f 85 4b 34 00 00    	jne    533b <s5m8767_pmic_probe+0x533b>
1ef0     1ef0:	44 88 33             	mov    %r14b,(%rbx)
1ef3     1ef3:	41 0f b6 04 10       	movzbl (%r8,%rdx,1),%eax
1ef8     1ef8:	84 c0                	test   %al,%al
1efa     1efa:	0f 85 f6 27 00 00    	jne    46f6 <s5m8767_pmic_probe+0x46f6>
1f00     1f00:	41 80 39 00          	cmpb   $0x0,(%r9)
1f04     1f04:	74 61                	je     1f67 <s5m8767_pmic_probe+0x1f67>
1f06     1f06:	48 8d 5e 48          	lea    0x48(%rsi),%rbx
1f0a     1f0a:	48 89 d8             	mov    %rbx,%rax
1f0d     1f0d:	48 c1 e8 03          	shr    $0x3,%rax
1f11     1f11:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
1f15     1f15:	84 c0                	test   %al,%al
1f17     1f17:	0f 85 5f 34 00 00    	jne    537c <s5m8767_pmic_probe+0x537c>
1f1d     1f1d:	8b 03                	mov    (%rbx),%eax
1f1f     1f1f:	41 be ea ff ff ff    	mov    $0xffffffea,%r14d
1f25     1f25:	3d 00 6a 18 00       	cmp    $0x186a00,%eax
1f2a     1f2a:	7f 20                	jg     1f4c <s5m8767_pmic_probe+0x1f4c>
1f2c     1f2c:	3d c1 27 09 00       	cmp    $0x927c1,%eax
1f31     1f31:	b9 c0 27 09 00       	mov    $0x927c0,%ecx
1f36     1f36:	0f 4d c8             	cmovge %eax,%ecx
1f39     1f39:	81 c1 a9 f0 f6 ff    	add    $0xfff6f0a9,%ecx
1f3f     1f3f:	d1 e9                	shr    %ecx
1f41     1f41:	4c 69 f1 89 b5 f8 14 	imul   $0x14f8b589,%rcx,%r14
1f48     1f48:	49 c1 ee 28          	shr    $0x28,%r14
1f4c     1f4c:	49 8d 5c 24 31       	lea    0x31(%r12),%rbx
1f51     1f51:	48 89 d8             	mov    %rbx,%rax
1f54     1f54:	48 c1 e8 03          	shr    $0x3,%rax
1f58     1f58:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
1f5c     1f5c:	84 c0                	test   %al,%al
1f5e     1f5e:	0f 85 52 34 00 00    	jne    53b6 <s5m8767_pmic_probe+0x53b6>
1f64     1f64:	44 88 33             	mov    %r14b,(%rbx)
1f67     1f67:	41 0f b6 04 12       	movzbl (%r10,%rdx,1),%eax
1f6c     1f6c:	84 c0                	test   %al,%al
1f6e     1f6e:	0f 85 c1 27 00 00    	jne    4735 <s5m8767_pmic_probe+0x4735>
1f74     1f74:	80 3f 00             	cmpb   $0x0,(%rdi)
1f77     1f77:	48 8b 7c 24 50       	mov    0x50(%rsp),%rdi
1f7c     1f7c:	74 61                	je     1fdf <s5m8767_pmic_probe+0x1fdf>
1f7e     1f7e:	48 8d 5e 6c          	lea    0x6c(%rsi),%rbx
1f82     1f82:	48 89 d8             	mov    %rbx,%rax
1f85     1f85:	48 c1 e8 03          	shr    $0x3,%rax
1f89     1f89:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
1f8d     1f8d:	84 c0                	test   %al,%al
1f8f     1f8f:	0f 85 58 34 00 00    	jne    53ed <s5m8767_pmic_probe+0x53ed>
1f95     1f95:	8b 03                	mov    (%rbx),%eax
1f97     1f97:	41 be ea ff ff ff    	mov    $0xffffffea,%r14d
1f9d     1f9d:	3d 00 6a 18 00       	cmp    $0x186a00,%eax
1fa2     1fa2:	7f 20                	jg     1fc4 <s5m8767_pmic_probe+0x1fc4>
1fa4     1fa4:	3d c1 27 09 00       	cmp    $0x927c1,%eax
1fa9     1fa9:	b9 c0 27 09 00       	mov    $0x927c0,%ecx
1fae     1fae:	0f 4d c8             	cmovge %eax,%ecx
1fb1     1fb1:	81 c1 a9 f0 f6 ff    	add    $0xfff6f0a9,%ecx
1fb7     1fb7:	d1 e9                	shr    %ecx
1fb9     1fb9:	4c 69 f1 89 b5 f8 14 	imul   $0x14f8b589,%rcx,%r14
1fc0     1fc0:	49 c1 ee 28          	shr    $0x28,%r14
1fc4     1fc4:	49 8d 5c 24 39       	lea    0x39(%r12),%rbx
1fc9     1fc9:	48 89 d8             	mov    %rbx,%rax
1fcc     1fcc:	48 c1 e8 03          	shr    $0x3,%rax
1fd0     1fd0:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
1fd4     1fd4:	84 c0                	test   %al,%al
1fd6     1fd6:	0f 85 46 34 00 00    	jne    5422 <s5m8767_pmic_probe+0x5422>
1fdc     1fdc:	44 88 33             	mov    %r14b,(%rbx)
1fdf     1fdf:	41 0f b6 04 17       	movzbl (%r15,%rdx,1),%eax
1fe4     1fe4:	84 c0                	test   %al,%al
1fe6     1fe6:	0f 85 78 27 00 00    	jne    4764 <s5m8767_pmic_probe+0x4764>
1fec     1fec:	41 80 3b 00          	cmpb   $0x0,(%r11)
1ff0     1ff0:	74 64                	je     2056 <s5m8767_pmic_probe+0x2056>
1ff2     1ff2:	48 8d 9e 90 00 00 00 	lea    0x90(%rsi),%rbx
1ff9     1ff9:	48 89 d8             	mov    %rbx,%rax
1ffc     1ffc:	48 c1 e8 03          	shr    $0x3,%rax
2000     2000:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
2004     2004:	84 c0                	test   %al,%al
2006     2006:	0f 85 48 34 00 00    	jne    5454 <s5m8767_pmic_probe+0x5454>
200c     200c:	8b 03                	mov    (%rbx),%eax
200e     200e:	41 be ea ff ff ff    	mov    $0xffffffea,%r14d
2014     2014:	3d 00 6a 18 00       	cmp    $0x186a00,%eax
2019     2019:	7f 20                	jg     203b <s5m8767_pmic_probe+0x203b>
201b     201b:	3d c1 27 09 00       	cmp    $0x927c1,%eax
2020     2020:	b9 c0 27 09 00       	mov    $0x927c0,%ecx
2025     2025:	0f 4d c8             	cmovge %eax,%ecx
2028     2028:	81 c1 a9 f0 f6 ff    	add    $0xfff6f0a9,%ecx
202e     202e:	d1 e9                	shr    %ecx
2030     2030:	4c 69 f1 89 b5 f8 14 	imul   $0x14f8b589,%rcx,%r14
2037     2037:	49 c1 ee 28          	shr    $0x28,%r14
203b     203b:	49 8d 5c 24 41       	lea    0x41(%r12),%rbx
2040     2040:	48 89 d8             	mov    %rbx,%rax
2043     2043:	48 c1 e8 03          	shr    $0x3,%rax
2047     2047:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
204b     204b:	84 c0                	test   %al,%al
204d     204d:	0f 85 2d 34 00 00    	jne    5480 <s5m8767_pmic_probe+0x5480>
2053     2053:	44 88 33             	mov    %r14b,(%rbx)
2056     2056:	0f b6 44 15 00       	movzbl 0x0(%rbp,%rdx,1),%eax
205b     205b:	84 c0                	test   %al,%al
205d     205d:	0f 85 34 27 00 00    	jne    4797 <s5m8767_pmic_probe+0x4797>
2063     2063:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
2068     2068:	80 38 00             	cmpb   $0x0,(%rax)
206b     206b:	48 8b 9c 24 b0 00 00 00 	mov    0xb0(%rsp),%rbx
2073     2073:	75 3d                	jne    20b2 <s5m8767_pmic_probe+0x20b2>
2075     2075:	41 0f b6 44 15 00    	movzbl 0x0(%r13,%rdx,1),%eax
207b     207b:	84 c0                	test   %al,%al
207d     207d:	0f 85 74 36 00 00    	jne    56f7 <s5m8767_pmic_probe+0x56f7>
2083     2083:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
2088     2088:	80 38 00             	cmpb   $0x0,(%rax)
208b     208b:	75 25                	jne    20b2 <s5m8767_pmic_probe+0x20b2>
208d     208d:	48 8b 84 24 d0 00 00 00 	mov    0xd0(%rsp),%rax
2095     2095:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
2099     2099:	84 c0                	test   %al,%al
209b     209b:	0f 85 43 37 00 00    	jne    57e4 <s5m8767_pmic_probe+0x57e4>
20a1     20a1:	48 8b 84 24 90 00 00 00 	mov    0x90(%rsp),%rax
20a9     20a9:	80 38 00             	cmpb   $0x0,(%rax)
20ac     20ac:	0f 84 f7 01 00 00    	je     22a9 <s5m8767_pmic_probe+0x22a9>
20b2     20b2:	48 8b 84 24 80 00 00 00 	mov    0x80(%rsp),%rax
20ba     20ba:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
20be     20be:	84 c0                	test   %al,%al
20c0     20c0:	0f 85 1a 27 00 00    	jne    47e0 <s5m8767_pmic_probe+0x47e0>
20c6     20c6:	48 8b 84 24 88 00 00 00 	mov    0x88(%rsp),%rax
20ce     20ce:	8b 30                	mov    (%rax),%esi
20d0     20d0:	85 f6                	test   %esi,%esi
20d2     20d2:	48 8b 7c 24 78       	mov    0x78(%rsp),%rdi
20d7     20d7:	0f 88 06 05 00 00    	js     25e3 <s5m8767_pmic_probe+0x25e3>
20dd     20dd:	48 8b 84 24 d8 00 00 00 	mov    0xd8(%rsp),%rax
20e5     20e5:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
20e9     20e9:	84 c0                	test   %al,%al
20eb     20eb:	0f 85 21 27 00 00    	jne    4812 <s5m8767_pmic_probe+0x4812>
20f1     20f1:	83 3f 00             	cmpl   $0x0,(%rdi)
20f4     20f4:	0f 88 e9 04 00 00    	js     25e3 <s5m8767_pmic_probe+0x25e3>
20fa     20fa:	48 8b 84 24 f0 00 00 00 	mov    0xf0(%rsp),%rax
2102     2102:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
2106     2106:	84 c0                	test   %al,%al
2108     2108:	0f 85 3e 27 00 00    	jne    484c <s5m8767_pmic_probe+0x484c>
210e     210e:	83 3b 00             	cmpl   $0x0,(%rbx)
2111     2111:	0f 88 cc 04 00 00    	js     25e3 <s5m8767_pmic_probe+0x25e3>
2117     2117:	48 8b 7c 24 68       	mov    0x68(%rsp),%rdi
211c     211c:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	211f: R_X86_64_32S	.rodata..str.4.101063
2123     2123:	e8 00 00 00 00       	call   2128 <s5m8767_pmic_probe+0x2128>	2124: R_X86_64_PLT32	devm_gpio_request-0x4
2128     2128:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
2132     2132:	85 c0                	test   %eax,%eax
2134     2134:	0f 85 9e 34 00 00    	jne    55d8 <s5m8767_pmic_probe+0x55d8>
213a     213a:	48 8b 84 24 d8 00 00 00 	mov    0xd8(%rsp),%rax
2142     2142:	0f b6 04 08          	movzbl (%rax,%rcx,1),%eax
2146     2146:	84 c0                	test   %al,%al
2148     2148:	0f 85 d7 35 00 00    	jne    5725 <s5m8767_pmic_probe+0x5725>
214e     214e:	48 8b 44 24 78       	mov    0x78(%rsp),%rax
2153     2153:	8b 30                	mov    (%rax),%esi
2155     2155:	48 8b 7c 24 68       	mov    0x68(%rsp),%rdi
215a     215a:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	215d: R_X86_64_32S	.rodata..str.5.101064
2161     2161:	e8 00 00 00 00       	call   2166 <s5m8767_pmic_probe+0x2166>	2162: R_X86_64_PLT32	devm_gpio_request-0x4
2166     2166:	85 c0                	test   %eax,%eax
2168     2168:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
2172     2172:	0f 85 60 34 00 00    	jne    55d8 <s5m8767_pmic_probe+0x55d8>
2178     2178:	48 8b 84 24 f0 00 00 00 	mov    0xf0(%rsp),%rax
2180     2180:	0f b6 04 08          	movzbl (%rax,%rcx,1),%eax
2184     2184:	84 c0                	test   %al,%al
2186     2186:	0f 85 b3 36 00 00    	jne    583f <s5m8767_pmic_probe+0x583f>
218c     218c:	8b 33                	mov    (%rbx),%esi
218e     218e:	48 8b 7c 24 68       	mov    0x68(%rsp),%rdi
2193     2193:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	2196: R_X86_64_32S	.rodata..str.6.101065
219a     219a:	e8 00 00 00 00       	call   219f <s5m8767_pmic_probe+0x219f>	219b: R_X86_64_PLT32	devm_gpio_request-0x4
219f     219f:	85 c0                	test   %eax,%eax
21a1     21a1:	49 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r14
21ab     21ab:	0f 85 27 34 00 00    	jne    55d8 <s5m8767_pmic_probe+0x55d8>
21b1     21b1:	48 8b 84 24 80 00 00 00 	mov    0x80(%rsp),%rax
21b9     21b9:	42 0f b6 04 30       	movzbl (%rax,%r14,1),%eax
21be     21be:	84 c0                	test   %al,%al
21c0     21c0:	0f 85 d4 36 00 00    	jne    589a <s5m8767_pmic_probe+0x589a>
21c6     21c6:	48 8b 84 24 88 00 00 00 	mov    0x88(%rsp),%rax
21ce     21ce:	8b 38                	mov    (%rax),%edi
21d0     21d0:	48 8b 84 24 c8 00 00 00 	mov    0xc8(%rsp),%rax
21d8     21d8:	42 0f b6 04 30       	movzbl (%rax,%r14,1),%eax
21dd     21dd:	84 c0                	test   %al,%al
21df     21df:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
21e4     21e4:	0f 85 e2 36 00 00    	jne    58cc <s5m8767_pmic_probe+0x58cc>
21ea     21ea:	8b 19                	mov    (%rcx),%ebx
21ec     21ec:	c1 eb 02             	shr    $0x2,%ebx
21ef     21ef:	83 e3 01             	and    $0x1,%ebx
21f2     21f2:	e8 00 00 00 00       	call   21f7 <s5m8767_pmic_probe+0x21f7>	21f3: R_X86_64_PLT32	gpio_to_desc-0x4
21f7     21f7:	48 89 c7             	mov    %rax,%rdi
21fa     21fa:	89 de                	mov    %ebx,%esi
21fc     21fc:	e8 00 00 00 00       	call   2201 <s5m8767_pmic_probe+0x2201>	21fd: R_X86_64_PLT32	gpiod_direction_output_raw-0x4
2201     2201:	48 8b 84 24 d8 00 00 00 	mov    0xd8(%rsp),%rax
2209     2209:	42 0f b6 04 30       	movzbl (%rax,%r14,1),%eax
220e     220e:	84 c0                	test   %al,%al
2210     2210:	0f 85 e4 36 00 00    	jne    58fa <s5m8767_pmic_probe+0x58fa>
2216     2216:	48 8b 44 24 78       	mov    0x78(%rsp),%rax
221b     221b:	8b 38                	mov    (%rax),%edi
221d     221d:	48 8b 84 24 c8 00 00 00 	mov    0xc8(%rsp),%rax
2225     2225:	42 0f b6 04 30       	movzbl (%rax,%r14,1),%eax
222a     222a:	84 c0                	test   %al,%al
222c     222c:	0f 85 f4 36 00 00    	jne    5926 <s5m8767_pmic_probe+0x5926>
2232     2232:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
2237     2237:	8b 18                	mov    (%rax),%ebx
2239     2239:	d1 eb                	shr    %ebx
223b     223b:	83 e3 01             	and    $0x1,%ebx
223e     223e:	e8 00 00 00 00       	call   2243 <s5m8767_pmic_probe+0x2243>	223f: R_X86_64_PLT32	gpio_to_desc-0x4
2243     2243:	48 89 c7             	mov    %rax,%rdi
2246     2246:	89 de                	mov    %ebx,%esi
2248     2248:	e8 00 00 00 00       	call   224d <s5m8767_pmic_probe+0x224d>	2249: R_X86_64_PLT32	gpiod_direction_output_raw-0x4
224d     224d:	48 8b 84 24 f0 00 00 00 	mov    0xf0(%rsp),%rax
2255     2255:	42 0f b6 04 30       	movzbl (%rax,%r14,1),%eax
225a     225a:	84 c0                	test   %al,%al
225c     225c:	0f 85 ea 36 00 00    	jne    594c <s5m8767_pmic_probe+0x594c>
2262     2262:	48 8b 84 24 b0 00 00 00 	mov    0xb0(%rsp),%rax
226a     226a:	8b 38                	mov    (%rax),%edi
226c     226c:	48 8b 84 24 c8 00 00 00 	mov    0xc8(%rsp),%rax
2274     2274:	42 0f b6 04 30       	movzbl (%rax,%r14,1),%eax
2279     2279:	84 c0                	test   %al,%al
227b     227b:	0f 85 fd 36 00 00    	jne    597e <s5m8767_pmic_probe+0x597e>
2281     2281:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
2286     2286:	8b 18                	mov    (%rax),%ebx
2288     2288:	83 e3 01             	and    $0x1,%ebx
228b     228b:	e8 00 00 00 00       	call   2290 <s5m8767_pmic_probe+0x2290>	228c: R_X86_64_PLT32	gpio_to_desc-0x4
2290     2290:	48 89 c7             	mov    %rax,%rdi
2293     2293:	89 de                	mov    %ebx,%esi
2295     2295:	e8 00 00 00 00       	call   229a <s5m8767_pmic_probe+0x229a>	2296: R_X86_64_PLT32	gpiod_direction_output_raw-0x4
229a     229a:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
22a4     22a4:	48 8b 7c 24 50       	mov    0x50(%rsp),%rdi
22a9     22a9:	48 8b 84 24 28 01 00 00 	mov    0x128(%rsp),%rax
22b1     22b1:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
22b5     22b5:	84 c0                	test   %al,%al
22b7     22b7:	0f 85 9f 35 00 00    	jne    585c <s5m8767_pmic_probe+0x585c>
22bd     22bd:	8b 37                	mov    (%rdi),%esi
22bf     22bf:	48 8b 7c 24 68       	mov    0x68(%rsp),%rdi
22c4     22c4:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	22c7: R_X86_64_32S	.rodata..str.7.101066
22cb     22cb:	e8 00 00 00 00       	call   22d0 <s5m8767_pmic_probe+0x22d0>	22cc: R_X86_64_PLT32	devm_gpio_request-0x4
22d0     22d0:	85 c0                	test   %eax,%eax
22d2     22d2:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
22dc     22dc:	0f 85 f6 32 00 00    	jne    55d8 <s5m8767_pmic_probe+0x55d8>
22e2     22e2:	48 8b 84 24 20 01 00 00 	mov    0x120(%rsp),%rax
22ea     22ea:	0f b6 04 08          	movzbl (%rax,%rcx,1),%eax
22ee     22ee:	84 c0                	test   %al,%al
22f0     22f0:	0f 85 ae 36 00 00    	jne    59a4 <s5m8767_pmic_probe+0x59a4>
22f6     22f6:	48 8b 84 24 00 01 00 00 	mov    0x100(%rsp),%rax
22fe     22fe:	8b 30                	mov    (%rax),%esi
2300     2300:	48 8b 7c 24 68       	mov    0x68(%rsp),%rdi
2305     2305:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	2308: R_X86_64_32S	.rodata..str.8.101067
230c     230c:	e8 00 00 00 00       	call   2311 <s5m8767_pmic_probe+0x2311>	230d: R_X86_64_PLT32	devm_gpio_request-0x4
2311     2311:	85 c0                	test   %eax,%eax
2313     2313:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
231d     231d:	0f 85 b5 32 00 00    	jne    55d8 <s5m8767_pmic_probe+0x55d8>
2323     2323:	48 8b 84 24 10 01 00 00 	mov    0x110(%rsp),%rax
232b     232b:	0f b6 04 08          	movzbl (%rax,%rcx,1),%eax
232f     232f:	84 c0                	test   %al,%al
2331     2331:	0f 85 bc 36 00 00    	jne    59f3 <s5m8767_pmic_probe+0x59f3>
2337     2337:	48 8b 84 24 c0 00 00 00 	mov    0xc0(%rsp),%rax
233f     233f:	8b 30                	mov    (%rax),%esi
2341     2341:	48 8b 7c 24 68       	mov    0x68(%rsp),%rdi
2346     2346:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	2349: R_X86_64_32S	.rodata..str.9.101068
234d     234d:	e8 00 00 00 00       	call   2352 <s5m8767_pmic_probe+0x2352>	234e: R_X86_64_PLT32	devm_gpio_request-0x4
2352     2352:	85 c0                	test   %eax,%eax
2354     2354:	48 bb 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbx
235e     235e:	0f 85 74 32 00 00    	jne    55d8 <s5m8767_pmic_probe+0x55d8>
2364     2364:	48 8b 84 24 28 01 00 00 	mov    0x128(%rsp),%rax
236c     236c:	0f b6 04 18          	movzbl (%rax,%rbx,1),%eax
2370     2370:	84 c0                	test   %al,%al
2372     2372:	0f 85 a3 36 00 00    	jne    5a1b <s5m8767_pmic_probe+0x5a1b>
2378     2378:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
237d     237d:	8b 38                	mov    (%rax),%edi
237f     237f:	e8 00 00 00 00       	call   2384 <s5m8767_pmic_probe+0x2384>	2380: R_X86_64_PLT32	gpio_to_desc-0x4
2384     2384:	48 89 c7             	mov    %rax,%rdi
2387     2387:	31 f6                	xor    %esi,%esi
2389     2389:	e8 00 00 00 00       	call   238e <s5m8767_pmic_probe+0x238e>	238a: R_X86_64_PLT32	gpiod_direction_output_raw-0x4
238e     238e:	48 8b 84 24 20 01 00 00 	mov    0x120(%rsp),%rax
2396     2396:	0f b6 04 18          	movzbl (%rax,%rbx,1),%eax
239a     239a:	84 c0                	test   %al,%al
239c     239c:	4c 8b b4 24 00 01 00 00 	mov    0x100(%rsp),%r14
23a4     23a4:	0f 85 93 36 00 00    	jne    5a3d <s5m8767_pmic_probe+0x5a3d>
23aa     23aa:	41 8b 3e             	mov    (%r14),%edi
23ad     23ad:	e8 00 00 00 00       	call   23b2 <s5m8767_pmic_probe+0x23b2>	23ae: R_X86_64_PLT32	gpio_to_desc-0x4
23b2     23b2:	48 89 c7             	mov    %rax,%rdi
23b5     23b5:	31 f6                	xor    %esi,%esi
23b7     23b7:	e8 00 00 00 00       	call   23bc <s5m8767_pmic_probe+0x23bc>	23b8: R_X86_64_PLT32	gpiod_direction_output_raw-0x4
23bc     23bc:	48 8b 84 24 10 01 00 00 	mov    0x110(%rsp),%rax
23c4     23c4:	0f b6 04 18          	movzbl (%rax,%rbx,1),%eax
23c8     23c8:	84 c0                	test   %al,%al
23ca     23ca:	0f 85 8b 36 00 00    	jne    5a5b <s5m8767_pmic_probe+0x5a5b>
23d0     23d0:	48 8b 84 24 c0 00 00 00 	mov    0xc0(%rsp),%rax
23d8     23d8:	8b 38                	mov    (%rax),%edi
23da     23da:	e8 00 00 00 00       	call   23df <s5m8767_pmic_probe+0x23df>	23db: R_X86_64_PLT32	gpio_to_desc-0x4
23df     23df:	48 89 c7             	mov    %rax,%rdi
23e2     23e2:	31 f6                	xor    %esi,%esi
23e4     23e4:	e8 00 00 00 00       	call   23e9 <s5m8767_pmic_probe+0x23e9>	23e5: R_X86_64_PLT32	gpiod_direction_output_raw-0x4
23e9     23e9:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
23ee     23ee:	80 3c 18 00          	cmpb   $0x0,(%rax,%rbx,1)
23f2     23f2:	49 89 de             	mov    %rbx,%r14
23f5     23f5:	48 8b 5c 24 38       	mov    0x38(%rsp),%rbx
23fa     23fa:	74 12                	je     240e <s5m8767_pmic_probe+0x240e>
23fc     23fc:	48 89 df             	mov    %rbx,%rdi
23ff     23ff:	e8 00 00 00 00       	call   2404 <s5m8767_pmic_probe+0x2404>	2400: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2404     2404:	49 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r14
240e     240e:	48 8b 1b             	mov    (%rbx),%rbx
2411     2411:	48 83 c3 10          	add    $0x10,%rbx
2415     2415:	48 89 d8             	mov    %rbx,%rax
2418     2418:	48 c1 e8 03          	shr    $0x3,%rax
241c     241c:	42 80 3c 30 00       	cmpb   $0x0,(%rax,%r14,1)
2421     2421:	74 12                	je     2435 <s5m8767_pmic_probe+0x2435>
2423     2423:	48 89 df             	mov    %rbx,%rdi
2426     2426:	e8 00 00 00 00       	call   242b <s5m8767_pmic_probe+0x242b>	2427: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
242b     242b:	49 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r14
2435     2435:	48 8b 3b             	mov    (%rbx),%rdi
2438     2438:	42 0f b6 44 35 00    	movzbl 0x0(%rbp,%r14,1),%eax
243e     243e:	84 c0                	test   %al,%al
2440     2440:	0f 85 3d 36 00 00    	jne    5a83 <s5m8767_pmic_probe+0x5a83>
2446     2446:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
244b     244b:	0f b6 08             	movzbl (%rax),%ecx
244e     244e:	01 c9                	add    %ecx,%ecx
2450     2450:	be 34 00 00 00       	mov    $0x34,%esi
2455     2455:	ba 02 00 00 00       	mov    $0x2,%edx
245a     245a:	45 31 c0             	xor    %r8d,%r8d
245d     245d:	45 31 c9             	xor    %r9d,%r9d
2460     2460:	6a 00                	push   $0x0
2462     2462:	e8 00 00 00 00       	call   2467 <s5m8767_pmic_probe+0x2467>	2463: R_X86_64_PLT32	regmap_update_bits_base-0x4
2467     2467:	48 83 c4 08          	add    $0x8,%rsp
246b     246b:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
2470     2470:	42 80 3c 30 00       	cmpb   $0x0,(%rax,%r14,1)
2475     2475:	48 8b 5c 24 38       	mov    0x38(%rsp),%rbx
247a     247a:	48 8b ac 24 38 01 00 00 	mov    0x138(%rsp),%rbp
2482     2482:	74 12                	je     2496 <s5m8767_pmic_probe+0x2496>
2484     2484:	48 89 df             	mov    %rbx,%rdi
2487     2487:	e8 00 00 00 00       	call   248c <s5m8767_pmic_probe+0x248c>	2488: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
248c     248c:	49 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r14
2496     2496:	48 8b 1b             	mov    (%rbx),%rbx
2499     2499:	48 83 c3 10          	add    $0x10,%rbx
249d     249d:	48 89 d8             	mov    %rbx,%rax
24a0     24a0:	48 c1 e8 03          	shr    $0x3,%rax
24a4     24a4:	42 80 3c 30 00       	cmpb   $0x0,(%rax,%r14,1)
24a9     24a9:	74 12                	je     24bd <s5m8767_pmic_probe+0x24bd>
24ab     24ab:	48 89 df             	mov    %rbx,%rdi
24ae     24ae:	e8 00 00 00 00       	call   24b3 <s5m8767_pmic_probe+0x24b3>	24af: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
24b3     24b3:	49 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r14
24bd     24bd:	48 8b 3b             	mov    (%rbx),%rdi
24c0     24c0:	43 0f b6 44 35 00    	movzbl 0x0(%r13,%r14,1),%eax
24c6     24c6:	84 c0                	test   %al,%al
24c8     24c8:	0f 85 da 35 00 00    	jne    5aa8 <s5m8767_pmic_probe+0x5aa8>
24ce     24ce:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
24d3     24d3:	0f b6 08             	movzbl (%rax),%ecx
24d6     24d6:	01 c9                	add    %ecx,%ecx
24d8     24d8:	be 3d 00 00 00       	mov    $0x3d,%esi
24dd     24dd:	ba 02 00 00 00       	mov    $0x2,%edx
24e2     24e2:	45 31 c0             	xor    %r8d,%r8d
24e5     24e5:	45 31 c9             	xor    %r9d,%r9d
24e8     24e8:	6a 00                	push   $0x0
24ea     24ea:	e8 00 00 00 00       	call   24ef <s5m8767_pmic_probe+0x24ef>	24eb: R_X86_64_PLT32	regmap_update_bits_base-0x4
24ef     24ef:	48 83 c4 08          	add    $0x8,%rsp
24f3     24f3:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
24f8     24f8:	42 80 3c 30 00       	cmpb   $0x0,(%rax,%r14,1)
24fd     24fd:	48 8b 5c 24 38       	mov    0x38(%rsp),%rbx
2502     2502:	4c 8b ac 24 f8 00 00 00 	mov    0xf8(%rsp),%r13
250a     250a:	74 12                	je     251e <s5m8767_pmic_probe+0x251e>
250c     250c:	48 89 df             	mov    %rbx,%rdi
250f     250f:	e8 00 00 00 00       	call   2514 <s5m8767_pmic_probe+0x2514>	2510: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2514     2514:	49 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r14
251e     251e:	48 8b 1b             	mov    (%rbx),%rbx
2521     2521:	48 83 c3 10          	add    $0x10,%rbx
2525     2525:	48 89 d8             	mov    %rbx,%rax
2528     2528:	48 c1 e8 03          	shr    $0x3,%rax
252c     252c:	42 80 3c 30 00       	cmpb   $0x0,(%rax,%r14,1)
2531     2531:	74 12                	je     2545 <s5m8767_pmic_probe+0x2545>
2533     2533:	48 89 df             	mov    %rbx,%rdi
2536     2536:	e8 00 00 00 00       	call   253b <s5m8767_pmic_probe+0x253b>	2537: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
253b     253b:	49 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r14
2545     2545:	48 8b 3b             	mov    (%rbx),%rdi
2548     2548:	48 8b 84 24 d0 00 00 00 	mov    0xd0(%rsp),%rax
2550     2550:	42 0f b6 04 30       	movzbl (%rax,%r14,1),%eax
2555     2555:	84 c0                	test   %al,%al
2557     2557:	0f 85 70 35 00 00    	jne    5acd <s5m8767_pmic_probe+0x5acd>
255d     255d:	48 8b 84 24 90 00 00 00 	mov    0x90(%rsp),%rax
2565     2565:	0f b6 08             	movzbl (%rax),%ecx
2568     2568:	01 c9                	add    %ecx,%ecx
256a     256a:	45 31 f6             	xor    %r14d,%r14d
256d     256d:	be 46 00 00 00       	mov    $0x46,%esi
2572     2572:	ba 02 00 00 00       	mov    $0x2,%edx
2577     2577:	45 31 c0             	xor    %r8d,%r8d
257a     257a:	45 31 c9             	xor    %r9d,%r9d
257d     257d:	6a 00                	push   $0x0
257f     257f:	e8 00 00 00 00       	call   2584 <s5m8767_pmic_probe+0x2584>	2580: R_X86_64_PLT32	regmap_update_bits_base-0x4
2584     2584:	48 83 c4 08          	add    $0x8,%rsp
2588     2588:	48 8b 54 24 18       	mov    0x18(%rsp),%rdx
258d     258d:	89 d0                	mov    %edx,%eax
258f     258f:	24 07                	and    $0x7,%al
2591     2591:	88 84 24 d8 00 00 00 	mov    %al,0xd8(%rsp)
2598     2598:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
259d     259d:	89 f8                	mov    %edi,%eax
259f     259f:	24 07                	and    $0x7,%al
25a1     25a1:	88 84 24 90 00 00 00 	mov    %al,0x90(%rsp)
25a8     25a8:	4c 8b 54 24 08       	mov    0x8(%rsp),%r10
25ad     25ad:	44 89 d0             	mov    %r10d,%eax
25b0     25b0:	24 07                	and    $0x7,%al
25b2     25b2:	88 44 24 50          	mov    %al,0x50(%rsp)
25b6     25b6:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
25c0     25c0:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
25c5     25c5:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
25ca     25ca:	4c 8b 4c 24 10       	mov    0x10(%rsp),%r9
25cf     25cf:	48 8b 5c 24 38       	mov    0x38(%rsp),%rbx
25d4     25d4:	e9 ad 00 00 00       	jmp    2686 <s5m8767_pmic_probe+0x2686>
25d9     25d9:	b8 f4 ff ff ff       	mov    $0xfffffff4,%eax
25de     25de:	e9 f5 2f 00 00       	jmp    55d8 <s5m8767_pmic_probe+0x55d8>
25e3     25e3:	48 8b 7c 24 68       	mov    0x68(%rsp),%rdi
25e8     25e8:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	25eb: R_X86_64_32S	.rodata..str.3.101062
25ef     25ef:	e9 da 2f 00 00       	jmp    55ce <s5m8767_pmic_probe+0x55ce>
25f4     25f4:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
25fe     25fe:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
2603     2603:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
2607     2607:	48 8b 5c 24 60       	mov    0x60(%rsp),%rbx
260c     260c:	74 08                	je     2616 <s5m8767_pmic_probe+0x2616>
260e     260e:	48 89 df             	mov    %rbx,%rdi
2611     2611:	e8 00 00 00 00       	call   2616 <s5m8767_pmic_probe+0x2616>	2612: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2616     2616:	48 8b 3b             	mov    (%rbx),%rdi
2619     2619:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	261c: R_X86_64_32S	.rodata..str.16.101075
2620     2620:	e9 a9 2f 00 00       	jmp    55ce <s5m8767_pmic_probe+0x55ce>
2625     2625:	48 8b 3b             	mov    (%rbx),%rdi
2628     2628:	4b 8d 5c 34 3a       	lea    0x3a(%r12,%r14,1),%rbx
262d     262d:	48 89 d8             	mov    %rbx,%rax
2630     2630:	48 c1 e8 03          	shr    $0x3,%rax
2634     2634:	0f b6 04 30          	movzbl (%rax,%rsi,1),%eax
2638     2638:	84 c0                	test   %al,%al
263a     263a:	0f 85 c5 02 00 00    	jne    2905 <s5m8767_pmic_probe+0x2905>
2640     2640:	0f b6 13             	movzbl (%rbx),%edx
2643     2643:	41 8d 76 47          	lea    0x47(%r14),%esi
2647     2647:	e8 00 00 00 00       	call   264c <s5m8767_pmic_probe+0x264c>	2648: R_X86_64_PLT32	regmap_write-0x4
264c     264c:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
2656     2656:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
265b     265b:	48 8b 54 24 18       	mov    0x18(%rsp),%rdx
2660     2660:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
2665     2665:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
266a     266a:	4c 8b 4c 24 10       	mov    0x10(%rsp),%r9
266f     266f:	4c 8b 54 24 08       	mov    0x8(%rsp),%r10
2674     2674:	48 8b 5c 24 38       	mov    0x38(%rsp),%rbx
2679     2679:	49 ff c6             	inc    %r14
267c     267c:	49 83 fe 08          	cmp    $0x8,%r14
2680     2680:	0f 84 fa 03 00 00    	je     2a80 <s5m8767_pmic_probe+0x2a80>
2686     2686:	41 0f b6 04 30       	movzbl (%r8,%rsi,1),%eax
268b     268b:	84 c0                	test   %al,%al
268d     268d:	0f 85 b0 01 00 00    	jne    2843 <s5m8767_pmic_probe+0x2843>
2693     2693:	80 3a 00             	cmpb   $0x0,(%rdx)
2696     2696:	0f 84 97 00 00 00    	je     2733 <s5m8767_pmic_probe+0x2733>
269c     269c:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
26a1     26a1:	80 3c 30 00          	cmpb   $0x0,(%rax,%rsi,1)
26a5     26a5:	74 12                	je     26b9 <s5m8767_pmic_probe+0x26b9>
26a7     26a7:	48 89 df             	mov    %rbx,%rdi
26aa     26aa:	e8 00 00 00 00       	call   26af <s5m8767_pmic_probe+0x26af>	26ab: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
26af     26af:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
26b9     26b9:	48 8b 1b             	mov    (%rbx),%rbx
26bc     26bc:	48 83 c3 10          	add    $0x10,%rbx
26c0     26c0:	48 89 d8             	mov    %rbx,%rax
26c3     26c3:	48 c1 e8 03          	shr    $0x3,%rax
26c7     26c7:	80 3c 30 00          	cmpb   $0x0,(%rax,%rsi,1)
26cb     26cb:	74 12                	je     26df <s5m8767_pmic_probe+0x26df>
26cd     26cd:	48 89 df             	mov    %rbx,%rdi
26d0     26d0:	e8 00 00 00 00       	call   26d5 <s5m8767_pmic_probe+0x26d5>	26d1: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
26d5     26d5:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
26df     26df:	48 8b 3b             	mov    (%rbx),%rdi
26e2     26e2:	4b 8d 5c 34 2a       	lea    0x2a(%r12,%r14,1),%rbx
26e7     26e7:	48 89 d8             	mov    %rbx,%rax
26ea     26ea:	48 c1 e8 03          	shr    $0x3,%rax
26ee     26ee:	0f b6 04 30          	movzbl (%rax,%rsi,1),%eax
26f2     26f2:	84 c0                	test   %al,%al
26f4     26f4:	0f 85 38 02 00 00    	jne    2932 <s5m8767_pmic_probe+0x2932>
26fa     26fa:	0f b6 13             	movzbl (%rbx),%edx
26fd     26fd:	41 8d 76 35          	lea    0x35(%r14),%esi
2701     2701:	e8 00 00 00 00       	call   2706 <s5m8767_pmic_probe+0x2706>	2702: R_X86_64_PLT32	regmap_write-0x4
2706     2706:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
2710     2710:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
2715     2715:	48 8b 54 24 18       	mov    0x18(%rsp),%rdx
271a     271a:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
271f     271f:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
2724     2724:	4c 8b 4c 24 10       	mov    0x10(%rsp),%r9
2729     2729:	4c 8b 54 24 08       	mov    0x8(%rsp),%r10
272e     272e:	48 8b 5c 24 38       	mov    0x38(%rsp),%rbx
2733     2733:	41 0f b6 04 31       	movzbl (%r9,%rsi,1),%eax
2738     2738:	84 c0                	test   %al,%al
273a     273a:	0f 85 47 01 00 00    	jne    2887 <s5m8767_pmic_probe+0x2887>
2740     2740:	80 3f 00             	cmpb   $0x0,(%rdi)
2743     2743:	0f 84 97 00 00 00    	je     27e0 <s5m8767_pmic_probe+0x27e0>
2749     2749:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
274e     274e:	80 3c 30 00          	cmpb   $0x0,(%rax,%rsi,1)
2752     2752:	74 12                	je     2766 <s5m8767_pmic_probe+0x2766>
2754     2754:	48 89 df             	mov    %rbx,%rdi
2757     2757:	e8 00 00 00 00       	call   275c <s5m8767_pmic_probe+0x275c>	2758: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
275c     275c:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
2766     2766:	48 8b 1b             	mov    (%rbx),%rbx
2769     2769:	48 83 c3 10          	add    $0x10,%rbx
276d     276d:	48 89 d8             	mov    %rbx,%rax
2770     2770:	48 c1 e8 03          	shr    $0x3,%rax
2774     2774:	80 3c 30 00          	cmpb   $0x0,(%rax,%rsi,1)
2778     2778:	74 12                	je     278c <s5m8767_pmic_probe+0x278c>
277a     277a:	48 89 df             	mov    %rbx,%rdi
277d     277d:	e8 00 00 00 00       	call   2782 <s5m8767_pmic_probe+0x2782>	277e: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2782     2782:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
278c     278c:	48 8b 3b             	mov    (%rbx),%rdi
278f     278f:	4b 8d 5c 34 32       	lea    0x32(%r12,%r14,1),%rbx
2794     2794:	48 89 d8             	mov    %rbx,%rax
2797     2797:	48 c1 e8 03          	shr    $0x3,%rax
279b     279b:	0f b6 04 30          	movzbl (%rax,%rsi,1),%eax
279f     279f:	84 c0                	test   %al,%al
27a1     27a1:	0f 85 b8 01 00 00    	jne    295f <s5m8767_pmic_probe+0x295f>
27a7     27a7:	0f b6 13             	movzbl (%rbx),%edx
27aa     27aa:	41 8d 76 3e          	lea    0x3e(%r14),%esi
27ae     27ae:	e8 00 00 00 00       	call   27b3 <s5m8767_pmic_probe+0x27b3>	27af: R_X86_64_PLT32	regmap_write-0x4
27b3     27b3:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
27bd     27bd:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
27c2     27c2:	48 8b 54 24 18       	mov    0x18(%rsp),%rdx
27c7     27c7:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
27cc     27cc:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
27d1     27d1:	4c 8b 4c 24 10       	mov    0x10(%rsp),%r9
27d6     27d6:	4c 8b 54 24 08       	mov    0x8(%rsp),%r10
27db     27db:	48 8b 5c 24 38       	mov    0x38(%rsp),%rbx
27e0     27e0:	41 0f b6 04 37       	movzbl (%r15,%rsi,1),%eax
27e5     27e5:	84 c0                	test   %al,%al
27e7     27e7:	0f 85 d9 00 00 00    	jne    28c6 <s5m8767_pmic_probe+0x28c6>
27ed     27ed:	41 80 3a 00          	cmpb   $0x0,(%r10)
27f1     27f1:	0f 84 82 fe ff ff    	je     2679 <s5m8767_pmic_probe+0x2679>
27f7     27f7:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
27fc     27fc:	80 3c 30 00          	cmpb   $0x0,(%rax,%rsi,1)
2800     2800:	74 12                	je     2814 <s5m8767_pmic_probe+0x2814>
2802     2802:	48 89 df             	mov    %rbx,%rdi
2805     2805:	e8 00 00 00 00       	call   280a <s5m8767_pmic_probe+0x280a>	2806: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
280a     280a:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
2814     2814:	48 8b 1b             	mov    (%rbx),%rbx
2817     2817:	48 83 c3 10          	add    $0x10,%rbx
281b     281b:	48 89 d8             	mov    %rbx,%rax
281e     281e:	48 c1 e8 03          	shr    $0x3,%rax
2822     2822:	80 3c 30 00          	cmpb   $0x0,(%rax,%rsi,1)
2826     2826:	0f 84 f9 fd ff ff    	je     2625 <s5m8767_pmic_probe+0x2625>
282c     282c:	48 89 df             	mov    %rbx,%rdi
282f     282f:	e8 00 00 00 00       	call   2834 <s5m8767_pmic_probe+0x2834>	2830: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2834     2834:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
283e     283e:	e9 e2 fd ff ff       	jmp    2625 <s5m8767_pmic_probe+0x2625>
2843     2843:	38 84 24 d8 00 00 00 	cmp    %al,0xd8(%rsp)
284a     284a:	0f 8c 43 fe ff ff    	jl     2693 <s5m8767_pmic_probe+0x2693>
2850     2850:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
2855     2855:	e8 00 00 00 00       	call   285a <s5m8767_pmic_probe+0x285a>	2856: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
285a     285a:	4c 8b 54 24 08       	mov    0x8(%rsp),%r10
285f     285f:	4c 8b 4c 24 10       	mov    0x10(%rsp),%r9
2864     2864:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
2869     2869:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
286e     286e:	48 8b 54 24 18       	mov    0x18(%rsp),%rdx
2873     2873:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
2878     2878:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
2882     2882:	e9 0c fe ff ff       	jmp    2693 <s5m8767_pmic_probe+0x2693>
2887     2887:	38 84 24 90 00 00 00 	cmp    %al,0x90(%rsp)
288e     288e:	0f 8c ac fe ff ff    	jl     2740 <s5m8767_pmic_probe+0x2740>
2894     2894:	e8 00 00 00 00       	call   2899 <s5m8767_pmic_probe+0x2899>	2895: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
2899     2899:	4c 8b 54 24 08       	mov    0x8(%rsp),%r10
289e     289e:	4c 8b 4c 24 10       	mov    0x10(%rsp),%r9
28a3     28a3:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
28a8     28a8:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
28ad     28ad:	48 8b 54 24 18       	mov    0x18(%rsp),%rdx
28b2     28b2:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
28b7     28b7:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
28c1     28c1:	e9 7a fe ff ff       	jmp    2740 <s5m8767_pmic_probe+0x2740>
28c6     28c6:	38 44 24 50          	cmp    %al,0x50(%rsp)
28ca     28ca:	0f 8c 1d ff ff ff    	jl     27ed <s5m8767_pmic_probe+0x27ed>
28d0     28d0:	4c 89 d7             	mov    %r10,%rdi
28d3     28d3:	e8 00 00 00 00       	call   28d8 <s5m8767_pmic_probe+0x28d8>	28d4: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
28d8     28d8:	4c 8b 54 24 08       	mov    0x8(%rsp),%r10
28dd     28dd:	4c 8b 4c 24 10       	mov    0x10(%rsp),%r9
28e2     28e2:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
28e7     28e7:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
28ec     28ec:	48 8b 54 24 18       	mov    0x18(%rsp),%rdx
28f1     28f1:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
28f6     28f6:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
2900     2900:	e9 e8 fe ff ff       	jmp    27ed <s5m8767_pmic_probe+0x27ed>
2905     2905:	43 8d 0c 34          	lea    (%r12,%r14,1),%ecx
2909     2909:	80 c1 3a             	add    $0x3a,%cl
290c     290c:	80 e1 07             	and    $0x7,%cl
290f     290f:	38 c1                	cmp    %al,%cl
2911     2911:	0f 8c 29 fd ff ff    	jl     2640 <s5m8767_pmic_probe+0x2640>
2917     2917:	49 89 fd             	mov    %rdi,%r13
291a     291a:	48 89 df             	mov    %rbx,%rdi
291d     291d:	e8 00 00 00 00       	call   2922 <s5m8767_pmic_probe+0x2922>	291e: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
2922     2922:	4c 89 ef             	mov    %r13,%rdi
2925     2925:	4c 8b ac 24 f8 00 00 00 	mov    0xf8(%rsp),%r13
292d     292d:	e9 0e fd ff ff       	jmp    2640 <s5m8767_pmic_probe+0x2640>
2932     2932:	43 8d 0c 34          	lea    (%r12,%r14,1),%ecx
2936     2936:	80 c1 2a             	add    $0x2a,%cl
2939     2939:	80 e1 07             	and    $0x7,%cl
293c     293c:	38 c1                	cmp    %al,%cl
293e     293e:	0f 8c b6 fd ff ff    	jl     26fa <s5m8767_pmic_probe+0x26fa>
2944     2944:	49 89 fd             	mov    %rdi,%r13
2947     2947:	48 89 df             	mov    %rbx,%rdi
294a     294a:	e8 00 00 00 00       	call   294f <s5m8767_pmic_probe+0x294f>	294b: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
294f     294f:	4c 89 ef             	mov    %r13,%rdi
2952     2952:	4c 8b ac 24 f8 00 00 00 	mov    0xf8(%rsp),%r13
295a     295a:	e9 9b fd ff ff       	jmp    26fa <s5m8767_pmic_probe+0x26fa>
295f     295f:	43 8d 0c 34          	lea    (%r12,%r14,1),%ecx
2963     2963:	80 c1 32             	add    $0x32,%cl
2966     2966:	80 e1 07             	and    $0x7,%cl
2969     2969:	38 c1                	cmp    %al,%cl
296b     296b:	0f 8c 36 fe ff ff    	jl     27a7 <s5m8767_pmic_probe+0x27a7>
2971     2971:	49 89 fd             	mov    %rdi,%r13
2974     2974:	48 89 df             	mov    %rbx,%rdi
2977     2977:	e8 00 00 00 00       	call   297c <s5m8767_pmic_probe+0x297c>	2978: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
297c     297c:	4c 89 ef             	mov    %r13,%rdi
297f     297f:	4c 8b ac 24 f8 00 00 00 	mov    0xf8(%rsp),%r13
2987     2987:	e9 1b fe ff ff       	jmp    27a7 <s5m8767_pmic_probe+0x27a7>
298c     298c:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
2996     2996:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
299b     299b:	80 3c 0a 00          	cmpb   $0x0,(%rdx,%rcx,1)
299f     299f:	4c 8b 74 24 60       	mov    0x60(%rsp),%r14
29a4     29a4:	74 3e                	je     29e4 <s5m8767_pmic_probe+0x29e4>
29a6     29a6:	4c 89 f7             	mov    %r14,%rdi
29a9     29a9:	89 c5                	mov    %eax,%ebp
29ab     29ab:	e8 00 00 00 00       	call   29b0 <s5m8767_pmic_probe+0x29b0>	29ac: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
29b0     29b0:	eb 30                	jmp    29e2 <s5m8767_pmic_probe+0x29e2>
29b2     29b2:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
29bc     29bc:	4c 8b 74 24 60       	mov    0x60(%rsp),%r14
29c1     29c1:	eb 0a                	jmp    29cd <s5m8767_pmic_probe+0x29cd>
29c3     29c3:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
29cd     29cd:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
29d2     29d2:	80 3c 0a 00          	cmpb   $0x0,(%rdx,%rcx,1)
29d6     29d6:	74 0c                	je     29e4 <s5m8767_pmic_probe+0x29e4>
29d8     29d8:	4c 89 f7             	mov    %r14,%rdi
29db     29db:	89 c5                	mov    %eax,%ebp
29dd     29dd:	e8 00 00 00 00       	call   29e2 <s5m8767_pmic_probe+0x29e2>	29de: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
29e2     29e2:	89 e8                	mov    %ebp,%eax
29e4     29e4:	49 8b 3e             	mov    (%r14),%rdi
29e7     29e7:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	29ea: R_X86_64_32S	.rodata..str.39.101097
29ee     29ee:	89 da                	mov    %ebx,%edx
29f0     29f0:	89 c1                	mov    %eax,%ecx
29f2     29f2:	e8 00 00 00 00       	call   29f7 <s5m8767_pmic_probe+0x29f7>	29f3: R_X86_64_PLT32	_dev_err-0x4
29f7     29f7:	e9 d7 2b 00 00       	jmp    55d3 <s5m8767_pmic_probe+0x55d3>
29fc     29fc:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
2a06     2a06:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
2a0b     2a0b:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
2a0f     2a0f:	74 08                	je     2a19 <s5m8767_pmic_probe+0x2a19>
2a11     2a11:	48 89 df             	mov    %rbx,%rdi
2a14     2a14:	e8 00 00 00 00       	call   2a19 <s5m8767_pmic_probe+0x2a19>	2a15: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2a19     2a19:	48 8b 3b             	mov    (%rbx),%rdi
2a1c     2a1c:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	2a1f: R_X86_64_32S	.rodata..str.24.101083
2a23     2a23:	e9 a6 2b 00 00       	jmp    55ce <s5m8767_pmic_probe+0x55ce>
2a28     2a28:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
2a32     2a32:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
2a37     2a37:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
2a3b     2a3b:	74 08                	je     2a45 <s5m8767_pmic_probe+0x2a45>
2a3d     2a3d:	48 89 df             	mov    %rbx,%rdi
2a40     2a40:	e8 00 00 00 00       	call   2a45 <s5m8767_pmic_probe+0x2a45>	2a41: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2a45     2a45:	48 8b 3b             	mov    (%rbx),%rdi
2a48     2a48:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	2a4b: R_X86_64_32S	.rodata..str.27.101086
2a4f     2a4f:	e9 7a 2b 00 00       	jmp    55ce <s5m8767_pmic_probe+0x55ce>
2a54     2a54:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
2a5e     2a5e:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
2a63     2a63:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
2a67     2a67:	74 08                	je     2a71 <s5m8767_pmic_probe+0x2a71>
2a69     2a69:	48 89 df             	mov    %rbx,%rdi
2a6c     2a6c:	e8 00 00 00 00       	call   2a71 <s5m8767_pmic_probe+0x2a71>	2a6d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2a71     2a71:	48 8b 3b             	mov    (%rbx),%rdi
2a74     2a74:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	2a77: R_X86_64_32S	.rodata..str.30.101089
2a7b     2a7b:	e9 4e 2b 00 00       	jmp    55ce <s5m8767_pmic_probe+0x55ce>
2a80     2a80:	4c 8b b4 24 40 01 00 00 	mov    0x140(%rsp),%r14
2a88     2a88:	41 0f b6 04 36       	movzbl (%r14,%rsi,1),%eax
2a8d     2a8d:	84 c0                	test   %al,%al
2a8f     2a8f:	0f 85 63 30 00 00    	jne    5af8 <s5m8767_pmic_probe+0x5af8>
2a95     2a95:	48 8b 84 24 a8 00 00 00 	mov    0xa8(%rsp),%rax
2a9d     2a9d:	80 38 00             	cmpb   $0x0,(%rax)
2aa0     2aa0:	74 70                	je     2b12 <s5m8767_pmic_probe+0x2b12>
2aa2     2aa2:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
2aa7     2aa7:	80 3c 30 00          	cmpb   $0x0,(%rax,%rsi,1)
2aab     2aab:	74 12                	je     2abf <s5m8767_pmic_probe+0x2abf>
2aad     2aad:	48 89 df             	mov    %rbx,%rdi
2ab0     2ab0:	e8 00 00 00 00       	call   2ab5 <s5m8767_pmic_probe+0x2ab5>	2ab1: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2ab5     2ab5:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
2abf     2abf:	48 8b 1b             	mov    (%rbx),%rbx
2ac2     2ac2:	48 83 c3 10          	add    $0x10,%rbx
2ac6     2ac6:	48 89 d8             	mov    %rbx,%rax
2ac9     2ac9:	48 c1 e8 03          	shr    $0x3,%rax
2acd     2acd:	80 3c 30 00          	cmpb   $0x0,(%rax,%rsi,1)
2ad1     2ad1:	74 08                	je     2adb <s5m8767_pmic_probe+0x2adb>
2ad3     2ad3:	48 89 df             	mov    %rbx,%rdi
2ad6     2ad6:	e8 00 00 00 00       	call   2adb <s5m8767_pmic_probe+0x2adb>	2ad7: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2adb     2adb:	48 8b 3b             	mov    (%rbx),%rdi
2ade     2ade:	be 0f 00 00 00       	mov    $0xf,%esi
2ae3     2ae3:	ba 08 00 00 00       	mov    $0x8,%edx
2ae8     2ae8:	b9 08 00 00 00       	mov    $0x8,%ecx
2aed     2aed:	45 31 c0             	xor    %r8d,%r8d
2af0     2af0:	45 31 c9             	xor    %r9d,%r9d
2af3     2af3:	6a 00                	push   $0x0
2af5     2af5:	e8 00 00 00 00       	call   2afa <s5m8767_pmic_probe+0x2afa>	2af6: R_X86_64_PLT32	regmap_update_bits_base-0x4
2afa     2afa:	48 83 c4 08          	add    $0x8,%rsp
2afe     2afe:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
2b08     2b08:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
2b0d     2b0d:	48 8b 5c 24 38       	mov    0x38(%rsp),%rbx
2b12     2b12:	0f b6 44 35 00       	movzbl 0x0(%rbp,%rsi,1),%eax
2b17     2b17:	84 c0                	test   %al,%al
2b19     2b19:	0f 85 12 30 00 00    	jne    5b31 <s5m8767_pmic_probe+0x5b31>
2b1f     2b1f:	48 8b 84 24 a0 00 00 00 	mov    0xa0(%rsp),%rax
2b27     2b27:	80 38 00             	cmpb   $0x0,(%rax)
2b2a     2b2a:	74 70                	je     2b9c <s5m8767_pmic_probe+0x2b9c>
2b2c     2b2c:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
2b31     2b31:	80 3c 30 00          	cmpb   $0x0,(%rax,%rsi,1)
2b35     2b35:	74 12                	je     2b49 <s5m8767_pmic_probe+0x2b49>
2b37     2b37:	48 89 df             	mov    %rbx,%rdi
2b3a     2b3a:	e8 00 00 00 00       	call   2b3f <s5m8767_pmic_probe+0x2b3f>	2b3b: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2b3f     2b3f:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
2b49     2b49:	48 8b 1b             	mov    (%rbx),%rbx
2b4c     2b4c:	48 83 c3 10          	add    $0x10,%rbx
2b50     2b50:	48 89 d8             	mov    %rbx,%rax
2b53     2b53:	48 c1 e8 03          	shr    $0x3,%rax
2b57     2b57:	80 3c 30 00          	cmpb   $0x0,(%rax,%rsi,1)
2b5b     2b5b:	74 08                	je     2b65 <s5m8767_pmic_probe+0x2b65>
2b5d     2b5d:	48 89 df             	mov    %rbx,%rdi
2b60     2b60:	e8 00 00 00 00       	call   2b65 <s5m8767_pmic_probe+0x2b65>	2b61: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2b65     2b65:	48 8b 3b             	mov    (%rbx),%rdi
2b68     2b68:	be 0f 00 00 00       	mov    $0xf,%esi
2b6d     2b6d:	ba 04 00 00 00       	mov    $0x4,%edx
2b72     2b72:	b9 04 00 00 00       	mov    $0x4,%ecx
2b77     2b77:	45 31 c0             	xor    %r8d,%r8d
2b7a     2b7a:	45 31 c9             	xor    %r9d,%r9d
2b7d     2b7d:	6a 00                	push   $0x0
2b7f     2b7f:	e8 00 00 00 00       	call   2b84 <s5m8767_pmic_probe+0x2b84>	2b80: R_X86_64_PLT32	regmap_update_bits_base-0x4
2b84     2b84:	48 83 c4 08          	add    $0x8,%rsp
2b88     2b88:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
2b92     2b92:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
2b97     2b97:	48 8b 5c 24 38       	mov    0x38(%rsp),%rbx
2b9c     2b9c:	41 0f b6 44 35 00    	movzbl 0x0(%r13,%rsi,1),%eax
2ba2     2ba2:	84 c0                	test   %al,%al
2ba4     2ba4:	0f 85 c0 2f 00 00    	jne    5b6a <s5m8767_pmic_probe+0x5b6a>
2baa     2baa:	48 8b 84 24 98 00 00 00 	mov    0x98(%rsp),%rax
2bb2     2bb2:	80 38 00             	cmpb   $0x0,(%rax)
2bb5     2bb5:	74 6b                	je     2c22 <s5m8767_pmic_probe+0x2c22>
2bb7     2bb7:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
2bbc     2bbc:	80 3c 30 00          	cmpb   $0x0,(%rax,%rsi,1)
2bc0     2bc0:	74 12                	je     2bd4 <s5m8767_pmic_probe+0x2bd4>
2bc2     2bc2:	48 89 df             	mov    %rbx,%rdi
2bc5     2bc5:	e8 00 00 00 00       	call   2bca <s5m8767_pmic_probe+0x2bca>	2bc6: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2bca     2bca:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
2bd4     2bd4:	48 8b 1b             	mov    (%rbx),%rbx
2bd7     2bd7:	48 83 c3 10          	add    $0x10,%rbx
2bdb     2bdb:	48 89 d8             	mov    %rbx,%rax
2bde     2bde:	48 c1 e8 03          	shr    $0x3,%rax
2be2     2be2:	80 3c 30 00          	cmpb   $0x0,(%rax,%rsi,1)
2be6     2be6:	74 08                	je     2bf0 <s5m8767_pmic_probe+0x2bf0>
2be8     2be8:	48 89 df             	mov    %rbx,%rdi
2beb     2beb:	e8 00 00 00 00       	call   2bf0 <s5m8767_pmic_probe+0x2bf0>	2bec: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2bf0     2bf0:	48 8b 3b             	mov    (%rbx),%rdi
2bf3     2bf3:	be 0f 00 00 00       	mov    $0xf,%esi
2bf8     2bf8:	ba 02 00 00 00       	mov    $0x2,%edx
2bfd     2bfd:	b9 02 00 00 00       	mov    $0x2,%ecx
2c02     2c02:	45 31 c0             	xor    %r8d,%r8d
2c05     2c05:	45 31 c9             	xor    %r9d,%r9d
2c08     2c08:	6a 00                	push   $0x0
2c0a     2c0a:	e8 00 00 00 00       	call   2c0f <s5m8767_pmic_probe+0x2c0f>	2c0b: R_X86_64_PLT32	regmap_update_bits_base-0x4
2c0f     2c0f:	48 83 c4 08          	add    $0x8,%rsp
2c13     2c13:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
2c1d     2c1d:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
2c22     2c22:	41 0f b6 04 36       	movzbl (%r14,%rsi,1),%eax
2c27     2c27:	84 c0                	test   %al,%al
2c29     2c29:	0f 85 74 2f 00 00    	jne    5ba3 <s5m8767_pmic_probe+0x5ba3>
2c2f     2c2f:	48 8b 84 24 a8 00 00 00 	mov    0xa8(%rsp),%rax
2c37     2c37:	80 38 00             	cmpb   $0x0,(%rax)
2c3a     2c3a:	75 39                	jne    2c75 <s5m8767_pmic_probe+0x2c75>
2c3c     2c3c:	0f b6 44 35 00       	movzbl 0x0(%rbp,%rsi,1),%eax
2c41     2c41:	84 c0                	test   %al,%al
2c43     2c43:	0f 85 01 30 00 00    	jne    5c4a <s5m8767_pmic_probe+0x5c4a>
2c49     2c49:	48 8b 84 24 a0 00 00 00 	mov    0xa0(%rsp),%rax
2c51     2c51:	80 38 00             	cmpb   $0x0,(%rax)
2c54     2c54:	75 1f                	jne    2c75 <s5m8767_pmic_probe+0x2c75>
2c56     2c56:	41 0f b6 44 35 00    	movzbl 0x0(%r13,%rsi,1),%eax
2c5c     2c5c:	84 c0                	test   %al,%al
2c5e     2c5e:	0f 85 1f 30 00 00    	jne    5c83 <s5m8767_pmic_probe+0x5c83>
2c64     2c64:	48 8b 84 24 98 00 00 00 	mov    0x98(%rsp),%rax
2c6c     2c6c:	80 38 00             	cmpb   $0x0,(%rax)
2c6f     2c6f:	0f 84 c6 00 00 00    	je     2d3b <s5m8767_pmic_probe+0x2d3b>
2c75     2c75:	48 8b 84 24 30 01 00 00 	mov    0x130(%rsp),%rax
2c7d     2c7d:	0f b6 04 30          	movzbl (%rax,%rsi,1),%eax
2c81     2c81:	84 c0                	test   %al,%al
2c83     2c83:	0f 85 8f 2f 00 00    	jne    5c18 <s5m8767_pmic_probe+0x5c18>
2c89     2c89:	48 8b 84 24 b8 00 00 00 	mov    0xb8(%rsp),%rax
2c91     2c91:	8b 00                	mov    (%rax),%eax
2c93     2c93:	83 f8 18             	cmp    $0x18,%eax
2c96     2c96:	7e 16                	jle    2cae <s5m8767_pmic_probe+0x2cae>
2c98     2c98:	83 f8 19             	cmp    $0x19,%eax
2c9b     2c9b:	74 25                	je     2cc2 <s5m8767_pmic_probe+0x2cc2>
2c9d     2c9d:	83 f8 32             	cmp    $0x32,%eax
2ca0     2ca0:	74 27                	je     2cc9 <s5m8767_pmic_probe+0x2cc9>
2ca2     2ca2:	83 f8 64             	cmp    $0x64,%eax
2ca5     2ca5:	75 14                	jne    2cbb <s5m8767_pmic_probe+0x2cbb>
2ca7     2ca7:	bb f0 00 00 00       	mov    $0xf0,%ebx
2cac     2cac:	eb 20                	jmp    2cce <s5m8767_pmic_probe+0x2cce>
2cae     2cae:	bb 40 00 00 00       	mov    $0x40,%ebx
2cb3     2cb3:	83 f8 05             	cmp    $0x5,%eax
2cb6     2cb6:	74 16                	je     2cce <s5m8767_pmic_probe+0x2cce>
2cb8     2cb8:	83 f8 0a             	cmp    $0xa,%eax
2cbb     2cbb:	bb 90 00 00 00       	mov    $0x90,%ebx
2cc0     2cc0:	eb 0c                	jmp    2cce <s5m8767_pmic_probe+0x2cce>
2cc2     2cc2:	bb d0 00 00 00       	mov    $0xd0,%ebx
2cc7     2cc7:	eb 05                	jmp    2cce <s5m8767_pmic_probe+0x2cce>
2cc9     2cc9:	bb e0 00 00 00       	mov    $0xe0,%ebx
2cce     2cce:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
2cd3     2cd3:	80 3c 30 00          	cmpb   $0x0,(%rax,%rsi,1)
2cd7     2cd7:	4c 8b 74 24 38       	mov    0x38(%rsp),%r14
2cdc     2cdc:	74 12                	je     2cf0 <s5m8767_pmic_probe+0x2cf0>
2cde     2cde:	4c 89 f7             	mov    %r14,%rdi
2ce1     2ce1:	e8 00 00 00 00       	call   2ce6 <s5m8767_pmic_probe+0x2ce6>	2ce2: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2ce6     2ce6:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
2cf0     2cf0:	4d 8b 36             	mov    (%r14),%r14
2cf3     2cf3:	49 83 c6 10          	add    $0x10,%r14
2cf7     2cf7:	4c 89 f0             	mov    %r14,%rax
2cfa     2cfa:	48 c1 e8 03          	shr    $0x3,%rax
2cfe     2cfe:	80 3c 30 00          	cmpb   $0x0,(%rax,%rsi,1)
2d02     2d02:	74 08                	je     2d0c <s5m8767_pmic_probe+0x2d0c>
2d04     2d04:	4c 89 f7             	mov    %r14,%rdi
2d07     2d07:	e8 00 00 00 00       	call   2d0c <s5m8767_pmic_probe+0x2d0c>	2d08: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2d0c     2d0c:	49 8b 3e             	mov    (%r14),%rdi
2d0f     2d0f:	be 0f 00 00 00       	mov    $0xf,%esi
2d14     2d14:	ba f0 00 00 00       	mov    $0xf0,%edx
2d19     2d19:	89 d9                	mov    %ebx,%ecx
2d1b     2d1b:	45 31 c0             	xor    %r8d,%r8d
2d1e     2d1e:	45 31 c9             	xor    %r9d,%r9d
2d21     2d21:	6a 00                	push   $0x0
2d23     2d23:	e8 00 00 00 00       	call   2d28 <s5m8767_pmic_probe+0x2d28>	2d24: R_X86_64_PLT32	regmap_update_bits_base-0x4
2d28     2d28:	48 83 c4 08          	add    $0x8,%rsp
2d2c     2d2c:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
2d36     2d36:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
2d3b     2d3b:	48 8b 84 24 18 01 00 00 	mov    0x118(%rsp),%rax
2d43     2d43:	0f b6 04 30          	movzbl (%rax,%rsi,1),%eax
2d47     2d47:	84 c0                	test   %al,%al
2d49     2d49:	0f 85 8d 2e 00 00    	jne    5bdc <s5m8767_pmic_probe+0x5bdc>
2d4f     2d4f:	48 8b 84 24 e0 00 00 00 	mov    0xe0(%rsp),%rax
2d57     2d57:	83 38 00             	cmpl   $0x0,(%rax)
2d5a     2d5a:	0f 8e e9 0c 00 00    	jle    3a49 <s5m8767_pmic_probe+0x3a49>
2d60     2d60:	4c 8b 2c 24          	mov    (%rsp),%r13
2d64     2d64:	49 c1 ed 03          	shr    $0x3,%r13
2d68     2d68:	80 e1 07             	and    $0x7,%cl
2d6b     2d6b:	80 c1 03             	add    $0x3,%cl
2d6e     2d6e:	88 8c 24 88 00 00 00 	mov    %cl,0x88(%rsp)
2d75     2d75:	48 8b 8c 24 08 01 00 00 	mov    0x108(%rsp),%rcx
2d7d     2d7d:	80 e1 07             	and    $0x7,%cl
2d80     2d80:	80 c1 03             	add    $0x3,%cl
2d83     2d83:	88 8c 24 b0 00 00 00 	mov    %cl,0xb0(%rsp)
2d8a     2d8a:	24 07                	and    $0x7,%al
2d8c     2d8c:	04 03                	add    $0x3,%al
2d8e     2d8e:	88 84 24 f0 00 00 00 	mov    %al,0xf0(%rsp)
2d95     2d95:	45 31 f6             	xor    %r14d,%r14d
2d98     2d98:	4c 89 6c 24 78       	mov    %r13,0x78(%rsp)
2d9d     2d9d:	41 80 7c 35 00 00    	cmpb   $0x0,0x0(%r13,%rsi,1)
2da3     2da3:	48 8b 1c 24          	mov    (%rsp),%rbx
2da7     2da7:	74 12                	je     2dbb <s5m8767_pmic_probe+0x2dbb>
2da9     2da9:	48 89 df             	mov    %rbx,%rdi
2dac     2dac:	e8 00 00 00 00       	call   2db1 <s5m8767_pmic_probe+0x2db1>	2dad: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2db1     2db1:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
2dbb     2dbb:	4c 89 f5             	mov    %r14,%rbp
2dbe     2dbe:	48 c1 e5 05          	shl    $0x5,%rbp
2dc2     2dc2:	48 8b 1b             	mov    (%rbx),%rbx
2dc5     2dc5:	48 01 eb             	add    %rbp,%rbx
2dc8     2dc8:	48 89 d8             	mov    %rbx,%rax
2dcb     2dcb:	48 c1 e8 03          	shr    $0x3,%rax
2dcf     2dcf:	0f b6 04 30          	movzbl (%rax,%rsi,1),%eax
2dd3     2dd3:	84 c0                	test   %al,%al
2dd5     2dd5:	0f 85 91 06 00 00    	jne    346c <s5m8767_pmic_probe+0x346c>
2ddb     2ddb:	8b 03                	mov    (%rbx),%eax
2ddd     2ddd:	48 83 f8 25          	cmp    $0x25,%rax
2de1     2de1:	4c 8b 4c 24 20       	mov    0x20(%rsp),%r9
2de6     2de6:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
2deb     2deb:	4c 89 74 24 70       	mov    %r14,0x70(%rsp)
2df0     2df0:	0f 83 6f 06 00 00    	jae    3465 <s5m8767_pmic_probe+0x3465>
2df6     2df6:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
2dfb     2dfb:	48 8d 1c c5 00 00 00 00 	lea    0x0(,%rax,8),%rbx	2dff: R_X86_64_32S	.rodata.reg_voltage_map
2e03     2e03:	48 89 d8             	mov    %rbx,%rax
2e06     2e06:	48 c1 e8 03          	shr    $0x3,%rax
2e0a     2e0a:	80 3c 30 00          	cmpb   $0x0,(%rax,%rsi,1)
2e0e     2e0e:	74 1c                	je     2e2c <s5m8767_pmic_probe+0x2e2c>
2e10     2e10:	48 89 df             	mov    %rbx,%rdi
2e13     2e13:	e8 00 00 00 00       	call   2e18 <s5m8767_pmic_probe+0x2e18>	2e14: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2e18     2e18:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
2e1d     2e1d:	4c 8b 4c 24 20       	mov    0x20(%rsp),%r9
2e22     2e22:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
2e2c     2e2c:	48 8b 1b             	mov    (%rbx),%rbx
2e2f     2e2f:	48 89 d8             	mov    %rbx,%rax
2e32     2e32:	48 c1 e8 03          	shr    $0x3,%rax
2e36     2e36:	0f b6 04 30          	movzbl (%rax,%rsi,1),%eax
2e3a     2e3a:	84 c0                	test   %al,%al
2e3c     2e3c:	0f 85 51 06 00 00    	jne    3493 <s5m8767_pmic_probe+0x3493>
2e42     2e42:	48 89 6c 24 58       	mov    %rbp,0x58(%rsp)
2e47     2e47:	8b 03                	mov    (%rbx),%eax
2e49     2e49:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
2e4d     2e4d:	49 89 fd             	mov    %rdi,%r13
2e50     2e50:	49 c1 ed 03          	shr    $0x3,%r13
2e54     2e54:	41 0f b6 4c 35 00    	movzbl 0x0(%r13,%rsi,1),%ecx
2e5a     2e5a:	84 c9                	test   %cl,%cl
2e5c     2e5c:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
2e61     2e61:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
2e66     2e66:	0f 85 58 06 00 00    	jne    34c4 <s5m8767_pmic_probe+0x34c4>
2e6c     2e6c:	2b 43 04             	sub    0x4(%rbx),%eax
2e6f     2e6f:	48 83 c3 08          	add    $0x8,%rbx
2e73     2e73:	48 89 dd             	mov    %rbx,%rbp
2e76     2e76:	48 c1 ed 03          	shr    $0x3,%rbp
2e7a     2e7a:	0f b6 4c 35 00       	movzbl 0x0(%rbp,%rsi,1),%ecx
2e7f     2e7f:	84 c9                	test   %cl,%cl
2e81     2e81:	0f 85 83 06 00 00    	jne    350a <s5m8767_pmic_probe+0x350a>
2e87     2e87:	44 8b 33             	mov    (%rbx),%r14d
2e8a     2e8a:	3d 00 00 00 80       	cmp    $0x80000000,%eax
2e8f     2e8f:	75 0a                	jne    2e9b <s5m8767_pmic_probe+0x2e9b>
2e91     2e91:	41 83 fe ff          	cmp    $0xffffffff,%r14d
2e95     2e95:	0f 84 f5 09 00 00    	je     3890 <s5m8767_pmic_probe+0x3890>
2e9b     2e9b:	99                   	cltd
2e9c     2e9c:	41 f7 fe             	idiv   %r14d
2e9f     2e9f:	48 69 4c 24 38 30 01 00 00 	imul   $0x130,0x38(%rsp),%rcx
2ea8     2ea8:	48 89 4c 24 40       	mov    %rcx,0x40(%rsp)
2ead     2ead:	4c 8d b1 00 00 00 00 	lea    0x0(%rcx),%r14	2eb0: R_X86_64_32S	.data.regulators.101070+0x38
2eb4     2eb4:	4c 89 f1             	mov    %r14,%rcx
2eb7     2eb7:	48 c1 e9 03          	shr    $0x3,%rcx
2ebb     2ebb:	0f b6 0c 31          	movzbl (%rcx,%rsi,1),%ecx
2ebf     2ebf:	84 c9                	test   %cl,%cl
2ec1     2ec1:	0f 85 94 06 00 00    	jne    355b <s5m8767_pmic_probe+0x355b>
2ec7     2ec7:	ff c0                	inc    %eax
2ec9     2ec9:	41 89 06             	mov    %eax,(%r14)
2ecc     2ecc:	41 0f b6 44 35 00    	movzbl 0x0(%r13,%rsi,1),%eax
2ed2     2ed2:	84 c0                	test   %al,%al
2ed4     2ed4:	0f 85 d3 06 00 00    	jne    35ad <s5m8767_pmic_probe+0x35ad>
2eda     2eda:	44 8b 2f             	mov    (%rdi),%r13d
2edd     2edd:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
2ee2     2ee2:	4c 8d b0 00 00 00 00 	lea    0x0(%rax),%r14	2ee5: R_X86_64_32S	.data.regulators.101070+0x58
2ee9     2ee9:	4c 89 f0             	mov    %r14,%rax
2eec     2eec:	48 c1 e8 03          	shr    $0x3,%rax
2ef0     2ef0:	0f b6 04 30          	movzbl (%rax,%rsi,1),%eax
2ef4     2ef4:	84 c0                	test   %al,%al
2ef6     2ef6:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
2efb     2efb:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
2f00     2f00:	0f 85 e5 06 00 00    	jne    35eb <s5m8767_pmic_probe+0x35eb>
2f06     2f06:	45 89 2e             	mov    %r13d,(%r14)
2f09     2f09:	0f b6 44 35 00       	movzbl 0x0(%rbp,%rsi,1),%eax
2f0e     2f0e:	84 c0                	test   %al,%al
2f10     2f10:	0f 85 12 07 00 00    	jne    3628 <s5m8767_pmic_probe+0x3628>
2f16     2f16:	8b 2b                	mov    (%rbx),%ebp
2f18     2f18:	4c 8b 74 24 40       	mov    0x40(%rsp),%r14
2f1d     2f1d:	49 8d 9e 00 00 00 00 	lea    0x0(%r14),%rbx	2f20: R_X86_64_32S	.data.regulators.101070+0x5c
2f24     2f24:	48 89 d8             	mov    %rbx,%rax
2f27     2f27:	48 c1 e8 03          	shr    $0x3,%rax
2f2b     2f2b:	0f b6 04 30          	movzbl (%rax,%rsi,1),%eax
2f2f     2f2f:	84 c0                	test   %al,%al
2f31     2f31:	0f 85 40 07 00 00    	jne    3677 <s5m8767_pmic_probe+0x3677>
2f37     2f37:	89 2b                	mov    %ebp,(%rbx)
2f39     2f39:	8d 41 fe             	lea    -0x2(%rcx),%eax
2f3c     2f3c:	83 f8 1a             	cmp    $0x1a,%eax
2f3f     2f3f:	73 2f                	jae    2f70 <s5m8767_pmic_probe+0x2f70>
2f41     2f41:	bd 5f 00 00 00       	mov    $0x5f,%ebp
2f46     2f46:	49 8d 9e 00 00 00 00 	lea    0x0(%r14),%rbx	2f49: R_X86_64_32S	.data.regulators.101070+0xa0
2f4d     2f4d:	48 89 d8             	mov    %rbx,%rax
2f50     2f50:	48 c1 e8 03          	shr    $0x3,%rax
2f54     2f54:	0f b6 04 30          	movzbl (%rax,%rsi,1),%eax
2f58     2f58:	84 c0                	test   %al,%al
2f5a     2f5a:	48 8b 54 24 48       	mov    0x48(%rsp),%rdx
2f5f     2f5f:	0f 85 d9 08 00 00    	jne    383e <s5m8767_pmic_probe+0x383e>
2f65     2f65:	01 cd                	add    %ecx,%ebp
2f67     2f67:	89 2b                	mov    %ebp,(%rbx)
2f69     2f69:	bd 3f 00 00 00       	mov    $0x3f,%ebp
2f6e     2f6e:	eb 33                	jmp    2fa3 <s5m8767_pmic_probe+0x2fa3>
2f70     2f70:	89 c8                	mov    %ecx,%eax
2f72     2f72:	ff 24 c5 00 00 00 00 	jmp    *0x0(,%rax,8)	2f75: R_X86_64_32S	.rodata.s5m8767_pmic_probe
2f79     2f79:	8d 6c 09 13          	lea    0x13(%rcx,%rcx,1),%ebp
2f7d     2f7d:	48 8b 54 24 48       	mov    0x48(%rsp),%rdx
2f82     2f82:	49 8d 9e 00 00 00 00 	lea    0x0(%r14),%rbx	2f85: R_X86_64_32S	.data.regulators.101070+0xa0
2f89     2f89:	48 89 d8             	mov    %rbx,%rax
2f8c     2f8c:	48 c1 e8 03          	shr    $0x3,%rax
2f90     2f90:	0f b6 04 30          	movzbl (%rax,%rsi,1),%eax
2f94     2f94:	84 c0                	test   %al,%al
2f96     2f96:	0f 85 cb 08 00 00    	jne    3867 <s5m8767_pmic_probe+0x3867>
2f9c     2f9c:	89 2b                	mov    %ebp,(%rbx)
2f9e     2f9e:	bd ff 00 00 00       	mov    $0xff,%ebp
2fa3     2fa3:	49 8d 9e 00 00 00 00 	lea    0x0(%r14),%rbx	2fa6: R_X86_64_32S	.data.regulators.101070+0xa4
2faa     2faa:	48 89 d8             	mov    %rbx,%rax
2fad     2fad:	48 c1 e8 03          	shr    $0x3,%rax
2fb1     2fb1:	0f b6 04 30          	movzbl (%rax,%rsi,1),%eax
2fb5     2fb5:	84 c0                	test   %al,%al
2fb7     2fb7:	0f 85 f7 06 00 00    	jne    36b4 <s5m8767_pmic_probe+0x36b4>
2fbd     2fbd:	89 2b                	mov    %ebp,(%rbx)
2fbf     2fbf:	48 8d 1c 8d 00 00 00 00 	lea    0x0(,%rcx,4),%rbx	2fc3: R_X86_64_32S	.rodata.switch.table.s5m8767_pmic_probe
2fc7     2fc7:	48 89 d8             	mov    %rbx,%rax
2fca     2fca:	48 c1 e8 03          	shr    $0x3,%rax
2fce     2fce:	0f b6 04 30          	movzbl (%rax,%rsi,1),%eax
2fd2     2fd2:	84 c0                	test   %al,%al
2fd4     2fd4:	0f 85 03 07 00 00    	jne    36dd <s5m8767_pmic_probe+0x36dd>
2fda     2fda:	8b 3b                	mov    (%rbx),%edi
2fdc     2fdc:	48 8b 84 24 58 01 00 00 	mov    0x158(%rsp),%rax
2fe4     2fe4:	0f b6 04 30          	movzbl (%rax,%rsi,1),%eax
2fe8     2fe8:	84 c0                	test   %al,%al
2fea     2fea:	0f 85 23 07 00 00    	jne    3713 <s5m8767_pmic_probe+0x3713>
2ff0     2ff0:	48 8b 84 24 08 01 00 00 	mov    0x108(%rsp),%rax
2ff8     2ff8:	44 8b 28             	mov    (%rax),%r13d
2ffb     2ffb:	45 85 ed             	test   %r13d,%r13d
2ffe     2ffe:	0f 8e 1f 0a 00 00    	jle    3a23 <s5m8767_pmic_probe+0x3a23>
3004     3004:	48 8b 84 24 50 01 00 00 	mov    0x150(%rsp),%rax
300c     300c:	80 3c 30 00          	cmpb   $0x0,(%rax,%rsi,1)
3010     3010:	74 22                	je     3034 <s5m8767_pmic_probe+0x3034>
3012     3012:	89 fb                	mov    %edi,%ebx
3014     3014:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
3019     3019:	e8 00 00 00 00       	call   301e <s5m8767_pmic_probe+0x301e>	301a: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
301e     301e:	89 df                	mov    %ebx,%edi
3020     3020:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
3025     3025:	48 8b 54 24 48       	mov    0x48(%rsp),%rdx
302a     302a:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
3034     3034:	48 8b 12             	mov    (%rdx),%rdx
3037     3037:	48 89 d5             	mov    %rdx,%rbp
303a     303a:	48 89 d3             	mov    %rdx,%rbx
303d     303d:	45 31 f6             	xor    %r14d,%r14d
3040     3040:	48 89 e8             	mov    %rbp,%rax
3043     3043:	48 c1 e8 03          	shr    $0x3,%rax
3047     3047:	0f b6 04 30          	movzbl (%rax,%rsi,1),%eax
304b     304b:	84 c0                	test   %al,%al
304d     304d:	75 19                	jne    3068 <s5m8767_pmic_probe+0x3068>
304f     304f:	39 0b                	cmp    %ecx,(%rbx)
3051     3051:	74 5d                	je     30b0 <s5m8767_pmic_probe+0x30b0>
3053     3053:	49 ff c6             	inc    %r14
3056     3056:	48 83 c3 08          	add    $0x8,%rbx
305a     305a:	48 83 c5 08          	add    $0x8,%rbp
305e     305e:	4d 39 f5             	cmp    %r14,%r13
3061     3061:	75 dd                	jne    3040 <s5m8767_pmic_probe+0x3040>
3063     3063:	e9 bb 09 00 00       	jmp    3a23 <s5m8767_pmic_probe+0x3a23>
3068     3068:	89 e9                	mov    %ebp,%ecx
306a     306a:	80 e1 07             	and    $0x7,%cl
306d     306d:	80 c1 03             	add    $0x3,%cl
3070     3070:	38 c1                	cmp    %al,%cl
3072     3072:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
3077     3077:	7c d6                	jl     304f <s5m8767_pmic_probe+0x304f>
3079     3079:	89 bc 24 80 00 00 00 	mov    %edi,0x80(%rsp)
3080     3080:	48 89 df             	mov    %rbx,%rdi
3083     3083:	48 89 94 24 d0 00 00 00 	mov    %rdx,0xd0(%rsp)
308b     308b:	e8 00 00 00 00       	call   3090 <s5m8767_pmic_probe+0x3090>	308c: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
3090     3090:	48 8b 94 24 d0 00 00 00 	mov    0xd0(%rsp),%rdx
3098     3098:	8b bc 24 80 00 00 00 	mov    0x80(%rsp),%edi
309f     309f:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
30a4     30a4:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
30ae     30ae:	eb 9f                	jmp    304f <s5m8767_pmic_probe+0x304f>
30b0     30b0:	4a 8d 5c f2 04       	lea    0x4(%rdx,%r14,8),%rbx
30b5     30b5:	48 89 d8             	mov    %rbx,%rax
30b8     30b8:	48 c1 e8 03          	shr    $0x3,%rax
30bc     30bc:	0f b6 04 30          	movzbl (%rax,%rsi,1),%eax
30c0     30c0:	84 c0                	test   %al,%al
30c2     30c2:	0f 85 82 06 00 00    	jne    374a <s5m8767_pmic_probe+0x374a>
30c8     30c8:	8b 1b                	mov    (%rbx),%ebx
30ca     30ca:	48 83 fb 04          	cmp    $0x4,%rbx
30ce     30ce:	4c 8b 6c 24 78       	mov    0x78(%rsp),%r13
30d3     30d3:	4c 8b 74 24 40       	mov    0x40(%rsp),%r14
30d8     30d8:	0f 83 0a 08 00 00    	jae    38e8 <s5m8767_pmic_probe+0x38e8>
30de     30de:	48 89 c8             	mov    %rcx,%rax
30e1     30e1:	48 c1 e0 04          	shl    $0x4,%rax
30e5     30e5:	48 8d 9c 98 00 00 00 00 	lea    0x0(%rax,%rbx,4),%rbx	30e9: R_X86_64_32S	.rodata.s5m8767_opmode_reg
30ed     30ed:	48 89 d8             	mov    %rbx,%rax
30f0     30f0:	48 c1 e8 03          	shr    $0x3,%rax
30f4     30f4:	0f b6 04 30          	movzbl (%rax,%rsi,1),%eax
30f8     30f8:	84 c0                	test   %al,%al
30fa     30fa:	0f 85 7f 06 00 00    	jne    377f <s5m8767_pmic_probe+0x377f>
3100     3100:	8b 2b                	mov    (%rbx),%ebp
3102     3102:	49 8d 9e 00 00 00 00 	lea    0x0(%r14),%rbx	3105: R_X86_64_32S	.data.regulators.101070+0xbc
3109     3109:	48 89 d8             	mov    %rbx,%rax
310c     310c:	48 c1 e8 03          	shr    $0x3,%rax
3110     3110:	0f b6 04 30          	movzbl (%rax,%rsi,1),%eax
3114     3114:	84 c0                	test   %al,%al
3116     3116:	0f 85 8e 06 00 00    	jne    37aa <s5m8767_pmic_probe+0x37aa>
311c     311c:	89 3b                	mov    %edi,(%rbx)
311e     311e:	49 8d 9e 00 00 00 00 	lea    0x0(%r14),%rbx	3121: R_X86_64_32S	.data.regulators.101070+0xc0
3125     3125:	48 89 d8             	mov    %rbx,%rax
3128     3128:	48 c1 e8 03          	shr    $0x3,%rax
312c     312c:	0f b6 04 30          	movzbl (%rax,%rsi,1),%eax
3130     3130:	84 c0                	test   %al,%al
3132     3132:	0f 85 9f 06 00 00    	jne    37d7 <s5m8767_pmic_probe+0x37d7>
3138     3138:	c7 03 c0 00 00 00    	movl   $0xc0,(%rbx)
313e     313e:	49 8d 9e 00 00 00 00 	lea    0x0(%r14),%rbx	3141: R_X86_64_32S	.data.regulators.101070+0xc4
3145     3145:	48 89 d8             	mov    %rbx,%rax
3148     3148:	48 c1 e8 03          	shr    $0x3,%rax
314c     314c:	0f b6 04 30          	movzbl (%rax,%rsi,1),%eax
3150     3150:	84 c0                	test   %al,%al
3152     3152:	0f 85 9e 06 00 00    	jne    37f6 <s5m8767_pmic_probe+0x37f6>
3158     3158:	c1 e5 06             	shl    $0x6,%ebp
315b     315b:	89 2b                	mov    %ebp,(%rbx)
315d     315d:	48 8b 84 24 e8 00 00 00 	mov    0xe8(%rsp),%rax
3165     3165:	80 3c 30 00          	cmpb   $0x0,(%rax,%rsi,1)
3169     3169:	74 12                	je     317d <s5m8767_pmic_probe+0x317d>
316b     316b:	4c 89 e7             	mov    %r12,%rdi
316e     316e:	e8 00 00 00 00       	call   3173 <s5m8767_pmic_probe+0x3173>	316f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
3173     3173:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
317d     317d:	49 8b 04 24          	mov    (%r12),%rax
3181     3181:	48 89 84 24 60 01 00 00 	mov    %rax,0x160(%rsp)
3189     3189:	41 80 7c 35 00 00    	cmpb   $0x0,0x0(%r13,%rsi,1)
318f     318f:	48 8b 1c 24          	mov    (%rsp),%rbx
3193     3193:	48 8b 6c 24 58       	mov    0x58(%rsp),%rbp
3198     3198:	74 12                	je     31ac <s5m8767_pmic_probe+0x31ac>
319a     319a:	48 89 df             	mov    %rbx,%rdi
319d     319d:	e8 00 00 00 00       	call   31a2 <s5m8767_pmic_probe+0x31a2>	319e: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
31a2     31a2:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
31ac     31ac:	48 8b 1b             	mov    (%rbx),%rbx
31af     31af:	4c 8d 74 2b 08       	lea    0x8(%rbx,%rbp,1),%r14
31b4     31b4:	4c 89 f0             	mov    %r14,%rax
31b7     31b7:	48 c1 e8 03          	shr    $0x3,%rax
31bb     31bb:	80 3c 30 00          	cmpb   $0x0,(%rax,%rsi,1)
31bf     31bf:	74 12                	je     31d3 <s5m8767_pmic_probe+0x31d3>
31c1     31c1:	4c 89 f7             	mov    %r14,%rdi
31c4     31c4:	e8 00 00 00 00       	call   31c9 <s5m8767_pmic_probe+0x31c9>	31c5: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
31c9     31c9:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
31d3     31d3:	49 8b 06             	mov    (%r14),%rax
31d6     31d6:	48 89 84 24 68 01 00 00 	mov    %rax,0x168(%rsp)
31de     31de:	4c 89 a4 24 70 01 00 00 	mov    %r12,0x170(%rsp)
31e6     31e6:	48 8b 84 24 48 01 00 00 	mov    0x148(%rsp),%rax
31ee     31ee:	80 3c 30 00          	cmpb   $0x0,(%rax,%rsi,1)
31f2     31f2:	4c 8b 74 24 60       	mov    0x60(%rsp),%r14
31f7     31f7:	74 12                	je     320b <s5m8767_pmic_probe+0x320b>
31f9     31f9:	4c 89 f7             	mov    %r14,%rdi
31fc     31fc:	e8 00 00 00 00       	call   3201 <s5m8767_pmic_probe+0x3201>	31fd: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
3201     3201:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
320b     320b:	49 8b 06             	mov    (%r14),%rax
320e     320e:	48 89 84 24 80 01 00 00 	mov    %rax,0x180(%rsp)
3216     3216:	4c 8d 74 2b 10       	lea    0x10(%rbx,%rbp,1),%r14
321b     321b:	4c 89 f0             	mov    %r14,%rax
321e     321e:	48 c1 e8 03          	shr    $0x3,%rax
3222     3222:	80 3c 30 00          	cmpb   $0x0,(%rax,%rsi,1)
3226     3226:	74 12                	je     323a <s5m8767_pmic_probe+0x323a>
3228     3228:	4c 89 f7             	mov    %r14,%rdi
322b     322b:	e8 00 00 00 00       	call   3230 <s5m8767_pmic_probe+0x3230>	322c: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
3230     3230:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
323a     323a:	49 8b 06             	mov    (%r14),%rax
323d     323d:	48 89 84 24 78 01 00 00 	mov    %rax,0x178(%rsp)
3245     3245:	48 c7 84 24 88 01 00 00 00 00 00 00 	movq   $0x0,0x188(%rsp)
3251     3251:	4c 8d 74 2b 18       	lea    0x18(%rbx,%rbp,1),%r14
3256     3256:	4c 89 f0             	mov    %r14,%rax
3259     3259:	48 c1 e8 03          	shr    $0x3,%rax
325d     325d:	80 3c 30 00          	cmpb   $0x0,(%rax,%rsi,1)
3261     3261:	74 08                	je     326b <s5m8767_pmic_probe+0x326b>
3263     3263:	4c 89 f7             	mov    %r14,%rdi
3266     3266:	e8 00 00 00 00       	call   326b <s5m8767_pmic_probe+0x326b>	3267: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
326b     326b:	49 83 3e 00          	cmpq   $0x0,(%r14)
326f     326f:	4c 8b 74 24 40       	mov    0x40(%rsp),%r14
3274     3274:	74 47                	je     32bd <s5m8767_pmic_probe+0x32bd>
3276     3276:	48 01 eb             	add    %rbp,%rbx
3279     3279:	4c 89 e7             	mov    %r12,%rdi
327c     327c:	48 89 de             	mov    %rbx,%rsi
327f     327f:	48 8d 94 24 60 01 00 00 	lea    0x160(%rsp),%rdx
3287     3287:	e8 00 00 00 00       	call   328c <s5m8767_pmic_probe+0x328c>	3288: R_X86_64_PLT32	.text.s5m8767_regulator_config_ext_control-0x4
328c     328c:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
3296     3296:	48 8b 8c 24 e8 00 00 00 	mov    0xe8(%rsp),%rcx
329e     329e:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
32a2     32a2:	74 08                	je     32ac <s5m8767_pmic_probe+0x32ac>
32a4     32a4:	4c 89 e7             	mov    %r12,%rdi
32a7     32a7:	e8 00 00 00 00       	call   32ac <s5m8767_pmic_probe+0x32ac>	32a8: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
32ac     32ac:	49 8b 3c 24          	mov    (%r12),%rdi
32b0     32b0:	48 8b b4 24 88 01 00 00 	mov    0x188(%rsp),%rsi
32b8     32b8:	e8 00 00 00 00       	call   32bd <s5m8767_pmic_probe+0x32bd>	32b9: R_X86_64_PLT32	devm_gpiod_unhinge-0x4
32bd     32bd:	49 8d b6 00 00 00 00 	lea    0x0(%r14),%rsi	32c0: R_X86_64_32S	.data.regulators.101070
32c4     32c4:	48 8b 7c 24 68       	mov    0x68(%rsp),%rdi
32c9     32c9:	48 8d 94 24 60 01 00 00 	lea    0x160(%rsp),%rdx
32d1     32d1:	e8 00 00 00 00       	call   32d6 <s5m8767_pmic_probe+0x32d6>	32d2: R_X86_64_PLT32	devm_regulator_register-0x4
32d6     32d6:	48 89 c3             	mov    %rax,%rbx
32d9     32d9:	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax
32df     32df:	0f 83 6b 07 00 00    	jae    3a50 <s5m8767_pmic_probe+0x3a50>
32e5     32e5:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
32ef     32ef:	41 80 7c 35 00 00    	cmpb   $0x0,0x0(%r13,%rsi,1)
32f5     32f5:	4c 8b 34 24          	mov    (%rsp),%r14
32f9     32f9:	74 12                	je     330d <s5m8767_pmic_probe+0x330d>
32fb     32fb:	4c 89 f7             	mov    %r14,%rdi
32fe     32fe:	e8 00 00 00 00       	call   3303 <s5m8767_pmic_probe+0x3303>	32ff: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
3303     3303:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
330d     330d:	49 8b 06             	mov    (%r14),%rax
3310     3310:	4c 8d 74 28 18       	lea    0x18(%rax,%rbp,1),%r14
3315     3315:	4c 89 f0             	mov    %r14,%rax
3318     3318:	48 c1 e8 03          	shr    $0x3,%rax
331c     331c:	80 3c 30 00          	cmpb   $0x0,(%rax,%rsi,1)
3320     3320:	74 12                	je     3334 <s5m8767_pmic_probe+0x3334>
3322     3322:	4c 89 f7             	mov    %r14,%rdi
3325     3325:	e8 00 00 00 00       	call   332a <s5m8767_pmic_probe+0x332a>	3326: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
332a     332a:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
3334     3334:	49 83 3e 00          	cmpq   $0x0,(%r14)
3338     3338:	74 1d                	je     3357 <s5m8767_pmic_probe+0x3357>
333a     333a:	4c 89 e7             	mov    %r12,%rdi
333d     333d:	48 89 de             	mov    %rbx,%rsi
3340     3340:	e8 00 00 00 00       	call   3345 <s5m8767_pmic_probe+0x3345>	3341: R_X86_64_PLT32	.text.s5m8767_enable_ext_control-0x4
3345     3345:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
334f     334f:	85 c0                	test   %eax,%eax
3351     3351:	0f 88 35 07 00 00    	js     3a8c <s5m8767_pmic_probe+0x3a8c>
3357     3357:	48 8b 84 24 18 01 00 00 	mov    0x118(%rsp),%rax
335f     335f:	0f b6 04 30          	movzbl (%rax,%rsi,1),%eax
3363     3363:	84 c0                	test   %al,%al
3365     3365:	4c 8b 74 24 70       	mov    0x70(%rsp),%r14
336a     336a:	0f 85 a5 04 00 00    	jne    3815 <s5m8767_pmic_probe+0x3815>
3370     3370:	49 ff c6             	inc    %r14
3373     3373:	48 8b 84 24 e0 00 00 00 	mov    0xe0(%rsp),%rax
337b     337b:	48 63 08             	movslq (%rax),%rcx
337e     337e:	31 c0                	xor    %eax,%eax
3380     3380:	49 39 ce             	cmp    %rcx,%r14
3383     3383:	0f 8c 14 fa ff ff    	jl     2d9d <s5m8767_pmic_probe+0x2d9d>
3389     3389:	e9 4a 22 00 00       	jmp    55d8 <s5m8767_pmic_probe+0x55d8>
338e     338e:	bd 5c 00 00 00       	mov    $0x5c,%ebp
3393     3393:	e9 ae fb ff ff       	jmp    2f46 <s5m8767_pmic_probe+0x2f46>
3398     3398:	41 0f b6 04 37       	movzbl (%r15,%rsi,1),%eax
339d     339d:	84 c0                	test   %al,%al
339f     339f:	0f 85 6a 05 00 00    	jne    390f <s5m8767_pmic_probe+0x390f>
33a5     33a5:	41 80 3b 00          	cmpb   $0x0,(%r11)
33a9     33a9:	0f 84 98 00 00 00    	je     3447 <s5m8767_pmic_probe+0x3447>
33af     33af:	48 8b 84 24 c8 00 00 00 	mov    0xc8(%rsp),%rax
33b7     33b7:	0f b6 04 30          	movzbl (%rax,%rsi,1),%eax
33bb     33bb:	84 c0                	test   %al,%al
33bd     33bd:	0f 85 df 05 00 00    	jne    39a2 <s5m8767_pmic_probe+0x39a2>
33c3     33c3:	8b 2f                	mov    (%rdi),%ebp
33c5     33c5:	83 c5 47             	add    $0x47,%ebp
33c8     33c8:	e9 b0 fb ff ff       	jmp    2f7d <s5m8767_pmic_probe+0x2f7d>
33cd     33cd:	bd 50 00 00 00       	mov    $0x50,%ebp
33d2     33d2:	e9 a6 fb ff ff       	jmp    2f7d <s5m8767_pmic_probe+0x2f7d>
33d7     33d7:	41 0f b6 04 32       	movzbl (%r10,%rsi,1),%eax
33dc     33dc:	84 c0                	test   %al,%al
33de     33de:	0f 85 5b 05 00 00    	jne    393f <s5m8767_pmic_probe+0x393f>
33e4     33e4:	41 80 39 00          	cmpb   $0x0,(%r9)
33e8     33e8:	74 67                	je     3451 <s5m8767_pmic_probe+0x3451>
33ea     33ea:	48 8b 84 24 c8 00 00 00 	mov    0xc8(%rsp),%rax
33f2     33f2:	0f b6 04 30          	movzbl (%rax,%rsi,1),%eax
33f6     33f6:	84 c0                	test   %al,%al
33f8     33f8:	0f 85 cf 05 00 00    	jne    39cd <s5m8767_pmic_probe+0x39cd>
33fe     33fe:	8b 2f                	mov    (%rdi),%ebp
3400     3400:	83 c5 3e             	add    $0x3e,%ebp
3403     3403:	e9 75 fb ff ff       	jmp    2f7d <s5m8767_pmic_probe+0x2f7d>
3408     3408:	41 0f b6 04 30       	movzbl (%r8,%rsi,1),%eax
340d     340d:	84 c0                	test   %al,%al
340f     340f:	0f 85 5d 05 00 00    	jne    3972 <s5m8767_pmic_probe+0x3972>
3415     3415:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
341a     341a:	80 38 00             	cmpb   $0x0,(%rax)
341d     341d:	74 3c                	je     345b <s5m8767_pmic_probe+0x345b>
341f     341f:	48 8b 84 24 c8 00 00 00 	mov    0xc8(%rsp),%rax
3427     3427:	0f b6 04 30          	movzbl (%rax,%rsi,1),%eax
342b     342b:	84 c0                	test   %al,%al
342d     342d:	0f 85 c5 05 00 00    	jne    39f8 <s5m8767_pmic_probe+0x39f8>
3433     3433:	8b 2f                	mov    (%rdi),%ebp
3435     3435:	83 c5 35             	add    $0x35,%ebp
3438     3438:	e9 40 fb ff ff       	jmp    2f7d <s5m8767_pmic_probe+0x2f7d>
343d     343d:	bd 33 00 00 00       	mov    $0x33,%ebp
3442     3442:	e9 36 fb ff ff       	jmp    2f7d <s5m8767_pmic_probe+0x2f7d>
3447     3447:	bd 47 00 00 00       	mov    $0x47,%ebp
344c     344c:	e9 2c fb ff ff       	jmp    2f7d <s5m8767_pmic_probe+0x2f7d>
3451     3451:	bd 3e 00 00 00       	mov    $0x3e,%ebp
3456     3456:	e9 22 fb ff ff       	jmp    2f7d <s5m8767_pmic_probe+0x2f7d>
345b     345b:	bd 35 00 00 00       	mov    $0x35,%ebp
3460     3460:	e9 18 fb ff ff       	jmp    2f7d <s5m8767_pmic_probe+0x2f7d>
3465     3465:	0f 0b                	ud2
3467     3467:	e9 eb fe ff ff       	jmp    3357 <s5m8767_pmic_probe+0x3357>
346c     346c:	89 d9                	mov    %ebx,%ecx
346e     346e:	80 e1 07             	and    $0x7,%cl
3471     3471:	80 c1 03             	add    $0x3,%cl
3474     3474:	38 c1                	cmp    %al,%cl
3476     3476:	0f 8c 5f f9 ff ff    	jl     2ddb <s5m8767_pmic_probe+0x2ddb>
347c     347c:	48 89 df             	mov    %rbx,%rdi
347f     347f:	e8 00 00 00 00       	call   3484 <s5m8767_pmic_probe+0x3484>	3480: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
3484     3484:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
348e     348e:	e9 48 f9 ff ff       	jmp    2ddb <s5m8767_pmic_probe+0x2ddb>
3493     3493:	89 d9                	mov    %ebx,%ecx
3495     3495:	80 e1 07             	and    $0x7,%cl
3498     3498:	80 c1 03             	add    $0x3,%cl
349b     349b:	38 c1                	cmp    %al,%cl
349d     349d:	0f 8c 9f f9 ff ff    	jl     2e42 <s5m8767_pmic_probe+0x2e42>
34a3     34a3:	48 89 df             	mov    %rbx,%rdi
34a6     34a6:	e8 00 00 00 00       	call   34ab <s5m8767_pmic_probe+0x34ab>	34a7: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
34ab     34ab:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
34b0     34b0:	4c 8b 4c 24 20       	mov    0x20(%rsp),%r9
34b5     34b5:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
34bf     34bf:	e9 7e f9 ff ff       	jmp    2e42 <s5m8767_pmic_probe+0x2e42>
34c4     34c4:	89 fa                	mov    %edi,%edx
34c6     34c6:	80 e2 07             	and    $0x7,%dl
34c9     34c9:	80 c2 03             	add    $0x3,%dl
34cc     34cc:	38 ca                	cmp    %cl,%dl
34ce     34ce:	0f 8c 98 f9 ff ff    	jl     2e6c <s5m8767_pmic_probe+0x2e6c>
34d4     34d4:	48 89 fd             	mov    %rdi,%rbp
34d7     34d7:	89 44 24 40          	mov    %eax,0x40(%rsp)
34db     34db:	e8 00 00 00 00       	call   34e0 <s5m8767_pmic_probe+0x34e0>	34dc: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
34e0     34e0:	48 89 ef             	mov    %rbp,%rdi
34e3     34e3:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
34e8     34e8:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
34ed     34ed:	4c 8b 4c 24 20       	mov    0x20(%rsp),%r9
34f2     34f2:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
34f7     34f7:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
3501     3501:	8b 44 24 40          	mov    0x40(%rsp),%eax
3505     3505:	e9 62 f9 ff ff       	jmp    2e6c <s5m8767_pmic_probe+0x2e6c>
350a     350a:	89 da                	mov    %ebx,%edx
350c     350c:	80 e2 07             	and    $0x7,%dl
350f     350f:	80 c2 03             	add    $0x3,%dl
3512     3512:	38 ca                	cmp    %cl,%dl
3514     3514:	0f 8c 6d f9 ff ff    	jl     2e87 <s5m8767_pmic_probe+0x2e87>
351a     351a:	48 89 bc 24 80 00 00 00 	mov    %rdi,0x80(%rsp)
3522     3522:	48 89 df             	mov    %rbx,%rdi
3525     3525:	41 89 c6             	mov    %eax,%r14d
3528     3528:	e8 00 00 00 00       	call   352d <s5m8767_pmic_probe+0x352d>	3529: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
352d     352d:	48 8b bc 24 80 00 00 00 	mov    0x80(%rsp),%rdi
3535     3535:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
353a     353a:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
353f     353f:	4c 8b 4c 24 20       	mov    0x20(%rsp),%r9
3544     3544:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
3549     3549:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
3553     3553:	44 89 f0             	mov    %r14d,%eax
3556     3556:	e9 2c f9 ff ff       	jmp    2e87 <s5m8767_pmic_probe+0x2e87>
355b     355b:	80 f9 03             	cmp    $0x3,%cl
355e     355e:	0f 8f 63 f9 ff ff    	jg     2ec7 <s5m8767_pmic_probe+0x2ec7>
3564     3564:	48 89 bc 24 80 00 00 00 	mov    %rdi,0x80(%rsp)
356c     356c:	4c 89 f7             	mov    %r14,%rdi
356f     356f:	89 84 24 d0 00 00 00 	mov    %eax,0xd0(%rsp)
3576     3576:	e8 00 00 00 00       	call   357b <s5m8767_pmic_probe+0x357b>	3577: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
357b     357b:	48 8b bc 24 80 00 00 00 	mov    0x80(%rsp),%rdi
3583     3583:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
3588     3588:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
358d     358d:	4c 8b 4c 24 20       	mov    0x20(%rsp),%r9
3592     3592:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
3597     3597:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
35a1     35a1:	8b 84 24 d0 00 00 00 	mov    0xd0(%rsp),%eax
35a8     35a8:	e9 1a f9 ff ff       	jmp    2ec7 <s5m8767_pmic_probe+0x2ec7>
35ad     35ad:	89 f9                	mov    %edi,%ecx
35af     35af:	80 e1 07             	and    $0x7,%cl
35b2     35b2:	80 c1 03             	add    $0x3,%cl
35b5     35b5:	38 c1                	cmp    %al,%cl
35b7     35b7:	0f 8c 1d f9 ff ff    	jl     2eda <s5m8767_pmic_probe+0x2eda>
35bd     35bd:	49 89 fe             	mov    %rdi,%r14
35c0     35c0:	e8 00 00 00 00       	call   35c5 <s5m8767_pmic_probe+0x35c5>	35c1: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
35c5     35c5:	4c 89 f7             	mov    %r14,%rdi
35c8     35c8:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
35cd     35cd:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
35d2     35d2:	4c 8b 4c 24 20       	mov    0x20(%rsp),%r9
35d7     35d7:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
35dc     35dc:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
35e6     35e6:	e9 ef f8 ff ff       	jmp    2eda <s5m8767_pmic_probe+0x2eda>
35eb     35eb:	3c 03                	cmp    $0x3,%al
35ed     35ed:	0f 8f 13 f9 ff ff    	jg     2f06 <s5m8767_pmic_probe+0x2f06>
35f3     35f3:	4c 89 f7             	mov    %r14,%rdi
35f6     35f6:	e8 00 00 00 00       	call   35fb <s5m8767_pmic_probe+0x35fb>	35f7: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
35fb     35fb:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
3600     3600:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
3605     3605:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
360a     360a:	4c 8b 4c 24 20       	mov    0x20(%rsp),%r9
360f     360f:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
3614     3614:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
3619     3619:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
3623     3623:	e9 de f8 ff ff       	jmp    2f06 <s5m8767_pmic_probe+0x2f06>
3628     3628:	89 d9                	mov    %ebx,%ecx
362a     362a:	80 e1 07             	and    $0x7,%cl
362d     362d:	80 c1 03             	add    $0x3,%cl
3630     3630:	38 c1                	cmp    %al,%cl
3632     3632:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
3637     3637:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
363c     363c:	0f 8c d4 f8 ff ff    	jl     2f16 <s5m8767_pmic_probe+0x2f16>
3642     3642:	48 89 df             	mov    %rbx,%rdi
3645     3645:	e8 00 00 00 00       	call   364a <s5m8767_pmic_probe+0x364a>	3646: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
364a     364a:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
364f     364f:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
3654     3654:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
3659     3659:	4c 8b 4c 24 20       	mov    0x20(%rsp),%r9
365e     365e:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
3663     3663:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
3668     3668:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
3672     3672:	e9 9f f8 ff ff       	jmp    2f16 <s5m8767_pmic_probe+0x2f16>
3677     3677:	3c 07                	cmp    $0x7,%al
3679     3679:	0f 8f b8 f8 ff ff    	jg     2f37 <s5m8767_pmic_probe+0x2f37>
367f     367f:	48 89 df             	mov    %rbx,%rdi
3682     3682:	e8 00 00 00 00       	call   3687 <s5m8767_pmic_probe+0x3687>	3683: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
3687     3687:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
368c     368c:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
3691     3691:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
3696     3696:	4c 8b 4c 24 20       	mov    0x20(%rsp),%r9
369b     369b:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
36a0     36a0:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
36a5     36a5:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
36af     36af:	e9 83 f8 ff ff       	jmp    2f37 <s5m8767_pmic_probe+0x2f37>
36b4     36b4:	3c 07                	cmp    $0x7,%al
36b6     36b6:	0f 8f 01 f9 ff ff    	jg     2fbd <s5m8767_pmic_probe+0x2fbd>
36bc     36bc:	48 89 df             	mov    %rbx,%rdi
36bf     36bf:	e8 00 00 00 00       	call   36c4 <s5m8767_pmic_probe+0x36c4>	36c0: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
36c4     36c4:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
36c9     36c9:	48 8b 54 24 48       	mov    0x48(%rsp),%rdx
36ce     36ce:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
36d8     36d8:	e9 e0 f8 ff ff       	jmp    2fbd <s5m8767_pmic_probe+0x2fbd>
36dd     36dd:	89 d9                	mov    %ebx,%ecx
36df     36df:	80 e1 04             	and    $0x4,%cl
36e2     36e2:	80 c9 03             	or     $0x3,%cl
36e5     36e5:	38 c1                	cmp    %al,%cl
36e7     36e7:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
36ec     36ec:	0f 8c e8 f8 ff ff    	jl     2fda <s5m8767_pmic_probe+0x2fda>
36f2     36f2:	48 89 df             	mov    %rbx,%rdi
36f5     36f5:	e8 00 00 00 00       	call   36fa <s5m8767_pmic_probe+0x36fa>	36f6: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
36fa     36fa:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
36ff     36ff:	48 8b 54 24 48       	mov    0x48(%rsp),%rdx
3704     3704:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
370e     370e:	e9 c7 f8 ff ff       	jmp    2fda <s5m8767_pmic_probe+0x2fda>
3713     3713:	38 84 24 b0 00 00 00 	cmp    %al,0xb0(%rsp)
371a     371a:	0f 8c d0 f8 ff ff    	jl     2ff0 <s5m8767_pmic_probe+0x2ff0>
3720     3720:	89 fb                	mov    %edi,%ebx
3722     3722:	48 8b bc 24 08 01 00 00 	mov    0x108(%rsp),%rdi
372a     372a:	e8 00 00 00 00       	call   372f <s5m8767_pmic_probe+0x372f>	372b: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
372f     372f:	89 df                	mov    %ebx,%edi
3731     3731:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
3736     3736:	48 8b 54 24 48       	mov    0x48(%rsp),%rdx
373b     373b:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
3745     3745:	e9 a6 f8 ff ff       	jmp    2ff0 <s5m8767_pmic_probe+0x2ff0>
374a     374a:	89 d9                	mov    %ebx,%ecx
374c     374c:	80 e1 07             	and    $0x7,%cl
374f     374f:	80 c1 03             	add    $0x3,%cl
3752     3752:	38 c1                	cmp    %al,%cl
3754     3754:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
3759     3759:	0f 8c 69 f9 ff ff    	jl     30c8 <s5m8767_pmic_probe+0x30c8>
375f     375f:	89 fd                	mov    %edi,%ebp
3761     3761:	48 89 df             	mov    %rbx,%rdi
3764     3764:	e8 00 00 00 00       	call   3769 <s5m8767_pmic_probe+0x3769>	3765: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
3769     3769:	89 ef                	mov    %ebp,%edi
376b     376b:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
3770     3770:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
377a     377a:	e9 49 f9 ff ff       	jmp    30c8 <s5m8767_pmic_probe+0x30c8>
377f     377f:	89 d9                	mov    %ebx,%ecx
3781     3781:	80 e1 04             	and    $0x4,%cl
3784     3784:	80 c9 03             	or     $0x3,%cl
3787     3787:	38 c1                	cmp    %al,%cl
3789     3789:	0f 8c 71 f9 ff ff    	jl     3100 <s5m8767_pmic_probe+0x3100>
378f     378f:	89 fd                	mov    %edi,%ebp
3791     3791:	48 89 df             	mov    %rbx,%rdi
3794     3794:	e8 00 00 00 00       	call   3799 <s5m8767_pmic_probe+0x3799>	3795: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
3799     3799:	89 ef                	mov    %ebp,%edi
379b     379b:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
37a5     37a5:	e9 56 f9 ff ff       	jmp    3100 <s5m8767_pmic_probe+0x3100>
37aa     37aa:	3c 07                	cmp    $0x7,%al
37ac     37ac:	0f 8f 6a f9 ff ff    	jg     311c <s5m8767_pmic_probe+0x311c>
37b2     37b2:	89 bc 24 80 00 00 00 	mov    %edi,0x80(%rsp)
37b9     37b9:	48 89 df             	mov    %rbx,%rdi
37bc     37bc:	e8 00 00 00 00       	call   37c1 <s5m8767_pmic_probe+0x37c1>	37bd: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
37c1     37c1:	8b bc 24 80 00 00 00 	mov    0x80(%rsp),%edi
37c8     37c8:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
37d2     37d2:	e9 45 f9 ff ff       	jmp    311c <s5m8767_pmic_probe+0x311c>
37d7     37d7:	3c 03                	cmp    $0x3,%al
37d9     37d9:	0f 8f 59 f9 ff ff    	jg     3138 <s5m8767_pmic_probe+0x3138>
37df     37df:	48 89 df             	mov    %rbx,%rdi
37e2     37e2:	e8 00 00 00 00       	call   37e7 <s5m8767_pmic_probe+0x37e7>	37e3: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
37e7     37e7:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
37f1     37f1:	e9 42 f9 ff ff       	jmp    3138 <s5m8767_pmic_probe+0x3138>
37f6     37f6:	3c 07                	cmp    $0x7,%al
37f8     37f8:	0f 8f 5a f9 ff ff    	jg     3158 <s5m8767_pmic_probe+0x3158>
37fe     37fe:	48 89 df             	mov    %rbx,%rdi
3801     3801:	e8 00 00 00 00       	call   3806 <s5m8767_pmic_probe+0x3806>	3802: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
3806     3806:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
3810     3810:	e9 43 f9 ff ff       	jmp    3158 <s5m8767_pmic_probe+0x3158>
3815     3815:	38 84 24 f0 00 00 00 	cmp    %al,0xf0(%rsp)
381c     381c:	0f 8c 4e fb ff ff    	jl     3370 <s5m8767_pmic_probe+0x3370>
3822     3822:	48 8b bc 24 e0 00 00 00 	mov    0xe0(%rsp),%rdi
382a     382a:	e8 00 00 00 00       	call   382f <s5m8767_pmic_probe+0x382f>	382b: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
382f     382f:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
3839     3839:	e9 32 fb ff ff       	jmp    3370 <s5m8767_pmic_probe+0x3370>
383e     383e:	3c 03                	cmp    $0x3,%al
3840     3840:	0f 8f 1f f7 ff ff    	jg     2f65 <s5m8767_pmic_probe+0x2f65>
3846     3846:	48 89 df             	mov    %rbx,%rdi
3849     3849:	e8 00 00 00 00       	call   384e <s5m8767_pmic_probe+0x384e>	384a: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
384e     384e:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
3853     3853:	48 8b 54 24 48       	mov    0x48(%rsp),%rdx
3858     3858:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
3862     3862:	e9 fe f6 ff ff       	jmp    2f65 <s5m8767_pmic_probe+0x2f65>
3867     3867:	3c 03                	cmp    $0x3,%al
3869     3869:	0f 8f 2d f7 ff ff    	jg     2f9c <s5m8767_pmic_probe+0x2f9c>
386f     386f:	48 89 df             	mov    %rbx,%rdi
3872     3872:	e8 00 00 00 00       	call   3877 <s5m8767_pmic_probe+0x3877>	3873: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
3877     3877:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
387c     387c:	48 8b 54 24 48       	mov    0x48(%rsp),%rdx
3881     3881:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
388b     388b:	e9 0c f7 ff ff       	jmp    2f9c <s5m8767_pmic_probe+0x2f9c>
3890     3890:	b9 00 00 00 80       	mov    $0x80000000,%ecx
3895     3895:	48 8d 91 ff ff ff 7f 	lea    0x7fffffff(%rcx),%rdx
389c     389c:	be 00 00 00 80       	mov    $0x80000000,%esi
38a1     38a1:	48 89 bc 24 80 00 00 00 	mov    %rdi,0x80(%rsp)
38a9     38a9:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	38ac: R_X86_64_32S	.data..Lanon.a908a6475a134ff59edcbee9bcfd235f.2
38b0     38b0:	89 44 24 40          	mov    %eax,0x40(%rsp)
38b4     38b4:	e8 00 00 00 00       	call   38b9 <s5m8767_pmic_probe+0x38b9>	38b5: R_X86_64_PLT32	__ubsan_handle_divrem_overflow-0x4
38b9     38b9:	48 8b bc 24 80 00 00 00 	mov    0x80(%rsp),%rdi
38c1     38c1:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
38c6     38c6:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
38cb     38cb:	4c 8b 4c 24 20       	mov    0x20(%rsp),%r9
38d0     38d0:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
38d5     38d5:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
38df     38df:	8b 44 24 40          	mov    0x40(%rsp),%eax
38e3     38e3:	e9 b3 f5 ff ff       	jmp    2e9b <s5m8767_pmic_probe+0x2e9b>
38e8     38e8:	89 fd                	mov    %edi,%ebp
38ea     38ea:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	38ed: R_X86_64_32S	.data..Lanon.a908a6475a134ff59edcbee9bcfd235f.7
38f1     38f1:	48 89 de             	mov    %rbx,%rsi
38f4     38f4:	e8 00 00 00 00       	call   38f9 <s5m8767_pmic_probe+0x38f9>	38f5: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
38f9     38f9:	89 ef                	mov    %ebp,%edi
38fb     38fb:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
3900     3900:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
390a     390a:	e9 cf f7 ff ff       	jmp    30de <s5m8767_pmic_probe+0x30de>
390f     390f:	38 44 24 50          	cmp    %al,0x50(%rsp)
3913     3913:	0f 8c 8c fa ff ff    	jl     33a5 <s5m8767_pmic_probe+0x33a5>
3919     3919:	4c 89 df             	mov    %r11,%rdi
391c     391c:	e8 00 00 00 00       	call   3921 <s5m8767_pmic_probe+0x3921>	391d: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
3921     3921:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
3926     3926:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
392b     392b:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
3930     3930:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
393a     393a:	e9 66 fa ff ff       	jmp    33a5 <s5m8767_pmic_probe+0x33a5>
393f     393f:	38 84 24 90 00 00 00 	cmp    %al,0x90(%rsp)
3946     3946:	0f 8c 98 fa ff ff    	jl     33e4 <s5m8767_pmic_probe+0x33e4>
394c     394c:	4c 89 cf             	mov    %r9,%rdi
394f     394f:	e8 00 00 00 00       	call   3954 <s5m8767_pmic_probe+0x3954>	3950: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
3954     3954:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
3959     3959:	4c 8b 4c 24 20       	mov    0x20(%rsp),%r9
395e     395e:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
3963     3963:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
396d     396d:	e9 72 fa ff ff       	jmp    33e4 <s5m8767_pmic_probe+0x33e4>
3972     3972:	38 84 24 d8 00 00 00 	cmp    %al,0xd8(%rsp)
3979     3979:	0f 8c 96 fa ff ff    	jl     3415 <s5m8767_pmic_probe+0x3415>
397f     397f:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
3984     3984:	e8 00 00 00 00       	call   3989 <s5m8767_pmic_probe+0x3989>	3985: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
3989     3989:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
398e     398e:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
3993     3993:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
399d     399d:	e9 73 fa ff ff       	jmp    3415 <s5m8767_pmic_probe+0x3415>
39a2     39a2:	38 84 24 88 00 00 00 	cmp    %al,0x88(%rsp)
39a9     39a9:	0f 8c 14 fa ff ff    	jl     33c3 <s5m8767_pmic_probe+0x33c3>
39af     39af:	e8 00 00 00 00       	call   39b4 <s5m8767_pmic_probe+0x39b4>	39b0: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
39b4     39b4:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
39b9     39b9:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
39be     39be:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
39c8     39c8:	e9 f6 f9 ff ff       	jmp    33c3 <s5m8767_pmic_probe+0x33c3>
39cd     39cd:	38 84 24 88 00 00 00 	cmp    %al,0x88(%rsp)
39d4     39d4:	0f 8c 24 fa ff ff    	jl     33fe <s5m8767_pmic_probe+0x33fe>
39da     39da:	e8 00 00 00 00       	call   39df <s5m8767_pmic_probe+0x39df>	39db: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
39df     39df:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
39e4     39e4:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
39e9     39e9:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
39f3     39f3:	e9 06 fa ff ff       	jmp    33fe <s5m8767_pmic_probe+0x33fe>
39f8     39f8:	38 84 24 88 00 00 00 	cmp    %al,0x88(%rsp)
39ff     39ff:	0f 8c 2e fa ff ff    	jl     3433 <s5m8767_pmic_probe+0x3433>
3a05     3a05:	e8 00 00 00 00       	call   3a0a <s5m8767_pmic_probe+0x3a0a>	3a06: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
3a0a     3a0a:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
3a0f     3a0f:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
3a14     3a14:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
3a1e     3a1e:	e9 10 fa ff ff       	jmp    3433 <s5m8767_pmic_probe+0x3433>
3a23     3a23:	48 8b 84 24 e8 00 00 00 	mov    0xe8(%rsp),%rax
3a2b     3a2b:	80 3c 30 00          	cmpb   $0x0,(%rax,%rsi,1)
3a2f     3a2f:	74 08                	je     3a39 <s5m8767_pmic_probe+0x3a39>
3a31     3a31:	4c 89 e7             	mov    %r12,%rdi
3a34     3a34:	e8 00 00 00 00       	call   3a39 <s5m8767_pmic_probe+0x3a39>	3a35: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
3a39     3a39:	49 8b 3c 24          	mov    (%r12),%rdi
3a3d     3a3d:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	3a40: R_X86_64_32S	.rodata..str.11.101071
3a44     3a44:	e9 85 1b 00 00       	jmp    55ce <s5m8767_pmic_probe+0x55ce>
3a49     3a49:	31 c0                	xor    %eax,%eax
3a4b     3a4b:	e9 88 1b 00 00       	jmp    55d8 <s5m8767_pmic_probe+0x55d8>
3a50     3a50:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
3a5a     3a5a:	48 8b 8c 24 e8 00 00 00 	mov    0xe8(%rsp),%rcx
3a62     3a62:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
3a66     3a66:	74 08                	je     3a70 <s5m8767_pmic_probe+0x3a70>
3a68     3a68:	4c 89 e7             	mov    %r12,%rdi
3a6b     3a6b:	e8 00 00 00 00       	call   3a70 <s5m8767_pmic_probe+0x3a70>	3a6c: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
3a70     3a70:	49 8b 3c 24          	mov    (%r12),%rdi
3a74     3a74:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	3a77: R_X86_64_32S	.rodata..str.12.101072
3a7b     3a7b:	48 8b 54 24 38       	mov    0x38(%rsp),%rdx
3a80     3a80:	e8 00 00 00 00       	call   3a85 <s5m8767_pmic_probe+0x3a85>	3a81: R_X86_64_PLT32	_dev_err-0x4
3a85     3a85:	89 d8                	mov    %ebx,%eax
3a87     3a87:	e9 4c 1b 00 00       	jmp    55d8 <s5m8767_pmic_probe+0x55d8>
3a8c     3a8c:	89 c5                	mov    %eax,%ebp
3a8e     3a8e:	48 8b 84 24 e8 00 00 00 	mov    0xe8(%rsp),%rax
3a96     3a96:	80 3c 30 00          	cmpb   $0x0,(%rax,%rsi,1)
3a9a     3a9a:	74 08                	je     3aa4 <s5m8767_pmic_probe+0x3aa4>
3a9c     3a9c:	4c 89 e7             	mov    %r12,%rdi
3a9f     3a9f:	e8 00 00 00 00       	call   3aa4 <s5m8767_pmic_probe+0x3aa4>	3aa0: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
3aa4     3aa4:	4d 8b 34 24          	mov    (%r12),%r14
3aa8     3aa8:	48 89 d8             	mov    %rbx,%rax
3aab     3aab:	48 c1 e8 03          	shr    $0x3,%rax
3aaf     3aaf:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
3ab9     3ab9:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
3abd     3abd:	74 08                	je     3ac7 <s5m8767_pmic_probe+0x3ac7>
3abf     3abf:	48 89 df             	mov    %rbx,%rdi
3ac2     3ac2:	e8 00 00 00 00       	call   3ac7 <s5m8767_pmic_probe+0x3ac7>	3ac3: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
3ac7     3ac7:	48 8b 1b             	mov    (%rbx),%rbx
3aca     3aca:	48 89 d8             	mov    %rbx,%rax
3acd     3acd:	48 c1 e8 03          	shr    $0x3,%rax
3ad1     3ad1:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
3adb     3adb:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
3adf     3adf:	74 08                	je     3ae9 <s5m8767_pmic_probe+0x3ae9>
3ae1     3ae1:	48 89 df             	mov    %rbx,%rdi
3ae4     3ae4:	e8 00 00 00 00       	call   3ae9 <s5m8767_pmic_probe+0x3ae9>	3ae5: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
3ae9     3ae9:	48 8b 13             	mov    (%rbx),%rdx
3aec     3aec:	4c 89 f7             	mov    %r14,%rdi
3aef     3aef:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	3af2: R_X86_64_32S	.rodata..str.13.101073
3af6     3af6:	89 eb                	mov    %ebp,%ebx
3af8     3af8:	89 e9                	mov    %ebp,%ecx
3afa     3afa:	e8 00 00 00 00       	call   3aff <s5m8767_pmic_probe+0x3aff>	3afb: R_X86_64_PLT32	_dev_err-0x4
3aff     3aff:	89 e8                	mov    %ebp,%eax
3b01     3b01:	e9 d2 1a 00 00       	jmp    55d8 <s5m8767_pmic_probe+0x55d8>
3b06     3b06:	48 8b 4c 24 40       	mov    0x40(%rsp),%rcx
3b0b     3b0b:	80 e1 07             	and    $0x7,%cl
3b0e     3b0e:	38 c1                	cmp    %al,%cl
3b10     3b10:	0f 8c 55 d2 ff ff    	jl     d6b <s5m8767_pmic_probe+0xd6b>
3b16     3b16:	48 8b 7c 24 40       	mov    0x40(%rsp),%rdi
3b1b     3b1b:	e8 00 00 00 00       	call   3b20 <s5m8767_pmic_probe+0x3b20>	3b1c: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
3b20     3b20:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
3b2a     3b2a:	e9 3c d2 ff ff       	jmp    d6b <s5m8767_pmic_probe+0xd6b>
3b2f     3b2f:	44 89 e1             	mov    %r12d,%ecx
3b32     3b32:	80 e1 07             	and    $0x7,%cl
3b35     3b35:	38 c1                	cmp    %al,%cl
3b37     3b37:	0f 8c 4c d2 ff ff    	jl     d89 <s5m8767_pmic_probe+0xd89>
3b3d     3b3d:	4c 89 e7             	mov    %r12,%rdi
3b40     3b40:	e8 00 00 00 00       	call   3b45 <s5m8767_pmic_probe+0x3b45>	3b41: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
3b45     3b45:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
3b4f     3b4f:	e9 35 d2 ff ff       	jmp    d89 <s5m8767_pmic_probe+0xd89>
3b54     3b54:	44 89 f1             	mov    %r14d,%ecx
3b57     3b57:	80 e1 07             	and    $0x7,%cl
3b5a     3b5a:	80 c1 03             	add    $0x3,%cl
3b5d     3b5d:	38 c1                	cmp    %al,%cl
3b5f     3b5f:	0f 8c e3 c6 ff ff    	jl     248 <s5m8767_pmic_probe+0x248>
3b65     3b65:	4c 89 f7             	mov    %r14,%rdi
3b68     3b68:	e8 00 00 00 00       	call   3b6d <s5m8767_pmic_probe+0x3b6d>	3b69: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
3b6d     3b6d:	e9 d6 c6 ff ff       	jmp    248 <s5m8767_pmic_probe+0x248>
3b72     3b72:	44 89 f1             	mov    %r14d,%ecx
3b75     3b75:	80 e1 07             	and    $0x7,%cl
3b78     3b78:	80 c1 03             	add    $0x3,%cl
3b7b     3b7b:	38 c1                	cmp    %al,%cl
3b7d     3b7d:	0f 8c 4e c7 ff ff    	jl     2d1 <s5m8767_pmic_probe+0x2d1>
3b83     3b83:	4c 89 f7             	mov    %r14,%rdi
3b86     3b86:	e8 00 00 00 00       	call   3b8b <s5m8767_pmic_probe+0x3b8b>	3b87: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
3b8b     3b8b:	e9 41 c7 ff ff       	jmp    2d1 <s5m8767_pmic_probe+0x2d1>
3b90     3b90:	44 89 f9             	mov    %r15d,%ecx
3b93     3b93:	80 e1 07             	and    $0x7,%cl
3b96     3b96:	38 c1                	cmp    %al,%cl
3b98     3b98:	0f 8c 1f d2 ff ff    	jl     dbd <s5m8767_pmic_probe+0xdbd>
3b9e     3b9e:	4c 89 ff             	mov    %r15,%rdi
3ba1     3ba1:	e8 00 00 00 00       	call   3ba6 <s5m8767_pmic_probe+0x3ba6>	3ba2: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
3ba6     3ba6:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
3bb0     3bb0:	e9 08 d2 ff ff       	jmp    dbd <s5m8767_pmic_probe+0xdbd>
3bb5     3bb5:	44 89 e1             	mov    %r12d,%ecx
3bb8     3bb8:	80 e1 07             	and    $0x7,%cl
3bbb     3bbb:	38 c1                	cmp    %al,%cl
3bbd     3bbd:	0f 8c 12 d2 ff ff    	jl     dd5 <s5m8767_pmic_probe+0xdd5>
3bc3     3bc3:	4c 89 e7             	mov    %r12,%rdi
3bc6     3bc6:	e8 00 00 00 00       	call   3bcb <s5m8767_pmic_probe+0x3bcb>	3bc7: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
3bcb     3bcb:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
3bd5     3bd5:	e9 fb d1 ff ff       	jmp    dd5 <s5m8767_pmic_probe+0xdd5>
3bda     3bda:	44 89 f1             	mov    %r14d,%ecx
3bdd     3bdd:	80 e1 07             	and    $0x7,%cl
3be0     3be0:	80 c1 03             	add    $0x3,%cl
3be3     3be3:	38 c1                	cmp    %al,%cl
3be5     3be5:	0f 8c 01 d3 ff ff    	jl     eec <s5m8767_pmic_probe+0xeec>
3beb     3beb:	4c 89 f7             	mov    %r14,%rdi
3bee     3bee:	e8 00 00 00 00       	call   3bf3 <s5m8767_pmic_probe+0x3bf3>	3bef: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
3bf3     3bf3:	48 8b 34 24          	mov    (%rsp),%rsi
3bf7     3bf7:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
3c01     3c01:	e9 e6 d2 ff ff       	jmp    eec <s5m8767_pmic_probe+0xeec>
3c06     3c06:	44 89 f9             	mov    %r15d,%ecx
3c09     3c09:	80 e1 07             	and    $0x7,%cl
3c0c     3c0c:	80 c1 03             	add    $0x3,%cl
3c0f     3c0f:	38 c1                	cmp    %al,%cl
3c11     3c11:	0f 8c f8 d2 ff ff    	jl     f0f <s5m8767_pmic_probe+0xf0f>
3c17     3c17:	4c 89 ff             	mov    %r15,%rdi
3c1a     3c1a:	e8 00 00 00 00       	call   3c1f <s5m8767_pmic_probe+0x3c1f>	3c1b: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
3c1f     3c1f:	48 8b 34 24          	mov    (%rsp),%rsi
3c23     3c23:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
3c2d     3c2d:	e9 dd d2 ff ff       	jmp    f0f <s5m8767_pmic_probe+0xf0f>
3c32     3c32:	89 d9                	mov    %ebx,%ecx
3c34     3c34:	80 e1 07             	and    $0x7,%cl
3c37     3c37:	80 c1 03             	add    $0x3,%cl
3c3a     3c3a:	38 c1                	cmp    %al,%cl
3c3c     3c3c:	0f 8c 1c d3 ff ff    	jl     f5e <s5m8767_pmic_probe+0xf5e>
3c42     3c42:	48 89 df             	mov    %rbx,%rdi
3c45     3c45:	e8 00 00 00 00       	call   3c4a <s5m8767_pmic_probe+0x3c4a>	3c46: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
3c4a     3c4a:	48 8b 34 24          	mov    (%rsp),%rsi
3c4e     3c4e:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
3c58     3c58:	e9 01 d3 ff ff       	jmp    f5e <s5m8767_pmic_probe+0xf5e>
3c5d     3c5d:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
3c62     3c62:	80 e1 07             	and    $0x7,%cl
3c65     3c65:	80 c1 03             	add    $0x3,%cl
3c68     3c68:	38 c1                	cmp    %al,%cl
3c6a     3c6a:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
3c6f     3c6f:	0f 8c 13 d3 ff ff    	jl     f88 <s5m8767_pmic_probe+0xf88>
3c75     3c75:	e8 00 00 00 00       	call   3c7a <s5m8767_pmic_probe+0x3c7a>	3c76: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
3c7a     3c7a:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
3c7f     3c7f:	48 8b 34 24          	mov    (%rsp),%rsi
3c83     3c83:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
3c8d     3c8d:	e9 f6 d2 ff ff       	jmp    f88 <s5m8767_pmic_probe+0xf88>
3c92     3c92:	48 8b 4c 24 40       	mov    0x40(%rsp),%rcx
3c97     3c97:	80 e1 07             	and    $0x7,%cl
3c9a     3c9a:	38 c1                	cmp    %al,%cl
3c9c     3c9c:	0f 8c f5 d2 ff ff    	jl     f97 <s5m8767_pmic_probe+0xf97>
3ca2     3ca2:	48 8b 7c 24 40       	mov    0x40(%rsp),%rdi
3ca7     3ca7:	e8 00 00 00 00       	call   3cac <s5m8767_pmic_probe+0x3cac>	3ca8: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
3cac     3cac:	48 8b 34 24          	mov    (%rsp),%rsi
3cb0     3cb0:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
3cba     3cba:	e9 d8 d2 ff ff       	jmp    f97 <s5m8767_pmic_probe+0xf97>
3cbf     3cbf:	89 f9                	mov    %edi,%ecx
3cc1     3cc1:	80 e1 07             	and    $0x7,%cl
3cc4     3cc4:	38 c1                	cmp    %al,%cl
3cc6     3cc6:	0f 8c f5 d2 ff ff    	jl     fc1 <s5m8767_pmic_probe+0xfc1>
3ccc     3ccc:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
3cd1     3cd1:	e8 00 00 00 00       	call   3cd6 <s5m8767_pmic_probe+0x3cd6>	3cd2: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
3cd6     3cd6:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
3cdb     3cdb:	48 8b 34 24          	mov    (%rsp),%rsi
3cdf     3cdf:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
3ce9     3ce9:	e9 d3 d2 ff ff       	jmp    fc1 <s5m8767_pmic_probe+0xfc1>
3cee     3cee:	48 8b 4c 24 70       	mov    0x70(%rsp),%rcx
3cf3     3cf3:	80 e1 07             	and    $0x7,%cl
3cf6     3cf6:	38 c1                	cmp    %al,%cl
3cf8     3cf8:	0f 8c d3 d2 ff ff    	jl     fd1 <s5m8767_pmic_probe+0xfd1>
3cfe     3cfe:	48 8b 7c 24 70       	mov    0x70(%rsp),%rdi
3d03     3d03:	e8 00 00 00 00       	call   3d08 <s5m8767_pmic_probe+0x3d08>	3d04: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
3d08     3d08:	48 8b 34 24          	mov    (%rsp),%rsi
3d0c     3d0c:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
3d16     3d16:	e9 b6 d2 ff ff       	jmp    fd1 <s5m8767_pmic_probe+0xfd1>
3d1b     3d1b:	89 f9                	mov    %edi,%ecx
3d1d     3d1d:	80 e1 07             	and    $0x7,%cl
3d20     3d20:	38 c1                	cmp    %al,%cl
3d22     3d22:	0f 8c d3 d2 ff ff    	jl     ffb <s5m8767_pmic_probe+0xffb>
3d28     3d28:	e8 00 00 00 00       	call   3d2d <s5m8767_pmic_probe+0x3d2d>	3d29: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
3d2d     3d2d:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
3d32     3d32:	48 8b 34 24          	mov    (%rsp),%rsi
3d36     3d36:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
3d40     3d40:	e9 b6 d2 ff ff       	jmp    ffb <s5m8767_pmic_probe+0xffb>
3d45     3d45:	89 d9                	mov    %ebx,%ecx
3d47     3d47:	80 e1 07             	and    $0x7,%cl
3d4a     3d4a:	38 c1                	cmp    %al,%cl
3d4c     3d4c:	0f 8c de d2 ff ff    	jl     1030 <s5m8767_pmic_probe+0x1030>
3d52     3d52:	48 89 df             	mov    %rbx,%rdi
3d55     3d55:	e8 00 00 00 00       	call   3d5a <s5m8767_pmic_probe+0x3d5a>	3d56: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
3d5a     3d5a:	48 8b 34 24          	mov    (%rsp),%rsi
3d5e     3d5e:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
3d68     3d68:	e9 c3 d2 ff ff       	jmp    1030 <s5m8767_pmic_probe+0x1030>
3d6d     3d6d:	89 f9                	mov    %edi,%ecx
3d6f     3d6f:	80 e1 07             	and    $0x7,%cl
3d72     3d72:	38 c1                	cmp    %al,%cl
3d74     3d74:	0f 8c d7 d2 ff ff    	jl     1051 <s5m8767_pmic_probe+0x1051>
3d7a     3d7a:	e8 00 00 00 00       	call   3d7f <s5m8767_pmic_probe+0x3d7f>	3d7b: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
3d7f     3d7f:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
3d84     3d84:	48 8b 34 24          	mov    (%rsp),%rsi
3d88     3d88:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
3d92     3d92:	e9 ba d2 ff ff       	jmp    1051 <s5m8767_pmic_probe+0x1051>
3d97     3d97:	89 d9                	mov    %ebx,%ecx
3d99     3d99:	80 e1 07             	and    $0x7,%cl
3d9c     3d9c:	80 c1 03             	add    $0x3,%cl
3d9f     3d9f:	38 c1                	cmp    %al,%cl
3da1     3da1:	0f 8c cb d2 ff ff    	jl     1072 <s5m8767_pmic_probe+0x1072>
3da7     3da7:	48 89 df             	mov    %rbx,%rdi
3daa     3daa:	e8 00 00 00 00       	call   3daf <s5m8767_pmic_probe+0x3daf>	3dab: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
3daf     3daf:	48 8b 34 24          	mov    (%rsp),%rsi
3db3     3db3:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
3dbd     3dbd:	e9 b0 d2 ff ff       	jmp    1072 <s5m8767_pmic_probe+0x1072>
3dc2     3dc2:	89 d9                	mov    %ebx,%ecx
3dc4     3dc4:	80 e1 07             	and    $0x7,%cl
3dc7     3dc7:	80 c1 03             	add    $0x3,%cl
3dca     3dca:	38 c1                	cmp    %al,%cl
3dcc     3dcc:	0f 8c c3 d2 ff ff    	jl     1095 <s5m8767_pmic_probe+0x1095>
3dd2     3dd2:	48 89 df             	mov    %rbx,%rdi
3dd5     3dd5:	e8 00 00 00 00       	call   3dda <s5m8767_pmic_probe+0x3dda>	3dd6: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
3dda     3dda:	48 8b 34 24          	mov    (%rsp),%rsi
3dde     3dde:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
3de8     3de8:	e9 a8 d2 ff ff       	jmp    1095 <s5m8767_pmic_probe+0x1095>
3ded     3ded:	89 f9                	mov    %edi,%ecx
3def     3def:	80 e1 07             	and    $0x7,%cl
3df2     3df2:	80 c1 03             	add    $0x3,%cl
3df5     3df5:	38 c1                	cmp    %al,%cl
3df7     3df7:	0f 8c bf d2 ff ff    	jl     10bc <s5m8767_pmic_probe+0x10bc>
3dfd     3dfd:	48 8b 7c 24 78       	mov    0x78(%rsp),%rdi
3e02     3e02:	e8 00 00 00 00       	call   3e07 <s5m8767_pmic_probe+0x3e07>	3e03: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
3e07     3e07:	48 8b 7c 24 78       	mov    0x78(%rsp),%rdi
3e0c     3e0c:	48 8b 34 24          	mov    (%rsp),%rsi
3e10     3e10:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
3e1a     3e1a:	e9 9d d2 ff ff       	jmp    10bc <s5m8767_pmic_probe+0x10bc>
3e1f     3e1f:	89 d9                	mov    %ebx,%ecx
3e21     3e21:	80 e1 07             	and    $0x7,%cl
3e24     3e24:	80 c1 03             	add    $0x3,%cl
3e27     3e27:	38 c1                	cmp    %al,%cl
3e29     3e29:	0f 8c a8 d2 ff ff    	jl     10d7 <s5m8767_pmic_probe+0x10d7>
3e2f     3e2f:	48 89 df             	mov    %rbx,%rdi
3e32     3e32:	e8 00 00 00 00       	call   3e37 <s5m8767_pmic_probe+0x3e37>	3e33: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
3e37     3e37:	48 8b 34 24          	mov    (%rsp),%rsi
3e3b     3e3b:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
3e45     3e45:	e9 8d d2 ff ff       	jmp    10d7 <s5m8767_pmic_probe+0x10d7>
3e4a     3e4a:	89 d9                	mov    %ebx,%ecx
3e4c     3e4c:	80 e1 07             	and    $0x7,%cl
3e4f     3e4f:	80 c1 03             	add    $0x3,%cl
3e52     3e52:	38 c1                	cmp    %al,%cl
3e54     3e54:	0f 8c 9f d2 ff ff    	jl     10f9 <s5m8767_pmic_probe+0x10f9>
3e5a     3e5a:	48 89 df             	mov    %rbx,%rdi
3e5d     3e5d:	e8 00 00 00 00       	call   3e62 <s5m8767_pmic_probe+0x3e62>	3e5e: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
3e62     3e62:	48 8b 34 24          	mov    (%rsp),%rsi
3e66     3e66:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
3e70     3e70:	e9 84 d2 ff ff       	jmp    10f9 <s5m8767_pmic_probe+0x10f9>
3e75     3e75:	89 d9                	mov    %ebx,%ecx
3e77     3e77:	80 e1 07             	and    $0x7,%cl
3e7a     3e7a:	80 c1 03             	add    $0x3,%cl
3e7d     3e7d:	38 c1                	cmp    %al,%cl
3e7f     3e7f:	0f 8c 97 d2 ff ff    	jl     111c <s5m8767_pmic_probe+0x111c>
3e85     3e85:	48 89 df             	mov    %rbx,%rdi
3e88     3e88:	e8 00 00 00 00       	call   3e8d <s5m8767_pmic_probe+0x3e8d>	3e89: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
3e8d     3e8d:	48 8b 34 24          	mov    (%rsp),%rsi
3e91     3e91:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
3e9b     3e9b:	e9 7c d2 ff ff       	jmp    111c <s5m8767_pmic_probe+0x111c>
3ea0     3ea0:	89 f9                	mov    %edi,%ecx
3ea2     3ea2:	80 e1 07             	and    $0x7,%cl
3ea5     3ea5:	80 c1 03             	add    $0x3,%cl
3ea8     3ea8:	38 c1                	cmp    %al,%cl
3eaa     3eaa:	0f 8c 93 d2 ff ff    	jl     1143 <s5m8767_pmic_probe+0x1143>
3eb0     3eb0:	48 8b 7c 24 50       	mov    0x50(%rsp),%rdi
3eb5     3eb5:	e8 00 00 00 00       	call   3eba <s5m8767_pmic_probe+0x3eba>	3eb6: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
3eba     3eba:	48 8b 7c 24 50       	mov    0x50(%rsp),%rdi
3ebf     3ebf:	48 8b 34 24          	mov    (%rsp),%rsi
3ec3     3ec3:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
3ecd     3ecd:	e9 71 d2 ff ff       	jmp    1143 <s5m8767_pmic_probe+0x1143>
3ed2     3ed2:	89 d9                	mov    %ebx,%ecx
3ed4     3ed4:	80 e1 07             	and    $0x7,%cl
3ed7     3ed7:	80 c1 03             	add    $0x3,%cl
3eda     3eda:	38 c1                	cmp    %al,%cl
3edc     3edc:	0f 8c 7c d2 ff ff    	jl     115e <s5m8767_pmic_probe+0x115e>
3ee2     3ee2:	48 89 df             	mov    %rbx,%rdi
3ee5     3ee5:	e8 00 00 00 00       	call   3eea <s5m8767_pmic_probe+0x3eea>	3ee6: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
3eea     3eea:	48 8b 34 24          	mov    (%rsp),%rsi
3eee     3eee:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
3ef8     3ef8:	e9 61 d2 ff ff       	jmp    115e <s5m8767_pmic_probe+0x115e>
3efd     3efd:	89 d9                	mov    %ebx,%ecx
3eff     3eff:	80 e1 07             	and    $0x7,%cl
3f02     3f02:	80 c1 03             	add    $0x3,%cl
3f05     3f05:	38 c1                	cmp    %al,%cl
3f07     3f07:	0f 8c 73 d2 ff ff    	jl     1180 <s5m8767_pmic_probe+0x1180>
3f0d     3f0d:	48 89 df             	mov    %rbx,%rdi
3f10     3f10:	e8 00 00 00 00       	call   3f15 <s5m8767_pmic_probe+0x3f15>	3f11: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
3f15     3f15:	48 8b 34 24          	mov    (%rsp),%rsi
3f19     3f19:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
3f23     3f23:	e9 58 d2 ff ff       	jmp    1180 <s5m8767_pmic_probe+0x1180>
3f28     3f28:	89 d9                	mov    %ebx,%ecx
3f2a     3f2a:	80 e1 07             	and    $0x7,%cl
3f2d     3f2d:	80 c1 03             	add    $0x3,%cl
3f30     3f30:	38 c1                	cmp    %al,%cl
3f32     3f32:	0f 8c 6b d2 ff ff    	jl     11a3 <s5m8767_pmic_probe+0x11a3>
3f38     3f38:	48 89 df             	mov    %rbx,%rdi
3f3b     3f3b:	e8 00 00 00 00       	call   3f40 <s5m8767_pmic_probe+0x3f40>	3f3c: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
3f40     3f40:	48 8b 34 24          	mov    (%rsp),%rsi
3f44     3f44:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
3f4e     3f4e:	e9 50 d2 ff ff       	jmp    11a3 <s5m8767_pmic_probe+0x11a3>
3f53     3f53:	89 d9                	mov    %ebx,%ecx
3f55     3f55:	80 e1 07             	and    $0x7,%cl
3f58     3f58:	80 c1 03             	add    $0x3,%cl
3f5b     3f5b:	38 c1                	cmp    %al,%cl
3f5d     3f5d:	0f 8c 62 d2 ff ff    	jl     11c5 <s5m8767_pmic_probe+0x11c5>
3f63     3f63:	48 89 df             	mov    %rbx,%rdi
3f66     3f66:	e8 00 00 00 00       	call   3f6b <s5m8767_pmic_probe+0x3f6b>	3f67: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
3f6b     3f6b:	48 8b 34 24          	mov    (%rsp),%rsi
3f6f     3f6f:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
3f79     3f79:	e9 47 d2 ff ff       	jmp    11c5 <s5m8767_pmic_probe+0x11c5>
3f7e     3f7e:	89 d9                	mov    %ebx,%ecx
3f80     3f80:	80 e1 07             	and    $0x7,%cl
3f83     3f83:	80 c1 03             	add    $0x3,%cl
3f86     3f86:	38 c1                	cmp    %al,%cl
3f88     3f88:	0f 8c 5a d2 ff ff    	jl     11e8 <s5m8767_pmic_probe+0x11e8>
3f8e     3f8e:	48 89 df             	mov    %rbx,%rdi
3f91     3f91:	e8 00 00 00 00       	call   3f96 <s5m8767_pmic_probe+0x3f96>	3f92: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
3f96     3f96:	48 8b 34 24          	mov    (%rsp),%rsi
3f9a     3f9a:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
3fa4     3fa4:	e9 3f d2 ff ff       	jmp    11e8 <s5m8767_pmic_probe+0x11e8>
3fa9     3fa9:	89 d9                	mov    %ebx,%ecx
3fab     3fab:	80 e1 07             	and    $0x7,%cl
3fae     3fae:	80 c1 03             	add    $0x3,%cl
3fb1     3fb1:	38 c1                	cmp    %al,%cl
3fb3     3fb3:	0f 8c 4c d2 ff ff    	jl     1205 <s5m8767_pmic_probe+0x1205>
3fb9     3fb9:	48 89 df             	mov    %rbx,%rdi
3fbc     3fbc:	e8 00 00 00 00       	call   3fc1 <s5m8767_pmic_probe+0x3fc1>	3fbd: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
3fc1     3fc1:	48 8b 34 24          	mov    (%rsp),%rsi
3fc5     3fc5:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
3fcf     3fcf:	e9 31 d2 ff ff       	jmp    1205 <s5m8767_pmic_probe+0x1205>
3fd4     3fd4:	48 8b 8c 24 b8 00 00 00 	mov    0xb8(%rsp),%rcx
3fdc     3fdc:	80 e1 07             	and    $0x7,%cl
3fdf     3fdf:	80 c1 03             	add    $0x3,%cl
3fe2     3fe2:	38 c1                	cmp    %al,%cl
3fe4     3fe4:	48 8b bc 24 b8 00 00 00 	mov    0xb8(%rsp),%rdi
3fec     3fec:	0f 8c 45 d2 ff ff    	jl     1237 <s5m8767_pmic_probe+0x1237>
3ff2     3ff2:	e8 00 00 00 00       	call   3ff7 <s5m8767_pmic_probe+0x3ff7>	3ff3: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
3ff7     3ff7:	48 8b bc 24 b8 00 00 00 	mov    0xb8(%rsp),%rdi
3fff     3fff:	48 8b 34 24          	mov    (%rsp),%rsi
4003     4003:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
400d     400d:	e9 25 d2 ff ff       	jmp    1237 <s5m8767_pmic_probe+0x1237>
4012     4012:	89 d9                	mov    %ebx,%ecx
4014     4014:	80 e1 07             	and    $0x7,%cl
4017     4017:	38 c1                	cmp    %al,%cl
4019     4019:	0f 8c 34 d2 ff ff    	jl     1253 <s5m8767_pmic_probe+0x1253>
401f     401f:	48 89 df             	mov    %rbx,%rdi
4022     4022:	e8 00 00 00 00       	call   4027 <s5m8767_pmic_probe+0x4027>	4023: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
4027     4027:	48 8b 34 24          	mov    (%rsp),%rsi
402b     402b:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
4035     4035:	e9 19 d2 ff ff       	jmp    1253 <s5m8767_pmic_probe+0x1253>
403a     403a:	48 8b 8c 24 a8 00 00 00 	mov    0xa8(%rsp),%rcx
4042     4042:	80 e1 07             	and    $0x7,%cl
4045     4045:	38 c1                	cmp    %al,%cl
4047     4047:	48 8b bc 24 a8 00 00 00 	mov    0xa8(%rsp),%rdi
404f     404f:	0f 8c 2c d2 ff ff    	jl     1281 <s5m8767_pmic_probe+0x1281>
4055     4055:	e8 00 00 00 00       	call   405a <s5m8767_pmic_probe+0x405a>	4056: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
405a     405a:	48 8b bc 24 a8 00 00 00 	mov    0xa8(%rsp),%rdi
4062     4062:	48 8b 34 24          	mov    (%rsp),%rsi
4066     4066:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
4070     4070:	e9 0c d2 ff ff       	jmp    1281 <s5m8767_pmic_probe+0x1281>
4075     4075:	89 d9                	mov    %ebx,%ecx
4077     4077:	80 e1 07             	and    $0x7,%cl
407a     407a:	38 c1                	cmp    %al,%cl
407c     407c:	0f 8c 1b d2 ff ff    	jl     129d <s5m8767_pmic_probe+0x129d>
4082     4082:	48 89 df             	mov    %rbx,%rdi
4085     4085:	e8 00 00 00 00       	call   408a <s5m8767_pmic_probe+0x408a>	4086: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
408a     408a:	48 8b 34 24          	mov    (%rsp),%rsi
408e     408e:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
4098     4098:	e9 00 d2 ff ff       	jmp    129d <s5m8767_pmic_probe+0x129d>
409d     409d:	48 8b 8c 24 a0 00 00 00 	mov    0xa0(%rsp),%rcx
40a5     40a5:	80 e1 07             	and    $0x7,%cl
40a8     40a8:	38 c1                	cmp    %al,%cl
40aa     40aa:	48 8b bc 24 a0 00 00 00 	mov    0xa0(%rsp),%rdi
40b2     40b2:	0f 8c 13 d2 ff ff    	jl     12cb <s5m8767_pmic_probe+0x12cb>
40b8     40b8:	e8 00 00 00 00       	call   40bd <s5m8767_pmic_probe+0x40bd>	40b9: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
40bd     40bd:	48 8b bc 24 a0 00 00 00 	mov    0xa0(%rsp),%rdi
40c5     40c5:	48 8b 34 24          	mov    (%rsp),%rsi
40c9     40c9:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
40d3     40d3:	e9 f3 d1 ff ff       	jmp    12cb <s5m8767_pmic_probe+0x12cb>
40d8     40d8:	89 d9                	mov    %ebx,%ecx
40da     40da:	80 e1 07             	and    $0x7,%cl
40dd     40dd:	38 c1                	cmp    %al,%cl
40df     40df:	0f 8c 02 d2 ff ff    	jl     12e7 <s5m8767_pmic_probe+0x12e7>
40e5     40e5:	48 89 df             	mov    %rbx,%rdi
40e8     40e8:	e8 00 00 00 00       	call   40ed <s5m8767_pmic_probe+0x40ed>	40e9: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
40ed     40ed:	48 8b 34 24          	mov    (%rsp),%rsi
40f1     40f1:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
40fb     40fb:	e9 e7 d1 ff ff       	jmp    12e7 <s5m8767_pmic_probe+0x12e7>
4100     4100:	48 8b 8c 24 98 00 00 00 	mov    0x98(%rsp),%rcx
4108     4108:	80 e1 07             	and    $0x7,%cl
410b     410b:	38 c1                	cmp    %al,%cl
410d     410d:	48 8b bc 24 98 00 00 00 	mov    0x98(%rsp),%rdi
4115     4115:	0f 8c fa d1 ff ff    	jl     1315 <s5m8767_pmic_probe+0x1315>
411b     411b:	e8 00 00 00 00       	call   4120 <s5m8767_pmic_probe+0x4120>	411c: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
4120     4120:	48 8b bc 24 98 00 00 00 	mov    0x98(%rsp),%rdi
4128     4128:	48 8b 34 24          	mov    (%rsp),%rsi
412c     412c:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
4136     4136:	e9 da d1 ff ff       	jmp    1315 <s5m8767_pmic_probe+0x1315>
413b     413b:	89 d9                	mov    %ebx,%ecx
413d     413d:	80 e1 07             	and    $0x7,%cl
4140     4140:	80 c1 03             	add    $0x3,%cl
4143     4143:	38 c1                	cmp    %al,%cl
4145     4145:	0f 8c 4f d2 ff ff    	jl     139a <s5m8767_pmic_probe+0x139a>
414b     414b:	48 89 df             	mov    %rbx,%rdi
414e     414e:	e8 00 00 00 00       	call   4153 <s5m8767_pmic_probe+0x4153>	414f: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
4153     4153:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
415d     415d:	e9 38 d2 ff ff       	jmp    139a <s5m8767_pmic_probe+0x139a>
4162     4162:	89 d9                	mov    %ebx,%ecx
4164     4164:	80 e1 07             	and    $0x7,%cl
4167     4167:	80 c1 03             	add    $0x3,%cl
416a     416a:	38 c1                	cmp    %al,%cl
416c     416c:	0f 8c ae d2 ff ff    	jl     1420 <s5m8767_pmic_probe+0x1420>
4172     4172:	48 89 df             	mov    %rbx,%rdi
4175     4175:	e8 00 00 00 00       	call   417a <s5m8767_pmic_probe+0x417a>	4176: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
417a     417a:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
4184     4184:	e9 97 d2 ff ff       	jmp    1420 <s5m8767_pmic_probe+0x1420>
4189     4189:	89 d9                	mov    %ebx,%ecx
418b     418b:	80 e1 07             	and    $0x7,%cl
418e     418e:	80 c1 03             	add    $0x3,%cl
4191     4191:	38 c1                	cmp    %al,%cl
4193     4193:	0f 8c 2f d3 ff ff    	jl     14c8 <s5m8767_pmic_probe+0x14c8>
4199     4199:	48 89 df             	mov    %rbx,%rdi
419c     419c:	e8 00 00 00 00       	call   41a1 <s5m8767_pmic_probe+0x41a1>	419d: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
41a1     41a1:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
41ab     41ab:	e9 18 d3 ff ff       	jmp    14c8 <s5m8767_pmic_probe+0x14c8>
41b0     41b0:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
41b5     41b5:	80 e1 07             	and    $0x7,%cl
41b8     41b8:	38 c1                	cmp    %al,%cl
41ba     41ba:	0f 8c 9f d3 ff ff    	jl     155f <s5m8767_pmic_probe+0x155f>
41c0     41c0:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
41c5     41c5:	e8 00 00 00 00       	call   41ca <s5m8767_pmic_probe+0x41ca>	41c6: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
41ca     41ca:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
41cf     41cf:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
41d9     41d9:	e9 81 d3 ff ff       	jmp    155f <s5m8767_pmic_probe+0x155f>
41de     41de:	89 f9                	mov    %edi,%ecx
41e0     41e0:	80 e1 07             	and    $0x7,%cl
41e3     41e3:	38 c1                	cmp    %al,%cl
41e5     41e5:	0f 8c 00 d4 ff ff    	jl     15eb <s5m8767_pmic_probe+0x15eb>
41eb     41eb:	e8 00 00 00 00       	call   41f0 <s5m8767_pmic_probe+0x41f0>	41ec: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
41f0     41f0:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
41f5     41f5:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
41fa     41fa:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
41ff     41ff:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
4204     4204:	4c 8b 4c 24 18       	mov    0x18(%rsp),%r9
4209     4209:	48 8b 34 24          	mov    (%rsp),%rsi
420d     420d:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
4217     4217:	e9 cf d3 ff ff       	jmp    15eb <s5m8767_pmic_probe+0x15eb>
421c     421c:	44 89 d9             	mov    %r11d,%ecx
421f     421f:	80 e1 07             	and    $0x7,%cl
4222     4222:	38 c1                	cmp    %al,%cl
4224     4224:	0f 8c 34 d4 ff ff    	jl     165e <s5m8767_pmic_probe+0x165e>
422a     422a:	4c 89 df             	mov    %r11,%rdi
422d     422d:	e8 00 00 00 00       	call   4232 <s5m8767_pmic_probe+0x4232>	422e: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
4232     4232:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
4237     4237:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
423c     423c:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
4241     4241:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
4246     4246:	4c 8b 4c 24 18       	mov    0x18(%rsp),%r9
424b     424b:	48 8b 34 24          	mov    (%rsp),%rsi
424f     424f:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
4259     4259:	e9 00 d4 ff ff       	jmp    165e <s5m8767_pmic_probe+0x165e>
425e     425e:	44 89 c9             	mov    %r9d,%ecx
4261     4261:	80 e1 07             	and    $0x7,%cl
4264     4264:	38 c1                	cmp    %al,%cl
4266     4266:	0f 8c 66 d4 ff ff    	jl     16d2 <s5m8767_pmic_probe+0x16d2>
426c     426c:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
4271     4271:	e8 00 00 00 00       	call   4276 <s5m8767_pmic_probe+0x4276>	4272: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
4276     4276:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
427b     427b:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
4280     4280:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
4285     4285:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
428a     428a:	4c 8b 4c 24 18       	mov    0x18(%rsp),%r9
428f     428f:	48 8b 34 24          	mov    (%rsp),%rsi
4293     4293:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
429d     429d:	e9 30 d4 ff ff       	jmp    16d2 <s5m8767_pmic_probe+0x16d2>
42a2     42a2:	89 f9                	mov    %edi,%ecx
42a4     42a4:	80 e1 07             	and    $0x7,%cl
42a7     42a7:	38 c1                	cmp    %al,%cl
42a9     42a9:	0f 8c 97 d4 ff ff    	jl     1746 <s5m8767_pmic_probe+0x1746>
42af     42af:	e8 00 00 00 00       	call   42b4 <s5m8767_pmic_probe+0x42b4>	42b0: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
42b4     42b4:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
42b9     42b9:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
42be     42be:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
42c3     42c3:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
42c8     42c8:	4c 8b 4c 24 18       	mov    0x18(%rsp),%r9
42cd     42cd:	48 8b 34 24          	mov    (%rsp),%rsi
42d1     42d1:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
42db     42db:	e9 66 d4 ff ff       	jmp    1746 <s5m8767_pmic_probe+0x1746>
42e0     42e0:	44 89 d9             	mov    %r11d,%ecx
42e3     42e3:	80 e1 07             	and    $0x7,%cl
42e6     42e6:	38 c1                	cmp    %al,%cl
42e8     42e8:	0f 8c cb d4 ff ff    	jl     17b9 <s5m8767_pmic_probe+0x17b9>
42ee     42ee:	4c 89 df             	mov    %r11,%rdi
42f1     42f1:	e8 00 00 00 00       	call   42f6 <s5m8767_pmic_probe+0x42f6>	42f2: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
42f6     42f6:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
42fb     42fb:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
4300     4300:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
4305     4305:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
430a     430a:	4c 8b 4c 24 18       	mov    0x18(%rsp),%r9
430f     430f:	48 8b 34 24          	mov    (%rsp),%rsi
4313     4313:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
431d     431d:	e9 97 d4 ff ff       	jmp    17b9 <s5m8767_pmic_probe+0x17b9>
4322     4322:	44 89 c9             	mov    %r9d,%ecx
4325     4325:	80 e1 07             	and    $0x7,%cl
4328     4328:	38 c1                	cmp    %al,%cl
432a     432a:	0f 8c fd d4 ff ff    	jl     182d <s5m8767_pmic_probe+0x182d>
4330     4330:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
4335     4335:	e8 00 00 00 00       	call   433a <s5m8767_pmic_probe+0x433a>	4336: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
433a     433a:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
433f     433f:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
4344     4344:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
4349     4349:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
434e     434e:	4c 8b 4c 24 18       	mov    0x18(%rsp),%r9
4353     4353:	48 8b 34 24          	mov    (%rsp),%rsi
4357     4357:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
4361     4361:	e9 c7 d4 ff ff       	jmp    182d <s5m8767_pmic_probe+0x182d>
4366     4366:	89 f9                	mov    %edi,%ecx
4368     4368:	80 e1 07             	and    $0x7,%cl
436b     436b:	38 c1                	cmp    %al,%cl
436d     436d:	0f 8c 2e d5 ff ff    	jl     18a1 <s5m8767_pmic_probe+0x18a1>
4373     4373:	e8 00 00 00 00       	call   4378 <s5m8767_pmic_probe+0x4378>	4374: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
4378     4378:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
437d     437d:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
4382     4382:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
4387     4387:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
438c     438c:	4c 8b 4c 24 18       	mov    0x18(%rsp),%r9
4391     4391:	48 8b 34 24          	mov    (%rsp),%rsi
4395     4395:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
439f     439f:	e9 fd d4 ff ff       	jmp    18a1 <s5m8767_pmic_probe+0x18a1>
43a4     43a4:	44 89 d9             	mov    %r11d,%ecx
43a7     43a7:	80 e1 07             	and    $0x7,%cl
43aa     43aa:	38 c1                	cmp    %al,%cl
43ac     43ac:	0f 8c 62 d5 ff ff    	jl     1914 <s5m8767_pmic_probe+0x1914>
43b2     43b2:	4c 89 df             	mov    %r11,%rdi
43b5     43b5:	e8 00 00 00 00       	call   43ba <s5m8767_pmic_probe+0x43ba>	43b6: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
43ba     43ba:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
43bf     43bf:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
43c4     43c4:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
43c9     43c9:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
43ce     43ce:	4c 8b 4c 24 18       	mov    0x18(%rsp),%r9
43d3     43d3:	48 8b 34 24          	mov    (%rsp),%rsi
43d7     43d7:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
43e1     43e1:	e9 2e d5 ff ff       	jmp    1914 <s5m8767_pmic_probe+0x1914>
43e6     43e6:	44 89 c9             	mov    %r9d,%ecx
43e9     43e9:	80 e1 07             	and    $0x7,%cl
43ec     43ec:	38 c1                	cmp    %al,%cl
43ee     43ee:	0f 8c 94 d5 ff ff    	jl     1988 <s5m8767_pmic_probe+0x1988>
43f4     43f4:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
43f9     43f9:	e8 00 00 00 00       	call   43fe <s5m8767_pmic_probe+0x43fe>	43fa: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
43fe     43fe:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
4403     4403:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
4408     4408:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
440d     440d:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
4412     4412:	4c 8b 4c 24 18       	mov    0x18(%rsp),%r9
4417     4417:	48 8b 34 24          	mov    (%rsp),%rsi
441b     441b:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
4425     4425:	e9 5e d5 ff ff       	jmp    1988 <s5m8767_pmic_probe+0x1988>
442a     442a:	89 f9                	mov    %edi,%ecx
442c     442c:	80 e1 07             	and    $0x7,%cl
442f     442f:	38 c1                	cmp    %al,%cl
4431     4431:	0f 8c c5 d5 ff ff    	jl     19fc <s5m8767_pmic_probe+0x19fc>
4437     4437:	e8 00 00 00 00       	call   443c <s5m8767_pmic_probe+0x443c>	4438: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
443c     443c:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
4441     4441:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
4446     4446:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
444b     444b:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
4450     4450:	4c 8b 4c 24 18       	mov    0x18(%rsp),%r9
4455     4455:	48 8b 34 24          	mov    (%rsp),%rsi
4459     4459:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
4463     4463:	e9 94 d5 ff ff       	jmp    19fc <s5m8767_pmic_probe+0x19fc>
4468     4468:	44 89 d9             	mov    %r11d,%ecx
446b     446b:	80 e1 07             	and    $0x7,%cl
446e     446e:	38 c1                	cmp    %al,%cl
4470     4470:	0f 8c f9 d5 ff ff    	jl     1a6f <s5m8767_pmic_probe+0x1a6f>
4476     4476:	4c 89 df             	mov    %r11,%rdi
4479     4479:	e8 00 00 00 00       	call   447e <s5m8767_pmic_probe+0x447e>	447a: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
447e     447e:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
4483     4483:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
4488     4488:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
448d     448d:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
4492     4492:	4c 8b 4c 24 18       	mov    0x18(%rsp),%r9
4497     4497:	48 8b 34 24          	mov    (%rsp),%rsi
449b     449b:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
44a5     44a5:	e9 c5 d5 ff ff       	jmp    1a6f <s5m8767_pmic_probe+0x1a6f>
44aa     44aa:	44 89 c9             	mov    %r9d,%ecx
44ad     44ad:	80 e1 07             	and    $0x7,%cl
44b0     44b0:	38 c1                	cmp    %al,%cl
44b2     44b2:	0f 8c 2e d6 ff ff    	jl     1ae6 <s5m8767_pmic_probe+0x1ae6>
44b8     44b8:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
44bd     44bd:	e8 00 00 00 00       	call   44c2 <s5m8767_pmic_probe+0x44c2>	44be: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
44c2     44c2:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
44c7     44c7:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
44cc     44cc:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
44d1     44d1:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
44d6     44d6:	4c 8b 4c 24 18       	mov    0x18(%rsp),%r9
44db     44db:	48 8b 34 24          	mov    (%rsp),%rsi
44df     44df:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
44e9     44e9:	e9 f8 d5 ff ff       	jmp    1ae6 <s5m8767_pmic_probe+0x1ae6>
44ee     44ee:	89 f9                	mov    %edi,%ecx
44f0     44f0:	80 e1 07             	and    $0x7,%cl
44f3     44f3:	38 c1                	cmp    %al,%cl
44f5     44f5:	0f 8c 5f d6 ff ff    	jl     1b5a <s5m8767_pmic_probe+0x1b5a>
44fb     44fb:	e8 00 00 00 00       	call   4500 <s5m8767_pmic_probe+0x4500>	44fc: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
4500     4500:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
4505     4505:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
450a     450a:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
450f     450f:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
4514     4514:	4c 8b 4c 24 18       	mov    0x18(%rsp),%r9
4519     4519:	48 8b 34 24          	mov    (%rsp),%rsi
451d     451d:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
4527     4527:	e9 2e d6 ff ff       	jmp    1b5a <s5m8767_pmic_probe+0x1b5a>
452c     452c:	44 89 d9             	mov    %r11d,%ecx
452f     452f:	80 e1 07             	and    $0x7,%cl
4532     4532:	38 c1                	cmp    %al,%cl
4534     4534:	0f 8c 93 d6 ff ff    	jl     1bcd <s5m8767_pmic_probe+0x1bcd>
453a     453a:	4c 89 df             	mov    %r11,%rdi
453d     453d:	e8 00 00 00 00       	call   4542 <s5m8767_pmic_probe+0x4542>	453e: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
4542     4542:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
4547     4547:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
454c     454c:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
4551     4551:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
4556     4556:	4c 8b 4c 24 18       	mov    0x18(%rsp),%r9
455b     455b:	48 8b 34 24          	mov    (%rsp),%rsi
455f     455f:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
4569     4569:	e9 5f d6 ff ff       	jmp    1bcd <s5m8767_pmic_probe+0x1bcd>
456e     456e:	44 89 c9             	mov    %r9d,%ecx
4571     4571:	80 e1 07             	and    $0x7,%cl
4574     4574:	38 c1                	cmp    %al,%cl
4576     4576:	0f 8c c8 d6 ff ff    	jl     1c44 <s5m8767_pmic_probe+0x1c44>
457c     457c:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
4581     4581:	e8 00 00 00 00       	call   4586 <s5m8767_pmic_probe+0x4586>	4582: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
4586     4586:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
458b     458b:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
4590     4590:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
4595     4595:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
459a     459a:	4c 8b 4c 24 18       	mov    0x18(%rsp),%r9
459f     459f:	48 8b 34 24          	mov    (%rsp),%rsi
45a3     45a3:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
45ad     45ad:	e9 92 d6 ff ff       	jmp    1c44 <s5m8767_pmic_probe+0x1c44>
45b2     45b2:	89 f9                	mov    %edi,%ecx
45b4     45b4:	80 e1 07             	and    $0x7,%cl
45b7     45b7:	38 c1                	cmp    %al,%cl
45b9     45b9:	0f 8c f9 d6 ff ff    	jl     1cb8 <s5m8767_pmic_probe+0x1cb8>
45bf     45bf:	e8 00 00 00 00       	call   45c4 <s5m8767_pmic_probe+0x45c4>	45c0: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
45c4     45c4:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
45c9     45c9:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
45ce     45ce:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
45d3     45d3:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
45d8     45d8:	4c 8b 4c 24 18       	mov    0x18(%rsp),%r9
45dd     45dd:	48 8b 34 24          	mov    (%rsp),%rsi
45e1     45e1:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
45eb     45eb:	e9 c8 d6 ff ff       	jmp    1cb8 <s5m8767_pmic_probe+0x1cb8>
45f0     45f0:	44 89 d9             	mov    %r11d,%ecx
45f3     45f3:	80 e1 07             	and    $0x7,%cl
45f6     45f6:	38 c1                	cmp    %al,%cl
45f8     45f8:	0f 8c 2d d7 ff ff    	jl     1d2b <s5m8767_pmic_probe+0x1d2b>
45fe     45fe:	4c 89 df             	mov    %r11,%rdi
4601     4601:	e8 00 00 00 00       	call   4606 <s5m8767_pmic_probe+0x4606>	4602: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
4606     4606:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
460b     460b:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
4610     4610:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
4615     4615:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
461a     461a:	4c 8b 4c 24 18       	mov    0x18(%rsp),%r9
461f     461f:	48 8b 34 24          	mov    (%rsp),%rsi
4623     4623:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
462d     462d:	e9 f9 d6 ff ff       	jmp    1d2b <s5m8767_pmic_probe+0x1d2b>
4632     4632:	44 89 c9             	mov    %r9d,%ecx
4635     4635:	80 e1 07             	and    $0x7,%cl
4638     4638:	38 c1                	cmp    %al,%cl
463a     463a:	0f 8c 62 d7 ff ff    	jl     1da2 <s5m8767_pmic_probe+0x1da2>
4640     4640:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
4645     4645:	e8 00 00 00 00       	call   464a <s5m8767_pmic_probe+0x464a>	4646: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
464a     464a:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
464f     464f:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
4654     4654:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
4659     4659:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
465e     465e:	4c 8b 4c 24 18       	mov    0x18(%rsp),%r9
4663     4663:	48 8b 34 24          	mov    (%rsp),%rsi
4667     4667:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
4671     4671:	e9 2c d7 ff ff       	jmp    1da2 <s5m8767_pmic_probe+0x1da2>
4676     4676:	89 f9                	mov    %edi,%ecx
4678     4678:	80 e1 07             	and    $0x7,%cl
467b     467b:	38 c1                	cmp    %al,%cl
467d     467d:	0f 8c 93 d7 ff ff    	jl     1e16 <s5m8767_pmic_probe+0x1e16>
4683     4683:	e8 00 00 00 00       	call   4688 <s5m8767_pmic_probe+0x4688>	4684: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
4688     4688:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
468d     468d:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
4692     4692:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
4697     4697:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
469c     469c:	4c 8b 4c 24 18       	mov    0x18(%rsp),%r9
46a1     46a1:	48 8b 34 24          	mov    (%rsp),%rsi
46a5     46a5:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
46af     46af:	e9 62 d7 ff ff       	jmp    1e16 <s5m8767_pmic_probe+0x1e16>
46b4     46b4:	44 89 d9             	mov    %r11d,%ecx
46b7     46b7:	80 e1 07             	and    $0x7,%cl
46ba     46ba:	38 c1                	cmp    %al,%cl
46bc     46bc:	0f 8c c7 d7 ff ff    	jl     1e89 <s5m8767_pmic_probe+0x1e89>
46c2     46c2:	4c 89 df             	mov    %r11,%rdi
46c5     46c5:	e8 00 00 00 00       	call   46ca <s5m8767_pmic_probe+0x46ca>	46c6: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
46ca     46ca:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
46cf     46cf:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
46d4     46d4:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
46d9     46d9:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
46de     46de:	4c 8b 4c 24 18       	mov    0x18(%rsp),%r9
46e3     46e3:	48 8b 34 24          	mov    (%rsp),%rsi
46e7     46e7:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
46f1     46f1:	e9 93 d7 ff ff       	jmp    1e89 <s5m8767_pmic_probe+0x1e89>
46f6     46f6:	44 89 c9             	mov    %r9d,%ecx
46f9     46f9:	80 e1 07             	and    $0x7,%cl
46fc     46fc:	38 c1                	cmp    %al,%cl
46fe     46fe:	0f 8c fc d7 ff ff    	jl     1f00 <s5m8767_pmic_probe+0x1f00>
4704     4704:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
4709     4709:	e8 00 00 00 00       	call   470e <s5m8767_pmic_probe+0x470e>	470a: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
470e     470e:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
4713     4713:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
4718     4718:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
471d     471d:	4c 8b 4c 24 18       	mov    0x18(%rsp),%r9
4722     4722:	48 8b 34 24          	mov    (%rsp),%rsi
4726     4726:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
4730     4730:	e9 cb d7 ff ff       	jmp    1f00 <s5m8767_pmic_probe+0x1f00>
4735     4735:	89 f9                	mov    %edi,%ecx
4737     4737:	80 e1 07             	and    $0x7,%cl
473a     473a:	38 c1                	cmp    %al,%cl
473c     473c:	0f 8c 32 d8 ff ff    	jl     1f74 <s5m8767_pmic_probe+0x1f74>
4742     4742:	e8 00 00 00 00       	call   4747 <s5m8767_pmic_probe+0x4747>	4743: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
4747     4747:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
474c     474c:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
4751     4751:	48 8b 34 24          	mov    (%rsp),%rsi
4755     4755:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
475f     475f:	e9 10 d8 ff ff       	jmp    1f74 <s5m8767_pmic_probe+0x1f74>
4764     4764:	44 89 d9             	mov    %r11d,%ecx
4767     4767:	80 e1 07             	and    $0x7,%cl
476a     476a:	38 c1                	cmp    %al,%cl
476c     476c:	0f 8c 7a d8 ff ff    	jl     1fec <s5m8767_pmic_probe+0x1fec>
4772     4772:	4c 89 df             	mov    %r11,%rdi
4775     4775:	e8 00 00 00 00       	call   477a <s5m8767_pmic_probe+0x477a>	4776: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
477a     477a:	48 8b 7c 24 50       	mov    0x50(%rsp),%rdi
477f     477f:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
4784     4784:	48 8b 34 24          	mov    (%rsp),%rsi
4788     4788:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
4792     4792:	e9 55 d8 ff ff       	jmp    1fec <s5m8767_pmic_probe+0x1fec>
4797     4797:	48 8b 4c 24 40       	mov    0x40(%rsp),%rcx
479c     479c:	80 e1 07             	and    $0x7,%cl
479f     479f:	38 c1                	cmp    %al,%cl
47a1     47a1:	0f 8c bc d8 ff ff    	jl     2063 <s5m8767_pmic_probe+0x2063>
47a7     47a7:	48 8b 7c 24 40       	mov    0x40(%rsp),%rdi
47ac     47ac:	e8 00 00 00 00       	call   47b1 <s5m8767_pmic_probe+0x47b1>	47ad: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
47b1     47b1:	48 8b 7c 24 50       	mov    0x50(%rsp),%rdi
47b6     47b6:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
47c0     47c0:	e9 9e d8 ff ff       	jmp    2063 <s5m8767_pmic_probe+0x2063>
47c5     47c5:	44 89 f9             	mov    %r15d,%ecx
47c8     47c8:	80 e1 07             	and    $0x7,%cl
47cb     47cb:	38 c1                	cmp    %al,%cl
47cd     47cd:	0f 8c 19 c6 ff ff    	jl     dec <s5m8767_pmic_probe+0xdec>
47d3     47d3:	4c 89 ff             	mov    %r15,%rdi
47d6     47d6:	e8 00 00 00 00       	call   47db <s5m8767_pmic_probe+0x47db>	47d7: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
47db     47db:	e9 0c c6 ff ff       	jmp    dec <s5m8767_pmic_probe+0xdec>
47e0     47e0:	48 8b 8c 24 88 00 00 00 	mov    0x88(%rsp),%rcx
47e8     47e8:	80 e1 07             	and    $0x7,%cl
47eb     47eb:	80 c1 03             	add    $0x3,%cl
47ee     47ee:	38 c1                	cmp    %al,%cl
47f0     47f0:	0f 8c d0 d8 ff ff    	jl     20c6 <s5m8767_pmic_probe+0x20c6>
47f6     47f6:	48 8b bc 24 88 00 00 00 	mov    0x88(%rsp),%rdi
47fe     47fe:	e8 00 00 00 00       	call   4803 <s5m8767_pmic_probe+0x4803>	47ff: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
4803     4803:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
480d     480d:	e9 b4 d8 ff ff       	jmp    20c6 <s5m8767_pmic_probe+0x20c6>
4812     4812:	89 f9                	mov    %edi,%ecx
4814     4814:	80 e1 07             	and    $0x7,%cl
4817     4817:	80 c1 03             	add    $0x3,%cl
481a     481a:	38 c1                	cmp    %al,%cl
481c     481c:	0f 8c cf d8 ff ff    	jl     20f1 <s5m8767_pmic_probe+0x20f1>
4822     4822:	48 8b 7c 24 78       	mov    0x78(%rsp),%rdi
4827     4827:	89 f3                	mov    %esi,%ebx
4829     4829:	e8 00 00 00 00       	call   482e <s5m8767_pmic_probe+0x482e>	482a: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
482e     482e:	48 8b 7c 24 78       	mov    0x78(%rsp),%rdi
4833     4833:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
483d     483d:	89 de                	mov    %ebx,%esi
483f     483f:	48 8b 9c 24 b0 00 00 00 	mov    0xb0(%rsp),%rbx
4847     4847:	e9 a5 d8 ff ff       	jmp    20f1 <s5m8767_pmic_probe+0x20f1>
484c     484c:	89 d9                	mov    %ebx,%ecx
484e     484e:	80 e1 07             	and    $0x7,%cl
4851     4851:	80 c1 03             	add    $0x3,%cl
4854     4854:	38 c1                	cmp    %al,%cl
4856     4856:	0f 8c b2 d8 ff ff    	jl     210e <s5m8767_pmic_probe+0x210e>
485c     485c:	48 89 df             	mov    %rbx,%rdi
485f     485f:	89 f3                	mov    %esi,%ebx
4861     4861:	e8 00 00 00 00       	call   4866 <s5m8767_pmic_probe+0x4866>	4862: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
4866     4866:	89 de                	mov    %ebx,%esi
4868     4868:	48 8b 9c 24 b0 00 00 00 	mov    0xb0(%rsp),%rbx
4870     4870:	e9 99 d8 ff ff       	jmp    210e <s5m8767_pmic_probe+0x210e>
4875     4875:	44 89 f1             	mov    %r14d,%ecx
4878     4878:	80 e1 07             	and    $0x7,%cl
487b     487b:	80 c1 03             	add    $0x3,%cl
487e     487e:	38 c1                	cmp    %al,%cl
4880     4880:	0f 8c 02 ba ff ff    	jl     288 <s5m8767_pmic_probe+0x288>
4886     4886:	4c 89 f7             	mov    %r14,%rdi
4889     4889:	e8 00 00 00 00       	call   488e <s5m8767_pmic_probe+0x488e>	488a: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
488e     488e:	e9 f5 b9 ff ff       	jmp    288 <s5m8767_pmic_probe+0x288>
4893     4893:	89 d9                	mov    %ebx,%ecx
4895     4895:	80 e1 07             	and    $0x7,%cl
4898     4898:	80 c1 03             	add    $0x3,%cl
489b     489b:	38 c1                	cmp    %al,%cl
489d     489d:	0f 8c f1 cc ff ff    	jl     1594 <s5m8767_pmic_probe+0x1594>
48a3     48a3:	48 89 df             	mov    %rbx,%rdi
48a6     48a6:	e8 00 00 00 00       	call   48ab <s5m8767_pmic_probe+0x48ab>	48a7: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
48ab     48ab:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
48b0     48b0:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
48b5     48b5:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
48ba     48ba:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
48bf     48bf:	4c 8b 4c 24 18       	mov    0x18(%rsp),%r9
48c4     48c4:	48 8b 34 24          	mov    (%rsp),%rsi
48c8     48c8:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
48d2     48d2:	e9 bd cc ff ff       	jmp    1594 <s5m8767_pmic_probe+0x1594>
48d7     48d7:	89 d9                	mov    %ebx,%ecx
48d9     48d9:	80 e1 07             	and    $0x7,%cl
48dc     48dc:	38 c1                	cmp    %al,%cl
48de     48de:	0f 8c f7 cc ff ff    	jl     15db <s5m8767_pmic_probe+0x15db>
48e4     48e4:	48 89 df             	mov    %rbx,%rdi
48e7     48e7:	e8 00 00 00 00       	call   48ec <s5m8767_pmic_probe+0x48ec>	48e8: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
48ec     48ec:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
48f1     48f1:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
48f6     48f6:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
48fb     48fb:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
4900     4900:	4c 8b 4c 24 18       	mov    0x18(%rsp),%r9
4905     4905:	48 8b 34 24          	mov    (%rsp),%rsi
4909     4909:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
4913     4913:	e9 c3 cc ff ff       	jmp    15db <s5m8767_pmic_probe+0x15db>
4918     4918:	89 d9                	mov    %ebx,%ecx
491a     491a:	80 e1 07             	and    $0x7,%cl
491d     491d:	80 c1 03             	add    $0x3,%cl
4920     4920:	38 c1                	cmp    %al,%cl
4922     4922:	0f 8c df cc ff ff    	jl     1607 <s5m8767_pmic_probe+0x1607>
4928     4928:	48 89 df             	mov    %rbx,%rdi
492b     492b:	e8 00 00 00 00       	call   4930 <s5m8767_pmic_probe+0x4930>	492c: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
4930     4930:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
4935     4935:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
493a     493a:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
493f     493f:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
4944     4944:	4c 8b 4c 24 18       	mov    0x18(%rsp),%r9
4949     4949:	48 8b 34 24          	mov    (%rsp),%rsi
494d     494d:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
4957     4957:	e9 ab cc ff ff       	jmp    1607 <s5m8767_pmic_probe+0x1607>
495c     495c:	89 d9                	mov    %ebx,%ecx
495e     495e:	80 e1 07             	and    $0x7,%cl
4961     4961:	38 c1                	cmp    %al,%cl
4963     4963:	0f 8c e5 cc ff ff    	jl     164e <s5m8767_pmic_probe+0x164e>
4969     4969:	48 89 df             	mov    %rbx,%rdi
496c     496c:	e8 00 00 00 00       	call   4971 <s5m8767_pmic_probe+0x4971>	496d: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
4971     4971:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
4976     4976:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
497b     497b:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
4980     4980:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
4985     4985:	4c 8b 4c 24 18       	mov    0x18(%rsp),%r9
498a     498a:	48 8b 34 24          	mov    (%rsp),%rsi
498e     498e:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
4998     4998:	e9 b1 cc ff ff       	jmp    164e <s5m8767_pmic_probe+0x164e>
499d     499d:	89 d9                	mov    %ebx,%ecx
499f     499f:	80 e1 07             	and    $0x7,%cl
49a2     49a2:	80 c1 03             	add    $0x3,%cl
49a5     49a5:	38 c1                	cmp    %al,%cl
49a7     49a7:	0f 8c ce cc ff ff    	jl     167b <s5m8767_pmic_probe+0x167b>
49ad     49ad:	48 89 df             	mov    %rbx,%rdi
49b0     49b0:	e8 00 00 00 00       	call   49b5 <s5m8767_pmic_probe+0x49b5>	49b1: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
49b5     49b5:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
49ba     49ba:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
49bf     49bf:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
49c4     49c4:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
49c9     49c9:	4c 8b 4c 24 18       	mov    0x18(%rsp),%r9
49ce     49ce:	48 8b 34 24          	mov    (%rsp),%rsi
49d2     49d2:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
49dc     49dc:	e9 9a cc ff ff       	jmp    167b <s5m8767_pmic_probe+0x167b>
49e1     49e1:	89 d9                	mov    %ebx,%ecx
49e3     49e3:	80 e1 07             	and    $0x7,%cl
49e6     49e6:	38 c1                	cmp    %al,%cl
49e8     49e8:	0f 8c d4 cc ff ff    	jl     16c2 <s5m8767_pmic_probe+0x16c2>
49ee     49ee:	48 89 df             	mov    %rbx,%rdi
49f1     49f1:	e8 00 00 00 00       	call   49f6 <s5m8767_pmic_probe+0x49f6>	49f2: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
49f6     49f6:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
49fb     49fb:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
4a00     4a00:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
4a05     4a05:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
4a0a     4a0a:	4c 8b 4c 24 18       	mov    0x18(%rsp),%r9
4a0f     4a0f:	48 8b 34 24          	mov    (%rsp),%rsi
4a13     4a13:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
4a1d     4a1d:	e9 a0 cc ff ff       	jmp    16c2 <s5m8767_pmic_probe+0x16c2>
4a22     4a22:	89 d9                	mov    %ebx,%ecx
4a24     4a24:	80 e1 07             	and    $0x7,%cl
4a27     4a27:	80 c1 03             	add    $0x3,%cl
4a2a     4a2a:	38 c1                	cmp    %al,%cl
4a2c     4a2c:	0f 8c bd cc ff ff    	jl     16ef <s5m8767_pmic_probe+0x16ef>
4a32     4a32:	48 89 df             	mov    %rbx,%rdi
4a35     4a35:	e8 00 00 00 00       	call   4a3a <s5m8767_pmic_probe+0x4a3a>	4a36: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
4a3a     4a3a:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
4a3f     4a3f:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
4a44     4a44:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
4a49     4a49:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
4a4e     4a4e:	4c 8b 4c 24 18       	mov    0x18(%rsp),%r9
4a53     4a53:	48 8b 34 24          	mov    (%rsp),%rsi
4a57     4a57:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
4a61     4a61:	e9 89 cc ff ff       	jmp    16ef <s5m8767_pmic_probe+0x16ef>
4a66     4a66:	89 d9                	mov    %ebx,%ecx
4a68     4a68:	80 e1 07             	and    $0x7,%cl
4a6b     4a6b:	38 c1                	cmp    %al,%cl
4a6d     4a6d:	0f 8c c3 cc ff ff    	jl     1736 <s5m8767_pmic_probe+0x1736>
4a73     4a73:	48 89 df             	mov    %rbx,%rdi
4a76     4a76:	e8 00 00 00 00       	call   4a7b <s5m8767_pmic_probe+0x4a7b>	4a77: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
4a7b     4a7b:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
4a80     4a80:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
4a85     4a85:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
4a8a     4a8a:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
4a8f     4a8f:	4c 8b 4c 24 18       	mov    0x18(%rsp),%r9
4a94     4a94:	48 8b 34 24          	mov    (%rsp),%rsi
4a98     4a98:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
4aa2     4aa2:	e9 8f cc ff ff       	jmp    1736 <s5m8767_pmic_probe+0x1736>
4aa7     4aa7:	89 d9                	mov    %ebx,%ecx
4aa9     4aa9:	80 e1 07             	and    $0x7,%cl
4aac     4aac:	80 c1 03             	add    $0x3,%cl
4aaf     4aaf:	38 c1                	cmp    %al,%cl
4ab1     4ab1:	0f 8c ab cc ff ff    	jl     1762 <s5m8767_pmic_probe+0x1762>
4ab7     4ab7:	48 89 df             	mov    %rbx,%rdi
4aba     4aba:	e8 00 00 00 00       	call   4abf <s5m8767_pmic_probe+0x4abf>	4abb: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
4abf     4abf:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
4ac4     4ac4:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
4ac9     4ac9:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
4ace     4ace:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
4ad3     4ad3:	4c 8b 4c 24 18       	mov    0x18(%rsp),%r9
4ad8     4ad8:	48 8b 34 24          	mov    (%rsp),%rsi
4adc     4adc:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
4ae6     4ae6:	e9 77 cc ff ff       	jmp    1762 <s5m8767_pmic_probe+0x1762>
4aeb     4aeb:	89 d9                	mov    %ebx,%ecx
4aed     4aed:	80 e1 07             	and    $0x7,%cl
4af0     4af0:	38 c1                	cmp    %al,%cl
4af2     4af2:	0f 8c b1 cc ff ff    	jl     17a9 <s5m8767_pmic_probe+0x17a9>
4af8     4af8:	48 89 df             	mov    %rbx,%rdi
4afb     4afb:	e8 00 00 00 00       	call   4b00 <s5m8767_pmic_probe+0x4b00>	4afc: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
4b00     4b00:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
4b05     4b05:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
4b0a     4b0a:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
4b0f     4b0f:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
4b14     4b14:	4c 8b 4c 24 18       	mov    0x18(%rsp),%r9
4b19     4b19:	48 8b 34 24          	mov    (%rsp),%rsi
4b1d     4b1d:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
4b27     4b27:	e9 7d cc ff ff       	jmp    17a9 <s5m8767_pmic_probe+0x17a9>
4b2c     4b2c:	89 d9                	mov    %ebx,%ecx
4b2e     4b2e:	80 e1 07             	and    $0x7,%cl
4b31     4b31:	80 c1 03             	add    $0x3,%cl
4b34     4b34:	38 c1                	cmp    %al,%cl
4b36     4b36:	0f 8c 9a cc ff ff    	jl     17d6 <s5m8767_pmic_probe+0x17d6>
4b3c     4b3c:	48 89 df             	mov    %rbx,%rdi
4b3f     4b3f:	e8 00 00 00 00       	call   4b44 <s5m8767_pmic_probe+0x4b44>	4b40: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
4b44     4b44:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
4b49     4b49:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
4b4e     4b4e:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
4b53     4b53:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
4b58     4b58:	4c 8b 4c 24 18       	mov    0x18(%rsp),%r9
4b5d     4b5d:	48 8b 34 24          	mov    (%rsp),%rsi
4b61     4b61:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
4b6b     4b6b:	e9 66 cc ff ff       	jmp    17d6 <s5m8767_pmic_probe+0x17d6>
4b70     4b70:	89 d9                	mov    %ebx,%ecx
4b72     4b72:	80 e1 07             	and    $0x7,%cl
4b75     4b75:	38 c1                	cmp    %al,%cl
4b77     4b77:	0f 8c a0 cc ff ff    	jl     181d <s5m8767_pmic_probe+0x181d>
4b7d     4b7d:	48 89 df             	mov    %rbx,%rdi
4b80     4b80:	e8 00 00 00 00       	call   4b85 <s5m8767_pmic_probe+0x4b85>	4b81: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
4b85     4b85:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
4b8a     4b8a:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
4b8f     4b8f:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
4b94     4b94:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
4b99     4b99:	4c 8b 4c 24 18       	mov    0x18(%rsp),%r9
4b9e     4b9e:	48 8b 34 24          	mov    (%rsp),%rsi
4ba2     4ba2:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
4bac     4bac:	e9 6c cc ff ff       	jmp    181d <s5m8767_pmic_probe+0x181d>
4bb1     4bb1:	89 d9                	mov    %ebx,%ecx
4bb3     4bb3:	80 e1 07             	and    $0x7,%cl
4bb6     4bb6:	80 c1 03             	add    $0x3,%cl
4bb9     4bb9:	38 c1                	cmp    %al,%cl
4bbb     4bbb:	0f 8c 89 cc ff ff    	jl     184a <s5m8767_pmic_probe+0x184a>
4bc1     4bc1:	48 89 df             	mov    %rbx,%rdi
4bc4     4bc4:	e8 00 00 00 00       	call   4bc9 <s5m8767_pmic_probe+0x4bc9>	4bc5: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
4bc9     4bc9:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
4bce     4bce:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
4bd3     4bd3:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
4bd8     4bd8:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
4bdd     4bdd:	4c 8b 4c 24 18       	mov    0x18(%rsp),%r9
4be2     4be2:	48 8b 34 24          	mov    (%rsp),%rsi
4be6     4be6:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
4bf0     4bf0:	e9 55 cc ff ff       	jmp    184a <s5m8767_pmic_probe+0x184a>
4bf5     4bf5:	89 d9                	mov    %ebx,%ecx
4bf7     4bf7:	80 e1 07             	and    $0x7,%cl
4bfa     4bfa:	38 c1                	cmp    %al,%cl
4bfc     4bfc:	0f 8c 8f cc ff ff    	jl     1891 <s5m8767_pmic_probe+0x1891>
4c02     4c02:	48 89 df             	mov    %rbx,%rdi
4c05     4c05:	e8 00 00 00 00       	call   4c0a <s5m8767_pmic_probe+0x4c0a>	4c06: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
4c0a     4c0a:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
4c0f     4c0f:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
4c14     4c14:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
4c19     4c19:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
4c1e     4c1e:	4c 8b 4c 24 18       	mov    0x18(%rsp),%r9
4c23     4c23:	48 8b 34 24          	mov    (%rsp),%rsi
4c27     4c27:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
4c31     4c31:	e9 5b cc ff ff       	jmp    1891 <s5m8767_pmic_probe+0x1891>
4c36     4c36:	89 d9                	mov    %ebx,%ecx
4c38     4c38:	80 e1 07             	and    $0x7,%cl
4c3b     4c3b:	80 c1 03             	add    $0x3,%cl
4c3e     4c3e:	38 c1                	cmp    %al,%cl
4c40     4c40:	0f 8c 77 cc ff ff    	jl     18bd <s5m8767_pmic_probe+0x18bd>
4c46     4c46:	48 89 df             	mov    %rbx,%rdi
4c49     4c49:	e8 00 00 00 00       	call   4c4e <s5m8767_pmic_probe+0x4c4e>	4c4a: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
4c4e     4c4e:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
4c53     4c53:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
4c58     4c58:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
4c5d     4c5d:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
4c62     4c62:	4c 8b 4c 24 18       	mov    0x18(%rsp),%r9
4c67     4c67:	48 8b 34 24          	mov    (%rsp),%rsi
4c6b     4c6b:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
4c75     4c75:	e9 43 cc ff ff       	jmp    18bd <s5m8767_pmic_probe+0x18bd>
4c7a     4c7a:	89 d9                	mov    %ebx,%ecx
4c7c     4c7c:	80 e1 07             	and    $0x7,%cl
4c7f     4c7f:	38 c1                	cmp    %al,%cl
4c81     4c81:	0f 8c 7d cc ff ff    	jl     1904 <s5m8767_pmic_probe+0x1904>
4c87     4c87:	48 89 df             	mov    %rbx,%rdi
4c8a     4c8a:	e8 00 00 00 00       	call   4c8f <s5m8767_pmic_probe+0x4c8f>	4c8b: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
4c8f     4c8f:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
4c94     4c94:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
4c99     4c99:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
4c9e     4c9e:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
4ca3     4ca3:	4c 8b 4c 24 18       	mov    0x18(%rsp),%r9
4ca8     4ca8:	48 8b 34 24          	mov    (%rsp),%rsi
4cac     4cac:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
4cb6     4cb6:	e9 49 cc ff ff       	jmp    1904 <s5m8767_pmic_probe+0x1904>
4cbb     4cbb:	89 d9                	mov    %ebx,%ecx
4cbd     4cbd:	80 e1 07             	and    $0x7,%cl
4cc0     4cc0:	80 c1 03             	add    $0x3,%cl
4cc3     4cc3:	38 c1                	cmp    %al,%cl
4cc5     4cc5:	0f 8c 66 cc ff ff    	jl     1931 <s5m8767_pmic_probe+0x1931>
4ccb     4ccb:	48 89 df             	mov    %rbx,%rdi
4cce     4cce:	e8 00 00 00 00       	call   4cd3 <s5m8767_pmic_probe+0x4cd3>	4ccf: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
4cd3     4cd3:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
4cd8     4cd8:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
4cdd     4cdd:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
4ce2     4ce2:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
4ce7     4ce7:	4c 8b 4c 24 18       	mov    0x18(%rsp),%r9
4cec     4cec:	48 8b 34 24          	mov    (%rsp),%rsi
4cf0     4cf0:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
4cfa     4cfa:	e9 32 cc ff ff       	jmp    1931 <s5m8767_pmic_probe+0x1931>
4cff     4cff:	89 d9                	mov    %ebx,%ecx
4d01     4d01:	80 e1 07             	and    $0x7,%cl
4d04     4d04:	38 c1                	cmp    %al,%cl
4d06     4d06:	0f 8c 6c cc ff ff    	jl     1978 <s5m8767_pmic_probe+0x1978>
4d0c     4d0c:	48 89 df             	mov    %rbx,%rdi
4d0f     4d0f:	e8 00 00 00 00       	call   4d14 <s5m8767_pmic_probe+0x4d14>	4d10: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
4d14     4d14:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
4d19     4d19:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
4d1e     4d1e:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
4d23     4d23:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
4d28     4d28:	4c 8b 4c 24 18       	mov    0x18(%rsp),%r9
4d2d     4d2d:	48 8b 34 24          	mov    (%rsp),%rsi
4d31     4d31:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
4d3b     4d3b:	e9 38 cc ff ff       	jmp    1978 <s5m8767_pmic_probe+0x1978>
4d40     4d40:	89 d9                	mov    %ebx,%ecx
4d42     4d42:	80 e1 07             	and    $0x7,%cl
4d45     4d45:	80 c1 03             	add    $0x3,%cl
4d48     4d48:	38 c1                	cmp    %al,%cl
4d4a     4d4a:	0f 8c 55 cc ff ff    	jl     19a5 <s5m8767_pmic_probe+0x19a5>
4d50     4d50:	48 89 df             	mov    %rbx,%rdi
4d53     4d53:	e8 00 00 00 00       	call   4d58 <s5m8767_pmic_probe+0x4d58>	4d54: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
4d58     4d58:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
4d5d     4d5d:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
4d62     4d62:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
4d67     4d67:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
4d6c     4d6c:	4c 8b 4c 24 18       	mov    0x18(%rsp),%r9
4d71     4d71:	48 8b 34 24          	mov    (%rsp),%rsi
4d75     4d75:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
4d7f     4d7f:	e9 21 cc ff ff       	jmp    19a5 <s5m8767_pmic_probe+0x19a5>
4d84     4d84:	89 d9                	mov    %ebx,%ecx
4d86     4d86:	80 e1 07             	and    $0x7,%cl
4d89     4d89:	38 c1                	cmp    %al,%cl
4d8b     4d8b:	0f 8c 5b cc ff ff    	jl     19ec <s5m8767_pmic_probe+0x19ec>
4d91     4d91:	48 89 df             	mov    %rbx,%rdi
4d94     4d94:	e8 00 00 00 00       	call   4d99 <s5m8767_pmic_probe+0x4d99>	4d95: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
4d99     4d99:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
4d9e     4d9e:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
4da3     4da3:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
4da8     4da8:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
4dad     4dad:	4c 8b 4c 24 18       	mov    0x18(%rsp),%r9
4db2     4db2:	48 8b 34 24          	mov    (%rsp),%rsi
4db6     4db6:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
4dc0     4dc0:	e9 27 cc ff ff       	jmp    19ec <s5m8767_pmic_probe+0x19ec>
4dc5     4dc5:	89 d9                	mov    %ebx,%ecx
4dc7     4dc7:	80 e1 07             	and    $0x7,%cl
4dca     4dca:	80 c1 03             	add    $0x3,%cl
4dcd     4dcd:	38 c1                	cmp    %al,%cl
4dcf     4dcf:	0f 8c 43 cc ff ff    	jl     1a18 <s5m8767_pmic_probe+0x1a18>
4dd5     4dd5:	48 89 df             	mov    %rbx,%rdi
4dd8     4dd8:	e8 00 00 00 00       	call   4ddd <s5m8767_pmic_probe+0x4ddd>	4dd9: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
4ddd     4ddd:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
4de2     4de2:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
4de7     4de7:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
4dec     4dec:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
4df1     4df1:	4c 8b 4c 24 18       	mov    0x18(%rsp),%r9
4df6     4df6:	48 8b 34 24          	mov    (%rsp),%rsi
4dfa     4dfa:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
4e04     4e04:	e9 0f cc ff ff       	jmp    1a18 <s5m8767_pmic_probe+0x1a18>
4e09     4e09:	89 d9                	mov    %ebx,%ecx
4e0b     4e0b:	80 e1 07             	and    $0x7,%cl
4e0e     4e0e:	38 c1                	cmp    %al,%cl
4e10     4e10:	0f 8c 49 cc ff ff    	jl     1a5f <s5m8767_pmic_probe+0x1a5f>
4e16     4e16:	48 89 df             	mov    %rbx,%rdi
4e19     4e19:	e8 00 00 00 00       	call   4e1e <s5m8767_pmic_probe+0x4e1e>	4e1a: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
4e1e     4e1e:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
4e23     4e23:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
4e28     4e28:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
4e2d     4e2d:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
4e32     4e32:	4c 8b 4c 24 18       	mov    0x18(%rsp),%r9
4e37     4e37:	48 8b 34 24          	mov    (%rsp),%rsi
4e3b     4e3b:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
4e45     4e45:	e9 15 cc ff ff       	jmp    1a5f <s5m8767_pmic_probe+0x1a5f>
4e4a     4e4a:	89 d9                	mov    %ebx,%ecx
4e4c     4e4c:	80 e1 07             	and    $0x7,%cl
4e4f     4e4f:	80 c1 03             	add    $0x3,%cl
4e52     4e52:	38 c1                	cmp    %al,%cl
4e54     4e54:	0f 8c 35 cc ff ff    	jl     1a8f <s5m8767_pmic_probe+0x1a8f>
4e5a     4e5a:	48 89 df             	mov    %rbx,%rdi
4e5d     4e5d:	e8 00 00 00 00       	call   4e62 <s5m8767_pmic_probe+0x4e62>	4e5e: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
4e62     4e62:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
4e67     4e67:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
4e6c     4e6c:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
4e71     4e71:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
4e76     4e76:	4c 8b 4c 24 18       	mov    0x18(%rsp),%r9
4e7b     4e7b:	48 8b 34 24          	mov    (%rsp),%rsi
4e7f     4e7f:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
4e89     4e89:	e9 01 cc ff ff       	jmp    1a8f <s5m8767_pmic_probe+0x1a8f>
4e8e     4e8e:	89 d9                	mov    %ebx,%ecx
4e90     4e90:	80 e1 07             	and    $0x7,%cl
4e93     4e93:	38 c1                	cmp    %al,%cl
4e95     4e95:	0f 8c 3b cc ff ff    	jl     1ad6 <s5m8767_pmic_probe+0x1ad6>
4e9b     4e9b:	48 89 df             	mov    %rbx,%rdi
4e9e     4e9e:	e8 00 00 00 00       	call   4ea3 <s5m8767_pmic_probe+0x4ea3>	4e9f: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
4ea3     4ea3:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
4ea8     4ea8:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
4ead     4ead:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
4eb2     4eb2:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
4eb7     4eb7:	4c 8b 4c 24 18       	mov    0x18(%rsp),%r9
4ebc     4ebc:	48 8b 34 24          	mov    (%rsp),%rsi
4ec0     4ec0:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
4eca     4eca:	e9 07 cc ff ff       	jmp    1ad6 <s5m8767_pmic_probe+0x1ad6>
4ecf     4ecf:	89 d9                	mov    %ebx,%ecx
4ed1     4ed1:	80 e1 07             	and    $0x7,%cl
4ed4     4ed4:	80 c1 03             	add    $0x3,%cl
4ed7     4ed7:	38 c1                	cmp    %al,%cl
4ed9     4ed9:	0f 8c 24 cc ff ff    	jl     1b03 <s5m8767_pmic_probe+0x1b03>
4edf     4edf:	48 89 df             	mov    %rbx,%rdi
4ee2     4ee2:	e8 00 00 00 00       	call   4ee7 <s5m8767_pmic_probe+0x4ee7>	4ee3: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
4ee7     4ee7:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
4eec     4eec:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
4ef1     4ef1:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
4ef6     4ef6:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
4efb     4efb:	4c 8b 4c 24 18       	mov    0x18(%rsp),%r9
4f00     4f00:	48 8b 34 24          	mov    (%rsp),%rsi
4f04     4f04:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
4f0e     4f0e:	e9 f0 cb ff ff       	jmp    1b03 <s5m8767_pmic_probe+0x1b03>
4f13     4f13:	89 d9                	mov    %ebx,%ecx
4f15     4f15:	80 e1 07             	and    $0x7,%cl
4f18     4f18:	38 c1                	cmp    %al,%cl
4f1a     4f1a:	0f 8c 2a cc ff ff    	jl     1b4a <s5m8767_pmic_probe+0x1b4a>
4f20     4f20:	48 89 df             	mov    %rbx,%rdi
4f23     4f23:	e8 00 00 00 00       	call   4f28 <s5m8767_pmic_probe+0x4f28>	4f24: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
4f28     4f28:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
4f2d     4f2d:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
4f32     4f32:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
4f37     4f37:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
4f3c     4f3c:	4c 8b 4c 24 18       	mov    0x18(%rsp),%r9
4f41     4f41:	48 8b 34 24          	mov    (%rsp),%rsi
4f45     4f45:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
4f4f     4f4f:	e9 f6 cb ff ff       	jmp    1b4a <s5m8767_pmic_probe+0x1b4a>
4f54     4f54:	89 d9                	mov    %ebx,%ecx
4f56     4f56:	80 e1 07             	and    $0x7,%cl
4f59     4f59:	80 c1 03             	add    $0x3,%cl
4f5c     4f5c:	38 c1                	cmp    %al,%cl
4f5e     4f5e:	0f 8c 12 cc ff ff    	jl     1b76 <s5m8767_pmic_probe+0x1b76>
4f64     4f64:	48 89 df             	mov    %rbx,%rdi
4f67     4f67:	e8 00 00 00 00       	call   4f6c <s5m8767_pmic_probe+0x4f6c>	4f68: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
4f6c     4f6c:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
4f71     4f71:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
4f76     4f76:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
4f7b     4f7b:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
4f80     4f80:	4c 8b 4c 24 18       	mov    0x18(%rsp),%r9
4f85     4f85:	48 8b 34 24          	mov    (%rsp),%rsi
4f89     4f89:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
4f93     4f93:	e9 de cb ff ff       	jmp    1b76 <s5m8767_pmic_probe+0x1b76>
4f98     4f98:	89 d9                	mov    %ebx,%ecx
4f9a     4f9a:	80 e1 07             	and    $0x7,%cl
4f9d     4f9d:	38 c1                	cmp    %al,%cl
4f9f     4f9f:	0f 8c 18 cc ff ff    	jl     1bbd <s5m8767_pmic_probe+0x1bbd>
4fa5     4fa5:	48 89 df             	mov    %rbx,%rdi
4fa8     4fa8:	e8 00 00 00 00       	call   4fad <s5m8767_pmic_probe+0x4fad>	4fa9: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
4fad     4fad:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
4fb2     4fb2:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
4fb7     4fb7:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
4fbc     4fbc:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
4fc1     4fc1:	4c 8b 4c 24 18       	mov    0x18(%rsp),%r9
4fc6     4fc6:	48 8b 34 24          	mov    (%rsp),%rsi
4fca     4fca:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
4fd4     4fd4:	e9 e4 cb ff ff       	jmp    1bbd <s5m8767_pmic_probe+0x1bbd>
4fd9     4fd9:	89 d9                	mov    %ebx,%ecx
4fdb     4fdb:	80 e1 07             	and    $0x7,%cl
4fde     4fde:	80 c1 03             	add    $0x3,%cl
4fe1     4fe1:	38 c1                	cmp    %al,%cl
4fe3     4fe3:	0f 8c 04 cc ff ff    	jl     1bed <s5m8767_pmic_probe+0x1bed>
4fe9     4fe9:	48 89 df             	mov    %rbx,%rdi
4fec     4fec:	e8 00 00 00 00       	call   4ff1 <s5m8767_pmic_probe+0x4ff1>	4fed: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
4ff1     4ff1:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
4ff6     4ff6:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
4ffb     4ffb:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
5000     5000:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
5005     5005:	4c 8b 4c 24 18       	mov    0x18(%rsp),%r9
500a     500a:	48 8b 34 24          	mov    (%rsp),%rsi
500e     500e:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
5018     5018:	e9 d0 cb ff ff       	jmp    1bed <s5m8767_pmic_probe+0x1bed>
501d     501d:	89 d9                	mov    %ebx,%ecx
501f     501f:	80 e1 07             	and    $0x7,%cl
5022     5022:	38 c1                	cmp    %al,%cl
5024     5024:	0f 8c 0a cc ff ff    	jl     1c34 <s5m8767_pmic_probe+0x1c34>
502a     502a:	48 89 df             	mov    %rbx,%rdi
502d     502d:	e8 00 00 00 00       	call   5032 <s5m8767_pmic_probe+0x5032>	502e: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
5032     5032:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
5037     5037:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
503c     503c:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
5041     5041:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
5046     5046:	4c 8b 4c 24 18       	mov    0x18(%rsp),%r9
504b     504b:	48 8b 34 24          	mov    (%rsp),%rsi
504f     504f:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
5059     5059:	e9 d6 cb ff ff       	jmp    1c34 <s5m8767_pmic_probe+0x1c34>
505e     505e:	89 d9                	mov    %ebx,%ecx
5060     5060:	80 e1 07             	and    $0x7,%cl
5063     5063:	80 c1 03             	add    $0x3,%cl
5066     5066:	38 c1                	cmp    %al,%cl
5068     5068:	0f 8c f3 cb ff ff    	jl     1c61 <s5m8767_pmic_probe+0x1c61>
506e     506e:	48 89 df             	mov    %rbx,%rdi
5071     5071:	e8 00 00 00 00       	call   5076 <s5m8767_pmic_probe+0x5076>	5072: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5076     5076:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
507b     507b:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
5080     5080:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
5085     5085:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
508a     508a:	4c 8b 4c 24 18       	mov    0x18(%rsp),%r9
508f     508f:	48 8b 34 24          	mov    (%rsp),%rsi
5093     5093:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
509d     509d:	e9 bf cb ff ff       	jmp    1c61 <s5m8767_pmic_probe+0x1c61>
50a2     50a2:	89 d9                	mov    %ebx,%ecx
50a4     50a4:	80 e1 07             	and    $0x7,%cl
50a7     50a7:	38 c1                	cmp    %al,%cl
50a9     50a9:	0f 8c f9 cb ff ff    	jl     1ca8 <s5m8767_pmic_probe+0x1ca8>
50af     50af:	48 89 df             	mov    %rbx,%rdi
50b2     50b2:	e8 00 00 00 00       	call   50b7 <s5m8767_pmic_probe+0x50b7>	50b3: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
50b7     50b7:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
50bc     50bc:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
50c1     50c1:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
50c6     50c6:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
50cb     50cb:	4c 8b 4c 24 18       	mov    0x18(%rsp),%r9
50d0     50d0:	48 8b 34 24          	mov    (%rsp),%rsi
50d4     50d4:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
50de     50de:	e9 c5 cb ff ff       	jmp    1ca8 <s5m8767_pmic_probe+0x1ca8>
50e3     50e3:	89 d9                	mov    %ebx,%ecx
50e5     50e5:	80 e1 07             	and    $0x7,%cl
50e8     50e8:	80 c1 03             	add    $0x3,%cl
50eb     50eb:	38 c1                	cmp    %al,%cl
50ed     50ed:	0f 8c e1 cb ff ff    	jl     1cd4 <s5m8767_pmic_probe+0x1cd4>
50f3     50f3:	48 89 df             	mov    %rbx,%rdi
50f6     50f6:	e8 00 00 00 00       	call   50fb <s5m8767_pmic_probe+0x50fb>	50f7: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
50fb     50fb:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
5100     5100:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
5105     5105:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
510a     510a:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
510f     510f:	4c 8b 4c 24 18       	mov    0x18(%rsp),%r9
5114     5114:	48 8b 34 24          	mov    (%rsp),%rsi
5118     5118:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
5122     5122:	e9 ad cb ff ff       	jmp    1cd4 <s5m8767_pmic_probe+0x1cd4>
5127     5127:	89 d9                	mov    %ebx,%ecx
5129     5129:	80 e1 07             	and    $0x7,%cl
512c     512c:	38 c1                	cmp    %al,%cl
512e     512e:	0f 8c e7 cb ff ff    	jl     1d1b <s5m8767_pmic_probe+0x1d1b>
5134     5134:	48 89 df             	mov    %rbx,%rdi
5137     5137:	e8 00 00 00 00       	call   513c <s5m8767_pmic_probe+0x513c>	5138: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
513c     513c:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
5141     5141:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
5146     5146:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
514b     514b:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
5150     5150:	4c 8b 4c 24 18       	mov    0x18(%rsp),%r9
5155     5155:	48 8b 34 24          	mov    (%rsp),%rsi
5159     5159:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
5163     5163:	e9 b3 cb ff ff       	jmp    1d1b <s5m8767_pmic_probe+0x1d1b>
5168     5168:	89 d9                	mov    %ebx,%ecx
516a     516a:	80 e1 07             	and    $0x7,%cl
516d     516d:	80 c1 03             	add    $0x3,%cl
5170     5170:	38 c1                	cmp    %al,%cl
5172     5172:	0f 8c d3 cb ff ff    	jl     1d4b <s5m8767_pmic_probe+0x1d4b>
5178     5178:	48 89 df             	mov    %rbx,%rdi
517b     517b:	e8 00 00 00 00       	call   5180 <s5m8767_pmic_probe+0x5180>	517c: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5180     5180:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
5185     5185:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
518a     518a:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
518f     518f:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
5194     5194:	4c 8b 4c 24 18       	mov    0x18(%rsp),%r9
5199     5199:	48 8b 34 24          	mov    (%rsp),%rsi
519d     519d:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
51a7     51a7:	e9 9f cb ff ff       	jmp    1d4b <s5m8767_pmic_probe+0x1d4b>
51ac     51ac:	89 d9                	mov    %ebx,%ecx
51ae     51ae:	80 e1 07             	and    $0x7,%cl
51b1     51b1:	38 c1                	cmp    %al,%cl
51b3     51b3:	0f 8c d9 cb ff ff    	jl     1d92 <s5m8767_pmic_probe+0x1d92>
51b9     51b9:	48 89 df             	mov    %rbx,%rdi
51bc     51bc:	e8 00 00 00 00       	call   51c1 <s5m8767_pmic_probe+0x51c1>	51bd: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
51c1     51c1:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
51c6     51c6:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
51cb     51cb:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
51d0     51d0:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
51d5     51d5:	4c 8b 4c 24 18       	mov    0x18(%rsp),%r9
51da     51da:	48 8b 34 24          	mov    (%rsp),%rsi
51de     51de:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
51e8     51e8:	e9 a5 cb ff ff       	jmp    1d92 <s5m8767_pmic_probe+0x1d92>
51ed     51ed:	89 d9                	mov    %ebx,%ecx
51ef     51ef:	80 e1 07             	and    $0x7,%cl
51f2     51f2:	80 c1 03             	add    $0x3,%cl
51f5     51f5:	38 c1                	cmp    %al,%cl
51f7     51f7:	0f 8c c2 cb ff ff    	jl     1dbf <s5m8767_pmic_probe+0x1dbf>
51fd     51fd:	48 89 df             	mov    %rbx,%rdi
5200     5200:	e8 00 00 00 00       	call   5205 <s5m8767_pmic_probe+0x5205>	5201: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5205     5205:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
520a     520a:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
520f     520f:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
5214     5214:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
5219     5219:	4c 8b 4c 24 18       	mov    0x18(%rsp),%r9
521e     521e:	48 8b 34 24          	mov    (%rsp),%rsi
5222     5222:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
522c     522c:	e9 8e cb ff ff       	jmp    1dbf <s5m8767_pmic_probe+0x1dbf>
5231     5231:	89 d9                	mov    %ebx,%ecx
5233     5233:	80 e1 07             	and    $0x7,%cl
5236     5236:	38 c1                	cmp    %al,%cl
5238     5238:	0f 8c c8 cb ff ff    	jl     1e06 <s5m8767_pmic_probe+0x1e06>
523e     523e:	48 89 df             	mov    %rbx,%rdi
5241     5241:	e8 00 00 00 00       	call   5246 <s5m8767_pmic_probe+0x5246>	5242: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
5246     5246:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
524b     524b:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
5250     5250:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
5255     5255:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
525a     525a:	4c 8b 4c 24 18       	mov    0x18(%rsp),%r9
525f     525f:	48 8b 34 24          	mov    (%rsp),%rsi
5263     5263:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
526d     526d:	e9 94 cb ff ff       	jmp    1e06 <s5m8767_pmic_probe+0x1e06>
5272     5272:	89 d9                	mov    %ebx,%ecx
5274     5274:	80 e1 07             	and    $0x7,%cl
5277     5277:	80 c1 03             	add    $0x3,%cl
527a     527a:	38 c1                	cmp    %al,%cl
527c     527c:	0f 8c b0 cb ff ff    	jl     1e32 <s5m8767_pmic_probe+0x1e32>
5282     5282:	48 89 df             	mov    %rbx,%rdi
5285     5285:	e8 00 00 00 00       	call   528a <s5m8767_pmic_probe+0x528a>	5286: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
528a     528a:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
528f     528f:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
5294     5294:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
5299     5299:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
529e     529e:	4c 8b 4c 24 18       	mov    0x18(%rsp),%r9
52a3     52a3:	48 8b 34 24          	mov    (%rsp),%rsi
52a7     52a7:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
52b1     52b1:	e9 7c cb ff ff       	jmp    1e32 <s5m8767_pmic_probe+0x1e32>
52b6     52b6:	89 d9                	mov    %ebx,%ecx
52b8     52b8:	80 e1 07             	and    $0x7,%cl
52bb     52bb:	38 c1                	cmp    %al,%cl
52bd     52bd:	0f 8c b6 cb ff ff    	jl     1e79 <s5m8767_pmic_probe+0x1e79>
52c3     52c3:	48 89 df             	mov    %rbx,%rdi
52c6     52c6:	e8 00 00 00 00       	call   52cb <s5m8767_pmic_probe+0x52cb>	52c7: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
52cb     52cb:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
52d0     52d0:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
52d5     52d5:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
52da     52da:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
52df     52df:	4c 8b 4c 24 18       	mov    0x18(%rsp),%r9
52e4     52e4:	48 8b 34 24          	mov    (%rsp),%rsi
52e8     52e8:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
52f2     52f2:	e9 82 cb ff ff       	jmp    1e79 <s5m8767_pmic_probe+0x1e79>
52f7     52f7:	89 d9                	mov    %ebx,%ecx
52f9     52f9:	80 e1 07             	and    $0x7,%cl
52fc     52fc:	80 c1 03             	add    $0x3,%cl
52ff     52ff:	38 c1                	cmp    %al,%cl
5301     5301:	0f 8c a2 cb ff ff    	jl     1ea9 <s5m8767_pmic_probe+0x1ea9>
5307     5307:	48 89 df             	mov    %rbx,%rdi
530a     530a:	e8 00 00 00 00       	call   530f <s5m8767_pmic_probe+0x530f>	530b: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
530f     530f:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
5314     5314:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
5319     5319:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
531e     531e:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
5323     5323:	4c 8b 4c 24 18       	mov    0x18(%rsp),%r9
5328     5328:	48 8b 34 24          	mov    (%rsp),%rsi
532c     532c:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
5336     5336:	e9 6e cb ff ff       	jmp    1ea9 <s5m8767_pmic_probe+0x1ea9>
533b     533b:	89 d9                	mov    %ebx,%ecx
533d     533d:	80 e1 07             	and    $0x7,%cl
5340     5340:	38 c1                	cmp    %al,%cl
5342     5342:	0f 8c a8 cb ff ff    	jl     1ef0 <s5m8767_pmic_probe+0x1ef0>
5348     5348:	48 89 df             	mov    %rbx,%rdi
534b     534b:	e8 00 00 00 00       	call   5350 <s5m8767_pmic_probe+0x5350>	534c: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
5350     5350:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
5355     5355:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
535a     535a:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
535f     535f:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
5364     5364:	4c 8b 4c 24 18       	mov    0x18(%rsp),%r9
5369     5369:	48 8b 34 24          	mov    (%rsp),%rsi
536d     536d:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
5377     5377:	e9 74 cb ff ff       	jmp    1ef0 <s5m8767_pmic_probe+0x1ef0>
537c     537c:	89 d9                	mov    %ebx,%ecx
537e     537e:	80 e1 07             	and    $0x7,%cl
5381     5381:	80 c1 03             	add    $0x3,%cl
5384     5384:	38 c1                	cmp    %al,%cl
5386     5386:	0f 8c 91 cb ff ff    	jl     1f1d <s5m8767_pmic_probe+0x1f1d>
538c     538c:	48 89 df             	mov    %rbx,%rdi
538f     538f:	e8 00 00 00 00       	call   5394 <s5m8767_pmic_probe+0x5394>	5390: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5394     5394:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
5399     5399:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
539e     539e:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
53a3     53a3:	48 8b 34 24          	mov    (%rsp),%rsi
53a7     53a7:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
53b1     53b1:	e9 67 cb ff ff       	jmp    1f1d <s5m8767_pmic_probe+0x1f1d>
53b6     53b6:	89 d9                	mov    %ebx,%ecx
53b8     53b8:	80 e1 07             	and    $0x7,%cl
53bb     53bb:	38 c1                	cmp    %al,%cl
53bd     53bd:	0f 8c a1 cb ff ff    	jl     1f64 <s5m8767_pmic_probe+0x1f64>
53c3     53c3:	48 89 df             	mov    %rbx,%rdi
53c6     53c6:	e8 00 00 00 00       	call   53cb <s5m8767_pmic_probe+0x53cb>	53c7: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
53cb     53cb:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
53d0     53d0:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
53d5     53d5:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
53da     53da:	48 8b 34 24          	mov    (%rsp),%rsi
53de     53de:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
53e8     53e8:	e9 77 cb ff ff       	jmp    1f64 <s5m8767_pmic_probe+0x1f64>
53ed     53ed:	89 d9                	mov    %ebx,%ecx
53ef     53ef:	80 e1 07             	and    $0x7,%cl
53f2     53f2:	80 c1 03             	add    $0x3,%cl
53f5     53f5:	38 c1                	cmp    %al,%cl
53f7     53f7:	0f 8c 98 cb ff ff    	jl     1f95 <s5m8767_pmic_probe+0x1f95>
53fd     53fd:	48 89 df             	mov    %rbx,%rdi
5400     5400:	e8 00 00 00 00       	call   5405 <s5m8767_pmic_probe+0x5405>	5401: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5405     5405:	48 8b 7c 24 50       	mov    0x50(%rsp),%rdi
540a     540a:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
540f     540f:	48 8b 34 24          	mov    (%rsp),%rsi
5413     5413:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
541d     541d:	e9 73 cb ff ff       	jmp    1f95 <s5m8767_pmic_probe+0x1f95>
5422     5422:	89 d9                	mov    %ebx,%ecx
5424     5424:	80 e1 07             	and    $0x7,%cl
5427     5427:	38 c1                	cmp    %al,%cl
5429     5429:	0f 8c ad cb ff ff    	jl     1fdc <s5m8767_pmic_probe+0x1fdc>
542f     542f:	48 89 df             	mov    %rbx,%rdi
5432     5432:	e8 00 00 00 00       	call   5437 <s5m8767_pmic_probe+0x5437>	5433: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
5437     5437:	48 8b 7c 24 50       	mov    0x50(%rsp),%rdi
543c     543c:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
5441     5441:	48 8b 34 24          	mov    (%rsp),%rsi
5445     5445:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
544f     544f:	e9 88 cb ff ff       	jmp    1fdc <s5m8767_pmic_probe+0x1fdc>
5454     5454:	89 d9                	mov    %ebx,%ecx
5456     5456:	80 e1 07             	and    $0x7,%cl
5459     5459:	80 c1 03             	add    $0x3,%cl
545c     545c:	38 c1                	cmp    %al,%cl
545e     545e:	0f 8c a8 cb ff ff    	jl     200c <s5m8767_pmic_probe+0x200c>
5464     5464:	48 89 df             	mov    %rbx,%rdi
5467     5467:	e8 00 00 00 00       	call   546c <s5m8767_pmic_probe+0x546c>	5468: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
546c     546c:	48 8b 7c 24 50       	mov    0x50(%rsp),%rdi
5471     5471:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
547b     547b:	e9 8c cb ff ff       	jmp    200c <s5m8767_pmic_probe+0x200c>
5480     5480:	89 d9                	mov    %ebx,%ecx
5482     5482:	80 e1 07             	and    $0x7,%cl
5485     5485:	38 c1                	cmp    %al,%cl
5487     5487:	0f 8c c6 cb ff ff    	jl     2053 <s5m8767_pmic_probe+0x2053>
548d     548d:	48 89 df             	mov    %rbx,%rdi
5490     5490:	e8 00 00 00 00       	call   5495 <s5m8767_pmic_probe+0x5495>	5491: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
5495     5495:	48 8b 7c 24 50       	mov    0x50(%rsp),%rdi
549a     549a:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
54a4     54a4:	e9 aa cb ff ff       	jmp    2053 <s5m8767_pmic_probe+0x2053>
54a9     54a9:	89 d9                	mov    %ebx,%ecx
54ab     54ab:	80 e1 07             	and    $0x7,%cl
54ae     54ae:	38 c1                	cmp    %al,%cl
54b0     54b0:	0f 8c 5c b4 ff ff    	jl     912 <s5m8767_pmic_probe+0x912>
54b6     54b6:	48 89 df             	mov    %rbx,%rdi
54b9     54b9:	e8 00 00 00 00       	call   54be <s5m8767_pmic_probe+0x54be>	54ba: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
54be     54be:	48 8b 34 24          	mov    (%rsp),%rsi
54c2     54c2:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
54cc     54cc:	e9 41 b4 ff ff       	jmp    912 <s5m8767_pmic_probe+0x912>
54d1     54d1:	89 da                	mov    %ebx,%edx
54d3     54d3:	80 e2 07             	and    $0x7,%dl
54d6     54d6:	80 c2 03             	add    $0x3,%dl
54d9     54d9:	38 ca                	cmp    %cl,%dl
54db     54db:	0f 8c ba b4 ff ff    	jl     99b <s5m8767_pmic_probe+0x99b>
54e1     54e1:	48 89 df             	mov    %rbx,%rdi
54e4     54e4:	89 c5                	mov    %eax,%ebp
54e6     54e6:	e8 00 00 00 00       	call   54eb <s5m8767_pmic_probe+0x54eb>	54e7: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
54eb     54eb:	89 e8                	mov    %ebp,%eax
54ed     54ed:	e9 a9 b4 ff ff       	jmp    99b <s5m8767_pmic_probe+0x99b>
54f2     54f2:	89 da                	mov    %ebx,%edx
54f4     54f4:	80 e2 07             	and    $0x7,%dl
54f7     54f7:	80 c2 03             	add    $0x3,%dl
54fa     54fa:	38 ca                	cmp    %cl,%dl
54fc     54fc:	0f 8c e1 b4 ff ff    	jl     9e3 <s5m8767_pmic_probe+0x9e3>
5502     5502:	48 89 df             	mov    %rbx,%rdi
5505     5505:	89 c5                	mov    %eax,%ebp
5507     5507:	e8 00 00 00 00       	call   550c <s5m8767_pmic_probe+0x550c>	5508: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
550c     550c:	89 e8                	mov    %ebp,%eax
550e     550e:	e9 d0 b4 ff ff       	jmp    9e3 <s5m8767_pmic_probe+0x9e3>
5513     5513:	89 da                	mov    %ebx,%edx
5515     5515:	80 e2 07             	and    $0x7,%dl
5518     5518:	80 c2 03             	add    $0x3,%dl
551b     551b:	38 ca                	cmp    %cl,%dl
551d     551d:	0f 8c 51 b6 ff ff    	jl     b74 <s5m8767_pmic_probe+0xb74>
5523     5523:	48 89 df             	mov    %rbx,%rdi
5526     5526:	89 c5                	mov    %eax,%ebp
5528     5528:	e8 00 00 00 00       	call   552d <s5m8767_pmic_probe+0x552d>	5529: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
552d     552d:	89 e8                	mov    %ebp,%eax
552f     552f:	e9 40 b6 ff ff       	jmp    b74 <s5m8767_pmic_probe+0xb74>
5534     5534:	89 fa                	mov    %edi,%edx
5536     5536:	80 e2 07             	and    $0x7,%dl
5539     5539:	80 c2 03             	add    $0x3,%dl
553c     553c:	38 ca                	cmp    %cl,%dl
553e     553e:	0f 8c ed b4 ff ff    	jl     a31 <s5m8767_pmic_probe+0xa31>
5544     5544:	89 c3                	mov    %eax,%ebx
5546     5546:	e8 00 00 00 00       	call   554b <s5m8767_pmic_probe+0x554b>	5547: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
554b     554b:	48 8b 34 24          	mov    (%rsp),%rsi
554f     554f:	89 d8                	mov    %ebx,%eax
5551     5551:	e9 db b4 ff ff       	jmp    a31 <s5m8767_pmic_probe+0xa31>
5556     5556:	44 89 f9             	mov    %r15d,%ecx
5559     5559:	80 e1 07             	and    $0x7,%cl
555c     555c:	38 c1                	cmp    %al,%cl
555e     555e:	0f 8c ba b8 ff ff    	jl     e1e <s5m8767_pmic_probe+0xe1e>
5564     5564:	4c 89 ff             	mov    %r15,%rdi
5567     5567:	e8 00 00 00 00       	call   556c <s5m8767_pmic_probe+0x556c>	5568: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
556c     556c:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
5576     5576:	e9 a3 b8 ff ff       	jmp    e1e <s5m8767_pmic_probe+0xe1e>
557b     557b:	89 da                	mov    %ebx,%edx
557d     557d:	80 e2 07             	and    $0x7,%dl
5580     5580:	80 c2 03             	add    $0x3,%dl
5583     5583:	38 ca                	cmp    %cl,%dl
5585     5585:	0f 8c 31 b6 ff ff    	jl     bbc <s5m8767_pmic_probe+0xbbc>
558b     558b:	48 89 df             	mov    %rbx,%rdi
558e     558e:	89 c5                	mov    %eax,%ebp
5590     5590:	e8 00 00 00 00       	call   5595 <s5m8767_pmic_probe+0x5595>	5591: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
5595     5595:	89 e8                	mov    %ebp,%eax
5597     5597:	e9 20 b6 ff ff       	jmp    bbc <s5m8767_pmic_probe+0xbbc>
559c     559c:	4c 89 fb             	mov    %r15,%rbx
559f     559f:	44 89 f9             	mov    %r15d,%ecx
55a2     55a2:	80 e1 07             	and    $0x7,%cl
55a5     55a5:	38 c1                	cmp    %al,%cl
55a7     55a7:	7c 08                	jl     55b1 <s5m8767_pmic_probe+0x55b1>
55a9     55a9:	48 89 df             	mov    %rbx,%rdi
55ac     55ac:	e8 00 00 00 00       	call   55b1 <s5m8767_pmic_probe+0x55b1>	55ad: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
55b1     55b1:	49 89 df             	mov    %rbx,%r15
55b4     55b4:	80 3b 00             	cmpb   $0x0,(%rbx)
55b7     55b7:	4c 8b 74 24 60       	mov    0x60(%rsp),%r14
55bc     55bc:	0f 84 72 b8 ff ff    	je     e34 <s5m8767_pmic_probe+0xe34>
55c2     55c2:	48 8b 7c 24 68       	mov    0x68(%rsp),%rdi
55c7     55c7:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	55ca: R_X86_64_32S	.rodata..str.2.101061
55ce     55ce:	e8 00 00 00 00       	call   55d3 <s5m8767_pmic_probe+0x55d3>	55cf: R_X86_64_PLT32	_dev_err-0x4
55d3     55d3:	b8 ea ff ff ff       	mov    $0xffffffea,%eax
55d8     55d8:	48 81 c4 90 01 00 00 	add    $0x190,%rsp
55df     55df:	5b                   	pop    %rbx
55e0     55e0:	41 5c                	pop    %r12
55e2     55e2:	41 5d                	pop    %r13
55e4     55e4:	41 5e                	pop    %r14
55e6     55e6:	41 5f                	pop    %r15
55e8     55e8:	5d                   	pop    %rbp
55e9     55e9:	c3                   	ret
55ea     55ea:	89 fa                	mov    %edi,%edx
55ec     55ec:	80 e2 07             	and    $0x7,%dl
55ef     55ef:	80 c2 03             	add    $0x3,%dl
55f2     55f2:	38 ca                	cmp    %cl,%dl
55f4     55f4:	0f 8c 0b b6 ff ff    	jl     c05 <s5m8767_pmic_probe+0xc05>
55fa     55fa:	89 c3                	mov    %eax,%ebx
55fc     55fc:	e8 00 00 00 00       	call   5601 <s5m8767_pmic_probe+0x5601>	55fd: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
5601     5601:	48 8b 34 24          	mov    (%rsp),%rsi
5605     5605:	89 d8                	mov    %ebx,%eax
5607     5607:	e9 f9 b5 ff ff       	jmp    c05 <s5m8767_pmic_probe+0xc05>
560c     560c:	89 d9                	mov    %ebx,%ecx
560e     560e:	80 e1 07             	and    $0x7,%cl
5611     5611:	38 c1                	cmp    %al,%cl
5613     5613:	0f 8c 2b b6 ff ff    	jl     c44 <s5m8767_pmic_probe+0xc44>
5619     5619:	48 89 df             	mov    %rbx,%rdi
561c     561c:	e8 00 00 00 00       	call   5621 <s5m8767_pmic_probe+0x5621>	561d: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
5621     5621:	48 8b 14 24          	mov    (%rsp),%rdx
5625     5625:	e9 1a b6 ff ff       	jmp    c44 <s5m8767_pmic_probe+0xc44>
562a     562a:	48 8b 4c 24 40       	mov    0x40(%rsp),%rcx
562f     562f:	80 e1 07             	and    $0x7,%cl
5632     5632:	38 c1                	cmp    %al,%cl
5634     5634:	0f 8c 4e b6 ff ff    	jl     c88 <s5m8767_pmic_probe+0xc88>
563a     563a:	48 8b 7c 24 40       	mov    0x40(%rsp),%rdi
563f     563f:	e8 00 00 00 00       	call   5644 <s5m8767_pmic_probe+0x5644>	5640: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
5644     5644:	48 8b 14 24          	mov    (%rsp),%rdx
5648     5648:	e9 3b b6 ff ff       	jmp    c88 <s5m8767_pmic_probe+0xc88>
564d     564d:	44 89 fa             	mov    %r15d,%edx
5650     5650:	80 e2 07             	and    $0x7,%dl
5653     5653:	38 ca                	cmp    %cl,%dl
5655     5655:	0f 8c 6d b6 ff ff    	jl     cc8 <s5m8767_pmic_probe+0xcc8>
565b     565b:	4c 89 ff             	mov    %r15,%rdi
565e     565e:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
5663     5663:	e8 00 00 00 00       	call   5668 <s5m8767_pmic_probe+0x5668>	5664: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
5668     5668:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
5672     5672:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
5677     5677:	e9 4c b6 ff ff       	jmp    cc8 <s5m8767_pmic_probe+0xcc8>
567c     567c:	89 da                	mov    %ebx,%edx
567e     567e:	80 e2 07             	and    $0x7,%dl
5681     5681:	38 ca                	cmp    %cl,%dl
5683     5683:	0f 8c 4f b6 ff ff    	jl     cd8 <s5m8767_pmic_probe+0xcd8>
5689     5689:	48 89 df             	mov    %rbx,%rdi
568c     568c:	49 89 c7             	mov    %rax,%r15
568f     568f:	e8 00 00 00 00       	call   5694 <s5m8767_pmic_probe+0x5694>	5690: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
5694     5694:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
569e     569e:	4c 89 f8             	mov    %r15,%rax
56a1     56a1:	e9 32 b6 ff ff       	jmp    cd8 <s5m8767_pmic_probe+0xcd8>
56a6     56a6:	89 f9                	mov    %edi,%ecx
56a8     56a8:	80 e1 07             	and    $0x7,%cl
56ab     56ab:	38 c1                	cmp    %al,%cl
56ad     56ad:	0f 8c 47 b1 ff ff    	jl     7fa <s5m8767_pmic_probe+0x7fa>
56b3     56b3:	e8 00 00 00 00       	call   56b8 <s5m8767_pmic_probe+0x56b8>	56b4: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
56b8     56b8:	48 8b 14 24          	mov    (%rsp),%rdx
56bc     56bc:	e9 39 b1 ff ff       	jmp    7fa <s5m8767_pmic_probe+0x7fa>
56c1     56c1:	89 f9                	mov    %edi,%ecx
56c3     56c3:	80 e1 07             	and    $0x7,%cl
56c6     56c6:	38 c1                	cmp    %al,%cl
56c8     56c8:	0f 8c 8e b1 ff ff    	jl     85c <s5m8767_pmic_probe+0x85c>
56ce     56ce:	e8 00 00 00 00       	call   56d3 <s5m8767_pmic_probe+0x56d3>	56cf: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
56d3     56d3:	48 8b 14 24          	mov    (%rsp),%rdx
56d7     56d7:	e9 80 b1 ff ff       	jmp    85c <s5m8767_pmic_probe+0x85c>
56dc     56dc:	89 f9                	mov    %edi,%ecx
56de     56de:	80 e1 07             	and    $0x7,%cl
56e1     56e1:	38 c1                	cmp    %al,%cl
56e3     56e3:	0f 8c d8 b1 ff ff    	jl     8c1 <s5m8767_pmic_probe+0x8c1>
56e9     56e9:	e8 00 00 00 00       	call   56ee <s5m8767_pmic_probe+0x56ee>	56ea: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
56ee     56ee:	4c 8b 34 24          	mov    (%rsp),%r14
56f2     56f2:	e9 ca b1 ff ff       	jmp    8c1 <s5m8767_pmic_probe+0x8c1>
56f7     56f7:	48 8b 4c 24 70       	mov    0x70(%rsp),%rcx
56fc     56fc:	80 e1 07             	and    $0x7,%cl
56ff     56ff:	38 c1                	cmp    %al,%cl
5701     5701:	0f 8c 7c c9 ff ff    	jl     2083 <s5m8767_pmic_probe+0x2083>
5707     5707:	48 8b 7c 24 70       	mov    0x70(%rsp),%rdi
570c     570c:	e8 00 00 00 00       	call   5711 <s5m8767_pmic_probe+0x5711>	570d: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
5711     5711:	48 8b 7c 24 50       	mov    0x50(%rsp),%rdi
5716     5716:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
5720     5720:	e9 5e c9 ff ff       	jmp    2083 <s5m8767_pmic_probe+0x2083>
5725     5725:	48 8b 4c 24 78       	mov    0x78(%rsp),%rcx
572a     572a:	80 e1 07             	and    $0x7,%cl
572d     572d:	80 c1 03             	add    $0x3,%cl
5730     5730:	38 c1                	cmp    %al,%cl
5732     5732:	0f 8c 16 ca ff ff    	jl     214e <s5m8767_pmic_probe+0x214e>
5738     5738:	48 8b 7c 24 78       	mov    0x78(%rsp),%rdi
573d     573d:	e8 00 00 00 00       	call   5742 <s5m8767_pmic_probe+0x5742>	573e: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5742     5742:	e9 07 ca ff ff       	jmp    214e <s5m8767_pmic_probe+0x214e>
5747     5747:	89 d8                	mov    %ebx,%eax
5749     5749:	24 07                	and    $0x7,%al
574b     574b:	04 03                	add    $0x3,%al
574d     574d:	38 c8                	cmp    %cl,%al
574f     574f:	0f 8c 1e b3 ff ff    	jl     a73 <s5m8767_pmic_probe+0xa73>
5755     5755:	48 89 df             	mov    %rbx,%rdi
5758     5758:	e8 00 00 00 00       	call   575d <s5m8767_pmic_probe+0x575d>	5759: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
575d     575d:	49 bf 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r15
5767     5767:	e9 07 b3 ff ff       	jmp    a73 <s5m8767_pmic_probe+0xa73>
576c     576c:	89 d9                	mov    %ebx,%ecx
576e     576e:	80 e1 07             	and    $0x7,%cl
5771     5771:	38 c1                	cmp    %al,%cl
5773     5773:	0f 8c b5 b1 ff ff    	jl     92e <s5m8767_pmic_probe+0x92e>
5779     5779:	48 89 df             	mov    %rbx,%rdi
577c     577c:	e8 00 00 00 00       	call   5781 <s5m8767_pmic_probe+0x5781>	577d: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
5781     5781:	48 8b 34 24          	mov    (%rsp),%rsi
5785     5785:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
578f     578f:	e9 9a b1 ff ff       	jmp    92e <s5m8767_pmic_probe+0x92e>
5794     5794:	89 d8                	mov    %ebx,%eax
5796     5796:	24 07                	and    $0x7,%al
5798     5798:	04 03                	add    $0x3,%al
579a     579a:	38 c8                	cmp    %cl,%al
579c     579c:	0f 8c 87 b3 ff ff    	jl     b29 <s5m8767_pmic_probe+0xb29>
57a2     57a2:	48 89 df             	mov    %rbx,%rdi
57a5     57a5:	e8 00 00 00 00       	call   57aa <s5m8767_pmic_probe+0x57aa>	57a6: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
57aa     57aa:	e9 7a b3 ff ff       	jmp    b29 <s5m8767_pmic_probe+0xb29>
57af     57af:	48 8b 54 24 40       	mov    0x40(%rsp),%rdx
57b4     57b4:	80 e2 07             	and    $0x7,%dl
57b7     57b7:	38 ca                	cmp    %cl,%dl
57b9     57b9:	0f 8c 7c b5 ff ff    	jl     d3b <s5m8767_pmic_probe+0xd3b>
57bf     57bf:	49 89 fe             	mov    %rdi,%r14
57c2     57c2:	48 8b 7c 24 40       	mov    0x40(%rsp),%rdi
57c7     57c7:	48 89 c3             	mov    %rax,%rbx
57ca     57ca:	e8 00 00 00 00       	call   57cf <s5m8767_pmic_probe+0x57cf>	57cb: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
57cf     57cf:	4c 89 f7             	mov    %r14,%rdi
57d2     57d2:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
57dc     57dc:	48 89 d8             	mov    %rbx,%rax
57df     57df:	e9 57 b5 ff ff       	jmp    d3b <s5m8767_pmic_probe+0xd3b>
57e4     57e4:	48 8b 8c 24 90 00 00 00 	mov    0x90(%rsp),%rcx
57ec     57ec:	80 e1 07             	and    $0x7,%cl
57ef     57ef:	38 c1                	cmp    %al,%cl
57f1     57f1:	0f 8c aa c8 ff ff    	jl     20a1 <s5m8767_pmic_probe+0x20a1>
57f7     57f7:	48 8b bc 24 90 00 00 00 	mov    0x90(%rsp),%rdi
57ff     57ff:	e8 00 00 00 00       	call   5804 <s5m8767_pmic_probe+0x5804>	5800: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
5804     5804:	48 8b 7c 24 50       	mov    0x50(%rsp),%rdi
5809     5809:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
5813     5813:	e9 89 c8 ff ff       	jmp    20a1 <s5m8767_pmic_probe+0x20a1>
5818     5818:	89 d9                	mov    %ebx,%ecx
581a     581a:	80 e1 07             	and    $0x7,%cl
581d     581d:	80 c1 03             	add    $0x3,%cl
5820     5820:	38 c1                	cmp    %al,%cl
5822     5822:	0f 8c fd b4 ff ff    	jl     d25 <s5m8767_pmic_probe+0xd25>
5828     5828:	48 89 df             	mov    %rbx,%rdi
582b     582b:	e8 00 00 00 00       	call   5830 <s5m8767_pmic_probe+0x5830>	582c: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
5830     5830:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
583a     583a:	e9 e6 b4 ff ff       	jmp    d25 <s5m8767_pmic_probe+0xd25>
583f     583f:	89 d9                	mov    %ebx,%ecx
5841     5841:	80 e1 07             	and    $0x7,%cl
5844     5844:	80 c1 03             	add    $0x3,%cl
5847     5847:	38 c1                	cmp    %al,%cl
5849     5849:	0f 8c 3d c9 ff ff    	jl     218c <s5m8767_pmic_probe+0x218c>
584f     584f:	48 89 df             	mov    %rbx,%rdi
5852     5852:	e8 00 00 00 00       	call   5857 <s5m8767_pmic_probe+0x5857>	5853: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5857     5857:	e9 30 c9 ff ff       	jmp    218c <s5m8767_pmic_probe+0x218c>
585c     585c:	89 f9                	mov    %edi,%ecx
585e     585e:	80 e1 07             	and    $0x7,%cl
5861     5861:	80 c1 03             	add    $0x3,%cl
5864     5864:	38 c1                	cmp    %al,%cl
5866     5866:	0f 8c 51 ca ff ff    	jl     22bd <s5m8767_pmic_probe+0x22bd>
586c     586c:	48 8b 7c 24 50       	mov    0x50(%rsp),%rdi
5871     5871:	e8 00 00 00 00       	call   5876 <s5m8767_pmic_probe+0x5876>	5872: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5876     5876:	48 8b 7c 24 50       	mov    0x50(%rsp),%rdi
587b     587b:	e9 3d ca ff ff       	jmp    22bd <s5m8767_pmic_probe+0x22bd>
5880     5880:	89 d9                	mov    %ebx,%ecx
5882     5882:	80 e1 07             	and    $0x7,%cl
5885     5885:	38 c1                	cmp    %al,%cl
5887     5887:	0f 8c c0 b0 ff ff    	jl     94d <s5m8767_pmic_probe+0x94d>
588d     588d:	48 89 df             	mov    %rbx,%rdi
5890     5890:	e8 00 00 00 00       	call   5895 <s5m8767_pmic_probe+0x5895>	5891: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
5895     5895:	e9 b3 b0 ff ff       	jmp    94d <s5m8767_pmic_probe+0x94d>
589a     589a:	48 8b 8c 24 88 00 00 00 	mov    0x88(%rsp),%rcx
58a2     58a2:	80 e1 07             	and    $0x7,%cl
58a5     58a5:	80 c1 03             	add    $0x3,%cl
58a8     58a8:	38 c1                	cmp    %al,%cl
58aa     58aa:	0f 8c 16 c9 ff ff    	jl     21c6 <s5m8767_pmic_probe+0x21c6>
58b0     58b0:	48 8b bc 24 88 00 00 00 	mov    0x88(%rsp),%rdi
58b8     58b8:	e8 00 00 00 00       	call   58bd <s5m8767_pmic_probe+0x58bd>	58b9: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
58bd     58bd:	49 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r14
58c7     58c7:	e9 fa c8 ff ff       	jmp    21c6 <s5m8767_pmic_probe+0x21c6>
58cc     58cc:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
58d1     58d1:	80 e1 07             	and    $0x7,%cl
58d4     58d4:	80 c1 03             	add    $0x3,%cl
58d7     58d7:	38 c1                	cmp    %al,%cl
58d9     58d9:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
58de     58de:	0f 8c 06 c9 ff ff    	jl     21ea <s5m8767_pmic_probe+0x21ea>
58e4     58e4:	89 fb                	mov    %edi,%ebx
58e6     58e6:	48 89 cf             	mov    %rcx,%rdi
58e9     58e9:	e8 00 00 00 00       	call   58ee <s5m8767_pmic_probe+0x58ee>	58ea: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
58ee     58ee:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
58f3     58f3:	89 df                	mov    %ebx,%edi
58f5     58f5:	e9 f0 c8 ff ff       	jmp    21ea <s5m8767_pmic_probe+0x21ea>
58fa     58fa:	48 8b 4c 24 78       	mov    0x78(%rsp),%rcx
58ff     58ff:	80 e1 07             	and    $0x7,%cl
5902     5902:	80 c1 03             	add    $0x3,%cl
5905     5905:	38 c1                	cmp    %al,%cl
5907     5907:	0f 8c 09 c9 ff ff    	jl     2216 <s5m8767_pmic_probe+0x2216>
590d     590d:	48 8b 7c 24 78       	mov    0x78(%rsp),%rdi
5912     5912:	e8 00 00 00 00       	call   5917 <s5m8767_pmic_probe+0x5917>	5913: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5917     5917:	49 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r14
5921     5921:	e9 f0 c8 ff ff       	jmp    2216 <s5m8767_pmic_probe+0x2216>
5926     5926:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
592b     592b:	80 e1 07             	and    $0x7,%cl
592e     592e:	80 c1 03             	add    $0x3,%cl
5931     5931:	38 c1                	cmp    %al,%cl
5933     5933:	0f 8c f9 c8 ff ff    	jl     2232 <s5m8767_pmic_probe+0x2232>
5939     5939:	89 fb                	mov    %edi,%ebx
593b     593b:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
5940     5940:	e8 00 00 00 00       	call   5945 <s5m8767_pmic_probe+0x5945>	5941: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5945     5945:	89 df                	mov    %ebx,%edi
5947     5947:	e9 e6 c8 ff ff       	jmp    2232 <s5m8767_pmic_probe+0x2232>
594c     594c:	48 8b 8c 24 b0 00 00 00 	mov    0xb0(%rsp),%rcx
5954     5954:	80 e1 07             	and    $0x7,%cl
5957     5957:	80 c1 03             	add    $0x3,%cl
595a     595a:	38 c1                	cmp    %al,%cl
595c     595c:	0f 8c 00 c9 ff ff    	jl     2262 <s5m8767_pmic_probe+0x2262>
5962     5962:	48 8b bc 24 b0 00 00 00 	mov    0xb0(%rsp),%rdi
596a     596a:	e8 00 00 00 00       	call   596f <s5m8767_pmic_probe+0x596f>	596b: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
596f     596f:	49 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r14
5979     5979:	e9 e4 c8 ff ff       	jmp    2262 <s5m8767_pmic_probe+0x2262>
597e     597e:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
5983     5983:	80 e1 07             	and    $0x7,%cl
5986     5986:	80 c1 03             	add    $0x3,%cl
5989     5989:	38 c1                	cmp    %al,%cl
598b     598b:	0f 8c f0 c8 ff ff    	jl     2281 <s5m8767_pmic_probe+0x2281>
5991     5991:	89 fb                	mov    %edi,%ebx
5993     5993:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
5998     5998:	e8 00 00 00 00       	call   599d <s5m8767_pmic_probe+0x599d>	5999: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
599d     599d:	89 df                	mov    %ebx,%edi
599f     599f:	e9 dd c8 ff ff       	jmp    2281 <s5m8767_pmic_probe+0x2281>
59a4     59a4:	48 8b 8c 24 00 01 00 00 	mov    0x100(%rsp),%rcx
59ac     59ac:	80 e1 07             	and    $0x7,%cl
59af     59af:	80 c1 03             	add    $0x3,%cl
59b2     59b2:	38 c1                	cmp    %al,%cl
59b4     59b4:	0f 8c 3c c9 ff ff    	jl     22f6 <s5m8767_pmic_probe+0x22f6>
59ba     59ba:	48 8b bc 24 00 01 00 00 	mov    0x100(%rsp),%rdi
59c2     59c2:	e8 00 00 00 00       	call   59c7 <s5m8767_pmic_probe+0x59c7>	59c3: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
59c7     59c7:	e9 2a c9 ff ff       	jmp    22f6 <s5m8767_pmic_probe+0x22f6>
59cc     59cc:	89 d9                	mov    %ebx,%ecx
59ce     59ce:	80 e1 07             	and    $0x7,%cl
59d1     59d1:	80 c1 03             	add    $0x3,%cl
59d4     59d4:	38 c1                	cmp    %al,%cl
59d6     59d6:	0f 8c ad b0 ff ff    	jl     a89 <s5m8767_pmic_probe+0xa89>
59dc     59dc:	48 89 df             	mov    %rbx,%rdi
59df     59df:	e8 00 00 00 00       	call   59e4 <s5m8767_pmic_probe+0x59e4>	59e0: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
59e4     59e4:	49 bf 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r15
59ee     59ee:	e9 96 b0 ff ff       	jmp    a89 <s5m8767_pmic_probe+0xa89>
59f3     59f3:	48 8b 8c 24 c0 00 00 00 	mov    0xc0(%rsp),%rcx
59fb     59fb:	80 e1 07             	and    $0x7,%cl
59fe     59fe:	80 c1 03             	add    $0x3,%cl
5a01     5a01:	38 c1                	cmp    %al,%cl
5a03     5a03:	0f 8c 2e c9 ff ff    	jl     2337 <s5m8767_pmic_probe+0x2337>
5a09     5a09:	48 8b bc 24 c0 00 00 00 	mov    0xc0(%rsp),%rdi
5a11     5a11:	e8 00 00 00 00       	call   5a16 <s5m8767_pmic_probe+0x5a16>	5a12: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5a16     5a16:	e9 1c c9 ff ff       	jmp    2337 <s5m8767_pmic_probe+0x2337>
5a1b     5a1b:	48 8b 4c 24 50       	mov    0x50(%rsp),%rcx
5a20     5a20:	80 e1 07             	and    $0x7,%cl
5a23     5a23:	80 c1 03             	add    $0x3,%cl
5a26     5a26:	38 c1                	cmp    %al,%cl
5a28     5a28:	0f 8c 4a c9 ff ff    	jl     2378 <s5m8767_pmic_probe+0x2378>
5a2e     5a2e:	48 8b 7c 24 50       	mov    0x50(%rsp),%rdi
5a33     5a33:	e8 00 00 00 00       	call   5a38 <s5m8767_pmic_probe+0x5a38>	5a34: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5a38     5a38:	e9 3b c9 ff ff       	jmp    2378 <s5m8767_pmic_probe+0x2378>
5a3d     5a3d:	44 89 f1             	mov    %r14d,%ecx
5a40     5a40:	80 e1 07             	and    $0x7,%cl
5a43     5a43:	80 c1 03             	add    $0x3,%cl
5a46     5a46:	38 c1                	cmp    %al,%cl
5a48     5a48:	0f 8c 5c c9 ff ff    	jl     23aa <s5m8767_pmic_probe+0x23aa>
5a4e     5a4e:	4c 89 f7             	mov    %r14,%rdi
5a51     5a51:	e8 00 00 00 00       	call   5a56 <s5m8767_pmic_probe+0x5a56>	5a52: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5a56     5a56:	e9 4f c9 ff ff       	jmp    23aa <s5m8767_pmic_probe+0x23aa>
5a5b     5a5b:	48 8b 8c 24 c0 00 00 00 	mov    0xc0(%rsp),%rcx
5a63     5a63:	80 e1 07             	and    $0x7,%cl
5a66     5a66:	80 c1 03             	add    $0x3,%cl
5a69     5a69:	38 c1                	cmp    %al,%cl
5a6b     5a6b:	0f 8c 5f c9 ff ff    	jl     23d0 <s5m8767_pmic_probe+0x23d0>
5a71     5a71:	48 8b bc 24 c0 00 00 00 	mov    0xc0(%rsp),%rdi
5a79     5a79:	e8 00 00 00 00       	call   5a7e <s5m8767_pmic_probe+0x5a7e>	5a7a: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5a7e     5a7e:	e9 4d c9 ff ff       	jmp    23d0 <s5m8767_pmic_probe+0x23d0>
5a83     5a83:	48 8b 4c 24 40       	mov    0x40(%rsp),%rcx
5a88     5a88:	80 e1 07             	and    $0x7,%cl
5a8b     5a8b:	38 c1                	cmp    %al,%cl
5a8d     5a8d:	0f 8c b3 c9 ff ff    	jl     2446 <s5m8767_pmic_probe+0x2446>
5a93     5a93:	48 89 fb             	mov    %rdi,%rbx
5a96     5a96:	48 8b 7c 24 40       	mov    0x40(%rsp),%rdi
5a9b     5a9b:	e8 00 00 00 00       	call   5aa0 <s5m8767_pmic_probe+0x5aa0>	5a9c: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
5aa0     5aa0:	48 89 df             	mov    %rbx,%rdi
5aa3     5aa3:	e9 9e c9 ff ff       	jmp    2446 <s5m8767_pmic_probe+0x2446>
5aa8     5aa8:	48 8b 4c 24 70       	mov    0x70(%rsp),%rcx
5aad     5aad:	80 e1 07             	and    $0x7,%cl
5ab0     5ab0:	38 c1                	cmp    %al,%cl
5ab2     5ab2:	0f 8c 16 ca ff ff    	jl     24ce <s5m8767_pmic_probe+0x24ce>
5ab8     5ab8:	48 89 fb             	mov    %rdi,%rbx
5abb     5abb:	48 8b 7c 24 70       	mov    0x70(%rsp),%rdi
5ac0     5ac0:	e8 00 00 00 00       	call   5ac5 <s5m8767_pmic_probe+0x5ac5>	5ac1: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
5ac5     5ac5:	48 89 df             	mov    %rbx,%rdi
5ac8     5ac8:	e9 01 ca ff ff       	jmp    24ce <s5m8767_pmic_probe+0x24ce>
5acd     5acd:	48 8b 8c 24 90 00 00 00 	mov    0x90(%rsp),%rcx
5ad5     5ad5:	80 e1 07             	and    $0x7,%cl
5ad8     5ad8:	38 c1                	cmp    %al,%cl
5ada     5ada:	0f 8c 7d ca ff ff    	jl     255d <s5m8767_pmic_probe+0x255d>
5ae0     5ae0:	48 89 fb             	mov    %rdi,%rbx
5ae3     5ae3:	48 8b bc 24 90 00 00 00 	mov    0x90(%rsp),%rdi
5aeb     5aeb:	e8 00 00 00 00       	call   5af0 <s5m8767_pmic_probe+0x5af0>	5aec: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
5af0     5af0:	48 89 df             	mov    %rbx,%rdi
5af3     5af3:	e9 65 ca ff ff       	jmp    255d <s5m8767_pmic_probe+0x255d>
5af8     5af8:	48 8b 8c 24 a8 00 00 00 	mov    0xa8(%rsp),%rcx
5b00     5b00:	80 e1 07             	and    $0x7,%cl
5b03     5b03:	38 c1                	cmp    %al,%cl
5b05     5b05:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
5b0a     5b0a:	0f 8c 85 cf ff ff    	jl     2a95 <s5m8767_pmic_probe+0x2a95>
5b10     5b10:	48 8b bc 24 a8 00 00 00 	mov    0xa8(%rsp),%rdi
5b18     5b18:	e8 00 00 00 00       	call   5b1d <s5m8767_pmic_probe+0x5b1d>	5b19: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
5b1d     5b1d:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
5b22     5b22:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
5b2c     5b2c:	e9 64 cf ff ff       	jmp    2a95 <s5m8767_pmic_probe+0x2a95>
5b31     5b31:	48 8b 8c 24 a0 00 00 00 	mov    0xa0(%rsp),%rcx
5b39     5b39:	80 e1 07             	and    $0x7,%cl
5b3c     5b3c:	38 c1                	cmp    %al,%cl
5b3e     5b3e:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
5b43     5b43:	0f 8c d6 cf ff ff    	jl     2b1f <s5m8767_pmic_probe+0x2b1f>
5b49     5b49:	48 8b bc 24 a0 00 00 00 	mov    0xa0(%rsp),%rdi
5b51     5b51:	e8 00 00 00 00       	call   5b56 <s5m8767_pmic_probe+0x5b56>	5b52: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
5b56     5b56:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
5b5b     5b5b:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
5b65     5b65:	e9 b5 cf ff ff       	jmp    2b1f <s5m8767_pmic_probe+0x2b1f>
5b6a     5b6a:	48 8b 8c 24 98 00 00 00 	mov    0x98(%rsp),%rcx
5b72     5b72:	80 e1 07             	and    $0x7,%cl
5b75     5b75:	38 c1                	cmp    %al,%cl
5b77     5b77:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
5b7c     5b7c:	0f 8c 28 d0 ff ff    	jl     2baa <s5m8767_pmic_probe+0x2baa>
5b82     5b82:	48 8b bc 24 98 00 00 00 	mov    0x98(%rsp),%rdi
5b8a     5b8a:	e8 00 00 00 00       	call   5b8f <s5m8767_pmic_probe+0x5b8f>	5b8b: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
5b8f     5b8f:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
5b94     5b94:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
5b9e     5b9e:	e9 07 d0 ff ff       	jmp    2baa <s5m8767_pmic_probe+0x2baa>
5ba3     5ba3:	48 8b 8c 24 a8 00 00 00 	mov    0xa8(%rsp),%rcx
5bab     5bab:	80 e1 07             	and    $0x7,%cl
5bae     5bae:	38 c1                	cmp    %al,%cl
5bb0     5bb0:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
5bb5     5bb5:	0f 8c 74 d0 ff ff    	jl     2c2f <s5m8767_pmic_probe+0x2c2f>
5bbb     5bbb:	48 8b bc 24 a8 00 00 00 	mov    0xa8(%rsp),%rdi
5bc3     5bc3:	e8 00 00 00 00       	call   5bc8 <s5m8767_pmic_probe+0x5bc8>	5bc4: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
5bc8     5bc8:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
5bcd     5bcd:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
5bd7     5bd7:	e9 53 d0 ff ff       	jmp    2c2f <s5m8767_pmic_probe+0x2c2f>
5bdc     5bdc:	48 8b 8c 24 e0 00 00 00 	mov    0xe0(%rsp),%rcx
5be4     5be4:	80 e1 07             	and    $0x7,%cl
5be7     5be7:	80 c1 03             	add    $0x3,%cl
5bea     5bea:	38 c1                	cmp    %al,%cl
5bec     5bec:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
5bf1     5bf1:	0f 8c 58 d1 ff ff    	jl     2d4f <s5m8767_pmic_probe+0x2d4f>
5bf7     5bf7:	48 8b bc 24 e0 00 00 00 	mov    0xe0(%rsp),%rdi
5bff     5bff:	e8 00 00 00 00       	call   5c04 <s5m8767_pmic_probe+0x5c04>	5c00: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5c04     5c04:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
5c09     5c09:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
5c13     5c13:	e9 37 d1 ff ff       	jmp    2d4f <s5m8767_pmic_probe+0x2d4f>
5c18     5c18:	48 8b 8c 24 b8 00 00 00 	mov    0xb8(%rsp),%rcx
5c20     5c20:	80 e1 07             	and    $0x7,%cl
5c23     5c23:	80 c1 03             	add    $0x3,%cl
5c26     5c26:	38 c1                	cmp    %al,%cl
5c28     5c28:	0f 8c 5b d0 ff ff    	jl     2c89 <s5m8767_pmic_probe+0x2c89>
5c2e     5c2e:	48 8b bc 24 b8 00 00 00 	mov    0xb8(%rsp),%rdi
5c36     5c36:	e8 00 00 00 00       	call   5c3b <s5m8767_pmic_probe+0x5c3b>	5c37: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5c3b     5c3b:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
5c45     5c45:	e9 3f d0 ff ff       	jmp    2c89 <s5m8767_pmic_probe+0x2c89>
5c4a     5c4a:	48 8b 8c 24 a0 00 00 00 	mov    0xa0(%rsp),%rcx
5c52     5c52:	80 e1 07             	and    $0x7,%cl
5c55     5c55:	38 c1                	cmp    %al,%cl
5c57     5c57:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
5c5c     5c5c:	0f 8c e7 cf ff ff    	jl     2c49 <s5m8767_pmic_probe+0x2c49>
5c62     5c62:	48 8b bc 24 a0 00 00 00 	mov    0xa0(%rsp),%rdi
5c6a     5c6a:	e8 00 00 00 00       	call   5c6f <s5m8767_pmic_probe+0x5c6f>	5c6b: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
5c6f     5c6f:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
5c74     5c74:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
5c7e     5c7e:	e9 c6 cf ff ff       	jmp    2c49 <s5m8767_pmic_probe+0x2c49>
5c83     5c83:	48 8b 8c 24 98 00 00 00 	mov    0x98(%rsp),%rcx
5c8b     5c8b:	80 e1 07             	and    $0x7,%cl
5c8e     5c8e:	38 c1                	cmp    %al,%cl
5c90     5c90:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
5c95     5c95:	0f 8c c9 cf ff ff    	jl     2c64 <s5m8767_pmic_probe+0x2c64>
5c9b     5c9b:	48 8b bc 24 98 00 00 00 	mov    0x98(%rsp),%rdi
5ca3     5ca3:	e8 00 00 00 00       	call   5ca8 <s5m8767_pmic_probe+0x5ca8>	5ca4: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
5ca8     5ca8:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
5cad     5cad:	48 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rsi
5cb7     5cb7:	e9 a8 cf ff ff       	jmp    2c64 <s5m8767_pmic_probe+0x2c64>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
