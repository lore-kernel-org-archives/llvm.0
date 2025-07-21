Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13EAF26ACC
	for <llvm@lists.linux.dev>; Mon, 21 Jul 2025 14:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753107467; cv=none; b=o7ZIo7MsDFJWLHqZ4E8DtHKXCvZliigZ8lozD9/T1JcYcALGux6hfcawhS0ivJkRlCtyssBYgKPhN4F84YUTuguS7fOVwZO/y3SWl0SDfTFRpnc/EA9PKrbF2F/8cMZfHTfC8eaiJJXCpThac1bC9wgjYqXT5vhFmaASctpHrRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753107467; c=relaxed/simple;
	bh=jx62/zzI69MGOw6Q1ltR2MwUC388v3A5IGqMmpKVPmI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H54Krptxx6kt1VVvbPMjmZADFD359hu6WENjFl6y5o1Uei9uQ0Ii5Q3AQ9bgWc0HEio9Rx2VNq3D7flm/CvvjiQLxFtdeLofy9lSWvbom04ZlnlDP9z9poIKIZbkFreWwCKSXo3mwhiEAdOAs6/kh78WhY2ET+K+tKWGN+z+9zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=v+/0tb6Z; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="v+/0tb6Z"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45600581226so45929845e9.1
        for <llvm@lists.linux.dev>; Mon, 21 Jul 2025 07:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753107462; x=1753712262; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aHTz2f/tCB5gJfHRUHusAnrHo0WkysiHKc8/HuxZcyk=;
        b=v+/0tb6ZkOWMa+Iwrknj9TrI/LRPowoztR4Nd/ltXSzA3LD664zicum6EpsFVPa482
         rhg3v316pr/I/D2agq/WQJPGIXhneBE1dOZLLoWPPGkveoB7M9Vo4HiYH8DzNXTrBeKM
         c7HCwwffIEMZJbGucVeN0LiBPIzwad3zymxtH3yCOZd+QtWLm6cnJA3eUClwZbYlxlOQ
         R7s/rb5HRdTF+QkXbikNXiVrK6K5/WI3XuvruKAqF8JMzC0M9eNLHnnTNnil2jj0DOWD
         6vSA1bvDQOOQ+scXpQ+uQfhm+q7UBybhIto+SeDfGXGh8r6MVBKSPxHNJUkfOYJ4PirF
         /xew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753107462; x=1753712262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aHTz2f/tCB5gJfHRUHusAnrHo0WkysiHKc8/HuxZcyk=;
        b=umB59iPUEwz3Cg2pyWZWmbTGv9OK2U/K2AK73wsOQLsXiLKYLc1qF63OjtkJ3khVhl
         d2r/NVdxs/BzObVxOoYfXsjM81WVlvZeTQn7KuRndGGJCaumt0Hxb1ZvqGpafGuIFaYr
         CO0VQ8Om14TmODtpSfBz2y2E3QQ075p11XZcq5y7ZH5fXftTR5nrJ/dMDugBgER2VkCD
         HI//ZQzS/u7sTZEF9Ph8BAHLDZ4e5bVKJtXuLz9iUpVzfrmbjMfiwwSI+guilP1RqaB7
         RTpebX3DbX3eZCQEo1wYEdSz4K57N+WXfsWeeaP8JdTRcvawJgs4T76zbfM4Kh51fcpU
         1Tbg==
X-Forwarded-Encrypted: i=1; AJvYcCUNWHZY5YtOOR5PrBb8+f7OxyqFI0Iv0NikhBzlxLyenDbiZvli3d57MwfruDXKjK8fT0q3@lists.linux.dev
X-Gm-Message-State: AOJu0YzGRxyaB059oCyCfBh4rbUyPyl1Do5DoWkhAzMW70hL9+tUZNzV
	3DIGS/dxVGNPlGplagSei23givP6w7E4Cx0wBATAtSuT9Ur8z5iimIDlFGBSM21zrC5sLvwwWf3
	g6OcqyNsrlyXtGHrjfoe2mFZOh/LsGZgeITCdPufo
X-Gm-Gg: ASbGncttZDXUBLGqBsHk2MFjlKCcXM+5ux5Vi3xEY2tTqmljNPfNwrzySQNuA9/O6Hd
	N4M71X75WaHXowNUkJHro0atEeQzjTAcwGx6M+yNIWy2jzkL6uwjWoW68ad7afJVpyw4rpzjpkc
	Yr1yE5/HkxE47F90FItZhUU0l2rx10Bhc+DDTH/119Sc++NMKDR+uvBm27lpACMb3w7loPJZKk4
	v5Q4zxxeqCISFXmzKv+ZSl2nG6J27BNWcDaow==
X-Google-Smtp-Source: AGHT+IGjLzZ7/Km2FCbSNRsrArfXJV2GEMgIhjJN78UwwjSKkWJY+F2cHXQv40vfc3kSfYwQzfjjab4StDfPm4kGNEg=
X-Received: by 2002:a05:600c:5253:b0:456:1efa:8fe9 with SMTP id
 5b1f17b1804b1-4562e03a678mr216153965e9.2.1753107462190; Mon, 21 Jul 2025
 07:17:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250715-topics-tyr-request_irq2-v7-3-d469c0f37c07@collabora.com>
 <202507170718.AVqYqRan-lkp@intel.com> <9834736F-F70F-4290-9DE8-755A6D0D5EB8@collabora.com>
In-Reply-To: <9834736F-F70F-4290-9DE8-755A6D0D5EB8@collabora.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 21 Jul 2025 16:17:29 +0200
X-Gm-Features: Ac12FXzqc3WLYmS_rx0F_dtIhtQQ4LQMKVOtCM3xLb6rdTs9AmutrC95-1kYQiY
Message-ID: <CAH5fLggfp36q0UmF_XNLCZKn+fc1xd2hMBsYX1UrtJqBFYrf+g@mail.gmail.com>
Subject: Re: [PATCH v7 3/6] rust: irq: add support for non-threaded IRQs and handlers
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: kernel test robot <lkp@intel.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Bjorn Helgaas <helgaas@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Benno Lossin <lossin@kernel.org>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 17, 2025 at 6:21=E2=80=AFPM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
>
>
> > On 16 Jul 2025, at 20:45, kernel test robot <lkp@intel.com> wrote:
> >
> > Hi Daniel,
> >
> > kernel test robot noticed the following build errors:
> >
> > [auto build test ERROR on 3964d07dd821efe9680e90c51c86661a98e60a0f]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Almeida/r=
ust-irq-add-irq-module/20250715-232121
> > base:   3964d07dd821efe9680e90c51c86661a98e60a0f
> > patch link:    https://lore.kernel.org/r/20250715-topics-tyr-request_ir=
q2-v7-3-d469c0f37c07%40collabora.com
> > patch subject: [PATCH v7 3/6] rust: irq: add support for non-threaded I=
RQs and handlers
> > config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/2=
0250717/202507170718.AVqYqRan-lkp@intel.com/config)
> > compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87=
f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> > rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20250717/202507170718.AVqYqRan-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202507170718.AVqYqRan-l=
kp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> >>> error[E0425]: cannot find value `SHARED` in module `flags`
> >   --> rust/doctests_kernel_generated.rs:4790:58
> >   |
> >   4790 |     let registration =3D Registration::new(request, flags::SHA=
RED, c_str!("my_device"), handler);
> >   |                                                          ^^^^^^ not=
 found in `flags`
> >   |
> >   help: consider importing this constant
> >   |
> >   3    + use kernel::mm::virt::flags::SHARED;
> >   |
> >   help: if you import `SHARED`, refer to it directly
> >   |
> >   4790 -     let registration =3D Registration::new(request, flags::SHA=
RED, c_str!("my_device"), handler);
> >   4790 +     let registration =3D Registration::new(request, SHARED, c_=
str!("my_device"), handler);
> >   |
> >
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
> >
>
> This is a single character fix, so I am waiting for the discussion on the=
 cover
> letter [0] to advance before sending a new version.
>
> [0] https://lore.kernel.org/all/DBCQKJIBVGGM.1R0QNKO3TE4N0@kernel.org/#t

My suggestion is to make the flags module private and re-export the
Flags type from the irq module. That way you don't have to write
use kernel::irq::flags::Flags;

Alice
