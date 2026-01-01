Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6942E2DD2
	for <llvm@lists.linux.dev>; Thu,  1 Jan 2026 18:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767293905; cv=none; b=Bb3MZiE9QYkR1UPGETUgtLEG4EwN884yMVqonrxDld0lutdvDzWjy1UC9WfU43lmafxrq9W9IjnGBsSa/2AO0YvQrDrTJiX442m3QyabPgQG/OdUymWo8WlIUGkSlw/oGu05b8WfxV7cW/MI3h4Ranxd2GRJKyPOBgyfTrlKXfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767293905; c=relaxed/simple;
	bh=xGYY8pAd1/La7BQ0Al/8JnTwDy9NU7Pu8FhVHSk2N5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B37JFliZCT07MN+6rVDdBW5R2RHTt59FckcmJD45EDybGbJrw98hc0uTpIALmM8yHz4y1ruYyHPxQtaIV3l0UJkfvtUKWY+7ARBPUzHXmPb5RUMVqbKSB0iQw8b5qwo9vjMrNdxdOLX/CNkZjYViCK3oFVuA70rIJEDySF0ABVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A5zFDOko; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GdCWCBo+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A5zFDOko";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GdCWCBo+"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 601ISeCi3022689
	for <llvm@lists.linux.dev>; Thu, 1 Jan 2026 18:58:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=L+kTzgKoY0Dwz7vj+LASxcFM
	fom6Hwg6dqD1vHeEEMc=; b=A5zFDOkoToOFvysK92La4leHoU4+v8uKymJdwNzA
	Py1Lw+snnHL712MYeCkhCZG6UE3QIbCd4UO0VJh9KLDd3U+7YbLso1Jkvtf+JA9g
	pllWTVyEnHk5jeuXt9AFJUHmeOK6poMUq6MyZtIehwjRTQn9Nz8ThnqEZqJ5wN26
	eG3UzzSSiCBI97wUDSjWPboKe17lzLDmwJuxwlAOewMTt5rFDy65XT16DvQwoeQS
	qIse5gJtHN6hkoDifISLnwJC7tBZkyv9uiDyhAWG4S22Rcb6GwBptKt2j2FyoZGe
	5xzDX0WpXmTLMJ5lJdEANWUvtkKAOr2zR1cAjQ7I5vO9ew==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd76n9xug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Thu, 01 Jan 2026 18:58:22 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee1b7293e7so433971761cf.0
        for <llvm@lists.linux.dev>; Thu, 01 Jan 2026 10:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767293902; x=1767898702; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L+kTzgKoY0Dwz7vj+LASxcFMfom6Hwg6dqD1vHeEEMc=;
        b=GdCWCBo+hTiOyfQbkcfVSQxunMTd9LQBoNl2InXlOeSUhDTS1OuqPBDy2LBE/hUKm/
         5g2EJRjJjn7gDwbpdr5mMe7VDbwmtLykHT2WCBQWEY8uEjxKnOYqk6RSE19XTYc6MDf3
         bGHfjlcRGaWQV4Fjqzb0k1Jg70LRaUafEjVmMakDlFEKnjcnEFrlVYwfsSaKwq4qETVY
         qiHJrGwg8Fb6SmGH6+izMiTXzVeAiZMpDAi73bC82Rd7ChRNQ6Yq+usrBcLJ6Ez+4nur
         4vI1W8ZmAvNTx8iR6/gFOhPQvXNCmIwCNFNLWz9AfAKdKJChgmQsl5JK+JVXdlTJnXgF
         mXbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767293902; x=1767898702;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L+kTzgKoY0Dwz7vj+LASxcFMfom6Hwg6dqD1vHeEEMc=;
        b=dOeud37JQ9D5qIJf7dplisc+G0c+HOFVZdXzpd/QbWuftMQXKpjLXxAMXDGp68ld1p
         W7s/zUmKJR/6b2EX/I1wI1peMgBXgjVmziHNrLgxUq7j11Rg+DLX3UiEyLNVwQu4Hllr
         /jtYrJvFHxgeYLUnetfZj8tWzREOPhBZXkrDo0Lk9epaGJa92kiF00nRQcuz8wcmN6fT
         iL4KEDF/kaE/2LaEMnyZlAKRp7Aq3eVI2hHbxLBfVYvNJzs1C3Wt/eFN1wKgM6EVlAY6
         kjHrbZFwETfKXWTduszY++Fp6kwVzhMhmYwnKmJvFd85nghqSMeIR5usZoOjEeTM0OWj
         QiFw==
X-Forwarded-Encrypted: i=1; AJvYcCW+WN4bMj655tBcox6l2nbViQ7xBTsCTBWJPLRHhLH3+Q6ebx4cvsvU8kjmITUCrHPXqwto@lists.linux.dev
X-Gm-Message-State: AOJu0YyriDonszgi44PF4QRhd9POTIZF4jatD0QI948asie8J7wb1yAr
	UM6h8qMnMtNddLktvJ2/zk3Pl7JiaxNf2LsdSsCcaLiPHTuw6vj483KBQSHDXoeyhq2nPQ04JaE
	5LSY4AQHk5TrZ9Q9VevDE6hIpLMUIOrlsojZ9TVx+jIYWegzvIYMPStgu
X-Gm-Gg: AY/fxX4M1mr86PC/hnGGyqNmhjohbY5HjBeIDu8FLJ38FGh1fPGFL4fbc/FN58lHYHW
	CDJ/nOjnZAvhE2ZoaQTrDbB535jFIHl5YzVExPBBcMS8UiIQhr6PiEApyL9g8MKEmN0Z0NQZSSL
	sjH9bCCAVarUatUe/5DWTBr7pCf/Km93RXr/X1afA2PmVGnhWiSeEs92vgrjEUK2idcGTDvdLjR
	Ifxgm+OEf0rt3cr5XXHIO7VcsN0e846x5uysrR6ugeWrhgeCaMuHbSG30I/HvNfAmmero6K5OsQ
	xuZSxEJH+G2/BBOBQ+1nvchfDNdcCDrOaO7NwMo+NEStztBuc16ZnT1bQmWbl2a83I0rP4UYb6v
	+LZAH1swrmlWCRWd06mky
X-Received: by 2002:a05:622a:540c:b0:4ed:1948:a8af with SMTP id d75a77b69052e-4f4abd0dcc0mr592306901cf.36.1767293901700;
        Thu, 01 Jan 2026 10:58:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGlz/3vyvIYgIOkkFPFLj7xzq2/9y9854ildt7H76Yqx9WzlGppgjuV1tmNsy8jExhZ7JrgVw==
X-Received: by 2002:a05:622a:540c:b0:4ed:1948:a8af with SMTP id d75a77b69052e-4f4abd0dcc0mr592306511cf.36.1767293901243;
        Thu, 01 Jan 2026 10:58:21 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.7.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4327791d2f3sm47967829f8f.11.2026.01.01.10.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 10:58:20 -0800 (PST)
Date: Thu, 1 Jan 2026 20:58:17 +0200
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
Subject: Re: [PATCH 1/2] clk: qcom: gcc-kaanapali: Fix double array
 initializer
Message-ID: <z3auxq6sv4vks5ecchmgajatr3gclghvozl4wxrty27zihmpyx@kjl4bi7oyla4>
References: <20251224112257.83874-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251224112257.83874-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAxMDE3MiBTYWx0ZWRfXx6oig8Mmgv5A
 4N2l2FmUWclWxkgntdyacGS1ZP5NwL323N8wN2e317GuOkfmYxu7FtzGr/Bpni1XLRGR+5ZaNA5
 ffJ7Jyee+Xjhp0nhSTPfv3gbNFBcFeMY7dWo2hC0+AmCawkmOMdiSFhW2bZWaaWKeyn507CFiS+
 is4E9pUkmoJREY7pSusw3TxNsYwk7jQdlqxzIh+lIYC4l0P17q8yX+xWxF7WhDhsmR8v6NAHPos
 j2fzZ2nb7GkN38jD4PuQmqnx5Zsa0NV1LpfGgteT+7aJKRmkgXK0KUxirPoUKL0zpqVEoDHPbL1
 qmyFh1cM/Yp78UAQGclapIxLfg8NL4PNEAeR4bTTgzXC6JdNGLHvv4EQ3zL4H1CmJFVXXErWMsh
 ZPPaq22RTMY/sMFnLA3S7phDCTfyHEHAcnBA5LZCTvjnBs2mzavyRl4xY2So2aKbeLutspCvqwb
 qnwLh3eVvWz9suvNL3A==
X-Proofpoint-ORIG-GUID: GsCDFk07lBUfpcTfzyo9BVAWeaag6B-O
X-Authority-Analysis: v=2.4 cv=TdmbdBQh c=1 sm=1 tr=0 ts=6956c3ce cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=hZ5Vz02otkLiOpJ15TJmsQ==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=486DEghy8GcDG8TY6xEA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: GsCDFk07lBUfpcTfzyo9BVAWeaag6B-O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-01_07,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0 clxscore=1011
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601010172

On 25-12-24 12:22:58, Krzysztof Kozlowski wrote:
> [GCC_QMIP_VIDEO_VCODEC_AHB_CLK] element in clk_regmap array is already
> initialized, as reported by W=1 clang warning:
> 
>   gcc-kaanapali.c:3383:36: error: initializer overrides prior initialization of this subobject [-Werror,-Winitializer-overrides]
> 
> Fixes: d1919c375f21 ("clk: qcom: Add support for Global clock controller on Kaanapali")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
