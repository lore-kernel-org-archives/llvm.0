Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E88B298CD5
	for <llvm@lists.linux.dev>; Wed, 24 Dec 2025 11:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766577340; cv=none; b=k9+FC1bskqgA1214HAVcYLc656GDjBg3EwcsyvqvQPAe95FhUEdxLOlHzEubImmQtQJBqNsrrZLfkpNGe/214uXtzQIQpnViBz9U7wqvd9amM6JldX8YXhDG6myzIZGse9PujBA/cnDeCfgdLXvScoLM2nTRfVVUXh1zYLxqW2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766577340; c=relaxed/simple;
	bh=vemuzK6Z66BYseCSrGp1BwERcxcZZRay3Ftgg54BBVI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NqjBH35s3OlDy1++/fqvaZibPpOt4sFehGosVGBRoft8/Hz4QUkuLpLtEE+U4JRh8/98n1hMlPdUpI8f97UIOlI96ek/VTX7t+vutZ9l4qIdeHOVZhd3VzjvVsQQ6okLPt+BQpUxWoSwgxWobcvcS0gg7T/FYOjfyc7p3iBCLKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O6dRQKLZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CqS/MMZr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O6dRQKLZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CqS/MMZr"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO9XTj7700449
	for <llvm@lists.linux.dev>; Wed, 24 Dec 2025 11:55:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=pptCuuTC1OOr2ay6czaswVQWYUdbU39uOji
	dp7GpfEA=; b=O6dRQKLZGceTfDz0hYPENIG0G3RNmJXSfaJud78XbMtwZWE2KPM
	12BxkXJ4/U3HBlMGPmEaxH/pfBt5MTsk6+o7tduzh2o0kKOzIQ6Gs/T5mPQx3YS6
	T57gmFICEaCWLMnqjH/oWv1SO7M7o8kAv9kwn/+VvEAsFGmWL59VWDqQWa2ljVMj
	3JCxiQYSdYjJiJosavDh4zR4dzKfkQU7gnApAcWFp9XHJgyBQ9mrf+lNx1X1Ri4n
	1Y0sGzhFJkFMxgpNI5vJnBnqgBpnID5/6gelPa5AKGvlWT/UexE9xhYD46xD3RHI
	bBVOZbkfMInO7aq08XPliPhKZRqEkJuB/2w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7t7jumb3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Wed, 24 Dec 2025 11:55:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed7591799eso141594501cf.0
        for <llvm@lists.linux.dev>; Wed, 24 Dec 2025 03:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766577337; x=1767182137; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pptCuuTC1OOr2ay6czaswVQWYUdbU39uOjidp7GpfEA=;
        b=CqS/MMZrczlarYXJaQoUIbRxdat7K6Z+c6TQLhSECWsCKuQJ3uvPOxcZxcII6nVImo
         bfTkczyBY+ae1Ti0/IVRnCxKi83dkHNGoAjRpLUv77l/1Cg81sQTFJtsyefQuudthvJH
         w5Hm54K5yXdtl6RHXp8u5V+QP8mjdhsl049d98uJQJcd6+TOPDf0wf+YhN9TUm+FwjAA
         bLLJr6BmzzUmSBikytnHLoLMZ9TIljJMUWRuSFGa6uNbCGg0rZO39JrPqq1+LcuIG210
         Gga3HskPs8DkXVpiJfcni8Zvwd2YQ+J5N7Et+MMQX8wQ4pKejK4XYh/oQ2CiMgRuXoz5
         TK5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766577337; x=1767182137;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pptCuuTC1OOr2ay6czaswVQWYUdbU39uOjidp7GpfEA=;
        b=LdcStwlzQwHJZHvXCzuTL+1e2v2zj5gDbZQ8ThjWNGFqusiQ3mq8QwfSu9b/Akc+BA
         F3LsfQ+p5OJPxbHIw2Hkyw1gfD5CGG61UpYKszgPtRxnNEIfhcWFEpgzcgiEeBZkY+yn
         ORDlwNjWY+hFGVqgWkbwOqt2/lurt+tXuo4Jyw1N52I1Xfjqct1Vk0aFwm695XbXv62f
         REOxwLKHD5ffzVBAxabAl3nzPn4cyNpJ/FaU5Qug3AHOrEWC36NB4K3CrsVvYoHafG0e
         oRfjflPj3sor3d6hbIc/N+0/qVmRsm9kYGvFxJ5y2eE716XHrN6hAHn3POnctIFSjE7/
         qBiA==
X-Forwarded-Encrypted: i=1; AJvYcCUn8aGH5glmVNeH7jEs5AzYZp/fEKlUvTh10gvOnVnSFqzelAxghm/OLQzXN19dpGB/GaXm@lists.linux.dev
X-Gm-Message-State: AOJu0YyCiq20ZFkuaxadoPCR6lXsw6TGbO1eX9ajnbxN6lrLcBh4th3C
	y3yjQobcdvNtJLbH8RPFiT/RedGdoQa0XAMQ37glfNmjzQBz7dw5044XFyuFNeee+AwTmxhzKgo
	ndPYJUil+NBj9l8GbYLQRWodeTV85YmY11ETEWkVS3ssxoPrzy589Mo3w6v+KuP9D
X-Gm-Gg: AY/fxX5LN2yv4AgP0H6mtgxWtrWVY7crznc8Bt5g8fdt526XhKPc0cQsY4ONR5HEQy6
	ieaDruRsTUxO8SKdaM0mtCLwTBEimRfOUqg6j9yokZ2ku2GkiHnwvEdUIyqVt8hJI7zHFxpLnKh
	gKZa8NL9oH00MZjT8Kigd0kuNzRjp8drFkIlVCbuP0ivVPWM3liGGasLCvVUmbewovm7iHeVPrS
	W/mnYY2qkalY1jErMcONWbPZKx3d0ocP52mGzeYkJTr84/a+5syg5xz/ydjuxnTjd/pRtAJnFDE
	cyOgsuag4FLiZwqIzL9DUwvsHuBdcy6+kW87Cg8eNjFCV4pptJYBP6KK8931uGYdwcgrhFxOQ1J
	eensR2F+4VesndDhNFQ/G2qND0pa0/jAuNNSqf42DEh0CtYHNa21/MYYBhb2G2emdgTVqkQ==
X-Received: by 2002:ac8:6f11:0:b0:4f3:530f:d752 with SMTP id d75a77b69052e-4f4abdf0a9fmr252540931cf.81.1766577337010;
        Wed, 24 Dec 2025 03:55:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHeViacEKRwjTIS0jjNlTmcjj1bhV4Nz1GOIydg0gyPvNKJdVkNhDTEAgASB6rHxaT18VyNaQ==
X-Received: by 2002:ac8:6f11:0:b0:4f3:530f:d752 with SMTP id d75a77b69052e-4f4abdf0a9fmr252540521cf.81.1766577336575;
        Wed, 24 Dec 2025 03:55:36 -0800 (PST)
Received: from quoll.home (83.5.187.232.ipv4.supernova.orange.pl. [83.5.187.232])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b9159a4eesm16344541a12.24.2025.12.24.03.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 03:55:36 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] phy: broadcom: ns-usb3: Fix Wvoid-pointer-to-enum-cast warning (again)
Date: Wed, 24 Dec 2025 12:55:34 +0100
Message-ID: <20251224115533.154162-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1397; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=vemuzK6Z66BYseCSrGp1BwERcxcZZRay3Ftgg54BBVI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpS9S1lAkJZZmCPpM7M9YvzU/rLS2mcNFsWehPg
 j8ECdGO3IyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUvUtQAKCRDBN2bmhouD
 1z3bD/4xYjvPn0SqX2FZC+wqx1X+YsgIE7EYwBmyh1hXiMWWAvk8LaAcTOp9AimevGbqUnrIlNv
 Gf0j+t7zkqaRL7ab96VKv8sENO+6NQqr2yyXw96dIohOoomo6AaoCTIhHOi9537OclmVeZ/ulaC
 q55zWYvSVIad8MHEvL5G/eVhG0IyZzVXfClA2ABSjCFTg+tTeF74vT75CtVm6IYPBlaG0cRPWBh
 G/oplrWTqOC5/iLYf8mBaFQFB+0TtrDAcQbp/PuNsXfF+WDcexVvNgax/qfHzrc1U3+In4A2GqQ
 0d79WvZr7fgF9J+5KeaEEqGqxShWJzpU6Jx5ls5zxpuOGdB/7JNKuYGtaTfCO+yDI5fVc+7QEth
 UL7UeEvbqTCFTecbJii2MnlVoQgT6LVubd4FG26eiLhVSqoaq+8MLTyjnwvDahNl/MbfLJjNkRE
 PBAzFQpIc08m+OuMbfBowGCQLWWhXN/Pw/wkxGqI1ZSYvyubeAdWmM4v+HYXNEgJF2CuvixyGZw
 O8MOIrcRpIu4wqWsrzg9ibljzgJkjK4CqJL0Q8jmu8vS8jEpB6wFMlSpWxj+QL2foxRRwcYGO5T
 ehpiWfTvsSDI4NSaZrI8sgX05MRq5qhKhxESWX65iRb4EDLnBFF4MJ4j1jN3uxpQSquQDNSy0Hv w5DJKn5qAbdNFXA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDEwMiBTYWx0ZWRfX23HJK/1tUTS/
 U/9lKCQts2ykX4ggoPcpMNh7+tJrikDw+7YhWBZXrM+JKTas7P4oB34oIAbJIrMpWrmAKeqEjUN
 BOmxw2JHYPXxvPzz1/1tuTMVo+RrCUIyMykA4yio9IM9l7neHdpnsDvfEDIo2yzGroS7FbjiEJH
 p3GcPDtqE4pI//hrHncAetUwtu7K1+AzMdOmWHC1htmcgBLhepD/NZct0X/Wah2GpQ3Cy5wGWYV
 pyyy5ZlMS79bNm8q7Q1Pqwn+aojk8U8Y9iRvkBJBaJoPzvt5/l+fQc9UWu2LlrPT8MVloT3dmWI
 VIF7Vf4CU0IZ3xu2MC8ZpXpo3bN7QvHgimzw1pTDT0abGtibrRPTc3YS73SiQONt4LcH6fPTMnH
 0dys7QLznLl2eDi1+jeRPHOBrib5i6UTlxCneI50iDVzArrqtpPnSUHyfwWRgOY+zCM4PHCQw+i
 7NwunoiKfA0P55eNVQg==
X-Authority-Analysis: v=2.4 cv=IvATsb/g c=1 sm=1 tr=0 ts=694bd4ba cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=urQ9wjG1USoGuMoDBEOPbA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=9BVSq9XGK2-IPpPmIU8A:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: u5mEZNcAA0dpKu4l5enNSxBlkmTtWF_s
X-Proofpoint-ORIG-GUID: u5mEZNcAA0dpKu4l5enNSxBlkmTtWF_s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240102

"family" is an enum, thus cast of pointer on 64-bit compile test with
clang W=1 causes:

  phy-bcm-ns-usb3.c:206:17: error: cast to smaller integer type 'enum bcm_ns_family' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]

This was already fixed in commit bd6e74a2f0a0 ("phy: broadcom: ns-usb3:
fix Wvoid-pointer-to-enum-cast warning") but then got bad in commit
21bf6fc47a1e ("phy: Use device_get_match_data()").

Note that after various discussions the preferred cast is via "unsigned
long", not "uintptr_t".

Fixes: 21bf6fc47a1e ("phy: Use device_get_match_data()")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/phy/broadcom/phy-bcm-ns-usb3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/broadcom/phy-bcm-ns-usb3.c b/drivers/phy/broadcom/phy-bcm-ns-usb3.c
index 9f995e156f75..6e56498d0644 100644
--- a/drivers/phy/broadcom/phy-bcm-ns-usb3.c
+++ b/drivers/phy/broadcom/phy-bcm-ns-usb3.c
@@ -203,7 +203,7 @@ static int bcm_ns_usb3_mdio_probe(struct mdio_device *mdiodev)
 	usb3->dev = dev;
 	usb3->mdiodev = mdiodev;
 
-	usb3->family = (enum bcm_ns_family)device_get_match_data(dev);
+	usb3->family = (unsigned long)device_get_match_data(dev);
 
 	syscon_np = of_parse_phandle(dev->of_node, "usb3-dmp-syscon", 0);
 	err = of_address_to_resource(syscon_np, 0, &res);
-- 
2.51.0

