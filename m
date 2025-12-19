Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9EE34DCC9
	for <llvm@lists.linux.dev>; Fri, 19 Dec 2025 15:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766159238; cv=none; b=gTM9EzKFdT8bBNfFagkMAFqJNfFUPA3hStLIsdgJr6lhctVebqE2TZRponCAkdQ35WFgT4cf1D5U602ED9P/ul3MHdWr0jHGT3cLQoeGeCg6+DrQ9DA68kX8bADLrTREajvIkgreK3tiSKNsGaj0Is4Y9DkcDhoepgV9kC1qvO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766159238; c=relaxed/simple;
	bh=CnQRybaMloUAntIxAZhPHUkaIjFKvuXDqT9A4epNaZ4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ES9CKGgGo30sOmC8khJmvfe8hXVRZ98FlzKP7J/r2Ie7kYE2MLYNqKZctvEciaqNcU5ybpM4RG2Gq2ctA+B9Q8BAXr6dUCKoOU3qocwxzTsmfEWN7AU/X7sF92vR+MK2rP77iP/NyCcgz1qtwrhgaoHTc0bAmY43Zr7W7w32wWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jZL9v7Bc; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jZL9v7Bc"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-47a97b719ccso10199905e9.2
        for <llvm@lists.linux.dev>; Fri, 19 Dec 2025 07:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766159234; x=1766764034; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Oz8u5mnRRtKrmwrW53CCOIRd71oba2M2eRROatW6JBk=;
        b=jZL9v7Bc0ZBY0AEXy4FpC81sYWR0RxMJonSuULBFvLH/8KSBeYjJGYp5LCqYNF8rZe
         1r+eZI52JR4qs94ZfNZZl8HQz8OA5lpz2ICoQoV3ye83Y8izptcDXzr+JdFjR7+IGpFa
         S901AndBL5ZVsiUKnWKfQlqwleZplrpkRqikirjQ7LS+lwvw7GcBwTkscy16sbM+pZPC
         vhdjFWLVrEf3dp7T5o6dM9AdwEEwLsFo4XoBYrXvWvGBxWCxBXBmwkZo7X2YZ+zaxdd5
         JYgieAakfS2Yt5gapmTN6g83xnKj/7Xd02uapjsB8eCjA4Zom1tqcPXCUtsO7AZFUHuk
         rPkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766159234; x=1766764034;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Oz8u5mnRRtKrmwrW53CCOIRd71oba2M2eRROatW6JBk=;
        b=aaAfEHn3TtHklziS2208p/PAwqmqzYIG+sN0fDHTd1jZRLWBDt0vezQ3VPCd3fryl1
         xfuiihyLkadOOaYOGBImOcbC9S19gshaUpIPQM5M2P6hecVX6HyakuHhQQKv67J0KHIG
         hTXGDZEUiEXKqGBlh9w9WbXQ/EluUju+YLwHyjDTiE/xYZ+qjj4LfNL6MP/Kgds7FIQn
         qiRPBU5kDYO4k0ViVLteWHsD8MS8XDKkqOPl0YdWKXHf6XyFVlTyK2h7b0EZCPXSuejR
         g7epKZQunc4Cwf6V6f7V/nWOQIaI2JCASG3IhpzlLe/YdRnsVMmE6yehg4ZC+1Qw/cZN
         UhIw==
X-Forwarded-Encrypted: i=1; AJvYcCUOd6uTy6ErX0cMyXax2n2xSxMN0mpHLCnhH6WK2QaCx8DDjTj8qh2OSpS/4sOF6nYej5yn@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7HqlxGaHYkdC4yL9xyRYO/SMYvytxsmzGM4kay/E4QXY7JA5c
	yZ3555yhZov/niPoqu5FWOHqqwZCKtR12+9mGBBUgOcF7mV5yDDN0WS6d5yqMGiiLrljRHbT6WE
	emQ==
X-Google-Smtp-Source: AGHT+IEwqTwwND1oOGnUGB6Esw6SWTC15eB9YSENtXjOOBgQW9BC3hhYUlWG2oQBl8kMDLj0dbJpcjcvdQ==
X-Received: from wmdd3.prod.google.com ([2002:a05:600c:a203:b0:477:54e1:e29e])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:c16f:b0:47a:810f:1d06
 with SMTP id 5b1f17b1804b1-47d1953bb06mr26654055e9.4.1766159234094; Fri, 19
 Dec 2025 07:47:14 -0800 (PST)
Date: Fri, 19 Dec 2025 16:40:16 +0100
In-Reply-To: <20251219154418.3592607-1-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251219154418.3592607-1-elver@google.com>
X-Mailer: git-send-email 2.52.0.322.g1dd061c0dc-goog
Message-ID: <20251219154418.3592607-28-elver@google.com>
Subject: [PATCH v5 27/36] MAINTAINERS: Add entry for Context Analysis
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

Add entry for all new files added for Clang's context analysis.

Signed-off-by: Marco Elver <elver@google.com>
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
---
v4:
* Rename capability -> context analysis.
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5b11839cba9d..2953b466107e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6132,6 +6132,17 @@ M:	Nelson Escobar <neescoba@cisco.com>
 S:	Supported
 F:	drivers/infiniband/hw/usnic/
 
+CLANG CONTEXT ANALYSIS
+M:	Marco Elver <elver@google.com>
+R:	Bart Van Assche <bvanassche@acm.org>
+L:	llvm@lists.linux.dev
+S:	Maintained
+F:	Documentation/dev-tools/context-analysis.rst
+F:	include/linux/compiler-context-analysis.h
+F:	lib/test_context-analysis.c
+F:	scripts/Makefile.context-analysis
+F:	scripts/context-analysis-suppression.txt
+
 CLANG CONTROL FLOW INTEGRITY SUPPORT
 M:	Sami Tolvanen <samitolvanen@google.com>
 M:	Kees Cook <kees@kernel.org>
-- 
2.52.0.322.g1dd061c0dc-goog

