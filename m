Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2B21F189;
	Mon, 12 Jun 2023 17:50:32 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-97ea801b0d0so49767466b.1;
        Mon, 12 Jun 2023 10:50:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686592231; x=1689184231;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wvyyw0RH8M6wqUGKw3iOenKs+/MxXTFepExt8iHfBqM=;
        b=S2Q0XjYJfFcDNMWcP69ytzhss0CIy6DtjuROLgUAS7pKaD7B2JMGjyy/+fO2KMFstf
         W/CKXVTB4Z5Lw7fZyc9/TB5IjkS8KUxt5WhHAo5g32v4UsFnme8q4wo4BuSID3KKWlaX
         XGNnpODdGvkY4ZcntLrKvKjqhrNoTSaqsU5SAXuQ5xcnFRlwFA4MMpeglYDqBnZ8Ht/P
         ea/i2CUkyTcQusAPj5MCdekcDp666YOp+kd0s6XVQW/mHYwdptVjcPi7IeoNbUOI9sPH
         c59yVHQ9QEdTNoGN6LsDTUhEeIKUFTNe/sIhdIvZaOvHe/StqJosuxy1cKK3p0pG4h1b
         PAww==
X-Gm-Message-State: AC+VfDw3rdgbWUVoCTQM5dO5UqeE2rO3d2gRn4yINWe0xgRyHZbzo8yu
	eVrYdt7M3sSyWRRrC1dkvUS4MonknwH/wAZg6dQ=
X-Google-Smtp-Source: ACHHUZ48EwYeJ/hSMZnwj4sh7Sw3R37wzvPOsSt8Oh7LDPDCuTIxgM51IrMmr4+YgLo/RDdy9XTvKwb38fBxVT1NRiM=
X-Received: by 2002:a17:906:7a03:b0:977:cbc4:5d8 with SMTP id
 d3-20020a1709067a0300b00977cbc405d8mr8767410ejo.4.1686592230594; Mon, 12 Jun
 2023 10:50:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230606140000.385223-1-rui.zhang@intel.com> <202306062334.5Z1NkD1F-lkp@intel.com>
 <62b7e97ede85927cd523578be0b702723043d92b.camel@intel.com>
In-Reply-To: <62b7e97ede85927cd523578be0b702723043d92b.camel@intel.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 12 Jun 2023 19:50:19 +0200
Message-ID: <CAJZ5v0higwL64NP4tFfOwVog1daSBsUTdh+M5ocZqDi14cYVDQ@mail.gmail.com>
Subject: Re: [PATCH] powercap: intel_rapl: Fix CONFIG_IOSF_MBI dependency
To: "Zhang, Rui" <rui.zhang@intel.com>
Cc: "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, 
	"Wysocki, Rafael J" <rafael.j.wysocki@intel.com>, 
	"daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, lkp <lkp@intel.com>, 
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>, "arnd@arndb.de" <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 7, 2023 at 4:23=E2=80=AFAM Zhang, Rui <rui.zhang@intel.com> wro=
te:
>
> On Tue, 2023-06-06 at 23:45 +0800, kernel test robot wrote:
> > Hi Zhang,
> >
> > kernel test robot noticed the following build errors:
> >
> > [auto build test ERROR on rafael-pm/linux-next]
> > [also build test ERROR on next-20230606]
> > [cannot apply to linus/master v6.4-rc5]
> > [If your patch is applied to the wrong git tree, kindly drop us a
> > note.
> > And when submitting patch, we suggest to use '--base' as documented
> > in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> >
> > url:
> > https://github.com/intel-lab-lkp/linux/commits/Zhang-Rui/powercap-intel=
_rapl-Fix-CONFIG_IOSF_MBI-dependency/20230606-220222
>
> This is a false alarm from the robot.
> It applied Arnd' patch first and then applied this patch on top.
>
> I think we can ignore the lkp robot warnings for this thread.

OK

Applied as 6.5 material, thanks!
