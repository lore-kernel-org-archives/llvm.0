Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794472400;
	b=CDQOxvm0BFIaJ9x7L+XrtOPE1WbUoE64qrtIdo2PxrefxpKy7tE8YCGBxAQNXZwUyudc
	 xr+DS+hjrzG9kOgqbb6DKWrp3Q9rj/QL+sTJnq2UgD+eA1LLOO1Z67CP1NlXrRVxdXCsJ
	 hvTOK15HoudUNTF01nzPuxQZ+eqLCogq9+acpEAu9iDmLyDNLQuGvPzWsohV4lh9vmjqA
	 zjEC2EllLHncefClOtV/miG5wIPOWIhww/SpUkzgZgSt7OkATm5QMbJ/p9G6hXQePRSDr
	 2vNdqCZ7MhNo0i0pjrn269Xk3TGWzl+pkucJMvr26Pvm6tQ/HUPZGq5I/Txg4Ehh4/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472400;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=PO7c9o0yG0Z1EDbhW+OqM/Ij43hLdl7lNBk4x9MT9E8=;
	b=xMHIYkw3eT6BoL6HLUfm3x9S+2X6VWMlfnjTubK0ay3BZOSOmJrgkf+A14MPn4UAX3CW
	 tAb5kE1WqILe5no6uxprCxt3q8PiUn9/02LurkjCd/uvz3sGGjSrPPlFXztd204r5vku0
	 i+txERVoPkHsDejBKHZTSuxLbBqMxTbSik4FDfUojDiBdBsLJMWRFo8LdVO/i189To0Az
	 zkpO3YcvGqb7k4yAP/h9qZVJaH1AeuuAsdsM65QdP9Ya/gjxsr12yhUn3VufYUoL546sU
	 nS8AK94lXWUgShyI/1ivF+ENPZ+7uZQDLuY0QIyxFIPvVdXfcP5AgA9x/FSHuI+zWwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mS57UF3t;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PzNZ8dfQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F182606A883
	for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 08:33:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F182606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mS57UF3t;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PzNZ8dfQ
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ZWTn2514179
	for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 08:33:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PO7c9o0yG0Z1EDbhW+OqM/Ij43hLdl7lNBk4x9MT9E8=; b=mS57UF3tUgxFrlxj
	xB1z4moWrZ/cepUsWIaj9Xw4c6DddzWGrWZ5DN3zr0NQZUhDRUr22twDmG1EZFY1
	LeTcCeOKTsdTpFAU7H14mr/i1GzX+0G6dUcQIPT+XI2ROlQcZLiZ9uC+hg1x2RMZ
	RwSgCOMRN2cPqipFt0gpaknCXNO8ErZ0g8xpNrGrWzumyQMTrsU7/SleTwJomSSv
	q2KeSy5KdoAOg2B3QjmkcAP6W5+52pQlX6chy3AOiMSiJs0lpUJ1ppqzz1XjOyPF
	zbTI59XXvaL9zAs7VaqRL2EWi/HPBSyfcBzTbDMs15Y0/NZTBuEcJ5eo/WZnMcN4
	bsnKag==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvwm1tpym-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 08:33:19 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1ca15334cso4242492a12.1
        for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 00:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794472399; x=1795077199; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PO7c9o0yG0Z1EDbhW+OqM/Ij43hLdl7lNBk4x9MT9E8=;
        b=PzNZ8dfQV5NO8rTok4/lx1YeTUZRiMM4SCEtgrRuhxep87py/6NzOeHV56GU5AqmV0
         rgDv+BUQDlPJXNnqK3Ujbugmp3HZpsp8NFSNu8olJHhE0OZrVz2vDj2N260RDbxLWLPA
         te9t6SJfNEPwtC4ppJgYdTUef7SnS8mmlQ6PeO21Usy2tgKEQmAei1NKzaUN5EhBiPzI
         F1WQ0bNwI+VNFjzvQszUAUHQ1UKXN5AtRNpzmT9Vo6u0wEEKGtJ0xW4ZhZpDQpOW0a5x
         0FUTClfs9xtG073ghgsDgOSZIpfS90zBLrm1JXkjVhLVbFcUeITAdbrI/1SY1lqNunfw
         ksqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794472399; x=1795077199;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PO7c9o0yG0Z1EDbhW+OqM/Ij43hLdl7lNBk4x9MT9E8=;
        b=d9caiEg2uFPwhjgEIHbF7MKxcJG/VjJNjAzk7cYDLDCWnxv2LdqoSgCe8MtXm01cfY
         RAg3EnTJsh2TO2IUXEczJHQ+I3Bu2bG9aDQHdFzHhT3hKtav/DpqCy6FmJHgrR4GX1Fs
         je4m4Qn/Mv2v7Rw1dPO40o9D0ksc5S0sqMfjmfbjDQadYPOFBSHP11sgNGW5s+3J7p2B
         SAPqJ0dhm5Eg+3SrfroNp+FntqHrTkfpmKgE3s2exvCDW4nigI7KEs1XsZKO/n1cG23r
         NIxCo1z23BG/rbQ4+oaQzCVWOgaRA9jrzM/wMMPIs/+qR4Paz5EPAGpU6KTEhrV/qQ6Y
         tdTA==
X-Forwarded-Encrypted: i=1; AL+hErGHXt8QdAGRC7ltIkPMTrFli8BO0km2p1WmgJ0lnCXD2IGIck4gTO227/kkHviR3jvJ9cVP@lists.linux.dev
X-Gm-Message-State: APuU4Z8WX9fRkmrTmHUfeWQiMtHEf4686d84fAM3mjsTapp0Nv96E/C+
	WD46F4YznRjXloI7FqP5Q0LZvLNOi4LDHQCVw0HBgudiWZhFQeE36QTzocOqc8JDtF2R5NeU4D6
	5MgbHl6W/99jjqUtFV+XUUdU/g/qVne8O8kxY/ZoPdG4BtPcbAii2IEv9G5oUccd1
X-Gm-Gg: AYBFou3hzCIGNG2tbmBZGtZXdADdrp6XQ9fiphXsdkEHDuMpIyjQQGMPaA+oFfXkg0t
	90X9GU76SuWaFcNz9zf1jTU/Z/uLMTEqWQ4xRoLKGsYFjoGYE6NkUTgUJpc0Y5tFOu6ZPv8J+lb
	hjOPUbe1WipmQgx7vE3H0JbECXhp+cZDb3D+vE+BIbaTgFksaZRVybYJpFLYkGA4wyXNWDQtgo8
	JtDltXhcXoN3vyc29l9BBcKzWktj+vk/MftEV3R/FfuaCJ1VDoD/DIrHMyYq8GGk+5IqS2+rAAX
	OpNCAmedIss+50nKPruNgbAptwlmpNinXhAN/WYbRztxqc7TjZbs9EsWhMtHfjG5x2D6f5YEZVG
	sQlijrBY6RJNbrVxLHjQLYJ5Eo3O3O3EntVB231gugKhwmvCSRFjsCYo0E8J6m5pIS6JTCGyOr7
	nr8H5x5zZLQr+aNvr9wEk6X1R+wriFbw1nt67xi0SR/t7HYSZpE5jnJkZsuXP2Jk/s28+w137EL
	g==
X-Received: by 2002:a17:90a:da83:b0:3ac:4e18:2390 with SMTP id 98e67ed59e1d1-3b182defb03mr4885540a91.7.1794472398781;
        Thu, 12 Nov 2026 00:33:18 -0800 (PST)
X-Received: by 2002:a17:90a:da83:b0:3ac:4e18:2390 with SMTP id 98e67ed59e1d1-3b182defb03mr4885514a91.7.1794472398263;
        Thu, 12 Nov 2026 00:33:18 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce55c1sm3518029a91.3.2026.11.12.00.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:33:17 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 14:02:24 +0530
Subject: [PATCH ath-next 10/15] wifi: ath12k: add Wi-Fi 8 MHI config for
 QCN9575
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
Message-Id: <20261112-wifi8_qcn9575_bringup-v1-10-3f30fbc2bb69@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=KsnYSmWN c=1 sm=1 tr=0 ts=6af579cf cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=FOB8LY2opcXQ8BbJJMkA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: nKbOfoyguY0QE_DOW7elpS5I8Nz3UCCL
X-Proofpoint-ORIG-GUID: nKbOfoyguY0QE_DOW7elpS5I8Nz3UCCL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfX865KJCZzf+Hu
 ar0uHRa4BDEtYIXhArNuKAo20vEYqJ/1gw4oZXz2bDJ42Ghdk9XTHKyYmSjkqL2ZfQYawtQZpZA
 zx3cSMaTlpR43NOp+YTSfUZShkdB7jXWJUiwyZdx+TUyYbCmq6NfyNKgtGkI5nYciz/FiPbsFQT
 c6+Y3nMfeImhDMrkR5n5ksuco7uJChafw2U7vHKc79AVO7qrp/0KopXBX4dH7YDgCVsgMKeeEAn
 JsyU5gzkoT7FKb5L5ccjVwDgnX99DcofXtecYzb3pGxMnB0Vz9CMJVT9pmgNmoOiFt4cVOHFlz6
 TlK107Q8qrgOXtOenq1Vo/gTCG/8lrbfq/jlc4Xq+saaHDNseRv8+h9flqS0plULx7IT+jqyYB1
 3x8Z1JKIU5UEIJ/5jXmkvbMVMNh2PVZL1PRtDbmY2Q5AdK42oWQnmhJEEo1lQoB+ZPU6f2AY8Gy
 iL7pvfriBSWxubqSvow==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfX9p0RlWsfyMwZ
 x8gKvl+j193uTy16EZETCODaSZhI45A3tNByoddoJrGsu0qxNYOXD+BBL/9LDEVfc/hi5J5VbAf
 lVJwT2CSGJbmbiD7I37OwIodkQ6LfSM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120033

Implement the MHI controller configuration for QCN9575.

Add ath12k_wifi8_mhi_config_qcn9575 with IPCR channels 20 and 21 and
control and data event rings in wifi8/mhi.c, and export it through
wifi8/mhi.h. Update the QCN9575 hw params entry to use
ath12k_wifi8_mhi_config_qcn9575. Build wifi8/mhi.c from wifi8/Makefile.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi8/Makefile |  1 +
 drivers/net/wireless/ath/ath12k/wifi8/hw.c     |  3 +-
 drivers/net/wireless/ath/ath12k/wifi8/mhi.c    | 70 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi8/mhi.h    | 10 ++++
 4 files changed, 83 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi8/Makefile b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
index b1b90c109c76..051c6447d35c 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/Makefile
+++ b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
@@ -4,4 +4,5 @@ ath12k_wifi8-y += core.o \
 		  hal.o \
 		  hal_qcn9575.o \
 		  hw.o \
+		  mhi.o \
 		  pci.o
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hw.c b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
index bffd1081fd2f..428d6b2b4418 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
@@ -13,6 +13,7 @@
 #include "../mhi.h"
 #include "hal.h"
 #include "hw.h"
+#include "mhi.h"
 
 static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
 	{
@@ -64,7 +65,7 @@ static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
 		.num_tcl_banks = 0,
 		.max_tx_ring = 0,
 
-		.mhi_config = NULL,
+		.mhi_config = &ath12k_wifi8_mhi_config_qcn9575,
 
 		.wmi_init = NULL,
 
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/mhi.c b/drivers/net/wireless/ath/ath12k/wifi8/mhi.c
new file mode 100644
index 000000000000..04eb1f1650c3
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/mhi.c
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: BSD-3-Clause-Clear
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include "../mhi.h"
+#include "mhi.h"
+
+static const struct mhi_channel_config ath12k_wifi8_mhi_channels_qcn9575[] = {
+	{
+		.num = 20,
+		.name = "IPCR",
+		.num_elements = 32,
+		.event_ring = 1,
+		.dir = DMA_TO_DEVICE,
+		.ee_mask = 0x4,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+	},
+	{
+		.num = 21,
+		.name = "IPCR",
+		.num_elements = 32,
+		.event_ring = 1,
+		.dir = DMA_FROM_DEVICE,
+		.ee_mask = 0x4,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+	},
+};
+
+static struct mhi_event_config ath12k_wifi8_mhi_events_qcn9575[] = {
+	{
+		.num_elements = 32,
+		.irq_moderation_ms = 0,
+		.irq = 1,
+		.data_type = MHI_ER_CTRL,
+		.mode = MHI_DB_BRST_DISABLE,
+		.hardware_event = false,
+		.client_managed = false,
+		.offload_channel = false,
+	},
+	{
+		.num_elements = 256,
+		.irq_moderation_ms = 1,
+		.irq = 2,
+		.mode = MHI_DB_BRST_DISABLE,
+		.priority = 1,
+		.hardware_event = false,
+		.client_managed = false,
+		.offload_channel = false,
+	},
+};
+
+const struct mhi_controller_config ath12k_wifi8_mhi_config_qcn9575 = {
+	.max_channels = 30,
+	.timeout_ms = 10000,
+	.use_bounce_buf = false,
+	.buf_len = 0,
+	.num_channels = ARRAY_SIZE(ath12k_wifi8_mhi_channels_qcn9575),
+	.ch_cfg = ath12k_wifi8_mhi_channels_qcn9575,
+	.num_events = ARRAY_SIZE(ath12k_wifi8_mhi_events_qcn9575),
+	.event_cfg = ath12k_wifi8_mhi_events_qcn9575,
+};
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/mhi.h b/drivers/net/wireless/ath/ath12k/wifi8/mhi.h
new file mode 100644
index 000000000000..7a229ea378d2
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/mhi.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _ATH12K_WIFI8_MHI_H
+#define _ATH12K_WIFI8_MHI_H
+
+extern const struct mhi_controller_config ath12k_wifi8_mhi_config_qcn9575;
+#endif /* _ATH12K_WIFI8_MHI_H */

-- 
2.34.1

