Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71D51FB4
	for <llvm@lists.linux.dev>; Mon, 16 Jan 2023 12:59:59 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id v6so24897839ejg.6
        for <llvm@lists.linux.dev>; Mon, 16 Jan 2023 04:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IAZguNTJVi/a6qoNeng/AApLOsYaM+FNkT6jN5FeRBo=;
        b=fcpft07FKnXkA5Fdv/XkfosHhmd2dr3mQUQXXiiyNlTXFZa6ui4wATziWFKR5vfMUw
         z/yU7/3iI6h3icE9LDf3LFg/j3RA3qWjF8HkLmjvyATJQvDl+tRBzbX5W+WaHRHVsuuN
         YFPLiXzPJy8RcIS9gwAO3g3xE3m9HMZP/XY7s4krb9ylVkCed/cQlCVShPABSUvUMoX0
         ZLyfehF3K1+0JxvaAflqmqqc7NPE2rvkCnu8phW74qL0JiX2NQQA3AmcXSfawCRAmhHE
         hvVVX1nRtZKy/HT/UsCW4AbBpxSkwww35EgYq5HodIohOP2fdJoUp+mgkBT7zp0qY52P
         yuHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IAZguNTJVi/a6qoNeng/AApLOsYaM+FNkT6jN5FeRBo=;
        b=Ir/gDjwLE1kmNdH8KYCPvFw8DyuWOGGvKL+h4ObHeC5qtfvszkblQ6ENr7DFfnpE3k
         aux+WSESDGYlDrRBQ0hMsm0qujwpv66jq4fSdUpfqPppes7E27oacgf9uuuMshKi1++u
         vC1x/b/6FnQXkiLDmpttG2bG7DezvyZj7K2MPZ3VMTlA/EpjS/g3USWaXuy2WZBQdC7c
         AYqaJwi9rNDTokPyBBeQ1Jos3id5+zsuxUuJDBQLRn4jJxiwQJ3/GVI1KGS6LhJG4v3u
         u6XZ2/2R9cSP0rYgbRHVlBsRz5R+p63RP4/NFHJkPOdsmydzBfe1M2VpNja+TFsUpEv8
         iuug==
X-Gm-Message-State: AFqh2kr5iH5iMBLwvReqWt55JG5izU4/LEMdjqo3aZgO/dNsvqKpflrL
	2/iqCU9qywfx2VREtQImCLo=
X-Google-Smtp-Source: AMrXdXt+KIsbGtUUAJ5IN1palYinCuWmotGeAPr4XqskjrlDpAxK8fm5qeFPnzEf8newqhjWwz99zg==
X-Received: by 2002:a17:907:b68c:b0:870:4986:2ce with SMTP id vm12-20020a170907b68c00b00870498602cemr4795680ejc.58.1673873998114;
        Mon, 16 Jan 2023 04:59:58 -0800 (PST)
Received: from [192.168.1.113] (host-176-36-0-241.b024.la.net.ua. [176.36.0.241])
        by smtp.gmail.com with ESMTPSA id lj1-20020a170906f9c100b0078d22b0bcf2sm11734515ejb.168.2023.01.16.04.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 04:59:57 -0800 (PST)
Message-ID: <194f38f2dc7d521375e5a660baaf1be31536be9a.camel@gmail.com>
Subject: Re: [PATCH] tools: bpf: Disable stack protector
From: Eduard Zingerman <eddyz87@gmail.com>
To: Quentin Monnet <quentin@isovalent.com>, Peter Foley
 <pefoley2@pefoley.com>,  Alexei Starovoitov <ast@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP
 Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,  Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix
 <trix@redhat.com>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Date: Mon, 16 Jan 2023 14:59:56 +0200
In-Reply-To: <cb03b745-26b8-706c-de40-80ae991e29fd@isovalent.com>
References: <20230114-bpf-v1-1-f836695a8b62@pefoley.com>
	 <cb03b745-26b8-706c-de40-80ae991e29fd@isovalent.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Mon, 2023-01-16 at 10:30 +0000, Quentin Monnet wrote:
> 2023-01-14 18:00 UTC-0500 ~ Peter Foley <pefoley2@pefoley.com>
> > Avoid build errors on distros that force the stack protector on by
> > default.
> > e.g.
> >   CLANG   /home/peter/linux/work/tools/bpf/bpftool/pid_iter.bpf.o
> > skeleton/pid_iter.bpf.c:53:5: error: A call to built-in function '__sta=
ck_chk_fail' is not supported.
> > int iter(struct bpf_iter__task_file *ctx)
> >     ^
> > 1 error generated.
> >=20
> > Signed-off-by: Peter Foley <pefoley2@pefoley.com>
> > ---
> >  tools/bpf/bpftool/Makefile    | 1 +
> >  tools/bpf/runqslower/Makefile | 5 +++--
> >  2 files changed, 4 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/tools/bpf/bpftool/Makefile b/tools/bpf/bpftool/Makefile
> > index f610e184ce02a..36ac0002e386f 100644
> > --- a/tools/bpf/bpftool/Makefile
> > +++ b/tools/bpf/bpftool/Makefile
> > @@ -215,6 +215,7 @@ $(OUTPUT)%.bpf.o: skeleton/%.bpf.c $(OUTPUT)vmlinux=
.h $(LIBBPF_BOOTSTRAP)
> >  		-I$(or $(OUTPUT),.) \
> >  		-I$(srctree)/tools/include/uapi/ \
> >  		-I$(LIBBPF_BOOTSTRAP_INCLUDE) \
> > +		-fno-stack-protector \
> >  		-g -O2 -Wall -target bpf -c $< -o $@
> >  	$(Q)$(LLVM_STRIP) -g $@
> > =20
>=20
> For bpftool, a similar patch was already submitted and merged to the
> bpf-next tree last Friday: 878625e1c7a1 ("bpftool: Always disable stack
> protection for BPF objects").
>=20
> > diff --git a/tools/bpf/runqslower/Makefile b/tools/bpf/runqslower/Makef=
ile
> > index 8b3d87b82b7a2..f7313cc966a04 100644
> > --- a/tools/bpf/runqslower/Makefile
> > +++ b/tools/bpf/runqslower/Makefile
> > @@ -60,8 +60,9 @@ $(OUTPUT)/%.skel.h: $(OUTPUT)/%.bpf.o | $(BPFTOOL)
> >  	$(QUIET_GEN)$(BPFTOOL) gen skeleton $< > $@
> > =20
> >  $(OUTPUT)/%.bpf.o: %.bpf.c $(BPFOBJ) | $(OUTPUT)
> > -	$(QUIET_GEN)$(CLANG) -g -O2 -target bpf $(INCLUDES)		      \
> > -		 -c $(filter %.c,$^) -o $@ &&				      \
> > +	$(QUIET_GEN)$(CLANG) -g -O2 -target bpf $(INCLUDES)		\
> > +		 -fno-stack-protector 					\
> > +		 -c $(filter %.c,$^) -o $@ &&				\
> >  	$(LLVM_STRIP) -g $@
> > =20
> >  $(OUTPUT)/%.o: %.c | $(OUTPUT)
>=20
> This one looks good, thanks!
>=20
> I note a few more places in the repository where we compile to BPF using
> clang. Given that there have been patches to add -fno-stack-protector at
> several locations already, have you checked if any of these also need
> the flag, by any chance, so we could fix this once and for all?
>=20
> $ git grep -l 'target bpf ' | egrep -v '(Documentation|bpftool)'
> kernel/bpf/preload/iterators/Makefile
> samples/bpf/Makefile
> samples/bpf/test_lwt_bpf.sh
> tools/bpf/runqslower/Makefile
> tools/build/feature/Makefile
> tools/perf/Makefile.perf
> tools/perf/util/llvm-utils.c
> tools/testing/selftests/bpf/Makefile
> tools/testing/selftests/net/bpf/Makefile
> tools/testing/selftests/tc-testing/Makefile

A bit tangential, but since BPF LLVM backend does not support the
stack protector (should it?) there is also an option to adjust LLVM
to avoid this instrumentation, WDYT?

