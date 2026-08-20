Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8B939D6F2
	for <llvm@lists.linux.dev>; Thu, 20 Aug 2026 23:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787269407; cv=pass; b=JvLVGi01qHI9hojw8MIDtHVbeG4koe/mB66gwYeWFAemMcdR+udX6OzIjVO11kwATLMCNurbKZBI8rPJZo76UIKVEg8hf3CnPoTUxNXfYIhHQ3HJ+jtpu4h5DCpmjCdSUBfE6ToE4Uf2pnV/VOH/UOnjBdzXTENZsq39p+I2Jh4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787269407; c=relaxed/simple;
	bh=+6/iD9uitv2o8+BkquhyWkx4ZTHDQ/4DAVwS8twCjao=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uqaOUs9WXssWOy1uBQe7NV+gNjTNMofuFlEMIEqC2YhZCqVU761YxoH4EtKSgI23w49hX1vIBI66U9Doly3dwGrMPlPr9QySpR1o3asNCunToOWlAMRtBIdQqTi1zr+X44538ZQgogbOTY+kL5MJa+ffhZmlR2swwKEfP9QC2KY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gfZqYvKl; arc=pass smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gfZqYvKl"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-498012a61f6so26735e9.0
        for <llvm@lists.linux.dev>; Thu, 20 Aug 2026 16:43:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787269404; cv=none;
        d=google.com; s=arc-20260327;
        b=Qap8dnZR2xGO6E35tQf7zcWzPWJDuE5B/PVP566C+jVBEM7jotl7Z+nnM6miMem/4+
         sM5Sk6n09X1njGaH378Gy4U/SJPn7WW0xEVuTUpyXM/F7BDBSjqYTSlrr4N/BZBbsZfc
         8ioUrivCpQh8R/J0MU3n2Ncvdgwdid9HDsclbitxIBjMPzI8wHxuXdiCbWnZ4hkWmqQ6
         dlR8Ktm9eOHGKEPQ0e1ocgIlYjsIV7goFb0M3SLYzHx03S8oLY2ZRoO48e/KtAdZ88VA
         FUFzl4n2TRxtglchMVdnR+AxYDX8WpWSpCNN6X+3rkhnoGe8v5XyCcZ6piFtCyctlbWy
         Y4pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+6/iD9uitv2o8+BkquhyWkx4ZTHDQ/4DAVwS8twCjao=;
        fh=GX20HDRXDaR8aNyRe8ScJsWVqt6nSVCbRhtPQhGZCYs=;
        b=PPOgNtuSE0CQOnVRlVv9+Q4uVZgEmKSw69w4eSenUT8qP1i6Tijm7pVCa73Qs9r0b7
         HSsyVzql9GcbN79orURDrMSEqzNDHtoHHD8UzH/IykqyO8EkmMGcat71yBqXSI9PyI4z
         a/Bv+lAWwCUJiL3u2+bfqJ3HSrDYzei89+SlStadVraUVxZd6puqyQItzu3fu3RZ3vtV
         siX1nAoIzJNQKf/X3aIYuhoU5TzD5rY14elvoXsVoAFKHjuPdzwCboLQIsKgQJt2e8f2
         IWtSjVWjpexuVyRZLLoOAutiiwqQUDGOx8+YFwAmWmlNR/dJ7Lw6MENvg/dp3ZaY9WSO
         AO1A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787269404; x=1787874204; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+6/iD9uitv2o8+BkquhyWkx4ZTHDQ/4DAVwS8twCjao=;
        b=gfZqYvKlVe6qeUwbg1yTmccMwgS1EnJjL5yo8A24YRlHfYyLASuK+yG6lIz4ugsXuP
         U/2H5uHXdZxMIa4nfXqK8OG2cSqVM2er1g4z2mtC2kumdhWjF8sFLGJcE2JbEHDIB7EN
         Tr3fGZ1shyTKOrc0G01hJK++MwDnwLjx1EXqBqkcBTyu03acHqsXf+5DSASABwDSIj39
         PvTBM31JzKpMxCfPysYnyDI+/KVE+llCBg8HmXZ7QOXzyHViVUKgCeVLoLol25Q/aWHa
         H8Zj/jMJalNLFrJ0unnuKAQ1z7hE+BQdvFpqPRprlV+V8gJoIiA8Lb4qAebYT1r/nApL
         Pfcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787269404; x=1787874204;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+6/iD9uitv2o8+BkquhyWkx4ZTHDQ/4DAVwS8twCjao=;
        b=a9kO8oiKw9Jq6UGefk6SuNNJ2BHOO0rnEOmzB5rzkUQ84E8zkS7dsDwFBZu+ssN2cn
         5wp04bokowQlNi6H940r/qXU5zXanuH3IO/uDq1m8GUFOMcE/Arvk+XywsdG+HjUAPax
         ZWH2PajJRN7aXwJrVUX1EAaulS4g19T4ueTYB4S0lfzVvmwC+egpUMgJDDOxwFPB/xhA
         e8h9TUejKV9fxu9KOgDd0z5vOGmGGium41kOQCiz4GNVUIU1ZN3Fh5t34RHg3sSnbhu+
         1DgcKErv1puHZV/6nzyDvOa4dsZDBJRlHQPcrPe7DS+IuQGmaKZx5Ju/FgWeCBtWFJdQ
         9MJw==
X-Forwarded-Encrypted: i=1; AHgh+RooV4JKMRsrvNgQMLeTPBCUCwEygCAuFMWuUPLLXNU8KAtV3xIgpxW2tYpq3DaJoRWrcQFO@lists.linux.dev
X-Gm-Message-State: AOJu0Yyi+P7qrHWqvPNgXIZtvv4b1CpLrGrr3z3fBXun2XIK+VG/j3dE
	2TZelPa0O6Z2m6sRrm0FKi64yKt5l+ol4gnNBk8B58Oe4gFe9TflYXl+gVT/IueW1BuLbZp0g0v
	1FloMYfFHUXlJ2dTAN2rLq7kV1j5Qbe10X7VWp90f
X-Gm-Gg: AR+sD11MNipKNE5xPCZXAUjIBIiUzyWEBM5ejlBaooHgzxkiDHg5+13NV31O5N4/V3y
	WFLBlR+ne1aEmsDK71SU8Ci3jG7bnUaepuVLwCyz2ieFcMSn2auztxtGXXTOU4C61nxbD2cGGYK
	uAZrVt7yVK3BM1gxTOKRQoT4VyK43gAO9QQGmLbpEGtzQZRKGEtsnZ8gBHDJz1vebV/uqeIziBb
	VrHq5wCk2FeATiMlTk+p7MVWfSrQ56BllHgS8TLs4Y7oSG9XX4XO+e/b8HSWdcc8M3d2zGKgVWZ
	vcbymxp96qXdzEotXEI0BMzecfiqSJO+kD7toZ2Jl8FlzzGBsjPqmC12Qqhu2Nt6S1RWYY1icXA
	tG9K8oZ73
X-Received: by 2002:a05:600d:8498:10b0:495:3ffd:5e39 with SMTP id
 5b1f17b1804b1-499b96bb829mr206755e9.3.1787269403807; Thu, 20 Aug 2026
 16:43:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260820135733.37121-1-gary@kernel.org> <DKTW8F3C5TC1.BE0JLOWMZCTX@garyguo.net>
In-Reply-To: <DKTW8F3C5TC1.BE0JLOWMZCTX@garyguo.net>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 20 Aug 2026 16:42:46 -0700
X-Gm-Features: AcwNN1Udef14G2LArp7Ykr4UYTpyjp3Xzj1gv8pPpjTIgCKojktSd_xlqRtrfuM
Message-ID: <CABCJKueCgEZ9XePNnJhbxbOP=v5X6-PvFg4poRfo=j6htovJFw@mail.gmail.com>
Subject: Re: [PATCH] rust: cfi: disable function merging if CFI is enabled
To: Gary Guo <gary@garyguo.net>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, kernel test robot <yi1.lai@intel.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 20, 2026 at 9:06=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> On Thu Aug 20, 2026 at 2:57 PM BST, Gary Guo wrote:
> > From: Gary Guo <gary@garyguo.net>
> >
> > In Rust doc tests, there is a dummy `__module_firmware_test_init` funct=
ion
> > generated by the example in `module_firmware!`'s documentation, which j=
ust
> > returns zero. Many other documentation generates function that produces
> > zero. LKP test robot reports a `Flags::zeroed` instance; my local
> > reproduction has a `Bounded::new::<0>`.
> >
> > LLVM's MergeFunctionsPass incorrectly merge functions with the same KCF=
I
>
> This should read "with different KCFI type" (obviously).

Also the comment in the Makefile. With both instances fixed:

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

The LLVM fix itself is trivial, and it looks like a pull request for
it already exists. I assume we'll want to drop this flag for fixed
LLVM versions when they're available.

Sami
