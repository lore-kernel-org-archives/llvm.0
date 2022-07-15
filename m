Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BAC33CD
	for <llvm@lists.linux.dev>; Fri, 15 Jul 2022 14:19:14 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id o133so6186644oig.13
        for <llvm@lists.linux.dev>; Fri, 15 Jul 2022 07:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VM8umUUF8nWEq+3AaJAtV0L0dG1DVjrEYAJskHQ0LoQ=;
        b=oPyPC8JND1jmk0qt6wIXCgqcuLOOl8rGUp32GLJy5a41WTs+t/zQKDnMPfvvn9vQYG
         hVNBmIiqK0CZJ7KeXvsfaLz5vgoIdjp4xEo6HcryvOJ98g7OVrHRBi+33W44+bXjbIH5
         YTxxqMTh3CAaGcgmPDUM6IDfsaSWOJEpSpSzax//VcMzEfSiDPKfKy5X9/uWPGIMq9/y
         OeaA8Q6pvUv8mQay4ZtyK/hv8ZgKNk7gzzL0D5IazIZCptUcaMBMEKuq1L6v3n/0eq4Y
         jp3xHaJTKOhHzVpoh4jgNGbZoiH7M3R8hbqK5sFOwtVyzVo8kMBlwqPLUiV42dTI7CkI
         X85w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VM8umUUF8nWEq+3AaJAtV0L0dG1DVjrEYAJskHQ0LoQ=;
        b=LPig32G0GtNhtXzoB0TjQYqvja/PIuVpb6daONCofgvR6/yEthXLKdHh2HvcRNdzI3
         3Ms9Q7QH6zUOvsarJdX5AYDtSWVOV05zYbfJ9j2v2s8JdjLUhLRgRcmA1ExuxghMMtUy
         9xOiMib7fABSs7OUIy3CHihWASIY9ArJfD5Qq83yNpGqqAmVgLoip5eR6Pbd+AyYSHMT
         BApPaMCFgz4oQs9b+1GMQQBiSl4/TnCiwhAG85/2ObmjoXSxCu0UAcGLBINhx3spSqm5
         EdtHjKzV64sIynslk9iBJ2qg8PZPYpNKU1xm/ucphJgPme0eM0RwH52OKO4HO/fmVBFY
         80Cw==
X-Gm-Message-State: AJIora/ZtFJVlIDjcDM83+J/akqj6M+CQz2anSHpvqy2l0gSzSwTj90U
	hU1TuHkQyo74xWC7TkENP9U=
X-Google-Smtp-Source: AGRyM1uVWqa+GN8TzJ+A70cSXNJpr/BZo6b1/5X1mjoS3V5CWTYfwZgVL70qGC+R317T+9zJh7IRug==
X-Received: by 2002:a05:6808:120a:b0:333:54f1:351 with SMTP id a10-20020a056808120a00b0033354f10351mr7215208oil.70.1657894753352;
        Fri, 15 Jul 2022 07:19:13 -0700 (PDT)
Received: from localhost ([12.97.180.36])
        by smtp.gmail.com with ESMTPSA id t3-20020a056870608300b00101c9597c6fsm2302385oae.28.2022.07.15.07.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jul 2022 07:19:13 -0700 (PDT)
Date: Fri, 15 Jul 2022 07:19:12 -0700
From: Yury Norov <yury.norov@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Alexander Lobakin <alexandr.lobakin@intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Matt Turner <mattst88@gmail.com>, Brian Cain <bcain@quicinc.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	"David S. Miller" <davem@davemloft.net>,
	Kees Cook <keescook@chromium.org>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Marco Elver <elver@google.com>, Borislav Petkov <bp@suse.de>,
	Tony Luck <tony.luck@intel.com>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Jesse Brandeburg <jesse.brandeburg@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, kernel test robot <lkp@intel.com>,
	linux-alpha@vger.kernel.org, linux-hexagon@vger.kernel.org,
	linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-arch@vger.kernel.org, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 6/9] bitops: let optimize out non-atomic bitops on
 compile-time constants
Message-ID: <YtF3YIBA0Dd4KXZ+@yury-laptop>
References: <20220624121313.2382500-1-alexandr.lobakin@intel.com>
 <20220624121313.2382500-7-alexandr.lobakin@intel.com>
 <20220715000402.GA512558@roeck-us.net>
 <20220715132633.61480-1-alexandr.lobakin@intel.com>
 <8c949bd4-d25a-d5f5-49be-59d52e4b6c9d@roeck-us.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c949bd4-d25a-d5f5-49be-59d52e4b6c9d@roeck-us.net>

On Fri, Jul 15, 2022 at 06:49:46AM -0700, Guenter Roeck wrote:
> On 7/15/22 06:26, Alexander Lobakin wrote:
> > From: Guenter Roeck <linux@roeck-us.net>
> > Date: Thu, 14 Jul 2022 17:04:02 -0700
> > 
> > > On Fri, Jun 24, 2022 at 02:13:10PM +0200, Alexander Lobakin wrote:
> > > > Currently, many architecture-specific non-atomic bitop
> > > > implementations use inline asm or other hacks which are faster or
> > 
> > [...]
> > 
> > > > Cc: Mark Rutland <mark.rutland@arm.com>
> > > > Signed-off-by: Alexander Lobakin <alexandr.lobakin@intel.com>
> > > > Reviewed-by: Marco Elver <elver@google.com>
> > > 
> > > Building i386:allyesconfig ... failed
> > > --------------
> > > Error log:
> > > arch/x86/platform/olpc/olpc-xo1-sci.c: In function 'send_ebook_state':
> > > arch/x86/platform/olpc/olpc-xo1-sci.c:83:63: error: logical not is only applied to the left hand side of comparison
> > 
> > Looks like a trigger, not a cause... Anyway, this construct:
> > 
> > 	unsigned char state;
> > 
> > 	[...]
> > 
> > 	if (!!test_bit(SW_TABLET_MODE, ebook_switch_idev->sw) == state)
> > 
> > doesn't look legit enough.
> > That redundant double-negation [of boolean value], together with
> > comparing boolean to char, provokes compilers to think the author
> > made logical mistakes here, although it works as expected.
> > Could you please try (if it's not automated build which you can't
> > modify) the following:
> > 
> 
> Agreed, the existing code seems wrong. The change below looks correct
> and fixes the problem. Feel free to add
> 
> Reviewed-and-tested-by: Guenter Roeck <linux@roeck-us.net>
> 
> to the real patch.
> 
> Thanks,
> Guenter
> 
> > --- a/arch/x86/platform/olpc/olpc-xo1-sci.c
> > +++ b/arch/x86/platform/olpc/olpc-xo1-sci.c
> > @@ -80,7 +80,7 @@ static void send_ebook_state(void)
> >   		return;
> >   	}
> > -	if (!!test_bit(SW_TABLET_MODE, ebook_switch_idev->sw) == state)
> > +	if (test_bit(SW_TABLET_MODE, ebook_switch_idev->sw) == !!state)
> >   		return; /* Nothing new to report. */
> >   	input_report_switch(ebook_switch_idev, SW_TABLET_MODE, state);
> > ---
> > 
> > We'd take it into the bitmap tree then. The series revealed
> > a fistful of existing code issues already :)

Would you like me to add your signed-off-by and apply, or you prefer
to send it out as a patch?

Thanks,
Yury
