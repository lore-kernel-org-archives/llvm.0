Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B394A2210F7
	for <llvm@lists.linux.dev>; Wed, 11 Dec 2024 11:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733917757; cv=none; b=lXRIu0RjgebQ8mLGgFgWYQvJXjRne/itdz8uFBMHt1V1hh6fvurOLwLcY3lt7sJ6Tbk6oIi6mlpcNHE7twqgrVuEbUvi1+VnsdEudQeoChd808upzPLcSHQ68ubdPXRvu65euyhPiZn5vkN9UfzHLSkqIAPvu4pKBX7+clutyAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733917757; c=relaxed/simple;
	bh=Afz7Md+4SGxygkYzcj/QROHNaaIWlCVNEawMwRt3y44=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H4IdhZkyxc+TyTSzrlAq6HO+Gna60Ji4deVBeiqS5NdkU+qhHGbIf1uHR+6yFY1/qz4FBGbl6690uVIdeNuVl4dQPxTrTd0fDkNPJpR39UGxGryJSwsEgHU/FYfqnTpT75auCziiE7ErIIqlBrjEDE0k64DgZYiFLpXqfjvqM2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KfZSD0Xb; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KfZSD0Xb"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4361c705434so4314555e9.3
        for <llvm@lists.linux.dev>; Wed, 11 Dec 2024 03:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733917753; x=1734522553; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F2EqaIbo3wdkBMFqNSfSBUJWTerrNTKyiQvdFD0aob0=;
        b=KfZSD0XbQaid/TWdvKR+Cg/8MHc14QMkn06lILTl2B5eBl6CB7mUGf9CGDpA3A2xwy
         vEx8U3t38GV4l9ep4cKAO0+972E/FiGBQ82B08WASpSok4mHeO9r3+nxqdJYCh+99Q8W
         y36QwaG6GD13vb3SXt022XZoibDinK8TpWeygnG741Ce0wiwyozt9tQfBPS47Z9aZeJO
         5pPS3ZSOS592t+c0niEIqNpRLfnvkVyfwDCxRPyebHNgP5Ri0B77wCWhzNl4zEOF+L/8
         JJv6UYYaEeWucaR6IpQjegVBkjHjE9ztscV7EktSLB177vH8vmIbrNhYHlVMV2R+Uith
         3OFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733917753; x=1734522553;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F2EqaIbo3wdkBMFqNSfSBUJWTerrNTKyiQvdFD0aob0=;
        b=ZlCo0f0S/qBgR5kaWjzKy9ULG+hONOzOnRETNe5LoW4zE4ViR0V7KLU83X7zFuLWLO
         fschJ8Vz1qiDiOe9dg7knI9c2m3CieS3HaceqqyARnOaTb9n+w2yKGcHO7sR5acVCXCI
         KN+d1xTpfQ7Nek6AP7Wk3tRXxCKbyt1loK20v36ouxuDcrXXGrsJCMLdvPs4co/BblSD
         D+hkI7I96oAkLQmNQ1/J1wY8vaTzhKHXlKyYnLgs5S4qo/D4LjvIU51JRxBdCjag0f1Z
         mYa5Wsn2R2qfDjoAgCUozwNGlew2yISS9q4Wi9OG8nImD2ywdnC75QIMtCfPmmblVJZZ
         +Nug==
X-Gm-Message-State: AOJu0Yz7ICTXdDqJhTke2DJvKKpKNqOL0n0VwoiFSmNSgNhvTusGnI97
	WVJXzv08RcmfnLivefh9rKeKXLHLJlD55dBmFeq0vKGzyZMOnFycc0mRAz8WtD30u5JQGZCo/bS
	QCfdNl0z/pfl70AZgYldtPCoam+/n+y5GRmx5
X-Gm-Gg: ASbGnctGNZSmtfCwHkaY5xwIRKLfIaGisY579wrSLwFXXsW5to8Xdw3XvBxPCCV915d
	JZjVFGP+tm3lgcosz6kmfZcr0P803o6RbGCAI1bXFZJkzaY1jRFA1dy4pOQY7ivt8AA==
X-Google-Smtp-Source: AGHT+IEgqLUMUT+juj9Mz/4TVFLG854CMxmP4SkHc3G7aR8QuFtzd3qYLUl66jeKf0yyTAiDhmt6EUqT8QmMjt4DZac=
X-Received: by 2002:a5d:64aa:0:b0:385:e0d6:fb48 with SMTP id
 ffacd0b85a97d-3864ce894b6mr2199747f8f.7.1733917752950; Wed, 11 Dec 2024
 03:49:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202412111617.7lVvmoPB-lkp@intel.com>
In-Reply-To: <202412111617.7lVvmoPB-lkp@intel.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 11 Dec 2024 12:49:01 +0100
Message-ID: <CAH5fLgjmtuZ7Sxp49GoGC079sXqS4wmsEmZKM-T4Mh9FycDYGQ@mail.gmail.com>
Subject: Re: error[E0425]: cannot find value `__tracepoint_rust_sample_loaded`
 in crate `$crate::bindings`
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, "Steven Rostedt (Google)" <rostedt@goodmis.org>, 
	Boqun Feng <boqun.feng@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 11, 2024 at 9:20=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   f92f4749861b06fed908d336b4dee1326003291b
> commit: 91d39024e1b02914cc5e2dbc137908e29b269ce4 rust: samples: add trace=
point to Rust sample
> date:   5 weeks ago
> config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/202=
41211/202412111617.7lVvmoPB-lkp@intel.com/config)
> compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51=
eccf88f5321e7c60591c5546b254b6afab99)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20241211/202412111617.7lVvmoPB-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202412111617.7lVvmoPB-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> error[E0425]: cannot find value `__tracepoint_rust_sample_loaded` in c=
rate `$crate::bindings`
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
> --
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

Would it be possible to update the bindgen version used by this robot?
See commit b2603f8ac821 ("rust: warn on bindgen < 0.69.5 and libclang
>=3D 19.1") for details on why.

Alice
