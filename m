Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794472378;
	b=ULrgRQzAAP0xBG2zc2hPbdXIvUIuNFACMK/4SY7a2AjzfPdEmSqoDTq4uyQrBIFWOi7o
	 ea+R9Xs3waTyRJBOvnW9kQ6TwuPBUaAN/KRhzSDkpKlJzzRXy+fjzcwVWhUEYHNeRpc3h
	 ob0fvXLn8R5GS2smFVoonFvb9iPIPvFAw7j3+9bUYXOzn+3QE21Hlu90phvcSvWFHmVeG
	 PUlYYqdS1lU6LVph+hHyhv0Ur1XinF/D56XDg/brkVyGNJvjwGGcS7xv5H8S9p36la6tf
	 wHKCvLcd8CD8v67ULcxbnN/SCeX4QGkysVNKFsjKe/Ia+tkPkS4sR8gD611lvVv3fAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472378;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yD8B0DYzRE1TNWdjML1LXifT4FyY8gR4hOyIQw75JeY=;
	b=ILDRsRXCef8looOHpcYpduPFfVvtQ9ldVtqWT9onY5K0jCt0S9VzYI6r6I7XRapzC7Fb
	 Ag5z0tjtVcA2Y4AH6lM33bCexX7Om4vjoFjBU4tkqGqX/wl8Wl1zDFW7iOXxO5EBefYVx
	 h1+Q4R3fUIDkWV6j5e+9n9eB/3TzRa/8cF8jWORqqa8MZG4qrhzhNwmfruaEkcQQ2NVPS
	 Y6LsITgf19N9jSS2VwUbFI3NBdcBW5TMacp6fQZpUaZG2EELebIm5EtQqEVE0a5gflFN3
	 Rf7FZQ8fQSkcygb0cpHaEdF0/25JTh99z4VBCqDvgj+fMsPYSbpvYUSjVFfyYhKR4zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O6sYEmcH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="h6bxa/nh";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A4E606A880
	for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 08:32:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76A4E606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O6sYEmcH;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h6bxa/nh
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC53pLY3477100
	for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 08:32:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yD8B0DYzRE1TNWdjML1LXifT4FyY8gR4hOyIQw75JeY=; b=O6sYEmcHDgk4vMnY
	cE2oxf7+oLQkYlWF+h/50XbkZ4NgtMq3bWsPoxGofCScueeV8N4NoSXXXyTsHhU/
	T8aTeDz7E3iv3lVQfoCWsl/rzkx6MNMvry8XtKovezvC0648FtPjfSB9cm43HssU
	LrOTfeQKnMIooUXg2L7I/isGXw+9lJfdarTtFWnEPxH30N/RUf1nbIq8Jmu+Rt4Q
	LuZ48JW59V206OCJybVdzPJyxkUjE40rR/wpZaMyQzugycGmjA0tqahICS4Hbg1e
	QsMuYZjCu5yy8qqIbd9awFkBnvSOO6Z2VQEWZdHwg0L/NNFhxNOair0BmKjXptUw
	OW64VA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw6yugpu8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 08:32:57 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b0c7ab2427so3397520a91.1
        for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 00:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794472377; x=1795077177; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yD8B0DYzRE1TNWdjML1LXifT4FyY8gR4hOyIQw75JeY=;
        b=h6bxa/nhYxfc+KxNd+xw+gP7aL3xeBvyZq4oqU89LpjnPqfTPJ2uNGllv0GWADtwKk
         aBHHxL2GWv1Lza6vEm3UBGp7Q+4uHWOP963boqDMwqDtY1YWyG2n4qCKwu7g7397Qjrk
         HfztLjlBV4WACv+CQL/BI5yW0Jx53+4tlJ0lH6FWKpIAaXVfhl8db0Nj10GQJambGE+e
         QMVLco8UR8NWt7dBhtJz5oqtdpecUwMa/3xia/GJOQ7/kYva6X3suRBWm3TBWp3SEuj6
         DCPaQzUTDRPiUUli3QGCi5ojOiXv5jPdJFyuONqEk03d6jonmP+OzEIVCXoPbBVSHEnn
         lzAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794472377; x=1795077177;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yD8B0DYzRE1TNWdjML1LXifT4FyY8gR4hOyIQw75JeY=;
        b=OQWgKsSDBSnzuqRrvg9CO4lDQsgzXSOTXD3OHy6nximDycSWDSjQwB51IghrrtZQko
         GFLTOLUjEm9K3M3T//j8meiWSujO5bpQrhGMf3EXCx9JQ4nW0dXyAtR4ykfKJyMcrvp3
         w+XFybe6dfgNhjo5MeX4idZG/utj0AaY0Rweq6dNY1jxJ31jmNOcT343+Td5ewfW74QX
         DNvBnQOXW8iK8uEI5pwLKIM0Jq2nJDRdJgH9ZAEg3271FW54xQZi15AL2vcEyHWmoLdM
         Acuwn7C0czSyo1NhVAG4D/ImLLLjBV1QvfMIhnV3xcUquLssewpCJ0FDHuTFoY3Orb44
         bNew==
X-Forwarded-Encrypted: i=1; AL+hErFzGdKM3oFW6LduTMxAR+x6tU4B62ktgcEEnozC1JLGDAtFxdQLLIfe1cP6CIrD+EBHqmNG@lists.linux.dev
X-Gm-Message-State: APuU4Z9cgqz8DPQCCWj37C/7Lb6Q6aNb6TC0EOJLC10xjNEoVEyylgNc
	Wy2T65zqYBo9wF5IK44r+kxyvNzi+T7YWE7GP0ildObebvCp3q76keeli/GQbJuQTAOyIP/cuOZ
	G/nUD4NTx0QT6zqRy1p//w6znHWdbcxjwjQa8v7yPq5eItwVOdTRkl2bpQqphyOGq
X-Gm-Gg: AYBFou2RrWhdP1FGoR4tobUmby+a2TgJCOxi5qRiWuPPZfKULX9uCQdmMb7uZKPOoxO
	hD8XUk8ierqVYxgzDAXKqwKjDXCg0JJBnbDjYkTRBHIifhYJj+ubZOpbcy5nMnuXlF8jxOlRhBT
	+YSOSamkrwCNHD2i0T8Nd8U2Wl6Dzr9BG3DsTFrvecK/RI5tXeV42HS8TTZbk/bHH/r0LuguwvT
	k+QDmwPwf5Oet24tPBV1HLgDGapPUQ3sPtTkmSj1xF8/PXq20P+pE0fqr7/7V82RD/quJAqAcI1
	dze6iOMR4I/+0ka3lrM8cn2ElEozQ/4JxWzfUPFrdCyZMQqr9IvKxx8Z/q55D0AIOD6k8QmnpD2
	M3I2ZewDrPczQ9IHmjkMKgsWdVtlP/zrGb78OE1ZTRSb/dB3D45Mddt43R8mZD3MiEBibQpNZMj
	XJ7b8DhPY9Op304TDJyALe/XEG/q7eOgt984OY1U6zFfgU4Wdyz6LJsF3EkHkHhMgcZpV3YWMaa
	w==
X-Received: by 2002:a17:90b:17c8:b0:3ab:2737:3396 with SMTP id 98e67ed59e1d1-3b182f8ba81mr4533404a91.65.1794472376930;
        Thu, 12 Nov 2026 00:32:56 -0800 (PST)
X-Received: by 2002:a17:90b:17c8:b0:3ab:2737:3396 with SMTP id 98e67ed59e1d1-3b182f8ba81mr4533373a91.65.1794472376358;
        Thu, 12 Nov 2026 00:32:56 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce55c1sm3518029a91.3.2026.11.12.00.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:32:55 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 14:02:20 +0530
Subject: [PATCH ath-next 06/15] wifi: ath12k: add initial Wi-Fi 8 hw params
 and init helper for QCN9575
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
Message-Id: <20261112-wifi8_qcn9575_bringup-v1-6-3f30fbc2bb69@oss.qualcomm.com>
References: <20261112-wifi8_qcn9575_bringup-v1-0-3f30fbc2bb69@oss.qualcomm.com>
In-Reply-To: <20261112-wifi8_qcn9575_bringup-v1-0-3f30fbc2bb69@oss.qualcomm.com>
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
X-Proofpoint-GUID: t8CXoxokc-fXx7jAIO8tfUvYR2QFVu7G
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfXwuj0jJwZkUZY
 eFvjd36Qy4ZF2+0kN3YZVwheHBKDlYf05SAMAeAr/5PcwhFWiwTsXrfkfhW3C6owi0827NAdpqC
 mqzsTJ+ussq88I02J01TJ5ok74sqE6o=
X-Proofpoint-ORIG-GUID: t8CXoxokc-fXx7jAIO8tfUvYR2QFVu7G
X-Authority-Analysis: v=2.4 cv=d49gWhjE c=1 sm=1 tr=0 ts=6af579b9 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=QEtot920D9eH50UxTSEA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfX29Z19QfzD/3Y
 fKj7wwOuJ1ivlC3tXro8dZZiwO/wt8F47bBhBYeQ7UGMJFAgMQy9aODnb6ArGBQV+q/0nl4p9YX
 c2YmCb+kZNPn1GL7qUBmmblHAyU8zmf9jcDUYukTzcjU30gx0XX26jV5/Jrqu51vlkfbJWTbfyf
 Kuno/l3BV9LSmA9CrwaDK2TZJjypWx3GSEeFiQbFRKGv+GCM6qmX8iuaJTZmEINjrMBGC7UfWHj
 nmrJ9S1firBKx3N+YAi5xbNRor9xGG+sn14XyAqVGrlkmCq1POXCcYvkvm+wUoeoFvwBwMZa5Xf
 On2J25x1DecINid1f5J2UYl0nTf52sAHialUvopN2MAphi4DCE31IJ5BDzg2SI19R5IKKKkYnPj
 7rabOfJYanQ5IM0LPTs9cZbg6jlGxw/ipwqJr2S1fquHHmBpMsv4hw+FbHSMFTvTPC3JnSIb6L9
 +avXNiR7tJ7nWtRSahw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120033

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

