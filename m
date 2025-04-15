Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB279190685
	for <llvm@lists.linux.dev>; Tue, 15 Apr 2025 01:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744681080; cv=none; b=nzAUMDo8miNgNBaDfd5mfc2gMc1R2AaecLGOeL9l0EMjn9JmzKxsiZoF6j/OOMouB+C14f8I9ZbYkPyBzFySgq+fXMjrivRJhj4zoIWL6jdZ2lzm5G1TtXy1RXmWPbO5j4xM5ufWS+n6kEUzqxq5wV14tMHEGl41+41iPMbOXds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744681080; c=relaxed/simple;
	bh=nnSwVQEmzGQiBeSzekmrr/5D5+/Kj5ljs92bYT66phg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lq9fiw9zSOxj9XCjMTJOFkGLvrOVsPFH9LBSge5fnaJ7USOibao8w993oBmPIom9/WF4NPEXYmBrYE+BQansLCl3LmqZROg779QL1yAug4YXm740IZzD65E7E2eHGd9C51ra0aRdXlxSKSSD5H8iuRIMOMgCZ305SN/Z+EPYzYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=FtYOj/mf; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="FtYOj/mf"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6ff4faf858cso36641467b3.2
        for <llvm@lists.linux.dev>; Mon, 14 Apr 2025 18:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1744681077; x=1745285877; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RmvfG1SQQQWNnAFrc4eRr2gOVcRDAxX6JXskDgWSkhk=;
        b=FtYOj/mf4osJ/Wkyc94iyxtbh84EKhf1NVqaDjlzlUJ+ZOLpx/lSqDKrGKhdkHDLXL
         PCuIshAY9Pq60optNwH9RmwBeQ0Wq43xEnoSKPDoac9y29rWdaSP49CxQXzqUDVELrZq
         k91TUgxx7pgco1B4YqlM/Avnf20hEOfHZ/9aXJkq8NVNNFDFdXHRb4NP/AthNk7Y5rhe
         nXp3CLXUrW/RXXYJehfgV9G4SQANvKyHCantuu8eiQ+ylMjnfnqij1LJj7hH+cqwbuYQ
         Z/2fj1TpXTUYHihVG0set95PEHCg9PV6i01LSWalK1a33UvhFB8ccmSF6tO1h/4usb01
         xnDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744681077; x=1745285877;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RmvfG1SQQQWNnAFrc4eRr2gOVcRDAxX6JXskDgWSkhk=;
        b=ah+WzEFsHoKOp0Ksln/OKRwdGHWFytFCZ4R4BbN/WYKWOso7Hnve6WgfwEKHk/+Oc8
         f3Xgjzeq1qk0CtDbKwaMFi2dwoCFmi6AMjZW+E4aB547S3dqPeOScTA3tjDWeR3Dqlon
         dnen8KklRGSyNSvn2x3qofoJQ3cDTumG7LWZTlCFbobslO0aiU8p1xzulZn8C5qfRwjS
         pscycWzUnNKEs3d3Ul5cnfWeGco8KnUOv/7Obxvb6XxUcwh+tLWBfA3SkXn9Oj2Nrq8q
         BPLLZZsfN2F+iL4Sn5kd1jEX0rfa0LMB4Dr6lMVLm1ejI75iZpI6JoDs6qgki+5BRAXL
         S48w==
X-Forwarded-Encrypted: i=1; AJvYcCWXe2BMpOI2JKhiuX23244BbINCzw2MeYwmyOEOEpwe59vZ+m86P1j9krkPKTqwgyYR1lIV@lists.linux.dev
X-Gm-Message-State: AOJu0YwUrUP7Fpa5Y1dRIz7PB/UVgKmns1uVXwlagydak1pkPXu4NrUI
	DDqMGTimbomHLOGCS5FKuPr7/ylXpGE4wJGjCl7s+P+ZY7OxK/dj/0DVJBx7X2V2hxuFEyq48WE
	CYgrcoJxRQU6JBcynMbsyUYP8uSLWgNiSEKpk
X-Gm-Gg: ASbGnct0auxTVEONmh5Eir1mcQFraIArt4p+c+BQsckGXIn8ciihdNu9qRyyRX/oEYT
	5kxnEqixPcruPQ53Wo/WQG4luvT38+8rfrjI29r2h+3vrsb+wKZ7+o+Ulgp3hPJgo2GxZeEpFYe
	C2ON3286Elqqu3LKX0q45orfl8s3QqCcKI
X-Google-Smtp-Source: AGHT+IGVFpWpZi+wTlwkHFutHe8bqQ5rjA+H2o0mhaXEz1HFA8h8I8OEvnDz+zZIg9Hq6o5FyhzxVV34XBFz3VTMiPA=
X-Received: by 2002:a05:6902:d43:b0:e63:ebbf:7ea with SMTP id
 3f1490d57ef6-e704df842b4mr23249055276.39.1744681077563; Mon, 14 Apr 2025
 18:37:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250404215527.1563146-2-bboscaccy@linux.microsoft.com>
 <d3ad9a7bb9eb68a3ae5dd18bf091825d@paul-moore.com> <87ikn6jwt2.fsf@microsoft.com>
In-Reply-To: <87ikn6jwt2.fsf@microsoft.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 14 Apr 2025 21:37:46 -0400
X-Gm-Features: ATxdqUFeWe8YQ9KNwKtLxVB-kJkAnedXLrtL9lJ0sVjc8DBpxOzeoo2ai7wuYBI
Message-ID: <CAHC9VhTugESMrL8=+b45j3rTKykypZN31in0-cq_FcQF+3nYCg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] security: Hornet LSM
To: Blaise Boscaccy <bboscaccy@linux.microsoft.com>
Cc: Jonathan Corbet <corbet@lwn.net>, David Howells <dhowells@redhat.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Shuah Khan <shuah@kernel.org>, 
	=?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Jan Stancek <jstancek@redhat.com>, Neal Gompa <neal@gompa.dev>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, keyrings@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	bpf@vger.kernel.org, llvm@lists.linux.dev, nkapron@google.com, 
	teknoraver@meta.com, roberto.sassu@huawei.com, xiyou.wangcong@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2025 at 4:46=E2=80=AFPM Blaise Boscaccy
<bboscaccy@linux.microsoft.com> wrote:
> Paul Moore <paul@paul-moore.com> writes:
> > On Apr  4, 2025 Blaise Boscaccy <bboscaccy@linux.microsoft.com> wrote:

...

> >> +static int hornet_check_binary(struct bpf_prog *prog, union bpf_attr =
*attr,
> >> +                           struct hornet_maps *maps)
> >> +{
> >> +    struct file *file =3D get_task_exe_file(current);
> >> +    const unsigned long markerlen =3D sizeof(EBPF_SIG_STRING) - 1;
> >> +    void *buf =3D NULL;
> >> +    size_t sz =3D 0, sig_len, prog_len, buf_sz;
> >> +    int err =3D 0;
> >> +    struct module_signature sig;
> >> +>> +        buf_sz =3D kernel_read_file(file, 0, &buf, INT_MAX, &sz, =
READING_EBPF);
> >> +    fput(file);
> >> +    if (!buf_sz)
> >> +            return -1;
> >
> > I'm pretty sure I asked you about this already off-list, but I can't
> > remember the answer so I'm going to bring this up again :)
> >
> > This file read makes me a bit nervous about a mismatch between the
> > program copy operation done in the main BPF code and the copy we do
> > here in kernel_read_file().  Is there not some way to build up the
> > buffer with the BPF program from the attr passed into this function
> > (e.g. attr.insns?)?
> >
>
> There is. That would require modifying the BPF_PROG_LOAD subcommand
> along with modifying the skeletobn generator to use it. I don't know if
> there is enough buy-in from the ebpf developers to do that
> currently. Tacking the signature to the end of of the light-skeleton
> binary allows Hornet to operate without modifying the bpf subsystem and
> is very similar to how module signing currently works. Modules have the
> advantage of having a working in-kernel loader, which makes all of this
> a non-issue with modules.
>
> > If there is some clever reason why all of this isn't an issue, it might
> > be a good idea to put a small comment above the kernel_read_file()
> > explaining why it is both safe and good.
> >
>
> Will do. I don't see this being an issue ...

My mistake, I spaced out a bit when looking at this and for some
reason thought it was reading the BPF program/lskel itself and not the
signature, meaning that the BPF that was being checked by Hornet was
not necessarily the same BPF that was actually loaded.  However,
that's not the case here, as you rightly point out it is just the
signature that is being read by the kernel_read_file() which shouldn't
be an issue.

Thanks for the correction and sorry for the noise :)

--=20
paul-moore.com
