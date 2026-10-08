Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A11D4FD27D
	for <llvm@lists.linux.dev>; Thu,  8 Oct 2026 20:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791491361; cv=pass; b=BMf2tbsTDq02jys2QjRRzoB1HMScDbh4KHWpke75t/cEzn33+Lp9TZpIEZ02XFNIbkq550SUYwN4lTnab6ZvDQzUTzqEUQ1UWX7TcrLSJPppGBt5y3TovQLoCyILV5ko1UNbO04V5URHA97yiDGP9jZhO34JJfLowSRpCHIzFh0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791491361; c=relaxed/simple;
	bh=7axkb603a82UmmO6yoTtFA4rswXUCvwHcAJzJKwVvkc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hcUHzYQgd+J5oXMQGMkbxgLpnsQ5aRIHts9uYXw7qHcS0OH4JI1T+ml4VaBOf8b6Du2fgLk3UpPNhYHFsyZ8VvVU5migHlBt9tArumA5AIA+U8X3hxpPi/dB/phqPxjfYlfYKhvRmXi/OaOMUzTx3JIEml3YTem+fDoRLJn5fRk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Y2G9hv3n; arc=pass smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y2G9hv3n"
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-7c1916da745so1043802137.0
        for <llvm@lists.linux.dev>; Thu, 08 Oct 2026 13:29:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791491358; cv=none;
        d=google.com; s=arc-20260327;
        b=lQ/1wjzfXLD+lszfH5xsGIs9CpA2ke3sAiPkA+sj/riotlzlpV+185b+p5qvheE4io
         mflzbCS6gM6/h3wWs3v4noLOys5z6Cnl4UWPbhMoSluswrBCfMsN3ygKS2MdHdHs/5E2
         dkISNGg3+4pgNoMGEtqcwHuP72vP24VAgDVYrVFQkmBUcRwhA4piEAU8NRF25SHWShmg
         /ImznnOrD9Yr2RuahM9VunRS/cgSTOwhg5rEWTFZTgQCtQ9sh74emh/snzRASXP9EwdB
         gHqN9hHe1LtNE1TM80TEGqZgxPfdrYztgySGjEBetc7nZ7KU//wOMvB5WACutY1d95+q
         YEpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dEYO+uBmenzQsAKFWdFIK9tsQp7aIojLDDws7AJPz68=;
        fh=ZtFKz5E6mUg78YRNfqn7Gn+a0K5UikFxghsp5ogY7Dw=;
        b=k0buH50UEvwA3KwpL2DnilSlvaqd9AnqQyFTEquJF5ODOMgER0yPu5DuuW9eXfxj8H
         yEefZLhvzpd7QVqWF/Xaime5hnQAKdQ2RnIdyfRtHQk65GqF0XEUmgSWzlHrqCtSsMvJ
         gC45G0JC/m+rvOeeD6O12LqP38Q/T6YCfm4GulabL3+W4YiIPJFbQUlN+OFRCv0SiIJ/
         fM9P5LgZlWe4XQBSmWw/BviLocPZrI4WYmZn2fGlqv1eE2tMGMmeq2vjzPZKuexGK55Y
         NGWBWQMW+URdLKZfC+eprBxCSPtBLH/W7ouJGoPULTjcIs+QXTd/QeXM33aoHn9Y/hxY
         oppA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791491358; x=1792096158; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dEYO+uBmenzQsAKFWdFIK9tsQp7aIojLDDws7AJPz68=;
        b=Y2G9hv3nFb0dOxRz40TlBN5pzBTKrlYhbCfjl4zb+wuvyo94o8VkUATnlFcm3FLO+e
         qbGFiVgN5BvKafiihsnqIbuBHqVscRzEMOrewAPl3qj2l57kayKdIH0AA2qdFrDwNPj+
         uEAndKu2eQ8iHaB2OiLd+zS2Ym/sU6DwYRCEKGEC92CErCChaqnMcs5LWtodIU2ufMSI
         txr2K0FIVHL9V99N0C2BFaR0U3FwbYBRcp2bZTT4bv2I9DoGGmD0WtzinSyCGdgHRIbX
         TGfQXcvQgMtaj6sy92jNhEezOdibg5WR6iufHktSsbAw+FLJGTsm5eIP/gTSiQcKEGKL
         SIGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791491358; x=1792096158;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dEYO+uBmenzQsAKFWdFIK9tsQp7aIojLDDws7AJPz68=;
        b=Lru3xI0m/vMjEga5R5NwAC+1qeG0rm8KS/9jDZLWlkcG0RjJme54+RNlN7CDZSGKrx
         Ec8JO4/UBbx8Ir1l9IF2diWN2Y4xvvBU0tMywUFtNpOEy3OFNmnxmwP2zSJmO1am4Xql
         qrK9z/Zx7UHSYAPr3uK6bj9JNKenVMmzEzsIlmisBwfyhdJFkwUBlDu7BiPmHZ4iQ+j5
         0vWnO49XKL1bMOz7ajOAlsEBKTBDmQtdH75T4lsTsAhymbUYe5BuRvUJnbaCLGsW1RoO
         M5ONr1JpFIDrXUf3aOzQcE+CxWltqw2nBTRC5uE61rCySmjxAN8rud68ODxzVuHXMfoj
         dVtw==
X-Forwarded-Encrypted: i=1; AKwUvBxMOoU9zKmq0B1nDCIiuGy3PmLs1ppZrfdin1pAIJ3ThU6rFWhGDOFgs7d90xHOH3WOCJdU@lists.linux.dev
X-Gm-Message-State: AFq9FYIM+ipoqq5mBSla0nOvvqZw3dOQrhjLT7UWB3ThG1kvBi3Wx00p
	jzwo2T10Zb1v6I1GH92ujisl6tmjlLkz9XCjKCzO4TaRmObEsKMud4LBXs+1rzwsfHRsbFYMOa1
	05sU77x1pC3WD1zndewixbpAdFE4cD+RMPN/SLnA=
X-Gm-Gg: AYBFou3mdo2s616Ki4slGBMUk68g3+vYnGhDpGnS2F49R0KgGuOozFPRu1f7PDgYuSz
	E+xwyF7JkMcJqx1SSwUupEY5cxbqeX7PYDlX6d/53ljwKs+F7mbFOE8BbInWFhjxeC8QRKqVLmA
	iHysTD7eq+tIeCu5DQm5kkFEl0TiYZ3eW04+mCH1IVzKth36+CllCbdOY459P9VlWLmNkAvYv10
	tAE+z/zrPS1v55MXWZK15Ut0YDeMtBNfpS9Z9KPjnjBN7yBancK+jqBGHPFr5uGMnXOIkomPXqw
	6RfxXCeIkQH1s/OBENrFmqCPKbsiurEiRd6I20NnEuE7MM9u2reRCuuF1apkI0L3vxQNshtLQLB
	9rTgxS3kVDKsdlY00fTfN9bNwmSuuy8I=
X-Received: by 2002:a05:6102:22c2:b0:7ca:7226:b414 with SMTP id
 ada2fe7eead31-7cab8948919mr912611137.19.1791491357086; Thu, 08 Oct 2026
 13:29:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261005102518.2400984-1-morbo@google.com> <20261006094358.2948476-1-morbo@google.com>
 <202610060642.7C4125F@keescook> <20261007090915.GA1504630@ax162>
 <CAGG=3QXPAa-i4r3Vv6-q25A6EvsxGb5RDLn02z1=a5zo7W-7Vw@mail.gmail.com>
 <20261007093641.GA1527653@ax162> <bc2e2ae7-02e7-4148-8ad2-ab3c1af3dd7a@app.fastmail.com>
 <20261008161724.GA459@ax162> <eb644465-0c41-431c-85a3-f7eb6bd86cf3@app.fastmail.com>
In-Reply-To: <eb644465-0c41-431c-85a3-f7eb6bd86cf3@app.fastmail.com>
From: Bill Wendling <morbo@google.com>
Date: Thu, 8 Oct 2026 13:29:00 -0700
X-Gm-Features: AclHuK-6rPfWZEe_Z-sw2qrJwskK3Nn8JlizxagKQ-WxeGZ-k4tgZG1nsqTiy3s
Message-ID: <CAGG=3QUvZ8k1qjT8jjo1Rft0omyQYAcRUWExKvJw7CGD5B7XeQ@mail.gmail.com>
Subject: Re: [PATCH v4] compiler_types: Allow opting out of __counted_by and __counted_by_ptr
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Justin Stitt <justinstitt@google.com>, Mark Brown <broonie@kernel.org>, 
	Marco Elver <elver@google.com>, alan.maguire@oracle.com, namjain@linux.microsoft.com, 
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 8, 2026 at 9:41=E2=80=AFAM Ard Biesheuvel <ardb@kernel.org> wro=
te:
> On Thu, 8 Oct 2026, at 18:17, Nathan Chancellor wrote:
> > On Thu, Oct 08, 2026 at 04:50:44PM +0200, Ard Biesheuvel wrote:
> >> On Wed, 7 Oct 2026, at 11:36, Nathan Chancellor wrote:
> >> > On Wed, Oct 07, 2026 at 02:32:45AM -0700, Bill Wendling wrote:
> >> >> Ard,
> >> >>
> >> >> What's the reason why x86 doesn't need the KBUILD_CFLAGS flags? Is
> >> >> there something that breaks things?
> >> >
> >> > I think it is mostly historical. See Kees's series to address it:
> >> >
> >> >   https://lore.kernel.org/20261006204210.i.137-kees@kernel.org/
> >> >
> >>
> >> I've queued that up now in the EFI tree.
> >>
> >> Do we still need this patch then?
> >
> > I don't think so, since the efistub should now get
> > '-fexperimental-late-parse-attributes' from the main KBUILD_CFLAGS,
> > which is what prompted this patch in the first place:
> >
> >
> > https://lore.kernel.org/CAGG=3D3QWCmQ+LVvn2dtjEauj5WFwvx=3Dpvg4Q6man_A2=
imdjRe7A@mail.gmail.com/
> >
> > As I mentioned up thread and to Kees in person, we should still conside=
r
> > adding '-fexperimental-late-parse-attributes' into CC_FLAGS_DIALECT to
> > cover other areas that may see __counted_by_ptr use but it is probably
> > not as high priority.
> >
>
> Excellent.

What Nathan said about needing this patch. Once Kees's stuff is
integrated, all should be well and never break again. (very J/K) :-D

-bw
