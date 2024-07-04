Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B371BC23
	for <llvm@lists.linux.dev>; Thu,  4 Jul 2024 03:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720064657; cv=none; b=fiCQGa6K6yssywnnNvjsGgNLinbA6SXdMRsI0JQ7B6szRzO2dq2hIjBdtHWStIWHfK9hCMLF6d96hKhhn700zGG1jTR8dulWrrfOW3aGzIOSwTHXIp7IHNZtWqwSWtHoaaZM7LJeRSKW+w1Fcjp+DfIjmpYvVxZC9/gk+xDRObg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720064657; c=relaxed/simple;
	bh=bHg1oOoNZOVAop9/sk1cT9TRi/dy30jWiJTM1dwfOSM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BonnBWk43ZJAYDKM7Na7r2ZxnxcagW8Hz6FbHBmqWU4tBFXTAw81wE/fTDRZGi8RxnAbeI1o9b8WcodaAuodBuU9XCD7iJsjPNrtBtRqgBMdrJzaXpK0IDDSdBbrBOMpTGh4pluAR8hC3i5GKlszkREFug7h8ta7AOaE4MVeFxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d0cieVzx; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d0cieVzx"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2ebe40673e8so1920031fa.3
        for <llvm@lists.linux.dev>; Wed, 03 Jul 2024 20:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720064654; x=1720669454; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dpb8jh3xl2yUW9tcGzdxy5MpT1Lo32MEWMN1DB3eG78=;
        b=d0cieVzx5bLCDKqmeq54zHieBhhw28HyJX0uWX1jlfCZzhorgTTRsPgjPxR9VVU0vw
         nGDqUNNpKqPxXVuoRX8XUQVoaG0A/Czp9Hk/P78XDDhKiAIvidGUQozVY9LQdgVKdD3U
         oAwTxIYtcrxBVTcFfqMITk9JL+r1Mh7NiemKXd8mOQsTI7et2kKIUYsaSH50ys939c5V
         JRidoyx2B9/92xGbRAvtC/bOkzyL3/nanW2eGVAWMKlLA9CyiCfdp+H0v5dQE+9TSsxL
         mqq0/Ojcz+IITHIzGcT55TQ8GIYPVzNvfnMO1U4DCY52bM5gz4OtJt/fUkdG+k/kHmug
         rBcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720064654; x=1720669454;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dpb8jh3xl2yUW9tcGzdxy5MpT1Lo32MEWMN1DB3eG78=;
        b=l7KBkhNkhKDd37aUwWFCYN7RjPSzV8d2AYa8PAWFap56P4O8+z+ACwn3YAWa1rOaFN
         HhVF9Gz/GqZQutYplIxBaKhu3TKb2mBtcUQOmcu0rH/cKJuUJr7HvY+YweG/RShzYnUs
         cQWrdStaw4l6rVCmN+A8FEiNFx7a1tRJh0OzidffA7+QnDJhk73LNPqCZVbFOhxzk2n8
         yvzgepVOKXR7gdShZzAnSbBnVr6mvRYXWU+DRLWHgACCHAGm/GcOfn/XWjzl0yBCO8HA
         1CRlvQBC7omu7NvP6CBTB0OjvtN3dQ7FeSoj59zKnqspL43se0Yn9D3DqCrk/VTod1mY
         +J2w==
X-Forwarded-Encrypted: i=1; AJvYcCUGm3sHMIlm4HQa23Yyx10mK2riagOPqMmB9LFqx/Q4sTDh6+Ks2MUx1n5uc+5NuyOFQPCOTQ6jP8dTtLlQj1OGWUna3Q==
X-Gm-Message-State: AOJu0YxjFgfHLawo2X8tcdPE+yow1dXDSfOivuTN3WyvY3caPG6kASxM
	K6kMP73ks1hp6JuMsvB7lACNuBRaF6YcLlPiU/3XEfBmHHAJL6Jk4TI1vOy4HBpcTJHkFXIhuF8
	XDMVRzvHudmKTeeJQWEdnu713yHM=
X-Google-Smtp-Source: AGHT+IHF22lgyUZ2Y6iVXkzcNFcV0U429j08sVQqCZNQ7f1zdntEjlZWjKvybaI3Rsux2M4PZVTvbsbL3gXmdV6X2hM=
X-Received: by 2002:a2e:a78f:0:b0:2ec:5603:41a with SMTP id
 38308e7fff4ca-2ee8ed66bc0mr2168791fa.2.1720064653811; Wed, 03 Jul 2024
 20:44:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240704025247.86418-1-jhubbard@nvidia.com>
In-Reply-To: <20240704025247.86418-1-jhubbard@nvidia.com>
From: Andrei Vagin <avagin@gmail.com>
Date: Wed, 3 Jul 2024 20:44:01 -0700
Message-ID: <CANaxB-zk-j2E8D0_4x04WL5Jbe08SD39jqBLbehBYWedFg+mMw@mail.gmail.com>
Subject: Re: [PATCH v3] selftest/timerns: fix clang build failures for abs() calls
To: John Hubbard <jhubbard@nvidia.com>
Cc: Shuah Khan <shuah@kernel.org>, Dmitry Safonov <dima@arista.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Valentin Obst <kernel@valentinobst.de>, 
	linux-kselftest@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	llvm@lists.linux.dev, Muhammad Usama Anjum <usama.anjum@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 3, 2024 at 7:52=E2=80=AFPM John Hubbard <jhubbard@nvidia.com> w=
rote:
>
> When building with clang, via:
>
>     make LLVM=3D1 -C tools/testing/selftests
>
> ...clang warns about mismatches between the expected and required
> integer length being supplied to abs(3).
>
> Fix this by using the correct variant of abs(3): labs(3) or llabs(3), in
> these cases.
>

Acked-by: Andrei Vagin <avagin@google.com>

> Reviewed-by: Dmitry Safonov <dima@arista.com>
> Reviewed-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>
> Hi,
>
> Changes since v2:
>
> 1) Commit description: removed the reference to Valentin Obst's patch
>    being a prerequisite, now that that has been merged.
>
> 2) Rebased on Linux 6.10-rc6+.
>
> Changes since the first version:
>
> 1) Rebased onto Linux 6.10-rc1
>
> 2) Reviewed-by's added.
>
> thanks,
> John Hubbard
>
>
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
> base-commit: 8a9c6c40432e265600232b864f97d7c675e8be52
> --
> 2.45.2
>
