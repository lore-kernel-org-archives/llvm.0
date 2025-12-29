Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D84A2D4B5F
	for <llvm@lists.linux.dev>; Mon, 29 Dec 2025 11:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767008888; cv=none; b=DftjUOJFdL03hUOEiquqRaSylb+PcVp0Ztq9sJ9WTLTbs//lQbMFYDy+5e2C5ZAuCZfo8kNW0Nt2OW9Y9sT0+Qx59bgRePFjmFGavDPLbdt50xx49Gp7+fvH8uBl/I1oec+bRPFBY6uPod5vr329sCWgfmdcoPmFlwtm3SV+0yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767008888; c=relaxed/simple;
	bh=R2QMndu7kTZOcDhG5pspP1i1KqfuggelcaWTBufOp24=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=sjjg7G9Ry4Xq9bKTxYbQQ1tapffatTlVbG/q2vYv1vORF89LExs9NSqjQSjDdb8lfUyswcjB9BVj8POj6fsEbydYPWKMHyFjfTd8YbyytzzUwXxxK4VbbHWcBmZpiAj9fVCSSYn+TrpEAILSI+SDvQsXlYSzsoQ2KtPlLZxn2vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hc2XFkOX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SFivARRu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hc2XFkOX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SFivARRu"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BTABvSM3526147
	for <llvm@lists.linux.dev>; Mon, 29 Dec 2025 11:48:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DPRG6iTyFGtdlDsofzUrgUl7lEVsoCW1hko1aRLMHNQ=; b=hc2XFkOXF5S5Sr0Y
	v2r/bZTaouAFXo/d9Q8EMT2u0ycKzDDVeQQZxHwfcJhjtPc23ixZzt8vPAtLAQi9
	Jh5E0yRnuT3/O6HSNlQF8bAX3V/cqZwmtVMUDJF/Cnv76rA503XatFMHyu2J+gky
	jry4VshqWkG10CfxybQKFWRASD9ek0jw9CK0+FhoSluePb4wbiqjmcfd4nmhJrcF
	PudgSWgaIbYI2LIx1d9OQfTP6CGiVUcCSHF+shpecKuWGFs4IzsszU1VP4pg/uNM
	x2m6TX7bfvX/3JQ92LM4L3oCb5FiEjdYO8CUEmOZBe3URX+hn9veQ4Ah5pK+J8zt
	1VYCqQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bbc8ysfs5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Mon, 29 Dec 2025 11:48:06 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88882c9b4d0so30928846d6.0
        for <llvm@lists.linux.dev>; Mon, 29 Dec 2025 03:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767008885; x=1767613685; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DPRG6iTyFGtdlDsofzUrgUl7lEVsoCW1hko1aRLMHNQ=;
        b=SFivARRuHwHAUt8UYKiN6LcrvKf4G38OkcMroOXWD/cgOOeMItsQ8WYT3/VA/7s3Xb
         bQaqoozPd3i7qWn3Rrn2c9wgo03w9ToCcj+a1cI+lJuVj7DtpHF7VBOReRf0XnCjizTW
         cQz2wh0Tox5QVa5c8P0ucMvUDs6nz20V6CeL0nQ3eroqL5+SsNbHJU1K1Ov2Ga+F6I69
         8rL29I/9y0zZxrWdoBrHp3tEVKgreUVSMPOmTGl0bIbWjzSS8wAI1rpKrd1AdJIvL79k
         6FT7Pg8CdkqxBffpCr1TvW1H6DZvdoghIAXVaA3Wun5/ePi5j0pm1lnjcaeZdyo8c+9T
         Gtmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767008885; x=1767613685;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DPRG6iTyFGtdlDsofzUrgUl7lEVsoCW1hko1aRLMHNQ=;
        b=gx66iDvvX0Q8f8OjKaI2g5lQLi43b3dxdE2r2cUzQ2UoGNTg7qtvAE3cO7KA1PH2+F
         7yVV84B2J/Ivwmr98iYxStYsyOG5UKzIn10zk86FaMWq/pycf6ZNbDIHKC+BVvZZmrcs
         jRwDp/GwJ4cjWy6jg6WadS8prmNXVvCSzgcfYkktueziFqOnFRl9bZA7QlEunaOfutea
         5w2AsjDGETttp3OMKrFZDYfjBzosM8+S/vyVXFIWXZY45Y+of72c86JBDBeyKBMaJf2b
         nXoggF1q9CUSf3N5zR+RCiE5oOTt2v1N1cZfok3qOR4G1NYCpeuQL9vVKcxxwgfCgBtt
         mgAw==
X-Forwarded-Encrypted: i=1; AJvYcCVO8ewao+hK7lg26U6f1KqxJ0tka8JSaft91tCqm4vkBsrdG63Rbfhci3dFbmY5xKqwbe7U@lists.linux.dev
X-Gm-Message-State: AOJu0Yztlvm7du/1eyzbLSkFy+wrjBswq9m3QvQz624kHylLfOkzs0A3
	0/y3dHJtl+Tbd0tgb+aGkas+M8vMnIyKjCV2cHGApl5HX0yRJrIVcJvg1JWVaTdKF23YYfbQjRr
	VVe3mHfk9EjiO0NxaCsnKRbsAqgxT8l+eYBy/KLrELoyMdRfG9+eL5foX
X-Gm-Gg: AY/fxX4RyNg3f4uInldtAD8/+Mw4UWqyEbqY9AwP7sLzAqPPwTMD5CxQyjjozwtZkWi
	VI4fhUMqPmkyC11WKRViaXLwA1TwO8TwmfH9u5XM8IbSIlLhJi68iqvXoOrOHW7DQAGhk1II0Jk
	9mO5SlSkVFlM6+j5YS7HcMsKWnTlt0MHJ6/ZkNNX4YcdZEfuv2rIx01xH1cPL9OCWJIH3q/fzdU
	MkOWvK5gjVL3G3liyPQpbf3eLS8FVJGW5mkqDFFuAhZE528iIfre7oOXc546KYuMj+ezBXJ9sXO
	r3rjaGc6mDMa7+SEiZOkfmnJTVkJKdl5inDaYPG30fKqiuspAhbnAlfTpGOJeHcMdtCBMEtTUaA
	NOiDW8AiGoPbDl9owcZHjZ9bc3KXJWmlDW98ZMBenqohYL9OPLfun6mttfoUpTkCFjg==
X-Received: by 2002:a05:622a:242:b0:4ed:6862:cdd0 with SMTP id d75a77b69052e-4f4abdfc9c1mr344048291cf.10.1767008885116;
        Mon, 29 Dec 2025 03:48:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHjrSkKbc4mw0Z6WAOP5U4DArxVR9tDx9EDtrh5En8yfJHONgT3eVu+kmtLQPBglHGWnGTC5A==
X-Received: by 2002:a05:622a:242:b0:4ed:6862:cdd0 with SMTP id d75a77b69052e-4f4abdfc9c1mr344048101cf.10.1767008884665;
        Mon, 29 Dec 2025 03:48:04 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b9159ac90sm31583029a12.29.2025.12.29.03.48.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 03:48:04 -0800 (PST)
Message-ID: <dfb4ab3e-3e4e-4c67-bf7d-90c589871644@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 12:48:02 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: rpmh: Fix double array initializer on
 Kaanapali
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20251224112257.83874-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20251224112257.83874-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251224112257.83874-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDEwOCBTYWx0ZWRfX6ccp3s0DSXgz
 iWKVIbqCP1F3BQe2jfduZZqMY51g+3eEu1wbPBY4C5+YuEKswPJTbHfr5dNOsNbnQf8LfSc7RDQ
 sYZFVWfW9scZH1169Vom43e/wAM10MUtZ0sLp69q878Y9bWzOuegUP5rwfJZzgNnSxgUSt1JMl9
 MICYz+8O2Hjcn1HBO20Yxs5nYvL20Gcu4Ed8jKrMBoZafe4phnqJcawwGhr8oTX+zPVx+YAptCT
 zPzp53toJnPfcPmc0fLsq4jRissbFI8/TkZTudPrklbe2ioQMuEWDhtYPP0twzp7gad5eZBoVR5
 lfyMNByh/WTQCtysLsa8xezJ6GNur0t3NmLGqSxTFuF/G2FypyW6zMuVSj+r9bqJqUijEaN9Rq0
 lJzZ+qSaf0mxECHdCAPgqv+v+aIUdZMi0KJyqtb6sA3OphuRuAFo+SkWUYk39/dhM+HTUV/HL0o
 TfddFePBcKj45klA8DA==
X-Authority-Analysis: v=2.4 cv=cP7tc1eN c=1 sm=1 tr=0 ts=69526a76 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=snvUICUIuoXJ_myJnVgA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: aGbtbD8OW02SNzymGsaiDIhw7jDkTfHp
X-Proofpoint-GUID: aGbtbD8OW02SNzymGsaiDIhw7jDkTfHp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_03,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512290108

On 12/24/25 12:22 PM, Krzysztof Kozlowski wrote:
> [RPMH_RF_CLK4] and [RPMH_RF_CLK5_A] elements in clk_hw array are already
> initialized, as reported by W=1 clang warning:
> 
>   clk-rpmh.c:932:20: error: initializer overrides prior initialization of this subobject [-Werror,-Winitializer-overrides]
>   clk-rpmh.c:934:21: error: initializer overrides prior initialization of this subobject [-Werror,-Winitializer-overrides]
> 
> Fixes: acabfd13859d ("clk: qcom: rpmh: Add support for Kaanapali rpmh clocks")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
