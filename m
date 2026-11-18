Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794982790;
	b=ToqjpRIlvRKa0bE5ZwY5/8cVUCWc1+RYx/ZoEKrDpyipnoRHa5h5tmiDmLb2XUSIrSMN
	 PWKwU7U3q/YO57oSIvRVIwuidKddm5CtbHBqch9nNvWNhNEAe3eczgGtVNURvVD6jZsGh
	 Azo+/A/RNeM8iTMsKY1MUYe7eFrt2L5FvVD6iwnbB33WvNGoNZm5wMRo7lhAbfg1BuhlW
	 f8k5+/adO2b5rmgn+m0AhSM56Few0/sqTbwMxcG87xT4uleJFDqGwxA4Rk1tJdVdGm38N
	 4iiUHpzmrAd1yP++BJz6+xpgO9+E8RiIY8qXTJY7ngBTNjIjpUmtUBFo4jvNk3Do0HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794982790;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8gVImVKSYwlu0y9iYIfF4tE463YxrNVJDP1PpJFp4zg=;
	b=Hm84lSrI9wkWDLG8QKZJ7VvyU/XUhIoh1Y/exYX4jjG7iUBWVtZvIzyG9IM8zlW5jtzu
	 1VTx2ptQg2i9BTImy875pmhyxosMm5hj32YYCpduM/hjRHAgSL6klLFOPnOLc0a/Ek1fr
	 mDvUnmxEL8ve/yZKBxYHcOHPTxkAL18nrK+jgY2fHlYmp8c3lA8fy07YPc7W1CHyFmdh7
	 /Cxku+MmakGEBGGKLXUsVMtQd1rZRFmpu1kgk7MDzRXwz1K6H5B2rG+hwGk3piKbDd/Bf
	 6WtgF4Mc8qHIeRK8RPPvfRTdCKWQZAYSa7bE/8RZ6jb++Nen9ezYsWwoPCoU/xfhBPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="JRrD/6Xt";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TU+oQ4F6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6549606A33B
	for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 06:19:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6549606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JRrD/6Xt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TU+oQ4F6
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2Uugp2453530
	for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 06:19:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8gVImVKSYwlu0y9iYIfF4tE463YxrNVJDP1PpJFp4zg=; b=JRrD/6XtDsB6Qbh6
	4sy7bGtdYPb9cJE2/2loKnxWE6q+uR9hy9l5Rb7Q68cmJwu2P0E4szy9+pjEjrcW
	KOk+jQzGqhPYWfcSv8wgDlV6X7etDM+TbxghBRHXg4SQzoeM1YoQEzUJtEVz7vog
	B5sMAlmPf69U9vOIPpLikxGqFB1Oerqyhq0h9ZA7LBRovX2FrB79UVpzopQuQM6l
	vzsxU1CoXd6YCCJ/lQWTKFqMqMPoxF5m4jSh0sZnUu6xhbaxACNL2zbKRGD6BPCb
	7qorAaJq/qqTq5mXhgkxJSlRP1ElYj8Tfcfp45U8citY70CC1PlpmKvFlKOGc/Ck
	TfvUtg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv99gkc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 06:19:48 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cdaf2073b0cso395871a12.0
        for <llvm@lists.linux.dev>; Tue, 17 Nov 2026 22:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794982787; x=1795587587; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8gVImVKSYwlu0y9iYIfF4tE463YxrNVJDP1PpJFp4zg=;
        b=TU+oQ4F65zgh7Jb6wD8kZKmLmiBbAQPla03z+QhJCe/t91KE9JwRmfirpOjtKIH/9s
         6/kLOg9Fyy09ALDG4gd8P9OL8ERir/1gxiSWP4usn6kzU8WQbXvN4cJ2idP+9mOWxb/q
         01R8Idfk6H4UUxulQfAz2Tewae41aIBmf826cdpsFsQtM+jPcnveYrecn3IKsPvqlpvS
         08OS9uqmdj0xxFJ8rFjQVFzt02qmvnpc15M7gV8uLyzETEo/DUVCgNvcyhJshivhsPwE
         ElkrI0cti/cpPti7oB2o0IcvsC8voxN+UKlo5eHQ0TF9aQys8T5eC6RmpGrxtwPad0OS
         FYBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794982787; x=1795587587;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8gVImVKSYwlu0y9iYIfF4tE463YxrNVJDP1PpJFp4zg=;
        b=ufEVvPno+xzqamxBKE4pSj2TgZrytdcGQc4NPu/pe9CL6JkFgVm+AvHvtHVZtPfhqH
         1TkNJ+Elbc4524IaicUwTk0octGE59P9ZiizHRRGiJo+86q3RwKL/f9KgMFHzn/tYuMJ
         kfVPhQZ0C2C4JmXt46QxjdIg30NJSDo3T762jcs8ggcDaFdskuaDAt4iycK7eI6zXVYg
         KR2SMRSDnuDJ+INZA7xDLDlAcR8meZMuDEihlEm66QBa7AZfu2spGV+Dz5IpFSy1MyNt
         AWrT5VCs1whkX4rXQ/cCN2nnFIaqB2k3iAMDih0dcRWQih+E7oSJ4DcTpA+/b1/Yv57M
         XMIQ==
X-Forwarded-Encrypted: i=1; AL+hErFC7c9F6HWMyd5SOnS6tzWVT98hI8ZL/kisblhdULb93l4lL1rmJfJLMPL3/D/lU0BgkCDm@lists.linux.dev
X-Gm-Message-State: APuU4Z/QN//WfDhkH4swomqtdsEhVXCJ/DHmSUbVNOtTTQb8veTAnLdQ
	JZ7xayWVSabjGyF6d6fOdvv2DosztfixF/gzl87gtmmPrJDkDjG79ECG9or20dghpaNrS2UALJo
	kMgYnS+YYl7HMH/uaRXzPPlMI4+N6X3db92TZ1skU8OURHPTzPAF0S9X0
X-Gm-Gg: AZFdTZeCB6iMwSX/HFtr+pdX5s8LTVcznd+h2hMF8rg6y7+m64tDRAEMq0UE4bCygcw
	ziVybuqPuaK7rwKKvGvA102B9Gugjv4yhnxFNtz1HXKRf8J9AwY7HH1oy1EjhL3opy8lmQcB4RT
	q1+JBM0EXQVnoPKOpIa5s4nv8H3YWSyeNzXxM7mHXkmovaJZKUfOZEq54nKdkbgDSWmybp65Ex7
	/3RtOj6O0E/PDCVEfcEQJye/FcPqj64haYf5zoYxKUJ+YvH6udtb6meIxodQJqxJszLcbPPTPDo
	cuI/wbH3yxr9wzUMybVLqkzrNAsGJ3o9eYUGuqkkVZU/M9i4bTOEACU8ULUuBPx1MbPCVUXgplH
	9FapbTF4pg8Qb8ltRS4xZBdA6I94QXl2Iu+VQ7rRlI5upb0Hs/7/srcl6YF8St/6Fn4v+IiLc6H
	3e4kuoZAICZufgXnCIbMnSVAfBfNH9BDOsWM4xcBDKXQL6uyR0FCQguGyNaC/lh8u3f7ZlF9Bzk
	mA=
X-Received: by 2002:a17:90b:1d04:b0:3ab:e588:c295 with SMTP id 98e67ed59e1d1-3b3d07a5375mr1531484a91.42.1794982787354;
        Tue, 17 Nov 2026 22:19:47 -0800 (PST)
X-Received: by 2002:a17:90b:1d04:b0:3ab:e588:c295 with SMTP id 98e67ed59e1d1-3b3d07a5375mr1531457a91.42.1794982786698;
        Tue, 17 Nov 2026 22:19:46 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac255634sm7395464a91.5.2026.11.17.22.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:19:46 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:49:10 +0530
Subject: [PATCH ath-next v2 07/15] wifi: ath12k: add Wi-Fi 8 HAL register
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
Message-Id: <20261118-wifi8_qcn9575_bringup-v2-7-d81a3046290e@oss.qualcomm.com>
References: <20261118-wifi8_qcn9575_bringup-v2-0-d81a3046290e@oss.qualcomm.com>
In-Reply-To: <20261118-wifi8_qcn9575_bringup-v2-0-d81a3046290e@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfX9+P5F/X3Z750
 ZMKu3jIiRyHipAzURAaYzoeeUkgJh9MN0R/aOzzeqipvMiQYbYx0fCRclFHGKQgBH2I3eUmCNxJ
 hKV+lzTOcuCNV6xEJ1ZlEyHxricpGuc=
X-Authority-Analysis: v=2.4 cv=acT0Dhot c=1 sm=1 tr=0 ts=6afd4384 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=k5nCMmGC1qFvne7xG5UA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfX4UGAGrBw9pFH
 dfiGnDG0/pIqvVpGHMU0Q2dB6G1kxImNJLekM73h5gZaZwFvL3j0Zgj37NI9VcEEoxFsnbqeZrm
 NRnxawR17c5qSg/+IKLDzamMryzxYuNMB90LRz8Lz71WQh2qq+LCYKJJ5Wp5bTGzZgfb4OBQnoK
 YZ9SQyJKNvsru1zqZJ0MP2ou+W7ngYPLD4pPTnsQ8SeVdyYEf1aWux+2owi5kjQyTgscknFY4/i
 yc6w01tpYY7k9X5f6VjRafoAynSEuXSaFHCZwETv2Wb0OZmwSYhKUCzHk6Mh4vDcAO4GjRvd5sD
 IFFn4Hu9l1Na11nBZoby/hQOTrEktitSwxt1rJhkG9TJmpBoGnZqBUo86PZBV/m1iwGpU69kQIi
 uZgBcf8NHcAvpbn/AIfRBFrQiYJ3STOcQ6DLkbFUSG5mmBeBifDH4ebNMQcC7gmScRPKBrxGJlw
 axpT7BWdWzNh7ve7Q4Q==
X-Proofpoint-ORIG-GUID: nWsTAD10hw15kWLH15bqPHmOG2RO-bLo
X-Proofpoint-GUID: nWsTAD10hw15kWLH15bqPHmOG2RO-bLo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180024

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

