Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4158342A158
	for <llvm@lists.linux.dev>; Mon,  6 Jul 2026 16:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783356128; cv=pass; b=jehchkc3BWW46S8Q0UJDx6JmmYow/SX6j93jQL+HFSvEpTV2pTkNOisC5Lbl7DGl0CD4Ee7Mtze0qFcP8lqqX/rh9sq11EdtLNnZRNs9bfvbuUs/BTjxXKOTBIy0CubTTkpiK6Py3Q7GPgZTJI6A1w/f2IraHv6SE0xB1SbbqGY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783356128; c=relaxed/simple;
	bh=VNYai2/KPlhkeALcWLLZ0ukJRHgn91vQcKUBUKFOdDs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ONGt57/a8ICSB/3p0FTLDsyQZTKLSfn5FXEBE8SppJbur/dNoiVO2542v6AOCvRN0xO/vsC/k9gK+/NpcLPuTKYSd1OW2+j0jrEySnCQ7cdb6LtK4FuxP3v98+WhNoqfGh36R4K97SR1nyK3ayvl0gfL4AYxegPV2i1MHGpYT4M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HYDOCFCv; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HYDOCFCv"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cca0c5799eso11515025ad.0
        for <llvm@lists.linux.dev>; Mon, 06 Jul 2026 09:42:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783356126; cv=none;
        d=google.com; s=arc-20260327;
        b=fxD4R1DBdaV/jVLZiClsRgXIoW3hU70tD3xA5P480PgnbG5XmGu8QFrTGLy2rMwxS4
         AXQVil3kF07rCryy52+lfIdGaWEJGYnWG8+k7ZYGBcm5gb1E/FK2ddDDqfOsdb+HMIps
         04qiXWNjFRl6AxgDWAjBfyPvmiRF8yefpp6iDBkH1jt+NukZWYN+CvV/AXAhL71CC3hb
         Cj8Od1EA2NO2Na0Q4XWqydlWzud2b3xo2k1K+hEspgO6OgSIv5XYPHvFoYonYQY+3ktt
         zZ9+azxFLdAYt0nu1uZXy7W5IL490bUBC+meAKX5MYfraZzSdnVyU55mcKtlpz+sLH98
         G6Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iyZ+He5uw82sFpn1+aSH51zefpGUJmYOMzfP9sVDRu0=;
        fh=SdA7ZvxVHJwelPpIGDhiw2xaezPXkzQEC6akjg5h88o=;
        b=mKUiI2hLEpHVI1wHz7lwjLFpzjNYkVytvDfiQF9DvnixekMa/++pj5XoCqk7c32NUw
         MFPBTxUObvfNQNrPh/Ptfyba9/YJehQ04c2EgCx3VzyxVtHrBkeWXUl8KsSLYzKwPwf+
         VmA8GjHFRM8layNLTGCLcX1N4zvXtjdJZQfjAzn3DWq7KFkNi75dEaVy5cdsgJjtBwOe
         791BeZomKii633KjDrVA6a0ipjHQVw41cdHTMN3ORpP04B6zrUKjMhEnQqBYeWMRzPkY
         5hz+oQZzesX9Vra2ZhgH1mCjgbhnzvu3A1/QJsC84eg9O9gTaoE8fz4k3IiO/OeyWZ9A
         PNFw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783356126; x=1783960926; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iyZ+He5uw82sFpn1+aSH51zefpGUJmYOMzfP9sVDRu0=;
        b=HYDOCFCvwM1RMvHc3wpEUz8QcjBivB3fQzt/i1ILdZSrAgpu5Ns3kLsFFXnPME3TJX
         76omQzxxhKRBynhA3wLDjAHIIaDlMFKr3QIGdrCpFKWf7riYrQueaZkjY3otsPIiBbqD
         3DWa7T7V53aapRZcvB4z4FTs+Ox4KEQygnDtUPclM1Mee3XSmaTbq5esXqF/w5Se1itC
         ucXtBKQCyllhNI1xD5emwcs+kp4Y9fe3kSpDgqTlcuGQJhbFz/tufGuzkm3smnYW4NXh
         emSBppIGStTNfXZyA8jeh9qYE6fotb8Xxdf9F0OQCg8OtEQz7Vx4NtRI2pHrFATPg8Pw
         naiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783356126; x=1783960926;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iyZ+He5uw82sFpn1+aSH51zefpGUJmYOMzfP9sVDRu0=;
        b=MJ22hHc+0QzghH+76csYW7Z2Uv/Pg0iUYVMOOC8vQwHbKxrW0zttYa2biE187YawPT
         3dT+7wUh3L5eQMwW76WHVCdJnq+KZrgRpLgRMNlxmvQd/4R8CztlXHBz2OisZMWL8/Eo
         rJauujxEar87tFLdWl39unfwxdOSYlrYLCC9HnyEtA47WSi4Z5l9TsanNvG5p4KEV4Uv
         Bf2udPUHQXWeIVc5kRMTOY7+Rnutqe3EyTmIIQDuTUSmLlsQDDXPsc3qjAsCEHrEe4cK
         2L3zVpodhci+Nr/YsleCtFckn7yQ2bH/sf+b/m6sOtm85fm5usXGZd2fqN/JFmsEQIFA
         5KVQ==
X-Forwarded-Encrypted: i=1; AHgh+RqZgZW7hkcbIhH7d2+ERRMxF8+XqMaxIKcSEE1W42MuI0bz2aIdyG6Cj9EOxVXRz84YLGbp@lists.linux.dev
X-Gm-Message-State: AOJu0YxoIZgwp2bGzc6fGQrWjcTgvDkJ6S/1w9Y5arKUseehwEMG8ZJR
	Vmo0jIs1j5N/W18JOBSwrSxL2Vp0eVX3lRHTwgwmzidCHneAiJRWvNLne2erX8WkJskXHr57Tzm
	k4/xMtkSgvBxz1uVofJM7s0Awc4GUjTmWWbxCdLXF
X-Gm-Gg: AfdE7cn3HNvtrjC/DxU55sUc8BRCXL/l8RotHlUdPZtIeaGPDK6X9CMIoIj87xWuxjv
	rDhxZVlNDP2mm8x1yB23Q6kD4E6wtY10BNDMkPYso6vvo14iU9TUMMOB315fSyzN7ERJAEWSvp/
	fXCgGCsPxnBNoO4sGc3w2OKIHi4GYcN0L6eULVHAu2Z6wE+vgR5xSYHMa0x9rMyqjvd0sJwZUau
	qNFktK1uZa9/8vQf11KRtASnJNj7qMngPAxaPYnrJ4/hTf0RyybAHYB/z+hjFYbjNuYmA3+
X-Received: by 2002:a05:6a20:c799:b0:3bf:aa1f:4881 with SMTP id
 adf61e73a8af0-3c08ef34b2dmr1593273637.56.1783356126046; Mon, 06 Jul 2026
 09:42:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260630213341.1664345-1-dmatlack@google.com> <20260630165244.0d013bbc@shazbot.org>
 <20260701024906.GA3960633@ax162>
In-Reply-To: <20260701024906.GA3960633@ax162>
From: David Matlack <dmatlack@google.com>
Date: Mon, 6 Jul 2026 09:41:39 -0700
X-Gm-Features: AVVi8CePgqxvFszRnZoJMtiuDb6vccWgIQj_T8klBJuvC17Cx9M9s08vrURGQT0
Message-ID: <CALzav=dVQ1EpQ2x4zZWv0akqPryQuMXqE_vKG3LuC0-2NorT1w@mail.gmail.com>
Subject: Re: [PATCH] selftests: harness: Mark test fixture objects __maybe_unused
To: Nathan Chancellor <nathan@kernel.org>
Cc: Alex Williamson <alex@shazbot.org>, Kees Cook <kees@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	llvm@lists.linux.dev, Andy Lutomirski <luto@amacapital.net>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Raghavendra Rao Ananta <rananta@google.com>, Vipin Sharma <vipinsh@google.com>, Will Drewry <wad@chromium.org>, 
	Aaron Lewis <aaronlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 30, 2026 at 7:49=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> On Tue, Jun 30, 2026 at 04:52:44PM -0600, Alex Williamson wrote:
> > On Tue, 30 Jun 2026 21:33:41 +0000
> > David Matlack <dmatlack@google.com> wrote:
> >
> > > Mark test fixture objects __maybe_unused since they will not be used
> > > when there are fixture variants (the variants will be used instead).
> > >
> > > This fixes the VFIO selftest build with clang and -Werror:
> > >
> > > vfio_dma_mapping_mmio_test.c:106:1: error: variable '_vfio_dma_mappin=
g_mmio_test_map_full_bar_object' set but not used [-Werror,-Wunused-but-set=
-global]
> > >   106 | TEST_F(vfio_dma_mapping_mmio_test, map_full_bar)
> > >       | ^
> > > ./../kselftest_harness.h:398:2: note: expanded from macro 'TEST_F'
> > >   398 |         __TEST_F_IMPL(fixture_name, test_name, -1, TEST_TIMEO=
UT_DEFAULT)
> > >       |         ^
> > > ./../kselftest_harness.h:470:33: note: expanded from macro '__TEST_F_=
IMPL'
> > >   470 |         static struct __test_metadata *_##fixture_name##_##te=
st_name##_object; \
> > >       |
> > >
> > > Fixes: ff556bd98348 ("vfio: selftests: Add -Wall and -Werror to the M=
akefile")
> > > Reported-by: Aaron Lewis <aaronlewis@google.com>
> > > Signed-off-by: David Matlack <dmatlack@google.com>
> > > ---
> > >  tools/testing/selftests/kselftest_harness.h | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/tools/testing/selftests/kselftest_harness.h b/tools/test=
ing/selftests/kselftest_harness.h
> > > index 261e4df94d9d..29a19bc87084 100644
> > > --- a/tools/testing/selftests/kselftest_harness.h
> > > +++ b/tools/testing/selftests/kselftest_harness.h
> > > @@ -467,7 +467,7 @@ static inline void __kselftest_memset_safe(void *=
s, int c, size_t n)
> > >                             !__atomic_test_and_set(_metadata->no_tear=
down, __ATOMIC_RELAXED)) \
> > >                     fixture_name##_teardown(_metadata, self, variant)=
; \
> > >     } \
> > > -   static struct __test_metadata *_##fixture_name##_##test_name##_ob=
ject; \
> > > +   static struct __test_metadata *_##fixture_name##_##test_name##_ob=
ject __maybe_unused; \
> > >     static void __attribute__((constructor(KSELFTEST_PRIO_TEST))) \
> > >                     _register_##fixture_name##_##test_name(void) \
> > >     { \
> > >
> > > base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
> >
> > Reviewed-by: Alex Williamson <alex@shazbot.org>
> >
> > Kees/Shuah, I can take this through the vfio tree if you prefer, it
> > fixes a commit that entered through vfio selftests.  Thanks,
>
> Not that it is a big deal or matters all too much but I do not think
> this fixes tag is entirely accurate. The blamed commit may have
> introduced the build warning/error in the VFIO code but that same
> warning could occur in any selftest code, as evidenced by the exact same
> patch submitted a month ago:
>
>   https://lore.kernel.org/20260530054722.271157-1-kuniyu@google.com/
>
> clang made a change to -Wunused-but-set-variable (split out into its own
> subwarning, -Wunused-but-set-global) that exposes this. Personally, I
> find that change explains the problem better but this one makes it clear
> that it can become fatal with -Werror.

Thanks for the additional context Nathan. I can send out a quick v2
today with an updated commit message to capture these details and
a better fixes tag.
