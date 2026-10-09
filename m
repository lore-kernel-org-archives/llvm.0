Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20DDD3B0ADE
	for <llvm@lists.linux.dev>; Fri,  9 Oct 2026 17:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791566610; cv=pass; b=UEk0taZ1LSDcdeKsnTtWZfzBz5owhwMBlK4lk+TFqQ8EM5CRJkb38ejrgUR8lCOFAdtsopQ2+dJbbYq0LxhGIWbL6rYs1RPxt3XjNTja5dFYz7cAZa5JCCReYzHFgPyN1XNsek42Egy6/NItFQKu7Faqm50clc0+CGbyNAoV9Ps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791566610; c=relaxed/simple;
	bh=Ju7gwhPhe+gDtBXlanX2ZOcJL4sUKBXDC/LuKD7vhrw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JlMiKpGoBsbzVqNLjaZWHMcDbb9V/Zo8dPp+2pHqr2eTpHqs06Bd4s9z14YK3f4cGA1fapyJbZsXycscFudvki+yOpix1tXY7hvQlK8w+9Sf8U85pO4HFKxOYsbiDUAOBk2MhPITavJEZppJfbG34958A0BMYLDuwjS7ybcZi14=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=d42oUjze; arc=pass smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="d42oUjze"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48bbb06e746so17626f8f.3
        for <llvm@lists.linux.dev>; Fri, 09 Oct 2026 10:23:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791566607; cv=none;
        d=google.com; s=arc-20260327;
        b=io4WL/j4BjsVznWdd4ks+w8sQTxr5Ou2y//NaFbQwyMpIpNqOIvQK3Q+ANAT1I4FCQ
         duxbOtQ5Qrw0L1tZxM1lkWrCi1nmUXkMo+cJ8vvcMPYS/CBiXcRvkt62nq6i2Ur6HzQM
         1tY59+hhytwoHpCaMdF5XD3lvVaAbZkvss7xibFxl9IMYMcRedEPPBCGa4HmsXXo4R+a
         NG8XQTcec0/Fs8oA+n1qJQyKYOmi81zmXB2AW0eR3bg6Xp89EZrvLr3PlCtQ87HrCd5X
         FWk6YdyVgD6A0lAnt4gtH1v+Cj6JrpHcC9b69jxulzRQsT90I9Ghde+O/Fhjp9UuCPFU
         TYAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UviV7uLa4QuU9wMqSrfcZ2tk7TpFd3xUn6hAcyKbZrA=;
        fh=RaJuzHcuXeT4WgWr0noMD3QB3a09es3MixBEQICaWTs=;
        b=WzEYJrADNy5/jCE7To0tMICSWu71zL4/fSWkGY9adbYd7Bl4jhYe3gY44ionQyju6/
         t/qieP3zjysrA4tR+j3VgGcv8NFC9y9ooZZLL0NBvKMBOUDgsTgq8JTP+bko+381JDmv
         ry4GTXoPa8Nl7/aI3mNicmw/zPBZvq/V40J6/Y2CBsib37tH/iVCP/YpGgFD3qWqoMnQ
         d3HdwNW8L+zmmdHtjfGiwOJQYgRkwF6/nq4jO3XP4Fr17v/4/T+Xjrc6G7iJXPnWL62b
         wGyHGM5qgP+lmNfSAddLtvCQbt/Lqire1o+Uhp+R0JYWndz6aeH3H5ewIq6stYNHrSIT
         gTEA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791566607; x=1792171407; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UviV7uLa4QuU9wMqSrfcZ2tk7TpFd3xUn6hAcyKbZrA=;
        b=d42oUjzedQzw3jw/POI+wSAY4TwAemC5oxjsYv8CUxAB/1kcqAWw/X/F2L3AUAtWcn
         1yJ9lnmrZfAdPTog1aug9UzcvrwjKWWFOntSv3sn7mYIg5ECFosoy5YxAPapzsClYguK
         eVUvq8D2unUd3qmIBL54Rh5wv6pA0JD5h1XjbZXHXg/G/lTUH0pmBxETJpiO+P7l2acL
         uxfFgTfMP1up9LQLx0oZk7QZwD9LRSbCCs/bVEgyKlc6KqSdxFxjPvUzonJhVveD4bKw
         WDkcSmHXAgGJY9mBH2PQlK4yuJjKCqK+4nX1v0H+VPsc0lyoLo/hikIzikfdt8JI+yra
         L2OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791566607; x=1792171407;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UviV7uLa4QuU9wMqSrfcZ2tk7TpFd3xUn6hAcyKbZrA=;
        b=ctdHxBW4B/zUoa4OJ3w8WzRoHW6KdCjkc1BIQwAEZW2PJJcny3nE9TqUkOZpYGkwHX
         8XoJZOb+ca0/QLtEY1zaef1J0doAQEy6eIMog3j2bO8o/HqglvNuixCurFFO0BXnpF4A
         n12WClp89gj5ogXXRZbyOodOrpBJ4QMFNU8io1ABe7cnu1cCH/0ocfogGjcSJO6xnzPg
         geQ5qxKQz0ToGZ1s8IUDnCO0UbeejUm5Hmgk5lICtheun5IBp973AxBi0pt5pGtCwJw+
         g5ka43iIiM/VW8FGO5EygA1pi6nWshjx2kw1ay9Keh45a9bQTCETXC0UxBMeHJzwlB2c
         6kMQ==
X-Forwarded-Encrypted: i=1; AKwUvBzx5iu4PoWa34oakDTXKrQlxcAHoUsiXb66EAqmDBHxgDvwZRyXCqC9+uPMeDfMQHr7CcMM@lists.linux.dev
X-Gm-Message-State: AFuF++lLXsNrdn6Sh5Ch1HuhGCHTbuSpOPqL0jzVy8YN6xz9UUBPyBLa
	YnMIFsB8/jFxzKuorL0GeGUq8CMejrwD4PJuaeFaBEx00bnrPENvFgxfLoRX1upmQW8dXDXrC2f
	YhOeJCS7cjPz8esU97bzEnDcrE3WoaPjRjak64489
X-Gm-Gg: AYBFou2FkrXKykRcun+/h3QSSoUrbEUnW5anGX66sVWxsaHT7705ykf1KURCSu/DWb2
	XBwJqlaL/5P8mGHkVaG9FYRrht4ezKRtcaQX2PFHsJ5uezw4T7N0Fmv/8Myv1Qk3e+aIIF4l9Iq
	VOHYD5oZaSGbqi3aq8CPqJ4Xc1aq5yowObZl2CHLq7GYV/VzrzdXx19lfR9M/R+dNUOh41TX1oK
	vpLpsQkJs6ai8MvRTOCskv4sUI9+lSSA7GfLKZUDmPmZdBwWWBWpsGp0+bmc8rMv6zUazmSd4qz
	HORHzYDu33r0zQYvxgcdhnJz3JR2rq9PO5LkAdvvRLVe/AVSjx0F8CuFsKutf/CGN/aE7y/QXz9
	I/xBeVF1Xu6nidNiceiuGLS7Q/MnRRyjNgxfQsCaKH0ambtmUp2f7X55p+i2SjojjazU8WWUbJP
	lgMfOVri/0JKN61CcbS+PIIv21PSPTIdnqNDNE50hfw9yD/marxtthdDfb
X-Received: by 2002:a05:600c:628b:b0:4a0:251f:dabd with SMTP id
 5b1f17b1804b1-4a18e48edd5mr43689545e9.16.1791566606839; Fri, 09 Oct 2026
 10:23:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261007-b4-landlock-fix-domain-fortify-panic-v1-1-042e9108f5f8@oss.qualcomm.com>
 <CAKwvOd=nPgEm=AZbEu12Eb90GtRUThY6YAjSiHHuNVHP8TZHwg@mail.gmail.com> <66usntltyie7ii2rrqajy3izxrvwubwf2vqnery552v3akhwo2@xwb4t76d37wx>
In-Reply-To: <66usntltyie7ii2rrqajy3izxrvwubwf2vqnery552v3akhwo2@xwb4t76d37wx>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 9 Oct 2026 10:23:14 -0700
X-Gm-Features: AclHuK-CLR4BQdqBSfFuLWEHCSgtnQKEmsz-7EKl2ZGIqsJwmtfHX25-OeazvEY
Message-ID: <CAKwvOd=E7wgGPf+kgOY8sGi0xO-cFMAJK4PMBFknoEupJi1CXw@mail.gmail.com>
Subject: Re: [PATCH] landlock: Move the domain layer counter out of the
 anonymous union
To: Abel Vesa <abel.vesa@oss.qualcomm.com>, Bill Wendling <morbo@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Kees Cook <kees@kernel.org>
Cc: Tingmao Wang <m@maowtm.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Justin Stitt <justinstitt@google.com>, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	llvm@lists.linux.dev, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	michael.bommarito@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 8, 2026 at 4:49=E2=80=AFAM Abel Vesa <abel.vesa@oss.qualcomm.co=
m> wrote:
>
> On 26-10-07 14:49:28, Nick Desaulniers wrote:
> > Would you consider this a bug in clang, or an error in how the
> > __counted_by attribute is applied?
> >
> It turns out Amaan Qureshi has already reported exactly this Landlock
> issue and proposed an LLVM fix:
>
>   https://github.com/llvm/llvm-project/pull/228309

In that case, I would _not_ work around the compiler bug like this and
instead wait for that fix to land in clang, then bump the required
version of clang for counted-by.

Kees and Nathan are traveling for LPC, so I don't expect quick
feedback from them, but they should confirm whether they agree with my
proposal.
--=20
Thanks,
~Nick Desaulniers
