Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DD03A1689
	for <llvm@lists.linux.dev>; Tue, 29 Sep 2026 05:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790658377; cv=pass; b=dSVlXecp/7YS2JsbhcMriGpchdVcz20Dv0QNdDNOQZNFc+gtBHFOBOJtJ4nvxCukz/vqiIZRaacQlh5ZJ/UtrhTmx23DKP/1IvbX7NIVPxXpbRW8MuOq5qTtwbpa3k0ZHejVUQ34aAWHCmTMZ1+olcGkRHXYE66ea6o14nGIWxk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790658377; c=relaxed/simple;
	bh=lQceDshmIcxnm5pr2ANM4Bj9m14zZHt/Rqa4vniZwo4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XMu520dVZi0GHpcO9V8Jb4axVPwIND6wif5GXEnr9LkEMbwdmRKnRximhx7rbaFg2600iKJftI/6jmW+N5oMKRqQlQlrXonj6YalK/LFseBso8R3W6sKPn7tvkRIIRlJw+l21YsPIdCrXtnqJ2BIWyhC2Km8IF+GdL9I0jBfBzs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Y1Qf3XC0; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y1Qf3XC0"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485984ebf5cso2979928f8f.0
        for <llvm@lists.linux.dev>; Mon, 28 Sep 2026 22:06:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790658374; cv=none;
        d=google.com; s=arc-20260327;
        b=TYJWUFrBP3jxwtneNKKNDOGgs8/SpGH3366YIlb23Y1Y8i01yHZ/DcGDSKdFTAwW4G
         CmsVTV2f71zFp/dbMw/KBPjokhZoD5/YiKTOoKj4J6PYWrek6bv/7CLhPv5+JXxECO42
         NBdEIA1bY7DTBYdpfzAwfauo44Py/3MzFnkukgvFXghHwif3+9vmEtEFg0jUm8UBUNPZ
         e38HeoSH6SFPVQUwvLiOpfUgFCw3NHz1XK7Z6n+qzk0iGP3tb1gHGVdLY8AuNuXy7LRG
         CiGmKH8ovwHj2eM8z8nQdlcOotHbND339Kqhg9kJmaGVrTWr824W74KrnHJ/FFNP6grp
         5Mxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lQceDshmIcxnm5pr2ANM4Bj9m14zZHt/Rqa4vniZwo4=;
        fh=NvBN161CaXgPRS85dp0qQ2TNCz/q7UlGFuZP+CrePko=;
        b=EGbAakeqvGxEzGEcVBKK3yaIwOYZLOaiJW6cn40kNdj4N/jgl9Ecmks0bkJB6Quwq7
         qsj/Itq+KuLPDnmxE4K0gW2vq9kDz5Lqm9EaigiLuDpNQdEBT6ORaeXsB1ZKF+905ayI
         hMz7xyJDug5FpIMddiOTLj4nj1VlzkP64iumKN4dErtI6ojTje6fYO1vBPMHqpWKPF3I
         USpDhgiSjAGQSzZpI2K4+on3w7L1oJs9MPVD90GbFwzByemnDIZyd7e8Bszyk1vmLi2U
         pwNdeQezG90hYv3pyN1AUWiCGVzeBwCVECqIahfPFnmtZ3ka32zV0pPRzEblo8qjd6ZT
         aGjg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790658374; x=1791263174; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lQceDshmIcxnm5pr2ANM4Bj9m14zZHt/Rqa4vniZwo4=;
        b=Y1Qf3XC0ofcDRDhNgHIcLLjd+rnYfc21Q/EhI9sSDb/LLaaGDcq/7uDcMYbOF5yDmJ
         gNb/a8Kgsbi6gZTJXPhNHSVX4GnhHI41UMRp73jTSMteBozBK9CC7KtS+Nv/yMabf0OI
         Zug9lAijl0in7LN1q8t70krjhVmes/m7sNsA2SJzitCJjQtPZLKcl+vxkLvScAeu35f6
         0D0MniIpdkwyKH+TtJiRChcvmmvYBwXEY4h51mL4hgtFYpPTGFrUmYisOnzDURAl/3l8
         8PSU6qE8Szj7Us+vP/AAFPMJcRQvKSFVB17OawGfCmqIvcWi8m8NFxCUxwlew0msqLy6
         uqUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790658374; x=1791263174;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lQceDshmIcxnm5pr2ANM4Bj9m14zZHt/Rqa4vniZwo4=;
        b=vQCRGnZniXa+QDoT+It1bUg/ivQ97Gg6xOJlUCwNXesQ8+pEhnTMaNkRjWf8dUo6VZ
         YShjCPM0WaLzaaK3QTDs487n29CMRREWoq5F9CmMNV1VqOqpHGdVaHCImBwopnfzLoUu
         em79qpLCQViI5C1/UviDxZBPNdjxzpLAdzuVtYcGMfv/dQ/xY+r2SL4B0sgI8LjBXcEq
         ZVuRl7xOB0cPQOYKxJ1ORq8w+aiET0cm8czTysMNFenhRacO73z+FVNlpx60hpISCoI8
         eYJdXrrhKmIlSfYL3RlG5EnawNXWqK2uMwKyCPQ1DynpfKn+hk7D/rwubZab0p+7y3A6
         wHTQ==
X-Forwarded-Encrypted: i=1; AKwUvByhtVz78Fr0P63GRklEOv18Ep+5iaa8KQR/UJVGa4N+Yfust1Xk5v+g9n9f2ex2YpVVGcKi@lists.linux.dev
X-Gm-Message-State: AFq9FYLz1Im/PLLb6gXeEep6v42EeAVpqZUApDdNbj1Ygz/w+pqqVYdN
	kc5lpf2ONjbNY9kWCZA6m4xdLzJz1ntnYPcDn9R5ZrSI5iSt8d7auLfrNFtEezGQ2yoRU5WFK2i
	dJ2lvRF+jJUtbNtJETo9NBGtKj5M+Qxiygrzb53+F
X-Gm-Gg: AYBFou0m0mtPhLYSLoLtS03k9ZFS+g9XrYprhxgACCpNl6zTdOMrbkhVAobf4X8q25a
	xxQ63gtNhQ1YnnNYFZUX0FyNQC4yW659eNWRYX987Kp1u+gA0H85g7OfMNo6jb52sovUNfd9y1J
	yTDtr5MdTQ4efTkex9Z8odNIo7BHnAX4hMsu9S/hfEtCREzofS3/6Cf3veGYlekJ4umKFFvO9hB
	wTlwEEEg3YfgXRDCueX6gaZk8/H6wbuMT/LWmKi5O76CD0JaY4adYPZfRIJ32NaYHR5gFHboM7S
	3VeBbYs6yHAygSOYWyZNCOBV6FflyhxO0iLi+q/0LJpdWV14OEbDDyexJcd0MItdXCxGc/kk/TY
	Gau7j5/1GUX6AvsgMAT9uDKDhfF0/xBTiQXg9se4nxlcMbN7FV+m6mIqKnvGKh9e2/uf1DA==
X-Received: by 2002:a05:6000:400f:b0:486:f856:1975 with SMTP id
 ffacd0b85a97d-48872a7ed6emr28989136f8f.22.1790658373306; Mon, 28 Sep 2026
 22:06:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAGLNFZfd65P3C7wd=ShsG3BwVqx56-3FTXRARvFXVoXEJmj6Lg@mail.gmail.com>
In-Reply-To: <CAGLNFZfd65P3C7wd=ShsG3BwVqx56-3FTXRARvFXVoXEJmj6Lg@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 28 Sep 2026 22:06:01 -0700
X-Gm-Features: AclHuK-G3nC4fZFb5XTwTm_Ndg0dN9k5HC4ZdnEzBSe__7iBSOMXfWozEdeSNPY
Message-ID: <CAKwvOdnmU0qt1--_1pO=8F=D39W-EEPHojc544APimtartFo+w@mail.gmail.com>
Subject: Re: [PATCH] scripts: gen_compile_commands: accept object file paths
To: omer zalman <omerzalman42@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, nsc@kernel.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 4:46=E2=80=AFPM omer zalman <omerzalman42@gmail.com=
> wrote:
>
> The command-line help lists *.o among supported path arguments,
> but main() rejects every object path as an unknown file type. Map
> an object path to its matching .cmd file so the documented input
> produces a compile database entry.
>
> Signed-off-by: Omer Zalman <omerzalman42@gmail.com>
>
> The exact git-format-patch file is attached because Gmail's web
> composer removes tabs from inline diffs.

Do the instructions at
https://nickdesaulniers.github.io/blog/2017/05/16/submitting-your-first-pat=
ch-to-the-linux-kernel-and-responding-to-feedback/
still work?

Otherwise please checkout `b4`.
https://b4.docs.kernel.org/en/latest/

--=20
Thanks,
~Nick Desaulniers
