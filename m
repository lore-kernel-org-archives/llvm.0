Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359BA4A9AE
	for <llvm@lists.linux.dev>; Mon, 11 Dec 2023 15:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ApsITJ1i"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-6d9d0d0e083so3620004a34.2
        for <llvm@lists.linux.dev>; Mon, 11 Dec 2023 07:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702307889; x=1702912689; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wvXAIFU3cHSe8gZFgZZL313yZ6BsbgxanKxV0o2G4D8=;
        b=ApsITJ1iEnL6xG401bX1nixYhapQDf6Kg6JLH0NlF4Z0LYm/VbTxt56Sr42aeCjsUj
         EFkh0vLrArnQEiChcViQPLQiQsB7Q8nHJ5lnGHOkzVoobu3pgUtfDnI7K/O5Tqn/+7KM
         LVGZ6oJKKO3O8rXuxmUsTRwzU9gxEI++Kn8Ihk84U/Sh5Igo9ox+4LFX62PTCxw9CDaA
         gysOFtx3knVYt15COGTkDPoCjcWLFpJQb2jGpjM4epb2cYrJRcO0tBh0Uqp1yUWfRLWF
         6/qqWCyVOk0kt84lDPdESeAr5itjzWZ+xf+zkYc3rcZVF5JFZmQtlS9Wa2KgI17ndmhV
         d7mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702307889; x=1702912689;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wvXAIFU3cHSe8gZFgZZL313yZ6BsbgxanKxV0o2G4D8=;
        b=o4xKRWqhOd5Ggv4i+t8A1tMzAgVo6vmXVkRS5p8ySQKgqnZ8TGzeu/XvlGZ9wd2WUh
         Zzhe01WTKqzozxDEoWdJ8uD6Lcu4DOIEed1mWLAwKrinh/D8uDnLJYupvZ5ak5DlVz9Y
         axh7zczZvWW5TNq+kOlI5byIynBhpVjk0t38kIYdwGOg0Oje9qFJwjYXMD9E4+ctR12l
         YasW1dfzVGCXq+rMyKzQx1HXkc1WqXHpzY+Eswfkg19HxceKDcWxm3mN+ONOjxiclE8F
         j8OU9Gdu5Ez3jCI3V8Nf4N8V6H04dkccRV2sYB77Su5hNNhR0Eug/bXbk6JP2B31y488
         vYNw==
X-Gm-Message-State: AOJu0Yxfbyu9CQ2srL5xcUi0Dw/xCUYPwyRvODCh16kPqfykfVYkvJXO
	rb/tXklVfn0GTkqh3Nh0RvDIVWNICqAXCK1VR3E=
X-Google-Smtp-Source: AGHT+IE6Pdq+QZOPZcT87hzEwOyfLxxsaDNBp8XrIaNN3aLL6Q2E3qAZa+aCTM/ghgMcR5Uq8on+1btr2EnnabaqbsI=
X-Received: by 2002:a05:6870:b154:b0:1fb:78d7:91b8 with SMTP id
 a20-20020a056870b15400b001fb78d791b8mr5975573oal.34.1702307889216; Mon, 11
 Dec 2023 07:18:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231122030621.3759313-1-samuel.holland@sifive.com>
 <20231122030621.3759313-4-samuel.holland@sifive.com> <20231123-headdress-mold-0dd7a74477f7@wendy>
 <20231130004224.GE2513828@dev-arch.thelio-3990X> <4f277982-fffb-4fe1-bc02-007633400f31@sifive.com>
 <5090a015-5b6f-44be-bb25-d2ca3fdf5d40@app.fastmail.com> <07d27191-12b6-4c84-b80e-75c618df9de4@sifive.com>
In-Reply-To: <07d27191-12b6-4c84-b80e-75c618df9de4@sifive.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 11 Dec 2023 10:17:57 -0500
Message-ID: <CADnq5_O+ozkwQAEn3K_=-pB2L0+pbc+tbPU0CEwOTa+QysogAg@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/amd/display: Support DRM_AMD_DC_FP on RISC-V
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, 
	"Conor.Dooley" <conor.dooley@microchip.com>, llvm@lists.linux.dev, 
	Leo Li <sunpeng.li@amd.com>, Pan Xinhui <Xinhui.Pan@amd.com>, 
	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, Palmer Dabbelt <palmer@dabbelt.com>, 
	amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, 
	linux-riscv@lists.infradead.org, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 10, 2023 at 5:10=E2=80=AFAM Samuel Holland
<samuel.holland@sifive.com> wrote:
>
> Hi Arnd,
>
> On 2023-12-09 2:38 PM, Arnd Bergmann wrote:
> > On Fri, Dec 8, 2023, at 06:04, Samuel Holland wrote:
> >> On 2023-11-29 6:42 PM, Nathan Chancellor wrote:
> >>> On Thu, Nov 23, 2023 at 02:23:01PM +0000, Conor Dooley wrote:
> >>>> On Tue, Nov 21, 2023 at 07:05:15PM -0800, Samuel Holland wrote:
> >>>>> RISC-V uses kernel_fpu_begin()/kernel_fpu_end() like several other
> >>>>> architectures. Enabling hardware FP requires overriding the ISA str=
ing
> >>>>> for the relevant compilation units.
> >>>>
> >>>> Ah yes, bringing the joy of frame-larger-than warnings to RISC-V:
> >>>> ../drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_v=
ba_32.c:58:13: warning: stack frame size (2416) exceeds limit (2048) in 'DI=
SPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalcula=
tion' [-Wframe-larger-than]
> >>>
> >>> :(
> >>>
> >>>> Nathan, have you given up on these being sorted out?
> >>>
> >>> Does your configuration have KASAN (I don't think RISC-V supports
> >>> KCSAN)? It is possible that dml/dcn32 needs something similar to comm=
it
> >>> 6740ec97bcdb ("drm/amd/display: Increase frame warning limit with KAS=
AN
> >>> or KCSAN in dml2")?
> >>>
> >>> I am not really interested in playing whack-a-mole with these warning=
s
> >>> like I have done in the past for the reasons I outlined here:
> >>>
> >>> https://lore.kernel.org/20231019205117.GA839902@dev-arch.thelio-3990X=
/
> >>
> >> I also see one of these with clang 17 even with KASAN disabled:
> >>
> >> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32=
.c:37:6:
> >> warning: stack frame size (2208) exceeds limit (2048) in 'dml32_recalc=
ulate'
> >> [-Wframe-larger-than]
> >> void dml32_recalculate(struct display_mode_lib *mode_lib)
> >>
> >>      ^
> >> 1532/2208 (69.38%) spills, 676/2208 (30.62%) variables
> >>
> >> So I'm in favor of just raising the limit for these files for clang, l=
ike you
> >> suggested in the linked thread.
> >
> > How about just adding a BUG_ON(IS_ENABLED(CONFIG_RISCV))
> > in that function? That should also avoid the build failure
> > but give a better indication of where the problem is
> > if someone actually runs into that function and triggers
> > a runtime stack overflow.
>
> Won't that break actual users of the driver, trading an unlikely but
> theoretically possible stack overflow for a guaranteed crash? The intent =
of this
> series is that I have one of these GPUs plugged in to a RISC-V board, and=
 I want
> to use it.

Does this patch address the issue?
https://gitlab.freedesktop.org/agd5f/linux/-/commit/72ada8603e36291ad91e4f4=
0f10ef742ef79bc4e

Alex
