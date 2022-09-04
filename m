Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE82D7E
	for <llvm@lists.linux.dev>; Sun,  4 Sep 2022 02:14:13 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id k18so5937247lji.13
        for <llvm@lists.linux.dev>; Sat, 03 Sep 2022 19:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=IPv+2mXSogYhFtWuHySncEPNLNjPGYsVvoHKYcIxAHc=;
        b=BEVyo56zoyPKQNgv8WYaKAsOegBeut+5tSDxfNXF7rz/5dsRwra4M82vI6K5R8+0KY
         yRD0Lc46YNy9BTFOKsEoTV8qF7+TjyuxqzoRMm8pySOGQ7+TxkRldxytDTGZUIqKpjhS
         AG2Xl1kRF1Pmdjcp9d5uDqbXja+3ZPjT+2cGRBDfhVkscCMH6SeNgbySB8iqQx87qDZR
         hZnjNbBZBGuMTzcS/j1USCOd/su3dTZX8FYSBqU7MG3wGJtuQ7GegfswJnE4ojRbPJcQ
         dxIt2NpxyPpSOqTCBEyIfpjytJtmfN0DTO4lJoBafcstMkv9ft2Bsk1pRk/j+4gDXxvL
         5Ijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=IPv+2mXSogYhFtWuHySncEPNLNjPGYsVvoHKYcIxAHc=;
        b=8E1mAVXy0imbRQP8OBaP0Kbpp/F+ozCcwAxXRoo0Nk64s9jfJmhijRk23T/1ZXioMk
         TjIrDr2FKUj3/tdiWburpuIHB351gX6Y7j7/Weanv+QuNpmgP4+V2HHRBn3GHvEkjy+i
         PuD8yWkmSMLpPBBuKrFm27o9jCoAAM81Cv4lWe+YFC7L/sK3hlcKXGpQe2xu9IMRx/We
         4Ymo+ehFpmWC/9Gt2XeV6lhDquIuzV6qRpRBb8i2OTMXsr39jIH8qsIIC0ofaTqY5dXX
         DNZkpagsuu31Bxhgafe+GuHmUov9dCLSGtA5GZRIRodP/ydOnYeBnsiPFI4UY7DUuO9V
         9/9w==
X-Gm-Message-State: ACgBeo1fK9xtEIKyKqiUHK7/I+cG/z/1FRbQHk1Kk0h3ZON1EWi08th5
	BV3ozYSw1vLIRj63FYW8pR2Yh0aYnDdQoQkzN+2/
X-Google-Smtp-Source: AA6agR4u/k8EvuNBzHpBBRcRFWG38b16KLKqnk7kvtQaavvbHhNttthfn+jnLNgHSSVTyhCIKGngPs5GWlrimGTnM+Q=
X-Received: by 2002:a2e:b604:0:b0:268:e96:233b with SMTP id
 r4-20020a2eb604000000b002680e96233bmr6600786ljn.471.1662257651496; Sat, 03
 Sep 2022 19:14:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220902213750.1124421-1-morbo@google.com> <20220902213750.1124421-2-morbo@google.com>
 <YxLX5i0aUoe9zBsx@nazgul.tnic>
In-Reply-To: <YxLX5i0aUoe9zBsx@nazgul.tnic>
From: Bill Wendling <morbo@google.com>
Date: Sat, 3 Sep 2022 19:13:59 -0700
Message-ID: <CAGG=3QUMmB8chdGT9Jhz2RQXyP7Gg0=bSwk=apu8Gv6vTiM5fg@mail.gmail.com>
Subject: Re: [PATCH 1/2] x86/paravirt: clean up typos and grammaros
To: Borislav Petkov <bp@alien8.de>
Cc: Juergen Gross <jgross@suse.com>, "Srivatsa S. Bhat (VMware)" <srivatsa@csail.mit.edu>, 
	Alexey Makhalov <amakhalov@vmware.com>, VMware PV-Drivers Reviewers <pv-drivers@vmware.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, 
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, 
	virtualization@lists.linux-foundation.org, 
	LKML <linux-kernel@vger.kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 2, 2022 at 9:28 PM Borislav Petkov <bp@alien8.de> wrote:
>
> On Fri, Sep 02, 2022 at 09:37:49PM +0000, Bill Wendling wrote:
> > Drive-by clean up of the comment.
> >
> > [ Impact: cleanup]
>
> We used to do that type of "impact" tagging years ago but we stopped.
> Where did you dig this out from?
>
> :)
>
It was in a comment from that file. :-)

-bw
