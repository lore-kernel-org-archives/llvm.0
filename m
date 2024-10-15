Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407161FE0F0
	for <llvm@lists.linux.dev>; Tue, 15 Oct 2024 18:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729016911; cv=none; b=ZKTmYsQ17qJ5zFsGD/Y9y0goOQlYYvIdaiutMUoYM9vSaJy3lBTyj70I370i78FZFyd2XAHCOXQHsQSJW1KiFMnKp3rMkv5MO7lZMOJv0DNEsN5/F18I2bYhuO5UJMjHmwsFA3uuDFBJa6J73h1Mnb3wVZRcQvBMvDUkppTKxVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729016911; c=relaxed/simple;
	bh=9hxP4E/PoSlUEOrZl2zCM3G3UcMAI92wXfa/Apufq04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uo+JBj7q1sqt0e/vHsGmvnprkzL15zp+Nzt3/ztSj8ck4JG65z5+vrFkbqPGyF+Y1Dr0liF/RPr1hU8SocGInFlMhi3j+Duy8V7Y49opEYUydk5dqUXadpcVAQlAUm6KgvGCjXE7w2epjr21kHfHpLiJkQSjgNQwfxHKj6qYZxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G7xW9MiD; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G7xW9MiD"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-71e453c7408so2783514b3a.2
        for <llvm@lists.linux.dev>; Tue, 15 Oct 2024 11:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729016909; x=1729621709; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qkbADVRXZDubH3w1fG5mvFr9GeZ5X2VofaUlygYyiRk=;
        b=G7xW9MiDrv3x7fX2qmmKSXTxLxWV0DhD7AqgRopOBeXomzep6qdiXV/bT/fEr3WmD+
         iUQkvD81mOvRv11cNo/eTXfr6CdzTZUC7+OvJdL3d21PGY0DscCsFBtV6GjVAzbdwpR9
         eIrkxPU2A7KBocE+ItNagM3jdRxfgcl0m4HnLUjbj4EqhyBuzogqm3j+zFu4gvqo9Sag
         bmR+yFTcF7YqUXuC3elMxeMhIeuPWBSUvt1eIbX3BQCp6X3mwRHxxaozybwUscfTsQx/
         mcLx3OWIqUCCWTdycz8/S4DSuA6QSC4q2y1b/ztESKDssGom2Xj6jrU1UXB2tYXU3lu0
         87Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729016909; x=1729621709;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qkbADVRXZDubH3w1fG5mvFr9GeZ5X2VofaUlygYyiRk=;
        b=lDkyQshfbK04YE4ZpK+NSLRXKwelzMqeORZVO9rMdaW+XUZlkPiJoqYvrqe2S5tCHM
         AAIr3iX53KxXqlx3XQpeOssAAf6Z3Lz8Hm9GbBE4lnVBPFeSfKbF/U8M5iI6m4hrF/J2
         AFDUvvX9ZQ6RHDxcLMXiyFLqTmcbZlW6cc261WyA9/LEOtvyeFe4Wq2vx5xKryvelLA7
         bWHlShhBVrjmu0VumAQbYT752gK767aZKHA5Xcu4JMZp1qQBPCtFLc2Fmccdz8Wg9j27
         +W0ODPMz7ozjmyVqtjPHeYeFmP4bfec3tEuv5U/A+fMfrsSf8+mxZ9uXvMBKI9BjZPWo
         HdJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWToSaD3YSGSu0bhrZxgJ7bXTddEAJytJna75y4tcfg5kK2f05T9etMkAwgkwmEgGPONM3q@lists.linux.dev
X-Gm-Message-State: AOJu0YxpqLZtFFSJePs7gv4+J0E4GYMs7ev7fYz8slTAZBC3rttztyGU
	fiEdjjKSQSnyIfQGGRFlqk1mBougPX8ywvcYlxv8+1BUJNBLqb6V
X-Google-Smtp-Source: AGHT+IGS1hy+7dQhNCTMJeL05rsRs1DfnMdP7V4OfDlDE84odlVNQ+IsdCpldlAde2wWGjt8Bf+3+Q==
X-Received: by 2002:a05:6a00:b41:b0:71e:1259:f935 with SMTP id d2e1a72fcca58-71e4c156d9cmr16469242b3a.9.1729016909325;
        Tue, 15 Oct 2024 11:28:29 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:4bfb:6b8:82e3:75b8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e77371780sm1641923b3a.11.2024.10.15.11.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 11:28:28 -0700 (PDT)
Date: Tue, 15 Oct 2024 11:28:26 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, paulmck@kernel.org, sfr@canb.auug.org.au,
	jpoimboe@kernel.org, linux-toolchains@vger.kernel.org
Subject: Re: [PATCH] HID: simplify code in fetch_item()
Message-ID: <Zw60Sj-iFh1KWwWG@google.com>
References: <ZvwYbESMZ667QZqY@google.com>
 <20241010222451.GA3571761@thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010222451.GA3571761@thelio-3990X>

Hi Nathan,

On Thu, Oct 10, 2024 at 03:24:51PM -0700, Nathan Chancellor wrote:
> Hi Dmitry,
> 
> On Tue, Oct 01, 2024 at 08:42:36AM -0700, Dmitry Torokhov wrote:
> > We can easily calculate the size of the item using arithmetic (shifts).
> > This allows to pull duplicated code out of the switch statement, making
> > it cleaner.
> > 
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > ---
> >  drivers/hid/hid-core.c | 31 ++++++++++++++-----------------
> >  1 file changed, 14 insertions(+), 17 deletions(-)
> > 
> > diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
> > index 988d0acbdf04..00942d40fe08 100644
> > --- a/drivers/hid/hid-core.c
> > +++ b/drivers/hid/hid-core.c
> > @@ -754,35 +754,32 @@ static u8 *fetch_item(__u8 *start, __u8 *end, struct hid_item *item)
> >  	}
> >  
> >  	item->format = HID_ITEM_FORMAT_SHORT;
> > -	item->size = b & 3;
> > +	item->size = BIT(b & 3) >> 1; /* 0, 1, 2, 3 -> 0, 1, 2, 4 */
> > +
> > +	if (end - start < item->size)
> > +		return NULL;
> >  
> >  	switch (item->size) {
> >  	case 0:
> > -		return start;
> > +		break;
> >  
> >  	case 1:
> > -		if ((end - start) < 1)
> > -			return NULL;
> > -		item->data.u8 = *start++;
> > -		return start;
> > +		item->data.u8 = *start;
> > +		break;
> >  
> >  	case 2:
> > -		if ((end - start) < 2)
> > -			return NULL;
> >  		item->data.u16 = get_unaligned_le16(start);
> > -		start = (__u8 *)((__le16 *)start + 1);
> > -		return start;
> > +		break;
> >  
> > -	case 3:
> > -		item->size++;
> > -		if ((end - start) < 4)
> > -			return NULL;
> > +	case 4:
> >  		item->data.u32 = get_unaligned_le32(start);
> > -		start = (__u8 *)((__le32 *)start + 1);
> > -		return start;
> > +		break;
> > +
> > +	default:
> > +		unreachable();
> >  	}
> >  
> > -	return NULL;
> > +	return start + item->size;
> >  }
> 
> I am noticing some interesting behavior when building with clang, namely
> some objtool warnings and a failed boot when LTO is enabled, which I
> bisected to this change as commit 61595012f280 ("HID: simplify code in
> fetch_item()"), such as:
> 
>   $ make -skj"$(nproc)" ARCH=x86_64 LLVM=1 mrproper defconfig vmlinux
>   vmlinux.o: warning: objtool: hid_open_report() falls through to next function hid_parser_main()
>   vmlinux.o: warning: objtool: hid_scan_report() falls through to next function hid_allocate_device()
> 
> With LTO enabled, the warning becomes:
> 
>   vmlinux.o: warning: objtool: hid_open_report+0x21b: can't find jump dest instruction at .text.hid_open_report+0x40f
> 
> A bare unreachable(), especially in the default case of a switch
> statement, is generally considered harmful in my experience, as it can
> introduce undefined behavior, which can mess up how a compiler might
> optimize a function. Commit d652d5f1eeeb ("drm/edid: fix objtool warning
> in drm_cvt_modes()") and commit 3764647b255a ("bcachefs: Remove
> undefined behavior in bch2_dev_buckets_reserved()") have some good
> commit messages talking about it.
> 
> Getting rid of the unreachable() in some way resolves the issue. I
> tested using BUG() in lieu of unreachable() like the second change I
> mentioned above, which resolves the issue cleanly, as the default case
> clearly cannot happen. Another option I tested was some sort of printk
> statement and returning NULL, which some maintainers prefer, even in
> spite of impossible conditions. I am happy to send a patch with one of
> those changes or open to other suggestions.

Oh well, if our toolchain does not like "unreachable()" then we can
simply remove it - the switch does cover all possible values and the
"return" statement should be valid even if compiler somehow decides that
"switch" statement can be skipped.

If you can send a patch that would be great.

I'm adding Paul and a few others to CC who apparently seeing the same
issue.

Thanks.

-- 
Dmitry
