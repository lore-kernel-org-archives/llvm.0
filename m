Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795002775;
	b=a58DlDSWnrM3pleewB7G5s5DjwP2dkPPUBrr1zNOZEsvGNUWxntmOACyA4iMkgMLAIia
	 4wUii2NiFyOhwJsj7aYtrYR6FaWTF3mF+ShxxWILItK3CH3mQiCe0j3injQX5gVmSsSMA
	 tNIe2kI7oT7oHuojprnLKZeFREqRMlNMkOctY1rm2vOO3hGRZR2Na08RYf/sTs1RJBgdn
	 4sEg8Pd8MNdLo6Zwq+FRgCI98+VCmPbmUDqLiPYlw1NPB7ispVgvR8t548AmIybHwt6V6
	 hY2amZe/PyFGGH9lCzAtbGQUVE4lOllpQwWTz2NvLDx4Ic4WsRod/bHNC0JPher63sQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795002775;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fuiSGVlrKGpkb2IYU7v/zhYyv1xq0dvV6f+0akTmk4E=;
	b=SCE7ILeD1y60FYC9U/ALtZtaxHHYZhcpf1brM2Rm8FBM7CP00IA/J1aidua5wqwx0Npo
	 QdbZargcP+9wjwwKkkq1fmY4YGrLeogd+uq2p/IhsCTQdnIxJ4UhNwclPjPhr2692k50K
	 HtDV7f8xxU6bxPGHi//x3lbUPcvn1P/hFq4vH27ePfx/BOlV2b0I1tv4Y/4PRLMynp1CH
	 HmzB2woBKN20u9Ha8WdaPlAl4XE8dxFB+HL3dV0LquktBWyDLKF4IHY34Qsqn4PqWwzjg
	 aNUwy3OX+rGj/3JkYlzf9MKHfRuT4b0wn2eQJHghiZgS/i28QKKAEPEHvF/yhr0aMBQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Q2j9gZdG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E4F606A32A
	for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 11:52:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60E4F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Q2j9gZdG
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso6730455e9.0
        for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 03:52:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795002773; cv=none;
        d=google.com; s=arc-20260327;
        b=mlE+DwC+ti/RqC/5vdeY8O+bA/wqmavwU0ICSxFRau+Rn983zS6mIHiSs/1PEXYWaL
         BAZJy/KJ3TRv+L5jvjSuYyP2V94rWWoXW6kJcqWnNLz/zAxuGAsBOL7UA9fnjWRTWWT0
         xr3AtbZL4agHepQ6M0OYeAHHf6cCzVOEw+iOY8bTtShuxKCC/FElvv/BZvXvh/76tUNs
         qKdQPpYCLF+Nx/UAiT3CDg1md6eKfWkzo/eHhQ7+S7FQOj3ZstJicZd1SXCdzWi2PwoW
         UTX20sxb7M2qMthM74gCPwgSlBj7rNeEmPo86/wTvnlSfwR89ZnRQgs7n+fG/146IsSU
         vjdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fuiSGVlrKGpkb2IYU7v/zhYyv1xq0dvV6f+0akTmk4E=;
        fh=1LQDMAjSLcy3qCc2H6IyiS2YOnkdMZUZgVGtJh+J5Iw=;
        b=JPuIzmNQZRRhOQfYpr/MK8h7a11mCeECG+rql1EWqzZlRfMjluBQIPLT2HfeUEbbmu
         DHYSqRhr46BfPPQZVop5x7k68Dd2uDF0xoC8Ke5dgPMUsKabhdTLoh5aCD/G3CFQE15U
         yByXdekYQYzbTQFKN6ZP4EJ+3nIDJ0P6w37Mnb29+fAXHP9FEigE8wpbfwsXLfdty9pS
         j4EzWpjoayCTs9BoLZvzfDEp5uk0SLKOJP3XMVJoib+2HAv9WnEm9ei9UHsbGRES6Z5s
         99XXWwU5H9bi17CXkD24zamQWXBOYK0K2esWQ8Mzcxmxm866xtwQHX5ENGRj1J00oGpA
         HDGw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795002773; x=1795607573; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fuiSGVlrKGpkb2IYU7v/zhYyv1xq0dvV6f+0akTmk4E=;
        b=Q2j9gZdGRS73vgn/SYZy5x2TLwWny1kaGtjHoj2H4RyJmin/JQXC405BTZ1w25/Xr2
         Tf1Qh9AKWKuFsDW/jN5wmrscCriXctlwqYCNVFB4/C9Z+sHBdFlXDUIjEgVqHzcnFBz8
         J+Pn3ee7JB+Ayx7vBzLkhe6a7ykZZRDqvrWIFYc2mG/o0FQQVcEzrF+xM4Rxnl+sDZ39
         IU3XYVr6rJ4oa+6ZfJ/dJh0LpiqRKKRf+r+RuPUarBJPx3taPI9ed8WfkGci1ib95Grg
         9bV0OG+/VUcGzmt9iKCROO+ifLp0IupYf2EjZaqS3w+d1SaY5NqVBOdhwVwDncefttn5
         KfcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795002773; x=1795607573;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fuiSGVlrKGpkb2IYU7v/zhYyv1xq0dvV6f+0akTmk4E=;
        b=hvYLISaKwp3pyrYcRIjzn5/Y/c5nDg4byW2oYBnxQaHsdLTWqIuN7qoLxk4bAzDPz8
         hkuBz0IUKgikvjT3lYVEps9ilfC8vZwZrYCRRzHXaVqN91bj9xL4MfZNN46Hyy0CrEwU
         HjdlgjvieQPWGcuX6IuM2Qj2JHlVlkSclENUllRyDUD/3OhPO1ZAj25qJv1NhlckpyS/
         V+9Ue7SZ6ofjvH9V1hC4Nv/ukHIoscrQESTjsYgX7LEfpmib9dijvNsjhnIimj0LbdCL
         1JsZckMXpvW8+eBeYHPxtVR1JIIV0BABN1xSMEHOLFjHCEWXrIu6Ab9mzPO4DrVp4uCu
         pYjg==
X-Forwarded-Encrypted: i=1; AL+hErHbGQFNdLGYjaaag5CrHNsUrSqvZbifXiwdykVx7UnyH5PAv+GJJKr7GqAosd4XaaXHOL1O@lists.linux.dev
X-Gm-Message-State: APuU4Z88N8Y3dW5FtWmi2o33HcLEL7cKwxgPboiUfWz3zjdpkn+RGkqa
	It1stwT++FUq3mdbEForQ8gQfZUjN1Zm5seq+XLrLMJH4ZkcYCq76Pc2lyt44QU3ZJ5uFQXOMD5
	iplfVPUROB7ksgUc37T2S30xNRlvm1j/ddrm2j2kX
X-Gm-Gg: AYBFou0ZZ1DhcvWH4phR/Cd/ePqSbR57sCbBRWneQjGQh3ydV6oU74lF2SdjLMw2rIX
	lhHjMiq/FICr7mFhwMNmVVeyD8B47qKwxOyR/E3U8EHMus11dYEhII6kH5aXmto2+d7X03ltuvk
	O7C9qc9BriKpNYgYZnj2l8nJXvJyN/CRupD6Fizd4uLQsZw1X8A4zl/1kzL2GoHMTGQv/ootFZJ
	6zJU8kh4RvzHFCC9UiGmPkO0PLDIT9iGmD/w8PkgGw10w6GpBFJvVGYMMtjB1GCzutjlm+FfV0v
	5V7sjOmBUON2DnypChyJSEAWTqn5oLLpsUBr5KMn4WOS0r2C/lczhaIywCURvH+a0/e65oOYEFf
	wL106uxqr8SczpaHfhiqRV1LgJOswZ2ULDOoJXAtuS0gVGNwdhMIPGLkXF6g8NJGTFxmLdmQX9Y
	qubXzNi3MRxas8kq8pdT+TrRFSaw1xJjlk0ImvcqdW7KyM0PKop/DUXfEph1ExjwCgtQ==
X-Received: by 2002:a05:600c:a303:b0:4a2:84c:52f3 with SMTP id
 5b1f17b1804b1-4bb7da13acdmr37565995e9.6.1795002772260; Wed, 18 Nov 2026
 03:52:52 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20260820135733.37121-1-gary@kernel.org> <DKTW8F3C5TC1.BE0JLOWMZCTX@garyguo.net>
 <CABCJKueCgEZ9XePNnJhbxbOP=v5X6-PvFg4poRfo=j6htovJFw@mail.gmail.com>
 <CANiq72m9v0V5Nnc_E1LUt24ofUUGxbRZdUC-UBz2NEbY_MA=Rg@mail.gmail.com>
 <avy_9SPRaPSKD8b4@google.com> <DMYASURCURHG.2Z417FHDGBR5F@garyguo.net>
In-Reply-To: <DMYASURCURHG.2Z417FHDGBR5F@garyguo.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 18 Nov 2026 12:52:39 +0100
X-Gm-Features: Aa3M54rk28vpmTCa3HDqQLECd8XwI0zPt6LHL51Y7EEk1gBPhG59tDP6nvzdrww
Message-ID: <CAH5fLggQ=N5D3DyCHJyLMB11XEyJF2eVBndYwwktLVeVfyOJpA@mail.gmail.com>
Subject: Re: [PATCH] rust: cfi: disable function merging if CFI is enabled
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, kernel test robot <yi1.lai@intel.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 12:25=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> On Tue Nov 17, 2026 at 8:58 PM GMT, Alice Ryhl wrote:
> > On Fri, Aug 21, 2026 at 11:20:18AM +0200, Miguel Ojeda wrote:
> >> On Fri, Aug 21, 2026 at 1:43=E2=80=AFAM Sami Tolvanen <samitolvanen@go=
ogle.com> wrote:
> >> >
> >> > The LLVM fix itself is trivial, and it looks like a pull request for
> >> > it already exists. I assume we'll want to drop this flag for fixed
> >> > LLVM versions when they're available.
> >>
> >> I will link it in the commit message when I pick it up soon -- already
> >> did in https://github.com/Rust-for-Linux/linux/issues/1132.
> >>
> >> I also added the `-Z` flag to https://github.com/Rust-for-Linux/linux/=
issues/2.
> >>
> >> The `-Zmerge-functions` flag is internal but has been there since Rust
> >> 1.34.0 in upstream commit:
> >>
> >>   b91d211b4030 ("Add a target option "merge-functions" taking values
> >> in ("disabled", "trampolines", or "aliases (the default)) to allow
> >> targets to opt out of the MergeFunctions LLVM pass. Also add a
> >> corresponding -Z option with the same name and values.")
> >>
> >> so that should be fine, but I will ping upstream Rust so that they are
> >> aware we are using it.
> >>
> >> And, yeah, agreed, we probably should remove the flag conditionally
> >> later on, to confirm the bug is gone etc.
> >
> > Function merging should also be disabled with gendwarfksyms. It causes
> > faux::Registration::as_raw() and Page::as_ptr() to get merged, which
> > incorrectly causes the former to get the CRC of the latter.
>
> Do we not want merging at all, or only when the types are not going to ma=
tch up?
> If somehow the KCFI type metadata is always emitted, will two functions w=
ith the
> same KCFI type metadata be mergeable for gendwarfksyms purpose?

In principle merging would be ok if the gendwarfksyms CRCs are the
same. I think that if KCFI hashes match, then the gendwarfksyms CRCs
are quite likely to be the same too, but I don't think it's a hard
guarantee.

After all, for a pointer to struct argument, the KCFI hash depends
only on the struct name, whereas gendwarfksym CRC also looks at its
fields.


Alice
