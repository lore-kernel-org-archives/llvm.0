Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66F64C7A
	for <llvm@lists.linux.dev>; Fri, 18 Feb 2022 20:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1645214896;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qbD0qiU4RjhqV726jofvBeaOVqKh7JjTJAB5iz2l93M=;
	b=cA7EwE5OdFiTLj2JF3mjF4lI6iI+z3lsffT4McmY3J3L3ZtEAJ3UrMQ8iv6sz+qdHsQ8qz
	30mp4oi3Pcxr1W2A4iM/+nUzrTY/KIaOOpbqkrkLywNuMpfZqgzBQpt38FoSyXtmly/gPF
	cB4ISfdUG4W9MIusrvPBxFyUN396AVk=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-402-HIRBlGPMPuiHL8FxU3-dCA-1; Fri, 18 Feb 2022 15:08:15 -0500
X-MC-Unique: HIRBlGPMPuiHL8FxU3-dCA-1
Received: by mail-qk1-f198.google.com with SMTP id c19-20020a05620a0cf300b005f17891c015so8330698qkj.18
        for <llvm@lists.linux.dev>; Fri, 18 Feb 2022 12:08:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qbD0qiU4RjhqV726jofvBeaOVqKh7JjTJAB5iz2l93M=;
        b=YpgCY3E9GZHCFCLRV5MSuC8ExY8mgzKLQh9bFpkUc0yuHvfTmq1TxpaQH45U+gPR8D
         nWxI+MWz2dvnu72H7yPXEbNUTjaSIH7Kf/v9ul0L/RUHH/yTYd0z89CHUBywVEi7WwYY
         LrBvoAx15Et1Rt1EbpIRyIo3e+q50BbQ4qXcLXOkCSDpst7SRqsLn+uhh7VklH3Dpw7D
         NIKxQlVhLafAgNiPZ9xTeD5oE+m6AKsPZLf+BP4rbAp5a3O85qrKHXQKGY70zVxWuu3q
         eqBxqeT08CNaiZhPx4CWijpgBhRHWw7IP2DltIFBp+ajOESoC3bWDZ+0Waa0HQlFy/e1
         bN6Q==
X-Gm-Message-State: AOAM533NzySdvEvFh/OP6hH40arC8Eyj1KUY3EKaYsIuXwVRr8e7fniT
	L6eD4CjM++GneSGkudQA9LCI/ILZUHYF2g8R356qLnzivB7H/NUWLwLr8M1sSHVZLN62MQqbyjX
	PIPTZwAuhjmH5Rg==
X-Received: by 2002:a05:6214:17c2:b0:42c:b915:69f with SMTP id cu2-20020a05621417c200b0042cb915069fmr7009990qvb.95.1645214894991;
        Fri, 18 Feb 2022 12:08:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyES3jxSXm6PUQSrWkCWkJOx1aXkyiFLiwQrMEdx8mKix/Dv/YjSGuwkSGrstdFEaba1AKRqg==
X-Received: by 2002:a05:6214:17c2:b0:42c:b915:69f with SMTP id cu2-20020a05621417c200b0042cb915069fmr7009947qvb.95.1645214894772;
        Fri, 18 Feb 2022 12:08:14 -0800 (PST)
Received: from treble ([2600:1700:6e32:6c00::35])
        by smtp.gmail.com with ESMTPSA id e64sm6288522qkd.122.2022.02.18.12.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 12:08:14 -0800 (PST)
Date: Fri, 18 Feb 2022 12:08:08 -0800
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: Alexander Lobakin <alexandr.lobakin@intel.com>
Cc: Miroslav Benes <mbenes@suse.cz>,
	=?utf-8?B?RsSBbmctcnXDrCBTw7JuZw==?= <maskray@google.com>,
	linux-hardening@vger.kernel.org, x86@kernel.org,
	Borislav Petkov <bp@alien8.de>,
	Jesse Brandeburg <jesse.brandeburg@intel.com>,
	Kristen Carlson Accardi <kristen@linux.intel.com>,
	Kees Cook <keescook@chromium.org>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Ard Biesheuvel <ardb@kernel.org>, Tony Luck <tony.luck@intel.com>,
	Bruce Schlobohm <bruce.schlobohm@intel.com>,
	Jessica Yu <jeyu@kernel.org>, kernel test robot <lkp@intel.com>,
	Evgenii Shatokhin <eshatokhin@virtuozzo.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Michal Marek <michal.lkml@markovi.net>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Christoph Hellwig <hch@lst.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Marios Pomonis <pomonis@google.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	"H.J. Lu" <hjl.tools@gmail.com>, Nicolas Pitre <nico@fluxnic.net>,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-arch@vger.kernel.org, live-patching@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v10 02/15] livepatch: avoid position-based search if `-z
 unique-symbol` is available
Message-ID: <20220218200808.juxnoidtxa7fjsk7@treble>
References: <20220209185752.1226407-1-alexandr.lobakin@intel.com>
 <20220209185752.1226407-3-alexandr.lobakin@intel.com>
 <20220211174130.xxgjoqr2vidotvyw@treble>
 <CAFP8O3KvZOZJqOR8HYp9xZGgnYf3D8q5kNijZKORs06L-Vit1g@mail.gmail.com>
 <20220211183529.q7qi2qmlyuscxyto@treble>
 <alpine.LSU.2.21.2202161606430.1475@pobox.suse.cz>
 <20220218163111.98564-1-alexandr.lobakin@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20220218163111.98564-1-alexandr.lobakin@intel.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jpoimboe@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Feb 18, 2022 at 05:31:11PM +0100, Alexander Lobakin wrote:
> it took 2 minutes to generate the whole map (instead of a split
> second) (on 64-core CPU, but I guess nm runs in one thread).
> I guess it can be optimized? I'm no a binutils master (will take a
> look after sending this), is there a way to do it manually skipping
> this nm lag or maybe make nm emit filenames without such delays?

Hm, yeah, adding 2 minutes to the link time isn't going to fly ;-)  It
probably takes a while to parse all the DWARF.

Based on ther other discussions I think just using the basename (main.o)
in STT_FILE would be good enough.  Some duplicates are probably ok.

-- 
Josh

