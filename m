Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989770;
	b=RqEWx4TCl0G4UqUWxyDpTNy2T3Sz+tWwyCll5v0JEK4uaXVbUmHMUFnH8KdVtX0VDp3Z
	 EA3ErehVlDQ9htRZvrjQ8t6E7pXu3WYH8A/UxLjHgPeT6Cw/nfzVGpa1pAyQ4TDuSNZNj
	 As/ykGjSRE8s9QqegCosD4X/Towa1nxtcMollSMy3eV//zS4blnPM0cJej4j54O7UkkCE
	 VCAHdO8e5G5z4hFNnKspx640FrRCXD8kJH07vtYf0BuuIsjrpX1uXPkuXvjNcssbSBzch
	 H25DBguV+KaS3YnU8zPfq+eCbciAWflHNhaCdlhuv2hzjm+LROH2EXgzFdlWaCIIbjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989770;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=8gVImVKSYwlu0y9iYIfF4tE463YxrNVJDP1PpJFp4zg=;
	b=YZxiKB3NBK8Zk7pwBdrOFt+SYEZahfLFEzXLUcrcZWeGeoP4M3YSjTqaq3efLWn1uwnp
	 mtbsefkH/DYeN0P7L3B0LwYBjU7sh5L6tQRP5zlE/sQtLnxbbxBlaO46rhEjaO0LA0WSw
	 9vu7F8MWwZcSWorqkQ0Ev56a9K/oKa72m7bvy7s29K1kowLTQCiyVmCDPkaiUrcjVMy6L
	 rJVkGHVbElLQ6neb/wv5irDK5T+POqJ+0SesmSN7kg3xU5kOiA/Y8Mu98BE4T9PTN8Hnx
	 zQudeecvZYj6HEKv4sHrnWvMrRcnmLtgNDsyrvDXTUkGTEYKe7JiOwtW5K8p34j06Wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=df2Hh12N;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MbXsWkp0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD338606A32F
	for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 08:16:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD338606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=df2Hh12N;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MbXsWkp0
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UxO71430548
	for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 08:16:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8gVImVKSYwlu0y9iYIfF4tE463YxrNVJDP1PpJFp4zg=; b=df2Hh12Ny8Y3ZqkU
	lxQZg614F+GVnvHNFFvmArm16i23mPHJvwS+xaFvwBCRTLRdIUJAHlZSYr9xvjcE
	LUhysQkB97EAE/5Qar98MINSM5hqV+PKHJ2Nj3OCcC8vEgbCQjfw69kCpr61DaZq
	doMTzoOb80V1so6CsOIOBPY56Megzkww03MrxEO/qBfWUW+IREu4xXikWpqm7VES
	Cf7cLd1zQnUqfGojrDNr1mc3bYqFq1M09bO3UjiXXXAxHW6ygg0Z10b0tSuVsMnR
	rcDMMVGl5EBGDMBWbtDX20Vt1g08D5wY1u1jqDev/CtjjMCf+/tu7p4uQTFHrMy4
	sNSw1g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv91ywe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 08:16:08 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b0a9de9c2aso452038a91.2
        for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 00:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794989768; x=1795594568; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8gVImVKSYwlu0y9iYIfF4tE463YxrNVJDP1PpJFp4zg=;
        b=MbXsWkp0cjUlIYg85QMfU1ZAUaGlBsLSEIPQOwyyBtAVZ3wt09lP6R5xg+ll1RTijJ
         hxVpFbDKez+MpYG2EPNpudP171YsYAsF6HpAvm+PBmoaYoefAJo9RhCyNja3Y4GekJgj
         GDu7Vb51PYReSexA1j0SH5lNyZgv4a7Ye+LUyWZya6mmv7WEebwLC9PdKLNK2PLkOMAX
         lOEvWUFeeOEJ8QG05P3O+mWAtzdzS5YbrIvzu+OsuZ0QVkwfOkQ+SZe1wmSeJf0HNrPo
         qdWMiAQaq/9UntWpbGa6qNIyr6R9LyW+Biy/I36iT7RF9Qu6IYRkPhw5YqjWeMZ0keKD
         8MeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989768; x=1795594568;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8gVImVKSYwlu0y9iYIfF4tE463YxrNVJDP1PpJFp4zg=;
        b=DpeiwB72d/i7hkBl3ucdzINYfSNj2MQZtUNNluaCjOxQhV90xT42i6S8Z88y+nIEQL
         uSLnhAOqRyPY9m+dOZcaFNvINZXJEzSFhYdvNvh+MJQzECrTbrwYzXr3E+G8XZgb28oX
         omu6ZRyQhgy8GR5pRRJ6O5HfMcjveB4eNYGGCi6vRs8KMZVYzwWBYmLavHLCdCWhh6JL
         1skILZ+0j6nkYcdh5QgRSnwOPcgf/H8a0rAAJArvLUXVh05HVaP/PzHj4A2zuMng3SfF
         CvnyROIb8ZRqUAY7mdVCeIiVkdJ1fwOoJI5CG/GXbukiz/VYvdrJ06PgiS9uHz1FGwbX
         R5Bg==
X-Forwarded-Encrypted: i=1; AL+hErGM4iTh39nhzNvcxUScZ7lHPY5E0eCTZ+dxULVot5Ku++9Kl2vnUcAlu+spsnB8wp/xrGhu@lists.linux.dev
X-Gm-Message-State: APuU4Z+6bd3RswnuT6KdmGueQVAsx9WYjjeNnFnB2T3bax9rxwdjInWQ
	/gzlJxzP+9e4iQ8Phfg99U3O7SYyzgCBvnHaoQO959z+MxnN3RdX6lC5Blhg69JhAgddOC1/7u9
	HhAJ8QSj0qSFjb/93AxodyUREUswKFfg3nHhuSEYkQj/sZzTN6ZKJmVkS
X-Gm-Gg: AZFdTZcbCTI/1k7f1bk278e/OymoOCtueqI68ut1Erb+Hx7Po78Y00+nOyCy8FYYhvO
	R+IxfrLBAdNePnrVMYWhnvlrHAHcYz7hZzaKfOgyg7TqeATco41v2ASDD6qSAxKfsALMfLGwKeU
	06KCxZh60YwfGdO2gH1GhG+Wq+Opsx0EipBXRG1hfk2xwhOxt7ksgZci/aP7pwP6FL5c+Jb3kNw
	pFu40rWMnPsjb07ewrEKnbQLErgim/ZvCt8Uny09d3FDPcMLOM4sOYp1S5PXnuL15eYlW2NozwA
	HaBd/fsUqBwea+pqqjCaonrG67rakw3qX+SxLj80UTLkVof/eYqp78mBfAgJVGwnxTpJtPnXFwX
	vtxrUxITsRqTVsQe4XsEE/Gv8nXJYtgIrnpma+BU9EJRKBvsjDDgnASwwdzYYlhEjhl9pAo34kh
	UaXmePzakFjebtJYd8RRizfdJZf/zOCMRWspIq//d3DNpu9Y8RsJSmawRCD4VZX2OJs3oG1lVFN
	g==
X-Received: by 2002:a17:90b:39a3:b0:3ac:b3ff:b476 with SMTP id 98e67ed59e1d1-3b3d07a29camr1893093a91.38.1794989768255;
        Wed, 18 Nov 2026 00:16:08 -0800 (PST)
X-Received: by 2002:a17:90b:39a3:b0:3ac:b3ff:b476 with SMTP id 98e67ed59e1d1-3b3d07a29camr1893060a91.38.1794989767716;
        Wed, 18 Nov 2026 00:16:07 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b5e8asm3369181a91.8.2026.11.18.00.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:16:07 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 13:45:30 +0530
Subject: [PATCH ath-next v3 07/15] wifi: ath12k: add Wi-Fi 8 HAL register
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
Message-Id: <20261118-wifi8_qcn9575_bringup-v3-7-9875d2a3953f@oss.qualcomm.com>
References: <20261118-wifi8_qcn9575_bringup-v3-0-9875d2a3953f@oss.qualcomm.com>
In-Reply-To: <20261118-wifi8_qcn9575_bringup-v3-0-9875d2a3953f@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfX4C+AhI675Snm
 Kg4DsMWhlOUEBENiQJmiignvbx3UXH4bamr1T/opW8gm0oF3LOON6SkQSzeG4RKp5/H6YOzFWm9
 6IQNGw+tJynIT2CD2YC18+HmWdxBUP+M9Xst8wcoaK9MkAF1VFvyaKC77lqy1TBcsDtv5KUf5qu
 eZxiFTjyscFhGoFTjYRUD9T0Nj5yMJJ0cz7x6TOTeDPZQ+wVEaz0a5Ug2f3MLzKCt5Zj+vxZuIM
 cqG5rf/ifSYPjKTGWZrbsrwBKbLG+WypwcWqBnkYd8Ph8AXJRGVCCezhEWGKO2xLvkQ1qrfkeaw
 b1hdT02SdRsfR7noWPMuYS/vzdMR19EH8zY/ClpFPO/D918aS+Lc8i/CADFXD4C7TjCrqDt8z1P
 ghp/b27S55UGfE17tz4cXdXNAmEjzAbOgUFjbZNsnfpRdIItY/HMenPQgCyoFQAXk/ZqUsUXhq1
 gzK4sWQ01rqq8BenjWg==
X-Proofpoint-GUID: BJDRe1b8rQ-pUT9DiSchhaxvS1yLDZlZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfX6XSimhHvKnz4
 eFNdLFh9med7tNBaNYU6IhrjY14SbiZsRoXziwKoRuNLexi9Bcvb3Lo4vaAE3+1WA+oPn2LZAWj
 8dUvsTQXU5P2zkLSkfpf14chwuAkjl4=
X-Authority-Analysis: v=2.4 cv=LuQHWXdc c=1 sm=1 tr=0 ts=6afd5ec9 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=k5nCMmGC1qFvne7xG5UA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: BJDRe1b8rQ-pUT9DiSchhaxvS1yLDZlZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180032

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

