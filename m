Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32BFA3009D9
	for <llvm@lists.linux.dev>; Tue, 14 Oct 2025 15:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760456583; cv=none; b=J7l8PdwZsWm3kSRjIXyWypIs2XxgtcHMVURyNc9yxIvGtSwuaQMFfKpuzHdq6SZ9+lSfXDj6WcQskM96QPD0pqMEmvDpWGcbKTUcUJJKkg2/CXLmNYZh5A+SUuSvofuVIXRBVa34TGaZOVwX7qEVvCQqSrjwX2ejZcgQveurki8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760456583; c=relaxed/simple;
	bh=IOXA3e/PDxwKtBuHJSVeF2wtx7tvydH9ilKWTo1uicY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=upeEd6djoZ0y1tyDuno0YhSxZUpqj0vr4sKCAzeq5nGww2kgPAMWQXoWUQEwbS2ob3HYU4IlRPZdUh0YYZ8eZ/XPb3ujS9Ic8dBacaafMrH+1XRAXaPTK2Ji43iVVXtO4NctvRAfbhWxIX52MM490V+uzyxj1nxS2nFc5Rckh3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PzbZ+EBO; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PzbZ+EBO"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-26816246a0aso11215225ad.2
        for <llvm@lists.linux.dev>; Tue, 14 Oct 2025 08:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760456580; x=1761061380; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yYGjzSlUY1ujV4XJxs44Nj4rVMv7fyzJ9xw4OWViBdY=;
        b=PzbZ+EBOK1rvlHy2TbgB+sadU1lOtMS2IkBZJA+CjMeBPwB/J3hyqdI4PmXyyd0/Rx
         oAC4BCxVd863bUdgtX3QjF61bOYsJiLYDC5x4L5puppdt7q16C3tyu/Jq8F/pBvGBl/i
         BLyz2SDM8uAbwnu7WgGdlN5AOHrQFdZyE3SlxTN8nRuvLIA3go1guJJCc1DrXaBiVtus
         6c0p0XXQbtEHzTIpOu+Ozo0NfkDTrClm5qmVK9AmuFgNY1b5OWpmWB/5yRgf9rb0kqBk
         wO8uAlzJzu1D35SZ2/9Vsuz6jaJelPZRDoz2tAaD78Xdpd7N4FW2NKD/M6Hb8k7k2U5w
         PwVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760456580; x=1761061380;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yYGjzSlUY1ujV4XJxs44Nj4rVMv7fyzJ9xw4OWViBdY=;
        b=HhdiSv5HtE26VX0bHl5AtHmMSQWwW3jUjk8swZf24ZPncs6pdhwhpjO/JyRGC1IG+j
         Ykw+b4PBmy+dYm0+4BQry1+gz7q83ZJ6jHBDvBXohHhui5uROW/aYdYHebToXLIzpalE
         rdMR1OpBrrGPqEddCoZXi0EetwxT7OJaw86jBTwaYjgnX/V8R+Y6iJYWAc3+uQg7o5nJ
         hJCSfh/0gnOPjkvtth5qVmtJS1NkHf7hGzLRqdifuGB4thqHW4ahwFvlfMGV0NbjkAKf
         adeHXzCs62tUd4VEkBvGGOrneg3QRzSOsPVOvAFRZyZsbE9DmkrstItKnJLz+Wi03RsZ
         G9WA==
X-Forwarded-Encrypted: i=1; AJvYcCXCm0CVcAsPc37niw4JdiNyj/TPNGC4Puj0FAVgoOSf0XrbHcjXQ60SJMhKXloK9C2Fd4AR@lists.linux.dev
X-Gm-Message-State: AOJu0YzQznJOin/Be5GX44Ygk9WZr7Y60bz61PeA65RphLuhJMOPIDMT
	XUESqA5fGd2IMVguHqWGzb8Kv/GDE/tLeGjuqh1yf30cm2QMMuUPQsizE+RIYpHm9QNAYQtwCSM
	xBEjSmdUsXPs4z4Chye1AmnkTka/SSLs=
X-Gm-Gg: ASbGnctD/YMQ1EGPz27CS4KwqiLqkB6IB0aKlabDOavyWezq9SKMVC8asEWZ1a2qKlN
	RwhhA7gE//40otRfMjxRDhxNj26bbKDD4X0h1KwJqUleA7c/DsWJWIqeeQ+cktQxH9j9yl0JeZ8
	ZJM55bsnBQUPQzatCaVofhxao4xXcinUT9SdsdUhgGZYIUpadgVCs+U5IlwqGdHJHIigPdzTGwG
	uPbN0HO7cVE9ed/8o3zIZ5ZtJNWu6hfTJ7O20YRXnwwfdxpA05ca0Qonj4BuHYpd3xS1usuOCw1
	d/n50hGQmgwG2PeAHzp0VB+qYeYV/y66ACoVeRKYuNEAcIoZG1XkzyA=
X-Google-Smtp-Source: AGHT+IHdmYpg3wJ6be58RKxCOo6in3Fuo+5g91PKk58rXhf3xgTcwnJDb2Ds8EFLQGYTf/b7850DkE7uVldiW6rM2ew=
X-Received: by 2002:a17:903:18b:b0:27d:6f24:ceb9 with SMTP id
 d9443c01a7336-290273e17b2mr176408215ad.3.1760456580016; Tue, 14 Oct 2025
 08:43:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251014094511.627258-1-gtucker@gtucker.io> <20251014094511.627258-2-gtucker@gtucker.io>
 <CANiq72nVxPY8xB9xEnkZ=zNFh0EfQvaMAPH4ygRr-yEwpK=OWg@mail.gmail.com> <fe53ad80-6eeb-495a-a870-9c42b71f9887@gtucker.io>
In-Reply-To: <fe53ad80-6eeb-495a-a870-9c42b71f9887@gtucker.io>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 14 Oct 2025 17:42:45 +0200
X-Gm-Features: AS18NWCSQqZ2k7klTl6uHaYshU7c7i07coesJc6h6yK0Ke4SUtcLPlKDjwbeVfg
Message-ID: <CANiq72m1EKmNM4QQ_A08vC2w-4QbHhO5UEG4F68tRGKEgZ9p6g@mail.gmail.com>
Subject: Re: [RFC PATCH 1/1] kbuild: add Makefile.container with CONTAINER option
To: Guillaume Tucker <gtucker@gtucker.io>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	automated-testing@lists.yoctoproject.org, Arnd Bergmann <arnd@arndb.de>, 
	workflows@vger.kernel.org, llvm@lists.linux.dev, 
	David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 14, 2025 at 4:31=E2=80=AFPM Guillaume Tucker <gtucker@gtucker.i=
o> wrote:
>
> This is what the CONTAINER_COMMAND variable is for.  You can easily
> set it in the environment e.g. `export CONTAINER_COMMAND=3Dpodman` or
> anything and be done with it.  The default is set to `docker`.

Yeah, that is what I mean, i.e. you have to more variables to make it
do what you want.

At that point, a user could also equally set up an alias or a quick
one liner script to call the real command with whatever setup they
need. That would be more flexible too with essentially the same
complexity on their side.

> As
> far as I know, there's no need for anything else than the container
> command and image name.  So it's not more hard-coded than say, the
> default $(CC) executable.

There is the `src` path there, no? e.g. I use upstream distro images
to test some builds.

> Then I was only suggesting using a minimalist alias e.g.:
>
>      alias kmake=3D'make -f scripts/Makefile.container'

Yeah, what I was trying to say is that, at that point, you can just
have an alias (or a one liner script etc.) for the real command.

The user still needs to know how to use Docker/Podman/... anyway, i.e.
I would see the benefit if somehow this was the only command they
would need or if this handled some extra logic.

> hand with a volume and then run make inside.  It reduces the scope
> for differences and makes builds more reproducible, for example you
> can just share your command line and others will be using the exact
> same toolchain and build environment as you.  This is also to enable
> developers to easily reproduce builds from CI bots.  It's been one of
> the driving principles behind tuxmake except I'm looking at it from a
> neutral point of view here.  In other words, it's a step towards
> increasing quality control upstream.

Definitely, I am not saying containers are a bad idea (I use them
myself), i.e. I am only talking about what is the best way to provide
this (e.g. documentation, a script, this new file, directly in the
main `Makefile`...).

> A related topic which was covered at Plumbers is to have first-party
> container images, with Containerfiles maintained upstream to
> facilitate using the kernel.org toolchains.  It's not a requirement
> for this patch but both ideas enhance each other.

kernel.org images would be nice, indeed.

> Yes, I did think of writing a documentation page alongside this patch
> but eventually made the RFC with a cover letter instead to keep it
> more as an open discussion.  Any solution to run containerized builds
> would need to be documented, even if they're trivial to use.  I think
> the Makefile approach is the most elegant one but if others aren't
> convinced by it then starting with just some documentation might help
> getting to the bottom of this and decide what to do next.

Yeah, docs would be nice regardless of the way of wrapping it.

> Right but then I think we would have to deal with the variables
> handled by `make` which can be passed either via the environment or
> on the command line, so that's similar to the issues with an alias.

The script may be more involved, i.e. similar to the KUnit one, but
then you also gain the ability to provide more functionality/logic.

Say, for instance, the ability to test with a set of container images
that you define in the config file, to run certain things with the
built kernel (possibly in another container), and so on and so forth.

> We could do something like with Android builds (build/envsetup.sh)
> with a file to source:
>
>      . scripts/containerize
>      m CONTAINER=3Dkorg-clang:21 defconfig
>
> where `m` is just an arbitrary alias name obviously :)

Personally, for a new script, I would use a normal `--flags` like
interface, and leave the Make-like one if one wants to pass the actual
Make ones. I would also allow the user to define a default image too
in their config file too, and things like that.

In other words, the idea is that you can actually easily use it
without typing a lot, e.g.

    scripts/container b defconfig

(Possibly aliasing `scripts/container` itself to something shorter locally)

Or even more high-level operations like the "build with my set of
toolchain images", "build patch by patch this range of commits inside
the container", etc.

But I know this may be way out of scope :) After all, it gets into the
realm of essentially a lot of the custom tooling/scripts that
different subsystems build for themselves over time.

In fact, another possibility to think about is generalizing the
existing KUnit one to support containers.

> Thank you for your feedback.  I can spend some time investigating
> alternative approaches if they seem worthwhile.  I'd be interested to
> know what others think of this too.

You're welcome! I hope that helped at least.

Cc'ing David/Rae/Shuah as well for the KUnit bits.

Cheers,
Miguel
