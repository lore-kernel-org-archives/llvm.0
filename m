Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F37A37CD42
	for <llvm@lists.linux.dev>; Fri, 13 Mar 2026 12:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773405670; cv=pass; b=E7D/W9OrkdtQHKQltFm95iFzq4vYtkbyX2UEfcV3TiYR0tcB7QCgxjkuCo05NmgikPQH4TLlM2/6DtrM7m3dqP+T5gG2esJoyyqwlw8vXkOt0ecAC4fZFvld5gzldCATd6ExIXI0eIW5mECOaO44M3Lh0KK6yTAZFB1R/xZF3KA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773405670; c=relaxed/simple;
	bh=EMozAAWSnFJUelZV86MxnthF2jzYtuMYjm23DlNldWw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rWzKhluiYfLH6/Mp80Rqkz6nbhusdBinFdNx7oKxXk0012sBB+PxqiGRYCVNsgdDz9Hm0Y+ZmC6TXzLpGssBdsLS8Eugc9di9PUWdTHonJcY/tBAEKOxED5sKFYBqkZzV2/nWVbuIEamDzz0Mo1Ja/2UK4lGRMzZj5FrX6NRWPY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=p748UdTB; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="p748UdTB"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-661ce258878so10385a12.0
        for <llvm@lists.linux.dev>; Fri, 13 Mar 2026 05:41:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773405667; cv=none;
        d=google.com; s=arc-20240605;
        b=ZAfrZo3/bfBkGC1nJl38vpQfelWKLIJErghRHJ/ihsNNg4HVuaVQTXoXcndEPHB0YR
         voMsZ/eE+N/GTndEBhuT9XcbZWcDyMkEKvizeNtO0cteFq9RYXWLsYqmblelTnPuarH5
         YVkGNLi/CM7qoJtKNDca1vAcfn6ogcdfpgHbkq/q7oWMCWjz1mO1V1Vmo3trRwBI+PBH
         MrsETymQkgJdvJxe+30hrVU+bwk37UKCwxcX3S3NMkebeWaQQ1PkQ2xcYtiecdbRUW+i
         ehGhZZph+PT+3l7rHUNX9xehkyKyf/3UhBkdMKNZpIfntWNW4zzU4bcyHpxLQ00SbW4l
         L20w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xYGx2mEIZB1/xfXeiI85UtX0lshuCczBTfo+165seyw=;
        fh=UHRP2FchXHzXqpEg5kC/rGCvxMafPNUP4lSahMmvaHs=;
        b=A59LSNSZ0JUCKrfPs51XaE4uqnUiXtZQ6aol687Pb1DMJrMd5vzEqBcVafbt3TRMCB
         3G7q8qJI4XT1o1aPeT4Um45haUIVz2V36Glsw1EKmgqdzqL33ec4a038rUcIrQzROpch
         glQwJPtFbfgzE+17t40OvUdZYocGFa3ZXv0Qg9oMEoigwNF1wZlv/goWQXlYFmeejVjr
         qCe42ioN+FwKQBbjFEwi2KtK/USFk9kh3vi9wXh+sfsBOgorVcRvYJWtpBnUJqGuBs8U
         BWPazZpEVS7ituaO27Z1sW2M7dKC/X3L1LzgmM1ccrwNjEh/Tf7U8mGtFJ0ecw1kObDb
         Sdwg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773405667; x=1774010467; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xYGx2mEIZB1/xfXeiI85UtX0lshuCczBTfo+165seyw=;
        b=p748UdTBp8cd47NZAL0Mk+4Q8jcrSP3RpxzVLav861BU+5wfyS6tlSsqopDc71zCSC
         ivbcMQLnjqcztIPnUXKNlXnhftSXYXp9TTvEfjGVTJ4liZCBMn3aiEaG/BADt/R7ZIS4
         9w+qUgUWnJLhST78xf/OK9NxSMBLtvpE6zc0YbwvQ4nlAwiMgpW2JAS1fVWu0+mmGWOr
         dLW5Uiw5P7KUiHoKNfom5y4M7Ouyg9DEmeVoVl6NLfylJplpnsWvEwS5DveG7kLIEG3B
         J3+Ic4eja0UrgWQlXs+hBI1Wk+JYQtfxd72A+6XD0BW2/mLG8awntPPUhIuIGNkgR46/
         WOwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773405667; x=1774010467;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xYGx2mEIZB1/xfXeiI85UtX0lshuCczBTfo+165seyw=;
        b=gmLJMhnTpjkkQdzj7QA88+LCHY/PMg64UaVYGDvX6J0QD/5qA77hMSWQ0NyNnFZJn4
         fwMM4U4rirSnmRaxHk2748TMi36fXIdlqAmgGJuU6DoSt5fOfXK1guuCIdLE6B5otP6Y
         +LO+OL178x2RkIoovK4Z+BD3YOlVBmzQgZSVTDy9rPXYDjHSYO6sf5yN7gWYzLH9DELh
         ioGMh4rvYfppz8awYMwlT/PfIU+I/aOwMBXmnjLr7XM3kpCwCaa3XVNH6r7U7vDSCdyi
         YuAsgO/zo00/znS9ABNLVYRi38eFb0ZIb9pQLzHCwDt0BWALUAN/ND18og3FMoaKFfBk
         xYag==
X-Forwarded-Encrypted: i=1; AJvYcCUbwHX0y40oqOxh/jeU0Yueiy0GjE7b5g1SDAINGsVy2Qe0Hgf/tYiaIhWebO9cKEhBpVuC@lists.linux.dev
X-Gm-Message-State: AOJu0YxmIoXyq1XrteNuq4hQ7runNzXTFpevXfG3UOZ0ZfFNnX6vSSXo
	XVdi8014smmV0C/BXK3w7qVN0+d/ZMYfi4HFq+1XHxIb3kJ38o7ayLQYUMNSNUaeV2TjwOwfOqO
	cjy9BtiriRbW96L0/tXoq98OKFjFKyP2UgkHgefkw
X-Gm-Gg: ATEYQzzeWsdqULgaMpGn4vx7MpSFZdKHW0Ds9NZ7JEQlVISJaJnqhz18qQBxKBKVq3K
	WzoLGlK466PiMmNVvv/9Js+ocvZNoQAf+oti09AWyQ7DrWgyc72AyL5Qqp484dKLUBB/RcCAlHM
	NigpAlVdwP6B9ykEKFRq03Yo1hooepXiVGwHbFQyqjw1K1FketlKkSCfb1reHMzsaTL0SZk78L7
	6BcPeRCdjV1LvK2USSE2TT1BW4ctRcfQ7kS1pCanz6/y+yDlYAWRuSzpGvORowC1Nm72LvfnIPb
	kt9sOVlEkdoAliJ3iFjSav3rzi9UgR+WvNlj
X-Received: by 2002:a05:6402:a294:10b0:660:bcdc:af50 with SMTP id
 4fb4d7f45d1cf-663bd2d456dmr19000a12.6.1773405666960; Fri, 13 Mar 2026
 05:41:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260311-kcov-extrecord-v1-0-68f03c4a05ad@google.com>
 <20260311-kcov-extrecord-v1-2-68f03c4a05ad@google.com> <CACT4Y+aLx-ZG7FqYNrhrABi1bgNo6AnG5JL9tq+mCPRAnx37Tg@mail.gmail.com>
 <CACT4Y+aXejLgWT=56_d-D04guRUi5iAnAeR-rV_Q6n4qL5g7aQ@mail.gmail.com>
In-Reply-To: <CACT4Y+aXejLgWT=56_d-D04guRUi5iAnAeR-rV_Q6n4qL5g7aQ@mail.gmail.com>
From: Jann Horn <jannh@google.com>
Date: Fri, 13 Mar 2026 13:40:30 +0100
X-Gm-Features: AaiRm530hfORxmkUBDEarDpQOiNDlBDBt4dqsIL4nOCxseky1NajwtHLyN1UmCE
Message-ID: <CAG48ez2C9aAz633RPqDFZ2e0_Thr-bzf9z8KbfJ7p6n=myV+QQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] kcov: wire up compiler instrumentation for CONFIG_KCOV_EXT_RECORDS
To: Dmitry Vyukov <dvyukov@google.com>
Cc: Andrey Konovalov <andreyknvl@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, llvm@lists.linux.dev, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2026 at 8:59=E2=80=AFAM Dmitry Vyukov <dvyukov@google.com> =
wrote:
> On Fri, 13 Mar 2026 at 08:53, Dmitry Vyukov <dvyukov@google.com> wrote:
> > On Wed, 11 Mar 2026 at 22:06, Jann Horn <jannh@google.com> wrote:
> > > @@ -202,15 +202,10 @@ static notrace unsigned long canonicalize_ip(un=
signed long ip)
> > >         return ip;
> > >  }
> > >
> > > -/*
> > > - * Entry point from instrumented code.
> > > - * This is called once per basic-block/edge.
> > > - */
> > > -void notrace __sanitizer_cov_trace_pc(void)
> > > +static void notrace kcov_add_pc_record(unsigned long record)
>
> __alwaysinline just in case

Ack, will add in v2.
