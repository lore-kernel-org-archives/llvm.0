Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BBA27C
	for <llvm@lists.linux.dev>; Fri, 31 Mar 2023 00:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680221438;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sxdUBC3+7/+FoRE3AV8lIbZMqGBJVuxDsooJhZM+Js0=;
	b=Pc56qiIQWQSbVghjo4FLBaC32bfYe7lHmkSxZdc3XNdyG1ljfKGhMzS+SDrrJTAKAMvSWC
	TtmNFViBEueoLthpcVr9VeHs8E+0lBqXISftgj48rMfPsgi2gxhdFCsO0Y4+5XhZgxFLzn
	+BmhkJW0CDNzesyEGSVWdl5LmW8lrHs=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-316-JXgcR_y3MdaREqAw8XRMZw-1; Thu, 30 Mar 2023 20:10:36 -0400
X-MC-Unique: JXgcR_y3MdaREqAw8XRMZw-1
Received: by mail-qt1-f197.google.com with SMTP id u1-20020a05622a198100b003e12a0467easo13504416qtc.11
        for <llvm@lists.linux.dev>; Thu, 30 Mar 2023 17:10:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680221436;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sxdUBC3+7/+FoRE3AV8lIbZMqGBJVuxDsooJhZM+Js0=;
        b=SGL/QKIQoZE/a4iKf7s20gXHzefzj6vf0cIRMm5hxI98zF2YkJPzbB2UEz31rllnHB
         mn4noRf4yDJzBWo9XIv1pwU3ngDEceFJeweeeSK0T81ZSRdX/tcWb7y9PsDHgzDIForA
         IAnL7XoIGfeUXrwZ9MCvTKMXkaUkMXr9oUrpjMDZwHFR9P/PAvkVj7dWo2zpuVB1U7gv
         JMBpaSROeC3XVzmIStBxM5zaSFHiWf/8VC2fSJU3fzz+STKS+ye17h0+wJfM8Fl0JbH7
         +fBkBbjW6HRt+W66nHivPLYoCVS0mfv7Ew/Ym3j0b9dcjrJk2Pox72ds5PYRwGB9IAPg
         VYxQ==
X-Gm-Message-State: AAQBX9dHRDIMq6yLlQ3Dk01PRpqfJa0vh63DsSO4K0xLReqW7MJv6hdj
	zOnoFQxveOyRYtXQCk2IDE9anBVbdD/bKOC69GEsDheKjpL1Tep5LyGr3sbp8oK6w3M48OhAuxx
	a66wHujmWIGXLNA==
X-Received: by 2002:ac8:5b01:0:b0:3e6:3851:b949 with SMTP id m1-20020ac85b01000000b003e63851b949mr5096997qtw.18.1680221436266;
        Thu, 30 Mar 2023 17:10:36 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZfvmPI/ZvqdmyfvzOcRsU2w4va42Sg5iZv/lqX0s90R5xmXd2ghuy7behp6ugqVkYCdP5wxg==
X-Received: by 2002:ac8:5b01:0:b0:3e6:3851:b949 with SMTP id m1-20020ac85b01000000b003e63851b949mr5096964qtw.18.1680221436015;
        Thu, 30 Mar 2023 17:10:36 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id e14-20020ac8670e000000b003e38d6c013dsm223281qtp.60.2023.03.30.17.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 17:10:35 -0700 (PDT)
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
	aric.cyr@amd.com,
	HaoPing.Liu@amd.com,
	Anthony.Koo@amd.com,
	hanghong.ma@amd.com,
	Angus.Wang@amd.com,
	Dillon.Varone@amd.com
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] drm/amd/display: remove unused average_render_time_in_us and i variables
Date: Thu, 30 Mar 2023 20:10:32 -0400
Message-Id: <20230331001032.1846456-1-trix@redhat.com>
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

