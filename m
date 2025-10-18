Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED4D2638BF
	for <llvm@lists.linux.dev>; Sat, 18 Oct 2025 17:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760809560; cv=none; b=d/6QMNkTu1ArR9BQgtN1/OJ7eRpQJt9WhD1uw5PsSogetfGxAtBYeaOmvIhLOH5Gl/l4tOswieqxZyM7sxYSBb7iDP7jb5YHlkIDiE00DndUCODZ7ZZZSoo6ABQRKP5PQ/kHScbWQIQapZIRmr08SDf6Zsd+l/kfoFl2P7d8JMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760809560; c=relaxed/simple;
	bh=2RO1O8x8vlwhifkhfd816jOQiIu5L43+GQ3qhkZvCCc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MmkBxeE9x/HjSgxI8bfRdrZRGYdwoK11HCOUAJ7but3IxOQG6qEG7NJCNdUJqaGh5y23kf3vEw3vyGCceWWH3pUkzXAIe2Gy7xqrrRZjJxlIYdsZc1eKU3n0aOBRfczRJpj6KS3mH2ScRSjS6SHGzJxTwqZMVVhyKklN/jdowB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a0Ru4umu; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a0Ru4umu"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-88f8f346c2cso447373985a.0
        for <llvm@lists.linux.dev>; Sat, 18 Oct 2025 10:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760809557; x=1761414357; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a15d5fAvykxuJ32X4GoFun7W4EexMfG4QkmOfbTlvaA=;
        b=a0Ru4umuFHPBqaV6OfKsBPim+MOLvnxftij9WCQSK/VO2l4eEcx6mlRhre2oaGnj8A
         DqyCYPW0SttEsXctmNcjl3kddU8aclyEyCJ9xCtFSf3kkdrcjr6FBSNL8MjtN8DLus5Q
         LFgi3uKY4DFi0KtERz5cmg6/6TCa32tEJtvnoKePxRTjb8XYK6yrmHyW0mTxP+WSjVeZ
         04aSFyW3Mcmw9ZqJCXmBms/OUck35ujLdujJALz8T9NP2M2DvVn8pY26d+PHLKO/iD9/
         /RCbvAEc1c/RjNfgUDFoW+Itm2jbSFqLwyqYUXEiKHrjMK21CMZcQgTM9pmzfkn7wIum
         EBkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760809557; x=1761414357;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a15d5fAvykxuJ32X4GoFun7W4EexMfG4QkmOfbTlvaA=;
        b=Mlb+6vEgFpBCCnjREnfXEag/MTIS0g0AzXqEovUED2dfvg3O9otKKLyVp6XO1ypqca
         x+YLotl5oKFAp1ivDgSwmgAQamzpKLKEhmL2+CTKaYiXa/kkS1GhuuTyzxG5EQZboRBE
         Dc3fpTM1WoADVfCaGaP5JszFEhOmf5o6K9Z5NFruoaD5+wBaIOMF/DCRWYA72Fa1odKo
         bzlDN1VBSc/Aj3vHIbrNWBXxL1NUxMNbXNgVw1S3YOo/WGMEUSXFmYc4KvzyQqd6iQA0
         dYG7CvQzhj+rzYYLOdgOMOGKA08DX1GNNLNeavSfetSfSthXkyH79az4eHUHwf2EGD6f
         IUQg==
X-Forwarded-Encrypted: i=1; AJvYcCUgI8HT9FFxlwDZIaae4L6efDVZkvFHllQXQtHYs2sOZ3OpuuUUOExxz3lY0ivPTGHycC1G@lists.linux.dev
X-Gm-Message-State: AOJu0YzAoQ+TumSZ/63YRQjY8GPqPbNATLnrmNK1NPFmDX0gWvXsNYX8
	Wd2ZaXUnRygy7phsduhc+6xBTrQk4YUOzQEbqAbDEbOzmEpZ5EivFsoQ
X-Gm-Gg: ASbGncu3SSLwRNtFqmkwhczRCdLBuqOTMwSAvAhe4B2H6SyPJjFIqGR70GO4+uvT0BH
	jsm/ls9OW4eY9MOsrmoYF9zlzrYDERz38ar34XiC+Z9jguWNdVnY7xwUs3Z+/61YUOIlm+snIv6
	0APv2XCTvXUbs0vO49DMV2+SrWw11PKkf/tGVXNAwt5Xi8txCfuDFIHA1WK28q6SqcmejFQ1iC/
	paaMER0z4TEv0/T6E2JBGtTvGlvwBUHCWMC5hgXTIWG478JZAPfj5WOSduaPxHqrpcarFQFXvfj
	/LakHX7Wygt9qiiu/DRAjtz9vTZsmEt1vzrGrdIpHURsM+THcvAZn9slyeZT7wJavqr4gXxxPu6
	XPLpmY8AZ3z6dSZMjeJfg1lVAfNOtm3TVoGr1mIePVb0Ops0AhwHd6c0FZkrLCmNj8T90oT+0W8
	Sq4c/LyzeADTKMFhrc7gCcmc7KP79wYrWWtC/tGouKojJ7x4xtDfJ+YIX0px5SgVa/2KKLsH4F6
	x1SYplZMcm9YD8rpLvouCb0+XGl1gYW8UFmmyOpc4HJHND+iY6xInEgOdCLAyw8H8I1HC5vEA==
X-Google-Smtp-Source: AGHT+IF0jDSr4+x2H9ezxo4E3+k6pmF019NwUbAdiwnAzhTA8DToLrkpZSznJQWz124+QD1Dm24uLg==
X-Received: by 2002:a05:622a:1102:b0:4e8:b17d:916b with SMTP id d75a77b69052e-4e8b17d949fmr28810291cf.51.1760809556972;
        Sat, 18 Oct 2025 10:45:56 -0700 (PDT)
Received: from 117.1.168.192.in-addr.arpa ([2600:4808:6353:5c00:1948:1052:f1e9:e23a])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e8ab114132sm20445161cf.40.2025.10.18.10.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 10:45:55 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Sat, 18 Oct 2025 13:45:18 -0400
Subject: [PATCH v18 07/16] rust: debugfs: use `kernel::fmt`
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251018-cstr-core-v18-7-ef3d02760804@gmail.com>
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
 dri-devel@lists.freedesktop.org, Tamir Duberstein <tamird@gmail.com>, 
 Matthew Maurer <mmaurer@google.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1760809527; l=4664;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=2RO1O8x8vlwhifkhfd816jOQiIu5L43+GQ3qhkZvCCc=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QMATZCii+4KTdwmO4cL/e3cZ7fEhaFxHdhr1qxcBeKLRmamGNwC2RJ/lvy+nkubg5+s2N1SC1jy
 AY70o32pQ0gI=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

Reduce coupling to implementation details of the formatting machinery by
avoiding direct use for `core`'s formatting traits and macros.

This backslid in commit 40ecc49466c8 ("rust: debugfs: Add support for
callback-based files") and commit 5e40b591cb46 ("rust: debugfs: Add
support for read-only files").

Acked-by: Danilo Krummrich <dakr@kernel.org>
Reviewed-by: Matthew Maurer <mmaurer@google.com>
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
2.51.1

