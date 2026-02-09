Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AFFC3254A9
	for <llvm@lists.linux.dev>; Mon,  9 Feb 2026 23:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770678364; cv=pass; b=XyexC++lrqd0IWB/LdD+L//PIn317qjOWP0pDf/Yc/cDElQ7WLZs2bhD9Ov3jLgMuljBW8siZiI2BGSiQ/HfpduQqwJ2Ew9IFj0/kD1D4ylPKvNxVto6VPQC7Ex6kKwruxuuuVFa/EJJVhqcaQ4Ys5sDaIzaWlSJ+D2co4zOrSA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770678364; c=relaxed/simple;
	bh=3CMr7co1DRh/RKzmgL+sf0SpJ+u3D9obkDjv8ZFp6L8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=iW1L/zZ18j6XdRdziY9O57oWdGsig5tBWEL/QxlpiTX2pc1zN/tEcxQSBX9YItEIT8kGSsRUhp02NfCRHVroc7Gim98Qhps+IOHujlFD7aRv0sqKj4A/3UAcOgpOov6/u+Gja7E4mn+qb/Z1DTkEbDntpETfFueZIyzwD55wGpI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LnMqX/KI; arc=pass smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LnMqX/KI"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-66e3100515dso162294eaf.2
        for <llvm@lists.linux.dev>; Mon, 09 Feb 2026 15:06:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770678362; cv=none;
        d=google.com; s=arc-20240605;
        b=Wc2ZDxyR6sYhflYEdLLohdY7wmmtcufCqVbpPRNaNiiMQj0VTQO3LRDDuS+ylvccaR
         8Z+UQkwZxPRVYVhGtx0t8dUkHLmHZMX37mDr5JZww2UHqLNlwDFi3X/R2MUZa2GwTxDm
         8C/1y0QK5hV45wUQ62CbFd1tZbIpwEw1ThCCy9DPsFdAwDjhMcnluKb+XY0Q0QnuXxLh
         w/eIsCvvIEXjRlb4VGVxEiK3xiAxoNMwNI01CbOQYZ9AphZq9fvk2XdC7DJj8vqFBrUD
         +3Y5Lt0f9iVS1X+lQ5NB3nP8lH9gOLBLQ3la8wn59diyzIk68Ft3DuR2CNycajovLuy3
         zfiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=3CMr7co1DRh/RKzmgL+sf0SpJ+u3D9obkDjv8ZFp6L8=;
        fh=s5TVvd1fYFaLc7Wbe4sQV+kWxuH4q3Q2Sy6WK1mBla8=;
        b=jPEnFd0FxsrEk6jDCCtV7gH4PlMqW8+us9GcUG5zM3P6W7C0Ci9GqmkUUnW7W3FbzG
         /hQiocYUiXzqyrqgZXoqSezqaeQJ2Fgttfa4Ra8Tl8xzNk1XL6c5/62KMAG/EJSyoBPq
         kaaRbsoq1PSNBtvUUEqGyNtZM95sRqlZUknZwhslx8vpdH1P5lHrkEldjYqy9OMS/fc5
         485DU1vZhPtjmpGRXuVvN0ODDwRXcFUVVCJ90kk1RkqovSDhwcUhcVPhYQoOkcjtRVPj
         /CvojnwLLgvKlnFMDPUtqBEKO/S57eBc0tQ0oCBnFYOMesXCaTc3azgv2KTJicXFaPQR
         XEQA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770678362; x=1771283162; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3CMr7co1DRh/RKzmgL+sf0SpJ+u3D9obkDjv8ZFp6L8=;
        b=LnMqX/KIzxSst0YuDmP9QrpzXQ4UdUDU4hy26fggBwi30zBwhSaEw/spQipUmTMHFM
         XZj8lmTfiaHCMetqLJ40Qtx9QK3eMevSBT+auu1sRRl8ZbSnlF2KRy8Zwe4yUHodV9fX
         z/Fww6UyevdclB9XQcB1zAF9Ctx8hTj5QLORx+uVNavDmNajVVRW8AG/cKEBGnBQpGtO
         ziiM8zNM1BVoQfuTDDnsZyRLiRI40grcq9+fz59/OHAZ6vdlj+oxyAXEm+5d1O5icsjd
         y/vku1mBVUEG0/w0B+w3cJng1kWOnAnGTdpx17pqN6X5tV9wgqY1DZbspkez6GDfbppy
         h29Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770678362; x=1771283162;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3CMr7co1DRh/RKzmgL+sf0SpJ+u3D9obkDjv8ZFp6L8=;
        b=b0GCeCXbBtTKOdsS2nCiABCMTa4b/8ioYVG3wd3foNzTgtWwdK3d/4wh15eE9LRmKi
         t/FZ/McY6SKsUJyyImKv1dQiLTszHCKeyIX0PE3+89o71lGueZWDpiO2PG/xnvCauv4D
         7vJ77HNiS57mWHsDU6sWvYpixhAP0NxEqp5B5fZ6oxgkEsWgOHaGK1aMUcUnp0ZucwL7
         2aIlOM0L9XUwMYSM3ADqlQi+jasegQ867JAnN0Wh/5WykokQlKC6CpMqGa7TrzdK7s3W
         tdnm15HEHa0EDurpyCqYTLEmRSPWEQvWnM0XUycI4Vcvc2MiEi0F7hltDfuzhcHjzjll
         DLHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXU9ankYIuY8Jy9OvGdnrjEKd/+7WtQbZf4sHLhnuQ2FdVGOoh/grIRR2jvFu851Pz1tbWy@lists.linux.dev
X-Gm-Message-State: AOJu0YzMo/TpJbJjC+wkRsPqx6r3TrsDuniQG8ctC4BBd4ZX4hv4Zbod
	I2e8VNeI1Ne+khwqukU/7PNiK7GbGAlIJnkC66p0Isap+FL+MfmT1vem4dBOpJmpMtBKFlLamLE
	1I44i/PYMdYdltpiGuOFWuYUijpoLUoc=
X-Gm-Gg: AZuq6aJOmezp+DRVdJpNj4l/y64rw1jCNahIFsiYtp3r9u964/Aszmhga96AV6i96O8
	W5cTexBDUVFnpB5Xu/qJINwKlBHUeqLEELwiU/D0ok9kiyowhdglKdjBgnsn4MaUb/txdHOmPK0
	HTBWEWmPKdGhVG+xCm6Zb/sU527oj2kLu8YFYn8owgvyN8S3Vd50yeCP14yNWyWJl1GAKf3KXSC
	0jLs8PppOxZWgqEJah3lgF4t1KY9vF8Fks9WaWA+6SaoLfyYdH1b2Nbq6m92aQOsf569ltdGtdJ
	sX7fYbAPbd3kIxN7W7Gsyg8HVQc=
X-Received: by 2002:a05:6820:1514:b0:65f:6994:314b with SMTP id
 006d021491bc7-66d0d2fa708mr4985297eaf.76.1770678361869; Mon, 09 Feb 2026
 15:06:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Yoann Lecuyer <yoann.lecuyer@gmail.com>
Date: Tue, 10 Feb 2026 00:05:49 +0100
X-Gm-Features: AZwV_QjCJogYNxSx58S_93uDe6N0OJjkbPA74xddnic2w5pObERjuWLWGj2ZiXo
Message-ID: <CAPZXbJmpAZfxFK9LKaS=wZXX+pez9j5k3gjF+CRPgP6Ru4DuRA@mail.gmail.com>
Subject: Re: [PATCH v2] remoteproc: qcom_wcnss: Fix handling the lack of PD
 regulators in v3
To: val@packett.cool
Cc: andersson@kernel.org, barnabas.czeman@mainlining.org, 
	devicetree@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com, 
	justinstitt@google.com, konrad.dybcio@oss.qualcomm.com, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, linux@mainlining.org, llvm@lists.linux.dev, 
	Luca Weiss <luca@lucaweiss.eu>, mathieu.poirier@linaro.org, matti.lehtimaki@gmail.com, 
	morbo@google.com, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, phone-devel@vger.kernel.org, 
	vladimir.lypak@gmail.com, ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"

> The changes introduced to handle single power domain platforms have
> swapped the info pointer increment from num_pd_vregs to num_pds, which
> would shift the info pointer past the end of the array for pronto-v3,
> which does not list power domain regulators in vregs.
>
> This showed up as a difference between GCC- and LLVM-compiled kernels
> on SDM632 devices, where only with LLVM one would get the
> "regulator request with no identifier" error, because the out-of-bounds
> memory ended up being zeroed. Fix by skipping the increment when there
> are more power domains than regulators.
>
> Signed-off-by: Val Packett <val@packett.cool>

Tested-by: Yoann Lecuyer <yoann.lecuyer@gmail.com>

Yoann
