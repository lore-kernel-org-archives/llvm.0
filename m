Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB18313D43
	for <llvm@lists.linux.dev>; Thu, 18 Sep 2025 14:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758204375; cv=none; b=ZCFQy6uWnjrQXeR+I0wNPFLH/fwlIxYwFpM73DDPvM3MFM72ftnfHHMh3mMfEhoSLXBoXv/rR+/G4sS8GYd/sLSfVsct2/r01o9qLOndWONeqR4/gg3DwBQ5kRTesqTKddTAW6O5T09HZsbQYhl4zgL6WHIVSTx9MEzf1712mTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758204375; c=relaxed/simple;
	bh=LHYO9FLHePXvRunBbFXq2yIww9rcJFc0YdqotGUFypU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UEQhHLVQxIGMVg4W152ZW6ITVk7Oj48o3najdsv7pEOn5lXLBpxSAgPKKfoszRoT2upsytoYrJN7YnIH5C6/tj4FrcQVc2HwvOBYSZDKMKYnQrsGR35cA6jLT4Gdxi0ZZGv4PKOV0c90SmWo/CJt2nkLaewGxXS088g4PA/Ohos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QbwxRaDe; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QbwxRaDe"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-45cb604427fso6365545e9.1
        for <llvm@lists.linux.dev>; Thu, 18 Sep 2025 07:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758204371; x=1758809171; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nMl1c+2bip1CSgLpfgWYnQ0cyIrLa9qex036CuBQq14=;
        b=QbwxRaDeCWDN/tXMbGIg0WDAx7jvmvhVFa81K+0W6VgFjYUaXF3bBRByaLw1HeoRpq
         bTeZW0rkpHcaEVrRBEJSeYNMI+CTB7LLVLLEltLpQUE/z+79tMz4IfqWq6j3PpTy4Qpz
         F2S3mLk0xTs7qzKLZqhP7rMEtZITh1SCYHblNVHItXlMOeIQoeQi0qrEcUzB7PQi/2w7
         E5IG/XzPLNIBZVfNt8HDA19aUGUe/sac9qw7QyUQAHa82xvpYYEK/2kvFr8XMjSINxJx
         6eRBPp4tq6A2N+fLCMFQnFfVxrJ1Bgw3XHGY/hjP2byJQ5WhuwzgUjrIbq1yM7nqIdfL
         nRxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758204371; x=1758809171;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nMl1c+2bip1CSgLpfgWYnQ0cyIrLa9qex036CuBQq14=;
        b=OTdAxr6LZnzRsEXa7deZr7dr3IxCMheB1Y96lWQlNtiClS+mD5p/t46dS0Q7FgoWCS
         4m4WxGWix8lttXWJN1Ka+ykYTXmE9feXV/1Ik0tD3ixxD9zp4qdtNMOhA+sK7qHJ6oh3
         HmqkLZOuJBpTLPZ7n9hunb5F29wU0RI+s1IT0g/G7+w3Ksgzd74B768Q0p2yjO/Gzqum
         83735dp8ebJlsjyFrS+tHRaOoANQ0VW9vYY0o6rbDwHMyzhgxSweupY8lF2xkSONo3z3
         URJjIH5tBPb4GalS3nyTQzUiCEXkht+Kjbr5uSamX0THTNZ6XSufcgCU7e/zobWsDrUH
         hxBA==
X-Forwarded-Encrypted: i=1; AJvYcCWQegmDJqyfHkGkKqYtyxRyrEIJJTr2zGeXhshAHjz5CeVbClL3Gr+94bGaTQ/d5iVSMlLQ@lists.linux.dev
X-Gm-Message-State: AOJu0YwHKJ8BqSnZQSyLAIz31DPGkv2JfdQb7Me2JZLWr90aZW04PnC5
	/GtjkPRo+vx421Pn/ccoS8EMmzk80bnyvg9ogeUUvfr09FUSzulF76WhvlwPVlE+J418LZ3GPw4
	56w==
X-Google-Smtp-Source: AGHT+IGGSan2NMk0haZJyAnJIFJtZQy4kWfduj7BSWtkqxKSEROyPCMlVWawyq2y1FSCfdmQzsRbgTIQaw==
X-Received: from wmbay25.prod.google.com ([2002:a05:600c:1e19:b0:464:f7d9:6b0])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a5d:64c5:0:b0:3ec:dd12:54d3
 with SMTP id ffacd0b85a97d-3ecdfa1eb5amr4911144f8f.35.1758204370434; Thu, 18
 Sep 2025 07:06:10 -0700 (PDT)
Date: Thu, 18 Sep 2025 15:59:27 +0200
In-Reply-To: <20250918140451.1289454-1-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250918140451.1289454-1-elver@google.com>
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
Message-ID: <20250918140451.1289454-17-elver@google.com>
Subject: [PATCH v3 16/35] kref: Add capability-analysis annotations
From: Marco Elver <elver@google.com>
To: elver@google.com, Peter Zijlstra <peterz@infradead.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Alexander Potapenko <glider@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	Bart Van Assche <bvanassche@acm.org>, Bill Wendling <morbo@google.com>, Christoph Hellwig <hch@lst.de>, 
	Dmitry Vyukov <dvyukov@google.com>, Eric Dumazet <edumazet@google.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Ian Rogers <irogers@google.com>, 
	Jann Horn <jannh@google.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Triplett <josh@joshtriplett.org>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	Kentaro Takeda <takedakn@nttdata.co.jp>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>, Thomas Gleixner <tglx@linutronix.de>, 
	Thomas Graf <tgraf@suug.ch>, Uladzislau Rezki <urezki@gmail.com>, Waiman Long <longman@redhat.com>, 
	kasan-dev@googlegroups.com, linux-crypto@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, linux-sparse@vger.kernel.org, 
	llvm@lists.linux.dev, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Mark functions that conditionally acquire the passed lock.

Signed-off-by: Marco Elver <elver@google.com>
---
 include/linux/kref.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/kref.h b/include/linux/kref.h
index 88e82ab1367c..9bc6abe57572 100644
--- a/include/linux/kref.h
+++ b/include/linux/kref.h
@@ -81,6 +81,7 @@ static inline int kref_put(struct kref *kref, void (*release)(struct kref *kref)
 static inline int kref_put_mutex(struct kref *kref,
 				 void (*release)(struct kref *kref),
 				 struct mutex *mutex)
+	__cond_acquires(true, mutex)
 {
 	if (refcount_dec_and_mutex_lock(&kref->refcount, mutex)) {
 		release(kref);
@@ -102,6 +103,7 @@ static inline int kref_put_mutex(struct kref *kref,
 static inline int kref_put_lock(struct kref *kref,
 				void (*release)(struct kref *kref),
 				spinlock_t *lock)
+	__cond_acquires(true, lock)
 {
 	if (refcount_dec_and_lock(&kref->refcount, lock)) {
 		release(kref);
-- 
2.51.0.384.g4c02a37b29-goog

