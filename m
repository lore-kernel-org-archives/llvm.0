Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6545E3A83B1
	for <llvm@lists.linux.dev>; Tue, 13 Oct 2026 09:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791885149; cv=pass; b=sXPbnAaUFUeqbvggaZheqo9+/2oRraoABYrQYSPQX3q0N09cdnMJdyvLJAVRhSgMs1KaXqxc9MmbjYo3BaLY2Bl0jljJgOis1BCuRJt061+PUMmayhKFBUMv4CjsmqvpBthe8l/32D1MfOAoqtGTi+HhZDURLLur7rOgyKH3cDw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791885149; c=relaxed/simple;
	bh=TyAuVkyMsHJJREXO1/HTkl4JIBxp9Fm42OQD2fqAPFc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k4zqlECUq22kXyw73s0NJ06LwEcoDcebu8Q2IPjdCBay7hxK4SydQAFQZUhkDP0HTKLL2kQpWfa00dHoo5ff8DVeZdlbmpbKzOjafgJKpQosdRqVkCEakQjl+dAeRkjMEwGKpP4DHA6PLpfXHaGuKUZEhoAhi2OqSdE+yPmENDs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=REhOqT3d; arc=pass smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="REhOqT3d"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1419d3416ceso4096436c88.0
        for <llvm@lists.linux.dev>; Tue, 13 Oct 2026 02:52:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791885147; cv=none;
        d=google.com; s=arc-20260327;
        b=UwL9odlzDVdFbbn+zlVG2asqV6f2aza7OOYLhur+M+27ePMOFPJtTtaTR7o2dR6hxg
         Y4z0AJuLFlZ7pbQOgy3eADEuzuzRu1POEa5jrBW3MUGEr/2jqJRCdP8ki/oFDQmeFLjo
         LCTZSLxA2Feor7cb9Xl442zHxNGDDRuheSpfYt6vmlVUTJgleajFnixbmwWkmXtgz7Em
         EDaabntHVDH4KlLm/YKQ7YGkOUuuHlbj3Isjj0sBUj9lrbX4yU0pKqtPF130hHxlv/Nu
         xnbISM5bwfPaAJ91nwtVjebgdpKQ9KbiLgh73kbI1OGCS2t0vsi2bDtj+vHiAljPVx4K
         EjeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fhk+6Lyk+1hHxtsJDi3I/qbsbgY72hHWcOxDgEm1wgM=;
        fh=0GBSKihZBwVo5/4MEnG6ff4obABgcshy5F7l/iNjm50=;
        b=VzgQQm5BgGeTSyjIKDr88g0xoF65cGJ0Yhv72FxOBbDQaCwJf2Iudjd1Ym+RSrjCDQ
         8U9EH2CKHj2nSC2d1WrcNcx+xqODExaLjsoe9UZG0dhtBkCTtM3L6JEDtz+PzweGXdXG
         Eep4JMu3RG+IAidEGc1WF9GJlgMWGGF/vOOiInC2EOS5Qw80DtVPI4LfznRq+1ebvLg0
         ZrUSXtSaNSIi9WsBB04Wex9nbLGX9p+TIxIvFaf9bpPr7tn8NXptcJSFQtV3NlsRTkjB
         1eCR7nvBAb0D3LXUAn4ek9R48tr2sHZURnhyxrNwxcCSqAjs2yJsd74/TGK0gt7vl9nS
         +/IA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791885147; x=1792489947; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fhk+6Lyk+1hHxtsJDi3I/qbsbgY72hHWcOxDgEm1wgM=;
        b=REhOqT3d4K7rPNPPoAzvw55otpFdBZYV5I0yxVlinYc32kd/jfPG4NBJCCqkTB8Bkv
         fkZvx3qA9JrFeB/VMjKSlITQJ6rmOhl2fatXKlsca2YfriorPUmHAvsmTryCRAmsUjlM
         EQIX+UGRsKYsQaQ2OQEfdhBk/zylhFrIZav86WZSx1W2mXvmphlMiy6ImV+V/Tt1cQxk
         3uaiinOsqOkPa4/QG1S88y74iKzl2BZh674mKuFoMclQUdzsFqYNvPEE9OJlZTlWNoGB
         PADezTfw30xdfsw/zsvqy2kHCnLIk1ySCbmeT67o0hOnOhcPrrccO8m4LPuF29UQrpdX
         gnnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885147; x=1792489947;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fhk+6Lyk+1hHxtsJDi3I/qbsbgY72hHWcOxDgEm1wgM=;
        b=jKAs+ZG+4sMqxe96QzBnDHbFVdKlDN3hgsqh7z95nT1L0QxMlaRd9tCzgrlX9vauJm
         Fy2PMf7ReoTmmE5KOVhqakDTQgDYzyG5eIDNdDWRE/+EW2ev/ft8vJ+ah9ajm/UgWt1d
         ShmWIvYVlnZE4ZDfwgmHc2MZepEp1tlvsXvMEbLbh8O1nhzF0p1CBAsgbNw1CBpU1STb
         SRL01Pol5qfHE2vPXhdm7dNNNe1WdiuywMyajAePRBNp5j0VeCRvbhr8Oa6Zhwy/PBWI
         9l4ZVoYGmoNkwCR3e4UAWlKFvZiJYNHP3A0hkrdUSggBOxyWM6sDDgF1nI2Zubtdawac
         1KUA==
X-Forwarded-Encrypted: i=1; AKwUvBzguOYCJ16nG20ydlQrEmD9BTR105c8L5MkmyHKMZe1BaMWIawY/aYa/G4uhHmYJsIBm411@lists.linux.dev
X-Gm-Message-State: AFq9FYIbMkFQx/gsySq4UJGqeVadtTeXYoKlJJRfcvIjrDS4FopcrSIA
	Kde7FCTMLDE3RULqixEiUrG1Ur9crohg3dAlnk3yVRzabmzLJ3LylMSUec/AaOqhTc/FK/5JOBL
	eTblHQAzKQ5gaXpUVAj2oJFX56vPF+Qi/C3GkVnxf
X-Gm-Gg: AYBFou0NS6IrhUmqm/2vtiS50M9IgigUHU2A5D/uDQv8y3R/hd4cu99B+m/Z30Z62br
	IHODMOuPL5RZ7JWd2OwIAlOSR3t7Ut3bYBFzlTqAOpcdWcLN/bI9nrsBWccPphquLjvHH8+CFjb
	zw8PWuYqw4hLwASeDrrZnSWUz8x2btKsR5mTzEi38em+8MrlRdoGlZe8yUx+EF+JpnJ36fc8zDt
	OGD9c8qa8rLusJfAT86VVhTlyfStG0pC2GJiT+cml3MkosrYFiHYPV/6X36mJzshKEuW3WOkZ7z
	z2+mCUhW7GWJCWA3R2CPHYwt3ItelaW5mxG3EHsYt8+K9GzXnfKcqR0smQZ6/TshMEEAGLGiEcY
	zPI/vOi9EsQ==
X-Received: by 2002:a05:7022:92c:b0:165:8e0c:1886 with SMTP id
 a92af1059eb24-16a610c9bedmr22542241c88.25.1791885146407; Tue, 13 Oct 2026
 02:52:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261012134159.912183-1-elver@google.com> <CAG_fn=Vx93UmT_Pp8F-JDeGM==UicNmMFEp3RW8+stzkm5+sbw@mail.gmail.com>
In-Reply-To: <CAG_fn=Vx93UmT_Pp8F-JDeGM==UicNmMFEp3RW8+stzkm5+sbw@mail.gmail.com>
From: Marco Elver <elver@google.com>
Date: Tue, 13 Oct 2026 11:51:49 +0200
X-Gm-Features: AclHuK_xfsOoDi6wrmohki4XfQkFak1e3ZKbYQiASZjaKFsec73Ai0xMvJurni8
Message-ID: <CANpmjNOdnZw7kgjruLikbyPK2fqLgtndMdnX5osWtShP0Wh_UQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: rust: enable KCSAN support
To: Alexander Potapenko <glider@google.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Yury Norov <ynorov@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, 13 Oct 2026 at 11:36, Alexander Potapenko <glider@google.com> wrote:
>
> > +ifdef CONFIG_HAVE_KCSAN_RUSTC
> > +# The minimum supported rustc's LLVM supports all of these options.
> > +rustc-param = -Cllvm-args=-$(1)
> > +kcsan-rustflags := -Zsanitizer=thread \
> > +       $(call rustc-param,tsan-compound-read-before-write=1) \
> > +       $(call rustc-param,tsan-distinguish-volatile=1)
>
> Do we also need -fno-optimize-sibling-calls here?

It's optional - I added it for Clang so that stack traces are always
complete. But rustc doesn't have an equivalent option (neither do some
of the hidden llvm options work). So this is the best we can do for
now. I might want to note it in the commit message, though.
