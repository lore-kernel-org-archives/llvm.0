Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.218.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793320095;
	b=VsdzRp4i4iwkCoSBCxZAsohKEIXi9wX3mhm6gdx7Fu55gblxG3TKZHNkIlbvjpNAp/iy
	 F/fnVJ8Qey1TGyGJvpnsjV2/VBiEc0N7R9khf2UBJyaTk/8dMzOZ/jUlaZBZ75XT0rR4Z
	 TKAF4+45FbvmyGMEzfcfhX/W90JeeCdPqD3RJ9UT4HeLighcCeJmlq3hNbMNTvpTSL6Qe
	 wzWMl+NMA9ZKmgwIR21TET6KajhPVjl6vuiEdyXRIYIoyLTvAA2vFFTHUbgxtgE+cPJ+F
	 x0Aodk0Ae7l90QjKKwEADZtYtZyPToqpkxpd36J2uH1CHBYwNG49A57R+gNTk8FGOIA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793320095;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=brgLj6lJ9qrzkbEmy6aUespMxR1HwV6CvzIg1+zIkpE=;
	b=dT610diuvv/Wxw7/DRdMhTq8Hh0j5uaiwXNF98X5N6oMIB/K3cA826oNG6ArC0dHdpMx
	 pJOURFK64WXwyZn2xIEY6jZq0EypbMC9hu4CU4lpqj9h5m6cnLR2/QDNIQ5nsfvYmRW+Y
	 l3wDV0pjhpql5uDiAHnEdML6aK8SKfyB3iN4VbR/R7vdrPIr+9ggTCFOO8jWBYXvmjEpB
	 2rvDlznOACmXWKZtFUoXAGYu38OTPddhy6i6eF8afTNjnD9WkVn+cL5rt6bwT3tGF+sZq
	 7IP8pwMDYT5mqYVYcRkbLgvSwbB2NMvdUF/60ebeXu6ZUecS7LXORcgicj8Ho0c8VbA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AOkp45of;
	arc=fail smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3F0606A320
	for <llvm@lists.linux.dev>; Fri, 30 Oct 2026 00:28:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D3F0606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AOkp45of
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c45551fa84eso15903666b.3
        for <llvm@lists.linux.dev>; Thu, 29 Oct 2026 17:28:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793320094; cv=none;
        d=google.com; s=arc-20260327;
        b=bFcKW7xc0yoDrVSngpyzK/DvDkPOtgI0u/sdGzIHXS5zwQ5wXMSvDJvPQX2Z+4pI6u
         +p/jzez9vc9fb44bbUsFJUB/FSLO/C57pM2krZnJLJkH6cJzGqW9TnmUkCjwhMirL/Qr
         TGyW7NzwPUQ9daewfCKM3/Lvse7LQz1yqQnbd0dYwfFP+fUouixAPL9KyDho7nEO4PCF
         oI89P5uTIFZxYIZGxyXaZDlH6oKm0T49/DD9zDJTYKHFkOAOv/7yCHUdhnNRKquDyVYy
         hCRbUTqLCylqBvwC7DyAv+TW2lao3CfqHo2eVVWL2hI84r9wCswa85eS2k+Qe6hXreL+
         rCHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=brgLj6lJ9qrzkbEmy6aUespMxR1HwV6CvzIg1+zIkpE=;
        fh=OATHl8QIjUIEkfEH9cHckHZVggXR+vusL1mmILkEiLM=;
        b=MLjsMSgtj//Jo4Fot0DwslY1Wdo4GH5LuWo1H06eZWjEe+cofiwT+1VmZzTHPUZLlB
         rWgXfUWxke0Y3VqovtsmRlaCn55IV+J211rpvwjL4mEM/tJZbI2cKr7zUg+KpAYXH4eV
         aruKKHaeiMQae6sho6/OmzInC/gD9m+i8SaQqsxiycSGII8MMeQ5PGJOwbsku+m50gBz
         TfQSkUF6skmOAFvAui76vjlfgSyeRCHpPFKk3L5Hi23e44F1Up+qvfFniJdhgv5Cd9aS
         BAKHGtplk+TLZZ5ufaqDsqeuNSr5D4HTH82rSzhSczvZFsAM+bEYniaW5TO8oW4FCcRc
         FHlg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793320094; x=1793924894; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=brgLj6lJ9qrzkbEmy6aUespMxR1HwV6CvzIg1+zIkpE=;
        b=AOkp45ofhhZJJh/7wMzZQWBMTcN/ZEOyez/Sls1/aKCcWwUiEpmrx41VNavNPXAt6c
         Ec9CSH0rJwwzPeRluJliUVVG3s2Dbcw23JcxY8SX+R/+3DsSOo6yuOUOtJYbwv466sUW
         sDcWO11TKMedkJo/OiPhUUWMEW9rctqBiHJn4bNDKl5bGqvLyWyG/vxVgavrCGPYhkaF
         GMaOPZbFDNbIT4/GkpkGc88HyTGakj/YvZhwe6ea/uPXFxb1uLVF8i+bwrctUoEsqQLP
         O9V3LfOU04B2Bh6JAXG9TW6cG1ij/zwC2OCsnaYtpncHP04xcQM26DiyfPx6egVVRRNC
         KFdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793320094; x=1793924894;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=brgLj6lJ9qrzkbEmy6aUespMxR1HwV6CvzIg1+zIkpE=;
        b=TScm2BOpjLDyPV6DV/YalH/tXWCcdj+lHNhLAa5I7QYTssRYXgw2eldrBcGTwa2xEk
         Q02QyBGM3Qq6icNjoYeYU8KJYLV2qvM87kBOdH76oM4pADQEd17GrlEQ4EUhcaHZA56Y
         bipWUgkAEjWnDcrVJpBb3mFss8c1nOrjkilc6jeKWu9t8WgQYIrATUXBzQ+3DnR+Xnof
         jw6wE4m3K9oFXQx9nFLu1OBZx3yL1pJqy6+ZyzoOqMCxxNTStYCbRRGBJ3y47Xs3elP/
         Eg37eIkOasIdYnSu6m0CxwHaBRmiGKSTgguwEeYRc+hSPpNGD6qJM18R5f5yDD/jTrFk
         t7xQ==
X-Forwarded-Encrypted: i=1; AKwUvBxOVn+8S7w2y6Fp/eLZDyycO59AUBZjerjeAjm8M+fV/LrB++WioDmyFq7wfBucs8TciK/Z@lists.linux.dev
X-Gm-Message-State: AFq9FYJbt6alT3g5YZL5duzt52dYFDITqlJXhFxXkChnKCmFCFIwtylW
	djXyoIJJLYiuMdCO1cNnWr43TW723ea8YBnqEamolAXhgXnfFCN9HvBWC43CV7NmXw7q4rzWroC
	iomNYOPq47HEnbcHukgqmG6g5mRRZnXxhQ5zwlA2K
X-Gm-Gg: AYBFou1OKxqjq6vVg5PyhXakwbEXi0kS9iP0S7JZsnd0tPjCC/S4oGS4K7/RucC74WX
	Hl4i8AkWwMor1lzSDYAcSkDPMIk1XofY5WBsUwy9lPa4TiZiPR8gyi/kB3zk+KB14G4CKtSwwGQ
	NoMYsFSc4s0wgMEoAHxhwqquqcCiaeCWOU8etLiKwM+Q7iDhi+Jw5c33ykShM3xBc9bAfTHjWDB
	gpvq4dXBma3zVy08kgugiPDD3fWN6BWE2V/j7jFsm8CkpQ+vTmFwcbgYFXhNPL3tLowanmw3dlx
	zCKmWHmCmZUSX0IBxUuDWxolhMv2TNb3yd7X2SYy37svhknMcePB3P09TWau/D8q6jzu/kG8PxY
	/TZ2m1TusQGKiElphRKRYuAYX6h8NV/a1rbG4xDnZKIgNT67yVPiC+QEIeMhBtJArS2UaGDo=
X-Received: by 2002:a17:906:730f:b0:c49:a849:cb90 with SMTP id
 a640c23a62f3a-c4ca7a9b33bmr56944566b.39.1793320093443; Thu, 29 Oct 2026
 17:28:13 -0700 (PDT)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261023001603.560210-8-wusamuel@google.com> <20261023001603.560210-9-wusamuel@google.com>
 <20261028134012.01d52e94@pumpkin> <CAG2KctpGPHo-S3AEvBhK5HPUnDHfoJu6Z-r+cS1hQ4Ps=B3DmQ@mail.gmail.com>
 <CAEf4BzYT4rvKwbOJ6UQ3zcp4wdsSBqRsMz-2=U1DA2RyUA3XSg@mail.gmail.com>
In-Reply-To: <CAEf4BzYT4rvKwbOJ6UQ3zcp4wdsSBqRsMz-2=U1DA2RyUA3XSg@mail.gmail.com>
From: Samuel Wu <wusamuel@google.com>
Date: Thu, 29 Oct 2026 17:28:01 -0700
X-Gm-Features: AclHuK9TILtLrldY6faAGXZBT-kc2c2frEEMYWdaANb8mW26TierZlqcroORRGk
Message-ID: <CAG2KctrwzWGFRs6CZcSRaFOWx49WbH9LQVQJunWsPD3MOXn_iw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/6] kallsyms: Add KALLSYMS_QUERY ioctl to /proc/kallsyms
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: David Laight <david.laight.linux@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 3:16=E2=80=AFPM Andrii Nakryiko
<andrii.nakryiko@gmail.com> wrote:
>
> On Thu, Oct 29, 2026 at 3:06=E2=80=AFPM Samuel Wu <wusamuel@google.com> w=
rote:
> >
> > BY_NAME matches names exactly, like kallsyms_lookup_name(), so they
> > would be different symbols at different addresses. Please correct me
> > if I'm missing something here!
> >
>
> foo and foo.constprop0 are different functions with different
> arguments, so I think we should distinguish them. The only special
> case is .llvm.<hash> because that suffix is added by compiler for LTO
> and I don't think the function itself is any different from the
> original

[...]

> I do think it would be good to spend a bit of thought on how to
> support at least one-by-one pagination from the get go. The same
> mechanism can then be used by batch version. I.e., think what can we
> use to provide data back to user which they can use to continue search
> after the symbol we just returned (at least for fixed set of symbols
> in vmlinux and modules; we also have dynamic symbols added for [bpf]
> "module", etc, we should support those as much as possible with the
> least possible deviation, IMO)

Let me sit on this a bit and figure out how to distill all of this
into a clean interface. I'll keep the .llvm.<hash>, pagination, and
batching in mind for the design.

[...]

> user code can be easily written by always setting buffer size, even if
> kallsyms_query is reused. This is the pattern with PROCMAP_QUERY,
> let's keep it consistent.

Ack, will have size in the struct for v3.

> also, returning actual size even if buffer is too short is a good way
> for user space to "probe" and increase buffer if necessary. unless it
> adds tons of complexity, this is a good and flexible UAPI

Ack.
