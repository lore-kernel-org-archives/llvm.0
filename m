Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108232;
	b=2tPVAonllzuOYgywvxed7FUXy3uG6n7s5/F5YV6UgTf2GieUk9T5SLUsv4hYEhwjeSxM
	 sCpKjU26+xTByuC3HOxKHENEeuGYW7SvJ2PoLd4F2sDP6Pq+MV9z9Kmc6Glo9nGG0iGG0
	 ogtQ7a3WCOgYvS6GNRjjyhIFqm9K0Xiapwi6OuktFMy0qRP8J0Eka7w+p9cio5wj8QLxA
	 aV/XnIVvb/LupLAAZiBAjliiWlGbpTAFzogUhHiULbe8s/D/thWHPZ6zrF7B9s5rP9YvK
	 dOlNalS/tvAcNwCOrz2IWAaA5LXttTRkPqD8i0UBBxX4Mr6bi5DPdhKBrzFvnULZDXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108232;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=J8wemuSg+wTBYN0mejqZk6NbTrVxXdYsEZvmaE6mIAE=;
	b=0LD/WjGxfuHMvGzHX2ZCdQrubhGclcAf7zgkYuXW99tM0EqwAGt7kXMTmGL0OzRjIiHA
	 DEML4WRiEAczFi4VmV1zqcYo0FaJItGlupiLt2hXUkkODOFzAV2QN/pA5RCDEjwTALIIC
	 Ds454GhyRGCokJw2i88tb1pZCLWnaR74x/8lJRwbh7YEz6LxJHiBEEvFjhxT07R4Mlc1T
	 M01knvdQkMWuKZOms4LYB6qn9MhD+SWIFWJsf4EhfoItqEanojyeNOlJc+u2N37+HVsa5
	 xkpJwctsTZmG65HW0z1HCdOsh6LHgQgolsfVUrZlxsZM9hnQz2UmUs2N5TnFI4K0MIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=f47K6C83;
	arc=none smtp.remote-ip=74.125.82.69
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800BE606A324
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 17:10:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 800BE606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=f47K6C83
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b3a348a6dbso1516685c88.1
        for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 09:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108232; x=1795713032; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J8wemuSg+wTBYN0mejqZk6NbTrVxXdYsEZvmaE6mIAE=;
        b=f47K6C836/elQ5gTnKvSWwM7PDJY+9hIS7hHmCVQmLgu4U+ttPs3Ei7ZzJG9SFAMFh
         O1DS/8Ne4RnnhF2JjQJ2rAmUq2lTgcGfg8WU5+dsuPmwly+4niKMw2LJB12841j1Qdpa
         33++8gM2C9eE+g0P0ggmDZiIL9Ma3o5ZH3waHulNEJaidAgVuF2ja2eE6Dh8h9IXdV4t
         kUzIX8P7jzkxNSQoe8wW4hjGpugfu41s0gVihfQ/hF/WZ79YY0Cztil8ZzL6Bt+2VmHh
         YDVVeNl62Lq0wiopRvqTnEz29OnR3zpnB4urPoUmb/3+ixJSFKkmY/khJzd2tp0sSG7E
         fg4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108232; x=1795713032;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J8wemuSg+wTBYN0mejqZk6NbTrVxXdYsEZvmaE6mIAE=;
        b=AhciEioCCzkdSCRqxRGQfKZhhvscVhzU3eOacpwAV8wU342KF9jzFDkKE1X0nxs2kn
         1NyTzIyHCCK1cOQemjd3JYYIYvMcm8Na3KeoRhXTYykI0S9fL9Dlb9wwhz01Gdcyz0+P
         IK6qEzVEpGMbM8bP+Sji0Q+AOBWhGwV2j2Ru/sto9xiWulEpdQDFeYqhXoz4V3Sv5vId
         5E1W3LhGNXit2fQnR4QQn8K7LPM9oCtZ9rDzTQnYUdr3d9GoP74kh2mBRhCp2pD9EjpW
         49FnuhMZlfzVjzS+lC2oatLg/yjuUSKMRbJldZIr+wSypMl7L3yC6SCHvwXKJDZ/2f0A
         ConA==
X-Forwarded-Encrypted: i=1; AL+hErEI4r1lPfqadsDUbsp5ezXDzmdi9l5TQDaMy2mBa/iK1hMzF2aw0X1pTl06tPUrApCiVOtl@lists.linux.dev
X-Gm-Message-State: APuU4Z+Xen3F6dNgr1ykujJiKFqDONAiuYZUUpxSAvl32Tlum6KyfynC
	LGQFYEozIrG7MBLpIRVrKzu99PBROpNygZAvbg60vNJrKYCjf3QWxcv8pt8czYVflBBB3FP/+1G
	qvmE5zrw4HQ==
X-Received: from dlai4.prod.google.com ([2002:a05:701b:2704:b0:1b3:ba1e:2c7])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:1702:b0:1b4:f5cb:ebe3
 with SMTP id a92af1059eb24-1b5568b45f6mr233091c88.16.1795108231268; Thu, 19
 Nov 2026 09:10:31 -0800 (PST)
Date: Thu, 19 Nov 2026 09:10:26 -0800
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119171026.1535538-1-irogers@google.com>
Subject: [PATCH] rapidio/rio_cm: Check rio_add_outb_message() return value in
 TX paths
From: Ian Rogers <irogers@google.com>
To: Matt Porter <mporter@kernel.crashing.org>, Alexandre Bounine <alex.bou9@gmail.com>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Both rio_txcq_handler() and riocm_post_send() call
rio_add_outb_message() and unconditionally record cm->tx_buf[tx_slot]
and increment cm->tx_cnt and cm->tx_slot even when queuing fails
(rc != 0). Because no outbound message was queued to the mport
hardware, no TX completion event will ever arrive for that slot,
permanently leaking a TX ring entry in cm->tx_cnt (and leaving a freed
req->buffer pointer in cm->tx_buf[] in rio_txcq_handler()).

Only update cm->tx_buf[], cm->tx_cnt, and cm->tx_slot when
rio_add_outb_message() succeeds, and clear cm->tx_buf[tx_slot] to NULL
in rio_txcq_handler() since req->buffer is immediately freed.

Found via Clang -Wunused-but-set-variable on an x86_64 allyesconfig
build. Verified by building drivers/rapidio/rio_cm.o with LLVM=1 W=1
(-Werror) and -Wunused-but-set-variable, and with a standalone C
reproducer under ASan/UBSan; not runtime-tested on RapidIO hardware.

Fixes: b6e8d4aa1110 ("rapidio: add RapidIO channelized messaging driver")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/rapidio/rio_cm.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/rapidio/rio_cm.c b/drivers/rapidio/rio_cm.c
index c55af5924da2..5b88df79ff53 100644
--- a/drivers/rapidio/rio_cm.c
+++ b/drivers/rapidio/rio_cm.c
@@ -670,12 +670,14 @@ static void rio_txcq_handler(struct cm_dev *cm, int slot)
 
 		list_for_each_entry_safe(req, _req, &cm->tx_reqs, node) {
 			list_del(&req->node);
-			cm->tx_buf[cm->tx_slot] = req->buffer;
 			rc = rio_add_outb_message(cm->mport, req->rdev, cmbox,
 						  req->buffer, req->len);
 			kfree(req->buffer);
 			kfree(req);
+			if (rc)
+				continue;
 
+			cm->tx_buf[cm->tx_slot] = NULL;
 			++cm->tx_cnt;
 			++cm->tx_slot;
 			cm->tx_slot &= (RIOCM_TX_RING_SIZE - 1);
@@ -745,8 +747,11 @@ static int riocm_post_send(struct cm_dev *cm, struct rio_dev *rdev,
 		goto err_out;
 	}
 
-	cm->tx_buf[cm->tx_slot] = buffer;
 	rc = rio_add_outb_message(cm->mport, rdev, cmbox, buffer, len);
+	if (rc)
+		goto err_out;
+
+	cm->tx_buf[cm->tx_slot] = buffer;
 
 	riocm_debug(TX, "Add buf@%p destid=%x tx_slot=%d tx_cnt=%d",
 		 buffer, rdev->destid, cm->tx_slot, cm->tx_cnt);
-- 
2.56.1.708.g77570a6a1d-goog

