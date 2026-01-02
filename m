Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCAAC314B76
	for <llvm@lists.linux.dev>; Fri,  2 Jan 2026 12:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767358185; cv=none; b=g+0swmDNRVFyyqD9kNrKdwL1qWrKBp9rg6lrgdwWm+osnmRh58qn9AWHm1uML0QHuDCqgJTI7+Ju47QeM9G7UeLAKAXSBRSIhDfRc6gT1l/PHWitqH5vDMS0TbDuM9ndtk5bTUBd0SNBrHAyU7qJXSxYNqS0lvKSU2hypFoOGFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767358185; c=relaxed/simple;
	bh=sBSnKcyMGQZIqcjce3lbMUghOycYQyfzC3HJXcyHbGY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qmjTA6qSkok3OhI0tkd6WSJWJQUCkv3mGkBL9pQMXN0qqNSsIpRB/XnF2lDMjJfZalXO9vwp355aUVxuaXNASdTmzVcbq89pB+VdWlnvnISZraS9Zf0JYOfNSDiw8pOmEc24UatU3Z682UbVzeJVfqyFD0YiHtUyFMQRf6PrVuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FCrAMEE9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YCSejHo3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FCrAMEE9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YCSejHo3"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029WIvn427479
	for <llvm@lists.linux.dev>; Fri, 2 Jan 2026 12:49:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=imFOXG0sly0
	peMhXKSlV52oA/rftbzRYv5spTS32Zjk=; b=FCrAMEE9y+id5h8z0DN8Iv3OAug
	LLDwb3y27vUY1LWNYcWH419RuN2r7zqKpuzEtAErsnFf02A+ZmyazLwhnXaW4NnC
	VAMdG+SQG0MiQe6wb3bBKYlM0bLiOkDVNX4898z5ahnuspizgZpW1Kp7R66024XZ
	EkzwENB6GGwYlvnOjGe4/qtgUPJFNDI887RRJQ75JEyF8Y8DZAuZFGuTcIeeMtzK
	k/PHYlbnqsXMlSCfZ+n/eIYxlBvqDgb6hfrB/sM9vbPR2GunbwGDt1632bKwN90M
	B0r4aW6wzD1BmxYKXtyi0uDRFrq3qkpKzdjhNsI34K9YdAWVZC/VeHxwD5g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4be6fjrxqg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Fri, 02 Jan 2026 12:49:42 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88a37ca7ffdso174078326d6.3
        for <llvm@lists.linux.dev>; Fri, 02 Jan 2026 04:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767358182; x=1767962982; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=imFOXG0sly0peMhXKSlV52oA/rftbzRYv5spTS32Zjk=;
        b=YCSejHo3CrjPe58dluXybicqK7FcTVil8xLG0+AWijaCbCFxlXA7dRaagOxmgRh/V0
         4T0hulY+jcw/J85olAPh6pqCikjlUzJXwbRqCr0QUFEnYpPoCnBDS0R5EGWdVMjSy9pQ
         gf//MNCqvxNpO2Mq/j737eAMmvMPRX132MVwtTBIaCHC97bLrl/inxFVc1xKr/G/7dgK
         T5aiChxmQyts2DRCyaWcjfcMW5MRR15ghPES1OfEFqDAEZCu7hLoBgK2AZSKisd3d2xo
         8TMwyDR0cLbbv5uhAwXIV9eISfoTAOnm5x4XwcHikOzAJOLRENf81LTDBPRlEfINjiDT
         QX/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767358182; x=1767962982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=imFOXG0sly0peMhXKSlV52oA/rftbzRYv5spTS32Zjk=;
        b=OkPPZ2m50s91YogKC6r5V4zFF1quJT7llCr5BIUT33AoIXOduYmsDj2sYafjtUJv66
         8QS7gczmm5FEi3W0EvCf8+qHD+2/QnlG+OOTY0IvslC4TdqJEycGMnLZdCEEGBAVWX8U
         awdXk2UrjX9vjj6dK0xbM3DVQX+Nd7QwSzJQCZzo97pK6FaTaWJtM56qdSOhM0uW6u7t
         DzmCd0lIuzIvXwqWEDtKNGeubhRojp9ywXRzEGSdFDCZiK/zPjpY+IfXoM3yWyuwdN/g
         eLuYQ7XGgD/gr3l/S4l7xTiGBrKy5GW7XLGpSqhWD2H50IhJKNGHDmJuar9tVTdkKX9C
         KcGg==
X-Forwarded-Encrypted: i=1; AJvYcCUrA/jXPKw5eq4rayxLBVXGByo5QcPI1d0fmQzUb3kDXvuimN3Nzfn76pQwhwTvKWfVFl2D@lists.linux.dev
X-Gm-Message-State: AOJu0YxwLROOOyqr9oHN561VirsQVomwPO6ZEUkTOKERn01g1qssG20o
	tUzVoQzjc8QlMy07EL0yAMPmcru5U7VT2wjClTlVQnEExaV12QKGcferROj7W/n3Fujg3xkbMm9
	soHy3/o+BlNOh0N7m4+MS5cETsvFha1B+6WXHaJj97J3mBh4vxaeKVvZ+
X-Gm-Gg: AY/fxX7ekkkVRZSJcFs7j+4ITKwRki/Fdt1lGaJge3sJpWQAKCU4pHEeFX/mmNipDjV
	FRJp80TLZFpD/9rVAqWsfrd7AzUPKnni3Yv1bbf4As2NmdyS8kBFpPXq54SEE9dMHSJ4OgVJLq6
	S8Uf6PT+1NErCuMU6RTSxeMCdpLVBL5fw8Wi82+zTRrAawndtiTkNApZUjfLXSGCcK9J/dugBhv
	CU5gyu2gRRLjxBZL33dfm7j26YTQQLcF/4rgn1m9FwpeyPD4pR44TapebRyorqeKQU4cua4Yd8B
	O8W39o6+WS/SfTIH5DGL35VDSw6p1tKo5Fri8eFm7V6NnrW6k3BtubIy/0pvIsdRZ3h0AtTo7I9
	VhaxoQW2evQ4fR0WVZEaXITU03w==
X-Received: by 2002:a05:622a:480e:b0:4f1:bdba:8cfc with SMTP id d75a77b69052e-4f4abd942dfmr645284731cf.65.1767358181993;
        Fri, 02 Jan 2026 04:49:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHT1txQdBszLd7m8UMVD5gJdJoPAWm8VqLTOz4fR95P96AkN4L2pVtSv48GMc2uikngxpnUBg==
X-Received: by 2002:a05:622a:480e:b0:4f1:bdba:8cfc with SMTP id d75a77b69052e-4f4abd942dfmr645284561cf.65.1767358181601;
        Fri, 02 Jan 2026 04:49:41 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82f6asm86385833f8f.27.2026.01.02.04.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 04:49:41 -0800 (PST)
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
Subject: [PATCH 2/7] mtd: rawnand: denali: Simplify with scoped for each OF child loop
Date: Fri,  2 Jan 2026 13:49:29 +0100
Message-ID: <20260102124927.64703-9-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260102124927.64703-8-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260102124927.64703-8-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1147; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=sBSnKcyMGQZIqcjce3lbMUghOycYQyfzC3HJXcyHbGY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpV77YCiAV7tcHXkpkf4bqBHwky6Qoz/np3HIyx
 MfEw1pn1cGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVe+2AAKCRDBN2bmhouD
 1wLHD/wKh5j1mcOQ0K6bfHRhqc1Y7UiVom1LjviO8AE6GDqHLuoea4sq82dEPvdB+iw7SIEIXbQ
 /xFNf+KfiDchxyuxQ+T4lGaZ8x6WAAx0X4vteAWTqG4l01FoqMBj8pVs8qBvXtJfczUuSKKWGty
 lHel4Tazw/t21yRSf+Y82KLxdE7EkZ1dZ9b09IJGrmxFmKcEVFlmzgW/Ld1sl9E+XavBpplsQNq
 LctU5OBW4R4qvqD4kJrYscewoMoQJTlPu7InLOkeqyCRUCpl1Fym987mlu28GZBYQuRSajHDOXT
 f9HPbuEodD8mLWu+8iOURU8OZ98wCj00bgs9p9AEVpoe8tnYnWUVggb/u4Ip7XbvZ0vnGg21b8Z
 G56JQoVCjK/KyduNGUkZVvJFEzQ4v+P8o6tMqlRKP/5sloqZwug29GVuBXi18Ul9gKVDV0EbgdG
 hcSii0FvyI6jaIIl7NF5ellj+qXUqQN8FKeIMSBZ+60IAfUzpoXB0fNsg774Lvkz+GBI6M+tKvn
 jWAL8vTI9b0K4sQD2rMh7u5l57MqBjUcDkjePNbPtJAHosyqtON/Jtq/BOmd/ZGkQZc9G2L8V6T
 n5/m44JVJ43AkOX905OuLvpKD/yO8gd+PLKiSENBUMdvNiyqTKLIkQURI2ozDwZ6l8uaIy/61OK 7HM+k/p6elpt54w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Av7jHe9P c=1 sm=1 tr=0 ts=6957bee6 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=nYNvWqTqVqtrO4BW6YQA:9 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: SDS5wyYZjXE-ulPRt6LCDG8m_iEBXZ2F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDExMyBTYWx0ZWRfX5T2iKedmpXWa
 0pzxcQxziQhce7SA3LSKnr3LFb/6EVmn2GaI/k4fRJKCB5O8IretnZvF5WJpL8A8ZJVWWvCaYuS
 fLFeR7sJuC84wL9LNCXfdh0PLeQiiZlQHIrpXpsSOl2VcQVftcyKX6fHmEnIXeW4KX5yyxzjYDY
 +OhS5bogWfeIsSDba3dLeYPbcgWzxPAwQgpgjsZ9svX29e7lNyuJt1o4U6Ni+oB+qYfgy1IEBfA
 7/2bLQXJ6JgXTweZAheENvOXjCqdTaZaLEn2y/VoxlNRNX6D+mzZQLXEq1Mhk0UYCpfmgCpGi1N
 I9mxMgFWyRRrIsZvn62fNQki6F3DsUMFN0uO7N9x4XGjZh2BUp/uRK+kqQCxYNRnvB1XQMjQ7/m
 Oi05wL2UlKYeL3748M3ozUQlIlybPtxZ90btpLL4WrLkbHvlY83JJIW/Y7Q8QNECEwk8guFLeqd
 fIywK/Zn+o7SBOdTSoA==
X-Proofpoint-GUID: SDS5wyYZjXE-ulPRt6LCDG8m_iEBXZ2F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020113

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/mtd/nand/raw/denali_dt.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/denali_dt.c b/drivers/mtd/nand/raw/denali_dt.c
index e0dd59bba4bd..8c822eae72e7 100644
--- a/drivers/mtd/nand/raw/denali_dt.c
+++ b/drivers/mtd/nand/raw/denali_dt.c
@@ -115,7 +115,6 @@ static int denali_dt_probe(struct platform_device *pdev)
 	struct denali_dt *dt;
 	const struct denali_dt_data *data;
 	struct denali_controller *denali;
-	struct device_node *np;
 	int ret;
 
 	dt = devm_kzalloc(dev, sizeof(*dt), GFP_KERNEL);
@@ -192,12 +191,10 @@ static int denali_dt_probe(struct platform_device *pdev)
 	if (ret)
 		goto out_assert_rst;
 
-	for_each_child_of_node(dev->of_node, np) {
+	for_each_child_of_node_scoped(dev->of_node, np) {
 		ret = denali_dt_chip_init(denali, np);
-		if (ret) {
-			of_node_put(np);
+		if (ret)
 			goto out_remove_denali;
-		}
 	}
 
 	platform_set_drvdata(pdev, dt);
-- 
2.51.0

