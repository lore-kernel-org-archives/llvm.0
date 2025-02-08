Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C20116F841
	for <llvm@lists.linux.dev>; Sat,  8 Feb 2025 03:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738986582; cv=none; b=ejzPIlZ+OEpn195TT5jDp3xFvxnjSDug4seR2YqfZUms0cfQT1fuv8MnZeuDmVrNWm4cJIAvvnz/oGOCcsAMJpzubRQxQWCwwJS8CvAliGBHfEqeWWvHuVrIDxIpbV4wjgJ0m3joZ5wg7By0YdrH2H2RBUdhwnHrrGgAfFRXjbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738986582; c=relaxed/simple;
	bh=fPPdXfdf0GFv2SwvsTHblJE3CYjrHkjCJBhP2Nzy7Ac=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jWpvheS+CI8MBMZblOZY6Gk5h+pu8+EpdNihwC305kV++uwUYKYuaZvk4BrSWvdWcP+8VSadwb9VCFqkJ4gbS8iyN36p3ZJV4Bkxwl4L4swX+4DZuZi9WM7flzIFSy+jCylAECR6JvJEZ4Ap8EfED9jYB7WJYPcM25La/RMTYjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=RrGPyJ/5; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="RrGPyJ/5"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ab7483b9bf7so390242266b.3
        for <llvm@lists.linux.dev>; Fri, 07 Feb 2025 19:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1738986578; x=1739591378; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=en/w6yDuVSKRL7ItlfwKpxJ2vsOe/76EOS4O3iixM4E=;
        b=RrGPyJ/5YbT6uWWV6CLRxGIQeN+OutskQVH6KDT6vl2waIBxwhHkF733d0sXnXQNI8
         zOzOYXh4d24rIi23Tr7DNmadqNLFXj4LEZIlj8zsVT6gg3sDLiBGOzQat6Fz2Rc1Pl3Q
         Zd/UXq02WwwN9JRAcW05gdG047T06BLA670a0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738986578; x=1739591378;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=en/w6yDuVSKRL7ItlfwKpxJ2vsOe/76EOS4O3iixM4E=;
        b=PQ9+lReo83cu2+mU+0aVd3LQmWvvs9UuR3RChMotpKuGxbvfHs4mTtNecp0Pkg0Bfq
         4A9lVPbFbRc8SqW0wBjX7HhjmBu8elc2vpYOFIyLAxrumaDn6tdYqolxUa1HL+0/2qJz
         BdT0uupmDedETz/rGDME2rQ0GO2FkIWyVIWCCHFbWZ7+0mvYu0J+Zo3B7kOQ2I+PAm2q
         tWtvWiMGKFXYMgiQ/X/KoTPCEoJ5L4ijkF4cncPmjJ+wPS0iA5QGhQt1SYnpP6iCaMiM
         p/u4klQrGR6mJVWezpG2Beb1xUaRMyw9mKW9c7BYxIUtnNakliqVaa6otukyCyWsuF1q
         CaPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXak5hdolkJBzAWDOVYdjKogD7VtpcadYhSoadxpru/oqxTNkVAbCErj91mBr/SOCkVmiUY@lists.linux.dev
X-Gm-Message-State: AOJu0YzF/gZxX/J5mrP+h96n/rAmPofrBsC3SRlq8EZ+SbiyV1MXGatQ
	qcjB3IYYJx7Jzj4PKDBIquNuvoxo4vrIMfhNDdyISksc2lBQDnrZ6A5z2CA7zohz2YboJRPDNw8
	TxD73Sw==
X-Gm-Gg: ASbGnctSO4SBj1VoU0pjolGl1bGAcnM1yMzt3c/cP86T5poqeiCCr47RaIFjE7t7VGl
	GHfXoTJKK2d9tfU0u603A6hQNhQYm31ziVbFIsncousR01j5O/p49HZ80wIRmq7fGZsmG5Sy0Gi
	6GEhBhMC7LDGypk3URBW+EVIAx3QSm3qpd9QZL0gdtnJgbAODa+XNa/lOTokqw20awsQtxnG+VB
	fDuFiLy+EYf0ixSHiQzuAIryB/jCf/MCZjt/tD5n551BsQzrBwUqsUWZRLp5ahTqsSuriOFB61W
	otwbBt39GQapZFrntjPCPsffa4iQdJEcF5ZZW8AI25VB4B4FH+aRBDXCIme/iSUXUA==
X-Google-Smtp-Source: AGHT+IFS4CEEzsIDWyZ3TjyUZ+zN/LHchKtbNiNqtfLIltQLTwxztq4fdsYT7PmwSWaaDbRUeTs2yg==
X-Received: by 2002:a17:907:1b27:b0:aa6:8cbc:8d15 with SMTP id a640c23a62f3a-ab789ac0169mr657365166b.14.1738986578459;
        Fri, 07 Feb 2025 19:49:38 -0800 (PST)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7a30cde32sm44350866b.44.2025.02.07.19.49.36
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 19:49:37 -0800 (PST)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5de4d3bbc76so1995855a12.3
        for <llvm@lists.linux.dev>; Fri, 07 Feb 2025 19:49:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVY3PMss0p3g2GCvfIFmyhjfkcJ4V1xJ5Y4zpvNID+JI5GL7DuWj+SHaBa8MrxPoYvdWiLx@lists.linux.dev
X-Received: by 2002:a05:6402:2804:b0:5d9:8877:895a with SMTP id
 4fb4d7f45d1cf-5de45022bc6mr6555500a12.17.1738986576060; Fri, 07 Feb 2025
 19:49:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250131191231.1370466-1-bvanassche@acm.org> <20250207164926.6daeac77@kernel.org>
 <CAHk-=wiCJow8C+_fJvZ77taCf0oN0_X7NOR-BaECT2jV0Q-F9g@mail.gmail.com>
 <20250207173813.5081ba76@kernel.org> <CAHk-=wjMux0w49bTdSbC3DOoc9FRctDrRvaqFUS4KFTmkbtKWg@mail.gmail.com>
 <20250208033351.GB3305705@ax162>
In-Reply-To: <20250208033351.GB3305705@ax162>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 7 Feb 2025 19:49:19 -0800
X-Gmail-Original-Message-ID: <CAHk-=whe1UZUGKbtaaRV7CfS=sGtB2ouYAriryZ6bscE+5AFhA@mail.gmail.com>
X-Gm-Features: AWEUYZm93jEuBeKA0T8ZikX38dvQR5dXzkkQRBS5ZLzaULkflGe0aZoKzJ2QQpI
Message-ID: <CAHk-=whe1UZUGKbtaaRV7CfS=sGtB2ouYAriryZ6bscE+5AFhA@mail.gmail.com>
Subject: Re: [PATCH] mm: Fix clang W=1 compiler warnings
To: Nathan Chancellor <nathan@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Bart Van Assche <bvanassche@acm.org>, linux-mm@kvack.org, 
	Ivan Shapovalov <intelfx@intelfx.name>, Vlastimil Babka <vbabka@suse.cz>, 
	David Laight <david.laight@aculab.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	David Rientjes <rientjes@google.com>, David Hildenbrand <david@redhat.com>, 
	Kaiyang Zhao <kaiyang2@cs.cmu.edu>, Joel Granados <joel.granados@kernel.org>, 
	Sourav Panda <souravpanda@google.com>, Johannes Weiner <hannes@cmpxchg.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 7 Feb 2025 at 19:33, Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Fri, Feb 07, 2025 at 07:11:08PM -0800, Linus Torvalds wrote:
> >
> > But not having clang-19, I can't see if this is a case of "this is so
> > rare that let's just avoid it", or "this is the case that causes the
> > most noise for every file build, but there are lots of other cases of
> > this".
>
> The diff to hide some of the really common ones:
>
> https://github.com/ClangBuiltLinux/linux/issues/2002#issuecomment-1970004069

Oh, ok, that's already more than I would have liked to see, and I do
think that the patch is not only bigger than I'd like, it makes the
code actively worse with adding random casts just to shut the compiler
up.

That is, of course, something that C++ people think is a good thing,
since they are used to their traditional NULL casting idiocy. But in
C, we have actual taste and grace.

So no, that warning is no good for the kernel.

> The build log with that:
>
> https://gist.github.com/nathanchance/971e5abeba504d3017cd6ed4517bbda6
>
> I looked at a number of them and none of them really seemed like bugs to
> me.

Yeah, those seem like more of the same: the kernel doing sane things,
using enum's the way they are meant to be used, and the compiler
warning is just simply plain wrong.

I will take your patch to move it to W=2.

Thanks,
                   Linus
