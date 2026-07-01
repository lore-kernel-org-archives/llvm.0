Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED648480DD4
	for <llvm@lists.linux.dev>; Wed,  1 Jul 2026 11:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782907070; cv=pass; b=IFN54nv1oIFtvtb3Hp2w0DPjijtnugCTjH6DZxcWoyp4O0gRwV4L4f/90VQSoADrqUaM4Cx7IK3aS36VAc8RjhdWVfcOSfPNm3x2qcPKMoPzU/U134J3QAv3v86swPzNUO+Tb86NsHdLby/MGyW3dBo2dZvzCIXLlkYlaoEZ71M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782907070; c=relaxed/simple;
	bh=k/m7mOwOe2VK+7j1exKhxSnw3ozmGI8iEWqvbTFE6eI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uMJWnxl61Sz+aTo9RBHWNA4cVkTJQNoukhMyQbeSzWnfqAOhPhkIJGqp/Kwe7rrd/Ab3+GahxFzKqQFB/7ENkVPIo8JPdambul0jNvvn/M4DYcpDxd7CPbxAPuAshlv86nHzPIEYOQlqkNifuRCpkQDuIPirFs+nNkp3HoiMGx0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=F0O9jt/O; arc=pass smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="F0O9jt/O"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-44868d6a066so156811fac.3
        for <llvm@lists.linux.dev>; Wed, 01 Jul 2026 04:57:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782907065; cv=none;
        d=google.com; s=arc-20260327;
        b=CoeQBOY7iKAkygWpYDiD7+ahp2vSBWWC7Ae3RT55AccjVZNlO1lj6OiafVqbyEQzVl
         2uFQJG+xtDWH9un56Z40LMZ/SAnk32N0F/T4uxuKNULt+vRJLex8ciDdxbnxZ9j3Ot0m
         tu6czfrJysR1Q7rAivL67T+Y3TitE+5zFZHvLhwV5z1MFRDgKHFOmJB/LUfUIAypKNmo
         PgXYWpvkpOT1WV+dz2lR4OzaBIHA/pgeZ4iHjMMHM+gc1j4r5ag8myxcFCNB4AGM7XYF
         FK3/CFF16DB5fOJLlpeSX3KpH7uOnT8oAcFqC9DcptX8r0QpJYUsxkI02UZtLIbgdwRx
         2dzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lqKxpCifHTwVLxyMY/FMijSWYZ0kJMALXZou2Lu6auM=;
        fh=3iZ6af9FIeyAisnbBRvJkIjsNBh7pCOoDoJtDbYMY4s=;
        b=LLvUL1fpvIzqWbcKvvFgC03ilyzcbtzusX7W1zYtFFE4H3K6C8hiFeIKqPSRQBMW/R
         dL1bS//DjFRlH7W7W36LWoo5PjZvdyxWKXTBUEiTvqtNgtFxj+jqVfzao9zq+shzN6gA
         qbx7xt7SfOsa9nr8mDMOy+ESpzep+w9648ywWhoDaaNliqQNvumXH0JVLkPeGLnqtk8H
         j+Q1r70r+BrXM6Or9TcHAMuNqXYZjQ680NUSJmcKQtui1m2rY+xIjdrZ8R1HKXwjOWvj
         mpg79XEd+cqMqF3gcYwaNIfvUuYpJxAy/U9feGi1ZFUEtkVZkTqoEyd6AUigVoKrWe10
         AFRg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1782907065; x=1783511865; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lqKxpCifHTwVLxyMY/FMijSWYZ0kJMALXZou2Lu6auM=;
        b=F0O9jt/OOGQGljbOaArca3NtQu0+HphvdhqcooZ3wFZ0f9swxMZVeo3uCXzFESw5jR
         KmflLfwqhEmPx5F6jh1yGsdSDiYGsCkFatt6n/Q8lWIW/8G0H4BZ1VJtqu5vi9X4s438
         hzXyiZpK5IxXGx+eqD2xS1f21uz2JLwo49YPuU1Y9KQsNMx9rjjPBVEi3DTmDIC4Y3y5
         BMpPmRoSUHFkIn/vc7lkJcllhKkrO4h9b7Z0qUMYL0H4QZhF7TIYpMCalDJurRlU6nng
         dp1uyoPqB0flybpkbqkyYUCVsMysKX7b59h/PS+hUJBG9BBma3kCqE2SCi/IjAsrO68V
         M0SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782907065; x=1783511865;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lqKxpCifHTwVLxyMY/FMijSWYZ0kJMALXZou2Lu6auM=;
        b=UU/SSbQoW1OfbbKvJgrOny+IDJ2WmJ0NwaHF9D/sKyMiKOmbGvDxU3rDnYYIRtqqhC
         g4z5Bx25/9A80gWa3FeVuoqKD5NumcMaS9kzXFEpLoiabEg444d0qdWlI4tVKc45Zwf9
         EwxtC0+GrZ+QjZcBncwRaQ2rT4/1IR6PGqziufXR8lwBnAo8TPYoBIFvL+AD8f1m9KVh
         c0U69QpbhQwblr+2anv7X80gz6K6htazH7kO1oSMbDaxTZHmmiLtvu/rXXvd39OguKIP
         UY+xmZkXAlALEhmePdfQmf6InzCEEh3Vf0g64+PpGgVaxCqRUaxwsyzdk5wbolswn2W8
         jssg==
X-Forwarded-Encrypted: i=1; AFNElJ88CvCVRwQma+aawh12SJzBqS22zKrbKm99GvZDWnZfp7F3JrVpdfzZWFQjXUeoi9Ewtuwk@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0VYxc8e6iCnW3XT8DkyTFg4nMtrbcg4z8QGFeLKajrsg9CKSV
	WUvoj5EzNyp8Xnc18BUTZdIxkMRIaP1Pr8oFhxucsbDhKFKKBeHlpJk9W5jb8MtMWElENDI6dU2
	l/UZYsBbZ3pMi+mapb/D8Cf01w2TlpjdU04SPn+Qurw==
X-Gm-Gg: AfdE7ckYndckRExMYmvJ0ey4cAGGiYeA2OuUpGJo3gcGyRJz8jfNmsEnV//SWYfqYXO
	xqTgNZS2dadqLZKC7Y2sdwXM9DwiZiKM2HMGzc+X7sqiYMxxnn7J33E7pHq9qPv0aM7wuhZwIGj
	5v1magmnuxkyQkipFAObvKkVaezp7a2s86uvKcAl5i07rRJyaLovgSshU6gQiZNYzh2SmMGKMeB
	0+LK0WwZAJNcDlF3TTkn8M4xo/z+uYZry4raY8Zr09zjNu5J/mGgR+UUEXPjlJiI5wb59p35eU=
X-Received: by 2002:a05:6808:1389:b0:492:5bf0:d29f with SMTP id
 5614622812f47-4960f0d2101mr838181b6e.37.1782907065542; Wed, 01 Jul 2026
 04:57:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1782877663.git.cuiyunhui@bytedance.com> <7988df83f6341ea045ebd7294af2e8907dbd5ee7.1782877663.git.cuiyunhui@bytedance.com>
 <ea525a80-1e6f-4304-a371-3ec17d91ee96@app.fastmail.com>
In-Reply-To: <ea525a80-1e6f-4304-a371-3ec17d91ee96@app.fastmail.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Wed, 1 Jul 2026 19:57:33 +0800
X-Gm-Features: AVVi8Ce8Hvhgv036NZvyTtBZ5NMmFq-2bEMlGWh7WwSjecXpQvRJF8LZ_SFRCM4
Message-ID: <CAEEQ3wnDACZ08kk6ycpgXezgyS5zxi+P_vF_yBScK2sxU+UKaw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v5 1/3] riscv: io: avoid null-pointer
 arithmetic in PIO helpers
To: Arnd Bergmann <arnd@arndb.de>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Dennis Zhou <dennis@kernel.org>, 
	Tejun Heo <tj@kernel.org>, "Christoph Lameter (Ampere)" <cl@gentwo.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, pulehui@huawei.com, 
	puranjay@kernel.org, Thomas Huth <thuth@redhat.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Ben Dooks <ben.dooks@codethink.co.uk>, 
	=?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Zong Li <zong.li@sifive.com>, 
	"Conor.Dooley" <conor.dooley@microchip.com>, Thomas Gleixner <tglx@kernel.org>, 
	Deepak Gupta <debug@rivosinc.com>, seanwascoding@gmail.com, 
	Andy Chiu <andybnac@gmail.com>, menglong8.dong@gmail.com, cyrilbur@tenstorrent.com, 
	Vivian Wang <wangruikang@iscas.ac.cn>, Atish Patra <atishp@rivosinc.com>, 
	Anup Patel <apatel@ventanamicro.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, bpf@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, qingfang.deng@siflower.com.cn, 
	Linux-Arch <linux-arch@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

On Wed, Jul 1, 2026 at 2:25=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Wed, Jul 1, 2026, at 06:20, Yunhui Cui wrote:
> > @@ -56,6 +56,8 @@
> >  #define __io_pbw()   RISCV_FENCE(iow, o)
> >  #define __io_paw()   RISCV_FENCE(o, io)
> >
> > +#define PCI_IO_ADDR(addr)    ((void __iomem *)((unsigned long)PCI_IOBA=
SE
> > + (addr)))
>
> This does not seem to have any purpose, is this just left over
> from the previous version?
>
> >
> > +#ifdef CONFIG_HAS_IOPORT
> >  __io_reads_ins(ins,  u8, b, __io_pbr(), __io_par(addr))
> >  __io_reads_ins(ins, u16, w, __io_pbr(), __io_par(addr))
> >  __io_reads_ins(ins, u32, l, __io_pbr(), __io_par(addr))
> > -#define insb(addr, buffer, count) __insb(PCI_IOBASE + (addr), buffer, =
count)
> > -#define insw(addr, buffer, count) __insw(PCI_IOBASE + (addr), buffer, =
count)
> > -#define insl(addr, buffer, count) __insl(PCI_IOBASE + (addr), buffer, =
count)
> > +#define insb(addr, buffer, count) __insb(PCI_IO_ADDR(addr), buffer, co=
unt)
> > +#define insw(addr, buffer, count) __insw(PCI_IO_ADDR(addr), buffer, co=
unt)
> > +#define insl(addr, buffer, count) __insl(PCI_IO_ADDR(addr), buffer, co=
unt)
> > +#endif
>
> As far as I can tell, just adding the #ifdef here should be sufficient.

Okay.

>
>       Arnd

Thanks,
Yunhui
