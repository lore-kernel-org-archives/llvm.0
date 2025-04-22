Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756C11A2C06
	for <llvm@lists.linux.dev>; Tue, 22 Apr 2025 02:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745289503; cv=none; b=AGRziPyVy1HhTprVs1PTfFvGQuGAAAPBAMMmLEM6BfJijDrvdxah7WG6VjYrjIZiRRCtt80F29iHfMj9OMLO1isq6gOy5lhOhDbnpANjdQbYW+iJCyNiAX+KJEuoD3V3vBnDyO+owvMdv+4/m3+JiOTDIFc97UcA78aklJgU5l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745289503; c=relaxed/simple;
	bh=m1yMCm5BRURQkTkthO160wuOl1r+JBDJ8JKG9mL70Ps=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jDg/fRWnKLJtzIjgGLMxSWUfCwpRyy2FD4bhETCqDw7R3tKign6JqPn8v9Tjw0Wf66W/NevAhcm5scPpWeTxIDfP4EGIa1zGlwf7/DQ35380UzcpDQCWTfbre1DfbKW09gySAAd8wOBxOVGtCZf1fZgLu8I7JpO9Pexn8S1Qc/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=gIbBEBCl; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="gIbBEBCl"
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e573136107bso3698032276.3
        for <llvm@lists.linux.dev>; Mon, 21 Apr 2025 19:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1745289500; x=1745894300; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m7eAi0OH7b5xLzSVXwOwnWLVsbzyannU+ufJsFO8uuE=;
        b=gIbBEBClEgtA1EbgQ2opW0i8gnn51euTVYHFkQpRzhn5c4H26HZgJt7NVrd4Gp92Mb
         QbsI3FSsXiGvjaScA0qhIoLXC6YBbPC4qjwRO7W5ObA20kjEv9hrwXTmDzZWdEOKdwp/
         kEz8opAtH8NXXyrdFNojMWPJ90CsnO0KJlgxJUrI5U8V+cMD+D1HeCZMXJFf8yrYPJoD
         KPIETOn5sYAtjzp2kIvVPsWK0UuAHL8WBIKgNCgfbHJneDBKvvqBhrkM1f2cx2iEKye4
         O1qc1cGXcQ+XUxdkkdbmlJA+Hs4QbyeMNORucyncf5xukSRaIAEDHVHfBpxhxsIdSQ3T
         lWNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745289500; x=1745894300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m7eAi0OH7b5xLzSVXwOwnWLVsbzyannU+ufJsFO8uuE=;
        b=YzE3KsHZTzYszJGQrh3CXEbLCbXFX/q+OufKGNBeukIfKNC+o8Vav+OPrNVg94zilR
         N0g1a+odMMaF5MLKPH33PXIwcw8trt/KzGVDS2+t4a9qQ650LkSdMVAFB1zrNIJGGHy8
         +XT/RkEXnqsXbTmeCYsYbzGNoH+QjKQaKh20ZgdjF0ufS8sA0725yeC/i13kuFC8hEyw
         CiBZkm0T4b3+sF20BZjde47fDRMIuVKY7bb/Hm70cJ5FGjblrs7tL2gdqQsnXmEw65pu
         ap97cUKSuTntkYAQuikxRbAIxwl7MzwSYMDCm2ibeyIfOIT27pC/iFE1rA4qd1pkA6j/
         pTnw==
X-Forwarded-Encrypted: i=1; AJvYcCXKKqMLpDCctKumfizDCvTvo18AKrrIB+BENAeWiDn64hS3utVyyt/TSLNX7saYFiCj9QvF@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+0iQQjPJvolyu2c3DavXSFH5qKAcYS0gNqVaU+8NrGv5CMzhM
	VAeAVC4nNJ4rMekLy6GJ3yoIuezYkpiNyP3UFCkqaZDFd2g3djQ9tvzoGpAESQhQHKboxOVEnMk
	4AWQyKFS8K3Fq9lhtj58doGO8jiBI7l+hRi6X
X-Gm-Gg: ASbGncsmdiU9uaJyzYqLtCQdbOD1i/jxWZ5ku9zFuIH+a6TRBSt94wVGa84jkdnya0v
	NqHMA92Nxp7y9kVIJiGbhZaZLWLi3MyEl2Eo2JicK51S9llzkUdD1XauFDv925nNrSiqKf6AhdY
	RvMxEomCsQMCi5f2CbUeAJGTaEuv2ndcWO
X-Google-Smtp-Source: AGHT+IEBsF+GdUC/ycqCwWJCqQEPIgxnxovCs8VulAPF24hG16HtUyXji535ndx9u4H0Zeebq7vBj70AA6oUc8NrXEc=
X-Received: by 2002:a05:6902:1588:b0:e72:9562:7638 with SMTP id
 3f1490d57ef6-e7297eae346mr19133785276.39.1745289500228; Mon, 21 Apr 2025
 19:38:20 -0700 (PDT)
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
 <CAHC9VhS0kQf1mdrvdrs4F675ZbGh9Yw8r2noZqDUpOxRYoTL8Q@mail.gmail.com> <CAADnVQK7kyBso6bNEtNyC6zTBDuBv-K-c4a9KBVid+B405VX6Q@mail.gmail.com>
In-Reply-To: <CAADnVQK7kyBso6bNEtNyC6zTBDuBv-K-c4a9KBVid+B405VX6Q@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 21 Apr 2025 22:38:09 -0400
X-Gm-Features: ATxdqUG68qWAXIVdhOvLBjOhkCBCyDq8PvskWDE6YshFl7NEp_uX0oI69pZKXTU
Message-ID: <CAHC9VhQE6xXQ1E1hmWzbrPNyVh_gKsp8U_GnPYr=0gS_RMATWQ@mail.gmail.com>
Subject: Re: [PATCH v2 security-next 1/4] security: Hornet LSM
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
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

On Mon, Apr 21, 2025 at 7:48=E2=80=AFPM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
> On Mon, Apr 21, 2025 at 3:04=E2=80=AFPM Paul Moore <paul@paul-moore.com> =
wrote:
> > On Mon, Apr 21, 2025 at 4:13=E2=80=AFPM Alexei Starovoitov
> > <alexei.starovoitov@gmail.com> wrote:
> > > On Wed, Apr 16, 2025 at 10:31=E2=80=AFAM Blaise Boscaccy
> > > <bboscaccy@linux.microsoft.com> wrote:
> > > >
> > > > > Hacking into bpf internal objects like maps is not acceptable.
> > > >
> > > > We've heard your concerns about kern_sys_bpf and we agree that the =
LSM
> > > > should not be calling it. The proposal in this email should meet bo=
th of
> > > > our needs
> > > > https://lore.kernel.org/bpf/874iypjl8t.fsf@microsoft.com/
> >
> > ...
> >
> > > Calling bpf_map_get() and
> > > map->ops->map_lookup_elem() from a module is not ok either.
> >
> > A quick look uncovers code living under net/ which calls into these API=
s.
>
> and your point is ?

Simply the observation that the APIs you've mentioned are currently
being used by code living under net/; you're free to take from that
whatever you will.

> Again, Nack to hacking into bpf internals from LSM,
> module or kernel subsystem.

I heard you the first time and rest assured I've noted your general
objection regarding use of the BPF API.  I'm personally still
interested in seeing a v3 before deciding on next steps as there were
a number of other issues mentioned during the v2 review that need
attention.  I would encourage you to continue to participate in future
reviews of Hornet, but of course that is entirely up to you.  In the
absence of any additional review feedback, I'll preserve your NACK if
we ever get to a point that your comments are worth mentioning.

--
paul-moore.com
