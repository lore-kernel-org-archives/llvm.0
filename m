Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57322376F1
	for <llvm@lists.linux.dev>; Fri, 29 Mar 2024 20:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711744424; cv=none; b=DbFRe1wZ/6sZWetyLdh9CSplhQpNRc0IlHAf4WxRudo+2WK+sqK/xyn1zhch9oVRxiyW4luEBwHABJKqJdiRdQ/EI0NDVSM6T15tyLXB7Ti86R8vuOB2N7hwMqR3wR4FBj+hTUTP9wBx64ZRLQ0HRKyyMQmI1MlSj5afEDhTR1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711744424; c=relaxed/simple;
	bh=7fJ4rSAI0GoYiQAMJdDfQgj6t00Kp7TpJETA/wU9wok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Iqs/fL+EKZRAAPtEkdUo7yZxZLqjB3itpq/P6tZbywT/GQjEm12LGK8J2cg2LlzUS5BeeLWdLSkYBhTvqlVF8ZMuGrOPeuabT36CDlG5WNwcBk4Zwv5M7PqYq2Y2ubZM5NI8t9/T/OXo5CwT1S91m5UqYpIuKQncdpjamGoK/Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZCZ06w4C; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZCZ06w4C"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-56c63f4a468so10799a12.0
        for <llvm@lists.linux.dev>; Fri, 29 Mar 2024 13:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711744420; x=1712349220; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7fJ4rSAI0GoYiQAMJdDfQgj6t00Kp7TpJETA/wU9wok=;
        b=ZCZ06w4CuKmRO+56N0w842AbfPOWGFsMAvSUJS0diR+1ij+sopSR7mPAVXxYJYxlYF
         rOlxlXzGliF/r97c4nTdBRMWIWiKhAU3xTP+aPd0eaJZQHl7IjW1NCiZyPrJ8lQPY135
         vdeoQtWuLrGjzsicdUNZNRsjiHTSqzu79OjgPgAFxSmp8Osp9rN3E+YFRaUIPbQhR/yq
         8Pb0sGqGBO5TFZUB3Cc3x2cYBpe0YbDn+GBJuz6FXQ13aEgb5Foz8ND50zfKjTmGxx4i
         0KeEiR3IcvpIGeBWLklW1d+QBW/DZvIm/C6VyWBSJFX0EY8qqiVLoVNPkJzFzMBD64te
         +kIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711744420; x=1712349220;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7fJ4rSAI0GoYiQAMJdDfQgj6t00Kp7TpJETA/wU9wok=;
        b=H7JOknEquNKFeZp8B5MPNvJFSdB5wZ8jERDuLBuaXOtNfC6sfn1uBHET3ol0iAAG9A
         AKTcY/+2dW6i/I4Vve70Csold3lfAOwT82pTdWDP/2N2dvXS3+oLmOx1tBHRHAPK04wA
         8uzVrYlAAdfwwqnowehcUTUQCude2VG2iHBCXr9L2LbY2B39mbHXj4FcX1a0lMDUVsas
         sE7z7VDPNtKmg6H98EInih2FPduC52lLj6sBZ/ABTompnklpMIQM9I/xRCYJbLLnFk7P
         xy6U4EaB3tloKAsI9CYQ1sHwBoT4WsGaYi0k21O1dEFA5Ys71m9I8TsCs086MWIK3DgX
         ZNhA==
X-Forwarded-Encrypted: i=1; AJvYcCVHWVcYlavEL9Fgc3hCsnE2iNW9wzVvEKtoDg6YMMU/u/DAGQSn7ikf8GHWAhC7HHO+gnnN28+EyAmbIjlZc1paRaoIEQ==
X-Gm-Message-State: AOJu0Yx82/L2oPmp9hm+GaqBuDzi5IcVisIVeu2knDpIL1VoNN2EIFkH
	K+PT30eTgDsZKPx4bDvzh0FMa85Pb4l7f5gQUeoPf32IGXDybW2fRGY5XOoch63lt7vS3pTwFrg
	isRumTSsGgyni3CoPWOScwFNfIQdAUq2dXlR9
X-Google-Smtp-Source: AGHT+IFMizgS0G5ukFYvjYIGxUljt4fuYwgJVd/7xudG/ccYnF78sLbJwmbgsF7dKolFZvWx8Fq/tlthiyGNWzulF3Q=
X-Received: by 2002:a05:6402:c94:b0:56c:2d40:7430 with SMTP id
 cm20-20020a0564020c9400b0056c2d407430mr138817edb.3.1711744419595; Fri, 29 Mar
 2024 13:33:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240329174236.2278217-1-edliaw@google.com> <909806c1-a9c4-4f51-a807-46075efb8ab9@collabora.com>
In-Reply-To: <909806c1-a9c4-4f51-a807-46075efb8ab9@collabora.com>
From: Edward Liaw <edliaw@google.com>
Date: Fri, 29 Mar 2024 13:33:12 -0700
Message-ID: <CAG4es9UYvT5tRPFtsRUqJnz9obLuAz03b0+61aAagmGjGTMnsA@mail.gmail.com>
Subject: Re: [PATCH] selftests/mm: import strings.h for ffsl
To: Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Peter Xu <peterx@redhat.com>, 
	David Hildenbrand <david@redhat.com>, "Mike Rapoport (IBM)" <rppt@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, linux-mm@kvack.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2024 at 12:32=E2=80=AFPM Muhammad Usama Anjum
<usama.anjum@collabora.com> wrote:
>
> On 3/29/24 10:42 PM, Edward Liaw wrote:
> > Got a compilation error for ffsl after 91b80cc5b39f ("selftests: mm: fi=
x
> > map_hugetlb failure on 64K page size systems") imported vm_util.h.
> >
> > Fixes: af605d26a8f2 ("selftests/mm: merge util.h into vm_util.h")
> Why do you think this Fixes tag is needed? This refers to a patch which i=
s
> just moving code. It doesn't seem to have any thing related to strings.h.
Oops, I guess it should be:

Fixes: 6f6a841fb77d ("selftest/vm: add helpers to detect PAGE_SIZE and
PAGE_SHIFT")
