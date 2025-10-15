Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A601630E0E3
	for <llvm@lists.linux.dev>; Wed, 15 Oct 2025 19:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760556310; cv=none; b=c6I7/GFs4gzb5xz74Y/1egTS7zBujpIjxGAIi6WXih/m9auwnsEwf9hd7nKLwzy4ceXHEteZ9GWSIhkXdfzv2hqCEpZh+Aj9PSDz/c87/P/s8YLMloUebhhbYFHlFOeRVrIw0Z3VZCDDlsrfgqBlfkZ2vcalSuLGp39NJjkSMPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760556310; c=relaxed/simple;
	bh=Qn1W1cp+yTwc3WIdXx1edrK3W/vliJQWYr2kDZAgGBI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QS/voY23h3Vv7TmEnzQ7GTodhj6XtA5BbtgmzYvRlNMCRtMdiDtxJ28wb8egfPoH7HP5xmI3YXxOyH63Cq/18XAaIZ2NhVOgdh2hv29W79h96McFOq33qH2fcawyA6PtIEoa84GmayL3dNZlwyUg+AHBQDWs+cMTSTpNMKPTna8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VBLSZOZ5; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VBLSZOZ5"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-87c0ea50881so5028946d6.2
        for <llvm@lists.linux.dev>; Wed, 15 Oct 2025 12:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760556307; x=1761161107; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/z0UoCENjvPOzaJ7c22Y9TSWGsGdKl3uaGJR5NzjspE=;
        b=VBLSZOZ5Fz7tqDlHp1se+Eyl7f73LJNa1QV92gY92qTrYtOt9Qj6A/PavZzvBed+Cy
         xFzWyC90hzSgvt5hJh+guHf0qX9rNGTojEFnWaCK7bvftym0yyZnnA9n0BqH/ODVR0Km
         N9BQp7ahXZ4LpqpLtcUqnFSsM1vCoyPg7SsF0JgRrAsHvIlT21i9BCLG7ju0jgcj7yAS
         2uDE+O+wgG88Qi9qH+mM5mYG6cYy8WtsUVwPM/xRcIPVUXV27SmouVVTsjMSpvQ/HebJ
         /dHi/YN8oN96fmUz/q/q9dGWFOab6ogAf6vdzR2HhuyseDoxrN2sZ3kXgRvOlivUeM0m
         ZouA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760556307; x=1761161107;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/z0UoCENjvPOzaJ7c22Y9TSWGsGdKl3uaGJR5NzjspE=;
        b=lzLSFA9BA6RovjhNhZ6Cs8hJ/jLS2U7oF7sPLHpzOB76NBojQBI0hUbYexP2ypZDU6
         w60dVH1UyKSTq4dXY0ZLsN+fnS1pnb19KbkGo8d5+pwrRBkxpY80ZRuC55LXXY+SEZ6o
         HxwRAfjRNML3fzaYc3+4X11gCZAA4MHPs8I54nTEXLOv6tDqPQIP1y4C62Y79lt2VaFf
         48bNGrCLI0kkFWxIk1YXzF1S0u39jLRIpOxJpQZbkYXpF2LdHcjf+kYuv+v6n1M3yt81
         0M+rpMW3Ke1U7RZvsvUjGfl2s9HWb9kYTIoHyLgWYp20hd43loqixov6FtC6oMIKm8pV
         Xl9g==
X-Forwarded-Encrypted: i=1; AJvYcCUWMvivQTJkb3W7Y2fCWOk8sFns5NyarI21MP7U+Wem6McNVbiEKaXZbEaeginnjy5/Lmy7@lists.linux.dev
X-Gm-Message-State: AOJu0YzjtE6rbNhkgP4SCef3ANG9JcScFN2fR0bLCQFhIyO882K2AE40
	NnFAxGiHys+stVP61BlmWay7c8WD6rTIy9g8XgvANCwv1SVYaYS0oC5Z
X-Gm-Gg: ASbGncsD0CPSkVZ5U0/sJz1/A3yQ7q6pNVUqZAc8hjRTrhCm8lrOljIS9/oFbIvPujT
	ZsFX4VwTpw+w2WRwLkDbI7br+V1oEO9epP2VfypFRlbQjwgKpBFlNqEeh7J+7H0NrY2/VnRtqKZ
	k/ZX4fZ1jozetvDqd/cLUNSaFhINYTzflejnxUHLJAoMibiVXR4DYfOWp//W6ZfnULlOkj30CW/
	mJnkuAxnfsaBpb5dM0EcZxGAOzn/rauCb6Lz8UmPartRjpn0S8QCxsk918ox0jaCVo6gTin2VdS
	jzzuf1julx/2TzncJ6m4haAKh6BVTVV8+b7UgwQZuWmZXUF4ZwZvNYvp3/5IrwK9ZiNdreyiQK6
	9fNYm7I+7p5WfpA6AROnyTDsE0XPq2rE5Gr5HqlBIHPAIz/7VwaEBIZrXiSYJ1teBl7BsxyFV58
	4LuM0j8GD8Z8i92voqzs9Zd5twI+NhEB8F3l+xKkEvQgNwS3Do0DFG51+qQifIcYFW50VpwT4rN
	Lqe5PlFX6/xWLRsc4OuQsYRt6KsHZU7alaqXUDY1cE01JB273zizWena/P1b3tNjUBQULd9EQ==
X-Google-Smtp-Source: AGHT+IG2tULJ6h6PVvWUIOB2ZFPRQKa/V9qgfB8TRjULEb+0DCRZ6eO1hx3aZgOim3FIHrolDm9d/Q==
X-Received: by 2002:a05:6214:27e9:b0:803:3b8e:e9a5 with SMTP id 6a1803df08f44-87b2efc2c78mr410404166d6.36.1760556305773;
        Wed, 15 Oct 2025 12:25:05 -0700 (PDT)
Received: from 136.1.168.192.in-addr.arpa ([2600:4808:6353:5c00:8573:f4c5:e7a9:9cd9])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87c012b165asm24076996d6.59.2025.10.15.12.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 12:25:05 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 15 Oct 2025 15:24:33 -0400
Subject: [PATCH v17 03/11] rust_binder: use `kernel::fmt`
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-cstr-core-v17-3-dc5e7aec870d@gmail.com>
References: <20251015-cstr-core-v17-0-dc5e7aec870d@gmail.com>
In-Reply-To: <20251015-cstr-core-v17-0-dc5e7aec870d@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Christian Brauner <brauner@kernel.org>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Carlos Llamas <cmllamas@google.com>, 
 Suren Baghdasaryan <surenb@google.com>, Jens Axboe <axboe@kernel.dk>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Uladzislau Rezki <urezki@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-block@vger.kernel.org, linux-pci@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1760556295; l=1147;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=Qn1W1cp+yTwc3WIdXx1edrK3W/vliJQWYr2kDZAgGBI=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QPq4IgijUUTbPqcb/sFKSMvqN+uNEx3DeWVE1av3DAj4osSldGBCYfq78JujAqGy30VkSuPwWuG
 OpXoXaJlyWQ8=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

Reduce coupling to implementation details of the formatting machinery by
avoiding direct use for `core`'s formatting traits and macros.

This backslid in commit eafedbc7c050 ("rust_binder: add Rust Binder
driver").

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 drivers/android/binder/error.rs | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/android/binder/error.rs b/drivers/android/binder/error.rs
index 9921827267d0..b24497cfa292 100644
--- a/drivers/android/binder/error.rs
+++ b/drivers/android/binder/error.rs
@@ -2,6 +2,7 @@
 
 // Copyright (C) 2025 Google LLC.
 
+use kernel::fmt;
 use kernel::prelude::*;
 
 use crate::defs::*;
@@ -76,8 +77,8 @@ fn from(_: kernel::alloc::AllocError) -> Self {
     }
 }
 
-impl core::fmt::Debug for BinderError {
-    fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
+impl fmt::Debug for BinderError {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
         match self.reply {
             BR_FAILED_REPLY => match self.source.as_ref() {
                 Some(source) => f

-- 
2.51.0

