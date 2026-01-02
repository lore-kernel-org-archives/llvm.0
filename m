Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F1131577B
	for <llvm@lists.linux.dev>; Fri,  2 Jan 2026 12:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767358199; cv=none; b=rf31R0oFB8pPyU45pQubbKiWjK8y7iTR26sgHLrO+SaM2i07wrSThkLSztKgSE2ANV/HSyF9zJT/v7LRJL3GRKkIMSZs3eJ/KiN7B8/73TGQJ+1Q9U/ZMZeu4mOHKGAxbIHzcOaPIARKVfAgMAmU5xPgO0oQRB3V7dIwOOWGPOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767358199; c=relaxed/simple;
	bh=kjdJYWdNUl5KclFKxYTWNNG5kkOEBU1fS578yV9TsrM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t4agwgNc0YY02wm1tIndfpKwDnH05p4q2CNtlLeyseuCUxt1HROwK/x2TDeOvg6VV1bCBnk88yRhJwppS3GQqVlnUGwnez+HAIwrbiBQ5v8DimUZWFR5rPa8f6MLU4zJEpUusZ7z416VbN15T2GiqOCOxr0vx8os9HnkPIM0a98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P0acStaR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TK/lZPV2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P0acStaR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TK/lZPV2"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029W0iW504534
	for <llvm@lists.linux.dev>; Fri, 2 Jan 2026 12:49:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WIoOrmukDmi
	KVA+SLtYYAQlXdF3Ad90O6gPmYeW1uDs=; b=P0acStaRJ7offTKMW4swuRsqa5v
	ZmnITIUjAPuumQTpMPvIN7pVKaCRRkeJ0Jx8vRNJeaHzH7IRqNR8l1GmJwDaJC7Y
	xhrS5qCR9v/KiqVWPQWBveQ4EDPp7ahCh/qP0K6qO973AHHqTaaLIywV0Ha81nuT
	2pIes9rZkTFB4M6ptyplDwnt4I0AWkowQWDSbyRs81uduMQWUnrXXxA/2uEDJnRJ
	HAp9fznuw4m6LlYJpYbVD0wzj3fEJg86yuJSU9XZ18v2rHwZX/StJMa9xBGYsKdH
	/05eBNuxDWnO3h4FhQRUO74RrfPq0JLve6iyZyjLyjdmvrtuLAT22f24cRA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4be8bk8qjk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Fri, 02 Jan 2026 12:49:52 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed6ff3de05so337590281cf.3
        for <llvm@lists.linux.dev>; Fri, 02 Jan 2026 04:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767358191; x=1767962991; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WIoOrmukDmiKVA+SLtYYAQlXdF3Ad90O6gPmYeW1uDs=;
        b=TK/lZPV2txCmXSRcA+PwcqBS2ty9FnngSi6EKChOaa5BX+/puQg5IbTihfti2acss5
         Ct9cS+08/YvycP3DVSjqi2D2/Qq5ttoUNTJtHwGQemHv70u8IG2V28X3wkz3lu1ZYD6P
         CkSfYNwqYtK/0F/2jRn9nK8HkX+dwgo3Fjxb/7g7PwVf3EHgCwFAya5NX1cZvCIjlYo1
         ZrrkG94SFCZIntq40QpCCRa1YSMZLpGoI7nZ/xEbZH8SHjwR0In0QI8zi0gnb/WGVY+U
         dQmKK+K7n3tXZgUfJBDqz3Gv2pfkAb98ccCzQHdtP3GzJsrMOgT5URbFwziBQUYNnI/T
         upbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767358191; x=1767962991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WIoOrmukDmiKVA+SLtYYAQlXdF3Ad90O6gPmYeW1uDs=;
        b=dVlHvep9hlogCvQjx+hAWUVaM/IRvbsbEixyB4qc+6ofcUp2L7BN0yA30JIZDSEsga
         GceNEoePgi5Ny29a1YbIeRyxszpPTERXPg02c8oQ3NWiLeZz5ITAS/O0CF9RLHESf/sG
         kOEhIArsvn/PbS6stGwnHUck6kA1z9HamSbRaBXmt3OzE+E7Qol7iFo5YCwHMRgbP+dh
         aB5orm9efa4Y0ChyAWheY1y+dhbpx3I/M+kf4X2ao7XdXoweCfR8FOjtYQ8kHNaMWflp
         2tXJQwARssT4ccAr8tVsGn10eHHkUuCqpIa4RnTvPDauBQ15KqK2rhphg8Lu8DtiE29/
         2rgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjF+G16PuHoTM1NTBwQYLycPr3x1kL4O6k9ZdNWnBftADyWTKHpREn3AWwmYRtTIRxLrB+@lists.linux.dev
X-Gm-Message-State: AOJu0Yyh1nE/8hKA7Y7ROEWz3FgvU6qlA1PJ4dv4GbNoAwpOZUQ5RI0l
	lrsFOIxnqrB9tL5BLYXLMpGKWAJuNT8H+/CsodAAyiCwJz23v8tcVb9wbZ2yoa+fsVH1FBvFywG
	Plw0+0sB9iMuS/uoa7J/fWy3xC1dD4PPlIAPGPjb0wAVESJrc4kRhILDb
X-Gm-Gg: AY/fxX7hNPAsqVIFmSVn/ocJvGy2CGc1OCrU3BSO0NDcLhzJBwlr2ceczOtgRuCS98t
	nMysPHfXYssz3+EfIgAjplGoGGr9TFBI1gz7dIYw2lOJF0qQgBGdCCjEBTuKL6lhlSB9Y6jQ3VI
	/msmBZ+iAIfpg7918qvwSsPTm935xP2pv7snFtSOgBFn1OWgOUWu0w6eSEVNpjwt2r88j7X+OS8
	op3M102AGy1wiN9xllpvrqMuLIwDu8FR/Dg95LCVgeKGKDCMWgvrA3NA/pgEjPA+v+DcZ1di5Xk
	hGvTABPN5HQjm+diwJTvgnUtEjWLJuQeYNgu0BMiHKbKogAgTpIgjgqndMMvDiUOj1Jf9zKkT4J
	7Pu5LV81USuQclWxtiJxO4y++JQ==
X-Received: by 2002:a05:622a:1f13:b0:4ed:6b27:1d1a with SMTP id d75a77b69052e-4f4abd0ffa3mr640014351cf.32.1767358191447;
        Fri, 02 Jan 2026 04:49:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGVMf9IMN/4MmVFAXCQSAmHxzLFU2UpefBanTHFfjDtIyZNkbF7ek0j2v2fBFEvKipCrfTGQw==
X-Received: by 2002:a05:622a:1f13:b0:4ed:6b27:1d1a with SMTP id d75a77b69052e-4f4abd0ffa3mr640014111cf.32.1767358191071;
        Fri, 02 Jan 2026 04:49:51 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82f6asm86385833f8f.27.2026.01.02.04.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 04:49:50 -0800 (PST)
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
Subject: [PATCH 7/7] mtd: spi-nor: hisi-sfc: Simplify with scoped for each OF child loop
Date: Fri,  2 Jan 2026 13:49:34 +0100
Message-ID: <20260102124927.64703-14-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260102124927.64703-8-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260102124927.64703-8-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1136; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=kjdJYWdNUl5KclFKxYTWNNG5kkOEBU1fS578yV9TsrM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpV77dQjeohSg8lei73Gg0uadUyLqljkiLtt1C0
 wYhfaAnr8+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVe+3QAKCRDBN2bmhouD
 1+DxEACTimO5Ql5LgejdoctH2lN8H00RIE66UE7YbHeS+LzxHc6Z16LUMwkdIJvE1wl+KRN3MqA
 QbTQYe8zyNyngNQSDxJvEx18VJNC4/a0Eu//latTs9k4tRA6HUFDr0J8fVOsA4UU4Ew6DKrIqxc
 QGKvtjOYT9lt4HQRuDXLJGnssl4HaFztnL8lta8xck2HQSIYWIHCZPud2H8XIopBinkAIC+YcMa
 2rp0lZTJH3bKmhtqizT+9+uIEF3CinYr56X9CmHTvLpAmz3tavz/QkB9CKwI5o4w0t9XsejOI52
 e59ATwz+4/DXiwrjXELzY0gbRfiIX41/cgTMzovDyT6OIls3IP6KcTKzioTeb1/f8GF3X5eZ2hP
 JzdeA3qQ4Wyivz/1UhUF2uRU2/dPoQiK+y5wJZNMcZ6UbpGQ/AJAVk36Fw6jWRYMzmEFlTDiIzg
 01D5L2ZAtnYOuIQ0wKhG/4Q5xAiPsOaUx6yHa/hlzkiwg7SSP5wv4l9L1PTEjNEDYaQUhLUK0Uv
 0lhn25rNmyZ8UapGaeRBQ8fGVXdvnDUbTtWBMbKbVlXxwLOlXu11MwIVoDygzNqtFZMGSv94Zcz
 BK+BonJcbetJNo8WckCosCezUHyStP+weL7Cdn5Pk43XRt7OmeNcO+cU0gogn+Ye+46YTLN/8Zt 0tVDSYxqgm6x2Ew==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDExMyBTYWx0ZWRfX1OkUIug8RgVh
 SRpU/iaGWGDfbor9viIloop5Uncs6s1IRN/+LOdbEbt9NsqKuRhNESqHYsYVAxpMMUQ66Cc+4mB
 JNP4Y465ZclYbLNR3GYWvzOoaBsE/Slb2xHxkGEuRhOTlikoDFpHxbYjNxgL/EDbTP78MG63yHm
 L4XMsBXiGVEAo7KiMrioUdJJ2YJsC3G9PntnHMW/91G+kP2XTSgs2k0fdHxNJDKzch3Ju3aqiri
 t67UMZ+T3UECDuVbWLUWCoFSic9iSozw9sXytis3JxRmmY+wdvJNJ3fgjBFy8FdGjEoc32XE8w3
 UjZkz1CkmrboDGqK/bnlaqTtatEuYkguDMgLevhj/UrGrCkW5PmWpqzuNcYpTG2XLc2XHuEGCZN
 uX8wSOtGIb+UBFWlBUSKiZ7y8IdcyyO3JoWbQcFilHC+Y/pgAZlbcaJ4I6Zf71DDz0nkj8GhCxA
 F736D70ch8Ku+IkLA/A==
X-Proofpoint-ORIG-GUID: fztc_dsmAriB7-NnAGmq4o04ZX_FXCb6
X-Authority-Analysis: v=2.4 cv=d5/4CBjE c=1 sm=1 tr=0 ts=6957bef0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=vTKw0S6QdLxGGRXgtZgA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: fztc_dsmAriB7-NnAGmq4o04ZX_FXCb6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020113

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/mtd/spi-nor/controllers/hisi-sfc.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/spi-nor/controllers/hisi-sfc.c b/drivers/mtd/spi-nor/controllers/hisi-sfc.c
index db948da2c4c5..54c49a8423a2 100644
--- a/drivers/mtd/spi-nor/controllers/hisi-sfc.c
+++ b/drivers/mtd/spi-nor/controllers/hisi-sfc.c
@@ -394,15 +394,12 @@ static void hisi_spi_nor_unregister_all(struct hifmc_host *host)
 static int hisi_spi_nor_register_all(struct hifmc_host *host)
 {
 	struct device *dev = host->dev;
-	struct device_node *np;
 	int ret;
 
-	for_each_available_child_of_node(dev->of_node, np) {
+	for_each_available_child_of_node_scoped(dev->of_node, np) {
 		ret = hisi_spi_nor_register(np, host);
-		if (ret) {
-			of_node_put(np);
+		if (ret)
 			goto fail;
-		}
 
 		if (host->num_chip == HIFMC_MAX_CHIP_NUM) {
 			dev_warn(dev, "Flash device number exceeds the maximum chipselect number\n");
-- 
2.51.0

