Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4907F
	for <llvm@lists.linux.dev>; Mon,  1 Aug 2022 17:40:46 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id z22so14708422edd.6
        for <llvm@lists.linux.dev>; Mon, 01 Aug 2022 10:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vbpx09H/4ML4u2iqIVxYYiqngYD2A2VgzUmI+xUdR/g=;
        b=dGQn9HnPGK3V1zgMzL54wYJj48O6+9iWDlARc+RljqL77xZfEerkvBhksT+ve5EwpC
         M2uXbCMlaH2tZeawaZGAUY5wipiuA1s4tSZN8fbovQSH26yXFtaOn/PRxBu+n2J1G7Ps
         MO6Mw94atIhopWJpxYxghaE4v4V9IPXuXAH8HKNyjt7JbkNPNvyczcLycm9hcfP9ifff
         birOVIjltPVIXgLvWMliruGleakB5H7NGTStUH7QiSQygpVazbKSlBboi4CAiE+aoxiV
         GqI+jGedwMaZ0Q6Ou1GTe0oQop7PbOCj08AAcECuv/6IINrAMTRJ5qOivzI4ViLgQgCr
         Xicw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vbpx09H/4ML4u2iqIVxYYiqngYD2A2VgzUmI+xUdR/g=;
        b=IPmgm0naiIBYWBoUfpa4kBUO8uFIxCwfQY4WGcbwCFcZMJ/wLiWJd7bT60SOb7K+IN
         YyH1+7avgCEvAzdUqXCOT7wESR1Xa3M94tbAogHDQ3u+TDUg+XIXf9S6i0GQ1j18YH7k
         9qS0lvJvZwOhHmRp0NEVnsYOOpE6t7NnckKyw6WZn2Lla3WRDpzQT2ewxDX3PGkIpONL
         L3xq4FQs5ffd/l7+mnZSOkoTpGOghYKGJY0Ku3R6cgo7ymnPSiA88zk5basWbfwQvaNZ
         GxgKuAMCA6E80s7+L9ZphB2JL48+KWjeIXj7xsJ40PbT20CopO1IIhMu26HtZcUTsbsr
         pkVw==
X-Gm-Message-State: AJIora8ua2Hb671IAoKrqplESZceRpGuVijsUHFJnAT0JmZl7v2H4zd7
	gjiSB26HdgQbdlHuHd3h6SmPyLJm2gbzT6o2lJl6zA==
X-Google-Smtp-Source: AGRyM1tYs0gst0wzWllfhFmh/2YO6+2mD2drm8ixQ18bj+AqwYkkzGMnkkIZ+8d2QbxsaFh7RG2BPbFDTKBCvU+EAcU=
X-Received: by 2002:a05:6402:540c:b0:434:d965:f8a with SMTP id
 ev12-20020a056402540c00b00434d9650f8amr17246024edb.30.1659375644623; Mon, 01
 Aug 2022 10:40:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220720232332.2720091-1-justinstitt@google.com>
 <CAKwvOdnSjyOdCZZ9AegCyfns3bvH3fbtbVgdThO2+rJAE=1bag@mail.gmail.com>
 <YtlsY2A2ZWK97Y8O@dev-arch.thelio-3990X> <CAK7LNASi_yrPhf0wv+0nqRcNhhbwUn-PzHvuiV2W1EsTqd_D8Q@mail.gmail.com>
In-Reply-To: <CAK7LNASi_yrPhf0wv+0nqRcNhhbwUn-PzHvuiV2W1EsTqd_D8Q@mail.gmail.com>
From: Justin Stitt <justinstitt@google.com>
Date: Mon, 1 Aug 2022 10:40:29 -0700
Message-ID: <CAFhGd8r1_A67aVt_5tMz-1NC51JrCFG=8cDsmTMz1kOricWEOA@mail.gmail.com>
Subject: Re: [PATCH] Makefile.extrawarn: re-enable -Wformat for clang
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Tom Rix <trix@redhat.com>, Michal Marek <michal.lkml@markovi.net>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

> OK, I think that will be good timing.
> Please ping me if I forget to pick it up.
>
Hey Masahiro, just pinging to see the state of this PR.

I think we are on pace to re-enable this warning.

I believe there exists only _two_ patches left still needing to go
through along with this patch:
1) https://lore.kernel.org/all/20220718050356.227647-1-hch@lst.de/
2) https://lore.kernel.org/all/YtnDltqEVeJQQkbW@dev-arch.thelio-3990X/
> Best Regards
> Masahiro Yamada

-Justin
