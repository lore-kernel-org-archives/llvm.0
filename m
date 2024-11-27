Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C90819
	for <llvm@lists.linux.dev>; Wed, 27 Nov 2024 17:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732729554; cv=none; b=b5LEkHFcOahBUHZlYt3iKedrGjUmA/yfQuYHzH9zPfNZL+UNgOvPoKdJaiEPbPcUyR8RQNqqIPzcparT1iJprSEvR2fTFFzKXzwlDOoB6+PQ0PC4VRUoQeaMxc35ofaJmjND55LRAWdrVGoxN1f1nDxGH6Ni0TWpxs8Tlotry/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732729554; c=relaxed/simple;
	bh=8OfaUvJ9o9eIT//2viRH5VonqIyT8g3R4krV9Hm2+Q4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U8fiKsl9NfMDr/E/NkwJoZgPwTGxptNpcvqana6BhTqtCFn5dAwC3/Stb2ngVQ5EIXIC+TI5Pz+ZLWVPsG8OEaE7jBkCLURRG++7Bndu/aKC2uacyXQggfRjY3g1lOUUBDiQegCTqOqfeNOTTIpkc1gVjVriOsEE8doOuWIhO4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EiiT8GOt; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EiiT8GOt"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a9f1d76dab1so1159330766b.0
        for <llvm@lists.linux.dev>; Wed, 27 Nov 2024 09:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732729551; x=1733334351; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+GM1k7e/CGPkjphrw4jyDzxyswsZTnM5h4OmjO0f7EY=;
        b=EiiT8GOtDRVZnhu9JGcbejecY8/1dQBZFGocHLiD81o8OmBAZoNNASC6wE0okJ85g6
         AOe6+U6Bw+6viu3fKbYinp/zPAzXkS8LkxeBZGPIbImd0im3UNJkwKTQPMRMG7VzWQaf
         X3TKjjs+wLwlCtz31FHg3x1haIPBVFj02Gj1+aGa/E794HH8zFppEjTRtw9E/olQz0h1
         +rdNsr3nqmZePBwa+0s1VKvy7fq2d9s2u0HRivY47SHjipraCKh3lc/Q/vp2yqAzxKAt
         Ix3fBzOAsBGOxWLnhKxK0KO1MdyE3BqM69a4gErwoFf9brmqCoRXe0lgNEwUaz9KTK1L
         MRoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732729551; x=1733334351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+GM1k7e/CGPkjphrw4jyDzxyswsZTnM5h4OmjO0f7EY=;
        b=e9bGh8fJf4ql8awX4yG8cKSmCBj7JZTbW2+e1YZRCKmeJKfWKEJUGkESit/dQ5k+7U
         k2/2ty3ruhXVg2XyfoePeyqaZMnEVMbseHWH30vs51uaWYmXUQTT7OuANZjcrWKa4A74
         LqUBCligpa94njrR/23BdxBsxDFZmmOjXbmfG1rsI8//DJSVBnKmHr95vEmaGmp7RFEM
         aI6Le7+TZ9Z6N6lehCDT+mBeDQLTs5/XMkSUmToX41divIt/lhzrx7mTHjxwpYul0Snx
         BlkzWbZ9Iso+v5e+7Ac4k/HpH8hnZ9UZZslBboXyIoycGgx43e/k6DYf4tBA0sS5jgHk
         A32w==
X-Forwarded-Encrypted: i=1; AJvYcCXaQxr1J8uoN9iCgpe4Gab1JRnB43KPVIYPYH2zZbF0vQwtQaiDH6J4sfgWnzZXL/T9/GsE@lists.linux.dev
X-Gm-Message-State: AOJu0YzhxRmi3MO9fT1c8dMH73cynTiKYivxHxSHLUG3rdl+54xKQO+z
	zt76wUqfN3jnz/0l4KG3Mb9Am7tJStaRwWWb74ZlHhrJnJKe/zno0h01wfHdvOpkEWVH/BHiQqm
	OFvRbWCkqsHtWsnP7nhtgzF9Ufz0=
X-Gm-Gg: ASbGnctI8Ys/ZOteBMr5bn8hYDL3DNz8e2XbhOMMMGCeduAvKB8n87qrdCYLuZ4scRs
	osS6alk1O0GFlzQhjhsQ+8v9y8In5zj4=
X-Google-Smtp-Source: AGHT+IEU+8rlp9swAa8yRpNgrrvRbJDFo5WKcO/NokGdy7on0sT9HWVZf7T7pR+rv2OwOGDtoxYZO5X/CiiVRTRc7B4=
X-Received: by 2002:a17:907:2cc9:b0:aa5:49a4:9189 with SMTP id
 a640c23a62f3a-aa580f5753emr388982866b.33.1732729550833; Wed, 27 Nov 2024
 09:45:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241127165501.160004-1-vschneid@redhat.com>
In-Reply-To: <20241127165501.160004-1-vschneid@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 27 Nov 2024 19:45:13 +0200
Message-ID: <CAHp75Vd2T0-k-RuVK37zmEzWPAnWAhpRN2cBANvg=ENT0_oGFg@mail.gmail.com>
Subject: Re: [PATCH] sched/fair: Remove CONFIG_CFS_BANDWIDTH=n definition of cfs_bandwidth_used()
To: Valentin Schneider <vschneid@redhat.com>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 27, 2024 at 6:55=E2=80=AFPM Valentin Schneider <vschneid@redhat=
.com> wrote:
>
> Andy reported that clang gets upset with CONFIG_CFS_BANDWIDTH=3Dn:
>
>   kernel/sched/fair.c:6580:20: error: unused function 'cfs_bandwidth_used=
' [-Werror,-Wunused-function]
>    6580 | static inline bool cfs_bandwidth_used(void)
>         |                    ^~~~~~~~~~~~~~~~~~
>
> Indeed, cfs_bandwidth_used() is only used within functions defined under
> CONFIG_CFS_BANDWIDTH=3Dy. Remove its CONFIG_CFS_BANDWIDTH=3Dn declaration=
 &
> definition.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Thank you for fixing this issue!

--=20
With Best Regards,
Andy Shevchenko
