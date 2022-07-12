Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A271854
	for <llvm@lists.linux.dev>; Tue, 12 Jul 2022 00:11:33 +0000 (UTC)
Received: by mail-oo1-f51.google.com with SMTP id i7-20020a4aa6c7000000b004325d18bac9so1245811oom.7
        for <llvm@lists.linux.dev>; Mon, 11 Jul 2022 17:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wX4uw378nHlZZknwBrLqu9hUejNkdIA+CIdUtRzeQzk=;
        b=NymimtnM+Y30KQXD7Cptxk5Z4ryzMYPBT7zbkpkh6jPgLhmRchiDCaO8jl9xkAMUST
         nGHBw9018BZcw8Tz31l+LjHaEfLPg8rGKF314uGxeJlmjJBamvCZmbCneXkVGHtROPyv
         6Ec69hspGGyNPw9H8ELkRPKwANwJ0L+Lknc6RsZbSjOhM5hv/EZocwpQ25HSBFaaBuSC
         73pj98+DVOkgdJZNktgftZ7H1Vsi3jYaMU8mpmZhvfoLWEsD9Gh3V72enJwP8/45ujPj
         pPxeud2eDQb4TVaemhXgK2v9l/E1lBt11VKujjtX375TLdOY4d6vQDmJjd9Jv3UkLzkU
         gG2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wX4uw378nHlZZknwBrLqu9hUejNkdIA+CIdUtRzeQzk=;
        b=V/k1/DhpBlQI9CE10zQNfWQa+HoBXTyyVgNr7ZJZdzV2oVsfYj83OBsVF848wd0BkY
         rez7x6JMlRNJUPvLqk1N664911O0sl0FDxM2SlYxA65U4OxrzrPlnSEsEn3adFlG9dj5
         enYINovSqD2pNMQywODRRjrhA02+QpJF8Swmx5kmKhYsXpdndBVkcjDcshaOa2H2ykQF
         ZEhF86MoShxMDqeZVuryVoSwa3NOjL7AFIQO87aNDaJGZvyAEDfEoPGqpP8tqZkkX9mC
         4aiUaxGxNx1+81YL7Eg+79ckQigWBtlYZvUTPdPlCiCfm4fj+gONaJ/c/5VQtL3j1xWs
         hFRw==
X-Gm-Message-State: AJIora+9Ft2qBo8yc/qL3XEcq+Y5X4CQwqL7/wjEbDLfg5P69c6F4aDs
	W+mvjcvmQQrE3+y6uu6kpN9R2nMbu6KLiSfXt7U=
X-Google-Smtp-Source: AGRyM1vj4LOisBgu89jgkYWeP2kS6EPd2McSLFszQseAIDiNr82gXEopeUU2DNf4jJeHxtDqAtMFWYaryxSEAWCMR4w=
X-Received: by 2002:a4a:5107:0:b0:41b:873e:895f with SMTP id
 s7-20020a4a5107000000b0041b873e895fmr7619919ooa.22.1657584692166; Mon, 11 Jul
 2022 17:11:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220706172814.169274-1-james.hilliard1@gmail.com> <a0bddf0b-e8c4-46ce-b7c6-a22809af1677@fb.com>
In-Reply-To: <a0bddf0b-e8c4-46ce-b7c6-a22809af1677@fb.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 11 Jul 2022 18:11:21 -0600
Message-ID: <CADvTj4ovwExtM-bWUpJELy-OqsT=J9stmqbAXto8ds2n+G8mfw@mail.gmail.com>
Subject: Re: [PATCH v2] bpf/scripts: Generate GCC compatible helpers
To: Yonghong Song <yhs@fb.com>
Cc: bpf <bpf@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, 
	John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Networking <netdev@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 11, 2022 at 5:36 PM Yonghong Song <yhs@fb.com> wrote:
>
>
>
> On 7/6/22 10:28 AM, James Hilliard wrote:
> > The current bpf_helper_defs.h helpers are llvm specific and don't work
> > correctly with gcc.
> >
> > GCC appears to required kernel helper funcs to have the following
> > attribute set: __attribute__((kernel_helper(NUM)))
> >
> > Generate gcc compatible headers based on the format in bpf-helpers.h.
> >
> > This adds conditional blocks for GCC while leaving clang codepaths
> > unchanged, for example:
> >       #if __GNUC__ && !__clang__
> >       void *bpf_map_lookup_elem(void *map, const void *key) __attribute__((kernel_helper(1)));
> >       #else
> >       static void *(*bpf_map_lookup_elem)(void *map, const void *key) = (void *) 1;
> >       #endif
>
> It does look like that gcc kernel_helper attribute is better than
> '(void *) 1' style. The original clang uses '(void *) 1' style is
> just for simplicity.

Isn't the original style going to be needed for backwards compatibility with
older clang versions for a while?

>
> Do you mind to help implement similar attribute in clang so we
> don't need "#if" here?

That's well outside my area of expertise unfortunately.

>
> >
> >       #if __GNUC__ && !__clang__
> >       long bpf_map_update_elem(void *map, const void *key, const void *value, __u64 flags) __attribute__((kernel_helper(2)));
> >       #else
> >       static long (*bpf_map_update_elem)(void *map, const void *key, const void *value, __u64 flags) = (void *) 2;
> >       #endif
> >
> > See:
> > https://github.com/gcc-mirror/gcc/blob/releases/gcc-12.1.0/gcc/config/bpf/bpf-helpers.h#L24-L27
> >
> > This fixes the following build error:
> > error: indirect call in function, which are not supported by eBPF
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> > Changes v1 -> v2:
> >    - more details in commit log
> > ---
> >   scripts/bpf_doc.py | 43 ++++++++++++++++++++++++++-----------------
> >   1 file changed, 26 insertions(+), 17 deletions(-)
> >
> [...]
