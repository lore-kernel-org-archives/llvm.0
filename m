Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F366A4A6CFA
	for <llvm@lists.linux.dev>; Thu, 15 Oct 2026 07:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792050471; cv=pass; b=RVZL1dw/oTD2Vlg0zzeDrI3AVxtQgHCoER8Ff8wCxzzZBq04svK9rgkYoadqYwD05RRCd1i2nh1n+9+xUtW1Ns273Yl1W9p5QKpoLckfjLbOLt+aqL9Gaf5zKxXXdv0nax+Y42bgwWomuAoru/D6gwo8NyLm+EWvZfurVlL7nZk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792050471; c=relaxed/simple;
	bh=qrhbYvBNv/N0VI8PEYpw8zABc5tgbspPTRKzj2j/IcY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OIRPLKELKKChMPwT8uCZH+xLKTBmZIuzvJsFeL6EsbeFkFjiUYPPVCE2kQmrWtKBlkS+VsE9aMiJPTIIUTJ8jIQIbp2jx4ldSdYngpX1yf0TBmUa+awhSFmi4TOqGUwmBW7oamTwufav/5RvpIAIn+/hM41yzthqQOiRaicFkT8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iSbQmNt7; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iSbQmNt7"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-313bab9cfe7so603543eec.3
        for <llvm@lists.linux.dev>; Thu, 15 Oct 2026 00:47:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792050468; cv=none;
        d=google.com; s=arc-20260327;
        b=hLiubcinY2j4VdlCDktrpytC+IsWNSBANnwC6Gf+QHRBE6lUwPtXkkmUKkINAa1Ykd
         gGxqWvGmjrGekQASzYXXiOgiVtUN0VIUOB6mMwT5EbovVLWZvSWoXxyBPzHzKTz1gy7k
         8EsEgBVkjGZQT1NDcbBMBzqFLy7O6eQblqSI401w1JEWlyrcAYd+wQHxhudl25gorqRh
         7Tcm/Sn9suzHTl0VI5jiBm77dzo1Tcc5Pyg4nSwB5w5xgwcLgBNyNS2qsLhTS9F1Tge4
         yx6QNx5ZeoMBn0eHy7ltqxLH6/l+mP+PM65wKZobR7uq5HlPb+k7efPIQA3IIUm47voo
         uWIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aZLy1FDhAffyNHLdSNSc3Bq3qLESgLIT723DgtaMR+Q=;
        fh=yWFPQOrF3Qh1Fnu1pC0PhuRQ4lJPthKqU2BYhy7DTME=;
        b=oVlVH225qMBY4MAcv+gzwM0HhM1hoAgCQmUhH8Ki8iARRpALj08FPISFQ2g7OQ4/6t
         eR21w2H50YODRUIbuWnnyHVkce9x1JAzYcr1Nk+KseCZXo7k7JE2GwK6t4/ORgqrgXm8
         cOvgRXPgr6P0JOObze69tk18II8NtqMTjVIKSZ3pfwLgMzgto0HiqCEL9H3xB2qLk99M
         zY9at/m2fLropXXgUuxN4G4CxmwTSiaQW5N3YuC+ytmyzaxErmMSpoA+eQ3UwQ1n4Ik3
         vNqBp2+mgwRw6CzivWYFEpiP67scWWkhzilE0grJJWrxG6iuj7dFWwW792BDFAq/k8TK
         pJ/g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792050468; x=1792655268; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aZLy1FDhAffyNHLdSNSc3Bq3qLESgLIT723DgtaMR+Q=;
        b=iSbQmNt7JPTmNe+sBtJ990Up3n/eTUrR9v33GwgLuTH7PtdqFOpByniofB7XVue7ur
         N8dWA1lZ0AfIlTmq1VHwXrUBvJGZ+y8K9PDqIjcTEnkvaxxkgbiwMyBn0B8ELjd/o+yx
         odoTUIhARYGhuTgyKz4TtaIU4CPpWCakIf6TPkYTmbFYmf266RFNMKyTTxIFvHKamHDp
         6zaQneMfWxHBI/4FWoMu84l9QUr2qQwEwdv8EI+24S5g1VTkZaqQK+sA7Htm1h5I3TbW
         /roQ3gKjMMHcJUT/e/SHJJAuegii20QLQU3Frj6Xgx5/1Ba5KpAULgEl6+HaUbh6SccJ
         /uiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792050468; x=1792655268;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aZLy1FDhAffyNHLdSNSc3Bq3qLESgLIT723DgtaMR+Q=;
        b=EsOcWUtwbIlIkVoCf8iZgGFrWzVtODDynnrRtKosUMdk/gbaElzFjN3oH44QYxOSPj
         ETna4Nkz75OPvPrrbXklDYPNIuyfy7p7OZHYYxK9ahy3wzN76JhDvxofGoXu0opcowzj
         CegflB72/bPW6zVi4wI+FUU7ECxaaym3ya5i++il7FoGIHRX4uL598dX0qAuZkd63dSq
         Z1l/vWw4uV6ModB9h+T2fuGcbeljs9fnFVK3/aL7kM59C7LPmPn58cH9fEbMt1X2DLaT
         hg78r3SNmtk5PUqkV3xrgMV+FJAeeevCuICOg1hNsPzmVDk7XfYr4f6G38pMdVCHOTwc
         ayjw==
X-Forwarded-Encrypted: i=1; AKwUvBwoqV1Vv8H0YqWyY/8Td9W+Au4kbvvgSHmwX6INi3CpYf29kSsBHwnfDvaRXzEyetlYrtjD@lists.linux.dev
X-Gm-Message-State: AFq9FYLdJwy1XI5xKgAUWUDNCV9YZNOqMoF3wOGtUTX7gghdJwvgt/UJ
	ifl3M98BqTbjQBwPe8J/BYIAZ9sjsjL9UmKAZUJwvxvJ7HwKL93vV46uef+f1uStuurf4pMF1X3
	cshklW318HbDCMX9kCqSSK2HP/MxNuao=
X-Gm-Gg: AYBFou3kJ/4eeZbyLJBnkVlZsz0OKv+j4qA3G/+AwM6ma4pizc617TMjc1PUc0dzKdh
	X1V84stJci3l85OIkwzcO79sYj7wfzuWCnA9CCetlNUXda9HuCe346RiiRJ+YNuqR2iJ+CjL4nw
	Ugd8+nBnjv67L0XsQ7QJEXGkwl8DBVbxO55HF5HuGUBBMxgPdyiq88ziBbt4DGdpbtCYMCToFJP
	XJ+iXqDMe6Xwzaow2YNyCWp3mJEM3lqMCxgo5ttRpij2T4B5JTYilrLCh76vtvD8jtAUovvlfT4
	L0FPU7uKmZlmrXQASDUFsPunRUei0etdPyRuMmXVzHRoa08rP7ClMCNwcSs133JplzF/jHUoRf1
	15fDOXVrSmXLUfXDhrndGJXGwM5CAiSE9gcAdea71SY6A0u7JM9CwTsuxP8OjlfMH+4caw/WeDd
	ExR6sL2uETrlV9blfssZTuzOLlLZ6CYq21WmzRNqEvHG75mNqg0Bs=
X-Received: by 2002:a05:7300:f3c8:b0:351:7883:bf47 with SMTP id
 5a478bee46e88-3537dc8e9c0mr38650196eec.0.1792050467352; Thu, 15 Oct 2026
 00:47:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261014225811.i.852-kees@kernel.org> <20261014225818.3457479-2-kees@kernel.org>
 <2026101517-profane-opponent-4523@gregkh> <CANiq72m_iyquf4Lc8AWvbsBp++ASz4+C_MQ5iYQW-fHd_MNDxA@mail.gmail.com>
 <C46E97AC-3722-4264-B541-04EBC3091E00@kernel.org> <2026101532-fantastic-deafness-e04c@gregkh>
In-Reply-To: <2026101532-fantastic-deafness-e04c@gregkh>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 15 Oct 2026 09:47:34 +0200
X-Gm-Features: AclHuK8JUch3-LLJNkG2OM0JVExMlV2wP7uKNynE1Z6fAhzs1hBzwjLh_wcCofk
Message-ID: <CANiq72=wS5NJyeKKaYiHKWhDq2Wjk728qkCUNq4xVoHrPEPCRw@mail.gmail.com>
Subject: Re: [PATCH 2/2] seq_file: Require explicit initialization of struct seq_operations
To: Greg KH <greg@kroah.com>
Cc: Kees Cook <kees@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-fsdevel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 9:11=E2=80=AFAM Greg KH <greg@kroah.com> wrote:
>
> __must_init might be smaller?

That sounds fine too. I like that it says that something *has* to be
done (like the original name did). Hmm... On the other hand, I guess
"must" could sound like one has to initialize the field "somehow",
i.e. writing:

  struct S s =3D {};

definitely initializes it, yet the compiler would warn. Would
"explicit" hint a bit more at the fact that one has to actually
"write" the field, even if it may have been initialized anyway?

(Of course, if one knows that the attribute only applies to fields,
then it doesn't make much of a difference)

Cheers,
Miguel
