Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2841D88A6
	for <llvm@lists.linux.dev>; Mon, 21 Apr 2025 23:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745279337; cv=none; b=nqafYq48jROOHhUoHx5JcE0mtOzKzmxEmsSNC2oY8GQMBDZ2YnN7/nFV6MHTlq8JwyI20WfIxKvX9XZRYsMhEuQ0pDxcsXDF9qGCTmMuG8HsKZWjFar3UBDkIhmFoEo9jnGMIn4/4iuzZQUfTOjEdUU1AtbIZHhnZNWyfRDowuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745279337; c=relaxed/simple;
	bh=HfVBTitlqw37llnfFhy3ubEbFd6ASiMSxBhfGkJ/7oQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IbYIl4qkdmHwlixZgMf/5b1D+vf0kN4VNp+vxzlN7Qmsay9hSEfhz60ooBYPjtyLTkZM5DjXa90qex58PpL2RfaDDVFcqoa5MANiTqB6t2vuZ9OvQE8oV92J2FiqP2xnUigUA3l1oQCVSAgSipgGNsYqsWt2Lr7A1dq/4LB5KN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cmdKYwSy; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cmdKYwSy"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso38349095e9.2
        for <llvm@lists.linux.dev>; Mon, 21 Apr 2025 16:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745279334; x=1745884134; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HfVBTitlqw37llnfFhy3ubEbFd6ASiMSxBhfGkJ/7oQ=;
        b=cmdKYwSyUO6xUhcIWqvR3LFwajeB9GdGdcIX/orQhb539YkGqX159YXbQsEybQYPl2
         kW5YYtKaK450c1e+ze2qZgDlsszL1UEdFkAyeS6cktb6we5ogcLxdiWYoRHBeTzrdU7Y
         Yba60vHg3t5Djf4/bGbOTQt/SS4PviUWBmtT5hzh2S8GZoC5YZs5AtKKTCfGrq4RCxom
         e0K+g183zPno/62/xIZag+EIk/CVcwB6+IDW3Vp5nQ5+27tirGbK+OUOam+SIiKC8ton
         X71W4wzJoi0YPVhVi1vvB33FCp5QVJh1S38uAIMlwxtbvrwrevsslMMOkIkOkeveIPKb
         uMgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745279334; x=1745884134;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HfVBTitlqw37llnfFhy3ubEbFd6ASiMSxBhfGkJ/7oQ=;
        b=tT+2WvrxNdB93fJpAnGFxXmSlMJtU238u+VkwD+TVUrWGz3T3diqJ1D6fAilkksDpi
         2dzK60WmO/25f+5qxE1aleBvBsPZvBiAIu3QN+y1AFpVRzRRE/mQ903+QbaLKSPH0RJ3
         6Jdd0UPDB6tb/R9JjaFhT2Jbz0bnXvnBgd38/AWHH380K3d9g3t797cppc+P8P5IqHb8
         iB4/B4SSTA/7hL8u6rh2XYaJMNnlz00JRgdJJXut8dTAbM8RwSusSNsbfYMPVf1qIStd
         rHcEVSHh+3zPj2yD+NJaOQlbfmCSavNRwsoTaq0bDD7RAQwiDwg8qdl1BH42nv3C1bsa
         EU8g==
X-Forwarded-Encrypted: i=1; AJvYcCUMidp75iDZCIQqHz9KbkSDyLAVSH/25yb0t7n+dfbfahvwzA+vmwvCvWOq36nM4VlE5SBQ@lists.linux.dev
X-Gm-Message-State: AOJu0Ywl12mAorrkt+fulO2iS3IImHwCFT82wwtcfSufPxkVd5NM0/ex
	5cXb8FsDlZzjQJiJkXHmKcVhlxXVf3YShDlGH1gnKZ1Tix9cgKwVFqHfDW/Xj3HRJaE01cHTGRl
	bXPqHL0/jdKcE0xisF+lYXsHveTE=
X-Gm-Gg: ASbGncvSndPZ8t/5b5qCSixbG3V+Xo7vblpPzfrqtd5opt1wAHD72x7PSrcvnnDf5lQ
	ZkkSR05jVWbreTpE/eBejvkqQRlLq0l2t4PE/kJ8hP3a8n+0RfH/02GZrLQAbv2XPfZiX
X-Google-Smtp-Source: AGHT+IEXBshZFqY/Fm57erlfCKXrxXtVpOr0Raqyk+6rCL7tzyvjIoEz5K9J8PoMsndTW79fhqMVLoXuyIzCeovcuR0=
X-Received: by 2002:a05:6000:4282:b0:39c:1257:feb8 with SMTP id
 ffacd0b85a97d-39efbb0a99emr10401061f8f.56.1745279333918; Mon, 21 Apr 2025
 16:48:53 -0700 (PDT)
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
 <CAHC9VhS0kQf1mdrvdrs4F675ZbGh9Yw8r2noZqDUpOxRYoTL8Q@mail.gmail.com>
In-Reply-To: <CAHC9VhS0kQf1mdrvdrs4F675ZbGh9Yw8r2noZqDUpOxRYoTL8Q@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 21 Apr 2025 16:48:42 -0700
X-Gm-Features: ATxdqUFvJ5JqiHZwXYEgBfCPoKBSXKlaJ9eXRgCVajk_7W-Bdt-DhPnVxLR_eG0
Message-ID: <CAADnVQK7kyBso6bNEtNyC6zTBDuBv-K-c4a9KBVid+B405VX6Q@mail.gmail.com>
Subject: Re: [PATCH v2 security-next 1/4] security: Hornet LSM
To: Paul Moore <paul@paul-moore.com>
Cc: Blaise Boscaccy <bboscaccy@linux.microsoft.com>, Jonathan Corbet <corbet@lwn.net>, 
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

On Mon, Apr 21, 2025 at 3:04=E2=80=AFPM Paul Moore <paul@paul-moore.com> wr=
ote:
>
> On Mon, Apr 21, 2025 at 4:13=E2=80=AFPM Alexei Starovoitov
> <alexei.starovoitov@gmail.com> wrote:
> > On Wed, Apr 16, 2025 at 10:31=E2=80=AFAM Blaise Boscaccy
> > <bboscaccy@linux.microsoft.com> wrote:
> > >
> > > > Hacking into bpf internal objects like maps is not acceptable.
> > >
> > > We've heard your concerns about kern_sys_bpf and we agree that the LS=
M
> > > should not be calling it. The proposal in this email should meet both=
 of
> > > our needs
> > > https://lore.kernel.org/bpf/874iypjl8t.fsf@microsoft.com/
>
> ...
>
> > Calling bpf_map_get() and
> > map->ops->map_lookup_elem() from a module is not ok either.
>
> A quick look uncovers code living under net/ which calls into these APIs.

and your point is ?

Again, Nack to hacking into bpf internals from LSM,
module or kernel subsystem.
