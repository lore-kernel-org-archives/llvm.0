Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D751F416A
	for <llvm@lists.linux.dev>; Thu,  6 Feb 2025 18:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738865902; cv=none; b=s/HAaRMCR7bc4iE82Jq5SaZArnVHXnbQ9isdXiNQlxy//x+UD+IhIWBLkluqu3QtEjWzHrh2IVPozRwC1K7XgnrpLUD7+amLoMpDAK7gP4lE44K5o8Ty6VEfUP5oGH7BFo2Bbp1MXpxg3oqvCgQ1gcRqSyLv4YoSvRHhm3SE8mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738865902; c=relaxed/simple;
	bh=Y9ecdWWtlfdxtG756H0/OQ3twmMuyLw5QPOn7VZx5xo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Eovo/Porz7KDsSqt7WxkZMSMJ6uxdOPg3RmhCF7PbWOGtqDRS5Fu/ZCxIOqEHt3OPJklKRuDOrRJ5r0YyQNLST1WSnaI1LlQROdS/qGir4Rh0WzHsxPHCsYpRSFyTc3DSpqWPuPj7tQAn2yQge4Z0rliNMH8uaScKV5oFcI0Muw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kVKZbcjN; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kVKZbcjN"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-5dc6714f3e8so1735849a12.2
        for <llvm@lists.linux.dev>; Thu, 06 Feb 2025 10:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738865899; x=1739470699; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nywgR7jAINvHiuDVB4pmE7YTMO7Utfq2UN01exAeezk=;
        b=kVKZbcjN17cvso/79L9XKU4k9FWYPguWHXH8/w0CdOUk3L+P9HruFuptdePlF6O9Pg
         dG+hfA+HDpVLHO0KOU7lxWn6Nkus1xsaSUznXeC2MYHd167BtLgtU4MEJvL82r+ZkwrR
         rMTlniiR8Y7OUhLoaDv8Pxhf1uv5fsblht3+DBUry+sGstClIMZtad79rqvGRELegbiS
         lXKU/rcN1ibosc8/xAXGGfaoBGZblVelnZgWPL0BSafao4sk8ZK6pB6jrp2J1Ibmh6Ml
         jxZZfRPc6I5Q/V9OdxweM5OppGfWCZ7HF6Dv7HeYIQMN010DVLcKNMH5i4JA9PPpbyeh
         m9XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738865899; x=1739470699;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nywgR7jAINvHiuDVB4pmE7YTMO7Utfq2UN01exAeezk=;
        b=bKbVBKDO+HQ/r30bWhl/MqGx34vaVWXdgMHWgHzyJRTsxWPfrdiJ7PYO7Q39S84jkR
         xwSd71Ttg3GkwKhTiM/nAP7CixsT3ZBs26lE3OeB/wi9ZwEpRA7Bk+bn8aMyd0SXhD7t
         aY086dp0ebhF/154xo2VJicnrQp3nF8WvxxN7cPR6DWFpHVpaZ/bgWDloSnTvIppk8/x
         m1yLUnu1HLgnAFN2WXTNwC9uL+bZz/tuJ/BA7ITUJq4ouUMbtpyc8TIeXTrNTj92Jr+y
         ix1AYhKVP5t2hk2wU+N7Ax0z+sTWoWUOqWxuER8yrwMAcddpYFHNhKUcmN1DfPTyRRAL
         AINg==
X-Forwarded-Encrypted: i=1; AJvYcCUAMJr8ujxAsGnhDG7PnSF2N/3eToXQHHAaLsFKAHXZNRAjiy2S+vYMLUJC6GJVbYBhQHHk@lists.linux.dev
X-Gm-Message-State: AOJu0YxvujohYqtzWdUgtYIuDWKXj12Vvn7fdWYoCa1E7O7yHtGxYfB4
	RhRe55/Xo29WAbfVK9RA55E6/hNGKLe5L7kcHtZd70ijU8xDTl5Ht2F2ZbvxSS/LZhxDV3jJLQ=
	=
X-Google-Smtp-Source: AGHT+IFTk3UeF0W3iesDJF4EyACnSXH4BTQBJaMsRlkE8Y124Sbz3T2V3DVtoGu6cpwiCqo9TIV5lxqZAg==
X-Received: from edag6.prod.google.com ([2002:a05:6402:3206:b0:5de:3ce0:a49b])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:51cb:b0:5dc:88dd:38aa
 with SMTP id 4fb4d7f45d1cf-5de45005a73mr490615a12.8.1738865898851; Thu, 06
 Feb 2025 10:18:18 -0800 (PST)
Date: Thu,  6 Feb 2025 19:10:07 +0100
In-Reply-To: <20250206181711.1902989-1-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250206181711.1902989-1-elver@google.com>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <20250206181711.1902989-14-elver@google.com>
Subject: [PATCH RFC 13/24] bit_spinlock: Include missing <asm/processor.h>
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

Including <linux/bit_spinlock.h> into an empty TU will result in the
compiler complaining:

./include/linux/bit_spinlock.h:34:4: error: call to undeclared function 'cpu_relax'; <...>
   34 |                         cpu_relax();
      |                         ^
1 error generated.

Include <asm/processor.h> to allow including bit_spinlock.h where
<asm/processor.h> is not otherwise included.

Signed-off-by: Marco Elver <elver@google.com>
---
 include/linux/bit_spinlock.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/bit_spinlock.h b/include/linux/bit_spinlock.h
index bbc4730a6505..f1174a2fcc4d 100644
--- a/include/linux/bit_spinlock.h
+++ b/include/linux/bit_spinlock.h
@@ -7,6 +7,8 @@
 #include <linux/atomic.h>
 #include <linux/bug.h>
 
+#include <asm/processor.h>  /* for cpu_relax() */
+
 /*
  *  bit-based spin_lock()
  *
-- 
2.48.1.502.g6dc24dfdaf-goog

