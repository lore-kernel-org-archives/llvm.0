Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30236129A72
	for <llvm@lists.linux.dev>; Thu,  9 May 2024 22:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715292622; cv=none; b=jKxPPcJTl/eHBFkiIU6LKDxnWwDpYhuDOLxRSM4VtY48OSYR+lBepz7mbmN6sg1HIq72RAql2qz6m+GNCbDWPPggeefb++v5owkS/LkEhET8TDxkxeOdLqJEbHsUETJ3UVPNTxC0c5DjEAMMTqL/wT+3FIZz1Iqr0MjW1e3SXlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715292622; c=relaxed/simple;
	bh=59mEgVC4lkz46VEjh2qNmxWDlTxiAqyCrQSnZR5NBDU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QAILzXc/8e7858zV9SZ+jvrh/MwBxnyHVVE60HpLdfrAiIR/UuXI0gPB5rb0ae3zzYLcLvd7qs/IJNZRNBVPPKy2l9+oLpA+U7JalNUW7hhNfCDnNye5z3lRZoY2PDZNXuwtHj3fjHM6EWNLftBzz3O3yftCZnPVJaPYfacgPso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cgRKYoNt; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cgRKYoNt"
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-47efc7f2625so441867137.3
        for <llvm@lists.linux.dev>; Thu, 09 May 2024 15:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715292620; x=1715897420; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MKdICX+lX8CE08nIGqEYXYRJN4FhWDTtg4wUvpl3cAY=;
        b=cgRKYoNtOzlTH0ytx1Izb/zIaqNTamGnKEMAdKJbrE3m7tiQswOc2Ax4K5OiF0jRBY
         DH17S4SyV4ohU7EKYiNIcFGy2ghNvMGcGPUk2fUqS/1URVErdHs1U0e+ZkquXLxxAYDe
         5XGzIK+Yt6ETa4giSxefUW3A621qv4OLjc2a2XdrxPN6jXxw9IyFXzvJfcXrCPHrJyg5
         2pjgfBbjpSQZjJ/WXko1/KJJBkizTAmhszrkNlFNQrDzZX76GFPNGShoe0bj4UuSbZxc
         h9jM+kngEd7/qJm9g1oeVge6+QKqKGQuGBxlW+PFet5X+YbkCPWwkNSRa2qQSNUufKSD
         X0dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715292620; x=1715897420;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MKdICX+lX8CE08nIGqEYXYRJN4FhWDTtg4wUvpl3cAY=;
        b=mfRhmxIFncqQ/iIsfvQlN9S9SLxuwS++pIkCqbry0N8UFktpJqmJfTnUEXMUuiIeRW
         e4tHMN4wAIgO+tccaGKm+1lKVRgVoX9qptf8G8HRcGKmJcL08yM15StJZmEQdq26bdho
         DuaFfnJG2jGi3I2uolFVSuSJUV7gS+6d9ore/yqfZYCz0C7SG0op/jI40SUQY97eOy/I
         ni+tpH2EyG+LfFcBOT8JAZD4dtsGxfoOW+O52ckbZzl0GivE0lB+gcK2UWD0Ri7DEVdw
         EnfTfE0goLduI6DQMDJBu+WSR6w4rODkJjqbaTVjU4XUqQB3JNz74TbWhyKbdmN7yv8H
         fchA==
X-Forwarded-Encrypted: i=1; AJvYcCW5JyfOLrSM4wmFzufi3N0cBU6XCBJBnnLCyGwRY+S1tp/A6+pzwKmSY5qTRsLRp2bL9d7FvlEu3e7WdY7iYepFvt6VhA==
X-Gm-Message-State: AOJu0Yy4RgAFFC2Q3auGbbQKcAHBAhrWlL8lfW0bln5a2nNfp/uUHWaN
	Eyd9B2ueb+EvlxVCMnPKokNv5EN5uHx+g9pb25cpvJVE7wPTZxC/AHtc2/M3RLsFZ2+KkMKVAQw
	16y+sD1w7AGh8LQmlehKf5H3CEc3g7MLPRvMS
X-Google-Smtp-Source: AGHT+IG9UCFfCI7smAQh5zYoU5+Q/8AopDE+XLvDQt4XHypQBrcuB26D5dwcSEX6FTb7qgBIbqU5zgrv8BJ4OSYe5Bc=
X-Received: by 2002:a05:6102:3053:b0:47a:22cd:9716 with SMTP id
 ada2fe7eead31-48077e07a05mr1112057137.17.1715292619999; Thu, 09 May 2024
 15:10:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240507-b4-sio-vfs_fallocate-v1-1-322f84b97ad5@google.com> <20240509155356.w274h4blmcykxej6@quack3>
In-Reply-To: <20240509155356.w274h4blmcykxej6@quack3>
From: Justin Stitt <justinstitt@google.com>
Date: Thu, 9 May 2024 15:10:07 -0700
Message-ID: <CAFhGd8opxHhTdZhDg_hq7XWQFxJ34nLDxTd-nBBgye9BLohnqw@mail.gmail.com>
Subject: Re: [PATCH] fs: remove accidental overflow during wraparound check
To: Jan Kara <jack@suse.cz>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 9, 2024 at 8:53=E2=80=AFAM Jan Kara <jack@suse.cz> wrote:
> > @@ -319,8 +320,12 @@ int vfs_fallocate(struct file *file, int mode, lof=
f_t offset, loff_t len)
> >       if (!S_ISREG(inode->i_mode) && !S_ISBLK(inode->i_mode))
> >               return -ENODEV;
> >
> > -     /* Check for wrap through zero too */
> > -     if (((offset + len) > inode->i_sb->s_maxbytes) || ((offset + len)=
 < 0))
> > +     /* Check for wraparound */
> > +     if (check_add_overflow(offset, len, &sum))
> > +             return -EFBIG;
> > +
> > +     /* Now, check bounds */
> > +     if (sum > inode->i_sb->s_maxbytes || sum < 0)
> >               return -EFBIG;
>
> But why do you check for sum < 0? We know from previous checks offset >=
=3D 0
> && len > 0 so unless we overflow, sum is guaranteed to be > 0.

Fair enough. I suppose with the overflow check in place we can no
longer have a sum less than zero there. If nothing else, it tells
readers of this code what the domain of (offset+len) is. I don't mind
sending a new version, though.

>
>                                                                 Honza
> --
> Jan Kara <jack@suse.com>
> SUSE Labs, CR
