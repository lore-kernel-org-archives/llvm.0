Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DA668
	for <llvm@lists.linux.dev>; Thu,  9 Dec 2021 20:33:13 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id bf8so10354383oib.6
        for <llvm@lists.linux.dev>; Thu, 09 Dec 2021 12:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kkfMK5PB8QI1XOoT83uXuffhKjgO17IGbJlqxB7Wwjw=;
        b=GvTTIDuouZQMVVXAnpmcyU3Gx53MZYuELZzUGCQqpaCUDzPEn3riEDFzRpwKQdMFZb
         nfl/1sGVtEAdgILK3aYLue6HOJUbPwu+QAUSi+hTSRja7ul8GzpWv4NMi7dYhpJhB4/z
         iwOVw/IqHOAdoP7Uk53PQKv2whQaj31Ed+LI+mbLQ8D1nzjU9fwymLhZKdqObEwM7VnY
         9BWc8tmCfg0B/swTogcVoToAzGTAXyhoYVdtEoI6oJOSSS/qLjbsDIpDL/IVwUXqC7vV
         3QxrF2COmUd6jmV06TbzH87thULXjLQwXsSsibrYss2+xM2ydBzBieDrGjMVhMOLtvZF
         pIHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kkfMK5PB8QI1XOoT83uXuffhKjgO17IGbJlqxB7Wwjw=;
        b=8CsO7moXBURa6MljRq1ycUJWYW0s1ykSZKBFcTPwFTjCxvnkxuyxMb7GidQNrEKh3p
         oLLc1cqxXSeniNTy/tsGiwJ32h+00E/j7Kkli1jNXMo55u+lotCc5PwXyfMoaPIYuCLW
         qrRzMJtsFoNd564SzumKCzes98sfuoX52FdvRhKzsqKJOu45d3BXUIczSpREzuxLx16S
         AVl0xdiA6CusuwezOV6yFO+NElZS/3PmzsxUJmFNh+DqHreyyXJnN1H5XwqrMCfWTajL
         gzp63sS+VokO8D1sUoIlyPCPCwkwk7iescisvc9sDvHAB9AohcVKHvQppNoqd+pv3W8Z
         IUMQ==
X-Gm-Message-State: AOAM532v7DonecOOxYqLTIcG1BjRaVvYvb2Z2fdj/3pPCy54NJkCxnT2
	c331kJRKICpF8ZRjFHo0nwyKIpDHCZR9O1sKH/stVQ==
X-Google-Smtp-Source: ABdhPJzORI+4/1cecMt2bxtxnQkSHfNLFChARuXfNE1C35htwXuJdGA5pt88aLuZATfaLyL88OsMelcreW+SKZQzifY=
X-Received: by 2002:a05:6808:1903:: with SMTP id bf3mr8384470oib.7.1639081992787;
 Thu, 09 Dec 2021 12:33:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YbHTKUjEejZCLyhX@elver.google.com> <20211209201616.GU614@gate.crashing.org>
In-Reply-To: <20211209201616.GU614@gate.crashing.org>
From: Marco Elver <elver@google.com>
Date: Thu, 9 Dec 2021 21:33:01 +0100
Message-ID: <CANpmjNN4OAA_DM_KNLGJah3fk-PaZktGjziiu8ztf6fevZy5ug@mail.gmail.com>
Subject: Re: randomize_kstack: To init or not to init?
To: Segher Boessenkool <segher@kernel.crashing.org>
Cc: Kees Cook <keescook@chromium.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Elena Reshetova <elena.reshetova@intel.com>, Mark Rutland <mark.rutland@arm.com>, 
	Peter Zijlstra <peterz@infradead.org>, Alexander Potapenko <glider@google.com>, Jann Horn <jannh@google.com>, 
	Peter Collingbourne <pcc@google.com>, kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-toolchains@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 9 Dec 2021 at 21:19, Segher Boessenkool
<segher@kernel.crashing.org> wrote:
>
> On Thu, Dec 09, 2021 at 10:58:01AM +0100, Marco Elver wrote:
> > Clang supports CONFIG_INIT_STACK_ALL_ZERO, which appears to be the
> > default since dcb7c0b9461c2, which is why this came on my radar. And
> > Clang also performs auto-init of allocas when auto-init is on
> > (https://reviews.llvm.org/D60548), with no way to skip. As far as I'm
> > aware, GCC 12's upcoming -ftrivial-auto-var-init= doesn't yet auto-init
> > allocas.
>
> The space allocated by alloca is not an automatic variable, so of course
> it is not affected by this compiler flag.  And it should not, this flag
> is explicitly for *small fixed-size* stack variables (initialising
> others can be much too expensive).
>
> >       C. Introduce a new __builtin_alloca_uninitialized().
>
> That is completely backwards.  That is the normal behaviour of alloca
> already.  Also you can get __builtin_alloca inserted by the compiler
> (for a variable length array for example), and you typically do not want
> those initialised either, for the same reasons.

You're right, if we're strict about it, initializing allocas is
technically out-of-scope of that feature.

So, option D: Add a param to control this, and probably it shouldn't
do it by default. Let's see how far that gets then.
