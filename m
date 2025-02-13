Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B351A26619D
	for <llvm@lists.linux.dev>; Thu, 13 Feb 2025 21:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739481030; cv=none; b=STaz4DWaP76TE4mo6RjFPJX2GD5WatkpAMu+nue7DfCUPp9P7JcCjlfhIu5GDfivHGdlKXbdOD84H3VRTVn2yayGTHaGXSB+iTyMHrh8+vORvepdW4pGNT8nS08f41hqTagn7YMXGx+3Ih+uJXGpe2kpg4diFzkuJtyiYirW/bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739481030; c=relaxed/simple;
	bh=fbPB2g7+Pf/OZk+WU7lLUYgJUck4kov9uZUxiWM9e4k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OYTow6qQzv50Mn0vKtyUgMoV3zK+SivnwW9jVGoplOFO3bF423NYFIvyXQFCoe9Q+bs9ko/llX6k9A7BQi/9S7Fb/05ZYohET4NaeGHiZEMxrvxOtmaho1Fijd5V4fCPlHsVo/UDI1p8ATSA6LaOlK0EVVI6rxgcNPYm02y3t5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=u/BZ0JPI; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u/BZ0JPI"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5dec85c8bfcso500a12.1
        for <llvm@lists.linux.dev>; Thu, 13 Feb 2025 13:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739481027; x=1740085827; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e3EIJlcz7W21awhaRwqJUO1L0hARhWCWmvV/tV0cCAM=;
        b=u/BZ0JPIY4pBJuvRfnj64FBNpzWF+OOVZ+GkqvnDyeuWU4XpK+dqgkt+Q0jb1mdVWj
         a5wmDb07joluv8g+chBPG20SezxpE19YrfVV5PjeavNmPs8UJHF7DVtDxuE32mIJWbKF
         01AmRN/7eJG/ARltBkfjJE42qUg4Iya1c39kZyg0nBAuqS8sQxGgqYmeGSj0jKYMH5fX
         1ES4VUr70n4ArRF7B4SKNY2zetQjtl4YlhxEz8pohfyUgOeZ5O0rV+u8xPOkkGTA/1eo
         dw4jNZaNvs8aQI3gi6keT4sRQ9AI+w8Nuc6zXPUpypk9D5oMw0Z1DiAlJo5tsbvPq53M
         X5lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739481027; x=1740085827;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e3EIJlcz7W21awhaRwqJUO1L0hARhWCWmvV/tV0cCAM=;
        b=NzSmYYL9S/u7f25LT1ojfhz4vkapjLZmviZ6G2WqZqbBHLPGe5ehR5YYUHOAhJsxd7
         18Is5PeH/EUgifQHqTFiN6Qdx6kx+pbSqI/MdZ+xUGP1nNFRHpszx7U+4WhafcUJySZn
         MRfpx+ZqAHX/6gRC6RlP44q9Nv19cIaXx9Z6BgSW1QowkIj4SjRc4y6M9w5hOTqXdN68
         BUS3+X1T+E3Schh9htcnqHVnqH4KKX6U62IiQAPcp0RPehUcl2hiota660D57bN1KJda
         6mS5HwyIqveqX9NEjEmXGY7tAggLc3KLNQ/Vo6MDiyAhZGWDry86m1vbhoSgMDnagETj
         pycw==
X-Gm-Message-State: AOJu0Yx3gPoeSjir/zvS5VL7JOi/5HyPTb0uL0B8ZC2Q2rg06cPUW8d7
	O49L3X8eZxqqmbajyizUTUTThMCqfNkmtOZvjnpAlsAtcS5d5idCgZS54VExQig5YQ8TuWum4NN
	/IIkA3bwthLbocC9Br83enmeyk7Yz6djQib42
X-Gm-Gg: ASbGncuSzyaur0QxFpR6PwPxJg2LviwDYw7KZpHztNrgjOBS6jiu+V3ynSVaiRHJSXz
	duIQamH1JywNastqLO3XhHrOH+ZXWylxirHvQAmqPswXrTRZmDX3afHFgf/sBoHPfbIWN7Q==
X-Google-Smtp-Source: AGHT+IE4EkwbKfc//9+1MZxgEsl4MWNzDPz8faVVQlldBTaEv0zhTQ1aUl8MsNRTyPEjtzoxXm+2TMxNKGca2MElpoE=
X-Received: by 2002:aa7:d693:0:b0:5de:c2ed:768f with SMTP id
 4fb4d7f45d1cf-5dedc9d3976mr22730a12.2.1739481026780; Thu, 13 Feb 2025
 13:10:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202502120752.U3fOKScQ-lkp@intel.com> <20250212005617.GA1701202@google.com>
In-Reply-To: <20250212005617.GA1701202@google.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 13 Feb 2025 13:09:49 -0800
X-Gm-Features: AWEUYZliotNteXwj_bjDaPg1_ob8hdfyT5B8Vymq6VI9KK7vl8yMk6AcuNhrdfE
Message-ID: <CABCJKufs3XXXGfNNocvtLfwh_6W8LLo7JR+SWMn2-MTXe3RMmQ@mail.gmail.com>
Subject: Re: error: gendwarfksyms: process_module: dwarf_get_units failed: no
 debugging information?
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2025 at 4:56=E2=80=AFPM Sami Tolvanen <samitolvanen@google.=
com> wrote:
>
> On Wed, Feb 12, 2025 at 07:55:45AM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git master
> > head:   09fbf3d502050282bf47ab3babe1d4ed54dd1fd8
> > commit: 9c3681f9b9fd12cdbc4a542df599f1837512f3d5 kbuild: Add gendwarfks=
yms as an alternative to genksyms
> > date:   5 weeks ago
> > config: s390-randconfig-002-20250212 (https://download.01.org/0day-ci/a=
rchive/20250212/202502120752.U3fOKScQ-lkp@intel.com/config)
> > compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 60=
09708b4367171ccdbf4b5905cb6a803753fe18)
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20250212/202502120752.U3fOKScQ-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202502120752.U3fOKScQ-l=
kp@intel.com/
> >
> > All error/warnings (new ones prefixed by >>):
> >
> > >> error: gendwarfksyms: process_module: dwarf_get_units failed: no deb=
ugging information?
> > --
> >    In file included from <stdin>:3:
> >    In file included from arch/s390/include/asm/asm-prototypes.h:4:
> > >> include/linux/kvm_host.h:1908:24: warning: field 'desc' with variabl=
e sized type 'struct kvm_stats_desc' not at the end of a struct or class is=
 a GNU extension [-Wgnu-variable-sized-type-not-at-end]
> >     1908 |         struct kvm_stats_desc desc;
> >          |                               ^
> >    1 warning generated.
> > >> error: gendwarfksyms: process_module: dwarf_get_units failed: no deb=
ugging information?
>
> The issue appears to be that the files in arch/s390/purgatory are
> always built without debugging information, even though they include
> code that uses EXPORT_SYMBOL.
>
> I suspect the correct solution here is to ignore the object files in
> this directory when calculating modversions. The quick patch below
> fixes the build issue for me. Masahiro, does this look reasonable to
> you?

Ugh, we should just set __DISABLE_EXPORTS for all the object files,
not only sha256.o. I'll send a patch.

Sami
