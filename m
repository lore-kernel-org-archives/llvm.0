Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E02D1871
	for <llvm@lists.linux.dev>; Wed, 10 Jan 2024 02:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WalxmtNe"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1d542701796so17027075ad.1
        for <llvm@lists.linux.dev>; Tue, 09 Jan 2024 18:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1704855380; x=1705460180; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+Cqsu0sVJlmIzMpcIruHiSjowcwNftxKzZNL1LWKgYE=;
        b=WalxmtNeDUcRr7RRHcWTbepU2gX2YWVQ0dJT7NhQm6cM31XZX2ZJSlXP07A2tFwF5h
         aA3XYAl7oJQ3WngkMI6r/93IJxstbbL4wClN5PzBypSOklAwd/R1ry8UnQmkxZTiG8SG
         8DxeoD2sOBIOUGUsU6BDcjBt9hufn4ivmMXmo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704855380; x=1705460180;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Cqsu0sVJlmIzMpcIruHiSjowcwNftxKzZNL1LWKgYE=;
        b=eBzXv1z3f900aDZqez0oYvovySq+NUFjnHaHCb8X2dsT6Ywh35/BZ+jEcdx/iWa8EV
         4nLlNCk3xvGCL7XkwyK+THKhCzZYJZ0j653dsKpbw1P3IWmFzvp0kMLR+uISW244mna4
         Izm7nc9SCW18Bk0mxqJ5QU3b1tmkB94iFTy5qJJDH5oS+i840jNvkl5eG82eWlv0ZhBz
         geeT56m/TuDLD7O+Vrj3lYhbd54Du+lwRIGBICaGym1ORMVTy18stWsZJKI09NMjb8DK
         74LolmHWQ444FRCkdqrTXgbUxMHUU0zWNI6vqjRpbi5YgA9Kbj7aC3gb+oIYdUF6AKUD
         ngKQ==
X-Gm-Message-State: AOJu0Yy37QsrVRR6RJmH7KWq+FZvOGX/4V0Qa4IqcLoxgLxtO6lrIKHL
	Gkyx6V2QTQ21BaMsS7jIP0+PF76tyBmx
X-Google-Smtp-Source: AGHT+IEngKshpq/yhOR1WVK0GZhLIsH5bOdw67YXV/WIQFr2uAaYISZM9GXBETQxfJL/bytuG/mwLA==
X-Received: by 2002:a17:903:32c7:b0:1d4:c97f:e6e4 with SMTP id i7-20020a17090332c700b001d4c97fe6e4mr349227plr.80.1704855379715;
        Tue, 09 Jan 2024 18:56:19 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:b1d0:e755:54c2:4518])
        by smtp.gmail.com with ESMTPSA id jg5-20020a17090326c500b001d4ac461a6fsm2521332plb.86.2024.01.09.18.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 18:56:19 -0800 (PST)
Date: Wed, 10 Jan 2024 11:56:14 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Kees Cook <keescook@chromium.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	"Gustavo A . R . Silva" <gustavo@embeddedor.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] Compiler Attributes: counted_by: bump compiler versions
Message-ID: <20240110025614.GA1282549@google.com>
References: <20240109133633.1103876-1-senozhatsky@chromium.org>
 <20240109153249.GA205400@dev-arch.thelio-3990X>
 <CANiq72kjHCh-inyv1aU=eNca1-+E0_85MGU-8qbZZtzbC_VwOQ@mail.gmail.com>
 <20240109195652.GA1253215@dev-arch.thelio-3990X>
 <202401091311.08D6FF677@keescook>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202401091311.08D6FF677@keescook>

On (24/01/09 13:12), Kees Cook wrote:
> > If I understand the doucmentation at [1] correctly, the first round of
> > testing starts with -rc1 and ends with -rc2, so if the feature is not
> > merged by -rc2, it won't make that release cycle. I think counted_by
> > might be a hard sell even after -rc1 because the feature is not exactly
> > small but it is also not expansive (it is relatively self contained
> > from what I can tell). So I think your plan is reasonable.
> > 
> > Another alternative would be to split this patch in to three distinct
> > patches, not sure if that would be overkill for this though.
> > 
> > 1. Update the clang review link from reviews.llvm.org to github.com
> > 2. Update the GCC version from 14 to 15.
> > 3. Update the Clang version from 18 to 19.
> > 
> > The first two patches could be picked up immediately and the third one
> > could be sat on to see how the review and acceptance process works out
> > over the next couple of weeks. Up to you/Sergey. Thanks for taking a
> > look!
> 
> Yeah, I think either the above split or just wait until the Clang 18
> cut, since we've got a while before the next kernel merge window.

Thanks everyone for the comments!

I'd probably prefer to split the patch and take the obvious and
trivial fixups now, and once clang -rc2 is tagged we can return
to clang min version requirement (if we won't forget :))
