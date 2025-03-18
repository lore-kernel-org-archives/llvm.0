Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB984199384;
	Tue, 18 Mar 2025 16:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742315251; cv=none; b=dVBL74tkd+S113rcQ41KPvg3FTlQCcy3xhYo0b+b/z6G9Uxhx9HXV8kqWWvYQzsUV88QndTHKqN9LonHsdVhBlDRN7GPt3zGISMgwOVX0EvzD7j5nziKwvTuInV45CT0UJIV2CTY46OL3r+Bne4myxgN+tl1q5osQu9vECsyv0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742315251; c=relaxed/simple;
	bh=+XDY1qmtYjm5+RghuCBaSd2Ai8Ppy/IYl9QmZA0YIPk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LXNNVN3DUoxFhiTdGN9XkNLmrrgH7LcFLTHlfzfawcLA3UAOL6nu00lZUTuniukMkuuyOZyozYKjclhz1Q61VKtS8UxLgRWZFTDFxNJww7QGThblKHVA3Zg2MuGAr71pdoK/WwBNvx/bxeqOHsmBKPFGPGvK7OxCS1dOJSzVkLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PmTzDc0U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PmTzDc0U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72848C4CEEE;
	Tue, 18 Mar 2025 16:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742315250;
	bh=+XDY1qmtYjm5+RghuCBaSd2Ai8Ppy/IYl9QmZA0YIPk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PmTzDc0U8a+w7hMQzYch4lHlEPYdUTBNUNyDqDzV8jA9fae0jd7tX+Qt8zKx+T1XG
	 kW1H8eXVUwXeVG71+SsuyTQVfejCWJHj/N4it+hCT29BybVAEJPGaxoB+zMHMzJdlP
	 2Erx9kaVNvoGNTXqBPqYTXbM0B2gppjvWQowP7t8feu2NerK6WUpg6sfzw6faU1dM/
	 Gfg0n6IDes10FycfVG9m/nkKRJUXe0+EwksdmDVUAp4i9kVVPwqQqbDIpkD9haDwao
	 U4ooqm+Iss1qyVHHbd0EdmgQJobzAWastktzq7YZq9D1c0WZP5frBUDzBIdUyQo5dM
	 BnygybhvBIz5Q==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54996d30bfbso5275663e87.2;
        Tue, 18 Mar 2025 09:27:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU5Y15SgOikdCWRiXe3AyJAN62lvOc0EgY+kOyTcfec2tqwxordAMWEQibWhcYgCpNPWdz57XNWBjkKnx0AMA==@lists.linux.dev, AJvYcCUTaNwapoFuRFAXiRQvwfCUt5PNzlNIqo96yoJvbmv81zBCVYq+WhNBC/iML25plBDL1h37@lists.linux.dev
X-Gm-Message-State: AOJu0Yw353mKylOiFALP8mBZqmuyF6WbFezgrMMgV7E2zzfvkeqe+9fz
	5qYu3KMroIQDJEfm7dqMFSXkt5J5ii1Tv8v1M0kpH6LA78Qg6OXoGay6Z1NzWciFQiNKPIF3FNB
	XBjn0qKiA89lIcWhCy3148Hgugrk=
X-Google-Smtp-Source: AGHT+IHl+OsJqKBm4A4NcSbJwQrqJRpHwt/4YBmuHBd1yTofEmsxOMxZLSR8ZBbiYP3ugXHJWcUzR5d6OdpkdeVxzaI=
X-Received: by 2002:a05:6512:2245:b0:545:cc5:be90 with SMTP id
 2adb3069b0e04-549c398cf85mr10055980e87.35.1742315249162; Tue, 18 Mar 2025
 09:27:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250311110616.148682-9-ardb+git@google.com> <202503131715.Fb6CfjhT-lkp@intel.com>
 <CAMj1kXGBLV6W7mJcELmsQuDUi0u-DofyD985znmVoHoZKZTuxA@mail.gmail.com>
 <CAMj1kXEZccymq1OhXErSK+prS3L7sygm7_5_1v+j2cypncQuzA@mail.gmail.com>
 <CAK7LNAT_NRio2pkR1Km5Nq8KM38zYF7VCoGP0OjEP_Owg-ukpQ@mail.gmail.com>
 <20250318081753.8448Abd-hca@linux.ibm.com> <CAMj1kXHoCgRu5werVnEJs+w4nkuiHA1SAyhwxqPyPF6Mk6Js3w@mail.gmail.com>
In-Reply-To: <CAMj1kXHoCgRu5werVnEJs+w4nkuiHA1SAyhwxqPyPF6Mk6Js3w@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 19 Mar 2025 01:26:52 +0900
X-Gmail-Original-Message-ID: <CAK7LNATSABs3GkhGB_27=5m37_d-gNoZ-keuct7GMGOtnMt0Cg@mail.gmail.com>
X-Gm-Features: AQ5f1JowlnLK7HIqJP34ij3N2k8jfBhKfw1DJz1JIi7Wfp2LDQRTI5vQVU3bNcI
Message-ID: <CAK7LNATSABs3GkhGB_27=5m37_d-gNoZ-keuct7GMGOtnMt0Cg@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] Kbuild: Create intermediate vmlinux build with
 relocations preserved
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Heiko Carstens <hca@linux.ibm.com>, kernel test robot <lkp@intel.com>, 
	Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, linux-kbuild@vger.kernel.org, x86@kernel.org, 
	Ingo Molnar <mingo@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, linux-s390@vger.kernel.org, linux-next@vger.kernel.org, 
	Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 18, 2025 at 5:27=E2=80=AFPM Ard Biesheuvel <ardb@kernel.org> wr=
ote:
>
> On Tue, 18 Mar 2025 at 09:18, Heiko Carstens <hca@linux.ibm.com> wrote:
> >
> > On Thu, Mar 13, 2025 at 07:29:41PM +0900, Masahiro Yamada wrote:
> > > On Thu, Mar 13, 2025 at 7:18=E2=80=AFPM Ard Biesheuvel <ardb@kernel.o=
rg> wrote:
> > > > On Thu, 13 Mar 2025 at 10:34, Ard Biesheuvel <ardb@kernel.org> wrot=
e:
> > > > > On Thu, 13 Mar 2025 at 10:21, kernel test robot <lkp@intel.com> w=
rote:
> > > > > > kernel test robot noticed the following build errors:
> > > > > >
> > > > > > [auto build test ERROR on masahiroy-kbuild/for-next]
> > > > > > [also build test ERROR on masahiroy-kbuild/fixes tip/x86/core s=
390/features linus/master v6.14-rc6 next-20250312]
> > > > > > [If your patch is applied to the wrong git tree, kindly drop us=
 a note.
> > > > > > And when submitting patch, we suggest to use '--base' as docume=
nted in
> > > > > > https://git-scm.com/docs/git-format-patch#_base_tree_informatio=
n]
> > > > > >
> > > > > > url:    https://github.com/intel-lab-lkp/linux/commits/Ard-Bies=
heuvel/Kbuild-link-vmlinux-sh-Make-output-file-name-configurable/20250311-1=
90926
> > > > > > base:   https://git.kernel.org/pub/scm/linux/kernel/git/masahir=
oy/linux-kbuild.git for-next
> > > > > > patch link:    https://lore.kernel.org/r/20250311110616.148682-=
9-ardb%2Bgit%40google.com
> > > > > > patch subject: [PATCH v2 3/4] Kbuild: Create intermediate vmlin=
ux build with relocations preserved
> > > > > > config: x86_64-randconfig-076-20250313 (https://download.01.org=
/0day-ci/archive/20250313/202503131715.Fb6CfjhT-lkp@intel.com/config)
> > > > > > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> > > > > > reproduce (this is a W=3D1 build): (https://download.01.org/0da=
y-ci/archive/20250313/202503131715.Fb6CfjhT-lkp@intel.com/reproduce)
> > > > > >
> > > > > > If you fix the issue in a separate patch/commit (i.e. not just =
a new version of
> > > > > > the same patch/commit), kindly add following tags
> > > > > > | Reported-by: kernel test robot <lkp@intel.com>
> > > > > > | Closes: https://lore.kernel.org/oe-kbuild-all/202503131715.Fb=
6CfjhT-lkp@intel.com/
> > > > > >
> > > > > > All errors (new ones prefixed by >>):
> > > > > >
> > > > > > >> gawk: scripts/generate_builtin_ranges.awk:82: fatal: cannot =
open file `vmlinux.map' for reading: No such file or directory
> > > > > >
> > > > >
> > > > > Hmm it seems I missed some things in link-vmlinux.sh - I will tak=
e a look.
> > > >
> > > > We'd need something like the below applied on top - shall I send a =
v3?
> > >
> > > I will insert this before you patch set.
> > > https://lore.kernel.org/linux-kbuild/20250313102604.1491732-1-masahir=
oy@kernel.org/T/#u
> > ...
> > > > --- a/scripts/link-vmlinux.sh
> > > > +++ b/scripts/link-vmlinux.sh
> > ...
> > > > -vmlinux_link "${VMLINUX}"
> > > > +vmlinux_link "${VMLINUX}" vmlinux.map
> > > >
> > > >  # fill in BTF IDs
> > > >  if is_enabled CONFIG_DEBUG_INFO_BTF; then
> >
> > Building linux-next breaks on s390 with DEBUG_INFO_BTF enabled because
> > of this; just where your addon patch ends:
> >
>
> Apologies for the breakage - this should already have been fixed in
> the kbuild tree [0] but the fix does not appear to have landed yet.
>
> [0] https://lore.kernel.org/all/202503161833.ytx1ivfu-lkp@intel.com
>
>
> Masahiro?

Sorry, I had applied the fix-up locally, but
forgot to do "git push".

The correct one is now available, and I hope
tomorrow's linux-next will be OK.

--=20
Best Regards
Masahiro Yamada
