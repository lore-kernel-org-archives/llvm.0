Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35363346BD
	for <llvm@lists.linux.dev>; Mon,  5 Jan 2026 14:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767623396; cv=none; b=jmMO0u4No4pYXNb9UsvtqLXOwOoThcObrMXY5aDDDk60ijr0Zzf01+qkMlA4hy1e1bqLHzL/LjPx4DHlMJyFz/qV05sLypCaDPzzTdUB607M+9HSs+5v1pBxF0UduJZHmQHYobGrt6oj2Pwph95HBWQv/m9o1iouvfEioe7N7hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767623396; c=relaxed/simple;
	bh=igGwUDv1bS4lVKcInMKEA1lV50w6SfWm+opQfVdJj6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i+zMia+d80oKCC+1PvfCxjd6smzKeSq/Bk6Ei45sVyD69O7bpspAS+aL7m06qFgWEZ8t7Fn+M+osE45wH/jmcm4mljP+w6EH1nh2JCBf1oy/Vv554ZmoBg8xIxrbDUF/eKHC+xMEpj0C8KMd6+wzjbusZu3SW3bCRKZN8tWg1lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m8yY+Wpy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hmVTtcU2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m8yY+Wpy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hmVTtcU2"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6059cUW13541749
	for <llvm@lists.linux.dev>; Mon, 5 Jan 2026 14:29:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=B+99F91Qj0T
	X3qTYWzoTO67a6JxAHBWElgL+XwJORR4=; b=m8yY+WpycxOtEjAzLXeUicoLl+5
	sc2sKlS3xbw7WQvi3RM4b5pw5+cXtq6GqVLAZ/qI9ua38zFcjMt7778pQUiTUu6A
	rn7vd2/KwCFxk2pqQth8C081jbdRd/u8N8Koopr25HTWbliddxHPiVCX1AqDH9aw
	dSuE/1sImszUAXSmsZ8PuBcwcYl6CZVcgL9RFp29xQoA+1r5vL0mJOrMD+t8CCc6
	7jHTKreGIYW4+xn8LU02HDdby41E4UOEy1y3REvVxfROLNyfSz9nZRmPsFIChhYI
	VqFtNw0Nm/bemDIgYOjpS7+kic8HGce8GxDCq+sCzEZl3cpnSjq50cwskQQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bg57shs9y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Mon, 05 Jan 2026 14:29:54 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f1d2aa793fso383197101cf.3
        for <llvm@lists.linux.dev>; Mon, 05 Jan 2026 06:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767623393; x=1768228193; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B+99F91Qj0TX3qTYWzoTO67a6JxAHBWElgL+XwJORR4=;
        b=hmVTtcU2NJIuljJ3mXicyc7YYRtVclKw5mo9Luqs5chyRVhINUcCL+KwpSph/rBeGH
         Hj6LTZAyy2/BRocfJo/tGUssdy/GzrVGwpXzvX+yfxEMHI2yAkpev2oK8DUBCq79bFYk
         YckIU2xUdyXN2+uIGhKWFJIaKr/UWkWFLDQP07QRP1nc3BV5ENAOl+3/AyidaAl0cLpC
         4PQn1v7AzX1fEM2o5HVDPTf7eJ2nfu8ISKgYUphiz553EXPXBODh3AMj52GX5VIpXQtW
         DFTtleUQ0wUEjjoIjCMd/CAf5FzgExPkns9AXD3lRqWLgRoOMiHYVRTB2tHD3h5zbXI8
         14VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767623393; x=1768228193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B+99F91Qj0TX3qTYWzoTO67a6JxAHBWElgL+XwJORR4=;
        b=O9Xgedmm5V0RQL/P305KVVxv2Tq+/D7LfEvyd7mZ37Rem7+04VpHOPC1RDODgIf3k6
         DrIlyyPdU+cd2sA88jUq8WJ8gZouqs/kPRuOFxWIvo+8XLZEkLEIcE3Vh/OTz2ghBnpL
         T5GFfEZ9UMVDLhjr0HsZSBaO5JIpMq5APlt5ACAX444BAQeh9x3cLBjrFeEp6Z3BOnH6
         vxXjxR2gKTcYNjG+vFdg+N99/0W/agTi9eLxZUKYBddj5H1iQOuCd71KeanzWY74xq4N
         SO2eVfNDTQpCmzhcA7k4JzVIXHQE7GtnTiQoSku0By48dVVl7Na7m9GzHDan2PpgJZrV
         nRDA==
X-Forwarded-Encrypted: i=1; AJvYcCVbyk8NhXb3U+paZgVZg5WldxIvXkiYT2KT/K82ZM/8PpF97KcfDjV6WdbhYsr6qDpjJIEE@lists.linux.dev
X-Gm-Message-State: AOJu0YyS/pwQLowAw05J98a3MPKFSNR59Ez6CKYGYwhMFg/srRD7Vyvt
	od/wWV8m3lnOXQUY1n7k60e42xVbA67+k1fXHpoatysBt4JykHk69NI5StDMNdzvV7G/Yk3oWhO
	9HLfIziKfujXCBvINvSZMAGekeOBCSSGcPnpxGycHk24VGN886ewfxcTp
X-Gm-Gg: AY/fxX50F29i8kXbTMYBaJAgoafTrSTtXkX5orIeyz2uPpMLwDRrev7lxVtPaq0IKVD
	SKS2WutCTFV0EyS4TkPZqhu8oEyfvLq8fWq+kd3xi5QYYH0fvSKHU1cSkHqUHcpXrFwSlyX8+Eh
	7j+eXt49UO4L1I/bO5o5DJ3jBgL36DXX+uZ6ZF6Jqpt/tr7aTretAO9KUE4SfKWu6OxZ1hej5KC
	/wwjin6o92HPP7PE0Z3WxgG9ZnLjnc/9eKk2A7GYuqkECS8p7kZVgr55p5rgiKiSvz8PdtDel3k
	bwkedTOFi8bDAg31l1qi3D9E3rLHDLbPJLTPJQf2ITpCeBxHVQ1eMM+ZpIZ0PZ3+qsCuZnuAPfV
	IHpdeRZyRrsCCXzJjSUt480mMtw==
X-Received: by 2002:a05:622a:244a:b0:4f1:dfc8:50b with SMTP id d75a77b69052e-4f4abdb50afmr667718831cf.76.1767623392996;
        Mon, 05 Jan 2026 06:29:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEORDjsF0OtFq4UzheK0/5nT/1wsbM+CjFxawrMfjytQ6gQ76FQSUL3wyIGAbS4VwKg1VqJjg==
X-Received: by 2002:a05:622a:244a:b0:4f1:dfc8:50b with SMTP id d75a77b69052e-4f4abdb50afmr667718361cf.76.1767623392402;
        Mon, 05 Jan 2026 06:29:52 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842673b560sm2074066b.33.2026.01.05.06.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 06:29:51 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-ide@vger.kernel.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 2/3] ata: ahci-imx: Fix Wvoid-pointer-to-enum-cast warning
Date: Mon,  5 Jan 2026 15:29:46 +0100
Message-ID: <20260105142944.372959-5-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260105142944.372959-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260105142944.372959-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=997; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=igGwUDv1bS4lVKcInMKEA1lV50w6SfWm+opQfVdJj6Y=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpW8rZVXDPJgsYrTfHciVsBIMXX2UdTXHPtsLNN
 MmkwkCUArqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVvK2QAKCRDBN2bmhouD
 1wD8D/9NmxkL4Xop/DcQWS+5stEAs8WFB656Cro4p04q4X8LYO9O8nlEWN3Q9Snf8b58CCb2yUG
 Iz+rH3+cAduDNZM41e/E2POIy+JRQcX2O53Sdj8iKEUkoH7t1ARwpA07J/nn2bmJI/01BifNJ4j
 inwbtVzap2lLz0NQ5uf6QNOKbqv3m+bQZzG/TX0VVU8SSydwn2740zNfIBjPS05mVQ1v6x6l5wy
 4xhjqGC06/S+JAmKyEjNenqOqqrSVwhEkhhJ7XgAQkEkvdE7C/o73ebFMDYkGbzMM7olZCeMuKA
 klVgoTgOzWOFlPkKvNoaBWIGVcTGBq1ThK2yd0mABs5nu8z0JQ7hj6b5BJRelq+c4+mT1Mu7Yjn
 zkhsVpxh0fBvtUdbBmmV+xbtflXn++B2GOJXov4fWxloYIwLWVOCOwaekrOLPBrwf50F3092L7J
 iD9Am90/5NbN7/ls2wUj6SbxLpXqoJkNcSO77bET2gH/fI6MevyoFZQmz/NrpdwFYjGy/mEqqGD
 /qkpdr1pkAG9G38copu1IIcX5cnPLpyxB14sI4XMNWica01BRrw02W4slTu5deabnZwej9Yoiti
 Iz7x1QZyJTlJRvSrk3jXdwAzI6MqG8f/voVfvLDLLzsUPwNB6gMhoLp2Uucz1uyMVu88bR4178G mDohUcKyY0GpBBw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=UJ/Q3Sfy c=1 sm=1 tr=0 ts=695bcae2 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=7zQf0MV6msiRB6oW4MAA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDEyNiBTYWx0ZWRfX+z6UIUvHyo69
 I9EBzmzdgm9MMWm1PSgs/MqKE1LZgC5dANrAvqJQm0UXkgxVibV9z9pvgkzHee3OopeaIl+bFDQ
 z3MwJMvIvZd+1UbFnwdRCfK4HWBj0OEDJYdMPcJ0zKGxycpWymcqpCv/W7HSofSnV8kG8gN4+T3
 1g9XsL+ksFTM9xyFXCegSZOyrEyRqlqhqhJXk2CtoM6MIshgMpptj/+YYfifkqjKVP6IxS1pR3C
 0SOf6Uf4dUlDhCStfqz1NlIBbsfjRJryItoetwY1YJz7a7sc3wubcwXm4lEpT4VZgjKRWDCLiBz
 asuGh9EMU5mSdjVRuXq4kIicVI/0M0BVlAR6+lyQkXoPjX4s69tfG+wUu212aR5iJpGI6rauzwI
 eARgB+Af62DrrsyXbYQZ4JYr77eAhT9vpkr51VUWZP1CXGZ0NqtQdlgXRu3joIhn8HIyiyKmpfY
 U72vPQW+vBlpq6DIJAg==
X-Proofpoint-ORIG-GUID: BTcq7meJwf_7F3Xo126IO0VyZE1i-FF5
X-Proofpoint-GUID: BTcq7meJwf_7F3Xo126IO0VyZE1i-FF5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601050126

"imxpriv->type" is an enum, thus cast of pointer on 64-bit compile test
with clang W=1 causes:

  ahci_imx.c:872:18: error: cast to smaller integer type 'enum ahci_imx_type' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. None
---
 drivers/ata/ahci_imx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ata/ahci_imx.c b/drivers/ata/ahci_imx.c
index 86aedd5923ac..3d26595524d3 100644
--- a/drivers/ata/ahci_imx.c
+++ b/drivers/ata/ahci_imx.c
@@ -869,7 +869,7 @@ static int imx_ahci_probe(struct platform_device *pdev)
 	imxpriv->ahci_pdev = pdev;
 	imxpriv->no_device = false;
 	imxpriv->first_time = true;
-	imxpriv->type = (enum ahci_imx_type)device_get_match_data(dev);
+	imxpriv->type = (unsigned long)device_get_match_data(dev);
 
 	imxpriv->sata_clk = devm_clk_get(dev, "sata");
 	if (IS_ERR(imxpriv->sata_clk)) {
-- 
2.51.0

