Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D94C2248B5
	for <llvm@lists.linux.dev>; Tue,  6 May 2025 04:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746507534; cv=none; b=oM9l61LyTFA5ljABQE9f9QLvyQKEMoruboYaBZ52kCCkvlYlIv4tzPRNHYnM0Mnnp1IQ7VmPMcOiLN5Vb440uW551wLD6WEI0NR+BAcvJ3bjlSSONmlFnaYYw/fhQn3sEPiYj/a7nNsz2U5qIigfAhktCIJIPtEVyxBSp4b1vFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746507534; c=relaxed/simple;
	bh=lEdzcKED8dxibbdj4USCma8xOMOqMEjtizIV39k44XQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NbSEyhuToavrgkDKMuaIjN8IY02yFgSiDmlUi6d8wlIxkvtknA013rCm3VIxR9bfs5JldEv4Y/KQC2nU7CDd6GBxmEvqxXKg+r/qAIefHFF0AqO14fOI2TbhXGTUfpBNFkLLKBwVekGMldsRkSR647hb+dhyxsX1KseZgC728AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZMYPmbPN; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZMYPmbPN"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6f53c54df75so1653806d6.3
        for <llvm@lists.linux.dev>; Mon, 05 May 2025 21:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746507531; x=1747112331; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7bZLeeq5Dz3WES+/TzaEncqzq5j376rFHhQoBFa1jdI=;
        b=ZMYPmbPNe/yp6C4/miuEE2G7i5G3ejBWMIdHuEK1ODMUvdv793AzvYldFBc5FzI2/g
         rMafhN7kMXK5jYiencBc2ud90wNCatYMt8B4WVedh8imbCfS0yRmEKKfgtZWLgDAtoCZ
         RV1xE/LlVaEhMfJonbzBcYogdgIQslRxpHDIcVVTcxwi7HR1RoZCEsPC5fw2D+y8QaRs
         fE1s7utd8huKkaq6BqrddMWs8/wxgWJRIiVaS5Emw2gUFTRQI1VuUbmojmr8T1ucFPRq
         wLv2TCDhEGGbI61OK6VzLdS2hVU3GLa13USpKYNDmTw+yIG7hF6ZLEyU5rgcvllq36qZ
         tRlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746507531; x=1747112331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7bZLeeq5Dz3WES+/TzaEncqzq5j376rFHhQoBFa1jdI=;
        b=uFK7Cf5Dsq76eC6vB9F6TbbTnXp2FtQ9Su/No8jgG94f50ISl+lcUuDZIgfaZx4SWO
         TgZfWAQRzohpIrdvVxINT8OBCVHllBrXPjPN8U5GGSRK3ZSCXo0TLSpZA3IRljcLoMRg
         osV3e1UJ3TCkBIaO7IM7IFTgunV56+B/Glekb0X4HLakFd3Cs2VsoD5cXVO1wEFZx36w
         vAfV7Cn/U+tTkINGDAV/jP2gFjqQjaKUQR8z3FuLvEINf/Lva6WpkM+ZaW6Im/V/Wq4L
         5S5Y9B8hPdbCTGWiXua1DD5wdpkqpUvJrDdslCZWuJmHcX01LM/zHfVOKfwCAwZeObEj
         ixAg==
X-Forwarded-Encrypted: i=1; AJvYcCWt0Erc3zqD4/+K8U2NfRHa7MiF2xepF9ToPoH82CFjGg3sUb61f9u9XnpSyrQZzDInG+0M@lists.linux.dev
X-Gm-Message-State: AOJu0YzyUeDRQvwau8bUuQi6/TRl4qWnh3aCF6qh+BCwJHTjRc94ifMH
	5kLw8T3N9rjVdeB8nLPdntZ+bYOtFuCmui8AmA+qcb+HlIAR1dnV
X-Gm-Gg: ASbGncsTIRDcDM0UbAAwDeIXD7sd858oxknegrD7HxmIdXLuf1sexFe983NoWBTR3tQ
	LxFqhob/tT+dfZgpjKJkGHaFFoV6lTJgXlTNdPzjtd7G0kieID64ZQskDfchyMwJlRUQr3quB1G
	UmnZ94bxBCc5JOE4kgrf2W+mKwiRv1yq+s/hdFwRtrvZOb8HDML7ZQhky2/9TmIiMSKloMzyWSZ
	wRxGzr8kQervhc271GxzWdrbDGIywfoSMsP9VBYWavmIoh4KdJtSbSgGDao6f/abmhsP7wBBc+s
	/tMUDKTcgjsEkMszYSx6Ts0e06IFOdRt7+oXX6oB8sLKhB8LyLTu0QKjqdkCtazGyWUqE5Z2CID
	lpXSKqLmt8H1a6AqX2WS17zvgfecy2G0=
X-Google-Smtp-Source: AGHT+IEjhbTiYOsmtBCisQyZq1Vbn3IcdJP3tHhEgzvRz0gIG9zkwjhO/vqY8tx/UqKV8YNaJ3sFqA==
X-Received: by 2002:a05:6214:5016:b0:6e8:f3ec:5406 with SMTP id 6a1803df08f44-6f5353e889fmr43075446d6.19.1746507531269;
        Mon, 05 May 2025 21:58:51 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f50f49c965sm65061526d6.119.2025.05.05.21.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 21:58:50 -0700 (PDT)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id E5A421200066;
	Tue,  6 May 2025 00:58:49 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Tue, 06 May 2025 00:58:49 -0400
X-ME-Sender: <xms:CZcZaOguny9nVYGEMGa7FXE0Skd2X3TJr_o0sKj-iui70fpXdp_zeA>
    <xme:CZcZaPCEwQDNOrRRFOpALgEirAZdKt_503Ga66b1P_5HUGqIQWrSZxg94DAMbdKGN
    3iMZXzXKa11ZcIoFg>
X-ME-Received: <xmr:CZcZaGGSddR5uvtczkiy25LYMNYPajONi7alx-ClRSalWjlEcBJbtLV0>
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
X-ME-Proxy: <xmx:CZcZaHTl4Wt2ZKl7kEEMllRDGUf8YqIemOwCWV-qQbCYmm-0NnJP-A>
    <xmx:CZcZaLyuiD71sLGEdptBCHr22yWC8oWn2gXM5itPxZ2d0gQACumX2w>
    <xmx:CZcZaF7qZQux7YK0flQfvRVke3hoXrJ0Nw5q40UUpcpoFQAW4_gQNQ>
    <xmx:CZcZaIzPOnAuxMkBx9eMueBJ8YyAQ705WQRkYg146alY0fwHdu439g>
    <xmx:CZcZaHjzQmUdY0Z680tReLJoZ4rKWmwV_cgkL8vLADzcf7TaYs2hHYTY>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 May 2025 00:58:49 -0400 (EDT)
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
Subject: [PATCH 1/5] rust: sync: Mark CondVar::notify_*() inline
Date: Mon,  5 May 2025 21:58:39 -0700
Message-Id: <20250506045843.51258-2-boqun.feng@gmail.com>
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

When build the kernel using the llvm-18.1.3-rust-1.85.0-x86_64
with ARCH=arm64, the following symbols are generated:

$nm vmlinux | grep ' _R'.*CondVar | rustfilt
... T <kernel::sync::condvar::CondVar>::notify_all
... T <kernel::sync::condvar::CondVar>::notify_one
... T <kernel::sync::condvar::CondVar>::notify_sync
...

These notify_*() symbols are trivial wrappers around the C functions
__wake_up() and __wake_up_sync(). It doesn't make sense to go through
a trivial wrapper for these functions, so mark them inline.

[boqun: Reword the commit title for consistency and reformat the commit
log.]

Suggested-by: Alice Ryhl <aliceryhl@google.com>
Link: https://github.com/Rust-for-Linux/linux/issues/1145
Co-developed-by: Grace Deng <Grace.Deng006@Gmail.com>
Signed-off-by: Grace Deng <Grace.Deng006@Gmail.com>
Signed-off-by: Kunwu Chan <kunwu.chan@hotmail.com>
Reviewed-by: Benno Lossin <benno.lossin@proton.me>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Link: https://lore.kernel.org/r/20250324061835.1693125-1-kunwu.chan@linux.dev
---
 rust/kernel/sync/condvar.rs | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/rust/kernel/sync/condvar.rs b/rust/kernel/sync/condvar.rs
index caebf03f553b..c6ec64295c9f 100644
--- a/rust/kernel/sync/condvar.rs
+++ b/rust/kernel/sync/condvar.rs
@@ -216,6 +216,7 @@ fn notify(&self, count: c_int) {
     /// This method behaves like `notify_one`, except that it hints to the scheduler that the
     /// current thread is about to go to sleep, so it should schedule the target thread on the same
     /// CPU.
+    #[inline]
     pub fn notify_sync(&self) {
         // SAFETY: `wait_queue_head` points to valid memory.
         unsafe { bindings::__wake_up_sync(self.wait_queue_head.get(), TASK_NORMAL) };
@@ -225,6 +226,7 @@ pub fn notify_sync(&self) {
     ///
     /// This is not 'sticky' in the sense that if no thread is waiting, the notification is lost
     /// completely (as opposed to automatically waking up the next waiter).
+    #[inline]
     pub fn notify_one(&self) {
         self.notify(1);
     }
@@ -233,6 +235,7 @@ pub fn notify_one(&self) {
     ///
     /// This is not 'sticky' in the sense that if no thread is waiting, the notification is lost
     /// completely (as opposed to automatically waking up the next waiter).
+    #[inline]
     pub fn notify_all(&self) {
         self.notify(0);
     }
-- 
2.39.5 (Apple Git-154)

