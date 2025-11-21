Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968D32FA0F5
	for <llvm@lists.linux.dev>; Fri, 21 Nov 2025 04:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763700252; cv=none; b=poQJ3GKG3iIdGVZaRc4z+ZHITtxdosLIDfD31mZK340YaoYNmNfJGRmfYudjSIA/BkmjOWnywhmgLsdTFDENMXjrkzVjcDBBhGuASnATzC4zI5lHpPPlEL0gj2HWob4kpGXVRWYr91nFtU0Ur37TzbawMC/NlnUhl7FsWaMPjUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763700252; c=relaxed/simple;
	bh=OBx3YFOZW6txQ/YnCHF7sGkuw9QAIKmgkewmR/yI6MI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J8QyMfHdWpWHkiu3WOgCFS6QyIAPtR5ncWb/iZ3dF4+O/sWuRIcs0d2QwIv9y6tZXNL5dUM1JMVmE9hD+AmQ2tbtYOob2SfuHUZXQJzHsCbYQ5LKTFCUasGpiJXDoE63WfZhc+WILQXq0aRcX3yGW0bNsOh5aYBSGIcbUddfKrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Ndtj7gHo; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Ndtj7gHo"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AL10KJT003780;
	Fri, 21 Nov 2025 04:43:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=l5GT72
	r9PF65TkFI1rDbAAt3PP+dUyyYqVUfs3T5mLY=; b=Ndtj7gHo+f4YXGqwWN1u2s
	Sra2qyesvfH1L618K0qJ754VV9TciqcrNA4sFMW8Fu+zD14pEFKH8nZRC0IN5wqb
	Y5wOMiM3x5g3UIkacefgCbzXVS+rXIrnvGeCTO+HN1CvRnKZG8EIFnIrEXglW6vW
	q0zFfEC5JjrDP3rlkX9WCqiYKdSu8Y0vlZgyQgjdpVgnC2KKQ/fOR2051dz2IRJj
	0RLnpuCv+mf2Aa4bgWkjCZzbJ0H0+VcrWh2pQWedcDAGBLlWNGMTHIZoH55kfCO9
	aDMFvX2bd+Bmj7xWY1dM5/HJY8CFob2ZGaHlKwTpDJFRjb2npQdYPuMbNf2Zn7kw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejju8fkq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Nov 2025 04:43:56 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AL4huuq005219;
	Fri, 21 Nov 2025 04:43:56 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejju8fkm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Nov 2025 04:43:56 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AL3eWHk030854;
	Fri, 21 Nov 2025 04:43:55 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4af47yaex3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Nov 2025 04:43:55 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AL4hqQp33423850
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Nov 2025 04:43:53 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5535720183;
	Fri, 21 Nov 2025 02:54:29 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D8D5220181;
	Fri, 21 Nov 2025 02:54:26 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.in.ibm.com (unknown [9.98.111.108])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 21 Nov 2025 02:54:26 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
        Vishal Chourasia <vishalc@linux.ibm.com>
Subject: Re: [PATCH] powerpc/vmlinux.lds: Drop .interp description
Date: Fri, 21 Nov 2025 08:23:55 +0530
Message-ID: <176369324784.72695.8475161183208502658.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251018-ppc-fix-lld-interp-v1-1-a083de6dccc9@kernel.org>
References: <20251018-ppc-fix-lld-interp-v1-1-a083de6dccc9@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: weDNrWPE5GwdJ02mfM0sw4npK-bhQ94E
X-Proofpoint-ORIG-GUID: pKQhFi8wlrbKyT8QCg9KhK_AlWQgUwYE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfX+i/Y8g037IQ2
 8yatE7kPHv4OLtErN+JBS6D9JS1gfzl7QDeer8soWjqfFpyMmqZCkFp9h9FPk48ncYPFDyV1efr
 UAmzFKORHoEEvnMS5SmmZyLMabOLlImr5DVxQR2v95CXD8i5M8B6M3jZyottOsEuidjBJFOu3At
 TpbzUQmW5LgbdAPylC4Sul2zNvwQUxQnprpgvVvhPbTFRu6XAMc1z4BEY0gg7r0b6hxZAR6ypDv
 AH/dlBwd51JaTzYAVXsK2T/FOo4ubKM/Skh+atGNHyS22CjoZbJ6mcnV40SNOL//3SP7HkZF9Ac
 iEOTegNzFKu/U0oVZ7rYf8CBgiaD7poGeuwZp8UZ/SW4a5OtQH4ktE0VvQrCUgCUDYIDN48lj3j
 PsKqn8IBKmlOOC8AxOqrHJTImOqZUg==
X-Authority-Analysis: v=2.4 cv=SvOdKfO0 c=1 sm=1 tr=0 ts=691fee0c cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=TpqdtDXgHxVRMqyoC-YA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_01,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 clxscore=1015
 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2511150032

On Sat, 18 Oct 2025 18:52:40 +0100, Nathan Chancellor wrote:
> Commit da30705c4621 ("arch/powerpc: Remove .interp section in vmlinux")
> intended to drop the .interp section from vmlinux but even with this
> change, relocatable kernels linked with ld.lld contain an empty .interp
> section, which ends up causing crashes in GDB [1].
> 
>   $ make -skj"$(nproc)" ARCH=powerpc LLVM=1 clean pseries_le_defconfig vmlinux
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/vmlinux.lds: Drop .interp description
      https://git.kernel.org/powerpc/c/d2be62d5858312f3e6c36dbfc43faa1f287d5249

Thanks
