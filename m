Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66415394
	for <llvm@lists.linux.dev>; Sat,  8 Oct 2022 19:05:53 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id v10-20020a17090a634a00b00205e48cf845so9899395pjs.4
        for <llvm@lists.linux.dev>; Sat, 08 Oct 2022 12:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GKva1pFsfuqgoIJb+srIILrjXqoJtPS42tfHzEkNmrc=;
        b=CekR7HaUaBPxfQ7jIF3CdVMYLrp3EIW/Nv4aOnq6ugjdifExc4l1670DEpXlb7J1el
         oTum84aSYvNN3vIOC+8qPw8+axphBiFvfIX4G8Wnwci1VPuVg+K6YN/tBUPzybMIKnhk
         z+p3AilNoTy9XqurCjJBK/3g5vTiI0NOEMjoE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GKva1pFsfuqgoIJb+srIILrjXqoJtPS42tfHzEkNmrc=;
        b=OPArVsrAnMtZdzMw/eBAieFHXEUDq5IA8o32TQYFrpKhdT5V55CYfy4zLrEzjZ8WBm
         lnhkXLzSVyRFPMaZo5AxE/5eJ3wKqgMBjsEKnKcNCXx/LWTfdbF5r6LBg4KxmC8LhrJO
         WbuTIOCRGZKJfhfEKr1r7tfVpiYRHyP3XPF4t/1pz3PgGKl2HFYChkzeKXCkfSSPx93x
         8bCM640lS/ACGTURRNPKyJM/EB9UKO9zs0MkEPx7je2esJvOk0yfKFW7OYRp+8jItFnr
         bRbm24PP7YSSlJUEU0kk0sSE8qSGHkrfYH5BUtriFmXSEM70YR0A8fyzdBIq51JOVX39
         L4vA==
X-Gm-Message-State: ACrzQf05JQC42h+0gnapNIf6NihRtwTQ0qsJycliV9I970LP1a45Y2zG
	3eQikQ8GjKRxvih+ugKydEsLVQ==
X-Google-Smtp-Source: AMsMyM4UBsuJabmxb5/cuTD/P98spHaqugs9ZabVRImOU1a77F2+tRJxGpP88jsl5skt4oeD745W3A==
X-Received: by 2002:a17:902:ec89:b0:178:3ea4:2960 with SMTP id x9-20020a170902ec8900b001783ea42960mr11228973plg.160.1665255953317;
        Sat, 08 Oct 2022 12:05:53 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id b19-20020a170902d41300b001754cfb5e21sm3651784ple.96.2022.10.08.12.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Oct 2022 12:05:52 -0700 (PDT)
Date: Sat, 8 Oct 2022 12:05:49 -0700
From: Kees Cook <keescook@chromium.org>
To: Chuck Lever III <chuck.lever@oracle.com>
Cc: Jeff Layton <jlayton@kernel.org>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Linux NFS Mailing List <linux-nfs@vger.kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	"linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>
Subject: Re: [PATCH] NFSD: Avoid clashing function prototypes
Message-ID: <202210081204.BE88541@keescook>
References: <20221007235406.2951724-1-keescook@chromium.org>
 <7AC81CF2-2D64-452D-83FC-33E5BEA82209@oracle.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7AC81CF2-2D64-452D-83FC-33E5BEA82209@oracle.com>

On Sat, Oct 08, 2022 at 03:49:45PM +0000, Chuck Lever III wrote:
> > On Oct 7, 2022, at 7:54 PM, Kees Cook <keescook@chromium.org> wrote:
> > 
> > When built with Control Flow Integrity, function prototypes between
> > caller and function declaration must match. These mismatches are visible
> > at compile time with the new -Wcast-function-type-strict in Clang[1].
> > 
> > There were 97 warnings produced by NFS. For example:
> > 
> > fs/nfsd/nfs4xdr.c:2228:17: warning: cast from '__be32 (*)(struct nfsd4_compoundargs *, struct nfsd4_access *)' (aka 'unsigned int (*)(struct nfsd4_compoundargs *, struct nfsd4_access *)') to 'nfsd4_dec' (aka 'unsigned int (*)(struct nfsd4_compoundargs *, void *)') converts to incompatible function type [-Wcast-function-type-strict]
> >        [OP_ACCESS]             = (nfsd4_dec)nfsd4_decode_access,
> >                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > 
> > The enc/dec callbacks were defined as passing "void *" as the second
> > argument, but were being implicitly cast to a new type. Replace the
> > argument with a variable the desired to perform the casting in the
> > function body. There are no resulting binary differences.
> 
> Hi Kees, thanks for the patch. I agree this internal API could be
> cleaner and more type-safe. A few things I noticed:
> 
> - Your patch does not apply to HEAD probably because it conflicts with
> 3fdc54646234 ("NFSD: Reduce amount of struct nfsd4_compoundargs that
> needs clearing")

Ah! Thanks, I will refresh.

> - A union type might be a better fit for this application, as that
> would avoid casting through an anonymous pointer. NFSD has a union
> type, union nfsd4_op_u, that is ideal for this.

Perfect, yes. There are similar conversions that used similar.

> Would it make sense to use "union nfsd4_op_u *", such as is done in
> fs/nfsd/current_stateid.h, in the definition of nfsd4_dec and nfsd4_enc ?

Yup; I think that'll be perfect.

> With regard to timing, I would prefer to queue this change for the
> v6.2 merge window through the nfsd tree, if that's OK with you?

Yeah, for sure. No rush. :)

-- 
Kees Cook
