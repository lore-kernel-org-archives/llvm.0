Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62661487E4
	for <llvm@lists.linux.dev>; Fri, 12 Apr 2024 16:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712938326; cv=none; b=gW2JWEOg+W24CvWWanfD675Bwt0t/RlsvsvmxPOxMZ7Gcoacem3hf1URpBEVDW3jFoyJrLjSBMQpcG8JUNo95BBBPXwanE9ll5yPkjBG9AeFicM8i3lqEqxpvqq4P34+5YIml+l59wMXGuL18a/mA2QezjocKWWJzs6DxDFaYhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712938326; c=relaxed/simple;
	bh=CyDf6s1oBPX3vBBot9QW9Bfdy/AMFlPJrHMpAv8DVOU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eWt0kJYxEACNE8p9d0sraSI5yfui6jIw54yvFp5O5ZnMwqu9lfJgGvHg/TJgihmM2q8zVB55u8TVFUD2LIkgv3p78XLF3TDXCn260bMUKoMWiD/bWZi7MP/R1t2SmY2i6HCwAHT+wCk6Daep6TFX+LNWpsTdprGPOsmB1NRVBhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=v/2qyScQ; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="v/2qyScQ"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-56fe56d4d9cso15656a12.1
        for <llvm@lists.linux.dev>; Fri, 12 Apr 2024 09:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712938323; x=1713543123; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W5JT8K7AvdRwgx51et4e9LWrdmVm7FiW3UD4VOlrp94=;
        b=v/2qyScQpIx602VW77G/nUKG6hLG9SzOxZq7XfkM4WYAfP8kAbyiugFi31vNvt0NvK
         WUUBBtPx/BKlRvVfTB3jhJ3GszD/f9p6XowuEKdj49irSQ/jslWTnduPHal9PQsSDcxu
         OJdwjhcljG+PG6eRzIpB47uBxzk3bjz2VjTrbP4AUmo5ZhZqaWpaNB0TDkB0JHBf+A8s
         2D8KSYnBIpmj7q1c4B0S4OMjitJzrLHOC0abYezuiR5pMmzzlobsIYz6cXEMnLMbDoKM
         EH87fQc5VQIUieL0oWj42N6VfDcp114+HRRmwOV8bAwsyVr871+Oj2GbjV0stgDoucTM
         KCKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712938323; x=1713543123;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W5JT8K7AvdRwgx51et4e9LWrdmVm7FiW3UD4VOlrp94=;
        b=Jdb4cjArK4BXdSbwIOnIQrmq9RCjXnyWVO4bbsuV3wGys99dYIDqf+virSearIjfnu
         khgLf+qepbeIOPwD9pvKxRCAa3OjLbndE4ZIWZoOudEPhpLt1a/qLYlFZP73GScSiBsO
         oO4VR6YZLdxBf6nBH14QBjGIXEV28Uidpj1MChJ3Uj0PeCFwl1hOVbJ584Yc6/cku657
         aJMSSzX+sktmNWubtCfL8+unvq+X1p0JJ0bwerik//h4URXsgnPbzKkayldhNcigy2G5
         FItyhurauK+R/4MAbrAWl2QX3PWp62RYTsmqPrz1m+5o6SmssckIgCtgLwP2ner3EUEf
         fdMg==
X-Forwarded-Encrypted: i=1; AJvYcCVPgps7u0W5D0A4se16bH1Cgh5HEqX3j5OaURwT0mUhZvnFDvmSXJI393A3m9ST5EYkiYFQp6Q6UdzR8IBfzbOR9sXEnA==
X-Gm-Message-State: AOJu0YwDGV5eETnDv4gyZyDb6iblrO96N16N+85lXtB+UgsUoFecv+8x
	qKpS7tQ2tr+49XFHJxDt7Q01wxKbPxZluf6Cugnf8xCa4bWhkfyx+pUuPVDC5NusBlM5TNUWRPy
	op6qlBc00nF6L3cvomCnaJchJ4QWYoEW6xAI=
X-Google-Smtp-Source: AGHT+IHRBVk7zH7YF+KtpjONjNtA7XUyVLa+CfCQyQPDJV89nxPfsVYooQGyNelh6x30YUHFeLeDGJ02K9QJnqgTZ9o=
X-Received: by 2002:a50:ccda:0:b0:570:99f:6c2e with SMTP id
 b26-20020a50ccda000000b00570099f6c2emr45146edj.1.1712938322737; Fri, 12 Apr
 2024 09:12:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240411-mark-kselftest-exit-funcs-noreturn-v1-1-b027c948f586@kernel.org>
 <CAGG=3QUNPGtQ7OqzEtNW9BQET+a+1WW=h++CqRTHRY=YLrOAcw@mail.gmail.com>
In-Reply-To: <CAGG=3QUNPGtQ7OqzEtNW9BQET+a+1WW=h++CqRTHRY=YLrOAcw@mail.gmail.com>
From: Bill Wendling <morbo@google.com>
Date: Fri, 12 Apr 2024 09:11:46 -0700
Message-ID: <CAGG=3QXzs0VdaQjNtGD6aKEPXCy1dGQ06BSKww_HutB-x7BuMQ@mail.gmail.com>
Subject: Re: [PATCH] kselftest: Mark functions that unconditionally call
 exit() as __noreturn
To: Nathan Chancellor <nathan@kernel.org>
Cc: tglx@linutronix.de, shuah@kernel.org, oleg@redhat.com, 
	anna-maria@linutronix.de, frederic@kernel.org, ndesaulniers@google.com, 
	justinstitt@google.com, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, patches@lists.linux.dev, 
	John Stultz <jstultz@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 12, 2024 at 9:08=E2=80=AFAM Bill Wendling <morbo@google.com> wr=
ote:
>
> On Thu, Apr 11, 2024 at 11:45=E2=80=AFAM Nathan Chancellor <nathan@kernel=
.org> wrote:
> >
> > After commit 6d029c25b71f ("selftests/timers/posix_timers: Reimplement
> > check_timer_distribution()"), clang warns:
> >
> >   tools/testing/selftests/timers/../kselftest.h:398:6: warning: variabl=
e 'major' is used uninitialized whenever '||' condition is true [-Wsometime=
s-uninitialized]
> >     398 |         if (uname(&info) || sscanf(info.release, "%u.%u.", &m=
ajor, &minor) !=3D 2)
> >         |             ^~~~~~~~~~~~
> >   tools/testing/selftests/timers/../kselftest.h:401:9: note: uninitiali=
zed use occurs here
> >     401 |         return major > min_major || (major =3D=3D min_major &=
& minor >=3D min_minor);
> >         |                ^~~~~
> >   tools/testing/selftests/timers/../kselftest.h:398:6: note: remove the=
 '||' if its condition is always false
> >     398 |         if (uname(&info) || sscanf(info.release, "%u.%u.", &m=
ajor, &minor) !=3D 2)
> >         |             ^~~~~~~~~~~~~~~
> >   tools/testing/selftests/timers/../kselftest.h:395:20: note: initializ=
e the variable 'major' to silence this warning
> >     395 |         unsigned int major, minor;
> >         |                           ^
> >         |                            =3D 0
> >
> > This is a false positive because if uname() fails, ksft_exit_fail_msg()
> > will be called, which unconditionally calls exit(), a noreturn function=
.
> > However, clang does not know that ksft_exit_fail_msg() will call exit()
> > at the point in the pipeline that the warning is emitted because
> > inlining has not occurred, so it assumes control flow will resume
> > normally after ksft_exit_fail_msg() is called.
> >
> > Make it clear to clang that all of the functions that call exit()
> > unconditionally in kselftest.h are noreturn transitively by marking the=
m
> > explicitly with '__attribute__((__noreturn__))', which clears up the
> > warning above and any future warnings that may appear for the same
> > reason.
> >
> > Fixes: 6d029c25b71f ("selftests/timers/posix_timers: Reimplement check_=
timer_distribution()")
> > Reported-by: John Stultz <jstultz@google.com>
> > Closes: https://lore.kernel.org/all/20240410232637.4135564-2-jstultz@go=
ogle.com/
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > ---
> > I have based this change on timers/urgent, as the commit that introduce=
s
> > this particular warning is there and it is marked for stable, even
> > though this appears to be a generic kselftest issue. I think it makes
> > the most sense for this change to go via timers/urgent with Shuah's ack=
.
> > While __noreturn with a return type other than 'void' does not make muc=
h
> > sense semantically, there are many places that these functions are used
> > as the return value for other functions such as main(), so I did not
> > change the return type of these functions from 'int' to 'void' to
> > minimize the necessary changes for a backport (it is an existing issue
> > anyways).
> >
> > I see there is another instance of this problem that will need to be
> > addressed in -next, introduced by commit f07041728422 ("selftests: add
> > ksft_exit_fail_perror()").
> > ---
> >  tools/testing/selftests/kselftest.h | 15 +++++++++------
> >  1 file changed, 9 insertions(+), 6 deletions(-)
> >
> > diff --git a/tools/testing/selftests/kselftest.h b/tools/testing/selfte=
sts/kselftest.h
> > index 973b18e156b2..0591974b57e0 100644
> > --- a/tools/testing/selftests/kselftest.h
> > +++ b/tools/testing/selftests/kselftest.h
> > @@ -80,6 +80,9 @@
> >  #define KSFT_XPASS 3
> >  #define KSFT_SKIP  4
> >
> > +#ifndef __noreturn
> > +#define __noreturn       __attribute__((__noreturn__))
> > +#endif
> >  #define __printf(a, b)   __attribute__((format(printf, a, b)))
> >
> >  /* counters */
> > @@ -300,13 +303,13 @@ void ksft_test_result_code(int exit_code, const c=
har *test_name,
> >         va_end(args);
> >  }
> >
> > -static inline int ksft_exit_pass(void)
> > +static inline __noreturn int ksft_exit_pass(void)
>
> Orthogonal to this fix, but why does a "no return" function have a
> non-void return type?
>
Oops...That's been asked. Sorry for the extra message.

-bw
