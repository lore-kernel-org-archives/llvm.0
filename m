Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3FB168
	for <llvm@lists.linux.dev>; Sat,  8 Jan 2022 11:54:30 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id h10so6185459wrb.1
        for <llvm@lists.linux.dev>; Sat, 08 Jan 2022 03:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LRHExVyfqWb+CjlvuZOFy5IY4pp0xV737GyYU0gQJqY=;
        b=dhR4qC1zWBI/BYofjo0JBp6GSuRVM4PtMqn3wpYt+OfRYZA3hu6GjQhgd6Qng1xcuj
         VSvBddIy5gV5KuhbrGoO5t2Z8fZ3gOHSv1Fwh8pd3QHvSiyp2AT+C1xr0aAQYQ69uWND
         Rsm67RworqPvMm1UAVUSXzftKO7FhkiyqSM3UpRW3LBo0CPXKEK577vqVHvp3S0M44xG
         MQG6JNmtmJl33mruzUXQxRMgyR8jH1P42Bsnzyg4JoERzs7ooFoD8KdQdZpEANmvX+XA
         QLoehmgEt7GTCMTSuriEricCRns63iSlH6CT6CiVOAidj3NWkER394eXR0/vaTJwwD0U
         Bm9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=LRHExVyfqWb+CjlvuZOFy5IY4pp0xV737GyYU0gQJqY=;
        b=BEIc/D2qHsDyQDYv9WrtMfRW0HH0Q0LLZMwkLqlKlErGNCJN2yEXj21QSfAZrdgNsL
         0jwMNnZMlN8Tg3r5wWfU3xU/PwWol1znBHVM6JZ1TEI5fhsFV+XR2G6eBJv90NVWOX4V
         0bb/iIdWTpaYxsAj1f15mKAydsnWn1XYdd7/Yv8+9pb1paGXfQPhrS2pW5BSfTaT4ajv
         dwp50h7ktpPCmboWlUxcCRyNg6Wwv3EJ46pGC9qLz6esV8hppRuXwb9M/Ukj7b3qVBYt
         1XM+1ztj/fQYLfZ7N5PbtYmEkgEfwZOagOMF4IWKKtSZLPozVBucpR5SSjALeZpJKeZr
         mKjg==
X-Gm-Message-State: AOAM533CvU4VxMNOT5VABcvqKOBxPSw6/eR354rn0ko4NZz6IjrjJR08
	/WoUpr0JU/dcTfh2rjfSLr8=
X-Google-Smtp-Source: ABdhPJwgBlb6v6JR6QP7yO5yqdQZRJJ9sLZO2j0NeN+fBYL1HYkmvkAe2VDjKBPC0aTOTceZHbfPHQ==
X-Received: by 2002:a05:6000:24b:: with SMTP id m11mr12586202wrz.122.1641642868870;
        Sat, 08 Jan 2022 03:54:28 -0800 (PST)
Received: from gmail.com (84-236-113-171.pool.digikabel.hu. [84.236.113.171])
        by smtp.gmail.com with ESMTPSA id bd21sm1433232wmb.8.2022.01.08.03.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jan 2022 03:54:28 -0800 (PST)
Sender: Ingo Molnar <mingo.kernel.org@gmail.com>
Date: Sat, 8 Jan 2022 12:54:26 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"David S. Miller" <davem@davemloft.net>,
	Ard Biesheuvel <ardb@kernel.org>,
	Josh Poimboeuf <jpoimboe@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Al Viro <viro@zeniv.linux.org.uk>,
	llvm@lists.linux.dev
Subject: Re: [PATCH 0000/2297] [ANNOUNCE, RFC] "Fast Kernel Headers" Tree
 -v1: Eliminate the Linux kernel's "Dependency Hell"
Message-ID: <Ydl7ch/up7qJqByj@gmail.com>
References: <YdIfz+LMewetSaEB@gmail.com>
 <YdM4Z5a+SWV53yol@archlinux-ax161>
 <YdQlwnDs2N9a5Reh@gmail.com>
 <YdeJgJFRRsIb9pah@archlinux-ax161>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YdeJgJFRRsIb9pah@archlinux-ax161>


* Nathan Chancellor <nathan@kernel.org> wrote:

> On Tue, Jan 04, 2022 at 11:47:30AM +0100, Ingo Molnar wrote:
> > > > With the fast-headers kernel that's down to ~36,000 lines of code, 
> > > > almost a factor of 3 reduction:
> > > > 
> > > >   # fast-headers-v1:
> > > >   kepler:~/mingo.tip.git> wc -l kernel/pid.i
> > > >   35941 kernel/pid.i
> > > 
> > > Coming from someone who often has to reduce a preprocessed kernel source 
> > > file with creduce/cvise to report compiler bugs, this will be a very 
> > > welcomed change, as those tools will have to do less work, and I can get 
> > > my reports done faster.
> > 
> > That's nice, didn't think of that side effect.
> > 
> > Could you perhaps measure this too, to see how much of a benefit it is?
> 
> As it turns out, I got an opportunity to measure this sooner rather than
> later [1]. Using cvise [2] with an identical set of toolchains and
> interestingness test [3], reducing net/core/skbuff.c took significantly
> less time with the version from the fast-headers tree.
> 
> v5.16-rc8:
> 
> $ wc -l skbuff.i
> 105135 skbuff.i
> 
> $ time cvise test.fish skbuff.i
> ...
> ________________________________________________________
> Executed in  114.02 mins    fish           external
>    usr time  1180.43 mins   69.29 millis  1180.43 mins
>    sys time  229.80 mins  248.11 millis  229.79 mins
> 
> fast-headers:
> 
> $ wc -l skbuff.i
> 78765 skbuff.i
> 
> $ time cvise test.fish skbuff.i
> ...
> ________________________________________________________
> Executed in   47.38 mins    fish           external
>    usr time  620.17 mins   32.78 millis  620.17 mins
>    sys time  123.70 mins  122.38 millis  123.70 mins
> 
> I was not expecting that much of a difference but it somewhat makes 
> sense, as the tool spends less time eliminated unused code and the 
> compiler invocations will be incrementally quicker as the input becomes 
> smaller.

Indeed, that's a +140% speedup in build performance, not bad. :-)

I also got around testing Clang (12) myself, and with my 'reference distro 
config' I got these results:

 #
 # v5.16-rc8
 #
 Performance counter stats for 'make -j96 vmlinux LLVM=1' (3 runs):

 55,638,543,274,254      instructions              #    0.77  insn per cycle           ( +-  0.01% )
 72,074,911,968,393      cycles                    #    3.901 GHz                      ( +-  0.04% )
      18,490,451.51 msec cpu-clock                 #   54.740 CPUs utilized            ( +-  0.04% )

                 337.788 +- 0.834 seconds time elapsed  ( +-  0.25% )

 #
 # -fast-headers-v2-rc3
 #
 Performance counter stats for 'make -j96 vmlinux LLVM=1' (3 runs):

 30,904,130,243,855      instructions              #    0.76  insn per cycle           ( +-  0.02% )
 40,703,482,733,690      cycles                    #    3.898 GHz                      ( +-  0.00% )
      10,443,670.86 msec cpu-clock                 #   58.093 CPUs utilized            ( +-  0.00% )

                 179.773 +- 0.829 seconds time elapsed  ( +-  0.46% )

That's a +88% build speedup on Clang - even better than the +78% speedup on 
GCC(-10).

Thanks,

	Ingo
