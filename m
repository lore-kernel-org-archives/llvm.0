Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295463358A6
	for <llvm@lists.linux.dev>; Sun,  5 Apr 2026 19:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775417763; cv=pass; b=G79NC6hQcLDIXfXgiLMOKqOAh2+tP74phRTSxWQpjM+UtfNJqJxl3sCGnaHe7LzSRNsWlPrFZTch47y52pglfKC5iBC9baxyqw4uXZgpO+Xv2pNfU/iPARuu6jeIBMdoT0Hn6Dml/NYffwJCJmyIKntIfc1DEr9H95bleJEYOa0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775417763; c=relaxed/simple;
	bh=BfjKSt6DEr7n25ZH5xS/6Npl1F2WZyz5JjVGM21RHvg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tOd054Yg7SoEJVlG+8MA9DCWeUBrVBb6Hqh6qQGZdJ8W6HlepivYSCk5HWgH3MDJfMVKuNQPwV4zwxUuxl46PNlrgyU9QhgMBpHvK77mLnB4QOqwuV+FZTAN0BuU5XvnulYU7Agvk0Jv3y1qI0yGgHf3oUTJ3tUfqPhspzLO2p4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZUV2KIzI; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZUV2KIzI"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2cad171900dso193620eec.0
        for <llvm@lists.linux.dev>; Sun, 05 Apr 2026 12:35:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775417758; cv=none;
        d=google.com; s=arc-20240605;
        b=IhePDnz26lBZyKjLtY7gLboIPQXx+PktwDxpBh5JOIteEpW17m/7F3/u2p6ebuA78L
         Qw0Vg3v5YsiAP55o3IxSNbT99fN+FX5c0yRjbd0P6PFUfe3Wl6gn8KQaZ3PhwYTFtbMn
         vQzGsqbD+NtQ3wfHGie/3mUav7j1SZ5Zc5CIH6aOuUVMUHXmIuJN/H2SOLoTpGbgyprl
         g43sonPSzqPASPMnHJbrhkM+1mxM1R4cOkxO7+YZhbYRIrCtk/YN7boDUxLxI+Alq6Yz
         vBrTacPlV0cYyaFQOEHLdxyqlDLapfQ/QnuVOcV5Ur3H5mSLMfbf+xqEHUzlYyb+NXcw
         1VCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BfjKSt6DEr7n25ZH5xS/6Npl1F2WZyz5JjVGM21RHvg=;
        fh=DfhFpiY7sXEgwavQ+YYMmUdg00bxxUQi72zfnqPwdjg=;
        b=TZ/9/7tUf2msg5/Skgc50kZcINbEs9nAhEddv/hd+taPrjVl4USG7M22JSE1wGOHBn
         SIk/1ogVMiWCRgZTATGkd1RrOzEE3UfLznEjGZ2U6YHwGuyerYrc2i20pD/hQOCFGevs
         qIfUIkptL0lQEYjeUqGepfGYSqKxCAi2Q4rj3dy4yZg7N6XSdKX5sNvdyidBExsKvRe7
         JMMKXFSA7x6US6QqgS3fxpJ8F/Tq390nL+IIdMlK5nrMSJ9SLWwFAMCOiF4saWwdRiEO
         WPSssp7Vno2QNtAoiwmNHy5D1uEfOAg/4QnemRGvJCY8wQUFV6uItYEwqAvqizRWq92r
         IQRw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775417758; x=1776022558; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BfjKSt6DEr7n25ZH5xS/6Npl1F2WZyz5JjVGM21RHvg=;
        b=ZUV2KIzIxPLF9KzjK16JaSzWiAOAuO6o0wWx/YcwoU/Rt8su8NmE36AKZudfC0GsxG
         h3IQ9YtGYrk87MDypj3mr268Bd1MhpZ9s1okcUS/6CNGm7sKId9yWiwR90tVIminzzpH
         lwxFdwibOflL9zN4JNF2y0J7RjBNLLyQHnDIIB5VpHHYTDCP10KsG3b+yNP6jQTV4u9D
         cVcN8D/vjTGwn1z6Yn92tD6rejYEGDjhAeM/f0odsxHKXsnm1hvUbj7ZnRKCK3prvfBu
         ZUMXLOSMxSiLut1Ge6fKJZ27Js5yo7HD8MXMTdoOHn+Ny9+p4XzZ5Y97AqaYfOYGEfmc
         JmDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775417758; x=1776022558;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BfjKSt6DEr7n25ZH5xS/6Npl1F2WZyz5JjVGM21RHvg=;
        b=hDIo14aVP6zMKKooSelPgZlipDIgLeZsfbBnOZAl/0DzQt80uCzYhhnDK/Wb014zCR
         mL+bWRHz4nnGoNKBNoMEL7IYB+ehmNDeb/JPg4q+Q51o3q+LmDff4ssevDcxjWNgWElD
         ctwwE+VIW1PhOxreDumyBUKcfn1IuG1UR3Oo3kiQf5b7ytVPwHBMXwbqsjvUUvxY96MG
         DzdiHwk5LSnAJsh6K/dsfCy0CIyDCUx6GUcBi2al5Tz670pXXmErX1ky9y1OYE2T8g9i
         +kmVWloSLh8UNdwj8H0hncXWc4QuRShg+EmF+24FHi9aDtzL3I3iEeW9MOMQ6FjZTyJd
         V0eQ==
X-Forwarded-Encrypted: i=1; AJvYcCXc5SULUoYg0cnNLiEMBAicMZGI0WdrG6FQzLfdw1uHCS0uaTfwSYW7OBAv5WTYkqtpmyfu@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0jMSjqJliVXzUncVteHrmXLuhLLUBA9JnUvHlMAgJtoAeniDq
	2509rMVbeX2sj1+iupEPOzBtkks6NE58VB87rR9uLV7PIWVTfplDxGXsSD8zk/zOnh7CpYWSdhR
	PLZ9Aph5hzkeK8rlHTrsMot681HCK93g=
X-Gm-Gg: AeBDietvGNsHyMGZe8SUWAv1IDtLnMydjIHr0IvwL8UkqwagLpmGRl9Bp4IQeMiKttq
	L4v1oQoHOTw7pPeqCbqOxYSSbfTQduyy0kCp1enErmuFGXlIgA140TYhu4jmDI3XTU37zwPe9W4
	SZiFZPCxvmmoAI5eyEeFiaKT0A+XKtPeYxn02xLU+cIaiOCfidnz88koh0nmpOd2k7kazNzsayM
	oKG0ibl/TA24+bvDAhaEBU2YpEOEm9Psj9W6ZQvApXo6YJpMNvT9PtSuXoFrHvHG1vPCmJqRMbn
	F+AbJEUOJLCMEL6U3v74op7/ilhDMhorscPwfjuXrZXXeS5Hjh0grufKdQlpYgVAqlJMrbhkn9P
	s8eeoHFQjgo2iIFYuYgItf+A=
X-Received: by 2002:a05:7300:dc88:b0:2c6:7f49:a862 with SMTP id
 5a478bee46e88-2cbf9afb2abmr2166610eec.2.1775417758303; Sun, 05 Apr 2026
 12:35:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-24-ojeda@kernel.org>
 <177508434465.73816.4492182082440539007.b4-review@b4>
In-Reply-To: <177508434465.73816.4492182082440539007.b4-review@b4>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 5 Apr 2026 21:35:45 +0200
X-Gm-Features: AQROBzAMmQ2fYtLyUeAFSvUDsVE_iEOg6GKNUQ48f6LlPWNoSXcMUKGWx0A_W0I
Message-ID: <CANiq72nqenC30r7QQAmdKxS8ehGU2SoSGr+LCnoTAGLegH-KnA@mail.gmail.com>
Subject: Re: [PATCH 23/33] docs: rust: quick-start: update Ubuntu versioned packages
To: Tamir Duberstein <tamird@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 2, 2026 at 1:01=E2=80=AFAM Tamir Duberstein <tamird@kernel.org>=
 wrote:
>
> RUST_LIB_SRC is also mentioned in the nix section, do you know if it is
> still needed there?

Yeah, that would be nice to know.

I tried on my own, and it does seem still required (at least with
those packages mentioned in the example). But perhaps a Nix user knows
of a better way to do it, anyway.

So I kept it.

By the way, I think it would be nice to have a "standard",
well-maintained `shell.nix` (or a flake or whatever is best nowadays)
in the kernel tree somewhere, i.e. one that is known to work, that
covers most tooling used in the kernel, etc.

Cheers,
Miguel
