Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B37223C519
	for <llvm@lists.linux.dev>; Fri, 16 May 2025 23:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747439364; cv=none; b=W+AcEjAh4lmYIRy1KAetKUo+EdDx4Z2KPGVHz9iiWGxK83+YtN1ckGB5Cqm+5z+jAzlmvCumvS4+HkHkbASV5xKSE3L/65vThwRPHjc0MHlKJNR9xYU2lsw2h4CK1r7rS4e5OzIEK8Y5WcRMjRq65DEriGffDhdOyShmWDUqQJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747439364; c=relaxed/simple;
	bh=JynXQczZCmV7Hl5daVJbPr86DC3r593cY6JyojI2h9E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bejp73J3Ow1F22pPpN08eUE2dpK9c8c/yszJn+/nCoANrPoyAjpjIhnPnSrpfVlOgWvKQvarQRgXwTlkFsuibFZPYc2NOPhvyH9zUS3s+2RB+g7/6LfidJ6pgOPgqLmb1Ujfg06eC34LWyOJBYvOJaIpr3DW/D13Nzc9U36j86g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b5WHggY1; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b5WHggY1"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a361b8a664so1025447f8f.3
        for <llvm@lists.linux.dev>; Fri, 16 May 2025 16:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747439361; x=1748044161; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yLNmQk56WXrXrbrs+Rd+UwZYq2EuCmP2+ysJch2Gqcc=;
        b=b5WHggY1sE6acz10aWAhT5AMxaWZmeyaE1+WNjStd+eWqlD2RuOf99so95d3ojl2r1
         4AZAi7VTlyu53o6W8EeWgUMthGXXtdEoH46BSYJBsvwx5kfgTdOd5JyiUCZ7WVfk3W6k
         UddYi4CGhzB5letDEXdo9INhtrTYpU21eeRX3qiLbtk+xlo6D7MX9BMaXJsMkEXwcg5n
         4UiSUBo9oIPIDQJ+0VNDkH76fk+yJ7/IoDvnKlpwdXXo6i1LR2MAyD27MXYGX1eF0Ng1
         PAfCbXAQ0sL3aET0o2DS6VpbX71Xe02JKr6PVehFDabcmKUgy62c4qiZ7D6S6NF99ySB
         /yeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747439361; x=1748044161;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yLNmQk56WXrXrbrs+Rd+UwZYq2EuCmP2+ysJch2Gqcc=;
        b=bKZX/grIvcXZ6u4C1c825u50aAu1ylXBDgpUnVP/17Upy38gcnnRPJ1nVPHdfbcxV4
         iMKTwv2NOVBrz6pMFVVLzV4vQjyRC+WuG7ptF21ccrqu3maqbLv5DwKpF7HgY1mipj6Q
         VHipq2Z/52CJlVOZp37rV0SYyDadjkuU4c5OsR7/GEkmby2piYXPWr9cPeERsZujwn4u
         etHuFR7iDhUtYFLmwD/NLywSmjaTDGHLu1k0sbkR1gxgRMp0X9WJzgH0t3vzVxeXxCb9
         nLDQlUWx+wwoW61TPpdOJgBm8Y/KWlwi/pQwHshM2Y5iWu05hNrU4LIp1XOAnm4o02Ls
         rZtg==
X-Forwarded-Encrypted: i=1; AJvYcCVrRI5dPMTpYXg9GN9sfHm/+FAPBDZMzJBsz14g7axooVTmOAh9Qe+mbNgQjrkDY3BVs80A@lists.linux.dev
X-Gm-Message-State: AOJu0YwkxIJbNqNkFRrZs9RFY6tyPV9VgLC9BcKshyNy8/A6EV5bZw/b
	knuMsxgGYCwhNUNsVP9wupkqtS1VO8OQCIHocVE8G9sO1/r80jgCFaiTeEqSC7BcKTS8J0RtV7b
	Bpj/XaqrrOcTEf9/9XHsyjHWLRRqrURs=
X-Gm-Gg: ASbGnctkgAgUheBpzVTwa5WgQUm/giprA85rj8XM2OSFSLj0j/MhKr4tePMjMY8kMdr
	duDHDPRvJ2Idm6MkbJToHpBY5ptZQymddvhbPQG4q/I9l//LhUZ6ilHfSdnuqVqW+gtetnDNEcX
	+Y9BZQE2tcgHRF2Ix0k3XQdb67Dbjh63+2aX0b4Co16XUWibdeoVIXYioiayvgJilRAFinUATy
X-Google-Smtp-Source: AGHT+IEt13ebOwzpc+kY0WsGrWXwVoXKnKPvRfcOK4btMC7AsUlFZwn4kwFfwxO5xffregucUV2pzpgY8z4kdU24ZPU=
X-Received: by 2002:adf:f50b:0:b0:3a3:5c97:d756 with SMTP id
 ffacd0b85a97d-3a35c97d8aamr4266342f8f.17.1747439361049; Fri, 16 May 2025
 16:49:21 -0700 (PDT)
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
 <CAHC9VhQL_FkUH8F1fvFZmC-8UwZh3zkwjomCo1PiWNW0EGYUPw@mail.gmail.com>
 <CACYkzJ4+=3owK+ELD9Nw7Rrm-UajxXEw8kVtOTJJ+SNAXpsOpw@mail.gmail.com> <CAHC9VhTeFBhdagvw4cT3EvA72EYCfAn6ToptpE9PWipG9YLrFw@mail.gmail.com>
In-Reply-To: <CAHC9VhTeFBhdagvw4cT3EvA72EYCfAn6ToptpE9PWipG9YLrFw@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 16 May 2025 16:49:09 -0700
X-Gm-Features: AX0GCFuvvvJ18JnaOTj0Zx7VVAejABXpQG7xGivhE2V41LonoDOtxmhIAAR39TA
Message-ID: <CAADnVQJ4GDKvLSWuAMdwajA0V2DEw5m-O228QknW8Eo9jxhyig@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Introducing Hornet LSM
To: Paul Moore <paul@paul-moore.com>
Cc: KP Singh <kpsingh@kernel.org>, Blaise Boscaccy <bboscaccy@linux.microsoft.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, bpf <bpf@vger.kernel.org>, 
	code@tyhicks.com, Jonathan Corbet <corbet@lwn.net>, "David S. Miller" <davem@davemloft.net>, 
	David Howells <dhowells@redhat.com>, =?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Jarkko Sakkinen <jarkko@kernel.org>, 
	James Morris <jmorris@namei.org>, Jan Stancek <jstancek@redhat.com>, 
	Justin Stitt <justinstitt@google.com>, keyrings@vger.kernel.org, 
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, 
	LSM List <linux-security-module@vger.kernel.org>, 
	clang-built-linux <llvm@lists.linux.dev>, Masahiro Yamada <masahiroy@kernel.org>, 
	=?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	Bill Wendling <morbo@google.com>, Nathan Chancellor <nathan@kernel.org>, Neal Gompa <neal@gompa.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Nicolas Schier <nicolas@fjasle.eu>, nkapron@google.com, 
	Roberto Sassu <roberto.sassu@huawei.com>, "Serge E . Hallyn" <serge@hallyn.com>, 
	Shuah Khan <shuah@kernel.org>, Matteo Croce <teknoraver@meta.com>, 
	Cong Wang <xiyou.wangcong@gmail.com>, kysrinivasan@gmail.com, 
	Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 16, 2025 at 12:49=E2=80=AFPM Paul Moore <paul@paul-moore.com> w=
rote:
>
> On Wed, May 14, 2025 at 2:48=E2=80=AFPM KP Singh <kpsingh@kernel.org> wro=
te:
> > On Wed, May 14, 2025 at 5:06=E2=80=AFAM Paul Moore <paul@paul-moore.com=
> wrote:
> > > On Sat, May 10, 2025 at 10:01=E2=80=AFPM KP Singh <kpsingh@kernel.org=
> wrote:
> > > >
> > >
> > > ...
> > >
> > > > The signature check in the verifier (during BPF_PROG_LOAD):
> > > >
> > > >     verify_pkcs7_signature(prog->aux->sha, sizeof(prog->aux->sha),
> > > > sig_from_bpf_attr, =E2=80=A6);
> > >
> > > I think we still need to clarify the authorization aspect of your
> > > proposed design.
> > >
> > > Working under the assumption that the core BPF kernel code doesn't
> > > want to enforce any restrictions, or at least as few as possible ...
> >
> > The assumption is not true, I should have clarified it in the original
> > design. With the UAPI / bpf_attr the bpf syscall is simply denied if
> > the signature does not verify, so we don't need any LSM logic for
> > this. There is really no point in continuing as signature verification
> > is a part of the API contract when the user passes the sig, keyring in
> > the bpf syscall.
>
> I think we need some clarification on a few of these details, it would
> be good if you could answer the questions below about the
> authorization aspects of your design?
>
> * Is the signature validation code in the BPF verifier *always* going
> to be enforced when a signature is passed in from userspace?  In other
> words, in your design is there going to be either a kernel build time
> or runtime configuration knob that could selectively enable (or
> disable) signature verification in the BPF verifier?

If there is a signature in union bpf_attr and it's incorrect
the prog_load command will be rejected.
No point in adding a knob to control that.

> * In the case where the signature validation code in the BPF verifier
> is active, what happens when a signature is *not* passed in from
> userspace?  Will the BPF verifier allow the program load to take
> place?  Will the load operation be blocked?  Will the load operation
> be subject to a more granular policy, and if so, how do you plan to
> incorporate that policy decision into the BPF program load path?

If there is no signature the existing loading semantics will remain intact.
We can discuss whether to add a sysctl or cgroup knob to disallow
loading when signature is not present, but it probably should be
a job of trivial LSM:
if (prog_attr doesn't have signature &&
   (task =3D=3D .. || task is under certain cgroup || whatever))
  disallow.


Note that the prog verification itself is independent of the signature.
If prog fails to pass safety checks it will still be rejected
even if signature is ok.
We're not going to do a verifier bypass.
