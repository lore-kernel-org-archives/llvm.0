Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1551937DE9B
	for <llvm@lists.linux.dev>; Wed, 17 Jun 2026 21:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781732526; cv=pass; b=W6KMveGmvc3RZkJI1Q7F7yOS0+qcplqMZKitK2Lovhy9pZfr5+WKZJi2VPWSb0081u20GPSYWff9Rvs98GoszxbvgREfnxAJOaLpG/evXj5C0NiXsse2OlhqMlWfz0+y7tINRZTWsN8KEKxbqjflMUuFdiRMz66lmeA8dziwiE0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781732526; c=relaxed/simple;
	bh=Nva8p6KvPQaO0ANvk1Pn9Tn49nI/UIEJKZtTtEn3enI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VphwYpWp9dhfh8U2IbuttsF+Lmg0UXp0tEOM/+YN52X7iJ/+Wq3JDR4euAoeflZmbunNuy+3ZG9a/uGZmdZ+3n9Jq2/fQK0/Sz8nWE46ngdqEXd0weCB4oMR6qFd0vPQoEb8oD0Y1ydb9PqoLEx7eq9K8WHYV+3R/ydxuKFQ0Ug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RAQspdrr; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RAQspdrr"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-68cb445dd5cso1612a12.1
        for <llvm@lists.linux.dev>; Wed, 17 Jun 2026 14:42:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781732523; cv=none;
        d=google.com; s=arc-20260327;
        b=ZZt7L8FZfTbXyECnghoejrP6CePBxYzexBKmYynDOq64EqqOHvVREyao4aObPDthDN
         RSmoqfG2T5T7AOSUBXRJEqSNh3e8KP4EPn7teRhfPcaEJgm8jvmwFwMg6F/mUAeNgUEK
         WB6y9JIQ6JlGjn6lZ6J04UJLEJWl0pXPRvaShRiiT1FXfz5bR6x6h6L6A3itEvF5sMdf
         PQJbdwfN1wyXBw0wC82KLsbpcxqLIkFI/MOF8TEyD5QqA/uLZx2AhISLqgsnogtzKjCF
         CADHoqv2VdXRf3COvCRRW/vDPFCZ8p1wOpEzD0Y9xHMAd5fBve/83XV5n787lwLitFr9
         +fgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=H5Lv7prv5t7a2BiUhE/2Cub96h5n8YWnG/poPJebrKM=;
        fh=oUXjMD6Ana90NlgbnMVBGwwQNTea12E+9AqSbBVffVI=;
        b=Fl5KUF9xFXj1WEOixSCZ6A+jrqiQKV+WsN6RlNn9fOZfW0tui7YApKG5hwTZWvmzk2
         Wa23uleYbXBDmhhC2Bm5R/r6x6C2fnpGDOhTL082RW2y2K/fd4TuBb/Vge4x8fNJ22Dj
         a+OPga2kjYStg4CNiQtOU+1+Qy7FgOhf3SClPhY+KuImlJsQE94NaYLqvimBZG8n6K38
         Au9locQWMf87DMxFq77dh3pmYC+aJbmbnHUE1J1dGwmXORjaiavJXWG2Ph+cdpoLVPmR
         C9oIrUVmA1AkFT8uPrCSayX0UbjHIRhKBmUqUd91Wt+Fy20KfAT3Wcs94Am+fsuZvpEq
         ZcHQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781732523; x=1782337323; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=H5Lv7prv5t7a2BiUhE/2Cub96h5n8YWnG/poPJebrKM=;
        b=RAQspdrroN/n6hRwuCEW2B3dGEefP8ucgcM9iRP0IlXR2GGZTVcI+AbXyk1yOUCn8s
         KBuSqPKsp1fm11to6cz6Mag3IE1WGYIX7cLKa98Mwte4V4Rrdy2cSLe718LzcAibUMRJ
         w6zDciKHbTIAI69eME6i5sEZg9SqLrkVZadSnPq1bm95m0puKh9+ImiDo4HcPPtAF1eh
         VXZo4D02vjuXBrspbpQo2kYFzzLrQSv3DlWsPU2cUIOKXyquyd0FiMKB+9S2LQoGZng5
         wXU6/v6iEFDjbN0NEK2t/g8B5v2lfKNCKyimqM/asg2XiTjHtvgwpfhKKAtjSl1O6cj3
         npNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781732523; x=1782337323;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H5Lv7prv5t7a2BiUhE/2Cub96h5n8YWnG/poPJebrKM=;
        b=f2nT9byBzyA1LtNmWrKiauepQANXA2HCTzF1w0rO/qPVCBF0VlG9Mxpziq4vxA5vFO
         Zf3Rh86KaP0rWMyyCcAoHjgOm8u/GmlmZAN1M9QXD9morcVOvFsUotJNSAGsCryq53am
         euucqWfoKAegAFORL4LdPaEMdGfome2/NQRgArxCybzpzWog63XeXxBr++ZLXfB7JMfV
         8HgudZR3tQNcm6E97pIbSmJlfhG3ZEWzJAoWufNh9ZSXaqiK4ged7u5YXhK+3eXozMTc
         ExjkhHt0A/3FUZMoWFIJQRTzXz8sP3X9pq4kmYHuwFWP9rFLaxUjQedrVBLLIceA2ljI
         aFBA==
X-Forwarded-Encrypted: i=1; AFNElJ/lfjMp6avvLh89LKFB3NvSu0dQ5WC++ugl8sVop5BvywGiVe1geJoNcqHflmx4qupGHVAu@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+I3DKA21opAgq5Q0AsgD+Xda+MOKBshIspMukZeJKPwWYib2k
	GB/FqrjK9zpNn5TlW1wvz6DVXBekGdzUFMDFJkc8agg7xr8aEfoNMDAlzW0SOqWEEKg//Lkz3+H
	UZoW/Lbd9sMphmNMoueYKCFLL161cs6JtdVUFFaBM
X-Gm-Gg: AfdE7ckSPOZ6Li1nG/LhSQgydWOI/6YlVu6F3Pz3P8an9XRmRKh5cHvIZUbCVeR1oRu
	H8rGWyNSuUyL6Uz2GDpzqnUncet5zqZ1IggvTGIyY0689xOZRQgSmYnDBJe466cf+a/akaYyoVi
	KCOjP6BaIrgw++MG8kewbR5fuA9rhr1kEa/pjcx1FOdnfxYUQFFGaZ38knI4K8DZ/R1wVmHfNN1
	xbqrCDbDL5jWCUBfpGuyY9BcQpcn/uo3Q93IOF/ilKdkSlJbUboSyKoHGxu7AGlCSdbAW+RifBi
	bAsnTKuANW3PkfE8xyHKYVnC
X-Received: by 2002:aa7:d8c5:0:b0:68f:d45f:e494 with SMTP id
 4fb4d7f45d1cf-695d0b4463emr3912a12.11.1781732523187; Wed, 17 Jun 2026
 14:42:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260615222019.4116687-1-xur@google.com> <CAF1bQ=S3SLC4d6ODFfAFRMw_kLWq0wFqhCM9Uz_yEW3004b3wg@mail.gmail.com>
 <71a166bc-06c9-4a84-b61b-6b0d7c6c6585@suse.com> <20260617210410.GA3894029@ax162>
In-Reply-To: <20260617210410.GA3894029@ax162>
From: Rong Xu <xur@google.com>
Date: Wed, 17 Jun 2026 14:41:51 -0700
X-Gm-Features: AVVi8CdB7vBXndZXz_KrvDQi741rj-IVQ_RGwnZUEZdK5IFAcKX3ThnZG79UTm8
Message-ID: <CAF1bQ=SEXqObcmmZb4G2g+1pU=WfStho+_n8Mb6KiVWBR5ni7w@mail.gmail.com>
Subject: Re: [PATCH] modpost: Ignore Clang LTO suffixes in symbol matching
To: Nathan Chancellor <nathan@kernel.org>
Cc: Petr Pavlu <petr.pavlu@suse.com>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Siddharth Nayyar <sidnayyar@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Eric Dumazet <edumazet@google.com>, =?UTF-8?Q?Ren=C3=A9_Rebe?= <rene@exactco.de>, 
	Alexey Gladkov <legion@kernel.org>, Johan Hovold <johan@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Petr and Nathan, thanks for the review and suggestions.

I will send v2 shortly to implement the more targeted approach.

Best regards,

Rong

On Wed, Jun 17, 2026 at 2:04=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> On Wed, Jun 17, 2026 at 12:48:10PM +0200, Petr Pavlu wrote:
> > On 6/16/26 12:43 AM, Rong Xu wrote:
> > > A more direct fix for the warnings in
> > > https://lore.kernel.org/oe-kbuild-all/202606111233.kM8oo8Df-lkp@intel=
.com/
> > > looks like the following. But I believe the solution provided in the
> > > patch is more comprehensive.
> > >
> > > -Rong
> > >
> > > =3D=3D=3D=3D=3D=3D
> > > diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> > > index abbcd3fc1394..1f0a379b43c8 100644
> > > --- a/scripts/mod/modpost.c
> > > +++ b/scripts/mod/modpost.c
> > > @@ -967,7 +967,7 @@ static int secref_whitelist(const char *fromsec,
> > > const char *fromsym,
> > >         /* symbols in data sections that may refer to any init/exit s=
ections */
> > >         if (match(fromsec, PATTERNS(DATA_SECTIONS)) &&
> > >             match(tosec, PATTERNS(ALL_INIT_SECTIONS, ALL_EXIT_SECTION=
S)) &&
> > > -           match(fromsym, PATTERNS("*_ops", "*_console")))
> > > +           match(fromsym, PATTERNS("*_ops", "*_ops.llvm.*", "*_conso=
le")))
> > >                 return 0;
> > >
> > >         /* Check for pattern 3 */
> > >
> >
> > This variant makes more sense to me. The initially proposed patch
> > modifies the match() function, which is a generic function to check
> > whether a string matches any of the input patterns. The modpost utility
> > uses it to match both symbol and section names. Adding symbol-specific
> > knowledge to this function seems odd.
>
> Yeah, I had the feeling that it was a bit of a layering violation as
> well. I think I would prefer this targeted fix for now since I will take
> it as a fix for 7.2 in my planned second Kbuild pull request. We can
> revisit the more comprehensive fix if it is needed in the future (while
> seeing if we can address it outside of match() regardless).
>
> > I noticed that LLVM has recently made improvements to reduce the number
> > of these ThinLTO renames [1], which might be worth checking out.
> >
> > [1] https://github.com/llvm/llvm-project/commit/975dba28633d2f3746a8a37=
0741b17024b0f5f9b
>
> Indeed, we have started using that for regular ThinLTO when it is
> available as of commit dc3b90751d6f ("kbuild: Reduce the number of
> compiler-generated suffixes for clang thin-lto build"). Distributed
> ThinLTO support will follow when LLVM 23.1.0 is released.
>
> --
> Cheers,
> Nathan
