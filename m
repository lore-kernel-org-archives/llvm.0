Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF9913DDD2
	for <llvm@lists.linux.dev>; Tue, 28 May 2024 22:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716935079; cv=none; b=iuSs6cA7tNp4ONXhfkvpryKaDXtYzEeF9dlWZ2ZH5uQ5sNpSPewHOTjt7qt1EOocgSDHsVVBx/YWJk2eHqWeu5i0vtJvLUoef1dA71Szvmz07tTEBm0/bmr0eEzg4oS5OQTabtdtbufgd4rtVGz5LaDpAW2uhZk3i9Tp2iEGID0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716935079; c=relaxed/simple;
	bh=GSSEWukZFE2Gu3pijabeLIdOL6GHuqpyPZcN0QTIm28=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gewnEy1jBBw8Dcc1jK8+Z6vrPK3x9b9kTt8jKSPtlTYvAg1LqwkiMjSEeEmSdggLD3SwdKZtpEP12eVVmkaXUDzu5lggwY+nsCSrDSKixyrTVtUFmu2+h+5AYFa1YBceLBLUU3N2/NxgUsw9ri+ZjVkhwDx3CjJ8WTwWXKJ56Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LHWWHiBq; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LHWWHiBq"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-572f6c56cdaso6588a12.0
        for <llvm@lists.linux.dev>; Tue, 28 May 2024 15:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716935076; x=1717539876; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GSSEWukZFE2Gu3pijabeLIdOL6GHuqpyPZcN0QTIm28=;
        b=LHWWHiBqTSEfpH/XSqNr6PFVwXvsZRR8nkVitnQDGRwULFOWZiPG6KTLL/T3o6SJcq
         H8S6TvQDHPCIoWxgfRn4vz2IMFosS/Nx7+N8c7zYz3VrwBzxcGqc73+mcLbwQJaxzZ3R
         isBWVbYcSu44hW2EnRqqQAo+OSjvUOenbaFL062WtRDEbtl/gGRl04LLELXYEC/S6H65
         FSZ0Cwg/DSjlXk5RF6I3zlK5AgnDfoFd0tOedTzwn7gq1cmK2N3B9HGOqSPdL8oypIal
         X84IZsY+76uI3PeRxgqJJxWGBddNE5kzcdH1pbBvcMMywrJhINShKzlK6v8W02W7Sazl
         oZVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716935076; x=1717539876;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GSSEWukZFE2Gu3pijabeLIdOL6GHuqpyPZcN0QTIm28=;
        b=hAMDSh4sytfBt3PCAt5TM2tu9CdZWVyXmykJnFJFnqi40TUXV8rdEXFZZuT3O6Q4ZS
         UzYbvKGilSc3APle7oBPvm+rc+UmgkUJYgQaC2gYH6G3JWnfebSUOWPYuJvgCg3aNDiP
         kC+YTOBPOk1cfUfvYQrrjSqIbLiS6aPhxu8FxFypdTcmZ5EnAepkCpx1XoCH+HZCpprg
         tVRCrO/05uYFWXXjy2nuTkaBkDxru2Tb/q2u9M7Slgl4CIWTLhw7SvfDGheiwnpgGH05
         iuBvnBTgg+MkCNzqAMhdCGh8tNuhRgeuEb9EijqVxYBkYWu2hogbBTS6cW473pSQYRNY
         9IbA==
X-Forwarded-Encrypted: i=1; AJvYcCWlgTJHY+dEnsgBVz4glXL34/YiTy0fzshOaX215cIHI66R1t008g3SIuLXXihZzw3SUTebk8yx2SQn1bS+9iM9TIOyKw==
X-Gm-Message-State: AOJu0Yx2Ar7j3Eo0bb42oKOKqMNARqzFzxC3wY1s6bqzOoeUEXGIflC0
	7ibVJFoehc1OC4XMIEe3OgFs8R4mUugyd7x+caBQNIj2phNXaQ1PF2n2qSN/oRJE2kwyH8+of3K
	kzbd5kGzIEUkv+lFYyDsr6KBKlv1l+n0Lufss
X-Google-Smtp-Source: AGHT+IFH3u3WiLbWyZD6sTqsaAWhFG+2x5wPCWYFrNFm4bc5hVfvSyoLJaVBFsdBHGMrup5HuCyUU4cYpTZ6jSKz8xw=
X-Received: by 2002:a05:6402:553:b0:574:ea5c:fa24 with SMTP id
 4fb4d7f45d1cf-57a05d20d22mr6096a12.3.1716935076207; Tue, 28 May 2024 15:24:36
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240503041843.99136-1-jhubbard@nvidia.com> <20240503041843.99136-4-jhubbard@nvidia.com>
 <dbca543e-224b-4fa5-ba23-37f4957ff79d@nvidia.com>
In-Reply-To: <dbca543e-224b-4fa5-ba23-37f4957ff79d@nvidia.com>
From: Edward Liaw <edliaw@google.com>
Date: Tue, 28 May 2024 15:24:09 -0700
Message-ID: <CAG4es9Vi3Kmvb0Nn2FNGmVL2YB_5qcJHunUaTRuSy=mkiLhb0Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] selftests/futex: pass _GNU_SOURCE without a value to
 the compiler
To: John Hubbard <jhubbard@nvidia.com>
Cc: Shuah Khan <shuah@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
	"Nysal Jan K . A" <nysal@linux.ibm.com>, Mark Brown <broonie@kernel.org>, 
	Valentin Obst <kernel@valentinobst.de>, linux-kselftest@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 8, 2024 at 2:05=E2=80=AFPM John Hubbard <jhubbard@nvidia.com> w=
rote:
>
> On 5/2/24 9:18 PM, John Hubbard wrote:
> > It's slightly better to set _GNU_SOURCE in the source code, but if one
> > must do it via the compiler invocation, then the best way to do so is
> > this:
>
> Hi Shuah, Edward and all,
>
> This patch now seems to be obsolete, due to Edward Liaw's comprehensive
> fix, "[PATCH v2 0/5] Define _GNU_SOURCE for sources using" [1].
>
> [1] https://lore.kernel.org/20240507214254.2787305-1-edliaw@google.com

Since we're dropping that patch, would we be able to merge this one?
This should resolve the futex_requeue_pi compiler warnings with Clang.

Reviewed-by: Edward Liaw <edliaw@google.com>
