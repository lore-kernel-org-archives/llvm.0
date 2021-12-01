Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1782C82
	for <llvm@lists.linux.dev>; Wed,  1 Dec 2021 11:13:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D113C53FD1
	for <llvm@lists.linux.dev>; Wed,  1 Dec 2021 11:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1638357235;
	bh=Jr60S9vZYC2ZJCI60wGp7cQYwix34ekFyfnYWBWsHq0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=N5CqLbtH6LFj7p96idud+5drlCYN38cM+jiIeLfDhR7o0yRiz4c42KYOAe9zP47Vd
	 UO1VgUkJNO5MEZt0EbRiJMCy74cuBNgnBDSFHXAtsubmwrbL9rnoLcHMbRsYlqy0aQ
	 hEkeLc/l1/UnhD/PpfaNZKtEOeae1ERr0rsNIuRufpEFhAA6RtVbgaNo6OueaF9M7g
	 7igSgxYXENzNgIXXITf5dl7RMUX6bxn2QtwwdiK+K7RG4ar+7T+eG4tbv706dd4DkO
	 wds1603xmM5n+vecCrMAzyCvn4ErSvahhmjfyIvamB9aCvmiSwwiUHjojpHmzeetX6
	 vzmzfkXhmrXSw==
Received: by mail-oo1-f46.google.com with SMTP id t9-20020a4a8589000000b002c5c4d19723so7695587ooh.11
        for <llvm@lists.linux.dev>; Wed, 01 Dec 2021 03:13:55 -0800 (PST)
X-Gm-Message-State: AOAM530yae0SJQfhcwkevlc/Z71iJ/yt+8oSKU+JTNQAUO0tGHvzuxYm
	P+LaiWHTG7iAC1K58IlXu0tCshRRW7nmOI37/Ss=
X-Google-Smtp-Source: ABdhPJx++xeDu/GpbLCf9BmWz9/ZnnDCw/xhIrMHPQCRmA4KUt9a9pqH9hymH73l9leyjchWXd9K9f3has7EJIEhXV8=
X-Received: by 2002:a05:6820:30b:: with SMTP id l11mr3946229ooe.32.1638357234772;
 Wed, 01 Dec 2021 03:13:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202112011148.XrnWip5a-lkp@intel.com> <CAK8P3a0c+zE22ouZKF66gfoqNJuCZTv0r3nnDR+AjxgCLgE87A@mail.gmail.com>
In-Reply-To: <CAK8P3a0c+zE22ouZKF66gfoqNJuCZTv0r3nnDR+AjxgCLgE87A@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 1 Dec 2021 12:13:43 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHF7mCq1ijV7RLBrxBY43sREqCb8TQR5eh_4GnMmfDPRw@mail.gmail.com>
Message-ID: <CAMj1kXHF7mCq1ijV7RLBrxBY43sREqCb8TQR5eh_4GnMmfDPRw@mail.gmail.com>
Subject: Re: [ardb:for-kernelci 18/28] arch/arm/mach-footbridge/common.c:102:6:
 warning: no previous prototype for function 'dc21285_handle_irq'
To: Arnd Bergmann <arnd@arndb.de>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, kbuild-all@lists.01.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 1 Dec 2021 at 08:44, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Wed, Dec 1, 2021 at 4:42 AM kernel test robot <lkp@intel.com> wrote:
> >
> >    arch/arm/mach-footbridge/common.c:102:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
>
> Correct, thanks for the report!
>
> Ard, I assume you can fix this up in your tree.
>

Sure.
