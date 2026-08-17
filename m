Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3FF3246ED
	for <llvm@lists.linux.dev>; Mon, 17 Aug 2026 04:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786942113; cv=none; b=Ywxdq77htq2EMJsNJkt+zs93GiVNoehxMP0Nw4M+vsVnm9Cx9tBf6+XG9Yfawi0NapJgDIBkm8wmUjsVB1IY8GG3zKwH/Tjf4ZhbGaCKh97r8uzstdNkCOcc+ZJcR8bb1hU5exspelAV0uti/NlW6KMJ2AZYarvStVCqRzeh3tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786942113; c=relaxed/simple;
	bh=ZCBL1c+Td4SRNnF1oGxWDvquDAKasF3yV4ZUllxnUMQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hYZpZC3pC3dcTtk9TlT+JnDGgvF45dNQZzePhgAJiA8X+OQq6VjzQAylGwYH96jdWSw4YobXUIapOWEDx4S2MYFrgVJACXQE87UqCU2NS3ax1bc2d+oq1sOMWam2I0BODmXLw+K7sOReYGfx+wPyXx/PlzAFelkqlBuLFaxrBPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J6OWgqQo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X+R/KBIO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J6OWgqQo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X+R/KBIO"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67GLCLkV4058240
	for <llvm@lists.linux.dev>; Mon, 17 Aug 2026 04:48:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yCIa0tqjHElgbgb0AfTikV7EqDsfsowgkNcvnaxzF5w=; b=J6OWgqQooQ/gjJ0D
	1npGrsLwqRYD4bz7tU/atzjJynju00cIfiTQaAdgo/zq5JN9/fUJQ22Gvrm7X75i
	AV5KCfSxa7db3/LNOM/g8wIJgddB2nP+E0mJos7rvwTZ9ie7GaOVbuT3ghs1GAkc
	0Zu6TxU2vC1PlDJod8bennphPbHGoPz/MBJJ8e8JcepnGZweDGuUDUzocWWARn9Y
	P+p2cI5KqsEcZ8Q9Yajz1XT1oJYg+RMi7ad0FBwKD/UvHDIPWVsiJ2ka8Hk3rpy2
	389MEfu8qcFRpskh1NdNTYmreeV7jIbSmv1r8MzXXDkC2/SnbxIn3Xsacggdda58
	rRQwuQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2hd7w1wg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Mon, 17 Aug 2026 04:48:30 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbedfa3898aso2706798a12.3
        for <llvm@lists.linux.dev>; Sun, 16 Aug 2026 21:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786942110; x=1787546910; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yCIa0tqjHElgbgb0AfTikV7EqDsfsowgkNcvnaxzF5w=;
        b=X+R/KBIOqjDd53Atg5D1oTjLV7XsNi3jh258BkPoCNduMXjpXvCkbC525cKuHsdzIQ
         8WlE7u89wA3C5A8xXotH2TDVy/2emWju/fxQvYVg/+11BQAuJXXgw+cXR2f/gk+rs8yT
         y3T7tqLNOhhods3uvqZWMTIdbw2L+WS09siMRRiu/L9SHgCmGMxq0Uit2lFdvoCzCi0N
         6Q7DWLco0CbNWisMdrrh0/62rTc9l/yCPNS4CL5ekIohZlASGw19yk5bCw/P03evdTjT
         GtFVCY8bT5yB427oT+2C/4RgTBuguz8xEzm9Hp4JpI+y1CBkOAbaedRTAwNSzL0PSxZX
         tiWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786942110; x=1787546910;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yCIa0tqjHElgbgb0AfTikV7EqDsfsowgkNcvnaxzF5w=;
        b=BYy2dEHvGaLNToM2Qry5jWjbpruODPrHmmtvgMDoQ+eHYGXWM/AqZuzEZXC8UJIzSm
         IWctS/snwIuEAvwMc17tVEiHnGAK4mi31uA35KMeev4cnB9vCZlJ5zoKvo65xF6j5YVf
         7M81vzMgjETXyVybOrafGf/2PyULz7TuyCPZhRjAmxgf2fA0pIoUOQMo/6TVbzuWg6AV
         DSO1ipPOWZX+8f8FZWBzH8xEygrhhpIMXqXlhyDsqWsFq8Fo2tr/RkjwxBioDWJIKc2z
         4TjkZkUksuJ3aX3g47sUpta1qfUi0WTGNyBifZubZ8E8F0EgDtB7TUMgNSnN0wjMhJaB
         h3rg==
X-Forwarded-Encrypted: i=1; AHgh+RrOie7Xr9fBCXDZJ7QLJVaTVlBKql+Yh+fvVFRBqUCQ40BoIVGQcMX+iEThMHGpvki9Rjbp@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3DSHg1WFathsZzwAIjIb6iAa1FTssUF+LeOykkJ+Q+i2frELl
	A+9r+SAiK3IZV2OJDRS51WelUvbhAmvkYyqjCXc245GT7uPeGlNCQIKxomsIM8S9KAdmxkyFQvT
	FqtV2GiOmfQFFBv1VvNyH0yojE9pR4WA5mkHmdnXcpD6cekhp/b9j6gKx
X-Gm-Gg: AR+sD11F2H8L6StugcbEHPJqERQ1RoGZlRJoenrkDZK7T/FxrLlefh2ZVgPMlim4WgW
	e4KOHh6xs7uRcR+VcSiwIuKF5jLZtOb3/C0xfO/Fy/4f27kEMKhJsCvVG7U7BYwqlEBa05FkjPC
	Udz0bxseFd/jUgsgaxusRPFT0qZ8t1Qv7tnOqhqAZ0CEekYtAUbedZ4P+igbxm4fh4oSamb9PGI
	eoqKYCWiRjMbG9Okc2yYvC3fQfyROYxHYY9YcmqJWtMDe4RHEwQ8sa0jhGviYId5gfuiT9KJjOU
	3ZiCmj/+QFfM8esRmrr+YYBZxmmmNjjUiHcOXUX9+SapvUo+cY5TgQDC1JjKb3AIsKyMteZ2CNh
	41SpRm2ZO3CvGYylHCoOXM7fVC8Nq/7rw
X-Received: by 2002:a05:6a00:3cca:b0:848:2c5e:305e with SMTP id d2e1a72fcca58-84fddfbf1a9mr22168483b3a.6.1786942110188;
        Sun, 16 Aug 2026 21:48:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:3cca:b0:848:2c5e:305e with SMTP id d2e1a72fcca58-84fddfbf1a9mr22168441b3a.6.1786942109648;
        Sun, 16 Aug 2026 21:48:29 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8517d046638sm2149250b3a.27.2026.08.16.21.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 21:48:29 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 10:17:40 +0530
Subject: [PATCH v2 05/15] iommu: Add QDA compute context bank bus to
 iommu_buses
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260817-qda-v2-v2-5-69a02e9090d4@oss.qualcomm.com>
References: <20260817-qda-v2-v2-0-69a02e9090d4@oss.qualcomm.com>
In-Reply-To: <20260817-qda-v2-v2-0-69a02e9090d4@oss.qualcomm.com>
To: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        srinivas.kandagatla@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786942058; l=1398;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=ZCBL1c+Td4SRNnF1oGxWDvquDAKasF3yV4ZUllxnUMQ=;
 b=Ff62ct5FmLcrlR2W0PjFIkBz9F7OfuR0BbENpIURCRwvY/7zltm8SoqrH5Z+oE3RorVE+0N1m
 xMOtTZldlZKDrKhhHfkpJU6wCmrnxMlgi6CSe/Y8KovXD4az5vfrhhD
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDAzMyBTYWx0ZWRfX6tTIlDSuXi0k
 J2nveZ4ngt2mZHgVVcApqEMrBtyuOMjBG1E/tFk1jq/z3Zwg1PVCoXsjd2vrLgT0syCe482URxf
 9rCby/B4aIX6l80B9HCLkTV0VMozSfXDdpl6pgvvRKVMIHgrCdYLYMyyxed/X1gXue4aELaBkEj
 xccdVWj/W8F0J1MOsIYMzv22qP3svV6XEpRgbZwm7lEQallo2BGvxniveOQtpkD2INEvRevRnbE
 1qPj0BRMNHEw/rjUoNS0fTuLLGjTHgoP1RMtaIvOlfGjMeNjnIOAIdhpVQSZtB808LdypuaCcwU
 U0skX02X91AQAb8T/hTOAOfb/szuEkYJRsTo+X3vAaLSJCaaxtIe1T7c6RIZNSDTfKfW7yn9bEI
 kkfhq+ouEGxK9W5VFJ5Q4ThdeiAAna1RXMLONrXJ4/sQB7BkQU7f6o0KBcrPY6aSMWxME+uTzRk
 lPNqtooxNvL87yphNwg==
X-Proofpoint-GUID: jdPGYzk-aG2IWu43A6tJv70V8vAJuqzp
X-Authority-Analysis: v=2.4 cv=Ja2Ma0KV c=1 sm=1 tr=0 ts=6a82929e cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Spc4k6fihxjec1dDB2sA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: jdPGYzk-aG2IWu43A6tJv70V8vAJuqzp
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDAzMyBTYWx0ZWRfX7B6NFSLlh9sk
 bjG9y6Has12AsHntb3WFlqGqUiM+6Ph7LMuBOMmN3oNfVFFtRCDv6m7mWFFE09Go05Rqfv/vvyO
 6w8V1nqVIISfs7/VelIBlDdazVZtj/g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 adultscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170033

Register the QDA compute context bank bus (qda-compute-cb) with the
IOMMU subsystem by adding it to the iommu_buses[] array.

The QDA driver creates synthetic devices on this bus to represent
IOMMU context banks (CBs). Each CB device needs its own IOMMU domain
so that the DSP memory manager can enforce per-session address space
isolation. Without this registration, the IOMMU subsystem does not
probe CB devices for IOMMU groups and of_dma_configure() in the bus
dma_configure callback has no IOMMU domain to attach to.

Assisted-by: Claude:claude-sonnet-5
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/iommu/iommu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index cd1bca7ede9a..4c4f7e732773 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -26,6 +26,7 @@
 #include <linux/bitops.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
+#include <linux/qda_compute_bus.h>
 #include <linux/fsl/mc.h>
 #include <linux/module.h>
 #include <linux/cc_platform.h>
@@ -200,6 +201,9 @@ static const struct bus_type * const iommu_buses[] = {
 #ifdef CONFIG_CDX_BUS
 	&cdx_bus_type,
 #endif
+#ifdef CONFIG_DRM_ACCEL_QDA_COMPUTE_BUS
+	&qda_cb_bus_type,
+#endif
 };
 
 /*

-- 
2.34.1

