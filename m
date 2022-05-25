Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36F9802
	for <llvm@lists.linux.dev>; Wed, 25 May 2022 01:16:20 +0000 (UTC)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-e93bbb54f9so24329836fac.12
        for <llvm@lists.linux.dev>; Tue, 24 May 2022 18:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bCkYMI0MPX1g+9HqaT/chD8cfD8Weo7NM7d9+kp9f3A=;
        b=NgkyyPbyKA8GEMlAbG7O365122h4GqFnUYz/Ga1zYhZCJZ+nPH8jDMcd9pFEtBc3iU
         rP9oEZJUZzK7AmRZZNLMV2tG1qJ+i+LvvnnYn9p/7VhUAJzHisD56VS0dkKwD7J1Ah1K
         pMogJAHIbnBTTmvHAeFQ3RPT15uv4Fvx3j9P0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bCkYMI0MPX1g+9HqaT/chD8cfD8Weo7NM7d9+kp9f3A=;
        b=QC6zj+iUsttoCUMEgqtLWqcQIjpRQsg79Ctm3SGyPDgcA27HcMTiEji9wyux5xJIp7
         NhSpTXE9ugXpnAV9m9EPbkSjG+ohC6aBHt4RFwkuSrX7VGr94BstH29JC3da8Fd2LRCm
         TFBqBxHwNrE7vWoEs7NTBqHXoFZJk2Qi/53xuVSkJk+kPF4IyelpMn0DIEZjyKjSeq0U
         WjiOYBZWtzY69rhlN32ZXtun47HXBEQiQJcQ6pZ5LatmOdB319K6H/pB33bP5J1LWmEX
         sLXk43MSSjmLotHzHhdX+HeFkPefD4lUYUuYKl71tCzZcKmOyc4NJakZRiO8Lr34CdkY
         harA==
X-Gm-Message-State: AOAM533/Jj9tr0T1fSgg9ZoMfv3epUJv108E77f390I9zQfCSG5YaXJ/
	PTAnIYY1L2eet7Jxlav6X0PmbB5vfHlbsg==
X-Google-Smtp-Source: ABdhPJwYitegz3ncAFxFsZy+clvFPNaRqV8fM/CzNcvpzBcgBtdWrIUUuwiaAZURO5BebvvKBhiu2g==
X-Received: by 2002:a05:6870:6589:b0:f1:a98f:4056 with SMTP id fp9-20020a056870658900b000f1a98f4056mr4246992oab.238.1653441379473;
        Tue, 24 May 2022 18:16:19 -0700 (PDT)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com. [209.85.160.44])
        by smtp.gmail.com with ESMTPSA id w76-20020aca304f000000b0032617532120sm5715393oiw.48.2022.05.24.18.16.18
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 May 2022 18:16:18 -0700 (PDT)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-f1d5464c48so24381743fac.6
        for <llvm@lists.linux.dev>; Tue, 24 May 2022 18:16:18 -0700 (PDT)
X-Received: by 2002:a05:6870:f71d:b0:f2:a4c5:191a with SMTP id
 ej29-20020a056870f71d00b000f2a4c5191amr2700108oab.257.1653441377580; Tue, 24
 May 2022 18:16:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CGME20220524114954epcas1p416e486dce031a941263b13120e717d72@epcas1p4.samsung.com>
 <202205241931.GbIyyVs2-lkp@intel.com> <18b1bfe6-d844-d2c2-fc5e-40248aaf72be@samsung.com>
In-Reply-To: <18b1bfe6-d844-d2c2-fc5e-40248aaf72be@samsung.com>
From: Brian Norris <briannorris@chromium.org>
Date: Tue, 24 May 2022 18:16:00 -0700
X-Gmail-Original-Message-ID: <CA+ASDXNQ=ycB9v=FpNup2SM2Qd+W32M5c7vsh=jXG0qB_d_35w@mail.gmail.com>
Message-ID: <CA+ASDXNQ=ycB9v=FpNup2SM2Qd+W32M5c7vsh=jXG0qB_d_35w@mail.gmail.com>
Subject: Re: [linux-next:master 9269/14079] ld.lld: error: undefined symbol: rockchip_pmu_block
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, kbuild-all@lists.01.org, 
	Linux Memory Management List <linux-mm@kvack.org>, Douglas Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi Chanwoo,

On Tue, May 24, 2022 at 6:04 PM Chanwoo Choi <cw00.choi@samsung.com> wrote:
> How can fix this build issue?
> Should I add the ARCH_ROCKCHIP dependency to rk3399_dmc.c?

No. As noted below by the robot, the issue is already fixed in -next.
I noted as much already on the earlier reports:
https://lore.kernel.org/all/CA+ASDXO1JDKf-vBB0gWdYKD9vMMoMXYRL2E42HJtnbOvMP7jPA@mail.gmail.com/

Unfortunately, the two changes were picked up to different trees at
different times, so it's not bisectable. (It's not that severe IMO,
since the build failure can only occur for COMPILE_TEST=y.)

> On 5/24/22 8:49 PM, kernel test robot wrote:
> > Note: the linux-next/master HEAD 09ce5091ff971cdbfd67ad84dc561ea27f10d67a builds fine.
> >       It may have been fixed somewhere.

Brian
