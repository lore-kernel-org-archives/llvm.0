Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DBD29CA
	for <llvm@lists.linux.dev>; Mon, 24 Jan 2022 23:38:53 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id e9so1990340ljq.1
        for <llvm@lists.linux.dev>; Mon, 24 Jan 2022 15:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FIP6niwFiCcE5eTqnTDWmb/wrXropuAeXBH8bjmRfkM=;
        b=VrwRqbW7mgBywTPgKBmLBf5J1mchIOr7JqxAATJJaO2MOs9YuCVpjjVNXEzsBml+wp
         ado8O/B5hhh9+WaOXej80757SD6Mzhj0G7C9BhHFXNvvFWjgiuy15dPxWN9LkKSG3U+6
         gpE+me8Rw51avTJbIfG4JbHAU8GoEKfJyjejlkHSYuh6vLn6mpXNjFiANAPJrwEoxGwG
         4pZ3FS3eS7llLKrv/WOiSSLxAyUYewvLJ1UbGnehniTPMJrS/per8DLCYHyAVFn10Dcp
         0zR68towoUo99m4ogkP8Pl1ssg2Dnq6HhdFZ0vu0iKYz6Qr7WmpUyHrojf5yKD7d03V8
         fGqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FIP6niwFiCcE5eTqnTDWmb/wrXropuAeXBH8bjmRfkM=;
        b=Aa5zA9WXr9r4y+MAvgFq2raZ+CtMOdQsSwFePMLSlIRF60D9C+AGX0vKYFnG+FJxWN
         XlQdN34DdmlugPtRq9mHUjQHYMUK/jkGDPX69Ef72U5dY3RTFJ3pJUE8ouQyg7MTjgJx
         YAnbN2tUjwDqES5agaQo3f37MEQvIOiDxYIn4hGvW7GUIknb9vLPFRhG2uxgKeKHC+R1
         llqPrsSd7T56Q55UaqtBU6dyMkznj3r/+dJ8LviVP49EKkioFc67EaB0IY3OVRJ0E7S3
         df0qOzmfwz0+V3A+DvtrnxHD1W7G04GpmBl0dJAC8eVHTHA4a/603lt8MiMlq8ygsCtr
         RWvA==
X-Gm-Message-State: AOAM533MoMpaTmWVbUHlAlfEezBtf9s+7cD1uzfFSKc/5xc26OTQzofP
	gqucogIo48TMlWlwytXM/Z3/Oix56D/jxguY2V/dFg==
X-Google-Smtp-Source: ABdhPJxzHN2oG34NI+OLkIh9cUsniM7MENh8SCt8InminhPjzFucnqpWLiy0Rn4gHwCa+ALqvnw7k5IqoQt/rLjLGHg=
X-Received: by 2002:a2e:9654:: with SMTP id z20mr12950862ljh.526.1643067531477;
 Mon, 24 Jan 2022 15:38:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220114010526.1776605-1-ndesaulniers@google.com>
 <YeQei0xNzMq7bFdg@zn.tnic> <20220118192256.jzk5dnceeusq7x7u@treble>
 <20220118230120.pivvson7qekfiqic@treble> <CAKwvOdmLzwz=02ypt0_1324_5-7i3Az7HizFaDMqZv__-D99uA@mail.gmail.com>
In-Reply-To: <CAKwvOdmLzwz=02ypt0_1324_5-7i3Az7HizFaDMqZv__-D99uA@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 24 Jan 2022 15:38:38 -0800
Message-ID: <CAKwvOdm+pnKb2PU7H5W1ks8eFd3DPEtN5kzjhnz5TLLwpBLOsA@mail.gmail.com>
Subject: Re: [PATCH] objtool: prefer memory clobber & %= to volatile & __COUNTER__
To: Josh Poimboeuf <jpoimboe@redhat.com>, Borislav Petkov <bp@alien8.de>
Cc: Vasily Gorbik <gor@linux.ibm.com>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Ingo Molnar <mingo@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, 
	Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, x86@kernel.org, llvm@lists.linux.dev, 
	linux-sparse@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>, Nathan Chancellor <nathan@kernel.org>, linux-toolchains@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 24, 2022 at 3:26 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Tue, Jan 18, 2022 at 3:01 PM Josh Poimboeuf <jpoimboe@redhat.com> wrote:
> >
> > Apparently this patch isn't going to work after all :-(
> >
> >   https://lkml.kernel.org/r/202201190632.lhlaiCBk-lkp@intel.com
>
> I noticed in that report and
> https://lore.kernel.org/lkml/202201190702.XNSXrMTK-lkp@intel.com/
> that gcc-9 was used.  I wonder if %= has been fixed in gcc-10+? Have
> there been other reports with gcc-10+ for my patch?
>
> Boris' case of xfrm_output_resume is yet a third case; Boris, what
> version of gcc did you spot that with?
>
> If this is fixed in gcc-10, then we can probably add a comment with a
> FIXME link to the issue or commit to replace __COUNTER__ with %= one
> day.  If not, then we can probably come up with a reduced test case
> for the GCC devs to take a look at, then add the FIXME comment to
> kernel sources.


$ wget https://download.01.org/0day-ci/archive/20220119/202201190702.XNSXrMTK-lkp@intel.com/config
-O .config
$ make -j72 -s olddefconfig drivers/net/wireless/mac80211_hwsim.o
drivers/net/wireless/mac80211_hwsim.o: warning: objtool:
mac80211_hwsim_tx()+0x9aa: unreachable instruction
$ gcc --version
gcc (Debian 11.2.0-12) 11.2.0

:(

Let me see if I can come up with a reduced test case that I will
report upstream to https://gcc.gnu.org/bugzilla/.
-- 
Thanks,
~Nick Desaulniers
