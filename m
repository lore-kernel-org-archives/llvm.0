Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1D9A939;
	Tue, 14 Mar 2023 19:07:14 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id p16so11089424wmq.5;
        Tue, 14 Mar 2023 12:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678820832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DmMsS72DrhmKHSRbr2NFMNW5CLIkt+u/jgJhqvsUU+k=;
        b=ZKESy222bvgLEzuBCchTHrEsX6V83Zf1v22/U6gUrCbWClgbyvNGjwjldnKLh8W81m
         M9MQYp77Xjr6Qh7Sdxu5TbWbLmHuIgiW+NZby4h4TnR4wbfG1O+W7qCLGOnDUAL0c7TZ
         a4fl2WUDFSbqBl3Xr7V+AQF4E7qUde1WY9NvZ5bNQLd9Z4rgt9zVFGfp8AqH90JpygtG
         Rcle2yv2NU/sWKVvMxFuaEqtCApXWuGfOyEuczVBOI4yuHLdUslasDo1LuBXrNO+emG/
         t+BJSOJwitbbIHx6Di63cJAYMX/aBqVpmSYVTRkDEV5EoOPKtUE+fF57SxFIQUQ9dP27
         N7Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678820832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DmMsS72DrhmKHSRbr2NFMNW5CLIkt+u/jgJhqvsUU+k=;
        b=4kLXNI/+MJd3l9IEt2WpH5yrDFd96OrbtOfTaKYsz46a+HX9mUA33U2E2GURpXXRo2
         1SkUvtL68JD8MtmFIUAtY+BbOvaVdf/+FdSVhvMEfj+DbrAMq4U6qbY0DbgTA8rNU2V5
         scnHw3wHEtTbk245CtmLr0bN27W5XKhDEC0hDhek0AU8flaA3Glt+dIIBbuZcgqG823C
         yKh4oOAVAzz9KgC6y07i1uQzq+veh66Fed3KpcvIAgLobWdblFHm1SgaLr+CZex4gIZS
         oa59hlLhpp+rTItxrefA2577z9yNsc3UoPcLBimgTvaCYuNwuBIpwP+50qY43mbpV9c8
         /xrw==
X-Gm-Message-State: AO0yUKVpLVo8C879/DAE4TsIyBYmkn0FgJJ16BZ2qGQpCPKyAA9PDLjA
	N/D5564MmPKB9pxP9rHZJJ0=
X-Google-Smtp-Source: AK7set8v+ja22gvJX3YpINvF+53LIkLKWQPeXL/mCNvDScclBCyrySvPPEjBZ7ejUE6QeaVYS6lxGA==
X-Received: by 2002:a05:600c:5028:b0:3eb:a4e:a2b2 with SMTP id n40-20020a05600c502800b003eb0a4ea2b2mr15172610wmr.4.1678820832262;
        Tue, 14 Mar 2023 12:07:12 -0700 (PDT)
Received: from suse.localnet (host-79-35-102-94.retail.telecomitalia.it. [79.35.102.94])
        by smtp.gmail.com with ESMTPSA id v18-20020a1cf712000000b003e91b9a92c9sm3522646wmh.24.2023.03.14.12.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 12:07:11 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Khadija Kamran <kamrankhadijadj@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
 Alison Schofield <alison.schofield@intel.com>, outreachy@lists.linux.dev,
 llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: axis-fifo: initialize timeouts in probe only
Date: Tue, 14 Mar 2023 20:07:07 +0100
Message-ID: <2510576.EEEGcR9oU2@suse>
In-Reply-To: <ZBCPMVFvjodeUbGF@aschofie-mobl2>
References:
 <ZA9mThZ7NyRrQAMX@khadija-virtual-machine>
 <20230314144207.GA4106922@dev-arch.thelio-3990X>
 <ZBCPMVFvjodeUbGF@aschofie-mobl2>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On marted=EC 14 marzo 2023 16:13:53 CET Alison Schofield wrote:
> On Tue, Mar 14, 2023 at 07:42:07AM -0700, Nathan Chancellor wrote:
> > Hi Khadija,
> >=20
> > On Tue, Mar 14, 2023 at 07:08:31PM +0500, Khadija Kamran wrote:
> > > On Tue, Mar 14, 2023 at 11:45:51AM +0800, kernel test robot wrote:
> > > >
> > > > [...]
> > >=20
> > > Hi everyone!
> > > Kindly let me know if I should look into these warnings.
> > > Thank you!
> >=20
> > You should always avoid introducing new warnings whenever possible. In
> > this case, it appears that read_timeout and write_timeout should be
> > changed from 'int' to 'long' to account for the fact that
> > MAX_SCHEDULE_TIMEOUT is being assigned to it directly now, versus being
> > passed as a parameter to wait_event_interruptible_timeout(), which
> > assigned it to 'long' anyways.
> >=20
> > If you have any other questions or need further help, let me know :)
> >=20
> > Cheers,
> > Nathan
>=20
> Hi Khadija,
>=20
> Echoing Nathan's feedback - yes, you need to correct these.
>=20
> Do you see these warnings when you compiled?  If yes, then your path to
> fixing them is easier. Make sure it recompiles with no warnings.
>=20
> If you don't see these warnings, then you need to follow the steps to
> reproduce in the lkp email. You have to be able to 'see the warning'
> make a change and 'see it go away'.
>=20
> Alison
>=20

Hi Khadija,

I would suggest trying to recompile using "make W=3D1 -j...". Not sure if y=
ou'll=20
see the warnings (depends on your compiler, version and target architecture=
).=20
However, it's worth a try as it may save you the time it takes to go throug=
h=20
the steps for reproduction.

Anyway, as Nathan said, that warning is triggered by assigning 'long' to 'i=
nt'=20
(i.e., "MAX_SCHEDULE_TIMEOUT" is cast to 'long', while the types of=20
"read_timeout" and "write_timeout " are both 'int'). Obviously, these kinds=
 of =20
assignments overflow wherever the representation of type 'long' uses more b=
its=20
than the type 'int'.

That implies that you should try to understand where the module's parameter=
s=20
are defined and how to work with the related macros.

I hope it helps.

=46abio

P.S.: If you don't know yet what to do, take a look at the following docume=
nt:
https://sysprog21.github.io/lkmpg/ (The Linux Kernel Module Programming=20
Guide).
  =20



