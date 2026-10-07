Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A983747276D
	for <llvm@lists.linux.dev>; Wed,  7 Oct 2026 09:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791365600; cv=pass; b=rkMuhPkjmrr63hql3f4T1gINpwIae2cpoGJhofr3qIj2bYZpD/AUI3VpybJty2xWPNwixCsGW+OmzmoGNfS/om4PYQE9YsoFaXuimZkW7nS4vOzuJ/jJQfT0CUWQiFwpYU2Mq/Jx1QACMOSZGIFXetRi+kqudQVdIEqhhD7gVAQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791365600; c=relaxed/simple;
	bh=gChNhpPmIRzVuVd4Nx3kZHJx+TICbXpHZEw4CFKr3e8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gre2aud4KPJll6oL6ujEYh0AODjJY2JhQcYUd1QaYN02OeTE9ClL/vZOgWHeAsare6mgeri/4tGVxKmJiDhxzfWsuwfpWirx4n9sDuLQgVjeKVphs5IBIzXos28tBd33g06svc/kxKoOKy8JhG0Bo+E+LVzQrirc5SpzDMOE3sA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tbYgOI5I; arc=pass smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tbYgOI5I"
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-74ab99038afso960197137.3
        for <llvm@lists.linux.dev>; Wed, 07 Oct 2026 02:33:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791365582; cv=none;
        d=google.com; s=arc-20260327;
        b=s6TCdY+uZQQZUfzSFQ5rsOvhi7mOZ+ZZ16r3NI6P0Yt95mmM9XKyTU68Oj0auiE4pk
         pvmYaNoAE1+F1lFN5VqT15N3XGcCkVQUFKmneS9ZLzshTpDYWcsSZ4SxKcQ8WaMfdkO3
         0B7XljbT5T4V6Xx7/qg4n9eA8KVMNiRdG6BETaFbN5WOfc7DnjGvWx436H2YcDnOexaE
         8xuYr3m+r+x90yZFnimiqCGejVc0qS8WR8feMSRUr7GHtwel3eUAHU2/6HIuthVB7xR6
         ufW6wS2EtfF4lyPhRcKOjlKLgbcuM5779bX+eGpkZ/7WQZE7oRBHID0EOBASi+w6e9Wr
         zHCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gChNhpPmIRzVuVd4Nx3kZHJx+TICbXpHZEw4CFKr3e8=;
        fh=6oZuCnllra2YIbizp2PQpoOhip10lSIKm60qwBW13e4=;
        b=Xs4oyi8F6Q5/kZIqV+OvDLtb89Aj8R/aiLdmdtvA0pEHzgx+Uhw5pIYjSu5M7wuoYT
         sufNatCdkCPwTv2joZP0Il0cNkoEe65Sle09oEKzbRcQzPkIb3y5STI36SJM+qnUTXxD
         FhpBcxh6tTcBDqaIJMCZThCV2Qwozw1eNqGvJ13suFDXD3BreZGcziG6uhYppBc8vUrr
         RtbhzuOtXqP9kQOa3xalBdbdlt8CLuKzts7eccRHdNbWoa0O1oe+mjBHyN0kznJ9VUbM
         s0vDHbVr+Mi++n2hb4Gakn28V8EE4rF7MtW88UhqAFQZngHtTXiAdPUjkjvKApr5nV1e
         JrzQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791365582; x=1791970382; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gChNhpPmIRzVuVd4Nx3kZHJx+TICbXpHZEw4CFKr3e8=;
        b=tbYgOI5IBBA3iiG/TW0LQXEhqRYg7zBHrZjnPwXQrtyWdUSle7dgzejqsrhZb+5UND
         vutCI32BL7SrOEXxvfxQsigk4p/1iBKTcxbUVExdDHA7b44iHSIpgEdLB/sTldnviyBp
         6nNdPGcZeO021Cg19nnEsKp/e16O9//INEGefptAvj66aUE/GtXuAMSrUWBKiBdyngYM
         Ou7P71XD41RTDMn1DlzFn8cm1+7MLh02DoNzKZh5QkcX2imz6KiJ1vSzEFoigF21nEeb
         je6MawzjZ6mO6bIUnN2U1IaDzSK9MKIQw88kU9ZePoUz419gPynnPTsRImvGE2WKCxdh
         Zaog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791365582; x=1791970382;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gChNhpPmIRzVuVd4Nx3kZHJx+TICbXpHZEw4CFKr3e8=;
        b=TPn/qyqxt0iMZBq3m7q1Cjs9gPiikrzSZC5P3R8r+IcaHkjQBki6Rh9FgOc/Fu+geu
         AcBo8k6H9G37dmO/2wVP+YVW626A6sv/YqaVgRiHdtr5eA9ouQVvyelVIBGuld7SAPSp
         tJ24RUZsf6bzMbCiMdRO5dZiDdsVNOqqdOGIObnzsajN3tDiO1TM4datfM8j4JxRu5tv
         CCmQjJmfJqcymXZZCSEhVZxAxs+RsviF3OnvGVxahHpz/XVDw/410xnNiBWEFBfCxGSB
         nrKqOL/gTJEtKy5jCZwezE+/9bnsXiZwsAyj1ow5HfcLztm8XLxIBwPOVpWMIACidQFL
         UbqQ==
X-Forwarded-Encrypted: i=1; AKwUvByhlxV9wSdSXwoANivwEA2wIe4L/ytR8qfVuTu20bW1wgTTSVXm/BgGPYND7fCDyG28qh9A@lists.linux.dev
X-Gm-Message-State: AFq9FYIXfJpfmw9oeeauTHle6r4+NqtP0c6HE2D++S5Xwjel+2ELCcxZ
	fe+fN40ih5uK0NiGtaDbGA5+7d82cf17kYjxrqxBbdaDOK5EUmIPWxIlKVaDXCLGfKdbkbOOzHe
	xrtjVzJm0jL1XD5lGYZ4TiBgpTMY7PCGqsZtFlG0=
X-Gm-Gg: AYBFou34XGIAwj1//5L7aBEtcadsI3NOFmtME18ZYwtDbbRa7KvJEnplwFnxRs6wUaP
	sC40iDRQqEUiLCf3Pu95YDmhG21s1LqIz49DWKU684BeK8piyMjorfBkS3sCSSJqhN31n861tyi
	kLqSlLSh3WM7ItSRIGuHyaFfHP26EWp3keSMFIWDzmZDKUgMp8FdUOWGpXiohnFcpAooGOgQx+u
	UyFEC31+klbnmeyVhB2juuoH3XDt3KMrKOWzbHHgFyzvChJfMuf8kO2t+DqwvshYo8ta2NtCSV7
	RdwOfr0+sKkOgJf7hFlHsTHzqvIAjUqzzH4YUB+5w+nEGoqJTEhOWERMaMJrnnWyn0V4KxcSc5I
	e3YaL6ImQzF0bNq95sHHV
X-Received: by 2002:a05:6102:808e:b0:7a1:88cc:6787 with SMTP id
 ada2fe7eead31-7ca38912387mr457577137.12.1791365581501; Wed, 07 Oct 2026
 02:33:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261005102518.2400984-1-morbo@google.com> <20261006094358.2948476-1-morbo@google.com>
 <202610060642.7C4125F@keescook> <20261007090915.GA1504630@ax162>
In-Reply-To: <20261007090915.GA1504630@ax162>
From: Bill Wendling <morbo@google.com>
Date: Wed, 7 Oct 2026 02:32:45 -0700
X-Gm-Features: AclHuK_Xc-2s-IDXfEqf9QTUl62NLNcyE0G5JoWqRVUXRHBcaDN1yyh_K1ccOqQ
Message-ID: <CAGG=3QXPAa-i4r3Vv6-q25A6EvsxGb5RDLn02z1=a5zo7W-7Vw@mail.gmail.com>
Subject: Re: [PATCH v4] compiler_types: Allow opting out of __counted_by and __counted_by_ptr
To: Nathan Chancellor <nathan@kernel.org>
Cc: Kees Cook <kees@kernel.org>, ardb@kernel.org, gustavoars@kernel.org, 
	ndesaulniers@google.com, justinstitt@google.com, broonie@kernel.org, 
	elver@google.com, alan.maguire@oracle.com, namjain@linux.microsoft.com, 
	peterz@infradead.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 7, 2026 at 2:09=E2=80=AFAM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> On Tue, Oct 06, 2026 at 07:12:07AM -0700, Kees Cook wrote:
> > And other architectures solve this problem by not wiping KBUILD_CFLAGS =
in
> > the first place. :P So if we want to continue to accept the x86 excepti=
on
> > (which I would argue is the actual problem), we likely need to, instead=
,
> > construct an explicit export that is used to collect parsing control
> > options so that it can be re-included here. Today, I can think of
> > -fms-extensions besides -fexperimental-late-parse-attributes.
> >
> > KBUILD_PARSE_CFLAGS +=3D -fms-extensions
> > ...
> > KBUILD_PARSE_CFLAGS +=3D -fexperimental-late-parse-attributes
> > ...
> > export KBUILD_PARSE_CFLAGS
> > KBUILD_CFLAGS +=3D $(KBUILD_PARSE_CFLAGS)
> > ...
> >
> > We already do something like this for CLANG_FLAGS, which, given
> > -fexperimental-late-parse-attributes being Clang-specific, perhaps we
> > ignore my -fms-extensions future-proofing, and just add it there, but
> > it doesn't look like that is how scripts/Makefile.clang was intended to
> > be used.
>
> I agree that fixing the x86 efistub to mirror other architectures is the
> right fix for this particular instance of the problem (as you note this
> is not the first time this has bitten us). However, we may want to
> consider adding '-fexperimental-late-parse-attributes' to
> CC_FLAGS_DIALECT as well so that the many other places in the kernel
> that blow away KBUILD_CFLAGS won't have similar problems if
> __counted_by_ptr happens to be used there, as this type of solution
> might not always be possible. We could rename it to CC_FLAGS_PARSE or
> something like that but I am not sure it is strictly necessary.
>
Ard,

What's the reason why x86 doesn't need the KBUILD_CFLAGS flags? Is
there something that breaks things?

-bw
