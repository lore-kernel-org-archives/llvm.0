Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701073DB640
	for <llvm@lists.linux.dev>; Tue,  7 Jul 2026 11:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783424652; cv=pass; b=A7RuxcRgP48CJWRI/avzKyFa6xtmoLhEsl3TmAAb9P/7TsA1Vys9c/xg8lqkPaVb5yvvPfvqfu7CSzi92IhI+fmGyJbiF7HNqFi1ZdkkiA/+u6716s+iLei6cnZVITwmQzDq81MxqQhGzYYLvL+gcnejT2M2/9tRNl+nYKUGbvc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783424652; c=relaxed/simple;
	bh=67hEAJ0W8TbXP17az7LLoVoZORX8tOcszaeupEwlAiY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=geZkqFIc4I4T9jcbVBMIJpEpg2D33SIf2RW4LlsuaadNgqdnncJ26P9EEQz5orarzw5awAyAZyeVxRLrVwPedkLGWPn5VCtoVcFbehlXIkNiljpmII9ZIijcvGAoNrs5NgApiPmnLT+hV60VtDGhjNyk0Zpq4ejXobjv6E8MtzQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VZt14qAn; arc=pass smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VZt14qAn"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-7fe4808741eso34483557b3.1
        for <llvm@lists.linux.dev>; Tue, 07 Jul 2026 04:44:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783424650; cv=none;
        d=google.com; s=arc-20260327;
        b=CKCd4YFxsXLuwB1wIFXldk8uKXDUSPccyxFsek/3maU/twIRL5gGJ51xGJaTLic2dg
         ojcjnXomPx2snt9Hn+HNPu65SnkOKV9yb3Nf+apc/g/LFqeS+JRZX12wYUbUjgQU91Yu
         19a4biCbpCKPXjeZ7XycmiJkKcYjpYeVEwIMqz/7spz9YSs1Vkgy5ipqUrtD4J3Bnkwd
         e+aq3V7qiUcqozRMBUBeWDKRlx4I7m8zT0ab4Q3/zCI5yws/LpwkJKTJXD0FdBKQ0JDc
         BStimmxd+6iiYstQrUHtqkQDxvAODBkYEkZgBhN6IA7AOCkiN8gTJg4gsJByn4luzfee
         iaSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=67hEAJ0W8TbXP17az7LLoVoZORX8tOcszaeupEwlAiY=;
        fh=B62t6IOzm/hOaZ7vHseqOFtHZ+yWX3jJ+PlNSxN4wgA=;
        b=C4dNXiCNlf8tQJDudqnPhCCybHbfTYDMY4rSr0DEq5qH3QeeFvcS+TDPAX0GuRhgdE
         qITcdtA+0snlngS9GzeYJoJm5fcRIt58SrwwbfxbXLXyZBW3pwnKY2Q88R7IpGljHRCt
         Fkf3NWHgCfFztTBHeZukjltUvjR8sILpGv738YOm3f6S0LKRc1mSWLamRHAvqtym+vNX
         ji5fzGg1YGDrPKNf0A4HRegNdCfI56YCeWIP6aJwnsEuBIfz2TMBh3d7NTdcaV85VRr/
         Y8LoKrxdEm9WcsKbMvafjVGEFsM95tPv9yniLV8p6KxA7YoCuGiuDCqgcfoM0z12CtZe
         vZEA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783424650; x=1784029450; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=67hEAJ0W8TbXP17az7LLoVoZORX8tOcszaeupEwlAiY=;
        b=VZt14qAnjTH/rG1xtpu7haVLOErUg3n4Nufo37Tq4rd4tlsCxbwMqH6COUfpe3JBYp
         gcX/fBy3nwLz5RoWMq7EPdiSVZD80abNl1jXtZ0bM1ovEKp+U1kT9NZQD8sbtAJKoWeE
         l3MVvpDBJ1g4wu7vnGCZdIf+/Zf15TjfcIbWnsBQe0J0OKpbBA6+nrSUN4ogyVOeUeuN
         Z7gMwdlkhNpLITXA/GejPoN6l3aRDGhJIWM6XcPVzkJsCVTz+V5zlwu7WEsekI3+MwCJ
         JL/pIm7s6SilRLMusq7im5SxPGlX20EPuHmM8EuI5A7EA1tj7Dgj0l9OXpAyVTx5GGOc
         RsUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783424650; x=1784029450;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=67hEAJ0W8TbXP17az7LLoVoZORX8tOcszaeupEwlAiY=;
        b=WM184zH2CvwqqItRkldxdvB7zlmvSLJIOA2pVNaIuzZs1hlUFYl00eDVrCszx5JAM6
         olSBYCE9n+cQ+j4hMs+tWsvtlGM1dTSpAN5yCLesxexLn7qCDR13FG7PmDAcEEr/ewyH
         zkSqt0g1DC5gf2wyFsJigSZnN/07P6JvxKh/iFo8YMPttQtbkheMYKgruJOmPc15K5nY
         4z3Dz6MPXRnDMZPvLXPqRRJ/qCOdtsmquRiskfYE5brX6HoIqvk+t6IpmegQ/txiLO0H
         sj1srgZBQATH/rHXPYxXJWqKF09KLQU0CBVTWqZck8RYvMTey0HF9sWrHkQvnKEDTG1r
         y7Sw==
X-Forwarded-Encrypted: i=1; AHgh+RrpDL3F8i2qAwTGYaG2rxdcjrN/uHK+vamQ0qqAjLasDFsLK4fOk/uM+R6CoRVmqn7ET+p6@lists.linux.dev
X-Gm-Message-State: AOJu0YypJaa3Rx/ezmpy0202e7gSLOtrP6bXBCYe99RRkCqewKdVYtyo
	AVWCA1tIXWhGZvA5W1LlFx2DEx0mX7bi7dTGd9av1Jd0fC71NdlT5GkZUsxj2FtZ3bpWO24syhK
	85q6qfuzWnn2DcMzxCLP/TtIGKGT2fJU=
X-Gm-Gg: AfdE7cnlSvq45lY8uAcpDaoinrHpdXgngTvtD64f9hoeiD5c++elN10+0drblM6adTo
	0WVKQHj1kghnCAfr8Mt3XvKmqjAh8c5TmDyoyOdP8AHW2tmZWzKaXxUXhDZHB0VW4MyKDbnVza4
	91o5Q9/jCrqGEe7fPsh9Frca/iG01UAG31muUC9m5MPFSWgYJqeg4v1b1l9BK6VwEheLCwweriE
	PEPc+DMHY8R46LAa/OXXP2SbG6qnRo4ioMHPOltud3CCjQJgToyJM8R6e0TYYVZvql0qLFFLyF2
	7zKJ1lKtzxyKk5FF5O+llON+2M5LH7LNKHcECJ5VBKxyabm4pxTHpnGUAg==
X-Received: by 2002:a05:690c:47c4:b0:81c:bd45:478a with SMTP id
 00721157ae682-81cbd455201mr8632077b3.41.1783424650492; Tue, 07 Jul 2026
 04:44:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260704084133.122053-1-christian.koenig@amd.com> <c575453f-d798-4745-b67d-4476825dfa64@amd.com>
In-Reply-To: <c575453f-d798-4745-b67d-4476825dfa64@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 7 Jul 2026 21:43:58 +1000
X-Gm-Features: AVVi8Ce7O0KwC_YSOIzySDPamgDjtTYnQvuH_iwtOUZsxhnymDAqU3HCRhQKPB8
Message-ID: <CAPM=9tz38o_p--FGjgkcDCV43jwmbx_zYDyc8fyHKBteiHDRrQ@mail.gmail.com>
Subject: Re: [PATCH] drm/drm_exec: avoid indirect goto
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: mikhail.v.gavrilov@gmail.com, dri-devel@lists.freedesktop.org, 
	amd-gfx@lists.freedesktop.org, peterz@infradead.org, jpoimboe@kernel.org, 
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, 
	Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 7 Jul 2026 at 19:11, Christian K=C3=B6nig <christian.koenig@amd.com=
> wrote:
>
> Adding a few more people to comment and review.
>
> Thanks Mike for the pointers, going to add them to the patch before pushi=
ng it to drm-misc-fixes.
>
> @Thomas, Maxime, Simona, Dave can anybody give me an rb or comment?

I don't like it, but I also don't think the thing it replaces was
spectacular, so until we can figure out a nicer way let's go with it,

Like I was wondering if putting the label in a macro would make it
more explainable, but I don't think it would help much.

Reviewed-by: Dave Airlie <airlied@redhat.com>

Dave.
