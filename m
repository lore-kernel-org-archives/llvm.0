Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD67A23
	for <llvm@lists.linux.dev>; Thu,  1 Sep 2022 03:51:39 +0000 (UTC)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-11f34610d4aso18011191fac.9
        for <llvm@lists.linux.dev>; Wed, 31 Aug 2022 20:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=FMeFb1DKNrRW4XTw+2AUilPkuq6lPd1YD7bO8dxWl6s=;
        b=ByOcugM+LZVu3LuzIKRmYBcj8KWgL4G7ve6wG4Vn0qoJvpyjNqGF0cyV+0oQVj7j58
         WuNe3l77T9LEvgoTH+w7H1pVPIyGRZAaOiV1cWXfChXXsm1LZtefpsIDIE7RvVLSHA4f
         Wwwtd1IJ+y9eB1DG61eaolq0kyWrCQv+OjXE96DdxLqMuGv+MTUo7sGPj2UM53rtrPNS
         swQqutm5fJ2lxDJEiVMUsXVk4UPO0w2tb57hyw/N5GafGbIsLS1fSXSIkj0D9QWiPh1D
         ESk93IMou7GCvFIDeupXNfI16QVMICInA28JP8OLxS4wdsluU5KnQDK0kBPi3XZxl4Zj
         wCYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=FMeFb1DKNrRW4XTw+2AUilPkuq6lPd1YD7bO8dxWl6s=;
        b=MvS/IIPWPwQfLYtFxax5Xz0KLtgdWAuf6CQugU1Got4/7nzUSNvTwBfot7ef3utxsa
         K/If5Apsrkvpr/JQGWFOWG2F0m3bc4uvYzdODHyvh/0mc+exz8GDhUz8NYY0bL1zGX6H
         OY2g9k3jBnSB3nvXuiHXU68maB3z20+/IzFD8GGpYenNC4W4Yp1FA9bvFnePQe1Ia3U6
         ukpT7txiEcUlt7dtrzvXal/dHPWKgHgIo6Spz9sg/yyz3LfwMo37oISxjynSdIT1xhiM
         2MI7qj/c8icKTMVBmKiYj6gTTeDuU2x9eJ1CDzToX5YrTNs7HlZGOt410gWSdybBVwoV
         /3Og==
X-Gm-Message-State: ACgBeo2GQFBjLAOXJcT0xQwjD5PWYYG6o8G4AKbB0naF8g2Y8GY2f8Jx
	ZbLL6lzVtdH9beRZ22LJRDk=
X-Google-Smtp-Source: AA6agR4p7F4GBqihoJuFKRYYOZ0Wb+JZLdStHGZEH7IwD5hH4fmexnWwUavQ8c9sZGSy6l7Zmza78A==
X-Received: by 2002:a05:6870:3127:b0:11c:8c2c:9015 with SMTP id v39-20020a056870312700b0011c8c2c9015mr2880965oaa.31.1662004298634;
        Wed, 31 Aug 2022 20:51:38 -0700 (PDT)
Received: from localhost ([12.97.180.36])
        by smtp.gmail.com with ESMTPSA id p5-20020a4a95c5000000b00448985f1f17sm9033176ooi.9.2022.08.31.20.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Aug 2022 20:51:37 -0700 (PDT)
Date: Wed, 31 Aug 2022 20:49:27 -0700
From: Yury Norov <yury.norov@gmail.com>
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
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
Message-ID: <YxArx4UGoSQXljQd@yury-laptop>
References: <20220511160319.1045812-1-mailhol.vincent@wanadoo.fr>
 <20220831075742.295-1-mailhol.vincent@wanadoo.fr>
 <Yw8hJS9f6SofG4/6@yury-laptop>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yw8hJS9f6SofG4/6@yury-laptop>

On Wed, Aug 31, 2022 at 01:54:01AM -0700, Yury Norov wrote:
> On Wed, Aug 31, 2022 at 04:57:40PM +0900, Vincent Mailhol wrote:
> > The compilers provide some builtin expression equivalent to the ffs(),
> > __ffs() and ffz() functions of the kernel. The kernel uses optimized
> > assembly which produces better code than the builtin
> > functions. However, such assembly code can not be folded when used
> > with constant expressions.
> > 
> > This series relies on __builtin_constant_p to select the optimal solution:
> > 
> >   * use kernel assembly for non constant expressions
> > 
> >   * use compiler's __builtin function for constant expressions.
> > 
> > 
> > ** Statistics **
> > 
> > Patch 1/2 optimizes 26.7% of ffs() calls and patch 2/2 optimizes 27.9%
> > of __ffs() and ffz() calls (details of the calculation in each patch).
> 
> Hi Vincent,
> 
> Can you please add a test for this? We've recently added a very similar
> test_bitmap_const_eval() in lib/test_bitmap.c.
> 
> dc34d5036692c ("lib: test_bitmap: add compile-time optimization/evaluations
> assertions")
> 
> Would be nice to have something like this for ffs() and ffz() in
> lib/test_bitops.c.
> 
> Please keep me in loop in case of new versions.

Also, what about fls? Is there any difference with ffs/ffz wrt compile
time optimizations? If not, would be great if the series will take
care of it too.

Thanks,
Yury
