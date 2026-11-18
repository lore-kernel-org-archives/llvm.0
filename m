Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794982785;
	b=2+kO6gjG0YLTHO6m7b/Y5W33DhKBifqsoSa2X8KAjBJNHaZ3jN37uGrOZF0MMEcZSvVh
	 jCuDkt6UJbfEXpDeb2Powcr1ZfdgCrAi2ordzPNZVs20OHyL8UE/cKi2jy3GK2eY4YzMD
	 y+M3PQ/Vaf5cp784yoxVKwuV9JE8CzF2RB0ysPyg3pV7YQdFirszg8d4SPWPMJ7U+/z4p
	 GebH0Oe0teYul95iJmPSuaW09N8yAMOudFua3L/8ASOWwGtO60AWsoi6qTtKvbNCp83kl
	 eM95DodSwmdhVVkw+KOMyntPPt7/d0ZWI0kbshtXqBISH/OcLxm4acf6As9jKsdqhsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794982785;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=yD8B0DYzRE1TNWdjML1LXifT4FyY8gR4hOyIQw75JeY=;
	b=DVbnZt6pjWEzob3oo+f8R+BjBlxyVR4CZyAVBU0oZLP9cVY8rvMoRFw2uoVUcB169vDE
	 MH/KQ5bE3/NRGdBZ0KkP+BtCLDk0Mqr3dB9UlZVKtrCV6jEwvZQyWl7hhHZGfYPm+yOrd
	 YbJNkedj8A1hfLqRlqbTywuP+TVTKYPt9ntLUb6GtZMIAUGXvP/mZtp7YS4chBcXCKx2w
	 wFXMXZrzD69LYrsJzlUtHmxLH8g5s1903+xVNCRdLz/HW8sdZH2rmlh433Nd76omAw8o2
	 ovEyD8RZ8VOtLW3RDglQceeJpnbqYbdosXNJ4qJ1qLO9zj/a1dvTKdh7lmQ2jrqtldg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Grcbm2Xq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z5d7TPJ5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70CC606A337
	for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 06:19:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E70CC606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Grcbm2Xq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z5d7TPJ5
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2Vvc54059972
	for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 06:19:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yD8B0DYzRE1TNWdjML1LXifT4FyY8gR4hOyIQw75JeY=; b=Grcbm2XqdikCIFC6
	9bohMJTNmk66EgQmWKXYo7hkfBZiw9FLCRsPDAQV7RhojP/P/Rzd48UiMangWNcm
	MLAhQCnV5bEcu7s9Oph7fpO+RvTKsxVK6KisJg8/Ve0qQ8C1lHzor0ABfPhxKeup
	allGGuO8E/L+zW26h0DVfpe0YZd7+eAGM+chuJkePB5XF0NBGCNFRBXAaOz6ctfW
	XS5a4xjOGSIqHZFLfuom3HBb/pstpwB0aEwykyO/IXJ4fNft1t+xRcGKZ8r1F7wG
	/uIr0pFNVhb8OMBRhjuPqImtw58toemSiWvAjxNpRR5JuF+EmakBzxJc/2Gq/FFN
	lWMguA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvchj7j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 06:19:43 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b3c459a35eso712230a91.1
        for <llvm@lists.linux.dev>; Tue, 17 Nov 2026 22:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794982782; x=1795587582; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yD8B0DYzRE1TNWdjML1LXifT4FyY8gR4hOyIQw75JeY=;
        b=Z5d7TPJ58UnIzsOo7N8QIbhG1raQMggMGHutvw8fGWcskNvrXXFuKjcjom7+38fiYY
         2CgdGtB1D3kAi70XqTdNOVMKYXAgKgOJuDaAhXNr/xJMHyqGSSQIBIY3q+AMXyHsGEDw
         DAw4mBqEZ+gOUNXThtFR9X0PBMWIc8CpfSSTUHEYIkBkhW0qOFIp6TUf7IgxE9//VEPz
         ZZOCTFeTnnCVl2fOoiv56G9Es15sa17eMtI2IjGOCyYIZXf9/NgxskXjjq0w3KWpjxAz
         4XAuPokFvFJ4b3ZEQKP+cCT8i2e+Bpf2TDLY6QwQQZZe9gfNrMHv5rwg66B1bu62sluf
         RL0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794982782; x=1795587582;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yD8B0DYzRE1TNWdjML1LXifT4FyY8gR4hOyIQw75JeY=;
        b=ZHcmq2p0qpt/ctDuq7YapSjsxdlXUXlkT5JBa7x2BTme1VnNCQUkUd683yyCxT4cJQ
         5SS/QzGXOXTrv+2Sa+XvHGSwJ+d0nI8hDGihxR64qoJkNSGBYRXm6HhRDOi3X2p8qOhv
         YzohZtbKWHE+eWvKqx/B2yDT28kYHDBBNCs8No5l7wkRDvapUBciZn8bHZeL47Pih3Fm
         BFu2uYNpQqA+qMQblxgLy9shtqPHL8ye9HdJqcbT3kiurYqneJAv7e8Ur8kP3qmY+ci+
         zVosWanruncWrwbeH6FbztQ53EEHmlc5YL/iLoMNwz7623AtJ0vUeqpTzT36ZjKiNW5y
         xp8g==
X-Forwarded-Encrypted: i=1; AL+hErG6GLTpg8UixivZMFdsZeoL2+Yf3T9aB9MNtljEXCm9w5IQTQDD0lldLO4wJoyzINhlzQ9/@lists.linux.dev
X-Gm-Message-State: APuU4Z9kaHv2Etxcq1RhjiWhHujoD7RL71ihMcZkA8Cv3K5/a9KcROQt
	/j4NBn9tdxT2QPCAdWZsFZRSqWEaqTqHw4Yd2rC6Eqr+ny6M+Kj8vVCkFE3Jv0vJWDj1g3VzjYB
	I7iohklCzjcI73Fz9J/yEeeJ5gXfy1ETggeiEsbM6w0ll2FeSoN8LV+lL
X-Gm-Gg: AZFdTZcRPTXj2VmPMbySqrk6ZNBggn6vqKGY9lGHuhN4pDjFWJH4WluzzohfjTYnS2q
	m26PkaHpKm5/SLds7Vzodw2mQFK9MfO/oSbal86H9j8OlCi7yCkYLDx+EWslwCogLRb+lj0xx9g
	aJO5itVC63RhLGJouu9j6REuQc67mfz6czdu3zVLAO7nfIkwQN7t6a3JtAgSY1M5j/xWOoZ/KZe
	n4XLEXUChDUqXaiDJo8WzhDf5BXfmjoDVjtuDm4lMGL9+pujS5osK9rZ6mEqGezsC2HQYreEqMV
	li1Au5vNeHROi5YsGiLQO0CoF8qko6xCQQxIqPf2jCPyBR1ol4/+0F1VilYZzpeQWpLh8JSE/hT
	Ze/A5RNmUiPLh/+JxGLYBSkKP5Izeb63SIBx7lORPdZ8eCBBRdlcPxeuiHbwO6U12Dn2yx1PLNp
	phYu1lRPlyUbULfI9qPKmvC/GqBSNTLy3CEjyNOx88u44EjKSY72xluv8krXl0paXbuPL75qpOH
	As=
X-Received: by 2002:a17:90b:2fc5:b0:3a4:967c:6947 with SMTP id 98e67ed59e1d1-3b3d07a8326mr1509069a91.21.1794982782095;
        Tue, 17 Nov 2026 22:19:42 -0800 (PST)
X-Received: by 2002:a17:90b:2fc5:b0:3a4:967c:6947 with SMTP id 98e67ed59e1d1-3b3d07a8326mr1509048a91.21.1794982781577;
        Tue, 17 Nov 2026 22:19:41 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac255634sm7395464a91.5.2026.11.17.22.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:19:41 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:49:09 +0530
Subject: [PATCH ath-next v2 06/15] wifi: ath12k: add initial Wi-Fi 8 hw
 params and init helper for QCN9575
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
Message-Id: <20261118-wifi8_qcn9575_bringup-v2-6-d81a3046290e@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=R5OWitRX c=1 sm=1 tr=0 ts=6afd437f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=QEtot920D9eH50UxTSEA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: iH2a_IeP1zYoRiSfJZGD7zx6T0oQI5uZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfXzMZ77VXXfYT2
 hgohp65teoba4UAwlpTlv+vunXAPAg02Ld3go8m//HsinNodw6X8A9/NRYOHwAxS3uN4VQa41VR
 YAZlVLH722ySCVQM9OwSbWZ4lM6AZwM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfX+MmQZuqTLDFw
 P7BEhvBT94u8hlBZSPzyUPZCW3cZVXYTgf8zBCFDPGYO3piHEDGPN245jTJ0gbeDlEr+x/JT6T3
 9TmuZ/DuizE7JdRDcbEJvje4MJ24Q5UnDRs25KjtozgnUj5B3TJhOHznChmpLX7r+OBNLsBTZQL
 r02RRvfsKr06dBouE579l9Bi4W4fMS34rMFUuSzFpubFyecWaNK3ecXtCW0qFC1UZOV44GzjctN
 S0H5Nq23bBC0jVDBb0vWqNvsswP5g5oX+ny4VxjbNNyW4GS6xtO9ILW6kxtOCex5B0A9ZrmdEat
 oH2BhWKZCD9FTy3+lcAHxFv93X4vkn7upctdNAiSfNvAsh8XLcPQ/NNolDGyEOfMwl5ZN/2p6rl
 NOdPOsHS9hOs1LbdK/9EJfw9tw9Hg50ViL7YEOh8bW8wxVq55mmByD6bgAyeik4GzHBEeaS7gmy
 JlCg4ZpIYcG+VxflD8w==
X-Proofpoint-ORIG-GUID: iH2a_IeP1zYoRiSfJZGD7zx6T0oQI5uZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180024

QCN9575 is a Wi-Fi 8 target that requires its own hardware-params entry
to be matched at probe time. Add ATH12K_HW_QCN9575_HW20 to ath12k_hw_rev
and populate the initial parameter set in wifi8/hw.c. Introduce
ath12k_wifi8_hw_init() to walk the Wi-Fi 8 hw_params table and select the
matching entry at runtime. Hardware-specific operation pointers (hw_ops,
wmi_init, mhi_config) and CE config tables are left as NULL placeholders
until the corresponding subsystem support is added. Explicitly initialize
every top-level member of the hw_params entry, including zero/NULL/false
defaults, rather than relying on implicit designated-initializer
zero-fill, so the full set of fields is visible and easy to audit as
later patches replace individual placeholders with real values. Add
wifi8/hw.h and wire wifi8/hw.c into the wifi8/Makefile.

Define QCN9575_QFPROM_RAW_RFA_PDET_ROW13_LSB with the correct OTP
register address 0x1F90070 and set it as the otp_board_id_register in the
QCN9575 hw_params.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.h         |   1 +
 drivers/net/wireless/ath/ath12k/qmi.h          |   1 +
 drivers/net/wireless/ath/ath12k/wifi8/Makefile |   1 +
 drivers/net/wireless/ath/ath12k/wifi8/hw.c     | 135 +++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi8/hw.h     |  14 +++
 5 files changed, 152 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 2a4b5e5e1af3..56b509841126 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -159,6 +159,7 @@ enum ath12k_hw_rev {
 	ATH12K_HW_QCC2072_HW10,
 	ATH12K_HW_IPQ5424_HW10,
 	ATH12K_HW_QCN6432_HW10,
+	ATH12K_HW_QCN9575_HW20,
 };
 
 #define ATH12K_IRQ_NUM_MAX 57
diff --git a/drivers/net/wireless/ath/ath12k/qmi.h b/drivers/net/wireless/ath/ath12k/qmi.h
index fc68ff649352..438ab92802bf 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.h
+++ b/drivers/net/wireless/ath/ath12k/qmi.h
@@ -19,6 +19,7 @@
 #define ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_WCN7850 0x1
 
 #define ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_QCN9274	0x07
+#define ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_QCN9575	0x07
 #define ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_IPQ5332	0x2
 #define ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_QCN6432	0x60
 #define ATH12K_QMI_WLANFW_MAX_TIMESTAMP_LEN_V01	32
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/Makefile b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
index b8c5b6d3a7bd..277b5f13754d 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/Makefile
+++ b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: BSD-3-Clause-Clear
 obj-$(CONFIG_ATH12K) += ath12k_wifi8.o
 ath12k_wifi8-y += core.o \
+		  hw.o \
 		  pci.o
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hw.c b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
new file mode 100644
index 000000000000..6e89a42111b6
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
@@ -0,0 +1,135 @@
+// SPDX-License-Identifier: BSD-3-Clause-Clear
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bitops.h>
+#include <linux/types.h>
+
+#include "../core.h"
+#include "../debug.h"
+#include "../hw.h"
+#include "../mhi.h"
+#include "hw.h"
+
+static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
+	{
+		.name = "qcn9575 hw2.0",
+		.hw_rev = ATH12K_HW_QCN9575_HW20,
+		.fw = {
+			.dir = "QCN9575/hw2.0",
+			.board_size = 256 * 1024,
+			.cal_offset = 128 * 1024,
+			.m3_loader = ath12k_m3_fw_loader_driver,
+			.download_aux_ucode = false,
+		},
+		.max_radios = 2,
+		.single_pdev_only = false,
+		.qmi_service_ins_id = ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_QCN9575,
+		.qmi_max_chunk_size = SZ_2M,
+		.internal_sleep_clock = false,
+
+		.hw_ops = NULL,
+		.ring_mask = NULL,
+
+		.host_ce_config = NULL,
+		.ce_count = 16,
+		.target_ce_config = NULL,
+		.target_ce_count = 0,
+		.svc_to_ce_map = NULL,
+		.svc_to_ce_map_len = 0,
+
+		.rxdma1_enable = false,
+		.num_rxdma_per_pdev = 0,
+		.num_rxdma_dst_ring = 0,
+		.rx_mac_buf_ring = false,
+		.vdev_start_delay = false,
+
+		.interface_modes = BIT(NL80211_IFTYPE_STATION) |
+					BIT(NL80211_IFTYPE_AP) |
+					BIT(NL80211_IFTYPE_MESH_POINT),
+		.supports_monitor = false,
+		.supports_cong_ctrl_max_msdus = false,
+
+		.idle_ps = false,
+		.download_calib = true,
+		.supports_suspend = false,
+		.tcl_ring_retry = false,
+		.reoq_lut_support = false,
+		.supports_shadow_regs = false,
+
+		.num_tcl_banks = 0,
+		.max_tx_ring = 0,
+
+		.mhi_config = NULL,
+
+		.wmi_init = NULL,
+
+		.qmi_cnss_feature_bitmap = BIT(CNSS_QDSS_CFG_MISS_V01),
+
+		.rfkill_pin = 0,
+		.rfkill_cfg = 0,
+		.rfkill_on_level = 0,
+
+		.rddm_size = 0x600000,
+
+		.def_num_link = 0,
+		.max_mlo_peer = 256,
+
+		.otp_board_id_register = QCN9575_QFPROM_RAW_RFA_PDET_ROW13_LSB,
+
+		.supports_sta_ps = false,
+
+		.acpi_guid = NULL,
+		.supports_dynamic_smps_6ghz = true,
+
+		.iova_mask = 0,
+
+		.supports_aspm = true,
+
+		.ce_ie_addr = NULL,
+		.ce_remap = NULL,
+		.bdf_addr_offset = 0,
+
+		.current_cc_support = false,
+
+		.dp_primary_link_only = false,
+		.client = {
+			.max_client_single = 0,
+			.max_client_dbs = 0,
+			.max_client_dbs_sbs = 0,
+		},
+
+		.host_alloc_ml_id = false,
+		.advertise_iface_mac_pool = false,
+		.hybrid_bus_type = false,
+
+		.support_hw_link_id = true,
+	},
+};
+
+int ath12k_wifi8_hw_init(struct ath12k_base *ab)
+{
+	const struct ath12k_hw_params *hw_params = NULL;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(ath12k_wifi8_hw_params); i++) {
+		hw_params = &ath12k_wifi8_hw_params[i];
+
+		if (hw_params->hw_rev == ab->hw_rev)
+			break;
+	}
+
+	if (i == ARRAY_SIZE(ath12k_wifi8_hw_params)) {
+		ath12k_err(ab, "Unsupported Wi-Fi 8 hardware version: 0x%x\n",
+			   ab->hw_rev);
+		return -EINVAL;
+	}
+
+	ab->hw_params = hw_params;
+
+	ath12k_info(ab, "Wi-Fi 8 Hardware name: %s\n", ab->hw_params->name);
+
+	return 0;
+}
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hw.h b/drivers/net/wireless/ath/ath12k/wifi8/hw.h
new file mode 100644
index 000000000000..ad11370f9752
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hw.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef ATH12K_WIFI8_HW_H
+#define ATH12K_WIFI8_HW_H
+
+#define QCN9575_QFPROM_RAW_RFA_PDET_ROW13_LSB	0x1F90070
+
+struct ath12k_base;
+int ath12k_wifi8_hw_init(struct ath12k_base *ab);
+
+#endif /* ATH12K_WIFI8_HW_H */

-- 
2.34.1

