Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795628493;
	b=LCHBk3mN9C2bIxrn9ryRzKSpICY80MrsNDGIVWKUSLmJBjfkFOERzCyil0kKkPHjAKOP
	 +l6j/8Pt+VtT+hktd0ZrvHw7QlXB+vn2m3O+H06ROEn+/lUCZdBhX5wUSIgySWWsS9ZKk
	 odWTYB/mLk2hUM1j874WB86/xeykvBqOplVAHYR1fWcSLs2dq4YnzqOLNzh1Iwf085kNb
	 9XlhXmn+rekpW12tY9dlGbxiJyqMXqC021+LxhGb00AB5VF+frVbH+2b/pyuglZxC1bLn
	 kzUlP64g0E0egU5OCtSiJPqJnnNEyMuSd/IokJss2fJcfjsrMhJjVQ2+elJ+ZnHodqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795628493;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-TM-AS-GCONF:X-Proofpoint-Reinject:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rnoF/YnbWgH7sQ349/gu0J3NwT5mIhTPar9IrbUkFi4=;
	b=Bv0lwaagfA69RvJ++zeptvBOXjnxgMEvMWF/sH2q8xaW4WmRS3uzHCpopcdUgRm3E6Dz
	 s8o0NxhMmlOH/NDrnEBaGuumUBMbNZG4Mn3h/d2RHL2/f2BL/G009PSxL/WX1PkRe7yWw
	 mNJYgTZcOKx+iwOL7IysTdu76d6DXd0VE6mMTWYiVpAG0QRrf4hNRqetOIyJhTr8D4lPO
	 0mNpESuQp5U8KnUtGks5mUWslWdpTMTFPILCYv9va3x6hbikPOzJEI+eKh5h8upQe2wV2
	 KuRFPPy16EO9VQ3rnr8EZSDfMptvbxHmZ2fga82+PZ3GrZM0cSjE9z3r0ZhL20o7ECw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UbPXCvOT;
	arc=none smtp.remote-ip=148.163.156.1
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D18606A326
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 17:41:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03D18606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UbPXCvOT
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APGYlkE232931;
	Wed, 25 Nov 2026 17:41:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=rnoF/YnbWgH7sQ349/gu0J3NwT5mIhTPar9IrbUkF
	i4=; b=UbPXCvOTAVCwIR3L+vvY/5xSjmfzVsQl5b8bu+Uu1+pYzsk+PxkSM0YD3
	HyT1s1RAgKZr/MBgJguY/1jrdipjdWINvu/PlFFJJ5rFqWlSIxtji0EYYkbyaIfN
	0GmFNjDWw7qowX51Iw98wQk/Ldw627vN7BdE86Q/qyLLz9sLWJBxRI5z/Cm0XXIp
	k75MPawomCdgIF5dydaAo1e7aWCZZeUPK+/J67T+JtCu5TlENLfS5pYpW388ylO8
	GSIZ51wdGVWhonHbVvfQfoy4hISWzhKyaT1IeRbU8wvQR05s20nXi7b7W/fGqtcp
	HnqD2fWuzTkRcGg9PVz1y5JN5DMQw==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j34g3dqq1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 25 Nov 2026 17:41:10 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6APGYKfu313817;
	Wed, 25 Nov 2026 17:41:10 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4j5uxx1mbc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Nov 2026 17:41:09 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6APHf5eN49217894
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Nov 2026 17:41:05 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C988720040;
	Wed, 25 Nov 2026 17:41:05 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2A50A2004B;
	Wed, 25 Nov 2026 17:41:01 +0000 (GMT)
Received: from li-398ad3cc-28e7-11b2-a85c-e030a5b10d54.ibm.com.com (unknown [9.43.127.4])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 25 Nov 2026 17:41:00 +0000 (GMT)
From: "Nysal Jan K.A." <nysal@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Jeevitha Palanisamy <jeevitha@linux.ibm.com>,
        "Nysal Jan K.A." <nysal@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Shrikanth Hegde <sshegde@linux.ibm.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        "David Hildenbrand (Arm)" <david@kernel.org>, SJ Park <sj@kernel.org>,
        Usama Arif <usama.arif@linux.dev>,
        Kevin Brodsky <kevin.brodsky@arm.com>,
        "Kiryl Shutsemau (Meta)" <kas@kernel.org>,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: [PATCH 0/3] powerpc: Implement cmpxchg128()
Date: Wed, 25 Nov 2026 23:10:21 +0530
Message-ID: <20261125174035.1412724-1-nysal@linux.ibm.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=SoQFe/O0 c=1 sm=1 tr=0 ts=6b071db7 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=uAbxVGIbfxUO_5tXvNgY:22 a=NEAV23lmAAAA:8 a=mDV3o1hIAAAA:8
 a=So1Eduup0IF1CtLnSYcA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA3MCBTYWx0ZWRfX28EbsGtFJABs
 qJh56u0xp3R5r5mZSUiY8/f4KAMWf9T2wVeElqEsKdwuvcTDvtvQfTt4Vle+zkrYAEU5/8JQEex
 HcEG8SQhjuC7Fu4bGZrSX/t2E72au0I=
X-Proofpoint-ORIG-GUID: L_DyCqQm9XciaYjFooRVCw3sTZqUstVF
X-Proofpoint-GUID: gqlHjYBnnj1PyX0snfyQKoAWJSm4Pd1_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA3MCBTYWx0ZWRfXyNyIvfkmd8Ik
 KYM1WI4USRtGj96nIKnePwt980SuPnCI8m5M45iaZFLfEXCqXN8aBnozJqFqktT4Ot2OV2Vk9Ej
 FrHCQEJveX6WcOb7MYPYrc6QyfbXRkLq+6K5IQV0n/MMEglIjsJgG1d07BPPHEkNecD8OZ3trAh
 arAXohjqk+GPvvCn72airmEIPDGzeLiTP0PJ4MOhyK19D5/YjRffcbzcEOkyz0gy7r4LOtzahqk
 YLgEgfQOSVuPlTkIcXFikWrBnIJOnpbHQkRm7+TVWPMyzvjNWLT5rCh16nEKsRc9yvE2Z4xnS5c
 WA78dIoMIrUmuTpNkVm9Ii6Y2EP7eMm7FEtJDdC0iateGWh17gzAfmRaPBBVF59Sx5tePMC5PLk
 8l1qFXFIy8R3pwKgBtzPFJZh06UAAV0JW/wHKIvRzoQPhG3o1n3MpbRTbmFBukszuijSVlryaoy
 LxlgriIc7hof2Z/Qyeg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1011 malwarescore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250070

This series adds arch_cmpxchg128() and arch_cmpxchg128_local() for
little-endian POWER8 and later, using lqarx/stqcx. This enables
HAVE_CMPXCHG_DOUBLE and HAVE_ALIGNED_STRUCT_PAGE, which gives us:

* SLUB's lockless __update_freelist_fast() path (avoiding slab_lock()).
* kmalloc_nolock(), without which BPF task-local storage creation fails
  with -ENOMEM, and the selftests task_local_data_race and
  struct_ops_assoc (timer subtests) fail. BPF Arena kfuncs were changed
  to be callable from any context. kmalloc_nolock() replaced kvcalloc()
  in the arena allocation paths because kvcalloc() may sleep and take
  ordinary allocator locks, while kmalloc_nolock() can run in NMI or
  non-sleepable contexts.

The lqarx and stqcx. instructions require the 128-bit operand to reside in
a consecutive even/odd register pair. In the Power ISA, the operand uses
big-endian register layout where the most significant and least
significant 64 bits are in the even and odd registers respectively.
Until now this could not be expressed in inline asm without hard
register constraints [1].

GCC now supports this through the PTI mode attribute [2,3] for PowerPC
and it will be available in the upcoming GCC 17 release. Backports have
landed in the GCC 14, 15 and 16 branches. GCC 16.2 is the first release
which has PTI mode support. For older GCC releases and clang there is a
fallback implementation with hard register constraints.

Additionally, this series enables PPC_HAS_LBARX_LHARX for Power10, which
was previously omitted in the Kconfig.

[1] https://github.com/linuxppc/issues/issues/463
[2] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=106895
[3] https://gcc.gnu.org/pipermail/gcc-patches/2026-April/712831.html

Nysal Jan K.A. (3):
  powerpc: Add support for 128-bit cmpxchg
  powerpc: Implement 128-bit cmpxchg fallback
  powerpc: Enable lbarx/lharx for Power10

 arch/powerpc/Kconfig                   |   8 ++
 arch/powerpc/include/asm/cmpxchg.h     | 100 +++++++++++++++++++++++++
 arch/powerpc/platforms/Kconfig.cputype |   4 +
 3 files changed, 112 insertions(+)


base-commit: 65e4fd942f72a9dba0e4e257290c4fa1aa756854
-- 
2.52.0

