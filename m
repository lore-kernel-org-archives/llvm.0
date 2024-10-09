Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C3A1991B6
	for <llvm@lists.linux.dev>; Wed,  9 Oct 2024 18:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728498450; cv=none; b=t7aJAVcEH+ArVD9qzShsI27oQiv9D5XN5ZJp/la5ITV1mjf6A64u40uD4AnEJbwQID+Khj3xxAiyAC0xctU4jXgdx5xDrtU9m0TSMxRDVeOccaJr2N+FL9wKgt5KcEzHKd1PcJQD7iVzACQBiFgCg+saY9lWe9LDW9JmfawKZ10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728498450; c=relaxed/simple;
	bh=icD6oDjk9SU4vvPr7VlMmj5ZCwZfB0LtWsNfm1gram8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e70okoK8aDpAfy7jwN0twr5jZHrvSR9YhJN8lBqklBi/1YJQuUD0s6DB6LsxEm/0ZAIwDvq0fikNxQ84JeyG5thcsoXD1igmxe20stbd352ZBUKY0Ba7UkL7/OgArlITke2QdBO3v/4dBR6CDemDJrTxyXuu0iA36q9Qb/ocC3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hpAkM1vL; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hpAkM1vL"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-37d473c4bb6so36938f8f.3
        for <llvm@lists.linux.dev>; Wed, 09 Oct 2024 11:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728498447; x=1729103247; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f2r/bFblN9V4MmjFbmDYE2AhavkhB01rk4LY2aZjy0I=;
        b=hpAkM1vLhzKmsOmtYBqE6tmZcpg23IlWB/aafOPJQ/bGdSqHRFxqZEQQbmHHYW+ZW0
         X4AJyQ57IkNStmZHvyIuqpUPV0m8IfRkJZ37V4QzwBwvGmDn+unKro/2fL/0Mrywu0tz
         Z2CFql0PcSDzohNuGgFU+EfQ35pYUY1c9+9DDZqZ++n16pWmMfufHBW9v1vs5dnH49Xj
         XSFB+cO4nxj9FtVd343CAZkoVprKtqX7IWDRgJ53YamjcHOwsQc2BO9OXRxBAAVdt3Fl
         4kNPdy2krCwQzW2p/ge6qZr/Cl32whD+LQFKrEgNhOdjzjIgawxEVLdkWkNJARZSfLPo
         NXAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728498447; x=1729103247;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f2r/bFblN9V4MmjFbmDYE2AhavkhB01rk4LY2aZjy0I=;
        b=m1sZ/1QJxnNUVtG/aYsSmWC9w1eCiAKrIxD/3QpoDGn9Gq4ZuUGi1WLBv39ICAfTBO
         opez2T83x+UJgXGzbNmOp/o25b0u56oh3V1eO0agDjHpKUaLrsqmUxKlbdnI2qD/n359
         PcXqBs1hTuGZs26KNGMG6IeDrrd6ecmIYXAJSz6088r2HXJFyGmofED7A3FkM5DUkQag
         oBP/6jDMP0S6DAipy5uBccAjgdtx1es1jW1ysnQjvtrpkvUJKAfuHB4N0P+6cfPxLTzi
         Wxbzp62E4J46TdSVrfBF92dczpN4asLve72z8/ydD/4A4tZtau0vuipaB07Su14TG8NU
         hJHw==
X-Forwarded-Encrypted: i=1; AJvYcCWyu9orAeGcZBas9xiBaliMYVqX6XqLkLECEP1h+rtbyGLObS9rf49+54BaN11qLo5MmD+E@lists.linux.dev
X-Gm-Message-State: AOJu0YxM1SuMa5ibvRPLRY1R2EUYKLq96t1XEbn89H62PaaJrQD4PQwA
	hR+W3EPBd2PdM2mHFQHsHhD9eL1aR5xeUzR1E+jjQcyJgKtAzNV97BBAq3strLwFlh7IvA0CWCl
	bnEuyzoguML4Eo6jNlwVnLjDXWrA=
X-Google-Smtp-Source: AGHT+IGxNDr8I+CHIy7TM8Mpvkn88RZfcj0cijc4x/3bxuCJG1Tr4Q3LqU7Ai6CT0pQZveCAagiV32/I0EocyANTa/k=
X-Received: by 2002:a05:6000:12d0:b0:37d:37a6:f4e3 with SMTP id
 ffacd0b85a97d-37d3aa41f7fmr2754212f8f.23.1728498446749; Wed, 09 Oct 2024
 11:27:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241009180500.87367-1-technoboy85@gmail.com>
In-Reply-To: <20241009180500.87367-1-technoboy85@gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 9 Oct 2024 11:27:15 -0700
Message-ID: <CAADnVQJGQ8b+E5m09Gd=bZAqQ2bLpHk+1r9vhB0As_PcmCzWpA@mail.gmail.com>
Subject: Re: [PATCH bpf] bpf: fix argument type in bpf_loop documentation
To: Matteo Croce <technoboy85@gmail.com>
Cc: Andrii Nakryiko <andrii@kernel.org>, bpf <bpf@vger.kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	LKML <linux-kernel@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>, 
	Matteo Croce <teknoraver@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 9, 2024 at 11:05=E2=80=AFAM Matteo Croce <technoboy85@gmail.com=
> wrote:
>
> From: Matteo Croce <teknoraver@meta.com>
>
> The `index` argument to bpf_loop() is threaded as an u64.
> This lead in a subtle verifier denial where clang cloned the argument
> in another register[1].
>
> [1] https://github.com/systemd/systemd/pull/34650#issuecomment-2401092895
>
> Signed-off-by: Matteo Croce <teknoraver@meta.com>
> ---
>  include/uapi/linux/bpf.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
> index 8ab4d8184b9d..874af0186fe8 100644
> --- a/include/uapi/linux/bpf.h
> +++ b/include/uapi/linux/bpf.h
> @@ -5371,7 +5371,7 @@ union bpf_attr {
>   *             Currently, the **flags** must be 0. Currently, nr_loops i=
s
>   *             limited to 1 << 23 (~8 million) loops.
>   *
> - *             long (\*callback_fn)(u32 index, void \*ctx);
> + *             long (\*callback_fn)(u64 index, void \*ctx);

Good catch.
Please update other places too:
static int set_loop_callback_state(struct bpf_verifier_env *env,
                                   struct bpf_func_state *caller,
                                   struct bpf_func_state *callee,
                                   int insn_idx)
{
        /* bpf_loop(u32 nr_loops, void *callback_fn, void *callback_ctx,
         *          u64 flags);
         * callback_fn(u32 index, void *callback_ctx);
         */
        callee->regs[BPF_REG_1].type =3D SCALAR_VALUE;
..

tools/include/uapi/linux/bpf.h

pw-bot: cr
