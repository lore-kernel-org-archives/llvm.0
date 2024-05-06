Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DDC158855;
	Mon,  6 May 2024 18:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715019008; cv=none; b=LlEBuQOib5uRamPRK0lx45P0cIcfn2T+7poOy+sm38uF1BCGo1iOTVW2kvZqAj9Q+3+BZnHRc/u3aORdTImdGPOh0jhTiI5WKKxWv9hYEwugubQLjkA87pnpLWAM3AD+IdMC2rNE077hmNDBeaFc+LfMISfRtQPGgSw1Uvp0mE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715019008; c=relaxed/simple;
	bh=3YT6GoTBD5RTJNZvjWe/gTCDSC9xyl71eW2q74FFQVs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uoeI5ymqGqfacjwplUmJZI7vjnDkKI7DVFgYV9KVK1TJu1FQrNgQAB/mNEbiEkVWwD07Q6IJbikFiXmzJkebivsGLCNFa5c22O/X1a89Kq2DD/VqORGJSGkaKSkD4Zd/wjFeLzjSRkGt/qYe851FfMjaD6404NPEfAB9u9Si2IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mqtkuh1d; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mqtkuh1d"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6f4178aec15so1930314b3a.0;
        Mon, 06 May 2024 11:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715019006; x=1715623806; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3YT6GoTBD5RTJNZvjWe/gTCDSC9xyl71eW2q74FFQVs=;
        b=mqtkuh1durqrUG+APkS3E/ujmaHHWiRYaHqM6UPLXxvrEB3fr5SzlxykTW7RW4DiqD
         /6pmijKjxHPKGsJpVgOeC/VOP+3nej9gIBPg7GOPf7sUtovwNB7w8O5ZX9HFbB95I//3
         WZBOoKv7CIEtSS+yHf4ooNhU7zmh1UJ13rVTGoOSbJ9QepYI7WW6hhPCga20OxoqRQzW
         BW9cNu/6HyBed1x7N/ZDEoM8BJ4ntyHonISPuornb5L/mHxEAjddyKoIycJFcBy7ED9N
         HWAUavh+5cEKCKEA9LdHo6XuokbawGbAbbWWuwbykrmbIoML9a9yDLFZNCkfKMKA0arh
         c5LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715019006; x=1715623806;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3YT6GoTBD5RTJNZvjWe/gTCDSC9xyl71eW2q74FFQVs=;
        b=h0ce9Godo3UTapZ6pXkcmolcrpl2DjSt4CY7o3QUE8uVvjSnZwDu7aw6i9wAp4A8XF
         mW52gwk5VKV8HLSERzR7wXure6rIBDSAdBzspf++VlaZ+sw0jNomk1vhLvCUyisPhD5Z
         U9SvaUe5XgV++xS6M/lYMie90lFBzOs5yG8nY9++ul0vVTdsqnhoJys+cbDOd7XJ/rwP
         Q0pLvQWErypQQp8IbDMD8oQxvwM74J83geTPe4AYK3R1/5A2Je28lmf4zh/5LdLRLid/
         1RS6NwG5PEGBdzXbgakfSC/E+jobBLXnZfyYhxnSrr8a0mAKV0qWF/3lZrGQx2H1lnN1
         I18w==
X-Forwarded-Encrypted: i=1; AJvYcCWa7pol+tTDo515V4li1eA6zzD+kQt7CQ7stWRKzL9MLJv51Bp3o5IlyYO2QIuXIQ/IaOoxcJ/+iKNCVBO5mwEgl1+LwrWHAaOMfUTP453efWLrnEcZ0qVYhmLSnNn4mzU/PeM=
X-Gm-Message-State: AOJu0Yy2ql3sOShSBg3F57IMJkhHddaCdV17tfbr3Qrnz9sq51ANPKei
	4GtfJUGZG2daNSphzT2En1iyQGv4CrswFFVz4GIL0gjN4YUcJd92LXBjZNcGMutd5Z6gsCIoQnM
	hW5mxS63/KSE1ydyLL/GogpeEQjQ=
X-Google-Smtp-Source: AGHT+IHX8PagyLuNaCOkfS7Kj0znlYabXOvIdJsimyqynpZ7zYWizoaX3k9aFYgI/STGAH4BqPszoOW+tPGykBsBRdA=
X-Received: by 2002:a05:6a00:148d:b0:6ed:d68d:948a with SMTP id
 v13-20020a056a00148d00b006edd68d948amr12160424pfu.23.1715019006151; Mon, 06
 May 2024 11:10:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240502092443.6845-2-visitorckw@gmail.com> <202405030808.UsoMKFNP-lkp@intel.com>
 <ZjQ/JOpcdgWZXo0y@visitorckw-System-Product-Name> <20240503041701.GA3660305@thelio-3990X>
 <ZjSSylciH+qJeEEG@visitorckw-System-Product-Name> <ZjSUk4vgsQ63wfcn@visitorckw-System-Product-Name>
 <20240503155401.GA3960118@thelio-3990X> <ZjVdbavKgDo8a0CZ@yury-ThinkPad>
 <20240503222338.GA1908482@thelio-3990X> <CANiq72mJPPp=H6qb7sG1K1hxR3uiHA9+WEVAZkvymSt_dW3CbA@mail.gmail.com>
 <20240506175209.GA1425562@thelio-3990X>
In-Reply-To: <20240506175209.GA1425562@thelio-3990X>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 6 May 2024 20:08:41 +0200
Message-ID: <CANiq72=mSafSJH1hab57LxYfyj_BD7UOtyAerOT8S41MD-MnAw@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] lib/test_bitops: Add benchmark test for fns()
To: Nathan Chancellor <nathan@kernel.org>
Cc: Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Kuan-Wei Chiu <visitorckw@gmail.com>, kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 6, 2024 at 7:52=E2=80=AFPM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> No, unused can be used with local variables, used cannot.

Yeah, sorry, I meant `used`, i.e. it is that one the one that
constraints the combination rather than `unused`.

From a quick look at the links in `compiler_attributes.h`, `unused`
can also be applied to types, while `used` cannot -- it is another
difference, but your sentence above already implies it anyway. :)

Thanks for the correction!

Cheers,
Miguel
