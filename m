Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.218.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793136817;
	b=kRXa/cVROKjNvjhkc2LBEmql6+6S+XuVZfno++K2wFEX5jY9Icdj5yYsenzaPWYNKe+z
	 V+nIUn1M9MoWYnGpmO6n7FUrSkl8hEDbf693a4k0u4Kf6OUsJ9G3wwVUMQU2VGkMyNPrJ
	 KGpU88ycGPbbwaD+tBzzW7fJG5c4m5QWbkM4tioXOXhRy91p/86IdDo9RiA4a6q+SGHay
	 ezU/9v2s0euHjy3JPWONLDEg9/8dvlPQkYAN6djwB6ugcMTARIu4F6Mz2CUFHbZyr+mgl
	 1aiWaGn/r4JoY3/iwuhmcW8jV1e10zS0mOAYr8caAhsZHPROCmmRj+3oHdgYfp5PVXA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793136817;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=L4jBWIH9k+0zevALV8MhMLgH9N4lxeP/UYSIcVzTvic=;
	b=q+A027g6KYQOuBxlCeND3PqZ5YcOxy1Qi7eUe9S4svzJoBv4C/uIqDXcwvQnolzR0YWl
	 RjAM0mfCuUr5KCgq6E9TMOG3IjIH5eV8F7CkX30HXFMFDaWgT3oqfUib/yTOXObdUBi1g
	 Q+1nHGUUJwt+Ws9B94b/lAg/MyiR/dNPwQmM9VV7zWbYBDycbYkY+kr+WsxOeVfh1BUD9
	 uMqcPINXcMgFILYFBTvZ8xRk/LTZfnlj95hVCrHWJGmq0xs338WER8u/7A0LfJSqRiR8D
	 u62/Ki2buyC7n0qMf/HcoWxSvLappkFi9EfiLGmHS4RNcn9l48wkBaaXMaPbJLQy/eQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=idUjngxC;
	arc=fail smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD4A606A320
	for <llvm@lists.linux.dev>; Tue, 27 Oct 2026 21:33:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AD4A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=idUjngxC
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so41748866b.3
        for <llvm@lists.linux.dev>; Tue, 27 Oct 2026 14:33:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793136815; cv=none;
        d=google.com; s=arc-20260327;
        b=gR4k4Gkjj7d0IjA6ImgnJ/Codg/Dyicvi+a1qpRXGjmYDNJGP/l4xokD2rFPdDJU88
         b/axorsg6RcbbxNfayfn5k53vAFiwoucIEutz77dU5OF2e02QaJQv4RkZsvb3vFQM7WH
         E9e7gsoYLrDhb6Cah8R7YB2tAT2LIa6/OekfyHNdLmUWcMzniEZ9SPD2sEI56k4UXh7P
         EeCsXEAH11opsTgvGeyllHcJ13RkpD8u6Oz2Ikx0YTLjMnq6Kj1SQa2w5axyexArFiZX
         0jQNU9OIptBJcjfmo5JaUuLHodY4Y6tapqpQRWrEFrx5dMOutskulp6Phz633qRosJ6p
         RwxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=L4jBWIH9k+0zevALV8MhMLgH9N4lxeP/UYSIcVzTvic=;
        fh=gOqUjtmaV7jiZV57IRqGSUuYk5fdyPWK6JRVMHDLUZo=;
        b=iwfavFbMyhCq7HwxDeo3hEttjCSrstCDNeJnEnuFKfUAP5uGOVMgD1trJO8kDXCmte
         S1BIO900eOojebrpEcdFQBim+n46hDeq/L5dyArHPogW4zYDTIr//4yb6Btbf0R11yH5
         8orGVexh/aDczcIZi+QV2MYcLTuqbM3wteMflZGsnedZdazViMNWB2iIY1caZpk0sNJz
         rQml5/Rijrf0Q7vRSkh19MlJf1yHc53VFdENhit62ZbUBNa7V718Jzbr66yrPI8SGKiv
         7YHVar9hT6Yq0YodOBQer1DzcMuDQ8UPnGRfD5bFXXfH2AmmxCZWW7pYHeEvUvvvStwz
         vuaw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793136815; x=1793741615; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L4jBWIH9k+0zevALV8MhMLgH9N4lxeP/UYSIcVzTvic=;
        b=idUjngxCNuVqb+kXlrU91yXJ4lpMuYpSdrxsuvpXMxEoiqlRsLQPl1D7C3jTuFC3P3
         O/Kzgo1LcsO/WmCydgzuOHr7eNHlW9whd1Qq1OLZJjO1XPmN4Sv1YhPv3VVlA0IFAytV
         xfplGS6cZMOa1gHBM0rT1157CMIHjyx1ThSFTCF+6sXZqvNKCRvrAnZcHr5E2pTMUWBU
         ZX7jol5bHiEC81ww+/sle7Zcr+yTkmr53r2/4uLNfOSYkOBZ3NZvT2Izho0r6CoQAtyG
         lAGF0d+vGltNMMR3hxtPjfbAWKp1195O3hx2ex1gJR+JYfoslHRVUNwOMI4clTRNlwgO
         4uVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793136815; x=1793741615;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L4jBWIH9k+0zevALV8MhMLgH9N4lxeP/UYSIcVzTvic=;
        b=eskQGFhyACRLXcFL3EkePk7ee/H31SwgUxWw7F2ZHqWMXCMxH+IRXeISozkdlBHQc7
         OEYV/kSFRCb/wi+7T1CWonCQcGiTImFp75oIt74YJZwDzG9wdvBv1CjREVrBPTqr0BpZ
         iJD55VFm3iJFI0seQT7a7u9xKZxqfYaVVHct6m8rWRUlO9EKV43Qz1x9fCJJvG9kVF9b
         iemVrHzjFGCDAuTCZyAxt/gChDwgL7PLfTH3+VoN3I38gkZ5S+HxLq2/NVJ79f/n/4RX
         BnJJwAqRgjkjQEmVBhiS3QVZxhu/UHzklLOiDx2QAXFhn8U6B6egdM86XZD4f423dc4h
         gmsQ==
X-Forwarded-Encrypted: i=1; AKwUvBwLmKZLI54jjiqtlEG0yi0TFxMtT/kjh+FYuNIAVPO8ifvGg0a6lqcwJLLLpzTTsRCqdj3N@lists.linux.dev
X-Gm-Message-State: AFq9FYJI++9nPaIHmb49EfnzR4CnfCilFyFOEX3bZB7ni37S+flF62EW
	b+qsXm6FU3+go4Qwz+UwrrFzD8gEXqF4N4vP0O/rqUbQJdraDIMQNQGv12jMkju7uCtrD+Nn/QO
	r8CSceKV3SeW6VbTFYD+O7ZSQbE+hJSBtlkbdsVRx
X-Gm-Gg: AYBFou3nkoTjaacsSvQuptTT3HKozsfy00sqy9GwfnjEyj32ddMZfaTbM2Euc8/X2p7
	0AwhG1vjq2yRssDMbSpYRqB+tknSidCcWCs5ALFUTu0Awrpg17H6GPgkrGs6duqxzFCqnfaTGgL
	4490gBTBThuOAf8JRN7bE+PylhsI/cEVtGrWwEEZoFloNhcb+9xJ/d1c7cWlJA6Tt2783MtN/R6
	+/e3JI20nfC1aJ+qRuCt9g+dhkp7yNN2b40RawyC0tsrPrsPW+DtNJUhfGnmt8S/uMtoy8UDhf2
	8G/8QsxnfOK2xXqDW4RyA9sDbIgHIYyu6UyepjPpMyUQaWpyWHU+2eN8rttoADnD8vrrQoU5lkK
	wW34g+Dzxaps3zUhAGPg9NVBMWI7tJjAE7RcFSk5QT87Y1v4+b7vXibvyFZu5aNw0ons=
X-Received: by 2002:a17:907:6e8f:b0:c41:4c20:5a80 with SMTP id
 a640c23a62f3a-c49be03be8amr44212466b.44.1793136815046; Tue, 27 Oct 2026
 14:33:35 -0700 (PDT)
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
 <94b36a91-4fe8-480e-a49a-23a81cdcdc60@infradead.org>
In-Reply-To: <94b36a91-4fe8-480e-a49a-23a81cdcdc60@infradead.org>
From: Samuel Wu <wusamuel@google.com>
Date: Tue, 27 Oct 2026 14:33:23 -0700
X-Gm-Features: AclHuK_RVByZe0xeoKYD7y86VR2bYrI5dalonw-UmAvCLqjMUtZYQFJax9TZsKU
Message-ID: <CAG2KctpaX3Hgbnw4iXqrddYPJoqtVBFq2QO7tvEzhHDjgU_KAQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/6] kallsyms: Add KALLSYMS_QUERY ioctl to /proc/kallsyms
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
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

On Sun, Oct 25, 2026 at 4:29=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
>
>
> On 10/22/26 5:16 PM, Samuel Wu wrote:
>
> ...
> > ---
> >  include/uapi/linux/fs.h |  41 +++++++++++++
> >  kernel/kallsyms.c       | 132 ++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 173 insertions(+)
> >
> > diff --git a/include/uapi/linux/fs.h b/include/uapi/linux/fs.h
> > index 34c6f219462a..b43f227dad0e 100644
> > --- a/include/uapi/linux/fs.h
> > +++ b/include/uapi/linux/fs.h
> > @@ -674,6 +674,47 @@ struct procmap_query {
> >       __u64 build_id_addr;            /* in */
> >  };
> >
> > +/* /proc/kallsyms ioctl */
> > +#define KALLSYMS_QUERY       _IOWR(PROCFS_IOCTL_MAGIC, 18, struct kall=
syms_query)
> ...
>
>
> Documentation/userspace/ioctl/ioctl-number.rst doesn't seem to know
> about PROCFS_IOCTL_MAGIC and what range of @nr values that it uses.
>
> Please update it.
>

Thanks for the catch Randy! In v3, I'll add a 'f' 10-12 entry for
PROCFS_IOCTL_MAGIC (PAGEMAP_SCAN, PROCMAP_QUERY, KALSYMS_QUERY) to
Documentation/userspace/ioctl/ioctl-number.rst.
