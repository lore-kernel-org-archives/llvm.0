Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794472345;
	b=BJ4qNnlaZS441vURrcw1vsl+1PA8IH43NoaFjgjJInHRbsOicgSYh6Xbqemt/eG1kp75
	 tMeMthp5yiKBWbzN6ojcjPtEwsjg3Jkgi87fnDmVwHgsxEZji6h2/JXlmDp+PWZTV6B2R
	 fgLH9xqGrmAkkaiq+qLFVviAs21IuUHkwmNrBvOTweZkFcmlRgC3fyQ/689jwlVa/50sy
	 uBvUlssvusu/AD3BLk+rdeGsx9tVviGcf8ROrmIHUgbPRNTUzj4IJfwzMcMosaTdt2rbQ
	 h6Z6Sg8Z3QiBpirJS2Y3KnvsxcSDAYuu+i9rTIjD06mtxp3PYvcih0BB92WqLqV3u7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472345;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=zEk/fVzROC4wD3xuMlUk2KD0H5ZpB6YjFyZz1YUQCNk=;
	b=pKFQnRO5exaKiB45op2ANK/nGiO9+jakwnXYsKuBiX6MfaDZKKk9ktAGBYdxPLXq38P8
	 RlHDpB7/UwF0Ie2T8GRON+ca7D+hfJTAz4RspwuxVNOaT4Vz3idwCkOrQm1oCjQhfNFut
	 ixF79UkP48txZZQk49GHizQr9n9pnZLgU5UDnSqvgs6bp47VLuoNHaIgA4PJ/Wmygbo2d
	 VSO0+75Q+8vgmixvjPMEnOmSZaGLWJgM/iiE6ABqcfa7d5usKRhCjG7uIIdk9vM603Q0q
	 bCbq32gPU/hw9Er0PwuQcg0a1Imo5/jhPZre/8eLe0AP8AQhZZ58JUxKO4D2ouWGAow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GI91eWHa;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZtrWmaAr;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2A9606A32D
	for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 08:32:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD2A9606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GI91eWHa;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZtrWmaAr
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC53pLS3477100
	for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 08:32:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zEk/fVzROC4wD3xuMlUk2K
	D0H5ZpB6YjFyZz1YUQCNk=; b=GI91eWHaywUHSEc94yy+dqeoBtOBuGh2mVA07q
	YlDeXRMP7F6rLdmOqWngdoPoKb/r3gE5nNUXYTKtkqWblHuvbAs8D//1f8EVuaCP
	PfamF0fioLvN+8Dqn25UZYJJX1hRsMWjUIM3CCld1wssHqpUbtFVsl6VEBExSdGy
	5Nwjgatmx/23rVgK+IpJkqUrjwwaJFCLfX1F+7zGRIg4Aw4DCMMN4Wnm2W5g7AYo
	D+hH87+nhiNdboFqeFb8d/w4RdT8X7NfpbPsbku7bQs3n5r5QopGSs2tgfNYVoCK
	Tyvi3UqQRjpoEZ/7OWZi2+ae1in3ACHscsawMoD4CFvOKkEA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw6yugpru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 08:32:23 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b18165dc53so2335307a91.3
        for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 00:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794472343; x=1795077143; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zEk/fVzROC4wD3xuMlUk2KD0H5ZpB6YjFyZz1YUQCNk=;
        b=ZtrWmaArbWrsW9vbjSKS8UAK9p8YCchWxMYsJ6kyfhSkq42QTkTsQjl4OP6wQoZ0ap
         OPicABW1TstXU5AmydQJAQd6UjWmClsK9kuunp7TNyvneAVYP8BjMuXhTeWNzN881BBI
         t2xOGDABvlGP6ajLXEjMojKkRDnNIZZw7NVpImC7boRtN+3ai3CxYKgZQvrc/3+UE1al
         nimo/hbsqAGD+EQ8U2S7dm+MVG6k/cHC2FbMncUNnwLI2ZZz+nNnhP5RXh/V7hrE8p7O
         8f+TlrVRQb967I1/tsnHH+dKHUUQxwFxIye4DqTI1aMR+9eZfoyEpkglvpWS42ikN+9G
         Y7Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794472343; x=1795077143;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zEk/fVzROC4wD3xuMlUk2KD0H5ZpB6YjFyZz1YUQCNk=;
        b=sAFB+610NBp8tGxck3AQuoLbYulcWSAcNfpea/jhdoUOpPACAOvFBZY+aXf3bWgVNO
         GuUXmnjndXdY8mBfC040mUZnBS7EhbCAv2P2YDTdopx4DaNnPNAUHbDeXOZ/Y7SpY2pG
         hjMg5/PFOmf4GpISekjdVhva6O2PHeDBZ5I60f8YdQyMvQGHj8uWDu+bhEs6estu05qo
         oUWsedY6bXrrOVnBnk0zY5q/XHgkOJrybY01V8ToRPLn7b7QzpnfzVE26MpVb4auYNkN
         Ec9B3uRB9n/SvEiIu371aB6kxPQwSEDOo8mkT0/+8jQ7uZwuhB7sruN/xjl55bj+i352
         8YMQ==
X-Forwarded-Encrypted: i=1; AL+hErEeXNjZxHeMO4pW/Rd+yXbe0g/4Hzd3+UD+LvdGR/VYoQL9Zp7QquVJPEyZP0rlOPr64lZ9@lists.linux.dev
X-Gm-Message-State: APuU4Z8lYQVkI+3VgJIkVAGQvFvFkylj8fPHk6+eSOnFUoHdjbJTaH65
	4n4skPZwLjmjlOKmmZ0o8AFZZ3ykBn/GG6LzJi0iPBTnmmUWgL1R7ftg8Ja92Oe4hc562khHBTU
	AEVNQvWj+f8kEE+8ybpiFQ9VQf9eOpQZnmAqK1SOL9Oax2y8P2Bgm28qE
X-Gm-Gg: AYBFou1RfEuDRNQ7MRIVUSYBuRrVPVKaA5IL7TzPn73CiISfnvdb1hYuwveirlyD8nz
	1l/nEfI1purdlDf0/GSiYKzqH075e26cdczG6ikp66UDbDSOyBtngUQHcGas7xPv4tCvdTV0zXi
	ZbbfmoScKV2oucK5DKl8UKnxfYPmFoCR+37wG9aktG+1YhcOxV4KtDHpp/u6rYlPxFmWvCUWLxZ
	woEYgf1Gzeky/Hkr0TTzjxMPFnWWlerjGyP48R0L09fPBx2TDx86YHbljvCNGo6w7shJ3KLwP/k
	ZK6d/a2uT/er0mgnoj1UImGF/m5Y9FiGTUobfFMxA7qY1P8Q644fK6aNJ+pVC44Iu7Q5hRA6uKI
	gZHwrx6OxXCw6WhTpmQZGqnYhAV8tjTpBiFuDBMItqUMxUO7LBTQJDSHJ+GMq1EhXT10Hc/dXgf
	Onk8YX9jlOAhMyexSmNoBa2uCBMJVU77lGHGtA9tdoEBCFLvjR96uFxLAK8hCCGdfVpv3aMzDBX
	A==
X-Received: by 2002:a17:90b:2f04:b0:3ad:c4e9:7beb with SMTP id 98e67ed59e1d1-3b182ee3b45mr4552160a91.43.1794472343068;
        Thu, 12 Nov 2026 00:32:23 -0800 (PST)
X-Received: by 2002:a17:90b:2f04:b0:3ad:c4e9:7beb with SMTP id 98e67ed59e1d1-3b182ee3b45mr4552128a91.43.1794472342533;
        Thu, 12 Nov 2026 00:32:22 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce55c1sm3518029a91.3.2026.11.12.00.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:32:22 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Subject: [PATCH ath-next 00/15] wifi: ath12k: add initial Wi-Fi 8 support
 for QCN9575
Date: Thu, 12 Nov 2026 14:02:14 +0530
Message-Id: <20261112-wifi8_qcn9575_bringup-v1-0-3f30fbc2bb69@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAI559WoC/yWMQQ6CMBAAv0L2bBO3hhb9ijGklAWWw4ptURLC3
 yl4nExmVogUmCI8ihUCfTnyWzLgpQA/OOlJcZsZ9FUbRNTqxx1X9cfLvbRl3QSWfp6Us4ascXg
 zSJDbKVDHy/l9gkuDEloSvP4mzs1IPh1b2LYd5n0X2oMAAAA=
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
X-Proofpoint-GUID: d198wgLXJPhAvCfKrLVXpO8FqpLE8YsA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfXz72hpEBzgN+a
 wvE7argeQFM15NhGJ9H/5UtV5aQqInEuaYfSKuOMVM1Tqj/L9tS2c2Q864jU6qCabvE3qaQkNyj
 ksK6EHBUi23xO9ZPg2CbjUpItcWI1g8=
X-Proofpoint-ORIG-GUID: d198wgLXJPhAvCfKrLVXpO8FqpLE8YsA
X-Authority-Analysis: v=2.4 cv=d49gWhjE c=1 sm=1 tr=0 ts=6af57997 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=uhRKEIYKi0VZnCLPkisA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfXyNbk5sG6K6wt
 Rt721Ipink6XrAslknpKVhK5528zPG03Px07OosBDRU990vP+23EvMrQqC0XUaW8Hxa0wUcgvuG
 94gQPjs3Zmn7IO3v8k2Z84wiW6zzrmE03Fceq2x1cazkvAvme1HI60w6OVXnR3Ny4LV5ZGkAGTT
 KLgeqfNOLdy+wWKsblzXXepNqQ9W8N6YuRQwzMF/7VsVrqZgxNM/HRKL+9lxNdYigcYFL0ThDM4
 G71EzGXDjxPQ3N11Qg1gOAVLTze/zmwP/qvLto3loCwT8ANDeydN3EG+XF43z8cOMWka8rp7xJc
 oCKe/1w2hAXRTmVHRElC/E9UhFn7sVF4rggEKBKqg8IRfLbwapcdfvDhJUnplFmIRTcHqWlb26O
 Ewr7wmr9X7OahDRpsocehdQyYoGTLhdNRPBXkYCnc2OrEEqnlMwkZHYCyb3vzgdkc97FrlY428q
 uoFBBNi/X7hmgzA+G+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 clxscore=1011 suspectscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120033

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
 drivers/net/wireless/ath/ath12k/pcic.c             |  22 +-
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
 38 files changed, 2512 insertions(+), 59 deletions(-)
---
base-commit: 91d8a01977701d10b0037e4adfcec21d8dd6d48f
change-id: 20261112-wifi8_qcn9575_bringup-a76e76a1361e

