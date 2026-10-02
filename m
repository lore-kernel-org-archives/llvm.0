Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C303440658
	for <llvm@lists.linux.dev>; Fri,  2 Oct 2026 20:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790973781; cv=pass; b=Gau6ARZOwFhivBRY0Dnl6sOTDBwNoZIxpeCSC7URMFfA2L+UBst9qvYqGNQ6o4B+KRFQGJlnS7RaLltwUhhgKsv8DkDkNa9D5BHcJPprvpW3kYWIaXGO3ggaYWHKtkZR7eAwJpqVVMWh6lN3aBMDQ1ruO33nVeYBkFiFV9GNvtE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790973781; c=relaxed/simple;
	bh=O0oErUdvCGd0lNeKXzKbX7E7eK5xVZTCX98mTa3dJ6g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HyKUnpuPXLNE80+/OFRtcRpYuhwylYuo16bonQgHJQdhOWork6vQ+5iFEBNZk1OuXREOVFMu27LG8TfvnzTaQNLjtIlQ94RG7GpO1e3x8NIr6dyaSK3qtc6TqtXluWYIzd+BKssfma5jsiRxUGfdjQ1GZKN+GOetF1cEeXxxkKk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=A2DpZPug; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="A2DpZPug"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49fff72474fso1725595e9.3
        for <llvm@lists.linux.dev>; Fri, 02 Oct 2026 13:42:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790973777; cv=none;
        d=google.com; s=arc-20260327;
        b=U3w2yq5OWMlrpgJiR4UaGVN7IgUO5ANSh0l2KTyYu/VM/guXNQDulA9+WdKDOcdSIu
         VKyB1JFk9qOymbKtZMcD7JYO5r21o5EDk6EM8Zi5swb1RkNkjCqLoSbJbeX/mMxl0H/9
         qZEdV+zZUVV4Sv6swswr56kjkIR/fZhO6AjFAgHQvEsrV2NkMcGzRS5spMa2kd1f/pT0
         3RWEAmtcRwiWPDphygvRj6/WD7q2aJvBlTEUCncgzDrXNv2keGluIvtOZiLSAxaeV2jZ
         DiGQeymuWHoKTz3GXJjJg2al4AmE5N0yl9K/c0GxwPClKrJZC/3pU0n0IOZnltVbqE8b
         36Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2B52yACNSq43ABlpVzKEc+uObRnusBAROE8TzluhGEQ=;
        fh=i5XTe6A9XY6J303Tg/Jgsq3rUsQ0qx53fgiT8CLcIfk=;
        b=JbuZ3+l0rJywQJXwc4EIK90a+oTsS1ukSYIL3tzZkjYd1zf3fyKXq/wB5nScbApsqK
         IbtLblVskukEfsqb0HsdzkUChruIH70rr8hPxKQUGmljUSqsysKIdd/n35yRpV6+UiVy
         zQqFdpvUpwOJSPTQLBJVt6ifddsJwlFb9vbhT1i53iDBjS12IpdSU15EJVkzexR5e7uY
         L61a4PVvzxC2w+284sQiKTZ1DLhNNPzThiuUv45JfkIUoUaw4aPPnrsuD2d8pfskPoiJ
         Rue/3XCMlk498hKCQhtgn2nK/hh+R0iqvzLwWDV3T3HcBwtxpUNsoMrqsNlQYcs0ZuKi
         UnEQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790973777; x=1791578577; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2B52yACNSq43ABlpVzKEc+uObRnusBAROE8TzluhGEQ=;
        b=A2DpZPug9UStYJkQTZXvmMhEfHXijbjgw3McVfLqMd45gScLBksSzPeQCQ70KFp07m
         hvj2MlcnaoZMG4FkX46FmVbTRaVEbThT/nYR+6tvDILzaUkxpmgmmEFBlgzFRNYT9abf
         wzSdHDbdR5Et/WAIOofZwOlIB4xXJMm4QUBwHVyRHJjlK+WtgxcEnzEzlNaQoOa73Odq
         bVH66JjoUE9Tl5vwK87QI1kAu3MDix3mO3ZEuDKAyGz59JCeeHC5Kj64hKuou6C/oENS
         M9Lq3PRiZ1xcdswJnttfI+CEgG/Zzp9UQ7ET6kFYbuYwfcut5lbe3o73hnz67fkq67Bh
         c7/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790973777; x=1791578577;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2B52yACNSq43ABlpVzKEc+uObRnusBAROE8TzluhGEQ=;
        b=SYaY0x89S4TYPdWAI43tLeFSUQDz2bqwl8F8iY46w7pBWmiYKVUrK4HCWKVM6Po/yP
         wKOV41atDJnNB22wwkfYCRztWJklj/45ufP6EdPqulT1f5A0AGOdEagneA+Lse/Ku6n3
         VYpmNjpACuY6oRt0nSlk7+nYKC61BCrCW/zZmgRmUYBkuiV05hGXXSOs/KCDPLLLF5IL
         gmMv4BYcpWmMfB4NyWAc8e8ubfvk3+NClp3jyNIyTKJL0LjaM5WrIJ69y9Txizcrxm2K
         P6I/d6dQaMjsr5gAoNe4JWPFRFjcxsuemHIeWyL9JSatM7mEzhDCeh1lSJI2qUMOvW8u
         H9pg==
X-Forwarded-Encrypted: i=1; AKwUvBzNENqPvVeas31r6SMgK3zrRNnOXSPwj7DWdp2/oZGsE5CZMMrLN5lo8C0a0HFng3WpOkOS@lists.linux.dev
X-Gm-Message-State: AFuF++nqrc6S2ccFOt1sV01MZuIXS7RP4gSu0v3C+ENlR9txfC/+y+b3
	H1GUV1V2+7xseBSfXpA/CBTrItwHDdL5iQSSpmdH+T6Yix6RB3op/vuGuVEjo/4y7eXKz02r1zI
	bkQa/uJXtlqjWXO0B8MneFOsI4l8MNxhmTwKL077g
X-Gm-Gg: AYBFou1J9pk8IbUq5+L2mZaO8CyJ+JlVIgcPt04uOaD+s1FNycJs5XJIuwK7+F1J0+Q
	915DsGQbAp7SKu7MluKFuIBssjEGlhib6qMycHOxCIj06KzLAzMHTKQccr76SWoZyDcwduOqkLI
	3IlJI5XZZfiQeSeWsLxtuilQ6EGtsOGN4VMjkxNBFTDWQTFbz7G/RWqUV7n4gKXD2MgWCjuUH/E
	AzeD4esd4IksgJD+1Xz6rr6xqFa1//gMw+tLFdtElF03jut8GMRk4Uz+iWhxlxLH4hOSgU9rVVi
	uINW3SbD7c5vQbj+0Luwm93pLiICZK8c2aOuNshBoxlH9kIFafxHS15fTJlB0HgDV/VOG/FMmMg
	WOSkhCizDTP7rGLC/psxKP9KJd99tKLGGCfzydQrou6vDvdsZfLdyTp5e3NVthfT4Xhxo0g==
X-Received: by 2002:a05:600c:a011:b0:49f:ce78:356f with SMTP id
 5b1f17b1804b1-4a0276b869fmr57980835e9.32.1790973776781; Fri, 02 Oct 2026
 13:42:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261002-maintainers-stackinit-v1-1-27112a221527@google.com>
In-Reply-To: <20261002-maintainers-stackinit-v1-1-27112a221527@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 2 Oct 2026 13:42:45 -0700
X-Gm-Features: AclHuK9GtaEMxub0C4cC2iFOReeGZtM2r5F_DDQMeKZ3U6WaUokmOoRrco02awg
Message-ID: <CAKwvOdkjLkKb1503q6HOnJG5ps3iZ3GdTxP5B6rOSPEfkJ-PBg@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add stackinit KUnit test to HARDENING
To: Justin Stitt <justinstitt@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Kees Cook <kees@kernel.org>, Bill Wendling <morbo@google.com>, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 2, 2026 at 12:27=E2=80=AFPM Justin Stitt <justinstitt@google.co=
m> wrote:
>
> From: Justin Stitt <justinstitt@google.com>
>
> Noticed while preparing a patch to lib/tests/stackinit_kunit.c: the file
> is not listed in MAINTAINERS, so get_maintainer.pl does not suggest Kees
> or linux-hardening for changes to it, only the catch-all list.
>
> before:
>   $ ./scripts/get_maintainer.pl -f lib/tests/stackinit_kunit.c
>   linux-kernel@vger.kernel.org (open list)
>
> after:
>   $ ./scripts/get_maintainer.pl -f lib/tests/stackinit_kunit.c
>   Kees Cook <kees@kernel.org> (maintainer:KERNEL HARDENING
>   "Gustavo A. R. Silva" <gustavoars@kernel.org> (reviewer:KERNEL HARDENIN=
G
>   linux-hardening@vger.kernel.org (open list:KERNEL HARDENING
>   linux-kernel@vger.kernel.org (open list)
>
> Signed-off-by: Justin Stitt <justinstitt@google.com>

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4f72b4ac27ee..019f443af051 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14164,6 +14164,7 @@ F:      include/linux/ucopysize.h
>  F:     kernel/configs/hardening.config
>  F:     kernel/kstack_erase.c
>  F:     lib/tests/randstruct_kunit.c
> +F:     lib/tests/stackinit_kunit.c
>  F:     lib/tests/usercopy_kunit.c
>  F:     mm/usercopy.c
>  F:     scripts/Makefile.kstack_erase
>
> ---
> base-commit: 5e0f8396d4805a3e7f753fa58c8c55f1f3cc2160
> change-id: 20261002-maintainers-stackinit-230afe234e5a
>
> Best regards,
> --
> Justin Stitt <justinstitt@google.com>
>


--=20
Thanks,
~Nick Desaulniers
