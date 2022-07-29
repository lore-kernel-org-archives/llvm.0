Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2837F3D9C
	for <llvm@lists.linux.dev>; Fri, 29 Jul 2022 13:50:38 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-2ef5380669cso51634487b3.9
        for <llvm@lists.linux.dev>; Fri, 29 Jul 2022 06:50:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fc7yLt5IYorojKO3ICCa0CRVv9oy13vBhJXBMrvr6OM=;
        b=xt2eA8CggPeUEsxqbH5DdJ/Kuvpx1Kdl0fvtORu7RxExIJumI+j7Ew6Yyb2OVGEIMp
         3OgBclq8lC9pNBPi8x/LqBQD9jjz68HaFmCXoYBfshxCwCi+uTTNOxSeq3NjmBIVMK2y
         Y4JAFtMTB4eSKfFM2saUsM6ier4PcbDenlT5Wl1oJhAo0DEF0zr5eYorF5pc2qeb+8+n
         EgF3SevX0Azoc7PmdSHi16w3njofmHt5PKKIRTJKdPUL32bzwv8P+R0HmDlBQsjwV+Tk
         LA1V+SUgjVNqmJwZrHAInAleRDV/tVS/TwGKo76Xicnmc/gtHgl2Blt2H6x+ZLI/f18I
         Dlxw==
X-Gm-Message-State: ACgBeo1Q1ywDR9MW/ACbhpPp79pZKChlL40kbytC8+NLbtFls/RtmWiA
	+LXKl0Zq4elCUeqTVw8WTu3eoTGgWfChmJ1Svgw=
X-Google-Smtp-Source: AA6agR7N06JTGpJ4QLYk8Z03zUx9Fp/OjHDhdx95SiBZbwtm8248SKOxxs7Nw8cRMeKx3XT3PDI3yYivm1OLHs6L5QI=
X-Received: by 2002:a81:1145:0:b0:31f:61b7:fda6 with SMTP id
 66-20020a811145000000b0031f61b7fda6mr3099724ywr.45.1659102637070; Fri, 29 Jul
 2022 06:50:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220511160319.1045812-1-mailhol.vincent@wanadoo.fr>
 <20220723151521.51451-1-mailhol.vincent@wanadoo.fr> <CAMZ6Rq+KohWoRurA3cKog18D=NuXNj_k4+ZmPRiakZd7ZPS1OQ@mail.gmail.com>
 <YuPRDvELE+Sx5p2c@zn.tnic>
In-Reply-To: <YuPRDvELE+Sx5p2c@zn.tnic>
From: Vincent MAILHOL <mailhol.vincent@wanadoo.fr>
Date: Fri, 29 Jul 2022 22:50:25 +0900
Message-ID: <CAMZ6Rq+FXiJHRK5NC6nBj1uuu11rPpR8vVWNdY61ZiZeWHi=8Q@mail.gmail.com>
Subject: Re: [RESEND PATCH v4 0/2] x86/asm/bitops: optimize ff{s,z} functions
 for constant expressions
To: Borislav Petkov <bp@alien8.de>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, x86@kernel.org, Peter Zijlstra <peterz@infradead.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H . Peter Anvin" <hpa@zytor.com>, 
	Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, David Howells <dhowells@redhat.com>, Jan Beulich <JBeulich@suse.com>, 
	Christophe Jaillet <christophe.jaillet@wanadoo.fr>, Joe Perches <joe@perches.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri. 29 Jul. 2022 at 21:22, Borislav Petkov <bp@alien8.de> worte:
> On Fri, Jul 29, 2022 at 08:24:58PM +0900, Vincent MAILHOL wrote:
> > This patch series [1] has been waiting for more than two months
> > already. So far, I have not heard back from any of the x86 mainteners.
> > Do you see anything wrong with this series? If not, any chances to
> > have someone of you to pick it up?
>
> They're on my todo list but you have to be patient. If you haven't
> heard, we're still busy with this thing called retbleed.

Understood and thanks for the update!
If this is on your radar, then no more worries on my side. I wish you
courage and good luck for the retbleed fix!


Yours sincerely,
Vincent Mailhol
