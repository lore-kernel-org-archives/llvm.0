Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231D31E888;
	Wed, 29 May 2024 09:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716973206; cv=none; b=ElyxAWuVoTrDhZLrD2jHf7QjTB5F7BkglKD6CirPUVp7Nm5kHIlhsm3c0BZPXsH4OshdEiFoE1lggo14No6MrGJA/xZAPFHGI4VbxI0nVF9v+sfQJb5o5fznSJNvmNgh2Pxz7N4XSzRMKpBc+umwc0iSl8jMJMk2Be5wY5X4ybs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716973206; c=relaxed/simple;
	bh=goI5+0LOIEzmQDBY/jkkzI1NwAspb+ka3YsSexvrHco=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NAJrImBFQcuIFb7bgpDBvxdmmlTB/nmFgBE3ZLH0VZxVTKpO02+sUUOZkXnX9zFLaypYq3rKeLwcpqj17MSr0nHBcru698HuufyDSp0ugKN4o52kOhCeFr+5Waov4oP1nyOeIxfs8JxIXSBK3XlyZ7fLL9r/0QgwRhvG7ms2FXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-62a0809c805so19090537b3.0;
        Wed, 29 May 2024 02:00:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716973203; x=1717578003;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gBmUqLKUGcwYg+ZwOV/e+d2M1Uqg36SBNZ8BT49hv9g=;
        b=w4BCKwYw5HrmjS51z4GoxHwFn5VKcjPZrNNskfuxrh8WHBDLmItuLS8xXPfgiF4J+5
         s+W57TS2F4ylwXpVO9jpO07YB79A7hXgPGk+xGz67xO3RvRnfrsFxJt73cJMwZZo4w7V
         G7u3dWHOc6cdjn59tXIPbBRyUGHW1PN9lh8gWF9mDgUJSIqLGcv0qa/IvA2DNijUMjDZ
         6YJ6GTsfw0USzOlUMGYv0vtnX9Z6l4NewVkZkjRm+wztNkL/rjeouhmFWQjG9HApiEgt
         3jLV/kc/qE6VwSdTM6gN5huM58RjKiCq5ShbmToL02QpE5picKMn4WWYJ1ntrrBwC0tH
         lKlA==
X-Forwarded-Encrypted: i=1; AJvYcCVeN9CJ3iTP3801EpG7/3wvteNRevvoszUWl+3Mqs8vz6siqZsCf9xG1Tgk0opZVLfB3iOcwv73RR5zWI3wck93wkOmFgPcKJCFbXOgGQ==
X-Gm-Message-State: AOJu0YyuBA1Vsc4JqY9UX9v3dI2JN139NCgQa76Pz/MKoQX7DhZIFgaB
	NtR9/u10tjKhigIjHFLKM8ojpc/1q5x8O6mOKr5gbapAhNlG3zNNT4HoAdyQEZY=
X-Google-Smtp-Source: AGHT+IEb9v07HEAy6iMiedWG06TIkfSqQ4xVeeNu1nK3+5AEiLRzNOYKaiOLNmWcnrOs12gFdxvodw==
X-Received: by 2002:a05:690c:660d:b0:62a:530:1e53 with SMTP id 00721157ae682-62a35ec8f2cmr110657407b3.30.1716973202645;
        Wed, 29 May 2024 02:00:02 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-62a0a4f1fd0sm23659277b3.95.2024.05.29.02.00.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 May 2024 02:00:02 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-df7722171bcso2001467276.3;
        Wed, 29 May 2024 02:00:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU9zPoV/Znf4KTavGE7ixHvtN1h2fdWEXKDqpQ1mBS2LiotSkHxNNthYQNQXDPw3OPCwb29qs6OIjWc44srX4blv38ghl+bznDZcbC7hA==
X-Received: by 2002:a25:ad0b:0:b0:deb:3cce:b158 with SMTP id
 3f1490d57ef6-df772241f6cmr13670438276.59.1716973202131; Wed, 29 May 2024
 02:00:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <7c5c0c8a10b8f755e5a75c7836b43cac63762eec.1716811405.git.geert+renesas@glider.be>
 <202405281126.rl6q4ObG-lkp@intel.com>
In-Reply-To: <202405281126.rl6q4ObG-lkp@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 May 2024 10:59:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWW+YZ6TXx4zoBAtrXK4GPXzQJEXtRZycWVWFaNWpTHkA@mail.gmail.com>
Message-ID: <CAMuHMdWW+YZ6TXx4zoBAtrXK4GPXzQJEXtRZycWVWFaNWpTHkA@mail.gmail.com>
Subject: Re: [PATCH/RFC 2/3] pmdomain: core: Avoid earlycon power-down
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Robot,

On Tue, May 28, 2024 at 5:20=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
> [This is a private test report for your RFC patch.]
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on tty/tty-testing]
> [also build test ERROR on tty/tty-next tty/tty-linus rafael-pm/linux-next=
 rafael-pm/bleeding-edge geert-renesas-devel/next linus/master v6.10-rc1 ne=
xt-20240523]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Geert-Uytterhoeven=
/earlycon-Export-clock-and-PM-Domain-info-from-FDT/20240527-204346
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tt=
y-testing
> patch link:    https://lore.kernel.org/r/7c5c0c8a10b8f755e5a75c7836b43cac=
63762eec.1716811405.git.geert%2Brenesas%40glider.be
> patch subject: [PATCH/RFC 2/3] pmdomain: core: Avoid earlycon power-down
> config: arm64-randconfig-002-20240528 (https://download.01.org/0day-ci/ar=
chive/20240528/202405281126.rl6q4ObG-lkp@intel.com/config)
> compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfd=
cc7b7bf66834a761bd8de445840ef68e4d1a)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240528/202405281126.rl6q4ObG-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202405281126.rl6q4ObG-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> ld.lld: error: undefined symbol: earlycon_power_domains
>    >>> referenced by core.c
>    >>>               drivers/pmdomain/core.o:(of_genpd_add_provider_simpl=
e) in archive vmlinux.a
>    >>> referenced by core.c
>    >>>               drivers/pmdomain/core.o:(of_genpd_add_provider_simpl=
e) in archive vmlinux.a
>    >>> referenced by core.c
>    >>>               drivers/pmdomain/core.o:(of_genpd_add_provider_onece=
ll) in archive vmlinux.a
>    >>> referenced 1 more times
> --
> >> ld.lld: error: undefined symbol: earlycon_power_domains_ncells
>    >>> referenced by core.c
>    >>>               drivers/pmdomain/core.o:(of_genpd_add_provider_onece=
ll) in archive vmlinux.a
>    >>> referenced by core.c
>    >>>               drivers/pmdomain/core.o:(of_genpd_add_provider_onece=
ll) in archive vmlinux.a

Thank you, will fix in v2.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
