Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE277C
	for <llvm@lists.linux.dev>; Tue, 24 Jan 2023 12:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674565098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZSi6S+muZGTgBwtIdsJ5fCvNBIzBTV5J3NQ7wnrMIF8=;
	b=UBUUb7q94Swu2dGxlbFY3C4wr2qz5kR8dw/VL2FOk6dab+kSJ9VynEwjlB7j8l2ac6N2wR
	PI5EMpGXChb1+qbxe2jeysElv95D8my0hmN2i7mPflYMJoGlFBEDWgfd7Klo6rgh+DvlX7
	OOzVFvMr1QRqxMtNJeUjZtNmsWQtyMo=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-47-DtnP-WvmPC20mWM7-w6tAg-1; Tue, 24 Jan 2023 07:58:17 -0500
X-MC-Unique: DtnP-WvmPC20mWM7-w6tAg-1
Received: by mail-qt1-f198.google.com with SMTP id br26-20020a05622a1e1a00b003b62dc86831so5885307qtb.8
        for <llvm@lists.linux.dev>; Tue, 24 Jan 2023 04:58:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZSi6S+muZGTgBwtIdsJ5fCvNBIzBTV5J3NQ7wnrMIF8=;
        b=WS9jvOxLqk5KqzfbBrKSEYfX42T0iMoLVD62KkQbmF3+HmrIUt0m1jUwkpYR2TdlIV
         sha0LoIKkFl5y2BZk0AIaIK9pkQrJIrQf7JeYuRyvwlHzTDkFoMfIZnO1fPtQLBhQ0L2
         4ysiIwbeKXo7XrE00h4FMl73WemgibBz3pK2Kn1SaJAYIvKTDx7dCcZG03/oOS6xYBj9
         P1EL5RwvdqToCkirLh2yNhPMMuOwPxpsSCvkHheK2aKKxAbHaWZlW4oLXeXHA7rtQRlC
         zPhHHtgTbV9DM4zSnulZQFehayvH4LXP6dG8PU+601m4nEA353PeVv257UrHH5F+XlGs
         ArSw==
X-Gm-Message-State: AFqh2kpcfVYrPZerP24DgvBCfdMOyfURTxg940loV+mMvv3lreGQnZ7z
	G6JHVPC/KJXiPT4cZvHLM1BQ9EQyVahqcrfgNMWbskPqg4RjG3PyzY1YbIj2x0xR926uJgY3d8F
	7B2kB5QYY7qi9sw==
X-Received: by 2002:ac8:7350:0:b0:3b6:90c4:b13a with SMTP id q16-20020ac87350000000b003b690c4b13amr27608079qtp.58.1674565096637;
        Tue, 24 Jan 2023 04:58:16 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtLt3U69T2XRyfXT9r14cbZA03RVHPgFC5vWRm+j1Qb42uI3X9erIeuPmuCPjOI5VnlnIACFQ==
X-Received: by 2002:ac8:7350:0:b0:3b6:90c4:b13a with SMTP id q16-20020ac87350000000b003b690c4b13amr27608059qtp.58.1674565096385;
        Tue, 24 Jan 2023 04:58:16 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id r22-20020ac87ef6000000b003ab7aee56a0sm1192570qtc.39.2023.01.24.04.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 04:58:16 -0800 (PST)
From: Tom Rix <trix@redhat.com>
To: axboe@kernel.dk,
	asml.silence@gmail.com,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] io_uring: initialize count variable to 0
Date: Tue, 24 Jan 2023 04:58:05 -0800
Message-Id: <20230124125805.630359-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
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

The clang build fails with
io_uring/io_uring.c:1240:3: error: variable 'count' is uninitialized
  when used here [-Werror,-Wuninitialized]
  count += handle_tw_list(node, &ctx, &uring_locked, &fake);
  ^~~~~

The commit listed in the fixes: removed the initialization of count.

Fixes: b5b57128d0cd ("io_uring: refactor tctx_task_work")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 io_uring/io_uring.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index 734d074cdd94..4cb409ae9840 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -1227,7 +1227,7 @@ void tctx_task_work(struct callback_head *cb)
 	struct llist_node fake = {};
 	struct llist_node *node;
 	unsigned int loops = 0;
-	unsigned int count;
+	unsigned int count = 0;
 
 	if (unlikely(current->flags & PF_EXITING)) {
 		io_fallback_tw(tctx);
-- 
2.26.3

