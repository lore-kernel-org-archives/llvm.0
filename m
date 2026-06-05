Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEECA3C819A
	for <llvm@lists.linux.dev>; Fri,  5 Jun 2026 16:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780676488; cv=pass; b=L1mXmVpqpfqUMqhc8gZ8uklR9kadvrNqQV/YWlE+EEA3hbo0EA8wvd59FJQ9cnfYTja32pqFPb5EjHpnSjoN6vh8tQyLW8fGHb9MrW6vM9RZ8bv5CF+M8zt50H4kSpSG974V7rEMvsnYFJmcqTKNtnwlI87JqDIR7Fi6iOtpp2o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780676488; c=relaxed/simple;
	bh=mWB1QjoCqaUp7xOYtL0VXwUOlRHPZS3Zm5pVWOTzZow=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XgTr9Ht8oJOraASsWeAXeaqWoeQbUGB1xqq8eRc7JRxxPNCmT8TTBSQGcK2h5A6+wTF11j/EWWungcfy+NA44ZPL2MCzjdOTRkphrnqjoTFgpno4WIQ5HeS3P7jt+CrBgzPxBGnQ7k3VV6xCa8+OndBvLmMBJb4AVprRciAjbVc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=k6ws2eKA; arc=pass smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="k6ws2eKA"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-6611689dc10so118921d50.1
        for <llvm@lists.linux.dev>; Fri, 05 Jun 2026 09:21:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780676486; cv=none;
        d=google.com; s=arc-20240605;
        b=dh9BTQ36EMWoTiFbaKN4DryOrxeuC1IuuVQ+DhNqkl8sKlF//qwKqrnbGk0yVYvBOb
         T87Rk+kiBveyLIISIyoqkH4QayyWO1olOlyPOuumrEApY2zySlJvqior/V6p/6dXCBVT
         ux5xoUeX/tsHEIg9iClWEMUhI9kN/KvcWdm5bmMXx+FYxSyt417n9kLH2N58SjKc6bsG
         ByYBnSVebBkcPVmelgu481D1awvVqZlwa7/BOZXO90Ezrer4WIwnURXqT1yM4/NXJ3ME
         Qasw6U54wskNIdpKWZRcZxNQ0lVWZqraw1tDedWUM9s2JcrIquWN2FIXJwwCbgjpC6fX
         fGoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mWB1QjoCqaUp7xOYtL0VXwUOlRHPZS3Zm5pVWOTzZow=;
        fh=Gnmu42yWc+oHJu7wjUIbrgjLQ3jIN54vI3YazJCPKRU=;
        b=lmP3Vi70Yra8+/w7V6GpT88Z2nl/i19wKz8G3iCqEV0XP2+RsGbCsM5zJFg797vT3n
         1t8i5mTEFg/4Lm0RLTUVPU5PQR8SZFBRWJSqgDvJCtgwPiL6AI10mgtBHx5IhO+PifQ/
         6FdWJ5QSueHPS3kymbhqUactvewWRXCKLB5VvNZAqubDOsX3aCHZs3H6xPHKaGzJcp+B
         PfAZEfRDUe6glJpvjtmurds1OYJSg17Q4OaaB1LBBCY5r8RI7Q95CHWtrFQkIBIFVc+t
         fIH99ZSYxb6FC65sJv0kOvH3BypS7LUF9UHjddExcQ4/rW2fJq29yoyupaxAfqHHCp9q
         9SWg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780676486; x=1781281286; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mWB1QjoCqaUp7xOYtL0VXwUOlRHPZS3Zm5pVWOTzZow=;
        b=k6ws2eKAAeRYoivNgd+cnclPLdzXp+TOxQdUsD3SE4opbxgiVZGvkKwQX9ZMg5RnhO
         uniKe0BBVRG3zsk1ufjkDm4N4evw11+JYQKcxof6/+gH8cACKjmEEvJzWjQCJEgh38nT
         ml5l9HhZquYm0dmPaCeRi8HdIAq4xNWAA8kl0Fu5KVBOArKbaKqX+RyxYLyKTSaUMhyx
         KLGdDPRPKBS80oFVgyS6+lPV5gVKm0v4zECN9AxQrMQ6gyculvz/xPQ9hvyIx2aGV3K0
         js/T4rZq6WY3YrL9N7qxkffhjJQ8jmy+v2gLgvT3Y84Pnk8Ers8NhJptSC5BmoT9OROZ
         /cBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780676486; x=1781281286;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mWB1QjoCqaUp7xOYtL0VXwUOlRHPZS3Zm5pVWOTzZow=;
        b=tISYvLN2oN9CAohc33djbetPttF2E7OfEZnNL8vE7vlfpGwmOZ7UjQHGOrA7z6JgSt
         buudIOj1m8KIFq8lCAGXaZoq0FWdkF61bobshgCilchxLe3p9s+0kQ2RNX2TxkbPQXCQ
         3Cu07+ShFYGCiBu4GislpvRnNG9jS0FyMcvU6rQpBNsrj74aHLr7JKfKNxC5lS8iBBFS
         cxwKIhc4DBh/mgFQ9cqMdoXvLKXtdHrlobtdKlkr+aLFPfuB+nVyM1rJYZEMrPCNwT03
         EjRoJVJ0yFEjSc1Y8MKjez2TeV1Hn+DoDttnbhdNXXgqjT5ax8A+M3NwSUtWpvEzg7cJ
         xB2w==
X-Forwarded-Encrypted: i=1; AFNElJ9k8fdiNs1xP2O7yqNP8isf8MpkwpTeBCsoZh7SrhxXqpWdSZmJscmBzWDjyhhZ6HtK3wCu@lists.linux.dev
X-Gm-Message-State: AOJu0YwWpW1KauNi+F+VHMrPonQRG1akitqxNJcFIcBXbphV/tpFpgT+
	xH844m0h6Spc/Mfvxa68713HYvPcKt/u8ZkjTwFYury+j43FpWNwzJGr+DnyRjePvyp6bADoEk2
	LIPZOi7utyqTpZmO8gFZg7UElZl1s3I3GZGi5VCdF
X-Gm-Gg: Acq92OEsisJr5nLX+AD+H5+PYAjl1xxFXo7YezA0oPHknuqWS+L1MNWXU710neNciwS
	fed1xhaOJyT/TE1Hwbg3EwBRABOMUNOyEyKmvGSL8W4Bv/QDqAwzmsAc8JzYKe3XJMvT//igJQg
	ZEf+bTEo+YW1vm4Sdh9TPKcLmLUyTs85vG74Qr/VhlcdADafW7wHWGllm3hpB+EPeO065ajr65I
	vpAg9zE/KL8O5+VBsVPhDmHs23IWybiaVHp91N4w/Jp8RefENFSDnv1Gn0uBZhDt3tMSo7lHlGg
	EIK1UgsSNzuw6Iyuh9wvefH1s4lBqYgPBIdep870idFEFtLgCE8=
X-Received: by 2002:a05:690e:1388:b0:660:877f:a5f5 with SMTP id
 956f58d0204a3-6610704f8f0mr3897550d50.43.1780676485426; Fri, 05 Jun 2026
 09:21:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260603-kcov-dataflow-next-20260603-v2-0-fee0939de2c4@est.tech>
In-Reply-To: <20260603-kcov-dataflow-next-20260603-v2-0-fee0939de2c4@est.tech>
From: Alexander Potapenko <glider@google.com>
Date: Fri, 5 Jun 2026 18:20:43 +0200
X-Gm-Features: AVVi8Cev4P7AiBmPodWfwaPtX8_k3m47tFa_rHl6t21z7L5L4Qmm-6Ly0xXbR54
Message-ID: <CAG_fn=W1++qPJWQk1+4MtRfe6n1iUKF2O5pddnqKGwSq85CuqA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/6] kcov: per-task dataflow extraction at kernel
 function boundaries
To: Yunseong Kim <yunseong.kim@est.tech>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, Yunseong Kim <ysk@kzalloc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 3, 2026 at 7:43=E2=80=AFPM Yunseong Kim <yunseong.kim@est.tech>=
 wrote:
>
> Introduces a new KCOV exetened feature that captures function arguments a=
nd
> return values at kernel function boundaries, enabling per-process visibil=
ity
> into runtime dataflow.

Some high-level comments:
- Make sure your code can run on every platform supported by kcov (namely A=
RM64)
- Check out Sashiko findings:
https://sashiko.dev/#/patchset/20260603-kcov-dataflow-next-20260603-v2-0-fe=
e0939de2c4%40est.tech,
at least some of them seem to make sense
- Please consolidate changes to the same file into a single patch
- There seem to be two tools (one in C and one in Python) with
overlapping functionality, can you keep only one?
- The test modules seem to be used only in manual testing. Can you
convert them to kselftests or remove them?
- At this point, long dashes in the kernel codebase are quite rare,
and I don't see a reason to add more.
