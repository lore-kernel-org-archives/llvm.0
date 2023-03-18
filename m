Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5EF259D
	for <llvm@lists.linux.dev>; Sat, 18 Mar 2023 13:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679147556;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8JKKCoHtsIdOT+kL0un84AUvIlxjWeKq5FTVFUrPKc8=;
	b=W2HN28NuRJvV2tEAbmV4FRYcdo5Nx3IJujANbCqgi53xssop7rYFTe7B0dsFZkXNhXboTt
	mXHZsyai2lwdeUJQo2iOzhD9J2teBZSWmKqVswn7v6W5ddlfj33tJzM+/ujYE/hti3PY+6
	yaUmUyGrMrk9MQ/1Kr1GcTeEuXIaADI=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-601-zUjtalA6P8Cx96qU-PCkGg-1; Sat, 18 Mar 2023 09:52:35 -0400
X-MC-Unique: zUjtalA6P8Cx96qU-PCkGg-1
Received: by mail-qk1-f198.google.com with SMTP id s21-20020a05620a0bd500b0074234f33f24so3683450qki.3
        for <llvm@lists.linux.dev>; Sat, 18 Mar 2023 06:52:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679147554;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8JKKCoHtsIdOT+kL0un84AUvIlxjWeKq5FTVFUrPKc8=;
        b=FOmDYdLyHElux0VD0fYYS/Cg3sZKDYGWmaFQuv3q4fP6XfDlBXyTe4wpFzFOGiqLnI
         NGh1IfDDPDdUP67DwJfvSCbk5Fu9jVq6Yj41d4Lq4RCEQxLZXSgHVHIhRIHsnw625SJo
         8GgnMxNkcylAakJfZJBFNdZoLQ2Lkz/I37sY+QNVZDMRFOfKVU9DdDCe4wWk4WlbFUmN
         0FWDpHakfQuI73o1Gfadqs9NH/P82bVvhQTxqCXwxwGz1njBvvuSSndVLf4HQo9zhTya
         ugIcnqGNl6TLWnMpuE8Hh5jLSINJ4gYLu4hzCpvZTDeqKiN+F5N+sLjbuNQgKTOu/KjL
         YuiQ==
X-Gm-Message-State: AO0yUKU6u64pk75pheO6xWahL8A0/V0xGhH3W6hG87AIYNbJTXEBzqSK
	bC8sSvHrOG2rhpwpbmofT39+GI3Ht1Oui7UoQicNFwxuEJ1uSCwhXEvOc6bT1sKe8IEA8TwZJa/
	UxXIksePtN5gCSeXX3hOSIw==
X-Received: by 2002:a05:622a:110a:b0:3bf:cd81:399f with SMTP id e10-20020a05622a110a00b003bfcd81399fmr18628187qty.3.1679147554689;
        Sat, 18 Mar 2023 06:52:34 -0700 (PDT)
X-Google-Smtp-Source: AK7set8IGPXW4iPtLnhcFdeE5DBfD6algKbXB9t7jslQwB7wD2STcpXKORYgPtCB7dq5QEEc6Kgcjw==
X-Received: by 2002:a05:622a:110a:b0:3bf:cd81:399f with SMTP id e10-20020a05622a110a00b003bfcd81399fmr18628176qty.3.1679147554463;
        Sat, 18 Mar 2023 06:52:34 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id t72-20020a37464b000000b00725d8d6983asm3626195qka.61.2023.03.18.06.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Mar 2023 06:52:34 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: perex@perex.cz,
	tiwai@suse.com,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] ALSA: portman2x4: remove unused portman_read_command,data functions
Date: Sat, 18 Mar 2023 09:52:29 -0400
Message-Id: <20230318135229.1685266-1-trix@redhat.com>
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
sound/drivers/portman2x4.c:185:18: error: unused function
  'portman_read_command' [-Werror,-Wunused-function]
static inline u8 portman_read_command(struct portman *pm)
                 ^
sound/drivers/portman2x4.c:195:18: error: unused function
  'portman_read_data' [-Werror,-Wunused-function]
static inline u8 portman_read_data(struct portman *pm)
                 ^
These static functions are not used, so remove them.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 sound/drivers/portman2x4.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/sound/drivers/portman2x4.c b/sound/drivers/portman2x4.c
index 52a656735365..4cdf56a0eb65 100644
--- a/sound/drivers/portman2x4.c
+++ b/sound/drivers/portman2x4.c
@@ -182,21 +182,11 @@ static inline void portman_write_command(struct portman *pm, u8 value)
 	parport_write_control(pm->pardev->port, value);
 }
 
-static inline u8 portman_read_command(struct portman *pm)
-{
-	return parport_read_control(pm->pardev->port);
-}
-
 static inline u8 portman_read_status(struct portman *pm)
 {
 	return parport_read_status(pm->pardev->port);
 }
 
-static inline u8 portman_read_data(struct portman *pm)
-{
-	return parport_read_data(pm->pardev->port);
-}
-
 static inline void portman_write_data(struct portman *pm, u8 value)
 {
 	parport_write_data(pm->pardev->port, value);
-- 
2.27.0

