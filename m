Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795538631;
	b=noKGTtA2CjyA9xJxUdSJiVGaq4DUsGUXXV84Sb3xBHRflSKlWJnNejKm1k8sezAhhi0h
	 7GlgXO5wmLQ5LpIvf8c8YgVZB3erPPM6AGZFDHyJu2qlf3jS3PaeW6YZ0ljiJkyVh4n2R
	 nvAuZAVmzasWMsiIQEVFjNVHFigZh5fAtXr6Eb5YKNcKvEq5TRzzC456C5yERF8UE09Lw
	 CtFTIJjFkVNyl0FcNxh2n3cE48OsPyrCj6h2/9KAS8ke0IKzybZH9ldtSLzEv64YiH5xv
	 5C/2DPtJPfAGH3xOURG5EJMeCMcju6E4pdzYRDaCe4h1iNDhZ90+qPBtg5tmbV7Tt3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538631;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PaAkSJGfWdT/hF3hWrkH4vMfAFvDljyPIoDVUO8O8Zk=;
	b=2cB6qnPJ4oAeyBPUROmIMrw4t3RaQ3GewNRlztGw7KrPxi8q+tPHWhoLXrkEHug68Tzt
	 4sFN67gNNT2yVjwX1Y+C7IggDRfiPLmpJ19UEJGOH/SCUZtD4WSMOwrwDwVsEiq6lVB5b
	 PQn29BWYiEkMbA0N5nhMVmZHIjRpXm2iC4O5n1Ppb7THY9q8v5sA7erqCVNim/TXwko4q
	 3QmOKjSUr1MpdogkIdm1YsdAPLDHb+4yj2k1oU4bN36bmP7vX+X//oGIG8LqQwKAxAG8X
	 UZboynq0oppZcNm4P+JwWH4GXP+pbtZEKwTXnHhQrrqeXjc7QKB3l0frj6qFhxOhHGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ODUfRy9B;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cK8tdU+E;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE5A606A68B
	for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 16:43:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BE5A606A68B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ODUfRy9B;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cK8tdU+E
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFLhlU1332078
	for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 16:43:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PaAkSJGfWdT/hF3hWrkH4vMfAFvDljyPIoDVUO8O8Zk=; b=ODUfRy9BadPh8exW
	pZrJb34YoXdS5s7npRtqeEpfA3k50fX/dEFyJ9C9JOk0pghPpWFcfZ0KSAZk20kn
	rfo6kZmOl37+WKZtJkrQ591Bz0CAVW73bhO0rbB4r3KDhkrJDUYOpPXXclcr9l97
	C1NvA65rk9EmEzL8xLTLrwDOUtpOvivG0hrCH6Z2/N/9+EwS+Fi3Lt+Z+532xt4H
	49xQXxQ2q/k3jqVCsgK0nT33yc6jkieuFZDLXq8ywVkM6IhPKJ+teov6pb+O3kKR
	//HGNpSFxaKeQOYvNw9p0mRbpyb5u3oloL3AOTS5lMXTY0HEGS4xCNnMz0CJHzbw
	7aUEJw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yvb3v2m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 16:43:49 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3846d5f54c1so5867146eec.1
        for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 08:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795538628; x=1796143428; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PaAkSJGfWdT/hF3hWrkH4vMfAFvDljyPIoDVUO8O8Zk=;
        b=cK8tdU+EO2taoCPxwr2U+Jx8HbXM63sSke8GGiW8vk5nha+VaqxGJIchNeQ07supHb
         tJcYLvcXVV5Zu/AxfmQE8FtG/20rkOERw/MdZoNdjFBDCsZc5P8dL4HklaygQssMgQMm
         HGVHe9QtYmYXGSLReVkYxYTVSe63qRgevMU6erVhIc9aKh+dqExoMCwqomhGutSN/Z2v
         a15Jjga40UKQL68wxS/CKWwe/mz2uJJAx+GWNM+niGQ6pPLQH5YtBeml8xZXOaCuOYv5
         pEzl9MoGw2XCqv9EkqCM6V75OlbfSUY+kBBzS1aeplS+/ieFRdTqJbF/3KqefLaGNane
         FyjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795538628; x=1796143428;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PaAkSJGfWdT/hF3hWrkH4vMfAFvDljyPIoDVUO8O8Zk=;
        b=h/Ypjsqwv3YL3s+ibvy0PkELGQI7xOsN37I3kJIueH+toEWLZ9Cu4Qn7DhfZeiD9WE
         cVWfhvKD0BFLECLwtjBPcbn2PeB23DTGf28N+UYPhYqphwuUlD0twePkukOPxFV1RBer
         Yrl31mDiTFa2mLCVFjtVmU4p/xuaHEWnoNZASspxLsg+Jm2rQTY2RlygTT7oZ6TNHK04
         c0WUgDy6NItI8HXyHyiPfklYD2N5M55XtTjRDw/q1Mk4PTQtWe83GNILXIrLXGlOfMbM
         H5AcPbTh6aiHDw7dpGh/WnTBe6aQKZEIhzniPGWTdB4uCz3v5cfoXdijDbavMnNUHFvv
         fP2g==
X-Forwarded-Encrypted: i=1; AL+hErFc42eD9mb5kYfTI2vshgbdUsNEfaHMnQkPTEFLnOuJg6/YYl1DDd2JnAov6r3ozSI4Sl7E@lists.linux.dev
X-Gm-Message-State: APuU4Z8bFytkFcRM5QKjxqP54dSIAFSCLFCIFdU4d++e85FCkHfeTgKN
	75ghwa4nZhJtv8lmFa2JegcjPF8/rXo6sbMdTe+CrxrdsC6YRXN4icl3+VyprhDEzqyBEFVnbYf
	xRqEClQPcnXv0AkkKQPQde+CMpWGD2WVIV96Zl/jaeqQTKfOf/SatVQny
X-Gm-Gg: AZFdTZf9vJm35+IsW2fnR6GM2rNoI3XqKeOITJY3BBzQo+PVLTnTnyeozRShqU2J9ML
	m7XVeJr2NVE2XIQkWeAJI+wrmgALwdeD37O52GsMhELQBqjpFwDF6F0PeOF0qyjdaeWLdiAKw4P
	7KsYpKK9sY1ixo1sSpfmc+gQhNoxosmgZC8CgtjjWxjNBGLvQOQFulCOXvR+Ploqeb0oDLdpF4o
	djVaoVIP0UbXKcypOTPzZNFYcVP+AE1vosoXOMLluhT3zvv9uQBEi0bK2wSfzVyG8doPykZ78Pp
	bkz1dYcSITLWIYg385w5Ws+aeowx3BoMMCkPgpXCbDFqn5cunFdACnk65ZX3J4uEncy+6DOf5tG
	gBkeT4TrmozZVXd/iH8YjjSDc2fObObvmb+WgXN0ssvUmc8RCWU7firNep4HOf94SawjAcUzpQv
	3vX45W+uyGuk0lAB8xl/xtPkyNAbHmLiLQGviHa3KO2Vl15In8hrRsA/b7exG49k1sKknB9Ik2b
	PA=
X-Received: by 2002:a05:7301:4d18:b0:37d:bd4e:c378 with SMTP id 5a478bee46e88-3857181d8ddmr15298644eec.41.1795538628303;
        Tue, 24 Nov 2026 08:43:48 -0800 (PST)
X-Received: by 2002:a05:7301:4d18:b0:37d:bd4e:c378 with SMTP id 5a478bee46e88-3857181d8ddmr15298604eec.41.1795538627530;
        Tue, 24 Nov 2026 08:43:47 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm49093900eec.22.2026.11.24.08.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:43:47 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 22:13:28 +0530
Subject: [PATCH ath-next v4 02/14] wifi: ath12k: add extended QMI WLAN cfg
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
Message-Id: <20261124-wifi8_qcn9575_bringup-v4-2-1f5b87ece6a3@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=aJ1lOr9m c=1 sm=1 tr=0 ts=6b05bec5 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=z7nB0JqBhXvykku2dhgA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: Dlj8MeKqfY_KHMTHe-EesoUa1anF9tft
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfX97r+Q92uOMA2
 DS5T/kwyIY3hfsm47yIgnmr+px+WypvRKORhAirkKGar/WGOuTAnMGJKJWGdFNRJ11q7YsNAKd4
 NyFtQxzSRjsfE/w4EBtt/7uigvmg+mc=
X-Proofpoint-GUID: Dlj8MeKqfY_KHMTHe-EesoUa1anF9tft
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfXzgZ/tJ7kUDuf
 usy5hTSQ+ogNj0G6ab/m3YND2MV3Ux7ljAN986WJzjpHrnz9pw/Zp+s6nTNS3Kee6f8UjRcMczX
 K5BBjalooA2VJgpqUJduRVvw0faa17DvTfrEmXL/fEdQ5gqh3iJDeFrEYk3fQruf3LVYJuzJYUr
 UBlC/9Y5xBkJ9AiE4cq5M4prNGBDa4ciBOLZgHXvbceY2gOSvdC57tlgCq2xXL6gw6jFj784N8O
 ijap9WSHsQuKHj0rktpBS6DpYgqaLaHQJ4jcj4eu6Qx92BruTfpBDl4AUjmMlgnOyDEephQ4ZU3
 lq7nrYVO45KUIVAgN0Ll+8jrGvHRrQvrfmP15T8GqBzeX3+kAKitKjaifrTM3OQ/jxMVTrZ2DaS
 GKRyGSB1mxrOeJ7AgK1AFuuEdm74cAtQg2TtixyXte8w1XFyU+GPpFB9Z+BLPAAkLiSGs/Z1YJl
 8skka9wBLAqYQoijFXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240065

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

