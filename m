Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9334AD304
	for <llvm@lists.linux.dev>; Thu, 30 Mar 2023 23:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680219789;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sxdUBC3+7/+FoRE3AV8lIbZMqGBJVuxDsooJhZM+Js0=;
	b=d67SPFPVM7ZtAUKXhW4+8eMD2E/ndwCzQ7bgU/pm8Qi+3odrJ+NjcIK0w5s+ik+O+EyvWL
	GMD6ihhNQV3FtwXue2LfOLZ3uz71B58mgXIS2ZfuAKG91zS91dkWKWMKFYrQLfh29vPJZl
	f4vTjhPO7hrXNmV7VtbtMjIOaosy78c=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-519--thdFy3aMwK6OAMhXu3_aA-1; Thu, 30 Mar 2023 19:43:08 -0400
X-MC-Unique: -thdFy3aMwK6OAMhXu3_aA-1
Received: by mail-qt1-f200.google.com with SMTP id h6-20020ac85846000000b003e3c23d562aso13504073qth.1
        for <llvm@lists.linux.dev>; Thu, 30 Mar 2023 16:43:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680219787;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sxdUBC3+7/+FoRE3AV8lIbZMqGBJVuxDsooJhZM+Js0=;
        b=sr3oBIVU91ZYd2SfvbrZn2wtALOQJCOJ+rQ/ijnPswb2uW5kR0sN8Zn7ulHkJxT1ws
         u/iOVhtsvStQFotUIVKxdPzQxvksRLh/wWp9SclgSHDg5z37RjOAONNagxXAP/+2krxi
         sh/lu5pLL24oF5StXYOTbpcHrb9I5RmZ9U0MvLfGYgxVkeg6LR2TqQ6v+BYdh5USZRXS
         o9Wa7bwPamFIz7lB1aLd1/7sXZsX+9KHv9rWYBaB2imuPrNKSgrYSyuHnBiKrAcD9kKL
         hFttfxe270vQTDv3Orf8vPtPlxfm+GXOIThEtU+nk+DOrSK7L1Wdhw8hBQEc0SEa7t0k
         4DBA==
X-Gm-Message-State: AO0yUKUBjWkOjQtVq8bI/5StGuI7ON/6NPVRCljje+C9RQ25Ef6drcPu
	B3HUhAdjo2xCzR7qUOOEA2fbcRMDyw8oJ1lvf+010fl8hjXuIyGp5XT4Ii/zFx9KLwAgpxX4gWt
	PfbV+txFAM113IQ==
X-Received: by 2002:a05:622a:1a98:b0:3d8:9b45:d362 with SMTP id s24-20020a05622a1a9800b003d89b45d362mr38621000qtc.28.1680219787543;
        Thu, 30 Mar 2023 16:43:07 -0700 (PDT)
X-Google-Smtp-Source: AK7set8e+7pjqcJzugW+87SA4B2ztfpVpwfdIdmQmFB4Xnk8pbSHqG3Dep8cVHiY/IIHhrhVsGayJA==
X-Received: by 2002:a05:622a:1a98:b0:3d8:9b45:d362 with SMTP id s24-20020a05622a1a9800b003d89b45d362mr38620961qtc.28.1680219787200;
        Thu, 30 Mar 2023 16:43:07 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id q19-20020ac87353000000b003e387a2fbdfsm235015qtp.0.2023.03.30.16.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 16:43:06 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: harry.wentland@amd.com,
	sunpeng.li@amd.com,
	Rodrigo.Siqueira@amd.com,
	alexander.deucher@amd.com,
	christian.koenig@amd.com,
	Xinhui.Pan@amd.com,
	airlied@gmail.com,
	daniel@ffwll.ch,
	nathan@kernel.org,
	ndesaulniers@google.com,
	HaoPing.Liu@amd.com,
	aric.cyr@amd.com,
	chiahsuan.chung@amd.com,
	felipe.clark@amd.com,
	Angus.Wang@amd.com,
	hanghong.ma@amd.com,
	lv.ruyi@zte.com.cn,
	Dillon.Varone@amd.com
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] drm/amd/display: remove unused average_render_time_in_us and i variables
Date: Thu, 30 Mar 2023 19:43:03 -0400
Message-Id: <20230330234303.1845377-1-trix@redhat.com>
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
drivers/gpu/drm/amd/amdgpu/../display/modules/freesync/freesync.c:1132:15: error: variable
  'average_render_time_in_us' set but not used [-Werror,-Wunused-but-set-variable]
        unsigned int average_render_time_in_us = 0;
                     ^
This variable is not used so remove it, which caused i to be unused so remove that as well.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 .../drm/amd/display/modules/freesync/freesync.c    | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/modules/freesync/freesync.c b/drivers/gpu/drm/amd/display/modules/freesync/freesync.c
index 315da61ee897..5c41a4751db4 100644
--- a/drivers/gpu/drm/amd/display/modules/freesync/freesync.c
+++ b/drivers/gpu/drm/amd/display/modules/freesync/freesync.c
@@ -1129,7 +1129,6 @@ void mod_freesync_handle_preflip(struct mod_freesync *mod_freesync,
 {
 	struct core_freesync *core_freesync = NULL;
 	unsigned int last_render_time_in_us = 0;
-	unsigned int average_render_time_in_us = 0;
 
 	if (mod_freesync == NULL)
 		return;
@@ -1138,7 +1137,6 @@ void mod_freesync_handle_preflip(struct mod_freesync *mod_freesync,
 
 	if (in_out_vrr->supported &&
 			in_out_vrr->state == VRR_STATE_ACTIVE_VARIABLE) {
-		unsigned int i = 0;
 		unsigned int oldest_index = plane->time.index + 1;
 
 		if (oldest_index >= DC_PLANE_UPDATE_TIMES_MAX)
@@ -1147,18 +1145,6 @@ void mod_freesync_handle_preflip(struct mod_freesync *mod_freesync,
 		last_render_time_in_us = curr_time_stamp_in_us -
 				plane->time.prev_update_time_in_us;
 
-		/* Sum off all entries except oldest one */
-		for (i = 0; i < DC_PLANE_UPDATE_TIMES_MAX; i++) {
-			average_render_time_in_us +=
-					plane->time.time_elapsed_in_us[i];
-		}
-		average_render_time_in_us -=
-				plane->time.time_elapsed_in_us[oldest_index];
-
-		/* Add render time for current flip */
-		average_render_time_in_us += last_render_time_in_us;
-		average_render_time_in_us /= DC_PLANE_UPDATE_TIMES_MAX;
-
 		if (in_out_vrr->btr.btr_enabled) {
 			apply_below_the_range(core_freesync,
 					stream,
-- 
2.27.0

