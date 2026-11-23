Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795448210;
	b=YpQulblVWOxxBgMjxAMPzlPmk6TRMTYY2Nse+jGyqb32H2sMQknw91YJtxi66NFUvHXl
	 L+K3hw8IXDVtdOsH6hPusHNYCqKoBXmxhxe/tSkhCXNKrdrHc1vpFvnwsWKUIUShh7wD8
	 qdpfQ0aPmOc9JZ/WmImvTI6nDT8AQrxso3OKUPq+31xBF/dXLk70kp07deLbek6IReA20
	 ZjfvScioCoF4jdWE0f4DezD87Q7qYX98a9yMH+nzdCoHyPhCPM+2dbmMY24OY6EaHsW+p
	 Yq/lECBteadihBWHBdSrGWjHtjleHxIoh4cr8MepC+RBUv74Wu3I8TQHUdK4B9QYPWw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448210;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=O+ZsCUKlDNFkykdhaFUY00lREXOJ7VO+hfzdF9elZiI=;
	b=m0bTl5bYxEf7YonqtQQcfjE1ft6QY9esmO4zseB/MMsr7EOL6nOzl61aD5eW5EMAHMjo
	 CRFd6yhibLEwExTVBmFxeMjOZtyG4Qw3Qx3wrCMnwLYiFg7wuG8wDEyl508biv0uuSc56
	 5kxs/1yjZOJs3iUwCDVytB5FRVOe78YUnAsENWVzI0opPXzpPbBYXGel5nTIjc0kehoRr
	 h0lKkxu5jRD3j3FC6bg97COGQPRovzWQEyKya3mhhMBWOPBXVnZSgOWHyDrV00PvQ2kkc
	 tfbogXq/yEE3LTKhlmDtUU66RsuAaRkedCCHSGOQIMpx0cyxbemXOmdVriu1q4/9ZNA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xUSs2uca;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.43
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E6A606A33C
	for <llvm@lists.linux.dev>; Mon, 23 Nov 2026 15:36:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77E6A606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xUSs2uca
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-71ae8568d90so170874eaf.2
        for <llvm@lists.linux.dev>; Mon, 23 Nov 2026 07:36:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795448208; cv=none;
        d=google.com; s=arc-20260327;
        b=qYyHxpzPszrvI1VSMAnWf233ykDntxbu8s54nhbhghD3TbTt1k38bCBHLu3+062KgL
         tiyCxg0uvhe+VKXP0OsGDcoXZgYZIPgRXeW/jBSr20lj7PDKq2B0nZsiWJY2WMrK1o6m
         mKsvI+UlXln4seMZk6g/vK6fE5mehk0K8DqOnec8p4VSccWf0MavDul/iZ3kzz5EnNlY
         GesSmHy9aRKOdAv9aSd/gMgKzGajO92zrA8DZyyf3wy7r65d5fPxigWZldPju1KMu9tm
         gnc9vXIR9tt6cXOfextd28UXPsvTO7ClSYcXGi1KyjgV31k3zQDNLzNyqJMm8gGj0tCU
         h1Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O+ZsCUKlDNFkykdhaFUY00lREXOJ7VO+hfzdF9elZiI=;
        fh=Aj7CUVvF5xlVVyJdMCmK4d2D66uWhneACChJlXQ5zGM=;
        b=HuSt4n0INKABgkAB00+Y8rjAaz5PIEIIfPQm5vPGsXA7i0szlrOiKgtWyMe2QBMCAs
         cK61EhwpgNlW3Y/hQAzKMP8Nhc0tTrXdawyv5JwmUup9Tbofu1PBjBZTWqTefSgp37PZ
         bnSsp1sn0lF03putHmq6jS5m7GvBMeu+1T6RYfIxHoUQefGv0wweJoTUCCaYOpuUSQLp
         BgD5g4PJ+OOVlI6pg/JbCbz3DtNYgdVMapMpQjpFwCZ5dpt0tByZDemvGEic1LnOO4fq
         bHzEBpDFZvDCHvoVWxg1o1DZs9g/Uuezws2fuqm0fDnXMuWFcxb0aRo1vtb1z9YAalR4
         +bbw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795448208; x=1796053008; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O+ZsCUKlDNFkykdhaFUY00lREXOJ7VO+hfzdF9elZiI=;
        b=xUSs2ucavKVfPy7FE0Q91cPRFLDTTWSvprODBGPK4cCvzeX3Y/O+g2QKSx8hPrlwFX
         CC5ujezn22VAQnmYcr7ud4fEkXCernz9D4efY4UrToC/mFz5cLYt61rnS511iKi/w2IH
         2D01QIXOfY32V1Hswg6u5VWQe1k3FQpr/QXcRo6h8Xocp0p3fUtdw3knZNnxo4QZc0ct
         MFuVhUlIPIE2ypEx0PB4hv2TLnvZ8QbldTRWn2cvkUrg4tBDBp3BU5U9ukZS+JY7Fm19
         +rJVT+tY+ex6tPhpHDifVpbJZvMbKqZ5WQdx23Bf8zUQCWW0fbVRyXYp6st20oQeYOnN
         7NZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448208; x=1796053008;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O+ZsCUKlDNFkykdhaFUY00lREXOJ7VO+hfzdF9elZiI=;
        b=TpzEFViyM35W61KSm0ofZTMNB2bnyhj+qQclE4vulQ0BlFLEK9zFd24vNSqF/q1B1I
         Exz/H6mu3f3YOsd2PJKzmMWNUFj/gwv8F5U2EURkdOn5QMUVj9eERcCPJsSrC2BX0A+R
         60I34xWccRuammLIATiuoLhdBJRpTFZ9f1iy7p8k5ldvZ1A1b8jkaBqbF05BIOD9sGLI
         rJU4z2QJFaCowShWpNUhPE1MXM9ovwgjq4tN0xf/oPEDzGsp6D67f2mzkoyIJr0fcF0l
         xFDt75b16jd/y9WslBCxJK6wrLFIOjRZJOc5LKu7i2TwsoULbL32lICTTvuWMiWL8sPs
         /uiw==
X-Forwarded-Encrypted: i=1; AL+hErFV4pz78BnopPONe5ntnE/vnQwY5bS/a1+cQknGYsHi2TEXDGl3KOFbvk2gKWZ8y5UIImRF@lists.linux.dev
X-Gm-Message-State: APuU4Z8QYWv/Ky5ZOlGPSiy0NnmYLIEBAWBlr209gVCaFdJjOT7mX0WC
	V5TqnwqjgaPNcdQGq43jEtDp4R5psZ4IoC+GrBUqZjssx4phvLk02f8K/eSYceNMdy2optr7DN4
	b3xY0NppyUbNl6v5hoAVoTA2b/1GqqHg=
X-Gm-Gg: AZFdTZfHgv7k1gVuNaCt/kG/Na98rYSbW+bYJ09LdO+Kz8eo1ynEhwjtFaFktFrH1m6
	QeirTResvE2Fm/e/0ZRhmJavYZ+ulfBhE07EgByIQ8bpWWl6lMVb9X3mGEOENERFwuKHkuNDW1v
	dCraZHF24BoDrH9NQHNeOmqVmJJGWc0omfawQi1IempfWIKezBt9r/FJ8VbYd/wlP6cpw71wb8S
	nar/uZIoaTy9dgddNDKNNl7LT71t/7fQUp+dg9NFRzAlWO9/9YxDPOnke6CbBa1H0+lQK8l63bg
	rJ/JXgsOQZqGkLPgC4RouQOqxPO0EVNAvCnXCP4L/MQZkfKLlRZ3vulbdjY39IwUydNiplXipjP
	sGPGtvjIslO6JQp/oM0DOqN2JH0PmrxR+8oBUBbSuoUAev4Yy+jWdg2XZRiK3iTSyO+q9BHoYbw
	nY/ZhypeKFQnH3QiJkH5S6vkpmQcEVryKPdalKKlbeU0AZm4Qrn+ShmxFEH90=
X-Received: by 2002:a05:6808:1383:b0:549:e9e3:9460 with SMTP id
 5614622812f47-57a025ed532mr17234457b6e.0.1795448208292; Mon, 23 Nov 2026
 07:36:48 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261122045319.18651-1-irogers@google.com> <c7a81b11-73de-49dd-b38d-76aabf193dc5@amd.com>
In-Reply-To: <c7a81b11-73de-49dd-b38d-76aabf193dc5@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 23 Nov 2026 10:36:36 -0500
X-Gm-Features: Aa3M54rvn7dkOhohcibCJnEbcJ8Ls1D79SvQUldxYdV48pGWUDZbdwQoEIZo65U
Message-ID: <CADnq5_P23gnpD8eXOF-hOE3bjHcffEOQdwvfjY9xMsF_Awbx9Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] drm/amdgpu: Initialize r in VM and TTM buffer helpers
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Ian Rogers <irogers@google.com>, Alex Deucher <alexander.deucher@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied.  Thanks!

On Mon, Nov 23, 2026 at 6:56=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com> for both pat=
ches.
>
> Alex will probably pick the patches up, if not please ping me again.
>
> Regards,
> Christian.
>
> On 11/22/26 05:53, Ian Rogers wrote:
> > Two fixes in drm/amdgpu for uninitialized return-value regressions
> > found via Clang -Wconditional-uninitialized on an x86_64
> > allyesconfig build:
> >
> > 1. Set r =3D 0 in the 'else if (!bo)' branch of amdgpu_vm_bo_update().
> > 2. Set r =3D 0 right after the while loop before 'error:' in
> >    amdgpu_ttm_clear_buffer().
> >
> > Build-tested with LLVM=3D1 W=3D1 (-Werror) and -Wconditional-uninitiali=
zed;
> > not runtime-tested on AMDGPU hardware.
> >
> > v2:
> >   - Keep 'int r;' uninitialized at declaration in both functions so
> >     future missing-assignment paths are not masked; instead set 'r =3D =
0;'
> >     inside 'else if (!bo)' in patch 1/2 and directly before 'error:' in
> >     patch 2/2 (Christian K=C3=B6nig).
> >
> > v1: https://lore.kernel.org/r/cover.1795106955.git.irogers@google.com
> >
> > Ian Rogers (2):
> >   drm/amdgpu: initialize r in amdgpu_vm_bo_update()
> >   drm/amdgpu: initialize r in amdgpu_ttm_clear_buffer()
> >
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 2 ++
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c  | 1 +
> >  2 files changed, 3 insertions(+)
> >
>
