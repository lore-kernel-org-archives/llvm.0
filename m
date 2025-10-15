Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542582561B9
	for <llvm@lists.linux.dev>; Wed, 15 Oct 2025 19:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760557218; cv=none; b=nHdiuk5SCiusg7BPAgbpEFfoG/UlISBM5vaKq+DxkXdzdXh0qIOc7ileyKNMUS/Y3IYKHrHvEvGA4UiPSoG/fwbJb+5MGfmsHiV1PAgep2WX1LhLYCV3wJz6UULzvlRBiLcDeZ7Ju/95kt05mrdl/g52pBWv32d5/NP9zsZ5e6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760557218; c=relaxed/simple;
	bh=+kjcilcNnl42PP01ue6qyMU4wvoCvOkJFn4w3QhQiE0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WT7vP5ArBbx8ASPSK7Vv5OBa4EbmYeL89vMUys1kaPuyITYyx+CkWZPucFdV/cPeKqEwQwbcW0HUesco0lUD074eIpsHYdXraUQNABYfScR2Q77RkThgouZcP1Cd0Mhh2oh+jfEAiQPOIVmcvU7ALNQYRcvB258ucnljhj2tSlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BWnN+cy0; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BWnN+cy0"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-634cc96ccaeso2291a12.1
        for <llvm@lists.linux.dev>; Wed, 15 Oct 2025 12:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760557212; x=1761162012; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8n8UZ7d2MXJ0mooKHeN+kYs3Duy/o2bf41dETvsjc+Y=;
        b=BWnN+cy0UH94Z9dKKo359q53c9bvRlUL15+mPQFNer/CdUL0p4PodQZGYXmB3XWNPn
         PDD5XZcYgWNxzBhJcpGknX5YKotdmn0+0viBnXDKVNZBWmvFpB2Hkiz6LEGJJjSIwIs3
         erED/ECqYF6DLApii+XZJbslv9OVZfgZNgDIQUdor9WuA23u456iL8//6P26kGr/e/zl
         39QyC5RdUbI50XXLCw/doX3jjJMgl4LNj9PAsqqerJ/ejIy+S94U5XYmqwdozyu17Q/z
         TrgA8ljdhBKA/o2LouUii5/lP5rKzHlIcfKLWnGtnD6w37YKRsCXcfZLysTL691btpow
         zlLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760557212; x=1761162012;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8n8UZ7d2MXJ0mooKHeN+kYs3Duy/o2bf41dETvsjc+Y=;
        b=NDQK1k/XzmbYv8kMSPi+HY/wm1nUJ+fFkVgUEqjNXORAP2kE6gs3ffxLraMlQq6A3S
         3jMz5mvj0Xcq/PKNnR+USn856frx2emWgA3FG7FzH1Xdt070384CfARe8edC32hv7o6I
         OeP86An6mxXpF8FigTYw0H+Iv8lWjR5626yZHP3lF4zd6MvgN+QubX2wBhHysKMUJ0jZ
         CzXWdmTBR0ewJaACYA8cQcAEKuYhpujfWfZUiS0HqVo7ktcuMIo+t45g5O4ajR/EezRQ
         QoZFfVljGenbr4lc7uCEjDJUAYFBZtFvsHAEX0yQofv6P883cs4cy3cZJgIJsaXWB8lB
         cVSA==
X-Forwarded-Encrypted: i=1; AJvYcCVEgbRod6I5kwsNzad7Hubt2Os+vRRxbj5/hxQQ6TziQ9MWt2Wl3MTzRRUGdalAcL2FAq3+@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0LLcGFxImt+gs9rukLXmy6fibWkUCcNKZ5rwMJlUoesWKwf8l
	ZqmIwFRIJuMDLakid2Jz8bPMH1jdwsesS/tbfOYkkWRmZt0dOKZj9jUyCRT+rsEUy/ycTZxjwDM
	wqqApMc12Dcm1ovxIpOEWaykHRTjc8fWxur6GIlvy
X-Gm-Gg: ASbGnctOtt2Hhvt8QgzOplBaIKJ3nYZdpJP7F6OwK9MG/gD1rcv/ELtDOlbG3pxWmhy
	SoKP/2AmUZnFWWpnl8PURdMfp+u9EoiH7kFlZlvvfsWX6DDFuK6TptoAaKhUk12JNFJUKhNIXvx
	T+mIG6Vx86bVpr12ffJppthecSYZAmA6h5mGaD9sG09F0h+xaQlXa0rVVNKCoGzYQLmQLCP3ePu
	kvmZJXQ0vJWpPgd9IvCEbhbfx+Qm6UFxThJeMypzm0upa7qbpjWrqiqFIrGWDZflbGUFWP89w==
X-Google-Smtp-Source: AGHT+IH1hNKXb4/pUf1qyCZudGyGSw9NF8uf8Lrdu7RzgqVV4GV74DwVE6/60XlICJ44BkpiAsKuFWJqqSWZYx9QXyA=
X-Received: by 2002:a05:6402:3246:20b0:634:38d4:410a with SMTP id
 4fb4d7f45d1cf-63bebfa2921mr171979a12.2.1760557211329; Wed, 15 Oct 2025
 12:40:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251015-cstr-core-v17-0-dc5e7aec870d@gmail.com> <20251015-cstr-core-v17-7-dc5e7aec870d@gmail.com>
In-Reply-To: <20251015-cstr-core-v17-7-dc5e7aec870d@gmail.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Wed, 15 Oct 2025 12:39:59 -0700
X-Gm-Features: AS18NWB8AyHrypSBGVaV1zRPTZvCdB6mfFLenAU_JFgUJqaxeHd248FJTuy2y7E
Message-ID: <CAGSQo03-9H58F6GKBta2fH0CjrYNpJcTW=vtyEsL4k3m-YuDMg@mail.gmail.com>
Subject: Re: [PATCH v17 07/11] rust: debugfs: use `kernel::fmt`
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Russ Weight <russ.weight@linux.dev>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Carlos Llamas <cmllamas@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Jens Axboe <axboe@kernel.dk>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Uladzislau Rezki <urezki@gmail.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 15, 2025 at 12:27=E2=80=AFPM Tamir Duberstein <tamird@gmail.com=
> wrote:
>
> Reduce coupling to implementation details of the formatting machinery by
> avoiding direct use for `core`'s formatting traits and macros.
>
> This backslid in commit 40ecc49466c8 ("rust: debugfs: Add support for
> callback-based files") and commit 5e40b591cb46 ("rust: debugfs: Add
> support for read-only files").
>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
>  rust/kernel/debugfs.rs                   |  2 +-
>  rust/kernel/debugfs/callback_adapters.rs |  7 +++----
>  rust/kernel/debugfs/file_ops.rs          |  6 +++---
>  rust/kernel/debugfs/traits.rs            | 10 +++++-----
>  4 files changed, 12 insertions(+), 13 deletions(-)
>

Reviewed-by: Matthew Maurer <mmaurer@google.com>


On Wed, Oct 15, 2025 at 12:27=E2=80=AFPM Tamir Duberstein <tamird@gmail.com=
> wrote:
>
> Reduce coupling to implementation details of the formatting machinery by
> avoiding direct use for `core`'s formatting traits and macros.
>
> This backslid in commit 40ecc49466c8 ("rust: debugfs: Add support for
> callback-based files") and commit 5e40b591cb46 ("rust: debugfs: Add
> support for read-only files").
>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
>  rust/kernel/debugfs.rs                   |  2 +-
>  rust/kernel/debugfs/callback_adapters.rs |  7 +++----
>  rust/kernel/debugfs/file_ops.rs          |  6 +++---
>  rust/kernel/debugfs/traits.rs            | 10 +++++-----
>  4 files changed, 12 insertions(+), 13 deletions(-)
>
> diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
> index 381c23b3dd83..8c35d032acfe 100644
> --- a/rust/kernel/debugfs.rs
> +++ b/rust/kernel/debugfs.rs
> @@ -8,12 +8,12 @@
>  // When DebugFS is disabled, many parameters are dead. Linting for this =
isn't helpful.
>  #![cfg_attr(not(CONFIG_DEBUG_FS), allow(unused_variables))]
>
> +use crate::fmt;
>  use crate::prelude::*;
>  use crate::str::CStr;
>  #[cfg(CONFIG_DEBUG_FS)]
>  use crate::sync::Arc;
>  use crate::uaccess::UserSliceReader;
> -use core::fmt;
>  use core::marker::PhantomData;
>  use core::marker::PhantomPinned;
>  #[cfg(CONFIG_DEBUG_FS)]
> diff --git a/rust/kernel/debugfs/callback_adapters.rs b/rust/kernel/debug=
fs/callback_adapters.rs
> index 6c024230f676..a260d8dee051 100644
> --- a/rust/kernel/debugfs/callback_adapters.rs
> +++ b/rust/kernel/debugfs/callback_adapters.rs
> @@ -5,10 +5,9 @@
>  //! than a trait implementation. If provided, it will override the trait=
 implementation.
>
>  use super::{Reader, Writer};
> +use crate::fmt;
>  use crate::prelude::*;
>  use crate::uaccess::UserSliceReader;
> -use core::fmt;
> -use core::fmt::Formatter;
>  use core::marker::PhantomData;
>  use core::ops::Deref;
>
> @@ -76,9 +75,9 @@ fn deref(&self) -> &D {
>
>  impl<D, F> Writer for FormatAdapter<D, F>
>  where
> -    F: Fn(&D, &mut Formatter<'_>) -> fmt::Result + 'static,
> +    F: Fn(&D, &mut fmt::Formatter<'_>) -> fmt::Result + 'static,
>  {
> -    fn write(&self, fmt: &mut Formatter<'_>) -> fmt::Result {
> +    fn write(&self, fmt: &mut fmt::Formatter<'_>) -> fmt::Result {
>          // SAFETY: FormatAdapter<_, F> can only be constructed if F is i=
nhabited
>          let f: &F =3D unsafe { materialize_zst() };
>          f(&self.inner, fmt)
> diff --git a/rust/kernel/debugfs/file_ops.rs b/rust/kernel/debugfs/file_o=
ps.rs
> index 50fead17b6f3..9ad5e3fa6f69 100644
> --- a/rust/kernel/debugfs/file_ops.rs
> +++ b/rust/kernel/debugfs/file_ops.rs
> @@ -3,11 +3,11 @@
>
>  use super::{Reader, Writer};
>  use crate::debugfs::callback_adapters::Adapter;
> +use crate::fmt;
>  use crate::prelude::*;
>  use crate::seq_file::SeqFile;
>  use crate::seq_print;
>  use crate::uaccess::UserSlice;
> -use core::fmt::{Display, Formatter, Result};
>  use core::marker::PhantomData;
>
>  #[cfg(CONFIG_DEBUG_FS)]
> @@ -65,8 +65,8 @@ fn deref(&self) -> &Self::Target {
>
>  struct WriterAdapter<T>(T);
>
> -impl<'a, T: Writer> Display for WriterAdapter<&'a T> {
> -    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
> +impl<'a, T: Writer> fmt::Display for WriterAdapter<&'a T> {
> +    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
>          self.0.write(f)
>      }
>  }
> diff --git a/rust/kernel/debugfs/traits.rs b/rust/kernel/debugfs/traits.r=
s
> index ab009eb254b3..ad33bfbc7669 100644
> --- a/rust/kernel/debugfs/traits.rs
> +++ b/rust/kernel/debugfs/traits.rs
> @@ -3,10 +3,10 @@
>
>  //! Traits for rendering or updating values exported to DebugFS.
>
> +use crate::fmt;
>  use crate::prelude::*;
>  use crate::sync::Mutex;
>  use crate::uaccess::UserSliceReader;
> -use core::fmt::{self, Debug, Formatter};
>  use core::str::FromStr;
>  use core::sync::atomic::{
>      AtomicI16, AtomicI32, AtomicI64, AtomicI8, AtomicIsize, AtomicU16, A=
tomicU32, AtomicU64,
> @@ -24,17 +24,17 @@
>  /// explicitly instead.
>  pub trait Writer {
>      /// Formats the value using the given formatter.
> -    fn write(&self, f: &mut Formatter<'_>) -> fmt::Result;
> +    fn write(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result;
>  }
>
>  impl<T: Writer> Writer for Mutex<T> {
> -    fn write(&self, f: &mut Formatter<'_>) -> fmt::Result {
> +    fn write(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
>          self.lock().write(f)
>      }
>  }
>
> -impl<T: Debug> Writer for T {
> -    fn write(&self, f: &mut Formatter<'_>) -> fmt::Result {
> +impl<T: fmt::Debug> Writer for T {
> +    fn write(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
>          writeln!(f, "{self:?}")
>      }
>  }
>
> --
> 2.51.0
>
>
