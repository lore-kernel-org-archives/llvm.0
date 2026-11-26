Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795654409;
	b=X2SJlu+kutNc7knaX2Sg3MpH9J+Fb6uSDbd+xfhCMLqCF1WVQFabeB9BjQvuApJJI3xO
	 rquj5wr1XNpa6zpmLGg0zhOXdb3ibsKv+PU8BI2Apw52DIycJQPY7nGdx33KzlKUgwoqr
	 3ZkUv48YNDw5548ihvYH6MoHIH/jdYZ7oA3Y+GdePZyhtuR8A7xoiN1bK1rMgLDaq3FqX
	 /xQl6WYQFF8uwn9vnn9KDtdULJ077pW+0H6Y5DFfclwqE0Wr+zRbCymKDCV/UewwW6PNL
	 Qu/f+ApFObFYxGs1YMlH9LCn/5i0zryo/al5whtO9d+F8cTUNGrpO9WO5s9dCQ+Y6OQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795654409;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ssrpjNNwMPYh08mQfz/FC+I2tBSrmUfphBtDGQUYlDo=;
	b=iu+y+dJCyriPqhcw8BxeuFIs2xfZuv2iDwAdf9wTZA9vm+LudkZc7BuVZqtpx2pS6XPO
	 Hf3cMveVnhyQsNZONLPmPP05uhbGCa95wAPg+QTiG15evuLQFIgRL35XJFQh00TILium2
	 4y6gLxPxZfGWwf92Rm4k1jjvd7iueYH5vuftAeac4n2Lvd+zGbUsaq5g0ZxZTAJk18yeZ
	 QlyidWdT6HYb+Cgxhn8K+oCnwFg3LsYldZDvOV5mcknvOgl4k0+EFN3l4/NuL6yslru6V
	 4Lf7plpVNd8sIb/HFDfYae718ZPREJdZWYfgzB6i5804/3ycD8nK55/IqpHvladu/Tg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=qI1zvfDM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F914606A336
	for <llvm@lists.linux.dev>; Thu, 26 Nov 2026 00:53:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F914606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=qI1zvfDM
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c50ac25cdd4so830268566b.1
        for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 16:53:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795654408; cv=none;
        d=google.com; s=arc-20260327;
        b=gJsYJRBcdahe/S7DtcxCRV8ryKvvUtDz9DL8sL4/bQErE2NmAV8KsdrTWpL3K0uyOE
         q4S55Ry5o6Q0c+jM0rvhvC1AZ9Ar87+2pAMn1japkFmv2oXYfjuYNtmqMtmBpJC4PZ5g
         kQw7atwVMKGVCha8CGeUL/jgiu/WkcDJhlE8yIh2l22Jbg5plueHsxWwmTnp+lW/CUVd
         e53AQfNEqMv+CKGp/7qvnHpBX6/jgYAALVxTUrMjeG/TCLzHOrHWCWhfihJt6OHQEhY2
         79G/WPDgXIF4VJJZFnnKiWlJRCntCPcU1fLF+o/B2wfNSuK73UFiOqr8innP2xyDEEZB
         nKMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ssrpjNNwMPYh08mQfz/FC+I2tBSrmUfphBtDGQUYlDo=;
        fh=RERF76ePWkmvjRmBH1hiRphAHLBiSfkJHglRB1d52bA=;
        b=i7YgEKZ1nKtdt186t5e/528JHWokNviv5qAZOyoDUH4cBTih3tEFPhfDMgCITb5bL0
         F0OzLqhclcFq75CwYlQzjm1xbG1Wm2vNp+280DfRPKXq0+Cd6qdDR2ADwXRfajr0r6W0
         XdHeDrWmXc+cjUo8+SJ2cHiQh9VYuPeIv3/1i/ioOE+YTmtPX/QQWPSPYvqvoQWClsnu
         8HEXXc1pFUmYtiaBGsBRV+hB+MlhhDkIVlkaz++2haaC4dM2YsMINEILLAIDruTYl4cC
         noh/mi6dpi/DlqBsgU/yQb5Q8YFcS4MvZpYIv4Hc3hSlT/x3x+4qr1iOyFVkKXI9IDQy
         SJYA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795654408; x=1796259208; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ssrpjNNwMPYh08mQfz/FC+I2tBSrmUfphBtDGQUYlDo=;
        b=qI1zvfDMLPLlIIfqM9i0bdgD8zQP1Vxm5Ja3R+0JuakvXJd3E5XugcQ64m6ziFTF1G
         V7thKlD4QGgFcuF0CitCM88DG2MdX6CntCK2jcXxivgTrXiEw0lO1wCPMNam+ELGI9+e
         YNcELjYd2MH+AWi1S1xhQ5maLn71YPRwr//ReXRt/M9LF5s+m1n/bC+Sl0CxGDB+m73U
         eamiukbvW3moyjFf5/GCn48Dybi1PuzBcQoZmTpmX1Rh/LgriD6lGLGxPZ3Az8A40T8f
         BcPfqgt3tfT82l05+6yBWMohGjGkVNnjQSOird4Zb74mxMvAgsm6qywzK+egCZqk3Ni4
         Sqog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795654408; x=1796259208;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ssrpjNNwMPYh08mQfz/FC+I2tBSrmUfphBtDGQUYlDo=;
        b=1RJKd6Vlvw8o2l/3NDuJC/5MnNUoVqb5ohx7dhpObAA2osA529tRVwPvo28qPGwsrJ
         HIeneVfj/c1+Hks9iMe2xuJJnXBSUFkBlLgOBX4tu6LYbTKdywoRFtsfWoTUbWyzi89y
         L0gSY8ITnEmsACdKLlrv9gMYPm3sFSyKkvSFu1KE7LjgruRi1kFU1o5PnsCPSOUfrRyL
         /9PHniIoyOm7weZlDsrC4hn4lH/KwM3U9HRfamSCOx/vF4Sc+GY7sXwXV1c+92xXdKOI
         gIvuCSCXWJo6WouDgsp7G5xKsNzvhdyiPIk4iZWf4Njcp1q5vslM0VfPUordJLBPLi0n
         3PYg==
X-Forwarded-Encrypted: i=1; AL+hErGAgAqIaeCFTn6F6/BW33viPVxTu8DvSLaH+n35qPPY/SWwxoe/VuLQafh7Op+QNAfl507m@lists.linux.dev
X-Gm-Message-State: APuU4Z9FBgMhcwJ6CGsSVUsCz1Gbs+otpbNmXadA3yVHs4RqKWDVDSr9
	3nsMDd3q03rvxYwdnsKaev3feDJK0PiNMy4vK92+gAautploWxensLmVyj+m7rDgjtSvXYFr3CD
	eXTA8yOn2vE6VgZnRaPoUyORB6WL2bbxGHlOH9QpA
X-Gm-Gg: AZFdTZfZzh9IhUnO/JDAW2AMI+swJsVRWxT9H47amJEpminTP1bzIQDhj4CWO0wROdU
	dlvi8GFF8zheyStn/PpCSTQLjn7GkJvWbzvMe93PlldcjTJf5EBlnuvh2IYGWkeo5uCL27VNcnO
	OuYKo1/tWUouTIk/M5KdW2+zcLnf1pz7JihyHU6IiAYKx8AZDukGtR+cn9P1auLnuKq+HzKXUSa
	KBpdYpw+CCmYtroqqlvHwqMfZOGg7y7zchpemRBhOVarumwkFfrJJ8VdOz2bfC1BXCwTghy/I3h
	m7QY30iEp8UDcRoXnhHicst2fVXg2dGccjOcW4TVAQqb44wjA7hgW6iRuhjezIIzTkd9MqlwGnR
	daFWGneSqMCUdELfQUMA40el4D4Lp4SElbskiokn8SofRTziYTISamL50DPPPhuG+KxM=
X-Received: by 2002:a17:907:c643:10b0:c2e:4292:d27e with SMTP id
 a640c23a62f3a-c513a816d3amr1138026566b.22.1795654407168; Wed, 25 Nov 2026
 16:53:27 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261113221248.3535369-11-wusamuel@google.com>
 <20261113221248.3535369-19-wusamuel@google.com> <CAEf4Bza48tGhcUhFRhSSv3qijV0uF8YrAQcLM6Qv9az-8zvK_Q@mail.gmail.com>
In-Reply-To: <CAEf4Bza48tGhcUhFRhSSv3qijV0uF8YrAQcLM6Qv9az-8zvK_Q@mail.gmail.com>
From: Samuel Wu <wusamuel@google.com>
Date: Wed, 25 Nov 2026 16:53:16 -0800
X-Gm-Features: Aa3M54rfuKAHSB0QMI506grzDhwAStyJm9gAvy8QXVpNXfEJd-B8LId_HiOPEPc
Message-ID: <CAG2Kctq98pvyV=jmN0Di+p7m0AWQKg8+QF5YBvdLi79kTJaKoQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 8/9] libbpf: Resolve typeless ksyms via
 KALLSYMS_QUERY_BY_NAME ioctl
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Petr Mladek <pmladek@suse.com>, David Laight <david.laight.linux@gmail.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-modules@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 12:25=E2=80=AFPM Andrii Nakryiko
<andrii.nakryiko@gmail.com> wrote:
>
> On Fri, Nov 13, 2026 at 2:14=E2=80=AFPM Samuel Wu <wusamuel@google.com> w=
rote:
> >
> > libbpf parses all of /proc/kallsyms to resolve typeless ksyms.
> >
> > Use KALLSYMS_QUERY_BY_NAME instead: exact names, plus "<name>.llvm."
> > prefix matches. Ambiguous matches at different addresses fail the load.
> > A missing strong extern still fails and a missing weak extern is 0,
> > without a text scan.
> >
> > On any other error (e.g. -ENOTTY on older kernels, or -EPERM), fall bac=
k
> > to the text parser.
> >
> > Signed-off-by: Samuel Wu <wusamuel@google.com>
> > ---
> >  tools/lib/bpf/libbpf.c | 99 +++++++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 97 insertions(+), 2 deletions(-)
> >
> > diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
> > index 44134421bd7d..f3f3475a64d3 100644
> > --- a/tools/lib/bpf/libbpf.c
> > +++ b/tools/lib/bpf/libbpf.c
> > @@ -59,6 +59,34 @@
> >  #define BPF_FS_MAGIC           0xcafe4a11
> >  #endif
> >
> > +#ifndef KALLSYMS_QUERY_BY_NAME
> > +/* 'f' is PROCFS_IOCTL_MAGIC */
> > +#define KALLSYMS_QUERY_BY_NAME _IOC(_IOC_READ | _IOC_WRITE, 'f', 48, 0=
)
> > +
> > +enum kallsyms_query_flags {
> > +       KALLSYMS_QUERY_NAME_PREFIX =3D 0x01,
> > +};
> > +
> > +struct kallsyms_query_sym {
> > +       __u64 sym_addr;
> > +       __u64 sym_size;
> > +       __u64 sym_name;
> > +       __u64 sym_name_len;
> > +       __u64 sym_module;
> > +       __u64 sym_module_len;
> > +};
> > +
> > +struct kallsyms_query_by_name {
> > +       __u64 size;
> > +       __u64 query_flags;
> > +       __u64 query_name;
> > +       __u64 module_filter;
> > +       __u64 pos;
> > +       __u64 sym;
> > +       __u64 sym_struct_size;
> > +};
> > +#endif
> > +
>
> there is no need for this, libbpf in kernel can use kernels' most up
> to date UAPI headers directly, and on Github we sync necessary UAPI
> headers into include/ directory, so libbpf source code can be built
> with latest definitions of kernel UAPI. So you can drop this part

Ack, will drop entire #ifndef block
[...]

> > +
> > +       while (!ioctl(fd, KALLSYMS_QUERY_BY_NAME, &q)) {
> > +               if (!ext->is_set) {
> > +                       ext->is_set =3D true;
> > +                       ext->ksym.addr =3D sym.sym_addr;
> > +                       pr_debug("extern (ksym) '%s': set to 0x%llx\n",
> > +                                ext->name, ext->ksym.addr);
> > +               } else if (sym.sym_addr !=3D ext->ksym.addr) {
> > +                       pr_warn("extern (ksym) '%s': resolution is ambi=
guous: 0x%llx or 0x%llx\n",
> > +                               ext->name, ext->ksym.addr,
> > +                               (unsigned long long)sym.sym_addr);
> > +                       return -EADDRNOTAVAIL;
>
> I think there is ENOTUNIQ which we can utilize here

Ack
[...]

> > +               /* Check exact name and then LTO .llvm.<hash> prefix */
> > +               err =3D query_ksym_by_name(fd, ext, false);
> > +               if (!err)
> > +                       err =3D query_ksym_by_name(fd, ext, true);
>
> err =3D err ?: query_ksym_by_name(fd, ext, true /* lto_prefix */);

Ack- will update in v4. Thanks for the thoughtful review!
