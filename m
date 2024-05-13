Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861893F9D9
	for <llvm@lists.linux.dev>; Mon, 13 May 2024 18:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715626301; cv=none; b=bG7jRP7PyW857tGHRPy2aHCU2Wg2GDjAZO4fy6Ys8msUM26o0asZ7D4WxOMV8UouUlPFVVJ3ttRUOyoZo5V+/KIBd4Gt43aqjtvfx5sioz1eW3pQ2cpIEC9DiX1D3bxrrwUByk/I87rxzzGClY9i4OAC9MBVigpaw2cpHFjiYNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715626301; c=relaxed/simple;
	bh=bvx6mCnzX8C2T7z/ykshZS5xSeo3dI7Pp2H7YdnXt/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d5tYrMtLbAld3MLNpHfZMKbZ7u0D+RQiYYfAThTyyFV3MVopXbhz2myrkbuwZofUaCWrXYFSE4hTiH9dR/JGZwm8sdwAAmbcEqL7Vh6XkoMtMeW/LYj+iSsqChR5AT6mBLRa97DBuzfRqjj9D5poZ2omuw2oUv2wVCK1armRFgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=oels9BeF; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oels9BeF"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-5b279e04391so2639760eaf.3
        for <llvm@lists.linux.dev>; Mon, 13 May 2024 11:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715626298; x=1716231098; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uyix+o2/yzI/teQyeT3mBLMMtNsSET+xVm+DqXsTGyI=;
        b=oels9BeFv9rQvsgWv8rG0UTSFLlENk8sMVUY4nWTPascFssStJ/yacIvHmoYmhooxS
         nrnG3T6RpvCOIMWSo+l2wVKIZsOnOqTzSzmK+0OpD4Ymmobg/aX2TCGcZ1ynWQs6x8k+
         WqWiQGy1HzJ67KQq6zR+fYVcMwnQHX5v7S3OA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715626298; x=1716231098;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uyix+o2/yzI/teQyeT3mBLMMtNsSET+xVm+DqXsTGyI=;
        b=G7HHkXOto60urP3gp78zqsKOYno1oKD7Mk/d1kdxz44/Vu6Wz5bzC2AdBtaw2+pn58
         mm7v5jTS/lE5kjgy9R+DGMmorkANyJdOOE5IlKOFmANnpKKeMhYMo/guBF54cNoheJ8n
         8iyBhKudr9PkD0E1uaZDs7XQEmSyzma2JBYhIDNya1er8B1EDGJJyvfLKsQyyHuGvfT/
         SL1TZ8ipUsRq/8bjn/461I9cMhoqZxJpkk7p8VqTrKyNkZ8aCBJApc/cLY9ThVar0lAS
         RZs0s7xxx9AyKWaZgBW0Id096T73t30PgCbZtfvOwkWmuklK2HtYRZWIn3slIDHN0e3x
         mwRg==
X-Forwarded-Encrypted: i=1; AJvYcCUdD0fOAW371INNs4d0gYngnZmVpnupk9fFIkp0AvfzxZ6OT/0LSN9NV3MFIEj+HyoeOskoPFAsgHtJ2MbM1jBF986qhg==
X-Gm-Message-State: AOJu0YwogJjQVc+w9Zo6sO0Q19sKO4e267fJiXXO+SQvCxg+4szsBjo/
	6Joq/0r5vCB4LvLayJIQC8RxyMi5TwRHMT0tzQdiVt5sRP6w22mQjIU+SuhukQ==
X-Google-Smtp-Source: AGHT+IGv1B1Gx2wKtJWfijbWmucGg9LEe4iuF9AOrXx3x9zQT6qPe6BMe/LLFnyboO/EG8WWyTenMw==
X-Received: by 2002:a05:6358:6505:b0:192:5b28:1ace with SMTP id e5c5f4694b2df-193bd007a1cmr1186924055d.29.1715626298112;
        Mon, 13 May 2024 11:51:38 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-634103f6982sm6959074a12.60.2024.05.13.11.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 11:51:37 -0700 (PDT)
Date: Mon, 13 May 2024 11:51:37 -0700
From: Kees Cook <keescook@chromium.org>
To: Erick Archer <erick.archer@outlook.com>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	"David S.  Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v2] tty: rfcomm: prefer struct_size over open coded
 arithmetic
Message-ID: <202405131150.31B872F41A@keescook>
References: <AS8PR02MB7237262C62B054FABD7229168BE12@AS8PR02MB7237.eurprd02.prod.outlook.com>
 <d11dacfa-5925-4040-b60b-02ab731d5f1a@kernel.org>
 <CABBYNZ+4CcoBvkj8ze7mZ4vVfWfm_tyBxdFspvreVASi0VR=6A@mail.gmail.com>
 <AS8PR02MB72379B760CF7B6A26A69C5558BE22@AS8PR02MB7237.eurprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AS8PR02MB72379B760CF7B6A26A69C5558BE22@AS8PR02MB7237.eurprd02.prod.outlook.com>

On Mon, May 13, 2024 at 07:12:57PM +0200, Erick Archer wrote:
> Hi Kees, Jiri and Luiz,
> First of all, thanks for the reviews.
> 
> On Mon, May 13, 2024 at 12:29:04PM -0400, Luiz Augusto von Dentz wrote:
> > Hi Jiri, Eric,
> > 
> > On Mon, May 13, 2024 at 1:07 AM Jiri Slaby <jirislaby@kernel.org> wrote:
> > >
> > > On 12. 05. 24, 13:17, Erick Archer wrote:
> > > > This is an effort to get rid of all multiplications from allocation
> > > > functions in order to prevent integer overflows [1][2].
> > > >
> > > > As the "dl" variable is a pointer to "struct rfcomm_dev_list_req" and
> > > > this structure ends in a flexible array:
> > > ...
> > > > --- a/include/net/bluetooth/rfcomm.h
> > > > +++ b/include/net/bluetooth/rfcomm.h
> > > ...
> > > > @@ -528,12 +527,12 @@ static int rfcomm_get_dev_list(void __user *arg)
> > > >       list_for_each_entry(dev, &rfcomm_dev_list, list) {
> > > >               if (!tty_port_get(&dev->port))
> > > >                       continue;
> > > > -             (di + n)->id      = dev->id;
> > > > -             (di + n)->flags   = dev->flags;
> > > > -             (di + n)->state   = dev->dlc->state;
> > > > -             (di + n)->channel = dev->channel;
> > > > -             bacpy(&(di + n)->src, &dev->src);
> > > > -             bacpy(&(di + n)->dst, &dev->dst);
> > > > +             di[n].id      = dev->id;
> > > > +             di[n].flags   = dev->flags;
> > > > +             di[n].state   = dev->dlc->state;
> > > > +             di[n].channel = dev->channel;
> > > > +             bacpy(&di[n].src, &dev->src);
> > > > +             bacpy(&di[n].dst, &dev->dst);
> > >
> > > This does not relate much to "prefer struct_size over open coded
> > > arithmetic". It should have been in a separate patch.
> > 
> > +1, please split these changes into its own patch so we can apply it separately.
> 
> Ok, no problem. Also, I will simplify the "bacpy" lines with direct
> assignments as Kees suggested:
> 
>    di[n].src = dev->src;
>    di[n].dst = dev->dst;
> 
> instead of:
> 
>    bacpy(&di[n].src, &dev->src);
>    bacpy(&di[n].dst, &dev->dst);

I think that's a separate thing and you can leave bacpy() as-is for now.

-- 
Kees Cook
