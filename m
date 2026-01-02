Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B336314B75
	for <llvm@lists.linux.dev>; Fri,  2 Jan 2026 12:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767358189; cv=none; b=r+B1S3taMw2bHQXG563kBMmQnGuhNRk5clXGWRjEZ1P5E3P3ASO2NOwnO6jPlRI0aGq4ARQZ4kbDAsuYDv1ILS6rO2qlcSSRqMLQMcydp65lLUbK0DDkb4W+a2PIQP3Q3iuLHCdhReEFeGdEyxOJGcbIEM/4DPNy+W0dEQBsbbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767358189; c=relaxed/simple;
	bh=BrOZrPc6bseLN+K6r5ZwNFA65cvJt1kgK4mCCBkPf3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bbwfHF4dUAFj5Ys999N6gXYwCjnoA3nBz3tp5JABJGlji5cgf3ii0OXU9EgxcEwxwhT/U1kZflc39LlGyM6XHZHsJ35yB2i7kpMFA9YkW1kfR9D6Bx/JothGzNB5M3IMznUoq5hfJrraymWtJTpgcIw8JRTiaQ1leDaKCtbX9GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CqP83ciq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hCAGFzVw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CqP83ciq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hCAGFzVw"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 602C02f3314699
	for <llvm@lists.linux.dev>; Fri, 2 Jan 2026 12:49:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=19EDiqJvxY+
	UJO1aSOASDk8Ku0ojEKI8jArYLNxDU5I=; b=CqP83ciqt467pUr+SB3/w3DT/ci
	dZMXyyhczbWpROV6nXCwz+9Ma88UycGXeJhfymtm117L+LPNOrRe/yoIzb0FRjuv
	+j9vyfGDSosPP8YbhazWBBlvNHgH02a+Q3QQNmqo58ccziY6A3PaHHLi5yykCcId
	/ULMD4F3C8RIgJgARrUs7coy+nHzV9s5Z1ByKSIEPXzcH05Zzkn5sPiinFrLfD0J
	EF92feTyoe7u4I3674/n5mXeWGZ9Ekkx/hZ/ZRDvmC0ovsq8NDeGTz6z1aoC6XC2
	bbMOPcmC3+xvGkkJ1BMsJOArMnsw/R+fktsDa+QfiBzA3oahr7Pv4YsCWwQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bedmxr2rx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Fri, 02 Jan 2026 12:49:44 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f1d7ac8339so462041711cf.2
        for <llvm@lists.linux.dev>; Fri, 02 Jan 2026 04:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767358184; x=1767962984; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=19EDiqJvxY+UJO1aSOASDk8Ku0ojEKI8jArYLNxDU5I=;
        b=hCAGFzVwA3d5BbgcOLjiWYhcFwcJ+/lfrnhVAbxjtvMb6yUuFFpo+aYp55R/0irlJq
         Ky6SE3L0JbqBriviPNAl4GjXWa5apV94o2jm4JFUNLaZsvBGqgUB71FYaK5rYEZoHy8Y
         grdMjwxvB4sl6GYGmsKfmXnfda3MUp6yNzmoXUtZ1THXfEEPoNE+K5TZdRL2ENNYWrap
         s4kLHMADprZ+4nswwtY2o7nxC2WNBJ94zEV6h5baScwtL+Ec7zH4HvsmJ4E1SRkDqgdq
         qL7kL7pAW0TVYAtqQqKHmS9qQasOXShAujNOmBc9pn/IaLwUarlPvq/ftYHUuWGirThC
         XLUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767358184; x=1767962984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=19EDiqJvxY+UJO1aSOASDk8Ku0ojEKI8jArYLNxDU5I=;
        b=jFnSZVww/USAzIISzUl3IMkdM5inywA4cop4ERRVmI5cuE/QhbjIVGEvZj37CKDSYJ
         D1Bbl0O7zoo/X3TqceZzzxZISmpUWETiWH8g3ENAPsUjTozhv1hRvHafKzHc7Dl9gt2I
         zxjci97tJYQCZXjTkAYteIt8YMHjNkF2HU77hb+XXGjgHIl0Bi1QhM1tQ5tIY4iPrkyG
         4oJ0gMD0Inb4+Lrq43p2vo3i7aoIvi4kd4mypMlHvmSwIZwqY6ltXcDsOkFX/StA69/M
         0/DKc0neYMy3YXrrj2JplgBJ9954Orx34OHMOC0sP9mElWZ9u++bx62qaaqa78dSZQEd
         eUzA==
X-Forwarded-Encrypted: i=1; AJvYcCWjRrGAGpvQPxgTqllh79FzbT4gIyS2+/OWBH8bOxjxWGyxlLevfVFCbqSOwzmoExNtr0Xh@lists.linux.dev
X-Gm-Message-State: AOJu0Yyu7jGeDRjjXcNtS+7csTA0igMbUz/iPv/vebUTa03xSKLTB4v4
	4pg8BnH2SOXQ14IT5sk3ef09AHYZGqCJWAP/lmM0OPvRbdTK12Ilizmrfuk3WA/OLOUCZ8aMU9e
	6gX7wOXYKLK+v2eYbJ3W5hdco4mOUfdpO0r6hOyfavmRoUBWb9nFQBS8q
X-Gm-Gg: AY/fxX60seTVBaDsm4xxPLn5miX0BMW4f+Bza4+kLioPNfF4K8WEyWZRqy91+uy6fZQ
	bpDCy8xFZU/87JHXUS6A2H+FPDz0ry3vW4Ew3YQt9bfj+Cw9jWo6+V8HYnVs6wZTl6SmyHn0Cft
	7EiCdtda/aMHCuP6vzHehktLBKbuebj7cqaCHtERSKm8PjpkuYAE/SBWCdZWHAj8e2T7YONW/uA
	fDrY7NT2yk4ridZOa9SnLHKnOBIi/WhzSy8HX5yuj26BIUH+TDjakpDVoWoNhM3ZoQOnr0Pxv9S
	ZezvOXy40FyvDFMkPf0jImbFxVwh4Gz5bVdlQC1E4bqZALYi/qSjYu4P6UM0xWczSGqnNgoE/aK
	vi4ZbR1Oq0mf7yZjq31L3DjzIGw==
X-Received: by 2002:a05:622a:108:b0:4ee:c1a:f11f with SMTP id d75a77b69052e-4f4abdd30demr605631571cf.84.1767358183788;
        Fri, 02 Jan 2026 04:49:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHQe3uglgGNR+qklPNQjuO2p+WFlVQPaOVJXoxxcfmLW7UGRPm8JS8xJPkf3hKH9eFSuLo+KA==
X-Received: by 2002:a05:622a:108:b0:4ee:c1a:f11f with SMTP id d75a77b69052e-4f4abdd30demr605631151cf.84.1767358183409;
        Fri, 02 Jan 2026 04:49:43 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82f6asm86385833f8f.27.2026.01.02.04.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 04:49:42 -0800 (PST)
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
Subject: [PATCH 3/7] mtd: rawnand: ingenic: Simplify with scoped for each OF child loop
Date: Fri,  2 Jan 2026 13:49:30 +0100
Message-ID: <20260102124927.64703-10-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260102124927.64703-8-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260102124927.64703-8-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1185; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=BrOZrPc6bseLN+K6r5ZwNFA65cvJt1kgK4mCCBkPf3Y=;
 b=kA0DAAoBwTdm5oaLg9cByyZiAGlXvtmjRJQ/CGih+wivKTkGTWlmFMe8ev0DJktZN4XBFnVnH
 4kCMwQAAQoAHRYhBN3SYig9ERsjO264qME3ZuaGi4PXBQJpV77ZAAoJEME3ZuaGi4PXiBgQAIPj
 k04vQPYnOHjYCyieHRtlHWoHx8lw66rdY7P1LYZsDJWufIdsgM9PI9I21BAxiQYEHbdIzqtjKL9
 VzrNHmjbT0oqQuai5r0LgvzfM3U13fKpOX2CXAYAJ2L8wCVjhrPpsOOhAnejS2aWJdMUPQdpbhb
 T/1FhKHxcgNSKkvecy1DiqOu186pbe0nvK97Z8N4VzCxBDp3TX8a4A3lkSQ8QT/1rw5gsiqhf8g
 RjpaQXbDKuHUgxTOB5js8jnKrtKzpyu9ojn6ZqNZzN0Zv8U/ae4CRm6O5QXs8uR/FbK7ZeebldR
 5i51ikNsKa+0xDhfXm8Bg4r3RBoubBoQkxVCSdSLA6bEGcuUL359zvPi2oYnh+7SMIPcGrbLmig
 T0PzYWlAkZObdQ8nGhF8SbcWBiMpYz7UecX0a1rTPJxfMICEP+DxJwcrU/zIsPtNEE3Jc2DfJLq
 csoGQT21G4RzS+mD2jDOS3lEm3JnSxnzGqS+sYZpgK2KS3eSeM6TVYlLH93M/kRMHZW9K4zsuO0
 hOanEPnS8AJH9ohlpuDAmEsq+o1mQ4ymzfGoCTGDm8DkHTPhxqN4EcS/fA8FmmpYp3b4QTk3OSa
 AKbAvM76pWQxj1/PM9yWef3dj9+6j2O4YhXip7xxv3yeoG/tSyiwCoSG3pX7f8ZcPQcXtfJSXTB IAT0A
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GupPO01C c=1 sm=1 tr=0 ts=6957bee8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=kVq6N5mEIK0mURhpU1kA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDExMyBTYWx0ZWRfX4H8Vb7JqCHjr
 lpUxgOwGtgryf8L3Ww6C32hjV6ETbPsovjcvtDYY6j3YNdxStdntRFNHIVlW4TAqAte1mqJ9yvy
 WDpPL90Y1y5egozdiQKdTCBg5uxnXIwL02PezIDfQIL9dJ3RGXo9ppuoir0hw1kpM5458Blw1kp
 xedRvavRXjloLpY5/8dhmGeWO7dNJIhyWKQokeW7Aa8LUTvP4r8XgYgsKNYO5TEH8AWNFWGCFAq
 QVpAv2e/TfWNZf0APVbwIH7XXmB9u1wUDbqnBC4i0aUC0YRejpzynkJSFwrkQfD//gDdD3YGAwt
 Lt5Cn4hQ3AeUfmo7VwZ/kAgp/FX7in/azMkkWURPLyBZueJVZsRmMc5x9NNSpjs5O4Vg06pfvfU
 UTdZIZBvJkJgfnNWFsjk3OpwlY1a2mTqY/UczmzfjvfO1j4OHT672Fzhqu5KTwz7JSMoFQg5UMR
 ZweML2zhVdFYjrp6avw==
X-Proofpoint-GUID: y3ogXBb-Mxs_gMjFDRp7kjFAVKEve3iP
X-Proofpoint-ORIG-GUID: y3ogXBb-Mxs_gMjFDRp7kjFAVKEve3iP
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
 drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c b/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
index 47dc3efcee92..f1e2c82936b3 100644
--- a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
+++ b/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
@@ -438,7 +438,6 @@ static int ingenic_nand_init_chips(struct ingenic_nfc *nfc,
 				   struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *np;
 	int i = 0;
 	int ret;
 	int num_chips = of_get_child_count(dev->of_node);
@@ -449,11 +448,10 @@ static int ingenic_nand_init_chips(struct ingenic_nfc *nfc,
 		return -EINVAL;
 	}
 
-	for_each_child_of_node(dev->of_node, np) {
+	for_each_child_of_node_scoped(dev->of_node, np) {
 		ret = ingenic_nand_init_chip(pdev, nfc, np, i);
 		if (ret) {
 			ingenic_nand_cleanup_chips(nfc);
-			of_node_put(np);
 			return ret;
 		}
 
-- 
2.51.0

