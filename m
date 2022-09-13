Received: from mail-vk1-f201.google.com (mail-vk1-f201.google.com [209.85.221.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A1C3C0C
	for <llvm@lists.linux.dev>; Tue, 13 Sep 2022 20:56:04 +0000 (UTC)
Received: by mail-vk1-f201.google.com with SMTP id d74-20020a1f1d4d000000b003a258b134b8so1745389vkd.12
        for <llvm@lists.linux.dev>; Tue, 13 Sep 2022 13:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date;
        bh=pCfRO3751PIceEFZobkVS7s+2QyKwW6/+h1LD3cCIeQ=;
        b=ZeVfR8Tnh5hBzCUV1+CS8+Iy1lLHRA/k5WbydQvejPxhARt8JYQuZEKNPKlx0P6GVg
         yS3MHFnOdeg2h6R2IoY/R5kf5QFzevs7rUHzS+y/eTO2MFlEPFSZAPH0d6AiPWeEEbkG
         P8yv/iZAbdsPOPomC15hdY9X8Cdkt9oBG8dVJYoUQd/wQYrVjWRYCDu9hUlrAbSWb8sI
         4MkZuUL4ANwsnuUqTzJVq6CA5qkgBDyKNfPRJHNlV+OJp8RbhrrgpNXkwdr3YRqhsqz9
         Npjq1zQ67uMxgk6qwpGWxv5ASBroZ28r1RSSts4jAHaN32pCKG+osEKJzn2sy9Tir86b
         pzow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date;
        bh=pCfRO3751PIceEFZobkVS7s+2QyKwW6/+h1LD3cCIeQ=;
        b=KY6oILcuF4wf0KJKDTObORSsrdmCH1xQIzcGgd03R/2o7ZsESrTnMpXD6o5seJUtIf
         vuyxi6PXlU3w4Lm7UNnbvwvCDQ4h+CtvxPOzZltRqAy3P4LRri8gNJRONViNw+eiHCZD
         7iMLfdEN3zyY3CdPxYONJWv3ft4Lw6v1BjdkQqYCDhSnDq6VDjbZR1vbj7AkbCkwSLTJ
         LrcRmyIn04mLcdeCKLxh+I1ygLRF4XgVDsSkGT4ih6BdzsqvFOthzOGWWfAgeCrVKKm7
         L93oX4B8yolI0AYmBIsMjinY8U89RZJ9w8HaylfVgjr2teOJ6MwvKPiSWqwLQWAwC3mO
         GUYg==
X-Gm-Message-State: ACgBeo14ck6pmQ9r6Rp1CPEFl2diOJbpJC/oAR1ObYi/VWZvme1S0dYG
	aWZ1snj81oIlXMzV4cWatur+ZG0MMw==
X-Google-Smtp-Source: AA6agR56+CRX4Jw5oLwN56hGQ9u1QOvQ42gdvdnD0+27lrgrALWWvOvWch3l4gfgBdyZy9SYZgradcpnhQ==
X-Received: from nhuck.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:39cc])
 (user=nhuck job=sendgmr) by 2002:a1f:2ed8:0:b0:3a2:a7f:3e9e with SMTP id
 u207-20020a1f2ed8000000b003a20a7f3e9emr6201265vku.7.1663102563103; Tue, 13
 Sep 2022 13:56:03 -0700 (PDT)
Date: Tue, 13 Sep 2022 13:56:00 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220913205600.155172-1-nhuck@google.com>
Subject: [PATCH] drm: xlnx: Fix return type of zynqmp_dp_connector_mode_valid
From: Nathan Huckleberry <nhuck@google.com>
Cc: Nathan Huckleberry <nhuck@google.com>, Dan Carpenter <error27@gmail.com>, llvm@lists.linux.dev, 
	Hyun Kwon <hyun.kwon@xilinx.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
	Michal Simek <michal.simek@xilinx.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The mode_valid field in drm_connector_helper_funcs is expected to be of
type
enum drm_mode_status (* mode_valid) (struct drm_connector *connector,
                                     struct drm_display_mode *mode);

The mismatched return type breaks forward edge kCFI since the underlying
function definition does not match the function hook definition.

The return type of zynqmp_dp_connector_mode_valid should be changed from
int to enum drm_mode_status.

Reported-by: Dan Carpenter <error27@gmail.com>
Link: https://github.com/ClangBuiltLinux/linux/issues/1703
Cc: llvm@lists.linux.dev
Signed-off-by: Nathan Huckleberry <nhuck@google.com>
---
 drivers/gpu/drm/xlnx/zynqmp_dp.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index d14612b34796..f571b08d23d3 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -1352,8 +1352,9 @@ zynqmp_dp_connector_best_encoder(struct drm_connector *connector)
 	return &dp->encoder;
 }
 
-static int zynqmp_dp_connector_mode_valid(struct drm_connector *connector,
-					  struct drm_display_mode *mode)
+static enum drm_mode_status
+zynqmp_dp_connector_mode_valid(struct drm_connector *connector,
+			       struct drm_display_mode *mode)
 {
 	struct zynqmp_dp *dp = connector_to_dp(connector);
 	u8 max_lanes = dp->link_config.max_lanes;
-- 
2.37.2.789.g6183377224-goog

