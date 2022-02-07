Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9A12C9C
	for <llvm@lists.linux.dev>; Mon,  7 Feb 2022 18:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1644259901;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NvU5tprvh+UDdv26EAx+wVN7Ocpyn3c3CsBDj5+9PsM=;
	b=fEsxP5y6pvua6wTTAA0Dnj9/8lcf2RxCY+YFxeI4Clf8fwDFeyUqEitvDetYhJavazkUkF
	FjyB8IYLlVxbGUCv15a+5qYwhkMR7bVRtFyOBQQZLojGoB/VgUHVpS6YoUyeMtOS1jr2TE
	PLNLbPgtKgBQuABTssaWexmJyTIge4M=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-537-mSiZgdU-Mi67-k0SQ1JFWw-1; Mon, 07 Feb 2022 13:51:40 -0500
X-MC-Unique: mSiZgdU-Mi67-k0SQ1JFWw-1
Received: by mail-qk1-f198.google.com with SMTP id b18-20020a05620a089200b004e0e2f73f35so9224124qka.19
        for <llvm@lists.linux.dev>; Mon, 07 Feb 2022 10:51:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NvU5tprvh+UDdv26EAx+wVN7Ocpyn3c3CsBDj5+9PsM=;
        b=m2xLLvtROpv0W5XG1fhBTxqI7zBNJPH20GokaablGrlGBpjqHiGc1abQqAdT15jzHX
         LHB+PEY/lhCuwVe06ZaXkvqe1CzD5pLUhzlhmaJcj3ZPFSdOeeMOoROOyTLzUdJPSPhO
         iyuyMEFB4A9FfU1XF2hN1q64muBX9NGsnoL/qEP7Hjd+PqcKgg9T0I2tx1ChvHqPT5Up
         Bjfpj9kpSeTLaN/ocgRJikbF1Y1XFakEGD7Xq6z9WLM8CeD755KPsEhNjr3eJG47nYrI
         grSvFMg79UKy9AbBA/pg9Ia5HKL8sGJ7tyAF5kV6BdNdE8JtdfqveFobjtyCd9St6pNR
         Zh/A==
X-Gm-Message-State: AOAM533sgCF0yO64wz9kbw1f6YP2o0Xbs2qodxkxl1ocx225Ck6BHJrY
	miz8vgz6GrYG7GHPsJuCUo9hpf0yXS2IxuGZxr91PGPJF0R3CAmXZYbwUlYDxLLPdFAJ5Wfxnbm
	r2OcG0DZT1KGgfQ==
X-Received: by 2002:ac8:7d0d:: with SMTP id g13mr644666qtb.168.1644259900306;
        Mon, 07 Feb 2022 10:51:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwu11695XI9Zsd4rsyupYe/UJYMLSTJVRBNGwcwiBFgOq5vyomoglH0AfFajDCRhiqB7vAv2A==
X-Received: by 2002:ac8:7d0d:: with SMTP id g13mr644650qtb.168.1644259900108;
        Mon, 07 Feb 2022 10:51:40 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id u9sm5826890qko.110.2022.02.07.10.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 10:51:39 -0800 (PST)
From: trix@redhat.com
To: axboe@kernel.dk,
	asml.silence@gmail.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	usama.arif@bytedance.com
Cc: io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] io_uring: fix uninitialized return
Date: Mon,  7 Feb 2022 10:51:26 -0800
Message-Id: <20220207185126.2085525-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

From: Tom Rix <trix@redhat.com>

The clang build fails with this error
io_uring.c:9396:9: error: variable 'ret' is uninitialized when used here
        return ret;
               ^~~~
Return 0 directly.

Fixes: b77e315a9644 ("io_uring: avoid ring quiesce while registering/unregistering eventfd")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 fs/io_uring.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/io_uring.c b/fs/io_uring.c
index aadabb31d6da7..74afb96af214c 100644
--- a/fs/io_uring.c
+++ b/fs/io_uring.c
@@ -9393,7 +9393,7 @@ static int io_eventfd_register(struct io_ring_ctx *ctx, void __user *arg,
 	ev_fd->eventfd_async = eventfd_async;
 
 	rcu_assign_pointer(ctx->io_ev_fd, ev_fd);
-	return ret;
+	return 0;
 }
 
 static void io_eventfd_put(struct rcu_head *rcu)
-- 
2.26.3

