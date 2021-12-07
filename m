Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272CA68
	for <llvm@lists.linux.dev>; Tue,  7 Dec 2021 05:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638855110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=e4ghYP9B13gGvmZuLKDuOchy2naysfKvbuf3lUvYkHc=;
	b=ILiCplrXUFLPc9DWwvemnd0a7H8UajIsai+WDTBPSFqVOugb7C9EGBpKD6/g293lrKu3db
	0+AS4lCMlDed30cFg8udqjK6CY2qt7tOggyaYKTypCVVaMHk3kWEdgS06mbFkVF2vegMZI
	RNXhAIDla1xuLJWGGXx04X13+BUA4hM=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-536-dFYpUGZfNuGKVcoBvzPA2g-1; Tue, 07 Dec 2021 00:31:49 -0500
X-MC-Unique: dFYpUGZfNuGKVcoBvzPA2g-1
Received: by mail-qt1-f197.google.com with SMTP id p7-20020ac84087000000b002b60be80b27so15420440qtl.18
        for <llvm@lists.linux.dev>; Mon, 06 Dec 2021 21:31:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=e4ghYP9B13gGvmZuLKDuOchy2naysfKvbuf3lUvYkHc=;
        b=bOXSe+BkuLsK3s8XLVTUKMSPdpqhd+V4in+40OY+Atz2IXSgcyd9m0evOeXQyXEELo
         0sHp5RrYAWqY4W8rRlMbG+zqdTWesr9IbTktrZVDAt9trEv2NXpSJjCAy1ibt/yZUlXY
         q3geKs9fzL9jA2iXqqSckG64OR5fTVOsYGUg8wgmBWe/eCT9tfv/mMTxDzs4D7wh3N6R
         TTYEGd6ydlZFOP2jfDGpBU9x8YY+mQNQ6cnuOi5Xb92k/fjU2Yw1bHQJgvbfojYlB7xM
         9Ha6PL2r30UOXN2jCRRmHoLA3LuW62KCf5jM6RRPB3LDKIlzRs5Y2HeChxZn+Ugui8FY
         nWvA==
X-Gm-Message-State: AOAM530JJkISG8/BDfxiaSm6qgYsxJt3FvUDA4izCrJHnFFFMAicD2as
	Fp8+tHOYEQr7kgtjUzZJcd4yAohWAZxxl5KX9Kq0Xn/BxwpKmpmAKa1vDTEbCbP2UvHqEmpLoKb
	/eacxotniCL9hfA==
X-Received: by 2002:ac8:5b51:: with SMTP id n17mr19545783qtw.182.1638855108533;
        Mon, 06 Dec 2021 21:31:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz454uO8EitNs/c6PtV9eniUKNKiTCgR5+N8W4WMPq1f0ryP+2pFiwPH4C3lFPQ4hkn9zJMiQ==
X-Received: by 2002:ac8:5b51:: with SMTP id n17mr19545750qtw.182.1638855108304;
        Mon, 06 Dec 2021 21:31:48 -0800 (PST)
Received: from treble ([2600:1700:6e32:6c00::45])
        by smtp.gmail.com with ESMTPSA id s12sm8814877qtk.61.2021.12.06.21.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 21:31:47 -0800 (PST)
Date: Mon, 6 Dec 2021 21:31:42 -0800
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Alexander Lobakin <alexandr.lobakin@intel.com>,
	linux-hardening@vger.kernel.org, X86 ML <x86@kernel.org>,
	Jesse Brandeburg <jesse.brandeburg@intel.com>,
	Kristen Carlson Accardi <kristen@linux.intel.com>,
	Kees Cook <keescook@chromium.org>,
	Miklos Szeredi <miklos@szeredi.hu>, Tony Luck <tony.luck@intel.com>,
	Bruce Schlobohm <bruce.schlobohm@intel.com>,
	Jessica Yu <jeyu@kernel.org>, kernel test robot <lkp@intel.com>,
	Miroslav Benes <mbenes@suse.cz>,
	Evgenii Shatokhin <eshatokhin@virtuozzo.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Michal Marek <michal.lkml@markovi.net>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Marios Pomonis <pomonis@google.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
	linux-arch <linux-arch@vger.kernel.org>,
	live-patching@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v8 07/14] kallsyms: Hide layout
Message-ID: <20211207053142.d4xvkqs57zob2v2i@treble>
References: <20211202223214.72888-1-alexandr.lobakin@intel.com>
 <20211202223214.72888-8-alexandr.lobakin@intel.com>
 <Yanqz7o4IH5MkDp8@hirez.programming.kicks-ass.net>
 <CAMj1kXFLJcfUqEoz0NAb49=XJG=5LAwEPSwCQ-y7sN31C1U6AQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAMj1kXFLJcfUqEoz0NAb49=XJG=5LAwEPSwCQ-y7sN31C1U6AQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jpoimboe@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Dec 03, 2021 at 11:03:35AM +0100, Ard Biesheuvel wrote:
> On Fri, 3 Dec 2021 at 11:01, Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > On Thu, Dec 02, 2021 at 11:32:07PM +0100, Alexander Lobakin wrote:
> > > From: Kristen Carlson Accardi <kristen@linux.intel.com>
> > >
> > > This patch makes /proc/kallsyms display in a random order, rather
> > > than sorted by address in order to hide the newly randomized address
> > > layout.
> >
> > Is there a reason to not always do this? That is, why are we keeping two
> > copies of this code around? Less code is more better etc..
> 
> +1.
> 
> IIRC I made the exact same point when this patch was sent out by
> Kristen a while ago.

Yes.  Alexander, I'd recommend going back to the review comments from
Kristen's last posting, they may have been missed.

-- 
Josh

