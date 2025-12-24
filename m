Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88ED7313277
	for <llvm@lists.linux.dev>; Wed, 24 Dec 2025 12:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766578912; cv=none; b=aPHzIfNgljWDgY7niHZw6rlBNrICmtycm5zYP0O3q5Hu0OtakAGT+kSEax4nJVVnCP1tmmADN85M/5LUmkrHOuJNoOt40ZMeMFOSdhJx/eW4gr6hC2rZGmyXEeQD1zLAvFyXoLxPkfGonrJBb4Jc2u2ad3myYaS8AgYDHWQhv/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766578912; c=relaxed/simple;
	bh=KQkVNIoYZqAeYA3wunRzrFguvDuMZpHHdLny0Yeuhzg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A0pNrg4jVrC1yf6RuCJ9QlVRXZgFMug7KYZKrZmlr32Q3NT1uEKI8YS4UzVe+RHIuXzWHr3+1M+i5YTkokdOnWGkOBwOGxuKzBwNlsy71b4Pft78UG1CTlPVoPqfc8t0tsDLHAv2YZZQrB4rqF18kue/AF2Z8XQc1rKxxbiBbYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gwCKLWVH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YLREFLa/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gwCKLWVH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YLREFLa/"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO9WG56700570
	for <llvm@lists.linux.dev>; Wed, 24 Dec 2025 12:21:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JFFP5s6W87N/1+zfMWgQ1GNu
	xW9vgJ+7oIu8wbOa65U=; b=gwCKLWVHVCee5ZkAhSP/F8qvlmBeFBCXh0bMt5j5
	dL8X/CJNffu7BnL8cARMRHV8Uj+0qrfhPLq5LUX6xYIeGGCA0zPvwX3BDgVXqRMM
	xscnh5CVktdxeF91wfw0Bhud2d/GlLSqmRFfgbngcdEOOr9xxuq8McFrpqOwrvyt
	wbHjwm/rAeqpl4v15DfdGtZgaKgfuYM2V2u/QZqpcYHDXtgE4tIRvTt7WRKu49gq
	kUy3YQbrqCjEY8ToKK8hyAVZqT8otPb305A2xkz5wWdytEEzhQmLL55Ell0eCdoK
	pzkMCCvUl/bwtGaQCTmUQY74H3OCAXCl5BnUCcE8oZX9lw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7t7jup3s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Wed, 24 Dec 2025 12:21:49 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f1dea13d34so134279631cf.1
        for <llvm@lists.linux.dev>; Wed, 24 Dec 2025 04:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766578909; x=1767183709; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JFFP5s6W87N/1+zfMWgQ1GNuxW9vgJ+7oIu8wbOa65U=;
        b=YLREFLa/Cv7AbSrLaaW1EKgg3t4eWHZaVioHJIUW+abrHAPHO4L0ZUdoFYb6Z8nDq/
         MpJMIgeAFSoQMG6iLd97kJI0WcNTZr/al/UcTjM/QRjRcoOYXQmHGQxEcLEcOZtl5p4J
         Iao37Fjy533A2iCwGN0pKiF2WVXjO4q0mfFXKfzWVLdKRNNVMk1k5+5FTMZWWTko9ypb
         LIb5TQiw8gaug0LaTL1eNLilXSsmkcWzbukzxXOA8uHF9MXIHRb26u/W3N6k2lO2XNID
         3mWXcyvbFFbiXf5eGnTJcbI4yFBVXPTj6kZqY5Cx2DcGT1bdZ0dkIdaFmV4KBGQeWvHk
         CAHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766578909; x=1767183709;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JFFP5s6W87N/1+zfMWgQ1GNuxW9vgJ+7oIu8wbOa65U=;
        b=lg826/faxDiM1PP+YxukbVbaZm++zJkc6EmM1P3yaR65r6YG8RSefi4pbo+vXmnXwd
         VzDcTl7WcgbQuNGA1AihSBFZ/gtKLuhDLpcplOTpQlXQ4QNR8gXHYyK1w5fb+jv6r5g2
         faTiQwxEeVUDJFEDho1MUpB6kJrnmbzg4LHJC6gNgngTlGrHPxIj5Zx72l3FFU0LWgzH
         N5Cj8BsHiOpHrFsP8MGjsI/1M/vtuV4QYYVNcJomdayuGvdKwiXf7MmACLE5JvbWkIt8
         i078VnMaGtUt2XP84n2ZdjMkbzVeyFqIza1y5zjD0gR0h+QMPyOvWPW1QtRC3M0Zgjvt
         w3Mw==
X-Forwarded-Encrypted: i=1; AJvYcCVBN/AtUZhhsj9JFbWCXVcdH/UaEEY2Dy8KIxmB5iX0pYWLnItMcVHFpfBKcBhW1hx6W9tx@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7zIcLD0cNNAuQ2rtRlQCqYHqlNbn8cRUTdz1GBo/xvJrQtGdx
	ZfpfCYbgMQCqhQXjHNwqj/87SmDJWYbJLnB1Rslsu8YUvE30DUFjVkqUz+EUahdQCw1i8ZJo5LW
	zDl9HTMmuGxxX7BvZ49ewsbIgvnz+PSFjoaaV06GzndzbTlcI4vWOgmoL
X-Gm-Gg: AY/fxX6vl6Vn2Wsrt5RzrIFfvjJeGaHdmbXLJGd0+WbIk+pCfL2Vv9sagULHbkbryYT
	bI5y/ypFg+LxHoJpZNogG3zHrQ8LrSG4W1LFTDsKccEBvLHmLnkc87D6xGo9bKgb6yb9+5bFAuD
	hLzBMbkdpKXC4vnzZoIsCPd6v/04aaeJIHbiGjZ4az8YUegMyaP1skY4MbZtH114CQGQ6sCi/bV
	TBWlUVMAtvZeNhWI5D70bfM9j3vAgpDSUrbnd/7NG7Wqd+ucfnSJFmypBtl7jCFUqDiLUE1ow2l
	6K0h5kMWP6GNAFoLHTb4ZmGmxrsNH638tbSQ+DV6ab7LuaAwR8wOdS9+e1GuplnOyvlR1we+ieP
	8+hZHdC/9D2RNyTcFqcy5pRE6vHqIGYKVkmb788K4comyRDvmNJ3ScvBWHivEbPcpd2LfugRSPs
	w6UAsIxWvQL0Fdw841bewmyfg=
X-Received: by 2002:a05:622a:5a15:b0:4ed:3e3e:a287 with SMTP id d75a77b69052e-4f4abcf3e29mr259174401cf.24.1766578908742;
        Wed, 24 Dec 2025 04:21:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEiQGFk5xnltCfr0bUaaoksJ0Dsy0sY1qB7Of/F2RoVpncDpBTQNaDkpB6NU0l+sxTGWsMlmA==
X-Received: by 2002:a05:622a:5a15:b0:4ed:3e3e:a287 with SMTP id d75a77b69052e-4f4abcf3e29mr259174111cf.24.1766578908295;
        Wed, 24 Dec 2025 04:21:48 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18618d85sm4807529e87.48.2025.12.24.04.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 04:21:47 -0800 (PST)
Date: Wed, 24 Dec 2025 14:21:45 +0200
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
Subject: Re: [PATCH 2/2] clk: qcom: rpmh: Fix double array initializer on
 Kaanapali
Message-ID: <oajs65zfu7gnskijpuvmm64qycw5viuqekklty5yowk6jwikks@jymfpp67dnnb>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDEwNyBTYWx0ZWRfX4GmYWqqcgmF2
 dJQbC0Y27CAIFZQ83irbq0jTv6YS3pQECc/UOZMkA6dX9UJ3+qHpWYAKRmSB+LuU/Tx17tWyxHI
 J/WnC5g39Mt+tT4hIkh/0fqt7op6O/WramyU9dBx4mrHlE3B2YwClqiZvKvzwWGD44j2HReBUD+
 +Ma/GnTOwaL/DazmlHWC5tIBqMtNgq9a/ZmwDe7NQTUXVLv2YSKI0vdOIUJOMtRGxs52aCRVY41
 5A7JsAT5Jszuqt5RebatuEpqlSIhwRCgT4GshgCpJZREY2WehqjaoqXXfEDoG0FgrGFZNI0c3+t
 4KSHvy2hBcyjLuLH7kmaMnPY2STtTWTtntjKlggSSdXO+NxMASHC2bEjHX1Fo/dQeDKapf+9WZ6
 CLB6ajszPiLKD1LiCxmLhx8xCIOo6lm3q9DThqKGcz9QgK8+S7T7N3nGLj/S9uqhJaCCZXe4AKO
 06v1iIipj800cWRaiLQ==
X-Authority-Analysis: v=2.4 cv=IvATsb/g c=1 sm=1 tr=0 ts=694bdadd cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=snvUICUIuoXJ_myJnVgA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: KTRYZ4z9c6J0YOSvVI3CXaWNU96PhIV_
X-Proofpoint-ORIG-GUID: KTRYZ4z9c6J0YOSvVI3CXaWNU96PhIV_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240107

On Wed, Dec 24, 2025 at 12:22:59PM +0100, Krzysztof Kozlowski wrote:
> [RPMH_RF_CLK4] and [RPMH_RF_CLK5_A] elements in clk_hw array are already
> initialized, as reported by W=1 clang warning:
> 
>   clk-rpmh.c:932:20: error: initializer overrides prior initialization of this subobject [-Werror,-Winitializer-overrides]
>   clk-rpmh.c:934:21: error: initializer overrides prior initialization of this subobject [-Werror,-Winitializer-overrides]
> 
> Fixes: acabfd13859d ("clk: qcom: rpmh: Add support for Kaanapali rpmh clocks")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-rpmh.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
