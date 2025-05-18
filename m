Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85731487A5
	for <llvm@lists.linux.dev>; Sun, 18 May 2025 15:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747583540; cv=none; b=bRVq2YjYkFA4pbDtUO+OCXobIoSRZbpRMTgY0bIxYU8AOLhdUSv2OS+4ObaUWYRdHHAGNLZKa40yjgNHgvJarWhE+4GmfO4B5BbanrXkN/aqOOgZfGC59WwzkABJOVbr9EHBBimO8RIVZgLNOC2Wyok9XeaHEymcl2QeSD//7ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747583540; c=relaxed/simple;
	bh=+3sfbNrs775Nuch7lp3CXdZrxEkkKx2XOLmSr98QaCA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G/SvXzNlnSEDkEswVc/7hs9WPhkB6QlPczmiValdS5hzH+3JNo2LZpnBI2ZK4nru+OBZrNW9ZjhzCacFUcqQ7Fs9fvVVpa5oWk+y/bWvurtAaA/QJBgOg17iOBbvh/ViK9q08e5CD4FBFMPPrliKeQifi8QGk9RlIsQH0x+qwWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VYfwsPg9; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VYfwsPg9"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a36c2d3104so312308f8f.1
        for <llvm@lists.linux.dev>; Sun, 18 May 2025 08:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747583535; x=1748188335; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c3as2gF+IatO8dg1hmkBSNBs2pFXaXsGSX1ZIQFwJQ4=;
        b=VYfwsPg98SdigJCwLrmG2z1mwNjJ+XSpMkTSWqapcq6uqBSONeiFJOfXmWJh4sgkKD
         2Cz3MDF5X0HN/KcrPaev3/0Defapfdn5KlndDjBws4cYbiYCXoIvH4hNIFs9DDb8dyuB
         ngEFOxBB+Uh7cixz7LUS0QOFvu9mFoHX59+N5aIz2nliaA/W7imtaMM+KLvZsPPziXP+
         4w/YMoWSnySuJ34kFJtUw6xXY6rwDfLwxlCcPUmNuuWefA7vxtnDc+h0olJQy+81OUV4
         A1N8qsdu9MPIxpwYI1/ZDteJmlfylgBACSfsgwQWlcVa/x6rbpu8UEQ9YOfvEkNAPP8Q
         Rhiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747583535; x=1748188335;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c3as2gF+IatO8dg1hmkBSNBs2pFXaXsGSX1ZIQFwJQ4=;
        b=JpzkXbj77OeMHObNy7gl6YJsjpwliT74/X/+NHSw7OHIJ0t8fOEz5C6qZSIAD3I5da
         yU4Lz4W9QfnxRBwUunMjcayoe7dlxJ2zEZTReDRjNMhgTwRzJjUJVRrrGyU8uEfHgywO
         cVdSRbwZ54JzI8E8TzO6xKlesMRP6Akft1TEC5P7X7vXgKPbswGUgohAQ+0H+UUYdTJw
         8/0B4En1kOKcLbU8meUriwfd3l8cjgYRXgkWnQEWZepAO899JsJEwmrD2kBWOu/Muf2K
         dk/v+TzC+TNDDdkivehr3yAJbCqvgZQ0wJbf49SZSLfSPqHmGsqzuzwet6ZUbt8mgp2F
         ksBQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1nxBnBT6ngX0ZvaVPFM58WXFESHxkafz5nSTj3p/lEVNf7MjhGGn6D+yCG8wZ21n9/kYq@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9x/Wf9lWbjNe5aj1HhqX459TOkhwc8X91O6z3paT5k5fWPuC1
	OGm6XCxYIhOxZ4S8vF+j9TjReqFMVWQwYw0nmAFxdaGMedqNHThu/11y/ESeYdXuzYjJpaMu2kL
	p2GOuxw4gj5chmCk8ghAkCmrdcWzsXNo=
X-Gm-Gg: ASbGnctB1FBQyJCR6UYls8Ttnzz2w5BNefceH5o9P7Cg+tagkWdwjfAWeavXMB4Vdpq
	5Tl4BsLC3NH72WzdAIpzl50JDNxIBRkiOdPoVvBreFnsYYC3lV9Ux/2QYiBimEnDsGBap99AQQf
	8Sv4v7L0KuOFf47huQxOgPbVVet9FjDGc1Qx3D3BYiPETcNKGcC9KdJwoKiSBO5w==
X-Google-Smtp-Source: AGHT+IEiZa7/kL1vl+lHgpPDDtfRZ6UOCk/sObQ0RqGRPFYYBykx/zOKPS3oTQuTUrCCrc8E+OeC4fTdKLrwex1Vzss=
X-Received: by 2002:a05:6000:188e:b0:39a:c9c1:5453 with SMTP id
 ffacd0b85a97d-3a35c8457cbmr8695268f8f.49.1747583534541; Sun, 18 May 2025
 08:52:14 -0700 (PDT)
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
 <CACYkzJ4+=3owK+ELD9Nw7Rrm-UajxXEw8kVtOTJJ+SNAXpsOpw@mail.gmail.com>
 <CAHC9VhTeFBhdagvw4cT3EvA72EYCfAn6ToptpE9PWipG9YLrFw@mail.gmail.com>
 <CAADnVQJ4GDKvLSWuAMdwajA0V2DEw5m-O228QknW8Eo9jxhyig@mail.gmail.com>
 <CAHC9VhTJcV1mqBpxVUtpLhrN4Y9W_BGgB_La5QCqObGheK28Ug@mail.gmail.com>
 <CAADnVQ+wE5cGhy6tgmWgUwkNutueEsrhh6UR8N2fzrZjt-vb4g@mail.gmail.com> <196e1f03128.28a7.85c95baa4474aabc7814e68940a78392@paul-moore.com>
In-Reply-To: <196e1f03128.28a7.85c95baa4474aabc7814e68940a78392@paul-moore.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Sun, 18 May 2025 08:52:03 -0700
X-Gm-Features: AX0GCFt9M3_dCkyMrm7XCxwJyjC1dFUOiX7_cT3eZ9_H0MvAbu0YgA5uhMOcM8E
Message-ID: <CAADnVQ+=2PnYHui2L0g0brNc+NqV8MtaRaU-XXpoXfJoghXpww@mail.gmail.com>
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

On Sat, May 17, 2025 at 10:49=E2=80=AFPM Paul Moore <paul@paul-moore.com> w=
rote:
>
> On May 17, 2025 12:13:50 PM Alexei Starovoitov
> <alexei.starovoitov@gmail.com> wrote:
> > On Sat, May 17, 2025 at 8:03=E2=80=AFAM Paul Moore <paul@paul-moore.com=
> wrote:
> >> On Fri, May 16, 2025 at 7:49=E2=80=AFPM Alexei Starovoitov
> >> <alexei.starovoitov@gmail.com> wrote:
> >>> On Fri, May 16, 2025 at 12:49=E2=80=AFPM Paul Moore <paul@paul-moore.=
com> wrote:
> >>>>
> >>>> I think we need some clarification on a few of these details, it wou=
ld
> >>>> be good if you could answer the questions below about the
> >>>> authorization aspects of your design?
> >>>>
> >>>> * Is the signature validation code in the BPF verifier *always* goin=
g
> >>>> to be enforced when a signature is passed in from userspace?  In oth=
er
> >>>> words, in your design is there going to be either a kernel build tim=
e
> >>>> or runtime configuration knob that could selectively enable (or
> >>>> disable) signature verification in the BPF verifier?
> >>>
> >>> If there is a signature in union bpf_attr and it's incorrect
> >>> the prog_load command will be rejected.
> >>> No point in adding a knob to control that.
> >>
> >> I agree that when a signature is provided and that signature check
> >> fails, the BPF load should be rejected.  I'm simply trying to
> >> understand how you envision your design handling all of the cases, not
> >> just this one, as well as what build and runtime options you expect
> >> for controlling various aspects of this behavior.
> >>
> >>>> * In the case where the signature validation code in the BPF verifie=
r
> >>>> is active, what happens when a signature is *not* passed in from
> >>>> userspace?  Will the BPF verifier allow the program load to take
> >>>> place?  Will the load operation be blocked?  Will the load operation
> >>>> be subject to a more granular policy, and if so, how do you plan to
> >>>> incorporate that policy decision into the BPF program load path?
> >>>
> >>> If there is no signature the existing loading semantics will remain i=
ntact.
> >>> We can discuss whether to add a sysctl or cgroup knob to disallow
> >>> loading when signature is not present ...
> >>
> >> As mentioned earlier this week, if the BPF verifier is performing the
> >> signature verification as KP described, we will need a LSM hook after
> >> the verifier to serve as an access control point.  Of course that
> >> doesn't preclude the addition of some type of sysctl/cgroup/whatever
> >> based access control, but the LSM hook would be needed regardless.
> >
> > No. New hook is not needed.
>
> It would be good for you to explain how the existing LSM hook is sufficie=
nt
> to authorize the loading of a BPF program using the signature validation
> state determined in the BPF verifier.

I already explained:
.. a job of trivial LSM:
if (prog_attr doesn't have signature &&
   (task =3D=3D .. || task is under certain cgroup || whatever))
  disallow.

If that's not obvious you have to wait for patches.
