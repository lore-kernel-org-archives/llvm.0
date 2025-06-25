Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F302B1F561D
	for <llvm@lists.linux.dev>; Wed, 25 Jun 2025 05:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750828535; cv=none; b=lVi0j181QjLjSw8URaN8NeTsfOhhAr5TtjwEtI1hVFkHVMimb99/mWM2yCUSijQ+GY+nIADMa3UE/ddu+g1HdiCjjUWhqiTd7P6f/pUjyN7j2zXufgf576pgQvuRi5K+ZOJcU/N3vEqo/RFfoVuMtca2xkH9zC2o01f4r66S4Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750828535; c=relaxed/simple;
	bh=VBOn77Pw4+tme4JesglES2sMUF30+bd7R7k26+boK2k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mnH6UVxaidFDUVUDSAuS+zyVUAVzxwORS7q74UHm/lj2CtCwgsKTKDtf18ekxp5ILN71QQc5stfC9ZEBRIKRGtN3U2zB3kK8QBIxHPRzgXPk8KUy0d5YAkAshJTsMHUbBMarXgRJQsQMqfXKWFVBQxVCQxUwtHG8DrxPq42P3gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ge7zEnUM; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ge7zEnUM"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6facc3b9559so95389266d6.0
        for <llvm@lists.linux.dev>; Tue, 24 Jun 2025 22:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750828533; x=1751433333; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jPHPiLn+shRnXPTS0LeS5dHvFwnPQLKTW28CIznWwTs=;
        b=ge7zEnUML6gx198AXl/SA5dCJ76KrFmoHjD9pE/NQSgTBtTVVNxFEklnKgX+8thaWs
         pJ+10sLpOxptFVoFszBwL8bdnFP5xoirMMbRZs7lSDBjHyJ96O2OAP9gl3/1Od4d+lZe
         tYrEKWx28f4y/WZaud8Q7YQvSmRe4Pp7L1qK+dlx2EoFSZcQ2k+KKpWWKGS2MF5qzSQw
         qd2Ejsz8UKT3s3i4eMUJeqqKKSyzR/LlSUIaMEIbkldmVAJoJcBwc1IR6tmg1FaC8By8
         OlMm167fyP/qE/XR6c4p2lAy9P05N5TM9hjiJD4QJY+gkBEQjl8RSCpnbEpas2LveCGF
         le+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750828533; x=1751433333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jPHPiLn+shRnXPTS0LeS5dHvFwnPQLKTW28CIznWwTs=;
        b=cqeBKRif0qcqNEtAdPQ3OyYZnl1W2r7ojF6KcIALF1NKIS7FFJqHWiHVMaJ6GbcKRQ
         HIg4659JkhU09QlB6BsW2099ypIWWUzfivdbzPelPT+2V29YBDHXaADUw0+VGVIRXrmj
         0hPc3rAfE5datjlJmW7TIvTil4xC3mo2hvSfYLgs3zNatItqov+rQDwDirLWbkaEOzP/
         uB4qbWf1yHN94oXsy3gTjet3XMK80l7Nj+LYLeZTn0CHz5AVA8RIAutigqu0BWYvaWXO
         CGWuDTrVgZ2/7PSdNJ3eGjuFMwWNvQhFM3ywPHe1HmvIQk3Bl1DpL/xbEuJiVh66gpsf
         f+tg==
X-Forwarded-Encrypted: i=1; AJvYcCV+MCQtDm/RpRFsxeR/GpAAm5Up37daDPRpgEMffWY89Cd2HkwliYmy826Im/KsLy2+o6XB@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4Ij1jFDEBAkrRj3w+y5Wi6iB3r+IA6zTnK0Tkc4klONAqyEcl
	xlFO8fm5WQ/GxP9mXfKsXRYS05HF6WZFIyxeNfd+Zq2SZ0eV+homtUl+
X-Gm-Gg: ASbGncs2laLbBEz+YOLBR5AGThNYU6D3aufFd7AlqAxEk3SIRoNHadmSvrldl+SLJrY
	ViQC+lmYg/Zwv7WTsyPCer19Kvkw+jsXKYj5ILOYwyDhoSKMIloC6rx7UkZNVwPahagSKTvAsjr
	gUcriAB5n6i9MIIN0LA7AIlTNh55pL9sRMMY+iFzRB4aKjdfzUmPatWsROYhPjVrnAjT5UbiJjN
	FcpLU0lI73JNm8svi7ZVqhHfg+pRka+WMK8TT4E6Q2AzfKqMGJFCPrQsn4HbEfPKfZjnS11o8IC
	xQxL+cv5JzQzU/2naSdFUdCJM6CJK2QrnSs649FZ4s//ecmaokkSJeSSuK51UwgBZH/LQbRTZxz
	t4pUQVM1OoBsqX4pljoimdLqvSJQTGJeijekxz0VsKZnUwizlBZwz
X-Google-Smtp-Source: AGHT+IFait6Cui768Cq84nzBcA7GCns6Fe7QqQseb3Vb4z41dIqYjDzEjvA0QzsRI6znLXw9/crJRw==
X-Received: by 2002:a05:6214:258f:b0:6fa:b42b:2bd9 with SMTP id 6a1803df08f44-6fd5efa0ff3mr27794456d6.37.1750828532649;
        Tue, 24 Jun 2025 22:15:32 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd09578243sm64267716d6.91.2025.06.24.22.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 22:15:32 -0700 (PDT)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfauth.phl.internal (Postfix) with ESMTP id 645C8F40066;
	Wed, 25 Jun 2025 01:15:31 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Wed, 25 Jun 2025 01:15:31 -0400
X-ME-Sender: <xms:84VbaGkHUZFzJ20zsbFGD7T0kI97aKYEohxzyB0y7Z7amuVQfxQcTg>
    <xme:84VbaN2Z6tYoHjrkSR4NbSFyHhASumwcYpiPt5zhbMWPs5GnlMr0P9I2Yq14AMcWD
    5wj2F6Ukyh3OBkA_Q>
X-ME-Received: <xmr:84VbaEppPL2QwPm6d_qd2zPk7Nir0YWPXY7MFaLMDhqXVYMht6CtIcSckQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvudeltdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhepgffhffevhffhvdfgjefgkedvlefgkeegveeuheelhfeivdegffejgfetuefgheei
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghr
    shhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvg
    hngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohep
    feehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmihhnghhosehkvghrnhgvlh
    drohhrghdprhgtphhtthhopehpvghtvghriiesihhnfhhrrgguvggrugdrohhrghdprhgt
    phhtthhopehmihhnghhosehrvgguhhgrthdrtghomhdprhgtphhtthhopehjuhhrihdrlh
    gvlhhlihesrhgvughhrghtrdgtohhmpdhrtghpthhtohepvhhinhgtvghnthdrghhuihht
    thhotheslhhinhgrrhhordhorhhgpdhrtghpthhtohepughivghtmhgrrhdrvghgghgvmh
    grnhhnsegrrhhmrdgtohhmpdhrtghpthhtoheprhhoshhtvgguthesghhoohgumhhishdr
    ohhrghdprhgtphhtthhopegsshgvghgrlhhlsehgohhoghhlvgdrtghomhdprhgtphhtth
    hopehmghhorhhmrghnsehsuhhsvgdruggv
X-ME-Proxy: <xmx:84VbaKm8bFqE8HcxVAkOyxg0KbsiVzwXbzDVWy3CMvh7qfjk_DSfmw>
    <xmx:84VbaE3u2-eUBFBKSlN7R9IdZ8m_uLO6xPRnDpEEWT1wNcLil_T-yg>
    <xmx:84VbaBtBoEYgGa1G58UPcT7paysUGCplZBfN9H2fAEK4mGWvlBvoZw>
    <xmx:84VbaAWMO-5zzCXFAFZZhDzwrTpf7OZaavhU8OvL-3atZgOCz19F-A>
    <xmx:84VbaP3oc2KF8bZelQrXZVQqiYevbr12iT4L-aa3i7R3ktazUmZOXXwd>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Jun 2025 01:15:30 -0400 (EDT)
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
Subject: [PATCH v2 5/5] rust: task: Add Rust version of might_sleep()
Date: Tue, 24 Jun 2025 22:15:18 -0700
Message-Id: <20250625051518.15255-6-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250625051518.15255-1-boqun.feng@gmail.com>
References: <20250625051518.15255-1-boqun.feng@gmail.com>
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

[boqun: Use file_from_location() to get a C string instead of changing
__might_sleep()]

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Link: https://lore.kernel.org/r/20250619151007.61767-3-boqun.feng@gmail.com
---
 rust/helpers/task.c |  6 ++++++
 rust/kernel/task.rs | 24 ++++++++++++++++++++++++
 2 files changed, 30 insertions(+)

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
index 834368313088..7d0935bc325c 100644
--- a/rust/kernel/task.rs
+++ b/rust/kernel/task.rs
@@ -400,3 +400,27 @@ fn eq(&self, other: &Kuid) -> bool {
 }
 
 impl Eq for Kuid {}
+
+/// Annotation for functions that can sleep.
+///
+/// Equivalent to the C side [`might_sleep()`], this function serves as
+/// a debugging aid and a potential scheduling point.
+///
+/// This function can only be used in a nonatomic context.
+///
+/// [`might_sleep()`]: https://docs.kernel.org/driver-api/basics.html#c.might_sleep
+#[track_caller]
+#[inline]
+pub fn might_sleep() {
+    #[cfg(CONFIG_DEBUG_ATOMIC_SLEEP)]
+    {
+        let loc = core::panic::Location::caller();
+        let file = kernel::file_from_location(loc);
+
+        // SAFETY: `file.as_ptr()` is valid for reading and guaranteed to be nul-terminated.
+        unsafe { crate::bindings::__might_sleep(file.as_ptr().cast(), loc.line() as i32) }
+    }
+
+    // SAFETY: Always safe to call.
+    unsafe { crate::bindings::might_resched() }
+}
-- 
2.39.5 (Apple Git-154)

