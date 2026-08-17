Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CBB32B10B
	for <llvm@lists.linux.dev>; Mon, 17 Aug 2026 04:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786942156; cv=none; b=s1OQZ/Kd4kG+7ipFJV1/ZUIPA60SHANi0r4kCwGiw2Gf9A9sZIkYhRuGZrkgljK+WlQiTcgnkAa9/KKm2bbm573H/xNKtTI/rJbVjqPCU2iusnDmfos7rMb9pgzUo6jAXVvFy8uZnMnTAff/y0ipzKX067sXSriQnhImP5r/4YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786942156; c=relaxed/simple;
	bh=KEBIosjw/s1lnBO4y/mJV8X8bDe3iDhKZiDM+pg6MiM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KsM9h6XkbhRAjsalI6wJlaqJityG/tNEM6/fiAJsTS3NUxCzkkik8x3Lxtnh93Y6n80QQee+Euyif16FmK3c9FF9MSjv54t9PP1IDeIVRKCdnADCxYw7jB/F8CrTd5KjWty/IDQ4i6qbxQDQDycEdbWG64pFmDkq21I3NcDHdj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oMjmn0fo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cliqmoh+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oMjmn0fo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cliqmoh+"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67GLDW3d1386493
	for <llvm@lists.linux.dev>; Mon, 17 Aug 2026 04:49:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZKM+NHQSKUoH1D1TCU7lY/FLmcqsBBdoLfIBHv/qw2c=; b=oMjmn0fowl74M5yb
	ZJKjiJ0YUk2BSHptzmOBpVa7u+8SkltvKGuTBZznLRo+J+XV0YJFBB4VuHFhpO9l
	/TaDsSsKOtQD9sgka52g36QJeqC5cgReCbwR2gIL9K2DvOAQHc61IVi/2v+lSMsN
	Jt90WfnHGc4YThjkdBycPPOGJtsFE05B5+MuHRLmVWLKFlCQrNcSjJZTDa8/7khw
	vzMsmqcrIoVcExgwe8yZNx5nJ++T7HotMEXAyyVZhThFf1pBF/WGF53Qb6L3Sb6i
	5cm9fswu3qBM+J45F0SRmIXBsVTYweq/emcAOui/FSb+Ofjru6H1JQhBZn/8qYNn
	NIRrHg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3mx4rugh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Mon, 17 Aug 2026 04:49:14 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-848568a6f62so3241775b3a.0
        for <llvm@lists.linux.dev>; Sun, 16 Aug 2026 21:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786942153; x=1787546953; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZKM+NHQSKUoH1D1TCU7lY/FLmcqsBBdoLfIBHv/qw2c=;
        b=cliqmoh+yHPlWu2ngmmFO8OOCiCHMsRueGSIHTMxclMK2X7B17kzZIPC4eoVRjWUyi
         KR4DUWUXXTjoCefgQlzuXmnGcSjxLvjS+qR2rYq43JfwF9lNg1S77EDRn7FJ/uDT1n4n
         LiXa5scIBYshXm+HtkQb6nRyZyL4isY4ff1rteuLcnJd8URXgHijPh81tbzDwElABSjO
         +UcnJfnETkijGF6RqPxa9YC5HxThA9ggyNrphbC0kWQ5wzrp6LqQFgOecNBOolWN0CCx
         Sd0epHuDWSjP5eo8Tf79a3upzeQG2qYn6gkqu4s2f7f0tv9GTpsiN1HtA+sUPGVQ/C2p
         zK6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786942153; x=1787546953;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZKM+NHQSKUoH1D1TCU7lY/FLmcqsBBdoLfIBHv/qw2c=;
        b=IOLmejelF1oef9QpTeAAl/V+0O4OkBupdWZj2a9+RUILsk2jcWFaNuCk/SRRpeJ+z1
         SLbupFq8YOCOjq0XcljxyKIS9ogc2BdMUG36xWzHIOM5FO/cv//1ZljorUVQzCxc6vLM
         9NAGBC8UOmoeJN7zAbcVwqPpRo8+KfV3gakBvNUKuUMngqZsbxGDyFN11bD4IPjVDryU
         1lPzOyrvqQaJPT+Qy+eKu9ltBuXfRJrfLw6ITfuRgh7D7tKgYd1Zzd4TkJtBRLGL0vZO
         1aWhWbPFFPyFBJ9fzvyRO9elQCwCEhmha7BrqjUrFCnbO7kexJWSpdghmVo62I+8oUvf
         tdtA==
X-Forwarded-Encrypted: i=1; AHgh+RqlpOv0SAvCesTJ11BSv4O8tBCoFt7VIORhRkutcv+EU13tJuMT+LzKrnjfpPmaiecd0D1D@lists.linux.dev
X-Gm-Message-State: AOJu0YxOw6DN63Mjl8zQZCDtN13+5lWt4Cx/9a2eja/wbTkR3gENKB34
	HKP4dIAldhTUIE5YC+t9l9IR2xa4gv2YLTJFxanrKWIos/OYUe4lw7Bo9MQIey9Qf4I8xRnr9q3
	cHyaRBN66e/kM2cqgWWpBp58OWrp8Kw4AGJT0Z/yLwaZFjBx/+1IfB6Xa
X-Gm-Gg: AR+sD11+AIZacbJY5knjOzst+u3UjJG1fXhJgjAQqnWWIcYJe4Q5Bg6GZQ8JtWMCDam
	kULoBoOxDEUZTRtPp/Ebi9xM/SGG5i3cdaLZ4D3ylEAkPnBVc2rX9IR9GqyUZYPP7z5yl6B3dGK
	J6fN30YfSHcGT+P1HkQlDdxW8PlVgjgdNIIzUgyjdXoV3kl8ohe8uj1k8H7sWsMk6iKnRzqIZqA
	rvY/Aol6l8c/wdCwhfk8JV8Q2mzkBfrvzQhN5QUlvGvf9SEkSEJvEQtRCEfZJlPyeUb89byEJyA
	cKQM91BSZ2/m903WWkCbZZq2k6E7wKm9aiRlFY7D3xRZf5Nn7kVi6B8YQxtGUhvebbIz/qwZFyB
	WMwoASWfEjrrlpl1IM3jCrn7K2Gv9oB9J
X-Received: by 2002:a05:6a00:4396:b0:845:4126:222b with SMTP id d2e1a72fcca58-84fde25d9ccmr22328199b3a.28.1786942153349;
        Sun, 16 Aug 2026 21:49:13 -0700 (PDT)
X-Received: by 2002:a05:6a00:4396:b0:845:4126:222b with SMTP id d2e1a72fcca58-84fde25d9ccmr22328162b3a.28.1786942152849;
        Sun, 16 Aug 2026 21:49:12 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8517d046638sm2149250b3a.27.2026.08.16.21.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 21:49:12 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 10:17:45 +0530
Subject: [PATCH v2 10/15] accel/qda: Add GEM_CREATE and GEM_MMAP_OFFSET
 IOCTLs
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260817-qda-v2-v2-10-69a02e9090d4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786942058; l=6314;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=KEBIosjw/s1lnBO4y/mJV8X8bDe3iDhKZiDM+pg6MiM=;
 b=jGowoRNLuIyio1nIsF99A5b2Ay3Koxj/Exi5tF704xes4levIn1jfrSZ7D8eehElavHpXCS1W
 z0sWqFB+784AnVoSsoDt1bxTVCrrdNpkz+pSfgJ7Gp92V8lDvWyuYbX
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Proofpoint-ORIG-GUID: mZE5tv8CRrdI6GDxn-vtBnS7wlQYq06u
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDAzMyBTYWx0ZWRfX3oYV9ADWUsYk
 pOW7D/bVOw+vlgXynCiaYsj1ZVGsB8dyy9A5TshjtqNEGhrsN9GrmCLnavBLavFYQj3AE7oK5BO
 dsm2T51iHq3Jjui2CgkUzIJj1+zcTTM=
X-Proofpoint-GUID: mZE5tv8CRrdI6GDxn-vtBnS7wlQYq06u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDAzMyBTYWx0ZWRfX90Nk0dBuS/oc
 ppAA1aXlwfxaofQR8k8bYTwpko5YmKW4p21alRgHmHeHwDATG1VpZcrO9viJVTQfa17I36LeyzH
 pkh7psIkObx/xYdOg39nB9jOZIkPqbAoQlo+rg9Gmk9ifHj9nLnuHHRWeqVHxvg5Oi6d7YvaoeD
 uGJjyuAHnaFc0uw49STeDBo1Bjp7YHcvdAxoFuBsyEZm6C821C0ZDGK/Dd1GZ9EVMyB4ix8KEQk
 Uu3fZR1HQIUl5+UVrbNo70t0TtvmEVabFVjoJ9I88C50YoLKegRnkQFNZl0wH73NcVtC52xbtLX
 NkmdXXFpA4uZsv2vtGCLZBn/BsW08KYOSETiNBoAnv8wiQmP6i1k2ugkafTuJ+7HZhNvEv+izYE
 OfVE5QBfUQ5TVNNoy1nLDGaCdhyMQ6gWD3G+ejmbB9WsjaHoeyf2ghdok9R4/aQTUbZDJqPmHx1
 h3WQxRzLA/5Z1WOSv5Q==
X-Authority-Analysis: v=2.4 cv=Y6XIdBeN c=1 sm=1 tr=0 ts=6a8292ca cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=lxwWJKsBKUC9JqiFEVgA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170033

Expose two new DRM IOCTLs that allow user-space to allocate DMA-backed
GEM buffer objects and retrieve their mmap offsets.

DRM_IOCTL_QDA_GEM_CREATE (drm_qda_gem_create)
  Allocates a DMA-coherent GEM buffer of the requested size. The
  memory manager assigns an IOMMU context bank to the calling process
  on first use and performs the DMA allocation against that bank.
  Returns a GEM handle that identifies the buffer for subsequent
  operations.

DRM_IOCTL_QDA_GEM_MMAP_OFFSET (drm_qda_gem_mmap_offset)
  Returns the mmap offset for an existing GEM handle. The offset can
  be passed directly to mmap() to map the buffer into user-space.
  Imported DMA-BUF objects are rejected by drm_gem_dumb_map_offset().

DRIVER_GEM is added to driver_features now that GEM IOCTLs are
present.

Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/accel/qda/qda_drv.c   |  4 +++-
 drivers/accel/qda/qda_ioctl.c | 50 +++++++++++++++++++++++++++++++++++++++++++
 drivers/accel/qda/qda_ioctl.h |  2 ++
 include/uapi/drm/qda_accel.h  | 36 +++++++++++++++++++++++++++++++
 4 files changed, 91 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
index 2b14dab95507..d22c2c66ffc4 100644
--- a/drivers/accel/qda/qda_drv.c
+++ b/drivers/accel/qda/qda_drv.c
@@ -43,10 +43,12 @@ DEFINE_DRM_ACCEL_FOPS(qda_accel_fops);
 
 static const struct drm_ioctl_desc qda_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(QDA_QUERY, qda_ioctl_query, 0),
+	DRM_IOCTL_DEF_DRV(QDA_GEM_CREATE, qda_ioctl_gem_create, 0),
+	DRM_IOCTL_DEF_DRV(QDA_GEM_MMAP_OFFSET, qda_ioctl_gem_mmap_offset, 0),
 };
 
 static const struct drm_driver qda_drm_driver = {
-	.driver_features = DRIVER_COMPUTE_ACCEL,
+	.driver_features = DRIVER_GEM | DRIVER_COMPUTE_ACCEL,
 	.fops = &qda_accel_fops,
 	.open = qda_open,
 	.postclose = qda_postclose,
diff --git a/drivers/accel/qda/qda_ioctl.c b/drivers/accel/qda/qda_ioctl.c
index c1d6c9bc0465..f65325c80a12 100644
--- a/drivers/accel/qda/qda_ioctl.c
+++ b/drivers/accel/qda/qda_ioctl.c
@@ -3,6 +3,7 @@
 #include <drm/drm_ioctl.h>
 #include <drm/qda_accel.h>
 #include "qda_drv.h"
+#include "qda_gem.h"
 #include "qda_ioctl.h"
 
 /**
@@ -33,3 +34,52 @@ int qda_ioctl_query(struct drm_device *dev, void *data, struct drm_file *file_pr
 
 	return 0;
 }
+
+/**
+ * qda_ioctl_gem_create() - Create a GEM buffer object
+ * @dev: DRM device structure
+ * @data: User-space data (struct drm_qda_gem_create)
+ * @file_priv: DRM file private data
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int qda_ioctl_gem_create(struct drm_device *dev, void *data, struct drm_file *file_priv)
+{
+	struct drm_qda_gem_create *args = data;
+	struct drm_gem_object *gem_obj;
+	struct qda_dev *qdev;
+
+	if (args->pad)
+		return -EINVAL;
+
+	qdev = qda_dev_from_drm(dev);
+	if (!qdev->iommu_mgr)
+		return -ENODEV;
+
+	gem_obj = qda_gem_create_object(dev, qdev->iommu_mgr, args->size, file_priv);
+	if (IS_ERR(gem_obj))
+		return PTR_ERR(gem_obj);
+
+	return qda_gem_create_handle(file_priv, gem_obj, &args->handle);
+}
+
+/**
+ * qda_ioctl_gem_mmap_offset() - Get the mmap offset for a GEM object
+ * @dev: DRM device structure
+ * @data: User-space data (struct drm_qda_gem_mmap_offset)
+ * @file_priv: DRM file private data
+ *
+ * Uses drm_gem_dumb_map_offset() which rejects imported dma-buf objects
+ * (mmap of imported objects is not allowed).
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int qda_ioctl_gem_mmap_offset(struct drm_device *dev, void *data, struct drm_file *file_priv)
+{
+	struct drm_qda_gem_mmap_offset *args = data;
+
+	if (args->pad)
+		return -EINVAL;
+
+	return drm_gem_dumb_map_offset(file_priv, dev, args->handle, &args->offset);
+}
diff --git a/drivers/accel/qda/qda_ioctl.h b/drivers/accel/qda/qda_ioctl.h
index b8fd536a111f..d1cbbfb6d965 100644
--- a/drivers/accel/qda/qda_ioctl.h
+++ b/drivers/accel/qda/qda_ioctl.h
@@ -9,5 +9,7 @@
 #include "qda_drv.h"
 
 int qda_ioctl_query(struct drm_device *dev, void *data, struct drm_file *file_priv);
+int qda_ioctl_gem_create(struct drm_device *dev, void *data, struct drm_file *file_priv);
+int qda_ioctl_gem_mmap_offset(struct drm_device *dev, void *data, struct drm_file *file_priv);
 
 #endif /* __QDA_IOCTL_H__ */
diff --git a/include/uapi/drm/qda_accel.h b/include/uapi/drm/qda_accel.h
index fe695347762c..1d699f00e7be 100644
--- a/include/uapi/drm/qda_accel.h
+++ b/include/uapi/drm/qda_accel.h
@@ -19,6 +19,8 @@ extern "C" {
  * They are used with DRM_COMMAND_BASE to create the full IOCTL numbers.
  */
 #define DRM_QDA_QUERY		0x00
+#define DRM_QDA_GEM_CREATE		0x01
+#define DRM_QDA_GEM_MMAP_OFFSET	0x02
 
 /*
  * QDA IOCTL definitions
@@ -29,6 +31,10 @@ extern "C" {
  */
 #define DRM_IOCTL_QDA_QUERY		DRM_IOWR(DRM_COMMAND_BASE + DRM_QDA_QUERY, \
 					 struct drm_qda_query)
+#define DRM_IOCTL_QDA_GEM_CREATE	DRM_IOWR(DRM_COMMAND_BASE + DRM_QDA_GEM_CREATE, \
+					  struct drm_qda_gem_create)
+#define DRM_IOCTL_QDA_GEM_MMAP_OFFSET	DRM_IOWR(DRM_COMMAND_BASE + DRM_QDA_GEM_MMAP_OFFSET, \
+					  struct drm_qda_gem_mmap_offset)
 
 /* Query type definitions for drm_qda_query */
 #define QDA_QUERY_DSP_NAME	1
@@ -48,6 +54,36 @@ struct drm_qda_query {
 	__u8 dsp_name[16];
 };
 
+/**
+ * struct drm_qda_gem_create - GEM buffer object creation parameters
+ * @size: Size of the GEM object to create in bytes (input)
+ * @handle: Allocated GEM handle (output)
+ *
+ * This structure is used with DRM_IOCTL_QDA_GEM_CREATE to allocate
+ * a new GEM buffer object.
+ */
+struct drm_qda_gem_create {
+	__u64 size;
+	__u32 handle;
+	__u32 pad;
+};
+
+/**
+ * struct drm_qda_gem_mmap_offset - GEM object mmap offset query
+ * @offset: mmap offset for the GEM object (output)
+ * @handle: GEM handle (input)
+ * @pad: Padding for 64-bit alignment
+ *
+ * This structure is used with DRM_IOCTL_QDA_GEM_MMAP_OFFSET to retrieve
+ * the mmap offset that can be used with mmap() to map the GEM object into
+ * user space.
+ */
+struct drm_qda_gem_mmap_offset {
+	__u64 offset;
+	__u32 handle;
+	__u32 pad;
+};
+
 #if defined(__cplusplus)
 }
 #endif

-- 
2.34.1

