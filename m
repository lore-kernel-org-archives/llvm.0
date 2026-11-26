Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795690850;
	b=D2IzmkEzj/G1uNBOVDdjpkOmwsw6ZyUUJTPJSh5xpco20o2rV/+tL9+r7qhc+NQFSi7l
	 qgSgAJQfFQTPbdYqe60Z//IUCGfrYJ4c05Aeqpy1f/ZAWMksLkfQNc/QNiZR9RvpzTLx1
	 UnlKEXwRbwlXIV2tr+oHOmPeWN08yO2Sb3LrRiw745C8AWvXyUCvPtwr7SsNwtHxVwOyl
	 Udv4s7VcdOXqklzslOsq3pWsoPBkGB/Uj7AvEHBMnlqiFEBx6fmJdAeZ9lCcJ+pt+rfa4
	 D+IoALeuKQDoOdlFzwOEWVIKjr2GxeiWPFWt/IRnkXsv4YtKTD8WBpHIPVEyfAhZ3Nw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795690850;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YBjrgG7MLY5ulGSrGu9idWUw2qJwnhY95Q5JsiJ363Y=;
	b=nAQFjc4sq/h9UQ6Ajts4ycrxKI/n5LuMRjhwekxn9CNMFSi0epl3evBPqkuW/6kgHqKc
	 09BHJ7qzFxrPxckaPDAtAG2hTFECnRfrgbQoAfuVhneCQq8wlh1GvIj45UPGSn0hZ4BYJ
	 oZcK0X9hgMshbp8L17HawBnru6NKwqsmiaayfpTHIYcgW1kWogRr7UjfbvnVFc6DtcfHR
	 a7TaO32ck8kYTSc4j7/LCZc2SX+7UA/+pqX3azaNGa0Mkp950L1yQxwLvZ1YrybmoPsWj
	 uBOT4moi4oCSCcvxN1YLP9VKO2EE4Qnk8+TawlR8iadZ0bTrj6165GOJZ/vLFWIXE9Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YNhcWKfg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.43
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93571606A321
	for <llvm@lists.linux.dev>; Thu, 26 Nov 2026 11:00:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93571606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YNhcWKfg
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-67583c777abso7174235d50.1
        for <llvm@lists.linux.dev>; Thu, 26 Nov 2026 03:00:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795690850; cv=none;
        d=google.com; s=arc-20260327;
        b=W9Gg8ol/HNRj5/F5twEqFxoG7F91JRpw/P+Qf8PW3kmMMXcN4++qL6CJB88/+0lv6x
         GDB4f347k/Rt2pOC9QOlMmZvwMbswh6zUMlSinoy+lNeqQBDf+81F+88723hOHk5L6jb
         Oi8+sNvHVWRAUTwiCZZtt8+3+0e8FuxsFX/lECxrDJWTnWGB0FIX3RSMPn7Ei5PIYeRs
         vJuGg70EJkiJHETnIzdMC3yC4EN3iOMrbbjT61YXk65llcB/AB18bcJcJAoR+geD0I4k
         QVupFrq20pk5OZ63BVY9W3Pynxn9mfeEt7ig9NouaTgHxiTMw3uQOVb8KkNzH1MFpKkx
         bpfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YBjrgG7MLY5ulGSrGu9idWUw2qJwnhY95Q5JsiJ363Y=;
        fh=xsRoT1ceDTUf2Z6GZnk5++bhxEgv/XIiFBhwCPX9WVw=;
        b=nVlxfs4cESNc361zyf/FrX6XT3NZ/y+OcZ6190fZrWs0ECwGdIgMaPVxtEqb5K8kG0
         DJf2HoaXho9aRgyZoTlqEjJUM+R2H0rYcsjWRYDTmPkwDeAyQRTdG9MA0xHMCIN23TZ4
         EFBr2V+lMng3feYfQL9XEtkBMzJ0xsUUVeYf7zZYwAix9sh5GcFr7R4TcqJBlDLhQy8v
         WVqXxTg9WpmzrQHu2iHykxoMb4cJkm5rF0uRqIKb4Onf+IBQpEMVwKtE7Exxt4R0As9J
         7q0CloHCwDWA42Nw1W5BOPJORsdb7liEnVezhEEABs0aOFvEHYTYRryQmZJinu1k3wNW
         xeBw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795690850; x=1796295650; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YBjrgG7MLY5ulGSrGu9idWUw2qJwnhY95Q5JsiJ363Y=;
        b=YNhcWKfgbU8CRWFrGOOxjcr4/XuXfaKp2nqQ/fTc0tnYi9xXa3ViXwtMRVd3sbWRlV
         TNQoroF4Grl1BVzvtCcsmy8+bELCx/o7HsixdqqUSatv7P/97LhmSyIwdRUtJaQh3hM5
         DmrJHy7eRNuSF1qunAwSqfsNqWd6hjTM57R/60C8HO9uxuzpUmqJVlHh5c51bS3vKUZO
         eciGb9GfZNmRIwaY4XL09F/HTroB6fWB+6sRPEmAlAExJvkWIVUmBPqsnqDusE6NL/Ie
         FSvnWgxpiB7tJoJLHkD6elEZLRh/GgvWqlw3TLC+Z7g0+lNlqfb/jAXSaPvlfTfDa3bZ
         QgoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795690850; x=1796295650;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YBjrgG7MLY5ulGSrGu9idWUw2qJwnhY95Q5JsiJ363Y=;
        b=zh8YUoHQLbG4+8a1StQ7BmNccRdgTDAqub5f4myx22VB5sQ+jjax8/F+A45RHsSkZs
         da22AL/dL/mS5pWfYEDqhwKeX9iML0O5sSJX50Kfv/55e9kPdqp6zg9i7WEkV3uJ/kiV
         jWvjstH/D1peCHiEhl3fVAoLDKzO2XbrbRgrdz0hUwL20xsgZlrY+ifw9pL1ZWQyGZxa
         A+ZtUTg4h2ZdnfZZEiEWUwju7NASWImeZhGIQ4a2FNr38iSrn8pQrUZ+JrpKAIZwEHIc
         YteGJmhon847w+J7x+yP8CVOIQp0ZPRIidVcVij3n8CWFs1E84kQkcNyZnZyqrOfCLuI
         2xtw==
X-Forwarded-Encrypted: i=1; AL+hErGpLlbhs95KTrBPjt1PH+gXwPbmuykatuP0ZLX5H/SeUzdq4RbIeMMhxyHQLo3mIUrAYtGW@lists.linux.dev
X-Gm-Message-State: APuU4Z/Lnn6xDbr6LQfp0+qOdKLmKkxUBMFdGGG4uJBa/ULDIlUEDn1j
	/XLw+C9tzFIh34Qg/6x1j9lE/7KmIM8z15te6AKG4/Gfohh2DuL1aCQABZRSM47RI/9lRFKsbaf
	ag2Ao0nD+L9y6NQt2N6QaC8Qr3MHatJ4=
X-Gm-Gg: AZFdTZe2ptv8uNuk+ndPx/R6gxJGOCpBEsjLPOCmGDQq7VDKEjz00ke06XkpA8DZUw3
	kQ2TOnskYHbXI+ZKx3IU0aOvlRFONdKOiPx3D4gCJthZGIUxxreGCGGqDfyy2ppscD58oYKxWUT
	CxRJn3xUsEM40/ggLxrXACG/rI6wRKJWLKZI7TDurvScf18XxvhxWR+OmM3DR1aWgwexNVi0Q0n
	FPmdkI2J8GUlBG9y7ms+g+IqQe40PGVy/u56hdULzPuW2n8FzD2AM96FvC8Zkl+Tu2KSTCqfoRW
	BdF0u7DoseIdycj8/Vl8DrtB2dYL8tjkABwFQOkmQqKm+Sviyw2crFt3mrPds41rMyh/UOCM2Uv
	PQe7qMC7YWYNJ1N3RrL4a82SG776H+gNV1/kCxw==
X-Received: by 2002:a05:690e:480c:b0:67c:6bcd:b905 with SMTP id
 956f58d0204a3-67df440791dmr4500687d50.10.1795690849512; Thu, 26 Nov 2026
 03:00:49 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261104133158.3187525-1-luolongjuna@gmail.com>
 <20261104133158.3187525-2-luolongjuna@gmail.com> <avZ3jEbnuVu5Qv2G@jpoimboe>
 <CAKL4jwX=ctyjXmm=Oz_+HXe89vOHWHgT_-KGyL47fOBEQTYJiQ@mail.gmail.com> <avdWaZboJeDyyOMs@jpoimboe>
In-Reply-To: <avdWaZboJeDyyOMs@jpoimboe>
From: Longjun Luo <luolongjuna@gmail.com>
Date: Thu, 26 Nov 2026 19:00:37 +0800
X-Gm-Features: Aa3M54rwjsZu7jMc1Fcx0xLlcwpmIPWCqXj01ITTPuucs-yBR6GhxYBGJrQyqJo
Message-ID: <CAKL4jwXZQKf2XrkRmpws3BK6x6iyMD+BRY-NMfqzR1DMmowadg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 01/11] objtool/klp: Fix checksums and copying of
 wide strings
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: peterz@infradead.org, mbenes@suse.cz, pmladek@suse.com, 
	joe.lawrence@redhat.com, song@kernel.org, puranjay@kernel.org, 
	nathan@kernel.org, ndesaulniers@google.com, morbo@google.com, 
	justinstitt@google.com, live-patching@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I sent string-related fixes as a separate series.
https://lore.kernel.org/live-patching/20261126105325.2521938-1-luolongjuna@=
gmail.com/

On Sat, Nov 14, 2026 at 2:27=E2=80=AFAM Josh Poimboeuf <jpoimboe@kernel.org=
> wrote:
>
> On Fri, Nov 13, 2026 at 12:32:20PM +0800, Longjun Luo wrote:
> > Sorry, I left out the debugging context here. Both comments refer to
> > specific kernel build artifacts:
> >
> > On Thu, Nov 12, 2026 at 06:42:36PM -0800, Josh Poimboeuf wrote:
> > > Please give example(s) of such "wide strings" in the changelog.
> > >
> > > > +/* Wide strings, such as the u16 PSR setup table, end at an all-ze=
ro element. */
> > > > +ssize_t elf_string_len(struct section *sec, unsigned long offset)
> > >
> > > What is the "u16 PSR setup table"?
> >
> > PSR stands for Panel Self Refresh.
> >
> > Source    : drivers/gpu/drm/display/drm_dp_helper.c: drm_dp_psr_setup_t=
ime()
> >             /* macros expanded */
> >             static const u16 psr_setup_time_us[] =3D { 330, 275, 220,
> > 165, 110, 55, 0 };
> > Section   : .rodata.str2.2 (SHF_STRINGS, sh_entsize =3D 2, Clang ThinLT=
O)
> > Bytes     : 4a 01 13 01 dc 00 a5 00 6e 00 37 00 00 00
> >                         ^^^^^
> >                         220 (0x00dc) contains a zero byte at offset +5
> >
> > objtool   : strlen() returns 5. The checksum hashes only 5 bytes, and
> >             the copy includes only 6 of the table's 14 bytes.
> >
> > > > + /*
> > > > + * FIXME: GCC's range_string() uses a one-past-end string pointer.
> > > > + * strlen() reads past the section; preserve the string base and a=
ddend.
> > > > + */
> > > > + if (entsize =3D=3D 1)
> > > > + return strlen(sec->data->d_buf + offset);
> > >
> > > I don't understand what this comment means either.  Please make sure =
all
> > > comments and changelogs are written by humans, as LLMs tend to write
> > > nonsensically.
> >
> > Source    : lib/vsprintf.c: range_string()
> >             p =3D string_nocheck(p, pend, "[range ", default_str_spec);
> > Section   : .rodata.range_string.isra.0.str1.1 (8 bytes: "[range \0")
> > Reloc     : range_string.isra.0+0x9a: R_X86_64_32S .LC22+8
> >
> > GCC note  : Uses .LC22+8 (one-past-the-end pointer) as a loop bound wit=
hout
> >             dereferencing it.
> > objtool   : Passes offset =3D 8 to strlen(sec->data->d_buf + 8), readin=
g past
> >             the 8-byte section. Fixing this requires tracking the base
> >             string (.LC22) and the +8 addend separately (left as a FIXM=
E).
> >
> > I came across both while testing on full kernel builds rather than in
> > production livepatching, so I'll leave it to you whether they are worth
> > addressing in practice.
>
> It's probably worth fixing, just the comments and commit log need to be
> clear about what exactly we're fixing.
>
> --
> Josh
