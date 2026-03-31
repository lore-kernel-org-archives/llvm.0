Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84D63FEB3B
	for <llvm@lists.linux.dev>; Tue, 31 Mar 2026 15:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774971798; cv=pass; b=H0ZcNHabG8HX7vw3uZqOX3qJKMDoGrv2Z//XjdGvybMbApUWcEJ+uqdIEFnXtu2di8llJmNGfanXqZN2VoC2qLtXE3HPIcOZmR2yltj0hh9GkQqabKEbY9Nj+uoCtx68RDHYSgFTD6+BVNdnMI6OZlRyjsp2kA6WI7yVH+M4whA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774971798; c=relaxed/simple;
	bh=7B9guYqc9Km4EfytW8PmhqDNaZArc5NLcTO6VZFjf+A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ij1Imp0jP040MkA42DMynM812dxdQbSfzgbCjqHpG8sKQclHi1QmbiE3rItnF5RXFro4TgTUulHDCIC/KhLliiCtzZq5NH93CiFxAWFJ9BxpOBNB3S04fnIYKONsEXGQ8F4VpNWto8RvtNHXzcFLSRJScH7Pg5a1qCY8qNjs/QE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dIvY159W; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dIvY159W"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-509062d829dso583681cf.1
        for <llvm@lists.linux.dev>; Tue, 31 Mar 2026 08:43:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774971796; cv=none;
        d=google.com; s=arc-20240605;
        b=IEdwd/vHAJfryrZ/VlcycpzO/XEyMyNl/lZtpKAj8psaZG2Uf+V/m5fqQkS76hvWE6
         njawkWZNEXaq5Tn8BtRGDexkCAj8YdvIqb8Znzf9LpYkcQILfmwRAtZALsIta4A4M9rS
         DgmVLd7ZrV160Pbhq7ZH88iSBMu2n+savdVyNlAEg84N3uMj0gYYl1RRw20TXdckoy6W
         AfXXMx4kVwK+a7TsWOxsCVI2JVSltNQJWEOcokJDpFive2qYyUDDrbfzCAorlOY5/0PV
         /cfT9+nfQrSB+tqnsOwR2+6KOPjNgI2g3XjlplreoMkqU9tEmQzJf5Ca/a/SX0TIwXbB
         CWZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W0esMwEn2vLErtLDITPF3oyt/KUc1Rilnuoy1Ok6WkA=;
        fh=mNr7JvoGwlSWBVE2lAgikCbB7W/mEGhT3uvnuplfoPk=;
        b=MRjycBrxKfx4m3wp212EN7Jzz7RjyN/29ikroBMRc8w4DEcFiumkd9fn/YOZ12Ih++
         Nj4rwTIhaKoRynW4U4t4NgRZ1hRKG8gvGk5y79Jd6p7K8RPPGBcgXYI+10xy/orPSbUH
         ALECAOMI0wPsypaw7OevLNGAPuvlaRnXndBVII0iqrQOAzf48juqX2LE027/H6wNn0wd
         3RWkcC0UWKvum+HDGYH5b6/pe7ok1oTYZQ/4n0EdXW8f0ckDZ3fb6qmlyRuh2akfIjy3
         TppMxxJUg1+GvmQewRKYqba+7OwPBKpiz+29MCdbmaOIp3yyLu6RODcsIqM05IZVHwLu
         7gZA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774971796; x=1775576596; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W0esMwEn2vLErtLDITPF3oyt/KUc1Rilnuoy1Ok6WkA=;
        b=dIvY159WwOirnVftcgA2x6U2jFQH03ZqT5ej6PRh3D2EG/VNWjL/Nf+wwmw4yWHY5U
         6rWw5pVBEsFVHlHb1yBlFqc2V/u+wHutE8sB2nBj3GqTNZV2kPeMkjoi+RBeoRCD0ozz
         IaTUQA6s0jzBtyLGlDGUg78KUuvPsbTTkTFKYftXV/BKLBKrd/Fo0eW7K559lOyNMb1v
         YJBtewEkkUvRZ071Oqiif+P2oovXYUNq4B4cYB6uCYHgvrqE/jCplSlwUpt6EBuEX8UE
         csUSOnZJ9aFjkyGWu0oh3s6xpzG7LN4jBBkYiYElNwwL2mwwgLPPGSBslLe/cpZj4f5f
         64nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774971796; x=1775576596;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W0esMwEn2vLErtLDITPF3oyt/KUc1Rilnuoy1Ok6WkA=;
        b=TezXGds9nN3fUAhrAHy8++OF5gtWJpmWOKLqOqs+saABOjBN443gP0iXSsFaUXhMvB
         c5OrWQGXpQEJM1m+xdIwYPDUrOxAxk0+BHti54OtDVO383Aao7Kdvw0jqK8dbrVcfkRD
         YraAkWqS3fmCQnL7vejXKd75vuWkaD7mQirIG5g1tyagDZjuoKKXe+rqm/MO2spNjAYp
         MwrpudOSgyD1errN3SMEuyqprJ37h28oxKsFFgWjzz1Hin0t3ptGfEkA8/4BrlyyVX5A
         KXQtzRO8pSTnxr3sBlpEHmbmTi5Ug8ILjZvEp0stCi6pyCrdP1VXZP/lyxcAbZCgNwUt
         T/YQ==
X-Forwarded-Encrypted: i=1; AJvYcCWREOvRFJhHLX/1fi6abTBsWTgoPw4EwRyIY07qFoGJUxqSbGKIVt4nqLKMwTCMheJzjD74@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7BuyVSFOLk0r7DQjw5zSsiw6bptRk81AibNQIe22PPAepiu+W
	PFft1d1EIkHGMp94cj4RUEB5KcKVPlUhuOao6yeni0Ct/SBg6x7/6v0bMUCIvKxjezJnTZyCd0S
	W4HY2zXGbImD/p/Io23Mwm4lRrn9hquDtlf9UarJR
X-Gm-Gg: ATEYQzy50a9vmOgm7hlgPFttqQQ4H0Epvnqp6voRYT+l8mkqwpS3IGFhCe3V5imBd5L
	nqmdqm5khrCv0tbPDX8OENDN5nGBUR/AUiAyr9RPhN6kCrteEBDeIRndtc/jopcIH2S2b7TCwFy
	Pw2IjcHeB0squwfILDCfVHkecRjTnczIORUZR9pF8gafalXXk6xqWitIr2lRs5zW0Xk/pA9Atri
	uMr+tGL/lX0IhTiMZNO2tnogU40HccjBktiQ3jNhHBj3FIt+nLoIP5uvmZWcmyRY+aFoL8lBQk+
	czN/w8MG2YX6oaPeQpSMDKT98aUpHvnh43VbuDOYicj+rA==
X-Received: by 2002:a05:622a:684f:10b0:509:15b6:f69f with SMTP id
 d75a77b69052e-50d3b726614mr608181cf.2.1774971795337; Tue, 31 Mar 2026
 08:43:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260330171920.2026779-4-xur@google.com> <202603311739.cjetLeNT-lkp@intel.com>
In-Reply-To: <202603311739.cjetLeNT-lkp@intel.com>
From: Rong Xu <xur@google.com>
Date: Tue, 31 Mar 2026 15:43:03 +0000
X-Gm-Features: AQROBzCj5K3gmeJvf_anMTGWwniMI1Tm2F9Rl48CsSn4OuK6msMlbCTz-rYMEjA
Message-ID: <CAF1bQ=RUUcs7ftHx+f-0DyPeCXBDa8pVt9cYaVPbxpkm8XkMEA@mail.gmail.com>
Subject: Re: [PATCH v8 3/3] kbuild: distributed build support for Clang ThinLTO
To: kernel test robot <lkp@intel.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Yonghong Song <yonghong.song@linux.dev>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Alice Ryhl <aliceryhl@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
	Rafael Aquini <aquini@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Stafford Horne <shorne@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Piotr Gorski <piotrgorski@cachyos.org>, Venkat Rao Bagalkote <venkat88@linux.ibm.com>, 
	Teresa Johnson <tejohnson@google.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry. The patch was wrong.
Let me send  the correct one.

-Rong

On Tue, Mar 31, 2026 at 3:10=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on dcc99abebfa1e9ca70f8af8695b6682ad7597bf2]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/xur-google-com/kbu=
ild-move-vmlinux-a-build-rule-to-scripts-Makefile-vmlinux_a/20260331-012908
> base:   dcc99abebfa1e9ca70f8af8695b6682ad7597bf2
> patch link:    https://lore.kernel.org/r/20260330171920.2026779-4-xur%40g=
oogle.com
> patch subject: [PATCH v8 3/3] kbuild: distributed build support for Clang=
 ThinLTO
> config: x86_64-kexec (attached as .config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0=
227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260331/202603311739.cjetLeNT-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603311739.cjetLeNT-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> Makefile:2254: *** extraneous 'endif'.  Stop.
> --
> >> Makefile:2254: *** extraneous 'endif'.  Stop.
> --
> >> Makefile:2254: *** extraneous 'endif'.  Stop.
> --
> >> Makefile:2254: *** extraneous 'endif'.  Stop.
>
>
> vim +/endif +2254 Makefile
>
> ^1da177e4c3f415 Linus Torvalds  2005-04-16  2251
> 46b7c49254f89d5 SZ Lin (=E6=9E=97=E4=B8=8A=E6=99=BA  2020-03-01  2252) en=
dif # config-build
> 2042b5486bd311d Masahiro Yamada 2019-08-11  2253  endif # mixed-build
> 688931a5ad4e55b Masahiro Yamada 2019-03-19 @2254  endif # need-sub-make
> ^1da177e4c3f415 Linus Torvalds  2005-04-16  2255
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
