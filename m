Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623F5314A8F
	for <llvm@lists.linux.dev>; Mon,  5 Jan 2026 13:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767620061; cv=none; b=C6PJ25Wikx5hKZ58RCHn1ISDg9IPz0Njkxz6Ov/DPfElEDNf59U0RtI3m6Ky7vlSl+UHTvVtmUSgarSpaJnP1Izo0fg0GcJXFljWAyeTRhxRHviDWNTm1z4QEh9FPYzzlRuhh0kZXMIeaupVaZvqE9xYjilviUbdWaM448IoSBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767620061; c=relaxed/simple;
	bh=gMZzaSjVY4tZVvTQil8VUzRPtCxKhgc0IHDLGyDrZk8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CRIOPlxK0rbTvHuai2rCMp1Xbb3Iz9IiOFpRzjTuV2yf0Fs9hiYA8dKQbSOKhSlER4ULdWLc7It4q+X/8eOP/BDCYmUxkfvZuesyjKx6RYIc6xhCykV6mn1Rfhf/JvQ4HwQCv0MKoyJPiUk3mGBq6wSK/KanXb3wBr5bxAZGx1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D3GqdzVh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ObqrFv3a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D3GqdzVh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ObqrFv3a"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6058Jcpd3464867
	for <llvm@lists.linux.dev>; Mon, 5 Jan 2026 13:34:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YTDHI1cVGuUbPTIN0iIEO22xYa57+Aa9xdC1m5T633s=; b=D3GqdzVh+P8lxKak
	xY2E7ZQ7eyOZAywZB0ey8BU9stHjORNWbthxMrjWcamgAjxRHkm5TTsw2VczZXjW
	ep0idd8VLSlcOj5bIKJU+53zQ0N0ejTMiwQB4Crz+9/eAyrdtBhr975FGV5XM1W0
	EcurEwtrtt850S67vxxojPCWY19oepsMGQTG6XTGQIHdKGlE+qRmLxQNKN0csOuM
	bGNlcvunqwF/IaB6cgeO38Q+hpugBLYAZrFDpjBPbY7/UeJW/do5EB4/WRAx47y4
	eGQGPryefk1jqA0BQuW1+XGQHhY4nr5FwHs//kXpjJeDgk2EUghlVxQxqcoFRvfY
	CnGxUA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bet2qvswm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Mon, 05 Jan 2026 13:34:14 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee1b7293e7so540080251cf.0
        for <llvm@lists.linux.dev>; Mon, 05 Jan 2026 05:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767620053; x=1768224853; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YTDHI1cVGuUbPTIN0iIEO22xYa57+Aa9xdC1m5T633s=;
        b=ObqrFv3avI6SV20/w9hXJZFlDXL/3yTjrhRxcFylYs8gPsVh/RkZTfRFi1T4EYHuzD
         wmtw0O6dJnZz1l/G2sT4yBGzPn9fpaLPl2tw9dPmaT686WA1jUFmrCcxTn4b4BAvx5yx
         2mdWmt6uCc3mgePZU4lu6+bspVOuj3A6JfJML0bbsFg05wvUdFafEoApx2bGmCB5sn8X
         XHm3eSfGLpUnEKVB0Eg8Tq5QpX98+0N9beGpn1fymoNhV1SQuNnpjNcgX1uTeA1daqol
         VooDpSRqhn8Z9B/59j2Y2SsiYEyL+xDoVz6jf8RPEGFru9ayNOWIvjwgCmgr4mqfbrmE
         m56g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767620053; x=1768224853;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YTDHI1cVGuUbPTIN0iIEO22xYa57+Aa9xdC1m5T633s=;
        b=lMnAc1OD3C4mRcp47mhKOTxs8IW90M+C/G5j76uJuQYPyEFEST3HNAMtMrtXGObCBj
         JegCUTbL5H95dWldknaAeTUbrKeLh+afptQVV82lKDOk+RuSPUpdBtMHY9NCEdhQzfP4
         rxa6aD7+8ZI/kMZRI+4g/WeH31q1Xj1/FV/B1ugsGL0dHAKaEMrlWtDnN0SRPnjhaLv6
         jxFEwMVycHyMSi96zybUhId7sC5hI+mikn1JRt/VN7q7iq8dplmUxtH8KJo+2vF6A1x8
         MhfhCy4xs/CbH+THOgWPjWa/5aTHvDJHtOPdnQ+kM3LlHfju55dZzvtfOI+Z3DTloAhO
         pDzg==
X-Forwarded-Encrypted: i=1; AJvYcCUerPP78MzJH9pxEg3Pui0MkT4RMumf160dPu7X7CswcW7pDyNwiz8+jPOjlnrLZveRQIYi@lists.linux.dev
X-Gm-Message-State: AOJu0YxXy32JTcbgBQjOweQxsnL9Dr3GgCxuwT6o+kB5A3qeLgIy+MXh
	NW/ooB/ms1/gdYu/luWHF2mNbEQ6g8nV4p73O6YF6nBXLboPHAJF7fuxiUQGM6Yj/rtUvCpl7fn
	86DCjaYGyiP9q/Q6GGUzJaVsrRjiB7Q26tcdgZFhbWPB7DuWqtPqn2hRf
X-Gm-Gg: AY/fxX4Jc9jbi0hxSDEgz/zbrveqC7mU8Kdrl71JkYQ20lWdYaOsDCuzMXnnhxNNq2J
	8a/GTaQwEB5Ii2AijJQ7Us1rkWIdA4kxN383jHt9bHvB/5udmvshxKkG1Hv5ZT+bfgTDw9YFrkJ
	Tx02oXEWzGDvD4gUJPIbnzDP4AOuuLXJPj9ZIxno/bjwvqrqEKKNF6UtcZceao+DH4VLjSclz3v
	RRQr9dCwdqaQ0WEBZ91vqmKsxLRf7Md3NgekH6wSXYzU5yhhWDAZB/s+WIuEyXthuhhNJCHQAn1
	v//xDAM+mdC/ufaOjbnCF4aG3QBdckgxfKljFqmv63LoAwvjzJ7eanQeDBkZL48mAXoVgiN2600
	9PZhbcUcrO+mmNDzrovxyaLBBbEWT4My1Cw==
X-Received: by 2002:a05:622a:590e:b0:4ee:4a1f:f8ea with SMTP id d75a77b69052e-4f4abcfbaa8mr830028921cf.31.1767620053146;
        Mon, 05 Jan 2026 05:34:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHRkO0NCONkJWWXhAzy0ep55XiVJsUEFnaFCHhzMHAZVNsj44tHSkLbWNbO0UO4vNIzk1ruZg==
X-Received: by 2002:a05:622a:590e:b0:4ee:4a1f:f8ea with SMTP id d75a77b69052e-4f4abcfbaa8mr830028281cf.31.1767620052729;
        Mon, 05 Jan 2026 05:34:12 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6d143f75sm147211015e9.5.2026.01.05.05.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 05:34:12 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 05 Jan 2026 14:33:45 +0100
Subject: [PATCH 07/11] clk: imx: imx27: Simplify with scoped for each OF
 child loop
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-of-for-each-compatible-scoped-v1-7-24e99c177164@oss.qualcomm.com>
References: <20260105-of-for-each-compatible-scoped-v1-0-24e99c177164@oss.qualcomm.com>
In-Reply-To: <20260105-of-for-each-compatible-scoped-v1-0-24e99c177164@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1126;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=gMZzaSjVY4tZVvTQil8VUzRPtCxKhgc0IHDLGyDrZk8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpW7270TUaY6iNZZ3USQUUPyMVYCBnPviUFAJQZ
 SbtcAwOUwCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVu9uwAKCRDBN2bmhouD
 1x8WD/9st0kAgDjiJuLHe/DH08bLcxWpCZlth0KGlKegvN8Rj1R0QAKsyr+7yQgZJxI2zmLbtFu
 uHevP6bF88adt/4FfMMTJiGlsLLnnNw47I9kijxa0eob+ij8Q3c4aR2RQNI5H4L9YXS4GGvFm4l
 pMPr3mERDghSCXHaRRJ9AVOnaM9NGSstFpYBt9sqyql/tc7k/m3/Tq67I+dU3QIYbNb1dGl5m0r
 P0A++LSAUbLCusxVP9eWtPhFnS6fFF+LCxC5Cg/flpMX5y7tRoKcDHxpQgRpb1B5qxC20qOyXmf
 2ykplrlmCi4Vi9hM5euEu8cppTm6YFs0QTKW7YqIHORm0m5HtodFWLvgPaaFm2bg7uW9vaVaJER
 NQgrU7y+ZO6aGc8GOpjcLJyBC5spVcsUdcRLltJdlB3i4P027abTyxNlrmpQS96vY5i5WvX9PmH
 vRi/vBst2K2QmXUi61j7Gt06cNG5Q7aufKqp1FTFV1XgEiyziX5mbOaz0CRmmwP/DVMKF3PCCak
 kbVgAYKAO9V9B456wwx3hpvNokZHMHAnzIWeEXFk5LCMUXIK2shaxjWAZaJhvyUiaQxI8UjQ9hN
 yaNEWVOyWGWzXd4gkhRzptnmx9kCYHhUopwuXudzrTcobAEHqeqJIvcbNSZ/L64QtRtNlN4eOQd
 wE4SrRsGoLsXcIA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: ayuxvT0LSmkpu8AsDmnjFReP6IGyQQHe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDExOCBTYWx0ZWRfX0NHoOEGOZgMB
 5+S2nL9Lk+Mff+A1p6lPD9/oBkwBwM4DDLK1BncO3NU9r9AlkZpi9Zk6n8Q2ZWPhmHk1r66jOAj
 mHkScFE5vtF/vjVBKmaiHA15hK1wUFw0NURROlw6hdRHVS7kXqabYEvjoOOQ2iTSfrmktYuI/rs
 aG22p0MxtU0dd7kvvuKVoK0srIkjXH3DEyAmDj95bGghaobSICliL7Ya1rjuaUcxKoL6btI6fNm
 hCJIsIs6Tp8Iy7djeT7EHuh25Ivk3IREeu4fShXnp29B8KhFADX5uke+ly9JeRxubIgvT1RJqPs
 SYwRdF10ycwmeVv+r87vqp/X9tqQ9jpVeMvobHFour4u0gM0gRumv/3q39QsIjv9G0f9OOL+Qpc
 7al8vhuqo3NL/+i14lbIluSYTKdX0f1KUjI495+vZvhjC4xuWlM7kxwUyhvgxp9A2Y+LB36aGlU
 Ql4sdN+wrPmbcS5klLw==
X-Authority-Analysis: v=2.4 cv=RKK+3oi+ c=1 sm=1 tr=0 ts=695bbdd6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ZKLgdMRimQxpfTQYzWgA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: ayuxvT0LSmkpu8AsDmnjFReP6IGyQQHe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601050118

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Depends on first patch.
---
 drivers/clk/imx/clk-imx27.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/imx/clk-imx27.c b/drivers/clk/imx/clk-imx27.c
index 99618ded0939..f2f0d3fe5c52 100644
--- a/drivers/clk/imx/clk-imx27.c
+++ b/drivers/clk/imx/clk-imx27.c
@@ -171,17 +171,14 @@ static void __init _mx27_clocks_init(unsigned long fref)
 
 static void __init mx27_clocks_init_dt(struct device_node *np)
 {
-	struct device_node *refnp;
 	u32 fref = 26000000; /* default */
 
-	for_each_compatible_node(refnp, NULL, "fixed-clock") {
+	for_each_compatible_node_scoped(refnp, NULL, "fixed-clock") {
 		if (!of_device_is_compatible(refnp, "fsl,imx-osc26m"))
 			continue;
 
-		if (!of_property_read_u32(refnp, "clock-frequency", &fref)) {
-			of_node_put(refnp);
+		if (!of_property_read_u32(refnp, "clock-frequency", &fref))
 			break;
-		}
 	}
 
 	ccm = of_iomap(np, 0);

-- 
2.51.0

