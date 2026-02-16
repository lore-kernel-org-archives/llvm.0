Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50BB276050
	for <llvm@lists.linux.dev>; Mon, 16 Feb 2026 11:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771240212; cv=none; b=WG9TCuwb2QHFJ6rfyPs/Y0INn5AvjKKzqgU5Tt7tE7+olVGVnoFNr8WiIxNywA+QNEoPjxCLGlolnqCUToYoxE8iAUlC9XP9zOVLExUOnmdkvSfvWfG7cRFhphwvR0U2f0aC7iWBaAxfrWHlprj+jxE4M1aGFWc3bnO+2gGPrHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771240212; c=relaxed/simple;
	bh=g7dP+8lfwb/lT6YzqLD3i4VHeMrHGPAqez2+4PwA2r0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=IFuKqgs0bWH5UZZFvRWP0rAqmjbkVEkeSn3NRZ2JpHVsb+1Tw7DutnQWX8AvLfIzvs/eDoaDBk8OgRx1CBEq7MtllTe6PoKGTjoU1OnQaFDtSa1ZWXGLGC2RrxVSL8BPdEr69Yei8bE/0mUWGS34mxJy94NABmg6kGewnNzOwfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cF7npTWV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=apZkDBAb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cF7npTWV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="apZkDBAb"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GARsBG2068611
	for <llvm@lists.linux.dev>; Mon, 16 Feb 2026 11:10:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qv+KamAOdFvslDTauIv8lJA6oKf+reuje9OpvNUDuQI=; b=cF7npTWVaMLA7hgJ
	+VgnQC/Du9POpXv9zPB4nNsNnBr4BTsq+N/RzEBrcN/9+Vb1dX3spaWZUlLGKr+M
	0w1XVF3i/okn0I8O0wixnaAnDcwcxv3v7/bTk2FwthPbjq8/ofFgTJNXlKWIc747
	r9FTevk4Fe72tydjoqZuqUQ1cr9bjfP2eUqtDarM1MoQ6d71Us1y3z5YzzVtPzpm
	4flGmvZneHlzcPXR1duArp95XBceUbB2u91vwEhTZCWNbOnatkSxha7Yf0jLOqM/
	vXkdQoxTsF6+aFN+sV9aZq4SveT2iowRy0hoPWUaDazC93GT/8CJagTy32cFcaA4
	MgOh8g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cagcf4c9e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Mon, 16 Feb 2026 11:10:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c710279d57so216661685a.3
        for <llvm@lists.linux.dev>; Mon, 16 Feb 2026 03:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771240210; x=1771845010; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qv+KamAOdFvslDTauIv8lJA6oKf+reuje9OpvNUDuQI=;
        b=apZkDBAbsWDoyyJFf1186BOzrPnQeoTVhDeo/1jysMJmgK6lvZ+5UrChZFwG23s8t5
         ev7VTvcOCWHM2ul1boLYjDYo5vhn8xQRUYq+vntreVUJjAgxhXuuVObcR4Eru+/hdH6v
         Z5j4eYYoQtICQHvYf/E44vHrrxeG4VgY7RW8t30d6possiL7WwcA/mNqzTqjyDjT3+MH
         IlG1uWo2HO0Uu5OZ9EX60EPr/eg9kXS2PS6nUNT8xq19zEDtZ/j3TZz9o1NXpDOZbDmq
         7/BXQ2/g7LD6h6nfQpfx1mbBypbqxUMC2nZLRCxWlHWiGh+6MWLTDtsX4GVbodMjz0S7
         dfpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771240210; x=1771845010;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qv+KamAOdFvslDTauIv8lJA6oKf+reuje9OpvNUDuQI=;
        b=ZGe/EDEbc1gFlcCLmM3XxP0oWYZzqytjonopvXDfBk5m7zwaGjCsVTtXPetsjpaNR8
         ggMR/0WIItC5NbiIx0QRJ4xQrEGMLfesfdRKknqht8XtAr7SruXJwIshTf67M4GfKL7H
         Fw1U6oicph2N+wHoNpKYbdMTthJ1kVsVkQXu68U+kuWfjkWFvFLrX0hsbWFkmJeCf9XX
         Bc1/kvNnlKHvuWtW7rM4ooEtFR6j2+9LgRBE4Akg/JR+chfKUGbtAn9ZoMRnIlE3Q9hm
         6zzecmog06vjjkk9hYYttg8RzIMUhcek9LnAJGhXn/uv8OAOx+Kcv2RRh98KD7lP1gEa
         MOFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVeMrXZrO9SFQ7imKHAsDDuE2+apYCVCaHjZHma0HDaxif2aooS8XTWha7q9PRnxzG6QypS@lists.linux.dev
X-Gm-Message-State: AOJu0Yzfryx1UjwVUWSBpS4J4MRQym+m50W8dohijVQYA4BCxQGEhg4o
	/V1Ecud5uNIjzXtBT5srKY+ar4Ta4zaD/GHsUEiCna4t93kbE2eLqQoFsOUlUD0eeYcYzcixvsU
	enz0GVePzNnCiDdvYnEatlSqBo4XPxKlJWKIPIqq3W26usWAK0D/LAMT/D+ZlZ+Zb
X-Gm-Gg: AZuq6aL340Lb5OFiSKKIShkBsbLEFNWDIL1yRy3mig9HK2rriqI0t1VtyU0qiR8p+qF
	LvneaP2xGwR2wsA9pLjc/UMrrMaHwV9PzHyrJGDmRs7y6f3N7pUAOqAC6RW4mF2xDq8fTApjxJy
	HDc4rlw/YtkoClx2K/l41Pj6P+j6MlA5uHv3bZOfajP2coxXDRlfQilpB6nGr/j4evTGY9649tQ
	s41hhY6QvCzzdt7u58H71uC7ajnHUNQG6xWBu6C2ys9tw4SxL1Wp+roIM9umszyYqxH5shOjpRU
	EWEGtWBm0mA+Pz0jhYVu18uLsbHGAa7UDf5LMlJ1haojKy5YICZx5JmLL7wxlKyXDFmCHy8RNEF
	vLaFPG9270YH+R9c1xI08w+LNFkR28GKlmshJtBxtDfUiphgP09oYl2Iz4VnJcz/9V07OCs+qFx
	yejeY=
X-Received: by 2002:a05:620a:2905:b0:8c7:1aea:53b7 with SMTP id af79cd13be357-8cb408ccb63mr995466685a.9.1771240210064;
        Mon, 16 Feb 2026 03:10:10 -0800 (PST)
X-Received: by 2002:a05:620a:2905:b0:8c7:1aea:53b7 with SMTP id af79cd13be357-8cb408ccb63mr995463785a.9.1771240209609;
        Mon, 16 Feb 2026 03:10:09 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc762b672sm250474766b.41.2026.02.16.03.10.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 03:10:09 -0800 (PST)
Message-ID: <5da70eae-a419-4490-87eb-8c61338e3e0f@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 12:10:07 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] firmware: qcom: uefisecapp: Simplify mutex with
 guard
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260216091525.107935-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: qoGMnTMImplqv7jK6QBM4OL8DykD5LQ_
X-Proofpoint-ORIG-GUID: qoGMnTMImplqv7jK6QBM4OL8DykD5LQ_
X-Authority-Analysis: v=2.4 cv=Sc76t/Ru c=1 sm=1 tr=0 ts=6992fb12 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=ELWE7tHOECisB7dOq5gA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA5NCBTYWx0ZWRfX8upWU/EdEfHv
 95VI/6cZl6LVc1uiJIbh2wyCEl0cEeMOgdh6mPEC6sKUelj79eXDs5CqLJPnWxrFKfHG37qNVqg
 qv9M6in3sG3es7MySyVuJOrw1FfW3DytasYjRa8ZPxm90HDciqUdhyCO3y5onb7w8Mw8hjVR6s5
 r+iHqbJyVA5ulYE/jnjR29LN7bViv46wBGUi8X5pzZFS1cGa1SSb2YLmhpTltB07a727RS8ZZwb
 AlrIEzptcyle1lh6OqFgLTO828BfuEMWz+5AY7qfzZE0XO9veYdDyD6JJRNOWZq65qqegjAsdhD
 0wYhDIf9MI7Xs/PyS3FDu3fEkCbUBtLQU1iTpNesF9mtiosE/nTn89SzXPlPlvuKqkmsNHdgBL/
 kHG8ELNi4ZAin+6nb/ISBT68pAYBs7xbTRLfRE0WklKuo5sjLxXCDOnNHUmvA0xNzpXj4mw8tbS
 2zrb79PUmk2LLev03jA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160094

On 2/16/26 10:15 AM, Krzysztof Kozlowski wrote:
> Simplify error path unlocking mutex with the guard.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Changes in v2:
> None
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
