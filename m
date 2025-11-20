Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462FB3659E4
	for <llvm@lists.linux.dev>; Thu, 20 Nov 2025 15:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763651620; cv=none; b=EfjMMOIT9xN2nMV1T5TiL7SPlPYuvmMxIycrmHBnLw1wouEvWi7u5D5JPhMe9qN9/T20L8asfrXbqF1KJEUMDFiPlkdzmX5BxLgUqB0j6gYNepsTtug0F+wK3zfikGsRkPaAU8F2/Yl8SVVwujRpFd7+Tgss2T/ekBHgJXJshlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763651620; c=relaxed/simple;
	bh=JSFE6OXplsVQRasUjLyJp87wPLoBhJo5boc6e5TlRPY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RBN/eI5JZ9MmbFLoGfJYhH57nEI6gvontK4+HdRR5aJZeY6UKhNIsj5ua3KsG5kJmERLyfgJGHgkI6U8Ru/IzSUetxXr8SsV3xLJhxb1Emecxl7hh4lfjou7so77eWtTvp4pukyiknukV+CcZUxx05d+e4+1u+2ZyOVEWWtCTJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dIqTXY6f; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dIqTXY6f"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-477964c22e0so6885055e9.0
        for <llvm@lists.linux.dev>; Thu, 20 Nov 2025 07:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763651613; x=1764256413; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xNvl5AadBnBbkNqIZ5ePr/ep+DGb1qTLi02EcnmaTpQ=;
        b=dIqTXY6fvZE6WItNw1LBDBiUNq4N91AHSKnxFTYQCg0UW/rpsq2xNWqux8oa1JqtIp
         LFTl44zlMZAnhvBpwZ+GFiVSy1ul2CRopJT38aDDL2Ae83EaOI70kWmBpraZUWjys+hh
         vThXe6GZE21FKa+JPNK8Sj1QvSZHn/mosdeSFcZwUpUl8QRs+diUNIcz1DAKfJFZcTt/
         dw+65Xn2kISn+6t5qzIUI3YgFPZi4qA4BCLEapb6lPsoTCgHMgl9uJJ0twaORuyxomin
         v196Dtes6r5qUZNY2U0bkWy5Z3ffxBPG2BiJNOag7aDSF5mNn4BG0RP5FRr5ymnQDAp2
         L7DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763651613; x=1764256413;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xNvl5AadBnBbkNqIZ5ePr/ep+DGb1qTLi02EcnmaTpQ=;
        b=BFRnJWFgbpqF43YAtZeRRFM26bTbSEsH8/I8+nLSAghWrpsgLYm7v1x2kh95w0/oZV
         gLXWz/jNaK3pZxWZR5vWpbk3EJyLy4JJYcYj9no8Mz9piuRWHGtNtI7abUWDDuW/HRhb
         eb3AlY7ePt2HWJtVy1KBFAnetdAZUPB++2j7B2oUFJFO682Zi5pjOCKbAioO2Q7/cdyn
         tOMFOEy6m56tuMJJSNzC+MlCdNRiL9NfUUgeK4e33U9CfS2z2UA1pV//k4lWilmrZmLJ
         z//iJtBl5fJnvQ18vei4OQI0J5brkL6WHZFHwlt3l/ltyK1HSW2P6ec3kVopc7lqWxLG
         T0sw==
X-Forwarded-Encrypted: i=1; AJvYcCVmFKA9LxcXj8qA4bXECfqOruBn+jfVvp+Tm8kS0Wd9mz9rvCeOe3QbsuPf6glbEus1uQbc@lists.linux.dev
X-Gm-Message-State: AOJu0YypN/ed4k4u353rc62dY2H2R6dua11uy0zjo+3Uvc5fh5sOjSlU
	I0ybZ/9uvBC3PyRWTBv6JjFgjDFqalT8QbkWng1xDci2K2r9gltjkRO+MePXJfyL7rk8g3f3NAq
	U6A==
X-Google-Smtp-Source: AGHT+IF9W56E3BCf4ycfyNzV0Jbt7zmYcg646z2GlS6yDnrRg6LpKFxf4hnN1dp2GqjQ6ITkpBqUZJJJqw==
X-Received: from wmbbd8.prod.google.com ([2002:a05:600c:1f08:b0:470:fd92:351d])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1516:b0:477:14ba:28da
 with SMTP id 5b1f17b1804b1-477b9ea8f78mr18741385e9.5.1763651612613; Thu, 20
 Nov 2025 07:13:32 -0800 (PST)
Date: Thu, 20 Nov 2025 16:09:51 +0100
In-Reply-To: <20251120151033.3840508-7-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251120145835.3833031-2-elver@google.com> <20251120151033.3840508-7-elver@google.com>
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
Message-ID: <20251120151033.3840508-27-elver@google.com>
Subject: [PATCH v4 26/35] MAINTAINERS: Add entry for Context Analysis
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
index e64b94e6b5a9..0445478f74c7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6029,6 +6029,17 @@ M:	Nelson Escobar <neescoba@cisco.com>
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
2.52.0.rc1.455.g30608eb744-goog

