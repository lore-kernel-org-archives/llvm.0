Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989765;
	b=NVRthr6BoYMpIuKTyuW+RRiSx//r39cSRRtuY8siGFgA36nOwrYnQ/WzNbqCKFVBE7Ho
	 rcu03tEyxcMn0kZpf66vhLmw1GoqQ8tJvnODDlmbbaPaBq4BDe2EIHEiftRne6Y8lNrH6
	 4UHNwWi7bz9abBvfgjO8c9yvE44N/3l2kJGY1kV7jf0IFN0r2nQcjVA8Vzn89Esw0gvTU
	 LX9zKhOQbGNsR8nYIKQDzPy02UdCEJL8dg/dlkKPC19O+d3wWnJ+ou8kAyWoDYykUcCX9
	 9flrxssaNXDagWqIFheE0z1xt4AH6CkEuzKr+ezX8nso7wqUm1eQg/9ncKu5EgCc9MA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989765;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=yD8B0DYzRE1TNWdjML1LXifT4FyY8gR4hOyIQw75JeY=;
	b=LkOKXdJQA2KCTAp5FsMVYRqsSDGuJ2wUyBCXOjTL22O6JU+aYAToittVr7AI26b/sJx3
	 X5YpWJ8VKbFVfImRnAMDVfFYZk34vPT3QZvHzyAFch0IeCfd9lC8mHx+9IXLm3ef74CK4
	 2+x+vwnjgLeTJy5pnWaBfA3vClGLNsfLvggLfPs3D47kH39RIMM3qPZSNcq1Y/wj4lbj5
	 +KqCon+9LyMXI3e9M7Ae+fRGgd2ePYsV06YpbEzBrSr0GphYWSjgzX8A28hNWm7kbqD/W
	 FwXZZrdjl3O2q47guDuuOyXCkUJ2pV4MtpgfAiW+yZvXP019HK1kGnP7QtLrEIuGTGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="gd/+fv9J";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T2eBbmVK;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DD5606A325
	for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 08:16:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28DD5606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gd/+fv9J;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T2eBbmVK
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI8AlV81430540
	for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 08:16:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yD8B0DYzRE1TNWdjML1LXifT4FyY8gR4hOyIQw75JeY=; b=gd/+fv9Je/WDy+wf
	mc6jOJedFBF/SPzhIsNWDj0hxEvzxOlojOXK26/p/uwQo/TfE2jkuUIJ/im07ezO
	rrFdFrMlLKPpVZrXzs3CXPbHz9K7+T5YMlaQpgJGivNyJCl0I3a3lfc/fn4eXy2l
	/NIqeudzIgpQ/+xE6UH2hAqMJwyGDNrwqHqlmNw8dbENwEUlLhKQFsnYsYrbZb/l
	37aMreWx3dhuK9lVdt/LY6sixcnKmwZ0n+ctonHL5Oge98K3NJaFawD3A5m1DG9l
	oro5GY9g+4Q57I+s2W5WmnnmkuotIWo83HgyIbz0lJnX1JacibKCDdl7UrCQmFo7
	tdrajg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv91yvm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 08:16:04 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b07b06027eso806520a91.0
        for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 00:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794989764; x=1795594564; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yD8B0DYzRE1TNWdjML1LXifT4FyY8gR4hOyIQw75JeY=;
        b=T2eBbmVK8VQVC+tddVm8YI2zaJnnNbtJHx5+Kuni06LPcuNubwy6M6Qu8Ew6bdgBb8
         6Nrq1SMk18eYCIwfnrhvdOztsArw/ClA6y5omv0ZhP/S5e/rZKdYLZzhy/85Cpkvs8pv
         H5LeIxmqC2XfoX3TbFwebKV6KrIJaWiLiyHxeYrhB2ur78S7GX6kikamSf8cjuh3uOHT
         CPuzUMrGJhQjYp/FWiNOE5nNoMM/4Yp3MVCKgTgJtzH/6NCefKYEglJ1Dk3fVh3wI4lg
         nDCC7owZuguKbmfyMef7GIEIuTGmAziZuDsvxphmVign5lt3p+36Zu2sFvfth6+E7apT
         yMGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989764; x=1795594564;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yD8B0DYzRE1TNWdjML1LXifT4FyY8gR4hOyIQw75JeY=;
        b=HZGGczdGl/9QpVAxNrWT69UgtE2h452Y6t9Ede7gp/na6/NrzSqxCJEgti0t2LXQgR
         pb5e3l7SOxtSUJcAAirbhTNkbCmCjE8BA8d7SuwpIH42B8CzYW+dduchgump9PrhzTkx
         MDFYCn3wmw8BJS3rTM7QpKu3uT99BnAcIDp7SWp71UO8l6dI9ZjlBE57BbuI8/YItBWe
         hp+CkD9R41u7gS8eaK0mvMvxxiABjs4FkhfunpPy3x8ntprxieuF7/9h45/SCyOWIgkp
         nt1zn5TuI8h5blBXqZSw7cpieoudhd/z/DlcHH6tjfTvDVpuAd89v8YqqdlvXp7QPNCQ
         0C7Q==
X-Forwarded-Encrypted: i=1; AL+hErGSIsNl2tM14rXmKvNdyYdDqp+uhwjm5iTwqaSUA3E5BuTXtY+XBWoChgFqjLbjfK5ff1Kk@lists.linux.dev
X-Gm-Message-State: APuU4Z8LDBj/guAYvepMUk5iQ081ljsl2MdKmzaeBfoLw7+fxPxI40jt
	pYwbufAKgH4ezjq+uil246dwWK6ysGd+uSWGK/o3WAX70IsW9z4nhcknNx5jWG1y34i0CAsKP9c
	Tb7fJZ4N1S9GIZ98AzP0vC5pDDr/I4P/OYwuAIdjKlA4fXIn3hp+N279s
X-Gm-Gg: AZFdTZeu0b6Sxo4G9mT8bht1voG/TAp5Y1KlsdrDl8iD27foewSIvVz2iDi8UJk7vTm
	KsEbK7vJI6I+rCZN15kwpUxqV2cEz2YiMIT2xaz+gRQ4szcqXtAD8/sv3b0XlMSv0o1Pmd3+4a0
	nLdxa3HwjN/VpNKPQV2q+6OTCqDskD+jxeFTSsAsYE6LhPsDylYwuMVXrAi7oB+llym0lCSRdeR
	0mRZRRhjUxaedMIvjHEBhqyNR9nZdTi/RvUg+cSgLIc1OGM3epErN/Xkcx+ObdE4SjKs6QPNpiY
	lKGQAZZMPBxosZfA3AxcNJaMFyJWEJSxpsfvpo5msfV3NGFTE82CoP/9/DJCotSzPM7bqv6bNiW
	gSulBY97rMnx6hvSPN0dSqpJNdQFGC2LS0E/fwNRXkFfHHF16VrTu7DuBD9rweAPTS+ClcAC7X2
	L12htqRc1SnXJ5cnVl5nnrPckEG3lZiV18JAkppo2J+j14md3YFjLEFWwgiXwpSHWoQiViVcP0K
	g==
X-Received: by 2002:a17:90b:4cc8:b0:3ac:7f4c:a68c with SMTP id 98e67ed59e1d1-3b3d07b0690mr2233246a91.49.1794989763345;
        Wed, 18 Nov 2026 00:16:03 -0800 (PST)
X-Received: by 2002:a17:90b:4cc8:b0:3ac:7f4c:a68c with SMTP id 98e67ed59e1d1-3b3d07b0690mr2233211a91.49.1794989762661;
        Wed, 18 Nov 2026 00:16:02 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b5e8asm3369181a91.8.2026.11.18.00.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:16:02 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 13:45:29 +0530
Subject: [PATCH ath-next v3 06/15] wifi: ath12k: add initial Wi-Fi 8 hw
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
Message-Id: <20261118-wifi8_qcn9575_bringup-v3-6-9875d2a3953f@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfX4d55SqHUANR+
 1MhW196TxxZ3w62fUy0kzYFawHl7N+vuANohoQDRFJUwX7a0h1HDkZDVEqvu0Hiy5Yv2pB2D61e
 UU0SRtxOL2mNZeiX1HnMIaQiqTVL0xnZgknVxb0ZHwTs40ROZRsAxIunqgWkF1+3A/0Z5rTjR9N
 nVCu08y2x0FhvAC+2cIWcZNgRyT7itOhcz8rCNYAYihp9OADE2DfHH5oEn/127nIsuQgRZ1gnJu
 4bAZfxPWgohMbn5fepW3EkyZxwbIS2jqipLUQoPge13YDsibr+HGUVTx6g3hRBWdYGxhesgAoI8
 9qTc1rLPva1LQ0N8XDvtQ2DlRqiQ6KEKet0gEMjsMWfhy/x9nNjBh3L0pYXNUaQeZ2oDHiu4fAN
 1vL4tlukxZlUEmYvlB+6qFzxTjvn0CcOxrHnyRvjXbf4AXYg3efjbARp4ioCIrkj/IMxuttTUMQ
 IfEsqRJdZhTpATyRCKA==
X-Proofpoint-GUID: 8bSt2MYBvvdR3i-nnFFnqphATiF7Z0hR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfX+0ElFQUlNfwy
 Ho6arabpt1kixrpjgMMGz13tcz9yfowSzfD23JGl9ZWDsh1Jw/B3+eCdb68KZGsztWt3v+kB63p
 xPNR042ZxxMhDNldr6n0aPJUtrr5GFQ=
X-Authority-Analysis: v=2.4 cv=LuQHWXdc c=1 sm=1 tr=0 ts=6afd5ec4 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=QEtot920D9eH50UxTSEA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 8bSt2MYBvvdR3i-nnFFnqphATiF7Z0hR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180032

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

