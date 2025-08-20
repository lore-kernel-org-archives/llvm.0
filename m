Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4022848B6
	for <llvm@lists.linux.dev>; Wed, 20 Aug 2025 22:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755730067; cv=none; b=SD0hB6pEmcS0p9dm9hJGIlt8O/nwF12i4NTtMxC2khZLy9gaxvgroa1qZ+lIHFx9j9uie80llM1Gcnfpf8TRuPHuhEzzUEsOTuBpxTV7vnS+rDWh8M+w7Xjii8Y/ATCDBsQKAHCg68FzVrc9vxA0fABwYhFVadhXPwHDMNJR2Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755730067; c=relaxed/simple;
	bh=aKHlxeIJj0NhWL5rFj8SAJiHfOeC64OVey16cOjjDKI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PHQ/yYeiobmjg/uUEEyY3pLqkzaRWK7gGItyBK4w8WnY8nx4NgQ/qA9EohOqQ9LPUVc9gR3HyZyA+SjIoYohcG457NFQBKGZbXy86DIi4bJJuqZKPGTWZDxWKSP0yQvEU9kRi80XJeHK2iQ0AmoZER9upiksWl9IRRuu1TKV71c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VIqxm/Og; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VIqxm/Og"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-24458194d83so3004175ad.2
        for <llvm@lists.linux.dev>; Wed, 20 Aug 2025 15:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755730064; x=1756334864; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CxmSUEH8XUSKiQrWMIiadQU2ELcXoRKtyFDMxUyNAvc=;
        b=VIqxm/Ogeh4twbzOdf6tcti4F/3twjfgKpEhogrH8j8i5ClCMGfcJ0Z0hRzRRHyhII
         DzhVMn8dr6E5RswD5m27ZGXEloGcSS6neaDbBBz7mO2ojZQVru4pR1XdSOFZnGyIxA5n
         WHO0S1tr1BjIMqMTVLZuiF8XsSbMRpqA8LULwisLCtDz1XmnpD/R0Y1nitp8syX569H0
         xncluEnRhMnLzD8x3vaXze+58FwPkCbanki5IVzApDgjFmHUWz6KaVcCgkG6PJK5h25S
         vWsaLNqrydk3z4e+Tw7kiQp2+ONBrT5fpy2552oHDkwHnj1eZHVtoJVxW5OPDnkwr5tD
         tgEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755730064; x=1756334864;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CxmSUEH8XUSKiQrWMIiadQU2ELcXoRKtyFDMxUyNAvc=;
        b=FZPw1ucooBzeWb5R3W1w+NSytzj6fNpJ9wp939odX0wUgqCVY0OE0vCSNs+powUx+/
         E671pFcqAikSFdpQgjkB/ok+lQHAWkK6QM3xDQpQdjDLX+XASHWjGgCucQD/uDUUVJ/O
         PFK1Ds0oEQtrKXaU4cQXPY4ACidOBSt6T+i9z41Y70kRzxKXbfMckQ1igjzZjlP0NOQJ
         ivRfBtS9VLGfcD0VzxBi7sC4qGLpKCJ4M8X3eC4z/BiW6eclCIM3u2V/uKPD3nZpVWsN
         FTdbvCycsgqd0wOccs7x2JbiD/4Q2RDBdkoDj+aDPojKKqiwQprPzWX8Qgcal1eTXr3H
         N4nQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGBe5QsUqKZbUA7uo/dkBeDQ2a083gfBtAFgHbidIMjvrIFVNTtp+9Uro4yOsEXtOhLBbT@lists.linux.dev
X-Gm-Message-State: AOJu0YxkkM8p3kVgZx8wHKDpAC3spMJ28M9hfIfh4ZtxTDtSZTO6a+2G
	ExYV4R3s6510sVgHAz888u4xfPWJRRz0vV8sQdXnZSlhlHMMK/LWyPwHn9OBFgfqFFZ0DXKIXGA
	QcdSZ5UNp+PzfteiQMNzaLIUlJ4jhVfw=
X-Gm-Gg: ASbGncuuuzHzlbqIT+jheWNzePY8z5OE3i1tIlDXIw/JasUZ/QBJOS0zDubLieYLFT3
	rOLYhqpRA1RcuM6LW5gSTOzFi8Ippc5I7lbSx+cAn7tQV5KO2BcY7CeVjswy2USUxsGIdgxCy+C
	pA5V66cJo+KntEIFmjHDIMURUKVFU9dgvhFnyWkJEG7kreTVUhk4KDBY8pNj7FgUmiyNdnxt/Nc
	ma/beDNPHQJUmqDvviiohjYCfxBBwnMti9z3bqGGhzd
X-Google-Smtp-Source: AGHT+IGfXE/LPyy5OpwjdvIBYFagxDqu+JLxgJsnoM4MRvNr7cBY/jRWzrvpmvFodOiN1fufMP+/m2v1odbFJOTclS0=
X-Received: by 2002:a17:902:e884:b0:23f:f707:f97e with SMTP id
 d9443c01a7336-245fec04067mr6138445ad.17.1755730063826; Wed, 20 Aug 2025
 15:47:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250819033956.59164-1-dongml2@chinatelecom.cn> <20250819033956.59164-3-dongml2@chinatelecom.cn>
In-Reply-To: <20250819033956.59164-3-dongml2@chinatelecom.cn>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 20 Aug 2025 15:47:29 -0700
X-Gm-Features: Ac12FXxwNFYx3X1C5Pu9tp-WySpazWQxJmdHRR6C2ikj-hLBBFxY7DT7gZK46Co
Message-ID: <CAEf4BzZBztC69GFDuA4YJHPmWOXuq3+tSNMspPNA3tksGaEi=A@mail.gmail.com>
Subject: Re: [PATCH bpf-next 2/3] selftests/bpf: skip recursive functions for kprobe_multi
To: Menglong Dong <menglong8.dong@gmail.com>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
	martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org, 
	yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org, 
	sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, mykolal@fb.com, 
	shuah@kernel.org, davem@davemloft.net, kuba@kernel.org, hawk@kernel.org, 
	nathan@kernel.org, nick.desaulniers+lkml@gmail.com, morbo@google.com, 
	justinstitt@google.com, bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 18, 2025 at 8:40=E2=80=AFPM Menglong Dong <menglong8.dong@gmail=
.com> wrote:
>
> Some functions is recursive for the kprobe_multi and impact the benchmark
> results. So just skip them.
>
> Signed-off-by: Menglong Dong <dongml2@chinatelecom.cn>
> ---
>  tools/testing/selftests/bpf/trace_helpers.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/tools/testing/selftests/bpf/trace_helpers.c b/tools/testing/=
selftests/bpf/trace_helpers.c
> index d24baf244d1f..9da9da51b132 100644
> --- a/tools/testing/selftests/bpf/trace_helpers.c
> +++ b/tools/testing/selftests/bpf/trace_helpers.c
> @@ -559,6 +559,22 @@ static bool skip_entry(char *name)
>         if (!strncmp(name, "__ftrace_invalid_address__",
>                      sizeof("__ftrace_invalid_address__") - 1))
>                 return true;
> +
> +       if (!strcmp(name, "migrate_disable"))
> +               return true;
> +       if (!strcmp(name, "migrate_enable"))
> +               return true;
> +       if (!strcmp(name, "rcu_read_unlock_strict"))
> +               return true;
> +       if (!strcmp(name, "preempt_count_add"))
> +               return true;
> +       if (!strcmp(name, "preempt_count_sub"))
> +               return true;
> +       if (!strcmp(name, "__rcu_read_lock"))
> +               return true;
> +       if (!strcmp(name, "__rcu_read_unlock"))
> +               return true;
> +

static const char *trace_blacklist[] =3D {
    "migrate_disable",
    "migrate_enable",
    ...
};

it's not like it's one or two functions where copy-pasting strcmp might be =
fine

pw-bot: cr


>         return false;
>  }
>
> --
> 2.50.1
>
