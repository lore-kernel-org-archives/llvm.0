Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34CEE3803E9
	for <llvm@lists.linux.dev>; Tue,  2 Jun 2026 16:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780419103; cv=pass; b=KdKmd328PE9JZpqY+lYz+cDKzBQKfNTkENOs3vXHtw47ohq2byu6ESF6MQebR2Xg44vG3ZLViQI4utUGa3FI28hZAdZjlO1IuPzaRNyfdFUzZ7Eyc8Nh5jemCHQxVhLqddZR/Bq9x/oLrC3hdLCC8SxbTo9CGyI5Z3eqM7iaizE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780419103; c=relaxed/simple;
	bh=HNPBgKw5YVMpk9odXIMiTm6obkXACvlE1PDWRPIpSP8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=aFzgxflxyhv2vDRwI5Wt21xWmzul2gfl9RNcdibGHMegAITX6xuYbbPHtT3475oQ0WeM92xufK6uMTAaDf3r3okbHGgbHzvY2xb85LMcg0PgtTtQBvy+hPELrsk3FHq0+odKmc6LoIGJedd7cR4kYr06mlKf/v4aMBZRLOx1omY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NP7n1otz; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NP7n1otz"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-68bd7ec2371so28a12.1
        for <llvm@lists.linux.dev>; Tue, 02 Jun 2026 09:51:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780419101; cv=none;
        d=google.com; s=arc-20240605;
        b=AiAjvCAoBXgPcDlro5cowsbwo9I2E8O1EakccRpgrPddE9cMCAI64TBRg2PlQe04K1
         tW61qgHkwBA+jjm2EfuGCxcJHuGNlg0JTxWEN15Nh1WTPuEjRf6UKISOtHg6EXetqU4Z
         1n17Bz9qfo6nFXUyUxctkIuD0HodY/EUASPX1cFbLU8NnrIIQZHY2UVSO9y5k4zuiOvr
         4TFV9cchltXVCDC9oCGVruhVN+mdXsbA/DIp3OFHr6VQZU8Eo2pMuEDWqnPmXgr2prvl
         dL2NTh2Vdot7cuP1OOw3wufUijLMcejEkmsuwF9sopvQQXntuu3p6V3Jz1HLobIR7RyI
         mTKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t1W2WHXzXyTxWh2ygyWWGHezvuq5VRVO/z3z5aIeeeQ=;
        fh=WJ9SW7xPhv5GEe/0Gp71KVuA7yPS9duXDuha30NfIDQ=;
        b=ESUYgWEYtAEvq8il4VFhaiH5+u9AeKv/x7N4d6nDX5XyqM1tg2q7m3zSj6wu8w+uNN
         xS4aSTY+apQ40UU50GnaBKS/woapBeLD4BNozYeZ7cdczgbReojHUjysEU9IwWAkfEXV
         3uA4L4zHg9qCIbNwOvCmpHZTmbxI+GxjnsaPfGBHj3Lpdn74PJifknLXWh4Da18dTmtP
         mMuMqwmZDciocajhqpCV2oWiGfsyYWWEnzy7W4BuIfu3YQLfp/fYIMz7kNTMzv3s0WBT
         /ubZ0Tq1SyPkjpkXpDwcIujOt3YuRCDrW2Fs97tSfHOq1ECrgQW2dRZBgkge+6MA9vL0
         s8GA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780419101; x=1781023901; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t1W2WHXzXyTxWh2ygyWWGHezvuq5VRVO/z3z5aIeeeQ=;
        b=NP7n1otz3jaZMM3rgrL3ZgS8dsk4MiVo9fn/Q4Rib+PHvEi1oj1pO8CzP3NYHngyUf
         LZ3OcWD6lrIYuKW/JAlvTmHoIkoHWw0a5w4F+Zo3a14a6QOHbN7YB4aT0ZG2bnvmQsQT
         tVZji6bcatQcJFOfwgpq3vpSotbeUm2nu0+AGt6xxkGvcHu52nZ7eExJeInYyC2TdHjn
         DgwhbU1ITYvKRmwCb6iFiw8aQCHsGkiG+v7sT/PztW6HqUJyRl0VB7UgeDPLT7t7Oxnf
         CC7NEG7dQAcC3qe/fyl0Weco4acWUlnHpJtapAYLjpb5tahLllQqrUPu9DmxbylceSmt
         rWOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780419101; x=1781023901;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t1W2WHXzXyTxWh2ygyWWGHezvuq5VRVO/z3z5aIeeeQ=;
        b=lWIQtCHxQntreFL/9pXUkhe7Rqtmr23BybBloU8VfsfGlCRI+9qVtqwgIDacmzVDeI
         JBgDE2FF6PJ7ksYZxWj4n877i1x6zpcU+5I7irll9qtTcCJ222yN6aWvtN9dZtUZzDSQ
         5tdncZpjENG8toba2Db/oyOgD9bsF0GK4KHX7ablo7JNvZutFhHwU04Fa69TvL+FZxqX
         LWC6wpVq5yWNyc3Sv7T54zSeHHTorxonPlo1/4Dqx2Y7AtoYr66QEYOtDxU50uYsU25c
         aIfeVhqUegdIb4IFnPW4H68MMG3OIVISqFGSeGH5vhPXeFyvaVVXZh4fDiTdSfP07S9+
         VdmQ==
X-Forwarded-Encrypted: i=1; AFNElJ9hWHRpY7Zw25jpTg0YtBXroCv6cYhIX7zMcEi2cBiMkMhP/HPSNUU0bcUUl41YtV6x0PJr@lists.linux.dev
X-Gm-Message-State: AOJu0YyWyrl49vqN0NNBSrwLk3qY29qqYPcMLPWkt9plxSQVAgrgaC39
	8hmTi6+KFeSQluI2/FO4VzrZoR5H0s/ClVdaTcIZIyaW7rbaVcze9mFZ6RGsxfwWFdAL6eKA6Wh
	B1yDFxp4lq5C0rg6ndsp/G2cDnEmviLulEfn2aAwg
X-Gm-Gg: Acq92OELetqC85ibg46QePIBT3DcA5KIeWljA8ZroJuSlFpy7z4cT2CF1fYxt1emYbA
	JwIsv14qpSIqQXMJYW7YSwE0xdHaRkYDGNDPW+/rcD88ynqnp1+A7Z2AVU+S5KRWFZbwxQpIYbr
	TjU2fzUMql07h2BhzNPNLmFtkUFZsjV9iDXtiYfYMa3uXju8EBltcQedW2V6thfmynpAIPg6zmA
	OE5ZT4preB/hK1Ob+Ghs8d8eEyPGtK4YRhhjBPvILbV26NFfqUI+In/NTx9CihJuJc7KI0ummvu
	ZoZ/PIhc7010N155MEP55KB5d06ER72IMFgbaaIp6Cn8/3yg
X-Received: by 2002:a05:6402:21cc:b0:671:fff6:f82c with SMTP id
 4fb4d7f45d1cf-68de2cae1e0mr153594a12.2.1780419099976; Tue, 02 Jun 2026
 09:51:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260529185347.2418373-1-xur@google.com> <20260529185347.2418373-3-xur@google.com>
 <ah6DleoCYipTwcO_@levanger>
In-Reply-To: <ah6DleoCYipTwcO_@levanger>
From: Rong Xu <xur@google.com>
Date: Tue, 2 Jun 2026 09:51:27 -0700
X-Gm-Features: AVHnY4KWNrtfZLBePBwjMl9n69nIbQyBupMH9nSIAiZnSkTtznVpBFkWF7l1BcM
Message-ID: <CAF1bQ=Q+KN+p8RmmVDF3bP=11EWj=8fOPBg7wa7QQRW1XWF4iw@mail.gmail.com>
Subject: Re: [PATCH v12 2/3] kbuild: change --thin back to 'T' in $(AR)
To: xur@google.com, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Yonghong Song <yonghong.song@linux.dev>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Alice Ryhl <aliceryhl@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
	Rafael Aquini <aquini@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Stafford Horne <shorne@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Piotr Gorski <piotrgorski@cachyos.org>, Venkat Rao Bagalkote <venkat88@linux.ibm.com>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Teresa Johnson <tejohnson@google.com>, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Nicolas for the review!

It looks like Nathan already merged the patch series and squashed this
specific patch into the previous one, which
removed the commit message and that comment. These changes actually
incorporate your review feedback.

Cheers,

-Rong

On Tue, Jun 2, 2026 at 1:46=E2=80=AFAM Nicolas Schier <nsc@kernel.org> wrot=
e:
>
> On Fri, May 29, 2026 at 11:53:45AM -0700, xur@google.com wrote:
> > From: Rong Xu <xur@google.com>
> >
> > The '-T' flag in $(AR) is no longer problematic since the minimum
> > requirement for LLVM has been updated to version 15. As of LLVM 14
> > and onward, the '-T' flag functions identically to the '--thin' flag.
>
> For correctness: it's called "'T' modifier"  (instead of "'-T' flag").
>
> >
> > Fixed the issue seen on IBM Power11 System:
> >   ar: unrecognized option '--thin'
> >
> > Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> > Closes: https://lore.kernel.org/linux-next/476507c9-a371-4864-9e87-572c=
1ecae82d@linux.ibm.com/
> > Signed-off-by: Rong Xu <xur@google.com>
> > ---
> >  scripts/Makefile.vmlinux_a | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/scripts/Makefile.vmlinux_a b/scripts/Makefile.vmlinux_a
> > index 9774f02b43b2..650d44330d1f 100644
> > --- a/scripts/Makefile.vmlinux_a
> > +++ b/scripts/Makefile.vmlinux_a
> > @@ -10,12 +10,12 @@ include $(srctree)/scripts/Makefile.lib
> >  # Link of built-in-fixup.a
> >  # --------------------------------------------------------------------=
-------
> >
> > -# '$(AR) mPi' needs --thin to workaround the bug of llvm-ar <=3D 14
> > +# '$(AR) mPi' needs 'T' to workaround the bug of llvm-ar <=3D 14
>
> This comment should be removed.
>
> >  quiet_cmd_ar_builtin_fixup =3D AR      $@
> >        cmd_ar_builtin_fixup =3D \
> >       rm -f $@; \
> > -     $(AR) cDPrS --thin $@ $(KBUILD_VMLINUX_OBJS); \
> > -     $(AR) mPi --thin $$($(AR) t $@ | sed -n 1p) $@ $$($(AR) t $@ | gr=
ep -F -f $(srctree)/scripts/head-object-list.txt)
> > +     $(AR) cDPrST $@ $(KBUILD_VMLINUX_OBJS); \
> > +     $(AR) mPiT $$($(AR) t $@ | sed -n 1p) $@ $$($(AR) t $@ | grep -F =
-f $(srctree)/scripts/head-object-list.txt)
> >
> >  targets +=3D built-in-fixup.a
> >  built-in-fixup.a: $(KBUILD_VMLINUX_OBJS) scripts/head-object-list.txt =
FORCE
> > --
> > 2.54.0.823.g6e5bcc1fc9-goog
> >
>
> Thanks!
>
> Reviewed-by: Nicolas Schier <nsc@kernel.org>
