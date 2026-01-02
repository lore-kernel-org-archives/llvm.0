Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1784314D2F
	for <llvm@lists.linux.dev>; Fri,  2 Jan 2026 12:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767358195; cv=none; b=hNfZN0zUyC4WwgKjSffsQ5VZUBn89rw+15prwqTj6sV2Y6slGon6ADolDqsHWv5H1IvS9mwMkCGU0d6FWTfK2e+PsIx/eYUQDUnZI6MYv23Y+msVyeVxmLVYvGIu+tvBYhzPa1Nrnc7sJI4dHcPqnX8zFB8jcoaL56fReb5EgQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767358195; c=relaxed/simple;
	bh=F7Kk+7HLc+g1YYGm+o1eCX8RgtT9tyzfifARk7ozNSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oxKUr9lDgwgMxx1RSFSC27t85iQfVv0SPZQKFVXvZBENYuZC2P0byL2n5bfdfyCYaFAovrYUn3dhwkQ3n42xkY6sbiVaTSLOv2A3BAdg17KVcXQi/0tBFE9zgKHGg7KEJgf+YkbeC0HFt1TS4xHj3k2bCKJ9fVGk+bs7DJSVMNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DmpnDve3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cj+KkRDE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DmpnDve3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cj+KkRDE"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 602Bnurr1095758
	for <llvm@lists.linux.dev>; Fri, 2 Jan 2026 12:49:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CyANrbDJtTc
	MsvrvrXtr1X2z0JYHYEEC2zyeTG24RQQ=; b=DmpnDve3awo0W3rdfyzH5C22aqa
	TORbWNdcJzQNWZg56Zjt6rO8lbBHlW8IkQx2duah75UjtnKbB/KB8/fmnCTFti+T
	cPMneOyIkO5q8R/0dSjzMq4cr990VmIEsKcQUb78yCe3lCoVKMfNiOPa1JGDW7as
	pskqdbw04ACjQaLDlXHIKjIbq/1diRDzkHPJ9fg9p1wLPzW15PIJhQ+3/d/z99PM
	/rM6Mj0v9zmn20aI17yAEBFiXrWnIlACaeVSN96YnnsSgW4dZjYrU/kzlf6M/HsS
	VMOU7stcLEjKi1wGZO9BjX8n/NddUJSVEYkb0L1CZb7RPpZ+ZUnpWaJEWuA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bedg4032j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Fri, 02 Jan 2026 12:49:50 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88a316ddbacso288179286d6.2
        for <llvm@lists.linux.dev>; Fri, 02 Jan 2026 04:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767358189; x=1767962989; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CyANrbDJtTcMsvrvrXtr1X2z0JYHYEEC2zyeTG24RQQ=;
        b=cj+KkRDEdceUQiDR61jmp5N1Fur9ePXin/WILhBZYCQVGk8ze4i+CZMeOhjgEktJcu
         3ttZwnAJACevrAB5ZLQGx2NH6KzE53Y5QtZjhrqDSPbRdctaYFeLVwyD8SH8GHqrCyE0
         zXoDCK+qBqqhZATu6F2ihyL4YLgBPmyzUfUc4hZbJZ5Cz2/YOTgWChWSCz1hbKIxcFFH
         XpZSdS1Cy0oWSsdG188TCNvoav90ur2V/Pi3KFxxbA33NTPqSTs2N9BIHdun594DgLxF
         pPe6ExyBDVUrohxq3tMLN5PfpkkYH5+XUQ6nm2nxwWxZ/VYiBFzKIPn13R/Ba1mxj++x
         8D+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767358189; x=1767962989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CyANrbDJtTcMsvrvrXtr1X2z0JYHYEEC2zyeTG24RQQ=;
        b=b0slikb7GLaS7uDHlsaagh8DmP4o+GqTHKVdXWLQ34erGwcNZDdTYzTs8yIgb3j+u1
         tiipTYYkiFitf/zHzvqWIz6xp4P6qwpC2frrij8ec3HuI7RVEZId/HyNW+n8eix9cdRB
         dKFYtC8Y3IxYLiBZChwKFzb2GkkX8QMGIudwL2EpEx+a93G0VzijjLVsjlxAoX4D/xJr
         A9pMG0a8GABfPFHbs0tcDYZqZGOZeB4D2tZLrp0AgxRbGj9k8wKQ+kGgoTtJtpgr9498
         Kk5vFoLs4IY+HRrwbDKvXWoHrUwut081aHZNDOAPArHlHFBX/TbG5/uDGP4sklu2A2QF
         MrcA==
X-Forwarded-Encrypted: i=1; AJvYcCWw0kG88wEMmcFovju4ojutoM9JZE6O0lQel2cd28ea3m8cPgzHmeMGefnwhLXxMJveOnAr@lists.linux.dev
X-Gm-Message-State: AOJu0YxpbLu9cO7C8zF/WGC9drf/k+jCdF1fBlGGUmz4A1ls/YjZUIgW
	50x28wd8y+QI2xb1J5PUfWnL+lW9Y/tfbuFr36t3r1pn0j8xlXXqnCwQhi6UckBxOyzyj/ytlEm
	umAymTDY04ubPyhoH+N3obTY08LCBy2Ftqs1STwXtmiBkTqcipwUyFYY1
X-Gm-Gg: AY/fxX6m+bB3ZiJ0RQ39AERcTd/DrBlJpo9IREPn5pzzivWk3q/j1uogOhyZx5t60ey
	BfFajpA7lWjR5xAlNW6e7SeHLOxLPS7dMZGXIYK9zq2ehGpf393Ke2Tgjh8zhfRr8QiJsoQBqnC
	Zq94hZqjLzq3M/7WZEVp1w0qa9Z/EwRhRujKnYs2U/yN2Ze3OzcRu15VKNwDLJeh2Or7XPdEkCz
	hOxi3QyPQAoGKZO7p1KB+WDvKRi/rpxzGj4Af4Kdd/3KuVpJmR2LKWDD4vlJAsdOHyvy82Eq+oH
	g7NYU7JrgdwGpTj/VfWce6h2HplWbsVYqDjvAKA9g6DE3TRchOZQ9Ec4TrI7LlX01YN77wGsHN9
	itPMRq8BwavcwPQggWw8vA+N75g==
X-Received: by 2002:a05:622a:cc:b0:4ee:9b1:e2c with SMTP id d75a77b69052e-4f4abd35e3emr688793641cf.33.1767358189616;
        Fri, 02 Jan 2026 04:49:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHEE/q2Fdco9ouztC8TyOboLodLR4WhdA5l56Xei6ZNTD5e80NDvaw2UNX8OTeAHWG46RcFDg==
X-Received: by 2002:a05:622a:cc:b0:4ee:9b1:e2c with SMTP id d75a77b69052e-4f4abd35e3emr688793431cf.33.1767358189222;
        Fri, 02 Jan 2026 04:49:49 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82f6asm86385833f8f.27.2026.01.02.04.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 04:49:48 -0800 (PST)
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
Subject: [PATCH 6/7] mtd: rawnand: vf610: Simplify with scoped for each OF child loop
Date: Fri,  2 Jan 2026 13:49:33 +0100
Message-ID: <20260102124927.64703-13-krzysztof.kozlowski@oss.qualcomm.com>
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
 h=from:subject; bh=F7Kk+7HLc+g1YYGm+o1eCX8RgtT9tyzfifARk7ozNSQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpV77cLysMrmgaG5ns/nrL5d4zYXzAy0uQLWg8q
 0r5eyNewxqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVe+3AAKCRDBN2bmhouD
 13FXD/9fEjxdaWR32ImdhxvYI31+PdVTzd9S/Q5khkafnHnb8EKMGaE7OsNzBLBHJG4AOWrgBCl
 CWgzHBZiLc47tW++MIdBquoQjyPW20dk7ZIO9pM5KN+iQRXFYUBEq/qc0GihzXg3wN+1EE3EelX
 Tk6gedm9V8pTx9Q53pJBoPGI/ZbKapdK6+ocpHrzoI+zwOr3krbdJLxBQcLvCuxZC9Tvdh6oEh4
 qF5BjyN1d/0LoOeCEnVvHmgRBoZOtbZGGc9H2D3vg8Uc+Q9l2TRzsGtRHPhKbUq5y4SdiL5enw1
 eb++MnKmb/DXKIMKZqNA6Q0rXksdUe3xalqwXUO4kB+hUYuvpdlFx2Z3jrx7yfy3K749BMLFECk
 0zvPnXff7zmkT3aTFHHM+45A4GDHHNcov93/1/c6uFJTsMfAm1yatvEpcE/7jhXCLwMPiMsCjT1
 YP/3hzKfctE4HyqHOTpo8Pn4XhXUWfKajWtWayuYTUAiKVZp45XJhOv1cfP0Tcd5oou5ME6xQ0+
 JULIMJZAXU1KgkWUUGK0kSZO2HZetOzthobPuj2rpTfZUDlVzgHzp1sp3hEKtqtb7WvTKHmMZW8
 rSRlT3WRjDyQ3eTMH0wJt80Vf0yxE8Fh6Qom/7VAx9fyRLMgIQaRTm0FbxrTOO6buxu6X2ev02U kJETjK/2HOFFt8A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: L-4xEKH8sY7tGuJr00Is-FdP42eRHTtv
X-Authority-Analysis: v=2.4 cv=IssTsb/g c=1 sm=1 tr=0 ts=6957beee cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=kVq6N5mEIK0mURhpU1kA:9 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: L-4xEKH8sY7tGuJr00Is-FdP42eRHTtv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDExMyBTYWx0ZWRfX/HNO089JglTM
 95PvzQhGMpzJIHVGH4QlakW71Z8eJ55XRvaxh9vjtVoOQ+8oVTxCKL709x8qLyxZhzaxpvOqpzU
 ClW5Ib7eUfw5TpThIJcK6fx9J0VTOwCy+C3lZUZpg/k93z9G88iKe9mmv+Wctd3hDxMvFReQe4j
 OiTQe8S5KpOKrYhvGnluvdQy8tIJTpV/xwOem69cugDrcaM4cvUN9dQyHbnDHTDlPzALkMI/s9r
 5AZ81cGL4abCXE563le4fPFzRVx1PWm3eNSyDZN61CYw5pOWC2ctjaIll2eEzyFug3uvOQwIgF+
 p1XDrFzl7A0Kyga7NRuRAY7vTYCsJbC7tQV4chJssL1NHTviaiBR0YnbnZF3bKvMBirH0LL3KhB
 fWE78N8ycjc7gxgoQbC664KqctVK0WSi3h0JH+HfVMlt/+rQ4b/5DlYns41rbFDoAdztZte9GdB
 Pp4SM/Lf+T8L6Vog2Aw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020113

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/mtd/nand/raw/vf610_nfc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index 1955dc50b40a..9940681810cf 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -810,7 +810,6 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	struct vf610_nfc *nfc;
 	struct mtd_info *mtd;
 	struct nand_chip *chip;
-	struct device_node *child;
 	int err;
 	int irq;
 
@@ -844,13 +843,12 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	if (!nfc->variant)
 		return -ENODEV;
 
-	for_each_available_child_of_node(nfc->dev->of_node, child) {
+	for_each_available_child_of_node_scoped(nfc->dev->of_node, child) {
 		if (of_device_is_compatible(child, "fsl,vf610-nfc-nandcs")) {
 
 			if (nand_get_flash_node(chip)) {
 				dev_err(nfc->dev,
 					"Only one NAND chip supported!\n");
-				of_node_put(child);
 				return -EINVAL;
 			}
 
-- 
2.51.0

