Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED38928CF58
	for <llvm@lists.linux.dev>; Wed, 23 Apr 2025 15:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745421044; cv=none; b=NDvIpSkh6zJRa5+5bb8i0jPG8r/OSB3rJqPpW+gd0wiIassENjPjUpk02A7p3VahEUyTesBksOvKlTPtmvNL+KrqKhuNIM8YzTaCsKEaveHp9glNCRjdmt2P46lWhtlZKhikC+kUcS/3udBHkszjDddmICCC6Z1PD81BaiSIiKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745421044; c=relaxed/simple;
	bh=uFV3fDxHeTVor0I1L/M53Jf1QkJJii9mgN/m4+mnqe0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YuA61bkbo3M5IiWQCccVoeHOlLl3OH7pd56Q2+AlYYCp1ug4Bg5qBy7CYySU5hYw5j2lgcEeXwl6oCMdxeouufIGDcOsphBahMhsEQHXEKKiGiAl52MUwcqtKWMKdjauGurFfAHTIlsXLB1JMiCdRA2mXScqotsx8ApvYO60uFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=TnZZKBq+; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="TnZZKBq+"
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e6a8aa771e8so5329330276.3
        for <llvm@lists.linux.dev>; Wed, 23 Apr 2025 08:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1745421041; x=1746025841; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ppDTLRNI5D/DHlJ104+9klrOmugo96Z4EzkqmTSr+tw=;
        b=TnZZKBq+/UkNPWalUkLRI1NEiX13LmPX1GE5mrbETEUAlgh3TI/uyHwB+XAZQPa8+C
         I37+6xf2kaV1cMgOp/bvGhDLvF9v0iOZ3+cUV+tnSt3fxgPVAf6EcwGfyPLchHnpbXCQ
         MtRIBF6LkqeGyV0IewCVWq6AI8sp1Wdc+yWI2XZvCGA/EIMqpizX8Pe8HLP+kUmeUcFE
         4kM0wdArRYEAHtcouhaYUNzNE6+9aUR+fyAMGol/QTogpKdHVROAzeytlGAGsNX559b4
         7BTy03ywXS8dLDJHrONSwhJanFJpdhCR2sv2LXO+AEUuioFxoA0Blst60f3gFIBBKtaK
         F1AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745421041; x=1746025841;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ppDTLRNI5D/DHlJ104+9klrOmugo96Z4EzkqmTSr+tw=;
        b=r1uxEOQa6LujrQa+pOdlGdAX5m0QAgUF/P4+u5Uwq3vFANgZ7hYc2OtLSppc5BkkEa
         giaSXNCByi8JUFXIHdYu0s3zj8vQPHMB3OJbAbjJ39YyGzvPMf4CT23yBrJfogV4hmwi
         i5aIT53ea9eqifyOO6mDTutZ3iOhlu64Tau2sR3GPqPQgHdszwtUccr0JJc5rOEU2JEJ
         Ya6haI84/zTjMWIao/qjZJpaa6KsfM/AzKFj10WTp2YUbbMTYFJCwe5E58LqHAic1DWu
         VKZkh3FNt8IH5lxlXmbgmb4ZxcUzYCAkT7BkHAFGZ8ZQbcpZtGhMtf25YtdOfG2v6/UQ
         a9PQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJYlBzGe6g5q0tS/fOF+pYu6vQKV6KkH4p/Yrs7/1wxefWnXnLKuMeml0KXO/Yw0RwUak9@lists.linux.dev
X-Gm-Message-State: AOJu0YxP46TPf5e2XZj2tb1T4D4buDIaGA8he9PRpgYxOz9xWMBqmZjW
	HcrZB5O58DXmgx6e/aFLfVLZfoIdo7rUOCFpWx75qO1g95ttfTHndbLkgjQrOx7hfwNzz3d3baf
	e0LfZ7Y1NQa8b8/WVzk7tirhBfutnjC89Yzf+
X-Gm-Gg: ASbGncvWH+N2B6ESUTgRwJWQKCXACycihRFwYaJveT6zM3M7UC5MdicfbAE2gCQyUBa
	BsP0uKBPcFu5eZ1wpU+4j/h14vk/efPHLeycUNYm0U+IKj1DXgUTu9akdlGK+0iAWgDkfX/X6cw
	oe9TsvuW45m4LNkRwcQ9EY6jBnNQIJM2D0
X-Google-Smtp-Source: AGHT+IHNlf00p8r3DHcmCpgY+IFBhYtAhRgyVsFb6FFk96MPIernB0HKWY5qgWQbLL58D4kTom9itSs/0uIOQcHE5fg=
X-Received: by 2002:a05:690c:6801:b0:6fd:33a5:59a with SMTP id
 00721157ae682-706ccd1a5ccmr309843197b3.18.1745421040868; Wed, 23 Apr 2025
 08:10:40 -0700 (PDT)
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
 <87a58hjune.fsf@microsoft.com> <CAADnVQ+LMAnyT4yV5iuJ=vswgtUu97cHKnvysipc6o7HZfEbUA@mail.gmail.com>
 <87y0w0hv2x.fsf@microsoft.com> <CAADnVQKF+B_YYwOCFsPBbrTBGKe4b22WVJFb8C0PHGmRAjbusQ@mail.gmail.com>
 <2bd95ca78e836db0775da8237792e8448b8eec62.camel@HansenPartnership.com>
In-Reply-To: <2bd95ca78e836db0775da8237792e8448b8eec62.camel@HansenPartnership.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 23 Apr 2025 11:10:29 -0400
X-Gm-Features: ATxdqUEil0O912atUTQeKlUUv4Sfsc4c76L7yegeINodkXYOkWCpNQ86Ynaeoaw
Message-ID: <CAHC9VhTi6+CHD9OtWj5=pPDrtwF+S9yfBOKqghe=9wXmd7jrxA@mail.gmail.com>
Subject: Re: [PATCH v2 security-next 1/4] security: Hornet LSM
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>, 
	Blaise Boscaccy <bboscaccy@linux.microsoft.com>, Jonathan Corbet <corbet@lwn.net>, 
	David Howells <dhowells@redhat.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, James Morris <jmorris@namei.org>, 
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

On Wed, Apr 23, 2025 at 10:12=E2=80=AFAM James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
> On Mon, 2025-04-21 at 13:12 -0700, Alexei Starovoitov wrote:
> [...]
> > Calling bpf_map_get() and
> > map->ops->map_lookup_elem() from a module is not ok either.
>
> I don't understand this objection.  The program just got passed in to
> bpf_prog_load() as a set of attributes which, for a light skeleton,
> directly contain the code as a blob and have the various BTF
> relocations as a blob in a single element array map.  I think everyone
> agrees that the integrity of the program would be compromised by
> modifications to the relocations, so the security_bpf_prog_load() hook
> can't make an integrity determination without examining both.  If the
> hook can't use the bpf_maps.. APIs directly is there some other API it
> should be using to get the relocations, or are you saying that the
> security_bpf_prog_load() hook isn't fit for purpose and it should be
> called after the bpf core has loaded the relocations so they can be
> provided to the hook as an argument?
>
> The above, by the way, is independent of signing, because it applies to
> any determination that might be made in the security_bpf_prog_load()
> hook regardless of purpose.

I've also been worrying that some of the unspoken motivation behind
the objection is simply that Hornet is not BPF.  If/when we get to a
point where Hornet is sent up to Linus and Alexei's objection to the
Hornet LSM inspecting BPF maps stands, it seems as though *any* LSM,
including BPF LSMs, would need to be prevented from accessing BPF
maps.  I'm fairly certain no one wants to see it come to that.

--=20
paul-moore.com
