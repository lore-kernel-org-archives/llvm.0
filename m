Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794982759;
	b=qnH6KsbXc0wURvPIXPUxgotQTDlIlmYvPKA2fSvRD1jp7JURwt1CS6Bldp42rv1RKotS
	 38IUVfztJKxT3T5kL+9bO9aLthQzCKksjOGQgSZVcHkwguWkeO5il0FWmoXnRCP6yqHTD
	 lhlfpAJUUUdXuCqTKyXFUb8/jfh2MC2d9SAgHbjG6pNDOOXwABJpSINV/d3SYYErF7Ydo
	 a+p5vECpbmkQSiS67kShogjvZnPb8PnWISYwLWMGQZ9lqXCKn/gC4MH+IGoseehWI1OUq
	 dN1XPQQQXe8ZTvOZMFuKI3dV12UtzpJ4acC1U/UAw7NjoheCxgIRpThLJ5Xf0Xc2Ffg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794982759;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HqKauYN4nYFvfrYHZN5AaX3xFfqq8PfM01eE8hOHnT8=;
	b=W+pUaZ2NE1iUNzOKeIySJOdXCCm5C5GeDv0MbqzPVwwnyrzFkepNMTFz3hJpeI4I3wx3
	 GTm1+Dy+W+28ITNRY0uMsn0ydqQO8VeRkPNe6DCBRWNNTXjFMoKspsexcdYzFsmAFquBZ
	 MmDEpMqvQIbADk4HIGOEXCLvvh/qetJoDLIn6UIZiSd0WJoiCH/bChwQI2buIg6p8420I
	 igQxdHFXp6RATJpg1zWZlMQZfnQjCeqRy8akShksm7SiR5oLhAnPrvNU2HVBTIpHIt2Dk
	 +cQV8zJQgcsegNg3ZcpBS1W0Ab9e9tlmV9UIE31bXL+aW2eK+dIKRBqJ+F9x3lmrqkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Do76T8LS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eZZE99G1;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FE6606A33D
	for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 06:19:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81FE6606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Do76T8LS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eZZE99G1
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2Uv5T2453547
	for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 06:19:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HqKauYN4nYFvfrYHZN5AaX3xFfqq8PfM01eE8hOHnT8=; b=Do76T8LSF05wtpgg
	Gt11GH2PLpKktrmfYjxLGxCINJ6jNabvTRQH4fUDsv/Y5iDCSpGE75bwfFRdSXJo
	MZTfJiGGZMTSqPN6brfN4ZjUmDCZ+CVjy2KiZt3mTGPfXXBbgiJ4HAcIFATRsUk2
	0WvG2jIKmvkb/7Nw2fGqTnSXki6AEhw+4BVSLgrcoUDYi0FUZGAWqlx7mR1qNWlz
	myG4kbx0wmJ/pmExKb65ugjL5zipXiCjfEnZQoPz0urufdOfPk8QBzurCLQaIs2N
	NWrqQfa+s+ZRCA7+HNmnYzJNkEAGpvtyRmk8P40r1NGKFn1C/uLsCLkFo4rbEaml
	O2hNaw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv99gfw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 06:19:17 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b175a69ab8so661866a91.1
        for <llvm@lists.linux.dev>; Tue, 17 Nov 2026 22:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794982756; x=1795587556; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HqKauYN4nYFvfrYHZN5AaX3xFfqq8PfM01eE8hOHnT8=;
        b=eZZE99G1H7CDLwMPpm1hbRIyTBygnsCAIpiVp0DuBGrP/Hv8EiSNcgZeoAjkrtAvyv
         l7PoXHIJWSUK/N2fxwQzYQB2T+MV5ayQ7/5DdcEAnXUuV676WIymiMH3t+t0nJ7FlRIs
         p2Qhpqc6wH81mWy95M435mWZQgdFimm9JTehE/qa2LwsxVqpuU7JtBZGwPrbfaHEyc7B
         HzevzIT2PQ+IgOqgSTKIXlgFJZ31fOxRMi/VoMn2dzODsvdYXBPzOkgzgkTd0CUzHk+W
         /fdiisiiKDeMFzTLzb2GSZvfvDJAhsIzdanK4GSNRj5eCsPbU90h8iwmMxnwSiBPTHbS
         +OAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794982756; x=1795587556;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HqKauYN4nYFvfrYHZN5AaX3xFfqq8PfM01eE8hOHnT8=;
        b=AOJhLsiDEjecnH6vRVvaKezWZmINCngz9734MBvzoh83nw0LYS/0INhRhZr+RI+Ter
         wDbIo3aEeyS/I5T/WS2Hz7qJ+NyXz8A13UAwnmoKtotNuU4tEwZeh/0NQpNzJz1R1gdj
         ItXzyk9ILNnFXvAHolCb6aHEphNHblwwOz9ujVCBua61+OQht0V+JjC8NVGc0Ou+uW4i
         HAoVuAYrTkwXNX1TucKihHyr2uwUmr7U81QhW6OfnBQyWTU+psv/DXRh/zvAD9pmBpWC
         J89jNSCWhm2cl2pg/9KxJBVSKDQEDBeK4VmEC+fUpLufG7jSXEXpxflbSkbjGlfC7jdn
         DpxQ==
X-Forwarded-Encrypted: i=1; AL+hErGjrIfQa9kRcbNNed5gT94U0HZtHK7UC1dYcChaSEvc5ao5MwACg+E+6e2AMH9j0EPk5EFI@lists.linux.dev
X-Gm-Message-State: APuU4Z99Ghx3BuQkzR4Q8UwxYIGhLn3OuY3OM8mnul7cL0ZH08ajrG9g
	Z8QCVFEjKYR61wMZ31oU9woUK2r8WCvqyAmFzhimiLFIDwRR0bbIX+Ss2Jo/rgUKcu0Pnamf8dp
	7c4oPA/fWpB4xFa5Rv8FnLuhxgjqwayEhoCvkKYxdE8BhhLv2jtHV/aHL
X-Gm-Gg: AZFdTZcWJB3du4IkNcyTzETrLtW92NQckImg5nO6afeYt5/a6rteFGuaXQPIZRXtaBg
	N6iTwIOUUhsEqJlp8Y2IV9yhmGZjGpqMKF6EmMMLT3vQbG8SZjtgA0d7PMIRtlJDSCFYDzBTVeK
	00GQNo8QUk2L2YgFEmeVsq/ofeDu27i+xXlQRkKiSep2syftzFIs2NKXMPNJ8bxXs7KKZBDJH0Q
	sqCj0uDwtuUWAbyHUxjhF5q1PaB/MRelr11G/TrofGCwwf/BvCxGecW4ZFjcEbE2098WYOznHXT
	9sXMH7cf3H88ujT+F83CKXgd9pIrJjAzQ/zqxzNQ2Bq2qScr6p6FLLjKoR6pX3S9SWjxANp+vLd
	lLTxp0eIvpdXp24ymbmW4H350R/aiq9/UYwsYYRhlebnGpaX+gQr6UpDbio6mcrPAStb6RkM59D
	mEhXI1i0NBQooChAataC9JlSTaMUMzXSzU+fx7MAERqALzSyz3ciXPHgnL3RgotjBy6+u8B+7Wr
	9Y=
X-Received: by 2002:a17:90a:e18c:b0:3ab:afca:1d79 with SMTP id 98e67ed59e1d1-3b3d074db1amr1569833a91.21.1794982756191;
        Tue, 17 Nov 2026 22:19:16 -0800 (PST)
X-Received: by 2002:a17:90a:e18c:b0:3ab:afca:1d79 with SMTP id 98e67ed59e1d1-3b3d074db1amr1569814a91.21.1794982755695;
        Tue, 17 Nov 2026 22:19:15 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac255634sm7395464a91.5.2026.11.17.22.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:19:15 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:49:04 +0530
Subject: [PATCH ath-next v2 01/15] dt-bindings: net: wireless: add ath12k
 wifi device QCN9575
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
Message-Id: <20261118-wifi8_qcn9575_bringup-v2-1-d81a3046290e@oss.qualcomm.com>
References: <20261118-wifi8_qcn9575_bringup-v2-0-d81a3046290e@oss.qualcomm.com>
In-Reply-To: <20261118-wifi8_qcn9575_bringup-v2-0-d81a3046290e@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfX5NiRC66jPofN
 dtgbc6SqqkSBblRERSLkBZrgD7MAHzdgHTOUZGTaheGjNGHYiQKrbRZIGCEaUwdCP6roJZQW5i6
 A2dOSREElZiRMWWheoD0SuyTfFtuz/w=
X-Authority-Analysis: v=2.4 cv=acT0Dhot c=1 sm=1 tr=0 ts=6afd4365 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=cIo56A7EWjM9ht75lhUA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfX9uQfBjkgxjGz
 iy/qekxDbqXXR3ooVE+nfyTYdfk+aVQA9EL5u941vcOmzIfPuxZaegAqpQv7WpIVpaLLI/Pkiy9
 jzHm3F4Iv7HtehcpRe2/WMr9Vwu1wezcqlh/gJzZOsaYt/UZToV5ys9Pl/kNSWzqAkSgGoQl9Xl
 WfN9mJyX8VKG8Spfh8iUqvou16f8VLTxwJEr+/x1bpC1s5VdY7iqiEkHMsY1WPl/WRRWt4v5XVU
 XvJMw2W0XE/ku8755uDZ7L0bSUIL36vI1IPp98xdF61YDdZgW+HkrG8QLPePVr9vYta4HMArvTL
 USjiha85m1tsfKiHexIwsqSq7fGplfRjaC3QgXZp3gz5pMMOxyEUxBaLz3GE4iVPET33C9YTICG
 ik3mEQTXzNjSkZaXZJaizKSRbHzGaSqMiPFo2UaWvnqtHmzlT0D9BsZkW1ekR6Ju7WwN/Tpl396
 B2S5XAPcQ2ZdjOeFkdA==
X-Proofpoint-ORIG-GUID: hIyrlomjURuG5nw1DAg1ITSti6Okz-rr
X-Proofpoint-GUID: hIyrlomjURuG5nw1DAg1ITSti6Okz-rr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180024

Add the device-tree bindings for the ATH12K IEEE 802.11bn wifi device
QCN9575.

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 .../devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml        | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml
index fa64c8aa56f5..dcb846258e47 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-# Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+# Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k-wsi.yaml#
@@ -11,10 +11,10 @@ maintainers:
   - Jeff Johnson <jjohnson@kernel.org>
 
 description: |
-  Qualcomm Technologies IEEE 802.11be PCIe devices with WSI interface.
+  Qualcomm Technologies IEEE 802.11 PCIe devices with WSI interface.
 
-  The ath12k devices (QCN9274) feature WSI support. WSI stands for
-  WLAN Serial Interface. It is used for the exchange of specific
+  Some ath12k devices (QCN9274 and QCN9575) feature WSI support. WSI stands
+  for WLAN Serial Interface. It is used for the exchange of specific
   control information across radios based on the doorbell mechanism.
   This WSI connection is essential to exchange control information
   among these devices.
@@ -48,6 +48,7 @@ properties:
   compatible:
     enum:
       - pci17cb,1109  # QCN9274
+      - pci17cb,1113  # QCN9575
 
   reg:
     maxItems: 1

-- 
2.34.1

