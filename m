Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296743A4F55
	for <llvm@lists.linux.dev>; Tue, 20 Jan 2026 21:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768943205; cv=pass; b=fk3Tx8tR4uVPKRUZnZy3tZX3Tk7uUEX5pKBY9+U4CuiNtTCowTi6h5NzfxFjF3cfO1gASsfQK62lkKUlN8c+xoR/t0GREJfjg5h5ChtLLk23q9uHsr75WOFanEtbUxnauaNhI/avniu2VZSF8Ggv3XROp/sIirQj5liSh3uKHk0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768943205; c=relaxed/simple;
	bh=uzTkHbmProOBNzb+9GyidfMWEO2EiRqUvgCYmYIuezM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mMVfhFmli5LrCgWz0qu64NEoc+zP7ftwX4NKs+J64YuMZZ03UhXFUL3R084JLSxY6H/SQEhKIDFX1Aj6w+YYA/bMuS3KraJ5NQphphmx4jbIxS47JJqRELDH80vEOZ+xR3pl2EN/gPGaRWSLrsCbZ7kkuTFrpndmYH//qNIewis=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Rm9UP32x; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Rm9UP32x"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b876798b97eso927062766b.1
        for <llvm@lists.linux.dev>; Tue, 20 Jan 2026 13:06:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768943202; cv=none;
        d=google.com; s=arc-20240605;
        b=BX/feZ3A0Rndeij4ZjbEoELHMCrjO0RihdkBtD60fsghwjLVGedivvXj8PWW7DakiI
         J87rPHA0h32ytUaR35H5KtWGPp9Yd67dI7k9nPAbTT5WvGD9hpKl82hLrIzta6nwdGYF
         g0+OYHBAOL1mm0t99Dnr9gvPAzQnDtCLZ4vKglg6JVAPjuj+RuFSoChXlsMzcNTPXQH2
         mLGMQt5zvcwDHx5ohmNhtAe0vyW4+9EXVJT5CUlQi1Yk+SMthndb8wHlIoFmUiyWD8Ta
         lk4yBoacn2c4XNp2F7YYn+Hf4Iv4P8ZgiyFCk4m659SXGy1b/KOd4sba/cBqmecsA12j
         5XIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Qm6uyV8c9i4IGocHzcVQAcu7s/WbazRCpwyhACW9O4Q=;
        fh=Xn+yHQMH5+V+lk14S2wdDwRfL70AeHiYpf05DmjgXPI=;
        b=Abre+zr9GL1RuwHr/NXBaA5kFLdZ4yqt1GVKMR2aRQ6qW/lDaCYGBGqUIBG0pYG/4U
         yPObtWqqkE8S6OicgAbLOgEzAOOvwOxdHqRlZza6CySoGI9BsjHUtsBozBIq07FhXTb1
         VS39KRBJv0T80BOLgIuwc1Kw69tz0UtXONTjBBjBcpHRNLhgGnxzuO2/lvUN8fJUXdZ1
         wGoydCHChPNtAXnFpiejHP6cgSDcvJPxl4zcmncZLhrfCUiPeMstgfEcmVa3qx2RatRz
         6Sgx50Evz9yPPS8W388UwjX0lyRg94VxzWqZCj4ZMa8nCpNjX0b+0DX3ah0jJtF398SC
         rj1A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768943202; x=1769548002; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qm6uyV8c9i4IGocHzcVQAcu7s/WbazRCpwyhACW9O4Q=;
        b=Rm9UP32x28J79UV608oxHY5fsvYKgK0nYrsLd3FGvNi1UyIe2ex2oVSG/U5zZrycZI
         j311IuzjC2VPHeT/poS8iCE8OZHAZBSBgQBT5Da8TkMhMBJyw9Ebna+GqLuq4odOc/Gq
         UH6mRwcs/TQKhAQCkA7hQDPoafwLNHH7wU8H7aGY+5atLIeFne0b+8A096rC3CFGUCgZ
         1dtIqn0EZ76jxgz09/aBH3C272NCIPTRylnD1PHbyBgNFbjtYrLW4UqXEkZ7B1gfbo8/
         JxZZ36IZ2pzBO9oUqrXPXKNqMKAGi+p/fPqYW+Dl9H7liO/7iP4b9xjjYcfM+QwccO6F
         ZRaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768943202; x=1769548002;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qm6uyV8c9i4IGocHzcVQAcu7s/WbazRCpwyhACW9O4Q=;
        b=dqf0pqYzI5TofY0H6tFDmt5n5zjvZuKuAFp/mZSRIoEpG7mnjIkxV4BvC11u27OxDz
         enme+o88+YXUs5uZJglbbk3rTJIekOH+yAp/IXHODhjbmoAwSXUM/4UG9cZsLtrk2HN1
         5I9yaq6lIsIzuKE+5GAuDx8MP8DEB3VWDtTNxukfHcmc8OUFF08uT6D7zzKgNKqDR10U
         lAWd2eRIBXPHN7wCbBlXu66g/ItL9Hip9XEG+enNTh2pa5JLdBGSKKvVCD+HWEW7RhiA
         +sy9FWdisTxmtHm+fDr/cQMeO9IEJP7baRC3cIBcUheJHn2biJH9svLLNEI9kgYVbVat
         OBKg==
X-Forwarded-Encrypted: i=1; AJvYcCW91HUWVSIqDmuv9OvhVjbo8AmSiNqJrbF+/5Mr3EUxRmdL+ggG0q12L/4pE4F6IF2UGFey@lists.linux.dev
X-Gm-Message-State: AOJu0Ywq3D5IlpjTyJPHXqol2HhJ0ImH8Zk4c0aM9yGF6AGalgUwxdaP
	h71k1JCj5ubmZgcsj+YBVXtHMivA2stbBM0y14NHjzYYkWGadZKtyguuneWFs1X1JP127lPByqe
	ZGqmo/Ex9Alpe05vNC+E6vJ/opXOR2mOpVhSn1sE=
X-Gm-Gg: AZuq6aJ6v6Mfqiw+EcrSrTFkrI99ooODXfrz6wsF34zGOaoLdhgZb0Ogo7utnxNJGcV
	20/PP7q+3xee48NygywzRBqllilJj0rsFeu2N8KkKij128NfDSbI6IKsag+Chil4LtNHS+fiJ7x
	7pVSA2GFLWQMCmLaEitO5/2WiwQLURBc5kWmL1dLiGBRwdQdahPw+6NF81f40xT6uMlACdxMxLk
	a1ZojLxSDFvvFCdsKfzqEynT3m+eNucG7fb9UhRaVLzuwtIT2P1EBrPptSKAuKK2HmZfs21IdMF
	zfEQxaSEUdktFOWM1wYT3TM5OKpSmCgPzPbRRx6BhXNpvWf/FbJzY6nNlCTY8BwpX3GXsaG/JsB
	Hpks=
X-Received: by 2002:a17:907:9704:b0:b87:695f:d2a8 with SMTP id
 a640c23a62f3a-b88006deaafmr271902866b.55.1768943202102; Tue, 20 Jan 2026
 13:06:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251121193957.1655580-1-morbo@google.com> <20251121193957.1655580-3-morbo@google.com>
 <202511211525.05CB7E1AEC@keescook> <20251122141614.80f1a845cd694b1b470107ca@linux-foundation.org>
 <20260116084259.GK830755@noisy.programming.kicks-ass.net>
In-Reply-To: <20260116084259.GK830755@noisy.programming.kicks-ass.net>
From: Bill Wendling <morbo@google.com>
Date: Tue, 20 Jan 2026 13:06:25 -0800
X-Gm-Features: AZwV_QjMxUUkSA0RIc2Md-zJtLCHQ4cc9T_bOZrlgL2_PJok5McD0hSVq7Vo6co
Message-ID: <CAGG=3QXU5vvgV70Kb8-KUF7f0sE7XOqnFBijVnazSN9gdgManQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] memblock: annotate struct memblock_type with __counted_by_ptr
To: Peter Zijlstra <peterz@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Kees Cook <kees@kernel.org>, 
	linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Marc Herbert <Marc.Herbert@linux.intel.com>, 
	Uros Bizjak <ubizjak@gmail.com>, Tejun Heo <tj@kernel.org>, Jeff Xu <jeffxu@chromium.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	John Stultz <jstultz@google.com>, Christian Brauner <brauner@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Brian Gerst <brgerst@gmail.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Mike Rapoport <rppt@kernel.org>, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 16, 2026 at 12:43=E2=80=AFAM Peter Zijlstra <peterz@infradead.o=
rg> wrote:
>
> On Sat, Nov 22, 2025 at 02:16:14PM -0800, Andrew Morton wrote:
> > On Fri, 21 Nov 2025 16:30:43 -0800 Kees Cook <kees@kernel.org> wrote:
> >
> > > On Fri, Nov 21, 2025 at 07:39:44PM +0000, Bill Wendling wrote:
> > > > Add the '__counted_by_ptr' attribute to the 'regions' field of 'str=
uct
> > > > memblock_type'. The 'regions' field is an array of 'struct
> > > > memblock_region' and its size is tracked by the 'max' field, which
> > > > represents the total number of allocated regions.
> > >
> > > As part of any counted_by annotation patch, there needs to be discuss=
ion
> > > in the commit log about how it's been shown to be a safe annotation
> > > to make. e.g. in this case, if all allocations of "regions" have a
> > > corresponding "max" assignment, etc. If just "git grep" can't find th=
em
> > > all, using something like Coccinelle or CodeQL to search for struct
> > > memblock_type::regions assignments can work.
> >
> > How is anyone to know these things?  I can't find anything about this
> > in include/ or Documentation/ or in the relevant commits.
> >
> > There should be a comment at the __counted_by() definition site, please=
.
> >
> > And possibly write a Documentation/ file then change checkpatch to
> > direct people to that file if they add a counted_by?
>
> There is:
>
>   https://clang.llvm.org/docs/BoundsSafety.html
>
After feedback and more consideration, I think this patch was
premature. I'm going to shelve it until we can submit an improved
version and the compilers can release the feature. :-)

-bw
