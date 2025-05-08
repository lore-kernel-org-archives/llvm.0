Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC242857FD;
	Thu,  8 May 2025 17:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746724991; cv=none; b=qsyNOe1YT0p6u15LfEhfGWwf5rqLPMk+NqIAk8qEIkQjZ+9WwZKlOzd2ewYDMl76+eFzr5b/ARHH1M1+RUU/pmWQarzrtkSxQ/sFAm6HbzM/lgsWsS3nCQjhWjUBFi29l9+PimdlNQd8FoRprVemtXfL577RY6v+1Jw2ADNilp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746724991; c=relaxed/simple;
	bh=+9x1FMhEx3Xatqy2xCmNJGk3ium1PywM5UTI0d83Pz8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IwifWSXH0rrGaVVnRT1cf09PbxHTOGjEW8IASDpnxVdK4ldbH09p5IvV30R70yHoMKY9d8wuZeHuiAaCbE7IQ3kTtnIgBOKFm1IQfvkkbkG0wKHufzaP0Sn2ik2YntFqW8MCccaBUOSgK1AgQjKJozZ5Cw1iXGE16qGBDswxbi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A35BSBPM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A35BSBPM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 230A6C4CEE7;
	Thu,  8 May 2025 17:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746724989;
	bh=+9x1FMhEx3Xatqy2xCmNJGk3ium1PywM5UTI0d83Pz8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=A35BSBPMwDidTftB5grMFJUbMW1IJJfeu62NrmtKOXqDBszPTTKBQgR/ix6k79FWL
	 L+T7fzv+S/2k6XR7JRFsmA5cesrtACvQMxsaj1hAX6R9lEOBWaNJeaJO/ZAnhNWUEU
	 mYwx5N2z9PixkBIpgRbp13DNZ4MLSp9cn8eBDW1a8ECJWemIpc0fBVvEloh788SI0C
	 AmlwRhENnRTm1KeIkNvJjg2oxnMVuH2DGXVdv8oWsLZ0j/F2WQordmaGi8Ib3Sko7K
	 ykyZJwUMYEo9bUsjqxTNv06s1GaeqNSWoD9d2K9LkBSupxgt5R28cvV/3cleu4/5BU
	 cXmREa4XVd5aA==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30db2c2c609so12671621fa.3;
        Thu, 08 May 2025 10:23:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVIu3HZz4PTwLFRdYIctv3kDUunlIFDxA5R7k3vcrhx0n+7XTvI3OZzaHAotbvBsD6Er2wHZOAb2NEt2nTAWw==@lists.linux.dev, AJvYcCVhYO1mCfD6egKlU+a9OFHg4eeiiM8GTHLdXdUk2yK8KsB5Mirgyn9eRvDf54PqwSfg1+8h@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0cZYryPZ0QOKso9gRXJ3CZ5bDAyJMgBihNBS4eqN12I2RshCO
	MxT65DAp/dk3cDybtyKfVN00oQthdLkRYMq/IZfcID5P9XRmQQkWaufp4Sze+EoXPA5lWm7kxwh
	9BRx9hAkuiKgouw/rrkspOSV1utA=
X-Google-Smtp-Source: AGHT+IFE8Gu6Fse747Sm25WE0Bqv4hk6umsUcdtGX6YselAaQxlOHGTfG4na3ONGX2WHNJaiPjkjX5nKMCma2XxB9mc=
X-Received: by 2002:a05:651c:211b:b0:30b:cd68:b69c with SMTP id
 38308e7fff4ca-326c459a529mr1823611fa.3.1746724987551; Thu, 08 May 2025
 10:23:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202505090001.FS7smjqJ-lkp@intel.com> <CAMj1kXEnn0T3zCTq=b8OE0aYB6=ZQ+9p8GK_dxUyD+81d8jYHg@mail.gmail.com>
 <20250508165710.GA2787919@ax162> <CAMj1kXGQNyHw57bp-iHU0qgYBKwBS1SSJbq5X9BQkCvKLJFyrw@mail.gmail.com>
In-Reply-To: <CAMj1kXGQNyHw57bp-iHU0qgYBKwBS1SSJbq5X9BQkCvKLJFyrw@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 8 May 2025 19:22:56 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFQRoMzF5xAgZFCB1jVsn_MZ6oDXcf=PYnoePZU9j=NTw@mail.gmail.com>
X-Gm-Features: ATxdqUGDHisb_XevbSV7YlHnMzhHbDMZZe4amYi9FVWCyy4MOL7y-uxn2ahUEYc
Message-ID: <CAMj1kXFQRoMzF5xAgZFCB1jVsn_MZ6oDXcf=PYnoePZU9j=NTw@mail.gmail.com>
Subject: Re: [ardb:for-kernelci 15/18] arch/x86/boot/startup/sev-startup.c:141:15:
 error: '__section__' attribute only applies to functions, global variables,
 Objective-C methods, and Objective-C properties
To: Nathan Chancellor <nathan@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 8 May 2025 at 19:22, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Thu, 8 May 2025 at 18:57, Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > On Thu, May 08, 2025 at 06:50:56PM +0200, Ard Biesheuvel wrote:
> > > Hey Nathan,
> > >
> > > The error below looks bizarre to me. Any clue?
> > >
> > > On Thu, 8 May 2025 at 18:20, kernel test robot <lkp@intel.com> wrote:
> > > >
> > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git for-kernelci
> > > > head:   f309d115ff0674e0ce4fe010e587d40bfb5b6e4e
> > > > commit: 54ae382c92b4521365fde402a792038b968188f8 [15/18] x86/boot: Move startup code out of __head section
> > > > config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250509/202505090001.FS7smjqJ-lkp@intel.com/config)
> > > > compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
> > > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505090001.FS7smjqJ-lkp@intel.com/reproduce)
> > > >
> > > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > > the same patch/commit), kindly add following tags
> > > > | Reported-by: kernel test robot <lkp@intel.com>
> > > > | Closes: https://lore.kernel.org/oe-kbuild-all/202505090001.FS7smjqJ-lkp@intel.com/
> > > >
> > > > All error/warnings (new ones prefixed by >>):
> > > >
> > > > >> arch/x86/boot/startup/sev-startup.c:141:15: error: '__section__' attribute only applies to functions, global variables, Objective-C methods, and Objective-C properties
> > > >      141 | static struct __init cc_blob_sev_info *find_cc_blob(struct boot_params *bp)
> > > >          |               ^
> >
> > I think this should should be
> >
> >   static __init struct cc_blob_sev_info *find_cc_blob(struct boot_params *bp)
> >
> > or
> >
> >   static struct cc_blob_sev_info __init *find_cc_blob(struct boot_params *bp)
> >
> > The __init is splitting the return type.
> >
>
> Ah oops.
>
> Now I'm surprised it even worked at all with GCC.

Ah never mind - it probably didn't. This is some stale for-kernelci
branch, not something that I sent out recently.
