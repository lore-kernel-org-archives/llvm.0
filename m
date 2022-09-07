Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8D128E3
	for <llvm@lists.linux.dev>; Wed,  7 Sep 2022 23:10:46 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id 202so14979954pgc.8
        for <llvm@lists.linux.dev>; Wed, 07 Sep 2022 16:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=D9GYa8OJDUYWVtjvzZNWj4WxHz/CsMN9FwfpuX4V0rg=;
        b=fHmNShdgI4dnC6hErvVoYwXgDNbgsvnYw6M/vzNGlywwNb8ieN/SlRLVWwpWKkoSu1
         vq0hcEhlT+GKynnWf9AqlWHeUPpZL08URJGii/8YbtzlfJ0IfDSoFsIU4KgaZEj4R4uU
         m+2r1/Ucjkq3qLNSD1SgrXHQXWlvKtbJxGq1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=D9GYa8OJDUYWVtjvzZNWj4WxHz/CsMN9FwfpuX4V0rg=;
        b=F8gJgkRJ/iEHoTU7ixmdtYWl6GgXugtkeRu0flxeRVE7ZP0M5zfK/HAWxiZx0h/+7T
         d1u5Ck7B57aQltagJhWtxLTqGe8rvMwLGsROj5BDn7SvZpLnqEAmU2cM0WoFxfuTgqzh
         NJeI6Vk02yTWdzWkwhg8Lj4awmk7ymxbKXRN/3MHnDO2ZpaTbXHw7zGBZjaLcpMSgiGv
         akQgjL4xcWj7yh5bjt/g7BpFJAjr/Z+/9GibLayFqAHDNautWzG2Vrgdb9YulA5dc67N
         0s+P9vmLYaCv3iRFfy8ld5EZEoDESArHPl4Bo6D6XgcAACKb7UDxBqTAfZua7pIhY7Nr
         ToNQ==
X-Gm-Message-State: ACgBeo2zQRp1kM+K7wyUbS8dGKf7pl+aIF5tXGJKdkYt/ZlW/pyChoZd
	rVNcoiSzPQW7DAKFRDlR1tuHqg==
X-Google-Smtp-Source: AA6agR5mOZptHzyKX2MhRGXlipNiPACZtnxxJGgxQ8tn93t85KvuvocH+td73K+d6+k4fFh4O61YPw==
X-Received: by 2002:a63:1e61:0:b0:41c:45d:7d50 with SMTP id p33-20020a631e61000000b0041c045d7d50mr5135945pgm.507.1662592245677;
        Wed, 07 Sep 2022 16:10:45 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id v28-20020aa799dc000000b00537ab89c66csm13683408pfi.143.2022.09.07.16.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 16:10:44 -0700 (PDT)
Date: Wed, 7 Sep 2022 16:10:43 -0700
From: Kees Cook <keescook@chromium.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>, Juergen Gross <jgross@suse.com>,
	"Srivatsa S. Bhat (VMware)" <srivatsa@csail.mit.edu>,
	Alexey Makhalov <amakhalov@vmware.com>,
	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	virtualization@lists.linux-foundation.org,
	LKML <linux-kernel@vger.kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	clang-built-linux <llvm@lists.linux.dev>,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH 2/2] x86/paravirt: add extra clobbers with
 ZERO_CALL_USED_REGS enabled
Message-ID: <202209071609.BE5BF18D6@keescook>
References: <20220902213750.1124421-1-morbo@google.com>
 <20220902213750.1124421-3-morbo@google.com>
 <202209022251.B14BD50B29@keescook>
 <CAGG=3QXpK+bFOSYZkdNNFGzNfgJSSADGTRWYRv6z0vfBAgQvWQ@mail.gmail.com>
 <CAKwvOdm+kVTrqMrSPHwTa0NrG9qwTcFkGnikjYjk0ctFGBfeRA@mail.gmail.com>
 <YxhbO1YZPMHutw48@hirez.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YxhbO1YZPMHutw48@hirez.programming.kicks-ass.net>

On Wed, Sep 07, 2022 at 10:50:03AM +0200, Peter Zijlstra wrote:
> On Tue, Sep 06, 2022 at 11:00:07PM -0700, Nick Desaulniers wrote:
> > On Sun, Sep 4, 2022 at 11:02 PM Bill Wendling <morbo@google.com> wrote:
> > >
> > > On Sat, Sep 3, 2022 at 12:18 AM Kees Cook <keescook@chromium.org> wrote:
> > > >
> > > > On Fri, Sep 02, 2022 at 09:37:50PM +0000, Bill Wendling wrote:
> > > > > [...]
> > > > >         callq   *pv_ops+536(%rip)
> > > >
> > > > Do you know which pv_ops function is this? I can't figure out where
> > > > pte_offset_kernel() gets converted into a pv_ops call....
> > > >
> > > This one is _paravirt_ident_64, I believe. I think that the original
> > > issue Nathan was seeing was with another seemingly innocuous function.
> > 
> > _paravirt_ident_64 is marked noinstr, which makes me suspect that it
> > really needs to not be touched at all by the compiler for
> > these...special features.
> 
> My source tree sayeth:
> 
>   u64 notrace _paravirt_ident_64(u64 x)

I don't see noinstr either. But it seems a reasonable thing to do?

Bill, does fixing up the noinstr macro and adding it here fix the
problem?

-- 
Kees Cook
