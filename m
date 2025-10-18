Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4582C21E8
	for <llvm@lists.linux.dev>; Sat, 18 Oct 2025 17:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760809556; cv=none; b=daVUAuBxdIzxgEstE1Y0s7BzWrAGgTR+WgOQCI1IZLuPTMCcQ8Ep/oxDpvTl/lSVVlFsU5i23NBTeetUeuqvjTirXHeEugTi6oBGdQ8lN+P8tZU8bkc733DTB9KdFp31wu8L2V0qHwhpb45+NGKDLthiZv7z5k8Sne7VYte6RU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760809556; c=relaxed/simple;
	bh=VZx3xyzuE8sdJWwvMWeYLSbsWBC7U7VUNVHO5x1zs/Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bdsq6Jwcspcs8IJnhMLd1JVEAhiO8JjtYs77WiIbb0fctaQCSv2K6Z+3ZsWboooLzJi5+0V9McIT1489y5KqToVcj2B9lgvqjjE2+GsKe5dWfT4Gkm1JlTFF9MUQOqorpyEm3K+3uaYzTW6Ef6suSXz6TzeHlF4Sy0OiKiXYtvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j8XlMtj/; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j8XlMtj/"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-87c148fb575so47696116d6.2
        for <llvm@lists.linux.dev>; Sat, 18 Oct 2025 10:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760809553; x=1761414353; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rhXSu5jvbOALYGh18N5SGleu51uu827FBi1PfdDv9uw=;
        b=j8XlMtj/CHxa0MXIyMqnQAbanG3e1s2fowU/VP3C3KsfwnswtT+NxC7oVcwJsbspk8
         S1mLIkD68kHQc2anN46CXxn8BKApHws7h+//V4DI/vQzLpj9PHt/5D135pi+Xz1xEmgY
         Ri6go1enEem5o0M2WDqevdJ1JEAbVNpeugna/ZMzK7C7caCPIbZmaOIAgIqA7Ns2V/Ft
         WKnViZM3npk/nkxhT33BS0eEEDCk7Ao1GLD0oG4xOP6KvEYQ9b5jCxN6D0NBZPrmmm5e
         fp+JzNmCDPgz6/P7BaGE9YKXJ/uzNlI6rGU3Ee4EQ57LEfX3oSuZh7ciQn7FOVDTpQsb
         7RNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760809553; x=1761414353;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rhXSu5jvbOALYGh18N5SGleu51uu827FBi1PfdDv9uw=;
        b=e8iA4N12zPMyH+/iH+qfHCgn+eSR10rflXGMdZSs6OSlJNEniJ94FVAUwwF1no1VLy
         de6i7UtQzY3OeQGDphXKSlDSDMpyG4W9okwndHwtrrOiV1AC/Chaf9yiTRFgN9kFbKym
         TnVJfSOGlS55o5e7/S7iEh18My5VuN2SG6YFPaud5xgN56AaJgzhIbs6OxUg42WpPzLW
         rUsW5Nyo5FOFK6ysOUGxn0UWjRV/fPg0DBGgr5aGNuGQ9+FqTCm1VYgBLPmWBDudxaBn
         sk6ztP+k1Jb6kdAJDr6wrrMBr12SQp9a6B70xc35PvLyFxSudszKc8eg2AwkTiFfp7hL
         DtQw==
X-Forwarded-Encrypted: i=1; AJvYcCU5PxneiiEhrTeMzWBmviGH5eUByvUQjkOXNPQvhaROHs+Q6LdGbYXyeednNRxjHWTGztfY@lists.linux.dev
X-Gm-Message-State: AOJu0YytbZEmW/WpmjRRw18QZyq5Ltv8YkMlKaEY55A1L/Es3KPrZpzZ
	iXBa/daJbdY7NBKyzcAzsIfdzfBGwhHkAMBE9WIqcUbYWYM3aMymAeiq
X-Gm-Gg: ASbGncsq1helXgs3rzb84UT0alg4vdZjJXRmobNhg+1EoYOEZSSou1Z+bxMFcNrro5b
	NK9F2tJJe2bDYeAabhga/g06H0yBY8RCfEGdrWR1uTk86tTfKiT0OHjC7Ljc/l6SEU3rBwhXDz6
	8pyW9zS6tqHl9dPMyJUaZ7ViTzMpgleXuPpn0sfaNi/cSAFw7hhkN5ZIuWOi0FxaJeftVyfQEfe
	qjWV9qfYKsHRkCljRkNoR7FiyNHz2RVeIwjUudSd8iAce3j2Kaz4JMFwz3EeQy/LJTF45nS8TMm
	GykdJQA7yNDEnspgJ9oaolm5dSOubDjduNyBXWCgSEjZ95Pfhx6AWvEfewhEKKy7V0vIjgXESuE
	d6ws4B+QcR5FxUEPX+YbWHFD8barFhTbYnQIXISIbCsFcBLYoB687xITdbmcuub5qRl5BKn0fjj
	EoZaQDloEAYeXLzPAoMqgyg74WLJfZioU5LBVIf/ZqTz0loYeqlFSaiw4dLBnCBMFxrAvWxSSIl
	n7k4ULQdDqqFCY3PEH/MCtCb30gQGyRKql7NBO37BxMgWRlY672
X-Google-Smtp-Source: AGHT+IHwmbCilEbE3X/epDbrG5LC82vpTK8X6AnN2QSsDBY9zv0L0DqM69lN1FMFmljkUNXxkq4AOQ==
X-Received: by 2002:ac8:7dd4:0:b0:4e8:96ab:da8b with SMTP id d75a77b69052e-4e89d283014mr129620021cf.23.1760809553435;
        Sat, 18 Oct 2025 10:45:53 -0700 (PDT)
Received: from 117.1.168.192.in-addr.arpa ([2600:4808:6353:5c00:1948:1052:f1e9:e23a])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e8ab114132sm20445161cf.40.2025.10.18.10.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 10:45:52 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Sat, 18 Oct 2025 13:45:17 -0400
Subject: [PATCH v18 06/16] rust: alloc: use `kernel::fmt`
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251018-cstr-core-v18-6-ef3d02760804@gmail.com>
References: <20251018-cstr-core-v18-0-ef3d02760804@gmail.com>
In-Reply-To: <20251018-cstr-core-v18-0-ef3d02760804@gmail.com>
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
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Stephen Boyd <sboyd@kernel.org>, Breno Leitao <leitao@debian.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-block@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1760809527; l=2039;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=VZx3xyzuE8sdJWwvMWeYLSbsWBC7U7VUNVHO5x1zs/Y=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QPuKAuVf9GfET2NKL0q4bp4Tc3Ay6O1rJo/qozL6xioRoXG7kz7tkE7k1hDE/ytV5U50M81wQNc
 BkpwRYc3KSAs=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

Reduce coupling to implementation details of the formatting machinery by
avoiding direct use for `core`'s formatting traits and macros.

This backslid in commit 9def0d0a2a1c ("rust: alloc: add
Vec::push_within_capacity").

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Acked-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/alloc/kvec/errors.rs | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/rust/kernel/alloc/kvec/errors.rs b/rust/kernel/alloc/kvec/errors.rs
index 21a920a4b09b..e7de5049ee47 100644
--- a/rust/kernel/alloc/kvec/errors.rs
+++ b/rust/kernel/alloc/kvec/errors.rs
@@ -2,14 +2,14 @@
 
 //! Errors for the [`Vec`] type.
 
-use kernel::fmt::{self, Debug, Formatter};
+use kernel::fmt;
 use kernel::prelude::*;
 
 /// Error type for [`Vec::push_within_capacity`].
 pub struct PushError<T>(pub T);
 
-impl<T> Debug for PushError<T> {
-    fn fmt(&self, f: &mut Formatter<'_>) -> fmt::Result {
+impl<T> fmt::Debug for PushError<T> {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
         write!(f, "Not enough capacity")
     }
 }
@@ -25,8 +25,8 @@ fn from(_: PushError<T>) -> Error {
 /// Error type for [`Vec::remove`].
 pub struct RemoveError;
 
-impl Debug for RemoveError {
-    fn fmt(&self, f: &mut Formatter<'_>) -> fmt::Result {
+impl fmt::Debug for RemoveError {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
         write!(f, "Index out of bounds")
     }
 }
@@ -45,8 +45,8 @@ pub enum InsertError<T> {
     OutOfCapacity(T),
 }
 
-impl<T> Debug for InsertError<T> {
-    fn fmt(&self, f: &mut Formatter<'_>) -> fmt::Result {
+impl<T> fmt::Debug for InsertError<T> {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
         match self {
             InsertError::IndexOutOfBounds(_) => write!(f, "Index out of bounds"),
             InsertError::OutOfCapacity(_) => write!(f, "Not enough capacity"),

-- 
2.51.1

