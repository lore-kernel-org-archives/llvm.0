Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083CF3112B3
	for <llvm@lists.linux.dev>; Fri,  2 Jan 2026 12:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767358192; cv=none; b=O3nTH6mZym1jpdfaYe1PiBSPJbcUMoJCZseOUH0FXc4NYUELY2CnmwSzWcqGYSmnGAATR9NaybyBfUFAASCPTLrAsyuewMFhuVoqKO6cgeFOrEMKqc3ti6mYZ0ohCPBSL7VzbOY28I5DcCRNARHrifO2pCz4s73b9rO8fByUxow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767358192; c=relaxed/simple;
	bh=WKsUzSB5NIe1xJgJA3iTvoyEJt/voq3uK5YhgnzvsDM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rA21e/J5R2gpsG9rOi/FWF7F2Xj14wLQd8gtJ9DADQy5tlGj0XffFP70tIb6bPk0MCXOgX3EPQNxg6Wdk3IIa+2FAJXwDosryPPndsSB1LTpjdvs75OWBpdfBBAJEDSwsJ3Hz6a7CAdL5SVpjTzs2K484BpOaLWNKJyv/FN8Bss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ANicxl1W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R3nMnR7x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ANicxl1W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R3nMnR7x"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 602C00Tu314484
	for <llvm@lists.linux.dev>; Fri, 2 Jan 2026 12:49:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0a4z7tWbV7c
	PqM6DrSE7hr2il6yV/9/oG4yDR65zbps=; b=ANicxl1WbcX990IM/vlgkJskL4a
	7BFSuJdJ5lcP5UzYZs3UnEj0B/5G2CRPSaWawBH3rMnGV8Fy2XBEUPdjYfcKDGIJ
	7uFWj37UeFwBCAUqjk46HQ28gZiZplJd509Ga8cpD7wxB/mfQBKhn+aGVr22Kfds
	j4RzvYxGY++uhkG9j+GpcDlKdUQowqqE3VudfhVKHSNNYpeUP+iCkP4H9ry9dlrS
	LtLCCst09PY3mYVNXo7WIyQgPoGmhq7X+DFajHY4aFECQw6I9o+zwDlc2owOanSj
	aJmHTIDgW3i9mbrINKO679uoNrwPNzR3vaTzPhsnO1EfGY9dPjw4YZgw4YQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bedmxr2s2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Fri, 02 Jan 2026 12:49:46 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed69f9ce96so430316401cf.3
        for <llvm@lists.linux.dev>; Fri, 02 Jan 2026 04:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767358186; x=1767962986; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0a4z7tWbV7cPqM6DrSE7hr2il6yV/9/oG4yDR65zbps=;
        b=R3nMnR7xEKcdMuKI05IXy7FKHDT/9Gy0ODaJr3rgv2DsoLLS59N6/YB08dliyIaP+Q
         WWTwGopdi3z/IsDpX6SOkhQmFVZb1Z4kh4+oIxfhqtHqNHQL8B6OVSTRzdws+9mPNJVm
         8mNFkDMB8kyAs5c/rtOHTo0B7+EmwpfbfjbLx1HhF4HwmCPeFb5oDDfKP2138kP/u2j+
         dzOdK/r1tGs7AxDHlVaOrSECxLT3dzXHBfRMwzZMcWinrqmu692Xe8tYWV1d33fqc5ja
         S2wGx+Az7ud9Y/9DGkYAkyQ6UOScEpBTLa+sd2F4rSqv8p3KXdX5K0tShx1wPzwduOow
         3jnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767358186; x=1767962986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0a4z7tWbV7cPqM6DrSE7hr2il6yV/9/oG4yDR65zbps=;
        b=Gm19Khs/tY1mBxZWvXzDDfeUAS9Zp8y9fb/e2d1Cwh+UB/lmRiDfqzY4tlKQimDjcH
         5Rpv4bWvsojJI8HWfVupolxuHUjlobBXx6msRcdeJD4NV5uaAKEGP/TD/VwtDK4y9rHT
         VU33ZL8A7s82VmG9TlGkcSfL04N562wJphHkdt4pkpw28Tkt1p4WT2b9iQNBb+VWCwKY
         VKueO0G4638Qt+tQh7gisZ7MJG+Y58RE/tbwH2+2xevRMJsReevNTmT7c3r4mBxWRfsw
         m4QCi7L8VWbB3CslZrvwM+ouP/G/gRp+3N/NU4TRf53bXZb/3okpg/Vqi/Q4Jto/3NpZ
         P9Bw==
X-Forwarded-Encrypted: i=1; AJvYcCWZporXqO8ClPkXnzplXfJ0VIjGazQy7a8CrRLG020jPzng17xVYrNRntEHSKlU/ApN8rVy@lists.linux.dev
X-Gm-Message-State: AOJu0Ywp7QQ1c42HACYM25HMdLfMBCWjpzlZOyHSTjUypk8bZxyBLlYI
	ACU6z5jmPMzZZF2oRS4e+j3WVPoc7wCl0DQYY7tNpn/D/1O76Ge1giwbOafIukVchne8C3JzxDu
	xCOEuQYbD/QlIxMv2xWJJ3vIBCEwc0ou8SAtXK4xQPRSuGETuqKbkh/8y
X-Gm-Gg: AY/fxX7Ypu8LIy/a5Tm9WU3oV3UUmP46YD9OswBFsb+BSBo1qQgGVf9STbQWDqNyQl+
	83EbzXw3wpK2wa9bNfC9shpFrRB/+ggHcMfZCuHjPfhl1MZOH3ZReKV3sx93CcjA4EXTMiorXu8
	KkxaJCZaEYB5j9EUbBgl6wGoflHMw0WoOW7MFwNYJSu8Is4Hgc1xwuhkkv5+FHrEXVMxTvkq+ia
	sMnj1BYTQRo1pNBtDt+lY7a2ku0JPEHgscwh4Xc3Ah+oV1ONh58zr/xuOdM4ebcpsWC2QbMl5Nc
	Cot0sC+yNhgIefwwLvvjLCMMUTL+4k6RVHaHXt9h3SVISvhuRlIMrIxqgHsGCc11YwYRMZhxM86
	imPl5n0X5k6S664SNY4Km+6ycew==
X-Received: by 2002:a05:622a:1390:b0:4ec:f969:cabc with SMTP id d75a77b69052e-4f4abcb8e00mr513642771cf.10.1767358185819;
        Fri, 02 Jan 2026 04:49:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGVBupyh1i7Yhgm1qePFT0hVTvPy77WSZBhwL5Nr5X5pvyUlLefbQKpyRSWJBl2fU6acK4kiw==
X-Received: by 2002:a05:622a:1390:b0:4ec:f969:cabc with SMTP id d75a77b69052e-4f4abcb8e00mr513642351cf.10.1767358185429;
        Fri, 02 Jan 2026 04:49:45 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82f6asm86385833f8f.27.2026.01.02.04.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 04:49:44 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Brian Norris <computersforpeace@gmail.com>,
        Kamal Dasu <kamal.dasu@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Harvey Hunt <harveyhuntnexus@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Pratyush Yadav <pratyush@kernel.org>,
        Michael Walle <mwalle@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-mtd@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 4/7] mtd: rawnand: qcom: Simplify with scoped for each OF child loop
Date: Fri,  2 Jan 2026 13:49:31 +0100
Message-ID: <20260102124927.64703-11-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260102124927.64703-8-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260102124927.64703-8-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1186; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=WKsUzSB5NIe1xJgJA3iTvoyEJt/voq3uK5YhgnzvsDM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpV77a78BJV2bdK0UdQDD7V7cRyRBrlL8h7NxaA
 IsGC2wLGYqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVe+2gAKCRDBN2bmhouD
 12bID/9Wi7A8E+e9tq4qi7HQTwIcsZvCfBuY+Q750Ud86sGjMaXi49XMxGYCzK7nGlB2aIL447c
 cPGsZrZMv5tam28NeRhX7719CcinVuum/vPTVcadJtsglQN1QPYHjWi6NxCZytriNTx1pJYgx9i
 kJqy2SCOkMUNutSut0pimP6SpghiSVLFQtWhDegMCw4uIJnnb6TH0MiNBQziqgQRXj7FCHQtUuv
 9lWVbchA1nbRg5ai0dSfVCKtZvIR18avdtf0qw/xR2RbutgbO7pWfb57MrFK14ThksnbN6nei6D
 ui0fhayHOnVl7vW3wZ9f8hDGNDlZASyS88C8I43anb4zbyM16OLpQsmbpYKB4rCdabF2n600hH0
 QHpHplaV7/AWxRDT4ogJ46I9e+6Y/yhnR2+IgDgkul+s0rhfeVN2oxQxw8i4ze9dQllfEvW05g7
 sU5E6hEO2Nu9NQYEXOKMHfaNmwFO5qX3iC/R1e2+R967q7K2or9EnDExD0oKUTYM/Y0b92I7Smh
 mbkihOo4wIHw3qcj+X5EuIKn9KoCAVTODAMPtaD7e7lDN1Wxb3gEwO28EHNLaz0uR2qoTBPwAJb
 HdjLy6NM2ndJ55qV4sb859e5KL+xXwn6TJp3nIJGYyzWXaeYIssnofZXJPUmDVAIuqrZtnoAAt2 BMsAqbWd5SmJKnw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GupPO01C c=1 sm=1 tr=0 ts=6957beea cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Wn3wlxd-YHlgXba-soAA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDExMyBTYWx0ZWRfX/2c1cY6Uxmwy
 tvdhc4aFBoKdQO36R4gfKmYm/D/9Y3TI7vaoUeQ5kyEbQhy6XojT9n3OklLGajTp36qlrXlik7X
 MhJZ/kcsAv6dxeSL/vj5hS6w9hkJ5l+RM4Bi9LLL+IH9qdglyzqcGzFYzkC/i1CR1lD1xM+MpRR
 NFoY2dEw5Fe52XxM1algmGWoOI+v++nxxQtZoSPLT6b/0/VidAUpmnRuAr40+zSKQY4kR8Ke699
 up2Q+crZWnGb6gQzCqa5lCidlMdc0jZ5ypzPqwyS5YcdFPw6i9PuljzKHTNvZNu9OFHEQkD2cgy
 6L6+BFNJVbeHo8zFLFuHGRwEVneMNTHJo8NPNyLYnwjSOHOuliiOHJxlC7BDOQanlU82uko4vm6
 Xt3hzct4WDok7ru952+5JRz0RuP4WUOueKVAfOl/RpY3HewEPedxSBH34Wh7P9Sx447tiTMA0y0
 +mK4nVh+sbWhwKm57sw==
X-Proofpoint-GUID: 4KPTmsaelTQiKr8bEncbIbSbs2H1UiD0
X-Proofpoint-ORIG-GUID: 4KPTmsaelTQiKr8bEncbIbSbs2H1UiD0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 malwarescore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601020113

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 4dd6f1a4e797..b7e79b76654d 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -2206,16 +2206,14 @@ static int qcom_nand_host_init_and_register(struct qcom_nand_controller *nandc,
 static int qcom_probe_nand_devices(struct qcom_nand_controller *nandc)
 {
 	struct device *dev = nandc->dev;
-	struct device_node *dn = dev->of_node, *child;
+	struct device_node *dn = dev->of_node;
 	struct qcom_nand_host *host;
 	int ret = -ENODEV;
 
-	for_each_available_child_of_node(dn, child) {
+	for_each_available_child_of_node_scoped(dn, child) {
 		host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
-		if (!host) {
-			of_node_put(child);
+		if (!host)
 			return -ENOMEM;
-		}
 
 		ret = qcom_nand_host_init_and_register(nandc, host, child);
 		if (ret) {
-- 
2.51.0

