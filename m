Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DBA187C
	for <llvm@lists.linux.dev>; Wed, 16 Feb 2022 15:07:57 +0000 (UTC)
Received: by mail-il1-f177.google.com with SMTP id k18so1611623ils.11
        for <llvm@lists.linux.dev>; Wed, 16 Feb 2022 07:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bLlHTPf7eon4BbIAezWnNI6iX8qt53HUKJyH0lHJ1kE=;
        b=FxftwHhVSJtn4s/UQgc74G86BO3nMi1IjDBzf5aiykwhXfuYMQRDh0qTFi2WGmloAd
         QYzv5E+G0BIW6ouvOWqhvCFaBZ1bZIVxRwwHa19bD39hNy4x9oc7GjQoxBqJHraVNf7e
         qBEroHtGFtMV+sOO7QIzO7gbL+P05VOytvsM90yBk2751anQqUhybQGu/lbzKrqHaiGT
         85n2w2fZmSP6Ttr8n8QAonEo2kQerVujdGjKNnWrq2gHg7uSSiFy63pwcd58z1LCEREh
         DcP897A375D2yO+9pts5uccocLMrEhz+dby9y+xRNew/qZ/YtGWdg6gwsoUBNroc5MBd
         +3RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bLlHTPf7eon4BbIAezWnNI6iX8qt53HUKJyH0lHJ1kE=;
        b=Xsj1l5ve0pQ+O6N9witXaPnjjSVrxvCvSUhCj3KoioP83Z83W4kp2p+mHLhoEDcsw3
         Vtm8T282068RIMSD1ngaYy4OCEpQ6ZoXfLYa5voYIlUZD+zXXDSPcdKXDXf33qKUx95g
         9PfJVwfkTzIoDU5tFRysk6MONgec0a6dR6x71LE7i/ORT2322rLp8+BJURO4P17ikUY5
         R/YwmdRUFi7SjNui8eHycj6f1gbPYyJmtE/VGzxnKDW1OB+k80DI14dMKmNKWn6phmXi
         JgFQvhykhKuaqPXi7zxZvEHOyGXhhwdle+VtIuN265Gt8uzrLhAGfdFrp5+nWy607zDs
         ph8w==
X-Gm-Message-State: AOAM532L+SPIPuHYO5iaNT+V3c7SLd8MKSNThtCmmG7/KvFLZi23OEKE
	e1d9ho4eP0nXRAP5edJzXEIk/Ci85rpzzyick/8=
X-Google-Smtp-Source: ABdhPJwRp/cm8AHG+LOwLkypP9TU/FUwriNxWg6yltkkZWO+mL0KK86q/TUEgAlFJp7c9ZsxM7VD6m2amC8NH+0/Zvc=
X-Received: by 2002:a05:6e02:1985:b0:2be:1909:ede5 with SMTP id
 g5-20020a056e02198500b002be1909ede5mr2015977ilf.151.1645024077110; Wed, 16
 Feb 2022 07:07:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220215204947.1719516-1-ndesaulniers@google.com>
In-Reply-To: <20220215204947.1719516-1-ndesaulniers@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 16 Feb 2022 16:07:45 +0100
Message-ID: <CANiq72kKRFy6jm6L46Tvx11Jo+zwA8NO7f2Bcb17a5jV7BXUTg@mail.gmail.com>
Subject: Re: [PATCH] Documentation/llvm: refresh docs for LLVM=1
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Andrew Morton <akpm@linux-foundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Yujie Liu <yujie.liu@intel.com>, Philip Li <philip.li@intel.com>, julie.du@intel.com, 
	Nathan Chancellor <nathan@kernel.org>, Michal Marek <michal.lkml@markovi.net>, llvm@lists.linux.dev, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	Linux Doc Mailing List <linux-doc@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Nick,

Thanks for sending this so quickly, no warnings from a quick test:

    Tested-by: Miguel Ojeda <ojeda@kernel.org>

A couple of nits below in case you do a v2.

On Tue, Feb 15, 2022 at 9:49 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> * Word wrap a few columns over 80 lines.

Top to bottom writing? :P

> +For example: ::

This may be simplified to:

    For example::

Similar applies elsewhere where a colon + :: marker is wanted. Not
sure what the preferred style is, since the file uses both.

Cheers,
Miguel
