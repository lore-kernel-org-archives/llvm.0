Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D282D35977
	for <llvm@lists.linux.dev>; Wed, 25 Jun 2025 05:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750828527; cv=none; b=J++XARSjAoUXDTXNQQ47442BKNSxfWVkmcKLuzBj+AOvB9MAfJabyq+fJtXqjDEY6bdLiT0UY/2y1CR3RWavQQSjgI7Slyqp2PC+VdP7GUMCl8D/+7S5+wKetV/xcbdMEivXL1r8L6dMp3V0ocuLHFF1oLTEje3IaAR//zlh9vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750828527; c=relaxed/simple;
	bh=lEdzcKED8dxibbdj4USCma8xOMOqMEjtizIV39k44XQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hxrIXhY6UYbev9xYwN6cnGIye+fR5i55UVNebbcVLffNvbGifxTsWjiPJKWi+V0ZrLUYEuC9T01lMpq2hiQ0HWlu92TEQ+zMhDld6jd3DLE5DtgBXLH6tkkLecDt3WmV6Xjxk1MdMSSCQTMquQ6SBPTR8QVqzsKW7ZYRdssIktM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bf1X2RO+; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bf1X2RO+"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4a442a3a2bfso98787471cf.1
        for <llvm@lists.linux.dev>; Tue, 24 Jun 2025 22:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750828525; x=1751433325; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7bZLeeq5Dz3WES+/TzaEncqzq5j376rFHhQoBFa1jdI=;
        b=Bf1X2RO+5/idH2a5oOc830bcOZRtqhyDOozl6gyTRIxX4xSgjtVh/nz8AdrBQigdmG
         9IWt94eaS9OTX17BytXnFM5S7P08YrI3p8t2yO4kgP1it3C+6XSahsy8LVwVmCh2198i
         u61qEX87NXRCGUZo6+y+grduHlFb32mofpAg3WNZASp2HfwJMUN1Mv3FQjE0I2vHVhr6
         HElpPDm34x+8EWfVrXuoWX61P+m03WcM7MFP6/A9YmOC4/nz+AQAai8Z9MnRKgxCwIO4
         gl6+lSY0ub0LTglxgm/6fxtWoLGCE/xgmEsSNuMfT/vot5jjMpRQ9ipnIg3o8M5UIHAm
         gXhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750828525; x=1751433325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7bZLeeq5Dz3WES+/TzaEncqzq5j376rFHhQoBFa1jdI=;
        b=HnMXIJUACfMKUe//rnKlJcTL8QnBgbfj2mAGsW06J7tgsDdzdILuHnce+71SguWaUj
         dN4e+yQb8QxVTjqq6phuGRu2EZsR4snfC9pgcnr4AkR4RT+VulkI5+TiM2EqK8R6qsdv
         tpI0a+iq1sTqBw88CZ82l31GCKMk/kUi5xXbb+lsHIk2gvdig+0eMdQZIN8uLpL1I2+n
         9bbFzfjQ612M2PHA1cdw9ZDmwhYOybJ8QWX+zOSmzuRNj8ipiaqfZqztkctAb96lKVat
         SyyCXyBaLYhzWfBJlx4s9/1B1k2ecFwRQ3IZjkKEOfoQsVjPkRKqj5eWL9IP+HSyCNHZ
         EOWg==
X-Forwarded-Encrypted: i=1; AJvYcCVnMIZv5DzBTzKXmFmgB2R4NUKel7dERLZvi8D9OrKi2B5WycD1Axei/+T58RfZq539sF55@lists.linux.dev
X-Gm-Message-State: AOJu0YzWu0+IQ9c8q+BCW6VcW1MV5OwX32VtD8bLkLV3Ab0G2c158/z0
	oNIFGJqRGYN1qnc1L2tLm3tY2Hk0h0elvJ+fSuAeBavt1+O3i3F9Rt3L
X-Gm-Gg: ASbGncu8uQmkFg6tzI+qzPjFit/NlzJyQsv/l2cngMBaHLqRjRP80P1FD7touZLqTdB
	M/PxFPvtB4pWedLtCOmpPxs14QnvRT15gKz1XlethGtNA1ZCh9LHyQ63ec3UHGXgfoADXOqRujZ
	pj/w3CaQ8I0UtjOo55q4ggJhVmiEveHU2iLLydcMRFWQ+uC/SU0vku7dZND/gW6pDvGcjs4qcov
	rl/qEU9y69V90wuutLSTqOiPpBVeXgo2cYJDFUM2zLDSMI2POGpSpPOMEZuIgAiAobw9Fr3Yazu
	ivdMsqua1z6Kr1Pg74N4LOefnxGR/Jk4qKKYgLsiP5Px9SpvB9t8aI3PMQ1muXrdz+i1HzTbsu0
	b9N+Qp1CbSaHDMnQSmTasCTSnu4DUEp5lIp3cx0FM5Ezn3nU0TKCf
X-Google-Smtp-Source: AGHT+IE2SfyLvxx5vwTElEiNwcIFf2JWsRpHU1DfZP76EL4jxeoF0N+a/gMV3qVAhjt9uTcdmO/yfQ==
X-Received: by 2002:ac8:5ac9:0:b0:490:8ffd:8f02 with SMTP id d75a77b69052e-4a7c088b839mr29342211cf.37.1750828524322;
        Tue, 24 Jun 2025 22:15:24 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a779e910c8sm56018511cf.71.2025.06.24.22.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 22:15:23 -0700 (PDT)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 0020AF40067;
	Wed, 25 Jun 2025 01:15:23 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Wed, 25 Jun 2025 01:15:23 -0400
X-ME-Sender: <xms:6oVbaLBW9vr1AiJF43xvygKBNooMag5P0I7YsTbWMMu0xgE9DMLB0w>
    <xme:6oVbaBgl-_7ZHaeMLnfyP4nMkAqANMw4Cn9Ar2lgbLM56hFXfsDkunKYBDUSIJ-sG
    tL-zIeZq4RsUtdiaA>
X-ME-Received: <xmr:6oVbaGmzwi16tcT0BZc4I6YFdTp94yaRxSyoeLaGs3RgXZQoOKYitMS8Rw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvudeludcutefuodetggdotefrod
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
X-ME-Proxy: <xmx:6oVbaNwlxiA3e109ZKzf7VXozS8kbUjZSekljxJ2vmO_GUUTjkY3Ww>
    <xmx:6oVbaASLdeV16iYtImGS3JVLTbtzQXYg6lKoPUAEexpSFSSG9dGgmg>
    <xmx:6oVbaAZliG46lVdVZzxFIKr2c9AH5CCFZi9NXQKm8Gq_lei439V62g>
    <xmx:6oVbaBT5-2KzGicGkQ6i9AAVdejY9453Wq1LP2JQJfw4ZYAwJERoiw>
    <xmx:6oVbaGDSMYbleIxZ_zmk9prxOh-a3y1KIpoCTehORRFChIIArslFrSCA>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Jun 2025 01:15:22 -0400 (EDT)
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
Subject: [PATCH v2 1/5] rust: sync: Mark CondVar::notify_*() inline
Date: Tue, 24 Jun 2025 22:15:14 -0700
Message-Id: <20250625051518.15255-2-boqun.feng@gmail.com>
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

