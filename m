Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9709530CD91
	for <llvm@lists.linux.dev>; Tue, 26 Aug 2025 21:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756244981; cv=none; b=QAQWKTsPXZ0z2YqRZ5ll6lL4Yoi3M+LVj+6pynxF6oFCl33iL5x12XZOakhqV+qOUdQ3ja8EXCAq8oN/oc4VZWixTMBjne/7xRg7ytDDim/X4p0u6sgK5XkPykPYwcSCj7huqhu+cBMjUIeK3k19gh/3T3xEAXsi2Z66YEy8eMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756244981; c=relaxed/simple;
	bh=m0WVLtEMOLSm9zDk1d3O6jTHTPnftcVbrMs10BE0Kzo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K0l2SsvwUY0H5bf/2L5+qqrAaJyOAbDn/kQCW7ff3P1iWgPGtSj3vHqNK8S9ZkEoxPt31c1vuZ7+KwBYbntbIjCNTQJ59ROMoRxYjYaD1FBLoKQn7s4864JOsrqa3Cf1YuipgRhSghnuZmSfnbd10AzKIqucGCWrlXPF8ZBvcjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GW7uBFTf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GW7uBFTf"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QLC1JM012519
	for <llvm@lists.linux.dev>; Tue, 26 Aug 2025 21:49:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ovwcz/UMx+Ei1EUDipzRJAkdj5/vHnIo3oFAfjDRoTY=; b=GW7uBFTfEjLK1VD+
	jvcelJdkc9D6ELm3oQep1HEk63GXjAQGze8wezUoodAtkr4xi+hm1vjmixN0eaoo
	ZMdPJozGh+tGniRlZKtVl1AlZMYsRqESV39zfdp1M7UVc6BAF/suWs0gP1ub7YkE
	np1pOHkTc03QgmcyS7QXDEDKdem4JpdwM2KBuaXvGuMZ2qw5gZWnIjcAIGJKrLNt
	HcWp8bTgc+WvN+ghBCrIIMgeZuUh+pgZkyxL/b9Ta1rHtyYYrb4IqkyvIG3grCN2
	HnEpw+GWEEP+WBzz3K4tDfZmphSbo8b4397190wUll7OR044RLWLhULiGcQ1ItOT
	koFGAA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5w2tm9f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Tue, 26 Aug 2025 21:49:39 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b49da788e53so4507349a12.0
        for <llvm@lists.linux.dev>; Tue, 26 Aug 2025 14:49:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756244979; x=1756849779;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ovwcz/UMx+Ei1EUDipzRJAkdj5/vHnIo3oFAfjDRoTY=;
        b=MxUpfhMm3eUtrPnaYGD4NutkZZZ+bPNwiwhzxkkgGb0iVvT639LTiTxmYkyuhtyEL3
         9/Hust2XiCArK05KbevWIrLnG5aSS0q0z5CsbdlqT0KPsTFqBoeuxrKu8Lxl6ZkR53GH
         +wYRzmjOjq/S8k2Rz6YG0ROSa9d6qE25hcLdL22Lluho7/BRcc92hRrYBkNB/waZge6A
         2olkjO2qoipyw7OfkA+LKO+WV6jzGtVPnTX41yhjhbYEtNHb+1ToVqhCF9LM7mV0eUhp
         uHB7MLE30pw9hFhL9r2ea83i+7TSNtikjIKzfGIavdNTK1yvgnab7zR6Doyz8Gd5lUD/
         H6jg==
X-Forwarded-Encrypted: i=1; AJvYcCUqNzbbQdKD7dWvE19Uvto91et1Hz4Ia96MhiTMaSoCu8GliC8dIE5hy+F/W3vvmMo/AUhg@lists.linux.dev
X-Gm-Message-State: AOJu0YxfzPBgdkduTR2ZA+hd2L1LuzQ+ji26v7SQkd6Czo3fUagvf+a7
	MBLM/s7j3GvLg4KDk92zBcG3899Ut3VnBW3oMVsdItYAi7BhtHIY2hx3zoSHTpTvukt7wtAksDS
	AFEFDuk8VPVAjHF2pJi3lUwZLI27tW/2pN6LczO09BBa/h34vC/DxhhVT
X-Gm-Gg: ASbGncveC73LRGdJjWJCzzZ40en7bTU90NBM9qLFYi9wiZqzTakYcAD6e/EzVAcJbCR
	UaACmAW6yqrTi4IhHX+IggxsGVhPHl+XzcWQbWvWOAi9Oe/pZ9kwvAi68IrZZzOixUYEq76SNlp
	HJXhAYvAj1amsNallKf8HSuXGTA/7xKvlvHcsmdQRTCEkS1bYrmsuv8DNNz8/aVUKy0/8nionE7
	XziGgO1EetaMpOfSwEQPF0KG1+2lWuvSZ48wQA/4W4HLmV1s1tY0UEIRcAOZ4AVjG4Bkj15c1T1
	QK8fAJdtFqUnDmc6BeGOuwZ3K6LGqgLWluVOP0sFu0HKbMxYnCQLrHif4w416Av57JjR7jkXmmM
	pxBe3I1pUJl43ytbeYFrNd8UzTe4uDH+n
X-Received: by 2002:a05:6a20:3947:b0:23d:5691:df51 with SMTP id adf61e73a8af0-24340b01b9emr23163102637.1.1756244979122;
        Tue, 26 Aug 2025 14:49:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvW96AUyv4NFuLjcj/uDmOR3GBBgYMnkq5H/IYhcNWvdPPtmf37a1KlGOYrRmV7mrjTboe3Q==
X-Received: by 2002:a05:6a20:3947:b0:23d:5691:df51 with SMTP id adf61e73a8af0-24340b01b9emr23163064637.1.1756244978686;
        Tue, 26 Aug 2025 14:49:38 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4c1b2f5a3csm5860905a12.4.2025.08.26.14.49.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 14:49:38 -0700 (PDT)
Message-ID: <e43ffda6-4d25-4874-99b0-6a65fea4a261@oss.qualcomm.com>
Date: Tue, 26 Aug 2025 14:49:36 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] kcfi: Rename CONFIG_CFI_CLANG to CONFIG_CFI
To: Kees Cook <kees@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Cc: Kees Cook <kees@outflux.net>, Sami Tolvanen <samitolvanen@google.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Rutland
 <mark.rutland@arm.com>,
        Puranjay Mohan <puranjay@kernel.org>,
        David Woodhouse <dwmw2@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Nathan Chancellor <nathan@kernel.org>, x86@kernel.org,
        linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
        llvm@lists.linux.dev, linux-hardening@vger.kernel.org
References: <20250825141316.work.967-kees@kernel.org>
 <20250825142603.1907143-5-kees@kernel.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250825142603.1907143-5-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Z/vsHGRA c=1 sm=1 tr=0 ts=68ae2bf4 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=ZGSs6mt8D-bwwmi9yLIA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX+OUcDwN1BQpW
 5xKBiyVwsSulGOl5iT6Uvzi/cuv7FJpiBni+ti3d4StsFVmz8Mmdv5QMkmcDxp+bDHm6Spgr8m8
 /JdCHXL2iDCAtZKHIIwsbzqmbTu6sV8Bpzw9YwWMYGdzI5Zb6V0yDr2XgXhatvwSYHeaOH3E02l
 eylF9V5QwPLINfNJI+aPsNUvLIZO4kFW4YIc8zDbEvQPreb4lKS9EcZxBDm8gAnF65YIqb2ZGFe
 TFkgW/X02Q16NuYgHlUq3M6bQ7cWFxojuqA8K+CbYe86Q0bOxF01+jU7kwOVROx/r1yJ2sni0R8
 a6B/2DNWzzr9IXCusaP0oOpNBrk2nQIH613uvTRfZq8Mf4n6Gg89//446dqJJcX8hOqQ/TT7OVe
 ekJDArXh
X-Proofpoint-GUID: YW4AjPSLZUdhGSWRKrllZnWgXZlFwjnD
X-Proofpoint-ORIG-GUID: YW4AjPSLZUdhGSWRKrllZnWgXZlFwjnD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0 clxscore=1011
 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033

On 8/25/2025 7:25 AM, Kees Cook wrote:
...
> -config ARCH_SUPPORTS_CFI_CLANG
> +config ARCH_SUPPORTS_CFI
>  	bool
>  	help
>  	  An architecture should select this option if it can support Clang's

nit: Do you want to replace the mention of Clang in the help text?


