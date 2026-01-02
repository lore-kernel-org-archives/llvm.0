Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA28314D0E
	for <llvm@lists.linux.dev>; Fri,  2 Jan 2026 12:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767358194; cv=none; b=IoXD0pXK+cwqXJPvDtEV8PTmbkt6zHcBqem/RfvlHB/XsNNB65VrltC6IgtJHz30cLWzqWk7ZZ9hUNprWowf030uIQEzO5oLl9GORo8JgeTSvGXangGJ+jUpNwyx8Q5lCFMRJt6Wjj4qi2W4KuaJDrq6EbZB0UMpUR64wzYhess=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767358194; c=relaxed/simple;
	bh=nDvM2tNc7bhnswWwCc3vXNDXP4C1H2W2zKaXu5ozTQc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hY5F0AONWoU73DEbPwXsb+8TOHsuHAinjuxTv+1pEfqUbKm3+lRV/8xxYX8fqlHyMOvrfo6AQFQvml+r7Gf/vVFuMe7s94yfNpEpIDQ/c9Zk/JOhrBwA1Ax1jwKElQnd95+1D3UAvNn1+geUNc7DWwzIA53//D3PBm0fQ0PNxqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NdVIkrRp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X1WiQ6Pp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NdVIkrRp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X1WiQ6Pp"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029W2Mh426884
	for <llvm@lists.linux.dev>; Fri, 2 Jan 2026 12:49:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=I1PTZZIAa0t
	EuYR+p5xJVPIyMtUwfOVI7eaAwzoH1zQ=; b=NdVIkrRpWMfGZwnJAKnLYdnS5Ub
	PEbC6QWTYdCXT7UCQ430AU3n/u1+42O6c95zJeyXmph7rWOIbX4bLcbo5+x60HuJ
	b0UMaCGmTNu505s6Lg1jtpRy0iFgEBBRG2Du0gpI7CN9vjHimUAZQgXqAoO8R8gW
	OLZwmf2LPg58YpQgyLplTpLvjaSrLw/OivD6brb9tXhwMbTaU6tr1dmJsdOMkbnu
	a/7uRKgLv7A/VFz0RURgoL/MLl0Jxrv85OTHeFHOlQ/HMo9ho52ArSN4RIbHNSsO
	hl5bw9QRz62S1egdgIRvqANiOL5wQYJm+o8lVzZzQyPm3MVDxOo2Bf048Bw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4be6fjrxqt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Fri, 02 Jan 2026 12:49:48 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f4d60d1fbdso374423071cf.3
        for <llvm@lists.linux.dev>; Fri, 02 Jan 2026 04:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767358187; x=1767962987; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I1PTZZIAa0tEuYR+p5xJVPIyMtUwfOVI7eaAwzoH1zQ=;
        b=X1WiQ6PpJo+rF+fC01PEtBT3j9boTm0RBeTBj6Fdsh6xxZIw+OqAClgq0AkbXqlHcg
         oVDEY7/N/IN/6YEVoHx7lLKaSDh2uIDP1r7bJASjVE0dIGwLNJvR9Hk4g7Ici7c2jdBw
         p/p5yHzT9WWmmO9rM+PxD6ZICI6L2Ncni+fch+vsOhuIn0/R/VGeBvYXziGNaMdxQGsB
         Dl/SFDRpc1Ism96HPGBnK2Wt8bbO8gna7IirQx/cXqKjT5WYOVxCdJk7NIh1ny3uIjKk
         9aMbGiOF3c+3KAY7J6MpQ9zjYirsUCOqLChkxdwe/6LrzJaC7/gYpu2yC/SVxK4DioqP
         8j0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767358187; x=1767962987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I1PTZZIAa0tEuYR+p5xJVPIyMtUwfOVI7eaAwzoH1zQ=;
        b=GweBO/Wm02762nXgrDWd721n89Z7OGpTm0n8GT69HHz3g+QwKPh5Ue8dCnTuppVxet
         LqGZTx++lazRzkKhWhtkwSOrIKjtgCuDRtjhdpnVXeI7QAcShsb/pxvmgWbUPoJxRHjH
         dC3rOizO0UAlNv2W7KDI/vJyiQ8m0Z+N3gvU6zWwNd9kgyKbjb4qrunXOvra5mWRkMby
         qRGe3q5nPSeaNTxUGHsz+36spuypwPrZCd2ykkcf6zyKqHfN0iW1MPEBMkQ5WIN74Dmi
         5GrO775Pg3doyMp1hAh1YNLUchNyUygLWahSVwD+VoEepeud+01OB2QZt6JsYN2ldPcc
         o6Tw==
X-Forwarded-Encrypted: i=1; AJvYcCUlhQySPAAgHqJJYvX1rlMktHbMKd+dUowGetacmtbdxvw6hF17cVTgSO0DxTYVdUYvZM05@lists.linux.dev
X-Gm-Message-State: AOJu0YzhWmn41SPAGk5sAmb09wWEvZzODgy1v8JwALHeOy9nNL8ZRJPs
	t7aObUvzZ4UYsG/XThXUvG6xhUGvi5UNCJHDeRZAIvx543Uggkg+/vHcvGCieJ3Cy52MvWQ/xR5
	9wPOfqLwFN9+Jv20yRuAg4u8iuG2up8mudt9PZxj+WG3JfrhmKObzYtlg
X-Gm-Gg: AY/fxX7pMKJM8QXeZ6J6zBuvgKkQKsmRELWMxXVV38gyhjwOKRyKbslEOhTTCaEYDhy
	PyhWaEylwq1ZXuADETU1EdMTe7QcVcwx0bvwEFoajUEDI9Y3XiDTn1JlDOfy19kd+SYAVWrwQdL
	7aD6rHu2TYDlW0KZddRRqaxJgC5hwYq3TF7Bpv887mrR8h4tsbvjyp1VBVhwpqQZFdPzmRSJASj
	W483JVsXNuobjYckj6PuEVlsxiUJSw3vWH1ZdtM60mhX2DOXV5pPIwRbMcognsYrgPTkvYvMJtb
	eLlHKAHSmk/J9/NKNGTkUBr2O4WCCEHi2MW9eiSfkRvOmjbZBgDrtILiC9B/xgVGe+PnBQT3+30
	EXKCdCqHjwoq7AWnqMeFHMgDMyA==
X-Received: by 2002:ac8:7fc3:0:b0:4f3:4bbb:d5c9 with SMTP id d75a77b69052e-4f4abdca1a1mr687187711cf.79.1767358187640;
        Fri, 02 Jan 2026 04:49:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGPjxg3lErIClyj1q/c2QA920cSvN+jNUa0YCVQZucLeQ6j109UB9otuPfKDt7/rt2bIeq6Gg==
X-Received: by 2002:ac8:7fc3:0:b0:4f3:4bbb:d5c9 with SMTP id d75a77b69052e-4f4abdca1a1mr687187471cf.79.1767358187278;
        Fri, 02 Jan 2026 04:49:47 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82f6asm86385833f8f.27.2026.01.02.04.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 04:49:46 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Brian Norris <computersforpeace@gmail.com>,
        Kamal Dasu <kamal.dasu@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Harvey Hunt <harveyhuntnexus@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Pratyush Yadav <pratyush@kernel.org>,
        Michael Walle <mwalle@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-mtd@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 5/7] mtd: rawnand: vf610: Fix Wvoid-pointer-to-enum-cast warning
Date: Fri,  2 Jan 2026 13:49:32 +0100
Message-ID: <20260102124927.64703-12-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260102124927.64703-8-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260102124927.64703-8-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=936; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=nDvM2tNc7bhnswWwCc3vXNDXP4C1H2W2zKaXu5ozTQc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpV77bC0qTYrHh193XJS6xkRC3AcCNBpx+8voar
 IeQOheWfXOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVe+2wAKCRDBN2bmhouD
 1+VED/9nCajKvFH2HUNRtSa685vy12JdBeXoLcJ7SzfTs0WnxG+r+r9cbvpL7vPW9ikOIcnnOCt
 DTBfkWRJmmggpB6RAkJOCxKswAStjMOQU+0gxkD+DrNfQ/L1CaG1SgR5BbNzIr1kP1HZey9J+5z
 faZbFmaf2NGpVGI0rM9cfbCadHzLjqf9I/a0Yt+WyEj8g8wRONlRkwVXb6WlXnb4hExlwbLaQXd
 EZNZamSXX2zZtNMH0xpCyPtf6d5sTpOlXq7gUghE4D1mj5+yYwQxZ0k6RUsfmpJ1GD99xdIvLO5
 z2u167lPzwz3jjRayeQpjgpI39gjdEQrp+PL3gXC7aAcYETamK5al/9Vm2fZ0ugmiAcn7DNlksn
 MGrA/CBI57LzaF2P6KAR7AZII5GtMU6tMHyrowRSadM8rk86RTov5Vhonfz337MMgIJ20kBsKTu
 pkWzftQMFkxpE/JHEAPjgG0swDDcrsoJcee3zYNEFZGBaegmqT2iuKP2FbnVH03WHSj0+LT6N4k
 vkcq2tAG3cC//wWZ3tZI0USZN7rGMkRa51i7IFLGriycgsmXMJF9dsxlNmUDBLIYl2QH5ST4fFb
 mFiHTog0RvCAwkOmy21hC0aFulT77OqoCwLkLnGapgscBfKaNTgS3g2q/aByvutYdczfoninGWA P8HQjOl0aUFIeMg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Av7jHe9P c=1 sm=1 tr=0 ts=6957beec cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=TpWAFCZ4qp-4Y20zCj4A:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: U5cIPAJYhRQW0RG-JzOzkVKcFMJJrIMu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDExMyBTYWx0ZWRfX+x8DwXGDR0q6
 imM1hoOqK3LR09TGZNtWKHlSfoniulDK2fPIXkCBUspMPpMicnfPZ5IWftJT47xqlNLArCsyaP0
 H9mjj8SPaiGZNl7k8N4t7OnJcIAD5B4HMqJC4IFmIxJfEs2zquBsmDEZhb/U0bUXqE7hnmF1/fB
 bNOV5ETf3KIe/9KODfPIxevEmEseHarplY5qWa5aYi11QgUX4PxlrHTXPf3obF3ANGlleI6EVjQ
 6Dq554lZ75phg+6cMyZD9qUFBY1gwQigPN3dFltaFKnt3DTVihRPj6QM2dgbwvFrOwuKn3/ovOV
 1PMq1FVULzcrglobl0lPIK4/LOY43RX1AKLo+ZyHkx7uojo9neCTx8u3yM+jF7znAy+CF9MC+gt
 hIn7gcUaWbTuPz1XCJtlPIZHjvqkXyMwkv3eicVyQsGpyxQxzhCThJ0KGQvfnfER8BHEDLLNdUG
 ez8R3FYdhmXSsG1I1Mg==
X-Proofpoint-GUID: U5cIPAJYhRQW0RG-JzOzkVKcFMJJrIMu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020113

"nfc->variant" is an enum, thus cast of pointer on 64-bit compile test
with clang W=1 causes:

  vf610_nfc.c:843:17: error: cast to smaller integer type 'enum vf610_nfc_variant' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/mtd/nand/raw/vf610_nfc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index 4b5ba3187853..1955dc50b40a 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -840,7 +840,7 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 		return PTR_ERR(nfc->clk);
 	}
 
-	nfc->variant = (enum vf610_nfc_variant)device_get_match_data(&pdev->dev);
+	nfc->variant = (unsigned long)device_get_match_data(&pdev->dev);
 	if (!nfc->variant)
 		return -ENODEV;
 
-- 
2.51.0

