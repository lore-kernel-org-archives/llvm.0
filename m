Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6B6107BB
	for <llvm@lists.linux.dev>; Fri, 24 Mar 2023 19:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679687652;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=l3XY7P7qXKaSPDLbgUFV6/pwM2nIqWoTRMEvcOe7JBo=;
	b=GCiWFAkrUn4juFyjMehy3oiTYgKN6xjSZqrOs0oW7vrDRu2rvGP0yQwZY8VNb9GSnRB4ut
	rCIPHgI8Wri4N1LvHNCDrbzYwXM1Q1PKVhdo0HS+wW/d4lrMpETpXy1Knou3C0o8V+FXYV
	ybdmHYOGVtZR6jonlvy5mr/dALgr0CI=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-94-f2-eDdd8N9e1748u4I7JFQ-1; Fri, 24 Mar 2023 15:54:09 -0400
X-MC-Unique: f2-eDdd8N9e1748u4I7JFQ-1
Received: by mail-qt1-f199.google.com with SMTP id t15-20020a05622a180f00b003e37dd114e3so1657326qtc.10
        for <llvm@lists.linux.dev>; Fri, 24 Mar 2023 12:54:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679687649;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l3XY7P7qXKaSPDLbgUFV6/pwM2nIqWoTRMEvcOe7JBo=;
        b=J+0s97bDjLQRWKkRaqztj4ynMjFk1o+yZ2TQ81K3s316WRlXNV3fuEWsW8SajV71NG
         x1lswoZqLRHjTIDoVdak4KWFdB4RulgZM+21wvlyMA3dJ4gUcUvVLnMc7Di/Tw3v5fKw
         OgwOMO+Jz2HhLuQoipbGrESxAaiDfE9IvJkGgENBcuik9CAvfEHIp+F/kujaR/GHzVbk
         WHdKAJNJ6DrVUeXQnwXmdOtwlSoe18VJl5DrTprdmauj1N+37K6wlpDG4SU3bXxY6S0e
         SmGi4nRMtFfr2KbltZG56VOffQ/jAroBCkcxDgLoNeXbloZsvVuzGwhVhYybIk3kHCsT
         thhw==
X-Gm-Message-State: AAQBX9eAEDKxKlrHsbrosFXDDJftVPoWWAsP9PJ3UamySQ856QhfkQ2Y
	fHbnuUC5FaOnitGHqdc+tjGJY16DrJqN2OEsPypFdgMnB6Z0J3tgE9GSfOf0ZuET/W7TSf5rG27
	ByaY/VuVWO5Patw==
X-Received: by 2002:a05:6214:2aad:b0:56e:9317:eb9a with SMTP id js13-20020a0562142aad00b0056e9317eb9amr6592663qvb.29.1679687649100;
        Fri, 24 Mar 2023 12:54:09 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y3suJMoeD22pwLpecdSYpxhvSJ69sCrGTjVBJLxJGFJIxRx3Oe7uCHkoJj7IPUAMd1rm5fxw==
X-Received: by 2002:a05:6214:2aad:b0:56e:9317:eb9a with SMTP id js13-20020a0562142aad00b0056e9317eb9amr6592635qvb.29.1679687648834;
        Fri, 24 Mar 2023 12:54:08 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id j185-20020a37b9c2000000b007465ad44891sm13466083qkf.102.2023.03.24.12.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 12:54:08 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: zackr@vmware.com,
	linux-graphics-maintainer@vmware.com,
	airlied@gmail.com,
	daniel@ffwll.ch,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] drm/vmwgfx: remove unused mksstat_init_record function
Date: Fri, 24 Mar 2023 15:54:03 -0400
Message-Id: <20230324195403.2655148-1-trix@redhat.com>
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
drivers/gpu/drm/vmwgfx/vmwgfx_msg.c:716:21: error: unused function
  'mksstat_init_record' [-Werror,-Wunused-function]
static inline char *mksstat_init_record(mksstat_kern_stats_t stat_idx,
                    ^
This function is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_msg.c | 26 --------------------------
 1 file changed, 26 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c b/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
index e76976a95a1e..ca1a3fe44fa5 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
@@ -702,32 +702,6 @@ static inline void hypervisor_ppn_remove(PPN64 pfn)
 /* Header to the text description of mksGuestStat instance descriptor */
 #define MKSSTAT_KERNEL_DESCRIPTION "vmwgfx"
 
-/**
- * mksstat_init_record: Initializes an MKSGuestStatCounter-based record
- * for the respective mksGuestStat index.
- *
- * @stat_idx: Index of the MKSGuestStatCounter-based mksGuestStat record.
- * @pstat: Pointer to array of MKSGuestStatCounterTime.
- * @pinfo: Pointer to array of MKSGuestStatInfoEntry.
- * @pstrs: Pointer to current end of the name/description sequence.
- * Return: Pointer to the new end of the names/description sequence.
- */
-
-static inline char *mksstat_init_record(mksstat_kern_stats_t stat_idx,
-	MKSGuestStatCounterTime *pstat, MKSGuestStatInfoEntry *pinfo, char *pstrs)
-{
-	char *const pstrd = pstrs + strlen(mksstat_kern_name_desc[stat_idx][0]) + 1;
-	strcpy(pstrs, mksstat_kern_name_desc[stat_idx][0]);
-	strcpy(pstrd, mksstat_kern_name_desc[stat_idx][1]);
-
-	pinfo[stat_idx].name.s = pstrs;
-	pinfo[stat_idx].description.s = pstrd;
-	pinfo[stat_idx].flags = MKS_GUEST_STAT_FLAG_NONE;
-	pinfo[stat_idx].stat.counter = (MKSGuestStatCounter *)&pstat[stat_idx];
-
-	return pstrd + strlen(mksstat_kern_name_desc[stat_idx][1]) + 1;
-}
-
 /**
  * mksstat_init_record_time: Initializes an MKSGuestStatCounterTime-based record
  * for the respective mksGuestStat index.
-- 
2.27.0

