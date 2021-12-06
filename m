Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58E12C9D
	for <llvm@lists.linux.dev>; Mon,  6 Dec 2021 06:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638770641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Wo70tjI7q1UAqboatbwLl0h/uu/FTe3Affu+qnLiGkQ=;
	b=XYY7eXhylnsg4+T/kxBNzlOHzbFesYNeuv2rR7aHGdKxTXOaTIhPKF7cC/9z2auVGzmII+
	TPIeXK1RVHGquC54I5la9yxEqJbUguzOSNUhEwG4JIw1FDHiN4/h6w5Ghm/ijjffgbCSm/
	r05ZP0eHLzTvevFWcOGHIXrbg4/KIw4=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-97-86kn_peyPbGE-B3NCPdxpQ-1; Mon, 06 Dec 2021 01:03:58 -0500
X-MC-Unique: 86kn_peyPbGE-B3NCPdxpQ-1
Received: by mail-qv1-f70.google.com with SMTP id fw10-20020a056214238a00b003c05d328ad2so10760049qvb.2
        for <llvm@lists.linux.dev>; Sun, 05 Dec 2021 22:03:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Wo70tjI7q1UAqboatbwLl0h/uu/FTe3Affu+qnLiGkQ=;
        b=AfaOsqRJpYOhVd/YLH9b0ea29d7vlj0vdzATlGp4GhTXM6jM+LAWFWkI1NKEMNvM0w
         EVMkY1H2k9p6bkE8q6XYenISq3FFqUnv6si5cZgFNLi3bGddLPAnPteg4rtbVafotSOo
         n50NWDlMM7PfBPydXbNN3QSdv8dBPDIqN8KnyVjEGl3T8v+gTf/WuPFrazMhpjrToNiz
         CGELg0wWDnTbLhV3EGdabENc2iRzS6itl6yt6q6I1I32aSv/4POnUIepvsC1r5Jz1ngz
         n1fJPOh6pLdDQ4PvEFDV4nxH5YHzN5EEn0KpuVdEPf0ynyed/tyy+BCo0LgbaFpUQ5KD
         i2eQ==
X-Gm-Message-State: AOAM531DrX8GLHd8Y04qw9SMu81T8mAesbXo3lmNrKaNfQ6TowALffC+
	YMDqeqWaxf0gxUo1GZFc8dZIGaGdcaOMqGopByTsm2jV4OR4MKfVRtD2wLuMF73O0W+twQUlinl
	4DN9jLwr7pQ0fug==
X-Received: by 2002:ac8:5bcf:: with SMTP id b15mr37503576qtb.474.1638770637766;
        Sun, 05 Dec 2021 22:03:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwBlcOgv7DcKhfVmXiMUiPn6jj3Lbd0IoNd3WtPjyxukoKwU1wdw7FB6qmJfkTYOfo/DTS8HA==
X-Received: by 2002:ac8:5bcf:: with SMTP id b15mr37503536qtb.474.1638770637542;
        Sun, 05 Dec 2021 22:03:57 -0800 (PST)
Received: from treble ([2600:1700:6e32:6c00::45])
        by smtp.gmail.com with ESMTPSA id y20sm6176312qkj.24.2021.12.05.22.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Dec 2021 22:03:56 -0800 (PST)
Date: Sun, 5 Dec 2021 22:03:50 -0800
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Alexander Lobakin <alexandr.lobakin@intel.com>,
	linux-hardening@vger.kernel.org, x86@kernel.org,
	Jesse Brandeburg <jesse.brandeburg@intel.com>,
	Kristen Carlson Accardi <kristen@linux.intel.com>,
	Kees Cook <keescook@chromium.org>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Ard Biesheuvel <ardb@kernel.org>, Tony Luck <tony.luck@intel.com>,
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
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-arch@vger.kernel.org, live-patching@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v8 08/14] livepatch: only match unique symbols when using
 FG-KASLR
Message-ID: <20211206060350.f4hqug2jhgjlaw3c@treble>
References: <20211202223214.72888-1-alexandr.lobakin@intel.com>
 <20211202223214.72888-9-alexandr.lobakin@intel.com>
 <YansAlTr0/MfNxWc@hirez.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YansAlTr0/MfNxWc@hirez.programming.kicks-ass.net>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jpoimboe@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Dec 03, 2021 at 11:05:54AM +0100, Peter Zijlstra wrote:
> On Thu, Dec 02, 2021 at 11:32:08PM +0100, Alexander Lobakin wrote:
> > If any type of function granular randomization is enabled, the sympos
> > algorithm will fail, as it will be impossible to resolve symbols when
> > there are duplicates using the previous symbol position.
> > 
> > We could override sympos to 0, but make it more clear to the user
> > and bail out if the symbol is not unique.
> 
> Since we're going lots of horrendous things already, why can't we fix
> this duplicate nonsense too?

I assume you mean using this new linker flag: "-z unique-symbol"

https://sourceware.org/bugzilla/show_bug.cgi?id=26391

-- 
Josh

