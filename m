Received: from mail.nfschina.com (unknown [42.101.60.195])
	by smtp.subspace.kernel.org (Postfix) with SMTP id D48DFBE7F
	for <llvm@lists.linux.dev>; Tue,  4 Jun 2024 12:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=42.101.60.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717503181; cv=none; b=iQm77tuJ+AwZ0ez98bIntpH17oH2ZpUAFc8i7vznQuoiKHIv6jA4Uh/+ojYlwFa0PXJKWoeitJXfeiFJ4NwXIAoNBX51pfZ8CXkQWlSjDeZrscLwn7PCpiPTfpmFmpPWWh5PayFCggzwfpyN1XKllSJqX6cCa7g5jxl+qNm2M3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717503181; c=relaxed/simple;
	bh=es9LQ1eTsN135StDyRCpFPHsqX6uG/7ZNvhFSZOePNM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DXYrqws2LRtoOrNHQ2QXXUBrrEPUIfPYSilBbY/k4Iw8lfKofDyCCC+9/bDh5IMd3sNJ9pR/JEO+5eDr6UiE6EIAvEAlU7cK97PRzLM6mE70IIfT8PGbT2RHDwTcW7r3JPSEanY2t9WB07tKXhS5eBsp1uWYvaGs1TZ/xoC3z8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com; spf=pass smtp.mailfrom=nfschina.com; arc=none smtp.client-ip=42.101.60.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Received: from localhost.localdomain (unknown [180.167.10.98])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPSA id 93B93606EDF49;
	Tue,  4 Jun 2024 20:12:53 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: axboe@kernel.dk,
	asml.silence@gmail.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com
Cc: Su Hui <suhui@nfschina.com>,
	haoxu@linux.alibaba.com,
	io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] io_uring/io-wq: avoid garbge value of 'match' in io_wq_enqueue()
Date: Tue,  4 Jun 2024 20:12:43 +0800
Message-Id: <20240604121242.2661244-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clang static checker (scan-build) warning:
o_uring/io-wq.c:line 1051, column 3
The expression is an uninitialized value. The computed value will
also be garbage.

'match.nr_pending' is used in io_acct_cancel_pending_work(), but it is
not initialized. Change the order of assignment for 'match' to fix
this problem.

Fixes: 42abc95f05bf ("io-wq: decouple work_list protection from the big wqe->lock")
Signed-off-by: Su Hui <suhui@nfschina.com>
---
 io_uring/io-wq.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/io_uring/io-wq.c b/io_uring/io-wq.c
index d1c47a9d9215..7d3316fe9bfc 100644
--- a/io_uring/io-wq.c
+++ b/io_uring/io-wq.c
@@ -927,7 +927,11 @@ void io_wq_enqueue(struct io_wq *wq, struct io_wq_work *work)
 {
 	struct io_wq_acct *acct = io_work_get_acct(wq, work);
 	unsigned long work_flags = work->flags;
-	struct io_cb_cancel_data match;
+	struct io_cb_cancel_data match = {
+		.fn		= io_wq_work_match_item,
+		.data		= work,
+		.cancel_all	= false,
+	};
 	bool do_create;
 
 	/*
@@ -965,10 +969,6 @@ void io_wq_enqueue(struct io_wq *wq, struct io_wq_work *work)
 		raw_spin_unlock(&wq->lock);
 
 		/* fatal condition, failed to create the first worker */
-		match.fn		= io_wq_work_match_item,
-		match.data		= work,
-		match.cancel_all	= false,
-
 		io_acct_cancel_pending_work(wq, acct, &match);
 	}
 }
-- 
2.30.2

