Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C117153BD4
	for <llvm@lists.linux.dev>; Fri,  3 May 2024 13:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714744094; cv=none; b=B3KqNREq8hUazkQZ9wwqun5/QO+sqtT04L5OdBAlfumxFJAj4M2EUeav+rjV1NNbCbzybzerenA+cv8k54v0ifeJdBwYRIda8kXawzX3UbCeoX51nN8Z0PHT+YYpqAG0TFMpMW8N44Ikj3sQHSTCRz85HP72mMyAEVU3wEV+gJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714744094; c=relaxed/simple;
	bh=ZtEDfOvwvxE7Fvlei3awx6n7b16lJ64hGqs3ri5Vvno=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=skEvtvTfloSBgg0x0iNmHukMWbFxvo6ZKvNWrkiwTWn2po5J0eA0UfGkZbxdCoycK+/pR91KBFVgxkh/EceDkBHF1tIpwRMFMy4+FX32rYgDw9UsSk2eVePD/sCxN7BIGKo/lYhHuMvsQcqIzQi8Rzh5n1cTYOjdG9bdP9sIHjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com; spf=pass smtp.mailfrom=arista.com; dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b=E30nCFRo; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arista.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b="E30nCFRo"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6f4521ad6c0so194803b3a.0
        for <llvm@lists.linux.dev>; Fri, 03 May 2024 06:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1714744092; x=1715348892; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I6o8JjInWH3LKnqSsl6S6HrXQoEHLETqeq/r/V572dU=;
        b=E30nCFRom19R11z7SGDEHtcgCXNaOBCCy3EkkyREoanfYn10D2ZwqcHyxqMRMvVv6I
         7I58j6egl16stfxn0WB87r+uE/hJYbfOSF/3SNE1aBMji85ti58OnMc/ZZIjIUe+3otR
         Qi5QG/6eGVnfJX60QHkZo4AjMb5IompKUqzTuB/JJGl5z0FyvJXIjKGh2HoJU15gqiie
         bSnmzl03hRWZeHNdDKPk7Dxc1eox9LYDjuwf5Qacj4F+KfMlLCAtCwr7SLKzAT/+Aeag
         C5iuODwZ/m9y7R4cB3M9HAkin31N6hVVwNaOHtCc794whDXN31JYbqZLZpu2Am8qAGIT
         PEXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714744092; x=1715348892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I6o8JjInWH3LKnqSsl6S6HrXQoEHLETqeq/r/V572dU=;
        b=ZFPZSd7EkkinleIzXqxA4LDBzE5/rcpwKO1YcI5kkkzi00DLw+07jTL90XrNpcWjeK
         cdBLnIaqUItmdOeGLqtu/xQ8FY5+55LvlnNLin/SiHT85So99o5pOMwu/RniB72Exexv
         eCPN+0VrcByNff66oLzXt/ZFeOCIBZYhEq1NJUPSFTPHjSE7eBtnB66bB3gsZ8v8Td3u
         GvUTjoJRXhrgUaq3IqIUzwiyds/lMthC+dX1ZiAFfQQthFhMaj8i8fgjgEQ7XoLAMB1o
         WxvQAQafrrF9wTnExx1x5+IvMHgqQG/+74eKv64Ly6R5KyM/ZNIAybqdIzCYtyr5XU8M
         Lf4A==
X-Forwarded-Encrypted: i=1; AJvYcCW8/hleeObtUigL2WGTcw0oS1J+s1svZKAuerrXAvE+2iuIv3lrklKqWchK+8GZ//IOb+j0WrIE+5kpQu+6TCLCe4/stg==
X-Gm-Message-State: AOJu0YyEoE74eBmre/Z1ORsZmz6YJyfg52PZ9zzGvuAvxzAgDCeiBJXa
	kcjPnIEY4DJH6vDIF1MedrarPOKPf+zV5N5BHnEhDYR15Sl1SaK887ScTRBhfRM/5rFvrBNlLx3
	m+NNEYMWC2xD4Nn9LlpP4xvA+nvzUFzsg209M
X-Google-Smtp-Source: AGHT+IGcHQbk7BIXmDO++MVBetSDEcok6GyH2AElax21yCwgfaWPhGQ74GzYA7sVljZdG8KJzwLOECLgom2T9Etb/J0=
X-Received: by 2002:a05:6a20:a7a9:b0:1ac:de42:bc5c with SMTP id
 bx41-20020a056a20a7a900b001acde42bc5cmr2278110pzb.42.1714744092194; Fri, 03
 May 2024 06:48:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240503032956.89290-1-jhubbard@nvidia.com>
In-Reply-To: <20240503032956.89290-1-jhubbard@nvidia.com>
From: Dmitry Safonov <dima@arista.com>
Date: Fri, 3 May 2024 14:48:00 +0100
Message-ID: <CAGrbwDTv7qikmnKVHECrX0SpxLV5-3RExxCEtPykfmMrVeBhQA@mail.gmail.com>
Subject: Re: [PATCH] selftest/timerns: fix clang build failures for abs() calls
To: John Hubbard <jhubbard@nvidia.com>
Cc: Shuah Khan <shuah@kernel.org>, Andrei Vagin <avagin@openvz.org>, Andrei Vagin <avagin@gmail.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Valentin Obst <kernel@valentinobst.de>, 
	linux-kselftest@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 3, 2024 at 4:30=E2=80=AFAM John Hubbard <jhubbard@nvidia.com> w=
rote:
>
> First of all, in order to build with clang at all, one must first apply
> Valentin Obst's build fix for LLVM [1]. Once that is done, then when
> building with clang, via:
>
>     make LLVM=3D1 -C tools/testing/selftests
>
> ...then clang warns about mismatches between the expected and required
> integer length being supplied to abs(3).
>
> Fix this by using the correct variant of abs(3): labs(3) or llabs(3), in
> these cases.
>
> [1] https://lore.kernel.org/all/20240329-selftests-libmk-llvm-rfc-v1-1-2f=
9ed7d1c49f@valentinobst.de/
>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

LGTM, even potentially fixes the testing post-2038.

Reviewed-by: Dmitry Safonov <dima@arista.com>

> ---
>  tools/testing/selftests/timens/exec.c       | 6 +++---
>  tools/testing/selftests/timens/timer.c      | 2 +-
>  tools/testing/selftests/timens/timerfd.c    | 2 +-
>  tools/testing/selftests/timens/vfork_exec.c | 4 ++--
>  4 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/tools/testing/selftests/timens/exec.c b/tools/testing/selfte=
sts/timens/exec.c
> index e40dc5be2f66..d12ff955de0d 100644
> --- a/tools/testing/selftests/timens/exec.c
> +++ b/tools/testing/selftests/timens/exec.c
> @@ -30,7 +30,7 @@ int main(int argc, char *argv[])
>
>                 for (i =3D 0; i < 2; i++) {
>                         _gettime(CLOCK_MONOTONIC, &tst, i);
> -                       if (abs(tst.tv_sec - now.tv_sec) > 5)
> +                       if (labs(tst.tv_sec - now.tv_sec) > 5)
>                                 return pr_fail("%ld %ld\n", now.tv_sec, t=
st.tv_sec);
>                 }
>                 return 0;
> @@ -50,7 +50,7 @@ int main(int argc, char *argv[])
>
>         for (i =3D 0; i < 2; i++) {
>                 _gettime(CLOCK_MONOTONIC, &tst, i);
> -               if (abs(tst.tv_sec - now.tv_sec) > 5)
> +               if (labs(tst.tv_sec - now.tv_sec) > 5)
>                         return pr_fail("%ld %ld\n",
>                                         now.tv_sec, tst.tv_sec);
>         }
> @@ -70,7 +70,7 @@ int main(int argc, char *argv[])
>                 /* Check that a child process is in the new timens. */
>                 for (i =3D 0; i < 2; i++) {
>                         _gettime(CLOCK_MONOTONIC, &tst, i);
> -                       if (abs(tst.tv_sec - now.tv_sec - OFFSET) > 5)
> +                       if (labs(tst.tv_sec - now.tv_sec - OFFSET) > 5)
>                                 return pr_fail("%ld %ld\n",
>                                                 now.tv_sec + OFFSET, tst.=
tv_sec);
>                 }
> diff --git a/tools/testing/selftests/timens/timer.c b/tools/testing/selft=
ests/timens/timer.c
> index 5e7f0051bd7b..5b939f59dfa4 100644
> --- a/tools/testing/selftests/timens/timer.c
> +++ b/tools/testing/selftests/timens/timer.c
> @@ -56,7 +56,7 @@ int run_test(int clockid, struct timespec now)
>                         return pr_perror("timerfd_gettime");
>
>                 elapsed =3D new_value.it_value.tv_sec;
> -               if (abs(elapsed - 3600) > 60) {
> +               if (llabs(elapsed - 3600) > 60) {
>                         ksft_test_result_fail("clockid: %d elapsed: %lld\=
n",
>                                               clockid, elapsed);
>                         return 1;
> diff --git a/tools/testing/selftests/timens/timerfd.c b/tools/testing/sel=
ftests/timens/timerfd.c
> index 9edd43d6b2c1..a4196bbd6e33 100644
> --- a/tools/testing/selftests/timens/timerfd.c
> +++ b/tools/testing/selftests/timens/timerfd.c
> @@ -61,7 +61,7 @@ int run_test(int clockid, struct timespec now)
>                         return pr_perror("timerfd_gettime(%d)", clockid);
>
>                 elapsed =3D new_value.it_value.tv_sec;
> -               if (abs(elapsed - 3600) > 60) {
> +               if (llabs(elapsed - 3600) > 60) {
>                         ksft_test_result_fail("clockid: %d elapsed: %lld\=
n",
>                                               clockid, elapsed);
>                         return 1;
> diff --git a/tools/testing/selftests/timens/vfork_exec.c b/tools/testing/=
selftests/timens/vfork_exec.c
> index beb7614941fb..5b8907bf451d 100644
> --- a/tools/testing/selftests/timens/vfork_exec.c
> +++ b/tools/testing/selftests/timens/vfork_exec.c
> @@ -32,7 +32,7 @@ static void *tcheck(void *_args)
>
>         for (i =3D 0; i < 2; i++) {
>                 _gettime(CLOCK_MONOTONIC, &tst, i);
> -               if (abs(tst.tv_sec - now->tv_sec) > 5) {
> +               if (labs(tst.tv_sec - now->tv_sec) > 5) {
>                         pr_fail("%s: in-thread: unexpected value: %ld (%l=
d)\n",
>                                 args->tst_name, tst.tv_sec, now->tv_sec);
>                         return (void *)1UL;
> @@ -64,7 +64,7 @@ static int check(char *tst_name, struct timespec *now)
>
>         for (i =3D 0; i < 2; i++) {
>                 _gettime(CLOCK_MONOTONIC, &tst, i);
> -               if (abs(tst.tv_sec - now->tv_sec) > 5)
> +               if (labs(tst.tv_sec - now->tv_sec) > 5)
>                         return pr_fail("%s: unexpected value: %ld (%ld)\n=
",
>                                         tst_name, tst.tv_sec, now->tv_sec=
);
>         }
>
> base-commit: f03359bca01bf4372cf2c118cd9a987a5951b1c8
> prerequisite-patch-id: b901ece2a5b78503e2fb5480f20e304d36a0ea27
> --
> 2.45.0
>
