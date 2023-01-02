Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A829568A
	for <llvm@lists.linux.dev>; Mon,  2 Jan 2023 20:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672691150;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xCNMgkWa09fEzea1HqZoR7Nx7p6LXc3d3hq975HBBf8=;
	b=c2M3eULR4SrHEtadMH4w/oKeDoXpeGqfj8oQlSa03jFY7D95X1+aY1KEvQg7LwT8PUHrMt
	Ol44dyYQDgwhswErbn7izCNmqSg3OhD8ZtxbXS/gscBVDefX8P3VglApc90+MvrVnUkS8d
	6eBnY2VDXJlCw19yaTZixy94QcSAHno=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-75-GQ5AZl0jOsGami20uKAPGw-1; Mon, 02 Jan 2023 15:25:49 -0500
X-MC-Unique: GQ5AZl0jOsGami20uKAPGw-1
Received: by mail-wr1-f70.google.com with SMTP id o14-20020adfa10e000000b002631c56fe26so3239923wro.1
        for <llvm@lists.linux.dev>; Mon, 02 Jan 2023 12:25:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xCNMgkWa09fEzea1HqZoR7Nx7p6LXc3d3hq975HBBf8=;
        b=dldu/iOaOsbz6v9SiBmZG/CBSSkWP/kv0/AJ83Uu/GoK+V/Xz8B6w9hai2+xqgJs5y
         N63xxKny7eo/T2slWPAAHsYpHb1lhRuWIUMWZOBqkEXiBwQBExtLmPNUm5708oDgZxbW
         mzf1vX11O6z2Fbz9HvZOseAw4Q308KFLk59R+U+oe/ECF7+XTJHgt3jY1cN7k3ucX+r2
         gVsDil3c7/h13jq3ZeEnm1sZWpBIwOpsljnvsHo550Xv4e88cYJnkzPY4D6ZhkzjQiOL
         svHNs3LWpzEXkbDgpZU6S4+ZiwbVWSEMbDuAwHKJWBOyEZpKugX/B0QBnjv1pdUZme3Y
         Ip8Q==
X-Gm-Message-State: AFqh2kqwtdr7gb47q+YDxcP7n7sM5zVLb55jFzZ/KVYDB2/pmUqWfTmo
	ZkCDTrPeCXeA6pXsMW8OsbRpg2dnsfRbU6WHv1dCyzCMPMKiCrfvVH762gqslc42UqisdmOgISR
	/HazmAERXcj0+Fw==
X-Received: by 2002:a05:600c:1c85:b0:3d3:4b18:27c6 with SMTP id k5-20020a05600c1c8500b003d34b1827c6mr29159454wms.11.1672691148000;
        Mon, 02 Jan 2023 12:25:48 -0800 (PST)
X-Google-Smtp-Source: AMrXdXucLyQjV1JdUh/Oxhsrc63ax4d9VZwsRvpyJNghr8LaaYhJT1s03Mg1ltldjdSwypzvI/Jtqw==
X-Received: by 2002:a05:600c:1c85:b0:3d3:4b18:27c6 with SMTP id k5-20020a05600c1c8500b003d34b1827c6mr29159442wms.11.1672691147819;
        Mon, 02 Jan 2023 12:25:47 -0800 (PST)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id f18-20020a05600c4e9200b003d35c845cbbsm50061135wmq.21.2023.01.02.12.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jan 2023 12:25:47 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tom Rix <trix@redhat.com>,
	dri-devel@lists.freedesktop.org,
	llvm@lists.linux.dev
Subject: [PATCH v2 1/2] drm/mipi-dsi: Fix mipi_dsi_dcs_write_seq() macro definition format
Date: Mon,  2 Jan 2023 21:25:41 +0100
Message-Id: <20230102202542.3494677-1-javierm@redhat.com>
X-Mailer: git-send-email 2.38.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Change made using a `clang-format -i include/drm/drm_mipi_dsi.h` command.

Suggested-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

Changes in v2:
- New patch in v2.

 include/drm/drm_mipi_dsi.h | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index 20b21b577dea..e9d1e8a7fc7e 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -303,15 +303,18 @@ int mipi_dsi_dcs_get_display_brightness(struct mipi_dsi_device *dsi,
  * @cmd: Command
  * @seq: buffer containing data to be transmitted
  */
-#define mipi_dsi_dcs_write_seq(dsi, cmd, seq...) do {				\
-		static const u8 d[] = { cmd, seq };				\
-		struct device *dev = &dsi->dev;	\
-		int ret;						\
-		ret = mipi_dsi_dcs_write_buffer(dsi, d, ARRAY_SIZE(d));	\
-		if (ret < 0) {						\
-			dev_err_ratelimited(dev, "sending command %#02x failed: %d\n", cmd, ret); \
-			return ret;						\
-		}						\
+#define mipi_dsi_dcs_write_seq(dsi, cmd, seq...)                           \
+	do {                                                               \
+		static const u8 d[] = { cmd, seq };                        \
+		struct device *dev = &dsi->dev;                            \
+		int ret;                                                   \
+		ret = mipi_dsi_dcs_write_buffer(dsi, d, ARRAY_SIZE(d));    \
+		if (ret < 0) {                                             \
+			dev_err_ratelimited(                               \
+				dev, "sending command %#02x failed: %d\n", \
+				cmd, ret);                                 \
+			return ret;                                        \
+		}                                                          \
 	} while (0)
 
 /**
-- 
2.38.1

