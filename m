Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F84E110C
	for <llvm@lists.linux.dev>; Fri,  2 Dec 2022 18:32:40 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id h132so6182358oif.2
        for <llvm@lists.linux.dev>; Fri, 02 Dec 2022 10:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=list-id:mime-version:subject:message-id:cc:to:date:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QXGZfQn6HAsLocMKGxEOUqFxaC2fpFLtsT/QSQdQivY=;
        b=NNlYDbRBvepPsHi4j1BdrspJXGw8wtx1K9X9/Hua2H0JXwPaiRlMvvAGkLM+sAg5xT
         sfrVJsFKkz6787iy/rWoGE+RRKTE2PvejIj6pEl18gYcguh0CIbZHx5ki57IbtrehVs0
         BepxtLocEv87Opnz3gGuLtNEyBju993eAmB6xfNpdcNq3qL8GITCyqAAPyDvkg3GpekH
         A53DY50KK4a6Wtho6x7dINa9xKk4yCgsGOO1wQ4agn44ygnzNSULo5mhd7gNB2ReGCuh
         G1Zl7lVY/IJ6+4bffIDiMwtvoTKsGIKpMyyUSTnBPc37saxjC3U9Gk0wNV+YEZ371DM3
         Zmpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-id:mime-version:subject:message-id:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QXGZfQn6HAsLocMKGxEOUqFxaC2fpFLtsT/QSQdQivY=;
        b=rfT/R5PRGZ+Olgk9CGhhVLkHAZSnytbjS6OMH+Dm2mNDeBvWUYllSeJqgBFdJlNfHG
         IJwWGKlPo12L/YnBCcDiHllO3ZJYItIQLCWdZgVB4Mhdr/ELtICOErMNcgNf3g3BPKXt
         bka0MJO3/3/v/6tOGniXgqljBvaeThLGwtrs8U8B0tCB17ha/krZa2KCI2w+S85U/YjX
         CXg/ZprpGADrE/5aMn8nnyYxT9Bu4KZ4pJr3SF52rUYCazWyBJORCiJlUuesjN0cig8R
         xAF8c5vA/m+azQcYbREQpNsB4zc8S/whf2ZEg+j/ODG7NaLwoC37aZKEmGfesR6ittx9
         1SMw==
X-Gm-Message-State: ANoB5plj9+iavoDC0nnWbde0mYzs3tFepirS/CNHv05B70DSvJOKIg7g
	wZOUZXK7bvLWLQYwEql1YUKWOQ==
X-Google-Smtp-Source: AA0mqf47sztVwA3TBrPI5Gipgl+hmJ3wDlChnbGYzwkosF/En0nqYzNBsyrElKt2egXzxHvTfsaU7Q==
X-Received: by 2002:a05:6808:cc:b0:342:fc35:bda7 with SMTP id t12-20020a05680800cc00b00342fc35bda7mr24961108oic.168.1670005959177;
        Fri, 02 Dec 2022 10:32:39 -0800 (PST)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id r15-20020a4a964f000000b00499527def25sm3148280ooi.47.2022.12.02.10.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 10:32:18 -0800 (PST)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Fri, 2 Dec 2022 18:31:47 +0000 (UTC)
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: llvm@lists.linux.dev, arnd@linaro.org
Message-ID: <232055106.38855.1670005938185@jenkins.jenkins>
Subject: [TCWG CI] Failure after v6.1-rc4-181-g0d2b746b1bef: media:
 sun6i-csi: Add bridge v4l2 subdev with port management
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_38854_1952492349.1670005907872"
X-Jenkins-Job: TCWG Build tcwg_kernel/llvm-release-aarch64-next-allyesconfig
X-Jenkins-Result: SUCCESS
List-ID: 

------=_Part_38854_1952492349.1670005907872
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Failure after v6.1-rc4-181-g0d2b746b1bef: media: sun6i-csi: Add bridge v4l2 subdev with port management:

Results changed to
-10
# build_abe binutils:
-9
# build_kernel_llvm:
-5
# build_abe qemu:
-2
# linux_n_obj:
21401
# First few build errors in logs:
# 00:59:55 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c:272:2: error: variable 'enabled' is used uninitialized whenever switch default is taken [-Werror,-Wsometimes-uninitialized]
# 00:59:55 make[6]: *** [scripts/Makefile.build:250: drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.o] Error 1
# 00:59:55 make[5]: *** [scripts/Makefile.build:500: drivers/media/platform/sunxi/sun6i-csi] Error 2
# 01:00:19 make[4]: *** [scripts/Makefile.build:500: drivers/media/platform/sunxi] Error 2
# 01:02:14 make[3]: *** [scripts/Makefile.build:500: drivers/media/platform] Error 2
# 01:11:21 make[2]: *** [scripts/Makefile.build:500: drivers/media] Error 2
# 01:11:55 make[1]: *** [scripts/Makefile.build:500: drivers] Error 2
# 01:11:55 make: *** [Makefile:1992: .] Error 2

from
-10
# build_abe binutils:
-9
# build_kernel_llvm:
-5
# build_abe qemu:
-2
# linux_n_obj:
21479
# linux build successful:
all

THIS IS THE END OF INTERESTING STUFF.  BELOW ARE LINKS TO BUILDS, REPRODUCTION INSTRUCTIONS, AND THE RAW COMMIT.

For latest status see comments in https://linaro.atlassian.net/browse/LLVM-647 .
Status of v6.1-rc4-181-g0d2b746b1bef commit for tcwg_kernel:
commit 0d2b746b1bef73de62d2d311e594a7ffed4ca434
Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Date:   Thu Nov 3 16:30:46 2022 +0000

    media: sun6i-csi: Add bridge v4l2 subdev with port management
    
    Introduce a bridge v4l2 subdev to prepare for separation between the
    processing part (bridge) and the dma engine, which is required to
    properly support ths isp workflow later on.
    
    Currently the bridge just manages fwnode mapping to media pads,
    using an async notifier (which was previously in the main code).
    The s_stream video op just forwards to the connected v4l2 subdev
    (sensor or MIPI CSI-2 bridge).
    
    The video capture device is now registered after the bridge and
    attaches to it with a media link.
    
    Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
    Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
    Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
    Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
* llvm-release-aarch64-next-allyesconfig
** Failure after v6.1-rc4-181-g0d2b746b1bef: media: sun6i-csi: Add bridge v4l2 subdev with port management:
** https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-release-aarch64-next-allyesconfig/445/

Bad  build: https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-release-aarch64-next-allyesconfig/445/artifact/artifacts
Good build: https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-release-aarch64-next-allyesconfig/444/artifact/artifacts

Reproduce current build:
<cut>
mkdir -p investigate-linux-0d2b746b1bef73de62d2d311e594a7ffed4ca434
cd investigate-linux-0d2b746b1bef73de62d2d311e594a7ffed4ca434

# Fetch scripts
git clone https://git.linaro.org/toolchain/jenkins-scripts

# Fetch manifests for bad and good builds
mkdir -p bad/artifacts good/artifacts
curl -o bad/artifacts/manifest.sh https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-release-aarch64-next-allyesconfig/445/artifact/artifacts/manifest.sh --fail
curl -o good/artifacts/manifest.sh https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-release-aarch64-next-allyesconfig/444/artifact/artifacts/manifest.sh --fail

# Reproduce bad build
(cd bad; ../jenkins-scripts/tcwg_kernel-build.sh ^^ true %%rr[top_artifacts] artifacts)
# Reproduce good build
(cd good; ../jenkins-scripts/tcwg_kernel-build.sh ^^ true %%rr[top_artifacts] artifacts)
</cut>

Full commit (up to 1000 lines):
<cut>
commit 0d2b746b1bef73de62d2d311e594a7ffed4ca434
Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Date:   Thu Nov 3 16:30:46 2022 +0000

    media: sun6i-csi: Add bridge v4l2 subdev with port management
    
    Introduce a bridge v4l2 subdev to prepare for separation between the
    processing part (bridge) and the dma engine, which is required to
    properly support ths isp workflow later on.
    
    Currently the bridge just manages fwnode mapping to media pads,
    using an async notifier (which was previously in the main code).
    The s_stream video op just forwards to the connected v4l2 subdev
    (sensor or MIPI CSI-2 bridge).
    
    The video capture device is now registered after the bridge and
    attaches to it with a media link.
    
    Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
    Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
    Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
    Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 drivers/media/platform/sunxi/sun6i-csi/Makefile    |   2 +-
 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c | 157 ++-----
 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h |  10 +-
 .../platform/sunxi/sun6i-csi/sun6i_csi_bridge.c    | 450 +++++++++++++++++++++
 .../platform/sunxi/sun6i-csi/sun6i_csi_bridge.h    |  49 +++
 .../media/platform/sunxi/sun6i-csi/sun6i_video.c   |  19 +
 6 files changed, 548 insertions(+), 139 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/Makefile b/drivers/media/platform/sunxi/sun6i-csi/Makefile
index e7e315347804..7a699580a641 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/Makefile
+++ b/drivers/media/platform/sunxi/sun6i-csi/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-sun6i-csi-y += sun6i_video.o sun6i_csi.o
+sun6i-csi-y += sun6i_video.o sun6i_csi.o sun6i_csi_bridge.o
 
 obj-$(CONFIG_VIDEO_SUN6I_CSI) += sun6i-csi.o
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
index 9119f5e0e05e..537ffe804161 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
@@ -34,16 +34,17 @@
 bool sun6i_csi_is_format_supported(struct sun6i_csi_device *csi_dev,
 				   u32 pixformat, u32 mbus_code)
 {
-	struct sun6i_csi_v4l2 *v4l2 = &csi_dev->v4l2;
+	struct v4l2_fwnode_endpoint *endpoint =
+		&csi_dev->bridge.source_parallel.endpoint;
 
 	/*
 	 * Some video receivers have the ability to be compatible with
 	 * 8bit and 16bit bus width.
 	 * Identify the media bus format from device tree.
 	 */
-	if ((v4l2->v4l2_ep.bus_type == V4L2_MBUS_PARALLEL
-	     || v4l2->v4l2_ep.bus_type == V4L2_MBUS_BT656)
-	     && v4l2->v4l2_ep.bus.parallel.bus_width == 16) {
+	if ((endpoint->bus_type == V4L2_MBUS_PARALLEL
+	     || endpoint->bus_type == V4L2_MBUS_BT656)
+	     && endpoint->bus.parallel.bus_width == 16) {
 		switch (pixformat) {
 		case V4L2_PIX_FMT_NV12_16L16:
 		case V4L2_PIX_FMT_NV12:
@@ -328,7 +329,8 @@ static enum csi_input_seq get_csi_input_seq(struct sun6i_csi_device *csi_dev,
 
 static void sun6i_csi_setup_bus(struct sun6i_csi_device *csi_dev)
 {
-	struct v4l2_fwnode_endpoint *endpoint = &csi_dev->v4l2.v4l2_ep;
+	struct v4l2_fwnode_endpoint *endpoint =
+		&csi_dev->bridge.source_parallel.endpoint;
 	struct sun6i_csi_config *config = &csi_dev->config;
 	unsigned char bus_width;
 	u32 flags;
@@ -583,103 +585,11 @@ static const struct media_device_ops sun6i_csi_media_ops = {
 
 /* V4L2 */
 
-static int sun6i_csi_link_entity(struct sun6i_csi_device *csi_dev,
-				 struct media_entity *entity,
-				 struct fwnode_handle *fwnode)
-{
-	struct media_entity *sink;
-	struct media_pad *sink_pad;
-	int src_pad_index;
-	int ret;
-
-	ret = media_entity_get_fwnode_pad(entity, fwnode, MEDIA_PAD_FL_SOURCE);
-	if (ret < 0) {
-		dev_err(csi_dev->dev,
-			"%s: no source pad in external entity %s\n", __func__,
-			entity->name);
-		return -EINVAL;
-	}
-
-	src_pad_index = ret;
-
-	sink = &csi_dev->video.video_dev.entity;
-	sink_pad = &csi_dev->video.pad;
-
-	dev_dbg(csi_dev->dev, "creating %s:%u -> %s:%u link\n",
-		entity->name, src_pad_index, sink->name, sink_pad->index);
-	ret = media_create_pad_link(entity, src_pad_index, sink,
-				    sink_pad->index,
-				    MEDIA_LNK_FL_ENABLED |
-				    MEDIA_LNK_FL_IMMUTABLE);
-	if (ret < 0) {
-		dev_err(csi_dev->dev, "failed to create %s:%u -> %s:%u link\n",
-			entity->name, src_pad_index,
-			sink->name, sink_pad->index);
-		return ret;
-	}
-
-	return 0;
-}
-
-static int sun6i_subdev_notify_complete(struct v4l2_async_notifier *notifier)
-{
-	struct sun6i_csi_device *csi_dev =
-		container_of(notifier, struct sun6i_csi_device,
-			     v4l2.notifier);
-	struct sun6i_csi_v4l2 *v4l2 = &csi_dev->v4l2;
-	struct v4l2_device *v4l2_dev = &v4l2->v4l2_dev;
-	struct v4l2_subdev *sd;
-	int ret;
-
-	dev_dbg(csi_dev->dev, "notify complete, all subdevs registered\n");
-
-	sd = list_first_entry(&v4l2_dev->subdevs, struct v4l2_subdev, list);
-	if (!sd)
-		return -EINVAL;
-
-	ret = sun6i_csi_link_entity(csi_dev, &sd->entity, sd->fwnode);
-	if (ret < 0)
-		return ret;
-
-	ret = v4l2_device_register_subdev_nodes(v4l2_dev);
-	if (ret < 0)
-		return ret;
-
-	return 0;
-}
-
-static const struct v4l2_async_notifier_operations sun6i_csi_async_ops = {
-	.complete = sun6i_subdev_notify_complete,
-};
-
-static int sun6i_csi_fwnode_parse(struct device *dev,
-				  struct v4l2_fwnode_endpoint *vep,
-				  struct v4l2_async_subdev *asd)
-{
-	struct sun6i_csi_device *csi_dev = dev_get_drvdata(dev);
-
-	if (vep->base.port || vep->base.id) {
-		dev_warn(dev, "Only support a single port with one endpoint\n");
-		return -ENOTCONN;
-	}
-
-	switch (vep->bus_type) {
-	case V4L2_MBUS_PARALLEL:
-	case V4L2_MBUS_BT656:
-		csi_dev->v4l2.v4l2_ep = *vep;
-		return 0;
-	default:
-		dev_err(dev, "Unsupported media bus type\n");
-		return -ENOTCONN;
-	}
-}
-
 static int sun6i_csi_v4l2_setup(struct sun6i_csi_device *csi_dev)
 {
 	struct sun6i_csi_v4l2 *v4l2 = &csi_dev->v4l2;
 	struct media_device *media_dev = &v4l2->media_dev;
 	struct v4l2_device *v4l2_dev = &v4l2->v4l2_dev;
-	struct v4l2_async_notifier *notifier = &v4l2->notifier;
 	struct device *dev = csi_dev->dev;
 	int ret;
 
@@ -709,42 +619,8 @@ static int sun6i_csi_v4l2_setup(struct sun6i_csi_device *csi_dev)
 		goto error_media;
 	}
 
-	/* Video */
-
-	ret = sun6i_video_setup(csi_dev);
-	if (ret)
-		goto error_v4l2_device;
-
-	/* V4L2 Async */
-
-	v4l2_async_nf_init(notifier);
-	notifier->ops = &sun6i_csi_async_ops;
-
-	ret = v4l2_async_nf_parse_fwnode_endpoints(dev, notifier,
-						   sizeof(struct
-							  v4l2_async_subdev),
-						   sun6i_csi_fwnode_parse);
-	if (ret)
-		goto error_video;
-
-	ret = v4l2_async_nf_register(v4l2_dev, notifier);
-	if (ret) {
-		dev_err(dev, "failed to register v4l2 async notifier: %d\n",
-			ret);
-		goto error_v4l2_async_notifier;
-	}
-
 	return 0;
 
-error_v4l2_async_notifier:
-	v4l2_async_nf_cleanup(notifier);
-
-error_video:
-	sun6i_video_cleanup(csi_dev);
-
-error_v4l2_device:
-	v4l2_device_unregister(&v4l2->v4l2_dev);
-
 error_media:
 	media_device_unregister(media_dev);
 	media_device_cleanup(media_dev);
@@ -757,9 +633,6 @@ static void sun6i_csi_v4l2_cleanup(struct sun6i_csi_device *csi_dev)
 	struct sun6i_csi_v4l2 *v4l2 = &csi_dev->v4l2;
 
 	media_device_unregister(&v4l2->media_dev);
-	v4l2_async_nf_unregister(&v4l2->notifier);
-	v4l2_async_nf_cleanup(&v4l2->notifier);
-	sun6i_video_cleanup(csi_dev);
 	v4l2_device_unregister(&v4l2->v4l2_dev);
 	media_device_cleanup(&v4l2->media_dev);
 }
@@ -963,8 +836,22 @@ static int sun6i_csi_probe(struct platform_device *platform_dev)
 	if (ret)
 		goto error_resources;
 
+	ret = sun6i_csi_bridge_setup(csi_dev);
+	if (ret)
+		goto error_v4l2;
+
+	ret = sun6i_video_setup(csi_dev);
+	if (ret)
+		goto error_bridge;
+
 	return 0;
 
+error_bridge:
+	sun6i_csi_bridge_cleanup(csi_dev);
+
+error_v4l2:
+	sun6i_csi_v4l2_cleanup(csi_dev);
+
 error_resources:
 	sun6i_csi_resources_cleanup(csi_dev);
 
@@ -975,6 +862,8 @@ static int sun6i_csi_remove(struct platform_device *pdev)
 {
 	struct sun6i_csi_device *csi_dev = platform_get_drvdata(pdev);
 
+	sun6i_video_cleanup(csi_dev);
+	sun6i_csi_bridge_cleanup(csi_dev);
 	sun6i_csi_v4l2_cleanup(csi_dev);
 	sun6i_csi_resources_cleanup(csi_dev);
 
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
index bab705678280..1dd76631ec87 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
@@ -12,11 +12,16 @@
 #include <media/v4l2-fwnode.h>
 #include <media/videobuf2-v4l2.h>
 
+#include "sun6i_csi_bridge.h"
 #include "sun6i_video.h"
 
 #define SUN6I_CSI_NAME		"sun6i-csi"
 #define SUN6I_CSI_DESCRIPTION	"Allwinner A31 CSI Device"
 
+enum sun6i_csi_port {
+	SUN6I_CSI_PORT_PARALLEL		= 0,
+};
+
 struct sun6i_csi_buffer {
 	struct vb2_v4l2_buffer		v4l2_buffer;
 	struct list_head		list;
@@ -44,10 +49,6 @@ struct sun6i_csi_config {
 struct sun6i_csi_v4l2 {
 	struct v4l2_device		v4l2_dev;
 	struct media_device		media_dev;
-
-	struct v4l2_async_notifier	notifier;
-	/* video port settings */
-	struct v4l2_fwnode_endpoint	v4l2_ep;
 };
 
 struct sun6i_csi_device {
@@ -55,6 +56,7 @@ struct sun6i_csi_device {
 
 	struct sun6i_csi_config		config;
 	struct sun6i_csi_v4l2		v4l2;
+	struct sun6i_csi_bridge		bridge;
 	struct sun6i_video		video;
 
 	struct regmap			*regmap;
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
new file mode 100644
index 000000000000..cac1b150e544
--- /dev/null
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
@@ -0,0 +1,450 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2021-2022 Bootlin
+ * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
+ */
+
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-fwnode.h>
+
+#include "sun6i_csi.h"
+#include "sun6i_csi_bridge.h"
+
+/* Format */
+
+static const u32 sun6i_csi_bridge_mbus_codes[] = {
+	/* Bayer */
+	MEDIA_BUS_FMT_SBGGR8_1X8,
+	MEDIA_BUS_FMT_SGBRG8_1X8,
+	MEDIA_BUS_FMT_SGRBG8_1X8,
+	MEDIA_BUS_FMT_SRGGB8_1X8,
+	MEDIA_BUS_FMT_SBGGR10_1X10,
+	MEDIA_BUS_FMT_SGBRG10_1X10,
+	MEDIA_BUS_FMT_SGRBG10_1X10,
+	MEDIA_BUS_FMT_SRGGB10_1X10,
+	MEDIA_BUS_FMT_SBGGR12_1X12,
+	MEDIA_BUS_FMT_SGBRG12_1X12,
+	MEDIA_BUS_FMT_SGRBG12_1X12,
+	MEDIA_BUS_FMT_SRGGB12_1X12,
+	/* RGB */
+	MEDIA_BUS_FMT_RGB565_2X8_LE,
+	MEDIA_BUS_FMT_RGB565_2X8_BE,
+	/* YUV422 */
+	MEDIA_BUS_FMT_YUYV8_2X8,
+	MEDIA_BUS_FMT_UYVY8_2X8,
+	MEDIA_BUS_FMT_YVYU8_2X8,
+	MEDIA_BUS_FMT_UYVY8_2X8,
+	MEDIA_BUS_FMT_VYUY8_2X8,
+	MEDIA_BUS_FMT_YUYV8_1X16,
+	MEDIA_BUS_FMT_UYVY8_1X16,
+	MEDIA_BUS_FMT_YVYU8_1X16,
+	MEDIA_BUS_FMT_UYVY8_1X16,
+	MEDIA_BUS_FMT_VYUY8_1X16,
+	/* Compressed */
+	MEDIA_BUS_FMT_JPEG_1X8,
+};
+
+static bool sun6i_csi_bridge_mbus_code_check(u32 mbus_code)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(sun6i_csi_bridge_mbus_codes); i++)
+		if (sun6i_csi_bridge_mbus_codes[i] == mbus_code)
+			return true;
+
+	return false;
+}
+
+/* V4L2 Subdev */
+
+static int sun6i_csi_bridge_s_stream(struct v4l2_subdev *subdev, int on)
+{
+	struct sun6i_csi_device *csi_dev = v4l2_get_subdevdata(subdev);
+	struct sun6i_csi_bridge *bridge = &csi_dev->bridge;
+	struct media_pad *local_pad = &bridge->pads[SUN6I_CSI_BRIDGE_PAD_SINK];
+	struct device *dev = csi_dev->dev;
+	struct v4l2_subdev *source_subdev;
+	struct media_pad *remote_pad;
+	/* Initialize to 0 to use both in disable label (ret != 0) and off. */
+	int ret = 0;
+
+	/* Source */
+
+	remote_pad = media_pad_remote_pad_unique(local_pad);
+	if (IS_ERR(remote_pad)) {
+		dev_err(dev,
+			"zero or more than a single source connected to the bridge\n");
+		return PTR_ERR(remote_pad);
+	}
+
+	source_subdev = media_entity_to_v4l2_subdev(remote_pad->entity);
+
+	if (!on) {
+		v4l2_subdev_call(source_subdev, video, s_stream, 0);
+		goto disable;
+	}
+
+	ret = v4l2_subdev_call(source_subdev, video, s_stream, 1);
+	if (ret && ret != -ENOIOCTLCMD)
+		goto disable;
+
+	return 0;
+
+disable:
+
+	return ret;
+}
+
+static const struct v4l2_subdev_video_ops sun6i_csi_bridge_video_ops = {
+	.s_stream	= sun6i_csi_bridge_s_stream,
+};
+
+static void
+sun6i_csi_bridge_mbus_format_prepare(struct v4l2_mbus_framefmt *mbus_format)
+{
+	if (!sun6i_csi_bridge_mbus_code_check(mbus_format->code))
+		mbus_format->code = sun6i_csi_bridge_mbus_codes[0];
+
+	mbus_format->field = V4L2_FIELD_NONE;
+	mbus_format->colorspace = V4L2_COLORSPACE_RAW;
+	mbus_format->quantization = V4L2_QUANTIZATION_DEFAULT;
+	mbus_format->xfer_func = V4L2_XFER_FUNC_DEFAULT;
+}
+
+static int sun6i_csi_bridge_init_cfg(struct v4l2_subdev *subdev,
+				     struct v4l2_subdev_state *state)
+{
+	struct sun6i_csi_device *csi_dev = v4l2_get_subdevdata(subdev);
+	unsigned int pad = SUN6I_CSI_BRIDGE_PAD_SINK;
+	struct v4l2_mbus_framefmt *mbus_format =
+		v4l2_subdev_get_try_format(subdev, state, pad);
+	struct mutex *lock = &csi_dev->bridge.lock;
+
+	mutex_lock(lock);
+
+	mbus_format->code = sun6i_csi_bridge_mbus_codes[0];
+	mbus_format->width = 1280;
+	mbus_format->height = 720;
+
+	sun6i_csi_bridge_mbus_format_prepare(mbus_format);
+
+	mutex_unlock(lock);
+
+	return 0;
+}
+
+static int
+sun6i_csi_bridge_enum_mbus_code(struct v4l2_subdev *subdev,
+				struct v4l2_subdev_state *state,
+				struct v4l2_subdev_mbus_code_enum *code_enum)
+{
+	if (code_enum->index >= ARRAY_SIZE(sun6i_csi_bridge_mbus_codes))
+		return -EINVAL;
+
+	code_enum->code = sun6i_csi_bridge_mbus_codes[code_enum->index];
+
+	return 0;
+}
+
+static int sun6i_csi_bridge_get_fmt(struct v4l2_subdev *subdev,
+				    struct v4l2_subdev_state *state,
+				    struct v4l2_subdev_format *format)
+{
+	struct sun6i_csi_device *csi_dev = v4l2_get_subdevdata(subdev);
+	struct v4l2_mbus_framefmt *mbus_format = &format->format;
+	struct mutex *lock = &csi_dev->bridge.lock;
+
+	mutex_lock(lock);
+
+	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
+		*mbus_format = *v4l2_subdev_get_try_format(subdev, state,
+							   format->pad);
+	else
+		*mbus_format = csi_dev->bridge.mbus_format;
+
+	mutex_unlock(lock);
+
+	return 0;
+}
+
+static int sun6i_csi_bridge_set_fmt(struct v4l2_subdev *subdev,
+				    struct v4l2_subdev_state *state,
+				    struct v4l2_subdev_format *format)
+{
+	struct sun6i_csi_device *csi_dev = v4l2_get_subdevdata(subdev);
+	struct v4l2_mbus_framefmt *mbus_format = &format->format;
+	struct mutex *lock = &csi_dev->bridge.lock;
+
+	mutex_lock(lock);
+
+	sun6i_csi_bridge_mbus_format_prepare(mbus_format);
+
+	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
+		*v4l2_subdev_get_try_format(subdev, state, format->pad) =
+			*mbus_format;
+	else
+		csi_dev->bridge.mbus_format = *mbus_format;
+
+	mutex_unlock(lock);
+
+	return 0;
+}
+
+static const struct v4l2_subdev_pad_ops sun6i_csi_bridge_pad_ops = {
+	.init_cfg	= sun6i_csi_bridge_init_cfg,
+	.enum_mbus_code	= sun6i_csi_bridge_enum_mbus_code,
+	.get_fmt	= sun6i_csi_bridge_get_fmt,
+	.set_fmt	= sun6i_csi_bridge_set_fmt,
+};
+
+const struct v4l2_subdev_ops sun6i_csi_bridge_subdev_ops = {
+	.video	= &sun6i_csi_bridge_video_ops,
+	.pad	= &sun6i_csi_bridge_pad_ops,
+};
+
+/* Media Entity */
+
+static const struct media_entity_operations sun6i_csi_bridge_entity_ops = {
+	.link_validate	= v4l2_subdev_link_validate,
+};
+
+/* V4L2 Async */
+
+static int sun6i_csi_bridge_link(struct sun6i_csi_device *csi_dev,
+				 int sink_pad_index,
+				 struct v4l2_subdev *remote_subdev,
+				 bool enabled)
+{
+	struct device *dev = csi_dev->dev;
+	struct v4l2_subdev *subdev = &csi_dev->bridge.subdev;
+	struct media_entity *sink_entity = &subdev->entity;
+	struct media_entity *source_entity = &remote_subdev->entity;
+	int source_pad_index;
+	int ret;
+
+	/* Get the first remote source pad. */
+	ret = media_entity_get_fwnode_pad(source_entity, remote_subdev->fwnode,
+					  MEDIA_PAD_FL_SOURCE);
+	if (ret < 0) {
+		dev_err(dev, "missing source pad in external entity %s\n",
+			source_entity->name);
+		return -EINVAL;
+	}
+
+	source_pad_index = ret;
+
+	dev_dbg(dev, "creating %s:%u -> %s:%u link\n", source_entity->name,
+		source_pad_index, sink_entity->name, sink_pad_index);
+
+	ret = media_create_pad_link(source_entity, source_pad_index,
+				    sink_entity, sink_pad_index,
+				    enabled ? MEDIA_LNK_FL_ENABLED : 0);
+	if (ret < 0) {
+		dev_err(dev, "failed to create %s:%u -> %s:%u link\n",
+			source_entity->name, source_pad_index,
+			sink_entity->name, sink_pad_index);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int
+sun6i_csi_bridge_notifier_bound(struct v4l2_async_notifier *notifier,
+				struct v4l2_subdev *remote_subdev,
+				struct v4l2_async_subdev *async_subdev)
+{
+	struct sun6i_csi_device *csi_dev =
+		container_of(notifier, struct sun6i_csi_device,
+			     bridge.notifier);
+	struct sun6i_csi_bridge_async_subdev *bridge_async_subdev =
+		container_of(async_subdev, struct sun6i_csi_bridge_async_subdev,
+			     async_subdev);
+	struct sun6i_csi_bridge_source *source = bridge_async_subdev->source;
+	bool enabled;
+
+	switch (source->endpoint.base.port) {
+	case SUN6I_CSI_PORT_PARALLEL:
+		enabled = true;
+		break;
+	default:
+		break;
+	}
+
+	source->subdev = remote_subdev;
+
+	return sun6i_csi_bridge_link(csi_dev, SUN6I_CSI_BRIDGE_PAD_SINK,
+				     remote_subdev, enabled);
+}
+
+static int
+sun6i_csi_bridge_notifier_complete(struct v4l2_async_notifier *notifier)
+{
+	struct sun6i_csi_device *csi_dev =
+		container_of(notifier, struct sun6i_csi_device,
+			     bridge.notifier);
+	struct v4l2_device *v4l2_dev = &csi_dev->v4l2.v4l2_dev;
+
+	return v4l2_device_register_subdev_nodes(v4l2_dev);
+}
+
+static const struct v4l2_async_notifier_operations
+sun6i_csi_bridge_notifier_ops = {
+	.bound		= sun6i_csi_bridge_notifier_bound,
+	.complete	= sun6i_csi_bridge_notifier_complete,
+};
+
+/* Bridge */
+
+static int sun6i_csi_bridge_source_setup(struct sun6i_csi_device *csi_dev,
+					 struct sun6i_csi_bridge_source *source,
+					 u32 port,
+					 enum v4l2_mbus_type *bus_types)
+{
+	struct device *dev = csi_dev->dev;
+	struct v4l2_async_notifier *notifier = &csi_dev->bridge.notifier;
+	struct v4l2_fwnode_endpoint *endpoint = &source->endpoint;
+	struct sun6i_csi_bridge_async_subdev *bridge_async_subdev;
+	struct fwnode_handle *handle;
+	int ret;
+
+	handle = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), port, 0, 0);
+	if (!handle)
+		return -ENODEV;
+
+	ret = v4l2_fwnode_endpoint_parse(handle, endpoint);
+	if (ret)
+		goto complete;
+
+	if (bus_types) {
+		bool valid = false;
+		unsigned int i;
+
+		for (i = 0; bus_types[i] != V4L2_MBUS_INVALID; i++) {
+			if (endpoint->bus_type == bus_types[i]) {
+				valid = true;
+				break;
+			}
+		}
+
+		if (!valid) {
+			dev_err(dev, "unsupported bus type for port %d\n",
+				port);
+			ret = -EINVAL;
+			goto complete;
+		}
+	}
+
+	bridge_async_subdev =
+		v4l2_async_nf_add_fwnode_remote(notifier, handle,
+						struct
+						sun6i_csi_bridge_async_subdev);
+	if (IS_ERR(bridge_async_subdev)) {
+		ret = PTR_ERR(bridge_async_subdev);
+		goto complete;
+	}
+
+	bridge_async_subdev->source = source;
+
+	source->expected = true;
+
+complete:
+	fwnode_handle_put(handle);
+
+	return ret;
+}
+
+int sun6i_csi_bridge_setup(struct sun6i_csi_device *csi_dev)
+{
+	struct device *dev = csi_dev->dev;
+	struct sun6i_csi_bridge *bridge = &csi_dev->bridge;
+	struct v4l2_device *v4l2_dev = &csi_dev->v4l2.v4l2_dev;
+	struct v4l2_subdev *subdev = &bridge->subdev;
+	struct v4l2_async_notifier *notifier = &bridge->notifier;
+	struct media_pad *pads = bridge->pads;
+	enum v4l2_mbus_type parallel_mbus_types[] = {
+		V4L2_MBUS_PARALLEL,
+		V4L2_MBUS_BT656,
+		V4L2_MBUS_INVALID
+	};
+	int ret;
+
+	mutex_init(&bridge->lock);
+
+	/* V4L2 Subdev */
+
+	v4l2_subdev_init(subdev, &sun6i_csi_bridge_subdev_ops);
+	strscpy(subdev->name, SUN6I_CSI_BRIDGE_NAME, sizeof(subdev->name));
+	subdev->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	subdev->owner = THIS_MODULE;
+	subdev->dev = dev;
+
+	v4l2_set_subdevdata(subdev, csi_dev);
+
+	/* Media Entity */
+
+	subdev->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
+	subdev->entity.ops = &sun6i_csi_bridge_entity_ops;
+
+	/* Media Pads */
+
+	pads[SUN6I_CSI_BRIDGE_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
+	pads[SUN6I_CSI_BRIDGE_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE |
+						  MEDIA_PAD_FL_MUST_CONNECT;
+
+	ret = media_entity_pads_init(&subdev->entity,
+				     SUN6I_CSI_BRIDGE_PAD_COUNT, pads);
+	if (ret < 0)
+		return ret;
+
+	/* V4L2 Subdev */
+
+	ret = v4l2_device_register_subdev(v4l2_dev, subdev);
+	if (ret) {
+		dev_err(dev, "failed to register v4l2 subdev: %d\n", ret);
+		goto error_media_entity;
+	}
+
+	/* V4L2 Async */
+
+	v4l2_async_nf_init(notifier);
+	notifier->ops = &sun6i_csi_bridge_notifier_ops;
+
+	sun6i_csi_bridge_source_setup(csi_dev, &bridge->source_parallel,
+				      SUN6I_CSI_PORT_PARALLEL,
+				      parallel_mbus_types);
+
+	ret = v4l2_async_nf_register(v4l2_dev, notifier);
+	if (ret) {
+		dev_err(dev, "failed to register v4l2 async notifier: %d\n",
+			ret);
+		goto error_v4l2_async_notifier;
+	}
+
+	return 0;
+
+error_v4l2_async_notifier:
+	v4l2_async_nf_cleanup(notifier);
+
+	v4l2_device_unregister_subdev(subdev);
+
+error_media_entity:
+	media_entity_cleanup(&subdev->entity);
+
+	return ret;
+}
+
+void sun6i_csi_bridge_cleanup(struct sun6i_csi_device *csi_dev)
+{
+	struct v4l2_subdev *subdev = &csi_dev->bridge.subdev;
+	struct v4l2_async_notifier *notifier = &csi_dev->bridge.notifier;
+
+	v4l2_async_nf_unregister(notifier);
+	v4l2_async_nf_cleanup(notifier);
+
+	v4l2_device_unregister_subdev(subdev);
+
+	media_entity_cleanup(&subdev->entity);
+}
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.h b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.h
new file mode 100644
index 000000000000..f9bf87bf3667
--- /dev/null
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.h
@@ -0,0 +1,49 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2021-2022 Bootlin
+ * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
+ */
+
+#ifndef _SUN6I_CSI_BRIDGE_H_
+#define _SUN6I_CSI_BRIDGE_H_
+
+#include <media/v4l2-device.h>
+#include <media/v4l2-fwnode.h>
+
+#define SUN6I_CSI_BRIDGE_NAME	"sun6i-csi-bridge"
+
+enum sun6i_csi_bridge_pad {
+	SUN6I_CSI_BRIDGE_PAD_SINK	= 0,
+	SUN6I_CSI_BRIDGE_PAD_SOURCE	= 1,
+	SUN6I_CSI_BRIDGE_PAD_COUNT	= 2,
+};
+
+struct sun6i_csi_device;
+
+struct sun6i_csi_bridge_source {
+	struct v4l2_subdev		*subdev;
+	struct v4l2_fwnode_endpoint	endpoint;
+	bool				expected;
+};
+
+struct sun6i_csi_bridge_async_subdev {
+	struct v4l2_async_subdev	async_subdev;
+	struct sun6i_csi_bridge_source	*source;
+};
+
+struct sun6i_csi_bridge {
+	struct v4l2_subdev		subdev;
+	struct v4l2_async_notifier	notifier;
+	struct media_pad		pads[2];
+	struct v4l2_mbus_framefmt	mbus_format;
+	struct mutex			lock; /* Mbus format lock. */
+
+	struct sun6i_csi_bridge_source	source_parallel;
+};
+
+/* Bridge */
+
+int sun6i_csi_bridge_setup(struct sun6i_csi_device *csi_dev);
+void sun6i_csi_bridge_cleanup(struct sun6i_csi_device *csi_dev);
+
+#endif
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c
index 791583d23a65..fa83211a2c5a 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c
@@ -632,6 +632,7 @@ int sun6i_video_setup(struct sun6i_csi_device *csi_dev)
 {
 	struct sun6i_video *video = &csi_dev->video;
 	struct v4l2_device *v4l2_dev = &csi_dev->v4l2.v4l2_dev;
+	struct v4l2_subdev *bridge_subdev = &csi_dev->bridge.subdev;
 	struct video_device *video_dev = &video->video_dev;
 	struct vb2_queue *queue = &video->queue;
 	struct media_pad *pad = &video->pad;
@@ -712,8 +713,26 @@ int sun6i_video_setup(struct sun6i_csi_device *csi_dev)
 		goto error_media_entity;
 	}
 
+	/* Media Pad Link */
+
+	ret = media_create_pad_link(&bridge_subdev->entity,
+				    SUN6I_CSI_BRIDGE_PAD_SOURCE,
+				    &video_dev->entity, 0,
+				    MEDIA_LNK_FL_ENABLED |
+				    MEDIA_LNK_FL_IMMUTABLE);
+	if (ret < 0) {
+		v4l2_err(v4l2_dev, "failed to create %s:%u -> %s:%u link\n",
+			 bridge_subdev->entity.name,
+			 SUN6I_CSI_BRIDGE_PAD_SOURCE,
+			 video_dev->entity.name, 0);
+		goto error_video_device;
+	}
+
 	return 0;
 
+error_video_device:
+	vb2_video_unregister_device(video_dev);
+
 error_media_entity:
 	media_entity_cleanup(&video_dev->entity);
 
</cut>
------=_Part_38854_1952492349.1670005907872--
