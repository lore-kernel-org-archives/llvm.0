Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529711DED7B
	for <llvm@lists.linux.dev>; Mon,  2 Dec 2024 20:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733172003; cv=none; b=kunpuJL6dv6dAFmO7bSPyn4Pm7VEtf9gkk0oP8w+J+hHzb/3myKH2C+7LpabG8ikLonBsDiTDwtfXucZyTLMYHPPfC7E90QQMZ0MtokIJ+ODHaVaZvZKrq9JWBZghx81mVQ1UKHgflv4TTcxgDFROly8rja3atmNyS5cXUemBws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733172003; c=relaxed/simple;
	bh=cyxcPd52gACP8SxGjZ4luSPaose5u0/LNbMFAm5Cf7A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Md2AMMajTU93qI06RBfy/ItT4ByijZyi7ydGm/RjfXCm5ACBuQGGLpChPDzoh89J78DAZ6cy8Ymp/WyiXsiqSMr8it/gknqbkM1ZOsoU59CtyJeh1OuOOT29PvFdMz9Seh+qFXIzKSBCW4cG4OOtp26nMle/VM0hykBH+71XXO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gXdykwfZ; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gXdykwfZ"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2ee67e9287fso2642537a91.0
        for <llvm@lists.linux.dev>; Mon, 02 Dec 2024 12:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733172001; x=1733776801; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bLRpz1Zk+hfN1AHa7tmG/5rj2S8mobqC+RuZhy+4X2I=;
        b=gXdykwfZI7+yuYZaMcgL7+/dXqhJBA6gn6lsMjjPCCkDMNidBwIZHSrY7RGZvl/hRc
         nbKaL98VAW6eKesZtTa5Hcut4Gg+eSq4DWBvGk8uftCA4MS7czjJ0X0CcbshKdmBwZPh
         Soeq2zk/misWbiVvMpwxMZ+/Pfvzt9pmg2uvLCKkK83vjkKeS3wolJfDLzO2Agd6bJfW
         KVVi1rnK5Eebtvqv2F2px+KucQu2sB73Zsw7VBDoZgv5brnTjwVjw76pdeY5rNdGu4dm
         auJbOg82ENfBvcBlCYHkwsWm18kyIcqoT9QYHjxxyba9N0vdlcKxP/iGnWPz3WHbPrCE
         aWDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733172001; x=1733776801;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bLRpz1Zk+hfN1AHa7tmG/5rj2S8mobqC+RuZhy+4X2I=;
        b=pg3V6XJ3J9qCFOUwr03mkUZq496j4HOfqYYvcJ7VhaFU+V/iYi3Z9I0KGJ4G3Tguu0
         6rGsSyJcj66H8welbR1ggw1y+t3VsnXmv50W5ArbLkpYYeNtAb6wF0iycUhKfuSBA6pE
         JgZBnc2pad2N32Axp7qAXfcVQFGIt74EWTdjhEzcE0rT3Pq2JqSoNqq4skqHeLa7Irzd
         7YfCahQjGAuD36R+2CvgK4raQAe5NbL9mvFoPdGYs+4LTb5EzumXNFikMP5LRaFcuP0f
         CCstfBmc7v5/Xwif/DR7xSybQvDpHEY8ugL29+tltF2HaKw7KnTZcOUd0Yl/gNec8fVk
         LvZw==
X-Forwarded-Encrypted: i=1; AJvYcCV6mAdWdZhzeATm1CgZuc5E5cvMQF/8Feys/O6vmGoPLUutsvTU0vhOLqdxiOMMKBEP/34V@lists.linux.dev
X-Gm-Message-State: AOJu0YxnzRZ1Ez3Ql+BmON+vGtrsgg3qzKbt5VOAGKT+ehZSZbd8kCIS
	z8HJy7Au+sSmNgj0LNZtdP8KaeXdvEGoLS6+NV2254Y2Wi+IwyBJACSK15yhdySunSYTLPL2L0c
	032PgKftVfQZj0Mscj6L2JPZ/a8U=
X-Gm-Gg: ASbGncu1UETfGItm5R4n1BDzy0i9ZzLGvMRlZG7pVGpmlAq9qYWRHtSSdGBVddp82g7
	nPW0ea3rxRPyMKfVQqjFGTsF1aw7D
X-Google-Smtp-Source: AGHT+IHmtqRzaVmAlDgjKyNEPsGkR13thUm6uPwrECK1jcapO0NEnL6jvuXlh2uXpxWOxWfIFYP5kAQjGVrojGvK4z0=
X-Received: by 2002:a17:90b:1d0f:b0:2ee:d433:7c54 with SMTP id
 98e67ed59e1d1-2eed4337dbfmr6055343a91.19.1733172001590; Mon, 02 Dec 2024
 12:40:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241129091003.87716-1-jameshongleiwang@126.com>
In-Reply-To: <20241129091003.87716-1-jameshongleiwang@126.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Mon, 2 Dec 2024 12:39:49 -0800
Message-ID: <CAEf4BzYAG320uwJrtehe-7j1vsta1JwHT9JJs_DcmX892W736A@mail.gmail.com>
Subject: Re: [PATCH] sched_ext: Add __weak to fix the build errors
To: Honglei Wang <jameshongleiwang@126.com>
Cc: tj@kernel.org, void@manifault.com, nathan@kernel.org, 
	ndesaulniers@google.com, morbo@google.com, justinstitt@google.com, 
	haoluo@google.com, brho@google.com, joshdon@google.com, vishalc@linux.ibm.com, 
	hongyan.xia2@arm.com, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 29, 2024 at 1:36=E2=80=AFAM Honglei Wang <jameshongleiwang@126.=
com> wrote:
>
> commit 5cbb302880f5 ("sched_ext: Rename
> scx_bpf_dispatch[_vtime]_from_dsq*() -> scx_bpf_dsq_move[_vtime]*()")
> introduced several new functions which caused compilation errors when
> compiled with clang.
>
> Let's fix this by adding __weak markers.
>
> Signed-off-by: Honglei Wang <jameshongleiwang@126.com>
> ---
>  tools/sched_ext/include/scx/common.bpf.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/tools/sched_ext/include/scx/common.bpf.h b/tools/sched_ext/i=
nclude/scx/common.bpf.h
> index 2f36b7b6418d..625f5b046776 100644
> --- a/tools/sched_ext/include/scx/common.bpf.h
> +++ b/tools/sched_ext/include/scx/common.bpf.h
> @@ -40,9 +40,9 @@ void scx_bpf_dsq_insert(struct task_struct *p, u64 dsq_=
id, u64 slice, u64 enq_fl
>  void scx_bpf_dsq_insert_vtime(struct task_struct *p, u64 dsq_id, u64 sli=
ce, u64 vtime, u64 enq_flags) __ksym __weak;
>  u32 scx_bpf_dispatch_nr_slots(void) __ksym;
>  void scx_bpf_dispatch_cancel(void) __ksym;
> -bool scx_bpf_dsq_move_to_local(u64 dsq_id) __ksym;
> -void scx_bpf_dsq_move_set_slice(struct bpf_iter_scx_dsq *it__iter, u64 s=
lice) __ksym;
> -void scx_bpf_dsq_move_set_vtime(struct bpf_iter_scx_dsq *it__iter, u64 v=
time) __ksym;
> +bool scx_bpf_dsq_move_to_local(u64 dsq_id) __ksym __weak;
> +void scx_bpf_dsq_move_set_slice(struct bpf_iter_scx_dsq *it__iter, u64 s=
lice) __ksym __weak;
> +void scx_bpf_dsq_move_set_vtime(struct bpf_iter_scx_dsq *it__iter, u64 v=
time) __ksym __weak;

Ack, this is the way!

Acked-by: Andrii Nakryiko <andrii@kernel.org>

>  bool scx_bpf_dsq_move(struct bpf_iter_scx_dsq *it__iter, struct task_str=
uct *p, u64 dsq_id, u64 enq_flags) __ksym __weak;
>  bool scx_bpf_dsq_move_vtime(struct bpf_iter_scx_dsq *it__iter, struct ta=
sk_struct *p, u64 dsq_id, u64 enq_flags) __ksym __weak;
>  u32 scx_bpf_reenqueue_local(void) __ksym;
> --
> 2.45.2
>
>
