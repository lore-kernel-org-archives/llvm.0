Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE59272E63
	for <llvm@lists.linux.dev>; Fri, 16 May 2025 19:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747424970; cv=none; b=AIGm3SB3ACcIeP5ug7VNpdxdqituRJWbMP9Hint1IKC/soG2V0nBUxpk3400tP05g/9RG3EFAPTDqQGDUAikaYEuVmwBWWER7T/MIp7loWcB0lT/lLya3SXkBo4J6DvM9tPBGXyEzj/3QD9Ccsb0jBfnKuU1Opsj28UrDoM91oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747424970; c=relaxed/simple;
	bh=nLoaIDD6+TJAz0bOPeqNCjl0kdmqqVG70rJ0R5xo6R0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HSFeu3BGtql98xpfYzgGTUz9fI+lDuuuekGJeWv9JVZHa8Nn+SS8cuUy9FYLzkaccuoe8mbkIlMLUwwdGBd/z7o+TkNYH6U5gEeydYKezNmJ1NoXrN6Vi8604BZbjgB0p7TlTDHnG7D6Zez0xQkcwq00+j9Xp9mSz1LKhVtl06Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=Uszxz/j+; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="Uszxz/j+"
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e7adcaea616so2602586276.0
        for <llvm@lists.linux.dev>; Fri, 16 May 2025 12:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1747424967; x=1748029767; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8l/0xKrDAl3wR6FwPFmxGX5JGMTUvNTKlZKVf0AUdss=;
        b=Uszxz/j+aZbZYDRU+yq0m6psVPqcuV4nk9dm5hRmVapf6dawoYs3lUeRte4bekNs4w
         U0I+CA+48cGu8JA4hOmkPJNjqFL20xF1k4m2qdOg5YoPQbGbifH0q6DIkMnIyR4WKbHv
         PArBE3eemEIWOsZCKI2X+1E7APZL/msYaaROLC4S2hFcWNpQiAJYu/9leQ4/8PaERYWy
         eTPL6C5IxilMeJ8YNMfqWoZUzBSEHdvlTc+bv6+bBeB1ocrRSRLrk3p87kdKCyNVAXhX
         iI9Ywiq71zxUpeELJQvegCUgW3OHtcnc67J8yPXDj71bIU55wxy3eJ8r9/IzAHa1PUcF
         PnNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747424967; x=1748029767;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8l/0xKrDAl3wR6FwPFmxGX5JGMTUvNTKlZKVf0AUdss=;
        b=rhGT6RZq+tMFuCpEu8epVDyNIQixdVhHpscqDv06LTYtdPLPLyre8nocbxHFSYEMnz
         KPjxDPIGx5qIeZFRI+mYDg6NCRig6UQxoI7szjfQ4/OpSf0mSGZCoMPVWLSnqN80vc55
         HQe2ctJnNH/5Gx1rkZQAFsVyWhA8Wkdo9pfiJ6ncoxFZgwaQrEk7/GAbw679i/DwX5/X
         7NHPaIXEWPxqfzSRKPCwbL7ZBsE+bAA3ft4zePYlITOC9m+lOfl3qfRO/ji8aRJ93e+r
         yKPq7fXBPKYhmvLoR5TeteKWv/8DDMq9elHsB7b6eFTcBfxpA/F2P2gOlGE/cvrG324Z
         0Sgg==
X-Forwarded-Encrypted: i=1; AJvYcCUqCgt6oAfn/tRxfnaNl+3MJFJ3vzsNtD8xAz4GlNPs5itJWQRfc4jJS0b0Ny6j9JBKvxMf@lists.linux.dev
X-Gm-Message-State: AOJu0YzL4Wk1QiOs7yRxy1xVeGe28bCQO6WeXJ4JESLSREqGxEQIcmxf
	NHfiJccL6T9hvyq7GV2q0kbHS+XvY1FM5DSHhqNmoA6+YUjT0GZ7fqUhLtWpKufKWdBy589zC85
	ml0fNz5Sm5IJG3bN0VT2q7V1poO4LNia4sPdoaCPg
X-Gm-Gg: ASbGncu/imI/VLyqaPCu+A3agljbibJGehYP+1/M8zLOIWmyx40xu0uM1IonCMi4hLm
	NnsNl82tyau8GZSgqxm6a91cr582QydD4WOG8tOL3Lx1eAPjw98qr/MNNeOxQUaPoBXlUrNITuQ
	F79nbafEYtazL/SikVC8ill11L1PTIr+Ns
X-Google-Smtp-Source: AGHT+IEQIkzEpi0E3fz8WZlSmcfqapgq69lMRohpEoCb3vyZJS8ONyTw2i0/vIHmtC9UeMyPfp6xvEAOklEV9x0FCwo=
X-Received: by 2002:a05:6902:1b09:b0:e79:7ba6:f8d with SMTP id
 3f1490d57ef6-e7b6d3bb248mr5339420276.7.1747424967244; Fri, 16 May 2025
 12:49:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250502184421.1424368-1-bboscaccy@linux.microsoft.com>
 <20250502210034.284051-1-kpsingh@kernel.org> <CAHC9VhS5Vevcq90OxTmAp2=XtR1qOiDDe5sSXReX5oXzf+siVQ@mail.gmail.com>
 <CACYkzJ5jsWFiXMRDwoGib5t+Xje6STTuJGRZM9Vg2dFz7uPa-g@mail.gmail.com>
 <CACYkzJ6VQUExfyt0=-FmXz46GHJh3d=FXh5j4KfexcEFbHV-vg@mail.gmail.com>
 <CAHC9VhQL_FkUH8F1fvFZmC-8UwZh3zkwjomCo1PiWNW0EGYUPw@mail.gmail.com> <CACYkzJ4+=3owK+ELD9Nw7Rrm-UajxXEw8kVtOTJJ+SNAXpsOpw@mail.gmail.com>
In-Reply-To: <CACYkzJ4+=3owK+ELD9Nw7Rrm-UajxXEw8kVtOTJJ+SNAXpsOpw@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 16 May 2025 15:49:16 -0400
X-Gm-Features: AX0GCFuBXEBi1NnN_9kfsOxw-5nGHtwLhBNF6-R1ixmmmxe2op_6asanhCRDNXU
Message-ID: <CAHC9VhTeFBhdagvw4cT3EvA72EYCfAn6ToptpE9PWipG9YLrFw@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Introducing Hornet LSM
To: KP Singh <kpsingh@kernel.org>
Cc: bboscaccy@linux.microsoft.com, James.Bottomley@hansenpartnership.com, 
	bpf@vger.kernel.org, code@tyhicks.com, corbet@lwn.net, davem@davemloft.net, 
	dhowells@redhat.com, gnoack@google.com, herbert@gondor.apana.org.au, 
	jarkko@kernel.org, jmorris@namei.org, jstancek@redhat.com, 
	justinstitt@google.com, keyrings@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-security-module@vger.kernel.org, 
	llvm@lists.linux.dev, masahiroy@kernel.org, mic@digikod.net, morbo@google.com, 
	nathan@kernel.org, neal@gompa.dev, nick.desaulniers+lkml@gmail.com, 
	nicolas@fjasle.eu, nkapron@google.com, roberto.sassu@huawei.com, 
	serge@hallyn.com, shuah@kernel.org, teknoraver@meta.com, 
	xiyou.wangcong@gmail.com, kysrinivasan@gmail.com, 
	Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 14, 2025 at 2:48=E2=80=AFPM KP Singh <kpsingh@kernel.org> wrote=
:
> On Wed, May 14, 2025 at 5:06=E2=80=AFAM Paul Moore <paul@paul-moore.com> =
wrote:
> > On Sat, May 10, 2025 at 10:01=E2=80=AFPM KP Singh <kpsingh@kernel.org> =
wrote:
> > >
> >
> > ...
> >
> > > The signature check in the verifier (during BPF_PROG_LOAD):
> > >
> > >     verify_pkcs7_signature(prog->aux->sha, sizeof(prog->aux->sha),
> > > sig_from_bpf_attr, =E2=80=A6);
> >
> > I think we still need to clarify the authorization aspect of your
> > proposed design.
> >
> > Working under the assumption that the core BPF kernel code doesn't
> > want to enforce any restrictions, or at least as few as possible ...
>
> The assumption is not true, I should have clarified it in the original
> design. With the UAPI / bpf_attr the bpf syscall is simply denied if
> the signature does not verify, so we don't need any LSM logic for
> this. There is really no point in continuing as signature verification
> is a part of the API contract when the user passes the sig, keyring in
> the bpf syscall.

I think we need some clarification on a few of these details, it would
be good if you could answer the questions below about the
authorization aspects of your design?

* Is the signature validation code in the BPF verifier *always* going
to be enforced when a signature is passed in from userspace?  In other
words, in your design is there going to be either a kernel build time
or runtime configuration knob that could selectively enable (or
disable) signature verification in the BPF verifier?

* In the case where the signature validation code in the BPF verifier
is active, what happens when a signature is *not* passed in from
userspace?  Will the BPF verifier allow the program load to take
place?  Will the load operation be blocked?  Will the load operation
be subject to a more granular policy, and if so, how do you plan to
incorporate that policy decision into the BPF program load path?

--=20
paul-moore.com
