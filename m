Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28F61494D9;
	Sun, 29 Jun 2025 19:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751224791; cv=none; b=r5zLZJS0Cba43KwSXLR2GY7PoIPB8sBFLcqY0XQSTZc9HoLyhZyFxduEZd8YK8Eeln+m9H+P575CszeVnx+KcTuEUANBlQ54EAY+oehXTFXjuPMOizaMdto6lYPKpDNcupgZeCHSuWYdpWn+oeAU+VqkVWx3a0GZ32ZdUz+APSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751224791; c=relaxed/simple;
	bh=fqvFj4fP57bdlkH2Z9EVvhU1TU+soWmoIpIUNeszUe4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mPXLdPKyaaY7s//G7UM/yLAmv6dN6WTiJAnpJS0OIyLyBj/r79etSHLd1bg15TQx1o6iQVT32Vpf0FgS5oi27nDr2UVy4iu3SaQkoBoD/psGgWpdGYTX/Aioa8DHiqAWAmUUrwjpYjuGBkV3Z0sSNwXfnq/RjnDzqZBPHBg3/YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ko8YAMuk; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ko8YAMuk"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-313fab41fd5so895001a91.1;
        Sun, 29 Jun 2025 12:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751224789; x=1751829589; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fqvFj4fP57bdlkH2Z9EVvhU1TU+soWmoIpIUNeszUe4=;
        b=Ko8YAMuk1Xmy5LjgXWF2d2VbjKJ96R8VRC0Qt9Eexng3o05EPBlqr6D1uKfxhXe20l
         PL78F3wMcfI+INVwbFdhiOl0DHKGqeEVkvqprQOQc5jrYkcGQqEYYWecSXNHqCRr2sA2
         z3MO0xePL148dlkjunoYl24vYskFDC/EtleFB33xoMF/h14jz8SfM0t/QiQtnBbWNKyS
         IQfrihHNgeqUW2gmhliQ/rIhnFfY2H/WnCS0zh3U0SRhi5DwX9GVx6YtI2/g7ynQQoqp
         U7MK6al/6veiv+bkZ0ncQZ1L8nKoGESJvWMT+ltIKQt79zayxsnj6puNkTl77NB1JYMs
         LjAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751224789; x=1751829589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fqvFj4fP57bdlkH2Z9EVvhU1TU+soWmoIpIUNeszUe4=;
        b=hUsONgIu8ZYMQHiU0jNYA5ij3WYsspcqajg6vDmiac6pLsC+gjFFEnFhjZn6qAY1jq
         BID3oF1ZgnIjqMYXq+fjdJaW4PIhi1zXCYuOVBNxJ16/mE7UH+qty0kNZZ8jVkescVPo
         4yXESgh+i2xK32i2F5plOJJEs87HeNbE+tgQ6E90Hk5F1w5FTgJDXBSH4E6D/KWKAn8R
         yzpU3ONpeY75o/+qx1xP1mOSEm8z4vaHxZB9mFsrLoIvesfR2AVIToaGRLqEtL4yoVNI
         59X8OLB06XGiPSfRqCmJvVvu3DQ3v8VSkEuRdqBMAzACpIcLCg8Ptrcqqr5VikcjAr/g
         +ENg==
X-Forwarded-Encrypted: i=1; AJvYcCUTMEfeZmCZCc51VBzlrW8vpncjH8BR9lrq8LxH7LX07H409XfEq9F8Wzp8GsihtKzrrjPPqg==@lists.linux.dev, AJvYcCXek6FEVZqeNc3PZLblFtj75vKVfhQ3mvj8kKamGchZFajujaswupYpR79WQvZ1RwdH3Fxgcfa09pyxkspO@lists.linux.dev
X-Gm-Message-State: AOJu0YzvpRf+xlqjTRBXjpEZc3IvorRBVey6UJkJdghRF52ta6cKqiXq
	zt1Mtm0xjHUFxnxKL9icwnv8N4PGn6rUM6LUkmRARwW1qW9DmXi5wKpJ4Nr62NRGYcZKKM7iV8+
	nKtV0tpNCQiewyhijbfe6HMDR+JYazfQ=
X-Gm-Gg: ASbGncu1QwdsPRGqyjLQDoUlaABvP+JBq2PX9bquiZUry1ow/J+dEJDXNITuWtMRqov
	HJJ6m6N+n7KmzJGLUDe6ESOrfKPhLtAoijZ5275QVm44VR10c++gr1W1jWKDefnHcfANSRx37SW
	JkLI/5xDfFHYT0/MdauNXkRGBnzoDYjY8FZb/XitxtoZs=
X-Google-Smtp-Source: AGHT+IHaVfsV20gbxGDGp7LaY+Szjj4MSE87ay8AXbrRlFNzSCMZkBxp3FxomgpoZ7gVrxtk8A6cpio/2KB/6lEK1OQ=
X-Received: by 2002:a17:903:1a68:b0:234:bfe3:c4a3 with SMTP id
 d9443c01a7336-23ae86b628emr36405245ad.0.1751224788949; Sun, 29 Jun 2025
 12:19:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250629113050.58138-1-zaq14760@gmail.com> <092f5109-ca31-4949-bda8-7e0d946c3aa0@kernel.org>
 <CAHp75VfoJ17a=3P3fXHa2mN00S+hdz-vRtLfjmsT7-+i2NfWEw@mail.gmail.com>
In-Reply-To: <CAHp75VfoJ17a=3P3fXHa2mN00S+hdz-vRtLfjmsT7-+i2NfWEw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 29 Jun 2025 21:19:36 +0200
X-Gm-Features: Ac12FXyWIHNh1JvbdxU6VSHhJ3heIYBUycyIfCLNs5T8MXPWmqc3XrvDjIWToRg
Message-ID: <CANiq72nu3KKovTfkoSofNX05ScvP83Dc2GusP7JJwWD1g2rbog@mail.gmail.com>
Subject: Re: [PATCH v7] staging: media: atomisp: code style cleanup series
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, LiangCheng Wang <zaq14760@gmail.com>, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, andy@kernel.org, gregkh@linuxfoundation.org, 
	nathan@kernel.org, nick.desaulniers+lkml@gmail.com, morbo@google.com, 
	justinstitt@google.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 29, 2025 at 9:13=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> Yeah, that what I was afraid of. I don't know clang-format well
> enough, but it might be that tweaking existing .clang-format in the
> kernel can give something better.

Yeah, there are some proposed changes for the config that I have in
the backlog, and with a minimum upgrade we can also improve it further
(some things just couldn't be done well with the options that were
available at the time when I introduced it). That is why, at least so
far, clang-format worked best for formatting snippets or for new
files.

Cheers,
Miguel
