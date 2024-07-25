Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D259913D8B6
	for <llvm@lists.linux.dev>; Thu, 25 Jul 2024 23:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721949704; cv=none; b=MCcW2O/wZUq15Uuq3VBcM4nOUeR4hua668r9wAOmquDLKEnzLMkIyMDxR+pxcEvmfw6ob4H+BrJVX13JLm5gMYMUjANQvb0f46nQd9MdCTQavr/y9SiZzh4VsrL8IQ4cMqGMETBxpOPAZ73ogsxSq6q17W3VRuWnH//WgTIFH5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721949704; c=relaxed/simple;
	bh=7x3vu+csCr30x1Vr+lgRWZfd/Py6AsuVqa90LWznOO8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=ZNFl0qkfTd5M/aWhhByc0r5jJhwuSmM0G/hS7GVKjN+H9HPYSiGHOWj7QXs85onGNbHMQ3NBEEj7WdJgb2w7cnMriAGPcxar88wnvVWA45oLNHJnS7Vk40E7AyIdvUsf5m2YZEtPPAUYW9bScryC/TKLPtEjz8a+mJW4SBYC3/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RQrtTXox; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RQrtTXox"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6506bfeaf64so33330727b3.1
        for <llvm@lists.linux.dev>; Thu, 25 Jul 2024 16:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721949702; x=1722554502; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FJ1LO01T/i1llNRTZp023NbVH2yKge4RNDbw7bFZMGg=;
        b=RQrtTXoxc3Mkk3NGSQCfZ8k8arC1tqJFQezmKJEjRWHIvUcLjTLrXnZJqOHmDIp0P6
         Dg5BISF2sYmgpAemFcNaPka2a1euPxp1DTcHBLkopXy7TX8ICCBtpAL6lbe7YQ7MKjV3
         eh8Licdhrl+tTPRa3rSOOdPq0DpsN0w6yz4ruGJc9fj8vIz+n5w7RmbfjxnbrZiydTMr
         UPSWj4vU7pNve9Gpsr/tvKe5ulRTQu5TXvlk+Bf8S4aUmo+7WZBhmWqlozGcPC9tVbgF
         Whc58lOqH5cSYRbh3ZvqypAqfJcqMK2dAw8bcsWJA65GsYGUlDmaKudc6DBzL+p5b7tS
         Da3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721949702; x=1722554502;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FJ1LO01T/i1llNRTZp023NbVH2yKge4RNDbw7bFZMGg=;
        b=r/4ZI9Db3S3j+H0iV4prbMUWO0HhHxn6tM0n34DRVkoWAQOjeUKspDpxaK+OrDjgyL
         62qYxxumyI05C4NUqgOpMuGWS+F0awN0Ae7ufvRyisPG/iZewrHKeQHiF7oq6yk/7GSb
         YhvGmz5Bx/8LNaKv3bTvNI7EXEsY9den/vN5H4IzLhWTHlnNwwQP3bK+NnLWtSQebU/1
         Pa3dkW4S/2kFuezy3KbVsd/Hof0LBWsMcQKPsihywHHReqb2kez6ByYvO+s+/QNs8Okg
         jz1lLk54ENqq+6LfKYanbHbY+jdMm/m1zZYI+QuwEXwzVJHnqg/fj9cpJfcpYBONuaV7
         X2pw==
X-Forwarded-Encrypted: i=1; AJvYcCUW6rqX7KgRRFvK0Xn5FXeDOt1qhgsvhcBaPSE/NAQDpLXjkPuiAiHIcIyUquudKjdWn03mOrM3mu7BMemOu3xZ5nbTLA==
X-Gm-Message-State: AOJu0Yz652VSNXHUjW9RVyM6XoRVMpWyQS1Lr5Ep8eTKNbJ3qQeXvUNC
	mz7/f4xpW2eb92PrMc0aTbvqBGsPod7TfYyx9MDTVX0A2p4WWJiW8d7M+BBdDp4N/Yg0jAOGIhD
	czGsGEg==
X-Google-Smtp-Source: AGHT+IGMAu5S0sfL6zr/Lp7MkrJhPg+rwTqWtMSnxzzkp+QA4qRkML9VkAlaF3MqfqfNvT91dBcVmWzOIng6
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:6902:c13:b0:e03:b3e8:f9a1 with SMTP id
 3f1490d57ef6-e0b2ca202b8mr14613276.2.1721949701550; Thu, 25 Jul 2024 16:21:41
 -0700 (PDT)
Date: Thu, 25 Jul 2024 23:20:45 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240725232126.1996981-1-mmaurer@google.com>
Subject: [PATCH 0/2] Rust KASAN Support
From: Matthew Maurer <mmaurer@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Nathan Chancellor <nathan@kernel.org>
Cc: Matthew Maurer <mmaurer@google.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Right now, if we turn on KASAN, Rust code will cause violations because it's
not enabled properly.

This series:
1. Adds flag probe macros for Rust - now that we're setting a minimum rustc
   version instead of an exact one, these could be useful in general. We need
   them in this patch because we don't set a restriction on which LLVM rustc
   is using, which is what KASAN actually cares about.
2. Makes `rustc` enable the relevant KASAN sanitizer flags when C does.

Matthew Maurer (2):
  kbuild: rust: Define probing macros for rustc
  kbuild: rust: Enable KASAN support

 scripts/Kconfig.include   |  8 +++++++
 scripts/Makefile.compiler | 15 +++++++++++++
 scripts/Makefile.kasan    | 46 ++++++++++++++++++++++++++++++++++++++-
 scripts/Makefile.lib      |  3 +++
 4 files changed, 71 insertions(+), 1 deletion(-)

-- 
2.46.0.rc1.232.g9752f9e123-goog

