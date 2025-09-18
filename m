Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412CF30DD2E
	for <llvm@lists.linux.dev>; Thu, 18 Sep 2025 14:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758204350; cv=none; b=ND+D71u03UnDn3lM7UcEXeOi+wsNdmAw28ek/3IMKXYfK3CU92Ehzw6aJq4YNGHy+Ws9BeOPNN03jlDo7nkJEcLJpXd1VHlXHzaowwK+O+OwwR+UJlgCycelEvZiRXjXO+UOIFNs6CwEmXAfk4VA+TRmQmvV+huvQUObYhGi850=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758204350; c=relaxed/simple;
	bh=GUCT3hVcQ4xcGERZZKRbfZAspfWfY7UoHqQT+IPHxCk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=R418AskOIiFXzMYf8RMxPkz+KOKIr7R1og09O9b+OeLUtUwKawuO0KxTCvwO4szrXKQwehBOVde56ndgBePTtG6QUCafsx6Msn0Tgnf7fih84pJPjW1/O2+Djxh5bZceiF1dtA8CnB7lMVBjjjpIn9iADpiBUrNEJbGC1HDbJLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ecvNXaok; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ecvNXaok"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-45b986a7b8aso5464005e9.0
        for <llvm@lists.linux.dev>; Thu, 18 Sep 2025 07:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758204346; x=1758809146; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y8a5df3Pjl9f6q04E+YVKjYiENmaUJ17VWF4NqYxrig=;
        b=ecvNXaokGE8/91JqWPaqrBi4pRBiB5toqMzbttBPX3YnN55G1O/gWJbViR+q+E3ZsW
         JXKYTqFqvLygfEN3Bi1t4buWd7Wwlx4gsISRK3JjUrdDJ6fJE15/6O5sCLICW1e89E2f
         SabGvJNaXq0wrAxqrSmBMgrDr3SgfFKHRLBFTp+FJgIdQBHc1fpi4/jBiQ7h+tckVhtl
         cXdm21G6mCMDjMaK/pj0U6Nwuvy5HaLhBgsDnDJk2SyQSq5OCQCedQfkX9VkH8uYoYEi
         hdUwDiJHlRQs773bBCEW0WEsvVkri25WSbMpIY6FH7LnOAKW9Kvjp2QZ71IRWVCXyM9t
         Hz6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758204346; x=1758809146;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y8a5df3Pjl9f6q04E+YVKjYiENmaUJ17VWF4NqYxrig=;
        b=qUxU0GuRSeiX5Wau4VK5R6vcru8n3mBe97qkRsJtlwnVOeaeDEXei+zFDVnCr7nOkW
         TOqQ2l6irttXIW6d/+1rvAyzesqCmqOY/Kwdhl4lkPenKN+6cfinjB1OF8kp8ZvgNw2Y
         VWI2P4FRXBGirSb7WT++rrk9Ust023ihzlTbhWNL/V3jq4Z0EfkJsBsilAOV0MaUzgss
         R5hYDejLg6u6khK77+CVtqpwQYsoEpSwAVe/CAJTpiMWaybN+UGQcg7j0o9GNWBwi51a
         ugUfQ/+5lWxHMpP7+zjpkz5dIZBBgOjyFhuTFyNpfoM8nRZIX2+51REugWTksFG6RK62
         zTnQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4FdVigZFETHRHQkkUrMC2EufQmOgpbtILWmB6kG5uKcFUr/Dkt2rY2ZZv98jhxEroTe5q@lists.linux.dev
X-Gm-Message-State: AOJu0YwzpQYAhX91AhHeJNTswmyUkBS0CU0J8kQ1+H+ugOGcdcHR0qVy
	nU3rXXrqg2IIwAnIubgaXqpER/bogcM7LJQeEXaogp47Kwdn6n2/fWcdQY27iPEaZDIMl2A5Gop
	LZw==
X-Google-Smtp-Source: AGHT+IFEiq4FEWWIzjiYKjnsdpYfxFd6yNadJ6YvqxXYjoCzs/skSdmVV05LRZuP59mbBWsmDTBBrQoRCA==
X-Received: from wmbdv20.prod.google.com ([2002:a05:600c:6214:b0:458:bdde:5c9b])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:314e:b0:45d:f7e4:8969
 with SMTP id 5b1f17b1804b1-46202bf788fmr56586255e9.4.1758204345502; Thu, 18
 Sep 2025 07:05:45 -0700 (PDT)
Date: Thu, 18 Sep 2025 15:59:18 +0200
In-Reply-To: <20250918140451.1289454-1-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250918140451.1289454-1-elver@google.com>
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
Message-ID: <20250918140451.1289454-8-elver@google.com>
Subject: [PATCH v3 07/35] lockdep: Annotate lockdep assertions for capability analysis
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

Clang's capability analysis can be made aware of functions that assert
that capabilities/locks are held.

Presence of these annotations causes the analysis to assume the
capability is held after calls to the annotated function, and avoid
false positives with complex control-flow; for example, where not all
control-flow paths in a function require a held lock, and therefore
marking the function with __must_hold(..) is inappropriate.

Signed-off-by: Marco Elver <elver@google.com>
---
v3:
* __assert -> __assume rename
---
 include/linux/lockdep.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/linux/lockdep.h b/include/linux/lockdep.h
index 67964dc4db95..11b3d22555ff 100644
--- a/include/linux/lockdep.h
+++ b/include/linux/lockdep.h
@@ -282,16 +282,16 @@ extern void lock_unpin_lock(struct lockdep_map *lock, struct pin_cookie);
 	do { WARN_ON_ONCE(debug_locks && !(cond)); } while (0)
 
 #define lockdep_assert_held(l)		\
-	lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
+	do { lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD); __assume_cap(l); } while (0)
 
 #define lockdep_assert_not_held(l)	\
 	lockdep_assert(lockdep_is_held(l) != LOCK_STATE_HELD)
 
 #define lockdep_assert_held_write(l)	\
-	lockdep_assert(lockdep_is_held_type(l, 0))
+	do { lockdep_assert(lockdep_is_held_type(l, 0)); __assume_cap(l); } while (0)
 
 #define lockdep_assert_held_read(l)	\
-	lockdep_assert(lockdep_is_held_type(l, 1))
+	do { lockdep_assert(lockdep_is_held_type(l, 1)); __assume_shared_cap(l); } while (0)
 
 #define lockdep_assert_held_once(l)		\
 	lockdep_assert_once(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
@@ -389,10 +389,10 @@ extern int lockdep_is_held(const void *);
 #define lockdep_assert(c)			do { } while (0)
 #define lockdep_assert_once(c)			do { } while (0)
 
-#define lockdep_assert_held(l)			do { (void)(l); } while (0)
+#define lockdep_assert_held(l)			__assume_cap(l)
 #define lockdep_assert_not_held(l)		do { (void)(l); } while (0)
-#define lockdep_assert_held_write(l)		do { (void)(l); } while (0)
-#define lockdep_assert_held_read(l)		do { (void)(l); } while (0)
+#define lockdep_assert_held_write(l)		__assume_cap(l)
+#define lockdep_assert_held_read(l)		__assume_shared_cap(l)
 #define lockdep_assert_held_once(l)		do { (void)(l); } while (0)
 #define lockdep_assert_none_held_once()	do { } while (0)
 
-- 
2.51.0.384.g4c02a37b29-goog

