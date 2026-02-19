Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BAA333EAF8
	for <llvm@lists.linux.dev>; Thu, 19 Feb 2026 11:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771500448; cv=none; b=r2PyPrj4WIp2fF5O/9BLEoQmOpxUEmeYMlY7eAchPbCnY9AZn6odKI5P2Q2rAQXkS5YXjSGWLT8ONyOum2xKOLxPg5DDSv7ssKwRxl8EkoPE0H47uxvKZRcKN7muV7P9xRvVRzcpOX0tkFpPiVdDkm1j6bbF+rItsmwJI5/g010=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771500448; c=relaxed/simple;
	bh=QDmpj9Mhi+yaAgNVbdMPNkUREhCivGToVpPYIMUn09A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oVQjoAX3UBqLD+zobHdxnIWfpV8UrkzHKYovGj+aGRuxUGUAa3+3QE5g2QYw1ZbP4SYz+lADJqxLQehlyKGSVndmxg5jhl2eDugVnuJyoQvzaNaeguBaS3thzSgeVMFM4s8nvDPBkmwroBnneJT3zhZlc76PpLg856BCVFyLVio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L2TYlkTP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nj7oKiwn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L2TYlkTP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nj7oKiwn"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61J4YG6Y422183
	for <llvm@lists.linux.dev>; Thu, 19 Feb 2026 11:27:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hy+BuVS0iLVMRmhvOck3ZxPEwiAHI2ibXjhBmo6hiuo=; b=L2TYlkTPyyp0CHuc
	Qd9a43DHIZveEBAUgpBJRkPft2Y/7HgTN/a6SHJ5vrvSTY8Wg9JKJ/IRDr1fgYiO
	rfedf/9BjsRlfmzNH4nfJ1aBMDVi7njvd3LxpprgqCLUg7HFG8KgjZh9ENfZB753
	mNz1N51XL3ZxYl+0qKVSgT83PYozzTA5bVgltPfewmW1e5H3NTf6RTxNjXmsihpe
	IIt6M80GY6V2zgmoLZhFYeTbZ7piwH2z2Sy7xbZN+MUSAoPp1MPaJrbCnVY1Dngb
	lMWBr1pjo6xSo1xvyeI3+73idd0wkcr/5uGurMt/DSNDks6/ArNPQqhWP5nDmjag
	Kc2Igw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cd76e494c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Thu, 19 Feb 2026 11:27:26 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c7166a4643so638122985a.0
        for <llvm@lists.linux.dev>; Thu, 19 Feb 2026 03:27:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771500445; x=1772105245; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hy+BuVS0iLVMRmhvOck3ZxPEwiAHI2ibXjhBmo6hiuo=;
        b=Nj7oKiwn3mWip176VUY28ep8GNvzRClv0yWUdXCPM9YfczfIQUdDzox+VfytrNic+u
         XiQ9MA3A5/qf43pVBc4z5w60Ek8e8pU1qZyGq19zadBhvl/H8bA6CqcqCvXDeBF1Fiz3
         mrCis6AZw3bGaGd/JHEuoafhu7pqtgoRiW2+hikFhZ96ey06waoP7RP+jNrMbm89Hwuy
         Q/C3qwizt03JMVL3pB3/apT22WMrrnipuvDSb0yogWqoifU8V8gpRoJfh3/KJivMv27N
         UIugGbdB/ylge0cFGPK83lSEqVdY1WDRLAD6DqjmM0D3HlwMbG0Tz7yMccZYeHupjnUJ
         kxUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771500445; x=1772105245;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hy+BuVS0iLVMRmhvOck3ZxPEwiAHI2ibXjhBmo6hiuo=;
        b=O6jbKwJ3X8lp+zcaXy3pUkvBG30s/dx6p+eJuOFFniV5s1hvJw94y1pxmf6DXSizkc
         oAdh/sbcHYntVLqiKxTGTs14f4Xwqy3m6tJxmhCulD8ZIddF9OBHeb67E5nyP5oMBTt9
         K2vnj6OD02XkcFvUgoUHxrw8pKD82kCYCLA8KfPY+4x73JhloKOv8JkGgM9SrTL/DggY
         fhQHTvyEeywzs+fTc/50EX5E12t1HQuuQqClYDTztMzyFCp8MuV/9qOSKjoCVNcH5ZgG
         JaShpW3Dcaoq2IC6w3C/q/2NBDlfKLdEzq1rqNtKuOjjNYh7+h3+HN0Jhp1hmS0ClRP0
         FJng==
X-Forwarded-Encrypted: i=1; AJvYcCV4zUfTMloDLyjry1ixuHo3UBk9p2wfyw+gni9ETxtJpczawbKFuHn+R7J4FjZxni0jmyXf@lists.linux.dev
X-Gm-Message-State: AOJu0YzgfM8XKNGUrqRS0PXTsc8jbYEH0lXGH0Qe2VUBMLkOBzZKooPH
	PiDFy4NkmhnJ+r3EoZAVXH/ZrYiTO45CT+02xvl5vXnwJDmGfGP2ZeEsJJBzua5HUjfiTkhh7Xe
	ffNmmg9KdElcekIjpksSWCPko12fqkrqkavOMuy666fiNPpJfFWHTlEoY
X-Gm-Gg: AZuq6aKhlQjirx9sCpnXXPFg6T2mO4YkjIxzj7qxEC38ezINJeQFkPatnUjgwZFKSfE
	Usce5av5ijFqD1Sn4co82lej+DLoSQzZrPXckA1BeYCZ5YlpXp3oq1Qc1tEvG/mRkI2T34ek2DY
	enf4/FViZGJFPAqtHqWn37NnqZ1rqUR03w0WAxFwXYVCatlAZdy6/rurRdK8u0uWPS0NOtdtmcV
	MpnIauTpGOUllJmVFY6+oQbZ2dvSObO9s721URRptJUZt9ru1k+YSmQbZfuMPGJDUbNzl0OpM9D
	4KLeXRGl6Qjlu8Y3BgcantHJBXLz1hdP98DNuxwWTiTfiyCLPUANaD5tI63q+vOA46WZXFPlilo
	fn/3rQGK8yLoCJQN4CX6zvXghCL7jMYvE1MMYwMdo3ReJcA==
X-Received: by 2002:a05:620a:4492:b0:8ca:4438:b8f4 with SMTP id af79cd13be357-8cb740ef205mr615679285a.67.1771500445319;
        Thu, 19 Feb 2026 03:27:25 -0800 (PST)
X-Received: by 2002:a05:620a:4492:b0:8ca:4438:b8f4 with SMTP id af79cd13be357-8cb740ef205mr615676285a.67.1771500444867;
        Thu, 19 Feb 2026 03:27:24 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac8d82sm48903796f8f.31.2026.02.19.03.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 03:27:24 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 19 Feb 2026 12:27:10 +0100
Subject: [PATCH v2 1/3] firmware: exynos-acpm: Use unsigned int for
 acpm_pmic_linux_errmap index
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260219-firmare-acpm-counted-v2-1-e1f7389237d3@oss.qualcomm.com>
References: <20260219-firmare-acpm-counted-v2-0-e1f7389237d3@oss.qualcomm.com>
In-Reply-To: <20260219-firmare-acpm-counted-v2-0-e1f7389237d3@oss.qualcomm.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
        llvm@lists.linux.dev,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1038;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=QDmpj9Mhi+yaAgNVbdMPNkUREhCivGToVpPYIMUn09A=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBplvOXAyCwdeeG60WQzcr9Uo+M3mkJDcWzTWLZ3
 kXMLJDmM7KJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZbzlwAKCRDBN2bmhouD
 17aeD/wOR6DTrP+rBWdXbkF2r6rb3/tLd36u8MghhP0UWVrgi2z0y/jWoTssX+J0V7oPlxzXpCI
 cMgluqyML+MC9L60z4kTPIFqhi/AtNdC/8CVFU5a0Hx68otOv/K0qBDMJ077FvMe140HHGGnh0u
 kpO/PsZ0EJnWWzvZgqVb6M051BYBvsywoJdt16H7swNJHBnCLfBtK7aXx+Nq71u8405lw8LuEDL
 iZhrXgvWNZLN8mbNFGdGoZQLoKAbf3jbwoCLxRuLB1W66O5Y2nvPVw2vIszBoJaHfAJ6HM5rCAb
 HKqodL/5CTHrZBnnr/3qTltvJsRGisotNasGln36eo065HHND1/NQdUPEf1PInYEOZPsohYAu0Y
 tHPyFYJud5k6PQIrP1lcHEpkQnH0ggxXaVae1GMOEVf/DwsiO2XajyruDU2k+eI7idNY1AO86SY
 WNvog6SSmc8oZmh8in3yvpOO7lKGq3WMcYrvrUXfv7F8uB7dRRTHbti4hWbN/wfWct9ZatBDN+c
 6EKzxbtIuFUTi8QB+AhmcL2uZn66/y2PdJZb2xgsRacVhy1rrIVQl34XIpnmbC7Mq8zJWWm0kd4
 gK3mAVXA4SnwngfiqWpon86kStiZ8hVlMbBcAUCJ9uvr66DAjhB0orNeIRirQiB1ktbGltC1Ayr
 EEFtsxNfwsjn84A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=OKsqHCaB c=1 sm=1 tr=0 ts=6996f39e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ba0xTr4slAEstdPKfgkA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDEwNSBTYWx0ZWRfXxdqzmWNTRtqF
 Cf64rnZymtuv81UUQR6abWfeo+Z9/cUwrW0eGY6+eUEtNHHTl2FDnY4VgMX3X3n1wfKJXWVs2in
 A2tpRd6W5lXWusLhTHGoLWKLgFW/fNRvv2mT9uXYneV17oGeRZLdV2SVAHuy8lipm6fXTSyRkV7
 NEkvIA1XfUFP1N/lcDC0DMowaGuZ4IFIF9SuZXaXhkrlr9GaLK9N4RHZ0HURYQJS2pmJc5udmv+
 9Yz2V6L3Iaw41nBDth1tvyN/SjptnLTFyaMNfLxfBHZwMSMuWIJmx65qlzhpMeaPbuctYNM2aIc
 +ud6Jpwfr3lnfSrwKYNYlf6wRIfTJaNWB0pfxSkdoVMhiqIax3xDf3aJlkdTZyWYYxLMeiMCwRr
 JDOYyyJkPdYWr1wO0gy1reHwkQdTdHERw5I+47jOuRvpT+wn9KRXHIZ7nzMdsvRvKUtuxwmEW3n
 FjLnQe32g9vsR/reFzg==
X-Proofpoint-GUID: 8BTuOdssEDm65S7mZJQFWoRR-LHmzC3C
X-Proofpoint-ORIG-GUID: 8BTuOdssEDm65S7mZJQFWoRR-LHmzC3C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_03,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190105

acpm_pmic_to_linux_err() uses an unsigned integer obtained from messages
as index of array to map them to error codes.  Array index cannot be
negative, so make that explicit.

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/firmware/samsung/exynos-acpm-pmic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/samsung/exynos-acpm-pmic.c b/drivers/firmware/samsung/exynos-acpm-pmic.c
index 961d7599e422..44265db34ae6 100644
--- a/drivers/firmware/samsung/exynos-acpm-pmic.c
+++ b/drivers/firmware/samsung/exynos-acpm-pmic.c
@@ -41,7 +41,7 @@ static const int acpm_pmic_linux_errmap[] = {
 	[2] = -EACCES, /* Write register can't be accessed or issues to access it. */
 };
 
-static int acpm_pmic_to_linux_err(int err)
+static int acpm_pmic_to_linux_err(unsigned int err)
 {
 	if (err >= 0 && err < ARRAY_SIZE(acpm_pmic_linux_errmap))
 		return acpm_pmic_linux_errmap[err];

-- 
2.51.0

