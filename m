Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB9D30B502
	for <llvm@lists.linux.dev>; Tue,  6 Jan 2026 09:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767690929; cv=none; b=BKqectpx0HNzY9HTHRqy6rESyxmRpRAmIjJCxLgC+UQjpKIzH07PhMFZ+PnWshwq40/GghYT8JjZ3xU4PeEstb64CbHInMFGN7tzi+PHqhx5Calq1CPZlzWnogAAPBsj4kAzHGQ40xrfzwQxHXjqZc/OCn97yO44+bfbtyBW4EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767690929; c=relaxed/simple;
	bh=yRljZXW19bL9W7HE6hwL7lUsKYJt+g5uw13tOylCf70=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=n/mQfUOeXr1qwJUyiUtoE898rPP4xJIkK8Quo2qTivEK0sr9b44CF4aYhSWrWNRCmncIeV84L9+0uRYG/i+Yb+cgm95MJnN8wMAgj1pJkVQF2LbmEylStQbPGAm+o2VYq6kBQ3JNue5K5+SOyhymjxQrN0oNgYoaIlaS9IDlWCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U1bI6WlT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ehhSW6hW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U1bI6WlT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ehhSW6hW"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063QFVB2922792
	for <llvm@lists.linux.dev>; Tue, 6 Jan 2026 09:15:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kSJ/eEbuN5yGHUMen9nJkB
	t0F9uVUPS6BNRUD76mvkI=; b=U1bI6WlTVDkpZM8Qhi/PtbYOEir+Rliawjr70l
	3tCpWrNpmA7Fqyn2fatvQsPJnKU3NTLpSOBFexHe7usoAbJs7zcjvxyNhkGjk4vQ
	T7LwPzSdfhTKaFPtZGyEzNbOBqX6zri7+JowmrKoNseH7B+336enRv8QjwbDEBKz
	k+LWUBRcrHU1mDfPLQxYePM6VkvhBT09T/ae30F1OEjayKc/YSWjN0tvHAUW48EB
	Jf9zlO4uelR3/hOxqd1Wm4/90DrRvmymrN7Xy+JpKX2JOX+T+HOb+H/NxJBvRwx7
	QzBb/y8lnroKKEvDqCjP1bFHxPUFKq2VvAP+LmgI5p1f/e5g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgscy9412-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Tue, 06 Jan 2026 09:15:26 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee0995fa85so27090621cf.1
        for <llvm@lists.linux.dev>; Tue, 06 Jan 2026 01:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767690926; x=1768295726; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kSJ/eEbuN5yGHUMen9nJkBt0F9uVUPS6BNRUD76mvkI=;
        b=ehhSW6hWVeoZcf0BZvyJhsLvHH5LO3pRUKZccefjQsPm/n+iSKvj6MSOxslOf3USjX
         uPO4pZWWKFLxHwcQ04VmsqkempEDWIvtuaBhU/GsWoGVX6nkW6Zm6zHRxMPpBalBV8Nb
         jCoNJaddNF3CKIgpNrR6x4dsgou8f7UtvJ+MBjbsBtznqMU7dxIXvE5x/5NNxr8t6iA/
         FjCPjImrmfrel7iXncYDDAIGS21U7Nyw3aKA1DNjRWd2J3lwSM7Vk7uraAPfH4idRKrZ
         nMqUyZNTEk9jDlWQdYjz47MC+lWn77WNbBDxwCrct2DMpN4wvRhNg9/n6lvWPwx5CXJn
         GzUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767690926; x=1768295726;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kSJ/eEbuN5yGHUMen9nJkBt0F9uVUPS6BNRUD76mvkI=;
        b=oVxLtNYbfOq4FMuIWMh+/0uNEMh7tosbmQnoY2Eb93Y08jNFqnFm4Gb6Brm35eZkdR
         Zcm0+F3si5Y8rRoV+zF1jSobx7rPulBm2QImjAAwa0NpqwiEqL+bPxcqqruwEj9zcRz1
         FfFgQs+FiTequ5GPcp9SVeE11Yks2SY0wXqiPNC5mwYDvsNRMAZGPDUo9ilrGJeohuot
         CfEXrBDwPqPBgNPLLoXCIaLyrTtJzAkIYAw33iPyqiz2GQ2WnHhqjivA+3hM0B+lP/KP
         lVEFxt3k2znGH+oJsIUK/qswSP03VeFn3bM7SXSLYtIBeUKpsnyM71UgTd9QiQ5+C14W
         NzwQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3wwOcen6DmvdR3DVjz7xJRGuP7vHPht1BmRqFB5BT1akmtH9GguaYPYLzS5YmC6iDTnoq@lists.linux.dev
X-Gm-Message-State: AOJu0YxDeYHYNi0N7tma8vUHUWKueyAug3sxQ30CsT0eHnDTyq4Qr2aj
	TOKhVWkR0sgmp/DsXNSFDFNLIeIBafgCuveNEjaOf6rNox6BXwm0J0ZIKU+wYGZWPtYzLIwI+V9
	+dZIHsTmJe1/MAdg6yLt1DQj2zzRCRE+C0eBQmba83uVtwESLNMAFTKqZ
X-Gm-Gg: AY/fxX7ZdLwAU4/aWkci+Rnfjj3o29+keUCKDmqUmpABxq/j9OiJR/pDWhJkW5yTfmK
	Rt/5d+oKMfMPWbQ8x5VMDA+9PPkix4Owr5D1zqTzOHZjJr4xsi/hsHH3pK2/YSonHZkbwLMgSQG
	UFsUKW/WbT6weQXBHIvWNP1IKp3sK7QKyAK9xJmKy/Chwp6qfvu/qlIEmG9EcKc7pxZt1phSL09
	AKHDhjxzYJ/jqb4lXYZPPjLSUVu9SQpOQ6LmaqFYjXcD1vxEm4g5Y7+RUM+4hSGGWYtc0ENXxFu
	LSmHrtvDwTl3KpfDu0Wt0sEEAMB2HWtFzfSoq/8ICO7wyyI49Rxw2stvZTvOLdbIJqK04GYiYvT
	b/Sg0TxDNtvX9n+BEljUCYxFuw03akXs9fQ==
X-Received: by 2002:a05:622a:5a94:b0:4ed:5ed:2527 with SMTP id d75a77b69052e-4ffa76d83edmr31813721cf.3.1767690925604;
        Tue, 06 Jan 2026 01:15:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEQYNJNT9XBZBlcoB2R09/O9ycRMo0pJbxtqm9oFSewi0KPlk1loubxpFadTbsB+xmiZjYXsw==
X-Received: by 2002:a05:622a:5a94:b0:4ed:5ed:2527 with SMTP id d75a77b69052e-4ffa76d83edmr31813161cf.3.1767690925163;
        Tue, 06 Jan 2026 01:15:25 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ff319sm3271370f8f.43.2026.01.06.01.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 01:15:24 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 00/11] of/treewide: Simplify with
 for_each_compatible_node_scoped()
Date: Tue, 06 Jan 2026 10:15:10 +0100
Message-Id: <20260106-of-for-each-compatible-scoped-v2-0-05eb948d91f2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ7SXGkC/42NTQ6CMBCFr0K6dkhb/oSV9zAsSjvIJECxg0RDu
 LuVE7h5yffy8r1dMAZCFk2yi4AbMfk5gr4kwg5mfiCQiyy01KVUsgDfQ+8DoLEDWD8tZqVuRGD
 rF3Sgr0WXuc4ZXWQiOpaAPb1P/72NPBCvPnzOu0392n/NmwIJOse6tqqqVJnfPHP6fJkxbqc0h
 miP4/gCVMO77tEAAAA=
X-Change-ID: 20260105-of-for-each-compatible-scoped-285b3dbda253
To: Miguel Ojeda <ojeda@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        Russell King <linux@armlinux.org.uk>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Nipun Gupta <nipun.gupta@amd.com>,
        Nikhil Agarwal <nikhil.agarwal@amd.com>,
        Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Vinod Koul <vkoul@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-clk@vger.kernel.org, imx@lists.linux.dev,
        dmaengine@vger.kernel.org, linux-media@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2503;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=yRljZXW19bL9W7HE6hwL7lUsKYJt+g5uw13tOylCf70=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpXNKgWPkL/X9B0kG2wUAH/3eTCaq2qugcMredJ
 KKTScL1obSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVzSoAAKCRDBN2bmhouD
 1wgND/47Id9EUUTVq2uKIiVZPyo1yp8da485u5W3t4dAchT72VuXV9Y6vKdcBt/nC96bIHsBsrC
 sXK9AmkmkMXhNIEzVw7moTKJHjbihXpyx33M2PaS0Qba02uKGDR/1Z8DS/FsIX+HkXvS4dKFkMr
 M9U9SDZv4zLSbQYtRLWEwWaiphkQyNYMul+NQPQeQb2hahhJS08BCmUTmB0WHo5R2CaAe4VXSsZ
 4/IBx//VTb+nBHW19EZVjY10fCyoJIEs1bbfrdhj8ALft5yhYGyKh91733GlSrOAxYS4VMigtii
 4vwOBDNFUdhWomkQTAucVgvS/jyEYq1ZyDIEkPk73tw7exz3vxxg6MY/Voo/I30IqKvHHKX1my2
 tqpTA7AOCBxVY/w6GDN2yftDSDraeEI3f+5ch55tXZj1gj9PF6V49cXNOPTvzgJFyI142eq++ls
 J1wsXLhBOwMp6iAx6lqV/UcKyJWR3P87F4YaMAKJrkroGFnG/XMc6CKbTMPn1n5DdQbd6frM5po
 //0gqRnPSCROhzjiahO5n1S5KG/nINY2wRqYw+aEyUluPGejKRFfq4q0O6u3MLUpbdTJwKtm4ob
 am//Nbt/BaDCT3Xd9Iv6CF6Yc6Q/MFargCzfOUderUoTTJ9X63w2tyWVn9S7U58fyP7B5ZNfdLN
 /zK2P0SbCUJMIbA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: QxVb9UAWBRLzr5prN_b3nAKTzZyPv-cu
X-Authority-Analysis: v=2.4 cv=fOw0HJae c=1 sm=1 tr=0 ts=695cd2af cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8
 a=d9g9ln5aRjr3gUnP3tUA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: QxVb9UAWBRLzr5prN_b3nAKTzZyPv-cu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA3NyBTYWx0ZWRfXxktrn/1pttty
 id7yU8sbCCEh9J5SZ03MXvDL7vzGB/hpvvp5IfSHQqv+CEd3vJf0H+qdUaXKw4Ai2KSMb3LTQ/X
 QlIQIPrg7DNJUB6J0x0a4KLAjPZdmn4ix2Drmaio1FXizGaN8ybcxGRb/z+qnRRedUU9ezLfaGr
 d8PfyFW/VlMjp0N74gcAGS2+JJJWrT6JOP56bwQgTvLeEqUl7k3351kKVgP8c37kuDWqr7KS4lR
 P9Dh4Ghpqr8GI9vm1lkQVxEHyA7OGxxYEDETCCp60XkxGdCc6BIG/plQ1sCoXVbUiX8AHEwWbzY
 VLbts20RLMfKdmptAuQ7SBijVLKFzPWAHuEsJLoxG4LY4DqWaZkWQBu1lnUg57o1sXShf6xEF6X
 swW3Xd8v2V7zy4ZDe+ICaJ0Mi937rfZNQJEKUeGUfJTRZpqAnkmYb/rmki/WTO+BakmaRAK11fd
 VCYxCf1zWQTSG7ZC0Ag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060077

Dependencies/merging
====================
1. First patch is a prerequisite for entire set, so either everything
   goes via same tree, the further patches wait a cycle or stable tag is
   shared from DT tree.

2. The last media patch depends on my earlier cleanup.

Changes in v2:
- Update also scripts/dtc/dt-extract-compatibles (Rob)
- Collect tags
- Link to v1: https://patch.msgid.link/20260105-of-for-each-compatible-scoped-v1-0-24e99c177164@oss.qualcomm.com

Description
===========
Simplify for_each_compatible_node() users with a new helper -
for_each_compatible_node_scoped().

Best regards,
Krzysztof

---
Krzysztof Kozlowski (11):
      of: Add for_each_compatible_node_scoped() helper
      ARM: at91: Simplify with scoped for each OF child loop
      ARM: exynos: Simplify with scoped for each OF child loop
      powerpc/fsp2: Simplify with scoped for each OF child loop
      powerpc/wii: Simplify with scoped for each OF child loop
      cdx: Simplify with scoped for each OF child loop
      clk: imx: imx27: Simplify with scoped for each OF child loop
      clk: imx: imx31: Simplify with scoped for each OF child loop
      dmaengine: fsl_raid: Simplify with scoped for each OF child loop
      cpufreq: s5pv210: Simplify with scoped for each OF child loop
      media: samsung: exynos4-is: Simplify with scoped for each OF child loop

 .clang-format                                       |  1 +
 arch/arm/mach-at91/pm.c                             |  7 ++-----
 arch/arm/mach-exynos/exynos.c                       |  8 ++------
 arch/powerpc/platforms/44x/fsp2.c                   |  5 +----
 arch/powerpc/platforms/embedded6xx/hlwd-pic.c       |  4 +---
 drivers/cdx/cdx.c                                   |  4 +---
 drivers/clk/imx/clk-imx27.c                         |  7 ++-----
 drivers/clk/imx/clk-imx31.c                         |  7 ++-----
 drivers/cpufreq/s5pv210-cpufreq.c                   | 10 ++++------
 drivers/dma/fsl_raid.c                              |  4 +---
 drivers/media/platform/samsung/exynos4-is/fimc-is.c |  8 +++-----
 include/linux/of.h                                  |  7 +++++++
 scripts/dtc/dt-extract-compatibles                  |  1 +
 13 files changed, 28 insertions(+), 45 deletions(-)
---
base-commit: 4d27ce1b1abefb22e277e715901cc52acdc5af2c
change-id: 20260105-of-for-each-compatible-scoped-285b3dbda253

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

