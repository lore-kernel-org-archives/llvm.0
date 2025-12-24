Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81DD301037
	for <llvm@lists.linux.dev>; Wed, 24 Dec 2025 11:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766575392; cv=none; b=LvwLZoyB684rUP4H7m/Isd/LpiB6PVUxAgUOGDqeseK8NNsS53K1s8TG45QIb9gyGLIRRDqH09KxqjILWTuhwaWzZz2LZJgE+u7rI+wcK1rhx/QXFRJ6QQg5a3aJ/dhEl6fFWLYhYg4VAX+XnRja4Qu4VzvpFVpCu4xRBCFMFXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766575392; c=relaxed/simple;
	bh=ZMVOyXAKDHXImMTOExvhVc/+4OkDYf0+fZoUxWd2zlo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VksInIApZ/rum5T92vBfm/4U5Xp9m9bRymUbh11z2mX5PvbJHPUvqWsbb3/95hmwYJbeL9l6Gtfnd6sJO+y+mN0UJQVpgVSZ6iG1vBUhk2j4BjWBURzljrrxLaYmQFL86OibtSN+xeKfWU/GX6aMgQgexUAhIVtGMyEg/aOw7AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FmUftDGz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ob6tzcVW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FmUftDGz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ob6tzcVW"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO9pupu561263
	for <llvm@lists.linux.dev>; Wed, 24 Dec 2025 11:23:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=sdLS9CEE0HwHJgDPYNBXXmzaVvIC0AYTFVp
	9ie9xAzQ=; b=FmUftDGzUUPaZTt14QFfJqgHnbbj6oOuRZMj7MVTF2WK3jZiyy4
	71UVJDy4Jlz7Ov7KucB0+FpzLD25K2SeAEImj8lWbBGSUSeq5+H8Nq3oy74sqm/S
	bJusd0qZZ0DvKYMY9sBmtB+LSxQayPMToMuvRyIwh+xJtaYf9SzE7zoG9DmGXml8
	0OEjZsv7d5dB2PYuVMAPIKuyanrrMwueAgwyCVcgCAzSkpcWmQex2afdNqGFs+Qv
	w/HOwKEowduYuERrWTh19vKpFdYntrvIp4in0vC4NxrKHmiNQ6SD6oCn7mwi9eFM
	7T01qBaiRUuf+GdGAqAdOfY7Im6UQ/QK7IA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7u9cucp5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Wed, 24 Dec 2025 11:23:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b245c49d0cso1351708185a.3
        for <llvm@lists.linux.dev>; Wed, 24 Dec 2025 03:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766575385; x=1767180185; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sdLS9CEE0HwHJgDPYNBXXmzaVvIC0AYTFVp9ie9xAzQ=;
        b=Ob6tzcVWCaCkB/eSl+/9c7K/9ClTHhJd9Et9ouNrt3DNJypTSz9bvpJfHzJZKF9vim
         BQsOMp4Fa4PKkxMoFwM0B65wkVSpdoeqWAYAzSQIoh0YQLI/dR1eSvQDYjvXgxsVbPPX
         avXQpSKPfNLC89qmYgZho/6uoggTaHXL3UcTtObwinNbIXkbghBqBhKQUnD7GGzORyUO
         cK77ea+ERxYpEs9cARLyCeZhid6kT5NBWg7TQvyqtyZ80vBMv0RQNm8K5PI6VjAOxfcQ
         H3sgTnAdS3o6tAyxmP3r7FEmtaaS67wJWG87PwOP2mhNdyVZv5+Fy6dX6rH7D2kkxC/d
         X67A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766575385; x=1767180185;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sdLS9CEE0HwHJgDPYNBXXmzaVvIC0AYTFVp9ie9xAzQ=;
        b=JTGxb8shyNUA9u2uHqsf/mpVrFwEMkQcwYS7QLKej2R0gUxFR/m/tq6egTchT23XlZ
         WCvuC0LL0+SwpW/RQ0WJdah/IQVG6LDoKUO27w1++h0y8PhqUEOw3foi6KCuKRIBQHmo
         lm1PdDI9FsqHlGTM2zxCo2srsJSn9Bp6MD9gQYNhDOUVAJy+ijvZjgQxamhgcldgNGLG
         O4ESewuacIPtzxLU7ZfYdq4h4qqsnEzUOw7hmuP8dq9Qq2TDfebAPqV7XurSbWrm7Ner
         34R92OrHfthxewrIMH3bq4DYVPEj3GEEeVkg3/U2sWlfPjijs/q7QQB6IPbAxBK0OCa4
         P1+g==
X-Forwarded-Encrypted: i=1; AJvYcCVKZF+AvZiJiDXP2OJ2feP0zTs6/fhuhPno7bTau9+xe9F+j8EKL037uemuldg8F+eRE83E@lists.linux.dev
X-Gm-Message-State: AOJu0YyrfXGWc0bbaGfQ00kF6zj65aOZtaMT3NRcxR6XQd0xEOptaZQ1
	mv13rxlKB61bSE78RpAm1d7/HuYmhtRvP05VP2IZuYbi7FjrNI4ri3n68zkC2I13InJXJCf65F/
	xCr1pegtMgw1GoBznEdiVjNexzU7ZLMVSJI4caVba5GaQmuyIjIT69ajH
X-Gm-Gg: AY/fxX5+4aGJnAYtcjo3oOP7b9Z5+iFaaGnpHWtNqjhprHqsWBeWvBU1fPWVI/CMjyk
	Fww/7PBx8A+tEpqqtACyBdUIKGbYJUsg1Sf3l218eORqny5oiF8quSmeu82YbQYNb+GU64jILeu
	qkIILViAZK11m9RDoc7rAkv6bPsNRyKWF8gZNmSTo5mzlIGrpNz0TwzVhF2BJ8uQnYjYqL3aOgK
	MfqPMSGg8ICMRRG0K5ReAewMDBlqCevuvj6q39Jp6BKulpbV7Wjv/QVtktH00EtxFcVQaQTCIFV
	aMXOzg/6FS+YblPsFF307wDNrNEVWncqo4DG7uOuIg4MS2I753Kd/9/MLZLVq3ilzaWENl5dsc2
	8mSmOVse6n4zbaqoLuGi7agCWTawBdcF9fUoN6lZR/b9pCwkpWdc4K98c6c90kalCqlAx/g==
X-Received: by 2002:a05:622a:1e85:b0:4f1:b712:364a with SMTP id d75a77b69052e-4f4abd9588dmr278045461cf.56.1766575384923;
        Wed, 24 Dec 2025 03:23:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IELeq6AHWkZvQTJUxbSXF13F6qpL5K/huUFrxvWFbhaAGm3AhlXEbdbvVOtB68sRTEW+yL+pA==
X-Received: by 2002:a05:622a:1e85:b0:4f1:b712:364a with SMTP id d75a77b69052e-4f4abd9588dmr278045151cf.56.1766575384487;
        Wed, 24 Dec 2025 03:23:04 -0800 (PST)
Received: from quoll.home (83.5.187.232.ipv4.supernova.orange.pl. [83.5.187.232])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b916b66e2sm16864955a12.34.2025.12.24.03.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 03:23:03 -0800 (PST)
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
Subject: [PATCH 1/2] clk: qcom: gcc-kaanapali: Fix double array initializer
Date: Wed, 24 Dec 2025 12:22:58 +0100
Message-ID: <20251224112257.83874-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1208; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=ZMVOyXAKDHXImMTOExvhVc/+4OkDYf0+fZoUxWd2zlo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpS80RA/NEfksD+AcDKiE4nnSKYnZrjTi1IJxzz
 HFC21yhUROJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUvNEQAKCRDBN2bmhouD
 11fSD/0ahVEkVIblIKo/HWJohvDv+/qaEUKSr522WjDaQGFoiNfDo04QHmVPOm3VC9lTAK6oIuF
 SvSSLB+N5rvWoBOgMTpYG/96BzT3i+M6OumFHG9A7vwjc57xBPfziHJRxbD9T4C4ijdCGGFdnpH
 WvQ2fPPaME/Y1VC19xUCVs4G6tWZK4G6Y+3G/ZpwUNLtEglzjKFUzC1xWlokI1b55r1hsT8JBjX
 THZ81Oa7WO1mE6AFyPEBt1PK+Ip1u7Oys5ouPUZvVt6KiOE5Gm7TqTHaKF5Rb6umyhw8F0RzXVT
 +l6hpMRSny0QvPLUfxQhlx6po1IOpSynFvThJ0vgCzWZpFwTqiLLaM6aw70JskOusZODc4rOlBZ
 fMz7jpsgBWwiWg6xts66CfqVTeKMtLT4+Vh8R9xe3qbu/OoafU2TbuuWAhsq1MwbLD0QmUIfYZx
 z27GtKEVvvz0aD0OZYMFAoxle57g+ucvibHXrh7BFryHY7aEUbBiwh+3TXWudbYlXMhvk1f1Sib
 yenVCcfGnJVYWF3oBWrMnSNjWLvNuVu5J8wwzlrm04XE0r5+065PK3rETvisWkI4qZ4gi+yBIk3
 xp+72jH4yEKWcHhEreSh9mqe60t7PBuStsQz9MBa0mtT+JRLNyTwAF5lFDe/1pHiUo5ehTJaz9W G4m7NZOSwXikdRw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: txurkAD0eblNjC6OJy7LmFsIABbHA7XR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA5OCBTYWx0ZWRfX9vWaqTU97RXi
 ahql42+IoA6+JmI9bUaws8n7BvVjGKdc+6+RpwqNq7wfyp+B2H3tfhNfJ1NTziu/7USMm56bhQM
 NzxxZ5mpeEwsUk0FEojlkdciSTHGVgRKYO8t+08gocmM7PYg+AdHtwuLfq/JfRCbgIE4K3O8wxk
 47EJHjskWKXzptU6NVJu5fHduezKwb8mo2cVFktEprwlK+8kShBN2T5VqatOWx/LtZ9cv+MoSfN
 8M7eFgnrU9/IjcgPaXoM8qH1kGNuiexInKBO0W7wJb8fvz2jJi5S9IlzG/Yvdd4V8xpOrheknsM
 bv9VJqCl4OsvdKOEGWEEioEw9/yeYmihG/1pxjWn5Gf01Sn72MqctoTD+CS3v0VC8Rdh6x08UCm
 7FARnVMG3GZJ/uod7gI6nhxj/l7HaigcjSrxMbo9dYef+oc0wT6BJULFbXXlmxDcBVNiDAW18A9
 SkSxinCZNrFYSiXOdEA==
X-Authority-Analysis: v=2.4 cv=HsN72kTS c=1 sm=1 tr=0 ts=694bcd19 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=urQ9wjG1USoGuMoDBEOPbA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Oyzp-MmrXw3c9cDLh70A:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: txurkAD0eblNjC6OJy7LmFsIABbHA7XR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240098

[GCC_QMIP_VIDEO_VCODEC_AHB_CLK] element in clk_regmap array is already
initialized, as reported by W=1 clang warning:

  gcc-kaanapali.c:3383:36: error: initializer overrides prior initialization of this subobject [-Werror,-Winitializer-overrides]

Fixes: d1919c375f21 ("clk: qcom: Add support for Global clock controller on Kaanapali")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Does anyone even build this code before sending it to upstream?
---
 drivers/clk/qcom/gcc-kaanapali.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-kaanapali.c b/drivers/clk/qcom/gcc-kaanapali.c
index 182b152df14c..b9743284927d 100644
--- a/drivers/clk/qcom/gcc-kaanapali.c
+++ b/drivers/clk/qcom/gcc-kaanapali.c
@@ -3380,7 +3380,6 @@ static struct clk_regmap *gcc_kaanapali_clocks[] = {
 	[GCC_QMIP_VIDEO_CV_CPU_AHB_CLK] = &gcc_qmip_video_cv_cpu_ahb_clk.clkr,
 	[GCC_QMIP_VIDEO_CVP_AHB_CLK] = &gcc_qmip_video_cvp_ahb_clk.clkr,
 	[GCC_QMIP_VIDEO_V_CPU_AHB_CLK] = &gcc_qmip_video_v_cpu_ahb_clk.clkr,
-	[GCC_QMIP_VIDEO_VCODEC_AHB_CLK] = &gcc_qmip_video_vcodec_ahb_clk.clkr,
 };
 
 static struct gdsc *gcc_kaanapali_gdscs[] = {
-- 
2.51.0

