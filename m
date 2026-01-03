Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD009219A81
	for <llvm@lists.linux.dev>; Sat,  3 Jan 2026 17:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767459716; cv=none; b=AqzYubKJFWSjUYU/i3ygOOj+WJJ5D20yNsDUMAIC1vK7D/h2skIlxEX/eODTx0QzfExGXvHcNQJ34koZj7FYxK60zYnT8bNbJxFSDE7hHUgsdatnrGWHj5RFUwllZga6TJwvBgABzFP9ldr9rHprQ5hGcMPXn0KDFF3wqIg4tVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767459716; c=relaxed/simple;
	bh=KQXl8jGs3GODk15tB6KTtrgOeAb6Hys26tY1ny9AYdM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GoHUtByf+Y5zMBVqhSAhrZbe9JAeOctI1I0DNdTFVrxKJ2XyuWsdAGQnYUIOq+itDHkrE4c6dkFH0+NGxQRg4QBA3pLmE1Ou7C+FHFfrZpzI+zPr7B4JZemLHgBKqR3y1PF+HJG11/EkJ+Hp3OcStxL8ZTumc4dJxM9YdNgS6Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QvZUmhUu; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QvZUmhUu"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42e2e77f519so7483775f8f.2
        for <llvm@lists.linux.dev>; Sat, 03 Jan 2026 09:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767459713; x=1768064513; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yHSQMnJBQHG3fEabcx1jHr7yPb3RERixhfZ5sKkWzqY=;
        b=QvZUmhUuh0bSoQtA4E1pjrGnHBBkDyK5GnOVDM5JmR4DNnxYT+UCj7Os0qZJ1/8/5a
         bEC/OsIZX0iv0Q2wEKupCzJEPicbcnLRwYWTJwva/MGa2R/KKW6l0FuI3mGBEjniNCil
         YFEOGYLhmsTgvt7hJoKt0gNEYxgBYaNxIlWY6arAUA8Ga8mQDDuZi3JhwfCYTx7MAp86
         c/XUA8RGtWBNJo9tqoss9VEgo7lvBTlcoF+pTCAKwdZcF1vTT77qt9c3TbEMkNO14kOc
         e/an/PD6433AEg20VdxkhQ6FvXB936bGT04KSIt8frD+NeM7kLZfVGBr8g7XlHqnPvx5
         6wAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767459713; x=1768064513;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yHSQMnJBQHG3fEabcx1jHr7yPb3RERixhfZ5sKkWzqY=;
        b=aQExQcze/okQAifR6mEv3ofcrsQzP0UncEdzek30nvGA1WMQ0m72Uy6Aj8dOEzxA3N
         CI/xVBZaGM2oY3B4yZkYepbdM1+a3cyDffxfwxExgZQYXvsV1mdQbbnzNmcKkCugBs4n
         FyM/Crf4443jtGgCtxxT52geCz8JvjrjkfVWh7WdfQedbiRvCjjE1E4eCfO1uNUFcfHY
         apA3uLJMRD2oIug5KUlW+h32OPy7WbcsFAjcpiUmG5w90/P3E53MWuraiwmLxExtWi3x
         c7RuADobudK60m5aAEEpw1N9vPTKLCdBZZFSzwfBHYmAbTiT2ZpiT6amhretMAH3R8xn
         tksQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4HlSiWcaSRJy+i2mMc6MVHva4rFG+3EODK/Tia+Y7QgF7UTJIWnN9Mc139nQMusaRPMHz@lists.linux.dev
X-Gm-Message-State: AOJu0YyHYeWCyUj+Z8in83CRcsXFd+uM0VKn+FnknsSOAhu1JOF4zjbv
	2ynJlNIEOeHEt5L8Gpp0UdMRQ1/33Nem754MZ6ZlmTMsJuHFieaveli/IgjbbFTA4rc=
X-Gm-Gg: AY/fxX5EOe+yg1ghgCjobP3TRi+SHkTPyRUlNfnBN9/4RVHSXwTDXbUk/WDI2JnsJDe
	jEBN8XjqOZiWaRhKRaR6lY4d+Rcw4xddmEyjzxQKSP7MK/V+4uDcmXlFoCpZLDJlEsRLFsEHE65
	l0B6sr2bh03s44Q2vFp0mE6lv/I+rz//W5IvYoJ8v45aVEcHJ22IGDa+/4QFjm5jP7S3A4h+7gd
	ZgI6dtemnwjzMtptcK3fwirQgRwLr+y3uefLqgBIAKLlH2SLnNP/hADD2AUdLsqoV/o1UG3frDd
	j78vjN5pmSTPi5Q0LSXJRvXxNmz/3E8dukKYf5yS4MJ2zsZWUQS/oeSDiNtObCJ3RMxjxQ7WUJx
	SG7NRW/rc1lMeaGTag3LMeXDAlwzf3fFlYULuWaf5YP0XTzpCJkZIblJD8vXcomyVorBzAOVf3a
	IM3gNDkxEdSBRVHQig
X-Google-Smtp-Source: AGHT+IH76r9upX5LgpHZ/fOST6gsEDX5p5oGk436/qE1kT4SAaRLVvV1SuOGoIs6C86iZ8FylfCo5w==
X-Received: by 2002:a05:6000:2c0f:b0:431:54c:6f0 with SMTP id ffacd0b85a97d-4324e4c739emr61327273f8f.4.1767459708384;
        Sat, 03 Jan 2026 09:01:48 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4325b6bfe88sm82459187f8f.19.2026.01.03.08.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 09:01:47 -0800 (PST)
Date: Sat, 3 Jan 2026 19:56:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Vincent Mailhol <mailhol@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kbuild@vger.kernel.org, linux-sparse@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	dri-devel@lists.freedesktop.org, linux-btrfs@vger.kernel.org,
	linux-hardening@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] overflow: Update is_non_negative() and is_negative()
 comment
Message-ID: <aVlKTculhgJzuZJy@stanley.mountain>
References: <20251220-remove_wtype-limits-v3-0-24b170af700e@kernel.org>
 <20251220-remove_wtype-limits-v3-3-24b170af700e@kernel.org>
 <acdd84b2-e893-419c-8a46-da55d695dda2@kernel.org>
 <20260101-futuristic-petrel-of-ecstasy-23db5f@lindesnes>
 <CANiq72=jRT+6+2PBgshsK-TpxPiRK70H-+3D6sYaN-fdfC83qw@mail.gmail.com>
 <b549e430-5623-4c60-acb1-4b5e095ae870@kernel.org>
 <b6b35138-2c37-4b82-894e-59e897ec7d58@kernel.org>
 <903ba91b-f052-4b1c-827d-6292965026c5@moroto.mountain>
 <c84557e6-aa92-42e9-8768-e246676ec1e9@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c84557e6-aa92-42e9-8768-e246676ec1e9@kernel.org>

On Sat, Jan 03, 2026 at 12:10:45PM +0100, Vincent Mailhol wrote:
> On 03/01/2026 at 11:02, Dan Carpenter wrote:
> > Thanks Randy, for sending this to me.  I'm on the sparse list, but
> > I've been on vacation and haven't caught up with my email. 
> 
> Welcome back, hope you enjoyed your holidays!
> 
> >I can easily silence this in Smatch.
> 
> Thanks. I ran this locally, I can confirm that this silences the
> warning. So:
> 
> Tested-by: Vincent Mailhol <mailhol@kernel.org>
> 
> > diff --git a/check_unsigned_lt_zero.c b/check_unsigned_lt_zero.c
> > index bfeb3261f91d..ac3e650704ce 100644
> > --- a/check_unsigned_lt_zero.c
> > +++ b/check_unsigned_lt_zero.c
> > @@ -105,7 +105,8 @@ static bool is_allowed_zero(struct expression *expr)
> >  	    strcmp(macro, "STRTO_H") == 0 ||
> >  	    strcmp(macro, "SUB_EXTEND_USTAT") == 0 ||
> >  	    strcmp(macro, "TEST_CASTABLE_TO_TYPE_VAR") == 0 ||
> > -	    strcmp(macro, "TEST_ONE_SHIFT") == 0)
> > +	    strcmp(macro, "TEST_ONE_SHIFT") == 0 ||
> > +	    strcmp(macro, "check_shl_overflow") == 0)
> 
> But, for the long term, wouldn't it better to just ignore all the code
> coming from macro extensions instead of maintaining this allow-list?
> 

Of course, that idea occured to me, but so far the allow list is not
very burdensome to maintain.  I maybe should disable it for all
macros unless the --spammy option is used...

regards,
dan carpenter

