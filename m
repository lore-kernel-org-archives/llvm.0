Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798DD101EE;
	Tue, 21 Jan 2025 13:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737465626; cv=none; b=hTk8rYuXkBch/zEppd5v1YR8M7vLAuBBU4pzAKN8lEy7qafUPbXhA+Y9wm9JfNAHnm+SwJw5tw8pPqw6Y+KC4Ki1KDQURKFdZQPnfYmgKhn/kPgBUpOfKbLIsbouSe/PjRNiwDOk6rO9thMj7Om5AuCoIGCPLOFIDnOBcrA+DMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737465626; c=relaxed/simple;
	bh=+AHQUiALagpQ6ViO2iA+H74BMAuxaGGMqW1Kd8VBmRI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ftgs2ch/i5ko4vO7tNKZ9NTSmHF5/o0XWvluraFEQJhHqi9Mty6S3yxQb4AkKIyNTgPrn5oln54zBA4EeSU5dTNwkujso7pGjMWqxen6+9NnugUceo6NEAnQJ2DJe+kDHmKG2oEjam1uSzKZFupOcIOlwkKIglw69KyNaRJZfNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gJT1tHOr; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gJT1tHOr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737465625; x=1769001625;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=+AHQUiALagpQ6ViO2iA+H74BMAuxaGGMqW1Kd8VBmRI=;
  b=gJT1tHOrN5nQhItsnYDRR2vAhHLf2clluOR+GtmyLWOIZOBLoiBGaFdm
   Oe7Fl3b9JM+sBxVkfZ6lfnzrB+6POUCPXfo5JILSwRV4vN/GWDLAEbR2D
   Ps5C5gmZtPpd1hsyADFmSOlQNxr7nA76cNdoDQvMlc9BxI+UNp2v/l0ry
   Umvf7qotASAf0+nCexw5PP90tqKz7tTmSPmdAkoMnLbpZlI5P2dc2M72T
   11wRG8HxaPWZkptZzBjuwtL0Ia0Sz1CX5Rzq/UlzONGd3bQiS5grx5Y2f
   czBeXlZA9SRhgndzgHOGdVXCTdg/QzxQaquLpAQRy5stgoTlum3PG7+fv
   Q==;
X-CSE-ConnectionGUID: lJb6OFe/T3WwnwXAK42uVw==
X-CSE-MsgGUID: lKLmUSnQQL6y2FaLFlo+dg==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="37147704"
X-IronPort-AV: E=Sophos;i="6.13,222,1732608000"; 
   d="scan'208";a="37147704"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2025 05:20:24 -0800
X-CSE-ConnectionGUID: a6T6S2cvRf2p34QOIE3Kyg==
X-CSE-MsgGUID: +1dvBZimT8ycV0+1doradA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,222,1732608000"; 
   d="scan'208";a="137637296"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 21 Jan 2025 05:20:22 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1taEB2-000Y4P-18;
	Tue, 21 Jan 2025 13:20:20 +0000
Date: Tue, 21 Jan 2025 21:19:20 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:crc-x86 4/5] <instantiation>:29:20: error: register %rax
 is only available in 64-bit mode
Message-ID: <202501212132.CwJkezd5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git =
crc-x86
head:   f31bd31f442cdda8a269eca5bf673a3066d40233
commit: 4b1b1259644653acbde3ac8c6132e1744d5543ed [4/5] x86/crc32: implement=
 crc32_le using new template
config: i386-buildonly-randconfig-002-20250121 (https://download.01.org/0da=
y-ci/archive/20250121/202501212132.CwJkezd5-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51ec=
cf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20250121/202501212132.CwJkezd5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501212132.CwJkezd5-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

>> <instantiation>:29:20: error: register %rax is only available in 64-bit =
mode
    pextrq $1, %xmm0, %rax
                      ^~~~
   <instantiation>:255:2: note: while in macro instantiation
    _cond_vex "pextrq $1,", %xmm0, %rax
    ^
   arch/x86/lib/crc32-pclmul.S:6:74: note: while in macro instantiation
   .globl crc32_lsb_pclmul_sse ; .balign 4, 0x90; ; crc32_lsb_pclmul_sse: ;=
 _crc_pclmul crc_bits=3D32, lsb_crc=3D1, vl=3D16, avx_level=3D0; .type crc3=
2_lsb_pclmul_sse STT_FUNC ; .set .L__sym_size_crc32_lsb_pclmul_sse, .-crc32=
_lsb_pclmul_sse ; .size crc32_lsb_pclmul_sse, .L__sym_size_crc32_lsb_pclmul=
_sse; .globl crc32_lsb_vpclmul_avx2 ; .balign 4, 0x90; ; crc32_lsb_vpclmul_=
avx2: ; cmp $32, LEN; jb crc32_lsb_pclmul_sse; _crc_pclmul crc_bits=3D32, l=
sb_crc=3D1, vl=3D32, avx_level=3D2; .type crc32_lsb_vpclmul_avx2 STT_FUNC ;=
 .set .L__sym_size_crc32_lsb_vpclmul_avx2, .-crc32_lsb_vpclmul_avx2 ; .size=
 crc32_lsb_vpclmul_avx2, .L__sym_size_crc32_lsb_vpclmul_avx2; .globl crc32_=
lsb_vpclmul_avx10_256 ; .balign 4, 0x90; ; crc32_lsb_vpclmul_avx10_256: ; c=
mp $32, LEN; jb crc32_lsb_pclmul_sse; _crc_pclmul crc_bits=3D32, lsb_crc=3D=
1, vl=3D32, avx_level=3D10;.type crc32_lsb_vpclmul_avx10_256 STT_FUNC ; .se=
t .L__sym_size_crc32_lsb_vpclmul_avx10_256, .-crc32_lsb_vpclmul_avx10_256 ;=
 .size crc32_lsb_vpclmul_avx10_256, .L__sym_size_crc32_lsb_vpclmul_avx10_25=
6; .globl crc32_lsb_vpclmul_avx10_512 ; .balign 4, 0x90; ; crc32_lsb_vpclmu=
l_avx10_512: ; cmp $256, LEN; jb crc32_lsb_vpclmul_avx10_256; _crc_pclmul c=
rc_bits=3D32, lsb_crc=3D1, vl=3D64, avx_level=3D10;.type crc32_lsb_vpclmul_=
avx10_512 STT_FUNC ; .set .L__sym_size_crc32_lsb_vpclmul_avx10_512, .-crc32=
_lsb_vpclmul_avx10_512 ; .size crc32_lsb_vpclmul_avx10_512, .L__sym_size_cr=
c32_lsb_vpclmul_avx10_512;
                                                                           =
 ^
   <instantiation>:37:21: error: register %rax is only available in 64-bit =
mode
    vpextrq $1, %xmm0, %rax
                       ^~~~
   <instantiation>:255:2: note: while in macro instantiation
    _cond_vex "pextrq $1,", %xmm0, %rax
    ^
   arch/x86/lib/crc32-pclmul.S:6:412: note: while in macro instantiation
   .globl crc32_lsb_pclmul_sse ; .balign 4, 0x90; ; crc32_lsb_pclmul_sse: ;=
 _crc_pclmul crc_bits=3D32, lsb_crc=3D1, vl=3D16, avx_level=3D0; .type crc3=
2_lsb_pclmul_sse STT_FUNC ; .set .L__sym_size_crc32_lsb_pclmul_sse, .-crc32=
_lsb_pclmul_sse ; .size crc32_lsb_pclmul_sse, .L__sym_size_crc32_lsb_pclmul=
_sse; .globl crc32_lsb_vpclmul_avx2 ; .balign 4, 0x90; ; crc32_lsb_vpclmul_=
avx2: ; cmp $32, LEN; jb crc32_lsb_pclmul_sse; _crc_pclmul crc_bits=3D32, l=
sb_crc=3D1, vl=3D32, avx_level=3D2; .type crc32_lsb_vpclmul_avx2 STT_FUNC ;=
 .set .L__sym_size_crc32_lsb_vpclmul_avx2, .-crc32_lsb_vpclmul_avx2 ; .size=
 crc32_lsb_vpclmul_avx2, .L__sym_size_crc32_lsb_vpclmul_avx2; .globl crc32_=
lsb_vpclmul_avx10_256 ; .balign 4, 0x90; ; crc32_lsb_vpclmul_avx10_256: ; c=
mp $32, LEN; jb crc32_lsb_pclmul_sse; _crc_pclmul crc_bits=3D32, lsb_crc=3D=
1, vl=3D32, avx_level=3D10;.type crc32_lsb_vpclmul_avx10_256 STT_FUNC ; .se=
t .L__sym_size_crc32_lsb_vpclmul_avx10_256, .-crc32_lsb_vpclmul_avx10_256 ;=
 .size crc32_lsb_vpclmul_avx10_256, .L__sym_size_crc32_lsb_vpclmul_avx10_25=
6; .globl crc32_lsb_vpclmul_avx10_512 ; .balign 4, 0x90; ; crc32_lsb_vpclmu=
l_avx10_512: ; cmp $256, LEN; jb crc32_lsb_vpclmul_avx10_256; _crc_pclmul c=
rc_bits=3D32, lsb_crc=3D1, vl=3D64, avx_level=3D10;.type crc32_lsb_vpclmul_=
avx10_512 STT_FUNC ; .set .L__sym_size_crc32_lsb_vpclmul_avx10_512, .-crc32=
_lsb_vpclmul_avx10_512 ; .size crc32_lsb_vpclmul_avx10_512, .L__sym_size_cr=
c32_lsb_vpclmul_avx10_512;
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                       ^
   <instantiation>:37:21: error: register %rax is only available in 64-bit =
mode
    vpextrq $1, %xmm0, %rax
                       ^~~~
   <instantiation>:255:2: note: while in macro instantiation
    _cond_vex "pextrq $1,", %xmm0, %rax
    ^
   arch/x86/lib/crc32-pclmul.S:6:770: note: while in macro instantiation
   .globl crc32_lsb_pclmul_sse ; .balign 4, 0x90; ; crc32_lsb_pclmul_sse: ;=
 _crc_pclmul crc_bits=3D32, lsb_crc=3D1, vl=3D16, avx_level=3D0; .type crc3=
2_lsb_pclmul_sse STT_FUNC ; .set .L__sym_size_crc32_lsb_pclmul_sse, .-crc32=
_lsb_pclmul_sse ; .size crc32_lsb_pclmul_sse, .L__sym_size_crc32_lsb_pclmul=
_sse; .globl crc32_lsb_vpclmul_avx2 ; .balign 4, 0x90; ; crc32_lsb_vpclmul_=
avx2: ; cmp $32, LEN; jb crc32_lsb_pclmul_sse; _crc_pclmul crc_bits=3D32, l=
sb_crc=3D1, vl=3D32, avx_level=3D2; .type crc32_lsb_vpclmul_avx2 STT_FUNC ;=
 .set .L__sym_size_crc32_lsb_vpclmul_avx2, .-crc32_lsb_vpclmul_avx2 ; .size=
 crc32_lsb_vpclmul_avx2, .L__sym_size_crc32_lsb_vpclmul_avx2; .globl crc32_=
lsb_vpclmul_avx10_256 ; .balign 4, 0x90; ; crc32_lsb_vpclmul_avx10_256: ; c=
mp $32, LEN; jb crc32_lsb_pclmul_sse; _crc_pclmul crc_bits=3D32, lsb_crc=3D=
1, vl=3D32, avx_level=3D10;.type crc32_lsb_vpclmul_avx10_256 STT_FUNC ; .se=
t .L__sym_size_crc32_lsb_vpclmul_avx10_256, .-crc32_lsb_vpclmul_avx10_256 ;=
 .size crc32_lsb_vpclmul_avx10_256, .L__sym_size_crc32_lsb_vpclmul_avx10_25=
6; .globl crc32_lsb_vpclmul_avx10_512 ; .balign 4, 0x90; ; crc32_lsb_vpclmu=
l_avx10_512: ; cmp $256, LEN; jb crc32_lsb_vpclmul_avx10_256; _crc_pclmul c=
rc_bits=3D32, lsb_crc=3D1, vl=3D64, avx_level=3D10;.type crc32_lsb_vpclmul_=
avx10_512 STT_FUNC ; .set .L__sym_size_crc32_lsb_vpclmul_avx10_512, .-crc32=
_lsb_vpclmul_avx10_512 ; .size crc32_lsb_vpclmul_avx10_512, .L__sym_size_cr=
c32_lsb_vpclmul_avx10_512;
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                      ^
   <instantiation>:37:21: error: register %rax is only available in 64-bit =
mode
    vpextrq $1, %xmm0, %rax
                       ^~~~
   <instantiation>:255:2: note: while in macro instantiation
    _cond_vex "pextrq $1,", %xmm0, %rax
    ^
   arch/x86/lib/crc32-pclmul.S:6:1161: note: while in macro instantiation
   .globl crc32_lsb_pclmul_sse ; .balign 4, 0x90; ; crc32_lsb_pclmul_sse: ;=
 _crc_pclmul crc_bits=3D32, lsb_crc=3D1, vl=3D16, avx_level=3D0; .type crc3=
2_lsb_pclmul_sse STT_FUNC ; .set .L__sym_size_crc32_lsb_pclmul_sse, .-crc32=
_lsb_pclmul_sse ; .size crc32_lsb_pclmul_sse, .L__sym_size_crc32_lsb_pclmul=
_sse; .globl crc32_lsb_vpclmul_avx2 ; .balign 4, 0x90; ; crc32_lsb_vpclmul_=
avx2: ; cmp $32, LEN; jb crc32_lsb_pclmul_sse; _crc_pclmul crc_bits=3D32, l=
sb_crc=3D1, vl=3D32, avx_level=3D2; .type crc32_lsb_vpclmul_avx2 STT_FUNC ;=
 .set .L__sym_size_crc32_lsb_vpclmul_avx2, .-crc32_lsb_vpclmul_avx2 ; .size=
 crc32_lsb_vpclmul_avx2, .L__sym_size_crc32_lsb_vpclmul_avx2; .globl crc32_=
lsb_vpclmul_avx10_256 ; .balign 4, 0x90; ; crc32_lsb_vpclmul_avx10_256: ; c=
mp $32, LEN; jb crc32_lsb_pclmul_sse; _crc_pclmul crc_bits=3D32, lsb_crc=3D=
1, vl=3D32, avx_level=3D10;.type crc32_lsb_vpclmul_avx10_256 STT_FUNC ; .se=
t .L__sym_size_crc32_lsb_vpclmul_avx10_256, .-crc32_lsb_vpclmul_avx10_256 ;=
 .size crc32_lsb_vpclmul_avx10_256, .L__sym_size_crc32_lsb_vpclmul_avx10_25=
6; .globl crc32_lsb_vpclmul_avx10_512 ; .balign 4, 0x90; ; crc32_lsb_vpclmu=
l_avx10_512: ; cmp $256, LEN; jb crc32_lsb_vpclmul_avx10_256; _crc_pclmul c=
rc_bits=3D32, lsb_crc=3D1, vl=3D64, avx_level=3D10;.type crc32_lsb_vpclmul_=
avx10_512 STT_FUNC ; .set .L__sym_size_crc32_lsb_vpclmul_avx10_512, .-crc32=
_lsb_vpclmul_avx10_512 ; .size crc32_lsb_vpclmul_avx10_512, .L__sym_size_cr=
c32_lsb_vpclmul_avx10_512;
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                      ^

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
