Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE794570DA
	for <llvm@lists.linux.dev>; Fri, 21 Aug 2026 09:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787304039; cv=pass; b=IGW45tinQoiWcupJby0DrHu8PfJI2UbfiYNsRwy+sQh7B66HEQskfbHKjDODBnPbJJhSuO+IrqAh3b5YaPGsj/7iY9Cen/7epKTMdOwr7Gc2RY/ntxw1+AQMfhNPCBqhoogAanMkjWD7N2RKQbOTS12ouS4pCawr7GwwYcL7GcI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787304039; c=relaxed/simple;
	bh=E4zb8nb4cf/tpYQwGQJz33v+VSbtCZjWNTE/nT0ENKA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G0htOwdIgT3xkrl34I4ohXQO3NyDY75EE9wMWDxeiwfevCBWYRlEpi1yjPL78WSASQwWSbHyH4OtQnyq0CAjWnTQHgCCur7B9ulm+MdFG3+/ix8rlJw5XBvMgTpX2xGHvvDefbOmc8NQCef7ZTFTle1BfV14Wt2fgb+fit0gvEQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cojdy9ME; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cojdy9ME"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d027b7c8easo1373815ad.3
        for <llvm@lists.linux.dev>; Fri, 21 Aug 2026 02:20:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787304031; cv=none;
        d=google.com; s=arc-20260327;
        b=rYw8SuG2NLHNRb89qja5qTBE235So/7iGXa7txwA0dxF7BnJn4oSQszANKu3oQkuqk
         9ioACFjeffLyeAghGSZ06/9el5VY6AHVH6hi1phWPjxb7PSkvBGQLFy+AgfDUNgR11hj
         MrAURPXl+HPw/rBIkkvweBa6gVA5oj7IFw9SdNtnB0izIddodIvucNv0fzAS2DpqlkPb
         Z6YBJxx4QF9NJL5c5yXPOfGTnPEUFoE5y9fthnUrNmDjKl9yr/9FaclnIiWYBBLSihCb
         fpcihD48R3jgO/jLjnp47J8SOX8KsvG0fAkfuarPhdkJ+ubNZNNUPpASl772VW5GNvbd
         n0rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gOGk4r4U6YL2667EvZgd5D7Xq+uTIlLJ4oKbAH3NH8s=;
        fh=pw2FCqwQmYMZZHsD1aoNo3bLMlXpNqdUN0tLIdcrxJ0=;
        b=beI1S17tOh8s9QZTFZ1bArQqnjsojNh9pAXwixvKvsit8+KIDCsLpuXe8/uWpbKfnV
         cENm4bDmsG9Or7MXoGy7KSA+j8mcafJVNcalvVVQZ3kxosrHfKxuN7JDjLckxYWbL9Gq
         2p+sBKW0kD3zEzMueSgUblGpHZEy0r+lXTfBv4MnmN/0mfZ8IaaJceIw7AKD8T4K7MrD
         dn5EtNm8onchMolMN+Ows6jbCBIZaNKLOU3QDW6YRjUXICCbQd80e/OcSudKRiOGns+o
         TlqfzNY8bcJteIDI7IakFfMwcoBPydHYIn+lLnndF1QNUrZ6BLXcc97SVL7Ajxgjbdvt
         ThlA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787304031; x=1787908831; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gOGk4r4U6YL2667EvZgd5D7Xq+uTIlLJ4oKbAH3NH8s=;
        b=cojdy9MEvU36gk/m9tWrSjy1dbh05ABeY7/zqB4gq4Cgcia03Xw79azYL5GcR7azvB
         etnLrBFtHhcSoeYKxRKRc5mWJtVKFYJ7ewdTODUNL57GK585UJIQKF0rwSL+Cr65TBJ7
         qHhdNZfxISyTurmFpbugXCzdGJARN9X5Fg/rrWFQYv2ST3s/KpGKbGy/UoplMmqfnRGU
         Mwjxq41oPIJlCexH7Wh+HtmfapJYOuvwnz2s+tr18KAaKKxBdfdeDYhcEqB/WlF5ypiU
         kT0viKYthYFMKTK9XNtILuIUm+U82mda51IS/sHPk2OKFAWteBt5N2Zym+DvcVejTS9D
         s0lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787304031; x=1787908831;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gOGk4r4U6YL2667EvZgd5D7Xq+uTIlLJ4oKbAH3NH8s=;
        b=lulnlOW28QKrViChPWb3aYcE33ZmFrmy3sNRTZOT/YUB2W8+WIS2tA3OcBuM7WI6U+
         +VCgvCEADqrYq1gOrxTMJvbfjjxtdEhcoGA7dRWgXB0+tWcEyFgL5mzV0BIGHbJgVQbl
         SWuPfKHUTOS9EJG6RvxxVipVjyAqmhuX9T04S34SM+XzOAAaPKqyTt9+84gHsg0yLKeJ
         HkxoroTo+zUqT9nk+A7LgeAISQnPlxyZyjyLBmCSZ/UaR4DXj+QuIameBrLXNtn5U7GU
         VfsN7gI+0MP1Fk2hwTLNrB1ImmICMPe12760EXCsl85sYc9JMi35mwUJFRfQaV4rZ1W1
         K7cw==
X-Forwarded-Encrypted: i=1; AHgh+RqZX4xAfzyIfus7B7HS+gdRQ/kUdWZ+4V+MsAHWBZb20dcRc+fyoC8G/wuuWZf+ngInxgex@lists.linux.dev
X-Gm-Message-State: AFuF++lveoOgz4T+Woquh28i7jynMi54kp8CpEjusS9jSwzn758b61dU
	EILB6MeaqX19Setckz02e+kQ8lzfkJHhxFSYS/FIzcNMPiYkrRcC9XO2Qt0vFJBS9laSOer7g16
	ywlubgaF7zxSwY3umn1Fu2XKk9IydjoA=
X-Gm-Gg: AR+sD11mtKZxV0qPBsCv6XmIfgPUXG/G+hEcGem8QWC+lWxXjfW3M1/KiQQH0DSX6FT
	w0e16YgKjoq+b3iNZByS/etngmFLxGLaTHwoA4SmaPr+jpku5XbODCpkLgbGpxKy7tcoO0bJsBW
	JUZ5hsx9LG468WmjD1lPV87J/9lenfwG2FZHUtZGqek6rFcZz3faxWoBpU89SWLX3cuf9tt+Hyo
	49pqQY2YgDe2D8l+u3djVxoQs9Y9nEHnwdfzmvOx5N7rAeh81IbC4Wn/NfoLfyeRWkVvO45ixcn
	ZwUyX7uyBU5zHPWJ442uMOOMxOHvKZSG8G67qDz6xeF5MGlQi93l8E28KMmsqVU625B+Y4MMqU5
	R8AGZ9wctNt/AYP9cQQadUtffbgyOFYlO9BdLRFbBuBG651F2lAlnNVQWEv8vrYW6aOKWJyQ=
X-Received: by 2002:a17:903:1847:b0:2ca:d803:5c8f with SMTP id
 d9443c01a7336-2d64adc9846mr49568215ad.1.1787304031240; Fri, 21 Aug 2026
 02:20:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260820135733.37121-1-gary@kernel.org> <DKTW8F3C5TC1.BE0JLOWMZCTX@garyguo.net>
 <CABCJKueCgEZ9XePNnJhbxbOP=v5X6-PvFg4poRfo=j6htovJFw@mail.gmail.com>
In-Reply-To: <CABCJKueCgEZ9XePNnJhbxbOP=v5X6-PvFg4poRfo=j6htovJFw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 21 Aug 2026 11:20:18 +0200
X-Gm-Features: AcwNN1WvsADV8MMuI-iTtWhTbjyEYDjf-9ZfUuCq94WpdMme_2NkgLvAR0YHzPs
Message-ID: <CANiq72m9v0V5Nnc_E1LUt24ofUUGxbRZdUC-UBz2NEbY_MA=Rg@mail.gmail.com>
Subject: Re: [PATCH] rust: cfi: disable function merging if CFI is enabled
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Gary Guo <gary@garyguo.net>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
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

On Fri, Aug 21, 2026 at 1:43=E2=80=AFAM Sami Tolvanen <samitolvanen@google.=
com> wrote:
>
> The LLVM fix itself is trivial, and it looks like a pull request for
> it already exists. I assume we'll want to drop this flag for fixed
> LLVM versions when they're available.

I will link it in the commit message when I pick it up soon -- already
did in https://github.com/Rust-for-Linux/linux/issues/1132.

I also added the `-Z` flag to https://github.com/Rust-for-Linux/linux/issue=
s/2.

The `-Zmerge-functions` flag is internal but has been there since Rust
1.34.0 in upstream commit:

  b91d211b4030 ("Add a target option "merge-functions" taking values
in ("disabled", "trampolines", or "aliases (the default)) to allow
targets to opt out of the MergeFunctions LLVM pass. Also add a
corresponding -Z option with the same name and values.")

so that should be fine, but I will ping upstream Rust so that they are
aware we are using it.

And, yeah, agreed, we probably should remove the flag conditionally
later on, to confirm the bug is gone etc.

Cheers,
Miguel
