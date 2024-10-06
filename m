Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B4415A85E
	for <llvm@lists.linux.dev>; Sun,  6 Oct 2024 08:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728202004; cv=none; b=potjgmwOvrtvyLk4qvSLInljovcaHkhQ0W3F/0uPL+q2OxD77M/u1ppBCdYIsC3WGqWeTbTUL3Iim1gWxqEGMQC4RoISJmA4Q8BA3SOOFbDoufUB1dutuyMwXbz/N40pVP17cWHfP62E/hmV+tS8wSkQf/uDx/IRx81U0RIeW2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728202004; c=relaxed/simple;
	bh=puHS7d7azwqNXLt828Ye1D2ZDeZMXjrh1xk6a66e+BY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=roNF5bDbsvuUWU10g48JuYfh+U9ITXISe9Wx/I3XdXJxserno76LiARLxwkHk1xHXSEXL9o3i9BB6/+dHmSdEHDjkrMdrSRxKUznvCMZgOQDWky9kd9/rsOWi7YCAnBz8WolHpcpa3nN4EMixDGsT59rPYHsNDP/jptAcAfoL+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f7JLscSM; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f7JLscSM"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2fac60ab585so35853781fa.0
        for <llvm@lists.linux.dev>; Sun, 06 Oct 2024 01:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728202001; x=1728806801; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=puHS7d7azwqNXLt828Ye1D2ZDeZMXjrh1xk6a66e+BY=;
        b=f7JLscSMM/PtB4idL7XuZr3OO6kNhQe+iRb51UMzQh5ifB2wcoZ5vB+ryj/xkIqlAc
         T31ps3X8fMUMpa2Bi4D82phuZ14EYjvH4ueEJLEg75kvLXyJqtH/9hiAH5QJhlWkwxAC
         t6ezunOMIBT1e1jmmP605aN4LTsjrnnkPlnw/iFfo4udQAHdByEAJ3PpLWPAIBP0YsIb
         ngezxpJ+zFY5j2rSDnUHCjjKPqQTZ9tgPN4snvPfROwH71o0VAZu5nfvYKtnNEcb4YCZ
         UnmQ1PYz5EQ2I3Ws4r6K8lBF4XI7IaCkeVoGZwIbn7ioDfLpHLoHWe7jcLbP3LAjgb+u
         0oZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728202001; x=1728806801;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=puHS7d7azwqNXLt828Ye1D2ZDeZMXjrh1xk6a66e+BY=;
        b=Hi8TuPIJWIfA+5/MLgjYkcTNGEeoGBBQ0tk5NZJ+U74ad4v76l20xVqJqxqO6wHu9B
         yNc6+tLYFlRIv2u7WH5C/5tLrAkO+HgNPQt5+BCNqiV9xVLmIDu46hLd35ZdVy0G6z5A
         gvh0nLmaqjUxouv4LbWOMmagkkxKYYJOaefR+KoM+PmQurf2FKPlmRKiKzqUA1YPLjxV
         k1O9ji//pFx7qd8x+vNnstPMowJhx1Jlow6qtOzjFb9PPNkgVHI9dha5NzVEJGCCXMkA
         6Y4uy6Nh/Hma/wSa9KRvC0w1HpsgTOfZz5rqjqj7ly31CoWthqT9PK4DTdzUS7n+uRiA
         yDwg==
X-Forwarded-Encrypted: i=1; AJvYcCWQ9hIljpL5Xb8OSg2T1DOhGNMCN7l6kxUGMzIZk+pA7riAxAo3UVm/LB5vKHXdBr12o0nH@lists.linux.dev
X-Gm-Message-State: AOJu0YxK7X7YQGe7A5Zlxy6klVNyA2/G23K4kpU9ufahiK9e2ePq2oQx
	SrvuZZaTy80eN/SIhxY9clZbSaqOFdVmg7eUh4pHth/6SmxmLXHNY2ZzdtuCjL5mN7SqnU3eiAd
	5czBM0MMf98eKuUXmiCqtll4rmt4=
X-Google-Smtp-Source: AGHT+IGS61n/I1TuC+MWyJZpRj63R+p8y0BprOkKwk0SOVREtUnFaMblR5HhGoJzVJpp1ktZzeiYw7JUqStdLpYUPwI=
X-Received: by 2002:a2e:bc0e:0:b0:2fa:cc50:41b with SMTP id
 38308e7fff4ca-2faf3c508ffmr41878031fa.5.1728202000783; Sun, 06 Oct 2024
 01:06:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com>
 <20240925150059.3955569-55-ardb+git@google.com> <99446363-152f-43a8-8b74-26f0d883a364@zytor.com>
 <CAMj1kXG7ZELM8D7Ft3H+dD5BHqENjY9eQ9kzsq2FzTgP5+2W3A@mail.gmail.com>
 <CAHk-=wj0HG2M1JgoN-zdCwFSW=N7j5iMB0RR90aftTS3oqwKTg@mail.gmail.com>
 <CAMj1kXEU5RU0i11zqD0433_LMMyNQH2gCoSkU7GeXmaRXGF1Yw@mail.gmail.com>
 <5c7490bb-aa74-427b-849e-c28c343b7409@zytor.com> <CAFULd4Yj9LfTnWFu=c1M7Eh44+XFk0ibwL57r5H7wZjvKZ8yaA@mail.gmail.com>
 <3bbb85ae-8ba5-4777-999f-d20705c386e7@zytor.com> <CAHk-=wgkgnyW2V4gQQTDAOKXGZH0fqN=hApz1LFAE3OC3fhhrQ@mail.gmail.com>
In-Reply-To: <CAHk-=wgkgnyW2V4gQQTDAOKXGZH0fqN=hApz1LFAE3OC3fhhrQ@mail.gmail.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Sun, 6 Oct 2024 10:06:33 +0200
Message-ID: <CAFULd4ZZxrJvJ9gF5tC-m-tmcDMvVM3te4xc7vnbF_OFU0D2=A@mail.gmail.com>
Subject: Re: [RFC PATCH 25/28] x86: Use PIE codegen for the core kernel
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb@kernel.org>, Ard Biesheuvel <ardb+git@google.com>, 
	linux-kernel@vger.kernel.org, x86@kernel.org, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Dennis Zhou <dennis@kernel.org>, 
	Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Masahiro Yamada <masahiroy@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Keith Packard <keithp@keithp.com>, 
	Justin Stitt <justinstitt@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, linux-doc@vger.kernel.org, 
	linux-pm@vger.kernel.org, kvm@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-efi@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-sparse@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 6, 2024 at 2:00=E2=80=AFAM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Sat, 5 Oct 2024 at 16:37, H. Peter Anvin <hpa@zytor.com> wrote:
> >
> > Sadly, that is not correct; neither gcc nor clang uses lea:
>
> Looking around, this may be intentional. At least according to Agner,
> several cores do better at "mov immediate" compared to "lea".
>
> Eg a RIP-relative LEA on Zen 2 gets a throughput of two per cycle, but
> a "MOV r,i" gets four. That got fixed in Zen 3 and later, but
> apparently Intel had similar issues (Ivy Bridge: 1 LEA per cycle, vs 3
> "mov i,r". Haswell is 1:4).

Yes, this is the case. I just missed your reply when replying to
Peter's mail with a not so precise answer.

Uros.
