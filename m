Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793900325;
	b=JVIIr3QYdptAt4JxR6jLm55CI+Ya8RYKKBcf7c2gQYU5ZYP0EpOk8nK4mIcFcBDYG4fy
	 0w+FKml1ds/A2rAZWtyJUm51EOppuXoPwxLKVHjlEQnSyKEC4ds+KIY1fHTAiktbtBotw
	 j67Awbmt2H33VNWoPATE0WoptaXvIS5iEXSr93ihmL0vqHxwP0+F7/fuCMPKQujI86Z/G
	 vYD+14/oqNprY5vUS4zmy+CbI+bO8U6FiIQz7bCBI8ks7SSwqpDjb/+VohGHzyLpMAoc8
	 3PTXBZ9VgaiBSAEBDj+1Xlub8ZzOpRXkSbAKIdaGRBr7cQyxmFI0XJ+xLbGKwo2WIng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793900325;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-TM-AS-GCONF:
	 X-Proofpoint-Reinject:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rdzlIaUH6Hn5s4YN1L9yR2AveCxOlTSI0/zi9qQe1hE=;
	b=IoP6JUUohSvP7hkXdULu/eTQnuWsHZOHVUSY3DKzHq+aP79qcZGP29XcRxFVQ/NYrI8t
	 tCLMGOGEFjEcGpx7gMJPXLDtHOAKZ6WjqI+v6yM6roFQPJ4JN/6fKYg3OWUZWkW7lVUDx
	 v44w3lDudCUmkLJZu+nKNb/Et6wAgxfGK7qP3guq8AdCKKLP8kFmCk6aV/vHMAytp+O9c
	 VQflV5ixIiwV9OPfgC7msy0N/yzpkiYCItg9vu5dRTRuol/figQWZ4Ol8uHjE4R+kZdrH
	 PcfizPZWcEGIp1PrUvw7q4PsumHjA7Pg6tvDZ/8kjtcN20HAAy3g4iA1Pn0nZ9O93qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pgxDCjP0;
	arc=none smtp.remote-ip=148.163.156.1
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21098606A31B
	for <llvm@lists.linux.dev>; Thu,  5 Nov 2026 17:38:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21098606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pgxDCjP0
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5EiEQ73787730;
	Thu, 5 Nov 2026 17:38:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=rdzlIa
	UH6Hn5s4YN1L9yR2AveCxOlTSI0/zi9qQe1hE=; b=pgxDCjP0xdaLvbvLVASo69
	nSYnte/UzO55UeAI/scwutSPLHdIEWwwGo43/tz9MEpJ4Rh2m2d6OGdqP9d4Kovz
	RjBCPB3U/ehRY6z+OEJJHCnSRj62QsCFQ/6370u8Jp5lko+uRRGViRJVA4iZsgHv
	3f27t9oXcDHDOS7QmF8/N13Fg2KUsCiemZQPrDv6jsiiqwbPs50W0QTiPD1Ho0Tc
	ahcB908WbiJ2Yy3ki3guxWFLs/IJWp+ia2Onwcm7X51Di7zfOE/nXKg6v7vlr2uI
	/c9w1GgbK7+ONoEHJ2BtqGBMT3Zrht+y7zgvjoW5cChakyydcTOMoTTR+3TitqtA
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4hn82742pe-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 05 Nov 2026 17:38:28 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5GuFld1746147;
	Thu, 5 Nov 2026 17:38:27 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4hrk9mkgbr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Nov 2026 17:38:27 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6A5HcR4R31392354
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 5 Nov 2026 17:38:27 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5AD6C58056;
	Thu,  5 Nov 2026 17:38:27 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 67DA858052;
	Thu,  5 Nov 2026 17:38:23 +0000 (GMT)
Received: from [9.68.10.150] (unknown [9.68.10.150])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  5 Nov 2026 17:38:23 +0000 (GMT)
Message-ID: <0bfde967-9b68-4edb-96d7-ee9580fa1358@linux.ibm.com>
Date: Thu, 5 Nov 2026 18:38:10 +0100
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/20] coverage: move gcov and kcov under
 kernel/coverage/
To: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org
Cc: Alexander Potapenko <glider@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Ben Segall <bsegall@google.com>, Bill Wendling <morbo@google.com>,
        Chuck Wolber <chuck@wolber.net>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Dmitry Vyukov <dvyukov@google.com>, Ingo Molnar <mingo@redhat.com>,
        Juri Lelli <juri.lelli@redhat.com>,
        Justin Stitt <justinstitt@google.com>, kasan-dev@googlegroups.com,
        K Prateek Nayak <kprateek.nayak@amd.com>, linux-doc@vger.kernel.org,
        llvm@lists.linux.dev, Marco Elver <elver@google.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mel Gorman <mgorman@suse.de>, Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Thomas Gleixner <tglx@kernel.org>,
        Valentin Schneider <vschneid@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>
References: <20261103015238.3780910-1-sashal@kernel.org>
 <20261103015238.3780910-2-sashal@kernel.org>
From: Peter Oberparleiter <oberpar@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20261103015238.3780910-2-sashal@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: rkdU5601SIlyTEcZImOEhpH2nM8SvIsv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA2OCBTYWx0ZWRfX6NJgN8/MJS35
 pbK2PumL8jSiuQmWVCw5maGSbcS30Ek2XXkqSVWxt5CiIze/p2m8RSuSfrT1TocToRxb2dOkIWs
 CnlZzrH2Pzk62SVShoGHP7rYRw75T7L047aSenT+9ZCUBADK9xweoRN8gD5ligVMTacUUJykEor
 pEBu3irqghJrnWuCwO4aRVyVm7ufppv0WvZQ93q11ReemzEk4kVp2F7Ih54k6fv5uWU7UKMVq6t
 EIHEDBHyVEaQL3wQVbyF6J3tK7durH77k8zA8x3bq5OMK0CGPJ2LfjCvKtA4z7oeTF9vfLFTXCJ
 95X3CcsvMvpMV6h/HZpUhqgCrISkahyAQkNXaEUV4vlOm0IF7CvPf9r3KRP4r8noW2GrN7un6eC
 gJVmiBHO3EmYhBYNhIHbqMWp1XoCGITD+pLuMa8m04DS9wzkwi8D9jat2fKMl5/g8OS2qi/7xwh
 nOE6C2meI2UzXHrJGRA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA2OCBTYWx0ZWRfX4pCvlQhJn+tP
 fedwpzoYFglsAh62fLOLIf8wKvMnTmjUJpkkGVc8oXHoANVNG/zcdndiG0cLEI66MaCxoxvbBU6
 4BSo6rbWEWa0bgu/4qqs1prGmifX1LM=
X-Proofpoint-GUID: V_V2ysk_22Dp2O_arpjz6QdKTGBpjRLM
X-Authority-Analysis: v=2.4 cv=EsJHPicA c=1 sm=1 tr=0 ts=6aecbf15 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=U7nrCbtTmkRpXpFmAIza:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=uAUjUfugXiV6-CzwXu8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_04,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1011 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050068

On 03.11.2026 02:52, Sasha Levin wrote:
> The kernel carries more than one code coverage implementation, each
> with its own directory, Kconfig menu, build plumbing and debugfs
> interface. Start consolidating them by moving the existing
> implementations next to each other:
> 
>   kernel/gcov/  -> kernel/coverage/gcov/
>   kernel/kcov.c -> kernel/coverage/kcov.c
> 
> Both are configured from a new "Code coverage" menu in
> kernel/coverage/Kconfig, which is sourced from "Kernel Testing and
> Coverage" where the KCOV options used to live. The gcov options move
> there from "General architecture-dependent options".
> 
> No functional change: the Kconfig symbols and their dependencies are
> unchanged, and so are the per-object compiler flags of kcov.o, which
> move to kernel/coverage/Makefile.
> 
> Signed-off-by: Sasha Levin <sashal@kernel.org>

For the gcov portion:

Reviewed-by: Peter Oberparleiter <oberpar@linux.ibm.com>


-- 
Peter Oberparleiter
Linux on IBM Z Development - IBM Germany R&D
