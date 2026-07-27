Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916C83D6CB6
	for <llvm@lists.linux.dev>; Mon, 27 Jul 2026 19:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785180168; cv=pass; b=UJPawr4O056KFIzRvaPyhWk2d6OErgplvh8ouCyqEhwQ5DPJmx7/+14VDD694ukCchUi1ReAUQCqTnQTWloLU2GNxImXtgZUmIxBTQR5ye+n44tIXwkrSy/o+Ip8KLNpK81GmEHQWG6YNQLmxoJqDDTVqhnTtfF29sfP6oQaB8U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785180168; c=relaxed/simple;
	bh=jSXdeM+VpzIULIXVGml/CvGpBpWrkqMUFrxFbvuBuSE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QLTT/LjtIBLmT5SudNaiaf6awfpN+l4qDIe8H5dlRTyYlYDr4hbGuDvX12qf8Zm2SjCNA3n+TWntdoO9jBg8Ri7W22DcqIrWYUiOsCnknIXAlgaVY/5t3OR2UP2a9nUTkvVnUtI6+w/ahzk98czYD53iNb5GxnRyEQIuAariDIk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=H1AcVdAA; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="H1AcVdAA"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c12614b81c9so523754166b.3
        for <llvm@lists.linux.dev>; Mon, 27 Jul 2026 12:22:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785180165; cv=none;
        d=google.com; s=arc-20260327;
        b=CeOoVuwxQl/IOVkmpGMO/Lqv5oOiUJLEz9OzNCgGBXJmZpG5q390cH+oVSjhkXcVcS
         DFvOQmDj0r2rlzckmgxITt3vo/YcRyQx6zlkPHbQnQKqxiqVsUUi+KAoSk3ClbEl5r6a
         RrALAI7d9A5GeN++A/T7XiUbynLb1aMC3ryZkisxUMB9zoWM5XQ7FeL+YtffbQ7B6wCJ
         httm01tJQImG4leI72FjROS+4lb3ZvflHIeaYvK7TnbQuy4S+vO/x+oaliYfhvNQsWNJ
         wwQiNmRqqRGAcUQqIRRXom5gZk+p2P8ESB9TRDjwajpAqnLxZEGuC3zvHPwNF/FqhCrS
         Agdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PzxsUu8EEz6aogAVQCyar7okPKydIEKaNYl3cOU+cbs=;
        fh=k4lThD4EEHqcWCxLZTLpI1S5xK31xKJ7dKwbpPTJv5o=;
        b=oEpD+jv+ctV5NnykOw2BOz+r8DDuT4tMAv4MZMtFel1RRzWch2tFZfyyZ1izAPV7zT
         pFMQ9jAtzk/74e1tT28HgMKwDvUi6xLmPCBHrbAsTa02LL7GQ7mOXkcjhy70JO7viuZK
         Uk7BJ+IiT7VdLLxcKqnSP3mVxM2Bq/BBFdPcwwZUvkw1vDkhBAXLbBjbpKBuM+ORODNC
         eCmTqqVUY/l1BJcfpAGjlnYwpozNgXM8Kp37WUvJzckSSYoMmqZOzqr5vzq9XFfcUjw8
         7TtPl5lYryNwkm4IJQI2j7PpjYR1gU4bCcgj2y1n+nkyX3TdrQvbWXn72Fdte7DKoAk4
         KyFA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785180165; x=1785784965; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PzxsUu8EEz6aogAVQCyar7okPKydIEKaNYl3cOU+cbs=;
        b=H1AcVdAAnb30h9o9q7iX0hdx8VlP4+i+RH/VS7D30t6tRmb9bSyjNvihRsvSuXpxds
         a7m/6X9zgzzsCUn2PjtLNIyqbDSmBy7c1tAyaoXAt4yyX2T4z3UYSRE/+6yuv1KAIoIH
         qqQ1zVew8fAtAh1rldldZNjpFrGQuNniCAG+7gQyNVolYzyz0xKwcTv8ZRFBSHjpmpXM
         fW3RhS2Vu6+izoSHi1seZI/EplEDQD5lNG8+nF7EDt6RFlinJgSkt3pwfY3q0IMut4y/
         SMtdrl8pyHZp4gClaMfHr57RiHkvRKz2V6FWy5pvQhjjdoGZsKIlqiRcDglpPGiilWLt
         kbdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785180165; x=1785784965;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PzxsUu8EEz6aogAVQCyar7okPKydIEKaNYl3cOU+cbs=;
        b=JEqgyRcMVvplo4MyQEY6OK7jggDiaLaapYIu++TYMtxBXxqRUIiE40iJZqYuElEqS9
         t3EC5jYYhFrm66boYNcljzM1SkPS71E3YG/ElGfX1+NLn3QI2ZXZ+ijVIxouImH3MKox
         oT8Dxf39C+IPZgAK+RkuIbFuc7ua9YB0uFf+jkOkIzptYx96iJkptiSJxu8uqgGKckQw
         avAHSLyQ0ZA+IcDvYMp4lKWbmYzke0E/DjGVjVwqlWaOsoVQCfb+b+PxNjNrUeOMVP+I
         axjFtvA4yzzxRR5FgDuHv6RSoXk6LqFkY2U4pPb5Kysph6Z796fxY/suYKrr9BY2/BrL
         +dEA==
X-Forwarded-Encrypted: i=1; AHgh+Rp6194EKNCcIObdXmI/scDYSsrBwUwW18odpfD390hefVfBnL0xTZxrD5MP44SqS4YVOH1J@lists.linux.dev
X-Gm-Message-State: AOJu0YwILRKmrxirH30dtMy8aCuK/th1s/RAV+5UCCBKVcvUFn4SUQFB
	74Kwn5p5P/6sIV3hRiVTYGBLSIR8UABP8ZYw9WImk4sY1wLXqGDuDgIeMx2yGtScwhZkc7RRLre
	+dCogGn2t6MinzyqT2J+WI6jpjXkjjTlBiODI/pMt
X-Gm-Gg: AR+sD11K1AuJyhG0rsLBSRWdowfnlkx0LiYJ4UPSb6JOqwWBVSsjLb/zUezejK8x91n
	ZGjKBx0QuwhHXtQ7kIO1/kjTGgCm/R9lRwWFouHcXl0LWvp1PHRbtqvJWBoduNfh0sc7tWy1Urm
	0TxwWzTkJAF0CecB/byyTo01sph9dGporisUGfwfGmKKtywb/HV09bkJqaWFidiP9QEpVPLJwDE
	85rPd5lfVv1voX6QIt1F8cw+C0do0Op50Or3xZC09PC4K2Wa3VWIspM1h1ygzczKZQ7FogQ1UnP
	0II5DLSog+IjaP0I1MUH8cLLsl4nCH17DaSsfj83BLj/lLSA8ezBnB7Boja5prUyDhV1ftcYLA=
	=
X-Received: by 2002:a17:906:eec3:b0:c1c:62b4:1ebf with SMTP id
 a640c23a62f3a-c1f692f28c3mr17259666b.60.1785180164098; Mon, 27 Jul 2026
 12:22:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1785153469.git.hongyan.xia@transsion.com> <eb38b41ae1b3216ec69fb45555ef5df57efd7b8d.1785153469.git.hongyan.xia@transsion.com>
In-Reply-To: <eb38b41ae1b3216ec69fb45555ef5df57efd7b8d.1785153469.git.hongyan.xia@transsion.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 27 Jul 2026 12:22:32 -0700
X-Gm-Features: AUfX_myNeo2p_4eMOzizBRqY-lBcfNbJZ5LCrTo2tmMUomZNZli_Ze8j8wrUS8M
Message-ID: <CAKwvOd=HeG=z1j2qB-SX3NQ=62ERr=KpQNZyqqp2Qy4kZ54RLw@mail.gmail.com>
Subject: Re: [RFC PATCH 9/9] arm64/debug: Mark debug exception helpers __always_inline
To: Hongyan Xia <hongyan.xia@transsion.com>
Cc: Will Deacon <will@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Christoph Lameter <cl@gentwo.org>, Oleg Nesterov <oleg@redhat.com>, Naveen N Rao <naveen@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Nathan Chancellor <nathan@kernel.org>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Jiazi Li <jiazi.li@transsion.com>, Pu Hu <hupu@transsion.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>, 
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 27, 2026 at 5:25=E2=80=AFAM Hongyan Xia <hongyan.xia@transsion.=
com> wrote:
>
> From: Hongyan Xia <hongyan.xia@transsion.com>
>
> Static inline should be enough to actually inline functions for most
> compilers, but my Clang-19 somehow thinks it's better to outline them.
> These tiny helpers then live in normal .text sections instead of
> .noinstr sections, violating noinstr.

Anything special about your build or config?  For example, we've seen
a recent influx of bugs around AutoFDO not inlining functions (despite
constant propagating initdata constants into them) leading to modpost
errors.

Can you perhaps share your config so that someone else could repro and
take a look?

Happy to follow up in our issue tracker, too.
https://github.com/ClangBuiltLinux/linux/issues

>
> Mark them __always_inline so the compiler can never outline them.
>
> Signed-off-by: Hongyan Xia <hongyan.xia@transsion.com>
> ---
>  arch/arm64/include/asm/esr.h       | 2 +-
>  arch/arm64/include/asm/percpu.h    | 2 +-
>  arch/arm64/include/asm/preempt.h   | 4 ++--
>  arch/arm64/include/asm/ptrace.h    | 4 ++--
>  arch/arm64/kernel/debug-monitors.c | 2 +-
>  include/linux/kprobes.h            | 8 ++++----

It might not be appropriate for the changes to kprobes.h to go through
the arm64 tree, but maybe it is?

--=20
Thanks,
~Nick Desaulniers
