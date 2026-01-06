Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C1A30C62C
	for <llvm@lists.linux.dev>; Tue,  6 Jan 2026 09:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767690936; cv=none; b=tIfSKQXh/TSKlvbXFXbkh+5hjFyR9CiGPQsI3NI4wuCL6LqKM3Acno/NKnFGcXJWdUjbOqnM6g6ivz/y4QWY0+zkR4OiQ2+CsyFs1PHvlOu7pJL8mvbi8sWG91A2UiMFX77EUIcLs+CIhviFtkxbSWFRAis38u2u/oNlz//9NrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767690936; c=relaxed/simple;
	bh=JLd+YJVelW7DAYz5I5oq+Bq5OMySRygwF3/FHKcXlRE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uQV5mJuCp4fSKqK2/ZZDzvQzVOxcqsL8rkrvKJd2nIowszZAFBA01wJfzCh+gIScOMEgiP4t7jwZFJPljeR38th7MBxddbnDu8ZO13n5BmFiQgFhrla/iJwUiQRn+ng2luyuW6yDk0GaeF6OldjMtvoRQwG0JDaBQXmyt+pboLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jyPHtjye; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V91UvtuQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jyPHtjye";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V91UvtuQ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063QJ4P3271524
	for <llvm@lists.linux.dev>; Tue, 6 Jan 2026 09:15:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	apBQxo7qSrwo1nwoLIpfGQYjycgRUvqMuCwBV3g5lLc=; b=jyPHtjye2eAPhVOc
	PoAK8lUqtWAiT8w8TQfWZiRDQ9pGJxBritSL8tg0Y4L56BTFb6DAMYnIj+86Jnb+
	HOIY/Nmq2E/Mp//T6Ffru9yH654dokV6tl89I1XNdbaSlJw3iklF1VHjrOTKRJMa
	iPtsqn4Zig19W0IQBIok5o17eqI+EmNQCvO5Gd0ch3Zw8Np69pPHirjWHn9SKB+b
	LV3i4wS+J5L1hSd+BRvGIGV99VYDqED7UgA/WApXOhV8Nx4sPT5Dhdk2D8iNy9gO
	aOXJM25hacXO7ZiExwMxxF3FrNzKjNCpSvuka/FOn++kqf/ElGWT96vL1s/5aiZ1
	reVXWw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgfv02qec-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Tue, 06 Jan 2026 09:15:34 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f183e4cc7bso14963361cf.0
        for <llvm@lists.linux.dev>; Tue, 06 Jan 2026 01:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767690933; x=1768295733; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=apBQxo7qSrwo1nwoLIpfGQYjycgRUvqMuCwBV3g5lLc=;
        b=V91UvtuQMG5LxsCW3MqPFm6r0YcVuXa6KKm7J16eTOSaWe8YXuSkWU8pwDee+tM7gm
         b1X5hOenko5f7sKdc0zzhrib6IQFijTDOy8eRXiHngmqEuMWjukxfebdcquqUklWhkek
         xkHQtQ4hlhtNcLxot8ohHnfYtK6vECdoIl/3YKeAeoDsPXaYeoFJdIW99Tx7ZMYQBGN0
         fzmSTCJLUBbRf3btCo+MxRyGtGEg0wzIdhUmbWwEY+Ziht/lXfiiueYGInLPsDg811o/
         llIJNwsQ/6bA+rvZ0JVEqj6VsISzFjuTVeDIeDVlAyNrMLbjW5wGvZjYhCBZXwNTVy8X
         zrVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767690933; x=1768295733;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=apBQxo7qSrwo1nwoLIpfGQYjycgRUvqMuCwBV3g5lLc=;
        b=jwgvgNHhjZ26i7sRWgOpybg3LbPkjhQ+4aBnglBu5s4lsD1Iyq/ZAIu77kAoS/VgCl
         K6qDJKPBFRAabFWujvlJJ5uuhI5SXyNqSuURFfLSXOfaa0dTXnsiz2KPM0Ui2lEI+KCN
         zqYXvITzW0Q3NRltFA8RpxnMNHCnVmpP6NLSsXbqhlwyYytn5j+RHI9tw3TxbeDqzjg1
         fO/Fhu+Fmfxpwlo1w5aD6CmXyvWi+A/15qu33bL/krhjeAq7eVT80+vggCSJo5Ra7nVm
         E9aacmW2U+o+u9hV+CXx8ad33xGx5z/9QQLqWCkDW7CKskAcF3Ij3Tv33GrzsiJvpMFe
         GwNw==
X-Forwarded-Encrypted: i=1; AJvYcCUWNRxqPnjie1WBfQCKo7m/jZJDiosk/fVlvofIQdNLV1T9yzV3DUDpHoc3xum0DMXNt2Qs@lists.linux.dev
X-Gm-Message-State: AOJu0YzcW4WnOjUhrsAGLambEnT1JeF58zwda7b640LggVTxGY4L+0ER
	d61l3QsUrRIoMrtJgN7sgv5wBVMXSHs37zU80NriYttQnPK2wrms4HZtkLOUkrak+bMEw3mrdun
	DNvRhfdP4iRczbV7TEO0BcHEvWlmK1CTmpyBtK+6blEnnlj3beffKs8xD
X-Gm-Gg: AY/fxX7fLAUp4dG7kFkKZL9Daz5YIlWaMqjewgAOKKkuY2CnC9ZhvSFS8FbiEAYopwZ
	hDpjp+O/lqNXs7qEm70cpDJRGTHK9ccnlcBTC6nMj7mXxGj08h06pypxxaa6ICt1YusJC5jJzL2
	b6XC7v750aviH32ukbcYvFYnQDSWo+sUOEg5f3+Iba24FKcDcCVBkIBhBFSmPjkakkhLVWLngqp
	lMyIQ+e1H0v1Ep8AgJmVA4u6FxBmk7eUFEHbxdO2sOpcd4xx7jEKShch1PDi4674L8Xp3K5pHUI
	Ucbuy+Ygz/kBTeUSLl7wKPPEIGzS35/j1i7gZMSndIr4wMw0l2xCyEviS6MrcaqwUUUwBxv0aB5
	eY0KOsvzzvUYup0cZofCFLffSdkhe2DoEDA==
X-Received: by 2002:a05:622a:493:b0:4ed:ee58:215 with SMTP id d75a77b69052e-4ffa76de37emr30150561cf.35.1767690933152;
        Tue, 06 Jan 2026 01:15:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGU3Y8zmw4yDdSsZkO7a8vArQ0g4z9wcGDwN18iKO05ZqGqQu4wJ8DuL7AWHNnJ0SucciF+eA==
X-Received: by 2002:a05:622a:493:b0:4ed:ee58:215 with SMTP id d75a77b69052e-4ffa76de37emr30150331cf.35.1767690932699;
        Tue, 06 Jan 2026 01:15:32 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ff319sm3271370f8f.43.2026.01.06.01.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 01:15:32 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 06 Jan 2026 10:15:13 +0100
Subject: [PATCH v2 03/11] ARM: exynos: Simplify with scoped for each OF
 child loop
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-of-for-each-compatible-scoped-v2-3-05eb948d91f2@oss.qualcomm.com>
References: <20260106-of-for-each-compatible-scoped-v2-0-05eb948d91f2@oss.qualcomm.com>
In-Reply-To: <20260106-of-for-each-compatible-scoped-v2-0-05eb948d91f2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1404;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=JLd+YJVelW7DAYz5I5oq+Bq5OMySRygwF3/FHKcXlRE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpXNKizhg0XZxRYwya0cdJWbbigmzWMszpBlU0f
 m1rX1SufhSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVzSogAKCRDBN2bmhouD
 16WcD/9AhTJOymnDzTKEIECQkDIqwNngscSld9son4Qg1SfT0m0VMq9fHgWlbKbWiApl9CN9J2O
 uESLQE2cmOqFiDE97+ECgudVTYu004061lm3PoQgKxNe6wu1KGtTv8b9izPrlHN4H18M/Xfe/TY
 +95V47mm8FsjC03fWPMoad2dNAbSeglSfoITtmenOcTruqyHxZBwKYOuJaxlPvgn+Xl+TX/sdJQ
 CdbXwQj5gkFylKFlDEWfBVfcHEzRm5qCDIffdoH/lQc5vOjbp/18olrjxjwbYktFI/NZLnWB/6S
 IqSluu/rV/AL2/YkfYpOd0jWcd86Emfe7qumv5diaxtoQK8vqz9p/Uwp/0RZhPjE1CIqRUkVIQ3
 LUXb3vYW1b3fYYHQc0XJqe8TdprAvIisJS+sK8IYgEIeZ9r4ob2mFuurqXosFeM7K9kRD0wHSpk
 zJ/Dbo8xhRBSlqGwCHYiuUr5xD+9Xg2hej2sjSQt6xn3PbbNZZZYgCQV5ku3JZCg5jQRrmV6v2Q
 GQejma+7ZAlcvZYyKT+Ia+TC1jngq6hwyaY5JBi0BTXdkjeZRLcUEZfMftZtpreRex8OYwP9LaS
 sM12WcO970a8+frrRnPAZgGCLbeoDkvIPMf2xoJsHBz0QTDIXlZI86HCo+ybqT/sOAI+HFubvgd
 u3+klfTs97qeiQA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=e9YLiKp/ c=1 sm=1 tr=0 ts=695cd2b6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=kVq6N5mEIK0mURhpU1kA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 6YNW1SlOIlWTbCIUYl9Agveq6tTpM4Lr
X-Proofpoint-ORIG-GUID: 6YNW1SlOIlWTbCIUYl9Agveq6tTpM4Lr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA3NyBTYWx0ZWRfX/ra3KTIJ2VFb
 6kqnk0SC+s5wXJNkQAjlqg7f6c3R9kPl5cW8E+l2WjxaYKsVp7JQ02Yea7CoDdP1Wz2ioOR16WX
 voub0m6wq4lpuFOwgXT6mqltMJNZUeijclqjxtWCR6wICBSQ8cmpnhquRgzShAfl8Mhd5zNWILU
 c57+9alsMziza8SJ8P6JfIP0mamroU538d1gPk1i7FY2axdjnqc6BnBY/7h0/YyrB097wZ+9aoU
 qbzT2jifVNljvbUYMFvHLP8XX509wGo8ziREsVtn1xexqkChchxNWQS/sec7+RWf8DQ3FhUpjmt
 2AQEOtqxB91rOv3v6xlljDkU3aHYkQyuZdIQcvGk1pV7iSIfROiXTYYw/xBeD5cn8ZIHyYwUcbk
 jaCSjR9rFHnpGi8Zt/zzAxysQuhLxPaZjxsV9co61ZmlagWHvrthNKkcY7oJzhYeg9EXfKPG5CG
 y1heIA9reHsvG5lUL1w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060077

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Depends on the first patch.
---
 arch/arm/mach-exynos/exynos.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/exynos.c
index 2e8099479ffa..18695076c34e 100644
--- a/arch/arm/mach-exynos/exynos.c
+++ b/arch/arm/mach-exynos/exynos.c
@@ -47,9 +47,7 @@ unsigned int exynos_rev(void)
 
 void __init exynos_sysram_init(void)
 {
-	struct device_node *node;
-
-	for_each_compatible_node(node, NULL, "samsung,exynos4210-sysram") {
+	for_each_compatible_node_scoped(node, NULL, "samsung,exynos4210-sysram") {
 		struct resource res;
 		if (!of_device_is_available(node))
 			continue;
@@ -57,15 +55,13 @@ void __init exynos_sysram_init(void)
 		of_address_to_resource(node, 0, &res);
 		sysram_base_addr = ioremap(res.start, resource_size(&res));
 		sysram_base_phys = res.start;
-		of_node_put(node);
 		break;
 	}
 
-	for_each_compatible_node(node, NULL, "samsung,exynos4210-sysram-ns") {
+	for_each_compatible_node_scoped(node, NULL, "samsung,exynos4210-sysram-ns") {
 		if (!of_device_is_available(node))
 			continue;
 		sysram_ns_base_addr = of_iomap(node, 0);
-		of_node_put(node);
 		break;
 	}
 }

-- 
2.51.0

