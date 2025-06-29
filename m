Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE0823F43C;
	Sun, 29 Jun 2025 19:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751224307; cv=none; b=F5t6dVNI7tBuEBaWDAXhSLlNwPZvx5HwmUzZvjMSbj3fWBBVM/myGYBpsU6rxVVJ1nEwfW0YWy6TF2iR2hbZ01+VIreJCv63K7MuzXE5oJBB7n3cGMW0gbMbAOkbFxA3HtCml+fsCjhFexHqOKr3vEVbSpVafiYsiJMlbkH4eCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751224307; c=relaxed/simple;
	bh=KIuW9sjx4dcbvHL9RVmzBjBUM3fm9MxRJEUqHt3Why8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NLN0i/OYS9ab/5K14UpiVcuhRSOtu7G1vgUf4s5ai2bYIZIv92WSahbtetyTBGe0DiJ3QJNUo3QIIpC3uCoo3p2OHp03pgtx44vt+Drc9qxjz+dbK9kYYhIl92iYGN0MaLi5O/eM9XPtazSuST8kF0Hv0NPt3wU3dzu6lZrqJ8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=If/DnJNp; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="If/DnJNp"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ad572ba1347so211576666b.1;
        Sun, 29 Jun 2025 12:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751224304; x=1751829104; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KIuW9sjx4dcbvHL9RVmzBjBUM3fm9MxRJEUqHt3Why8=;
        b=If/DnJNpUZuxQGomtsAHKLwY1MGQztMR05xVcQ/L+4zQiBAb6A9BrlbiW2HfXaNl6O
         fO+NmAcIj+SrCe+pdnKN85AGjOmei0DZ/JxYzi5xAUy6a+n1nzQNQBuMRJLPJKJq25lD
         AsEowx/V9YQBO7m9l+a4mXnrkyAUPdxosfG5U6rDGHFlH23sCBX3TPQPcpd2ZRBvR1yO
         enZORkHdoVFYUMzw6pM6jgZhum8r8imEnndsWmm2Dp2Iqx9YxdKJA4be51vkUq5bkazB
         6VKHCrDW/OVp8aNBwcDJKGtkOtk4p1ui2TxajSkWpxIm8IQ64FjF2r6JlQTvTA9j3oSA
         jxgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751224304; x=1751829104;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KIuW9sjx4dcbvHL9RVmzBjBUM3fm9MxRJEUqHt3Why8=;
        b=Vf3xJm4IlxZA50CbBnqRmSsS8CCSNrsg8HEJYbv+vDoOv9WC3TM0cVeIAahtxhI6cH
         lNNX+aP+q39is3+/YbOsXnO6czqn1mTwgfAkS6LNxOwk28kor72wqTn/1UaddpQDgEZC
         pFOxMLLgpdmgmXM/ce8oD7fHF2Q6kKD1ZBW1838Qs7t67DGCBdmiwBgu+h7NAI/DfuRp
         Rwpyc3SS/EZx+jTQs9jf/vIRH/2NoWEUdRyXdEGPB7/JAYMPxjHG68Ha8Agh+pEvKheO
         60CimpWJ6T2JekxT7NiFgbLWqu30jley5qi7BE5TfqWAX1ueCCoP8QazTrWYAgKOpW5P
         JJiw==
X-Forwarded-Encrypted: i=1; AJvYcCWS95YzgqKdstLM6vEp0ODjeDeMmXvtOXRpcd/g1mRtR7jd+vUqjhLkRtNib26KxNaOOqsiFA==@lists.linux.dev, AJvYcCWWSTwK4pz9KUuvyAAi4EGbEEJQYGJv9P9fLp1xhS1oxTSur866i7JX3NiMqHIktmgThYB9NCemZHY/3Dlw@lists.linux.dev
X-Gm-Message-State: AOJu0YzkKVeHA83BYFyBSXAWKyoF7i31gIxpT1kWOKHpnf8VC/kEKcp+
	OX03mcqgxvo+mKS8sqxmqKw+Xu6/5aUY3sTLIGTdyvqS9tWic1VepJsniXKvjm5C63Ph/Slo4/j
	3A+DSnTHzCP3z+Wzr6Isu9v+FXmjXirbGmXVDGXQ=
X-Gm-Gg: ASbGncs3BQPb0g3gUVWsmmdZkd6kmCa1oaA24+XavS0Jhv1Vdsj32kX715ToteWU8cO
	AOrD3dA/ViZAWNB5NH8GguuKJjLikyDWc35vb6qx7hLUjXGoPcbG8v2rmMd2KYsb9HcxpKIVZxq
	SGFvevHWtBiQHK21y0XzO0iAmkKtiPNqx44OuI6PyHKAE=
X-Google-Smtp-Source: AGHT+IGe/ajxK31MAPrFTYR3q3cl77r0rWbJzrwAwVbOdmeARB/jCZaAJCpV0Yy/6WYPlbf+AudWc2QhY3x7eVnHktI=
X-Received: by 2002:a17:907:1b22:b0:ae3:6744:3661 with SMTP id
 a640c23a62f3a-ae36744387dmr617057066b.44.1751224303820; Sun, 29 Jun 2025
 12:11:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250629113050.58138-1-zaq14760@gmail.com> <092f5109-ca31-4949-bda8-7e0d946c3aa0@kernel.org>
In-Reply-To: <092f5109-ca31-4949-bda8-7e0d946c3aa0@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 29 Jun 2025 22:11:07 +0300
X-Gm-Features: Ac12FXyOA0o2IpCk1vTrAEEanA2XeDyWAwBQtiRP0ln3yoGv0i-yIsp9xk2rAb0
Message-ID: <CAHp75VfoJ17a=3P3fXHa2mN00S+hdz-vRtLfjmsT7-+i2NfWEw@mail.gmail.com>
Subject: Re: [PATCH v7] staging: media: atomisp: code style cleanup series
To: Hans de Goede <hansg@kernel.org>
Cc: LiangCheng Wang <zaq14760@gmail.com>, mchehab@kernel.org, sakari.ailus@linux.intel.com, 
	andy@kernel.org, gregkh@linuxfoundation.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 29, 2025 at 3:20=E2=80=AFPM Hans de Goede <hansg@kernel.org> wr=
ote:
> On 29-Jun-25 1:30 PM, LiangCheng Wang wrote:

...

> > Changes in v7:
> > - Split previous monolithic patch into multiple smaller patches
> > - Applied clang-format to entire driver excluding i2c directory
>
> I took a quick look at just the clang-format patch and looking
> at the bits of the diff which were not collapsed by github because
> the changes are too big, it looks like the changes which clang-format
> makes are useless and often make things worse, e.g. just looking
> at the first diff which github shows for:
>
> https://github.com/lc-wang/linux/commit/8a3bbdba275e42dfcb0af2ddcc2f27463=
bb316d2
>
> which is for drivers/staging/media/atomisp/include/hmm/hmm.h
> then all of the changes are undesirable and unneeded.
>
> so the running of clang-format just seems to make things worse.
>
> I appreciate coding-style cleanups outside of the i2c dir,
> but it looks like you need to do everything manually since
> clang-format is just making a mess of things.

Yeah, that what I was afraid of. I don't know clang-format well
enough, but it might be that tweaking existing .clang-format in the
kernel can give something better.

> Also if you do manual code-style cleanups please do one
> type of cleanup per patches, e.g. only fix indentation
> using spaces instead of tabs and do so on groups of say
> 10 files at a time to keep things reviewable.

--=20
With Best Regards,
Andy Shevchenko
