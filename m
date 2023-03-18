Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C19367
	for <llvm@lists.linux.dev>; Sat, 18 Mar 2023 00:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679099015;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Ro4nhrJ5Zq0SySOEipia8lU7rnzpGPE36NY88ytAvP4=;
	b=Yns/lgmbRufLKDfhD89R8oXs9ALZds5PM0ijLsGmevkwQD7tSBRXZ0f7tC+zLm0odYWOWn
	pv0lVpInYwgsWwwbZyvjsbgsEdHseZZjGV4AbXHUHMqn42C/6XzEB3X/cQWNG5SJAm8vvg
	7hMWXWouOzcbgGHegriY/XkIl3JIkvo=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-627-wXUdiSoMO3SZGGirpmQ6eQ-1; Fri, 17 Mar 2023 20:23:33 -0400
X-MC-Unique: wXUdiSoMO3SZGGirpmQ6eQ-1
Received: by mail-qv1-f71.google.com with SMTP id g6-20020ad45426000000b005a33510e95aso3599193qvt.16
        for <llvm@lists.linux.dev>; Fri, 17 Mar 2023 17:23:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679099012;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ro4nhrJ5Zq0SySOEipia8lU7rnzpGPE36NY88ytAvP4=;
        b=GyXkb0D0QiHoo/jgkAkp2la3CknDoznFcbURUVtwCCOftpoS6njL2LjUqFn6Izw4D+
         mzCcnMP+IQ+yuoTp6lY0r4ZUI3lqN2AgtozQk4+auexksgao2gENv2jtS1hqihLqhqbv
         NW5vMQ9M9qsng8ZNAHIuIERILLhex5BFXxbsUJofmNoSxG4Ciq9OdQXsbA8YG6FEIxKb
         w6FBLDz8Mq90Fwg2KkFQd9TEGPIs13QB3DmSMwrf1UbMNRAwFKv8eJB/GilentenPg5Y
         Dv9ZziNN1YYJElQHw01Cocsrl9XeWSr81FvjXSHIk4Yrjmy/l5aS4ZDpl099Eimbf/5l
         bVlg==
X-Gm-Message-State: AO0yUKWn6oLo8k+tmYg3y+FwqFUiTeO658E/zPN/E7vO+Q17ftTr7RfF
	Dj0hEDjqd8s+GoX6vuY4g3uVWo+92gjloGm6ybiVQqF8DVQrt/5lbCAcwf14d7X4EZIkAZRiUS7
	WS6fWjV5L0XmVlw==
X-Received: by 2002:a05:6214:e62:b0:56e:9da4:831c with SMTP id jz2-20020a0562140e6200b0056e9da4831cmr39485350qvb.46.1679099012683;
        Fri, 17 Mar 2023 17:23:32 -0700 (PDT)
X-Google-Smtp-Source: AK7set/fL421Kfl3tq1uEh7Q2OUg4WIgPPxO43SFyqSNmCb+PH/F1uG0zi5qpejfWxe5clSOu4VLzA==
X-Received: by 2002:a05:6214:e62:b0:56e:9da4:831c with SMTP id jz2-20020a0562140e6200b0056e9da4831cmr39485337qvb.46.1679099012479;
        Fri, 17 Mar 2023 17:23:32 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id a72-20020ae9e84b000000b00745a3b63569sm2623217qkg.107.2023.03.17.17.23.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 17:23:32 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	airlied@gmail.com,
	daniel@ffwll.ch,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] gpu: drm: bridge: sii9234: remove unused bridge_to_sii9234 function
Date: Fri, 17 Mar 2023 20:23:21 -0400
Message-Id: <20230318002321.1675181-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
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

clang with W=1 reports
drivers/gpu/drm/bridge/sii9234.c:870:31: error:
  unused function 'bridge_to_sii9234' [-Werror,-Wunused-function]
static inline struct sii9234 *bridge_to_sii9234(struct drm_bridge *bridge)
                              ^
This static function is not used, so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/bridge/sii9234.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/sii9234.c b/drivers/gpu/drm/bridge/sii9234.c
index 099b510ff285..2d17f227867b 100644
--- a/drivers/gpu/drm/bridge/sii9234.c
+++ b/drivers/gpu/drm/bridge/sii9234.c
@@ -867,11 +867,6 @@ static int sii9234_init_resources(struct sii9234 *ctx,
 	return 0;
 }
 
-static inline struct sii9234 *bridge_to_sii9234(struct drm_bridge *bridge)
-{
-	return container_of(bridge, struct sii9234, bridge);
-}
-
 static enum drm_mode_status sii9234_mode_valid(struct drm_bridge *bridge,
 					 const struct drm_display_info *info,
 					 const struct drm_display_mode *mode)
-- 
2.27.0

