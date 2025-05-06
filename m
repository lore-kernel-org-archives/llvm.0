Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C83290D85
	for <llvm@lists.linux.dev>; Tue,  6 May 2025 04:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746505259; cv=none; b=RocfTJtObM5emNlc8mrnUz6Jt4M2vqGT6E+t8LZMYLNWGKgf8z9ThEp9LWA5jVWkxRp3ReAahfquIIFnsWAFR7naO719kCF7hIkyYf+sE6UmexJvgfjt1znxjb4Ufqn5I/NptqbySNiV46z9dWiEZLEmlYfRxjomGyeY9YU9fvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746505259; c=relaxed/simple;
	bh=bZxK33i99OU1z9Twr/cl818WPF3ERnHt8WF2NSkPQCA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=n2ITDseXpAaMF1pGLgkAdB92RcWdYrh98AgItumVVRpRBqtIW4YgGKKbLhespFcQ7Ps/qRsbLL31lJBH9rl0w4+4RSOYwxr4BNcFb5rwRT31aOPV7UAAoEthGgKTevZULODzkV4Lu+tUCuSn3BbGm6PhrEzgALDXrhS86PvtqDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SrB9Idzy; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SrB9Idzy"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7c56a3def84so535062985a.0
        for <llvm@lists.linux.dev>; Mon, 05 May 2025 21:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746505256; x=1747110056; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=57MFR03Gr8+aIe3D1HYS/91F5vu6dogCSlHAYT3AFZM=;
        b=SrB9IdzylwW+YAbbPO3tZjU15HTi4dXF6y+d4xL0CDyKLlKkXz67Vf5noUazU7nZ+Y
         +O+z3C6tyx1ZStpKizqkpMADOtl8qEfHNKyryzJAuAKBNisrcE7JkxoqXH1bOHHGNryV
         9DoD98J5Q3icjn/5nrWTH+MJ/b3cBdCjKiqYCEbNtwvNWnzFKem06NLyCQRDm+CpIkNO
         GcbtWDn8FsXfMWNS/NanL7JSWMQnl9yO9iZbTnqqhC4AwmIAgc0Bid/0/wbJ7x05goJz
         5Zbpb72glsG1/C634ziNHtS7gljXnYnb4PU+myL/qmCAf02sqT64BK2mMZ/QF+vXvNeJ
         9qGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746505256; x=1747110056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=57MFR03Gr8+aIe3D1HYS/91F5vu6dogCSlHAYT3AFZM=;
        b=dnxy04ThT/kBuazGA3HA49vD7WG/IoBMXYkq52jBEQD2LjESd+lcIIaVnyhIyLXlnw
         GQs6Y4A4CLPYnrIl3lNnrQNFsM4PbGcrQSriTnbw21bWRamzCrlAV7DKkUYqR9nzSmZA
         8E+4HVsimg2moXaZQvf2E1Eo/1eijFH549xA61noxyKM0MdBjruC9K4vzpbYcpnRZxLb
         cdA4xaf8ShiPWNzNEx5ZfG7yO4Ntx8XyqUGRclvjP2XSd8SWMT2wIzq9Uw2bSDY6OHx5
         aJEBDyj0XsHDwMWZt09eEF82/xjvhE8oPy6F3j76ct9xFGOCMvBvu6GMTyE4vocMruML
         cSRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfhLymslsvd5qkqSrWzxS68p8jHGeY+eQsqYLH9GsXh9p2ou5rCwBlLfjk19+kcxK9UeF/@lists.linux.dev
X-Gm-Message-State: AOJu0YygI2ZYxMLJ4Ux2qmN4NmYxGjQ+LCagxjmhx7kXsbXJ3VUvnEO1
	GQHVOPdAyL20HrDbz87CQgTeaSOQYodScpAE5MUhxbvdGdpWmoQ5XJpBhg==
X-Gm-Gg: ASbGncuqr67PUSfOYrpxJUSqcQ/noF8ZSNpmkWlE6ldYSsrOCI2UyYKVrWNytc2BMEs
	FDMqOByVUYpRgKsyAcgKXopBqngD9i0Y2+kiWdpyTIbFC9H6nVu3n0pxryjIbmfLXTcGSwhckTu
	uFXWCezALNwKCDvSor7T5sBj4SNJul9+PTwZ8P9rDw+OSrzAGzfW1eojgq8oYSEfZQBRvKcRcek
	CgiXi/JbNXHkJ4LHspSoL9hCHS2xAgc1iX3Qrpwz4ou6RsgXtGTXgG47WN9T6308YhsoVO3Woe9
	3ervK/W0XrycSim4g/8WBoXgR0lBriuFUQL9OA9cFpMM0JoEkw67guZUzQBAi80N3Vay2dfcyCL
	G8SAnRE1YtE3hqumoKNL2KxpN69rH9/P65nK2B3D77g==
X-Google-Smtp-Source: AGHT+IEL8xKGkbxfSW3OFbEmmxvlrk2XdbrrjdDU8/tSH26Jn2FDNv29o6j3OM0i2V39aJjESHYb7g==
X-Received: by 2002:a05:620a:2894:b0:7c9:5f56:777b with SMTP id af79cd13be357-7caf109dafcmr167720785a.0.1746505256380;
        Mon, 05 May 2025 21:20:56 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cad23b5f51sm661832085a.11.2025.05.05.21.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 21:20:55 -0700 (PDT)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 891501200068;
	Tue,  6 May 2025 00:20:55 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Tue, 06 May 2025 00:20:55 -0400
X-ME-Sender: <xms:J44ZaHe9Zq9A8SQcRwIDzaLAMDxj9yOixKU3a07VSea5u_R__xb5Pg>
    <xme:J44ZaNOxoSCBms7e_wbfvhJmkeLIA1RrqOFkhx0dX-WS4emgpK5Fb5tOFN41kIACW
    auv1NPQ3qPplUBUDw>
X-ME-Received: <xmr:J44ZaAihgAoTaM0qt89W0cqztr9YYmq1IEDrcLxRwCEsh4M4z-0SDOrT>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeeftddtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredt
    tdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
    hlrdgtohhmqeenucggtffrrghtthgvrhhnpefghfffvefhhfdvgfejgfekvdelgfekgeev
    ueehlefhiedvgeffjefgteeugfehieenucffohhmrghinhepkhgvrhhnvghlrdhorhhgne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhu
    nhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqdduje
    ejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdr
    nhgrmhgvpdhnsggprhgtphhtthhopedufedpmhhouggvpehsmhhtphhouhhtpdhrtghpth
    htohepmhhinhhgoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgvthgvrhiisehi
    nhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepmhhinhhgohesrhgvughhrghtrdgtoh
    hmpdhrtghpthhtohepfihilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegsohhq
    uhhnrdhfvghnghesghhmrghilhdrtghomhdprhgtphhtthhopehlohhnghhmrghnsehrvg
    guhhgrthdrtghomhdprhgtphhtthhopehnrghthhgrnheskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtohepnhhitghkrdguvghsrghulhhnihgvrhhsodhlkhhmlhesghhmrghilhdrtg
    homhdprhgtphhtthhopehmohhrsghosehgohhoghhlvgdrtghomh
X-ME-Proxy: <xmx:J44ZaI8stbGFi6nC7jiG3k_jDz_PORFMRar10Z025jat4TTegL5RMg>
    <xmx:J44ZaDs3RMIW_w1rih38Pj7N4t397seBFZ1DoKvV7Mu3PmYZft3tSQ>
    <xmx:J44ZaHEi9ZXH13Wn-aq7uvmlrLXGRypj-vqmZb7_A9pImBKCc8rTag>
    <xmx:J44ZaKPBGkccRUK5xPcPwIJX9gKz_FZbgCulgcgNrKe1wicjl1GhVw>
    <xmx:J44ZaEOxUTV1Jiviqjt2oT533AYyrg0jrzS10aon8G9UcQVJs54h2fpy>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 May 2025 00:20:55 -0400 (EDT)
From: Boqun Feng <boqun.feng@gmail.com>
To: Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Waiman Long <longman@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH 1/3] lockdep: Move hlock_equal() to the respective ifdeffery
Date: Mon,  5 May 2025 21:20:47 -0700
Message-Id: <20250506042049.50060-2-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250506042049.50060-1-boqun.feng@gmail.com>
References: <20250506042049.50060-1-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

When hlock_equal() is unused, it prevents kernel builds with clang,
`make W=1` and CONFIG_WERROR=y, CONFIG_LOCKDEP=y and
CONFIG_LOCKDEP_SMALL=n:

  lockdep.c:2005:20: error: unused function 'hlock_equal' [-Werror,-Wunused-function]

Fix this by moving the function to the respective existing ifdeffery
for its the only user.

See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
inline functions for W=1 build").

Fixes: 68e305678583 ("lockdep: Adjust check_redundant() for recursive read change")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Link: https://lore.kernel.org/r/20250415085857.495543-1-andriy.shevchenko@linux.intel.com
---
 kernel/locking/lockdep.c | 70 ++++++++++++++++++++--------------------
 1 file changed, 35 insertions(+), 35 deletions(-)

diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
index b15757e63626..ff2ce90a87bc 100644
--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -1976,41 +1976,6 @@ print_circular_bug_header(struct lock_list *entry, unsigned int depth,
 	print_circular_bug_entry(entry, depth);
 }
 
-/*
- * We are about to add A -> B into the dependency graph, and in __bfs() a
- * strong dependency path A -> .. -> B is found: hlock_class equals
- * entry->class.
- *
- * If A -> .. -> B can replace A -> B in any __bfs() search (means the former
- * is _stronger_ than or equal to the latter), we consider A -> B as redundant.
- * For example if A -> .. -> B is -(EN)-> (i.e. A -(E*)-> .. -(*N)-> B), and A
- * -> B is -(ER)-> or -(EN)->, then we don't need to add A -> B into the
- * dependency graph, as any strong path ..-> A -> B ->.. we can get with
- * having dependency A -> B, we could already get a equivalent path ..-> A ->
- * .. -> B -> .. with A -> .. -> B. Therefore A -> B is redundant.
- *
- * We need to make sure both the start and the end of A -> .. -> B is not
- * weaker than A -> B. For the start part, please see the comment in
- * check_redundant(). For the end part, we need:
- *
- * Either
- *
- *     a) A -> B is -(*R)-> (everything is not weaker than that)
- *
- * or
- *
- *     b) A -> .. -> B is -(*N)-> (nothing is stronger than this)
- *
- */
-static inline bool hlock_equal(struct lock_list *entry, void *data)
-{
-	struct held_lock *hlock = (struct held_lock *)data;
-
-	return hlock_class(hlock) == entry->class && /* Found A -> .. -> B */
-	       (hlock->read == 2 ||  /* A -> B is -(*R)-> */
-		!entry->only_xr); /* A -> .. -> B is -(*N)-> */
-}
-
 /*
  * We are about to add B -> A into the dependency graph, and in __bfs() a
  * strong dependency path A -> .. -> B is found: hlock_class equals
@@ -2915,6 +2880,41 @@ static inline bool usage_skip(struct lock_list *entry, void *mask)
 #endif /* CONFIG_TRACE_IRQFLAGS */
 
 #ifdef CONFIG_LOCKDEP_SMALL
+/*
+ * We are about to add A -> B into the dependency graph, and in __bfs() a
+ * strong dependency path A -> .. -> B is found: hlock_class equals
+ * entry->class.
+ *
+ * If A -> .. -> B can replace A -> B in any __bfs() search (means the former
+ * is _stronger_ than or equal to the latter), we consider A -> B as redundant.
+ * For example if A -> .. -> B is -(EN)-> (i.e. A -(E*)-> .. -(*N)-> B), and A
+ * -> B is -(ER)-> or -(EN)->, then we don't need to add A -> B into the
+ * dependency graph, as any strong path ..-> A -> B ->.. we can get with
+ * having dependency A -> B, we could already get a equivalent path ..-> A ->
+ * .. -> B -> .. with A -> .. -> B. Therefore A -> B is redundant.
+ *
+ * We need to make sure both the start and the end of A -> .. -> B is not
+ * weaker than A -> B. For the start part, please see the comment in
+ * check_redundant(). For the end part, we need:
+ *
+ * Either
+ *
+ *     a) A -> B is -(*R)-> (everything is not weaker than that)
+ *
+ * or
+ *
+ *     b) A -> .. -> B is -(*N)-> (nothing is stronger than this)
+ *
+ */
+static inline bool hlock_equal(struct lock_list *entry, void *data)
+{
+	struct held_lock *hlock = (struct held_lock *)data;
+
+	return hlock_class(hlock) == entry->class && /* Found A -> .. -> B */
+	       (hlock->read == 2 ||  /* A -> B is -(*R)-> */
+		!entry->only_xr); /* A -> .. -> B is -(*N)-> */
+}
+
 /*
  * Check that the dependency graph starting at <src> can lead to
  * <target> or not. If it can, <src> -> <target> dependency is already
-- 
2.39.5 (Apple Git-154)

