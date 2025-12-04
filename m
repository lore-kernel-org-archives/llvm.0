Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729DE284894
	for <llvm@lists.linux.dev>; Thu,  4 Dec 2025 18:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764873413; cv=none; b=Mrj6LWEG5vFZ0QiUwHENtYqsRQAADhhqb5uN63P2L/EI5gen772wonEqtJN8JkfDdcenANenfeIMz38z0T5PmoMfB0C9LGFqQvDTdXVhZm/HnA04PlRxsdtTi7gedCiyGiUYC/J8BtM1OGwvVRnkpboZ3csdoDdw3wiYZUD0Rw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764873413; c=relaxed/simple;
	bh=SGRJGW+S1sIUufJvj6Tjt1v8B/ZWkglN6tSz7kiK0os=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AUMHy7tPtfpqEyURpjVZEzDpbGF/BZXNiM+13u/FOTL+V3uxGdft8d446O3UsQSPZiL+zz+KJDF4K+gikmkYLju+51WI9PkZVjbd+2b0MNCaSL9iu7GGPvnEQyuqm40fg4WkPBcKOOmL6fXA2LajOpASH/uAPyk1MvFrYl5NuyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WauGExiZ; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WauGExiZ"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4ee147baf7bso26141cf.1
        for <llvm@lists.linux.dev>; Thu, 04 Dec 2025 10:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764873410; x=1765478210; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CsYrPVr2QqKJbaV0xcIxlUV6NeC72UK28di6JMzzOjk=;
        b=WauGExiZKuuEaeygvlsHr5307QW1WXr+q6XsyL6QIGUN2yLzV9gSiT1cZ8HTsiZ5+a
         noB2PzVEYZCuthKiM/C0SL8Lfin6FAIFJSvUT94sPsr4nO605lwwc77KArxGmtVh0fV1
         1UPsRksmrE4CDU7B6XnyOE7vr6g733fnfnXOZp6kKizgQ5GkZgO0iEo89y+4ZTg8AzPg
         Tq0HSUK4S2iG9sJLS2ERr6XWS1+bN1kfHXkNhRFGGasnurT2AkLCJo0LF3pqLrFqF3td
         Lw3imMK2+kTkFaN9TXOYkX/Hj1+P1QgcRGH+RIF0PeA1Gz795QSY/8fiLjaDnNkjdRjK
         hmNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764873410; x=1765478210;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CsYrPVr2QqKJbaV0xcIxlUV6NeC72UK28di6JMzzOjk=;
        b=NX+6F5pavNTwwKsfKfNU9hJKKU3EptQJ8bdvRbVhM+zyEy2mg77Az7Thot79RwRDbH
         qab5ZmA5wrGkgBVUQX3LwnqkPwWpaLNRxYehBYtl6EhQ3nzgpQfzbXeDrLHFF3/aQwal
         Mlry2NZW8Q0f7oytJIn8tOkUaFmCMqHN3na7JiHWKbk1Wkt3K8rqVFNM4Jac+s7/zss+
         QX2zeOhqXE6dbCgeyJR8tJol2ZbUjRldGe+X2ZFgQ8sslHmI9b+qflRNt4ExLmNwkxbQ
         jvs6WILi9n1EuPLHLkhq3y7g5qmuvbz46sIMJ8LJw01hXxq5KCmeexSJ1Y5TjdAeNjRb
         h95g==
X-Forwarded-Encrypted: i=1; AJvYcCXkKw5WlY0PYtXE9zQIXwM3JN2I6MKYokbLVv7zWWfN9D2RxJATNwQBRlSuIO8ZzBjK1exh@lists.linux.dev
X-Gm-Message-State: AOJu0YznOxJqBqPtFJWTPGtGbdjbPMTfMGVQL5CuB1dzTZkowTsIWxj3
	wY0z0sfVRKtWEZlOaAaRgbAilEOdAclqADVZY/oWYT5h4n71iO3wl5ZY0baxESdBtKqW9i5XPOj
	nYXH9EwhEzfjXQUmfGp+QecyBSzdItK1L6AMu/6OQ
X-Gm-Gg: ASbGnctH5NfO3Wq5V3Gt2VE8xwkJZ2iwn8JrWHKTz5kXWlSTtft8KuabWVNpCCx0gzK
	bcYFvAf5h274bMw96btli9vKkcCuDVFlImrVY2HiB2PxCleHNqAD7RHs8Pe6Tpaoe/fmxOYwzNu
	6w9DdQr2dohlg81SH/a8HmlRPkJaAgQQZdC9+0v7nAd9VG+kfX1aUYI6Kv0dcRPTTfqa+NS15RR
	uEFTVmRSmyzpBlJx0KXZz615eRbyka3cx/pP8fdq1IgSc3Q5Q8k/U2wjd4SxIcPF/47ArI1iyrW
	jj1YK0Q0Kwbxonxy/oM1m1f+8Q==
X-Google-Smtp-Source: AGHT+IECOuaDK8PQQ8MGYEYUxu5nMjEsM6twQcV37PAe9/sgPjtwnGZPg87NgA21qhu9H5nF+K0Li9xrNAhTU4NUPeU=
X-Received: by 2002:ac8:7f06:0:b0:4f0:22fb:6c1e with SMTP id
 d75a77b69052e-4f030e5dd48mr473381cf.8.1764873408304; Thu, 04 Dec 2025
 10:36:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251028182822.3210436-1-xur@google.com> <20251204174954.GA1177092@ax162>
In-Reply-To: <20251204174954.GA1177092@ax162>
From: Rong Xu <xur@google.com>
Date: Thu, 4 Dec 2025 10:36:36 -0800
X-Gm-Features: AWmQ_bkT-ttFDkboXEEMPR8PO6dNYqj_msvOG67DSBRrGI1kR6lEjxgc6u53IVo
Message-ID: <CAF1bQ=RvJnN2DULkRPk7LBK07HsRaON5fMbny1ZmpjuO8cvvOQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] kbuild: distributed build support for Clang ThinLTO
To: Nathan Chancellor <nathan@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Alice Ryhl <aliceryhl@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
	Rafael Aquini <aquini@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Stafford Horne <shorne@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Piotr Gorski <piotrgorski@cachyos.org>, Teresa Johnson <tejohnson@google.com>, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Nathan for testing and reviewing the patch!

On Thu, Dec 4, 2025 at 9:50=E2=80=AFAM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> Hi Rong,
>
> On Tue, Oct 28, 2025 at 06:28:20PM +0000, xur@google.com wrote:
>
> First of all, my apologies for taking so long to get to testing and
> reviewing this patchset.
>
> > Rong Xu (2):
> >   kbuild: move vmlinux.a build rule to scripts/Makefile.vmlinux_a
> >   kbuild: distributed build support for Clang ThinLTO
> >
> >  .gitignore                 |  2 +
> >  Makefile                   | 25 +++++-------
> >  arch/Kconfig               | 19 +++++++++
> >  scripts/Makefile.lib       |  7 ++++
> >  scripts/Makefile.thinlto   | 40 ++++++++++++++++++
> >  scripts/Makefile.vmlinux_a | 83 ++++++++++++++++++++++++++++++++++++++
> >  scripts/mod/modpost.c      | 15 +++++--
> >  7 files changed, 174 insertions(+), 17 deletions(-)
> >  create mode 100644 scripts/Makefile.thinlto
> >  create mode 100644 scripts/Makefile.vmlinux_a
>
> Overall, this seems reasonable from a high level perspective. I have
> been testing it with my arm64 and x86_64 distribution configurations for
> the past couple of days and I have not noticed any issues.
>
> Did you take a look at the robot report from patch 2?
>
>   https://lore.kernel.org/202511052257.Bb85ptQG-lkp@intel.com/
>
> It seems like it could be caused by different optimizations?

I haven't tried to reproduce the issue in this report. However, based
on the warning messages, it looks fine to me: Distributed build mode
will have different optimizations from current in-process ThinLTO
build. This is mainly due to the fact that distributed build mode has
more precise option control. For a more detailed explanation, please
refer to my LLVM Discourse post:
https://discourse.llvm.org/t/rfc-distributed-thinlto-build-for-kernel/85934

Additionally, I will be presenting a talk on distributed ThinLTO
builds at the LPC next week and would be happy to discuss this topic
further with interested individuals in person.

Thanks,

-Rong

>
> I plan to take a more in-depth look at the implementation after I am
> back home from Plumbers in a couple of weeks (just to make sure I
> understand it from a maintainer's perspective). Based on that, I will
> either apply it to kbuild-next for 6.20/7.0 or ask for further
> interations, while still aiming to get it into that release.
>
> Cheers,
> Natha
