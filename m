Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E40365A11
	for <llvm@lists.linux.dev>; Tue, 31 Mar 2026 17:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774977404; cv=pass; b=uobo3L0Ho2aVfIEqbn6vL0xkp3pAXdWCUMWP3frrn5DeHmSaEwuWiN5EfMYirP7/eJsqtnwyky+uQzFlvEAR5IKgmjnjETLh82T2tRfhIRtJoxlMOF55mDJ1FbqHUcgbuPMAbYQs95z5IaNslUHiivKEdSDAmnssxP/GTiwFifU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774977404; c=relaxed/simple;
	bh=AlaAv/oY4ZLWVnm12PAYx9dKZ0BFTL5ugcVHQKGpG3o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ru1ObEh6dO1iQoJdVAfRrKwFTaKTbBQRBYQrFyVS0mo067TR/tDlnfK6IJi+rqqCqEEL3Y2LfRILSKPRps8oLdjEt86yC5D6eZ7ef6EtR0HzQmow4r/gxhia2RmPP9ty/Eyrr9XScUsLE77M/Y3zk1qbpVnRiuYG/IOUQdScWkk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FXFZRYty; arc=pass smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FXFZRYty"
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-60567e76830so9739137.0
        for <llvm@lists.linux.dev>; Tue, 31 Mar 2026 10:16:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774977401; cv=none;
        d=google.com; s=arc-20240605;
        b=CIAljrPgBNafW2JvreUxqPka7dwiY0tGR044dXTwbV1Mao4651wg1b7CPpSy81kj5K
         LxPcX/XBJGqpBA0JrMVs9cHaXxErYnrCupuIqYjq3IC/V6AbXO6aoLJIEqa8xD3USBN2
         iG9Rsx/saw2KdQ91/uni9e70/EAfQPI3Kg+KSC0hXmb8AEqj8KCs13kXoHu7GX/SgeAi
         sq7PX9lu8RWPNFGwSJk+Q/NZaQi0zdQ9XIs/7L5Aq6T36MYvhwEW5rYtjliaKyEwAoce
         urJzHVcJWtYb7DT89emwWs8NY3ZQWUKOZsULTDn3BMNWX7rM86pJh4GvSqq3rJvl4fGs
         BJuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8hJONhGlSkQz5oARDr2KezeMGnAwxGjBhhSBkIE6ImE=;
        fh=ekDNQjanqUuzgCHyVcAPAQ5I7mMzoqIQFgh1F9dOR4Q=;
        b=S2d/OOaJGxorw27k7VpwhCdo1FzMWuEALoid3GICkQLPL8RwG9mBYO+1B7dLjqDl9j
         vxaPlJNNI8G3LkT2eTRgZCIed2d0VaV/mfstZj8yGWqFxUXs8RzGVcIBNdWre71EyAsR
         PdLg6MCyQmxNOobYexbguEJz5rfbaKSng54adV5umVQJ4TnPd4rcyEFHYJKsFuhlhkyv
         TB9/gjxUdsG22n2txJo1zLliSmMdStL6TWTwIeV6KC5uzaAg9zJQp8rfV/gthK1Dnse3
         vm9UNZOHKGeRmlRYPXsH4pZtYO/wSbShzuH5q8Y24F2oDORe3RvWrk/RQVCimJNNLz35
         LISg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774977401; x=1775582201; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8hJONhGlSkQz5oARDr2KezeMGnAwxGjBhhSBkIE6ImE=;
        b=FXFZRYtysFD64IRl3JpICjvEXHcF8sQIjI4Fu0EcbbIgSZogoaS1M5jZiXHlVQ9CFG
         vbS0pjoYYz53xinXk8PIW6m5ZT38/U/QHC8YkHNLL3OMj0I8I7wlSrUFGGcMLtsvJab0
         gQJEV83jqp57yzIFI9SzQCKyMLthm+iNk0lrmcfWxTd2AsfXSVqaPqG3rIBRWXuIvkI7
         Cbbmg2d3qomabAN0p2H2cXnXT9egUuYTLQn6/PwDAPv+ERHbnktDXdaYthE7g6fxXXPM
         GCpER+Y8WnF1N7NXo+3M1Ctj7XxaPH+9dYIvPEaQY/152gGvpeQx8pFjWqPugzAo3nzf
         uCrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774977401; x=1775582201;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8hJONhGlSkQz5oARDr2KezeMGnAwxGjBhhSBkIE6ImE=;
        b=ZQ0Arqn/A86AJPeNkeqMnD548V5i778X27YIA1NHW1TtYXVSrgKYtKMsLle6Mmjq2R
         RR0EPe0KGnZfawRikR1CzrzaozC0sRUlVMzxwAtrxBUl/ytAEIMslk9Ah8uTw1URY3gz
         rfuqb9jPujdsw9cdfXNq94nGeV0GtDH0pkjJqDWsh+OMH8hsnCXkKjjzWMfZDJutos5D
         kobdjZabQCcQtJn/aOpF85NOqws7oEsyoZ0GMfYUbW9YfH4TA8cWElDsEiOyjkGqd3Cc
         h5H+6KrpBY/P0biPHAxTTflNpEg2Pgc9mvY0YcayrKDttevlcX/ZmhyIFoCwYAIkRNra
         vr6w==
X-Forwarded-Encrypted: i=1; AJvYcCUdCIsoa8G7OqrfA73/lvFcq3pDxCovh2m5KZT6+9LX4BcAtniBVPR34c2kMzJzwaWf4Ci+@lists.linux.dev
X-Gm-Message-State: AOJu0YyD+Tn/l/OSrxq0VGN882ZkefjCTGwvjbVfsSk6+YQ67uqZusNP
	ft6uoub6K0l3ODT2IB5bsm5ixKrf6iv+27piwe9CjwAEOCk47a+VXc45ul2bS7k3U1GS9jXw6w2
	m6yZqRorlTFrRA8oGel7xehjnSIXlAV3jq0VYAA8Z
X-Gm-Gg: ATEYQzxU24DbLRGlvL3J/gmI3tLnLsEA9iQe4O0+ArONF2J2Z2C/ZBFlq4fSXOsxmGd
	1O6Bsqf+RNi7iQo1hnEEGZlI7pCh1vZWgxUzpZZJcdWbaLrF4j/wZcyD8WNc/NX6q2I/9DM4y3E
	/e8IsHYcu4mQHraPgFE2/drn4wLTIVw1D2VtETns3Bij8mntSNgMJedCudi+BnDN1V9p/3Q20aZ
	xBfNaujhN2/P01C47tSsslooqlP6wyx8BGjgC+GvpCCvrkYFX5O603O3kiwSxnScp4a9NzvS/3T
	CEyFI5o=
X-Received: by 2002:a05:6102:c94:b0:602:ace8:f20e with SMTP id
 ada2fe7eead31-60567e8d127mr38526137.14.1774977400614; Tue, 31 Mar 2026
 10:16:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260331163716.work.696-kees@kernel.org> <20260331163725.2765789-4-kees@kernel.org>
In-Reply-To: <20260331163725.2765789-4-kees@kernel.org>
From: Justin Stitt <justinstitt@google.com>
Date: Tue, 31 Mar 2026 10:16:27 -0700
X-Gm-Features: AQROBzCGiv9foA1bZmO6VZEpCJ9MD_wSGSd-WaAakLK22vknVxHA_3Jppbf1n18
Message-ID: <CAFhGd8pqeckxVVmNrGkb51gdaeTa7MY3BvsRfWVBGd_i=oZxEg@mail.gmail.com>
Subject: Re: [PATCH 4/5] lkdtm/bugs: Add basic Overflow Behavior Types test
To: Kees Cook <kees@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, 
	linux-kselftest@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, Marco Elver <elver@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Mar 31, 2026 at 9:37=E2=80=AFAM Kees Cook <kees@kernel.org> wrote:
>
> Exercise the end-to-end build and trap infrastructure in the kernel for
> __ob_trap, __ob_wrap, and associated sanitizer ignore patterns (i.e. idio=
m
> exclusions). Add a test for each of the basic overflow conditions under
> CONFIG_OVERFLOW_BEHAVIOR_TYPES=3Dy, as well as the corner cases associate=
d
> with promotion, casting, etc.
>
> For example, executing this test with CONFIG_OVERFLOW_BEHAVIOR_TYPES_WARN=
=3Dy
> (instead of CONFIG_OVERFLOW_BEHAVIOR_TYPES_TRAP=3Dy), will show:
>
>     $ echo OBT_ASSIGN_TRUNCATE_TO | cat >/sys/kernel/debug/provoke-crash/=
DIRECT
>     $ dmesg
>     ...
>     lkdtm: Performing direct entry OBT_ASSIGN_TRUNCATE_TO
>     UBSAN: implicit-conversion in ../drivers/misc/lkdtm/bugs.c:825:10
>     cannot represent 'int' value 2147483647 during reference binding to '=
u8t' (aka '__ob_trap u8'), truncated to 255
>
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Shuah Khan <shuah@kernel.org>
> Cc: <linux-kselftest@vger.kernel.org>
> ---
>  drivers/misc/lkdtm/bugs.c               | 253 ++++++++++++++++++++++++
>  tools/testing/selftests/lkdtm/tests.txt |  10 +
>  2 files changed, 263 insertions(+)
>
> diff --git a/drivers/misc/lkdtm/bugs.c b/drivers/misc/lkdtm/bugs.c
> index e0098f314570..f00c9099957e 100644
> --- a/drivers/misc/lkdtm/bugs.c
> +++ b/drivers/misc/lkdtm/bugs.c
> @@ -817,6 +817,249 @@ static noinline void lkdtm_CORRUPT_PAC(void)
>  #endif
>  }
>
> +static void lkdtm_OBT_ASSIGN_TRUNCATE_TO(void)
> +{
> +       volatile int big =3D INT_MAX;
> +       volatile int wide_low_value =3D 5;
> +       u8 __ob_trap narrow_low_value =3D 0;
> +       s32 __ob_trap same =3D 0;
> +       u8 __ob_trap small =3D 0;
> +
> +       pr_info("Performing same-width assignment to OBT\n");
> +       same =3D big;
> +
> +       pr_info("Performing small-value assignment to OBT\n");
> +       narrow_low_value =3D wide_low_value;
> +
> +       pr_info("Expecting trap on truncated assignment to OBT\n");
> +       small =3D big;
> +
> +       pr_err("FAIL: survived overflowing truncated assignment to OBT: %=
d -> %u (ok: %d -> %u)\n",
> +               same, small, wide_low_value, narrow_low_value);
> +       pr_expected_config(CONFIG_OVERFLOW_BEHAVIOR_TYPES_TRAP);
> +}
> +
> +static void lkdtm_OBT_ASSIGN_TRUNCATE_FROM(void)
> +{
> +       volatile s32 __ob_trap big =3D INT_MAX;
> +       volatile s32 __ob_trap wide_low_value =3D 5;
> +       u8 narrow_low_value =3D 0;
> +       s32 same =3D 0;
> +       u8 small =3D 0;
> +
> +       pr_info("Performing same-width assignment from OBT\n");
> +       same =3D big;
> +
> +       pr_info("Performing small-value assignment from OBT\n");
> +       narrow_low_value =3D wide_low_value;
> +
> +       pr_info("Expecting trap on truncated assignment from OBT\n");
> +       small =3D big;
> +
> +       pr_err("FAIL: survived overflowing truncated assignment from OBT:=
 %d -> %u (ok: %d -> %u)\n",
> +               same, small, wide_low_value, narrow_low_value);
> +       pr_expected_config(CONFIG_OVERFLOW_BEHAVIOR_TYPES_TRAP);
> +}
> +
> +static void lkdtm_OBT_CAST_TRUNCATE(void)
> +{
> +       volatile u32 __ob_trap big =3D INT_MAX;
> +       u32 trunc =3D 0;
> +       u32 small =3D 0;
> +
> +       pr_info("Performing wrapping too-small cast\n");
> +       trunc =3D (u16 __ob_wrap)big;
> +
> +       pr_info("Expecting trap on too-small cast\n");
> +       small =3D (s16)big;
> +
> +       pr_err("FAIL: survived truncated casting: %u -> %u (ok: %u -> %u)=
\n",
> +               big, small, big, trunc);
> +       pr_expected_config(CONFIG_OVERFLOW_BEHAVIOR_TYPES_TRAP);
> +}
> +
> +static void lkdtm_OBT_CAST_SIGNED(void)
> +{
> +       volatile u32 __ob_trap big =3D UINT_MAX;
> +       s32 neg =3D 0;
> +       s32 small =3D 0;
> +
> +       pr_info("Performing explicit sign-changing cast\n");
> +       neg =3D (s32 __ob_wrap)big;
> +
> +       pr_info("Expecting trap on unexpected sign-changing cast\n");
> +       small =3D (s32)big;
> +
> +       pr_err("FAIL: survived lossy sign conversion: %u -> %d (forced: %=
u -> %d)\n",
> +               big, small, big, neg);
> +       pr_expected_config(CONFIG_OVERFLOW_BEHAVIOR_TYPES_TRAP);
> +}

Note to travelers and testers, we still have a compiler patch in
flight [1] that fixes a bug with sign-change instrumentation
concerning OBTs.

> +
> +static void lkdtm_OBT_MUL(void)
> +{
> +       /* Promotion means no overflow checking can happen. */
> +       volatile u8 __ob_trap a8 =3D 100;

<snip>

[1]: https://github.com/llvm/llvm-project/pull/188340

Justin
