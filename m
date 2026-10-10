Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01457547074
	for <llvm@lists.linux.dev>; Sat, 10 Oct 2026 00:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791590537; cv=pass; b=fddcYrBPbcFJlIsdvA51VIpJlX7Jt+YoQYwGP9ruH7f8mxg1d5vpOs9PEPlE4rT0Pbcb/Vou12OYtVF6fhji9p1G8LdxEUN3ytaoGG1JYEL9HbJG+2t8t851aR5qnTll4r6xTUYsTE4YjLVKnwzJXzOn1NAW2Cb/BzzAPKFdH+0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791590537; c=relaxed/simple;
	bh=hXTeWRoHLQjJuetkdFQnlbxkl4pZIcomCQcGCLyZ9N8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZypEw6anwZGlf+3bz43M53S+lJHn1vvO7myJvLwX/x6tCs08BPV5ub4eRU4rzm09hsYO+OIybEgo4bEy4bKWkxyyrM4Oo8RRKBHbY8E9b3WUIvnpHhlK9WiuoBtew2oaZEbaK+zWiFXuALK47BSN7KpFyGLE/bjcRDl0BBjf0Z0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hjE6fry/; arc=pass smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hjE6fry/"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-67687f279b3so197233d50.0
        for <llvm@lists.linux.dev>; Fri, 09 Oct 2026 17:02:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791590535; cv=none;
        d=google.com; s=arc-20260327;
        b=KnPEIodZtEJcYHoO36tEh4/Vd2sdxxND/8T6caxJNRW7S/v2FkXFBOgMtkaiL7XTO7
         rqMGIu43BQrjcTi0NFdk3ufO/9YK3k1KRZ7+8Y+lYvEgo6GocMNw8HeRkV1BJoKWtg2/
         jei1EZyAvmtuqlv9xTuoKbVd6eknsL5QVvIoGwJ8cCHCdc2FM09Iz/E2JRx5IpSkPU/o
         ykVKwXNQhyc9hSgNnoGUXVBrpI5idCv3lSu0w1PgF1PBxOt2xWIFbQXzxyy0vYjvF78c
         YYKtHcYVv9HAkzk3gSVTdU5Q7deU0hnQKMZb11/YwZitWkwh8jJM3nl7UKnIxebOLRLh
         J8VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I99AZGsC3feH3Hx+ZXc5ABTbclG1gdclkr+/K7Qjuzk=;
        fh=REyzW+AgXgUrZxP/ScWgpIBU2YeKm6lVLGux+RWZ0nc=;
        b=Sxhzv1Isb9/MwJX2HEulV0gfCTtuiwGCjlSV6mE4d0HfmBsw7S6s+kpiOPPqtN3gGY
         m9MiNyUz0AGgJd33t0gnUZ/DZ2K6IUIXWpIbPVkzrA89Z2Q4RMj87j+kRXsITnMr6t0X
         2bT+ypDa6A3kiCqPGHo3JkzEDw1n77AWp6MJefd/65VOFVWDDxKtWzCq7zL4df8xdeBt
         OYf3WHoIo9FfQ5zUiD4rO44VBEKLJFrAxB8dgWGibs6zeT3g285BsltpB1CGg5xux7bC
         AuW2sM8MhLbBVt8InpSjO2yL/5ZCdwXWsANR6uxUpnfwBFy5QtyeGdW/2bHesLKlYKRK
         QstQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791590535; x=1792195335; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I99AZGsC3feH3Hx+ZXc5ABTbclG1gdclkr+/K7Qjuzk=;
        b=hjE6fry/bKNpC9Ej9USBOV89EBqNsub7Pr2xBFopdtRDIEF+4fAkLjZ9a3FZy96YGg
         9qTbB3pvyNiY8vutDE8Agdw/rGNrqMwh8aq4oI2Jl/KMHdn3YbuEQy/O8G0S/S4PaSUJ
         r+MatJ0Dh2aQhhh+XZvQ0iIPUWswOzITM/WIze0GLTx66GRktFiTKImlOdjsQWG5TGEO
         K8ksyDp9q3mNCS2YjYgf1yKXGkMoQDU5764c2D5tpx0BtfMxIgZJRidaQjg+VFVEC7zS
         kDW+Ea1u6+v3av1h4KHe3LHEOAssWKxcJQfzt8xmyyczCpBncZHDMVz7YQyAvcje3z2r
         BVOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791590535; x=1792195335;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I99AZGsC3feH3Hx+ZXc5ABTbclG1gdclkr+/K7Qjuzk=;
        b=UDDDzo3eS2CL/btGcqqLRlHyzp2L9e9x48rXoUqgUKbM2NX4uKiaHOtbdpu/JYaW9V
         TaW4J0mVL03qb/8NgFe2Ki5BZFNQq+wAF/rk1gDmgMFgzuZS8o/1W6dNPDS2i9vggRQr
         QQE7vaq5OwY9zqnbsn7SsoY5CBlmrs471lrgt/ASx9f8bLiEMygNFtV/5A5UbEAFiogn
         EqBD63Sc6WxqLngz3gWCreMcZhBMzi3x3aZ2z1rH+wWxT56MbsUN7nuVvCyjJcsU8kFX
         2wFi877ofUmz7t5MAhSiEBsJnlCCh+I7SAgMCZTehsw+WXGAKLRbviK/szBN9fUnqkMo
         Affg==
X-Forwarded-Encrypted: i=1; AKwUvBwsMGJJxdZWS0upSqlZsjF6o1bvgnYM5gnfHj9KCtCXpW47HVaDRjC8cW5Ecayej7e5eGF/@lists.linux.dev
X-Gm-Message-State: AFq9FYJovU+PsQzcc8mxhECAppfQcUzbvkXyme302LPQ7IIecjzKY4oi
	X+7/n1fLe0/Q0W4jnkDtHCBQJBJyVSL38P0QWwTULvivhg5LzwJeMcQOGVqybzYXO9oEIBbklfv
	mp5xAEmgOlSYX8OOLShkK5PYzXhn7W+w=
X-Gm-Gg: AYBFou0I6DT54754g6nTdbAu+NK3H6y4etyQ2yv2lbK8o7Q0rs9/lnNe3dCB30OU1xC
	FBTCCduD+agjYza2MZRLVuUjjEGZAiEMrFOFVeuuNWiELn7XjiOfaA4k1yWss+xOIIKKcbPpM1G
	8wCVBAMzqJs/CzH0ztj+8pMWoAq7UUH+L/ItJ/8rE2fDg4DAK7kX1Kjub7BDR+Nc+43rYWBIA7T
	J7Y9ADOKKdlLHlMSgQf5ArS3UJwsQnsTd0ZC+jmOMqlSPw04qeANs4lHQdHUh+EyYw6pPvv85vm
	J6lI7XUzsRXoTQvuyfTUE09b8JWFi3wGG2uihvkVwyQx/sbaaWtx4Y16hbisioR6xO7PoUpq/ua
	fB0X6DxrH
X-Received: by 2002:a05:690e:bc9:b0:677:c43e:c81b with SMTP id
 956f58d0204a3-67936059eeamr1294555d50.59.1791590534633; Fri, 09 Oct 2026
 17:02:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261007-b4-landlock-fix-domain-fortify-panic-v1-1-042e9108f5f8@oss.qualcomm.com>
 <CAKwvOd=nPgEm=AZbEu12Eb90GtRUThY6YAjSiHHuNVHP8TZHwg@mail.gmail.com>
 <66usntltyie7ii2rrqajy3izxrvwubwf2vqnery552v3akhwo2@xwb4t76d37wx>
 <CAKwvOd=E7wgGPf+kgOY8sGi0xO-cFMAJK4PMBFknoEupJi1CXw@mail.gmail.com>
 <20261009204554.GA778522@ax162> <EF8E7F67-39BF-4382-AB18-98E9D6111CA5@kernel.org>
In-Reply-To: <EF8E7F67-39BF-4382-AB18-98E9D6111CA5@kernel.org>
From: Michael Bommarito <michael.bommarito@gmail.com>
Date: Fri, 9 Oct 2026 20:02:02 -0400
X-Gm-Features: AclHuK8tNFqb0iNpuhNaBpJsUFdnB_vd8X2cSDcjR__CA8pNTmkEAbFNAUmPMiA
Message-ID: <CAJJ9bXzLgzZG+836_2+pUVOWzndSFNoOh8Xu8Pw++_i1RMJzOg@mail.gmail.com>
Subject: Re: [PATCH] landlock: Move the domain layer counter out of the
 anonymous union
To: Kees Cook <kees@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Abel Vesa <abel.vesa@oss.qualcomm.com>, Bill Wendling <morbo@google.com>, 
	Tingmao Wang <m@maowtm.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Justin Stitt <justinstitt@google.com>, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	llvm@lists.linux.dev, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 9, 2026 at 7:52=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
> I'm still catching up from travel, so apologies if this already got check=
ed, but has this been verified against GCC as well? Is it only a Clang prob=
lem?
>
> Regardless, if counted_by is not working for a given compiler version we'=
ll need to exclude its use by version. :(

It is only clang, not gcc.  See my comparison between gcc 15 and clang
21.1.8 output in [1].  I didn't test clang
 20 or 23 like Abel did, but it seems like we can't gate on any
available clang version.

[1] https://github.com/llvm/llvm-project/pull/228309#issuecomment-608047508=
6

Thanks,
Mike
