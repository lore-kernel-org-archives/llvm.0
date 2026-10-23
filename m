Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792766805;
	b=QLkA57BLT2hKrLRWntEF5eOXJ3cDoJzOVfDVcKXTBKjllsfVAnt1LQc8wY4cts78TJxe
	 hFDVMiuQ8jmx8zcpNgCepk0hCqZUomyEJxnpkJCtfQf+78M4Y3F1JW3U981WaWi1dyfqV
	 DmuzEf5tTIqNRFGBkQPw1o7MrQafjdaUrg3xGjbD+voieBRAi2EgF3GowNpbGoAxqRzUM
	 rNoyaJUTyuPM2KEbBbdG5+G3p178wZ7ZNFB3lMxv7Oed5JS2TyeRAbXhDl3kAo2O+K+V/
	 AgVXR+5Muz0WSm7TNruVPZZfogpsOowBczfcJcEJPr7DnCJxAA/sVwgi05glhgJOANQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792766805;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=QJW09rmXkrEkYFRlCkDFiS/aHyTVspbIpRwFPjx9KZY=;
	b=rQ4lrdaRY3PlGyHTQBjvFZMYApWfoWnyrnZkLz88vDAZeqhfnKyDvtdbr4knshtYQVSH
	 Qx6BdN2l1bgZl20I7+GL1Dy4qJkng/pc3Hl6XSn5m6yWEKuftzwfqM5aupEbIJZFB68q6
	 xuMHe5VLPa1qJEtN1M/lSbvLMcPdZq+o3O5mW014LDR8dcgHvy+KgnzHCBFN6CcJbA7bU
	 HiQfjwQ83fKmD06iiC4fA8+NJ4XWHVTcVwwSoqwjPLzGd+3FqZOtgyZn2PFxfmGofwv0w
	 pQVak1IX/nJ7nIpvAINHSNX26A3VXVBg4fn/MNzAOFvh2YBTk+L/5ntDRAx/NPcdQkg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YaFZvWqs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8AE1606A32D
	for <llvm@lists.linux.dev>; Fri, 23 Oct 2026 14:46:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8AE1606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YaFZvWqs
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-35159e0092aso141844eec.2
        for <llvm@lists.linux.dev>; Fri, 23 Oct 2026 07:46:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792766804; cv=none;
        d=google.com; s=arc-20260327;
        b=kmhnUk0iym2xteH4SjJTkRn04dshv50MZbpOY3h8jlKQaWY2lL7cZOxCszVOdo1AJE
         UGE+54eNujQyFHHDLViXfEaOlhFd2O6KBdrQUwlssTmWEaCH/rPmtN6JYZYOXb37EDu0
         UqXb9usT4x8Idb27gQ6neYm4oNzfqC+ukP9j6dDfr/qp+bnqqtC0MjaOzHT/Vuv+FKM4
         K9KlR3WNB5XI2JhbYLjSRiLVEBQB95jF5gpZVcnscMC74Aaqrn0Gwj6+cFj1v93TAhM9
         MIBXULrfrWMgqUYiunzxlVc6HesBoCks46aooVNrKRQ05p7KQ5FM+13XeFHXPtjwDsu6
         m6GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QJW09rmXkrEkYFRlCkDFiS/aHyTVspbIpRwFPjx9KZY=;
        fh=+osfa/ezuuSfuuZMXmgz8ac8SZN09C5wygH0v9KJtT4=;
        b=hfTNh4J5sTIZX8pUxNUyBFWBeysIb/vqZwOXwwpdwqx8ccnGVaputBAksyQi/HWN2W
         g2pvtFjlXyrvtbbrpu4mwfTemz+i/76jzdBNF2Kh6ZTMvbkyxDftnbiv4k4d2ZK2RY3J
         VjHFXBl42HJ8zgv6WOu5XgQBrVebarw0TAOMC4iwg9HWZtbmG7oOdBB+/p1izPk+olUY
         uZPzYd0GgqqKZGm8QPWoro1NmTEyZ7d7P+8Mrq3k8l0niMaHkAunU5PbH9QA/bSXR6kN
         m1wbg83+dFCo07XlnB1BChDKZPPOMfG2BZv7LBAVNSnesld2pUTpy8uzSq2XZ/jqp7o8
         /W8Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792766804; x=1793371604; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QJW09rmXkrEkYFRlCkDFiS/aHyTVspbIpRwFPjx9KZY=;
        b=YaFZvWqsIxoSuu5A29ByRSaTpkf+KxbDCec4plyB//3pfUOsP9B5fKQyB78OxZtce5
         0g4nwEDheHuhDfntDywjYLDbZ6cLltqW5gJc3AfZEFgbJHzyPVAdsqyEuBfP0vHllVSM
         74ojkpB26mQ0PZafwcB+7hOFstjyaxiUruyZDfFWaxkhNIlzo9/n3qHP9k75IZH413zV
         j9osYmiCxr/pKwgcIHfg6fZVl8IkBu5nNo6vrwB1PiIsEjJmWclSM/VPRR9oOin29aEb
         9a63arlAD5OdJamYCAGeX0wuKMZT4Fx3r/irDykyAFqH+MYaB+2zzczB+m/brBBNWGPU
         vrEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792766804; x=1793371604;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QJW09rmXkrEkYFRlCkDFiS/aHyTVspbIpRwFPjx9KZY=;
        b=P1GUq/0Fb3vXF5TI1w7GL330zp+4AWyaTIDMi02/5Ul1NWaVXENA9X10Jsb5wOHxmj
         pfH91NjgtwDch2LbFynI46zm/xKTPPMJoRzDEXiRbm+3PdsIWejOAuNkXDbU+v0pGmcG
         HeWsrVsT1ohW2vkC/zZDvp/PJNFVNuQEMJ12utK0WQsOQLrmgZ5pDMaNW86ze3/rb0MH
         2N6rt9AdfOkH2SXTTq9+NpAFo4s8/WYBPebYm1LO//TMqrU9hL+7rEWl4tymSLw3rz8d
         62ABDoP/I1rvCAK5KNcIAfQnjwBB7Yj6GHu4x+mAd6dIweRNxzdrX0LLhU51yBR+JH0N
         /A1g==
X-Gm-Message-State: AFq9FYIZhdl4yBWH3KFAD56mcVUZqiLLjaiWRAe/8ZgOGqzHKKKvxBsn
	wxiWN/5y84gf5n0/Ic2rDnXwWi+KVIrI9htlylNXns9DOtNDNrPddz3PuVckZv9LPXfTmIbXxyi
	3MXvMCX/7S1I3Z6TseW2i2caKtn5qs+Q=
X-Gm-Gg: AYBFou1eGDEg65y1mqsJxZpTpvmFw7UNWIbEUfk09O8JkfV4f73hztbVCjLTEi7Tm/T
	lagTk9NvMOLpPTDnPn5HvRt376VBXHrOuy0f6UjnKOt5focoSh8Np7wv16pONctam8wBx449duv
	qLVmpozQAEwgWF3k24RnwOExOP7wWbnJuqQzFQ02RjsO5c14pdALxBonSW7zOvesJrFIuqFKDvy
	qSVBNStp3FpgNM1TfxxHIMTsMGuUocqoHAFp3/ZUSYFq8vGdA4VmZSkrwHV8EigLfvd+69MhLO8
	hv7osnquSsyTj1M7LPa+s7mX5W3BzAtpcC5losslQc9HI6sr+IPmOnDBI553oMf/W+QXgwrKdVj
	McDWfTxSYjnURBSBWuJlSXwASEb9c1ca8e6GDEItrIgT9MMne61/GhRvCrSd52Q4DSSRYEAyblt
	3pixU1YJ7+vJC5QVuKfLIq+PLC9bXXeotQ75xIIluXwd3ltXfh4ymaGlOqKQKmucailXg2SIP1r
	RUQ7s87e7mJKT+qmkKwlExLwJjimrWEesSA
X-Received: by 2002:a05:693c:88d4:10b0:369:289a:d31a with SMTP id
 5a478bee46e88-369d8fb0485mr5202778eec.0.1792766803831; Fri, 23 Oct 2026
 07:46:43 -0700 (PDT)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261021001327.GA2730064@ax162>
In-Reply-To: <20261021001327.GA2730064@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 23 Oct 2026 16:46:31 +0200
X-Gm-Features: AclHuK92RKUIr4fkuSKKQu6ug8T2C79gbzvQ8i9JmmXxl0iYsgxYP38OflibXxQ
Message-ID: <CANiq72=X-DXrEZ=+1PWfY=sd0Tpo-WwScvUCKCsD5NcN1xd5Tw@mail.gmail.com>
Subject: Re: Prebuilt LLVM 23.1.4 uploaded
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 2:13=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> I have built and uploaded LLVM 23.1.4 to
> https://mirrors.edge.kernel.org/pub/tools/llvm/.
>
> If there are any issues found, please let us know via email or
> https://github.com/ClangBuiltLinux/linux/issues/new, so that we have an
> opportunity to get them fixed in main and backported before the 23.x
> series is no longer supported.

Looks good, thanks!

Tested-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
