Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794472395;
	b=FMag06P/ebL1nIRgsgiO6CfnPHcuvNPUCjNAQywCFw8wojXFdAaiTABZRf60T5ZAAfoO
	 uOOrpuRgOiG+E85KbmiulydLZTT6ocX52pKMc+ZBXg9B0xMdauMMNFGrhMlYXU5gIN3xe
	 b7HvC68/lEVp0Ia0fiZWfcEFFB76rQCAGh5weYfmGOcmKu0tR0KAQOXCwQEqVJwDEBPGp
	 NT8s1WiBD/oU/3+Vos6oLvIlfqKubfeTq50PfNvHdGq1/xHkIhwlgGfYgI9gKSjMiCOpS
	 hlPD+4ujDb1GOZH9vGu1D8fnHaOpM2BwK3p1BhedHaSMCxfvduqz0yFBIrx3LWpDuUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472395;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=A1tmtQvewlRPfaTZR/GJOfz1XEOPZtFpYykA8zG+CFU=;
	b=fuWP0BPFjANMVP7yursbWhx/IciZVShw530g9+nW8kcupVm7WCBwsg11jCXUdcI1nWMj
	 5IzmkmLy7yyvkp+ulrX1YZwD2QFZb44eSH4xcUL20q9XnQA3nOMZaqTzKde2HPkKxKiHe
	 iGBCmQu15hddU5/kA8C9NaZLP5ZfCB12bkrPmPxL8E6PsVxuEuR1uhwnNzAoTw25T5knD
	 9pMepBueLDPFIj3sH9a4id/k6YGER3z/+Tnd12ZU3YF8heGNwXUMZEeWp8cJgZvacAXbM
	 zEVPmSW/Gn6nnYDd8KaQBxRTDrnAPrANzdnk4g0fz2zYe4Yc72oi7m1UQI3TwvRMk2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TYX9vWfS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A4642Dx4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C00606F8D0
	for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 08:33:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1C00606F8D0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TYX9vWfS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A4642Dx4
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ZZJ52514210
	for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 08:33:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A1tmtQvewlRPfaTZR/GJOfz1XEOPZtFpYykA8zG+CFU=; b=TYX9vWfSbLbgFrrD
	baIVjQozA1CEPPOY4Uh1dvj6lCFdhv5h2KoKeaEPsmX8YqtuH1j9iJitHjXdk+Vz
	mnU6+mYDljsGK5SpGH1++dT4ikB6R7iyrmpulNtCNu+fUjHgmHbYXIIsxyPE9skA
	oAA5l9CtFYhoOhCdKvYC8293iTqhX9zOSI+NY7kb7DLfgGFRpbJYD3/n14SMa1Gt
	5M6YII1W5qvUrdrHP9DBvjnDR57rbErtoG8w61tV5FbSSC+Y7RDxgL07/CMirshR
	kUW/KooxFHtV+u0KC8Mt6WFV/mwfboRiPfReEcA0siHbPOLtgKFrvV54b4NcYVHr
	2z9p0Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvwm1tpy8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 08:33:13 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e942b1cc86so39698875ad.1
        for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 00:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794472393; x=1795077193; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A1tmtQvewlRPfaTZR/GJOfz1XEOPZtFpYykA8zG+CFU=;
        b=A4642Dx4ZCuyJKS9s6Ie0vMT/I9LwIV0HrzBHpa/N9I9shlZF897KmNk6c+x5KtljP
         Mlsp2/LazbsWI/JcRY6qUZb1IaWoB73UfVTbbUm2rEUeyFojQN4YhDvaJ+GY68wzfccI
         4bPKkmzTg88l70sMFyTP8gdTAGnKZLFlcqL/YYSzNONzDjHXxY6sHFlWE8+aQ6iR360b
         4G/884xB/7jseTEwkD4KKvK5j/gruzAD9svtqcFfRnRHjlVwpNusmKn9NHiAqW/PnMt1
         ZcEW9H0lA74bSwk2XEUntPeoBTLBsyx/ETqr1JslX+LOvTlej8RLfB75vzOa746KUj+f
         BeNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794472393; x=1795077193;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A1tmtQvewlRPfaTZR/GJOfz1XEOPZtFpYykA8zG+CFU=;
        b=wI12Sa7kxkGvdSPDW7LnI6Skc9Ja1Vih59noUMLJxO1hrmnmoOGDVbQ6U6O0xboHMN
         aMFUEx1oS8ylX85omBM8WULyEr9yJ97v7EjtOXTW+rodqGlqdFQouqnmoftqA/iutVNW
         cJ+khYZbkS3k4cdRYQvQmB+R08+iGOhcDj7OjFfBdLh7Jt0+P3FvQOgwPkyOXjHKB51A
         DOpr9nYN0qrerE46osisCG60PzIsE3O2KmccE3aNny7TlLWof6RE0LP8kFFKqfUsSybr
         N7PEVVyu4323hfbru9HVelvDsSw0mlqvr7kUPYN3IvP6fIHZ1dGxV+sc2CnCXNnbVvYl
         xQlw==
X-Forwarded-Encrypted: i=1; AL+hErE7hjCmweUA+YHNkKUvMQFvt676ywNMILeljzknZmKVtfluMvkW+ML1dQJdhh9V3VnTJMjx@lists.linux.dev
X-Gm-Message-State: APuU4Z9KFtXbyahZk+NzvGYeFlmqZKEAiAd2L0YQTT4eTPwrOHMm58ZL
	7gb0i+paPbRzcS+2AIxygONkh0dI3dTO79OtqdDXmGYFhtzk5hjjDt03NFrjbwby4v0WoSt5Nyf
	3dUe3QdtFbr39ncqVuu1Q4Tz3z6XaeSf70FEWpTi2ylGURHHjPOdCrCDi
X-Gm-Gg: AYBFou389TB7ZzW6x2UTcDZ0qkaK+PWRseF+RWNwkJhZe7LogLG93nibn756xL787W1
	+O5w/oitZ93RhqzuzOgwMuyCnWItIrjrX+tTfw0qSRpjtwXLXmqTHyponnxJ1prauLlMmHUgseF
	bfQiOYGvrgUMwRmwT/5Z/FYwnUhYZhZJ6bKgHSW7zVbOfZ4/LT/lCfYmOQ90j+iet5oWEjlF+wH
	5m5Rw5n87j1MSnpzfnjOPjOtQ4FrSReAAqo3ggUduIGbkcAPoTCj1KD6w/B7I5PozUud+CRfpds
	5tLqtLsd1K7GBLY4KWGKgFez2d2uyRqoJCqEUYQvUbITS91rf8Ayz8etXV3LR7hvCw1VGaBxcjB
	PLR/uog7ZTHha2PL58Zudbisl/fMMmMNfkhiRjI0f+3ovdqk0Uoc0T6Mmtlh4jAaFw6RTJ1wS5i
	ezhH+HfG5PVPX5G8GgBxNCV7wfk3q9bPsv1RLxK74BkQv1taALcH3O4fwyrAgalSA9afQyOySRB
	w==
X-Received: by 2002:a17:90a:dfd0:b0:3a8:a98c:ea07 with SMTP id 98e67ed59e1d1-3b182e6a121mr3720174a91.13.1794472393151;
        Thu, 12 Nov 2026 00:33:13 -0800 (PST)
X-Received: by 2002:a17:90a:dfd0:b0:3a8:a98c:ea07 with SMTP id 98e67ed59e1d1-3b182e6a121mr3720154a91.13.1794472392600;
        Thu, 12 Nov 2026 00:33:12 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce55c1sm3518029a91.3.2026.11.12.00.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:33:12 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 14:02:23 +0530
Subject: [PATCH ath-next 09/15] wifi: ath12k: add unified firmware image
 support for QCN9575
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
Message-Id: <20261112-wifi8_qcn9575_bringup-v1-9-3f30fbc2bb69@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=KsnYSmWN c=1 sm=1 tr=0 ts=6af579ca cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=yptJjfQlWYdCmDOAxUgA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 457uiY78JneDDthgVX_xFmtO2n9b1Ex3
X-Proofpoint-ORIG-GUID: 457uiY78JneDDthgVX_xFmtO2n9b1Ex3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfX/X/YuoERpKqI
 /CB7fdmpvDoj1xtQMfhzZgDJsJTTHzFqO1dDarqN1DmKE3kV5ZvyNlt/kGGeBwYlQBWUG6gcgtg
 AQ6SknMI8DAcSX0wtIWzdD9RSLcFf/Ew7RAY5qcTTb2/Yvet3wPly+Q4iqqBWd+T77XXScKZGv4
 pY7VAMkHtXijgWpQBRkBncSnoRU+7rVj1Ypxol4BetqpZC+ClK6zAwadfag3TAxYQBUpJWBeNzw
 SCvee0xpzENrPlHmmBfp11FzFizcu0s7mJZ9X4ST1Ix9doyBt+6ZkpwU6u5rsizQoiVt++RbVIl
 eTQspP3QR1xIPR1Rw5GaL85xykdEI0e0QWMNgRWa5pyfgsZfFamXzPnW70fEocKkH4RYduSsYOE
 aMzAHORQWewu0iOO3k/3hBZjhxnEuY4VmAOfluVhlJo/RGNsnEWG28trHWdYqTSRLgkS0aC8yv+
 vSiI5EH6YieyIGXmOIQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfX3VLTxUXqNp3O
 ihoLpJfcxBUuD9eKLoAU62kpovFM0E1wzjyKlfvdB7gbtfDUROqOwW9H2Mt7dCVyML7b7CGW7wy
 R+OAW4HnxCdomEmEEW5MBaS3BYVhz8g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120033

Wi-Fi 7 chips select between single-mac and dualmac firmware images
based on the OTP board ID, loading a separate firmware-N.bin for
dualmac boards. QCN9575 (Wi-Fi 8) instead ships a single unified
firmware image for all board variants and expects the host to write
the OTP board ID into a PCIe local scratch register so firmware can
determine the board configuration itself at boot.

Add the unified_fw_image flag to ath12k_hw_params.fw and set it to
false for all existing Wi-Fi 7 hw_params entries, with QCN9575 as the
only chip enabling it. In ath12k_mhi_register(), once the OTP board
id is read, stash it in ab_pci->unified_fw_board_id for unified-image
chips instead of running the dualmac firmware-selection path, since a
single firmware blob is used regardless of board id.

Add unified_fw_board_id_reg to ath12k_hw_regs and populate it for
qcn9575_regs with the PCIe local scratch register address, keeping
the register layout per-chip and self-contained. Introduce
ath12k_pci_update_unified_fw_board_id() to write the cached board id
into that register and read it back, since iowrite32()/ioread32()
give no other way to detect a failed write. Call it from
ath12k_pci_power_up() before MHI start for unified-image chips, and
return -EIO on a readback mismatch so ath12k_pci_power_up() aborts
before starting MHI and firmware. Continuing after a mismatch would
let firmware boot with whatever stale or incorrect value is already
in the register and self-configure for the wrong board silently,
with no symptom beyond a warning in the kernel log.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/hal.h              |  1 +
 drivers/net/wireless/ath/ath12k/hw.h               |  1 +
 drivers/net/wireless/ath/ath12k/mhi.c              |  4 ++-
 drivers/net/wireless/ath/ath12k/pci.c              | 31 +++++++++++++++++++++-
 drivers/net/wireless/ath/ath12k/pci.h              |  3 +++
 drivers/net/wireless/ath/ath12k/wifi7/hw.c         |  7 +++++
 .../net/wireless/ath/ath12k/wifi8/hal_qcn9575.c    |  1 +
 drivers/net/wireless/ath/ath12k/wifi8/hw.c         |  1 +
 8 files changed, 47 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/hal.h b/drivers/net/wireless/ath/ath12k/hal.h
index 4b0fbd6f4aea..9e88bdf4a93b 100644
--- a/drivers/net/wireless/ath/ath12k/hal.h
+++ b/drivers/net/wireless/ath/ath12k/hal.h
@@ -1219,6 +1219,7 @@ struct ath12k_hw_regs {
 	u32 gcc_gcc_pcie_hot_rst;
 
 	u32 qrtr_node_id;
+	u32 unified_fw_board_id_reg;
 };
 
 /* HAL context to be used to access SRNG APIs (currently used by data path
diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
index 6fd87482425a..9c11edd2b051 100644
--- a/drivers/net/wireless/ath/ath12k/hw.h
+++ b/drivers/net/wireless/ath/ath12k/hw.h
@@ -160,6 +160,7 @@ struct ath12k_hw_params {
 		size_t cal_offset;
 		enum ath12k_m3_fw_loaders m3_loader;
 		bool download_aux_ucode:1;
+		bool unified_fw_image:1;
 	} fw;
 
 	u8 max_radios;
diff --git a/drivers/net/wireless/ath/ath12k/mhi.c b/drivers/net/wireless/ath/ath12k/mhi.c
index 56e697fbdad5..90b7774ae6e8 100644
--- a/drivers/net/wireless/ath/ath12k/mhi.c
+++ b/drivers/net/wireless/ath/ath12k/mhi.c
@@ -211,6 +211,8 @@ int ath12k_mhi_register(struct ath12k_pci *ab_pci)
 		if (!board_id || (board_id == OTP_INVALID_BOARD_ID)) {
 			ath12k_dbg(ab, ATH12K_DBG_BOOT,
 				   "failed to read board id\n");
+		} else if (ab->hw_params->fw.unified_fw_image) {
+			ab_pci->unified_fw_board_id = board_id;
 		} else if (board_id & OTP_VALID_DUALMAC_BOARD_ID_MASK) {
 			dualmac = true;
 			ath12k_dbg(ab, ATH12K_DBG_BOOT,
@@ -218,7 +220,7 @@ int ath12k_mhi_register(struct ath12k_pci *ab_pci)
 		}
 	}
 
-	if (dualmac) {
+	if (!ab->hw_params->fw.unified_fw_image && dualmac) {
 		if (ab->fw.amss_dualmac_data && ab->fw.amss_dualmac_len > 0) {
 			/* use MHI firmware file from firmware-N.bin */
 			mhi_ctrl->fw_data = ab->fw.amss_dualmac_data;
diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index 6617440954b1..d238603f6075 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -976,6 +976,24 @@ static void ath12k_pci_aspm_restore(struct ath12k_pci *ab_pci)
 						   PCI_EXP_LNKCTL_ASPMC);
 }
 
+static int ath12k_pci_update_unified_fw_board_id(struct ath12k_base *ab)
+{
+	struct ath12k_pci *ab_pci = ath12k_pci_priv(ab);
+	u32 reg, val;
+
+	reg = PCIE_UNIFIED_FW_BOARD_ID_REG(ab) & WINDOW_RANGE_MASK;
+	ath12k_pci_write32(ab, reg, ab_pci->unified_fw_board_id);
+
+	val = ath12k_pci_read32(ab, reg);
+	if (val != ab_pci->unified_fw_board_id) {
+		ath12k_warn(ab, "unified_fw_board_id readback mismatch: wrote 0x%x, read 0x%x\n",
+			    ab_pci->unified_fw_board_id, val);
+		return -EIO;
+	}
+
+	return 0;
+}
+
 void ath12k_pci_cancel_workqueue(struct ath12k_base *ab)
 {
 	int i;
@@ -1484,16 +1502,27 @@ int ath12k_pci_power_up(struct ath12k_base *ab)
 	if (ath12k_fw_feature_supported(ab, ATH12K_FW_FEATURE_MULTI_QRTR_ID))
 		ath12k_pci_update_qrtr_node_id(ab);
 
+	if (ab->hw_params->fw.unified_fw_image && ab_pci->unified_fw_board_id) {
+		ret = ath12k_pci_update_unified_fw_board_id(ab);
+		if (ret)
+			goto err_unwind;
+	}
+
 	ret = ath12k_mhi_start(ab_pci);
 	if (ret) {
 		ath12k_err(ab, "failed to start mhi: %d\n", ret);
-		return ret;
+		goto err_unwind;
 	}
 
 	if (ab->static_window_map)
 		ath12k_pci_select_static_window(ab_pci);
 
 	return 0;
+
+err_unwind:
+	ath12k_pci_msi_disable(ab_pci);
+	ath12k_pci_aspm_restore(ab_pci);
+	return ret;
 }
 
 void ath12k_pci_power_down(struct ath12k_base *ab, bool is_suspend)
diff --git a/drivers/net/wireless/ath/ath12k/pci.h b/drivers/net/wireless/ath/ath12k/pci.h
index 62b72558c0e2..70952a52a1b1 100644
--- a/drivers/net/wireless/ath/ath12k/pci.h
+++ b/drivers/net/wireless/ath/ath12k/pci.h
@@ -38,6 +38,8 @@
 #define PCIE_SMLH_REQ_RST_LINK_DOWN		0x2
 #define PCIE_INT_CLEAR_ALL			0xffffffff
 
+#define PCIE_UNIFIED_FW_BOARD_ID_REG(ab) \
+	((ab)->hal.regs->unified_fw_board_id_reg)
 #define PCIE_QSERDES_COM_SYSCLK_EN_SEL_REG(ab) \
 	((ab)->hal.regs->pcie_qserdes_sysclk_en_sel)
 #define PCIE_QSERDES_COM_SYSCLK_EN_SEL_VAL	0x10
@@ -144,6 +146,7 @@ struct ath12k_pci {
 	const struct ath12k_pci_reg_base *reg_base;
 
 	u32 window_reg_addr;
+	u32 unified_fw_board_id;
 };
 
 struct ath12k_pci_driver {
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
index 48a2f6da16ef..282a41980d98 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
@@ -413,6 +413,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			.cal_offset = 128 * 1024,
 			.m3_loader = ath12k_m3_fw_loader_driver,
 			.download_aux_ucode = false,
+			.unified_fw_image = false,
 		},
 		.max_radios = 1,
 		.single_pdev_only = false,
@@ -509,6 +510,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			.cal_offset = 256 * 1024,
 			.m3_loader = ath12k_m3_fw_loader_driver,
 			.download_aux_ucode = false,
+			.unified_fw_image = false,
 		},
 
 		.max_radios = 1,
@@ -607,6 +609,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			.cal_offset = 128 * 1024,
 			.m3_loader = ath12k_m3_fw_loader_driver,
 			.download_aux_ucode = false,
+			.unified_fw_image = false,
 		},
 		.max_radios = 2,
 		.single_pdev_only = false,
@@ -702,6 +705,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			.cal_offset = 128 * 1024,
 			.m3_loader = ath12k_m3_fw_loader_remoteproc,
 			.download_aux_ucode = false,
+			.unified_fw_image = false,
 		},
 		.max_radios = 1,
 		.single_pdev_only = false,
@@ -792,6 +796,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			.cal_offset = 256 * 1024,
 			.m3_loader = ath12k_m3_fw_loader_driver,
 			.download_aux_ucode = true,
+			.unified_fw_image = false,
 		},
 
 		.max_radios = 1,
@@ -891,6 +896,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			.cal_offset = 128 * 1024,
 			.m3_loader = ath12k_m3_fw_loader_remoteproc,
 			.download_aux_ucode = false,
+			.unified_fw_image = false,
 		},
 		.max_radios = 1,
 		.single_pdev_only = false,
@@ -983,6 +989,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			.cal_offset = 128 * 1024,
 			.m3_loader = ath12k_m3_fw_loader_remoteproc,
 			.download_aux_ucode = false,
+			.unified_fw_image = false,
 		},
 		.max_radios = 1,
 		.single_pdev_only = false,
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9575.c b/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9575.c
index 076a5a609f8b..92ea24634100 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9575.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9575.c
@@ -68,6 +68,7 @@ const struct ath12k_hw_regs qcn9575_regs = {
 	.gcc_gcc_pcie_hot_rst = 0x1e38438,
 
 	.qrtr_node_id = 0x01e03300,
+	.unified_fw_board_id_reg = 0x1e03304,
 };
 
 static int ath12k_hal_srng_create_config_qcn9575(struct ath12k_hal *hal)
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hw.c b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
index 91d8f762e642..bffd1081fd2f 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
@@ -24,6 +24,7 @@ static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
 			.cal_offset = 128 * 1024,
 			.m3_loader = ath12k_m3_fw_loader_driver,
 			.download_aux_ucode = false,
+			.unified_fw_image = true,
 		},
 		.max_radios = 2,
 		.single_pdev_only = false,

-- 
2.34.1

