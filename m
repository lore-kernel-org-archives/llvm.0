Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC912C326D
	for <llvm@lists.linux.dev>; Mon, 17 Aug 2026 04:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786942105; cv=none; b=EI2rDQH+kpHg1lpPw64oIUfEmZNCJ/BipibskH2SiNLbk6lR5MIlK62ZdrqAX9JsDyKua8qv1ERC7ItwxLNBLVjGUzWvmE/HMvJQZEfdLmXseZK6s2yyKlq2RIk5ZpJ0K10yGaOuRJq+Tz9LfVABs5+ajx7H5KEYzzxhMZVW9Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786942105; c=relaxed/simple;
	bh=hIrbWmJD0ELmEoKWXa2F2uGx8rOTlGvAJu1hlS5UQzk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CxKNQ9HCeYBVMQn+spzblRR/sI9aKeXyzURmOY1kySLwhtSeqQOZllxjukzIMNfZfgBgWXtQJvXdK2NxWTfjzY2SY6RcVrzEARTWnNEzP49a1T1S060dWzB6aCMgM0MQ86iy4mHQBZebD8sGFT/xnbuBzv7w5/7pc3HNrX06+8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OpZXLdGi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ccL+nAKS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OpZXLdGi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ccL+nAKS"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67GLFSlI350903
	for <llvm@lists.linux.dev>; Mon, 17 Aug 2026 04:48:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5sD4xExdiA0Vnoacy0mh+mqYbupmmmaZLz3mIlSwgrI=; b=OpZXLdGiOJ6Aku3W
	/MbHH2UpHpVxMLw7n/qEVrdY7mOnSDdWOgGSsVQMckcVQANmKDI26etWyN9rpFh8
	zg/N2NiCow0BBhhG0VJDITiFh1Xmk1H2k2lWczgYs2J92zC7MzoUs2Odr85QUEeA
	S8JzHreU+SvuQ6FF/b4Ecexl6oigcmcM987RgM9BJC4KJ+NbsQUlpdb81PYlT4yg
	fAG2YMsIw8Z9N0fqiii67P1xq8xcKtzjVIvjrL6v5yxl6mAiqDqMGehn6Ez2XG6Q
	PIwEYboDzgzLaIVzwZsFiWJhg3J/jyhlTdRSlRBCs0NXBc4hE/Uyh55Dp84k6+Ih
	SL2VBA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2ghena67-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Mon, 17 Aug 2026 04:48:22 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84a67b16217so4711076b3a.3
        for <llvm@lists.linux.dev>; Sun, 16 Aug 2026 21:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786942102; x=1787546902; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5sD4xExdiA0Vnoacy0mh+mqYbupmmmaZLz3mIlSwgrI=;
        b=ccL+nAKSdo1iAUipVnnnguA9uxuOMlBE/ECXXe0H8r31cYLKY6Lgr85wSoIRRMH+kF
         A4U5oR6oXRYYXFMzV1/z7w1TuXXKku9g96Dca5NRvzh8YdmFRDPDlPHwiIGMPAILLzcC
         dGKLhu8KXUqy7ZQsZ+ypBEBpJG2WsLTMIFXC5MdmDAQ8FOU/JquMmosKDIXP4nGIwjFQ
         x9Q7tUehLAdJkFuNY6vlHI6M8ciS/tUe7CxEpp6hKo6DFm8xNNDfoWQEXxpRfLvYUcol
         gOjtEVC1pzCgrQ56bc1x7jTi7Jv9SQoFsXjzKQhJUk4MnxPHAZMTATUMBaUf5lJd211B
         Q/kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786942102; x=1787546902;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5sD4xExdiA0Vnoacy0mh+mqYbupmmmaZLz3mIlSwgrI=;
        b=i68Y+W7jjU8i0i1M1e7nt45fMjbthqBGCEh/KvajyQCi4kRQwrwfU4iFexjffNTbSp
         lwu2APZLZ6odxZt0A5GLfh8GHTy95sKv31CRpacmLdG6k4gLUSEzPEy4Hmxthj/nH7Yt
         VkEOif+96ySNn7irqeDFnHgoz7uoJFymy2Jb0nQfA+ZQtppAyxvUWs8vqDPZWEbavgOr
         uwqRpjvnCMxDZ3fuUrcKjZtrPJbY1kCFDsxkHn2pyDc11MQxKFCpd8OnaCcCVcRBvRki
         KQYBQZ9JgvWWgCiVo23LiTIakIvXWvngrSXGJp+2kozrBcOCar0hcfNQIlxWMfFcTeHc
         umRA==
X-Forwarded-Encrypted: i=1; AHgh+RoQCw9+nEoVdckjCJAEpZ+f1t7KE5I6Eixov99+59y7q9GABcHnqbjnazPP2AvI6aoAeskH@lists.linux.dev
X-Gm-Message-State: AOJu0Yz02RHACbJ6voPOqLbzjfozV2eUd6WSgyMkxeoTDahaWrrEfMij
	5eoUW8jMrREGj/ez4Rltl2x+954wyPqsUNkKwmQRgmZcE54vRLjxOkWvPheSm4UX2rtm8nXdf4H
	oOEyxf4vBtAlRaAQqt17SYtdsj0f/NEj5Zp4ZSP5Be4npD6YcQ21K5Wnd
X-Gm-Gg: AR+sD13b+c+a7uPTdBxsv8M++iIQw7KdC24hjsrUTgXm1x2JNO9PsPwarnW8+niUGOJ
	VPCYDbnytBK4137049aj2hKqQlTv+D9lPMZJUxDm4Vd88kqKYb+h50WWAH/IMYAdLqlqaXPeoAB
	tEHM1/C8VEz4Tgx6IBHu3Tg1qL4SG/s/0Hd5QfA9gv3cL0d5VpFN5EEQ9sgz2PNWdrx0069DRNt
	v0P4O9V3mouJu14uPu7CByeiESg+O05/KVWgtK/BjUu5I4s8t2pDxS4y06bWO+uZa1rP4X34hX8
	FN08cyubY4MroEBNsqAulNEvt048daBPyE8tXbUKapFh32fhOiHITWRS+w3N4yI5hrULXPHU13n
	zOmUKhJrcQEIgOA+0TlYXOkB0+b9hxU20
X-Received: by 2002:a05:6a00:f86:b0:847:8504:9946 with SMTP id d2e1a72fcca58-84fde2e8c72mr22514553b3a.25.1786942101553;
        Sun, 16 Aug 2026 21:48:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:f86:b0:847:8504:9946 with SMTP id d2e1a72fcca58-84fde2e8c72mr22514485b3a.25.1786942101065;
        Sun, 16 Aug 2026 21:48:21 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8517d046638sm2149250b3a.27.2026.08.16.21.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 21:48:20 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 10:17:39 +0530
Subject: [PATCH v2 04/15] accel/qda: Add compute bus for QDA context banks
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260817-qda-v2-v2-4-69a02e9090d4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786942058; l=6606;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=hIrbWmJD0ELmEoKWXa2F2uGx8rOTlGvAJu1hlS5UQzk=;
 b=O2xo35ZfWnWAz0OLd+pRlGnuzFMigKI6sN4E66Oi933RmI69+04Ylda9tdZKP33nz5sbGtaBv
 qqJSz+e5gCUCZEbjcHI8VGSfdLsMX0ZGvZvGJE1JJhG9qS2SCwELQ2P
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Authority-Analysis: v=2.4 cv=EKc2FVZC c=1 sm=1 tr=0 ts=6a829296 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=DAPPgmGbAxSwGNae-agA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDAzMyBTYWx0ZWRfX9aZb5reczUGR
 bVf3KSJJqHJKz+dlz8Bn7sOcUlgT8OrkM3QZbJSJcC4XrFz+dbd1/5vswTwVY0EhWkDdpn0qOOl
 vpNY/OvMMJvOYaJ62IbKGeS7iZKV4YE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDAzMyBTYWx0ZWRfX1chp0s8L6+Js
 VSW0wfa4MbI8ADbkqS/hXPuAajd5pf5ffVlrLIlu5CG/ONScnGzpiQIN5JrqxICzOH3A4kf6wyb
 DuXQC2b6kzPViD6cbu8T9oNuHw/i2QrlQpzU5rjOOTN6zJajv4cH40JM5CjMlAzxUVFZjYFo5Sp
 YWZ+V57o5GyhFqyxTILG7HGUwQJTYvfadKndzx6nDzD327ElGvir8ji/hsn3oLqw1cNghdzqPCG
 4A2L+kayyU1EyeUskU5dsrbc8rcBHiRPldNpbWr2i4l6CugbjCyCRb/Gk+SchpA1pPP7p2Ryl7b
 gW6R7ls5xJK5EYwLIDbGeBRSJjKn/ke2MrHsK1ByNFu6AssDsa1mdo24pudlNU5FXmrZWSbCyrI
 4eEMeQdN1KKcLZ13G5VKe4ku1n0nLpbu6L3+i9gPGwfP+ue+Vdbn0lpTwVUs13xrHCq9iW76vKK
 TBOMIMlyLG2M0b7bSmw==
X-Proofpoint-GUID: 4oq9RC5N458Gb_2xORuHK1S32iSbLlb9
X-Proofpoint-ORIG-GUID: 4oq9RC5N458Gb_2xORuHK1S32iSbLlb9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170033

Introduce a custom virtual bus (qda-compute-cb) for managing IOMMU
context bank (CB) devices used by the QDA driver.

IOMMU context banks are synthetic constructs — they are not real
platform devices and do not appear as children of a platform bus node
in the device tree. Using a platform driver to represent them was
therefore incorrect and introduced a probe-ordering race: device nodes
were created before the RPMsg channel resources were fully initialized,
and because probe runs asynchronously, user-space could open a CB
device and attempt to start a session before the underlying transport
was ready.

The qda-compute-cb bus solves this by allowing the main QDA driver to
create CB devices explicitly and under its own control, making their
lifetime strictly subordinate to the parent qda_dev. The bus provides
a dma_configure callback that calls of_dma_configure() so that each CB
device gets its own IOMMU domain derived from its device-tree node,
enabling per-session memory isolation.

The bus type and the CB device constructor (create_qda_cb_device) are
exported for use by the QDA memory manager.

A hidden Kconfig symbol (DRM_ACCEL_QDA_COMPUTE_BUS) is introduced and
automatically selected by DRM_ACCEL_QDA so that the bus initialisation
runs via postcore_initcall before any QDA device probes.

Assisted-by: Claude:claude-sonnet-5
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/accel/Makefile              |  1 +
 drivers/accel/qda/Kconfig           |  4 ++
 drivers/accel/qda/Makefile          |  2 +
 drivers/accel/qda/qda_compute_bus.c | 80 +++++++++++++++++++++++++++++++++++++
 include/linux/qda_compute_bus.h     | 33 +++++++++++++++
 5 files changed, 120 insertions(+)

diff --git a/drivers/accel/Makefile b/drivers/accel/Makefile
index 58c08dd5f389..9ed843cd293f 100644
--- a/drivers/accel/Makefile
+++ b/drivers/accel/Makefile
@@ -6,4 +6,5 @@ obj-$(CONFIG_DRM_ACCEL_HABANALABS)	+= habanalabs/
 obj-$(CONFIG_DRM_ACCEL_IVPU)		+= ivpu/
 obj-$(CONFIG_DRM_ACCEL_QAIC)		+= qaic/
 obj-$(CONFIG_DRM_ACCEL_QDA)		+= qda/
+obj-$(CONFIG_DRM_ACCEL_QDA_COMPUTE_BUS) += qda/
 obj-$(CONFIG_DRM_ACCEL_ROCKET)		+= rocket/
\ No newline at end of file
diff --git a/drivers/accel/qda/Kconfig b/drivers/accel/qda/Kconfig
index e679cd00f092..e288458b63ab 100644
--- a/drivers/accel/qda/Kconfig
+++ b/drivers/accel/qda/Kconfig
@@ -3,11 +3,15 @@
 # Qualcomm DSP accelerator driver
 #
 
+config DRM_ACCEL_QDA_COMPUTE_BUS
+	bool
+
 config DRM_ACCEL_QDA
 	tristate "Qualcomm DSP accelerator"
 	depends on DRM_ACCEL
 	depends on ARCH_QCOM || COMPILE_TEST
 	depends on RPMSG
+	select DRM_ACCEL_QDA_COMPUTE_BUS
 	help
 	  Enables the DRM-based accelerator driver for Qualcomm's Hexagon DSPs.
 	  This driver provides a standardized interface for offloading computational
diff --git a/drivers/accel/qda/Makefile b/drivers/accel/qda/Makefile
index dbe809067a8b..424176f652a5 100644
--- a/drivers/accel/qda/Makefile
+++ b/drivers/accel/qda/Makefile
@@ -8,3 +8,5 @@ obj-$(CONFIG_DRM_ACCEL_QDA)	:= qda.o
 qda-y := \
 	qda_drv.o \
 	qda_rpmsg.o
+
+obj-$(CONFIG_DRM_ACCEL_QDA_COMPUTE_BUS) += qda_compute_bus.o
diff --git a/drivers/accel/qda/qda_compute_bus.c b/drivers/accel/qda/qda_compute_bus.c
new file mode 100644
index 000000000000..69ba3c1396b5
--- /dev/null
+++ b/drivers/accel/qda/qda_compute_bus.c
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+#include <linux/device.h>
+#include <linux/init.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/qda_compute_bus.h>
+#include <linux/slab.h>
+#include <linux/sprintf.h>
+
+static int qda_cb_bus_dma_configure(struct device *dev)
+{
+	return of_dma_configure(dev, dev->of_node, true);
+}
+
+const struct bus_type qda_cb_bus_type = {
+	.name = "qda-compute-cb",
+	.dma_configure = qda_cb_bus_dma_configure,
+};
+EXPORT_SYMBOL_GPL(qda_cb_bus_type);
+
+static void release_qda_cb_device(struct device *dev)
+{
+	of_node_put(dev->of_node);
+	kfree(dev);
+}
+
+struct device *qda_cb_device_create(struct device *parent_device, u64 dma_mask,
+				    struct device_node *of_node, const char *fmt, ...)
+{
+	struct device *dev;
+	va_list args;
+	char *name;
+	int ret;
+
+	va_start(args, fmt);
+	name = kvasprintf(GFP_KERNEL, fmt, args);
+	va_end(args);
+	if (!name)
+		return ERR_PTR(-ENOMEM);
+
+	dev = kzalloc_obj(*dev);
+	if (!dev) {
+		kfree(name);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	dev->release = release_qda_cb_device;
+	dev->bus = &qda_cb_bus_type;
+	dev->parent = parent_device;
+	dev->coherent_dma_mask = dma_mask;
+	dev->dma_mask = &dev->coherent_dma_mask;
+	dev->of_node = of_node_get(of_node);
+
+	dev_set_name(dev, "%s", name);
+	kfree(name);
+
+	ret = device_register(dev);
+	if (ret) {
+		put_device(dev);
+		return ERR_PTR(ret);
+	}
+
+	return dev;
+}
+EXPORT_SYMBOL_GPL(qda_cb_device_create);
+
+static int __init qda_cb_bus_init(void)
+{
+	int err;
+
+	err = bus_register(&qda_cb_bus_type);
+	if (err < 0) {
+		pr_err("qda-compute-cb bus registration failed: %d\n", err);
+		return err;
+	}
+	return 0;
+}
+
+postcore_initcall(qda_cb_bus_init);
diff --git a/include/linux/qda_compute_bus.h b/include/linux/qda_compute_bus.h
new file mode 100644
index 000000000000..cf7913b79741
--- /dev/null
+++ b/include/linux/qda_compute_bus.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __QDA_COMPUTE_BUS_H__
+#define __QDA_COMPUTE_BUS_H__
+
+#include <linux/device.h>
+
+/*
+ * Custom bus type for QDA compute context bank (CB) devices
+ *
+ * This bus type is used for manually created CB devices that represent
+ * IOMMU context banks. The custom bus allows proper IOMMU configuration
+ * and device management for these virtual devices.
+ */
+#ifdef CONFIG_DRM_ACCEL_QDA_COMPUTE_BUS
+extern const struct bus_type qda_cb_bus_type;
+
+struct device *qda_cb_device_create(struct device *parent_device, u64 dma_mask,
+				    struct device_node *of_node, const char *fmt, ...)
+#else
+static inline struct device *qda_cb_device_create(struct device *parent_device,
+						  u64 dma_mask,
+						  struct device_node *of_node,
+						  const char *fmt, ...)
+{
+	return ERR_PTR(-ENODEV);
+}
+#endif
+
+#endif /* __QDA_COMPUTE_BUS_H__ */

-- 
2.34.1

