Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096D22EDD7E
	for <llvm@lists.linux.dev>; Fri,  7 Nov 2025 19:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762544780; cv=none; b=minufrxxZAZvBLfL2D4W2DEkITD5zqrGlUQot21CjQMFDKQ4eqLB33cvYZWM7S1xGJiZu9xcPqOqtJPCkTtputNqjutsNeut9VluWlN54HmUFbYDSsk6GO+9cMgq46tyvdQYcYPdvk1rB5K1nZgv9/b6XTaIrFZDmoCrtdcTbJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762544780; c=relaxed/simple;
	bh=xlbuM6n2MymirkUEI4+i0kiqs8WPB7VoMaWqQpvy9Qk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pXQVH2O23PMhkEFrruGH7LB3YmKXBE1pF+xeXg/n96D14ko1Bw5akUXI2NslfiHVT3QH0fVITLRUq7b6yBsY+hp2eHylKs284F8DjbiwAgFmwx1pOQyEQ4JtH7IIn2of2OykL5umvHayROrHHriHm8U18x/f97rLoy282IXFvB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BjFiMWJq; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BjFiMWJq"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7ae1c96ece1so156541b3a.0
        for <llvm@lists.linux.dev>; Fri, 07 Nov 2025 11:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762544778; x=1763149578; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xlbuM6n2MymirkUEI4+i0kiqs8WPB7VoMaWqQpvy9Qk=;
        b=BjFiMWJqtdDVhfQe6KDQ0BiH52qpwABGZUYetwh9kc1rZmuKKRNdn9W67wArTgloJq
         kWghHVFmfPyStiWwrn32Ehq12y6WIm/AVpI6lVOpuIOkn3VS2zoM16oY7X9P8s/50uyY
         LDFex8gWNJ7e6SNwDQbPpL74sY0XnLeKjyPWS4/gJgHw8S7GfHQSCCW5N19cDvURXtpX
         RQhkfJeIDEO3W/IgauNXnmGvGW8UqJjzL+MYLxG/GOsPoyPJv+9anzSMbK/7I/ttYxw+
         vfIVEt2didV/vn4UJmM68A6DEfAK6R2GlVmmIoHinjMpEoKeKi8Fj/pOO8a7pRsFULWl
         58Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762544778; x=1763149578;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xlbuM6n2MymirkUEI4+i0kiqs8WPB7VoMaWqQpvy9Qk=;
        b=w3hfSuyudbd2js+LU344GFws+Jng2/c/YRXvZny3AmlCX5oc6Ct7FDzqFZwGRATMQg
         fumHDHTy74NEPsr0w8uqmbf1X/+6XwBy85nGJZWAGW2DTQOpGDRfGyLdQyHzrDJJ2It3
         SW0cUUNNuIjWKGQBHJ4zPKQo/xZZfAaWzOFW2BA17g06qimoqkaUZUsRaa+q64ihvwU3
         1zJJ8eBYh6MBesER4QPSkQSn933/GpgF5TmqMmJ2/DguO8m9hSdTsP5x7syqs5xWqSc8
         //c1LAmNwbu3Bi00Lzti81emGxlKSg8Fi2jXQKM96muDkICn9IOqd02TAvwMAteTgIPG
         t9oQ==
X-Gm-Message-State: AOJu0YztzM9xIckx2C7rL9ZQQu5yALAzA/1MUIE1E/Bppff2xPl2ONbb
	mE9oNnQq7inah1AdQrpyCc7HI2NIzcQyHDH1vjVpYWl5O0FOHZQM7vI0pFIkjE4XQJHebmCINJv
	4NSAPyb2+Wf5OyjKilRGGT3sj6i+wZQE=
X-Gm-Gg: ASbGncvwJEpeTVM9xNrzOUTiHsdRAb1G6SVZiQ/D/x0UUEsZ4QxdsTwrcAxUbPkxhv7
	vFaxCuLY9/W5uLwaKGdISblY98eh/CSUcuY8yC9wMSwCyvhLe6TBFjVB2U6oiHg+tBo5bhAP3SB
	xYSOFQ9CiIKX1WsOBsrW137pQMqEdjS1k4nq0eHoF7fFabakkZ/NHFxJNIhhYNMFyTSM338nVG0
	zJrEVOEAzTzd6kNglkPcIR6JbfcWa6vow9dcLtVtBSyESUw/woYk9dzoCCqtb+f1++eoOSbroiF
	R+ycwl8HEyoGH1TRBQ2VWh/i+uk8HAAKN5FK3l7jKqz1NLi/gXppm23oPGrk5gkNXED25um0S9+
	Odos=
X-Google-Smtp-Source: AGHT+IE7GGqiPMYJY69OvQG1tXrUrVynmdFgHO9eQgrcVeyOxAYAmEo6aaWBKd95h2Y7en2cXbh78NdxU/R3ZyPuRy8=
X-Received: by 2002:a17:902:f683:b0:297:d825:bf22 with SMTP id
 d9443c01a7336-297e56831acmr1668265ad.5.1762544778161; Fri, 07 Nov 2025
 11:46:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251105062723.GA2341496@ax162> <CANiq72k3WuXTyk-X1ye+7JThf2pNcgdKnqOrFieHqxOMZD2oZQ@mail.gmail.com>
 <20251107193252.GA3606140@ax162>
In-Reply-To: <20251107193252.GA3606140@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 7 Nov 2025 20:46:06 +0100
X-Gm-Features: AWmQ_bkFFxAHKXpnyt_DOx5JnE1cyhg5MaZF3Q49FcBJ-_O8h6HQrHup1Xi97io
Message-ID: <CANiq72=3aPM08LvtRpizzYZ6EPw+dsy7sdSWZj5Q5Tkgv64zaQ@mail.gmail.com>
Subject: Re: Prebuilt LLVM 21.1.5 uploaded
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 7, 2025 at 8:32=E2=80=AFPM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> If 1.91.1 is coming soon, I will wait to fix this until then.

Yeah, no worries at all, it should be out soon -- thanks a lot for the
quick reply!

Cheers,
Miguel
