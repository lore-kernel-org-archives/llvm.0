Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7363AD52F
	for <llvm@lists.linux.dev>; Thu,  9 Jul 2026 06:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783576856; cv=none; b=huvkx0KmqLO1K06KBEOxtnnOAvRmPx41Nfd8VBJqdqsFl/Qgv3Z7H7gpnYGmtuJ8Z9TzMVY0VunGz8sfeofR24QhJldTMKOs09GB2xCdGITz4ISgmzxYTXpruP/eRmmN5rikIkb9VSEA4uR8d2Y3Gqht0vzYrfpI9LyXfqqEE/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783576856; c=relaxed/simple;
	bh=5nscPwX+QBE3+L168zdBk+oK5GIau4rERy1JEcTH5Kc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mofs18a6Bm8uwD0yUGPYzWAb5hW6fXELeJfZXnKpjYialpFtVafMaGPx6/qkmQDXy23qGzrvDLip3/d0TQx0pX4RMzG6Zmoeh5eXNcteIRbOxdow0YfXe4b5uGDqaWh6Lx+297KfF4WjXF7pwXlI33z50iPNUjTkhfSCAQCmQ28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=SM++qNyD; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="SM++qNyD"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668NIuAn664270;
	Thu, 9 Jul 2026 06:00:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=5nscPw
	X+QBE3+L168zdBk+oK5GIau4rERy1JEcTH5Kc=; b=SM++qNyDSgsRM64Dxm1j0n
	MSbyWmTmA2NJ5FW+pjHTFC6wvMXOH8FWWO/oJIHhJtUq6sB1ihzhOTl0qBAViGn6
	0OHyYb4bBEmuYSBWD5rTqIBvaeCFEB5NLw1XO9IuSTEvvTryNdLEFjE3ditG74rs
	57rLE484aHdTg5taUPghYlzudOHWYnJnPfeUeNIquPFpzWoS0j69ZftoIPMTk3l9
	gJ0rHeBP9ZyqrG/iOmZEE+Sb+z6/16wWx+PG/a/ARFfIZ7z2N5Ai9Z5HRlNfY3iX
	XsqREzvlTqI/8YlGHFCVDTrqz5yMZ8ueukUnrMBYirNtgYIxQ0tqSP9mWlaoUx+A
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f6qknqq5e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jul 2026 06:00:32 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 6695ndPb024329;
	Thu, 9 Jul 2026 06:00:31 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4f7cvwby67-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jul 2026 06:00:31 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 66960UrH17105624
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 9 Jul 2026 06:00:30 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B16AE58067;
	Thu,  9 Jul 2026 06:00:30 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5F1EE58065;
	Thu,  9 Jul 2026 06:00:16 +0000 (GMT)
Received: from [9.43.70.67] (unknown [9.43.70.67])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  9 Jul 2026 06:00:15 +0000 (GMT)
Message-ID: <4bd57d71-2cdc-4ae3-9eff-945fb0edb74b@linux.ibm.com>
Date: Thu, 9 Jul 2026 11:30:14 +0530
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V16 4/7] rust/powerpc: Set min rustc version for powerpc
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
Cc: mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org,
        peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com,
        aliceryhl@google.com, rostedt@goodmis.org, ardb@kernel.org,
        ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net,
        bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
        tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org,
        nick.desaulniers+lkml@gmail.com, morbo@google.com,
        justinstitt@google.com, daniel.almeida@collabora.com,
        acourbot@nvidia.com, fujita.tomonori@gmail.com,
        gregkh@linuxfoundation.org, prafulrai522@gmail.com, tamird@kernel.org,
        kees@kernel.org, lyude@redhat.com, airlied@gmail.com,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
References: <20260520064630.1785283-1-mkchauras@gmail.com>
 <20260520064630.1785283-5-mkchauras@gmail.com>
 <CANiq72nPOMkZXpMpwTLFg4xjFfmyf_O_x2FN_nrNBsxeNu178Q@mail.gmail.com>
 <ahVb4k-2rC4EYZF9@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <aj4gAdy2siBxONpo@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <CANiq72=EVsTFkQK3LWrT2Gs5UKKViemGkv1WuitY6NOEtvcsNg@mail.gmail.com>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <CANiq72=EVsTFkQK3LWrT2Gs5UKKViemGkv1WuitY6NOEtvcsNg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=Q/XiJY2a c=1 sm=1 tr=0 ts=6a4f3900 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=pGLkceISAAAA:8
 a=23NikzbM9C8rY62k8fIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10
X-Proofpoint-GUID: _SaeDxNIE02BJt3YkY-uXHnHHwHe2RaZ
X-Proofpoint-ORIG-GUID: 0sOmipDoSe6tZBwDMnvpvQCQGXHPcvI7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA1MiBTYWx0ZWRfX0KY0He5smy42
 9DJjVB7QwkL6NJ5foy1w5puyElflmtWB9isNc3XaCFT6aDcFfCop+3KpjR2sa7kga2N0FYXrmpH
 8S6DTTRDvtZwVvhqFJFwOPyCMxK0iWk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA1MiBTYWx0ZWRfXz3pdC9Iqa3BP
 aqY0u/JLbKvwaMYrrBh6JSB6IXurw53zL53STlP0MR2WVKmjkRTVttAt5ikS+EnczTI4+CsseDf
 WoZ9uc3eelbRAAGIHhs4TsNSrTaDVd5kzNOivTXq0tTY9j1LpV23aSrvqeDyMGQiC9lvZSJLrM/
 1eDoJzLA3q9OJ31/f1RZ7+mk2KhMjcV3QInyaZXCJL2efqNAvY1qIEFuBKRZm+K/gpepLnuEBGD
 QlWy1QXlpfgfpku63lIdUIryydKWNaShadIs56vLnTKURVaY4h9u9uD1TZap5nDfDrWJdL7xx09
 43Y36uoTEQq/GDVo7scj8L0wIiKgEzlrP/Xwp2u1gzAVKFPCYHsYr3wzZMeBcuyTja/pV6ie46j
 Uqt2ZVFFKhCvsI7DwSBrdCEWwcS4wfOOb/u6XIuRD8ffIQqo6aNMwG49RZypwOnwZntI4OhEmDH
 G8pSfMGAW+x8WzmmFIA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_05,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 clxscore=1011 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090052


On 6/26/26 3:47 PM, Miguel Ojeda wrote:
> On Fri, Jun 26, 2026 at 8:50 AM Mukesh Kumar Chaurasiya
> <mkchauras@gmail.com> wrote:
>> This corresponds to a floating point instruction. Although we have
>> disabled fpu, vsx and altivec we are still generating these. Seems like
>> we have some issue with the rustc here. I didn't dive deeper into this.
>>
>> Is it ok if we keep 1.95 as base for powerpc64le?
> It may be that it is generated but unused (we have that issue
> elsewhere -- see e.g. `rust/compiler_builtins.rs`).
>
> Having said that, if 1.95 is fine for the powerpc arch maintainers,
> then that is fine (s390 also used a higher minimum -- please see the
> recent change in `scripts/min-tool-version.sh`).
Missed to response here. Yes I think 1.95 is fine and have requested
to post a v17 which is already done. Will pull that for the -next

Maddy
