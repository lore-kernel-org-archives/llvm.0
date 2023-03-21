Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5ECDD50E
	for <llvm@lists.linux.dev>; Tue, 21 Mar 2023 19:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679425297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jDgIhgp53F4LHTSbzXO+YUJfE0aKRCAlyTc2/nXzqFQ=;
	b=IMSdwHIxr1QmX58w4JQWtyhpwvFRiCXjc9xbGwH5Ma+EvoZ0jea+jgfn9wmVmoJiMgZ1jc
	JCp24tOktbHhjeFqvaXwE+ZLECfogaIHMDcamxwPu70IqyEUX53HifuhRASgO7XH7JUGPr
	KBkDBuY195drkQ92yhd3l4byjO2m1uA=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-uVLwNjliOwGm6yWAqFCtSQ-1; Tue, 21 Mar 2023 15:01:36 -0400
X-MC-Unique: uVLwNjliOwGm6yWAqFCtSQ-1
Received: by mail-qv1-f72.google.com with SMTP id j15-20020a0cc34f000000b005c824064b10so3803116qvi.17
        for <llvm@lists.linux.dev>; Tue, 21 Mar 2023 12:01:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679425296;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jDgIhgp53F4LHTSbzXO+YUJfE0aKRCAlyTc2/nXzqFQ=;
        b=LRnoxSW5pnjT/NOB5c3G7shvgLDzzeTo+9fdXUd3OFDyY4TFIejFJEJy441q1qQJUv
         gfohjnyuY2koOJpIuDch3q6+CYbmhYh/8K7HxlCwk7nkHQF87cQ6wjkS/5iYugGerjS8
         wrGRXO4vhFc35QHz5U+HOM8OdS6zhu+UUGeFUlBj52cH4YDnvlZs8WPps9GY8aOaxbhj
         yDxid8C/n6Y5zMWDrfBKP33/qbboVnH6erGaCFvhM6CXl75VzzjtxAmUjS4Cd6/+8fP/
         TW4aeQ+7AuY/Tbe/ctMsM3CqQSRMg8kKhX89kkjc/fmszkY8/Fo4+9f/oX9zahNoKdi5
         Xc6g==
X-Gm-Message-State: AO0yUKXwKpQmii8tnobsVx5w7xlzx6YOrdI65d33nL1ZawckmrjcCF2h
	5iVUl+8GGgVFkrrCghjw5tUmC8rRV97v9o6Eym5E7ncoa5q7sMrx1L1eP0R9jOxzgzP5UGl6JmT
	CFhj/13oS5ToJ0w==
X-Received: by 2002:a05:6214:d07:b0:5cc:e059:efa3 with SMTP id 7-20020a0562140d0700b005cce059efa3mr1487153qvh.23.1679425296007;
        Tue, 21 Mar 2023 12:01:36 -0700 (PDT)
X-Google-Smtp-Source: AK7set9UtNWa/XtHHXbYeSxWPiA8fhZvXtBktHVWK/DoCGMPKvnMpcnYyKocZiXKb0EXFRGGYKumwA==
X-Received: by 2002:a05:6214:d07:b0:5cc:e059:efa3 with SMTP id 7-20020a0562140d0700b005cce059efa3mr1487112qvh.23.1679425295618;
        Tue, 21 Mar 2023 12:01:35 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id v127-20020a379385000000b0074230493ccfsm9847029qkd.73.2023.03.21.12.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 12:01:34 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: gregkh@linuxfoundation.org,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] staging: rts5208: remove unused xd_check_err_code function
Date: Tue, 21 Mar 2023 15:01:27 -0400
Message-Id: <20230321190127.1827703-1-trix@redhat.com>
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
drivers/staging/rts5208/xd.c:34:19: error: unused function
  'xd_check_err_code' [-Werror,-Wunused-function]
static inline int xd_check_err_code(struct rtsx_chip *chip, u8 err_code)
                  ^
This function is not used, so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/staging/rts5208/xd.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/rts5208/xd.c b/drivers/staging/rts5208/xd.c
index 42cab93982c0..c0af378ada71 100644
--- a/drivers/staging/rts5208/xd.c
+++ b/drivers/staging/rts5208/xd.c
@@ -31,13 +31,6 @@ static inline void xd_set_err_code(struct rtsx_chip *chip, u8 err_code)
 	xd_card->err_code = err_code;
 }
 
-static inline int xd_check_err_code(struct rtsx_chip *chip, u8 err_code)
-{
-	struct xd_info *xd_card = &chip->xd_card;
-
-	return (xd_card->err_code == err_code);
-}
-
 static int xd_set_init_para(struct rtsx_chip *chip)
 {
 	struct xd_info *xd_card = &chip->xd_card;
-- 
2.27.0

