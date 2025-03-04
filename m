Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD1F2045A2
	for <llvm@lists.linux.dev>; Tue,  4 Mar 2025 09:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741080369; cv=none; b=C3tLjFWxFgsbIDfrY2MLK9UYZjPGTS5sUZ/tfMGc58kTmPoPASgxW30eoZsXMdIwWCqD47AbUbHJdF1Cp+yg2EaU749zT+MnHd/knXzxUEdeIj3VnfMZx3IESvGBsYMChS7nU+FyTAaizyh2hrMOyjVakCFa7c0yxzvddZs66ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741080369; c=relaxed/simple;
	bh=X1ktC5ZjhhR5WSX79RqJwEmztNg59gjqNnHaZ1eRNbI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZMamePamrp8Ko+cs7pDxQ3QLHHT1P1dv5Fgl1yiMvZkIWXka/88CUGV1O15ugZSxQwWGWXfZVAfDKmqRiaAWdDqoxRS97qnCgeK5M4DhioCaHSTsU54KfktfARX1J3P9ryks9gPIbJYVS2KOkAgLjDBGD9CB0e3JtSGaCc8PQ98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4bvRbwTW; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4bvRbwTW"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-5e4b3da6b49so5228180a12.2
        for <llvm@lists.linux.dev>; Tue, 04 Mar 2025 01:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741080366; x=1741685166; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ljSfvhYh8x6xwHsInA1Gu+wF89bLF/D0O2qs3l3oGhs=;
        b=4bvRbwTWXvlGV+sUUrPYqPl+lFeSFYEi9ZOe6vZXG2ARioQA8Z+27WwWnl1H+tq3eZ
         8RHusLogvRXlH1RmBLgg+QRtUItWd8lrwxe85Fljzt72MlLJF8jwJaS5DEXyyjqFW88b
         dT6RU6q3Ab+xkIN1W/HaRqaw9FWjkTsDO4M7LvtUYvnoAyJqOuHDf/udpJor7qh131B9
         r0JDhR0RYgFQrlbjSXfsh0eyZTocBNi72h8clHjYwugOqYxnkK9IXWZPlTh/rOtLGmlC
         /t978qlg3wSs2ASHMEHR1blowkiuLWNWDQZCdowTRDbGnhSvCVYGBk9iQ7VLoWnXrlMV
         UkMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741080366; x=1741685166;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ljSfvhYh8x6xwHsInA1Gu+wF89bLF/D0O2qs3l3oGhs=;
        b=sOGxSOC0SszE+UEiAwGaoBN5EynWp45mZpJcj2xnVCh22aYVGfhkFUIjH7mn5qcjso
         yGOrDMVAD56G0YKKjRlREuoob1T9dn/J3AKSh5vH5wPXo6dWjSM+pndq8v/9EbMat/ml
         GHwfkaq97HXAhKX3zk1KN7iU8CMlaOzEf6DR+KM9l0iYZoc4Lquq0T1SY1UPTdhCQ4x6
         8lJol0ACKL/ca7yVE20tTyUWPFSrA5lFTHvjL/j/qtZIK29HkjVSD9Ub2AdPvUK77jHq
         OG3lEuIMqT3BkC7Cu2W2j3FBqO+HjfJTsh+VMs+0eFKQrPRrLJxzyG2cShWPvtNIbDRM
         6p6g==
X-Forwarded-Encrypted: i=1; AJvYcCW6wgxmA9FxAwSu4tkiqG1YhDDIaqEc4dkFwQkP2XiWVWzeiZngcgwISdni7rUl0cNtUuyu@lists.linux.dev
X-Gm-Message-State: AOJu0YxsxNZ9KInRtlmds09OZ4sW21TIzKbgEWU31GWVEcG5afETwccr
	IRlHg+N4pd48U+5Es+eMEDJ+cdrwWBV7PTPQMBJgahsZ91qGqwbKHuMjGr2rjDtGEiCeySwBWg=
	=
X-Google-Smtp-Source: AGHT+IFrMBW+OhCnT9icBam/s/vk6OKWe4X42OWK7ynSC2VTQQKw5GLkAoEuFIfZ1S6J7yhnX5gf47Hang==
X-Received: from edbij24.prod.google.com ([2002:a05:6402:1598:b0:5de:504d:836a])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:234e:b0:5dc:80ba:dda1
 with SMTP id 4fb4d7f45d1cf-5e4d6ad7afcmr43438170a12.9.1741080366105; Tue, 04
 Mar 2025 01:26:06 -0800 (PST)
Date: Tue,  4 Mar 2025 10:21:20 +0100
In-Reply-To: <20250304092417.2873893-1-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250304092417.2873893-1-elver@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250304092417.2873893-22-elver@google.com>
Subject: [PATCH v2 21/34] debugfs: Make debugfs_cancellation a capability struct
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
2.48.1.711.g2feabab25a-goog

