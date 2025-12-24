Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905133195FB
	for <llvm@lists.linux.dev>; Wed, 24 Dec 2025 12:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766578874; cv=none; b=DmwK7mZkALqWJhaRbz+nYP3lPazCIQj4uu1tPbG39OjF1EDgUyrAr1KzyVPUs/OYSsF+gajD+5oPrsBXeWrNq7EprcPbJkkDr1MEC0R13R56+ZNE2iu1r2uBnjXrAww/NZpmqmfWqROuSGAlvwyLO4f+n5oqvFR/8LFWapTtpos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766578874; c=relaxed/simple;
	bh=yRGL8r4ZMsOqfgIJea+g+Upcf7ZSTpqZakl3Koo8zo4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ikZC6trHUCjbqeY9XSw/2+FSeh35yqNDnrJ169nEJYX2o3/eSmFxXoWuB2+c86VaKRx7MxetK+F/qF97mjbkDXfWsFPeZU3qJPoqEfvVIzyTAyJs6E01IZbCckwdJy8u3ukdfKPMSi7fsigQHv5R3MC6q1ToabVPIJOklUq5GTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jXeJNtBC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GTAUqhdE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jXeJNtBC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GTAUqhdE"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BOAR4VU1597720
	for <llvm@lists.linux.dev>; Wed, 24 Dec 2025 12:21:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lJU+pblrkPsR9x3DzesoKGsl
	EUt4CYwM1Bfa87PBMMw=; b=jXeJNtBCXuux2HE/POJ/vPmZzPtiGhEvQQQeGGzn
	OevjlSl7YOovP/yxvREV6q1OFEIFbv/NPay9CzzguYGU2e7sejWMJ9V44sM57CFZ
	ObR3Uv5kvB6Em5HJoVkbybCfSuqb41xVXLsls6WvF/+B2broDRCQK1dBIOIvp7o7
	PUYZq2gYGHvIZ0anevRTG/+2joQwgcLATloGfSexgqzQMB3nX6ppBwHrPEX5vxW7
	zQBF6XhASw58MZezPZPIl5dN/7+YxtxJwVPZ78DdJxHDjfAdhKnKTDgTSvFicv1W
	2emu3NojUnd1TW4fICILLWJ6+gVr3rreA2hFoqYiC/YMCg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8683hj56-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Wed, 24 Dec 2025 12:21:11 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88a3a4af701so154959506d6.1
        for <llvm@lists.linux.dev>; Wed, 24 Dec 2025 04:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766578871; x=1767183671; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lJU+pblrkPsR9x3DzesoKGslEUt4CYwM1Bfa87PBMMw=;
        b=GTAUqhdEqYNvfqLqNrq2/o2KtnQczQiiMPs56mAg0xjsKjajjks6e1+J7EFbKXATS/
         zdmFjW51WeHebmKu+Z16WF0DP4qODBaB5utt6FV4BFqEJw1gbExAi6DLfR8YB/Ug9YuV
         9wt0oNlajtnmMGIDa5reMuUt2ZI5JfITvAuFHZPffYbU9D54RT91JOVI5nDmHQp0+DcF
         djpmgzt3XNa+AnzVMITfOsNjQb8541AwSSGtNCNkHu3wN1+GfFoOefRo8R89YbuiNk65
         yTp+HXX7aFycjq0paN+U0AiVW0Z8WVlnBE/jBNLEyAnDb+LTVDHhDfVM7lAjQwHtv+uE
         QnuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766578871; x=1767183671;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lJU+pblrkPsR9x3DzesoKGslEUt4CYwM1Bfa87PBMMw=;
        b=bW6iS7vYw3PNz0Bx6ipiZrAJ/rU82zh6vrmS23SgGQithMfRqAV2DeQ3IyGwCFirJs
         U5pE+QdXzCAALldZTdWxkOpAZ5BkwSdolbW5pr80+asLoPUC/ns9BBtjHOpGxN8mskgu
         a5/Tye8eDdAH2EyVUeLuJCupkz+Bt1+nuUOYsXHhYHkSpvOTYCgRjvzyDieAfakXhCEU
         EexlrxsNK6bBpjWfjKatVdicM2YqMOmwDygarPxQhLxbL8WmplggJH8vKrZu5o3y57Ew
         YQCbRX8ClddTMUizVd6QTvbEYiQiznY7HuHo56SscjqXqqTokhIsvmk70fCBWEh/sDzu
         MnZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqBzRqf9IdtNaq3Ml38IErw3TuH9YgBtFHT8vdQNQi8YIzs5ZYvaKcYRQrQn+FiSnxmRjj@lists.linux.dev
X-Gm-Message-State: AOJu0YydMQvEIMIRF8gSd/Iwpd7raMtQc1LlvtFJUKCngAkzquZq62xn
	5/VEzl4eEPQwRScSFvsTLMnsJCBvUVujDacGf62fjedHvXq44mrHeoc2mbvAeiQ8ZCJ4Q0Bb03L
	uhGcNfiIpUaKx92RqfMgf4yRxr48ulHbPeF+owPb6lb88Tx0lMTxCj1bq
X-Gm-Gg: AY/fxX5MvJzeaGVMu9Iee0k/xPuIvrhiQk9Ri/JrVq3YcMdo2ttLqgJfqoi9vIiLlTi
	ypugD0/EYafu6XIw9yQTADR7rQFHKuMX8Y/oOfFC87R5a+DHqwnaCQ8EsY36B69Lq0UwaAK3rOh
	Z8w+mpE1l0CBsCXWrjLXoIGUeinorra+KC6cBWMi9x/x+E1itWIamTUpet9YVYGIpBY0aGcPPnV
	+0HjK6gnZinstqMPZhFeO9+qmBMkwwR3ldqdUtPZl61jJ4P6t3pdDxzAvTObVFalnE5SWEo7rtO
	nAshMlb0L28nQbCE+AWBP//xgB7wGYaw8RIg8Pf81Hd5swuEfINMpCWnG4vuO3oyy8eWpvc1h31
	sXou9buAUm7SkzJOd92jvA5NcLUYyxO2jJKAoB0Uy96u7dVQx6GB+6yLal3Rm6vwcHTv1BRMOYN
	s05fDjtqvVB4nJ+rwIBGieY8w=
X-Received: by 2002:a05:6214:3110:b0:88a:568b:f4af with SMTP id 6a1803df08f44-88d828162edmr291355966d6.23.1766578870754;
        Wed, 24 Dec 2025 04:21:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEewmP76uccHHzyVy3OhdDBMJHCuEKTJegmcNQywBFxh1mQ+oQJFZoLdNe6WJFOzeCAjmoFOA==
X-Received: by 2002:a05:6214:3110:b0:88a:568b:f4af with SMTP id 6a1803df08f44-88d828162edmr291355646d6.23.1766578870329;
        Wed, 24 Dec 2025 04:21:10 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a181beb5csm4864481e87.0.2025.12.24.04.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 04:21:09 -0800 (PST)
Date: Wed, 24 Dec 2025 14:21:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 1/2] clk: qcom: gcc-kaanapali: Fix double array
 initializer
Message-ID: <6x62fxpyyy3bmtivbfntuqym35ao4x57jv3ijrkg7wwpjioh2h@pykzc6zilao5>
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
X-Proofpoint-GUID: RxUDubpLD8HvPuusnMYAmcEXwSLRXt7e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDEwNyBTYWx0ZWRfX4VVJjxsnGYe0
 yTCP9lkAx5Kx39PtXRi/JRs9shY2+2rZ70ZnvuAyaabKrL2YIfZSBATa3sSBGiGXOCa/QDMWyjI
 HRjW966ruhuRSAtuZrd+AG0LJmZl9vH8SG0ysYa2hPoocqbgnHFxIzqQnQMotPMXzskfbBjUcIQ
 CTYK/ql9C7YSlsJAN8jx+1I3l6p3K2xh9X6dkcRIMo+ILcbDz4XRApHqg1He1GhdsL9AzJAIFqJ
 OtNd1pFSMNfMmsDBm93QZuxiE/jQbHzMm+GSpFSwENr9/fa8w8BbQsyZfJf8Gq9n0nSv73evIGT
 nXz2v+97LrNh57SEVbasgEYC6XXSEQPZmxd4tGuvYe/hAk/g+ykWF43DDitEdGDtRbrBc4Yg8+p
 jQ4SinL4+RFUtJEKSlnjN0y2a6unSzOnXZrwpQjr8o81QX7e+ZSMbwe2BceW55Ue6lshePOctOv
 bnL6vpe/Q+F1kkPG8dA==
X-Authority-Analysis: v=2.4 cv=HqV72kTS c=1 sm=1 tr=0 ts=694bdab7 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=486DEghy8GcDG8TY6xEA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: RxUDubpLD8HvPuusnMYAmcEXwSLRXt7e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1011 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240107

On Wed, Dec 24, 2025 at 12:22:58PM +0100, Krzysztof Kozlowski wrote:
> [GCC_QMIP_VIDEO_VCODEC_AHB_CLK] element in clk_regmap array is already
> initialized, as reported by W=1 clang warning:
> 
>   gcc-kaanapali.c:3383:36: error: initializer overrides prior initialization of this subobject [-Werror,-Winitializer-overrides]
> 
> Fixes: d1919c375f21 ("clk: qcom: Add support for Global clock controller on Kaanapali")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Does anyone even build this code before sending it to upstream?
> ---
>  drivers/clk/qcom/gcc-kaanapali.c | 1 -
>  1 file changed, 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
