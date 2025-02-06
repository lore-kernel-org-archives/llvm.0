Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C64214804
	for <llvm@lists.linux.dev>; Thu,  6 Feb 2025 18:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738865920; cv=none; b=qxt0DFIuTWKCfd/Lkcatcerok9vsw1lOvXCk9F2B+toXUO1qvPBY+sqIMN58T+fBicBQzq9cbZWCizlZiamptiBtEe9f3zl+CTTwkIXeSCSL9bkQe7/TlZ4ZR48i/EEJVk/afCqtJmE60jZsL14K09PKZxecZJcZhhtGWIQIQUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738865920; c=relaxed/simple;
	bh=5EVSb50dMQhWyPFGHfjsGLdP+2gDBxuAj9DD3qD/9wA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=L4ki7xS9tWxSoBh2hNmGL4iQehx/q1CQZ1N3VYs8L+n2rQzpquR5Af6VYefoPp4rqjGYnoKZ/Cdf4oluu25r5d4bI6WjVYiLbJP2efPSynpKKqXcWc4o3py1moTaTyEzIiD52iLhbKrlUmW71G2F1thLuQgKhxcTI0U4o+SCKPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pWJ4N1Jg; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pWJ4N1Jg"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-ab76f438dddso137109066b.2
        for <llvm@lists.linux.dev>; Thu, 06 Feb 2025 10:18:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738865916; x=1739470716; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Gbrljv8lkIJmai+iapf5Yd4+selXZvjO0vfpPpqYqbM=;
        b=pWJ4N1JgtS+3bdL7IHBxPmhITMqZ27KBzqhmrJH/YwMJ6atOfqdwAZOQpJKUC7RYXh
         ZfW0sXDvyrg9kxb3CLZEd26MywRqMDQzusTwgrXhrSn6KMCw0GCjMKhC6ihgRv9OAiDX
         sDlPdO7qs9G/7dRwYljDsydKq7WSLCyN1wpnNFZ512Ok/txkndrfEW4WB35boi6GR5cj
         P4O1Bb1ZzV+Ogrwe08T7pRuUv1DKUrWd17wlYJHD6Czx9arHdtniyEscpVSaC3cg3RRM
         +9w9HX9SxJtX86eeQanAEWDVW0AGVWWakk5tgtcjhLCZ6EPS/jpe3Kd65sNgoQUZ8XdA
         l12A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738865916; x=1739470716;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gbrljv8lkIJmai+iapf5Yd4+selXZvjO0vfpPpqYqbM=;
        b=dASw4obsWfkQyNmG4hNBr4+rrpiu57x6BLcOMn6mva1i06zfsNzB6No8c3YZmABsAy
         qTt5APkf2Ro8foC41i3b4E4ILSj9LFjSTOtkZfdqxsqp/avQnYfY+REC8+50nHQ/4/rx
         /fXO0Ff3FD6oejEKva9V6jhxvi6V2fRFLGzFK5AdhoDpZeSZYtJeo3+t65RkPg6anJcv
         OY5lXArR2lG8knmhAMvH0Cd6xCUvTxbEuPgiTRHLWd8QrXrTfXUTJBCFC/l1RqRu4MYn
         1BrzlPVERFXmTkM3F4lZBpd/J22Ks582tbiUHdJvH/wb6yklkSLjDGHaUGtmy1XUn70U
         EQAw==
X-Forwarded-Encrypted: i=1; AJvYcCU/5jR8MjsxlX87GstYPEB2+7HYLPBbdaEA/HeqeHRaV2j0R7Obfjkqeah9cifi+Al6bHhT@lists.linux.dev
X-Gm-Message-State: AOJu0YwER8KaqR3Gwzpa9SaspKJN9O/6eutMFm9NkGegnEWdqojdTlOu
	94oqPnPTi8vtNKQ3aebpM533lfNdBjfO0jPJ/P1WtLDQNJK3IAulSft8ezbN+f2mvWFwAufS0A=
	=
X-Google-Smtp-Source: AGHT+IG6fYjyQDhG15FL/7jfcoC1TInNHtYu+hLdicEFGjYbLL+jlfGEcskN2tLnzzmKsflIazl4pQ1juA==
X-Received: from ejcvq6.prod.google.com ([2002:a17:907:a4c6:b0:aa6:bd80:4523])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:6d1e:b0:ab2:f8e9:723c
 with SMTP id a640c23a62f3a-ab75e210266mr866257866b.5.1738865916587; Thu, 06
 Feb 2025 10:18:36 -0800 (PST)
Date: Thu,  6 Feb 2025 19:10:14 +0100
In-Reply-To: <20250206181711.1902989-1-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250206181711.1902989-1-elver@google.com>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <20250206181711.1902989-21-elver@google.com>
Subject: [PATCH RFC 20/24] debugfs: Make debugfs_cancellation a capability struct
From: Marco Elver <elver@google.com>
To: elver@google.com
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Alexander Potapenko <glider@google.com>, 
	Bart Van Assche <bvanassche@acm.org>, Bill Wendling <morbo@google.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ingo Molnar <mingo@kernel.org>, 
	Jann Horn <jannh@google.com>, Joel Fernandes <joel@joelfernandes.org>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Triplett <josh@joshtriplett.org>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Peter Zijlstra <peterz@infradead.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Uladzislau Rezki <urezki@gmail.com>, Waiman Long <longman@redhat.com>, 
	Will Deacon <will@kernel.org>, kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, rcu@vger.kernel.org, linux-crypto@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

When compiling include/linux/debugfs.h with CAPABILITY_ANALYSIS enabled,
we can see this error:

./include/linux/debugfs.h:239:17: error: use of undeclared identifier 'cancellation'
  239 | void __acquires(cancellation)

Move the __acquires(..) attribute after the declaration, so that the
compiler can see the cancellation function argument, as well as making
struct debugfs_cancellation a real capability to benefit from Clang's
capability analysis.

Signed-off-by: Marco Elver <elver@google.com>
---
 include/linux/debugfs.h | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/include/linux/debugfs.h b/include/linux/debugfs.h
index fa2568b4380d..c6a429381887 100644
--- a/include/linux/debugfs.h
+++ b/include/linux/debugfs.h
@@ -240,18 +240,16 @@ ssize_t debugfs_read_file_str(struct file *file, char __user *user_buf,
  * @cancel: callback to call
  * @cancel_data: extra data for the callback to call
  */
-struct debugfs_cancellation {
+struct_with_capability(debugfs_cancellation) {
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
2.48.1.502.g6dc24dfdaf-goog

