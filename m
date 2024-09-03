Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A660B1D6DDB
	for <llvm@lists.linux.dev>; Tue,  3 Sep 2024 23:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725407015; cv=none; b=rK+yxM9fMbMoqwVQljER8FzOowoSNDFK3jDcrUhAPYujiWvylwbwl2aFMMY2zN3ee3/0aahRH5KiXAGdSktLTJPh2hh2dm18n0kJ4CJ5WtPY3G2yOO+3ejy6qcRhdiVvRS5OADQE7xbhH/b0rbQb0dCMQypxAYBwoKY8lBuBklE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725407015; c=relaxed/simple;
	bh=dRWeIz+ubJrojnqheq1wHauzuvHp2VInC5LvS5KJ2X0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G+0UiQa5GC/81Qi6asWADL+yu6JDHgne6q/Yi25Zvs+gbu7dLIceCvpJYESiBYRLhm7eFuYqIsCPHdara/zZQQ79a1GWl/dednizjtDg3FurkPdnBIEA+l4Sv7TOjgBim4JhH/KDF+1hiW9MAwMZnBwUkek2eTuKi78/Y7oblDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=sKg413ay; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="sKg413ay"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6bada443ffeso1503807b3.0
        for <llvm@lists.linux.dev>; Tue, 03 Sep 2024 16:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1725407012; x=1726011812; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SlCnxIZL2Il1OI5y0fydGu2G23DBSVnD0BItXQgCoF0=;
        b=sKg413aylUNyjvKEWjA2MOU+opwJkn2PK3LvvORzdwjlEaRWUT6552onshCu2M/TPg
         WKRmsv7j6JM5gz6Ia7Qv+jKNS8y3XPthFYEJb0mG23/7mQLsO4wtmXJnBXiicx8O/Tsd
         ukTOf1/17EpSr/x85cH2qPZZXailRLkJXJeAIGgHUAUwIuLRl/AKHmpq8uvrJKYlspEy
         jgDP48VBWnKwyW8sUl1iB7YnB3BC+mWF31EDsrOfPChKtRv76Ue9f/2aQbnTZIKI1tfa
         ptb+ppFbs5IWw9qG1QUxvRYH7pPgqGtGnp7dnbKxFtZz9AnbIWJQdZR2DLse2C+cI9QG
         mUvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725407012; x=1726011812;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SlCnxIZL2Il1OI5y0fydGu2G23DBSVnD0BItXQgCoF0=;
        b=I1XPaKBALkbY6TaYvlCs+JHSlhzFEfxM8bvikpw0eBYJLKAylgg9d/SPkqxg2jZ2zp
         jUwz4gVc82T/r+uuw9C2G3cy5i9FWDmMzR1Of3G9Rad8q59IYLz1CQAtfxbJt+M9Zu8b
         elXLcyf9NGmlTjBMsA0dBBnqWdAiHviZ0O2Cyr35eVgo4v92y24w27Z/PuUem3FkrRNG
         F6/FP9oayz9szHD/rrMb3yFi7xVGFWdQ7urlMyuSPPClgEZXveILa81mBUM4tXTQiA0w
         MYQ8qSjZ3oEsXQuHlHwvfXtQFmrJsS42EOpYLfg4TpUgWp7JXdZFNLAgZsW9jnwvhoS5
         l/MQ==
X-Forwarded-Encrypted: i=1; AJvYcCXg5V/2X9I01TC3JPydinHJPSDpIeaJy77ftmagAAqUx8/Svn/nO/UZY4+2z2lxretUq2oi@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7UacU96jNFN4gtTBmGQpooEG4SgWps0Qn4LqqjNdvNYX7kmCe
	T0EzScWjvYTiFY+srcH33/7nZjK8NEjeKI1GFVyyYXUBDwzTp/DoNC+CLnU823ej1p50bNfConU
	o0qm5zqp4CwBGa6fRs3VrB2o+zZ80/kLcNnWIiw==
X-Google-Smtp-Source: AGHT+IFrQMIAF4flYNUpK76WrQSCNNRsT5DiFAql0jr+5EnBkw560S9E7XVDmYuoVKDvvbmn5wWUKdeul1GdgNXPNN4=
X-Received: by 2002:a05:690c:2891:b0:64a:445c:6 with SMTP id
 00721157ae682-6db25fcd975mr1453357b3.17.1725407012635; Tue, 03 Sep 2024
 16:43:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <62F5EEA0B866E9E0+20240903130606.292935-1-zig@iorw.io>
In-Reply-To: <62F5EEA0B866E9E0+20240903130606.292935-1-zig@iorw.io>
From: Trevor Gross <tmgross@umich.edu>
Date: Tue, 3 Sep 2024 19:43:21 -0400
Message-ID: <CALNs47s8Qzbckjf_f_-Cr2rVmAf4sbo1MaSBFagdhZS4KcpQNQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] rust: arch/um: Rust modules support for UML
To: Zigit Zo <zig@iorw.io>
Cc: ojeda@kernel.org, bjorn3_gh@protonmail.com, richard@nod.at, 
	anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net, 
	tglx@linutronix.de, mingo@redhat.com, nathan@kernel.org, 
	ndesaulniers@google.com, gary@garyguo.net, rust-for-linux@vger.kernel.org, 
	linux-um@lists.infradead.org, llvm@lists.linux.dev, x86@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 3, 2024 at 9:10=E2=80=AFAM Zigit Zo <zig@iorw.io> wrote:
>
> The series make Rust modules running under x86_64 UML, as a supplement
> for the previous work:
> - https://lore.kernel.org/rust-for-linux/20221217044436.4138642-1-davidgo=
w@google.com/
>
> The previous work by David (many thanks!) has made the Rust UML compiles,
> and for the builtin modules, it works as expected. But for loadable
> modules, the UML will complain
>
>   'Unknown rela relocation: 9'
>
> when we try to 'insmod rust_print.ko'. That's because the modules are
> compiled against '-Crelocation-model=3Dpie', makes the LLVM treat the
> modules as PIE executables, but they are just static modules.
>
> Besides, the Rust's code model for x86_64 UML is still 'kernel', leading
> some relocations "overflowed", we keep it the same as 'KBUILD_CFLAGS'
> set in UML ('large' here) to address it.
>
> Now we can test our Rust modules in UML.
>
> Regards,
> -- Zigit
>
> Zigit Zo (2):
>   rust: arch/um: use 'static' relocation model for uml modules
>   rust: arch/um: use 'large' code model for uml

Hi Zigit,

Thanks for sending this. It looks like the patches may have gotten
split from the cover letter because the In-Reply-To header isn't exact
for whatever reason (the two patches reply to
<20240903130606.292935-1-zig@iorw.io>, but the original has ID
<62F5EEA0B866E9E0+20240903130606.292935-1-zig@iorw.io>).

No worries for this initial rev, but just double check this if there
is a v2 :) archive links of the individual patches for reference:

[1/2]: https://lore.kernel.org/lkml/FD7D773099A0C7EC+20240903130606.292935-=
2-zig@iorw.io/
[2/2]: https://lore.kernel.org/lkml/54FC087D02C52990+20240903130606.292935-=
3-zig@iorw.io/

- Trevor
