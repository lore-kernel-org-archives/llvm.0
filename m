Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C2D22F767
	for <llvm@lists.linux.dev>; Tue,  6 May 2025 04:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746507540; cv=none; b=XFytX/Vk4azq9WH2fvY0m92hl1h4OdUkr6J4fmyOhVVjtVLoZwmCdonBWu0D2SK8NKP7E828c3xppjAjHczVzgnRlYUk/oK84+PsEZJnhYRn6xgnT4JsiAaSIeGRK6DuI6CHWGAEVFIHQOYKW2zn+xQY3iWIw8jjn28g3P327QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746507540; c=relaxed/simple;
	bh=m7vxYgUh8ULPptGn2nd3MYeUmYgn13h75xWsCTIcIOc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PYD8DcjmEFfRqqf2ka/E2U/g1k5pP9FBZ91W61PRF152LcIFIozyBT7Fam0AcDWlc/qJFAJKHweR2NfYPj3wy0LlpJAX3Avg/QSSsFgZhy9hBmhJbxBvsqtPTPbDB2rVqorS/o1NMsePoj1BemMCjjAgXDdtyH2iB3reynXlPG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z0E8v69Z; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z0E8v69Z"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6ecfc7ed0c1so48804166d6.3
        for <llvm@lists.linux.dev>; Mon, 05 May 2025 21:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746507537; x=1747112337; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1g9tUIclVmuH2ZaBusryyZl8QxSs3+aGqPstryRtHAo=;
        b=Z0E8v69Z+q53DqB44rvi9EGu3WM5bWVT4oDrF37DVcZbML3DqYhvbHgWhLKXTWS2PE
         l/l5HpXel9Re0pb38KACFplcZfEhNrWhBYmOLVzc8YQFSiqh8mc6pNhXW/WyTUpWMr4e
         +9rJsqWiUxxR+EzGl/MmH2xDmahFrP7aM9uyCOKhdHOOkBofpYtktOQl59EfWpFGywiP
         fb8yqskcfNypGIj+vDdi2cO09wxJAMDOF1wqDcklrtNdBkpJq5SNRe6Svuxg4pZmITLb
         RX1ZdFEmNV+Q4nYZV5Wo+r3ouDE9774c3u/YV7URIsaE9xPXuxERbxBUOgl8y6+1fOt6
         ydGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746507537; x=1747112337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1g9tUIclVmuH2ZaBusryyZl8QxSs3+aGqPstryRtHAo=;
        b=SF5Cz05rkkRvFsOoKdOHEcN6D3u9z2rDd6UX5iLlqspUbwt/b+mIqSzaVz7/9xNjuI
         d1coQxNNTYH7/5WQRfLIP3/CucQnn64W4HGoDpOYkAvQcOFL6tHH6+jb/n+eN8iuN58W
         8ZaczCpklYRDkyp0KjmRlLey9NB05J11xKIE8ia7SSkQAS5xTfUPyn/Un2rMG0NHf+fZ
         LSRmdrbo8daJN24e0lmesUBQ6AzLYHCokeZnhr2m1IuRXpYVQqhGfS5hZIuezS+pSOVT
         lw2ySLvlgWdPQiKCHZCCDus4Gmy2mAnGdB5PXUooNVyiRCmcEkvrAaz3v3JEn8cGmOJZ
         ttsA==
X-Forwarded-Encrypted: i=1; AJvYcCXwFz9BB0hapkj9fts+Ydu44DdTe28x1hrSdXj3nyv5TrWc+fuF5CESHVpd9KyYEoqiYZ54@lists.linux.dev
X-Gm-Message-State: AOJu0YxtxpUUu1AoXAwIw/0l7Lv37V+Ec0f/ZZXT7WZdjij55hnPX/ze
	yfTvW75PM0y821F1FJIeHwHqUrSEhgDWKq8hY0uZoie6OUkJux+1ZEqCcQ==
X-Gm-Gg: ASbGnctIxEZXi9fbFvijsj2jn38McrSo+Fv24NEuJO3UOxvpSJjBLBG4MRouiPjoC7H
	JR5vBiiAQHT0Ko3kAfTPcE6AvKUHyEwhbMDdGiAuqszLTpc+dYOMP0hSEKPhuWRUkOup5Vdm9q7
	dyiK+T5ZczIwlI8PYZNmnEVOnPWA8PAozyTISles9m5Usj4/HSsIfMI656UmWI+tyEAu/aA5qPS
	vdQRlLV43WUD+3KTXaDwHUW6hzD54NlUlnqp0nocplq98GhV41H3jciWzO4Hz3PHteG20VT1n/q
	Aw3hariniaNC9HnxX+1439ALr9oLod8x4DTyB1X+ZXEoNnmDQqmiyBi+oeyIHvo+MVPbRVU7dWX
	kZim2C4QKiNqB+uka9zCUHhPFgStWySk=
X-Google-Smtp-Source: AGHT+IEmn0U41CRqbdqAxigdPC3H0OSYylwKvqCa/ahyGHbsGpn1EVqOpBvXXjgh2ak2ogbN4Y5aZg==
X-Received: by 2002:a05:6214:124a:b0:6e4:2dd7:5c88 with SMTP id 6a1803df08f44-6f5358ede5emr31398286d6.38.1746507537275;
        Mon, 05 May 2025 21:58:57 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f50f3d35e5sm65095526d6.67.2025.05.05.21.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 21:58:56 -0700 (PDT)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 16B831200068;
	Tue,  6 May 2025 00:58:56 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Tue, 06 May 2025 00:58:56 -0400
X-ME-Sender: <xms:EJcZaIfMCBtg_zqqxLxTNzByW-Os9gNQoNnTq_1ZElherufZgY-ESQ>
    <xme:EJcZaKN76lA0P1qmkcKERFRRmAgAZiknGJem2f-9a0IKEecBM6xjOcdgzGJ7R6W9z
    vqRv6_0Yh4P0r_ihQ>
X-ME-Received: <xmr:EJcZaJhuj2p7zB5KoFc3g3QVrqp6-qMTEz4YmzQqcV5KAVcfZAvRY6g0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeeftdekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredt
    tdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
    hlrdgtohhmqeenucggtffrrghtthgvrhhnpefghfffvefhhfdvgfejgfekvdelgfekgeev
    ueehlefhiedvgeffjefgteeugfehieenucffohhmrghinhepkhgvrhhnvghlrdhorhhgne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhu
    nhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqdduje
    ejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdr
    nhgrmhgvpdhnsggprhgtphhtthhopeefhedpmhhouggvpehsmhhtphhouhhtpdhrtghpth
    htohepmhhinhhgoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgvthgvrhiisehi
    nhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepmhhinhhgohesrhgvughhrghtrdgtoh
    hmpdhrtghpthhtohepjhhurhhirdhlvghllhhisehrvgguhhgrthdrtghomhdprhgtphht
    thhopehvihhntggvnhhtrdhguhhithhtohhtsehlihhnrghrohdrohhrghdprhgtphhtth
    hopeguihgvthhmrghrrdgvghhgvghmrghnnhesrghrmhdrtghomhdprhgtphhtthhopehr
    ohhsthgvughtsehgohhoughmihhsrdhorhhgpdhrtghpthhtohepsghsvghgrghllhesgh
    hoohhglhgvrdgtohhmpdhrtghpthhtohepmhhgohhrmhgrnhesshhushgvrdguvg
X-ME-Proxy: <xmx:EJcZaN8SckWPBgUoUFQ4XyKHLlTBqnxM5GjnM1FY8tCQIr56hXDCNw>
    <xmx:EJcZaEsnXhIf_r3CXgI-2xiJWIPaiJ4E1vbv1ymS6u5G4IyPil5XCg>
    <xmx:EJcZaEG5bi1O6UeW9mqtX5gT0t9_REB7jYMO6wkk2s32CREWQssd_g>
    <xmx:EJcZaDPYHmuqwAoXy3TNk2Ng-YF3DMXraJ2J7dJFDoNVRiknVPdUnA>
    <xmx:EJcZaJOsFOThIGpLP9lWmfsEDivE6On5JUVrNdpcWzB1_prkxwBDFYGJ>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 May 2025 00:58:55 -0400 (EDT)
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
	rust-for-linux@vger.kernel.org,	llvm@lists.linux.dev
Subject: [PATCH 5/5] rust: task: Add Rust version of might_sleep()
Date: Mon,  5 May 2025 21:58:43 -0700
Message-Id: <20250506045843.51258-6-boqun.feng@gmail.com>
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

Add a helper function equivalent to the C's might_sleep(), which
serves as a debugging aid and a potential scheduling point.

Note that this function can only be used in a nonatomic context.

This will be used by Rust version of read_poll_timeout().

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Link: https://lore.kernel.org/r/20250410225623.152616-3-fujita.tomonori@gmail.com
---
 rust/helpers/task.c |  6 ++++++
 rust/kernel/task.rs | 28 ++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/rust/helpers/task.c b/rust/helpers/task.c
index 31c33ea2dce6..2c85bbc2727e 100644
--- a/rust/helpers/task.c
+++ b/rust/helpers/task.c
@@ -1,7 +1,13 @@
 // SPDX-License-Identifier: GPL-2.0
 
+#include <linux/kernel.h>
 #include <linux/sched/task.h>
 
+void rust_helper_might_resched(void)
+{
+	might_resched();
+}
+
 struct task_struct *rust_helper_get_current(void)
 {
 	return current;
diff --git a/rust/kernel/task.rs b/rust/kernel/task.rs
index 0bf5fdf75c37..067546754939 100644
--- a/rust/kernel/task.rs
+++ b/rust/kernel/task.rs
@@ -390,3 +390,31 @@ fn eq(&self, other: &Kuid) -> bool {
 }
 
 impl Eq for Kuid {}
+
+/// Annotation for functions that can sleep.
+///
+/// Equivalent to the C side [`might_sleep()`], this function serves as
+/// a debugging aid and a potential scheduling point.
+///
+/// This function can only be used in a nonatomic context.
+#[track_caller]
+#[inline]
+pub fn might_sleep() {
+    #[cfg(CONFIG_DEBUG_ATOMIC_SLEEP)]
+    {
+        let loc = core::panic::Location::caller();
+        let file = loc.file();
+
+        // SAFETY: `file.as_ptr()` is valid for reading for `file.len()` bytes.
+        unsafe {
+            crate::bindings::__might_sleep_precision(
+                file.as_ptr().cast(),
+                file.len() as i32,
+                loc.line() as i32,
+            )
+        }
+    }
+
+    // SAFETY: Always safe to call.
+    unsafe { crate::bindings::might_resched() }
+}
-- 
2.39.5 (Apple Git-154)

