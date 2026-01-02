Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA9E314A99
	for <llvm@lists.linux.dev>; Fri,  2 Jan 2026 12:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767358183; cv=none; b=amUeXd68Jej7hl+F5SQyiocVui7V8C6lWgUx3OTwgSKvfHMD8w/EwP6PXPqWG4pRO3b/Tr1j7Mrj3LVe/+qC2PdLQK32hX1wBRqyz322Zjucg2vq4xmPvZaXFD8O+Q/bUrJYDzCcJFtVsOYNhyrXh3Hb8EuKRi+evs9ovgrSnqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767358183; c=relaxed/simple;
	bh=BjNmgXZu/C6PcYYUnwNmQGnZTuHxo8Kxs1Eqe1Uto0I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IPlV20e/r6hGGjMwqxpsy3o5LI61xIEChoJ1XrzGyKsQko5ScjLt6LmaXwJKDYvSImSd1ihP9UMFo0ZtUARK2YEPDHUhDNExqw2ihIaOO8G6OGKcrzNTTpj6R3JtqNmQ4GRGhCJsX1UsjafaU6vwTuEwqmq1igqM/Hms90xOq/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AJG9yQhj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=elcxM0fG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AJG9yQhj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="elcxM0fG"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029WFMn824618
	for <llvm@lists.linux.dev>; Fri, 2 Jan 2026 12:49:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=okOB/hveVQZe3izW4PjCJpub4aYiYUHPl3R
	dAn+tkPU=; b=AJG9yQhjsC/PHRKDb6NoOf5z3Cm2DncEnSMVOOy9TdXn6YrwX97
	QWeocg1su8C3LI84ZAmDZtjTszIqlFPK5WxQtWe/FNnqmTh6+kzs+FV7DzRC/Rb1
	ci+DqmQlv2euzX9rR6vJEu0bK+e4ch7SVPqdWlXAEp2jSyXXnbTW7DAUl2+oL/53
	SDANjtmMHI80ghCo6o2MAlSent0qVZcCxnKzRb0F3+IxRyNSlMUeDhr91r9l6lc9
	neQ0ZBQM/r1F9y0UPX9N+ElugQbSpI9qDxCNlOJkLr7oJ2zDKi6b7jTI9tNJX1Fw
	7SY4ZGrIDlc8LLtU/aix9G8SRptFvukvHiw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd8533by4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Fri, 02 Jan 2026 12:49:40 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee0995fa85so365904351cf.1
        for <llvm@lists.linux.dev>; Fri, 02 Jan 2026 04:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767358180; x=1767962980; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=okOB/hveVQZe3izW4PjCJpub4aYiYUHPl3RdAn+tkPU=;
        b=elcxM0fGtj/CPXIIPdxnV9YJrtdsdt0lcvAhEZH4q/Ty2eVd1fW+/F/WuQgvt4kyVB
         iYCN3+cDWfH0c4Cci9wXDZNyF0Tahmaqoa/p4D91W5Q7QlG0NzQRB8tXrLsOSwy4knCP
         4UlKOT4IHnYoNDHyxsOWRUHJ/8k+zHDerIJGFgnngDIiKga8d5hzJBlxWVGaf9cNUUUc
         hxvRs+e3zBmMYxxCANI4DpWTpoEhXP2vSTDjzFygmOFtwfPW3nesHWXNxigmpo9qK+yQ
         HBEuIm/Fyuvo7x1bzuVzW9JC5KuoPGBOBfEpeUMz6bsByvEFPtRAiGtflsyP34fz2bVi
         Na8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767358180; x=1767962980;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=okOB/hveVQZe3izW4PjCJpub4aYiYUHPl3RdAn+tkPU=;
        b=RClTWhNejSGo4LIDne/fKwe+B5plbuXL5Fw5xocefIgUs7/aKDUzqk7dlYsORgXgFo
         uC3rno5Dp8f36K7i46Tepu4RSk2b1RVsVSR+YA9dj1vENXbKtOOSxBxkIdZc/bGlFJ0o
         X9iYmhLXBAHwOhf3PDXDXTyYtnst78+6SvOb3/BYBTS1wy8vV/4ZiwpGFPIAA99mtVZm
         iw2m72t6kWnJfygvG095Zj8amlhJcqyr5VGtwk3iaINis1w4xTHJ9ajJegIafLZEXkBk
         /jDpwAyYsul/MDbAooJTQnbgvzB8DKeNJJ/Nv+iGGZ5nbKIlicbR5+lKjZpXZw/QamLp
         8Xew==
X-Forwarded-Encrypted: i=1; AJvYcCUBCMEKA/dmFl6fuI3PRAE8fd5O5V4ob5Vw0FJwvR1J6pyE4viBesOeLvBqD+Me2WVGi81a@lists.linux.dev
X-Gm-Message-State: AOJu0YxCCmq6Bk428GbW4oDiGckvimhu8DUWpLWXydRIhcTwx/Ygvgku
	J/+ZmzRO1bkG8QL8/CYa/RSzMNtrdEbYgukmInunmFujDRnIldGdunIzYMjftH84IDxyBLY9lcA
	6LoxgtaAjjttBgad0drGfBfhRXc31ZSeovotCcDqBWCxZy5zGgcAwXVpX
X-Gm-Gg: AY/fxX5phYLyberZ2Em2YqDTh/91uzUyiQ4GWXx1JMWcuqQJ0SKt8CjBwonhgijnWT8
	48x28hoiOivSL2QC6MicloRKgp3c8MxY4JiURD2EhknOeaRL28U06fONT060XBmKmZ52h/zr0qO
	EFnrrl8ZCiRutvNuLXlITzFs99ile1vN+XlMMMdZW5rgVSYRmd8S/h0Xmr2Vgm7vb00yanC8jrj
	mBrhVOzGe+HQHoHeJFRiqwCjmItd9sHwioz6vrPFcKl2ae1Z/b91EZnCmVEQXSTCQm03uEVrbvD
	dh0zhptqmGCepoyfnjOt5vC9dlJFMxFXdfHqNoYjcbSkSo6eppBQzbC/kzIHX9wYl7Awn//6KMJ
	YC+a8/1uTjhrBQhlwA8bPfs9XyQ==
X-Received: by 2002:a05:622a:5792:b0:4f1:e9da:e876 with SMTP id d75a77b69052e-4f4abda20cdmr638557961cf.62.1767358179985;
        Fri, 02 Jan 2026 04:49:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHGnew5aLjuTwNBQsOXtMCif4sPki5iXh6oBE1YmYfrd+hANBnZi7dXqQvDf6yRpTSJ8xkG8Q==
X-Received: by 2002:a05:622a:5792:b0:4f1:e9da:e876 with SMTP id d75a77b69052e-4f4abda20cdmr638557411cf.62.1767358179587;
        Fri, 02 Jan 2026 04:49:39 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82f6asm86385833f8f.27.2026.01.02.04.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 04:49:39 -0800 (PST)
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
Subject: [PATCH 1/7] mtd: rawnand: brcm: Simplify with scoped for each OF child loop
Date: Fri,  2 Jan 2026 13:49:28 +0100
Message-ID: <20260102124927.64703-8-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1705; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=BjNmgXZu/C6PcYYUnwNmQGnZTuHxo8Kxs1Eqe1Uto0I=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpV77X+7DI5HXNxZXRmn2jvMv9n63YDl3ZK3ouq
 wgjSw+TjDiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVe+1wAKCRDBN2bmhouD
 12opD/9vfr5e/WPbyZgf7jpsaVgEPN/Ieku/SY9O3Xa94Lk3pf06FhnrlEZ7VDYxkmoefUhg1hy
 ecljEaUhRbaBBEEtB96LwDKV+rlZ+vcgTM6plHEYVId5wAys41mjKlZLbHJBk8bPpiEmyc8C84M
 Iqpipqrm0hSwYP8/QkUO+0Wbt25VCDTAAO4fJGmkuxLxmpvoUkDYITSO21cPIk+YISRVy8cUJua
 win1kMWtIwEk+oOQJ2cKDKD41b66aUAGJzoQJ6z7oPD6TEIP+PTbIAboRzsDThBs6t9pfxQBOZs
 fPhhSk1RUl9RcaGhkdjMRmM7oUM07dVj4jSPyLi87tflLVjExa1xCP1yKbWg3Q7J1lr1zW1TCe+
 agXwZNy6hgyF1ulo2im5x91yFUd0DmKhx9/1oJRM5keavuOPxteoi70VeRuBQyhs2korMFbqOiy
 t70sErPbm9gFGCzbvX79p2YX/39YYy3UUhTyFlvWPKs1gCnDphkNvJzOhmSvHJv2njd8/KxwUd6
 3q4qpkE0RZm8xsvUOjjviBF/0xCXdoWSSsW9/9sLxqw1x1yEsplpHS1m7aaReVQ1xf/kiI6Xmaq
 IKYWuMwPdRmqksqptBbTmRKmRQA8wyRKseV1YHlGBkfC0aS1geL4hjotZnBCJssKW2wjnCHOHMo GUJM/xl5jHABtXA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 7BiPXDeWUo6Dfd1I6NgubaejZeI-vvaR
X-Authority-Analysis: v=2.4 cv=fL80HJae c=1 sm=1 tr=0 ts=6957bee5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=2d2tOE_QhKb7NN0EP5kA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 7BiPXDeWUo6Dfd1I6NgubaejZeI-vvaR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDExMyBTYWx0ZWRfX2TBpMt6Rha9m
 jpbIiUWzUHVAQQmIizbcPWMlMrhuT4NWvT0FD+DAC7rEZufcqIIiMMvYbWvBchnAx8Kg0RMWOQ1
 Q4vXik7hzyD9aGWVd+cLjKX5cb9Sws8nJ+Mm51tGY6E7rpgu5cYksLRVU8DdxZtvje78Sqyct0W
 qBelNOxOx0ajSS4PXudADnonza1ujFh4kJEVBYG++F8aKBW+TYnCFQum++AkPEBDt8E+RkBAaBn
 SDJMjePjndUpJw76Nv8pjcHPau5EbrxKM6HuQ47z1coPOu/1+jtYsstS0X3TgOr+vvZGMOLdNV5
 gayJzTNujHNbGtSl50LGJdmIvptCQM+4QlWBfjPctU6fnzFPUJV6as8Fb11gjpOKytH9sy6Oewm
 dKMrECvtCWg9FShY8ghBBFK22WQKaCTlVF7kTUqBAHsNjtMHfNSZFAy4brKiTM0/Om8tPYvg1Kx
 meJR+d+7wUsjJztoLHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601020113

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 835653bdd5ab..0427d76f45d0 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -3298,7 +3298,7 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 {
 	struct brcmnand_platform_data *pd = dev_get_platdata(&pdev->dev);
 	struct device *dev = &pdev->dev;
-	struct device_node *dn = dev->of_node, *child;
+	struct device_node *dn = dev->of_node;
 	struct brcmnand_controller *ctrl;
 	struct brcmnand_host *host;
 	struct resource *res;
@@ -3486,12 +3486,11 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 		}
 	}
 
-	for_each_available_child_of_node(dn, child) {
+	for_each_available_child_of_node_scoped(dn, child) {
 		if (of_device_is_compatible(child, "brcm,nandcs")) {
 
 			host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
 			if (!host) {
-				of_node_put(child);
 				ret = -ENOMEM;
 				goto err;
 			}
@@ -3509,10 +3508,9 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 
 			ret = brcmnand_init_cs(host, NULL);
 			if (ret) {
-				if (ret == -EPROBE_DEFER) {
-					of_node_put(child);
+				if (ret == -EPROBE_DEFER)
 					goto err;
-				}
+
 				devm_kfree(dev, host);
 				continue; /* Try all chip-selects */
 			}
-- 
2.51.0

