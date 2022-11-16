Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6C412290
	for <llvm@lists.linux.dev>; Wed, 16 Nov 2022 22:07:51 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id 130so18768601pfu.8
        for <llvm@lists.linux.dev>; Wed, 16 Nov 2022 14:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=USUBJEQYr7zCoXTygKbEoAl5/bOlE5sjNcmPMMnNO+I=;
        b=aOXRrMzLYEFxRa8SaRW4Ih90tXTtmdiLlMY5L9fwgvk5ZkEvOJPwSUwRFH0VVe0KNX
         Tf7RQspv3rT5ZdHZwrc2/gApQJqkPiCcet8AWh1asaTK6+tRSU0QJ9WlaBD3CZ1nrUfF
         RLbgixYHaOds9zuQVBWGzWco4eawNq4P2jfKY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=USUBJEQYr7zCoXTygKbEoAl5/bOlE5sjNcmPMMnNO+I=;
        b=6euKsl4RiRJhLfwvAIyhyVIWyw+Sgv7LVZ4vLVt8NnwL1akJryvRyXB8BIgTmWviK8
         3yNKxNfzA7SdGEfosFQp6phupdNe6VEed3W+TuxPoFm9wsa7Wa2LXVRLSiw5/KSlKaMv
         lzSk5/uuRO+PmJyjNBuGLqlIzRpJ1PyRo2RjHPj2aOgmxt2iEFUpKjybBwudDLIIweY2
         PbnEHRmJxdR53qGyzBIs5jpBQTHPk8mBvxsEhw4tW6Lwkzg9OEBnMPQZzv0+V1tk+UaI
         69NsR9+d9weu8bNLkAjJN94Qe0fXvlu8QtODmotw1Z+o/uuNgMtb4G6zalJgSwzjST9R
         jzmA==
X-Gm-Message-State: ANoB5pkIvsU9AuehyHL3Zy0Klz2Jstpe+b6vy/cs0aG0hrcsoBvZolsP
	aK6VMiJvOENk+JFFE6KiQEj5+w==
X-Google-Smtp-Source: AA0mqf64K5vUgue30E5gIXBgliS7kLgA+JyCtiS271x1i8ctDHfLG/fqrQchGdWFMA8s4VGWRw5BnA==
X-Received: by 2002:a63:535e:0:b0:43c:7da:e64b with SMTP id t30-20020a63535e000000b0043c07dae64bmr22822743pgl.231.1668636470644;
        Wed, 16 Nov 2022 14:07:50 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id u11-20020a17090a450b00b001fd76f7a0d1sm2093989pjg.54.2022.11.16.14.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 14:07:50 -0800 (PST)
Date: Wed, 16 Nov 2022 14:07:49 -0800
From: Kees Cook <keescook@chromium.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Michal Marek <michal.lkml@markovi.net>,
	Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v2] kbuild: fix SIGPIPE error message for AR=gcc-ar and
 AR=llvm-ar
Message-ID: <202211161406.EF075E28E9@keescook>
References: <20221027162839.410720-1-masahiroy@kernel.org>
 <202211161056.1B9611A@keescook>
 <CAK7LNATWbvpovH8qsGMX-5-31QiQ6pjKNnm+YEDEqr4io1hrSw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNATWbvpovH8qsGMX-5-31QiQ6pjKNnm+YEDEqr4io1hrSw@mail.gmail.com>

On Thu, Nov 17, 2022 at 05:37:31AM +0900, Masahiro Yamada wrote:
> On Thu, Nov 17, 2022 at 4:01 AM Kees Cook <keescook@chromium.org> wrote:
> >
> > On Fri, Oct 28, 2022 at 01:28:39AM +0900, Masahiro Yamada wrote:
> > > Jiri Slaby reported that building the kernel with AR=gcc-ar shows:
> > >   /usr/bin/ar terminated with signal 13 [Broken pipe]
> > >
> > > Nathan Chancellor reported the latest AR=llvm-ar shows
> > >   error: write on a pipe with no reader
> > >
> > > The latter occurs since LLVM commit 51b557adc131 ("Add an error message
> > > to the default SIGPIPE handler").
> > >
> > > The resulting vmlinux is correct, but it is better to silence it.
> > >
> > > 'head -n1' exits after reading the first line, so the pipe is closed.
> > >
> > > Use 'sed -n 1p' to eat the stream till the end.
> >
> > I think this is wrong because it needlessly consumes CPU time. SIGPIPE
> > is _needed_ to stop a process after we found what we needed, but it's up
> > to the caller (the shell here) to determine what to do about it.
> >
> > Similarly, that LLVM commit is wrong -- tools should _not_ catch their
> > own SIGPIPEs. They should be caught by their callers.
> >
> > For example, see:
> >
> > $ seq 10000 | head -n1
> > 1
> >
> > ^^^ no warnings from the shell (caller of "seq")
> > And you can see it _is_ being killed by SIGPIPE:
> >
> > $ strace seq 1000 | head -n1
> > ...
> > write(1, "1\n2\n3\n4\n5\n6\n7\n8\n9\n10\n11\n12\n13\n14"..., 8192) = 8192
> > 1
> > write(1, "\n1861\n1862\n1863\n1864\n1865\n1866\n1"..., 4096) = -1 EPIPE (Broken pipe)
> > --- SIGPIPE {si_signo=SIGPIPE, si_code=SI_USER, si_pid=3503448, si_uid=1000} ---
> > +++ killed by SIGPIPE +++
> >
> > If we use "sed -n 1p" seq will continue to run, consuming needless time
> > and CPU resources.
> >
> > So, I strongly think this is the wrong solution. SIGPIPE should be
> > ignored for ar, and LLVM should _not_ catch its own SIGPIPE.
> >
> > -Kees
> 
> 
> I thought of this - it is just wasting CPU time,
> but I did not come up with a better idea on the kbuild side.
> 
> I do not want to use 2>/dev/null because it may hide
> non-SIGPIPE (i.e. real) errors.

Yes, I've opened an upstream LLVM bug for this:
https://github.com/llvm/llvm-project/issues/59037

-- 
Kees Cook
