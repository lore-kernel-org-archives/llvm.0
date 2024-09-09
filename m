Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8011817E011
	for <llvm@lists.linux.dev>; Mon,  9 Sep 2024 18:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725906579; cv=none; b=Kep0Xl9IMuE/XOgCBgGhM9bdZ5Xz8vmIGLxMRiB36CAsXIriUL6rui4kQW3xEcS3R5qQa+XOwWmaZfu7xSneR5QgTpB75VFrXJfoJCY8o7T24uXfGa5XPZHgRcOh2YIsTKmlbflNRKvQkd8uJSxfPUggAF5fZkihlDfKZibYEHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725906579; c=relaxed/simple;
	bh=8n3tGnSsaS8Ef5btUal4XH/5jEMt+x/gKgan0/azNhs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fm7qCbrgLzVWlMRmb2bdXCeltwSFpGq2H5QFV81HWB6YcGtACd5p/c/Y5E2v8pAuDIHmYLzm9FaYs7QJA4b0cpmBsCA9/fs/M886Rg4JwWu0VzMR8RTVjhCgLBMJieuFnHbcVzpXwwAgeDimMI0sX9qW0cuJ1PweOxdWpPVENi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YxMSVjve; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YxMSVjve"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725906576;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=v6cW4IEecTFnIMvpjFYXEq2ZsoJICYtcdAcWwNGgLhg=;
	b=YxMSVjveN7+bup5YNI8yurr4BUFGwr++jeaSjAKDJ+RM9xyY1iTYUNbYSNoGEOq4DF6Vz0
	LrZ86+EGspw8NpzVZ8nqwJzPPeQ9eJFLpTDcHDwFGhbGxvQvUFu/xmQnRBtg7yACdLHu0H
	u92D+wVSvLVL92U21Qw8HBPv6c+zImo=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-306-OK7VbwbbPwCk7GjI4CGE9A-1; Mon,
 09 Sep 2024 14:29:33 -0400
X-MC-Unique: OK7VbwbbPwCk7GjI4CGE9A-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A0BD31944D1A;
	Mon,  9 Sep 2024 18:29:30 +0000 (UTC)
Received: from llong.com (unknown [10.2.16.126])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 05E631955F65;
	Mon,  9 Sep 2024 18:29:22 +0000 (UTC)
From: Waiman Long <longman@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will.deacon@arm.com>,
	Boqun Feng <boqun.feng@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Waiman Long <longman@redhat.com>
Subject: [PATCH] locking/rwsem: Move is_rwsem_reader_owned() and rwsem_owner() under CONFIG_DEBUG_RWSEMS
Date: Mon,  9 Sep 2024 14:29:05 -0400
Message-ID: <20240909182905.161156-1-longman@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Both is_rwsem_reader_owned() and rwsem_owner() are currently only used when
CONFIG_DEBUG_RWSEMS is defined. This causes a compilation error with clang
when `make W=1` and CONFIG_WERROR=y:

kernel/locking/rwsem.c:187:20: error: unused function 'is_rwsem_reader_owned' [-Werror,-Wunused-function]
  187 | static inline bool is_rwsem_reader_owned(struct rw_semaphore *sem)
      |                    ^~~~~~~~~~~~~~~~~~~~~
kernel/locking/rwsem.c:271:35: error: unused function 'rwsem_owner' [-Werror,-Wunused-function]
  271 | static inline struct task_struct *rwsem_owner(struct rw_semaphore *sem)
      |                                   ^~~~~~~~~~~

Fix this by moving these two functions under the CONFIG_DEBUG_RWSEMS define.

Reported-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Waiman Long <longman@redhat.com>
---
 kernel/locking/rwsem.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/kernel/locking/rwsem.c b/kernel/locking/rwsem.c
index 33cac79e3994..4b041e9c408f 100644
--- a/kernel/locking/rwsem.c
+++ b/kernel/locking/rwsem.c
@@ -181,12 +181,21 @@ static inline void rwsem_set_reader_owned(struct rw_semaphore *sem)
 	__rwsem_set_reader_owned(sem, current);
 }
 
+#ifdef CONFIG_DEBUG_RWSEMS
+/*
+ * Return just the real task structure pointer of the owner
+ */
+static inline struct task_struct *rwsem_owner(struct rw_semaphore *sem)
+{
+	return (struct task_struct *)
+		(atomic_long_read(&sem->owner) & ~RWSEM_OWNER_FLAGS_MASK);
+}
+
 /*
  * Return true if the rwsem is owned by a reader.
  */
 static inline bool is_rwsem_reader_owned(struct rw_semaphore *sem)
 {
-#ifdef CONFIG_DEBUG_RWSEMS
 	/*
 	 * Check the count to see if it is write-locked.
 	 */
@@ -194,11 +203,9 @@ static inline bool is_rwsem_reader_owned(struct rw_semaphore *sem)
 
 	if (count & RWSEM_WRITER_MASK)
 		return false;
-#endif
 	return rwsem_test_oflags(sem, RWSEM_READER_OWNED);
 }
 
-#ifdef CONFIG_DEBUG_RWSEMS
 /*
  * With CONFIG_DEBUG_RWSEMS configured, it will make sure that if there
  * is a task pointer in owner of a reader-owned rwsem, it will be the
@@ -265,15 +272,6 @@ static inline bool rwsem_write_trylock(struct rw_semaphore *sem)
 	return false;
 }
 
-/*
- * Return just the real task structure pointer of the owner
- */
-static inline struct task_struct *rwsem_owner(struct rw_semaphore *sem)
-{
-	return (struct task_struct *)
-		(atomic_long_read(&sem->owner) & ~RWSEM_OWNER_FLAGS_MASK);
-}
-
 /*
  * Return the real task structure pointer of the owner and the embedded
  * flags in the owner. pflags must be non-NULL.
-- 
2.43.5

