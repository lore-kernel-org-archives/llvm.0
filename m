Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D27F3624CA
	for <llvm@lists.linux.dev>; Thu, 20 Nov 2025 15:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763651599; cv=none; b=grq3icythJjaEee9wE/46BQLxyROI8iR3XsRWQ/pDUL6EeYoX8TyHddGv0S3lHtBc4c/3hpRWPQfDwc4ATpdRZuvQMKoKzBHMD9gZ7p2S7g3CUZPOCl8UANIXBu+r/tEyqUXwqnZ0kwD/D4AwZsCAuh2CJdp+ozVBVTHBw6tDe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763651599; c=relaxed/simple;
	bh=sAXWpweCk1HKaMB/YWFmccYNlA1uAb5802MTkRNhnIk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SVdwTOhzSgIEgrpcNdiNXZZk3+8D+9UqH14ymByuyXDEMKriHoHjLaOUfmkQLyhoxv0sHx4Vu208R4bFpnNMjIDtTjKjz5+v1qN/o3YF7AZ7IP0N6D0KlS0CeAk+sVCVEM4yBaBARFIjmt62AVPbNNtBvoK1mhZTrodYT/D9vpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dXcIIXo9; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dXcIIXo9"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4775e00b16fso6917705e9.2
        for <llvm@lists.linux.dev>; Thu, 20 Nov 2025 07:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763651592; x=1764256392; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=P8aLbx9Sl47RYxftyEseQjhVT7SfF+KyN6wsDyYV/tA=;
        b=dXcIIXo9kPtP45KUBfQ2itLKmt7RDcr+xd3B3Tv0PNk7lhoaGazLPLsS92mepCOJAm
         gqwM58MbBMw5S1JgjuOkGgeAjLHa/4RK71uXfIce1Rzx0MnAk5KGVir4zEOwh0Uvw7hz
         ahFLjvJvJnlqzYXi67hgn9VlC383W1Vwk8IIuuP3tS4tHagp8TPZXq4IBWoMmsG+CcI6
         rVbH5qIU5JGusWqS6DX3wae9xYpwiuUZaAxfJkJ+5XThCKwmrIXWr5tIpwKADkVjK9dG
         iGCavB6QmGxP3juDC6cFJ9lUElqFrvkDAYkl7pngs21ynnj7VrYAe6q/4FnfuMqiY9WR
         TnRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763651592; x=1764256392;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P8aLbx9Sl47RYxftyEseQjhVT7SfF+KyN6wsDyYV/tA=;
        b=bPf4EHLh5pp2Ufs/IpafPIXIUNTSAJEr5xPip3NsYmUIcck2PGBm1QfrsLpLU69oAs
         YcSr1/TEJ77H1Xq6mSM2YFKFVJ/Z5Dim/3/NRIE18z4Tk+UZ2oijsi+ZAbzTjhazqSD1
         6D2My/Vwhuo8zFfhAL55XgC4BFh95f3s6Mx57bIDsyBzb3lbQuuhaZE6+Iv6FFmqieaW
         tdeyfKR7HTtqtuDRlTID6PsRMYucsheYu33coL8NrBr06posyp37/5s6Twqcys2AmvjS
         yj76OTnwrzKv6gAeY2G4JYd0AG+UUnn6kNUym3X1yAlH6ZcWazyPkhwUUJ/Nqqeoy0w+
         NAIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyJJszOnIKsi6eeS5a0CiTS8dWEZJf79NTQ6cAshosBn8So4breRM0nN6IS89jWCYdmFPN@lists.linux.dev
X-Gm-Message-State: AOJu0Yxive9bMZ9AbmvaGCcdthPyA5snWU7zVQxQuOptMT9Wdr49lHrr
	ZdoSrkJLKHpeX1l13h3v0UAjrxOsgFZ+vO/1o/Zk5MnsM0BTs386dP0gzGkMJ14HyJOT6CxiQei
	RJQ==
X-Google-Smtp-Source: AGHT+IFjAbTy0j0ap6YuUuYLwX6mC93Q/ee200zfIzNbmIifUkyrBIOtI3LFwq1L7M4ens6voO/IZCXXTQ==
X-Received: from wmco22.prod.google.com ([2002:a05:600c:a316:b0:477:b15:2ccc])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1987:b0:45d:d97c:236c
 with SMTP id 5b1f17b1804b1-477b8a8a5damr33384125e9.21.1763651592065; Thu, 20
 Nov 2025 07:13:12 -0800 (PST)
Date: Thu, 20 Nov 2025 16:09:46 +0100
In-Reply-To: <20251120151033.3840508-7-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251120145835.3833031-2-elver@google.com> <20251120151033.3840508-7-elver@google.com>
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
Message-ID: <20251120151033.3840508-22-elver@google.com>
Subject: [PATCH v4 21/35] debugfs: Make debugfs_cancellation a context guard struct
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

When compiling include/linux/debugfs.h with CONTEXT_ANALYSIS enabled, we
can see this error:

./include/linux/debugfs.h:239:17: error: use of undeclared identifier 'cancellation'
  239 | void __acquires(cancellation)

Move the __acquires(..) attribute after the declaration, so that the
compiler can see the cancellation function argument, as well as making
struct debugfs_cancellation a real context guard to benefit from Clang's
context analysis.

Signed-off-by: Marco Elver <elver@google.com>
---
v4:
* Rename capability -> context analysis.
---
 include/linux/debugfs.h | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/include/linux/debugfs.h b/include/linux/debugfs.h
index 7cecda29447e..43f49bfc9e25 100644
--- a/include/linux/debugfs.h
+++ b/include/linux/debugfs.h
@@ -239,18 +239,16 @@ ssize_t debugfs_read_file_str(struct file *file, char __user *user_buf,
  * @cancel: callback to call
  * @cancel_data: extra data for the callback to call
  */
-struct debugfs_cancellation {
+context_guard_struct(debugfs_cancellation) {
 	struct list_head list;
 	void (*cancel)(struct dentry *, void *);
 	void *cancel_data;
 };
 
-void __acquires(cancellation)
-debugfs_enter_cancellation(struct file *file,
-			   struct debugfs_cancellation *cancellation);
-void __releases(cancellation)
-debugfs_leave_cancellation(struct file *file,
-			   struct debugfs_cancellation *cancellation);
+void debugfs_enter_cancellation(struct file *file,
+				struct debugfs_cancellation *cancellation) __acquires(cancellation);
+void debugfs_leave_cancellation(struct file *file,
+				struct debugfs_cancellation *cancellation) __releases(cancellation);
 
 #else
 
-- 
2.52.0.rc1.455.g30608eb744-goog

