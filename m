Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B7533D3
	for <llvm@lists.linux.dev>; Fri, 15 Apr 2022 18:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1650046897;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h0ngEfIBK9b9gVkrEjy9Db4O7tXSpolu4PDcpaD8xqI=;
	b=OIlwyI8FGIjNzPM13Pxz4THo8TzrZG8K8pVNQOw2TnzoKugI5NXs3Sc8q+TlXEL4jLEE0C
	N6kbSqueWraNwO26CycBMSzkMmiL3M2UiK9f5J44TtbMYM2yN5e8cUbDBE9sMrAFWxNkdQ
	ZN9U2UvMX9UxSWstdbATkAnFv+NS+3Y=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-121-wdw6-C5cN_uNhEmTT9pPcg-1; Fri, 15 Apr 2022 14:21:34 -0400
X-MC-Unique: wdw6-C5cN_uNhEmTT9pPcg-1
Received: by mail-qt1-f199.google.com with SMTP id z3-20020ac86b83000000b002ed0f18c23cso5646980qts.17
        for <llvm@lists.linux.dev>; Fri, 15 Apr 2022 11:21:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=h0ngEfIBK9b9gVkrEjy9Db4O7tXSpolu4PDcpaD8xqI=;
        b=giGc68adxc4NPRVVYZwCe1Lnx79a8qrb/ThxqjPugXkqbM5nVHuBj2ddpC4nsBkML2
         YwWn+MKIsyP3gNrSk32RdL4EsjfC9TExysgpuicOTe8EM6ZumInGuCcgM5d4Jqyzll55
         NvxyBYnP7Q9UXugXEcn4rYAhFuaXZpM95rMbu5zb8lx0Rf6yawWXqPuGEGLy2auwvM2/
         v89Z6mM6XjmGSmYY0z2lhAPUdtB9uMb0mKgdXmYpPSgBjLaKOEX6calOnt7jbnjl/bdc
         /Yk6H6hhDhC5i+zS27Qf1jPwEcfLDW4Y1/4yPqkbvuFj/8AOkLDUBDi9N0cppTZFgqZ1
         wwvg==
X-Gm-Message-State: AOAM531ehgbgoU7/J82LHp6NFvamC5fF+26TAzpIVfGuzOV9BWXPof93
	Np+UnjUpxA8aPahmrSPwWXa8hKG6C7/ulPEdHlxD4B8/7lHOjSCSwAqFSErY/RLHd91/60b27oM
	gw/FrUfkS8qeJWA==
X-Received: by 2002:ad4:4bb1:0:b0:444:45a2:ea3b with SMTP id i17-20020ad44bb1000000b0044445a2ea3bmr66906qvw.121.1650046894289;
        Fri, 15 Apr 2022 11:21:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwU6ga5i5ZWypxAOrBQGUs2XOw5P8jFF5anexW1k9DZIz2cWQMjMemznII10jPXKoGCfBF4ew==
X-Received: by 2002:ad4:4bb1:0:b0:444:45a2:ea3b with SMTP id i17-20020ad44bb1000000b0044445a2ea3bmr66895qvw.121.1650046894046;
        Fri, 15 Apr 2022 11:21:34 -0700 (PDT)
Received: from treble ([2600:1700:6e32:6c00::45])
        by smtp.gmail.com with ESMTPSA id u11-20020a05622a14cb00b002e1fd9dce3dsm3097590qtx.60.2022.04.15.11.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Apr 2022 11:21:33 -0700 (PDT)
Date: Fri, 15 Apr 2022 11:21:30 -0700
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
	hjl.tools@gmail.com, mbenes@suse.cz, rostedt@goodmis.org,
	linux-toolchains@vger.kernel.org,
	clang-built-linux <llvm@lists.linux.dev>
Subject: Re: The trouble with __weak and objtool got worse
Message-ID: <20220415182130.iltk2uxnubeaa4nk@treble>
References: <YllUqPK4CWZeHku8@hirez.programming.kicks-ass.net>
 <20220415152633.GA2731@worktop.programming.kicks-ass.net>
 <CAKwvOdn1JVxxithobr=15hkumoQ51CjnPSbrq8hYBRm=A3L5kQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAKwvOdn1JVxxithobr=15hkumoQ51CjnPSbrq8hYBRm=A3L5kQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jpoimboe@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Apr 15, 2022 at 10:40:22AM -0700, Nick Desaulniers wrote:
> On Fri, Apr 15, 2022 at 8:26 AM Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > On Fri, Apr 15, 2022 at 01:19:04PM +0200, Peter Zijlstra wrote:
> > > Alternatively:
> > >
> > >   https://sourceware.org/pipermail/binutils/2020-December/114671.html
> > >
> > > seems to suggest: -Wa,--generate-unused-section-symbols=yes, ought to
> > > work, except I'm getting:
> > >
> > > $ gcc -O2 -fcf-protection=none -fno-asynchronous-unwind-tables -Wa,--generate-unused-section-symbols=yes -c foo*.c
> > > as: unrecognized option '--generate-unused-section-symbols=yes'
> > > as: unrecognized option '--generate-unused-section-symbols=yes'
> >
> > Reading so hard...
> >
> >  $ gcc -O2 -fcf-protection=none -fno-asynchronous-unwind-tables -Wa,-generate-unused-section-symbols=yes -c foo*.c
> >
> > seems to actually work.
> 
> $ clang hello.c -Wa,-generate-unused-section-symbols=yes
> clang-15: error: unsupported argument
> '-generate-unused-section-symbols=yes' to option '-Wa,'
> 
> :)
> 
> I recall LLVM not emitting STT_SECTION symbols being problematic for
> objtool in the past.
> Old pre-lore archive:
> https://groups.google.com/g/clang-built-linux/c/1C6YoJKBsQQ/m/a8IS1NjGAgAJ
> via https://github.com/ClangBuiltLinux/linux/issues/1209.
> (It doesn't look too bad for me to implement)

Right, and that objtool "fix" -- silently falling back to
non-section-symbol relocations instead of erroring out -- is causing
this issue, when it's done for weak symbols.

If LLVM assembler doesn't support this option then we may have to go
with something like this?  I can't seem to recreate so I'm not able to
test.

We'd also need some objtool checks to make sure the non-section-symbol
fallback isn't being done for a weak symbol.  Or just remove the
fallback altogether and force section symbols whereever they're needed,
similar to the below (untested).


diff --git a/include/linux/static_call_types.h b/include/linux/static_call_types.h
index 5a00b8b2cf9f..77040ce575fa 100644
--- a/include/linux/static_call_types.h
+++ b/include/linux/static_call_types.h
@@ -52,9 +52,14 @@ struct static_call_site {
 #define __STATIC_CALL_ADDRESSABLE(name) \
 	__ADDRESSABLE(STATIC_CALL_KEY(name))
 
+extern unsigned long __addressable_ip;
+
+#define __STATIC_CALL_SITE_ADDRESSABLE() __addressable_ip = _THIS_IP_;
+
 #define __static_call(name)						\
 ({									\
 	__STATIC_CALL_ADDRESSABLE(name);				\
+	__STATIC_CALL_SITE_ADDRESSABLE();				\
 	__raw_static_call(name);					\
 })
 
diff --git a/kernel/static_call_inline.c b/kernel/static_call_inline.c
index dc5665b62814..f6e3e0463efb 100644
--- a/kernel/static_call_inline.c
+++ b/kernel/static_call_inline.c
@@ -17,6 +17,8 @@ extern struct static_call_tramp_key __start_static_call_tramp_key[],
 
 static bool static_call_initialized;
 
+unsigned long __section(".discard.addressable") __addressable_ip;
+
 /* mutex to protect key modules/sites */
 static DEFINE_MUTEX(static_call_mutex);
 

