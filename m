Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC3022B8B0
	for <llvm@lists.linux.dev>; Tue,  6 May 2025 04:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746507538; cv=none; b=u146y5NfqNywNs0WmrvXY4CCzFkecrzWVbBwe2fdoet2IPJnqchHGDg3yQr1k67DFuqog6PUg+qdg+rPDS/ZHz52qgLKqfaJNvleJVvekW2H/8dKibZpz0REHBSpE/N+TGemAxqn7J0NDhApPE7c0QoJ9YbrTS04eCiUcWvFxlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746507538; c=relaxed/simple;
	bh=2rKTDohoIZTv364VBRei4ErD52RBTQMB1Pfa9/nE7Qk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hbs5PXQFd5I5DXoUJRcdcyJGSYcXRy4HvMIF28/9bmvdPqUDegeysPStuzeL5F5gDjyMeroPeGNnym3x8bEFg8AKqzUy8VSxzExU4MBx4LTU0OCDQG3y+hvXRNIm70uH65G2gIIrKWr8+UlO9knHvusQJ/tZK4BnyoXwKXPlrH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZEAUcDLr; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZEAUcDLr"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6ecfbf1c7cbso97368076d6.2
        for <llvm@lists.linux.dev>; Mon, 05 May 2025 21:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746507536; x=1747112336; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VOzgpOO8eORRFq8I92/Pf3cpq9kLRkLkWGI5a9WKGkQ=;
        b=ZEAUcDLr6sFnWIjOepXESbzP4ea89S78YujTqVPDZbN+VpOlPXzicpMgHL/2eF2ihc
         8p8bxgBtYLH0k3e7Sqd4bzCW+JrZucn2ytNlqTbcL3YlbeRM0w0yy3IhhZcsJe8uxcdt
         ua06lAAtJoP1LSR3jtN21jPf6m5jK/5Cyao3iuAQPcJFQk32MJTVcHY1APai3/EiZI5j
         /qaFgsKcq752Py224wt5+BlzXbiIWKeQIKQ9QgiB5u06Xw7x20aWVlRQh2rMLaCJD6W6
         uT1X4AuEDChA6ItG5XbASfeXu7/3ixnNMOvC9f8c+s1CHm4lkD0jGZZwi6LsWtXoTHYi
         2tSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746507536; x=1747112336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VOzgpOO8eORRFq8I92/Pf3cpq9kLRkLkWGI5a9WKGkQ=;
        b=MDPqenGad1fCCjSMUlEpW1y/AI8GGnQOv3WUkTBA3secRLparPca1fjnE1kGXLLtI1
         11haPDA4u3XAsP8XSOHdHSzSKhYm+5wc594lpJi4RfiihJuzKQWCauHCxaqLUzcp+s3M
         eL24KSP1sx13LA97CS84DyFymjuy7R5byJLY/whd9BsgdsNMjLCYKW94Ln2NzoZjC4T5
         8xoyzB/pDlUiLdrNgOsgtGmcUt5HKal/k5M5dMLhi0ottqtskYwBBtf/UWJnB6lkX3xd
         1q1BHCZbacMFa//32efVmCDlUC+xSuuX1O+7k/ZaJtRPwyCwGaQZrDIl5qyFmJIuztQe
         Amww==
X-Forwarded-Encrypted: i=1; AJvYcCXMxsDd3hh2FYxrrZ/He5NlBsRCK3Xq6JKWo0wjvdz3Pf86dWfWJ6uqMomQ0afo5hk7+lDX@lists.linux.dev
X-Gm-Message-State: AOJu0YyWXIiXkQgVNPcWthxbInociFdUY3Q7NW48IAXUygrLdz+99qSD
	eL/rbIDpzlqFtQAKiTfZzYZRoIDq+vzi9HV1cjQMlpdcJqEyuFy9
X-Gm-Gg: ASbGncsxijey8EZ2vAslyAl9GvLymo24jCxwRcFUjaAZE6EEjcCmWMDnESS92onZ4rS
	gOQQgfPlDTPx2nuxI1kPSC4iIH/LOiKTKan0B/RbZxD1h15hvP+H2Uo6F11mkO6r6Kn57wRieFV
	lVWAjwWdHI/JPIZDBSrYaE5swsSiZg2z04MiILfnhqxNOta52t9pEBzFv+V+2HkSZ6xBZMjYKXk
	pwvKbh92Kj9FUCsUcJfVtr9lDE8a89bWPk+oHxZRhoN1pCIOPZ2meU7OwiVPpE7mdIS52xP1oCn
	Z2ZQ4LZqUIo7uT9MTNOqm+MPOfGNBlxsF0Pqe39ymNHLKcyu+dA0hSWBSsGtAfRguCB/JTCE54W
	cu8bWfOlOMl8DEJHzCmW1pgxDg+or5V8=
X-Google-Smtp-Source: AGHT+IFQN30BafUiqDdeBzYv8NLBc7OgLuq4IV6Uz/0rbVOFp3cLcOixfIhpiNw/jdY6LbD/sLR14w==
X-Received: by 2002:a05:6214:3001:b0:6f5:d21:cf90 with SMTP id 6a1803df08f44-6f528cecc37mr141978996d6.29.1746507535854;
        Mon, 05 May 2025 21:58:55 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f50f3c4492sm65288086d6.35.2025.05.05.21.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 21:58:55 -0700 (PDT)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 89FBC1200066;
	Tue,  6 May 2025 00:58:54 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Tue, 06 May 2025 00:58:54 -0400
X-ME-Sender: <xms:DpcZaC9W0dFvJHLPuybwzJk71bbhv-khnsoDrZqGoljyNIXsUVaz1g>
    <xme:DpcZaCsI2uacXWbL8KBOq0zdSuibMlDCpndYc7YViJBcF9fUCmkIbPlGzKRfcLDpI
    hK-umI-f5QSXTJ3Tw>
X-ME-Received: <xmr:DpcZaIB0MPdvsNr3NblFoJ7mL4PFfZUBpS8nfQPCvqgA3_WmZUaUcDHC>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeeftdelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredt
    tdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
    hlrdgtohhmqeenucggtffrrghtthgvrhhnpeekteetjeegudeikedujeefvddvtdeigfei
    ffffleejfeeiheeiffefvdeffffgteenucffohhmrghinhepghhithhhuhgsrdgtohhmpd
    hkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqd
    eiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhl
    rdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepfeeipdhmohguvgepsh
    hmthhpohhuthdprhgtphhtthhopehmihhnghhosehkvghrnhgvlhdrohhrghdprhgtphht
    thhopehpvghtvghriiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehmihhngh
    hosehrvgguhhgrthdrtghomhdprhgtphhtthhopehjuhhrihdrlhgvlhhlihesrhgvughh
    rghtrdgtohhmpdhrtghpthhtohepvhhinhgtvghnthdrghhuihhtthhotheslhhinhgrrh
    hordhorhhgpdhrtghpthhtohepughivghtmhgrrhdrvghgghgvmhgrnhhnsegrrhhmrdgt
    ohhmpdhrtghpthhtoheprhhoshhtvgguthesghhoohgumhhishdrohhrghdprhgtphhtth
    hopegsshgvghgrlhhlsehgohhoghhlvgdrtghomhdprhgtphhtthhopehmghhorhhmrghn
    sehsuhhsvgdruggv
X-ME-Proxy: <xmx:DpcZaKcGMHOKUZDLoEiVuAqP-CYB79w64Tylz42UzlYX1GUw3cQ4iA>
    <xmx:DpcZaHOjpGG_h_HXdhXZz42oEVrg3qX7jJrDJPboLXP5Ki45mHxz5A>
    <xmx:DpcZaEmG3WbpXjOFQm8FTCCKAboaHaUAEnXlszoonlu3oXNS_2G0fg>
    <xmx:DpcZaJtU4V4IBBX3yFmaY5HdzzWLBjb0ZGw2SCCLjphUnyoSV08U7A>
    <xmx:DpcZaNsUiUl_GAScjWuxJAEAoovHbbzEh17qypMV_J4JgHcw5gDn0qTf>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 May 2025 00:58:53 -0400 (EDT)
From: Boqun Feng <boqun.feng@gmail.com>
To: Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>,	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,	Valentin Schneider <vschneid@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,	Justin Stitt <justinstitt@google.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Tamir Duberstein <tamird@gmail.com>,	Kunwu Chan <kunwu.chan@hotmail.com>,
	Mitchell Levy <levymitchell0@gmail.com>,
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>,
	Borys Tyran <borys.tyran@protonmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Panagiotis Foliadis <pfoliadis@posteo.net>,	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,	llvm@lists.linux.dev,
	Daniel Almeida <daniel.almeida@collabora.com>
Subject: [PATCH 4/5] sched/core: Add __might_sleep_precision()
Date: Mon,  5 May 2025 21:58:42 -0700
Message-Id: <20250506045843.51258-5-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250506045843.51258-1-boqun.feng@gmail.com>
References: <20250506045843.51258-1-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

Add __might_sleep_precision(), Rust friendly version of
__might_sleep(), which takes a pointer to a string with the length
instead of a null-terminated string.

Rust's core::panic::Location::file(), which gives the file name of a
caller, doesn't provide a null-terminated
string. __might_sleep_precision() uses a precision specifier in the
printk format, which specifies the length of a string; a string
doesn't need to be a null-terminated.

Modify __might_sleep() to call __might_sleep_precision() but the
impact should be negligible. When printing the error (sleeping
function called from invalid context), the precision string format is
used instead of the simple string format; the precision specifies the
the maximum length of the displayed string.

Note that Location::file() providing a null-terminated string for
better C interoperability is under discussion [1].

[1]: https://github.com/rust-lang/libs-team/issues/466

Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Co-developed-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Link: https://lore.kernel.org/r/20250410225623.152616-2-fujita.tomonori@gmail.com
---
 include/linux/kernel.h |  2 ++
 kernel/sched/core.c    | 62 ++++++++++++++++++++++++++++--------------
 2 files changed, 43 insertions(+), 21 deletions(-)

diff --git a/include/linux/kernel.h b/include/linux/kernel.h
index be2e8c0a187e..086ee1dc447e 100644
--- a/include/linux/kernel.h
+++ b/include/linux/kernel.h
@@ -87,6 +87,7 @@ extern int dynamic_might_resched(void);
 #ifdef CONFIG_DEBUG_ATOMIC_SLEEP
 extern void __might_resched(const char *file, int line, unsigned int offsets);
 extern void __might_sleep(const char *file, int line);
+extern void __might_sleep_precision(const char *file, int len, int line);
 extern void __cant_sleep(const char *file, int line, int preempt_offset);
 extern void __cant_migrate(const char *file, int line);
 
@@ -145,6 +146,7 @@ extern void __cant_migrate(const char *file, int line);
   static inline void __might_resched(const char *file, int line,
 				     unsigned int offsets) { }
 static inline void __might_sleep(const char *file, int line) { }
+static inline void __might_sleep_precision(const char *file, int len, int line) { }
 # define might_sleep() do { might_resched(); } while (0)
 # define cant_sleep() do { } while (0)
 # define cant_migrate()		do { } while (0)
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 79692f85643f..496bd462d29e 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -8732,24 +8732,6 @@ void __init sched_init(void)
 
 #ifdef CONFIG_DEBUG_ATOMIC_SLEEP
 
-void __might_sleep(const char *file, int line)
-{
-	unsigned int state = get_current_state();
-	/*
-	 * Blocking primitives will set (and therefore destroy) current->state,
-	 * since we will exit with TASK_RUNNING make sure we enter with it,
-	 * otherwise we will destroy state.
-	 */
-	WARN_ONCE(state != TASK_RUNNING && current->task_state_change,
-			"do not call blocking ops when !TASK_RUNNING; "
-			"state=%x set at [<%p>] %pS\n", state,
-			(void *)current->task_state_change,
-			(void *)current->task_state_change);
-
-	__might_resched(file, line, 0);
-}
-EXPORT_SYMBOL(__might_sleep);
-
 static void print_preempt_disable_ip(int preempt_offset, unsigned long ip)
 {
 	if (!IS_ENABLED(CONFIG_DEBUG_PREEMPT))
@@ -8771,7 +8753,8 @@ static inline bool resched_offsets_ok(unsigned int offsets)
 	return nested == offsets;
 }
 
-void __might_resched(const char *file, int line, unsigned int offsets)
+static void __might_resched_precision(const char *file, int file_len, int line,
+				      unsigned int offsets)
 {
 	/* Ratelimiting timestamp: */
 	static unsigned long prev_jiffy;
@@ -8794,8 +8777,8 @@ void __might_resched(const char *file, int line, unsigned int offsets)
 	/* Save this before calling printk(), since that will clobber it: */
 	preempt_disable_ip = get_preempt_disable_ip(current);
 
-	pr_err("BUG: sleeping function called from invalid context at %s:%d\n",
-	       file, line);
+	pr_err("BUG: sleeping function called from invalid context at %.*s:%d\n",
+	       file_len, file, line);
 	pr_err("in_atomic(): %d, irqs_disabled(): %d, non_block: %d, pid: %d, name: %s\n",
 	       in_atomic(), irqs_disabled(), current->non_block_count,
 	       current->pid, current->comm);
@@ -8820,8 +8803,45 @@ void __might_resched(const char *file, int line, unsigned int offsets)
 	dump_stack();
 	add_taint(TAINT_WARN, LOCKDEP_STILL_OK);
 }
+
+/*
+ * The precision in vsnprintf() specifies the maximum length of the
+ * displayed string. The precision needs to be larger than the actual
+ * length of the string, so a sufficiently large value should be used
+ * for the filename length.
+ */
+#define MAX_FILENAME_LEN (1<<14)
+
+void __might_resched(const char *file, int line, unsigned int offsets)
+{
+	__might_resched_precision(file, MAX_FILENAME_LEN, line, offsets);
+}
 EXPORT_SYMBOL(__might_resched);
 
+void __might_sleep_precision(const char *file, int len, int line)
+{
+	unsigned int state = get_current_state();
+	/*
+	 * Blocking primitives will set (and therefore destroy) current->state,
+	 * since we will exit with TASK_RUNNING make sure we enter with it,
+	 * otherwise we will destroy state.
+	 */
+	WARN_ONCE(state != TASK_RUNNING && current->task_state_change,
+			"do not call blocking ops when !TASK_RUNNING; "
+			"state=%x set at [<%p>] %pS\n", state,
+			(void *)current->task_state_change,
+			(void *)current->task_state_change);
+
+	__might_resched_precision(file, len, line, 0);
+}
+EXPORT_SYMBOL_GPL(__might_sleep_precision);
+
+void __might_sleep(const char *file, int line)
+{
+	__might_sleep_precision(file, MAX_FILENAME_LEN, line);
+}
+EXPORT_SYMBOL(__might_sleep);
+
 void __cant_sleep(const char *file, int line, int preempt_offset)
 {
 	static unsigned long prev_jiffy;
-- 
2.39.5 (Apple Git-154)

