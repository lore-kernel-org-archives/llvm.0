Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB6A298CDA
	for <llvm@lists.linux.dev>; Mon, 23 Jun 2025 15:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750691755; cv=none; b=uavSdT403x3X3+ZUhmCeg7ZHfubHQermYpRjZf0H4cQPaq7HeSoxJ+3SAHN6BzPN9j6AxO/s/0j6dk/ENJ7G/6M1Z3aAFypSF22rrwXo8PptkTMjDrBgSSMMYx4BE/Dcs2zp4ZTM+WAdivOr7rscH/QNADMnbbHi7wy2p/l3T94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750691755; c=relaxed/simple;
	bh=bqmkafwxydyORUt50Ur58Kwuhlign7ZQjhD916NZCSY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dc/cLycpZRoI6cXNP8sHzNXWk8ylOXPsdJ+BDfNtQcHpaKl4WVaYKVmSdxNRmXb0AYW/x6ew/1xZtQe0VsAsVaFl8Ad6ntE4XCj/2YnPvEgmMnTzrhtobToLJ9UzDyp8UuXiQbDoV9trsU4R2JHU0WHEQUr0Fw+ju/mx6EQU32I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=dIWxsgIP; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="dIWxsgIP"
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e81877c1ed6so3434805276.0
        for <llvm@lists.linux.dev>; Mon, 23 Jun 2025 08:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1750691751; x=1751296551; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/cEM3zQRxkyeF8QlajSb8sKwoIOz06mgwPF6H5WCdJ0=;
        b=dIWxsgIPHv6CCv0r1DmuwM5oWCDN1J7gHGHsLpeiQnt0+/AojLIC+kTXRh9bXZtyfY
         9qITx7xKmFWbHyzpuxcSufGcZwIbncRsy4Yk74WXMGe7uTmsEkKBkoXcADw0FSaxWM3b
         Zo/7yEENP8nLKSVC6GUJsItdb2DrpMHTth3o7tmNXN7aE92TA+bB32grdBdZJdikAaFD
         3Iz7jTvBjxR2+ss7saxJ700/CNiNqZba44OOSHOjKFGtVQZqJLGlMjCOnFtSSa9TDYhf
         evb0GjNY2Xmx8qDV2v7l2buPz5fhpkZhmoy2nZI6ZqkpVGr6fjnQm6y0wh2wUgKnvkya
         3lmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750691751; x=1751296551;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/cEM3zQRxkyeF8QlajSb8sKwoIOz06mgwPF6H5WCdJ0=;
        b=AAD9unMfLIzXWADpbVRCT1RidW+Onx4+8lwHR4Wp2gtmf3qd5wTQkdA2htWoW/lGZx
         3hjRDcnvNl0m5N7hpcwzSdygSmqpHo2xzwwFAYmgAMAkhOEmq7YRblqm0+/ZU8MQoGbm
         i2TsptW99L8GQf0OJQZCBAyzwkrQX5NX8bMgzNYSIB1RKmYW3YY7mBn5XNORDSiCxMW5
         Xfg5k9bcIe4dyEoYK7PoyiVwJMxd+rvw6G+PD1r44nmvxjbHDjmdi53LZMLc7gjXgxlT
         TppnyIEpQ1YunWXJgicDUYtqb1Ur/4+/2M01lNS9dO04pAK2THd9cY3o5X4RbwpN+BU7
         TdOA==
X-Forwarded-Encrypted: i=1; AJvYcCXbInnSX0KQ+qRtKso6/NukxfK7xZ2mwFoj+BxgtvQFgeERJ/dHG7aoocCs13Aiz8dWR+Qa@lists.linux.dev
X-Gm-Message-State: AOJu0YyWv97N36AVGu7xjV0gSR2eWbxLbs416OvZZLmIf2ukGJVS4T2q
	/N9ak+vgz70S5oLn3upN0ThzQdrwg8gf17Rgss16m5gKH2uX/ugCE3CCAubHHVlqfrrXPuwFKCw
	vaVOI08qsdvGi5fNujGm8tA+YjnogQ1gE2qG+ptR+
X-Gm-Gg: ASbGnct/Fp/RomRymAhSAXdKKYIudGq071K0jUz/PPn/x6a64gkVgwe0ZwbZKHZfHik
	foHvR1G4dMd96Nj0T4HMqiHnJNV7aGT9lz9+6fzio8OvTNVDQ0xG7BDD7mAU+zI1HxoJQ+xejTy
	O8nAc3uyDA0EohflrAehqdifwt0Z8iJ90QoqVRTc6RKvo=
X-Google-Smtp-Source: AGHT+IFZQzn3+JMIyejKC2+W29AQd1WwouaHlQDxuqJsYDQVdOYz9u2SoStqSDrpqsqEky4EPBlD56TODEPQ9GFR58M=
X-Received: by 2002:a05:690c:9683:b0:6f9:4c00:53ae with SMTP id
 00721157ae682-712ca356122mr174541157b3.8.1750691751048; Mon, 23 Jun 2025
 08:15:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250622-toicsti-bug-v1-0-f374373b04b2@gmail.com>
 <20250622-toicsti-bug-v1-2-f374373b04b2@gmail.com> <CAEjxPJ6v12nLFx-x4-=esuPMp7L8UBvTzoj1kkTPcD2mDKKW8w@mail.gmail.com>
In-Reply-To: <CAEjxPJ6v12nLFx-x4-=esuPMp7L8UBvTzoj1kkTPcD2mDKKW8w@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 23 Jun 2025 11:15:39 -0400
X-Gm-Features: Ac12FXw75VZJClzZmRv1umOqFnfnvmDMNU_jKRuRdLW4QXd6DpSXCOL2kXN21Os
Message-ID: <CAHC9VhS8gPQwgesV_0VbUuqxGrADm5uDofM3m=wZuAEgkWi5Hw@mail.gmail.com>
Subject: Re: [PATCH 2/2] selinux: add capability checks for TIOCSTI ioctl
To: Stephen Smalley <stephen.smalley.work@gmail.com>
Cc: xandfury@gmail.com, Shuah Khan <shuah@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Ondrej Mosnacek <omosnace@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev, 
	selinux@vger.kernel.org, kees@kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2025 at 8:39=E2=80=AFAM Stephen Smalley
<stephen.smalley.work@gmail.com> wrote:
> On Sun, Jun 22, 2025 at 9:41=E2=80=AFPM Abhinav Saxena via B4 Relay
> <devnull+xandfury.gmail.com@kernel.org> wrote:
> >
> > From: Abhinav Saxena <xandfury@gmail.com>
> >
> > The TIOCSTI ioctl currently only checks the current process's
> > credentials, creating a TOCTOU vulnerability where an unprivileged
> > process can open a TTY fd and pass it to a privileged process via
> > SCM_RIGHTS.
> >
> > Fix by requiring BOTH the file opener (file->f_cred) AND the current
> > process to have CAP_SYS_ADMIN. This prevents privilege escalation
> > while ensuring legitimate use cases continue to work.
> >
> > Link: https://github.com/KSPP/linux/issues/156
> >
> > Signed-off-by: Abhinav Saxena <xandfury@gmail.com>
> > ---
> >  security/selinux/hooks.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
> > index 595ceb314aeb..a628551873ab 100644
> > --- a/security/selinux/hooks.c
> > +++ b/security/selinux/hooks.c
> > @@ -3847,6 +3847,12 @@ static int selinux_file_ioctl(struct file *file,=
 unsigned int cmd,
> >                                             CAP_OPT_NONE, true);
> >                 break;
> >
> > +       case TIOCSTI:
> > +               if (!file_ns_capable(file, &init_user_ns, CAP_SYS_ADMIN=
) ||
> > +                   !capable(CAP_SYS_ADMIN))
> > +                       error =3D -EPERM;
> > +               break;
> > +
>
> So, aside from what I said previously, this also will break any
> existing policies currently controlling TIOCSTI
> via the selinux ioctl checking in the default case, so at the very
> least, this would need to be gated by a new
> SELinux policy capability for compatibility purposes. But I'm still
> unconvinced that this is the right approach.

I want to add my voice to the other comments that adding these
capability checks to the SELinux code and not the main TIOCSTI kernel
code is not an approach we want to support.  Beyond that, as others
have already pointed out, I think some additional inspection and
testing is needed to ensure that the additional capability checks do
not break existing, valid use cases.

--=20
paul-moore.com
