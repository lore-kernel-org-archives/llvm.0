Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E463F789D
	for <llvm@lists.linux.dev>; Wed, 25 Mar 2026 16:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774456496; cv=pass; b=MxVjxqCSZDlL6ktZCyfDOdIoN8E0/+NLqnF7lSXv7YpH/DrZjSH7MqFZahNACoc16sqvo8ihYpOiMNCPaCzvvHTPFUD4rGoK4MB5I7U5mycTCtu/vPbGi75v94AV6LykEPOCLWiPkZh0V1rA37R5nOH6MLIEFr45iWj6exRzUls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774456496; c=relaxed/simple;
	bh=fVUka6QRSdoSqopcl8+DYc6KjhZm4o4ga5M+4zCTdZo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rhoi1QiawsSsY4GOtJPGQQk81jxd1QdV5Jf0lZkiu7Rcp+V6ktSPDHCUv/KctgbrJdPah+LM4cCU6alImBy/9tBMFH02O1SYVc0/yDl5f01SF7y31eNxMb5x/2WET+7m526hEKJTLmHm+uqIwLN5eZLo4+8lpbV9oYQDYoUymaE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mWcqj95N; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mWcqj95N"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-661ce258878so72a12.0
        for <llvm@lists.linux.dev>; Wed, 25 Mar 2026 09:34:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774456489; cv=none;
        d=google.com; s=arc-20240605;
        b=Qe1gpQE7nil4rIXqNGmz4ViIatGh1RqUQm7CKvG7DwAju/i8+pmlOYbYo8xG8Q5pwX
         w7DoNZbyOoT1HY5GHK0YS25Ae/+QjlYs1MHFYDNu/FCl/jJ9MO6xAjAWL3QaCA/MEAQK
         def6Ooz1NbY2RYLKor1ntiRNyua93+D9PpBcD/ayg8VHFGKRPo0DYiPwTisC1GM5SDyl
         ofM9xFJbwxiydByxSDdiBHbBA6VIxqCRjS6WFfcbSDbt/Gnn92dePR74IqK1qVPKM6UV
         dBSokX9VSULhC01+hWP3h4X37v2RyQsBWuQD95//oQx1gE9zC0954IyfMYtWoM0W8ZC3
         1enw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0S+fHePIggsFy0AXEBOBbO8zgatdwlcvs6VyR87WtC4=;
        fh=e9mauor1E4DmHRCBTzn7patFFpzFHBij07aqX3eKEKU=;
        b=Qu1M4BzGrZyX/MfrP+Xj9C6X/EQ8vdVbdp2GP+t4X5BIJKAJjupwBXNj6NY8gpHITh
         wx0zxxPMtzQ7dpYlqVwujYHOHAQ8h+mRU6Ng13Zo3b6zDmKU1jXdzFsSxjf4Y34/s/gE
         7HFKuqrmuGARv3l/M85ftU4Djxk52SEIdCKyVBw6EyEK/xGQx6v7npsqttw8V3zrGwsP
         t3OdGnplnottyfNBXbFNDk2+AOMAeuOOa6khb/MqLNV8pcu+aU5hZbwBYrq7SJTDomwG
         4cHt8DfelO2uMSFlj9Mm1nDihF8yTNHww7n+tJRVN5Ar8EjzCiG8APlb9YkzYQ+FTsZK
         n+zA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774456489; x=1775061289; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0S+fHePIggsFy0AXEBOBbO8zgatdwlcvs6VyR87WtC4=;
        b=mWcqj95NOHYomspPz2ELtr3yZWjZoubnGMVgJfQxa0GuJ8u4WQrMoGfMGs/Ke9LuDJ
         m9pPeG8KII9KgLnnhb7ci2+5HBNLX8GF8N/YDaLDVTRbPBRdw5bLn489JxsVuw0BIrG/
         2pYNaC4ZaTxRVgGfKQpkpAINly5tfTya+lwvzh6zSyKdIt2orm7+Z86dOVZVdXdqy7Di
         pdJxr+d9H5yVka10MNfPD8yFiZY/jNb/zhHUax3lG99+XvL7FY4DprA10lFIWP/fm/A+
         OrTGwSyUNa/5zlJRLb2gEjgogJSSEcV+0COMB+9YikufK45Lt/z+GyzyHFfc25tylrVx
         tSBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774456489; x=1775061289;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0S+fHePIggsFy0AXEBOBbO8zgatdwlcvs6VyR87WtC4=;
        b=oTv13Rg6lNIGoDpy+PqlHGpRZF9JZcPFnntDfLcOH2H0rf7X2w5aEVmm/oMVIN7K/1
         nQgv4oktWp4VqGCb9QA4WibTpM7I0166BN6JS/NURRBcFodMvMeYyoZk+aPt8j26brM6
         QUjPKOZYBeF9Dz4Md98J3SoL8F8BrbGhbiFngNWbudQbuoUk9l8+NOP7Efg0fzthnOEg
         +HeeKsIUyBi92D9JeVc2ia3rWgW5tLhYGdItGfTFOLGB0t1fwN3wvqJjBeZCKWOy51sZ
         7clqt7RJbBDUtGzIUOyePeSYJQgDxwRJhnvxAZAOEkZPA1wMQGIv26vQ4j0RrWIqFF3i
         MhQA==
X-Forwarded-Encrypted: i=1; AJvYcCWZp/Fa4iX9XBBy8eeSgKqm5uOMBhp+5SxhYehz3cUkJ4WjoVShQY/C0kLSwtIJUmcrt0CJ@lists.linux.dev
X-Gm-Message-State: AOJu0Yw13+klUJrF6tQYvUhC6EtgIO9sdAo1oxSvQc7ip282zfs4he9M
	oomT05AtKEKTceMG0Xngk8H0Vwq2JW6eU3wCupX9CDtqlecfqT0g+JWH35wqGOsndWHQBLKVT3R
	nIF8fzK3LGsPNdzqI3Gb5Gjv2QRncg1umhaCbxXyp
X-Gm-Gg: ATEYQzz4xAlpOEjLkh1gapiKmiyRoHzihhRvHYQNfR8dT0hirsgwZYyjk2rHP0pmMm7
	DwXxynLKlgbt0cOpgvisEyG0I4VArxXYB6xOzA92Rd1mkTBBFx8D5BrUs63krGKJEJjfOclra7I
	hqpP/OmRj1ygot8sR6ojf7zp8fZBUGwvLpJC1ji8tzCy0gZy715xuhtTLvGjOkhqruQZXadyUCm
	ppQzWDJyPzE5UBfN/DVgggiQAR9jcLcUfZFqbMEm47DrGnJxuvfgaXoQ1doZ7fMgHNHKZKNYy9p
	bQEkqG60UFMwRmzkgTQTBPQM1AkV5tlwNgWFX1xq7L6Q5Q==
X-Received: by 2002:a05:6402:50a:b0:665:4aee:2091 with SMTP id
 4fb4d7f45d1cf-66a84d32635mr43994a12.1.1774456488881; Wed, 25 Mar 2026
 09:34:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260316212930.120438-1-xur@google.com> <20260316212930.120438-2-xur@google.com>
 <177443134349.415036.1506063887331719503.b4-review@b4>
In-Reply-To: <177443134349.415036.1506063887331719503.b4-review@b4>
From: Rong Xu <xur@google.com>
Date: Wed, 25 Mar 2026 16:34:35 +0000
X-Gm-Features: AQROBzCnEj7wN73t2GyTPCqzrLObCBImSyOeRDMFqmWvg7CtGODbiGadGl2Tyx0
Message-ID: <CAF1bQ=RsQfV82Gdpm1oUNtN9Yxf64C4_oP3cu6CY7Zm4qXOoZw@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] kbuild: move vmlinux.a build rule to scripts/Makefile.vmlinux_a
To: Nicolas Schier <nsc@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Alice Ryhl <aliceryhl@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
	Rafael Aquini <aquini@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Stafford Horne <shorne@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Piotr Gorski <piotrgorski@cachyos.org>, Venkat Rao Bagalkote <venkat88@linux.ibm.com>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Teresa Johnson <tejohnson@google.com>, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sounds good to me.

Could you also include a note stating that the '-T' flag is no longer
problematic since the minimum requirement for LLVM has been updated to
version 15? As of LLVM 14 and onward, the '-T' flag functions
identically to the '--thin' flag.

Thanks a lot for the help!

-Rong


On Wed, Mar 25, 2026 at 12:22=E2=80=AFPM Nicolas Schier <nsc@kernel.org> wr=
ote:
>
> On Mon, 16 Mar 2026 21:29:29 +0000, xur@google.com <xur@google.com> wrote=
:
>
> Hi Rong,
>
> > Move the build rule for vmlinux.a to a separate file in preparation
> > for supporting distributed builds with Clang ThinLTO.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > Tested-by: Rong Xu <xur@google.com>
>
> As Masahiro's original patch is now being modified: I'd like to add
> something like
>
> [rong xu: change '--thin' back to 'T' in Makefile.vmlinux_a]
>
> here before your 'Signed-off-by'.  Are you ok with that?
>
> Kind regards,
> Nicolas
>
> --
> Nicolas
>
