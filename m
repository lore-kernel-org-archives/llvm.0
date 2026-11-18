Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794982753;
	b=UgInm2PyHhv1X7GBVNSEiigwE5twRUmgi1CdBDNiRT08jNBVh65+NXxRDPHu0NVScgnx
	 ehDwRQDyrXX0WetoJdSK/9kxYkJ6m2kEwx44R/VZ4VuUjDksGu8Cf4PZ7Y1Q59TDr1Jot
	 G6R03/bkJ0nb78G/Tkq643NfszHhGz3ITRBcSSiO3GQrbEDHt8GeheR3VvUugkHoUTh2b
	 pTk+PU8AHONDqFGSRIbdZMW4tMxFCUL+VDJwrfW12HoA08uPom499K3I7ZyOYYxNOYwnj
	 6qIRpnUihp2xWGUc5Or2YRCtf90DZwIjGderE+t5XWWW2vtx0dWoGjZoN5LjLSHp06A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794982753;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vDEjMPy7HJmNHTeNxgHAx4/MYeBpn0DBUzvTmeTtSkw=;
	b=TWlPOMF5hmoAZBDmu7PvXU6dmj4GutiaN0DAhE3gBOGywxadsFby8WP6TcFa5K8e+ayV
	 l90O/fOd4NWS7qauTf/66xERGJbL/QBW3+AhJVzPCClxNbPE6sQExiaSgPRjfMEkokkWi
	 t1Rv93aMj+iYlyGH+nDBrWDKGoH3yIyKyrm4FP6WH63hsdUy9vs7STVCawfV0U3cabUdN
	 tURKjsS9a/Sg7QZBYG9pwLWJGc9ieGOZ7/j/3/NWgFuqANx6jMsRLJCgpTe8s29rINPKb
	 kQ1k4g512nC0SEEOMxeh4PuvkchFUqHXsNkXO6eWi3kxzGNTtM1TM5Zez/O2o+JSRkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R8YgjroA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LtfIds08;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BAE606A325
	for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 06:19:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07BAE606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R8YgjroA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LtfIds08
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2VAwx1430782
	for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 06:19:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vDEjMPy7HJmNHTeNxgHAx4
	/MYeBpn0DBUzvTmeTtSkw=; b=R8YgjroAU2fIXptsdPlOB4iffr1NYJ01HYh3R+
	b858zowW7YG86VM/M8qQOSl24QJBAMls/EeUjGrfUPlVrFLP7eUVW48Zr9vFWHZv
	43QhU2wWWvbXAxX06UEe7uFfJ8x52Lpt562MXdG2pR9VG8vQ4nANUSSnfqf1HAEI
	q6dk40evl5ROdDVx3CCNP5zF5dQv05XqUq7uVuSrOfWATh3oas2ivpaeZVHvRwCh
	JINTRqlFEAj3aU5kyw7YClKwfqezoMXl3H0sTznL4SxDZ+ZtDMt5tASDq4QugQOF
	ssC7MWR34gNzmII+OF/J1gKckU2ZiAJ+SDsn0Bo1Cw0Q80/g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv91h7x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 06:19:12 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b10afdf947so2399474a91.0
        for <llvm@lists.linux.dev>; Tue, 17 Nov 2026 22:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794982751; x=1795587551; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vDEjMPy7HJmNHTeNxgHAx4/MYeBpn0DBUzvTmeTtSkw=;
        b=LtfIds088hFLIuSikiP4bO/cbEenZSaA7rd9dvnJ1usNZ4Ca53QHkCUgNwJpS3ZMax
         A1GXwN7LwwPqItfo4BgxtgGes3ghXWTHcC0x3vsxpKixyX90qOJVRVg6Jzl9LBhEHV62
         X2e2/R7mRzv68rgCoDw8mRNxXK8Ks8/qM+RCzP+zVLq+Z7OCrn0WsCe8+O0ApiABkKIv
         Su7XLBTfK8ydLtDJB7dHlh5mgpM88DtkPfDk4PhFigJA9UF1O4wiGsxo+ToM1mepXeOn
         lE6nCmhmfhTELFmI8cFEDchgsRVritS1RjLI2DP0ARY1NtbXD/6vG3srCeUU3X63K9ge
         +SmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794982751; x=1795587551;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vDEjMPy7HJmNHTeNxgHAx4/MYeBpn0DBUzvTmeTtSkw=;
        b=mf6TPvi5CShzaEymvie9t4pL76e9WNHHOteCBlsln7Uqeb1wXZ6ib8qexh3/zZyMKu
         hOvv+xrEs6dVFKhQYwioqAGAH6mjCzwFOpp9CfB55NXFtmrxmwkNJyfOIYIrmg27x1XP
         cVjFI7QJWwmQKfLXoKu9fWOqYt6jsihuKJRo4KYmfbpH/qZfrNocvV/y4AWOZ5aSnzBQ
         o/QAdt0zsCiLEYkBmIWIEIxsZYWHahjmw2BOP6Qt4i/gefqxsnthpyL5vmPiHNibXN4Q
         9FeJwLIqfu8EZqgKIdir+aLSihdhwFrB64utKKVBefKupROCVNW2o6f1auUpV/+DFlFs
         AZ/A==
X-Forwarded-Encrypted: i=1; AL+hErEWhL/H6Qxn2/pC8D1DZshTxts7C3nr9QSlGXNSpY2qT2t3Dgu2ldZooEvdSoG1NG9zdhai@lists.linux.dev
X-Gm-Message-State: APuU4Z+NvoooNLRpw8+fR/gPbTCizHxRXki/BjK46omNp3utO7WRcxtD
	X/6N5JjBpaMCC8pFX3QvioGqfW7IJTSEBnT85KhwQV4W9/V0LQm8Ny9manUNTk8z5oGmMyRRSWz
	1ZOXhsZeXS38nVO+cTmpdYVtx0y9F4HVAqRgSbvsPWXy+2IVmSvEgBAHe
X-Gm-Gg: AZFdTZd9FtqYlMHcHzQKOPQxapjs6ewCivRKGO2OQZLAF63saItFq+V0XxaNAHxdFz5
	56Hd9lX91J43iBEq9B7Q8XAgzv7XycEwh7uNFDQ2c0YnxmEkl3BJwGnFge6b8/C4JyhkAiIHPRo
	yu8AHUu0BfQsckpRoxtw+Ma7+1cYF6oxm2IvFFpshTDtz5/ArvseTsYIlTZ91Et3g1qdC4ya51Q
	Yt9O/ivBDae73QlaxGbj3Oca7G7U9+pxaZNhU6CBC/rTaLul7vsG/zjYY9g5EU0ON0yUH2jGAW7
	m/Ddn4qiBAZaRuQVb1fDAQfPiGCFTv46PVa7GvXfvP+mdvJzH0HYCoV1o/2C/YS3wHex8qUW6+v
	BzirgLdlw+Y+VZVYG8LWTsJ7G05kcfY86b+0hSBKz318m1S900K3arHHDH8SeSUEQMVRgl4sExh
	yCkXUmR8zjl8IhSYkpMeiwhQEz7x2y7PMNJc1MC7wR+4tewbOZR1IcgAg+zoKeLjgbrzE4TIRMZ
	+w=
X-Received: by 2002:a17:90b:52c6:b0:3a8:337d:228a with SMTP id 98e67ed59e1d1-3b3d063d686mr1274332a91.6.1794982751330;
        Tue, 17 Nov 2026 22:19:11 -0800 (PST)
X-Received: by 2002:a17:90b:52c6:b0:3a8:337d:228a with SMTP id 98e67ed59e1d1-3b3d063d686mr1274305a91.6.1794982750624;
        Tue, 17 Nov 2026 22:19:10 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac255634sm7395464a91.5.2026.11.17.22.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:19:10 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Subject: [PATCH ath-next v2 00/15] wifi: ath12k: add initial Wi-Fi 8
 support for QCN9575
Date: Wed, 18 Nov 2026 11:49:03 +0530
Message-Id: <20261118-wifi8_qcn9575_bringup-v2-0-d81a3046290e@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAFdD/WoC/4VOSw6CMBS8inlrS2gJRVx5D0NIWx/wjLTQAmIId
 xfwAG4mmcx3gYCeMMD1tIDHiQI5uxFxPoFplK2R0WPjIGIhOeeCvamiS9kbm6dZWmpPth47pjK
 JmVQ8kRxhy3YeK5qP3juooWEW5wGKnxJG/UQz7LW7t6EwOP85Lkz8SPxZmziLWVIlcaWN0FrmN
 xdC1I/qZVzbRhtAsa7rF7gXvcfdAAAA
X-Change-ID: 20261112-wifi8_qcn9575_bringup-a76e76a1361e
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfXyvplFmkHvJhZ
 idJiEfD9h7WEkYsPqtRKwCXHacVPacTW3j9oalk06d21PJF2dbGqbO01cYp9V014URsBdGbIl8o
 pDpOMH0TzsjwrSU/xSCOCET8gzQFWhsjEHFB7LFhe9hrsyLZVdV0azj4wv/KCU8/oPJ2UdIOcf+
 paNATjYlnVKK1oYDj5JDiOB/4FXg7FAEexuILUR85h9NRwuYE4sZyod/Zn8EqnhtsCD9xcyMRBn
 LZqj2aiDi5/nMH7cbTWTxYBrT5bhJSaU/eTmcz27FJp1Ou3CmjUbi5gykXPB0exjSrNEhqr6P0F
 pIV/TGjjORz9IVvr0y1FNIU4jOvkaibplSOBBGW2DO3T8cqW4rgP+KMEOhOGM8W1augi49CfNez
 NW/RaH+mHmj6WJg7DZMDzgH2hYiCEmZeaLaDsNL4UEZh2jDUBzt3bl3f3TINbGBFbabE/zY+z2a
 ykHNc2KmZ3SEHDIh7jg==
X-Proofpoint-GUID: 3C_5hQCJSMn2nWtnte_kugfiYk3_7hb5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfX2Z7KPiELWWBp
 nBJEoCxjr2vanoYlt4cTM1KbQHPyF3ul4YnErN75Ev1ql/XOlB1LbHdxHBABDWvZ4wcckTM/i97
 xkd3m+pKBeNHrpVNA8m5XFXburPBP4M=
X-Authority-Analysis: v=2.4 cv=LuQHWXdc c=1 sm=1 tr=0 ts=6afd4360 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=stkexhm8AAAA:8 a=VwQbUJbxAAAA:8
 a=1XWaLZrsAAAA:8 a=JfrnYn6hAAAA:8 a=IFHodnDJ-pNzQd9Po4MA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=FO4_E8m0qiDe52t0p3_H:22 a=pIW3pCRaVxJDc-hWtpF8:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: 3C_5hQCJSMn2nWtnte_kugfiYk3_7hb5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180024

QCN9575 is a Wi-Fi 8 (802.11bn) PCIe target that represents a new
hardware family distinct from the existing Wi-Fi 7 devices (QCN9274,
IPQ5424). It supports 2.4 GHz, 5 GHz, and 6 GHz bands across upto two
radios.

This series adds the initial bring-up scaffolding needed to register
QCN9575 with the ath12k driver. No protocol-level 802.11bn features are
enabled yet; the goal is to establish a functional base with the new
ATH12K_DEVICE_FAMILY_WIFI8 family tag and a dedicated wifi8/ subdirectory
that follow-up series can build on.

Patch 1 moves the PCI window register constants from pci.c into
per-device structures, so Wi-Fi 7 and Wi-Fi 8 can each define
independent window layouts instead of sharing one fixed set of
constants.

Patches 2 and 3 extend the shared QMI layer: a larger WLAN config
message to describe the CE and service pipe count QCN9575 requires,
and support for downloading an extended firmware binary.

Patches 4 through 12 introduce the wifi8/ subdirectory with its own
Makefile, followed by the hardware scaffolding: hw_params, HAL
register table, HAL ops and descriptors, unified firmware image
support, MHI channel/event config, CE and service pipe map, WMI
resource config, and hw ops.

The final two patches integrate QCN9575 into the driver: a mac80211
ops skeleton is added and hooked in, and the series closes with the
Wi-Fi 8 PCI driver scaffolding. QCN9575's device ID is intentionally
left out of the PCI id table in this series, so the module builds and
links cleanly but no physical device can match and probe; the id
table entry lands in the follow-up CP/DP series once the device is
actually functional.

Each patch compiles and links cleanly on its own; where follow-up
patches fill in callbacks, stubs are used to keep the tree
bisect-safe.

This series has been boot-validated on internal firmware version
WLAN.WBO.1.0-01410-QCAHKSWPL_SILICONZ-1 together with the remaining
Wi-Fi 8 enablement patches (CP, DP setup, MAC datapath) that complete
device bring-up; those patches will be posted as a follow-up series.

In addition, each ath12k driver patch contains Tested-on: tags for
existing platforms where it was verified that there are no
regressions.

---
Changes in v2:
- Addressed sashiko's review comments in patch "refactor PCI window selection to per-device layout"
- Link to v1: https://patch.msgid.link/20261112-wifi8_qcn9575_bringup-v1-0-3f30fbc2bb69@oss.qualcomm.com

To: Johannes Berg <johannes@sipsolutions.net>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Jeff Johnson <jjohnson@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
To: Bill Wendling <morbo@google.com>
To: Justin Stitt <justinstitt@google.com>
Cc: linux-wireless@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: ath12k@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev
 
---
Madhavan Ganesan (15):
      dt-bindings: net: wireless: add ath12k wifi device QCN9575
      wifi: ath12k: refactor PCI window selection to per-device layout
      wifi: ath12k: add extended QMI WLAN cfg for CE and service pipes
      wifi: ath12k: add QMI support for extended firmware binary download
      wifi: ath12k: add Wi-Fi 8 directory and base module scaffolding
      wifi: ath12k: add initial Wi-Fi 8 hw params and init helper for QCN9575
      wifi: ath12k: add Wi-Fi 8 HAL register table and hal init hook for QCN9575
      wifi: ath12k: add Wi-Fi 8 HAL ops and descriptor definitions for QCN9575
      wifi: ath12k: add unified firmware image support for QCN9575
      wifi: ath12k: add Wi-Fi 8 MHI config for QCN9575
      wifi: ath12k: add Wi-Fi 8 CE config and service pipe map for QCN9575
      wifi: ath12k: add Wi-Fi 8 WMI init for QCN9575
      wifi: ath12k: add Wi-Fi 8 hw ops for QCN9575
      wifi: ath12k: add and hook Wi-Fi 8 mac80211 ops skeleton for QCN9575
      wifi: ath12k: add Wi-Fi 8 PCI driver scaffolding for QCN9575
 
 .../bindings/net/wireless/qcom,ath12k-wsi.yaml     |   9 +-
 drivers/net/wireless/ath/ath12k/Makefile           |   1 +
 drivers/net/wireless/ath/ath12k/ahb.h              |   6 +
 drivers/net/wireless/ath/ath12k/core.h             |   4 +
 drivers/net/wireless/ath/ath12k/fw.c               |   8 +
 drivers/net/wireless/ath/ath12k/fw.h               |   1 +
 drivers/net/wireless/ath/ath12k/hal.h              |  10 +
 drivers/net/wireless/ath/ath12k/htc.c              |  18 +-
 drivers/net/wireless/ath/ath12k/htc.h              |   8 +
 drivers/net/wireless/ath/ath12k/hw.h               |   5 +
 drivers/net/wireless/ath/ath12k/mhi.c              |   4 +-
 drivers/net/wireless/ath/ath12k/pci.c              |  46 +-
 drivers/net/wireless/ath/ath12k/pci.h              |  11 +-
 drivers/net/wireless/ath/ath12k/pcic.c             |  27 +-
 drivers/net/wireless/ath/ath12k/qmi.c              | 484 ++++++++++++++++++++-
 drivers/net/wireless/ath/ath12k/qmi.h              |  73 +++-
 drivers/net/wireless/ath/ath12k/wifi7/ahb.c        |   6 +
 drivers/net/wireless/ath/ath12k/wifi7/hal.h        |   9 -
 drivers/net/wireless/ath/ath12k/wifi7/hw.c         |  14 +
 drivers/net/wireless/ath/ath12k/wifi7/pci.c        |   4 +
 drivers/net/wireless/ath/ath12k/wifi7/pci.h        |   8 +
 drivers/net/wireless/ath/ath12k/wifi8/Makefile     |  10 +
 drivers/net/wireless/ath/ath12k/wifi8/ce.c         | 404 +++++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi8/ce.h         |  13 +
 drivers/net/wireless/ath/ath12k/wifi8/core.c       |  31 ++
 drivers/net/wireless/ath/ath12k/wifi8/hal.c        | 434 ++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi8/hal.h        | 171 ++++++++
 drivers/net/wireless/ath/ath12k/wifi8/hal_desc.h   |  88 ++++
 .../net/wireless/ath/ath12k/wifi8/hal_qcn9575.c    | 124 ++++++
 .../net/wireless/ath/ath12k/wifi8/hal_qcn9575.h    |  15 +
 drivers/net/wireless/ath/ath12k/wifi8/hw.c         | 250 +++++++++++
 drivers/net/wireless/ath/ath12k/wifi8/hw.h         |  14 +
 drivers/net/wireless/ath/ath12k/wifi8/mhi.c        |  70 +++
 drivers/net/wireless/ath/ath12k/wifi8/mhi.h        |  10 +
 drivers/net/wireless/ath/ath12k/wifi8/pci.c        | 105 +++++
 drivers/net/wireless/ath/ath12k/wifi8/pci.h        |  11 +
 drivers/net/wireless/ath/ath12k/wifi8/wmi.c        |  57 +++
 drivers/net/wireless/ath/ath12k/wifi8/wmi.h        |  13 +
 38 files changed, 2515 insertions(+), 61 deletions(-)
---
base-commit: ee7edfb99ee26581633fabb0662382734ea3cdbd
change-id: 20261112-wifi8_qcn9575_bringup-a76e76a1361e

