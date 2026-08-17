Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4E23246F4
	for <llvm@lists.linux.dev>; Mon, 17 Aug 2026 04:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786942078; cv=none; b=aoK9NYgaKLqGcZlEqPJ+muW0E2ckrunib75exDTpMqGRQcKZ/oJrG5t0eVw4AZMkAdAE8LzS7CSGL8EEp1D+DcyEey/Dpd4j++VnQWHOKPWyQzoZRU03uRQrPARRoNDdB4YVz67UAgsZX5ElNoeoe7Ecvhibwa1ajfw7w4Rm0gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786942078; c=relaxed/simple;
	bh=1OHxMv2wBW5/+XF2J6E2XUpLe6qHFrIRQAha7890YB0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m9DGx93emIzIbDSMvcmXtxayeLu23Y7EUBr2fN+0gD7xx/9PidRlzM/ZXPpm736mRO3k+KVhsNlCnJpfReCDj9wbDe8AM4xyT6hIIZqRfSdBjL2i+zFAYGnERoAObgsizWjuzA0jtvMjMPeM7HcY74vzgPvjZmLhDsAnDjoDl5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ALHMvmZ6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hBME+q3L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ALHMvmZ6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hBME+q3L"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67GLDcxR1386994
	for <llvm@lists.linux.dev>; Mon, 17 Aug 2026 04:47:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/ts9F4LI3Qew7SgAApfg24zoA58LocEvNJeGMCkgto4=; b=ALHMvmZ6t/9PwqYJ
	3E8YSg6h4Maib+VpEguh/GuwaJ2ct2VBHS5pjl/rFKMMsuha1cwpHUvR/rwod2ax
	jjZa838V/LMZW/UKNBF1isRV7Js3CCzFofqL/OEBQirBdhlpsy+63MWXwjoui9mH
	Dn1uNa4geehPCbbHVVkRFZvvuyaAWtmMr2DnTOdouX3jLIi/1kLf+jwhqhIP2lgy
	Gb+FNOCtmu6jpZO1t0LKG2LBop6d3IBaOxuAlWf50gYi7smMKIYEk4HsgCZ0qtzh
	qxCUQGcdZi9WSwSZZsxon4RsHiKdWWoRLfRksJUEi/vsrJa71VLe+6ObtssiQBlL
	q/mkjw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3mx4ruas-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Mon, 17 Aug 2026 04:47:56 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8487ed7f7beso2932522b3a.0
        for <llvm@lists.linux.dev>; Sun, 16 Aug 2026 21:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786942076; x=1787546876; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/ts9F4LI3Qew7SgAApfg24zoA58LocEvNJeGMCkgto4=;
        b=hBME+q3LxE9JhtfyLMhbVux/xFIrb1igyzmPPnipQzKUgQPpasmR3YX/BLQyJC6DbQ
         caWnkxFzDqKRRSh9yVkvPG9ZdBYv/lOod17qn7r+k6ygj4ei803aWOO3q/dc1O/ApYbM
         C9cCh5+2RV+EIv3UbOL+Ym0QiOd6L2n0LmViiOdTUOITyxwl0pf9HhMUFtpT0aBjoVqO
         ts73XiNnbFyB0F2+KtDtR1W/fYpwpI8LFDbdwV+ATia3xXfEQpbJ6/+7bDvUvlD1Tz9v
         liA5vKalp074X5yy1/UXOY/PjZy1EgiQFTCmrs7KTfBFOG3zqguG8yFzZlJY9WLu/Naq
         6RWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786942076; x=1787546876;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ts9F4LI3Qew7SgAApfg24zoA58LocEvNJeGMCkgto4=;
        b=ahtmj2vFDSMiREGGSh85tI8ooRu00OupNHhDdmuVDTghHce4wXo1UgCK4ICACwm+JB
         7hHqH3KSxnIYYD0fqHcuI6XrlgRyshWq4oe6AdsKEOeunWhkC0blowoZgZ9wir/h6LSL
         kGKtn0pztHtrOv4EC1WqsNRirpLEkjOY4npPKwXvVMzLAzG1tSLW534N2kW6R09PyzkU
         9puJSVAjXlmZ2wLcUrR5bDdXvN/GH+8U0MeTS4UZyvPJbx7dRo1vekCGyaT6GLnT2UHh
         qkLjLKs7dZglnfxOUAWUaPXKzILnyTjVp6B2IjntMyx4oX5x27P3rgqbqibsHfMiyoJA
         0g6A==
X-Forwarded-Encrypted: i=1; AHgh+RqFV9rFPArrpA7mnU0hnovr56POaAp35RCIT0pWdW3xmJdV0+83yWki5dSqRm6L+zK0YzKj@lists.linux.dev
X-Gm-Message-State: AOJu0YwMFWznLiKvOtlncRrApbm/1JyQvv7FpzGl6E74rtgk6ootJFTH
	sakumOKmytjiZwegKig4Yh/odl9ZUbRiShg2jgycmDTxoijAbIa3oriMhoa6gIHD6JXm0XQmple
	IG0A6gIHMRqBbNMAgNx5pKsK8R5r94nMmLW871fjC7CF70bfPfrX/aLLv
X-Gm-Gg: AR+sD13Y5B8jees5IasblHiFktDhkOXfRsiZby0Tbv6LarFNXIYsYih0QVqlRVr10oH
	Be9HoP+sTPxh/o21MJA2PMO9LHApk6rhxJzNjOidKfhsqLKCAjsD9uEl5YA8fV/usNnm7mSPQha
	OPNHefvr1DTUIsqC58EUOajt2I45tz+3YROJS+JfnHUOkhVXimS3sJ4/NVBnVXvsAHEEwRLXtKb
	D87CgeI+WHL+GmlFzo6khZB+H5yOWCL9CUErWqLoWnunOz6uS74fId2AaAHkwC8xgstTiq3pQ+v
	oinshka3rMSaSJ1Iy41Ur/4QnjaLdYVgfbvbG3Grc7GGsbTLLBDDOioZFK132M+WasDs6hJtPye
	PHt8B/ObgMcWHS1V/mPWlZ1xQMFr5V9aB
X-Received: by 2002:a05:6a00:8086:b0:848:7731:d95a with SMTP id d2e1a72fcca58-84fde47a4c8mr24275342b3a.37.1786942075802;
        Sun, 16 Aug 2026 21:47:55 -0700 (PDT)
X-Received: by 2002:a05:6a00:8086:b0:848:7731:d95a with SMTP id d2e1a72fcca58-84fde47a4c8mr24275302b3a.37.1786942075362;
        Sun, 16 Aug 2026 21:47:55 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8517d046638sm2149250b3a.27.2026.08.16.21.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 21:47:54 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 10:17:36 +0530
Subject: [PATCH v2 01/15] MAINTAINERS: Add entry for Qualcomm DSP
 Accelerator (QDA) driver
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260817-qda-v2-v2-1-69a02e9090d4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786942058; l=1175;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=1OHxMv2wBW5/+XF2J6E2XUpLe6qHFrIRQAha7890YB0=;
 b=HyeeU74f3CsKVkGnmRyBHt0hVqLHg6pHSrSomMARbCMj8ww1CDL9Y/CwmryCZtNpCOfURrc7T
 hBv2bX9LYjIAjAhLgISSrFUBT4+VfnI3DUZj4hbuPuy/jsdJu5xv35r
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Proofpoint-ORIG-GUID: hZnS4fVPVMMmHLIkolxOhQQwTiaIDWn4
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDAzMyBTYWx0ZWRfX4vcaOiQyINKF
 WirRxkc0gwKBonHFsg0S1hevRGwTigC24s9zUKtW6jp/VeRUN6LlglVhLFSrT78/D4OIL6mQR2L
 Y0NRM1uBTWBh/WkSwsWxIxv3fjUJ764=
X-Proofpoint-GUID: hZnS4fVPVMMmHLIkolxOhQQwTiaIDWn4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDAzMyBTYWx0ZWRfX7MazIKpUm5bD
 aNQsqSwh0qGwcdr8xJ3vuP3kJy8Q4xRZ/tJIA8eLj+EqmvW8uyDYtJrN4bOBtiGg90wI3XiWZbg
 xA+YuQplaWasrtFBrkxcV5ZlEVIT3KmG7XTQnshQWJ1LMV4dZ8WkD31yGxCCKKr4hpykiDsxWYF
 Ll4WmEIIvYd2K2vAjLUmrfvlYhszF8mzP+4nUIwirFd2dnPS72KbhpcDX5YqrTU1BuZgm/KExXf
 NRGDBHdh6EUJFuGsGrOe0x2mDMdqwurCqYHKqVMZWMDuW+J69QFbUxbXSPBMR7p8lAF0WczqZf2
 6lC1MdqrO0x0kk6tLwRdi5hggNYQZRGYItHFXfx9thEOX//hpIaQHeddrOxHCq8Jt+uixk3Z7N4
 4rr0rkR4InFF7Sb4W0NiXV/4e6ZVddIp+HaFRvO/o27G9ko2bwX55x+4acdtkjTz0N0pc9g70vl
 wNT2qP3mO8MucVpsk6A==
X-Authority-Analysis: v=2.4 cv=Y6XIdBeN c=1 sm=1 tr=0 ts=6a82927c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=-nEfFi9kuEQa9ToJtW0A:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170033

Add a MAINTAINERS entry for the Qualcomm DSP Accelerator (QDA) driver,
covering the driver source under drivers/accel/qda, documentation under
Documentation/accel/qda, and the UAPI header
include/uapi/drm/qda_accel.h. The linux-arm-msm and dri-devel mailing
lists are listed as the relevant review lists.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 912837dd4640..75fa90c137c7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22388,6 +22388,17 @@ S:	Supported
 F:	Documentation/devicetree/bindings/crypto/qcom-qce.yaml
 F:	drivers/crypto/qce/
 
+QUALCOMM DSP ACCELERATOR (QDA) DRIVER
+M:	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
+L:	linux-arm-msm@vger.kernel.org
+L:	dri-devel@lists.freedesktop.org
+S:	Supported
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	Documentation/accel/qda/
+F:	drivers/accel/qda/
+F:	include/linux/qda_compute_bus.h
+F:	include/uapi/drm/qda_accel.h
+
 QUALCOMM EMAC GIGABIT ETHERNET DRIVER
 M:	Timur Tabi <timur@kernel.org>
 L:	netdev@vger.kernel.org

-- 
2.34.1

