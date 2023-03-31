Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FEC98835
	for <llvm@lists.linux.dev>; Fri, 31 Mar 2023 17:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680283468;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+275kAcImYiE9dFTXdrtG3cpkttX7JRc/BM6QuCRJUs=;
	b=GfS6UCPigFTdUiSBxcSS57pAJ6knIADyDLtEhTDWo1v+ou+tFVNKsp4jijEVyfev+xwrPR
	jPEOqg/PV3AnXrHimgoavidCGVyJsN5XsXVkAAMasx7Uk6ZNtC0uDgrA2DNr3V+UjXcjP2
	gGWlmoytyOgrKAJa+0d7GSOVP9elpng=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-655--ztyDPj5OTKHc0hJG10owA-1; Fri, 31 Mar 2023 13:24:28 -0400
X-MC-Unique: -ztyDPj5OTKHc0hJG10owA-1
Received: by mail-qt1-f199.google.com with SMTP id h6-20020ac85846000000b003e3c23d562aso15053673qth.1
        for <llvm@lists.linux.dev>; Fri, 31 Mar 2023 10:24:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680283467;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+275kAcImYiE9dFTXdrtG3cpkttX7JRc/BM6QuCRJUs=;
        b=Sl2s/1cPJ3/PQ0FJ2CTW20HF93ns9kbLEMz6Azfox1B9ijtoIgJoIB3u0nEBI1U+LJ
         LO0+xOYb9XIlTMltVY5L9Ws1rvpQixQlIgNRt4qs/gDUJa4E+K6oKGqnRsIG5PehHDzf
         197HlRQ46vDIZmDKvj+DNY4kiHS1wQTNAu0hK03oodDwS/1F0OQ+mPgnHynwY5WFJJKp
         tzaRsOY8XFxgRjrydKPVSrWfTOJlGsKrgPDyY7c7ytjXJAUYUVPMi2VN5Xa9xKVaSRKV
         rYxRHsOP+u+UyMEhgoKtgXz9e58bXBxtyRHgrcotN4cEeAbAq34s8Zd4R87zQ1l1Gq86
         CTQg==
X-Gm-Message-State: AO0yUKUIDITPEnRbLA1g5JNfI8JqgE4NtAq/Q3Bfqjw6SaeAjA3FWy8s
	fQihrF4MgfEwOSo32q9Tp/ZFbrIE54NPHtIIQaqVeHlThJmSnI9M8UqK/hNwJorFPyAxnTHWVIc
	nV8r4Dc7fhm+20g==
X-Received: by 2002:a05:622a:215:b0:3e3:867e:1811 with SMTP id b21-20020a05622a021500b003e3867e1811mr50922122qtx.17.1680283467399;
        Fri, 31 Mar 2023 10:24:27 -0700 (PDT)
X-Google-Smtp-Source: AK7set9Sv9pA4EKixyjGPgkC70YS7QWxatBhiN9or/3O6SwY+f275wnQJfX5KnQMa83+KWSsgCh25Q==
X-Received: by 2002:a05:622a:215:b0:3e3:867e:1811 with SMTP id b21-20020a05622a021500b003e3867e1811mr50922089qtx.17.1680283467204;
        Fri, 31 Mar 2023 10:24:27 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id b17-20020ae9eb11000000b00745c437b38dsm804613qkg.82.2023.03.31.10.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 10:24:26 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: airlied@redhat.com,
	kraxel@redhat.com,
	airlied@gmail.com,
	daniel@ffwll.ch,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: virtualization@lists.linux-foundation.org,
	spice-devel@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] drm/qxl: remove unused num_relocs variable
Date: Fri, 31 Mar 2023 13:24:23 -0400
Message-Id: <20230331172423.1860083-1-trix@redhat.com>
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
drivers/gpu/drm/qxl/qxl_ioctl.c:149:14: error: variable
  'num_relocs' set but not used [-Werror,-Wunused-but-set-variable]
        int i, ret, num_relocs;
                    ^
This variable is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/qxl/qxl_ioctl.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_ioctl.c b/drivers/gpu/drm/qxl/qxl_ioctl.c
index 30f58b21372a..3422206d59d4 100644
--- a/drivers/gpu/drm/qxl/qxl_ioctl.c
+++ b/drivers/gpu/drm/qxl/qxl_ioctl.c
@@ -146,7 +146,7 @@ static int qxl_process_single_command(struct qxl_device *qdev,
 	struct qxl_release *release;
 	struct qxl_bo *cmd_bo;
 	void *fb_cmd;
-	int i, ret, num_relocs;
+	int i, ret;
 	int unwritten;
 
 	switch (cmd->type) {
@@ -201,7 +201,6 @@ static int qxl_process_single_command(struct qxl_device *qdev,
 	}
 
 	/* fill out reloc info structs */
-	num_relocs = 0;
 	for (i = 0; i < cmd->relocs_num; ++i) {
 		struct drm_qxl_reloc reloc;
 		struct drm_qxl_reloc __user *u = u64_to_user_ptr(cmd->relocs);
@@ -231,7 +230,6 @@ static int qxl_process_single_command(struct qxl_device *qdev,
 			reloc_info[i].dst_bo = cmd_bo;
 			reloc_info[i].dst_offset = reloc.dst_offset + release->release_offset;
 		}
-		num_relocs++;
 
 		/* reserve and validate the reloc dst bo */
 		if (reloc.reloc_type == QXL_RELOC_TYPE_BO || reloc.src_handle) {
-- 
2.27.0

