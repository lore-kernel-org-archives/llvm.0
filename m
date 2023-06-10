Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A645408F8;
	Sat, 10 Jun 2023 05:43:14 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1b075e13a5eso14625895ad.3;
        Fri, 09 Jun 2023 22:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686375794; x=1688967794;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S0E9TqPlClkIkHO+5O6SHOK2wGvqw8vvKKZgxDdIA58=;
        b=ehxZ2tJJ+t7XM0Wd0ZMB4vbxxGKlA95yzAAydTbIhcnAKMxqoyCHq3ui1wJzZASSqH
         3eqG6Z2krUc2SB8KvKVErAhrUHD0sAQtXSlXANHay5xwP8jN7rmR/lZIDKpSJIT7Tqh1
         +JYJXs50J8bJzUlPGsWEPSK7UuQfEkaX897U6v6U6qmbqa3Wh20oga9vJnBX+FnJMjYt
         M6AUKH+PssFLRJBhmzgRNBaoxv0HjiymvNUB+mydsDMxToMlO1qvx+ByzjuH8beuvu4X
         sObK0Km4n+gNnuOlUcmXEjnaIjxsk6ZpUKQiJfA+NZVZXCSIk8xx9YbIYFZRdpkzsKZR
         tNIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686375794; x=1688967794;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S0E9TqPlClkIkHO+5O6SHOK2wGvqw8vvKKZgxDdIA58=;
        b=htNKHSGGrMCbqwfx8jGvn6WYpm6GsPZ6ImBW7GwLTbluqVkKmnao/uaHCSkFySw+9C
         VbuD94OyRyLTTgqX4LJf5q9aoCtLwjmHiNYNi+gM+d8eSqIsTIAc1pFGEB9O1t3OVA3P
         8Otakf9sVEYn0bDAMy5qcP+cHhHFsh1JQOfgnMMgGgfHtfIeR4GhrbZSlSAkj8PhcF4x
         1q6lKyvtqc7/LZ7k+wnu6tEatsNhUPOKj7QqlJ832C3/OA69T57tODanMZU7STC8gJB4
         7T/4CT98vsSo/534qAmCmQVoA0miha9tWy8GNgQ3d21BF/ntKASPTIApJi59lK/lxkmw
         FEPA==
X-Gm-Message-State: AC+VfDxPJG4D0CItzGRL6qhXprpbkreNWell37qdjqOTG+kmgR4ES6wb
	wRNZUMmJ2X0Ze0HF6JOl/mw=
X-Google-Smtp-Source: ACHHUZ4GUhjjnA5tTtq4uGyTDpp5RIaHFVnK+jzOcUyACTrvCYSY+6NtuP2l+uJHTJDXH4DeFtsFjA==
X-Received: by 2002:a17:903:244a:b0:1b2:409a:3099 with SMTP id l10-20020a170903244a00b001b2409a3099mr1076360pls.58.1686375794211;
        Fri, 09 Jun 2023 22:43:14 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id z24-20020a1709028f9800b001b016313b1esm4151970plo.82.2023.06.09.22.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 22:43:13 -0700 (PDT)
Date: Sat, 10 Jun 2023 13:43:08 +0800
From: Kent Gibson <warthog618@gmail.com>
To: brgl@bgdev.pl
Cc: linux-gpio@vger.kernel.org, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [libgpiod][PATCH] doc: add configuration to generate doxygen
 documentation on readthedocs.
Message-ID: <ZIQNbB30BUsirOr1@sol>
References: <20230610020148.8973-1-warthog618@gmail.com>
 <202306101327.8CQ451FM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202306101327.8CQ451FM-lkp@intel.com>

On Sat, Jun 10, 2023 at 01:20:47PM +0800, kernel test robot wrote:
> Hi Kent,
> 
> kernel test robot noticed the following build warnings:
> 

Ok, not sure what to make of that - why is the test robot concerned with
libgpiod patches?

The files in the patch aren't ignored by the .gitignores in the libgpiod
tree, so it must've applied the patch to the linux tree - which doesn't
like dot-files. That wont end well either way.

Can we tell the test robot not to try paddling around in the libgpiod
pool, e.g. ignore patches with the [libgpiod] prefix?

Cheers,
Kent.
