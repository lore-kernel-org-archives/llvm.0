Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1A9202984
	for <llvm@lists.linux.dev>; Tue,  4 Mar 2025 09:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741080355; cv=none; b=R7SyLowZZKFqUZGH+xa0vQ/9TGIm0u1eYhqJvBD0prjIroka3ulqgfjzT7pPmvlztFnc6m8l90aYaIaTA1pSW0FQv7Je8++3J3kkreQUJYt0WURrHbA9m3grGYlAysYz4QH9CLCU3rfyLdwUn3czb8DikZ0SojFZTavLXHHi9mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741080355; c=relaxed/simple;
	bh=PiALtBw0DYxsKuBO8J1H1AaY1cU3EmQ3QqFWUaJ2ULI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=frkJgB2+mr6Ox7/K6HAwRquKTbYueI+XjUdUXfy2jexhTzEpIUVjFZfsT3Rf0Hnhgv+q2f5FSd6pSdtOp74HaZOeyyZqRsA6yKQ7Lr8+MJALqPdrhGPQdLqNvAy6r4I4WYDpv3ze6ZnsXtm8OLuQ/SoTmW8YFRBgsKWCLdAgIF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XmG4SLoz; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XmG4SLoz"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4394c747c72so21150675e9.1
        for <llvm@lists.linux.dev>; Tue, 04 Mar 2025 01:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741080352; x=1741685152; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cDlOE/N8Ae1M5H+4yLEwuBDz/LRLExYZEp/cosJZ8Bg=;
        b=XmG4SLoz2alXAlhCqEaB97q8PyJ3V1OjiRLQ3C6YtQQxa1/YCmBQibY15YfhhBQNtw
         RdIRTfEbvYvPJsBV+NqcufF1IzW3PDQ06JXEoLG1ceMhyMRZ3bX4y230ic7QrEOgtY7d
         OJRSwSExZbqYbh6Ir0jy1YTeZd5rHOIi8hP2AATQsmWwdHXLC7HuC7TGthpmvW/jvf6U
         nTPCwpIPF2Q5ZjzfSMcwJYsdAEPjLLQPUCHniGG7NNXgOhH9fmzQQ338MA0scCURXIDN
         Fdxi0dY3Q96VsUSuFueUkYdzTIKowQXo0Uk2pbAnnxBMbN8fK5VJ2FD5kewyQAJxBDoE
         DDqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741080352; x=1741685152;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cDlOE/N8Ae1M5H+4yLEwuBDz/LRLExYZEp/cosJZ8Bg=;
        b=D/248H9o055jRIHTs9KNFqlq8SlCKC3W/iWr/r9zLqJ1Ahkci0gr5Rcdv1ygM/bKHW
         fTUeWSzW2r0z++1DVzKjjmM294qBSpFxsKGihHb/6Ld8JIpJDoa1u4JyFBMNY0xp7yF5
         LSSIiWs8UzF4PHsykeNKpLKgOT9skmnHFUzzoRWtAKPwxFWw89mbgGJqFPMhsWb8y2eD
         OOJ8mPjHX0so97+Hc0ziX0ho8NpNV9jlxViFi6jSY62hEqGgvi0U1njyPXDB/ErO7sdv
         zGpD8yYgeRCMAV4CpSxsoy9kqx/IiS6LBTJ+Va7gkkg1L7NWIILXKAqz5FdC+oybLdy0
         iuzg==
X-Forwarded-Encrypted: i=1; AJvYcCVzlBZUkMaC0sPJXrId36qrJikRzT0WF3SRyfbO1IWOIqIfGAlh4dqDUS59r2cd+07pfTfr@lists.linux.dev
X-Gm-Message-State: AOJu0Yyy+piE9MHzYFL2epM3PwdN3pEgqzwmV2Nt9cHTqJi7svjUKTsW
	pu/xXNCVYC40WnEVRXe7kfTSvLFpbd/NYXZc7XCtFmAz4msS+d7hMkN8E8jdi4ifezDxFCH08A=
	=
X-Google-Smtp-Source: AGHT+IHedqiVSmrcvr28lGY8V3DB1o4f03/YwjOgy/3VYsVwJNq1WARMZql7ViymW31VHT1lz95raXYaUw==
X-Received: from wmqa13.prod.google.com ([2002:a05:600c:348d:b0:439:64f9:d801])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:190a:b0:434:a4b3:5ebe
 with SMTP id 5b1f17b1804b1-43ba675830emr110121215e9.24.1741080352374; Tue, 04
 Mar 2025 01:25:52 -0800 (PST)
Date: Tue,  4 Mar 2025 10:21:15 +0100
In-Reply-To: <20250304092417.2873893-1-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250304092417.2873893-1-elver@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250304092417.2873893-17-elver@google.com>
Subject: [PATCH v2 16/34] kref: Add capability-analysis annotations
From: Marco Elver <elver@google.com>
To: elver@google.com
Cc: "David S. Miller" <davem@davemloft.net>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Alexander Potapenko <glider@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	Bart Van Assche <bvanassche@acm.org>, Bill Wendling <morbo@google.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Eric Dumazet <edumazet@google.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Ingo Molnar <mingo@kernel.org>, 
	Jann Horn <jannh@google.com>, Jiri Slaby <jirislaby@kernel.org>, 
	Joel Fernandes <joel@joelfernandes.org>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Triplett <josh@joshtriplett.org>, Justin Stitt <justinstitt@google.com>, 
	Kees Cook <kees@kernel.org>, Kentaro Takeda <takedakn@nttdata.co.jp>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>, 
	Thomas Gleixner <tglx@linutronix.de>, Uladzislau Rezki <urezki@gmail.com>, Waiman Long <longman@redhat.com>, 
	Will Deacon <will@kernel.org>, kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, rcu@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-serial@vger.kernel.org
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
2.48.1.711.g2feabab25a-goog

