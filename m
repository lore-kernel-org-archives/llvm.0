Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42DC1137C3F
	for <llvm@lists.linux.dev>; Mon, 20 May 2024 17:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716225689; cv=none; b=XLY+wU9q1C8hJyIuyiVyYjBhyU7zCPEhUOVZqEaFd8WhKqLD8lke/MErQQCksOrFkkJKT8a0fY/RvCBUoshW/xzSTMZSjZ4M05ga2a2oPLYo5hIvrzMyFwBBU2R3fiR/4VbLfIEf2B9fpUeiwURwe3W6r6XDXjg/YwYPxldrrFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716225689; c=relaxed/simple;
	bh=OZnW9vfi2DUIODfpEj0uies0vDDwpGFzQDtTd1lswyU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sNvWa37x5wrzwTceR03p8vPCYVy5i7uCl+aFTVWbgOX9ROXanoDu6qVCF6hFBt9UCDtjfMQhJu9tvg8zOGSx7JwlWdbjAroHuXiwi6NvwCJr91CoaxXS2TMK90iNYLCaiTZhFKFgyBIQbEA9NG/FkUz5kh1opI2csnqBks1dsQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sc/ZlMNu; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sc/ZlMNu"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-420298ff5b1so31268255e9.1
        for <llvm@lists.linux.dev>; Mon, 20 May 2024 10:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716225685; x=1716830485; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LXeQuSHX1zYWjO9ZnWv7a/qZoDGZHXxLiPtasH0d/Zg=;
        b=Sc/ZlMNufMgj5fKugWvkBqtcK0H/zilXZYCJIqNQgIGamcBkOW0aFGF9VpyAUb87mW
         Mi9zkuOfcmjC3gktvSikt7WVzkYaBvIbDvp83NcWqiM1gzLPI+qGamzd/H8fro6MLupD
         Yw8fcPp+IWFMlg76jN56uECTzIbFKcFh+TmdMPxXd77IkhEA/9VPp5i2W0TooVXkRu8e
         Zc3HCWNpLv08ER35QvMeJnGqxgB39ynAFsEyiLqsskuogIDBMK+/mXoE+ky6ZUwuLvDD
         HQkFt5+7XEDOofap3mJEv71mDEo0uvXmWlJMyPIDa4ajW+aS/yw1R+XtaS0/B2a7TTbA
         2uDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716225685; x=1716830485;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LXeQuSHX1zYWjO9ZnWv7a/qZoDGZHXxLiPtasH0d/Zg=;
        b=ARoe2CrEOeo2qCWY+/gqu5STAaAa/GGX3PaL/QOi+wLCHA8e5zcns6HcC+K/YlRJfO
         uOc2aLxyZylOAI1MNyuNF3y+uTzB099x4PfhC7dt23wpUWV7+RLZIAmkUbZwMHVOeH5q
         gCutqyCtsrXjwQNXGcaUJxI0B/Lypsq5zPD6Wsnss3ER8O/Cy8xWDWMo086ki31Qf7kv
         xTs3490gRZs8XwkwatKuIFN5Klne7JpR00N8ZR4rSzGP1rC96ELrg/YCyHhuPz6JVvl7
         IkFKqE0A+obfg4iVpZ2IGkSnSy0FRP9c2j7Z0wR20+VAQQj/FwM0NGv5yZpOpLY96RoJ
         DOxQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8yypVVZJMQKyT1bIcgXomn96pMY+Y2rvUpYGR1u0d+L992ZrpbmfkcyuHAilM17KLG3apafmENwf/0MSrSBuBpzEhLw==
X-Gm-Message-State: AOJu0Yx23EI97PXoFFxc1UJ1VcLxpv7PLrvMV/TCmXpnriaY/U6juEQI
	fTTHxUAFDgh0aBeTV6ft2Decozlxr4Cn/Zpd/SlCFble6Dy8/1LqctUynlv++y6sndf3mlDBPM4
	E2PyYY5XbrbJ2nLipwU6r8T598TI=
X-Google-Smtp-Source: AGHT+IGaHg1HQE3EBgrLrtWkCMk71vFjHa4um/0oQbUj73t1jTQMqJOw2usnzouGreTZoScfKYxq3IpB6ea+KJQ8bZA=
X-Received: by 2002:a05:600c:354a:b0:420:2cbe:7f16 with SMTP id
 5b1f17b1804b1-4202cbe829dmr110312045e9.34.1716225685314; Mon, 20 May 2024
 10:21:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABWYdi0ymezpYsQsPv7qzpx2fWuTkoD1-wG1eT-9x-TSREFrQg@mail.gmail.com>
 <CAADnVQ+YXf=1iO3C7pBvV1vhfWDyko2pJzKDXv7i6fkzsBM0ig@mail.gmail.com> <5cb46d34-f4a3-49c7-8dd6-df6bc87b4f25@linux.dev>
In-Reply-To: <5cb46d34-f4a3-49c7-8dd6-df6bc87b4f25@linux.dev>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 20 May 2024 10:21:13 -0700
Message-ID: <CAADnVQ+jw2d81J=dJmJ9Y8EReQpOpQ9tvEv6+S4jPASR8Lza5A@mail.gmail.com>
Subject: Re: bpftool does not print full names with LLVM 17 and newer
To: Yonghong Song <yonghong.song@linux.dev>
Cc: Ivan Babrou <ivan@cloudflare.com>, bpf <bpf@vger.kernel.org>, 
	kernel-team <kernel-team@cloudflare.com>, linux-kernel <linux-kernel@vger.kernel.org>, 
	clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 20, 2024 at 10:01=E2=80=AFAM Yonghong Song <yonghong.song@linux=
.dev> wrote:
>
>
> On 5/17/24 5:33 PM, Alexei Starovoitov wrote:
> > On Fri, May 17, 2024 at 2:51=E2=80=AFPM Ivan Babrou <ivan@cloudflare.co=
m> wrote:
> >> Hello,
> >>
> >> We recently bumped LLVM used for bpftool compilation from 15 to 18 and
> >> our alerting system notified us about some unknown bpf programs. It
> >> turns out, the names were truncated to 15 chars, whereas before they
> >> were longer.
> >>
> >> After some investigation, I was able to see that the following code:
> >>
> >>      diff --git a/src/common.c b/src/common.c
> >>      index 958e92a..ac38506 100644
> >>      --- a/src/common.c
> >>      +++ b/src/common.c
> >>      @@ -435,7 +435,9 @@ void get_prog_full_name(const struct
> >> bpf_prog_info *prog_info, int prog_fd,
> >>          if (!prog_btf)
> >>              goto copy_name;
> >>
> >>      +    printf("[0] finfo.type_id =3D %x\n", finfo.type_id);
> >>          func_type =3D btf__type_by_id(prog_btf, finfo.type_id);
> >>      +    printf("[1] finfo.type_id =3D %x\n", finfo.type_id);
> >>          if (!func_type || !btf_is_func(func_type))
> >>              goto copy_name;
> >>
> >> When ran under gdb, shows:
> >>
> >>      (gdb) b common.c:439
> >>      Breakpoint 1 at 0x16859: file common.c, line 439.
> >>
> >>      (gdb) r
> >>      3403: tracing  [0] finfo.type_id =3D 0
> >>
> >>      Breakpoint 1, get_prog_full_name (prog_info=3D0x7fffffffe160,
> >> prog_fd=3D3, name_buff=3D0x7fffffffe030 "", buff_len=3D128) at common.=
c:439
> >>      439        func_type =3D btf__type_by_id(prog_btf, finfo.type_id)=
;
> >>      (gdb) print finfo
> >>      $1 =3D {insn_off =3D 0, type_id =3D 1547}
> >>
> >>
> >> Notice that finfo.type_id is printed as zero, but in gdb it is in fact=
 1547.
> >>
> >> Disassembly difference looks like this:
> >>
> >>      -    8b 75 cc                 mov    -0x34(%rbp),%esi
> >>      -    e8 47 8d 02 00           call   3f5b0 <btf__type_by_id>
> >>      +    31 f6                    xor    %esi,%esi
> >>      +    e8 a9 8c 02 00           call   3f510 <btf__type_by_id>
> >>
> >> This can be avoided if one removes "const" during finfo initialization=
:
> >>
> >>      const struct bpf_func_info finfo =3D {};
> >>
> >> This seems like a pretty annoying miscompilation, and hopefully
> >> there's a way to make clang complain about this loudly, but that's
> >> outside of my expertise. There might be other places like this that we
> >> just haven't noticed yet.
> >>
> >> I can send a patch to fix this particular issue, but I'm hoping for a
> >> more comprehensive approach from people who know better.
> > Wow. Great catch. Please send a patch to fix bpftool and,
>
> Indeed, removing 'const' modifier should allow correct code
> generation.
>
> > I agree, llvm should be warning about such footgun,
> > but the way ptr_to_u64() is written is probably silencing it.
>
> Yes, ptr_to_u64() cast a 'ptr to const value' to a __u64
> which later could be used as 'ptr to value' where the 'value'
> could be changed.
>
> > We probably should drop 'const' from it:
> > static inline __u64 ptr_to_u64(const void *ptr)
> >
> > and maybe add a flavor of ptr_to_u64 with extra check
> > that the arg doesn't have a const modifier.
> > __builtin_types_compatible_p(typeof(ptr), void *)
> > should do the trick.
>
> I guess we could introduce ptr_non_const_to_u64() like
>
> static inline __u64 ptr_non_const_to_u64(void *ptr)
> {
>          static_assert(__builtin_types_compatible_p(typeof(ptr), void *),=
 "expect type void *");
>          return (__u64)(unsigned long)ptr;
> }
>
> and add additional check in ptr_to_u64() like
>
> static inline __u64 ptr_to_u64(const void *ptr)
> {
>         static_assert(__builtin_types_compatible_p(typeof(ptr), const voi=
d *), "expect type const void *");
>         return (__u64)(unsigned long)ptr;
> }
>
> But I am not sure how useful they are. If users declare the variable as '=
const'
> and use ptr_to_u64(), compilation will succeed but the result could be wr=
ong.

I mean to flip the default. Make ptr_to_u64(void *) and
assert when 'const void *' is passed,
and introduce const_ptr_to_u64(const void *)
and use it in a few cases where data is indeed const.

And do the same in libbpf and bpftool.

> Compiler could do the following analysis:
>    (1) ptr_to_u64() argument is a constant and the result is __u64 (let u=
s say u64_val =3D ptr_to_u64(...)).
>    (2) u64_val has address taken and its content may be modified in the c=
urrent function or
>        through the function call. If this is true, compiler might warn. T=
his will require some
>        analysis and the warning may not be always true (esp. it requires =
inter-procedural analysis and
>        in this case, bpf_prog_get_info_by_fd() eventually goes into the l=
ibrary/kernel so compiler has no
>        way to know whether the value could change).
> So I guess it will be very hard for compiler to warn for this particular =
case.

indeed.
