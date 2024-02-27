Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C00113A87C
	for <llvm@lists.linux.dev>; Tue, 27 Feb 2024 12:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709037170; cv=none; b=NrPGVZ1SOh8ycZBaXqdMh3JO/rs5VzTx1aaI3/H+C2X4llc72C+HXhdEXOzNQR7YHy+9HV/mCOiwRpUsKSDJ3bbd8WCHZSil3lHjC74hIvclF4256H9GD2n0nPLmNfmCqTdY/rV0culXLwDkuhIQ/PAedapEpQCZLmv7/XaKBJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709037170; c=relaxed/simple;
	bh=PSjXZXB/iL1gAI7UZkVx6aFnFooNh3+sIUM9+ah4aho=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ogdDdT1nVc5/EZwK6LVz1iCVxTpr+xRFY06kl1Z+AS5xyaD6kP7FkZWLbewmoEAbrrAt1VeMXe0tKiIB9EzjENSZgHcTeDYywdrMqdiFNTBur57qAq8395xnbu/Y4R7vE+l581GVr9blifHYaeOor6f4pMZtjiIl0U6GDWS8JjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U5tMPoey; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U5tMPoey"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1d94b222a3aso42764185ad.2
        for <llvm@lists.linux.dev>; Tue, 27 Feb 2024 04:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709037169; x=1709641969; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PSjXZXB/iL1gAI7UZkVx6aFnFooNh3+sIUM9+ah4aho=;
        b=U5tMPoeyE3vcWKiiZZ+AFSTN4XZFpHSJPbee2Slk+vZm3CMxdMUB8WRJteTJNsPMvO
         otS0h5iMiHH2VKO8T1WRpPY8+nYVnDBZEGEXVxPuWPH3H4S5XycZMXRuUArFgUP2mEQT
         VrbOFJPZwfme+OCcgRGNIZWC4OY6zRCj0oVmn9QKyohTUlJdYHp/BUr6ilWmK+UezwTr
         86gxC5qAWHuA5ce0XoQs3Lvhq+Qaa3XsR7hcxDgPtBR7HyMu4oBRa2Xv8w1BDqG6hocA
         Qwjel0g0tOImZolcfdHY4XNy8cK0EzW5wmC2AfmlVpNXhNyG9JWutA4WYYJTjISrZPCl
         nlhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709037169; x=1709641969;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PSjXZXB/iL1gAI7UZkVx6aFnFooNh3+sIUM9+ah4aho=;
        b=I4sP3rg8GlBsh9l4vlIv/aVdC0EMZke60akS80tn2hYEh48gG1JoyKHa5XJ9w+vOvl
         Elkm5UtUHqXetn6TghYMAV1QhIm8I7bsGMC+nOdC8UhVY8P3zIPSL4yuQL25E5DJYN4U
         83TFpBK8IZ47jv/us1H1lNWLoCX4AufQ8PHHethx/jgqrEGgiatsG6l/DHt0ruNz3n3E
         A3BTHLiQqzU3S/8UqTd8fVio0SLVFoxHmyWblcAqOQQyCSQkSH47/njh7M54mUX+kyTZ
         oBl2+swDECrtAir5GNr9t5LIMOKfNvMYkTWqy23eHTt+05henSmcLeU1h4xiRmUd+mhI
         HsvQ==
X-Gm-Message-State: AOJu0Yx/YGSqDt+1jwpcv+XTSojBU4hXP5IsPn1DiWswN+x4qvBOI8Kz
	gufnp/al/KDmZ9+wUa93AR/Q+UOCRNx1xjTsqedEkjAyRXv4Hnn3ocVs28BorRCacGpUNHxV3wH
	ulLLmEjPRxLn82qZL9Ca7gVz0z94=
X-Google-Smtp-Source: AGHT+IHfI3z9dNBjP91sqj4IoHTWC6qMdTEdL9kDSGMGF49QjbxmXnVai+skXGLKaxzrzGUXuOCsBa5iffEE67iRjUA=
X-Received: by 2002:a17:903:2b0c:b0:1dc:bb56:9d14 with SMTP id
 mc12-20020a1709032b0c00b001dcbb569d14mr1519244plb.41.1709037168850; Tue, 27
 Feb 2024 04:32:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240208002841.GA2601476@dev-arch.thelio-3990X>
 <CANiq72=G--5LW-9sg2PscTL863mFVNdnX7LUQX2Xj02qZs4crA@mail.gmail.com>
 <20240212234850.GB3221859@dev-arch.thelio-3990X> <20240213025303.GA4006766@dev-arch.thelio-3990X>
 <CANiq72npYCD-zKqcXPNOAxnKiUCCXGbFQaGo-8=0-171ni+ncQ@mail.gmail.com>
In-Reply-To: <CANiq72npYCD-zKqcXPNOAxnKiUCCXGbFQaGo-8=0-171ni+ncQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 27 Feb 2024 13:32:36 +0100
Message-ID: <CANiq72kcQUuxcno00+QWrstrcfwC+2_Bvh+8dr5kgVkEtrWOEA@mail.gmail.com>
Subject: Re: Prebuilt LLVM 18.1.0-rc2 uploaded
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor@kernel.org>, Conor Dooley <Conor.Dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 13, 2024 at 9:37=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Thanks Nathan, that was quick!

Is it possible to add libclang for the older toolchains? Or are they
supposed to be immutable?

Relatedly, Connor reports KCFI not working with LLVM 18:
https://lore.kernel.org/rust-for-linux/20240227-uncertain-amaze-6197e627ad9=
5@wendy/

Thanks!

Cheers,
Miguel
