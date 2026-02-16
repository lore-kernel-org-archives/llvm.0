Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D6C2D7DD9
	for <llvm@lists.linux.dev>; Mon, 16 Feb 2026 11:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771240270; cv=none; b=fzH+5RsL8viAaFjXVEiz6LGsCQ2EC3QD0ryc84EPyDVoyAr+gANyPi3iSCYX4PQEh2pjTmNALLX8xlT1MICuMglQtRVq9W71OssutdZ6PhcnXTwqgukQrz4ujMGiP3LrTwe2FM7iantaQkvw779R1DTAqoiql5DVdwoDXw7jbWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771240270; c=relaxed/simple;
	bh=J0DYmeJ24QNY8XrRGgU17CiiU81oLNvFjXYiWi7LUFE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=I44HkIhfS8dHqGB71vv1bCUCUViiNYHyjY43s/fwyLqH8CnPHbdSOYcf8J3VpOf/J62UpFFxoCv/WhvEhOSZM9MUMIYTJK6dyULgcwjxSo857NWvxFekNEr+G8tFle2QSfCUE20dO0kfRlQ8CNWo6DWs3sUnGxzInLxpiuRNp3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YsPiLX7Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rj+HqSiG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YsPiLX7Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rj+HqSiG"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61G7vpQo1657116
	for <llvm@lists.linux.dev>; Mon, 16 Feb 2026 11:11:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/q9oA4QaAQWaptHrf7SMRhEzRQ+f0+jdW8gtuVDdY2M=; b=YsPiLX7YPqrA9avN
	ngzi1sUCQsH3AMA0BVagNxcOXMm1AOEyYj+Dza58JROu49FU0FDwWqMXf9iiCtsv
	gSGix0V3IC3FHIvGumuXjCXl4SGdfZ43DVGYIy6CBoqeoam5gYCDkwckPbR0Fp4Q
	wjsWc4rQJajSg5vVnbt2b0hhw6hucKhvLIPEE94t/4lOwLO4ZFyJ+hFXinzMwqRh
	kM9JPSr0JYQIvcUZMaHrMYWuNX9e6ICWEgpo20+IgiW+2VUEbYikQR8tpw2m7Hoy
	OD/vaPmQNMQjeA33CJMFIYMkcrRJAV3p81Mp2clNkjSIZpHdoZTpHtZhB/J4Rawg
	9oJOEw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cbfuw1vy7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Mon, 16 Feb 2026 11:11:08 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8960257db65so21324106d6.3
        for <llvm@lists.linux.dev>; Mon, 16 Feb 2026 03:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771240267; x=1771845067; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/q9oA4QaAQWaptHrf7SMRhEzRQ+f0+jdW8gtuVDdY2M=;
        b=Rj+HqSiGRvuKbBzF0yxbdVMJeFfmFJta9utr4iAIsRWUt/lzYagM+Zk0IcvEMPAD61
         ndf4voeppjTmByOQ9Hf7Wbwpmazvggv2zoKk0OPCT3sAin84eu1PSc0qSgwUgjfmJ5rK
         O3HtbQHvHvxFm5q3S9tVNs8cXI511RCONJzExN2rpF8IK1eXr50gU9KWLyBUarWyug7T
         B2pL8AgwxkHFzBtJ9ueMfTxAN8tzJS9+b65G0FnyILPWlyGESS6IGOyuC11IWypWaV34
         8+MUbGLhTOtnlM7DzMDB1kKaNDMVLIeBbjuJeOuXWR+MwfBTik/jFtYLqJ7leo/+mTE7
         ioCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771240267; x=1771845067;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/q9oA4QaAQWaptHrf7SMRhEzRQ+f0+jdW8gtuVDdY2M=;
        b=fDEN7Vypcs++WiQIaok/uLDcnOIDIsdzJQHU315HEcXljSm4T5Ip2WuI3DaEwZUtkG
         9JsVxpZQz5epczSV5AUyJLXgk5dnc/AxMJB1iL9bTjYa7e/SribOq64VwLtpWt0YyT27
         xKvuBahy2p/YOtHntRDLDED2L2pxv58rRpu1QAqVwZYo5xlVdD30Q3yfxEtkiIkbIP9Z
         iZU7zX4IJa4Sv3O0GIt9ANLrlYTsRgMX4GtVH3EnYzyKSJ2maG+F87U/+pbAZIjqPWf/
         IJRY224g/G7Sd3BzgFPkbcKQIkPfeFNXPKQVuk0hSbPO7ih2cjyj2SjaLKCWQbtXsvPt
         pc2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVgSt37FFi9jMOt4bkV0t11DYlAqUuR7vuZa4LcLBi/ExjulhjWyIZfMu7763LZAGZTNMCo@lists.linux.dev
X-Gm-Message-State: AOJu0YxC34JzD+VQbsk+KRdCI9df+9WQ04mSjQ8WF09kZNFdVA//7N+e
	WL/Nf+pW46BrTR296mNLnplUtCYmxIuDBDXA/miaD0tsHUeMl/kqPpH2v5rvvwVFJPHE1mURxQw
	s05Zt4qy1t2x5Ofe8qW9+WDIPDsRkMkAUip5upNP9P7xUrqdRDxBz+5fv
X-Gm-Gg: AZuq6aKimQ02whsGXB2T5Lhk1F+7xqz+f1MsC8OrGsjH7aAAiMlotf5xMHA4Kf7bEVD
	9dIjKHv68g4g2Fsa2Zx2X0XqRtRrDVHUqMfyMrYfTx36y4o3ueTCjbD+B7lhfgAXYih0TfV/N/r
	rNsVPJKCaEgvV0pBQJSRLo0agDYwuImYrkBF0C87uU/6wsNoK/lR4Ztr+OkOSPKXlWSnX2jHENJ
	B8iTj6oIk7Thz1UXyjbdXiG30RYkTICYmSGMVA1FTxsNlUxKYPU+gHMPkhPCIs8BCXMl3oTkYaT
	2ah/1ARnf7gsW2UBLQOwtlxU/+9C3ZGCCg+jWNPLB6clkc1IUqTRBzlfaTbRxhjDIIWRH3OQoS1
	/1qA8SxAoHZfdvw6bN2AdMO5192+jOLAjkyYvgiQ3ORM+gt0VtbD0koBFg/1mbQGHSrg98xfzQ9
	F6/54=
X-Received: by 2002:ac8:574b:0:b0:4f1:b3c0:2ae7 with SMTP id d75a77b69052e-506a6a604damr109372591cf.6.1771240267440;
        Mon, 16 Feb 2026 03:11:07 -0800 (PST)
X-Received: by 2002:ac8:574b:0:b0:4f1:b3c0:2ae7 with SMTP id d75a77b69052e-506a6a604damr109372281cf.6.1771240266816;
        Mon, 16 Feb 2026 03:11:06 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bad4faca4sm1842768a12.33.2026.02.16.03.11.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 03:11:06 -0800 (PST)
Message-ID: <f18d6c73-c701-4ca2-b017-7020559d547c@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 12:11:04 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] firmware: qcom: uefisecapp: Annotate acquiring
 locks for context tracking
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Nathan Chancellor
 <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20260216091525.107935-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20260216091525.107935-5-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260216091525.107935-5-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Jb+xbEKV c=1 sm=1 tr=0 ts=6992fb4c cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=crJP5yZ9KTMbeZK12yIA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: teNEZNi7BTBsTO_bH_mHwnm7nIRHPKB2
X-Proofpoint-GUID: teNEZNi7BTBsTO_bH_mHwnm7nIRHPKB2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA5NSBTYWx0ZWRfXwB5rpyTMd4gL
 pQC8DZxDQm+pPgqvipTnZiNSj1PnupAkWqRl6nT44I/lp4CvI8I1Wk42F/dkqj4Dc4UMM9riVXP
 RU0kUgCPFHg6iBuQLEcLD+7Su1hi/hcPtEKkP6jbXaHdcST4yipoURZVt1tBDNVKGH5unJHbORv
 KDMMHcKopnU+oLJRPeuT6wKFGuaKwarZbC3JrP7OEKSi8vMklVYRdluLwQrvcWturlp4PBgCup5
 pOjQBAIy4lBHeTY2XIZUECfpxGOY64rBRHdYaWMrvWB3RgeZSpVjgGcvFScif2g6RIJohstmRVC
 pseE5keYIU/gi99/d9oZ/7UGu73oETxRXLfKppaGQ8/OU2SoYYp7rpIGO2l/a98i9Z8yb4Q164z
 zcnrMIQ1PwMuIZNi0tkN2pEOPkkhXdPS7Y2rLMF4sxQOBDng6EbZEJlv6JWEOqoaYorNENr1TTH
 1K+y9thq7ibUM/wJwyw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602160095

On 2/16/26 10:15 AM, Krzysztof Kozlowski wrote:
> qcuefi_acquire() and qcuefi_release() end with mutex locked or unlocked
> respectively, so annotate them so the lock usage will be tracked by
> context tracking tools.
> 
> Note that mutex is tracked since commit 370f0a345a70 ("locking/mutex:
> Support Clang's context analysis").
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
