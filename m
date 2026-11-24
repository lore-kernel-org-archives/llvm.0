Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795538650;
	b=Onmxt5o8bqWn/THBM0+PIUog86ex7GsWoM55zn7SOHWvcrcyd19WOoxSUBuxTsMj/VIS
	 GQgXfKdX6Grck0AqFkGqoFTA/0l3OyHkG1PfyGmXbENioJNUtEFTX2WIE0KcyRS6YzDPJ
	 cqjsEkXTSGvmBrcNmEbc7vOitUrAYhXFfxp/gztWXJTnt1FxViKpWmjZ9RxU8f1Qla7++
	 9jj4cdL8Dh6Pr6YZo3CpFxmhcM/EbNtQhSSSkCzgo7VIitTr6lpeYgCD6YVVxlEMsWd6b
	 mtoI3gA52LEf/wltNyyq9H24Z5xysz0qDRO2KTxfeuIxaKBSzE6rqp5V7PmB1q6n93Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538650;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=8gVImVKSYwlu0y9iYIfF4tE463YxrNVJDP1PpJFp4zg=;
	b=1rBGwxPK3n/kwlgu1z3ncYqHmz+2s/68IPJE5CV1yPDxz/fbCFJcPqTqcKR7sdR7mZw4
	 rABI0mwiJWS0OTaUFqTqoPeKvXgAI3v7/nzJXGDW4k7/uRUcjvDSQ1p4pAd1OFp72x0rZ
	 uBgv9MuTzGzju+vv+MsvNnzLcXY8YS8iYd1/3gMaGyV3r+hfLiZHnBDzkx2j+NGZDLd9+
	 E8mSNuKgybptdj+oXyH5jtD2ux+8I4UgN+t1rcH2mxP2aIzobF3dEbSBd+wCxh783OS/9
	 RIlpDofrSan1GEbYovF9ncp4BuRJPtqU+UNN7dMTj0cnzuFOJozWJ4tbd5rI2IZRwgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mgsz5mts;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TAGjFDgZ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597E9606A684
	for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 16:44:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 597E9606A684
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mgsz5mts;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TAGjFDgZ
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFLLB03878973
	for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 16:44:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8gVImVKSYwlu0y9iYIfF4tE463YxrNVJDP1PpJFp4zg=; b=Mgsz5mtsbM/YV7L8
	vevAtQYJmK3evPgUU75EUO/zGexMQvfuhN2MPiDhUc4p4Hqq1yy2NJUSioln4enh
	NKkslAnb7JvPFqr/b/B6cvLeCY/1oQYi7py+DDD9QfkeUr4n/qsQoU6zXx23iJ1d
	p69m73mKlZA9wMXFrSeW8MSx8jtaLq26V/bZ2KnONenwcTQoSCRcnODhfFCCoLTa
	aKrdj+t0T8e6wdJCUCBEi1p4jFPcFqi19Fo6zlBw6eaa921mxdsbfyYKbryPYWGH
	plGNxf6nhVnkf5UOcxDFXpXnWRXyz3LKIfRlKH5afB+Bw8S+I2E7lpVvXYQdOnl9
	znefFw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yy13w8k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 16:44:08 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-382af5cfc58so4051514eec.0
        for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 08:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795538648; x=1796143448; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8gVImVKSYwlu0y9iYIfF4tE463YxrNVJDP1PpJFp4zg=;
        b=TAGjFDgZKadL8Ndv8gZ8zRHnq16t0DOtrl8doXvRn55KYQEM6koUlVrFki3p/iJwS0
         cAefQkaYLxZvmt3l+Dz0Ob/hyqq69XCt3pLCR6KEkf3CS1f1juQrvc9/VRWz9Zu1dTZ3
         5pp5bryIjl2eCc9goUifmnH9BEwfmYHBWPvaMyqsp+GpxFKV3Lax3gcI31TrYTnTcfKQ
         pCR+4zbZ9u8wc03RANxyiY8DQ1dMBcVL3toHQ4lbNAzl370zXWMauxloqNlod1qJG0oK
         IxBXNkcZN6P4ArQA37/F26EuZQZDgjbkwr0G6NB9FZ0F7rR/38WrJW5rUo2zaO2Mgx5G
         whwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795538648; x=1796143448;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8gVImVKSYwlu0y9iYIfF4tE463YxrNVJDP1PpJFp4zg=;
        b=JjO7iw4cuRtGwH0KmTuQnYjgLd7YX4FcBcvRVr94eftzMQrEo0j6csz5uUiGK86CMp
         S+Nnsosrrxr1ycJuHN5x5dSKLLhor8fvu66xYIKcyyIEVN1HZ6u+dbWpHiIpW2tXy9mP
         Ez+Ir3rfFQSomK4I57wvBUJwbLT75Rxp5n3MYK4i6AvJK1Fzcd3d/Ln4sxUFPJ2/gn7+
         3rC/qnPXDlKUt8QkLzkq0+JzU2xS5LkfV3b6STY+ay/z4AnTJZWuUh/N1sI+wqQqRQ8w
         iWpX0THu15wpv9m8WnwvvUy614q5scQ091TX1GI7uGDdpQE3j+H8O9nEZoliFYlT6/c+
         etwA==
X-Forwarded-Encrypted: i=1; AL+hErGSGUSPOasenDIDcETmwdW2NhusN8jLkgmzWnheYr30SuawqysV1ej2dQqbqtK5VNwhUvPD@lists.linux.dev
X-Gm-Message-State: APuU4Z8RY/7cESfj39+Rct2RkkMKXBpQUKdurJDWYkYOoEwHDS0dKgg1
	I7cJeh7+aLxRtQXq1l9SskMZPqcgiyJDUQ0TjSVb0CiSoTJvxKXPEZGBH8ek0mXyiaSjt6DSzYS
	OuMnnksRb+N+D9Yoo6XiLRtEbO7pwcajgbW7i5uuvpdBrmPoPc6O5vJNw
X-Gm-Gg: AZFdTZf4gRLbYHsGz+CAVUKdxvuLN/U7l7STfi6dE6DIS73ghNOPg4kof3LRFvUXd+5
	XUmlB52nWu34RJNjpMrcZ8Re5NsEhf0SNSMcEi+1N/7aEVYvyEyewHdFEVS0fp63e6Um20i9ssu
	JOfm1dAGRe/v3Sw1K5PfCqw+GiGqp1ZwuIUh2bKKLZYc7O1wgsU9l5mgnAEcl+N2CLU0IhlAuxe
	jTvaWrmVMbptMBS3ekD+/4BQpf1TeLFEs1smyKYAdxQf6l9xv7LqeuAI7yxLDkSGJIQncmESNYW
	MyQdixVn1Mp+2eakKEBDKT09GI7iJMh1j7B4KFG8T35BCX7RL/8d6vcq/wdw74Nu5l4SB0iIJ3Y
	sVh1zk9D6PfKzU4Qv0MQgpAvYhRqPR4wa36Cy5lWRA4HboG7R77lQc4QwXjbjIDCp4z9bQ5Snoh
	3sOglhkLDjet7lEpDMXc5jbYIa6ca/ItIKyi1/YtVAIuIokEXqwojyBv4pNmz03JpkemBsrmezW
	rU=
X-Received: by 2002:a05:7301:dd94:b0:36c:9afe:fcd8 with SMTP id 5a478bee46e88-3856f559cfemr15111449eec.30.1795538647895;
        Tue, 24 Nov 2026 08:44:07 -0800 (PST)
X-Received: by 2002:a05:7301:dd94:b0:36c:9afe:fcd8 with SMTP id 5a478bee46e88-3856f559cfemr15111421eec.30.1795538647325;
        Tue, 24 Nov 2026 08:44:07 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm49093900eec.22.2026.11.24.08.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:44:07 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 22:13:32 +0530
Subject: [PATCH ath-next v4 06/14] wifi: ath12k: add Wi-Fi 8 HAL register
 table and hal init hook for QCN9575
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-wifi8_qcn9575_bringup-v4-6-1f5b87ece6a3@oss.qualcomm.com>
References: <20261124-wifi8_qcn9575_bringup-v4-0-1f5b87ece6a3@oss.qualcomm.com>
In-Reply-To: <20261124-wifi8_qcn9575_bringup-v4-0-1f5b87ece6a3@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev,
        Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: AOU4mgfFiLYIScftZRnPVxlsEOQ8xYQO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfX4xRtWTa+vWP3
 r9cnCZPtTOfbTCs58WYdlhUfN3VdE/dzSNWxNTeFIiY9Hejp5fj7uFsK4BL6oRKzMh+tS6ZeNjO
 3ZQSYdxoI7K85BTwmak3tfxBhHYzGvc=
X-Authority-Analysis: v=2.4 cv=JYspPkKV c=1 sm=1 tr=0 ts=6b05bed9 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=k5nCMmGC1qFvne7xG5UA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfX7ewwMkDVWeAP
 ZN7nmtQDt5CLPEEJQ6C3xA9xBrL+bzCq6XQF2klj2C9fz85tkIiMZUXLkzgYVVVz8syclSAPQ4t
 NHdtrWYgOY2eeXiySh4xKRiIz2t9jFipFMOZ/Z/jmFPingIZnegLhC3U736n/r4AqhJshv0aqEj
 w7u4Ip2Tf1AkHOfuDVVCSgaWak8tqUVBftsFpNoHXqmFmDAnPco853XpuPUiZgC/h5F3CdymBT+
 ag7hamWKTEnao0ng06IP1L3gohe4CAHKlPtUVn0gBUgq7BZ70j9U3SzyNL/ZA+ktbvxRRmwWFbw
 ivi3ticbZAPEr2+R6LNfT9orfljY06shWq1iBuFLHS+jKTO1VCUxcH9d3DJnelaaf+rXdL+dWiv
 20q8iW4l6CwkuAVU1/9svGI6zL5S6Fs/u2zt9lnKdIf1i3UbqnCl8n2wSsRzgSSQMaMhE2oSVly
 KufqZ77AhHkuGymzdGQ==
X-Proofpoint-GUID: AOU4mgfFiLYIScftZRnPVxlsEOQ8xYQO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240065

QCN9575 uses a different HAL register layout from Wi-Fi 7 and requires a
dedicated register table and HAL init path. Add QCN9575-specific HAL
register definitions in wifi8/hal_qcn9575.c (qcn9575_regs) and its
header.  Add wifi8/hal.c with an ath12k_hw_version_map entry that points
ATH12K_HW_QCN9575_HW20 to qcn9575_regs, and introduce
ath12k_wifi8_hal_init(). Invoke ath12k_wifi8_hal_init() from
ath12k_wifi8_hw_init() so HAL setup is hooked into the Wi-Fi 8 hardware
init path. Keep HAL ops and params fields as NULL placeholders;
follow-up patches fill operation tables and remaining HAL parameters.
Update wifi8/Makefile to build hal.c and hal_qcn9575.c.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi8/Makefile     |  2 ++
 drivers/net/wireless/ath/ath12k/wifi8/hal.c        | 23 ++++++++++++
 drivers/net/wireless/ath/ath12k/wifi8/hal.h        | 13 +++++++
 .../net/wireless/ath/ath12k/wifi8/hal_qcn9575.c    | 42 ++++++++++++++++++++++
 .../net/wireless/ath/ath12k/wifi8/hal_qcn9575.h    | 13 +++++++
 drivers/net/wireless/ath/ath12k/wifi8/hw.c         |  3 ++
 6 files changed, 96 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wifi8/Makefile b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
index 277b5f13754d..b1b90c109c76 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/Makefile
+++ b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
@@ -1,5 +1,7 @@
 # SPDX-License-Identifier: BSD-3-Clause-Clear
 obj-$(CONFIG_ATH12K) += ath12k_wifi8.o
 ath12k_wifi8-y += core.o \
+		  hal.o \
+		  hal_qcn9575.o \
 		  hw.o \
 		  pci.o
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hal.c b/drivers/net/wireless/ath/ath12k/wifi8/hal.c
new file mode 100644
index 000000000000..1afc6fc21d0f
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hal.c
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: BSD-3-Clause-Clear
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+#include "../hal.h"
+#include "../hif.h"
+#include "hal.h"
+#include "hal_qcn9575.h"
+
+static const struct ath12k_hw_version_map ath12k_wifi8_hw_ver_map[] = {
+	[ATH12K_HW_QCN9575_HW20] = {
+		.hw_regs = &qcn9575_regs,
+	},
+};
+
+void ath12k_wifi8_hal_init(struct ath12k_base *ab)
+{
+	struct ath12k_hal *hal = &ab->hal;
+
+	memset(hal, 0, sizeof(*hal));
+
+	hal->regs = ath12k_wifi8_hw_ver_map[ab->hw_rev].hw_regs;
+}
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hal.h b/drivers/net/wireless/ath/ath12k/wifi8/hal.h
new file mode 100644
index 000000000000..311fc5b8015c
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hal.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef ATH12K_WIFI8_HAL_H
+#define ATH12K_WIFI8_HAL_H
+
+#include "../core.h"
+
+void ath12k_wifi8_hal_init(struct ath12k_base *ab);
+
+#endif /* ATH12K_WIFI8_HAL_H */
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9575.c b/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9575.c
new file mode 100644
index 000000000000..56d45785ecd4
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9575.c
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: BSD-3-Clause-Clear
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+#include "hal_qcn9575.h"
+
+const struct ath12k_hw_regs qcn9575_regs = {
+	/* SW2TCL(x) R0 ring configuration address */
+	.tcl1_ring_id = 0x00001604,
+	.tcl1_ring_misc = 0x0000160c,
+	.tcl1_ring_tp_addr_lsb = 0x00001618,
+	.tcl1_ring_tp_addr_msb = 0x0000161c,
+	.tcl1_ring_consumer_int_setup_ix0 = 0x0000162c,
+	.tcl1_ring_consumer_int_setup_ix1 = 0x00001630,
+	.tcl1_ring_msi1_base_lsb = 0x00001644,
+	.tcl1_ring_msi1_base_msb = 0x00001648,
+	.tcl1_ring_msi1_data = 0x0000164c,
+	.tcl1_ring_base_lsb = 0x000015fc,
+	.tcl1_ring_base_msb = 0x00001600,
+
+	/* REO DEST ring address */
+	.reo1_ring_base_lsb = 0x00000848,
+	.reo1_ring_base_msb = 0x0000084c,
+	.reo1_ring_id = 0x00000850,
+	.reo1_ring_misc = 0x00000858,
+	.reo1_ring_hp_addr_lsb = 0x0000085c,
+	.reo1_ring_hp_addr_msb = 0x00000860,
+	.reo1_ring_producer_int_setup = 0x0000086c,
+	.reo1_ring_msi1_base_lsb = 0x00000890,
+	.reo1_ring_msi1_base_msb = 0x00000894,
+	.reo1_ring_msi1_data = 0x00000898,
+
+	/* CE base address */
+	.umac_ce0_src_reg_base = 0x01b80000,
+	.umac_ce0_dest_reg_base = 0x01b81000,
+	.umac_ce1_src_reg_base = 0x01b82000,
+	.umac_ce1_dest_reg_base = 0x01b83000,
+
+	.gcc_gcc_pcie_hot_rst = 0x1e38438,
+
+	.qrtr_node_id = 0x01e03300,
+};
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9575.h b/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9575.h
new file mode 100644
index 000000000000..e2dd68ebd82f
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9575.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef ATH12K_WIFI8_HAL_QCN9575_H
+#define ATH12K_WIFI8_HAL_QCN9575_H
+
+#include "../hal.h"
+
+extern const struct ath12k_hw_regs qcn9575_regs;
+
+#endif /* ATH12K_WIFI8_HAL_QCN9575_H */
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hw.c b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
index 6e89a42111b6..91d8f762e642 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
@@ -11,6 +11,7 @@
 #include "../debug.h"
 #include "../hw.h"
 #include "../mhi.h"
+#include "hal.h"
 #include "hw.h"
 
 static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
@@ -129,6 +130,8 @@ int ath12k_wifi8_hw_init(struct ath12k_base *ab)
 
 	ab->hw_params = hw_params;
 
+	ath12k_wifi8_hal_init(ab);
+
 	ath12k_info(ab, "Wi-Fi 8 Hardware name: %s\n", ab->hw_params->name);
 
 	return 0;

-- 
2.34.1

