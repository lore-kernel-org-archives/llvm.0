Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D1C3A5E72
	for <llvm@lists.linux.dev>; Fri, 29 May 2026 08:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780041674; cv=pass; b=FKndCocDBcMZsrAdr3l5JW3Gzpiini6VdJ8BNbwY74thkpiA/cG4JfhZxW0pzbaH7Uyhjc9HOi/4thzVfFZJsTvoLCu4pToF9tThtspjpsBvwbPw58DAw1hSfslzW2ps1YlyWq3J3ssa/NcfWFzga3O9ev/yKeP9e+cuO3UT5M0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780041674; c=relaxed/simple;
	bh=H7PKQ1V0ixvaX8oVe7cpQhD7iZmduazOfTs/hxY5WJA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iYsHz01TzCRyzlh0FmoJ3dhtrbVxe6FFRYyEY3ifdBf0rl77xjQqqXRT7eTsTVVx9UgJEjvTSArARjNWE7mARONOWgDN3Dz+H+kpHJbrKC6W0boDoq6OATlRFU5AFFpE4yCR/54qIPTv54l3WyAXBbWk96A6zAFji1XpkRbn3kQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=By025H0K; arc=pass smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="By025H0K"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-130c9dcbd25so8129299c88.1
        for <llvm@lists.linux.dev>; Fri, 29 May 2026 01:01:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780041672; cv=none;
        d=google.com; s=arc-20240605;
        b=YRuCQSXHyOh2kqvU9O1+YLq2HLZFdBFVEKO6CO/YomV4TztdEwojK1/+jbeYq/8bw9
         z2HTvYA2w+Oy1C757ozclM+HBDwHcSIC7ZioHjgYUXbRNvR+nwVxM3qfrSh3JKxP2w5b
         ke8qmKSg9VH8/HKyreHC/4QNuhRCLkf6E6uqIeWBz5rrliV8yx8CogP5s1ydnSzmyQ15
         2iw48d7BhIO9xPNf9KBhQRsDyIeP25zP3UUaaTNw7WfrJQ7HUMMfxpNJiMTIoh/Z6FfQ
         ltxISXywxPX+DlR1XF11hRw0KQBSU6Zxr8Eiog4MS51DV4t1GqZzithSBXOlgTSVp+v8
         +k9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h9IaWS9MuReoJAQbEMj+Jq8lZE97ObkkLWcHV/Hs4x8=;
        fh=SRWjnQWU8G/vs3li1loHTZ3RUHp8JKx2gfF3NFJDh5I=;
        b=CNax8/7Zx5JQxK7FoSKarkEgLNhdf1IFXkAFA8AERreOt/DG7J/v7r4VNLYwXTr8/6
         uiIbNZvJ3GfMx9uBibmSz5TINYl6xTMFucRY42YHGz1v3fBArEq/eCLApaClPpFFGbrx
         IYpu2emgeAwVSl3u3FXgZ8awml3tHXlJEIBmR5Ytnow+wZHFSmgv+VkKHhtsmz4LrP+x
         Nx6FOolb77ECF5Eea8wfA4lOKKbiCp7KM8C2qiKDNTiFRa7xHOkh87tVyAi4HOTxTStx
         PwcDrGRH1u4yjGxMoO8j3d6tTZi/7Kgbt+IzFDtIXk5LS8Sd6Rkx+MkSmMFqy80/lVrm
         x9GQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780041672; x=1780646472; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h9IaWS9MuReoJAQbEMj+Jq8lZE97ObkkLWcHV/Hs4x8=;
        b=By025H0KGyxllR+/TJUVpv7WRDa2uRi/ARpfhHrpPFr7RkC+2c4G5Vos31ZX75aggP
         MWj9zkZLFAbMFNWhp47i7GHyfxCvkJbaZErtQvY9mDSljFGGFhbU3Z66/u7P7po8w5Hv
         POQDvaVEzSdEHVX1ROu1ppneG+AatZrAEd+hnqO+SBM0cojdjrDbxXM01joR7dkfudya
         sjjJSKXHXFTYI0RHjqxB5P9UR4u6HSzv/ksbDKXBGrp5ILif/OD8inyOEF5jnuIJHfug
         SWFtrghi+l1ZboeuJrHcSzZFJ1SsC1IB2WkYFxUxUVq03LMkO5+crzkgXsQbtUWgAZk2
         LSfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780041672; x=1780646472;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h9IaWS9MuReoJAQbEMj+Jq8lZE97ObkkLWcHV/Hs4x8=;
        b=AJkXuBOVdg1Q9w59aLNcN+96TZ+IPSVZ76SeAn4kjRccqRn8qCBKhdf2nk/zgvNqd6
         +daHBeFlEVfr2IIBd4FQ/SKRy66/GjkHIgYRnL1p8ye0E8CI5aHv7RNz54dnpzlr2LX4
         Zk8S4Q10OfBrkD8nUM+lFaHBh+lVtiGeye5Nmvaobu8zgCgvcXXF+TuzjLoHwJ2YPU2v
         gV5LPmZuFCYFjurOSWJFvc11i8o9z1PCsIIlZpwfZnI+sBWGZu0OzN78InJC5xTSIj6+
         M8tndYxcCfCFry8sXelDWGJX8pTGskVHCoujYYSYSuoWAT3lraCWh4p/lfXVuXrsBpFZ
         EsNw==
X-Forwarded-Encrypted: i=1; AFNElJ90jO0OaJE/6EkzosO+yqAQY1kznzAMHXC/qTQA+huYo5niwdKk96f3pLAxUMiusUzlALcG@lists.linux.dev
X-Gm-Message-State: AOJu0YyP5Z7gWghcNdUVn/tQjwsZ9s1cOKf5Nj/w1rTfVBWD1ijvwEWv
	ZK+h+mjLlHa1vZMiEzhtLNH1DfWqs6qd67eKpu6SDZvF6Y2zW5EQtcSirIIpKPpWnAHn82rFTS6
	dRpBRNGQ320sCe6bRhHcF0991QnBmcqMeugYVLuBX
X-Gm-Gg: Acq92OFYpB7DrZZGLGvmep5mkhWD0P7yXuoGj8Mh5gB0pkj931HnW8S3D26/dgBPRit
	VBfHVEE4k8WbzCP7aOuzZyR6Zk2Jb3JvDGaEtfAMSEMoBqYCgPRu12/MA/zuZ5D8p4axwq9xib8
	WnmZVPRnBzcx93QIiVbQh4RNJeaQezQLKxRbt4SDWhW/BGXokU3R4p/1ZTPO9nSpSfPxBq0XJLk
	o2DwPzhoJoqOszmiUp0vBW+JDHqMRrZHPQqFUrJWgMOm7HGI+EPlrqbbdtlmao/94Q3fuHYNSgO
	pRHtEiQ9muiXSJNBU09ByPEdonlGPobR/nw/Ffc6pTnwhg2NmnnL1O3vXBOYftZKXCVnk/hGCmT
	tMBCa
X-Received: by 2002:a05:7022:2221:b0:136:4bbe:9524 with SMTP id
 a92af1059eb24-137ae61dbe5mr768951c88.10.1780041671463; Fri, 29 May 2026
 01:01:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202605291041.seNEWvLQ-lkp@intel.com> <ahkzosbjO4NdSyD8@google.com>
 <DIUZYLZW1KTM.VRI2RJ8DXEGQ@nvidia.com>
In-Reply-To: <DIUZYLZW1KTM.VRI2RJ8DXEGQ@nvidia.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 29 May 2026 10:00:51 +0200
X-Gm-Features: AVHnY4JLxRuhL58doZ06uRkm-dD6MUWwn2fk8nlzOdANNCE59i3vCeVtWZh7p04
Message-ID: <CAH5fLgiFo1rep3N5qGWGsTXT177hfSwW0=e1KsVCrrz2uRMoBw@mail.gmail.com>
Subject: Re: [linux-next:master 3728/9137] samples/rust/rust_driver_auxiliary.o:
 warning: objtool: _RINvXs5_NtNtCshc5sK6KjdJJ_6kernel5alloc4kboxINtB6_3BoxINtNtNtCsbsbRiabPlh9_4core3mem12maybe_uninit11MaybeUninitINtNtBa_9auxiliary16RegistrationDataNtCseULRbgTYaTO_21rust_driver_auxiliary4DataEENtNtB...
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: kernel test robot <lkp@intel.com>, Danilo Krummrich <dakr@kernel.org>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2026 at 9:54=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> On Fri May 29, 2026 at 3:35 PM JST, Alice Ryhl wrote:
> > On Fri, May 29, 2026 at 10:52:52AM +0800, kernel test robot wrote:
> >> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-nex=
t.git master
> >> head:   f7af91adc230aa99e23330ecf85bc9badd9780ad
> >> commit: fd3b87ff0232f46e1ad53a48609a3853c8757c6c [3728/9137] rust: aux=
iliary: add registration data to auxiliary devices
> >> config: x86_64-randconfig-004-20260529 (https://download.01.org/0day-c=
i/archive/20260529/202605291041.seNEWvLQ-lkp@intel.com/config)
> >> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 8=
7f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> >> rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
> >> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/ar=
chive/20260529/202605291041.seNEWvLQ-lkp@intel.com/reproduce)
> >>
> >> If you fix the issue in a separate patch/commit (i.e. not just a new v=
ersion of
> >> the same patch/commit), kindly add following tags
> >> | Reported-by: kernel test robot <lkp@intel.com>
> >> | Closes: https://lore.kernel.org/oe-kbuild-all/202605291041.seNEWvLQ-=
lkp@intel.com/
> >>
> >> All warnings (new ones prefixed by >>):
> >>
> >>    samples/rust/rust_driver_auxiliary.o: warning: objtool: asan.module=
_ctor+0xd: call without frame pointer save/setup
> >>    samples/rust/rust_driver_auxiliary.o: warning: objtool: asan.module=
_dtor+0x1: call without frame pointer save/setup
> >
> > This one looks like this bug:
> > https://github.com/rust-lang/rust/pull/156980
>
> Does [1] work around the problem by any chance?
>
> [1] https://lore.kernel.org/all/20260527-nova-exports-v2-3-06de4c556d55@n=
vidia.com/

The asan.module_ctor error? I don't see how it would work around that.

Alice
