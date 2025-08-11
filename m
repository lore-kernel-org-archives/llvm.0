Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8103B17B50F
	for <llvm@lists.linux.dev>; Mon, 11 Aug 2025 01:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754875194; cv=none; b=BJ1MsPFgf8b0CvVqDmwbqYdnDr6duO23qEeuTO74wI2RKDROtD46XzNVDoTRUksv28fXX+UhehJE8D9c/pOCBMjcPiqHuJlzxLe2KBYStEUhtPTfpEBG1ZQmtg2v6vl7cEY6fOrptgwCi9/yc0plm7GyH4CtIfckRuLPzpyadeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754875194; c=relaxed/simple;
	bh=WrqR1E+lwuj+usOuwVOVEpSZT5+J8H51r/sbYgj0naE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vi5i3byrtq3xW0h3h/u3azrfKB4uIKpdP6bI8P7UiJa5w37UqOg6O13F6cCBJHXKDvOiifqzwhGFas7HXKHcgt7Q8NaWaYS8wUTacPdIDldwvc4449bLAwZeTWGCHZQOpJWbLLDBhUR+vw62Dt9AsotRxiKN/wtPWFiNwCZQLUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fjQmGP7C; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fjQmGP7C"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6182b3218aeso773295a12.2
        for <llvm@lists.linux.dev>; Sun, 10 Aug 2025 18:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754875191; x=1755479991; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qkeHcyxJkTHYSHNibW8ssztQBo3aMnnMqKla/7jGqlw=;
        b=fjQmGP7ChI8l8plVMUAiCGRquHLPl9OpjqwHSfrVaBdtdQs0nFO/qzydGN4Do7hGTy
         rcW7v3NVs16Xrm54ywzdhBJIY5OBa1os8VjlwFcEQ21VrwYAkCBA2N+w6vW/zyLApTmo
         AYgWiwGlMR9bx+4VvMn8C1lLnJdstTDWm077hX7foE4H7WDP9a5ZXUhJj/etWnRCNmYF
         VeHYZNlYeYMUxDwUKpKKUMBzFmywTdCzr0Ntb/KgnkmFKFS1cJmPA9pBn0Nlo7dYT4aV
         i/lDxHhG5TiyvC4pWojVP+HTICS9h7DXZqIy4aHBNKJLobXOradUPFDlcTN8dWAOGd0o
         EH7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754875191; x=1755479991;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qkeHcyxJkTHYSHNibW8ssztQBo3aMnnMqKla/7jGqlw=;
        b=KThz4RC8rhB498OSYAFr9GI9xpDWlwQFtDJppISBjPlXbth40UWJv+qnY1X00AeqBI
         9L5PUyQ/vVQUnWlwLpNh+VKTHQT+l1+ktrzggXkh/M8HV5rVhZYFrh2F7on8n8cfdlSa
         JlZ5ru/v/WQh5n4X0xwWMsZcRkD0aMu9LrFRBbZL/e90poffhGswHbyU9oSobjNJf5pL
         pLEPbGMMFRiuLYzYt18mZF49sipfVkOmtCS43AKsxHXopAsv7HqeAlEFQ57IxBzcbHOx
         aztAQwofOtJ49Hp7kzubueNwGs6s/vmNFbbLBIcY6H6XOW0O5tMpDEFJQ7XzwNwjZh6U
         7kAg==
X-Forwarded-Encrypted: i=1; AJvYcCXzyO2RJ4TaFdlmpWT0j4popoPboNvjzxh1CxxFjpz3JzxLYH3ytm9mR4teJc1/h8C+u6np@lists.linux.dev
X-Gm-Message-State: AOJu0YxuFmP7mj7msJWpPufsfySKofuzb383akmQqq9VoIfswc1YhK6v
	Co0x8g6eWr8dBlKvT6X7SQ3Q4jjHoxyBjefNfnig1QIoMBp3e4kuyMMD
X-Gm-Gg: ASbGncsjD0VCnc4E/gSHtBB36++fbX7n6JaNnZveii7F2BBtdHJdpxYgXLnU1WhwCqH
	wvgK/MK0uivvBv5WHCVmOgk5E/f1NHgPVVpisnlwpZ0bSLP6mxk2AFPE8djotXwPzHNPt1ZRn5v
	ZNceVfgwVeFALKuS+9YD76DNJYBcckYs2EC47mbrph8+0gEzcdh1Nuw2hM1OETy9tNkUf38QqYj
	fBcvELD66M9/J+BFZJ51rlQeWPWyYIUJB0Pz5XZ+6D3N+st7DxWDjUp01wbpePjz1R4GcSoILaU
	rvXaGq1BA4pFtoQeVPaWlCLNRpIm+5FAn1Xeu5XX7SvjQGKsOAZ8attZXw12vVUjUr3aSehEQfW
	/JS9eEryeJ1I7AUKetSg8ZYeFrbjiMOmCAzw=
X-Google-Smtp-Source: AGHT+IGHeFsBy0ZMfEksdIuPmJB8a8RALCdpok1GmhlMEKrmNokPHN8eNrX+hb1xtNNVF84odqNV2A==
X-Received: by 2002:a05:6402:3483:b0:618:196b:1f8a with SMTP id 4fb4d7f45d1cf-618196b217dmr4253122a12.4.1754875190610;
        Sun, 10 Aug 2025 18:19:50 -0700 (PDT)
Received: from fedora ([2405:201:5501:4085:eece:e0ff:6b68:de2e])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8f17829sm17381133a12.19.2025.08.10.18.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 18:19:49 -0700 (PDT)
From: Ritvik Gupta <ritvikfoss@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Cc: skhan@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] rust: kernel: cpu: mark `CpuId::current()` inline
Date: Mon, 11 Aug 2025 06:49:58 +0530
Message-ID: <20250811012000.444173-1-ritvikfoss@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When building the kernel using llvm-20.1.7-rust-1.89.0-x86_64,
this symbol is generated:

$ llvm-nm --demangle vmlinux | grep CpuId
ffffffff84c77450 T <kernel::cpu::CpuId>::current

However, this Rust symbol is a trivial wrapper around
`raw_smp_processor_id` function. It doesn't make sense
to go through a trivial wrapper for such functions,
so mark it inline.

After applying this patch, the above command will produce no output.

Suggested-by: Alice Ryhl <aliceryhl@google.com>
Link: https://github.com/Rust-for-Linux/linux/issues/1145
Signed-off-by: Ritvik Gupta <ritvikfoss@gmail.com>
---
 rust/kernel/cpu.rs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/rust/kernel/cpu.rs b/rust/kernel/cpu.rs
index 5de730c8d817..cb6c0338ef5a 100644
--- a/rust/kernel/cpu.rs
+++ b/rust/kernel/cpu.rs
@@ -109,6 +109,7 @@ pub fn as_u32(&self) -> u32 {
     /// unexpectedly due to preemption or CPU migration. It should only be
     /// used when the context ensures that the task remains on the same CPU
     /// or the users could use a stale (yet valid) CPU ID.
+    #[inline]
     pub fn current() -> Self {
         // SAFETY: raw_smp_processor_id() always returns a valid CPU ID.
         unsafe { Self::from_u32_unchecked(bindings::raw_smp_processor_id()) }

base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
-- 
2.50.1

