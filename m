Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46EA33AEF22
	for <llvm@lists.linux.dev>; Mon,  9 Mar 2026 16:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773074631; cv=pass; b=kbGd3jyWUsqmuyZ/st3H0ApoJGBj7gmfUsFqg8hyj7J5wiLrjtYqbCbvfs1kyrt3+m76eGJKVLAd9tBPiBXipb/phi8ZKMp+u4PNU8OesfNhloryetmo/EYIE4acAtKCltpK5sT+8xARZHNdyRNP8t8dd6GqOJRGU7hgQ8R7htc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773074631; c=relaxed/simple;
	bh=AkNgp1eLlxvEHqjLOIKt78ShAP+kfaM9ulUs6EDX/Cc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P6h95JnzL+SsnTzkuhXBOMOdzJCFmLeD6fuGOfhSJ5Ih/LcCfampebtf9nhxykSAMufs9L+R1WfToB4gjzsN4MQVuO7Niia3A+DOGDrZJ9l2+tVndi9a73e5LdUxKv+zQK7Qw6HFNu97DZ+OcMGckT1sr43HhKzFFToOKn2b4/M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UTZb0XH+; arc=pass smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UTZb0XH+"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-439bc14dcf4so5336506f8f.1
        for <llvm@lists.linux.dev>; Mon, 09 Mar 2026 09:43:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773074629; cv=none;
        d=google.com; s=arc-20240605;
        b=azHdwoI4POit5BYoDaVou1cCRlRHLy/x39qf71NG8A0Vn5XC5DX2JqOzkD1tptuKoZ
         w1QZJ9qpnImU531HEjeVZ4oElmhfkZw8Bfxaq6ENVy+QZCTcfNTWrmOTq/J//2iwpc4u
         XOcMMBzRkyx6vYuWu/HCooHR/cmSMEuMdrUn7lkoOedwXuO3NMosXaAFYB0YZaEdQxuy
         VFaJ3jWL5e2n8+goRNKNCh+w51eYsmpmdge9L89TbahMp6BstnX63Ty4wJON28qh6d3j
         iozAin8LuXFIO7ockSrHJ+mHcy8wUZRaKkdY6n5OH++opRDPwRWlo402cb+/h7xhLjZP
         N9YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e4EhVoj49ZUMnMW1q1OJFdF+yBsMfqNiDQfLN/Qthj0=;
        fh=z1iMJsYqbDNoJaTut1Eih24E6yAfwWBfuKiz00loMCg=;
        b=I6LuhFswuInRKBeDDfuZDpWWy1zsp8oBH6UuTvzUu+oxtmbcnJjSWcslRpVjRib2P/
         G/oH50GrUSdSpVfvr8ZBZWuiMY9f/YS2ZB46AwqQLeCD+T2201Zqn79XYihfl8gTL/gi
         KtW81HZ1zg7/v6ukUpPhkxmwRxnQboGRYAFWHF/KhF32kymwipS5AULePiRThFE/4HOh
         PA83kKFwh7lyZb0zx3khIikvHY7gYCtcXZuioiFHTtftdesol7T3XKuAFR2Ycb/WBskp
         8ZnkD8vevnsrOfgTv76X7CkNSUst5aCWJAuQdL1FXVut/uyBp+Am2uSdeZ0yxbZJwVF3
         CvcQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773074629; x=1773679429; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e4EhVoj49ZUMnMW1q1OJFdF+yBsMfqNiDQfLN/Qthj0=;
        b=UTZb0XH+EtZiMYpo6AjUTP3R94pOxteYmAb7LfR5v9LqSILOR/+hi8D70bJMoy9hnb
         iLuNhAiC4cwbsGvXZXFRKrsUe+Q8lXgvNKyWAvoXf5dBis7frOxTodx/1qOpSruIhpPi
         7ZQE6Ai6Bi3OOAtcCkQT8pIo6DTeJ07VLHxWkcrgAYw51jCFVfWVtBMg0uUgArHvmV1q
         q7RSwxy62pOrmfKPhTa0Ok4gltkvkuaxC2xM+NbKcKcWfNSOaDD6ZJx0UOuV4Cktlb/A
         r8AFd4zi+9jIRqb96j7Vlb5jTMa2cwXiZTQuM8iHJxo5DsUr2VVSXgAXzCP015tsQAFr
         dN7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773074629; x=1773679429;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e4EhVoj49ZUMnMW1q1OJFdF+yBsMfqNiDQfLN/Qthj0=;
        b=UuDdfz0KQlZ9qViODgvu+Golg5LlebCril0N3ObInifbJK6l3kS4Gp6xxTM3BuEqgY
         IH+hpEQ93W4c767AO9eMLSsG1GvSNoe32sHTjYA+jSMk/4W3o8wqKXTdx06Tozu+c+td
         fAByuWdiYiIJnga6NvC/kkVxWmyWPnlAsZa13WuecKXZUVXdO+ZsRsWE0ekzU4TrGr1I
         8IoEPy5chs6mA35LSua7rNsCQzfGl8u6fGc93YS1QDwtEWS2p/EKxTLjkhZmgy2Nm5dX
         P/z/79kqe/jELmSAxKdRQe7nkDUkDu5Y0/9IY2q5jxSnEtCsKp/6syP1P87ruB9Ig5BA
         URdg==
X-Forwarded-Encrypted: i=1; AJvYcCWnxtMTEa6w2ZZesqOVAx/wPgZLHUJ+jZlpTHD0isnzNsyolgCsMzsMQq2CzyVFD4I0YL+n@lists.linux.dev
X-Gm-Message-State: AOJu0YzBFQskHPjMSdz0Qsts1eufsHk9NU1LQbDNYy1awLd9LV7VnqmH
	qeKZO5DedMq5ZzUtlSna6NTVfNVTLbPNabp8vL5SopbRWfiaT9P1pabhCyTFOycugLfRJVOf9Vc
	kp5739dE4JPX50gPmgx8DUYY4CdFYQts=
X-Gm-Gg: ATEYQzzwnnHKraezmyQh5b4fTuQnFpVHCxwTY96RgeXnCyygjLKg0Exc30fMD2myKjF
	sGndIJde31lKfv5YUg9tp/E+bJXnMUe1ngVPQ1Bpwp0WmnY+PK7HpWtovutaiigXgil/MsoUmk0
	PZ19mMB3UdzEI/sveulOTn4KuUlsIVOl7Pcb0WQ56s9WqRarQ1LB0h5TNEUz0tA2sIzlTpBeisc
	lojQcllmnX08hPdf7j1ChWw6qf5g3jIMwfZX8yjbuEXklZ/fU6/TkwHs7cy9RupWd8+RiUW1oH8
	K55uK9XCqzZY/vlUa+OF9JiQUSzR9Q6vaY7YJP3xR8uvUcEzQWToIwDukNIUdUwR6xY/pvEDzU/
	iIUCAutdzW/Z6QXO0qJ+UBZaReQ==
X-Received: by 2002:a5d:5f82:0:b0:439:ddc0:4bef with SMTP id
 ffacd0b85a97d-439eff2fbd3mr537205f8f.8.1773074628559; Mon, 09 Mar 2026
 09:43:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260309022847.106150-1-zhaomzhao@126.com> <20260309022847.106150-3-zhaomzhao@126.com>
 <DGYECIPVC266.25320R7256YJT@etsalapatis.com>
In-Reply-To: <DGYECIPVC266.25320R7256YJT@etsalapatis.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 9 Mar 2026 09:43:36 -0700
X-Gm-Features: AaiRm50Dkzn77wqhRT6cnmHBFSFIlO8rogOJoWrV3he1NEuRyNufB70yN3teypA
Message-ID: <CAADnVQKdrt3fRcfBrJqSfPP9ALVD59cAQFuDANQG+_=0XDEq5Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] tools/sched_ext: scx_sdt: Fix BPF verifier
 rejection on older LLVMs
To: Emil Tsalapatis <emil@etsalapatis.com>
Cc: Zhao Mengmeng <zhaomzhao@126.com>, Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>, 
	Andrea Righi <arighi@nvidia.com>, Changwoo Min <changwoo@igalia.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, sched-ext@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>, bpf <bpf@vger.kernel.org>, 
	clang-built-linux <llvm@lists.linux.dev>, zhaomengmeng@kylinos.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 9, 2026 at 9:40=E2=80=AFAM Emil Tsalapatis <emil@etsalapatis.co=
m> wrote:
>
> On Sun Mar 8, 2026 at 10:28 PM EDT, Zhao Mengmeng wrote:
> > From: Zhao Mengmeng <zhaomengmeng@kylinos.cn>
> >
> > Under Clang 17/18, when running scx_sdt scheduler, it fails with:
> >
> > libbpf: prog 'sdt_init_task': BPF program load failed: -EACCES
> > libbpf: prog 'sdt_init_task': -- BEGIN PROG LOAD LOG --
> > ...
> > ; desc =3D desc_find_empty(alloc->root, &idx); @ scx_sdt.bpf.c:479
> > 43: (79) r8 =3D *(u64 *)(r6 +32)        ; frame1: R6=3Dmap_value(map=3D=
scx_sdt.bss,ks=3D4,vs=3D200,off=3D120) R8=3Dscalar()
> > ; for (level =3D zero; level < SDT_TASK_LEVELS && can_loop; level++) { =
@ scx_sdt.bpf.c:407
> > 44: (e5) may_goto pc+51
> > ; idx |=3D pos; @ scx_sdt.bpf.c:418
> > 96: (bf) r7 =3D r2                      ; frame1: R2=3D0 R7=3D0
> > 97: (bf) r1 =3D r10                     ; frame1: R1=3Dfp0 R10=3Dfp0
> > ;  @ scx_sdt.bpf.c:0
> > 98: (07) r1 +=3D -56                    ; frame1: R1=3Dfp-56
> > ; bpf_for(u, 0, SDT_TASK_LEVELS) { @ scx_sdt.bpf.c:447
> > 99: (b4) w2 =3D 0                       ; frame1: R2=3D0
> > 100: (b4) w3 =3D 3                      ; frame1: R3=3D3
> > 101: (85) call bpf_iter_num_new#82234         ; frame1: R0=3Dscalar() f=
p-56=3Diter_num(ref_id=3D2,state=3Dactive,depth=3D0)
> > 102: (18) r9 =3D 0x1ffffffffffffff8     ; frame1: R9=3D0x1fffffffffffff=
f8
> > 104: (bf) r1 =3D r10                    ; frame1: R1=3Dfp0 R10=3Dfp0
> > ;  @ scx_sdt.bpf.c:0
> > 105: (07) r1 +=3D -56                   ; frame1: R1=3Dfp-56
> > ; bpf_for(u, 0, SDT_TASK_LEVELS) { @ scx_sdt.bpf.c:447
> > 106: (85) call bpf_iter_num_next#82235        ; frame1: R0=3D0 fp-56=3D=
iter_num(ref_id=3D2,state=3Ddrained,depth=3D0)
> > 107: (15) if r0 =3D=3D 0x0 goto pc+29     ; frame1: R0=3D0
> > ; if (tmp->nr_free > 0) @ scx_sdt.bpf.c:456
> > 137: (bf) r1 =3D r10                    ; frame1: R1=3Dfp0 R10=3Dfp0
> > ; bpf_for(u, 0, SDT_TASK_LEVELS) { @ scx_sdt.bpf.c:447
> > 138: (07) r1 +=3D -56                   ; frame1: R1=3Dfp-56
> > 139: (85) call bpf_iter_num_destroy#82232     ; frame1:
> > 140: (b7) r9 =3D 0                      ; frame1: R9=3D0
> > ; if (unlikely(desc =3D=3D NULL)) { @ scx_sdt.bpf.c:480
> > 141: (15) if r8 =3D=3D 0x0 goto pc+15     ; frame1: R8=3Dscalar(umin=3D=
1)
> > ; chunk =3D desc->chunk; @ scx_sdt.bpf.c:485
> > 142: (79) r4 =3D *(u64 *)(r8 +72)
> > R8 invalid mem access 'scalar'
> >
> > The reason is these older compilers lacks native support for
> > __BPF_FEATURE_ADDR_SPACE_CAST, __arena macro is defined as empty.
> >
> > Fix it by adding cast_kern when dereferencing variables with __arena ta=
g.
> >
>
> I am not sure if we want to support older Clang versions at this point.
> This issue is fixed for Clang 19, and adding the macros back in makes it
> confusing for those who use the code as a starting point. And while
> it would be nice to support older Clang versions, we already don't
> handle Clang 15/16 that don't have arena support. So it's not
> unreasonable if we say Clang 17/18 are also incompatible with this
> example.

+1
People should upgrade their compilers.
