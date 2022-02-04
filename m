Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FBE22F21
	for <llvm@lists.linux.dev>; Fri,  4 Feb 2022 00:26:14 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id d1so3680679plh.10
        for <llvm@lists.linux.dev>; Thu, 03 Feb 2022 16:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0eVjWkn3YypKipWU59VgB8hKpGPPC7yMLBku/5hkxYU=;
        b=B/63qRKoTa/jPTvT35HS/ppnB6hN1ge8X/OnvCRnPNLr09AMTKLpwTtWlV/p1K0wTj
         TNBYyZzDepc42Ky0lTjLbfsDa9eo1lJjo2OaJ230lmRphEb1jb+LaY9zv2FOqH1xu+Ho
         bC4DYlB3dtVmyzGf1J8nTPkRpbDJEbgxaFqaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0eVjWkn3YypKipWU59VgB8hKpGPPC7yMLBku/5hkxYU=;
        b=YjJF3pEt1kFfwU6EQmFMbS8epfWSusVIwVp/TveMQs0leiIfr61hhP3BwMK/+C3Ebk
         dNW/iIDNAq7gG6TkKJrqTzlBwjgZGBbS3UJITxUtMBF0wc+lRXRlDIDCcfGy0uucSnVY
         04zW044hG8v85Mo4g3AMnnguxlDWuna/tmPGAaA85aLkO6qu2sFW/6qoVjnEv8FWFJZz
         XQPc3DZqjfPUeZfwsOtXUfhfRMUKYm03AFA81lZ1DWaMjMWmDjQ0jBV05dkmhAo/90LT
         TbELgF8zzKR4UGmTCL1qoLO5facz4dAxN54dNR1VIByTrDEcIfCC1u4dAJSDaRDttSH1
         7bjg==
X-Gm-Message-State: AOAM532NVF2l6BD16N6is67EUIz9ibCW9+6hvNPU3fFlYKElt5g1apqk
	rkBlfAAo6W6laHeZX5VMGWinZA==
X-Google-Smtp-Source: ABdhPJzePD01mIAj1XkpKw+GItPRqZPyAv9KEL3Ul555b3PT0ZywjsUHGOJxLNDywApQ4JvY2r3ybg==
X-Received: by 2002:a17:90b:146:: with SMTP id em6mr280597pjb.214.1643934373835;
        Thu, 03 Feb 2022 16:26:13 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id me4sm11588041pjb.26.2022.02.03.16.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 16:26:13 -0800 (PST)
Date: Thu, 3 Feb 2022 16:26:12 -0800
From: Kees Cook <keescook@chromium.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
	llvm@lists.linux.dev, George Burgess IV <gbiv@google.com>,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v6 2/4] Compiler Attributes: Add __overloadable for Clang
Message-ID: <202202031618.BC9EDA9D82@keescook>
References: <20220203173307.1033257-1-keescook@chromium.org>
 <20220203173307.1033257-3-keescook@chromium.org>
 <CAKwvOdkU=5q-7Sb4BKYkRsigy_qYjo_7J+A73ZYKn+xArxUwXg@mail.gmail.com>
 <202202031301.437D8FD3@keescook>
 <CAKwvOdm-_uGYrm=2LTGSR7yhGK08NniGdkhLj_sM-QD-xdKVtA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdm-_uGYrm=2LTGSR7yhGK08NniGdkhLj_sM-QD-xdKVtA@mail.gmail.com>

On Thu, Feb 03, 2022 at 02:11:48PM -0800, Nick Desaulniers wrote:
> On Thu, Feb 3, 2022 at 1:04 PM Kees Cook <keescook@chromium.org> wrote:
> >
> > On Thu, Feb 03, 2022 at 12:26:15PM -0800, Nick Desaulniers wrote:
> > > On Thu, Feb 3, 2022 at 9:33 AM Kees Cook <keescook@chromium.org> wrote:
> > > >
> > > > must be marked as being overloadable (i.e. different prototypes).
> > > > This allows the __pass_object_size versions to take precedence.
> > >
> > > Is this because of the `const` additions to the function signatures?
> >
> > That might be an issue, but the *real* issue is the implicit mutation of
> > the function into an inline with _additional_ arguments. i.e.
> >
> > char *strcpy(char * POS p, const char * POS q)
> >
> > is really
> >
> > char *strcpy(char * const p, const char * const q, size_t __size_of_p, size_t __size_of_q)
> >
> > (i.e. what I was doing with macros, but all internally and still an
> > extern inline)
> 
> What do you mean "is really"? 4/4 doesn't change the number of
> parameters in strcpy explicitly in the definition AFAICT.

It really does change the number of parameters. See the IR difference:

$ cat example.c
#ifdef USE_POS
# define POS __attribute__((pass_object_size(1)))
#else
# define POS
#endif

int func(void * const POS);

struct foo
{
        int a;
        char *b;
};

void usage(struct foo *example)
{
        func(example);
}

$ IR="-O2 -Xclang -disable-llvm-passes -emit-llvm -S"
$ clang           example.c $IR -o normal.ll
$ clang -DUSE_POS example.c $IR -o pos.ll
$ diff -u normal.ll pos.ll
--- normal.ll   2022-02-03 16:23:39.734065036 -0800
+++ pos.ll      2022-02-03 16:23:49.518083451 -0800
@@ -11,14 +11,19 @@
   store %struct.foo* %0, %struct.foo** %2, align 8, !tbaa !3
   %3 = load %struct.foo*, %struct.foo** %2, align 8, !tbaa !3
   %4 = bitcast %struct.foo* %3 to i8*
-  %5 = call i32 @func(i8* noundef %4)
+  %5 = call i64 @llvm.objectsize.i64.p0i8(i8* %4, i1 false, i1 true, i1 false)
+  %6 = call i32 @func(i8* noundef %4, i64 noundef %5)
   ret void
 }
...

This is basically doing internally exactly what I was doing in v4 and
earlier with macros (passing in the caller's view of __bos(arg, 1)).

-- 
Kees Cook
