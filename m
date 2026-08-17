Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD5B3168EE
	for <llvm@lists.linux.dev>; Mon, 17 Aug 2026 04:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786942131; cv=none; b=T7FbUsfv9qZkRG42YBByVU7hgRwuWVY6iUxNMxKBoN9iNBQJh4GigLM6DXYOmw5ReLyQHOdj83M73xtDaHVJVUhg87kKX6ZobvmXsdpsLovEQIUaF3YRP+LXpzZUs0Ez+IcXaoaE3v1Px2KiiM9rNvWmiPXJlwHsKLSsb7snnNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786942131; c=relaxed/simple;
	bh=GaNC5KyOUVtedEM4vDcIA16sNrsUeYMBbVNb53m92G4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zoto5qcKcXYRvek5/uIz9lAgEbFX5XqktHPGyyW1K1nzH33fopbFl2IJq77PO4DZ3akB5vlQpsd/qUN4aqGAH3Z7ynvE9A6vf2G9bxpch0vXjbcfPz/G5bl4KNjYQAqAn5lgA2grc/DFTf0fW0ge5Tl3KOeVb+d5vkpXzXpBtTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n2b/U8IE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DQw0cEpl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n2b/U8IE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DQw0cEpl"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67GLDCCH1386183
	for <llvm@lists.linux.dev>; Mon, 17 Aug 2026 04:48:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aPj5EJGXrEX2vogNN/02LdGACyu356VG9c1DNI0DIvE=; b=n2b/U8IExnaC7eGz
	JdB4ByAXC7gVbRPE6Zc2qleOH1WuiLXJHs4YMmiS8zEHucKqIVdtjmCsIq6DG3Vp
	wiJlWcyLWplTCsguwMLMY8c4l8mx4LtrXWjIPA3oq5HLV+AB0awTmnmaheoSirAZ
	+Mv6jnvVrrlrNTwzytUom2yRwRpuIuPxMdQUXaS9FjUsU7+nf6rTlc5iaiu9rgLY
	8NBkxvDEej0L2cf2q36VnUYojVGlvW1evL1EMSAOBfjmlUstFHqbQbTJn76otMUT
	pGXmUG1SQXhudq1+dA8opoOjuXCBC0MZbuYS1I36pziTPASC+IblG3f10LPU2Sys
	zvIuRQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3mx4rueb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Mon, 17 Aug 2026 04:48:48 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84a251c2e3eso4480213b3a.1
        for <llvm@lists.linux.dev>; Sun, 16 Aug 2026 21:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786942127; x=1787546927; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aPj5EJGXrEX2vogNN/02LdGACyu356VG9c1DNI0DIvE=;
        b=DQw0cEplPqBwjWuPAPn1mwWEdKne5jA1wrk7BtEC5q5V23pG0b7jT5AEknIMEz9NQU
         5lhZkLKnWywxy3ULpdaK3wDH0Isz/UepHTiM1AbSy7I4zQHM4pwxMABmp8nzKaDMa1Ks
         93Vifjvza5taHeFb5YC726W/wp33TObGMzdyj3q4y7wFDWI6zLzhn/PXriBfU02mqOrm
         YN+VTs9hNIx4pvwADFgYbzRafPP8JgNyrH+Qq+cJe0spOcwkh7F6Agsico4cod3nq3il
         CjouSOzb1++l8MTYaxyjOPp1YMGZbYR+dyvf3WQQ6dQ0TvSxecFE+jVVlJ43/V6qyZuu
         HeMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786942127; x=1787546927;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aPj5EJGXrEX2vogNN/02LdGACyu356VG9c1DNI0DIvE=;
        b=rWR1ySRA/w2LzaokyhOCKBkS4tPvpAcfpuUkWDilx6snoV99oeiiOMAnKgspTp8IKb
         GCBRLqQ7UcuG9WGNlUZDyjR3vjxDY2k70lY+XUFjhvoi7V1R/wwsctlIQfZ/nz6/1iVu
         RAv6eCteRFkWkvgFiYa2qcC7bcKwhriI31Qd/9gvMJjHICYcES4R8L7VwPdNyTzAuFtF
         JsfHQmr0MmyIkNb+jD3T/CTkG1qK/lKY2HsBYxcNdBGTrhuuy1iEcbhQjtvvgsZsqtbn
         IChqcn3MCuMrmDsClmKeoYwlT9Bk390S7V+o2i9TMp/hDTO2LzaQ0a85kaRlaNyWey+Y
         vVwA==
X-Forwarded-Encrypted: i=1; AHgh+RoyUBFtHYFx0AWfz3Gt8VifQkP8XCD7HYh4W2GeJaOCqUHrEgrcH0zyhv4bqj9bdckc5AhP@lists.linux.dev
X-Gm-Message-State: AOJu0YyoZzAgqS0Z3J4yJfcHXxNE0pzXKubHw7A/YRTWF08DC/cyfBHX
	QoUPx1ZNZhwWuY1lJEP/RwZDTCJDFzRUGkzZKLIjGJiWgFZM58GQynHGzgWm1PN5QWRdeYiryDa
	Li15Q3l6dXbUDkVOv6c81GYp/Wg9JCViNoWFmKkqh2iJ4EgkKIM/8tBym
X-Gm-Gg: AR+sD10s7v1f+B7Y7hJp/3du1XCswz0kg0P6R7nSwejb6ZnZ/OcxnLoulq+VLBGJ/8v
	T7Td/FW08I5yWC6OGkCa8Qbwpi0OI0e6qqWbrtNC9kX/WrV6RFEs7d5s9+fhJJUZnAOlxWOrtvt
	2fJ+SheneBED3MQh/twbxoWgQTU1lnu5C61i5ANYtQLXCwmknA37FMT2lwNl+NbuXeDOn2ZybR7
	aitejRjkPkhgjh6vR4hvNLRzKEPa9K/yAiYY+VLcSBsic2JVT65LCpzeu20G87NSIAD40C0FLep
	i+IPihVoLV+oYILyQigugL2ogYs2vwwgkaPGXX6TdP3qla1M3qmurf+LLJQVnVpQkWZJvd2MIJw
	B7fAd00bvE2jDeFK1kbRB6m3lGbjJePr4
X-Received: by 2002:a05:6a00:8d3:b0:84e:242:4bb2 with SMTP id d2e1a72fcca58-84fdc60d04fmr16090820b3a.4.1786942127418;
        Sun, 16 Aug 2026 21:48:47 -0700 (PDT)
X-Received: by 2002:a05:6a00:8d3:b0:84e:242:4bb2 with SMTP id d2e1a72fcca58-84fdc60d04fmr16090785b3a.4.1786942126872;
        Sun, 16 Aug 2026 21:48:46 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8517d046638sm2149250b3a.27.2026.08.16.21.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 21:48:46 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 10:17:42 +0530
Subject: [PATCH v2 07/15] accel/qda: Add memory manager for CB devices
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260817-qda-v2-v2-7-69a02e9090d4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786942058; l=13022;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=GaNC5KyOUVtedEM4vDcIA16sNrsUeYMBbVNb53m92G4=;
 b=GfuE4LhP/BpkV4+a1axBEb5F/Y3cGT6YUiuCkqe7Iate+aoFiad2Zl5T4ERz7o3flsfL/4KD0
 DEW/SXR/rdjBJ+yexhI+/znK1oRdH1FTLdLSQWeCpQJ25egA8TyVept
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Proofpoint-ORIG-GUID: klfRb9osQlRO6xrYTP5PYrTdnihMBvE3
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDAzMyBTYWx0ZWRfX3hAp70e0rco2
 dEKrbFvRlkZSJLaKgYP6ge7JAZlOwSN6UUYA2YWhSkU79VXXC49d9LT1bJ58L5nPF3Bsd55+iud
 7cfMIBX5R/HOmaN1n18U249T3O8/kUY=
X-Proofpoint-GUID: klfRb9osQlRO6xrYTP5PYrTdnihMBvE3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDAzMyBTYWx0ZWRfXzRekwiM3K3oq
 rC3ydEwEpHswUPmls154RNN+n+Z2/fgxfX+HchYpz3niwfqHsNZWRXj4OrJNRJmKQ30DbMGpn4O
 YxYV3wTQlMigprip7gAmAKzlWma3A1XTZJFXi4eRDgcR4WB2blMIdxooVx1JlKRjCWiPOCgofnI
 tO8kjCFL5ZlPKo3KjEAwnzLHZF0EVw+b07Sb08N4wUeMgFpSMkoGqrcP6WUtER0Lij22XqcLYqZ
 aHzIN0MlNwGjRF1oyKYI+b3D893B9c3brHppveFEY3fl9zS+XNeWfAK+XeEIK+azQGdATTF+l5k
 eSx7+IiJIA3rneOl6Hh8ptmTf+UZc+eE8UyTDbYx79VFBFZziHr4mNR1I5qxc3JLMyYjjC3LCSw
 gZx5kqjE43A1SxaeF3bJ0tW1vmD31I3FCELjsjb8dyS7TyfjLOpPDEWdse6O6Y2OVj/0y3YnjZE
 aN/fqAlaVb78ofiVmzw==
X-Authority-Analysis: v=2.4 cv=Y6XIdBeN c=1 sm=1 tr=0 ts=6a8292b0 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Q8zVK8GgYyqMKIWl2h0A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170033

Introduce the QDA memory manager (qda_memory_manager) to track the
IOMMU devices that back each compute context bank (CB).

Each CB device registered on the qda-compute-cb bus is wrapped in a
qda_iommu_device descriptor recording the device pointer and its stream
ID, and stored in the memory manager's registry. Later patches use this
registry to resolve the IOMMU device a session should allocate from.

The registry is a plain array sized to the number of
"qcom,fastrpc-compute-cb" nodes present in the device tree: the RPMsg
probe counts those nodes and passes the count to qda_init_device(),
which allocates the array in qda_memory_manager_init(). The memory
manager is created before CB devices are populated and destroyed after
they are torn down, so no dangling descriptors remain.

qda_cb_setup_device() is called immediately after a CB device is
registered on the bus: it allocates the descriptor, registers it with
the memory manager, and stores it as the CB device's driver data so
that qda_destroy_cb_device() can unregister and free it during teardown.

Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
Changes in v2:
- Replace the XArray with a plain array sized to the device tree's CB
  node count instead of a fixed 16-entry table (Dmitry Baryshkov)
- Fold the init_memory_manager()/cleanup_memory_manager() wrappers into
  qda_init_device()/qda_deinit_device() (Dmitry Baryshkov)
- Drop the pr_debug() calls (Dmitry Baryshkov)
- Use goto labels to unwind probe failures instead of open-coding the
  cleanup at each error site (Dmitry Baryshkov)
---
 drivers/accel/qda/Makefile             |  1 +
 drivers/accel/qda/qda_cb.c             | 39 ++++++++++++++
 drivers/accel/qda/qda_drv.c            | 26 +++++++++
 drivers/accel/qda/qda_drv.h            |  5 ++
 drivers/accel/qda/qda_memory_manager.c | 98 ++++++++++++++++++++++++++++++++++
 drivers/accel/qda/qda_memory_manager.h | 55 +++++++++++++++++++
 drivers/accel/qda/qda_rpmsg.c          | 23 +++++++-
 7 files changed, 246 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/qda/Makefile b/drivers/accel/qda/Makefile
index 143c9e4e789e..701fad5ffb50 100644
--- a/drivers/accel/qda/Makefile
+++ b/drivers/accel/qda/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_DRM_ACCEL_QDA)	:= qda.o
 qda-y := \
 	qda_cb.o \
 	qda_drv.o \
+	qda_memory_manager.o \
 	qda_rpmsg.o
 
 obj-$(CONFIG_DRM_ACCEL_QDA_COMPUTE_BUS) += qda_compute_bus.o
diff --git a/drivers/accel/qda/qda_cb.c b/drivers/accel/qda/qda_cb.c
index 9c5ef32f351e..cd32d6df6318 100644
--- a/drivers/accel/qda/qda_cb.c
+++ b/drivers/accel/qda/qda_cb.c
@@ -8,13 +8,40 @@
 #include <linux/slab.h>
 #include <drm/drm_print.h>
 #include "qda_drv.h"
+#include "qda_memory_manager.h"
 #include "qda_cb.h"
 
+static int qda_cb_setup_device(struct qda_dev *qdev, struct device *cb_dev, u32 sid)
+{
+	struct qda_iommu_device *iommu_dev;
+	int ret;
+
+	iommu_dev = kzalloc_obj(*iommu_dev);
+	if (!iommu_dev)
+		return -ENOMEM;
+
+	iommu_dev->dev = cb_dev;
+	iommu_dev->qdev = qdev;
+	iommu_dev->sid = sid;
+
+	ret = qda_memory_manager_register_device(qdev->iommu_mgr, iommu_dev);
+	if (ret) {
+		drm_err(&qdev->drm_dev, "Failed to register IOMMU device: %d\n", ret);
+		kfree(iommu_dev);
+		return ret;
+	}
+
+	dev_set_drvdata(cb_dev, iommu_dev);
+
+	return 0;
+}
+
 int qda_create_cb_device(struct qda_dev *qdev, struct device_node *cb_node)
 {
 	struct qda_cb_dev *entry;
 	struct device *cb_dev;
 	u32 sid = 0;
+	int ret;
 
 	if (of_property_read_u32(cb_node, "reg", &sid))
 		drm_info(&qdev->drm_dev, "No stream ID in DT node %pOFn, using 0\n", cb_node);
@@ -27,6 +54,12 @@ int qda_create_cb_device(struct qda_dev *qdev, struct device_node *cb_node)
 		return PTR_ERR(cb_dev);
 	}
 
+	ret = qda_cb_setup_device(qdev, cb_dev, sid);
+	if (ret) {
+		device_unregister(cb_dev);
+		return ret;
+	}
+
 	entry = kzalloc_obj(*entry);
 	if (!entry) {
 		qda_destroy_cb_device(cb_dev);
@@ -74,8 +107,14 @@ int qda_cb_populate(struct qda_dev *qdev, struct device_node *parent_node)
 
 void qda_destroy_cb_device(struct device *cb_dev)
 {
+	struct qda_iommu_device *iommu_dev;
 	struct iommu_group *group;
 
+	iommu_dev = dev_get_drvdata(cb_dev);
+	if (iommu_dev && iommu_dev->qdev->iommu_mgr)
+		qda_memory_manager_unregister_device(iommu_dev->qdev->iommu_mgr,
+						     iommu_dev);
+
 	group = iommu_group_get(cb_dev);
 	if (group) {
 		iommu_group_remove_device(cb_dev);
diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
index 09b6d5ac390b..fdc909facd95 100644
--- a/drivers/accel/qda/qda_drv.c
+++ b/drivers/accel/qda/qda_drv.c
@@ -56,6 +56,32 @@ struct qda_dev *qda_alloc_device(struct device *dev)
 	return qdev;
 }
 
+void qda_deinit_device(struct qda_dev *qdev)
+{
+	if (qdev->iommu_mgr) {
+		qda_memory_manager_exit(qdev->iommu_mgr);
+		kfree(qdev->iommu_mgr);
+		qdev->iommu_mgr = NULL;
+	}
+}
+
+int qda_init_device(struct qda_dev *qdev, int num_cbs)
+{
+	int ret;
+
+	qdev->iommu_mgr = kzalloc_obj(*qdev->iommu_mgr);
+	if (!qdev->iommu_mgr)
+		return -ENOMEM;
+	ret = qda_memory_manager_init(qdev->iommu_mgr, num_cbs);
+	if (ret) {
+		drm_err(&qdev->drm_dev, "Failed to initialize memory manager: %d\n", ret);
+		kfree(qdev->iommu_mgr);
+		qdev->iommu_mgr = NULL;
+	}
+
+	return ret;
+}
+
 int qda_register_device(struct qda_dev *qdev)
 {
 	int ret;
diff --git a/drivers/accel/qda/qda_drv.h b/drivers/accel/qda/qda_drv.h
index 3bd41b9593fa..690a833d732b 100644
--- a/drivers/accel/qda/qda_drv.h
+++ b/drivers/accel/qda/qda_drv.h
@@ -13,6 +13,7 @@
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
+#include "qda_memory_manager.h"
 
 /* Driver identification */
 #define QDA_DRIVER_NAME "qda"
@@ -40,6 +41,8 @@ struct qda_dev {
 	struct device *dev;
 	/** @cb_devs: Compute context-bank (CB) child devices */
 	struct list_head cb_devs;
+	/** @iommu_mgr: IOMMU/memory manager instance */
+	struct qda_memory_manager *iommu_mgr;
 	/** @dsp_name: Name of the DSP domain (e.g. "cdsp", "adsp") */
 	const char *dsp_name;
 };
@@ -59,6 +62,8 @@ static inline struct qda_dev *qda_dev_from_drm(struct drm_device *dev)
 struct qda_dev *qda_alloc_device(struct device *dev);
 
 /* Core device lifecycle */
+int qda_init_device(struct qda_dev *qdev, int num_cbs);
+void qda_deinit_device(struct qda_dev *qdev);
 int qda_register_device(struct qda_dev *qdev);
 
 #endif /* __QDA_DRV_H__ */
diff --git a/drivers/accel/qda/qda_memory_manager.c b/drivers/accel/qda/qda_memory_manager.c
new file mode 100644
index 000000000000..b1a80ee77c35
--- /dev/null
+++ b/drivers/accel/qda/qda_memory_manager.c
@@ -0,0 +1,98 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+
+#include <linux/slab.h>
+#include "qda_drv.h"
+#include "qda_memory_manager.h"
+
+static void cleanup_all_memory_devices(struct qda_memory_manager *mem_mgr)
+{
+	int i;
+
+	for (i = 0; i < mem_mgr->num_devices; i++) {
+		struct qda_iommu_device *iommu_dev = mem_mgr->devices[i];
+
+		if (!iommu_dev)
+			continue;
+
+		mem_mgr->devices[i] = NULL;
+		kfree(iommu_dev);
+	}
+	mem_mgr->num_devices = 0;
+}
+
+/**
+ * qda_memory_manager_register_device() - Register an IOMMU device
+ * @mem_mgr: Pointer to memory manager
+ * @iommu_dev: Pointer to IOMMU device to register
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int qda_memory_manager_register_device(struct qda_memory_manager *mem_mgr,
+				       struct qda_iommu_device *iommu_dev)
+{
+	if (mem_mgr->num_devices >= mem_mgr->max_devices)
+		return -ENOSPC;
+
+	iommu_dev->id = mem_mgr->num_devices;
+	mem_mgr->devices[mem_mgr->num_devices++] = iommu_dev;
+
+	return 0;
+}
+
+/**
+ * qda_memory_manager_unregister_device() - Unregister an IOMMU device
+ * @mem_mgr: Pointer to memory manager
+ * @iommu_dev: Pointer to IOMMU device to unregister
+ *
+ * Removes the device from the registry and frees it.
+ */
+void qda_memory_manager_unregister_device(struct qda_memory_manager *mem_mgr,
+					  struct qda_iommu_device *iommu_dev)
+{
+	int i;
+
+	for (i = 0; i < mem_mgr->num_devices; i++) {
+		if (mem_mgr->devices[i] == iommu_dev) {
+			mem_mgr->devices[i] = NULL;
+			break;
+		}
+	}
+
+	kfree(iommu_dev);
+}
+
+/**
+ * qda_memory_manager_init() - Initialize the memory manager
+ * @mem_mgr: Pointer to memory manager structure to initialize
+ * @max_devices: Number of IOMMU context bank devices to make room for
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int qda_memory_manager_init(struct qda_memory_manager *mem_mgr, int max_devices)
+{
+	if (max_devices <= 0)
+		return -EINVAL;
+
+	mem_mgr->devices = kcalloc(max_devices, sizeof(*mem_mgr->devices), GFP_KERNEL);
+	if (!mem_mgr->devices)
+		return -ENOMEM;
+
+	mem_mgr->num_devices = 0;
+	mem_mgr->max_devices = max_devices;
+
+	return 0;
+}
+
+/**
+ * qda_memory_manager_exit() - Clean up the memory manager
+ * @mem_mgr: Pointer to memory manager structure to clean up
+ */
+void qda_memory_manager_exit(struct qda_memory_manager *mem_mgr)
+{
+	cleanup_all_memory_devices(mem_mgr);
+
+	kfree(mem_mgr->devices);
+	mem_mgr->devices = NULL;
+	mem_mgr->max_devices = 0;
+}
diff --git a/drivers/accel/qda/qda_memory_manager.h b/drivers/accel/qda/qda_memory_manager.h
new file mode 100644
index 000000000000..7e38c8a18284
--- /dev/null
+++ b/drivers/accel/qda/qda_memory_manager.h
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __QDA_MEMORY_MANAGER_H__
+#define __QDA_MEMORY_MANAGER_H__
+
+#include <linux/device.h>
+
+/* Forward declarations */
+struct qda_dev;
+
+/**
+ * struct qda_iommu_device - IOMMU device instance for memory management
+ *
+ * Represents a single IOMMU-enabled device managed by the memory manager.
+ * Each device can be assigned to a specific process session.
+ */
+struct qda_iommu_device {
+	/** @dev: Pointer to the underlying device */
+	struct device *dev;
+	/** @qdev: Back-pointer to the parent QDA device */
+	struct qda_dev *qdev;
+	/** @id: Unique identifier assigned by the memory manager */
+	u32 id;
+	/** @sid: Stream ID for IOMMU transactions */
+	u32 sid;
+};
+
+/**
+ * struct qda_memory_manager - Central memory management coordinator
+ *
+ * Coordinates memory management across multiple IOMMU devices. Maintains
+ * a registry of devices in an array sized to the number of context banks
+ * described in the device tree.
+ */
+struct qda_memory_manager {
+	/** @devices: Array storing registered IOMMU devices */
+	struct qda_iommu_device **devices;
+	/** @num_devices: Number of registered IOMMU devices */
+	int num_devices;
+	/** @max_devices: Capacity of the @devices array */
+	int max_devices;
+};
+
+int qda_memory_manager_init(struct qda_memory_manager *mem_mgr, int max_devices);
+void qda_memory_manager_exit(struct qda_memory_manager *mem_mgr);
+
+int qda_memory_manager_register_device(struct qda_memory_manager *mem_mgr,
+				       struct qda_iommu_device *iommu_dev);
+void qda_memory_manager_unregister_device(struct qda_memory_manager *mem_mgr,
+					  struct qda_iommu_device *iommu_dev);
+
+#endif /* __QDA_MEMORY_MANAGER_H__ */
diff --git a/drivers/accel/qda/qda_rpmsg.c b/drivers/accel/qda/qda_rpmsg.c
index 723b3e61bf0a..64bf503106d9 100644
--- a/drivers/accel/qda/qda_rpmsg.c
+++ b/drivers/accel/qda/qda_rpmsg.c
@@ -42,11 +42,25 @@ static void qda_rpmsg_remove(struct rpmsg_device *rpdev)
 	drm_dev_unplug(&qdev->drm_dev);
 	qdev->rpdev = NULL;
 	qda_cb_unpopulate(qdev);
+	qda_deinit_device(qdev);
+}
+
+static int qda_count_cb_nodes(struct device_node *parent_node)
+{
+	struct device_node *child;
+	int count = 0;
+
+	for_each_child_of_node(parent_node, child)
+		if (of_device_is_compatible(child, "qcom,fastrpc-compute-cb"))
+			count++;
+
+	return count;
 }
 
 static int qda_rpmsg_probe(struct rpmsg_device *rpdev)
 {
 	struct qda_dev *qdev;
+	int num_cbs;
 	int ret;
 
 	qdev = qda_rpmsg_alloc_and_init_qdev(rpdev);
@@ -59,10 +73,15 @@ static int qda_rpmsg_probe(struct rpmsg_device *rpdev)
 		return ret;
 	}
 
-	ret = qda_cb_populate(qdev, rpdev->dev.of_node);
+	num_cbs = qda_count_cb_nodes(rpdev->dev.of_node);
+	ret = qda_init_device(qdev, num_cbs);
 	if (ret)
 		return ret;
 
+	ret = qda_cb_populate(qdev, rpdev->dev.of_node);
+	if (ret)
+		goto err_deinit;
+
 	ret = qda_register_device(qdev);
 	if (ret)
 		goto err_unpopulate;
@@ -71,6 +90,8 @@ static int qda_rpmsg_probe(struct rpmsg_device *rpdev)
 
 err_unpopulate:
 	qda_cb_unpopulate(qdev);
+err_deinit:
+	qda_deinit_device(qdev);
 	return ret;
 }
 

-- 
2.34.1

