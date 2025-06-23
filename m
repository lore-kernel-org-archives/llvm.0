Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C969C2E0
	for <llvm@lists.linux.dev>; Mon, 23 Jun 2025 21:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750714367; cv=none; b=RYz6Bittekyo7UDMSopsMasOrYeWunyQeOyBBfio+vXgMHV+0pB2jiG0FO91F8n97ZbcyhpGxp5zZMMTiKrn7S0H4kXHPtMZeHnbotZ71kSYvBrC49uuo0hl6uFlhY8lGPqaYuWJQQ66tGU/sMVKzrF83UbuokteJ0uwD+gtyx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750714367; c=relaxed/simple;
	bh=4zh+xxbkoRglr6aW4XThIl6PEdJzTzddhl4ZBhve3YM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CO8aIkLhas0o/+kAV/NCPrrW346ANtmt4E+KJPpIq8ICgVW8a1cuVcn31xHKN1duppuOLBAln5qJXX2pIc41QmnBM8X3JACCem6OHWOs6w6ZXfl1dmdeKqP0zAaQFm/W0gSURqk4MJr4A8qpb4LkozCRXEjBsgCdgn75a31qCqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GoIrY1KQ; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GoIrY1KQ"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a54700a46eso2626931f8f.1
        for <llvm@lists.linux.dev>; Mon, 23 Jun 2025 14:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750714362; x=1751319162; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AoeN7Nd7LhLzbX2MmQNc/Ha98bARr1ZjkS1yCdPK5m8=;
        b=GoIrY1KQsknkCVGfTXPDb5v91aja35DLp1H71C4sRFE3pZaDx3mnQV6zxpJJrTV1JL
         XdW5GV1KSAhlTufrhy1Vg2YLH+eU2xly9l/gH4sAs/2PoEbdMFxAthB6j3O880io+LmS
         BAttyKP1iAVcyyF/lr1x0dtm8T/akUsNFhf90ob1mXnTGtEJHb7he37BXA+pkqF54Vk7
         MJTpE6uT35tBxd/eS9MdnVJy46Oesru81rv7On8uJKRFstaVsbNpuQwOgKRmO2MIxHMj
         os8njAg4SKVUlvGNUYHSDaBVFi9Q/ydF18ByWD2XXnsAx3o5RhGalYtCvkD2yyFMN9U/
         Kilw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750714363; x=1751319163;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AoeN7Nd7LhLzbX2MmQNc/Ha98bARr1ZjkS1yCdPK5m8=;
        b=LYeGnbtvEPXyDNtVelvfwFu3mP4f5JyVq6oumg2eJ10id6dDz+1A9Fhd2EBvESa+B8
         lH2kO9R9hrWmO1HKIaDDBJoguMC58quvMq1VZmBUYrpAkpsdfel6ED6YEi7GAnaLzTMf
         qc2aB1JckL/DIV54ZzZ2K6v7TfmCQIXBG/OVftpvmX/9mbE20d42SNTedb3JC6U7kV3D
         37vp0Haz2NbPFlOajc9t+AKewzgBSfjDdkWgV129+/Ng1JWNfhW5+7R8tyljQIsxVEWC
         i+r8H/KPTRhYT7+dWYnFAnVYp6gK+vn0Wbz7W8euEKu7WeaysrVXzKRW7Kbhx9EmJnL7
         slSg==
X-Forwarded-Encrypted: i=1; AJvYcCWAtB6kpCHg75rcVJSjR/3obnzirnFj1PMTHc+PXNfDarTR0FGDJwBIoeQcN1wxTotDb18X@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8EciA8RmQbQiiH0Cam4qR6qsguF26VqriFDicahRUQFZXeySH
	Dleg7VR1Kw9tEiWNM4dZgXJ1ylsHWPVMXKuzSL9DTdR4i5/yEf0iJgvKkCKWXQ99YWB/0KSskwP
	w0Y3kT5MshFUyP02Y1iyTbQG9CVribVY=
X-Gm-Gg: ASbGncu+gq+H690ifVn9cDohGqdkH0rtKdRcippf8ZjvYgjmt6KVWJz5FdEkYIMV2W4
	E4Ebx0zuh107YN7TiIA8QOKP/nMgJ/hffceASPcx2IuBWQvQzwv8rxzJvLqiUnZAG5tFL2znIuI
	Erlujcmj2+OU89WAPQEvrl8KiEt1gyXateJIcp8OtLL71p0vnqO3QMw7gfIqFTDZpxR2zB2j6M
X-Google-Smtp-Source: AGHT+IHYwRQkSwfYn+DatykzGLdl98MLgaiclDKQwzz/wbEtLLzMcNSSHTjTZPByDoVpnJOhNqcPOCT91iY0sddpOk4=
X-Received: by 2002:a05:6000:144e:b0:3a5:3b14:1ba3 with SMTP id
 ffacd0b85a97d-3a6d132ba15mr4470376f8f.49.1750714362340; Mon, 23 Jun 2025
 14:32:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250620113846.3950478-1-arnd@kernel.org>
In-Reply-To: <20250620113846.3950478-1-arnd@kernel.org>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 23 Jun 2025 14:32:31 -0700
X-Gm-Features: Ac12FXzBGTpanj8qtABM0kpcQOKFRs4cKdB6Bn1jYDSFFE0H-M5iNHkCgZ5hK9M
Message-ID: <CAADnVQKAT3UPzcpzkJ6_-powz4YTiDAku4-a+++hrhYdJUnLiw@mail.gmail.com>
Subject: Re: [PATCH] bpf: turn off sanitizer in do_misc_fixups for old clang
To: Arnd Bergmann <arnd@kernel.org>, Yonghong Song <yonghong.song@linux.dev>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	John Fastabend <john.fastabend@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Luis Gerhorst <luis.gerhorst@fau.de>, bpf <bpf@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2025 at 4:38=E2=80=AFAM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> clang versions before version 18 manage to badly optimize the bpf
> verifier, with lots of variable spills leading to excessive stack
> usage in addition to likely rather slow code:
>
> kernel/bpf/verifier.c:23936:5: error: stack frame size (2096) exceeds lim=
it (1280) in 'bpf_check' [-Werror,-Wframe-larger-than]
> kernel/bpf/verifier.c:21563:12: error: stack frame size (1984) exceeds li=
mit (1280) in 'do_misc_fixups' [-Werror,-Wframe-larger-than]
>
> Turn off the sanitizer in the two functions that suffer the most from
> this when using one of the affected clang version.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  kernel/bpf/verifier.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> index 2fa797a6d6a2..7724c7a56d79 100644
> --- a/kernel/bpf/verifier.c
> +++ b/kernel/bpf/verifier.c
> @@ -19810,7 +19810,14 @@ static int do_check_insn(struct bpf_verifier_env=
 *env, bool *do_print_state)
>         return 0;
>  }
>
> -static int do_check(struct bpf_verifier_env *env)
> +#if defined(CONFIG_CC_IS_CLANG) && CONFIG_CLANG_VERSION < 180100
> +/* old clang versions cause excessive stack usage here */
> +#define __workaround_kasan  __disable_sanitizer_instrumentation
> +#else
> +#define __workaround_kasan
> +#endif
> +
> +static __workaround_kasan int do_check(struct bpf_verifier_env *env)

This looks too hacky for a workaround.
Let's figure out what's causing such excessive stack usage and fix it.
We did some of this work in
commit 6f606ffd6dd7 ("bpf: Move insn_buf[16] to bpf_verifier_env")
and similar.
Looks like it wasn't enough or more stack usage crept in since then.

Also make sure you're using the latest bpf-next.
A bunch of code was moved out of do_check().
So I bet the current bpf-next/master doesn't have a problem
with this particular function.
In my kasan build do_check() is now fully inlined.
do_check_common() is not and it's using 512 bytes of stack.

>  {
>         bool pop_log =3D !(env->log.level & BPF_LOG_LEVEL2);
>         struct bpf_verifier_state *state =3D env->cur_state;
> @@ -21817,7 +21824,7 @@ static int add_hidden_subprog(struct bpf_verifier=
_env *env, struct bpf_insn *pat
>  /* Do various post-verification rewrites in a single program pass.
>   * These rewrites simplify JIT and interpreter implementations.
>   */
> -static int do_misc_fixups(struct bpf_verifier_env *env)
> +static __workaround_kasan int do_misc_fixups(struct bpf_verifier_env *en=
v)

This one is using 832 byte of stack with kasan.
Which is indeed high.
Big chunk seems to be coming from chk_and_sdiv[] and chk_and_smod[].

Yonghong,
looks like you contributed that piece of code.
Pls see how to reduce stack size here.
Daniel used this pattern in earlier commits. Looks like
we took it too far.
