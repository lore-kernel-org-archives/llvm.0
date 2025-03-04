Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C31205E1A
	for <llvm@lists.linux.dev>; Tue,  4 Mar 2025 09:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741080393; cv=none; b=NsBU4E3VjnzNeiHkwdRsu1nE+SIl5dpwVl5FH8X1CivFZZiiB5JHdtq47I8cr2L96mkBmh+ALMNvJEcpD9SZu9icfOm690akzCihASprCg1dbGHdjDaHI88WLHxscY/yyqpFPVNQcVeiAmriaocu0EJFOkUKssg5EYmlyWebYQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741080393; c=relaxed/simple;
	bh=KT6MN7tzMPolkJ3RDT2fCUl9mndACbg8ns1Ks1oaR0I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bsYGpGn0ijXrt6B3oVf5PNyui6PUlUEC26ovxeG0NVPW9MdxRy7J2QQABuQc5TagekZHhEnfLSDqI3svyTg7W+/xG8lCRvoTqwDL9IGspIhcCVJ7CuhJ1KwyU+7d8r6nzI60fDujp/M75hkDyZGCKTewzp2SUo8PHIzC1Zoh6FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OcsH/t1c; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OcsH/t1c"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-5e4c261813bso6935737a12.0
        for <llvm@lists.linux.dev>; Tue, 04 Mar 2025 01:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741080390; x=1741685190; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KzDuuuaiZX8v73IeozPshNFzU/FhGyeu9jS8KRsuYgk=;
        b=OcsH/t1cAo83UvJW77/7soLqC/vcIH06g1kB5M7eOc6iJqODUtHw75ADydYB7aRHCs
         03RjpQYjJQ7diZwvQxPWBFb4wQzvCnVP3NmpYQLa7woucsJ+eCmZ/7l4puemHk3as/95
         MLALE5PvMLG+l3QSN0yGVo3nozC+uwV8zctbLOwr4xXN4Qa53KJMwoLV8Ixqh/nD+LgA
         OqaVN8FWx2px0FMYhqmpjbTum299ghlhcyqjnnAUT5Si7x9jSHwixCHsZYehnDRMzjnw
         wpcgMuMrB16S26KRE+rANdtkJ5Khq0+BU02Sgw4j7snvauMwdlR2IsfS0m4q7xrBb2IK
         YFeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741080390; x=1741685190;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KzDuuuaiZX8v73IeozPshNFzU/FhGyeu9jS8KRsuYgk=;
        b=iDe5y/B1YFHHQ9FM/3JYRig7w2khoMut5k6dmXSPKzkfSA2iiXcMQewMPR1cUs3n2V
         u3toOecET0CgWrtTm1TSm42N2qUsIXibxNPlwXVVKTHnMeoD8qeSejKklL1xU/e9VIQb
         rVzgkO/LAqB3aljRkSPblj8I7ARasnZPt3We+D8CCRn5AvQnF89DZKGHjSCnRB36UEZG
         QI4cPHfoJerfwJ1BqagK6sNwxzJEuQqBuQSF8OslsT9mg7GrbXTMaTEpaW39R7UclHZ6
         DN1LFeFWRsGFhkhtzOjLGDxAkT8qTQVGn6RL81+MVAE/zovkjP3ytvxxkv/gA/lY6bdH
         cipQ==
X-Forwarded-Encrypted: i=1; AJvYcCVy3xV0rgst+WUaTa4C6AgJIXW9OkzJfL0K9QGwTroNnEzkX793RV/wTzX1Hhod0xhE0TTj@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1QwuYBgDKV7BH/AmYrMz6GgXqZfVY9723F8eaPHeP0dHVQDaR
	RIVDE5R5LCtgs0/oRPrRDM02Xpb4XoAp05aSOBu7NZdUNcfPQJ5bxU3KQrrG8FE7qXdY+YflRw=
	=
X-Google-Smtp-Source: AGHT+IH5l4jKYamySNyxcMXL4HKAIJ9GmtnPKrLPWykOQYXwmzxoLHo5g+W6i+hA1eMCWubxfVXujxm01Q==
X-Received: from edbev11.prod.google.com ([2002:a05:6402:540b:b0:5e5:cbc:4d2c])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:541b:b0:5de:4b81:d3fd
 with SMTP id 4fb4d7f45d1cf-5e4d6afa126mr17250877a12.13.1741080390194; Tue, 04
 Mar 2025 01:26:30 -0800 (PST)
Date: Tue,  4 Mar 2025 10:21:29 +0100
In-Reply-To: <20250304092417.2873893-1-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250304092417.2873893-1-elver@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250304092417.2873893-31-elver@google.com>
Subject: [PATCH v2 30/34] printk: Move locking annotation to printk.c
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

With Sparse support gone, Clang is a bit more strict and warns:

./include/linux/console.h:492:50: error: use of undeclared identifier 'console_mutex'
  492 | extern void console_list_unlock(void) __releases(console_mutex);

Since it does not make sense to make console_mutex itself global, move
the annotation to printk.c. Capability analysis remains disabled for
printk.c.

This is needed to enable capability analysis for modules that include
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
index eba367bf605d..51d2be96514a 100644
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
index 07668433644b..377f21fd9bb4 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -244,6 +244,7 @@ int devkmsg_sysctl_set_loglvl(const struct ctl_table *table, int write,
  * For console list or console->flags updates
  */
 void console_list_lock(void)
+	__acquires(&console_mutex)
 {
 	/*
 	 * In unregister_console() and console_force_preferred_locked(),
@@ -268,6 +269,7 @@ EXPORT_SYMBOL(console_list_lock);
  * Counterpart to console_list_lock()
  */
 void console_list_unlock(void)
+	__releases(&console_mutex)
 {
 	mutex_unlock(&console_mutex);
 }
-- 
2.48.1.711.g2feabab25a-goog

