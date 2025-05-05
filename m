Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C355825C825
	for <llvm@lists.linux.dev>; Mon,  5 May 2025 16:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746461010; cv=none; b=NauTRru2jkurdU91xMMYic4d6Nckxr1NO5sQPlu4NoWu3PAn/5uImwvd6uq6d3NZzlUFfkIQvGMaMYcI+l/n5ksDypjHJI85KK3BiMEMcegSv34CkHo2MmlyY9GYNb2PlWJmMcBRPhHeYyDFlM+sqtvBoNpFeCdNUi+sKOUgir4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746461010; c=relaxed/simple;
	bh=UftVvy8RC4icpI3AhefASAQZ/iEzxTAxJn3EY71RiK4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rEW6CYHQZzuGHWVhn55kBEJgtwhYmeaqLw2kX4BAC+jWVNvDRzE8Ofq1MTZdezJoHa/2Drz7hp9ambwK3WapuydYGvg0nP3STM4H+UhKNSPByjzJPlTHeO0MPHYlIeqNIb/WD0Qvn8AHP2WNRXRLeqcMwrOeZI7MlSSS7bOiE94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=hK95QTfj; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="hK95QTfj"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-acb415dd8faso693430166b.2
        for <llvm@lists.linux.dev>; Mon, 05 May 2025 09:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1746461007; x=1747065807; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=h01CWeWtSOhKaIqy3G/6IN778pW2sxnxWWRyeifkMkg=;
        b=hK95QTfjzyxSSC3pSlcV4tucsO9AqR9KuDyU311N/JORb8eWW5rOy4sbae//YoyJn4
         pft7VlAVUBdZksKQMtlfhaztepm7D8ivJHPbcSA8Ww1Bnn4MrJMI1BGaeWXmoTdV+W2Y
         ZqutgtVqlCwYHdy2MhFwyMpLu91RqyQXMsM1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746461007; x=1747065807;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h01CWeWtSOhKaIqy3G/6IN778pW2sxnxWWRyeifkMkg=;
        b=r9BXjqlgVYWkJXvwoxHQwTImzroCkuPfEZ6JmCO8PCYBj9FoMUIRhyGCzc1EgnCmUc
         lcumqEDZqhWBKXdD61bsju3RTcUK0z7A5yAu1e152+6BkFXpBN4dpQY+5IZjOTH5lozS
         lU2UUD0kIu13xBjAv6TJR1VxWCz+eU5NqRsTXhxTTO/6Ho/2j1M5HCu2KssTDHso1ae2
         Z6npWGYLXS+UGFiHNOOl/EZFJ9lWTOcvU15KAqzQWYh5EqwUqO5GIBISg1Cpr8a2Dfvv
         oHYK2nKmsVBsFC//TLh4U3BWbpdySa4RYY2Sjc6jzme+nXgvpYifji2buX7K+tDh5F1Q
         BGbg==
X-Forwarded-Encrypted: i=1; AJvYcCU75d/7GJFhAkf1SxlWQ3BJVihvDl7cMwFCfDkoppwx5YgZfrfpkIN6/1XJC4cqLkDvjeDz@lists.linux.dev
X-Gm-Message-State: AOJu0Yxw8hU1PXYp5O1zHC3qtWR5qhtP2JbYwpnJ7M/aq09jjxROHKVu
	8aCxpzIXrFRDcUE97ppzAPGZ4UuJIr+rk3CYJSJEo6c3iweT4XOpZLAmWr1UVdA1nPI/700nZss
	zIkg=
X-Gm-Gg: ASbGncunqPqEdLEb3RcKCMqUGnJuWrHNPxiiWssZMsddm8btxxssCw5hlA9z13zpwmG
	GM6pyvPyil45xsjSKsaZ9XC/eXv8TjBILCtp7/pPYTd4Qxe40y9+9sJkHM1UwdMN1GYuCeD5Rof
	YoBHGaM8Xv81oDygqE6cfgdOrh+Y45NAuI2awqsLtA5rYvJ2k1Xt9VbSlSL/37ZSopFlSZ9ly2C
	glGl4aIgPDi3ba1mT23tvF9Eqnyql8TbPqD58ljNS4Xmz++IFVuztsXFrXVn5BmfRd2QnrAHw1U
	8icyf6gtxfprxXrQcYKVSyLkInW5GaWj/9IZxJeNunn80cmbGkJ06+nZX0ftmZ9Sq+O0Z/sA2/Q
	KAbt+X2oQecczsME=
X-Google-Smtp-Source: AGHT+IEbIPTMeE+wZKZZBCBFTBNh4eg7T8dZAmOZibGnT+Ns7OBw8SV2e1rNv7bjO4efUz2NDuOsWg==
X-Received: by 2002:a17:906:6d8b:b0:acb:126f:5315 with SMTP id a640c23a62f3a-ad1a4acf970mr549488066b.37.1746461006715;
        Mon, 05 May 2025 09:03:26 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891a6868sm514007266b.70.2025.05.05.09.03.26
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 09:03:26 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5f624291db6so6920544a12.3
        for <llvm@lists.linux.dev>; Mon, 05 May 2025 09:03:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWyG0kRrCuTpFJ+YP5dsigMgVWE0rDcMmelyt0mKl7/IburDeZbgCYCMIUr4zz8SE5OWueJ@lists.linux.dev
X-Received: by 2002:a05:6402:90a:b0:5f4:d60f:93f0 with SMTP id
 4fb4d7f45d1cf-5fab05e0b12mr6165955a12.31.1746461005714; Mon, 05 May 2025
 09:03:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250425003342.GA795313@ax162> <CAHk-=whfT3A8K2Z+WbieGG5Hhc9QAT5s3qsbB19O0Roj2G5tfA@mail.gmail.com>
 <20250425021138.GA3800209@ax162> <CAHk-=wjDV3nOK34rbU8bdo6OjM=KYoCN92=1eVEVFu=FQr8TNA@mail.gmail.com>
 <alpine.DEB.2.21.2505051543470.31828@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2505051543470.31828@angie.orcam.me.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 5 May 2025 09:03:07 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiQN=jqK9n-mUEAD1Q36t-6d589M_rAG568pLq2KysJ5w@mail.gmail.com>
X-Gm-Features: ATxdqUF6pY-99F2WQNkeFTpXwDSx0anOhOWjLVNn7A_NmLH1XNT6o446qEa5uEM
Message-ID: <CAHk-=wiQN=jqK9n-mUEAD1Q36t-6d589M_rAG568pLq2KysJ5w@mail.gmail.com>
Subject: Re: Adding __popcountsi2 and __popcountdi2
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 5 May 2025 at 08:05, Maciej W. Rozycki <macro@orcam.me.uk> wrote:
>
> On Thu, 24 Apr 2025, Linus Torvalds wrote:
>
> > > I will test declaring __popcount{s,d}i2() as aliases of
> > > __sw_hweight{32,64}() to see what effect that has but I figured that
> > > calling the __arch_hweight variants was more correct because some
> > > architectures (at least RISC-V and x86 when I looked) use alternatives
> > > in that path to use hardware instructions and avoid the software path
> > > altogether. While there would still be the overhead from the function
> > > call, I figured not using the software fallback would at least soften
> > > that blow.
> >
> > Once you have the overhead of a function call - and all the register
> > games etc that involves, you're almost certainly better off with the
> > simple unconditional bitwise games.
>
>  Unless optimising for size, which we do support.

I think you missed the part where I said

 "But if you want to do this, put the damn thing as an alias on the code
  that actually *does* the SW fallback in lib/hweight.c."

IOW, what I object to is being *stupid* and doing *two* function
calls. It sure as hell doesn't optimize for size.

If you want to optimize for size, just call the existing SW fallback
in lib/hweight.c.

Don't call a *new* function that then calls the existing SW fallback
as another fallback level.

Because that just makes me go "Eww".

Honestly, from a performance standpoint absolutely none of this
matters. Unless you *inline* the bit scanning as a single instruction
- which this is *NOT* about - you have already lost.

So at that point, it's a question of just how pointless you want the code to be.

             Linus
