Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0391B3D74
	for <llvm@lists.linux.dev>; Tue, 28 Mar 2023 16:37:54 +0000 (UTC)
Received: by mail-ua1-f50.google.com with SMTP id i22so9305320uat.8
        for <llvm@lists.linux.dev>; Tue, 28 Mar 2023 09:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680021474;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sAgqfmy3+Sdexvx3MtTk8w4OkaEeTrCc0NuiY1qiHGo=;
        b=aV1GpKIOxu9YUFKPITfmnlrbtURER60HjoFgLTP2d/dB+QwSLaf6KHXNKkOe1QgYJ/
         PHr15fkkmSOGDcSOK9useKgPkkzomFv1UXp95rWNhExc2EGkzLn2HDlK4jgXhV8jlMy2
         f3wWaZVGMMjgXBZy7Hpx9E3xt08/IttYYa6Q3ORrQrodgQ09N0Jmt0mQA2q4hs9MF9hO
         PpiwqD6r7C1eqoLCvtnXTYQBuwz6Qmyaf6hVb+BFBdmvrzo03cfhoE49B/fFrdgRNX3N
         zx/RRVARXJUnQKHQ0AIlibO5UbGhPJ1rPYgGLyyH6gLZ/61TSJ+2mEZguyIw9WRPkGk2
         Xn0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680021474;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sAgqfmy3+Sdexvx3MtTk8w4OkaEeTrCc0NuiY1qiHGo=;
        b=M1USlhE4Ar0EDcY0QT2PkbcziWAkwhTPn82cmjr6QiCus34K17P1XZltzHq8QTtGsI
         nC6j+jF1nKa2zGBrLpLeykVpjV2lQBiZ39cvUcbrDEEqD7Biim03TKn/iFAQoORgsrZs
         9sdk/u6tvnZXBdcVMc6t4C+fPesKZOD63dmm84KxI5iSfDJa3zWZYTkp45NPhhTGNwDu
         QCe0zttkNRbSlJKfbIX8S3vCb5mbYnV98UZNn2lgqqyMiPgK/x53dizyV93+Wp53EJEz
         ifFpFNV2KJpjiHupco9j/4LLBvFjI/w3v6XYAniyQdmyEZXkPHAShGuJSCURqDO//hrk
         QFiw==
X-Gm-Message-State: AAQBX9eucUuEq1zXs8N/Vt2UyqXgeXdgmSWvYFCwQ59Sy3d/D5h44sBr
	2rKRW673bCCZl8iBAUIcVd8ifsnsoamEcszj/JfwAw==
X-Google-Smtp-Source: AKy350Yt+tNqzzmeb5s50dpmAcB50sxxAS+/O4PEQZqs8OpCwgLX/yhM4sXU4TfO+/MEwUteGCYQjtBe3CxRNzqbMxg=
X-Received: by 2002:a05:6130:c91:b0:68a:a9d:13f5 with SMTP id
 ch17-20020a0561300c9100b0068a0a9d13f5mr11175613uab.1.1680021473774; Tue, 28
 Mar 2023 09:37:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202303281539.zzI4vpw1-lkp@intel.com> <20230328122138.GA1275@willie-the-truck>
 <d2de874e-d2e8-435e-a90e-a3aef763f2b3@app.fastmail.com> <86o7ocx51a.wl-maz@kernel.org>
In-Reply-To: <86o7ocx51a.wl-maz@kernel.org>
From: Zaid Al-Bassam <zalbassam@google.com>
Date: Tue, 28 Mar 2023 12:37:42 -0400
Message-ID: <CALBRaFmmTZSZ+pm-=QKh5x_Pp8iMX_zdF50-u9HPdweq24jmzQ@mail.gmail.com>
Subject: Re: [linux-next:master 6577/7309] drivers/perf/arm_pmuv3.c:44:2:
 error: use of undeclared identifier 'PERF_MAP_ALL_UNSUPPORTED'
To: Marc Zyngier <maz@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Will Deacon <will@kernel.org>, kernel test robot <lkp@intel.com>, 
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you Marc.

Arnd, Do you want to change your patch to drop [1], or should I create
a new patch? Btw, Thank you for the patch.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/commit/?=
id=3D3b16f6268e66

Zaid

On Tue, Mar 28, 2023 at 11:35=E2=80=AFAM Marc Zyngier <maz@kernel.org> wrot=
e:
>
> On Tue, 28 Mar 2023 16:29:07 +0100,
> "Arnd Bergmann" <arnd@arndb.de> wrote:
> >
> > On Tue, Mar 28, 2023, at 14:21, Will Deacon wrote:
> > > On Tue, Mar 28, 2023 at 04:01:49PM +0800, kernel test robot wrote:
> >
> > > I think the Kconfig warning is relevant here:
> > >
> > >> Kconfig warnings: (for reference only)
> > >>    WARNING: unmet direct dependencies detected for ARM_PMUV3
> > >>    Depends on [n]: PERF_EVENTS [=3Dy] && HW_PERF_EVENTS [=3Dn] && (A=
RM [=3Dy] && CPU_V7 [=3Dy] || ARM64)
> > >>    Selected by [y]:
> > >>    - ARCH_VIRT [=3Dy] && ARCH_MULTI_V7 [=3Dy] && PERF_EVENTS [=3Dy]
> > >
> > > Since we're selecting an option which has its own dependencies. I thi=
nk
> > > the easiest bet is to invert the linkage so that PMUV3 has a dependen=
cy
> > > on ARCH_VIRT for 32-bit Arm (diff below).
> > >
> > > Marc, Zaid -- what do you think?
> >
> > I think dropping the 'select' is best, as this is still a user-visible
> > option. How about this instead:
> >
> > --- a/drivers/perf/Kconfig
> > +++ b/drivers/perf/Kconfig
> > @@ -103,7 +103,7 @@ config ARM_SMMU_V3_PMU
> >  config ARM_PMUV3
> >         depends on HW_PERF_EVENTS && ((ARM && CPU_V7) || ARM64)
> >         bool "ARM PMUv3 support" if !ARM64
> > -       default ARM64
> > +       default ARM64 || ARCH_VIRT
> >           help
> >           Say y if you want to use the ARM performance monitor unit (PM=
U)
> >           version 3. The PMUv3 is the CPU performance monitors on ARMv8
> >
> > This way, it's still enabled by default for most people, but
> > there is no dependency problem and it's also possible to
> > turn it off.
>
> [removing my old self from the Cc list]
>
> Either way work for me. Or even drop that patch altogether and let
> people select PMUv3 if they really want it. This is extremely niche
> anyway, and most people won't care.
>
> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.
