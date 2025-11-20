Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1EA835CBB4
	for <llvm@lists.linux.dev>; Thu, 20 Nov 2025 15:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763651662; cv=none; b=m8aOc7Te2IqQzjIjDjtw68o0N3fr2Lro8jrqqenuhdCQ9nrSCHkOu+zisxIbSODJN/R8L5ENzqqMYTyQJB4MuBzH4t8Eocv4YS/XPseTHm29PWQvdimcUejCpxrpDxAN8BJRuPt1xIqIUL+sAC1UUeLkAg+6Ef7Zk21oHUmdp+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763651662; c=relaxed/simple;
	bh=JghkiwHvBvL6JcsywiEEh15XJk0LP4WSUGT+cTqq5kc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=N0y2Q7h+RUsUVGFEtK6WNbxZdyS0xZbiZDPAoqQjRXHP1rJ6OZsV2mS59kZkYcGytsEnOS92BM5Jx3Mo53k7pBa7Q/3arctVa9h+7IXOmu64I3Sbq4IwTTSQ4ZpMYV37mOlGYwvgXtxlAfYh/rOJbRWxeq52lFgCy4QJ2GWPLoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OgU8sMhA; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OgU8sMhA"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-47106720618so9428065e9.1
        for <llvm@lists.linux.dev>; Thu, 20 Nov 2025 07:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763651635; x=1764256435; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Im5hsj1DltxV90KwIidFCTn0DS8FZncDFP7kTqaMpC0=;
        b=OgU8sMhAkOTeyQyDVY5VIMSTIzmgPq5py407duDi7ciMV7sCUZ8lqnGJ7gORV+zkUQ
         58ZT30G6d9BJJAqqdL8CpUBFPCTSweW9XYLe3/+7dM6gcmpAtqCaG1KbKcOgs2fjZQxR
         lyzT5iPhLAh49T13I5ugZtLVDQpr47BUxWddxuLto2gZuE2tHDjUopvyvS7CL4avQCxB
         C+DgUUXIyMSi+GugaZlIN5310eVZ68971LKnDMV4OabMJBAF+dCSXtAyXv9SlICqWCY5
         0egrk3IiAT7Ia5IFAZ9lq6lbtgopixYEp5830367t91AhCF3aAmp0O6ebgIGgcqQTKg4
         TbNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763651635; x=1764256435;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Im5hsj1DltxV90KwIidFCTn0DS8FZncDFP7kTqaMpC0=;
        b=DIGGy+cyFL8WsvlVdBE4dYRmpy3WosAbF6fqjekozWMz7lTpIdoUyZtfkA4GvRkw6f
         ZI2OzgBm3ft7j7NCDP5ziI53zEg1eehGi0fFjQfjNyuVtCnB7ouw6NU/1udA3bA0VZg5
         Jid4rpxggiIzaqCfpy1PLVAkmKLdvmPaIfT3ohD86zbT9649b/anolswcnp4o9kHR+lb
         jRCU6Ld3n9UefwDS/ypaoovmQ6LnmoWJt/tZz5/JCxgz0+iLfu5y4+l9CdgR79TvQAl6
         nDzXQVcNjQckXqcnobWmLoXI2iM2aUKNnzXv790lv/RcfcL1vOaxNpyC5bH85zZz2G+v
         7jlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUe99w4xwomB4GlEKmgK6VfYzlvi8+8L8JWX8Vt//HdnSF4i80OrS0A4kTOpouUEdIUuisI@lists.linux.dev
X-Gm-Message-State: AOJu0YyRpRNOF1OIJWR9ADRFLF3b+YaqU7r3xiPRco3U/x8LYj/N27J0
	Ah3t+W6eqnIZ6iy5Y9qzkrKIepqowxIO736NJGMCUB9/A+cFGYQ5TQrdNm4OvR7Q2+u55D1EAoF
	yXQ==
X-Google-Smtp-Source: AGHT+IE0txFyfqWr7t8p06ZvcBdzNhQeJVfQ06tB7yPqhvYYx4yW0lw4v6t9Cn2mD+Uk9FOLbPP2gAnnVA==
X-Received: from wmd10.prod.google.com ([2002:a05:600c:604a:b0:477:9c68:bd6])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1c1b:b0:471:c72:c7f8
 with SMTP id 5b1f17b1804b1-477b9e1cbfbmr31262875e9.21.1763651635197; Thu, 20
 Nov 2025 07:13:55 -0800 (PST)
Date: Thu, 20 Nov 2025 16:09:57 +0100
In-Reply-To: <20251120151033.3840508-7-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251120145835.3833031-2-elver@google.com> <20251120151033.3840508-7-elver@google.com>
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
Message-ID: <20251120151033.3840508-33-elver@google.com>
Subject: [PATCH v4 32/35] printk: Move locking annotation to printk.c
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

With Sparse support gone, Clang is a bit more strict and warns:

./include/linux/console.h:492:50: error: use of undeclared identifier 'console_mutex'
  492 | extern void console_list_unlock(void) __releases(console_mutex);

Since it does not make sense to make console_mutex itself global, move
the annotation to printk.c. Context analysis remains disabled for
printk.c.

This is needed to enable context analysis for modules that include
<linux/console.h>.

Signed-off-by: Marco Elver <elver@google.com>
---
v2:
* New patch.
---
 include/linux/console.h | 4 ++--
 kernel/printk/printk.c  | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/linux/console.h b/include/linux/console.h
index 031a58dc2b91..1eb3c9d9d6ae 100644
--- a/include/linux/console.h
+++ b/include/linux/console.h
@@ -488,8 +488,8 @@ static inline bool console_srcu_read_lock_is_held(void)
 extern int console_srcu_read_lock(void);
 extern void console_srcu_read_unlock(int cookie);
 
-extern void console_list_lock(void) __acquires(console_mutex);
-extern void console_list_unlock(void) __releases(console_mutex);
+extern void console_list_lock(void);
+extern void console_list_unlock(void);
 
 extern struct hlist_head console_list;
 
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 5aee9ffb16b9..7646952a92f1 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -245,6 +245,7 @@ int devkmsg_sysctl_set_loglvl(const struct ctl_table *table, int write,
  * For console list or console->flags updates
  */
 void console_list_lock(void)
+	__acquires(&console_mutex)
 {
 	/*
 	 * In unregister_console() and console_force_preferred_locked(),
@@ -269,6 +270,7 @@ EXPORT_SYMBOL(console_list_lock);
  * Counterpart to console_list_lock()
  */
 void console_list_unlock(void)
+	__releases(&console_mutex)
 {
 	mutex_unlock(&console_mutex);
 }
-- 
2.52.0.rc1.455.g30608eb744-goog

