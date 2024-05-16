Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5888E2C698
	for <llvm@lists.linux.dev>; Thu, 16 May 2024 23:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715903733; cv=none; b=V7xrsoDjSa65gcPQgYuExfP+zR26f8S9y1HsSC0+eCXWkTWB2/HYmewvgbpmQAvU/BQWv3dKXpcRPZXc1f6JLydSBZTMeueofVV7p/aNqrdatORQ/ne0/iZIAOYByiiM/xN3ZIewg4dLeBm8SFw2M+kOFPwemDvS1/g45Hlg4SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715903733; c=relaxed/simple;
	bh=4pwCjRrdKlshy11Q9Qidn/PkDr98ccPmPz4v2MD8UlY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K0Vjjwp16/gpQVMgCXxDgVneoMjqDQjmUX5m6acVNK6KvayOn11XpZ3QYPtaX2YGE34BUDs3aC8SEylkeRhUOT+MyA9IPz0pPPbMja5G4/DCGyDbMIaGS/IEPSSnrshH6mHAyZ+msYsDv3353cLCTkkvQP3b5QKMjA7tdp5SapA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MVbUlYLR; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MVbUlYLR"
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-481398a7381so1691218137.3
        for <llvm@lists.linux.dev>; Thu, 16 May 2024 16:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715903731; x=1716508531; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/gLVcqBV3F66KdisazNL7hONRkMphSyVVTtUEh3IZ/0=;
        b=MVbUlYLRo3jjsBXS8Fcm41qmaYmxeirOeZXE2gNbykwL97ac80jEH9S88IZzU/OIRI
         7sdFz9s5YIDQr0pKrBz9G7HFAXl/alt85PFb+Pcl9IQVKtlN72ldQQVyb0i8KPRCxzM+
         TIIm4jD5J5ha7QdAsSBfZReCvZs+mdn14dvZtJuFbbIwNFEdcP3CiI6ShofK4CTFZ3BG
         SHJA3hxjfZxFtlvJfhNddg02z24S1x/PNcjV8SxKeJ4We2wGWAcGZ7niVFRbYVtmDuNi
         NOkgdOW/SEPOC3kLde0L2m4UJx1q1/1+7LUGhd9v4M3lAIkUXHINfHIMWukxvV0zOFJw
         hWrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715903731; x=1716508531;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/gLVcqBV3F66KdisazNL7hONRkMphSyVVTtUEh3IZ/0=;
        b=JobjWUVTMJ6K2HDVrsb8LdRSc+YOJKxSF2rrpXaIMaSNe9hxste6ommrIEgz+XJvb3
         uY5f9R6cpLM9xGJNN2fMimmfgx35M0I3hCxft3P9uOvm0nVUgZgxMYId65/4sqBvM5Px
         P0TbhJxuOtZ0e4i9NjmPxeg/US9G6e/1WHzghC5HRVgxzS+TWEJIGBdCY1WpOtSsfZcr
         JQkmotisaIGmOyEL0yn1X3yVR128xC3iNA7WBqo9Ix3KtyPf11ceFtL7edikpUzY5P8z
         JWePi1NQ097IC4mDZovnjA3XLf04KpvTCkAVxvCglgZrepgw3W/WdClhPX15LqwKuOU+
         APvg==
X-Forwarded-Encrypted: i=1; AJvYcCUkuDlfAAuwhGrZXOGvB1QONuAMaXkUbinfkbWy9fj6BmjqXx2E1Mhm2giUZt+LQBoHYAZWul7s5dzJ2w7ECsjKh5A1Yw==
X-Gm-Message-State: AOJu0YxJGWZ/zaCkuh6NYP5taEgGmNAk5Z4nXUA3UC/kP0nbXhe0+NZr
	gGdDbWS+94saiONN2tbAJSA30ys+Mye7kCVUWPztrzEk5prAg/l44icVmNON1PrVdXrDEIvg6zY
	mvMFl9SLxHwYz6sjl+bxJxwqXVV0ak0dC7akK
X-Google-Smtp-Source: AGHT+IG+/22HSGO1aEWyeCTPHI7nYt0GiaqCsKk1aiSbOHC0OUQTiWABWrFf6IIzcykO5qWDSD6ZOxcp/txXENrYfSk=
X-Received: by 2002:a05:6102:5089:b0:485:9a12:cae with SMTP id
 ada2fe7eead31-4859a1210d8mr3163573137.21.1715903730652; Thu, 16 May 2024
 16:55:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240507-b4-sio-ntp-usec-v1-1-15003fc9c2b4@google.com>
 <87v83gllv8.ffs@tglx> <CAFhGd8p94sHpDc8MApZK7q9iEQ_C8c5frwZx9v_bTnhwtAM=HQ@mail.gmail.com>
In-Reply-To: <CAFhGd8p94sHpDc8MApZK7q9iEQ_C8c5frwZx9v_bTnhwtAM=HQ@mail.gmail.com>
From: Justin Stitt <justinstitt@google.com>
Date: Thu, 16 May 2024 16:55:19 -0700
Message-ID: <CAFhGd8rTHPiKG+XOkkUihj9r8k1=n3zgitpM9X2aQf6zhp9psQ@mail.gmail.com>
Subject: Re: [PATCH] ntp: remove accidental integer wrap-around
To: Thomas Gleixner <tglx@linutronix.de>
Cc: John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 16, 2024 at 4:40=E2=80=AFPM Justin Stitt <justinstitt@google.co=
m> wrote:
> Isn't this usually supplied from the user and can be some pretty
> random stuff? Are you suggesting we update
> timekeeping_validate_timex() to include a check to limit the maxerror
> field to (NTP_PHASE_LIMIT-(MAXFREQ / NSEC_PER_USEC))? It seems like we
> should handle the overflow case where it happens: in
> second_overflow().

Or, I suppose we could add a check to timekeeping_validate_timex() like:

if (txc->modes & ADJ_MAXERROR) {
    if (txc->maxerror < 0 || txc->maxerror > NTP_PHASE_LIMIT)
        return -EINVAL;
}


> Thanks
> Justin
