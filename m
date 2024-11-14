Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8084F16FF4E
	for <llvm@lists.linux.dev>; Thu, 14 Nov 2024 09:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731575397; cv=none; b=XPmNVropBf7O+x5uZE8Np6TLP03nfI1/kk9mKzZljt/tQiQ2XCb3bv0YfA5sgxqIaEVwXivqjHRhSSCFce6m0vZip2HozVfD8680JuOwv85byP+k1ynJX5XoIxwedUF43q2mDIPEzMHl3UCIA4JVlaCpLCvinryPqwJaOqolnLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731575397; c=relaxed/simple;
	bh=PXXiTOHQpXHEQRGW+QOZTJIMm+Kw3J/KPuf46M5D3sg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CKDGObaE52/mjHSLdTMSPs54lr7R4qugZyYnvjf4cxO92z33aRcN4LDUB/UFLMeB23enP/9wmbascXCTvkszkLQ3/NpcOkw4U6KF3pWJTvfiI8xPWGJldnw6GlLGaqcmKrYm5b5ANmYV4akR2WjZfFQaZG4JUVGxOeAeoTo9HXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BYmFkLUq; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BYmFkLUq"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4315df7b43fso3735955e9.0
        for <llvm@lists.linux.dev>; Thu, 14 Nov 2024 01:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731575394; x=1732180194; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=snrIemuufDuHlApDkEdxfvq/ObcDoeWFzUnMAOE/OGg=;
        b=BYmFkLUq09WKVq7l27PpNM2zTmI8DlNlwe1RIZQZYh7PumRmF2vEfO9Th+/7VcxOrT
         YVM2FPeE6auTF9sDWIFe6rSG0bTn5qSq60oJBKhoQqDVf4vjaAAsf1KiKzqyYB5lQxjv
         7nCHXGssTUmXpNWYOhAuchB2B2IIE2eU9FRqyKfuM4QxBYWIE1QcxTXE5YpMtwtpEsqe
         fJvkyR57mP9KN9qJwdl2nIpkqRNJMTNLyqKAifvUuTBCrG+5QxPQ3n+m1MAveSQSSy+3
         vrsnrgFoqDZuxHNMyv4uZnkNh6RzTifz3ib9bDhcDhGiLBZ3K9ZeH3+PIxxmTlcjEV/X
         pCDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731575394; x=1732180194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=snrIemuufDuHlApDkEdxfvq/ObcDoeWFzUnMAOE/OGg=;
        b=XpmzpA2UVvSPZaJU5CQnh8FqAWtoZMen5S2DB2gmdnlhKfOqxwLJdompb+wWxNRpGS
         74nKGYRsxhQn3raOOQfxj9yX/VYOAolYCpYdqzfLY1a05iJJdSN4/42M3JKXYtwvCu4e
         ajPY+7DarO7v11tPL9F+PT5SKKjNKfloyE2nsMpfgaB4f8vMERIPqe8Zlx9sRRVbLCPA
         90S+0g7rYVkWZFSbHxb0tIYi7U0BOh7gl1zewva98uSpxMD2DjTq7xTVPsX/YBDuXCid
         db7lZ0ye3ybZob2XP0Oz26/2BUM0Xc9VjfruN75n8yIoKf87mheeJiYnZ5NYPbYOHXzv
         mH2g==
X-Gm-Message-State: AOJu0YzWUPoLJqZzrAbS5IK6IRNFiVAF355H6eesQ8jakMmXMmMvY18y
	YblDq8aNWHKwHt/dzYAHu4KfHmUAzxl19DahfbY1e+VSGJrrua6tbZmJ66mBXPBr+4Dmw7e60Gx
	6MGVqMnghYHCenfV5bOjwErRQx2hl+szW6+Dc
X-Google-Smtp-Source: AGHT+IHl0YWMjVvQXfBmpZasv/AG4TN0t/e3GEjRFSir20aLU4svh+bxXjwNfmgPiqts/mQJb7ilPfmVaSUPRQZ8974=
X-Received: by 2002:a5d:5d89:0:b0:37c:ce58:5a1a with SMTP id
 ffacd0b85a97d-381f188ca8cmr18357244f8f.54.1731575393711; Thu, 14 Nov 2024
 01:09:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202411140520.VL33V6fD-lkp@intel.com>
In-Reply-To: <202411140520.VL33V6fD-lkp@intel.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 14 Nov 2024 10:09:42 +0100
Message-ID: <CAH5fLggEzmerC6Qg1fjuc_wiy21BJQGGYdZSZA+KV=oP6q9iJg@mail.gmail.com>
Subject: Re: [linux-next:master 8233/11277] error[E0425]: cannot find function
 `rust_do_trace_rust_sample_loaded` in crate `$crate::bindings`
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	"Steven Rostedt (Google)" <rostedt@goodmis.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 13, 2024 at 10:16=E2=80=AFPM kernel test robot <lkp@intel.com> =
wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   bd05b9a700c10473c2f52bf12c5c5938c30e80b0
> commit: 91d39024e1b02914cc5e2dbc137908e29b269ce4 [8233/11277] rust: sampl=
es: add tracepoint to Rust sample
> config: x86_64-randconfig-013-20241113 (https://download.01.org/0day-ci/a=
rchive/20241114/202411140520.VL33V6fD-lkp@intel.com/config)
> compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51=
eccf88f5321e7c60591c5546b254b6afab99)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20241114/202411140520.VL33V6fD-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202411140520.VL33V6fD-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> error[E0425]: cannot find function `rust_do_trace_rust_sample_loaded` =
in crate `$crate::bindings`
>    --> samples/rust/rust_print.rs:87:5
>    |
>    87 | /     kernel::declare_trace! {
>    88 | |         /// # Safety
>    89 | |         ///
>    90 | |         /// Always safe to call.
>    91 | |         unsafe fn rust_sample_loaded(magic: c_int);
>    92 | |     }
>    | |_____^ not found in `$crate::bindings`
>    |
>    =3D note: this error originates in the macro `kernel::declare_trace` (=
in Nightly builds, run with -Z macro-backtrace for more info)
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

Please see:
https://lore.kernel.org/rust-for-linux/20241111201607.653149-1-ojeda@kernel=
.org/
which is already in rust-next.

Alice
