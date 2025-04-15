Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436ED19E99E
	for <llvm@lists.linux.dev>; Tue, 15 Apr 2025 01:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744681109; cv=none; b=uQoj8hAzQb/ff+1eurHhgCboFxPCZgJ6+9V+6P3281BBpKFTku8ZqP5vUt/vpXg1cU3wr6XtwgkT7VapFXLlzk7gYyFhKrpQRjtH3sb1+9cZlZaSliJEQYiJo5UoDIUO41YhfmgKyVv8eklYgiCrLMTK1Jse8jUPd/GC9TEbgXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744681109; c=relaxed/simple;
	bh=D9/copwN8Vi93hcXVQLwm6TV1oCBKCuDxgsjassI+4c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PRi+IMK8erC2fD5IW/wm7Rq9wDBY9vexJ2xqWzgt5ioyyryRi1owQRFcBJ5HGJtoeh6ilrNBrQj+r369N668pBqaiR5hYDhyBIezVgYx3bvURsBZXxebRSve7u60lgWEyysw4X9WT9/JzgzwDL8zTA368VOi5bXq7RTvjuVt1yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YffoRy5m; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YffoRy5m"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cfb6e9031so46465535e9.0
        for <llvm@lists.linux.dev>; Mon, 14 Apr 2025 18:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744681105; x=1745285905; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hstID7d8ycIqCdy0S2HoM/NmlIdP9WL4OFhfgrftQOQ=;
        b=YffoRy5mdKL/CN2+31hqKsCeL6KY0Fqmz3y8jLwvtAmml6lIw3SUhwBAQzowRTnkAp
         f2UkIU4zpFrFOLWf9tu7mE13lYg/O0kRKt2isE5ies7GGWf07UTzwSwqf0v6ZE3UiqYq
         nTSnjymiXqPAV0kDR8KCFuV6EJcPfH1gLkopbn1ZMUeCsY3PgeWdf01vwqvrYHdc1BK5
         wXvLFJlFWPUJfiFXNLly0ABmAW2EgHPLZ5ioK3IabBhuEAIHIj54Sk8yG0/bEyG2BtE4
         oj6+rhlhKaGCYGJFsEo5UG5627CXKPLokfSrALeIbJC5k9HgSSV79rp6VIYegCJ2QEPE
         JHgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744681105; x=1745285905;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hstID7d8ycIqCdy0S2HoM/NmlIdP9WL4OFhfgrftQOQ=;
        b=NeNIsW3cJiGWfZJyOoVdFc8ld91oEgpmHnL4Mt/WrT///BJVE1CyoRPEkj4jKMOaAV
         V1ODtOShCGvojgLLqW138S9F7U2Kv38zLk0Bspzih04UiS2Ebp7QmMM69mMArhh2uC4C
         X8S9V2kVjAFZ9b4vFp8lxmiCmRtxUZWQ/to5Ux20R5xoeOfIDhzP1JmqtP+BLyxdoFaK
         SQD8X/GCqN1s1YG7OHGJRE4YWMODtBJgUWRRQKAC/0S7OgT4/ZG0SLdjQZPuJU3AlD0T
         gUuHGNwoDOU6hu4loEk89UlPW7CUuHLciyWtcrS3cMtEjNnWlizaBPHBbjMvuz8Mrf6H
         SJmg==
X-Forwarded-Encrypted: i=1; AJvYcCWmZAJ+ZkSYg3l5DyxqahJyGdLJzMgcvhVCMUO1+kaHDACWrOt96gvJtZxymhD57lKqUVTK@lists.linux.dev
X-Gm-Message-State: AOJu0YyP0K5uQbQFG5iTK9DEzRKVvVoH+8M7rxXMWwhzLau3bU9wqaf3
	XjBszs3m6lT0Yiw6Ln6lWAObosudc67P6YUA4HOCbMaDN4+gDVgE4McEj9Uv39ZR7SccVjDTOPg
	gVfukGN0pLKugxEdUcn2Jk3cv49g=
X-Gm-Gg: ASbGncsdzTQYDKuA+722iZPR5PJJEtT8zOG/9D+HHu/9LYAWlXcoKXH7Ru7aszPv4yG
	J8+l0U5Pqr/9EWuh4P6tepe5QXbZXh7etb+LB7q1pkWJCWAmdItLh40R8Tpb2UXCOywpcI/ez7z
	WLPS7K83PuQRId8uK3u62JXMCAq9DVLF3OM/EkeQ==
X-Google-Smtp-Source: AGHT+IE13LNRwKepLhiR5HgiMZISHCOnuS/exoyNGmTnGn08SGCoosF3MkOhQ4I61FeJBNHAP0KCBKG0KSg/y+VQIDA=
X-Received: by 2002:a5d:5c84:0:b0:391:2e7:67ff with SMTP id
 ffacd0b85a97d-39ea51f47e0mr10937877f8f.10.1744681105142; Mon, 14 Apr 2025
 18:38:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250404215527.1563146-1-bboscaccy@linux.microsoft.com>
 <20250404215527.1563146-2-bboscaccy@linux.microsoft.com> <CAADnVQJyNRZVLPj_nzegCyo+BzM1-whbnajotCXu+GW+5-=P6w@mail.gmail.com>
 <87semdjxcp.fsf@microsoft.com> <CAADnVQ+JGfwRgsoe2=EHkXdTyQ8ycn0D9nh1k49am++4oXUPHg@mail.gmail.com>
 <87friajmd5.fsf@microsoft.com>
In-Reply-To: <87friajmd5.fsf@microsoft.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 14 Apr 2025 18:38:13 -0700
X-Gm-Features: ATxdqUHye6neCty12upWdoIVJgMpLkd6THftJdEFKQdyUAliYMBWVcY1MoiFP1Q
Message-ID: <CAADnVQKb3gPBFz+n+GoudxaTrugVegwMb8=kUfxOea5r2NNfUA@mail.gmail.com>
Subject: Re: [PATCH v2 security-next 1/4] security: Hornet LSM
To: Blaise Boscaccy <bboscaccy@linux.microsoft.com>
Cc: Jonathan Corbet <corbet@lwn.net>, David Howells <dhowells@redhat.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Shuah Khan <shuah@kernel.org>, 
	=?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Jan Stancek <jstancek@redhat.com>, Neal Gompa <neal@gompa.dev>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	keyrings@vger.kernel.org, 
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, 
	LSM List <linux-security-module@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, bpf <bpf@vger.kernel.org>, 
	clang-built-linux <llvm@lists.linux.dev>, nkapron@google.com, 
	Matteo Croce <teknoraver@meta.com>, Roberto Sassu <roberto.sassu@huawei.com>, 
	Cong Wang <xiyou.wangcong@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2025 at 5:32=E2=80=AFPM Blaise Boscaccy
<bboscaccy@linux.microsoft.com> wrote:
>
> Alexei Starovoitov <alexei.starovoitov@gmail.com> writes:
>
> > On Sat, Apr 12, 2025 at 6:58=E2=80=AFAM Blaise Boscaccy
> > <bboscaccy@linux.microsoft.com> wrote:
> >>
> >> TAlexei Starovoitov <alexei.starovoitov@gmail.com> writes:
> >>
> >> > On Fri, Apr 4, 2025 at 2:56=E2=80=AFPM Blaise Boscaccy
> >> > <bboscaccy@linux.microsoft.com> wrote:
> >> >> +
> >> >> +static int hornet_find_maps(struct bpf_prog *prog, struct hornet_m=
aps *maps)
> >> >> +{
> >> >> +       struct bpf_insn *insn =3D prog->insnsi;
> >> >> +       int insn_cnt =3D prog->len;
> >> >> +       int i;
> >> >> +       int err;
> >> >> +
> >> >> +       for (i =3D 0; i < insn_cnt; i++, insn++) {
> >> >> +               if (insn[0].code =3D=3D (BPF_LD | BPF_IMM | BPF_DW)=
) {
> >> >> +                       switch (insn[0].src_reg) {
> >> >> +                       case BPF_PSEUDO_MAP_IDX_VALUE:
> >> >> +                       case BPF_PSEUDO_MAP_IDX:
> >> >> +                               err =3D add_used_map(maps, insn[0].=
imm);
> >> >> +                               if (err < 0)
> >> >> +                                       return err;
> >> >> +                               break;
> >> >> +                       default:
> >> >> +                               break;
> >> >> +                       }
> >> >> +               }
> >> >> +       }
> >> >
> >> > ...
> >> >
> >> >> +               if (!map->frozen) {
> >> >> +                       attr.map_fd =3D fd;
> >> >> +                       err =3D kern_sys_bpf(BPF_MAP_FREEZE, &attr,=
 sizeof(attr));
> >> >
> >> > Sorry for the delay. Still swamped after conferences and the merge w=
indow.
> >> >
> >>
> >> No worries.
> >>
> >> > Above are serious layering violations.
> >> > LSMs should not be looking that deep into bpf instructions.
> >>
> >> These aren't BPF internals; this is data passed in from
> >> userspace. Inspecting userspace function inputs is definitely within t=
he
> >> purview of an LSM.
> >>
> >> Lskel signature verification doesn't actually need a full disassembly,
> >> but it does need all the maps used by the lskel. Due to API design
> >> choices, this unfortunately requires disassembling the program to see
> >> which array indexes are being used.
> >>
> >> > Calling into sys_bpf from LSM is plain nack.
> >> >
> >>
> >> kern_sys_bpf is an EXPORT_SYMBOL, which means that it should be callab=
le
> >> from a module.
> >
> > It's a leftover.
> > kern_sys_bpf() is not something that arbitrary kernel
> > modules should call.
> > It was added to work for cases where kernel modules
> > carry their own lskels.
> > That use case is gone, so EXPORT_SYMBOL will be removed.
> >
>
> I'm not following that at all. You recommended using module-based lskels
> to get around code signing requirements at lsfmmbpf and now you want to
> nuke that entire feature? And further, skel_internal will no longer be
> usable from within the kernel and bpf_preload is no longer going to be
> supported?

It was exported to modules to run lskel-s from modules.
It's bpf internal api, but seeing how you want to abuse it
the feature has to go. Sadly.

> >> Lskels without frozen maps are vulnerable to a TOCTOU
> >> attack from a sufficiently privileged user. Lskels currently pass
> >> unfrozen maps into the kernel, and there is nothing stopping someone
> >> from modifying them between BPF_PROG_LOAD and BPF_PROG_RUN.
> >>
> >> > The verification of module signatures is a job of the module loading=
 process.
> >> > The same thing should be done by the bpf system.
> >> > The signature needs to be passed into sys_bpf syscall
> >> > as a part of BPF_PROG_LOAD command.
> >> > It probably should be two new fields in union bpf_attr
> >> > (signature and length),
> >> > and the whole thing should be processed as part of the loading
> >> > with human readable error reported back through the verifier log
> >> > in case of signature mismatch, etc.
> >> >
> >>
> >> I don't necessarily disagree, but my main concern with this is that
> >> previous code signing patchsets seem to get gaslit or have the goalpos=
ts
> >> moved until they die or are abandoned.
> >
> > Previous attempts to add signing failed because
> > 1. It's a difficult problem to solve
> > 2. people only cared about their own narrow use case and not
> > considering the needs of bpf ecosystem as a whole.
> >
> >> Are you saying that at this point, you would be amenable to an in-tree
> >> set of patches that enforce signature verification of lskels during
> >> BPF_PROG_LOAD that live in syscall.c,
> >
> > that's the only way to do it.
> >
>
> So the notion of forcing people into writing bpf-based gatekeeper program=
s
> is being abandoned? e.g.
>
> https://lore.kernel.org/bpf/bqxgv2tqk3hp3q3lcdqsw27btmlwqfkhyg6kohsw7lwdg=
beol7@nkbxnrhpn7qr/#t
> https://lore.kernel.org/bpf/61aae2da8c7b0_68de0208dd@john.notmuch/

Not abandoned.
bpf-based tuning of load conditions is still necessary.
The bpf_prog_load command will check the signature only.
It won't start rejecting progs that don't have a signature.
For that a one liner bpf-lsm or C-based lsm would be needed
to address your dont-trust-root use case.

>
> >> without adding extra non-code
> >> signing requirements like attachment point verification, completely
> >> eBPF-based solutions, or rich eBPF-based program run-time policy
> >> enforcement?
> >
> > Those are secondary considerations that should also be discussed.
> > Not necessarily a blocker.
>
> Again, I'm confused here since you recently stated this whole thing
> was "questionable" without attachment point verification.

Correct.
For fentry prog type the attachment point is checked during the load,
but for tracepoints it's not, and anyone who is claiming that
their system is secure because the tracepoint prog was signed
is simply clueless in how bpf works.
