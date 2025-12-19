Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A133491F1
	for <llvm@lists.linux.dev>; Fri, 19 Dec 2025 15:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766159192; cv=none; b=RnWag59FCx7gkG5WSy5x8CXhiWm3VgL/YTbkWNyHusQOjYsqxvN1zyVWCb/agqoTTJTolw+An/gmuv8d6SMQjFmlIj8sH1ku/fgBYBAiZlmSI3+e2JtXFTODiEYUer/Adp5DX2ymcMKAsOoaqsVa6Daf9J9cphOg7wnqImzW918=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766159192; c=relaxed/simple;
	bh=+TxyiziKtAssraZX/W9BG58Rc5SRTSVNFHhEJgAI80M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Yc0rK0deRYlRZjfl77B3nN9/6OBm8pFg0C7Zp/w+/V55Nn5A7QAobRgegPG3mDNh4EZcqWYsQ1A4J3au7RyUKVkP/CB38I9iK/ENJsLQAu40HLF81IdiOm4a9So/t8V/rCQx5vKTRsFo+IEjswARSN8sqCdpKNOVwBGrzZq9yww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RotkcEME; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RotkcEME"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-477b8a667bcso23230895e9.2
        for <llvm@lists.linux.dev>; Fri, 19 Dec 2025 07:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766159189; x=1766763989; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=JNejWFdtMyTjodgPbCP3MYwy/kg9I0zeQniFTuJdWnY=;
        b=RotkcEMEK5YtZBE2zVK9wka4BDjh4GkCjX3/+apytXHfZNKtEJFzFoHMFyVsK9YCoU
         4IYPIBFuNY8shNQOUjfnZidhsU5HSRa8WQ1LmB88d9H9v+ANzvcq6T66l/emeYSGqC+f
         IRQfX1UOe3aNKg4ezKrmGbaJsHsfuEkB3PtkJ57iL5/mc01hYQKqF8VZQoXUsr/wvjTu
         fX2iOO6DFJhwkVXrPJZCpx2kveUeJwWBl9M8jMfGWYfQBXyX8sf8wAw+BzQD4qVvpzz3
         Tl2G/4t1I6DN8+5EN22aw+JrmQBWNKMBY8RUNu/RJkqzot0a6pwhPtW+XFSK25EtfJzQ
         wP1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766159189; x=1766763989;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JNejWFdtMyTjodgPbCP3MYwy/kg9I0zeQniFTuJdWnY=;
        b=MspqZgcxjPQKuw+nx8ohrCxGp/wKEUN3weFFaRPyBZAgFs9WOqIw0SIi019Ot3A8C8
         5mDo3gbZwQfBhyHWusiY58IlqvvBPzaO2lpnUWC/+unQZ6ewcoTvnwEkmWfEDPgj5dBd
         GXvFPKoCnfBD0NMNnBeDopvegmu5k1eSRhxiUM7w6EVPHGZ8aGw/xVYFmjasGW343xXI
         /f1eGM/0Y6ITdVB/ZD/+Wc2RVNVqBH1aogJoEeL1fbu9VeyiXP6P4qEgPufC0tev4YP/
         yAgH62NKrFvVfv0NLh+DPMRtxgCypfGklD21bS2796RJwcipFpPzUBSiV9rft7ov5ZAH
         +sUw==
X-Forwarded-Encrypted: i=1; AJvYcCXyb1PVNhNedb0mufE3djhkz8VExEVaqzUvRDVUIbSjXId8IEF6f4SBqtlz6OWjFM0xWeFv@lists.linux.dev
X-Gm-Message-State: AOJu0YxqmUmkLyKTBqWaE4n9OKTEtLM1IfimcPXjzxRSDn2o/pEneTwt
	8UucmdI3HVzDxX+GLRrpHxDHVU1Ba8x2xd9PjBboh78v8FJNeX6cVFprWJcNTp9+0oztYSnjw5c
	Seg==
X-Google-Smtp-Source: AGHT+IFZPg350on31b7Arj7YO65031V0YGnmFoBhddxYq3gtipYJLlSpx9LZ4+YgVEePmezOZITENNcOhw==
X-Received: from wmbdr22.prod.google.com ([2002:a05:600c:6096:b0:477:7949:c534])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:820d:b0:479:3a87:208f
 with SMTP id 5b1f17b1804b1-47d195aa085mr30273655e9.36.1766159188650; Fri, 19
 Dec 2025 07:46:28 -0800 (PST)
Date: Fri, 19 Dec 2025 16:40:05 +0100
In-Reply-To: <20251219154418.3592607-1-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251219154418.3592607-1-elver@google.com>
X-Mailer: git-send-email 2.52.0.322.g1dd061c0dc-goog
Message-ID: <20251219154418.3592607-17-elver@google.com>
Subject: [PATCH v5 16/36] kref: Add context-analysis annotations
From: Marco Elver <elver@google.com>
To: elver@google.com, Peter Zijlstra <peterz@infradead.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	Chris Li <sparse@chrisli.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Alexander Potapenko <glider@google.com>, Arnd Bergmann <arnd@arndb.de>, Bart Van Assche <bvanassche@acm.org>, 
	Christoph Hellwig <hch@lst.de>, Dmitry Vyukov <dvyukov@google.com>, Eric Dumazet <edumazet@google.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Ian Rogers <irogers@google.com>, 
	Jann Horn <jannh@google.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Johannes Berg <johannes.berg@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Triplett <josh@joshtriplett.org>, Justin Stitt <justinstitt@google.com>, 
	Kees Cook <kees@kernel.org>, Kentaro Takeda <takedakn@nttdata.co.jp>, 
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, Mark Rutland <mark.rutland@arm.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>, Thomas Gleixner <tglx@linutronix.de>, 
	Thomas Graf <tgraf@suug.ch>, Uladzislau Rezki <urezki@gmail.com>, Waiman Long <longman@redhat.com>, 
	kasan-dev@googlegroups.com, linux-crypto@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, linux-sparse@vger.kernel.org, 
	linux-wireless@vger.kernel.org, llvm@lists.linux.dev, rcu@vger.kernel.org
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
2.52.0.322.g1dd061c0dc-goog

