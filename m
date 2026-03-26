Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917B83932C6
	for <llvm@lists.linux.dev>; Thu, 26 Mar 2026 17:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774545237; cv=pass; b=RcUqnvn203q6zzq4vSHNj22GyauXnePNBqXVBiO0H2deOCCGuBteMnU3CQvrtfyK06rE3hE+uFo5nSi1MTBit7M8GR0PYHzbfxe0K266gtSnhnzNti4ZhY+vJvS/Or5IGCfnL2+bh3mV1QE31eWbyb2alfCXIVFrFy+pegE9G6Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774545237; c=relaxed/simple;
	bh=6by8ax6LVBtJzT2zeIYIiNytwNlMq82fUxqHhZGAH/g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NzCg194DlJbFSSlxAYRe7DGJ9aWoTNgBiswtNRy81NtX1v7IFFCPCwFNt4WhGfQT8uFYcKcNKsugZsWqkSWvkRhmv0ImlW/TdN0N7iEemZCfc5+h6wcacFpJeXS3RafI/27gTNbyHGvWW8Wv4/+ouIpzg/Wl+YSoxV7dMS4D59o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R6uETXDX; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R6uETXDX"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2c153272250so152311eec.2
        for <llvm@lists.linux.dev>; Thu, 26 Mar 2026 10:13:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774545236; cv=none;
        d=google.com; s=arc-20240605;
        b=kgwt1RFWxYKTQzRbJRLXkEElsSuOQEdyK/46V7UICBOImdkOOZWebS/clvj5UwvxbI
         /z37LQkoCqOxjX4jBvasKk5v6KFhV00PoUNSTQJ7Ft7/n+wu/Thzf3nkyt/xM+ttim6r
         3d/Ohvdj3Dp2SYXfGMQp8vrMDIZvfoT7UwlqRQE++UvAMwg93I5z0KpXVUI9/1hUH4Sz
         cDsAlJTxot/EDsWBQRLV/vH/88iGSMxOuwOJhZL4mjwkNFcG+FCwC5uOSye6nSxkqTlz
         fG/ITJpAGMWyJZvIuyLCXz7WH5izu4jc2Jgxfw3ZI0iB4Sg4816CLmKu3ysJjy/0Yt/y
         LW5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=q9olrJwKlMERMQc61vOT8vZB7QpsPZJixmRhhkJf9iI=;
        fh=BGkPyH5+aiS7wn39EG74FHgI7xTavA6L3hFmsNeKR50=;
        b=MqU7s4K7cY0sqbTkSFVv0lgZ4kp1WeepgSyXtpg/LpP1M4rdrJrTVvUXeOlzxCNoYE
         2RkqQhWkHMJgbLvRv8og8Br3fePK205gF1tqkBPzhbXpOjKfBk7jv8yG2QgCi40cxlC8
         7070nhAT+VylSfmn/ag+M258AYO2esR9+bVky07TvvBI7VZ5rleypBd7g6Dm0LVJmB+N
         Ce00juGXyDAjdXpgl03IKMOWHBS2pUd5xA/oyATryhOGQBQNfL4Glqw91JDn8kB6syb/
         JilKvI6mXWjD8Mz+D10J/zG273HeO6d7cySlHSKpsUwFG9DmoLdWYsAMl6KOtTR7fz0L
         954g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774545236; x=1775150036; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q9olrJwKlMERMQc61vOT8vZB7QpsPZJixmRhhkJf9iI=;
        b=R6uETXDXco1WoxdwLYovMN0ar5akuBQVuaSv+nE+fTtsxm1DeL6l65HUO31PmFLYoG
         j2jfLpoExR9Yu4NIWxG9BOo6l8ECYfzVfa6FWFLk7UhIOqhkhgKavaw2mKLsz9GRz6h/
         ByobXwpp9l+thO0sSs1HkD1HMxH3UpW1cS6CGiD/zYoWE6tUhhbzbO2vilnA8RS67HGY
         EfywfpVN6SqzzIC3JiRxxZPVc8rqpT30DB31gpEKGMCADykeEDl5np0wYZLwjqFpq1jk
         Wo287O7HW8kYTE62CfG6Xj23DaTD0Zf+QeJjlu5ZMYpTroEHVVuvKdme1BNZm9XvO3A9
         afNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774545236; x=1775150036;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q9olrJwKlMERMQc61vOT8vZB7QpsPZJixmRhhkJf9iI=;
        b=JjNagRKgBpr7EWOaNQB/2nWSIQWevW8Hgj3mr01AIq8vo9A/qU/05BFAfB5ELReaIC
         BvzDq1+2xUJImlyvfggOiMC+m50n5jUtZSJyiKUWa0mq7GmW/+aBJ1DQucieM4CsvJDS
         IJ8mPIyAxijfFeFVuGD6Jt/JdarAxO22hjtEcTWve44lQ20Z6iGB3E+CxdO3G0Ggtwaj
         D6rOm/x1UBZF/RMHJTI1WMTBBHjkiFkpoA6aagy7WQ67+3FCGPMMwp+RYvQiymm044C2
         7lz8NoQaUF1LILP9lWKBLomlJ8YLl5g+LJeYmIPNSxHCUUdtRCd/41DQv/wmhntVVc9r
         plkw==
X-Forwarded-Encrypted: i=1; AJvYcCXlHb4A+xI8o8EuiO+Bxk5DV2h9Yup5cZODmvv25BzivCiH/RRKrVdEg+GJYTm3XckRuxmn@lists.linux.dev
X-Gm-Message-State: AOJu0YwYptCRMQ8NvwvbzoyCdKtzZL3dqqn1OdqeJ/fiqtijVTVGaL3U
	ccWT6li+omty5t0V9AsgcaoPKTzn14q5fEh+Kf1/ydHiKT3vLX2w3LFddQP1KJxUqw9S/96fBSK
	Srl7ybBY0wmYBMANF45vi6q+SMoRBt8A=
X-Gm-Gg: ATEYQzyx6eNPXGsbJevSAKEFYTax/2OQlUtiod5/UtFlPceXvkhmQdjfu5ZuIyuhgvM
	gyWuFBlrz3Sdvpi9Vizp903FzwC4xL0x1XNF+3BkI3QHzcvvFAU+FKuBpk9l5X/WRgxVk7YAE/E
	vhETfLfFXPaf/IfOSU0efsncbRgAXvwm17z+kd6A4I4+/uKq+4OfYNsu1Ck6otcjIKgx5zLvjLP
	M+2nhwf4FSuL8ovj6EFyo1zH+4FUBQONLMfLMHqqtsOqGlB68d3jeY5z6e6spCArpnHZQZzcq3z
	InHlP1Pels0Xy1cOiu+D5KeuR8DUv4xApFrFLOKOYDiuU9IpY8SA8X+S6mytDyHV1u50FT5Bro7
	uu0hH7samZl6l1aXYqROKQD8=
X-Received: by 2002:a05:7301:5f8a:b0:2be:140c:bc2b with SMTP id
 5a478bee46e88-2c15d282067mr2407895eec.2.1774545235402; Thu, 26 Mar 2026
 10:13:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260203-inline-helpers-v2-0-beb8547a03c9@google.com>
 <20260322192159.88138-1-ojeda@kernel.org> <20260326024226.GB2302780@ax162>
In-Reply-To: <20260326024226.GB2302780@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 26 Mar 2026 18:13:41 +0100
X-Gm-Features: AQROBzCjsVmkmyxhYBQlcnjNfjk1drusXCGXl2NpoBVYAfyx4urVLgdrjE0kdQk
Message-ID: <CANiq72kyFu4StTPbobkPBSMYxNa5T0uErkLj-6mRvwOquEsgSA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
To: Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, soc@lists.linux.dev, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, 
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, David Gow <david@davidgow.net>, 
	Russell King <linux@armlinux.org.uk>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	aliceryhl@google.com, linux-um@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, a.hindborg@kernel.org, acourbot@nvidia.com, 
	akpm@linux-foundation.org, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, 
	dakr@kernel.org, gary@garyguo.net, linux-mm@kvack.org, lossin@kernel.org, 
	mark.rutland@arm.com, mmaurer@google.com, nicolas.schier@linux.dev, 
	peterz@infradead.org, rust-for-linux@vger.kernel.org, tmgross@umich.edu, 
	urezki@gmail.com, will@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2026 at 3:42=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> I do agree with some of the concerns that adding an architecure
> dimension to this is a little complicated. I would rather try to flush
> out those build problems with patches and keep it enabled for all
> architectures. At the same time though, I understand that enabling it
> for the "tier 1" architectures is a low barrier of entry for getting the
> feature upstream, validated, and distributed to the majority of people
> that would actually use and depend on it, so I ultimately leave that
> call up to you.

Thanks! I agree that it would be ideal to get it clean everywhere, but
given it is experimental and that arch maintainers should likely known
about this, I think it is best to start simple first.

In fact, let me Cc the x86 and arm64 maintainers so that they are aware.

My current thinking is that I will add:

  depends on ARM64 || X86_64

and try to land it this cycle.

My understanding is that this will be used at least by Google, mostly
for Android (and mostly arm64, but possibly x86_64 too), so I think at
least arm64 will see some actual users on an ongoing basis, i.e. apart
from the "synthetic" testing I was doing.

> No real concern on that front but .gitignore has a command to run when
> modifying it, which will require a !timeconst.bc in a
> kernel/time/.gitignore file.

Yeah, that is the exception I mentioned. Initially I thought about
putting it in a local `.gitignore`, because local is best. But another
option, with a different kind of locality, is keeping the exception
close to the rule, i.e. in the global one, which has the advantage of
showing us all the exceptions easily (and being able to write a
comment for all of them at once).

I am not sure what is best clearer, but I am happy to do either:

    diff --git a/.gitignore b/.gitignore
    index 3a7241c941f5..3044b9590f05 100644
    --- a/.gitignore
    +++ b/.gitignore
    @@ -13,6 +13,7 @@
     .*
     *.a
     *.asn1.[ch]
    +*.bc
     *.bin
     *.bz2
     *.c.[012]*.*
    @@ -184,3 +185,6 @@ sphinx_*/

     # Rust analyzer configuration
     /rust-project.json
    +
    +# bc language scripts (not LLVM bitcode)
    +!kernel/time/timeconst.bc

Thanks again!

Cheers,
Miguel
