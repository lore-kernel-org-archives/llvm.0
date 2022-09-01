Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7423546A9
	for <llvm@lists.linux.dev>; Thu,  1 Sep 2022 14:19:16 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id e28so13493098qts.1
        for <llvm@lists.linux.dev>; Thu, 01 Sep 2022 07:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=sU5/spIoFFsSsjudnyeB7I5k2zVIg64jzdQC1Ln9LKI=;
        b=L3vwZZLviUfz2/Qv1uuocskyzZF3TjqFQXBHeWunVdszNZkWU/5mL6r0ecwdvIn71h
         QQvFH0ixCr7AuByn4N1CF2wwiAfPB/c7ge2uweWtQ/2RLAtRTaD8F/wLh/PSlE2/2xQk
         0mHjqfOpYTviHShaGwJjrf7QTtVYJKZJZSLCwIxizsIaCaAQcYwxRiVUZ8uUDa4of+F+
         C+4ZEc1vwuFRaFcjIxSWumpszXQNCTAGUkIERkRuob4qNrTTnvgMS/Z5Iu8/2AFdcoRu
         VGu5ZVNgZ1sdCMi1Q9IRJtIbCEmIPO/LoG41W8Psc/GZ00z3W9xdly9o/IoASJmmkeWK
         tHgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=sU5/spIoFFsSsjudnyeB7I5k2zVIg64jzdQC1Ln9LKI=;
        b=AA/rqj/nMCie8qUzMvp3GAbxRulHOo4k5IGH3g/xsrsg9ns0NAAgtnhBd+Ia9aEjw4
         IbGsdAWKCR8RtbznwLHxZnq4mTzlEvM8It7tyzaQ4uNM2RmBPDVlW6cVzqFsycsaCzid
         BAfOqlJeAQTY+B7ZUzs0C0dWdXLI9j4eKPH65GEucAy0VEtxHrvQgruskAw0WPguwG/H
         G4UNB/dBE3h87ONehtrUvU1tIhDunrdfV3gMIXKVbBeATNTf6QnI35NQvS7cc1rRF3I1
         JDYzhaqd1Z/o0lBRcfJzYpzdtCUsP4i40yZxKn2RWtb2GbzqjR3jAF9DHd4ZBX51dWhd
         RN/Q==
X-Gm-Message-State: ACgBeo3mU2X/ah9Jk5rcy0w+nfAzUDvTKp7CowvTJVtl+g7juMYqt/Y1
	3KioStSkh/DPa6WjW6y4css=
X-Google-Smtp-Source: AA6agR5z1NM1EyyB2pG7Q4h+Y42w4H3zINPSAaCyxrK/1RCpCBh2d5EoXNAzzSHnRTNqBwhuwMlPew==
X-Received: by 2002:ac8:7dc1:0:b0:344:6104:eab6 with SMTP id c1-20020ac87dc1000000b003446104eab6mr23373266qte.455.1662041954828;
        Thu, 01 Sep 2022 07:19:14 -0700 (PDT)
Received: from localhost ([2601:4c1:c100:2270:f862:dbcc:aa84:4875])
        by smtp.gmail.com with ESMTPSA id 138-20020a370390000000b006a5d2eb58b2sm11419968qkd.33.2022.09.01.07.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 07:19:14 -0700 (PDT)
Date: Thu, 1 Sep 2022 07:19:13 -0700
From: Yury Norov <yury.norov@gmail.com>
To: Vincent MAILHOL <mailhol.vincent@wanadoo.fr>
Cc: Borislav Petkov <bp@alien8.de>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, x86@kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	David Howells <dhowells@redhat.com>,
	Jan Beulich <JBeulich@suse.com>,
	Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
	Joe Perches <joe@perches.com>, Josh Poimboeuf <jpoimboe@kernel.org>
Subject: Re: [PATCH v6 0/2] x86/asm/bitops: optimize ff{s,z} functions for
 constant expressions
Message-ID: <YxC+eShQLDor0B9D@yury-laptop>
References: <20220511160319.1045812-1-mailhol.vincent@wanadoo.fr>
 <20220831075742.295-1-mailhol.vincent@wanadoo.fr>
 <Yw8hJS9f6SofG4/6@yury-laptop>
 <YxArx4UGoSQXljQd@yury-laptop>
 <CAMZ6Rq+XVWGEEHr9t5dkXN0E36hkpMb5kNEZJmMFgtJxyQntsg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMZ6Rq+XVWGEEHr9t5dkXN0E36hkpMb5kNEZJmMFgtJxyQntsg@mail.gmail.com>

On Thu, Sep 01, 2022 at 07:30:10PM +0900, Vincent MAILHOL wrote:
> On Tue. 1 sept. 2022 at 12:49, Yury Norov <yury.norov@gmail.com> wrote:
> > On Wed, Aug 31, 2022 at 01:54:01AM -0700, Yury Norov wrote:
> > > On Wed, Aug 31, 2022 at 04:57:40PM +0900, Vincent Mailhol wrote:
> > > > The compilers provide some builtin expression equivalent to the ffs(),
> > > > __ffs() and ffz() functions of the kernel. The kernel uses optimized
> > > > assembly which produces better code than the builtin
> > > > functions. However, such assembly code can not be folded when used
> > > > with constant expressions.
> > > >
> > > > This series relies on __builtin_constant_p to select the optimal solution:
> > > >
> > > >   * use kernel assembly for non constant expressions
> > > >
> > > >   * use compiler's __builtin function for constant expressions.
> > > >
> > > >
> > > > ** Statistics **
> > > >
> > > > Patch 1/2 optimizes 26.7% of ffs() calls and patch 2/2 optimizes 27.9%
> > > > of __ffs() and ffz() calls (details of the calculation in each patch).
> > >
> > > Hi Vincent,
> > >
> > > Can you please add a test for this? We've recently added a very similar
> > > test_bitmap_const_eval() in lib/test_bitmap.c.
> > >
> > > dc34d5036692c ("lib: test_bitmap: add compile-time optimization/evaluations
> > > assertions")
> > >
> > > Would be nice to have something like this for ffs() and ffz() in
> > > lib/test_bitops.c.
> > >
> > > Please keep me in loop in case of new versions.
> 
> Hi Yury,
> 
> My patch only takes care of the x86 architecture.

OK, I just realized that you started submitting this at least back in May. 

For me, v6 is good enough and well-described. So, for the series:
Reviewed-by: Yury Norov <yury.norov@gmail.com>

How are you going to merge it? If you haven't a specific tree in mind 
already, I can take it in my bitmap tree because  ffs and ffz are closely
related to find_bit() functions.

> Assuming some other
> architectures are not optimized yet, adding such a test might break
> some builds. I am fine with adding the test, however, I will not write
> patches for the other architecture because I do not have the
> environment to compile and test it.
> 
> Does it still make sense to add the test before fixing all the architectures?

All-arches fix should begin with changing the ffs design. Namely, there
should be a generic ffs() in include/linux/bitops.h, and arch-specific
arch__ffs() in arch/xxx/include/asm/bitops.h; like we do for the set_bit()
family. I have a feeling that it's far beyond the scope of your series.

The test is a different story. Good tests are always welcome, even if
they don't cover all the arches.

> > Also, what about fls? Is there any difference with ffs/ffz wrt compile
> > time optimizations? If not, would be great if the series will take
> > care of it too.
> 
> Agree. The fls() and fls64() can use __builtin_ctz() and
> __builtin_ctzll(). However, those two functions are a bit less
> trivial. I wanted to have this first series approved first before
> working on *fls*().

OK, the test and fls() can be a matter of a follow-up series, taking
into account how long are these 2 patches moving.

Thanks,
Yury
