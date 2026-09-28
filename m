Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70ED8489FB9;
	Mon, 28 Sep 2026 09:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790586310; cv=none; b=XhNwTMafT5E3MfRG5NCi3jtl+hTQiJ9tlacY/Ud8kZijyiIOICnqMfu4Z4kZ0Y3ojumRsFA+GZWXyiOROMLsa2GqssnQX0dvzeH1xj9IftWbxTqSURsx2NFa0hio00oQTMVr6ZuDBaQrUP0aBgBZAW2ZQaL6UrmLLvhPTqd+ThM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790586310; c=relaxed/simple;
	bh=vNtEj+ubrWxEDvC0iF7iOA826qvz7hqHSStAzP5CaL0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DNtLj0JHoGqr4vo1FIQ7mI7qbK2YRRd3OWQ/a/xJxvZPbGVax7YzGQm/iVhQlDqeLNyVmOGOvyNO7+Xeu2etfFIBsBzF11niyyhr3KXAm/i2/I5Z/CiQvHVgWvi+nh5DPjbl97SEYf1D1LrIzzoviNrBcVQdsZGLIpwLeMpH0LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=gD3v0Vez; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="gD3v0Vez"
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S85O8b2949303;
	Mon, 28 Sep 2026 09:05:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=a4MRcj
	b33bBlwhEko/pqRaFeOUHnAq7kenU5/C+mC2U=; b=gD3v0VezbiesNlyedeScHs
	cCdkehniTw0X/rNng7rBOryIlm8kZkqFGO5DrOkNqGA0FR5mZbbKGmJaQ9NGtId7
	z1BmCCertQpJvFuBcCAZ49Sh4AQjdjchEXko7hp+Q04rNW42z2Bb/6ZoSdiiZj97
	2L5yzq7+wS2g6LL7GCNWnYN/jIAJ9q9o7PTZ0nDBED3sd4A+po6Sn+zDtEEDIcDX
	KKFfn19zjpR5A61kyCp76AyscHEbcLW/wcrg6Nw/ZptoTIH/+TtS9y885ZFprdFZ
	ohQCq7sacCaVBxY4gnauDb1MWduVaRwP14lMl0MJolFZcYpAdpHlT8Z3RwKSJdcA
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gx5qr0ab8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 28 Sep 2026 09:05:06 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 68S82VpF3996662;
	Mon, 28 Sep 2026 09:05:05 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4gxsck4gdt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Sep 2026 09:05:05 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68S953VR41484782
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Sep 2026 09:05:03 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B1BAE20040;
	Mon, 28 Sep 2026 09:05:03 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 606F92004B;
	Mon, 28 Sep 2026 09:05:02 +0000 (GMT)
Received: from [9.124.213.68] (unknown [9.124.213.68])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 28 Sep 2026 09:05:02 +0000 (GMT)
Message-ID: <ae3e35d6-8dfb-43fe-aa69-0a60b51b2f9b@linux.ibm.com>
Date: Mon, 28 Sep 2026 14:35:01 +0530
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linuxppc:next-test 3/13] ld.lld: error: undefined symbol:
 irq_proc_emit_counts
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
References: <202609271531.8kf2NTjK-lkp@intel.com>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <202609271531.8kf2NTjK-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzNiBTYWx0ZWRfXw0llwUiZSEM6
 P3GS2OgSASbdcvMuK80nf7hbtxWSRWKqp0ePMO0HROKq836+5XvvGeHRvcasKxg3NzLsj06AoEV
 ArQVCC7DSeC+qJdNTWTV3piFcNPbukb7roAugS+yonJZCiH8Ar+kj2ZPqmynRvTeYuhvOrTA4Kq
 +s2shqKJ28zJGb+46S6b6unhyDSSQDFePxMgc88zgeLKA/lOEuhcXlgMdR313oBO0rWgToYW90d
 /4WjldLlHiHL2cL5gdPygKRA+I+GKcAQEOsNCbpD8LPCbzmqVse92szaSbpnjxDF+17+7JlIwJ6
 EhGX4V0s8KBKMg7KM7Z0y2B3hukm3wELbXcTKh5pq0WRjuneNst3HTVDcU9Uc8qjasfp3aQk+l5
 I1hVT5pLpGOd8REV5i/IyGGA7k0ybEzAmz179LUnIH2kyla514MnYCa3EK4TwuAJZQ1FWnVam6r
 zlq+maajyaZ5H+75T+Q==
X-Authority-Analysis: v=2.4 cv=SPbXx+vH c=1 sm=1 tr=0 ts=6aba2dc2 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=uAbxVGIbfxUO_5tXvNgY:22 a=NEAV23lmAAAA:8
 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8 a=VwQbUJbxAAAA:8 a=3b4A4PtVvGKcaD17NK0A:9
 a=QEXdDO2ut3YA:10 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-ORIG-GUID: QGBWTX5yOHur_Dix1fvjA1gxRBpDqBUG
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzNiBTYWx0ZWRfXwxgfHoa4ovkn
 bGCOAXKG4jkQAIYEpITLAQFt85zhxnscp10dc6V4MfR+uIUedGoMgcnTMdEgTfcX2munSjFvXnE
 djI35JQoRzfNatcvTfUgZapRd3antNk=
X-Proofpoint-GUID: QGBWTX5yOHur_Dix1fvjA1gxRBpDqBUG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1011 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280036

Thanks for the report.

On 9/27/26 1:12 PM, kernel test robot wrote:
> tree:   https://github.com/linuxppc/linux next-test
> head:   12d238d584ba485a99e02e033746100fc7099184
> commit: fbb22ceaaf8f9c6786e6ff5da1962fe6ac0fc904 [3/13] powerpc/irq: Make irqstats array based
> config: powerpc64-randconfig-1001-20260927 (https://download.01.org/0day-ci/archive/20260927/202609271531.8kf2NTjK-lkp@intel.com/config)
> compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260927/202609271531.8kf2NTjK-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202609271531.8kf2NTjK-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>>> ld.lld: error: undefined symbol: irq_proc_emit_counts
>     >>> referenced by irq.c:116 (arch/powerpc/kernel/irq.c:116)
>     >>>               arch/powerpc/kernel/irq.o:(arch_show_interrupts) in archive vmlinux.a
>     >>> referenced by irq.c:116 (arch/powerpc/kernel/irq.c:116)
>     >>>               arch/powerpc/kernel/irq.o:(arch_show_interrupts) in archive vmlinux.a
>     >>> referenced by irq.c:116 (arch/powerpc/kernel/irq.c:116)
>     >>>               arch/powerpc/kernel/irq.o:(arch_show_interrupts) in archive vmlinux.a
>     >>> referenced 5 more times
> 

I believe this happened due to below.
# CONFIG_PROC_FS is not set

Likely fix is gate with it. similar to x86. Will try to recreate and fix it soon.

> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

