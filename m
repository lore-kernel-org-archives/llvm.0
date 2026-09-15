Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C5F4BB5BD
	for <llvm@lists.linux.dev>; Tue, 15 Sep 2026 17:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789494471; cv=pass; b=QjGJ+3pfK/QJNKHp4mE86jgFGPc/xTq5DBWEUlgtO5E+kwF25NT3O7ODsCXS5Qrm0hdDGPQ9JtrlWGCcd6EulaoeiSWPGBLJ/63lwMwkKhevkEkpW43S65cwRS3HkW56UjkE4CeOuRmIDGz+xv/c5rm94+cBwgxIq0tRr2qHtE8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789494471; c=relaxed/simple;
	bh=u6Gw0oEc8G0Na/fDm4B5c157a2l4J+0QxPZsDNbgEew=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tPg0kU9J7/1n9C52HOlQeAt7+X+D8yQzeg6EtdezMq2VmqVYyFJErHhfS+l9g6LVzfNGqwCx0HPSzMfQjPveiFOrtluWJN3vy0YYKptrkXOJCH1RGVxoe3dURB9eBLgGw7HGWpdqzXrElgkjCqy6Yjl7KtKo+tRZXWFC+hZHDa4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=t+enXsU7; arc=pass smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="t+enXsU7"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49e73611928so5606105e9.1
        for <llvm@lists.linux.dev>; Tue, 15 Sep 2026 10:47:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789494466; cv=none;
        d=google.com; s=arc-20260327;
        b=pQ1EYLnTB2gZiwViapl8WAfrXZF/L0R/l7CXW/iy8uugJ77jLzihkmTleotGyFnHtX
         TS2lUlLrld9KdNdL+nbUbMeHeT4X1DljpbNSNDpk6IiMvsU56Wh3yHrEtH4wTMb9K6xH
         tEo2I6mQSfqD0BUjLAMFdxAIoMujifMBPw6KaLVU8BmSl1xaPKcPOidKNbYrP6w8lMSC
         9BTjBVhMyAT6g1Vca3NcKGczQC0M5d3NGBLGGdRuRvBozcJKS351be8XYZr+9lhCOvE/
         r1ZYDqV/mCNh8TO/ZYs7bMZTUz3qpYe3T88zr0Wd+dCDmuAWU1+INyDfmufFWrN0nhHO
         ZLdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u6Gw0oEc8G0Na/fDm4B5c157a2l4J+0QxPZsDNbgEew=;
        fh=e1ANB3FzvmNT7pXTjYlMYJLWii3z+dJr0nk8z2m8kwc=;
        b=hqG5BzPe2uvL3sVpAD2xee3LZamx2XdTzvgBppN2TKnslL/0bEipmT9j4BQg6FoTAb
         RP45mnCy9dZSwJzMHFyjAYSEXVcnUk4mZ8SIGv50LCieqGEtb08gTXN77svetou3YMx6
         aY5e8DC98VieAp5yi+kzoXGmYbUCPiI7c7nHvpbhQIgvmWUgM1CYYQK7AXNykmpXVbqD
         Xq3E/4chc45bq+jwBvkw9rNYjIaOlBBKT/9s5HM50EJgHVPDFvgwAqSBjz4ePGGEKWSK
         wzh/jQK6GTZVCfxe336QuA9pCbeY5AnzGcZyhEljhBz/yImOSIWc7/yqvESJvXdZkyDD
         ig/g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789494466; x=1790099266; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u6Gw0oEc8G0Na/fDm4B5c157a2l4J+0QxPZsDNbgEew=;
        b=t+enXsU7yTclgP1A/CeYK4vVJO7Rc91qJXnEMz1LnuEvATv0lAQWyOjMhQ9mEeQw4E
         AbrPYUez+PrvR9jno9Zy8LOw0mghZMSCYLVM/YUfBcoO+TqkwMJbJmvGB7lUFM43LVeJ
         9ufpqM8yhrwUSX4k+9zdvXzWgEjuyV8x8f7OeWeDD3FAl6HIMlkEmA9Yb/7C90U8MRdV
         VbcJ2fjUcuJ3pwxODRWxpP65t9d2L64BiiVCIlHBT2cGUB79lVjotr2WIGczEdHD709E
         Lnf0G41JKMyil/Vxvsh3YQYxdRtwaqEpbtDIzpKir4D6lJnDGoiO3ZAlSIOUTI3zRV2q
         ViEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789494466; x=1790099266;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u6Gw0oEc8G0Na/fDm4B5c157a2l4J+0QxPZsDNbgEew=;
        b=RUcpXYJ9jGS1uB8cb930P9kXsbfoS49IQ6N7cf6I8bWqeGjglGnPYX4EdI18gvgTgP
         BhqNqb/IG0jik08p+4LEVnRYCQ8f3h61W4kbbNuirzQkWR2ogjTyZYZdyhFFXHDqv8XZ
         AXkB0z2XVxhoL16JdPXRGh1Z8P0uOvoKz7u0yapTxkVHw1Z2Zhwa2CTGNnwt7wgDAnLa
         Nmxpqnmq4fJkgjpJFBsjvjVmJtiOTRIlihXcKEH1rL9o5HpHx2mMAQ8xSKDs4WErcxe1
         ETkfcvRBIOlo9c4c9j7lqf+qPAgEt1Og0YVd9GdD8xQZnoMgg229efGbbBsTE5+AgUWz
         iksw==
X-Forwarded-Encrypted: i=1; AKwUvByyigENAXSeaAlPAqtq1rpJU6g8nt0HDxSvWpr+4WxsKaoAnGi+cG0KlV5RA7Y+YxzU9ffA@lists.linux.dev
X-Gm-Message-State: AFuF++nNDgXTnQvc2V5zpr3bicFD/evSAhPjexlJA8yyDzTiqnTKj6IJ
	R4dG6euV1ilvCMauF2tMn5ptXlVG6qI+VMnbqcsw/o9F+ejjtxTv77mPfhkPBRwdY9uTq5wvGLB
	Ldmb52XORFgBKr9QswR+yJa/lTApOn8WHHiMuicxc
X-Gm-Gg: AYBFou215b9377QXS7tOiy31MPwNCHF8U/IZnARh5RxnuydwbxwGN2qPZZ7G7HETYr2
	4G3Dw17zG5L5BwBevvozLlsE56CWkWUB+sNYWVodGkIfEZ3rz/KJNquUEBAs1vTM8sMpv/Kb9Vp
	uMIB+BW4j6NlU4vBkcrgpxBvuyDPKpwTyMjKxgS2hS2VR8uPFmvlAGKUs+muJ9Lu7Xyno0XwreM
	YKiqlq/1b0i1y75POBfGVDq2GTb03XMiyHI5Ghm5AdNZFyFhPbrWp+6ae/ishDAE8V9gFjgL3fc
	UP8UmvvVsyMcRX6luBgSiHITpKpGlJMnpKehOx3x7b+AQhJ/9WKRO0ZtDwlWH3o2g/DL0OpE8v0
	/YO4SrA2vm2kmmgSdnBvr/WIYLSz85lLrZXlTcn48awzeLovI+FtTthS1rUoPHHNM2wo=
X-Received: by 2002:a05:600d:84ca:10b0:49c:ff66:7d88 with SMTP id
 5b1f17b1804b1-49e7d725e6fmr51370615e9.7.1789494465544; Tue, 15 Sep 2026
 10:47:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org>
 <20260914-build-speedup-v2-21-39817ec5db23@kernel.org> <202609140844.FA7E848A@keescook>
 <aqk9gakQhxToLnDI@gremlin> <202609150955.A51C9F7A20@keescook>
In-Reply-To: <202609150955.A51C9F7A20@keescook>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 15 Sep 2026 10:47:34 -0700
X-Gm-Features: AcwNN1U4CY7rpoxX3OGd9mqCs-kE5osRcDbnjG2lLmWDcf89pyFwGTPPrVzl7qI
Message-ID: <CAKwvOdmgeyqivO4pVa=30XDWpXvdRzBR8f13rfuPzDx=LJ1Tsw@mail.gmail.com>
Subject: Re: [PATCH v2 21/21] kbuild: use pigz for gzip compression if available
To: Kees Cook <kees@kernel.org>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Alexey Gladkov <legion@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 10:31=E2=80=AFAM Kees Cook <kees@kernel.org> wrote:
>
> On Tue, Sep 15, 2026 at 03:30:43PM +0100, Lorenzo Stoakes (ARM) wrote:
> > On Mon, Sep 14, 2026 at 09:39:07AM -0700, Kees Cook wrote:
> > > However, parallelism needs to be set. We can't let it eat all CPUs: i=
t
> > > needs to respect the -j make option (and make its CPU reservation kno=
wn
> > > to "make"), which we already have a solution for in
> > > scripts/jobserver-exec.
> >
> > The only place where it's invoked is vmlinux.bin at the end of the seri=
al
> > tail, where all the tokens would be free anyway.
> >
> > So I don't think it really buys anything at all?
>
> There are 2 things I'm thinking about:
>
> a)
> My main concern is the lack of respecting the -j make argument. In my
> mind, this is a blocker, because it means a build will now _always_ spin
> up max CPUs (not what -j has limited it to), and for CIs, shared compute
> systems, or whatever, this violates the requested parallelism level. For
> example, if I'm doing a long-running Coccinelle replacement in one tree
> (which uses half the CPUs), any builds I launch I'm asking for the other
> half of my CPUs to be used so they don't thrash my cache.
>
> This is the kind of "why are all the CPUs spinning up?" question I
> helped track down with commit 51e46c7a4007 ("docs, parallelism: Rearrange
> how jobserver reservations are made") forever ago.

Parse -j from MAKEFLAGS (https://stackoverflow.com/a/76517886),
forward it to pigz?

--=20
Thanks,
~Nick Desaulniers
