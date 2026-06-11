Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888443E1223
	for <llvm@lists.linux.dev>; Thu, 11 Jun 2026 15:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781193471; cv=none; b=YUQnvBD9CiImKIl6yJatRSD1GLzkvhvQU6s8WverS4BVVsnpK35Tflz6G19Y9dhMJc25LKKu+7gnZ0S54oHbZ/n/mp7mnoXC9HaN8iNaNnBsNPEfG7z+3+amV4HAjlWg2HYMw/ThM6YF3YSKZ6gRcbMNunA+rihIqv8ECM7X8M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781193471; c=relaxed/simple;
	bh=FMohIXLUmdM7d1qQg69cZ9l2z6MfDuNdR9XP1KafGgI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J1aJplPuOXp0YqDU+8CcybgnLKcsiEM1HZzxjZ52gcSRU8Ea1LdpIdsGdz+6rKAB/x/w4c+ZmDvSL1/HtiOeMQhQBvvNrQ+o6eENsku6i1FFxYyRbh7yheUe0rTg3WFkydpgN3cyFDGhtJGPXFvKPHc4pOIeRqUrQ9D8HYFvfPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=TsF4ZU8c; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="TsF4ZU8c"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BBNbJN3874120;
	Thu, 11 Jun 2026 15:57:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=8iR2H/GVSh12+Y9o8qyjxnMT7K0Iu6/nW4dwLIhyv
	NE=; b=TsF4ZU8cOJic9r+/KvGybi4XR0xn0ALdeZVxAIl6SswpzTu/qZsWOMpmK
	NlYzUVG0vCxcqdK7T8XeZA70749R2v1+X7qsmUNzr0eqQw7d0INJzn0l+u86mOOv
	53MhZrpHv0aFSkeHV7dP1SjK4kWOeSJtJpNfpWI+JH7HOM8wn9YbiT9GwoMA/E13
	wtLl6AXpgVZg49jx3sBVfaHzIKbr/Zq/R5udOpMvVjT2lMMzJab1lODOUPyWJyWP
	jFJVTKxHZMW2ONfULxAKK8xeG6RSMxmizgIuFG2t4MCeVWKZYp2BhcqVCldsE6z9
	cLq34MNTW+SUdOHUP2ACoE0jo1d2Q==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4eqe8evp2e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jun 2026 15:57:29 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 65BFncnU018000;
	Thu, 11 Jun 2026 15:57:28 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4eqe0a3vfx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jun 2026 15:57:28 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 65BFvObw27394442
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 11 Jun 2026 15:57:24 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 50DCA2004B;
	Thu, 11 Jun 2026 15:57:24 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C889F20043;
	Thu, 11 Jun 2026 15:57:23 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.87.85.9])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 11 Jun 2026 15:57:23 +0000 (GMT)
From: Jens Remus <jremus@linux.ibm.com>
To: Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev
Cc: Jens Remus <jremus@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
        Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH] x86/cfi: Use symmetric SYM_START and SYM_END in __CFI_TYPE()
Date: Thu, 11 Jun 2026 17:57:15 +0200
Message-ID: <20260611155716.830563-1-jremus@linux.ibm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE1NyBTYWx0ZWRfX/OdRS+u3fDHO
 6+VZ2tLWVcinDEK3b6iRRxYfWFYLAIj1x4ow56KG9RRYomvLFva3W90IDjAED6OWGqV9tyBEf3B
 B7Cb5LJ/QDf/yQQ3vkjQNzWZIZgbLBEKHWx8Zx+NDEczDGq0CSwVZ42Us5nUWKXl2FKnVkVHrty
 fX4s1SMzHrOLrg2mzl/2HaH0j/NeLyjUvVeb2oM6MDm9jyoCfMxX3tJKV1YtfaJSqiaBeO9Vm1d
 BFGNm7kJBOHKWBiK6y+bT8j+Kri2mXhiU/MSTxF0M736+Hx1K+MPqW8wTXDmYuMHC84/tDu4mRQ
 6W3FN7qympPAaFz9tSzpBhmYU/KDS5/iOZFmTHRghB0Pi+xCCwr/SOg8CS1p6r0yQWgi0DPLY9t
 /gzoRztyR1qur1wouM//ANqA+cV1emvHRxH0fkrwNPiZKAayD5Rb/GXe+Ajs/YMReHzuV9U6JBV
 mysKEt5whTzUFbio2GQ==
X-Authority-Analysis: v=2.4 cv=dr7rzVg4 c=1 sm=1 tr=0 ts=6a2adae9 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=U7nrCbtTmkRpXpFmAIza:22 a=c92rfblmAAAA:8 a=VnNF1IyMAAAA:8 a=VwQbUJbxAAAA:8
 a=aq8RmjuiW1DVT2snRsEA:9 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: EGbllhVnDFjd_U6hiyNy4MgoTGt5rFRD
X-Proofpoint-GUID: iRTsPWvfkU0TV2kjbYUPuISlnjulOczw
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE1NyBTYWx0ZWRfXxOn9BTGhWshI
 TcLxtUjIkNwDSrhsCrFrU8wxflpiI830FnAh3yp+sbaFykPpyHkz/AuC/lxvoMcEMPppWkW7Det
 gU4BPmCjsJTbmr8XJ/6+Sx6ngo67ZxU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_03,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 clxscore=1011 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110157

Commit ccace936eec7 ("x86: Add types to indirectly called assembly
functions") introduced a x86-specific implementation of __CFI_TYPE()
using an asymmetric combination of SYM_START() and SYM_FUNC_END() to
add a symbol to the KCFI type identifier that precedes a function.

This asymmetric combination is an issue if SYM_FUNC_END() ever gets
extended in a way that requires it to be used symmetrically with
SYM_FUNC_START*().  For instance to emit DWARF CFI directives that
denote the start/end of a function. [1]

Use SYM_END() with SYM_T_FUNC instead.  No functional change, as the
generic implementation of SYM_FUNC_END(name) expands into
SYM_END(name, SYM_T_FUNC).

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260522110427.2816637-1-jremus@linux.ibm.com?part=3 [1]
Signed-off-by: Jens Remus <jremus@linux.ibm.com>
---

Notes (jremus):
    This patch applies on top of linus' tree (9716c086c8e8):
    
      git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git  master
    
    I verified as follows that in x86-64 builds of vmlinux using Clang with
    kCFI enabled without and with my patch applied vmlinux.o only differs in
    relocations targeting .rodata.str* and a few symbols in .rodata shifted
    (both likely due to differences in string merging):
    
    $ objdump -d vmlinux.o > vmlinux.o.{old|new}.objdump
    $ readelf -Wa vmlinux.o > vmlinux.o.{old|new}.readelf
    $ diff -u vmlinux.o.old.objdump vmlinux.o.new.objdump
    [no differences]
    $ diff -u0 vmlinux.o.old.readelf vmlinux.o.new.readelf | \
      grep --invert-match -E "\.rodata\.str|@@"
    [see above]

 arch/x86/include/asm/linkage.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/linkage.h b/arch/x86/include/asm/linkage.h
index a7294656ad90..c9769a7b6e66 100644
--- a/arch/x86/include/asm/linkage.h
+++ b/arch/x86/include/asm/linkage.h
@@ -103,7 +103,7 @@
 	.byte 0xb8 ASM_NL					\
 	.long __kcfi_typeid_##name ASM_NL			\
 	CFI_POST_PADDING					\
-	SYM_FUNC_END(__cfi_##name)
+	SYM_END(__cfi_##name, SYM_T_FUNC)
 
 /* UML needs to be able to override memcpy() and friends for KASAN. */
 #ifdef CONFIG_UML
-- 
2.53.0

