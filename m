Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989750;
	b=pi95z3c8X6NMtSqXEZ6xDTGa3sfG/llBWDXvkc1JmmHvn22BKNedNYYhEjeOTE1EJStL
	 7FXyA2WfpjvSDr1Uz0XisA/vfJ+z6NeXZioC0pdi+hGrZCNgiO7kNpU7QMPH3AUS+Foo4
	 FprEvQt2R3bxI9M5YBs3KjSfqZtYQIq34riSY43PpG4NApfaeNL8E6uyYB6+PawCQf4UP
	 CBJLJI7kXTyb3EQi4P6rAh9aROep+dgTphv3iI3l3GgwJgd9rUjxZVaB/NEvDFTGM6UaE
	 288pHQv5uMRk1sAjf88YUTgpHcJMZEc/Z15HXS3tzYgu0kll1vF23iJfDu+rz1es+FQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989750;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=PaAkSJGfWdT/hF3hWrkH4vMfAFvDljyPIoDVUO8O8Zk=;
	b=1PNIdjkq8JibkDxgh4UAQonW2aiJTGZPkN0/a89Ohhi2ro3mwWHeDze8VTaLy41vsCsR
	 vFKgZd4OoJrmiZ8EXvrHNZrXRZEXpAlwsyV6/646F5r5VPUi/OrPTl+WDZF3QDM0PxlJq
	 oqQ4GLbU6B7M1YVImLF/AsQn7/SfUcUNEqDFT5eAqW1kLp9krRcrLTwHj2daAPhm6BDDA
	 XU09WiGf0naNIYAbH6LNdy6rIld3S4tM3GMFgXPEnOAEDPbx5Ad7Y+Ij8rnhYv/24+Kkw
	 Fo5tMNWA+7OiMhkXeM28vzfCBmy/j3DGZKIBOzbCQWABjEDRwggM33paqzAZ7tqkeQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ml+RePVo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K0JrN6+R;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DDB6606A32A
	for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 08:15:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DDB6606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ml+RePVo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K0JrN6+R
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UmcV3371238
	for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 08:15:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PaAkSJGfWdT/hF3hWrkH4vMfAFvDljyPIoDVUO8O8Zk=; b=ml+RePVonYQFjHt/
	usc0/iXnHpyMG76Sf/AdjmWw/6k79/DT4pY9D4C/86CmdRdvNiCYXkXzn8iJL3d8
	VAkgrG3Sa0PeC/TdkaOoVjPY5jtxjY0gYcFoyQ+7UCEPMuJkhQPtW++c8hLusMiC
	nvUXKxZxlUNq5UP7UzlMwlLkRai1M3L1IIBRencPgZeo4t3nkwy0bOV2Hux5WPYE
	h1bS+X/jza2s6AEQtHDGex/T1CTmZoL1pBJ+huZNbGEAat10bezUrKtbFZOJX+Iu
	YrximuoR3aA4A3OKrsMhb3IrKU4kSOT6FHczDm2Mn8Ifx466vhkRq2Pw+tcmK5lA
	YaHxqA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8syfd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 08:15:48 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b0a7cbf164so682944a91.3
        for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 00:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794989748; x=1795594548; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PaAkSJGfWdT/hF3hWrkH4vMfAFvDljyPIoDVUO8O8Zk=;
        b=K0JrN6+RtD5EZp3/CRt2GzPSzs358XaaGPaHLQIwyJ89x3njGL4ic6FlTQEFLXCIAC
         EvyxcASrTtsGCvhY7kBjdgbog88Qdjk12AgCwnBJwwWcjeMGbrSEghNgXUtb2PRZN2r1
         Wh4oHDhvj0tA/MlSn2DIGcklKup9QBm/oK3rL5Alq6zBhGKvJRLgFHm8AqYHJzD2hVCz
         0knoUEGQPYUgKOgTW9zHVlpjH/HiL6w9+o3b9MCmoxeW4aqAH/GAsNHai+RBEZ+DWC4+
         rDQ3rfHCNs3RlYiRWdNktpwSDtRpqBb5EgWvi1+8m3GO6cmI80aTPkHiZHhdBt+dZj/X
         Z8XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989748; x=1795594548;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PaAkSJGfWdT/hF3hWrkH4vMfAFvDljyPIoDVUO8O8Zk=;
        b=d9e9xvYUFYDt0BQfrIz9KJvKO9MdTkobil8+spPjF0le6iZP5lpteH3mc8DnMkNVFi
         Oh/WUlshTbi/6v3k8dNncBmXBFSqSZKFZy51lhn3iogS6GvXsDCiWSJZ4pi8fYcyoltv
         LPd5fxGifoq38pEzapzLbmARbOQD2ZLQ0SAIYTfgfbFDicsfHkmP8zC9ticVi8Xv4ynA
         vo2cmIzCl4ZsMRoHCVAyhZgBtcI1EFsQh2kTX1bR7ZvqQvls8yzTW3zBVQ5az3lDrqui
         UKu9GQsmX4LLgojSOezhABtpVdVi8d5vhOH6qxRKfgMTeaADR26OpaxZWdg6mvibdTX4
         +b4Q==
X-Forwarded-Encrypted: i=1; AL+hErFtn+fkhGnZTbn4Q7IVyD9q07X3b+Ut7t8u5Vu3jaw/NB4g66H1Lu22mzEv0gR77FZWUaqW@lists.linux.dev
X-Gm-Message-State: APuU4Z9OxI3DDNZBsfNqGxjU5rISISiskq+qkRloEkyU1zgasakZYXm7
	EIToWl4jYkAxKjrPfUpFoW/L4EPcX+gU0gkVx9uN4xgaD1jQCrOsewEqspvzsn5Q1iR3uIfosoT
	KLb6tVfc3M7+kjH6OoTb9XL5dY4KL8XGHhCU7vjSEimWswetmcD+hyoSF
X-Gm-Gg: AZFdTZf7HedwKT+8157prMwe5KNg6RTiHtedGCjCtQh6Zmshpa/1oDdgn0LaaNaIYm9
	lsprA4VuJ9vpZrig5n6KAs29o7l6ohmGkqjwtyDY6Eusu6q5Jp5HOW+sl4rNT9E9RaoSSGM5s4A
	XJxtROqfZmRlgoNTsttzO6+mqaImYHp4FCJ3d6Ph1kkDiiuzON2tj5uH9fOpdbsqfCudQ/WTgTW
	DVnJd4rACrxmgQ6HiC95tzJi7OIsFocyBbIIyn9xtV2Ifn6fiRHFJEzwQMlvjrAA800QKoRmMfm
	WY1qS6mN39NFJ558rLqQICTO7okkfZP40vGTk0KpWYSKP0/b+7f/tZOvAf3P8f5YSoVNBz0eBOE
	npC95hb4aZwOC0h4buVB06bYXgnAvT+gPbCOeJ2vc+MYgRJwUDh8NSofDVZ+AsWNbicryuqSGQI
	Gu8es/UqCUCIr/HZOL9i+egvs/N5OEOyBeS9QN6pn6VaQ6/OTM6oyyhSsYv4wdbuIhfh+LgRuZ1
	Q==
X-Received: by 2002:a17:90b:2684:b0:3ab:3384:1a44 with SMTP id 98e67ed59e1d1-3b3d07a24b9mr1919254a91.12.1794989747902;
        Wed, 18 Nov 2026 00:15:47 -0800 (PST)
X-Received: by 2002:a17:90b:2684:b0:3ab:3384:1a44 with SMTP id 98e67ed59e1d1-3b3d07a24b9mr1919219a91.12.1794989747325;
        Wed, 18 Nov 2026 00:15:47 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b5e8asm3369181a91.8.2026.11.18.00.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:15:46 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 13:45:26 +0530
Subject: [PATCH ath-next v3 03/15] wifi: ath12k: add extended QMI WLAN cfg
 for CE and service pipes
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
Message-Id: <20261118-wifi8_qcn9575_bringup-v3-3-9875d2a3953f@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Eu1HPicA c=1 sm=1 tr=0 ts=6afd5eb4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=z7nB0JqBhXvykku2dhgA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 3iOHfhW6zxhg9eaPFdye1oVY3YCUr_6_
X-Proofpoint-ORIG-GUID: 3iOHfhW6zxhg9eaPFdye1oVY3YCUr_6_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfX45GOSrIu5bcx
 oVzg1bbxPvzVuILVv/Htnx8BYs0qZ1cQUbjh/10NKYA6E0D1oDJUjte9PvnxtsiZ9IwkpUT6uDQ
 UXxZJhsKqkyzbdILVTWZCJBABO7pToXS/91YwVj2ZNTEe+Cn46PGfGHdtuqnl3aUBgTItk3rQyp
 N9WlVS5t3pWVHZpTGMsTVtV8lQDwtLSXmBHWlZ73YJjWeUU1pSDlO+dOU72lpTfkkDsJLOtPP0+
 I93EqUyAyjgPUBZmqdxdymSPVDpBKpBF0+VkxjEiLFcHX8qgLnFU+iCC5z3ulh+fqNCGnDIGc6k
 ta6egp95DLxUgeQb3wVuoangkeRWn7axvrm5YrI//MmrDrThElrZUJOs4iIsq96WK8UMwBLnMnC
 Ie6p6qZg3q0m7mqiIIxGTCWxI5jH696TE2vh7CXt2TeDCWCag8gDl6laCQnfs4vjlrirBN0V58o
 qe3+aQ674sCTgOB7tBg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfX6X+kiNPGQqvD
 9MqlksDjUFkpu7RZTfbJlk3MU6U3OwXjXJJrH45JPqm2XzDKElO9aiLmCUsfCpif09VA7KBN2cE
 /tTA70iVJgHFkDW30cSVj70akOxtYAI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180032

QMI_WLANFW_WLAN_CFG_REQ_V01 carries up to 12 CE entries and 24
service-to-CE mappings in its base arrays. QCN9575 requires 13 CE
pipes, one more than the base tgt_cfg array holds. The old code set
req->tgt_cfg_len to 13 and looped up to that count while filling
req->tgt_cfg[], writing one entry past the 12-element array into the
following svc_cfg_valid/svc_cfg_len fields before the request was ever
sent. qmi_send_request() then fails outright, since the QMI encoder
rejects a VAR_LEN_ARRAY whose length exceeds its declared elem_len
(12), so the WLAN config request never reaches firmware at all.

Firmware accepts overflow entries through ext_tgt_cfg (TLV 0x1A) and
ext_svc_cfg (TLV 0x1B) in the same WLAN config request. Add the
corresponding fields to qmi_wlanfw_wlan_cfg_req_msg_v01 and extend the
QMI element-info table to encode both TLVs, so service-to-CE mappings
can also overflow into the extended array if a future target requires
more than 24. When CE or service entries exceed the base array
limits, keep the first entries in the base arrays and place the
remainder in the extended arrays, clamped to their maximum sizes to
avoid out-of-bounds writes.

If the combined base and extended arrays still cannot hold all
configured entries, fail ath12k_qmi_wlanfw_wlan_cfg_send() with
-EINVAL up front, before any request is built or sent, rather than
silently dropping the extra entries. Update
QMI_WLANFW_WLAN_CFG_REQ_MSG_V01_MAX_LEN from 803 to 1835 to reflect
the larger message.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/qmi.c | 124 ++++++++++++++++++++++++++++++++--
 drivers/net/wireless/ath/ath12k/qmi.h |  12 +++-
 2 files changed, 131 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index 52a925fc44ee..69512b82aa3b 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -2018,6 +2018,62 @@ static const struct qmi_elem_info qmi_wlanfw_wlan_cfg_req_msg_v01_ei[] = {
 					   shadow_reg_v3),
 		.ei_array	= qmi_wlanfw_shadow_reg_v3_cfg_s_v01_ei,
 	},
+	{
+		.data_type	= QMI_OPT_FLAG,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x1A,
+		.offset		= offsetof(struct qmi_wlanfw_wlan_cfg_req_msg_v01,
+					   ext_tgt_cfg_valid),
+	},
+	{
+		.data_type	= QMI_DATA_LEN,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x1A,
+		.offset		= offsetof(struct qmi_wlanfw_wlan_cfg_req_msg_v01,
+					   ext_tgt_cfg_len),
+	},
+	{
+		.data_type	= QMI_STRUCT,
+		.elem_len	= QMI_WLANFW_MAX_EXT_NUM_CE_V01,
+		.elem_size	= sizeof(struct qmi_wlanfw_ce_tgt_pipe_cfg_s_v01),
+		.array_type	= VAR_LEN_ARRAY,
+		.tlv_type	= 0x1A,
+		.offset		= offsetof(struct qmi_wlanfw_wlan_cfg_req_msg_v01,
+					   ext_tgt_cfg),
+		.ei_array	= qmi_wlanfw_ce_tgt_pipe_cfg_s_v01_ei,
+	},
+	{
+		.data_type	= QMI_OPT_FLAG,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x1B,
+		.offset		= offsetof(struct qmi_wlanfw_wlan_cfg_req_msg_v01,
+					   ext_svc_cfg_valid),
+	},
+	{
+		.data_type	= QMI_DATA_LEN,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x1B,
+		.offset		= offsetof(struct qmi_wlanfw_wlan_cfg_req_msg_v01,
+					   ext_svc_cfg_len),
+	},
+	{
+		.data_type	= QMI_STRUCT,
+		.elem_len	= QMI_WLANFW_MAX_EXT_NUM_SVC_V01,
+		.elem_size	= sizeof(struct qmi_wlanfw_ce_svc_pipe_cfg_s_v01),
+		.array_type	= VAR_LEN_ARRAY,
+		.tlv_type	= 0x1B,
+		.offset		= offsetof(struct qmi_wlanfw_wlan_cfg_req_msg_v01,
+					   ext_svc_cfg),
+		.ei_array	= qmi_wlanfw_ce_svc_pipe_cfg_s_v01_ei,
+	},
 	{
 		.data_type	= QMI_EOTI,
 		.array_type	= NO_ARRAY,
@@ -3537,10 +3593,28 @@ static int ath12k_qmi_wlanfw_wlan_cfg_send(struct ath12k_base *ab)
 {
 	struct qmi_wlanfw_wlan_cfg_req_msg_v01 *req;
 	struct qmi_wlanfw_wlan_cfg_resp_msg_v01 resp = {};
+	int ret = 0, pipe_num, ext_pipe_num;
 	struct ce_pipe_config *ce_cfg;
 	struct service_to_pipe *svc_cfg;
 	struct qmi_txn txn;
-	int ret = 0, pipe_num;
+
+	if (ab->qmi.ce_cfg.tgt_ce_len >
+	    QMI_WLANFW_MAX_NUM_CE_V01 + QMI_WLANFW_MAX_EXT_NUM_CE_V01) {
+		ath12k_err(ab, "CE pipe config has %u entries, exceeds QMI capacity of %u\n",
+			   ab->qmi.ce_cfg.tgt_ce_len,
+			   QMI_WLANFW_MAX_NUM_CE_V01 +
+			   QMI_WLANFW_MAX_EXT_NUM_CE_V01);
+		return -EINVAL;
+	}
+
+	if (ab->qmi.ce_cfg.svc_to_ce_map_len >
+	    QMI_WLANFW_MAX_NUM_SVC_V01 + QMI_WLANFW_MAX_EXT_NUM_SVC_V01) {
+		ath12k_err(ab, "service map config has %u entries, exceeds QMI capacity of %u\n",
+			   ab->qmi.ce_cfg.svc_to_ce_map_len,
+			   QMI_WLANFW_MAX_NUM_SVC_V01 +
+			   QMI_WLANFW_MAX_EXT_NUM_SVC_V01);
+		return -EINVAL;
+	}
 
 	ce_cfg	= (struct ce_pipe_config *)ab->qmi.ce_cfg.tgt_ce;
 	svc_cfg	= (struct service_to_pipe *)ab->qmi.ce_cfg.svc_to_ce_map;
@@ -3555,8 +3629,17 @@ static int ath12k_qmi_wlanfw_wlan_cfg_send(struct ath12k_base *ab)
 
 	req->tgt_cfg_valid = 1;
 	/* This is number of CE configs */
-	req->tgt_cfg_len = ab->qmi.ce_cfg.tgt_ce_len;
-	for (pipe_num = 0; pipe_num < req->tgt_cfg_len ; pipe_num++) {
+	req->tgt_cfg_len = min_t(u32, ab->qmi.ce_cfg.tgt_ce_len,
+				 QMI_WLANFW_MAX_NUM_CE_V01);
+	if (ab->qmi.ce_cfg.tgt_ce_len > QMI_WLANFW_MAX_NUM_CE_V01) {
+		req->ext_tgt_cfg_valid = 1;
+		req->ext_tgt_cfg_len =
+			min_t(u32, ab->qmi.ce_cfg.tgt_ce_len -
+			      QMI_WLANFW_MAX_NUM_CE_V01,
+			      QMI_WLANFW_MAX_EXT_NUM_CE_V01);
+	}
+
+	for (pipe_num = 0; pipe_num < req->tgt_cfg_len; pipe_num++) {
 		req->tgt_cfg[pipe_num].pipe_num =
 			__le32_to_cpu(ce_cfg[pipe_num].pipenum);
 		req->tgt_cfg[pipe_num].pipe_dir =
@@ -3569,9 +3652,32 @@ static int ath12k_qmi_wlanfw_wlan_cfg_send(struct ath12k_base *ab)
 			__le32_to_cpu(ce_cfg[pipe_num].flags);
 	}
 
+	for (ext_pipe_num = 0; ext_pipe_num < req->ext_tgt_cfg_len; ext_pipe_num++) {
+		pipe_num = QMI_WLANFW_MAX_NUM_CE_V01 + ext_pipe_num;
+		req->ext_tgt_cfg[ext_pipe_num].pipe_num =
+			__le32_to_cpu(ce_cfg[pipe_num].pipenum);
+		req->ext_tgt_cfg[ext_pipe_num].pipe_dir =
+			__le32_to_cpu(ce_cfg[pipe_num].pipedir);
+		req->ext_tgt_cfg[ext_pipe_num].nentries =
+			__le32_to_cpu(ce_cfg[pipe_num].nentries);
+		req->ext_tgt_cfg[ext_pipe_num].nbytes_max =
+			__le32_to_cpu(ce_cfg[pipe_num].nbytes_max);
+		req->ext_tgt_cfg[ext_pipe_num].flags =
+			__le32_to_cpu(ce_cfg[pipe_num].flags);
+	}
+
 	req->svc_cfg_valid = 1;
 	/* This is number of Service/CE configs */
-	req->svc_cfg_len = ab->qmi.ce_cfg.svc_to_ce_map_len;
+	req->svc_cfg_len = min_t(u32, ab->qmi.ce_cfg.svc_to_ce_map_len,
+				 QMI_WLANFW_MAX_NUM_SVC_V01);
+	if (ab->qmi.ce_cfg.svc_to_ce_map_len > QMI_WLANFW_MAX_NUM_SVC_V01) {
+		req->ext_svc_cfg_valid = 1;
+		req->ext_svc_cfg_len =
+			min_t(u32, ab->qmi.ce_cfg.svc_to_ce_map_len -
+			      QMI_WLANFW_MAX_NUM_SVC_V01,
+			      QMI_WLANFW_MAX_EXT_NUM_SVC_V01);
+	}
+
 	for (pipe_num = 0; pipe_num < req->svc_cfg_len; pipe_num++) {
 		req->svc_cfg[pipe_num].service_id =
 			__le32_to_cpu(svc_cfg[pipe_num].service_id);
@@ -3581,6 +3687,16 @@ static int ath12k_qmi_wlanfw_wlan_cfg_send(struct ath12k_base *ab)
 			__le32_to_cpu(svc_cfg[pipe_num].pipenum);
 	}
 
+	for (ext_pipe_num = 0; ext_pipe_num < req->ext_svc_cfg_len; ext_pipe_num++) {
+		pipe_num = QMI_WLANFW_MAX_NUM_SVC_V01 + ext_pipe_num;
+		req->ext_svc_cfg[ext_pipe_num].service_id =
+			__le32_to_cpu(svc_cfg[pipe_num].service_id);
+		req->ext_svc_cfg[ext_pipe_num].pipe_dir =
+			__le32_to_cpu(svc_cfg[pipe_num].pipedir);
+		req->ext_svc_cfg[ext_pipe_num].pipe_num =
+			__le32_to_cpu(svc_cfg[pipe_num].pipenum);
+	}
+
 	/* set shadow v3 configuration */
 	if (ab->hw_params->supports_shadow_regs) {
 		req->shadow_reg_v3_valid = 1;
diff --git a/drivers/net/wireless/ath/ath12k/qmi.h b/drivers/net/wireless/ath/ath12k/qmi.h
index ed024084cac2..7879f439a5ff 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.h
+++ b/drivers/net/wireless/ath/ath12k/qmi.h
@@ -544,7 +544,7 @@ struct qmi_wlanfw_aux_uc_info_resp_msg_v01 {
 };
 
 #define QMI_WLANFW_WLAN_MODE_REQ_MSG_V01_MAX_LEN	11
-#define QMI_WLANFW_WLAN_CFG_REQ_MSG_V01_MAX_LEN		803
+#define QMI_WLANFW_WLAN_CFG_REQ_MSG_V01_MAX_LEN		1835
 #define QMI_WLANFW_WLAN_MODE_REQ_V01			0x0022
 #define QMI_WLANFW_WLAN_CFG_REQ_V01			0x0023
 #define QMI_WLANFW_MAX_STR_LEN_V01			16
@@ -552,6 +552,8 @@ struct qmi_wlanfw_aux_uc_info_resp_msg_v01 {
 #define QMI_WLANFW_MAX_NUM_SVC_V01			24
 #define QMI_WLANFW_MAX_NUM_SHADOW_REG_V01		24
 #define QMI_WLANFW_MAX_NUM_SHADOW_REG_V3_V01		60
+#define QMI_WLANFW_MAX_EXT_NUM_CE_V01			32
+#define QMI_WLANFW_MAX_EXT_NUM_SVC_V01			32
 
 struct qmi_wlanfw_wlan_mode_req_msg_v01 {
 	u32 mode;
@@ -582,6 +584,14 @@ struct qmi_wlanfw_wlan_cfg_req_msg_v01 {
 	u32 shadow_reg_v3_len;
 	struct qmi_wlanfw_shadow_reg_v3_cfg_s_v01
 		shadow_reg_v3[QMI_WLANFW_MAX_NUM_SHADOW_REG_V3_V01];
+	u8 ext_tgt_cfg_valid;
+	u32 ext_tgt_cfg_len;
+	struct qmi_wlanfw_ce_tgt_pipe_cfg_s_v01
+			ext_tgt_cfg[QMI_WLANFW_MAX_EXT_NUM_CE_V01];
+	u8 ext_svc_cfg_valid;
+	u32 ext_svc_cfg_len;
+	struct qmi_wlanfw_ce_svc_pipe_cfg_s_v01
+			ext_svc_cfg[QMI_WLANFW_MAX_EXT_NUM_SVC_V01];
 };
 
 struct qmi_wlanfw_wlan_cfg_resp_msg_v01 {

-- 
2.34.1

