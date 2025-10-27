Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E0D3128C0
	for <llvm@lists.linux.dev>; Mon, 27 Oct 2025 15:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761580469; cv=none; b=OzNEBiZtJd01I9Nfml8iKV+ZIR1R1qTxMrm0Wd54eJoCGrXpaeQwAT3+lgUIhs8bLz/NzvxsAcxOnnq6+V03rnrgPW0hA4Icliuf3CaRDZSuV/Pglj+a6L22H/tesxTPacnGs+QZtJUX3XhB0Q2220DQUwvmzcon1mDl1RVpGiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761580469; c=relaxed/simple;
	bh=VrcGekrA0V4MeKOK1C3SdiVffncJbm6tZX8UDVo5Re8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NtKtds5P3hU4O56V+DPb6tMal99AtvbaIywED43QxQzuUJPcfg7EYtCN5MN3bZgiA2WTKMZGDNSfEh7q5uAUs1OY7+uIwp2OWlU6JkcOjYVM4uDEgrRRwLRVpCkWt82quvqfQoEm7RxG3S8NtDYc2gcGpCbvl26hLo+0GVn8/fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PxoVJ/vP; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PxoVJ/vP"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-290d48e9f1fso370825ad.1
        for <llvm@lists.linux.dev>; Mon, 27 Oct 2025 08:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761580467; x=1762185267; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TOV2usxAVtrzpjNrsCDY6+oTbSzm7HQ0OagyrYKBhwU=;
        b=PxoVJ/vP9VVH1KcUk+mh+H8NW/hp4fZcPckW+itxfKK567u1V2ZjrFHuUy5KZGJdws
         siikT8Xuk2f2NcwJG2zD+u+OQHDJ7MpgVgFQds7vzCAXITkzo5oqvsFzacF24i9mqYNz
         L1o/mAanIOfexY6tClTcszbS7DhfVUc5qm0cRtn7I9pE4I89RvDr065Hy2v4c8l70p8/
         zaqrM5AkANHlb7DAlKoUZWw8vCTD7wX6hkz4Vg8iHQT/7QTbXBwvnzAHjF6mGW3mD40M
         vhp6PBqdXondYQPTbG85cPBkipD6Nx1KmdnQxjraisOaQFBo7Tq7DOoDL1BJYWQ8gII/
         e10A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761580467; x=1762185267;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TOV2usxAVtrzpjNrsCDY6+oTbSzm7HQ0OagyrYKBhwU=;
        b=QiUy0H0d5e27mLV3JLAS9UHUgHjiJrQp9W6W8+jKby0cWwHz145LcGwafa7pVQ9lKR
         17PECyxrFcUZpMp74mpWOI4LD2zMuWckQeCCZeSucEcB2BJiBkNi0SPhSQxadn4QJaom
         iVdqD2KJbj9KLADVNW91Eh6jl+CgF9XP8xD0nYy5o1bPCUCPLo5oS+r22TlDhDeay7jG
         SS7pI32q1OK2CZQDGIeMakn9zsuUPlki/wCHRDwUeIhLrtMvKmta0m6g/EmIt2eiQNJH
         62OE08GHeQMhlZbO0A9wvF5K1rwrYn7WZepMxhUdd4tNQjTEydQscNRtNvIcUXTUSuwI
         SLaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQBlGfUbEFyFfDsHBUfFt5SRRTabqMwdIKCnCHcdndR0d6lb50/K5DHYWK8vArJ3T05sD/@lists.linux.dev
X-Gm-Message-State: AOJu0YypxkCxMSCc9j1nTLpWya6A3rkAWTJu+4pMQm5Ig0UUobv8Vdbh
	UjGVRiFqMsXVaOBZW09jAO+islHEuQ/IJj3qDnM+XruTPd4kmHcA6voSwNoU0boEyiF3iE672tM
	RZfmPPwFR1oQ43wnPWBG+2tY20MNp5sq0nOEz88Fo
X-Gm-Gg: ASbGnct9dF+RBfKbzwoTaqWm8nO673QLPc8DHf1cMad5ngAV9vYucb72bgMLE27bQpu
	MZrTq8SGePUykPJxg/JvSSvNuUkljIeUPgUgiaEfqK+nPvynlPLZporf7bCpFh/EmXZHO19C9Lp
	W7QIL7/0GXBVSgZuGVSMelD71kHDiZzmSSdAV3nurapozTU0OvVbq9PdicGUJa6b3RG+SLnntmr
	32IxreDSvQIEF3jEEDj/5IMI70ga86ByVS5dfNbmKX7Z+d9WnZsfqfu8KyXXHb+TnMe
X-Google-Smtp-Source: AGHT+IGd2VC+1ri7Tm8Icu43HfhHP31Eha9krNlCyWKJpXSqm52Nv3U4r4IDiw+4iGHBWYRgukstDdR1FrBi6TFHiUE=
X-Received: by 2002:a17:902:c40c:b0:25b:d970:fe45 with SMTP id
 d9443c01a7336-294ca876b46mr835215ad.1.1761580466893; Mon, 27 Oct 2025
 08:54:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251025-idpf-fix-arm-kcfi-build-error-v1-0-ec57221153ae@kernel.org>
 <20251025-idpf-fix-arm-kcfi-build-error-v1-2-ec57221153ae@kernel.org>
In-Reply-To: <20251025-idpf-fix-arm-kcfi-build-error-v1-2-ec57221153ae@kernel.org>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 27 Oct 2025 08:53:49 -0700
X-Gm-Features: AWmQ_bkZ-boZ1PO-DZE1ghKe_XcmKdU5EzkIpPpXzyaf8mX9qkr6Gzs7ALPdxQ0
Message-ID: <CABCJKuesdSH2xhm_NZOjxHWpt5M866EL_RUBdQNZ54ov7ObH-Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] ARM: Select ARCH_USES_CFI_GENERIC_LLVM_PASS
To: Nathan Chancellor <nathan@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: Kees Cook <kees@kernel.org>, Alexander Lobakin <aleksander.lobakin@intel.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Russell King <linux@armlinux.org.uk>, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Michal Kubiak <michal.kubiak@intel.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, 
	intel-wired-lan@lists.osuosl.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nathan,

On Sat, Oct 25, 2025 at 1:53=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> Prior to clang 22.0.0 [1], ARM did not have an architecture specific
> kCFI bundle lowering in the backend, which may cause issues. Select
> CONFIG_ARCH_USES_CFI_GENERIC_LLVM_PASS to enable use of __nocfi_generic.
>
> Link: https://github.com/llvm/llvm-project/commit/d130f402642fba3d065aacb=
506cb061c899558de [1]
> Link: https://github.com/ClangBuiltLinux/linux/issues/2124
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  arch/arm/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 2e3f93b690f4..4fb985b76e97 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -44,6 +44,8 @@ config ARM
>         select ARCH_USE_BUILTIN_BSWAP
>         select ARCH_USE_CMPXCHG_LOCKREF
>         select ARCH_USE_MEMTEST
> +       # https://github.com/llvm/llvm-project/commit/d130f402642fba3d065=
aacb506cb061c899558de
> +       select ARCH_USES_CFI_GENERIC_LLVM_PASS if CLANG_VERSION < 220000

Instead of working around issues with the generic pass, would it make
more sense to just disable arm32 CFI with older Clang versions
entirely? Linus, any thoughts?

Sami
