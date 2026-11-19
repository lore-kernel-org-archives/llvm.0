Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795102176;
	b=Nok/4VxEKST2cGSOEX4tinMTc0SGwWjcbLmE59OZBI4O1hl44DosnxrX+AWg4VUdqfI0
	 ow1JO/ipnAfN33KjA0hyHH0y9mze4YSzqqyrni+wv7ZBSt0Sy/8SyfhXSwYoQJ5eaX8M4
	 +i1MOBIHqFW3mqyeiPsBXpZZmnsDm0XEURz+JuR6XCFbqew1h1WZjj5ljcxWPKn4T+X6M
	 wFvwnBqwvmIeDxv6XwaigS4kH7Oq3JwVvYaB/aOrOoP0UBa60i75sEpOTCpNF5nHVkB/g
	 s8qHxLydHkiuLZNMzNveprGIdnpWG7aWz4bDF3BB/eiZ6cxl58q/uxbHLaPwQ1wcx9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102176;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=v5cUsGgc+atAsF5stV5tV/fIiIx8O+mmL+wOysOWcic=;
	b=2sc9HZmCI7ifJCtjHNCNRCcklav/UcdPv/jxVxHiNXwydpkSxcou+GxSO319iW4KlDU1
	 gCPgzrmixNsd7pEXyHL76poQ1CIBoETcnMzIznUvB0K9vrr0t5f6d5xDl5Mf1kytcavSp
	 NdAL1WAAyQ8BZ1uhK10n3eQ1hyHGfBMEi6Y3hRtBXDfFtBH2aOaw+nJSXjgxW8XvFvpop
	 /x1alg1062kAWxDdN4XycTaPQeTlviUzznpj3b1OBCidO9KYngHrTufAGlE1xeLH6ecbm
	 Hd6xaF5g7L007jTqpCXaCPNyBQHoKVY21JTxC866jXBF9WTrpSqHPLA6iMGJkJitSSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mcy8kg0A;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ffRyz3RF;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8C0606A326
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 15:29:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF8C0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mcy8kg0A;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ffRyz3RF
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJF75dZ525391
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 15:29:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v5cUsGgc+atAsF5stV5tV/fIiIx8O+mmL+wOysOWcic=; b=Mcy8kg0AvoJ3OPld
	Ex82XNuYnDZkpq51FRzaSYsHthFTnGXSbbon2T8F7z4rRN4UTNxSt5YSoN/WGNEG
	iR+8j6IlxUnmDIGH/ZkCAXVHXtRloclejs1HFLJ/Xr51CQsHPv1EZD1bSDkP9LiP
	vVaAObiYsd+h21SVW1i5HyB6DMjJcFCc0qlcpNQdwX+8trN1b+nygddRgk1GZPmn
	7o3ncUQsL2uePn7K5v4DV/EVjXmpATLKA2Br27RioiAa/hXvUIbffUpUeCUcSX0F
	IXavOUXfw6l17o7CXVL1q7We8ckhy3z0k+i9wE8Rom5VpV16IzTwD28yeIUkmLdN
	93Dq5Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1vv2sxpj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 15:29:34 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-55d2bde4c78so39668241cf.1
        for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 07:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795102174; x=1795706974; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v5cUsGgc+atAsF5stV5tV/fIiIx8O+mmL+wOysOWcic=;
        b=ffRyz3RFEOjd6nvXfCID1TP/lDGsHAhvI3FCuK7oCHJrJdgfdNOjBXQSnZQdGF+Cl/
         TokGOYgqkd6W6adYhEJkOr+UD+XBTLChk2uKWwrIKLUd9EeVxfDNlUL9fCOkFgurrlp7
         Dr5twEQbMrc2BSgbmrauzPcstA7B5vPhBevEZk4EwxyXnOdgix9qcR8nyAuWpA6DWS+m
         d12S+E5xkq+IuYChLp1noeQYJj+stky2uuqbJCOCyrM23VbRpXvZblaYgzLZxRqdesZk
         B6B/pP6kZD3ZYaCSxzRyVBGEbGb8AS0ojJM8dJzow5fGABDbk/FL5mpjIkSAlQkAZ+kp
         lJ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795102174; x=1795706974;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v5cUsGgc+atAsF5stV5tV/fIiIx8O+mmL+wOysOWcic=;
        b=b7/MzLpuGeDS4Xs0Wk9qtrQCIPxxgUkS1GdFVpHlJJ7fJ9mlwDcx3pmKbFF2GRRQIz
         07Sebs+NtLaaR4pa8b46mXQ+3gPzOtSKGTdSxyUwLw4yFYVIAd7ritLkk5OGl1qFTGlj
         ha8yHcS0dC5uKR5HV6Cunbk6bn2y9zBKqc1fBz4uRwA3E83ExXLzw7N0Wkqc21qxBPcx
         MAlVfYuivMHrgwPSlZ1qPFGuH5VT0v4GkqgIxF2jNq0950O2XfCHU4v6tMCjVx+l68nx
         53oLdOFUSe1LlrjsNvhFzvf0X45ZnZCyct3vCEXR0wems2FbRYdmjRDub+tjRc8WFcAH
         OS8w==
X-Forwarded-Encrypted: i=1; AL+hErHbA/RRLuY1J8Sbtlpt40njefCjSZ0CkIDWYGz+x4KWG0NVWHDdcBtj9PgFSYYeLTXsGY6Q@lists.linux.dev
X-Gm-Message-State: APuU4Z/tIfq/QASRDqcdcw31SuBB6FRzHGhnsCw1xtobjRAYQIngjxsb
	8p8cGPA36Yfd/0hTDkNH/Z9ZqJlNQxK5mbmI9ySckn1SKTD3xqkt4bKzOQaP3xqlVDyagt/R54m
	mVDqWUc0hQbqeSdAPwUkzeevlDdX6shrFdH+KR3HttmgAhbfWfdmiS/7j
X-Gm-Gg: AYBFou0XbnenqIXvNcsSKwm0zhxAUFIuJM1EGE6QEaDaZ+tFbJHKFWNDb5N7CPZ4G7k
	ex7dad+D3HOvXKvqKO9IKYbhXXGmQ4EIHzzZx5W+Mawwm6mCiuLbVH7BZ02byHOB4huriS49CSI
	tf8Pta7oMlTvCHEvpcOJpK62v/p4lY4xqZoeBDKO9f3dQ/jFHIOdnHvKEd/8qC7JIPmA8mQutjp
	8hqsqhzQKNP6UD20yqL6NyLKpcYZChsZ6B109XIxOErKPMuzN8kH4H0J4hJOFgwUgS+Q6I0eYSm
	OvTeGYd9SAtuYExrbo9xhreMQgAm83jojGJEPmnX2nTm1d6qkpGo9Zt/g9/mFHsIp09ChZWGnFP
	cjQaag3YLD787L8G1AWqEbMJphNhWG6RkUlZl2ITr1dbC6KftzZfllcY3i9Lm2j+z6hlSNfPVxg
	0nZdQjcfZhAJOu/r/JiehJWtxBbdpx7quJ7vD/hQ==
X-Received: by 2002:ac8:5d08:0:b0:55b:9d8d:f299 with SMTP id d75a77b69052e-55d769e8964mr4142411cf.21.1795102173809;
        Thu, 19 Nov 2026 07:29:33 -0800 (PST)
X-Received: by 2002:ac8:5d08:0:b0:55b:9d8d:f299 with SMTP id d75a77b69052e-55d769e8964mr4141931cf.21.1795102173243;
        Thu, 19 Nov 2026 07:29:33 -0800 (PST)
Received: from [10.222.168.147] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134048a4csm1356346d6.37.2026.11.19.07.29.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 07:29:32 -0800 (PST)
Message-ID: <93431e17-4d61-465e-8499-e8270fb03a3d@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 09:29:28 -0600
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
Subject: Re: hexagon: allmodconfig does not link with LLVM 17 and 18
To: Tzu-Ching Yang <shingekinocore@gmail.com>, Brian Cain <bcain@kernel.org>
Cc: linux-hexagon@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
        llvm@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20261119054908.2988120-1-shingekinocore@gmail.com>
Content-Language: en-US
From: Brian Cain <brian.cain@oss.qualcomm.com>
In-Reply-To: <20261119054908.2988120-1-shingekinocore@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: TUEkM_7yhSHmnwTDaoaxlFkOlQgIXApu
X-Proofpoint-ORIG-GUID: TUEkM_7yhSHmnwTDaoaxlFkOlQgIXApu
X-Authority-Analysis: v=2.4 cv=ZZWIpcVA c=1 sm=1 tr=0 ts=6aff15de cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=aYQzck3Sp6WxtQezg1cA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA2MSBTYWx0ZWRfX4FjutAnH+tT8
 jW+nVYc3e0CxOplkW4yQJGuvMH+BcEYEFQ9xBc5wZhok8fTobN6h2W4RvcYtfLuYiVBE/dW/Pqb
 mvRUAJJUO/phss3AgG533X5EiOGmEOw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA2MSBTYWx0ZWRfX87E8+BiYHg4J
 muxaWPiHMhq6n1hyQLTy3Arwz3/0crCrnTfAgYEutHCKabYnktJyezWU6sjSy2UH0cf5pQQ3BXE
 Q363MLStv3MjizpDq9VWMEbW0jksfjn5++etKysXWmDSjNQuUn7QnpxXm0IjE+c1rtABLbdKMQZ
 eNuomNrRe5Lvo+ZkiKvA/j9rQaBTsHX20zj5wCqb/UrcBZrb1X9pzXJ3/HVK2UU+qmlk5hda1Ro
 VZlIodGpxe85sic8dLXzTJZn9L5fVefGz1ZYiLxWr3WJuPKq2XqvTosZPWOoNNAtiNRfRgxvnT9
 N2P8c//AZoBaOS3hWzLK7EVHCLLzVG3xA0c4Tu3ukO7BuwVd2vn3bbn4wKVgN7od0Co0d3cI/ef
 8/Bf3udt6SAqoS1XU46UxWT829K9qYbKc29I8MQNSBkprKspJAWDxzJMJ/Wjm3cuf0/9PffFhXJ
 +biIVO3rX9nu5BW0cOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190061


On 11/18/2026 11:49 PM, Tzu-Ching Yang wrote:
> Hi Brian,
>
> hexagon allmodconfig does not link with LLVM 17 and 18, on mainline
> and on stable. Your hexagon-qemu-virt branch has the fix, 09df35bd9d9f
> ("hexagon: constant-extend head.S calls to out-of-file symbols");
> could it go to hexagon-fixes, with Cc: stable?
>
> With CONFIG_WERROR=n, LLVM 17.0.1 (the minimum the kernel supports)
> and 18.1.8 fail with:
>
>    ld.lld: error: vmlinux.a(arch/hexagon/kernel/head.o):
>    (.init.text+0xd4): relocation R_HEX_B22_PCREL out of range: 2242552
>    is not in [-2097152, 2097151]; references '__vmnewmap'
>
> and the same for the second call to __vmnewmap and for the calls to
> __vmsetvec and memset. I see it on v7.4-rc1, next-20261113,
> hexagon-fixes (0304683b4c43) and v7.3.4; v6.18.63 (LTS) fails with
> LLVM 17.0.1 only. With LLVM 19.1.7 to 23.1.3, v7.4-rc1 links.
>
> The calls in stext go from .init.text to .text, across the rest of
> .init.text and the per-CPU data. On v7.4-rc1 with LLVM 17.0.1 that is
> 2.14 MiB; without CONFIG_LOCK_STAT, whose per-CPU data lies in
> between, it is 0.76 MiB. ld.lld before 19.1.5 checks R_HEX_B22_PCREL
> against 2 MiB instead of 8 MiB, which llvm-project 64e3466fd09e fixed.
>
> 09df35bd9d9f does not apply to the trees above: its context has the
> "r2 = #VM_TLB_INVALIDATE_TRUE" lines of your series. With its five
> changes made by hand:
>
> - allmodconfig links with LLVM 17.0.1 and 18.1.8 on all five trees,
>    and allyesconfig of v7.4-rc1 with LLVM 18.1.8, which failed too;
> - where v7.4-rc1 linked before (defconfig with LLVM 17.0.1 to 23.1.3,
>    allmodconfig with LLVM 19.1.7 to 23.1.3), vmlinux differs only in
>    the code of stext, in the address of one local label and in the
>    build ID.
>
> Those trees do not boot in QEMU, so I boot-tested your branch
> (dc370baa041d, v7.3-rc1 plus 24 patches), with 3 MiB of test-only
> padding at the end of head.S to make the extended calls span over
> 3 MiB: qemu_defconfig built with LLVM 17.0.1 and 23.1.3 boots to a
> shell on a buildroot root filesystem under qualcomm/qemu hex-next with
> -M virt,hvm=on. I have no hexagon hardware.
>
> Rebased onto hexagon-fixes, 09df35bd9d9f applies to v7.3.4 and
> v6.18.63 unchanged; I can send the rebased patch if that is easier.

If you would do that, that would be great - thanks.


> If it helps:
>
> Tested-by: Tzu-Ching Yang <shingekinocore@gmail.com>
>
> Nathan, once the fix is merged, the ClangBuiltLinux CI could build
> hexagon allmodconfig with LLVM 17 and 18 again (disabled in
> continuous-integration2 d9d773a8859c).
>
> Thanks,
> Tzu-Ching
