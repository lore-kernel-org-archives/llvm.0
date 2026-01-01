Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2BA2E2DD2
	for <llvm@lists.linux.dev>; Thu,  1 Jan 2026 18:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767293952; cv=none; b=EuS+K0DsMcQeQM6LuTbzR8hi+Bfw3SRDbm8li/NZlTnLP88QWyLYHRCEjBDS5Rr04svBIy9Ul1xC5raNrr8kQfQwZsbS+XbJlsweWCItsSL7FiuMHRamF1B1HX40DLxQzpmu/cJl6Z5VCbj39n9Ogas4Sp2oS6ZiB2O0dFRoMDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767293952; c=relaxed/simple;
	bh=SY1mfUzR0kljOI4AnzSXIwwOJodmSB+8pf9K4FEZRbg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YVPV4LVNq93RSgZGJ2NxuykakPkYK/N1uOnYKZLOACPc9EP5FJiMaQtOkcM/HenKPNfF+btEATBC/CmIOrezo6c6lavM8pRNQtjlUtY7R6IawmYuOM9SzS6S3TqjJas17lMz0mSfy7L4/ZDz7ueceWhDJztD8fnTObD5OB2c86A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G+cTZFiu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AKSezJCo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G+cTZFiu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AKSezJCo"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 601Fh6ve2388963
	for <llvm@lists.linux.dev>; Thu, 1 Jan 2026 18:59:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JkglM1+aOC2hqCIcySYqY8Wi
	aGjCaJ47xGM883ImLcc=; b=G+cTZFiuin4orzyYsozWq4Zfz1RMh/g6OUtpO+T+
	AouAjBtYvOyz7ClwMxqnYxhQNLTgUDUuj+dW+QWU0y/+sZ/byy9xhwXlSgE9MthG
	DtG577SxXMyCHJ1RN4MOPatfLmEsfpGO1Lm+Z+/SK2Nwd3NCcsRD0vDzqnWyOTJv
	xBaMRS82MCrS+lwjraP9UdKw4gmX844qGICaMCBTfAwFYUyrTSUYlxpfEIWIUn+3
	65AcgcBNwVowyyXaL5fkjqCclVUj74qByLU4jM8w7hrZWhCBJ2zyFiroy+XG+5or
	mz3y+SdocXdY6D+Nyfr2vKxmoeHiE4AuQb6l/9xf5InDzA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd7vthv3x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Thu, 01 Jan 2026 18:59:10 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f4d60d1fbdso348453751cf.3
        for <llvm@lists.linux.dev>; Thu, 01 Jan 2026 10:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767293950; x=1767898750; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JkglM1+aOC2hqCIcySYqY8WiaGjCaJ47xGM883ImLcc=;
        b=AKSezJCof5De7f3hMdGzEVCPz2yFWBdS5OWR2NMRfoEXXay3gToxi7F77cRZYhIcjd
         sodc0Twagpx9+5WnCMEsPxbMKsnaswnU3o1ahnE6XDn8KmQsqf+xgPnaFSjD/FUPqPZS
         Qx9yznbULIRGgzL9SOxdmJBr4/ExJymtNkFN/sDnQTbSwthBVmCVMo076rt0U179mJVh
         3WzdAwt1/gjqj2b8LT50+Ru+MD/cZ1ZVmPiU4tpuZs4nezuvCQJsLAWhBgpQE+9IMo6E
         0hSEScLm62OtXfRcJ4hyghrSu4WGOPbneOXpfxWIZEdu5qzNpqDg2kDYURRblKT1ZfwX
         aEEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767293950; x=1767898750;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JkglM1+aOC2hqCIcySYqY8WiaGjCaJ47xGM883ImLcc=;
        b=d4QNdmR2ZQwmMQe09EkVyYWTVLYF5JcDYDizoHQ2SKYiobmxRu0XalBP88W2pPyQm7
         DBvVdZuEarVFXbC/oXHXNpiR/U5/fkAO1D8WbrNoQZiuGm84Mm0T+y1yuWuQ2Ek8/D3b
         gqSfWJLNUxFHMfr/aSBSjM2JvU49y/YK0bC2eTMbk7+jWAyf1zfb7qb574M2zdPGP+9T
         huQFPh4qrPNJzegsYEe+8BzRX7laPqKgdKaZ3jyFh5NDwGDHcpdrxFLi0ubaF0EYhNiO
         1hzzJFny7rOaZJN0NlBtOWNRus/YJX9tG/M998r/GiQB0WBEyWcrusv0WuXj0JCoykj2
         t+Vg==
X-Forwarded-Encrypted: i=1; AJvYcCURd4WDBk8PIpCcSEjVJ7lkpqllgMzKppj/WwBL0NVRKI+F1GWX5cF+WJ9iAfY6pOg5hquX@lists.linux.dev
X-Gm-Message-State: AOJu0YxbbqzA5/hrI1/lR99Djfsl3h0dI0yYui/3z8bifsHORw6TLMBd
	WpJnUmJqRoqL/QB9OxPutIW/izpJxS8MagSDa77FDZt2Q2XrNUh5kCRgQba7725dQEZSnmqXHXz
	eZtZQ3LRIUv4QKfzW3eNNT6DssPEHKuVfHt1LqiDM2DA6OAgR6dKMvO7b
X-Gm-Gg: AY/fxX49YO/2hhrs5nlD8zJQcyCxbjnFxpqOr9Y9jPEvCAzjEBEJVLk+UsYM+5SXrVT
	iWIBqgulbx0fWxUWmmFk84xeToEPIPYN3+35+ixS/figyUzpBCFBFgfdFbu88NoxT3nZqHG6ddd
	a+dJWHprGX7KjGC8g69e/m81Z5IWU7rOWvtVQvd71MYgQbQohlun06B9gfSX2yVYOD2LRPhan+p
	1ySnUlV1ChzCuJMsOmSBkDSHVaLVCdR0g3lSAsdMbdRE8yjeCb9aL1FmjQ2m36jHLYch72HZYFJ
	lRimTnslLy6O4xIUjzcVu2WEjE8uKvXOiTsVsttAK1z0vYg+DwuCZtJMpEQxoyTjajJI4WcHedi
	2UjYWLnGjINhfbXu3v/Vo
X-Received: by 2002:a05:622a:259b:b0:4f4:7b79:72ef with SMTP id d75a77b69052e-4f4abd6fcfamr659645361cf.53.1767293949628;
        Thu, 01 Jan 2026 10:59:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE20WFgF6uiFUXY205JRdsUZUbKjo+NyqH9+Jcy+puXiXLb/gwLgViiHqrINvWZdNeL1A1ivQ==
X-Received: by 2002:a05:622a:259b:b0:4f4:7b79:72ef with SMTP id d75a77b69052e-4f4abd6fcfamr659645081cf.53.1767293949084;
        Thu, 01 Jan 2026 10:59:09 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.7.10])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ab7f7bsm4245998066b.18.2026.01.01.10.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 10:59:08 -0800 (PST)
Date: Thu, 1 Jan 2026 20:59:06 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 2/2] clk: qcom: rpmh: Fix double array initializer on
 Kaanapali
Message-ID: <eauy24wd6kyd4rm3b3gjngbkwksvqjmaxg2tufqagvulkvbqgo@x3x5osjcezly>
References: <20251224112257.83874-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20251224112257.83874-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251224112257.83874-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=NMbYOk6g c=1 sm=1 tr=0 ts=6956c3fe cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=hZ5Vz02otkLiOpJ15TJmsQ==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=snvUICUIuoXJ_myJnVgA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: JRW-GJCFdaF_qjQ4dLLiFWKSpUd3cW1V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAxMDE3MiBTYWx0ZWRfX/Xs9AiZRR1EA
 sXOa5WAVAxN4jHK9XwICkFqeZHwMK9bmVRyW/H+KGX4TATJYd7qRjYkhb/xqacYn/DjVgX1Rijn
 Trt8fvQ3E4Uz0JTaDjfg0lEphzuFbzIJjXnsupJf7NMmqZxCDwpVvZCBBR5Uq23qrX1BJnqRV0c
 z+hvFrsi90ZYsXyNFlNWqzt8hjPdzgDQ8fuAgK9vO8qArumxyQofxJxlk3eoQV7CnY/VAVyVjqP
 bBH30xXzHE93fZFJCRvO9q0UKiASWPGW+7Nb27KUN+FJkg4vZ75aE4MDCCk7CWH1vuAoDPLoVW4
 wfsCF4CvXfhEldZceBokUS5plGjoVM8yOUktbTwdiq5p9duTbJAOdkV7RVTL46dkhEs0fRc/pNK
 PpQJU8NZTRZkLGPjlhIzo+rhD6bcl7KAdmtAOcZgf6Po4a3uRzEv7lQgVRvgOw28KCAABjZiQjc
 K1bLGM2E78uDilkLViw==
X-Proofpoint-GUID: JRW-GJCFdaF_qjQ4dLLiFWKSpUd3cW1V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-01_07,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1011 malwarescore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601010172

On 25-12-24 12:22:59, Krzysztof Kozlowski wrote:
> [RPMH_RF_CLK4] and [RPMH_RF_CLK5_A] elements in clk_hw array are already
> initialized, as reported by W=1 clang warning:
> 
>   clk-rpmh.c:932:20: error: initializer overrides prior initialization of this subobject [-Werror,-Winitializer-overrides]
>   clk-rpmh.c:934:21: error: initializer overrides prior initialization of this subobject [-Werror,-Winitializer-overrides]
> 
> Fixes: acabfd13859d ("clk: qcom: rpmh: Add support for Kaanapali rpmh clocks")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
