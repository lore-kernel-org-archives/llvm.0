Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4221BC41
	for <llvm@lists.linux.dev>; Tue,  7 Oct 2025 07:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759821355; cv=none; b=RTjaA6CHOuS4HM6fCcCpD9HLAr8kO662Wc3HKXYtrv9WaCBCXkByrMj6HdrD3NWsw+S/ozIW3/zNDT/ptHk2UEYUIRsrAx2L+fMkn4M2a2ZkteIeLGMDJX8zx2ohtyou31aeQNI7dHax8nW269hHQsrUivgFI/c2kpWxHjti5Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759821355; c=relaxed/simple;
	bh=z9ZXgLsIETBZdYU+Z0pJbtRnOe6ikC0HYb6Bt41W6xU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GNp1s2aCHYIwFK5YyA7yCxpE8PWP17Gq2PmzQn8ZM5bIyqvB2UsKSUAGSFwc8Qt8QVO2BhUuBKtxMfb+270GB8XjNtZUcmFldVlz4BIOM5mOhiOSPDrrY1EQRwxA44KYYC2+N9NgN1LjYgvhyr4j5nQ7+/AIw57mDC6XxOX0CkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0w9W+jJg; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0w9W+jJg"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-46e2c3b6d4cso47339795e9.3
        for <llvm@lists.linux.dev>; Tue, 07 Oct 2025 00:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759821350; x=1760426150; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lEDZ0FsctXTT25PdUb7+D7imSwt4Fuc+97g/5BQFmmw=;
        b=0w9W+jJgXX8uQToQnRIT+orpQdtY03eb0y6vKKlmmrdjEQm7ZSS2SnHE8fMF6nCwPh
         MUsrFKy7wf2V02xrdv60RB9Wb5hmKXT9Oc1xOhx82GA232FHVc9571eOAWENZhTlsyz6
         3nN+qu+TR4kazAa2BpA3naOvzPGpbiYYGMeQwl+J5sGyjWdhrODT4R7pOoFaB24u7ShP
         nK2Ct5aJbB5ofWIzAfllf85XcbleF+3aUiumi4oMkyNAjmd2AnAnMsCaL4otEdIlMm4/
         8r1A3eSjQatoIl5j9Sot6ZsBDSkV9lR67XqtPVeKk4UJnMyDg77k1dKn+N60oxIc3Q7x
         itxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759821350; x=1760426150;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lEDZ0FsctXTT25PdUb7+D7imSwt4Fuc+97g/5BQFmmw=;
        b=Xh/InwEpb3XPomLFfzsc6kzNlwZz7Uklv5cFhdf6vYBlzX6lRwQRz6h/DlMuwyz6J4
         couY4LlZy6+Pb8ypLLyGgiL0SBVIp0WnKrbvrZyr8/ohMc0AK6bbFZUG8mXTrf6xdNrn
         dsYXSX9ypVN2ECWk1aQmrclpt+o6hAiEXvIuIYuh8l8ckMV0QhzUgtaYgkgLZs9+tB6/
         uPdKCBq6L8S7HHUwjisiaMfnUoSqjyqGcoO7WYTB75VS8fAqbTTbNBhIpoWliXi8Rc48
         hZVtbryRcGtx7m4YAXOxowVnK8dLC1KWz3mY8AKvbOh9EONM4J+POy82f/TxJLK4UkVh
         o5eA==
X-Forwarded-Encrypted: i=1; AJvYcCVVb1HKgp+13USx1eMdi3dIl3+G1wr3AMY5n1afjzeQf+iAks0e7+Rrz6Dw8oG2/3kPP8Np@lists.linux.dev
X-Gm-Message-State: AOJu0Yzuc5xt++A5N056Xkt0GYsiJBwe1lwe4u36Owac0Z3OsiS0tlXJ
	NTiiEv67ZpA5/q7l2kjzCHILxpZfJt3sPn3g8JZk8cVsvRr9WdgO7iTcawqZuDYfrZfTs2z8r91
	dkuYFEmmx7eZ5GGq6/RESYzPw+q0f3U6makFkeifD
X-Gm-Gg: ASbGncsXKG5MLmZ6tEi7Adz1jXziN/RFm0N/V4T/k+apLD//ejrfVfrXAH52GNhZ9pt
	dUYtJtvwIBJ9QQcgQtRiWth5umSEyduaW1YsV03QeFd4R8AsDHyLFEznVwoFZMsUiIpU3CbhVvf
	TFWRvu1KKXXadQa+njC3X2Q7wdMSQk7oQNNl92FYGtXULGRhRCuMSPy6BwLlAFHYqj7X+s4aQUa
	6gDjnUbwl5LO9OB6eui+iZHDhKbVNqJ4BzcBlZmYcv4NDZfI12SDtnYS6aYJ/5ddo/fMxdxnTyz
	Uw==
X-Google-Smtp-Source: AGHT+IHN82I6u9PV3m3T4AyeGxqQDcrMtP+2C7gcRrU3bk8X8rWbSiECp23jl+rfoqveFg745pQlgqV3AFCycsCdTp4=
X-Received: by 2002:a05:600c:1f8d:b0:46e:4581:6634 with SMTP id
 5b1f17b1804b1-46e7114684bmr95963215e9.29.1759821350287; Tue, 07 Oct 2025
 00:15:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202510030449.VfSaAjvd-lkp@intel.com> <20251002141925.ab86656b1d50f6e27f216209@linux-foundation.org>
 <CANiq72kOhRdGtQe2UVYmDLdbw6VNkiMtdFzkQizsfQV0gLY1Hg@mail.gmail.com>
 <20251002152753.c756678dfdcf739e2fbf74f7@linux-foundation.org>
 <CANiq72kWWPAZ3gq2ktMpVeMKpWOU1nAmYi-4d-BgbuDti77ggg@mail.gmail.com>
 <20251002154323.ca15e98421255ae2978e8d6b@linux-foundation.org>
 <cd2ea7d4-6b12-4933-b1ae-cd4db18d3671@nvidia.com> <20251007070611.GA88971@dev-dsk-acsjakub-1b-6f9934e2.eu-west-1.amazon.com>
In-Reply-To: <20251007070611.GA88971@dev-dsk-acsjakub-1b-6f9934e2.eu-west-1.amazon.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 7 Oct 2025 09:15:37 +0200
X-Gm-Features: AS18NWAypYnO3FSMvWWPHzph4WyVFTzlcHH5O53Vehnkv-a0YVg6GpPRGHeldOA
Message-ID: <CAH5fLghTu-Zcm9e3Hy07nNtvB_-hRjojAWDoq-hhBYGE7LPEbQ@mail.gmail.com>
Subject: Re: [linux-next:master 13069/13300] error[E0425]: cannot find value
 `VM_MERGEABLE` in crate `bindings`
To: Jakub Acs <acsjakub@amazon.de>
Cc: John Hubbard <jhubbard@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 7, 2025 at 9:07=E2=80=AFAM Jakub Acs <acsjakub@amazon.de> wrote=
:
>
> On Thu, Oct 02, 2025 at 05:24:48PM -0700, John Hubbard wrote:
> > On 10/2/25 3:43 PM, Andrew Morton wrote:
> > > On Fri, 3 Oct 2025 00:39:16 +0200 Miguel Ojeda <miguel.ojeda.sandonis=
@gmail.com> wrote:
> > >> On Fri, Oct 3, 2025 at 12:27=E2=80=AFAM Andrew Morton <akpm@linux-fo=
undation.org> wrote:
> > ...
> > > From: Andrew Morton <akpm@linux-foundation.org>
> > > Subject: mm-ksm-fix-flag-dropping-behavior-in-ksm_madvise-fix
> > > Date: Thu Oct  2 03:37:47 PM PDT 2025
> > >
> > > Rust bindgen wasn't able to handle the BIT() macro.  Add a helper (fr=
om
> > > Miguel) to fix this.
> > >
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Closes: https://lore.kernel.org/oe-kbuild-all/202510030449.VfSaAjvd-l=
kp@intel.com/
> > > Cc: Axel Rasmussen <axelrasmussen@google.com>
> > > Cc: Chengming Zhou <chengming.zhou@linux.dev>
> > > Cc: David Hildenbrand <david@redhat.com>
> > > Cc: Jakub Acs <acsjakub@amazon.de>
> > > Cc: Peter Xu <peterx@redhat.com>
> > > Cc: SeongJae Park <sj@kernel.org>
> > > Cc: Xu Xin <xu.xin16@zte.com.cn>
> > > Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
> > > Cc: Alice Ryhl <aliceryhl@google.com>
> > > Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> > > ---
> > >
> > >  rust/bindings/bindings_helper.h |    1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > --- a/rust/bindings/bindings_helper.h~mm-ksm-fix-flag-dropping-behavi=
or-in-ksm_madvise-fix
> > > +++ a/rust/bindings/bindings_helper.h
> > > @@ -99,3 +99,4 @@ const xa_mark_t RUST_CONST_HELPER_XA_PRE
> > >
> > >  const gfp_t RUST_CONST_HELPER_XA_FLAGS_ALLOC =3D XA_FLAGS_ALLOC;
> > >  const gfp_t RUST_CONST_HELPER_XA_FLAGS_ALLOC1 =3D XA_FLAGS_ALLOC1;
> > > +const vm_flags_t RUST_CONST_HELPER_VM_MERGEABLE =3D VM_MERGEABLE;
> > > _
> >
> > Yes, this fixes the build on my system too, so:
> >
> > Tested-by: John Hubbard <jhubbard@nvidia.com>
> >
> > ...of course, we'll have to undo this later, as part of the fix
> > for the Rust for Linux build system, to handle BIT() and similar
> > macros in bindgen.
> >
>
> Hi,
>
> sorry for the issues this has caused. We're also changing the other
> defines to BIT() for consistency, it was applied to mm-new in [1]. I
> assume this will have the same breaking effect. Not sure what is the
> solution - whether to wait for the fix mentioned by John or add similar
> defintions to a/rust/bindings/bindings_helper.h for all consts?
>
> [1]: https://lore.kernel.org/all/20251002202112.C2293C4CEF4@smtp.kernel.o=
rg/

You have two options: either add all of the constants to
bindings_helper.h, or use an enum similar to commit 3634783be125
("binder: use enum for binder ioctls").

Regarding John's mention, don't expect that for a while. It requires
support in bindgen, which is shipped by your distribution, not Linux.
Therefore, it takes time for improvements to become available to
everyone.

Alice
