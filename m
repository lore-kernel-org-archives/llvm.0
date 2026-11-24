Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795538690;
	b=tvX2F08Eq570RzDaYtCLMLJXlT0ecJqW519BH5bEFpDxVigdER7wckbQEqV5lqmJf3ij
	 Y3T53mL1H3z1wZuZm4sjgsiCF9JK6NBLhTzl+cOpu8ovNmn1OAzcumJg4tJtdkLpnmj22
	 0LtXNtMIh4+WThE2q60+OA1wOYnOx1nZxsgqSXZlz/iaH/yCDUEOoNs5QRZjbEYiBZke3
	 BAbNE8AbudTSmMAJTD/EkOs27fk7wpz4DYxns6FxPx9MqtUiGJVdJxw3vITrQxLtPB/Cl
	 vcI8T7aZRH9aF/7LvUA2wxXPBqSGI7NY0Rzckcg98DepPHm6G+1ii1thlE0Er3mLTQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538690;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qGHk1lKx9fhpkROokS8msd5mQrKtp8s2wwpEU0HQOUY=;
	b=Da0aj29z3+RNL4gFfd34jUYI9Q3yOvP4ynT4HYxhMqYRv7yD6/Sdj8klC2GEpWqtifpy
	 TXyUDYqgvQn5s7e4cnpDZmlJS7lRs8z6oLoerl985S5DpY09P70Hd7zey89AHjijiWiJX
	 DbQO9bYAN4inzdNzSBsfdSXgBxArU45oxi8QSXZUnUmU7nPxcQNSQ9s+VeSXCCF6TDjZ3
	 yzYYwbZhR0zuSTKlQXRaHsZW0k5zKOCCiwfrqnnYyv+mSmc3QWmVIhSm9Wgu1b98OUZYY
	 sB5DPrt5v6UW2XTmCX/b4K39LArEHQT3rG2BOc0SBfq7UWlRPVxQqn20p+TH2BE+5dQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=opwQzPZD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XwiDgdiT;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A6D606A31E
	for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 16:44:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07A6D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=opwQzPZD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XwiDgdiT
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFL58w2317959
	for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 16:44:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qGHk1lKx9fhpkROokS8msd5mQrKtp8s2wwpEU0HQOUY=; b=opwQzPZDOqWR/SpD
	fixUCb010P/cGk3E2Ehy7xPkSPSy9UN2v30t4/jYBs1GzomV3O85UZR5taR/3BfD
	Bc5IBM7gWsB+LADxCUgY43ND45C2lViqB8oauIiH9RskI0NGBdzKPK+uJOxJUFWY
	6BF0xiqxit3Rzm8RZPhni9Qa79uUHzquVhXtzXUdKfj5WnOpg3WFuS9slbUSYd/Y
	7tyPXRCYbR3qh/PwVvc3sERMA0rSZENB2puAEAmLA8MBODTKbzOkIbAZD0zZgg+7
	SXV6voWsk9KcpiUPV3S0QFH4eexz96TOIAdo3fH8VGJY6fmq/WT05KmYrxAT+iNu
	2JrIIw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yvd3vrc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 16:44:49 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-375bac6bd21so5177862eec.0
        for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 08:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795538688; x=1796143488; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qGHk1lKx9fhpkROokS8msd5mQrKtp8s2wwpEU0HQOUY=;
        b=XwiDgdiTDtqLjnS6AcNBh3JbJ3VOV1sRDzVdWqSiPVv0lyX4pjwvSr8aCBfB/TWFDo
         NhrTK+0l00jOJ7qtDlyXxB468EoZV3FZ1b+t6elJvss4iFYvFg9JpcWCm0G2xJ+4Oo2s
         S1BuZY8qdeTpfq+KnRM9DHJXhsdVqkXXgiAp3Kz6j3uQnMjTFj4+RypyfJl3P7z8wkt+
         4G1xRRPiDarqPrAkpkcNKCOen7wJF1xz72HlWCNeMLQPOSCzp9+PQ9UVbtMMd5rWphYt
         LEidbJzY7UDFWUsnPqCCK8FzxQxVqwOBGwZJy51nJa7Pjz6fNsxtnsntDA+UpKsLawv8
         IP4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795538688; x=1796143488;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qGHk1lKx9fhpkROokS8msd5mQrKtp8s2wwpEU0HQOUY=;
        b=0DAItbDn7QfEgywpFmGuz6zP582hWYIUCvPclG/2s33UFAWZ/ZAwkq1/eb7PSSBVMW
         KwNvFTJmZOmskLIb9ZV61xrEIriwn8x2YOIA5NvmPLqY1uiJsz/MlPpF3DeF7tD01z4G
         TuS8YVADvqzLZkQjCFwIXtT/yMxZJBGwza9bxUT8jTAsVDf/hwcB1y6pYjlXiVrg0MfB
         vVKN5tsIJsbgeXDpwnANdlCdqhwP2GOJtgQ+Kzovi1+aKkTVNLt/Wh4g2UsVRFmzplN6
         /+btDNVezfax6XWGPgq5B7Lw10pHhAXyrirVboe749bWAV+dN2/lUfSeTkhtZrzmW7vY
         ehQA==
X-Forwarded-Encrypted: i=1; AL+hErE+eS2DSiLdTmPIsaUnXtOKENbA557fNI3a/BcLVIqeAXb8A4SXvbOngMU7Ovjhal/Fz6IQ@lists.linux.dev
X-Gm-Message-State: APuU4Z/Alo55mi34a1TfsVtIU6ndiP75whFuw06zlFtdVemMpd74rdgE
	JWGgxbHETG7Ww49q4LiIHSn9Tn6dZ2eSq8GVN9Ua9GkO9FK2DsCX40fsYD7k/TVNjurZIXjAQJv
	iVju34ebYvKhasIRmhtSBSngFnHO6qNUT/YjPTyFpzTEKHA5cxIprN83A
X-Gm-Gg: AZFdTZfh6CdiC5s9g6btyijzTCjeAkR4ZjjnHHdLa2cBqJxBNV9QQ5D8lNctR1zo5s5
	mqYYnpEEN0cWGp+HWpKOFcgOc5/vWcRy3rE9Lw9Ws6teyuOb4IClc//KWk6BQdFgtizfF3xG6OW
	m+AGyaQPGR7H97/fte++8o5Y5y1pefQn0jtnEX1+rt2Nf/0UjSwtoFoQ4MQc9sdVBApWgjDRmZo
	EJshZe06FVT89s40nREstJEm8DLs7aDHPxTHQ/pImUpc2N6RtNbu6n9KxR/2HW8WKR/1/WlaSHp
	0UbPBw3tHQiqgHXSfmmZDgYZ35tusFxUVJEK6sbgKYqmWHDRqgJeVlCSpMY1oeRWHwhYcHOrWGl
	Fpl5TSmFtZuHvdV1s79qdVbdQBRfG/4LyhyIAqDJFEGDxMrw0DxKJaBe0AUdkI9qEbX00acHrTj
	SBkj7s6ipLN/Dux+wInuV8rnw4psT0bJ1JPI/5bdrp0+X28y87hqf62Glz3yf57oEJYDxwkyTWw
	Jo=
X-Received: by 2002:a05:7301:b8c:b0:36a:2f6c:490e with SMTP id 5a478bee46e88-384b3986ef2mr18432274eec.6.1795538687980;
        Tue, 24 Nov 2026 08:44:47 -0800 (PST)
X-Received: by 2002:a05:7301:b8c:b0:36a:2f6c:490e with SMTP id 5a478bee46e88-384b3986ef2mr18432231eec.6.1795538687388;
        Tue, 24 Nov 2026 08:44:47 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm49093900eec.22.2026.11.24.08.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:44:47 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 22:13:40 +0530
Subject: [PATCH ath-next v4 14/14] wifi: ath12k: add Wi-Fi 8 PCI driver
 scaffolding for QCN9575
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
Message-Id: <20261124-wifi8_qcn9575_bringup-v4-14-1f5b87ece6a3@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=ZYeIpcVA c=1 sm=1 tr=0 ts=6b05bf01 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Yi4xBBFUvw6BgwE4oHQA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfX3dNkqQCHFekf
 ENdXNhzwf17IqAnmFZtkR+XqDMpkHDfpEutQYAagOCoCVtrHxZM5ZYByGwTMkcPmwOotrHuAPMo
 Eha6/bzWiGTvJSYwWUJ6dIj9rdV2kZZ+c00cXVuxaT92X6yfpbxONjhyY8SSC0stRSQfMT4a4rv
 Kb2p3vXckirkqiSRogrlcxIVD0Cg4e6YpxDUxzHhRoGze6QUo8w825kdJuO7TX/Equ+adWhe1qY
 5j98s64rTXyl9FwmWu5bg437ykwT/igCGwWDvq9/zIhq80R/bgvXF01j1H/67sasmq2Ue4EPHzA
 TTJuMMlrWN7huu3SdACHlVST8djMJSk3iqfQRAwYSD4vF66DFkWJRg5nsUFoMfgj5ICFkfBxVhc
 14pIhBUXO4cvTBdFfJcZcT5O8ECI9RFTV3TuBDEi/5M0nP69XSwtXCIARl7jvR4v2sEjXlMphqh
 IZzhYB6zHXS9A4Mii9w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfXzSG/Rrr2asdb
 m1qjYPe6S+dh6gxeHcWPZrTTkhRtZXu8muK30NUD19MQCOMgTTil1Ixfruxv9o38BliHfiumIzC
 GW45ttRTihCjN5N1qX3qH7TUVrtatsw=
X-Proofpoint-ORIG-GUID: q9QN71eHfGTxUT543BLwwO8a1xL3VLoC
X-Proofpoint-GUID: q9QN71eHfGTxUT543BLwwO8a1xL3VLoC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240065

Add QCN9575 PCI window register constants (WINDOW_VALUE_MASK [25:19],
WINDOW_STATIC_MASK [31:7], CE_WINDOW_MASK [13:7], UMAC_WINDOW_MASK
[20:14]) and a Wi-Fi 8 reg_base instance (ath12k_wifi8_reg_base) for
per-device window selection. Implement ath12k_wifi8_pci_probe() to
configure QCN9575-specific PCI settings: MSI vector layout (3 MHI, 5 CE,
8 DP vectors), static window mapping, window register address (0x3278),
and hardware revision. Call ath12k_wifi8_hw_init() at the end of probe
to complete hardware initialization. Define the Wi-Fi 8 PCI driver
struct with the probe callback, and register it with
ath12k_pci_register_driver() in ath12k_wifi8_pci_init().

This series only adds Wi-Fi 8 platform scaffolding; QCN9575's CP, DP,
and MAC datapath support will be posted as a follow-up series.
QCN9575_DEVICE_ID is intentionally left out of
ath12k_wifi8_pci_id_table for now, so no physical device can match and
probe until that follow-up series lands. The id_table entry will be
added in the final patch of that series, once QCN9575 is actually
functional.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/hal.h       |  2 +
 drivers/net/wireless/ath/ath12k/wifi7/hal.h |  2 -
 drivers/net/wireless/ath/ath12k/wifi8/hal.h |  1 +
 drivers/net/wireless/ath/ath12k/wifi8/pci.c | 89 ++++++++++++++++++++++++++++-
 4 files changed, 91 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/hal.h b/drivers/net/wireless/ath/ath12k/hal.h
index 9e88bdf4a93b..b30a8039b2ec 100644
--- a/drivers/net/wireless/ath/ath12k/hal.h
+++ b/drivers/net/wireless/ath/ath12k/hal.h
@@ -11,6 +11,8 @@
 
 struct ath12k_base;
 
+#define HAL_CE_WFSS_CE_REG_BASE			0x01b80000
+
 #define HAL_DESC_REO_NON_QOS_TID	16
 
 #define HAL_INVALID_PEERID	0x3fff
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal.h b/drivers/net/wireless/ath/ath12k/wifi7/hal.h
index 19e02bb16ff2..fe880b0befcb 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal.h
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal.h
@@ -31,8 +31,6 @@
 	((hal)->regs->umac_ce1_dest_reg_base)
 #define HAL_SEQ_WCSS_UMAC_WBM_REG		0x00a34000
 
-#define HAL_CE_WFSS_CE_REG_BASE			0x01b80000
-
 #define HAL_TCL_SW_CONFIG_BANK_ADDR		0x00a4408c
 
 /* SW2TCL(x) R0 ring configuration address */
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hal.h b/drivers/net/wireless/ath/ath12k/wifi8/hal.h
index c99521abdcb3..89fa9a7f3fd9 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hal.h
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hal.h
@@ -11,6 +11,7 @@
 #include "hal_desc.h"
 
 /* WCSS Relative address */
+#define HAL_SEQ_WCSS_UMAC_OFFSET		0xf00000
 #define HAL_SEQ_WCSS_UMAC_CE0_SRC_REG(hal) \
 	((hal)->regs->umac_ce0_src_reg_base)
 #define HAL_SEQ_WCSS_UMAC_CE0_DST_REG(hal) \
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/pci.c b/drivers/net/wireless/ath/ath12k/wifi8/pci.c
index 3975081d167b..fd0489f8333f 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/pci.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/pci.c
@@ -5,14 +5,101 @@
 
 #include <linux/pci.h>
 
+#include "../core.h"
+#include "../hal.h"
+#include "../hif.h"
+#include "../mhi.h"
+#include "../pci.h"
+#include "hal.h"
+#include "hw.h"
+#include "mhi.h"
 #include "pci.h"
 
+#define QCN9575_DEVICE_ID		0x1113
+#define WINDOW_REG_ADDRESS		0x3278
+
+#define WINDOW_VALUE_MASK		GENMASK(25, 19)
+#define WINDOW_STATIC_MASK		GENMASK(31, 7)
+#define CE_WINDOW_MASK			GENMASK(13, 7)
+#define UMAC_WINDOW_MASK		GENMASK(20, 14)
+
+static const struct pci_device_id ath12k_wifi8_pci_id_table[] = {
+	{}
+};
+
+MODULE_DEVICE_TABLE(pci, ath12k_wifi8_pci_id_table);
+
+static const struct ath12k_pci_ops ath12k_wifi8_pci_ops_qcn9575 = {
+	.wakeup = NULL,
+	.release = NULL,
+};
+
+static int ath12k_wifi8_pci_probe(struct pci_dev *pdev,
+				  const struct pci_device_id *pci_dev)
+{
+	struct ath12k_pci *ab_pci;
+	struct ath12k_base *ab;
+	int ret;
+
+	ab = pci_get_drvdata(pdev);
+	ab_pci = ath12k_pci_priv(ab);
+
+	switch (pci_dev->device) {
+	case QCN9575_DEVICE_ID:
+		ab->msi.config = &ath12k_msi_config[ATH12K_MSI_CONFIG_PCI];
+		ab->static_window_map = true;
+		ab_pci->pci_ops = &ath12k_wifi8_pci_ops_qcn9575;
+		ab_pci->window_reg_addr = WINDOW_REG_ADDRESS;
+		ab->hw_rev = ATH12K_HW_QCN9575_HW20;
+		ab->target_mem_mode = ath12k_core_get_memory_mode(ab);
+		break;
+
+	default:
+		dev_err(&pdev->dev, "Unknown Wi-Fi 8 PCI device found: 0x%x\n",
+			pci_dev->device);
+		return -EOPNOTSUPP;
+	}
+
+	ret = ath12k_wifi8_hw_init(ab);
+	if (ret) {
+		dev_err(&pdev->dev, "Wi-Fi 8 hw_init failed: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct ath12k_pci_reg_base ath12k_wifi8_reg_base = {
+	.umac_base = HAL_SEQ_WCSS_UMAC_OFFSET,
+	.ce_reg_base = HAL_CE_WFSS_CE_REG_BASE,
+	.window_value_mask = WINDOW_VALUE_MASK,
+	.window_static_mask = WINDOW_STATIC_MASK,
+	.ce_window_mask = CE_WINDOW_MASK,
+	.umac_window_mask = UMAC_WINDOW_MASK,
+};
+
+static struct ath12k_pci_driver ath12k_wifi8_pci_driver = {
+	.name = "ath12k_wifi8_pci",
+	.id_table = ath12k_wifi8_pci_id_table,
+	.ops.probe = ath12k_wifi8_pci_probe,
+	.reg_base = &ath12k_wifi8_reg_base,
+};
+
 int ath12k_wifi8_pci_init(void)
 {
-	/* Wi-Fi 8 PCI driver registration will be added in follow-up patches. */
+	int ret;
+
+	ret = ath12k_pci_register_driver(ATH12K_DEVICE_FAMILY_WIFI8,
+					 &ath12k_wifi8_pci_driver);
+	if (ret) {
+		pr_err("Failed to register ath12k Wi-Fi 8 driver: %d\n", ret);
+		return ret;
+	}
+
 	return 0;
 }
 
 void ath12k_wifi8_pci_exit(void)
 {
+	ath12k_pci_unregister_driver(ATH12K_DEVICE_FAMILY_WIFI8);
 }

-- 
2.34.1

