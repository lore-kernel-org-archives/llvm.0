Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795538680;
	b=11lvpZ+NPIsePUuvAU5kqOYuRttCmMNHvDRkbryAenr+8nQxOyQZQPlzm1lqO/q8lYyX
	 bfkSF+3jUb4RALonryRfOpD102UBAvmTHQLKKOHA/Cj7xth+EfLBRt1VO4VgpBkFW7Hgz
	 4+UUnWVdWUgcUinc0YmkKrK3Wt4YaOfqa5DZbYfw+e/YXQxqh9MWEgSehNCbfWCNutEwR
	 zSwBIG6fxoNyqGN+FTsA7amURtr7yv/Ko7pDhBjZpp5ubvLIqXXM+M1Jm7/iaidD5Ozf3
	 VmvCMPAJw9dwCISU+nirqKKH44s3zNFRSeuNjW2dP1Mnl2RhqgsZeNPW91fbw6qmPpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538680;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gx/W6tXP2KdrCc0CO/VXLdzUUudIbq1I1EKN4P81bA4=;
	b=yD6qak5tNnQo0St8GBBikoSe70S7izX7WUwAm4pYv+X3iBOfO7ifb3CTanwghdOthPhh
	 is21JKJtELII+ZEYkBZczbX2BtMDwXa6F46TdeiegE4T/+iHT7VWXn1CRgeWXjF4jABoY
	 I3aqn8W3MJhjMY7Fs5mkoSsMyylT5OjBDjj/JZOwM+SM5EB4qPlGLI4Sao1neSG4JQZsw
	 AQG6FjftVBgXCiNWdMBHf/ZDgyJegtksa8X4uuocYB1hLafXIjWj7vGUSUG1GJbAqqshh
	 t7SxGORmy1SGdrkkFzFM8hoU+GQoGBXHFr1ENNQPjJCE/Am1FdW/BTO5jsTuotxJ30w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PqV0EkHY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TS3aaPrM;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9E7606A323
	for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 16:44:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D9E7606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PqV0EkHY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TS3aaPrM
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFLJJR3267071
	for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 16:44:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gx/W6tXP2KdrCc0CO/VXLdzUUudIbq1I1EKN4P81bA4=; b=PqV0EkHYogXdhnHT
	AMpAdHDUXoutgpJcFFDj/H/HBwszQ/DuWwkZhOf8eXhnTAOQ1/LFKiNIg2Rh7vcj
	u5gpjtLcSjSa3/g5rVwBKmSqBLFH4B+v2T50OKvXrq6rtfvyL+UTVJzsBc0tOzRH
	vfYfk5cWC8Eo+ZW7X/pzW0kghOCEdFNTnRiLJSGBsL6JPPFZ6EJFOaoGYR5oQSKO
	3QBVFge19Mtx6CZbZLoSCFQ6+2LJCvMMfeku1bWgV9FwlY7HHng6tCHP7pxpNBvB
	dcONGAXd/Eses1gvWouu/rxQu8O1gB5bviTu+ayoyS7o6TuirSonfofRqtqlpoBh
	G7pLCg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5ad7s7tx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 16:44:39 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-384c78aa0dbso6595416eec.0
        for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 08:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795538678; x=1796143478; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gx/W6tXP2KdrCc0CO/VXLdzUUudIbq1I1EKN4P81bA4=;
        b=TS3aaPrMZQU6PlmRbt20FRIQWS5vTdDtd9QYOCD6kuoMDSbv1Z+aYonp/Wy0A5/Ttf
         tF2Wf+ljR4RWIfnWXpCudty7sfE/QvNrzVph2AyOQmBwUfBwslUy/LxdIolnCi4pOjFI
         N+I/etDOwshyEJ71WsEIlNDfUt40xW207b1/Am5Vdst1FJCGpI5YPPyfRUmelOoxjVdU
         meJIXfYL4I9kdiqWFEgeSlG0hxFSw5ZqefzU24OMHgMYzF7JXASBafQZi7e8DWhmV2CI
         Att3fVyOYVR8bu2QuRa5qn0qdjGC5ml5zbpJ0mgtWsgUebsrrdNN0nvnIE6W+6Cwt59D
         RexA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795538678; x=1796143478;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gx/W6tXP2KdrCc0CO/VXLdzUUudIbq1I1EKN4P81bA4=;
        b=P0Glvdw8WmC0xOhSVjSBeql5AS+0L9v7uEb/lFQXcwh8nBrTeh5scLi3Vx8M6mC2BY
         CPFKFJRM9gpx6tUtDyJk+k9YDKYzjwlCN8hKAmOCNKT3HKZn7XVds6jOil7x/r1QEolL
         d3C7TZmBZTAY6rSpJ3yK9vfjzZR57J2quQS1KwDYvALxuZ6lssismcKdDHkrmYhlKmyW
         4URGpuejPP3WuNskDoR9lq5Z7MxgSfuFbAlCEN4jT5CIa5mPaybaro4ZSguGJL1euexp
         2moBh9lgms/u+DAS6GHIBgvIdVIwJ4KCgV2u5bf56urRoUoK9FQLhg92++i6SyGLrDDV
         jQMg==
X-Forwarded-Encrypted: i=1; AL+hErFh8Nsh/ryWOPC7KNgq/qyra1vtr4W7IfsMr6Z8QY1/T9xv8kfdWzgfdyzAtnv8QtgNUy12@lists.linux.dev
X-Gm-Message-State: APuU4Z/GfrmSNJSnabmFJ/R1JL4SUJkKH9cbxLjoViYtGX8KvHqcO+gQ
	3NZEYHx/p7TutCHzgJA+Y14lvbcov/E+39P+4pdzE86kW7xK5wsZ47fVKdckKXWAZ3J6zn0mbWG
	dTisvcQ1K1I8idgkag5bEqopxNxdqAGJdZM4k+ysV7rx+F+E6+gNdykSL
X-Gm-Gg: AZFdTZekkyCefDzgqZStdfGHXnZYC7x7SEG/dNh1cGunacjM6skRWn5/XiJP8FAkHAf
	N1chgZ/Czdtl5iOrK5yU0Kq51hRcrvkJQk+MAInj8tZzslHNVRWgVinPDCLagi41+nKcEqIlhAk
	FLyQir82xlUtGKY7GL/gwxd7s8ZBmUdWJb1tTCQytGHFJTerYVUaJmbBI2HT6r2jGMndbYeW0dk
	wxxyANPiqkOa3EXZ9GwHYQlTx/w8pc1Prb+zYT++0gluJy0ARIlGDQkgNb3iRsETrDPK4EBCQJ0
	WucQj1uXkFruoLpux/2URPKvFmXps7uhmKn51B0uxQRjpESTNAgZrmBBiFfvrPwwDEQJ43AO02o
	UDzhmPCcY5vHJ+wzel0lTElmxHcX/eUbEQwVGNr8nEQwqEEC4vTcXD5AsqD3MFsw7rhNWlkyHjG
	Q1BO0I8mVh9AErk1KTXqQeRfAdTP4ydiOBxEVloKgl+6CgIkptTAZyH56lHO3Kt6YchR4EZePz4
	mM=
X-Received: by 2002:a05:7300:dd46:b0:385:7762:e1a3 with SMTP id 5a478bee46e88-3857762e729mr14780130eec.24.1795538678045;
        Tue, 24 Nov 2026 08:44:38 -0800 (PST)
X-Received: by 2002:a05:7300:dd46:b0:385:7762:e1a3 with SMTP id 5a478bee46e88-3857762e729mr14780097eec.24.1795538677370;
        Tue, 24 Nov 2026 08:44:37 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm49093900eec.22.2026.11.24.08.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:44:37 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 22:13:38 +0530
Subject: [PATCH ath-next v4 12/14] wifi: ath12k: add Wi-Fi 8 hw ops for
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
Message-Id: <20261124-wifi8_qcn9575_bringup-v4-12-1f5b87ece6a3@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfX6ZD/lJc/iJ9V
 K3BB28e8xrlpnTLdcJNF6VQ6t08CYY1M/+gGWjPMf+stGhp1IxDf+tLFeltfTnrOswDDuUIFeGH
 67Vikn0fZ6MPbja5Qx2ivoxQLkOF2YQ=
X-Authority-Analysis: v=2.4 cv=cI51IVeN c=1 sm=1 tr=0 ts=6b05bef7 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=L9wxWISAF5v3VASzmuUA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfX7pFhb5mpstjy
 4HSKSIEHkPk/z6jW4bKmDbKLlPFlLjEFqVcfPJGcQ+BOUikwqtDilI7SzIf6XHSEd9Ws3pP7DMg
 NSOkCiGcmJxeD6TTsv70JzK4/oCrjS3RobPiZY2cdi52OGKHHp9AAlezkqcgjA7ac5whou/0981
 A+uPFZ4a+XPc0SpbNyUGsr6ISHheWwLzUNSLZQeo8ZOyxZmBHkH4ZJ9yBENFy9UjbP/RPftB4F9
 3hWYa1p4XVdWKuaQERXnNRi1XQ5bHgnKwqmOJ5cB6iDaPW5r23DNHcpqQwl+sbIuGc8S2L1UCaP
 mck9Ixpar3Xw03NrqlQWeUSezRFlDYbO39NCXpLxyV+bSYULidyZdZWbTmPU6B7bTMwdkUlex/V
 ADNFVGHeERKf01/lPuYU8PJSE1QTpbm1GAlhA/3Ta+cmC5UaCxdfPs8yeyZoWHuqgVT/J0/8hwC
 /4oJpQ/mrGhmUWcOP6w==
X-Proofpoint-ORIG-GUID: wnbFnJGhSEyvobAgV2O8x_XWwoKw941J
X-Proofpoint-GUID: wnbFnJGhSEyvobAgV2O8x_XWwoKw941J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240065

Implement hw_ops for QCN9575.

Add QCN9575 hw_ops (qcn9575_ops) in wifi8/hw.c implementing pdev/mac ID
mapping, srng ID lookup, and TX ring selector callbacks. Update the
QCN9575 hw params entry to use qcn9575_ops.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi8/hw.c | 38 +++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hw.c b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
index 74873fc5f3f3..92c897de16f4 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
@@ -18,6 +18,42 @@
 #include "mhi.h"
 #include "wmi.h"
 
+static u8 ath12k_wifi8_hw_qcn9575_mac_from_pdev_id(int pdev_idx)
+{
+	return pdev_idx;
+}
+
+static int
+ath12k_wifi8_hw_mac_id_to_pdev_id_qcn9575(const struct ath12k_hw_params *hw,
+					  int mac_id)
+{
+	return mac_id;
+}
+
+static int
+ath12k_wifi8_hw_mac_id_to_srng_id_qcn9575(const struct ath12k_hw_params *hw,
+					  int mac_id)
+{
+	/*
+	 * TODO: QCN9575 supports 2 radios (max_radios = 2). This currently
+	 * maps both radios to srng 0; per-radio srng mapping will be wired
+	 * in by an upcoming DP patch.
+	 */
+	return 0;
+}
+
+static u8 ath12k_wifi8_hw_get_ring_selector_qcn9575(struct sk_buff *skb)
+{
+	return smp_processor_id();
+}
+
+static const struct ath12k_hw_ops qcn9575_ops = {
+	.get_hw_mac_from_pdev_id = ath12k_wifi8_hw_qcn9575_mac_from_pdev_id,
+	.mac_id_to_pdev_id = ath12k_wifi8_hw_mac_id_to_pdev_id_qcn9575,
+	.mac_id_to_srng_id = ath12k_wifi8_hw_mac_id_to_srng_id_qcn9575,
+	.get_ring_selector = ath12k_wifi8_hw_get_ring_selector_qcn9575,
+};
+
 static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
 	{
 		.name = "qcn9575 hw2.0",
@@ -37,7 +73,7 @@ static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
 		.qmi_max_chunk_size = SZ_2M,
 		.internal_sleep_clock = false,
 
-		.hw_ops = NULL,
+		.hw_ops = &qcn9575_ops,
 		.ring_mask = NULL,
 
 		.host_ce_config = ath12k_wifi8_host_ce_config_qcn9575,

-- 
2.34.1

