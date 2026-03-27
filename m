Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FF83E715E
	for <llvm@lists.linux.dev>; Fri, 27 Mar 2026 11:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774609528; cv=pass; b=PVdwP1BD90peS9BBoLngo0E+WRad9PKdN+ER00lAAMmKo74Ft7+emNW+Necl0Ahig/CqDhgzuVk1jXjC4YLrJGp+E4K+tCyEHv+PdeoKDPAbh8tk2UGVPSw4yUeMrlw7V/f3j5yNOTKGFHxP15yO70sk9rF6PKT3nffpcEDaT4I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774609528; c=relaxed/simple;
	bh=h9siRtKXpLMyFHd/Yu512FTxbLNqK390CG0g8l6RsiA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ocSUB3NBGOEQ1Pkix/yAJ9w9FrlS/5f9dssNiT7FLvmt+idIetON6zrrcPi9ogvkMDB8qSY0jTgOT2enmQTb/qsnxSQY0Pd0/En8KtKv9rGRAbUeCReKilsSzjV+NUA49Gj3Wzx32QwzG1OJ0MES4oQyxCzYox22xnIFxnaA+Zw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ps66FS27; arc=pass smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ps66FS27"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-439b9b1900bso1164612f8f.1
        for <llvm@lists.linux.dev>; Fri, 27 Mar 2026 04:05:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774609512; cv=none;
        d=google.com; s=arc-20240605;
        b=NIROuUz3bZqkXCy+zyLkPvVbDG3WMugec816DtZ0EyrXSHY4m007nY/IFuX1e63vRE
         xkdHIrkkt45dMYZx3XOswsx9oMaks/XXeoJcq0XpilP+e8cdjEcd7kb+gqmbb5lN5fy4
         qU08n7PEllNIsJy/fVZmO5sxc1GIkN54EtBxKr0uHnkUud+CL7usmo4Nia5v1NCMpUL6
         iL+tCzOahEh9NCs8MnFRzHBOl4kJT8jPmwPEqkn7AvlMSS8RU03/aeRnLMwcdQaGJCnz
         PScHwnqZ6fjX11W25M39qGPJscMzCvDMxpfJ4X7GK608UPZ3YpaofSVPOFy/kjgqnPd0
         M6iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e5TaIiGMBg7uV6k3VlsV1iyi5Emois20mtQaHQh3Xm8=;
        fh=WOhvE3QVIphqZkNPeIigxfm7mOd+XwXUdCIGXEvdfzs=;
        b=fENW9eZd28NXfmOR1XBic0wMslK2C9fVgnUIVh/p5z1npCiNG29AnNFjKiNAqIq+YH
         gQ7P53oSGEw6n3321U4XBe32Xf5DKsflOBwmN3JTm57thZehv3P2X0PFb7atWSymMJoy
         UWrvmGdCA7htty+eDegJs3U71CsXIj8MTiu084iSBbRTPsleMWWw/Vi5c/oHET2KAcxW
         zMYG5rVyJ85esIp0x+ueGxzSc32uRxdOEW5bNK67EkpeTpXa/9/W8lnPJq1KSfrwKwX3
         oMtrBYnuxs3anR/6z5dGbULNTFikAd5a1GRZ57vIOCh3+gUtv//O1iqBdKH36zDlSZu4
         f5cw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774609512; x=1775214312; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e5TaIiGMBg7uV6k3VlsV1iyi5Emois20mtQaHQh3Xm8=;
        b=ps66FS27q9oGXmGP2uZsQHv2q6dRszXgUVwXHVc6252qCDUBqdHAyOERVvPpcLFGmn
         aNY+7+qPXVJziFaGs2w7gHdxUbH4q6f3pHmy/UfeScU6MB9H5oZN3nS4tMAo3zx1AAmU
         q//6v95C0nJZZkcM21jvPEpXkRGkaT2PkPmX1yuIrrwc8DA1Qrb0xMuLJWIwvipeqxQE
         xJlY8yAi2MxcXN8pZWdR9ZeE3fsCoPeTLHwIr9JPMnEUPHs1YvR3/KppSymsPYMmC2p5
         7U0/TF07pBaCIR+uM6zmiPuHnaze6lIg/wVBkMKrxAAMzIn05vp5kNRgHE3dTittS3Je
         t2LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774609512; x=1775214312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e5TaIiGMBg7uV6k3VlsV1iyi5Emois20mtQaHQh3Xm8=;
        b=Uwkp3CC0DdsWrgsk31L0WNdL11+d2nX5g2RYTlbY4c+VbAKj9Lja8qUgCk6SdeI7Zh
         6DyurTQt6tiivDafNzjy6qiXB0AkE0nhRwItOk7s3V6ngS63EYkitCb7Z02u6atNZgoe
         naL0tnoGJbNNh++Mfprk2PIUf3iWK9SpXtDjeYaUMqKNv0QYEeQ7uvUCWZFWh5Oi+cuX
         bncaGAElkmhEDuBLvA8S2x+NFzQOCc0CtG6lUpHMsme64VcScKs4JbsleYxKlgwNGqFv
         w/G4gCFcr5Imj32Jg0JchWAg+GlgiW2bwyZssysYSHzg/RX466b6Xk/mWsAtRuD1vw0U
         Ot1w==
X-Forwarded-Encrypted: i=1; AJvYcCU5J62cabU+UnzS8ZuEH3I5iBttPm+iX6LxI8sJeC5VZ7EcuEwLsHguvOU9h/DVuWa1cHFw@lists.linux.dev
X-Gm-Message-State: AOJu0YzssQmr4sfJsySMAfa/7MwHX8VTn2tboMoHzD7L/JDOPwSyLYrf
	ayfbknnVUj8oPY4LaWPY4wEYN332eOnWKNOy+V6x/RtEKXlrYxtxT3LU1M5EaPYqOvtFkRGxS/+
	9R/uM3e8VGNXAvX7mIpZ/zXcTFxAcE09occwe9zj8
X-Gm-Gg: ATEYQzyS75WyblSIxg9YyY14bH1lIFoaDxH8MMzAzrh4s2r3DGQn2ptIVBUIZcKncjt
	fVok9yRrK2cxYT1X2jwwMet5IiFt8hmLDcwgHoEncqbNYPdb5SZ+R3fnlwFLFZU5UHSshFB8dKM
	Ecj8tDMt2p5KHBIqJuRfRD9rQzT6KN1xHIoR6SN+VFjQUYqHs/rkG5zbp08DxLRER8k5aZilUco
	WEA2D4Eqw7s8ItNngodVH2o97Pr1HJQYn8SFC7oJAqqdeyx0jTeNoRMtIyWvuCBcdsevJX24dLv
	ct0l6abU4/+O0ivYtLUHHT1MGN0fnx+roeAjoyUoec3NRKTk5bK7B+mdW0qKIO05vcNwng==
X-Received: by 2002:a05:6000:144d:b0:43b:94d0:4d8 with SMTP id
 ffacd0b85a97d-43b9ea4af78mr3268991f8f.34.1774609511461; Fri, 27 Mar 2026
 04:05:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260325-kasan-rust-sw-tags-v1-0-7d3a765a72aa@google.com>
 <20260325-kasan-rust-sw-tags-v1-1-7d3a765a72aa@google.com>
 <DHBTCP3NHE62.3N96AD6O1L7CK@kernel.org> <acPLYM0HtGfW1Q6X@google.com>
 <DHBX4GM8TBIY.1BPXJPVQAQAKH@kernel.org> <DHBXOLR9OYWZ.22XQBZB3NROCF@garyguo.net>
In-Reply-To: <DHBXOLR9OYWZ.22XQBZB3NROCF@garyguo.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 27 Mar 2026 12:04:58 +0100
X-Gm-Features: AQROBzCcXzCaxciGj2rRaqYN4eotQgnG0hZ2O8Zhq9gJgC-_bbelUFgakozcZJE
Message-ID: <CAH5fLgj+pDm_VzNGWZ2Js9EVmH2xahP9V3bj9KXqnnARiVzHZg@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: kasan: do not pass -Zsanitizer-recover
To: Gary Guo <gary@garyguo.net>
Cc: Danilo Krummrich <dakr@kernel.org>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2026 at 3:30=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> On Wed Mar 25, 2026 at 2:04 PM GMT, Danilo Krummrich wrote:
> > On Wed Mar 25, 2026 at 12:47 PM CET, Alice Ryhl wrote:
> >> On Wed, Mar 25, 2026 at 12:06:50PM +0100, Danilo Krummrich wrote:
> >>> On Wed Mar 25, 2026 at 10:26 AM CET, Alice Ryhl wrote:
> >>> > We do not pass -fsanitize-recover to clang, so for consistency we s=
hould
> >>> > not pass -Zsanitizer-recover to rustc. Thus, remove these flags.
> >>>
> >>> Isn't this because clang forces it regardless? Is this true for rustc=
 as well?
> >>
> >> I forgot to mention this in commit, but I'm actually a bit confused
> >> about the situation here. If clang forces it somehow, how?
> >
> > I previously had a very brief look at the source code and came across t=
his [1],
> > where
> >
> >       static const SanitizerMask AlwaysRecoverable =3D SanitizerKind::K=
ernelAddress |
> >                                                      SanitizerKind::Ker=
nelHWAddress |
> >                                                      SanitizerKind::KCF=
I;
> >
> > But again, I only had a very brief look and it might well be that I got=
 this
> > wrong.
> >
> > [1] https://github.com/llvm/llvm-project/blob/main/clang/lib/Driver/San=
itizerArgs.cpp#L750
> >
> >> I don't think rustc does anything like that, but not sure. If it doesn=
't, but
> >> clang does, then maybe rustc should too? Depends on how that happens.
>
> It looks like there's no similar logic, and Rustc is passing recoverable
> settings based on the command line options:
>
> https://github.com/rust-lang/rust/blob/8a703520e80d87d4423c01f9d4fbc9e5f6=
533a02/compiler/rustc_codegen_llvm/src/back/write.rs#L644

Based on
https://lore.kernel.org/all/202603271853.RhfDTdOp-lkp@intel.com/
it seems like you all are right. There is a rustc/clang difference here.

Alice
