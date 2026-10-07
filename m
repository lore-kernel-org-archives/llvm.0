Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C401E0E14
	for <llvm@lists.linux.dev>; Wed,  7 Oct 2026 00:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791331244; cv=pass; b=Vztw/Zv6MKMsP+AYn4P3Lqzbq1CBVw/id6nnlWhojpq0lo1bnRN1PywzWISXuAP84mfjjehMS9JhzWQZQ8fJWYf1QNqwnOwLdexTZQOGNo9EBDfQomz8+bgUKMzD1P6gOl12UMqdywYy/d9Sr/z/flBEZDZKKKLBy6ao9FpF2sI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791331244; c=relaxed/simple;
	bh=PIdZWKk7UsAxCtN4qvwS3WBKKGf+fKTzUBUtZtSSqJY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rl4E7piLp01LlG9Iyj2Jb1DL4DMVdi4iZ6wyRRNFMsj/gDBk5+nx5aODHphxHJh2mu0mWiIX36RB27TaABD9V7GeJQ0H/+9cvVZbzlQNMT/+OjUAN/99/WjBfQU+GD3+tbh2vlLOKrYzWujkI+fgNxunFjX4Rf6zM5I0/U0mWdQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WTNELbrP; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WTNELbrP"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a0a4aa99bdso1734785a12.1
        for <llvm@lists.linux.dev>; Tue, 06 Oct 2026 17:00:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791331242; cv=none;
        d=google.com; s=arc-20260327;
        b=AhNp2BB2lJdrNMDMsK4tTlE+YJ9mhPO9dXGjXdMl1XgLMMmsX3tqQtSmrV6VYm8Sm1
         dNS5/nRKPYc+IodT3tZyMwIsX/licDWBBKbQRBKyCJbQ1sPGHaVSmIHHWrzn0nOdhuuA
         STdl75+rFtNPmjyNRL1EchM7jiksWKBF8ejW2J7cLuB9h56xHy+iHWsigHMhtT/xhdks
         DJwd3e92NRjuhg5XpWFVpMHZrhnk0fDIgRtMV7njYSWlv3vX4sFnBG0zNcc65ByCDqeo
         fggXcP0v0McC2/7pFcZ0aE/i9C8gXfc7RSCOAEWZkLNoKiKf3ra//xlmdZcedpNcec0q
         VHlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NCYMrF1COiQ5G1aO6E9q5ZQQkQbwsyS+9CvbT88FRDo=;
        fh=D5C5XLNtFLpz7jBL9Xd7+9xtqaMc9jNsFcteI7JF7UM=;
        b=GaykMTHaumiFvwumblnMCY0QPb/evRN+8iWjKHW46xE5BxDFu2m2wzbLFwl0iKfV0H
         XZgpZshUe9t3iIpwXidhj+GUmFgWsTonTE0Lnxit0rDjdkoGSYQQJ3nNuTDTZSnhD++M
         BVTlX2irb7D/Z7zMGTy60/YaI1Jl8b4z/j5PNs8jixs16qENJRxKj9SS3INgjEAerp5V
         QcIdLK/c7cQjt2JLC50Ebt3hR9fr8CRhNgwF08ERjwtH5UqYFi7IRTtjdTNqQImMiXO2
         4ZRJzJyYOr+2b0XipVcXTHzqElO+hxsDrw0k1aUaD9HzaDzujBiJ3AJmzfSsW6jKt6hW
         1MLA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791331242; x=1791936042; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NCYMrF1COiQ5G1aO6E9q5ZQQkQbwsyS+9CvbT88FRDo=;
        b=WTNELbrP84j2GW5vQ+6zyTBvnWFC29jtVwaAVBCrtffKa2z1OSls3annPPdw8GNmoO
         KlcTI/UkYmuNu05bivQoqQeonoKiPxUedSdbquUWSFkVe+XqO/ud0S2o+wvSAvgTAi6w
         KMddMDrxmXq4KR/4CfY0AjGwyzgmxonH91Sr5Q8lD3fOX55HyAzsZFtP0e9oK/0ITOAw
         y2KiA6VLBAwLOh02WeeBJ0PJE+M0Y/Trf4SuHOLSbrtkcMqcZS/9hJnHDmnEqh8vJwOd
         vM6MjPkbLbJ2syRIBeHtwKJ0Qv1B0j/V5C8geFFvTUpLJZ00HOXV7DjYN4OUskJy0Z8g
         s8Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791331242; x=1791936042;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NCYMrF1COiQ5G1aO6E9q5ZQQkQbwsyS+9CvbT88FRDo=;
        b=LXWj6G4sMshhj3/lGMcDJI+Bm9efBPfR1fd3Xb8CzLqstHL3jzocWzmsp80FV/eszL
         eJ72i1NufafSi2gILNLjlLIqqaJ2bV9WJaI1Ud6lZI6FymTrewkpvpRdSH8fgFiQ21Fv
         OOTE/xsjMjE83qPSlZ4UfQnKF+A26ZmLaIUmborlS+2EZhcHze086rlpd9hzaNYJ4WhQ
         6hyjeect8+4hoJvVf2/22aB6dgBdbJjrFC8DrUaKStVk9fzCSUhbCTDgbw9VtDb+8KJr
         TUoOHiRrmzOyna56yLQRtTIpQbThXOg78UMjgQFp5FDRGT+cyeaYTMbkQyvy639RA59T
         HvcQ==
X-Forwarded-Encrypted: i=1; AKwUvByS3w/N8mU1KFUTnCnZ5zWmN/0iCW93+2UO4VwTtFLYFUA7ZmNEvi1YOhbCIUs/vAkDlU9P@lists.linux.dev
X-Gm-Message-State: AFq9FYIeqLJ6qS4m/YZxBpenaWxyP4tEk8KrfdMR0p73Ho6OJicnIPmQ
	b3s9r78YqArEvYDpk9sTpHd5AkyEngxIpRFFoDaSt9UyBrzcDQgVL7kP5cSsB2Gl68ed3KbGkQx
	Vlh8/HBArqsAj+AkemRuxyK/Qgj39RLE=
X-Gm-Gg: AYBFou1s99Qgd9aUhivpJ5BeZXkVv6WQIwBl/vGBN1hS/6IUmadsQ8mbiT7FqakaNKL
	5trNJeRJcaSBGHRnGWB1MCWeQjlmclB5AwG7f4h1A69dXbdjRAPHLi44vTgTz2ELLnzLTbwBJM0
	AoL/9y2rJzWIDi9U1xuwIRnoXfdHMxAZ6IVWBRXcpd7OXMBfkAxlA/gjpMZ0CsM6D4RwmJku/PK
	KAqGN01OPcgUdzBJwYabbKA6RlagZWZtEk/GQ/5Un0CK2XeBh7UPUY1tc51tLA31QnRfc8yE74q
	jLSvx7S07hGbRCFxhryjjbzRza9rBuqZTL1VzJmotpBmAuf5SJK/B4vpM5SozoVenkCk34tbfiV
	/yzhUMsU23RXO4hKuXmw0IM2xPEoPhHQN8RNjl4fo/0nb5IRR2+UPMuoogaIkaUB45YiilvyeQS
	Q2T/GNRGuVvAJGRxZuk6AaWGbZwm0to2VBhupCQnH32WN8XkGOTmcZQK3ENVFiAEn2Qg==
X-Received: by 2002:a05:6402:13d2:b0:6aa:fc60:60d0 with SMTP id
 4fb4d7f45d1cf-6aff47a079cmr524195a12.33.1791331241682; Tue, 06 Oct 2026
 17:00:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261005203930.246598-1-rosenp@gmail.com> <CALMQjD-udSokCKS07VFWauBQzac5BTPJqbORhskxgddsuX1vLw@mail.gmail.com>
 <20261006083103.GA3041473@ax162>
In-Reply-To: <20261006083103.GA3041473@ax162>
From: Rosen Penev <rosenp@gmail.com>
Date: Tue, 6 Oct 2026 17:00:30 -0700
X-Gm-Features: AclHuK9oSm_T0yaj7kOWt6PgPFJ1d7MNcK17mxS5H3gv7-Ov32c6fYi7L19EGq0
Message-ID: <CAKxU2N-ZE7dwiGzVgxDYFvm2R0BE0nah2WehGcjpym=Kq68dYw@mail.gmail.com>
Subject: Re: [PATCH] sparc64: Define p4d_page() instead of stubbing it to NULL
To: Nathan Chancellor <nathan@kernel.org>
Cc: Kjetil Oftedal <oftedal@gmail.com>, sparclinux@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, open list <linux-kernel@vger.kernel.org>, 
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 6, 2026 at 1:31=E2=80=AFAM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> On Tue, Oct 06, 2026 at 09:59:19AM +0200, Kjetil Oftedal wrote:
> > On Mon, 5 Oct 2026 at 22:41, Rosen Penev <rosenp@gmail.com> wrote:
> > >
> > > A sparc64 allmodconfig build with LLVM fails in vmalloc_to_page():
> > >
> > >   mm/vmalloc.c: error: performing pointer arithmetic on a null pointe=
r
> > >   has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
> > >
> > > sparc64 defines p4d_page() as NULL, on the assumption that it is only
> > > used by stubbed out hugetlb gup code. Generic code now uses it in
> > > vmalloc_to_page(), ptdump and KASAN. In vmalloc_to_page() the NULL is
> > > used in pointer arithmetic, which clang diagnoses even though the
> > > branch is unreachable on sparc64.
> > >
> >
> > Has this been reported as a bug to the clang project?
> > As it throwing an error on a rather obviously unreachable branch.
>
> Technically the error part is self-inflicted on the part of the kernel
> since allmodconfig enables CONFIG_WERROR. That said, while it might be
> nice for the compiler not to warn in any case of dead code, that's just
> not how it works for either GCC or clang (none of these should be
> visible if that were the case):
LLM suggests as an alternative:

/* sparc64 has no p4d leaf mappings, so this is never called */
static inline struct page *p4d_page(p4d_t p4d)
{
      return NULL;
}

Not sure how to proceed.
>   https://godbolt.org/z/K3nfW4n5f
>
> --
> Cheers,
> Nathan
