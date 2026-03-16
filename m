Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882483D75DA
	for <llvm@lists.linux.dev>; Mon, 16 Mar 2026 18:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773685014; cv=pass; b=fd1Ud/gtjLK1JtzX8Dqfoh8ftPeeBzhANMqPJSPZW+pIBXFvGdC7SnbkoF7paPV3jbQWks8thUL+cGyblPvZTxyxAISiwdUhlx3IcuDsIaBC9uyqX8FK5syHJa7lotPBUSIj/ec6yepIGo6ATB089cEA3yXfvOURTu6BkMCqKAQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773685014; c=relaxed/simple;
	bh=FY4llxFucY58v3yOI/ISkoJCLoAr7NBi35OuhGaZt2E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kIe/1atqH0Pca4AyPc+ZkOvrZVwkV2XxZJoFmMynLmflHYefTc58nUgL6YwLPGbNvhU9/E3RI82578fiepQSfNAAX+/tfGBohuGTsjtNW+Wk1RA6mB2saBAX0FVnBpO9zYZZ48ym0iJOdVy11o2574y2gWscJ1qecxEvL9Zz79I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MzYK4QMH; arc=pass smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MzYK4QMH"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-50906a98ffeso83421cf.0
        for <llvm@lists.linux.dev>; Mon, 16 Mar 2026 11:16:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773685012; cv=none;
        d=google.com; s=arc-20240605;
        b=Qaw6F+Dh/DBBTFfQDFKz4vD9SzWwdP9235CR9xgQzvTbX15HNY+0xMYRzYr3GlClRo
         0/k4AKgSogkpLi9CJu/tlFxH0nUCTmTie0wm6sZvfi4odRDpy2oxIEY6nyGkgLCZv9Mx
         Oaq6sN7SoaPFrxJvLGuux0v9YoE/ViwrzwVdIhQJ40saB3Vf9ti/86258YQgMRfNJMT9
         n5MggOri/w9nU805UZ7kViEa2jg4WVuPJrVPzVtg3fBwnhX7IYsdKl8vzQ07rYsC0wi5
         nKNZsuPA8fel6R5IdMGuwraYUCh/MwxgVYRsOH9VE0Lk4ZvEYr1SkO1/CY9157KOlmFy
         kQgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FY4llxFucY58v3yOI/ISkoJCLoAr7NBi35OuhGaZt2E=;
        fh=RqII5rgg5fC2e+UvfkQto2xDhEllotQbHQD5Xt9rS7s=;
        b=CLw+pJBAdvOgUZOPTkOIvsg5b9QdogfiAebhZi+SMbA3I6pBBOm/KwN1BWlTciH9bu
         M8EyA704Z2C0oTo+ShjI7HP4FmRuNZTkiiRHWid7NzQfVbUPXWd8E4JVa56PBFo5YB1k
         u+851AUcPDtMo8opOkoDMRGaWJTMtFgWSK83CoH9O9j+QhCYzgL5mlyRVHcrqeJ/XRQP
         RBoQ8haCqV4kBMX81Totxu2xDZbzaerje4zI3HuGav3oUKYagoDngbu0dzGNX7xs+D0D
         BcjfDpf9LBm4ebhjWkzw8YTqAM+n1Jx05PrSdDydRB7JwMVwkijIFz61nR3vOZmVyohu
         i/Dg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773685012; x=1774289812; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FY4llxFucY58v3yOI/ISkoJCLoAr7NBi35OuhGaZt2E=;
        b=MzYK4QMHVB7jZsixF5Y0uiOQlLS5ZhyYX+jQtwTB+652z8U/F2o8cvbItGl8XrSlHS
         Bfb6UI4JuiqCzfalxUiIKGUvhShOXsPxRcRcvfkJHiebodUC5q25tpRfCoB2Yh8muH/w
         TfjtTWQrMyQPKSRb/Hfb9g9TfxfHQgvB8Pd7xgoQJyb7ciS3pRvCZPofgpXjj4LxOQ3w
         Ff079Z7eU49MekSC8GkE+ujGF2oI539rupYWPPBkylV7coYv+GcepRkKsZhnN8sHRZ0s
         RKoU3l/PXOGShQb0HZvpgluzOicvo5yKEeM3bqBmGu/NwyTlRpk4XcrcQyt77plh7LCl
         Jcow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773685012; x=1774289812;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FY4llxFucY58v3yOI/ISkoJCLoAr7NBi35OuhGaZt2E=;
        b=M+ZcICvkBXbMUhMxkYcjcVKUtBxVPcN5fnPniPQ5DbUDO/G7TIo1NU0+wbL22nJwx4
         98Gt46Ow/1RIRiYYNlnh9uQ0ItQLNGPChtVTCeAcE0I494ZVv5HJIq4/iO4LV0/k+j9x
         KKVXj6K8jQfpc14G3faTX6wP9InFicNYWQbXiPA61rUt4N4ZnVJcmd/Qsn9pgZeih9UN
         SN42mUxNUYbXVWIilXUL9dwFwg+YkUdrt9D2rNa6cdFS0uwArmND89XfqbdKRfYrSG/v
         egncLvAmUuEbTu49v72zueA1kmYSKf5Lt8sN07RvREVpxgiLXhpoE3a60yJ37whC+Ntg
         8KXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOWraO2GnXP3RXhsXpt1RrCluvwjfIxbqQk2rKz3Jwc50cZTe5CeZxYBvwVY9nVnzq4x63@lists.linux.dev
X-Gm-Message-State: AOJu0YwU5Z3resjapVyeoG/Csd6S7NGkaGUT2XA0gTmScXfTSJXejh1o
	kWPGxp9olmsRDehnaZG7Q93r5jk80cQ1rex1K2zOvMeeHTVZfAyumDZeHikZowazgCikmWZdM5q
	QuC3xI/jd9fY/7FosDpfMYUur18SVP1lOHlGmP4KW
X-Gm-Gg: ATEYQzzR6WjRsWrNQdkGT/HsMXFbGDYxur0vlpAh9H6FOYjQ+w+n45IH4JDbw1GFN8D
	0jlxWaeKnzP8t4n7vAkEEheMlQi7637RlGwSrlhFIKs856I7ATcy4Jy36sfb7kGyBo/51vYZxZl
	Mf5Sjtj6t3BDUtBcXRv4E0D0PfitvzUeD1JkLBq0d7TdKNb82G0Skx1nArRLdTPvhFIJpcu4bnV
	Zj7mKdbNWkW6kXalpqPby9b2a9EYw46Fqd1AaK8CXAD9gdKy/Ad618zEVq229Vrv20ucGCOSN5k
	t9KAx3Jl++W67ZLOIC3ng1t0sbXB+G4kubB6VQ==
X-Received: by 2002:ac8:574d:0:b0:509:21ff:cd49 with SMTP id
 d75a77b69052e-50998c16f4dmr1517421cf.4.1773685012044; Mon, 16 Mar 2026
 11:16:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251028182822.3210436-1-xur@google.com> <20251028182822.3210436-2-xur@google.com>
 <abgGnfO5ZrpOUza7@levanger> <CANiq72mCpc9=2TN_zC4NeDMpFQtPXAFvyiP+gRApg2vzspPWmw@mail.gmail.com>
 <CAF1bQ=RarMBKd2KhBje9de-ymjPf+tKUVpgPxspJPm0yTao2Mw@mail.gmail.com> <20260316175953.GA1910339@ax162>
In-Reply-To: <20260316175953.GA1910339@ax162>
From: Rong Xu <xur@google.com>
Date: Mon, 16 Mar 2026 11:16:41 -0700
X-Gm-Features: AaiRm5319l1Xo1I4EcZirAQ-qwKYh0OZwcLVufvbNKAfptzH7a9DlgHGnFfBuR8
Message-ID: <CAF1bQ=TqFwmm9NhBPnxaoTCqHOsm1Q6MLhNcqpYq4uObZxzk3A@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] kbuild: move vmlinux.a build rule to scripts/Makefile.vmlinux_a
To: Nathan Chancellor <nathan@kernel.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Nicolas Schier <nsc@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Alice Ryhl <aliceryhl@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
	Rafael Aquini <aquini@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Stafford Horne <shorne@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Piotr Gorski <piotrgorski@cachyos.org>, Teresa Johnson <tejohnson@google.com>, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

If that's the case, we can just remove flag "--thin". Can we verify if
that works?

-Rong

On Mon, Mar 16, 2026 at 11:00=E2=80=AFAM Nathan Chancellor <nathan@kernel.o=
rg> wrote:
>
> On Mon, Mar 16, 2026 at 05:27:01PM +0000, Rong Xu wrote:
> > I think the problem was $(AR) mPi and llvm-ar <=3D 14 do work correctly
> > in preserving the orders for "thin" archives without --thin.
> >
> > We can either
> > (1) Bump the LLVM version to 15 and remove the --thin flag, or
>
> The minimum supported version of LLVM for building the kernel was
> bumped to 15 in 6.18 with commit 20c098928356 ("kbuild: Bump minimum
> version of LLVM for building the kernel to 15.0.0"), so it seems like we
> can just do this?
>
> Cheers,
> Nathan
