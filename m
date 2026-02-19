Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5134C33EB07
	for <llvm@lists.linux.dev>; Thu, 19 Feb 2026 11:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771500451; cv=none; b=MllOnP1aZMj4VrTDnmviARaVptEihzrsLj5VWHRgLCJJjNjHAHCs2dkNe6i03/HMC3NYv0Si0PHaYBlou+qYW039UW6ObSjw3MUjhZ4EBeGRlqUchTgeIQWiqHTU7ZmPH82nL4u9fcAgjzaGGjcrm85r0xfdf1p9qwTsCav/1qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771500451; c=relaxed/simple;
	bh=zCBD0xdOOxAVkq3+Kty451D4UNd0wOLSkX5sEdRZvAM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dS218j1Dqf/0PkZfIb6g1elb1N+QS8R5mFxNLXeYUrECmEOR+8BUbEqJDsT56qQUy1aQNSuaahjAH0DwkSDiqouB/R2j+HXIMuRqWl5WyA8Om5J5+gFYpqkrlZmAvN5E217Ubplj8uVX1aeRdNUu7ArvF41kgUSRGV2fWB9+yQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XhScXMMZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fkbliJrq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XhScXMMZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fkbliJrq"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JAlopc1624816
	for <llvm@lists.linux.dev>; Thu, 19 Feb 2026 11:27:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	APi20n/l37iYWJiXfjjXLQ9MMk0Sl+PXW/Y+golBnjM=; b=XhScXMMZSM80so36
	WnyFaoXB0dFjX8C27H+MfBBRFv6j24aoOEvNWFPCGIhJAUYuQe/FGrATJIm2mD9I
	fQG4t3JrVfempIeNEDw6vjX2Z4seJ8sMZXcc6bdluC2PMI8Oho5KqhLN4LBfjA6U
	keFYEO3spxKKvEaUNxOmE3vvnw9Kzv5/ETO5/HET1+zSO1KaVcBswkjyaNqQo7e1
	jSNEeOifo+b+O4o2hHbNRvDvFwpuB6OdxSMZzkFQ8/hFbQeUUzcqrJUcQ677oEzs
	Ks+vr+ci7r//V+4h81K6zTTsoeajTEKPITs762bo3Qv0SoSGGoHdpevIlT/XqDUI
	6654ig==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdc7ubfer-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Thu, 19 Feb 2026 11:27:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70ef98116so688739385a.1
        for <llvm@lists.linux.dev>; Thu, 19 Feb 2026 03:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771500449; x=1772105249; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=APi20n/l37iYWJiXfjjXLQ9MMk0Sl+PXW/Y+golBnjM=;
        b=fkbliJrqFbA+qOmy4h8p6HUsd1uDYhslcD20340CVsHd4wjkBLpavUqXlzichDvuhF
         97MbfsS9ZtnidXj0QzX/20qNL6WwUjEKKzbLaDQekmhJUrw5ET+SpSrhAnx+IRj12vff
         5fxLy5J6YJ0KQk+miSfkob6Iya3B+zySQgV3jBh8ubKNoFtd0sCbgbfxh6XopTnYuQ+I
         VtT41uPFW1Egs4VVpafyFQJrloA9O3Ox7B3ZLUDmAxRk+mylkt5pV4HdBq4VW2mZrYWe
         pk03CgCauuXApLv292pKRdlEFTWB29VQ5F+Os5RNjZrwhHyOeGxF65OXdLqe6dEP3Q6h
         ThDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771500449; x=1772105249;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=APi20n/l37iYWJiXfjjXLQ9MMk0Sl+PXW/Y+golBnjM=;
        b=vM7/StC1jty0UwegE/nnAEvM2/+qL4MRQWK/XJXZrwK9rvki1fIFWcWaJnM/rodl4w
         WeIGDL44WSqLQMNQbJRNHz37gX43mktYkm0ASdZzhEuhfqow0oI/4YVPK9/UBPAvGb+p
         UuLqiXaWWODEPCwx9+eVU56VAcPnqBa1XVb/w1ndgkuP9aFORAU0/LwV3kQxwThR7ClO
         sdsILUTEtiHQSeBOYo0YrSXgF8Og/pkuS01vF34GT0ZyNgNv+Axao59gvXfvs/dQdDve
         LGlV8/oovBC1HYYhgBPTW9WMysen/oJ0xYJuL0d6HmMlca6kMUzwf5f1B/XLjDRpB2uu
         FtUg==
X-Forwarded-Encrypted: i=1; AJvYcCXc1Ixca1S3yJmTFuTHaoQOiE4vvS1tAg83XmiY4ZMgN4lF+zD/5+KZyZfwBQIzrM9RBe8E@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/ZMx8TijuSbYDxhs9LShprYo/Eoe39YfWuU2hw4/0UCAVqkSs
	jB91hEIfeW4ee/rDLCoTHlaEt8fMKn4eSm0aCuYpZ8it23RBj3xHYMtvZMYc3wsj+fqfFMcpCLf
	F/fCkMwgy+28KEcs+FFaf1Zgq0fBpAa1UKi6YyrZBOHAOKsvLcZNXEIzJ
X-Gm-Gg: AZuq6aK9EEYc8NC9I+Mhq4iSBw+hbJ5aULjMUhOly5Tj2gnDHgIPFzstSHBnlOSHZpc
	zmU2IZIpZ/UUeNx5Jz+iRPkq6JggVO0iu9ctZfI9kFXCVHE4XmiJnBweMBvWIroK9yOOa2MRm93
	VMqWCZzJzK5cy+OqgXU2v7rYwoeWhNRszB0O5z55LDxmdAJ6ruUFK7JbEFrVFkS7SVTGbgpwIQ9
	VAJC+9vxzH5to0VXLMz5pDPqb4loFqvL250pzZr9PVNSNfollSqesUsCsAyh/BWOtHXSLtX1GnJ
	/SnRu6baBIiwS+UvdoPA4Rfg5qxFrF6YFMoCUNnLVSYN9bmQoZosMjn4xw2fzJITSHgnvsNdKHs
	m6qFSnHhCoSr+8saslKa0leHgV6Ce+yFp/TKBXw++BahvXA==
X-Received: by 2002:a05:620a:4050:b0:8ca:110b:38cc with SMTP id af79cd13be357-8cb79eaa527mr233566585a.27.1771500448600;
        Thu, 19 Feb 2026 03:27:28 -0800 (PST)
X-Received: by 2002:a05:620a:4050:b0:8ca:110b:38cc with SMTP id af79cd13be357-8cb79eaa527mr233563285a.27.1771500448054;
        Thu, 19 Feb 2026 03:27:28 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac8d82sm48903796f8f.31.2026.02.19.03.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 03:27:27 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 19 Feb 2026 12:27:12 +0100
Subject: [PATCH v2 3/3] firmware: exynos-acpm: Count acpm_xfer buffers with
 __counted_by_ptr
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260219-firmare-acpm-counted-v2-3-e1f7389237d3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2018;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=zCBD0xdOOxAVkq3+Kty451D4UNd0wOLSkX5sEdRZvAM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBplvOYR+uIJFtIIdp6LnUeRbEBpg7ukZrE/s5l0
 d3KGKa0XRGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZbzmAAKCRDBN2bmhouD
 1ysFD/46Y0DA3bcXwkxOFVHsKp7iSZnFhERCvqZl17T0vKZNNWjTABwQuIxbBPNoDj9ws99LD2v
 playnm935S92hlxRsUetG+gFNO/peGx14B57I4FLcjkJK6FZSifoOv1KcraTIramzWtaAhMD7Ij
 9ElzKIFPv+NbA/cIAIHe2JEJ94lUqge3z72ZQN8+LvPYs+1cbFvBA7uGr2W7jfQn6IhvdisVmhQ
 1K4db+SJ8LT7rt0kge1BC5SzzRUIKx4xs4xGATBfoW/IJCY8qLrkStwQVDdjYNKVBOReBPhdq7U
 q67HNBxfpEaABG9dSAzlENwpU8clUjaOjU5QTeC09Ye+VuvAL1K9XUiHRDZeCDlm9ixctMgsk4N
 RFNnP4CPtKRHja3Gqy1pY+lkS3z6k/RtqplMScyUpSOVuTMQTpwg59aVvYEwsBK3CzeGG04XPZ4
 okqpW4KEhEb1q/ucVUsRJIfpSOGE37BonoWlG+vy0Sf0qmjNbeEq0D4OMyLm9f1sSvsnc/E/+8P
 F/J/6x7P51kYFRh0Ba/AxMIXzVaKuobTj2lNksnz2wXje2fv4CjA/JrMWfv9tT274yYs3tlfYOp
 WQlK8coRaNm23oLWIKNJrHveXD4lNEaKJj+VSKpKwu68EqsSp42YXREkVYQjPcylVR+jNLst5yf
 GSAaRTlEzbfHHlQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: -3o2X1YHuM2VMzsqiC8USLGhRjjYT1jT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDEwNSBTYWx0ZWRfXwRYnbitRIbg9
 NGhrBUyIK5RejFvtSYEmnPYKqLQ2Uc/PaEdxAtKLnLbTIqPe/W2F6DYI2QUUZ0ysW9z/1dTfUlp
 rPZn0Er2wfUQcIrUfe7doSF3Jzf75rQlzq+/f3z/hYW0rkNtqALYepRJ5WhWQmgDfsL9TX5kx94
 UnHLco8Ue60VOamlxbVFyVYV9eALmBGDHEtHPTapOTei+eiGD5cKu10zV0jqbUVAwhVvZmCu1tT
 aBbnv9nUd0ap7V9lke5w40QukxvdTenD9zflA6Mv9BsVlEAQ3HkqtyhNNOREHsr4bl0PMsr2DjL
 /OYuv81Z0EPJtocLel94sNbWDTLJda8BlnYJPvkHWntrKuxkglBhIi5D7btalEYnjOiKr7yWgpm
 KClujA6GY6lgSndxbObAaxRZv73TTX6ky8Pk6XW8MkXw79PhqU6SppLtIASxoBrpiZaE8ts1j07
 gQ2oBZWVTIUztpWAdtA==
X-Proofpoint-GUID: -3o2X1YHuM2VMzsqiC8USLGhRjjYT1jT
X-Authority-Analysis: v=2.4 cv=daCNHHXe c=1 sm=1 tr=0 ts=6996f3a1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=S5Eq-Qd902Z19Fn_UHYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_03,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190105

Use __counted_by_ptr() attribute on the acpm_xfer buffers so UBSAN will
validate runtime that we do not pass over the buffer size, thus making
code safer.

Usage of __counted_by_ptr() (or actually __counted_by()) requires that
counter is initialized before counted array.

Tested-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

__counted_by_ptr() actually maps to __counted_by() for clang v20.
Alternatively we could introduce new __sized_by(), already supported by
clang v20, but it is not available for GCC, AFAIU.

RFT, testing would need clang=20+ with COMNFIG_UBSAN and
CONFIG_UBSAN_BOUNDS enabled.
---
 drivers/firmware/samsung/exynos-acpm-dvfs.c | 4 ++--
 drivers/firmware/samsung/exynos-acpm.h      | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/samsung/exynos-acpm-dvfs.c b/drivers/firmware/samsung/exynos-acpm-dvfs.c
index 485fc77ad4b1..17e7be7757b3 100644
--- a/drivers/firmware/samsung/exynos-acpm-dvfs.c
+++ b/drivers/firmware/samsung/exynos-acpm-dvfs.c
@@ -25,12 +25,12 @@ static void acpm_dvfs_set_xfer(struct acpm_xfer *xfer, u32 *cmd, size_t cmdlen,
 			       unsigned int acpm_chan_id, bool response)
 {
 	xfer->acpm_chan_id = acpm_chan_id;
-	xfer->txd = cmd;
 	xfer->txcnt = cmdlen;
+	xfer->txd = cmd;
 
 	if (response) {
-		xfer->rxd = cmd;
 		xfer->rxcnt = cmdlen;
+		xfer->rxd = cmd;
 	}
 }
 
diff --git a/drivers/firmware/samsung/exynos-acpm.h b/drivers/firmware/samsung/exynos-acpm.h
index 422fbcac7284..8392fcb91f45 100644
--- a/drivers/firmware/samsung/exynos-acpm.h
+++ b/drivers/firmware/samsung/exynos-acpm.h
@@ -8,8 +8,8 @@
 #define __EXYNOS_ACPM_H__
 
 struct acpm_xfer {
-	const u32 *txd;
-	u32 *rxd;
+	const u32 *txd __counted_by_ptr(txcnt);
+	u32 *rxd __counted_by_ptr(rxcnt);
 	size_t txcnt;
 	size_t rxcnt;
 	unsigned int acpm_chan_id;

-- 
2.51.0

