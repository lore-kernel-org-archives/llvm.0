Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315461A5B8F
	for <llvm@lists.linux.dev>; Wed, 25 Jun 2025 05:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750828529; cv=none; b=kkmOIzG22uOOtPFfy3DRAYzPvRJ2zkDp4zZdJWQI3eho+2B4t72tAzd3rM95vFsYSdS7XEPCyykVCZmXr1hoZXqlQdspLMtp+60+17xGvguEuMJ70XyrEKc4JOTWLHPMlJTdkNrLHAyCJYFqpAH4nj1ppa3/AD1fxU7NAlhU40U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750828529; c=relaxed/simple;
	bh=DZPx48zTDYNX5AKa48yQp9oTWkNFvmRP5adzWyGYmmQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BNLTQgIjIsQTB5i350LwvCa31OPK66p6cY41UCkxcT/JF9OMFuQkdPH2iujevWm/ej22EVBL/aMUghlRo1FxqPdrSNI83+VjA5dXJjz/RXIwiM4w96pBrI0MVLTkKc+8Oh/QQ0xC789Jvpq22s70o1FzgC7wBlKz6bN6L37eGp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lv6LpiJy; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lv6LpiJy"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6fafd3cc8f9so92505246d6.3
        for <llvm@lists.linux.dev>; Tue, 24 Jun 2025 22:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750828526; x=1751433326; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=x0uhFJxbTknYVv8H2dzluonrWfElV8YvZk9w6Cc8W4w=;
        b=Lv6LpiJyv0tglwbPMCvtfIqP3JgZgCgIXjvKRX7v3xbSn0Zyk2zDvWCrsZ76FkudWw
         lzNCo+6l2TEovkVDHOEprVSgA5hxk7LrhBbK6OXI3UZIOUnfaAnXNRGWq4eZ0MR9zkfZ
         UDCGqhHP3bAX2JUzkyJouJ8RxeqmqRF6djiTMtpsxh4hxMDKlJ+NHddsQc/SfcTYg5+t
         PWBZZnQe2altdGTPVEyBcrnCSYN8vzkr8GyVhBzPL+tFR1gIZsVArA8CXuz07kcZC0sK
         oVi678RDZHUQR1GLx1Nfgsr3CuZ+BqSfkYxATpBlnY0Vtyudh7OL/N5hZZz3DMvwumgj
         Ouow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750828526; x=1751433326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x0uhFJxbTknYVv8H2dzluonrWfElV8YvZk9w6Cc8W4w=;
        b=fqNl+rGxQt8dlKsDq5pALC7HrO8goPkSmlQ9rce/itVFX8+ASYmmuVu327kf5p40kt
         gh6J1Saw7S3xJx+2DPjYAZeW3/DMVldlz9z+8ugdLLFsOmYNUxhtmpFxBHP4bECSXy28
         bmd5nPrwNtOs7pMV5rJgJw6cnisfDjvx9GR6wysHVQFAek2l8r4y7+SevL68kdj+2WGr
         D+er3lWjXCFzwWQIDyDDWHFlBvp1dN8Fft+O3HoCu8YK0E5saj7gAfbSrI2Ct8cPa9w2
         DY6qTiKRALbPtQp5aFTSqixC8rPhxjo071a2vFJg/zBsgTe7iG4raintkkLtjMTDC4mw
         d6pQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5jddOTsOR2o/9P6oFcVr/yRUoM/SdyPHDstcc+QwIvNeJxi+Jdfy8zL5ERCxWf4WH661+@lists.linux.dev
X-Gm-Message-State: AOJu0YwomzYZoKIj4HvVI437k7LZKSnqOSSmMgZ8nUPews1jjEcRjuLx
	aRa5RYZgRO2h6jlnZV+r8+vyc8LuTWtdAxbEKx2mynpmLbLTNYV+USAO
X-Gm-Gg: ASbGncv4ZDkW0WIkviFXWJl9zsUJSCm2PXeiHtxolTebEC4vmCwJqpDsuVE0fqQfwYQ
	QOb0wi8l+0oBVR+175ECK9bdvwF+iFwupDH3p/y5Jy33oyO+wPVM2R213Q6DyKJS3YTAhDexcyh
	IpLoIxWn3z64ueES+qTRkALWkML1zst/MGZwSTQR+m03JHX1DvrxCexj+3pHZyuUihNuNrAwSlE
	Dsqpf/8ckkiwKPmGr+8m/ShcF7qexDV9m5xzGRiok9Gwda+9zS0bhNgH4qcoXLrQtAzKHGOc3eX
	XPNia2kU+qis0mFLii8SbYwpleU3tAHe1XDg3Gr2HmiF2A80AmI1lcZj7kqU+54O9jFtHEmu3HE
	brmuhqeWYO2KOnlWXSdazakpq68JTDbMmHv1F5je0RuQsyK7JIhS2
X-Google-Smtp-Source: AGHT+IEFTnqbuvaJX0Csg9cjWCqwK8O2gHdOMg3CTJHOajGqnck4hYJwCK/rV9J0qs08iUEap5Q+iA==
X-Received: by 2002:a05:6214:570a:b0:6fa:cb72:955a with SMTP id 6a1803df08f44-6fd5ef2fccemr23474106d6.4.1750828525731;
        Tue, 24 Jun 2025 22:15:25 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd09576766sm64178956d6.81.2025.06.24.22.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 22:15:25 -0700 (PDT)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id 502DCF40068;
	Wed, 25 Jun 2025 01:15:24 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Wed, 25 Jun 2025 01:15:24 -0400
X-ME-Sender: <xms:7IVbaO65iOjAAcyq6uDY70GEyAz7ZmCw0IFt_YA3rPkDFY8ICTYgAA>
    <xme:7IVbaH4aoewC9nG8q_JKYC7I9DRKqI5BsHvfosPTtJYMRMKvHVMxQIZssq9e4AGlC
    V-0e0jLaAubOq3G2Q>
X-ME-Received: <xmr:7IVbaNfT7SXJKb5cxV1jewqHkLszL2nkZaRzCwsTYU2ZeVn2ZL3Hc1G8vg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvudeltdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhepkeetteejgeduieekudejfedvvddtiefgieffffeljeefieehiefffedvfeffgfet
    necuffhomhgrihhnpehgihhthhhusgdrtghomhdpkhgvrhhnvghlrdhorhhgnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgv
    shhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehhe
    ehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgv
    pdhnsggprhgtphhtthhopeefiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmh
    hinhhgoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgvthgvrhiisehinhhfrhgr
    uggvrggurdhorhhgpdhrtghpthhtohepmhhinhhgohesrhgvughhrghtrdgtohhmpdhrtg
    hpthhtohepjhhurhhirdhlvghllhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehv
    ihhntggvnhhtrdhguhhithhtohhtsehlihhnrghrohdrohhrghdprhgtphhtthhopeguih
    gvthhmrghrrdgvghhgvghmrghnnhesrghrmhdrtghomhdprhgtphhtthhopehrohhsthgv
    ughtsehgohhoughmihhsrdhorhhgpdhrtghpthhtohepsghsvghgrghllhesghhoohhglh
    gvrdgtohhmpdhrtghpthhtohepmhhgohhrmhgrnhesshhushgvrdguvg
X-ME-Proxy: <xmx:7IVbaLLIrdM5e8NfhE8ob0ydD0rqWvN4n3StGN8HBmQQznQGV0PNuw>
    <xmx:7IVbaCIkqt-v5d23uFNcQBTgQ9UvWGBSEQiCvjyi3sMleKg8NU4GKQ>
    <xmx:7IVbaMyKJmSqPjFR1hQxJsUr6-EpIcMEwr4yWtvWW2PAyExY4G27yA>
    <xmx:7IVbaGLyyZO1v4-PQkAHRRbWlWAxbUWX5gIS74GPpXWMim1MiESKfA>
    <xmx:7IVbaJYMydMHJHFbDIOVbXtUTBksE4vhfb1sxu-Qgr9NUJjmCEjIN5fN>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Jun 2025 01:15:23 -0400 (EDT)
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
	Grace Deng <Grace.Deng006@Gmail.com>
Subject: [PATCH v2 2/5] rust: sync: Mark PollCondVar::drop() inline
Date: Tue, 24 Jun 2025 22:15:15 -0700
Message-Id: <20250625051518.15255-3-boqun.feng@gmail.com>
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

From: Kunwu Chan <kunwu.chan@hotmail.com>

When building the kernel using the llvm-18.1.3-rust-1.85.0-x86_64
with ARCH=arm64, the following symbols are generated:

$nm vmlinux | grep ' _R'.*PollCondVar  | rustfilt
... T <kernel::sync::poll::PollCondVar as kernel::init::PinnedDrop>::drop
...

This Rust symbol is trivial wrappers around the C functions
__wake_up_pollfree() and synchronize_rcu(). It doesn't make sense to go
through a trivial wrapper for its functions, so mark it inline.

[boqun: Reword the commit title and re-format the commit log per tip
tree's requirement, remove unnecessary information from "nm vmlinux"
result.]

Link: https://github.com/Rust-for-Linux/linux/issues/1145
Suggested-by: Alice Ryhl <aliceryhl@google.com>
Co-developed-by: Grace Deng <Grace.Deng006@Gmail.com>
Signed-off-by: Grace Deng <Grace.Deng006@Gmail.com>
Signed-off-by: Kunwu Chan <kunwu.chan@hotmail.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Benno Lossin <benno.lossin@proton.me>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Link: https://lore.kernel.org/r/20250317025205.2366518-1-kunwu.chan@linux.dev
---
 rust/kernel/sync/poll.rs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/rust/kernel/sync/poll.rs b/rust/kernel/sync/poll.rs
index d7e6e59e124b..7b973d72229b 100644
--- a/rust/kernel/sync/poll.rs
+++ b/rust/kernel/sync/poll.rs
@@ -107,6 +107,7 @@ fn deref(&self) -> &CondVar {
 
 #[pinned_drop]
 impl PinnedDrop for PollCondVar {
+    #[inline]
     fn drop(self: Pin<&mut Self>) {
         // Clear anything registered using `register_wait`.
         //
-- 
2.39.5 (Apple Git-154)

