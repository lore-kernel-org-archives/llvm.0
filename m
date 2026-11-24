Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795538640;
	b=z1dz1xpMJaobVAiaKw+gIzngbocRxMWE9OqOL8y0aAGV3hehTDOR1VCmqA0Cyth4D6/Y
	 p/iUA1UD04r8aa0IowA8gHwNBMTX82gWuHzIDip1NEpTt2wWgfolXz0zDhQ+7echtpbt0
	 9kxvItLtKXiwAco2S6Q02//RgRoq9zSTVEx/kOS3NQhZdol7xGbVtn9JFa126JMYFnobK
	 sWocazcuoN5ZKGIzaniBznMm/kWafiJTccORi4w0xMWyTMRWzt85RyiJ5s/aWKRRDwcoO
	 7MZkTr8R/W7X5ioid3/an4uAzICkc5K63Ndi2V+5RS6OC1WuNrup6yKEo+z0vLDnvQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538640;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=GWx0aVWngVCT03NNmotvkbFgmOVbHYzPWzQqFjJs7B8=;
	b=ndRQALuSwjrXohL+tzCx88NbCIZzmZY+oB3T1zbKGJoMeXuaCvEyYkZkCnkd/5A/AwzL
	 +e1d+XAOis0tUHO3y6tYtjob++XpjIpDc5PIHrUJxV2gmTRDZ4DQvJEWmV9PIqXNf/bJk
	 g40HAuKkLC163Apj4kjenOLtvCcDrmN3XZKcz4zVSRMbP+HPhOfkYdWwO/+Z4hvuojAJm
	 pZqHuo62YbMMOMna4htLlhtMCVdhklT4JjM60Ryai7GGDRuQKFPdzBfmhft2Bijt4sicd
	 tYVDmcb+rnU4mrXDBBKhE47Pl6lAY885ptR58GeZjD5+RNpeRGP/dDiGzMYmbvrwZoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WWwCqqvm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LCgoc7zl;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA27606A329
	for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 16:43:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AA27606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WWwCqqvm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LCgoc7zl
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFL7Io1696915
	for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 16:43:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GWx0aVWngVCT03NNmotvkbFgmOVbHYzPWzQqFjJs7B8=; b=WWwCqqvm0H/6V+XN
	+5OtzpUE6C6N2ABlGE8AQ+cyjy13MueChABpPBU5MDIhuSCEz5/sJewspvbVuj8R
	PHZzEXZgPaCMjYUqTaBJHAc+lYiyfQ20Ao06hSbgo+GjGrEZclVpmnx4WRDlP6hW
	CfRPpL7DM4IyhjQrfDb+ITeTbz0m93nrtjkYh9/u+mwdb1xPtyCNf6qnchBhM6fa
	vENDM04+KrjgwgzoWeQOkOrXPUIT5gU9LOTQsMdDj8dlfAA+S5W0SOCx8eKL5pPw
	+cN7I+06Umm83CDR427FeUQSCiyLHeOngUP9viWa7qQtme8SLfib+2Z6oXT+54fM
	Th4CPQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5b8010q3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 16:43:59 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33713e5e6daso8286077eec.0
        for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 08:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795538638; x=1796143438; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GWx0aVWngVCT03NNmotvkbFgmOVbHYzPWzQqFjJs7B8=;
        b=LCgoc7zlwXawxqzWV6SMdASXXkofaCX9X0NdmoDOLVH7QJkKutwonaTaphhJRL4Fy/
         wbfNpfD9xxgXciwzTYI5tI43XAdpoH7rtM1k+tB2kMWT2DAne1WJsMdipUVKqCYcbIEA
         lWWrBXKV/DQcMFNTzTuQMjRWJ3kG/scbTUaW6kD84zwxkHiU+hviIhq0MC3WO8I0Hj37
         ByapW7fy+6n8AO3P7QGJnRv3s9LLszzSNeaP95UZFnGvtSl9ySBoVUyV3q3BNGqG/lQP
         aY8iuLZwsXZPM8gMoqcXrjdpbTZVFRVbJDiwaS8FhH7AtCYp4O0ReCC37fKI4xe1yACr
         84Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795538638; x=1796143438;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GWx0aVWngVCT03NNmotvkbFgmOVbHYzPWzQqFjJs7B8=;
        b=xBxtMR7K2gZANk+iUE2yNkHzJcClICgsvrLQiq9cV1R7bV2cjqP1XQ+xhDPvmt1m1f
         Io1iJsfQwbqJJBah7f4qunCiGKiGa6MPggU7t2HNCGK7dQlC/tNy0qMswmO/xPSylrBQ
         XrQbEx3eUTEPrRVALtD2Uyib/5uRTstIbWh5F/yHI95ribUGU+oxLHjL/hSPhZUr3NdJ
         hAN1oTOAwVWMuKln76IJJXFoBqyfRisTsm4+XGEYEU4Jpmd20olKsznJ38zRj7JNnyTw
         M70kMM1rpbyH9v33pfEXTfwgFcFKMkDJuBH/VF16360IwTuF7ZK314YDGUrMKi8OX28H
         lvTw==
X-Forwarded-Encrypted: i=1; AL+hErGKAIiZlQ3FE4sB874zLarhHPWjgldY7mIcIz7sbXNZUDTptFnYfAsziwEgmW4T/FpvVVS+@lists.linux.dev
X-Gm-Message-State: APuU4Z9tvPVCD5cUTC41jNXsR3Z0LIZ3yeLyYe2pxQimCZ1TW4KxIGdk
	wRAeknwdawDUDOmEik0PL8e43U0zHAcB65aX2xslNKPl1DDi7AXmiplmvYBma1WA2GSkRDBh2D0
	E0VEDKzIca1JQlU+68DwPPIP+Ib1m+3xHc4If2XWAqMGrc7sGsB7ciiB1
X-Gm-Gg: AZFdTZclnouGfqo1fLkGndqz/i843Xi44aH+UD3yngtdI0rJn+2M3PTjmjG0LiTmhLz
	le0Rmp5NIaTzzY+mI+0mTnW90nLIcnETrRI9kJUm/oXUXAvH7YVMSTsShwDj5dVcTfS+8NDlDdH
	Kq0lrKz5grW8+aXrBWtBM0xuQR48luvfBfO8fo/umaZXSbF0OiPrV3d+YRFnW/cThigqIPy4FiT
	TEg6dyLi8B5KY6O69WW1SnAT/zCZ7X3NWq87Igc9TJnXf8/86Tqwd5ClCE4k1rS+m26X7vnp13m
	DyFPyyrlY418MZ2kIJwY9EUVSo/zsGy+u0JodyGjyuPGSgOd+CypuPr8lhS34C628mhK9KZ2KSQ
	+UKuVuW3fZlgreZJHMep75CzAxTubnQK4y3Iqvp37QkBWPV7gZ6aFITG/rsgjDJ91J1qNpQJeSW
	QSLVnOu8s4vHYi7q1lj1v8DGpzql9k3+nSQyDnmR5Jj8kOUzju9OnT219AISFngiLYbY3cfwziD
	g8=
X-Received: by 2002:a05:693c:4196:10b0:386:a97c:f80d with SMTP id 5a478bee46e88-386a97cf86cmr9886148eec.27.1795538638018;
        Tue, 24 Nov 2026 08:43:58 -0800 (PST)
X-Received: by 2002:a05:693c:4196:10b0:386:a97c:f80d with SMTP id 5a478bee46e88-386a97cf86cmr9886121eec.27.1795538637480;
        Tue, 24 Nov 2026 08:43:57 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm49093900eec.22.2026.11.24.08.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:43:57 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 22:13:30 +0530
Subject: [PATCH ath-next v4 04/14] wifi: ath12k: add Wi-Fi 8 directory and
 base module scaffolding
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
Message-Id: <20261124-wifi8_qcn9575_bringup-v4-4-1f5b87ece6a3@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfX0aZoUzlb1vCA
 zQOs4FTw3P0ZWqKlSzAJeinsrbpFty7aR+jKcqTYXRhgr3gyTEnWjo/RMQYREm90hnahFUO8Dd6
 T8v3HHfzaxUW3xemrFMIBS8fQiHQV7w0c4oQNgHhv6JVJfH7/KJoh67AfOa/aq/DdVwVpbMuzWZ
 1Ocaj9nPTOQOjdSFNIz24KmrVlpR9viX35pv6zEa3a6PjT81UxKSH/8i2VC2AwpUUFcUdDqon/7
 9Xlh9KID6avK11hqGus8H0kX23agEiQ3lTTY1am/2VuIFHxRku96AlSMohrewtiqUGFl9ENbVqD
 mPxvI1fcJ9r4/KwtbYljQn+q+FoNhep/Z4+HGt/N+mhJAm7LwnhkFQwyonSQruobiKOpFgQCDco
 zFQjp3KEMU2X6Y7wW0WEB+2HkY0cV+emWeV5lPITiyFqj5aTvbjHkDhwp6CfSJ4SlcT0FqpdHFM
 xMZD/oGnawSrf8ZzmXw==
X-Authority-Analysis: v=2.4 cv=K5W3jCWI c=1 sm=1 tr=0 ts=6b05becf cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=7WpiGM8nEZjQw5yEjS0A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: fVKS-j4hJsDTrMGEci6U-g3MYlD8vgoe
X-Proofpoint-GUID: fVKS-j4hJsDTrMGEci6U-g3MYlD8vgoe
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfX7FGyyfjX6Yag
 tGr8hc9x6uo3OgJDgcuYpTSYRtJktiSxr5NCxRwAph+VJ4jWt3EcyPOjkeuXpXqQHpBI7L4YHn/
 NHCwEEZEOt3XpBdbpdswFE633ZuEc4k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240065

QCN9575 is a Wi-Fi 8 target with a distinct hardware family that cannot
share the Wi-Fi 7 module. Add a dedicated wifi8/ subdirectory to host
QCN9575-specific code. Introduce Wi-Fi 8 build rules, base module source
files (wifi8/core.c, wifi8/pci.c, wifi8/pci.h), and add
ATH12K_DEVICE_FAMILY_WIFI8 to ath12k_device_family. Keep Wi-Fi 8 PCI
init/exit as stubs so the module builds cleanly and remains bisect-safe;
actual PCI driver registration and hardware support come in follow-up
patches.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/Makefile       |  1 +
 drivers/net/wireless/ath/ath12k/core.h         |  1 +
 drivers/net/wireless/ath/ath12k/wifi8/Makefile |  4 ++++
 drivers/net/wireless/ath/ath12k/wifi8/core.c   | 31 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi8/pci.c    | 18 +++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi8/pci.h    | 11 +++++++++
 6 files changed, 66 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/Makefile b/drivers/net/wireless/ath/ath12k/Makefile
index 861ec85eebed..332110d72a1d 100644
--- a/drivers/net/wireless/ath/ath12k/Makefile
+++ b/drivers/net/wireless/ath/ath12k/Makefile
@@ -25,6 +25,7 @@ ath12k-y += core.o \
 ath12k-$(CONFIG_ATH12K_AHB) += ahb.o pcic.o
 
 obj-$(CONFIG_ATH12K) += wifi7/
+obj-$(CONFIG_ATH12K) += wifi8/
 
 ath12k-$(CONFIG_ATH12K_DEBUGFS) += debugfs.o debugfs_htt_stats.o debugfs_sta.o
 ath12k-$(CONFIG_ACPI) += acpi.o
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index a8e8a55aa718..2a4b5e5e1af3 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -956,6 +956,7 @@ struct ath12k_mem_profile_based_param {
 enum ath12k_device_family {
 	ATH12K_DEVICE_FAMILY_START,
 	ATH12K_DEVICE_FAMILY_WIFI7 = ATH12K_DEVICE_FAMILY_START,
+	ATH12K_DEVICE_FAMILY_WIFI8,
 	ATH12K_DEVICE_FAMILY_MAX,
 };
 
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/Makefile b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
new file mode 100644
index 000000000000..b8c5b6d3a7bd
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: BSD-3-Clause-Clear
+obj-$(CONFIG_ATH12K) += ath12k_wifi8.o
+ath12k_wifi8-y += core.o \
+		  pci.o
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/core.c b/drivers/net/wireless/ath/ath12k/wifi8/core.c
new file mode 100644
index 000000000000..9253ef9d9cf5
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/core.c
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: BSD-3-Clause-Clear
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/module.h>
+#include "../pci.h"
+#include "pci.h"
+
+static int ath12k_wifi8_init(void)
+{
+	int ret;
+
+	ret = ath12k_wifi8_pci_init();
+	if (ret)
+		pr_warn("Failed to register ath12k Wi-Fi 8 PCI driver: %d\n",
+			ret);
+
+	return ret;
+}
+
+static void ath12k_wifi8_exit(void)
+{
+	ath12k_wifi8_pci_exit();
+}
+
+module_init(ath12k_wifi8_init);
+module_exit(ath12k_wifi8_exit);
+
+MODULE_DESCRIPTION("Driver support for Qualcomm Technologies 802.11bn WLAN devices");
+MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/pci.c b/drivers/net/wireless/ath/ath12k/wifi8/pci.c
new file mode 100644
index 000000000000..3975081d167b
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/pci.c
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: BSD-3-Clause-Clear
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/pci.h>
+
+#include "pci.h"
+
+int ath12k_wifi8_pci_init(void)
+{
+	/* Wi-Fi 8 PCI driver registration will be added in follow-up patches. */
+	return 0;
+}
+
+void ath12k_wifi8_pci_exit(void)
+{
+}
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/pci.h b/drivers/net/wireless/ath/ath12k/wifi8/pci.h
new file mode 100644
index 000000000000..efe02721e470
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/pci.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+#ifndef ATH12K_WIFI8_PCI_H
+#define ATH12K_WIFI8_PCI_H
+
+int ath12k_wifi8_pci_init(void);
+void ath12k_wifi8_pci_exit(void);
+
+#endif /* ATH12K_WIFI8_PCI_H */

-- 
2.34.1

