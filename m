Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101C9225415
	for <llvm@lists.linux.dev>; Tue,  6 May 2025 04:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746507536; cv=none; b=GMjupUk3g3Ta8bgw1Krl0HU3hgs25XlVyZtKuT5GZCxoFVNZ8IQ/F+QIo+YItMEuq7F+R4Mdv07vWHNSt9fivXrEVkXIggy9VRpCI/TkYzXMB31htz563szBFUPguPYkbCrmzFM3VltmvZspXFNzQy2Ik3MObGOKvi0IViCTS/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746507536; c=relaxed/simple;
	bh=DZPx48zTDYNX5AKa48yQp9oTWkNFvmRP5adzWyGYmmQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JZpfwU4oZnOt5xWUfQCq918+88MzOsBNRtHfGBaNs3Uf+BuAOU9ryhUfqQ6IX2LLOsD/vGs5TzdGe88TAq0+TtyvW8L28gL+94fjNSph23HP5u/T6R2X+nyZNdBy0V4Dp5zM/NGzGS4a7lxDBinyQrwNkCxtotu6GIOXFFGUbYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Thzq0PWL; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Thzq0PWL"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7c54a9d3fcaso565035285a.2
        for <llvm@lists.linux.dev>; Mon, 05 May 2025 21:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746507533; x=1747112333; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=x0uhFJxbTknYVv8H2dzluonrWfElV8YvZk9w6Cc8W4w=;
        b=Thzq0PWLUyUjHPWm59XLKGN7cyS1ASwH9xhLgDq+wmSA1+VbgsrTjJenl5qImFrVgK
         Qd7OKHw0IjyN/XwYO94GbYMmmxNkTRuwdqjYvMKaS0qP66/bn7cmiH0N2HH9Q38IKJUG
         WqKMrVPCIFZxrZQ8RHUrPbhh5a80whX3tL+reYFzz6HLKHg8hsyaAArGQesTEk30VKiC
         ToOdOnblEUlvIxCKUYKC0NCu22n4XPi+NzjvM8qC8sbBn6CXiT5OJn5U+3w39jtLD3qK
         5tZBujht2NCLtPJQwpSXRTRI03+9ooyqptqDOfOIpCcRbekjS7bZ0l371NmB+voRqSCv
         zE/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746507533; x=1747112333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x0uhFJxbTknYVv8H2dzluonrWfElV8YvZk9w6Cc8W4w=;
        b=Hi6zDL+9iz4utq6El2ofdp3t0TPnL3lAIXOxTf4AmQmlc7iFDElZkmxfrZvllCB+I2
         bEYQ/LY8pzZn1c04ZdzPrZUSDGmLzPhrQRCH8Fnl+UHV4A3zBKYPLjpRcU0HqTXyT5ld
         cVyROqTBhaAfZh9pdBc2hJUvCauZjuBKnHne9z0JsDvdHe8P6NQJT9hd+26dGeSWXtx+
         +BrGEjNCqb0T7oh951KQDMbKdmi/qPA+toOx5aHubBq/kQgndvvG8D/I/yIR17eWBkEt
         KiH9/QcQDNJEzUZp5/H/WghqCuIr0XH1vhP+4Sjto8qOF8zWeH9OiswNLlMcu+Unmim4
         Fg4A==
X-Forwarded-Encrypted: i=1; AJvYcCWzhWdi1jDtQ98IhN8SfYMVCn3zDlAqLT9VWS15oUgQwpq/CIhoJTqRbx94LqFp6/sjL7/d@lists.linux.dev
X-Gm-Message-State: AOJu0YxYHZGACdenI12v3FqG15JXC5maABBAPZ7w1yVb/6zwPeJlWDmF
	VagVUvRJ9OsVxWW3IThBmb0UQDYtoJXwwgEL0tVnf7hXptKE+pyt
X-Gm-Gg: ASbGncscpsqVdCspaiQcQn4hn6PcAHqZUIifHLy++VS+0fD6Z1SL3UBHgC1nZ+Czyo8
	DAwy57lDRm0bX/4Ra6e13J22ub7EA+w8IJ3Bnasps6dpM/XftsZSC3ueCdHebevHcREkHOfCGvB
	3XFnMKKWsjTKYcWezO4vf7uZsZ0HcM4eVQrNcjGOUb66BrHkqrLz2JXgzHDF5ozCQziQtx7W6Qb
	4vRPEL001qcBzCWqU+oSC8g7YprFxH3TFC+B/FWGc8TEXoK077leV/woVHZyLmX4Zvsxqk/h+cu
	Ygy+r3EzjUNBWD9OvVBf28BA+beeG9uufFDMBFZFcedqcWMGuYHdop488uM1t8AWyzOQ2Dny1Re
	lG2MqB0yHQZ4WOxgP63E+W5zjBEIB+CM=
X-Google-Smtp-Source: AGHT+IGN3zEftKt67K/xoaMzkYgh96JRnQbI7cLMPphRjpCglGYRvDGswaB/FJEuaLY1BuA6/neAmg==
X-Received: by 2002:a05:620a:400c:b0:7c5:6410:3a6 with SMTP id af79cd13be357-7cae3ab386bmr1512267585a.27.1746507532781;
        Mon, 05 May 2025 21:58:52 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cad243f46bsm661511285a.91.2025.05.05.21.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 21:58:52 -0700 (PDT)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id 472A11200043;
	Tue,  6 May 2025 00:58:51 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Tue, 06 May 2025 00:58:51 -0400
X-ME-Sender: <xms:C5cZaKWk_-S0RPi1FpaUvgrPoDRn5XqxOGmi_g9orw6iHOLMq5TG9w>
    <xme:C5cZaGl011T8YBoUeSpj3A4NbgDvF0X87jv-eC_0e9CBILXLP8cYwQlk3BQW8xAWn
    lIL0TjtUF1J-CmlQQ>
X-ME-Received: <xmr:C5cZaOY-fwjOfb_BeH8-GvXC7jke3n9UwgWEyEN2YwI1HUOdB00Z9sdX>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeeftdekucetufdoteggodetrf
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
X-ME-Proxy: <xmx:C5cZaBXYm6Wv8qxnM7-ECRh-u5QSgVGsggkz9ktiFy5GkOsKG3ygSg>
    <xmx:C5cZaEmjHS3cGZl9yy2pILovn8Oj4g4GJH48McYWr-vCbfWiguMMYA>
    <xmx:C5cZaGe4hCwOG1awbKmZWLzkvFffrYeL7aHXxTsQ3ceOEREPlLpGTw>
    <xmx:C5cZaGGfwPV8A3kRxhrjVqFQcwLHdu5cIbJDI18H2bLyM7naGi8yfg>
    <xmx:C5cZaCnPUcbgLXZVDLmLfxlPFmeSpds-Myln6o8WbfEEPPKgYi7AOgg5>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 May 2025 00:58:50 -0400 (EDT)
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
Subject: [PATCH 2/5] rust: sync: Mark PollCondVar::drop() inline
Date: Mon,  5 May 2025 21:58:40 -0700
Message-Id: <20250506045843.51258-3-boqun.feng@gmail.com>
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

