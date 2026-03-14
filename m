Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2AD71F8723
	for <llvm@lists.linux.dev>; Sat, 14 Mar 2026 11:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773487198; cv=none; b=RAR9k/XXC1BKow+nlPqshW5R2WgmDenYxWx0J8pUXZWhSeCSxv7KmmVr/WOJCs3KSpZ/VIHiG7sgLFYYBtB8RD2Pd+iHELRK+g+KsNwPNf5hIq+vQge9N2mzcSdsgq8YpdGS6RVy7ZdEjKPcLVoYSuHi4R5sgb+K3fTbGAFqJeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773487198; c=relaxed/simple;
	bh=5aOrVoN4piYS/Amiu6IhnErIjFSEW8Pg4CtCMBPDDpc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mq1dkQeD4UVoAg2KQ9Gy80qLpKlahpgja6wt919TQL9J3wcZKB4gyrNEapOH0++r522k6ODqRVZiig4j9lqY/ZG+girlFj1XmVugR7jgsjRiL2aStJiWJUC/7zSH2E8zj4BOC3ZoWjrdaxDP2ffbmLU8gu4dkxwZLjvnubitxu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tQMC6vqT; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tQMC6vqT"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4853efceaddso24333225e9.3
        for <llvm@lists.linux.dev>; Sat, 14 Mar 2026 04:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773487195; x=1774091995; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=V83MI+X4cH1kv5YYy8UyAToYkv5v+x2hivsQCcl9ql0=;
        b=tQMC6vqT9SEAxPQ2lsQBi32oNrNbSKnmU7sTMtoAzZCan9w3vA1WkpwhtaApeOHD80
         /H+ue/EbC4c06vIsorzWcFZqjKGR0SPudydHbAyY3OFZ32sOAUgvA7/eOW6shYchzy3z
         wEcasH30RhDW6h7I0Fmr6q7kbgCb//LxOmM5wQMv1MNoIoJjOYbYcbdycE8+KAZzLown
         FfSw/neBrbc/i/kvz3M/qHBgaH+apLvpnJQiwqD02PfTmSCB2z6yw5xXC/JR/Mx1c30m
         jhsBRqn0IEXSYezeBWUYboh1W2dk6ZVQfpvgMZvAEgg2n2b2zn2k4p9MFF6GxSK2rk0c
         Dm6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773487195; x=1774091995;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V83MI+X4cH1kv5YYy8UyAToYkv5v+x2hivsQCcl9ql0=;
        b=hZIRNvBqJgUiqlOulcxH+8AY3IoHndHWOwYDKy5ETgF21yuHM4V2Rhk2ndoQVpvJ3H
         iEdpZhnhhgRCMZvw9YAAe4stE/dEfbKgSb2cRtphfnuEtU8U4gIY3GEAcBAPAtvyyFkC
         zv3jwU4hjvfoa9OMS+3xMk31b1gfODqEVsA83+lanQRTW2ZmcLUQ+2dAhAnJPK3DFna2
         Gq5KZAczeESTFcESPgrPlOWSDCE7KfXDxx7XqCSM0qIIKsf1sFVnig2eP2EJ1iUS/zVx
         2LqyHLTAzxYgbU+Ut3s1EILBXTypN9mmck3O44yw1dXV8XVQJrVsCTuhxcU4taQIBJfF
         puOg==
X-Forwarded-Encrypted: i=1; AJvYcCXK2FOmUI0Min5esWuAHi5h+oC+zCif3qHtnpN870s+MbdhF5v/A2C/Bwnayt2QiqqqpaND@lists.linux.dev
X-Gm-Message-State: AOJu0YwG4yENfl+C7qQiVZ+bMIGppyRK5CPbaihfqICEnopTaDR4Cztk
	GwdDtOuUOA6WoxAJSiARZEmMFFyYUv+WhKRq/yinqgs1V/Yrf7rKh0P2lTNwck+48pY3ay8w3Bk
	ZJQy7jPSqSfLg9Fyg1Q==
X-Received: from wmbe18.prod.google.com ([2002:a05:600c:5912:b0:485:37cb:adc1])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600d:8495:10b0:485:3e00:9451 with SMTP id 5b1f17b1804b1-485566fac49mr79883095e9.17.1773487195026;
 Sat, 14 Mar 2026 04:19:55 -0700 (PDT)
Date: Sat, 14 Mar 2026 11:19:51 +0000
In-Reply-To: <CAH5fLgixE9MGXxNEnU5b0EXdgLQoTs5CMv_0OdnfCX3v=coUpw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <CAH5fLgixE9MGXxNEnU5b0EXdgLQoTs5CMv_0OdnfCX3v=coUpw@mail.gmail.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=3874; i=aliceryhl@google.com;
 h=from:subject; bh=5aOrVoN4piYS/Amiu6IhnErIjFSEW8Pg4CtCMBPDDpc=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBptUQvenk57YLJzXb/usVxhPtRc8Xg36U+3nHLl
 FX/2l7d59eJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCabVELwAKCRAEWL7uWMY5
 RheQD/9dEzfyCuMDcej1iovP3Z5C8WazN9d6dzEloO5VxxwuODKRD2AGgleN8Ww0vch93akQD02
 +Q5zuHBihPS7xs7rIfZ1S6UU5LsSmk3mWK6GDvJUvH8PePtBWiL/nbqjJWKXNpzsp/4pBfYU7Yt
 LKatHxCLPO5zKz6niyruLuuHZAAzGQeIrxtdCoI6bd353xRNTSgG2xJlFZAojyen/0K6ui8wOeO
 0kFf9buZXjdjj+4CkiZ2DNetXxMw1Iv0KLqG7RJn27DkMVU8fP/eSRvf25X/wBfUe56ZXYkuzya
 5bRg7HNaq9ZA53KETB0oU3rdz9IyukkM//uxTOKBVqST4XZ05fudzFN5JOepnX0su9GK0N6SRnq
 PzTpmtlsPaSRAh0YOrTyQkI1fOyJWJF1uHQnaaJ8Po6cANVd0ZQ1Ke3sjkpfmj3togZjNRS6yPC
 KnkLltyxIdTqrQAgx7E+DtSFQIrrMjharuEP360I5mjNWCkvaeAf9TVvGoSqKzuIOkaU4xenWXt
 s1rr3EfpmAGfyVUne/0z8QXARf3J/vwweuYV6/jIwkKy/vUi7dJZ4fZWNeMhwaMM75dJaYWRcCk
 +66ukvunUjzKQQP6gyl8BsTjWYTOqT+1MMAlGR5z410gvivD1cvFdKTURaVzBzqqKt9pn3QUzOB MwlJ0IpFzW2PYhQ==
X-Mailer: git-send-email 2.53.0.851.ga537e3e6e9-goog
Message-ID: <20260314111951.4139029-1-aliceryhl@google.com>
Subject: [PATCH] rust_binder: use AssertSync for BINDER_VM_OPS
From: Alice Ryhl <aliceryhl@google.com>
To: aliceryhl@google.com, gregkh@linuxfoundation.org
Cc: Liam.Howlett@oracle.com, akpm@linux-foundation.org, broonie@kernel.org, 
	dakr@kernel.org, jannh@google.com, linux-mm@kvack.org, lkp@intel.com, 
	llvm@lists.linux.dev, miguel.ojeda.sandonis@gmail.com, nathan@kernel.org, 
	oe-kbuild-all@lists.linux.dev, ojeda@kernel.org, rppt@kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

When declaring an immutable global variable in Rust, the compiler checks
that it looks thread safe, because it is generally safe to access said
global variable. When using C bindings types for these globals, we don't
really want this check, because it is conservative and assumes pointers
are not thread safe.

In the case of BINDER_VM_OPS, this is a challenge when combined with the
patch 'userfaultfd: introduce vm_uffd_ops' [1], which introduces a
pointer field to vm_operations_struct. It previously only held function
pointers, which are considered thread safe.

Rust Binder should not be assuming that vm_operations_struct contains no
pointer fields, so to fix this, use AssertSync (which Rust Binder has
already declared for another similar global of type struct
file_operations with the same problem). This ensures that even if
another commit adds a pointer field to vm_operations_struct, this does
not cause problems.

Fixes: 8ef2c15aeae0 ("rust_binder: check ownership before using vma")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202603121235.tpnRxFKO-lkp@intel.com/
Link: https://lore.kernel.org/r/20260306171815.3160826-8-rppt@kernel.org [1]
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/android/binder/page_range.rs       | 8 +++++---
 drivers/android/binder/rust_binder_main.rs | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/android/binder/page_range.rs b/drivers/android/binder/page_range.rs
index 9dfc154e5dd4..b57e0c7ba3f1 100644
--- a/drivers/android/binder/page_range.rs
+++ b/drivers/android/binder/page_range.rs
@@ -13,6 +13,8 @@
 //
 // The shrinker will use trylock methods because it locks them in a different order.
 
+use crate::AssertSync;
+
 use core::{
     marker::PhantomPinned,
     mem::{size_of, size_of_val, MaybeUninit},
@@ -143,14 +145,14 @@ pub(crate) struct ShrinkablePageRange {
 }
 
 // We do not define any ops. For now, used only to check identity of vmas.
-static BINDER_VM_OPS: bindings::vm_operations_struct = pin_init::zeroed();
+static BINDER_VM_OPS: AssertSync<bindings::vm_operations_struct> = AssertSync(pin_init::zeroed());
 
 // To ensure that we do not accidentally install pages into or zap pages from the wrong vma, we
 // check its vm_ops and private data before using it.
 fn check_vma(vma: &virt::VmaRef, owner: *const ShrinkablePageRange) -> Option<&virt::VmaMixedMap> {
     // SAFETY: Just reading the vm_ops pointer of any active vma is safe.
     let vm_ops = unsafe { (*vma.as_ptr()).vm_ops };
-    if !ptr::eq(vm_ops, &BINDER_VM_OPS) {
+    if !ptr::eq(vm_ops, &BINDER_VM_OPS.0) {
         return None;
     }
 
@@ -342,7 +344,7 @@ pub(crate) fn register_with_vma(&self, vma: &virt::VmaNew) -> Result<usize> {
 
         // SAFETY: We own the vma, and we don't use any methods on VmaNew that rely on
         // `vm_ops`.
-        unsafe { (*vma.as_ptr()).vm_ops = &BINDER_VM_OPS };
+        unsafe { (*vma.as_ptr()).vm_ops = &BINDER_VM_OPS.0 };
 
         Ok(num_pages)
     }
diff --git a/drivers/android/binder/rust_binder_main.rs b/drivers/android/binder/rust_binder_main.rs
index aa5f2a75adb4..014010662df8 100644
--- a/drivers/android/binder/rust_binder_main.rs
+++ b/drivers/android/binder/rust_binder_main.rs
@@ -306,7 +306,7 @@ fn init(_module: &'static kernel::ThisModule) -> Result<Self> {
 /// Makes the inner type Sync.
 #[repr(transparent)]
 pub struct AssertSync<T>(T);
-// SAFETY: Used only to insert `file_operations` into a global, which is safe.
+// SAFETY: Used only to insert C bindings types into globals, which is safe.
 unsafe impl<T> Sync for AssertSync<T> {}
 
 /// File operations that rust_binderfs.c can use.

base-commit: a0b9b0f1433c845bda708753db32befef78e0f1f
-- 
2.53.0.851.ga537e3e6e9-goog

