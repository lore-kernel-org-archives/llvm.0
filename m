Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E8930F527
	for <llvm@lists.linux.dev>; Wed, 15 Oct 2025 19:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760556319; cv=none; b=lMSl/5Ow2JX2TxjzFrvgnJqum9UmKw+AlRjPyp7ip/YSl5+fOYbMATb1z6FFxHw2dWCJqgfnnf8mktyy8SP1L8x+yoCzmSJYne6wiGRuuATivW8p2z7sYyraXTPFdYVRZQPnOH0+VsrzWCUMFTA08m4L4ubnaQmFrAwjhXRU9eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760556319; c=relaxed/simple;
	bh=dVZb5Pcu1XHbZt2SW9FpYlV89iSmsSjiuXxsiQfQLK4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pW/7M11vR0GidYmwB8ieqIBIjABK1tTmr6Octq2AIefAinyqI4Se3ybhSV2FgypooNeu4r13LtDne4E0nXCwHYsWrSJtScN0Q9ZW/y9g7odgS4YUzVLDlZZNHbuIZZDgQltiDboar4RjYRjsoYvtnSBj/YJHUk7DnnlT5MO0dbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fctOi9rJ; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fctOi9rJ"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8738c6fdbe8so22081556d6.1
        for <llvm@lists.linux.dev>; Wed, 15 Oct 2025 12:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760556316; x=1761161116; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZcA+z8eYaRvOgVrZmY/xhbxjfSBJr0w9ghrKai5yQJ0=;
        b=fctOi9rJu21mBMgVdCvEl5NgoNO1LIOGwpRRdR1+rDNfgkLXqhVOM94iLL5S8gEkMA
         L97kLGzO99+cYWWB/rxbeApzmwrnd7oMuRE9vnYe19RFs0nd4q9+5mFMm8GKpO9QzvZL
         99ISj3YClWmAk0Yv/HD7v3x7RbW29vdeb+4k1vaCTVJWCMYEHURKTPTS+ohQGBoOIWg/
         6N6xdvbNyEXWwlDmV+D4fqSr/JOCuuEoViEjiAOTo9dky69rHK3ls1JVzXQkD4SaAu/M
         md26J1k6uhQBc8pop/LOQvufWCEHFRn6Qg/ib2gUwEpKgLjEmqwwFOqKHu0qjF0n3I3p
         Btpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760556316; x=1761161116;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZcA+z8eYaRvOgVrZmY/xhbxjfSBJr0w9ghrKai5yQJ0=;
        b=GKrikHbf/fhGYByvlPkIXHEfNRGF2du3kqOLxbyK4RGmIiH1ru1satkfgnPj52c7KV
         un4Ae48wqU8k0W2Vb6tV+Y963qsuAAeYm7sQZ5osWtubuBImYBQQvP3UzoYImQU2iUfz
         kgn1aq/XZ9hmvZRqrlYiW6I9sNFGkXyR2e5CZ82hGcK75IpOc04s7Z9rSBzDvLiIOkgI
         D++oo6luEgMct3T3vOUC6Zgc0028DcwwJe3JAyK65+WR38PyDLP+gPSy4FtGlrVJID4s
         o8ikJbWN6cs85ynvUh3OBF0vmvNiCBBxq/AhdE6D/90KUiw7Zjwtc9u7hIt/ZXMUH5Pk
         lxKw==
X-Forwarded-Encrypted: i=1; AJvYcCXkIrtSXGlFWLycVeB3NNnBOUxvOIIoN23gaOPddcSlvrnbfdk1BjDSYf26TZtdXe420xOn@lists.linux.dev
X-Gm-Message-State: AOJu0YwUUj3yxUumsVQ1Szg0XFIJUsX/WitdyOEPNXLmHJ4SY0lQJGjw
	MCZZzfkAa9rpbhb9yfBCmEAbxMYBUZqnlsSHiyWP2Qy+8YxaAkKxZFm8
X-Gm-Gg: ASbGnctyBHaY4K/z4QU2AmRzmQW0Uu3csT1N47I1CSfL+WmSDpqaQMuAHeXO5j2KHJe
	OaAXzVyYijjI/WGPQbkIL7jFVjyylsZ1esxVIAR8yHtMF3hPgu3QBNDYPq98/5JJJMDUtu6sLgx
	QAP4j1BKczmJBcS2bqX6DiKJdtPpWpDmMVqeyjWBnFQNlVGNBU6KshWwp1MYZnreATlTeGw2TW6
	hzB/VzOidm1ITGlqv3LkoKnEc02P6FbM0UIM0tCe5517wReg6VeV/nFNWX0L+tSLGaIyjvUX8gz
	SP8JKxxkcus0dqfDGBnptKJGkIlxGhT786ysDKDpun0j446T5YyN765CEgahqoYcUuHp3lRNsvq
	5UA5gr+MfpI8/BuewOup2DiJA90donDWWHYFYYGBU5OuKvrB/OsHPr9noBBTCHArpJ4cVvVegx4
	eHw9pU44gidhWoVwvqgNJGFnodaCo+h7Cw6h4JLaIHcRdfb192bYTbjn6mC8g/8n9vthV1R6TFG
	ptAhP8nxWylghamfKQykaFAtCJ3yJ/2UZaPf2yRfXtcBPcgP3Udsm4Qnhf5uzA=
X-Google-Smtp-Source: AGHT+IGtrSTY0FUSiNdgbPyhOIH/YvdyU5sl8fvg654fDJk8BbKW5z4ao5A5UXUjIURMYSPijzmsPA==
X-Received: by 2002:a05:6214:48f:b0:78e:f6cd:4704 with SMTP id 6a1803df08f44-87c0c5cd3aemr17462466d6.5.1760556315435;
        Wed, 15 Oct 2025 12:25:15 -0700 (PDT)
Received: from 136.1.168.192.in-addr.arpa ([2600:4808:6353:5c00:8573:f4c5:e7a9:9cd9])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87c012b165asm24076996d6.59.2025.10.15.12.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 12:25:14 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 15 Oct 2025 15:24:37 -0400
Subject: [PATCH v17 07/11] rust: debugfs: use `kernel::fmt`
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-cstr-core-v17-7-dc5e7aec870d@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1760556295; l=4568;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=dVZb5Pcu1XHbZt2SW9FpYlV89iSmsSjiuXxsiQfQLK4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QIygDVPZERtANioDtpZsLIsIx6DMuRfppWFXkHaK3hI5+YEfWJFA0uNjCcv/4Z25JqUAs3bOoMG
 11/p3YDZDuQA=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

Reduce coupling to implementation details of the formatting machinery by
avoiding direct use for `core`'s formatting traits and macros.

This backslid in commit 40ecc49466c8 ("rust: debugfs: Add support for
callback-based files") and commit 5e40b591cb46 ("rust: debugfs: Add
support for read-only files").

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/debugfs.rs                   |  2 +-
 rust/kernel/debugfs/callback_adapters.rs |  7 +++----
 rust/kernel/debugfs/file_ops.rs          |  6 +++---
 rust/kernel/debugfs/traits.rs            | 10 +++++-----
 4 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
index 381c23b3dd83..8c35d032acfe 100644
--- a/rust/kernel/debugfs.rs
+++ b/rust/kernel/debugfs.rs
@@ -8,12 +8,12 @@
 // When DebugFS is disabled, many parameters are dead. Linting for this isn't helpful.
 #![cfg_attr(not(CONFIG_DEBUG_FS), allow(unused_variables))]
 
+use crate::fmt;
 use crate::prelude::*;
 use crate::str::CStr;
 #[cfg(CONFIG_DEBUG_FS)]
 use crate::sync::Arc;
 use crate::uaccess::UserSliceReader;
-use core::fmt;
 use core::marker::PhantomData;
 use core::marker::PhantomPinned;
 #[cfg(CONFIG_DEBUG_FS)]
diff --git a/rust/kernel/debugfs/callback_adapters.rs b/rust/kernel/debugfs/callback_adapters.rs
index 6c024230f676..a260d8dee051 100644
--- a/rust/kernel/debugfs/callback_adapters.rs
+++ b/rust/kernel/debugfs/callback_adapters.rs
@@ -5,10 +5,9 @@
 //! than a trait implementation. If provided, it will override the trait implementation.
 
 use super::{Reader, Writer};
+use crate::fmt;
 use crate::prelude::*;
 use crate::uaccess::UserSliceReader;
-use core::fmt;
-use core::fmt::Formatter;
 use core::marker::PhantomData;
 use core::ops::Deref;
 
@@ -76,9 +75,9 @@ fn deref(&self) -> &D {
 
 impl<D, F> Writer for FormatAdapter<D, F>
 where
-    F: Fn(&D, &mut Formatter<'_>) -> fmt::Result + 'static,
+    F: Fn(&D, &mut fmt::Formatter<'_>) -> fmt::Result + 'static,
 {
-    fn write(&self, fmt: &mut Formatter<'_>) -> fmt::Result {
+    fn write(&self, fmt: &mut fmt::Formatter<'_>) -> fmt::Result {
         // SAFETY: FormatAdapter<_, F> can only be constructed if F is inhabited
         let f: &F = unsafe { materialize_zst() };
         f(&self.inner, fmt)
diff --git a/rust/kernel/debugfs/file_ops.rs b/rust/kernel/debugfs/file_ops.rs
index 50fead17b6f3..9ad5e3fa6f69 100644
--- a/rust/kernel/debugfs/file_ops.rs
+++ b/rust/kernel/debugfs/file_ops.rs
@@ -3,11 +3,11 @@
 
 use super::{Reader, Writer};
 use crate::debugfs::callback_adapters::Adapter;
+use crate::fmt;
 use crate::prelude::*;
 use crate::seq_file::SeqFile;
 use crate::seq_print;
 use crate::uaccess::UserSlice;
-use core::fmt::{Display, Formatter, Result};
 use core::marker::PhantomData;
 
 #[cfg(CONFIG_DEBUG_FS)]
@@ -65,8 +65,8 @@ fn deref(&self) -> &Self::Target {
 
 struct WriterAdapter<T>(T);
 
-impl<'a, T: Writer> Display for WriterAdapter<&'a T> {
-    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
+impl<'a, T: Writer> fmt::Display for WriterAdapter<&'a T> {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
         self.0.write(f)
     }
 }
diff --git a/rust/kernel/debugfs/traits.rs b/rust/kernel/debugfs/traits.rs
index ab009eb254b3..ad33bfbc7669 100644
--- a/rust/kernel/debugfs/traits.rs
+++ b/rust/kernel/debugfs/traits.rs
@@ -3,10 +3,10 @@
 
 //! Traits for rendering or updating values exported to DebugFS.
 
+use crate::fmt;
 use crate::prelude::*;
 use crate::sync::Mutex;
 use crate::uaccess::UserSliceReader;
-use core::fmt::{self, Debug, Formatter};
 use core::str::FromStr;
 use core::sync::atomic::{
     AtomicI16, AtomicI32, AtomicI64, AtomicI8, AtomicIsize, AtomicU16, AtomicU32, AtomicU64,
@@ -24,17 +24,17 @@
 /// explicitly instead.
 pub trait Writer {
     /// Formats the value using the given formatter.
-    fn write(&self, f: &mut Formatter<'_>) -> fmt::Result;
+    fn write(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result;
 }
 
 impl<T: Writer> Writer for Mutex<T> {
-    fn write(&self, f: &mut Formatter<'_>) -> fmt::Result {
+    fn write(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
         self.lock().write(f)
     }
 }
 
-impl<T: Debug> Writer for T {
-    fn write(&self, f: &mut Formatter<'_>) -> fmt::Result {
+impl<T: fmt::Debug> Writer for T {
+    fn write(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
         writeln!(f, "{self:?}")
     }
 }

-- 
2.51.0

