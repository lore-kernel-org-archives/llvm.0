Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483AA28EB
	for <llvm@lists.linux.dev>; Sat, 25 Mar 2023 13:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679751910;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CA7h/KT6ar6s3WSm/PcPsckHI4JxnLRkTxYhhO4xj4k=;
	b=QsSkWCqzG94/C8/m2MCOQMZGyhzatoiQy6aH9ZK0AeQ4v0OfW/TgeLpxavwcLToTbmUWgW
	bsOX87wVlvv+4Vzes8mQxr1/SQTwBbTj6YIG06v47b5VyRynuTWGAuZ5sdRxaxnubm/VoC
	cwqBNz067mbBtwspBJATT6OpjRqxzFQ=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-4gJWse1IO_unuv2whuV-mg-1; Sat, 25 Mar 2023 09:45:07 -0400
X-MC-Unique: 4gJWse1IO_unuv2whuV-mg-1
Received: by mail-qv1-f72.google.com with SMTP id a15-20020a0562140c2f00b005ad28a23cffso2049604qvd.6
        for <llvm@lists.linux.dev>; Sat, 25 Mar 2023 06:45:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679751907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CA7h/KT6ar6s3WSm/PcPsckHI4JxnLRkTxYhhO4xj4k=;
        b=1/dzBthPvH/5fjM/uCy9DK01IxjUkPTLbywEPxTm9YjLFJDG5BZaY1BcyM4LzLPNri
         dLYm06Lgi3MlWnncUUJOmdqbYTtAiCKytFtKmtDGdVN2Kq9fdbGWyqbFInFI4jMEq84C
         /T7wSYWbI9BUQQBK1Gscfh14UC6/3Ir/+mEA97yZowcdEnN6At6kl8JbGwxWtU8cZ6rq
         v7PLp12WOGT6cRpQ2cqO4L23/3oEuCdsnEJDNqo3dpvZOV4yYv/27pBKSMXbnthwEdGG
         M1roElDIix47J0T2s39UOpUaUs87XwhrAqAkn4S7XZmcYyb/6tOwq+o2nR2qTbuy1P65
         eIPQ==
X-Gm-Message-State: AO0yUKXRTe6WP+6UeK412plxVJYB7yZguZuEy3SXjWFN4y6ywd5Hacj8
	vMwMHMj9rjMdT0osmTyIn8UFzkXFk6t3MAMrZWFYrIEzraYa8eZKsZu3OxCFq2lYl+BmiJTeYOa
	M4tLzCMK4ZiOGew==
X-Received: by 2002:a05:622a:647:b0:3e3:9948:98d1 with SMTP id a7-20020a05622a064700b003e3994898d1mr10992004qtb.38.1679751907341;
        Sat, 25 Mar 2023 06:45:07 -0700 (PDT)
X-Google-Smtp-Source: AK7set9lBadmzaW3R6GBzpZCCcrV/q81u7BWSsClYIuBO79n0CA6GzW3uhjcVgbc5HCJD7hhViJ7VQ==
X-Received: by 2002:a05:622a:647:b0:3e3:9948:98d1 with SMTP id a7-20020a05622a064700b003e3994898d1mr10991982qtb.38.1679751907150;
        Sat, 25 Mar 2023 06:45:07 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id h23-20020ac85497000000b003e3927a2cd8sm2528739qtq.3.2023.03.25.06.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 06:45:06 -0700 (PDT)
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
	Jun.Lei@amd.com,
	wenjing.liu@amd.com,
	Jimmy.Kizito@amd.com,
	Cruise.Hung@amd.com
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] drm/amd/display: remove unused matching_stream_ptrs variable
Date: Sat, 25 Mar 2023 09:45:03 -0400
Message-Id: <20230325134503.1335510-1-trix@redhat.com>
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
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_enc_cfg.c:625:6: error:
  variable 'matching_stream_ptrs' set but not used [-Werror,-Wunused-but-set-variable]
        int matching_stream_ptrs = 0;
            ^
This variable is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c
index 41198c729d90..30c0644d4418 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c
@@ -622,7 +622,6 @@ bool link_enc_cfg_validate(struct dc *dc, struct dc_state *state)
 	int i, j;
 	uint8_t valid_count = 0;
 	uint8_t dig_stream_count = 0;
-	int matching_stream_ptrs = 0;
 	int eng_ids_per_ep_id[MAX_PIPES] = {0};
 	int ep_ids_per_eng_id[MAX_PIPES] = {0};
 	int valid_bitmap = 0;
@@ -645,9 +644,7 @@ bool link_enc_cfg_validate(struct dc *dc, struct dc_state *state)
 		struct link_enc_assignment assignment = state->res_ctx.link_enc_cfg_ctx.link_enc_assignments[i];
 
 		if (assignment.valid) {
-			if (assignment.stream == state->streams[i])
-				matching_stream_ptrs++;
-			else
+			if (assignment.stream != state->streams[i])
 				valid_stream_ptrs = false;
 		}
 	}
-- 
2.27.0

