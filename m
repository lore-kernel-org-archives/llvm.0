Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECE2131E49
	for <llvm@lists.linux.dev>; Wed,  6 May 2026 06:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778047366; cv=pass; b=iq3aHDIxhFO47RskQplPHKpI3f7aRCtr1PT7RjJUwr/xeaW4ow61jKZTchXWmRhEPJnDc8IwmaX5N1pLPWMmWhEDdff/ZwkUu8mR6tUhh3h4+0IryaCuJ2CjJEeR55eN921qfmLzfHSdcIgqpaOI2Uymk+A0GAVK8iAbpOLmdcs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778047366; c=relaxed/simple;
	bh=nU+TN2FHTCSDyAkmtzfZLr5hQWM2UQnLSq6aqX7bCpY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kyMvJmQMZSVdICd227nxOLOW56pYW9GHXmd21zAN1S8c5Ue52jVu7rh39j8GfF7gA9Ma3xIpDMJCUK4NxaMHbmBwNvyZ2q2sMvS1QuGlQsGPGUylaAe5htoDaoOj3rb4uA/sq/hmSUqRjDaQAjnmpOx4BXRW8LcZVfuTaM4QafY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NwL0nsJA; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NwL0nsJA"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-67b8d9c26bbso8596306a12.2
        for <llvm@lists.linux.dev>; Tue, 05 May 2026 23:02:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778047364; cv=none;
        d=google.com; s=arc-20240605;
        b=U7tJBQTAnktKU8LYpV66goHYVMkK28pHlyzMr53N5Zg4tNjXEWiJ3CJ+17xQ646fhV
         VOA+UUh1gO9DJJEUhAW2W/cdmJ/r42Lj1pElAnzzOaReLy3d8nYJs3jNTp7ovjbeubST
         y8xXykElNjhrwFDtBzUcb1ZZIMJ1+Esda82C9/YCvFeUxkRbTrcsaKCKUECnM2Zlaoqe
         zaNdSBY+et/1HmSOi2OyQAfEQbazfw19Cu55AoWJvK84xzMXC+OjeT4KJ17VX8MuvHuC
         lRFiF3DIlSDUSnVUM6euaf2X8ztj0UMr99CvQ8BK2XkLApi0kgY5GIWaNLhK1dMFSGMG
         um7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+QUus7LGRjCM/XarecC6aAwQ9yAm7SOn4wv0XIoWo5U=;
        fh=Acqy4MWmB06ax8yhww1jW+ehZhH5Ml24oDXyHX7Zcv4=;
        b=bmCDtbyIIInGQmjdrwIML0BsqhwtXJWvF2PhxYQNG3/jyfpvbr+RAmXxufEkWB8RB4
         mPMBkiPiGbAc+UqxD3va2otxrUUNqSP50ppWFNBxy8eu8w7laUwtKzJV1L8l6bFlb9Nm
         Fn3P2hXN/wHm2XFPM+s32nQwokvfxYOpg1jNUahy3ibnL7bwk+4yaXoDHRGX/qpReIkZ
         BWfcELC68WWGpr1JIYP3W9xUpeOsTInJI9DuKgxM9kEReGIuL7y+WC7Ut4zcmn9mh1+W
         r+jCzkS7Lsno8oYSftc+d/LGoFsUIN9BlDItBTnRbpuhtmAzWkGRDFcVzYvO1uK1Sb8p
         jW/A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778047364; x=1778652164; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+QUus7LGRjCM/XarecC6aAwQ9yAm7SOn4wv0XIoWo5U=;
        b=NwL0nsJAYLwdNQzWzWkPQ17ImdXO8VemyDYQ6VLIEB7ady3vnNd4D5w4RHuCJThhW5
         VvRstMWCIGhzdyWhXwxWaGAvO43gUxFLK/oPtH5NQU4iiayPLgvv8IhC3VbYV2cRTj+4
         0LBhV2ZilRMdozEFTlZ4aqGl9IaAFohK5pAf1xVcXLhC8DHCCXAnRpO+gkttd5Po4SvG
         hEoJRp8/ewZw3qycZfeWcuC+FTNHC/ewtaJytY5nxOraFRVAuqxMMdPYaIv2CIpY+Ap2
         UBxJGS7JEBDwhovRp5XacbvVxLHb+MqG8d5JI25IQ0CTgHnltjmORNn6/HE0gZh9SKpA
         cG7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778047364; x=1778652164;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+QUus7LGRjCM/XarecC6aAwQ9yAm7SOn4wv0XIoWo5U=;
        b=qRL06cyENH3GsmbYy3VeErsLszEYNXoarj7gk192rG1CEzkBGdkFRzSsk99KuTLufa
         uyFVnlxp0LFNimJmobLKGsk1kVkw82LSoUldLAnIXNxvEvtUCITWR8/XIL8gpA6ZLUAP
         YTUwYqIsO9V11REtMBDOfZefqcjuA31o0yV/9ZL6i5SkBU1iJl6E1ZzBirMl4QEWCob3
         v3lpkQLJ4UKaihDx4KFFeU1gCAfCHJXCNm5Fl8vN8WVtDzGmbl0/D3fRuXvE17AsTunA
         iws4oP9nyX/8ev898nQC3ZdV2OTplDMW6fHp6EXhjJJs23kAsXhSIQbF2Ycx8XIbugzr
         IGLA==
X-Forwarded-Encrypted: i=1; AFNElJ9CsutJMR9LK5S2iJ8AG8t2Yc5GvgUdiojz3Nq7pKlcTbH1UJZzOce05Lt4jQZRnBPuqWNR@lists.linux.dev
X-Gm-Message-State: AOJu0YyVXkT3cB/MIGkHBn13qLpYMU1XPGNPVDzeryIyf39x7OjknZ6V
	myGVv01X5J5IuYwFic8WrI9U1t3X7m5zbVcEkSv4CxqDo7fZCEhRVnfMnMqU8wbxhNuraBbLq47
	pHOB3inDDa0B3J1hBrU9xl92L8mF9SrI=
X-Gm-Gg: AeBDiesKGK1kboCH1DvC10ABxH4zagdH+x6+0LPHjgVgzh8HbIJIH+cphhZDMhaevg3
	un5oZhCsF84XQiAeDWCXQbgZigYM60+BgNIYCKHcHvicCYIdx2CTp2DqvwY1/3+taQ2CIa3yXXl
	p+Lvrfwb+1HOw4qvGxmABuNtKWvu1DwqVx+VFlCZCq2au8FKxL0K+wFGwQHXqTCW8c0naA3ylPZ
	2hnbTc1RI/ppYsqgiKiWfPRPwoyxI6/BuVJgcbXk9AbY7xzGG9mze0IhnP3zEcgud5KdNwMs2qE
	zyfiaffyIeCYWn+KU9zSCo1+oY+G6oek5j4sg88o+elJ+0ZnFEpB84JoHPsYkkuNkXu1E/RoAvp
	+1Ws7k/2b6Crv5C5Hel9FXr4QuOffAWN3WcmbVLjsQ0aqceY0Rz3Uzmk1WQ0NNBCuNOtXBL5JJ7
	pyPJ4=
X-Received: by 2002:a05:6402:4348:b0:676:9caa:f070 with SMTP id
 4fb4d7f45d1cf-67d642b23f0mr727752a12.14.1778047363334; Tue, 05 May 2026
 23:02:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260505010112.645361-1-rosenp@gmail.com> <0f11390f-e8bd-4f8d-aea8-59ef545b2c32@app.fastmail.com>
 <CAKxU2N92s06-L0+e=KZ7EbtU50tCpaCk2MYJD2xTFEHEsAhXUg@mail.gmail.com>
 <df3e889d-ac8c-4d11-a5fe-8ed2769953f0@app.fastmail.com> <CAKxU2N_moR8bs=NLUcW054a=oHB--4i+M5XKCBNF9LskYcjAhA@mail.gmail.com>
 <add152a5-09bb-4c6b-a17f-da3d817b93e9@app.fastmail.com> <20260506054828.GA8550@ax162>
In-Reply-To: <20260506054828.GA8550@ax162>
From: Rosen Penev <rosenp@gmail.com>
Date: Tue, 5 May 2026 23:02:31 -0700
X-Gm-Features: AVHnY4J6qXkx9ZFAQP2rElkyhPxrLn6pKVicVojYfRDj2KCztMjhgywlOvMZeis
Message-ID: <CAKxU2N9YwM3JuXs90yL68kcDX-0BWvxvPFqzTuONLR8P-7qg0g@mail.gmail.com>
Subject: Re: [PATCH] mm: move phys_mem_access_prot_allowed to header
To: Nathan Chancellor <nathan@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-mm@kvack.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, 
	"David Hildenbrand (Red Hat)" <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, open list <linux-kernel@vger.kernel.org>, 
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 5, 2026 at 10:48=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> On Tue, May 05, 2026 at 11:22:13AM +0200, Arnd Bergmann wrote:
> > On Tue, May 5, 2026, at 10:54, Rosen Penev wrote:
> > > On Tue, May 5, 2026 at 1:29=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> =
wrote:
> > >>
> > >> Does this happen with both ld.bfd and ld.lld? Which version of clang
> > >> and lld are you using?
> > > clang version 22.1.3
> > > Target: x86_64-pc-linux-gnu
> > > Thread model: posix
> > > InstalledDir: /usr/bin
> > >
> > > lld the same.
> >
> > Ok. I've tried to reproduce this with Nathan's llvm-22.1.3 build
> > from https://mirrors.edge.kernel.org/pub/tools/llvm/, but don't
> > see this problem on mips defconfig. Are you using a particular
> > configuration, or do you see this on every build?
>
> This is just the same old integrated assembler vs. recordmcount bug:
>
>   https://github.com/ClangBuiltLinux/linux/issues/981
>   https://github.com/ClangBuiltLinux/linux/issues/1830
>
> It requires CONFIG_LD_DEAD_CODE_DATA_ELIMINATION=3Dy with ftrace, which
> MIPS allmodconfig enables. PowerPC worked around this in commit
> f8b2336f15f3 ("powerpc: Avoid dead code/data elimination when using
> recordmcount"). Maybe something along the same lines should be done for
> MIPS.
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -82,7 +82,7 @@ config MIPS
        select HAVE_IRQ_TIME_ACCOUNTING
        select HAVE_KPROBES
        select HAVE_KRETPROBES
-       select HAVE_LD_DEAD_CODE_DATA_ELIMINATION
+       select HAVE_LD_DEAD_CODE_DATA_ELIMINATION if HAVE_OBJTOOL_MCOUNT
        select HAVE_MOD_ARCH_SPECIFIC
        select HAVE_NMI
        select HAVE_PAGE_SIZE_4KB if !CPU_LOONGSON2EF && !CPU_LOONGSON64

fixes it. I see master has a different line for powerpc. I defer to
the experts on this.
>
> Cheers,
> Nathan
