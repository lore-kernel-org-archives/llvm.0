Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE0F1369B4
	for <llvm@lists.linux.dev>; Wed, 22 Jan 2025 17:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737565354; cv=none; b=pQf3lyr8TaTLZTtkoCS8miR4DC8NEgvFhFJUFDo/TBJ8ONmsP0uPxRJU5m1/I4kkJWPfXJVYKCBOhszDwgTN+G42sw2ihF4T7VSlU4bwqgqLD2bTI+RAXeYVPU4j1fqQ9CGq6aQEfl4y+RAOXhzh9+D+oy6Cmpp+kBPPCu17wgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737565354; c=relaxed/simple;
	bh=qII0OcQL3uVEtdhXOov0WSjojSDt1i39EyG+M6OTm4w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J57uZOG5/qe+XdT/k/DvA2CnVNGnAqJmN+KlKP8/deTZR86R31K7DVZxjOYym1tBBE0s0Zh5GovvcnA+dJdN7XnYfS0tI8MJMy8wx9mCfH/PxHWt1VBMIPfeW+k4Puxb5bZs03HTOlQDhbgoVgAgELx9M3CfzhsU/kCTa21sQeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L9lrjF1r; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L9lrjF1r"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-388cae9eb9fso4076087f8f.3
        for <llvm@lists.linux.dev>; Wed, 22 Jan 2025 09:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737565351; x=1738170151; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vOBYe7hKKWrQVbbMlG221tX99JGFkXrB+lL0aGAMCbo=;
        b=L9lrjF1rDqfq2NbhsIat+RGUacsqbhf9sKGw29LPaZKLR8a+UD80zjEBEV0W93NNDj
         hn7Xfic4BaTp1eWzq1YFu51evaMpMAL0e6ZpNdm4xOgnI3Zlh5W7XivV5z36jsHDZpl7
         K1aqCxeVG+FKK7oGtZtKwBfORMcJEzU278xk2OxV/6Iq4GrIHpyBspibiKEqIAdMe3lo
         Q2Dtr5G1qhfQepQEX7KUyeOoDlfWAEN3E4QuF+lnF/ApmCvmjaxfHvgRDty0xmTiGuA8
         y0LhPLqHVffVWRTgNKWYmH3KHMkXA6eNM7+doGP9TC9tafcsgHKYaTMi3L1CrfR3hEgn
         WYSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737565351; x=1738170151;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vOBYe7hKKWrQVbbMlG221tX99JGFkXrB+lL0aGAMCbo=;
        b=EVQoWEmEhJDvSVhvZWmcR34e5jwGOnPp3goYM3C8NEMjkviKDFg22izy2faBoONfBY
         9xaTyjQJYkoUAbESEg9EYqE8bjy0mv4i+zryQpdvPQggC1PXsSc0YkYruBliCTV3uRQz
         Drb8F7y7EfU27pySGsqcOSJ03zcF5yTJMtXeOwlnArrtMMww5xdj6fbgE+I7XYKc9l0T
         R2RP71yy7V7e81k36fjKOgVzmwRW5TGElP5XzB+EuFqJlIKNi/hbsWOKysO7b4fvhydh
         JBuT+VavzDgZsBJCfuxwUmwo+UFxLahYifOptqdQaoV9nnSHVrPJAkMV2Q93dsTOSTBw
         VhYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXii7jJWr2Mp/LM9Iphoh2SSwswoG8nrf0sSeWyqb9kRLLzTJgEQNlZ6/PFz2mTjpG6OAYF@lists.linux.dev
X-Gm-Message-State: AOJu0YyUQGHCHk2Fz9nUtD6/iLdeyZTHf9IrCvsDmaipqSgEBjaUHi+c
	qEzjrqazoidWlZmlm2DLx6h+faXMC/HAnZLlxnE9wP5lqXp0C+aoGQyAX6boiQMZ4ORvXPamQ+I
	/I1CEKOg/pcKiUJvf5tg2iG7a1Fc=
X-Gm-Gg: ASbGnct0GrufRiBCzkuXRN/bd9xpB+8FD3UjYD7mUbsaskewlaXszhEqo4bn7iBK6X4
	FOnl3C2oD4gk7NOU1us1ceW0bZ3JE4io2h4AT0Ocz/PqcqxkEusnwS0U7jsciRQ1zyr/II7Rl5K
	eRhE+gm/o=
X-Google-Smtp-Source: AGHT+IEso7FyrlnWyoMakPOiYmt/PWGxB55N/abpHk+7pmcuierztBMBZu5jYE24VGcqprVRxSX7Xofsnoaoi/GZz7M=
X-Received: by 2002:a5d:4d8f:0:b0:38a:6807:f86 with SMTP id
 ffacd0b85a97d-38bf5662417mr15301581f8f.17.1737565350296; Wed, 22 Jan 2025
 09:02:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CGME20250122131159eucas1p17693e311a9b7674288eb3c34014b6f2c@eucas1p1.samsung.com>
 <20250122-modules-error-injection-v1-0-910590a04fd5@samsung.com> <20250122-modules-error-injection-v1-2-910590a04fd5@samsung.com>
In-Reply-To: <20250122-modules-error-injection-v1-2-910590a04fd5@samsung.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 22 Jan 2025 09:02:19 -0800
X-Gm-Features: AWEUYZmVm4oP6wOtkq7sVcFiVog35GahkeJfBhYYmlM8eZhXpLkseZyiVq1qGeg
Message-ID: <CAADnVQJ8tYSx-ujszq54m2XyecoJUgQZ6HQheTrohhfQS6Y9sQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] moderr: add module error injection tool
To: Daniel Gomez <da.gomez@samsung.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-modules@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, bpf <bpf@vger.kernel.org>, 
	clang-built-linux <llvm@lists.linux.dev>, iovisor-dev <iovisor-dev@lists.iovisor.org>, 
	gost.dev@samsung.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 22, 2025 at 5:12=E2=80=AFAM Daniel Gomez <da.gomez@samsung.com>=
 wrote:
>
> Add support for a module error injection tool. The tool
> can inject errors in the annotated module kernel functions
> such as complete_formation(), do_init_module() and
> module_enable_rodata_after_init(). Module name and module function are
> required parameters to have control over the error injection.
>
> Example: Inject error -22 to module_enable_rodata_ro_after_init for
> brd module:
>
> sudo moderr --modname=3Dbrd --modfunc=3Dmodule_enable_rodata_ro_after_ini=
t \
> --error=3D-22 --trace
> Monitoring module error injection... Hit Ctrl-C to end.
> MODULE     ERROR FUNCTION
> brd        -22   module_enable_rodata_after_init()
>
> Kernel messages:
> [   89.463690] brd: module loaded
> [   89.463855] brd: module_enable_rodata_ro_after_init() returned -22,
> ro_after_init data might still be writable
>
> Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
> ---
>  tools/bpf/Makefile            |  13 ++-
>  tools/bpf/moderr/.gitignore   |   2 +
>  tools/bpf/moderr/Makefile     |  95 +++++++++++++++++
>  tools/bpf/moderr/moderr.bpf.c | 127 +++++++++++++++++++++++
>  tools/bpf/moderr/moderr.c     | 236 ++++++++++++++++++++++++++++++++++++=
++++++
>  tools/bpf/moderr/moderr.h     |  40 +++++++
>  6 files changed, 510 insertions(+), 3 deletions(-)

The tool looks useful, but we don't add tools to the kernel repo.
It has to stay out of tree.

The value of error injection is not clear to me.
Other places in the kernel use it to test paths in the kernel
that are difficult to do otherwise.
These 3 functions don't seem to be in this category.
