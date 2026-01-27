Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB713090FF
	for <llvm@lists.linux.dev>; Tue, 27 Jan 2026 10:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769509089; cv=pass; b=Mu/TPYd95AESjbbkl/8Pv2sHp/t05j5XP2HWhLkH0t8pkGE3/TRqBXA9Nxdoa9fEVGvBjbBb7zUzTeQ6aOpUmmfT99xb60FUC2+CjPVspRInPLUl7w7IIfkfXy/Vy0Pn59fxiyESpx/q3n8v0ygW7Hlpoex80IeLiyvNUgfBVXg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769509089; c=relaxed/simple;
	bh=9eWZA1QTRdZDTddGYL8SlE552QBQW/sLGGoi37wJCfo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LtGYVeCDpSCp/ZXTJ/Synqd/jgnetLjJ2cHE4VIeo/RqC3M+GS2wi93RpcRnY/RnUYCdrRKQNJrHYSJT0lW66nBgZurBOeUP9PH9AoHjsr3T6XP0/hQj9GxM+myU+WCGelUAhfEw+p0pKyTQoEXsSRtq/Lau+65QtHH6keiu3n4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qI1djTL1; arc=pass smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qI1djTL1"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-12336c0a8b6so1801193c88.1
        for <llvm@lists.linux.dev>; Tue, 27 Jan 2026 02:18:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769509082; cv=none;
        d=google.com; s=arc-20240605;
        b=IkOsgEl+7QXmnHC1l50WFdIxFdyfaAuTLJImHXk3GlhDavSXOb4NzfVe1vojn0m+eK
         w9JFfIOZqXuD38RNljSWKNaHyXsKT1QuOPAS0yYqSmYFrYhYWuvUxeKpIXQ48TRfHkfU
         PQEZVphIy8opYwqcrUjXAjNv4BoERmTzEqbDkrif66joqKvbZjVjAsLoNZmbG5DdetfU
         Sl5XVSV8H2YTZsZkSUQt+Yom4UOQ4SNnsd5gk8TEdzpylh2J6PslzMspP8pN+WkRvJ0m
         F/bzbzOcUy97NusrL8LwBtkupm2mqAr98gGDHvp/H8COyLg8qGT7HjAyCseB/22xncSK
         5VhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9eWZA1QTRdZDTddGYL8SlE552QBQW/sLGGoi37wJCfo=;
        fh=iNeOV2R0MBITR5JrTzanaG+ajIUxvZ2qYmuEdQ91OSg=;
        b=k3mqdZJofK3YLuUkliO6lItkoc6lnf0ewJxROAV/APb6fgR/+QWqfgZQkIXLqMQoGc
         GGhh/YDfSxT0+RX5MUdk1aKU6WRzNrQJLZQLLNlA7baiW9rZ5Rc/mR3NuwNcDXuN9Ieb
         qDoxLB2XQvDBLgp/pF8BnejZyGnrNW4rErl1Gs07/hnsULLpU8xbnxOjce28EdPawT13
         K+Fcvf1TqFu/Q600aEtCIDtWw9VczWe+a1TeRkTM8TZ2+TvynkAABCOjdNvujzB6K2Rz
         zqaWAoCa1rRy9t0MhPh+fUbxhJR0I/uea5kTWqeLlBrk7lZ6QE+9KphG+tqgZnHIeq9Y
         Xchw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769509082; x=1770113882; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9eWZA1QTRdZDTddGYL8SlE552QBQW/sLGGoi37wJCfo=;
        b=qI1djTL1GTm7rEibAoPQpQ7EgjvwDTDTW8wzMILTIyTkTX6aQpQoGQ7WjdGtpHGg+k
         FMve5rqoKbv/FZ66Ye+mRtYVEnVNbvzgZh0AqGzaAXaqKg98Y0sUJvMWxFRFRMgHyakW
         cn/8/mti7uV3yfSKO1M7BQS8OxjBPDSVW5H12VBu/kmDaWnPS1bh/b8JB/W/iCaP6zMA
         4QR8gdXdQMxK02qP42xL4IwRfmCuIFKhONaEK/zx6SJe5JfbForM61MoDxD0RnY2GBBb
         WQZQmDy1+RjKLY8SqEwqwOCC42/5mdXziBfiqc3WmPCiKKThS+UVyfreeTyre7DreMt1
         G3bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769509082; x=1770113882;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9eWZA1QTRdZDTddGYL8SlE552QBQW/sLGGoi37wJCfo=;
        b=UVi/c3efX6sxTIukGBf7eeEY6KQ1p59j7Gwnkn+HvEBn2QNDxtxWeTj8k7CpvVtocb
         hacfajXBq/cSuTVIhlXa/PLIiB09D5aYXe22mBPpWbkcJE/SOstJAPnJUmBR/TLa1+6D
         LfxSwelfrbAzc2e1SfH3C8bCgFDBeqaHSsduXGVl8eVW5qqKo3llELmo1MClDanEtZSY
         0rYF3bkgxTopNAylK8+3tw5ilB7ObDR8Lg+WFPaCsMhFTIzSgyxoPLRVRTnkGMMKkoxN
         +JsdTH5AujxSPpBLiAaf7QKzMTMKq4qE+Uo60VytYndgt+IpzsT5KhdKtCXGHpnyTS2h
         +z8g==
X-Forwarded-Encrypted: i=1; AJvYcCVo4JX0ZN9EmTeEvwLTNSQaPlJLFbScEvwFP3zsD/Cws6Ik9EmWmcaD0YmZnNKYDG/pI7lf@lists.linux.dev
X-Gm-Message-State: AOJu0YxN3r2Z5L6cGWkSeBtnXBO5L098P/kq2jw9avgKIImCa59zJaVy
	8v2vJQSCt9NGrn6bXFYxywflqmw5pU9IuTU8AUz2CKNm0NEGocGdP5dSiV3un/Hf7WNY1nHRpei
	iDTDO4d8KZumKDoyJrfoDiJ4Oa1+kGTkxConuuI56
X-Gm-Gg: AZuq6aLAI8PEoHYwifwXkjYUsJXSVPmCrs8MU9tMVHttZyK2U0VNBduJgrtRLiYvAN9
	3B4YTfeVZP4O/YjYmazD7jpVYnlmLW4WnruVAa/gBAi2O3A/j0S/yQxD8aXsB5FMqRIexX3O7bY
	PjNpFnAnyQJXvI53oyJckJw+ov/JkKOmDLIIrul4hGgNZqMMxmB+EngCjqFYP5CUakkW5MXN8jM
	ygUVUq8Xvq8q3NyOjhteSAqaXKpil848C03sjz5RG1QTN11FnhFtJQqQ9lbsS+MtR/3zImCviaT
	HEJyQvMlAXMB9V+D7aPB06a7Tw==
X-Received: by 2002:a05:7022:6985:b0:11e:f6ef:4988 with SMTP id
 a92af1059eb24-124a00cd55dmr806676c88.36.1769509081547; Tue, 27 Jan 2026
 02:18:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251219154418.3592607-1-elver@google.com> <20251219154418.3592607-7-elver@google.com>
 <0c2d9b69-c052-4075-8a4b-023d277b8509@lucifer.local>
In-Reply-To: <0c2d9b69-c052-4075-8a4b-023d277b8509@lucifer.local>
From: Marco Elver <elver@google.com>
Date: Tue, 27 Jan 2026 11:17:24 +0100
X-Gm-Features: AZwV_Qj2UVNnjgQTvKRMxq0N2rMz8K4yMXQyPWTkZbJrWul7iRYbem2vd2u4cZs
Message-ID: <CANpmjNNHmOzaCSc9hQJNuzNVHXA=LRgXB4Q69FNk6wBuuJGdAg@mail.gmail.com>
Subject: Re: [PATCH v5 06/36] cleanup: Basic compatibility with context analysis
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	Chris Li <sparse@chrisli.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Alexander Potapenko <glider@google.com>, Arnd Bergmann <arnd@arndb.de>, Bart Van Assche <bvanassche@acm.org>, 
	Christoph Hellwig <hch@lst.de>, Dmitry Vyukov <dvyukov@google.com>, Eric Dumazet <edumazet@google.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Ian Rogers <irogers@google.com>, 
	Jann Horn <jannh@google.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Johannes Berg <johannes.berg@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Triplett <josh@joshtriplett.org>, Justin Stitt <justinstitt@google.com>, 
	Kees Cook <kees@kernel.org>, Kentaro Takeda <takedakn@nttdata.co.jp>, 
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, Mark Rutland <mark.rutland@arm.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, Thomas Gleixner <tglx@linutronix.de>, 
	Thomas Graf <tgraf@suug.ch>, Uladzislau Rezki <urezki@gmail.com>, Waiman Long <longman@redhat.com>, 
	kasan-dev@googlegroups.com, linux-crypto@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, linux-sparse@vger.kernel.org, 
	linux-wireless@vger.kernel.org, llvm@lists.linux.dev, rcu@vger.kernel.org, 
	Sidhartha Kumar <sidhartha.kumar@oracle.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 27 Jan 2026 at 11:14, Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> +cc Sid for awareness
>
> Hi,
>
> This patch breaks the radix tree and VMA userland tests. The next bots didn't
> catch it but it seems now they're building the userland VMA tests
> (e.g. https://lore.kernel.all/202601271308.b8d3fcb6-lkp@intel.com/) but maybe
> not caught up to the issue this one caused (fails build in tools/testing/vma and
> tools/testing/radix-tree).
>
> Anyway it's a really easy fix, just need to stub out __no_context_analysis in
> the tools/include copy of compiler_types.h, fix-patch provided below.
>
> To avoid bisection hazard it'd be nice if it could be folded into this series
> before this patch, but if we're too late in the cycle for that I can submit a
> fix separately.

Thanks, I saw. I have a more complete fix I'm about to send.
