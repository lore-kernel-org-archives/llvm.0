Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263A6200BA3
	for <llvm@lists.linux.dev>; Tue,  4 Mar 2025 09:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741080344; cv=none; b=G/oImhACDgVnHXIKdYAgJsYAKek5UJeW082/GWSJZjADMk1HfS5/gtroH4ubdsovjZrotb+pXMhRYeRkOrI2nBnlH2lkiAz0II75XykuvXh0C2WvteVondqZVaWvHY/xZI9552f4Y1MwYjIBzrTKwLnb6RuKQOf5HkJK5aJE6fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741080344; c=relaxed/simple;
	bh=A7gPHEZIEQYCG49NjQ38GqM0IYCU29sZ4kgbaVoDh5Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Bz7httjbC2TgrJZpr0mOCAUB3SfpvjIE8dcTd+Z8vXbAb2/JMwyrAkayixGHcLPRyQ0KMuWXb2StwIoAEFgAcmpzL4aAa25K2kpCAVp1IW7cZmez12Q7i8ilrlrqjzEbYrRo+xH42W8SsL05h/g4gclv57h0MigVclzyotFMYN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vjRjb/0W; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vjRjb/0W"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-5e54bade36dso2167825a12.2
        for <llvm@lists.linux.dev>; Tue, 04 Mar 2025 01:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741080341; x=1741685141; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4NsOo3OXCYTu9WQHyv5ORZtwu1IzgjlVv8TtoKqxnnY=;
        b=vjRjb/0WNO86UC42MMnbMeXdCG2WXYxIABNQIn6U4DHnDJ+PY7BBxWh80Rczvr2eSu
         vEotaLTiiE/YLHDRVaeEE5dYusEyb21vIz1Oi7xJdYd9qPSbYnbBlHdLQlxlLZHB3Ek7
         3HaK0qnAnLTSTuPx0iekg/Wj2FMZZMTm5EcJZtzDYG2+K15EybczLWWosjOFa+Hq24e6
         +m95bABn1PjEidYnG7Lo4rT/mUZd0HwT/PXhK0gWP6kc5DEZHoAgdYJxwVjNZ03WffJX
         YrQ7IjjlxGBJzYgMet32jhVpadD3nI9VszybUwVA44yjuvqTXvVMgS15WCDJbOGl2qWA
         OeFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741080341; x=1741685141;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4NsOo3OXCYTu9WQHyv5ORZtwu1IzgjlVv8TtoKqxnnY=;
        b=e1gxb6r4yC93oBY6xFpkW6WPLBSTw191i1MUI/uMBlW2Y4s0C6pweMx+hx3QvOSUaJ
         gSAxd5rbOOCLGUn3vcN1AyhUT9smhqzAM/qHVhgCHElXVUbdFQMzibg7eBaOikt9sy8e
         PWj/j0zVrAn6wfkWa4CwJ/QhCOhL+cvkjKZY9UELLMwN0j4puxGAOLROgJSU/nBceBod
         K41i/uwmQ0iiVscmtu6x/kb/UjlKHk8h9RWhVYgMkqFgedoVqq+CDlFjWYkty05MYPew
         7miJ8cuGQEfm6FH3iLszKoALrNb6U6XGZG92NwWwCuM89tf2iztGfehvT7rIQ2QuIPH4
         O3lQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpOen+JsNtUghyDJkwvdUwTsGFJNilayp225pVn9SZ5DETibE0JBJkKZvtjE+dU1dknf/C@lists.linux.dev
X-Gm-Message-State: AOJu0YyzA3dGKLlk7khsDLLmWNNI/6otCxYt0weZsFiOQC8XmgRQ21ZE
	DyHoIyrY0A3MkYcylbXx4YnouDFF8/21u5uyjQENN6Pp+y+ztetNIVlgNbdNVnxxHjvVpv6TRA=
	=
X-Google-Smtp-Source: AGHT+IGvHnVCTmDxfH/8wK0cbMQMdd2+QC7Cg7+dh1AXOrq291KoSLxad8RL5shMmiF0TMtX3LbCMTR8+g==
X-Received: from ejctb11.prod.google.com ([2002:a17:907:8b8b:b0:abf:60e8:559])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:43c6:b0:5e0:7ff3:20c
 with SMTP id 4fb4d7f45d1cf-5e4d6b0cb67mr18149547a12.17.1741080341679; Tue, 04
 Mar 2025 01:25:41 -0800 (PST)
Date: Tue,  4 Mar 2025 10:21:11 +0100
In-Reply-To: <20250304092417.2873893-1-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250304092417.2873893-1-elver@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250304092417.2873893-13-elver@google.com>
Subject: [PATCH v2 12/34] bit_spinlock: Include missing <asm/processor.h>
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
2.48.1.711.g2feabab25a-goog

