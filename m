Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E91E32AADC
	for <llvm@lists.linux.dev>; Wed, 24 Dec 2025 11:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766575399; cv=none; b=tPy4LZiLvjLB4tuzgLTcR5AAV4b+A3lKWV0Vx2F+9uewKspQTiSFLm58Wx4pqGeKBVFpVdA71Gk5m1q0/OH/y5aZhRxvEnLaGCOSXawH1ySwtdIJ1U0+Y1Q4G7dRQJL2OIJhUgy4g140+KprxNwXeps5YPuImQtgtApH8oBiAz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766575399; c=relaxed/simple;
	bh=Zm/akP2QMYfOMOAkSkGQtyJ/nfOBKsn+htnYZWu96fM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XWOTt3nPj38uP7SYVben1NC22T3HKtZIF9JA0viyIeWcPtmsxgxKK6dr7ZsXepRwomMnhUTezVNzZl43csKSR4BXIsxr7dTfViuqNpq7Zm38qXdAmkjdRx1QUnBf1EAkNmFs6cq6hs61wGJ+OdbsU4H/i7nlHmnw9lZ/2GHfzq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Eceo8x04; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WSCGli3g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Eceo8x04";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WSCGli3g"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO7uCYw1056162
	for <llvm@lists.linux.dev>; Wed, 24 Dec 2025 11:23:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xp2tokjBR5/
	Ds73KOGXAHseytVAv33DVwCazGSdH11g=; b=Eceo8x04+wEgqH14ZRRiu6jCEZq
	e/kFcvBE51KJ2cHtOcavlYtkqWmNbPVmI3SPZfH/IvxU6HFH00tYmJCvLmqobqGI
	bXWQ4E+lGRq19rqK7jXfp/3CP8E/QFZNXf2gTp6O4RWjEcnaPMoYFn5zkQ5O+HRf
	Z2GKpQJc2GLlHHT1kDljyUBxJa3Q4G9fjHqFd0yWi+ZIMDAW9JTE5lLb40DPDSOi
	9wR2zBBetxO/T4tDY4u5qlNIzHv3FuWUuxUfXbdykkWsMl56nMNlmXQek3AwDLbf
	sKheU1aE3N9pWRXF4JJrr7d1in4H6n78awW3STV/qSoZB/QX5LU5ofQVf+g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b811v29sr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Wed, 24 Dec 2025 11:23:09 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed6ceab125so149553991cf.1
        for <llvm@lists.linux.dev>; Wed, 24 Dec 2025 03:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766575389; x=1767180189; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xp2tokjBR5/Ds73KOGXAHseytVAv33DVwCazGSdH11g=;
        b=WSCGli3gEx1Sahy32riznj4ZvW3Dtu7Qb+2BBFzsSPA7rBCLRWy/Tdqc4dqBCEu8dj
         sE9pjAhykvYipzNMieBJs5BQyBRMQZpU+Ow0ICj645IzSfEz9WmOZsh0nHi8xdpknVYk
         bJT54eObjkc0a5w7yhK/slTnD4b16++uTIWbPJ4fq4VzG05VZsbSFjxszt5JagLDNA0z
         PFzsZ4nfcFxbqumiM+LtxMCOsmJviV+F1LIMrvBtNPgmwt3KQPUaCTqMlJX71Iqulhl9
         +tHL7qL2a6RKlbtdNNgJudmnhbb22lg32zUzrhkYgUy8t7hfWuz1myp3WeRFYdH3s338
         paDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766575389; x=1767180189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xp2tokjBR5/Ds73KOGXAHseytVAv33DVwCazGSdH11g=;
        b=b14wSo6u4FpWNXAsHdOGme8CAaW0GJ/S5/qB4uiOv2nMG3BeLXNRw6TMw6jxrc2wYE
         5IZUyhMXBTHevx77Oby170JBoN76trwPGGfSruvoPYWBup8Ox/SRu8s3WXZjoW4AEuAg
         onLO/HV1e+Wc14yvGkaz36enVsOTVw8woWSJQRQ4kxBARZ49J3T+irudMDHO+o+fjA4U
         5QIeXyMbJs5DK0o3Fd8SDxLZHJHvxo7a+SFOgUTU375jq1pH4ucvBv+tpLJe97bCvWlD
         WeW3LfOxpQBV1l5+HqDIkZM4kAgLa0cXFsuicZRIOInOlkBbaj8M58VEJ/mQWgUPUj0W
         FvDw==
X-Forwarded-Encrypted: i=1; AJvYcCVijTKTKrR4DPHPPFUjOlkFnXcaS6zGVcKe7kHDn2zurtloblbqZOxxbWWxWl44i8YC/mO2@lists.linux.dev
X-Gm-Message-State: AOJu0YyICLPPVOBigRt51AgJQ/DDCdm0Hlx25U/hBfYjzF14GdqNmOaE
	mzlTHGCBDOeF0ngQ2ZaOYHxw4AlldMz3zAhYx0nZuIcAZWlfofO0Tj94IlQV4L1lT0XE0YJ5p+K
	rt5NA4mQ/8etNQ0emqb6aHe/yVeqmx2bOIscuzkxksoPOsu388DB8KV4s
X-Gm-Gg: AY/fxX4/1KHZqEfF8RvyesTyPt27jDyFDY2NticIFUkjpxx3N9mxO3dDt0c0/7AmLet
	D6NQ09RhduZklqFCVTlAy+qdudUXaKEKi0xrFf3ou/kjFAKXjfeMnYb6Fc6UDXKOsX8Z4zK12R0
	l0Rn+4y4R/e6hpPs8ihXblN3nMoZfGy8rNppzjdpzj89Ts5WHidkquIgzuV9xpVY9cGv/wzdGcK
	YQ23gzQZDOURME3SYmyx41u4Rm/RpdmTy0kcdxpMAZqrEZxQ4ZU1/2llm+Wccvj377y5U/m7AY3
	tOKm99mkTjzaT/VnVY+RISar9SMRVia/eJZe8Ws4XXTO8MYMtPwD4sLvEK2m26HN+cbyg17ZaIa
	FbTgnCKxoRyLGLO10+i5I5p/a7WlQTjz8P7FTJCW/e05uhE1rVcIc6e4NTikHEkT7v3/BwQ==
X-Received: by 2002:a05:622a:38a:b0:4ef:c655:2ff8 with SMTP id d75a77b69052e-4f4abdc8e86mr271359301cf.84.1766575388591;
        Wed, 24 Dec 2025 03:23:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFAZhNzCPpbfuRHFo8kCt1dyLtfpeiUSe0nyZim0y1do2RmBCdzbKh+s0OebDSicTEYJhzrLA==
X-Received: by 2002:a05:622a:38a:b0:4ef:c655:2ff8 with SMTP id d75a77b69052e-4f4abdc8e86mr271359151cf.84.1766575388241;
        Wed, 24 Dec 2025 03:23:08 -0800 (PST)
Received: from quoll.home (83.5.187.232.ipv4.supernova.orange.pl. [83.5.187.232])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b916b66e2sm16864955a12.34.2025.12.24.03.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 03:23:06 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] clk: qcom: rpmh: Fix double array initializer on Kaanapali
Date: Wed, 24 Dec 2025 12:22:59 +0100
Message-ID: <20251224112257.83874-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251224112257.83874-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251224112257.83874-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1320; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=Zm/akP2QMYfOMOAkSkGQtyJ/nfOBKsn+htnYZWu96fM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpS80SjPg4tj6o/bu7kxY0Wdlcf5Id919mddZAi
 Yi+Ks2FtnyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUvNEgAKCRDBN2bmhouD
 1zkJD/9H9e/tL4UTdew5TkS4zbc6mRFbtc/gFv+HjerfcoOGnfSn/std6VPIK/I6zytjYljsgrM
 aCH5ACGCrVGh9qNNyO+7sEVVcf66xocoPmh1yKYz0RIdahhyPO9eNuUVUyxYfFuuh2dbd8jpheR
 BoqAe1iIzFWo7Jh9b2G61O86crk0jBilJSEfx3xHRYht7mvr/O9RT7R2Uo0AHllMELX4Ldy9m/Y
 RuQ5xv0sC0WIwC5uiOlt9I287Ti6tBzUrDTYiEVzLrbpQc77jF65FkDlfzLE5NnzeoOeJDDpjlS
 ZsD6S9drUG3tMBTBRbzFzGEIOo9VF77TTdspkNDlksfrWXmWhQknTAZxF2gusRiJ/00tkTsloga
 R+VO0VXYTPWNvJcrm7EornfMkUGAgAchWfRIuCkrBQbApC5MbJ3wHiFtTkUiqijl5rw+t0fB8vF
 0/gC63vhsroBya4KV24npR/KFngcdLVNnGTrCcTAD9ZszTUnZugk5oi9WWS7lHUJX7N7jLKr818
 97obrW6pmyNYIMQ18rZMwPEzcWtahHFiscdgZ3prDiK+rf4nE8MYkMtMzjtasgJjEoVQz8qt+Mb
 m71pwUsp7KfCf1unXWS0/7n7VyHJkVtRTB340LG+hpPALnIq15grVBhvZMDwNNelzbnztmY1ti6 TyTwgUlMZ6VZycw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA5OCBTYWx0ZWRfX8FSDeElDzjNc
 I43NcCWseCDcDg6rVkLpCfut1DTPONeVOXWniv2uEWCQiQEbk3NGii6B1lcmWgGVfx6UWt7/hA3
 kZs2xn39e7AIZaiHSWYQk1ryPGFv0vSpsOsQePkVXdBQFCTAXT4qxu+DBvtOMd4ydOBHBQbOuOV
 AYn2gmnMTOZNUUMXbgNW+7ldsuL/rNEJ4S0O4AYTnfjl8k8dnypdJXlLrCEnlL4V4BzrrP2Hw2h
 3keOiRnBnDenI+7x9ANZtxZ46NdGJIJoAVOTzLJF6fXC+lbifIES1jj4B3V5D2n1+o5sIoKKN1o
 f4aMCbYTKv4Uuyu62dr7R9FxwpV0cYEpw+6b32pBAr35mHEnaQUhO1vJV5LTafbmC7DYYpLzhdt
 wEATxVuY6PqinXk8B0mRm3Bs2pQr+X/FY0/Kg0loHjmoThZblaceeys7rldb3BImC/NhypyLA9+
 iGr72q8g5UJ8pU3Lkew==
X-Proofpoint-ORIG-GUID: RfpedzTYV4oNgBaZ6FbwSkZpaGKVEG8J
X-Authority-Analysis: v=2.4 cv=WegBqkhX c=1 sm=1 tr=0 ts=694bcd1d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=urQ9wjG1USoGuMoDBEOPbA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=JRV-5dCbPcj-iadUDKQA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: RfpedzTYV4oNgBaZ6FbwSkZpaGKVEG8J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240098

[RPMH_RF_CLK4] and [RPMH_RF_CLK5_A] elements in clk_hw array are already
initialized, as reported by W=1 clang warning:

  clk-rpmh.c:932:20: error: initializer overrides prior initialization of this subobject [-Werror,-Winitializer-overrides]
  clk-rpmh.c:934:21: error: initializer overrides prior initialization of this subobject [-Werror,-Winitializer-overrides]

Fixes: acabfd13859d ("clk: qcom: rpmh: Add support for Kaanapali rpmh clocks")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-rpmh.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 10e84ada48ee..547729b1a8ee 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -929,8 +929,8 @@ static struct clk_hw *kaanapali_rpmh_clocks[] = {
 	[RPMH_RF_CLK3]		= &clk_rpmh_clk3_a2_e0.hw,
 	[RPMH_RF_CLK3_A]	= &clk_rpmh_clk3_a2_e0_ao.hw,
 	[RPMH_RF_CLK4]		= &clk_rpmh_clk4_a2_e0.hw,
-	[RPMH_RF_CLK4]		= &clk_rpmh_clk4_a2_e0_ao.hw,
-	[RPMH_RF_CLK5_A]	= &clk_rpmh_clk5_a2_e0.hw,
+	[RPMH_RF_CLK4_A]	= &clk_rpmh_clk4_a2_e0_ao.hw,
+	[RPMH_RF_CLK5]		= &clk_rpmh_clk5_a2_e0.hw,
 	[RPMH_RF_CLK5_A]	= &clk_rpmh_clk5_a2_e0_ao.hw,
 	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
 };
-- 
2.51.0

