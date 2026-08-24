Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B7F230BE9
	for <llvm@lists.linux.dev>; Mon, 24 Aug 2026 01:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787534126; cv=pass; b=jOp3q9U3VcOltfpW7y5gVXPZaSO3riavKgzr+iYkSNiNQL/PXsMXvLBXZDsAPUs5XI0ngjSH/QoHIVytJqLgGDhF3Puhgmsyp3/UJOTF6FfX6L86TJi2cG80xs4BTaw8toIXSFZXeh7WCYgha6heSHqsVJDw4uZmq5OsjpVPydQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787534126; c=relaxed/simple;
	bh=Wac+pf0DsXlahTayTTxHtjZ+4vjz4sfCHeWQqn9W9gY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XpFVZqysbTomzu5vETy6mPXYsROHA8oRmmGQE8C7m1QlOrnWdMKk/lnackA/orLGS/SvYMfFHOBRp/8cuCVotCygv+FtUSPYGSH+fk4BK0E2AjtGFFBQyXcilLDET18DkVKl5xcWIRVAaODcg+SKVvk7nHSfOV8YT/LhO9xxIZk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZiO6Kox8; arc=pass smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZiO6Kox8"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cbe41618110so252143a12.2
        for <llvm@lists.linux.dev>; Sun, 23 Aug 2026 18:15:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787534125; cv=none;
        d=google.com; s=arc-20260327;
        b=ZJYreqdf9F0V9mb7K278CJ/bkFVdVTM2uqvtFr6t8Jw7+V3rghhnzew1sII6BqnKEM
         uBobc1Fq57EJhRwiX+25j3SbWxR9WLBmNTRiNQ/CxiRyH/mcsJlw6Hai010koGN53itT
         OWtEASLakEkXpy9xqWTPTQME3qEFEP1GPauc8V9Qgcc8F02jE2fVaDID0Nz2iLU4C57W
         SX/1+/3pAxhNxKRjV7A8C2Q5rif/HsAU+/1FOEX/9Hs0vo3dw4HeC9vClLsmUl8o4LZr
         /b0mlIvl9We1zLJhV0mBBVW5ZAVKrZE2VKA9+vAW2wxon/MljJUI0SvmuSl0X4tZ3U10
         EOZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vGMvIaOFIbBkf0XrXpqeWleC5i415rguPHvnUqjmn7c=;
        fh=Oh3ArhwlqSJ4clNIriTGfZdsfPsLz8n99H1LZCA5GoI=;
        b=IvN+ZNMh4ZqCaYE7paPAakEI/2BGMD6vj7Qw9z0qdLCkoYKfM2wGC0Ujh1vLQuRkjv
         rNW1qfA6yOif/jZ0ogtouOQb5QKpVf8wIKnImF1XHannUK2Gx8rkg5K/MivIT9NLKWKR
         O1z840bq0nhUtTitloeswNgujKqKqRHi2JIsIhfNPKPLZNzM3n9255sxuPRXMBuGQsQX
         J68kY2K82e2PCVN7sX1f6wRaZbx8dKeU5QqSC0IdaMmcIE16nq9KxYBTtvcNXmo7IG8O
         uiXmQYBKNqbMdhEVHQclEGwVptblx+vIvpcN5nQe+5iPHyobHk5+/4f/b2RF5gi3M8M5
         cQSg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787534125; x=1788138925; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vGMvIaOFIbBkf0XrXpqeWleC5i415rguPHvnUqjmn7c=;
        b=ZiO6Kox8PH2Y6IixKSgaszPszfcszhkSVpEOFAevP9ZZrJgbaMfKqt2zzdr58Mr5NO
         g2iLahuFqz7u/gUeeyHqdnQoHLn/Sn1HG7JTrH+pfLl+GhbnBMON6JvmB8i/qojWuCLJ
         uk7hndyP+xCOSkO0sE93NlpL6PHFVAllDy+wEyhRblGNv/mUTkXQqgjg/0C7Jc52cLIi
         T64pyO++k2b1n9qVxmKCqSb8tSniVkH4nH7oQtCrcA+R5/ObM4TkACUfXM5P+ba/VzNJ
         /zqjPhUUXyCL+AWZ8LvUnjtI29kTEy5nFYWs6bURZ48i9WOFEOSAYJv1C2eqGYFcSc67
         MGig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787534125; x=1788138925;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vGMvIaOFIbBkf0XrXpqeWleC5i415rguPHvnUqjmn7c=;
        b=mdQEg3CFVXlrZwnNQLO6c8MmFvX2i2SHn5cK71lofAXAc6kHKX61OnYtcYnhKxzjMM
         tekA+apyJGY/zRL5HuYhLfkUVMjFgq4dh+lVGlF2QAc26Df0gQxRiWJuQiYa5g3FlKNX
         GwUsaVUvXiGfiCh5EusiC1xFfDztAzIoGWWUIS7M0ynGdxN083ia7ZLFbxW6rfHP8I1C
         qTk3uP8oKFrYI/0iKaw/eidQyL/9xlGKNPIba1pP9cjZB4N6Gj3ZneMlVNI8KHyYnJ/F
         C9T7ZcrXcIt6GMn1G2doXMuJj04Yv9W9bFr6Ew1YpEilcxo7N+DUoaaCGJj6JokUfdKw
         swPA==
X-Forwarded-Encrypted: i=1; AHgh+Rq7PQ2AFQhdeKdPANcXdz38WnzALACIA4Gvo93oawY8CysFrR+QbRQGONKES3gNJR4nvUWT@lists.linux.dev
X-Gm-Message-State: AFuF++nnnibg4IjZBqpdprsD8S7MraDXpb5ZdNo1uQ8r0ZQ5UXFlzRKT
	yc8l9N09ERVwu0NGHdM+firxo4GpkMbK5D66LKpVzI0iDI7I0S5eOsbAainGT7FV0mrQ2D29Gmz
	KOdGKkvxnb3DWnJv5V3DyHcKEHuAhJl0=
X-Gm-Gg: AR+sD10zc9R7CUIRW6VJjDIKnXYmP1QO0ohzSgUJS6tqNrFsI925Q9XMfhQC76JHL/N
	fEm5uXTAr/q6wLrmXLkqjgnSZsDRJVzr/3IrBmIK+ZXowir0T4F49vHLmVjCAq5BMmXENlqrTzD
	swUr/UWjCgds6SAB3eRnDQjRszNIL2e60c4SGxc+sUMqJgDnH9uChE9h9IQ8Y8teOY1z0XtT/5n
	6FCckppUPjv7z8K25727q9zYKJLSwZZpLHdx3rex2T1kmsWCwRSNB2C+77JWd3hP7FgYZyWS0t1
	OaefH/bVi6hFBVAyzios6vdMfWwvcjEm+8VBxr49+KGRs7m/nNSzA9UzFwL1dEdD/j3VwVSlKDQ
	UxOuAjZA6OPcYp79horfVjooNVwDYkcvgMTbfxAVWTpWSm1KyKkFWgy/HAFfK
X-Received: by 2002:a17:903:1447:b0:2ca:ecf6:9115 with SMTP id
 d9443c01a7336-2d64b009f3fmr217086915ad.2.1787534124733; Sun, 23 Aug 2026
 18:15:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260820135733.37121-1-gary@kernel.org>
In-Reply-To: <20260820135733.37121-1-gary@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 24 Aug 2026 03:15:11 +0200
X-Gm-Features: AcwNN1UtjcFt1AZ5tdG-mZdaQzytXvl_AMwSBSeb5Dd5Blo5Jox-8q4zsp724Yo
Message-ID: <CANiq72=SL4A-UQbOxngRy8-6Q-qHKyGbqOTvqo=uJNyhr5nTzw@mail.gmail.com>
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

On Thu, Aug 20, 2026 at 3:57=E2=80=AFPM Gary Guo <gary@kernel.org> wrote:
>
> From: Gary Guo <gary@garyguo.net>
>
> In Rust doc tests, there is a dummy `__module_firmware_test_init` functio=
n
> generated by the example in `module_firmware!`'s documentation, which jus=
t
> returns zero. Many other documentation generates function that produces
> zero. LKP test robot reports a `Flags::zeroed` instance; my local
> reproduction has a `Bounded::new::<0>`.
>
> LLVM's MergeFunctionsPass incorrectly merge functions with the same KCFI
> type, causing `__module_firmware_test_init` being merged into one of the
> zero-returning function. As module init is invoked via indirect function
> call, KCFI is checked and this produces a KCFI failure.
>
> I've reported this bug to upstream LLVM [1]; in the mean time, disable
> function merging if CFI is enabled. No separate treatment is needed for
> CONFIG_RUST_INLINE_HELPERS, as Clang does not enable function merging by
> default.
>
> Reported-by: kernel test robot <yi1.lai@intel.com>
> Closes: https://lore.kernel.org/oe-lkp/202608201017.100a4511-lkp@intel.co=
m
> Link: https://github.com/llvm/llvm-project/issues/217629 [1]
> Signed-off-by: Gary Guo <gary@garyguo.net>

    [ LLVM already has a pending PR:

        https://github.com/llvm/llvm-project/pull/217665

      which solves the issue. In addition, I asked upstream Rust if the
      unstable `-Zmerge-functions=3Ddisabled` flag will remain around:

        https://rust-lang.zulipchat.com/#narrow/channel/425075-rust-for-lin=
ux/topic/.60-Zmerge-functions.3Ddisabled.60/

      and it does indeed look like that will be the case. - Miguel ]

    [ Fixed typos as discussed. Reworded slightly for other typos. - Miguel=
 ]

    Link: https://github.com/llvm/llvm-project/issues/217629 [2]

    Cc: stable@vger.kernel.org
    Fixes: ca627e636551 ("rust: cfi: add support for CFI_CLANG with Rust")

Cheers,
Miguel
