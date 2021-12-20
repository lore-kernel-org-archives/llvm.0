Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C15829CA
	for <llvm@lists.linux.dev>; Mon, 20 Dec 2021 07:00:17 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id s139so14396813oie.13
        for <llvm@lists.linux.dev>; Sun, 19 Dec 2021 23:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bOWHMfUqWgS66PgQYYet33MLKueM0ddFZqC4iawf0eo=;
        b=EhTOwMFaKZI9Jc0S3FLUHeHgNZW+azpNir8KH/VrP5S/q0y/3AOZjr1zWLXrpNYBX2
         Mzp+4L8bKsAjfPRlbONenEwbuhMhHOM6FO8qSMITDd+droYp+xnPV3k+06tJ976mZiJR
         oF+qh6lCPn/+aDX3OxXe3P3blZXRd6QjiBE/l9NmSCQU/xcTi4ANTEMHJIedw3AEPOmY
         YW7AfOEfldV2VkNhHXLclHAcJSzDb2LjogbFmEaRRz6BDFFtZP45zDURm/VRdiSuiHVR
         3JrA/20ul6M6/yzgTLEtCMAT2ayYyphFIvO8s4H1G0DVT51A1nNF5mUkxhJ/mzK+KnNO
         cVTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bOWHMfUqWgS66PgQYYet33MLKueM0ddFZqC4iawf0eo=;
        b=nEj8EWgSM/S4Zb/65t2UoxLBFONyHiDndXTAN+pftfrQk/pWvWbw+mt/7Xqta2OFat
         TNxX5VgkrNyc/QjFWRV344UwYJBtqGFoialWEqYt8HK8xltj2ZeIMUdj3yFVqjzHRSx8
         Kx3WlkzEWR65aNoGNtC43tzIEHpaKkROlGwpgAuvSfklg8kleurPfEI8/UNaBhGi/MHj
         gfTPVkz7c2haM1x8rcjfExAK9gPl/zG/mXWOByS4QpNbFgN0MsW0Cgq5LWH37sC5NMPs
         XZkoREr8aVSWwxdgNfSYn5aEB4RIx+NmVWmaO63uKN18oANJjKG+TXJVRGgYjrcGH9a8
         v9tQ==
X-Gm-Message-State: AOAM530/jxYdvCkmaH0tE33tmzKkt+vigoKfWGT8Uw4inqZj0+GaxIsu
	YA8TE4/ADGHdaBsHtpK75RU5dOmXONjsoMeqB5L18A==
X-Google-Smtp-Source: ABdhPJx5Mh/dkzyGPzJF57IaS36QpKLdrS0B5NBIdJYTPkT2PN892GsWzomJqWkjhL/oqgJcA03tECRpPMH/GB+4WEk=
X-Received: by 2002:aca:af50:: with SMTP id y77mr11164327oie.134.1639983616081;
 Sun, 19 Dec 2021 23:00:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YbHTKUjEejZCLyhX@elver.google.com> <20211209201616.GU614@gate.crashing.org>
 <CANpmjNN4OAA_DM_KNLGJah3fk-PaZktGjziiu8ztf6fevZy5ug@mail.gmail.com>
In-Reply-To: <CANpmjNN4OAA_DM_KNLGJah3fk-PaZktGjziiu8ztf6fevZy5ug@mail.gmail.com>
From: Marco Elver <elver@google.com>
Date: Mon, 20 Dec 2021 08:00:00 +0100
Message-ID: <CANpmjNM3eSd9sxi-1tV0cRthJ0hudrME8nYdhYP=ttcWDoPNfg@mail.gmail.com>
Subject: Re: randomize_kstack: To init or not to init?
To: Segher Boessenkool <segher@kernel.crashing.org>
Cc: Kees Cook <keescook@chromium.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Elena Reshetova <elena.reshetova@intel.com>, Mark Rutland <mark.rutland@arm.com>, 
	Peter Zijlstra <peterz@infradead.org>, Alexander Potapenko <glider@google.com>, Jann Horn <jannh@google.com>, 
	Peter Collingbourne <pcc@google.com>, kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-toolchains@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 9 Dec 2021 at 21:33, Marco Elver <elver@google.com> wrote:
> On Thu, 9 Dec 2021 at 21:19, Segher Boessenkool <segher@kernel.crashing.org> wrote:
> > On Thu, Dec 09, 2021 at 10:58:01AM +0100, Marco Elver wrote:
> > > Clang supports CONFIG_INIT_STACK_ALL_ZERO, which appears to be the
> > > default since dcb7c0b9461c2, which is why this came on my radar. And
> > > Clang also performs auto-init of allocas when auto-init is on
> > > (https://reviews.llvm.org/D60548), with no way to skip. As far as I'm
> > > aware, GCC 12's upcoming -ftrivial-auto-var-init= doesn't yet auto-init
> > > allocas.
> >
> > The space allocated by alloca is not an automatic variable, so of course
> > it is not affected by this compiler flag.  And it should not, this flag
> > is explicitly for *small fixed-size* stack variables (initialising
> > others can be much too expensive).
> >
> > >       C. Introduce a new __builtin_alloca_uninitialized().
> >
> > That is completely backwards.  That is the normal behaviour of alloca
> > already.  Also you can get __builtin_alloca inserted by the compiler
> > (for a variable length array for example), and you typically do not want
> > those initialised either, for the same reasons.
>
> You're right, if we're strict about it, initializing allocas is
> technically out-of-scope of that feature.
>
> So, option D: Add a param to control this, and probably it shouldn't
> do it by default. Let's see how far that gets then.

Just an update: after some discussion, the Clang side says that
alloca() is in scope, because the intent is that trivially initialized
"automatic stack storage" should be handled by ftrivial-auto-var-init.
And alloca() is automatic stack storage:
https://www.gnu.org/software/libc/manual/html_node/Variable-Size-Automatic.html

So currently it looks like the builtin is the only solution in this case.

Thanks.
