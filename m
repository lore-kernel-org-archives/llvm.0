Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E6514F61;
	Fri, 18 Aug 2023 11:10:20 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-d71f1bc5735so792547276.1;
        Fri, 18 Aug 2023 04:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692357019; x=1692961819;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Aqcz6+CxleF/o9TEc80m8NBOqId1CND3CqvR2adeCrk=;
        b=bcWLE7GmjLzg5FLTfyj2gS7rzmn6BlMZrKEV189s13CdDRHbeZpltWXq5ZwCq3KoJ4
         RN7Pz6FU5DPcoVurTiZE2ceRXHBZDeMCJBIkH2Snn60xXuYcGTT9H0ud3edgD2HlSeVK
         t269fS0uUu876g7EqY6jOlIv/kuCJecN5bEuRcW4fWAU5OX4TBDeIw67ci9Q2lQbEzWe
         mKeBIk2SSJgrjaLKA0z1GtngW11H6hE064EshncH5hpjTRmlkO2WMe4DDZeBPffFm2ut
         eOjuwYS/8ZsDoG/otYo2huB/FEuTl3Tsyvd7IjstBHwa9DxiVB8ZqeTmCbqQOED6L1LV
         T2Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692357019; x=1692961819;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Aqcz6+CxleF/o9TEc80m8NBOqId1CND3CqvR2adeCrk=;
        b=bnwKWO7OWegsTimh8tZZ0mWLNifNNQB8CXq8QjcQJXv1+Gg7znEpwLEyzqSexACuLS
         JCNeJyrC9gz+BwVGWGgwmcNciQFC/SWx6Lo+BFfQ25GbhgmJ5X8xUlitQRtzREgZEbhq
         hOcF6jvXiax7RX7+fRpQbXHtlsI2VpskI7FC0NgygclZL/XiAKfpYUA9CgxJZuprxNZP
         omaVYZxUBTFN2xxOTm0ZgTPr3TaF+4RHM+Yrx5uGzzMU/ccPL2u1++Ldorl5rtpUKkNX
         z49O2Axhz4GtEaM57IpoMsq1iqxdvxU25lD5FZFfzQQhi4u3dD7ZFs0MiDGi7X7+1KgP
         kb8A==
X-Gm-Message-State: AOJu0YyqPgl3XPmmMChNisVqO2Aux0XRigsF/MMbEUvnNeay6zqMjt+/
	x06Sc3RtcsjfwMRmlCq91czBSUunfMlOtT5D0gA=
X-Google-Smtp-Source: AGHT+IFa1lCmf93SIjjWLr4QMBNGshpVNdTOoZk81LOSK8FUfuY3igGAEIXdQX2Sl0YLblLw5xm4pbRe4oUujk7VXSY=
X-Received: by 2002:a05:6902:1890:b0:d4b:6a0:fe2b with SMTP id
 cj16-20020a056902189000b00d4b06a0fe2bmr3171716ybb.36.1692357019061; Fri, 18
 Aug 2023 04:10:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230816140623.452869-2-przemyslaw.kitszel@intel.com>
 <202308170000.YqabIR9D-lkp@intel.com> <cfc29063-9e20-5101-d70b-62b5423d2d10@intel.com>
In-Reply-To: <cfc29063-9e20-5101-d70b-62b5423d2d10@intel.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 18 Aug 2023 13:10:07 +0200
Message-ID: <CANiq72m9ZEVkP76FMFOnPYkA8ih4Mq72HtW9AbrJ-JPy9ku3jw@mail.gmail.com>
Subject: Re: [PATCH net-next v3 1/7] overflow: add DEFINE_FLEX() for on-stack allocs
To: Przemek Kitszel <przemyslaw.kitszel@intel.com>, kernel test robot <lkp@intel.com>, 
	Yujie Liu <yujie.liu@intel.com>, Philip Li <philip.li@intel.com>, 
	Greg KH <gregkh@linuxfoundation.org>
Cc: rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, Jacob Keller <jacob.e.keller@intel.com>, 
	intel-wired-lan@lists.osuosl.org, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, linux-hardening@vger.kernel.org, 
	Kees Cook <keescook@chromium.org>, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 18, 2023 at 12:38=E2=80=AFPM Przemek Kitszel
<przemyslaw.kitszel@intel.com> wrote:
>
> Rust folks, could you please tell me if this is something I should fix,
> or I just uncovered some existing bug in "unstable" thing?
>
> Perhaps it is worth to mention, diff of v3 vs v2 is:
> move dummy implementation of __has_builtin() macro to the top of
> compiler_types.h, just before `#ifndef ASSEMBLY`

Nothing you need to worry about, it is an issue with old `bindgen` and
LLVM >=3D 16, fixed in commit 08ab786556ff ("rust: bindgen: upgrade to
0.65.1") which is in `rust-next` at the moment. Sorry about that, and
thanks for pinging us!

LKP / Yujie / Philip: since we got a few reports on this, would it be
possible to avoid LLVM >=3D 16 for Rust-enabled builds for any branch
that does not include the new `bindgen` or at least 08ab786556ff? Or,
if Greg is OK with that, I guess we could also backport the upgrade,
but perhaps it is a bit too much for stable?

Cheers,
Miguel
