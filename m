Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76BC3E5572
	for <llvm@lists.linux.dev>; Tue,  5 May 2026 18:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778005614; cv=pass; b=tO4IbsBlPUq8kN4ZlUOMYs0je8AnK3k2xyPgsqHoJNZjV80CG2cpTRE3GcxuNe4ShYH9GxXPpme5XGcpGwPaTB/4oZXBoCl6o73aq+UwhVAn+t2b4Hu0DLoyhc2aBwWgmLrC4gr/rxUp3hIxGgrZlmB1idCcWZxSjn8h+knpDH8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778005614; c=relaxed/simple;
	bh=ZIhgGw8OHp+7EafnrnJOBFkAUxEpp2cPLOL2P7jbZAs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=ppwCsooaOE5TL0tnP222CvWMvQoyoULLlJhCQs5Ykjp9O09KpifM2klubu4k+PwAdwYXz/wbc6PKtvWLTuw3QMOwHNlx82Ge+PTRvTUgtOq7y+tOhHsrGmHxvSe2TbI8/OA+uSE6NscwG9IvjXZrxBrIRZOBzTsc/PcxNUBW4VU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xjs7RSvd; arc=pass smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xjs7RSvd"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7d4be94eeacso6254131a34.2
        for <llvm@lists.linux.dev>; Tue, 05 May 2026 11:26:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778005612; cv=none;
        d=google.com; s=arc-20240605;
        b=B+Q05Xdcys/wUWM/3IUn5IqtzjEbo78F0luWskhR8xxn57+6EykgiEd+3jJkdlt1U2
         aV0Ew5LauIyFLJlwD4Od64cH1mFPKsgm9pID7ObAAfhe9BNUasOjujyMXtnY8LvDyKnf
         oNfsU3azCA0sJ5L86nY9x470SKe42N5q0BPhB4w3eKJ6y3cJIot8kAd8oJuv9OpHqleI
         KdRU3ELDIs6sePDlwJdw9Nf7BN5YVmIVsj5XOJkxoJ7Dn8lDhYBh5RkdcdweGM4hwuGd
         YQ9R/LFgpS4TwrLtcVni0iodGDz0N2q3s8gRpJ6aKoSeqGwdzQJA9irgSdMozxFMQgLk
         e9TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZIhgGw8OHp+7EafnrnJOBFkAUxEpp2cPLOL2P7jbZAs=;
        fh=pNvwraZdiA4ElvEWQTo3PmiEIMRM7luy5aOCbnTsvDM=;
        b=RMAzcBZIgM1iId5tQvNodTVVVqW5IPl3IUSWVG6nnkRGrHzN5suvsl+GZDtyLHx4J1
         ek2QWHs3s8kTqZYCQEFLk8wg/onxAXyiB7dPUzuY+rKrTksrtaTAy7oI/1ulFRa7LzFq
         PKi4MQxhWq/5ZA3oURCcLjNlU54U5lHxVqFkdBWIVFExqBJoAzmz74zEazbYNctCMiqI
         DIG4aXraNBSAF7mhoy9xXcdLEscDDNEHzefzOZfEhPb5SkUwnKG3PRLG0/P8mQuD35yE
         GMzf9+VnJPKPqHC6hHeXCSqMxV1fJPtr6ru/afuymVfseidJe5gWncKhsPtH/6k383qB
         WLMg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778005612; x=1778610412; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZIhgGw8OHp+7EafnrnJOBFkAUxEpp2cPLOL2P7jbZAs=;
        b=Xjs7RSvdrSwLsO4uxWECuhEdBM9LUHPhrqB9jnkHsuMq1vxTRMzq8D9E0KqmM6Ti8K
         emTqAHzTbX8csCY5ZMatllTnniH0OVBJ/O61IhrqP8jq4WE5IUmqsfe91zGsIrWGgZqC
         VJjOolODHkjAVs1VwljHkUmk+F+Hu0YaNegWkEcqVCdrIqXpeiKGEf9B5svYesODS2JR
         9Q6S8y/KLZK+FgFQhBJhDgYXt9JsM9JLmQZ6Q9Eu+wBiqFO1W0LqqN2vEzupSxbSYSVA
         xAF1zYLmwVesQBoAv2xy0GDnYiUoga9+I99i/0Qu8L82ShuwyGsqzVJM4TKOtRb1Skz8
         NEpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778005612; x=1778610412;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZIhgGw8OHp+7EafnrnJOBFkAUxEpp2cPLOL2P7jbZAs=;
        b=MjO/ho14G0IiGydrtckQ8mIDe4gVldjJTxEMyQjPDE0ipf1vMCuou1uT5bCLirKEUt
         iA77a/VeW3MaxvQnbtPUDv83UbSdEiLXdGwKHyrfaMMF8SzQD7dSxXTSeWwNUi9OXLiC
         AP8M6gOMTqhCFgLL+d/U6hscrocNdo+7x9gOOw/sMJt/YDA2w2pjrupdRP6uGKqcOGJa
         yf0+effqET2C8YnLoIxQ6RNGIJKGiNmn900eU1Dbywyx6/Q4FHr25rxyZYVyG13I5utn
         28FEd9PV/GPCMU+aQBQb8KJTn4Hfh8qYftL8OAU1Pzjsy/UaWnAiK+OLiaQN8/oRqQlT
         tyjw==
X-Forwarded-Encrypted: i=1; AFNElJ8GT6ktBPbDxIlA49m3d/VUnoz3SyCGa1edIC9ZbhJp8xi5bzW+ZA3WUWFAZoJ25MsBGwLq@lists.linux.dev
X-Gm-Message-State: AOJu0YxwimmoYZNHxMXg0ikfPstO+eVVj5Y5WsSr8bfkF8tL6IwafJjR
	4wl2qYFqjgKbmc8i/4NF/HQ+lkIjsxcdTt0OFRdtLFDwXC9DTw1dJtYRoh6HZtmMSFA1XTR/rxz
	5e0OfRt/1GLP6MUWzjNyhaqMqof7geXg=
X-Gm-Gg: AeBDietszLIzMeUGLL8lmtRSh8+gP7Cs8a+PQJun1RTFn3aiw4zZnJvPQGXAAIXraMj
	Fch1XHO+0wz8eKiKTXDVwYPrfGIZo2Vzpms66Bh0jBd0qCeuLep7t2hmaBBmwelkUS6D4U6ir5R
	v/fAHNfgheKZxR67DfuLit59VyP+qLuD+UHj7lG/keVmfWaC3e0RavCNWCQvvT+Kd4b7HZQphvI
	+cTlbrUHUT+UZHr7sySb2jJQ94g1hVkUyGYY5Q5+q1IH4dLPliFVUgovRe0r3i5aAimcRnhZpV5
	YHqN5NA0kS9QQ+K/dwC3vzmUzBMMkYUOEM0zuRL88JVKN3u6Gwv49r2KMSW0H8+TomO/l5b+0ig
	lvYLas3zH
X-Received: by 2002:a05:6820:4c17:b0:696:8b09:6c99 with SMTP id
 006d021491bc7-699980a957bmr426610eaf.5.1778005611625; Tue, 05 May 2026
 11:26:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260428-bump-minimum-supported-llvm-version-to-17-v1-0-81d9b2e8ee75@kernel.org>
 <20260428-bump-minimum-supported-llvm-version-to-17-v1-1-81d9b2e8ee75@kernel.org>
 <afoMRMnSQUwk1eaN@levanger>
In-Reply-To: <afoMRMnSQUwk1eaN@levanger>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Tue, 5 May 2026 15:26:40 -0300
X-Gm-Features: AVHnY4LyB1Xe5rlwokmTAGILipbZzP-_Kf8TGIx7tE8Zk3dE-DZnkJNK9pzsLsQ
Message-ID: <CAMAsx6cPfPVDBpL6wwHeqzWLqPwQB15pKgvgVu-Ni3Sjjkdf4w@mail.gmail.com>
Subject: Re: [PATCH 01/14] kbuild: Bump minimum version of LLVM for building
 the kernel to 17.0.1
To: Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 5, 2026 at 1:11=E2=80=AFPM Nicolas Schier <nsc@kernel.org> wrot=
e:
>
>> FTR: The translations
>>Documentation/translations/{it\_IT,pt\_BR}/process/changes.rst become now
>>even more outdated.
>
>>Acked-by: Nicolas Schier <nsc@kernel.org>
>

Hi Nicolas,

Just confirming that I will make the necessary corrections to the
changes.rst Portuguese translation (pt\_BR) in the next few days.

Thanks,

Daniel Pereira
Linux Kernel Maintainer pt\_BR
