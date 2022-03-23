Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E03DECD
	for <llvm@lists.linux.dev>; Wed, 23 Mar 2022 03:21:30 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id c4so245669qtx.1
        for <llvm@lists.linux.dev>; Tue, 22 Mar 2022 20:21:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=TjGXNoNPeHTVLppn4GBStrAFhNsfJnPfAeYAzRe+rIQ=;
        b=OfTBT36/JWxiCM5Q2GzR4OHl4SwKW1nITc/itLBuw0ykTMLAdZb5PxWQpyHonK96xp
         kvW+M0FgFN6JiEwqptS86ib2RshLs9+qtT3EkkFCD0RVxfIz+9PLryi1QpsHwryvQUI9
         6gfiQhE2qnJqVp78k20ShH7RaljUGX9PFX80q7h4VYd7dBotLmUDvSd7JbIa5sCZo3GW
         BFzMGKWe4xe9RtbJqwGrFJjH7LEjblky4zcC9Nx05ELB54ifYTxgH+qI2cyhTeYHSMQw
         aK6G2PNRX0W4iI7oaSSnM2SfArGcuq6H0GrGW5H8wAGxxtQOx6gRfaEqNlAa4Bq43jZ5
         2f5g==
X-Gm-Message-State: AOAM533Gpt2iYvTG54efD6HKiQT39Ko8Evvzcy+qPCg+qhzrMorJh5z1
	2ZL/F0JgYX2YdTAgmhpWN1E=
X-Google-Smtp-Source: ABdhPJwREaT8EIhjKSo80EaUzacQXlNrDBxDy3kVCH1nAdH1G2E1btewQjiiC+IPt9n0ZPA8epCYSQ==
X-Received: by 2002:a05:622a:13d0:b0:2e1:cb3e:bb8a with SMTP id p16-20020a05622a13d000b002e1cb3ebb8amr23033116qtk.16.1648005689792;
        Tue, 22 Mar 2022 20:21:29 -0700 (PDT)
Received: from user-VirtualBox (c-73-132-53-127.hsd1.va.comcast.net. [73.132.53.127])
        by smtp.gmail.com with ESMTPSA id a23-20020a05620a16d700b0067e98304705sm3725607qkn.89.2022.03.22.20.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Mar 2022 20:21:29 -0700 (PDT)
Date: Tue, 22 Mar 2022 23:21:27 -0400
From: David Vernet <void@manifault.com>
To: Tom Rix <trix@redhat.com>
Cc: Joe Lawrence <joe.lawrence@redhat.com>, jpoimboe@redhat.com,
	jikos@kernel.org, mbenes@suse.cz, pmladek@suse.com,
	nathan@kernel.org, ndesaulniers@google.com,
	live-patching@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v2] livepatch: Reorder to use before freeing a pointer
Message-ID: <20220323032127.3frjsh4iiclv4cys@user-VirtualBox>
References: <20220320015143.2208591-1-trix@redhat.com>
 <3ee9826e-b770-d015-0251-e9770172d973@redhat.com>
 <b4b347ea-5b12-223a-86f5-c13aee714f08@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b4b347ea-5b12-223a-86f5-c13aee714f08@redhat.com>
User-Agent: NeoMutt/20191207

> > On 3/19/22 9:51 PM, trix@redhat.com wrote:
> > > From: Tom Rix <trix@redhat.com>
> > > 
> > > Clang static analysis reports this issue
> > > livepatch-shadow-fix1.c:113:2: warning: Use of
> > >    memory after it is freed
> > >    pr_info("%s: dummy @ %p, prevented leak @ %p\n",
> > >    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > 
> > > The pointer is freed in the previous statement.
> > > Reorder the pr_info to report before the free.
> > > 
> > > Similar issue in livepatch-shadow-fix2.c
> > > 
> > > Signed-off-by: Tom Rix <trix@redhat.com>
> > > ---
> > > v2: Fix similar issue in livepatch-shadow-fix2.c
> > > 
> > >   samples/livepatch/livepatch-shadow-fix1.c | 2 +-
> > >   samples/livepatch/livepatch-shadow-fix2.c | 2 +-
> > >   2 files changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/samples/livepatch/livepatch-shadow-fix1.c b/samples/livepatch/livepatch-shadow-fix1.c
> > > index 918ce17b43fda..6701641bf12d4 100644
> > > --- a/samples/livepatch/livepatch-shadow-fix1.c
> > > +++ b/samples/livepatch/livepatch-shadow-fix1.c
> > > @@ -109,9 +109,9 @@ static void livepatch_fix1_dummy_leak_dtor(void *obj, void *shadow_data)
> > >   	void *d = obj;
> > >   	int **shadow_leak = shadow_data;
> > > -	kfree(*shadow_leak);
> > >   	pr_info("%s: dummy @ %p, prevented leak @ %p\n",
> > >   			 __func__, d, *shadow_leak);
> > > +	kfree(*shadow_leak);
> > >   }
> > >   static void livepatch_fix1_dummy_free(struct dummy *d)
> > > diff --git a/samples/livepatch/livepatch-shadow-fix2.c b/samples/livepatch/livepatch-shadow-fix2.c
> > > index 29fe5cd420472..361046a4f10cf 100644
> > > --- a/samples/livepatch/livepatch-shadow-fix2.c
> > > +++ b/samples/livepatch/livepatch-shadow-fix2.c
> > > @@ -61,9 +61,9 @@ static void livepatch_fix2_dummy_leak_dtor(void *obj, void *shadow_data)
> > >   	void *d = obj;
> > >   	int **shadow_leak = shadow_data;
> > > -	kfree(*shadow_leak);
> > >   	pr_info("%s: dummy @ %p, prevented leak @ %p\n",
> > >   			 __func__, d, *shadow_leak);
> > > +	kfree(*shadow_leak);
> > >   }
> > >   static void livepatch_fix2_dummy_free(struct dummy *d)

Acked-by: David Vernet <void@manifault.com>
