Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FDA257458
	for <llvm@lists.linux.dev>; Tue, 15 Apr 2025 21:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744753719; cv=none; b=DJOL7464u7Kvk4ZkH6OHsIqTN5flmSXlsbrpmBSCck88KzMXbgFmKuO/fAH3CwEJiMl91WGhcGkuKLQnN/bXh2dFuwutXVXRlerG8fyREsuT6+k9cDcYRLSJWdNtrZWO+cCfkBFwJnuNsVeeaamW8NeAWDjgAIq8PdIiyIfVjNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744753719; c=relaxed/simple;
	bh=bDUCnKz7jvBuxw+pBQ6fXlAerwaY3e5AwmiudA8kAZE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QDdShDuRLevS32UltDruJe9DwLffWQFSn5T0Fj1TvRdafXbq3W68x1FSvB3VRYL+iTcgeIRCzftlLq+/CQ6D9sbGtA+Z4tyYEE0KWC6/PFNtHgj9dJa+q8ehdihIFm0AnuiYiN6UCROqBS+PtY6JjCNNJUcovUa0l4fcCKiKN/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gA3rtwv+; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gA3rtwv+"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39c1efc457bso4094540f8f.2
        for <llvm@lists.linux.dev>; Tue, 15 Apr 2025 14:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744753716; x=1745358516; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bDUCnKz7jvBuxw+pBQ6fXlAerwaY3e5AwmiudA8kAZE=;
        b=gA3rtwv+1fXXxmoVAIem3tdK/vy2aKts6uOQ0APELAouVmHzGuWGOzcP44URviZV/g
         MYudN4WwUXpVClApZEWOwq1tkweGqzJ7G+7SHcN4jV1CPuyX4DiNLWRHSk91O6E7YUlv
         9L87NQPj3VxjQLlJSMIx9DuUL83bcWaxL91Frb1tN/qO+AG05vWRlRiq636gosxc+Bfc
         3Xbbgxa5sko10tcxiNayf3yzEryIqJPVe3tUrga1sD5QifSOfpE6lzGM+S+ECCzCUVGw
         Q1ECffhTNFSLSff/oo5O5qRaXfS3bvVHIv1EaEudN8XAbtVemiiGWcMLkzoeVeQ9UAM9
         N60w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744753716; x=1745358516;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bDUCnKz7jvBuxw+pBQ6fXlAerwaY3e5AwmiudA8kAZE=;
        b=eB3hldBL8N2uYmEsNpPpyfubwf7vQ+2EUmAhGYi7KKUKJSpUG7Ej13c7kZ7RuU1Nyq
         tbLrG7+wJ3HyWj90EW4JE4uZj7h8l5S9cTsqm4KxHzzYWsi2ADTSanfSMnmx5IZBbvD3
         ADMXaPt0iPRuZ/u4myM+l0npxPIzr4qzU0bnhd2mq7P9DHSvBDNuCcTZREgjwNKFV2fn
         Q1XCn6+oAE5Ed2yUjtzgfq8xX0HvMKL14RLc6gpSNDJ8k8SMcP4L3XFy9rT+ZaJwJdUA
         tXDquHP/VY+mgc6An+4uOZdKazc2RtUcYDsM6po3YNdl8lhB5oTkIKiCk4O0luX5goyG
         qIjw==
X-Forwarded-Encrypted: i=1; AJvYcCWXZfDM05SEZokQZ3tE/7fgA91ghzUTufh4dIT2szAVErhCg+TrILFOxAVjy2/ZVPUHixPb@lists.linux.dev
X-Gm-Message-State: AOJu0YzsLtEan/HAC73W3zvXIEbWScSwb0KoltPO1DYoOgVYgeDv0UlC
	9ObmP1DVHQLXLUxFixPdRx1uFduXbDNaN8bmQ+k8mmHLAYJibUtqliuY5ZrqGLof92Eki9enuS2
	e0T+3focm4pFzEvSTpu2hLW2aA6w=
X-Gm-Gg: ASbGncu0cMQx2wUYHjBsMoG4Dv8PnbrMeC3VJAj2lXnyS1/J8flGK5fgwTlGKEBnKho
	8ylWwmfbtK0p26L6+rpj+yQVzbYD9m3j5lKcxDQ8rwl2YTDea3pXVVinTXSMxSj9X61fNBguVFn
	MrPUIfdBKjEQyloDO4nzc8NsJuyW+WH+HzGj21AQ==
X-Google-Smtp-Source: AGHT+IGGvZX4RMVGIBW2ATOMhdA1FNXZL7oI8sJ+361tymECy+71f84VHdCSfBxdvsipmbp6Ulc15gt+XS9d+glagyk=
X-Received: by 2002:a5d:64ed:0:b0:39b:ede7:8906 with SMTP id
 ffacd0b85a97d-39ee2737c5amr829452f8f.19.1744753716233; Tue, 15 Apr 2025
 14:48:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250404215527.1563146-1-bboscaccy@linux.microsoft.com>
 <20250404215527.1563146-2-bboscaccy@linux.microsoft.com> <CAADnVQJyNRZVLPj_nzegCyo+BzM1-whbnajotCXu+GW+5-=P6w@mail.gmail.com>
 <87semdjxcp.fsf@microsoft.com> <CAADnVQ+JGfwRgsoe2=EHkXdTyQ8ycn0D9nh1k49am++4oXUPHg@mail.gmail.com>
 <87friajmd5.fsf@microsoft.com> <CAADnVQKb3gPBFz+n+GoudxaTrugVegwMb8=kUfxOea5r2NNfUA@mail.gmail.com>
 <87a58hjune.fsf@microsoft.com>
In-Reply-To: <87a58hjune.fsf@microsoft.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 15 Apr 2025 14:48:25 -0700
X-Gm-Features: ATxdqUErECmwoqEuL6CX7Ju8rfNledrvqrqzcf3Vfcvy2kBD9Sk5E3enWPn-LJw
Message-ID: <CAADnVQ+LMAnyT4yV5iuJ=vswgtUu97cHKnvysipc6o7HZfEbUA@mail.gmail.com>
Subject: Re: [PATCH v2 security-next 1/4] security: Hornet LSM
To: Blaise Boscaccy <bboscaccy@linux.microsoft.com>
Cc: Jonathan Corbet <corbet@lwn.net>, David Howells <dhowells@redhat.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Shuah Khan <shuah@kernel.org>, 
	=?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Jan Stancek <jstancek@redhat.com>, Neal Gompa <neal@gompa.dev>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	keyrings@vger.kernel.org, 
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, 
	LSM List <linux-security-module@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, bpf <bpf@vger.kernel.org>, 
	clang-built-linux <llvm@lists.linux.dev>, nkapron@google.com, 
	Matteo Croce <teknoraver@meta.com>, Roberto Sassu <roberto.sassu@huawei.com>, 
	Cong Wang <xiyou.wangcong@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 8:45=E2=80=AFAM Blaise Boscaccy
<bboscaccy@linux.microsoft.com> wrote:
>
> The eBPF dev community has spent what, 4-5 years on this, with little to
> no progress. I have little faith that this is going to progress on your
> end in a timely manner or at all, and frankly we (and others) needed
> this yesterday.

History repeats itself.
1. the problem is hard.
2. you're only interested in addressing your own use case.
There is no end-to-end design here and no attempt to
think it through how it will work for others.

> Hornet has zero impact on the bpf subsystem, yet you
> seem viscerally opposed to us doing this.

Hacking into bpf internal objects like maps is not acceptable.

> Why are you trying to stop us
> from securing our cloud?

Keep your lsm hack out-of-tree, please.

> Since this will require an LSM no matter what, there is zero reason for
> us not to proceed with Hornet. If or when you actually figure out how to
> sign an lskel and upstream updated LSM hooks, I can always rework Hornet
> to use that instead.

You can do whatever you want out-of-tree including re-exporting kern_sys_bp=
f.

> code signing last week. All we are trying to do is make our cloud
> ever-so-slightly more secure and share the results with the community.

You're pushing for a custom microsoft specific hack while
ignoring community feedback.

> The attack vectors I'm looking at are things like CVE-2021-33200.

4 year old bug ? If your kernels are so old you have lots of
other vulnerabilities.
