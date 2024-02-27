Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F5A48CE0
	for <llvm@lists.linux.dev>; Tue, 27 Feb 2024 17:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709055846; cv=none; b=i6kJpiSkF/ivZqfdpUwagzsXSfy61rbia5/WEOT4LVnpN/LVjpLvdMczfB/oQdY4Io6v1tQYq+/5YxDM4EfWaDjmtkMMmKis27MC3dCeSBTChEle6L4SVTm4BxMdh87ZztHi8oCmUqGiC0wYonO1ROqFK7zt/T1VPd3S/j9Cy9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709055846; c=relaxed/simple;
	bh=WYIhmq1+bwVx0nkQ+RsFBRoGBY/jfqSVKNlMHyZtrAs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sbqu/NveQh8CuD5ESjjHoaXekeCev2Agtrvds5MkYSHw4gAUuKUtN9SLXlCMETJOz+eVw2VXh6LSW0KO3fZs31kzYtHkcw4GXeSOyoPfNnpttY4PYiMm671KFk+uOLOzHfImTCWapznTEE6wR7tvShPlZoWOKpLV2SIJKjLqvNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hmVk5LFJ; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hmVk5LFJ"
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4705082131bso678363137.3
        for <llvm@lists.linux.dev>; Tue, 27 Feb 2024 09:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709055843; x=1709660643; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WYIhmq1+bwVx0nkQ+RsFBRoGBY/jfqSVKNlMHyZtrAs=;
        b=hmVk5LFJ6T/iRpBq7bDJtPdFCwE5ouVfobLYNxlGACSd9jQ8hrTmTXExQKsPPilwsB
         0ZfoeCSDQYsDX8B7Bb3Bp6jWy/bq54+j/+EWpVa3LRefZGv8qy2EkDa2hlSZLCO41Xi0
         viGAE2OofebP5bPKbVpVDVmpkxakz+LyciAorOfrNKVmczIRup2a2CHmK1qOz6lWHgIt
         FolyFRYBXw8VWmUIl0qwJepUdwL18+Cyc6FTJ+9+hOIXMlGFkbsLA9OR6hrEiHDT4oun
         dwdlLKWP3oUKsAzHGBk1k5Hb0GhjFKn3gVyWkf+0GUyU8tMfOGEHFxowM4oqjg381XnR
         6tZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709055843; x=1709660643;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WYIhmq1+bwVx0nkQ+RsFBRoGBY/jfqSVKNlMHyZtrAs=;
        b=jqgpBRMEf98aCxfw0EAcueSJvEhE8wFdS1PlMjk0mrmDhqRVmSvg2P+dQJkwZtAC9V
         pcwvhnqjCS6yXSA80pd8rUTxzGw1Re4u7o2y0acqS75hp1zE1WWE6FyAHAc12iMs9b57
         sp1vdXj8rqUazr/XmTQNNOpMV9IW/Q7jQX1RtJxJIc8CSaWXGanDmOnEaglu0Snd7IiS
         XSNdUV66y4eYpeeB8yHfqVG/+bQe5W7ZCER+Rpil3MP/A/zuira64ouKxS30JzeOU6ca
         tN5Nu/5UJRHooPgpLEON87ndHpenOvlsdQKNKaRHglLd1XwUZ0dImeL0BcjDeq4mWdJU
         DtfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUX5qKxfP99zFPG1vFLXPsIltZTQzx/bmOTdukq9kZHtsz0iZEGcU2r1JaMYKi2pKxr93k+QrtOLATTqjoOE3/4rvNrbw==
X-Gm-Message-State: AOJu0YwH3vAZwC+Lyh5wbOG8HNnhvlbQ6IO7J0PttytGV8TfmTVO9vsR
	08EoZtVpKgR6GnqGcz1YZp5Ms15QXlGf1R6XqFXtFxwXx/k98I+IzeUbpdTD5nBV1wdICMX+pXX
	B1aaJpqN0VBXLQyU7PKcuTj+Kml1t/0h9LPda
X-Google-Smtp-Source: AGHT+IFHtPkxFikAPR2Y0LqVI47VT/0YFQW8fbJmlCvajkU6oD8zmn03JaiSWfyOmCyPLtr0csBM23ZTEm9FjAGRLwE=
X-Received: by 2002:a05:6102:5f63:b0:470:712a:c28b with SMTP id
 ix3-20020a0561025f6300b00470712ac28bmr7663909vsb.22.1709055843394; Tue, 27
 Feb 2024 09:44:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240225-arm32-cfi-v1-0-6943306f065b@linaro.org>
 <202402261703.695B87E6@keescook> <CACRpkdYZsBQwUCEKsspkZ=M0Goo9omMH=LM=pWyOJ0U1WtySYg@mail.gmail.com>
In-Reply-To: <CACRpkdYZsBQwUCEKsspkZ=M0Goo9omMH=LM=pWyOJ0U1WtySYg@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Tue, 27 Feb 2024 17:43:26 +0000
Message-ID: <CABCJKuenWs=11OdBL-+bRWEW2YjTUA9rt=OjUcbKX1PwpEyQKQ@mail.gmail.com>
Subject: Re: [PATCH 0/7] CFI for ARM32 using LLVM
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Kees Cook <keescook@chromium.org>, Russell King <linux@armlinux.org.uk>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2024 at 1:48=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> On Tue, Feb 27, 2024 at 2:06=E2=80=AFAM Kees Cook <keescook@chromium.org>=
 wrote:
>
> > I wasn't able to build with CONFIG_FTRACE=3Dy; I got this link error:
> > ld.lld: error: undefined symbol: ftrace_stub_graph
> > (FWIW, I'm building against v6.8-rc2, maybe I need a different base?)
>
> I get that too, from the buildbots, but I'm clueless about what it is.
> All of it is in generic code, nothing ARM32-specific, maybe some bug
> in v6.8-rc1 that was fixed (I wish...) Sami?

You need to just define a separate stub for graph tracing with KCFI to
avoid type mismatches. Something like this:

https://lore.kernel.org/all/20230710183544.999540-11-samitolvanen@google.co=
m/

Sami
