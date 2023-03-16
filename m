Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2451D323E
	for <llvm@lists.linux.dev>; Thu, 16 Mar 2023 13:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678972989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lOSbCq91ofT9YXvZbpEo/wG2mXE51QVka7uRfgSRss4=;
	b=N0Uuf6J59gGwiksDiyFQZfnbdEFb0aHpuCw35em8Pz8XQ6AyvFGk0+isoDsWyobq+oDBVD
	EgI8PtLD74GdpUw0Wa2T5ZOZKOpbEuD9UDlL+85wUKp+ONwWdeoaJ9idtugtbiy3PF4rli
	BUP2KH1ogdccS3udxYgqZpPmTHGaKNA=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-223-nYst5RL2Nt2-T3mE-ZZ7Sg-1; Thu, 16 Mar 2023 09:23:08 -0400
X-MC-Unique: nYst5RL2Nt2-T3mE-ZZ7Sg-1
Received: by mail-qv1-f72.google.com with SMTP id jo13-20020a056214500d00b004c6c72bf1d0so1036271qvb.9
        for <llvm@lists.linux.dev>; Thu, 16 Mar 2023 06:23:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678972988;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lOSbCq91ofT9YXvZbpEo/wG2mXE51QVka7uRfgSRss4=;
        b=F5J6R4arUatAIiLcf367Q3fNGZK2A56S2CoPLI0Ociy7eaq/sgZFpvwYxaElchYjjI
         G44EtJC4Ga/wvX4X6ZF2jMXzK0ewDkaBCpPHV1Fx3jbH0YBbSmW0YxYKHd3f5obf/SbJ
         CkTaZdjmDiwV4PSNspqkahxt2gG/WpQXCEIciwNU2sDVtlfWveO11ZHO2eIE0iF5Aah9
         mn/iCchGbkfe1ORF4eAkeO/hHxA7lOXjCwZAI6W4hDM5ZsADewua+BmudDv1ZNg7I4GM
         /7K6heXbUQdIqed7Mug32rT0yecOr0cFxwtFScTgiS37GNA4X6AstuS5Qm1yUADmbbB8
         kiwQ==
X-Gm-Message-State: AO0yUKU5JGGVH7FpDYveEITyga+7JeviPa1t6AlewUyWvkYzYoSxBW8n
	LnaJu/PhUOnJhrU004MDyh3yRO3riZdyENo3JAloYP3wni9JGBAxrKlJv0vWz6h2DJi7kBrDhMG
	PdW91Cs7Rdu53Bg==
X-Received: by 2002:ad4:5aee:0:b0:56e:ab08:670d with SMTP id c14-20020ad45aee000000b0056eab08670dmr32716480qvh.42.1678972988189;
        Thu, 16 Mar 2023 06:23:08 -0700 (PDT)
X-Google-Smtp-Source: AK7set9dA/70KxjQEA+7BPyUihfyAvubVJ/nAiMbXTzj0PTIRAeQbYujxRy3jSIUcu6bo4xiaMqL1g==
X-Received: by 2002:ad4:5aee:0:b0:56e:ab08:670d with SMTP id c14-20020ad45aee000000b0056eab08670dmr32716450qvh.42.1678972987917;
        Thu, 16 Mar 2023 06:23:07 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id g187-20020a37b6c4000000b00743592b4745sm5803599qkf.109.2023.03.16.06.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 06:23:07 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: hjc@rock-chips.com,
	heiko@sntech.de,
	airlied@gmail.com,
	daniel@ffwll.ch,
	nathan@kernel.org,
	ndesaulniers@google.com,
	michael.riesch@wolfvision.net,
	s.hauer@pengutronix.de
Cc: dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] drm/rockchip: vop2: fix uninitialized variable possible_crtcs
Date: Thu, 16 Mar 2023 09:23:02 -0400
Message-Id: <20230316132302.531724-1-trix@redhat.com>
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

clang reportes this error
drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:2322:8: error:
  variable 'possible_crtcs' is used uninitialized whenever 'if'
  condition is false [-Werror,-Wsometimes-uninitialized]
                        if (vp) {
                            ^~
drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:2336:36: note:
  uninitialized use occurs here
                ret = vop2_plane_init(vop2, win, possible_crtcs);
                                                 ^~~~~~~~~~~~~~
drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:2322:4:
  note: remove the 'if' if its condition is always true
                        if (vp) {
                        ^~~~~~~~

The else-statement changes the win->type to OVERLAY without setting the
possible_crtcs variable.  Rework the block, initialize possible_crtcs to
0 to remove the else-statement.  Split the else-if-statement out to its
own if-statement so the OVERLAY check will catch when the win-type has
been changed.

Fixes: 368419a2d429 ("drm/rockchip: vop2: initialize possible_crtcs properly")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 03ca32cd2050..fce992c3506f 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -2301,7 +2301,7 @@ static int vop2_create_crtcs(struct vop2 *vop2)
 	nvp = 0;
 	for (i = 0; i < vop2->registered_num_wins; i++) {
 		struct vop2_win *win = &vop2->win[i];
-		u32 possible_crtcs;
+		u32 possible_crtcs = 0;
 
 		if (vop2->data->soc_id == 3566) {
 			/*
@@ -2327,12 +2327,11 @@ static int vop2_create_crtcs(struct vop2 *vop2)
 				/* change the unused primary window to overlay window */
 				win->type = DRM_PLANE_TYPE_OVERLAY;
 			}
-		} else if (win->type == DRM_PLANE_TYPE_OVERLAY) {
-			possible_crtcs = (1 << nvps) - 1;
-		} else {
-			possible_crtcs = 0;
 		}
 
+		if (win->type == DRM_PLANE_TYPE_OVERLAY)
+			possible_crtcs = (1 << nvps) - 1;
+
 		ret = vop2_plane_init(vop2, win, possible_crtcs);
 		if (ret) {
 			drm_err(vop2->drm, "failed to init plane %s: %d\n",
-- 
2.27.0

